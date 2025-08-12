@register_passable("trivial")
struct Trit[trinarization: Bool = False](EqualityComparable, Writable):
    """Balanced-ternary value."""

    var _value: Int
    # TODO: At least, It Should be stored by SIMD or bool not Int.

    fn __init__(out self, value: Int) raises:
        @parameter
        if trinarization:
            if value > 0:
                self._value = 1
            else:
                self._value = -1
        else:
            if value == 0 or value == 1 or value == -1:
                self._value = value
            else:
                raise Error("Invalid Number")

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn write_to[w: Writer](self, mut writer: w):
        if self._value == -1:
            writer.write("T")
        elif self._value == 0:
            writer.write("0")
        elif self._value == 1:
            writer.write("1")
        else:
            writer.write("X")
