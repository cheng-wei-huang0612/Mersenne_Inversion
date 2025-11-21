proc divstep_413_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_1,
sint64 neg_g_413_low60_0_low20_1,
sint64 u_413_413,
sint64 v_413_413,
sint64 r_413_413,
sint64 s_413_413,
sint64 u_413_414,
sint64 v_413_414,
sint64 r_413_414,
sint64 s_413_414,
bit ne
)={
    u_413_413 * neg_f_413_low60_0_low20_0 + v_413_413 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_0 * (-(2**20)),
    r_413_413 * neg_f_413_low60_0_low20_0 + s_413_413 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_0 * (-(2**20))
&&
    u_413_413 * neg_f_413_low60_0_low20_0 + v_413_413 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_0 * (const 64 (-(2**20))),
    r_413_413 * neg_f_413_low60_0_low20_0 + s_413_413 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_0 + u_413_413 * (const 64 (2**21)) + v_413_413 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_0 + r_413_413 * (const 64 (2**21)) + s_413_413 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 413)) <=s delta, delta <=s (const 64 (1 + 2*413)),
    u_413_413 = (const 64 (-(2**20))),
    v_413_413 = (const 64 (0)),
    r_413_413 = (const 64 (0)),
    s_413_413 = (const 64 (-(2**20)))
}



// divsteps
// step413

// premise a
assume
neg_g_413_low60_0_low20_0 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_0 = const 64 0 (mod (const 64 2))
;


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

mov neg_f_413_low60_0_low20_1 neg_f_413_low60_0_low20_0;
mov u_413_414 u_413_413;
mov v_413_414 v_413_413;

asr neg_g_413_low60_0_low20_1 neg_g_413_low60_0_low20_0 1;
asr r_413_414 r_413_413 1;
asr s_413_414 s_413_413 1;
assert
    true
&&
    neg_f_413_low60_0_low20_1 = neg_f_413_low60_0_low20_0,
    u_413_414 = u_413_413,
    v_413_414 = v_413_413,
    neg_g_413_low60_0_low20_1 * (const 64 2) = neg_g_413_low60_0_low20_0,
    r_413_414 * (const 64 2) = r_413_413,
    s_413_414 * (const 64 2) = s_413_413
;

assume
    neg_f_413_low60_0_low20_1 = neg_f_413_low60_0_low20_0,
    u_413_414 = u_413_413,
    v_413_414 = v_413_413,
    neg_g_413_low60_0_low20_1 * 2 = neg_g_413_low60_0_low20_0,
    r_413_414 * 2 = r_413_413,
    s_413_414 * 2 = s_413_413
&&
    true
;

{
    u_413_414 * neg_f_413_low60_0_low20_0 + v_413_414 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_414 * neg_f_413_low60_0_low20_0 + s_413_414 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_1 + u_413_414 * (const 64 (2**21)) + v_413_414 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_1 + r_413_414 * (const 64 (2**21)) + s_413_414 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_1,
    neg_f_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_1,
    neg_g_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 414)) <=s delta, delta <=s (const 64 (1 + 2*414)),
    (const 64 (-(2**20))) <=s u_413_414, u_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_414, v_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_414, r_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_414, s_413_414 <=s (const 64 ((2**20))),
    u_413_414 + v_413_414 <=s (const 64 (2**20)),
    u_413_414 - v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 + v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 - v_413_414 <=s (const 64 (2**20)),
    r_413_414 + s_413_414 <=s (const 64 (2**20)),
    r_413_414 - s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 + s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 - s_413_414 <=s (const 64 (2**20)),
    u_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_413_414 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_413_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_1,
sint64 neg_g_413_low60_0_low20_1,
sint64 u_413_413,
sint64 v_413_413,
sint64 r_413_413,
sint64 s_413_413,
sint64 u_413_414,
sint64 v_413_414,
sint64 r_413_414,
sint64 s_413_414,
bit ne
)={
    u_413_413 * neg_f_413_low60_0_low20_0 + v_413_413 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_0 * (-(2**20)),
    r_413_413 * neg_f_413_low60_0_low20_0 + s_413_413 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_0 * (-(2**20))
&&
    u_413_413 * neg_f_413_low60_0_low20_0 + v_413_413 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_0 * (const 64 (-(2**20))),
    r_413_413 * neg_f_413_low60_0_low20_0 + s_413_413 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_0 + u_413_413 * (const 64 (2**21)) + v_413_413 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_0 + r_413_413 * (const 64 (2**21)) + s_413_413 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 413)) <=s delta, delta <=s (const 64 (1 + 2*413)),
    u_413_413 = (const 64 (-(2**20))),
    v_413_413 = (const 64 (0)),
    r_413_413 = (const 64 (0)),
    s_413_413 = (const 64 (-(2**20)))
}



// divsteps
// step413

// premise b
assume
neg_g_413_low60_0_low20_0 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
delta <s (const 64 0)
;


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

mov neg_f_413_low60_0_low20_1 neg_f_413_low60_0_low20_0;
mov u_413_414 u_413_413;
mov v_413_414 v_413_413;

add neg_g_413_low60_0_low20_1 neg_g_413_low60_0_low20_0 neg_f_413_low60_0_low20_0;
asr neg_g_413_low60_0_low20_1 neg_g_413_low60_0_low20_1 1;
add r_413_414 r_413_413 u_413_413;
asr r_413_414 r_413_414 1;
add s_413_414 s_413_413 v_413_413;
asr s_413_414 s_413_414 1;
assert
    true
&&
    neg_f_413_low60_0_low20_1 = neg_f_413_low60_0_low20_0,
    u_413_414 = u_413_413,
    v_413_414 = v_413_413,
    neg_g_413_low60_0_low20_1 * (const 64 2) = neg_g_413_low60_0_low20_0 + neg_f_413_low60_0_low20_0,
    r_413_414 * (const 64 2) = r_413_413 + u_413_413,
    s_413_414 * (const 64 2) = s_413_413 + v_413_413
;

assume
    neg_f_413_low60_0_low20_1 = neg_f_413_low60_0_low20_0,
    u_413_414 = u_413_413,
    v_413_414 = v_413_413,
    neg_g_413_low60_0_low20_1 * 2 = neg_g_413_low60_0_low20_0 + neg_f_413_low60_0_low20_0,
    r_413_414 * 2 = r_413_413 + u_413_413,
    s_413_414 * 2 = s_413_413 + v_413_413
&&
    true
;

{
    u_413_414 * neg_f_413_low60_0_low20_0 + v_413_414 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_414 * neg_f_413_low60_0_low20_0 + s_413_414 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_1 + u_413_414 * (const 64 (2**21)) + v_413_414 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_1 + r_413_414 * (const 64 (2**21)) + s_413_414 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_1,
    neg_f_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_1,
    neg_g_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 414)) <=s delta, delta <=s (const 64 (1 + 2*414)),
    (const 64 (-(2**20))) <=s u_413_414, u_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_414, v_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_414, r_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_414, s_413_414 <=s (const 64 ((2**20))),
    u_413_414 + v_413_414 <=s (const 64 (2**20)),
    u_413_414 - v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 + v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 - v_413_414 <=s (const 64 (2**20)),
    r_413_414 + s_413_414 <=s (const 64 (2**20)),
    r_413_414 - s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 + s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 - s_413_414 <=s (const 64 (2**20)),
    u_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_413_414 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_413_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_1,
sint64 neg_g_413_low60_0_low20_1,
sint64 u_413_413,
sint64 v_413_413,
sint64 r_413_413,
sint64 s_413_413,
sint64 u_413_414,
sint64 v_413_414,
sint64 r_413_414,
sint64 s_413_414,
bit ne
)={
    u_413_413 * neg_f_413_low60_0_low20_0 + v_413_413 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_0 * (-(2**20)),
    r_413_413 * neg_f_413_low60_0_low20_0 + s_413_413 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_0 * (-(2**20))
&&
    u_413_413 * neg_f_413_low60_0_low20_0 + v_413_413 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_0 * (const 64 (-(2**20))),
    r_413_413 * neg_f_413_low60_0_low20_0 + s_413_413 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_0 + u_413_413 * (const 64 (2**21)) + v_413_413 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_0 + r_413_413 * (const 64 (2**21)) + s_413_413 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 413)) <=s delta, delta <=s (const 64 (1 + 2*413)),
    u_413_413 = (const 64 (-(2**20))),
    v_413_413 = (const 64 (0)),
    r_413_413 = (const 64 (0)),
    s_413_413 = (const 64 (-(2**20)))
}



// divsteps
// step413

// premise c
assume
neg_g_413_low60_0_low20_0 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
delta >=s (const 64 0)
;


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

mov neg_f_413_low60_0_low20_1 neg_g_413_low60_0_low20_0;
mov u_413_414 r_413_413;
mov v_413_414 s_413_413;

subs dc neg_g_413_low60_0_low20_1 neg_g_413_low60_0_low20_0 neg_f_413_low60_0_low20_0;
asr neg_g_413_low60_0_low20_1 neg_g_413_low60_0_low20_1 1;
subs dc r_413_414 r_413_413 u_413_413;
asr r_413_414 r_413_414 1;
subs dc s_413_414 s_413_413 v_413_413;
asr s_413_414 s_413_414 1;
assert
    true
&&
    neg_f_413_low60_0_low20_1 = neg_g_413_low60_0_low20_0,
    u_413_414 = r_413_413,
    v_413_414 = s_413_413,
    neg_g_413_low60_0_low20_1 * (const 64 2) = neg_g_413_low60_0_low20_0 - neg_f_413_low60_0_low20_0,
    r_413_414 * (const 64 2) = r_413_413 - u_413_413,
    s_413_414 * (const 64 2) = s_413_413 - v_413_413
;

assume
    neg_f_413_low60_0_low20_1 = neg_g_413_low60_0_low20_0,
    u_413_414 = r_413_413,
    v_413_414 = s_413_413,
    neg_g_413_low60_0_low20_1 * 2 = neg_g_413_low60_0_low20_0 - neg_f_413_low60_0_low20_0,
    r_413_414 * 2 = r_413_413 - u_413_413,
    s_413_414 * 2 = s_413_413 - v_413_413
&&
    true
;

{
    u_413_414 * neg_f_413_low60_0_low20_0 + v_413_414 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_414 * neg_f_413_low60_0_low20_0 + s_413_414 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_1 + u_413_414 * (const 64 (2**21)) + v_413_414 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_1 + r_413_414 * (const 64 (2**21)) + s_413_414 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_1,
    neg_f_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_1,
    neg_g_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 414)) <=s delta, delta <=s (const 64 (1 + 2*414)),
    (const 64 (-(2**20))) <=s u_413_414, u_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_414, v_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_414, r_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_414, s_413_414 <=s (const 64 ((2**20))),
    u_413_414 + v_413_414 <=s (const 64 (2**20)),
    u_413_414 - v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 + v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 - v_413_414 <=s (const 64 (2**20)),
    r_413_414 + s_413_414 <=s (const 64 (2**20)),
    r_413_414 - s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 + s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 - s_413_414 <=s (const 64 (2**20)),
    u_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_413_414 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_414_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_1,
sint64 neg_g_413_low60_0_low20_1,
sint64 neg_f_413_low60_0_low20_2,
sint64 neg_g_413_low60_0_low20_2,
sint64 u_413_414,
sint64 v_413_414,
sint64 r_413_414,
sint64 s_413_414,
sint64 u_413_415,
sint64 v_413_415,
sint64 r_413_415,
sint64 s_413_415,
bit ne
)={
    u_413_414 * neg_f_413_low60_0_low20_0 + v_413_414 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_1 * (-(2**20)),
    r_413_414 * neg_f_413_low60_0_low20_0 + s_413_414 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_1 * (-(2**20))
&&
    u_413_414 * neg_f_413_low60_0_low20_0 + v_413_414 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_1 * (const 64 (-(2**20))),
    r_413_414 * neg_f_413_low60_0_low20_0 + s_413_414 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_1 + u_413_414 * (const 64 (2**21)) + v_413_414 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_1 + r_413_414 * (const 64 (2**21)) + s_413_414 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_1,
    neg_f_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_1,
    neg_g_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 414)) <=s delta, delta <=s (const 64 (1 + 2*414)),
    (const 64 (-(2**20))) <=s u_413_414, u_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_414, v_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_414, r_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_414, s_413_414 <=s (const 64 ((2**20))),
    u_413_414 + v_413_414 <=s (const 64 (2**20)),
    u_413_414 - v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 + v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 - v_413_414 <=s (const 64 (2**20)),
    r_413_414 + s_413_414 <=s (const 64 (2**20)),
    r_413_414 - s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 + s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 - s_413_414 <=s (const 64 (2**20)),
    u_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_413_414 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step414

// premise a
assume
neg_g_413_low60_0_low20_1 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_1 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_2 neg_f_413_low60_0_low20_1;
mov u_413_415 u_413_414;
mov v_413_415 v_413_414;

asr neg_g_413_low60_0_low20_2 neg_g_413_low60_0_low20_1 1;
asr r_413_415 r_413_414 1;
asr s_413_415 s_413_414 1;
assert
    true
&&
    neg_f_413_low60_0_low20_2 = neg_f_413_low60_0_low20_1,
    u_413_415 = u_413_414,
    v_413_415 = v_413_414,
    neg_g_413_low60_0_low20_2 * (const 64 2) = neg_g_413_low60_0_low20_1,
    r_413_415 * (const 64 2) = r_413_414,
    s_413_415 * (const 64 2) = s_413_414
;

assume
    neg_f_413_low60_0_low20_2 = neg_f_413_low60_0_low20_1,
    u_413_415 = u_413_414,
    v_413_415 = v_413_414,
    neg_g_413_low60_0_low20_2 * 2 = neg_g_413_low60_0_low20_1,
    r_413_415 * 2 = r_413_414,
    s_413_415 * 2 = s_413_414
&&
    true
;

{
    u_413_415 * neg_f_413_low60_0_low20_0 + v_413_415 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_415 * neg_f_413_low60_0_low20_0 + s_413_415 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_2 + u_413_415 * (const 64 (2**21)) + v_413_415 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_2 + r_413_415 * (const 64 (2**21)) + s_413_415 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_2,
    neg_f_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_2,
    neg_g_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 415)) <=s delta, delta <=s (const 64 (1 + 2*415)),
    (const 64 (-(2**20))) <=s u_413_415, u_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_415, v_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_415, r_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_415, s_413_415 <=s (const 64 ((2**20))),
    u_413_415 + v_413_415 <=s (const 64 (2**20)),
    u_413_415 - v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 + v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 - v_413_415 <=s (const 64 (2**20)),
    r_413_415 + s_413_415 <=s (const 64 (2**20)),
    r_413_415 - s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 + s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 - s_413_415 <=s (const 64 (2**20)),
    u_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_413_415 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_414_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_1,
sint64 neg_g_413_low60_0_low20_1,
sint64 neg_f_413_low60_0_low20_2,
sint64 neg_g_413_low60_0_low20_2,
sint64 u_413_414,
sint64 v_413_414,
sint64 r_413_414,
sint64 s_413_414,
sint64 u_413_415,
sint64 v_413_415,
sint64 r_413_415,
sint64 s_413_415,
bit ne
)={
    u_413_414 * neg_f_413_low60_0_low20_0 + v_413_414 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_1 * (-(2**20)),
    r_413_414 * neg_f_413_low60_0_low20_0 + s_413_414 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_1 * (-(2**20))
&&
    u_413_414 * neg_f_413_low60_0_low20_0 + v_413_414 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_1 * (const 64 (-(2**20))),
    r_413_414 * neg_f_413_low60_0_low20_0 + s_413_414 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_1 + u_413_414 * (const 64 (2**21)) + v_413_414 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_1 + r_413_414 * (const 64 (2**21)) + s_413_414 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_1,
    neg_f_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_1,
    neg_g_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 414)) <=s delta, delta <=s (const 64 (1 + 2*414)),
    (const 64 (-(2**20))) <=s u_413_414, u_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_414, v_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_414, r_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_414, s_413_414 <=s (const 64 ((2**20))),
    u_413_414 + v_413_414 <=s (const 64 (2**20)),
    u_413_414 - v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 + v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 - v_413_414 <=s (const 64 (2**20)),
    r_413_414 + s_413_414 <=s (const 64 (2**20)),
    r_413_414 - s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 + s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 - s_413_414 <=s (const 64 (2**20)),
    u_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_413_414 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step414

// premise b
assume
neg_g_413_low60_0_low20_1 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_2 neg_f_413_low60_0_low20_1;
mov u_413_415 u_413_414;
mov v_413_415 v_413_414;

add neg_g_413_low60_0_low20_2 neg_g_413_low60_0_low20_1 neg_f_413_low60_0_low20_1;
asr neg_g_413_low60_0_low20_2 neg_g_413_low60_0_low20_2 1;
add r_413_415 r_413_414 u_413_414;
asr r_413_415 r_413_415 1;
add s_413_415 s_413_414 v_413_414;
asr s_413_415 s_413_415 1;
assert
    true
&&
    neg_f_413_low60_0_low20_2 = neg_f_413_low60_0_low20_1,
    u_413_415 = u_413_414,
    v_413_415 = v_413_414,
    neg_g_413_low60_0_low20_2 * (const 64 2) = neg_g_413_low60_0_low20_1 + neg_f_413_low60_0_low20_1,
    r_413_415 * (const 64 2) = r_413_414 + u_413_414,
    s_413_415 * (const 64 2) = s_413_414 + v_413_414
;

assume
    neg_f_413_low60_0_low20_2 = neg_f_413_low60_0_low20_1,
    u_413_415 = u_413_414,
    v_413_415 = v_413_414,
    neg_g_413_low60_0_low20_2 * 2 = neg_g_413_low60_0_low20_1 + neg_f_413_low60_0_low20_1,
    r_413_415 * 2 = r_413_414 + u_413_414,
    s_413_415 * 2 = s_413_414 + v_413_414
&&
    true
;

{
    u_413_415 * neg_f_413_low60_0_low20_0 + v_413_415 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_415 * neg_f_413_low60_0_low20_0 + s_413_415 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_2 + u_413_415 * (const 64 (2**21)) + v_413_415 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_2 + r_413_415 * (const 64 (2**21)) + s_413_415 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_2,
    neg_f_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_2,
    neg_g_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 415)) <=s delta, delta <=s (const 64 (1 + 2*415)),
    (const 64 (-(2**20))) <=s u_413_415, u_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_415, v_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_415, r_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_415, s_413_415 <=s (const 64 ((2**20))),
    u_413_415 + v_413_415 <=s (const 64 (2**20)),
    u_413_415 - v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 + v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 - v_413_415 <=s (const 64 (2**20)),
    r_413_415 + s_413_415 <=s (const 64 (2**20)),
    r_413_415 - s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 + s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 - s_413_415 <=s (const 64 (2**20)),
    u_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_413_415 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_414_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_1,
sint64 neg_g_413_low60_0_low20_1,
sint64 neg_f_413_low60_0_low20_2,
sint64 neg_g_413_low60_0_low20_2,
sint64 u_413_414,
sint64 v_413_414,
sint64 r_413_414,
sint64 s_413_414,
sint64 u_413_415,
sint64 v_413_415,
sint64 r_413_415,
sint64 s_413_415,
bit ne
)={
    u_413_414 * neg_f_413_low60_0_low20_0 + v_413_414 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_1 * (-(2**20)),
    r_413_414 * neg_f_413_low60_0_low20_0 + s_413_414 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_1 * (-(2**20))
&&
    u_413_414 * neg_f_413_low60_0_low20_0 + v_413_414 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_1 * (const 64 (-(2**20))),
    r_413_414 * neg_f_413_low60_0_low20_0 + s_413_414 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_1 + u_413_414 * (const 64 (2**21)) + v_413_414 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_1 + r_413_414 * (const 64 (2**21)) + s_413_414 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_1,
    neg_f_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_1,
    neg_g_413_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 414)) <=s delta, delta <=s (const 64 (1 + 2*414)),
    (const 64 (-(2**20))) <=s u_413_414, u_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_414, v_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_414, r_413_414 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_414, s_413_414 <=s (const 64 ((2**20))),
    u_413_414 + v_413_414 <=s (const 64 (2**20)),
    u_413_414 - v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 + v_413_414 <=s (const 64 (2**20)),
    (const 64 0) - u_413_414 - v_413_414 <=s (const 64 (2**20)),
    r_413_414 + s_413_414 <=s (const 64 (2**20)),
    r_413_414 - s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 + s_413_414 <=s (const 64 (2**20)),
    (const 64 0) - r_413_414 - s_413_414 <=s (const 64 (2**20)),
    u_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_413_414 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_413_414 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step414

// premise c
assume
neg_g_413_low60_0_low20_1 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_2 neg_g_413_low60_0_low20_1;
mov u_413_415 r_413_414;
mov v_413_415 s_413_414;

subs dc neg_g_413_low60_0_low20_2 neg_g_413_low60_0_low20_1 neg_f_413_low60_0_low20_1;
asr neg_g_413_low60_0_low20_2 neg_g_413_low60_0_low20_2 1;
subs dc r_413_415 r_413_414 u_413_414;
asr r_413_415 r_413_415 1;
subs dc s_413_415 s_413_414 v_413_414;
asr s_413_415 s_413_415 1;
assert
    true
&&
    neg_f_413_low60_0_low20_2 = neg_g_413_low60_0_low20_1,
    u_413_415 = r_413_414,
    v_413_415 = s_413_414,
    neg_g_413_low60_0_low20_2 * (const 64 2) = neg_g_413_low60_0_low20_1 - neg_f_413_low60_0_low20_1,
    r_413_415 * (const 64 2) = r_413_414 - u_413_414,
    s_413_415 * (const 64 2) = s_413_414 - v_413_414
;

assume
    neg_f_413_low60_0_low20_2 = neg_g_413_low60_0_low20_1,
    u_413_415 = r_413_414,
    v_413_415 = s_413_414,
    neg_g_413_low60_0_low20_2 * 2 = neg_g_413_low60_0_low20_1 - neg_f_413_low60_0_low20_1,
    r_413_415 * 2 = r_413_414 - u_413_414,
    s_413_415 * 2 = s_413_414 - v_413_414
&&
    true
;

{
    u_413_415 * neg_f_413_low60_0_low20_0 + v_413_415 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_415 * neg_f_413_low60_0_low20_0 + s_413_415 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_2 + u_413_415 * (const 64 (2**21)) + v_413_415 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_2 + r_413_415 * (const 64 (2**21)) + s_413_415 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_2,
    neg_f_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_2,
    neg_g_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 415)) <=s delta, delta <=s (const 64 (1 + 2*415)),
    (const 64 (-(2**20))) <=s u_413_415, u_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_415, v_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_415, r_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_415, s_413_415 <=s (const 64 ((2**20))),
    u_413_415 + v_413_415 <=s (const 64 (2**20)),
    u_413_415 - v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 + v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 - v_413_415 <=s (const 64 (2**20)),
    r_413_415 + s_413_415 <=s (const 64 (2**20)),
    r_413_415 - s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 + s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 - s_413_415 <=s (const 64 (2**20)),
    u_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_413_415 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_415_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_2,
sint64 neg_g_413_low60_0_low20_2,
sint64 neg_f_413_low60_0_low20_3,
sint64 neg_g_413_low60_0_low20_3,
sint64 u_413_415,
sint64 v_413_415,
sint64 r_413_415,
sint64 s_413_415,
sint64 u_413_416,
sint64 v_413_416,
sint64 r_413_416,
sint64 s_413_416,
bit ne
)={
    u_413_415 * neg_f_413_low60_0_low20_0 + v_413_415 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_2 * (-(2**20)),
    r_413_415 * neg_f_413_low60_0_low20_0 + s_413_415 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_2 * (-(2**20))
&&
    u_413_415 * neg_f_413_low60_0_low20_0 + v_413_415 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_2 * (const 64 (-(2**20))),
    r_413_415 * neg_f_413_low60_0_low20_0 + s_413_415 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_2 + u_413_415 * (const 64 (2**21)) + v_413_415 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_2 + r_413_415 * (const 64 (2**21)) + s_413_415 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_2,
    neg_f_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_2,
    neg_g_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 415)) <=s delta, delta <=s (const 64 (1 + 2*415)),
    (const 64 (-(2**20))) <=s u_413_415, u_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_415, v_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_415, r_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_415, s_413_415 <=s (const 64 ((2**20))),
    u_413_415 + v_413_415 <=s (const 64 (2**20)),
    u_413_415 - v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 + v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 - v_413_415 <=s (const 64 (2**20)),
    r_413_415 + s_413_415 <=s (const 64 (2**20)),
    r_413_415 - s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 + s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 - s_413_415 <=s (const 64 (2**20)),
    u_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_413_415 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step415

// premise a
assume
neg_g_413_low60_0_low20_2 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_2 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_3 neg_f_413_low60_0_low20_2;
mov u_413_416 u_413_415;
mov v_413_416 v_413_415;

asr neg_g_413_low60_0_low20_3 neg_g_413_low60_0_low20_2 1;
asr r_413_416 r_413_415 1;
asr s_413_416 s_413_415 1;
assert
    true
&&
    neg_f_413_low60_0_low20_3 = neg_f_413_low60_0_low20_2,
    u_413_416 = u_413_415,
    v_413_416 = v_413_415,
    neg_g_413_low60_0_low20_3 * (const 64 2) = neg_g_413_low60_0_low20_2,
    r_413_416 * (const 64 2) = r_413_415,
    s_413_416 * (const 64 2) = s_413_415
;

assume
    neg_f_413_low60_0_low20_3 = neg_f_413_low60_0_low20_2,
    u_413_416 = u_413_415,
    v_413_416 = v_413_415,
    neg_g_413_low60_0_low20_3 * 2 = neg_g_413_low60_0_low20_2,
    r_413_416 * 2 = r_413_415,
    s_413_416 * 2 = s_413_415
&&
    true
;

{
    u_413_416 * neg_f_413_low60_0_low20_0 + v_413_416 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_416 * neg_f_413_low60_0_low20_0 + s_413_416 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_3 + u_413_416 * (const 64 (2**21)) + v_413_416 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_3 + r_413_416 * (const 64 (2**21)) + s_413_416 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_3,
    neg_f_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_3,
    neg_g_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 416)) <=s delta, delta <=s (const 64 (1 + 2*416)),
    (const 64 (-(2**20))) <=s u_413_416, u_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_416, v_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_416, r_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_416, s_413_416 <=s (const 64 ((2**20))),
    u_413_416 + v_413_416 <=s (const 64 (2**20)),
    u_413_416 - v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 + v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 - v_413_416 <=s (const 64 (2**20)),
    r_413_416 + s_413_416 <=s (const 64 (2**20)),
    r_413_416 - s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 + s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 - s_413_416 <=s (const 64 (2**20)),
    u_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_413_416 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_415_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_2,
sint64 neg_g_413_low60_0_low20_2,
sint64 neg_f_413_low60_0_low20_3,
sint64 neg_g_413_low60_0_low20_3,
sint64 u_413_415,
sint64 v_413_415,
sint64 r_413_415,
sint64 s_413_415,
sint64 u_413_416,
sint64 v_413_416,
sint64 r_413_416,
sint64 s_413_416,
bit ne
)={
    u_413_415 * neg_f_413_low60_0_low20_0 + v_413_415 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_2 * (-(2**20)),
    r_413_415 * neg_f_413_low60_0_low20_0 + s_413_415 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_2 * (-(2**20))
&&
    u_413_415 * neg_f_413_low60_0_low20_0 + v_413_415 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_2 * (const 64 (-(2**20))),
    r_413_415 * neg_f_413_low60_0_low20_0 + s_413_415 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_2 + u_413_415 * (const 64 (2**21)) + v_413_415 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_2 + r_413_415 * (const 64 (2**21)) + s_413_415 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_2,
    neg_f_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_2,
    neg_g_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 415)) <=s delta, delta <=s (const 64 (1 + 2*415)),
    (const 64 (-(2**20))) <=s u_413_415, u_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_415, v_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_415, r_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_415, s_413_415 <=s (const 64 ((2**20))),
    u_413_415 + v_413_415 <=s (const 64 (2**20)),
    u_413_415 - v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 + v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 - v_413_415 <=s (const 64 (2**20)),
    r_413_415 + s_413_415 <=s (const 64 (2**20)),
    r_413_415 - s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 + s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 - s_413_415 <=s (const 64 (2**20)),
    u_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_413_415 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step415

// premise b
assume
neg_g_413_low60_0_low20_2 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_3 neg_f_413_low60_0_low20_2;
mov u_413_416 u_413_415;
mov v_413_416 v_413_415;

add neg_g_413_low60_0_low20_3 neg_g_413_low60_0_low20_2 neg_f_413_low60_0_low20_2;
asr neg_g_413_low60_0_low20_3 neg_g_413_low60_0_low20_3 1;
add r_413_416 r_413_415 u_413_415;
asr r_413_416 r_413_416 1;
add s_413_416 s_413_415 v_413_415;
asr s_413_416 s_413_416 1;
assert
    true
&&
    neg_f_413_low60_0_low20_3 = neg_f_413_low60_0_low20_2,
    u_413_416 = u_413_415,
    v_413_416 = v_413_415,
    neg_g_413_low60_0_low20_3 * (const 64 2) = neg_g_413_low60_0_low20_2 + neg_f_413_low60_0_low20_2,
    r_413_416 * (const 64 2) = r_413_415 + u_413_415,
    s_413_416 * (const 64 2) = s_413_415 + v_413_415
;

assume
    neg_f_413_low60_0_low20_3 = neg_f_413_low60_0_low20_2,
    u_413_416 = u_413_415,
    v_413_416 = v_413_415,
    neg_g_413_low60_0_low20_3 * 2 = neg_g_413_low60_0_low20_2 + neg_f_413_low60_0_low20_2,
    r_413_416 * 2 = r_413_415 + u_413_415,
    s_413_416 * 2 = s_413_415 + v_413_415
&&
    true
;

