from gen_cl import *


def divstep_gen(i, j, k, case, you_shall_not_pass = False):
    emit = ""

    vars = [
    Var(sint64, "fuv"),
    Var(sint64, "grs"),
    Var(sint64, "delta"),]


    negative = False
    if (k + j) % 2 == 1:
        negative = True

    neg_prefix = ""
    if (k + j) % 2 == 1:
        neg_prefix = "neg_"


    vars += [
    Var(sint64, f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_0"),
    Var(sint64, f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_0"),]
    if i == 0:
        vars += [
        Var(sint64, f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1}"),
        Var(sint64, f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1}"),]
    else:
        vars += [
        Var(sint64, f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i}"),
        Var(sint64, f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i}"),
        Var(sint64, f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1}"),
        Var(sint64, f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1}"),
        ]


    vars += [
    Var(sint64, f"u_{59*k + 20*j}_{59*k + 20*j + i}"),
    Var(sint64, f"v_{59*k + 20*j}_{59*k + 20*j + i}"),
    Var(sint64, f"r_{59*k + 20*j}_{59*k + 20*j + i}"),
    Var(sint64, f"s_{59*k + 20*j}_{59*k + 20*j + i}"),
    Var(sint64, f"u_{59*k + 20*j}_{59*k + 20*j + i+1}"),
    Var(sint64, f"v_{59*k + 20*j}_{59*k + 20*j + i+1}"),
    Var(sint64, f"r_{59*k + 20*j}_{59*k + 20*j + i+1}"),
    Var(sint64, f"s_{59*k + 20*j}_{59*k + 20*j + i+1}"),
    Var(bit, "ne"),
    ]

    emit += f"proc divstep_{59*k + 20*j + i:03d}_{case} (\n"

    emit += cl_var_layout(vars, 1)

    rpred = Rpred(
    f"u_{59*k + 20*j}_{59*k + 20*j + i} * {neg_prefix}f_{59*k}_low60_{20*j}_low20_0 + v_{59*k + 20*j}_{59*k + 20*j + i} * {neg_prefix}g_{59*k}_low60_{20*j}_low20_0 = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i} * (const 64 (-(2**20)))",
    f"r_{59*k + 20*j}_{59*k + 20*j + i} * {neg_prefix}f_{59*k}_low60_{20*j}_low20_0 + s_{59*k + 20*j}_{59*k + 20*j + i} * {neg_prefix}g_{59*k}_low60_{20*j}_low20_0 = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} * (const 64 (-(2**20)))",
    f"fuv = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i} + u_{59*k + 20*j}_{59*k + 20*j + i} * (const 64 (2**21)) + v_{59*k + 20*j}_{59*k + 20*j + i} * (const 64 (2**42))",
    f"grs = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} + r_{59*k + 20*j}_{59*k + 20*j + i} * (const 64 (2**21)) + s_{59*k + 20*j}_{59*k + 20*j + i} * (const 64 (2**42))",
    f"const 64 0 <=s {neg_prefix}f_{59*k}_low60_{20*j}_low20_0",
    f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_0 <=s (const 64 ((2**20)-1))",
    f"const 64 0 <=s {neg_prefix}g_{59*k}_low60_{20*j}_low20_0",
    f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_0 <=s (const 64 ((2**20)-1))",
        )

    if i == 0:
        rpred = Rpred(rpred,
        f"fuv = (const 64 1) (mod (const 64 2))",
            )
    else:
        rpred = Rpred(rpred,
        f"const 64 0 <=s {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i}",
        f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i} <=s (const 64 ((2**20)-1))",
        f"const 64 0 <=s {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i}",
        f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} <=s (const 64 ((2**20)-1))",
        f"fuv = (const 64 1) (mod (const 64 2))",
        f"grs = (uext ne 63) (mod (const 64 2))",
            )


    rpred = Rpred(rpred,
    f"delta = (const 64 1) (mod (const 64 2))",
    f"(const 64 (1 + (-2) * {59*k + 20*j + i})) <=s delta, delta <=s (const 64 (1 + 2*{59*k + 20*j + i}))",
        )

    if i == 0:
        rpred = Rpred(
        rpred,
        f"u_{59*k + 20*j}_{59*k + 20*j + i} = (const 64 (-(2**20)))",
        f"v_{59*k + 20*j}_{59*k + 20*j + i} = (const 64 (0))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i} = (const 64 (0))",
        f"s_{59*k + 20*j}_{59*k + 20*j + i} = (const 64 (-(2**20)))",
        )
    else:
        rpred = Rpred(
        rpred,
        # f"(const 64 (-(2**20))) <=s u_0_{i}, u_0_{i} <=s (const 64 ((2**19)))",
        # f"(const 64 (-(2**20))) <=s v_0_{i}, v_0_{i} <=s (const 64 ((2**19) - (2**(20 - {i})) ))",
        # f"(const 64 ((2**(20-{i}))-(2**20))) <=s r_0_{i}, r_0_{i} <=s (const 64 ((2**19) - (2**(20 - {i}))))",
        # f"(const 64 ((2**(20-{i}))-(2**20))) <=s s_0_{i}, s_0_{i} <=s (const 64 ((2**19) - (2**(20 - {i}))))",
        # f"(const 64 ((2**(20-{i}))-(2**19))) <=s (r_0_{i} - u_0_{i}), (r_0_{i} - u_0_{i}) <=s (const 64 ((2**20)))",
        # f"(const 64 (-(2**19))) <=s (s_0_{i} - v_0_{i}), (s_0_{i} - v_0_{i}) <=s (const 64 ((2**20) - (2**(20 - {i}))))",
        f"(const 64 (-(2**20))) <=s u_{59*k + 20*j}_{59*k + 20*j + i}, u_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s v_{59*k + 20*j}_{59*k + 20*j + i}, v_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s r_{59*k + 20*j}_{59*k + 20*j + i}, r_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s s_{59*k + 20*j}_{59*k + 20*j + i}, s_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 ((2**20)))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i} + v_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 (2**20))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i} - v_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i} + v_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i} - v_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i} + s_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i} - s_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i} + s_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i} - s_{59*k + 20*j}_{59*k + 20*j + i} <=s (const 64 (2**20))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i} = (const 64 0) (mod (const 64 (2**(20-{i}))))",
        f"v_{59*k + 20*j}_{59*k + 20*j + i} = (const 64 0) (mod (const 64 (2**(20-{i}))))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i} = (const 64 0) (mod (const 64 (2**(20-{i}))))",
        f"s_{59*k + 20*j}_{59*k + 20*j + i} = (const 64 0) (mod (const 64 (2**(20-{i}))))",
        )


    emit += cl_precondition(
        Epred(
            f"u_{59*k + 20*j}_{59*k + 20*j + i} * {neg_prefix}f_{59*k}_low60_{20*j}_low20_0 + v_{59*k + 20*j}_{59*k + 20*j + i} * {neg_prefix}g_{59*k}_low60_{20*j}_low20_0 = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i} * (-(2**20))",
            f"r_{59*k + 20*j}_{59*k + 20*j + i} * {neg_prefix}f_{59*k}_low60_{20*j}_low20_0 + s_{59*k + 20*j}_{59*k + 20*j + i} * {neg_prefix}g_{59*k}_low60_{20*j}_low20_0 = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} * (-(2**20))",
        ), 
        rpred
    )



    emit += f"""

// divsteps
// step{59*k + 20*j + i}
"""
    if case == "a":
        emit += f"""
// premise {case}
assume
{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} = 0 (mod 2)
&&
{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} = const 64 0 (mod (const 64 2))
;
"""
    elif case == "b":
        emit += f"""
// premise {case}
assume
{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} = 1 (mod 2)
&&
{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} = const 64 1 (mod (const 64 2)),
delta <s (const 64 0)
;
"""
    elif case == "c":
        emit += f"""
// premise {case}
assume
{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} = 1 (mod 2)
&&
{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} = const 64 1 (mod (const 64 2)),
delta >=s (const 64 0)
;
"""

    emit += f"""

mov x7 fuv;
mov x8 grs;
mov x3 delta;
"""

    if i == 0:
        emit += f"""
(* tst	x8, #0x1                                    #! PC = 0xaaaaca660fa8 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
"""

    emit += f"""
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca660fc4 *)
add x3 x3 0x2@sint64;
"""

    if not((j==0 and i==19) or (j==1 and i==19) or (j==2 and i==18)):
        emit += f"""
(* tst	x8, #0x2                                    #! PC = 0xaaaaca660fc8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
"""

    emit += f"""
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca660fcc *)
split x8 dc x8 1;
"""


    if case == "a":
        emit += f"""
// premise {case}
assert true &&
    x7 = fuv,
    x8 * (const 64 2) = grs,
    x3 = (const 64 2) + delta
;
"""
    elif case == "b":
        emit += f"""
// premise {case}
assert true &&
    x7 = fuv,
    x8 * (const 64 2) = grs + fuv,
    x3 = (const 64 2) + delta
;
"""
    elif case == "c":
        emit += f"""
// premise {case}
assert true &&
    x7 = grs,
    x8 * (const 64 2) = grs - fuv,
    x3 = (const 64 2) - delta
;
"""

    emit += """

mov fuv x7;
mov grs x8;
mov delta x3;
"""

    if case == "a":
        emit += f"""
// According to premise {case}

mov {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i};
mov u_{59*k + 20*j}_{59*k + 20*j + i+1} u_{59*k + 20*j}_{59*k + 20*j + i};
mov v_{59*k + 20*j}_{59*k + 20*j + i+1} v_{59*k + 20*j}_{59*k + 20*j + i};

asr {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} 1;
asr r_{59*k + 20*j}_{59*k + 20*j + i+1} r_{59*k + 20*j}_{59*k + 20*j + i} 1;
asr s_{59*k + 20*j}_{59*k + 20*j + i+1} s_{59*k + 20*j}_{59*k + 20*j + i} 1;
"""

        emit += cl_assert(
            Epred(),
            Rpred([
                f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i}",
                f"u_{59*k + 20*j}_{59*k + 20*j + i+1} = u_{59*k + 20*j}_{59*k + 20*j + i}",
                f"v_{59*k + 20*j}_{59*k + 20*j + i+1} = v_{59*k + 20*j}_{59*k + 20*j + i}",
                f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} * (const 64 2) = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i}",
                f"r_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 2) = r_{59*k + 20*j}_{59*k + 20*j + i}",
                f"s_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 2) = s_{59*k + 20*j}_{59*k + 20*j + i}",
            ])
        )

        emit += cl_assume(
            Epred([
                f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i}",
                f"u_{59*k + 20*j}_{59*k + 20*j + i+1} = u_{59*k + 20*j}_{59*k + 20*j + i}",
                f"v_{59*k + 20*j}_{59*k + 20*j + i+1} = v_{59*k + 20*j}_{59*k + 20*j + i}",
                f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} * 2 = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i}",
                f"r_{59*k + 20*j}_{59*k + 20*j + i+1} * 2 = r_{59*k + 20*j}_{59*k + 20*j + i}",
                f"s_{59*k + 20*j}_{59*k + 20*j + i+1} * 2 = s_{59*k + 20*j}_{59*k + 20*j + i}",
            ]),
            Rpred()
        )
    elif case == "b":
        emit += f"""
// According to premise {case}

mov {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i};
mov u_{59*k + 20*j}_{59*k + 20*j + i+1} u_{59*k + 20*j}_{59*k + 20*j + i};
mov v_{59*k + 20*j}_{59*k + 20*j + i+1} v_{59*k + 20*j}_{59*k + 20*j + i};

add {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i};
asr {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} 1;
add r_{59*k + 20*j}_{59*k + 20*j + i+1} r_{59*k + 20*j}_{59*k + 20*j + i} u_{59*k + 20*j}_{59*k + 20*j + i};
asr r_{59*k + 20*j}_{59*k + 20*j + i+1} r_{59*k + 20*j}_{59*k + 20*j + i+1} 1;
add s_{59*k + 20*j}_{59*k + 20*j + i+1} s_{59*k + 20*j}_{59*k + 20*j + i} v_{59*k + 20*j}_{59*k + 20*j + i};
asr s_{59*k + 20*j}_{59*k + 20*j + i+1} s_{59*k + 20*j}_{59*k + 20*j + i+1} 1;
"""

        emit += cl_assert(
            Epred(),
            Rpred([
                f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i}",
                f"u_{59*k + 20*j}_{59*k + 20*j + i+1} = u_{59*k + 20*j}_{59*k + 20*j + i}",
                f"v_{59*k + 20*j}_{59*k + 20*j + i+1} = v_{59*k + 20*j}_{59*k + 20*j + i}",
                f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} * (const 64 2) = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} + {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i}",
                f"r_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 2) = r_{59*k + 20*j}_{59*k + 20*j + i} + u_{59*k + 20*j}_{59*k + 20*j + i}",
                f"s_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 2) = s_{59*k + 20*j}_{59*k + 20*j + i} + v_{59*k + 20*j}_{59*k + 20*j + i}",
            ])
        )

        emit += cl_assume(
            Epred([
                f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i}",
                f"u_{59*k + 20*j}_{59*k + 20*j + i+1} = u_{59*k + 20*j}_{59*k + 20*j + i}",
                f"v_{59*k + 20*j}_{59*k + 20*j + i+1} = v_{59*k + 20*j}_{59*k + 20*j + i}",
                f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} * 2 = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} + {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i}",
                f"r_{59*k + 20*j}_{59*k + 20*j + i+1} * 2 = r_{59*k + 20*j}_{59*k + 20*j + i} + u_{59*k + 20*j}_{59*k + 20*j + i}",
                f"s_{59*k + 20*j}_{59*k + 20*j + i+1} * 2 = s_{59*k + 20*j}_{59*k + 20*j + i} + v_{59*k + 20*j}_{59*k + 20*j + i}",
            ]),
            Rpred()
        )
    elif case == "c":
        emit += f"""
// According to premise {case}

mov {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i};
mov u_{59*k + 20*j}_{59*k + 20*j + i+1} r_{59*k + 20*j}_{59*k + 20*j + i};
mov v_{59*k + 20*j}_{59*k + 20*j + i+1} s_{59*k + 20*j}_{59*k + 20*j + i};

subs dc {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i};
asr {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} 1;
subs dc r_{59*k + 20*j}_{59*k + 20*j + i+1} r_{59*k + 20*j}_{59*k + 20*j + i} u_{59*k + 20*j}_{59*k + 20*j + i};
asr r_{59*k + 20*j}_{59*k + 20*j + i+1} r_{59*k + 20*j}_{59*k + 20*j + i+1} 1;
subs dc s_{59*k + 20*j}_{59*k + 20*j + i+1} s_{59*k + 20*j}_{59*k + 20*j + i} v_{59*k + 20*j}_{59*k + 20*j + i};
asr s_{59*k + 20*j}_{59*k + 20*j + i+1} s_{59*k + 20*j}_{59*k + 20*j + i+1} 1;
"""

        emit += cl_assert(
            Epred(),
            Rpred([
                f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i}",
                f"u_{59*k + 20*j}_{59*k + 20*j + i+1} = r_{59*k + 20*j}_{59*k + 20*j + i}",
                f"v_{59*k + 20*j}_{59*k + 20*j + i+1} = s_{59*k + 20*j}_{59*k + 20*j + i}",
                f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} * (const 64 2) = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} - {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i}",
                f"r_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 2) = r_{59*k + 20*j}_{59*k + 20*j + i} - u_{59*k + 20*j}_{59*k + 20*j + i}",
                f"s_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 2) = s_{59*k + 20*j}_{59*k + 20*j + i} - v_{59*k + 20*j}_{59*k + 20*j + i}",
            ])
        )

        emit += cl_assume(
            Epred([
                f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i}",
                f"u_{59*k + 20*j}_{59*k + 20*j + i+1} = r_{59*k + 20*j}_{59*k + 20*j + i}",
                f"v_{59*k + 20*j}_{59*k + 20*j + i+1} = s_{59*k + 20*j}_{59*k + 20*j + i}",
                f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} * 2 = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i} - {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i}",
                f"r_{59*k + 20*j}_{59*k + 20*j + i+1} * 2 = r_{59*k + 20*j}_{59*k + 20*j + i} - u_{59*k + 20*j}_{59*k + 20*j + i}",
                f"s_{59*k + 20*j}_{59*k + 20*j + i+1} * 2 = s_{59*k + 20*j}_{59*k + 20*j + i} - v_{59*k + 20*j}_{59*k + 20*j + i}",
            ]),
            Rpred()
        )

    post_rpred = Rpred()
    if you_shall_not_pass:
        post_rpred = Rpred("(const 64 0) = (const 64 1)")

    emit += cl_postcondition(
        Epred(
            f"u_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}f_{59*k}_low60_{20*j}_low20_0 + v_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}g_{59*k}_low60_{20*j}_low20_0 = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} * (-(2**20)) prove with [algebra solver smt:z3]",
            f"r_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}f_{59*k}_low60_{20*j}_low20_0 + s_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}g_{59*k}_low60_{20*j}_low20_0 = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} * (-(2**20)) prove with [algebra solver smt:z3]",
        ), 
        Rpred(post_rpred,
        f"fuv = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} + u_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**21)) + v_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**42))",
        f"grs = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} + r_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**21)) + s_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**42))",
        f"(const 64 (-(2**20)+1)) <=s {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1}",
        f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20)+1)) <=s {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1}",
        f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (1 + (-2) * {59*k + 20*j + i+1})) <=s delta, delta <=s (const 64 (1 + 2*{59*k + 20*j + i+1}))",
        # f"(const 64 (-(2**20))) <=s u_0_{i+1}, u_0_{i+1} <=s (const 64 ((2**19)))",
        # f"(const 64 (-(2**20))) <=s v_0_{i+1}, v_0_{i+1} <=s (const 64 ((2**19) - (2**(20 - {i+1})) ))",
        # f"(const 64 ((2**(20-{i+1}))-(2**20))) <=s r_0_{i+1}, r_0_{i+1} <=s (const 64 ((2**19)))",
        # f"(const 64 ((2**(20-{i+1}))-(2**20))) <=s s_0_{i+1}, s_0_{i+1} <=s (const 64 ((2**19) - (2**(20 - {i+1}))))",
        # f"(const 64 ((2**(20-{i+1}))-(2**19))) <=s (r_0_{i+1} - u_0_{i+1}), (r_0_{i+1} - u_0_{i+1}) <=s (const 64 ((2**20)))",
        # f"(const 64 (-(2**19))) <=s (s_0_{i+1} - v_0_{i+1}), (s_0_{i+1} - v_0_{i+1}) <=s (const 64 ((2**20) - (2**(20 - {i+1}))))",


        f"(const 64 (-(2**20))) <=s u_{59*k + 20*j}_{59*k + 20*j + i+1}, u_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s v_{59*k + 20*j}_{59*k + 20*j + i+1}, v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s r_{59*k + 20*j}_{59*k + 20*j + i+1}, r_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s s_{59*k + 20*j}_{59*k + 20*j + i+1}, s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",

        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"v_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"s_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        )
    )

    return emit



for k in range(10):
    for j in range(3):
        for i in range(20 - (j>>1)):
            for case in ["a", "b", "c"]:
                emit = divstep_gen(i,j,k,case)
                with open(f"gen/divstep_{59*k + 20*j + i:03d}_{case}.cl", "w") as f:
                    f.write(emit)



for k in range(10):
    for j in range(3):
        with open(f"gen/divstep_{59*k + 20*j:03d}_{59*k + 20*(j+1) - (j>>1):03d}_forkcases.cl", "w") as f:
            emit = ""
            for i in range(20 - (j>>1)):
                for case in ["a", "b", "c"]:
                    emit += divstep_gen(i, j, k, case)
            f.write(emit)

with open("gen/divstep_000_590_forkcases.cl", "w") as f:
    emit = ""
    for k in range(10):
        for j in range(3):
            for i in range(20 - (j >> 1)):
                for case in ["a", "b", "c"]:
                    emit += divstep_gen(i, j, k, case)
    f.write(emit)
