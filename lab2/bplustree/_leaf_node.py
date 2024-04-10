from collections.abc import Iterable
from typing import TypeVar

from ._node import Node
from ._inner_node import InnerNode


TVal = TypeVar('TVal')
TKey = TypeVar('TKey')


class LeafNode(Node[TKey, TVal]):

    _leaf_prev: 'LeafNode'
    _leaf_next: 'LeafNode'

    @property
    def next(self) -> 'LeafNode':
        """
        """

        return self._leaf_next

    @property
    def prev(self) -> 'LeafNode':
        """
        """

        return self._leaf_prev

    def __init__(self, *args, leaf_next: 'LeafNode' = None, leaf_prev: 'LeafNode' = None, **kwargs):

        super().__init__(*args, **kwargs)

        self._leaf_next = leaf_next
        self._leaf_prev = leaf_prev

    def _index(self, key: TKey) -> int | None:
        """
        """

        for _i, _key in enumerate(self.keys):

            if key == _key:
                return _i

            elif key < _key:
                break

        return None

    def select(self, key: TKey) -> TVal | None:

        index = self._index(key)

        return None if index is None else self.vals[index]

    def between(self, start_key: TKey | None, end_key: TKey | None) -> Iterable[tuple[TKey, TVal]]:

        index = 0 if start_key is None else self._index(start_key)

        leaf = self

        if end_key is None:

            while leaf is not None:

                for pair in zip(leaf.keys, leaf.vals):
                    yield pair

                leaf = leaf._leaf_next

        else:

            while leaf is not None:

                for key, val in zip(leaf.keys, leaf.vals):
                    if key > end_key:
                        break
                    yield key, val

                leaf = leaf._leaf_next

        return None if index is None else self.vals[index]

    def split(self) -> InnerNode:

        mid = len(self.keys) // 2

        l_leaf = LeafNode(self.order, keys=self.keys[:mid], vals=self.vals[:mid], leaf_prev=self._leaf_prev)
        r_leaf = LeafNode(self.order, keys=self.keys[mid:], vals=self.vals[mid:], leaf_next=self._leaf_next)

        l_leaf._leaf_next, r_leaf._leaf_prev = r_leaf, l_leaf

        return InnerNode(self.order, keys=[self.keys[mid]], vals=[l_leaf, r_leaf])

    def merge(self, other: 'LeafNode' = None, pivot=None):

        super().merge(other)

        self._leaf_next = other._leaf_next

    def insert(self, key: TKey, val: TVal) -> InnerNode | None:

        inserted = False

        for _i, _key in enumerate(self.keys):

            if key == _key:
                self.vals[_i] = val
                inserted = True

            elif key < _key:
                self.keys.insert(_i, key)
                self.vals.insert(_i, val)
                inserted = True

            if inserted:
                break

        if not inserted:
            self.keys.append(key)
            self.vals.append(val)

        return self.split() if self.is_overflown() else None

    def delete(self, key: TKey):

        index = self._index(key)

        if index is not None:
            del self.keys[index], self.vals[index]
