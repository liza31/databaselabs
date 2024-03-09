from collections.abc import Callable, Sequence, Mapping
from typing import Any

import time
import concurrent.futures

import psycopg2
import psycopg2.extras
import psycopg2.sql as sql
import psycopg2.extensions

from functools import partial
from itertools import chain
from contextlib import contextmanager, AbstractContextManager
from inspect import cleandoc


# PostgreSQL connection config

DB_HOST = 'localhost'   # PostgreSQL Database server host name
DB_PORT = '5432'        # PostgreSQL Database server port number

DB_NAME = None          # PostgreSQL Database name

DB_USER = None          # PostgreSQL Database user name
DB_PASS = None          # PostgreSQL Database user password


# Counter config

COUNTER_TABLE = 'user_counter'      # Counter table name
COUNTER_USER_ID = 1                 # Test counter row primary key

COUNTER_N_THREADS = 10              # Number of counter increment threads
COUNTER_N_INCREMENT = 10000         # Number of counter increment operations per thread


# Auxiliary function definitions

@contextmanager
def new_connection(*args, **kwargs):
    """
    Creates and manages new instance of :class:`psycopg2.extensions.connection` as a context manager.

      Call function, passing same arguments as for the :func:`psycopg2.connect()`
      and handle the output using the `with` statement - so you will get a new instance
      of :class:`psycopg2.extensions.connection`, which will be properly disposed
      after exiting the `with` context.
    """

    # Open database connection
    conn: psycopg2.extensions.connection = psycopg2.connect(*args, **kwargs)

    # Yield created connection object to the wrapped code
    try:
        yield conn

    # Properly close the database connection
    finally:
        conn.close()


def tabulate(
        rows: Sequence[Mapping],
        col_keys: Sequence = None,
        head_row: bool = True,
        col_heads: Mapping[Any, str] = None) -> str:
    """
    Tabulates table, represented by :class:`Sequence` of rows
    represented by columnKey-cellValue :class:`Mapping` objects.

    :param rows: :class:`Sequence` of table rows represented by columnKey-cellValue :class:`Mapping` objects
    :param col_keys: keys of columns to display
    :param head_row: whether to display headings row
    :param col_heads: columnKey-columnHeading :class:`Mapping`

    :return: tabulated table :class:`str`
    """

    # Handle input parameters
    col_keys = col_keys or next(iter(rows)).keys()
    col_heads = (col_heads or {col_key: str(col_key) for col_key in col_keys}) if head_row else None

    # Build columns widths map
    col_widths = {
        col_key: max(
            max(len(str(row[col_key])) for row in rows),
            len(col_heads[col_key]) if head_row else 0
        ) + 1
        for col_key in col_keys
    }

    # Build rows strings iterator
    rows_str = (
        '│' + '│'.join(str(row[col_key]).ljust(col_widths[col_key]) for col_key in col_keys) + '│'
        for row in (chain((col_heads,), rows) if head_row else rows)
    )

    # Build table string
    table_str = '\n'.join(
        chain([next(rows_str), '├' + '┼'.join('─' * col_widths[col_key] for col_key in col_keys) + '┤'], rows_str)
        if head_row else rows_str
    )

    return table_str


# Counter implementations 1-4 according to the task

# -- Implementation 1: name, info & work function

COUNTER_IMP1_NAME = "Implementation #1"
COUNTER_IMP1_INFO = "Lost-update"


def counter_imp1(conn_manager: Callable[[], AbstractContextManager[psycopg2.extensions.connection]],
                 user_id: int,
                 table: str | sql.Composable,
                 iters: int,
                 step: int = 1):
    """
    Implements counter thread logic according to the implementation #1
    specifications from the laboratory task.

    :param conn_manager: connection manager callable with the signature of
                        `() -> AbstractContextManager[psycopg2.extensions.connection]`,
                        allows to obtain a connection object and then properly dispose it
    :param user_id: counter row primary key
    :param table: counter table :class:`str` name or :class:`sql.Composable` object
    :param iters: number of counter iterations
    :param step: counter step per iteration
    """

    # Handle inputs & prepare queries

    table_identifier = table if isinstance(table, sql.Composable) else sql.Identifier(table)

    select_query = sql.SQL(cleandoc(
        """
        SELECT counter FROM {counter_table} WHERE user_id = %(user_id)s
        """
    )).format(counter_table=table_identifier)

    update_query = sql.SQL(cleandoc(
        """
        UPDATE {counter_table} SET counter = %(counter)s WHERE user_id=%(user_id)s
        """
    )).format(counter_table=table_identifier)

    # Connect to the database and run counting loop

    with conn_manager() as conn:

        for _ in range(iters):

            with conn:

                cur: psycopg2.extensions.cursor

                with conn.cursor() as cur:

                    cur.execute(select_query, dict(user_id=user_id))
                    counter = cur.fetchone()[0]
                    cur.execute(update_query, dict(user_id=user_id, counter=counter + step))


