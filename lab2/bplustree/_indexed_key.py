from typing import Any, TypeVar, Generic
from collections.abc import Callable


TKey = TypeVar('TKey')


class IndexedKey(Generic[TKey]):
    """

    """

    _key_value: Any
    _key_index: int

    @classmethod
    def get_idx_direct(cls, index: Callable[[TKey], int]) -> Callable[[TKey], 'IndexedKey']:
        """
        """

        return lambda key: cls(key, index(key))

    @staticmethod
    def idx_reverse(idx_key: 'IndexedKey'):
        """
        """

        return idx_key.key_value

    def __init__(self, key_value: TKey, key_index: int):

        self._key_value = key_value
        self._key_index = key_index

    @property
    def key_value(self):
        """
        """

        return self._key_value

    @property
    def key_index(self):
        """
        """

        return self._key_index

    def __eq__(self, other):
        if isinstance(other, IndexedKey):
            return self._key_value == other._key_value
        return NotImplemented

    def __ne__(self, other):
        if isinstance(other, IndexedKey):
            return self._key_value != other._key_value
        return NotImplemented

    def __lt__(self, other):
        if isinstance(other, IndexedKey):
            return self._key_index < other._key_index
        return NotImplemented

    def __gt__(self, other):
        if isinstance(other, IndexedKey):
            return self._key_index > other._key_index
        return NotImplemented

    def __le__(self, other):
        return self < other or self == other

    def __ge__(self, other):
        return self > other or self == other

    def __str__(self):
        return str(self._key_value)

    def __repr__(self):
        return repr(self._key_value)
