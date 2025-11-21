proc divstep_466_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_13,
sint64 neg_g_413_low60_40_low20_13,
sint64 neg_f_413_low60_40_low20_14,
sint64 neg_g_413_low60_40_low20_14,
sint64 u_453_466,
sint64 v_453_466,
sint64 r_453_466,
sint64 s_453_466,
sint64 u_453_467,
sint64 v_453_467,
sint64 r_453_467,
sint64 s_453_467,
bit ne
)={
    u_453_466 * neg_f_413_low60_40_low20_0 + v_453_466 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_13 * (-(2**20)),
    r_453_466 * neg_f_413_low60_40_low20_0 + s_453_466 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_13 * (-(2**20))
&&
    u_453_466 * neg_f_413_low60_40_low20_0 + v_453_466 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_13 * (const 64 (-(2**20))),
    r_453_466 * neg_f_413_low60_40_low20_0 + s_453_466 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_13 + u_453_466 * (const 64 (2**21)) + v_453_466 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_13 + r_453_466 * (const 64 (2**21)) + s_453_466 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_13,
    neg_f_413_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_13,
    neg_g_413_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 466)) <=s delta, delta <=s (const 64 (1 + 2*466)),
    (const 64 (-(2**20))) <=s u_453_466, u_453_466 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_466, v_453_466 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_466, r_453_466 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_466, s_453_466 <=s (const 64 ((2**20))),
    u_453_466 + v_453_466 <=s (const 64 (2**20)),
    u_453_466 - v_453_466 <=s (const 64 (2**20)),
    (const 64 0) - u_453_466 + v_453_466 <=s (const 64 (2**20)),
    (const 64 0) - u_453_466 - v_453_466 <=s (const 64 (2**20)),
    r_453_466 + s_453_466 <=s (const 64 (2**20)),
    r_453_466 - s_453_466 <=s (const 64 (2**20)),
    (const 64 0) - r_453_466 + s_453_466 <=s (const 64 (2**20)),
    (const 64 0) - r_453_466 - s_453_466 <=s (const 64 (2**20)),
    u_453_466 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_453_466 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_453_466 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_453_466 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step466

// premise b
assume
neg_g_413_low60_40_low20_13 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
delta <s (const 64 0)
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

// premise b
assert true &&
    x7 = fuv,
    x8 * (const 64 2) = grs + fuv,
    x3 = (const 64 2) + delta
;


mov fuv x7;
mov grs x8;
mov delta x3;

// According to premise b

mov neg_f_413_low60_40_low20_14 neg_f_413_low60_40_low20_13;
mov u_453_467 u_453_466;
mov v_453_467 v_453_466;

add neg_g_413_low60_40_low20_14 neg_g_413_low60_40_low20_13 neg_f_413_low60_40_low20_13;
asr neg_g_413_low60_40_low20_14 neg_g_413_low60_40_low20_14 1;
add r_453_467 r_453_466 u_453_466;
asr r_453_467 r_453_467 1;
add s_453_467 s_453_466 v_453_466;
asr s_453_467 s_453_467 1;
assert
    true
&&
    neg_f_413_low60_40_low20_14 = neg_f_413_low60_40_low20_13,
    u_453_467 = u_453_466,
    v_453_467 = v_453_466,
    neg_g_413_low60_40_low20_14 * (const 64 2) = neg_g_413_low60_40_low20_13 + neg_f_413_low60_40_low20_13,
    r_453_467 * (const 64 2) = r_453_466 + u_453_466,
    s_453_467 * (const 64 2) = s_453_466 + v_453_466
;

assume
    neg_f_413_low60_40_low20_14 = neg_f_413_low60_40_low20_13,
    u_453_467 = u_453_466,
    v_453_467 = v_453_466,
    neg_g_413_low60_40_low20_14 * 2 = neg_g_413_low60_40_low20_13 + neg_f_413_low60_40_low20_13,
    r_453_467 * 2 = r_453_466 + u_453_466,
    s_453_467 * 2 = s_453_466 + v_453_466
&&
    true
;

{
    u_453_467 * neg_f_413_low60_40_low20_0 + v_453_467 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_467 * neg_f_413_low60_40_low20_0 + s_453_467 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_14 + u_453_467 * (const 64 (2**21)) + v_453_467 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_14 + r_453_467 * (const 64 (2**21)) + s_453_467 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_14,
    neg_f_413_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_14,
    neg_g_413_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 467)) <=s delta, delta <=s (const 64 (1 + 2*467)),
    (const 64 (-(2**20))) <=s u_453_467, u_453_467 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_467, v_453_467 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_467, r_453_467 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_467, s_453_467 <=s (const 64 ((2**20))),
    u_453_467 + v_453_467 <=s (const 64 (2**20)),
    u_453_467 - v_453_467 <=s (const 64 (2**20)),
    (const 64 0) - u_453_467 + v_453_467 <=s (const 64 (2**20)),
    (const 64 0) - u_453_467 - v_453_467 <=s (const 64 (2**20)),
    r_453_467 + s_453_467 <=s (const 64 (2**20)),
    r_453_467 - s_453_467 <=s (const 64 (2**20)),
    (const 64 0) - r_453_467 + s_453_467 <=s (const 64 (2**20)),
    (const 64 0) - r_453_467 - s_453_467 <=s (const 64 (2**20)),
    u_453_467 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_453_467 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_453_467 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_453_467 = (const 64 0) (mod (const 64 (2**(20-14))))
}