{
    u_413_416 * neg_f_413_low60_0_low20_0 + v_413_416 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_416 * neg_f_413_low60_0_low20_0 + s_413_416 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_3 + u_413_416 * (const 64 (2**21)) + v_413_416 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_3 + r_413_416 * (const 64 (2**21)) + s_413_416 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_3,
    neg_f_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_3,
    neg_g_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 416)) <=s delta, delta <=s (const 64 (1 + 2*416)),
    (const 64 (-(2**20))) <=s u_413_416, u_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_416, v_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_416, r_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_416, s_413_416 <=s (const 64 ((2**20))),
    u_413_416 + v_413_416 <=s (const 64 (2**20)),
    u_413_416 - v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 + v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 - v_413_416 <=s (const 64 (2**20)),
    r_413_416 + s_413_416 <=s (const 64 (2**20)),
    r_413_416 - s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 + s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 - s_413_416 <=s (const 64 (2**20)),
    u_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_413_416 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_415_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_2,
sint64 neg_g_413_low60_0_low20_2,
sint64 neg_f_413_low60_0_low20_3,
sint64 neg_g_413_low60_0_low20_3,
sint64 u_413_415,
sint64 v_413_415,
sint64 r_413_415,
sint64 s_413_415,
sint64 u_413_416,
sint64 v_413_416,
sint64 r_413_416,
sint64 s_413_416,
bit ne
)={
    u_413_415 * neg_f_413_low60_0_low20_0 + v_413_415 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_2 * (-(2**20)),
    r_413_415 * neg_f_413_low60_0_low20_0 + s_413_415 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_2 * (-(2**20))
&&
    u_413_415 * neg_f_413_low60_0_low20_0 + v_413_415 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_2 * (const 64 (-(2**20))),
    r_413_415 * neg_f_413_low60_0_low20_0 + s_413_415 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_2 + u_413_415 * (const 64 (2**21)) + v_413_415 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_2 + r_413_415 * (const 64 (2**21)) + s_413_415 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_2,
    neg_f_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_2,
    neg_g_413_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 415)) <=s delta, delta <=s (const 64 (1 + 2*415)),
    (const 64 (-(2**20))) <=s u_413_415, u_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_415, v_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_415, r_413_415 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_415, s_413_415 <=s (const 64 ((2**20))),
    u_413_415 + v_413_415 <=s (const 64 (2**20)),
    u_413_415 - v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 + v_413_415 <=s (const 64 (2**20)),
    (const 64 0) - u_413_415 - v_413_415 <=s (const 64 (2**20)),
    r_413_415 + s_413_415 <=s (const 64 (2**20)),
    r_413_415 - s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 + s_413_415 <=s (const 64 (2**20)),
    (const 64 0) - r_413_415 - s_413_415 <=s (const 64 (2**20)),
    u_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_413_415 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_413_415 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step415

// premise c
assume
neg_g_413_low60_0_low20_2 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_3 neg_g_413_low60_0_low20_2;
mov u_413_416 r_413_415;
mov v_413_416 s_413_415;

subs dc neg_g_413_low60_0_low20_3 neg_g_413_low60_0_low20_2 neg_f_413_low60_0_low20_2;
asr neg_g_413_low60_0_low20_3 neg_g_413_low60_0_low20_3 1;
subs dc r_413_416 r_413_415 u_413_415;
asr r_413_416 r_413_416 1;
subs dc s_413_416 s_413_415 v_413_415;
asr s_413_416 s_413_416 1;
assert
    true
&&
    neg_f_413_low60_0_low20_3 = neg_g_413_low60_0_low20_2,
    u_413_416 = r_413_415,
    v_413_416 = s_413_415,
    neg_g_413_low60_0_low20_3 * (const 64 2) = neg_g_413_low60_0_low20_2 - neg_f_413_low60_0_low20_2,
    r_413_416 * (const 64 2) = r_413_415 - u_413_415,
    s_413_416 * (const 64 2) = s_413_415 - v_413_415
;

assume
    neg_f_413_low60_0_low20_3 = neg_g_413_low60_0_low20_2,
    u_413_416 = r_413_415,
    v_413_416 = s_413_415,
    neg_g_413_low60_0_low20_3 * 2 = neg_g_413_low60_0_low20_2 - neg_f_413_low60_0_low20_2,
    r_413_416 * 2 = r_413_415 - u_413_415,
    s_413_416 * 2 = s_413_415 - v_413_415
&&
    true
;

{
    u_413_416 * neg_f_413_low60_0_low20_0 + v_413_416 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_416 * neg_f_413_low60_0_low20_0 + s_413_416 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_3 + u_413_416 * (const 64 (2**21)) + v_413_416 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_3 + r_413_416 * (const 64 (2**21)) + s_413_416 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_3,
    neg_f_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_3,
    neg_g_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 416)) <=s delta, delta <=s (const 64 (1 + 2*416)),
    (const 64 (-(2**20))) <=s u_413_416, u_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_416, v_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_416, r_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_416, s_413_416 <=s (const 64 ((2**20))),
    u_413_416 + v_413_416 <=s (const 64 (2**20)),
    u_413_416 - v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 + v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 - v_413_416 <=s (const 64 (2**20)),
    r_413_416 + s_413_416 <=s (const 64 (2**20)),
    r_413_416 - s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 + s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 - s_413_416 <=s (const 64 (2**20)),
    u_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_413_416 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_416_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_3,
sint64 neg_g_413_low60_0_low20_3,
sint64 neg_f_413_low60_0_low20_4,
sint64 neg_g_413_low60_0_low20_4,
sint64 u_413_416,
sint64 v_413_416,
sint64 r_413_416,
sint64 s_413_416,
sint64 u_413_417,
sint64 v_413_417,
sint64 r_413_417,
sint64 s_413_417,
bit ne
)={
    u_413_416 * neg_f_413_low60_0_low20_0 + v_413_416 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_3 * (-(2**20)),
    r_413_416 * neg_f_413_low60_0_low20_0 + s_413_416 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_3 * (-(2**20))
&&
    u_413_416 * neg_f_413_low60_0_low20_0 + v_413_416 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_3 * (const 64 (-(2**20))),
    r_413_416 * neg_f_413_low60_0_low20_0 + s_413_416 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_3 + u_413_416 * (const 64 (2**21)) + v_413_416 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_3 + r_413_416 * (const 64 (2**21)) + s_413_416 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_3,
    neg_f_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_3,
    neg_g_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 416)) <=s delta, delta <=s (const 64 (1 + 2*416)),
    (const 64 (-(2**20))) <=s u_413_416, u_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_416, v_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_416, r_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_416, s_413_416 <=s (const 64 ((2**20))),
    u_413_416 + v_413_416 <=s (const 64 (2**20)),
    u_413_416 - v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 + v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 - v_413_416 <=s (const 64 (2**20)),
    r_413_416 + s_413_416 <=s (const 64 (2**20)),
    r_413_416 - s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 + s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 - s_413_416 <=s (const 64 (2**20)),
    u_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_413_416 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step416

// premise a
assume
neg_g_413_low60_0_low20_3 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_3 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_4 neg_f_413_low60_0_low20_3;
mov u_413_417 u_413_416;
mov v_413_417 v_413_416;

asr neg_g_413_low60_0_low20_4 neg_g_413_low60_0_low20_3 1;
asr r_413_417 r_413_416 1;
asr s_413_417 s_413_416 1;
assert
    true
&&
    neg_f_413_low60_0_low20_4 = neg_f_413_low60_0_low20_3,
    u_413_417 = u_413_416,
    v_413_417 = v_413_416,
    neg_g_413_low60_0_low20_4 * (const 64 2) = neg_g_413_low60_0_low20_3,
    r_413_417 * (const 64 2) = r_413_416,
    s_413_417 * (const 64 2) = s_413_416
;

assume
    neg_f_413_low60_0_low20_4 = neg_f_413_low60_0_low20_3,
    u_413_417 = u_413_416,
    v_413_417 = v_413_416,
    neg_g_413_low60_0_low20_4 * 2 = neg_g_413_low60_0_low20_3,
    r_413_417 * 2 = r_413_416,
    s_413_417 * 2 = s_413_416
&&
    true
;

{
    u_413_417 * neg_f_413_low60_0_low20_0 + v_413_417 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_417 * neg_f_413_low60_0_low20_0 + s_413_417 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_4 + u_413_417 * (const 64 (2**21)) + v_413_417 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_4 + r_413_417 * (const 64 (2**21)) + s_413_417 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_4,
    neg_f_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_4,
    neg_g_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 417)) <=s delta, delta <=s (const 64 (1 + 2*417)),
    (const 64 (-(2**20))) <=s u_413_417, u_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_417, v_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_417, r_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_417, s_413_417 <=s (const 64 ((2**20))),
    u_413_417 + v_413_417 <=s (const 64 (2**20)),
    u_413_417 - v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 + v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 - v_413_417 <=s (const 64 (2**20)),
    r_413_417 + s_413_417 <=s (const 64 (2**20)),
    r_413_417 - s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 + s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 - s_413_417 <=s (const 64 (2**20)),
    u_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_413_417 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_416_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_3,
sint64 neg_g_413_low60_0_low20_3,
sint64 neg_f_413_low60_0_low20_4,
sint64 neg_g_413_low60_0_low20_4,
sint64 u_413_416,
sint64 v_413_416,
sint64 r_413_416,
sint64 s_413_416,
sint64 u_413_417,
sint64 v_413_417,
sint64 r_413_417,
sint64 s_413_417,
bit ne
)={
    u_413_416 * neg_f_413_low60_0_low20_0 + v_413_416 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_3 * (-(2**20)),
    r_413_416 * neg_f_413_low60_0_low20_0 + s_413_416 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_3 * (-(2**20))
&&
    u_413_416 * neg_f_413_low60_0_low20_0 + v_413_416 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_3 * (const 64 (-(2**20))),
    r_413_416 * neg_f_413_low60_0_low20_0 + s_413_416 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_3 + u_413_416 * (const 64 (2**21)) + v_413_416 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_3 + r_413_416 * (const 64 (2**21)) + s_413_416 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_3,
    neg_f_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_3,
    neg_g_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 416)) <=s delta, delta <=s (const 64 (1 + 2*416)),
    (const 64 (-(2**20))) <=s u_413_416, u_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_416, v_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_416, r_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_416, s_413_416 <=s (const 64 ((2**20))),
    u_413_416 + v_413_416 <=s (const 64 (2**20)),
    u_413_416 - v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 + v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 - v_413_416 <=s (const 64 (2**20)),
    r_413_416 + s_413_416 <=s (const 64 (2**20)),
    r_413_416 - s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 + s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 - s_413_416 <=s (const 64 (2**20)),
    u_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_413_416 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step416

// premise b
assume
neg_g_413_low60_0_low20_3 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_4 neg_f_413_low60_0_low20_3;
mov u_413_417 u_413_416;
mov v_413_417 v_413_416;

add neg_g_413_low60_0_low20_4 neg_g_413_low60_0_low20_3 neg_f_413_low60_0_low20_3;
asr neg_g_413_low60_0_low20_4 neg_g_413_low60_0_low20_4 1;
add r_413_417 r_413_416 u_413_416;
asr r_413_417 r_413_417 1;
add s_413_417 s_413_416 v_413_416;
asr s_413_417 s_413_417 1;
assert
    true
&&
    neg_f_413_low60_0_low20_4 = neg_f_413_low60_0_low20_3,
    u_413_417 = u_413_416,
    v_413_417 = v_413_416,
    neg_g_413_low60_0_low20_4 * (const 64 2) = neg_g_413_low60_0_low20_3 + neg_f_413_low60_0_low20_3,
    r_413_417 * (const 64 2) = r_413_416 + u_413_416,
    s_413_417 * (const 64 2) = s_413_416 + v_413_416
;

assume
    neg_f_413_low60_0_low20_4 = neg_f_413_low60_0_low20_3,
    u_413_417 = u_413_416,
    v_413_417 = v_413_416,
    neg_g_413_low60_0_low20_4 * 2 = neg_g_413_low60_0_low20_3 + neg_f_413_low60_0_low20_3,
    r_413_417 * 2 = r_413_416 + u_413_416,
    s_413_417 * 2 = s_413_416 + v_413_416
&&
    true
;

{
    u_413_417 * neg_f_413_low60_0_low20_0 + v_413_417 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_417 * neg_f_413_low60_0_low20_0 + s_413_417 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_4 + u_413_417 * (const 64 (2**21)) + v_413_417 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_4 + r_413_417 * (const 64 (2**21)) + s_413_417 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_4,
    neg_f_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_4,
    neg_g_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 417)) <=s delta, delta <=s (const 64 (1 + 2*417)),
    (const 64 (-(2**20))) <=s u_413_417, u_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_417, v_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_417, r_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_417, s_413_417 <=s (const 64 ((2**20))),
    u_413_417 + v_413_417 <=s (const 64 (2**20)),
    u_413_417 - v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 + v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 - v_413_417 <=s (const 64 (2**20)),
    r_413_417 + s_413_417 <=s (const 64 (2**20)),
    r_413_417 - s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 + s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 - s_413_417 <=s (const 64 (2**20)),
    u_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_413_417 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_416_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_3,
sint64 neg_g_413_low60_0_low20_3,
sint64 neg_f_413_low60_0_low20_4,
sint64 neg_g_413_low60_0_low20_4,
sint64 u_413_416,
sint64 v_413_416,
sint64 r_413_416,
sint64 s_413_416,
sint64 u_413_417,
sint64 v_413_417,
sint64 r_413_417,
sint64 s_413_417,
bit ne
)={
    u_413_416 * neg_f_413_low60_0_low20_0 + v_413_416 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_3 * (-(2**20)),
    r_413_416 * neg_f_413_low60_0_low20_0 + s_413_416 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_3 * (-(2**20))
&&
    u_413_416 * neg_f_413_low60_0_low20_0 + v_413_416 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_3 * (const 64 (-(2**20))),
    r_413_416 * neg_f_413_low60_0_low20_0 + s_413_416 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_3 + u_413_416 * (const 64 (2**21)) + v_413_416 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_3 + r_413_416 * (const 64 (2**21)) + s_413_416 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_3,
    neg_f_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_3,
    neg_g_413_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 416)) <=s delta, delta <=s (const 64 (1 + 2*416)),
    (const 64 (-(2**20))) <=s u_413_416, u_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_416, v_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_416, r_413_416 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_416, s_413_416 <=s (const 64 ((2**20))),
    u_413_416 + v_413_416 <=s (const 64 (2**20)),
    u_413_416 - v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 + v_413_416 <=s (const 64 (2**20)),
    (const 64 0) - u_413_416 - v_413_416 <=s (const 64 (2**20)),
    r_413_416 + s_413_416 <=s (const 64 (2**20)),
    r_413_416 - s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 + s_413_416 <=s (const 64 (2**20)),
    (const 64 0) - r_413_416 - s_413_416 <=s (const 64 (2**20)),
    u_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_413_416 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_413_416 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step416

// premise c
assume
neg_g_413_low60_0_low20_3 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_4 neg_g_413_low60_0_low20_3;
mov u_413_417 r_413_416;
mov v_413_417 s_413_416;

subs dc neg_g_413_low60_0_low20_4 neg_g_413_low60_0_low20_3 neg_f_413_low60_0_low20_3;
asr neg_g_413_low60_0_low20_4 neg_g_413_low60_0_low20_4 1;
subs dc r_413_417 r_413_416 u_413_416;
asr r_413_417 r_413_417 1;
subs dc s_413_417 s_413_416 v_413_416;
asr s_413_417 s_413_417 1;
assert
    true
&&
    neg_f_413_low60_0_low20_4 = neg_g_413_low60_0_low20_3,
    u_413_417 = r_413_416,
    v_413_417 = s_413_416,
    neg_g_413_low60_0_low20_4 * (const 64 2) = neg_g_413_low60_0_low20_3 - neg_f_413_low60_0_low20_3,
    r_413_417 * (const 64 2) = r_413_416 - u_413_416,
    s_413_417 * (const 64 2) = s_413_416 - v_413_416
;

assume
    neg_f_413_low60_0_low20_4 = neg_g_413_low60_0_low20_3,
    u_413_417 = r_413_416,
    v_413_417 = s_413_416,
    neg_g_413_low60_0_low20_4 * 2 = neg_g_413_low60_0_low20_3 - neg_f_413_low60_0_low20_3,
    r_413_417 * 2 = r_413_416 - u_413_416,
    s_413_417 * 2 = s_413_416 - v_413_416
&&
    true
;

{
    u_413_417 * neg_f_413_low60_0_low20_0 + v_413_417 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_417 * neg_f_413_low60_0_low20_0 + s_413_417 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_4 + u_413_417 * (const 64 (2**21)) + v_413_417 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_4 + r_413_417 * (const 64 (2**21)) + s_413_417 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_4,
    neg_f_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_4,
    neg_g_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 417)) <=s delta, delta <=s (const 64 (1 + 2*417)),
    (const 64 (-(2**20))) <=s u_413_417, u_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_417, v_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_417, r_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_417, s_413_417 <=s (const 64 ((2**20))),
    u_413_417 + v_413_417 <=s (const 64 (2**20)),
    u_413_417 - v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 + v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 - v_413_417 <=s (const 64 (2**20)),
    r_413_417 + s_413_417 <=s (const 64 (2**20)),
    r_413_417 - s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 + s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 - s_413_417 <=s (const 64 (2**20)),
    u_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_413_417 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_417_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_4,
sint64 neg_g_413_low60_0_low20_4,
sint64 neg_f_413_low60_0_low20_5,
sint64 neg_g_413_low60_0_low20_5,
sint64 u_413_417,
sint64 v_413_417,
sint64 r_413_417,
sint64 s_413_417,
sint64 u_413_418,
sint64 v_413_418,
sint64 r_413_418,
sint64 s_413_418,
bit ne
)={
    u_413_417 * neg_f_413_low60_0_low20_0 + v_413_417 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_4 * (-(2**20)),
    r_413_417 * neg_f_413_low60_0_low20_0 + s_413_417 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_4 * (-(2**20))
&&
    u_413_417 * neg_f_413_low60_0_low20_0 + v_413_417 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_4 * (const 64 (-(2**20))),
    r_413_417 * neg_f_413_low60_0_low20_0 + s_413_417 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_4 + u_413_417 * (const 64 (2**21)) + v_413_417 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_4 + r_413_417 * (const 64 (2**21)) + s_413_417 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_4,
    neg_f_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_4,
    neg_g_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 417)) <=s delta, delta <=s (const 64 (1 + 2*417)),
    (const 64 (-(2**20))) <=s u_413_417, u_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_417, v_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_417, r_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_417, s_413_417 <=s (const 64 ((2**20))),
    u_413_417 + v_413_417 <=s (const 64 (2**20)),
    u_413_417 - v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 + v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 - v_413_417 <=s (const 64 (2**20)),
    r_413_417 + s_413_417 <=s (const 64 (2**20)),
    r_413_417 - s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 + s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 - s_413_417 <=s (const 64 (2**20)),
    u_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_413_417 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step417

// premise a
assume
neg_g_413_low60_0_low20_4 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_4 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_5 neg_f_413_low60_0_low20_4;
mov u_413_418 u_413_417;
mov v_413_418 v_413_417;

asr neg_g_413_low60_0_low20_5 neg_g_413_low60_0_low20_4 1;
asr r_413_418 r_413_417 1;
asr s_413_418 s_413_417 1;
assert
    true
&&
    neg_f_413_low60_0_low20_5 = neg_f_413_low60_0_low20_4,
    u_413_418 = u_413_417,
    v_413_418 = v_413_417,
    neg_g_413_low60_0_low20_5 * (const 64 2) = neg_g_413_low60_0_low20_4,
    r_413_418 * (const 64 2) = r_413_417,
    s_413_418 * (const 64 2) = s_413_417
;

assume
    neg_f_413_low60_0_low20_5 = neg_f_413_low60_0_low20_4,
    u_413_418 = u_413_417,
    v_413_418 = v_413_417,
    neg_g_413_low60_0_low20_5 * 2 = neg_g_413_low60_0_low20_4,
    r_413_418 * 2 = r_413_417,
    s_413_418 * 2 = s_413_417
&&
    true
;

{
    u_413_418 * neg_f_413_low60_0_low20_0 + v_413_418 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_418 * neg_f_413_low60_0_low20_0 + s_413_418 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_5 + u_413_418 * (const 64 (2**21)) + v_413_418 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_5 + r_413_418 * (const 64 (2**21)) + s_413_418 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_5,
    neg_f_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_5,
    neg_g_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 418)) <=s delta, delta <=s (const 64 (1 + 2*418)),
    (const 64 (-(2**20))) <=s u_413_418, u_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_418, v_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_418, r_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_418, s_413_418 <=s (const 64 ((2**20))),
    u_413_418 + v_413_418 <=s (const 64 (2**20)),
    u_413_418 - v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 + v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 - v_413_418 <=s (const 64 (2**20)),
    r_413_418 + s_413_418 <=s (const 64 (2**20)),
    r_413_418 - s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 + s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 - s_413_418 <=s (const 64 (2**20)),
    u_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_413_418 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_417_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_4,
sint64 neg_g_413_low60_0_low20_4,
sint64 neg_f_413_low60_0_low20_5,
sint64 neg_g_413_low60_0_low20_5,
sint64 u_413_417,
sint64 v_413_417,
sint64 r_413_417,
sint64 s_413_417,
sint64 u_413_418,
sint64 v_413_418,
sint64 r_413_418,
sint64 s_413_418,
bit ne
)={
    u_413_417 * neg_f_413_low60_0_low20_0 + v_413_417 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_4 * (-(2**20)),
    r_413_417 * neg_f_413_low60_0_low20_0 + s_413_417 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_4 * (-(2**20))
&&
    u_413_417 * neg_f_413_low60_0_low20_0 + v_413_417 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_4 * (const 64 (-(2**20))),
    r_413_417 * neg_f_413_low60_0_low20_0 + s_413_417 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_4 + u_413_417 * (const 64 (2**21)) + v_413_417 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_4 + r_413_417 * (const 64 (2**21)) + s_413_417 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_4,
    neg_f_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_4,
    neg_g_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 417)) <=s delta, delta <=s (const 64 (1 + 2*417)),
    (const 64 (-(2**20))) <=s u_413_417, u_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_417, v_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_417, r_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_417, s_413_417 <=s (const 64 ((2**20))),
    u_413_417 + v_413_417 <=s (const 64 (2**20)),
    u_413_417 - v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 + v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 - v_413_417 <=s (const 64 (2**20)),
    r_413_417 + s_413_417 <=s (const 64 (2**20)),
    r_413_417 - s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 + s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 - s_413_417 <=s (const 64 (2**20)),
    u_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_413_417 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step417

// premise b
assume
neg_g_413_low60_0_low20_4 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_5 neg_f_413_low60_0_low20_4;
mov u_413_418 u_413_417;
mov v_413_418 v_413_417;

add neg_g_413_low60_0_low20_5 neg_g_413_low60_0_low20_4 neg_f_413_low60_0_low20_4;
asr neg_g_413_low60_0_low20_5 neg_g_413_low60_0_low20_5 1;
add r_413_418 r_413_417 u_413_417;
asr r_413_418 r_413_418 1;
add s_413_418 s_413_417 v_413_417;
asr s_413_418 s_413_418 1;
assert
    true
&&
    neg_f_413_low60_0_low20_5 = neg_f_413_low60_0_low20_4,
    u_413_418 = u_413_417,
    v_413_418 = v_413_417,
    neg_g_413_low60_0_low20_5 * (const 64 2) = neg_g_413_low60_0_low20_4 + neg_f_413_low60_0_low20_4,
    r_413_418 * (const 64 2) = r_413_417 + u_413_417,
    s_413_418 * (const 64 2) = s_413_417 + v_413_417
;

assume
    neg_f_413_low60_0_low20_5 = neg_f_413_low60_0_low20_4,
    u_413_418 = u_413_417,
    v_413_418 = v_413_417,
    neg_g_413_low60_0_low20_5 * 2 = neg_g_413_low60_0_low20_4 + neg_f_413_low60_0_low20_4,
    r_413_418 * 2 = r_413_417 + u_413_417,
    s_413_418 * 2 = s_413_417 + v_413_417
&&
    true
;

{
    u_413_418 * neg_f_413_low60_0_low20_0 + v_413_418 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_418 * neg_f_413_low60_0_low20_0 + s_413_418 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_5 + u_413_418 * (const 64 (2**21)) + v_413_418 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_5 + r_413_418 * (const 64 (2**21)) + s_413_418 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_5,
    neg_f_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_5,
    neg_g_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 418)) <=s delta, delta <=s (const 64 (1 + 2*418)),
    (const 64 (-(2**20))) <=s u_413_418, u_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_418, v_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_418, r_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_418, s_413_418 <=s (const 64 ((2**20))),
    u_413_418 + v_413_418 <=s (const 64 (2**20)),
    u_413_418 - v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 + v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 - v_413_418 <=s (const 64 (2**20)),
    r_413_418 + s_413_418 <=s (const 64 (2**20)),
    r_413_418 - s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 + s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 - s_413_418 <=s (const 64 (2**20)),
    u_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_413_418 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_417_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_4,
sint64 neg_g_413_low60_0_low20_4,
sint64 neg_f_413_low60_0_low20_5,
sint64 neg_g_413_low60_0_low20_5,
sint64 u_413_417,
sint64 v_413_417,
sint64 r_413_417,
sint64 s_413_417,
sint64 u_413_418,
sint64 v_413_418,
sint64 r_413_418,
sint64 s_413_418,
bit ne
)={
    u_413_417 * neg_f_413_low60_0_low20_0 + v_413_417 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_4 * (-(2**20)),
    r_413_417 * neg_f_413_low60_0_low20_0 + s_413_417 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_4 * (-(2**20))
&&
    u_413_417 * neg_f_413_low60_0_low20_0 + v_413_417 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_4 * (const 64 (-(2**20))),
    r_413_417 * neg_f_413_low60_0_low20_0 + s_413_417 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_4 + u_413_417 * (const 64 (2**21)) + v_413_417 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_4 + r_413_417 * (const 64 (2**21)) + s_413_417 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_4,
    neg_f_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_4,
    neg_g_413_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 417)) <=s delta, delta <=s (const 64 (1 + 2*417)),
    (const 64 (-(2**20))) <=s u_413_417, u_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_417, v_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_417, r_413_417 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_417, s_413_417 <=s (const 64 ((2**20))),
    u_413_417 + v_413_417 <=s (const 64 (2**20)),
    u_413_417 - v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 + v_413_417 <=s (const 64 (2**20)),
    (const 64 0) - u_413_417 - v_413_417 <=s (const 64 (2**20)),
    r_413_417 + s_413_417 <=s (const 64 (2**20)),
    r_413_417 - s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 + s_413_417 <=s (const 64 (2**20)),
    (const 64 0) - r_413_417 - s_413_417 <=s (const 64 (2**20)),
    u_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_413_417 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_413_417 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step417

// premise c
assume
neg_g_413_low60_0_low20_4 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_5 neg_g_413_low60_0_low20_4;
mov u_413_418 r_413_417;
mov v_413_418 s_413_417;

subs dc neg_g_413_low60_0_low20_5 neg_g_413_low60_0_low20_4 neg_f_413_low60_0_low20_4;
asr neg_g_413_low60_0_low20_5 neg_g_413_low60_0_low20_5 1;
subs dc r_413_418 r_413_417 u_413_417;
asr r_413_418 r_413_418 1;
subs dc s_413_418 s_413_417 v_413_417;
asr s_413_418 s_413_418 1;
assert
    true
&&
    neg_f_413_low60_0_low20_5 = neg_g_413_low60_0_low20_4,
    u_413_418 = r_413_417,
    v_413_418 = s_413_417,
    neg_g_413_low60_0_low20_5 * (const 64 2) = neg_g_413_low60_0_low20_4 - neg_f_413_low60_0_low20_4,
    r_413_418 * (const 64 2) = r_413_417 - u_413_417,
    s_413_418 * (const 64 2) = s_413_417 - v_413_417
;

assume
    neg_f_413_low60_0_low20_5 = neg_g_413_low60_0_low20_4,
    u_413_418 = r_413_417,
    v_413_418 = s_413_417,
    neg_g_413_low60_0_low20_5 * 2 = neg_g_413_low60_0_low20_4 - neg_f_413_low60_0_low20_4,
    r_413_418 * 2 = r_413_417 - u_413_417,
    s_413_418 * 2 = s_413_417 - v_413_417
&&
    true
;

{
    u_413_418 * neg_f_413_low60_0_low20_0 + v_413_418 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_418 * neg_f_413_low60_0_low20_0 + s_413_418 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_5 + u_413_418 * (const 64 (2**21)) + v_413_418 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_5 + r_413_418 * (const 64 (2**21)) + s_413_418 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_5,
    neg_f_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_5,
    neg_g_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 418)) <=s delta, delta <=s (const 64 (1 + 2*418)),
    (const 64 (-(2**20))) <=s u_413_418, u_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_418, v_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_418, r_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_418, s_413_418 <=s (const 64 ((2**20))),
    u_413_418 + v_413_418 <=s (const 64 (2**20)),
    u_413_418 - v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 + v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 - v_413_418 <=s (const 64 (2**20)),
    r_413_418 + s_413_418 <=s (const 64 (2**20)),
    r_413_418 - s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 + s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 - s_413_418 <=s (const 64 (2**20)),
    u_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_413_418 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_418_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_5,
