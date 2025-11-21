proc divstep_134_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_16,
sint64 g_118_low60_0_low20_16,
sint64 f_118_low60_0_low20_17,
sint64 g_118_low60_0_low20_17,
sint64 u_118_134,
sint64 v_118_134,
sint64 r_118_134,
sint64 s_118_134,
sint64 u_118_135,
sint64 v_118_135,
sint64 r_118_135,
sint64 s_118_135,
bit ne
)={
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (-(2**20)),
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (-(2**20))
&&
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (const 64 (-(2**20))),
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_16 + u_118_134 * (const 64 (2**21)) + v_118_134 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_16 + r_118_134 * (const 64 (2**21)) + s_118_134 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_16,
    f_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_16,
    g_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 134)) <=s delta, delta <=s (const 64 (1 + 2*134)),
    (const 64 (-(2**20))) <=s u_118_134, u_118_134 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_118_134, v_118_134 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_118_134, r_118_134 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_118_134, s_118_134 <=s (const 64 ((2**20))),
    u_118_134 + v_118_134 <=s (const 64 (2**20)),
    u_118_134 - v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 + v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 - v_118_134 <=s (const 64 (2**20)),
    r_118_134 + s_118_134 <=s (const 64 (2**20)),
    r_118_134 - s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 + s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 - s_118_134 <=s (const 64 (2**20)),
    u_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_118_134 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step16

// premise c
assume
g_118_low60_0_low20_16 = 1 (mod 2)
&&
g_118_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
delta >=s (const 64 0)
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

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

// premise c
assert true &&
    x7 = grs,
    x8 * (const 64 2) = grs - fuv,
    x3 = (const 64 2) - delta
;


mov fuv x7;
mov grs x8;
mov delta x3;

// According to premise c

mov f_118_low60_0_low20_17 g_118_low60_0_low20_16;
mov u_118_135 r_118_134;
mov v_118_135 s_118_134;

subs dc g_118_low60_0_low20_17 g_118_low60_0_low20_16 f_118_low60_0_low20_16;
asr g_118_low60_0_low20_17 g_118_low60_0_low20_17 1;
subs dc r_118_135 r_118_134 u_118_134;
asr r_118_135 r_118_135 1;
subs dc s_118_135 s_118_134 v_118_134;
asr s_118_135 s_118_135 1;
assert
    true
&&
    f_118_low60_0_low20_17 = g_118_low60_0_low20_16,
    u_118_135 = r_118_134,
    v_118_135 = s_118_134,
    g_118_low60_0_low20_17 * (const 64 2) = g_118_low60_0_low20_16 - f_118_low60_0_low20_16,
    r_118_135 * (const 64 2) = r_118_134 - u_118_134,
    s_118_135 * (const 64 2) = s_118_134 - v_118_134
;

assume
    f_118_low60_0_low20_17 = g_118_low60_0_low20_16,
    u_118_135 = r_118_134,
    v_118_135 = s_118_134,
    g_118_low60_0_low20_17 * 2 = g_118_low60_0_low20_16 - f_118_low60_0_low20_16,
    r_118_135 * 2 = r_118_134 - u_118_134,
    s_118_135 * 2 = s_118_134 - v_118_134
&&
    true
;

{
    u_118_135 * f_118_low60_0_low20_0 + v_118_135 * g_118_low60_0_low20_0 = f_118_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_135 * f_118_low60_0_low20_0 + s_118_135 * g_118_low60_0_low20_0 = g_118_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_17 + u_118_135 * (const 64 (2**21)) + v_118_135 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_17 + r_118_135 * (const 64 (2**21)) + s_118_135 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_17,
    f_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_17,
    g_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 135)) <=s delta, delta <=s (const 64 (1 + 2*135)),
    (const 64 (-(2**20))) <=s u_118_135, u_118_135 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_118_135, v_118_135 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_118_135, r_118_135 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_118_135, s_118_135 <=s (const 64 ((2**20))),
    u_118_135 + v_118_135 <=s (const 64 (2**20)),
    u_118_135 - v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 + v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 - v_118_135 <=s (const 64 (2**20)),
    r_118_135 + s_118_135 <=s (const 64 (2**20)),
    r_118_135 - s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 + s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 - s_118_135 <=s (const 64 (2**20)),
    u_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_118_135 = (const 64 0) (mod (const 64 (2**(20-17))))
}

