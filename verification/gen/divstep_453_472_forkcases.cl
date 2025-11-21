proc divstep_453_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_1,
sint64 neg_g_413_low60_40_low20_1,
sint64 u_453_453,
sint64 v_453_453,
sint64 r_453_453,
sint64 s_453_453,
sint64 u_453_454,
sint64 v_453_454,
sint64 r_453_454,
sint64 s_453_454,
bit ne
)={
    u_453_453 * neg_f_413_low60_40_low20_0 + v_453_453 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_0 * (-(2**20)),
    r_453_453 * neg_f_413_low60_40_low20_0 + s_453_453 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_0 * (-(2**20))
&&
    u_453_453 * neg_f_413_low60_40_low20_0 + v_453_453 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_0 * (const 64 (-(2**20))),
    r_453_453 * neg_f_413_low60_40_low20_0 + s_453_453 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_0 + u_453_453 * (const 64 (2**21)) + v_453_453 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_0 + r_453_453 * (const 64 (2**21)) + s_453_453 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 453)) <=s delta, delta <=s (const 64 (1 + 2*453)),
    u_453_453 = (const 64 (-(2**20))),
    v_453_453 = (const 64 (0)),
    r_453_453 = (const 64 (0)),
    s_453_453 = (const 64 (-(2**20)))
}



// divsteps
// step453

// premise a
assume
neg_g_413_low60_40_low20_0 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_1 neg_f_413_low60_40_low20_0;
mov u_453_454 u_453_453;
mov v_453_454 v_453_453;

asr neg_g_413_low60_40_low20_1 neg_g_413_low60_40_low20_0 1;
asr r_453_454 r_453_453 1;
asr s_453_454 s_453_453 1;
assert
    true
&&
    neg_f_413_low60_40_low20_1 = neg_f_413_low60_40_low20_0,
    u_453_454 = u_453_453,
    v_453_454 = v_453_453,
    neg_g_413_low60_40_low20_1 * (const 64 2) = neg_g_413_low60_40_low20_0,
    r_453_454 * (const 64 2) = r_453_453,
    s_453_454 * (const 64 2) = s_453_453
;

assume
    neg_f_413_low60_40_low20_1 = neg_f_413_low60_40_low20_0,
    u_453_454 = u_453_453,
    v_453_454 = v_453_453,
    neg_g_413_low60_40_low20_1 * 2 = neg_g_413_low60_40_low20_0,
    r_453_454 * 2 = r_453_453,
    s_453_454 * 2 = s_453_453
&&
    true
;

{
    u_453_454 * neg_f_413_low60_40_low20_0 + v_453_454 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_454 * neg_f_413_low60_40_low20_0 + s_453_454 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_1 + u_453_454 * (const 64 (2**21)) + v_453_454 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_1 + r_453_454 * (const 64 (2**21)) + s_453_454 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_1,
    neg_f_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_1,
    neg_g_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 454)) <=s delta, delta <=s (const 64 (1 + 2*454)),
    (const 64 (-(2**20))) <=s u_453_454, u_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_454, v_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_454, r_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_454, s_453_454 <=s (const 64 ((2**20))),
    u_453_454 + v_453_454 <=s (const 64 (2**20)),
    u_453_454 - v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 + v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 - v_453_454 <=s (const 64 (2**20)),
    r_453_454 + s_453_454 <=s (const 64 (2**20)),
    r_453_454 - s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 + s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 - s_453_454 <=s (const 64 (2**20)),
    u_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_453_454 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_453_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_1,
sint64 neg_g_413_low60_40_low20_1,
sint64 u_453_453,
sint64 v_453_453,
sint64 r_453_453,
sint64 s_453_453,
sint64 u_453_454,
sint64 v_453_454,
sint64 r_453_454,
sint64 s_453_454,
bit ne
)={
    u_453_453 * neg_f_413_low60_40_low20_0 + v_453_453 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_0 * (-(2**20)),
    r_453_453 * neg_f_413_low60_40_low20_0 + s_453_453 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_0 * (-(2**20))
&&
    u_453_453 * neg_f_413_low60_40_low20_0 + v_453_453 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_0 * (const 64 (-(2**20))),
    r_453_453 * neg_f_413_low60_40_low20_0 + s_453_453 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_0 + u_453_453 * (const 64 (2**21)) + v_453_453 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_0 + r_453_453 * (const 64 (2**21)) + s_453_453 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 453)) <=s delta, delta <=s (const 64 (1 + 2*453)),
    u_453_453 = (const 64 (-(2**20))),
    v_453_453 = (const 64 (0)),
    r_453_453 = (const 64 (0)),
    s_453_453 = (const 64 (-(2**20)))
}



// divsteps
// step453

// premise b
assume
neg_g_413_low60_40_low20_0 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_1 neg_f_413_low60_40_low20_0;
mov u_453_454 u_453_453;
mov v_453_454 v_453_453;

add neg_g_413_low60_40_low20_1 neg_g_413_low60_40_low20_0 neg_f_413_low60_40_low20_0;
asr neg_g_413_low60_40_low20_1 neg_g_413_low60_40_low20_1 1;
add r_453_454 r_453_453 u_453_453;
asr r_453_454 r_453_454 1;
add s_453_454 s_453_453 v_453_453;
asr s_453_454 s_453_454 1;
assert
    true
&&
    neg_f_413_low60_40_low20_1 = neg_f_413_low60_40_low20_0,
    u_453_454 = u_453_453,
    v_453_454 = v_453_453,
    neg_g_413_low60_40_low20_1 * (const 64 2) = neg_g_413_low60_40_low20_0 + neg_f_413_low60_40_low20_0,
    r_453_454 * (const 64 2) = r_453_453 + u_453_453,
    s_453_454 * (const 64 2) = s_453_453 + v_453_453
;

assume
    neg_f_413_low60_40_low20_1 = neg_f_413_low60_40_low20_0,
    u_453_454 = u_453_453,
    v_453_454 = v_453_453,
    neg_g_413_low60_40_low20_1 * 2 = neg_g_413_low60_40_low20_0 + neg_f_413_low60_40_low20_0,
    r_453_454 * 2 = r_453_453 + u_453_453,
    s_453_454 * 2 = s_453_453 + v_453_453
&&
    true
;

{
    u_453_454 * neg_f_413_low60_40_low20_0 + v_453_454 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_454 * neg_f_413_low60_40_low20_0 + s_453_454 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_1 + u_453_454 * (const 64 (2**21)) + v_453_454 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_1 + r_453_454 * (const 64 (2**21)) + s_453_454 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_1,
    neg_f_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_1,
    neg_g_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 454)) <=s delta, delta <=s (const 64 (1 + 2*454)),
    (const 64 (-(2**20))) <=s u_453_454, u_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_454, v_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_454, r_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_454, s_453_454 <=s (const 64 ((2**20))),
    u_453_454 + v_453_454 <=s (const 64 (2**20)),
    u_453_454 - v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 + v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 - v_453_454 <=s (const 64 (2**20)),
    r_453_454 + s_453_454 <=s (const 64 (2**20)),
    r_453_454 - s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 + s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 - s_453_454 <=s (const 64 (2**20)),
    u_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_453_454 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_453_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_1,
sint64 neg_g_413_low60_40_low20_1,
sint64 u_453_453,
sint64 v_453_453,
sint64 r_453_453,
sint64 s_453_453,
sint64 u_453_454,
sint64 v_453_454,
sint64 r_453_454,
sint64 s_453_454,
bit ne
)={
    u_453_453 * neg_f_413_low60_40_low20_0 + v_453_453 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_0 * (-(2**20)),
    r_453_453 * neg_f_413_low60_40_low20_0 + s_453_453 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_0 * (-(2**20))
&&
    u_453_453 * neg_f_413_low60_40_low20_0 + v_453_453 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_0 * (const 64 (-(2**20))),
    r_453_453 * neg_f_413_low60_40_low20_0 + s_453_453 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_0 + u_453_453 * (const 64 (2**21)) + v_453_453 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_0 + r_453_453 * (const 64 (2**21)) + s_453_453 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 453)) <=s delta, delta <=s (const 64 (1 + 2*453)),
    u_453_453 = (const 64 (-(2**20))),
    v_453_453 = (const 64 (0)),
    r_453_453 = (const 64 (0)),
    s_453_453 = (const 64 (-(2**20)))
}



// divsteps
// step453

// premise c
assume
neg_g_413_low60_40_low20_0 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_1 neg_g_413_low60_40_low20_0;
mov u_453_454 r_453_453;
mov v_453_454 s_453_453;

subs dc neg_g_413_low60_40_low20_1 neg_g_413_low60_40_low20_0 neg_f_413_low60_40_low20_0;
asr neg_g_413_low60_40_low20_1 neg_g_413_low60_40_low20_1 1;
subs dc r_453_454 r_453_453 u_453_453;
asr r_453_454 r_453_454 1;
subs dc s_453_454 s_453_453 v_453_453;
asr s_453_454 s_453_454 1;
assert
    true
&&
    neg_f_413_low60_40_low20_1 = neg_g_413_low60_40_low20_0,
    u_453_454 = r_453_453,
    v_453_454 = s_453_453,
    neg_g_413_low60_40_low20_1 * (const 64 2) = neg_g_413_low60_40_low20_0 - neg_f_413_low60_40_low20_0,
    r_453_454 * (const 64 2) = r_453_453 - u_453_453,
    s_453_454 * (const 64 2) = s_453_453 - v_453_453
;

assume
    neg_f_413_low60_40_low20_1 = neg_g_413_low60_40_low20_0,
    u_453_454 = r_453_453,
    v_453_454 = s_453_453,
    neg_g_413_low60_40_low20_1 * 2 = neg_g_413_low60_40_low20_0 - neg_f_413_low60_40_low20_0,
    r_453_454 * 2 = r_453_453 - u_453_453,
    s_453_454 * 2 = s_453_453 - v_453_453
&&
    true
;

{
    u_453_454 * neg_f_413_low60_40_low20_0 + v_453_454 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_454 * neg_f_413_low60_40_low20_0 + s_453_454 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_1 + u_453_454 * (const 64 (2**21)) + v_453_454 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_1 + r_453_454 * (const 64 (2**21)) + s_453_454 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_1,
    neg_f_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_1,
    neg_g_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 454)) <=s delta, delta <=s (const 64 (1 + 2*454)),
    (const 64 (-(2**20))) <=s u_453_454, u_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_454, v_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_454, r_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_454, s_453_454 <=s (const 64 ((2**20))),
    u_453_454 + v_453_454 <=s (const 64 (2**20)),
    u_453_454 - v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 + v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 - v_453_454 <=s (const 64 (2**20)),
    r_453_454 + s_453_454 <=s (const 64 (2**20)),
    r_453_454 - s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 + s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 - s_453_454 <=s (const 64 (2**20)),
    u_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_453_454 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_454_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_1,
sint64 neg_g_413_low60_40_low20_1,
sint64 neg_f_413_low60_40_low20_2,
sint64 neg_g_413_low60_40_low20_2,
sint64 u_453_454,
sint64 v_453_454,
sint64 r_453_454,
sint64 s_453_454,
sint64 u_453_455,
sint64 v_453_455,
sint64 r_453_455,
sint64 s_453_455,
bit ne
)={
    u_453_454 * neg_f_413_low60_40_low20_0 + v_453_454 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_1 * (-(2**20)),
    r_453_454 * neg_f_413_low60_40_low20_0 + s_453_454 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_1 * (-(2**20))
&&
    u_453_454 * neg_f_413_low60_40_low20_0 + v_453_454 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_1 * (const 64 (-(2**20))),
    r_453_454 * neg_f_413_low60_40_low20_0 + s_453_454 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_1 + u_453_454 * (const 64 (2**21)) + v_453_454 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_1 + r_453_454 * (const 64 (2**21)) + s_453_454 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_1,
    neg_f_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_1,
    neg_g_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 454)) <=s delta, delta <=s (const 64 (1 + 2*454)),
    (const 64 (-(2**20))) <=s u_453_454, u_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_454, v_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_454, r_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_454, s_453_454 <=s (const 64 ((2**20))),
    u_453_454 + v_453_454 <=s (const 64 (2**20)),
    u_453_454 - v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 + v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 - v_453_454 <=s (const 64 (2**20)),
    r_453_454 + s_453_454 <=s (const 64 (2**20)),
    r_453_454 - s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 + s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 - s_453_454 <=s (const 64 (2**20)),
    u_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_453_454 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step454

// premise a
assume
neg_g_413_low60_40_low20_1 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_1 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_2 neg_f_413_low60_40_low20_1;
mov u_453_455 u_453_454;
mov v_453_455 v_453_454;

asr neg_g_413_low60_40_low20_2 neg_g_413_low60_40_low20_1 1;
asr r_453_455 r_453_454 1;
asr s_453_455 s_453_454 1;
assert
    true
&&
    neg_f_413_low60_40_low20_2 = neg_f_413_low60_40_low20_1,
    u_453_455 = u_453_454,
    v_453_455 = v_453_454,
    neg_g_413_low60_40_low20_2 * (const 64 2) = neg_g_413_low60_40_low20_1,
    r_453_455 * (const 64 2) = r_453_454,
    s_453_455 * (const 64 2) = s_453_454
;

assume
    neg_f_413_low60_40_low20_2 = neg_f_413_low60_40_low20_1,
    u_453_455 = u_453_454,
    v_453_455 = v_453_454,
    neg_g_413_low60_40_low20_2 * 2 = neg_g_413_low60_40_low20_1,
    r_453_455 * 2 = r_453_454,
    s_453_455 * 2 = s_453_454
&&
    true
;

{
    u_453_455 * neg_f_413_low60_40_low20_0 + v_453_455 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_455 * neg_f_413_low60_40_low20_0 + s_453_455 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_2 + u_453_455 * (const 64 (2**21)) + v_453_455 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_2 + r_453_455 * (const 64 (2**21)) + s_453_455 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_2,
    neg_f_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_2,
    neg_g_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 455)) <=s delta, delta <=s (const 64 (1 + 2*455)),
    (const 64 (-(2**20))) <=s u_453_455, u_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_455, v_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_455, r_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_455, s_453_455 <=s (const 64 ((2**20))),
    u_453_455 + v_453_455 <=s (const 64 (2**20)),
    u_453_455 - v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 + v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 - v_453_455 <=s (const 64 (2**20)),
    r_453_455 + s_453_455 <=s (const 64 (2**20)),
    r_453_455 - s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 + s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 - s_453_455 <=s (const 64 (2**20)),
    u_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_453_455 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_454_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_1,
sint64 neg_g_413_low60_40_low20_1,
sint64 neg_f_413_low60_40_low20_2,
sint64 neg_g_413_low60_40_low20_2,
sint64 u_453_454,
sint64 v_453_454,
sint64 r_453_454,
sint64 s_453_454,
sint64 u_453_455,
sint64 v_453_455,
sint64 r_453_455,
sint64 s_453_455,
bit ne
)={
    u_453_454 * neg_f_413_low60_40_low20_0 + v_453_454 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_1 * (-(2**20)),
    r_453_454 * neg_f_413_low60_40_low20_0 + s_453_454 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_1 * (-(2**20))
&&
    u_453_454 * neg_f_413_low60_40_low20_0 + v_453_454 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_1 * (const 64 (-(2**20))),
    r_453_454 * neg_f_413_low60_40_low20_0 + s_453_454 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_1 + u_453_454 * (const 64 (2**21)) + v_453_454 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_1 + r_453_454 * (const 64 (2**21)) + s_453_454 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_1,
    neg_f_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_1,
    neg_g_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 454)) <=s delta, delta <=s (const 64 (1 + 2*454)),
    (const 64 (-(2**20))) <=s u_453_454, u_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_454, v_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_454, r_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_454, s_453_454 <=s (const 64 ((2**20))),
    u_453_454 + v_453_454 <=s (const 64 (2**20)),
    u_453_454 - v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 + v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 - v_453_454 <=s (const 64 (2**20)),
    r_453_454 + s_453_454 <=s (const 64 (2**20)),
    r_453_454 - s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 + s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 - s_453_454 <=s (const 64 (2**20)),
    u_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_453_454 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step454

// premise b
assume
neg_g_413_low60_40_low20_1 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_2 neg_f_413_low60_40_low20_1;
mov u_453_455 u_453_454;
mov v_453_455 v_453_454;

add neg_g_413_low60_40_low20_2 neg_g_413_low60_40_low20_1 neg_f_413_low60_40_low20_1;
asr neg_g_413_low60_40_low20_2 neg_g_413_low60_40_low20_2 1;
add r_453_455 r_453_454 u_453_454;
asr r_453_455 r_453_455 1;
add s_453_455 s_453_454 v_453_454;
asr s_453_455 s_453_455 1;
assert
    true
&&
    neg_f_413_low60_40_low20_2 = neg_f_413_low60_40_low20_1,
    u_453_455 = u_453_454,
    v_453_455 = v_453_454,
    neg_g_413_low60_40_low20_2 * (const 64 2) = neg_g_413_low60_40_low20_1 + neg_f_413_low60_40_low20_1,
    r_453_455 * (const 64 2) = r_453_454 + u_453_454,
    s_453_455 * (const 64 2) = s_453_454 + v_453_454
;

assume
    neg_f_413_low60_40_low20_2 = neg_f_413_low60_40_low20_1,
    u_453_455 = u_453_454,
    v_453_455 = v_453_454,
    neg_g_413_low60_40_low20_2 * 2 = neg_g_413_low60_40_low20_1 + neg_f_413_low60_40_low20_1,
    r_453_455 * 2 = r_453_454 + u_453_454,
    s_453_455 * 2 = s_453_454 + v_453_454
&&
    true
;

{
    u_453_455 * neg_f_413_low60_40_low20_0 + v_453_455 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_455 * neg_f_413_low60_40_low20_0 + s_453_455 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_2 + u_453_455 * (const 64 (2**21)) + v_453_455 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_2 + r_453_455 * (const 64 (2**21)) + s_453_455 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_2,
    neg_f_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_2,
    neg_g_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 455)) <=s delta, delta <=s (const 64 (1 + 2*455)),
    (const 64 (-(2**20))) <=s u_453_455, u_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_455, v_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_455, r_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_455, s_453_455 <=s (const 64 ((2**20))),
    u_453_455 + v_453_455 <=s (const 64 (2**20)),
    u_453_455 - v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 + v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 - v_453_455 <=s (const 64 (2**20)),
    r_453_455 + s_453_455 <=s (const 64 (2**20)),
    r_453_455 - s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 + s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 - s_453_455 <=s (const 64 (2**20)),
    u_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_453_455 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_454_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_1,
sint64 neg_g_413_low60_40_low20_1,
sint64 neg_f_413_low60_40_low20_2,
sint64 neg_g_413_low60_40_low20_2,
sint64 u_453_454,
sint64 v_453_454,
sint64 r_453_454,
sint64 s_453_454,
sint64 u_453_455,
sint64 v_453_455,
sint64 r_453_455,
sint64 s_453_455,
bit ne
)={
    u_453_454 * neg_f_413_low60_40_low20_0 + v_453_454 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_1 * (-(2**20)),
    r_453_454 * neg_f_413_low60_40_low20_0 + s_453_454 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_1 * (-(2**20))
&&
    u_453_454 * neg_f_413_low60_40_low20_0 + v_453_454 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_1 * (const 64 (-(2**20))),
    r_453_454 * neg_f_413_low60_40_low20_0 + s_453_454 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_1 + u_453_454 * (const 64 (2**21)) + v_453_454 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_1 + r_453_454 * (const 64 (2**21)) + s_453_454 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_1,
    neg_f_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_1,
    neg_g_413_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 454)) <=s delta, delta <=s (const 64 (1 + 2*454)),
    (const 64 (-(2**20))) <=s u_453_454, u_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_454, v_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_454, r_453_454 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_454, s_453_454 <=s (const 64 ((2**20))),
    u_453_454 + v_453_454 <=s (const 64 (2**20)),
    u_453_454 - v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 + v_453_454 <=s (const 64 (2**20)),
    (const 64 0) - u_453_454 - v_453_454 <=s (const 64 (2**20)),
    r_453_454 + s_453_454 <=s (const 64 (2**20)),
    r_453_454 - s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 + s_453_454 <=s (const 64 (2**20)),
    (const 64 0) - r_453_454 - s_453_454 <=s (const 64 (2**20)),
    u_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_453_454 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_453_454 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step454

// premise c
assume
neg_g_413_low60_40_low20_1 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_2 neg_g_413_low60_40_low20_1;
mov u_453_455 r_453_454;
mov v_453_455 s_453_454;

subs dc neg_g_413_low60_40_low20_2 neg_g_413_low60_40_low20_1 neg_f_413_low60_40_low20_1;
asr neg_g_413_low60_40_low20_2 neg_g_413_low60_40_low20_2 1;
subs dc r_453_455 r_453_454 u_453_454;
asr r_453_455 r_453_455 1;
subs dc s_453_455 s_453_454 v_453_454;
asr s_453_455 s_453_455 1;
assert
    true
&&
    neg_f_413_low60_40_low20_2 = neg_g_413_low60_40_low20_1,
    u_453_455 = r_453_454,
    v_453_455 = s_453_454,
    neg_g_413_low60_40_low20_2 * (const 64 2) = neg_g_413_low60_40_low20_1 - neg_f_413_low60_40_low20_1,
    r_453_455 * (const 64 2) = r_453_454 - u_453_454,
    s_453_455 * (const 64 2) = s_453_454 - v_453_454
;

assume
    neg_f_413_low60_40_low20_2 = neg_g_413_low60_40_low20_1,
    u_453_455 = r_453_454,
    v_453_455 = s_453_454,
    neg_g_413_low60_40_low20_2 * 2 = neg_g_413_low60_40_low20_1 - neg_f_413_low60_40_low20_1,
    r_453_455 * 2 = r_453_454 - u_453_454,
    s_453_455 * 2 = s_453_454 - v_453_454
&&
    true
;

{
    u_453_455 * neg_f_413_low60_40_low20_0 + v_453_455 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_455 * neg_f_413_low60_40_low20_0 + s_453_455 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_2 + u_453_455 * (const 64 (2**21)) + v_453_455 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_2 + r_453_455 * (const 64 (2**21)) + s_453_455 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_2,
    neg_f_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_2,
    neg_g_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 455)) <=s delta, delta <=s (const 64 (1 + 2*455)),
    (const 64 (-(2**20))) <=s u_453_455, u_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_455, v_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_455, r_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_455, s_453_455 <=s (const 64 ((2**20))),
    u_453_455 + v_453_455 <=s (const 64 (2**20)),
    u_453_455 - v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 + v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 - v_453_455 <=s (const 64 (2**20)),
    r_453_455 + s_453_455 <=s (const 64 (2**20)),
    r_453_455 - s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 + s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 - s_453_455 <=s (const 64 (2**20)),
    u_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_453_455 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_455_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_2,
sint64 neg_g_413_low60_40_low20_2,
sint64 neg_f_413_low60_40_low20_3,
sint64 neg_g_413_low60_40_low20_3,
sint64 u_453_455,
sint64 v_453_455,
sint64 r_453_455,
sint64 s_453_455,
sint64 u_453_456,
sint64 v_453_456,
sint64 r_453_456,
sint64 s_453_456,
bit ne
)={
    u_453_455 * neg_f_413_low60_40_low20_0 + v_453_455 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_2 * (-(2**20)),
    r_453_455 * neg_f_413_low60_40_low20_0 + s_453_455 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_2 * (-(2**20))
&&
    u_453_455 * neg_f_413_low60_40_low20_0 + v_453_455 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_2 * (const 64 (-(2**20))),
    r_453_455 * neg_f_413_low60_40_low20_0 + s_453_455 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_2 + u_453_455 * (const 64 (2**21)) + v_453_455 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_2 + r_453_455 * (const 64 (2**21)) + s_453_455 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_2,
    neg_f_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_2,
    neg_g_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 455)) <=s delta, delta <=s (const 64 (1 + 2*455)),
    (const 64 (-(2**20))) <=s u_453_455, u_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_455, v_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_455, r_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_455, s_453_455 <=s (const 64 ((2**20))),
    u_453_455 + v_453_455 <=s (const 64 (2**20)),
    u_453_455 - v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 + v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 - v_453_455 <=s (const 64 (2**20)),
    r_453_455 + s_453_455 <=s (const 64 (2**20)),
    r_453_455 - s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 + s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 - s_453_455 <=s (const 64 (2**20)),
    u_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_453_455 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step455

// premise a
assume
neg_g_413_low60_40_low20_2 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_2 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_3 neg_f_413_low60_40_low20_2;
mov u_453_456 u_453_455;
mov v_453_456 v_453_455;

asr neg_g_413_low60_40_low20_3 neg_g_413_low60_40_low20_2 1;
asr r_453_456 r_453_455 1;
asr s_453_456 s_453_455 1;
assert
    true
&&
    neg_f_413_low60_40_low20_3 = neg_f_413_low60_40_low20_2,
    u_453_456 = u_453_455,
    v_453_456 = v_453_455,
    neg_g_413_low60_40_low20_3 * (const 64 2) = neg_g_413_low60_40_low20_2,
    r_453_456 * (const 64 2) = r_453_455,
    s_453_456 * (const 64 2) = s_453_455
;

assume
    neg_f_413_low60_40_low20_3 = neg_f_413_low60_40_low20_2,
    u_453_456 = u_453_455,
    v_453_456 = v_453_455,
    neg_g_413_low60_40_low20_3 * 2 = neg_g_413_low60_40_low20_2,
    r_453_456 * 2 = r_453_455,
    s_453_456 * 2 = s_453_455
&&
    true
;

{
    u_453_456 * neg_f_413_low60_40_low20_0 + v_453_456 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_456 * neg_f_413_low60_40_low20_0 + s_453_456 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_3 + u_453_456 * (const 64 (2**21)) + v_453_456 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_3 + r_453_456 * (const 64 (2**21)) + s_453_456 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_3,
    neg_f_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_3,
    neg_g_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 456)) <=s delta, delta <=s (const 64 (1 + 2*456)),
    (const 64 (-(2**20))) <=s u_453_456, u_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_456, v_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_456, r_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_456, s_453_456 <=s (const 64 ((2**20))),
    u_453_456 + v_453_456 <=s (const 64 (2**20)),
    u_453_456 - v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 + v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 - v_453_456 <=s (const 64 (2**20)),
    r_453_456 + s_453_456 <=s (const 64 (2**20)),
    r_453_456 - s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 + s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 - s_453_456 <=s (const 64 (2**20)),
    u_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_453_456 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_455_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_2,
