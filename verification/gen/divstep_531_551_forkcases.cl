proc divstep_531_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_1,
sint64 neg_g_531_low60_0_low20_1,
sint64 u_531_531,
sint64 v_531_531,
sint64 r_531_531,
sint64 s_531_531,
sint64 u_531_532,
sint64 v_531_532,
sint64 r_531_532,
sint64 s_531_532,
bit ne
)={
    u_531_531 * neg_f_531_low60_0_low20_0 + v_531_531 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_0 * (-(2**20)),
    r_531_531 * neg_f_531_low60_0_low20_0 + s_531_531 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_0 * (-(2**20))
&&
    u_531_531 * neg_f_531_low60_0_low20_0 + v_531_531 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_0 * (const 64 (-(2**20))),
    r_531_531 * neg_f_531_low60_0_low20_0 + s_531_531 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_0 + u_531_531 * (const 64 (2**21)) + v_531_531 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_0 + r_531_531 * (const 64 (2**21)) + s_531_531 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 531)) <=s delta, delta <=s (const 64 (1 + 2*531)),
    u_531_531 = (const 64 (-(2**20))),
    v_531_531 = (const 64 (0)),
    r_531_531 = (const 64 (0)),
    s_531_531 = (const 64 (-(2**20)))
}



// divsteps
// step531

// premise a
assume
neg_g_531_low60_0_low20_0 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_1 neg_f_531_low60_0_low20_0;
mov u_531_532 u_531_531;
mov v_531_532 v_531_531;

asr neg_g_531_low60_0_low20_1 neg_g_531_low60_0_low20_0 1;
asr r_531_532 r_531_531 1;
asr s_531_532 s_531_531 1;
assert
    true
&&
    neg_f_531_low60_0_low20_1 = neg_f_531_low60_0_low20_0,
    u_531_532 = u_531_531,
    v_531_532 = v_531_531,
    neg_g_531_low60_0_low20_1 * (const 64 2) = neg_g_531_low60_0_low20_0,
    r_531_532 * (const 64 2) = r_531_531,
    s_531_532 * (const 64 2) = s_531_531
;

assume
    neg_f_531_low60_0_low20_1 = neg_f_531_low60_0_low20_0,
    u_531_532 = u_531_531,
    v_531_532 = v_531_531,
    neg_g_531_low60_0_low20_1 * 2 = neg_g_531_low60_0_low20_0,
    r_531_532 * 2 = r_531_531,
    s_531_532 * 2 = s_531_531
&&
    true
;

{
    u_531_532 * neg_f_531_low60_0_low20_0 + v_531_532 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_532 * neg_f_531_low60_0_low20_0 + s_531_532 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_1 + u_531_532 * (const 64 (2**21)) + v_531_532 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_1 + r_531_532 * (const 64 (2**21)) + s_531_532 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_1,
    neg_f_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_1,
    neg_g_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 532)) <=s delta, delta <=s (const 64 (1 + 2*532)),
    (const 64 (-(2**20))) <=s u_531_532, u_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_532, v_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_532, r_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_532, s_531_532 <=s (const 64 ((2**20))),
    u_531_532 + v_531_532 <=s (const 64 (2**20)),
    u_531_532 - v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 + v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 - v_531_532 <=s (const 64 (2**20)),
    r_531_532 + s_531_532 <=s (const 64 (2**20)),
    r_531_532 - s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 + s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 - s_531_532 <=s (const 64 (2**20)),
    u_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_531_532 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_531_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_1,
sint64 neg_g_531_low60_0_low20_1,
sint64 u_531_531,
sint64 v_531_531,
sint64 r_531_531,
sint64 s_531_531,
sint64 u_531_532,
sint64 v_531_532,
sint64 r_531_532,
sint64 s_531_532,
bit ne
)={
    u_531_531 * neg_f_531_low60_0_low20_0 + v_531_531 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_0 * (-(2**20)),
    r_531_531 * neg_f_531_low60_0_low20_0 + s_531_531 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_0 * (-(2**20))
&&
    u_531_531 * neg_f_531_low60_0_low20_0 + v_531_531 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_0 * (const 64 (-(2**20))),
    r_531_531 * neg_f_531_low60_0_low20_0 + s_531_531 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_0 + u_531_531 * (const 64 (2**21)) + v_531_531 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_0 + r_531_531 * (const 64 (2**21)) + s_531_531 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 531)) <=s delta, delta <=s (const 64 (1 + 2*531)),
    u_531_531 = (const 64 (-(2**20))),
    v_531_531 = (const 64 (0)),
    r_531_531 = (const 64 (0)),
    s_531_531 = (const 64 (-(2**20)))
}



// divsteps
// step531

// premise b
assume
neg_g_531_low60_0_low20_0 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_1 neg_f_531_low60_0_low20_0;
mov u_531_532 u_531_531;
mov v_531_532 v_531_531;

add neg_g_531_low60_0_low20_1 neg_g_531_low60_0_low20_0 neg_f_531_low60_0_low20_0;
asr neg_g_531_low60_0_low20_1 neg_g_531_low60_0_low20_1 1;
add r_531_532 r_531_531 u_531_531;
asr r_531_532 r_531_532 1;
add s_531_532 s_531_531 v_531_531;
asr s_531_532 s_531_532 1;
assert
    true
&&
    neg_f_531_low60_0_low20_1 = neg_f_531_low60_0_low20_0,
    u_531_532 = u_531_531,
    v_531_532 = v_531_531,
    neg_g_531_low60_0_low20_1 * (const 64 2) = neg_g_531_low60_0_low20_0 + neg_f_531_low60_0_low20_0,
    r_531_532 * (const 64 2) = r_531_531 + u_531_531,
    s_531_532 * (const 64 2) = s_531_531 + v_531_531
;

assume
    neg_f_531_low60_0_low20_1 = neg_f_531_low60_0_low20_0,
    u_531_532 = u_531_531,
    v_531_532 = v_531_531,
    neg_g_531_low60_0_low20_1 * 2 = neg_g_531_low60_0_low20_0 + neg_f_531_low60_0_low20_0,
    r_531_532 * 2 = r_531_531 + u_531_531,
    s_531_532 * 2 = s_531_531 + v_531_531
&&
    true
;

{
    u_531_532 * neg_f_531_low60_0_low20_0 + v_531_532 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_532 * neg_f_531_low60_0_low20_0 + s_531_532 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_1 + u_531_532 * (const 64 (2**21)) + v_531_532 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_1 + r_531_532 * (const 64 (2**21)) + s_531_532 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_1,
    neg_f_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_1,
    neg_g_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 532)) <=s delta, delta <=s (const 64 (1 + 2*532)),
    (const 64 (-(2**20))) <=s u_531_532, u_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_532, v_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_532, r_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_532, s_531_532 <=s (const 64 ((2**20))),
    u_531_532 + v_531_532 <=s (const 64 (2**20)),
    u_531_532 - v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 + v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 - v_531_532 <=s (const 64 (2**20)),
    r_531_532 + s_531_532 <=s (const 64 (2**20)),
    r_531_532 - s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 + s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 - s_531_532 <=s (const 64 (2**20)),
    u_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_531_532 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_531_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_1,
sint64 neg_g_531_low60_0_low20_1,
sint64 u_531_531,
sint64 v_531_531,
sint64 r_531_531,
sint64 s_531_531,
sint64 u_531_532,
sint64 v_531_532,
sint64 r_531_532,
sint64 s_531_532,
bit ne
)={
    u_531_531 * neg_f_531_low60_0_low20_0 + v_531_531 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_0 * (-(2**20)),
    r_531_531 * neg_f_531_low60_0_low20_0 + s_531_531 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_0 * (-(2**20))
&&
    u_531_531 * neg_f_531_low60_0_low20_0 + v_531_531 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_0 * (const 64 (-(2**20))),
    r_531_531 * neg_f_531_low60_0_low20_0 + s_531_531 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_0 + u_531_531 * (const 64 (2**21)) + v_531_531 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_0 + r_531_531 * (const 64 (2**21)) + s_531_531 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 531)) <=s delta, delta <=s (const 64 (1 + 2*531)),
    u_531_531 = (const 64 (-(2**20))),
    v_531_531 = (const 64 (0)),
    r_531_531 = (const 64 (0)),
    s_531_531 = (const 64 (-(2**20)))
}



// divsteps
// step531

// premise c
assume
neg_g_531_low60_0_low20_0 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_1 neg_g_531_low60_0_low20_0;
mov u_531_532 r_531_531;
mov v_531_532 s_531_531;

subs dc neg_g_531_low60_0_low20_1 neg_g_531_low60_0_low20_0 neg_f_531_low60_0_low20_0;
asr neg_g_531_low60_0_low20_1 neg_g_531_low60_0_low20_1 1;
subs dc r_531_532 r_531_531 u_531_531;
asr r_531_532 r_531_532 1;
subs dc s_531_532 s_531_531 v_531_531;
asr s_531_532 s_531_532 1;
assert
    true
&&
    neg_f_531_low60_0_low20_1 = neg_g_531_low60_0_low20_0,
    u_531_532 = r_531_531,
    v_531_532 = s_531_531,
    neg_g_531_low60_0_low20_1 * (const 64 2) = neg_g_531_low60_0_low20_0 - neg_f_531_low60_0_low20_0,
    r_531_532 * (const 64 2) = r_531_531 - u_531_531,
    s_531_532 * (const 64 2) = s_531_531 - v_531_531
;

assume
    neg_f_531_low60_0_low20_1 = neg_g_531_low60_0_low20_0,
    u_531_532 = r_531_531,
    v_531_532 = s_531_531,
    neg_g_531_low60_0_low20_1 * 2 = neg_g_531_low60_0_low20_0 - neg_f_531_low60_0_low20_0,
    r_531_532 * 2 = r_531_531 - u_531_531,
    s_531_532 * 2 = s_531_531 - v_531_531
&&
    true
;

{
    u_531_532 * neg_f_531_low60_0_low20_0 + v_531_532 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_532 * neg_f_531_low60_0_low20_0 + s_531_532 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_1 + u_531_532 * (const 64 (2**21)) + v_531_532 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_1 + r_531_532 * (const 64 (2**21)) + s_531_532 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_1,
    neg_f_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_1,
    neg_g_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 532)) <=s delta, delta <=s (const 64 (1 + 2*532)),
    (const 64 (-(2**20))) <=s u_531_532, u_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_532, v_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_532, r_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_532, s_531_532 <=s (const 64 ((2**20))),
    u_531_532 + v_531_532 <=s (const 64 (2**20)),
    u_531_532 - v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 + v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 - v_531_532 <=s (const 64 (2**20)),
    r_531_532 + s_531_532 <=s (const 64 (2**20)),
    r_531_532 - s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 + s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 - s_531_532 <=s (const 64 (2**20)),
    u_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_531_532 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_532_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_1,
sint64 neg_g_531_low60_0_low20_1,
sint64 neg_f_531_low60_0_low20_2,
sint64 neg_g_531_low60_0_low20_2,
sint64 u_531_532,
sint64 v_531_532,
sint64 r_531_532,
sint64 s_531_532,
sint64 u_531_533,
sint64 v_531_533,
sint64 r_531_533,
sint64 s_531_533,
bit ne
)={
    u_531_532 * neg_f_531_low60_0_low20_0 + v_531_532 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_1 * (-(2**20)),
    r_531_532 * neg_f_531_low60_0_low20_0 + s_531_532 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_1 * (-(2**20))
&&
    u_531_532 * neg_f_531_low60_0_low20_0 + v_531_532 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_1 * (const 64 (-(2**20))),
    r_531_532 * neg_f_531_low60_0_low20_0 + s_531_532 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_1 + u_531_532 * (const 64 (2**21)) + v_531_532 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_1 + r_531_532 * (const 64 (2**21)) + s_531_532 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_1,
    neg_f_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_1,
    neg_g_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 532)) <=s delta, delta <=s (const 64 (1 + 2*532)),
    (const 64 (-(2**20))) <=s u_531_532, u_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_532, v_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_532, r_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_532, s_531_532 <=s (const 64 ((2**20))),
    u_531_532 + v_531_532 <=s (const 64 (2**20)),
    u_531_532 - v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 + v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 - v_531_532 <=s (const 64 (2**20)),
    r_531_532 + s_531_532 <=s (const 64 (2**20)),
    r_531_532 - s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 + s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 - s_531_532 <=s (const 64 (2**20)),
    u_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_531_532 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step532

// premise a
assume
neg_g_531_low60_0_low20_1 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_1 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_2 neg_f_531_low60_0_low20_1;
mov u_531_533 u_531_532;
mov v_531_533 v_531_532;

asr neg_g_531_low60_0_low20_2 neg_g_531_low60_0_low20_1 1;
asr r_531_533 r_531_532 1;
asr s_531_533 s_531_532 1;
assert
    true
&&
    neg_f_531_low60_0_low20_2 = neg_f_531_low60_0_low20_1,
    u_531_533 = u_531_532,
    v_531_533 = v_531_532,
    neg_g_531_low60_0_low20_2 * (const 64 2) = neg_g_531_low60_0_low20_1,
    r_531_533 * (const 64 2) = r_531_532,
    s_531_533 * (const 64 2) = s_531_532
;

assume
    neg_f_531_low60_0_low20_2 = neg_f_531_low60_0_low20_1,
    u_531_533 = u_531_532,
    v_531_533 = v_531_532,
    neg_g_531_low60_0_low20_2 * 2 = neg_g_531_low60_0_low20_1,
    r_531_533 * 2 = r_531_532,
    s_531_533 * 2 = s_531_532
&&
    true
;

{
    u_531_533 * neg_f_531_low60_0_low20_0 + v_531_533 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_533 * neg_f_531_low60_0_low20_0 + s_531_533 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_2 + u_531_533 * (const 64 (2**21)) + v_531_533 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_2 + r_531_533 * (const 64 (2**21)) + s_531_533 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_2,
    neg_f_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_2,
    neg_g_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 533)) <=s delta, delta <=s (const 64 (1 + 2*533)),
    (const 64 (-(2**20))) <=s u_531_533, u_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_533, v_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_533, r_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_533, s_531_533 <=s (const 64 ((2**20))),
    u_531_533 + v_531_533 <=s (const 64 (2**20)),
    u_531_533 - v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 + v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 - v_531_533 <=s (const 64 (2**20)),
    r_531_533 + s_531_533 <=s (const 64 (2**20)),
    r_531_533 - s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 + s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 - s_531_533 <=s (const 64 (2**20)),
    u_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_531_533 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_532_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_1,
sint64 neg_g_531_low60_0_low20_1,
sint64 neg_f_531_low60_0_low20_2,
sint64 neg_g_531_low60_0_low20_2,
sint64 u_531_532,
sint64 v_531_532,
sint64 r_531_532,
sint64 s_531_532,
sint64 u_531_533,
sint64 v_531_533,
sint64 r_531_533,
sint64 s_531_533,
bit ne
)={
    u_531_532 * neg_f_531_low60_0_low20_0 + v_531_532 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_1 * (-(2**20)),
    r_531_532 * neg_f_531_low60_0_low20_0 + s_531_532 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_1 * (-(2**20))
&&
    u_531_532 * neg_f_531_low60_0_low20_0 + v_531_532 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_1 * (const 64 (-(2**20))),
    r_531_532 * neg_f_531_low60_0_low20_0 + s_531_532 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_1 + u_531_532 * (const 64 (2**21)) + v_531_532 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_1 + r_531_532 * (const 64 (2**21)) + s_531_532 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_1,
    neg_f_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_1,
    neg_g_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 532)) <=s delta, delta <=s (const 64 (1 + 2*532)),
    (const 64 (-(2**20))) <=s u_531_532, u_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_532, v_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_532, r_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_532, s_531_532 <=s (const 64 ((2**20))),
    u_531_532 + v_531_532 <=s (const 64 (2**20)),
    u_531_532 - v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 + v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 - v_531_532 <=s (const 64 (2**20)),
    r_531_532 + s_531_532 <=s (const 64 (2**20)),
    r_531_532 - s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 + s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 - s_531_532 <=s (const 64 (2**20)),
    u_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_531_532 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step532

// premise b
assume
neg_g_531_low60_0_low20_1 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_2 neg_f_531_low60_0_low20_1;
mov u_531_533 u_531_532;
mov v_531_533 v_531_532;

add neg_g_531_low60_0_low20_2 neg_g_531_low60_0_low20_1 neg_f_531_low60_0_low20_1;
asr neg_g_531_low60_0_low20_2 neg_g_531_low60_0_low20_2 1;
add r_531_533 r_531_532 u_531_532;
asr r_531_533 r_531_533 1;
add s_531_533 s_531_532 v_531_532;
asr s_531_533 s_531_533 1;
assert
    true
&&
    neg_f_531_low60_0_low20_2 = neg_f_531_low60_0_low20_1,
    u_531_533 = u_531_532,
    v_531_533 = v_531_532,
    neg_g_531_low60_0_low20_2 * (const 64 2) = neg_g_531_low60_0_low20_1 + neg_f_531_low60_0_low20_1,
    r_531_533 * (const 64 2) = r_531_532 + u_531_532,
    s_531_533 * (const 64 2) = s_531_532 + v_531_532
;

assume
    neg_f_531_low60_0_low20_2 = neg_f_531_low60_0_low20_1,
    u_531_533 = u_531_532,
    v_531_533 = v_531_532,
    neg_g_531_low60_0_low20_2 * 2 = neg_g_531_low60_0_low20_1 + neg_f_531_low60_0_low20_1,
    r_531_533 * 2 = r_531_532 + u_531_532,
    s_531_533 * 2 = s_531_532 + v_531_532
&&
    true
;

{
    u_531_533 * neg_f_531_low60_0_low20_0 + v_531_533 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_533 * neg_f_531_low60_0_low20_0 + s_531_533 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_2 + u_531_533 * (const 64 (2**21)) + v_531_533 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_2 + r_531_533 * (const 64 (2**21)) + s_531_533 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_2,
    neg_f_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_2,
    neg_g_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 533)) <=s delta, delta <=s (const 64 (1 + 2*533)),
    (const 64 (-(2**20))) <=s u_531_533, u_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_533, v_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_533, r_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_533, s_531_533 <=s (const 64 ((2**20))),
    u_531_533 + v_531_533 <=s (const 64 (2**20)),
    u_531_533 - v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 + v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 - v_531_533 <=s (const 64 (2**20)),
    r_531_533 + s_531_533 <=s (const 64 (2**20)),
    r_531_533 - s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 + s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 - s_531_533 <=s (const 64 (2**20)),
    u_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_531_533 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_532_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_1,
sint64 neg_g_531_low60_0_low20_1,
sint64 neg_f_531_low60_0_low20_2,
sint64 neg_g_531_low60_0_low20_2,
sint64 u_531_532,
sint64 v_531_532,
sint64 r_531_532,
sint64 s_531_532,
sint64 u_531_533,
sint64 v_531_533,
sint64 r_531_533,
sint64 s_531_533,
bit ne
)={
    u_531_532 * neg_f_531_low60_0_low20_0 + v_531_532 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_1 * (-(2**20)),
    r_531_532 * neg_f_531_low60_0_low20_0 + s_531_532 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_1 * (-(2**20))
&&
    u_531_532 * neg_f_531_low60_0_low20_0 + v_531_532 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_1 * (const 64 (-(2**20))),
    r_531_532 * neg_f_531_low60_0_low20_0 + s_531_532 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_1 + u_531_532 * (const 64 (2**21)) + v_531_532 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_1 + r_531_532 * (const 64 (2**21)) + s_531_532 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_1,
    neg_f_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_1,
    neg_g_531_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 532)) <=s delta, delta <=s (const 64 (1 + 2*532)),
    (const 64 (-(2**20))) <=s u_531_532, u_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_532, v_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_532, r_531_532 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_532, s_531_532 <=s (const 64 ((2**20))),
    u_531_532 + v_531_532 <=s (const 64 (2**20)),
    u_531_532 - v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 + v_531_532 <=s (const 64 (2**20)),
    (const 64 0) - u_531_532 - v_531_532 <=s (const 64 (2**20)),
    r_531_532 + s_531_532 <=s (const 64 (2**20)),
    r_531_532 - s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 + s_531_532 <=s (const 64 (2**20)),
    (const 64 0) - r_531_532 - s_531_532 <=s (const 64 (2**20)),
    u_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_531_532 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_531_532 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step532

// premise c
assume
neg_g_531_low60_0_low20_1 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_2 neg_g_531_low60_0_low20_1;
mov u_531_533 r_531_532;
mov v_531_533 s_531_532;

subs dc neg_g_531_low60_0_low20_2 neg_g_531_low60_0_low20_1 neg_f_531_low60_0_low20_1;
asr neg_g_531_low60_0_low20_2 neg_g_531_low60_0_low20_2 1;
subs dc r_531_533 r_531_532 u_531_532;
asr r_531_533 r_531_533 1;
subs dc s_531_533 s_531_532 v_531_532;
asr s_531_533 s_531_533 1;
assert
    true
&&
    neg_f_531_low60_0_low20_2 = neg_g_531_low60_0_low20_1,
    u_531_533 = r_531_532,
    v_531_533 = s_531_532,
    neg_g_531_low60_0_low20_2 * (const 64 2) = neg_g_531_low60_0_low20_1 - neg_f_531_low60_0_low20_1,
    r_531_533 * (const 64 2) = r_531_532 - u_531_532,
    s_531_533 * (const 64 2) = s_531_532 - v_531_532
;

assume
    neg_f_531_low60_0_low20_2 = neg_g_531_low60_0_low20_1,
    u_531_533 = r_531_532,
    v_531_533 = s_531_532,
    neg_g_531_low60_0_low20_2 * 2 = neg_g_531_low60_0_low20_1 - neg_f_531_low60_0_low20_1,
    r_531_533 * 2 = r_531_532 - u_531_532,
    s_531_533 * 2 = s_531_532 - v_531_532
&&
    true
;

{
    u_531_533 * neg_f_531_low60_0_low20_0 + v_531_533 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_533 * neg_f_531_low60_0_low20_0 + s_531_533 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_2 + u_531_533 * (const 64 (2**21)) + v_531_533 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_2 + r_531_533 * (const 64 (2**21)) + s_531_533 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_2,
    neg_f_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_2,
    neg_g_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 533)) <=s delta, delta <=s (const 64 (1 + 2*533)),
    (const 64 (-(2**20))) <=s u_531_533, u_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_533, v_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_533, r_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_533, s_531_533 <=s (const 64 ((2**20))),
    u_531_533 + v_531_533 <=s (const 64 (2**20)),
    u_531_533 - v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 + v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 - v_531_533 <=s (const 64 (2**20)),
    r_531_533 + s_531_533 <=s (const 64 (2**20)),
    r_531_533 - s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 + s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 - s_531_533 <=s (const 64 (2**20)),
    u_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_531_533 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_533_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_2,
sint64 neg_g_531_low60_0_low20_2,
sint64 neg_f_531_low60_0_low20_3,
sint64 neg_g_531_low60_0_low20_3,
sint64 u_531_533,
sint64 v_531_533,
sint64 r_531_533,
sint64 s_531_533,
sint64 u_531_534,
sint64 v_531_534,
sint64 r_531_534,
sint64 s_531_534,
bit ne
)={
    u_531_533 * neg_f_531_low60_0_low20_0 + v_531_533 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_2 * (-(2**20)),
    r_531_533 * neg_f_531_low60_0_low20_0 + s_531_533 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_2 * (-(2**20))
&&
    u_531_533 * neg_f_531_low60_0_low20_0 + v_531_533 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_2 * (const 64 (-(2**20))),
    r_531_533 * neg_f_531_low60_0_low20_0 + s_531_533 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_2 + u_531_533 * (const 64 (2**21)) + v_531_533 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_2 + r_531_533 * (const 64 (2**21)) + s_531_533 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_2,
    neg_f_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_2,
    neg_g_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 533)) <=s delta, delta <=s (const 64 (1 + 2*533)),
    (const 64 (-(2**20))) <=s u_531_533, u_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_533, v_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_533, r_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_533, s_531_533 <=s (const 64 ((2**20))),
    u_531_533 + v_531_533 <=s (const 64 (2**20)),
    u_531_533 - v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 + v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 - v_531_533 <=s (const 64 (2**20)),
    r_531_533 + s_531_533 <=s (const 64 (2**20)),
    r_531_533 - s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 + s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 - s_531_533 <=s (const 64 (2**20)),
    u_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_531_533 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step533

// premise a
assume
neg_g_531_low60_0_low20_2 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_2 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_3 neg_f_531_low60_0_low20_2;
mov u_531_534 u_531_533;
mov v_531_534 v_531_533;

asr neg_g_531_low60_0_low20_3 neg_g_531_low60_0_low20_2 1;
asr r_531_534 r_531_533 1;
asr s_531_534 s_531_533 1;
assert
    true
&&
    neg_f_531_low60_0_low20_3 = neg_f_531_low60_0_low20_2,
    u_531_534 = u_531_533,
    v_531_534 = v_531_533,
    neg_g_531_low60_0_low20_3 * (const 64 2) = neg_g_531_low60_0_low20_2,
    r_531_534 * (const 64 2) = r_531_533,
    s_531_534 * (const 64 2) = s_531_533
;

assume
    neg_f_531_low60_0_low20_3 = neg_f_531_low60_0_low20_2,
    u_531_534 = u_531_533,
    v_531_534 = v_531_533,
    neg_g_531_low60_0_low20_3 * 2 = neg_g_531_low60_0_low20_2,
    r_531_534 * 2 = r_531_533,
    s_531_534 * 2 = s_531_533
&&
    true
;

{
    u_531_534 * neg_f_531_low60_0_low20_0 + v_531_534 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_534 * neg_f_531_low60_0_low20_0 + s_531_534 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_3 + u_531_534 * (const 64 (2**21)) + v_531_534 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_3 + r_531_534 * (const 64 (2**21)) + s_531_534 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_3,
    neg_f_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_3,
    neg_g_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 534)) <=s delta, delta <=s (const 64 (1 + 2*534)),
    (const 64 (-(2**20))) <=s u_531_534, u_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_534, v_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_534, r_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_534, s_531_534 <=s (const 64 ((2**20))),
    u_531_534 + v_531_534 <=s (const 64 (2**20)),
    u_531_534 - v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 + v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 - v_531_534 <=s (const 64 (2**20)),
    r_531_534 + s_531_534 <=s (const 64 (2**20)),
    r_531_534 - s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 + s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 - s_531_534 <=s (const 64 (2**20)),
    u_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_531_534 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_533_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_2,
sint64 neg_g_531_low60_0_low20_2,
sint64 neg_f_531_low60_0_low20_3,
sint64 neg_g_531_low60_0_low20_3,
sint64 u_531_533,
sint64 v_531_533,
sint64 r_531_533,
sint64 s_531_533,
sint64 u_531_534,
sint64 v_531_534,
sint64 r_531_534,
sint64 s_531_534,
bit ne
)={
    u_531_533 * neg_f_531_low60_0_low20_0 + v_531_533 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_2 * (-(2**20)),
    r_531_533 * neg_f_531_low60_0_low20_0 + s_531_533 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_2 * (-(2**20))
&&
    u_531_533 * neg_f_531_low60_0_low20_0 + v_531_533 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_2 * (const 64 (-(2**20))),
    r_531_533 * neg_f_531_low60_0_low20_0 + s_531_533 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_2 + u_531_533 * (const 64 (2**21)) + v_531_533 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_2 + r_531_533 * (const 64 (2**21)) + s_531_533 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_2,
    neg_f_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_2,
    neg_g_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 533)) <=s delta, delta <=s (const 64 (1 + 2*533)),
    (const 64 (-(2**20))) <=s u_531_533, u_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_533, v_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_533, r_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_533, s_531_533 <=s (const 64 ((2**20))),
    u_531_533 + v_531_533 <=s (const 64 (2**20)),
    u_531_533 - v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 + v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 - v_531_533 <=s (const 64 (2**20)),
    r_531_533 + s_531_533 <=s (const 64 (2**20)),
    r_531_533 - s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 + s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 - s_531_533 <=s (const 64 (2**20)),
    u_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_531_533 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step533

// premise b
assume
neg_g_531_low60_0_low20_2 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_3 neg_f_531_low60_0_low20_2;
mov u_531_534 u_531_533;
mov v_531_534 v_531_533;

add neg_g_531_low60_0_low20_3 neg_g_531_low60_0_low20_2 neg_f_531_low60_0_low20_2;
asr neg_g_531_low60_0_low20_3 neg_g_531_low60_0_low20_3 1;
add r_531_534 r_531_533 u_531_533;
asr r_531_534 r_531_534 1;
add s_531_534 s_531_533 v_531_533;
asr s_531_534 s_531_534 1;
assert
    true
&&
    neg_f_531_low60_0_low20_3 = neg_f_531_low60_0_low20_2,
    u_531_534 = u_531_533,
    v_531_534 = v_531_533,
    neg_g_531_low60_0_low20_3 * (const 64 2) = neg_g_531_low60_0_low20_2 + neg_f_531_low60_0_low20_2,
    r_531_534 * (const 64 2) = r_531_533 + u_531_533,
    s_531_534 * (const 64 2) = s_531_533 + v_531_533
;

assume
    neg_f_531_low60_0_low20_3 = neg_f_531_low60_0_low20_2,
    u_531_534 = u_531_533,
    v_531_534 = v_531_533,
    neg_g_531_low60_0_low20_3 * 2 = neg_g_531_low60_0_low20_2 + neg_f_531_low60_0_low20_2,
    r_531_534 * 2 = r_531_533 + u_531_533,
    s_531_534 * 2 = s_531_533 + v_531_533
&&
    true
;

{
    u_531_534 * neg_f_531_low60_0_low20_0 + v_531_534 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_534 * neg_f_531_low60_0_low20_0 + s_531_534 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_3 + u_531_534 * (const 64 (2**21)) + v_531_534 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_3 + r_531_534 * (const 64 (2**21)) + s_531_534 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_3,
    neg_f_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_3,
    neg_g_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 534)) <=s delta, delta <=s (const 64 (1 + 2*534)),
    (const 64 (-(2**20))) <=s u_531_534, u_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_534, v_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_534, r_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_534, s_531_534 <=s (const 64 ((2**20))),
    u_531_534 + v_531_534 <=s (const 64 (2**20)),
    u_531_534 - v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 + v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 - v_531_534 <=s (const 64 (2**20)),
    r_531_534 + s_531_534 <=s (const 64 (2**20)),
    r_531_534 - s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 + s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 - s_531_534 <=s (const 64 (2**20)),
    u_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_531_534 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_533_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_2,
