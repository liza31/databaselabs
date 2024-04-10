from collections.abc import Iterable
from typing import TypeVar

from ._node import Node


TVal = TypeVar('TVal')
TKey = TypeVar('TKey')


class InnerNode(Node[TKey, TVal]):

    def _index(self, key: TKey) -> int:

        _i = 0

        for _i, _key in enumerate(self.keys):
            if key < _key:
                return _i

        return _i + 1

    def split(self) -> 'InnerNode':

        mid = len(self.keys) // 2

        l_leaf = InnerNode(self.order, keys=self.keys[:mid], vals=self.vals[:(mid + 1)])
        r_leaf = InnerNode(self.order, keys=self.keys[(mid + 1):], vals=self.vals[(mid + 1):])

        return InnerNode(self.order, keys=[self.keys[mid]], vals=[l_leaf, r_leaf])

    def select(self, key: TKey) -> TVal:

        return self.vals[self._index(key)].select(key)

    def between(self, start_key: TKey | None, end_key: TKey | None) -> Iterable[tuple[TKey, TVal]]:

        return self.vals[0 if start_key is None else self._index(start_key)].between(start_key, end_key)

    def insert(self, key: TKey, val: TVal) -> Node | None:

        index = self._index(key)
        upstream = self.vals[index].insert(key, val)

        if upstream is None:
            return None

        self.vals[index] = upstream.vals[0]
        self.keys.insert(index, upstream.keys[0])
        self.vals.insert(index + 1, upstream.vals[1])

        return self.split() if self.is_overflown() else None

    def delete(self, key: TKey) -> Node | None:

        index = self._index(key)

        if index is not None:
            self.shrink(key, self, index)

        if self.is_empty():
            return self.vals[0]