sint64 neg_g_413_low60_40_low20_2,
sint64 neg_f_413_low60_40_low20_3,
sint64 neg_g_413_low60_40_low20_3,
sint64 u_453_455,
sint64 v_453_455,
sint64 r_453_455,
sint64 s_453_455,
sint64 u_453_456,
sint64 v_453_456,
sint64 r_453_456,
sint64 s_453_456,
bit ne
)={
    u_453_455 * neg_f_413_low60_40_low20_0 + v_453_455 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_2 * (-(2**20)),
    r_453_455 * neg_f_413_low60_40_low20_0 + s_453_455 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_2 * (-(2**20))
&&
    u_453_455 * neg_f_413_low60_40_low20_0 + v_453_455 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_2 * (const 64 (-(2**20))),
    r_453_455 * neg_f_413_low60_40_low20_0 + s_453_455 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_2 + u_453_455 * (const 64 (2**21)) + v_453_455 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_2 + r_453_455 * (const 64 (2**21)) + s_453_455 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_2,
    neg_f_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_2,
    neg_g_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 455)) <=s delta, delta <=s (const 64 (1 + 2*455)),
    (const 64 (-(2**20))) <=s u_453_455, u_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_455, v_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_455, r_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_455, s_453_455 <=s (const 64 ((2**20))),
    u_453_455 + v_453_455 <=s (const 64 (2**20)),
    u_453_455 - v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 + v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 - v_453_455 <=s (const 64 (2**20)),
    r_453_455 + s_453_455 <=s (const 64 (2**20)),
    r_453_455 - s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 + s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 - s_453_455 <=s (const 64 (2**20)),
    u_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_453_455 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step455

// premise b
assume
neg_g_413_low60_40_low20_2 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_3 neg_f_413_low60_40_low20_2;
mov u_453_456 u_453_455;
mov v_453_456 v_453_455;

add neg_g_413_low60_40_low20_3 neg_g_413_low60_40_low20_2 neg_f_413_low60_40_low20_2;
asr neg_g_413_low60_40_low20_3 neg_g_413_low60_40_low20_3 1;
add r_453_456 r_453_455 u_453_455;
asr r_453_456 r_453_456 1;
add s_453_456 s_453_455 v_453_455;
asr s_453_456 s_453_456 1;
assert
    true
&&
    neg_f_413_low60_40_low20_3 = neg_f_413_low60_40_low20_2,
    u_453_456 = u_453_455,
    v_453_456 = v_453_455,
    neg_g_413_low60_40_low20_3 * (const 64 2) = neg_g_413_low60_40_low20_2 + neg_f_413_low60_40_low20_2,
    r_453_456 * (const 64 2) = r_453_455 + u_453_455,
    s_453_456 * (const 64 2) = s_453_455 + v_453_455
;

assume
    neg_f_413_low60_40_low20_3 = neg_f_413_low60_40_low20_2,
    u_453_456 = u_453_455,
    v_453_456 = v_453_455,
    neg_g_413_low60_40_low20_3 * 2 = neg_g_413_low60_40_low20_2 + neg_f_413_low60_40_low20_2,
    r_453_456 * 2 = r_453_455 + u_453_455,
    s_453_456 * 2 = s_453_455 + v_453_455
&&
    true
;

{
    u_453_456 * neg_f_413_low60_40_low20_0 + v_453_456 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_456 * neg_f_413_low60_40_low20_0 + s_453_456 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_3 + u_453_456 * (const 64 (2**21)) + v_453_456 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_3 + r_453_456 * (const 64 (2**21)) + s_453_456 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_3,
    neg_f_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_3,
    neg_g_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 456)) <=s delta, delta <=s (const 64 (1 + 2*456)),
    (const 64 (-(2**20))) <=s u_453_456, u_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_456, v_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_456, r_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_456, s_453_456 <=s (const 64 ((2**20))),
    u_453_456 + v_453_456 <=s (const 64 (2**20)),
    u_453_456 - v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 + v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 - v_453_456 <=s (const 64 (2**20)),
    r_453_456 + s_453_456 <=s (const 64 (2**20)),
    r_453_456 - s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 + s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 - s_453_456 <=s (const 64 (2**20)),
    u_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_453_456 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_455_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_2,
sint64 neg_g_413_low60_40_low20_2,
sint64 neg_f_413_low60_40_low20_3,
sint64 neg_g_413_low60_40_low20_3,
sint64 u_453_455,
sint64 v_453_455,
sint64 r_453_455,
sint64 s_453_455,
sint64 u_453_456,
sint64 v_453_456,
sint64 r_453_456,
sint64 s_453_456,
bit ne
)={
    u_453_455 * neg_f_413_low60_40_low20_0 + v_453_455 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_2 * (-(2**20)),
    r_453_455 * neg_f_413_low60_40_low20_0 + s_453_455 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_2 * (-(2**20))
&&
    u_453_455 * neg_f_413_low60_40_low20_0 + v_453_455 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_2 * (const 64 (-(2**20))),
    r_453_455 * neg_f_413_low60_40_low20_0 + s_453_455 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_2 + u_453_455 * (const 64 (2**21)) + v_453_455 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_2 + r_453_455 * (const 64 (2**21)) + s_453_455 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_2,
    neg_f_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_2,
    neg_g_413_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 455)) <=s delta, delta <=s (const 64 (1 + 2*455)),
    (const 64 (-(2**20))) <=s u_453_455, u_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_455, v_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_455, r_453_455 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_455, s_453_455 <=s (const 64 ((2**20))),
    u_453_455 + v_453_455 <=s (const 64 (2**20)),
    u_453_455 - v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 + v_453_455 <=s (const 64 (2**20)),
    (const 64 0) - u_453_455 - v_453_455 <=s (const 64 (2**20)),
    r_453_455 + s_453_455 <=s (const 64 (2**20)),
    r_453_455 - s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 + s_453_455 <=s (const 64 (2**20)),
    (const 64 0) - r_453_455 - s_453_455 <=s (const 64 (2**20)),
    u_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_453_455 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_453_455 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step455

// premise c
assume
neg_g_413_low60_40_low20_2 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_3 neg_g_413_low60_40_low20_2;
mov u_453_456 r_453_455;
mov v_453_456 s_453_455;

subs dc neg_g_413_low60_40_low20_3 neg_g_413_low60_40_low20_2 neg_f_413_low60_40_low20_2;
asr neg_g_413_low60_40_low20_3 neg_g_413_low60_40_low20_3 1;
subs dc r_453_456 r_453_455 u_453_455;
asr r_453_456 r_453_456 1;
subs dc s_453_456 s_453_455 v_453_455;
asr s_453_456 s_453_456 1;
assert
    true
&&
    neg_f_413_low60_40_low20_3 = neg_g_413_low60_40_low20_2,
    u_453_456 = r_453_455,
    v_453_456 = s_453_455,
    neg_g_413_low60_40_low20_3 * (const 64 2) = neg_g_413_low60_40_low20_2 - neg_f_413_low60_40_low20_2,
    r_453_456 * (const 64 2) = r_453_455 - u_453_455,
    s_453_456 * (const 64 2) = s_453_455 - v_453_455
;

assume
    neg_f_413_low60_40_low20_3 = neg_g_413_low60_40_low20_2,
    u_453_456 = r_453_455,
    v_453_456 = s_453_455,
    neg_g_413_low60_40_low20_3 * 2 = neg_g_413_low60_40_low20_2 - neg_f_413_low60_40_low20_2,
    r_453_456 * 2 = r_453_455 - u_453_455,
    s_453_456 * 2 = s_453_455 - v_453_455
&&
    true
;

{
    u_453_456 * neg_f_413_low60_40_low20_0 + v_453_456 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_456 * neg_f_413_low60_40_low20_0 + s_453_456 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_3 + u_453_456 * (const 64 (2**21)) + v_453_456 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_3 + r_453_456 * (const 64 (2**21)) + s_453_456 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_3,
    neg_f_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_3,
    neg_g_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 456)) <=s delta, delta <=s (const 64 (1 + 2*456)),
    (const 64 (-(2**20))) <=s u_453_456, u_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_456, v_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_456, r_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_456, s_453_456 <=s (const 64 ((2**20))),
    u_453_456 + v_453_456 <=s (const 64 (2**20)),
    u_453_456 - v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 + v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 - v_453_456 <=s (const 64 (2**20)),
    r_453_456 + s_453_456 <=s (const 64 (2**20)),
    r_453_456 - s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 + s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 - s_453_456 <=s (const 64 (2**20)),
    u_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_453_456 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_456_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_3,
sint64 neg_g_413_low60_40_low20_3,
sint64 neg_f_413_low60_40_low20_4,
sint64 neg_g_413_low60_40_low20_4,
sint64 u_453_456,
sint64 v_453_456,
sint64 r_453_456,
sint64 s_453_456,
sint64 u_453_457,
sint64 v_453_457,
sint64 r_453_457,
sint64 s_453_457,
bit ne
)={
    u_453_456 * neg_f_413_low60_40_low20_0 + v_453_456 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_3 * (-(2**20)),
    r_453_456 * neg_f_413_low60_40_low20_0 + s_453_456 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_3 * (-(2**20))
&&
    u_453_456 * neg_f_413_low60_40_low20_0 + v_453_456 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_3 * (const 64 (-(2**20))),
    r_453_456 * neg_f_413_low60_40_low20_0 + s_453_456 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_3 + u_453_456 * (const 64 (2**21)) + v_453_456 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_3 + r_453_456 * (const 64 (2**21)) + s_453_456 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_3,
    neg_f_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_3,
    neg_g_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 456)) <=s delta, delta <=s (const 64 (1 + 2*456)),
    (const 64 (-(2**20))) <=s u_453_456, u_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_456, v_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_456, r_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_456, s_453_456 <=s (const 64 ((2**20))),
    u_453_456 + v_453_456 <=s (const 64 (2**20)),
    u_453_456 - v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 + v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 - v_453_456 <=s (const 64 (2**20)),
    r_453_456 + s_453_456 <=s (const 64 (2**20)),
    r_453_456 - s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 + s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 - s_453_456 <=s (const 64 (2**20)),
    u_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_453_456 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step456

// premise a
assume
neg_g_413_low60_40_low20_3 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_3 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_4 neg_f_413_low60_40_low20_3;
mov u_453_457 u_453_456;
mov v_453_457 v_453_456;

asr neg_g_413_low60_40_low20_4 neg_g_413_low60_40_low20_3 1;
asr r_453_457 r_453_456 1;
asr s_453_457 s_453_456 1;
assert
    true
&&
    neg_f_413_low60_40_low20_4 = neg_f_413_low60_40_low20_3,
    u_453_457 = u_453_456,
    v_453_457 = v_453_456,
    neg_g_413_low60_40_low20_4 * (const 64 2) = neg_g_413_low60_40_low20_3,
    r_453_457 * (const 64 2) = r_453_456,
    s_453_457 * (const 64 2) = s_453_456
;

assume
    neg_f_413_low60_40_low20_4 = neg_f_413_low60_40_low20_3,
    u_453_457 = u_453_456,
    v_453_457 = v_453_456,
    neg_g_413_low60_40_low20_4 * 2 = neg_g_413_low60_40_low20_3,
    r_453_457 * 2 = r_453_456,
    s_453_457 * 2 = s_453_456
&&
    true
;

{
    u_453_457 * neg_f_413_low60_40_low20_0 + v_453_457 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_457 * neg_f_413_low60_40_low20_0 + s_453_457 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_4 + u_453_457 * (const 64 (2**21)) + v_453_457 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_4 + r_453_457 * (const 64 (2**21)) + s_453_457 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_4,
    neg_f_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_4,
    neg_g_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 457)) <=s delta, delta <=s (const 64 (1 + 2*457)),
    (const 64 (-(2**20))) <=s u_453_457, u_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_457, v_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_457, r_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_457, s_453_457 <=s (const 64 ((2**20))),
    u_453_457 + v_453_457 <=s (const 64 (2**20)),
    u_453_457 - v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 + v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 - v_453_457 <=s (const 64 (2**20)),
    r_453_457 + s_453_457 <=s (const 64 (2**20)),
    r_453_457 - s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 + s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 - s_453_457 <=s (const 64 (2**20)),
    u_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_453_457 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_456_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_3,
sint64 neg_g_413_low60_40_low20_3,
sint64 neg_f_413_low60_40_low20_4,
sint64 neg_g_413_low60_40_low20_4,
sint64 u_453_456,
sint64 v_453_456,
sint64 r_453_456,
sint64 s_453_456,
sint64 u_453_457,
sint64 v_453_457,
sint64 r_453_457,
sint64 s_453_457,
bit ne
)={
    u_453_456 * neg_f_413_low60_40_low20_0 + v_453_456 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_3 * (-(2**20)),
    r_453_456 * neg_f_413_low60_40_low20_0 + s_453_456 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_3 * (-(2**20))
&&
    u_453_456 * neg_f_413_low60_40_low20_0 + v_453_456 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_3 * (const 64 (-(2**20))),
    r_453_456 * neg_f_413_low60_40_low20_0 + s_453_456 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_3 + u_453_456 * (const 64 (2**21)) + v_453_456 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_3 + r_453_456 * (const 64 (2**21)) + s_453_456 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_3,
    neg_f_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_3,
    neg_g_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 456)) <=s delta, delta <=s (const 64 (1 + 2*456)),
    (const 64 (-(2**20))) <=s u_453_456, u_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_456, v_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_456, r_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_456, s_453_456 <=s (const 64 ((2**20))),
    u_453_456 + v_453_456 <=s (const 64 (2**20)),
    u_453_456 - v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 + v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 - v_453_456 <=s (const 64 (2**20)),
    r_453_456 + s_453_456 <=s (const 64 (2**20)),
    r_453_456 - s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 + s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 - s_453_456 <=s (const 64 (2**20)),
    u_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_453_456 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step456

// premise b
assume
neg_g_413_low60_40_low20_3 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_4 neg_f_413_low60_40_low20_3;
mov u_453_457 u_453_456;
mov v_453_457 v_453_456;

add neg_g_413_low60_40_low20_4 neg_g_413_low60_40_low20_3 neg_f_413_low60_40_low20_3;
asr neg_g_413_low60_40_low20_4 neg_g_413_low60_40_low20_4 1;
add r_453_457 r_453_456 u_453_456;
asr r_453_457 r_453_457 1;
add s_453_457 s_453_456 v_453_456;
asr s_453_457 s_453_457 1;
assert
    true
&&
    neg_f_413_low60_40_low20_4 = neg_f_413_low60_40_low20_3,
    u_453_457 = u_453_456,
    v_453_457 = v_453_456,
    neg_g_413_low60_40_low20_4 * (const 64 2) = neg_g_413_low60_40_low20_3 + neg_f_413_low60_40_low20_3,
    r_453_457 * (const 64 2) = r_453_456 + u_453_456,
    s_453_457 * (const 64 2) = s_453_456 + v_453_456
;

assume
    neg_f_413_low60_40_low20_4 = neg_f_413_low60_40_low20_3,
    u_453_457 = u_453_456,
    v_453_457 = v_453_456,
    neg_g_413_low60_40_low20_4 * 2 = neg_g_413_low60_40_low20_3 + neg_f_413_low60_40_low20_3,
    r_453_457 * 2 = r_453_456 + u_453_456,
    s_453_457 * 2 = s_453_456 + v_453_456
&&
    true
;

{
    u_453_457 * neg_f_413_low60_40_low20_0 + v_453_457 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_457 * neg_f_413_low60_40_low20_0 + s_453_457 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_4 + u_453_457 * (const 64 (2**21)) + v_453_457 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_4 + r_453_457 * (const 64 (2**21)) + s_453_457 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_4,
    neg_f_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_4,
    neg_g_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 457)) <=s delta, delta <=s (const 64 (1 + 2*457)),
    (const 64 (-(2**20))) <=s u_453_457, u_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_457, v_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_457, r_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_457, s_453_457 <=s (const 64 ((2**20))),
    u_453_457 + v_453_457 <=s (const 64 (2**20)),
    u_453_457 - v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 + v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 - v_453_457 <=s (const 64 (2**20)),
    r_453_457 + s_453_457 <=s (const 64 (2**20)),
    r_453_457 - s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 + s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 - s_453_457 <=s (const 64 (2**20)),
    u_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_453_457 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_456_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_3,
sint64 neg_g_413_low60_40_low20_3,
sint64 neg_f_413_low60_40_low20_4,
sint64 neg_g_413_low60_40_low20_4,
sint64 u_453_456,
sint64 v_453_456,
sint64 r_453_456,
sint64 s_453_456,
sint64 u_453_457,
sint64 v_453_457,
sint64 r_453_457,
sint64 s_453_457,
bit ne
)={
    u_453_456 * neg_f_413_low60_40_low20_0 + v_453_456 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_3 * (-(2**20)),
    r_453_456 * neg_f_413_low60_40_low20_0 + s_453_456 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_3 * (-(2**20))
&&
    u_453_456 * neg_f_413_low60_40_low20_0 + v_453_456 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_3 * (const 64 (-(2**20))),
    r_453_456 * neg_f_413_low60_40_low20_0 + s_453_456 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_3 + u_453_456 * (const 64 (2**21)) + v_453_456 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_3 + r_453_456 * (const 64 (2**21)) + s_453_456 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_3,
    neg_f_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_3,
    neg_g_413_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 456)) <=s delta, delta <=s (const 64 (1 + 2*456)),
    (const 64 (-(2**20))) <=s u_453_456, u_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_456, v_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_456, r_453_456 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_456, s_453_456 <=s (const 64 ((2**20))),
    u_453_456 + v_453_456 <=s (const 64 (2**20)),
    u_453_456 - v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 + v_453_456 <=s (const 64 (2**20)),
    (const 64 0) - u_453_456 - v_453_456 <=s (const 64 (2**20)),
    r_453_456 + s_453_456 <=s (const 64 (2**20)),
    r_453_456 - s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 + s_453_456 <=s (const 64 (2**20)),
    (const 64 0) - r_453_456 - s_453_456 <=s (const 64 (2**20)),
    u_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_453_456 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_453_456 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step456

// premise c
assume
neg_g_413_low60_40_low20_3 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_4 neg_g_413_low60_40_low20_3;
mov u_453_457 r_453_456;
mov v_453_457 s_453_456;

subs dc neg_g_413_low60_40_low20_4 neg_g_413_low60_40_low20_3 neg_f_413_low60_40_low20_3;
asr neg_g_413_low60_40_low20_4 neg_g_413_low60_40_low20_4 1;
subs dc r_453_457 r_453_456 u_453_456;
asr r_453_457 r_453_457 1;
subs dc s_453_457 s_453_456 v_453_456;
asr s_453_457 s_453_457 1;
assert
    true
&&
    neg_f_413_low60_40_low20_4 = neg_g_413_low60_40_low20_3,
    u_453_457 = r_453_456,
    v_453_457 = s_453_456,
    neg_g_413_low60_40_low20_4 * (const 64 2) = neg_g_413_low60_40_low20_3 - neg_f_413_low60_40_low20_3,
    r_453_457 * (const 64 2) = r_453_456 - u_453_456,
    s_453_457 * (const 64 2) = s_453_456 - v_453_456
;

assume
    neg_f_413_low60_40_low20_4 = neg_g_413_low60_40_low20_3,
    u_453_457 = r_453_456,
    v_453_457 = s_453_456,
    neg_g_413_low60_40_low20_4 * 2 = neg_g_413_low60_40_low20_3 - neg_f_413_low60_40_low20_3,
    r_453_457 * 2 = r_453_456 - u_453_456,
    s_453_457 * 2 = s_453_456 - v_453_456
&&
    true
;

{
    u_453_457 * neg_f_413_low60_40_low20_0 + v_453_457 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_457 * neg_f_413_low60_40_low20_0 + s_453_457 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_4 + u_453_457 * (const 64 (2**21)) + v_453_457 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_4 + r_453_457 * (const 64 (2**21)) + s_453_457 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_4,
    neg_f_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_4,
    neg_g_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 457)) <=s delta, delta <=s (const 64 (1 + 2*457)),
    (const 64 (-(2**20))) <=s u_453_457, u_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_457, v_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_457, r_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_457, s_453_457 <=s (const 64 ((2**20))),
    u_453_457 + v_453_457 <=s (const 64 (2**20)),
    u_453_457 - v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 + v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 - v_453_457 <=s (const 64 (2**20)),
    r_453_457 + s_453_457 <=s (const 64 (2**20)),
    r_453_457 - s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 + s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 - s_453_457 <=s (const 64 (2**20)),
    u_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_453_457 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_457_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_4,
sint64 neg_g_413_low60_40_low20_4,
sint64 neg_f_413_low60_40_low20_5,
sint64 neg_g_413_low60_40_low20_5,
sint64 u_453_457,
sint64 v_453_457,
sint64 r_453_457,
sint64 s_453_457,
sint64 u_453_458,
sint64 v_453_458,
sint64 r_453_458,
sint64 s_453_458,
bit ne
)={
    u_453_457 * neg_f_413_low60_40_low20_0 + v_453_457 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_4 * (-(2**20)),
    r_453_457 * neg_f_413_low60_40_low20_0 + s_453_457 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_4 * (-(2**20))
&&
    u_453_457 * neg_f_413_low60_40_low20_0 + v_453_457 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_4 * (const 64 (-(2**20))),
    r_453_457 * neg_f_413_low60_40_low20_0 + s_453_457 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_4 + u_453_457 * (const 64 (2**21)) + v_453_457 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_4 + r_453_457 * (const 64 (2**21)) + s_453_457 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_4,
    neg_f_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_4,
    neg_g_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 457)) <=s delta, delta <=s (const 64 (1 + 2*457)),
    (const 64 (-(2**20))) <=s u_453_457, u_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_457, v_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_457, r_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_457, s_453_457 <=s (const 64 ((2**20))),
    u_453_457 + v_453_457 <=s (const 64 (2**20)),
    u_453_457 - v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 + v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 - v_453_457 <=s (const 64 (2**20)),
    r_453_457 + s_453_457 <=s (const 64 (2**20)),
    r_453_457 - s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 + s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 - s_453_457 <=s (const 64 (2**20)),
    u_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_453_457 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step457

// premise a
assume
neg_g_413_low60_40_low20_4 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_4 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_5 neg_f_413_low60_40_low20_4;
mov u_453_458 u_453_457;
mov v_453_458 v_453_457;

asr neg_g_413_low60_40_low20_5 neg_g_413_low60_40_low20_4 1;
asr r_453_458 r_453_457 1;
asr s_453_458 s_453_457 1;
assert
    true
&&
    neg_f_413_low60_40_low20_5 = neg_f_413_low60_40_low20_4,
    u_453_458 = u_453_457,
    v_453_458 = v_453_457,
    neg_g_413_low60_40_low20_5 * (const 64 2) = neg_g_413_low60_40_low20_4,
    r_453_458 * (const 64 2) = r_453_457,
    s_453_458 * (const 64 2) = s_453_457
;

assume
    neg_f_413_low60_40_low20_5 = neg_f_413_low60_40_low20_4,
    u_453_458 = u_453_457,
    v_453_458 = v_453_457,
    neg_g_413_low60_40_low20_5 * 2 = neg_g_413_low60_40_low20_4,
    r_453_458 * 2 = r_453_457,
    s_453_458 * 2 = s_453_457
&&
    true
;

{
    u_453_458 * neg_f_413_low60_40_low20_0 + v_453_458 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_458 * neg_f_413_low60_40_low20_0 + s_453_458 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_5 + u_453_458 * (const 64 (2**21)) + v_453_458 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_5 + r_453_458 * (const 64 (2**21)) + s_453_458 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_5,
    neg_f_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_5,
    neg_g_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 458)) <=s delta, delta <=s (const 64 (1 + 2*458)),
    (const 64 (-(2**20))) <=s u_453_458, u_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_458, v_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_458, r_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_458, s_453_458 <=s (const 64 ((2**20))),
    u_453_458 + v_453_458 <=s (const 64 (2**20)),
    u_453_458 - v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 + v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 - v_453_458 <=s (const 64 (2**20)),
    r_453_458 + s_453_458 <=s (const 64 (2**20)),
    r_453_458 - s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 + s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 - s_453_458 <=s (const 64 (2**20)),
    u_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_453_458 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_457_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_4,
sint64 neg_g_413_low60_40_low20_4,
sint64 neg_f_413_low60_40_low20_5,
sint64 neg_g_413_low60_40_low20_5,
sint64 u_453_457,
sint64 v_453_457,
sint64 r_453_457,
sint64 s_453_457,
sint64 u_453_458,
sint64 v_453_458,
sint64 r_453_458,
sint64 s_453_458,
bit ne
)={
    u_453_457 * neg_f_413_low60_40_low20_0 + v_453_457 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_4 * (-(2**20)),
    r_453_457 * neg_f_413_low60_40_low20_0 + s_453_457 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_4 * (-(2**20))
&&
    u_453_457 * neg_f_413_low60_40_low20_0 + v_453_457 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_4 * (const 64 (-(2**20))),
    r_453_457 * neg_f_413_low60_40_low20_0 + s_453_457 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_4 + u_453_457 * (const 64 (2**21)) + v_453_457 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_4 + r_453_457 * (const 64 (2**21)) + s_453_457 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_4,
    neg_f_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_4,
    neg_g_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 457)) <=s delta, delta <=s (const 64 (1 + 2*457)),
    (const 64 (-(2**20))) <=s u_453_457, u_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_457, v_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_457, r_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_457, s_453_457 <=s (const 64 ((2**20))),
    u_453_457 + v_453_457 <=s (const 64 (2**20)),
    u_453_457 - v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 + v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 - v_453_457 <=s (const 64 (2**20)),
    r_453_457 + s_453_457 <=s (const 64 (2**20)),
    r_453_457 - s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 + s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 - s_453_457 <=s (const 64 (2**20)),
    u_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_453_457 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step457

// premise b
assume
neg_g_413_low60_40_low20_4 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_5 neg_f_413_low60_40_low20_4;
mov u_453_458 u_453_457;
mov v_453_458 v_453_457;

add neg_g_413_low60_40_low20_5 neg_g_413_low60_40_low20_4 neg_f_413_low60_40_low20_4;
asr neg_g_413_low60_40_low20_5 neg_g_413_low60_40_low20_5 1;
add r_453_458 r_453_457 u_453_457;
asr r_453_458 r_453_458 1;
add s_453_458 s_453_457 v_453_457;
asr s_453_458 s_453_458 1;
assert
    true
&&
    neg_f_413_low60_40_low20_5 = neg_f_413_low60_40_low20_4,
    u_453_458 = u_453_457,
    v_453_458 = v_453_457,
    neg_g_413_low60_40_low20_5 * (const 64 2) = neg_g_413_low60_40_low20_4 + neg_f_413_low60_40_low20_4,
    r_453_458 * (const 64 2) = r_453_457 + u_453_457,
    s_453_458 * (const 64 2) = s_453_457 + v_453_457
;

assume
    neg_f_413_low60_40_low20_5 = neg_f_413_low60_40_low20_4,
    u_453_458 = u_453_457,
    v_453_458 = v_453_457,
    neg_g_413_low60_40_low20_5 * 2 = neg_g_413_low60_40_low20_4 + neg_f_413_low60_40_low20_4,
    r_453_458 * 2 = r_453_457 + u_453_457,
    s_453_458 * 2 = s_453_457 + v_453_457
&&
    true
;

{
    u_453_458 * neg_f_413_low60_40_low20_0 + v_453_458 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_458 * neg_f_413_low60_40_low20_0 + s_453_458 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_5 + u_453_458 * (const 64 (2**21)) + v_453_458 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_5 + r_453_458 * (const 64 (2**21)) + s_453_458 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_5,
    neg_f_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_5,
    neg_g_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 458)) <=s delta, delta <=s (const 64 (1 + 2*458)),
    (const 64 (-(2**20))) <=s u_453_458, u_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_458, v_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_458, r_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_458, s_453_458 <=s (const 64 ((2**20))),
    u_453_458 + v_453_458 <=s (const 64 (2**20)),
    u_453_458 - v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 + v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 - v_453_458 <=s (const 64 (2**20)),
    r_453_458 + s_453_458 <=s (const 64 (2**20)),
    r_453_458 - s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 + s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 - s_453_458 <=s (const 64 (2**20)),
    u_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_453_458 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_457_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_4,
