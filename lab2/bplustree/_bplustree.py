from typing import Any, TypeVar, Generic
from collections.abc import Callable, Iterable

from ._node import Node
from ._leaf_node import LeafNode


TKey = TypeVar('TKey')
TVal = TypeVar('TVal')


class BPlusTree(Generic[TKey]):
    """
    """

    _root: Node

    _idx_direct: Callable[[TKey], Any]
    _idx_reverse: Callable[[Any], TKey]

    def __init__(self,
                 order: int,
                 idx_direct: Callable[[TKey], Any] = None,
                 idx_reverse: Callable[[Any], TKey] = None) -> None:

        self._root = LeafNode(order)

        self._idx_direct = idx_direct or (lambda key: key)
        self._idx_reverse = idx_reverse or (lambda key: key)

    def __setitem__(self, key, val):

        self._root = self._root.insert(self._idx_direct(key), val) or self._root

    def __getitem__(self, key):

        return self._root.select(self._idx_direct(key))

    def __delitem__(self, key):

        self._root = self._root.delete(self._idx_direct(key)) or self._root

    def between(self, start_key: TKey = None, end_key: TKey = None) -> Iterable[tuple[TKey, TVal]]:
        """
        """

        start_idx_key = None if start_key is None else self._idx_direct(start_key)
        end_idx_key = None if end_key is None else self._idx_direct(end_key)

        return map(
            lambda pair: (self._idx_reverse(pair[0]), pair[1]),
            self._root.between(start_idx_key, end_idx_key)
        )