sint64 neg_g_413_low60_0_low20_5,
sint64 neg_f_413_low60_0_low20_6,
sint64 neg_g_413_low60_0_low20_6,
sint64 u_413_418,
sint64 v_413_418,
sint64 r_413_418,
sint64 s_413_418,
sint64 u_413_419,
sint64 v_413_419,
sint64 r_413_419,
sint64 s_413_419,
bit ne
)={
    u_413_418 * neg_f_413_low60_0_low20_0 + v_413_418 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_5 * (-(2**20)),
    r_413_418 * neg_f_413_low60_0_low20_0 + s_413_418 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_5 * (-(2**20))
&&
    u_413_418 * neg_f_413_low60_0_low20_0 + v_413_418 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_5 * (const 64 (-(2**20))),
    r_413_418 * neg_f_413_low60_0_low20_0 + s_413_418 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_5 + u_413_418 * (const 64 (2**21)) + v_413_418 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_5 + r_413_418 * (const 64 (2**21)) + s_413_418 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_5,
    neg_f_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_5,
    neg_g_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 418)) <=s delta, delta <=s (const 64 (1 + 2*418)),
    (const 64 (-(2**20))) <=s u_413_418, u_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_418, v_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_418, r_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_418, s_413_418 <=s (const 64 ((2**20))),
    u_413_418 + v_413_418 <=s (const 64 (2**20)),
    u_413_418 - v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 + v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 - v_413_418 <=s (const 64 (2**20)),
    r_413_418 + s_413_418 <=s (const 64 (2**20)),
    r_413_418 - s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 + s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 - s_413_418 <=s (const 64 (2**20)),
    u_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_413_418 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step418

// premise a
assume
neg_g_413_low60_0_low20_5 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_5 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_6 neg_f_413_low60_0_low20_5;
mov u_413_419 u_413_418;
mov v_413_419 v_413_418;

asr neg_g_413_low60_0_low20_6 neg_g_413_low60_0_low20_5 1;
asr r_413_419 r_413_418 1;
asr s_413_419 s_413_418 1;
assert
    true
&&
    neg_f_413_low60_0_low20_6 = neg_f_413_low60_0_low20_5,
    u_413_419 = u_413_418,
    v_413_419 = v_413_418,
    neg_g_413_low60_0_low20_6 * (const 64 2) = neg_g_413_low60_0_low20_5,
    r_413_419 * (const 64 2) = r_413_418,
    s_413_419 * (const 64 2) = s_413_418
;

assume
    neg_f_413_low60_0_low20_6 = neg_f_413_low60_0_low20_5,
    u_413_419 = u_413_418,
    v_413_419 = v_413_418,
    neg_g_413_low60_0_low20_6 * 2 = neg_g_413_low60_0_low20_5,
    r_413_419 * 2 = r_413_418,
    s_413_419 * 2 = s_413_418
&&
    true
;

{
    u_413_419 * neg_f_413_low60_0_low20_0 + v_413_419 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_419 * neg_f_413_low60_0_low20_0 + s_413_419 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_6 + u_413_419 * (const 64 (2**21)) + v_413_419 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_6 + r_413_419 * (const 64 (2**21)) + s_413_419 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_6,
    neg_f_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_6,
    neg_g_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 419)) <=s delta, delta <=s (const 64 (1 + 2*419)),
    (const 64 (-(2**20))) <=s u_413_419, u_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_419, v_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_419, r_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_419, s_413_419 <=s (const 64 ((2**20))),
    u_413_419 + v_413_419 <=s (const 64 (2**20)),
    u_413_419 - v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 + v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 - v_413_419 <=s (const 64 (2**20)),
    r_413_419 + s_413_419 <=s (const 64 (2**20)),
    r_413_419 - s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 + s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 - s_413_419 <=s (const 64 (2**20)),
    u_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_413_419 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_418_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_5,
sint64 neg_g_413_low60_0_low20_5,
sint64 neg_f_413_low60_0_low20_6,
sint64 neg_g_413_low60_0_low20_6,
sint64 u_413_418,
sint64 v_413_418,
sint64 r_413_418,
sint64 s_413_418,
sint64 u_413_419,
sint64 v_413_419,
sint64 r_413_419,
sint64 s_413_419,
bit ne
)={
    u_413_418 * neg_f_413_low60_0_low20_0 + v_413_418 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_5 * (-(2**20)),
    r_413_418 * neg_f_413_low60_0_low20_0 + s_413_418 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_5 * (-(2**20))
&&
    u_413_418 * neg_f_413_low60_0_low20_0 + v_413_418 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_5 * (const 64 (-(2**20))),
    r_413_418 * neg_f_413_low60_0_low20_0 + s_413_418 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_5 + u_413_418 * (const 64 (2**21)) + v_413_418 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_5 + r_413_418 * (const 64 (2**21)) + s_413_418 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_5,
    neg_f_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_5,
    neg_g_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 418)) <=s delta, delta <=s (const 64 (1 + 2*418)),
    (const 64 (-(2**20))) <=s u_413_418, u_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_418, v_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_418, r_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_418, s_413_418 <=s (const 64 ((2**20))),
    u_413_418 + v_413_418 <=s (const 64 (2**20)),
    u_413_418 - v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 + v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 - v_413_418 <=s (const 64 (2**20)),
    r_413_418 + s_413_418 <=s (const 64 (2**20)),
    r_413_418 - s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 + s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 - s_413_418 <=s (const 64 (2**20)),
    u_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_413_418 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step418

// premise b
assume
neg_g_413_low60_0_low20_5 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_6 neg_f_413_low60_0_low20_5;
mov u_413_419 u_413_418;
mov v_413_419 v_413_418;

add neg_g_413_low60_0_low20_6 neg_g_413_low60_0_low20_5 neg_f_413_low60_0_low20_5;
asr neg_g_413_low60_0_low20_6 neg_g_413_low60_0_low20_6 1;
add r_413_419 r_413_418 u_413_418;
asr r_413_419 r_413_419 1;
add s_413_419 s_413_418 v_413_418;
asr s_413_419 s_413_419 1;
assert
    true
&&
    neg_f_413_low60_0_low20_6 = neg_f_413_low60_0_low20_5,
    u_413_419 = u_413_418,
    v_413_419 = v_413_418,
    neg_g_413_low60_0_low20_6 * (const 64 2) = neg_g_413_low60_0_low20_5 + neg_f_413_low60_0_low20_5,
    r_413_419 * (const 64 2) = r_413_418 + u_413_418,
    s_413_419 * (const 64 2) = s_413_418 + v_413_418
;

assume
    neg_f_413_low60_0_low20_6 = neg_f_413_low60_0_low20_5,
    u_413_419 = u_413_418,
    v_413_419 = v_413_418,
    neg_g_413_low60_0_low20_6 * 2 = neg_g_413_low60_0_low20_5 + neg_f_413_low60_0_low20_5,
    r_413_419 * 2 = r_413_418 + u_413_418,
    s_413_419 * 2 = s_413_418 + v_413_418
&&
    true
;

{
    u_413_419 * neg_f_413_low60_0_low20_0 + v_413_419 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_419 * neg_f_413_low60_0_low20_0 + s_413_419 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_6 + u_413_419 * (const 64 (2**21)) + v_413_419 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_6 + r_413_419 * (const 64 (2**21)) + s_413_419 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_6,
    neg_f_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_6,
    neg_g_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 419)) <=s delta, delta <=s (const 64 (1 + 2*419)),
    (const 64 (-(2**20))) <=s u_413_419, u_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_419, v_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_419, r_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_419, s_413_419 <=s (const 64 ((2**20))),
    u_413_419 + v_413_419 <=s (const 64 (2**20)),
    u_413_419 - v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 + v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 - v_413_419 <=s (const 64 (2**20)),
    r_413_419 + s_413_419 <=s (const 64 (2**20)),
    r_413_419 - s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 + s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 - s_413_419 <=s (const 64 (2**20)),
    u_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_413_419 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_418_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_5,
sint64 neg_g_413_low60_0_low20_5,
sint64 neg_f_413_low60_0_low20_6,
sint64 neg_g_413_low60_0_low20_6,
sint64 u_413_418,
sint64 v_413_418,
sint64 r_413_418,
sint64 s_413_418,
sint64 u_413_419,
sint64 v_413_419,
sint64 r_413_419,
sint64 s_413_419,
bit ne
)={
    u_413_418 * neg_f_413_low60_0_low20_0 + v_413_418 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_5 * (-(2**20)),
    r_413_418 * neg_f_413_low60_0_low20_0 + s_413_418 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_5 * (-(2**20))
&&
    u_413_418 * neg_f_413_low60_0_low20_0 + v_413_418 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_5 * (const 64 (-(2**20))),
    r_413_418 * neg_f_413_low60_0_low20_0 + s_413_418 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_5 + u_413_418 * (const 64 (2**21)) + v_413_418 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_5 + r_413_418 * (const 64 (2**21)) + s_413_418 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_5,
    neg_f_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_5,
    neg_g_413_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 418)) <=s delta, delta <=s (const 64 (1 + 2*418)),
    (const 64 (-(2**20))) <=s u_413_418, u_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_418, v_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_418, r_413_418 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_418, s_413_418 <=s (const 64 ((2**20))),
    u_413_418 + v_413_418 <=s (const 64 (2**20)),
    u_413_418 - v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 + v_413_418 <=s (const 64 (2**20)),
    (const 64 0) - u_413_418 - v_413_418 <=s (const 64 (2**20)),
    r_413_418 + s_413_418 <=s (const 64 (2**20)),
    r_413_418 - s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 + s_413_418 <=s (const 64 (2**20)),
    (const 64 0) - r_413_418 - s_413_418 <=s (const 64 (2**20)),
    u_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_413_418 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_413_418 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step418

// premise c
assume
neg_g_413_low60_0_low20_5 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_6 neg_g_413_low60_0_low20_5;
mov u_413_419 r_413_418;
mov v_413_419 s_413_418;

subs dc neg_g_413_low60_0_low20_6 neg_g_413_low60_0_low20_5 neg_f_413_low60_0_low20_5;
asr neg_g_413_low60_0_low20_6 neg_g_413_low60_0_low20_6 1;
subs dc r_413_419 r_413_418 u_413_418;
asr r_413_419 r_413_419 1;
subs dc s_413_419 s_413_418 v_413_418;
asr s_413_419 s_413_419 1;
assert
    true
&&
    neg_f_413_low60_0_low20_6 = neg_g_413_low60_0_low20_5,
    u_413_419 = r_413_418,
    v_413_419 = s_413_418,
    neg_g_413_low60_0_low20_6 * (const 64 2) = neg_g_413_low60_0_low20_5 - neg_f_413_low60_0_low20_5,
    r_413_419 * (const 64 2) = r_413_418 - u_413_418,
    s_413_419 * (const 64 2) = s_413_418 - v_413_418
;

assume
    neg_f_413_low60_0_low20_6 = neg_g_413_low60_0_low20_5,
    u_413_419 = r_413_418,
    v_413_419 = s_413_418,
    neg_g_413_low60_0_low20_6 * 2 = neg_g_413_low60_0_low20_5 - neg_f_413_low60_0_low20_5,
    r_413_419 * 2 = r_413_418 - u_413_418,
    s_413_419 * 2 = s_413_418 - v_413_418
&&
    true
;

{
    u_413_419 * neg_f_413_low60_0_low20_0 + v_413_419 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_419 * neg_f_413_low60_0_low20_0 + s_413_419 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_6 + u_413_419 * (const 64 (2**21)) + v_413_419 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_6 + r_413_419 * (const 64 (2**21)) + s_413_419 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_6,
    neg_f_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_6,
    neg_g_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 419)) <=s delta, delta <=s (const 64 (1 + 2*419)),
    (const 64 (-(2**20))) <=s u_413_419, u_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_419, v_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_419, r_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_419, s_413_419 <=s (const 64 ((2**20))),
    u_413_419 + v_413_419 <=s (const 64 (2**20)),
    u_413_419 - v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 + v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 - v_413_419 <=s (const 64 (2**20)),
    r_413_419 + s_413_419 <=s (const 64 (2**20)),
    r_413_419 - s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 + s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 - s_413_419 <=s (const 64 (2**20)),
    u_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_413_419 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_419_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_6,
sint64 neg_g_413_low60_0_low20_6,
sint64 neg_f_413_low60_0_low20_7,
sint64 neg_g_413_low60_0_low20_7,
sint64 u_413_419,
sint64 v_413_419,
sint64 r_413_419,
sint64 s_413_419,
sint64 u_413_420,
sint64 v_413_420,
sint64 r_413_420,
sint64 s_413_420,
bit ne
)={
    u_413_419 * neg_f_413_low60_0_low20_0 + v_413_419 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_6 * (-(2**20)),
    r_413_419 * neg_f_413_low60_0_low20_0 + s_413_419 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_6 * (-(2**20))
&&
    u_413_419 * neg_f_413_low60_0_low20_0 + v_413_419 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_6 * (const 64 (-(2**20))),
    r_413_419 * neg_f_413_low60_0_low20_0 + s_413_419 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_6 + u_413_419 * (const 64 (2**21)) + v_413_419 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_6 + r_413_419 * (const 64 (2**21)) + s_413_419 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_6,
    neg_f_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_6,
    neg_g_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 419)) <=s delta, delta <=s (const 64 (1 + 2*419)),
    (const 64 (-(2**20))) <=s u_413_419, u_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_419, v_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_419, r_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_419, s_413_419 <=s (const 64 ((2**20))),
    u_413_419 + v_413_419 <=s (const 64 (2**20)),
    u_413_419 - v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 + v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 - v_413_419 <=s (const 64 (2**20)),
    r_413_419 + s_413_419 <=s (const 64 (2**20)),
    r_413_419 - s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 + s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 - s_413_419 <=s (const 64 (2**20)),
    u_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_413_419 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step419

// premise a
assume
neg_g_413_low60_0_low20_6 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_6 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_7 neg_f_413_low60_0_low20_6;
mov u_413_420 u_413_419;
mov v_413_420 v_413_419;

asr neg_g_413_low60_0_low20_7 neg_g_413_low60_0_low20_6 1;
asr r_413_420 r_413_419 1;
asr s_413_420 s_413_419 1;
assert
    true
&&
    neg_f_413_low60_0_low20_7 = neg_f_413_low60_0_low20_6,
    u_413_420 = u_413_419,
    v_413_420 = v_413_419,
    neg_g_413_low60_0_low20_7 * (const 64 2) = neg_g_413_low60_0_low20_6,
    r_413_420 * (const 64 2) = r_413_419,
    s_413_420 * (const 64 2) = s_413_419
;

assume
    neg_f_413_low60_0_low20_7 = neg_f_413_low60_0_low20_6,
    u_413_420 = u_413_419,
    v_413_420 = v_413_419,
    neg_g_413_low60_0_low20_7 * 2 = neg_g_413_low60_0_low20_6,
    r_413_420 * 2 = r_413_419,
    s_413_420 * 2 = s_413_419
&&
    true
;

{
    u_413_420 * neg_f_413_low60_0_low20_0 + v_413_420 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_420 * neg_f_413_low60_0_low20_0 + s_413_420 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_7 + u_413_420 * (const 64 (2**21)) + v_413_420 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_7 + r_413_420 * (const 64 (2**21)) + s_413_420 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_7,
    neg_f_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_7,
    neg_g_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 420)) <=s delta, delta <=s (const 64 (1 + 2*420)),
    (const 64 (-(2**20))) <=s u_413_420, u_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_420, v_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_420, r_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_420, s_413_420 <=s (const 64 ((2**20))),
    u_413_420 + v_413_420 <=s (const 64 (2**20)),
    u_413_420 - v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 + v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 - v_413_420 <=s (const 64 (2**20)),
    r_413_420 + s_413_420 <=s (const 64 (2**20)),
    r_413_420 - s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 + s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 - s_413_420 <=s (const 64 (2**20)),
    u_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_413_420 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_419_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_6,
sint64 neg_g_413_low60_0_low20_6,
sint64 neg_f_413_low60_0_low20_7,
sint64 neg_g_413_low60_0_low20_7,
sint64 u_413_419,
sint64 v_413_419,
sint64 r_413_419,
sint64 s_413_419,
sint64 u_413_420,
sint64 v_413_420,
sint64 r_413_420,
sint64 s_413_420,
bit ne
)={
    u_413_419 * neg_f_413_low60_0_low20_0 + v_413_419 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_6 * (-(2**20)),
    r_413_419 * neg_f_413_low60_0_low20_0 + s_413_419 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_6 * (-(2**20))
&&
    u_413_419 * neg_f_413_low60_0_low20_0 + v_413_419 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_6 * (const 64 (-(2**20))),
    r_413_419 * neg_f_413_low60_0_low20_0 + s_413_419 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_6 + u_413_419 * (const 64 (2**21)) + v_413_419 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_6 + r_413_419 * (const 64 (2**21)) + s_413_419 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_6,
    neg_f_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_6,
    neg_g_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 419)) <=s delta, delta <=s (const 64 (1 + 2*419)),
    (const 64 (-(2**20))) <=s u_413_419, u_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_419, v_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_419, r_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_419, s_413_419 <=s (const 64 ((2**20))),
    u_413_419 + v_413_419 <=s (const 64 (2**20)),
    u_413_419 - v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 + v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 - v_413_419 <=s (const 64 (2**20)),
    r_413_419 + s_413_419 <=s (const 64 (2**20)),
    r_413_419 - s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 + s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 - s_413_419 <=s (const 64 (2**20)),
    u_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_413_419 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step419

// premise b
assume
neg_g_413_low60_0_low20_6 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_7 neg_f_413_low60_0_low20_6;
mov u_413_420 u_413_419;
mov v_413_420 v_413_419;

add neg_g_413_low60_0_low20_7 neg_g_413_low60_0_low20_6 neg_f_413_low60_0_low20_6;
asr neg_g_413_low60_0_low20_7 neg_g_413_low60_0_low20_7 1;
add r_413_420 r_413_419 u_413_419;
asr r_413_420 r_413_420 1;
add s_413_420 s_413_419 v_413_419;
asr s_413_420 s_413_420 1;
assert
    true
&&
    neg_f_413_low60_0_low20_7 = neg_f_413_low60_0_low20_6,
    u_413_420 = u_413_419,
    v_413_420 = v_413_419,
    neg_g_413_low60_0_low20_7 * (const 64 2) = neg_g_413_low60_0_low20_6 + neg_f_413_low60_0_low20_6,
    r_413_420 * (const 64 2) = r_413_419 + u_413_419,
    s_413_420 * (const 64 2) = s_413_419 + v_413_419
;

assume
    neg_f_413_low60_0_low20_7 = neg_f_413_low60_0_low20_6,
    u_413_420 = u_413_419,
    v_413_420 = v_413_419,
    neg_g_413_low60_0_low20_7 * 2 = neg_g_413_low60_0_low20_6 + neg_f_413_low60_0_low20_6,
    r_413_420 * 2 = r_413_419 + u_413_419,
    s_413_420 * 2 = s_413_419 + v_413_419
&&
    true
;

{
    u_413_420 * neg_f_413_low60_0_low20_0 + v_413_420 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_420 * neg_f_413_low60_0_low20_0 + s_413_420 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_7 + u_413_420 * (const 64 (2**21)) + v_413_420 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_7 + r_413_420 * (const 64 (2**21)) + s_413_420 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_7,
    neg_f_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_7,
    neg_g_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 420)) <=s delta, delta <=s (const 64 (1 + 2*420)),
    (const 64 (-(2**20))) <=s u_413_420, u_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_420, v_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_420, r_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_420, s_413_420 <=s (const 64 ((2**20))),
    u_413_420 + v_413_420 <=s (const 64 (2**20)),
    u_413_420 - v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 + v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 - v_413_420 <=s (const 64 (2**20)),
    r_413_420 + s_413_420 <=s (const 64 (2**20)),
    r_413_420 - s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 + s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 - s_413_420 <=s (const 64 (2**20)),
    u_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_413_420 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_419_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_6,
sint64 neg_g_413_low60_0_low20_6,
sint64 neg_f_413_low60_0_low20_7,
sint64 neg_g_413_low60_0_low20_7,
sint64 u_413_419,
sint64 v_413_419,
sint64 r_413_419,
sint64 s_413_419,
sint64 u_413_420,
sint64 v_413_420,
sint64 r_413_420,
sint64 s_413_420,
bit ne
)={
    u_413_419 * neg_f_413_low60_0_low20_0 + v_413_419 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_6 * (-(2**20)),
    r_413_419 * neg_f_413_low60_0_low20_0 + s_413_419 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_6 * (-(2**20))
&&
    u_413_419 * neg_f_413_low60_0_low20_0 + v_413_419 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_6 * (const 64 (-(2**20))),
    r_413_419 * neg_f_413_low60_0_low20_0 + s_413_419 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_6 + u_413_419 * (const 64 (2**21)) + v_413_419 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_6 + r_413_419 * (const 64 (2**21)) + s_413_419 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_6,
    neg_f_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_6,
    neg_g_413_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 419)) <=s delta, delta <=s (const 64 (1 + 2*419)),
    (const 64 (-(2**20))) <=s u_413_419, u_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_419, v_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_419, r_413_419 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_419, s_413_419 <=s (const 64 ((2**20))),
    u_413_419 + v_413_419 <=s (const 64 (2**20)),
    u_413_419 - v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 + v_413_419 <=s (const 64 (2**20)),
    (const 64 0) - u_413_419 - v_413_419 <=s (const 64 (2**20)),
    r_413_419 + s_413_419 <=s (const 64 (2**20)),
    r_413_419 - s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 + s_413_419 <=s (const 64 (2**20)),
    (const 64 0) - r_413_419 - s_413_419 <=s (const 64 (2**20)),
    u_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_413_419 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_413_419 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step419

// premise c
assume
neg_g_413_low60_0_low20_6 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_7 neg_g_413_low60_0_low20_6;
mov u_413_420 r_413_419;
mov v_413_420 s_413_419;

subs dc neg_g_413_low60_0_low20_7 neg_g_413_low60_0_low20_6 neg_f_413_low60_0_low20_6;
asr neg_g_413_low60_0_low20_7 neg_g_413_low60_0_low20_7 1;
subs dc r_413_420 r_413_419 u_413_419;
asr r_413_420 r_413_420 1;
subs dc s_413_420 s_413_419 v_413_419;
asr s_413_420 s_413_420 1;
assert
    true
&&
    neg_f_413_low60_0_low20_7 = neg_g_413_low60_0_low20_6,
    u_413_420 = r_413_419,
    v_413_420 = s_413_419,
    neg_g_413_low60_0_low20_7 * (const 64 2) = neg_g_413_low60_0_low20_6 - neg_f_413_low60_0_low20_6,
    r_413_420 * (const 64 2) = r_413_419 - u_413_419,
    s_413_420 * (const 64 2) = s_413_419 - v_413_419
;

assume
    neg_f_413_low60_0_low20_7 = neg_g_413_low60_0_low20_6,
    u_413_420 = r_413_419,
    v_413_420 = s_413_419,
    neg_g_413_low60_0_low20_7 * 2 = neg_g_413_low60_0_low20_6 - neg_f_413_low60_0_low20_6,
    r_413_420 * 2 = r_413_419 - u_413_419,
    s_413_420 * 2 = s_413_419 - v_413_419
&&
    true
;

{
    u_413_420 * neg_f_413_low60_0_low20_0 + v_413_420 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_420 * neg_f_413_low60_0_low20_0 + s_413_420 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_7 + u_413_420 * (const 64 (2**21)) + v_413_420 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_7 + r_413_420 * (const 64 (2**21)) + s_413_420 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_7,
    neg_f_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_7,
    neg_g_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 420)) <=s delta, delta <=s (const 64 (1 + 2*420)),
    (const 64 (-(2**20))) <=s u_413_420, u_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_420, v_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_420, r_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_420, s_413_420 <=s (const 64 ((2**20))),
    u_413_420 + v_413_420 <=s (const 64 (2**20)),
    u_413_420 - v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 + v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 - v_413_420 <=s (const 64 (2**20)),
    r_413_420 + s_413_420 <=s (const 64 (2**20)),
    r_413_420 - s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 + s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 - s_413_420 <=s (const 64 (2**20)),
    u_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_413_420 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_420_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_7,
sint64 neg_g_413_low60_0_low20_7,
sint64 neg_f_413_low60_0_low20_8,
sint64 neg_g_413_low60_0_low20_8,
sint64 u_413_420,
sint64 v_413_420,
sint64 r_413_420,
sint64 s_413_420,
sint64 u_413_421,
sint64 v_413_421,
sint64 r_413_421,
sint64 s_413_421,
bit ne
)={
    u_413_420 * neg_f_413_low60_0_low20_0 + v_413_420 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_7 * (-(2**20)),
    r_413_420 * neg_f_413_low60_0_low20_0 + s_413_420 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_7 * (-(2**20))
&&
    u_413_420 * neg_f_413_low60_0_low20_0 + v_413_420 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_7 * (const 64 (-(2**20))),
    r_413_420 * neg_f_413_low60_0_low20_0 + s_413_420 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_7 + u_413_420 * (const 64 (2**21)) + v_413_420 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_7 + r_413_420 * (const 64 (2**21)) + s_413_420 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_7,
    neg_f_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_7,
    neg_g_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 420)) <=s delta, delta <=s (const 64 (1 + 2*420)),
    (const 64 (-(2**20))) <=s u_413_420, u_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_420, v_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_420, r_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_420, s_413_420 <=s (const 64 ((2**20))),
    u_413_420 + v_413_420 <=s (const 64 (2**20)),
    u_413_420 - v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 + v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 - v_413_420 <=s (const 64 (2**20)),
    r_413_420 + s_413_420 <=s (const 64 (2**20)),
    r_413_420 - s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 + s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 - s_413_420 <=s (const 64 (2**20)),
    u_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_413_420 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step420

// premise a
assume
neg_g_413_low60_0_low20_7 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_7 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_8 neg_f_413_low60_0_low20_7;
mov u_413_421 u_413_420;
mov v_413_421 v_413_420;

asr neg_g_413_low60_0_low20_8 neg_g_413_low60_0_low20_7 1;
asr r_413_421 r_413_420 1;
asr s_413_421 s_413_420 1;
assert
    true
&&
    neg_f_413_low60_0_low20_8 = neg_f_413_low60_0_low20_7,
    u_413_421 = u_413_420,
    v_413_421 = v_413_420,
    neg_g_413_low60_0_low20_8 * (const 64 2) = neg_g_413_low60_0_low20_7,
    r_413_421 * (const 64 2) = r_413_420,
    s_413_421 * (const 64 2) = s_413_420
;

assume
    neg_f_413_low60_0_low20_8 = neg_f_413_low60_0_low20_7,
    u_413_421 = u_413_420,
    v_413_421 = v_413_420,
    neg_g_413_low60_0_low20_8 * 2 = neg_g_413_low60_0_low20_7,
    r_413_421 * 2 = r_413_420,
    s_413_421 * 2 = s_413_420
&&
    true
;

{
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_8 + u_413_421 * (const 64 (2**21)) + v_413_421 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_8 + r_413_421 * (const 64 (2**21)) + s_413_421 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_8,
    neg_f_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_8,
    neg_g_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 421)) <=s delta, delta <=s (const 64 (1 + 2*421)),
    (const 64 (-(2**20))) <=s u_413_421, u_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_421, v_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_421, r_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_421, s_413_421 <=s (const 64 ((2**20))),
    u_413_421 + v_413_421 <=s (const 64 (2**20)),
    u_413_421 - v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 + v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 - v_413_421 <=s (const 64 (2**20)),
    r_413_421 + s_413_421 <=s (const 64 (2**20)),
    r_413_421 - s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 + s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 - s_413_421 <=s (const 64 (2**20)),
    u_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_413_421 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_420_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_7,
sint64 neg_g_413_low60_0_low20_7,
sint64 neg_f_413_low60_0_low20_8,
sint64 neg_g_413_low60_0_low20_8,
sint64 u_413_420,
sint64 v_413_420,
sint64 r_413_420,
sint64 s_413_420,
sint64 u_413_421,
sint64 v_413_421,
sint64 r_413_421,
sint64 s_413_421,
bit ne
)={
    u_413_420 * neg_f_413_low60_0_low20_0 + v_413_420 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_7 * (-(2**20)),
    r_413_420 * neg_f_413_low60_0_low20_0 + s_413_420 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_7 * (-(2**20))
&&
    u_413_420 * neg_f_413_low60_0_low20_0 + v_413_420 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_7 * (const 64 (-(2**20))),
    r_413_420 * neg_f_413_low60_0_low20_0 + s_413_420 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_7 + u_413_420 * (const 64 (2**21)) + v_413_420 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_7 + r_413_420 * (const 64 (2**21)) + s_413_420 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_7,
    neg_f_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_7,
    neg_g_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 420)) <=s delta, delta <=s (const 64 (1 + 2*420)),
    (const 64 (-(2**20))) <=s u_413_420, u_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_420, v_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_420, r_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_420, s_413_420 <=s (const 64 ((2**20))),
    u_413_420 + v_413_420 <=s (const 64 (2**20)),
    u_413_420 - v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 + v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 - v_413_420 <=s (const 64 (2**20)),
    r_413_420 + s_413_420 <=s (const 64 (2**20)),
    r_413_420 - s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 + s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 - s_413_420 <=s (const 64 (2**20)),
    u_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_413_420 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step420

// premise b
assume
neg_g_413_low60_0_low20_7 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_8 neg_f_413_low60_0_low20_7;
mov u_413_421 u_413_420;
mov v_413_421 v_413_420;

add neg_g_413_low60_0_low20_8 neg_g_413_low60_0_low20_7 neg_f_413_low60_0_low20_7;
asr neg_g_413_low60_0_low20_8 neg_g_413_low60_0_low20_8 1;
add r_413_421 r_413_420 u_413_420;
asr r_413_421 r_413_421 1;
add s_413_421 s_413_420 v_413_420;
asr s_413_421 s_413_421 1;
assert
    true
&&
    neg_f_413_low60_0_low20_8 = neg_f_413_low60_0_low20_7,
    u_413_421 = u_413_420,
    v_413_421 = v_413_420,
    neg_g_413_low60_0_low20_8 * (const 64 2) = neg_g_413_low60_0_low20_7 + neg_f_413_low60_0_low20_7,
    r_413_421 * (const 64 2) = r_413_420 + u_413_420,
    s_413_421 * (const 64 2) = s_413_420 + v_413_420
;

assume
    neg_f_413_low60_0_low20_8 = neg_f_413_low60_0_low20_7,
    u_413_421 = u_413_420,
    v_413_421 = v_413_420,
    neg_g_413_low60_0_low20_8 * 2 = neg_g_413_low60_0_low20_7 + neg_f_413_low60_0_low20_7,
    r_413_421 * 2 = r_413_420 + u_413_420,
    s_413_421 * 2 = s_413_420 + v_413_420
