from dataclasses import dataclass

MASK64 = (1 << 64) - 1

@dataclass(frozen=True)
class Slice:
    base: object
    hi: int
    lo: int
    def __repr__(self): return f"{self.base}[{self.hi}:{self.lo}]"

def bits(x: object, lo: int, width: int):
    if isinstance(x, int):
        return (x >> lo) & ((1 << width) - 1)
    return Slice(x, lo + width - 1, lo)

class V:
    def __init__(self, value):
        self.value = value  # int or symbolic

    @property
    def d(self):
        # 2 lanes of 64 bits in a 128-bit vector
        d0 = bits(self.value, 0, 64)
        d1 = bits(self.value, 64, 64)
        return [d0, d1]

# demo
v_int = V((1 << 127) + 5)
print(v_int.d)  # [5, 9223372036854775808]

v_sym = V("v")  # symbolic placeholder
print(v_sym.d)  # ['v'[63:0], 'v'[127:64]]
