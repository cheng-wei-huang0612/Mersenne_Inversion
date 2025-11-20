from gen_cl import *




def divsep_gen(i, case):
    emit = ""

    vars = [
    Var(sint64, "fuv"),
    Var(sint64, "grs"),
    Var(sint64, "delta"),
    Var(sint64, f"f_0_low60_0_low20_0"),
    Var(sint64, f"g_0_low60_0_low20_0"),]

    if i == 0:
        vars += [
        Var(sint64, f"f_0_low60_0_low20_{i+1}"),
        Var(sint64, f"g_0_low60_0_low20_{i+1}"),]
    else:
        vars += [
        Var(sint64, f"f_0_low60_0_low20_{i}"),
        Var(sint64, f"g_0_low60_0_low20_{i}"),
        Var(sint64, f"f_0_low60_0_low20_{i+1}"),
        Var(sint64, f"g_0_low60_0_low20_{i+1}"),
        ]

    vars += [
    Var(sint64, f"u_0_{i}"),
    Var(sint64, f"v_0_{i}"),
    Var(sint64, f"r_0_{i}"),
    Var(sint64, f"s_0_{i}"),
    Var(sint64, f"u_0_{i+1}"),
    Var(sint64, f"v_0_{i+1}"),
    Var(sint64, f"r_0_{i+1}"),
    Var(sint64, f"s_0_{i+1}"),
    Var(bit, "ne"),
    ]

    emit += f"proc divstep_{i}_{case} (\n"

    emit += cl_var_layout(vars, 1)

    rpred = Rpred(
    f"u_0_{i} * f_0_low60_0_low20_0 + v_0_{i} * g_0_low60_0_low20_0 = f_0_low60_0_low20_{i} * (const 64 (-(2**20)))",
    f"r_0_{i} * f_0_low60_0_low20_0 + s_0_{i} * g_0_low60_0_low20_0 = g_0_low60_0_low20_{i} * (const 64 (-(2**20)))",
    f"fuv = f_0_low60_0_low20_{i} + u_0_{i} * (const 64 (2**21)) + v_0_{i} * (const 64 (2**42))",
    f"grs = g_0_low60_0_low20_{i} + r_0_{i} * (const 64 (2**21)) + s_0_{i} * (const 64 (2**42))",
    f"const 64 0 <=s f_0_low60_0_low20_{i}",
    f"f_0_low60_0_low20_{i} <=s (const 64 ((2**20)-1))",
    f"const 64 0 <=s g_0_low60_0_low20_{i}",
    f"g_0_low60_0_low20_{i} <=s (const 64 ((2**20)-1))",
        )
    if i == 0:
        rpred = Rpred(rpred,
        f"fuv = (const 64 1) (mod (const 64 2))",
            )
    else:
        rpred = Rpred(rpred,
        f"fuv = (const 64 1) (mod (const 64 2))",
        f"grs = (uext ne 63) (mod (const 64 2))",
            )


    rpred = Rpred(rpred,
    f"delta = (const 64 1) (mod (const 64 2))",
    f"(const 64 (1 + (-2) * {i})) <=s delta, delta <=s (const 64 (1 + 2*{i}))",
        )

    if i == 0:
        rpred = Rpred(
        rpred,
        "u_0_0 = (const 64 (-(2**20)))",
        "v_0_0 = (const 64 (0))",
        "r_0_0 = (const 64 (0))",
        "s_0_0 = (const 64 (-(2**20)))",
        )
    else:
        rpred = Rpred(
        rpred,
        f"(const 64 (-(2**20))) <=s u_0_{i}, u_0_{i} <=s (const 64 ((2**19)))",
        f"(const 64 (-(2**20))) <=s v_0_{i}, v_0_{i} <=s (const 64 ((2**19) - (2**(20 - {i})) ))",
        f"(const 64 ((2**(20-{i}))-(2**20))) <=s r_0_{i}, r_0_{i} <=s (const 64 ((2**19) - (2**(20 - {i}))))",
        f"(const 64 (-(2**20))) <=s s_0_{i}, s_0_{i} <=s (const 64 ((2**19) - (2**(20 - {i}))))",
        f"(const 64 ((2**(20-{i}))-(2**19))) <=s (r_0_{i} - u_0_{i}), (r_0_{i} - u_0_{i}) <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**19))) <=s (s_0_{i} - v_0_{i}), (s_0_{i} - v_0_{i}) <=s (const 64 ((2**20) - (2**(20 - {i}))))",
        f"u_0_{i} = (const 64 0) (mod (const 64 (2**(20-{i}))))",
        f"v_0_{i} = (const 64 0) (mod (const 64 (2**(20-{i}))))",
        f"r_0_{i} = (const 64 0) (mod (const 64 (2**(20-{i}))))",
        f"s_0_{i} = (const 64 0) (mod (const 64 (2**(20-{i}))))",
        )


    emit += cl_precondition(
        Epred(), 
        rpred
    )


    emit += f"""

// divsteps
// step{i}
"""

    if case == "a":
        emit += f"""
// premise {case}
assume
    g_0_low60_0_low20_{i} = 0 (mod 2)
&&
    g_0_low60_0_low20_{i} = const 64 0 (mod (const 64 2))
;
"""
    elif case == "b":
        emit += f"""
// premise {case}
assume
    g_0_low60_0_low20_{i} = 1 (mod 2)
&&
    g_0_low60_0_low20_{i} = const 64 1 (mod (const 64 2)),
    delta <s (const 64 0)
;
"""
    elif case == "c":
        emit += f"""
// premise {case}
assume
    g_0_low60_0_low20_{i} = 1 (mod 2)
&&
    g_0_low60_0_low20_{i} = const 64 1 (mod (const 64 2)),
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
(* tst	x8, #0x2                                    #! PC = 0xaaaaca660fc8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
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

mov f_0_low60_0_low20_{i+1} f_0_low60_0_low20_{i};
mov u_0_{i+1} u_0_{i};
mov v_0_{i+1} v_0_{i};

asr g_0_low60_0_low20_{i+1} g_0_low60_0_low20_{i} 1;
asr r_0_{i+1} r_0_{i} 1;
asr s_0_{i+1} s_0_{i} 1;
"""

        emit += cl_assert(
            Epred(),
            Rpred([
                f"f_0_low60_0_low20_{i+1} = f_0_low60_0_low20_{i}",
                f"u_0_{i+1} = u_0_{i}",
                f"v_0_{i+1} = v_0_{i}",
                f"g_0_low60_0_low20_{i+1} * (const 64 2) = g_0_low60_0_low20_{i}",
                f"r_0_{i+1} * (const 64 2) = r_0_{i}",
                f"s_0_{i+1} * (const 64 2) = s_0_{i}",
            ])
        )
    elif case == "b":
        emit += f"""
// According to premise {case}

mov f_0_low60_0_low20_{i+1} f_0_low60_0_low20_{i};
mov u_0_{i+1} u_0_{i};
mov v_0_{i+1} v_0_{i};

add g_0_low60_0_low20_{i+1} g_0_low60_0_low20_{i} f_0_low60_0_low20_{i};
asr g_0_low60_0_low20_{i+1} g_0_low60_0_low20_{i+1} 1;
add r_0_{i+1} r_0_{i} u_0_{i};
asr r_0_{i+1} r_0_{i+1} 1;
add s_0_{i+1} s_0_{i} v_0_{i};
asr s_0_{i+1} s_0_{i+1} 1;
"""

        emit += cl_assert(
            Epred(),
            Rpred([
                f"f_0_low60_0_low20_{i+1} = f_0_low60_0_low20_{i}",
                f"u_0_{i+1} = u_0_{i}",
                f"v_0_{i+1} = v_0_{i}",
                f"g_0_low60_0_low20_{i+1} * (const 64 2) = g_0_low60_0_low20_{i} + f_0_low60_0_low20_{i}",
                f"r_0_{i+1} * (const 64 2) = r_0_{i} + u_0_{i}",
                f"s_0_{i+1} * (const 64 2) = s_0_{i} + v_0_{i}",
            ])
        )
    elif case == "c":
        emit += f"""
// According to premise {case}

mov f_0_low60_0_low20_{i+1} g_0_low60_0_low20_{i};
mov u_0_{i+1} r_0_{i};
mov v_0_{i+1} s_0_{i};

subs dc g_0_low60_0_low20_{i+1} g_0_low60_0_low20_{i} f_0_low60_0_low20_{i};
asr g_0_low60_0_low20_{i+1} g_0_low60_0_low20_{i+1} 1;
subs dc r_0_{i+1} r_0_{i} u_0_{i};
asr r_0_{i+1} r_0_{i+1} 1;
subs dc s_0_{i+1} s_0_{i} v_0_{i};
asr s_0_{i+1} s_0_{i+1} 1;
"""

        emit += cl_assert(
            Epred(),
            Rpred([
                f"f_0_low60_0_low20_{i+1} = g_0_low60_0_low20_{i}",
                f"u_0_{i+1} = r_0_{i}",
                f"v_0_{i+1} = s_0_{i}",
                f"g_0_low60_0_low20_{i+1} * (const 64 2) = g_0_low60_0_low20_{i} - f_0_low60_0_low20_{i}",
                f"r_0_{i+1} * (const 64 2) = r_0_{i} - u_0_{i}",
                f"s_0_{i+1} * (const 64 2) = s_0_{i} - v_0_{i}",
            ])
        )

    emit += cl_postcondition(
        Epred(), 
        Rpred(
        f"u_0_{i+1} * f_0_low60_0_low20_0 + v_0_{i+1} * g_0_low60_0_low20_0 = f_0_low60_0_low20_{i+1} * (const 64 (-(2**20)))",
        f"r_0_{i+1} * f_0_low60_0_low20_0 + s_0_{i+1} * g_0_low60_0_low20_0 = g_0_low60_0_low20_{i+1} * (const 64 (-(2**20)))",
        f"fuv = f_0_low60_0_low20_{i+1} + u_0_{i+1} * (const 64 (2**21)) + v_0_{i+1} * (const 64 (2**42))",
        f"grs = g_0_low60_0_low20_{i+1} + r_0_{i+1} * (const 64 (2**21)) + s_0_{i+1} * (const 64 (2**42))",
        f"(const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_{i+1}",
        f"f_0_low60_0_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_{i+1}",
        f"g_0_low60_0_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (1 + (-2) * {i+1})) <=s delta, delta <=s (const 64 (1 + 2*{i+1}))",
        f"(const 64 (-(2**20))) <=s u_0_{i+1}, u_0_{i+1} <=s (const 64 ((2**19)))",
        f"(const 64 (-(2**20))) <=s v_0_{i+1}, v_0_{i+1} <=s (const 64 ((2**19) - (2**(20 - {i+1})) ))",
        f"(const 64 ((2**(20-{i+1}))-(2**20))) <=s r_0_{i+1}, r_0_{i+1} <=s (const 64 ((2**19)))",
        f"(const 64 ((2**(20-{i+1}))-(2**20))) <=s s_0_{i+1}, s_0_{i+1} <=s (const 64 ((2**19) - (2**(20 - {i+1}))))",
        f"(const 64 ((2**(20-{i+1}))-(2**19))) <=s (r_0_{i+1} - u_0_{i+1}), (r_0_{i+1} - u_0_{i+1}) <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**19))) <=s (s_0_{i+1} - v_0_{i+1}), (s_0_{i+1} - v_0_{i+1}) <=s (const 64 ((2**20) - (2**(20 - {i+1}))))",

        f"u_0_{i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"v_0_{i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"r_0_{i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"s_0_{i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        )
    )

    return emit




for i in range(2):
    for case in ["a", "b", "c"]:
        emit = divsep_gen(i,case)
        with open(f"gen/divstep_{i}_{case}.cl", "w") as f:
            f.write(emit)