sint64 neg_g_413_low60_40_low20_4,
sint64 neg_f_413_low60_40_low20_5,
sint64 neg_g_413_low60_40_low20_5,
sint64 u_453_457,
sint64 v_453_457,
sint64 r_453_457,
sint64 s_453_457,
sint64 u_453_458,
sint64 v_453_458,
sint64 r_453_458,
sint64 s_453_458,
bit ne
)={
    u_453_457 * neg_f_413_low60_40_low20_0 + v_453_457 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_4 * (-(2**20)),
    r_453_457 * neg_f_413_low60_40_low20_0 + s_453_457 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_4 * (-(2**20))
&&
    u_453_457 * neg_f_413_low60_40_low20_0 + v_453_457 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_4 * (const 64 (-(2**20))),
    r_453_457 * neg_f_413_low60_40_low20_0 + s_453_457 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_4 + u_453_457 * (const 64 (2**21)) + v_453_457 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_4 + r_453_457 * (const 64 (2**21)) + s_453_457 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_4,
    neg_f_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_4,
    neg_g_413_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 457)) <=s delta, delta <=s (const 64 (1 + 2*457)),
    (const 64 (-(2**20))) <=s u_453_457, u_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_457, v_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_457, r_453_457 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_457, s_453_457 <=s (const 64 ((2**20))),
    u_453_457 + v_453_457 <=s (const 64 (2**20)),
    u_453_457 - v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 + v_453_457 <=s (const 64 (2**20)),
    (const 64 0) - u_453_457 - v_453_457 <=s (const 64 (2**20)),
    r_453_457 + s_453_457 <=s (const 64 (2**20)),
    r_453_457 - s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 + s_453_457 <=s (const 64 (2**20)),
    (const 64 0) - r_453_457 - s_453_457 <=s (const 64 (2**20)),
    u_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_453_457 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_453_457 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step457

// premise c
assume
neg_g_413_low60_40_low20_4 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_5 neg_g_413_low60_40_low20_4;
mov u_453_458 r_453_457;
mov v_453_458 s_453_457;

subs dc neg_g_413_low60_40_low20_5 neg_g_413_low60_40_low20_4 neg_f_413_low60_40_low20_4;
asr neg_g_413_low60_40_low20_5 neg_g_413_low60_40_low20_5 1;
subs dc r_453_458 r_453_457 u_453_457;
asr r_453_458 r_453_458 1;
subs dc s_453_458 s_453_457 v_453_457;
asr s_453_458 s_453_458 1;
assert
    true
&&
    neg_f_413_low60_40_low20_5 = neg_g_413_low60_40_low20_4,
    u_453_458 = r_453_457,
    v_453_458 = s_453_457,
    neg_g_413_low60_40_low20_5 * (const 64 2) = neg_g_413_low60_40_low20_4 - neg_f_413_low60_40_low20_4,
    r_453_458 * (const 64 2) = r_453_457 - u_453_457,
    s_453_458 * (const 64 2) = s_453_457 - v_453_457
;

assume
    neg_f_413_low60_40_low20_5 = neg_g_413_low60_40_low20_4,
    u_453_458 = r_453_457,
    v_453_458 = s_453_457,
    neg_g_413_low60_40_low20_5 * 2 = neg_g_413_low60_40_low20_4 - neg_f_413_low60_40_low20_4,
    r_453_458 * 2 = r_453_457 - u_453_457,
    s_453_458 * 2 = s_453_457 - v_453_457
&&
    true
;

{
    u_453_458 * neg_f_413_low60_40_low20_0 + v_453_458 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_458 * neg_f_413_low60_40_low20_0 + s_453_458 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_5 + u_453_458 * (const 64 (2**21)) + v_453_458 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_5 + r_453_458 * (const 64 (2**21)) + s_453_458 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_5,
    neg_f_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_5,
    neg_g_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 458)) <=s delta, delta <=s (const 64 (1 + 2*458)),
    (const 64 (-(2**20))) <=s u_453_458, u_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_458, v_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_458, r_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_458, s_453_458 <=s (const 64 ((2**20))),
    u_453_458 + v_453_458 <=s (const 64 (2**20)),
    u_453_458 - v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 + v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 - v_453_458 <=s (const 64 (2**20)),
    r_453_458 + s_453_458 <=s (const 64 (2**20)),
    r_453_458 - s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 + s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 - s_453_458 <=s (const 64 (2**20)),
    u_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_453_458 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_458_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_5,
sint64 neg_g_413_low60_40_low20_5,
sint64 neg_f_413_low60_40_low20_6,
sint64 neg_g_413_low60_40_low20_6,
sint64 u_453_458,
sint64 v_453_458,
sint64 r_453_458,
sint64 s_453_458,
sint64 u_453_459,
sint64 v_453_459,
sint64 r_453_459,
sint64 s_453_459,
bit ne
)={
    u_453_458 * neg_f_413_low60_40_low20_0 + v_453_458 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_5 * (-(2**20)),
    r_453_458 * neg_f_413_low60_40_low20_0 + s_453_458 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_5 * (-(2**20))
&&
    u_453_458 * neg_f_413_low60_40_low20_0 + v_453_458 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_5 * (const 64 (-(2**20))),
    r_453_458 * neg_f_413_low60_40_low20_0 + s_453_458 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_5 + u_453_458 * (const 64 (2**21)) + v_453_458 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_5 + r_453_458 * (const 64 (2**21)) + s_453_458 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_5,
    neg_f_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_5,
    neg_g_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 458)) <=s delta, delta <=s (const 64 (1 + 2*458)),
    (const 64 (-(2**20))) <=s u_453_458, u_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_458, v_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_458, r_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_458, s_453_458 <=s (const 64 ((2**20))),
    u_453_458 + v_453_458 <=s (const 64 (2**20)),
    u_453_458 - v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 + v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 - v_453_458 <=s (const 64 (2**20)),
    r_453_458 + s_453_458 <=s (const 64 (2**20)),
    r_453_458 - s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 + s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 - s_453_458 <=s (const 64 (2**20)),
    u_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_453_458 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step458

// premise a
assume
neg_g_413_low60_40_low20_5 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_5 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_6 neg_f_413_low60_40_low20_5;
mov u_453_459 u_453_458;
mov v_453_459 v_453_458;

asr neg_g_413_low60_40_low20_6 neg_g_413_low60_40_low20_5 1;
asr r_453_459 r_453_458 1;
asr s_453_459 s_453_458 1;
assert
    true
&&
    neg_f_413_low60_40_low20_6 = neg_f_413_low60_40_low20_5,
    u_453_459 = u_453_458,
    v_453_459 = v_453_458,
    neg_g_413_low60_40_low20_6 * (const 64 2) = neg_g_413_low60_40_low20_5,
    r_453_459 * (const 64 2) = r_453_458,
    s_453_459 * (const 64 2) = s_453_458
;

assume
    neg_f_413_low60_40_low20_6 = neg_f_413_low60_40_low20_5,
    u_453_459 = u_453_458,
    v_453_459 = v_453_458,
    neg_g_413_low60_40_low20_6 * 2 = neg_g_413_low60_40_low20_5,
    r_453_459 * 2 = r_453_458,
    s_453_459 * 2 = s_453_458
&&
    true
;

{
    u_453_459 * neg_f_413_low60_40_low20_0 + v_453_459 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_459 * neg_f_413_low60_40_low20_0 + s_453_459 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_6 + u_453_459 * (const 64 (2**21)) + v_453_459 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_6 + r_453_459 * (const 64 (2**21)) + s_453_459 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_6,
    neg_f_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_6,
    neg_g_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 459)) <=s delta, delta <=s (const 64 (1 + 2*459)),
    (const 64 (-(2**20))) <=s u_453_459, u_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_459, v_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_459, r_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_459, s_453_459 <=s (const 64 ((2**20))),
    u_453_459 + v_453_459 <=s (const 64 (2**20)),
    u_453_459 - v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 + v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 - v_453_459 <=s (const 64 (2**20)),
    r_453_459 + s_453_459 <=s (const 64 (2**20)),
    r_453_459 - s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 + s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 - s_453_459 <=s (const 64 (2**20)),
    u_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_453_459 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_458_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_5,
sint64 neg_g_413_low60_40_low20_5,
sint64 neg_f_413_low60_40_low20_6,
sint64 neg_g_413_low60_40_low20_6,
sint64 u_453_458,
sint64 v_453_458,
sint64 r_453_458,
sint64 s_453_458,
sint64 u_453_459,
sint64 v_453_459,
sint64 r_453_459,
sint64 s_453_459,
bit ne
)={
    u_453_458 * neg_f_413_low60_40_low20_0 + v_453_458 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_5 * (-(2**20)),
    r_453_458 * neg_f_413_low60_40_low20_0 + s_453_458 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_5 * (-(2**20))
&&
    u_453_458 * neg_f_413_low60_40_low20_0 + v_453_458 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_5 * (const 64 (-(2**20))),
    r_453_458 * neg_f_413_low60_40_low20_0 + s_453_458 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_5 + u_453_458 * (const 64 (2**21)) + v_453_458 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_5 + r_453_458 * (const 64 (2**21)) + s_453_458 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_5,
    neg_f_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_5,
    neg_g_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 458)) <=s delta, delta <=s (const 64 (1 + 2*458)),
    (const 64 (-(2**20))) <=s u_453_458, u_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_458, v_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_458, r_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_458, s_453_458 <=s (const 64 ((2**20))),
    u_453_458 + v_453_458 <=s (const 64 (2**20)),
    u_453_458 - v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 + v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 - v_453_458 <=s (const 64 (2**20)),
    r_453_458 + s_453_458 <=s (const 64 (2**20)),
    r_453_458 - s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 + s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 - s_453_458 <=s (const 64 (2**20)),
    u_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_453_458 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step458

// premise b
assume
neg_g_413_low60_40_low20_5 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_6 neg_f_413_low60_40_low20_5;
mov u_453_459 u_453_458;
mov v_453_459 v_453_458;

add neg_g_413_low60_40_low20_6 neg_g_413_low60_40_low20_5 neg_f_413_low60_40_low20_5;
asr neg_g_413_low60_40_low20_6 neg_g_413_low60_40_low20_6 1;
add r_453_459 r_453_458 u_453_458;
asr r_453_459 r_453_459 1;
add s_453_459 s_453_458 v_453_458;
asr s_453_459 s_453_459 1;
assert
    true
&&
    neg_f_413_low60_40_low20_6 = neg_f_413_low60_40_low20_5,
    u_453_459 = u_453_458,
    v_453_459 = v_453_458,
    neg_g_413_low60_40_low20_6 * (const 64 2) = neg_g_413_low60_40_low20_5 + neg_f_413_low60_40_low20_5,
    r_453_459 * (const 64 2) = r_453_458 + u_453_458,
    s_453_459 * (const 64 2) = s_453_458 + v_453_458
;

assume
    neg_f_413_low60_40_low20_6 = neg_f_413_low60_40_low20_5,
    u_453_459 = u_453_458,
    v_453_459 = v_453_458,
    neg_g_413_low60_40_low20_6 * 2 = neg_g_413_low60_40_low20_5 + neg_f_413_low60_40_low20_5,
    r_453_459 * 2 = r_453_458 + u_453_458,
    s_453_459 * 2 = s_453_458 + v_453_458
&&
    true
;

{
    u_453_459 * neg_f_413_low60_40_low20_0 + v_453_459 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_459 * neg_f_413_low60_40_low20_0 + s_453_459 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_6 + u_453_459 * (const 64 (2**21)) + v_453_459 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_6 + r_453_459 * (const 64 (2**21)) + s_453_459 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_6,
    neg_f_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_6,
    neg_g_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 459)) <=s delta, delta <=s (const 64 (1 + 2*459)),
    (const 64 (-(2**20))) <=s u_453_459, u_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_459, v_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_459, r_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_459, s_453_459 <=s (const 64 ((2**20))),
    u_453_459 + v_453_459 <=s (const 64 (2**20)),
    u_453_459 - v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 + v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 - v_453_459 <=s (const 64 (2**20)),
    r_453_459 + s_453_459 <=s (const 64 (2**20)),
    r_453_459 - s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 + s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 - s_453_459 <=s (const 64 (2**20)),
    u_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_453_459 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_458_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_5,
sint64 neg_g_413_low60_40_low20_5,
sint64 neg_f_413_low60_40_low20_6,
sint64 neg_g_413_low60_40_low20_6,
sint64 u_453_458,
sint64 v_453_458,
sint64 r_453_458,
sint64 s_453_458,
sint64 u_453_459,
sint64 v_453_459,
sint64 r_453_459,
sint64 s_453_459,
bit ne
)={
    u_453_458 * neg_f_413_low60_40_low20_0 + v_453_458 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_5 * (-(2**20)),
    r_453_458 * neg_f_413_low60_40_low20_0 + s_453_458 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_5 * (-(2**20))
&&
    u_453_458 * neg_f_413_low60_40_low20_0 + v_453_458 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_5 * (const 64 (-(2**20))),
    r_453_458 * neg_f_413_low60_40_low20_0 + s_453_458 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_5 + u_453_458 * (const 64 (2**21)) + v_453_458 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_5 + r_453_458 * (const 64 (2**21)) + s_453_458 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_5,
    neg_f_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_5,
    neg_g_413_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 458)) <=s delta, delta <=s (const 64 (1 + 2*458)),
    (const 64 (-(2**20))) <=s u_453_458, u_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_458, v_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_458, r_453_458 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_458, s_453_458 <=s (const 64 ((2**20))),
    u_453_458 + v_453_458 <=s (const 64 (2**20)),
    u_453_458 - v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 + v_453_458 <=s (const 64 (2**20)),
    (const 64 0) - u_453_458 - v_453_458 <=s (const 64 (2**20)),
    r_453_458 + s_453_458 <=s (const 64 (2**20)),
    r_453_458 - s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 + s_453_458 <=s (const 64 (2**20)),
    (const 64 0) - r_453_458 - s_453_458 <=s (const 64 (2**20)),
    u_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_453_458 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_453_458 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step458

// premise c
assume
neg_g_413_low60_40_low20_5 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_6 neg_g_413_low60_40_low20_5;
mov u_453_459 r_453_458;
mov v_453_459 s_453_458;

subs dc neg_g_413_low60_40_low20_6 neg_g_413_low60_40_low20_5 neg_f_413_low60_40_low20_5;
asr neg_g_413_low60_40_low20_6 neg_g_413_low60_40_low20_6 1;
subs dc r_453_459 r_453_458 u_453_458;
asr r_453_459 r_453_459 1;
subs dc s_453_459 s_453_458 v_453_458;
asr s_453_459 s_453_459 1;
assert
    true
&&
    neg_f_413_low60_40_low20_6 = neg_g_413_low60_40_low20_5,
    u_453_459 = r_453_458,
    v_453_459 = s_453_458,
    neg_g_413_low60_40_low20_6 * (const 64 2) = neg_g_413_low60_40_low20_5 - neg_f_413_low60_40_low20_5,
    r_453_459 * (const 64 2) = r_453_458 - u_453_458,
    s_453_459 * (const 64 2) = s_453_458 - v_453_458
;

assume
    neg_f_413_low60_40_low20_6 = neg_g_413_low60_40_low20_5,
    u_453_459 = r_453_458,
    v_453_459 = s_453_458,
    neg_g_413_low60_40_low20_6 * 2 = neg_g_413_low60_40_low20_5 - neg_f_413_low60_40_low20_5,
    r_453_459 * 2 = r_453_458 - u_453_458,
    s_453_459 * 2 = s_453_458 - v_453_458
&&
    true
;

{
    u_453_459 * neg_f_413_low60_40_low20_0 + v_453_459 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_459 * neg_f_413_low60_40_low20_0 + s_453_459 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_6 + u_453_459 * (const 64 (2**21)) + v_453_459 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_6 + r_453_459 * (const 64 (2**21)) + s_453_459 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_6,
    neg_f_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_6,
    neg_g_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 459)) <=s delta, delta <=s (const 64 (1 + 2*459)),
    (const 64 (-(2**20))) <=s u_453_459, u_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_459, v_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_459, r_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_459, s_453_459 <=s (const 64 ((2**20))),
    u_453_459 + v_453_459 <=s (const 64 (2**20)),
    u_453_459 - v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 + v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 - v_453_459 <=s (const 64 (2**20)),
    r_453_459 + s_453_459 <=s (const 64 (2**20)),
    r_453_459 - s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 + s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 - s_453_459 <=s (const 64 (2**20)),
    u_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_453_459 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_459_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_6,
sint64 neg_g_413_low60_40_low20_6,
sint64 neg_f_413_low60_40_low20_7,
sint64 neg_g_413_low60_40_low20_7,
sint64 u_453_459,
sint64 v_453_459,
sint64 r_453_459,
sint64 s_453_459,
sint64 u_453_460,
sint64 v_453_460,
sint64 r_453_460,
sint64 s_453_460,
bit ne
)={
    u_453_459 * neg_f_413_low60_40_low20_0 + v_453_459 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_6 * (-(2**20)),
    r_453_459 * neg_f_413_low60_40_low20_0 + s_453_459 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_6 * (-(2**20))
&&
    u_453_459 * neg_f_413_low60_40_low20_0 + v_453_459 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_6 * (const 64 (-(2**20))),
    r_453_459 * neg_f_413_low60_40_low20_0 + s_453_459 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_6 + u_453_459 * (const 64 (2**21)) + v_453_459 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_6 + r_453_459 * (const 64 (2**21)) + s_453_459 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_6,
    neg_f_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_6,
    neg_g_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 459)) <=s delta, delta <=s (const 64 (1 + 2*459)),
    (const 64 (-(2**20))) <=s u_453_459, u_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_459, v_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_459, r_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_459, s_453_459 <=s (const 64 ((2**20))),
    u_453_459 + v_453_459 <=s (const 64 (2**20)),
    u_453_459 - v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 + v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 - v_453_459 <=s (const 64 (2**20)),
    r_453_459 + s_453_459 <=s (const 64 (2**20)),
    r_453_459 - s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 + s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 - s_453_459 <=s (const 64 (2**20)),
    u_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_453_459 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step459

// premise a
assume
neg_g_413_low60_40_low20_6 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_6 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_7 neg_f_413_low60_40_low20_6;
mov u_453_460 u_453_459;
mov v_453_460 v_453_459;

asr neg_g_413_low60_40_low20_7 neg_g_413_low60_40_low20_6 1;
asr r_453_460 r_453_459 1;
asr s_453_460 s_453_459 1;
assert
    true
&&
    neg_f_413_low60_40_low20_7 = neg_f_413_low60_40_low20_6,
    u_453_460 = u_453_459,
    v_453_460 = v_453_459,
    neg_g_413_low60_40_low20_7 * (const 64 2) = neg_g_413_low60_40_low20_6,
    r_453_460 * (const 64 2) = r_453_459,
    s_453_460 * (const 64 2) = s_453_459
;

assume
    neg_f_413_low60_40_low20_7 = neg_f_413_low60_40_low20_6,
    u_453_460 = u_453_459,
    v_453_460 = v_453_459,
    neg_g_413_low60_40_low20_7 * 2 = neg_g_413_low60_40_low20_6,
    r_453_460 * 2 = r_453_459,
    s_453_460 * 2 = s_453_459
&&
    true
;

{
    u_453_460 * neg_f_413_low60_40_low20_0 + v_453_460 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_460 * neg_f_413_low60_40_low20_0 + s_453_460 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_7 + u_453_460 * (const 64 (2**21)) + v_453_460 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_7 + r_453_460 * (const 64 (2**21)) + s_453_460 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_7,
    neg_f_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_7,
    neg_g_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 460)) <=s delta, delta <=s (const 64 (1 + 2*460)),
    (const 64 (-(2**20))) <=s u_453_460, u_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_460, v_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_460, r_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_460, s_453_460 <=s (const 64 ((2**20))),
    u_453_460 + v_453_460 <=s (const 64 (2**20)),
    u_453_460 - v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 + v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 - v_453_460 <=s (const 64 (2**20)),
    r_453_460 + s_453_460 <=s (const 64 (2**20)),
    r_453_460 - s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 + s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 - s_453_460 <=s (const 64 (2**20)),
    u_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_453_460 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_459_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_6,
sint64 neg_g_413_low60_40_low20_6,
sint64 neg_f_413_low60_40_low20_7,
sint64 neg_g_413_low60_40_low20_7,
sint64 u_453_459,
sint64 v_453_459,
sint64 r_453_459,
sint64 s_453_459,
sint64 u_453_460,
sint64 v_453_460,
sint64 r_453_460,
sint64 s_453_460,
bit ne
)={
    u_453_459 * neg_f_413_low60_40_low20_0 + v_453_459 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_6 * (-(2**20)),
    r_453_459 * neg_f_413_low60_40_low20_0 + s_453_459 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_6 * (-(2**20))
&&
    u_453_459 * neg_f_413_low60_40_low20_0 + v_453_459 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_6 * (const 64 (-(2**20))),
    r_453_459 * neg_f_413_low60_40_low20_0 + s_453_459 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_6 + u_453_459 * (const 64 (2**21)) + v_453_459 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_6 + r_453_459 * (const 64 (2**21)) + s_453_459 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_6,
    neg_f_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_6,
    neg_g_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 459)) <=s delta, delta <=s (const 64 (1 + 2*459)),
    (const 64 (-(2**20))) <=s u_453_459, u_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_459, v_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_459, r_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_459, s_453_459 <=s (const 64 ((2**20))),
    u_453_459 + v_453_459 <=s (const 64 (2**20)),
    u_453_459 - v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 + v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 - v_453_459 <=s (const 64 (2**20)),
    r_453_459 + s_453_459 <=s (const 64 (2**20)),
    r_453_459 - s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 + s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 - s_453_459 <=s (const 64 (2**20)),
    u_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_453_459 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step459

// premise b
assume
neg_g_413_low60_40_low20_6 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_7 neg_f_413_low60_40_low20_6;
mov u_453_460 u_453_459;
mov v_453_460 v_453_459;

add neg_g_413_low60_40_low20_7 neg_g_413_low60_40_low20_6 neg_f_413_low60_40_low20_6;
asr neg_g_413_low60_40_low20_7 neg_g_413_low60_40_low20_7 1;
add r_453_460 r_453_459 u_453_459;
asr r_453_460 r_453_460 1;
add s_453_460 s_453_459 v_453_459;
asr s_453_460 s_453_460 1;
assert
    true
&&
    neg_f_413_low60_40_low20_7 = neg_f_413_low60_40_low20_6,
    u_453_460 = u_453_459,
    v_453_460 = v_453_459,
    neg_g_413_low60_40_low20_7 * (const 64 2) = neg_g_413_low60_40_low20_6 + neg_f_413_low60_40_low20_6,
    r_453_460 * (const 64 2) = r_453_459 + u_453_459,
    s_453_460 * (const 64 2) = s_453_459 + v_453_459
;

assume
    neg_f_413_low60_40_low20_7 = neg_f_413_low60_40_low20_6,
    u_453_460 = u_453_459,
    v_453_460 = v_453_459,
    neg_g_413_low60_40_low20_7 * 2 = neg_g_413_low60_40_low20_6 + neg_f_413_low60_40_low20_6,
    r_453_460 * 2 = r_453_459 + u_453_459,
    s_453_460 * 2 = s_453_459 + v_453_459
&&
    true
;

{
    u_453_460 * neg_f_413_low60_40_low20_0 + v_453_460 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_460 * neg_f_413_low60_40_low20_0 + s_453_460 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_7 + u_453_460 * (const 64 (2**21)) + v_453_460 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_7 + r_453_460 * (const 64 (2**21)) + s_453_460 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_7,
    neg_f_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_7,
    neg_g_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 460)) <=s delta, delta <=s (const 64 (1 + 2*460)),
    (const 64 (-(2**20))) <=s u_453_460, u_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_460, v_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_460, r_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_460, s_453_460 <=s (const 64 ((2**20))),
    u_453_460 + v_453_460 <=s (const 64 (2**20)),
    u_453_460 - v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 + v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 - v_453_460 <=s (const 64 (2**20)),
    r_453_460 + s_453_460 <=s (const 64 (2**20)),
    r_453_460 - s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 + s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 - s_453_460 <=s (const 64 (2**20)),
    u_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_453_460 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_459_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_6,
sint64 neg_g_413_low60_40_low20_6,
sint64 neg_f_413_low60_40_low20_7,
sint64 neg_g_413_low60_40_low20_7,
sint64 u_453_459,
sint64 v_453_459,
sint64 r_453_459,
sint64 s_453_459,
sint64 u_453_460,
sint64 v_453_460,
sint64 r_453_460,
sint64 s_453_460,
bit ne
)={
    u_453_459 * neg_f_413_low60_40_low20_0 + v_453_459 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_6 * (-(2**20)),
    r_453_459 * neg_f_413_low60_40_low20_0 + s_453_459 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_6 * (-(2**20))
&&
    u_453_459 * neg_f_413_low60_40_low20_0 + v_453_459 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_6 * (const 64 (-(2**20))),
    r_453_459 * neg_f_413_low60_40_low20_0 + s_453_459 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_6 + u_453_459 * (const 64 (2**21)) + v_453_459 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_6 + r_453_459 * (const 64 (2**21)) + s_453_459 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_6,
    neg_f_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_6,
    neg_g_413_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 459)) <=s delta, delta <=s (const 64 (1 + 2*459)),
    (const 64 (-(2**20))) <=s u_453_459, u_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_459, v_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_459, r_453_459 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_459, s_453_459 <=s (const 64 ((2**20))),
    u_453_459 + v_453_459 <=s (const 64 (2**20)),
    u_453_459 - v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 + v_453_459 <=s (const 64 (2**20)),
    (const 64 0) - u_453_459 - v_453_459 <=s (const 64 (2**20)),
    r_453_459 + s_453_459 <=s (const 64 (2**20)),
    r_453_459 - s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 + s_453_459 <=s (const 64 (2**20)),
    (const 64 0) - r_453_459 - s_453_459 <=s (const 64 (2**20)),
    u_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_453_459 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_453_459 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step459

// premise c
assume
neg_g_413_low60_40_low20_6 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_7 neg_g_413_low60_40_low20_6;
mov u_453_460 r_453_459;
mov v_453_460 s_453_459;

subs dc neg_g_413_low60_40_low20_7 neg_g_413_low60_40_low20_6 neg_f_413_low60_40_low20_6;
asr neg_g_413_low60_40_low20_7 neg_g_413_low60_40_low20_7 1;
subs dc r_453_460 r_453_459 u_453_459;
asr r_453_460 r_453_460 1;
subs dc s_453_460 s_453_459 v_453_459;
asr s_453_460 s_453_460 1;
assert
    true
