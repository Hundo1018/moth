alias T = -1
alias N = T
alias Z = 0
alias P = 1

alias AND = T & -P  # should be T
alias OR = -T | P  # should be P
alias PP = Trit(1)
alias NN = Trit(-1)
alias ZZ = Trit(0)

# alias MIXWIDTH =  Int(bitwidthof[::DType,__mlir_type.!kgen.target]())


# alias AND_GATE: fn (a: Trit, b: Trit) -> Trit = ()


# ===-----------------------------------------------------------------------===#
# Trit
# ===-----------------------------------------------------------------------===#
@register_passable("trivial")
struct Trit(EqualityComparable, Intable, Writable):
    """Balanced-ternary value."""

    # ===-------------------------------------------------------------------===#
    # Aliases
    # ===-------------------------------------------------------------------===#
    alias a: Int = 0
    # ===-------------------------------------------------------------------===#
    # Fields
    # ===-------------------------------------------------------------------===#

    var _value: Int

    # TODO: At least, It Should be stored by SIMD or bool or bitset not Int.

    # ===-------------------------------------------------------------------===#
    # Life cycle methods
    # ===-------------------------------------------------------------------===#

    fn __init__(out self, value: Int):
        if value > Z:
            self._value = P
        elif value < Z:
            self._value = N
        else:
            self._value = Z

    fn __init__(out self, value: Bool):
        if value:
            self._value = P
        else:
            self._value = N

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

    fn __or__(self, other: Self) -> Self:
        if P in (self._value, other._value):
            return Self(P)
        if Z in (self._value, other._value):
            return Self(Z)
        return Self(N)

    fn __xor__(self, other: Self) -> Self:
        if Z in (self._value, other._value):
            return Self(Z)
        if self._value != other._value:
            return Self(P)
        return Self(N)

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
