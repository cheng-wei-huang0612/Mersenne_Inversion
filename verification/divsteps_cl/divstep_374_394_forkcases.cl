proc divstep_374_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_1,
sint64 neg_g_354_low60_20_low20_1,
sint64 u_374_374,
sint64 v_374_374,
sint64 r_374_374,
sint64 s_374_374,
sint64 u_374_375,
sint64 v_374_375,
sint64 r_374_375,
sint64 s_374_375,
bit ne
)={
    u_374_374 * neg_f_354_low60_20_low20_0 + v_374_374 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_0 * (-(2**20)),
    r_374_374 * neg_f_354_low60_20_low20_0 + s_374_374 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_0 * (-(2**20))
&&
    u_374_374 * neg_f_354_low60_20_low20_0 + v_374_374 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_0 * (const 64 (-(2**20))),
    r_374_374 * neg_f_354_low60_20_low20_0 + s_374_374 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_0 + u_374_374 * (const 64 (2**21)) + v_374_374 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_0 + r_374_374 * (const 64 (2**21)) + s_374_374 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 374)) <=s delta, delta <=s (const 64 (1 + 2*374)),
    u_374_374 = (const 64 (-(2**20))),
    v_374_374 = (const 64 (0)),
    r_374_374 = (const 64 (0)),
    s_374_374 = (const 64 (-(2**20)))
}



// divsteps
// step374

// premise a
assume
neg_g_354_low60_20_low20_0 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_1 neg_f_354_low60_20_low20_0;
mov u_374_375 u_374_374;
mov v_374_375 v_374_374;

asr neg_g_354_low60_20_low20_1 neg_g_354_low60_20_low20_0 1;
asr r_374_375 r_374_374 1;
asr s_374_375 s_374_374 1;
assert
    true
&&
    neg_f_354_low60_20_low20_1 = neg_f_354_low60_20_low20_0,
    u_374_375 = u_374_374,
    v_374_375 = v_374_374,
    neg_g_354_low60_20_low20_1 * (const 64 2) = neg_g_354_low60_20_low20_0,
    r_374_375 * (const 64 2) = r_374_374,
    s_374_375 * (const 64 2) = s_374_374
;

assume
    neg_f_354_low60_20_low20_1 = neg_f_354_low60_20_low20_0,
    u_374_375 = u_374_374,
    v_374_375 = v_374_374,
    neg_g_354_low60_20_low20_1 * 2 = neg_g_354_low60_20_low20_0,
    r_374_375 * 2 = r_374_374,
    s_374_375 * 2 = s_374_374
&&
    true
;

{
    u_374_375 * neg_f_354_low60_20_low20_0 + v_374_375 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_375 * neg_f_354_low60_20_low20_0 + s_374_375 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_1 + u_374_375 * (const 64 (2**21)) + v_374_375 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_1 + r_374_375 * (const 64 (2**21)) + s_374_375 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_1,
    neg_f_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_1,
    neg_g_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 375)) <=s delta, delta <=s (const 64 (1 + 2*375)),
    (const 64 (-(2**20))) <=s u_374_375, u_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_375, v_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_375, r_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_375, s_374_375 <=s (const 64 ((2**20)-1)),
    u_374_375 + v_374_375 <=s (const 64 (2**20)),
    u_374_375 - v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 + v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 - v_374_375 <=s (const 64 (2**20)),
    r_374_375 + s_374_375 <=s (const 64 (2**20)),
    r_374_375 - s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 + s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 - s_374_375 <=s (const 64 (2**20)),
    u_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_374_375 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_374_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_1,
sint64 neg_g_354_low60_20_low20_1,
sint64 u_374_374,
sint64 v_374_374,
sint64 r_374_374,
sint64 s_374_374,
sint64 u_374_375,
sint64 v_374_375,
sint64 r_374_375,
sint64 s_374_375,
bit ne
)={
    u_374_374 * neg_f_354_low60_20_low20_0 + v_374_374 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_0 * (-(2**20)),
    r_374_374 * neg_f_354_low60_20_low20_0 + s_374_374 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_0 * (-(2**20))
&&
    u_374_374 * neg_f_354_low60_20_low20_0 + v_374_374 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_0 * (const 64 (-(2**20))),
    r_374_374 * neg_f_354_low60_20_low20_0 + s_374_374 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_0 + u_374_374 * (const 64 (2**21)) + v_374_374 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_0 + r_374_374 * (const 64 (2**21)) + s_374_374 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 374)) <=s delta, delta <=s (const 64 (1 + 2*374)),
    u_374_374 = (const 64 (-(2**20))),
    v_374_374 = (const 64 (0)),
    r_374_374 = (const 64 (0)),
    s_374_374 = (const 64 (-(2**20)))
}



// divsteps
// step374

// premise b
assume
neg_g_354_low60_20_low20_0 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_1 neg_f_354_low60_20_low20_0;
mov u_374_375 u_374_374;
mov v_374_375 v_374_374;

add neg_g_354_low60_20_low20_1 neg_g_354_low60_20_low20_0 neg_f_354_low60_20_low20_0;
asr neg_g_354_low60_20_low20_1 neg_g_354_low60_20_low20_1 1;
add r_374_375 r_374_374 u_374_374;
asr r_374_375 r_374_375 1;
add s_374_375 s_374_374 v_374_374;
asr s_374_375 s_374_375 1;
assert
    true
&&
    neg_f_354_low60_20_low20_1 = neg_f_354_low60_20_low20_0,
    u_374_375 = u_374_374,
    v_374_375 = v_374_374,
    neg_g_354_low60_20_low20_1 * (const 64 2) = neg_g_354_low60_20_low20_0 + neg_f_354_low60_20_low20_0,
    r_374_375 * (const 64 2) = r_374_374 + u_374_374,
    s_374_375 * (const 64 2) = s_374_374 + v_374_374
;

assume
    neg_f_354_low60_20_low20_1 = neg_f_354_low60_20_low20_0,
    u_374_375 = u_374_374,
    v_374_375 = v_374_374,
    neg_g_354_low60_20_low20_1 * 2 = neg_g_354_low60_20_low20_0 + neg_f_354_low60_20_low20_0,
    r_374_375 * 2 = r_374_374 + u_374_374,
    s_374_375 * 2 = s_374_374 + v_374_374
&&
    true
;

{
    u_374_375 * neg_f_354_low60_20_low20_0 + v_374_375 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_375 * neg_f_354_low60_20_low20_0 + s_374_375 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_1 + u_374_375 * (const 64 (2**21)) + v_374_375 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_1 + r_374_375 * (const 64 (2**21)) + s_374_375 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_1,
    neg_f_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_1,
    neg_g_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 375)) <=s delta, delta <=s (const 64 (1 + 2*375)),
    (const 64 (-(2**20))) <=s u_374_375, u_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_375, v_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_375, r_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_375, s_374_375 <=s (const 64 ((2**20)-1)),
    u_374_375 + v_374_375 <=s (const 64 (2**20)),
    u_374_375 - v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 + v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 - v_374_375 <=s (const 64 (2**20)),
    r_374_375 + s_374_375 <=s (const 64 (2**20)),
    r_374_375 - s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 + s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 - s_374_375 <=s (const 64 (2**20)),
    u_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_374_375 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_374_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_1,
sint64 neg_g_354_low60_20_low20_1,
sint64 u_374_374,
sint64 v_374_374,
sint64 r_374_374,
sint64 s_374_374,
sint64 u_374_375,
sint64 v_374_375,
sint64 r_374_375,
sint64 s_374_375,
bit ne
)={
    u_374_374 * neg_f_354_low60_20_low20_0 + v_374_374 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_0 * (-(2**20)),
    r_374_374 * neg_f_354_low60_20_low20_0 + s_374_374 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_0 * (-(2**20))
&&
    u_374_374 * neg_f_354_low60_20_low20_0 + v_374_374 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_0 * (const 64 (-(2**20))),
    r_374_374 * neg_f_354_low60_20_low20_0 + s_374_374 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_0 + u_374_374 * (const 64 (2**21)) + v_374_374 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_0 + r_374_374 * (const 64 (2**21)) + s_374_374 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 374)) <=s delta, delta <=s (const 64 (1 + 2*374)),
    u_374_374 = (const 64 (-(2**20))),
    v_374_374 = (const 64 (0)),
    r_374_374 = (const 64 (0)),
    s_374_374 = (const 64 (-(2**20)))
}



// divsteps
// step374

// premise c
assume
neg_g_354_low60_20_low20_0 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_1 neg_g_354_low60_20_low20_0;
mov u_374_375 r_374_374;
mov v_374_375 s_374_374;

subs dc neg_g_354_low60_20_low20_1 neg_g_354_low60_20_low20_0 neg_f_354_low60_20_low20_0;
asr neg_g_354_low60_20_low20_1 neg_g_354_low60_20_low20_1 1;
subs dc r_374_375 r_374_374 u_374_374;
asr r_374_375 r_374_375 1;
subs dc s_374_375 s_374_374 v_374_374;
asr s_374_375 s_374_375 1;
assert
    true
&&
    neg_f_354_low60_20_low20_1 = neg_g_354_low60_20_low20_0,
    u_374_375 = r_374_374,
    v_374_375 = s_374_374,
    neg_g_354_low60_20_low20_1 * (const 64 2) = neg_g_354_low60_20_low20_0 - neg_f_354_low60_20_low20_0,
    r_374_375 * (const 64 2) = r_374_374 - u_374_374,
    s_374_375 * (const 64 2) = s_374_374 - v_374_374
;

assume
    neg_f_354_low60_20_low20_1 = neg_g_354_low60_20_low20_0,
    u_374_375 = r_374_374,
    v_374_375 = s_374_374,
    neg_g_354_low60_20_low20_1 * 2 = neg_g_354_low60_20_low20_0 - neg_f_354_low60_20_low20_0,
    r_374_375 * 2 = r_374_374 - u_374_374,
    s_374_375 * 2 = s_374_374 - v_374_374
&&
    true
;

{
    u_374_375 * neg_f_354_low60_20_low20_0 + v_374_375 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_375 * neg_f_354_low60_20_low20_0 + s_374_375 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_1 + u_374_375 * (const 64 (2**21)) + v_374_375 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_1 + r_374_375 * (const 64 (2**21)) + s_374_375 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_1,
    neg_f_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_1,
    neg_g_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 375)) <=s delta, delta <=s (const 64 (1 + 2*375)),
    (const 64 (-(2**20))) <=s u_374_375, u_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_375, v_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_375, r_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_375, s_374_375 <=s (const 64 ((2**20)-1)),
    u_374_375 + v_374_375 <=s (const 64 (2**20)),
    u_374_375 - v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 + v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 - v_374_375 <=s (const 64 (2**20)),
    r_374_375 + s_374_375 <=s (const 64 (2**20)),
    r_374_375 - s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 + s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 - s_374_375 <=s (const 64 (2**20)),
    u_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_374_375 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_375_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_1,
sint64 neg_g_354_low60_20_low20_1,
sint64 neg_f_354_low60_20_low20_2,
sint64 neg_g_354_low60_20_low20_2,
sint64 u_374_375,
sint64 v_374_375,
sint64 r_374_375,
sint64 s_374_375,
sint64 u_374_376,
sint64 v_374_376,
sint64 r_374_376,
sint64 s_374_376,
bit ne
)={
    u_374_375 * neg_f_354_low60_20_low20_0 + v_374_375 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_1 * (-(2**20)),
    r_374_375 * neg_f_354_low60_20_low20_0 + s_374_375 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_1 * (-(2**20))
&&
    u_374_375 * neg_f_354_low60_20_low20_0 + v_374_375 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_1 * (const 64 (-(2**20))),
    r_374_375 * neg_f_354_low60_20_low20_0 + s_374_375 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_1 + u_374_375 * (const 64 (2**21)) + v_374_375 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_1 + r_374_375 * (const 64 (2**21)) + s_374_375 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_1,
    neg_f_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_1,
    neg_g_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 375)) <=s delta, delta <=s (const 64 (1 + 2*375)),
    (const 64 (-(2**20))) <=s u_374_375, u_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_375, v_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_375, r_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_375, s_374_375 <=s (const 64 ((2**20)-1)),
    u_374_375 + v_374_375 <=s (const 64 (2**20)),
    u_374_375 - v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 + v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 - v_374_375 <=s (const 64 (2**20)),
    r_374_375 + s_374_375 <=s (const 64 (2**20)),
    r_374_375 - s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 + s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 - s_374_375 <=s (const 64 (2**20)),
    u_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_374_375 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step375

// premise a
assume
neg_g_354_low60_20_low20_1 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_1 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_2 neg_f_354_low60_20_low20_1;
mov u_374_376 u_374_375;
mov v_374_376 v_374_375;

asr neg_g_354_low60_20_low20_2 neg_g_354_low60_20_low20_1 1;
asr r_374_376 r_374_375 1;
asr s_374_376 s_374_375 1;
assert
    true
&&
    neg_f_354_low60_20_low20_2 = neg_f_354_low60_20_low20_1,
    u_374_376 = u_374_375,
    v_374_376 = v_374_375,
    neg_g_354_low60_20_low20_2 * (const 64 2) = neg_g_354_low60_20_low20_1,
    r_374_376 * (const 64 2) = r_374_375,
    s_374_376 * (const 64 2) = s_374_375
;

assume
    neg_f_354_low60_20_low20_2 = neg_f_354_low60_20_low20_1,
    u_374_376 = u_374_375,
    v_374_376 = v_374_375,
    neg_g_354_low60_20_low20_2 * 2 = neg_g_354_low60_20_low20_1,
    r_374_376 * 2 = r_374_375,
    s_374_376 * 2 = s_374_375
&&
    true
;

{
    u_374_376 * neg_f_354_low60_20_low20_0 + v_374_376 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_376 * neg_f_354_low60_20_low20_0 + s_374_376 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_2 + u_374_376 * (const 64 (2**21)) + v_374_376 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_2 + r_374_376 * (const 64 (2**21)) + s_374_376 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_2,
    neg_f_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_2,
    neg_g_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 376)) <=s delta, delta <=s (const 64 (1 + 2*376)),
    (const 64 (-(2**20))) <=s u_374_376, u_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_376, v_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_376, r_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_376, s_374_376 <=s (const 64 ((2**20)-1)),
    u_374_376 + v_374_376 <=s (const 64 (2**20)),
    u_374_376 - v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 + v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 - v_374_376 <=s (const 64 (2**20)),
    r_374_376 + s_374_376 <=s (const 64 (2**20)),
    r_374_376 - s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 + s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 - s_374_376 <=s (const 64 (2**20)),
    u_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_374_376 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_375_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_1,
sint64 neg_g_354_low60_20_low20_1,
sint64 neg_f_354_low60_20_low20_2,
sint64 neg_g_354_low60_20_low20_2,
sint64 u_374_375,
sint64 v_374_375,
sint64 r_374_375,
sint64 s_374_375,
sint64 u_374_376,
sint64 v_374_376,
sint64 r_374_376,
sint64 s_374_376,
bit ne
)={
    u_374_375 * neg_f_354_low60_20_low20_0 + v_374_375 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_1 * (-(2**20)),
    r_374_375 * neg_f_354_low60_20_low20_0 + s_374_375 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_1 * (-(2**20))
&&
    u_374_375 * neg_f_354_low60_20_low20_0 + v_374_375 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_1 * (const 64 (-(2**20))),
    r_374_375 * neg_f_354_low60_20_low20_0 + s_374_375 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_1 + u_374_375 * (const 64 (2**21)) + v_374_375 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_1 + r_374_375 * (const 64 (2**21)) + s_374_375 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_1,
    neg_f_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_1,
    neg_g_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 375)) <=s delta, delta <=s (const 64 (1 + 2*375)),
    (const 64 (-(2**20))) <=s u_374_375, u_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_375, v_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_375, r_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_375, s_374_375 <=s (const 64 ((2**20)-1)),
    u_374_375 + v_374_375 <=s (const 64 (2**20)),
    u_374_375 - v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 + v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 - v_374_375 <=s (const 64 (2**20)),
    r_374_375 + s_374_375 <=s (const 64 (2**20)),
    r_374_375 - s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 + s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 - s_374_375 <=s (const 64 (2**20)),
    u_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_374_375 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step375

// premise b
assume
neg_g_354_low60_20_low20_1 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_2 neg_f_354_low60_20_low20_1;
mov u_374_376 u_374_375;
mov v_374_376 v_374_375;

add neg_g_354_low60_20_low20_2 neg_g_354_low60_20_low20_1 neg_f_354_low60_20_low20_1;
asr neg_g_354_low60_20_low20_2 neg_g_354_low60_20_low20_2 1;
add r_374_376 r_374_375 u_374_375;
asr r_374_376 r_374_376 1;
add s_374_376 s_374_375 v_374_375;
asr s_374_376 s_374_376 1;
assert
    true
&&
    neg_f_354_low60_20_low20_2 = neg_f_354_low60_20_low20_1,
    u_374_376 = u_374_375,
    v_374_376 = v_374_375,
    neg_g_354_low60_20_low20_2 * (const 64 2) = neg_g_354_low60_20_low20_1 + neg_f_354_low60_20_low20_1,
    r_374_376 * (const 64 2) = r_374_375 + u_374_375,
    s_374_376 * (const 64 2) = s_374_375 + v_374_375
;

assume
    neg_f_354_low60_20_low20_2 = neg_f_354_low60_20_low20_1,
    u_374_376 = u_374_375,
    v_374_376 = v_374_375,
    neg_g_354_low60_20_low20_2 * 2 = neg_g_354_low60_20_low20_1 + neg_f_354_low60_20_low20_1,
    r_374_376 * 2 = r_374_375 + u_374_375,
    s_374_376 * 2 = s_374_375 + v_374_375
&&
    true
;

{
    u_374_376 * neg_f_354_low60_20_low20_0 + v_374_376 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_376 * neg_f_354_low60_20_low20_0 + s_374_376 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_2 + u_374_376 * (const 64 (2**21)) + v_374_376 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_2 + r_374_376 * (const 64 (2**21)) + s_374_376 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_2,
    neg_f_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_2,
    neg_g_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 376)) <=s delta, delta <=s (const 64 (1 + 2*376)),
    (const 64 (-(2**20))) <=s u_374_376, u_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_376, v_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_376, r_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_376, s_374_376 <=s (const 64 ((2**20)-1)),
    u_374_376 + v_374_376 <=s (const 64 (2**20)),
    u_374_376 - v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 + v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 - v_374_376 <=s (const 64 (2**20)),
    r_374_376 + s_374_376 <=s (const 64 (2**20)),
    r_374_376 - s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 + s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 - s_374_376 <=s (const 64 (2**20)),
    u_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_374_376 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_375_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_1,
sint64 neg_g_354_low60_20_low20_1,
sint64 neg_f_354_low60_20_low20_2,
sint64 neg_g_354_low60_20_low20_2,
sint64 u_374_375,
sint64 v_374_375,
sint64 r_374_375,
sint64 s_374_375,
sint64 u_374_376,
sint64 v_374_376,
sint64 r_374_376,
sint64 s_374_376,
bit ne
)={
    u_374_375 * neg_f_354_low60_20_low20_0 + v_374_375 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_1 * (-(2**20)),
    r_374_375 * neg_f_354_low60_20_low20_0 + s_374_375 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_1 * (-(2**20))
&&
    u_374_375 * neg_f_354_low60_20_low20_0 + v_374_375 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_1 * (const 64 (-(2**20))),
    r_374_375 * neg_f_354_low60_20_low20_0 + s_374_375 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_1 + u_374_375 * (const 64 (2**21)) + v_374_375 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_1 + r_374_375 * (const 64 (2**21)) + s_374_375 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_1,
    neg_f_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_1,
    neg_g_354_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 375)) <=s delta, delta <=s (const 64 (1 + 2*375)),
    (const 64 (-(2**20))) <=s u_374_375, u_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_375, v_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_375, r_374_375 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_375, s_374_375 <=s (const 64 ((2**20)-1)),
    u_374_375 + v_374_375 <=s (const 64 (2**20)),
    u_374_375 - v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 + v_374_375 <=s (const 64 (2**20)),
    (const 64 0) - u_374_375 - v_374_375 <=s (const 64 (2**20)),
    r_374_375 + s_374_375 <=s (const 64 (2**20)),
    r_374_375 - s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 + s_374_375 <=s (const 64 (2**20)),
    (const 64 0) - r_374_375 - s_374_375 <=s (const 64 (2**20)),
    u_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_374_375 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_374_375 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step375

// premise c
assume
neg_g_354_low60_20_low20_1 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_2 neg_g_354_low60_20_low20_1;
mov u_374_376 r_374_375;
mov v_374_376 s_374_375;

subs dc neg_g_354_low60_20_low20_2 neg_g_354_low60_20_low20_1 neg_f_354_low60_20_low20_1;
asr neg_g_354_low60_20_low20_2 neg_g_354_low60_20_low20_2 1;
subs dc r_374_376 r_374_375 u_374_375;
asr r_374_376 r_374_376 1;
subs dc s_374_376 s_374_375 v_374_375;
asr s_374_376 s_374_376 1;
assert
    true
&&
    neg_f_354_low60_20_low20_2 = neg_g_354_low60_20_low20_1,
    u_374_376 = r_374_375,
    v_374_376 = s_374_375,
    neg_g_354_low60_20_low20_2 * (const 64 2) = neg_g_354_low60_20_low20_1 - neg_f_354_low60_20_low20_1,
    r_374_376 * (const 64 2) = r_374_375 - u_374_375,
    s_374_376 * (const 64 2) = s_374_375 - v_374_375
;

assume
    neg_f_354_low60_20_low20_2 = neg_g_354_low60_20_low20_1,
    u_374_376 = r_374_375,
    v_374_376 = s_374_375,
    neg_g_354_low60_20_low20_2 * 2 = neg_g_354_low60_20_low20_1 - neg_f_354_low60_20_low20_1,
    r_374_376 * 2 = r_374_375 - u_374_375,
    s_374_376 * 2 = s_374_375 - v_374_375
&&
    true
;

{
    u_374_376 * neg_f_354_low60_20_low20_0 + v_374_376 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_376 * neg_f_354_low60_20_low20_0 + s_374_376 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_2 + u_374_376 * (const 64 (2**21)) + v_374_376 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_2 + r_374_376 * (const 64 (2**21)) + s_374_376 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_2,
    neg_f_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_2,
    neg_g_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 376)) <=s delta, delta <=s (const 64 (1 + 2*376)),
    (const 64 (-(2**20))) <=s u_374_376, u_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_376, v_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_376, r_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_376, s_374_376 <=s (const 64 ((2**20)-1)),
    u_374_376 + v_374_376 <=s (const 64 (2**20)),
    u_374_376 - v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 + v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 - v_374_376 <=s (const 64 (2**20)),
    r_374_376 + s_374_376 <=s (const 64 (2**20)),
    r_374_376 - s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 + s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 - s_374_376 <=s (const 64 (2**20)),
    u_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_374_376 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_376_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_2,
sint64 neg_g_354_low60_20_low20_2,
sint64 neg_f_354_low60_20_low20_3,
sint64 neg_g_354_low60_20_low20_3,
sint64 u_374_376,
sint64 v_374_376,
sint64 r_374_376,
sint64 s_374_376,
sint64 u_374_377,
sint64 v_374_377,
sint64 r_374_377,
sint64 s_374_377,
bit ne
)={
    u_374_376 * neg_f_354_low60_20_low20_0 + v_374_376 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_2 * (-(2**20)),
    r_374_376 * neg_f_354_low60_20_low20_0 + s_374_376 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_2 * (-(2**20))
&&
    u_374_376 * neg_f_354_low60_20_low20_0 + v_374_376 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_2 * (const 64 (-(2**20))),
    r_374_376 * neg_f_354_low60_20_low20_0 + s_374_376 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_2 + u_374_376 * (const 64 (2**21)) + v_374_376 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_2 + r_374_376 * (const 64 (2**21)) + s_374_376 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_2,
    neg_f_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_2,
    neg_g_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 376)) <=s delta, delta <=s (const 64 (1 + 2*376)),
    (const 64 (-(2**20))) <=s u_374_376, u_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_376, v_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_376, r_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_376, s_374_376 <=s (const 64 ((2**20)-1)),
    u_374_376 + v_374_376 <=s (const 64 (2**20)),
    u_374_376 - v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 + v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 - v_374_376 <=s (const 64 (2**20)),
    r_374_376 + s_374_376 <=s (const 64 (2**20)),
    r_374_376 - s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 + s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 - s_374_376 <=s (const 64 (2**20)),
    u_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_374_376 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step376

// premise a
assume
neg_g_354_low60_20_low20_2 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_2 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_3 neg_f_354_low60_20_low20_2;
mov u_374_377 u_374_376;
mov v_374_377 v_374_376;

asr neg_g_354_low60_20_low20_3 neg_g_354_low60_20_low20_2 1;
asr r_374_377 r_374_376 1;
asr s_374_377 s_374_376 1;
assert
    true
&&
    neg_f_354_low60_20_low20_3 = neg_f_354_low60_20_low20_2,
    u_374_377 = u_374_376,
    v_374_377 = v_374_376,
    neg_g_354_low60_20_low20_3 * (const 64 2) = neg_g_354_low60_20_low20_2,
    r_374_377 * (const 64 2) = r_374_376,
    s_374_377 * (const 64 2) = s_374_376
;

assume
    neg_f_354_low60_20_low20_3 = neg_f_354_low60_20_low20_2,
    u_374_377 = u_374_376,
    v_374_377 = v_374_376,
    neg_g_354_low60_20_low20_3 * 2 = neg_g_354_low60_20_low20_2,
    r_374_377 * 2 = r_374_376,
    s_374_377 * 2 = s_374_376
&&
    true
;

{
    u_374_377 * neg_f_354_low60_20_low20_0 + v_374_377 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_377 * neg_f_354_low60_20_low20_0 + s_374_377 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_3 + u_374_377 * (const 64 (2**21)) + v_374_377 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_3 + r_374_377 * (const 64 (2**21)) + s_374_377 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_3,
    neg_f_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_3,
    neg_g_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 377)) <=s delta, delta <=s (const 64 (1 + 2*377)),
    (const 64 (-(2**20))) <=s u_374_377, u_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_377, v_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_377, r_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_377, s_374_377 <=s (const 64 ((2**20)-1)),
    u_374_377 + v_374_377 <=s (const 64 (2**20)),
    u_374_377 - v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 + v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 - v_374_377 <=s (const 64 (2**20)),
    r_374_377 + s_374_377 <=s (const 64 (2**20)),
    r_374_377 - s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 + s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 - s_374_377 <=s (const 64 (2**20)),
    u_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_374_377 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_376_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_2,
sint64 neg_g_354_low60_20_low20_2,
sint64 neg_f_354_low60_20_low20_3,
sint64 neg_g_354_low60_20_low20_3,
sint64 u_374_376,
sint64 v_374_376,
sint64 r_374_376,
sint64 s_374_376,
sint64 u_374_377,
sint64 v_374_377,
sint64 r_374_377,
sint64 s_374_377,
bit ne
)={
    u_374_376 * neg_f_354_low60_20_low20_0 + v_374_376 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_2 * (-(2**20)),
    r_374_376 * neg_f_354_low60_20_low20_0 + s_374_376 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_2 * (-(2**20))
&&
    u_374_376 * neg_f_354_low60_20_low20_0 + v_374_376 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_2 * (const 64 (-(2**20))),
    r_374_376 * neg_f_354_low60_20_low20_0 + s_374_376 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_2 + u_374_376 * (const 64 (2**21)) + v_374_376 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_2 + r_374_376 * (const 64 (2**21)) + s_374_376 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_2,
    neg_f_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_2,
    neg_g_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 376)) <=s delta, delta <=s (const 64 (1 + 2*376)),
    (const 64 (-(2**20))) <=s u_374_376, u_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_376, v_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_376, r_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_376, s_374_376 <=s (const 64 ((2**20)-1)),
    u_374_376 + v_374_376 <=s (const 64 (2**20)),
    u_374_376 - v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 + v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 - v_374_376 <=s (const 64 (2**20)),
    r_374_376 + s_374_376 <=s (const 64 (2**20)),
    r_374_376 - s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 + s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 - s_374_376 <=s (const 64 (2**20)),
    u_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_374_376 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step376

// premise b
assume
neg_g_354_low60_20_low20_2 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_3 neg_f_354_low60_20_low20_2;
mov u_374_377 u_374_376;
mov v_374_377 v_374_376;

add neg_g_354_low60_20_low20_3 neg_g_354_low60_20_low20_2 neg_f_354_low60_20_low20_2;
asr neg_g_354_low60_20_low20_3 neg_g_354_low60_20_low20_3 1;
add r_374_377 r_374_376 u_374_376;
asr r_374_377 r_374_377 1;
add s_374_377 s_374_376 v_374_376;
asr s_374_377 s_374_377 1;
assert
    true
&&
    neg_f_354_low60_20_low20_3 = neg_f_354_low60_20_low20_2,
    u_374_377 = u_374_376,
    v_374_377 = v_374_376,
    neg_g_354_low60_20_low20_3 * (const 64 2) = neg_g_354_low60_20_low20_2 + neg_f_354_low60_20_low20_2,
    r_374_377 * (const 64 2) = r_374_376 + u_374_376,
    s_374_377 * (const 64 2) = s_374_376 + v_374_376
;

assume
    neg_f_354_low60_20_low20_3 = neg_f_354_low60_20_low20_2,
    u_374_377 = u_374_376,
    v_374_377 = v_374_376,
    neg_g_354_low60_20_low20_3 * 2 = neg_g_354_low60_20_low20_2 + neg_f_354_low60_20_low20_2,
    r_374_377 * 2 = r_374_376 + u_374_376,
    s_374_377 * 2 = s_374_376 + v_374_376
&&
    true
;

{
    u_374_377 * neg_f_354_low60_20_low20_0 + v_374_377 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_377 * neg_f_354_low60_20_low20_0 + s_374_377 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_3 + u_374_377 * (const 64 (2**21)) + v_374_377 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_3 + r_374_377 * (const 64 (2**21)) + s_374_377 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_3,
    neg_f_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_3,
    neg_g_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 377)) <=s delta, delta <=s (const 64 (1 + 2*377)),
    (const 64 (-(2**20))) <=s u_374_377, u_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_377, v_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_377, r_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_377, s_374_377 <=s (const 64 ((2**20)-1)),
    u_374_377 + v_374_377 <=s (const 64 (2**20)),
    u_374_377 - v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 + v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 - v_374_377 <=s (const 64 (2**20)),
    r_374_377 + s_374_377 <=s (const 64 (2**20)),
    r_374_377 - s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 + s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 - s_374_377 <=s (const 64 (2**20)),
    u_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_374_377 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_376_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_2,