&&
    true
;

{
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_8 + u_413_421 * (const 64 (2**21)) + v_413_421 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_8 + r_413_421 * (const 64 (2**21)) + s_413_421 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_8,
    neg_f_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_8,
    neg_g_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 421)) <=s delta, delta <=s (const 64 (1 + 2*421)),
    (const 64 (-(2**20))) <=s u_413_421, u_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_421, v_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_421, r_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_421, s_413_421 <=s (const 64 ((2**20))),
    u_413_421 + v_413_421 <=s (const 64 (2**20)),
    u_413_421 - v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 + v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 - v_413_421 <=s (const 64 (2**20)),
    r_413_421 + s_413_421 <=s (const 64 (2**20)),
    r_413_421 - s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 + s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 - s_413_421 <=s (const 64 (2**20)),
    u_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_413_421 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_420_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_7,
sint64 neg_g_413_low60_0_low20_7,
sint64 neg_f_413_low60_0_low20_8,
sint64 neg_g_413_low60_0_low20_8,
sint64 u_413_420,
sint64 v_413_420,
sint64 r_413_420,
sint64 s_413_420,
sint64 u_413_421,
sint64 v_413_421,
sint64 r_413_421,
sint64 s_413_421,
bit ne
)={
    u_413_420 * neg_f_413_low60_0_low20_0 + v_413_420 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_7 * (-(2**20)),
    r_413_420 * neg_f_413_low60_0_low20_0 + s_413_420 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_7 * (-(2**20))
&&
    u_413_420 * neg_f_413_low60_0_low20_0 + v_413_420 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_7 * (const 64 (-(2**20))),
    r_413_420 * neg_f_413_low60_0_low20_0 + s_413_420 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_7 + u_413_420 * (const 64 (2**21)) + v_413_420 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_7 + r_413_420 * (const 64 (2**21)) + s_413_420 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_7,
    neg_f_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_7,
    neg_g_413_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 420)) <=s delta, delta <=s (const 64 (1 + 2*420)),
    (const 64 (-(2**20))) <=s u_413_420, u_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_420, v_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_420, r_413_420 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_420, s_413_420 <=s (const 64 ((2**20))),
    u_413_420 + v_413_420 <=s (const 64 (2**20)),
    u_413_420 - v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 + v_413_420 <=s (const 64 (2**20)),
    (const 64 0) - u_413_420 - v_413_420 <=s (const 64 (2**20)),
    r_413_420 + s_413_420 <=s (const 64 (2**20)),
    r_413_420 - s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 + s_413_420 <=s (const 64 (2**20)),
    (const 64 0) - r_413_420 - s_413_420 <=s (const 64 (2**20)),
    u_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_413_420 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_413_420 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step420

// premise c
assume
neg_g_413_low60_0_low20_7 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_8 neg_g_413_low60_0_low20_7;
mov u_413_421 r_413_420;
mov v_413_421 s_413_420;

subs dc neg_g_413_low60_0_low20_8 neg_g_413_low60_0_low20_7 neg_f_413_low60_0_low20_7;
asr neg_g_413_low60_0_low20_8 neg_g_413_low60_0_low20_8 1;
subs dc r_413_421 r_413_420 u_413_420;
asr r_413_421 r_413_421 1;
subs dc s_413_421 s_413_420 v_413_420;
asr s_413_421 s_413_421 1;
assert
    true
&&
    neg_f_413_low60_0_low20_8 = neg_g_413_low60_0_low20_7,
    u_413_421 = r_413_420,
    v_413_421 = s_413_420,
    neg_g_413_low60_0_low20_8 * (const 64 2) = neg_g_413_low60_0_low20_7 - neg_f_413_low60_0_low20_7,
    r_413_421 * (const 64 2) = r_413_420 - u_413_420,
    s_413_421 * (const 64 2) = s_413_420 - v_413_420
;

assume
    neg_f_413_low60_0_low20_8 = neg_g_413_low60_0_low20_7,
    u_413_421 = r_413_420,
    v_413_421 = s_413_420,
    neg_g_413_low60_0_low20_8 * 2 = neg_g_413_low60_0_low20_7 - neg_f_413_low60_0_low20_7,
    r_413_421 * 2 = r_413_420 - u_413_420,
    s_413_421 * 2 = s_413_420 - v_413_420
&&
    true
;

{
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_8 + u_413_421 * (const 64 (2**21)) + v_413_421 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_8 + r_413_421 * (const 64 (2**21)) + s_413_421 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_8,
    neg_f_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_8,
    neg_g_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 421)) <=s delta, delta <=s (const 64 (1 + 2*421)),
    (const 64 (-(2**20))) <=s u_413_421, u_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_421, v_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_421, r_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_421, s_413_421 <=s (const 64 ((2**20))),
    u_413_421 + v_413_421 <=s (const 64 (2**20)),
    u_413_421 - v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 + v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 - v_413_421 <=s (const 64 (2**20)),
    r_413_421 + s_413_421 <=s (const 64 (2**20)),
    r_413_421 - s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 + s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 - s_413_421 <=s (const 64 (2**20)),
    u_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_413_421 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_421_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_8,
sint64 neg_g_413_low60_0_low20_8,
sint64 neg_f_413_low60_0_low20_9,
sint64 neg_g_413_low60_0_low20_9,
sint64 u_413_421,
sint64 v_413_421,
sint64 r_413_421,
sint64 s_413_421,
sint64 u_413_422,
sint64 v_413_422,
sint64 r_413_422,
sint64 s_413_422,
bit ne
)={
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (-(2**20)),
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (-(2**20))
&&
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (const 64 (-(2**20))),
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_8 + u_413_421 * (const 64 (2**21)) + v_413_421 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_8 + r_413_421 * (const 64 (2**21)) + s_413_421 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_8,
    neg_f_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_8,
    neg_g_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 421)) <=s delta, delta <=s (const 64 (1 + 2*421)),
    (const 64 (-(2**20))) <=s u_413_421, u_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_421, v_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_421, r_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_421, s_413_421 <=s (const 64 ((2**20))),
    u_413_421 + v_413_421 <=s (const 64 (2**20)),
    u_413_421 - v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 + v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 - v_413_421 <=s (const 64 (2**20)),
    r_413_421 + s_413_421 <=s (const 64 (2**20)),
    r_413_421 - s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 + s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 - s_413_421 <=s (const 64 (2**20)),
    u_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_413_421 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step421

// premise a
assume
neg_g_413_low60_0_low20_8 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_8 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_9 neg_f_413_low60_0_low20_8;
mov u_413_422 u_413_421;
mov v_413_422 v_413_421;

asr neg_g_413_low60_0_low20_9 neg_g_413_low60_0_low20_8 1;
asr r_413_422 r_413_421 1;
asr s_413_422 s_413_421 1;
assert
    true
&&
    neg_f_413_low60_0_low20_9 = neg_f_413_low60_0_low20_8,
    u_413_422 = u_413_421,
    v_413_422 = v_413_421,
    neg_g_413_low60_0_low20_9 * (const 64 2) = neg_g_413_low60_0_low20_8,
    r_413_422 * (const 64 2) = r_413_421,
    s_413_422 * (const 64 2) = s_413_421
;

assume
    neg_f_413_low60_0_low20_9 = neg_f_413_low60_0_low20_8,
    u_413_422 = u_413_421,
    v_413_422 = v_413_421,
    neg_g_413_low60_0_low20_9 * 2 = neg_g_413_low60_0_low20_8,
    r_413_422 * 2 = r_413_421,
    s_413_422 * 2 = s_413_421
&&
    true
;

{
    u_413_422 * neg_f_413_low60_0_low20_0 + v_413_422 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_422 * neg_f_413_low60_0_low20_0 + s_413_422 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_9 + u_413_422 * (const 64 (2**21)) + v_413_422 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_9 + r_413_422 * (const 64 (2**21)) + s_413_422 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_9,
    neg_f_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_9,
    neg_g_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 422)) <=s delta, delta <=s (const 64 (1 + 2*422)),
    (const 64 (-(2**20))) <=s u_413_422, u_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_422, v_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_422, r_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_422, s_413_422 <=s (const 64 ((2**20))),
    u_413_422 + v_413_422 <=s (const 64 (2**20)),
    u_413_422 - v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 + v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 - v_413_422 <=s (const 64 (2**20)),
    r_413_422 + s_413_422 <=s (const 64 (2**20)),
    r_413_422 - s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 + s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 - s_413_422 <=s (const 64 (2**20)),
    u_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_413_422 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_421_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_8,
sint64 neg_g_413_low60_0_low20_8,
sint64 neg_f_413_low60_0_low20_9,
sint64 neg_g_413_low60_0_low20_9,
sint64 u_413_421,
sint64 v_413_421,
sint64 r_413_421,
sint64 s_413_421,
sint64 u_413_422,
sint64 v_413_422,
sint64 r_413_422,
sint64 s_413_422,
bit ne
)={
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (-(2**20)),
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (-(2**20))
&&
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (const 64 (-(2**20))),
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_8 + u_413_421 * (const 64 (2**21)) + v_413_421 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_8 + r_413_421 * (const 64 (2**21)) + s_413_421 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_8,
    neg_f_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_8,
    neg_g_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 421)) <=s delta, delta <=s (const 64 (1 + 2*421)),
    (const 64 (-(2**20))) <=s u_413_421, u_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_421, v_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_421, r_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_421, s_413_421 <=s (const 64 ((2**20))),
    u_413_421 + v_413_421 <=s (const 64 (2**20)),
    u_413_421 - v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 + v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 - v_413_421 <=s (const 64 (2**20)),
    r_413_421 + s_413_421 <=s (const 64 (2**20)),
    r_413_421 - s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 + s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 - s_413_421 <=s (const 64 (2**20)),
    u_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_413_421 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step421

// premise b
assume
neg_g_413_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_9 neg_f_413_low60_0_low20_8;
mov u_413_422 u_413_421;
mov v_413_422 v_413_421;

add neg_g_413_low60_0_low20_9 neg_g_413_low60_0_low20_8 neg_f_413_low60_0_low20_8;
asr neg_g_413_low60_0_low20_9 neg_g_413_low60_0_low20_9 1;
add r_413_422 r_413_421 u_413_421;
asr r_413_422 r_413_422 1;
add s_413_422 s_413_421 v_413_421;
asr s_413_422 s_413_422 1;
assert
    true
&&
    neg_f_413_low60_0_low20_9 = neg_f_413_low60_0_low20_8,
    u_413_422 = u_413_421,
    v_413_422 = v_413_421,
    neg_g_413_low60_0_low20_9 * (const 64 2) = neg_g_413_low60_0_low20_8 + neg_f_413_low60_0_low20_8,
    r_413_422 * (const 64 2) = r_413_421 + u_413_421,
    s_413_422 * (const 64 2) = s_413_421 + v_413_421
;

assume
    neg_f_413_low60_0_low20_9 = neg_f_413_low60_0_low20_8,
    u_413_422 = u_413_421,
    v_413_422 = v_413_421,
    neg_g_413_low60_0_low20_9 * 2 = neg_g_413_low60_0_low20_8 + neg_f_413_low60_0_low20_8,
    r_413_422 * 2 = r_413_421 + u_413_421,
    s_413_422 * 2 = s_413_421 + v_413_421
&&
    true
;

{
    u_413_422 * neg_f_413_low60_0_low20_0 + v_413_422 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_422 * neg_f_413_low60_0_low20_0 + s_413_422 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_9 + u_413_422 * (const 64 (2**21)) + v_413_422 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_9 + r_413_422 * (const 64 (2**21)) + s_413_422 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_9,
    neg_f_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_9,
    neg_g_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 422)) <=s delta, delta <=s (const 64 (1 + 2*422)),
    (const 64 (-(2**20))) <=s u_413_422, u_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_422, v_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_422, r_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_422, s_413_422 <=s (const 64 ((2**20))),
    u_413_422 + v_413_422 <=s (const 64 (2**20)),
    u_413_422 - v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 + v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 - v_413_422 <=s (const 64 (2**20)),
    r_413_422 + s_413_422 <=s (const 64 (2**20)),
    r_413_422 - s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 + s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 - s_413_422 <=s (const 64 (2**20)),
    u_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_413_422 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_421_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_8,
sint64 neg_g_413_low60_0_low20_8,
sint64 neg_f_413_low60_0_low20_9,
sint64 neg_g_413_low60_0_low20_9,
sint64 u_413_421,
sint64 v_413_421,
sint64 r_413_421,
sint64 s_413_421,
sint64 u_413_422,
sint64 v_413_422,
sint64 r_413_422,
sint64 s_413_422,
bit ne
)={
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (-(2**20)),
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (-(2**20))
&&
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (const 64 (-(2**20))),
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_8 + u_413_421 * (const 64 (2**21)) + v_413_421 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_8 + r_413_421 * (const 64 (2**21)) + s_413_421 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_8,
    neg_f_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_8,
    neg_g_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 421)) <=s delta, delta <=s (const 64 (1 + 2*421)),
    (const 64 (-(2**20))) <=s u_413_421, u_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_421, v_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_421, r_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_421, s_413_421 <=s (const 64 ((2**20))),
    u_413_421 + v_413_421 <=s (const 64 (2**20)),
    u_413_421 - v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 + v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 - v_413_421 <=s (const 64 (2**20)),
    r_413_421 + s_413_421 <=s (const 64 (2**20)),
    r_413_421 - s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 + s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 - s_413_421 <=s (const 64 (2**20)),
    u_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_413_421 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step421

// premise c
assume
neg_g_413_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_9 neg_g_413_low60_0_low20_8;
mov u_413_422 r_413_421;
mov v_413_422 s_413_421;

subs dc neg_g_413_low60_0_low20_9 neg_g_413_low60_0_low20_8 neg_f_413_low60_0_low20_8;
asr neg_g_413_low60_0_low20_9 neg_g_413_low60_0_low20_9 1;
subs dc r_413_422 r_413_421 u_413_421;
asr r_413_422 r_413_422 1;
subs dc s_413_422 s_413_421 v_413_421;
asr s_413_422 s_413_422 1;
assert
    true
&&
    neg_f_413_low60_0_low20_9 = neg_g_413_low60_0_low20_8,
    u_413_422 = r_413_421,
    v_413_422 = s_413_421,
    neg_g_413_low60_0_low20_9 * (const 64 2) = neg_g_413_low60_0_low20_8 - neg_f_413_low60_0_low20_8,
    r_413_422 * (const 64 2) = r_413_421 - u_413_421,
    s_413_422 * (const 64 2) = s_413_421 - v_413_421
;

assume
    neg_f_413_low60_0_low20_9 = neg_g_413_low60_0_low20_8,
    u_413_422 = r_413_421,
    v_413_422 = s_413_421,
    neg_g_413_low60_0_low20_9 * 2 = neg_g_413_low60_0_low20_8 - neg_f_413_low60_0_low20_8,
    r_413_422 * 2 = r_413_421 - u_413_421,
    s_413_422 * 2 = s_413_421 - v_413_421
&&
    true
;

{
    u_413_422 * neg_f_413_low60_0_low20_0 + v_413_422 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_422 * neg_f_413_low60_0_low20_0 + s_413_422 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_9 + u_413_422 * (const 64 (2**21)) + v_413_422 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_9 + r_413_422 * (const 64 (2**21)) + s_413_422 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_9,
    neg_f_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_9,
    neg_g_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 422)) <=s delta, delta <=s (const 64 (1 + 2*422)),
    (const 64 (-(2**20))) <=s u_413_422, u_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_422, v_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_422, r_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_422, s_413_422 <=s (const 64 ((2**20))),
    u_413_422 + v_413_422 <=s (const 64 (2**20)),
    u_413_422 - v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 + v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 - v_413_422 <=s (const 64 (2**20)),
    r_413_422 + s_413_422 <=s (const 64 (2**20)),
    r_413_422 - s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 + s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 - s_413_422 <=s (const 64 (2**20)),
    u_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_413_422 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_422_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_9,
sint64 neg_g_413_low60_0_low20_9,
sint64 neg_f_413_low60_0_low20_10,
sint64 neg_g_413_low60_0_low20_10,
sint64 u_413_422,
sint64 v_413_422,
sint64 r_413_422,
sint64 s_413_422,
sint64 u_413_423,
sint64 v_413_423,
sint64 r_413_423,
sint64 s_413_423,
bit ne
)={
    u_413_422 * neg_f_413_low60_0_low20_0 + v_413_422 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_9 * (-(2**20)),
    r_413_422 * neg_f_413_low60_0_low20_0 + s_413_422 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_9 * (-(2**20))
&&
    u_413_422 * neg_f_413_low60_0_low20_0 + v_413_422 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_9 * (const 64 (-(2**20))),
    r_413_422 * neg_f_413_low60_0_low20_0 + s_413_422 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_9 + u_413_422 * (const 64 (2**21)) + v_413_422 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_9 + r_413_422 * (const 64 (2**21)) + s_413_422 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_9,
    neg_f_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_9,
    neg_g_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 422)) <=s delta, delta <=s (const 64 (1 + 2*422)),
    (const 64 (-(2**20))) <=s u_413_422, u_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_422, v_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_422, r_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_422, s_413_422 <=s (const 64 ((2**20))),
    u_413_422 + v_413_422 <=s (const 64 (2**20)),
    u_413_422 - v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 + v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 - v_413_422 <=s (const 64 (2**20)),
    r_413_422 + s_413_422 <=s (const 64 (2**20)),
    r_413_422 - s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 + s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 - s_413_422 <=s (const 64 (2**20)),
    u_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_413_422 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step422

// premise a
assume
neg_g_413_low60_0_low20_9 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_9 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_10 neg_f_413_low60_0_low20_9;
mov u_413_423 u_413_422;
mov v_413_423 v_413_422;

asr neg_g_413_low60_0_low20_10 neg_g_413_low60_0_low20_9 1;
asr r_413_423 r_413_422 1;
asr s_413_423 s_413_422 1;
assert
    true
&&
    neg_f_413_low60_0_low20_10 = neg_f_413_low60_0_low20_9,
    u_413_423 = u_413_422,
    v_413_423 = v_413_422,
    neg_g_413_low60_0_low20_10 * (const 64 2) = neg_g_413_low60_0_low20_9,
    r_413_423 * (const 64 2) = r_413_422,
    s_413_423 * (const 64 2) = s_413_422
;

assume
    neg_f_413_low60_0_low20_10 = neg_f_413_low60_0_low20_9,
    u_413_423 = u_413_422,
    v_413_423 = v_413_422,
    neg_g_413_low60_0_low20_10 * 2 = neg_g_413_low60_0_low20_9,
    r_413_423 * 2 = r_413_422,
    s_413_423 * 2 = s_413_422
&&
    true
;

{
    u_413_423 * neg_f_413_low60_0_low20_0 + v_413_423 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_423 * neg_f_413_low60_0_low20_0 + s_413_423 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_10 + u_413_423 * (const 64 (2**21)) + v_413_423 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_10 + r_413_423 * (const 64 (2**21)) + s_413_423 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_10,
    neg_f_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_10,
    neg_g_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 423)) <=s delta, delta <=s (const 64 (1 + 2*423)),
    (const 64 (-(2**20))) <=s u_413_423, u_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_423, v_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_423, r_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_423, s_413_423 <=s (const 64 ((2**20))),
    u_413_423 + v_413_423 <=s (const 64 (2**20)),
    u_413_423 - v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 + v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 - v_413_423 <=s (const 64 (2**20)),
    r_413_423 + s_413_423 <=s (const 64 (2**20)),
    r_413_423 - s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 + s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 - s_413_423 <=s (const 64 (2**20)),
    u_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_413_423 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_422_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_9,
sint64 neg_g_413_low60_0_low20_9,
sint64 neg_f_413_low60_0_low20_10,
sint64 neg_g_413_low60_0_low20_10,
sint64 u_413_422,
sint64 v_413_422,
sint64 r_413_422,
sint64 s_413_422,
sint64 u_413_423,
sint64 v_413_423,
sint64 r_413_423,
sint64 s_413_423,
bit ne
)={
    u_413_422 * neg_f_413_low60_0_low20_0 + v_413_422 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_9 * (-(2**20)),
    r_413_422 * neg_f_413_low60_0_low20_0 + s_413_422 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_9 * (-(2**20))
&&
    u_413_422 * neg_f_413_low60_0_low20_0 + v_413_422 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_9 * (const 64 (-(2**20))),
    r_413_422 * neg_f_413_low60_0_low20_0 + s_413_422 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_9 + u_413_422 * (const 64 (2**21)) + v_413_422 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_9 + r_413_422 * (const 64 (2**21)) + s_413_422 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_9,
    neg_f_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_9,
    neg_g_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 422)) <=s delta, delta <=s (const 64 (1 + 2*422)),
    (const 64 (-(2**20))) <=s u_413_422, u_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_422, v_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_422, r_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_422, s_413_422 <=s (const 64 ((2**20))),
    u_413_422 + v_413_422 <=s (const 64 (2**20)),
    u_413_422 - v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 + v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 - v_413_422 <=s (const 64 (2**20)),
    r_413_422 + s_413_422 <=s (const 64 (2**20)),
    r_413_422 - s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 + s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 - s_413_422 <=s (const 64 (2**20)),
    u_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_413_422 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step422

// premise b
assume
neg_g_413_low60_0_low20_9 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_10 neg_f_413_low60_0_low20_9;
mov u_413_423 u_413_422;
mov v_413_423 v_413_422;

add neg_g_413_low60_0_low20_10 neg_g_413_low60_0_low20_9 neg_f_413_low60_0_low20_9;
asr neg_g_413_low60_0_low20_10 neg_g_413_low60_0_low20_10 1;
add r_413_423 r_413_422 u_413_422;
asr r_413_423 r_413_423 1;
add s_413_423 s_413_422 v_413_422;
asr s_413_423 s_413_423 1;
assert
    true
&&
    neg_f_413_low60_0_low20_10 = neg_f_413_low60_0_low20_9,
    u_413_423 = u_413_422,
    v_413_423 = v_413_422,
    neg_g_413_low60_0_low20_10 * (const 64 2) = neg_g_413_low60_0_low20_9 + neg_f_413_low60_0_low20_9,
    r_413_423 * (const 64 2) = r_413_422 + u_413_422,
    s_413_423 * (const 64 2) = s_413_422 + v_413_422
;

assume
    neg_f_413_low60_0_low20_10 = neg_f_413_low60_0_low20_9,
    u_413_423 = u_413_422,
    v_413_423 = v_413_422,
    neg_g_413_low60_0_low20_10 * 2 = neg_g_413_low60_0_low20_9 + neg_f_413_low60_0_low20_9,
    r_413_423 * 2 = r_413_422 + u_413_422,
    s_413_423 * 2 = s_413_422 + v_413_422
&&
    true
;

{
    u_413_423 * neg_f_413_low60_0_low20_0 + v_413_423 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_423 * neg_f_413_low60_0_low20_0 + s_413_423 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_10 + u_413_423 * (const 64 (2**21)) + v_413_423 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_10 + r_413_423 * (const 64 (2**21)) + s_413_423 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_10,
    neg_f_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_10,
    neg_g_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 423)) <=s delta, delta <=s (const 64 (1 + 2*423)),
    (const 64 (-(2**20))) <=s u_413_423, u_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_423, v_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_423, r_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_423, s_413_423 <=s (const 64 ((2**20))),
    u_413_423 + v_413_423 <=s (const 64 (2**20)),
    u_413_423 - v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 + v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 - v_413_423 <=s (const 64 (2**20)),
    r_413_423 + s_413_423 <=s (const 64 (2**20)),
    r_413_423 - s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 + s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 - s_413_423 <=s (const 64 (2**20)),
    u_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_413_423 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_422_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_9,
sint64 neg_g_413_low60_0_low20_9,
sint64 neg_f_413_low60_0_low20_10,
sint64 neg_g_413_low60_0_low20_10,
sint64 u_413_422,
sint64 v_413_422,
sint64 r_413_422,
sint64 s_413_422,
sint64 u_413_423,
sint64 v_413_423,
sint64 r_413_423,
sint64 s_413_423,
bit ne
)={
    u_413_422 * neg_f_413_low60_0_low20_0 + v_413_422 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_9 * (-(2**20)),
    r_413_422 * neg_f_413_low60_0_low20_0 + s_413_422 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_9 * (-(2**20))
&&
    u_413_422 * neg_f_413_low60_0_low20_0 + v_413_422 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_9 * (const 64 (-(2**20))),
    r_413_422 * neg_f_413_low60_0_low20_0 + s_413_422 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_9 + u_413_422 * (const 64 (2**21)) + v_413_422 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_9 + r_413_422 * (const 64 (2**21)) + s_413_422 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_9,
    neg_f_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_9,
    neg_g_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 422)) <=s delta, delta <=s (const 64 (1 + 2*422)),
    (const 64 (-(2**20))) <=s u_413_422, u_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_422, v_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_422, r_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_422, s_413_422 <=s (const 64 ((2**20))),
    u_413_422 + v_413_422 <=s (const 64 (2**20)),
    u_413_422 - v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 + v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 - v_413_422 <=s (const 64 (2**20)),
    r_413_422 + s_413_422 <=s (const 64 (2**20)),
    r_413_422 - s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 + s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 - s_413_422 <=s (const 64 (2**20)),
    u_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_413_422 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step422

// premise c
assume
neg_g_413_low60_0_low20_9 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_10 neg_g_413_low60_0_low20_9;
mov u_413_423 r_413_422;
mov v_413_423 s_413_422;

subs dc neg_g_413_low60_0_low20_10 neg_g_413_low60_0_low20_9 neg_f_413_low60_0_low20_9;
asr neg_g_413_low60_0_low20_10 neg_g_413_low60_0_low20_10 1;
subs dc r_413_423 r_413_422 u_413_422;
asr r_413_423 r_413_423 1;
subs dc s_413_423 s_413_422 v_413_422;
asr s_413_423 s_413_423 1;
assert
    true
&&
    neg_f_413_low60_0_low20_10 = neg_g_413_low60_0_low20_9,
    u_413_423 = r_413_422,
    v_413_423 = s_413_422,
    neg_g_413_low60_0_low20_10 * (const 64 2) = neg_g_413_low60_0_low20_9 - neg_f_413_low60_0_low20_9,
    r_413_423 * (const 64 2) = r_413_422 - u_413_422,
    s_413_423 * (const 64 2) = s_413_422 - v_413_422
;

assume
    neg_f_413_low60_0_low20_10 = neg_g_413_low60_0_low20_9,
    u_413_423 = r_413_422,
    v_413_423 = s_413_422,
    neg_g_413_low60_0_low20_10 * 2 = neg_g_413_low60_0_low20_9 - neg_f_413_low60_0_low20_9,
    r_413_423 * 2 = r_413_422 - u_413_422,
    s_413_423 * 2 = s_413_422 - v_413_422
&&
    true
;

{
    u_413_423 * neg_f_413_low60_0_low20_0 + v_413_423 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_423 * neg_f_413_low60_0_low20_0 + s_413_423 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_10 + u_413_423 * (const 64 (2**21)) + v_413_423 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_10 + r_413_423 * (const 64 (2**21)) + s_413_423 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_10,
    neg_f_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_10,
    neg_g_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 423)) <=s delta, delta <=s (const 64 (1 + 2*423)),
    (const 64 (-(2**20))) <=s u_413_423, u_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_423, v_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_423, r_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_423, s_413_423 <=s (const 64 ((2**20))),
    u_413_423 + v_413_423 <=s (const 64 (2**20)),
    u_413_423 - v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 + v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 - v_413_423 <=s (const 64 (2**20)),
    r_413_423 + s_413_423 <=s (const 64 (2**20)),
    r_413_423 - s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 + s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 - s_413_423 <=s (const 64 (2**20)),
    u_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_413_423 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_423_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_10,
sint64 neg_g_413_low60_0_low20_10,
sint64 neg_f_413_low60_0_low20_11,
sint64 neg_g_413_low60_0_low20_11,
sint64 u_413_423,
sint64 v_413_423,
sint64 r_413_423,
sint64 s_413_423,
sint64 u_413_424,
sint64 v_413_424,
sint64 r_413_424,
sint64 s_413_424,
bit ne
)={
    u_413_423 * neg_f_413_low60_0_low20_0 + v_413_423 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_10 * (-(2**20)),
    r_413_423 * neg_f_413_low60_0_low20_0 + s_413_423 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_10 * (-(2**20))
&&
    u_413_423 * neg_f_413_low60_0_low20_0 + v_413_423 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_10 * (const 64 (-(2**20))),
    r_413_423 * neg_f_413_low60_0_low20_0 + s_413_423 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_10 + u_413_423 * (const 64 (2**21)) + v_413_423 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_10 + r_413_423 * (const 64 (2**21)) + s_413_423 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_10,
    neg_f_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_10,
    neg_g_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 423)) <=s delta, delta <=s (const 64 (1 + 2*423)),
    (const 64 (-(2**20))) <=s u_413_423, u_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_423, v_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_423, r_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_423, s_413_423 <=s (const 64 ((2**20))),
    u_413_423 + v_413_423 <=s (const 64 (2**20)),
    u_413_423 - v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 + v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 - v_413_423 <=s (const 64 (2**20)),
    r_413_423 + s_413_423 <=s (const 64 (2**20)),
    r_413_423 - s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 + s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 - s_413_423 <=s (const 64 (2**20)),
    u_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_413_423 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step423

// premise a
assume
neg_g_413_low60_0_low20_10 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_10 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_11 neg_f_413_low60_0_low20_10;
mov u_413_424 u_413_423;
mov v_413_424 v_413_423;

asr neg_g_413_low60_0_low20_11 neg_g_413_low60_0_low20_10 1;
asr r_413_424 r_413_423 1;
asr s_413_424 s_413_423 1;
assert
    true