sint64 neg_g_531_low60_0_low20_2,
sint64 neg_f_531_low60_0_low20_3,
sint64 neg_g_531_low60_0_low20_3,
sint64 u_531_533,
sint64 v_531_533,
sint64 r_531_533,
sint64 s_531_533,
sint64 u_531_534,
sint64 v_531_534,
sint64 r_531_534,
sint64 s_531_534,
bit ne
)={
    u_531_533 * neg_f_531_low60_0_low20_0 + v_531_533 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_2 * (-(2**20)),
    r_531_533 * neg_f_531_low60_0_low20_0 + s_531_533 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_2 * (-(2**20))
&&
    u_531_533 * neg_f_531_low60_0_low20_0 + v_531_533 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_2 * (const 64 (-(2**20))),
    r_531_533 * neg_f_531_low60_0_low20_0 + s_531_533 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_2 + u_531_533 * (const 64 (2**21)) + v_531_533 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_2 + r_531_533 * (const 64 (2**21)) + s_531_533 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_2,
    neg_f_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_2,
    neg_g_531_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 533)) <=s delta, delta <=s (const 64 (1 + 2*533)),
    (const 64 (-(2**20))) <=s u_531_533, u_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_533, v_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_533, r_531_533 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_533, s_531_533 <=s (const 64 ((2**20))),
    u_531_533 + v_531_533 <=s (const 64 (2**20)),
    u_531_533 - v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 + v_531_533 <=s (const 64 (2**20)),
    (const 64 0) - u_531_533 - v_531_533 <=s (const 64 (2**20)),
    r_531_533 + s_531_533 <=s (const 64 (2**20)),
    r_531_533 - s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 + s_531_533 <=s (const 64 (2**20)),
    (const 64 0) - r_531_533 - s_531_533 <=s (const 64 (2**20)),
    u_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_531_533 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_531_533 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step533

// premise c
assume
neg_g_531_low60_0_low20_2 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_3 neg_g_531_low60_0_low20_2;
mov u_531_534 r_531_533;
mov v_531_534 s_531_533;

subs dc neg_g_531_low60_0_low20_3 neg_g_531_low60_0_low20_2 neg_f_531_low60_0_low20_2;
asr neg_g_531_low60_0_low20_3 neg_g_531_low60_0_low20_3 1;
subs dc r_531_534 r_531_533 u_531_533;
asr r_531_534 r_531_534 1;
subs dc s_531_534 s_531_533 v_531_533;
asr s_531_534 s_531_534 1;
assert
    true
&&
    neg_f_531_low60_0_low20_3 = neg_g_531_low60_0_low20_2,
    u_531_534 = r_531_533,
    v_531_534 = s_531_533,
    neg_g_531_low60_0_low20_3 * (const 64 2) = neg_g_531_low60_0_low20_2 - neg_f_531_low60_0_low20_2,
    r_531_534 * (const 64 2) = r_531_533 - u_531_533,
    s_531_534 * (const 64 2) = s_531_533 - v_531_533
;

assume
    neg_f_531_low60_0_low20_3 = neg_g_531_low60_0_low20_2,
    u_531_534 = r_531_533,
    v_531_534 = s_531_533,
    neg_g_531_low60_0_low20_3 * 2 = neg_g_531_low60_0_low20_2 - neg_f_531_low60_0_low20_2,
    r_531_534 * 2 = r_531_533 - u_531_533,
    s_531_534 * 2 = s_531_533 - v_531_533
&&
    true
;

{
    u_531_534 * neg_f_531_low60_0_low20_0 + v_531_534 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_534 * neg_f_531_low60_0_low20_0 + s_531_534 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_3 + u_531_534 * (const 64 (2**21)) + v_531_534 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_3 + r_531_534 * (const 64 (2**21)) + s_531_534 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_3,
    neg_f_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_3,
    neg_g_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 534)) <=s delta, delta <=s (const 64 (1 + 2*534)),
    (const 64 (-(2**20))) <=s u_531_534, u_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_534, v_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_534, r_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_534, s_531_534 <=s (const 64 ((2**20))),
    u_531_534 + v_531_534 <=s (const 64 (2**20)),
    u_531_534 - v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 + v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 - v_531_534 <=s (const 64 (2**20)),
    r_531_534 + s_531_534 <=s (const 64 (2**20)),
    r_531_534 - s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 + s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 - s_531_534 <=s (const 64 (2**20)),
    u_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_531_534 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_534_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_3,
sint64 neg_g_531_low60_0_low20_3,
sint64 neg_f_531_low60_0_low20_4,
sint64 neg_g_531_low60_0_low20_4,
sint64 u_531_534,
sint64 v_531_534,
sint64 r_531_534,
sint64 s_531_534,
sint64 u_531_535,
sint64 v_531_535,
sint64 r_531_535,
sint64 s_531_535,
bit ne
)={
    u_531_534 * neg_f_531_low60_0_low20_0 + v_531_534 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_3 * (-(2**20)),
    r_531_534 * neg_f_531_low60_0_low20_0 + s_531_534 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_3 * (-(2**20))
&&
    u_531_534 * neg_f_531_low60_0_low20_0 + v_531_534 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_3 * (const 64 (-(2**20))),
    r_531_534 * neg_f_531_low60_0_low20_0 + s_531_534 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_3 + u_531_534 * (const 64 (2**21)) + v_531_534 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_3 + r_531_534 * (const 64 (2**21)) + s_531_534 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_3,
    neg_f_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_3,
    neg_g_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 534)) <=s delta, delta <=s (const 64 (1 + 2*534)),
    (const 64 (-(2**20))) <=s u_531_534, u_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_534, v_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_534, r_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_534, s_531_534 <=s (const 64 ((2**20))),
    u_531_534 + v_531_534 <=s (const 64 (2**20)),
    u_531_534 - v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 + v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 - v_531_534 <=s (const 64 (2**20)),
    r_531_534 + s_531_534 <=s (const 64 (2**20)),
    r_531_534 - s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 + s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 - s_531_534 <=s (const 64 (2**20)),
    u_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_531_534 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step534

// premise a
assume
neg_g_531_low60_0_low20_3 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_3 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_4 neg_f_531_low60_0_low20_3;
mov u_531_535 u_531_534;
mov v_531_535 v_531_534;

asr neg_g_531_low60_0_low20_4 neg_g_531_low60_0_low20_3 1;
asr r_531_535 r_531_534 1;
asr s_531_535 s_531_534 1;
assert
    true
&&
    neg_f_531_low60_0_low20_4 = neg_f_531_low60_0_low20_3,
    u_531_535 = u_531_534,
    v_531_535 = v_531_534,
    neg_g_531_low60_0_low20_4 * (const 64 2) = neg_g_531_low60_0_low20_3,
    r_531_535 * (const 64 2) = r_531_534,
    s_531_535 * (const 64 2) = s_531_534
;

assume
    neg_f_531_low60_0_low20_4 = neg_f_531_low60_0_low20_3,
    u_531_535 = u_531_534,
    v_531_535 = v_531_534,
    neg_g_531_low60_0_low20_4 * 2 = neg_g_531_low60_0_low20_3,
    r_531_535 * 2 = r_531_534,
    s_531_535 * 2 = s_531_534
&&
    true
;

{
    u_531_535 * neg_f_531_low60_0_low20_0 + v_531_535 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_535 * neg_f_531_low60_0_low20_0 + s_531_535 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_4 + u_531_535 * (const 64 (2**21)) + v_531_535 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_4 + r_531_535 * (const 64 (2**21)) + s_531_535 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_4,
    neg_f_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_4,
    neg_g_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 535)) <=s delta, delta <=s (const 64 (1 + 2*535)),
    (const 64 (-(2**20))) <=s u_531_535, u_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_535, v_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_535, r_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_535, s_531_535 <=s (const 64 ((2**20))),
    u_531_535 + v_531_535 <=s (const 64 (2**20)),
    u_531_535 - v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 + v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 - v_531_535 <=s (const 64 (2**20)),
    r_531_535 + s_531_535 <=s (const 64 (2**20)),
    r_531_535 - s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 + s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 - s_531_535 <=s (const 64 (2**20)),
    u_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_531_535 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_534_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_3,
sint64 neg_g_531_low60_0_low20_3,
sint64 neg_f_531_low60_0_low20_4,
sint64 neg_g_531_low60_0_low20_4,
sint64 u_531_534,
sint64 v_531_534,
sint64 r_531_534,
sint64 s_531_534,
sint64 u_531_535,
sint64 v_531_535,
sint64 r_531_535,
sint64 s_531_535,
bit ne
)={
    u_531_534 * neg_f_531_low60_0_low20_0 + v_531_534 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_3 * (-(2**20)),
    r_531_534 * neg_f_531_low60_0_low20_0 + s_531_534 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_3 * (-(2**20))
&&
    u_531_534 * neg_f_531_low60_0_low20_0 + v_531_534 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_3 * (const 64 (-(2**20))),
    r_531_534 * neg_f_531_low60_0_low20_0 + s_531_534 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_3 + u_531_534 * (const 64 (2**21)) + v_531_534 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_3 + r_531_534 * (const 64 (2**21)) + s_531_534 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_3,
    neg_f_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_3,
    neg_g_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 534)) <=s delta, delta <=s (const 64 (1 + 2*534)),
    (const 64 (-(2**20))) <=s u_531_534, u_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_534, v_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_534, r_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_534, s_531_534 <=s (const 64 ((2**20))),
    u_531_534 + v_531_534 <=s (const 64 (2**20)),
    u_531_534 - v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 + v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 - v_531_534 <=s (const 64 (2**20)),
    r_531_534 + s_531_534 <=s (const 64 (2**20)),
    r_531_534 - s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 + s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 - s_531_534 <=s (const 64 (2**20)),
    u_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_531_534 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step534

// premise b
assume
neg_g_531_low60_0_low20_3 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_4 neg_f_531_low60_0_low20_3;
mov u_531_535 u_531_534;
mov v_531_535 v_531_534;

add neg_g_531_low60_0_low20_4 neg_g_531_low60_0_low20_3 neg_f_531_low60_0_low20_3;
asr neg_g_531_low60_0_low20_4 neg_g_531_low60_0_low20_4 1;
add r_531_535 r_531_534 u_531_534;
asr r_531_535 r_531_535 1;
add s_531_535 s_531_534 v_531_534;
asr s_531_535 s_531_535 1;
assert
    true
&&
    neg_f_531_low60_0_low20_4 = neg_f_531_low60_0_low20_3,
    u_531_535 = u_531_534,
    v_531_535 = v_531_534,
    neg_g_531_low60_0_low20_4 * (const 64 2) = neg_g_531_low60_0_low20_3 + neg_f_531_low60_0_low20_3,
    r_531_535 * (const 64 2) = r_531_534 + u_531_534,
    s_531_535 * (const 64 2) = s_531_534 + v_531_534
;

assume
    neg_f_531_low60_0_low20_4 = neg_f_531_low60_0_low20_3,
    u_531_535 = u_531_534,
    v_531_535 = v_531_534,
    neg_g_531_low60_0_low20_4 * 2 = neg_g_531_low60_0_low20_3 + neg_f_531_low60_0_low20_3,
    r_531_535 * 2 = r_531_534 + u_531_534,
    s_531_535 * 2 = s_531_534 + v_531_534
&&
    true
;

{
    u_531_535 * neg_f_531_low60_0_low20_0 + v_531_535 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_535 * neg_f_531_low60_0_low20_0 + s_531_535 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_4 + u_531_535 * (const 64 (2**21)) + v_531_535 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_4 + r_531_535 * (const 64 (2**21)) + s_531_535 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_4,
    neg_f_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_4,
    neg_g_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 535)) <=s delta, delta <=s (const 64 (1 + 2*535)),
    (const 64 (-(2**20))) <=s u_531_535, u_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_535, v_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_535, r_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_535, s_531_535 <=s (const 64 ((2**20))),
    u_531_535 + v_531_535 <=s (const 64 (2**20)),
    u_531_535 - v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 + v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 - v_531_535 <=s (const 64 (2**20)),
    r_531_535 + s_531_535 <=s (const 64 (2**20)),
    r_531_535 - s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 + s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 - s_531_535 <=s (const 64 (2**20)),
    u_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_531_535 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_534_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_3,
sint64 neg_g_531_low60_0_low20_3,
sint64 neg_f_531_low60_0_low20_4,
sint64 neg_g_531_low60_0_low20_4,
sint64 u_531_534,
sint64 v_531_534,
sint64 r_531_534,
sint64 s_531_534,
sint64 u_531_535,
sint64 v_531_535,
sint64 r_531_535,
sint64 s_531_535,
bit ne
)={
    u_531_534 * neg_f_531_low60_0_low20_0 + v_531_534 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_3 * (-(2**20)),
    r_531_534 * neg_f_531_low60_0_low20_0 + s_531_534 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_3 * (-(2**20))
&&
    u_531_534 * neg_f_531_low60_0_low20_0 + v_531_534 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_3 * (const 64 (-(2**20))),
    r_531_534 * neg_f_531_low60_0_low20_0 + s_531_534 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_3 + u_531_534 * (const 64 (2**21)) + v_531_534 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_3 + r_531_534 * (const 64 (2**21)) + s_531_534 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_3,
    neg_f_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_3,
    neg_g_531_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 534)) <=s delta, delta <=s (const 64 (1 + 2*534)),
    (const 64 (-(2**20))) <=s u_531_534, u_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_534, v_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_534, r_531_534 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_534, s_531_534 <=s (const 64 ((2**20))),
    u_531_534 + v_531_534 <=s (const 64 (2**20)),
    u_531_534 - v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 + v_531_534 <=s (const 64 (2**20)),
    (const 64 0) - u_531_534 - v_531_534 <=s (const 64 (2**20)),
    r_531_534 + s_531_534 <=s (const 64 (2**20)),
    r_531_534 - s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 + s_531_534 <=s (const 64 (2**20)),
    (const 64 0) - r_531_534 - s_531_534 <=s (const 64 (2**20)),
    u_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_531_534 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_531_534 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step534

// premise c
assume
neg_g_531_low60_0_low20_3 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_4 neg_g_531_low60_0_low20_3;
mov u_531_535 r_531_534;
mov v_531_535 s_531_534;

subs dc neg_g_531_low60_0_low20_4 neg_g_531_low60_0_low20_3 neg_f_531_low60_0_low20_3;
asr neg_g_531_low60_0_low20_4 neg_g_531_low60_0_low20_4 1;
subs dc r_531_535 r_531_534 u_531_534;
asr r_531_535 r_531_535 1;
subs dc s_531_535 s_531_534 v_531_534;
asr s_531_535 s_531_535 1;
assert
    true
&&
    neg_f_531_low60_0_low20_4 = neg_g_531_low60_0_low20_3,
    u_531_535 = r_531_534,
    v_531_535 = s_531_534,
    neg_g_531_low60_0_low20_4 * (const 64 2) = neg_g_531_low60_0_low20_3 - neg_f_531_low60_0_low20_3,
    r_531_535 * (const 64 2) = r_531_534 - u_531_534,
    s_531_535 * (const 64 2) = s_531_534 - v_531_534
;

assume
    neg_f_531_low60_0_low20_4 = neg_g_531_low60_0_low20_3,
    u_531_535 = r_531_534,
    v_531_535 = s_531_534,
    neg_g_531_low60_0_low20_4 * 2 = neg_g_531_low60_0_low20_3 - neg_f_531_low60_0_low20_3,
    r_531_535 * 2 = r_531_534 - u_531_534,
    s_531_535 * 2 = s_531_534 - v_531_534
&&
    true
;

{
    u_531_535 * neg_f_531_low60_0_low20_0 + v_531_535 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_535 * neg_f_531_low60_0_low20_0 + s_531_535 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_4 + u_531_535 * (const 64 (2**21)) + v_531_535 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_4 + r_531_535 * (const 64 (2**21)) + s_531_535 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_4,
    neg_f_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_4,
    neg_g_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 535)) <=s delta, delta <=s (const 64 (1 + 2*535)),
    (const 64 (-(2**20))) <=s u_531_535, u_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_535, v_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_535, r_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_535, s_531_535 <=s (const 64 ((2**20))),
    u_531_535 + v_531_535 <=s (const 64 (2**20)),
    u_531_535 - v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 + v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 - v_531_535 <=s (const 64 (2**20)),
    r_531_535 + s_531_535 <=s (const 64 (2**20)),
    r_531_535 - s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 + s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 - s_531_535 <=s (const 64 (2**20)),
    u_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_531_535 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_535_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_4,
sint64 neg_g_531_low60_0_low20_4,
sint64 neg_f_531_low60_0_low20_5,
sint64 neg_g_531_low60_0_low20_5,
sint64 u_531_535,
sint64 v_531_535,
sint64 r_531_535,
sint64 s_531_535,
sint64 u_531_536,
sint64 v_531_536,
sint64 r_531_536,
sint64 s_531_536,
bit ne
)={
    u_531_535 * neg_f_531_low60_0_low20_0 + v_531_535 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_4 * (-(2**20)),
    r_531_535 * neg_f_531_low60_0_low20_0 + s_531_535 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_4 * (-(2**20))
&&
    u_531_535 * neg_f_531_low60_0_low20_0 + v_531_535 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_4 * (const 64 (-(2**20))),
    r_531_535 * neg_f_531_low60_0_low20_0 + s_531_535 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_4 + u_531_535 * (const 64 (2**21)) + v_531_535 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_4 + r_531_535 * (const 64 (2**21)) + s_531_535 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_4,
    neg_f_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_4,
    neg_g_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 535)) <=s delta, delta <=s (const 64 (1 + 2*535)),
    (const 64 (-(2**20))) <=s u_531_535, u_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_535, v_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_535, r_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_535, s_531_535 <=s (const 64 ((2**20))),
    u_531_535 + v_531_535 <=s (const 64 (2**20)),
    u_531_535 - v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 + v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 - v_531_535 <=s (const 64 (2**20)),
    r_531_535 + s_531_535 <=s (const 64 (2**20)),
    r_531_535 - s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 + s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 - s_531_535 <=s (const 64 (2**20)),
    u_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_531_535 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step535

// premise a
assume
neg_g_531_low60_0_low20_4 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_4 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_5 neg_f_531_low60_0_low20_4;
mov u_531_536 u_531_535;
mov v_531_536 v_531_535;

asr neg_g_531_low60_0_low20_5 neg_g_531_low60_0_low20_4 1;
asr r_531_536 r_531_535 1;
asr s_531_536 s_531_535 1;
assert
    true
&&
    neg_f_531_low60_0_low20_5 = neg_f_531_low60_0_low20_4,
    u_531_536 = u_531_535,
    v_531_536 = v_531_535,
    neg_g_531_low60_0_low20_5 * (const 64 2) = neg_g_531_low60_0_low20_4,
    r_531_536 * (const 64 2) = r_531_535,
    s_531_536 * (const 64 2) = s_531_535
;

assume
    neg_f_531_low60_0_low20_5 = neg_f_531_low60_0_low20_4,
    u_531_536 = u_531_535,
    v_531_536 = v_531_535,
    neg_g_531_low60_0_low20_5 * 2 = neg_g_531_low60_0_low20_4,
    r_531_536 * 2 = r_531_535,
    s_531_536 * 2 = s_531_535
&&
    true
;

{
    u_531_536 * neg_f_531_low60_0_low20_0 + v_531_536 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_536 * neg_f_531_low60_0_low20_0 + s_531_536 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_5 + u_531_536 * (const 64 (2**21)) + v_531_536 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_5 + r_531_536 * (const 64 (2**21)) + s_531_536 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_5,
    neg_f_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_5,
    neg_g_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 536)) <=s delta, delta <=s (const 64 (1 + 2*536)),
    (const 64 (-(2**20))) <=s u_531_536, u_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_536, v_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_536, r_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_536, s_531_536 <=s (const 64 ((2**20))),
    u_531_536 + v_531_536 <=s (const 64 (2**20)),
    u_531_536 - v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 + v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 - v_531_536 <=s (const 64 (2**20)),
    r_531_536 + s_531_536 <=s (const 64 (2**20)),
    r_531_536 - s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 + s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 - s_531_536 <=s (const 64 (2**20)),
    u_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_531_536 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_535_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_4,
sint64 neg_g_531_low60_0_low20_4,
sint64 neg_f_531_low60_0_low20_5,
sint64 neg_g_531_low60_0_low20_5,
sint64 u_531_535,
sint64 v_531_535,
sint64 r_531_535,
sint64 s_531_535,
sint64 u_531_536,
sint64 v_531_536,
sint64 r_531_536,
sint64 s_531_536,
bit ne
)={
    u_531_535 * neg_f_531_low60_0_low20_0 + v_531_535 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_4 * (-(2**20)),
    r_531_535 * neg_f_531_low60_0_low20_0 + s_531_535 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_4 * (-(2**20))
&&
    u_531_535 * neg_f_531_low60_0_low20_0 + v_531_535 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_4 * (const 64 (-(2**20))),
    r_531_535 * neg_f_531_low60_0_low20_0 + s_531_535 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_4 + u_531_535 * (const 64 (2**21)) + v_531_535 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_4 + r_531_535 * (const 64 (2**21)) + s_531_535 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_4,
    neg_f_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_4,
    neg_g_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 535)) <=s delta, delta <=s (const 64 (1 + 2*535)),
    (const 64 (-(2**20))) <=s u_531_535, u_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_535, v_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_535, r_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_535, s_531_535 <=s (const 64 ((2**20))),
    u_531_535 + v_531_535 <=s (const 64 (2**20)),
    u_531_535 - v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 + v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 - v_531_535 <=s (const 64 (2**20)),
    r_531_535 + s_531_535 <=s (const 64 (2**20)),
    r_531_535 - s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 + s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 - s_531_535 <=s (const 64 (2**20)),
    u_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_531_535 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step535

// premise b
assume
neg_g_531_low60_0_low20_4 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_5 neg_f_531_low60_0_low20_4;
mov u_531_536 u_531_535;
mov v_531_536 v_531_535;

add neg_g_531_low60_0_low20_5 neg_g_531_low60_0_low20_4 neg_f_531_low60_0_low20_4;
asr neg_g_531_low60_0_low20_5 neg_g_531_low60_0_low20_5 1;
add r_531_536 r_531_535 u_531_535;
asr r_531_536 r_531_536 1;
add s_531_536 s_531_535 v_531_535;
asr s_531_536 s_531_536 1;
assert
    true
&&
    neg_f_531_low60_0_low20_5 = neg_f_531_low60_0_low20_4,
    u_531_536 = u_531_535,
    v_531_536 = v_531_535,
    neg_g_531_low60_0_low20_5 * (const 64 2) = neg_g_531_low60_0_low20_4 + neg_f_531_low60_0_low20_4,
    r_531_536 * (const 64 2) = r_531_535 + u_531_535,
    s_531_536 * (const 64 2) = s_531_535 + v_531_535
;

assume
    neg_f_531_low60_0_low20_5 = neg_f_531_low60_0_low20_4,
    u_531_536 = u_531_535,
    v_531_536 = v_531_535,
    neg_g_531_low60_0_low20_5 * 2 = neg_g_531_low60_0_low20_4 + neg_f_531_low60_0_low20_4,
    r_531_536 * 2 = r_531_535 + u_531_535,
    s_531_536 * 2 = s_531_535 + v_531_535
&&
    true
;

{
    u_531_536 * neg_f_531_low60_0_low20_0 + v_531_536 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_536 * neg_f_531_low60_0_low20_0 + s_531_536 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_5 + u_531_536 * (const 64 (2**21)) + v_531_536 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_5 + r_531_536 * (const 64 (2**21)) + s_531_536 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_5,
    neg_f_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_5,
    neg_g_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 536)) <=s delta, delta <=s (const 64 (1 + 2*536)),
    (const 64 (-(2**20))) <=s u_531_536, u_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_536, v_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_536, r_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_536, s_531_536 <=s (const 64 ((2**20))),
    u_531_536 + v_531_536 <=s (const 64 (2**20)),
    u_531_536 - v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 + v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 - v_531_536 <=s (const 64 (2**20)),
    r_531_536 + s_531_536 <=s (const 64 (2**20)),
    r_531_536 - s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 + s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 - s_531_536 <=s (const 64 (2**20)),
    u_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_531_536 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_535_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_4,
sint64 neg_g_531_low60_0_low20_4,
sint64 neg_f_531_low60_0_low20_5,
sint64 neg_g_531_low60_0_low20_5,
sint64 u_531_535,
sint64 v_531_535,
sint64 r_531_535,
sint64 s_531_535,
sint64 u_531_536,
sint64 v_531_536,
sint64 r_531_536,
sint64 s_531_536,
bit ne
)={
    u_531_535 * neg_f_531_low60_0_low20_0 + v_531_535 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_4 * (-(2**20)),
    r_531_535 * neg_f_531_low60_0_low20_0 + s_531_535 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_4 * (-(2**20))
&&
    u_531_535 * neg_f_531_low60_0_low20_0 + v_531_535 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_4 * (const 64 (-(2**20))),
    r_531_535 * neg_f_531_low60_0_low20_0 + s_531_535 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_4 + u_531_535 * (const 64 (2**21)) + v_531_535 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_4 + r_531_535 * (const 64 (2**21)) + s_531_535 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_4,
    neg_f_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_4,
    neg_g_531_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 535)) <=s delta, delta <=s (const 64 (1 + 2*535)),
    (const 64 (-(2**20))) <=s u_531_535, u_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_535, v_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_535, r_531_535 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_535, s_531_535 <=s (const 64 ((2**20))),
    u_531_535 + v_531_535 <=s (const 64 (2**20)),
    u_531_535 - v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 + v_531_535 <=s (const 64 (2**20)),
    (const 64 0) - u_531_535 - v_531_535 <=s (const 64 (2**20)),
    r_531_535 + s_531_535 <=s (const 64 (2**20)),
    r_531_535 - s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 + s_531_535 <=s (const 64 (2**20)),
    (const 64 0) - r_531_535 - s_531_535 <=s (const 64 (2**20)),
    u_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_531_535 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_531_535 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step535

// premise c
assume
neg_g_531_low60_0_low20_4 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_5 neg_g_531_low60_0_low20_4;
mov u_531_536 r_531_535;
mov v_531_536 s_531_535;

subs dc neg_g_531_low60_0_low20_5 neg_g_531_low60_0_low20_4 neg_f_531_low60_0_low20_4;
asr neg_g_531_low60_0_low20_5 neg_g_531_low60_0_low20_5 1;
subs dc r_531_536 r_531_535 u_531_535;
asr r_531_536 r_531_536 1;
subs dc s_531_536 s_531_535 v_531_535;
asr s_531_536 s_531_536 1;
assert
    true
&&
    neg_f_531_low60_0_low20_5 = neg_g_531_low60_0_low20_4,
    u_531_536 = r_531_535,
    v_531_536 = s_531_535,
    neg_g_531_low60_0_low20_5 * (const 64 2) = neg_g_531_low60_0_low20_4 - neg_f_531_low60_0_low20_4,
    r_531_536 * (const 64 2) = r_531_535 - u_531_535,
    s_531_536 * (const 64 2) = s_531_535 - v_531_535
;

assume
    neg_f_531_low60_0_low20_5 = neg_g_531_low60_0_low20_4,
    u_531_536 = r_531_535,
    v_531_536 = s_531_535,
    neg_g_531_low60_0_low20_5 * 2 = neg_g_531_low60_0_low20_4 - neg_f_531_low60_0_low20_4,
    r_531_536 * 2 = r_531_535 - u_531_535,
    s_531_536 * 2 = s_531_535 - v_531_535
&&
    true
;

{
    u_531_536 * neg_f_531_low60_0_low20_0 + v_531_536 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_536 * neg_f_531_low60_0_low20_0 + s_531_536 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_5 + u_531_536 * (const 64 (2**21)) + v_531_536 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_5 + r_531_536 * (const 64 (2**21)) + s_531_536 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_5,
    neg_f_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_5,
    neg_g_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 536)) <=s delta, delta <=s (const 64 (1 + 2*536)),
    (const 64 (-(2**20))) <=s u_531_536, u_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_536, v_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_536, r_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_536, s_531_536 <=s (const 64 ((2**20))),
    u_531_536 + v_531_536 <=s (const 64 (2**20)),
    u_531_536 - v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 + v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 - v_531_536 <=s (const 64 (2**20)),
    r_531_536 + s_531_536 <=s (const 64 (2**20)),
    r_531_536 - s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 + s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 - s_531_536 <=s (const 64 (2**20)),
    u_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_531_536 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_536_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_5,
sint64 neg_g_531_low60_0_low20_5,
sint64 neg_f_531_low60_0_low20_6,
sint64 neg_g_531_low60_0_low20_6,
sint64 u_531_536,
sint64 v_531_536,
sint64 r_531_536,
sint64 s_531_536,
sint64 u_531_537,
sint64 v_531_537,
sint64 r_531_537,
sint64 s_531_537,
bit ne
)={
    u_531_536 * neg_f_531_low60_0_low20_0 + v_531_536 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_5 * (-(2**20)),
    r_531_536 * neg_f_531_low60_0_low20_0 + s_531_536 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_5 * (-(2**20))
&&
    u_531_536 * neg_f_531_low60_0_low20_0 + v_531_536 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_5 * (const 64 (-(2**20))),
    r_531_536 * neg_f_531_low60_0_low20_0 + s_531_536 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_5 + u_531_536 * (const 64 (2**21)) + v_531_536 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_5 + r_531_536 * (const 64 (2**21)) + s_531_536 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_5,
    neg_f_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_5,
    neg_g_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 536)) <=s delta, delta <=s (const 64 (1 + 2*536)),
    (const 64 (-(2**20))) <=s u_531_536, u_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_536, v_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_536, r_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_536, s_531_536 <=s (const 64 ((2**20))),
    u_531_536 + v_531_536 <=s (const 64 (2**20)),
    u_531_536 - v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 + v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 - v_531_536 <=s (const 64 (2**20)),
    r_531_536 + s_531_536 <=s (const 64 (2**20)),
    r_531_536 - s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 + s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 - s_531_536 <=s (const 64 (2**20)),
    u_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_531_536 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step536