sint64 neg_g_354_low60_20_low20_2,
sint64 neg_f_354_low60_20_low20_3,
sint64 neg_g_354_low60_20_low20_3,
sint64 u_374_376,
sint64 v_374_376,
sint64 r_374_376,
sint64 s_374_376,
sint64 u_374_377,
sint64 v_374_377,
sint64 r_374_377,
sint64 s_374_377,
bit ne
)={
    u_374_376 * neg_f_354_low60_20_low20_0 + v_374_376 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_2 * (-(2**20)),
    r_374_376 * neg_f_354_low60_20_low20_0 + s_374_376 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_2 * (-(2**20))
&&
    u_374_376 * neg_f_354_low60_20_low20_0 + v_374_376 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_2 * (const 64 (-(2**20))),
    r_374_376 * neg_f_354_low60_20_low20_0 + s_374_376 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_2 + u_374_376 * (const 64 (2**21)) + v_374_376 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_2 + r_374_376 * (const 64 (2**21)) + s_374_376 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_2,
    neg_f_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_2,
    neg_g_354_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 376)) <=s delta, delta <=s (const 64 (1 + 2*376)),
    (const 64 (-(2**20))) <=s u_374_376, u_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_376, v_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_376, r_374_376 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_376, s_374_376 <=s (const 64 ((2**20)-1)),
    u_374_376 + v_374_376 <=s (const 64 (2**20)),
    u_374_376 - v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 + v_374_376 <=s (const 64 (2**20)),
    (const 64 0) - u_374_376 - v_374_376 <=s (const 64 (2**20)),
    r_374_376 + s_374_376 <=s (const 64 (2**20)),
    r_374_376 - s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 + s_374_376 <=s (const 64 (2**20)),
    (const 64 0) - r_374_376 - s_374_376 <=s (const 64 (2**20)),
    u_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_374_376 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_374_376 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step376

// premise c
assume
neg_g_354_low60_20_low20_2 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_3 neg_g_354_low60_20_low20_2;
mov u_374_377 r_374_376;
mov v_374_377 s_374_376;

subs dc neg_g_354_low60_20_low20_3 neg_g_354_low60_20_low20_2 neg_f_354_low60_20_low20_2;
asr neg_g_354_low60_20_low20_3 neg_g_354_low60_20_low20_3 1;
subs dc r_374_377 r_374_376 u_374_376;
asr r_374_377 r_374_377 1;
subs dc s_374_377 s_374_376 v_374_376;
asr s_374_377 s_374_377 1;
assert
    true
&&
    neg_f_354_low60_20_low20_3 = neg_g_354_low60_20_low20_2,
    u_374_377 = r_374_376,
    v_374_377 = s_374_376,
    neg_g_354_low60_20_low20_3 * (const 64 2) = neg_g_354_low60_20_low20_2 - neg_f_354_low60_20_low20_2,
    r_374_377 * (const 64 2) = r_374_376 - u_374_376,
    s_374_377 * (const 64 2) = s_374_376 - v_374_376
;

assume
    neg_f_354_low60_20_low20_3 = neg_g_354_low60_20_low20_2,
    u_374_377 = r_374_376,
    v_374_377 = s_374_376,
    neg_g_354_low60_20_low20_3 * 2 = neg_g_354_low60_20_low20_2 - neg_f_354_low60_20_low20_2,
    r_374_377 * 2 = r_374_376 - u_374_376,
    s_374_377 * 2 = s_374_376 - v_374_376
&&
    true
;

{
    u_374_377 * neg_f_354_low60_20_low20_0 + v_374_377 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_377 * neg_f_354_low60_20_low20_0 + s_374_377 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_3 + u_374_377 * (const 64 (2**21)) + v_374_377 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_3 + r_374_377 * (const 64 (2**21)) + s_374_377 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_3,
    neg_f_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_3,
    neg_g_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 377)) <=s delta, delta <=s (const 64 (1 + 2*377)),
    (const 64 (-(2**20))) <=s u_374_377, u_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_377, v_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_377, r_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_377, s_374_377 <=s (const 64 ((2**20)-1)),
    u_374_377 + v_374_377 <=s (const 64 (2**20)),
    u_374_377 - v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 + v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 - v_374_377 <=s (const 64 (2**20)),
    r_374_377 + s_374_377 <=s (const 64 (2**20)),
    r_374_377 - s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 + s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 - s_374_377 <=s (const 64 (2**20)),
    u_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_374_377 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_377_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_3,
sint64 neg_g_354_low60_20_low20_3,
sint64 neg_f_354_low60_20_low20_4,
sint64 neg_g_354_low60_20_low20_4,
sint64 u_374_377,
sint64 v_374_377,
sint64 r_374_377,
sint64 s_374_377,
sint64 u_374_378,
sint64 v_374_378,
sint64 r_374_378,
sint64 s_374_378,
bit ne
)={
    u_374_377 * neg_f_354_low60_20_low20_0 + v_374_377 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_3 * (-(2**20)),
    r_374_377 * neg_f_354_low60_20_low20_0 + s_374_377 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_3 * (-(2**20))
&&
    u_374_377 * neg_f_354_low60_20_low20_0 + v_374_377 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_3 * (const 64 (-(2**20))),
    r_374_377 * neg_f_354_low60_20_low20_0 + s_374_377 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_3 + u_374_377 * (const 64 (2**21)) + v_374_377 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_3 + r_374_377 * (const 64 (2**21)) + s_374_377 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_3,
    neg_f_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_3,
    neg_g_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 377)) <=s delta, delta <=s (const 64 (1 + 2*377)),
    (const 64 (-(2**20))) <=s u_374_377, u_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_377, v_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_377, r_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_377, s_374_377 <=s (const 64 ((2**20)-1)),
    u_374_377 + v_374_377 <=s (const 64 (2**20)),
    u_374_377 - v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 + v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 - v_374_377 <=s (const 64 (2**20)),
    r_374_377 + s_374_377 <=s (const 64 (2**20)),
    r_374_377 - s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 + s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 - s_374_377 <=s (const 64 (2**20)),
    u_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_374_377 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step377

// premise a
assume
neg_g_354_low60_20_low20_3 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_3 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_4 neg_f_354_low60_20_low20_3;
mov u_374_378 u_374_377;
mov v_374_378 v_374_377;

asr neg_g_354_low60_20_low20_4 neg_g_354_low60_20_low20_3 1;
asr r_374_378 r_374_377 1;
asr s_374_378 s_374_377 1;
assert
    true
&&
    neg_f_354_low60_20_low20_4 = neg_f_354_low60_20_low20_3,
    u_374_378 = u_374_377,
    v_374_378 = v_374_377,
    neg_g_354_low60_20_low20_4 * (const 64 2) = neg_g_354_low60_20_low20_3,
    r_374_378 * (const 64 2) = r_374_377,
    s_374_378 * (const 64 2) = s_374_377
;

assume
    neg_f_354_low60_20_low20_4 = neg_f_354_low60_20_low20_3,
    u_374_378 = u_374_377,
    v_374_378 = v_374_377,
    neg_g_354_low60_20_low20_4 * 2 = neg_g_354_low60_20_low20_3,
    r_374_378 * 2 = r_374_377,
    s_374_378 * 2 = s_374_377
&&
    true
;

{
    u_374_378 * neg_f_354_low60_20_low20_0 + v_374_378 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_378 * neg_f_354_low60_20_low20_0 + s_374_378 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_4 + u_374_378 * (const 64 (2**21)) + v_374_378 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_4 + r_374_378 * (const 64 (2**21)) + s_374_378 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_4,
    neg_f_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_4,
    neg_g_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 378)) <=s delta, delta <=s (const 64 (1 + 2*378)),
    (const 64 (-(2**20))) <=s u_374_378, u_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_378, v_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_378, r_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_378, s_374_378 <=s (const 64 ((2**20)-1)),
    u_374_378 + v_374_378 <=s (const 64 (2**20)),
    u_374_378 - v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 + v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 - v_374_378 <=s (const 64 (2**20)),
    r_374_378 + s_374_378 <=s (const 64 (2**20)),
    r_374_378 - s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 + s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 - s_374_378 <=s (const 64 (2**20)),
    u_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_374_378 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_377_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_3,
sint64 neg_g_354_low60_20_low20_3,
sint64 neg_f_354_low60_20_low20_4,
sint64 neg_g_354_low60_20_low20_4,
sint64 u_374_377,
sint64 v_374_377,
sint64 r_374_377,
sint64 s_374_377,
sint64 u_374_378,
sint64 v_374_378,
sint64 r_374_378,
sint64 s_374_378,
bit ne
)={
    u_374_377 * neg_f_354_low60_20_low20_0 + v_374_377 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_3 * (-(2**20)),
    r_374_377 * neg_f_354_low60_20_low20_0 + s_374_377 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_3 * (-(2**20))
&&
    u_374_377 * neg_f_354_low60_20_low20_0 + v_374_377 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_3 * (const 64 (-(2**20))),
    r_374_377 * neg_f_354_low60_20_low20_0 + s_374_377 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_3 + u_374_377 * (const 64 (2**21)) + v_374_377 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_3 + r_374_377 * (const 64 (2**21)) + s_374_377 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_3,
    neg_f_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_3,
    neg_g_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 377)) <=s delta, delta <=s (const 64 (1 + 2*377)),
    (const 64 (-(2**20))) <=s u_374_377, u_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_377, v_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_377, r_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_377, s_374_377 <=s (const 64 ((2**20)-1)),
    u_374_377 + v_374_377 <=s (const 64 (2**20)),
    u_374_377 - v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 + v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 - v_374_377 <=s (const 64 (2**20)),
    r_374_377 + s_374_377 <=s (const 64 (2**20)),
    r_374_377 - s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 + s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 - s_374_377 <=s (const 64 (2**20)),
    u_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_374_377 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step377

// premise b
assume
neg_g_354_low60_20_low20_3 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_4 neg_f_354_low60_20_low20_3;
mov u_374_378 u_374_377;
mov v_374_378 v_374_377;

add neg_g_354_low60_20_low20_4 neg_g_354_low60_20_low20_3 neg_f_354_low60_20_low20_3;
asr neg_g_354_low60_20_low20_4 neg_g_354_low60_20_low20_4 1;
add r_374_378 r_374_377 u_374_377;
asr r_374_378 r_374_378 1;
add s_374_378 s_374_377 v_374_377;
asr s_374_378 s_374_378 1;
assert
    true
&&
    neg_f_354_low60_20_low20_4 = neg_f_354_low60_20_low20_3,
    u_374_378 = u_374_377,
    v_374_378 = v_374_377,
    neg_g_354_low60_20_low20_4 * (const 64 2) = neg_g_354_low60_20_low20_3 + neg_f_354_low60_20_low20_3,
    r_374_378 * (const 64 2) = r_374_377 + u_374_377,
    s_374_378 * (const 64 2) = s_374_377 + v_374_377
;

assume
    neg_f_354_low60_20_low20_4 = neg_f_354_low60_20_low20_3,
    u_374_378 = u_374_377,
    v_374_378 = v_374_377,
    neg_g_354_low60_20_low20_4 * 2 = neg_g_354_low60_20_low20_3 + neg_f_354_low60_20_low20_3,
    r_374_378 * 2 = r_374_377 + u_374_377,
    s_374_378 * 2 = s_374_377 + v_374_377
&&
    true
;

{
    u_374_378 * neg_f_354_low60_20_low20_0 + v_374_378 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_378 * neg_f_354_low60_20_low20_0 + s_374_378 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_4 + u_374_378 * (const 64 (2**21)) + v_374_378 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_4 + r_374_378 * (const 64 (2**21)) + s_374_378 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_4,
    neg_f_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_4,
    neg_g_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 378)) <=s delta, delta <=s (const 64 (1 + 2*378)),
    (const 64 (-(2**20))) <=s u_374_378, u_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_378, v_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_378, r_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_378, s_374_378 <=s (const 64 ((2**20)-1)),
    u_374_378 + v_374_378 <=s (const 64 (2**20)),
    u_374_378 - v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 + v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 - v_374_378 <=s (const 64 (2**20)),
    r_374_378 + s_374_378 <=s (const 64 (2**20)),
    r_374_378 - s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 + s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 - s_374_378 <=s (const 64 (2**20)),
    u_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_374_378 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_377_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_3,
sint64 neg_g_354_low60_20_low20_3,
sint64 neg_f_354_low60_20_low20_4,
sint64 neg_g_354_low60_20_low20_4,
sint64 u_374_377,
sint64 v_374_377,
sint64 r_374_377,
sint64 s_374_377,
sint64 u_374_378,
sint64 v_374_378,
sint64 r_374_378,
sint64 s_374_378,
bit ne
)={
    u_374_377 * neg_f_354_low60_20_low20_0 + v_374_377 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_3 * (-(2**20)),
    r_374_377 * neg_f_354_low60_20_low20_0 + s_374_377 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_3 * (-(2**20))
&&
    u_374_377 * neg_f_354_low60_20_low20_0 + v_374_377 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_3 * (const 64 (-(2**20))),
    r_374_377 * neg_f_354_low60_20_low20_0 + s_374_377 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_3 + u_374_377 * (const 64 (2**21)) + v_374_377 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_3 + r_374_377 * (const 64 (2**21)) + s_374_377 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_3,
    neg_f_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_3,
    neg_g_354_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 377)) <=s delta, delta <=s (const 64 (1 + 2*377)),
    (const 64 (-(2**20))) <=s u_374_377, u_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_377, v_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_377, r_374_377 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_377, s_374_377 <=s (const 64 ((2**20)-1)),
    u_374_377 + v_374_377 <=s (const 64 (2**20)),
    u_374_377 - v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 + v_374_377 <=s (const 64 (2**20)),
    (const 64 0) - u_374_377 - v_374_377 <=s (const 64 (2**20)),
    r_374_377 + s_374_377 <=s (const 64 (2**20)),
    r_374_377 - s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 + s_374_377 <=s (const 64 (2**20)),
    (const 64 0) - r_374_377 - s_374_377 <=s (const 64 (2**20)),
    u_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_374_377 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_374_377 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step377

// premise c
assume
neg_g_354_low60_20_low20_3 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_4 neg_g_354_low60_20_low20_3;
mov u_374_378 r_374_377;
mov v_374_378 s_374_377;

subs dc neg_g_354_low60_20_low20_4 neg_g_354_low60_20_low20_3 neg_f_354_low60_20_low20_3;
asr neg_g_354_low60_20_low20_4 neg_g_354_low60_20_low20_4 1;
subs dc r_374_378 r_374_377 u_374_377;
asr r_374_378 r_374_378 1;
subs dc s_374_378 s_374_377 v_374_377;
asr s_374_378 s_374_378 1;
assert
    true
&&
    neg_f_354_low60_20_low20_4 = neg_g_354_low60_20_low20_3,
    u_374_378 = r_374_377,
    v_374_378 = s_374_377,
    neg_g_354_low60_20_low20_4 * (const 64 2) = neg_g_354_low60_20_low20_3 - neg_f_354_low60_20_low20_3,
    r_374_378 * (const 64 2) = r_374_377 - u_374_377,
    s_374_378 * (const 64 2) = s_374_377 - v_374_377
;

assume
    neg_f_354_low60_20_low20_4 = neg_g_354_low60_20_low20_3,
    u_374_378 = r_374_377,
    v_374_378 = s_374_377,
    neg_g_354_low60_20_low20_4 * 2 = neg_g_354_low60_20_low20_3 - neg_f_354_low60_20_low20_3,
    r_374_378 * 2 = r_374_377 - u_374_377,
    s_374_378 * 2 = s_374_377 - v_374_377
&&
    true
;

{
    u_374_378 * neg_f_354_low60_20_low20_0 + v_374_378 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_378 * neg_f_354_low60_20_low20_0 + s_374_378 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_4 + u_374_378 * (const 64 (2**21)) + v_374_378 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_4 + r_374_378 * (const 64 (2**21)) + s_374_378 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_4,
    neg_f_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_4,
    neg_g_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 378)) <=s delta, delta <=s (const 64 (1 + 2*378)),
    (const 64 (-(2**20))) <=s u_374_378, u_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_378, v_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_378, r_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_378, s_374_378 <=s (const 64 ((2**20)-1)),
    u_374_378 + v_374_378 <=s (const 64 (2**20)),
    u_374_378 - v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 + v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 - v_374_378 <=s (const 64 (2**20)),
    r_374_378 + s_374_378 <=s (const 64 (2**20)),
    r_374_378 - s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 + s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 - s_374_378 <=s (const 64 (2**20)),
    u_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_374_378 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_378_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_4,
sint64 neg_g_354_low60_20_low20_4,
sint64 neg_f_354_low60_20_low20_5,
sint64 neg_g_354_low60_20_low20_5,
sint64 u_374_378,
sint64 v_374_378,
sint64 r_374_378,
sint64 s_374_378,
sint64 u_374_379,
sint64 v_374_379,
sint64 r_374_379,
sint64 s_374_379,
bit ne
)={
    u_374_378 * neg_f_354_low60_20_low20_0 + v_374_378 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_4 * (-(2**20)),
    r_374_378 * neg_f_354_low60_20_low20_0 + s_374_378 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_4 * (-(2**20))
&&
    u_374_378 * neg_f_354_low60_20_low20_0 + v_374_378 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_4 * (const 64 (-(2**20))),
    r_374_378 * neg_f_354_low60_20_low20_0 + s_374_378 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_4 + u_374_378 * (const 64 (2**21)) + v_374_378 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_4 + r_374_378 * (const 64 (2**21)) + s_374_378 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_4,
    neg_f_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_4,
    neg_g_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 378)) <=s delta, delta <=s (const 64 (1 + 2*378)),
    (const 64 (-(2**20))) <=s u_374_378, u_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_378, v_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_378, r_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_378, s_374_378 <=s (const 64 ((2**20)-1)),
    u_374_378 + v_374_378 <=s (const 64 (2**20)),
    u_374_378 - v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 + v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 - v_374_378 <=s (const 64 (2**20)),
    r_374_378 + s_374_378 <=s (const 64 (2**20)),
    r_374_378 - s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 + s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 - s_374_378 <=s (const 64 (2**20)),
    u_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_374_378 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step378

// premise a
assume
neg_g_354_low60_20_low20_4 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_4 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_5 neg_f_354_low60_20_low20_4;
mov u_374_379 u_374_378;
mov v_374_379 v_374_378;

asr neg_g_354_low60_20_low20_5 neg_g_354_low60_20_low20_4 1;
asr r_374_379 r_374_378 1;
asr s_374_379 s_374_378 1;
assert
    true
&&
    neg_f_354_low60_20_low20_5 = neg_f_354_low60_20_low20_4,
    u_374_379 = u_374_378,
    v_374_379 = v_374_378,
    neg_g_354_low60_20_low20_5 * (const 64 2) = neg_g_354_low60_20_low20_4,
    r_374_379 * (const 64 2) = r_374_378,
    s_374_379 * (const 64 2) = s_374_378
;

assume
    neg_f_354_low60_20_low20_5 = neg_f_354_low60_20_low20_4,
    u_374_379 = u_374_378,
    v_374_379 = v_374_378,
    neg_g_354_low60_20_low20_5 * 2 = neg_g_354_low60_20_low20_4,
    r_374_379 * 2 = r_374_378,
    s_374_379 * 2 = s_374_378
&&
    true
;

{
    u_374_379 * neg_f_354_low60_20_low20_0 + v_374_379 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_379 * neg_f_354_low60_20_low20_0 + s_374_379 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_5 + u_374_379 * (const 64 (2**21)) + v_374_379 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_5 + r_374_379 * (const 64 (2**21)) + s_374_379 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_5,
    neg_f_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_5,
    neg_g_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 379)) <=s delta, delta <=s (const 64 (1 + 2*379)),
    (const 64 (-(2**20))) <=s u_374_379, u_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_379, v_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_379, r_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_379, s_374_379 <=s (const 64 ((2**20)-1)),
    u_374_379 + v_374_379 <=s (const 64 (2**20)),
    u_374_379 - v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 + v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 - v_374_379 <=s (const 64 (2**20)),
    r_374_379 + s_374_379 <=s (const 64 (2**20)),
    r_374_379 - s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 + s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 - s_374_379 <=s (const 64 (2**20)),
    u_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_374_379 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_378_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_4,
sint64 neg_g_354_low60_20_low20_4,
sint64 neg_f_354_low60_20_low20_5,
sint64 neg_g_354_low60_20_low20_5,
sint64 u_374_378,
sint64 v_374_378,
sint64 r_374_378,
sint64 s_374_378,
sint64 u_374_379,
sint64 v_374_379,
sint64 r_374_379,
sint64 s_374_379,
bit ne
)={
    u_374_378 * neg_f_354_low60_20_low20_0 + v_374_378 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_4 * (-(2**20)),
    r_374_378 * neg_f_354_low60_20_low20_0 + s_374_378 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_4 * (-(2**20))
&&
    u_374_378 * neg_f_354_low60_20_low20_0 + v_374_378 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_4 * (const 64 (-(2**20))),
    r_374_378 * neg_f_354_low60_20_low20_0 + s_374_378 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_4 + u_374_378 * (const 64 (2**21)) + v_374_378 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_4 + r_374_378 * (const 64 (2**21)) + s_374_378 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_4,
    neg_f_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_4,
    neg_g_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 378)) <=s delta, delta <=s (const 64 (1 + 2*378)),
    (const 64 (-(2**20))) <=s u_374_378, u_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_378, v_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_378, r_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_378, s_374_378 <=s (const 64 ((2**20)-1)),
    u_374_378 + v_374_378 <=s (const 64 (2**20)),
    u_374_378 - v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 + v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 - v_374_378 <=s (const 64 (2**20)),
    r_374_378 + s_374_378 <=s (const 64 (2**20)),
    r_374_378 - s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 + s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 - s_374_378 <=s (const 64 (2**20)),
    u_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_374_378 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step378

// premise b
assume
neg_g_354_low60_20_low20_4 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_5 neg_f_354_low60_20_low20_4;
mov u_374_379 u_374_378;
mov v_374_379 v_374_378;

add neg_g_354_low60_20_low20_5 neg_g_354_low60_20_low20_4 neg_f_354_low60_20_low20_4;
asr neg_g_354_low60_20_low20_5 neg_g_354_low60_20_low20_5 1;
add r_374_379 r_374_378 u_374_378;
asr r_374_379 r_374_379 1;
add s_374_379 s_374_378 v_374_378;
asr s_374_379 s_374_379 1;
assert
    true
&&
    neg_f_354_low60_20_low20_5 = neg_f_354_low60_20_low20_4,
    u_374_379 = u_374_378,
    v_374_379 = v_374_378,
    neg_g_354_low60_20_low20_5 * (const 64 2) = neg_g_354_low60_20_low20_4 + neg_f_354_low60_20_low20_4,
    r_374_379 * (const 64 2) = r_374_378 + u_374_378,
    s_374_379 * (const 64 2) = s_374_378 + v_374_378
;

assume
    neg_f_354_low60_20_low20_5 = neg_f_354_low60_20_low20_4,
    u_374_379 = u_374_378,
    v_374_379 = v_374_378,
    neg_g_354_low60_20_low20_5 * 2 = neg_g_354_low60_20_low20_4 + neg_f_354_low60_20_low20_4,
    r_374_379 * 2 = r_374_378 + u_374_378,
    s_374_379 * 2 = s_374_378 + v_374_378
&&
    true
;

{
    u_374_379 * neg_f_354_low60_20_low20_0 + v_374_379 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_379 * neg_f_354_low60_20_low20_0 + s_374_379 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_5 + u_374_379 * (const 64 (2**21)) + v_374_379 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_5 + r_374_379 * (const 64 (2**21)) + s_374_379 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_5,
    neg_f_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_5,
    neg_g_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 379)) <=s delta, delta <=s (const 64 (1 + 2*379)),
    (const 64 (-(2**20))) <=s u_374_379, u_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_379, v_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_379, r_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_379, s_374_379 <=s (const 64 ((2**20)-1)),
    u_374_379 + v_374_379 <=s (const 64 (2**20)),
    u_374_379 - v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 + v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 - v_374_379 <=s (const 64 (2**20)),
    r_374_379 + s_374_379 <=s (const 64 (2**20)),
    r_374_379 - s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 + s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 - s_374_379 <=s (const 64 (2**20)),
    u_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_374_379 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_378_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_4,
sint64 neg_g_354_low60_20_low20_4,
sint64 neg_f_354_low60_20_low20_5,
sint64 neg_g_354_low60_20_low20_5,
sint64 u_374_378,
sint64 v_374_378,
sint64 r_374_378,
sint64 s_374_378,
sint64 u_374_379,
sint64 v_374_379,
sint64 r_374_379,
sint64 s_374_379,
bit ne
)={
    u_374_378 * neg_f_354_low60_20_low20_0 + v_374_378 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_4 * (-(2**20)),
    r_374_378 * neg_f_354_low60_20_low20_0 + s_374_378 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_4 * (-(2**20))
&&
    u_374_378 * neg_f_354_low60_20_low20_0 + v_374_378 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_4 * (const 64 (-(2**20))),
    r_374_378 * neg_f_354_low60_20_low20_0 + s_374_378 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_4 + u_374_378 * (const 64 (2**21)) + v_374_378 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_4 + r_374_378 * (const 64 (2**21)) + s_374_378 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_4,
    neg_f_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_4,
    neg_g_354_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 378)) <=s delta, delta <=s (const 64 (1 + 2*378)),
    (const 64 (-(2**20))) <=s u_374_378, u_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_378, v_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_378, r_374_378 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_378, s_374_378 <=s (const 64 ((2**20)-1)),
    u_374_378 + v_374_378 <=s (const 64 (2**20)),
    u_374_378 - v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 + v_374_378 <=s (const 64 (2**20)),
    (const 64 0) - u_374_378 - v_374_378 <=s (const 64 (2**20)),
    r_374_378 + s_374_378 <=s (const 64 (2**20)),
    r_374_378 - s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 + s_374_378 <=s (const 64 (2**20)),
    (const 64 0) - r_374_378 - s_374_378 <=s (const 64 (2**20)),
    u_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_374_378 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_374_378 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step378

// premise c
assume
neg_g_354_low60_20_low20_4 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_5 neg_g_354_low60_20_low20_4;
mov u_374_379 r_374_378;
mov v_374_379 s_374_378;

subs dc neg_g_354_low60_20_low20_5 neg_g_354_low60_20_low20_4 neg_f_354_low60_20_low20_4;
asr neg_g_354_low60_20_low20_5 neg_g_354_low60_20_low20_5 1;
subs dc r_374_379 r_374_378 u_374_378;
asr r_374_379 r_374_379 1;
subs dc s_374_379 s_374_378 v_374_378;
asr s_374_379 s_374_379 1;
assert
    true
&&
    neg_f_354_low60_20_low20_5 = neg_g_354_low60_20_low20_4,
    u_374_379 = r_374_378,
    v_374_379 = s_374_378,
    neg_g_354_low60_20_low20_5 * (const 64 2) = neg_g_354_low60_20_low20_4 - neg_f_354_low60_20_low20_4,
    r_374_379 * (const 64 2) = r_374_378 - u_374_378,
    s_374_379 * (const 64 2) = s_374_378 - v_374_378
;

assume
    neg_f_354_low60_20_low20_5 = neg_g_354_low60_20_low20_4,
    u_374_379 = r_374_378,
    v_374_379 = s_374_378,
    neg_g_354_low60_20_low20_5 * 2 = neg_g_354_low60_20_low20_4 - neg_f_354_low60_20_low20_4,
    r_374_379 * 2 = r_374_378 - u_374_378,
    s_374_379 * 2 = s_374_378 - v_374_378
&&
    true
;

{
    u_374_379 * neg_f_354_low60_20_low20_0 + v_374_379 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_379 * neg_f_354_low60_20_low20_0 + s_374_379 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_5 + u_374_379 * (const 64 (2**21)) + v_374_379 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_5 + r_374_379 * (const 64 (2**21)) + s_374_379 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_5,
    neg_f_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_5,
    neg_g_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 379)) <=s delta, delta <=s (const 64 (1 + 2*379)),
    (const 64 (-(2**20))) <=s u_374_379, u_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_379, v_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_379, r_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_379, s_374_379 <=s (const 64 ((2**20)-1)),
    u_374_379 + v_374_379 <=s (const 64 (2**20)),
    u_374_379 - v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 + v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 - v_374_379 <=s (const 64 (2**20)),
    r_374_379 + s_374_379 <=s (const 64 (2**20)),
    r_374_379 - s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 + s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 - s_374_379 <=s (const 64 (2**20)),
    u_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_374_379 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_379_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_5,
sint64 neg_g_354_low60_20_low20_5,
sint64 neg_f_354_low60_20_low20_6,
sint64 neg_g_354_low60_20_low20_6,
sint64 u_374_379,
sint64 v_374_379,
sint64 r_374_379,
sint64 s_374_379,
sint64 u_374_380,
sint64 v_374_380,
sint64 r_374_380,
sint64 s_374_380,
bit ne
)={
    u_374_379 * neg_f_354_low60_20_low20_0 + v_374_379 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_5 * (-(2**20)),
    r_374_379 * neg_f_354_low60_20_low20_0 + s_374_379 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_5 * (-(2**20))
&&
    u_374_379 * neg_f_354_low60_20_low20_0 + v_374_379 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_5 * (const 64 (-(2**20))),
    r_374_379 * neg_f_354_low60_20_low20_0 + s_374_379 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_5 + u_374_379 * (const 64 (2**21)) + v_374_379 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_5 + r_374_379 * (const 64 (2**21)) + s_374_379 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_5,
    neg_f_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_5,
    neg_g_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 379)) <=s delta, delta <=s (const 64 (1 + 2*379)),
    (const 64 (-(2**20))) <=s u_374_379, u_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_379, v_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_379, r_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_379, s_374_379 <=s (const 64 ((2**20)-1)),
    u_374_379 + v_374_379 <=s (const 64 (2**20)),
    u_374_379 - v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 + v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 - v_374_379 <=s (const 64 (2**20)),
    r_374_379 + s_374_379 <=s (const 64 (2**20)),
    r_374_379 - s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 + s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 - s_374_379 <=s (const 64 (2**20)),
    u_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_374_379 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step379

