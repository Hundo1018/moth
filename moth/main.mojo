@register_passable("trivial")
struct Bal(EqualityComparable, Writable):
    """Balanced-ternary value."""

    var _value: Int
    alias N = Bal(-1)
    alias T = Bal(-1)

    alias Z = Bal(0)
    alias P = Bal(1)

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

    fn __init__(out self, value: Int):
        if value == -1:
            self._value = -1
        elif value == 0:
            self._value = 0
        elif value == 1:
            self._value = 1
        else:
            self._value = 999


@register_passable("trivial")
struct Trit(Writable):
    alias N = Bal(-1)
    alias Z = Bal(0)
    alias P = Bal(1)
    var _value: Bal

    fn write_to[w: Writer](self, mut writer: w):
        writer.write(self._value)

    fn __init__(out self, value: Bal):
        self._value = value

    fn __init__(out self, value: Int):
        self._value = Bal(value)


struct Tryte:
    """9 trit as a Tryte."""

    ...


struct Ternac:
    "Mentissa as 42 trit, exponent as 9 trit."

    ...


def main():
    print(Trit(2))