// premise a
assume
neg_g_531_low60_0_low20_5 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_5 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_6 neg_f_531_low60_0_low20_5;
mov u_531_537 u_531_536;
mov v_531_537 v_531_536;

asr neg_g_531_low60_0_low20_6 neg_g_531_low60_0_low20_5 1;
asr r_531_537 r_531_536 1;
asr s_531_537 s_531_536 1;
assert
    true
&&
    neg_f_531_low60_0_low20_6 = neg_f_531_low60_0_low20_5,
    u_531_537 = u_531_536,
    v_531_537 = v_531_536,
    neg_g_531_low60_0_low20_6 * (const 64 2) = neg_g_531_low60_0_low20_5,
    r_531_537 * (const 64 2) = r_531_536,
    s_531_537 * (const 64 2) = s_531_536
;

assume
    neg_f_531_low60_0_low20_6 = neg_f_531_low60_0_low20_5,
    u_531_537 = u_531_536,
    v_531_537 = v_531_536,
    neg_g_531_low60_0_low20_6 * 2 = neg_g_531_low60_0_low20_5,
    r_531_537 * 2 = r_531_536,
    s_531_537 * 2 = s_531_536
&&
    true
;

{
    u_531_537 * neg_f_531_low60_0_low20_0 + v_531_537 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_537 * neg_f_531_low60_0_low20_0 + s_531_537 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_6 + u_531_537 * (const 64 (2**21)) + v_531_537 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_6 + r_531_537 * (const 64 (2**21)) + s_531_537 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_6,
    neg_f_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_6,
    neg_g_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 537)) <=s delta, delta <=s (const 64 (1 + 2*537)),
    (const 64 (-(2**20))) <=s u_531_537, u_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_537, v_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_537, r_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_537, s_531_537 <=s (const 64 ((2**20))),
    u_531_537 + v_531_537 <=s (const 64 (2**20)),
    u_531_537 - v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 + v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 - v_531_537 <=s (const 64 (2**20)),
    r_531_537 + s_531_537 <=s (const 64 (2**20)),
    r_531_537 - s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 + s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 - s_531_537 <=s (const 64 (2**20)),
    u_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_531_537 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_536_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_5,
sint64 neg_g_531_low60_0_low20_5,
sint64 neg_f_531_low60_0_low20_6,
sint64 neg_g_531_low60_0_low20_6,
sint64 u_531_536,
sint64 v_531_536,
sint64 r_531_536,
sint64 s_531_536,
sint64 u_531_537,
sint64 v_531_537,
sint64 r_531_537,
sint64 s_531_537,
bit ne
)={
    u_531_536 * neg_f_531_low60_0_low20_0 + v_531_536 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_5 * (-(2**20)),
    r_531_536 * neg_f_531_low60_0_low20_0 + s_531_536 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_5 * (-(2**20))
&&
    u_531_536 * neg_f_531_low60_0_low20_0 + v_531_536 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_5 * (const 64 (-(2**20))),
    r_531_536 * neg_f_531_low60_0_low20_0 + s_531_536 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_5 + u_531_536 * (const 64 (2**21)) + v_531_536 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_5 + r_531_536 * (const 64 (2**21)) + s_531_536 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_5,
    neg_f_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_5,
    neg_g_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 536)) <=s delta, delta <=s (const 64 (1 + 2*536)),
    (const 64 (-(2**20))) <=s u_531_536, u_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_536, v_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_536, r_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_536, s_531_536 <=s (const 64 ((2**20))),
    u_531_536 + v_531_536 <=s (const 64 (2**20)),
    u_531_536 - v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 + v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 - v_531_536 <=s (const 64 (2**20)),
    r_531_536 + s_531_536 <=s (const 64 (2**20)),
    r_531_536 - s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 + s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 - s_531_536 <=s (const 64 (2**20)),
    u_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_531_536 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step536

// premise b
assume
neg_g_531_low60_0_low20_5 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_6 neg_f_531_low60_0_low20_5;
mov u_531_537 u_531_536;
mov v_531_537 v_531_536;

add neg_g_531_low60_0_low20_6 neg_g_531_low60_0_low20_5 neg_f_531_low60_0_low20_5;
asr neg_g_531_low60_0_low20_6 neg_g_531_low60_0_low20_6 1;
add r_531_537 r_531_536 u_531_536;
asr r_531_537 r_531_537 1;
add s_531_537 s_531_536 v_531_536;
asr s_531_537 s_531_537 1;
assert
    true
&&
    neg_f_531_low60_0_low20_6 = neg_f_531_low60_0_low20_5,
    u_531_537 = u_531_536,
    v_531_537 = v_531_536,
    neg_g_531_low60_0_low20_6 * (const 64 2) = neg_g_531_low60_0_low20_5 + neg_f_531_low60_0_low20_5,
    r_531_537 * (const 64 2) = r_531_536 + u_531_536,
    s_531_537 * (const 64 2) = s_531_536 + v_531_536
;

assume
    neg_f_531_low60_0_low20_6 = neg_f_531_low60_0_low20_5,
    u_531_537 = u_531_536,
    v_531_537 = v_531_536,
    neg_g_531_low60_0_low20_6 * 2 = neg_g_531_low60_0_low20_5 + neg_f_531_low60_0_low20_5,
    r_531_537 * 2 = r_531_536 + u_531_536,
    s_531_537 * 2 = s_531_536 + v_531_536
&&
    true
;

{
    u_531_537 * neg_f_531_low60_0_low20_0 + v_531_537 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_537 * neg_f_531_low60_0_low20_0 + s_531_537 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_6 + u_531_537 * (const 64 (2**21)) + v_531_537 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_6 + r_531_537 * (const 64 (2**21)) + s_531_537 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_6,
    neg_f_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_6,
    neg_g_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 537)) <=s delta, delta <=s (const 64 (1 + 2*537)),
    (const 64 (-(2**20))) <=s u_531_537, u_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_537, v_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_537, r_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_537, s_531_537 <=s (const 64 ((2**20))),
    u_531_537 + v_531_537 <=s (const 64 (2**20)),
    u_531_537 - v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 + v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 - v_531_537 <=s (const 64 (2**20)),
    r_531_537 + s_531_537 <=s (const 64 (2**20)),
    r_531_537 - s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 + s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 - s_531_537 <=s (const 64 (2**20)),
    u_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_531_537 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_536_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_5,
sint64 neg_g_531_low60_0_low20_5,
sint64 neg_f_531_low60_0_low20_6,
sint64 neg_g_531_low60_0_low20_6,
sint64 u_531_536,
sint64 v_531_536,
sint64 r_531_536,
sint64 s_531_536,
sint64 u_531_537,
sint64 v_531_537,
sint64 r_531_537,
sint64 s_531_537,
bit ne
)={
    u_531_536 * neg_f_531_low60_0_low20_0 + v_531_536 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_5 * (-(2**20)),
    r_531_536 * neg_f_531_low60_0_low20_0 + s_531_536 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_5 * (-(2**20))
&&
    u_531_536 * neg_f_531_low60_0_low20_0 + v_531_536 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_5 * (const 64 (-(2**20))),
    r_531_536 * neg_f_531_low60_0_low20_0 + s_531_536 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_5 + u_531_536 * (const 64 (2**21)) + v_531_536 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_5 + r_531_536 * (const 64 (2**21)) + s_531_536 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_5,
    neg_f_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_5,
    neg_g_531_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 536)) <=s delta, delta <=s (const 64 (1 + 2*536)),
    (const 64 (-(2**20))) <=s u_531_536, u_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_536, v_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_536, r_531_536 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_536, s_531_536 <=s (const 64 ((2**20))),
    u_531_536 + v_531_536 <=s (const 64 (2**20)),
    u_531_536 - v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 + v_531_536 <=s (const 64 (2**20)),
    (const 64 0) - u_531_536 - v_531_536 <=s (const 64 (2**20)),
    r_531_536 + s_531_536 <=s (const 64 (2**20)),
    r_531_536 - s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 + s_531_536 <=s (const 64 (2**20)),
    (const 64 0) - r_531_536 - s_531_536 <=s (const 64 (2**20)),
    u_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_531_536 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_531_536 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step536

// premise c
assume
neg_g_531_low60_0_low20_5 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_6 neg_g_531_low60_0_low20_5;
mov u_531_537 r_531_536;
mov v_531_537 s_531_536;

subs dc neg_g_531_low60_0_low20_6 neg_g_531_low60_0_low20_5 neg_f_531_low60_0_low20_5;
asr neg_g_531_low60_0_low20_6 neg_g_531_low60_0_low20_6 1;
subs dc r_531_537 r_531_536 u_531_536;
asr r_531_537 r_531_537 1;
subs dc s_531_537 s_531_536 v_531_536;
asr s_531_537 s_531_537 1;
assert
    true
&&
    neg_f_531_low60_0_low20_6 = neg_g_531_low60_0_low20_5,
    u_531_537 = r_531_536,
    v_531_537 = s_531_536,
    neg_g_531_low60_0_low20_6 * (const 64 2) = neg_g_531_low60_0_low20_5 - neg_f_531_low60_0_low20_5,
    r_531_537 * (const 64 2) = r_531_536 - u_531_536,
    s_531_537 * (const 64 2) = s_531_536 - v_531_536
;

assume
    neg_f_531_low60_0_low20_6 = neg_g_531_low60_0_low20_5,
    u_531_537 = r_531_536,
    v_531_537 = s_531_536,
    neg_g_531_low60_0_low20_6 * 2 = neg_g_531_low60_0_low20_5 - neg_f_531_low60_0_low20_5,
    r_531_537 * 2 = r_531_536 - u_531_536,
    s_531_537 * 2 = s_531_536 - v_531_536
&&
    true
;

{
    u_531_537 * neg_f_531_low60_0_low20_0 + v_531_537 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_537 * neg_f_531_low60_0_low20_0 + s_531_537 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_6 + u_531_537 * (const 64 (2**21)) + v_531_537 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_6 + r_531_537 * (const 64 (2**21)) + s_531_537 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_6,
    neg_f_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_6,
    neg_g_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 537)) <=s delta, delta <=s (const 64 (1 + 2*537)),
    (const 64 (-(2**20))) <=s u_531_537, u_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_537, v_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_537, r_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_537, s_531_537 <=s (const 64 ((2**20))),
    u_531_537 + v_531_537 <=s (const 64 (2**20)),
    u_531_537 - v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 + v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 - v_531_537 <=s (const 64 (2**20)),
    r_531_537 + s_531_537 <=s (const 64 (2**20)),
    r_531_537 - s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 + s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 - s_531_537 <=s (const 64 (2**20)),
    u_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_531_537 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_537_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_6,
sint64 neg_g_531_low60_0_low20_6,
sint64 neg_f_531_low60_0_low20_7,
sint64 neg_g_531_low60_0_low20_7,
sint64 u_531_537,
sint64 v_531_537,
sint64 r_531_537,
sint64 s_531_537,
sint64 u_531_538,
sint64 v_531_538,
sint64 r_531_538,
sint64 s_531_538,
bit ne
)={
    u_531_537 * neg_f_531_low60_0_low20_0 + v_531_537 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_6 * (-(2**20)),
    r_531_537 * neg_f_531_low60_0_low20_0 + s_531_537 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_6 * (-(2**20))
&&
    u_531_537 * neg_f_531_low60_0_low20_0 + v_531_537 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_6 * (const 64 (-(2**20))),
    r_531_537 * neg_f_531_low60_0_low20_0 + s_531_537 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_6 + u_531_537 * (const 64 (2**21)) + v_531_537 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_6 + r_531_537 * (const 64 (2**21)) + s_531_537 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_6,
    neg_f_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_6,
    neg_g_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 537)) <=s delta, delta <=s (const 64 (1 + 2*537)),
    (const 64 (-(2**20))) <=s u_531_537, u_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_537, v_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_537, r_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_537, s_531_537 <=s (const 64 ((2**20))),
    u_531_537 + v_531_537 <=s (const 64 (2**20)),
    u_531_537 - v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 + v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 - v_531_537 <=s (const 64 (2**20)),
    r_531_537 + s_531_537 <=s (const 64 (2**20)),
    r_531_537 - s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 + s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 - s_531_537 <=s (const 64 (2**20)),
    u_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_531_537 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step537

// premise a
assume
neg_g_531_low60_0_low20_6 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_6 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_7 neg_f_531_low60_0_low20_6;
mov u_531_538 u_531_537;
mov v_531_538 v_531_537;

asr neg_g_531_low60_0_low20_7 neg_g_531_low60_0_low20_6 1;
asr r_531_538 r_531_537 1;
asr s_531_538 s_531_537 1;
assert
    true
&&
    neg_f_531_low60_0_low20_7 = neg_f_531_low60_0_low20_6,
    u_531_538 = u_531_537,
    v_531_538 = v_531_537,
    neg_g_531_low60_0_low20_7 * (const 64 2) = neg_g_531_low60_0_low20_6,
    r_531_538 * (const 64 2) = r_531_537,
    s_531_538 * (const 64 2) = s_531_537
;

assume
    neg_f_531_low60_0_low20_7 = neg_f_531_low60_0_low20_6,
    u_531_538 = u_531_537,
    v_531_538 = v_531_537,
    neg_g_531_low60_0_low20_7 * 2 = neg_g_531_low60_0_low20_6,
    r_531_538 * 2 = r_531_537,
    s_531_538 * 2 = s_531_537
&&
    true
;

{
    u_531_538 * neg_f_531_low60_0_low20_0 + v_531_538 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_538 * neg_f_531_low60_0_low20_0 + s_531_538 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_7 + u_531_538 * (const 64 (2**21)) + v_531_538 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_7 + r_531_538 * (const 64 (2**21)) + s_531_538 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_7,
    neg_f_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_7,
    neg_g_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 538)) <=s delta, delta <=s (const 64 (1 + 2*538)),
    (const 64 (-(2**20))) <=s u_531_538, u_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_538, v_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_538, r_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_538, s_531_538 <=s (const 64 ((2**20))),
    u_531_538 + v_531_538 <=s (const 64 (2**20)),
    u_531_538 - v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 + v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 - v_531_538 <=s (const 64 (2**20)),
    r_531_538 + s_531_538 <=s (const 64 (2**20)),
    r_531_538 - s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 + s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 - s_531_538 <=s (const 64 (2**20)),
    u_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_531_538 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_537_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_6,
sint64 neg_g_531_low60_0_low20_6,
sint64 neg_f_531_low60_0_low20_7,
sint64 neg_g_531_low60_0_low20_7,
sint64 u_531_537,
sint64 v_531_537,
sint64 r_531_537,
sint64 s_531_537,
sint64 u_531_538,
sint64 v_531_538,
sint64 r_531_538,
sint64 s_531_538,
bit ne
)={
    u_531_537 * neg_f_531_low60_0_low20_0 + v_531_537 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_6 * (-(2**20)),
    r_531_537 * neg_f_531_low60_0_low20_0 + s_531_537 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_6 * (-(2**20))
&&
    u_531_537 * neg_f_531_low60_0_low20_0 + v_531_537 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_6 * (const 64 (-(2**20))),
    r_531_537 * neg_f_531_low60_0_low20_0 + s_531_537 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_6 + u_531_537 * (const 64 (2**21)) + v_531_537 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_6 + r_531_537 * (const 64 (2**21)) + s_531_537 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_6,
    neg_f_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_6,
    neg_g_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 537)) <=s delta, delta <=s (const 64 (1 + 2*537)),
    (const 64 (-(2**20))) <=s u_531_537, u_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_537, v_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_537, r_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_537, s_531_537 <=s (const 64 ((2**20))),
    u_531_537 + v_531_537 <=s (const 64 (2**20)),
    u_531_537 - v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 + v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 - v_531_537 <=s (const 64 (2**20)),
    r_531_537 + s_531_537 <=s (const 64 (2**20)),
    r_531_537 - s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 + s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 - s_531_537 <=s (const 64 (2**20)),
    u_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_531_537 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step537

// premise b
assume
neg_g_531_low60_0_low20_6 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_7 neg_f_531_low60_0_low20_6;
mov u_531_538 u_531_537;
mov v_531_538 v_531_537;

add neg_g_531_low60_0_low20_7 neg_g_531_low60_0_low20_6 neg_f_531_low60_0_low20_6;
asr neg_g_531_low60_0_low20_7 neg_g_531_low60_0_low20_7 1;
add r_531_538 r_531_537 u_531_537;
asr r_531_538 r_531_538 1;
add s_531_538 s_531_537 v_531_537;
asr s_531_538 s_531_538 1;
assert
    true
&&
    neg_f_531_low60_0_low20_7 = neg_f_531_low60_0_low20_6,
    u_531_538 = u_531_537,
    v_531_538 = v_531_537,
    neg_g_531_low60_0_low20_7 * (const 64 2) = neg_g_531_low60_0_low20_6 + neg_f_531_low60_0_low20_6,
    r_531_538 * (const 64 2) = r_531_537 + u_531_537,
    s_531_538 * (const 64 2) = s_531_537 + v_531_537
;

assume
    neg_f_531_low60_0_low20_7 = neg_f_531_low60_0_low20_6,
    u_531_538 = u_531_537,
    v_531_538 = v_531_537,
    neg_g_531_low60_0_low20_7 * 2 = neg_g_531_low60_0_low20_6 + neg_f_531_low60_0_low20_6,
    r_531_538 * 2 = r_531_537 + u_531_537,
    s_531_538 * 2 = s_531_537 + v_531_537
&&
    true
;

{
    u_531_538 * neg_f_531_low60_0_low20_0 + v_531_538 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_538 * neg_f_531_low60_0_low20_0 + s_531_538 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_7 + u_531_538 * (const 64 (2**21)) + v_531_538 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_7 + r_531_538 * (const 64 (2**21)) + s_531_538 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_7,
    neg_f_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_7,
    neg_g_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 538)) <=s delta, delta <=s (const 64 (1 + 2*538)),
    (const 64 (-(2**20))) <=s u_531_538, u_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_538, v_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_538, r_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_538, s_531_538 <=s (const 64 ((2**20))),
    u_531_538 + v_531_538 <=s (const 64 (2**20)),
    u_531_538 - v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 + v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 - v_531_538 <=s (const 64 (2**20)),
    r_531_538 + s_531_538 <=s (const 64 (2**20)),
    r_531_538 - s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 + s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 - s_531_538 <=s (const 64 (2**20)),
    u_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_531_538 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_537_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_6,
sint64 neg_g_531_low60_0_low20_6,
sint64 neg_f_531_low60_0_low20_7,
sint64 neg_g_531_low60_0_low20_7,
sint64 u_531_537,
sint64 v_531_537,
sint64 r_531_537,
sint64 s_531_537,
sint64 u_531_538,
sint64 v_531_538,
sint64 r_531_538,
sint64 s_531_538,
bit ne
)={
    u_531_537 * neg_f_531_low60_0_low20_0 + v_531_537 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_6 * (-(2**20)),
    r_531_537 * neg_f_531_low60_0_low20_0 + s_531_537 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_6 * (-(2**20))
&&
    u_531_537 * neg_f_531_low60_0_low20_0 + v_531_537 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_6 * (const 64 (-(2**20))),
    r_531_537 * neg_f_531_low60_0_low20_0 + s_531_537 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_6 + u_531_537 * (const 64 (2**21)) + v_531_537 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_6 + r_531_537 * (const 64 (2**21)) + s_531_537 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_6,
    neg_f_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_6,
    neg_g_531_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 537)) <=s delta, delta <=s (const 64 (1 + 2*537)),
    (const 64 (-(2**20))) <=s u_531_537, u_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_537, v_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_537, r_531_537 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_537, s_531_537 <=s (const 64 ((2**20))),
    u_531_537 + v_531_537 <=s (const 64 (2**20)),
    u_531_537 - v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 + v_531_537 <=s (const 64 (2**20)),
    (const 64 0) - u_531_537 - v_531_537 <=s (const 64 (2**20)),
    r_531_537 + s_531_537 <=s (const 64 (2**20)),
    r_531_537 - s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 + s_531_537 <=s (const 64 (2**20)),
    (const 64 0) - r_531_537 - s_531_537 <=s (const 64 (2**20)),
    u_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_531_537 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_531_537 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step537

// premise c
assume
neg_g_531_low60_0_low20_6 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_7 neg_g_531_low60_0_low20_6;
mov u_531_538 r_531_537;
mov v_531_538 s_531_537;

subs dc neg_g_531_low60_0_low20_7 neg_g_531_low60_0_low20_6 neg_f_531_low60_0_low20_6;
asr neg_g_531_low60_0_low20_7 neg_g_531_low60_0_low20_7 1;
subs dc r_531_538 r_531_537 u_531_537;
asr r_531_538 r_531_538 1;
subs dc s_531_538 s_531_537 v_531_537;
asr s_531_538 s_531_538 1;
assert
    true
&&
    neg_f_531_low60_0_low20_7 = neg_g_531_low60_0_low20_6,
    u_531_538 = r_531_537,
    v_531_538 = s_531_537,
    neg_g_531_low60_0_low20_7 * (const 64 2) = neg_g_531_low60_0_low20_6 - neg_f_531_low60_0_low20_6,
    r_531_538 * (const 64 2) = r_531_537 - u_531_537,
    s_531_538 * (const 64 2) = s_531_537 - v_531_537
;

assume
    neg_f_531_low60_0_low20_7 = neg_g_531_low60_0_low20_6,
    u_531_538 = r_531_537,
    v_531_538 = s_531_537,
    neg_g_531_low60_0_low20_7 * 2 = neg_g_531_low60_0_low20_6 - neg_f_531_low60_0_low20_6,
    r_531_538 * 2 = r_531_537 - u_531_537,
    s_531_538 * 2 = s_531_537 - v_531_537
&&
    true
;

{
    u_531_538 * neg_f_531_low60_0_low20_0 + v_531_538 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_538 * neg_f_531_low60_0_low20_0 + s_531_538 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_7 + u_531_538 * (const 64 (2**21)) + v_531_538 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_7 + r_531_538 * (const 64 (2**21)) + s_531_538 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_7,
    neg_f_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_7,
    neg_g_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 538)) <=s delta, delta <=s (const 64 (1 + 2*538)),
    (const 64 (-(2**20))) <=s u_531_538, u_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_538, v_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_538, r_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_538, s_531_538 <=s (const 64 ((2**20))),
    u_531_538 + v_531_538 <=s (const 64 (2**20)),
    u_531_538 - v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 + v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 - v_531_538 <=s (const 64 (2**20)),
    r_531_538 + s_531_538 <=s (const 64 (2**20)),
    r_531_538 - s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 + s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 - s_531_538 <=s (const 64 (2**20)),
    u_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_531_538 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_538_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_7,
sint64 neg_g_531_low60_0_low20_7,
sint64 neg_f_531_low60_0_low20_8,
sint64 neg_g_531_low60_0_low20_8,
sint64 u_531_538,
sint64 v_531_538,
sint64 r_531_538,
sint64 s_531_538,
sint64 u_531_539,
sint64 v_531_539,
sint64 r_531_539,
sint64 s_531_539,
bit ne
)={
    u_531_538 * neg_f_531_low60_0_low20_0 + v_531_538 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_7 * (-(2**20)),
    r_531_538 * neg_f_531_low60_0_low20_0 + s_531_538 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_7 * (-(2**20))
&&
    u_531_538 * neg_f_531_low60_0_low20_0 + v_531_538 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_7 * (const 64 (-(2**20))),
    r_531_538 * neg_f_531_low60_0_low20_0 + s_531_538 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_7 + u_531_538 * (const 64 (2**21)) + v_531_538 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_7 + r_531_538 * (const 64 (2**21)) + s_531_538 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_7,
    neg_f_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_7,
    neg_g_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 538)) <=s delta, delta <=s (const 64 (1 + 2*538)),
    (const 64 (-(2**20))) <=s u_531_538, u_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_538, v_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_538, r_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_538, s_531_538 <=s (const 64 ((2**20))),
    u_531_538 + v_531_538 <=s (const 64 (2**20)),
    u_531_538 - v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 + v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 - v_531_538 <=s (const 64 (2**20)),
    r_531_538 + s_531_538 <=s (const 64 (2**20)),
    r_531_538 - s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 + s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 - s_531_538 <=s (const 64 (2**20)),
    u_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_531_538 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step538

// premise a
assume
neg_g_531_low60_0_low20_7 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_7 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_8 neg_f_531_low60_0_low20_7;
mov u_531_539 u_531_538;
mov v_531_539 v_531_538;

asr neg_g_531_low60_0_low20_8 neg_g_531_low60_0_low20_7 1;
asr r_531_539 r_531_538 1;
asr s_531_539 s_531_538 1;
assert
    true
&&
    neg_f_531_low60_0_low20_8 = neg_f_531_low60_0_low20_7,
    u_531_539 = u_531_538,
    v_531_539 = v_531_538,
    neg_g_531_low60_0_low20_8 * (const 64 2) = neg_g_531_low60_0_low20_7,
    r_531_539 * (const 64 2) = r_531_538,
    s_531_539 * (const 64 2) = s_531_538
;

assume
    neg_f_531_low60_0_low20_8 = neg_f_531_low60_0_low20_7,
    u_531_539 = u_531_538,
    v_531_539 = v_531_538,
    neg_g_531_low60_0_low20_8 * 2 = neg_g_531_low60_0_low20_7,
    r_531_539 * 2 = r_531_538,
    s_531_539 * 2 = s_531_538
&&
    true
;

{
    u_531_539 * neg_f_531_low60_0_low20_0 + v_531_539 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_539 * neg_f_531_low60_0_low20_0 + s_531_539 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_8 + u_531_539 * (const 64 (2**21)) + v_531_539 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_8 + r_531_539 * (const 64 (2**21)) + s_531_539 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_8,
    neg_f_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_8,
    neg_g_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 539)) <=s delta, delta <=s (const 64 (1 + 2*539)),
    (const 64 (-(2**20))) <=s u_531_539, u_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_539, v_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_539, r_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_539, s_531_539 <=s (const 64 ((2**20))),
    u_531_539 + v_531_539 <=s (const 64 (2**20)),
    u_531_539 - v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 + v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 - v_531_539 <=s (const 64 (2**20)),
    r_531_539 + s_531_539 <=s (const 64 (2**20)),
    r_531_539 - s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 + s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 - s_531_539 <=s (const 64 (2**20)),
    u_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_531_539 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_538_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_7,
sint64 neg_g_531_low60_0_low20_7,
sint64 neg_f_531_low60_0_low20_8,
sint64 neg_g_531_low60_0_low20_8,
sint64 u_531_538,
sint64 v_531_538,
sint64 r_531_538,
sint64 s_531_538,
sint64 u_531_539,
sint64 v_531_539,
sint64 r_531_539,
sint64 s_531_539,
bit ne
)={
    u_531_538 * neg_f_531_low60_0_low20_0 + v_531_538 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_7 * (-(2**20)),
    r_531_538 * neg_f_531_low60_0_low20_0 + s_531_538 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_7 * (-(2**20))
&&
    u_531_538 * neg_f_531_low60_0_low20_0 + v_531_538 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_7 * (const 64 (-(2**20))),
    r_531_538 * neg_f_531_low60_0_low20_0 + s_531_538 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_7 + u_531_538 * (const 64 (2**21)) + v_531_538 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_7 + r_531_538 * (const 64 (2**21)) + s_531_538 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_7,
    neg_f_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_7,
    neg_g_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 538)) <=s delta, delta <=s (const 64 (1 + 2*538)),
    (const 64 (-(2**20))) <=s u_531_538, u_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_538, v_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_538, r_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_538, s_531_538 <=s (const 64 ((2**20))),
    u_531_538 + v_531_538 <=s (const 64 (2**20)),
    u_531_538 - v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 + v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 - v_531_538 <=s (const 64 (2**20)),
    r_531_538 + s_531_538 <=s (const 64 (2**20)),
    r_531_538 - s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 + s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 - s_531_538 <=s (const 64 (2**20)),
    u_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_531_538 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step538

// premise b
assume
neg_g_531_low60_0_low20_7 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_8 neg_f_531_low60_0_low20_7;
mov u_531_539 u_531_538;
mov v_531_539 v_531_538;

add neg_g_531_low60_0_low20_8 neg_g_531_low60_0_low20_7 neg_f_531_low60_0_low20_7;
asr neg_g_531_low60_0_low20_8 neg_g_531_low60_0_low20_8 1;
add r_531_539 r_531_538 u_531_538;
asr r_531_539 r_531_539 1;
add s_531_539 s_531_538 v_531_538;
asr s_531_539 s_531_539 1;
assert
    true
&&
    neg_f_531_low60_0_low20_8 = neg_f_531_low60_0_low20_7,
    u_531_539 = u_531_538,
    v_531_539 = v_531_538,
    neg_g_531_low60_0_low20_8 * (const 64 2) = neg_g_531_low60_0_low20_7 + neg_f_531_low60_0_low20_7,
    r_531_539 * (const 64 2) = r_531_538 + u_531_538,
    s_531_539 * (const 64 2) = s_531_538 + v_531_538
;

assume
    neg_f_531_low60_0_low20_8 = neg_f_531_low60_0_low20_7,
    u_531_539 = u_531_538,
    v_531_539 = v_531_538,
    neg_g_531_low60_0_low20_8 * 2 = neg_g_531_low60_0_low20_7 + neg_f_531_low60_0_low20_7,
    r_531_539 * 2 = r_531_538 + u_531_538,
    s_531_539 * 2 = s_531_538 + v_531_538
&&
    true
;

{
    u_531_539 * neg_f_531_low60_0_low20_0 + v_531_539 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_539 * neg_f_531_low60_0_low20_0 + s_531_539 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_8 + u_531_539 * (const 64 (2**21)) + v_531_539 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_8 + r_531_539 * (const 64 (2**21)) + s_531_539 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_8,
    neg_f_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_8,
    neg_g_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 539)) <=s delta, delta <=s (const 64 (1 + 2*539)),
    (const 64 (-(2**20))) <=s u_531_539, u_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_539, v_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_539, r_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_539, s_531_539 <=s (const 64 ((2**20))),
    u_531_539 + v_531_539 <=s (const 64 (2**20)),
    u_531_539 - v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 + v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 - v_531_539 <=s (const 64 (2**20)),
    r_531_539 + s_531_539 <=s (const 64 (2**20)),
    r_531_539 - s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 + s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 - s_531_539 <=s (const 64 (2**20)),
    u_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_531_539 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_538_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_7,