// premise a
assume
neg_g_354_low60_20_low20_5 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_5 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_6 neg_f_354_low60_20_low20_5;
mov u_374_380 u_374_379;
mov v_374_380 v_374_379;

asr neg_g_354_low60_20_low20_6 neg_g_354_low60_20_low20_5 1;
asr r_374_380 r_374_379 1;
asr s_374_380 s_374_379 1;
assert
    true
&&
    neg_f_354_low60_20_low20_6 = neg_f_354_low60_20_low20_5,
    u_374_380 = u_374_379,
    v_374_380 = v_374_379,
    neg_g_354_low60_20_low20_6 * (const 64 2) = neg_g_354_low60_20_low20_5,
    r_374_380 * (const 64 2) = r_374_379,
    s_374_380 * (const 64 2) = s_374_379
;

assume
    neg_f_354_low60_20_low20_6 = neg_f_354_low60_20_low20_5,
    u_374_380 = u_374_379,
    v_374_380 = v_374_379,
    neg_g_354_low60_20_low20_6 * 2 = neg_g_354_low60_20_low20_5,
    r_374_380 * 2 = r_374_379,
    s_374_380 * 2 = s_374_379
&&
    true
;

{
    u_374_380 * neg_f_354_low60_20_low20_0 + v_374_380 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_380 * neg_f_354_low60_20_low20_0 + s_374_380 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_6 + u_374_380 * (const 64 (2**21)) + v_374_380 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_6 + r_374_380 * (const 64 (2**21)) + s_374_380 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_6,
    neg_f_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_6,
    neg_g_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 380)) <=s delta, delta <=s (const 64 (1 + 2*380)),
    (const 64 (-(2**20))) <=s u_374_380, u_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_380, v_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_380, r_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_380, s_374_380 <=s (const 64 ((2**20)-1)),
    u_374_380 + v_374_380 <=s (const 64 (2**20)),
    u_374_380 - v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 + v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 - v_374_380 <=s (const 64 (2**20)),
    r_374_380 + s_374_380 <=s (const 64 (2**20)),
    r_374_380 - s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 + s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 - s_374_380 <=s (const 64 (2**20)),
    u_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_374_380 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_379_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_5,
sint64 neg_g_354_low60_20_low20_5,
sint64 neg_f_354_low60_20_low20_6,
sint64 neg_g_354_low60_20_low20_6,
sint64 u_374_379,
sint64 v_374_379,
sint64 r_374_379,
sint64 s_374_379,
sint64 u_374_380,
sint64 v_374_380,
sint64 r_374_380,
sint64 s_374_380,
bit ne
)={
    u_374_379 * neg_f_354_low60_20_low20_0 + v_374_379 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_5 * (-(2**20)),
    r_374_379 * neg_f_354_low60_20_low20_0 + s_374_379 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_5 * (-(2**20))
&&
    u_374_379 * neg_f_354_low60_20_low20_0 + v_374_379 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_5 * (const 64 (-(2**20))),
    r_374_379 * neg_f_354_low60_20_low20_0 + s_374_379 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_5 + u_374_379 * (const 64 (2**21)) + v_374_379 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_5 + r_374_379 * (const 64 (2**21)) + s_374_379 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_5,
    neg_f_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_5,
    neg_g_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 379)) <=s delta, delta <=s (const 64 (1 + 2*379)),
    (const 64 (-(2**20))) <=s u_374_379, u_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_379, v_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_379, r_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_379, s_374_379 <=s (const 64 ((2**20)-1)),
    u_374_379 + v_374_379 <=s (const 64 (2**20)),
    u_374_379 - v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 + v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 - v_374_379 <=s (const 64 (2**20)),
    r_374_379 + s_374_379 <=s (const 64 (2**20)),
    r_374_379 - s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 + s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 - s_374_379 <=s (const 64 (2**20)),
    u_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_374_379 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step379

// premise b
assume
neg_g_354_low60_20_low20_5 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_6 neg_f_354_low60_20_low20_5;
mov u_374_380 u_374_379;
mov v_374_380 v_374_379;

add neg_g_354_low60_20_low20_6 neg_g_354_low60_20_low20_5 neg_f_354_low60_20_low20_5;
asr neg_g_354_low60_20_low20_6 neg_g_354_low60_20_low20_6 1;
add r_374_380 r_374_379 u_374_379;
asr r_374_380 r_374_380 1;
add s_374_380 s_374_379 v_374_379;
asr s_374_380 s_374_380 1;
assert
    true
&&
    neg_f_354_low60_20_low20_6 = neg_f_354_low60_20_low20_5,
    u_374_380 = u_374_379,
    v_374_380 = v_374_379,
    neg_g_354_low60_20_low20_6 * (const 64 2) = neg_g_354_low60_20_low20_5 + neg_f_354_low60_20_low20_5,
    r_374_380 * (const 64 2) = r_374_379 + u_374_379,
    s_374_380 * (const 64 2) = s_374_379 + v_374_379
;

assume
    neg_f_354_low60_20_low20_6 = neg_f_354_low60_20_low20_5,
    u_374_380 = u_374_379,
    v_374_380 = v_374_379,
    neg_g_354_low60_20_low20_6 * 2 = neg_g_354_low60_20_low20_5 + neg_f_354_low60_20_low20_5,
    r_374_380 * 2 = r_374_379 + u_374_379,
    s_374_380 * 2 = s_374_379 + v_374_379
&&
    true
;

{
    u_374_380 * neg_f_354_low60_20_low20_0 + v_374_380 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_380 * neg_f_354_low60_20_low20_0 + s_374_380 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_6 + u_374_380 * (const 64 (2**21)) + v_374_380 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_6 + r_374_380 * (const 64 (2**21)) + s_374_380 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_6,
    neg_f_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_6,
    neg_g_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 380)) <=s delta, delta <=s (const 64 (1 + 2*380)),
    (const 64 (-(2**20))) <=s u_374_380, u_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_380, v_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_380, r_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_380, s_374_380 <=s (const 64 ((2**20)-1)),
    u_374_380 + v_374_380 <=s (const 64 (2**20)),
    u_374_380 - v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 + v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 - v_374_380 <=s (const 64 (2**20)),
    r_374_380 + s_374_380 <=s (const 64 (2**20)),
    r_374_380 - s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 + s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 - s_374_380 <=s (const 64 (2**20)),
    u_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_374_380 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_379_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_5,
sint64 neg_g_354_low60_20_low20_5,
sint64 neg_f_354_low60_20_low20_6,
sint64 neg_g_354_low60_20_low20_6,
sint64 u_374_379,
sint64 v_374_379,
sint64 r_374_379,
sint64 s_374_379,
sint64 u_374_380,
sint64 v_374_380,
sint64 r_374_380,
sint64 s_374_380,
bit ne
)={
    u_374_379 * neg_f_354_low60_20_low20_0 + v_374_379 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_5 * (-(2**20)),
    r_374_379 * neg_f_354_low60_20_low20_0 + s_374_379 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_5 * (-(2**20))
&&
    u_374_379 * neg_f_354_low60_20_low20_0 + v_374_379 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_5 * (const 64 (-(2**20))),
    r_374_379 * neg_f_354_low60_20_low20_0 + s_374_379 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_5 + u_374_379 * (const 64 (2**21)) + v_374_379 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_5 + r_374_379 * (const 64 (2**21)) + s_374_379 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_5,
    neg_f_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_5,
    neg_g_354_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 379)) <=s delta, delta <=s (const 64 (1 + 2*379)),
    (const 64 (-(2**20))) <=s u_374_379, u_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_379, v_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_379, r_374_379 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_379, s_374_379 <=s (const 64 ((2**20)-1)),
    u_374_379 + v_374_379 <=s (const 64 (2**20)),
    u_374_379 - v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 + v_374_379 <=s (const 64 (2**20)),
    (const 64 0) - u_374_379 - v_374_379 <=s (const 64 (2**20)),
    r_374_379 + s_374_379 <=s (const 64 (2**20)),
    r_374_379 - s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 + s_374_379 <=s (const 64 (2**20)),
    (const 64 0) - r_374_379 - s_374_379 <=s (const 64 (2**20)),
    u_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_374_379 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_374_379 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step379

// premise c
assume
neg_g_354_low60_20_low20_5 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_6 neg_g_354_low60_20_low20_5;
mov u_374_380 r_374_379;
mov v_374_380 s_374_379;

subs dc neg_g_354_low60_20_low20_6 neg_g_354_low60_20_low20_5 neg_f_354_low60_20_low20_5;
asr neg_g_354_low60_20_low20_6 neg_g_354_low60_20_low20_6 1;
subs dc r_374_380 r_374_379 u_374_379;
asr r_374_380 r_374_380 1;
subs dc s_374_380 s_374_379 v_374_379;
asr s_374_380 s_374_380 1;
assert
    true
&&
    neg_f_354_low60_20_low20_6 = neg_g_354_low60_20_low20_5,
    u_374_380 = r_374_379,
    v_374_380 = s_374_379,
    neg_g_354_low60_20_low20_6 * (const 64 2) = neg_g_354_low60_20_low20_5 - neg_f_354_low60_20_low20_5,
    r_374_380 * (const 64 2) = r_374_379 - u_374_379,
    s_374_380 * (const 64 2) = s_374_379 - v_374_379
;

assume
    neg_f_354_low60_20_low20_6 = neg_g_354_low60_20_low20_5,
    u_374_380 = r_374_379,
    v_374_380 = s_374_379,
    neg_g_354_low60_20_low20_6 * 2 = neg_g_354_low60_20_low20_5 - neg_f_354_low60_20_low20_5,
    r_374_380 * 2 = r_374_379 - u_374_379,
    s_374_380 * 2 = s_374_379 - v_374_379
&&
    true
;

{
    u_374_380 * neg_f_354_low60_20_low20_0 + v_374_380 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_380 * neg_f_354_low60_20_low20_0 + s_374_380 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_6 + u_374_380 * (const 64 (2**21)) + v_374_380 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_6 + r_374_380 * (const 64 (2**21)) + s_374_380 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_6,
    neg_f_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_6,
    neg_g_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 380)) <=s delta, delta <=s (const 64 (1 + 2*380)),
    (const 64 (-(2**20))) <=s u_374_380, u_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_380, v_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_380, r_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_380, s_374_380 <=s (const 64 ((2**20)-1)),
    u_374_380 + v_374_380 <=s (const 64 (2**20)),
    u_374_380 - v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 + v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 - v_374_380 <=s (const 64 (2**20)),
    r_374_380 + s_374_380 <=s (const 64 (2**20)),
    r_374_380 - s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 + s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 - s_374_380 <=s (const 64 (2**20)),
    u_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_374_380 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_380_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_6,
sint64 neg_g_354_low60_20_low20_6,
sint64 neg_f_354_low60_20_low20_7,
sint64 neg_g_354_low60_20_low20_7,
sint64 u_374_380,
sint64 v_374_380,
sint64 r_374_380,
sint64 s_374_380,
sint64 u_374_381,
sint64 v_374_381,
sint64 r_374_381,
sint64 s_374_381,
bit ne
)={
    u_374_380 * neg_f_354_low60_20_low20_0 + v_374_380 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_6 * (-(2**20)),
    r_374_380 * neg_f_354_low60_20_low20_0 + s_374_380 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_6 * (-(2**20))
&&
    u_374_380 * neg_f_354_low60_20_low20_0 + v_374_380 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_6 * (const 64 (-(2**20))),
    r_374_380 * neg_f_354_low60_20_low20_0 + s_374_380 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_6 + u_374_380 * (const 64 (2**21)) + v_374_380 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_6 + r_374_380 * (const 64 (2**21)) + s_374_380 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_6,
    neg_f_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_6,
    neg_g_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 380)) <=s delta, delta <=s (const 64 (1 + 2*380)),
    (const 64 (-(2**20))) <=s u_374_380, u_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_380, v_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_380, r_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_380, s_374_380 <=s (const 64 ((2**20)-1)),
    u_374_380 + v_374_380 <=s (const 64 (2**20)),
    u_374_380 - v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 + v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 - v_374_380 <=s (const 64 (2**20)),
    r_374_380 + s_374_380 <=s (const 64 (2**20)),
    r_374_380 - s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 + s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 - s_374_380 <=s (const 64 (2**20)),
    u_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_374_380 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step380

// premise a
assume
neg_g_354_low60_20_low20_6 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_6 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_7 neg_f_354_low60_20_low20_6;
mov u_374_381 u_374_380;
mov v_374_381 v_374_380;

asr neg_g_354_low60_20_low20_7 neg_g_354_low60_20_low20_6 1;
asr r_374_381 r_374_380 1;
asr s_374_381 s_374_380 1;
assert
    true
&&
    neg_f_354_low60_20_low20_7 = neg_f_354_low60_20_low20_6,
    u_374_381 = u_374_380,
    v_374_381 = v_374_380,
    neg_g_354_low60_20_low20_7 * (const 64 2) = neg_g_354_low60_20_low20_6,
    r_374_381 * (const 64 2) = r_374_380,
    s_374_381 * (const 64 2) = s_374_380
;

assume
    neg_f_354_low60_20_low20_7 = neg_f_354_low60_20_low20_6,
    u_374_381 = u_374_380,
    v_374_381 = v_374_380,
    neg_g_354_low60_20_low20_7 * 2 = neg_g_354_low60_20_low20_6,
    r_374_381 * 2 = r_374_380,
    s_374_381 * 2 = s_374_380
&&
    true
;

{
    u_374_381 * neg_f_354_low60_20_low20_0 + v_374_381 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_381 * neg_f_354_low60_20_low20_0 + s_374_381 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_7 + u_374_381 * (const 64 (2**21)) + v_374_381 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_7 + r_374_381 * (const 64 (2**21)) + s_374_381 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_7,
    neg_f_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_7,
    neg_g_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 381)) <=s delta, delta <=s (const 64 (1 + 2*381)),
    (const 64 (-(2**20))) <=s u_374_381, u_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_381, v_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_381, r_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_381, s_374_381 <=s (const 64 ((2**20)-1)),
    u_374_381 + v_374_381 <=s (const 64 (2**20)),
    u_374_381 - v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 + v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 - v_374_381 <=s (const 64 (2**20)),
    r_374_381 + s_374_381 <=s (const 64 (2**20)),
    r_374_381 - s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 + s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 - s_374_381 <=s (const 64 (2**20)),
    u_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_374_381 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_380_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_6,
sint64 neg_g_354_low60_20_low20_6,
sint64 neg_f_354_low60_20_low20_7,
sint64 neg_g_354_low60_20_low20_7,
sint64 u_374_380,
sint64 v_374_380,
sint64 r_374_380,
sint64 s_374_380,
sint64 u_374_381,
sint64 v_374_381,
sint64 r_374_381,
sint64 s_374_381,
bit ne
)={
    u_374_380 * neg_f_354_low60_20_low20_0 + v_374_380 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_6 * (-(2**20)),
    r_374_380 * neg_f_354_low60_20_low20_0 + s_374_380 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_6 * (-(2**20))
&&
    u_374_380 * neg_f_354_low60_20_low20_0 + v_374_380 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_6 * (const 64 (-(2**20))),
    r_374_380 * neg_f_354_low60_20_low20_0 + s_374_380 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_6 + u_374_380 * (const 64 (2**21)) + v_374_380 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_6 + r_374_380 * (const 64 (2**21)) + s_374_380 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_6,
    neg_f_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_6,
    neg_g_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 380)) <=s delta, delta <=s (const 64 (1 + 2*380)),
    (const 64 (-(2**20))) <=s u_374_380, u_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_380, v_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_380, r_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_380, s_374_380 <=s (const 64 ((2**20)-1)),
    u_374_380 + v_374_380 <=s (const 64 (2**20)),
    u_374_380 - v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 + v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 - v_374_380 <=s (const 64 (2**20)),
    r_374_380 + s_374_380 <=s (const 64 (2**20)),
    r_374_380 - s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 + s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 - s_374_380 <=s (const 64 (2**20)),
    u_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_374_380 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step380

// premise b
assume
neg_g_354_low60_20_low20_6 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_7 neg_f_354_low60_20_low20_6;
mov u_374_381 u_374_380;
mov v_374_381 v_374_380;

add neg_g_354_low60_20_low20_7 neg_g_354_low60_20_low20_6 neg_f_354_low60_20_low20_6;
asr neg_g_354_low60_20_low20_7 neg_g_354_low60_20_low20_7 1;
add r_374_381 r_374_380 u_374_380;
asr r_374_381 r_374_381 1;
add s_374_381 s_374_380 v_374_380;
asr s_374_381 s_374_381 1;
assert
    true
&&
    neg_f_354_low60_20_low20_7 = neg_f_354_low60_20_low20_6,
    u_374_381 = u_374_380,
    v_374_381 = v_374_380,
    neg_g_354_low60_20_low20_7 * (const 64 2) = neg_g_354_low60_20_low20_6 + neg_f_354_low60_20_low20_6,
    r_374_381 * (const 64 2) = r_374_380 + u_374_380,
    s_374_381 * (const 64 2) = s_374_380 + v_374_380
;

assume
    neg_f_354_low60_20_low20_7 = neg_f_354_low60_20_low20_6,
    u_374_381 = u_374_380,
    v_374_381 = v_374_380,
    neg_g_354_low60_20_low20_7 * 2 = neg_g_354_low60_20_low20_6 + neg_f_354_low60_20_low20_6,
    r_374_381 * 2 = r_374_380 + u_374_380,
    s_374_381 * 2 = s_374_380 + v_374_380
&&
    true
;

{
    u_374_381 * neg_f_354_low60_20_low20_0 + v_374_381 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_381 * neg_f_354_low60_20_low20_0 + s_374_381 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_7 + u_374_381 * (const 64 (2**21)) + v_374_381 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_7 + r_374_381 * (const 64 (2**21)) + s_374_381 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_7,
    neg_f_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_7,
    neg_g_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 381)) <=s delta, delta <=s (const 64 (1 + 2*381)),
    (const 64 (-(2**20))) <=s u_374_381, u_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_381, v_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_381, r_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_381, s_374_381 <=s (const 64 ((2**20)-1)),
    u_374_381 + v_374_381 <=s (const 64 (2**20)),
    u_374_381 - v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 + v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 - v_374_381 <=s (const 64 (2**20)),
    r_374_381 + s_374_381 <=s (const 64 (2**20)),
    r_374_381 - s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 + s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 - s_374_381 <=s (const 64 (2**20)),
    u_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_374_381 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_380_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_6,
sint64 neg_g_354_low60_20_low20_6,
sint64 neg_f_354_low60_20_low20_7,
sint64 neg_g_354_low60_20_low20_7,
sint64 u_374_380,
sint64 v_374_380,
sint64 r_374_380,
sint64 s_374_380,
sint64 u_374_381,
sint64 v_374_381,
sint64 r_374_381,
sint64 s_374_381,
bit ne
)={
    u_374_380 * neg_f_354_low60_20_low20_0 + v_374_380 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_6 * (-(2**20)),
    r_374_380 * neg_f_354_low60_20_low20_0 + s_374_380 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_6 * (-(2**20))
&&
    u_374_380 * neg_f_354_low60_20_low20_0 + v_374_380 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_6 * (const 64 (-(2**20))),
    r_374_380 * neg_f_354_low60_20_low20_0 + s_374_380 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_6 + u_374_380 * (const 64 (2**21)) + v_374_380 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_6 + r_374_380 * (const 64 (2**21)) + s_374_380 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_6,
    neg_f_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_6,
    neg_g_354_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 380)) <=s delta, delta <=s (const 64 (1 + 2*380)),
    (const 64 (-(2**20))) <=s u_374_380, u_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_380, v_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_380, r_374_380 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_380, s_374_380 <=s (const 64 ((2**20)-1)),
    u_374_380 + v_374_380 <=s (const 64 (2**20)),
    u_374_380 - v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 + v_374_380 <=s (const 64 (2**20)),
    (const 64 0) - u_374_380 - v_374_380 <=s (const 64 (2**20)),
    r_374_380 + s_374_380 <=s (const 64 (2**20)),
    r_374_380 - s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 + s_374_380 <=s (const 64 (2**20)),
    (const 64 0) - r_374_380 - s_374_380 <=s (const 64 (2**20)),
    u_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_374_380 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_374_380 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step380

// premise c
assume
neg_g_354_low60_20_low20_6 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_7 neg_g_354_low60_20_low20_6;
mov u_374_381 r_374_380;
mov v_374_381 s_374_380;

subs dc neg_g_354_low60_20_low20_7 neg_g_354_low60_20_low20_6 neg_f_354_low60_20_low20_6;
asr neg_g_354_low60_20_low20_7 neg_g_354_low60_20_low20_7 1;
subs dc r_374_381 r_374_380 u_374_380;
asr r_374_381 r_374_381 1;
subs dc s_374_381 s_374_380 v_374_380;
asr s_374_381 s_374_381 1;
assert
    true
&&
    neg_f_354_low60_20_low20_7 = neg_g_354_low60_20_low20_6,
    u_374_381 = r_374_380,
    v_374_381 = s_374_380,
    neg_g_354_low60_20_low20_7 * (const 64 2) = neg_g_354_low60_20_low20_6 - neg_f_354_low60_20_low20_6,
    r_374_381 * (const 64 2) = r_374_380 - u_374_380,
    s_374_381 * (const 64 2) = s_374_380 - v_374_380
;

assume
    neg_f_354_low60_20_low20_7 = neg_g_354_low60_20_low20_6,
    u_374_381 = r_374_380,
    v_374_381 = s_374_380,
    neg_g_354_low60_20_low20_7 * 2 = neg_g_354_low60_20_low20_6 - neg_f_354_low60_20_low20_6,
    r_374_381 * 2 = r_374_380 - u_374_380,
    s_374_381 * 2 = s_374_380 - v_374_380
&&
    true
;

{
    u_374_381 * neg_f_354_low60_20_low20_0 + v_374_381 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_381 * neg_f_354_low60_20_low20_0 + s_374_381 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_7 + u_374_381 * (const 64 (2**21)) + v_374_381 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_7 + r_374_381 * (const 64 (2**21)) + s_374_381 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_7,
    neg_f_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_7,
    neg_g_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 381)) <=s delta, delta <=s (const 64 (1 + 2*381)),
    (const 64 (-(2**20))) <=s u_374_381, u_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_381, v_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_381, r_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_381, s_374_381 <=s (const 64 ((2**20)-1)),
    u_374_381 + v_374_381 <=s (const 64 (2**20)),
    u_374_381 - v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 + v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 - v_374_381 <=s (const 64 (2**20)),
    r_374_381 + s_374_381 <=s (const 64 (2**20)),
    r_374_381 - s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 + s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 - s_374_381 <=s (const 64 (2**20)),
    u_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_374_381 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_381_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_7,
sint64 neg_g_354_low60_20_low20_7,
sint64 neg_f_354_low60_20_low20_8,
sint64 neg_g_354_low60_20_low20_8,
sint64 u_374_381,
sint64 v_374_381,
sint64 r_374_381,
sint64 s_374_381,
sint64 u_374_382,
sint64 v_374_382,
sint64 r_374_382,
sint64 s_374_382,
bit ne
)={
    u_374_381 * neg_f_354_low60_20_low20_0 + v_374_381 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_7 * (-(2**20)),
    r_374_381 * neg_f_354_low60_20_low20_0 + s_374_381 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_7 * (-(2**20))
&&
    u_374_381 * neg_f_354_low60_20_low20_0 + v_374_381 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_7 * (const 64 (-(2**20))),
    r_374_381 * neg_f_354_low60_20_low20_0 + s_374_381 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_7 + u_374_381 * (const 64 (2**21)) + v_374_381 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_7 + r_374_381 * (const 64 (2**21)) + s_374_381 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_7,
    neg_f_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_7,
    neg_g_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 381)) <=s delta, delta <=s (const 64 (1 + 2*381)),
    (const 64 (-(2**20))) <=s u_374_381, u_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_381, v_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_381, r_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_381, s_374_381 <=s (const 64 ((2**20)-1)),
    u_374_381 + v_374_381 <=s (const 64 (2**20)),
    u_374_381 - v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 + v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 - v_374_381 <=s (const 64 (2**20)),
    r_374_381 + s_374_381 <=s (const 64 (2**20)),
    r_374_381 - s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 + s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 - s_374_381 <=s (const 64 (2**20)),
    u_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_374_381 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step381

// premise a
assume
neg_g_354_low60_20_low20_7 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_7 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_8 neg_f_354_low60_20_low20_7;
mov u_374_382 u_374_381;
mov v_374_382 v_374_381;

asr neg_g_354_low60_20_low20_8 neg_g_354_low60_20_low20_7 1;
asr r_374_382 r_374_381 1;
asr s_374_382 s_374_381 1;
assert
    true
&&
    neg_f_354_low60_20_low20_8 = neg_f_354_low60_20_low20_7,
    u_374_382 = u_374_381,
    v_374_382 = v_374_381,
    neg_g_354_low60_20_low20_8 * (const 64 2) = neg_g_354_low60_20_low20_7,
    r_374_382 * (const 64 2) = r_374_381,
    s_374_382 * (const 64 2) = s_374_381
;

assume
    neg_f_354_low60_20_low20_8 = neg_f_354_low60_20_low20_7,
    u_374_382 = u_374_381,
    v_374_382 = v_374_381,
    neg_g_354_low60_20_low20_8 * 2 = neg_g_354_low60_20_low20_7,
    r_374_382 * 2 = r_374_381,
    s_374_382 * 2 = s_374_381
&&
    true
;

{
    u_374_382 * neg_f_354_low60_20_low20_0 + v_374_382 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_382 * neg_f_354_low60_20_low20_0 + s_374_382 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_8 + u_374_382 * (const 64 (2**21)) + v_374_382 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_8 + r_374_382 * (const 64 (2**21)) + s_374_382 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_8,
    neg_f_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_8,
    neg_g_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 382)) <=s delta, delta <=s (const 64 (1 + 2*382)),
    (const 64 (-(2**20))) <=s u_374_382, u_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_382, v_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_382, r_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_382, s_374_382 <=s (const 64 ((2**20)-1)),
    u_374_382 + v_374_382 <=s (const 64 (2**20)),
    u_374_382 - v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 + v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 - v_374_382 <=s (const 64 (2**20)),
    r_374_382 + s_374_382 <=s (const 64 (2**20)),
    r_374_382 - s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 + s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 - s_374_382 <=s (const 64 (2**20)),
    u_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_374_382 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_381_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_7,
sint64 neg_g_354_low60_20_low20_7,
sint64 neg_f_354_low60_20_low20_8,
sint64 neg_g_354_low60_20_low20_8,
sint64 u_374_381,
sint64 v_374_381,
sint64 r_374_381,
sint64 s_374_381,
sint64 u_374_382,
sint64 v_374_382,
sint64 r_374_382,
sint64 s_374_382,
bit ne
)={
    u_374_381 * neg_f_354_low60_20_low20_0 + v_374_381 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_7 * (-(2**20)),
    r_374_381 * neg_f_354_low60_20_low20_0 + s_374_381 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_7 * (-(2**20))
&&
    u_374_381 * neg_f_354_low60_20_low20_0 + v_374_381 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_7 * (const 64 (-(2**20))),
    r_374_381 * neg_f_354_low60_20_low20_0 + s_374_381 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_7 + u_374_381 * (const 64 (2**21)) + v_374_381 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_7 + r_374_381 * (const 64 (2**21)) + s_374_381 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_7,
    neg_f_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_7,
    neg_g_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 381)) <=s delta, delta <=s (const 64 (1 + 2*381)),
    (const 64 (-(2**20))) <=s u_374_381, u_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_381, v_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_381, r_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_381, s_374_381 <=s (const 64 ((2**20)-1)),
    u_374_381 + v_374_381 <=s (const 64 (2**20)),
    u_374_381 - v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 + v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 - v_374_381 <=s (const 64 (2**20)),
    r_374_381 + s_374_381 <=s (const 64 (2**20)),
    r_374_381 - s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 + s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 - s_374_381 <=s (const 64 (2**20)),
    u_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_374_381 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step381

// premise b
assume
neg_g_354_low60_20_low20_7 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_8 neg_f_354_low60_20_low20_7;
mov u_374_382 u_374_381;
mov v_374_382 v_374_381;

add neg_g_354_low60_20_low20_8 neg_g_354_low60_20_low20_7 neg_f_354_low60_20_low20_7;
asr neg_g_354_low60_20_low20_8 neg_g_354_low60_20_low20_8 1;
add r_374_382 r_374_381 u_374_381;
asr r_374_382 r_374_382 1;
add s_374_382 s_374_381 v_374_381;
asr s_374_382 s_374_382 1;
assert
    true
&&
    neg_f_354_low60_20_low20_8 = neg_f_354_low60_20_low20_7,
    u_374_382 = u_374_381,
    v_374_382 = v_374_381,
    neg_g_354_low60_20_low20_8 * (const 64 2) = neg_g_354_low60_20_low20_7 + neg_f_354_low60_20_low20_7,
    r_374_382 * (const 64 2) = r_374_381 + u_374_381,
    s_374_382 * (const 64 2) = s_374_381 + v_374_381
;

assume
    neg_f_354_low60_20_low20_8 = neg_f_354_low60_20_low20_7,
    u_374_382 = u_374_381,
    v_374_382 = v_374_381,
    neg_g_354_low60_20_low20_8 * 2 = neg_g_354_low60_20_low20_7 + neg_f_354_low60_20_low20_7,
    r_374_382 * 2 = r_374_381 + u_374_381,
    s_374_382 * 2 = s_374_381 + v_374_381
&&
    true
;

{
    u_374_382 * neg_f_354_low60_20_low20_0 + v_374_382 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_382 * neg_f_354_low60_20_low20_0 + s_374_382 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_8 + u_374_382 * (const 64 (2**21)) + v_374_382 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_8 + r_374_382 * (const 64 (2**21)) + s_374_382 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_8,
    neg_f_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_8,
    neg_g_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 382)) <=s delta, delta <=s (const 64 (1 + 2*382)),
    (const 64 (-(2**20))) <=s u_374_382, u_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_382, v_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_382, r_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_382, s_374_382 <=s (const 64 ((2**20)-1)),
    u_374_382 + v_374_382 <=s (const 64 (2**20)),
    u_374_382 - v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 + v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 - v_374_382 <=s (const 64 (2**20)),
    r_374_382 + s_374_382 <=s (const 64 (2**20)),
    r_374_382 - s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 + s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 - s_374_382 <=s (const 64 (2**20)),
    u_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_374_382 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_381_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_7,