&&
    neg_f_413_low60_0_low20_11 = neg_f_413_low60_0_low20_10,
    u_413_424 = u_413_423,
    v_413_424 = v_413_423,
    neg_g_413_low60_0_low20_11 * (const 64 2) = neg_g_413_low60_0_low20_10,
    r_413_424 * (const 64 2) = r_413_423,
    s_413_424 * (const 64 2) = s_413_423
;

assume
    neg_f_413_low60_0_low20_11 = neg_f_413_low60_0_low20_10,
    u_413_424 = u_413_423,
    v_413_424 = v_413_423,
    neg_g_413_low60_0_low20_11 * 2 = neg_g_413_low60_0_low20_10,
    r_413_424 * 2 = r_413_423,
    s_413_424 * 2 = s_413_423
&&
    true
;

{
    u_413_424 * neg_f_413_low60_0_low20_0 + v_413_424 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_424 * neg_f_413_low60_0_low20_0 + s_413_424 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_11 + u_413_424 * (const 64 (2**21)) + v_413_424 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_11 + r_413_424 * (const 64 (2**21)) + s_413_424 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_11,
    neg_f_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_11,
    neg_g_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 424)) <=s delta, delta <=s (const 64 (1 + 2*424)),
    (const 64 (-(2**20))) <=s u_413_424, u_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_424, v_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_424, r_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_424, s_413_424 <=s (const 64 ((2**20))),
    u_413_424 + v_413_424 <=s (const 64 (2**20)),
    u_413_424 - v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 + v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 - v_413_424 <=s (const 64 (2**20)),
    r_413_424 + s_413_424 <=s (const 64 (2**20)),
    r_413_424 - s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 + s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 - s_413_424 <=s (const 64 (2**20)),
    u_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_413_424 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_423_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_10,
sint64 neg_g_413_low60_0_low20_10,
sint64 neg_f_413_low60_0_low20_11,
sint64 neg_g_413_low60_0_low20_11,
sint64 u_413_423,
sint64 v_413_423,
sint64 r_413_423,
sint64 s_413_423,
sint64 u_413_424,
sint64 v_413_424,
sint64 r_413_424,
sint64 s_413_424,
bit ne
)={
    u_413_423 * neg_f_413_low60_0_low20_0 + v_413_423 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_10 * (-(2**20)),
    r_413_423 * neg_f_413_low60_0_low20_0 + s_413_423 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_10 * (-(2**20))
&&
    u_413_423 * neg_f_413_low60_0_low20_0 + v_413_423 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_10 * (const 64 (-(2**20))),
    r_413_423 * neg_f_413_low60_0_low20_0 + s_413_423 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_10 + u_413_423 * (const 64 (2**21)) + v_413_423 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_10 + r_413_423 * (const 64 (2**21)) + s_413_423 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_10,
    neg_f_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_10,
    neg_g_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 423)) <=s delta, delta <=s (const 64 (1 + 2*423)),
    (const 64 (-(2**20))) <=s u_413_423, u_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_423, v_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_423, r_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_423, s_413_423 <=s (const 64 ((2**20))),
    u_413_423 + v_413_423 <=s (const 64 (2**20)),
    u_413_423 - v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 + v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 - v_413_423 <=s (const 64 (2**20)),
    r_413_423 + s_413_423 <=s (const 64 (2**20)),
    r_413_423 - s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 + s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 - s_413_423 <=s (const 64 (2**20)),
    u_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_413_423 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step423

// premise b
assume
neg_g_413_low60_0_low20_10 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_11 neg_f_413_low60_0_low20_10;
mov u_413_424 u_413_423;
mov v_413_424 v_413_423;

add neg_g_413_low60_0_low20_11 neg_g_413_low60_0_low20_10 neg_f_413_low60_0_low20_10;
asr neg_g_413_low60_0_low20_11 neg_g_413_low60_0_low20_11 1;
add r_413_424 r_413_423 u_413_423;
asr r_413_424 r_413_424 1;
add s_413_424 s_413_423 v_413_423;
asr s_413_424 s_413_424 1;
assert
    true
&&
    neg_f_413_low60_0_low20_11 = neg_f_413_low60_0_low20_10,
    u_413_424 = u_413_423,
    v_413_424 = v_413_423,
    neg_g_413_low60_0_low20_11 * (const 64 2) = neg_g_413_low60_0_low20_10 + neg_f_413_low60_0_low20_10,
    r_413_424 * (const 64 2) = r_413_423 + u_413_423,
    s_413_424 * (const 64 2) = s_413_423 + v_413_423
;

assume
    neg_f_413_low60_0_low20_11 = neg_f_413_low60_0_low20_10,
    u_413_424 = u_413_423,
    v_413_424 = v_413_423,
    neg_g_413_low60_0_low20_11 * 2 = neg_g_413_low60_0_low20_10 + neg_f_413_low60_0_low20_10,
    r_413_424 * 2 = r_413_423 + u_413_423,
    s_413_424 * 2 = s_413_423 + v_413_423
&&
    true
;

{
    u_413_424 * neg_f_413_low60_0_low20_0 + v_413_424 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_424 * neg_f_413_low60_0_low20_0 + s_413_424 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_11 + u_413_424 * (const 64 (2**21)) + v_413_424 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_11 + r_413_424 * (const 64 (2**21)) + s_413_424 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_11,
    neg_f_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_11,
    neg_g_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 424)) <=s delta, delta <=s (const 64 (1 + 2*424)),
    (const 64 (-(2**20))) <=s u_413_424, u_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_424, v_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_424, r_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_424, s_413_424 <=s (const 64 ((2**20))),
    u_413_424 + v_413_424 <=s (const 64 (2**20)),
    u_413_424 - v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 + v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 - v_413_424 <=s (const 64 (2**20)),
    r_413_424 + s_413_424 <=s (const 64 (2**20)),
    r_413_424 - s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 + s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 - s_413_424 <=s (const 64 (2**20)),
    u_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_413_424 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_423_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_10,
sint64 neg_g_413_low60_0_low20_10,
sint64 neg_f_413_low60_0_low20_11,
sint64 neg_g_413_low60_0_low20_11,
sint64 u_413_423,
sint64 v_413_423,
sint64 r_413_423,
sint64 s_413_423,
sint64 u_413_424,
sint64 v_413_424,
sint64 r_413_424,
sint64 s_413_424,
bit ne
)={
    u_413_423 * neg_f_413_low60_0_low20_0 + v_413_423 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_10 * (-(2**20)),
    r_413_423 * neg_f_413_low60_0_low20_0 + s_413_423 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_10 * (-(2**20))
&&
    u_413_423 * neg_f_413_low60_0_low20_0 + v_413_423 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_10 * (const 64 (-(2**20))),
    r_413_423 * neg_f_413_low60_0_low20_0 + s_413_423 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_10 + u_413_423 * (const 64 (2**21)) + v_413_423 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_10 + r_413_423 * (const 64 (2**21)) + s_413_423 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_10,
    neg_f_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_10,
    neg_g_413_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 423)) <=s delta, delta <=s (const 64 (1 + 2*423)),
    (const 64 (-(2**20))) <=s u_413_423, u_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_423, v_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_423, r_413_423 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_423, s_413_423 <=s (const 64 ((2**20))),
    u_413_423 + v_413_423 <=s (const 64 (2**20)),
    u_413_423 - v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 + v_413_423 <=s (const 64 (2**20)),
    (const 64 0) - u_413_423 - v_413_423 <=s (const 64 (2**20)),
    r_413_423 + s_413_423 <=s (const 64 (2**20)),
    r_413_423 - s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 + s_413_423 <=s (const 64 (2**20)),
    (const 64 0) - r_413_423 - s_413_423 <=s (const 64 (2**20)),
    u_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_413_423 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_413_423 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step423

// premise c
assume
neg_g_413_low60_0_low20_10 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_11 neg_g_413_low60_0_low20_10;
mov u_413_424 r_413_423;
mov v_413_424 s_413_423;

subs dc neg_g_413_low60_0_low20_11 neg_g_413_low60_0_low20_10 neg_f_413_low60_0_low20_10;
asr neg_g_413_low60_0_low20_11 neg_g_413_low60_0_low20_11 1;
subs dc r_413_424 r_413_423 u_413_423;
asr r_413_424 r_413_424 1;
subs dc s_413_424 s_413_423 v_413_423;
asr s_413_424 s_413_424 1;
assert
    true
&&
    neg_f_413_low60_0_low20_11 = neg_g_413_low60_0_low20_10,
    u_413_424 = r_413_423,
    v_413_424 = s_413_423,
    neg_g_413_low60_0_low20_11 * (const 64 2) = neg_g_413_low60_0_low20_10 - neg_f_413_low60_0_low20_10,
    r_413_424 * (const 64 2) = r_413_423 - u_413_423,
    s_413_424 * (const 64 2) = s_413_423 - v_413_423
;

assume
    neg_f_413_low60_0_low20_11 = neg_g_413_low60_0_low20_10,
    u_413_424 = r_413_423,
    v_413_424 = s_413_423,
    neg_g_413_low60_0_low20_11 * 2 = neg_g_413_low60_0_low20_10 - neg_f_413_low60_0_low20_10,
    r_413_424 * 2 = r_413_423 - u_413_423,
    s_413_424 * 2 = s_413_423 - v_413_423
&&
    true
;

{
    u_413_424 * neg_f_413_low60_0_low20_0 + v_413_424 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_424 * neg_f_413_low60_0_low20_0 + s_413_424 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_11 + u_413_424 * (const 64 (2**21)) + v_413_424 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_11 + r_413_424 * (const 64 (2**21)) + s_413_424 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_11,
    neg_f_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_11,
    neg_g_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 424)) <=s delta, delta <=s (const 64 (1 + 2*424)),
    (const 64 (-(2**20))) <=s u_413_424, u_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_424, v_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_424, r_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_424, s_413_424 <=s (const 64 ((2**20))),
    u_413_424 + v_413_424 <=s (const 64 (2**20)),
    u_413_424 - v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 + v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 - v_413_424 <=s (const 64 (2**20)),
    r_413_424 + s_413_424 <=s (const 64 (2**20)),
    r_413_424 - s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 + s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 - s_413_424 <=s (const 64 (2**20)),
    u_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_413_424 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_424_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_11,
sint64 neg_g_413_low60_0_low20_11,
sint64 neg_f_413_low60_0_low20_12,
sint64 neg_g_413_low60_0_low20_12,
sint64 u_413_424,
sint64 v_413_424,
sint64 r_413_424,
sint64 s_413_424,
sint64 u_413_425,
sint64 v_413_425,
sint64 r_413_425,
sint64 s_413_425,
bit ne
)={
    u_413_424 * neg_f_413_low60_0_low20_0 + v_413_424 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_11 * (-(2**20)),
    r_413_424 * neg_f_413_low60_0_low20_0 + s_413_424 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_11 * (-(2**20))
&&
    u_413_424 * neg_f_413_low60_0_low20_0 + v_413_424 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_11 * (const 64 (-(2**20))),
    r_413_424 * neg_f_413_low60_0_low20_0 + s_413_424 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_11 + u_413_424 * (const 64 (2**21)) + v_413_424 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_11 + r_413_424 * (const 64 (2**21)) + s_413_424 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_11,
    neg_f_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_11,
    neg_g_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 424)) <=s delta, delta <=s (const 64 (1 + 2*424)),
    (const 64 (-(2**20))) <=s u_413_424, u_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_424, v_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_424, r_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_424, s_413_424 <=s (const 64 ((2**20))),
    u_413_424 + v_413_424 <=s (const 64 (2**20)),
    u_413_424 - v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 + v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 - v_413_424 <=s (const 64 (2**20)),
    r_413_424 + s_413_424 <=s (const 64 (2**20)),
    r_413_424 - s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 + s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 - s_413_424 <=s (const 64 (2**20)),
    u_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_413_424 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step424

// premise a
assume
neg_g_413_low60_0_low20_11 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_11 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_12 neg_f_413_low60_0_low20_11;
mov u_413_425 u_413_424;
mov v_413_425 v_413_424;

asr neg_g_413_low60_0_low20_12 neg_g_413_low60_0_low20_11 1;
asr r_413_425 r_413_424 1;
asr s_413_425 s_413_424 1;
assert
    true
&&
    neg_f_413_low60_0_low20_12 = neg_f_413_low60_0_low20_11,
    u_413_425 = u_413_424,
    v_413_425 = v_413_424,
    neg_g_413_low60_0_low20_12 * (const 64 2) = neg_g_413_low60_0_low20_11,
    r_413_425 * (const 64 2) = r_413_424,
    s_413_425 * (const 64 2) = s_413_424
;

assume
    neg_f_413_low60_0_low20_12 = neg_f_413_low60_0_low20_11,
    u_413_425 = u_413_424,
    v_413_425 = v_413_424,
    neg_g_413_low60_0_low20_12 * 2 = neg_g_413_low60_0_low20_11,
    r_413_425 * 2 = r_413_424,
    s_413_425 * 2 = s_413_424
&&
    true
;

{
    u_413_425 * neg_f_413_low60_0_low20_0 + v_413_425 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_425 * neg_f_413_low60_0_low20_0 + s_413_425 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_12 + u_413_425 * (const 64 (2**21)) + v_413_425 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_12 + r_413_425 * (const 64 (2**21)) + s_413_425 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_12,
    neg_f_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_12,
    neg_g_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 425)) <=s delta, delta <=s (const 64 (1 + 2*425)),
    (const 64 (-(2**20))) <=s u_413_425, u_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_425, v_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_425, r_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_425, s_413_425 <=s (const 64 ((2**20))),
    u_413_425 + v_413_425 <=s (const 64 (2**20)),
    u_413_425 - v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 + v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 - v_413_425 <=s (const 64 (2**20)),
    r_413_425 + s_413_425 <=s (const 64 (2**20)),
    r_413_425 - s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 + s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 - s_413_425 <=s (const 64 (2**20)),
    u_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_413_425 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_424_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_11,
sint64 neg_g_413_low60_0_low20_11,
sint64 neg_f_413_low60_0_low20_12,
sint64 neg_g_413_low60_0_low20_12,
sint64 u_413_424,
sint64 v_413_424,
sint64 r_413_424,
sint64 s_413_424,
sint64 u_413_425,
sint64 v_413_425,
sint64 r_413_425,
sint64 s_413_425,
bit ne
)={
    u_413_424 * neg_f_413_low60_0_low20_0 + v_413_424 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_11 * (-(2**20)),
    r_413_424 * neg_f_413_low60_0_low20_0 + s_413_424 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_11 * (-(2**20))
&&
    u_413_424 * neg_f_413_low60_0_low20_0 + v_413_424 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_11 * (const 64 (-(2**20))),
    r_413_424 * neg_f_413_low60_0_low20_0 + s_413_424 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_11 + u_413_424 * (const 64 (2**21)) + v_413_424 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_11 + r_413_424 * (const 64 (2**21)) + s_413_424 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_11,
    neg_f_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_11,
    neg_g_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 424)) <=s delta, delta <=s (const 64 (1 + 2*424)),
    (const 64 (-(2**20))) <=s u_413_424, u_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_424, v_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_424, r_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_424, s_413_424 <=s (const 64 ((2**20))),
    u_413_424 + v_413_424 <=s (const 64 (2**20)),
    u_413_424 - v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 + v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 - v_413_424 <=s (const 64 (2**20)),
    r_413_424 + s_413_424 <=s (const 64 (2**20)),
    r_413_424 - s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 + s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 - s_413_424 <=s (const 64 (2**20)),
    u_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_413_424 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step424

// premise b
assume
neg_g_413_low60_0_low20_11 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_12 neg_f_413_low60_0_low20_11;
mov u_413_425 u_413_424;
mov v_413_425 v_413_424;

add neg_g_413_low60_0_low20_12 neg_g_413_low60_0_low20_11 neg_f_413_low60_0_low20_11;
asr neg_g_413_low60_0_low20_12 neg_g_413_low60_0_low20_12 1;
add r_413_425 r_413_424 u_413_424;
asr r_413_425 r_413_425 1;
add s_413_425 s_413_424 v_413_424;
asr s_413_425 s_413_425 1;
assert
    true
&&
    neg_f_413_low60_0_low20_12 = neg_f_413_low60_0_low20_11,
    u_413_425 = u_413_424,
    v_413_425 = v_413_424,
    neg_g_413_low60_0_low20_12 * (const 64 2) = neg_g_413_low60_0_low20_11 + neg_f_413_low60_0_low20_11,
    r_413_425 * (const 64 2) = r_413_424 + u_413_424,
    s_413_425 * (const 64 2) = s_413_424 + v_413_424
;

assume
    neg_f_413_low60_0_low20_12 = neg_f_413_low60_0_low20_11,
    u_413_425 = u_413_424,
    v_413_425 = v_413_424,
    neg_g_413_low60_0_low20_12 * 2 = neg_g_413_low60_0_low20_11 + neg_f_413_low60_0_low20_11,
    r_413_425 * 2 = r_413_424 + u_413_424,
    s_413_425 * 2 = s_413_424 + v_413_424
&&
    true
;

{
    u_413_425 * neg_f_413_low60_0_low20_0 + v_413_425 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_425 * neg_f_413_low60_0_low20_0 + s_413_425 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_12 + u_413_425 * (const 64 (2**21)) + v_413_425 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_12 + r_413_425 * (const 64 (2**21)) + s_413_425 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_12,
    neg_f_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_12,
    neg_g_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 425)) <=s delta, delta <=s (const 64 (1 + 2*425)),
    (const 64 (-(2**20))) <=s u_413_425, u_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_425, v_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_425, r_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_425, s_413_425 <=s (const 64 ((2**20))),
    u_413_425 + v_413_425 <=s (const 64 (2**20)),
    u_413_425 - v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 + v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 - v_413_425 <=s (const 64 (2**20)),
    r_413_425 + s_413_425 <=s (const 64 (2**20)),
    r_413_425 - s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 + s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 - s_413_425 <=s (const 64 (2**20)),
    u_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_413_425 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_424_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_11,
sint64 neg_g_413_low60_0_low20_11,
sint64 neg_f_413_low60_0_low20_12,
sint64 neg_g_413_low60_0_low20_12,
sint64 u_413_424,
sint64 v_413_424,
sint64 r_413_424,
sint64 s_413_424,
sint64 u_413_425,
sint64 v_413_425,
sint64 r_413_425,
sint64 s_413_425,
bit ne
)={
    u_413_424 * neg_f_413_low60_0_low20_0 + v_413_424 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_11 * (-(2**20)),
    r_413_424 * neg_f_413_low60_0_low20_0 + s_413_424 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_11 * (-(2**20))
&&
    u_413_424 * neg_f_413_low60_0_low20_0 + v_413_424 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_11 * (const 64 (-(2**20))),
    r_413_424 * neg_f_413_low60_0_low20_0 + s_413_424 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_11 + u_413_424 * (const 64 (2**21)) + v_413_424 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_11 + r_413_424 * (const 64 (2**21)) + s_413_424 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_11,
    neg_f_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_11,
    neg_g_413_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 424)) <=s delta, delta <=s (const 64 (1 + 2*424)),
    (const 64 (-(2**20))) <=s u_413_424, u_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_424, v_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_424, r_413_424 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_424, s_413_424 <=s (const 64 ((2**20))),
    u_413_424 + v_413_424 <=s (const 64 (2**20)),
    u_413_424 - v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 + v_413_424 <=s (const 64 (2**20)),
    (const 64 0) - u_413_424 - v_413_424 <=s (const 64 (2**20)),
    r_413_424 + s_413_424 <=s (const 64 (2**20)),
    r_413_424 - s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 + s_413_424 <=s (const 64 (2**20)),
    (const 64 0) - r_413_424 - s_413_424 <=s (const 64 (2**20)),
    u_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_413_424 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_413_424 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step424

// premise c
assume
neg_g_413_low60_0_low20_11 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_12 neg_g_413_low60_0_low20_11;
mov u_413_425 r_413_424;
mov v_413_425 s_413_424;

subs dc neg_g_413_low60_0_low20_12 neg_g_413_low60_0_low20_11 neg_f_413_low60_0_low20_11;
asr neg_g_413_low60_0_low20_12 neg_g_413_low60_0_low20_12 1;
subs dc r_413_425 r_413_424 u_413_424;
asr r_413_425 r_413_425 1;
subs dc s_413_425 s_413_424 v_413_424;
asr s_413_425 s_413_425 1;
assert
    true
&&
    neg_f_413_low60_0_low20_12 = neg_g_413_low60_0_low20_11,
    u_413_425 = r_413_424,
    v_413_425 = s_413_424,
    neg_g_413_low60_0_low20_12 * (const 64 2) = neg_g_413_low60_0_low20_11 - neg_f_413_low60_0_low20_11,
    r_413_425 * (const 64 2) = r_413_424 - u_413_424,
    s_413_425 * (const 64 2) = s_413_424 - v_413_424
;

assume
    neg_f_413_low60_0_low20_12 = neg_g_413_low60_0_low20_11,
    u_413_425 = r_413_424,
    v_413_425 = s_413_424,
    neg_g_413_low60_0_low20_12 * 2 = neg_g_413_low60_0_low20_11 - neg_f_413_low60_0_low20_11,
    r_413_425 * 2 = r_413_424 - u_413_424,
    s_413_425 * 2 = s_413_424 - v_413_424
&&
    true
;

{
    u_413_425 * neg_f_413_low60_0_low20_0 + v_413_425 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_425 * neg_f_413_low60_0_low20_0 + s_413_425 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_12 + u_413_425 * (const 64 (2**21)) + v_413_425 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_12 + r_413_425 * (const 64 (2**21)) + s_413_425 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_12,
    neg_f_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_12,
    neg_g_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 425)) <=s delta, delta <=s (const 64 (1 + 2*425)),
    (const 64 (-(2**20))) <=s u_413_425, u_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_425, v_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_425, r_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_425, s_413_425 <=s (const 64 ((2**20))),
    u_413_425 + v_413_425 <=s (const 64 (2**20)),
    u_413_425 - v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 + v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 - v_413_425 <=s (const 64 (2**20)),
    r_413_425 + s_413_425 <=s (const 64 (2**20)),
    r_413_425 - s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 + s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 - s_413_425 <=s (const 64 (2**20)),
    u_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_413_425 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_425_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_12,
sint64 neg_g_413_low60_0_low20_12,
sint64 neg_f_413_low60_0_low20_13,
sint64 neg_g_413_low60_0_low20_13,
sint64 u_413_425,
sint64 v_413_425,
sint64 r_413_425,
sint64 s_413_425,
sint64 u_413_426,
sint64 v_413_426,
sint64 r_413_426,
sint64 s_413_426,
bit ne
)={
    u_413_425 * neg_f_413_low60_0_low20_0 + v_413_425 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_12 * (-(2**20)),
    r_413_425 * neg_f_413_low60_0_low20_0 + s_413_425 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_12 * (-(2**20))
&&
    u_413_425 * neg_f_413_low60_0_low20_0 + v_413_425 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_12 * (const 64 (-(2**20))),
    r_413_425 * neg_f_413_low60_0_low20_0 + s_413_425 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_12 + u_413_425 * (const 64 (2**21)) + v_413_425 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_12 + r_413_425 * (const 64 (2**21)) + s_413_425 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_12,
    neg_f_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_12,
    neg_g_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 425)) <=s delta, delta <=s (const 64 (1 + 2*425)),
    (const 64 (-(2**20))) <=s u_413_425, u_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_425, v_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_425, r_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_425, s_413_425 <=s (const 64 ((2**20))),
    u_413_425 + v_413_425 <=s (const 64 (2**20)),
    u_413_425 - v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 + v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 - v_413_425 <=s (const 64 (2**20)),
    r_413_425 + s_413_425 <=s (const 64 (2**20)),
    r_413_425 - s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 + s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 - s_413_425 <=s (const 64 (2**20)),
    u_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_413_425 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step425

// premise a
assume
neg_g_413_low60_0_low20_12 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_12 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_13 neg_f_413_low60_0_low20_12;
mov u_413_426 u_413_425;
mov v_413_426 v_413_425;

asr neg_g_413_low60_0_low20_13 neg_g_413_low60_0_low20_12 1;
asr r_413_426 r_413_425 1;
asr s_413_426 s_413_425 1;
assert
    true
&&
    neg_f_413_low60_0_low20_13 = neg_f_413_low60_0_low20_12,
    u_413_426 = u_413_425,
    v_413_426 = v_413_425,
    neg_g_413_low60_0_low20_13 * (const 64 2) = neg_g_413_low60_0_low20_12,
    r_413_426 * (const 64 2) = r_413_425,
    s_413_426 * (const 64 2) = s_413_425
;

assume
    neg_f_413_low60_0_low20_13 = neg_f_413_low60_0_low20_12,
    u_413_426 = u_413_425,
    v_413_426 = v_413_425,
    neg_g_413_low60_0_low20_13 * 2 = neg_g_413_low60_0_low20_12,
    r_413_426 * 2 = r_413_425,
    s_413_426 * 2 = s_413_425
&&
    true
;

{
    u_413_426 * neg_f_413_low60_0_low20_0 + v_413_426 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_426 * neg_f_413_low60_0_low20_0 + s_413_426 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_13 + u_413_426 * (const 64 (2**21)) + v_413_426 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_13 + r_413_426 * (const 64 (2**21)) + s_413_426 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_13,
    neg_f_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_13,
    neg_g_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 426)) <=s delta, delta <=s (const 64 (1 + 2*426)),
    (const 64 (-(2**20))) <=s u_413_426, u_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_426, v_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_426, r_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_426, s_413_426 <=s (const 64 ((2**20))),
    u_413_426 + v_413_426 <=s (const 64 (2**20)),
    u_413_426 - v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 + v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 - v_413_426 <=s (const 64 (2**20)),
    r_413_426 + s_413_426 <=s (const 64 (2**20)),
    r_413_426 - s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 + s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 - s_413_426 <=s (const 64 (2**20)),
    u_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_413_426 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_425_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_12,
sint64 neg_g_413_low60_0_low20_12,
sint64 neg_f_413_low60_0_low20_13,
sint64 neg_g_413_low60_0_low20_13,
sint64 u_413_425,
sint64 v_413_425,
sint64 r_413_425,
sint64 s_413_425,
sint64 u_413_426,
sint64 v_413_426,
sint64 r_413_426,
sint64 s_413_426,
bit ne
)={
    u_413_425 * neg_f_413_low60_0_low20_0 + v_413_425 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_12 * (-(2**20)),
    r_413_425 * neg_f_413_low60_0_low20_0 + s_413_425 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_12 * (-(2**20))
&&
    u_413_425 * neg_f_413_low60_0_low20_0 + v_413_425 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_12 * (const 64 (-(2**20))),
    r_413_425 * neg_f_413_low60_0_low20_0 + s_413_425 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_12 + u_413_425 * (const 64 (2**21)) + v_413_425 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_12 + r_413_425 * (const 64 (2**21)) + s_413_425 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_12,
    neg_f_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_12,
    neg_g_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 425)) <=s delta, delta <=s (const 64 (1 + 2*425)),
    (const 64 (-(2**20))) <=s u_413_425, u_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_425, v_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_425, r_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_425, s_413_425 <=s (const 64 ((2**20))),
    u_413_425 + v_413_425 <=s (const 64 (2**20)),
    u_413_425 - v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 + v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 - v_413_425 <=s (const 64 (2**20)),
    r_413_425 + s_413_425 <=s (const 64 (2**20)),
    r_413_425 - s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 + s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 - s_413_425 <=s (const 64 (2**20)),
    u_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_413_425 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step425

// premise b
assume
neg_g_413_low60_0_low20_12 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_13 neg_f_413_low60_0_low20_12;
mov u_413_426 u_413_425;
mov v_413_426 v_413_425;

add neg_g_413_low60_0_low20_13 neg_g_413_low60_0_low20_12 neg_f_413_low60_0_low20_12;
asr neg_g_413_low60_0_low20_13 neg_g_413_low60_0_low20_13 1;
add r_413_426 r_413_425 u_413_425;
asr r_413_426 r_413_426 1;
add s_413_426 s_413_425 v_413_425;
asr s_413_426 s_413_426 1;
assert
    true
&&
    neg_f_413_low60_0_low20_13 = neg_f_413_low60_0_low20_12,
    u_413_426 = u_413_425,
    v_413_426 = v_413_425,
    neg_g_413_low60_0_low20_13 * (const 64 2) = neg_g_413_low60_0_low20_12 + neg_f_413_low60_0_low20_12,
    r_413_426 * (const 64 2) = r_413_425 + u_413_425,
    s_413_426 * (const 64 2) = s_413_425 + v_413_425
;

assume
    neg_f_413_low60_0_low20_13 = neg_f_413_low60_0_low20_12,
    u_413_426 = u_413_425,
    v_413_426 = v_413_425,
    neg_g_413_low60_0_low20_13 * 2 = neg_g_413_low60_0_low20_12 + neg_f_413_low60_0_low20_12,
    r_413_426 * 2 = r_413_425 + u_413_425,
    s_413_426 * 2 = s_413_425 + v_413_425
&&
    true
;

{
    u_413_426 * neg_f_413_low60_0_low20_0 + v_413_426 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_426 * neg_f_413_low60_0_low20_0 + s_413_426 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_13 + u_413_426 * (const 64 (2**21)) + v_413_426 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_13 + r_413_426 * (const 64 (2**21)) + s_413_426 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_13,
    neg_f_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_13,
    neg_g_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 426)) <=s delta, delta <=s (const 64 (1 + 2*426)),
    (const 64 (-(2**20))) <=s u_413_426, u_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_426, v_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_426, r_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_426, s_413_426 <=s (const 64 ((2**20))),
    u_413_426 + v_413_426 <=s (const 64 (2**20)),
    u_413_426 - v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 + v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 - v_413_426 <=s (const 64 (2**20)),
    r_413_426 + s_413_426 <=s (const 64 (2**20)),
    r_413_426 - s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 + s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 - s_413_426 <=s (const 64 (2**20)),
    u_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_413_426 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_425_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_12,