sint64 neg_g_531_low60_0_low20_7,
sint64 neg_f_531_low60_0_low20_8,
sint64 neg_g_531_low60_0_low20_8,
sint64 u_531_538,
sint64 v_531_538,
sint64 r_531_538,
sint64 s_531_538,
sint64 u_531_539,
sint64 v_531_539,
sint64 r_531_539,
sint64 s_531_539,
bit ne
)={
    u_531_538 * neg_f_531_low60_0_low20_0 + v_531_538 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_7 * (-(2**20)),
    r_531_538 * neg_f_531_low60_0_low20_0 + s_531_538 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_7 * (-(2**20))
&&
    u_531_538 * neg_f_531_low60_0_low20_0 + v_531_538 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_7 * (const 64 (-(2**20))),
    r_531_538 * neg_f_531_low60_0_low20_0 + s_531_538 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_7 + u_531_538 * (const 64 (2**21)) + v_531_538 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_7 + r_531_538 * (const 64 (2**21)) + s_531_538 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_7,
    neg_f_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_7,
    neg_g_531_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 538)) <=s delta, delta <=s (const 64 (1 + 2*538)),
    (const 64 (-(2**20))) <=s u_531_538, u_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_538, v_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_538, r_531_538 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_538, s_531_538 <=s (const 64 ((2**20))),
    u_531_538 + v_531_538 <=s (const 64 (2**20)),
    u_531_538 - v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 + v_531_538 <=s (const 64 (2**20)),
    (const 64 0) - u_531_538 - v_531_538 <=s (const 64 (2**20)),
    r_531_538 + s_531_538 <=s (const 64 (2**20)),
    r_531_538 - s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 + s_531_538 <=s (const 64 (2**20)),
    (const 64 0) - r_531_538 - s_531_538 <=s (const 64 (2**20)),
    u_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_531_538 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_531_538 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step538

// premise c
assume
neg_g_531_low60_0_low20_7 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_8 neg_g_531_low60_0_low20_7;
mov u_531_539 r_531_538;
mov v_531_539 s_531_538;

subs dc neg_g_531_low60_0_low20_8 neg_g_531_low60_0_low20_7 neg_f_531_low60_0_low20_7;
asr neg_g_531_low60_0_low20_8 neg_g_531_low60_0_low20_8 1;
subs dc r_531_539 r_531_538 u_531_538;
asr r_531_539 r_531_539 1;
subs dc s_531_539 s_531_538 v_531_538;
asr s_531_539 s_531_539 1;
assert
    true
&&
    neg_f_531_low60_0_low20_8 = neg_g_531_low60_0_low20_7,
    u_531_539 = r_531_538,
    v_531_539 = s_531_538,
    neg_g_531_low60_0_low20_8 * (const 64 2) = neg_g_531_low60_0_low20_7 - neg_f_531_low60_0_low20_7,
    r_531_539 * (const 64 2) = r_531_538 - u_531_538,
    s_531_539 * (const 64 2) = s_531_538 - v_531_538
;

assume
    neg_f_531_low60_0_low20_8 = neg_g_531_low60_0_low20_7,
    u_531_539 = r_531_538,
    v_531_539 = s_531_538,
    neg_g_531_low60_0_low20_8 * 2 = neg_g_531_low60_0_low20_7 - neg_f_531_low60_0_low20_7,
    r_531_539 * 2 = r_531_538 - u_531_538,
    s_531_539 * 2 = s_531_538 - v_531_538
&&
    true
;

{
    u_531_539 * neg_f_531_low60_0_low20_0 + v_531_539 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_539 * neg_f_531_low60_0_low20_0 + s_531_539 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_8 + u_531_539 * (const 64 (2**21)) + v_531_539 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_8 + r_531_539 * (const 64 (2**21)) + s_531_539 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_8,
    neg_f_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_8,
    neg_g_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 539)) <=s delta, delta <=s (const 64 (1 + 2*539)),
    (const 64 (-(2**20))) <=s u_531_539, u_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_539, v_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_539, r_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_539, s_531_539 <=s (const 64 ((2**20))),
    u_531_539 + v_531_539 <=s (const 64 (2**20)),
    u_531_539 - v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 + v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 - v_531_539 <=s (const 64 (2**20)),
    r_531_539 + s_531_539 <=s (const 64 (2**20)),
    r_531_539 - s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 + s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 - s_531_539 <=s (const 64 (2**20)),
    u_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_531_539 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_539_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_8,
sint64 neg_g_531_low60_0_low20_8,
sint64 neg_f_531_low60_0_low20_9,
sint64 neg_g_531_low60_0_low20_9,
sint64 u_531_539,
sint64 v_531_539,
sint64 r_531_539,
sint64 s_531_539,
sint64 u_531_540,
sint64 v_531_540,
sint64 r_531_540,
sint64 s_531_540,
bit ne
)={
    u_531_539 * neg_f_531_low60_0_low20_0 + v_531_539 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_8 * (-(2**20)),
    r_531_539 * neg_f_531_low60_0_low20_0 + s_531_539 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_8 * (-(2**20))
&&
    u_531_539 * neg_f_531_low60_0_low20_0 + v_531_539 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_8 * (const 64 (-(2**20))),
    r_531_539 * neg_f_531_low60_0_low20_0 + s_531_539 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_8 + u_531_539 * (const 64 (2**21)) + v_531_539 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_8 + r_531_539 * (const 64 (2**21)) + s_531_539 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_8,
    neg_f_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_8,
    neg_g_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 539)) <=s delta, delta <=s (const 64 (1 + 2*539)),
    (const 64 (-(2**20))) <=s u_531_539, u_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_539, v_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_539, r_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_539, s_531_539 <=s (const 64 ((2**20))),
    u_531_539 + v_531_539 <=s (const 64 (2**20)),
    u_531_539 - v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 + v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 - v_531_539 <=s (const 64 (2**20)),
    r_531_539 + s_531_539 <=s (const 64 (2**20)),
    r_531_539 - s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 + s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 - s_531_539 <=s (const 64 (2**20)),
    u_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_531_539 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step539

// premise a
assume
neg_g_531_low60_0_low20_8 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_8 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_9 neg_f_531_low60_0_low20_8;
mov u_531_540 u_531_539;
mov v_531_540 v_531_539;

asr neg_g_531_low60_0_low20_9 neg_g_531_low60_0_low20_8 1;
asr r_531_540 r_531_539 1;
asr s_531_540 s_531_539 1;
assert
    true
&&
    neg_f_531_low60_0_low20_9 = neg_f_531_low60_0_low20_8,
    u_531_540 = u_531_539,
    v_531_540 = v_531_539,
    neg_g_531_low60_0_low20_9 * (const 64 2) = neg_g_531_low60_0_low20_8,
    r_531_540 * (const 64 2) = r_531_539,
    s_531_540 * (const 64 2) = s_531_539
;

assume
    neg_f_531_low60_0_low20_9 = neg_f_531_low60_0_low20_8,
    u_531_540 = u_531_539,
    v_531_540 = v_531_539,
    neg_g_531_low60_0_low20_9 * 2 = neg_g_531_low60_0_low20_8,
    r_531_540 * 2 = r_531_539,
    s_531_540 * 2 = s_531_539
&&
    true
;

{
    u_531_540 * neg_f_531_low60_0_low20_0 + v_531_540 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_540 * neg_f_531_low60_0_low20_0 + s_531_540 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_9 + u_531_540 * (const 64 (2**21)) + v_531_540 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_9 + r_531_540 * (const 64 (2**21)) + s_531_540 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_9,
    neg_f_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_9,
    neg_g_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 540)) <=s delta, delta <=s (const 64 (1 + 2*540)),
    (const 64 (-(2**20))) <=s u_531_540, u_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_540, v_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_540, r_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_540, s_531_540 <=s (const 64 ((2**20))),
    u_531_540 + v_531_540 <=s (const 64 (2**20)),
    u_531_540 - v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 + v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 - v_531_540 <=s (const 64 (2**20)),
    r_531_540 + s_531_540 <=s (const 64 (2**20)),
    r_531_540 - s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 + s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 - s_531_540 <=s (const 64 (2**20)),
    u_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_531_540 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_539_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_8,
sint64 neg_g_531_low60_0_low20_8,
sint64 neg_f_531_low60_0_low20_9,
sint64 neg_g_531_low60_0_low20_9,
sint64 u_531_539,
sint64 v_531_539,
sint64 r_531_539,
sint64 s_531_539,
sint64 u_531_540,
sint64 v_531_540,
sint64 r_531_540,
sint64 s_531_540,
bit ne
)={
    u_531_539 * neg_f_531_low60_0_low20_0 + v_531_539 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_8 * (-(2**20)),
    r_531_539 * neg_f_531_low60_0_low20_0 + s_531_539 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_8 * (-(2**20))
&&
    u_531_539 * neg_f_531_low60_0_low20_0 + v_531_539 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_8 * (const 64 (-(2**20))),
    r_531_539 * neg_f_531_low60_0_low20_0 + s_531_539 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_8 + u_531_539 * (const 64 (2**21)) + v_531_539 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_8 + r_531_539 * (const 64 (2**21)) + s_531_539 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_8,
    neg_f_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_8,
    neg_g_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 539)) <=s delta, delta <=s (const 64 (1 + 2*539)),
    (const 64 (-(2**20))) <=s u_531_539, u_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_539, v_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_539, r_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_539, s_531_539 <=s (const 64 ((2**20))),
    u_531_539 + v_531_539 <=s (const 64 (2**20)),
    u_531_539 - v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 + v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 - v_531_539 <=s (const 64 (2**20)),
    r_531_539 + s_531_539 <=s (const 64 (2**20)),
    r_531_539 - s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 + s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 - s_531_539 <=s (const 64 (2**20)),
    u_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_531_539 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step539

// premise b
assume
neg_g_531_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_9 neg_f_531_low60_0_low20_8;
mov u_531_540 u_531_539;
mov v_531_540 v_531_539;

add neg_g_531_low60_0_low20_9 neg_g_531_low60_0_low20_8 neg_f_531_low60_0_low20_8;
asr neg_g_531_low60_0_low20_9 neg_g_531_low60_0_low20_9 1;
add r_531_540 r_531_539 u_531_539;
asr r_531_540 r_531_540 1;
add s_531_540 s_531_539 v_531_539;
asr s_531_540 s_531_540 1;
assert
    true
&&
    neg_f_531_low60_0_low20_9 = neg_f_531_low60_0_low20_8,
    u_531_540 = u_531_539,
    v_531_540 = v_531_539,
    neg_g_531_low60_0_low20_9 * (const 64 2) = neg_g_531_low60_0_low20_8 + neg_f_531_low60_0_low20_8,
    r_531_540 * (const 64 2) = r_531_539 + u_531_539,
    s_531_540 * (const 64 2) = s_531_539 + v_531_539
;

assume
    neg_f_531_low60_0_low20_9 = neg_f_531_low60_0_low20_8,
    u_531_540 = u_531_539,
    v_531_540 = v_531_539,
    neg_g_531_low60_0_low20_9 * 2 = neg_g_531_low60_0_low20_8 + neg_f_531_low60_0_low20_8,
    r_531_540 * 2 = r_531_539 + u_531_539,
    s_531_540 * 2 = s_531_539 + v_531_539
&&
    true
;

{
    u_531_540 * neg_f_531_low60_0_low20_0 + v_531_540 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_540 * neg_f_531_low60_0_low20_0 + s_531_540 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_9 + u_531_540 * (const 64 (2**21)) + v_531_540 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_9 + r_531_540 * (const 64 (2**21)) + s_531_540 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_9,
    neg_f_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_9,
    neg_g_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 540)) <=s delta, delta <=s (const 64 (1 + 2*540)),
    (const 64 (-(2**20))) <=s u_531_540, u_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_540, v_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_540, r_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_540, s_531_540 <=s (const 64 ((2**20))),
    u_531_540 + v_531_540 <=s (const 64 (2**20)),
    u_531_540 - v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 + v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 - v_531_540 <=s (const 64 (2**20)),
    r_531_540 + s_531_540 <=s (const 64 (2**20)),
    r_531_540 - s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 + s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 - s_531_540 <=s (const 64 (2**20)),
    u_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_531_540 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_539_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_8,
sint64 neg_g_531_low60_0_low20_8,
sint64 neg_f_531_low60_0_low20_9,
sint64 neg_g_531_low60_0_low20_9,
sint64 u_531_539,
sint64 v_531_539,
sint64 r_531_539,
sint64 s_531_539,
sint64 u_531_540,
sint64 v_531_540,
sint64 r_531_540,
sint64 s_531_540,
bit ne
)={
    u_531_539 * neg_f_531_low60_0_low20_0 + v_531_539 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_8 * (-(2**20)),
    r_531_539 * neg_f_531_low60_0_low20_0 + s_531_539 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_8 * (-(2**20))
&&
    u_531_539 * neg_f_531_low60_0_low20_0 + v_531_539 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_8 * (const 64 (-(2**20))),
    r_531_539 * neg_f_531_low60_0_low20_0 + s_531_539 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_8 + u_531_539 * (const 64 (2**21)) + v_531_539 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_8 + r_531_539 * (const 64 (2**21)) + s_531_539 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_8,
    neg_f_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_8,
    neg_g_531_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 539)) <=s delta, delta <=s (const 64 (1 + 2*539)),
    (const 64 (-(2**20))) <=s u_531_539, u_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_539, v_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_539, r_531_539 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_539, s_531_539 <=s (const 64 ((2**20))),
    u_531_539 + v_531_539 <=s (const 64 (2**20)),
    u_531_539 - v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 + v_531_539 <=s (const 64 (2**20)),
    (const 64 0) - u_531_539 - v_531_539 <=s (const 64 (2**20)),
    r_531_539 + s_531_539 <=s (const 64 (2**20)),
    r_531_539 - s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 + s_531_539 <=s (const 64 (2**20)),
    (const 64 0) - r_531_539 - s_531_539 <=s (const 64 (2**20)),
    u_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_531_539 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_531_539 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step539

// premise c
assume
neg_g_531_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_9 neg_g_531_low60_0_low20_8;
mov u_531_540 r_531_539;
mov v_531_540 s_531_539;

subs dc neg_g_531_low60_0_low20_9 neg_g_531_low60_0_low20_8 neg_f_531_low60_0_low20_8;
asr neg_g_531_low60_0_low20_9 neg_g_531_low60_0_low20_9 1;
subs dc r_531_540 r_531_539 u_531_539;
asr r_531_540 r_531_540 1;
subs dc s_531_540 s_531_539 v_531_539;
asr s_531_540 s_531_540 1;
assert
    true
&&
    neg_f_531_low60_0_low20_9 = neg_g_531_low60_0_low20_8,
    u_531_540 = r_531_539,
    v_531_540 = s_531_539,
    neg_g_531_low60_0_low20_9 * (const 64 2) = neg_g_531_low60_0_low20_8 - neg_f_531_low60_0_low20_8,
    r_531_540 * (const 64 2) = r_531_539 - u_531_539,
    s_531_540 * (const 64 2) = s_531_539 - v_531_539
;

assume
    neg_f_531_low60_0_low20_9 = neg_g_531_low60_0_low20_8,
    u_531_540 = r_531_539,
    v_531_540 = s_531_539,
    neg_g_531_low60_0_low20_9 * 2 = neg_g_531_low60_0_low20_8 - neg_f_531_low60_0_low20_8,
    r_531_540 * 2 = r_531_539 - u_531_539,
    s_531_540 * 2 = s_531_539 - v_531_539
&&
    true
;

{
    u_531_540 * neg_f_531_low60_0_low20_0 + v_531_540 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_540 * neg_f_531_low60_0_low20_0 + s_531_540 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_9 + u_531_540 * (const 64 (2**21)) + v_531_540 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_9 + r_531_540 * (const 64 (2**21)) + s_531_540 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_9,
    neg_f_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_9,
    neg_g_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 540)) <=s delta, delta <=s (const 64 (1 + 2*540)),
    (const 64 (-(2**20))) <=s u_531_540, u_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_540, v_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_540, r_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_540, s_531_540 <=s (const 64 ((2**20))),
    u_531_540 + v_531_540 <=s (const 64 (2**20)),
    u_531_540 - v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 + v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 - v_531_540 <=s (const 64 (2**20)),
    r_531_540 + s_531_540 <=s (const 64 (2**20)),
    r_531_540 - s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 + s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 - s_531_540 <=s (const 64 (2**20)),
    u_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_531_540 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_540_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_9,
sint64 neg_g_531_low60_0_low20_9,
sint64 neg_f_531_low60_0_low20_10,
sint64 neg_g_531_low60_0_low20_10,
sint64 u_531_540,
sint64 v_531_540,
sint64 r_531_540,
sint64 s_531_540,
sint64 u_531_541,
sint64 v_531_541,
sint64 r_531_541,
sint64 s_531_541,
bit ne
)={
    u_531_540 * neg_f_531_low60_0_low20_0 + v_531_540 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_9 * (-(2**20)),
    r_531_540 * neg_f_531_low60_0_low20_0 + s_531_540 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_9 * (-(2**20))
&&
    u_531_540 * neg_f_531_low60_0_low20_0 + v_531_540 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_9 * (const 64 (-(2**20))),
    r_531_540 * neg_f_531_low60_0_low20_0 + s_531_540 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_9 + u_531_540 * (const 64 (2**21)) + v_531_540 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_9 + r_531_540 * (const 64 (2**21)) + s_531_540 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_9,
    neg_f_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_9,
    neg_g_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 540)) <=s delta, delta <=s (const 64 (1 + 2*540)),
    (const 64 (-(2**20))) <=s u_531_540, u_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_540, v_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_540, r_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_540, s_531_540 <=s (const 64 ((2**20))),
    u_531_540 + v_531_540 <=s (const 64 (2**20)),
    u_531_540 - v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 + v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 - v_531_540 <=s (const 64 (2**20)),
    r_531_540 + s_531_540 <=s (const 64 (2**20)),
    r_531_540 - s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 + s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 - s_531_540 <=s (const 64 (2**20)),
    u_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_531_540 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step540

// premise a
assume
neg_g_531_low60_0_low20_9 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_9 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_10 neg_f_531_low60_0_low20_9;
mov u_531_541 u_531_540;
mov v_531_541 v_531_540;

asr neg_g_531_low60_0_low20_10 neg_g_531_low60_0_low20_9 1;
asr r_531_541 r_531_540 1;
asr s_531_541 s_531_540 1;
assert
    true
&&
    neg_f_531_low60_0_low20_10 = neg_f_531_low60_0_low20_9,
    u_531_541 = u_531_540,
    v_531_541 = v_531_540,
    neg_g_531_low60_0_low20_10 * (const 64 2) = neg_g_531_low60_0_low20_9,
    r_531_541 * (const 64 2) = r_531_540,
    s_531_541 * (const 64 2) = s_531_540
;

assume
    neg_f_531_low60_0_low20_10 = neg_f_531_low60_0_low20_9,
    u_531_541 = u_531_540,
    v_531_541 = v_531_540,
    neg_g_531_low60_0_low20_10 * 2 = neg_g_531_low60_0_low20_9,
    r_531_541 * 2 = r_531_540,
    s_531_541 * 2 = s_531_540
&&
    true
;

{
    u_531_541 * neg_f_531_low60_0_low20_0 + v_531_541 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_541 * neg_f_531_low60_0_low20_0 + s_531_541 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_10 + u_531_541 * (const 64 (2**21)) + v_531_541 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_10 + r_531_541 * (const 64 (2**21)) + s_531_541 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_10,
    neg_f_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_10,
    neg_g_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 541)) <=s delta, delta <=s (const 64 (1 + 2*541)),
    (const 64 (-(2**20))) <=s u_531_541, u_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_541, v_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_541, r_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_541, s_531_541 <=s (const 64 ((2**20))),
    u_531_541 + v_531_541 <=s (const 64 (2**20)),
    u_531_541 - v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 + v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 - v_531_541 <=s (const 64 (2**20)),
    r_531_541 + s_531_541 <=s (const 64 (2**20)),
    r_531_541 - s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 + s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 - s_531_541 <=s (const 64 (2**20)),
    u_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_531_541 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_540_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_9,
sint64 neg_g_531_low60_0_low20_9,
sint64 neg_f_531_low60_0_low20_10,
sint64 neg_g_531_low60_0_low20_10,
sint64 u_531_540,
sint64 v_531_540,
sint64 r_531_540,
sint64 s_531_540,
sint64 u_531_541,
sint64 v_531_541,
sint64 r_531_541,
sint64 s_531_541,
bit ne
)={
    u_531_540 * neg_f_531_low60_0_low20_0 + v_531_540 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_9 * (-(2**20)),
    r_531_540 * neg_f_531_low60_0_low20_0 + s_531_540 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_9 * (-(2**20))
&&
    u_531_540 * neg_f_531_low60_0_low20_0 + v_531_540 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_9 * (const 64 (-(2**20))),
    r_531_540 * neg_f_531_low60_0_low20_0 + s_531_540 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_9 + u_531_540 * (const 64 (2**21)) + v_531_540 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_9 + r_531_540 * (const 64 (2**21)) + s_531_540 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_9,
    neg_f_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_9,
    neg_g_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 540)) <=s delta, delta <=s (const 64 (1 + 2*540)),
    (const 64 (-(2**20))) <=s u_531_540, u_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_540, v_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_540, r_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_540, s_531_540 <=s (const 64 ((2**20))),
    u_531_540 + v_531_540 <=s (const 64 (2**20)),
    u_531_540 - v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 + v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 - v_531_540 <=s (const 64 (2**20)),
    r_531_540 + s_531_540 <=s (const 64 (2**20)),
    r_531_540 - s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 + s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 - s_531_540 <=s (const 64 (2**20)),
    u_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_531_540 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step540

// premise b
assume
neg_g_531_low60_0_low20_9 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_10 neg_f_531_low60_0_low20_9;
mov u_531_541 u_531_540;
mov v_531_541 v_531_540;

add neg_g_531_low60_0_low20_10 neg_g_531_low60_0_low20_9 neg_f_531_low60_0_low20_9;
asr neg_g_531_low60_0_low20_10 neg_g_531_low60_0_low20_10 1;
add r_531_541 r_531_540 u_531_540;
asr r_531_541 r_531_541 1;
add s_531_541 s_531_540 v_531_540;
asr s_531_541 s_531_541 1;
assert
    true
&&
    neg_f_531_low60_0_low20_10 = neg_f_531_low60_0_low20_9,
    u_531_541 = u_531_540,
    v_531_541 = v_531_540,
    neg_g_531_low60_0_low20_10 * (const 64 2) = neg_g_531_low60_0_low20_9 + neg_f_531_low60_0_low20_9,
    r_531_541 * (const 64 2) = r_531_540 + u_531_540,
    s_531_541 * (const 64 2) = s_531_540 + v_531_540
;

assume
    neg_f_531_low60_0_low20_10 = neg_f_531_low60_0_low20_9,
    u_531_541 = u_531_540,
    v_531_541 = v_531_540,
    neg_g_531_low60_0_low20_10 * 2 = neg_g_531_low60_0_low20_9 + neg_f_531_low60_0_low20_9,
    r_531_541 * 2 = r_531_540 + u_531_540,
    s_531_541 * 2 = s_531_540 + v_531_540
&&
    true
;

{
    u_531_541 * neg_f_531_low60_0_low20_0 + v_531_541 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_541 * neg_f_531_low60_0_low20_0 + s_531_541 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_10 + u_531_541 * (const 64 (2**21)) + v_531_541 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_10 + r_531_541 * (const 64 (2**21)) + s_531_541 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_10,
    neg_f_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_10,
    neg_g_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 541)) <=s delta, delta <=s (const 64 (1 + 2*541)),
    (const 64 (-(2**20))) <=s u_531_541, u_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_541, v_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_541, r_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_541, s_531_541 <=s (const 64 ((2**20))),
    u_531_541 + v_531_541 <=s (const 64 (2**20)),
    u_531_541 - v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 + v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 - v_531_541 <=s (const 64 (2**20)),
    r_531_541 + s_531_541 <=s (const 64 (2**20)),
    r_531_541 - s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 + s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 - s_531_541 <=s (const 64 (2**20)),
    u_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_531_541 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_540_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_9,
sint64 neg_g_531_low60_0_low20_9,
sint64 neg_f_531_low60_0_low20_10,
sint64 neg_g_531_low60_0_low20_10,
sint64 u_531_540,
sint64 v_531_540,
sint64 r_531_540,
sint64 s_531_540,
sint64 u_531_541,
sint64 v_531_541,
sint64 r_531_541,
sint64 s_531_541,
bit ne
)={
    u_531_540 * neg_f_531_low60_0_low20_0 + v_531_540 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_9 * (-(2**20)),
    r_531_540 * neg_f_531_low60_0_low20_0 + s_531_540 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_9 * (-(2**20))
&&
    u_531_540 * neg_f_531_low60_0_low20_0 + v_531_540 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_9 * (const 64 (-(2**20))),
    r_531_540 * neg_f_531_low60_0_low20_0 + s_531_540 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_9 + u_531_540 * (const 64 (2**21)) + v_531_540 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_9 + r_531_540 * (const 64 (2**21)) + s_531_540 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_9,
    neg_f_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_9,
    neg_g_531_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 540)) <=s delta, delta <=s (const 64 (1 + 2*540)),
    (const 64 (-(2**20))) <=s u_531_540, u_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_540, v_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_540, r_531_540 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_540, s_531_540 <=s (const 64 ((2**20))),
    u_531_540 + v_531_540 <=s (const 64 (2**20)),
    u_531_540 - v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 + v_531_540 <=s (const 64 (2**20)),
    (const 64 0) - u_531_540 - v_531_540 <=s (const 64 (2**20)),
    r_531_540 + s_531_540 <=s (const 64 (2**20)),
    r_531_540 - s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 + s_531_540 <=s (const 64 (2**20)),
    (const 64 0) - r_531_540 - s_531_540 <=s (const 64 (2**20)),
    u_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_531_540 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_531_540 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step540

// premise c
assume
neg_g_531_low60_0_low20_9 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_10 neg_g_531_low60_0_low20_9;
mov u_531_541 r_531_540;
mov v_531_541 s_531_540;

subs dc neg_g_531_low60_0_low20_10 neg_g_531_low60_0_low20_9 neg_f_531_low60_0_low20_9;
asr neg_g_531_low60_0_low20_10 neg_g_531_low60_0_low20_10 1;
subs dc r_531_541 r_531_540 u_531_540;
asr r_531_541 r_531_541 1;
subs dc s_531_541 s_531_540 v_531_540;
asr s_531_541 s_531_541 1;
assert
    true
&&
    neg_f_531_low60_0_low20_10 = neg_g_531_low60_0_low20_9,
    u_531_541 = r_531_540,
    v_531_541 = s_531_540,
    neg_g_531_low60_0_low20_10 * (const 64 2) = neg_g_531_low60_0_low20_9 - neg_f_531_low60_0_low20_9,
    r_531_541 * (const 64 2) = r_531_540 - u_531_540,
    s_531_541 * (const 64 2) = s_531_540 - v_531_540
;

assume
    neg_f_531_low60_0_low20_10 = neg_g_531_low60_0_low20_9,
    u_531_541 = r_531_540,
    v_531_541 = s_531_540,
    neg_g_531_low60_0_low20_10 * 2 = neg_g_531_low60_0_low20_9 - neg_f_531_low60_0_low20_9,
    r_531_541 * 2 = r_531_540 - u_531_540,
    s_531_541 * 2 = s_531_540 - v_531_540
&&
    true
;

{
    u_531_541 * neg_f_531_low60_0_low20_0 + v_531_541 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_541 * neg_f_531_low60_0_low20_0 + s_531_541 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_10 + u_531_541 * (const 64 (2**21)) + v_531_541 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_10 + r_531_541 * (const 64 (2**21)) + s_531_541 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_10,
    neg_f_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_10,
    neg_g_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 541)) <=s delta, delta <=s (const 64 (1 + 2*541)),
    (const 64 (-(2**20))) <=s u_531_541, u_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_541, v_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_541, r_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_541, s_531_541 <=s (const 64 ((2**20))),
    u_531_541 + v_531_541 <=s (const 64 (2**20)),
    u_531_541 - v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 + v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 - v_531_541 <=s (const 64 (2**20)),
    r_531_541 + s_531_541 <=s (const 64 (2**20)),
    r_531_541 - s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 + s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 - s_531_541 <=s (const 64 (2**20)),
    u_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_531_541 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_541_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_10,
sint64 neg_g_531_low60_0_low20_10,
sint64 neg_f_531_low60_0_low20_11,
sint64 neg_g_531_low60_0_low20_11,
sint64 u_531_541,
sint64 v_531_541,
sint64 r_531_541,
sint64 s_531_541,
sint64 u_531_542,
sint64 v_531_542,
sint64 r_531_542,
sint64 s_531_542,
bit ne
)={
    u_531_541 * neg_f_531_low60_0_low20_0 + v_531_541 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_10 * (-(2**20)),
    r_531_541 * neg_f_531_low60_0_low20_0 + s_531_541 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_10 * (-(2**20))
&&
    u_531_541 * neg_f_531_low60_0_low20_0 + v_531_541 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_10 * (const 64 (-(2**20))),
    r_531_541 * neg_f_531_low60_0_low20_0 + s_531_541 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_10 + u_531_541 * (const 64 (2**21)) + v_531_541 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_10 + r_531_541 * (const 64 (2**21)) + s_531_541 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_10,
    neg_f_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_10,
    neg_g_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 541)) <=s delta, delta <=s (const 64 (1 + 2*541)),
    (const 64 (-(2**20))) <=s u_531_541, u_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_541, v_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_541, r_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_541, s_531_541 <=s (const 64 ((2**20))),
    u_531_541 + v_531_541 <=s (const 64 (2**20)),
    u_531_541 - v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 + v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 - v_531_541 <=s (const 64 (2**20)),
    r_531_541 + s_531_541 <=s (const 64 (2**20)),
    r_531_541 - s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 + s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 - s_531_541 <=s (const 64 (2**20)),
    u_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_531_541 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step541