sint64 neg_g_354_low60_20_low20_7,
sint64 neg_f_354_low60_20_low20_8,
sint64 neg_g_354_low60_20_low20_8,
sint64 u_374_381,
sint64 v_374_381,
sint64 r_374_381,
sint64 s_374_381,
sint64 u_374_382,
sint64 v_374_382,
sint64 r_374_382,
sint64 s_374_382,
bit ne
)={
    u_374_381 * neg_f_354_low60_20_low20_0 + v_374_381 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_7 * (-(2**20)),
    r_374_381 * neg_f_354_low60_20_low20_0 + s_374_381 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_7 * (-(2**20))
&&
    u_374_381 * neg_f_354_low60_20_low20_0 + v_374_381 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_7 * (const 64 (-(2**20))),
    r_374_381 * neg_f_354_low60_20_low20_0 + s_374_381 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_7 + u_374_381 * (const 64 (2**21)) + v_374_381 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_7 + r_374_381 * (const 64 (2**21)) + s_374_381 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_7,
    neg_f_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_7,
    neg_g_354_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 381)) <=s delta, delta <=s (const 64 (1 + 2*381)),
    (const 64 (-(2**20))) <=s u_374_381, u_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_381, v_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_381, r_374_381 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_381, s_374_381 <=s (const 64 ((2**20)-1)),
    u_374_381 + v_374_381 <=s (const 64 (2**20)),
    u_374_381 - v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 + v_374_381 <=s (const 64 (2**20)),
    (const 64 0) - u_374_381 - v_374_381 <=s (const 64 (2**20)),
    r_374_381 + s_374_381 <=s (const 64 (2**20)),
    r_374_381 - s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 + s_374_381 <=s (const 64 (2**20)),
    (const 64 0) - r_374_381 - s_374_381 <=s (const 64 (2**20)),
    u_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_374_381 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_374_381 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step381

// premise c
assume
neg_g_354_low60_20_low20_7 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_8 neg_g_354_low60_20_low20_7;
mov u_374_382 r_374_381;
mov v_374_382 s_374_381;

subs dc neg_g_354_low60_20_low20_8 neg_g_354_low60_20_low20_7 neg_f_354_low60_20_low20_7;
asr neg_g_354_low60_20_low20_8 neg_g_354_low60_20_low20_8 1;
subs dc r_374_382 r_374_381 u_374_381;
asr r_374_382 r_374_382 1;
subs dc s_374_382 s_374_381 v_374_381;
asr s_374_382 s_374_382 1;
assert
    true
&&
    neg_f_354_low60_20_low20_8 = neg_g_354_low60_20_low20_7,
    u_374_382 = r_374_381,
    v_374_382 = s_374_381,
    neg_g_354_low60_20_low20_8 * (const 64 2) = neg_g_354_low60_20_low20_7 - neg_f_354_low60_20_low20_7,
    r_374_382 * (const 64 2) = r_374_381 - u_374_381,
    s_374_382 * (const 64 2) = s_374_381 - v_374_381
;

assume
    neg_f_354_low60_20_low20_8 = neg_g_354_low60_20_low20_7,
    u_374_382 = r_374_381,
    v_374_382 = s_374_381,
    neg_g_354_low60_20_low20_8 * 2 = neg_g_354_low60_20_low20_7 - neg_f_354_low60_20_low20_7,
    r_374_382 * 2 = r_374_381 - u_374_381,
    s_374_382 * 2 = s_374_381 - v_374_381
&&
    true
;

{
    u_374_382 * neg_f_354_low60_20_low20_0 + v_374_382 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_382 * neg_f_354_low60_20_low20_0 + s_374_382 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_8 + u_374_382 * (const 64 (2**21)) + v_374_382 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_8 + r_374_382 * (const 64 (2**21)) + s_374_382 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_8,
    neg_f_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_8,
    neg_g_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 382)) <=s delta, delta <=s (const 64 (1 + 2*382)),
    (const 64 (-(2**20))) <=s u_374_382, u_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_382, v_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_382, r_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_382, s_374_382 <=s (const 64 ((2**20)-1)),
    u_374_382 + v_374_382 <=s (const 64 (2**20)),
    u_374_382 - v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 + v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 - v_374_382 <=s (const 64 (2**20)),
    r_374_382 + s_374_382 <=s (const 64 (2**20)),
    r_374_382 - s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 + s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 - s_374_382 <=s (const 64 (2**20)),
    u_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_374_382 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_382_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_8,
sint64 neg_g_354_low60_20_low20_8,
sint64 neg_f_354_low60_20_low20_9,
sint64 neg_g_354_low60_20_low20_9,
sint64 u_374_382,
sint64 v_374_382,
sint64 r_374_382,
sint64 s_374_382,
sint64 u_374_383,
sint64 v_374_383,
sint64 r_374_383,
sint64 s_374_383,
bit ne
)={
    u_374_382 * neg_f_354_low60_20_low20_0 + v_374_382 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_8 * (-(2**20)),
    r_374_382 * neg_f_354_low60_20_low20_0 + s_374_382 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_8 * (-(2**20))
&&
    u_374_382 * neg_f_354_low60_20_low20_0 + v_374_382 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_8 * (const 64 (-(2**20))),
    r_374_382 * neg_f_354_low60_20_low20_0 + s_374_382 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_8 + u_374_382 * (const 64 (2**21)) + v_374_382 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_8 + r_374_382 * (const 64 (2**21)) + s_374_382 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_8,
    neg_f_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_8,
    neg_g_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 382)) <=s delta, delta <=s (const 64 (1 + 2*382)),
    (const 64 (-(2**20))) <=s u_374_382, u_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_382, v_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_382, r_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_382, s_374_382 <=s (const 64 ((2**20)-1)),
    u_374_382 + v_374_382 <=s (const 64 (2**20)),
    u_374_382 - v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 + v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 - v_374_382 <=s (const 64 (2**20)),
    r_374_382 + s_374_382 <=s (const 64 (2**20)),
    r_374_382 - s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 + s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 - s_374_382 <=s (const 64 (2**20)),
    u_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_374_382 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step382

// premise a
assume
neg_g_354_low60_20_low20_8 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_8 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_9 neg_f_354_low60_20_low20_8;
mov u_374_383 u_374_382;
mov v_374_383 v_374_382;

asr neg_g_354_low60_20_low20_9 neg_g_354_low60_20_low20_8 1;
asr r_374_383 r_374_382 1;
asr s_374_383 s_374_382 1;
assert
    true
&&
    neg_f_354_low60_20_low20_9 = neg_f_354_low60_20_low20_8,
    u_374_383 = u_374_382,
    v_374_383 = v_374_382,
    neg_g_354_low60_20_low20_9 * (const 64 2) = neg_g_354_low60_20_low20_8,
    r_374_383 * (const 64 2) = r_374_382,
    s_374_383 * (const 64 2) = s_374_382
;

assume
    neg_f_354_low60_20_low20_9 = neg_f_354_low60_20_low20_8,
    u_374_383 = u_374_382,
    v_374_383 = v_374_382,
    neg_g_354_low60_20_low20_9 * 2 = neg_g_354_low60_20_low20_8,
    r_374_383 * 2 = r_374_382,
    s_374_383 * 2 = s_374_382
&&
    true
;

{
    u_374_383 * neg_f_354_low60_20_low20_0 + v_374_383 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_383 * neg_f_354_low60_20_low20_0 + s_374_383 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_9 + u_374_383 * (const 64 (2**21)) + v_374_383 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_9 + r_374_383 * (const 64 (2**21)) + s_374_383 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_9,
    neg_f_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_9,
    neg_g_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 383)) <=s delta, delta <=s (const 64 (1 + 2*383)),
    (const 64 (-(2**20))) <=s u_374_383, u_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_383, v_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_383, r_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_383, s_374_383 <=s (const 64 ((2**20)-1)),
    u_374_383 + v_374_383 <=s (const 64 (2**20)),
    u_374_383 - v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 + v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 - v_374_383 <=s (const 64 (2**20)),
    r_374_383 + s_374_383 <=s (const 64 (2**20)),
    r_374_383 - s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 + s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 - s_374_383 <=s (const 64 (2**20)),
    u_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_374_383 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_382_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_8,
sint64 neg_g_354_low60_20_low20_8,
sint64 neg_f_354_low60_20_low20_9,
sint64 neg_g_354_low60_20_low20_9,
sint64 u_374_382,
sint64 v_374_382,
sint64 r_374_382,
sint64 s_374_382,
sint64 u_374_383,
sint64 v_374_383,
sint64 r_374_383,
sint64 s_374_383,
bit ne
)={
    u_374_382 * neg_f_354_low60_20_low20_0 + v_374_382 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_8 * (-(2**20)),
    r_374_382 * neg_f_354_low60_20_low20_0 + s_374_382 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_8 * (-(2**20))
&&
    u_374_382 * neg_f_354_low60_20_low20_0 + v_374_382 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_8 * (const 64 (-(2**20))),
    r_374_382 * neg_f_354_low60_20_low20_0 + s_374_382 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_8 + u_374_382 * (const 64 (2**21)) + v_374_382 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_8 + r_374_382 * (const 64 (2**21)) + s_374_382 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_8,
    neg_f_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_8,
    neg_g_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 382)) <=s delta, delta <=s (const 64 (1 + 2*382)),
    (const 64 (-(2**20))) <=s u_374_382, u_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_382, v_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_382, r_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_382, s_374_382 <=s (const 64 ((2**20)-1)),
    u_374_382 + v_374_382 <=s (const 64 (2**20)),
    u_374_382 - v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 + v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 - v_374_382 <=s (const 64 (2**20)),
    r_374_382 + s_374_382 <=s (const 64 (2**20)),
    r_374_382 - s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 + s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 - s_374_382 <=s (const 64 (2**20)),
    u_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_374_382 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step382

// premise b
assume
neg_g_354_low60_20_low20_8 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_9 neg_f_354_low60_20_low20_8;
mov u_374_383 u_374_382;
mov v_374_383 v_374_382;

add neg_g_354_low60_20_low20_9 neg_g_354_low60_20_low20_8 neg_f_354_low60_20_low20_8;
asr neg_g_354_low60_20_low20_9 neg_g_354_low60_20_low20_9 1;
add r_374_383 r_374_382 u_374_382;
asr r_374_383 r_374_383 1;
add s_374_383 s_374_382 v_374_382;
asr s_374_383 s_374_383 1;
assert
    true
&&
    neg_f_354_low60_20_low20_9 = neg_f_354_low60_20_low20_8,
    u_374_383 = u_374_382,
    v_374_383 = v_374_382,
    neg_g_354_low60_20_low20_9 * (const 64 2) = neg_g_354_low60_20_low20_8 + neg_f_354_low60_20_low20_8,
    r_374_383 * (const 64 2) = r_374_382 + u_374_382,
    s_374_383 * (const 64 2) = s_374_382 + v_374_382
;

assume
    neg_f_354_low60_20_low20_9 = neg_f_354_low60_20_low20_8,
    u_374_383 = u_374_382,
    v_374_383 = v_374_382,
    neg_g_354_low60_20_low20_9 * 2 = neg_g_354_low60_20_low20_8 + neg_f_354_low60_20_low20_8,
    r_374_383 * 2 = r_374_382 + u_374_382,
    s_374_383 * 2 = s_374_382 + v_374_382
&&
    true
;

{
    u_374_383 * neg_f_354_low60_20_low20_0 + v_374_383 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_383 * neg_f_354_low60_20_low20_0 + s_374_383 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_9 + u_374_383 * (const 64 (2**21)) + v_374_383 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_9 + r_374_383 * (const 64 (2**21)) + s_374_383 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_9,
    neg_f_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_9,
    neg_g_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 383)) <=s delta, delta <=s (const 64 (1 + 2*383)),
    (const 64 (-(2**20))) <=s u_374_383, u_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_383, v_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_383, r_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_383, s_374_383 <=s (const 64 ((2**20)-1)),
    u_374_383 + v_374_383 <=s (const 64 (2**20)),
    u_374_383 - v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 + v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 - v_374_383 <=s (const 64 (2**20)),
    r_374_383 + s_374_383 <=s (const 64 (2**20)),
    r_374_383 - s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 + s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 - s_374_383 <=s (const 64 (2**20)),
    u_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_374_383 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_382_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_8,
sint64 neg_g_354_low60_20_low20_8,
sint64 neg_f_354_low60_20_low20_9,
sint64 neg_g_354_low60_20_low20_9,
sint64 u_374_382,
sint64 v_374_382,
sint64 r_374_382,
sint64 s_374_382,
sint64 u_374_383,
sint64 v_374_383,
sint64 r_374_383,
sint64 s_374_383,
bit ne
)={
    u_374_382 * neg_f_354_low60_20_low20_0 + v_374_382 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_8 * (-(2**20)),
    r_374_382 * neg_f_354_low60_20_low20_0 + s_374_382 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_8 * (-(2**20))
&&
    u_374_382 * neg_f_354_low60_20_low20_0 + v_374_382 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_8 * (const 64 (-(2**20))),
    r_374_382 * neg_f_354_low60_20_low20_0 + s_374_382 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_8 + u_374_382 * (const 64 (2**21)) + v_374_382 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_8 + r_374_382 * (const 64 (2**21)) + s_374_382 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_8,
    neg_f_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_8,
    neg_g_354_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 382)) <=s delta, delta <=s (const 64 (1 + 2*382)),
    (const 64 (-(2**20))) <=s u_374_382, u_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_382, v_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_382, r_374_382 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_382, s_374_382 <=s (const 64 ((2**20)-1)),
    u_374_382 + v_374_382 <=s (const 64 (2**20)),
    u_374_382 - v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 + v_374_382 <=s (const 64 (2**20)),
    (const 64 0) - u_374_382 - v_374_382 <=s (const 64 (2**20)),
    r_374_382 + s_374_382 <=s (const 64 (2**20)),
    r_374_382 - s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 + s_374_382 <=s (const 64 (2**20)),
    (const 64 0) - r_374_382 - s_374_382 <=s (const 64 (2**20)),
    u_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_374_382 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_374_382 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step382

// premise c
assume
neg_g_354_low60_20_low20_8 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_9 neg_g_354_low60_20_low20_8;
mov u_374_383 r_374_382;
mov v_374_383 s_374_382;

subs dc neg_g_354_low60_20_low20_9 neg_g_354_low60_20_low20_8 neg_f_354_low60_20_low20_8;
asr neg_g_354_low60_20_low20_9 neg_g_354_low60_20_low20_9 1;
subs dc r_374_383 r_374_382 u_374_382;
asr r_374_383 r_374_383 1;
subs dc s_374_383 s_374_382 v_374_382;
asr s_374_383 s_374_383 1;
assert
    true
&&
    neg_f_354_low60_20_low20_9 = neg_g_354_low60_20_low20_8,
    u_374_383 = r_374_382,
    v_374_383 = s_374_382,
    neg_g_354_low60_20_low20_9 * (const 64 2) = neg_g_354_low60_20_low20_8 - neg_f_354_low60_20_low20_8,
    r_374_383 * (const 64 2) = r_374_382 - u_374_382,
    s_374_383 * (const 64 2) = s_374_382 - v_374_382
;

assume
    neg_f_354_low60_20_low20_9 = neg_g_354_low60_20_low20_8,
    u_374_383 = r_374_382,
    v_374_383 = s_374_382,
    neg_g_354_low60_20_low20_9 * 2 = neg_g_354_low60_20_low20_8 - neg_f_354_low60_20_low20_8,
    r_374_383 * 2 = r_374_382 - u_374_382,
    s_374_383 * 2 = s_374_382 - v_374_382
&&
    true
;

{
    u_374_383 * neg_f_354_low60_20_low20_0 + v_374_383 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_383 * neg_f_354_low60_20_low20_0 + s_374_383 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_9 + u_374_383 * (const 64 (2**21)) + v_374_383 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_9 + r_374_383 * (const 64 (2**21)) + s_374_383 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_9,
    neg_f_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_9,
    neg_g_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 383)) <=s delta, delta <=s (const 64 (1 + 2*383)),
    (const 64 (-(2**20))) <=s u_374_383, u_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_383, v_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_383, r_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_383, s_374_383 <=s (const 64 ((2**20)-1)),
    u_374_383 + v_374_383 <=s (const 64 (2**20)),
    u_374_383 - v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 + v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 - v_374_383 <=s (const 64 (2**20)),
    r_374_383 + s_374_383 <=s (const 64 (2**20)),
    r_374_383 - s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 + s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 - s_374_383 <=s (const 64 (2**20)),
    u_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_374_383 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_383_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_9,
sint64 neg_g_354_low60_20_low20_9,
sint64 neg_f_354_low60_20_low20_10,
sint64 neg_g_354_low60_20_low20_10,
sint64 u_374_383,
sint64 v_374_383,
sint64 r_374_383,
sint64 s_374_383,
sint64 u_374_384,
sint64 v_374_384,
sint64 r_374_384,
sint64 s_374_384,
bit ne
)={
    u_374_383 * neg_f_354_low60_20_low20_0 + v_374_383 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_9 * (-(2**20)),
    r_374_383 * neg_f_354_low60_20_low20_0 + s_374_383 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_9 * (-(2**20))
&&
    u_374_383 * neg_f_354_low60_20_low20_0 + v_374_383 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_9 * (const 64 (-(2**20))),
    r_374_383 * neg_f_354_low60_20_low20_0 + s_374_383 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_9 + u_374_383 * (const 64 (2**21)) + v_374_383 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_9 + r_374_383 * (const 64 (2**21)) + s_374_383 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_9,
    neg_f_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_9,
    neg_g_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 383)) <=s delta, delta <=s (const 64 (1 + 2*383)),
    (const 64 (-(2**20))) <=s u_374_383, u_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_383, v_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_383, r_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_383, s_374_383 <=s (const 64 ((2**20)-1)),
    u_374_383 + v_374_383 <=s (const 64 (2**20)),
    u_374_383 - v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 + v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 - v_374_383 <=s (const 64 (2**20)),
    r_374_383 + s_374_383 <=s (const 64 (2**20)),
    r_374_383 - s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 + s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 - s_374_383 <=s (const 64 (2**20)),
    u_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_374_383 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step383

// premise a
assume
neg_g_354_low60_20_low20_9 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_9 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_10 neg_f_354_low60_20_low20_9;
mov u_374_384 u_374_383;
mov v_374_384 v_374_383;

asr neg_g_354_low60_20_low20_10 neg_g_354_low60_20_low20_9 1;
asr r_374_384 r_374_383 1;
asr s_374_384 s_374_383 1;
assert
    true
&&
    neg_f_354_low60_20_low20_10 = neg_f_354_low60_20_low20_9,
    u_374_384 = u_374_383,
    v_374_384 = v_374_383,
    neg_g_354_low60_20_low20_10 * (const 64 2) = neg_g_354_low60_20_low20_9,
    r_374_384 * (const 64 2) = r_374_383,
    s_374_384 * (const 64 2) = s_374_383
;

assume
    neg_f_354_low60_20_low20_10 = neg_f_354_low60_20_low20_9,
    u_374_384 = u_374_383,
    v_374_384 = v_374_383,
    neg_g_354_low60_20_low20_10 * 2 = neg_g_354_low60_20_low20_9,
    r_374_384 * 2 = r_374_383,
    s_374_384 * 2 = s_374_383
&&
    true
;

{
    u_374_384 * neg_f_354_low60_20_low20_0 + v_374_384 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_384 * neg_f_354_low60_20_low20_0 + s_374_384 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_10 + u_374_384 * (const 64 (2**21)) + v_374_384 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_10 + r_374_384 * (const 64 (2**21)) + s_374_384 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_10,
    neg_f_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_10,
    neg_g_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 384)) <=s delta, delta <=s (const 64 (1 + 2*384)),
    (const 64 (-(2**20))) <=s u_374_384, u_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_384, v_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_384, r_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_384, s_374_384 <=s (const 64 ((2**20)-1)),
    u_374_384 + v_374_384 <=s (const 64 (2**20)),
    u_374_384 - v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 + v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 - v_374_384 <=s (const 64 (2**20)),
    r_374_384 + s_374_384 <=s (const 64 (2**20)),
    r_374_384 - s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 + s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 - s_374_384 <=s (const 64 (2**20)),
    u_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_374_384 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_383_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_9,
sint64 neg_g_354_low60_20_low20_9,
sint64 neg_f_354_low60_20_low20_10,
sint64 neg_g_354_low60_20_low20_10,
sint64 u_374_383,
sint64 v_374_383,
sint64 r_374_383,
sint64 s_374_383,
sint64 u_374_384,
sint64 v_374_384,
sint64 r_374_384,
sint64 s_374_384,
bit ne
)={
    u_374_383 * neg_f_354_low60_20_low20_0 + v_374_383 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_9 * (-(2**20)),
    r_374_383 * neg_f_354_low60_20_low20_0 + s_374_383 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_9 * (-(2**20))
&&
    u_374_383 * neg_f_354_low60_20_low20_0 + v_374_383 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_9 * (const 64 (-(2**20))),
    r_374_383 * neg_f_354_low60_20_low20_0 + s_374_383 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_9 + u_374_383 * (const 64 (2**21)) + v_374_383 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_9 + r_374_383 * (const 64 (2**21)) + s_374_383 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_9,
    neg_f_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_9,
    neg_g_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 383)) <=s delta, delta <=s (const 64 (1 + 2*383)),
    (const 64 (-(2**20))) <=s u_374_383, u_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_383, v_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_383, r_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_383, s_374_383 <=s (const 64 ((2**20)-1)),
    u_374_383 + v_374_383 <=s (const 64 (2**20)),
    u_374_383 - v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 + v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 - v_374_383 <=s (const 64 (2**20)),
    r_374_383 + s_374_383 <=s (const 64 (2**20)),
    r_374_383 - s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 + s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 - s_374_383 <=s (const 64 (2**20)),
    u_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_374_383 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step383

// premise b
assume
neg_g_354_low60_20_low20_9 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_10 neg_f_354_low60_20_low20_9;
mov u_374_384 u_374_383;
mov v_374_384 v_374_383;

add neg_g_354_low60_20_low20_10 neg_g_354_low60_20_low20_9 neg_f_354_low60_20_low20_9;
asr neg_g_354_low60_20_low20_10 neg_g_354_low60_20_low20_10 1;
add r_374_384 r_374_383 u_374_383;
asr r_374_384 r_374_384 1;
add s_374_384 s_374_383 v_374_383;
asr s_374_384 s_374_384 1;
assert
    true
&&
    neg_f_354_low60_20_low20_10 = neg_f_354_low60_20_low20_9,
    u_374_384 = u_374_383,
    v_374_384 = v_374_383,
    neg_g_354_low60_20_low20_10 * (const 64 2) = neg_g_354_low60_20_low20_9 + neg_f_354_low60_20_low20_9,
    r_374_384 * (const 64 2) = r_374_383 + u_374_383,
    s_374_384 * (const 64 2) = s_374_383 + v_374_383
;

assume
    neg_f_354_low60_20_low20_10 = neg_f_354_low60_20_low20_9,
    u_374_384 = u_374_383,
    v_374_384 = v_374_383,
    neg_g_354_low60_20_low20_10 * 2 = neg_g_354_low60_20_low20_9 + neg_f_354_low60_20_low20_9,
    r_374_384 * 2 = r_374_383 + u_374_383,
    s_374_384 * 2 = s_374_383 + v_374_383
&&
    true
;

{
    u_374_384 * neg_f_354_low60_20_low20_0 + v_374_384 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_384 * neg_f_354_low60_20_low20_0 + s_374_384 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_10 + u_374_384 * (const 64 (2**21)) + v_374_384 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_10 + r_374_384 * (const 64 (2**21)) + s_374_384 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_10,
    neg_f_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_10,
    neg_g_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 384)) <=s delta, delta <=s (const 64 (1 + 2*384)),
    (const 64 (-(2**20))) <=s u_374_384, u_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_384, v_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_384, r_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_384, s_374_384 <=s (const 64 ((2**20)-1)),
    u_374_384 + v_374_384 <=s (const 64 (2**20)),
    u_374_384 - v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 + v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 - v_374_384 <=s (const 64 (2**20)),
    r_374_384 + s_374_384 <=s (const 64 (2**20)),
    r_374_384 - s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 + s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 - s_374_384 <=s (const 64 (2**20)),
    u_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_374_384 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_383_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_9,
sint64 neg_g_354_low60_20_low20_9,
sint64 neg_f_354_low60_20_low20_10,
sint64 neg_g_354_low60_20_low20_10,
sint64 u_374_383,
sint64 v_374_383,
sint64 r_374_383,
sint64 s_374_383,
sint64 u_374_384,
sint64 v_374_384,
sint64 r_374_384,
sint64 s_374_384,
bit ne
)={
    u_374_383 * neg_f_354_low60_20_low20_0 + v_374_383 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_9 * (-(2**20)),
    r_374_383 * neg_f_354_low60_20_low20_0 + s_374_383 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_9 * (-(2**20))
&&
    u_374_383 * neg_f_354_low60_20_low20_0 + v_374_383 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_9 * (const 64 (-(2**20))),
    r_374_383 * neg_f_354_low60_20_low20_0 + s_374_383 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_9 + u_374_383 * (const 64 (2**21)) + v_374_383 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_9 + r_374_383 * (const 64 (2**21)) + s_374_383 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_9,
    neg_f_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_9,
    neg_g_354_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 383)) <=s delta, delta <=s (const 64 (1 + 2*383)),
    (const 64 (-(2**20))) <=s u_374_383, u_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_383, v_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_383, r_374_383 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_383, s_374_383 <=s (const 64 ((2**20)-1)),
    u_374_383 + v_374_383 <=s (const 64 (2**20)),
    u_374_383 - v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 + v_374_383 <=s (const 64 (2**20)),
    (const 64 0) - u_374_383 - v_374_383 <=s (const 64 (2**20)),
    r_374_383 + s_374_383 <=s (const 64 (2**20)),
    r_374_383 - s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 + s_374_383 <=s (const 64 (2**20)),
    (const 64 0) - r_374_383 - s_374_383 <=s (const 64 (2**20)),
    u_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_374_383 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_374_383 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step383

// premise c
assume
neg_g_354_low60_20_low20_9 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_10 neg_g_354_low60_20_low20_9;
mov u_374_384 r_374_383;
mov v_374_384 s_374_383;

subs dc neg_g_354_low60_20_low20_10 neg_g_354_low60_20_low20_9 neg_f_354_low60_20_low20_9;
asr neg_g_354_low60_20_low20_10 neg_g_354_low60_20_low20_10 1;
subs dc r_374_384 r_374_383 u_374_383;
asr r_374_384 r_374_384 1;
subs dc s_374_384 s_374_383 v_374_383;
asr s_374_384 s_374_384 1;
assert
    true
&&
    neg_f_354_low60_20_low20_10 = neg_g_354_low60_20_low20_9,
    u_374_384 = r_374_383,
    v_374_384 = s_374_383,
    neg_g_354_low60_20_low20_10 * (const 64 2) = neg_g_354_low60_20_low20_9 - neg_f_354_low60_20_low20_9,
    r_374_384 * (const 64 2) = r_374_383 - u_374_383,
    s_374_384 * (const 64 2) = s_374_383 - v_374_383
;

assume
    neg_f_354_low60_20_low20_10 = neg_g_354_low60_20_low20_9,
    u_374_384 = r_374_383,
    v_374_384 = s_374_383,
    neg_g_354_low60_20_low20_10 * 2 = neg_g_354_low60_20_low20_9 - neg_f_354_low60_20_low20_9,
    r_374_384 * 2 = r_374_383 - u_374_383,
    s_374_384 * 2 = s_374_383 - v_374_383
&&
    true
;

{
    u_374_384 * neg_f_354_low60_20_low20_0 + v_374_384 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_384 * neg_f_354_low60_20_low20_0 + s_374_384 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_10 + u_374_384 * (const 64 (2**21)) + v_374_384 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_10 + r_374_384 * (const 64 (2**21)) + s_374_384 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_10,
    neg_f_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_10,
    neg_g_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 384)) <=s delta, delta <=s (const 64 (1 + 2*384)),
    (const 64 (-(2**20))) <=s u_374_384, u_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_384, v_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_384, r_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_384, s_374_384 <=s (const 64 ((2**20)-1)),
    u_374_384 + v_374_384 <=s (const 64 (2**20)),
    u_374_384 - v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 + v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 - v_374_384 <=s (const 64 (2**20)),
    r_374_384 + s_374_384 <=s (const 64 (2**20)),
    r_374_384 - s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 + s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 - s_374_384 <=s (const 64 (2**20)),
    u_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_374_384 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_384_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_10,
sint64 neg_g_354_low60_20_low20_10,
sint64 neg_f_354_low60_20_low20_11,
sint64 neg_g_354_low60_20_low20_11,
sint64 u_374_384,
sint64 v_374_384,
sint64 r_374_384,
sint64 s_374_384,
sint64 u_374_385,
sint64 v_374_385,
sint64 r_374_385,
sint64 s_374_385,
bit ne
)={
    u_374_384 * neg_f_354_low60_20_low20_0 + v_374_384 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_10 * (-(2**20)),
    r_374_384 * neg_f_354_low60_20_low20_0 + s_374_384 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_10 * (-(2**20))
&&
    u_374_384 * neg_f_354_low60_20_low20_0 + v_374_384 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_10 * (const 64 (-(2**20))),
    r_374_384 * neg_f_354_low60_20_low20_0 + s_374_384 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_10 + u_374_384 * (const 64 (2**21)) + v_374_384 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_10 + r_374_384 * (const 64 (2**21)) + s_374_384 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_10,
    neg_f_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_10,
    neg_g_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 384)) <=s delta, delta <=s (const 64 (1 + 2*384)),
    (const 64 (-(2**20))) <=s u_374_384, u_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_384, v_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_384, r_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_384, s_374_384 <=s (const 64 ((2**20)-1)),
    u_374_384 + v_374_384 <=s (const 64 (2**20)),
    u_374_384 - v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 + v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 - v_374_384 <=s (const 64 (2**20)),
    r_374_384 + s_374_384 <=s (const 64 (2**20)),
    r_374_384 - s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 + s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 - s_374_384 <=s (const 64 (2**20)),
    u_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_374_384 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step384

// premise a
assume
neg_g_354_low60_20_low20_10 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_10 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_11 neg_f_354_low60_20_low20_10;
mov u_374_385 u_374_384;
mov v_374_385 v_374_384;