# -- Implementation 2: name, info & work function

COUNTER_IMP2_NAME = "Implementation #2"
COUNTER_IMP2_INFO = "In-place update"


def counter_imp2(conn_manager: Callable[[], AbstractContextManager[psycopg2.extensions.connection]],
                 user_id: int,
                 table: str | sql.Composable,
                 iters: int,
                 step: int = 1):
    """
    Implements counter thread logic according to the implementation #2
    specifications from the laboratory task.

    :param conn_manager: connection manager callable with the signature of
                        `() -> AbstractContextManager[psycopg2.extensions.connection]`,
                        allows to obtain a connection object and then properly dispose it
    :param user_id: counter row primary key
    :param table: counter table :class:`str` name or :class:`sql.Composable` object
    :param iters: number of counter iterations
    :param step: counter step per iteration
    """

    # Handle inputs & prepare queries

    table_identifier = table if isinstance(table, sql.Composable) else sql.Identifier(table)

    update_query = sql.SQL(cleandoc(
        """
        UPDATE {counter_table} SET counter = counter + {step} WHERE user_id=%(user_id)s
        """
    )).format(counter_table=table_identifier, step=sql.Literal(step))

    # Connect to the database and run counting loop

    with conn_manager() as conn:

        for _ in range(iters):

            with conn:

                cur: psycopg2.extensions.cursor

                with conn.cursor() as cur:

                    cur.execute(update_query, dict(user_id=user_id))


# -- Implementation 3: name, info & work function

COUNTER_IMP3_NAME = "Implementation #3"
COUNTER_IMP3_INFO = "Row-level locking"


def counter_imp3(conn_manager: Callable[[], AbstractContextManager[psycopg2.extensions.connection]],
                 user_id: int,
                 table: str | sql.Composable,
                 iters: int,
                 step: int = 1):
    """
    Implements counter thread logic according to the implementation #3
    specifications from the laboratory task.

    :param conn_manager: connection manager callable with the signature of
                        `() -> AbstractContextManager[psycopg2.extensions.connection]`,
                        allows to obtain a connection object and then properly dispose it
    :param user_id: counter row primary key
    :param table: counter table :class:`str` name or :class:`sql.Composable` object
    :param iters: number of counter iterations
    :param step: counter step per iteration
    """

    # Handle inputs & prepare queries

    table_identifier = table if isinstance(table, sql.Composable) else sql.Identifier(table)

    select_query = sql.SQL(cleandoc(
        """
        SELECT counter FROM {counter_table} WHERE user_id = %(user_id)s FOR UPDATE
        """
    )).format(counter_table=table_identifier)

    update_query = sql.SQL(cleandoc(
        """
        UPDATE {counter_table} SET counter = %(counter)s WHERE user_id=%(user_id)s
        """
    )).format(counter_table=table_identifier)

    # Connect to the database and run counting loop

    with conn_manager() as conn:

        for _ in range(iters):

            with conn:

                cur: psycopg2.extensions.cursor

                with conn.cursor() as cur:

                    cur.execute(select_query, dict(user_id=user_id))
                    counter = cur.fetchone()[0]
                    cur.execute(update_query, dict(user_id=user_id, counter=counter + step))


# -- Implementation 4: nam, info & work function

COUNTER_IMP4_NAME = "Implementation #4"
COUNTER_IMP4_INFO = "Optimistic concurrency control"