// premise a
assume
neg_g_531_low60_0_low20_10 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_10 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_11 neg_f_531_low60_0_low20_10;
mov u_531_542 u_531_541;
mov v_531_542 v_531_541;

asr neg_g_531_low60_0_low20_11 neg_g_531_low60_0_low20_10 1;
asr r_531_542 r_531_541 1;
asr s_531_542 s_531_541 1;
assert
    true
&&
    neg_f_531_low60_0_low20_11 = neg_f_531_low60_0_low20_10,
    u_531_542 = u_531_541,
    v_531_542 = v_531_541,
    neg_g_531_low60_0_low20_11 * (const 64 2) = neg_g_531_low60_0_low20_10,
    r_531_542 * (const 64 2) = r_531_541,
    s_531_542 * (const 64 2) = s_531_541
;

assume
    neg_f_531_low60_0_low20_11 = neg_f_531_low60_0_low20_10,
    u_531_542 = u_531_541,
    v_531_542 = v_531_541,
    neg_g_531_low60_0_low20_11 * 2 = neg_g_531_low60_0_low20_10,
    r_531_542 * 2 = r_531_541,
    s_531_542 * 2 = s_531_541
&&
    true
;

{
    u_531_542 * neg_f_531_low60_0_low20_0 + v_531_542 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_542 * neg_f_531_low60_0_low20_0 + s_531_542 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_11 + u_531_542 * (const 64 (2**21)) + v_531_542 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_11 + r_531_542 * (const 64 (2**21)) + s_531_542 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_11,
    neg_f_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_11,
    neg_g_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 542)) <=s delta, delta <=s (const 64 (1 + 2*542)),
    (const 64 (-(2**20))) <=s u_531_542, u_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_542, v_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_542, r_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_542, s_531_542 <=s (const 64 ((2**20))),
    u_531_542 + v_531_542 <=s (const 64 (2**20)),
    u_531_542 - v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 + v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 - v_531_542 <=s (const 64 (2**20)),
    r_531_542 + s_531_542 <=s (const 64 (2**20)),
    r_531_542 - s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 + s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 - s_531_542 <=s (const 64 (2**20)),
    u_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_531_542 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_541_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_10,
sint64 neg_g_531_low60_0_low20_10,
sint64 neg_f_531_low60_0_low20_11,
sint64 neg_g_531_low60_0_low20_11,
sint64 u_531_541,
sint64 v_531_541,
sint64 r_531_541,
sint64 s_531_541,
sint64 u_531_542,
sint64 v_531_542,
sint64 r_531_542,
sint64 s_531_542,
bit ne
)={
    u_531_541 * neg_f_531_low60_0_low20_0 + v_531_541 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_10 * (-(2**20)),
    r_531_541 * neg_f_531_low60_0_low20_0 + s_531_541 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_10 * (-(2**20))
&&
    u_531_541 * neg_f_531_low60_0_low20_0 + v_531_541 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_10 * (const 64 (-(2**20))),
    r_531_541 * neg_f_531_low60_0_low20_0 + s_531_541 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_10 + u_531_541 * (const 64 (2**21)) + v_531_541 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_10 + r_531_541 * (const 64 (2**21)) + s_531_541 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_10,
    neg_f_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_10,
    neg_g_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 541)) <=s delta, delta <=s (const 64 (1 + 2*541)),
    (const 64 (-(2**20))) <=s u_531_541, u_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_541, v_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_541, r_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_541, s_531_541 <=s (const 64 ((2**20))),
    u_531_541 + v_531_541 <=s (const 64 (2**20)),
    u_531_541 - v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 + v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 - v_531_541 <=s (const 64 (2**20)),
    r_531_541 + s_531_541 <=s (const 64 (2**20)),
    r_531_541 - s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 + s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 - s_531_541 <=s (const 64 (2**20)),
    u_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_531_541 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step541

// premise b
assume
neg_g_531_low60_0_low20_10 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_11 neg_f_531_low60_0_low20_10;
mov u_531_542 u_531_541;
mov v_531_542 v_531_541;

add neg_g_531_low60_0_low20_11 neg_g_531_low60_0_low20_10 neg_f_531_low60_0_low20_10;
asr neg_g_531_low60_0_low20_11 neg_g_531_low60_0_low20_11 1;
add r_531_542 r_531_541 u_531_541;
asr r_531_542 r_531_542 1;
add s_531_542 s_531_541 v_531_541;
asr s_531_542 s_531_542 1;
assert
    true
&&
    neg_f_531_low60_0_low20_11 = neg_f_531_low60_0_low20_10,
    u_531_542 = u_531_541,
    v_531_542 = v_531_541,
    neg_g_531_low60_0_low20_11 * (const 64 2) = neg_g_531_low60_0_low20_10 + neg_f_531_low60_0_low20_10,
    r_531_542 * (const 64 2) = r_531_541 + u_531_541,
    s_531_542 * (const 64 2) = s_531_541 + v_531_541
;

assume
    neg_f_531_low60_0_low20_11 = neg_f_531_low60_0_low20_10,
    u_531_542 = u_531_541,
    v_531_542 = v_531_541,
    neg_g_531_low60_0_low20_11 * 2 = neg_g_531_low60_0_low20_10 + neg_f_531_low60_0_low20_10,
    r_531_542 * 2 = r_531_541 + u_531_541,
    s_531_542 * 2 = s_531_541 + v_531_541
&&
    true
;

{
    u_531_542 * neg_f_531_low60_0_low20_0 + v_531_542 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_542 * neg_f_531_low60_0_low20_0 + s_531_542 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_11 + u_531_542 * (const 64 (2**21)) + v_531_542 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_11 + r_531_542 * (const 64 (2**21)) + s_531_542 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_11,
    neg_f_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_11,
    neg_g_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 542)) <=s delta, delta <=s (const 64 (1 + 2*542)),
    (const 64 (-(2**20))) <=s u_531_542, u_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_542, v_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_542, r_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_542, s_531_542 <=s (const 64 ((2**20))),
    u_531_542 + v_531_542 <=s (const 64 (2**20)),
    u_531_542 - v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 + v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 - v_531_542 <=s (const 64 (2**20)),
    r_531_542 + s_531_542 <=s (const 64 (2**20)),
    r_531_542 - s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 + s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 - s_531_542 <=s (const 64 (2**20)),
    u_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_531_542 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_541_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_10,
sint64 neg_g_531_low60_0_low20_10,
sint64 neg_f_531_low60_0_low20_11,
sint64 neg_g_531_low60_0_low20_11,
sint64 u_531_541,
sint64 v_531_541,
sint64 r_531_541,
sint64 s_531_541,
sint64 u_531_542,
sint64 v_531_542,
sint64 r_531_542,
sint64 s_531_542,
bit ne
)={
    u_531_541 * neg_f_531_low60_0_low20_0 + v_531_541 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_10 * (-(2**20)),
    r_531_541 * neg_f_531_low60_0_low20_0 + s_531_541 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_10 * (-(2**20))
&&
    u_531_541 * neg_f_531_low60_0_low20_0 + v_531_541 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_10 * (const 64 (-(2**20))),
    r_531_541 * neg_f_531_low60_0_low20_0 + s_531_541 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_10 + u_531_541 * (const 64 (2**21)) + v_531_541 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_10 + r_531_541 * (const 64 (2**21)) + s_531_541 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_10,
    neg_f_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_10,
    neg_g_531_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 541)) <=s delta, delta <=s (const 64 (1 + 2*541)),
    (const 64 (-(2**20))) <=s u_531_541, u_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_541, v_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_541, r_531_541 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_541, s_531_541 <=s (const 64 ((2**20))),
    u_531_541 + v_531_541 <=s (const 64 (2**20)),
    u_531_541 - v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 + v_531_541 <=s (const 64 (2**20)),
    (const 64 0) - u_531_541 - v_531_541 <=s (const 64 (2**20)),
    r_531_541 + s_531_541 <=s (const 64 (2**20)),
    r_531_541 - s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 + s_531_541 <=s (const 64 (2**20)),
    (const 64 0) - r_531_541 - s_531_541 <=s (const 64 (2**20)),
    u_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_531_541 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_531_541 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step541

// premise c
assume
neg_g_531_low60_0_low20_10 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_11 neg_g_531_low60_0_low20_10;
mov u_531_542 r_531_541;
mov v_531_542 s_531_541;

subs dc neg_g_531_low60_0_low20_11 neg_g_531_low60_0_low20_10 neg_f_531_low60_0_low20_10;
asr neg_g_531_low60_0_low20_11 neg_g_531_low60_0_low20_11 1;
subs dc r_531_542 r_531_541 u_531_541;
asr r_531_542 r_531_542 1;
subs dc s_531_542 s_531_541 v_531_541;
asr s_531_542 s_531_542 1;
assert
    true
&&
    neg_f_531_low60_0_low20_11 = neg_g_531_low60_0_low20_10,
    u_531_542 = r_531_541,
    v_531_542 = s_531_541,
    neg_g_531_low60_0_low20_11 * (const 64 2) = neg_g_531_low60_0_low20_10 - neg_f_531_low60_0_low20_10,
    r_531_542 * (const 64 2) = r_531_541 - u_531_541,
    s_531_542 * (const 64 2) = s_531_541 - v_531_541
;

assume
    neg_f_531_low60_0_low20_11 = neg_g_531_low60_0_low20_10,
    u_531_542 = r_531_541,
    v_531_542 = s_531_541,
    neg_g_531_low60_0_low20_11 * 2 = neg_g_531_low60_0_low20_10 - neg_f_531_low60_0_low20_10,
    r_531_542 * 2 = r_531_541 - u_531_541,
    s_531_542 * 2 = s_531_541 - v_531_541
&&
    true
;

{
    u_531_542 * neg_f_531_low60_0_low20_0 + v_531_542 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_542 * neg_f_531_low60_0_low20_0 + s_531_542 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_11 + u_531_542 * (const 64 (2**21)) + v_531_542 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_11 + r_531_542 * (const 64 (2**21)) + s_531_542 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_11,
    neg_f_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_11,
    neg_g_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 542)) <=s delta, delta <=s (const 64 (1 + 2*542)),
    (const 64 (-(2**20))) <=s u_531_542, u_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_542, v_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_542, r_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_542, s_531_542 <=s (const 64 ((2**20))),
    u_531_542 + v_531_542 <=s (const 64 (2**20)),
    u_531_542 - v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 + v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 - v_531_542 <=s (const 64 (2**20)),
    r_531_542 + s_531_542 <=s (const 64 (2**20)),
    r_531_542 - s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 + s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 - s_531_542 <=s (const 64 (2**20)),
    u_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_531_542 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_542_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_11,
sint64 neg_g_531_low60_0_low20_11,
sint64 neg_f_531_low60_0_low20_12,
sint64 neg_g_531_low60_0_low20_12,
sint64 u_531_542,
sint64 v_531_542,
sint64 r_531_542,
sint64 s_531_542,
sint64 u_531_543,
sint64 v_531_543,
sint64 r_531_543,
sint64 s_531_543,
bit ne
)={
    u_531_542 * neg_f_531_low60_0_low20_0 + v_531_542 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_11 * (-(2**20)),
    r_531_542 * neg_f_531_low60_0_low20_0 + s_531_542 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_11 * (-(2**20))
&&
    u_531_542 * neg_f_531_low60_0_low20_0 + v_531_542 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_11 * (const 64 (-(2**20))),
    r_531_542 * neg_f_531_low60_0_low20_0 + s_531_542 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_11 + u_531_542 * (const 64 (2**21)) + v_531_542 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_11 + r_531_542 * (const 64 (2**21)) + s_531_542 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_11,
    neg_f_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_11,
    neg_g_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 542)) <=s delta, delta <=s (const 64 (1 + 2*542)),
    (const 64 (-(2**20))) <=s u_531_542, u_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_542, v_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_542, r_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_542, s_531_542 <=s (const 64 ((2**20))),
    u_531_542 + v_531_542 <=s (const 64 (2**20)),
    u_531_542 - v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 + v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 - v_531_542 <=s (const 64 (2**20)),
    r_531_542 + s_531_542 <=s (const 64 (2**20)),
    r_531_542 - s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 + s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 - s_531_542 <=s (const 64 (2**20)),
    u_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_531_542 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step542

// premise a
assume
neg_g_531_low60_0_low20_11 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_11 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_12 neg_f_531_low60_0_low20_11;
mov u_531_543 u_531_542;
mov v_531_543 v_531_542;

asr neg_g_531_low60_0_low20_12 neg_g_531_low60_0_low20_11 1;
asr r_531_543 r_531_542 1;
asr s_531_543 s_531_542 1;
assert
    true
&&
    neg_f_531_low60_0_low20_12 = neg_f_531_low60_0_low20_11,
    u_531_543 = u_531_542,
    v_531_543 = v_531_542,
    neg_g_531_low60_0_low20_12 * (const 64 2) = neg_g_531_low60_0_low20_11,
    r_531_543 * (const 64 2) = r_531_542,
    s_531_543 * (const 64 2) = s_531_542
;

assume
    neg_f_531_low60_0_low20_12 = neg_f_531_low60_0_low20_11,
    u_531_543 = u_531_542,
    v_531_543 = v_531_542,
    neg_g_531_low60_0_low20_12 * 2 = neg_g_531_low60_0_low20_11,
    r_531_543 * 2 = r_531_542,
    s_531_543 * 2 = s_531_542
&&
    true
;

{
    u_531_543 * neg_f_531_low60_0_low20_0 + v_531_543 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_543 * neg_f_531_low60_0_low20_0 + s_531_543 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_12 + u_531_543 * (const 64 (2**21)) + v_531_543 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_12 + r_531_543 * (const 64 (2**21)) + s_531_543 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_12,
    neg_f_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_12,
    neg_g_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 543)) <=s delta, delta <=s (const 64 (1 + 2*543)),
    (const 64 (-(2**20))) <=s u_531_543, u_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_543, v_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_543, r_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_543, s_531_543 <=s (const 64 ((2**20))),
    u_531_543 + v_531_543 <=s (const 64 (2**20)),
    u_531_543 - v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 + v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 - v_531_543 <=s (const 64 (2**20)),
    r_531_543 + s_531_543 <=s (const 64 (2**20)),
    r_531_543 - s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 + s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 - s_531_543 <=s (const 64 (2**20)),
    u_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_531_543 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_542_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_11,
sint64 neg_g_531_low60_0_low20_11,
sint64 neg_f_531_low60_0_low20_12,
sint64 neg_g_531_low60_0_low20_12,
sint64 u_531_542,
sint64 v_531_542,
sint64 r_531_542,
sint64 s_531_542,
sint64 u_531_543,
sint64 v_531_543,
sint64 r_531_543,
sint64 s_531_543,
bit ne
)={
    u_531_542 * neg_f_531_low60_0_low20_0 + v_531_542 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_11 * (-(2**20)),
    r_531_542 * neg_f_531_low60_0_low20_0 + s_531_542 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_11 * (-(2**20))
&&
    u_531_542 * neg_f_531_low60_0_low20_0 + v_531_542 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_11 * (const 64 (-(2**20))),
    r_531_542 * neg_f_531_low60_0_low20_0 + s_531_542 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_11 + u_531_542 * (const 64 (2**21)) + v_531_542 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_11 + r_531_542 * (const 64 (2**21)) + s_531_542 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_11,
    neg_f_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_11,
    neg_g_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 542)) <=s delta, delta <=s (const 64 (1 + 2*542)),
    (const 64 (-(2**20))) <=s u_531_542, u_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_542, v_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_542, r_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_542, s_531_542 <=s (const 64 ((2**20))),
    u_531_542 + v_531_542 <=s (const 64 (2**20)),
    u_531_542 - v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 + v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 - v_531_542 <=s (const 64 (2**20)),
    r_531_542 + s_531_542 <=s (const 64 (2**20)),
    r_531_542 - s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 + s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 - s_531_542 <=s (const 64 (2**20)),
    u_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_531_542 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step542

// premise b
assume
neg_g_531_low60_0_low20_11 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_12 neg_f_531_low60_0_low20_11;
mov u_531_543 u_531_542;
mov v_531_543 v_531_542;

add neg_g_531_low60_0_low20_12 neg_g_531_low60_0_low20_11 neg_f_531_low60_0_low20_11;
asr neg_g_531_low60_0_low20_12 neg_g_531_low60_0_low20_12 1;
add r_531_543 r_531_542 u_531_542;
asr r_531_543 r_531_543 1;
add s_531_543 s_531_542 v_531_542;
asr s_531_543 s_531_543 1;
assert
    true
&&
    neg_f_531_low60_0_low20_12 = neg_f_531_low60_0_low20_11,
    u_531_543 = u_531_542,
    v_531_543 = v_531_542,
    neg_g_531_low60_0_low20_12 * (const 64 2) = neg_g_531_low60_0_low20_11 + neg_f_531_low60_0_low20_11,
    r_531_543 * (const 64 2) = r_531_542 + u_531_542,
    s_531_543 * (const 64 2) = s_531_542 + v_531_542
;

assume
    neg_f_531_low60_0_low20_12 = neg_f_531_low60_0_low20_11,
    u_531_543 = u_531_542,
    v_531_543 = v_531_542,
    neg_g_531_low60_0_low20_12 * 2 = neg_g_531_low60_0_low20_11 + neg_f_531_low60_0_low20_11,
    r_531_543 * 2 = r_531_542 + u_531_542,
    s_531_543 * 2 = s_531_542 + v_531_542
&&
    true
;

{
    u_531_543 * neg_f_531_low60_0_low20_0 + v_531_543 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_543 * neg_f_531_low60_0_low20_0 + s_531_543 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_12 + u_531_543 * (const 64 (2**21)) + v_531_543 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_12 + r_531_543 * (const 64 (2**21)) + s_531_543 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_12,
    neg_f_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_12,
    neg_g_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 543)) <=s delta, delta <=s (const 64 (1 + 2*543)),
    (const 64 (-(2**20))) <=s u_531_543, u_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_543, v_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_543, r_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_543, s_531_543 <=s (const 64 ((2**20))),
    u_531_543 + v_531_543 <=s (const 64 (2**20)),
    u_531_543 - v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 + v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 - v_531_543 <=s (const 64 (2**20)),
    r_531_543 + s_531_543 <=s (const 64 (2**20)),
    r_531_543 - s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 + s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 - s_531_543 <=s (const 64 (2**20)),
    u_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_531_543 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_542_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_11,
sint64 neg_g_531_low60_0_low20_11,
sint64 neg_f_531_low60_0_low20_12,
sint64 neg_g_531_low60_0_low20_12,
sint64 u_531_542,
sint64 v_531_542,
sint64 r_531_542,
sint64 s_531_542,
sint64 u_531_543,
sint64 v_531_543,
sint64 r_531_543,
sint64 s_531_543,
bit ne
)={
    u_531_542 * neg_f_531_low60_0_low20_0 + v_531_542 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_11 * (-(2**20)),
    r_531_542 * neg_f_531_low60_0_low20_0 + s_531_542 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_11 * (-(2**20))
&&
    u_531_542 * neg_f_531_low60_0_low20_0 + v_531_542 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_11 * (const 64 (-(2**20))),
    r_531_542 * neg_f_531_low60_0_low20_0 + s_531_542 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_11 + u_531_542 * (const 64 (2**21)) + v_531_542 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_11 + r_531_542 * (const 64 (2**21)) + s_531_542 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_11,
    neg_f_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_11,
    neg_g_531_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 542)) <=s delta, delta <=s (const 64 (1 + 2*542)),
    (const 64 (-(2**20))) <=s u_531_542, u_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_542, v_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_542, r_531_542 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_542, s_531_542 <=s (const 64 ((2**20))),
    u_531_542 + v_531_542 <=s (const 64 (2**20)),
    u_531_542 - v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 + v_531_542 <=s (const 64 (2**20)),
    (const 64 0) - u_531_542 - v_531_542 <=s (const 64 (2**20)),
    r_531_542 + s_531_542 <=s (const 64 (2**20)),
    r_531_542 - s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 + s_531_542 <=s (const 64 (2**20)),
    (const 64 0) - r_531_542 - s_531_542 <=s (const 64 (2**20)),
    u_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_531_542 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_531_542 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step542

// premise c
assume
neg_g_531_low60_0_low20_11 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_12 neg_g_531_low60_0_low20_11;
mov u_531_543 r_531_542;
mov v_531_543 s_531_542;

subs dc neg_g_531_low60_0_low20_12 neg_g_531_low60_0_low20_11 neg_f_531_low60_0_low20_11;
asr neg_g_531_low60_0_low20_12 neg_g_531_low60_0_low20_12 1;
subs dc r_531_543 r_531_542 u_531_542;
asr r_531_543 r_531_543 1;
subs dc s_531_543 s_531_542 v_531_542;
asr s_531_543 s_531_543 1;
assert
    true
&&
    neg_f_531_low60_0_low20_12 = neg_g_531_low60_0_low20_11,
    u_531_543 = r_531_542,
    v_531_543 = s_531_542,
    neg_g_531_low60_0_low20_12 * (const 64 2) = neg_g_531_low60_0_low20_11 - neg_f_531_low60_0_low20_11,
    r_531_543 * (const 64 2) = r_531_542 - u_531_542,
    s_531_543 * (const 64 2) = s_531_542 - v_531_542
;

assume
    neg_f_531_low60_0_low20_12 = neg_g_531_low60_0_low20_11,
    u_531_543 = r_531_542,
    v_531_543 = s_531_542,
    neg_g_531_low60_0_low20_12 * 2 = neg_g_531_low60_0_low20_11 - neg_f_531_low60_0_low20_11,
    r_531_543 * 2 = r_531_542 - u_531_542,
    s_531_543 * 2 = s_531_542 - v_531_542
&&
    true
;

{
    u_531_543 * neg_f_531_low60_0_low20_0 + v_531_543 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_543 * neg_f_531_low60_0_low20_0 + s_531_543 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_12 + u_531_543 * (const 64 (2**21)) + v_531_543 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_12 + r_531_543 * (const 64 (2**21)) + s_531_543 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_12,
    neg_f_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_12,
    neg_g_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 543)) <=s delta, delta <=s (const 64 (1 + 2*543)),
    (const 64 (-(2**20))) <=s u_531_543, u_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_543, v_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_543, r_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_543, s_531_543 <=s (const 64 ((2**20))),
    u_531_543 + v_531_543 <=s (const 64 (2**20)),
    u_531_543 - v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 + v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 - v_531_543 <=s (const 64 (2**20)),
    r_531_543 + s_531_543 <=s (const 64 (2**20)),
    r_531_543 - s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 + s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 - s_531_543 <=s (const 64 (2**20)),
    u_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_531_543 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_543_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_12,
sint64 neg_g_531_low60_0_low20_12,
sint64 neg_f_531_low60_0_low20_13,
sint64 neg_g_531_low60_0_low20_13,
sint64 u_531_543,
sint64 v_531_543,
sint64 r_531_543,
sint64 s_531_543,
sint64 u_531_544,
sint64 v_531_544,
sint64 r_531_544,
sint64 s_531_544,
bit ne
)={
    u_531_543 * neg_f_531_low60_0_low20_0 + v_531_543 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_12 * (-(2**20)),
    r_531_543 * neg_f_531_low60_0_low20_0 + s_531_543 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_12 * (-(2**20))
&&
    u_531_543 * neg_f_531_low60_0_low20_0 + v_531_543 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_12 * (const 64 (-(2**20))),
    r_531_543 * neg_f_531_low60_0_low20_0 + s_531_543 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_12 + u_531_543 * (const 64 (2**21)) + v_531_543 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_12 + r_531_543 * (const 64 (2**21)) + s_531_543 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_12,
    neg_f_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_12,
    neg_g_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 543)) <=s delta, delta <=s (const 64 (1 + 2*543)),
    (const 64 (-(2**20))) <=s u_531_543, u_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_543, v_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_543, r_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_543, s_531_543 <=s (const 64 ((2**20))),
    u_531_543 + v_531_543 <=s (const 64 (2**20)),
    u_531_543 - v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 + v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 - v_531_543 <=s (const 64 (2**20)),
    r_531_543 + s_531_543 <=s (const 64 (2**20)),
    r_531_543 - s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 + s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 - s_531_543 <=s (const 64 (2**20)),
    u_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_531_543 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step543

// premise a
assume
neg_g_531_low60_0_low20_12 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_12 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_13 neg_f_531_low60_0_low20_12;
mov u_531_544 u_531_543;
mov v_531_544 v_531_543;

asr neg_g_531_low60_0_low20_13 neg_g_531_low60_0_low20_12 1;
asr r_531_544 r_531_543 1;
asr s_531_544 s_531_543 1;
assert
    true
&&
    neg_f_531_low60_0_low20_13 = neg_f_531_low60_0_low20_12,
    u_531_544 = u_531_543,
    v_531_544 = v_531_543,
    neg_g_531_low60_0_low20_13 * (const 64 2) = neg_g_531_low60_0_low20_12,
    r_531_544 * (const 64 2) = r_531_543,
    s_531_544 * (const 64 2) = s_531_543
;

assume
    neg_f_531_low60_0_low20_13 = neg_f_531_low60_0_low20_12,
    u_531_544 = u_531_543,
    v_531_544 = v_531_543,
    neg_g_531_low60_0_low20_13 * 2 = neg_g_531_low60_0_low20_12,
    r_531_544 * 2 = r_531_543,
    s_531_544 * 2 = s_531_543
&&
    true
;

{
    u_531_544 * neg_f_531_low60_0_low20_0 + v_531_544 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_544 * neg_f_531_low60_0_low20_0 + s_531_544 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_13 + u_531_544 * (const 64 (2**21)) + v_531_544 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_13 + r_531_544 * (const 64 (2**21)) + s_531_544 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_13,
    neg_f_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_13,
    neg_g_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 544)) <=s delta, delta <=s (const 64 (1 + 2*544)),
    (const 64 (-(2**20))) <=s u_531_544, u_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_544, v_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_544, r_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_544, s_531_544 <=s (const 64 ((2**20))),
    u_531_544 + v_531_544 <=s (const 64 (2**20)),
    u_531_544 - v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 + v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 - v_531_544 <=s (const 64 (2**20)),
    r_531_544 + s_531_544 <=s (const 64 (2**20)),
    r_531_544 - s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 + s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 - s_531_544 <=s (const 64 (2**20)),
    u_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_531_544 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_543_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_12,
sint64 neg_g_531_low60_0_low20_12,
sint64 neg_f_531_low60_0_low20_13,
sint64 neg_g_531_low60_0_low20_13,
sint64 u_531_543,
sint64 v_531_543,
sint64 r_531_543,
sint64 s_531_543,
sint64 u_531_544,
sint64 v_531_544,
sint64 r_531_544,
sint64 s_531_544,
bit ne
)={
    u_531_543 * neg_f_531_low60_0_low20_0 + v_531_543 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_12 * (-(2**20)),
    r_531_543 * neg_f_531_low60_0_low20_0 + s_531_543 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_12 * (-(2**20))
&&
    u_531_543 * neg_f_531_low60_0_low20_0 + v_531_543 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_12 * (const 64 (-(2**20))),
    r_531_543 * neg_f_531_low60_0_low20_0 + s_531_543 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_12 + u_531_543 * (const 64 (2**21)) + v_531_543 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_12 + r_531_543 * (const 64 (2**21)) + s_531_543 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_12,
    neg_f_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_12,
    neg_g_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 543)) <=s delta, delta <=s (const 64 (1 + 2*543)),
    (const 64 (-(2**20))) <=s u_531_543, u_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_543, v_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_543, r_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_543, s_531_543 <=s (const 64 ((2**20))),
    u_531_543 + v_531_543 <=s (const 64 (2**20)),
    u_531_543 - v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 + v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 - v_531_543 <=s (const 64 (2**20)),
    r_531_543 + s_531_543 <=s (const 64 (2**20)),
    r_531_543 - s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 + s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 - s_531_543 <=s (const 64 (2**20)),
    u_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_531_543 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step543

// premise b
assume
neg_g_531_low60_0_low20_12 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_13 neg_f_531_low60_0_low20_12;
mov u_531_544 u_531_543;
mov v_531_544 v_531_543;

add neg_g_531_low60_0_low20_13 neg_g_531_low60_0_low20_12 neg_f_531_low60_0_low20_12;
asr neg_g_531_low60_0_low20_13 neg_g_531_low60_0_low20_13 1;
add r_531_544 r_531_543 u_531_543;
asr r_531_544 r_531_544 1;
add s_531_544 s_531_543 v_531_543;
asr s_531_544 s_531_544 1;
assert
    true
&&
    neg_f_531_low60_0_low20_13 = neg_f_531_low60_0_low20_12,
    u_531_544 = u_531_543,
    v_531_544 = v_531_543,
    neg_g_531_low60_0_low20_13 * (const 64 2) = neg_g_531_low60_0_low20_12 + neg_f_531_low60_0_low20_12,
    r_531_544 * (const 64 2) = r_531_543 + u_531_543,
    s_531_544 * (const 64 2) = s_531_543 + v_531_543
;

assume
    neg_f_531_low60_0_low20_13 = neg_f_531_low60_0_low20_12,
    u_531_544 = u_531_543,
    v_531_544 = v_531_543,
    neg_g_531_low60_0_low20_13 * 2 = neg_g_531_low60_0_low20_12 + neg_f_531_low60_0_low20_12,
    r_531_544 * 2 = r_531_543 + u_531_543,
    s_531_544 * 2 = s_531_543 + v_531_543
&&
    true
;

{
    u_531_544 * neg_f_531_low60_0_low20_0 + v_531_544 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_544 * neg_f_531_low60_0_low20_0 + s_531_544 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_13 + u_531_544 * (const 64 (2**21)) + v_531_544 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_13 + r_531_544 * (const 64 (2**21)) + s_531_544 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_13,
    neg_f_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_13,
    neg_g_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 544)) <=s delta, delta <=s (const 64 (1 + 2*544)),
    (const 64 (-(2**20))) <=s u_531_544, u_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_544, v_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_544, r_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_544, s_531_544 <=s (const 64 ((2**20))),
    u_531_544 + v_531_544 <=s (const 64 (2**20)),
    u_531_544 - v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 + v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 - v_531_544 <=s (const 64 (2**20)),
    r_531_544 + s_531_544 <=s (const 64 (2**20)),
    r_531_544 - s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 + s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 - s_531_544 <=s (const 64 (2**20)),
    u_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_531_544 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_543_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_12,
