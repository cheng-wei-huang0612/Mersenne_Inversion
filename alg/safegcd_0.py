### Import
from safegcd import *

from numpy import (
    uint8 as uint8_t, uint16 as uint16_t, uint32 as uint32_t, uint64 as uint64_t,
    int8  as int8_t,  int16  as int16_t,  int32  as int32_t,  int64  as int64_t,
)
import numpy as np
from dataclasses import dataclass, field

np.seterr(over="ignore")  # 你就是要 overflow

### state
@dataclass
class inverter_state_t:
    F: np.ndarray = field(default_factory=lambda: np.zeros(9, dtype=int32_t))
    G: np.ndarray = field(default_factory=lambda: np.zeros(9, dtype=int32_t))
    V: np.ndarray = field(default_factory=lambda: np.zeros(9, dtype=int32_t))
    S: np.ndarray = field(default_factory=lambda: np.zeros(9, dtype=int32_t))
    Mont: object = field(default_factory=lambda: int32_t(0))

    f_low60: object = field(default_factory=lambda: int64_t(0))
    g_low60: object = field(default_factory=lambda: int64_t(0))
    delta:  object = field(default_factory=lambda: int64_t(0))

    f_low128: np.ndarray = field(default_factory=lambda: np.zeros(2, dtype=uint64_t))
    g_low128: np.ndarray = field(default_factory=lambda: np.zeros(2, dtype=uint64_t))

    fuv: object = field(default_factory=lambda: int64_t(0))
    grs: object = field(default_factory=lambda: int64_t(0))

    u: object = field(default_factory=lambda: int64_t(0))
    v: object = field(default_factory=lambda: int64_t(0))
    r: object = field(default_factory=lambda: int64_t(0))
    s: object = field(default_factory=lambda: int64_t(0))

    uu: object = field(default_factory=lambda: int64_t(0))
    vv: object = field(default_factory=lambda: int64_t(0))
    rr: object = field(default_factory=lambda: int64_t(0))
    ss: object = field(default_factory=lambda: int64_t(0))

    uu0: object = field(default_factory=lambda: int32_t(0))
    uu1: object = field(default_factory=lambda: int32_t(0))
    vv0: object = field(default_factory=lambda: int32_t(0))
    vv1: object = field(default_factory=lambda: int32_t(0))
    rr0: object = field(default_factory=lambda: int32_t(0))
    rr1: object = field(default_factory=lambda: int32_t(0))
    ss0: object = field(default_factory=lambda: int32_t(0))
    ss1: object = field(default_factory=lambda: int32_t(0))

    step_performed: object = field(default_factory=lambda: uint32_t(0))

    tmp: np.ndarray = field(default_factory=lambda: np.zeros(16, dtype=int64_t))  # debug scratch


### debug print
def debug_print_state(state: inverter_state_t, tag: str = "\b") -> None:
    print(f"== {tag} (step {int(state.step_performed)}) ==")

    labels = ["F", "G", "V", "S"]
    arrays = [state.F, state.G, state.V, state.S]

    for lab, arr in zip(labels, arrays):
        print(f"{lab}: " + " ".join(str(int(x)) for x in arr.tolist()))

    print(f"f_low60  = {int(state.f_low60)}")
    print(f"g_low60  = {int(state.g_low60)}")
    print(f"delta    = {int(state.delta)}")
    print(f"f_low128 = [{int(state.f_low128[0])}, {int(state.f_low128[1])}]")
    print(f"g_low128 = [{int(state.g_low128[0])}, {int(state.g_low128[1])}]")
    print(f"fuv      = {int(state.fuv)}")
    print(f"grs      = {int(state.grs)}")
    print(f"u        = {int(state.u)}")
    print(f"v        = {int(state.v)}")
    print(f"r        = {int(state.r)}")
    print(f"s        = {int(state.s)}")
    print(f"uu       = {int(state.uu)}")
    print(f"vv       = {int(state.vv)}")
    print(f"rr       = {int(state.rr)}")
    print(f"ss       = {int(state.ss)}")
    print(f"uu limbs = [{int(state.uu0)}, {int(state.uu1)}]")
    print(f"vv limbs = [{int(state.vv0)}, {int(state.vv1)}]")
    print(f"rr limbs = [{int(state.rr0)}, {int(state.rr1)}]")
    print(f"ss limbs = [{int(state.ss0)}, {int(state.ss1)}]")
    print()


### Program
def initialization(x: np.ndarray, inverter_state: inverter_state_t):

    x_bignum = int(x[0]) + int(x[1]) * (2**64) + int(x[2]) * (2**64) + int(x[3]) * (2**64)
    F0 = x_bignum % (2**30)
    F1 = (x_bignum>>30) % (2**30)
    F2 = (x_bignum>>60) % (2**30)
    print(F0, F1, F2)


def inverse_25519(x: np.ndarray) -> np.ndarray:

    inv = np.zeros(4, dtype=uint64_t)   # output buffer
    inverter_state = inverter_state_t()               # like inverter_state_t st = {0};

    initialization(x, inverter_state)



 





    return inv

# demo usage
if __name__ == "__main__":
    x = np.array([1, 2, 3, 4], dtype=uint64_t)

    inv = inverse_25519(x)
    print(inv)
