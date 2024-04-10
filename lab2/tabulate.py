from collections.abc import Sequence, Mapping
from itertools import chain
from typing import Any


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