&&
    neg_f_413_low60_40_low20_7 = neg_g_413_low60_40_low20_6,
    u_453_460 = r_453_459,
    v_453_460 = s_453_459,
    neg_g_413_low60_40_low20_7 * (const 64 2) = neg_g_413_low60_40_low20_6 - neg_f_413_low60_40_low20_6,
    r_453_460 * (const 64 2) = r_453_459 - u_453_459,
    s_453_460 * (const 64 2) = s_453_459 - v_453_459
;

assume
    neg_f_413_low60_40_low20_7 = neg_g_413_low60_40_low20_6,
    u_453_460 = r_453_459,
    v_453_460 = s_453_459,
    neg_g_413_low60_40_low20_7 * 2 = neg_g_413_low60_40_low20_6 - neg_f_413_low60_40_low20_6,
    r_453_460 * 2 = r_453_459 - u_453_459,
    s_453_460 * 2 = s_453_459 - v_453_459
&&
    true
;

{
    u_453_460 * neg_f_413_low60_40_low20_0 + v_453_460 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_460 * neg_f_413_low60_40_low20_0 + s_453_460 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_7 + u_453_460 * (const 64 (2**21)) + v_453_460 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_7 + r_453_460 * (const 64 (2**21)) + s_453_460 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_7,
    neg_f_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_7,
    neg_g_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 460)) <=s delta, delta <=s (const 64 (1 + 2*460)),
    (const 64 (-(2**20))) <=s u_453_460, u_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_460, v_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_460, r_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_460, s_453_460 <=s (const 64 ((2**20))),
    u_453_460 + v_453_460 <=s (const 64 (2**20)),
    u_453_460 - v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 + v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 - v_453_460 <=s (const 64 (2**20)),
    r_453_460 + s_453_460 <=s (const 64 (2**20)),
    r_453_460 - s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 + s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 - s_453_460 <=s (const 64 (2**20)),
    u_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_453_460 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_460_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_7,
sint64 neg_g_413_low60_40_low20_7,
sint64 neg_f_413_low60_40_low20_8,
sint64 neg_g_413_low60_40_low20_8,
sint64 u_453_460,
sint64 v_453_460,
sint64 r_453_460,
sint64 s_453_460,
sint64 u_453_461,
sint64 v_453_461,
sint64 r_453_461,
sint64 s_453_461,
bit ne
)={
    u_453_460 * neg_f_413_low60_40_low20_0 + v_453_460 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_7 * (-(2**20)),
    r_453_460 * neg_f_413_low60_40_low20_0 + s_453_460 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_7 * (-(2**20))
&&
    u_453_460 * neg_f_413_low60_40_low20_0 + v_453_460 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_7 * (const 64 (-(2**20))),
    r_453_460 * neg_f_413_low60_40_low20_0 + s_453_460 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_7 + u_453_460 * (const 64 (2**21)) + v_453_460 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_7 + r_453_460 * (const 64 (2**21)) + s_453_460 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_7,
    neg_f_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_7,
    neg_g_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 460)) <=s delta, delta <=s (const 64 (1 + 2*460)),
    (const 64 (-(2**20))) <=s u_453_460, u_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_460, v_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_460, r_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_460, s_453_460 <=s (const 64 ((2**20))),
    u_453_460 + v_453_460 <=s (const 64 (2**20)),
    u_453_460 - v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 + v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 - v_453_460 <=s (const 64 (2**20)),
    r_453_460 + s_453_460 <=s (const 64 (2**20)),
    r_453_460 - s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 + s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 - s_453_460 <=s (const 64 (2**20)),
    u_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_453_460 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step460

// premise a
assume
neg_g_413_low60_40_low20_7 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_7 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_8 neg_f_413_low60_40_low20_7;
mov u_453_461 u_453_460;
mov v_453_461 v_453_460;

asr neg_g_413_low60_40_low20_8 neg_g_413_low60_40_low20_7 1;
asr r_453_461 r_453_460 1;
asr s_453_461 s_453_460 1;
assert
    true
&&
    neg_f_413_low60_40_low20_8 = neg_f_413_low60_40_low20_7,
    u_453_461 = u_453_460,
    v_453_461 = v_453_460,
    neg_g_413_low60_40_low20_8 * (const 64 2) = neg_g_413_low60_40_low20_7,
    r_453_461 * (const 64 2) = r_453_460,
    s_453_461 * (const 64 2) = s_453_460
;

assume
    neg_f_413_low60_40_low20_8 = neg_f_413_low60_40_low20_7,
    u_453_461 = u_453_460,
    v_453_461 = v_453_460,
    neg_g_413_low60_40_low20_8 * 2 = neg_g_413_low60_40_low20_7,
    r_453_461 * 2 = r_453_460,
    s_453_461 * 2 = s_453_460
&&
    true
;

{
    u_453_461 * neg_f_413_low60_40_low20_0 + v_453_461 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_461 * neg_f_413_low60_40_low20_0 + s_453_461 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_8 + u_453_461 * (const 64 (2**21)) + v_453_461 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_8 + r_453_461 * (const 64 (2**21)) + s_453_461 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_8,
    neg_f_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_8,
    neg_g_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 461)) <=s delta, delta <=s (const 64 (1 + 2*461)),
    (const 64 (-(2**20))) <=s u_453_461, u_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_461, v_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_461, r_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_461, s_453_461 <=s (const 64 ((2**20))),
    u_453_461 + v_453_461 <=s (const 64 (2**20)),
    u_453_461 - v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 + v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 - v_453_461 <=s (const 64 (2**20)),
    r_453_461 + s_453_461 <=s (const 64 (2**20)),
    r_453_461 - s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 + s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 - s_453_461 <=s (const 64 (2**20)),
    u_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_453_461 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_460_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_7,
sint64 neg_g_413_low60_40_low20_7,
sint64 neg_f_413_low60_40_low20_8,
sint64 neg_g_413_low60_40_low20_8,
sint64 u_453_460,
sint64 v_453_460,
sint64 r_453_460,
sint64 s_453_460,
sint64 u_453_461,
sint64 v_453_461,
sint64 r_453_461,
sint64 s_453_461,
bit ne
)={
    u_453_460 * neg_f_413_low60_40_low20_0 + v_453_460 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_7 * (-(2**20)),
    r_453_460 * neg_f_413_low60_40_low20_0 + s_453_460 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_7 * (-(2**20))
&&
    u_453_460 * neg_f_413_low60_40_low20_0 + v_453_460 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_7 * (const 64 (-(2**20))),
    r_453_460 * neg_f_413_low60_40_low20_0 + s_453_460 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_7 + u_453_460 * (const 64 (2**21)) + v_453_460 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_7 + r_453_460 * (const 64 (2**21)) + s_453_460 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_7,
    neg_f_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_7,
    neg_g_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 460)) <=s delta, delta <=s (const 64 (1 + 2*460)),
    (const 64 (-(2**20))) <=s u_453_460, u_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_460, v_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_460, r_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_460, s_453_460 <=s (const 64 ((2**20))),
    u_453_460 + v_453_460 <=s (const 64 (2**20)),
    u_453_460 - v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 + v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 - v_453_460 <=s (const 64 (2**20)),
    r_453_460 + s_453_460 <=s (const 64 (2**20)),
    r_453_460 - s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 + s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 - s_453_460 <=s (const 64 (2**20)),
    u_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_453_460 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step460

// premise b
assume
neg_g_413_low60_40_low20_7 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_8 neg_f_413_low60_40_low20_7;
mov u_453_461 u_453_460;
mov v_453_461 v_453_460;

add neg_g_413_low60_40_low20_8 neg_g_413_low60_40_low20_7 neg_f_413_low60_40_low20_7;
asr neg_g_413_low60_40_low20_8 neg_g_413_low60_40_low20_8 1;
add r_453_461 r_453_460 u_453_460;
asr r_453_461 r_453_461 1;
add s_453_461 s_453_460 v_453_460;
asr s_453_461 s_453_461 1;
assert
    true
&&
    neg_f_413_low60_40_low20_8 = neg_f_413_low60_40_low20_7,
    u_453_461 = u_453_460,
    v_453_461 = v_453_460,
    neg_g_413_low60_40_low20_8 * (const 64 2) = neg_g_413_low60_40_low20_7 + neg_f_413_low60_40_low20_7,
    r_453_461 * (const 64 2) = r_453_460 + u_453_460,
    s_453_461 * (const 64 2) = s_453_460 + v_453_460
;

assume
    neg_f_413_low60_40_low20_8 = neg_f_413_low60_40_low20_7,
    u_453_461 = u_453_460,
    v_453_461 = v_453_460,
    neg_g_413_low60_40_low20_8 * 2 = neg_g_413_low60_40_low20_7 + neg_f_413_low60_40_low20_7,
    r_453_461 * 2 = r_453_460 + u_453_460,
    s_453_461 * 2 = s_453_460 + v_453_460
&&
    true
;

{
    u_453_461 * neg_f_413_low60_40_low20_0 + v_453_461 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_461 * neg_f_413_low60_40_low20_0 + s_453_461 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_8 + u_453_461 * (const 64 (2**21)) + v_453_461 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_8 + r_453_461 * (const 64 (2**21)) + s_453_461 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_8,
    neg_f_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_8,
    neg_g_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 461)) <=s delta, delta <=s (const 64 (1 + 2*461)),
    (const 64 (-(2**20))) <=s u_453_461, u_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_461, v_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_461, r_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_461, s_453_461 <=s (const 64 ((2**20))),
    u_453_461 + v_453_461 <=s (const 64 (2**20)),
    u_453_461 - v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 + v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 - v_453_461 <=s (const 64 (2**20)),
    r_453_461 + s_453_461 <=s (const 64 (2**20)),
    r_453_461 - s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 + s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 - s_453_461 <=s (const 64 (2**20)),
    u_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_453_461 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_460_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_7,
sint64 neg_g_413_low60_40_low20_7,
sint64 neg_f_413_low60_40_low20_8,
sint64 neg_g_413_low60_40_low20_8,
sint64 u_453_460,
sint64 v_453_460,
sint64 r_453_460,
sint64 s_453_460,
sint64 u_453_461,
sint64 v_453_461,
sint64 r_453_461,
sint64 s_453_461,
bit ne
)={
    u_453_460 * neg_f_413_low60_40_low20_0 + v_453_460 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_7 * (-(2**20)),
    r_453_460 * neg_f_413_low60_40_low20_0 + s_453_460 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_7 * (-(2**20))
&&
    u_453_460 * neg_f_413_low60_40_low20_0 + v_453_460 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_7 * (const 64 (-(2**20))),
    r_453_460 * neg_f_413_low60_40_low20_0 + s_453_460 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_7 + u_453_460 * (const 64 (2**21)) + v_453_460 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_7 + r_453_460 * (const 64 (2**21)) + s_453_460 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_7,
    neg_f_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_7,
    neg_g_413_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 460)) <=s delta, delta <=s (const 64 (1 + 2*460)),
    (const 64 (-(2**20))) <=s u_453_460, u_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_460, v_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_460, r_453_460 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_460, s_453_460 <=s (const 64 ((2**20))),
    u_453_460 + v_453_460 <=s (const 64 (2**20)),
    u_453_460 - v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 + v_453_460 <=s (const 64 (2**20)),
    (const 64 0) - u_453_460 - v_453_460 <=s (const 64 (2**20)),
    r_453_460 + s_453_460 <=s (const 64 (2**20)),
    r_453_460 - s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 + s_453_460 <=s (const 64 (2**20)),
    (const 64 0) - r_453_460 - s_453_460 <=s (const 64 (2**20)),
    u_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_453_460 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_453_460 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step460

// premise c
assume
neg_g_413_low60_40_low20_7 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_8 neg_g_413_low60_40_low20_7;
mov u_453_461 r_453_460;
mov v_453_461 s_453_460;

subs dc neg_g_413_low60_40_low20_8 neg_g_413_low60_40_low20_7 neg_f_413_low60_40_low20_7;
asr neg_g_413_low60_40_low20_8 neg_g_413_low60_40_low20_8 1;
subs dc r_453_461 r_453_460 u_453_460;
asr r_453_461 r_453_461 1;
subs dc s_453_461 s_453_460 v_453_460;
asr s_453_461 s_453_461 1;
assert
    true
&&
    neg_f_413_low60_40_low20_8 = neg_g_413_low60_40_low20_7,
    u_453_461 = r_453_460,
    v_453_461 = s_453_460,
    neg_g_413_low60_40_low20_8 * (const 64 2) = neg_g_413_low60_40_low20_7 - neg_f_413_low60_40_low20_7,
    r_453_461 * (const 64 2) = r_453_460 - u_453_460,
    s_453_461 * (const 64 2) = s_453_460 - v_453_460
;

assume
    neg_f_413_low60_40_low20_8 = neg_g_413_low60_40_low20_7,
    u_453_461 = r_453_460,
    v_453_461 = s_453_460,
    neg_g_413_low60_40_low20_8 * 2 = neg_g_413_low60_40_low20_7 - neg_f_413_low60_40_low20_7,
    r_453_461 * 2 = r_453_460 - u_453_460,
    s_453_461 * 2 = s_453_460 - v_453_460
&&
    true
;

{
    u_453_461 * neg_f_413_low60_40_low20_0 + v_453_461 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_461 * neg_f_413_low60_40_low20_0 + s_453_461 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_8 + u_453_461 * (const 64 (2**21)) + v_453_461 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_8 + r_453_461 * (const 64 (2**21)) + s_453_461 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_8,
    neg_f_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_8,
    neg_g_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 461)) <=s delta, delta <=s (const 64 (1 + 2*461)),
    (const 64 (-(2**20))) <=s u_453_461, u_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_461, v_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_461, r_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_461, s_453_461 <=s (const 64 ((2**20))),
    u_453_461 + v_453_461 <=s (const 64 (2**20)),
    u_453_461 - v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 + v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 - v_453_461 <=s (const 64 (2**20)),
    r_453_461 + s_453_461 <=s (const 64 (2**20)),
    r_453_461 - s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 + s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 - s_453_461 <=s (const 64 (2**20)),
    u_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_453_461 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_461_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_8,
sint64 neg_g_413_low60_40_low20_8,
sint64 neg_f_413_low60_40_low20_9,
sint64 neg_g_413_low60_40_low20_9,
sint64 u_453_461,
sint64 v_453_461,
sint64 r_453_461,
sint64 s_453_461,
sint64 u_453_462,
sint64 v_453_462,
sint64 r_453_462,
sint64 s_453_462,
bit ne
)={
    u_453_461 * neg_f_413_low60_40_low20_0 + v_453_461 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_8 * (-(2**20)),
    r_453_461 * neg_f_413_low60_40_low20_0 + s_453_461 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_8 * (-(2**20))
&&
    u_453_461 * neg_f_413_low60_40_low20_0 + v_453_461 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_8 * (const 64 (-(2**20))),
    r_453_461 * neg_f_413_low60_40_low20_0 + s_453_461 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_8 + u_453_461 * (const 64 (2**21)) + v_453_461 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_8 + r_453_461 * (const 64 (2**21)) + s_453_461 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_8,
    neg_f_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_8,
    neg_g_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 461)) <=s delta, delta <=s (const 64 (1 + 2*461)),
    (const 64 (-(2**20))) <=s u_453_461, u_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_461, v_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_461, r_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_461, s_453_461 <=s (const 64 ((2**20))),
    u_453_461 + v_453_461 <=s (const 64 (2**20)),
    u_453_461 - v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 + v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 - v_453_461 <=s (const 64 (2**20)),
    r_453_461 + s_453_461 <=s (const 64 (2**20)),
    r_453_461 - s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 + s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 - s_453_461 <=s (const 64 (2**20)),
    u_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_453_461 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step461

// premise a
assume
neg_g_413_low60_40_low20_8 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_8 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_9 neg_f_413_low60_40_low20_8;
mov u_453_462 u_453_461;
mov v_453_462 v_453_461;

asr neg_g_413_low60_40_low20_9 neg_g_413_low60_40_low20_8 1;
asr r_453_462 r_453_461 1;
asr s_453_462 s_453_461 1;
assert
    true
&&
    neg_f_413_low60_40_low20_9 = neg_f_413_low60_40_low20_8,
    u_453_462 = u_453_461,
    v_453_462 = v_453_461,
    neg_g_413_low60_40_low20_9 * (const 64 2) = neg_g_413_low60_40_low20_8,
    r_453_462 * (const 64 2) = r_453_461,
    s_453_462 * (const 64 2) = s_453_461
;

assume
    neg_f_413_low60_40_low20_9 = neg_f_413_low60_40_low20_8,
    u_453_462 = u_453_461,
    v_453_462 = v_453_461,
    neg_g_413_low60_40_low20_9 * 2 = neg_g_413_low60_40_low20_8,
    r_453_462 * 2 = r_453_461,
    s_453_462 * 2 = s_453_461
&&
    true
;

{
    u_453_462 * neg_f_413_low60_40_low20_0 + v_453_462 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_462 * neg_f_413_low60_40_low20_0 + s_453_462 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_9 + u_453_462 * (const 64 (2**21)) + v_453_462 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_9 + r_453_462 * (const 64 (2**21)) + s_453_462 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_9,
    neg_f_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_9,
    neg_g_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 462)) <=s delta, delta <=s (const 64 (1 + 2*462)),
    (const 64 (-(2**20))) <=s u_453_462, u_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_462, v_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_462, r_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_462, s_453_462 <=s (const 64 ((2**20))),
    u_453_462 + v_453_462 <=s (const 64 (2**20)),
    u_453_462 - v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 + v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 - v_453_462 <=s (const 64 (2**20)),
    r_453_462 + s_453_462 <=s (const 64 (2**20)),
    r_453_462 - s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 + s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 - s_453_462 <=s (const 64 (2**20)),
    u_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_453_462 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_461_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_8,
sint64 neg_g_413_low60_40_low20_8,
sint64 neg_f_413_low60_40_low20_9,
sint64 neg_g_413_low60_40_low20_9,
sint64 u_453_461,
sint64 v_453_461,
sint64 r_453_461,
sint64 s_453_461,
sint64 u_453_462,
sint64 v_453_462,
sint64 r_453_462,
sint64 s_453_462,
bit ne
)={
    u_453_461 * neg_f_413_low60_40_low20_0 + v_453_461 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_8 * (-(2**20)),
    r_453_461 * neg_f_413_low60_40_low20_0 + s_453_461 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_8 * (-(2**20))
&&
    u_453_461 * neg_f_413_low60_40_low20_0 + v_453_461 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_8 * (const 64 (-(2**20))),
    r_453_461 * neg_f_413_low60_40_low20_0 + s_453_461 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_8 + u_453_461 * (const 64 (2**21)) + v_453_461 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_8 + r_453_461 * (const 64 (2**21)) + s_453_461 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_8,
    neg_f_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_8,
    neg_g_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 461)) <=s delta, delta <=s (const 64 (1 + 2*461)),
    (const 64 (-(2**20))) <=s u_453_461, u_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_461, v_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_461, r_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_461, s_453_461 <=s (const 64 ((2**20))),
    u_453_461 + v_453_461 <=s (const 64 (2**20)),
    u_453_461 - v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 + v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 - v_453_461 <=s (const 64 (2**20)),
    r_453_461 + s_453_461 <=s (const 64 (2**20)),
    r_453_461 - s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 + s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 - s_453_461 <=s (const 64 (2**20)),
    u_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_453_461 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step461

// premise b
assume
neg_g_413_low60_40_low20_8 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_9 neg_f_413_low60_40_low20_8;
mov u_453_462 u_453_461;
mov v_453_462 v_453_461;

add neg_g_413_low60_40_low20_9 neg_g_413_low60_40_low20_8 neg_f_413_low60_40_low20_8;
asr neg_g_413_low60_40_low20_9 neg_g_413_low60_40_low20_9 1;
add r_453_462 r_453_461 u_453_461;
asr r_453_462 r_453_462 1;
add s_453_462 s_453_461 v_453_461;
asr s_453_462 s_453_462 1;
assert
    true
&&
    neg_f_413_low60_40_low20_9 = neg_f_413_low60_40_low20_8,
    u_453_462 = u_453_461,
    v_453_462 = v_453_461,
    neg_g_413_low60_40_low20_9 * (const 64 2) = neg_g_413_low60_40_low20_8 + neg_f_413_low60_40_low20_8,
    r_453_462 * (const 64 2) = r_453_461 + u_453_461,
    s_453_462 * (const 64 2) = s_453_461 + v_453_461
;

assume
    neg_f_413_low60_40_low20_9 = neg_f_413_low60_40_low20_8,
    u_453_462 = u_453_461,
    v_453_462 = v_453_461,
    neg_g_413_low60_40_low20_9 * 2 = neg_g_413_low60_40_low20_8 + neg_f_413_low60_40_low20_8,
    r_453_462 * 2 = r_453_461 + u_453_461,
    s_453_462 * 2 = s_453_461 + v_453_461
&&
    true
;

{
    u_453_462 * neg_f_413_low60_40_low20_0 + v_453_462 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_462 * neg_f_413_low60_40_low20_0 + s_453_462 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_9 + u_453_462 * (const 64 (2**21)) + v_453_462 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_9 + r_453_462 * (const 64 (2**21)) + s_453_462 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_9,
    neg_f_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_9,
    neg_g_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 462)) <=s delta, delta <=s (const 64 (1 + 2*462)),
    (const 64 (-(2**20))) <=s u_453_462, u_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_462, v_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_462, r_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_462, s_453_462 <=s (const 64 ((2**20))),
    u_453_462 + v_453_462 <=s (const 64 (2**20)),
    u_453_462 - v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 + v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 - v_453_462 <=s (const 64 (2**20)),
    r_453_462 + s_453_462 <=s (const 64 (2**20)),
    r_453_462 - s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 + s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 - s_453_462 <=s (const 64 (2**20)),
    u_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_453_462 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_461_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_8,
sint64 neg_g_413_low60_40_low20_8,
sint64 neg_f_413_low60_40_low20_9,
sint64 neg_g_413_low60_40_low20_9,
sint64 u_453_461,
sint64 v_453_461,
sint64 r_453_461,
sint64 s_453_461,
sint64 u_453_462,
sint64 v_453_462,
sint64 r_453_462,
sint64 s_453_462,
bit ne
)={
    u_453_461 * neg_f_413_low60_40_low20_0 + v_453_461 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_8 * (-(2**20)),
    r_453_461 * neg_f_413_low60_40_low20_0 + s_453_461 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_8 * (-(2**20))
&&
    u_453_461 * neg_f_413_low60_40_low20_0 + v_453_461 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_8 * (const 64 (-(2**20))),
    r_453_461 * neg_f_413_low60_40_low20_0 + s_453_461 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_8 + u_453_461 * (const 64 (2**21)) + v_453_461 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_8 + r_453_461 * (const 64 (2**21)) + s_453_461 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_8,
    neg_f_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_8,
    neg_g_413_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 461)) <=s delta, delta <=s (const 64 (1 + 2*461)),
    (const 64 (-(2**20))) <=s u_453_461, u_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_461, v_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_461, r_453_461 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_461, s_453_461 <=s (const 64 ((2**20))),
    u_453_461 + v_453_461 <=s (const 64 (2**20)),
    u_453_461 - v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 + v_453_461 <=s (const 64 (2**20)),
    (const 64 0) - u_453_461 - v_453_461 <=s (const 64 (2**20)),
    r_453_461 + s_453_461 <=s (const 64 (2**20)),
    r_453_461 - s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 + s_453_461 <=s (const 64 (2**20)),
    (const 64 0) - r_453_461 - s_453_461 <=s (const 64 (2**20)),
    u_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_453_461 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_453_461 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step461

// premise c
assume
neg_g_413_low60_40_low20_8 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_9 neg_g_413_low60_40_low20_8;
mov u_453_462 r_453_461;
mov v_453_462 s_453_461;

subs dc neg_g_413_low60_40_low20_9 neg_g_413_low60_40_low20_8 neg_f_413_low60_40_low20_8;
asr neg_g_413_low60_40_low20_9 neg_g_413_low60_40_low20_9 1;
subs dc r_453_462 r_453_461 u_453_461;
asr r_453_462 r_453_462 1;
subs dc s_453_462 s_453_461 v_453_461;
asr s_453_462 s_453_462 1;
assert
    true
&&
    neg_f_413_low60_40_low20_9 = neg_g_413_low60_40_low20_8,
    u_453_462 = r_453_461,
    v_453_462 = s_453_461,
    neg_g_413_low60_40_low20_9 * (const 64 2) = neg_g_413_low60_40_low20_8 - neg_f_413_low60_40_low20_8,
    r_453_462 * (const 64 2) = r_453_461 - u_453_461,
    s_453_462 * (const 64 2) = s_453_461 - v_453_461
;

assume
    neg_f_413_low60_40_low20_9 = neg_g_413_low60_40_low20_8,
    u_453_462 = r_453_461,
    v_453_462 = s_453_461,
    neg_g_413_low60_40_low20_9 * 2 = neg_g_413_low60_40_low20_8 - neg_f_413_low60_40_low20_8,
    r_453_462 * 2 = r_453_461 - u_453_461,
    s_453_462 * 2 = s_453_461 - v_453_461
&&
    true
;

{
    u_453_462 * neg_f_413_low60_40_low20_0 + v_453_462 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_462 * neg_f_413_low60_40_low20_0 + s_453_462 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_9 + u_453_462 * (const 64 (2**21)) + v_453_462 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_9 + r_453_462 * (const 64 (2**21)) + s_453_462 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_9,
    neg_f_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_9,
    neg_g_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 462)) <=s delta, delta <=s (const 64 (1 + 2*462)),
    (const 64 (-(2**20))) <=s u_453_462, u_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_462, v_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_462, r_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_462, s_453_462 <=s (const 64 ((2**20))),
    u_453_462 + v_453_462 <=s (const 64 (2**20)),
    u_453_462 - v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 + v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 - v_453_462 <=s (const 64 (2**20)),
    r_453_462 + s_453_462 <=s (const 64 (2**20)),
    r_453_462 - s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 + s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 - s_453_462 <=s (const 64 (2**20)),
    u_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_453_462 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_462_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_9,
sint64 neg_g_413_low60_40_low20_9,
sint64 neg_f_413_low60_40_low20_10,
sint64 neg_g_413_low60_40_low20_10,
sint64 u_453_462,
sint64 v_453_462,
sint64 r_453_462,
sint64 s_453_462,
sint64 u_453_463,
sint64 v_453_463,
sint64 r_453_463,
sint64 s_453_463,
bit ne
)={
    u_453_462 * neg_f_413_low60_40_low20_0 + v_453_462 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_9 * (-(2**20)),
    r_453_462 * neg_f_413_low60_40_low20_0 + s_453_462 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_9 * (-(2**20))
&&
    u_453_462 * neg_f_413_low60_40_low20_0 + v_453_462 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_9 * (const 64 (-(2**20))),
    r_453_462 * neg_f_413_low60_40_low20_0 + s_453_462 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_9 + u_453_462 * (const 64 (2**21)) + v_453_462 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_9 + r_453_462 * (const 64 (2**21)) + s_453_462 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_9,
    neg_f_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_9,
    neg_g_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 462)) <=s delta, delta <=s (const 64 (1 + 2*462)),
    (const 64 (-(2**20))) <=s u_453_462, u_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_462, v_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_462, r_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_462, s_453_462 <=s (const 64 ((2**20))),
    u_453_462 + v_453_462 <=s (const 64 (2**20)),
    u_453_462 - v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 + v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 - v_453_462 <=s (const 64 (2**20)),
    r_453_462 + s_453_462 <=s (const 64 (2**20)),
    r_453_462 - s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 + s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 - s_453_462 <=s (const 64 (2**20)),
    u_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_453_462 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step462

