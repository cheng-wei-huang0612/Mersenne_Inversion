from gen_cl import *



emit = ""


i = 0
case = "a"


vars = [
Var(sint64, "fuv"),
Var(sint64, "grs"),
Var(sint64, "delta"),
Var(sint64, "f_0_low60_0_low20_0"),
Var(sint64, "g_0_low60_0_low20_0"),
Var(sint64, "f_0_low60_0_low20_1"),
Var(sint64, "g_0_low60_0_low20_1"),
Var(sint64, "u_0_0"),
Var(sint64, "v_0_0"),
Var(sint64, "r_0_0"),
Var(sint64, "s_0_0"),
Var(sint64, "u_0_1"),
Var(sint64, "v_0_1"),
Var(sint64, "r_0_1"),
Var(sint64, "s_0_1"),
]

emit += f"""
proc divstep_{i}_{case} (
"""

emit += cl_var_layout(vars, 1)

emit += cl_precondition(
    Epred(), 
    Rpred(
"u_0_0 * f_0_low60_0_low20_0 + v_0_0 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (const 64 (-(2**20)))",
"r_0_0 * f_0_low60_0_low20_0 + s_0_0 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (const 64 (-(2**20)))",
"fuv = f_0_low60_0_low20_0 + u_0_0 * (const 64 (2**21)) + v_0_0 * (const 64 (2**42))",
"grs = g_0_low60_0_low20_0 + r_0_0 * (const 64 (2**21)) + s_0_0 * (const 64 (2**42))",
"const 64 0 <=s f_0_low60_0_low20_0",
"f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1))",
"const 64 0 <=s g_0_low60_0_low20_0",
"g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1))",
"fuv = (const 64 1) (mod (const 64 2))",
"delta = (const 64 1)",
"u_0_0 = (const 64 (-(2**20)))",
"v_0_0 = (const 64 (0))",
"r_0_0 = (const 64 (0))",
"s_0_0 = (const 64 (-(2**20)))",
    )
)


emit += f"""

// divsteps
// step{i}
"""

if case == "a":
    emit += f"""
    // premise {case}
    assume 
        g_0_low60_0_low20_0 = 0 (mod 2)
    &&
        g_0_low60_0_low20_0 = const 64 0 (mod (const 64 2))
    ;
    """
elif case == "b":
    emit += f"""
    // premise {case}
    assume 
        g_0_low60_0_low20_0 = 1 (mod 2)
    &&
        g_0_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
        delta <s 0
    ;
    """
elif case == "c":
    emit += f"""
    // premise {case}
    assume 
        g_0_low60_0_low20_0 = 1 (mod 2)
    &&
        g_0_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
        delta >=s 0
    ;
    """

emit += f"""

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* tst	x8, #0x1                                    #! PC = 0xaaaaca660fa8 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
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

assert true &&
    grs = (const 64 0) (mod (const 64 2)),

    x7 = fuv,
    x8 * (const 64 2) = grs,
    x3 = (const 64 2) + delta
;

mov fuv x7;
mov grs x8;
mov delta x3;
"""


emit += f"""

// According to premise {case}

mov f_0_low60_0_low20_1 f_0_low60_0_low20_0;
mov u_0_1 u_0_0;
mov v_0_1 v_0_0;

asr g_0_low60_0_low20_1 g_0_low60_0_low20_0 1;
asr r_0_1 r_0_0 1;
asr s_0_1 s_0_0 1;

"""

emit += cl_assert(
    Epred([
        "f_0_low60_0_low20_1 = f_0_low60_0_low20_0",
        "u_0_1 = u_0_0",
        "v_0_1 = v_0_0",
        "g_0_low60_0_low20_1 * 2 = g_0_low60_0_low20_0",
        "r_0_1 * 2 = r_0_0",
        "s_0_1 * 2 = s_0_0",
    ]),
    Rpred([
        "f_0_low60_0_low20_1 = f_0_low60_0_low20_0",
        "u_0_1 = u_0_0",
        "v_0_1 = v_0_0",
        "g_0_low60_0_low20_1 * (const 64 2) = g_0_low60_0_low20_0",
        "r_0_1 * (const 64 2) = r_0_0",
        "s_0_1 * (const 64 2) = s_0_0",
    ])
)
#
# emit += cl_assert(
#     Epred(
# "u_0_1 * 2 * f_0_low60_0_low20_0 + v_0_1 * 2 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (-(2**21))",
# "r_0_1 * 2 * f_0_low60_0_low20_0 + s_0_1 * 2 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (-(2**21))",
#     ),
#     Rpred()
# )
# emit += cl_assume(
#     Epred(
# "u_0_1 * f_0_low60_0_low20_0 + v_0_1 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (-(2**20))",
# "r_0_1 * f_0_low60_0_low20_0 + s_0_1 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (-(2**20))",
#     ),
#     Rpred()
# )
#
#
#


emit += cl_postcondition(
    Epred(
# "u_0_1 * f_0_low60_0_low20_0 + v_0_1 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (-(2**20))",
# "r_0_1 * f_0_low60_0_low20_0 + s_0_1 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (-(2**20))",
    ), 
    Rpred(
"u_0_1 * f_0_low60_0_low20_0 + v_0_1 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (const 64 (-(2**20)))",
"r_0_1 * f_0_low60_0_low20_0 + s_0_1 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (const 64 (-(2**20)))",
"fuv = f_0_low60_0_low20_1 + u_0_1 * (const 64 (2**21)) + v_0_1 * (const 64 (2**42))",
"grs = g_0_low60_0_low20_1 + r_0_1 * (const 64 (2**21)) + s_0_1 * (const 64 (2**42))",
"(const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_1",
"f_0_low60_0_low20_1 <=s (const 64 ((2**20)-1))",
"(const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_1",
"g_0_low60_0_low20_1 <=s (const 64 ((2**20)-1))",
"fuv = (const 64 1) (mod (const 64 2))",
f"(const 64 (1 + (-2) * {i+1})) <=s delta, delta <=s (const 64 (1 + 2*{i+1}))",
# "u_0_0 = (const 64 (-(2**20)))",
# "v_0_0 = (const 64 (0))",
# "r_0_0 = (const 64 (0))",
# "s_0_0 = (const 64 (-(2**20)))",
    )
)





with open(f"gen/divstep_{i}_{case}.cl", "w") as f:
    f.write(emit)
