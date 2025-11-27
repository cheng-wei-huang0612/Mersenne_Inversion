from fractions import Fraction
import numpy as np
import random
seed = 42  # specify your seed here
random.seed(seed)

PRIME = (2**255) - 19
inv2 = pow(2, -1, PRIME)
assert inv2 * 2 % PRIME ==1

inv60 = pow(inv2, 60, PRIME)
assert inv60 * (2**60) % PRIME ==1


f = (2**255) - 19
g = random.randint(1, f - 1)
# 8078693932060801591583792927717344231611431212613261606275840510111054395806
delta = 1

def divstep(delta, f, g, u, v, r, s):
    P = (delta >= 0) and (g & 1 == 1)
    if P:
        new_delta = 2 - delta

        new_f = g

        assert (g - f) & 1 == 0
        new_g = (g - f) >> 1

        # Transition Matrix 
        new_u = r
        new_v = s
        assert (r - u) & 1 == 0
        assert (s - v) & 1 == 0
        new_r = (r - u) >> 1
        new_s = (s - v) >> 1

        


    
    else:
        new_delta = 2 + delta
        new_f = f

        assert (g + ((g & 1) * f)) & 1 == 0
        new_g = (g + ((g & 1) * f)) >> 1

        # Transition Matrix 
        new_u = u
        new_v = v
        assert (r + ((g & 1) * u)) & 1 == 0
        assert (s + ((g & 1) * v)) & 1 == 0
        new_r = (r + ((g & 1) * u)) >> 1
        new_s = (s + ((g & 1) * v)) >> 1


    return new_delta, new_f, new_g, new_u, new_v, new_r, new_s

def divstepx20(delta, f, g):
    f_0 = f
    g_0 = g

    times = 20
    u = -(2**times)
    v = 0
    r = 0
    s = -(2**times)

    for _ in range(times):
        delta, f, g, u, v, r, s = divstep(delta, f, g, u, v, r, s)

    assert (u * f_0 + v * g_0) == (f * (-(2**20)))
    assert (r * f_0 + s * g_0) == (g * (-(2**20)))

    return delta, f, g, u, v, r, s



def divstepx60(delta, f, g):
    f_0 = f
    g_0 = g


    delta, f, g, uu, vv, rr, ss = divstepx20(delta, f, g)

    assert (uu * f_0 + vv * g_0) == (f * (-(2**20)))
    assert (rr * f_0 + ss * g_0) == (g * (-(2**20)))


    delta, f, g, u, v, r, s = divstepx20(delta, f, g)

    uu_new = u * uu + v * rr
    vv_new = u * vv + v * ss
    rr_new = r * uu + s * rr
    ss_new = r * vv + s * ss
    uu, vv, rr, ss = uu_new, vv_new, rr_new, ss_new


    assert (uu * f_0 + vv * g_0) == (f * (-(2**20)) * (-(2**20)))
    assert (rr * f_0 + ss * g_0) == (g * (-(2**20)) * (-(2**20)))

    delta, f, g, u, v, r, s = divstepx20(delta, f, g)

    uu_new = u * uu + v * rr
    vv_new = u * vv + v * ss
    rr_new = r * uu + s * rr
    ss_new = r * vv + s * ss
    uu, vv, rr, ss = uu_new, vv_new, rr_new, ss_new

    assert (uu * f_0 + vv * g_0) == (f * (-(2**20)) * (-(2**20)) * (-(2**20)))
    assert (rr * f_0 + ss * g_0) == (g * (-(2**20)) * (-(2**20)) * (-(2**20)))

    return delta, f, g, uu, vv, rr, ss



def update_VS(V, S, uu, vv, rr, ss):
    # U_new = uu * U + vv * R
    V_new = uu * V + vv * S
    # R_new = rr * U + ss * R
    S_new = rr * V + ss * S

    # U, V, R, S = U_new, V_new, R_new, S_new
    V = V_new * inv60 % PRIME
    S = S_new * inv60 % PRIME

    # assert (V * g_0) % PRIME == (-f) % PRIME
    # assert (S * g_0) % PRIME == (-g) % PRIME

    return V, S



f_0 = f
g_0 = g
U = 1
V = 0
R = 0
S = 1


delta, f, g, uu, vv, rr, ss = divstepx60(delta, f, g)
V, S = update_VS(V, S, uu, vv, rr, ss)


assert (V * g_0) % PRIME == (-f) % PRIME
assert (S * g_0) % PRIME == (-g) % PRIME

delta, f, g, uu, vv, rr, ss = divstepx60(delta, f, g)
V, S = update_VS(V, S, uu, vv, rr, ss)


assert (V * g_0) % PRIME == (f) % PRIME
assert (S * g_0) % PRIME == (g) % PRIME
delta, f, g, uu, vv, rr, ss = divstepx60(delta, f, g)
V, S = update_VS(V, S, uu, vv, rr, ss)


assert (V * g_0) % PRIME == (-f) % PRIME
assert (S * g_0) % PRIME == (-g) % PRIME

delta, f, g, uu, vv, rr, ss = divstepx60(delta, f, g)
V, S = update_VS(V, S, uu, vv, rr, ss)


assert (V * g_0) % PRIME == (f) % PRIME
assert (S * g_0) % PRIME == (g) % PRIME
# # f is \pm gcd (f, g), guaranteed by Math Thm