// premise a
assume
neg_g_413_low60_40_low20_9 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_9 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_10 neg_f_413_low60_40_low20_9;
mov u_453_463 u_453_462;
mov v_453_463 v_453_462;

asr neg_g_413_low60_40_low20_10 neg_g_413_low60_40_low20_9 1;
asr r_453_463 r_453_462 1;
asr s_453_463 s_453_462 1;
assert
    true
&&
    neg_f_413_low60_40_low20_10 = neg_f_413_low60_40_low20_9,
    u_453_463 = u_453_462,
    v_453_463 = v_453_462,
    neg_g_413_low60_40_low20_10 * (const 64 2) = neg_g_413_low60_40_low20_9,
    r_453_463 * (const 64 2) = r_453_462,
    s_453_463 * (const 64 2) = s_453_462
;

assume
    neg_f_413_low60_40_low20_10 = neg_f_413_low60_40_low20_9,
    u_453_463 = u_453_462,
    v_453_463 = v_453_462,
    neg_g_413_low60_40_low20_10 * 2 = neg_g_413_low60_40_low20_9,
    r_453_463 * 2 = r_453_462,
    s_453_463 * 2 = s_453_462
&&
    true
;

{
    u_453_463 * neg_f_413_low60_40_low20_0 + v_453_463 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_463 * neg_f_413_low60_40_low20_0 + s_453_463 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_10 + u_453_463 * (const 64 (2**21)) + v_453_463 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_10 + r_453_463 * (const 64 (2**21)) + s_453_463 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_10,
    neg_f_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_10,
    neg_g_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 463)) <=s delta, delta <=s (const 64 (1 + 2*463)),
    (const 64 (-(2**20))) <=s u_453_463, u_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_463, v_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_463, r_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_463, s_453_463 <=s (const 64 ((2**20))),
    u_453_463 + v_453_463 <=s (const 64 (2**20)),
    u_453_463 - v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 + v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 - v_453_463 <=s (const 64 (2**20)),
    r_453_463 + s_453_463 <=s (const 64 (2**20)),
    r_453_463 - s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 + s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 - s_453_463 <=s (const 64 (2**20)),
    u_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_453_463 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_462_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_9,
sint64 neg_g_413_low60_40_low20_9,
sint64 neg_f_413_low60_40_low20_10,
sint64 neg_g_413_low60_40_low20_10,
sint64 u_453_462,
sint64 v_453_462,
sint64 r_453_462,
sint64 s_453_462,
sint64 u_453_463,
sint64 v_453_463,
sint64 r_453_463,
sint64 s_453_463,
bit ne
)={
    u_453_462 * neg_f_413_low60_40_low20_0 + v_453_462 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_9 * (-(2**20)),
    r_453_462 * neg_f_413_low60_40_low20_0 + s_453_462 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_9 * (-(2**20))
&&
    u_453_462 * neg_f_413_low60_40_low20_0 + v_453_462 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_9 * (const 64 (-(2**20))),
    r_453_462 * neg_f_413_low60_40_low20_0 + s_453_462 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_9 + u_453_462 * (const 64 (2**21)) + v_453_462 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_9 + r_453_462 * (const 64 (2**21)) + s_453_462 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_9,
    neg_f_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_9,
    neg_g_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 462)) <=s delta, delta <=s (const 64 (1 + 2*462)),
    (const 64 (-(2**20))) <=s u_453_462, u_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_462, v_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_462, r_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_462, s_453_462 <=s (const 64 ((2**20))),
    u_453_462 + v_453_462 <=s (const 64 (2**20)),
    u_453_462 - v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 + v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 - v_453_462 <=s (const 64 (2**20)),
    r_453_462 + s_453_462 <=s (const 64 (2**20)),
    r_453_462 - s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 + s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 - s_453_462 <=s (const 64 (2**20)),
    u_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_453_462 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step462

// premise b
assume
neg_g_413_low60_40_low20_9 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_10 neg_f_413_low60_40_low20_9;
mov u_453_463 u_453_462;
mov v_453_463 v_453_462;

add neg_g_413_low60_40_low20_10 neg_g_413_low60_40_low20_9 neg_f_413_low60_40_low20_9;
asr neg_g_413_low60_40_low20_10 neg_g_413_low60_40_low20_10 1;
add r_453_463 r_453_462 u_453_462;
asr r_453_463 r_453_463 1;
add s_453_463 s_453_462 v_453_462;
asr s_453_463 s_453_463 1;
assert
    true
&&
    neg_f_413_low60_40_low20_10 = neg_f_413_low60_40_low20_9,
    u_453_463 = u_453_462,
    v_453_463 = v_453_462,
    neg_g_413_low60_40_low20_10 * (const 64 2) = neg_g_413_low60_40_low20_9 + neg_f_413_low60_40_low20_9,
    r_453_463 * (const 64 2) = r_453_462 + u_453_462,
    s_453_463 * (const 64 2) = s_453_462 + v_453_462
;

assume
    neg_f_413_low60_40_low20_10 = neg_f_413_low60_40_low20_9,
    u_453_463 = u_453_462,
    v_453_463 = v_453_462,
    neg_g_413_low60_40_low20_10 * 2 = neg_g_413_low60_40_low20_9 + neg_f_413_low60_40_low20_9,
    r_453_463 * 2 = r_453_462 + u_453_462,
    s_453_463 * 2 = s_453_462 + v_453_462
&&
    true
;

{
    u_453_463 * neg_f_413_low60_40_low20_0 + v_453_463 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_463 * neg_f_413_low60_40_low20_0 + s_453_463 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_10 + u_453_463 * (const 64 (2**21)) + v_453_463 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_10 + r_453_463 * (const 64 (2**21)) + s_453_463 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_10,
    neg_f_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_10,
    neg_g_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 463)) <=s delta, delta <=s (const 64 (1 + 2*463)),
    (const 64 (-(2**20))) <=s u_453_463, u_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_463, v_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_463, r_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_463, s_453_463 <=s (const 64 ((2**20))),
    u_453_463 + v_453_463 <=s (const 64 (2**20)),
    u_453_463 - v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 + v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 - v_453_463 <=s (const 64 (2**20)),
    r_453_463 + s_453_463 <=s (const 64 (2**20)),
    r_453_463 - s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 + s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 - s_453_463 <=s (const 64 (2**20)),
    u_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_453_463 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_462_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_9,
sint64 neg_g_413_low60_40_low20_9,
sint64 neg_f_413_low60_40_low20_10,
sint64 neg_g_413_low60_40_low20_10,
sint64 u_453_462,
sint64 v_453_462,
sint64 r_453_462,
sint64 s_453_462,
sint64 u_453_463,
sint64 v_453_463,
sint64 r_453_463,
sint64 s_453_463,
bit ne
)={
    u_453_462 * neg_f_413_low60_40_low20_0 + v_453_462 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_9 * (-(2**20)),
    r_453_462 * neg_f_413_low60_40_low20_0 + s_453_462 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_9 * (-(2**20))
&&
    u_453_462 * neg_f_413_low60_40_low20_0 + v_453_462 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_9 * (const 64 (-(2**20))),
    r_453_462 * neg_f_413_low60_40_low20_0 + s_453_462 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_9 + u_453_462 * (const 64 (2**21)) + v_453_462 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_9 + r_453_462 * (const 64 (2**21)) + s_453_462 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_9,
    neg_f_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_9,
    neg_g_413_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 462)) <=s delta, delta <=s (const 64 (1 + 2*462)),
    (const 64 (-(2**20))) <=s u_453_462, u_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_462, v_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_462, r_453_462 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_462, s_453_462 <=s (const 64 ((2**20))),
    u_453_462 + v_453_462 <=s (const 64 (2**20)),
    u_453_462 - v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 + v_453_462 <=s (const 64 (2**20)),
    (const 64 0) - u_453_462 - v_453_462 <=s (const 64 (2**20)),
    r_453_462 + s_453_462 <=s (const 64 (2**20)),
    r_453_462 - s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 + s_453_462 <=s (const 64 (2**20)),
    (const 64 0) - r_453_462 - s_453_462 <=s (const 64 (2**20)),
    u_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_453_462 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_453_462 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step462

// premise c
assume
neg_g_413_low60_40_low20_9 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_10 neg_g_413_low60_40_low20_9;
mov u_453_463 r_453_462;
mov v_453_463 s_453_462;

subs dc neg_g_413_low60_40_low20_10 neg_g_413_low60_40_low20_9 neg_f_413_low60_40_low20_9;
asr neg_g_413_low60_40_low20_10 neg_g_413_low60_40_low20_10 1;
subs dc r_453_463 r_453_462 u_453_462;
asr r_453_463 r_453_463 1;
subs dc s_453_463 s_453_462 v_453_462;
asr s_453_463 s_453_463 1;
assert
    true
&&
    neg_f_413_low60_40_low20_10 = neg_g_413_low60_40_low20_9,
    u_453_463 = r_453_462,
    v_453_463 = s_453_462,
    neg_g_413_low60_40_low20_10 * (const 64 2) = neg_g_413_low60_40_low20_9 - neg_f_413_low60_40_low20_9,
    r_453_463 * (const 64 2) = r_453_462 - u_453_462,
    s_453_463 * (const 64 2) = s_453_462 - v_453_462
;

assume
    neg_f_413_low60_40_low20_10 = neg_g_413_low60_40_low20_9,
    u_453_463 = r_453_462,
    v_453_463 = s_453_462,
    neg_g_413_low60_40_low20_10 * 2 = neg_g_413_low60_40_low20_9 - neg_f_413_low60_40_low20_9,
    r_453_463 * 2 = r_453_462 - u_453_462,
    s_453_463 * 2 = s_453_462 - v_453_462
&&
    true
;

{
    u_453_463 * neg_f_413_low60_40_low20_0 + v_453_463 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_463 * neg_f_413_low60_40_low20_0 + s_453_463 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_10 + u_453_463 * (const 64 (2**21)) + v_453_463 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_10 + r_453_463 * (const 64 (2**21)) + s_453_463 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_10,
    neg_f_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_10,
    neg_g_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 463)) <=s delta, delta <=s (const 64 (1 + 2*463)),
    (const 64 (-(2**20))) <=s u_453_463, u_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_463, v_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_463, r_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_463, s_453_463 <=s (const 64 ((2**20))),
    u_453_463 + v_453_463 <=s (const 64 (2**20)),
    u_453_463 - v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 + v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 - v_453_463 <=s (const 64 (2**20)),
    r_453_463 + s_453_463 <=s (const 64 (2**20)),
    r_453_463 - s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 + s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 - s_453_463 <=s (const 64 (2**20)),
    u_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_453_463 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_463_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_10,
sint64 neg_g_413_low60_40_low20_10,
sint64 neg_f_413_low60_40_low20_11,
sint64 neg_g_413_low60_40_low20_11,
sint64 u_453_463,
sint64 v_453_463,
sint64 r_453_463,
sint64 s_453_463,
sint64 u_453_464,
sint64 v_453_464,
sint64 r_453_464,
sint64 s_453_464,
bit ne
)={
    u_453_463 * neg_f_413_low60_40_low20_0 + v_453_463 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_10 * (-(2**20)),
    r_453_463 * neg_f_413_low60_40_low20_0 + s_453_463 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_10 * (-(2**20))
&&
    u_453_463 * neg_f_413_low60_40_low20_0 + v_453_463 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_10 * (const 64 (-(2**20))),
    r_453_463 * neg_f_413_low60_40_low20_0 + s_453_463 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_10 + u_453_463 * (const 64 (2**21)) + v_453_463 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_10 + r_453_463 * (const 64 (2**21)) + s_453_463 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_10,
    neg_f_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_10,
    neg_g_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 463)) <=s delta, delta <=s (const 64 (1 + 2*463)),
    (const 64 (-(2**20))) <=s u_453_463, u_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_463, v_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_463, r_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_463, s_453_463 <=s (const 64 ((2**20))),
    u_453_463 + v_453_463 <=s (const 64 (2**20)),
    u_453_463 - v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 + v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 - v_453_463 <=s (const 64 (2**20)),
    r_453_463 + s_453_463 <=s (const 64 (2**20)),
    r_453_463 - s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 + s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 - s_453_463 <=s (const 64 (2**20)),
    u_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_453_463 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step463

// premise a
assume
neg_g_413_low60_40_low20_10 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_10 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_11 neg_f_413_low60_40_low20_10;
mov u_453_464 u_453_463;
mov v_453_464 v_453_463;

asr neg_g_413_low60_40_low20_11 neg_g_413_low60_40_low20_10 1;
asr r_453_464 r_453_463 1;
asr s_453_464 s_453_463 1;
assert
    true
&&
    neg_f_413_low60_40_low20_11 = neg_f_413_low60_40_low20_10,
    u_453_464 = u_453_463,
    v_453_464 = v_453_463,
    neg_g_413_low60_40_low20_11 * (const 64 2) = neg_g_413_low60_40_low20_10,
    r_453_464 * (const 64 2) = r_453_463,
    s_453_464 * (const 64 2) = s_453_463
;

assume
    neg_f_413_low60_40_low20_11 = neg_f_413_low60_40_low20_10,
    u_453_464 = u_453_463,
    v_453_464 = v_453_463,
    neg_g_413_low60_40_low20_11 * 2 = neg_g_413_low60_40_low20_10,
    r_453_464 * 2 = r_453_463,
    s_453_464 * 2 = s_453_463
&&
    true
;

{
    u_453_464 * neg_f_413_low60_40_low20_0 + v_453_464 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_464 * neg_f_413_low60_40_low20_0 + s_453_464 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_11 + u_453_464 * (const 64 (2**21)) + v_453_464 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_11 + r_453_464 * (const 64 (2**21)) + s_453_464 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_11,
    neg_f_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_11,
    neg_g_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 464)) <=s delta, delta <=s (const 64 (1 + 2*464)),
    (const 64 (-(2**20))) <=s u_453_464, u_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_464, v_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_464, r_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_464, s_453_464 <=s (const 64 ((2**20))),
    u_453_464 + v_453_464 <=s (const 64 (2**20)),
    u_453_464 - v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 + v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 - v_453_464 <=s (const 64 (2**20)),
    r_453_464 + s_453_464 <=s (const 64 (2**20)),
    r_453_464 - s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 + s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 - s_453_464 <=s (const 64 (2**20)),
    u_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_453_464 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_463_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_10,
sint64 neg_g_413_low60_40_low20_10,
sint64 neg_f_413_low60_40_low20_11,
sint64 neg_g_413_low60_40_low20_11,
sint64 u_453_463,
sint64 v_453_463,
sint64 r_453_463,
sint64 s_453_463,
sint64 u_453_464,
sint64 v_453_464,
sint64 r_453_464,
sint64 s_453_464,
bit ne
)={
    u_453_463 * neg_f_413_low60_40_low20_0 + v_453_463 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_10 * (-(2**20)),
    r_453_463 * neg_f_413_low60_40_low20_0 + s_453_463 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_10 * (-(2**20))
&&
    u_453_463 * neg_f_413_low60_40_low20_0 + v_453_463 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_10 * (const 64 (-(2**20))),
    r_453_463 * neg_f_413_low60_40_low20_0 + s_453_463 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_10 + u_453_463 * (const 64 (2**21)) + v_453_463 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_10 + r_453_463 * (const 64 (2**21)) + s_453_463 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_10,
    neg_f_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_10,
    neg_g_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 463)) <=s delta, delta <=s (const 64 (1 + 2*463)),
    (const 64 (-(2**20))) <=s u_453_463, u_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_463, v_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_463, r_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_463, s_453_463 <=s (const 64 ((2**20))),
    u_453_463 + v_453_463 <=s (const 64 (2**20)),
    u_453_463 - v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 + v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 - v_453_463 <=s (const 64 (2**20)),
    r_453_463 + s_453_463 <=s (const 64 (2**20)),
    r_453_463 - s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 + s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 - s_453_463 <=s (const 64 (2**20)),
    u_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_453_463 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step463

// premise b
assume
neg_g_413_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_11 neg_f_413_low60_40_low20_10;
mov u_453_464 u_453_463;
mov v_453_464 v_453_463;

add neg_g_413_low60_40_low20_11 neg_g_413_low60_40_low20_10 neg_f_413_low60_40_low20_10;
asr neg_g_413_low60_40_low20_11 neg_g_413_low60_40_low20_11 1;
add r_453_464 r_453_463 u_453_463;
asr r_453_464 r_453_464 1;
add s_453_464 s_453_463 v_453_463;
asr s_453_464 s_453_464 1;
assert
    true
&&
    neg_f_413_low60_40_low20_11 = neg_f_413_low60_40_low20_10,
    u_453_464 = u_453_463,
    v_453_464 = v_453_463,
    neg_g_413_low60_40_low20_11 * (const 64 2) = neg_g_413_low60_40_low20_10 + neg_f_413_low60_40_low20_10,
    r_453_464 * (const 64 2) = r_453_463 + u_453_463,
    s_453_464 * (const 64 2) = s_453_463 + v_453_463
;

assume
    neg_f_413_low60_40_low20_11 = neg_f_413_low60_40_low20_10,
    u_453_464 = u_453_463,
    v_453_464 = v_453_463,
    neg_g_413_low60_40_low20_11 * 2 = neg_g_413_low60_40_low20_10 + neg_f_413_low60_40_low20_10,
    r_453_464 * 2 = r_453_463 + u_453_463,
    s_453_464 * 2 = s_453_463 + v_453_463
&&
    true
;

{
    u_453_464 * neg_f_413_low60_40_low20_0 + v_453_464 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_464 * neg_f_413_low60_40_low20_0 + s_453_464 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_11 + u_453_464 * (const 64 (2**21)) + v_453_464 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_11 + r_453_464 * (const 64 (2**21)) + s_453_464 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_11,
    neg_f_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_11,
    neg_g_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 464)) <=s delta, delta <=s (const 64 (1 + 2*464)),
    (const 64 (-(2**20))) <=s u_453_464, u_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_464, v_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_464, r_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_464, s_453_464 <=s (const 64 ((2**20))),
    u_453_464 + v_453_464 <=s (const 64 (2**20)),
    u_453_464 - v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 + v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 - v_453_464 <=s (const 64 (2**20)),
    r_453_464 + s_453_464 <=s (const 64 (2**20)),
    r_453_464 - s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 + s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 - s_453_464 <=s (const 64 (2**20)),
    u_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_453_464 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_463_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_10,
sint64 neg_g_413_low60_40_low20_10,
sint64 neg_f_413_low60_40_low20_11,
sint64 neg_g_413_low60_40_low20_11,
sint64 u_453_463,
sint64 v_453_463,
sint64 r_453_463,
sint64 s_453_463,
sint64 u_453_464,
sint64 v_453_464,
sint64 r_453_464,
sint64 s_453_464,
bit ne
)={
    u_453_463 * neg_f_413_low60_40_low20_0 + v_453_463 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_10 * (-(2**20)),
    r_453_463 * neg_f_413_low60_40_low20_0 + s_453_463 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_10 * (-(2**20))
&&
    u_453_463 * neg_f_413_low60_40_low20_0 + v_453_463 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_10 * (const 64 (-(2**20))),
    r_453_463 * neg_f_413_low60_40_low20_0 + s_453_463 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_10 + u_453_463 * (const 64 (2**21)) + v_453_463 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_10 + r_453_463 * (const 64 (2**21)) + s_453_463 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_10,
    neg_f_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_10,
    neg_g_413_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 463)) <=s delta, delta <=s (const 64 (1 + 2*463)),
    (const 64 (-(2**20))) <=s u_453_463, u_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_463, v_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_463, r_453_463 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_463, s_453_463 <=s (const 64 ((2**20))),
    u_453_463 + v_453_463 <=s (const 64 (2**20)),
    u_453_463 - v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 + v_453_463 <=s (const 64 (2**20)),
    (const 64 0) - u_453_463 - v_453_463 <=s (const 64 (2**20)),
    r_453_463 + s_453_463 <=s (const 64 (2**20)),
    r_453_463 - s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 + s_453_463 <=s (const 64 (2**20)),
    (const 64 0) - r_453_463 - s_453_463 <=s (const 64 (2**20)),
    u_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_453_463 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_453_463 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step463

// premise c
assume
neg_g_413_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_11 neg_g_413_low60_40_low20_10;
mov u_453_464 r_453_463;
mov v_453_464 s_453_463;

subs dc neg_g_413_low60_40_low20_11 neg_g_413_low60_40_low20_10 neg_f_413_low60_40_low20_10;
asr neg_g_413_low60_40_low20_11 neg_g_413_low60_40_low20_11 1;
subs dc r_453_464 r_453_463 u_453_463;
asr r_453_464 r_453_464 1;
subs dc s_453_464 s_453_463 v_453_463;
asr s_453_464 s_453_464 1;
assert
    true
&&
    neg_f_413_low60_40_low20_11 = neg_g_413_low60_40_low20_10,
    u_453_464 = r_453_463,
    v_453_464 = s_453_463,
    neg_g_413_low60_40_low20_11 * (const 64 2) = neg_g_413_low60_40_low20_10 - neg_f_413_low60_40_low20_10,
    r_453_464 * (const 64 2) = r_453_463 - u_453_463,
    s_453_464 * (const 64 2) = s_453_463 - v_453_463
;

assume
    neg_f_413_low60_40_low20_11 = neg_g_413_low60_40_low20_10,
    u_453_464 = r_453_463,
    v_453_464 = s_453_463,
    neg_g_413_low60_40_low20_11 * 2 = neg_g_413_low60_40_low20_10 - neg_f_413_low60_40_low20_10,
    r_453_464 * 2 = r_453_463 - u_453_463,
    s_453_464 * 2 = s_453_463 - v_453_463
&&
    true
;

{
    u_453_464 * neg_f_413_low60_40_low20_0 + v_453_464 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_464 * neg_f_413_low60_40_low20_0 + s_453_464 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_11 + u_453_464 * (const 64 (2**21)) + v_453_464 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_11 + r_453_464 * (const 64 (2**21)) + s_453_464 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_11,
    neg_f_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_11,
    neg_g_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 464)) <=s delta, delta <=s (const 64 (1 + 2*464)),
    (const 64 (-(2**20))) <=s u_453_464, u_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_464, v_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_464, r_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_464, s_453_464 <=s (const 64 ((2**20))),
    u_453_464 + v_453_464 <=s (const 64 (2**20)),
    u_453_464 - v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 + v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 - v_453_464 <=s (const 64 (2**20)),
    r_453_464 + s_453_464 <=s (const 64 (2**20)),
    r_453_464 - s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 + s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 - s_453_464 <=s (const 64 (2**20)),
    u_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_453_464 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_464_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_11,
sint64 neg_g_413_low60_40_low20_11,
sint64 neg_f_413_low60_40_low20_12,
sint64 neg_g_413_low60_40_low20_12,
sint64 u_453_464,
sint64 v_453_464,
sint64 r_453_464,
sint64 s_453_464,
sint64 u_453_465,
sint64 v_453_465,
sint64 r_453_465,
sint64 s_453_465,
bit ne
)={
    u_453_464 * neg_f_413_low60_40_low20_0 + v_453_464 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_11 * (-(2**20)),
    r_453_464 * neg_f_413_low60_40_low20_0 + s_453_464 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_11 * (-(2**20))
&&
    u_453_464 * neg_f_413_low60_40_low20_0 + v_453_464 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_11 * (const 64 (-(2**20))),
    r_453_464 * neg_f_413_low60_40_low20_0 + s_453_464 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_11 + u_453_464 * (const 64 (2**21)) + v_453_464 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_11 + r_453_464 * (const 64 (2**21)) + s_453_464 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_11,
    neg_f_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_11,
    neg_g_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 464)) <=s delta, delta <=s (const 64 (1 + 2*464)),
    (const 64 (-(2**20))) <=s u_453_464, u_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_464, v_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_464, r_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_464, s_453_464 <=s (const 64 ((2**20))),
    u_453_464 + v_453_464 <=s (const 64 (2**20)),
    u_453_464 - v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 + v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 - v_453_464 <=s (const 64 (2**20)),
    r_453_464 + s_453_464 <=s (const 64 (2**20)),
    r_453_464 - s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 + s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 - s_453_464 <=s (const 64 (2**20)),
    u_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_453_464 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step464

// premise a
assume
neg_g_413_low60_40_low20_11 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_11 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_12 neg_f_413_low60_40_low20_11;
mov u_453_465 u_453_464;
mov v_453_465 v_453_464;

asr neg_g_413_low60_40_low20_12 neg_g_413_low60_40_low20_11 1;
asr r_453_465 r_453_464 1;
asr s_453_465 s_453_464 1;
assert
    true
&&
    neg_f_413_low60_40_low20_12 = neg_f_413_low60_40_low20_11,
    u_453_465 = u_453_464,
    v_453_465 = v_453_464,
    neg_g_413_low60_40_low20_12 * (const 64 2) = neg_g_413_low60_40_low20_11,
    r_453_465 * (const 64 2) = r_453_464,
    s_453_465 * (const 64 2) = s_453_464
;

assume
    neg_f_413_low60_40_low20_12 = neg_f_413_low60_40_low20_11,
    u_453_465 = u_453_464,
    v_453_465 = v_453_464,
    neg_g_413_low60_40_low20_12 * 2 = neg_g_413_low60_40_low20_11,
    r_453_465 * 2 = r_453_464,
    s_453_465 * 2 = s_453_464
&&
    true
;

{
    u_453_465 * neg_f_413_low60_40_low20_0 + v_453_465 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_465 * neg_f_413_low60_40_low20_0 + s_453_465 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_12 + u_453_465 * (const 64 (2**21)) + v_453_465 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_12 + r_453_465 * (const 64 (2**21)) + s_453_465 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_12,
    neg_f_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_12,
    neg_g_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 465)) <=s delta, delta <=s (const 64 (1 + 2*465)),
    (const 64 (-(2**20))) <=s u_453_465, u_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_465, v_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_465, r_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_465, s_453_465 <=s (const 64 ((2**20))),
    u_453_465 + v_453_465 <=s (const 64 (2**20)),
    u_453_465 - v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 + v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 - v_453_465 <=s (const 64 (2**20)),
    r_453_465 + s_453_465 <=s (const 64 (2**20)),
    r_453_465 - s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 + s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 - s_453_465 <=s (const 64 (2**20)),
    u_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_453_465 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_464_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_11,