sint64 neg_g_413_low60_0_low20_12,
sint64 neg_f_413_low60_0_low20_13,
sint64 neg_g_413_low60_0_low20_13,
sint64 u_413_425,
sint64 v_413_425,
sint64 r_413_425,
sint64 s_413_425,
sint64 u_413_426,
sint64 v_413_426,
sint64 r_413_426,
sint64 s_413_426,
bit ne
)={
    u_413_425 * neg_f_413_low60_0_low20_0 + v_413_425 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_12 * (-(2**20)),
    r_413_425 * neg_f_413_low60_0_low20_0 + s_413_425 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_12 * (-(2**20))
&&
    u_413_425 * neg_f_413_low60_0_low20_0 + v_413_425 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_12 * (const 64 (-(2**20))),
    r_413_425 * neg_f_413_low60_0_low20_0 + s_413_425 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_12 + u_413_425 * (const 64 (2**21)) + v_413_425 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_12 + r_413_425 * (const 64 (2**21)) + s_413_425 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_12,
    neg_f_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_12,
    neg_g_413_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 425)) <=s delta, delta <=s (const 64 (1 + 2*425)),
    (const 64 (-(2**20))) <=s u_413_425, u_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_425, v_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_425, r_413_425 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_425, s_413_425 <=s (const 64 ((2**20))),
    u_413_425 + v_413_425 <=s (const 64 (2**20)),
    u_413_425 - v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 + v_413_425 <=s (const 64 (2**20)),
    (const 64 0) - u_413_425 - v_413_425 <=s (const 64 (2**20)),
    r_413_425 + s_413_425 <=s (const 64 (2**20)),
    r_413_425 - s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 + s_413_425 <=s (const 64 (2**20)),
    (const 64 0) - r_413_425 - s_413_425 <=s (const 64 (2**20)),
    u_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_413_425 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_413_425 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step425

// premise c
assume
neg_g_413_low60_0_low20_12 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_13 neg_g_413_low60_0_low20_12;
mov u_413_426 r_413_425;
mov v_413_426 s_413_425;

subs dc neg_g_413_low60_0_low20_13 neg_g_413_low60_0_low20_12 neg_f_413_low60_0_low20_12;
asr neg_g_413_low60_0_low20_13 neg_g_413_low60_0_low20_13 1;
subs dc r_413_426 r_413_425 u_413_425;
asr r_413_426 r_413_426 1;
subs dc s_413_426 s_413_425 v_413_425;
asr s_413_426 s_413_426 1;
assert
    true
&&
    neg_f_413_low60_0_low20_13 = neg_g_413_low60_0_low20_12,
    u_413_426 = r_413_425,
    v_413_426 = s_413_425,
    neg_g_413_low60_0_low20_13 * (const 64 2) = neg_g_413_low60_0_low20_12 - neg_f_413_low60_0_low20_12,
    r_413_426 * (const 64 2) = r_413_425 - u_413_425,
    s_413_426 * (const 64 2) = s_413_425 - v_413_425
;

assume
    neg_f_413_low60_0_low20_13 = neg_g_413_low60_0_low20_12,
    u_413_426 = r_413_425,
    v_413_426 = s_413_425,
    neg_g_413_low60_0_low20_13 * 2 = neg_g_413_low60_0_low20_12 - neg_f_413_low60_0_low20_12,
    r_413_426 * 2 = r_413_425 - u_413_425,
    s_413_426 * 2 = s_413_425 - v_413_425
&&
    true
;

{
    u_413_426 * neg_f_413_low60_0_low20_0 + v_413_426 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_426 * neg_f_413_low60_0_low20_0 + s_413_426 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_13 + u_413_426 * (const 64 (2**21)) + v_413_426 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_13 + r_413_426 * (const 64 (2**21)) + s_413_426 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_13,
    neg_f_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_13,
    neg_g_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 426)) <=s delta, delta <=s (const 64 (1 + 2*426)),
    (const 64 (-(2**20))) <=s u_413_426, u_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_426, v_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_426, r_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_426, s_413_426 <=s (const 64 ((2**20))),
    u_413_426 + v_413_426 <=s (const 64 (2**20)),
    u_413_426 - v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 + v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 - v_413_426 <=s (const 64 (2**20)),
    r_413_426 + s_413_426 <=s (const 64 (2**20)),
    r_413_426 - s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 + s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 - s_413_426 <=s (const 64 (2**20)),
    u_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_413_426 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_426_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_13,
sint64 neg_g_413_low60_0_low20_13,
sint64 neg_f_413_low60_0_low20_14,
sint64 neg_g_413_low60_0_low20_14,
sint64 u_413_426,
sint64 v_413_426,
sint64 r_413_426,
sint64 s_413_426,
sint64 u_413_427,
sint64 v_413_427,
sint64 r_413_427,
sint64 s_413_427,
bit ne
)={
    u_413_426 * neg_f_413_low60_0_low20_0 + v_413_426 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_13 * (-(2**20)),
    r_413_426 * neg_f_413_low60_0_low20_0 + s_413_426 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_13 * (-(2**20))
&&
    u_413_426 * neg_f_413_low60_0_low20_0 + v_413_426 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_13 * (const 64 (-(2**20))),
    r_413_426 * neg_f_413_low60_0_low20_0 + s_413_426 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_13 + u_413_426 * (const 64 (2**21)) + v_413_426 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_13 + r_413_426 * (const 64 (2**21)) + s_413_426 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_13,
    neg_f_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_13,
    neg_g_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 426)) <=s delta, delta <=s (const 64 (1 + 2*426)),
    (const 64 (-(2**20))) <=s u_413_426, u_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_426, v_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_426, r_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_426, s_413_426 <=s (const 64 ((2**20))),
    u_413_426 + v_413_426 <=s (const 64 (2**20)),
    u_413_426 - v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 + v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 - v_413_426 <=s (const 64 (2**20)),
    r_413_426 + s_413_426 <=s (const 64 (2**20)),
    r_413_426 - s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 + s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 - s_413_426 <=s (const 64 (2**20)),
    u_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_413_426 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step426

// premise a
assume
neg_g_413_low60_0_low20_13 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_13 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_14 neg_f_413_low60_0_low20_13;
mov u_413_427 u_413_426;
mov v_413_427 v_413_426;

asr neg_g_413_low60_0_low20_14 neg_g_413_low60_0_low20_13 1;
asr r_413_427 r_413_426 1;
asr s_413_427 s_413_426 1;
assert
    true
&&
    neg_f_413_low60_0_low20_14 = neg_f_413_low60_0_low20_13,
    u_413_427 = u_413_426,
    v_413_427 = v_413_426,
    neg_g_413_low60_0_low20_14 * (const 64 2) = neg_g_413_low60_0_low20_13,
    r_413_427 * (const 64 2) = r_413_426,
    s_413_427 * (const 64 2) = s_413_426
;

assume
    neg_f_413_low60_0_low20_14 = neg_f_413_low60_0_low20_13,
    u_413_427 = u_413_426,
    v_413_427 = v_413_426,
    neg_g_413_low60_0_low20_14 * 2 = neg_g_413_low60_0_low20_13,
    r_413_427 * 2 = r_413_426,
    s_413_427 * 2 = s_413_426
&&
    true
;

{
    u_413_427 * neg_f_413_low60_0_low20_0 + v_413_427 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_427 * neg_f_413_low60_0_low20_0 + s_413_427 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_14 + u_413_427 * (const 64 (2**21)) + v_413_427 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_14 + r_413_427 * (const 64 (2**21)) + s_413_427 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_14,
    neg_f_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_14,
    neg_g_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 427)) <=s delta, delta <=s (const 64 (1 + 2*427)),
    (const 64 (-(2**20))) <=s u_413_427, u_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_427, v_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_427, r_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_427, s_413_427 <=s (const 64 ((2**20))),
    u_413_427 + v_413_427 <=s (const 64 (2**20)),
    u_413_427 - v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 + v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 - v_413_427 <=s (const 64 (2**20)),
    r_413_427 + s_413_427 <=s (const 64 (2**20)),
    r_413_427 - s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 + s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 - s_413_427 <=s (const 64 (2**20)),
    u_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_413_427 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_426_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_13,
sint64 neg_g_413_low60_0_low20_13,
sint64 neg_f_413_low60_0_low20_14,
sint64 neg_g_413_low60_0_low20_14,
sint64 u_413_426,
sint64 v_413_426,
sint64 r_413_426,
sint64 s_413_426,
sint64 u_413_427,
sint64 v_413_427,
sint64 r_413_427,
sint64 s_413_427,
bit ne
)={
    u_413_426 * neg_f_413_low60_0_low20_0 + v_413_426 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_13 * (-(2**20)),
    r_413_426 * neg_f_413_low60_0_low20_0 + s_413_426 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_13 * (-(2**20))
&&
    u_413_426 * neg_f_413_low60_0_low20_0 + v_413_426 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_13 * (const 64 (-(2**20))),
    r_413_426 * neg_f_413_low60_0_low20_0 + s_413_426 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_13 + u_413_426 * (const 64 (2**21)) + v_413_426 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_13 + r_413_426 * (const 64 (2**21)) + s_413_426 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_13,
    neg_f_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_13,
    neg_g_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 426)) <=s delta, delta <=s (const 64 (1 + 2*426)),
    (const 64 (-(2**20))) <=s u_413_426, u_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_426, v_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_426, r_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_426, s_413_426 <=s (const 64 ((2**20))),
    u_413_426 + v_413_426 <=s (const 64 (2**20)),
    u_413_426 - v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 + v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 - v_413_426 <=s (const 64 (2**20)),
    r_413_426 + s_413_426 <=s (const 64 (2**20)),
    r_413_426 - s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 + s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 - s_413_426 <=s (const 64 (2**20)),
    u_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_413_426 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step426

// premise b
assume
neg_g_413_low60_0_low20_13 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_14 neg_f_413_low60_0_low20_13;
mov u_413_427 u_413_426;
mov v_413_427 v_413_426;

add neg_g_413_low60_0_low20_14 neg_g_413_low60_0_low20_13 neg_f_413_low60_0_low20_13;
asr neg_g_413_low60_0_low20_14 neg_g_413_low60_0_low20_14 1;
add r_413_427 r_413_426 u_413_426;
asr r_413_427 r_413_427 1;
add s_413_427 s_413_426 v_413_426;
asr s_413_427 s_413_427 1;
assert
    true
&&
    neg_f_413_low60_0_low20_14 = neg_f_413_low60_0_low20_13,
    u_413_427 = u_413_426,
    v_413_427 = v_413_426,
    neg_g_413_low60_0_low20_14 * (const 64 2) = neg_g_413_low60_0_low20_13 + neg_f_413_low60_0_low20_13,
    r_413_427 * (const 64 2) = r_413_426 + u_413_426,
    s_413_427 * (const 64 2) = s_413_426 + v_413_426
;

assume
    neg_f_413_low60_0_low20_14 = neg_f_413_low60_0_low20_13,
    u_413_427 = u_413_426,
    v_413_427 = v_413_426,
    neg_g_413_low60_0_low20_14 * 2 = neg_g_413_low60_0_low20_13 + neg_f_413_low60_0_low20_13,
    r_413_427 * 2 = r_413_426 + u_413_426,
    s_413_427 * 2 = s_413_426 + v_413_426
&&
    true
;

{
    u_413_427 * neg_f_413_low60_0_low20_0 + v_413_427 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_427 * neg_f_413_low60_0_low20_0 + s_413_427 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_14 + u_413_427 * (const 64 (2**21)) + v_413_427 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_14 + r_413_427 * (const 64 (2**21)) + s_413_427 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_14,
    neg_f_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_14,
    neg_g_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 427)) <=s delta, delta <=s (const 64 (1 + 2*427)),
    (const 64 (-(2**20))) <=s u_413_427, u_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_427, v_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_427, r_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_427, s_413_427 <=s (const 64 ((2**20))),
    u_413_427 + v_413_427 <=s (const 64 (2**20)),
    u_413_427 - v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 + v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 - v_413_427 <=s (const 64 (2**20)),
    r_413_427 + s_413_427 <=s (const 64 (2**20)),
    r_413_427 - s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 + s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 - s_413_427 <=s (const 64 (2**20)),
    u_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_413_427 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_426_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_13,
sint64 neg_g_413_low60_0_low20_13,
sint64 neg_f_413_low60_0_low20_14,
sint64 neg_g_413_low60_0_low20_14,
sint64 u_413_426,
sint64 v_413_426,
sint64 r_413_426,
sint64 s_413_426,
sint64 u_413_427,
sint64 v_413_427,
sint64 r_413_427,
sint64 s_413_427,
bit ne
)={
    u_413_426 * neg_f_413_low60_0_low20_0 + v_413_426 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_13 * (-(2**20)),
    r_413_426 * neg_f_413_low60_0_low20_0 + s_413_426 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_13 * (-(2**20))
&&
    u_413_426 * neg_f_413_low60_0_low20_0 + v_413_426 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_13 * (const 64 (-(2**20))),
    r_413_426 * neg_f_413_low60_0_low20_0 + s_413_426 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_13 + u_413_426 * (const 64 (2**21)) + v_413_426 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_13 + r_413_426 * (const 64 (2**21)) + s_413_426 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_13,
    neg_f_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_13,
    neg_g_413_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 426)) <=s delta, delta <=s (const 64 (1 + 2*426)),
    (const 64 (-(2**20))) <=s u_413_426, u_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_426, v_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_426, r_413_426 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_426, s_413_426 <=s (const 64 ((2**20))),
    u_413_426 + v_413_426 <=s (const 64 (2**20)),
    u_413_426 - v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 + v_413_426 <=s (const 64 (2**20)),
    (const 64 0) - u_413_426 - v_413_426 <=s (const 64 (2**20)),
    r_413_426 + s_413_426 <=s (const 64 (2**20)),
    r_413_426 - s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 + s_413_426 <=s (const 64 (2**20)),
    (const 64 0) - r_413_426 - s_413_426 <=s (const 64 (2**20)),
    u_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_413_426 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_413_426 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step426

// premise c
assume
neg_g_413_low60_0_low20_13 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_14 neg_g_413_low60_0_low20_13;
mov u_413_427 r_413_426;
mov v_413_427 s_413_426;

subs dc neg_g_413_low60_0_low20_14 neg_g_413_low60_0_low20_13 neg_f_413_low60_0_low20_13;
asr neg_g_413_low60_0_low20_14 neg_g_413_low60_0_low20_14 1;
subs dc r_413_427 r_413_426 u_413_426;
asr r_413_427 r_413_427 1;
subs dc s_413_427 s_413_426 v_413_426;
asr s_413_427 s_413_427 1;
assert
    true
&&
    neg_f_413_low60_0_low20_14 = neg_g_413_low60_0_low20_13,
    u_413_427 = r_413_426,
    v_413_427 = s_413_426,
    neg_g_413_low60_0_low20_14 * (const 64 2) = neg_g_413_low60_0_low20_13 - neg_f_413_low60_0_low20_13,
    r_413_427 * (const 64 2) = r_413_426 - u_413_426,
    s_413_427 * (const 64 2) = s_413_426 - v_413_426
;

assume
    neg_f_413_low60_0_low20_14 = neg_g_413_low60_0_low20_13,
    u_413_427 = r_413_426,
    v_413_427 = s_413_426,
    neg_g_413_low60_0_low20_14 * 2 = neg_g_413_low60_0_low20_13 - neg_f_413_low60_0_low20_13,
    r_413_427 * 2 = r_413_426 - u_413_426,
    s_413_427 * 2 = s_413_426 - v_413_426
&&
    true
;

{
    u_413_427 * neg_f_413_low60_0_low20_0 + v_413_427 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_427 * neg_f_413_low60_0_low20_0 + s_413_427 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_14 + u_413_427 * (const 64 (2**21)) + v_413_427 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_14 + r_413_427 * (const 64 (2**21)) + s_413_427 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_14,
    neg_f_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_14,
    neg_g_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 427)) <=s delta, delta <=s (const 64 (1 + 2*427)),
    (const 64 (-(2**20))) <=s u_413_427, u_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_427, v_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_427, r_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_427, s_413_427 <=s (const 64 ((2**20))),
    u_413_427 + v_413_427 <=s (const 64 (2**20)),
    u_413_427 - v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 + v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 - v_413_427 <=s (const 64 (2**20)),
    r_413_427 + s_413_427 <=s (const 64 (2**20)),
    r_413_427 - s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 + s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 - s_413_427 <=s (const 64 (2**20)),
    u_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_413_427 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_427_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_14,
sint64 neg_g_413_low60_0_low20_14,
sint64 neg_f_413_low60_0_low20_15,
sint64 neg_g_413_low60_0_low20_15,
sint64 u_413_427,
sint64 v_413_427,
sint64 r_413_427,
sint64 s_413_427,
sint64 u_413_428,
sint64 v_413_428,
sint64 r_413_428,
sint64 s_413_428,
bit ne
)={
    u_413_427 * neg_f_413_low60_0_low20_0 + v_413_427 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_14 * (-(2**20)),
    r_413_427 * neg_f_413_low60_0_low20_0 + s_413_427 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_14 * (-(2**20))
&&
    u_413_427 * neg_f_413_low60_0_low20_0 + v_413_427 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_14 * (const 64 (-(2**20))),
    r_413_427 * neg_f_413_low60_0_low20_0 + s_413_427 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_14 + u_413_427 * (const 64 (2**21)) + v_413_427 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_14 + r_413_427 * (const 64 (2**21)) + s_413_427 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_14,
    neg_f_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_14,
    neg_g_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 427)) <=s delta, delta <=s (const 64 (1 + 2*427)),
    (const 64 (-(2**20))) <=s u_413_427, u_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_427, v_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_427, r_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_427, s_413_427 <=s (const 64 ((2**20))),
    u_413_427 + v_413_427 <=s (const 64 (2**20)),
    u_413_427 - v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 + v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 - v_413_427 <=s (const 64 (2**20)),
    r_413_427 + s_413_427 <=s (const 64 (2**20)),
    r_413_427 - s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 + s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 - s_413_427 <=s (const 64 (2**20)),
    u_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_413_427 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step427

// premise a
assume
neg_g_413_low60_0_low20_14 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_14 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_15 neg_f_413_low60_0_low20_14;
mov u_413_428 u_413_427;
mov v_413_428 v_413_427;

asr neg_g_413_low60_0_low20_15 neg_g_413_low60_0_low20_14 1;
asr r_413_428 r_413_427 1;
asr s_413_428 s_413_427 1;
assert
    true
&&
    neg_f_413_low60_0_low20_15 = neg_f_413_low60_0_low20_14,
    u_413_428 = u_413_427,
    v_413_428 = v_413_427,
    neg_g_413_low60_0_low20_15 * (const 64 2) = neg_g_413_low60_0_low20_14,
    r_413_428 * (const 64 2) = r_413_427,
    s_413_428 * (const 64 2) = s_413_427
;

assume
    neg_f_413_low60_0_low20_15 = neg_f_413_low60_0_low20_14,
    u_413_428 = u_413_427,
    v_413_428 = v_413_427,
    neg_g_413_low60_0_low20_15 * 2 = neg_g_413_low60_0_low20_14,
    r_413_428 * 2 = r_413_427,
    s_413_428 * 2 = s_413_427
&&
    true
;

{
    u_413_428 * neg_f_413_low60_0_low20_0 + v_413_428 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_428 * neg_f_413_low60_0_low20_0 + s_413_428 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_15 + u_413_428 * (const 64 (2**21)) + v_413_428 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_15 + r_413_428 * (const 64 (2**21)) + s_413_428 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_15,
    neg_f_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_15,
    neg_g_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 428)) <=s delta, delta <=s (const 64 (1 + 2*428)),
    (const 64 (-(2**20))) <=s u_413_428, u_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_428, v_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_428, r_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_428, s_413_428 <=s (const 64 ((2**20))),
    u_413_428 + v_413_428 <=s (const 64 (2**20)),
    u_413_428 - v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 + v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 - v_413_428 <=s (const 64 (2**20)),
    r_413_428 + s_413_428 <=s (const 64 (2**20)),
    r_413_428 - s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 + s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 - s_413_428 <=s (const 64 (2**20)),
    u_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_413_428 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_427_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_14,
sint64 neg_g_413_low60_0_low20_14,
sint64 neg_f_413_low60_0_low20_15,
sint64 neg_g_413_low60_0_low20_15,
sint64 u_413_427,
sint64 v_413_427,
sint64 r_413_427,
sint64 s_413_427,
sint64 u_413_428,
sint64 v_413_428,
sint64 r_413_428,
sint64 s_413_428,
bit ne
)={
    u_413_427 * neg_f_413_low60_0_low20_0 + v_413_427 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_14 * (-(2**20)),
    r_413_427 * neg_f_413_low60_0_low20_0 + s_413_427 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_14 * (-(2**20))
&&
    u_413_427 * neg_f_413_low60_0_low20_0 + v_413_427 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_14 * (const 64 (-(2**20))),
    r_413_427 * neg_f_413_low60_0_low20_0 + s_413_427 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_14 + u_413_427 * (const 64 (2**21)) + v_413_427 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_14 + r_413_427 * (const 64 (2**21)) + s_413_427 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_14,
    neg_f_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_14,
    neg_g_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 427)) <=s delta, delta <=s (const 64 (1 + 2*427)),
    (const 64 (-(2**20))) <=s u_413_427, u_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_427, v_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_427, r_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_427, s_413_427 <=s (const 64 ((2**20))),
    u_413_427 + v_413_427 <=s (const 64 (2**20)),
    u_413_427 - v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 + v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 - v_413_427 <=s (const 64 (2**20)),
    r_413_427 + s_413_427 <=s (const 64 (2**20)),
    r_413_427 - s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 + s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 - s_413_427 <=s (const 64 (2**20)),
    u_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_413_427 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step427

// premise b
assume
neg_g_413_low60_0_low20_14 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_15 neg_f_413_low60_0_low20_14;
mov u_413_428 u_413_427;
mov v_413_428 v_413_427;

add neg_g_413_low60_0_low20_15 neg_g_413_low60_0_low20_14 neg_f_413_low60_0_low20_14;
asr neg_g_413_low60_0_low20_15 neg_g_413_low60_0_low20_15 1;
add r_413_428 r_413_427 u_413_427;
asr r_413_428 r_413_428 1;
add s_413_428 s_413_427 v_413_427;
asr s_413_428 s_413_428 1;
assert
    true
&&
    neg_f_413_low60_0_low20_15 = neg_f_413_low60_0_low20_14,
    u_413_428 = u_413_427,
    v_413_428 = v_413_427,
    neg_g_413_low60_0_low20_15 * (const 64 2) = neg_g_413_low60_0_low20_14 + neg_f_413_low60_0_low20_14,
    r_413_428 * (const 64 2) = r_413_427 + u_413_427,
    s_413_428 * (const 64 2) = s_413_427 + v_413_427
;

assume
    neg_f_413_low60_0_low20_15 = neg_f_413_low60_0_low20_14,
    u_413_428 = u_413_427,
    v_413_428 = v_413_427,
    neg_g_413_low60_0_low20_15 * 2 = neg_g_413_low60_0_low20_14 + neg_f_413_low60_0_low20_14,
    r_413_428 * 2 = r_413_427 + u_413_427,
    s_413_428 * 2 = s_413_427 + v_413_427
&&
    true
;

{
    u_413_428 * neg_f_413_low60_0_low20_0 + v_413_428 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_428 * neg_f_413_low60_0_low20_0 + s_413_428 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_15 + u_413_428 * (const 64 (2**21)) + v_413_428 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_15 + r_413_428 * (const 64 (2**21)) + s_413_428 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_15,
    neg_f_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_15,
    neg_g_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 428)) <=s delta, delta <=s (const 64 (1 + 2*428)),
    (const 64 (-(2**20))) <=s u_413_428, u_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_428, v_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_428, r_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_428, s_413_428 <=s (const 64 ((2**20))),
    u_413_428 + v_413_428 <=s (const 64 (2**20)),
    u_413_428 - v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 + v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 - v_413_428 <=s (const 64 (2**20)),
    r_413_428 + s_413_428 <=s (const 64 (2**20)),
    r_413_428 - s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 + s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 - s_413_428 <=s (const 64 (2**20)),
    u_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_413_428 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_427_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_14,
sint64 neg_g_413_low60_0_low20_14,
sint64 neg_f_413_low60_0_low20_15,
sint64 neg_g_413_low60_0_low20_15,
sint64 u_413_427,
sint64 v_413_427,
sint64 r_413_427,
sint64 s_413_427,
sint64 u_413_428,
sint64 v_413_428,
sint64 r_413_428,
sint64 s_413_428,
bit ne
)={
    u_413_427 * neg_f_413_low60_0_low20_0 + v_413_427 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_14 * (-(2**20)),
    r_413_427 * neg_f_413_low60_0_low20_0 + s_413_427 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_14 * (-(2**20))
&&
    u_413_427 * neg_f_413_low60_0_low20_0 + v_413_427 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_14 * (const 64 (-(2**20))),
    r_413_427 * neg_f_413_low60_0_low20_0 + s_413_427 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_14 + u_413_427 * (const 64 (2**21)) + v_413_427 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_14 + r_413_427 * (const 64 (2**21)) + s_413_427 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_14,
    neg_f_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_14,
    neg_g_413_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 427)) <=s delta, delta <=s (const 64 (1 + 2*427)),
    (const 64 (-(2**20))) <=s u_413_427, u_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_427, v_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_427, r_413_427 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_427, s_413_427 <=s (const 64 ((2**20))),
    u_413_427 + v_413_427 <=s (const 64 (2**20)),
    u_413_427 - v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 + v_413_427 <=s (const 64 (2**20)),
    (const 64 0) - u_413_427 - v_413_427 <=s (const 64 (2**20)),
    r_413_427 + s_413_427 <=s (const 64 (2**20)),
    r_413_427 - s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 + s_413_427 <=s (const 64 (2**20)),
    (const 64 0) - r_413_427 - s_413_427 <=s (const 64 (2**20)),
    u_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_413_427 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_413_427 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step427

// premise c
assume
neg_g_413_low60_0_low20_14 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_15 neg_g_413_low60_0_low20_14;
mov u_413_428 r_413_427;
mov v_413_428 s_413_427;

subs dc neg_g_413_low60_0_low20_15 neg_g_413_low60_0_low20_14 neg_f_413_low60_0_low20_14;
asr neg_g_413_low60_0_low20_15 neg_g_413_low60_0_low20_15 1;
subs dc r_413_428 r_413_427 u_413_427;
asr r_413_428 r_413_428 1;
subs dc s_413_428 s_413_427 v_413_427;
asr s_413_428 s_413_428 1;
assert
    true
&&
    neg_f_413_low60_0_low20_15 = neg_g_413_low60_0_low20_14,
    u_413_428 = r_413_427,
    v_413_428 = s_413_427,
    neg_g_413_low60_0_low20_15 * (const 64 2) = neg_g_413_low60_0_low20_14 - neg_f_413_low60_0_low20_14,
    r_413_428 * (const 64 2) = r_413_427 - u_413_427,
    s_413_428 * (const 64 2) = s_413_427 - v_413_427
;

assume
    neg_f_413_low60_0_low20_15 = neg_g_413_low60_0_low20_14,
    u_413_428 = r_413_427,
    v_413_428 = s_413_427,
    neg_g_413_low60_0_low20_15 * 2 = neg_g_413_low60_0_low20_14 - neg_f_413_low60_0_low20_14,
    r_413_428 * 2 = r_413_427 - u_413_427,
    s_413_428 * 2 = s_413_427 - v_413_427
&&
    true
;

{
    u_413_428 * neg_f_413_low60_0_low20_0 + v_413_428 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_428 * neg_f_413_low60_0_low20_0 + s_413_428 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_15 + u_413_428 * (const 64 (2**21)) + v_413_428 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_15 + r_413_428 * (const 64 (2**21)) + s_413_428 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_15,
    neg_f_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_15,
    neg_g_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 428)) <=s delta, delta <=s (const 64 (1 + 2*428)),
    (const 64 (-(2**20))) <=s u_413_428, u_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_428, v_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_428, r_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_428, s_413_428 <=s (const 64 ((2**20))),
    u_413_428 + v_413_428 <=s (const 64 (2**20)),
    u_413_428 - v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 + v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 - v_413_428 <=s (const 64 (2**20)),
    r_413_428 + s_413_428 <=s (const 64 (2**20)),
    r_413_428 - s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 + s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 - s_413_428 <=s (const 64 (2**20)),
    u_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_413_428 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_428_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_15,
sint64 neg_g_413_low60_0_low20_15,
sint64 neg_f_413_low60_0_low20_16,
sint64 neg_g_413_low60_0_low20_16,
sint64 u_413_428,
sint64 v_413_428,
sint64 r_413_428,
sint64 s_413_428,
sint64 u_413_429,
sint64 v_413_429,
sint64 r_413_429,
sint64 s_413_429,
bit ne
)={
    u_413_428 * neg_f_413_low60_0_low20_0 + v_413_428 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_15 * (-(2**20)),
    r_413_428 * neg_f_413_low60_0_low20_0 + s_413_428 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_15 * (-(2**20))
&&
    u_413_428 * neg_f_413_low60_0_low20_0 + v_413_428 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_15 * (const 64 (-(2**20))),
    r_413_428 * neg_f_413_low60_0_low20_0 + s_413_428 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_15 + u_413_428 * (const 64 (2**21)) + v_413_428 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_15 + r_413_428 * (const 64 (2**21)) + s_413_428 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_15,
    neg_f_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_15,
    neg_g_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 428)) <=s delta, delta <=s (const 64 (1 + 2*428)),
    (const 64 (-(2**20))) <=s u_413_428, u_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_428, v_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_428, r_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_428, s_413_428 <=s (const 64 ((2**20))),
    u_413_428 + v_413_428 <=s (const 64 (2**20)),
    u_413_428 - v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 + v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 - v_413_428 <=s (const 64 (2**20)),
    r_413_428 + s_413_428 <=s (const 64 (2**20)),
    r_413_428 - s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 + s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 - s_413_428 <=s (const 64 (2**20)),
    u_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_413_428 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step428

// premise a
assume
neg_g_413_low60_0_low20_15 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_15 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_16 neg_f_413_low60_0_low20_15;
mov u_413_429 u_413_428;
mov v_413_429 v_413_428;

