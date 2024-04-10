from itertools import repeat, chain

import re
import hashlib

from alpha_orderer import AlphaOrderer


__all__ = ['AlphaHasher']


# noinspection PyPep8Naming
class AlphaHasher:

    @classmethod
    def _filter_string(cls, __s: str):
        """

        """

        return re.sub(r'\s{2,}', ' ', __s.strip())

    _KEY_OFFSET = 64

    @classmethod
    def _hash_string(cls, __s: str) -> int:
        """

        """

        return int.from_bytes(
            hashlib.md5(__s.encode(encoding="utf-8"), usedforsecurity=False).digest(),
            byteorder="big", signed=False
        )

    _key_chars: int

    @property
    def key_chars(self) -> int:
        """

        """

        return self._key_chars

    def __init__(self, key_chars: int = 23):
        """

        :param key_chars:
        """

        self._key_chars = key_chars

    def __call__(self, __s: str) -> int:
        """

        """

        # Filter passed string and apply ordering to it's leading characters
        lang, ords = AlphaOrderer.apply(self._filter_string(__s), limit=self._key_chars)

        # Form "key" - leading part of the hash
        key = lang
        for ord in chain(ords, repeat(0, self._key_chars - len(ords))):
            key = key << 8 | ord

        # Calculate string hash and combine it with key
        return self._hash_string(__s) & ((1 << self._KEY_OFFSET) - 1) | key << self._KEY_OFFSET