sint64 neg_g_413_low60_40_low20_11,
sint64 neg_f_413_low60_40_low20_12,
sint64 neg_g_413_low60_40_low20_12,
sint64 u_453_464,
sint64 v_453_464,
sint64 r_453_464,
sint64 s_453_464,
sint64 u_453_465,
sint64 v_453_465,
sint64 r_453_465,
sint64 s_453_465,
bit ne
)={
    u_453_464 * neg_f_413_low60_40_low20_0 + v_453_464 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_11 * (-(2**20)),
    r_453_464 * neg_f_413_low60_40_low20_0 + s_453_464 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_11 * (-(2**20))
&&
    u_453_464 * neg_f_413_low60_40_low20_0 + v_453_464 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_11 * (const 64 (-(2**20))),
    r_453_464 * neg_f_413_low60_40_low20_0 + s_453_464 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_11 + u_453_464 * (const 64 (2**21)) + v_453_464 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_11 + r_453_464 * (const 64 (2**21)) + s_453_464 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_11,
    neg_f_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_11,
    neg_g_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 464)) <=s delta, delta <=s (const 64 (1 + 2*464)),
    (const 64 (-(2**20))) <=s u_453_464, u_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_464, v_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_464, r_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_464, s_453_464 <=s (const 64 ((2**20))),
    u_453_464 + v_453_464 <=s (const 64 (2**20)),
    u_453_464 - v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 + v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 - v_453_464 <=s (const 64 (2**20)),
    r_453_464 + s_453_464 <=s (const 64 (2**20)),
    r_453_464 - s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 + s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 - s_453_464 <=s (const 64 (2**20)),
    u_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_453_464 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step464

// premise b
assume
neg_g_413_low60_40_low20_11 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_12 neg_f_413_low60_40_low20_11;
mov u_453_465 u_453_464;
mov v_453_465 v_453_464;

add neg_g_413_low60_40_low20_12 neg_g_413_low60_40_low20_11 neg_f_413_low60_40_low20_11;
asr neg_g_413_low60_40_low20_12 neg_g_413_low60_40_low20_12 1;
add r_453_465 r_453_464 u_453_464;
asr r_453_465 r_453_465 1;
add s_453_465 s_453_464 v_453_464;
asr s_453_465 s_453_465 1;
assert
    true
&&
    neg_f_413_low60_40_low20_12 = neg_f_413_low60_40_low20_11,
    u_453_465 = u_453_464,
    v_453_465 = v_453_464,
    neg_g_413_low60_40_low20_12 * (const 64 2) = neg_g_413_low60_40_low20_11 + neg_f_413_low60_40_low20_11,
    r_453_465 * (const 64 2) = r_453_464 + u_453_464,
    s_453_465 * (const 64 2) = s_453_464 + v_453_464
;

assume
    neg_f_413_low60_40_low20_12 = neg_f_413_low60_40_low20_11,
    u_453_465 = u_453_464,
    v_453_465 = v_453_464,
    neg_g_413_low60_40_low20_12 * 2 = neg_g_413_low60_40_low20_11 + neg_f_413_low60_40_low20_11,
    r_453_465 * 2 = r_453_464 + u_453_464,
    s_453_465 * 2 = s_453_464 + v_453_464
&&
    true
;

{
    u_453_465 * neg_f_413_low60_40_low20_0 + v_453_465 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_465 * neg_f_413_low60_40_low20_0 + s_453_465 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_12 + u_453_465 * (const 64 (2**21)) + v_453_465 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_12 + r_453_465 * (const 64 (2**21)) + s_453_465 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_12,
    neg_f_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_12,
    neg_g_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 465)) <=s delta, delta <=s (const 64 (1 + 2*465)),
    (const 64 (-(2**20))) <=s u_453_465, u_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_465, v_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_465, r_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_465, s_453_465 <=s (const 64 ((2**20))),
    u_453_465 + v_453_465 <=s (const 64 (2**20)),
    u_453_465 - v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 + v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 - v_453_465 <=s (const 64 (2**20)),
    r_453_465 + s_453_465 <=s (const 64 (2**20)),
    r_453_465 - s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 + s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 - s_453_465 <=s (const 64 (2**20)),
    u_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_453_465 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_464_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_11,
sint64 neg_g_413_low60_40_low20_11,
sint64 neg_f_413_low60_40_low20_12,
sint64 neg_g_413_low60_40_low20_12,
sint64 u_453_464,
sint64 v_453_464,
sint64 r_453_464,
sint64 s_453_464,
sint64 u_453_465,
sint64 v_453_465,
sint64 r_453_465,
sint64 s_453_465,
bit ne
)={
    u_453_464 * neg_f_413_low60_40_low20_0 + v_453_464 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_11 * (-(2**20)),
    r_453_464 * neg_f_413_low60_40_low20_0 + s_453_464 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_11 * (-(2**20))
&&
    u_453_464 * neg_f_413_low60_40_low20_0 + v_453_464 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_11 * (const 64 (-(2**20))),
    r_453_464 * neg_f_413_low60_40_low20_0 + s_453_464 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_11 + u_453_464 * (const 64 (2**21)) + v_453_464 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_11 + r_453_464 * (const 64 (2**21)) + s_453_464 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_11,
    neg_f_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_11,
    neg_g_413_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 464)) <=s delta, delta <=s (const 64 (1 + 2*464)),
    (const 64 (-(2**20))) <=s u_453_464, u_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_464, v_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_464, r_453_464 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_464, s_453_464 <=s (const 64 ((2**20))),
    u_453_464 + v_453_464 <=s (const 64 (2**20)),
    u_453_464 - v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 + v_453_464 <=s (const 64 (2**20)),
    (const 64 0) - u_453_464 - v_453_464 <=s (const 64 (2**20)),
    r_453_464 + s_453_464 <=s (const 64 (2**20)),
    r_453_464 - s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 + s_453_464 <=s (const 64 (2**20)),
    (const 64 0) - r_453_464 - s_453_464 <=s (const 64 (2**20)),
    u_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_453_464 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_453_464 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step464

// premise c
assume
neg_g_413_low60_40_low20_11 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_12 neg_g_413_low60_40_low20_11;
mov u_453_465 r_453_464;
mov v_453_465 s_453_464;

subs dc neg_g_413_low60_40_low20_12 neg_g_413_low60_40_low20_11 neg_f_413_low60_40_low20_11;
asr neg_g_413_low60_40_low20_12 neg_g_413_low60_40_low20_12 1;
subs dc r_453_465 r_453_464 u_453_464;
asr r_453_465 r_453_465 1;
subs dc s_453_465 s_453_464 v_453_464;
asr s_453_465 s_453_465 1;
assert
    true
&&
    neg_f_413_low60_40_low20_12 = neg_g_413_low60_40_low20_11,
    u_453_465 = r_453_464,
    v_453_465 = s_453_464,
    neg_g_413_low60_40_low20_12 * (const 64 2) = neg_g_413_low60_40_low20_11 - neg_f_413_low60_40_low20_11,
    r_453_465 * (const 64 2) = r_453_464 - u_453_464,
    s_453_465 * (const 64 2) = s_453_464 - v_453_464
;

assume
    neg_f_413_low60_40_low20_12 = neg_g_413_low60_40_low20_11,
    u_453_465 = r_453_464,
    v_453_465 = s_453_464,
    neg_g_413_low60_40_low20_12 * 2 = neg_g_413_low60_40_low20_11 - neg_f_413_low60_40_low20_11,
    r_453_465 * 2 = r_453_464 - u_453_464,
    s_453_465 * 2 = s_453_464 - v_453_464
&&
    true
;

{
    u_453_465 * neg_f_413_low60_40_low20_0 + v_453_465 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_465 * neg_f_413_low60_40_low20_0 + s_453_465 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_12 + u_453_465 * (const 64 (2**21)) + v_453_465 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_12 + r_453_465 * (const 64 (2**21)) + s_453_465 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_12,
    neg_f_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_12,
    neg_g_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 465)) <=s delta, delta <=s (const 64 (1 + 2*465)),
    (const 64 (-(2**20))) <=s u_453_465, u_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_465, v_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_465, r_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_465, s_453_465 <=s (const 64 ((2**20))),
    u_453_465 + v_453_465 <=s (const 64 (2**20)),
    u_453_465 - v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 + v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 - v_453_465 <=s (const 64 (2**20)),
    r_453_465 + s_453_465 <=s (const 64 (2**20)),
    r_453_465 - s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 + s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 - s_453_465 <=s (const 64 (2**20)),
    u_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_453_465 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_465_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_12,
sint64 neg_g_413_low60_40_low20_12,
sint64 neg_f_413_low60_40_low20_13,
sint64 neg_g_413_low60_40_low20_13,
sint64 u_453_465,
sint64 v_453_465,
sint64 r_453_465,
sint64 s_453_465,
sint64 u_453_466,
sint64 v_453_466,
sint64 r_453_466,
sint64 s_453_466,
bit ne
)={
    u_453_465 * neg_f_413_low60_40_low20_0 + v_453_465 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_12 * (-(2**20)),
    r_453_465 * neg_f_413_low60_40_low20_0 + s_453_465 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_12 * (-(2**20))
&&
    u_453_465 * neg_f_413_low60_40_low20_0 + v_453_465 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_12 * (const 64 (-(2**20))),
    r_453_465 * neg_f_413_low60_40_low20_0 + s_453_465 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_12 + u_453_465 * (const 64 (2**21)) + v_453_465 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_12 + r_453_465 * (const 64 (2**21)) + s_453_465 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_12,
    neg_f_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_12,
    neg_g_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 465)) <=s delta, delta <=s (const 64 (1 + 2*465)),
    (const 64 (-(2**20))) <=s u_453_465, u_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_465, v_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_465, r_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_465, s_453_465 <=s (const 64 ((2**20))),
    u_453_465 + v_453_465 <=s (const 64 (2**20)),
    u_453_465 - v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 + v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 - v_453_465 <=s (const 64 (2**20)),
    r_453_465 + s_453_465 <=s (const 64 (2**20)),
    r_453_465 - s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 + s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 - s_453_465 <=s (const 64 (2**20)),
    u_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_453_465 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step465

// premise a
assume
neg_g_413_low60_40_low20_12 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_12 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_13 neg_f_413_low60_40_low20_12;
mov u_453_466 u_453_465;
mov v_453_466 v_453_465;

asr neg_g_413_low60_40_low20_13 neg_g_413_low60_40_low20_12 1;
asr r_453_466 r_453_465 1;
asr s_453_466 s_453_465 1;
assert
    true
&&
    neg_f_413_low60_40_low20_13 = neg_f_413_low60_40_low20_12,
    u_453_466 = u_453_465,
    v_453_466 = v_453_465,
    neg_g_413_low60_40_low20_13 * (const 64 2) = neg_g_413_low60_40_low20_12,
    r_453_466 * (const 64 2) = r_453_465,
    s_453_466 * (const 64 2) = s_453_465
;

assume
    neg_f_413_low60_40_low20_13 = neg_f_413_low60_40_low20_12,
    u_453_466 = u_453_465,
    v_453_466 = v_453_465,
    neg_g_413_low60_40_low20_13 * 2 = neg_g_413_low60_40_low20_12,
    r_453_466 * 2 = r_453_465,
    s_453_466 * 2 = s_453_465
&&
    true
;

{
    u_453_466 * neg_f_413_low60_40_low20_0 + v_453_466 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_466 * neg_f_413_low60_40_low20_0 + s_453_466 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_13 + u_453_466 * (const 64 (2**21)) + v_453_466 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_13 + r_453_466 * (const 64 (2**21)) + s_453_466 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_13,
    neg_f_413_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_13,
    neg_g_413_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
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

proc divstep_465_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_12,
sint64 neg_g_413_low60_40_low20_12,
sint64 neg_f_413_low60_40_low20_13,
sint64 neg_g_413_low60_40_low20_13,
sint64 u_453_465,
sint64 v_453_465,
sint64 r_453_465,
sint64 s_453_465,
sint64 u_453_466,
sint64 v_453_466,
sint64 r_453_466,
sint64 s_453_466,
bit ne
)={
    u_453_465 * neg_f_413_low60_40_low20_0 + v_453_465 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_12 * (-(2**20)),
    r_453_465 * neg_f_413_low60_40_low20_0 + s_453_465 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_12 * (-(2**20))
&&
    u_453_465 * neg_f_413_low60_40_low20_0 + v_453_465 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_12 * (const 64 (-(2**20))),
    r_453_465 * neg_f_413_low60_40_low20_0 + s_453_465 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_12 + u_453_465 * (const 64 (2**21)) + v_453_465 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_12 + r_453_465 * (const 64 (2**21)) + s_453_465 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_12,
    neg_f_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_12,
    neg_g_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 465)) <=s delta, delta <=s (const 64 (1 + 2*465)),
    (const 64 (-(2**20))) <=s u_453_465, u_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_465, v_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_465, r_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_465, s_453_465 <=s (const 64 ((2**20))),
    u_453_465 + v_453_465 <=s (const 64 (2**20)),
    u_453_465 - v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 + v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 - v_453_465 <=s (const 64 (2**20)),
    r_453_465 + s_453_465 <=s (const 64 (2**20)),
    r_453_465 - s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 + s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 - s_453_465 <=s (const 64 (2**20)),
    u_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_453_465 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step465

// premise b
assume
neg_g_413_low60_40_low20_12 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_13 neg_f_413_low60_40_low20_12;
mov u_453_466 u_453_465;
mov v_453_466 v_453_465;

add neg_g_413_low60_40_low20_13 neg_g_413_low60_40_low20_12 neg_f_413_low60_40_low20_12;
asr neg_g_413_low60_40_low20_13 neg_g_413_low60_40_low20_13 1;
add r_453_466 r_453_465 u_453_465;
asr r_453_466 r_453_466 1;
add s_453_466 s_453_465 v_453_465;
asr s_453_466 s_453_466 1;
assert
    true
&&
    neg_f_413_low60_40_low20_13 = neg_f_413_low60_40_low20_12,
    u_453_466 = u_453_465,
    v_453_466 = v_453_465,
    neg_g_413_low60_40_low20_13 * (const 64 2) = neg_g_413_low60_40_low20_12 + neg_f_413_low60_40_low20_12,
    r_453_466 * (const 64 2) = r_453_465 + u_453_465,
    s_453_466 * (const 64 2) = s_453_465 + v_453_465
;

assume
    neg_f_413_low60_40_low20_13 = neg_f_413_low60_40_low20_12,
    u_453_466 = u_453_465,
    v_453_466 = v_453_465,
    neg_g_413_low60_40_low20_13 * 2 = neg_g_413_low60_40_low20_12 + neg_f_413_low60_40_low20_12,
    r_453_466 * 2 = r_453_465 + u_453_465,
    s_453_466 * 2 = s_453_465 + v_453_465
&&
    true
;

{
    u_453_466 * neg_f_413_low60_40_low20_0 + v_453_466 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_466 * neg_f_413_low60_40_low20_0 + s_453_466 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_13 + u_453_466 * (const 64 (2**21)) + v_453_466 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_13 + r_453_466 * (const 64 (2**21)) + s_453_466 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_13,
    neg_f_413_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_13,
    neg_g_413_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
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

proc divstep_465_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_12,
sint64 neg_g_413_low60_40_low20_12,
sint64 neg_f_413_low60_40_low20_13,
sint64 neg_g_413_low60_40_low20_13,
sint64 u_453_465,
sint64 v_453_465,
sint64 r_453_465,
sint64 s_453_465,
sint64 u_453_466,
sint64 v_453_466,
sint64 r_453_466,
sint64 s_453_466,
bit ne
)={
    u_453_465 * neg_f_413_low60_40_low20_0 + v_453_465 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_12 * (-(2**20)),
    r_453_465 * neg_f_413_low60_40_low20_0 + s_453_465 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_12 * (-(2**20))
&&
    u_453_465 * neg_f_413_low60_40_low20_0 + v_453_465 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_12 * (const 64 (-(2**20))),
    r_453_465 * neg_f_413_low60_40_low20_0 + s_453_465 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_12 + u_453_465 * (const 64 (2**21)) + v_453_465 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_12 + r_453_465 * (const 64 (2**21)) + s_453_465 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_12,
    neg_f_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_12,
    neg_g_413_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 465)) <=s delta, delta <=s (const 64 (1 + 2*465)),
    (const 64 (-(2**20))) <=s u_453_465, u_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_465, v_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_465, r_453_465 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_465, s_453_465 <=s (const 64 ((2**20))),
    u_453_465 + v_453_465 <=s (const 64 (2**20)),
    u_453_465 - v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 + v_453_465 <=s (const 64 (2**20)),
    (const 64 0) - u_453_465 - v_453_465 <=s (const 64 (2**20)),
    r_453_465 + s_453_465 <=s (const 64 (2**20)),
    r_453_465 - s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 + s_453_465 <=s (const 64 (2**20)),
    (const 64 0) - r_453_465 - s_453_465 <=s (const 64 (2**20)),
    u_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_453_465 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_453_465 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step465

// premise c
assume
neg_g_413_low60_40_low20_12 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_13 neg_g_413_low60_40_low20_12;
mov u_453_466 r_453_465;
mov v_453_466 s_453_465;

subs dc neg_g_413_low60_40_low20_13 neg_g_413_low60_40_low20_12 neg_f_413_low60_40_low20_12;
asr neg_g_413_low60_40_low20_13 neg_g_413_low60_40_low20_13 1;
subs dc r_453_466 r_453_465 u_453_465;
asr r_453_466 r_453_466 1;
subs dc s_453_466 s_453_465 v_453_465;
asr s_453_466 s_453_466 1;
assert
    true
&&
    neg_f_413_low60_40_low20_13 = neg_g_413_low60_40_low20_12,
    u_453_466 = r_453_465,
    v_453_466 = s_453_465,
    neg_g_413_low60_40_low20_13 * (const 64 2) = neg_g_413_low60_40_low20_12 - neg_f_413_low60_40_low20_12,
    r_453_466 * (const 64 2) = r_453_465 - u_453_465,
    s_453_466 * (const 64 2) = s_453_465 - v_453_465
;

assume
    neg_f_413_low60_40_low20_13 = neg_g_413_low60_40_low20_12,
    u_453_466 = r_453_465,
    v_453_466 = s_453_465,
    neg_g_413_low60_40_low20_13 * 2 = neg_g_413_low60_40_low20_12 - neg_f_413_low60_40_low20_12,
    r_453_466 * 2 = r_453_465 - u_453_465,
    s_453_466 * 2 = s_453_465 - v_453_465
&&
    true
;

{
    u_453_466 * neg_f_413_low60_40_low20_0 + v_453_466 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_466 * neg_f_413_low60_40_low20_0 + s_453_466 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_13 + u_453_466 * (const 64 (2**21)) + v_453_466 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_13 + r_453_466 * (const 64 (2**21)) + s_453_466 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_13,
    neg_f_413_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_13,
    neg_g_413_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
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

proc divstep_466_a (
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

// premise a
assume
neg_g_413_low60_40_low20_13 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_13 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_14 neg_f_413_low60_40_low20_13;
mov u_453_467 u_453_466;
mov v_453_467 v_453_466;

asr neg_g_413_low60_40_low20_14 neg_g_413_low60_40_low20_13 1;
asr r_453_467 r_453_466 1;
asr s_453_467 s_453_466 1;
assert
    true
&&
    neg_f_413_low60_40_low20_14 = neg_f_413_low60_40_low20_13,
    u_453_467 = u_453_466,
    v_453_467 = v_453_466,
    neg_g_413_low60_40_low20_14 * (const 64 2) = neg_g_413_low60_40_low20_13,
    r_453_467 * (const 64 2) = r_453_466,
    s_453_467 * (const 64 2) = s_453_466
;

assume
    neg_f_413_low60_40_low20_14 = neg_f_413_low60_40_low20_13,
    u_453_467 = u_453_466,
    v_453_467 = v_453_466,
    neg_g_413_low60_40_low20_14 * 2 = neg_g_413_low60_40_low20_13,
    r_453_467 * 2 = r_453_466,
    s_453_467 * 2 = s_453_466
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

proc divstep_466_c (
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

// premise c
assume
neg_g_413_low60_40_low20_13 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_14 neg_g_413_low60_40_low20_13;
mov u_453_467 r_453_466;
mov v_453_467 s_453_466;

subs dc neg_g_413_low60_40_low20_14 neg_g_413_low60_40_low20_13 neg_f_413_low60_40_low20_13;
asr neg_g_413_low60_40_low20_14 neg_g_413_low60_40_low20_14 1;
subs dc r_453_467 r_453_466 u_453_466;
asr r_453_467 r_453_467 1;
subs dc s_453_467 s_453_466 v_453_466;
asr s_453_467 s_453_467 1;
assert
    true
&&
    neg_f_413_low60_40_low20_14 = neg_g_413_low60_40_low20_13,
    u_453_467 = r_453_466,
    v_453_467 = s_453_466,
    neg_g_413_low60_40_low20_14 * (const 64 2) = neg_g_413_low60_40_low20_13 - neg_f_413_low60_40_low20_13,
    r_453_467 * (const 64 2) = r_453_466 - u_453_466,
    s_453_467 * (const 64 2) = s_453_466 - v_453_466
;

assume
    neg_f_413_low60_40_low20_14 = neg_g_413_low60_40_low20_13,
    u_453_467 = r_453_466,
    v_453_467 = s_453_466,
    neg_g_413_low60_40_low20_14 * 2 = neg_g_413_low60_40_low20_13 - neg_f_413_low60_40_low20_13,
    r_453_467 * 2 = r_453_466 - u_453_466,
    s_453_467 * 2 = s_453_466 - v_453_466
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

proc divstep_467_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_14,
sint64 neg_g_413_low60_40_low20_14,
sint64 neg_f_413_low60_40_low20_15,
sint64 neg_g_413_low60_40_low20_15,
sint64 u_453_467,
sint64 v_453_467,
sint64 r_453_467,
sint64 s_453_467,
sint64 u_453_468,
sint64 v_453_468,
sint64 r_453_468,
sint64 s_453_468,
bit ne
)={
    u_453_467 * neg_f_413_low60_40_low20_0 + v_453_467 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_14 * (-(2**20)),
    r_453_467 * neg_f_413_low60_40_low20_0 + s_453_467 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_14 * (-(2**20))
&&
    u_453_467 * neg_f_413_low60_40_low20_0 + v_453_467 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_14 * (const 64 (-(2**20))),
    r_453_467 * neg_f_413_low60_40_low20_0 + s_453_467 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_14 + u_453_467 * (const 64 (2**21)) + v_453_467 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_14 + r_453_467 * (const 64 (2**21)) + s_453_467 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_14,
    neg_f_413_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_14,
    neg_g_413_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
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



// divsteps
// step467

// premise a
assume
neg_g_413_low60_40_low20_14 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_14 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_15 neg_f_413_low60_40_low20_14;
mov u_453_468 u_453_467;
mov v_453_468 v_453_467;

asr neg_g_413_low60_40_low20_15 neg_g_413_low60_40_low20_14 1;
asr r_453_468 r_453_467 1;
asr s_453_468 s_453_467 1;
assert
    true
&&
    neg_f_413_low60_40_low20_15 = neg_f_413_low60_40_low20_14,
    u_453_468 = u_453_467,
    v_453_468 = v_453_467,
    neg_g_413_low60_40_low20_15 * (const 64 2) = neg_g_413_low60_40_low20_14,
    r_453_468 * (const 64 2) = r_453_467,
    s_453_468 * (const 64 2) = s_453_467
;

assume
    neg_f_413_low60_40_low20_15 = neg_f_413_low60_40_low20_14,
    u_453_468 = u_453_467,
    v_453_468 = v_453_467,
    neg_g_413_low60_40_low20_15 * 2 = neg_g_413_low60_40_low20_14,
    r_453_468 * 2 = r_453_467,
    s_453_468 * 2 = s_453_467
&&
    true
;

{
    u_453_468 * neg_f_413_low60_40_low20_0 + v_453_468 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_468 * neg_f_413_low60_40_low20_0 + s_453_468 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_15 + u_453_468 * (const 64 (2**21)) + v_453_468 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_15 + r_453_468 * (const 64 (2**21)) + s_453_468 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_15,
    neg_f_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_15,
    neg_g_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 468)) <=s delta, delta <=s (const 64 (1 + 2*468)),
    (const 64 (-(2**20))) <=s u_453_468, u_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_468, v_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_468, r_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_468, s_453_468 <=s (const 64 ((2**20))),
    u_453_468 + v_453_468 <=s (const 64 (2**20)),
    u_453_468 - v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 + v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 - v_453_468 <=s (const 64 (2**20)),
    r_453_468 + s_453_468 <=s (const 64 (2**20)),
    r_453_468 - s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 + s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 - s_453_468 <=s (const 64 (2**20)),
    u_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_453_468 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_467_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_14,
sint64 neg_g_413_low60_40_low20_14,
sint64 neg_f_413_low60_40_low20_15,
sint64 neg_g_413_low60_40_low20_15,
sint64 u_453_467,
sint64 v_453_467,
sint64 r_453_467,
sint64 s_453_467,
sint64 u_453_468,
sint64 v_453_468,
sint64 r_453_468,
sint64 s_453_468,
bit ne
)={
    u_453_467 * neg_f_413_low60_40_low20_0 + v_453_467 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_14 * (-(2**20)),
    r_453_467 * neg_f_413_low60_40_low20_0 + s_453_467 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_14 * (-(2**20))
&&
    u_453_467 * neg_f_413_low60_40_low20_0 + v_453_467 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_14 * (const 64 (-(2**20))),
    r_453_467 * neg_f_413_low60_40_low20_0 + s_453_467 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_14 + u_453_467 * (const 64 (2**21)) + v_453_467 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_14 + r_453_467 * (const 64 (2**21)) + s_453_467 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_14,
    neg_f_413_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_14,
    neg_g_413_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
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



// divsteps
// step467

// premise b
assume
neg_g_413_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_15 neg_f_413_low60_40_low20_14;
mov u_453_468 u_453_467;
mov v_453_468 v_453_467;

add neg_g_413_low60_40_low20_15 neg_g_413_low60_40_low20_14 neg_f_413_low60_40_low20_14;
asr neg_g_413_low60_40_low20_15 neg_g_413_low60_40_low20_15 1;
add r_453_468 r_453_467 u_453_467;
asr r_453_468 r_453_468 1;
add s_453_468 s_453_467 v_453_467;
asr s_453_468 s_453_468 1;
assert
    true
&&
    neg_f_413_low60_40_low20_15 = neg_f_413_low60_40_low20_14,
    u_453_468 = u_453_467,
    v_453_468 = v_453_467,
    neg_g_413_low60_40_low20_15 * (const 64 2) = neg_g_413_low60_40_low20_14 + neg_f_413_low60_40_low20_14,
    r_453_468 * (const 64 2) = r_453_467 + u_453_467,
    s_453_468 * (const 64 2) = s_453_467 + v_453_467
;

assume
    neg_f_413_low60_40_low20_15 = neg_f_413_low60_40_low20_14,
    u_453_468 = u_453_467,
    v_453_468 = v_453_467,
    neg_g_413_low60_40_low20_15 * 2 = neg_g_413_low60_40_low20_14 + neg_f_413_low60_40_low20_14,
    r_453_468 * 2 = r_453_467 + u_453_467,
    s_453_468 * 2 = s_453_467 + v_453_467
&&
    true
;

{
    u_453_468 * neg_f_413_low60_40_low20_0 + v_453_468 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_468 * neg_f_413_low60_40_low20_0 + s_453_468 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_15 + u_453_468 * (const 64 (2**21)) + v_453_468 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_15 + r_453_468 * (const 64 (2**21)) + s_453_468 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_15,
    neg_f_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_15,
    neg_g_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 468)) <=s delta, delta <=s (const 64 (1 + 2*468)),
    (const 64 (-(2**20))) <=s u_453_468, u_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_468, v_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_468, r_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_468, s_453_468 <=s (const 64 ((2**20))),
    u_453_468 + v_453_468 <=s (const 64 (2**20)),
    u_453_468 - v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 + v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 - v_453_468 <=s (const 64 (2**20)),
    r_453_468 + s_453_468 <=s (const 64 (2**20)),
    r_453_468 - s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 + s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 - s_453_468 <=s (const 64 (2**20)),
    u_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_453_468 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_467_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_14,
sint64 neg_g_413_low60_40_low20_14,
sint64 neg_f_413_low60_40_low20_15,
sint64 neg_g_413_low60_40_low20_15,
sint64 u_453_467,
sint64 v_453_467,
sint64 r_453_467,
sint64 s_453_467,
sint64 u_453_468,
sint64 v_453_468,
sint64 r_453_468,
sint64 s_453_468,
bit ne
)={
    u_453_467 * neg_f_413_low60_40_low20_0 + v_453_467 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_14 * (-(2**20)),
    r_453_467 * neg_f_413_low60_40_low20_0 + s_453_467 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_14 * (-(2**20))
&&
    u_453_467 * neg_f_413_low60_40_low20_0 + v_453_467 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_14 * (const 64 (-(2**20))),
    r_453_467 * neg_f_413_low60_40_low20_0 + s_453_467 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_14 + u_453_467 * (const 64 (2**21)) + v_453_467 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_14 + r_453_467 * (const 64 (2**21)) + s_453_467 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_14,
    neg_f_413_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_14,
    neg_g_413_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
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



// divsteps
// step467

// premise c
assume
neg_g_413_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_15 neg_g_413_low60_40_low20_14;
mov u_453_468 r_453_467;
mov v_453_468 s_453_467;

subs dc neg_g_413_low60_40_low20_15 neg_g_413_low60_40_low20_14 neg_f_413_low60_40_low20_14;
asr neg_g_413_low60_40_low20_15 neg_g_413_low60_40_low20_15 1;
subs dc r_453_468 r_453_467 u_453_467;
asr r_453_468 r_453_468 1;
subs dc s_453_468 s_453_467 v_453_467;
asr s_453_468 s_453_468 1;
assert
    true
&&
    neg_f_413_low60_40_low20_15 = neg_g_413_low60_40_low20_14,
    u_453_468 = r_453_467,
    v_453_468 = s_453_467,
    neg_g_413_low60_40_low20_15 * (const 64 2) = neg_g_413_low60_40_low20_14 - neg_f_413_low60_40_low20_14,
    r_453_468 * (const 64 2) = r_453_467 - u_453_467,
    s_453_468 * (const 64 2) = s_453_467 - v_453_467
;

assume
    neg_f_413_low60_40_low20_15 = neg_g_413_low60_40_low20_14,
    u_453_468 = r_453_467,
    v_453_468 = s_453_467,
    neg_g_413_low60_40_low20_15 * 2 = neg_g_413_low60_40_low20_14 - neg_f_413_low60_40_low20_14,
    r_453_468 * 2 = r_453_467 - u_453_467,
    s_453_468 * 2 = s_453_467 - v_453_467
&&
    true
;

{
    u_453_468 * neg_f_413_low60_40_low20_0 + v_453_468 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_468 * neg_f_413_low60_40_low20_0 + s_453_468 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_15 + u_453_468 * (const 64 (2**21)) + v_453_468 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_15 + r_453_468 * (const 64 (2**21)) + s_453_468 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_15,
    neg_f_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_15,
    neg_g_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 468)) <=s delta, delta <=s (const 64 (1 + 2*468)),
    (const 64 (-(2**20))) <=s u_453_468, u_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_468, v_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_468, r_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_468, s_453_468 <=s (const 64 ((2**20))),
    u_453_468 + v_453_468 <=s (const 64 (2**20)),
    u_453_468 - v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 + v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 - v_453_468 <=s (const 64 (2**20)),
    r_453_468 + s_453_468 <=s (const 64 (2**20)),
    r_453_468 - s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 + s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 - s_453_468 <=s (const 64 (2**20)),
    u_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_453_468 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_468_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_15,