asr neg_g_354_low60_20_low20_11 neg_g_354_low60_20_low20_10 1;
asr r_374_385 r_374_384 1;
asr s_374_385 s_374_384 1;
assert
    true
&&
    neg_f_354_low60_20_low20_11 = neg_f_354_low60_20_low20_10,
    u_374_385 = u_374_384,
    v_374_385 = v_374_384,
    neg_g_354_low60_20_low20_11 * (const 64 2) = neg_g_354_low60_20_low20_10,
    r_374_385 * (const 64 2) = r_374_384,
    s_374_385 * (const 64 2) = s_374_384
;

assume
    neg_f_354_low60_20_low20_11 = neg_f_354_low60_20_low20_10,
    u_374_385 = u_374_384,
    v_374_385 = v_374_384,
    neg_g_354_low60_20_low20_11 * 2 = neg_g_354_low60_20_low20_10,
    r_374_385 * 2 = r_374_384,
    s_374_385 * 2 = s_374_384
&&
    true
;

{
    u_374_385 * neg_f_354_low60_20_low20_0 + v_374_385 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_385 * neg_f_354_low60_20_low20_0 + s_374_385 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_11 + u_374_385 * (const 64 (2**21)) + v_374_385 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_11 + r_374_385 * (const 64 (2**21)) + s_374_385 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_11,
    neg_f_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_11,
    neg_g_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 385)) <=s delta, delta <=s (const 64 (1 + 2*385)),
    (const 64 (-(2**20))) <=s u_374_385, u_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_385, v_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_385, r_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_385, s_374_385 <=s (const 64 ((2**20)-1)),
    u_374_385 + v_374_385 <=s (const 64 (2**20)),
    u_374_385 - v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 + v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 - v_374_385 <=s (const 64 (2**20)),
    r_374_385 + s_374_385 <=s (const 64 (2**20)),
    r_374_385 - s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 + s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 - s_374_385 <=s (const 64 (2**20)),
    u_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_374_385 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_384_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_10,
sint64 neg_g_354_low60_20_low20_10,
sint64 neg_f_354_low60_20_low20_11,
sint64 neg_g_354_low60_20_low20_11,
sint64 u_374_384,
sint64 v_374_384,
sint64 r_374_384,
sint64 s_374_384,
sint64 u_374_385,
sint64 v_374_385,
sint64 r_374_385,
sint64 s_374_385,
bit ne
)={
    u_374_384 * neg_f_354_low60_20_low20_0 + v_374_384 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_10 * (-(2**20)),
    r_374_384 * neg_f_354_low60_20_low20_0 + s_374_384 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_10 * (-(2**20))
&&
    u_374_384 * neg_f_354_low60_20_low20_0 + v_374_384 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_10 * (const 64 (-(2**20))),
    r_374_384 * neg_f_354_low60_20_low20_0 + s_374_384 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_10 + u_374_384 * (const 64 (2**21)) + v_374_384 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_10 + r_374_384 * (const 64 (2**21)) + s_374_384 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_10,
    neg_f_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_10,
    neg_g_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 384)) <=s delta, delta <=s (const 64 (1 + 2*384)),
    (const 64 (-(2**20))) <=s u_374_384, u_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_384, v_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_384, r_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_384, s_374_384 <=s (const 64 ((2**20)-1)),
    u_374_384 + v_374_384 <=s (const 64 (2**20)),
    u_374_384 - v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 + v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 - v_374_384 <=s (const 64 (2**20)),
    r_374_384 + s_374_384 <=s (const 64 (2**20)),
    r_374_384 - s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 + s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 - s_374_384 <=s (const 64 (2**20)),
    u_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_374_384 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step384

// premise b
assume
neg_g_354_low60_20_low20_10 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_11 neg_f_354_low60_20_low20_10;
mov u_374_385 u_374_384;
mov v_374_385 v_374_384;

add neg_g_354_low60_20_low20_11 neg_g_354_low60_20_low20_10 neg_f_354_low60_20_low20_10;
asr neg_g_354_low60_20_low20_11 neg_g_354_low60_20_low20_11 1;
add r_374_385 r_374_384 u_374_384;
asr r_374_385 r_374_385 1;
add s_374_385 s_374_384 v_374_384;
asr s_374_385 s_374_385 1;
assert
    true
&&
    neg_f_354_low60_20_low20_11 = neg_f_354_low60_20_low20_10,
    u_374_385 = u_374_384,
    v_374_385 = v_374_384,
    neg_g_354_low60_20_low20_11 * (const 64 2) = neg_g_354_low60_20_low20_10 + neg_f_354_low60_20_low20_10,
    r_374_385 * (const 64 2) = r_374_384 + u_374_384,
    s_374_385 * (const 64 2) = s_374_384 + v_374_384
;

assume
    neg_f_354_low60_20_low20_11 = neg_f_354_low60_20_low20_10,
    u_374_385 = u_374_384,
    v_374_385 = v_374_384,
    neg_g_354_low60_20_low20_11 * 2 = neg_g_354_low60_20_low20_10 + neg_f_354_low60_20_low20_10,
    r_374_385 * 2 = r_374_384 + u_374_384,
    s_374_385 * 2 = s_374_384 + v_374_384
&&
    true
;

{
    u_374_385 * neg_f_354_low60_20_low20_0 + v_374_385 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_385 * neg_f_354_low60_20_low20_0 + s_374_385 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_11 + u_374_385 * (const 64 (2**21)) + v_374_385 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_11 + r_374_385 * (const 64 (2**21)) + s_374_385 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_11,
    neg_f_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_11,
    neg_g_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 385)) <=s delta, delta <=s (const 64 (1 + 2*385)),
    (const 64 (-(2**20))) <=s u_374_385, u_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_385, v_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_385, r_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_385, s_374_385 <=s (const 64 ((2**20)-1)),
    u_374_385 + v_374_385 <=s (const 64 (2**20)),
    u_374_385 - v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 + v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 - v_374_385 <=s (const 64 (2**20)),
    r_374_385 + s_374_385 <=s (const 64 (2**20)),
    r_374_385 - s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 + s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 - s_374_385 <=s (const 64 (2**20)),
    u_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_374_385 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_384_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_10,
sint64 neg_g_354_low60_20_low20_10,
sint64 neg_f_354_low60_20_low20_11,
sint64 neg_g_354_low60_20_low20_11,
sint64 u_374_384,
sint64 v_374_384,
sint64 r_374_384,
sint64 s_374_384,
sint64 u_374_385,
sint64 v_374_385,
sint64 r_374_385,
sint64 s_374_385,
bit ne
)={
    u_374_384 * neg_f_354_low60_20_low20_0 + v_374_384 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_10 * (-(2**20)),
    r_374_384 * neg_f_354_low60_20_low20_0 + s_374_384 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_10 * (-(2**20))
&&
    u_374_384 * neg_f_354_low60_20_low20_0 + v_374_384 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_10 * (const 64 (-(2**20))),
    r_374_384 * neg_f_354_low60_20_low20_0 + s_374_384 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_10 + u_374_384 * (const 64 (2**21)) + v_374_384 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_10 + r_374_384 * (const 64 (2**21)) + s_374_384 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_10,
    neg_f_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_10,
    neg_g_354_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 384)) <=s delta, delta <=s (const 64 (1 + 2*384)),
    (const 64 (-(2**20))) <=s u_374_384, u_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_384, v_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_384, r_374_384 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_384, s_374_384 <=s (const 64 ((2**20)-1)),
    u_374_384 + v_374_384 <=s (const 64 (2**20)),
    u_374_384 - v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 + v_374_384 <=s (const 64 (2**20)),
    (const 64 0) - u_374_384 - v_374_384 <=s (const 64 (2**20)),
    r_374_384 + s_374_384 <=s (const 64 (2**20)),
    r_374_384 - s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 + s_374_384 <=s (const 64 (2**20)),
    (const 64 0) - r_374_384 - s_374_384 <=s (const 64 (2**20)),
    u_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_374_384 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_374_384 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step384

// premise c
assume
neg_g_354_low60_20_low20_10 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_11 neg_g_354_low60_20_low20_10;
mov u_374_385 r_374_384;
mov v_374_385 s_374_384;

subs dc neg_g_354_low60_20_low20_11 neg_g_354_low60_20_low20_10 neg_f_354_low60_20_low20_10;
asr neg_g_354_low60_20_low20_11 neg_g_354_low60_20_low20_11 1;
subs dc r_374_385 r_374_384 u_374_384;
asr r_374_385 r_374_385 1;
subs dc s_374_385 s_374_384 v_374_384;
asr s_374_385 s_374_385 1;
assert
    true
&&
    neg_f_354_low60_20_low20_11 = neg_g_354_low60_20_low20_10,
    u_374_385 = r_374_384,
    v_374_385 = s_374_384,
    neg_g_354_low60_20_low20_11 * (const 64 2) = neg_g_354_low60_20_low20_10 - neg_f_354_low60_20_low20_10,
    r_374_385 * (const 64 2) = r_374_384 - u_374_384,
    s_374_385 * (const 64 2) = s_374_384 - v_374_384
;

assume
    neg_f_354_low60_20_low20_11 = neg_g_354_low60_20_low20_10,
    u_374_385 = r_374_384,
    v_374_385 = s_374_384,
    neg_g_354_low60_20_low20_11 * 2 = neg_g_354_low60_20_low20_10 - neg_f_354_low60_20_low20_10,
    r_374_385 * 2 = r_374_384 - u_374_384,
    s_374_385 * 2 = s_374_384 - v_374_384
&&
    true
;

{
    u_374_385 * neg_f_354_low60_20_low20_0 + v_374_385 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_385 * neg_f_354_low60_20_low20_0 + s_374_385 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_11 + u_374_385 * (const 64 (2**21)) + v_374_385 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_11 + r_374_385 * (const 64 (2**21)) + s_374_385 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_11,
    neg_f_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_11,
    neg_g_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 385)) <=s delta, delta <=s (const 64 (1 + 2*385)),
    (const 64 (-(2**20))) <=s u_374_385, u_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_385, v_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_385, r_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_385, s_374_385 <=s (const 64 ((2**20)-1)),
    u_374_385 + v_374_385 <=s (const 64 (2**20)),
    u_374_385 - v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 + v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 - v_374_385 <=s (const 64 (2**20)),
    r_374_385 + s_374_385 <=s (const 64 (2**20)),
    r_374_385 - s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 + s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 - s_374_385 <=s (const 64 (2**20)),
    u_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_374_385 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_385_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_11,
sint64 neg_g_354_low60_20_low20_11,
sint64 neg_f_354_low60_20_low20_12,
sint64 neg_g_354_low60_20_low20_12,
sint64 u_374_385,
sint64 v_374_385,
sint64 r_374_385,
sint64 s_374_385,
sint64 u_374_386,
sint64 v_374_386,
sint64 r_374_386,
sint64 s_374_386,
bit ne
)={
    u_374_385 * neg_f_354_low60_20_low20_0 + v_374_385 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_11 * (-(2**20)),
    r_374_385 * neg_f_354_low60_20_low20_0 + s_374_385 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_11 * (-(2**20))
&&
    u_374_385 * neg_f_354_low60_20_low20_0 + v_374_385 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_11 * (const 64 (-(2**20))),
    r_374_385 * neg_f_354_low60_20_low20_0 + s_374_385 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_11 + u_374_385 * (const 64 (2**21)) + v_374_385 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_11 + r_374_385 * (const 64 (2**21)) + s_374_385 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_11,
    neg_f_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_11,
    neg_g_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 385)) <=s delta, delta <=s (const 64 (1 + 2*385)),
    (const 64 (-(2**20))) <=s u_374_385, u_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_385, v_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_385, r_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_385, s_374_385 <=s (const 64 ((2**20)-1)),
    u_374_385 + v_374_385 <=s (const 64 (2**20)),
    u_374_385 - v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 + v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 - v_374_385 <=s (const 64 (2**20)),
    r_374_385 + s_374_385 <=s (const 64 (2**20)),
    r_374_385 - s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 + s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 - s_374_385 <=s (const 64 (2**20)),
    u_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_374_385 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step385

// premise a
assume
neg_g_354_low60_20_low20_11 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_11 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_12 neg_f_354_low60_20_low20_11;
mov u_374_386 u_374_385;
mov v_374_386 v_374_385;

asr neg_g_354_low60_20_low20_12 neg_g_354_low60_20_low20_11 1;
asr r_374_386 r_374_385 1;
asr s_374_386 s_374_385 1;
assert
    true
&&
    neg_f_354_low60_20_low20_12 = neg_f_354_low60_20_low20_11,
    u_374_386 = u_374_385,
    v_374_386 = v_374_385,
    neg_g_354_low60_20_low20_12 * (const 64 2) = neg_g_354_low60_20_low20_11,
    r_374_386 * (const 64 2) = r_374_385,
    s_374_386 * (const 64 2) = s_374_385
;

assume
    neg_f_354_low60_20_low20_12 = neg_f_354_low60_20_low20_11,
    u_374_386 = u_374_385,
    v_374_386 = v_374_385,
    neg_g_354_low60_20_low20_12 * 2 = neg_g_354_low60_20_low20_11,
    r_374_386 * 2 = r_374_385,
    s_374_386 * 2 = s_374_385
&&
    true
;

{
    u_374_386 * neg_f_354_low60_20_low20_0 + v_374_386 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_386 * neg_f_354_low60_20_low20_0 + s_374_386 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_12 + u_374_386 * (const 64 (2**21)) + v_374_386 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_12 + r_374_386 * (const 64 (2**21)) + s_374_386 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_12,
    neg_f_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_12,
    neg_g_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 386)) <=s delta, delta <=s (const 64 (1 + 2*386)),
    (const 64 (-(2**20))) <=s u_374_386, u_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_386, v_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_386, r_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_386, s_374_386 <=s (const 64 ((2**20)-1)),
    u_374_386 + v_374_386 <=s (const 64 (2**20)),
    u_374_386 - v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 + v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 - v_374_386 <=s (const 64 (2**20)),
    r_374_386 + s_374_386 <=s (const 64 (2**20)),
    r_374_386 - s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 + s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 - s_374_386 <=s (const 64 (2**20)),
    u_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_374_386 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_385_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_11,
sint64 neg_g_354_low60_20_low20_11,
sint64 neg_f_354_low60_20_low20_12,
sint64 neg_g_354_low60_20_low20_12,
sint64 u_374_385,
sint64 v_374_385,
sint64 r_374_385,
sint64 s_374_385,
sint64 u_374_386,
sint64 v_374_386,
sint64 r_374_386,
sint64 s_374_386,
bit ne
)={
    u_374_385 * neg_f_354_low60_20_low20_0 + v_374_385 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_11 * (-(2**20)),
    r_374_385 * neg_f_354_low60_20_low20_0 + s_374_385 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_11 * (-(2**20))
&&
    u_374_385 * neg_f_354_low60_20_low20_0 + v_374_385 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_11 * (const 64 (-(2**20))),
    r_374_385 * neg_f_354_low60_20_low20_0 + s_374_385 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_11 + u_374_385 * (const 64 (2**21)) + v_374_385 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_11 + r_374_385 * (const 64 (2**21)) + s_374_385 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_11,
    neg_f_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_11,
    neg_g_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 385)) <=s delta, delta <=s (const 64 (1 + 2*385)),
    (const 64 (-(2**20))) <=s u_374_385, u_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_385, v_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_385, r_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_385, s_374_385 <=s (const 64 ((2**20)-1)),
    u_374_385 + v_374_385 <=s (const 64 (2**20)),
    u_374_385 - v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 + v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 - v_374_385 <=s (const 64 (2**20)),
    r_374_385 + s_374_385 <=s (const 64 (2**20)),
    r_374_385 - s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 + s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 - s_374_385 <=s (const 64 (2**20)),
    u_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_374_385 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step385

// premise b
assume
neg_g_354_low60_20_low20_11 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_12 neg_f_354_low60_20_low20_11;
mov u_374_386 u_374_385;
mov v_374_386 v_374_385;

add neg_g_354_low60_20_low20_12 neg_g_354_low60_20_low20_11 neg_f_354_low60_20_low20_11;
asr neg_g_354_low60_20_low20_12 neg_g_354_low60_20_low20_12 1;
add r_374_386 r_374_385 u_374_385;
asr r_374_386 r_374_386 1;
add s_374_386 s_374_385 v_374_385;
asr s_374_386 s_374_386 1;
assert
    true
&&
    neg_f_354_low60_20_low20_12 = neg_f_354_low60_20_low20_11,
    u_374_386 = u_374_385,
    v_374_386 = v_374_385,
    neg_g_354_low60_20_low20_12 * (const 64 2) = neg_g_354_low60_20_low20_11 + neg_f_354_low60_20_low20_11,
    r_374_386 * (const 64 2) = r_374_385 + u_374_385,
    s_374_386 * (const 64 2) = s_374_385 + v_374_385
;

assume
    neg_f_354_low60_20_low20_12 = neg_f_354_low60_20_low20_11,
    u_374_386 = u_374_385,
    v_374_386 = v_374_385,
    neg_g_354_low60_20_low20_12 * 2 = neg_g_354_low60_20_low20_11 + neg_f_354_low60_20_low20_11,
    r_374_386 * 2 = r_374_385 + u_374_385,
    s_374_386 * 2 = s_374_385 + v_374_385
&&
    true
;

{
    u_374_386 * neg_f_354_low60_20_low20_0 + v_374_386 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_386 * neg_f_354_low60_20_low20_0 + s_374_386 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_12 + u_374_386 * (const 64 (2**21)) + v_374_386 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_12 + r_374_386 * (const 64 (2**21)) + s_374_386 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_12,
    neg_f_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_12,
    neg_g_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 386)) <=s delta, delta <=s (const 64 (1 + 2*386)),
    (const 64 (-(2**20))) <=s u_374_386, u_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_386, v_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_386, r_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_386, s_374_386 <=s (const 64 ((2**20)-1)),
    u_374_386 + v_374_386 <=s (const 64 (2**20)),
    u_374_386 - v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 + v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 - v_374_386 <=s (const 64 (2**20)),
    r_374_386 + s_374_386 <=s (const 64 (2**20)),
    r_374_386 - s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 + s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 - s_374_386 <=s (const 64 (2**20)),
    u_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_374_386 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_385_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_11,
sint64 neg_g_354_low60_20_low20_11,
sint64 neg_f_354_low60_20_low20_12,
sint64 neg_g_354_low60_20_low20_12,
sint64 u_374_385,
sint64 v_374_385,
sint64 r_374_385,
sint64 s_374_385,
sint64 u_374_386,
sint64 v_374_386,
sint64 r_374_386,
sint64 s_374_386,
bit ne
)={
    u_374_385 * neg_f_354_low60_20_low20_0 + v_374_385 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_11 * (-(2**20)),
    r_374_385 * neg_f_354_low60_20_low20_0 + s_374_385 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_11 * (-(2**20))
&&
    u_374_385 * neg_f_354_low60_20_low20_0 + v_374_385 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_11 * (const 64 (-(2**20))),
    r_374_385 * neg_f_354_low60_20_low20_0 + s_374_385 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_11 + u_374_385 * (const 64 (2**21)) + v_374_385 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_11 + r_374_385 * (const 64 (2**21)) + s_374_385 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_11,
    neg_f_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_11,
    neg_g_354_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 385)) <=s delta, delta <=s (const 64 (1 + 2*385)),
    (const 64 (-(2**20))) <=s u_374_385, u_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_385, v_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_385, r_374_385 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_385, s_374_385 <=s (const 64 ((2**20)-1)),
    u_374_385 + v_374_385 <=s (const 64 (2**20)),
    u_374_385 - v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 + v_374_385 <=s (const 64 (2**20)),
    (const 64 0) - u_374_385 - v_374_385 <=s (const 64 (2**20)),
    r_374_385 + s_374_385 <=s (const 64 (2**20)),
    r_374_385 - s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 + s_374_385 <=s (const 64 (2**20)),
    (const 64 0) - r_374_385 - s_374_385 <=s (const 64 (2**20)),
    u_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_374_385 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_374_385 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step385

// premise c
assume
neg_g_354_low60_20_low20_11 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_12 neg_g_354_low60_20_low20_11;
mov u_374_386 r_374_385;
mov v_374_386 s_374_385;

subs dc neg_g_354_low60_20_low20_12 neg_g_354_low60_20_low20_11 neg_f_354_low60_20_low20_11;
asr neg_g_354_low60_20_low20_12 neg_g_354_low60_20_low20_12 1;
subs dc r_374_386 r_374_385 u_374_385;
asr r_374_386 r_374_386 1;
subs dc s_374_386 s_374_385 v_374_385;
asr s_374_386 s_374_386 1;
assert
    true
&&
    neg_f_354_low60_20_low20_12 = neg_g_354_low60_20_low20_11,
    u_374_386 = r_374_385,
    v_374_386 = s_374_385,
    neg_g_354_low60_20_low20_12 * (const 64 2) = neg_g_354_low60_20_low20_11 - neg_f_354_low60_20_low20_11,
    r_374_386 * (const 64 2) = r_374_385 - u_374_385,
    s_374_386 * (const 64 2) = s_374_385 - v_374_385
;

assume
    neg_f_354_low60_20_low20_12 = neg_g_354_low60_20_low20_11,
    u_374_386 = r_374_385,
    v_374_386 = s_374_385,
    neg_g_354_low60_20_low20_12 * 2 = neg_g_354_low60_20_low20_11 - neg_f_354_low60_20_low20_11,
    r_374_386 * 2 = r_374_385 - u_374_385,
    s_374_386 * 2 = s_374_385 - v_374_385
&&
    true
;

{
    u_374_386 * neg_f_354_low60_20_low20_0 + v_374_386 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_386 * neg_f_354_low60_20_low20_0 + s_374_386 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_12 + u_374_386 * (const 64 (2**21)) + v_374_386 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_12 + r_374_386 * (const 64 (2**21)) + s_374_386 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_12,
    neg_f_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_12,
    neg_g_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 386)) <=s delta, delta <=s (const 64 (1 + 2*386)),
    (const 64 (-(2**20))) <=s u_374_386, u_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_386, v_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_386, r_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_386, s_374_386 <=s (const 64 ((2**20)-1)),
    u_374_386 + v_374_386 <=s (const 64 (2**20)),
    u_374_386 - v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 + v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 - v_374_386 <=s (const 64 (2**20)),
    r_374_386 + s_374_386 <=s (const 64 (2**20)),
    r_374_386 - s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 + s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 - s_374_386 <=s (const 64 (2**20)),
    u_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_374_386 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_386_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_12,
sint64 neg_g_354_low60_20_low20_12,
sint64 neg_f_354_low60_20_low20_13,
sint64 neg_g_354_low60_20_low20_13,
sint64 u_374_386,
sint64 v_374_386,
sint64 r_374_386,
sint64 s_374_386,
sint64 u_374_387,
sint64 v_374_387,
sint64 r_374_387,
sint64 s_374_387,
bit ne
)={
    u_374_386 * neg_f_354_low60_20_low20_0 + v_374_386 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_12 * (-(2**20)),
    r_374_386 * neg_f_354_low60_20_low20_0 + s_374_386 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_12 * (-(2**20))
&&
    u_374_386 * neg_f_354_low60_20_low20_0 + v_374_386 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_12 * (const 64 (-(2**20))),
    r_374_386 * neg_f_354_low60_20_low20_0 + s_374_386 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_12 + u_374_386 * (const 64 (2**21)) + v_374_386 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_12 + r_374_386 * (const 64 (2**21)) + s_374_386 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_12,
    neg_f_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_12,
    neg_g_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 386)) <=s delta, delta <=s (const 64 (1 + 2*386)),
    (const 64 (-(2**20))) <=s u_374_386, u_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_386, v_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_386, r_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_386, s_374_386 <=s (const 64 ((2**20)-1)),
    u_374_386 + v_374_386 <=s (const 64 (2**20)),
    u_374_386 - v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 + v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 - v_374_386 <=s (const 64 (2**20)),
    r_374_386 + s_374_386 <=s (const 64 (2**20)),
    r_374_386 - s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 + s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 - s_374_386 <=s (const 64 (2**20)),
    u_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_374_386 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step386

// premise a
assume
neg_g_354_low60_20_low20_12 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_12 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_13 neg_f_354_low60_20_low20_12;
mov u_374_387 u_374_386;
mov v_374_387 v_374_386;

asr neg_g_354_low60_20_low20_13 neg_g_354_low60_20_low20_12 1;
asr r_374_387 r_374_386 1;
asr s_374_387 s_374_386 1;
assert
    true
&&
    neg_f_354_low60_20_low20_13 = neg_f_354_low60_20_low20_12,
    u_374_387 = u_374_386,
    v_374_387 = v_374_386,
    neg_g_354_low60_20_low20_13 * (const 64 2) = neg_g_354_low60_20_low20_12,
    r_374_387 * (const 64 2) = r_374_386,
    s_374_387 * (const 64 2) = s_374_386
;

assume
    neg_f_354_low60_20_low20_13 = neg_f_354_low60_20_low20_12,
    u_374_387 = u_374_386,
    v_374_387 = v_374_386,
    neg_g_354_low60_20_low20_13 * 2 = neg_g_354_low60_20_low20_12,
    r_374_387 * 2 = r_374_386,
    s_374_387 * 2 = s_374_386
&&
    true
;

{
    u_374_387 * neg_f_354_low60_20_low20_0 + v_374_387 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_387 * neg_f_354_low60_20_low20_0 + s_374_387 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_13 + u_374_387 * (const 64 (2**21)) + v_374_387 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_13 + r_374_387 * (const 64 (2**21)) + s_374_387 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_13,
    neg_f_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_13,
    neg_g_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 387)) <=s delta, delta <=s (const 64 (1 + 2*387)),
    (const 64 (-(2**20))) <=s u_374_387, u_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_387, v_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_387, r_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_387, s_374_387 <=s (const 64 ((2**20)-1)),
    u_374_387 + v_374_387 <=s (const 64 (2**20)),
    u_374_387 - v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 + v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 - v_374_387 <=s (const 64 (2**20)),
    r_374_387 + s_374_387 <=s (const 64 (2**20)),
    r_374_387 - s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 + s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 - s_374_387 <=s (const 64 (2**20)),
    u_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_374_387 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_386_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_12,
sint64 neg_g_354_low60_20_low20_12,
sint64 neg_f_354_low60_20_low20_13,
sint64 neg_g_354_low60_20_low20_13,
sint64 u_374_386,
sint64 v_374_386,
sint64 r_374_386,
sint64 s_374_386,
sint64 u_374_387,
sint64 v_374_387,
sint64 r_374_387,
sint64 s_374_387,
bit ne
)={
    u_374_386 * neg_f_354_low60_20_low20_0 + v_374_386 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_12 * (-(2**20)),
    r_374_386 * neg_f_354_low60_20_low20_0 + s_374_386 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_12 * (-(2**20))
&&
    u_374_386 * neg_f_354_low60_20_low20_0 + v_374_386 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_12 * (const 64 (-(2**20))),
    r_374_386 * neg_f_354_low60_20_low20_0 + s_374_386 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_12 + u_374_386 * (const 64 (2**21)) + v_374_386 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_12 + r_374_386 * (const 64 (2**21)) + s_374_386 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_12,
    neg_f_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_12,
    neg_g_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 386)) <=s delta, delta <=s (const 64 (1 + 2*386)),
    (const 64 (-(2**20))) <=s u_374_386, u_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_386, v_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_386, r_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_386, s_374_386 <=s (const 64 ((2**20)-1)),
    u_374_386 + v_374_386 <=s (const 64 (2**20)),
    u_374_386 - v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 + v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 - v_374_386 <=s (const 64 (2**20)),
    r_374_386 + s_374_386 <=s (const 64 (2**20)),
    r_374_386 - s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 + s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 - s_374_386 <=s (const 64 (2**20)),
    u_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_374_386 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step386

// premise b
assume
neg_g_354_low60_20_low20_12 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_13 neg_f_354_low60_20_low20_12;
mov u_374_387 u_374_386;
mov v_374_387 v_374_386;

add neg_g_354_low60_20_low20_13 neg_g_354_low60_20_low20_12 neg_f_354_low60_20_low20_12;
asr neg_g_354_low60_20_low20_13 neg_g_354_low60_20_low20_13 1;
add r_374_387 r_374_386 u_374_386;
asr r_374_387 r_374_387 1;
add s_374_387 s_374_386 v_374_386;
asr s_374_387 s_374_387 1;
assert
    true
&&
    neg_f_354_low60_20_low20_13 = neg_f_354_low60_20_low20_12,
    u_374_387 = u_374_386,
    v_374_387 = v_374_386,
    neg_g_354_low60_20_low20_13 * (const 64 2) = neg_g_354_low60_20_low20_12 + neg_f_354_low60_20_low20_12,
    r_374_387 * (const 64 2) = r_374_386 + u_374_386,
    s_374_387 * (const 64 2) = s_374_386 + v_374_386
;

assume
    neg_f_354_low60_20_low20_13 = neg_f_354_low60_20_low20_12,
    u_374_387 = u_374_386,
    v_374_387 = v_374_386,
    neg_g_354_low60_20_low20_13 * 2 = neg_g_354_low60_20_low20_12 + neg_f_354_low60_20_low20_12,
    r_374_387 * 2 = r_374_386 + u_374_386,
    s_374_387 * 2 = s_374_386 + v_374_386
&&
    true
;

{
    u_374_387 * neg_f_354_low60_20_low20_0 + v_374_387 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_387 * neg_f_354_low60_20_low20_0 + s_374_387 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_13 + u_374_387 * (const 64 (2**21)) + v_374_387 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_13 + r_374_387 * (const 64 (2**21)) + s_374_387 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_13,
    neg_f_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_13,
    neg_g_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 387)) <=s delta, delta <=s (const 64 (1 + 2*387)),
    (const 64 (-(2**20))) <=s u_374_387, u_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_387, v_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_387, r_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_387, s_374_387 <=s (const 64 ((2**20)-1)),
    u_374_387 + v_374_387 <=s (const 64 (2**20)),
    u_374_387 - v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 + v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 - v_374_387 <=s (const 64 (2**20)),
    r_374_387 + s_374_387 <=s (const 64 (2**20)),
    r_374_387 - s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 + s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 - s_374_387 <=s (const 64 (2**20)),
    u_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_374_387 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_386_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_12,