asr neg_g_413_low60_0_low20_16 neg_g_413_low60_0_low20_15 1;
asr r_413_429 r_413_428 1;
asr s_413_429 s_413_428 1;
assert
    true
&&
    neg_f_413_low60_0_low20_16 = neg_f_413_low60_0_low20_15,
    u_413_429 = u_413_428,
    v_413_429 = v_413_428,
    neg_g_413_low60_0_low20_16 * (const 64 2) = neg_g_413_low60_0_low20_15,
    r_413_429 * (const 64 2) = r_413_428,
    s_413_429 * (const 64 2) = s_413_428
;

assume
    neg_f_413_low60_0_low20_16 = neg_f_413_low60_0_low20_15,
    u_413_429 = u_413_428,
    v_413_429 = v_413_428,
    neg_g_413_low60_0_low20_16 * 2 = neg_g_413_low60_0_low20_15,
    r_413_429 * 2 = r_413_428,
    s_413_429 * 2 = s_413_428
&&
    true
;

{
    u_413_429 * neg_f_413_low60_0_low20_0 + v_413_429 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_429 * neg_f_413_low60_0_low20_0 + s_413_429 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_16 + u_413_429 * (const 64 (2**21)) + v_413_429 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_16 + r_413_429 * (const 64 (2**21)) + s_413_429 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_16,
    neg_f_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_16,
    neg_g_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 429)) <=s delta, delta <=s (const 64 (1 + 2*429)),
    (const 64 (-(2**20))) <=s u_413_429, u_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_429, v_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_429, r_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_429, s_413_429 <=s (const 64 ((2**20))),
    u_413_429 + v_413_429 <=s (const 64 (2**20)),
    u_413_429 - v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 + v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 - v_413_429 <=s (const 64 (2**20)),
    r_413_429 + s_413_429 <=s (const 64 (2**20)),
    r_413_429 - s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 + s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 - s_413_429 <=s (const 64 (2**20)),
    u_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_413_429 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_428_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_15,
sint64 neg_g_413_low60_0_low20_15,
sint64 neg_f_413_low60_0_low20_16,
sint64 neg_g_413_low60_0_low20_16,
sint64 u_413_428,
sint64 v_413_428,
sint64 r_413_428,
sint64 s_413_428,
sint64 u_413_429,
sint64 v_413_429,
sint64 r_413_429,
sint64 s_413_429,
bit ne
)={
    u_413_428 * neg_f_413_low60_0_low20_0 + v_413_428 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_15 * (-(2**20)),
    r_413_428 * neg_f_413_low60_0_low20_0 + s_413_428 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_15 * (-(2**20))
&&
    u_413_428 * neg_f_413_low60_0_low20_0 + v_413_428 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_15 * (const 64 (-(2**20))),
    r_413_428 * neg_f_413_low60_0_low20_0 + s_413_428 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_15 + u_413_428 * (const 64 (2**21)) + v_413_428 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_15 + r_413_428 * (const 64 (2**21)) + s_413_428 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_15,
    neg_f_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_15,
    neg_g_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 428)) <=s delta, delta <=s (const 64 (1 + 2*428)),
    (const 64 (-(2**20))) <=s u_413_428, u_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_428, v_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_428, r_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_428, s_413_428 <=s (const 64 ((2**20))),
    u_413_428 + v_413_428 <=s (const 64 (2**20)),
    u_413_428 - v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 + v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 - v_413_428 <=s (const 64 (2**20)),
    r_413_428 + s_413_428 <=s (const 64 (2**20)),
    r_413_428 - s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 + s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 - s_413_428 <=s (const 64 (2**20)),
    u_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_413_428 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step428

// premise b
assume
neg_g_413_low60_0_low20_15 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_16 neg_f_413_low60_0_low20_15;
mov u_413_429 u_413_428;
mov v_413_429 v_413_428;

add neg_g_413_low60_0_low20_16 neg_g_413_low60_0_low20_15 neg_f_413_low60_0_low20_15;
asr neg_g_413_low60_0_low20_16 neg_g_413_low60_0_low20_16 1;
add r_413_429 r_413_428 u_413_428;
asr r_413_429 r_413_429 1;
add s_413_429 s_413_428 v_413_428;
asr s_413_429 s_413_429 1;
assert
    true
&&
    neg_f_413_low60_0_low20_16 = neg_f_413_low60_0_low20_15,
    u_413_429 = u_413_428,
    v_413_429 = v_413_428,
    neg_g_413_low60_0_low20_16 * (const 64 2) = neg_g_413_low60_0_low20_15 + neg_f_413_low60_0_low20_15,
    r_413_429 * (const 64 2) = r_413_428 + u_413_428,
    s_413_429 * (const 64 2) = s_413_428 + v_413_428
;

assume
    neg_f_413_low60_0_low20_16 = neg_f_413_low60_0_low20_15,
    u_413_429 = u_413_428,
    v_413_429 = v_413_428,
    neg_g_413_low60_0_low20_16 * 2 = neg_g_413_low60_0_low20_15 + neg_f_413_low60_0_low20_15,
    r_413_429 * 2 = r_413_428 + u_413_428,
    s_413_429 * 2 = s_413_428 + v_413_428
&&
    true
;

{
    u_413_429 * neg_f_413_low60_0_low20_0 + v_413_429 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_429 * neg_f_413_low60_0_low20_0 + s_413_429 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_16 + u_413_429 * (const 64 (2**21)) + v_413_429 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_16 + r_413_429 * (const 64 (2**21)) + s_413_429 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_16,
    neg_f_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_16,
    neg_g_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 429)) <=s delta, delta <=s (const 64 (1 + 2*429)),
    (const 64 (-(2**20))) <=s u_413_429, u_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_429, v_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_429, r_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_429, s_413_429 <=s (const 64 ((2**20))),
    u_413_429 + v_413_429 <=s (const 64 (2**20)),
    u_413_429 - v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 + v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 - v_413_429 <=s (const 64 (2**20)),
    r_413_429 + s_413_429 <=s (const 64 (2**20)),
    r_413_429 - s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 + s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 - s_413_429 <=s (const 64 (2**20)),
    u_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_413_429 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_428_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_15,
sint64 neg_g_413_low60_0_low20_15,
sint64 neg_f_413_low60_0_low20_16,
sint64 neg_g_413_low60_0_low20_16,
sint64 u_413_428,
sint64 v_413_428,
sint64 r_413_428,
sint64 s_413_428,
sint64 u_413_429,
sint64 v_413_429,
sint64 r_413_429,
sint64 s_413_429,
bit ne
)={
    u_413_428 * neg_f_413_low60_0_low20_0 + v_413_428 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_15 * (-(2**20)),
    r_413_428 * neg_f_413_low60_0_low20_0 + s_413_428 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_15 * (-(2**20))
&&
    u_413_428 * neg_f_413_low60_0_low20_0 + v_413_428 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_15 * (const 64 (-(2**20))),
    r_413_428 * neg_f_413_low60_0_low20_0 + s_413_428 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_15 + u_413_428 * (const 64 (2**21)) + v_413_428 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_15 + r_413_428 * (const 64 (2**21)) + s_413_428 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_15,
    neg_f_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_15,
    neg_g_413_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 428)) <=s delta, delta <=s (const 64 (1 + 2*428)),
    (const 64 (-(2**20))) <=s u_413_428, u_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_428, v_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_428, r_413_428 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_428, s_413_428 <=s (const 64 ((2**20))),
    u_413_428 + v_413_428 <=s (const 64 (2**20)),
    u_413_428 - v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 + v_413_428 <=s (const 64 (2**20)),
    (const 64 0) - u_413_428 - v_413_428 <=s (const 64 (2**20)),
    r_413_428 + s_413_428 <=s (const 64 (2**20)),
    r_413_428 - s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 + s_413_428 <=s (const 64 (2**20)),
    (const 64 0) - r_413_428 - s_413_428 <=s (const 64 (2**20)),
    u_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_413_428 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_413_428 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step428

// premise c
assume
neg_g_413_low60_0_low20_15 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_16 neg_g_413_low60_0_low20_15;
mov u_413_429 r_413_428;
mov v_413_429 s_413_428;

subs dc neg_g_413_low60_0_low20_16 neg_g_413_low60_0_low20_15 neg_f_413_low60_0_low20_15;
asr neg_g_413_low60_0_low20_16 neg_g_413_low60_0_low20_16 1;
subs dc r_413_429 r_413_428 u_413_428;
asr r_413_429 r_413_429 1;
subs dc s_413_429 s_413_428 v_413_428;
asr s_413_429 s_413_429 1;
assert
    true
&&
    neg_f_413_low60_0_low20_16 = neg_g_413_low60_0_low20_15,
    u_413_429 = r_413_428,
    v_413_429 = s_413_428,
    neg_g_413_low60_0_low20_16 * (const 64 2) = neg_g_413_low60_0_low20_15 - neg_f_413_low60_0_low20_15,
    r_413_429 * (const 64 2) = r_413_428 - u_413_428,
    s_413_429 * (const 64 2) = s_413_428 - v_413_428
;

assume
    neg_f_413_low60_0_low20_16 = neg_g_413_low60_0_low20_15,
    u_413_429 = r_413_428,
    v_413_429 = s_413_428,
    neg_g_413_low60_0_low20_16 * 2 = neg_g_413_low60_0_low20_15 - neg_f_413_low60_0_low20_15,
    r_413_429 * 2 = r_413_428 - u_413_428,
    s_413_429 * 2 = s_413_428 - v_413_428
&&
    true
;

{
    u_413_429 * neg_f_413_low60_0_low20_0 + v_413_429 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_429 * neg_f_413_low60_0_low20_0 + s_413_429 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_16 + u_413_429 * (const 64 (2**21)) + v_413_429 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_16 + r_413_429 * (const 64 (2**21)) + s_413_429 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_16,
    neg_f_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_16,
    neg_g_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 429)) <=s delta, delta <=s (const 64 (1 + 2*429)),
    (const 64 (-(2**20))) <=s u_413_429, u_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_429, v_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_429, r_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_429, s_413_429 <=s (const 64 ((2**20))),
    u_413_429 + v_413_429 <=s (const 64 (2**20)),
    u_413_429 - v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 + v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 - v_413_429 <=s (const 64 (2**20)),
    r_413_429 + s_413_429 <=s (const 64 (2**20)),
    r_413_429 - s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 + s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 - s_413_429 <=s (const 64 (2**20)),
    u_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_413_429 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_429_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_16,
sint64 neg_g_413_low60_0_low20_16,
sint64 neg_f_413_low60_0_low20_17,
sint64 neg_g_413_low60_0_low20_17,
sint64 u_413_429,
sint64 v_413_429,
sint64 r_413_429,
sint64 s_413_429,
sint64 u_413_430,
sint64 v_413_430,
sint64 r_413_430,
sint64 s_413_430,
bit ne
)={
    u_413_429 * neg_f_413_low60_0_low20_0 + v_413_429 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_16 * (-(2**20)),
    r_413_429 * neg_f_413_low60_0_low20_0 + s_413_429 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_16 * (-(2**20))
&&
    u_413_429 * neg_f_413_low60_0_low20_0 + v_413_429 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_16 * (const 64 (-(2**20))),
    r_413_429 * neg_f_413_low60_0_low20_0 + s_413_429 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_16 + u_413_429 * (const 64 (2**21)) + v_413_429 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_16 + r_413_429 * (const 64 (2**21)) + s_413_429 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_16,
    neg_f_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_16,
    neg_g_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 429)) <=s delta, delta <=s (const 64 (1 + 2*429)),
    (const 64 (-(2**20))) <=s u_413_429, u_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_429, v_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_429, r_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_429, s_413_429 <=s (const 64 ((2**20))),
    u_413_429 + v_413_429 <=s (const 64 (2**20)),
    u_413_429 - v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 + v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 - v_413_429 <=s (const 64 (2**20)),
    r_413_429 + s_413_429 <=s (const 64 (2**20)),
    r_413_429 - s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 + s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 - s_413_429 <=s (const 64 (2**20)),
    u_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_413_429 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step429

// premise a
assume
neg_g_413_low60_0_low20_16 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_16 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_17 neg_f_413_low60_0_low20_16;
mov u_413_430 u_413_429;
mov v_413_430 v_413_429;

asr neg_g_413_low60_0_low20_17 neg_g_413_low60_0_low20_16 1;
asr r_413_430 r_413_429 1;
asr s_413_430 s_413_429 1;
assert
    true
&&
    neg_f_413_low60_0_low20_17 = neg_f_413_low60_0_low20_16,
    u_413_430 = u_413_429,
    v_413_430 = v_413_429,
    neg_g_413_low60_0_low20_17 * (const 64 2) = neg_g_413_low60_0_low20_16,
    r_413_430 * (const 64 2) = r_413_429,
    s_413_430 * (const 64 2) = s_413_429
;

assume
    neg_f_413_low60_0_low20_17 = neg_f_413_low60_0_low20_16,
    u_413_430 = u_413_429,
    v_413_430 = v_413_429,
    neg_g_413_low60_0_low20_17 * 2 = neg_g_413_low60_0_low20_16,
    r_413_430 * 2 = r_413_429,
    s_413_430 * 2 = s_413_429
&&
    true
;

{
    u_413_430 * neg_f_413_low60_0_low20_0 + v_413_430 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_430 * neg_f_413_low60_0_low20_0 + s_413_430 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_17 + u_413_430 * (const 64 (2**21)) + v_413_430 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_17 + r_413_430 * (const 64 (2**21)) + s_413_430 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_17,
    neg_f_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_17,
    neg_g_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 430)) <=s delta, delta <=s (const 64 (1 + 2*430)),
    (const 64 (-(2**20))) <=s u_413_430, u_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_430, v_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_430, r_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_430, s_413_430 <=s (const 64 ((2**20))),
    u_413_430 + v_413_430 <=s (const 64 (2**20)),
    u_413_430 - v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 + v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 - v_413_430 <=s (const 64 (2**20)),
    r_413_430 + s_413_430 <=s (const 64 (2**20)),
    r_413_430 - s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 + s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 - s_413_430 <=s (const 64 (2**20)),
    u_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_413_430 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_429_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_16,
sint64 neg_g_413_low60_0_low20_16,
sint64 neg_f_413_low60_0_low20_17,
sint64 neg_g_413_low60_0_low20_17,
sint64 u_413_429,
sint64 v_413_429,
sint64 r_413_429,
sint64 s_413_429,
sint64 u_413_430,
sint64 v_413_430,
sint64 r_413_430,
sint64 s_413_430,
bit ne
)={
    u_413_429 * neg_f_413_low60_0_low20_0 + v_413_429 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_16 * (-(2**20)),
    r_413_429 * neg_f_413_low60_0_low20_0 + s_413_429 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_16 * (-(2**20))
&&
    u_413_429 * neg_f_413_low60_0_low20_0 + v_413_429 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_16 * (const 64 (-(2**20))),
    r_413_429 * neg_f_413_low60_0_low20_0 + s_413_429 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_16 + u_413_429 * (const 64 (2**21)) + v_413_429 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_16 + r_413_429 * (const 64 (2**21)) + s_413_429 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_16,
    neg_f_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_16,
    neg_g_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 429)) <=s delta, delta <=s (const 64 (1 + 2*429)),
    (const 64 (-(2**20))) <=s u_413_429, u_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_429, v_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_429, r_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_429, s_413_429 <=s (const 64 ((2**20))),
    u_413_429 + v_413_429 <=s (const 64 (2**20)),
    u_413_429 - v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 + v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 - v_413_429 <=s (const 64 (2**20)),
    r_413_429 + s_413_429 <=s (const 64 (2**20)),
    r_413_429 - s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 + s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 - s_413_429 <=s (const 64 (2**20)),
    u_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_413_429 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step429

// premise b
assume
neg_g_413_low60_0_low20_16 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_17 neg_f_413_low60_0_low20_16;
mov u_413_430 u_413_429;
mov v_413_430 v_413_429;

add neg_g_413_low60_0_low20_17 neg_g_413_low60_0_low20_16 neg_f_413_low60_0_low20_16;
asr neg_g_413_low60_0_low20_17 neg_g_413_low60_0_low20_17 1;
add r_413_430 r_413_429 u_413_429;
asr r_413_430 r_413_430 1;
add s_413_430 s_413_429 v_413_429;
asr s_413_430 s_413_430 1;
assert
    true
&&
    neg_f_413_low60_0_low20_17 = neg_f_413_low60_0_low20_16,
    u_413_430 = u_413_429,
    v_413_430 = v_413_429,
    neg_g_413_low60_0_low20_17 * (const 64 2) = neg_g_413_low60_0_low20_16 + neg_f_413_low60_0_low20_16,
    r_413_430 * (const 64 2) = r_413_429 + u_413_429,
    s_413_430 * (const 64 2) = s_413_429 + v_413_429
;

assume
    neg_f_413_low60_0_low20_17 = neg_f_413_low60_0_low20_16,
    u_413_430 = u_413_429,
    v_413_430 = v_413_429,
    neg_g_413_low60_0_low20_17 * 2 = neg_g_413_low60_0_low20_16 + neg_f_413_low60_0_low20_16,
    r_413_430 * 2 = r_413_429 + u_413_429,
    s_413_430 * 2 = s_413_429 + v_413_429
&&
    true
;

{
    u_413_430 * neg_f_413_low60_0_low20_0 + v_413_430 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_430 * neg_f_413_low60_0_low20_0 + s_413_430 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_17 + u_413_430 * (const 64 (2**21)) + v_413_430 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_17 + r_413_430 * (const 64 (2**21)) + s_413_430 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_17,
    neg_f_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_17,
    neg_g_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 430)) <=s delta, delta <=s (const 64 (1 + 2*430)),
    (const 64 (-(2**20))) <=s u_413_430, u_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_430, v_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_430, r_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_430, s_413_430 <=s (const 64 ((2**20))),
    u_413_430 + v_413_430 <=s (const 64 (2**20)),
    u_413_430 - v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 + v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 - v_413_430 <=s (const 64 (2**20)),
    r_413_430 + s_413_430 <=s (const 64 (2**20)),
    r_413_430 - s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 + s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 - s_413_430 <=s (const 64 (2**20)),
    u_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_413_430 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_429_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_16,
sint64 neg_g_413_low60_0_low20_16,
sint64 neg_f_413_low60_0_low20_17,
sint64 neg_g_413_low60_0_low20_17,
sint64 u_413_429,
sint64 v_413_429,
sint64 r_413_429,
sint64 s_413_429,
sint64 u_413_430,
sint64 v_413_430,
sint64 r_413_430,
sint64 s_413_430,
bit ne
)={
    u_413_429 * neg_f_413_low60_0_low20_0 + v_413_429 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_16 * (-(2**20)),
    r_413_429 * neg_f_413_low60_0_low20_0 + s_413_429 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_16 * (-(2**20))
&&
    u_413_429 * neg_f_413_low60_0_low20_0 + v_413_429 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_16 * (const 64 (-(2**20))),
    r_413_429 * neg_f_413_low60_0_low20_0 + s_413_429 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_16 + u_413_429 * (const 64 (2**21)) + v_413_429 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_16 + r_413_429 * (const 64 (2**21)) + s_413_429 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_16,
    neg_f_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_16,
    neg_g_413_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 429)) <=s delta, delta <=s (const 64 (1 + 2*429)),
    (const 64 (-(2**20))) <=s u_413_429, u_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_429, v_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_429, r_413_429 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_429, s_413_429 <=s (const 64 ((2**20))),
    u_413_429 + v_413_429 <=s (const 64 (2**20)),
    u_413_429 - v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 + v_413_429 <=s (const 64 (2**20)),
    (const 64 0) - u_413_429 - v_413_429 <=s (const 64 (2**20)),
    r_413_429 + s_413_429 <=s (const 64 (2**20)),
    r_413_429 - s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 + s_413_429 <=s (const 64 (2**20)),
    (const 64 0) - r_413_429 - s_413_429 <=s (const 64 (2**20)),
    u_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_413_429 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_413_429 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step429

// premise c
assume
neg_g_413_low60_0_low20_16 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_17 neg_g_413_low60_0_low20_16;
mov u_413_430 r_413_429;
mov v_413_430 s_413_429;

subs dc neg_g_413_low60_0_low20_17 neg_g_413_low60_0_low20_16 neg_f_413_low60_0_low20_16;
asr neg_g_413_low60_0_low20_17 neg_g_413_low60_0_low20_17 1;
subs dc r_413_430 r_413_429 u_413_429;
asr r_413_430 r_413_430 1;
subs dc s_413_430 s_413_429 v_413_429;
asr s_413_430 s_413_430 1;
assert
    true
&&
    neg_f_413_low60_0_low20_17 = neg_g_413_low60_0_low20_16,
    u_413_430 = r_413_429,
    v_413_430 = s_413_429,
    neg_g_413_low60_0_low20_17 * (const 64 2) = neg_g_413_low60_0_low20_16 - neg_f_413_low60_0_low20_16,
    r_413_430 * (const 64 2) = r_413_429 - u_413_429,
    s_413_430 * (const 64 2) = s_413_429 - v_413_429
;

assume
    neg_f_413_low60_0_low20_17 = neg_g_413_low60_0_low20_16,
    u_413_430 = r_413_429,
    v_413_430 = s_413_429,
    neg_g_413_low60_0_low20_17 * 2 = neg_g_413_low60_0_low20_16 - neg_f_413_low60_0_low20_16,
    r_413_430 * 2 = r_413_429 - u_413_429,
    s_413_430 * 2 = s_413_429 - v_413_429
&&
    true
;

{
    u_413_430 * neg_f_413_low60_0_low20_0 + v_413_430 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_430 * neg_f_413_low60_0_low20_0 + s_413_430 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_17 + u_413_430 * (const 64 (2**21)) + v_413_430 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_17 + r_413_430 * (const 64 (2**21)) + s_413_430 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_17,
    neg_f_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_17,
    neg_g_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 430)) <=s delta, delta <=s (const 64 (1 + 2*430)),
    (const 64 (-(2**20))) <=s u_413_430, u_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_430, v_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_430, r_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_430, s_413_430 <=s (const 64 ((2**20))),
    u_413_430 + v_413_430 <=s (const 64 (2**20)),
    u_413_430 - v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 + v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 - v_413_430 <=s (const 64 (2**20)),
    r_413_430 + s_413_430 <=s (const 64 (2**20)),
    r_413_430 - s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 + s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 - s_413_430 <=s (const 64 (2**20)),
    u_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_413_430 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_430_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_17,
sint64 neg_g_413_low60_0_low20_17,
sint64 neg_f_413_low60_0_low20_18,
sint64 neg_g_413_low60_0_low20_18,
sint64 u_413_430,
sint64 v_413_430,
sint64 r_413_430,
sint64 s_413_430,
sint64 u_413_431,
sint64 v_413_431,
sint64 r_413_431,
sint64 s_413_431,
bit ne
)={
    u_413_430 * neg_f_413_low60_0_low20_0 + v_413_430 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_17 * (-(2**20)),
    r_413_430 * neg_f_413_low60_0_low20_0 + s_413_430 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_17 * (-(2**20))
&&
    u_413_430 * neg_f_413_low60_0_low20_0 + v_413_430 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_17 * (const 64 (-(2**20))),
    r_413_430 * neg_f_413_low60_0_low20_0 + s_413_430 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_17 + u_413_430 * (const 64 (2**21)) + v_413_430 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_17 + r_413_430 * (const 64 (2**21)) + s_413_430 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_17,
    neg_f_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_17,
    neg_g_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 430)) <=s delta, delta <=s (const 64 (1 + 2*430)),
    (const 64 (-(2**20))) <=s u_413_430, u_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_430, v_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_430, r_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_430, s_413_430 <=s (const 64 ((2**20))),
    u_413_430 + v_413_430 <=s (const 64 (2**20)),
    u_413_430 - v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 + v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 - v_413_430 <=s (const 64 (2**20)),
    r_413_430 + s_413_430 <=s (const 64 (2**20)),
    r_413_430 - s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 + s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 - s_413_430 <=s (const 64 (2**20)),
    u_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_413_430 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step430

// premise a
assume
neg_g_413_low60_0_low20_17 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_17 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_18 neg_f_413_low60_0_low20_17;
mov u_413_431 u_413_430;
mov v_413_431 v_413_430;

asr neg_g_413_low60_0_low20_18 neg_g_413_low60_0_low20_17 1;
asr r_413_431 r_413_430 1;
asr s_413_431 s_413_430 1;
assert
    true
&&
    neg_f_413_low60_0_low20_18 = neg_f_413_low60_0_low20_17,
    u_413_431 = u_413_430,
    v_413_431 = v_413_430,
    neg_g_413_low60_0_low20_18 * (const 64 2) = neg_g_413_low60_0_low20_17,
    r_413_431 * (const 64 2) = r_413_430,
    s_413_431 * (const 64 2) = s_413_430
;

assume
    neg_f_413_low60_0_low20_18 = neg_f_413_low60_0_low20_17,
    u_413_431 = u_413_430,
    v_413_431 = v_413_430,
    neg_g_413_low60_0_low20_18 * 2 = neg_g_413_low60_0_low20_17,
    r_413_431 * 2 = r_413_430,
    s_413_431 * 2 = s_413_430
&&
    true
;

{
    u_413_431 * neg_f_413_low60_0_low20_0 + v_413_431 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_431 * neg_f_413_low60_0_low20_0 + s_413_431 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_18 + u_413_431 * (const 64 (2**21)) + v_413_431 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_18 + r_413_431 * (const 64 (2**21)) + s_413_431 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_18,
    neg_f_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_18,
    neg_g_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 431)) <=s delta, delta <=s (const 64 (1 + 2*431)),
    (const 64 (-(2**20))) <=s u_413_431, u_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_431, v_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_431, r_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_431, s_413_431 <=s (const 64 ((2**20))),
    u_413_431 + v_413_431 <=s (const 64 (2**20)),
    u_413_431 - v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 + v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 - v_413_431 <=s (const 64 (2**20)),
    r_413_431 + s_413_431 <=s (const 64 (2**20)),
    r_413_431 - s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 + s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 - s_413_431 <=s (const 64 (2**20)),
    u_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_413_431 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_430_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_17,
sint64 neg_g_413_low60_0_low20_17,
sint64 neg_f_413_low60_0_low20_18,
sint64 neg_g_413_low60_0_low20_18,
sint64 u_413_430,
sint64 v_413_430,
sint64 r_413_430,
sint64 s_413_430,
sint64 u_413_431,
sint64 v_413_431,
sint64 r_413_431,
sint64 s_413_431,
bit ne
)={
    u_413_430 * neg_f_413_low60_0_low20_0 + v_413_430 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_17 * (-(2**20)),
    r_413_430 * neg_f_413_low60_0_low20_0 + s_413_430 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_17 * (-(2**20))
&&
    u_413_430 * neg_f_413_low60_0_low20_0 + v_413_430 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_17 * (const 64 (-(2**20))),
    r_413_430 * neg_f_413_low60_0_low20_0 + s_413_430 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_17 + u_413_430 * (const 64 (2**21)) + v_413_430 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_17 + r_413_430 * (const 64 (2**21)) + s_413_430 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_17,
    neg_f_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_17,
    neg_g_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 430)) <=s delta, delta <=s (const 64 (1 + 2*430)),
    (const 64 (-(2**20))) <=s u_413_430, u_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_430, v_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_430, r_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_430, s_413_430 <=s (const 64 ((2**20))),
    u_413_430 + v_413_430 <=s (const 64 (2**20)),
    u_413_430 - v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 + v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 - v_413_430 <=s (const 64 (2**20)),
    r_413_430 + s_413_430 <=s (const 64 (2**20)),
    r_413_430 - s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 + s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 - s_413_430 <=s (const 64 (2**20)),
    u_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_413_430 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step430

// premise b
assume
neg_g_413_low60_0_low20_17 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_18 neg_f_413_low60_0_low20_17;
mov u_413_431 u_413_430;
mov v_413_431 v_413_430;

add neg_g_413_low60_0_low20_18 neg_g_413_low60_0_low20_17 neg_f_413_low60_0_low20_17;
asr neg_g_413_low60_0_low20_18 neg_g_413_low60_0_low20_18 1;
add r_413_431 r_413_430 u_413_430;
asr r_413_431 r_413_431 1;
add s_413_431 s_413_430 v_413_430;
asr s_413_431 s_413_431 1;
assert
    true
&&
    neg_f_413_low60_0_low20_18 = neg_f_413_low60_0_low20_17,
    u_413_431 = u_413_430,
    v_413_431 = v_413_430,
    neg_g_413_low60_0_low20_18 * (const 64 2) = neg_g_413_low60_0_low20_17 + neg_f_413_low60_0_low20_17,
    r_413_431 * (const 64 2) = r_413_430 + u_413_430,
    s_413_431 * (const 64 2) = s_413_430 + v_413_430
;

assume
    neg_f_413_low60_0_low20_18 = neg_f_413_low60_0_low20_17,
    u_413_431 = u_413_430,
    v_413_431 = v_413_430,
    neg_g_413_low60_0_low20_18 * 2 = neg_g_413_low60_0_low20_17 + neg_f_413_low60_0_low20_17,
    r_413_431 * 2 = r_413_430 + u_413_430,
    s_413_431 * 2 = s_413_430 + v_413_430
&&
    true
;

{
    u_413_431 * neg_f_413_low60_0_low20_0 + v_413_431 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_431 * neg_f_413_low60_0_low20_0 + s_413_431 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_18 + u_413_431 * (const 64 (2**21)) + v_413_431 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_18 + r_413_431 * (const 64 (2**21)) + s_413_431 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_18,
    neg_f_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_18,
    neg_g_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 431)) <=s delta, delta <=s (const 64 (1 + 2*431)),
    (const 64 (-(2**20))) <=s u_413_431, u_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_431, v_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_431, r_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_431, s_413_431 <=s (const 64 ((2**20))),
    u_413_431 + v_413_431 <=s (const 64 (2**20)),
    u_413_431 - v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 + v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 - v_413_431 <=s (const 64 (2**20)),
    r_413_431 + s_413_431 <=s (const 64 (2**20)),
    r_413_431 - s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 + s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 - s_413_431 <=s (const 64 (2**20)),
    u_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_413_431 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_430_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_17,