sint64 neg_g_531_low60_0_low20_12,
sint64 neg_f_531_low60_0_low20_13,
sint64 neg_g_531_low60_0_low20_13,
sint64 u_531_543,
sint64 v_531_543,
sint64 r_531_543,
sint64 s_531_543,
sint64 u_531_544,
sint64 v_531_544,
sint64 r_531_544,
sint64 s_531_544,
bit ne
)={
    u_531_543 * neg_f_531_low60_0_low20_0 + v_531_543 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_12 * (-(2**20)),
    r_531_543 * neg_f_531_low60_0_low20_0 + s_531_543 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_12 * (-(2**20))
&&
    u_531_543 * neg_f_531_low60_0_low20_0 + v_531_543 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_12 * (const 64 (-(2**20))),
    r_531_543 * neg_f_531_low60_0_low20_0 + s_531_543 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_12 + u_531_543 * (const 64 (2**21)) + v_531_543 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_12 + r_531_543 * (const 64 (2**21)) + s_531_543 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_12,
    neg_f_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_12,
    neg_g_531_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 543)) <=s delta, delta <=s (const 64 (1 + 2*543)),
    (const 64 (-(2**20))) <=s u_531_543, u_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_543, v_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_543, r_531_543 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_543, s_531_543 <=s (const 64 ((2**20))),
    u_531_543 + v_531_543 <=s (const 64 (2**20)),
    u_531_543 - v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 + v_531_543 <=s (const 64 (2**20)),
    (const 64 0) - u_531_543 - v_531_543 <=s (const 64 (2**20)),
    r_531_543 + s_531_543 <=s (const 64 (2**20)),
    r_531_543 - s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 + s_531_543 <=s (const 64 (2**20)),
    (const 64 0) - r_531_543 - s_531_543 <=s (const 64 (2**20)),
    u_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_531_543 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_531_543 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step543

// premise c
assume
neg_g_531_low60_0_low20_12 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_13 neg_g_531_low60_0_low20_12;
mov u_531_544 r_531_543;
mov v_531_544 s_531_543;

subs dc neg_g_531_low60_0_low20_13 neg_g_531_low60_0_low20_12 neg_f_531_low60_0_low20_12;
asr neg_g_531_low60_0_low20_13 neg_g_531_low60_0_low20_13 1;
subs dc r_531_544 r_531_543 u_531_543;
asr r_531_544 r_531_544 1;
subs dc s_531_544 s_531_543 v_531_543;
asr s_531_544 s_531_544 1;
assert
    true
&&
    neg_f_531_low60_0_low20_13 = neg_g_531_low60_0_low20_12,
    u_531_544 = r_531_543,
    v_531_544 = s_531_543,
    neg_g_531_low60_0_low20_13 * (const 64 2) = neg_g_531_low60_0_low20_12 - neg_f_531_low60_0_low20_12,
    r_531_544 * (const 64 2) = r_531_543 - u_531_543,
    s_531_544 * (const 64 2) = s_531_543 - v_531_543
;

assume
    neg_f_531_low60_0_low20_13 = neg_g_531_low60_0_low20_12,
    u_531_544 = r_531_543,
    v_531_544 = s_531_543,
    neg_g_531_low60_0_low20_13 * 2 = neg_g_531_low60_0_low20_12 - neg_f_531_low60_0_low20_12,
    r_531_544 * 2 = r_531_543 - u_531_543,
    s_531_544 * 2 = s_531_543 - v_531_543
&&
    true
;

{
    u_531_544 * neg_f_531_low60_0_low20_0 + v_531_544 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_544 * neg_f_531_low60_0_low20_0 + s_531_544 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_13 + u_531_544 * (const 64 (2**21)) + v_531_544 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_13 + r_531_544 * (const 64 (2**21)) + s_531_544 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_13,
    neg_f_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_13,
    neg_g_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 544)) <=s delta, delta <=s (const 64 (1 + 2*544)),
    (const 64 (-(2**20))) <=s u_531_544, u_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_544, v_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_544, r_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_544, s_531_544 <=s (const 64 ((2**20))),
    u_531_544 + v_531_544 <=s (const 64 (2**20)),
    u_531_544 - v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 + v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 - v_531_544 <=s (const 64 (2**20)),
    r_531_544 + s_531_544 <=s (const 64 (2**20)),
    r_531_544 - s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 + s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 - s_531_544 <=s (const 64 (2**20)),
    u_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_531_544 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_544_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_13,
sint64 neg_g_531_low60_0_low20_13,
sint64 neg_f_531_low60_0_low20_14,
sint64 neg_g_531_low60_0_low20_14,
sint64 u_531_544,
sint64 v_531_544,
sint64 r_531_544,
sint64 s_531_544,
sint64 u_531_545,
sint64 v_531_545,
sint64 r_531_545,
sint64 s_531_545,
bit ne
)={
    u_531_544 * neg_f_531_low60_0_low20_0 + v_531_544 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_13 * (-(2**20)),
    r_531_544 * neg_f_531_low60_0_low20_0 + s_531_544 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_13 * (-(2**20))
&&
    u_531_544 * neg_f_531_low60_0_low20_0 + v_531_544 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_13 * (const 64 (-(2**20))),
    r_531_544 * neg_f_531_low60_0_low20_0 + s_531_544 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_13 + u_531_544 * (const 64 (2**21)) + v_531_544 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_13 + r_531_544 * (const 64 (2**21)) + s_531_544 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_13,
    neg_f_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_13,
    neg_g_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 544)) <=s delta, delta <=s (const 64 (1 + 2*544)),
    (const 64 (-(2**20))) <=s u_531_544, u_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_544, v_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_544, r_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_544, s_531_544 <=s (const 64 ((2**20))),
    u_531_544 + v_531_544 <=s (const 64 (2**20)),
    u_531_544 - v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 + v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 - v_531_544 <=s (const 64 (2**20)),
    r_531_544 + s_531_544 <=s (const 64 (2**20)),
    r_531_544 - s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 + s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 - s_531_544 <=s (const 64 (2**20)),
    u_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_531_544 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step544

// premise a
assume
neg_g_531_low60_0_low20_13 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_13 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_14 neg_f_531_low60_0_low20_13;
mov u_531_545 u_531_544;
mov v_531_545 v_531_544;

asr neg_g_531_low60_0_low20_14 neg_g_531_low60_0_low20_13 1;
asr r_531_545 r_531_544 1;
asr s_531_545 s_531_544 1;
assert
    true
&&
    neg_f_531_low60_0_low20_14 = neg_f_531_low60_0_low20_13,
    u_531_545 = u_531_544,
    v_531_545 = v_531_544,
    neg_g_531_low60_0_low20_14 * (const 64 2) = neg_g_531_low60_0_low20_13,
    r_531_545 * (const 64 2) = r_531_544,
    s_531_545 * (const 64 2) = s_531_544
;

assume
    neg_f_531_low60_0_low20_14 = neg_f_531_low60_0_low20_13,
    u_531_545 = u_531_544,
    v_531_545 = v_531_544,
    neg_g_531_low60_0_low20_14 * 2 = neg_g_531_low60_0_low20_13,
    r_531_545 * 2 = r_531_544,
    s_531_545 * 2 = s_531_544
&&
    true
;

{
    u_531_545 * neg_f_531_low60_0_low20_0 + v_531_545 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_545 * neg_f_531_low60_0_low20_0 + s_531_545 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_14 + u_531_545 * (const 64 (2**21)) + v_531_545 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_14 + r_531_545 * (const 64 (2**21)) + s_531_545 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_14,
    neg_f_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_14,
    neg_g_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 545)) <=s delta, delta <=s (const 64 (1 + 2*545)),
    (const 64 (-(2**20))) <=s u_531_545, u_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_545, v_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_545, r_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_545, s_531_545 <=s (const 64 ((2**20))),
    u_531_545 + v_531_545 <=s (const 64 (2**20)),
    u_531_545 - v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 + v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 - v_531_545 <=s (const 64 (2**20)),
    r_531_545 + s_531_545 <=s (const 64 (2**20)),
    r_531_545 - s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 + s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 - s_531_545 <=s (const 64 (2**20)),
    u_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_531_545 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_544_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_13,
sint64 neg_g_531_low60_0_low20_13,
sint64 neg_f_531_low60_0_low20_14,
sint64 neg_g_531_low60_0_low20_14,
sint64 u_531_544,
sint64 v_531_544,
sint64 r_531_544,
sint64 s_531_544,
sint64 u_531_545,
sint64 v_531_545,
sint64 r_531_545,
sint64 s_531_545,
bit ne
)={
    u_531_544 * neg_f_531_low60_0_low20_0 + v_531_544 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_13 * (-(2**20)),
    r_531_544 * neg_f_531_low60_0_low20_0 + s_531_544 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_13 * (-(2**20))
&&
    u_531_544 * neg_f_531_low60_0_low20_0 + v_531_544 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_13 * (const 64 (-(2**20))),
    r_531_544 * neg_f_531_low60_0_low20_0 + s_531_544 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_13 + u_531_544 * (const 64 (2**21)) + v_531_544 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_13 + r_531_544 * (const 64 (2**21)) + s_531_544 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_13,
    neg_f_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_13,
    neg_g_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 544)) <=s delta, delta <=s (const 64 (1 + 2*544)),
    (const 64 (-(2**20))) <=s u_531_544, u_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_544, v_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_544, r_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_544, s_531_544 <=s (const 64 ((2**20))),
    u_531_544 + v_531_544 <=s (const 64 (2**20)),
    u_531_544 - v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 + v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 - v_531_544 <=s (const 64 (2**20)),
    r_531_544 + s_531_544 <=s (const 64 (2**20)),
    r_531_544 - s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 + s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 - s_531_544 <=s (const 64 (2**20)),
    u_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_531_544 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step544

// premise b
assume
neg_g_531_low60_0_low20_13 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_14 neg_f_531_low60_0_low20_13;
mov u_531_545 u_531_544;
mov v_531_545 v_531_544;

add neg_g_531_low60_0_low20_14 neg_g_531_low60_0_low20_13 neg_f_531_low60_0_low20_13;
asr neg_g_531_low60_0_low20_14 neg_g_531_low60_0_low20_14 1;
add r_531_545 r_531_544 u_531_544;
asr r_531_545 r_531_545 1;
add s_531_545 s_531_544 v_531_544;
asr s_531_545 s_531_545 1;
assert
    true
&&
    neg_f_531_low60_0_low20_14 = neg_f_531_low60_0_low20_13,
    u_531_545 = u_531_544,
    v_531_545 = v_531_544,
    neg_g_531_low60_0_low20_14 * (const 64 2) = neg_g_531_low60_0_low20_13 + neg_f_531_low60_0_low20_13,
    r_531_545 * (const 64 2) = r_531_544 + u_531_544,
    s_531_545 * (const 64 2) = s_531_544 + v_531_544
;

assume
    neg_f_531_low60_0_low20_14 = neg_f_531_low60_0_low20_13,
    u_531_545 = u_531_544,
    v_531_545 = v_531_544,
    neg_g_531_low60_0_low20_14 * 2 = neg_g_531_low60_0_low20_13 + neg_f_531_low60_0_low20_13,
    r_531_545 * 2 = r_531_544 + u_531_544,
    s_531_545 * 2 = s_531_544 + v_531_544
&&
    true
;

{
    u_531_545 * neg_f_531_low60_0_low20_0 + v_531_545 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_545 * neg_f_531_low60_0_low20_0 + s_531_545 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_14 + u_531_545 * (const 64 (2**21)) + v_531_545 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_14 + r_531_545 * (const 64 (2**21)) + s_531_545 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_14,
    neg_f_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_14,
    neg_g_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 545)) <=s delta, delta <=s (const 64 (1 + 2*545)),
    (const 64 (-(2**20))) <=s u_531_545, u_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_545, v_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_545, r_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_545, s_531_545 <=s (const 64 ((2**20))),
    u_531_545 + v_531_545 <=s (const 64 (2**20)),
    u_531_545 - v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 + v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 - v_531_545 <=s (const 64 (2**20)),
    r_531_545 + s_531_545 <=s (const 64 (2**20)),
    r_531_545 - s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 + s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 - s_531_545 <=s (const 64 (2**20)),
    u_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_531_545 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_544_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_13,
sint64 neg_g_531_low60_0_low20_13,
sint64 neg_f_531_low60_0_low20_14,
sint64 neg_g_531_low60_0_low20_14,
sint64 u_531_544,
sint64 v_531_544,
sint64 r_531_544,
sint64 s_531_544,
sint64 u_531_545,
sint64 v_531_545,
sint64 r_531_545,
sint64 s_531_545,
bit ne
)={
    u_531_544 * neg_f_531_low60_0_low20_0 + v_531_544 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_13 * (-(2**20)),
    r_531_544 * neg_f_531_low60_0_low20_0 + s_531_544 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_13 * (-(2**20))
&&
    u_531_544 * neg_f_531_low60_0_low20_0 + v_531_544 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_13 * (const 64 (-(2**20))),
    r_531_544 * neg_f_531_low60_0_low20_0 + s_531_544 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_13 + u_531_544 * (const 64 (2**21)) + v_531_544 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_13 + r_531_544 * (const 64 (2**21)) + s_531_544 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_13,
    neg_f_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_13,
    neg_g_531_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 544)) <=s delta, delta <=s (const 64 (1 + 2*544)),
    (const 64 (-(2**20))) <=s u_531_544, u_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_544, v_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_544, r_531_544 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_544, s_531_544 <=s (const 64 ((2**20))),
    u_531_544 + v_531_544 <=s (const 64 (2**20)),
    u_531_544 - v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 + v_531_544 <=s (const 64 (2**20)),
    (const 64 0) - u_531_544 - v_531_544 <=s (const 64 (2**20)),
    r_531_544 + s_531_544 <=s (const 64 (2**20)),
    r_531_544 - s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 + s_531_544 <=s (const 64 (2**20)),
    (const 64 0) - r_531_544 - s_531_544 <=s (const 64 (2**20)),
    u_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_531_544 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_531_544 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step544

// premise c
assume
neg_g_531_low60_0_low20_13 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_14 neg_g_531_low60_0_low20_13;
mov u_531_545 r_531_544;
mov v_531_545 s_531_544;

subs dc neg_g_531_low60_0_low20_14 neg_g_531_low60_0_low20_13 neg_f_531_low60_0_low20_13;
asr neg_g_531_low60_0_low20_14 neg_g_531_low60_0_low20_14 1;
subs dc r_531_545 r_531_544 u_531_544;
asr r_531_545 r_531_545 1;
subs dc s_531_545 s_531_544 v_531_544;
asr s_531_545 s_531_545 1;
assert
    true
&&
    neg_f_531_low60_0_low20_14 = neg_g_531_low60_0_low20_13,
    u_531_545 = r_531_544,
    v_531_545 = s_531_544,
    neg_g_531_low60_0_low20_14 * (const 64 2) = neg_g_531_low60_0_low20_13 - neg_f_531_low60_0_low20_13,
    r_531_545 * (const 64 2) = r_531_544 - u_531_544,
    s_531_545 * (const 64 2) = s_531_544 - v_531_544
;

assume
    neg_f_531_low60_0_low20_14 = neg_g_531_low60_0_low20_13,
    u_531_545 = r_531_544,
    v_531_545 = s_531_544,
    neg_g_531_low60_0_low20_14 * 2 = neg_g_531_low60_0_low20_13 - neg_f_531_low60_0_low20_13,
    r_531_545 * 2 = r_531_544 - u_531_544,
    s_531_545 * 2 = s_531_544 - v_531_544
&&
    true
;

{
    u_531_545 * neg_f_531_low60_0_low20_0 + v_531_545 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_545 * neg_f_531_low60_0_low20_0 + s_531_545 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_14 + u_531_545 * (const 64 (2**21)) + v_531_545 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_14 + r_531_545 * (const 64 (2**21)) + s_531_545 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_14,
    neg_f_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_14,
    neg_g_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 545)) <=s delta, delta <=s (const 64 (1 + 2*545)),
    (const 64 (-(2**20))) <=s u_531_545, u_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_545, v_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_545, r_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_545, s_531_545 <=s (const 64 ((2**20))),
    u_531_545 + v_531_545 <=s (const 64 (2**20)),
    u_531_545 - v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 + v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 - v_531_545 <=s (const 64 (2**20)),
    r_531_545 + s_531_545 <=s (const 64 (2**20)),
    r_531_545 - s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 + s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 - s_531_545 <=s (const 64 (2**20)),
    u_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_531_545 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_545_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_14,
sint64 neg_g_531_low60_0_low20_14,
sint64 neg_f_531_low60_0_low20_15,
sint64 neg_g_531_low60_0_low20_15,
sint64 u_531_545,
sint64 v_531_545,
sint64 r_531_545,
sint64 s_531_545,
sint64 u_531_546,
sint64 v_531_546,
sint64 r_531_546,
sint64 s_531_546,
bit ne
)={
    u_531_545 * neg_f_531_low60_0_low20_0 + v_531_545 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_14 * (-(2**20)),
    r_531_545 * neg_f_531_low60_0_low20_0 + s_531_545 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_14 * (-(2**20))
&&
    u_531_545 * neg_f_531_low60_0_low20_0 + v_531_545 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_14 * (const 64 (-(2**20))),
    r_531_545 * neg_f_531_low60_0_low20_0 + s_531_545 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_14 + u_531_545 * (const 64 (2**21)) + v_531_545 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_14 + r_531_545 * (const 64 (2**21)) + s_531_545 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_14,
    neg_f_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_14,
    neg_g_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 545)) <=s delta, delta <=s (const 64 (1 + 2*545)),
    (const 64 (-(2**20))) <=s u_531_545, u_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_545, v_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_545, r_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_545, s_531_545 <=s (const 64 ((2**20))),
    u_531_545 + v_531_545 <=s (const 64 (2**20)),
    u_531_545 - v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 + v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 - v_531_545 <=s (const 64 (2**20)),
    r_531_545 + s_531_545 <=s (const 64 (2**20)),
    r_531_545 - s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 + s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 - s_531_545 <=s (const 64 (2**20)),
    u_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_531_545 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step545

// premise a
assume
neg_g_531_low60_0_low20_14 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_14 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_15 neg_f_531_low60_0_low20_14;
mov u_531_546 u_531_545;
mov v_531_546 v_531_545;

asr neg_g_531_low60_0_low20_15 neg_g_531_low60_0_low20_14 1;
asr r_531_546 r_531_545 1;
asr s_531_546 s_531_545 1;
assert
    true
&&
    neg_f_531_low60_0_low20_15 = neg_f_531_low60_0_low20_14,
    u_531_546 = u_531_545,
    v_531_546 = v_531_545,
    neg_g_531_low60_0_low20_15 * (const 64 2) = neg_g_531_low60_0_low20_14,
    r_531_546 * (const 64 2) = r_531_545,
    s_531_546 * (const 64 2) = s_531_545
;

assume
    neg_f_531_low60_0_low20_15 = neg_f_531_low60_0_low20_14,
    u_531_546 = u_531_545,
    v_531_546 = v_531_545,
    neg_g_531_low60_0_low20_15 * 2 = neg_g_531_low60_0_low20_14,
    r_531_546 * 2 = r_531_545,
    s_531_546 * 2 = s_531_545
&&
    true
;

{
    u_531_546 * neg_f_531_low60_0_low20_0 + v_531_546 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_546 * neg_f_531_low60_0_low20_0 + s_531_546 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_15 + u_531_546 * (const 64 (2**21)) + v_531_546 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_15 + r_531_546 * (const 64 (2**21)) + s_531_546 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_15,
    neg_f_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_15,
    neg_g_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 546)) <=s delta, delta <=s (const 64 (1 + 2*546)),
    (const 64 (-(2**20))) <=s u_531_546, u_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_546, v_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_546, r_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_546, s_531_546 <=s (const 64 ((2**20))),
    u_531_546 + v_531_546 <=s (const 64 (2**20)),
    u_531_546 - v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 + v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 - v_531_546 <=s (const 64 (2**20)),
    r_531_546 + s_531_546 <=s (const 64 (2**20)),
    r_531_546 - s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 + s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 - s_531_546 <=s (const 64 (2**20)),
    u_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_531_546 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_545_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_14,
sint64 neg_g_531_low60_0_low20_14,
sint64 neg_f_531_low60_0_low20_15,
sint64 neg_g_531_low60_0_low20_15,
sint64 u_531_545,
sint64 v_531_545,
sint64 r_531_545,
sint64 s_531_545,
sint64 u_531_546,
sint64 v_531_546,
sint64 r_531_546,
sint64 s_531_546,
bit ne
)={
    u_531_545 * neg_f_531_low60_0_low20_0 + v_531_545 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_14 * (-(2**20)),
    r_531_545 * neg_f_531_low60_0_low20_0 + s_531_545 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_14 * (-(2**20))
&&
    u_531_545 * neg_f_531_low60_0_low20_0 + v_531_545 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_14 * (const 64 (-(2**20))),
    r_531_545 * neg_f_531_low60_0_low20_0 + s_531_545 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_14 + u_531_545 * (const 64 (2**21)) + v_531_545 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_14 + r_531_545 * (const 64 (2**21)) + s_531_545 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_14,
    neg_f_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_14,
    neg_g_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 545)) <=s delta, delta <=s (const 64 (1 + 2*545)),
    (const 64 (-(2**20))) <=s u_531_545, u_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_545, v_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_545, r_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_545, s_531_545 <=s (const 64 ((2**20))),
    u_531_545 + v_531_545 <=s (const 64 (2**20)),
    u_531_545 - v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 + v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 - v_531_545 <=s (const 64 (2**20)),
    r_531_545 + s_531_545 <=s (const 64 (2**20)),
    r_531_545 - s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 + s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 - s_531_545 <=s (const 64 (2**20)),
    u_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_531_545 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step545

// premise b
assume
neg_g_531_low60_0_low20_14 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_15 neg_f_531_low60_0_low20_14;
mov u_531_546 u_531_545;
mov v_531_546 v_531_545;

add neg_g_531_low60_0_low20_15 neg_g_531_low60_0_low20_14 neg_f_531_low60_0_low20_14;
asr neg_g_531_low60_0_low20_15 neg_g_531_low60_0_low20_15 1;
add r_531_546 r_531_545 u_531_545;
asr r_531_546 r_531_546 1;
add s_531_546 s_531_545 v_531_545;
asr s_531_546 s_531_546 1;
assert
    true
&&
    neg_f_531_low60_0_low20_15 = neg_f_531_low60_0_low20_14,
    u_531_546 = u_531_545,
    v_531_546 = v_531_545,
    neg_g_531_low60_0_low20_15 * (const 64 2) = neg_g_531_low60_0_low20_14 + neg_f_531_low60_0_low20_14,
    r_531_546 * (const 64 2) = r_531_545 + u_531_545,
    s_531_546 * (const 64 2) = s_531_545 + v_531_545
;

assume
    neg_f_531_low60_0_low20_15 = neg_f_531_low60_0_low20_14,
    u_531_546 = u_531_545,
    v_531_546 = v_531_545,
    neg_g_531_low60_0_low20_15 * 2 = neg_g_531_low60_0_low20_14 + neg_f_531_low60_0_low20_14,
    r_531_546 * 2 = r_531_545 + u_531_545,
    s_531_546 * 2 = s_531_545 + v_531_545
&&
    true
;

{
    u_531_546 * neg_f_531_low60_0_low20_0 + v_531_546 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_546 * neg_f_531_low60_0_low20_0 + s_531_546 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_15 + u_531_546 * (const 64 (2**21)) + v_531_546 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_15 + r_531_546 * (const 64 (2**21)) + s_531_546 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_15,
    neg_f_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_15,
    neg_g_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 546)) <=s delta, delta <=s (const 64 (1 + 2*546)),
    (const 64 (-(2**20))) <=s u_531_546, u_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_546, v_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_546, r_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_546, s_531_546 <=s (const 64 ((2**20))),
    u_531_546 + v_531_546 <=s (const 64 (2**20)),
    u_531_546 - v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 + v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 - v_531_546 <=s (const 64 (2**20)),
    r_531_546 + s_531_546 <=s (const 64 (2**20)),
    r_531_546 - s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 + s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 - s_531_546 <=s (const 64 (2**20)),
    u_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_531_546 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_545_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_14,
sint64 neg_g_531_low60_0_low20_14,
sint64 neg_f_531_low60_0_low20_15,
sint64 neg_g_531_low60_0_low20_15,
sint64 u_531_545,
sint64 v_531_545,
sint64 r_531_545,
sint64 s_531_545,
sint64 u_531_546,
sint64 v_531_546,
sint64 r_531_546,
sint64 s_531_546,
bit ne
)={
    u_531_545 * neg_f_531_low60_0_low20_0 + v_531_545 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_14 * (-(2**20)),
    r_531_545 * neg_f_531_low60_0_low20_0 + s_531_545 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_14 * (-(2**20))
&&
    u_531_545 * neg_f_531_low60_0_low20_0 + v_531_545 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_14 * (const 64 (-(2**20))),
    r_531_545 * neg_f_531_low60_0_low20_0 + s_531_545 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_14 + u_531_545 * (const 64 (2**21)) + v_531_545 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_14 + r_531_545 * (const 64 (2**21)) + s_531_545 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_14,
    neg_f_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_14,
    neg_g_531_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 545)) <=s delta, delta <=s (const 64 (1 + 2*545)),
    (const 64 (-(2**20))) <=s u_531_545, u_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_545, v_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_545, r_531_545 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_545, s_531_545 <=s (const 64 ((2**20))),
    u_531_545 + v_531_545 <=s (const 64 (2**20)),
    u_531_545 - v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 + v_531_545 <=s (const 64 (2**20)),
    (const 64 0) - u_531_545 - v_531_545 <=s (const 64 (2**20)),
    r_531_545 + s_531_545 <=s (const 64 (2**20)),
    r_531_545 - s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 + s_531_545 <=s (const 64 (2**20)),
    (const 64 0) - r_531_545 - s_531_545 <=s (const 64 (2**20)),
    u_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_531_545 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_531_545 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step545

// premise c
assume
neg_g_531_low60_0_low20_14 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_15 neg_g_531_low60_0_low20_14;
mov u_531_546 r_531_545;
mov v_531_546 s_531_545;

subs dc neg_g_531_low60_0_low20_15 neg_g_531_low60_0_low20_14 neg_f_531_low60_0_low20_14;
asr neg_g_531_low60_0_low20_15 neg_g_531_low60_0_low20_15 1;
subs dc r_531_546 r_531_545 u_531_545;
asr r_531_546 r_531_546 1;
subs dc s_531_546 s_531_545 v_531_545;
asr s_531_546 s_531_546 1;
assert
    true
&&
    neg_f_531_low60_0_low20_15 = neg_g_531_low60_0_low20_14,
    u_531_546 = r_531_545,
    v_531_546 = s_531_545,
    neg_g_531_low60_0_low20_15 * (const 64 2) = neg_g_531_low60_0_low20_14 - neg_f_531_low60_0_low20_14,
    r_531_546 * (const 64 2) = r_531_545 - u_531_545,
    s_531_546 * (const 64 2) = s_531_545 - v_531_545
;

assume
    neg_f_531_low60_0_low20_15 = neg_g_531_low60_0_low20_14,
    u_531_546 = r_531_545,
    v_531_546 = s_531_545,
    neg_g_531_low60_0_low20_15 * 2 = neg_g_531_low60_0_low20_14 - neg_f_531_low60_0_low20_14,
    r_531_546 * 2 = r_531_545 - u_531_545,
    s_531_546 * 2 = s_531_545 - v_531_545
&&
    true
;

{
    u_531_546 * neg_f_531_low60_0_low20_0 + v_531_546 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_546 * neg_f_531_low60_0_low20_0 + s_531_546 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_15 + u_531_546 * (const 64 (2**21)) + v_531_546 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_15 + r_531_546 * (const 64 (2**21)) + s_531_546 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_15,
    neg_f_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_15,
    neg_g_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 546)) <=s delta, delta <=s (const 64 (1 + 2*546)),
    (const 64 (-(2**20))) <=s u_531_546, u_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_546, v_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_546, r_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_546, s_531_546 <=s (const 64 ((2**20))),
    u_531_546 + v_531_546 <=s (const 64 (2**20)),
    u_531_546 - v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 + v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 - v_531_546 <=s (const 64 (2**20)),
    r_531_546 + s_531_546 <=s (const 64 (2**20)),
    r_531_546 - s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 + s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 - s_531_546 <=s (const 64 (2**20)),
    u_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_531_546 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_546_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_15,
sint64 neg_g_531_low60_0_low20_15,
sint64 neg_f_531_low60_0_low20_16,
sint64 neg_g_531_low60_0_low20_16,
sint64 u_531_546,
sint64 v_531_546,
sint64 r_531_546,
sint64 s_531_546,
sint64 u_531_547,
sint64 v_531_547,
sint64 r_531_547,
sint64 s_531_547,
bit ne
)={
    u_531_546 * neg_f_531_low60_0_low20_0 + v_531_546 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_15 * (-(2**20)),
    r_531_546 * neg_f_531_low60_0_low20_0 + s_531_546 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_15 * (-(2**20))
&&
    u_531_546 * neg_f_531_low60_0_low20_0 + v_531_546 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_15 * (const 64 (-(2**20))),
    r_531_546 * neg_f_531_low60_0_low20_0 + s_531_546 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_15 + u_531_546 * (const 64 (2**21)) + v_531_546 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_15 + r_531_546 * (const 64 (2**21)) + s_531_546 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_15,
    neg_f_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_15,
    neg_g_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 546)) <=s delta, delta <=s (const 64 (1 + 2*546)),
    (const 64 (-(2**20))) <=s u_531_546, u_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_546, v_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_546, r_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_546, s_531_546 <=s (const 64 ((2**20))),
    u_531_546 + v_531_546 <=s (const 64 (2**20)),
    u_531_546 - v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 + v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 - v_531_546 <=s (const 64 (2**20)),
    r_531_546 + s_531_546 <=s (const 64 (2**20)),
    r_531_546 - s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 + s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 - s_531_546 <=s (const 64 (2**20)),
    u_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_531_546 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step546

// premise a
assume
neg_g_531_low60_0_low20_15 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_15 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_16 neg_f_531_low60_0_low20_15;
mov u_531_547 u_531_546;
mov v_531_547 v_531_546;