sint64 neg_g_354_low60_20_low20_12,
sint64 neg_f_354_low60_20_low20_13,
sint64 neg_g_354_low60_20_low20_13,
sint64 u_374_386,
sint64 v_374_386,
sint64 r_374_386,
sint64 s_374_386,
sint64 u_374_387,
sint64 v_374_387,
sint64 r_374_387,
sint64 s_374_387,
bit ne
)={
    u_374_386 * neg_f_354_low60_20_low20_0 + v_374_386 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_12 * (-(2**20)),
    r_374_386 * neg_f_354_low60_20_low20_0 + s_374_386 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_12 * (-(2**20))
&&
    u_374_386 * neg_f_354_low60_20_low20_0 + v_374_386 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_12 * (const 64 (-(2**20))),
    r_374_386 * neg_f_354_low60_20_low20_0 + s_374_386 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_12 + u_374_386 * (const 64 (2**21)) + v_374_386 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_12 + r_374_386 * (const 64 (2**21)) + s_374_386 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_12,
    neg_f_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_12,
    neg_g_354_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 386)) <=s delta, delta <=s (const 64 (1 + 2*386)),
    (const 64 (-(2**20))) <=s u_374_386, u_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_386, v_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_386, r_374_386 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_386, s_374_386 <=s (const 64 ((2**20)-1)),
    u_374_386 + v_374_386 <=s (const 64 (2**20)),
    u_374_386 - v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 + v_374_386 <=s (const 64 (2**20)),
    (const 64 0) - u_374_386 - v_374_386 <=s (const 64 (2**20)),
    r_374_386 + s_374_386 <=s (const 64 (2**20)),
    r_374_386 - s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 + s_374_386 <=s (const 64 (2**20)),
    (const 64 0) - r_374_386 - s_374_386 <=s (const 64 (2**20)),
    u_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_374_386 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_374_386 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step386

// premise c
assume
neg_g_354_low60_20_low20_12 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_13 neg_g_354_low60_20_low20_12;
mov u_374_387 r_374_386;
mov v_374_387 s_374_386;

subs dc neg_g_354_low60_20_low20_13 neg_g_354_low60_20_low20_12 neg_f_354_low60_20_low20_12;
asr neg_g_354_low60_20_low20_13 neg_g_354_low60_20_low20_13 1;
subs dc r_374_387 r_374_386 u_374_386;
asr r_374_387 r_374_387 1;
subs dc s_374_387 s_374_386 v_374_386;
asr s_374_387 s_374_387 1;
assert
    true
&&
    neg_f_354_low60_20_low20_13 = neg_g_354_low60_20_low20_12,
    u_374_387 = r_374_386,
    v_374_387 = s_374_386,
    neg_g_354_low60_20_low20_13 * (const 64 2) = neg_g_354_low60_20_low20_12 - neg_f_354_low60_20_low20_12,
    r_374_387 * (const 64 2) = r_374_386 - u_374_386,
    s_374_387 * (const 64 2) = s_374_386 - v_374_386
;

assume
    neg_f_354_low60_20_low20_13 = neg_g_354_low60_20_low20_12,
    u_374_387 = r_374_386,
    v_374_387 = s_374_386,
    neg_g_354_low60_20_low20_13 * 2 = neg_g_354_low60_20_low20_12 - neg_f_354_low60_20_low20_12,
    r_374_387 * 2 = r_374_386 - u_374_386,
    s_374_387 * 2 = s_374_386 - v_374_386
&&
    true
;

{
    u_374_387 * neg_f_354_low60_20_low20_0 + v_374_387 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_387 * neg_f_354_low60_20_low20_0 + s_374_387 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_13 + u_374_387 * (const 64 (2**21)) + v_374_387 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_13 + r_374_387 * (const 64 (2**21)) + s_374_387 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_13,
    neg_f_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_13,
    neg_g_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 387)) <=s delta, delta <=s (const 64 (1 + 2*387)),
    (const 64 (-(2**20))) <=s u_374_387, u_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_387, v_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_387, r_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_387, s_374_387 <=s (const 64 ((2**20)-1)),
    u_374_387 + v_374_387 <=s (const 64 (2**20)),
    u_374_387 - v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 + v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 - v_374_387 <=s (const 64 (2**20)),
    r_374_387 + s_374_387 <=s (const 64 (2**20)),
    r_374_387 - s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 + s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 - s_374_387 <=s (const 64 (2**20)),
    u_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_374_387 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_387_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_13,
sint64 neg_g_354_low60_20_low20_13,
sint64 neg_f_354_low60_20_low20_14,
sint64 neg_g_354_low60_20_low20_14,
sint64 u_374_387,
sint64 v_374_387,
sint64 r_374_387,
sint64 s_374_387,
sint64 u_374_388,
sint64 v_374_388,
sint64 r_374_388,
sint64 s_374_388,
bit ne
)={
    u_374_387 * neg_f_354_low60_20_low20_0 + v_374_387 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_13 * (-(2**20)),
    r_374_387 * neg_f_354_low60_20_low20_0 + s_374_387 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_13 * (-(2**20))
&&
    u_374_387 * neg_f_354_low60_20_low20_0 + v_374_387 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_13 * (const 64 (-(2**20))),
    r_374_387 * neg_f_354_low60_20_low20_0 + s_374_387 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_13 + u_374_387 * (const 64 (2**21)) + v_374_387 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_13 + r_374_387 * (const 64 (2**21)) + s_374_387 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_13,
    neg_f_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_13,
    neg_g_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 387)) <=s delta, delta <=s (const 64 (1 + 2*387)),
    (const 64 (-(2**20))) <=s u_374_387, u_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_387, v_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_387, r_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_387, s_374_387 <=s (const 64 ((2**20)-1)),
    u_374_387 + v_374_387 <=s (const 64 (2**20)),
    u_374_387 - v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 + v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 - v_374_387 <=s (const 64 (2**20)),
    r_374_387 + s_374_387 <=s (const 64 (2**20)),
    r_374_387 - s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 + s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 - s_374_387 <=s (const 64 (2**20)),
    u_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_374_387 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step387

// premise a
assume
neg_g_354_low60_20_low20_13 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_13 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_14 neg_f_354_low60_20_low20_13;
mov u_374_388 u_374_387;
mov v_374_388 v_374_387;

asr neg_g_354_low60_20_low20_14 neg_g_354_low60_20_low20_13 1;
asr r_374_388 r_374_387 1;
asr s_374_388 s_374_387 1;
assert
    true
&&
    neg_f_354_low60_20_low20_14 = neg_f_354_low60_20_low20_13,
    u_374_388 = u_374_387,
    v_374_388 = v_374_387,
    neg_g_354_low60_20_low20_14 * (const 64 2) = neg_g_354_low60_20_low20_13,
    r_374_388 * (const 64 2) = r_374_387,
    s_374_388 * (const 64 2) = s_374_387
;

assume
    neg_f_354_low60_20_low20_14 = neg_f_354_low60_20_low20_13,
    u_374_388 = u_374_387,
    v_374_388 = v_374_387,
    neg_g_354_low60_20_low20_14 * 2 = neg_g_354_low60_20_low20_13,
    r_374_388 * 2 = r_374_387,
    s_374_388 * 2 = s_374_387
&&
    true
;

{
    u_374_388 * neg_f_354_low60_20_low20_0 + v_374_388 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_388 * neg_f_354_low60_20_low20_0 + s_374_388 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_14 + u_374_388 * (const 64 (2**21)) + v_374_388 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_14 + r_374_388 * (const 64 (2**21)) + s_374_388 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_14,
    neg_f_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_14,
    neg_g_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 388)) <=s delta, delta <=s (const 64 (1 + 2*388)),
    (const 64 (-(2**20))) <=s u_374_388, u_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_388, v_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_388, r_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_388, s_374_388 <=s (const 64 ((2**20)-1)),
    u_374_388 + v_374_388 <=s (const 64 (2**20)),
    u_374_388 - v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 + v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 - v_374_388 <=s (const 64 (2**20)),
    r_374_388 + s_374_388 <=s (const 64 (2**20)),
    r_374_388 - s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 + s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 - s_374_388 <=s (const 64 (2**20)),
    u_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_374_388 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_387_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_13,
sint64 neg_g_354_low60_20_low20_13,
sint64 neg_f_354_low60_20_low20_14,
sint64 neg_g_354_low60_20_low20_14,
sint64 u_374_387,
sint64 v_374_387,
sint64 r_374_387,
sint64 s_374_387,
sint64 u_374_388,
sint64 v_374_388,
sint64 r_374_388,
sint64 s_374_388,
bit ne
)={
    u_374_387 * neg_f_354_low60_20_low20_0 + v_374_387 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_13 * (-(2**20)),
    r_374_387 * neg_f_354_low60_20_low20_0 + s_374_387 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_13 * (-(2**20))
&&
    u_374_387 * neg_f_354_low60_20_low20_0 + v_374_387 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_13 * (const 64 (-(2**20))),
    r_374_387 * neg_f_354_low60_20_low20_0 + s_374_387 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_13 + u_374_387 * (const 64 (2**21)) + v_374_387 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_13 + r_374_387 * (const 64 (2**21)) + s_374_387 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_13,
    neg_f_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_13,
    neg_g_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 387)) <=s delta, delta <=s (const 64 (1 + 2*387)),
    (const 64 (-(2**20))) <=s u_374_387, u_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_387, v_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_387, r_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_387, s_374_387 <=s (const 64 ((2**20)-1)),
    u_374_387 + v_374_387 <=s (const 64 (2**20)),
    u_374_387 - v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 + v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 - v_374_387 <=s (const 64 (2**20)),
    r_374_387 + s_374_387 <=s (const 64 (2**20)),
    r_374_387 - s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 + s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 - s_374_387 <=s (const 64 (2**20)),
    u_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_374_387 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step387

// premise b
assume
neg_g_354_low60_20_low20_13 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_14 neg_f_354_low60_20_low20_13;
mov u_374_388 u_374_387;
mov v_374_388 v_374_387;

add neg_g_354_low60_20_low20_14 neg_g_354_low60_20_low20_13 neg_f_354_low60_20_low20_13;
asr neg_g_354_low60_20_low20_14 neg_g_354_low60_20_low20_14 1;
add r_374_388 r_374_387 u_374_387;
asr r_374_388 r_374_388 1;
add s_374_388 s_374_387 v_374_387;
asr s_374_388 s_374_388 1;
assert
    true
&&
    neg_f_354_low60_20_low20_14 = neg_f_354_low60_20_low20_13,
    u_374_388 = u_374_387,
    v_374_388 = v_374_387,
    neg_g_354_low60_20_low20_14 * (const 64 2) = neg_g_354_low60_20_low20_13 + neg_f_354_low60_20_low20_13,
    r_374_388 * (const 64 2) = r_374_387 + u_374_387,
    s_374_388 * (const 64 2) = s_374_387 + v_374_387
;

assume
    neg_f_354_low60_20_low20_14 = neg_f_354_low60_20_low20_13,
    u_374_388 = u_374_387,
    v_374_388 = v_374_387,
    neg_g_354_low60_20_low20_14 * 2 = neg_g_354_low60_20_low20_13 + neg_f_354_low60_20_low20_13,
    r_374_388 * 2 = r_374_387 + u_374_387,
    s_374_388 * 2 = s_374_387 + v_374_387
&&
    true
;

{
    u_374_388 * neg_f_354_low60_20_low20_0 + v_374_388 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_388 * neg_f_354_low60_20_low20_0 + s_374_388 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_14 + u_374_388 * (const 64 (2**21)) + v_374_388 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_14 + r_374_388 * (const 64 (2**21)) + s_374_388 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_14,
    neg_f_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_14,
    neg_g_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 388)) <=s delta, delta <=s (const 64 (1 + 2*388)),
    (const 64 (-(2**20))) <=s u_374_388, u_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_388, v_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_388, r_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_388, s_374_388 <=s (const 64 ((2**20)-1)),
    u_374_388 + v_374_388 <=s (const 64 (2**20)),
    u_374_388 - v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 + v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 - v_374_388 <=s (const 64 (2**20)),
    r_374_388 + s_374_388 <=s (const 64 (2**20)),
    r_374_388 - s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 + s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 - s_374_388 <=s (const 64 (2**20)),
    u_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_374_388 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_387_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_13,
sint64 neg_g_354_low60_20_low20_13,
sint64 neg_f_354_low60_20_low20_14,
sint64 neg_g_354_low60_20_low20_14,
sint64 u_374_387,
sint64 v_374_387,
sint64 r_374_387,
sint64 s_374_387,
sint64 u_374_388,
sint64 v_374_388,
sint64 r_374_388,
sint64 s_374_388,
bit ne
)={
    u_374_387 * neg_f_354_low60_20_low20_0 + v_374_387 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_13 * (-(2**20)),
    r_374_387 * neg_f_354_low60_20_low20_0 + s_374_387 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_13 * (-(2**20))
&&
    u_374_387 * neg_f_354_low60_20_low20_0 + v_374_387 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_13 * (const 64 (-(2**20))),
    r_374_387 * neg_f_354_low60_20_low20_0 + s_374_387 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_13 + u_374_387 * (const 64 (2**21)) + v_374_387 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_13 + r_374_387 * (const 64 (2**21)) + s_374_387 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_13,
    neg_f_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_13,
    neg_g_354_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 387)) <=s delta, delta <=s (const 64 (1 + 2*387)),
    (const 64 (-(2**20))) <=s u_374_387, u_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_387, v_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_387, r_374_387 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_387, s_374_387 <=s (const 64 ((2**20)-1)),
    u_374_387 + v_374_387 <=s (const 64 (2**20)),
    u_374_387 - v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 + v_374_387 <=s (const 64 (2**20)),
    (const 64 0) - u_374_387 - v_374_387 <=s (const 64 (2**20)),
    r_374_387 + s_374_387 <=s (const 64 (2**20)),
    r_374_387 - s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 + s_374_387 <=s (const 64 (2**20)),
    (const 64 0) - r_374_387 - s_374_387 <=s (const 64 (2**20)),
    u_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_374_387 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_374_387 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step387

// premise c
assume
neg_g_354_low60_20_low20_13 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_14 neg_g_354_low60_20_low20_13;
mov u_374_388 r_374_387;
mov v_374_388 s_374_387;

subs dc neg_g_354_low60_20_low20_14 neg_g_354_low60_20_low20_13 neg_f_354_low60_20_low20_13;
asr neg_g_354_low60_20_low20_14 neg_g_354_low60_20_low20_14 1;
subs dc r_374_388 r_374_387 u_374_387;
asr r_374_388 r_374_388 1;
subs dc s_374_388 s_374_387 v_374_387;
asr s_374_388 s_374_388 1;
assert
    true
&&
    neg_f_354_low60_20_low20_14 = neg_g_354_low60_20_low20_13,
    u_374_388 = r_374_387,
    v_374_388 = s_374_387,
    neg_g_354_low60_20_low20_14 * (const 64 2) = neg_g_354_low60_20_low20_13 - neg_f_354_low60_20_low20_13,
    r_374_388 * (const 64 2) = r_374_387 - u_374_387,
    s_374_388 * (const 64 2) = s_374_387 - v_374_387
;

assume
    neg_f_354_low60_20_low20_14 = neg_g_354_low60_20_low20_13,
    u_374_388 = r_374_387,
    v_374_388 = s_374_387,
    neg_g_354_low60_20_low20_14 * 2 = neg_g_354_low60_20_low20_13 - neg_f_354_low60_20_low20_13,
    r_374_388 * 2 = r_374_387 - u_374_387,
    s_374_388 * 2 = s_374_387 - v_374_387
&&
    true
;

{
    u_374_388 * neg_f_354_low60_20_low20_0 + v_374_388 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_388 * neg_f_354_low60_20_low20_0 + s_374_388 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_14 + u_374_388 * (const 64 (2**21)) + v_374_388 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_14 + r_374_388 * (const 64 (2**21)) + s_374_388 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_14,
    neg_f_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_14,
    neg_g_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 388)) <=s delta, delta <=s (const 64 (1 + 2*388)),
    (const 64 (-(2**20))) <=s u_374_388, u_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_388, v_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_388, r_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_388, s_374_388 <=s (const 64 ((2**20)-1)),
    u_374_388 + v_374_388 <=s (const 64 (2**20)),
    u_374_388 - v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 + v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 - v_374_388 <=s (const 64 (2**20)),
    r_374_388 + s_374_388 <=s (const 64 (2**20)),
    r_374_388 - s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 + s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 - s_374_388 <=s (const 64 (2**20)),
    u_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_374_388 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_388_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_14,
sint64 neg_g_354_low60_20_low20_14,
sint64 neg_f_354_low60_20_low20_15,
sint64 neg_g_354_low60_20_low20_15,
sint64 u_374_388,
sint64 v_374_388,
sint64 r_374_388,
sint64 s_374_388,
sint64 u_374_389,
sint64 v_374_389,
sint64 r_374_389,
sint64 s_374_389,
bit ne
)={
    u_374_388 * neg_f_354_low60_20_low20_0 + v_374_388 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_14 * (-(2**20)),
    r_374_388 * neg_f_354_low60_20_low20_0 + s_374_388 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_14 * (-(2**20))
&&
    u_374_388 * neg_f_354_low60_20_low20_0 + v_374_388 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_14 * (const 64 (-(2**20))),
    r_374_388 * neg_f_354_low60_20_low20_0 + s_374_388 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_14 + u_374_388 * (const 64 (2**21)) + v_374_388 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_14 + r_374_388 * (const 64 (2**21)) + s_374_388 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_14,
    neg_f_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_14,
    neg_g_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 388)) <=s delta, delta <=s (const 64 (1 + 2*388)),
    (const 64 (-(2**20))) <=s u_374_388, u_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_388, v_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_388, r_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_388, s_374_388 <=s (const 64 ((2**20)-1)),
    u_374_388 + v_374_388 <=s (const 64 (2**20)),
    u_374_388 - v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 + v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 - v_374_388 <=s (const 64 (2**20)),
    r_374_388 + s_374_388 <=s (const 64 (2**20)),
    r_374_388 - s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 + s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 - s_374_388 <=s (const 64 (2**20)),
    u_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_374_388 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step388

// premise a
assume
neg_g_354_low60_20_low20_14 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_14 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_15 neg_f_354_low60_20_low20_14;
mov u_374_389 u_374_388;
mov v_374_389 v_374_388;

asr neg_g_354_low60_20_low20_15 neg_g_354_low60_20_low20_14 1;
asr r_374_389 r_374_388 1;
asr s_374_389 s_374_388 1;
assert
    true
&&
    neg_f_354_low60_20_low20_15 = neg_f_354_low60_20_low20_14,
    u_374_389 = u_374_388,
    v_374_389 = v_374_388,
    neg_g_354_low60_20_low20_15 * (const 64 2) = neg_g_354_low60_20_low20_14,
    r_374_389 * (const 64 2) = r_374_388,
    s_374_389 * (const 64 2) = s_374_388
;

assume
    neg_f_354_low60_20_low20_15 = neg_f_354_low60_20_low20_14,
    u_374_389 = u_374_388,
    v_374_389 = v_374_388,
    neg_g_354_low60_20_low20_15 * 2 = neg_g_354_low60_20_low20_14,
    r_374_389 * 2 = r_374_388,
    s_374_389 * 2 = s_374_388
&&
    true
;

{
    u_374_389 * neg_f_354_low60_20_low20_0 + v_374_389 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_389 * neg_f_354_low60_20_low20_0 + s_374_389 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_15 + u_374_389 * (const 64 (2**21)) + v_374_389 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_15 + r_374_389 * (const 64 (2**21)) + s_374_389 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_15,
    neg_f_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_15,
    neg_g_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 389)) <=s delta, delta <=s (const 64 (1 + 2*389)),
    (const 64 (-(2**20))) <=s u_374_389, u_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_389, v_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_389, r_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_389, s_374_389 <=s (const 64 ((2**20)-1)),
    u_374_389 + v_374_389 <=s (const 64 (2**20)),
    u_374_389 - v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 + v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 - v_374_389 <=s (const 64 (2**20)),
    r_374_389 + s_374_389 <=s (const 64 (2**20)),
    r_374_389 - s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 + s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 - s_374_389 <=s (const 64 (2**20)),
    u_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_374_389 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_388_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_14,
sint64 neg_g_354_low60_20_low20_14,
sint64 neg_f_354_low60_20_low20_15,
sint64 neg_g_354_low60_20_low20_15,
sint64 u_374_388,
sint64 v_374_388,
sint64 r_374_388,
sint64 s_374_388,
sint64 u_374_389,
sint64 v_374_389,
sint64 r_374_389,
sint64 s_374_389,
bit ne
)={
    u_374_388 * neg_f_354_low60_20_low20_0 + v_374_388 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_14 * (-(2**20)),
    r_374_388 * neg_f_354_low60_20_low20_0 + s_374_388 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_14 * (-(2**20))
&&
    u_374_388 * neg_f_354_low60_20_low20_0 + v_374_388 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_14 * (const 64 (-(2**20))),
    r_374_388 * neg_f_354_low60_20_low20_0 + s_374_388 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_14 + u_374_388 * (const 64 (2**21)) + v_374_388 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_14 + r_374_388 * (const 64 (2**21)) + s_374_388 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_14,
    neg_f_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_14,
    neg_g_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 388)) <=s delta, delta <=s (const 64 (1 + 2*388)),
    (const 64 (-(2**20))) <=s u_374_388, u_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_388, v_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_388, r_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_388, s_374_388 <=s (const 64 ((2**20)-1)),
    u_374_388 + v_374_388 <=s (const 64 (2**20)),
    u_374_388 - v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 + v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 - v_374_388 <=s (const 64 (2**20)),
    r_374_388 + s_374_388 <=s (const 64 (2**20)),
    r_374_388 - s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 + s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 - s_374_388 <=s (const 64 (2**20)),
    u_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_374_388 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step388

// premise b
assume
neg_g_354_low60_20_low20_14 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_15 neg_f_354_low60_20_low20_14;
mov u_374_389 u_374_388;
mov v_374_389 v_374_388;

add neg_g_354_low60_20_low20_15 neg_g_354_low60_20_low20_14 neg_f_354_low60_20_low20_14;
asr neg_g_354_low60_20_low20_15 neg_g_354_low60_20_low20_15 1;
add r_374_389 r_374_388 u_374_388;
asr r_374_389 r_374_389 1;
add s_374_389 s_374_388 v_374_388;
asr s_374_389 s_374_389 1;
assert
    true
&&
    neg_f_354_low60_20_low20_15 = neg_f_354_low60_20_low20_14,
    u_374_389 = u_374_388,
    v_374_389 = v_374_388,
    neg_g_354_low60_20_low20_15 * (const 64 2) = neg_g_354_low60_20_low20_14 + neg_f_354_low60_20_low20_14,
    r_374_389 * (const 64 2) = r_374_388 + u_374_388,
    s_374_389 * (const 64 2) = s_374_388 + v_374_388
;

assume
    neg_f_354_low60_20_low20_15 = neg_f_354_low60_20_low20_14,
    u_374_389 = u_374_388,
    v_374_389 = v_374_388,
    neg_g_354_low60_20_low20_15 * 2 = neg_g_354_low60_20_low20_14 + neg_f_354_low60_20_low20_14,
    r_374_389 * 2 = r_374_388 + u_374_388,
    s_374_389 * 2 = s_374_388 + v_374_388
&&
    true
;

{
    u_374_389 * neg_f_354_low60_20_low20_0 + v_374_389 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_389 * neg_f_354_low60_20_low20_0 + s_374_389 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_15 + u_374_389 * (const 64 (2**21)) + v_374_389 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_15 + r_374_389 * (const 64 (2**21)) + s_374_389 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_15,
    neg_f_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_15,
    neg_g_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 389)) <=s delta, delta <=s (const 64 (1 + 2*389)),
    (const 64 (-(2**20))) <=s u_374_389, u_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_389, v_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_389, r_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_389, s_374_389 <=s (const 64 ((2**20)-1)),
    u_374_389 + v_374_389 <=s (const 64 (2**20)),
    u_374_389 - v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 + v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 - v_374_389 <=s (const 64 (2**20)),
    r_374_389 + s_374_389 <=s (const 64 (2**20)),
    r_374_389 - s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 + s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 - s_374_389 <=s (const 64 (2**20)),
    u_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_374_389 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_388_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_14,
sint64 neg_g_354_low60_20_low20_14,
sint64 neg_f_354_low60_20_low20_15,
sint64 neg_g_354_low60_20_low20_15,
sint64 u_374_388,
sint64 v_374_388,
sint64 r_374_388,
sint64 s_374_388,
sint64 u_374_389,
sint64 v_374_389,
sint64 r_374_389,
sint64 s_374_389,
bit ne
)={
    u_374_388 * neg_f_354_low60_20_low20_0 + v_374_388 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_14 * (-(2**20)),
    r_374_388 * neg_f_354_low60_20_low20_0 + s_374_388 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_14 * (-(2**20))
&&
    u_374_388 * neg_f_354_low60_20_low20_0 + v_374_388 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_14 * (const 64 (-(2**20))),
    r_374_388 * neg_f_354_low60_20_low20_0 + s_374_388 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_14 + u_374_388 * (const 64 (2**21)) + v_374_388 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_14 + r_374_388 * (const 64 (2**21)) + s_374_388 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_14,
    neg_f_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_14,
    neg_g_354_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 388)) <=s delta, delta <=s (const 64 (1 + 2*388)),
    (const 64 (-(2**20))) <=s u_374_388, u_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_388, v_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_388, r_374_388 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_388, s_374_388 <=s (const 64 ((2**20)-1)),
    u_374_388 + v_374_388 <=s (const 64 (2**20)),
    u_374_388 - v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 + v_374_388 <=s (const 64 (2**20)),
    (const 64 0) - u_374_388 - v_374_388 <=s (const 64 (2**20)),
    r_374_388 + s_374_388 <=s (const 64 (2**20)),
    r_374_388 - s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 + s_374_388 <=s (const 64 (2**20)),
    (const 64 0) - r_374_388 - s_374_388 <=s (const 64 (2**20)),
    u_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_374_388 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_374_388 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step388

// premise c
assume
neg_g_354_low60_20_low20_14 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_15 neg_g_354_low60_20_low20_14;
mov u_374_389 r_374_388;
mov v_374_389 s_374_388;

subs dc neg_g_354_low60_20_low20_15 neg_g_354_low60_20_low20_14 neg_f_354_low60_20_low20_14;
asr neg_g_354_low60_20_low20_15 neg_g_354_low60_20_low20_15 1;
subs dc r_374_389 r_374_388 u_374_388;
asr r_374_389 r_374_389 1;
subs dc s_374_389 s_374_388 v_374_388;
asr s_374_389 s_374_389 1;
assert
    true
&&
    neg_f_354_low60_20_low20_15 = neg_g_354_low60_20_low20_14,
    u_374_389 = r_374_388,
    v_374_389 = s_374_388,
    neg_g_354_low60_20_low20_15 * (const 64 2) = neg_g_354_low60_20_low20_14 - neg_f_354_low60_20_low20_14,
    r_374_389 * (const 64 2) = r_374_388 - u_374_388,
    s_374_389 * (const 64 2) = s_374_388 - v_374_388
;

assume
    neg_f_354_low60_20_low20_15 = neg_g_354_low60_20_low20_14,
    u_374_389 = r_374_388,
    v_374_389 = s_374_388,
    neg_g_354_low60_20_low20_15 * 2 = neg_g_354_low60_20_low20_14 - neg_f_354_low60_20_low20_14,
    r_374_389 * 2 = r_374_388 - u_374_388,
    s_374_389 * 2 = s_374_388 - v_374_388
&&
    true
;

{
    u_374_389 * neg_f_354_low60_20_low20_0 + v_374_389 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_389 * neg_f_354_low60_20_low20_0 + s_374_389 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_15 + u_374_389 * (const 64 (2**21)) + v_374_389 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_15 + r_374_389 * (const 64 (2**21)) + s_374_389 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_15,
    neg_f_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_15,
    neg_g_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 389)) <=s delta, delta <=s (const 64 (1 + 2*389)),
    (const 64 (-(2**20))) <=s u_374_389, u_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_389, v_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_389, r_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_389, s_374_389 <=s (const 64 ((2**20)-1)),
    u_374_389 + v_374_389 <=s (const 64 (2**20)),
    u_374_389 - v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 + v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 - v_374_389 <=s (const 64 (2**20)),
    r_374_389 + s_374_389 <=s (const 64 (2**20)),
    r_374_389 - s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 + s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 - s_374_389 <=s (const 64 (2**20)),
    u_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_374_389 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_389_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_15,
sint64 neg_g_354_low60_20_low20_15,
sint64 neg_f_354_low60_20_low20_16,
sint64 neg_g_354_low60_20_low20_16,
sint64 u_374_389,
sint64 v_374_389,
sint64 r_374_389,
sint64 s_374_389,
sint64 u_374_390,
sint64 v_374_390,
sint64 r_374_390,
sint64 s_374_390,
bit ne
)={
    u_374_389 * neg_f_354_low60_20_low20_0 + v_374_389 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_15 * (-(2**20)),
    r_374_389 * neg_f_354_low60_20_low20_0 + s_374_389 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_15 * (-(2**20))
&&
    u_374_389 * neg_f_354_low60_20_low20_0 + v_374_389 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_15 * (const 64 (-(2**20))),
    r_374_389 * neg_f_354_low60_20_low20_0 + s_374_389 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_15 + u_374_389 * (const 64 (2**21)) + v_374_389 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_15 + r_374_389 * (const 64 (2**21)) + s_374_389 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_15,
    neg_f_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_15,
    neg_g_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 389)) <=s delta, delta <=s (const 64 (1 + 2*389)),
    (const 64 (-(2**20))) <=s u_374_389, u_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_389, v_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_389, r_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_389, s_374_389 <=s (const 64 ((2**20)-1)),
    u_374_389 + v_374_389 <=s (const 64 (2**20)),
    u_374_389 - v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 + v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 - v_374_389 <=s (const 64 (2**20)),
    r_374_389 + s_374_389 <=s (const 64 (2**20)),
    r_374_389 - s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 + s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 - s_374_389 <=s (const 64 (2**20)),
    u_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_374_389 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step389

// premise a
assume
neg_g_354_low60_20_low20_15 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_15 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_16 neg_f_354_low60_20_low20_15;
mov u_374_390 u_374_389;
mov v_374_390 v_374_389;

asr neg_g_354_low60_20_low20_16 neg_g_354_low60_20_low20_15 1;
asr r_374_390 r_374_389 1;
asr s_374_390 s_374_389 1;
assert
    true
