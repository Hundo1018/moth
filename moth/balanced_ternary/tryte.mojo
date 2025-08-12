from .trit import Trit
from collections import List


struct Tryte[trinarization: Bool = False](Writable):
    """9 trits as a Tryte."""

    var _trits: List[Trit]

    fn __init__(out self, *trits: Int) raises:
        self._trits = List[Trit]()
        for i in trits:
            self._trits.append(Trit(i))
        return self._trits

    fn write_to[w: Writer](self, mut writer: w):
        for t in self._trits:
            writer.write(t)