sint64 neg_g_413_low60_40_low20_15,
sint64 neg_f_413_low60_40_low20_16,
sint64 neg_g_413_low60_40_low20_16,
sint64 u_453_468,
sint64 v_453_468,
sint64 r_453_468,
sint64 s_453_468,
sint64 u_453_469,
sint64 v_453_469,
sint64 r_453_469,
sint64 s_453_469,
bit ne
)={
    u_453_468 * neg_f_413_low60_40_low20_0 + v_453_468 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_15 * (-(2**20)),
    r_453_468 * neg_f_413_low60_40_low20_0 + s_453_468 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_15 * (-(2**20))
&&
    u_453_468 * neg_f_413_low60_40_low20_0 + v_453_468 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_15 * (const 64 (-(2**20))),
    r_453_468 * neg_f_413_low60_40_low20_0 + s_453_468 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_15 + u_453_468 * (const 64 (2**21)) + v_453_468 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_15 + r_453_468 * (const 64 (2**21)) + s_453_468 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_15,
    neg_f_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_15,
    neg_g_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 468)) <=s delta, delta <=s (const 64 (1 + 2*468)),
    (const 64 (-(2**20))) <=s u_453_468, u_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_468, v_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_468, r_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_468, s_453_468 <=s (const 64 ((2**20))),
    u_453_468 + v_453_468 <=s (const 64 (2**20)),
    u_453_468 - v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 + v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 - v_453_468 <=s (const 64 (2**20)),
    r_453_468 + s_453_468 <=s (const 64 (2**20)),
    r_453_468 - s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 + s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 - s_453_468 <=s (const 64 (2**20)),
    u_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_453_468 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step468

// premise a
assume
neg_g_413_low60_40_low20_15 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_15 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_16 neg_f_413_low60_40_low20_15;
mov u_453_469 u_453_468;
mov v_453_469 v_453_468;

asr neg_g_413_low60_40_low20_16 neg_g_413_low60_40_low20_15 1;
asr r_453_469 r_453_468 1;
asr s_453_469 s_453_468 1;
assert
    true
&&
    neg_f_413_low60_40_low20_16 = neg_f_413_low60_40_low20_15,
    u_453_469 = u_453_468,
    v_453_469 = v_453_468,
    neg_g_413_low60_40_low20_16 * (const 64 2) = neg_g_413_low60_40_low20_15,
    r_453_469 * (const 64 2) = r_453_468,
    s_453_469 * (const 64 2) = s_453_468
;

assume
    neg_f_413_low60_40_low20_16 = neg_f_413_low60_40_low20_15,
    u_453_469 = u_453_468,
    v_453_469 = v_453_468,
    neg_g_413_low60_40_low20_16 * 2 = neg_g_413_low60_40_low20_15,
    r_453_469 * 2 = r_453_468,
    s_453_469 * 2 = s_453_468
&&
    true
;

{
    u_453_469 * neg_f_413_low60_40_low20_0 + v_453_469 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_469 * neg_f_413_low60_40_low20_0 + s_453_469 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_16 + u_453_469 * (const 64 (2**21)) + v_453_469 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_16 + r_453_469 * (const 64 (2**21)) + s_453_469 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_16,
    neg_f_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_16,
    neg_g_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 469)) <=s delta, delta <=s (const 64 (1 + 2*469)),
    (const 64 (-(2**20))) <=s u_453_469, u_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_469, v_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_469, r_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_469, s_453_469 <=s (const 64 ((2**20))),
    u_453_469 + v_453_469 <=s (const 64 (2**20)),
    u_453_469 - v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 + v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 - v_453_469 <=s (const 64 (2**20)),
    r_453_469 + s_453_469 <=s (const 64 (2**20)),
    r_453_469 - s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 + s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 - s_453_469 <=s (const 64 (2**20)),
    u_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_453_469 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_468_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_15,
sint64 neg_g_413_low60_40_low20_15,
sint64 neg_f_413_low60_40_low20_16,
sint64 neg_g_413_low60_40_low20_16,
sint64 u_453_468,
sint64 v_453_468,
sint64 r_453_468,
sint64 s_453_468,
sint64 u_453_469,
sint64 v_453_469,
sint64 r_453_469,
sint64 s_453_469,
bit ne
)={
    u_453_468 * neg_f_413_low60_40_low20_0 + v_453_468 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_15 * (-(2**20)),
    r_453_468 * neg_f_413_low60_40_low20_0 + s_453_468 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_15 * (-(2**20))
&&
    u_453_468 * neg_f_413_low60_40_low20_0 + v_453_468 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_15 * (const 64 (-(2**20))),
    r_453_468 * neg_f_413_low60_40_low20_0 + s_453_468 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_15 + u_453_468 * (const 64 (2**21)) + v_453_468 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_15 + r_453_468 * (const 64 (2**21)) + s_453_468 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_15,
    neg_f_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_15,
    neg_g_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 468)) <=s delta, delta <=s (const 64 (1 + 2*468)),
    (const 64 (-(2**20))) <=s u_453_468, u_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_468, v_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_468, r_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_468, s_453_468 <=s (const 64 ((2**20))),
    u_453_468 + v_453_468 <=s (const 64 (2**20)),
    u_453_468 - v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 + v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 - v_453_468 <=s (const 64 (2**20)),
    r_453_468 + s_453_468 <=s (const 64 (2**20)),
    r_453_468 - s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 + s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 - s_453_468 <=s (const 64 (2**20)),
    u_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_453_468 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step468

// premise b
assume
neg_g_413_low60_40_low20_15 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_16 neg_f_413_low60_40_low20_15;
mov u_453_469 u_453_468;
mov v_453_469 v_453_468;

add neg_g_413_low60_40_low20_16 neg_g_413_low60_40_low20_15 neg_f_413_low60_40_low20_15;
asr neg_g_413_low60_40_low20_16 neg_g_413_low60_40_low20_16 1;
add r_453_469 r_453_468 u_453_468;
asr r_453_469 r_453_469 1;
add s_453_469 s_453_468 v_453_468;
asr s_453_469 s_453_469 1;
assert
    true
&&
    neg_f_413_low60_40_low20_16 = neg_f_413_low60_40_low20_15,
    u_453_469 = u_453_468,
    v_453_469 = v_453_468,
    neg_g_413_low60_40_low20_16 * (const 64 2) = neg_g_413_low60_40_low20_15 + neg_f_413_low60_40_low20_15,
    r_453_469 * (const 64 2) = r_453_468 + u_453_468,
    s_453_469 * (const 64 2) = s_453_468 + v_453_468
;

assume
    neg_f_413_low60_40_low20_16 = neg_f_413_low60_40_low20_15,
    u_453_469 = u_453_468,
    v_453_469 = v_453_468,
    neg_g_413_low60_40_low20_16 * 2 = neg_g_413_low60_40_low20_15 + neg_f_413_low60_40_low20_15,
    r_453_469 * 2 = r_453_468 + u_453_468,
    s_453_469 * 2 = s_453_468 + v_453_468
&&
    true
;

{
    u_453_469 * neg_f_413_low60_40_low20_0 + v_453_469 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_469 * neg_f_413_low60_40_low20_0 + s_453_469 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_16 + u_453_469 * (const 64 (2**21)) + v_453_469 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_16 + r_453_469 * (const 64 (2**21)) + s_453_469 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_16,
    neg_f_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_16,
    neg_g_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 469)) <=s delta, delta <=s (const 64 (1 + 2*469)),
    (const 64 (-(2**20))) <=s u_453_469, u_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_469, v_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_469, r_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_469, s_453_469 <=s (const 64 ((2**20))),
    u_453_469 + v_453_469 <=s (const 64 (2**20)),
    u_453_469 - v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 + v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 - v_453_469 <=s (const 64 (2**20)),
    r_453_469 + s_453_469 <=s (const 64 (2**20)),
    r_453_469 - s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 + s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 - s_453_469 <=s (const 64 (2**20)),
    u_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_453_469 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_468_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_15,
sint64 neg_g_413_low60_40_low20_15,
sint64 neg_f_413_low60_40_low20_16,
sint64 neg_g_413_low60_40_low20_16,
sint64 u_453_468,
sint64 v_453_468,
sint64 r_453_468,
sint64 s_453_468,
sint64 u_453_469,
sint64 v_453_469,
sint64 r_453_469,
sint64 s_453_469,
bit ne
)={
    u_453_468 * neg_f_413_low60_40_low20_0 + v_453_468 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_15 * (-(2**20)),
    r_453_468 * neg_f_413_low60_40_low20_0 + s_453_468 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_15 * (-(2**20))
&&
    u_453_468 * neg_f_413_low60_40_low20_0 + v_453_468 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_15 * (const 64 (-(2**20))),
    r_453_468 * neg_f_413_low60_40_low20_0 + s_453_468 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_15 + u_453_468 * (const 64 (2**21)) + v_453_468 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_15 + r_453_468 * (const 64 (2**21)) + s_453_468 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_15,
    neg_f_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_15,
    neg_g_413_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 468)) <=s delta, delta <=s (const 64 (1 + 2*468)),
    (const 64 (-(2**20))) <=s u_453_468, u_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_468, v_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_468, r_453_468 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_468, s_453_468 <=s (const 64 ((2**20))),
    u_453_468 + v_453_468 <=s (const 64 (2**20)),
    u_453_468 - v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 + v_453_468 <=s (const 64 (2**20)),
    (const 64 0) - u_453_468 - v_453_468 <=s (const 64 (2**20)),
    r_453_468 + s_453_468 <=s (const 64 (2**20)),
    r_453_468 - s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 + s_453_468 <=s (const 64 (2**20)),
    (const 64 0) - r_453_468 - s_453_468 <=s (const 64 (2**20)),
    u_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_453_468 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_453_468 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step468

// premise c
assume
neg_g_413_low60_40_low20_15 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_16 neg_g_413_low60_40_low20_15;
mov u_453_469 r_453_468;
mov v_453_469 s_453_468;

subs dc neg_g_413_low60_40_low20_16 neg_g_413_low60_40_low20_15 neg_f_413_low60_40_low20_15;
asr neg_g_413_low60_40_low20_16 neg_g_413_low60_40_low20_16 1;
subs dc r_453_469 r_453_468 u_453_468;
asr r_453_469 r_453_469 1;
subs dc s_453_469 s_453_468 v_453_468;
asr s_453_469 s_453_469 1;
assert
    true
&&
    neg_f_413_low60_40_low20_16 = neg_g_413_low60_40_low20_15,
    u_453_469 = r_453_468,
    v_453_469 = s_453_468,
    neg_g_413_low60_40_low20_16 * (const 64 2) = neg_g_413_low60_40_low20_15 - neg_f_413_low60_40_low20_15,
    r_453_469 * (const 64 2) = r_453_468 - u_453_468,
    s_453_469 * (const 64 2) = s_453_468 - v_453_468
;

assume
    neg_f_413_low60_40_low20_16 = neg_g_413_low60_40_low20_15,
    u_453_469 = r_453_468,
    v_453_469 = s_453_468,
    neg_g_413_low60_40_low20_16 * 2 = neg_g_413_low60_40_low20_15 - neg_f_413_low60_40_low20_15,
    r_453_469 * 2 = r_453_468 - u_453_468,
    s_453_469 * 2 = s_453_468 - v_453_468
&&
    true
;

{
    u_453_469 * neg_f_413_low60_40_low20_0 + v_453_469 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_469 * neg_f_413_low60_40_low20_0 + s_453_469 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_16 + u_453_469 * (const 64 (2**21)) + v_453_469 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_16 + r_453_469 * (const 64 (2**21)) + s_453_469 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_16,
    neg_f_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_16,
    neg_g_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 469)) <=s delta, delta <=s (const 64 (1 + 2*469)),
    (const 64 (-(2**20))) <=s u_453_469, u_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_469, v_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_469, r_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_469, s_453_469 <=s (const 64 ((2**20))),
    u_453_469 + v_453_469 <=s (const 64 (2**20)),
    u_453_469 - v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 + v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 - v_453_469 <=s (const 64 (2**20)),
    r_453_469 + s_453_469 <=s (const 64 (2**20)),
    r_453_469 - s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 + s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 - s_453_469 <=s (const 64 (2**20)),
    u_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_453_469 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_469_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_16,
sint64 neg_g_413_low60_40_low20_16,
sint64 neg_f_413_low60_40_low20_17,
sint64 neg_g_413_low60_40_low20_17,
sint64 u_453_469,
sint64 v_453_469,
sint64 r_453_469,
sint64 s_453_469,
sint64 u_453_470,
sint64 v_453_470,
sint64 r_453_470,
sint64 s_453_470,
bit ne
)={
    u_453_469 * neg_f_413_low60_40_low20_0 + v_453_469 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_16 * (-(2**20)),
    r_453_469 * neg_f_413_low60_40_low20_0 + s_453_469 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_16 * (-(2**20))
&&
    u_453_469 * neg_f_413_low60_40_low20_0 + v_453_469 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_16 * (const 64 (-(2**20))),
    r_453_469 * neg_f_413_low60_40_low20_0 + s_453_469 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_16 + u_453_469 * (const 64 (2**21)) + v_453_469 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_16 + r_453_469 * (const 64 (2**21)) + s_453_469 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_16,
    neg_f_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_16,
    neg_g_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 469)) <=s delta, delta <=s (const 64 (1 + 2*469)),
    (const 64 (-(2**20))) <=s u_453_469, u_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_469, v_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_469, r_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_469, s_453_469 <=s (const 64 ((2**20))),
    u_453_469 + v_453_469 <=s (const 64 (2**20)),
    u_453_469 - v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 + v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 - v_453_469 <=s (const 64 (2**20)),
    r_453_469 + s_453_469 <=s (const 64 (2**20)),
    r_453_469 - s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 + s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 - s_453_469 <=s (const 64 (2**20)),
    u_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_453_469 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step469

// premise a
assume
neg_g_413_low60_40_low20_16 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_16 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_17 neg_f_413_low60_40_low20_16;
mov u_453_470 u_453_469;
mov v_453_470 v_453_469;

asr neg_g_413_low60_40_low20_17 neg_g_413_low60_40_low20_16 1;
asr r_453_470 r_453_469 1;
asr s_453_470 s_453_469 1;
assert
    true
&&
    neg_f_413_low60_40_low20_17 = neg_f_413_low60_40_low20_16,
    u_453_470 = u_453_469,
    v_453_470 = v_453_469,
    neg_g_413_low60_40_low20_17 * (const 64 2) = neg_g_413_low60_40_low20_16,
    r_453_470 * (const 64 2) = r_453_469,
    s_453_470 * (const 64 2) = s_453_469
;

assume
    neg_f_413_low60_40_low20_17 = neg_f_413_low60_40_low20_16,
    u_453_470 = u_453_469,
    v_453_470 = v_453_469,
    neg_g_413_low60_40_low20_17 * 2 = neg_g_413_low60_40_low20_16,
    r_453_470 * 2 = r_453_469,
    s_453_470 * 2 = s_453_469
&&
    true
;

{
    u_453_470 * neg_f_413_low60_40_low20_0 + v_453_470 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_470 * neg_f_413_low60_40_low20_0 + s_453_470 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_17 + u_453_470 * (const 64 (2**21)) + v_453_470 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_17 + r_453_470 * (const 64 (2**21)) + s_453_470 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_17,
    neg_f_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_17,
    neg_g_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 470)) <=s delta, delta <=s (const 64 (1 + 2*470)),
    (const 64 (-(2**20))) <=s u_453_470, u_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_470, v_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_470, r_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_470, s_453_470 <=s (const 64 ((2**20))),
    u_453_470 + v_453_470 <=s (const 64 (2**20)),
    u_453_470 - v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 + v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 - v_453_470 <=s (const 64 (2**20)),
    r_453_470 + s_453_470 <=s (const 64 (2**20)),
    r_453_470 - s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 + s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 - s_453_470 <=s (const 64 (2**20)),
    u_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_453_470 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_469_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_16,
sint64 neg_g_413_low60_40_low20_16,
sint64 neg_f_413_low60_40_low20_17,
sint64 neg_g_413_low60_40_low20_17,
sint64 u_453_469,
sint64 v_453_469,
sint64 r_453_469,
sint64 s_453_469,
sint64 u_453_470,
sint64 v_453_470,
sint64 r_453_470,
sint64 s_453_470,
bit ne
)={
    u_453_469 * neg_f_413_low60_40_low20_0 + v_453_469 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_16 * (-(2**20)),
    r_453_469 * neg_f_413_low60_40_low20_0 + s_453_469 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_16 * (-(2**20))
&&
    u_453_469 * neg_f_413_low60_40_low20_0 + v_453_469 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_16 * (const 64 (-(2**20))),
    r_453_469 * neg_f_413_low60_40_low20_0 + s_453_469 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_16 + u_453_469 * (const 64 (2**21)) + v_453_469 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_16 + r_453_469 * (const 64 (2**21)) + s_453_469 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_16,
    neg_f_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_16,
    neg_g_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 469)) <=s delta, delta <=s (const 64 (1 + 2*469)),
    (const 64 (-(2**20))) <=s u_453_469, u_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_469, v_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_469, r_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_469, s_453_469 <=s (const 64 ((2**20))),
    u_453_469 + v_453_469 <=s (const 64 (2**20)),
    u_453_469 - v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 + v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 - v_453_469 <=s (const 64 (2**20)),
    r_453_469 + s_453_469 <=s (const 64 (2**20)),
    r_453_469 - s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 + s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 - s_453_469 <=s (const 64 (2**20)),
    u_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_453_469 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step469

// premise b
assume
neg_g_413_low60_40_low20_16 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_17 neg_f_413_low60_40_low20_16;
mov u_453_470 u_453_469;
mov v_453_470 v_453_469;

add neg_g_413_low60_40_low20_17 neg_g_413_low60_40_low20_16 neg_f_413_low60_40_low20_16;
asr neg_g_413_low60_40_low20_17 neg_g_413_low60_40_low20_17 1;
add r_453_470 r_453_469 u_453_469;
asr r_453_470 r_453_470 1;
add s_453_470 s_453_469 v_453_469;
asr s_453_470 s_453_470 1;
assert
    true
&&
    neg_f_413_low60_40_low20_17 = neg_f_413_low60_40_low20_16,
    u_453_470 = u_453_469,
    v_453_470 = v_453_469,
    neg_g_413_low60_40_low20_17 * (const 64 2) = neg_g_413_low60_40_low20_16 + neg_f_413_low60_40_low20_16,
    r_453_470 * (const 64 2) = r_453_469 + u_453_469,
    s_453_470 * (const 64 2) = s_453_469 + v_453_469
;

assume
    neg_f_413_low60_40_low20_17 = neg_f_413_low60_40_low20_16,
    u_453_470 = u_453_469,
    v_453_470 = v_453_469,
    neg_g_413_low60_40_low20_17 * 2 = neg_g_413_low60_40_low20_16 + neg_f_413_low60_40_low20_16,
    r_453_470 * 2 = r_453_469 + u_453_469,
    s_453_470 * 2 = s_453_469 + v_453_469
&&
    true
;

{
    u_453_470 * neg_f_413_low60_40_low20_0 + v_453_470 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_470 * neg_f_413_low60_40_low20_0 + s_453_470 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_17 + u_453_470 * (const 64 (2**21)) + v_453_470 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_17 + r_453_470 * (const 64 (2**21)) + s_453_470 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_17,
    neg_f_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_17,
    neg_g_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 470)) <=s delta, delta <=s (const 64 (1 + 2*470)),
    (const 64 (-(2**20))) <=s u_453_470, u_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_470, v_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_470, r_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_470, s_453_470 <=s (const 64 ((2**20))),
    u_453_470 + v_453_470 <=s (const 64 (2**20)),
    u_453_470 - v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 + v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 - v_453_470 <=s (const 64 (2**20)),
    r_453_470 + s_453_470 <=s (const 64 (2**20)),
    r_453_470 - s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 + s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 - s_453_470 <=s (const 64 (2**20)),
    u_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_453_470 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_469_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_16,
sint64 neg_g_413_low60_40_low20_16,
sint64 neg_f_413_low60_40_low20_17,
sint64 neg_g_413_low60_40_low20_17,
sint64 u_453_469,
sint64 v_453_469,
sint64 r_453_469,
sint64 s_453_469,
sint64 u_453_470,
sint64 v_453_470,
sint64 r_453_470,
sint64 s_453_470,
bit ne
)={
    u_453_469 * neg_f_413_low60_40_low20_0 + v_453_469 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_16 * (-(2**20)),
    r_453_469 * neg_f_413_low60_40_low20_0 + s_453_469 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_16 * (-(2**20))
&&
    u_453_469 * neg_f_413_low60_40_low20_0 + v_453_469 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_16 * (const 64 (-(2**20))),
    r_453_469 * neg_f_413_low60_40_low20_0 + s_453_469 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_16 + u_453_469 * (const 64 (2**21)) + v_453_469 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_16 + r_453_469 * (const 64 (2**21)) + s_453_469 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_16,
    neg_f_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_16,
    neg_g_413_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 469)) <=s delta, delta <=s (const 64 (1 + 2*469)),
    (const 64 (-(2**20))) <=s u_453_469, u_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_469, v_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_469, r_453_469 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_469, s_453_469 <=s (const 64 ((2**20))),
    u_453_469 + v_453_469 <=s (const 64 (2**20)),
    u_453_469 - v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 + v_453_469 <=s (const 64 (2**20)),
    (const 64 0) - u_453_469 - v_453_469 <=s (const 64 (2**20)),
    r_453_469 + s_453_469 <=s (const 64 (2**20)),
    r_453_469 - s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 + s_453_469 <=s (const 64 (2**20)),
    (const 64 0) - r_453_469 - s_453_469 <=s (const 64 (2**20)),
    u_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_453_469 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_453_469 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step469

// premise c
assume
neg_g_413_low60_40_low20_16 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_17 neg_g_413_low60_40_low20_16;
mov u_453_470 r_453_469;
mov v_453_470 s_453_469;

subs dc neg_g_413_low60_40_low20_17 neg_g_413_low60_40_low20_16 neg_f_413_low60_40_low20_16;
asr neg_g_413_low60_40_low20_17 neg_g_413_low60_40_low20_17 1;
subs dc r_453_470 r_453_469 u_453_469;
asr r_453_470 r_453_470 1;
subs dc s_453_470 s_453_469 v_453_469;
asr s_453_470 s_453_470 1;
assert
    true
&&
    neg_f_413_low60_40_low20_17 = neg_g_413_low60_40_low20_16,
    u_453_470 = r_453_469,
    v_453_470 = s_453_469,
    neg_g_413_low60_40_low20_17 * (const 64 2) = neg_g_413_low60_40_low20_16 - neg_f_413_low60_40_low20_16,
    r_453_470 * (const 64 2) = r_453_469 - u_453_469,
    s_453_470 * (const 64 2) = s_453_469 - v_453_469
;

assume
    neg_f_413_low60_40_low20_17 = neg_g_413_low60_40_low20_16,
    u_453_470 = r_453_469,
    v_453_470 = s_453_469,
    neg_g_413_low60_40_low20_17 * 2 = neg_g_413_low60_40_low20_16 - neg_f_413_low60_40_low20_16,
    r_453_470 * 2 = r_453_469 - u_453_469,
    s_453_470 * 2 = s_453_469 - v_453_469