&&
    neg_f_354_low60_20_low20_16 = neg_f_354_low60_20_low20_15,
    u_374_390 = u_374_389,
    v_374_390 = v_374_389,
    neg_g_354_low60_20_low20_16 * (const 64 2) = neg_g_354_low60_20_low20_15,
    r_374_390 * (const 64 2) = r_374_389,
    s_374_390 * (const 64 2) = s_374_389
;

assume
    neg_f_354_low60_20_low20_16 = neg_f_354_low60_20_low20_15,
    u_374_390 = u_374_389,
    v_374_390 = v_374_389,
    neg_g_354_low60_20_low20_16 * 2 = neg_g_354_low60_20_low20_15,
    r_374_390 * 2 = r_374_389,
    s_374_390 * 2 = s_374_389
&&
    true
;

{
    u_374_390 * neg_f_354_low60_20_low20_0 + v_374_390 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_390 * neg_f_354_low60_20_low20_0 + s_374_390 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_16 + u_374_390 * (const 64 (2**21)) + v_374_390 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_16 + r_374_390 * (const 64 (2**21)) + s_374_390 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_16,
    neg_f_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_16,
    neg_g_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 390)) <=s delta, delta <=s (const 64 (1 + 2*390)),
    (const 64 (-(2**20))) <=s u_374_390, u_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_390, v_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_390, r_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_390, s_374_390 <=s (const 64 ((2**20)-1)),
    u_374_390 + v_374_390 <=s (const 64 (2**20)),
    u_374_390 - v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 + v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 - v_374_390 <=s (const 64 (2**20)),
    r_374_390 + s_374_390 <=s (const 64 (2**20)),
    r_374_390 - s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 + s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 - s_374_390 <=s (const 64 (2**20)),
    u_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_374_390 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_389_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_15,
sint64 neg_g_354_low60_20_low20_15,
sint64 neg_f_354_low60_20_low20_16,
sint64 neg_g_354_low60_20_low20_16,
sint64 u_374_389,
sint64 v_374_389,
sint64 r_374_389,
sint64 s_374_389,
sint64 u_374_390,
sint64 v_374_390,
sint64 r_374_390,
sint64 s_374_390,
bit ne
)={
    u_374_389 * neg_f_354_low60_20_low20_0 + v_374_389 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_15 * (-(2**20)),
    r_374_389 * neg_f_354_low60_20_low20_0 + s_374_389 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_15 * (-(2**20))
&&
    u_374_389 * neg_f_354_low60_20_low20_0 + v_374_389 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_15 * (const 64 (-(2**20))),
    r_374_389 * neg_f_354_low60_20_low20_0 + s_374_389 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_15 + u_374_389 * (const 64 (2**21)) + v_374_389 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_15 + r_374_389 * (const 64 (2**21)) + s_374_389 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_15,
    neg_f_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_15,
    neg_g_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 389)) <=s delta, delta <=s (const 64 (1 + 2*389)),
    (const 64 (-(2**20))) <=s u_374_389, u_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_389, v_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_389, r_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_389, s_374_389 <=s (const 64 ((2**20)-1)),
    u_374_389 + v_374_389 <=s (const 64 (2**20)),
    u_374_389 - v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 + v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 - v_374_389 <=s (const 64 (2**20)),
    r_374_389 + s_374_389 <=s (const 64 (2**20)),
    r_374_389 - s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 + s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 - s_374_389 <=s (const 64 (2**20)),
    u_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_374_389 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step389

// premise b
assume
neg_g_354_low60_20_low20_15 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_16 neg_f_354_low60_20_low20_15;
mov u_374_390 u_374_389;
mov v_374_390 v_374_389;

add neg_g_354_low60_20_low20_16 neg_g_354_low60_20_low20_15 neg_f_354_low60_20_low20_15;
asr neg_g_354_low60_20_low20_16 neg_g_354_low60_20_low20_16 1;
add r_374_390 r_374_389 u_374_389;
asr r_374_390 r_374_390 1;
add s_374_390 s_374_389 v_374_389;
asr s_374_390 s_374_390 1;
assert
    true
&&
    neg_f_354_low60_20_low20_16 = neg_f_354_low60_20_low20_15,
    u_374_390 = u_374_389,
    v_374_390 = v_374_389,
    neg_g_354_low60_20_low20_16 * (const 64 2) = neg_g_354_low60_20_low20_15 + neg_f_354_low60_20_low20_15,
    r_374_390 * (const 64 2) = r_374_389 + u_374_389,
    s_374_390 * (const 64 2) = s_374_389 + v_374_389
;

assume
    neg_f_354_low60_20_low20_16 = neg_f_354_low60_20_low20_15,
    u_374_390 = u_374_389,
    v_374_390 = v_374_389,
    neg_g_354_low60_20_low20_16 * 2 = neg_g_354_low60_20_low20_15 + neg_f_354_low60_20_low20_15,
    r_374_390 * 2 = r_374_389 + u_374_389,
    s_374_390 * 2 = s_374_389 + v_374_389
&&
    true
;

{
    u_374_390 * neg_f_354_low60_20_low20_0 + v_374_390 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_390 * neg_f_354_low60_20_low20_0 + s_374_390 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_16 + u_374_390 * (const 64 (2**21)) + v_374_390 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_16 + r_374_390 * (const 64 (2**21)) + s_374_390 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_16,
    neg_f_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_16,
    neg_g_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 390)) <=s delta, delta <=s (const 64 (1 + 2*390)),
    (const 64 (-(2**20))) <=s u_374_390, u_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_390, v_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_390, r_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_390, s_374_390 <=s (const 64 ((2**20)-1)),
    u_374_390 + v_374_390 <=s (const 64 (2**20)),
    u_374_390 - v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 + v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 - v_374_390 <=s (const 64 (2**20)),
    r_374_390 + s_374_390 <=s (const 64 (2**20)),
    r_374_390 - s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 + s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 - s_374_390 <=s (const 64 (2**20)),
    u_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_374_390 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_389_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_15,
sint64 neg_g_354_low60_20_low20_15,
sint64 neg_f_354_low60_20_low20_16,
sint64 neg_g_354_low60_20_low20_16,
sint64 u_374_389,
sint64 v_374_389,
sint64 r_374_389,
sint64 s_374_389,
sint64 u_374_390,
sint64 v_374_390,
sint64 r_374_390,
sint64 s_374_390,
bit ne
)={
    u_374_389 * neg_f_354_low60_20_low20_0 + v_374_389 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_15 * (-(2**20)),
    r_374_389 * neg_f_354_low60_20_low20_0 + s_374_389 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_15 * (-(2**20))
&&
    u_374_389 * neg_f_354_low60_20_low20_0 + v_374_389 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_15 * (const 64 (-(2**20))),
    r_374_389 * neg_f_354_low60_20_low20_0 + s_374_389 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_15 + u_374_389 * (const 64 (2**21)) + v_374_389 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_15 + r_374_389 * (const 64 (2**21)) + s_374_389 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_15,
    neg_f_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_15,
    neg_g_354_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 389)) <=s delta, delta <=s (const 64 (1 + 2*389)),
    (const 64 (-(2**20))) <=s u_374_389, u_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_389, v_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_389, r_374_389 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_389, s_374_389 <=s (const 64 ((2**20)-1)),
    u_374_389 + v_374_389 <=s (const 64 (2**20)),
    u_374_389 - v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 + v_374_389 <=s (const 64 (2**20)),
    (const 64 0) - u_374_389 - v_374_389 <=s (const 64 (2**20)),
    r_374_389 + s_374_389 <=s (const 64 (2**20)),
    r_374_389 - s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 + s_374_389 <=s (const 64 (2**20)),
    (const 64 0) - r_374_389 - s_374_389 <=s (const 64 (2**20)),
    u_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_374_389 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_374_389 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step389

// premise c
assume
neg_g_354_low60_20_low20_15 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_16 neg_g_354_low60_20_low20_15;
mov u_374_390 r_374_389;
mov v_374_390 s_374_389;

subs dc neg_g_354_low60_20_low20_16 neg_g_354_low60_20_low20_15 neg_f_354_low60_20_low20_15;
asr neg_g_354_low60_20_low20_16 neg_g_354_low60_20_low20_16 1;
subs dc r_374_390 r_374_389 u_374_389;
asr r_374_390 r_374_390 1;
subs dc s_374_390 s_374_389 v_374_389;
asr s_374_390 s_374_390 1;
assert
    true
&&
    neg_f_354_low60_20_low20_16 = neg_g_354_low60_20_low20_15,
    u_374_390 = r_374_389,
    v_374_390 = s_374_389,
    neg_g_354_low60_20_low20_16 * (const 64 2) = neg_g_354_low60_20_low20_15 - neg_f_354_low60_20_low20_15,
    r_374_390 * (const 64 2) = r_374_389 - u_374_389,
    s_374_390 * (const 64 2) = s_374_389 - v_374_389
;

assume
    neg_f_354_low60_20_low20_16 = neg_g_354_low60_20_low20_15,
    u_374_390 = r_374_389,
    v_374_390 = s_374_389,
    neg_g_354_low60_20_low20_16 * 2 = neg_g_354_low60_20_low20_15 - neg_f_354_low60_20_low20_15,
    r_374_390 * 2 = r_374_389 - u_374_389,
    s_374_390 * 2 = s_374_389 - v_374_389
&&
    true
;

{
    u_374_390 * neg_f_354_low60_20_low20_0 + v_374_390 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_390 * neg_f_354_low60_20_low20_0 + s_374_390 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_16 + u_374_390 * (const 64 (2**21)) + v_374_390 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_16 + r_374_390 * (const 64 (2**21)) + s_374_390 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_16,
    neg_f_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_16,
    neg_g_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 390)) <=s delta, delta <=s (const 64 (1 + 2*390)),
    (const 64 (-(2**20))) <=s u_374_390, u_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_390, v_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_390, r_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_390, s_374_390 <=s (const 64 ((2**20)-1)),
    u_374_390 + v_374_390 <=s (const 64 (2**20)),
    u_374_390 - v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 + v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 - v_374_390 <=s (const 64 (2**20)),
    r_374_390 + s_374_390 <=s (const 64 (2**20)),
    r_374_390 - s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 + s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 - s_374_390 <=s (const 64 (2**20)),
    u_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_374_390 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_390_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_16,
sint64 neg_g_354_low60_20_low20_16,
sint64 neg_f_354_low60_20_low20_17,
sint64 neg_g_354_low60_20_low20_17,
sint64 u_374_390,
sint64 v_374_390,
sint64 r_374_390,
sint64 s_374_390,
sint64 u_374_391,
sint64 v_374_391,
sint64 r_374_391,
sint64 s_374_391,
bit ne
)={
    u_374_390 * neg_f_354_low60_20_low20_0 + v_374_390 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_16 * (-(2**20)),
    r_374_390 * neg_f_354_low60_20_low20_0 + s_374_390 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_16 * (-(2**20))
&&
    u_374_390 * neg_f_354_low60_20_low20_0 + v_374_390 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_16 * (const 64 (-(2**20))),
    r_374_390 * neg_f_354_low60_20_low20_0 + s_374_390 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_16 + u_374_390 * (const 64 (2**21)) + v_374_390 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_16 + r_374_390 * (const 64 (2**21)) + s_374_390 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_16,
    neg_f_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_16,
    neg_g_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 390)) <=s delta, delta <=s (const 64 (1 + 2*390)),
    (const 64 (-(2**20))) <=s u_374_390, u_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_390, v_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_390, r_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_390, s_374_390 <=s (const 64 ((2**20)-1)),
    u_374_390 + v_374_390 <=s (const 64 (2**20)),
    u_374_390 - v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 + v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 - v_374_390 <=s (const 64 (2**20)),
    r_374_390 + s_374_390 <=s (const 64 (2**20)),
    r_374_390 - s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 + s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 - s_374_390 <=s (const 64 (2**20)),
    u_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_374_390 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step390

// premise a
assume
neg_g_354_low60_20_low20_16 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_16 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_17 neg_f_354_low60_20_low20_16;
mov u_374_391 u_374_390;
mov v_374_391 v_374_390;

asr neg_g_354_low60_20_low20_17 neg_g_354_low60_20_low20_16 1;
asr r_374_391 r_374_390 1;
asr s_374_391 s_374_390 1;
assert
    true
&&
    neg_f_354_low60_20_low20_17 = neg_f_354_low60_20_low20_16,
    u_374_391 = u_374_390,
    v_374_391 = v_374_390,
    neg_g_354_low60_20_low20_17 * (const 64 2) = neg_g_354_low60_20_low20_16,
    r_374_391 * (const 64 2) = r_374_390,
    s_374_391 * (const 64 2) = s_374_390
;

assume
    neg_f_354_low60_20_low20_17 = neg_f_354_low60_20_low20_16,
    u_374_391 = u_374_390,
    v_374_391 = v_374_390,
    neg_g_354_low60_20_low20_17 * 2 = neg_g_354_low60_20_low20_16,
    r_374_391 * 2 = r_374_390,
    s_374_391 * 2 = s_374_390
&&
    true
;

{
    u_374_391 * neg_f_354_low60_20_low20_0 + v_374_391 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_391 * neg_f_354_low60_20_low20_0 + s_374_391 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_17 + u_374_391 * (const 64 (2**21)) + v_374_391 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_17 + r_374_391 * (const 64 (2**21)) + s_374_391 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_17,
    neg_f_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_17,
    neg_g_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 391)) <=s delta, delta <=s (const 64 (1 + 2*391)),
    (const 64 (-(2**20))) <=s u_374_391, u_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_391, v_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_391, r_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_391, s_374_391 <=s (const 64 ((2**20)-1)),
    u_374_391 + v_374_391 <=s (const 64 (2**20)),
    u_374_391 - v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 + v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 - v_374_391 <=s (const 64 (2**20)),
    r_374_391 + s_374_391 <=s (const 64 (2**20)),
    r_374_391 - s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 + s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 - s_374_391 <=s (const 64 (2**20)),
    u_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_374_391 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_390_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_16,
sint64 neg_g_354_low60_20_low20_16,
sint64 neg_f_354_low60_20_low20_17,
sint64 neg_g_354_low60_20_low20_17,
sint64 u_374_390,
sint64 v_374_390,
sint64 r_374_390,
sint64 s_374_390,
sint64 u_374_391,
sint64 v_374_391,
sint64 r_374_391,
sint64 s_374_391,
bit ne
)={
    u_374_390 * neg_f_354_low60_20_low20_0 + v_374_390 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_16 * (-(2**20)),
    r_374_390 * neg_f_354_low60_20_low20_0 + s_374_390 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_16 * (-(2**20))
&&
    u_374_390 * neg_f_354_low60_20_low20_0 + v_374_390 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_16 * (const 64 (-(2**20))),
    r_374_390 * neg_f_354_low60_20_low20_0 + s_374_390 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_16 + u_374_390 * (const 64 (2**21)) + v_374_390 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_16 + r_374_390 * (const 64 (2**21)) + s_374_390 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_16,
    neg_f_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_16,
    neg_g_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 390)) <=s delta, delta <=s (const 64 (1 + 2*390)),
    (const 64 (-(2**20))) <=s u_374_390, u_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_390, v_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_390, r_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_390, s_374_390 <=s (const 64 ((2**20)-1)),
    u_374_390 + v_374_390 <=s (const 64 (2**20)),
    u_374_390 - v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 + v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 - v_374_390 <=s (const 64 (2**20)),
    r_374_390 + s_374_390 <=s (const 64 (2**20)),
    r_374_390 - s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 + s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 - s_374_390 <=s (const 64 (2**20)),
    u_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_374_390 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step390

// premise b
assume
neg_g_354_low60_20_low20_16 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_17 neg_f_354_low60_20_low20_16;
mov u_374_391 u_374_390;
mov v_374_391 v_374_390;

add neg_g_354_low60_20_low20_17 neg_g_354_low60_20_low20_16 neg_f_354_low60_20_low20_16;
asr neg_g_354_low60_20_low20_17 neg_g_354_low60_20_low20_17 1;
add r_374_391 r_374_390 u_374_390;
asr r_374_391 r_374_391 1;
add s_374_391 s_374_390 v_374_390;
asr s_374_391 s_374_391 1;
assert
    true
&&
    neg_f_354_low60_20_low20_17 = neg_f_354_low60_20_low20_16,
    u_374_391 = u_374_390,
    v_374_391 = v_374_390,
    neg_g_354_low60_20_low20_17 * (const 64 2) = neg_g_354_low60_20_low20_16 + neg_f_354_low60_20_low20_16,
    r_374_391 * (const 64 2) = r_374_390 + u_374_390,
    s_374_391 * (const 64 2) = s_374_390 + v_374_390
;

assume
    neg_f_354_low60_20_low20_17 = neg_f_354_low60_20_low20_16,
    u_374_391 = u_374_390,
    v_374_391 = v_374_390,
    neg_g_354_low60_20_low20_17 * 2 = neg_g_354_low60_20_low20_16 + neg_f_354_low60_20_low20_16,
    r_374_391 * 2 = r_374_390 + u_374_390,
    s_374_391 * 2 = s_374_390 + v_374_390
&&
    true
;

{
    u_374_391 * neg_f_354_low60_20_low20_0 + v_374_391 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_391 * neg_f_354_low60_20_low20_0 + s_374_391 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_17 + u_374_391 * (const 64 (2**21)) + v_374_391 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_17 + r_374_391 * (const 64 (2**21)) + s_374_391 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_17,
    neg_f_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_17,
    neg_g_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 391)) <=s delta, delta <=s (const 64 (1 + 2*391)),
    (const 64 (-(2**20))) <=s u_374_391, u_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_391, v_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_391, r_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_391, s_374_391 <=s (const 64 ((2**20)-1)),
    u_374_391 + v_374_391 <=s (const 64 (2**20)),
    u_374_391 - v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 + v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 - v_374_391 <=s (const 64 (2**20)),
    r_374_391 + s_374_391 <=s (const 64 (2**20)),
    r_374_391 - s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 + s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 - s_374_391 <=s (const 64 (2**20)),
    u_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_374_391 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_390_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_16,
sint64 neg_g_354_low60_20_low20_16,
sint64 neg_f_354_low60_20_low20_17,
sint64 neg_g_354_low60_20_low20_17,
sint64 u_374_390,
sint64 v_374_390,
sint64 r_374_390,
sint64 s_374_390,
sint64 u_374_391,
sint64 v_374_391,
sint64 r_374_391,
sint64 s_374_391,
bit ne
)={
    u_374_390 * neg_f_354_low60_20_low20_0 + v_374_390 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_16 * (-(2**20)),
    r_374_390 * neg_f_354_low60_20_low20_0 + s_374_390 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_16 * (-(2**20))
&&
    u_374_390 * neg_f_354_low60_20_low20_0 + v_374_390 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_16 * (const 64 (-(2**20))),
    r_374_390 * neg_f_354_low60_20_low20_0 + s_374_390 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_16 + u_374_390 * (const 64 (2**21)) + v_374_390 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_16 + r_374_390 * (const 64 (2**21)) + s_374_390 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_16,
    neg_f_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_16,
    neg_g_354_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 390)) <=s delta, delta <=s (const 64 (1 + 2*390)),
    (const 64 (-(2**20))) <=s u_374_390, u_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_390, v_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_390, r_374_390 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_390, s_374_390 <=s (const 64 ((2**20)-1)),
    u_374_390 + v_374_390 <=s (const 64 (2**20)),
    u_374_390 - v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 + v_374_390 <=s (const 64 (2**20)),
    (const 64 0) - u_374_390 - v_374_390 <=s (const 64 (2**20)),
    r_374_390 + s_374_390 <=s (const 64 (2**20)),
    r_374_390 - s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 + s_374_390 <=s (const 64 (2**20)),
    (const 64 0) - r_374_390 - s_374_390 <=s (const 64 (2**20)),
    u_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_374_390 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_374_390 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step390

// premise c
assume
neg_g_354_low60_20_low20_16 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_17 neg_g_354_low60_20_low20_16;
mov u_374_391 r_374_390;
mov v_374_391 s_374_390;

subs dc neg_g_354_low60_20_low20_17 neg_g_354_low60_20_low20_16 neg_f_354_low60_20_low20_16;
asr neg_g_354_low60_20_low20_17 neg_g_354_low60_20_low20_17 1;
subs dc r_374_391 r_374_390 u_374_390;
asr r_374_391 r_374_391 1;
subs dc s_374_391 s_374_390 v_374_390;
asr s_374_391 s_374_391 1;
assert
    true
&&
    neg_f_354_low60_20_low20_17 = neg_g_354_low60_20_low20_16,
    u_374_391 = r_374_390,
    v_374_391 = s_374_390,
    neg_g_354_low60_20_low20_17 * (const 64 2) = neg_g_354_low60_20_low20_16 - neg_f_354_low60_20_low20_16,
    r_374_391 * (const 64 2) = r_374_390 - u_374_390,
    s_374_391 * (const 64 2) = s_374_390 - v_374_390
;

assume
    neg_f_354_low60_20_low20_17 = neg_g_354_low60_20_low20_16,
    u_374_391 = r_374_390,
    v_374_391 = s_374_390,
    neg_g_354_low60_20_low20_17 * 2 = neg_g_354_low60_20_low20_16 - neg_f_354_low60_20_low20_16,
    r_374_391 * 2 = r_374_390 - u_374_390,
    s_374_391 * 2 = s_374_390 - v_374_390
&&
    true
;

{
    u_374_391 * neg_f_354_low60_20_low20_0 + v_374_391 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_391 * neg_f_354_low60_20_low20_0 + s_374_391 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_17 + u_374_391 * (const 64 (2**21)) + v_374_391 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_17 + r_374_391 * (const 64 (2**21)) + s_374_391 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_17,
    neg_f_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_17,
    neg_g_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 391)) <=s delta, delta <=s (const 64 (1 + 2*391)),
    (const 64 (-(2**20))) <=s u_374_391, u_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_391, v_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_391, r_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_391, s_374_391 <=s (const 64 ((2**20)-1)),
    u_374_391 + v_374_391 <=s (const 64 (2**20)),
    u_374_391 - v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 + v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 - v_374_391 <=s (const 64 (2**20)),
    r_374_391 + s_374_391 <=s (const 64 (2**20)),
    r_374_391 - s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 + s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 - s_374_391 <=s (const 64 (2**20)),
    u_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_374_391 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_391_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_17,
sint64 neg_g_354_low60_20_low20_17,
sint64 neg_f_354_low60_20_low20_18,
sint64 neg_g_354_low60_20_low20_18,
sint64 u_374_391,
sint64 v_374_391,
sint64 r_374_391,
sint64 s_374_391,
sint64 u_374_392,
sint64 v_374_392,
sint64 r_374_392,
sint64 s_374_392,
bit ne
)={
    u_374_391 * neg_f_354_low60_20_low20_0 + v_374_391 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_17 * (-(2**20)),
    r_374_391 * neg_f_354_low60_20_low20_0 + s_374_391 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_17 * (-(2**20))
&&
    u_374_391 * neg_f_354_low60_20_low20_0 + v_374_391 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_17 * (const 64 (-(2**20))),
    r_374_391 * neg_f_354_low60_20_low20_0 + s_374_391 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_17 + u_374_391 * (const 64 (2**21)) + v_374_391 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_17 + r_374_391 * (const 64 (2**21)) + s_374_391 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_17,
    neg_f_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_17,
    neg_g_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 391)) <=s delta, delta <=s (const 64 (1 + 2*391)),
    (const 64 (-(2**20))) <=s u_374_391, u_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_391, v_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_391, r_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_391, s_374_391 <=s (const 64 ((2**20)-1)),
    u_374_391 + v_374_391 <=s (const 64 (2**20)),
    u_374_391 - v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 + v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 - v_374_391 <=s (const 64 (2**20)),
    r_374_391 + s_374_391 <=s (const 64 (2**20)),
    r_374_391 - s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 + s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 - s_374_391 <=s (const 64 (2**20)),
    u_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_374_391 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step391

// premise a
assume
neg_g_354_low60_20_low20_17 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_17 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_18 neg_f_354_low60_20_low20_17;
mov u_374_392 u_374_391;
mov v_374_392 v_374_391;

asr neg_g_354_low60_20_low20_18 neg_g_354_low60_20_low20_17 1;
asr r_374_392 r_374_391 1;
asr s_374_392 s_374_391 1;
assert
    true
&&
    neg_f_354_low60_20_low20_18 = neg_f_354_low60_20_low20_17,
    u_374_392 = u_374_391,
    v_374_392 = v_374_391,
    neg_g_354_low60_20_low20_18 * (const 64 2) = neg_g_354_low60_20_low20_17,
    r_374_392 * (const 64 2) = r_374_391,
    s_374_392 * (const 64 2) = s_374_391
;

assume
    neg_f_354_low60_20_low20_18 = neg_f_354_low60_20_low20_17,
    u_374_392 = u_374_391,
    v_374_392 = v_374_391,
    neg_g_354_low60_20_low20_18 * 2 = neg_g_354_low60_20_low20_17,
    r_374_392 * 2 = r_374_391,
    s_374_392 * 2 = s_374_391
&&
    true
;

{
    u_374_392 * neg_f_354_low60_20_low20_0 + v_374_392 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_392 * neg_f_354_low60_20_low20_0 + s_374_392 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_18 + u_374_392 * (const 64 (2**21)) + v_374_392 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_18 + r_374_392 * (const 64 (2**21)) + s_374_392 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_18,
    neg_f_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_18,
    neg_g_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 392)) <=s delta, delta <=s (const 64 (1 + 2*392)),
    (const 64 (-(2**20))) <=s u_374_392, u_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_392, v_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_392, r_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_392, s_374_392 <=s (const 64 ((2**20)-1)),
    u_374_392 + v_374_392 <=s (const 64 (2**20)),
    u_374_392 - v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 + v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 - v_374_392 <=s (const 64 (2**20)),
    r_374_392 + s_374_392 <=s (const 64 (2**20)),
    r_374_392 - s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 + s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 - s_374_392 <=s (const 64 (2**20)),
    u_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_374_392 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_391_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_17,
sint64 neg_g_354_low60_20_low20_17,
sint64 neg_f_354_low60_20_low20_18,
sint64 neg_g_354_low60_20_low20_18,
sint64 u_374_391,
sint64 v_374_391,
sint64 r_374_391,
sint64 s_374_391,
sint64 u_374_392,
sint64 v_374_392,
sint64 r_374_392,
sint64 s_374_392,
bit ne
)={
    u_374_391 * neg_f_354_low60_20_low20_0 + v_374_391 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_17 * (-(2**20)),
    r_374_391 * neg_f_354_low60_20_low20_0 + s_374_391 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_17 * (-(2**20))
&&
    u_374_391 * neg_f_354_low60_20_low20_0 + v_374_391 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_17 * (const 64 (-(2**20))),
    r_374_391 * neg_f_354_low60_20_low20_0 + s_374_391 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_17 + u_374_391 * (const 64 (2**21)) + v_374_391 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_17 + r_374_391 * (const 64 (2**21)) + s_374_391 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_17,
    neg_f_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_17,
    neg_g_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 391)) <=s delta, delta <=s (const 64 (1 + 2*391)),
    (const 64 (-(2**20))) <=s u_374_391, u_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_391, v_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_391, r_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_391, s_374_391 <=s (const 64 ((2**20)-1)),
    u_374_391 + v_374_391 <=s (const 64 (2**20)),
    u_374_391 - v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 + v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 - v_374_391 <=s (const 64 (2**20)),
    r_374_391 + s_374_391 <=s (const 64 (2**20)),
    r_374_391 - s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 + s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 - s_374_391 <=s (const 64 (2**20)),
    u_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_374_391 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step391

// premise b
assume
neg_g_354_low60_20_low20_17 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_18 neg_f_354_low60_20_low20_17;
mov u_374_392 u_374_391;
mov v_374_392 v_374_391;

add neg_g_354_low60_20_low20_18 neg_g_354_low60_20_low20_17 neg_f_354_low60_20_low20_17;
asr neg_g_354_low60_20_low20_18 neg_g_354_low60_20_low20_18 1;
add r_374_392 r_374_391 u_374_391;
asr r_374_392 r_374_392 1;
add s_374_392 s_374_391 v_374_391;
asr s_374_392 s_374_392 1;
assert
    true
&&
    neg_f_354_low60_20_low20_18 = neg_f_354_low60_20_low20_17,
    u_374_392 = u_374_391,
    v_374_392 = v_374_391,
    neg_g_354_low60_20_low20_18 * (const 64 2) = neg_g_354_low60_20_low20_17 + neg_f_354_low60_20_low20_17,
    r_374_392 * (const 64 2) = r_374_391 + u_374_391,
    s_374_392 * (const 64 2) = s_374_391 + v_374_391
;

assume
    neg_f_354_low60_20_low20_18 = neg_f_354_low60_20_low20_17,
    u_374_392 = u_374_391,
    v_374_392 = v_374_391,
    neg_g_354_low60_20_low20_18 * 2 = neg_g_354_low60_20_low20_17 + neg_f_354_low60_20_low20_17,
    r_374_392 * 2 = r_374_391 + u_374_391,
    s_374_392 * 2 = s_374_391 + v_374_391
&&
    true
;

{
    u_374_392 * neg_f_354_low60_20_low20_0 + v_374_392 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_392 * neg_f_354_low60_20_low20_0 + s_374_392 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_18 + u_374_392 * (const 64 (2**21)) + v_374_392 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_18 + r_374_392 * (const 64 (2**21)) + s_374_392 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_18,
    neg_f_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_18,
    neg_g_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 392)) <=s delta, delta <=s (const 64 (1 + 2*392)),
    (const 64 (-(2**20))) <=s u_374_392, u_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_392, v_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_392, r_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_392, s_374_392 <=s (const 64 ((2**20)-1)),
    u_374_392 + v_374_392 <=s (const 64 (2**20)),
    u_374_392 - v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 + v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 - v_374_392 <=s (const 64 (2**20)),
    r_374_392 + s_374_392 <=s (const 64 (2**20)),
    r_374_392 - s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 + s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 - s_374_392 <=s (const 64 (2**20)),
    u_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_374_392 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_391_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_17,
