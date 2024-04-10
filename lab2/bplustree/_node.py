from collections.abc import Iterable
from typing import Union, TypeVar, Generic
from abc import ABCMeta, abstractmethod


TKey = TypeVar('TKey')
TVal = TypeVar('TVal')


class Node(Generic[TKey, TVal], metaclass=ABCMeta):

    _order: int

    _keys: list[TKey]
    _vals: list[TVal | 'Node']

    def __init__(self, order: int, keys: list[TKey] = None, vals: list[TVal | 'Node'] = None):
        """

        """

        self._order = order

        self._keys = keys or []
        self._vals = vals or []

    @property
    def order(self) -> int:
        return self._order

    @property
    def keys(self) -> list[TKey]:
        return self._keys

    @property
    def vals(self) -> list[TVal | 'Node']:
        return self._vals

    def is_full(self) -> bool:
        """
        """

        return len(self._vals) == self._order

    def is_overflown(self) -> bool:
        """
        """

        return len(self._vals) > self._order

    def is_low(self) -> bool:
        """
        """

        return len(self._keys) == self.order // 2

    def is_empty(self) -> bool:
        """
        """

        return len(self.keys) == 0

    def is_underflown(self) -> bool:
        """
        """

        return len(self._keys) < self._order // 2

    @abstractmethod
    def split(self) -> 'Node':
        """
        """

    def merge(self, other: 'Node' = None, pivot: TKey = None):
        """
        """

        if pivot is not None:
            self.keys.append(pivot)

        self._keys += other._keys
        self._vals += other._vals

    @abstractmethod
    def select(self, key: TKey) -> TVal:
        """
        """

    @abstractmethod
    def between(self, start_key: TKey | None, end_key: TKey | None) -> Iterable[tuple[TKey, TVal]]:
        """
        """

    @abstractmethod
    def insert(self, key: TKey, val: TVal) -> Union['Node', None]:
        """
        """

    @abstractmethod
    def delete(self, key: TKey) -> Union['Node', None]:
        """
        """

    @classmethod
    def shrink(cls, key: TKey, parent: 'Node', index: int):
        """
        """

        child = parent.vals[index]
        child.delete(key)

        if not child.is_underflown():
            return

        siblings = (
                ([(index + 1, parent.vals[index + 1])] if index + 1 < len(parent.vals) else []) +
                ([(index - 1, parent.vals[index - 1])] if index > 0 else [])
        )

        donor_index, donor = max(siblings, key=lambda _x: len(_x[1].keys))

        if donor.is_low():

            if donor_index < index:
                donor.merge(child, pivot=parent.keys.pop(donor_index))
                del parent.vals[index]

            else:
                child.merge(donor, pivot=parent.keys.pop(index))
                del parent.vals[donor_index]

        else:

            donor_split = donor.split()

            if donor_index < index:

                parent.vals[donor_index] = donor_split.vals[0]

                donor_split.vals[1].merge(child, pivot=parent.keys[donor_index])
                parent.vals[index] = donor_split.vals[1]

                parent.keys[donor_index] = donor_split.keys[0]

            else:

                parent.vals[donor_index] = donor_split.vals[1]

                child.merge(donor_split.vals[0], pivot=parent.keys[index])
                parent.vals[index] = child

                parent.keys[index] = donor_split.keys[0]