&&
    true
;

{
    u_453_470 * neg_f_413_low60_40_low20_0 + v_453_470 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_470 * neg_f_413_low60_40_low20_0 + s_453_470 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_17 + u_453_470 * (const 64 (2**21)) + v_453_470 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_17 + r_453_470 * (const 64 (2**21)) + s_453_470 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_17,
    neg_f_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_17,
    neg_g_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 470)) <=s delta, delta <=s (const 64 (1 + 2*470)),
    (const 64 (-(2**20))) <=s u_453_470, u_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_470, v_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_470, r_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_470, s_453_470 <=s (const 64 ((2**20))),
    u_453_470 + v_453_470 <=s (const 64 (2**20)),
    u_453_470 - v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 + v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 - v_453_470 <=s (const 64 (2**20)),
    r_453_470 + s_453_470 <=s (const 64 (2**20)),
    r_453_470 - s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 + s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 - s_453_470 <=s (const 64 (2**20)),
    u_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_453_470 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_470_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_17,
sint64 neg_g_413_low60_40_low20_17,
sint64 neg_f_413_low60_40_low20_18,
sint64 neg_g_413_low60_40_low20_18,
sint64 u_453_470,
sint64 v_453_470,
sint64 r_453_470,
sint64 s_453_470,
sint64 u_453_471,
sint64 v_453_471,
sint64 r_453_471,
sint64 s_453_471,
bit ne
)={
    u_453_470 * neg_f_413_low60_40_low20_0 + v_453_470 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_17 * (-(2**20)),
    r_453_470 * neg_f_413_low60_40_low20_0 + s_453_470 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_17 * (-(2**20))
&&
    u_453_470 * neg_f_413_low60_40_low20_0 + v_453_470 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_17 * (const 64 (-(2**20))),
    r_453_470 * neg_f_413_low60_40_low20_0 + s_453_470 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_17 + u_453_470 * (const 64 (2**21)) + v_453_470 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_17 + r_453_470 * (const 64 (2**21)) + s_453_470 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_17,
    neg_f_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_17,
    neg_g_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 470)) <=s delta, delta <=s (const 64 (1 + 2*470)),
    (const 64 (-(2**20))) <=s u_453_470, u_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_470, v_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_470, r_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_470, s_453_470 <=s (const 64 ((2**20))),
    u_453_470 + v_453_470 <=s (const 64 (2**20)),
    u_453_470 - v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 + v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 - v_453_470 <=s (const 64 (2**20)),
    r_453_470 + s_453_470 <=s (const 64 (2**20)),
    r_453_470 - s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 + s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 - s_453_470 <=s (const 64 (2**20)),
    u_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_453_470 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step470

// premise a
assume
neg_g_413_low60_40_low20_17 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_17 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_18 neg_f_413_low60_40_low20_17;
mov u_453_471 u_453_470;
mov v_453_471 v_453_470;

asr neg_g_413_low60_40_low20_18 neg_g_413_low60_40_low20_17 1;
asr r_453_471 r_453_470 1;
asr s_453_471 s_453_470 1;
assert
    true
&&
    neg_f_413_low60_40_low20_18 = neg_f_413_low60_40_low20_17,
    u_453_471 = u_453_470,
    v_453_471 = v_453_470,
    neg_g_413_low60_40_low20_18 * (const 64 2) = neg_g_413_low60_40_low20_17,
    r_453_471 * (const 64 2) = r_453_470,
    s_453_471 * (const 64 2) = s_453_470
;

assume
    neg_f_413_low60_40_low20_18 = neg_f_413_low60_40_low20_17,
    u_453_471 = u_453_470,
    v_453_471 = v_453_470,
    neg_g_413_low60_40_low20_18 * 2 = neg_g_413_low60_40_low20_17,
    r_453_471 * 2 = r_453_470,
    s_453_471 * 2 = s_453_470
&&
    true
;

{
    u_453_471 * neg_f_413_low60_40_low20_0 + v_453_471 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_471 * neg_f_413_low60_40_low20_0 + s_453_471 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_18 + u_453_471 * (const 64 (2**21)) + v_453_471 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_18 + r_453_471 * (const 64 (2**21)) + s_453_471 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_18,
    neg_f_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_18,
    neg_g_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 471)) <=s delta, delta <=s (const 64 (1 + 2*471)),
    (const 64 (-(2**20))) <=s u_453_471, u_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_471, v_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_471, r_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_471, s_453_471 <=s (const 64 ((2**20))),
    u_453_471 + v_453_471 <=s (const 64 (2**20)),
    u_453_471 - v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 + v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 - v_453_471 <=s (const 64 (2**20)),
    r_453_471 + s_453_471 <=s (const 64 (2**20)),
    r_453_471 - s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 + s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 - s_453_471 <=s (const 64 (2**20)),
    u_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_453_471 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_470_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_17,
sint64 neg_g_413_low60_40_low20_17,
sint64 neg_f_413_low60_40_low20_18,
sint64 neg_g_413_low60_40_low20_18,
sint64 u_453_470,
sint64 v_453_470,
sint64 r_453_470,
sint64 s_453_470,
sint64 u_453_471,
sint64 v_453_471,
sint64 r_453_471,
sint64 s_453_471,
bit ne
)={
    u_453_470 * neg_f_413_low60_40_low20_0 + v_453_470 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_17 * (-(2**20)),
    r_453_470 * neg_f_413_low60_40_low20_0 + s_453_470 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_17 * (-(2**20))
&&
    u_453_470 * neg_f_413_low60_40_low20_0 + v_453_470 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_17 * (const 64 (-(2**20))),
    r_453_470 * neg_f_413_low60_40_low20_0 + s_453_470 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_17 + u_453_470 * (const 64 (2**21)) + v_453_470 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_17 + r_453_470 * (const 64 (2**21)) + s_453_470 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_17,
    neg_f_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_17,
    neg_g_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 470)) <=s delta, delta <=s (const 64 (1 + 2*470)),
    (const 64 (-(2**20))) <=s u_453_470, u_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_470, v_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_470, r_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_470, s_453_470 <=s (const 64 ((2**20))),
    u_453_470 + v_453_470 <=s (const 64 (2**20)),
    u_453_470 - v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 + v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 - v_453_470 <=s (const 64 (2**20)),
    r_453_470 + s_453_470 <=s (const 64 (2**20)),
    r_453_470 - s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 + s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 - s_453_470 <=s (const 64 (2**20)),
    u_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_453_470 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step470

// premise b
assume
neg_g_413_low60_40_low20_17 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_18 neg_f_413_low60_40_low20_17;
mov u_453_471 u_453_470;
mov v_453_471 v_453_470;

add neg_g_413_low60_40_low20_18 neg_g_413_low60_40_low20_17 neg_f_413_low60_40_low20_17;
asr neg_g_413_low60_40_low20_18 neg_g_413_low60_40_low20_18 1;
add r_453_471 r_453_470 u_453_470;
asr r_453_471 r_453_471 1;
add s_453_471 s_453_470 v_453_470;
asr s_453_471 s_453_471 1;
assert
    true
&&
    neg_f_413_low60_40_low20_18 = neg_f_413_low60_40_low20_17,
    u_453_471 = u_453_470,
    v_453_471 = v_453_470,
    neg_g_413_low60_40_low20_18 * (const 64 2) = neg_g_413_low60_40_low20_17 + neg_f_413_low60_40_low20_17,
    r_453_471 * (const 64 2) = r_453_470 + u_453_470,
    s_453_471 * (const 64 2) = s_453_470 + v_453_470
;

assume
    neg_f_413_low60_40_low20_18 = neg_f_413_low60_40_low20_17,
    u_453_471 = u_453_470,
    v_453_471 = v_453_470,
    neg_g_413_low60_40_low20_18 * 2 = neg_g_413_low60_40_low20_17 + neg_f_413_low60_40_low20_17,
    r_453_471 * 2 = r_453_470 + u_453_470,
    s_453_471 * 2 = s_453_470 + v_453_470
&&
    true
;

{
    u_453_471 * neg_f_413_low60_40_low20_0 + v_453_471 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_471 * neg_f_413_low60_40_low20_0 + s_453_471 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_18 + u_453_471 * (const 64 (2**21)) + v_453_471 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_18 + r_453_471 * (const 64 (2**21)) + s_453_471 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_18,
    neg_f_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_18,
    neg_g_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 471)) <=s delta, delta <=s (const 64 (1 + 2*471)),
    (const 64 (-(2**20))) <=s u_453_471, u_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_471, v_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_471, r_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_471, s_453_471 <=s (const 64 ((2**20))),
    u_453_471 + v_453_471 <=s (const 64 (2**20)),
    u_453_471 - v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 + v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 - v_453_471 <=s (const 64 (2**20)),
    r_453_471 + s_453_471 <=s (const 64 (2**20)),
    r_453_471 - s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 + s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 - s_453_471 <=s (const 64 (2**20)),
    u_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_453_471 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_470_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_17,
sint64 neg_g_413_low60_40_low20_17,
sint64 neg_f_413_low60_40_low20_18,
sint64 neg_g_413_low60_40_low20_18,
sint64 u_453_470,
sint64 v_453_470,
sint64 r_453_470,
sint64 s_453_470,
sint64 u_453_471,
sint64 v_453_471,
sint64 r_453_471,
sint64 s_453_471,
bit ne
)={
    u_453_470 * neg_f_413_low60_40_low20_0 + v_453_470 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_17 * (-(2**20)),
    r_453_470 * neg_f_413_low60_40_low20_0 + s_453_470 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_17 * (-(2**20))
&&
    u_453_470 * neg_f_413_low60_40_low20_0 + v_453_470 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_17 * (const 64 (-(2**20))),
    r_453_470 * neg_f_413_low60_40_low20_0 + s_453_470 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_17 + u_453_470 * (const 64 (2**21)) + v_453_470 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_17 + r_453_470 * (const 64 (2**21)) + s_453_470 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_17,
    neg_f_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_17,
    neg_g_413_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 470)) <=s delta, delta <=s (const 64 (1 + 2*470)),
    (const 64 (-(2**20))) <=s u_453_470, u_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_470, v_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_470, r_453_470 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_470, s_453_470 <=s (const 64 ((2**20))),
    u_453_470 + v_453_470 <=s (const 64 (2**20)),
    u_453_470 - v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 + v_453_470 <=s (const 64 (2**20)),
    (const 64 0) - u_453_470 - v_453_470 <=s (const 64 (2**20)),
    r_453_470 + s_453_470 <=s (const 64 (2**20)),
    r_453_470 - s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 + s_453_470 <=s (const 64 (2**20)),
    (const 64 0) - r_453_470 - s_453_470 <=s (const 64 (2**20)),
    u_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_453_470 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_453_470 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step470

// premise c
assume
neg_g_413_low60_40_low20_17 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_18 neg_g_413_low60_40_low20_17;
mov u_453_471 r_453_470;
mov v_453_471 s_453_470;

subs dc neg_g_413_low60_40_low20_18 neg_g_413_low60_40_low20_17 neg_f_413_low60_40_low20_17;
asr neg_g_413_low60_40_low20_18 neg_g_413_low60_40_low20_18 1;
subs dc r_453_471 r_453_470 u_453_470;
asr r_453_471 r_453_471 1;
subs dc s_453_471 s_453_470 v_453_470;
asr s_453_471 s_453_471 1;
assert
    true
&&
    neg_f_413_low60_40_low20_18 = neg_g_413_low60_40_low20_17,
    u_453_471 = r_453_470,
    v_453_471 = s_453_470,
    neg_g_413_low60_40_low20_18 * (const 64 2) = neg_g_413_low60_40_low20_17 - neg_f_413_low60_40_low20_17,
    r_453_471 * (const 64 2) = r_453_470 - u_453_470,
    s_453_471 * (const 64 2) = s_453_470 - v_453_470
;

assume
    neg_f_413_low60_40_low20_18 = neg_g_413_low60_40_low20_17,
    u_453_471 = r_453_470,
    v_453_471 = s_453_470,
    neg_g_413_low60_40_low20_18 * 2 = neg_g_413_low60_40_low20_17 - neg_f_413_low60_40_low20_17,
    r_453_471 * 2 = r_453_470 - u_453_470,
    s_453_471 * 2 = s_453_470 - v_453_470
&&
    true
;

{
    u_453_471 * neg_f_413_low60_40_low20_0 + v_453_471 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_471 * neg_f_413_low60_40_low20_0 + s_453_471 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_18 + u_453_471 * (const 64 (2**21)) + v_453_471 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_18 + r_453_471 * (const 64 (2**21)) + s_453_471 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_18,
    neg_f_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_18,
    neg_g_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 471)) <=s delta, delta <=s (const 64 (1 + 2*471)),
    (const 64 (-(2**20))) <=s u_453_471, u_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_471, v_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_471, r_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_471, s_453_471 <=s (const 64 ((2**20))),
    u_453_471 + v_453_471 <=s (const 64 (2**20)),
    u_453_471 - v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 + v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 - v_453_471 <=s (const 64 (2**20)),
    r_453_471 + s_453_471 <=s (const 64 (2**20)),
    r_453_471 - s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 + s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 - s_453_471 <=s (const 64 (2**20)),
    u_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_453_471 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_471_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_18,
sint64 neg_g_413_low60_40_low20_18,
sint64 neg_f_413_low60_40_low20_19,
sint64 neg_g_413_low60_40_low20_19,
sint64 u_453_471,
sint64 v_453_471,
sint64 r_453_471,
sint64 s_453_471,
sint64 u_453_472,
sint64 v_453_472,
sint64 r_453_472,
sint64 s_453_472,
bit ne
)={
    u_453_471 * neg_f_413_low60_40_low20_0 + v_453_471 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_18 * (-(2**20)),
    r_453_471 * neg_f_413_low60_40_low20_0 + s_453_471 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_18 * (-(2**20))
&&
    u_453_471 * neg_f_413_low60_40_low20_0 + v_453_471 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_18 * (const 64 (-(2**20))),
    r_453_471 * neg_f_413_low60_40_low20_0 + s_453_471 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_18 + u_453_471 * (const 64 (2**21)) + v_453_471 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_18 + r_453_471 * (const 64 (2**21)) + s_453_471 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_18,
    neg_f_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_18,
    neg_g_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 471)) <=s delta, delta <=s (const 64 (1 + 2*471)),
    (const 64 (-(2**20))) <=s u_453_471, u_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_471, v_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_471, r_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_471, s_453_471 <=s (const 64 ((2**20))),
    u_453_471 + v_453_471 <=s (const 64 (2**20)),
    u_453_471 - v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 + v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 - v_453_471 <=s (const 64 (2**20)),
    r_453_471 + s_453_471 <=s (const 64 (2**20)),
    r_453_471 - s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 + s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 - s_453_471 <=s (const 64 (2**20)),
    u_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_453_471 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step471

// premise a
assume
neg_g_413_low60_40_low20_18 = 0 (mod 2)
&&
neg_g_413_low60_40_low20_18 = const 64 0 (mod (const 64 2))
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

mov neg_f_413_low60_40_low20_19 neg_f_413_low60_40_low20_18;
mov u_453_472 u_453_471;
mov v_453_472 v_453_471;

asr neg_g_413_low60_40_low20_19 neg_g_413_low60_40_low20_18 1;
asr r_453_472 r_453_471 1;
asr s_453_472 s_453_471 1;
assert
    true
&&
    neg_f_413_low60_40_low20_19 = neg_f_413_low60_40_low20_18,
    u_453_472 = u_453_471,
    v_453_472 = v_453_471,
    neg_g_413_low60_40_low20_19 * (const 64 2) = neg_g_413_low60_40_low20_18,
    r_453_472 * (const 64 2) = r_453_471,
    s_453_472 * (const 64 2) = s_453_471
;

assume
    neg_f_413_low60_40_low20_19 = neg_f_413_low60_40_low20_18,
    u_453_472 = u_453_471,
    v_453_472 = v_453_471,
    neg_g_413_low60_40_low20_19 * 2 = neg_g_413_low60_40_low20_18,
    r_453_472 * 2 = r_453_471,
    s_453_472 * 2 = s_453_471
&&
    true
;

{
    u_453_472 * neg_f_413_low60_40_low20_0 + v_453_472 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_472 * neg_f_413_low60_40_low20_0 + s_453_472 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_19 + u_453_472 * (const 64 (2**21)) + v_453_472 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_19 + r_453_472 * (const 64 (2**21)) + s_453_472 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_19,
    neg_f_413_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_19,
    neg_g_413_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 472)) <=s delta, delta <=s (const 64 (1 + 2*472)),
    (const 64 (-(2**20))) <=s u_453_472, u_453_472 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_472, v_453_472 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_472, r_453_472 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_472, s_453_472 <=s (const 64 ((2**20))),
    u_453_472 + v_453_472 <=s (const 64 (2**20)),
    u_453_472 - v_453_472 <=s (const 64 (2**20)),
    (const 64 0) - u_453_472 + v_453_472 <=s (const 64 (2**20)),
    (const 64 0) - u_453_472 - v_453_472 <=s (const 64 (2**20)),
    r_453_472 + s_453_472 <=s (const 64 (2**20)),
    r_453_472 - s_453_472 <=s (const 64 (2**20)),
    (const 64 0) - r_453_472 + s_453_472 <=s (const 64 (2**20)),
    (const 64 0) - r_453_472 - s_453_472 <=s (const 64 (2**20)),
    u_453_472 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_453_472 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_453_472 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_453_472 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_471_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_18,
sint64 neg_g_413_low60_40_low20_18,
sint64 neg_f_413_low60_40_low20_19,
sint64 neg_g_413_low60_40_low20_19,
sint64 u_453_471,
sint64 v_453_471,
sint64 r_453_471,
sint64 s_453_471,
sint64 u_453_472,
sint64 v_453_472,
sint64 r_453_472,
sint64 s_453_472,
bit ne
)={
    u_453_471 * neg_f_413_low60_40_low20_0 + v_453_471 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_18 * (-(2**20)),
    r_453_471 * neg_f_413_low60_40_low20_0 + s_453_471 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_18 * (-(2**20))
&&
    u_453_471 * neg_f_413_low60_40_low20_0 + v_453_471 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_18 * (const 64 (-(2**20))),
    r_453_471 * neg_f_413_low60_40_low20_0 + s_453_471 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_18 + u_453_471 * (const 64 (2**21)) + v_453_471 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_18 + r_453_471 * (const 64 (2**21)) + s_453_471 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_18,
    neg_f_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_18,
    neg_g_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 471)) <=s delta, delta <=s (const 64 (1 + 2*471)),
    (const 64 (-(2**20))) <=s u_453_471, u_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_471, v_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_471, r_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_471, s_453_471 <=s (const 64 ((2**20))),
    u_453_471 + v_453_471 <=s (const 64 (2**20)),
    u_453_471 - v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 + v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 - v_453_471 <=s (const 64 (2**20)),
    r_453_471 + s_453_471 <=s (const 64 (2**20)),
    r_453_471 - s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 + s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 - s_453_471 <=s (const 64 (2**20)),
    u_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_453_471 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step471

// premise b
assume
neg_g_413_low60_40_low20_18 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_19 neg_f_413_low60_40_low20_18;
mov u_453_472 u_453_471;
mov v_453_472 v_453_471;

add neg_g_413_low60_40_low20_19 neg_g_413_low60_40_low20_18 neg_f_413_low60_40_low20_18;
asr neg_g_413_low60_40_low20_19 neg_g_413_low60_40_low20_19 1;
add r_453_472 r_453_471 u_453_471;
asr r_453_472 r_453_472 1;
add s_453_472 s_453_471 v_453_471;
asr s_453_472 s_453_472 1;
assert
    true
&&
    neg_f_413_low60_40_low20_19 = neg_f_413_low60_40_low20_18,
    u_453_472 = u_453_471,
    v_453_472 = v_453_471,
    neg_g_413_low60_40_low20_19 * (const 64 2) = neg_g_413_low60_40_low20_18 + neg_f_413_low60_40_low20_18,
    r_453_472 * (const 64 2) = r_453_471 + u_453_471,
    s_453_472 * (const 64 2) = s_453_471 + v_453_471
;

assume
    neg_f_413_low60_40_low20_19 = neg_f_413_low60_40_low20_18,
    u_453_472 = u_453_471,
    v_453_472 = v_453_471,
    neg_g_413_low60_40_low20_19 * 2 = neg_g_413_low60_40_low20_18 + neg_f_413_low60_40_low20_18,
    r_453_472 * 2 = r_453_471 + u_453_471,
    s_453_472 * 2 = s_453_471 + v_453_471
&&
    true
;

{
    u_453_472 * neg_f_413_low60_40_low20_0 + v_453_472 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_472 * neg_f_413_low60_40_low20_0 + s_453_472 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_19 + u_453_472 * (const 64 (2**21)) + v_453_472 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_19 + r_453_472 * (const 64 (2**21)) + s_453_472 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_19,
    neg_f_413_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_19,
    neg_g_413_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 472)) <=s delta, delta <=s (const 64 (1 + 2*472)),
    (const 64 (-(2**20))) <=s u_453_472, u_453_472 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_472, v_453_472 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_472, r_453_472 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_472, s_453_472 <=s (const 64 ((2**20))),
    u_453_472 + v_453_472 <=s (const 64 (2**20)),
    u_453_472 - v_453_472 <=s (const 64 (2**20)),
    (const 64 0) - u_453_472 + v_453_472 <=s (const 64 (2**20)),
    (const 64 0) - u_453_472 - v_453_472 <=s (const 64 (2**20)),
    r_453_472 + s_453_472 <=s (const 64 (2**20)),
    r_453_472 - s_453_472 <=s (const 64 (2**20)),
    (const 64 0) - r_453_472 + s_453_472 <=s (const 64 (2**20)),
    (const 64 0) - r_453_472 - s_453_472 <=s (const 64 (2**20)),
    u_453_472 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_453_472 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_453_472 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_453_472 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_471_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_40_low20_0,
sint64 neg_g_413_low60_40_low20_0,
sint64 neg_f_413_low60_40_low20_18,
sint64 neg_g_413_low60_40_low20_18,
sint64 neg_f_413_low60_40_low20_19,
sint64 neg_g_413_low60_40_low20_19,
sint64 u_453_471,
sint64 v_453_471,
sint64 r_453_471,
sint64 s_453_471,
sint64 u_453_472,
sint64 v_453_472,
sint64 r_453_472,
sint64 s_453_472,
bit ne
)={
    u_453_471 * neg_f_413_low60_40_low20_0 + v_453_471 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_18 * (-(2**20)),
    r_453_471 * neg_f_413_low60_40_low20_0 + s_453_471 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_18 * (-(2**20))
&&
    u_453_471 * neg_f_413_low60_40_low20_0 + v_453_471 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_18 * (const 64 (-(2**20))),
    r_453_471 * neg_f_413_low60_40_low20_0 + s_453_471 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_40_low20_18 + u_453_471 * (const 64 (2**21)) + v_453_471 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_18 + r_453_471 * (const 64 (2**21)) + s_453_471 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_40_low20_0,
    neg_f_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_0,
    neg_g_413_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_40_low20_18,
    neg_f_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_40_low20_18,
    neg_g_413_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 471)) <=s delta, delta <=s (const 64 (1 + 2*471)),
    (const 64 (-(2**20))) <=s u_453_471, u_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_471, v_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_471, r_453_471 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_471, s_453_471 <=s (const 64 ((2**20))),
    u_453_471 + v_453_471 <=s (const 64 (2**20)),
    u_453_471 - v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 + v_453_471 <=s (const 64 (2**20)),
    (const 64 0) - u_453_471 - v_453_471 <=s (const 64 (2**20)),
    r_453_471 + s_453_471 <=s (const 64 (2**20)),
    r_453_471 - s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 + s_453_471 <=s (const 64 (2**20)),
    (const 64 0) - r_453_471 - s_453_471 <=s (const 64 (2**20)),
    u_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_453_471 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_453_471 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step471

// premise c
assume
neg_g_413_low60_40_low20_18 = 1 (mod 2)
&&
neg_g_413_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_40_low20_19 neg_g_413_low60_40_low20_18;
mov u_453_472 r_453_471;
mov v_453_472 s_453_471;

subs dc neg_g_413_low60_40_low20_19 neg_g_413_low60_40_low20_18 neg_f_413_low60_40_low20_18;
asr neg_g_413_low60_40_low20_19 neg_g_413_low60_40_low20_19 1;
subs dc r_453_472 r_453_471 u_453_471;
asr r_453_472 r_453_472 1;
subs dc s_453_472 s_453_471 v_453_471;
asr s_453_472 s_453_472 1;
assert
    true
&&
    neg_f_413_low60_40_low20_19 = neg_g_413_low60_40_low20_18,
    u_453_472 = r_453_471,
    v_453_472 = s_453_471,
    neg_g_413_low60_40_low20_19 * (const 64 2) = neg_g_413_low60_40_low20_18 - neg_f_413_low60_40_low20_18,
    r_453_472 * (const 64 2) = r_453_471 - u_453_471,
    s_453_472 * (const 64 2) = s_453_471 - v_453_471
;

assume
    neg_f_413_low60_40_low20_19 = neg_g_413_low60_40_low20_18,
    u_453_472 = r_453_471,
    v_453_472 = s_453_471,
    neg_g_413_low60_40_low20_19 * 2 = neg_g_413_low60_40_low20_18 - neg_f_413_low60_40_low20_18,
    r_453_472 * 2 = r_453_471 - u_453_471,
    s_453_472 * 2 = s_453_471 - v_453_471
&&
    true
;

{
    u_453_472 * neg_f_413_low60_40_low20_0 + v_453_472 * neg_g_413_low60_40_low20_0 = neg_f_413_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_453_472 * neg_f_413_low60_40_low20_0 + s_453_472 * neg_g_413_low60_40_low20_0 = neg_g_413_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_40_low20_19 + u_453_472 * (const 64 (2**21)) + v_453_472 * (const 64 (2**42)),
    grs = neg_g_413_low60_40_low20_19 + r_453_472 * (const 64 (2**21)) + s_453_472 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_40_low20_19,
    neg_f_413_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_40_low20_19,
    neg_g_413_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 472)) <=s delta, delta <=s (const 64 (1 + 2*472)),
    (const 64 (-(2**20))) <=s u_453_472, u_453_472 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_453_472, v_453_472 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_453_472, r_453_472 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_453_472, s_453_472 <=s (const 64 ((2**20))),
    u_453_472 + v_453_472 <=s (const 64 (2**20)),
    u_453_472 - v_453_472 <=s (const 64 (2**20)),
    (const 64 0) - u_453_472 + v_453_472 <=s (const 64 (2**20)),
    (const 64 0) - u_453_472 - v_453_472 <=s (const 64 (2**20)),
    r_453_472 + s_453_472 <=s (const 64 (2**20)),
    r_453_472 - s_453_472 <=s (const 64 (2**20)),
    (const 64 0) - r_453_472 + s_453_472 <=s (const 64 (2**20)),
    (const 64 0) - r_453_472 - s_453_472 <=s (const 64 (2**20)),
    u_453_472 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_453_472 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_453_472 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_453_472 = (const 64 0) (mod (const 64 (2**(20-19))))
}

