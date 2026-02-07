proc divstep_058_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_18,
sint64 g_0_low60_40_low20_18,
sint64 f_0_low60_40_low20_19,
sint64 g_0_low60_40_low20_19,
sint64 u_40_58,
sint64 v_40_58,
sint64 r_40_58,
sint64 s_40_58,
sint64 u_40_59,
sint64 v_40_59,
sint64 r_40_59,
sint64 s_40_59,
bit ne
)={
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (-(2**20)),
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (-(2**20))
&&
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (const 64 (-(2**20))),
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_18 + u_40_58 * (const 64 (2**21)) + v_40_58 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_18 + r_40_58 * (const 64 (2**21)) + s_40_58 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_18,
    f_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_18,
    g_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 58)) <=s delta, delta <=s (const 64 (1 + 2*58)),
    (const 64 (-(2**20))) <=s u_40_58, u_40_58 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_40_58, v_40_58 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_40_58, r_40_58 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_40_58, s_40_58 <=s (const 64 ((2**20))),
    u_40_58 + v_40_58 <=s (const 64 (2**20)),
    u_40_58 - v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 + v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 - v_40_58 <=s (const 64 (2**20)),
    r_40_58 + s_40_58 <=s (const 64 (2**20)),
    r_40_58 - s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 + s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 - s_40_58 <=s (const 64 (2**20)),
    u_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_40_58 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise c
assume
g_0_low60_40_low20_18 = 1 (mod 2)
&&
g_0_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_19 g_0_low60_40_low20_18;
mov u_40_59 r_40_58;
mov v_40_59 s_40_58;

subs dc g_0_low60_40_low20_19 g_0_low60_40_low20_18 f_0_low60_40_low20_18;
asr g_0_low60_40_low20_19 g_0_low60_40_low20_19 1;
subs dc r_40_59 r_40_58 u_40_58;
asr r_40_59 r_40_59 1;
subs dc s_40_59 s_40_58 v_40_58;
asr s_40_59 s_40_59 1;
assert
    true
&&
    f_0_low60_40_low20_19 = g_0_low60_40_low20_18,
    u_40_59 = r_40_58,
    v_40_59 = s_40_58,
    g_0_low60_40_low20_19 * (const 64 2) = g_0_low60_40_low20_18 - f_0_low60_40_low20_18,
    r_40_59 * (const 64 2) = r_40_58 - u_40_58,
    s_40_59 * (const 64 2) = s_40_58 - v_40_58
;

assume
    f_0_low60_40_low20_19 = g_0_low60_40_low20_18,
    u_40_59 = r_40_58,
    v_40_59 = s_40_58,
    g_0_low60_40_low20_19 * 2 = g_0_low60_40_low20_18 - f_0_low60_40_low20_18,
    r_40_59 * 2 = r_40_58 - u_40_58,
    s_40_59 * 2 = s_40_58 - v_40_58
&&
    true
;

{
    u_40_59 * f_0_low60_40_low20_0 + v_40_59 * g_0_low60_40_low20_0 = f_0_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_59 * f_0_low60_40_low20_0 + s_40_59 * g_0_low60_40_low20_0 = g_0_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_19 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_19 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_19,
    f_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_19,
    g_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20))),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_40_59 = (const 64 0) (mod (const 64 (2**(20-19))))
}