sint64 neg_g_413_low60_0_low20_17,
sint64 neg_f_413_low60_0_low20_18,
sint64 neg_g_413_low60_0_low20_18,
sint64 u_413_430,
sint64 v_413_430,
sint64 r_413_430,
sint64 s_413_430,
sint64 u_413_431,
sint64 v_413_431,
sint64 r_413_431,
sint64 s_413_431,
bit ne
)={
    u_413_430 * neg_f_413_low60_0_low20_0 + v_413_430 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_17 * (-(2**20)),
    r_413_430 * neg_f_413_low60_0_low20_0 + s_413_430 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_17 * (-(2**20))
&&
    u_413_430 * neg_f_413_low60_0_low20_0 + v_413_430 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_17 * (const 64 (-(2**20))),
    r_413_430 * neg_f_413_low60_0_low20_0 + s_413_430 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_17 + u_413_430 * (const 64 (2**21)) + v_413_430 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_17 + r_413_430 * (const 64 (2**21)) + s_413_430 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_17,
    neg_f_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_17,
    neg_g_413_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 430)) <=s delta, delta <=s (const 64 (1 + 2*430)),
    (const 64 (-(2**20))) <=s u_413_430, u_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_430, v_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_430, r_413_430 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_430, s_413_430 <=s (const 64 ((2**20))),
    u_413_430 + v_413_430 <=s (const 64 (2**20)),
    u_413_430 - v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 + v_413_430 <=s (const 64 (2**20)),
    (const 64 0) - u_413_430 - v_413_430 <=s (const 64 (2**20)),
    r_413_430 + s_413_430 <=s (const 64 (2**20)),
    r_413_430 - s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 + s_413_430 <=s (const 64 (2**20)),
    (const 64 0) - r_413_430 - s_413_430 <=s (const 64 (2**20)),
    u_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_413_430 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_413_430 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step430

// premise c
assume
neg_g_413_low60_0_low20_17 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_18 neg_g_413_low60_0_low20_17;
mov u_413_431 r_413_430;
mov v_413_431 s_413_430;

subs dc neg_g_413_low60_0_low20_18 neg_g_413_low60_0_low20_17 neg_f_413_low60_0_low20_17;
asr neg_g_413_low60_0_low20_18 neg_g_413_low60_0_low20_18 1;
subs dc r_413_431 r_413_430 u_413_430;
asr r_413_431 r_413_431 1;
subs dc s_413_431 s_413_430 v_413_430;
asr s_413_431 s_413_431 1;
assert
    true
&&
    neg_f_413_low60_0_low20_18 = neg_g_413_low60_0_low20_17,
    u_413_431 = r_413_430,
    v_413_431 = s_413_430,
    neg_g_413_low60_0_low20_18 * (const 64 2) = neg_g_413_low60_0_low20_17 - neg_f_413_low60_0_low20_17,
    r_413_431 * (const 64 2) = r_413_430 - u_413_430,
    s_413_431 * (const 64 2) = s_413_430 - v_413_430
;

assume
    neg_f_413_low60_0_low20_18 = neg_g_413_low60_0_low20_17,
    u_413_431 = r_413_430,
    v_413_431 = s_413_430,
    neg_g_413_low60_0_low20_18 * 2 = neg_g_413_low60_0_low20_17 - neg_f_413_low60_0_low20_17,
    r_413_431 * 2 = r_413_430 - u_413_430,
    s_413_431 * 2 = s_413_430 - v_413_430
&&
    true
;

{
    u_413_431 * neg_f_413_low60_0_low20_0 + v_413_431 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_431 * neg_f_413_low60_0_low20_0 + s_413_431 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_18 + u_413_431 * (const 64 (2**21)) + v_413_431 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_18 + r_413_431 * (const 64 (2**21)) + s_413_431 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_18,
    neg_f_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_18,
    neg_g_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 431)) <=s delta, delta <=s (const 64 (1 + 2*431)),
    (const 64 (-(2**20))) <=s u_413_431, u_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_431, v_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_431, r_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_431, s_413_431 <=s (const 64 ((2**20))),
    u_413_431 + v_413_431 <=s (const 64 (2**20)),
    u_413_431 - v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 + v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 - v_413_431 <=s (const 64 (2**20)),
    r_413_431 + s_413_431 <=s (const 64 (2**20)),
    r_413_431 - s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 + s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 - s_413_431 <=s (const 64 (2**20)),
    u_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_413_431 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_431_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_18,
sint64 neg_g_413_low60_0_low20_18,
sint64 neg_f_413_low60_0_low20_19,
sint64 neg_g_413_low60_0_low20_19,
sint64 u_413_431,
sint64 v_413_431,
sint64 r_413_431,
sint64 s_413_431,
sint64 u_413_432,
sint64 v_413_432,
sint64 r_413_432,
sint64 s_413_432,
bit ne
)={
    u_413_431 * neg_f_413_low60_0_low20_0 + v_413_431 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_18 * (-(2**20)),
    r_413_431 * neg_f_413_low60_0_low20_0 + s_413_431 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_18 * (-(2**20))
&&
    u_413_431 * neg_f_413_low60_0_low20_0 + v_413_431 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_18 * (const 64 (-(2**20))),
    r_413_431 * neg_f_413_low60_0_low20_0 + s_413_431 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_18 + u_413_431 * (const 64 (2**21)) + v_413_431 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_18 + r_413_431 * (const 64 (2**21)) + s_413_431 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_18,
    neg_f_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_18,
    neg_g_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 431)) <=s delta, delta <=s (const 64 (1 + 2*431)),
    (const 64 (-(2**20))) <=s u_413_431, u_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_431, v_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_431, r_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_431, s_413_431 <=s (const 64 ((2**20))),
    u_413_431 + v_413_431 <=s (const 64 (2**20)),
    u_413_431 - v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 + v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 - v_413_431 <=s (const 64 (2**20)),
    r_413_431 + s_413_431 <=s (const 64 (2**20)),
    r_413_431 - s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 + s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 - s_413_431 <=s (const 64 (2**20)),
    u_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_413_431 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step431

// premise a
assume
neg_g_413_low60_0_low20_18 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_18 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_19 neg_f_413_low60_0_low20_18;
mov u_413_432 u_413_431;
mov v_413_432 v_413_431;

asr neg_g_413_low60_0_low20_19 neg_g_413_low60_0_low20_18 1;
asr r_413_432 r_413_431 1;
asr s_413_432 s_413_431 1;
assert
    true
&&
    neg_f_413_low60_0_low20_19 = neg_f_413_low60_0_low20_18,
    u_413_432 = u_413_431,
    v_413_432 = v_413_431,
    neg_g_413_low60_0_low20_19 * (const 64 2) = neg_g_413_low60_0_low20_18,
    r_413_432 * (const 64 2) = r_413_431,
    s_413_432 * (const 64 2) = s_413_431
;

assume
    neg_f_413_low60_0_low20_19 = neg_f_413_low60_0_low20_18,
    u_413_432 = u_413_431,
    v_413_432 = v_413_431,
    neg_g_413_low60_0_low20_19 * 2 = neg_g_413_low60_0_low20_18,
    r_413_432 * 2 = r_413_431,
    s_413_432 * 2 = s_413_431
&&
    true
;

{
    u_413_432 * neg_f_413_low60_0_low20_0 + v_413_432 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_432 * neg_f_413_low60_0_low20_0 + s_413_432 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_19 + u_413_432 * (const 64 (2**21)) + v_413_432 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_19 + r_413_432 * (const 64 (2**21)) + s_413_432 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_19,
    neg_f_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_19,
    neg_g_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 432)) <=s delta, delta <=s (const 64 (1 + 2*432)),
    (const 64 (-(2**20))) <=s u_413_432, u_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_432, v_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_432, r_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_432, s_413_432 <=s (const 64 ((2**20))),
    u_413_432 + v_413_432 <=s (const 64 (2**20)),
    u_413_432 - v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 + v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 - v_413_432 <=s (const 64 (2**20)),
    r_413_432 + s_413_432 <=s (const 64 (2**20)),
    r_413_432 - s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 + s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 - s_413_432 <=s (const 64 (2**20)),
    u_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_413_432 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_431_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_18,
sint64 neg_g_413_low60_0_low20_18,
sint64 neg_f_413_low60_0_low20_19,
sint64 neg_g_413_low60_0_low20_19,
sint64 u_413_431,
sint64 v_413_431,
sint64 r_413_431,
sint64 s_413_431,
sint64 u_413_432,
sint64 v_413_432,
sint64 r_413_432,
sint64 s_413_432,
bit ne
)={
    u_413_431 * neg_f_413_low60_0_low20_0 + v_413_431 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_18 * (-(2**20)),
    r_413_431 * neg_f_413_low60_0_low20_0 + s_413_431 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_18 * (-(2**20))
&&
    u_413_431 * neg_f_413_low60_0_low20_0 + v_413_431 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_18 * (const 64 (-(2**20))),
    r_413_431 * neg_f_413_low60_0_low20_0 + s_413_431 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_18 + u_413_431 * (const 64 (2**21)) + v_413_431 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_18 + r_413_431 * (const 64 (2**21)) + s_413_431 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_18,
    neg_f_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_18,
    neg_g_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 431)) <=s delta, delta <=s (const 64 (1 + 2*431)),
    (const 64 (-(2**20))) <=s u_413_431, u_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_431, v_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_431, r_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_431, s_413_431 <=s (const 64 ((2**20))),
    u_413_431 + v_413_431 <=s (const 64 (2**20)),
    u_413_431 - v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 + v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 - v_413_431 <=s (const 64 (2**20)),
    r_413_431 + s_413_431 <=s (const 64 (2**20)),
    r_413_431 - s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 + s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 - s_413_431 <=s (const 64 (2**20)),
    u_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_413_431 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step431

// premise b
assume
neg_g_413_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_19 neg_f_413_low60_0_low20_18;
mov u_413_432 u_413_431;
mov v_413_432 v_413_431;

add neg_g_413_low60_0_low20_19 neg_g_413_low60_0_low20_18 neg_f_413_low60_0_low20_18;
asr neg_g_413_low60_0_low20_19 neg_g_413_low60_0_low20_19 1;
add r_413_432 r_413_431 u_413_431;
asr r_413_432 r_413_432 1;
add s_413_432 s_413_431 v_413_431;
asr s_413_432 s_413_432 1;
assert
    true
&&
    neg_f_413_low60_0_low20_19 = neg_f_413_low60_0_low20_18,
    u_413_432 = u_413_431,
    v_413_432 = v_413_431,
    neg_g_413_low60_0_low20_19 * (const 64 2) = neg_g_413_low60_0_low20_18 + neg_f_413_low60_0_low20_18,
    r_413_432 * (const 64 2) = r_413_431 + u_413_431,
    s_413_432 * (const 64 2) = s_413_431 + v_413_431
;

assume
    neg_f_413_low60_0_low20_19 = neg_f_413_low60_0_low20_18,
    u_413_432 = u_413_431,
    v_413_432 = v_413_431,
    neg_g_413_low60_0_low20_19 * 2 = neg_g_413_low60_0_low20_18 + neg_f_413_low60_0_low20_18,
    r_413_432 * 2 = r_413_431 + u_413_431,
    s_413_432 * 2 = s_413_431 + v_413_431
&&
    true
;

{
    u_413_432 * neg_f_413_low60_0_low20_0 + v_413_432 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_432 * neg_f_413_low60_0_low20_0 + s_413_432 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_19 + u_413_432 * (const 64 (2**21)) + v_413_432 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_19 + r_413_432 * (const 64 (2**21)) + s_413_432 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_19,
    neg_f_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_19,
    neg_g_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 432)) <=s delta, delta <=s (const 64 (1 + 2*432)),
    (const 64 (-(2**20))) <=s u_413_432, u_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_432, v_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_432, r_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_432, s_413_432 <=s (const 64 ((2**20))),
    u_413_432 + v_413_432 <=s (const 64 (2**20)),
    u_413_432 - v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 + v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 - v_413_432 <=s (const 64 (2**20)),
    r_413_432 + s_413_432 <=s (const 64 (2**20)),
    r_413_432 - s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 + s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 - s_413_432 <=s (const 64 (2**20)),
    u_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_413_432 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_431_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_18,
sint64 neg_g_413_low60_0_low20_18,
sint64 neg_f_413_low60_0_low20_19,
sint64 neg_g_413_low60_0_low20_19,
sint64 u_413_431,
sint64 v_413_431,
sint64 r_413_431,
sint64 s_413_431,
sint64 u_413_432,
sint64 v_413_432,
sint64 r_413_432,
sint64 s_413_432,
bit ne
)={
    u_413_431 * neg_f_413_low60_0_low20_0 + v_413_431 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_18 * (-(2**20)),
    r_413_431 * neg_f_413_low60_0_low20_0 + s_413_431 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_18 * (-(2**20))
&&
    u_413_431 * neg_f_413_low60_0_low20_0 + v_413_431 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_18 * (const 64 (-(2**20))),
    r_413_431 * neg_f_413_low60_0_low20_0 + s_413_431 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_18 + u_413_431 * (const 64 (2**21)) + v_413_431 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_18 + r_413_431 * (const 64 (2**21)) + s_413_431 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_18,
    neg_f_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_18,
    neg_g_413_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 431)) <=s delta, delta <=s (const 64 (1 + 2*431)),
    (const 64 (-(2**20))) <=s u_413_431, u_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_431, v_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_431, r_413_431 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_431, s_413_431 <=s (const 64 ((2**20))),
    u_413_431 + v_413_431 <=s (const 64 (2**20)),
    u_413_431 - v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 + v_413_431 <=s (const 64 (2**20)),
    (const 64 0) - u_413_431 - v_413_431 <=s (const 64 (2**20)),
    r_413_431 + s_413_431 <=s (const 64 (2**20)),
    r_413_431 - s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 + s_413_431 <=s (const 64 (2**20)),
    (const 64 0) - r_413_431 - s_413_431 <=s (const 64 (2**20)),
    u_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_413_431 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_413_431 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step431

// premise c
assume
neg_g_413_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_19 neg_g_413_low60_0_low20_18;
mov u_413_432 r_413_431;
mov v_413_432 s_413_431;

subs dc neg_g_413_low60_0_low20_19 neg_g_413_low60_0_low20_18 neg_f_413_low60_0_low20_18;
asr neg_g_413_low60_0_low20_19 neg_g_413_low60_0_low20_19 1;
subs dc r_413_432 r_413_431 u_413_431;
asr r_413_432 r_413_432 1;
subs dc s_413_432 s_413_431 v_413_431;
asr s_413_432 s_413_432 1;
assert
    true
&&
    neg_f_413_low60_0_low20_19 = neg_g_413_low60_0_low20_18,
    u_413_432 = r_413_431,
    v_413_432 = s_413_431,
    neg_g_413_low60_0_low20_19 * (const 64 2) = neg_g_413_low60_0_low20_18 - neg_f_413_low60_0_low20_18,
    r_413_432 * (const 64 2) = r_413_431 - u_413_431,
    s_413_432 * (const 64 2) = s_413_431 - v_413_431
;

assume
    neg_f_413_low60_0_low20_19 = neg_g_413_low60_0_low20_18,
    u_413_432 = r_413_431,
    v_413_432 = s_413_431,
    neg_g_413_low60_0_low20_19 * 2 = neg_g_413_low60_0_low20_18 - neg_f_413_low60_0_low20_18,
    r_413_432 * 2 = r_413_431 - u_413_431,
    s_413_432 * 2 = s_413_431 - v_413_431
&&
    true
;

{
    u_413_432 * neg_f_413_low60_0_low20_0 + v_413_432 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_432 * neg_f_413_low60_0_low20_0 + s_413_432 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_19 + u_413_432 * (const 64 (2**21)) + v_413_432 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_19 + r_413_432 * (const 64 (2**21)) + s_413_432 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_19,
    neg_f_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_19,
    neg_g_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 432)) <=s delta, delta <=s (const 64 (1 + 2*432)),
    (const 64 (-(2**20))) <=s u_413_432, u_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_432, v_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_432, r_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_432, s_413_432 <=s (const 64 ((2**20))),
    u_413_432 + v_413_432 <=s (const 64 (2**20)),
    u_413_432 - v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 + v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 - v_413_432 <=s (const 64 (2**20)),
    r_413_432 + s_413_432 <=s (const 64 (2**20)),
    r_413_432 - s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 + s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 - s_413_432 <=s (const 64 (2**20)),
    u_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_413_432 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_432_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_19,
sint64 neg_g_413_low60_0_low20_19,
sint64 neg_f_413_low60_0_low20_20,
sint64 neg_g_413_low60_0_low20_20,
sint64 u_413_432,
sint64 v_413_432,
sint64 r_413_432,
sint64 s_413_432,
sint64 u_413_433,
sint64 v_413_433,
sint64 r_413_433,
sint64 s_413_433,
bit ne
)={
    u_413_432 * neg_f_413_low60_0_low20_0 + v_413_432 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_19 * (-(2**20)),
    r_413_432 * neg_f_413_low60_0_low20_0 + s_413_432 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_19 * (-(2**20))
&&
    u_413_432 * neg_f_413_low60_0_low20_0 + v_413_432 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_19 * (const 64 (-(2**20))),
    r_413_432 * neg_f_413_low60_0_low20_0 + s_413_432 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_19 + u_413_432 * (const 64 (2**21)) + v_413_432 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_19 + r_413_432 * (const 64 (2**21)) + s_413_432 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_19,
    neg_f_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_19,
    neg_g_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 432)) <=s delta, delta <=s (const 64 (1 + 2*432)),
    (const 64 (-(2**20))) <=s u_413_432, u_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_432, v_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_432, r_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_432, s_413_432 <=s (const 64 ((2**20))),
    u_413_432 + v_413_432 <=s (const 64 (2**20)),
    u_413_432 - v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 + v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 - v_413_432 <=s (const 64 (2**20)),
    r_413_432 + s_413_432 <=s (const 64 (2**20)),
    r_413_432 - s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 + s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 - s_413_432 <=s (const 64 (2**20)),
    u_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_413_432 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step432

// premise a
assume
neg_g_413_low60_0_low20_19 = 0 (mod 2)
&&
neg_g_413_low60_0_low20_19 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_0_low20_20 neg_f_413_low60_0_low20_19;
mov u_413_433 u_413_432;
mov v_413_433 v_413_432;

asr neg_g_413_low60_0_low20_20 neg_g_413_low60_0_low20_19 1;
asr r_413_433 r_413_432 1;
asr s_413_433 s_413_432 1;
assert
    true
&&
    neg_f_413_low60_0_low20_20 = neg_f_413_low60_0_low20_19,
    u_413_433 = u_413_432,
    v_413_433 = v_413_432,
    neg_g_413_low60_0_low20_20 * (const 64 2) = neg_g_413_low60_0_low20_19,
    r_413_433 * (const 64 2) = r_413_432,
    s_413_433 * (const 64 2) = s_413_432
;

assume
    neg_f_413_low60_0_low20_20 = neg_f_413_low60_0_low20_19,
    u_413_433 = u_413_432,
    v_413_433 = v_413_432,
    neg_g_413_low60_0_low20_20 * 2 = neg_g_413_low60_0_low20_19,
    r_413_433 * 2 = r_413_432,
    s_413_433 * 2 = s_413_432
&&
    true
;

{
    u_413_433 * neg_f_413_low60_0_low20_0 + v_413_433 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_433 * neg_f_413_low60_0_low20_0 + s_413_433 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_20 + u_413_433 * (const 64 (2**21)) + v_413_433 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_20 + r_413_433 * (const 64 (2**21)) + s_413_433 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_20,
    neg_f_413_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_20,
    neg_g_413_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 433)) <=s delta, delta <=s (const 64 (1 + 2*433)),
    (const 64 (-(2**20))) <=s u_413_433, u_413_433 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_433, v_413_433 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_433, r_413_433 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_433, s_413_433 <=s (const 64 ((2**20))),
    u_413_433 + v_413_433 <=s (const 64 (2**20)),
    u_413_433 - v_413_433 <=s (const 64 (2**20)),
    (const 64 0) - u_413_433 + v_413_433 <=s (const 64 (2**20)),
    (const 64 0) - u_413_433 - v_413_433 <=s (const 64 (2**20)),
    r_413_433 + s_413_433 <=s (const 64 (2**20)),
    r_413_433 - s_413_433 <=s (const 64 (2**20)),
    (const 64 0) - r_413_433 + s_413_433 <=s (const 64 (2**20)),
    (const 64 0) - r_413_433 - s_413_433 <=s (const 64 (2**20)),
    u_413_433 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_413_433 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_413_433 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_413_433 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_432_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_19,
sint64 neg_g_413_low60_0_low20_19,
sint64 neg_f_413_low60_0_low20_20,
sint64 neg_g_413_low60_0_low20_20,
sint64 u_413_432,
sint64 v_413_432,
sint64 r_413_432,
sint64 s_413_432,
sint64 u_413_433,
sint64 v_413_433,
sint64 r_413_433,
sint64 s_413_433,
bit ne
)={
    u_413_432 * neg_f_413_low60_0_low20_0 + v_413_432 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_19 * (-(2**20)),
    r_413_432 * neg_f_413_low60_0_low20_0 + s_413_432 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_19 * (-(2**20))
&&
    u_413_432 * neg_f_413_low60_0_low20_0 + v_413_432 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_19 * (const 64 (-(2**20))),
    r_413_432 * neg_f_413_low60_0_low20_0 + s_413_432 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_19 + u_413_432 * (const 64 (2**21)) + v_413_432 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_19 + r_413_432 * (const 64 (2**21)) + s_413_432 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_19,
    neg_f_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_19,
    neg_g_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 432)) <=s delta, delta <=s (const 64 (1 + 2*432)),
    (const 64 (-(2**20))) <=s u_413_432, u_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_432, v_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_432, r_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_432, s_413_432 <=s (const 64 ((2**20))),
    u_413_432 + v_413_432 <=s (const 64 (2**20)),
    u_413_432 - v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 + v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 - v_413_432 <=s (const 64 (2**20)),
    r_413_432 + s_413_432 <=s (const 64 (2**20)),
    r_413_432 - s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 + s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 - s_413_432 <=s (const 64 (2**20)),
    u_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_413_432 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step432

// premise b
assume
neg_g_413_low60_0_low20_19 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_20 neg_f_413_low60_0_low20_19;
mov u_413_433 u_413_432;
mov v_413_433 v_413_432;

add neg_g_413_low60_0_low20_20 neg_g_413_low60_0_low20_19 neg_f_413_low60_0_low20_19;
asr neg_g_413_low60_0_low20_20 neg_g_413_low60_0_low20_20 1;
add r_413_433 r_413_432 u_413_432;
asr r_413_433 r_413_433 1;
add s_413_433 s_413_432 v_413_432;
asr s_413_433 s_413_433 1;
assert
    true
&&
    neg_f_413_low60_0_low20_20 = neg_f_413_low60_0_low20_19,
    u_413_433 = u_413_432,
    v_413_433 = v_413_432,
    neg_g_413_low60_0_low20_20 * (const 64 2) = neg_g_413_low60_0_low20_19 + neg_f_413_low60_0_low20_19,
    r_413_433 * (const 64 2) = r_413_432 + u_413_432,
    s_413_433 * (const 64 2) = s_413_432 + v_413_432
;

assume
    neg_f_413_low60_0_low20_20 = neg_f_413_low60_0_low20_19,
    u_413_433 = u_413_432,
    v_413_433 = v_413_432,
    neg_g_413_low60_0_low20_20 * 2 = neg_g_413_low60_0_low20_19 + neg_f_413_low60_0_low20_19,
    r_413_433 * 2 = r_413_432 + u_413_432,
    s_413_433 * 2 = s_413_432 + v_413_432
&&
    true
;

{
    u_413_433 * neg_f_413_low60_0_low20_0 + v_413_433 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_433 * neg_f_413_low60_0_low20_0 + s_413_433 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_20 + u_413_433 * (const 64 (2**21)) + v_413_433 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_20 + r_413_433 * (const 64 (2**21)) + s_413_433 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_20,
    neg_f_413_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_20,
    neg_g_413_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 433)) <=s delta, delta <=s (const 64 (1 + 2*433)),
    (const 64 (-(2**20))) <=s u_413_433, u_413_433 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_433, v_413_433 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_433, r_413_433 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_433, s_413_433 <=s (const 64 ((2**20))),
    u_413_433 + v_413_433 <=s (const 64 (2**20)),
    u_413_433 - v_413_433 <=s (const 64 (2**20)),
    (const 64 0) - u_413_433 + v_413_433 <=s (const 64 (2**20)),
    (const 64 0) - u_413_433 - v_413_433 <=s (const 64 (2**20)),
    r_413_433 + s_413_433 <=s (const 64 (2**20)),
    r_413_433 - s_413_433 <=s (const 64 (2**20)),
    (const 64 0) - r_413_433 + s_413_433 <=s (const 64 (2**20)),
    (const 64 0) - r_413_433 - s_413_433 <=s (const 64 (2**20)),
    u_413_433 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_413_433 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_413_433 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_413_433 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_432_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_19,
sint64 neg_g_413_low60_0_low20_19,
sint64 neg_f_413_low60_0_low20_20,
sint64 neg_g_413_low60_0_low20_20,
sint64 u_413_432,
sint64 v_413_432,
sint64 r_413_432,
sint64 s_413_432,
sint64 u_413_433,
sint64 v_413_433,
sint64 r_413_433,
sint64 s_413_433,
bit ne
)={
    u_413_432 * neg_f_413_low60_0_low20_0 + v_413_432 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_19 * (-(2**20)),
    r_413_432 * neg_f_413_low60_0_low20_0 + s_413_432 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_19 * (-(2**20))
&&
    u_413_432 * neg_f_413_low60_0_low20_0 + v_413_432 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_19 * (const 64 (-(2**20))),
    r_413_432 * neg_f_413_low60_0_low20_0 + s_413_432 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_19 + u_413_432 * (const 64 (2**21)) + v_413_432 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_19 + r_413_432 * (const 64 (2**21)) + s_413_432 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_19,
    neg_f_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_19,
    neg_g_413_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 432)) <=s delta, delta <=s (const 64 (1 + 2*432)),
    (const 64 (-(2**20))) <=s u_413_432, u_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_432, v_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_432, r_413_432 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_432, s_413_432 <=s (const 64 ((2**20))),
    u_413_432 + v_413_432 <=s (const 64 (2**20)),
    u_413_432 - v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 + v_413_432 <=s (const 64 (2**20)),
    (const 64 0) - u_413_432 - v_413_432 <=s (const 64 (2**20)),
    r_413_432 + s_413_432 <=s (const 64 (2**20)),
    r_413_432 - s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 + s_413_432 <=s (const 64 (2**20)),
    (const 64 0) - r_413_432 - s_413_432 <=s (const 64 (2**20)),
    u_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_413_432 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_413_432 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step432

// premise c
assume
neg_g_413_low60_0_low20_19 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_20 neg_g_413_low60_0_low20_19;
mov u_413_433 r_413_432;
mov v_413_433 s_413_432;

subs dc neg_g_413_low60_0_low20_20 neg_g_413_low60_0_low20_19 neg_f_413_low60_0_low20_19;
asr neg_g_413_low60_0_low20_20 neg_g_413_low60_0_low20_20 1;
subs dc r_413_433 r_413_432 u_413_432;
asr r_413_433 r_413_433 1;
subs dc s_413_433 s_413_432 v_413_432;
asr s_413_433 s_413_433 1;
assert
    true
&&
    neg_f_413_low60_0_low20_20 = neg_g_413_low60_0_low20_19,
    u_413_433 = r_413_432,
    v_413_433 = s_413_432,
    neg_g_413_low60_0_low20_20 * (const 64 2) = neg_g_413_low60_0_low20_19 - neg_f_413_low60_0_low20_19,
    r_413_433 * (const 64 2) = r_413_432 - u_413_432,
    s_413_433 * (const 64 2) = s_413_432 - v_413_432
;

assume
    neg_f_413_low60_0_low20_20 = neg_g_413_low60_0_low20_19,
    u_413_433 = r_413_432,
    v_413_433 = s_413_432,
    neg_g_413_low60_0_low20_20 * 2 = neg_g_413_low60_0_low20_19 - neg_f_413_low60_0_low20_19,
    r_413_433 * 2 = r_413_432 - u_413_432,
    s_413_433 * 2 = s_413_432 - v_413_432
&&
    true
;

{
    u_413_433 * neg_f_413_low60_0_low20_0 + v_413_433 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_433 * neg_f_413_low60_0_low20_0 + s_413_433 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_20 + u_413_433 * (const 64 (2**21)) + v_413_433 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_20 + r_413_433 * (const 64 (2**21)) + s_413_433 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_20,
    neg_f_413_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_20,
    neg_g_413_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 433)) <=s delta, delta <=s (const 64 (1 + 2*433)),
    (const 64 (-(2**20))) <=s u_413_433, u_413_433 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_433, v_413_433 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_433, r_413_433 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_433, s_413_433 <=s (const 64 ((2**20))),
    u_413_433 + v_413_433 <=s (const 64 (2**20)),
    u_413_433 - v_413_433 <=s (const 64 (2**20)),
    (const 64 0) - u_413_433 + v_413_433 <=s (const 64 (2**20)),
    (const 64 0) - u_413_433 - v_413_433 <=s (const 64 (2**20)),
    r_413_433 + s_413_433 <=s (const 64 (2**20)),
    r_413_433 - s_413_433 <=s (const 64 (2**20)),
    (const 64 0) - r_413_433 + s_413_433 <=s (const 64 (2**20)),
    (const 64 0) - r_413_433 - s_413_433 <=s (const 64 (2**20)),
    u_413_433 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_413_433 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_413_433 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_413_433 = (const 64 0) (mod (const 64 (2**(20-20))))
}

