proc divstep_267_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_11,
sint64 neg_g_236_low60_20_low20_11,
sint64 neg_f_236_low60_20_low20_12,
sint64 neg_g_236_low60_20_low20_12,
sint64 u_256_267,
sint64 v_256_267,
sint64 r_256_267,
sint64 s_256_267,
sint64 u_256_268,
sint64 v_256_268,
sint64 r_256_268,
sint64 s_256_268,
bit ne
)={
    u_256_267 * neg_f_236_low60_20_low20_0 + v_256_267 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_11 * (-(2**20)),
    r_256_267 * neg_f_236_low60_20_low20_0 + s_256_267 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_11 * (-(2**20))
&&
    u_256_267 * neg_f_236_low60_20_low20_0 + v_256_267 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_11 * (const 64 (-(2**20))),
    r_256_267 * neg_f_236_low60_20_low20_0 + s_256_267 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_11 + u_256_267 * (const 64 (2**21)) + v_256_267 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_11 + r_256_267 * (const 64 (2**21)) + s_256_267 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_11,
    neg_f_236_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_11,
    neg_g_236_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 267)) <=s delta, delta <=s (const 64 (1 + 2*267)),
    (const 64 (-(2**20))) <=s u_256_267, u_256_267 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_267, v_256_267 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_267, r_256_267 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_267, s_256_267 <=s (const 64 ((2**20))),
    u_256_267 + v_256_267 <=s (const 64 (2**20)),
    u_256_267 - v_256_267 <=s (const 64 (2**20)),
    (const 64 0) - u_256_267 + v_256_267 <=s (const 64 (2**20)),
    (const 64 0) - u_256_267 - v_256_267 <=s (const 64 (2**20)),
    r_256_267 + s_256_267 <=s (const 64 (2**20)),
    r_256_267 - s_256_267 <=s (const 64 (2**20)),
    (const 64 0) - r_256_267 + s_256_267 <=s (const 64 (2**20)),
    (const 64 0) - r_256_267 - s_256_267 <=s (const 64 (2**20)),
    u_256_267 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_256_267 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_256_267 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_256_267 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step267

// premise a
assume
neg_g_236_low60_20_low20_11 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_11 = const 64 0 (mod (const 64 2))
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

// premise a
assert true &&
    x7 = fuv,
    x8 * (const 64 2) = grs,
    x3 = (const 64 2) + delta
;


mov fuv x7;
mov grs x8;
mov delta x3;

// According to premise a

mov neg_f_236_low60_20_low20_12 neg_f_236_low60_20_low20_11;
mov u_256_268 u_256_267;
mov v_256_268 v_256_267;

asr neg_g_236_low60_20_low20_12 neg_g_236_low60_20_low20_11 1;
asr r_256_268 r_256_267 1;
asr s_256_268 s_256_267 1;
assert
    true
&&
    neg_f_236_low60_20_low20_12 = neg_f_236_low60_20_low20_11,
    u_256_268 = u_256_267,
    v_256_268 = v_256_267,
    neg_g_236_low60_20_low20_12 * (const 64 2) = neg_g_236_low60_20_low20_11,
    r_256_268 * (const 64 2) = r_256_267,
    s_256_268 * (const 64 2) = s_256_267
;

assume
    neg_f_236_low60_20_low20_12 = neg_f_236_low60_20_low20_11,
    u_256_268 = u_256_267,
    v_256_268 = v_256_267,
    neg_g_236_low60_20_low20_12 * 2 = neg_g_236_low60_20_low20_11,
    r_256_268 * 2 = r_256_267,
    s_256_268 * 2 = s_256_267
&&
    true
;

{
    u_256_268 * neg_f_236_low60_20_low20_0 + v_256_268 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_268 * neg_f_236_low60_20_low20_0 + s_256_268 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_12 + u_256_268 * (const 64 (2**21)) + v_256_268 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_12 + r_256_268 * (const 64 (2**21)) + s_256_268 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_12,
    neg_f_236_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_12,
    neg_g_236_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 268)) <=s delta, delta <=s (const 64 (1 + 2*268)),
    (const 64 (-(2**20))) <=s u_256_268, u_256_268 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_268, v_256_268 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_268, r_256_268 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_268, s_256_268 <=s (const 64 ((2**20))),
    u_256_268 + v_256_268 <=s (const 64 (2**20)),
    u_256_268 - v_256_268 <=s (const 64 (2**20)),
    (const 64 0) - u_256_268 + v_256_268 <=s (const 64 (2**20)),
    (const 64 0) - u_256_268 - v_256_268 <=s (const 64 (2**20)),
    r_256_268 + s_256_268 <=s (const 64 (2**20)),
    r_256_268 - s_256_268 <=s (const 64 (2**20)),
    (const 64 0) - r_256_268 + s_256_268 <=s (const 64 (2**20)),
    (const 64 0) - r_256_268 - s_256_268 <=s (const 64 (2**20)),
    u_256_268 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_256_268 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_256_268 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_256_268 = (const 64 0) (mod (const 64 (2**(20-12))))
}