sint64 neg_g_354_low60_20_low20_17,
sint64 neg_f_354_low60_20_low20_18,
sint64 neg_g_354_low60_20_low20_18,
sint64 u_374_391,
sint64 v_374_391,
sint64 r_374_391,
sint64 s_374_391,
sint64 u_374_392,
sint64 v_374_392,
sint64 r_374_392,
sint64 s_374_392,
bit ne
)={
    u_374_391 * neg_f_354_low60_20_low20_0 + v_374_391 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_17 * (-(2**20)),
    r_374_391 * neg_f_354_low60_20_low20_0 + s_374_391 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_17 * (-(2**20))
&&
    u_374_391 * neg_f_354_low60_20_low20_0 + v_374_391 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_17 * (const 64 (-(2**20))),
    r_374_391 * neg_f_354_low60_20_low20_0 + s_374_391 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_17 + u_374_391 * (const 64 (2**21)) + v_374_391 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_17 + r_374_391 * (const 64 (2**21)) + s_374_391 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_17,
    neg_f_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_17,
    neg_g_354_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 391)) <=s delta, delta <=s (const 64 (1 + 2*391)),
    (const 64 (-(2**20))) <=s u_374_391, u_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_391, v_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_391, r_374_391 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_391, s_374_391 <=s (const 64 ((2**20)-1)),
    u_374_391 + v_374_391 <=s (const 64 (2**20)),
    u_374_391 - v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 + v_374_391 <=s (const 64 (2**20)),
    (const 64 0) - u_374_391 - v_374_391 <=s (const 64 (2**20)),
    r_374_391 + s_374_391 <=s (const 64 (2**20)),
    r_374_391 - s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 + s_374_391 <=s (const 64 (2**20)),
    (const 64 0) - r_374_391 - s_374_391 <=s (const 64 (2**20)),
    u_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_374_391 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_374_391 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step391

// premise c
assume
neg_g_354_low60_20_low20_17 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_18 neg_g_354_low60_20_low20_17;
mov u_374_392 r_374_391;
mov v_374_392 s_374_391;

subs dc neg_g_354_low60_20_low20_18 neg_g_354_low60_20_low20_17 neg_f_354_low60_20_low20_17;
asr neg_g_354_low60_20_low20_18 neg_g_354_low60_20_low20_18 1;
subs dc r_374_392 r_374_391 u_374_391;
asr r_374_392 r_374_392 1;
subs dc s_374_392 s_374_391 v_374_391;
asr s_374_392 s_374_392 1;
assert
    true
&&
    neg_f_354_low60_20_low20_18 = neg_g_354_low60_20_low20_17,
    u_374_392 = r_374_391,
    v_374_392 = s_374_391,
    neg_g_354_low60_20_low20_18 * (const 64 2) = neg_g_354_low60_20_low20_17 - neg_f_354_low60_20_low20_17,
    r_374_392 * (const 64 2) = r_374_391 - u_374_391,
    s_374_392 * (const 64 2) = s_374_391 - v_374_391
;

assume
    neg_f_354_low60_20_low20_18 = neg_g_354_low60_20_low20_17,
    u_374_392 = r_374_391,
    v_374_392 = s_374_391,
    neg_g_354_low60_20_low20_18 * 2 = neg_g_354_low60_20_low20_17 - neg_f_354_low60_20_low20_17,
    r_374_392 * 2 = r_374_391 - u_374_391,
    s_374_392 * 2 = s_374_391 - v_374_391
&&
    true
;

{
    u_374_392 * neg_f_354_low60_20_low20_0 + v_374_392 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_392 * neg_f_354_low60_20_low20_0 + s_374_392 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_18 + u_374_392 * (const 64 (2**21)) + v_374_392 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_18 + r_374_392 * (const 64 (2**21)) + s_374_392 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_18,
    neg_f_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_18,
    neg_g_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 392)) <=s delta, delta <=s (const 64 (1 + 2*392)),
    (const 64 (-(2**20))) <=s u_374_392, u_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_392, v_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_392, r_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_392, s_374_392 <=s (const 64 ((2**20)-1)),
    u_374_392 + v_374_392 <=s (const 64 (2**20)),
    u_374_392 - v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 + v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 - v_374_392 <=s (const 64 (2**20)),
    r_374_392 + s_374_392 <=s (const 64 (2**20)),
    r_374_392 - s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 + s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 - s_374_392 <=s (const 64 (2**20)),
    u_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_374_392 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_392_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_18,
sint64 neg_g_354_low60_20_low20_18,
sint64 neg_f_354_low60_20_low20_19,
sint64 neg_g_354_low60_20_low20_19,
sint64 u_374_392,
sint64 v_374_392,
sint64 r_374_392,
sint64 s_374_392,
sint64 u_374_393,
sint64 v_374_393,
sint64 r_374_393,
sint64 s_374_393,
bit ne
)={
    u_374_392 * neg_f_354_low60_20_low20_0 + v_374_392 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_18 * (-(2**20)),
    r_374_392 * neg_f_354_low60_20_low20_0 + s_374_392 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_18 * (-(2**20))
&&
    u_374_392 * neg_f_354_low60_20_low20_0 + v_374_392 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_18 * (const 64 (-(2**20))),
    r_374_392 * neg_f_354_low60_20_low20_0 + s_374_392 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_18 + u_374_392 * (const 64 (2**21)) + v_374_392 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_18 + r_374_392 * (const 64 (2**21)) + s_374_392 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_18,
    neg_f_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_18,
    neg_g_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 392)) <=s delta, delta <=s (const 64 (1 + 2*392)),
    (const 64 (-(2**20))) <=s u_374_392, u_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_392, v_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_392, r_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_392, s_374_392 <=s (const 64 ((2**20)-1)),
    u_374_392 + v_374_392 <=s (const 64 (2**20)),
    u_374_392 - v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 + v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 - v_374_392 <=s (const 64 (2**20)),
    r_374_392 + s_374_392 <=s (const 64 (2**20)),
    r_374_392 - s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 + s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 - s_374_392 <=s (const 64 (2**20)),
    u_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_374_392 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step392

// premise a
assume
neg_g_354_low60_20_low20_18 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_18 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_19 neg_f_354_low60_20_low20_18;
mov u_374_393 u_374_392;
mov v_374_393 v_374_392;

asr neg_g_354_low60_20_low20_19 neg_g_354_low60_20_low20_18 1;
asr r_374_393 r_374_392 1;
asr s_374_393 s_374_392 1;
assert
    true
&&
    neg_f_354_low60_20_low20_19 = neg_f_354_low60_20_low20_18,
    u_374_393 = u_374_392,
    v_374_393 = v_374_392,
    neg_g_354_low60_20_low20_19 * (const 64 2) = neg_g_354_low60_20_low20_18,
    r_374_393 * (const 64 2) = r_374_392,
    s_374_393 * (const 64 2) = s_374_392
;

assume
    neg_f_354_low60_20_low20_19 = neg_f_354_low60_20_low20_18,
    u_374_393 = u_374_392,
    v_374_393 = v_374_392,
    neg_g_354_low60_20_low20_19 * 2 = neg_g_354_low60_20_low20_18,
    r_374_393 * 2 = r_374_392,
    s_374_393 * 2 = s_374_392
&&
    true
;

{
    u_374_393 * neg_f_354_low60_20_low20_0 + v_374_393 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_393 * neg_f_354_low60_20_low20_0 + s_374_393 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_19 + u_374_393 * (const 64 (2**21)) + v_374_393 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_19 + r_374_393 * (const 64 (2**21)) + s_374_393 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_19,
    neg_f_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_19,
    neg_g_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 393)) <=s delta, delta <=s (const 64 (1 + 2*393)),
    (const 64 (-(2**20))) <=s u_374_393, u_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_393, v_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_393, r_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_393, s_374_393 <=s (const 64 ((2**20)-1)),
    u_374_393 + v_374_393 <=s (const 64 (2**20)),
    u_374_393 - v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 + v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 - v_374_393 <=s (const 64 (2**20)),
    r_374_393 + s_374_393 <=s (const 64 (2**20)),
    r_374_393 - s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 + s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 - s_374_393 <=s (const 64 (2**20)),
    u_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_374_393 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_392_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_18,
sint64 neg_g_354_low60_20_low20_18,
sint64 neg_f_354_low60_20_low20_19,
sint64 neg_g_354_low60_20_low20_19,
sint64 u_374_392,
sint64 v_374_392,
sint64 r_374_392,
sint64 s_374_392,
sint64 u_374_393,
sint64 v_374_393,
sint64 r_374_393,
sint64 s_374_393,
bit ne
)={
    u_374_392 * neg_f_354_low60_20_low20_0 + v_374_392 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_18 * (-(2**20)),
    r_374_392 * neg_f_354_low60_20_low20_0 + s_374_392 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_18 * (-(2**20))
&&
    u_374_392 * neg_f_354_low60_20_low20_0 + v_374_392 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_18 * (const 64 (-(2**20))),
    r_374_392 * neg_f_354_low60_20_low20_0 + s_374_392 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_18 + u_374_392 * (const 64 (2**21)) + v_374_392 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_18 + r_374_392 * (const 64 (2**21)) + s_374_392 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_18,
    neg_f_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_18,
    neg_g_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 392)) <=s delta, delta <=s (const 64 (1 + 2*392)),
    (const 64 (-(2**20))) <=s u_374_392, u_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_392, v_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_392, r_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_392, s_374_392 <=s (const 64 ((2**20)-1)),
    u_374_392 + v_374_392 <=s (const 64 (2**20)),
    u_374_392 - v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 + v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 - v_374_392 <=s (const 64 (2**20)),
    r_374_392 + s_374_392 <=s (const 64 (2**20)),
    r_374_392 - s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 + s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 - s_374_392 <=s (const 64 (2**20)),
    u_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_374_392 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step392

// premise b
assume
neg_g_354_low60_20_low20_18 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_19 neg_f_354_low60_20_low20_18;
mov u_374_393 u_374_392;
mov v_374_393 v_374_392;

add neg_g_354_low60_20_low20_19 neg_g_354_low60_20_low20_18 neg_f_354_low60_20_low20_18;
asr neg_g_354_low60_20_low20_19 neg_g_354_low60_20_low20_19 1;
add r_374_393 r_374_392 u_374_392;
asr r_374_393 r_374_393 1;
add s_374_393 s_374_392 v_374_392;
asr s_374_393 s_374_393 1;
assert
    true
&&
    neg_f_354_low60_20_low20_19 = neg_f_354_low60_20_low20_18,
    u_374_393 = u_374_392,
    v_374_393 = v_374_392,
    neg_g_354_low60_20_low20_19 * (const 64 2) = neg_g_354_low60_20_low20_18 + neg_f_354_low60_20_low20_18,
    r_374_393 * (const 64 2) = r_374_392 + u_374_392,
    s_374_393 * (const 64 2) = s_374_392 + v_374_392
;

assume
    neg_f_354_low60_20_low20_19 = neg_f_354_low60_20_low20_18,
    u_374_393 = u_374_392,
    v_374_393 = v_374_392,
    neg_g_354_low60_20_low20_19 * 2 = neg_g_354_low60_20_low20_18 + neg_f_354_low60_20_low20_18,
    r_374_393 * 2 = r_374_392 + u_374_392,
    s_374_393 * 2 = s_374_392 + v_374_392
&&
    true
;

{
    u_374_393 * neg_f_354_low60_20_low20_0 + v_374_393 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_393 * neg_f_354_low60_20_low20_0 + s_374_393 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_19 + u_374_393 * (const 64 (2**21)) + v_374_393 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_19 + r_374_393 * (const 64 (2**21)) + s_374_393 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_19,
    neg_f_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_19,
    neg_g_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 393)) <=s delta, delta <=s (const 64 (1 + 2*393)),
    (const 64 (-(2**20))) <=s u_374_393, u_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_393, v_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_393, r_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_393, s_374_393 <=s (const 64 ((2**20)-1)),
    u_374_393 + v_374_393 <=s (const 64 (2**20)),
    u_374_393 - v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 + v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 - v_374_393 <=s (const 64 (2**20)),
    r_374_393 + s_374_393 <=s (const 64 (2**20)),
    r_374_393 - s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 + s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 - s_374_393 <=s (const 64 (2**20)),
    u_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_374_393 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_392_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_18,
sint64 neg_g_354_low60_20_low20_18,
sint64 neg_f_354_low60_20_low20_19,
sint64 neg_g_354_low60_20_low20_19,
sint64 u_374_392,
sint64 v_374_392,
sint64 r_374_392,
sint64 s_374_392,
sint64 u_374_393,
sint64 v_374_393,
sint64 r_374_393,
sint64 s_374_393,
bit ne
)={
    u_374_392 * neg_f_354_low60_20_low20_0 + v_374_392 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_18 * (-(2**20)),
    r_374_392 * neg_f_354_low60_20_low20_0 + s_374_392 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_18 * (-(2**20))
&&
    u_374_392 * neg_f_354_low60_20_low20_0 + v_374_392 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_18 * (const 64 (-(2**20))),
    r_374_392 * neg_f_354_low60_20_low20_0 + s_374_392 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_18 + u_374_392 * (const 64 (2**21)) + v_374_392 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_18 + r_374_392 * (const 64 (2**21)) + s_374_392 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_18,
    neg_f_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_18,
    neg_g_354_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 392)) <=s delta, delta <=s (const 64 (1 + 2*392)),
    (const 64 (-(2**20))) <=s u_374_392, u_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_392, v_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_392, r_374_392 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_392, s_374_392 <=s (const 64 ((2**20)-1)),
    u_374_392 + v_374_392 <=s (const 64 (2**20)),
    u_374_392 - v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 + v_374_392 <=s (const 64 (2**20)),
    (const 64 0) - u_374_392 - v_374_392 <=s (const 64 (2**20)),
    r_374_392 + s_374_392 <=s (const 64 (2**20)),
    r_374_392 - s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 + s_374_392 <=s (const 64 (2**20)),
    (const 64 0) - r_374_392 - s_374_392 <=s (const 64 (2**20)),
    u_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_374_392 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_374_392 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step392

// premise c
assume
neg_g_354_low60_20_low20_18 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_19 neg_g_354_low60_20_low20_18;
mov u_374_393 r_374_392;
mov v_374_393 s_374_392;

subs dc neg_g_354_low60_20_low20_19 neg_g_354_low60_20_low20_18 neg_f_354_low60_20_low20_18;
asr neg_g_354_low60_20_low20_19 neg_g_354_low60_20_low20_19 1;
subs dc r_374_393 r_374_392 u_374_392;
asr r_374_393 r_374_393 1;
subs dc s_374_393 s_374_392 v_374_392;
asr s_374_393 s_374_393 1;
assert
    true
&&
    neg_f_354_low60_20_low20_19 = neg_g_354_low60_20_low20_18,
    u_374_393 = r_374_392,
    v_374_393 = s_374_392,
    neg_g_354_low60_20_low20_19 * (const 64 2) = neg_g_354_low60_20_low20_18 - neg_f_354_low60_20_low20_18,
    r_374_393 * (const 64 2) = r_374_392 - u_374_392,
    s_374_393 * (const 64 2) = s_374_392 - v_374_392
;

assume
    neg_f_354_low60_20_low20_19 = neg_g_354_low60_20_low20_18,
    u_374_393 = r_374_392,
    v_374_393 = s_374_392,
    neg_g_354_low60_20_low20_19 * 2 = neg_g_354_low60_20_low20_18 - neg_f_354_low60_20_low20_18,
    r_374_393 * 2 = r_374_392 - u_374_392,
    s_374_393 * 2 = s_374_392 - v_374_392
&&
    true
;

{
    u_374_393 * neg_f_354_low60_20_low20_0 + v_374_393 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_393 * neg_f_354_low60_20_low20_0 + s_374_393 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_19 + u_374_393 * (const 64 (2**21)) + v_374_393 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_19 + r_374_393 * (const 64 (2**21)) + s_374_393 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_19,
    neg_f_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_19,
    neg_g_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 393)) <=s delta, delta <=s (const 64 (1 + 2*393)),
    (const 64 (-(2**20))) <=s u_374_393, u_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_393, v_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_393, r_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_393, s_374_393 <=s (const 64 ((2**20)-1)),
    u_374_393 + v_374_393 <=s (const 64 (2**20)),
    u_374_393 - v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 + v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 - v_374_393 <=s (const 64 (2**20)),
    r_374_393 + s_374_393 <=s (const 64 (2**20)),
    r_374_393 - s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 + s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 - s_374_393 <=s (const 64 (2**20)),
    u_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_374_393 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_393_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_19,
sint64 neg_g_354_low60_20_low20_19,
sint64 neg_f_354_low60_20_low20_20,
sint64 neg_g_354_low60_20_low20_20,
sint64 u_374_393,
sint64 v_374_393,
sint64 r_374_393,
sint64 s_374_393,
sint64 u_374_394,
sint64 v_374_394,
sint64 r_374_394,
sint64 s_374_394,
bit ne
)={
    u_374_393 * neg_f_354_low60_20_low20_0 + v_374_393 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_19 * (-(2**20)),
    r_374_393 * neg_f_354_low60_20_low20_0 + s_374_393 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_19 * (-(2**20))
&&
    u_374_393 * neg_f_354_low60_20_low20_0 + v_374_393 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_19 * (const 64 (-(2**20))),
    r_374_393 * neg_f_354_low60_20_low20_0 + s_374_393 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_19 + u_374_393 * (const 64 (2**21)) + v_374_393 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_19 + r_374_393 * (const 64 (2**21)) + s_374_393 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_19,
    neg_f_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_19,
    neg_g_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 393)) <=s delta, delta <=s (const 64 (1 + 2*393)),
    (const 64 (-(2**20))) <=s u_374_393, u_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_393, v_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_393, r_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_393, s_374_393 <=s (const 64 ((2**20)-1)),
    u_374_393 + v_374_393 <=s (const 64 (2**20)),
    u_374_393 - v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 + v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 - v_374_393 <=s (const 64 (2**20)),
    r_374_393 + s_374_393 <=s (const 64 (2**20)),
    r_374_393 - s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 + s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 - s_374_393 <=s (const 64 (2**20)),
    u_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_374_393 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step393

// premise a
assume
neg_g_354_low60_20_low20_19 = 0 (mod 2)
&&
neg_g_354_low60_20_low20_19 = const 64 0 (mod (const 64 2))
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

mov neg_f_354_low60_20_low20_20 neg_f_354_low60_20_low20_19;
mov u_374_394 u_374_393;
mov v_374_394 v_374_393;

asr neg_g_354_low60_20_low20_20 neg_g_354_low60_20_low20_19 1;
asr r_374_394 r_374_393 1;
asr s_374_394 s_374_393 1;
assert
    true
&&
    neg_f_354_low60_20_low20_20 = neg_f_354_low60_20_low20_19,
    u_374_394 = u_374_393,
    v_374_394 = v_374_393,
    neg_g_354_low60_20_low20_20 * (const 64 2) = neg_g_354_low60_20_low20_19,
    r_374_394 * (const 64 2) = r_374_393,
    s_374_394 * (const 64 2) = s_374_393
;

assume
    neg_f_354_low60_20_low20_20 = neg_f_354_low60_20_low20_19,
    u_374_394 = u_374_393,
    v_374_394 = v_374_393,
    neg_g_354_low60_20_low20_20 * 2 = neg_g_354_low60_20_low20_19,
    r_374_394 * 2 = r_374_393,
    s_374_394 * 2 = s_374_393
&&
    true
;

{
    u_374_394 * neg_f_354_low60_20_low20_0 + v_374_394 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_394 * neg_f_354_low60_20_low20_0 + s_374_394 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_20 + u_374_394 * (const 64 (2**21)) + v_374_394 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_20 + r_374_394 * (const 64 (2**21)) + s_374_394 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_20,
    neg_f_354_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_20,
    neg_g_354_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 394)) <=s delta, delta <=s (const 64 (1 + 2*394)),
    (const 64 (-(2**20))) <=s u_374_394, u_374_394 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_394, v_374_394 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_394, r_374_394 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_394, s_374_394 <=s (const 64 ((2**20)-1)),
    u_374_394 + v_374_394 <=s (const 64 (2**20)),
    u_374_394 - v_374_394 <=s (const 64 (2**20)),
    (const 64 0) - u_374_394 + v_374_394 <=s (const 64 (2**20)),
    (const 64 0) - u_374_394 - v_374_394 <=s (const 64 (2**20)),
    r_374_394 + s_374_394 <=s (const 64 (2**20)),
    r_374_394 - s_374_394 <=s (const 64 (2**20)),
    (const 64 0) - r_374_394 + s_374_394 <=s (const 64 (2**20)),
    (const 64 0) - r_374_394 - s_374_394 <=s (const 64 (2**20)),
    u_374_394 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_374_394 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_374_394 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_374_394 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_393_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_19,
sint64 neg_g_354_low60_20_low20_19,
sint64 neg_f_354_low60_20_low20_20,
sint64 neg_g_354_low60_20_low20_20,
sint64 u_374_393,
sint64 v_374_393,
sint64 r_374_393,
sint64 s_374_393,
sint64 u_374_394,
sint64 v_374_394,
sint64 r_374_394,
sint64 s_374_394,
bit ne
)={
    u_374_393 * neg_f_354_low60_20_low20_0 + v_374_393 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_19 * (-(2**20)),
    r_374_393 * neg_f_354_low60_20_low20_0 + s_374_393 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_19 * (-(2**20))
&&
    u_374_393 * neg_f_354_low60_20_low20_0 + v_374_393 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_19 * (const 64 (-(2**20))),
    r_374_393 * neg_f_354_low60_20_low20_0 + s_374_393 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_19 + u_374_393 * (const 64 (2**21)) + v_374_393 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_19 + r_374_393 * (const 64 (2**21)) + s_374_393 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_19,
    neg_f_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_19,
    neg_g_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 393)) <=s delta, delta <=s (const 64 (1 + 2*393)),
    (const 64 (-(2**20))) <=s u_374_393, u_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_393, v_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_393, r_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_393, s_374_393 <=s (const 64 ((2**20)-1)),
    u_374_393 + v_374_393 <=s (const 64 (2**20)),
    u_374_393 - v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 + v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 - v_374_393 <=s (const 64 (2**20)),
    r_374_393 + s_374_393 <=s (const 64 (2**20)),
    r_374_393 - s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 + s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 - s_374_393 <=s (const 64 (2**20)),
    u_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_374_393 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step393

// premise b
assume
neg_g_354_low60_20_low20_19 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_20 neg_f_354_low60_20_low20_19;
mov u_374_394 u_374_393;
mov v_374_394 v_374_393;

add neg_g_354_low60_20_low20_20 neg_g_354_low60_20_low20_19 neg_f_354_low60_20_low20_19;
asr neg_g_354_low60_20_low20_20 neg_g_354_low60_20_low20_20 1;
add r_374_394 r_374_393 u_374_393;
asr r_374_394 r_374_394 1;
add s_374_394 s_374_393 v_374_393;
asr s_374_394 s_374_394 1;
assert
    true
&&
    neg_f_354_low60_20_low20_20 = neg_f_354_low60_20_low20_19,
    u_374_394 = u_374_393,
    v_374_394 = v_374_393,
    neg_g_354_low60_20_low20_20 * (const 64 2) = neg_g_354_low60_20_low20_19 + neg_f_354_low60_20_low20_19,
    r_374_394 * (const 64 2) = r_374_393 + u_374_393,
    s_374_394 * (const 64 2) = s_374_393 + v_374_393
;

assume
    neg_f_354_low60_20_low20_20 = neg_f_354_low60_20_low20_19,
    u_374_394 = u_374_393,
    v_374_394 = v_374_393,
    neg_g_354_low60_20_low20_20 * 2 = neg_g_354_low60_20_low20_19 + neg_f_354_low60_20_low20_19,
    r_374_394 * 2 = r_374_393 + u_374_393,
    s_374_394 * 2 = s_374_393 + v_374_393
&&
    true
;

{
    u_374_394 * neg_f_354_low60_20_low20_0 + v_374_394 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_394 * neg_f_354_low60_20_low20_0 + s_374_394 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_20 + u_374_394 * (const 64 (2**21)) + v_374_394 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_20 + r_374_394 * (const 64 (2**21)) + s_374_394 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_20,
    neg_f_354_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_20,
    neg_g_354_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 394)) <=s delta, delta <=s (const 64 (1 + 2*394)),
    (const 64 (-(2**20))) <=s u_374_394, u_374_394 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_394, v_374_394 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_394, r_374_394 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_394, s_374_394 <=s (const 64 ((2**20)-1)),
    u_374_394 + v_374_394 <=s (const 64 (2**20)),
    u_374_394 - v_374_394 <=s (const 64 (2**20)),
    (const 64 0) - u_374_394 + v_374_394 <=s (const 64 (2**20)),
    (const 64 0) - u_374_394 - v_374_394 <=s (const 64 (2**20)),
    r_374_394 + s_374_394 <=s (const 64 (2**20)),
    r_374_394 - s_374_394 <=s (const 64 (2**20)),
    (const 64 0) - r_374_394 + s_374_394 <=s (const 64 (2**20)),
    (const 64 0) - r_374_394 - s_374_394 <=s (const 64 (2**20)),
    u_374_394 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_374_394 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_374_394 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_374_394 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_393_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_354_low60_20_low20_0,
sint64 neg_g_354_low60_20_low20_0,
sint64 neg_f_354_low60_20_low20_19,
sint64 neg_g_354_low60_20_low20_19,
sint64 neg_f_354_low60_20_low20_20,
sint64 neg_g_354_low60_20_low20_20,
sint64 u_374_393,
sint64 v_374_393,
sint64 r_374_393,
sint64 s_374_393,
sint64 u_374_394,
sint64 v_374_394,
sint64 r_374_394,
sint64 s_374_394,
bit ne
)={
    u_374_393 * neg_f_354_low60_20_low20_0 + v_374_393 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_19 * (-(2**20)),
    r_374_393 * neg_f_354_low60_20_low20_0 + s_374_393 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_19 * (-(2**20))
&&
    u_374_393 * neg_f_354_low60_20_low20_0 + v_374_393 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_19 * (const 64 (-(2**20))),
    r_374_393 * neg_f_354_low60_20_low20_0 + s_374_393 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_354_low60_20_low20_19 + u_374_393 * (const 64 (2**21)) + v_374_393 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_19 + r_374_393 * (const 64 (2**21)) + s_374_393 * (const 64 (2**42)),
    const 64 0 <=s neg_f_354_low60_20_low20_0,
    neg_f_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_0,
    neg_g_354_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_354_low60_20_low20_19,
    neg_f_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_354_low60_20_low20_19,
    neg_g_354_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 393)) <=s delta, delta <=s (const 64 (1 + 2*393)),
    (const 64 (-(2**20))) <=s u_374_393, u_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_393, v_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_393, r_374_393 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_393, s_374_393 <=s (const 64 ((2**20)-1)),
    u_374_393 + v_374_393 <=s (const 64 (2**20)),
    u_374_393 - v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 + v_374_393 <=s (const 64 (2**20)),
    (const 64 0) - u_374_393 - v_374_393 <=s (const 64 (2**20)),
    r_374_393 + s_374_393 <=s (const 64 (2**20)),
    r_374_393 - s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 + s_374_393 <=s (const 64 (2**20)),
    (const 64 0) - r_374_393 - s_374_393 <=s (const 64 (2**20)),
    u_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_374_393 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_374_393 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step393

// premise c
assume
neg_g_354_low60_20_low20_19 = 1 (mod 2)
&&
neg_g_354_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_354_low60_20_low20_20 neg_g_354_low60_20_low20_19;
mov u_374_394 r_374_393;
mov v_374_394 s_374_393;

subs dc neg_g_354_low60_20_low20_20 neg_g_354_low60_20_low20_19 neg_f_354_low60_20_low20_19;
asr neg_g_354_low60_20_low20_20 neg_g_354_low60_20_low20_20 1;
subs dc r_374_394 r_374_393 u_374_393;
asr r_374_394 r_374_394 1;
subs dc s_374_394 s_374_393 v_374_393;
asr s_374_394 s_374_394 1;
assert
    true
&&
    neg_f_354_low60_20_low20_20 = neg_g_354_low60_20_low20_19,
    u_374_394 = r_374_393,
    v_374_394 = s_374_393,
    neg_g_354_low60_20_low20_20 * (const 64 2) = neg_g_354_low60_20_low20_19 - neg_f_354_low60_20_low20_19,
    r_374_394 * (const 64 2) = r_374_393 - u_374_393,
    s_374_394 * (const 64 2) = s_374_393 - v_374_393
;

assume
    neg_f_354_low60_20_low20_20 = neg_g_354_low60_20_low20_19,
    u_374_394 = r_374_393,
    v_374_394 = s_374_393,
    neg_g_354_low60_20_low20_20 * 2 = neg_g_354_low60_20_low20_19 - neg_f_354_low60_20_low20_19,
    r_374_394 * 2 = r_374_393 - u_374_393,
    s_374_394 * 2 = s_374_393 - v_374_393
&&
    true
;

{
    u_374_394 * neg_f_354_low60_20_low20_0 + v_374_394 * neg_g_354_low60_20_low20_0 = neg_f_354_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_374_394 * neg_f_354_low60_20_low20_0 + s_374_394 * neg_g_354_low60_20_low20_0 = neg_g_354_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_354_low60_20_low20_20 + u_374_394 * (const 64 (2**21)) + v_374_394 * (const 64 (2**42)),
    grs = neg_g_354_low60_20_low20_20 + r_374_394 * (const 64 (2**21)) + s_374_394 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_354_low60_20_low20_20,
    neg_f_354_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_354_low60_20_low20_20,
    neg_g_354_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 394)) <=s delta, delta <=s (const 64 (1 + 2*394)),
    (const 64 (-(2**20))) <=s u_374_394, u_374_394 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_374_394, v_374_394 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_374_394, r_374_394 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_374_394, s_374_394 <=s (const 64 ((2**20)-1)),
    u_374_394 + v_374_394 <=s (const 64 (2**20)),
    u_374_394 - v_374_394 <=s (const 64 (2**20)),
    (const 64 0) - u_374_394 + v_374_394 <=s (const 64 (2**20)),
    (const 64 0) - u_374_394 - v_374_394 <=s (const 64 (2**20)),
    r_374_394 + s_374_394 <=s (const 64 (2**20)),
    r_374_394 - s_374_394 <=s (const 64 (2**20)),
    (const 64 0) - r_374_394 + s_374_394 <=s (const 64 (2**20)),
    (const 64 0) - r_374_394 - s_374_394 <=s (const 64 (2**20)),
    u_374_394 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_374_394 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_374_394 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_374_394 = (const 64 0) (mod (const 64 (2**(20-20))))
}

