from collections.abc import Sequence
from functools import reduce
from itertools import islice


__all__ = ['AlphaOrderer']


class AlphaOrderer:
    """

    """

    _groups = [
        (" ",       0,      0 - ord(" ")),      # SPC   0
        ("'",       0,      1 - ord("'")),      # '     1
        ("-",       0,      2 - ord("-")),      # -     2
        ("a-z",     1,      11 - ord("a")),     # a-z   11-36
        ("а-г",     2,      11 - ord("а")),     # а-г   11-14
        ("д-е",     2,      16 - ord("д")),     # д-е   16-17
        ("ж-и",     2,      20 - ord("ж")),     # ж-и   20-22
        ("й-я",     2,      25 - ord("й")),     # й-я   25-47
        ("ё",       2,      19 - ord("ё")),     # ё     19
        ("є",       2,      18 - ord("є")),     # є     18
        ("і-ї",     2,      23 - ord("і")),     # і-ї   23-24
        ("ґ",       2,      15 - ord("ґ"))      # ґ     15
    ]

    @classmethod
    def ord(cls, __c: str) -> tuple[int, int]:
        """

        """

        _cl = __c.lower()

        for (group, lang, offset) in cls._groups:
            if group[0] <= _cl <= group[-1]:
                return lang, ord(_cl) + offset

        raise ValueError(f"No alphabetical order defined for the passed symbol '{__c}'")

    @classmethod
    def apply(cls, __s: str, limit: int = -1) -> tuple[int, Sequence[int]]:
        """

        """

        def bind_char(lang_ords: tuple[int, list[int]], __c: str) -> tuple[int, list[int]]:

            lang, ords = lang_ords
            __c_lang, __c_ord = cls.ord(__c)

            if lang == 0:
                lang = __c_lang

            elif __c_lang != 0 and lang != __c_lang:
                raise ValueError("Alphabet inconsistency detected")

            ords.append(__c_ord)
            return lang, ords

        return reduce(bind_char, __s if limit == -1 else islice(__s, limit), (0, []))