asr neg_g_531_low60_0_low20_16 neg_g_531_low60_0_low20_15 1;
asr r_531_547 r_531_546 1;
asr s_531_547 s_531_546 1;
assert
    true
&&
    neg_f_531_low60_0_low20_16 = neg_f_531_low60_0_low20_15,
    u_531_547 = u_531_546,
    v_531_547 = v_531_546,
    neg_g_531_low60_0_low20_16 * (const 64 2) = neg_g_531_low60_0_low20_15,
    r_531_547 * (const 64 2) = r_531_546,
    s_531_547 * (const 64 2) = s_531_546
;

assume
    neg_f_531_low60_0_low20_16 = neg_f_531_low60_0_low20_15,
    u_531_547 = u_531_546,
    v_531_547 = v_531_546,
    neg_g_531_low60_0_low20_16 * 2 = neg_g_531_low60_0_low20_15,
    r_531_547 * 2 = r_531_546,
    s_531_547 * 2 = s_531_546
&&
    true
;

{
    u_531_547 * neg_f_531_low60_0_low20_0 + v_531_547 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_547 * neg_f_531_low60_0_low20_0 + s_531_547 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_16 + u_531_547 * (const 64 (2**21)) + v_531_547 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_16 + r_531_547 * (const 64 (2**21)) + s_531_547 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_16,
    neg_f_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_16,
    neg_g_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 547)) <=s delta, delta <=s (const 64 (1 + 2*547)),
    (const 64 (-(2**20))) <=s u_531_547, u_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_547, v_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_547, r_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_547, s_531_547 <=s (const 64 ((2**20))),
    u_531_547 + v_531_547 <=s (const 64 (2**20)),
    u_531_547 - v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 + v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 - v_531_547 <=s (const 64 (2**20)),
    r_531_547 + s_531_547 <=s (const 64 (2**20)),
    r_531_547 - s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 + s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 - s_531_547 <=s (const 64 (2**20)),
    u_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_531_547 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_546_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_15,
sint64 neg_g_531_low60_0_low20_15,
sint64 neg_f_531_low60_0_low20_16,
sint64 neg_g_531_low60_0_low20_16,
sint64 u_531_546,
sint64 v_531_546,
sint64 r_531_546,
sint64 s_531_546,
sint64 u_531_547,
sint64 v_531_547,
sint64 r_531_547,
sint64 s_531_547,
bit ne
)={
    u_531_546 * neg_f_531_low60_0_low20_0 + v_531_546 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_15 * (-(2**20)),
    r_531_546 * neg_f_531_low60_0_low20_0 + s_531_546 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_15 * (-(2**20))
&&
    u_531_546 * neg_f_531_low60_0_low20_0 + v_531_546 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_15 * (const 64 (-(2**20))),
    r_531_546 * neg_f_531_low60_0_low20_0 + s_531_546 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_15 + u_531_546 * (const 64 (2**21)) + v_531_546 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_15 + r_531_546 * (const 64 (2**21)) + s_531_546 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_15,
    neg_f_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_15,
    neg_g_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 546)) <=s delta, delta <=s (const 64 (1 + 2*546)),
    (const 64 (-(2**20))) <=s u_531_546, u_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_546, v_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_546, r_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_546, s_531_546 <=s (const 64 ((2**20))),
    u_531_546 + v_531_546 <=s (const 64 (2**20)),
    u_531_546 - v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 + v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 - v_531_546 <=s (const 64 (2**20)),
    r_531_546 + s_531_546 <=s (const 64 (2**20)),
    r_531_546 - s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 + s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 - s_531_546 <=s (const 64 (2**20)),
    u_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_531_546 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step546

// premise b
assume
neg_g_531_low60_0_low20_15 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_16 neg_f_531_low60_0_low20_15;
mov u_531_547 u_531_546;
mov v_531_547 v_531_546;

add neg_g_531_low60_0_low20_16 neg_g_531_low60_0_low20_15 neg_f_531_low60_0_low20_15;
asr neg_g_531_low60_0_low20_16 neg_g_531_low60_0_low20_16 1;
add r_531_547 r_531_546 u_531_546;
asr r_531_547 r_531_547 1;
add s_531_547 s_531_546 v_531_546;
asr s_531_547 s_531_547 1;
assert
    true
&&
    neg_f_531_low60_0_low20_16 = neg_f_531_low60_0_low20_15,
    u_531_547 = u_531_546,
    v_531_547 = v_531_546,
    neg_g_531_low60_0_low20_16 * (const 64 2) = neg_g_531_low60_0_low20_15 + neg_f_531_low60_0_low20_15,
    r_531_547 * (const 64 2) = r_531_546 + u_531_546,
    s_531_547 * (const 64 2) = s_531_546 + v_531_546
;

assume
    neg_f_531_low60_0_low20_16 = neg_f_531_low60_0_low20_15,
    u_531_547 = u_531_546,
    v_531_547 = v_531_546,
    neg_g_531_low60_0_low20_16 * 2 = neg_g_531_low60_0_low20_15 + neg_f_531_low60_0_low20_15,
    r_531_547 * 2 = r_531_546 + u_531_546,
    s_531_547 * 2 = s_531_546 + v_531_546
&&
    true
;

{
    u_531_547 * neg_f_531_low60_0_low20_0 + v_531_547 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_547 * neg_f_531_low60_0_low20_0 + s_531_547 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_16 + u_531_547 * (const 64 (2**21)) + v_531_547 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_16 + r_531_547 * (const 64 (2**21)) + s_531_547 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_16,
    neg_f_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_16,
    neg_g_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 547)) <=s delta, delta <=s (const 64 (1 + 2*547)),
    (const 64 (-(2**20))) <=s u_531_547, u_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_547, v_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_547, r_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_547, s_531_547 <=s (const 64 ((2**20))),
    u_531_547 + v_531_547 <=s (const 64 (2**20)),
    u_531_547 - v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 + v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 - v_531_547 <=s (const 64 (2**20)),
    r_531_547 + s_531_547 <=s (const 64 (2**20)),
    r_531_547 - s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 + s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 - s_531_547 <=s (const 64 (2**20)),
    u_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_531_547 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_546_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_15,
sint64 neg_g_531_low60_0_low20_15,
sint64 neg_f_531_low60_0_low20_16,
sint64 neg_g_531_low60_0_low20_16,
sint64 u_531_546,
sint64 v_531_546,
sint64 r_531_546,
sint64 s_531_546,
sint64 u_531_547,
sint64 v_531_547,
sint64 r_531_547,
sint64 s_531_547,
bit ne
)={
    u_531_546 * neg_f_531_low60_0_low20_0 + v_531_546 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_15 * (-(2**20)),
    r_531_546 * neg_f_531_low60_0_low20_0 + s_531_546 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_15 * (-(2**20))
&&
    u_531_546 * neg_f_531_low60_0_low20_0 + v_531_546 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_15 * (const 64 (-(2**20))),
    r_531_546 * neg_f_531_low60_0_low20_0 + s_531_546 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_15 + u_531_546 * (const 64 (2**21)) + v_531_546 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_15 + r_531_546 * (const 64 (2**21)) + s_531_546 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_15,
    neg_f_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_15,
    neg_g_531_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 546)) <=s delta, delta <=s (const 64 (1 + 2*546)),
    (const 64 (-(2**20))) <=s u_531_546, u_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_546, v_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_546, r_531_546 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_546, s_531_546 <=s (const 64 ((2**20))),
    u_531_546 + v_531_546 <=s (const 64 (2**20)),
    u_531_546 - v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 + v_531_546 <=s (const 64 (2**20)),
    (const 64 0) - u_531_546 - v_531_546 <=s (const 64 (2**20)),
    r_531_546 + s_531_546 <=s (const 64 (2**20)),
    r_531_546 - s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 + s_531_546 <=s (const 64 (2**20)),
    (const 64 0) - r_531_546 - s_531_546 <=s (const 64 (2**20)),
    u_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_531_546 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_531_546 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step546

// premise c
assume
neg_g_531_low60_0_low20_15 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_16 neg_g_531_low60_0_low20_15;
mov u_531_547 r_531_546;
mov v_531_547 s_531_546;

subs dc neg_g_531_low60_0_low20_16 neg_g_531_low60_0_low20_15 neg_f_531_low60_0_low20_15;
asr neg_g_531_low60_0_low20_16 neg_g_531_low60_0_low20_16 1;
subs dc r_531_547 r_531_546 u_531_546;
asr r_531_547 r_531_547 1;
subs dc s_531_547 s_531_546 v_531_546;
asr s_531_547 s_531_547 1;
assert
    true
&&
    neg_f_531_low60_0_low20_16 = neg_g_531_low60_0_low20_15,
    u_531_547 = r_531_546,
    v_531_547 = s_531_546,
    neg_g_531_low60_0_low20_16 * (const 64 2) = neg_g_531_low60_0_low20_15 - neg_f_531_low60_0_low20_15,
    r_531_547 * (const 64 2) = r_531_546 - u_531_546,
    s_531_547 * (const 64 2) = s_531_546 - v_531_546
;

assume
    neg_f_531_low60_0_low20_16 = neg_g_531_low60_0_low20_15,
    u_531_547 = r_531_546,
    v_531_547 = s_531_546,
    neg_g_531_low60_0_low20_16 * 2 = neg_g_531_low60_0_low20_15 - neg_f_531_low60_0_low20_15,
    r_531_547 * 2 = r_531_546 - u_531_546,
    s_531_547 * 2 = s_531_546 - v_531_546
&&
    true
;

{
    u_531_547 * neg_f_531_low60_0_low20_0 + v_531_547 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_547 * neg_f_531_low60_0_low20_0 + s_531_547 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_16 + u_531_547 * (const 64 (2**21)) + v_531_547 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_16 + r_531_547 * (const 64 (2**21)) + s_531_547 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_16,
    neg_f_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_16,
    neg_g_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 547)) <=s delta, delta <=s (const 64 (1 + 2*547)),
    (const 64 (-(2**20))) <=s u_531_547, u_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_547, v_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_547, r_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_547, s_531_547 <=s (const 64 ((2**20))),
    u_531_547 + v_531_547 <=s (const 64 (2**20)),
    u_531_547 - v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 + v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 - v_531_547 <=s (const 64 (2**20)),
    r_531_547 + s_531_547 <=s (const 64 (2**20)),
    r_531_547 - s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 + s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 - s_531_547 <=s (const 64 (2**20)),
    u_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_531_547 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_547_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_16,
sint64 neg_g_531_low60_0_low20_16,
sint64 neg_f_531_low60_0_low20_17,
sint64 neg_g_531_low60_0_low20_17,
sint64 u_531_547,
sint64 v_531_547,
sint64 r_531_547,
sint64 s_531_547,
sint64 u_531_548,
sint64 v_531_548,
sint64 r_531_548,
sint64 s_531_548,
bit ne
)={
    u_531_547 * neg_f_531_low60_0_low20_0 + v_531_547 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_16 * (-(2**20)),
    r_531_547 * neg_f_531_low60_0_low20_0 + s_531_547 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_16 * (-(2**20))
&&
    u_531_547 * neg_f_531_low60_0_low20_0 + v_531_547 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_16 * (const 64 (-(2**20))),
    r_531_547 * neg_f_531_low60_0_low20_0 + s_531_547 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_16 + u_531_547 * (const 64 (2**21)) + v_531_547 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_16 + r_531_547 * (const 64 (2**21)) + s_531_547 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_16,
    neg_f_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_16,
    neg_g_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 547)) <=s delta, delta <=s (const 64 (1 + 2*547)),
    (const 64 (-(2**20))) <=s u_531_547, u_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_547, v_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_547, r_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_547, s_531_547 <=s (const 64 ((2**20))),
    u_531_547 + v_531_547 <=s (const 64 (2**20)),
    u_531_547 - v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 + v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 - v_531_547 <=s (const 64 (2**20)),
    r_531_547 + s_531_547 <=s (const 64 (2**20)),
    r_531_547 - s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 + s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 - s_531_547 <=s (const 64 (2**20)),
    u_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_531_547 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step547

// premise a
assume
neg_g_531_low60_0_low20_16 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_16 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_17 neg_f_531_low60_0_low20_16;
mov u_531_548 u_531_547;
mov v_531_548 v_531_547;

asr neg_g_531_low60_0_low20_17 neg_g_531_low60_0_low20_16 1;
asr r_531_548 r_531_547 1;
asr s_531_548 s_531_547 1;
assert
    true
&&
    neg_f_531_low60_0_low20_17 = neg_f_531_low60_0_low20_16,
    u_531_548 = u_531_547,
    v_531_548 = v_531_547,
    neg_g_531_low60_0_low20_17 * (const 64 2) = neg_g_531_low60_0_low20_16,
    r_531_548 * (const 64 2) = r_531_547,
    s_531_548 * (const 64 2) = s_531_547
;

assume
    neg_f_531_low60_0_low20_17 = neg_f_531_low60_0_low20_16,
    u_531_548 = u_531_547,
    v_531_548 = v_531_547,
    neg_g_531_low60_0_low20_17 * 2 = neg_g_531_low60_0_low20_16,
    r_531_548 * 2 = r_531_547,
    s_531_548 * 2 = s_531_547
&&
    true
;

{
    u_531_548 * neg_f_531_low60_0_low20_0 + v_531_548 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_548 * neg_f_531_low60_0_low20_0 + s_531_548 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_17 + u_531_548 * (const 64 (2**21)) + v_531_548 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_17 + r_531_548 * (const 64 (2**21)) + s_531_548 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_17,
    neg_f_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_17,
    neg_g_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 548)) <=s delta, delta <=s (const 64 (1 + 2*548)),
    (const 64 (-(2**20))) <=s u_531_548, u_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_548, v_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_548, r_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_548, s_531_548 <=s (const 64 ((2**20))),
    u_531_548 + v_531_548 <=s (const 64 (2**20)),
    u_531_548 - v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 + v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 - v_531_548 <=s (const 64 (2**20)),
    r_531_548 + s_531_548 <=s (const 64 (2**20)),
    r_531_548 - s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 + s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 - s_531_548 <=s (const 64 (2**20)),
    u_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_531_548 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_547_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_16,
sint64 neg_g_531_low60_0_low20_16,
sint64 neg_f_531_low60_0_low20_17,
sint64 neg_g_531_low60_0_low20_17,
sint64 u_531_547,
sint64 v_531_547,
sint64 r_531_547,
sint64 s_531_547,
sint64 u_531_548,
sint64 v_531_548,
sint64 r_531_548,
sint64 s_531_548,
bit ne
)={
    u_531_547 * neg_f_531_low60_0_low20_0 + v_531_547 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_16 * (-(2**20)),
    r_531_547 * neg_f_531_low60_0_low20_0 + s_531_547 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_16 * (-(2**20))
&&
    u_531_547 * neg_f_531_low60_0_low20_0 + v_531_547 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_16 * (const 64 (-(2**20))),
    r_531_547 * neg_f_531_low60_0_low20_0 + s_531_547 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_16 + u_531_547 * (const 64 (2**21)) + v_531_547 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_16 + r_531_547 * (const 64 (2**21)) + s_531_547 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_16,
    neg_f_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_16,
    neg_g_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 547)) <=s delta, delta <=s (const 64 (1 + 2*547)),
    (const 64 (-(2**20))) <=s u_531_547, u_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_547, v_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_547, r_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_547, s_531_547 <=s (const 64 ((2**20))),
    u_531_547 + v_531_547 <=s (const 64 (2**20)),
    u_531_547 - v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 + v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 - v_531_547 <=s (const 64 (2**20)),
    r_531_547 + s_531_547 <=s (const 64 (2**20)),
    r_531_547 - s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 + s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 - s_531_547 <=s (const 64 (2**20)),
    u_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_531_547 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step547

// premise b
assume
neg_g_531_low60_0_low20_16 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_17 neg_f_531_low60_0_low20_16;
mov u_531_548 u_531_547;
mov v_531_548 v_531_547;

add neg_g_531_low60_0_low20_17 neg_g_531_low60_0_low20_16 neg_f_531_low60_0_low20_16;
asr neg_g_531_low60_0_low20_17 neg_g_531_low60_0_low20_17 1;
add r_531_548 r_531_547 u_531_547;
asr r_531_548 r_531_548 1;
add s_531_548 s_531_547 v_531_547;
asr s_531_548 s_531_548 1;
assert
    true
&&
    neg_f_531_low60_0_low20_17 = neg_f_531_low60_0_low20_16,
    u_531_548 = u_531_547,
    v_531_548 = v_531_547,
    neg_g_531_low60_0_low20_17 * (const 64 2) = neg_g_531_low60_0_low20_16 + neg_f_531_low60_0_low20_16,
    r_531_548 * (const 64 2) = r_531_547 + u_531_547,
    s_531_548 * (const 64 2) = s_531_547 + v_531_547
;

assume
    neg_f_531_low60_0_low20_17 = neg_f_531_low60_0_low20_16,
    u_531_548 = u_531_547,
    v_531_548 = v_531_547,
    neg_g_531_low60_0_low20_17 * 2 = neg_g_531_low60_0_low20_16 + neg_f_531_low60_0_low20_16,
    r_531_548 * 2 = r_531_547 + u_531_547,
    s_531_548 * 2 = s_531_547 + v_531_547
&&
    true
;

{
    u_531_548 * neg_f_531_low60_0_low20_0 + v_531_548 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_548 * neg_f_531_low60_0_low20_0 + s_531_548 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_17 + u_531_548 * (const 64 (2**21)) + v_531_548 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_17 + r_531_548 * (const 64 (2**21)) + s_531_548 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_17,
    neg_f_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_17,
    neg_g_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 548)) <=s delta, delta <=s (const 64 (1 + 2*548)),
    (const 64 (-(2**20))) <=s u_531_548, u_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_548, v_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_548, r_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_548, s_531_548 <=s (const 64 ((2**20))),
    u_531_548 + v_531_548 <=s (const 64 (2**20)),
    u_531_548 - v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 + v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 - v_531_548 <=s (const 64 (2**20)),
    r_531_548 + s_531_548 <=s (const 64 (2**20)),
    r_531_548 - s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 + s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 - s_531_548 <=s (const 64 (2**20)),
    u_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_531_548 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_547_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_16,
sint64 neg_g_531_low60_0_low20_16,
sint64 neg_f_531_low60_0_low20_17,
sint64 neg_g_531_low60_0_low20_17,
sint64 u_531_547,
sint64 v_531_547,
sint64 r_531_547,
sint64 s_531_547,
sint64 u_531_548,
sint64 v_531_548,
sint64 r_531_548,
sint64 s_531_548,
bit ne
)={
    u_531_547 * neg_f_531_low60_0_low20_0 + v_531_547 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_16 * (-(2**20)),
    r_531_547 * neg_f_531_low60_0_low20_0 + s_531_547 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_16 * (-(2**20))
&&
    u_531_547 * neg_f_531_low60_0_low20_0 + v_531_547 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_16 * (const 64 (-(2**20))),
    r_531_547 * neg_f_531_low60_0_low20_0 + s_531_547 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_16 + u_531_547 * (const 64 (2**21)) + v_531_547 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_16 + r_531_547 * (const 64 (2**21)) + s_531_547 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_16,
    neg_f_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_16,
    neg_g_531_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 547)) <=s delta, delta <=s (const 64 (1 + 2*547)),
    (const 64 (-(2**20))) <=s u_531_547, u_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_547, v_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_547, r_531_547 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_547, s_531_547 <=s (const 64 ((2**20))),
    u_531_547 + v_531_547 <=s (const 64 (2**20)),
    u_531_547 - v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 + v_531_547 <=s (const 64 (2**20)),
    (const 64 0) - u_531_547 - v_531_547 <=s (const 64 (2**20)),
    r_531_547 + s_531_547 <=s (const 64 (2**20)),
    r_531_547 - s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 + s_531_547 <=s (const 64 (2**20)),
    (const 64 0) - r_531_547 - s_531_547 <=s (const 64 (2**20)),
    u_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_531_547 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_531_547 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step547

// premise c
assume
neg_g_531_low60_0_low20_16 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_17 neg_g_531_low60_0_low20_16;
mov u_531_548 r_531_547;
mov v_531_548 s_531_547;

subs dc neg_g_531_low60_0_low20_17 neg_g_531_low60_0_low20_16 neg_f_531_low60_0_low20_16;
asr neg_g_531_low60_0_low20_17 neg_g_531_low60_0_low20_17 1;
subs dc r_531_548 r_531_547 u_531_547;
asr r_531_548 r_531_548 1;
subs dc s_531_548 s_531_547 v_531_547;
asr s_531_548 s_531_548 1;
assert
    true
&&
    neg_f_531_low60_0_low20_17 = neg_g_531_low60_0_low20_16,
    u_531_548 = r_531_547,
    v_531_548 = s_531_547,
    neg_g_531_low60_0_low20_17 * (const 64 2) = neg_g_531_low60_0_low20_16 - neg_f_531_low60_0_low20_16,
    r_531_548 * (const 64 2) = r_531_547 - u_531_547,
    s_531_548 * (const 64 2) = s_531_547 - v_531_547
;

assume
    neg_f_531_low60_0_low20_17 = neg_g_531_low60_0_low20_16,
    u_531_548 = r_531_547,
    v_531_548 = s_531_547,
    neg_g_531_low60_0_low20_17 * 2 = neg_g_531_low60_0_low20_16 - neg_f_531_low60_0_low20_16,
    r_531_548 * 2 = r_531_547 - u_531_547,
    s_531_548 * 2 = s_531_547 - v_531_547
&&
    true
;

{
    u_531_548 * neg_f_531_low60_0_low20_0 + v_531_548 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_548 * neg_f_531_low60_0_low20_0 + s_531_548 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_17 + u_531_548 * (const 64 (2**21)) + v_531_548 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_17 + r_531_548 * (const 64 (2**21)) + s_531_548 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_17,
    neg_f_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_17,
    neg_g_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 548)) <=s delta, delta <=s (const 64 (1 + 2*548)),
    (const 64 (-(2**20))) <=s u_531_548, u_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_548, v_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_548, r_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_548, s_531_548 <=s (const 64 ((2**20))),
    u_531_548 + v_531_548 <=s (const 64 (2**20)),
    u_531_548 - v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 + v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 - v_531_548 <=s (const 64 (2**20)),
    r_531_548 + s_531_548 <=s (const 64 (2**20)),
    r_531_548 - s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 + s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 - s_531_548 <=s (const 64 (2**20)),
    u_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_531_548 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_548_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_17,
sint64 neg_g_531_low60_0_low20_17,
sint64 neg_f_531_low60_0_low20_18,
sint64 neg_g_531_low60_0_low20_18,
sint64 u_531_548,
sint64 v_531_548,
sint64 r_531_548,
sint64 s_531_548,
sint64 u_531_549,
sint64 v_531_549,
sint64 r_531_549,
sint64 s_531_549,
bit ne
)={
    u_531_548 * neg_f_531_low60_0_low20_0 + v_531_548 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_17 * (-(2**20)),
    r_531_548 * neg_f_531_low60_0_low20_0 + s_531_548 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_17 * (-(2**20))
&&
    u_531_548 * neg_f_531_low60_0_low20_0 + v_531_548 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_17 * (const 64 (-(2**20))),
    r_531_548 * neg_f_531_low60_0_low20_0 + s_531_548 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_17 + u_531_548 * (const 64 (2**21)) + v_531_548 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_17 + r_531_548 * (const 64 (2**21)) + s_531_548 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_17,
    neg_f_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_17,
    neg_g_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 548)) <=s delta, delta <=s (const 64 (1 + 2*548)),
    (const 64 (-(2**20))) <=s u_531_548, u_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_548, v_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_548, r_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_548, s_531_548 <=s (const 64 ((2**20))),
    u_531_548 + v_531_548 <=s (const 64 (2**20)),
    u_531_548 - v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 + v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 - v_531_548 <=s (const 64 (2**20)),
    r_531_548 + s_531_548 <=s (const 64 (2**20)),
    r_531_548 - s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 + s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 - s_531_548 <=s (const 64 (2**20)),
    u_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_531_548 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step548

// premise a
assume
neg_g_531_low60_0_low20_17 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_17 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_18 neg_f_531_low60_0_low20_17;
mov u_531_549 u_531_548;
mov v_531_549 v_531_548;

asr neg_g_531_low60_0_low20_18 neg_g_531_low60_0_low20_17 1;
asr r_531_549 r_531_548 1;
asr s_531_549 s_531_548 1;
assert
    true
&&
    neg_f_531_low60_0_low20_18 = neg_f_531_low60_0_low20_17,
    u_531_549 = u_531_548,
    v_531_549 = v_531_548,
    neg_g_531_low60_0_low20_18 * (const 64 2) = neg_g_531_low60_0_low20_17,
    r_531_549 * (const 64 2) = r_531_548,
    s_531_549 * (const 64 2) = s_531_548
;

assume
    neg_f_531_low60_0_low20_18 = neg_f_531_low60_0_low20_17,
    u_531_549 = u_531_548,
    v_531_549 = v_531_548,
    neg_g_531_low60_0_low20_18 * 2 = neg_g_531_low60_0_low20_17,
    r_531_549 * 2 = r_531_548,
    s_531_549 * 2 = s_531_548
&&
    true
;

{
    u_531_549 * neg_f_531_low60_0_low20_0 + v_531_549 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_549 * neg_f_531_low60_0_low20_0 + s_531_549 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_18 + u_531_549 * (const 64 (2**21)) + v_531_549 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_18 + r_531_549 * (const 64 (2**21)) + s_531_549 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_18,
    neg_f_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_18,
    neg_g_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 549)) <=s delta, delta <=s (const 64 (1 + 2*549)),
    (const 64 (-(2**20))) <=s u_531_549, u_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_549, v_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_549, r_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_549, s_531_549 <=s (const 64 ((2**20))),
    u_531_549 + v_531_549 <=s (const 64 (2**20)),
    u_531_549 - v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 + v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 - v_531_549 <=s (const 64 (2**20)),
    r_531_549 + s_531_549 <=s (const 64 (2**20)),
    r_531_549 - s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 + s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 - s_531_549 <=s (const 64 (2**20)),
    u_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_531_549 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_548_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_17,
sint64 neg_g_531_low60_0_low20_17,
sint64 neg_f_531_low60_0_low20_18,
sint64 neg_g_531_low60_0_low20_18,
sint64 u_531_548,
sint64 v_531_548,
sint64 r_531_548,
sint64 s_531_548,
sint64 u_531_549,
sint64 v_531_549,
sint64 r_531_549,
sint64 s_531_549,
bit ne
)={
    u_531_548 * neg_f_531_low60_0_low20_0 + v_531_548 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_17 * (-(2**20)),
    r_531_548 * neg_f_531_low60_0_low20_0 + s_531_548 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_17 * (-(2**20))
&&
    u_531_548 * neg_f_531_low60_0_low20_0 + v_531_548 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_17 * (const 64 (-(2**20))),
    r_531_548 * neg_f_531_low60_0_low20_0 + s_531_548 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_17 + u_531_548 * (const 64 (2**21)) + v_531_548 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_17 + r_531_548 * (const 64 (2**21)) + s_531_548 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_17,
    neg_f_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_17,
    neg_g_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 548)) <=s delta, delta <=s (const 64 (1 + 2*548)),
    (const 64 (-(2**20))) <=s u_531_548, u_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_548, v_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_548, r_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_548, s_531_548 <=s (const 64 ((2**20))),
    u_531_548 + v_531_548 <=s (const 64 (2**20)),
    u_531_548 - v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 + v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 - v_531_548 <=s (const 64 (2**20)),
    r_531_548 + s_531_548 <=s (const 64 (2**20)),
    r_531_548 - s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 + s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 - s_531_548 <=s (const 64 (2**20)),
    u_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_531_548 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step548

// premise b
assume
neg_g_531_low60_0_low20_17 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_18 neg_f_531_low60_0_low20_17;
mov u_531_549 u_531_548;
mov v_531_549 v_531_548;

add neg_g_531_low60_0_low20_18 neg_g_531_low60_0_low20_17 neg_f_531_low60_0_low20_17;
asr neg_g_531_low60_0_low20_18 neg_g_531_low60_0_low20_18 1;
add r_531_549 r_531_548 u_531_548;
asr r_531_549 r_531_549 1;
add s_531_549 s_531_548 v_531_548;
asr s_531_549 s_531_549 1;
assert
    true
&&
    neg_f_531_low60_0_low20_18 = neg_f_531_low60_0_low20_17,
    u_531_549 = u_531_548,
    v_531_549 = v_531_548,
    neg_g_531_low60_0_low20_18 * (const 64 2) = neg_g_531_low60_0_low20_17 + neg_f_531_low60_0_low20_17,
    r_531_549 * (const 64 2) = r_531_548 + u_531_548,
    s_531_549 * (const 64 2) = s_531_548 + v_531_548
;

assume
    neg_f_531_low60_0_low20_18 = neg_f_531_low60_0_low20_17,
    u_531_549 = u_531_548,
    v_531_549 = v_531_548,
    neg_g_531_low60_0_low20_18 * 2 = neg_g_531_low60_0_low20_17 + neg_f_531_low60_0_low20_17,
    r_531_549 * 2 = r_531_548 + u_531_548,
    s_531_549 * 2 = s_531_548 + v_531_548
&&
    true
;

{
    u_531_549 * neg_f_531_low60_0_low20_0 + v_531_549 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_549 * neg_f_531_low60_0_low20_0 + s_531_549 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_18 + u_531_549 * (const 64 (2**21)) + v_531_549 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_18 + r_531_549 * (const 64 (2**21)) + s_531_549 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_18,
    neg_f_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_18,
    neg_g_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 549)) <=s delta, delta <=s (const 64 (1 + 2*549)),
    (const 64 (-(2**20))) <=s u_531_549, u_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_549, v_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_549, r_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_549, s_531_549 <=s (const 64 ((2**20))),
    u_531_549 + v_531_549 <=s (const 64 (2**20)),
    u_531_549 - v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 + v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 - v_531_549 <=s (const 64 (2**20)),
    r_531_549 + s_531_549 <=s (const 64 (2**20)),
    r_531_549 - s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 + s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 - s_531_549 <=s (const 64 (2**20)),
    u_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_531_549 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_548_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_17,