def counter_imp4(conn_manager: Callable[[], AbstractContextManager[psycopg2.extensions.connection]],
                 user_id: int,
                 table: str | sql.Composable,
                 iters: int,
                 step: int = 1):
    """
    Implements counter thread logic according to the implementation #1
    specifications from the laboratory task.

    :param conn_manager: connection manager callable with the signature of
                        `() -> AbstractContextManager[psycopg2.extensions.connection]`,
                        allows to obtain a connection object and then properly dispose it
    :param user_id: counter row primary key
    :param table: counter table :class:`str` name or :class:`sql.Composable` object
    :param iters: number of counter iterations
    :param step: counter step per iteration
    """

    # Handle inputs & prepare queries

    table_identifier = table if isinstance(table, sql.Composable) else sql.Identifier(table)

    select_query = sql.SQL(cleandoc(
        """
        SELECT counter, version FROM {counter_table} WHERE user_id = %(user_id)s
        """
    )).format(counter_table=table_identifier)

    update_query = sql.SQL(cleandoc(
        """
        UPDATE {counter_table} SET counter = %(counter)s, version = %(new_version)s
        WHERE user_id=%(user_id)s and version = %(version)s
        """
    )).format(counter_table=table_identifier)

    # Connect to the database and run counting loop

    with conn_manager() as conn:

        for _ in range(iters):

            while True:

                with conn:

                    cur: psycopg2.extensions.cursor

                    with conn.cursor() as cur:

                        cur.execute(select_query, dict(user_id=user_id))
                        (counter, version) = cur.fetchone()

                        cur.execute(update_query, dict(
                            user_id=user_id, counter=counter + step,
                            version=version, new_version=version + 1
                        ))
                        succeed = bool(cur.rowcount)

                if succeed:
                    break


# Script `main()` function & entry point and corresponding SQL queries

# -- Counter table recreate query

COUNTER_TABLE_RECREATE_SQL = sql.SQL(cleandoc(
    """
    DROP TABLE IF EXISTS {counter_table};

    CREATE TABLE {counter_table} 
    (
        user_id     INT     NOT NULL,

        counter     INT     DEFAULT 0,
        version     INT     DEFAULT 0,


        PRIMARY KEY (user_id)
    );

    INSERT INTO {counter_table} (user_id) VALUES (%(user_id)s);
    """
)).format(counter_table=sql.Identifier(COUNTER_TABLE))


# -- Counter table get count query

COUNTER_TABLE_GET_COUNT = sql.SQL(cleandoc(
    """
    SELECT counter FROM {counter_table} WHERE user_id = %(user_id)s;
    """
)).format(counter_table=sql.Identifier(COUNTER_TABLE))


def main(conn_manager: Callable[[], AbstractContextManager[psycopg2.extensions.connection]]):

    counter_imps = [
        (COUNTER_IMP1_NAME, COUNTER_IMP1_INFO, counter_imp1),
        (COUNTER_IMP2_NAME, COUNTER_IMP2_INFO, counter_imp2),
        (COUNTER_IMP3_NAME, COUNTER_IMP3_INFO, counter_imp3),
        (COUNTER_IMP4_NAME, COUNTER_IMP4_INFO, counter_imp4)
    ]

    # Prepare results list
    counter_imps_summary = list()

    # Establish database connection and run counter test for each implementation
    with conn_manager() as main_conn:

        for (counter_imp_name, counter_imp_info, counter_imp) in counter_imps:

            print(f"Testing {counter_imp_name}...", end='\t')

            # Recreate counter table before running test
            with main_conn:
                with main_conn.cursor() as main_cur:
                    main_cur.execute(COUNTER_TABLE_RECREATE_SQL, dict(user_id=COUNTER_USER_ID))

            # Run current counter in specified number of threads, measure elapsed time

            counter_imp_time = time.time()

            with concurrent.futures.ThreadPoolExecutor(max_workers=COUNTER_N_THREADS) as executor:
                # noinspection PyTypeChecker
                concurrent.futures.wait({
                    executor.submit(counter_imp,
                                    conn_manager=conn_manager,
                                    table=COUNTER_TABLE,
                                    user_id=COUNTER_USER_ID,
                                    iters=COUNTER_N_INCREMENT)
                    for _ in range(COUNTER_N_THREADS)
                })

            counter_imp_time = time.time() - counter_imp_time

            # Obtain the resulting count from the database
            with main_conn:
                with main_conn.cursor() as main_cur:
                    main_cur.execute(COUNTER_TABLE_GET_COUNT, dict(user_id=COUNTER_USER_ID))
                    counter_imp_count = main_cur.fetchone()[0]

            # Append current test results to the list
            counter_imps_summary.append({
                'Name': counter_imp_name,
                'Info': counter_imp_info,
                'Count': counter_imp_count,
                'Timing': counter_imp_time
            })

            print(f"done in {counter_imp_time:.2f} seconds, counter = {counter_imp_count}.")

    print(end='\n\n')

    # Display results
    print("Counter implementations testing summary", tabulate(counter_imps_summary), sep='\n\n', end='\n\n\n')


if __name__ == '__main__':

    # Create database connection manager
    # as the new_connection() with pre-filled credentials
    _conn_manager = partial(
        new_connection,
        host=DB_HOST,
        port=DB_PORT,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASS
    )

    # Execute script logic
    main(conn_manager=_conn_manager)
