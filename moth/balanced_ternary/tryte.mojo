from .trit import Trit
from collections import List

# ===-----------------------------------------------------------------------===#
# Tryte
# ===-----------------------------------------------------------------------===#


struct Tryte[trinarization: Bool = False](Intable, Writable):
    """9 trits as a Tryte."""

    # ===-------------------------------------------------------------------===#
    # Aliases
    # ===-------------------------------------------------------------------===#

    alias Container = List

    # ===-------------------------------------------------------------------===#
    # Fields
    # ===-------------------------------------------------------------------===#

    var _trits: Self.Container[Trit]

    # ===-------------------------------------------------------------------===#
    # Life cycle methods
    # ===-------------------------------------------------------------------===#

    fn __init__(out self, *trits: Int) raises:
        self._trits = Self.Container[Trit]()
        for i in trits:
            self._trits.append(Trit(i))

    # ===-------------------------------------------------------------------===#
    # Operator dunders
    # ===-------------------------------------------------------------------===#

    # ===-------------------------------------------------------------------===#
    # Trait implementations
    # ===-------------------------------------------------------------------===#

    fn __int__(self) -> Int:
        var result: Int = 0
        var index: Int = 0
        for item in self._trits[::-1]:
            result += Int(item) * (index ^ 3)
            index += 1
        return result

    fn write_to[w: Writer](self, mut writer: w):
        for t in self._trits:
            writer.write(t)