sint64 neg_g_531_low60_0_low20_17,
sint64 neg_f_531_low60_0_low20_18,
sint64 neg_g_531_low60_0_low20_18,
sint64 u_531_548,
sint64 v_531_548,
sint64 r_531_548,
sint64 s_531_548,
sint64 u_531_549,
sint64 v_531_549,
sint64 r_531_549,
sint64 s_531_549,
bit ne
)={
    u_531_548 * neg_f_531_low60_0_low20_0 + v_531_548 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_17 * (-(2**20)),
    r_531_548 * neg_f_531_low60_0_low20_0 + s_531_548 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_17 * (-(2**20))
&&
    u_531_548 * neg_f_531_low60_0_low20_0 + v_531_548 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_17 * (const 64 (-(2**20))),
    r_531_548 * neg_f_531_low60_0_low20_0 + s_531_548 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_17 + u_531_548 * (const 64 (2**21)) + v_531_548 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_17 + r_531_548 * (const 64 (2**21)) + s_531_548 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_17,
    neg_f_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_17,
    neg_g_531_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 548)) <=s delta, delta <=s (const 64 (1 + 2*548)),
    (const 64 (-(2**20))) <=s u_531_548, u_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_548, v_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_548, r_531_548 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_548, s_531_548 <=s (const 64 ((2**20))),
    u_531_548 + v_531_548 <=s (const 64 (2**20)),
    u_531_548 - v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 + v_531_548 <=s (const 64 (2**20)),
    (const 64 0) - u_531_548 - v_531_548 <=s (const 64 (2**20)),
    r_531_548 + s_531_548 <=s (const 64 (2**20)),
    r_531_548 - s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 + s_531_548 <=s (const 64 (2**20)),
    (const 64 0) - r_531_548 - s_531_548 <=s (const 64 (2**20)),
    u_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_531_548 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_531_548 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step548

// premise c
assume
neg_g_531_low60_0_low20_17 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_18 neg_g_531_low60_0_low20_17;
mov u_531_549 r_531_548;
mov v_531_549 s_531_548;

subs dc neg_g_531_low60_0_low20_18 neg_g_531_low60_0_low20_17 neg_f_531_low60_0_low20_17;
asr neg_g_531_low60_0_low20_18 neg_g_531_low60_0_low20_18 1;
subs dc r_531_549 r_531_548 u_531_548;
asr r_531_549 r_531_549 1;
subs dc s_531_549 s_531_548 v_531_548;
asr s_531_549 s_531_549 1;
assert
    true
&&
    neg_f_531_low60_0_low20_18 = neg_g_531_low60_0_low20_17,
    u_531_549 = r_531_548,
    v_531_549 = s_531_548,
    neg_g_531_low60_0_low20_18 * (const 64 2) = neg_g_531_low60_0_low20_17 - neg_f_531_low60_0_low20_17,
    r_531_549 * (const 64 2) = r_531_548 - u_531_548,
    s_531_549 * (const 64 2) = s_531_548 - v_531_548
;

assume
    neg_f_531_low60_0_low20_18 = neg_g_531_low60_0_low20_17,
    u_531_549 = r_531_548,
    v_531_549 = s_531_548,
    neg_g_531_low60_0_low20_18 * 2 = neg_g_531_low60_0_low20_17 - neg_f_531_low60_0_low20_17,
    r_531_549 * 2 = r_531_548 - u_531_548,
    s_531_549 * 2 = s_531_548 - v_531_548
&&
    true
;

{
    u_531_549 * neg_f_531_low60_0_low20_0 + v_531_549 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_549 * neg_f_531_low60_0_low20_0 + s_531_549 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_18 + u_531_549 * (const 64 (2**21)) + v_531_549 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_18 + r_531_549 * (const 64 (2**21)) + s_531_549 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_18,
    neg_f_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_18,
    neg_g_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 549)) <=s delta, delta <=s (const 64 (1 + 2*549)),
    (const 64 (-(2**20))) <=s u_531_549, u_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_549, v_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_549, r_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_549, s_531_549 <=s (const 64 ((2**20))),
    u_531_549 + v_531_549 <=s (const 64 (2**20)),
    u_531_549 - v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 + v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 - v_531_549 <=s (const 64 (2**20)),
    r_531_549 + s_531_549 <=s (const 64 (2**20)),
    r_531_549 - s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 + s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 - s_531_549 <=s (const 64 (2**20)),
    u_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_531_549 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_549_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_18,
sint64 neg_g_531_low60_0_low20_18,
sint64 neg_f_531_low60_0_low20_19,
sint64 neg_g_531_low60_0_low20_19,
sint64 u_531_549,
sint64 v_531_549,
sint64 r_531_549,
sint64 s_531_549,
sint64 u_531_550,
sint64 v_531_550,
sint64 r_531_550,
sint64 s_531_550,
bit ne
)={
    u_531_549 * neg_f_531_low60_0_low20_0 + v_531_549 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_18 * (-(2**20)),
    r_531_549 * neg_f_531_low60_0_low20_0 + s_531_549 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_18 * (-(2**20))
&&
    u_531_549 * neg_f_531_low60_0_low20_0 + v_531_549 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_18 * (const 64 (-(2**20))),
    r_531_549 * neg_f_531_low60_0_low20_0 + s_531_549 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_18 + u_531_549 * (const 64 (2**21)) + v_531_549 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_18 + r_531_549 * (const 64 (2**21)) + s_531_549 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_18,
    neg_f_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_18,
    neg_g_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 549)) <=s delta, delta <=s (const 64 (1 + 2*549)),
    (const 64 (-(2**20))) <=s u_531_549, u_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_549, v_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_549, r_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_549, s_531_549 <=s (const 64 ((2**20))),
    u_531_549 + v_531_549 <=s (const 64 (2**20)),
    u_531_549 - v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 + v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 - v_531_549 <=s (const 64 (2**20)),
    r_531_549 + s_531_549 <=s (const 64 (2**20)),
    r_531_549 - s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 + s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 - s_531_549 <=s (const 64 (2**20)),
    u_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_531_549 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step549

// premise a
assume
neg_g_531_low60_0_low20_18 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_18 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_19 neg_f_531_low60_0_low20_18;
mov u_531_550 u_531_549;
mov v_531_550 v_531_549;

asr neg_g_531_low60_0_low20_19 neg_g_531_low60_0_low20_18 1;
asr r_531_550 r_531_549 1;
asr s_531_550 s_531_549 1;
assert
    true
&&
    neg_f_531_low60_0_low20_19 = neg_f_531_low60_0_low20_18,
    u_531_550 = u_531_549,
    v_531_550 = v_531_549,
    neg_g_531_low60_0_low20_19 * (const 64 2) = neg_g_531_low60_0_low20_18,
    r_531_550 * (const 64 2) = r_531_549,
    s_531_550 * (const 64 2) = s_531_549
;

assume
    neg_f_531_low60_0_low20_19 = neg_f_531_low60_0_low20_18,
    u_531_550 = u_531_549,
    v_531_550 = v_531_549,
    neg_g_531_low60_0_low20_19 * 2 = neg_g_531_low60_0_low20_18,
    r_531_550 * 2 = r_531_549,
    s_531_550 * 2 = s_531_549
&&
    true
;

{
    u_531_550 * neg_f_531_low60_0_low20_0 + v_531_550 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_550 * neg_f_531_low60_0_low20_0 + s_531_550 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_19 + u_531_550 * (const 64 (2**21)) + v_531_550 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_19 + r_531_550 * (const 64 (2**21)) + s_531_550 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_19,
    neg_f_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_19,
    neg_g_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 550)) <=s delta, delta <=s (const 64 (1 + 2*550)),
    (const 64 (-(2**20))) <=s u_531_550, u_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_550, v_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_550, r_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_550, s_531_550 <=s (const 64 ((2**20))),
    u_531_550 + v_531_550 <=s (const 64 (2**20)),
    u_531_550 - v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 + v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 - v_531_550 <=s (const 64 (2**20)),
    r_531_550 + s_531_550 <=s (const 64 (2**20)),
    r_531_550 - s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 + s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 - s_531_550 <=s (const 64 (2**20)),
    u_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_531_550 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_549_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_18,
sint64 neg_g_531_low60_0_low20_18,
sint64 neg_f_531_low60_0_low20_19,
sint64 neg_g_531_low60_0_low20_19,
sint64 u_531_549,
sint64 v_531_549,
sint64 r_531_549,
sint64 s_531_549,
sint64 u_531_550,
sint64 v_531_550,
sint64 r_531_550,
sint64 s_531_550,
bit ne
)={
    u_531_549 * neg_f_531_low60_0_low20_0 + v_531_549 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_18 * (-(2**20)),
    r_531_549 * neg_f_531_low60_0_low20_0 + s_531_549 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_18 * (-(2**20))
&&
    u_531_549 * neg_f_531_low60_0_low20_0 + v_531_549 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_18 * (const 64 (-(2**20))),
    r_531_549 * neg_f_531_low60_0_low20_0 + s_531_549 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_18 + u_531_549 * (const 64 (2**21)) + v_531_549 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_18 + r_531_549 * (const 64 (2**21)) + s_531_549 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_18,
    neg_f_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_18,
    neg_g_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 549)) <=s delta, delta <=s (const 64 (1 + 2*549)),
    (const 64 (-(2**20))) <=s u_531_549, u_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_549, v_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_549, r_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_549, s_531_549 <=s (const 64 ((2**20))),
    u_531_549 + v_531_549 <=s (const 64 (2**20)),
    u_531_549 - v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 + v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 - v_531_549 <=s (const 64 (2**20)),
    r_531_549 + s_531_549 <=s (const 64 (2**20)),
    r_531_549 - s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 + s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 - s_531_549 <=s (const 64 (2**20)),
    u_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_531_549 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step549

// premise b
assume
neg_g_531_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_19 neg_f_531_low60_0_low20_18;
mov u_531_550 u_531_549;
mov v_531_550 v_531_549;

add neg_g_531_low60_0_low20_19 neg_g_531_low60_0_low20_18 neg_f_531_low60_0_low20_18;
asr neg_g_531_low60_0_low20_19 neg_g_531_low60_0_low20_19 1;
add r_531_550 r_531_549 u_531_549;
asr r_531_550 r_531_550 1;
add s_531_550 s_531_549 v_531_549;
asr s_531_550 s_531_550 1;
assert
    true
&&
    neg_f_531_low60_0_low20_19 = neg_f_531_low60_0_low20_18,
    u_531_550 = u_531_549,
    v_531_550 = v_531_549,
    neg_g_531_low60_0_low20_19 * (const 64 2) = neg_g_531_low60_0_low20_18 + neg_f_531_low60_0_low20_18,
    r_531_550 * (const 64 2) = r_531_549 + u_531_549,
    s_531_550 * (const 64 2) = s_531_549 + v_531_549
;

assume
    neg_f_531_low60_0_low20_19 = neg_f_531_low60_0_low20_18,
    u_531_550 = u_531_549,
    v_531_550 = v_531_549,
    neg_g_531_low60_0_low20_19 * 2 = neg_g_531_low60_0_low20_18 + neg_f_531_low60_0_low20_18,
    r_531_550 * 2 = r_531_549 + u_531_549,
    s_531_550 * 2 = s_531_549 + v_531_549
&&
    true
;

{
    u_531_550 * neg_f_531_low60_0_low20_0 + v_531_550 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_550 * neg_f_531_low60_0_low20_0 + s_531_550 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_19 + u_531_550 * (const 64 (2**21)) + v_531_550 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_19 + r_531_550 * (const 64 (2**21)) + s_531_550 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_19,
    neg_f_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_19,
    neg_g_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 550)) <=s delta, delta <=s (const 64 (1 + 2*550)),
    (const 64 (-(2**20))) <=s u_531_550, u_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_550, v_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_550, r_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_550, s_531_550 <=s (const 64 ((2**20))),
    u_531_550 + v_531_550 <=s (const 64 (2**20)),
    u_531_550 - v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 + v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 - v_531_550 <=s (const 64 (2**20)),
    r_531_550 + s_531_550 <=s (const 64 (2**20)),
    r_531_550 - s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 + s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 - s_531_550 <=s (const 64 (2**20)),
    u_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_531_550 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_549_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_18,
sint64 neg_g_531_low60_0_low20_18,
sint64 neg_f_531_low60_0_low20_19,
sint64 neg_g_531_low60_0_low20_19,
sint64 u_531_549,
sint64 v_531_549,
sint64 r_531_549,
sint64 s_531_549,
sint64 u_531_550,
sint64 v_531_550,
sint64 r_531_550,
sint64 s_531_550,
bit ne
)={
    u_531_549 * neg_f_531_low60_0_low20_0 + v_531_549 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_18 * (-(2**20)),
    r_531_549 * neg_f_531_low60_0_low20_0 + s_531_549 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_18 * (-(2**20))
&&
    u_531_549 * neg_f_531_low60_0_low20_0 + v_531_549 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_18 * (const 64 (-(2**20))),
    r_531_549 * neg_f_531_low60_0_low20_0 + s_531_549 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_18 + u_531_549 * (const 64 (2**21)) + v_531_549 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_18 + r_531_549 * (const 64 (2**21)) + s_531_549 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_18,
    neg_f_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_18,
    neg_g_531_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 549)) <=s delta, delta <=s (const 64 (1 + 2*549)),
    (const 64 (-(2**20))) <=s u_531_549, u_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_549, v_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_549, r_531_549 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_549, s_531_549 <=s (const 64 ((2**20))),
    u_531_549 + v_531_549 <=s (const 64 (2**20)),
    u_531_549 - v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 + v_531_549 <=s (const 64 (2**20)),
    (const 64 0) - u_531_549 - v_531_549 <=s (const 64 (2**20)),
    r_531_549 + s_531_549 <=s (const 64 (2**20)),
    r_531_549 - s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 + s_531_549 <=s (const 64 (2**20)),
    (const 64 0) - r_531_549 - s_531_549 <=s (const 64 (2**20)),
    u_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_531_549 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_531_549 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step549

// premise c
assume
neg_g_531_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_19 neg_g_531_low60_0_low20_18;
mov u_531_550 r_531_549;
mov v_531_550 s_531_549;

subs dc neg_g_531_low60_0_low20_19 neg_g_531_low60_0_low20_18 neg_f_531_low60_0_low20_18;
asr neg_g_531_low60_0_low20_19 neg_g_531_low60_0_low20_19 1;
subs dc r_531_550 r_531_549 u_531_549;
asr r_531_550 r_531_550 1;
subs dc s_531_550 s_531_549 v_531_549;
asr s_531_550 s_531_550 1;
assert
    true
&&
    neg_f_531_low60_0_low20_19 = neg_g_531_low60_0_low20_18,
    u_531_550 = r_531_549,
    v_531_550 = s_531_549,
    neg_g_531_low60_0_low20_19 * (const 64 2) = neg_g_531_low60_0_low20_18 - neg_f_531_low60_0_low20_18,
    r_531_550 * (const 64 2) = r_531_549 - u_531_549,
    s_531_550 * (const 64 2) = s_531_549 - v_531_549
;

assume
    neg_f_531_low60_0_low20_19 = neg_g_531_low60_0_low20_18,
    u_531_550 = r_531_549,
    v_531_550 = s_531_549,
    neg_g_531_low60_0_low20_19 * 2 = neg_g_531_low60_0_low20_18 - neg_f_531_low60_0_low20_18,
    r_531_550 * 2 = r_531_549 - u_531_549,
    s_531_550 * 2 = s_531_549 - v_531_549
&&
    true
;

{
    u_531_550 * neg_f_531_low60_0_low20_0 + v_531_550 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_550 * neg_f_531_low60_0_low20_0 + s_531_550 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_19 + u_531_550 * (const 64 (2**21)) + v_531_550 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_19 + r_531_550 * (const 64 (2**21)) + s_531_550 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_19,
    neg_f_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_19,
    neg_g_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 550)) <=s delta, delta <=s (const 64 (1 + 2*550)),
    (const 64 (-(2**20))) <=s u_531_550, u_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_550, v_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_550, r_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_550, s_531_550 <=s (const 64 ((2**20))),
    u_531_550 + v_531_550 <=s (const 64 (2**20)),
    u_531_550 - v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 + v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 - v_531_550 <=s (const 64 (2**20)),
    r_531_550 + s_531_550 <=s (const 64 (2**20)),
    r_531_550 - s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 + s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 - s_531_550 <=s (const 64 (2**20)),
    u_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_531_550 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_550_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_19,
sint64 neg_g_531_low60_0_low20_19,
sint64 neg_f_531_low60_0_low20_20,
sint64 neg_g_531_low60_0_low20_20,
sint64 u_531_550,
sint64 v_531_550,
sint64 r_531_550,
sint64 s_531_550,
sint64 u_531_551,
sint64 v_531_551,
sint64 r_531_551,
sint64 s_531_551,
bit ne
)={
    u_531_550 * neg_f_531_low60_0_low20_0 + v_531_550 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_19 * (-(2**20)),
    r_531_550 * neg_f_531_low60_0_low20_0 + s_531_550 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_19 * (-(2**20))
&&
    u_531_550 * neg_f_531_low60_0_low20_0 + v_531_550 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_19 * (const 64 (-(2**20))),
    r_531_550 * neg_f_531_low60_0_low20_0 + s_531_550 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_19 + u_531_550 * (const 64 (2**21)) + v_531_550 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_19 + r_531_550 * (const 64 (2**21)) + s_531_550 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_19,
    neg_f_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_19,
    neg_g_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 550)) <=s delta, delta <=s (const 64 (1 + 2*550)),
    (const 64 (-(2**20))) <=s u_531_550, u_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_550, v_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_550, r_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_550, s_531_550 <=s (const 64 ((2**20))),
    u_531_550 + v_531_550 <=s (const 64 (2**20)),
    u_531_550 - v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 + v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 - v_531_550 <=s (const 64 (2**20)),
    r_531_550 + s_531_550 <=s (const 64 (2**20)),
    r_531_550 - s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 + s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 - s_531_550 <=s (const 64 (2**20)),
    u_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_531_550 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step550

// premise a
assume
neg_g_531_low60_0_low20_19 = 0 (mod 2)
&&
neg_g_531_low60_0_low20_19 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_0_low20_20 neg_f_531_low60_0_low20_19;
mov u_531_551 u_531_550;
mov v_531_551 v_531_550;

asr neg_g_531_low60_0_low20_20 neg_g_531_low60_0_low20_19 1;
asr r_531_551 r_531_550 1;
asr s_531_551 s_531_550 1;
assert
    true
&&
    neg_f_531_low60_0_low20_20 = neg_f_531_low60_0_low20_19,
    u_531_551 = u_531_550,
    v_531_551 = v_531_550,
    neg_g_531_low60_0_low20_20 * (const 64 2) = neg_g_531_low60_0_low20_19,
    r_531_551 * (const 64 2) = r_531_550,
    s_531_551 * (const 64 2) = s_531_550
;

assume
    neg_f_531_low60_0_low20_20 = neg_f_531_low60_0_low20_19,
    u_531_551 = u_531_550,
    v_531_551 = v_531_550,
    neg_g_531_low60_0_low20_20 * 2 = neg_g_531_low60_0_low20_19,
    r_531_551 * 2 = r_531_550,
    s_531_551 * 2 = s_531_550
&&
    true
;

{
    u_531_551 * neg_f_531_low60_0_low20_0 + v_531_551 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_551 * neg_f_531_low60_0_low20_0 + s_531_551 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_20 + u_531_551 * (const 64 (2**21)) + v_531_551 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_20 + r_531_551 * (const 64 (2**21)) + s_531_551 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_20,
    neg_f_531_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_20,
    neg_g_531_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 551)) <=s delta, delta <=s (const 64 (1 + 2*551)),
    (const 64 (-(2**20))) <=s u_531_551, u_531_551 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_551, v_531_551 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_551, r_531_551 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_551, s_531_551 <=s (const 64 ((2**20))),
    u_531_551 + v_531_551 <=s (const 64 (2**20)),
    u_531_551 - v_531_551 <=s (const 64 (2**20)),
    (const 64 0) - u_531_551 + v_531_551 <=s (const 64 (2**20)),
    (const 64 0) - u_531_551 - v_531_551 <=s (const 64 (2**20)),
    r_531_551 + s_531_551 <=s (const 64 (2**20)),
    r_531_551 - s_531_551 <=s (const 64 (2**20)),
    (const 64 0) - r_531_551 + s_531_551 <=s (const 64 (2**20)),
    (const 64 0) - r_531_551 - s_531_551 <=s (const 64 (2**20)),
    u_531_551 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_531_551 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_531_551 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_531_551 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_550_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_19,
sint64 neg_g_531_low60_0_low20_19,
sint64 neg_f_531_low60_0_low20_20,
sint64 neg_g_531_low60_0_low20_20,
sint64 u_531_550,
sint64 v_531_550,
sint64 r_531_550,
sint64 s_531_550,
sint64 u_531_551,
sint64 v_531_551,
sint64 r_531_551,
sint64 s_531_551,
bit ne
)={
    u_531_550 * neg_f_531_low60_0_low20_0 + v_531_550 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_19 * (-(2**20)),
    r_531_550 * neg_f_531_low60_0_low20_0 + s_531_550 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_19 * (-(2**20))
&&
    u_531_550 * neg_f_531_low60_0_low20_0 + v_531_550 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_19 * (const 64 (-(2**20))),
    r_531_550 * neg_f_531_low60_0_low20_0 + s_531_550 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_19 + u_531_550 * (const 64 (2**21)) + v_531_550 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_19 + r_531_550 * (const 64 (2**21)) + s_531_550 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_19,
    neg_f_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_19,
    neg_g_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 550)) <=s delta, delta <=s (const 64 (1 + 2*550)),
    (const 64 (-(2**20))) <=s u_531_550, u_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_550, v_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_550, r_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_550, s_531_550 <=s (const 64 ((2**20))),
    u_531_550 + v_531_550 <=s (const 64 (2**20)),
    u_531_550 - v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 + v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 - v_531_550 <=s (const 64 (2**20)),
    r_531_550 + s_531_550 <=s (const 64 (2**20)),
    r_531_550 - s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 + s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 - s_531_550 <=s (const 64 (2**20)),
    u_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_531_550 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step550

// premise b
assume
neg_g_531_low60_0_low20_19 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_20 neg_f_531_low60_0_low20_19;
mov u_531_551 u_531_550;
mov v_531_551 v_531_550;

add neg_g_531_low60_0_low20_20 neg_g_531_low60_0_low20_19 neg_f_531_low60_0_low20_19;
asr neg_g_531_low60_0_low20_20 neg_g_531_low60_0_low20_20 1;
add r_531_551 r_531_550 u_531_550;
asr r_531_551 r_531_551 1;
add s_531_551 s_531_550 v_531_550;
asr s_531_551 s_531_551 1;
assert
    true
&&
    neg_f_531_low60_0_low20_20 = neg_f_531_low60_0_low20_19,
    u_531_551 = u_531_550,
    v_531_551 = v_531_550,
    neg_g_531_low60_0_low20_20 * (const 64 2) = neg_g_531_low60_0_low20_19 + neg_f_531_low60_0_low20_19,
    r_531_551 * (const 64 2) = r_531_550 + u_531_550,
    s_531_551 * (const 64 2) = s_531_550 + v_531_550
;

assume
    neg_f_531_low60_0_low20_20 = neg_f_531_low60_0_low20_19,
    u_531_551 = u_531_550,
    v_531_551 = v_531_550,
    neg_g_531_low60_0_low20_20 * 2 = neg_g_531_low60_0_low20_19 + neg_f_531_low60_0_low20_19,
    r_531_551 * 2 = r_531_550 + u_531_550,
    s_531_551 * 2 = s_531_550 + v_531_550
&&
    true
;

{
    u_531_551 * neg_f_531_low60_0_low20_0 + v_531_551 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_551 * neg_f_531_low60_0_low20_0 + s_531_551 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_20 + u_531_551 * (const 64 (2**21)) + v_531_551 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_20 + r_531_551 * (const 64 (2**21)) + s_531_551 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_20,
    neg_f_531_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_20,
    neg_g_531_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 551)) <=s delta, delta <=s (const 64 (1 + 2*551)),
    (const 64 (-(2**20))) <=s u_531_551, u_531_551 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_551, v_531_551 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_551, r_531_551 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_551, s_531_551 <=s (const 64 ((2**20))),
    u_531_551 + v_531_551 <=s (const 64 (2**20)),
    u_531_551 - v_531_551 <=s (const 64 (2**20)),
    (const 64 0) - u_531_551 + v_531_551 <=s (const 64 (2**20)),
    (const 64 0) - u_531_551 - v_531_551 <=s (const 64 (2**20)),
    r_531_551 + s_531_551 <=s (const 64 (2**20)),
    r_531_551 - s_531_551 <=s (const 64 (2**20)),
    (const 64 0) - r_531_551 + s_531_551 <=s (const 64 (2**20)),
    (const 64 0) - r_531_551 - s_531_551 <=s (const 64 (2**20)),
    u_531_551 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_531_551 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_531_551 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_531_551 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_550_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_0_low20_0,
sint64 neg_g_531_low60_0_low20_0,
sint64 neg_f_531_low60_0_low20_19,
sint64 neg_g_531_low60_0_low20_19,
sint64 neg_f_531_low60_0_low20_20,
sint64 neg_g_531_low60_0_low20_20,
sint64 u_531_550,
sint64 v_531_550,
sint64 r_531_550,
sint64 s_531_550,
sint64 u_531_551,
sint64 v_531_551,
sint64 r_531_551,
sint64 s_531_551,
bit ne
)={
    u_531_550 * neg_f_531_low60_0_low20_0 + v_531_550 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_19 * (-(2**20)),
    r_531_550 * neg_f_531_low60_0_low20_0 + s_531_550 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_19 * (-(2**20))
&&
    u_531_550 * neg_f_531_low60_0_low20_0 + v_531_550 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_19 * (const 64 (-(2**20))),
    r_531_550 * neg_f_531_low60_0_low20_0 + s_531_550 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_0_low20_19 + u_531_550 * (const 64 (2**21)) + v_531_550 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_19 + r_531_550 * (const 64 (2**21)) + s_531_550 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_0_low20_0,
    neg_f_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_0,
    neg_g_531_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_0_low20_19,
    neg_f_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_0_low20_19,
    neg_g_531_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 550)) <=s delta, delta <=s (const 64 (1 + 2*550)),
    (const 64 (-(2**20))) <=s u_531_550, u_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_550, v_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_550, r_531_550 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_550, s_531_550 <=s (const 64 ((2**20))),
    u_531_550 + v_531_550 <=s (const 64 (2**20)),
    u_531_550 - v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 + v_531_550 <=s (const 64 (2**20)),
    (const 64 0) - u_531_550 - v_531_550 <=s (const 64 (2**20)),
    r_531_550 + s_531_550 <=s (const 64 (2**20)),
    r_531_550 - s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 + s_531_550 <=s (const 64 (2**20)),
    (const 64 0) - r_531_550 - s_531_550 <=s (const 64 (2**20)),
    u_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_531_550 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_531_550 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step550

// premise c
assume
neg_g_531_low60_0_low20_19 = 1 (mod 2)
&&
neg_g_531_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_0_low20_20 neg_g_531_low60_0_low20_19;
mov u_531_551 r_531_550;
mov v_531_551 s_531_550;

subs dc neg_g_531_low60_0_low20_20 neg_g_531_low60_0_low20_19 neg_f_531_low60_0_low20_19;
asr neg_g_531_low60_0_low20_20 neg_g_531_low60_0_low20_20 1;
subs dc r_531_551 r_531_550 u_531_550;
asr r_531_551 r_531_551 1;
subs dc s_531_551 s_531_550 v_531_550;
asr s_531_551 s_531_551 1;
assert
    true
&&
    neg_f_531_low60_0_low20_20 = neg_g_531_low60_0_low20_19,
    u_531_551 = r_531_550,
    v_531_551 = s_531_550,
    neg_g_531_low60_0_low20_20 * (const 64 2) = neg_g_531_low60_0_low20_19 - neg_f_531_low60_0_low20_19,
    r_531_551 * (const 64 2) = r_531_550 - u_531_550,
    s_531_551 * (const 64 2) = s_531_550 - v_531_550
;

assume
    neg_f_531_low60_0_low20_20 = neg_g_531_low60_0_low20_19,
    u_531_551 = r_531_550,
    v_531_551 = s_531_550,
    neg_g_531_low60_0_low20_20 * 2 = neg_g_531_low60_0_low20_19 - neg_f_531_low60_0_low20_19,
    r_531_551 * 2 = r_531_550 - u_531_550,
    s_531_551 * 2 = s_531_550 - v_531_550
&&
    true
;

{
    u_531_551 * neg_f_531_low60_0_low20_0 + v_531_551 * neg_g_531_low60_0_low20_0 = neg_f_531_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_531_551 * neg_f_531_low60_0_low20_0 + s_531_551 * neg_g_531_low60_0_low20_0 = neg_g_531_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_0_low20_20 + u_531_551 * (const 64 (2**21)) + v_531_551 * (const 64 (2**42)),
    grs = neg_g_531_low60_0_low20_20 + r_531_551 * (const 64 (2**21)) + s_531_551 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_0_low20_20,
    neg_f_531_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_0_low20_20,
    neg_g_531_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 551)) <=s delta, delta <=s (const 64 (1 + 2*551)),
    (const 64 (-(2**20))) <=s u_531_551, u_531_551 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_531_551, v_531_551 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_531_551, r_531_551 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_531_551, s_531_551 <=s (const 64 ((2**20))),
    u_531_551 + v_531_551 <=s (const 64 (2**20)),
    u_531_551 - v_531_551 <=s (const 64 (2**20)),
    (const 64 0) - u_531_551 + v_531_551 <=s (const 64 (2**20)),
    (const 64 0) - u_531_551 - v_531_551 <=s (const 64 (2**20)),
    r_531_551 + s_531_551 <=s (const 64 (2**20)),
    r_531_551 - s_531_551 <=s (const 64 (2**20)),
    (const 64 0) - r_531_551 + s_531_551 <=s (const 64 (2**20)),
    (const 64 0) - r_531_551 - s_531_551 <=s (const 64 (2**20)),
    u_531_551 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_531_551 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_531_551 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_531_551 = (const 64 0) (mod (const 64 (2**(20-20))))
}

