alias T = -1
alias N = T
alias Z = 0
alias P = 1


# ===-----------------------------------------------------------------------===#
# Trit
# ===-----------------------------------------------------------------------===#
@register_passable("trivial")
struct Trit[trinarization: Bool = False](EqualityComparable, Intable, Writable):
    """Balanced-ternary value."""

    # ===-------------------------------------------------------------------===#
    # Aliases
    # ===-------------------------------------------------------------------===#

    # ===-------------------------------------------------------------------===#
    # Fields
    # ===-------------------------------------------------------------------===#

    var _value: Int
    # TODO: At least, It Should be stored by SIMD or bool not Int.

    # ===-------------------------------------------------------------------===#
    # Life cycle methods
    # ===-------------------------------------------------------------------===#

    fn __init__(out self, value: Int):
        @parameter
        if trinarization:
            if value > Z:
                self._value = P
            elif value < Z:
                self._value = N
            else:
                self._value = Z
        else:
            if value in (Z, P, N):
                self._value = value
            else:
                self._value = value
                # raise Error("Invalid Number")

    # ===-------------------------------------------------------------------===#
    # Operator dunders
    # ===-------------------------------------------------------------------===#

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __eq__(self, other: Int) -> Bool:
        return self._value == other

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __ne__(self, other: Int) -> Bool:
        return not (self._value == other)

    fn __neg__(self) -> Self:
        return Self(-self._value)

    fn __invert__(self) -> Self:
        return -self

    fn __and__(self, other: Self) -> Self:
        if T in (self._value, other._value):
            return Self(T)
        if Z in (self._value, other._value):
            return Self(Z)
        return Self(P)

    # ===-------------------------------------------------------------------===#
    # Trait implementations
    # ===-------------------------------------------------------------------===#

    fn __int__(self) -> Int:
        return self._value

    fn write_to[w: Writer](self, mut writer: w):
        if self._value == N:
            writer.write("T")
        elif self._value == Z:
            writer.write("0")
        elif self._value == P:
            writer.write("1")
        else:
            writer.write("X")
