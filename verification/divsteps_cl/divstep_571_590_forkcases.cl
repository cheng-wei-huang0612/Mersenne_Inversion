proc divstep_571_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_1,
sint64 neg_g_531_low60_40_low20_1,
sint64 u_571_571,
sint64 v_571_571,
sint64 r_571_571,
sint64 s_571_571,
sint64 u_571_572,
sint64 v_571_572,
sint64 r_571_572,
sint64 s_571_572,
bit ne
)={
    u_571_571 * neg_f_531_low60_40_low20_0 + v_571_571 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_0 * (-(2**20)),
    r_571_571 * neg_f_531_low60_40_low20_0 + s_571_571 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_0 * (-(2**20))
&&
    u_571_571 * neg_f_531_low60_40_low20_0 + v_571_571 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_0 * (const 64 (-(2**20))),
    r_571_571 * neg_f_531_low60_40_low20_0 + s_571_571 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_0 + u_571_571 * (const 64 (2**21)) + v_571_571 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_0 + r_571_571 * (const 64 (2**21)) + s_571_571 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 571)) <=s delta, delta <=s (const 64 (1 + 2*571)),
    u_571_571 = (const 64 (-(2**20))),
    v_571_571 = (const 64 (0)),
    r_571_571 = (const 64 (0)),
    s_571_571 = (const 64 (-(2**20)))
}



// divsteps
// step571

// premise a
assume
neg_g_531_low60_40_low20_0 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_1 neg_f_531_low60_40_low20_0;
mov u_571_572 u_571_571;
mov v_571_572 v_571_571;

asr neg_g_531_low60_40_low20_1 neg_g_531_low60_40_low20_0 1;
asr r_571_572 r_571_571 1;
asr s_571_572 s_571_571 1;
assert
    true
&&
    neg_f_531_low60_40_low20_1 = neg_f_531_low60_40_low20_0,
    u_571_572 = u_571_571,
    v_571_572 = v_571_571,
    neg_g_531_low60_40_low20_1 * (const 64 2) = neg_g_531_low60_40_low20_0,
    r_571_572 * (const 64 2) = r_571_571,
    s_571_572 * (const 64 2) = s_571_571
;

assume
    neg_f_531_low60_40_low20_1 = neg_f_531_low60_40_low20_0,
    u_571_572 = u_571_571,
    v_571_572 = v_571_571,
    neg_g_531_low60_40_low20_1 * 2 = neg_g_531_low60_40_low20_0,
    r_571_572 * 2 = r_571_571,
    s_571_572 * 2 = s_571_571
&&
    true
;

{
    u_571_572 * neg_f_531_low60_40_low20_0 + v_571_572 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_572 * neg_f_531_low60_40_low20_0 + s_571_572 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_1 + u_571_572 * (const 64 (2**21)) + v_571_572 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_1 + r_571_572 * (const 64 (2**21)) + s_571_572 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_1,
    neg_f_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_1,
    neg_g_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 572)) <=s delta, delta <=s (const 64 (1 + 2*572)),
    (const 64 (-(2**20))) <=s u_571_572, u_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_572, v_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_572, r_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_572, s_571_572 <=s (const 64 ((2**20)-1)),
    u_571_572 + v_571_572 <=s (const 64 (2**20)),
    u_571_572 - v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 + v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 - v_571_572 <=s (const 64 (2**20)),
    r_571_572 + s_571_572 <=s (const 64 (2**20)),
    r_571_572 - s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 + s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 - s_571_572 <=s (const 64 (2**20)),
    u_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_571_572 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_571_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_1,
sint64 neg_g_531_low60_40_low20_1,
sint64 u_571_571,
sint64 v_571_571,
sint64 r_571_571,
sint64 s_571_571,
sint64 u_571_572,
sint64 v_571_572,
sint64 r_571_572,
sint64 s_571_572,
bit ne
)={
    u_571_571 * neg_f_531_low60_40_low20_0 + v_571_571 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_0 * (-(2**20)),
    r_571_571 * neg_f_531_low60_40_low20_0 + s_571_571 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_0 * (-(2**20))
&&
    u_571_571 * neg_f_531_low60_40_low20_0 + v_571_571 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_0 * (const 64 (-(2**20))),
    r_571_571 * neg_f_531_low60_40_low20_0 + s_571_571 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_0 + u_571_571 * (const 64 (2**21)) + v_571_571 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_0 + r_571_571 * (const 64 (2**21)) + s_571_571 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 571)) <=s delta, delta <=s (const 64 (1 + 2*571)),
    u_571_571 = (const 64 (-(2**20))),
    v_571_571 = (const 64 (0)),
    r_571_571 = (const 64 (0)),
    s_571_571 = (const 64 (-(2**20)))
}



// divsteps
// step571

// premise b
assume
neg_g_531_low60_40_low20_0 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_1 neg_f_531_low60_40_low20_0;
mov u_571_572 u_571_571;
mov v_571_572 v_571_571;

add neg_g_531_low60_40_low20_1 neg_g_531_low60_40_low20_0 neg_f_531_low60_40_low20_0;
asr neg_g_531_low60_40_low20_1 neg_g_531_low60_40_low20_1 1;
add r_571_572 r_571_571 u_571_571;
asr r_571_572 r_571_572 1;
add s_571_572 s_571_571 v_571_571;
asr s_571_572 s_571_572 1;
assert
    true
&&
    neg_f_531_low60_40_low20_1 = neg_f_531_low60_40_low20_0,
    u_571_572 = u_571_571,
    v_571_572 = v_571_571,
    neg_g_531_low60_40_low20_1 * (const 64 2) = neg_g_531_low60_40_low20_0 + neg_f_531_low60_40_low20_0,
    r_571_572 * (const 64 2) = r_571_571 + u_571_571,
    s_571_572 * (const 64 2) = s_571_571 + v_571_571
;

assume
    neg_f_531_low60_40_low20_1 = neg_f_531_low60_40_low20_0,
    u_571_572 = u_571_571,
    v_571_572 = v_571_571,
    neg_g_531_low60_40_low20_1 * 2 = neg_g_531_low60_40_low20_0 + neg_f_531_low60_40_low20_0,
    r_571_572 * 2 = r_571_571 + u_571_571,
    s_571_572 * 2 = s_571_571 + v_571_571
&&
    true
;

{
    u_571_572 * neg_f_531_low60_40_low20_0 + v_571_572 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_572 * neg_f_531_low60_40_low20_0 + s_571_572 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_1 + u_571_572 * (const 64 (2**21)) + v_571_572 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_1 + r_571_572 * (const 64 (2**21)) + s_571_572 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_1,
    neg_f_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_1,
    neg_g_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 572)) <=s delta, delta <=s (const 64 (1 + 2*572)),
    (const 64 (-(2**20))) <=s u_571_572, u_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_572, v_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_572, r_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_572, s_571_572 <=s (const 64 ((2**20)-1)),
    u_571_572 + v_571_572 <=s (const 64 (2**20)),
    u_571_572 - v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 + v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 - v_571_572 <=s (const 64 (2**20)),
    r_571_572 + s_571_572 <=s (const 64 (2**20)),
    r_571_572 - s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 + s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 - s_571_572 <=s (const 64 (2**20)),
    u_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_571_572 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_571_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_1,
sint64 neg_g_531_low60_40_low20_1,
sint64 u_571_571,
sint64 v_571_571,
sint64 r_571_571,
sint64 s_571_571,
sint64 u_571_572,
sint64 v_571_572,
sint64 r_571_572,
sint64 s_571_572,
bit ne
)={
    u_571_571 * neg_f_531_low60_40_low20_0 + v_571_571 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_0 * (-(2**20)),
    r_571_571 * neg_f_531_low60_40_low20_0 + s_571_571 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_0 * (-(2**20))
&&
    u_571_571 * neg_f_531_low60_40_low20_0 + v_571_571 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_0 * (const 64 (-(2**20))),
    r_571_571 * neg_f_531_low60_40_low20_0 + s_571_571 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_0 + u_571_571 * (const 64 (2**21)) + v_571_571 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_0 + r_571_571 * (const 64 (2**21)) + s_571_571 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 571)) <=s delta, delta <=s (const 64 (1 + 2*571)),
    u_571_571 = (const 64 (-(2**20))),
    v_571_571 = (const 64 (0)),
    r_571_571 = (const 64 (0)),
    s_571_571 = (const 64 (-(2**20)))
}



// divsteps
// step571

// premise c
assume
neg_g_531_low60_40_low20_0 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_1 neg_g_531_low60_40_low20_0;
mov u_571_572 r_571_571;
mov v_571_572 s_571_571;

subs dc neg_g_531_low60_40_low20_1 neg_g_531_low60_40_low20_0 neg_f_531_low60_40_low20_0;
asr neg_g_531_low60_40_low20_1 neg_g_531_low60_40_low20_1 1;
subs dc r_571_572 r_571_571 u_571_571;
asr r_571_572 r_571_572 1;
subs dc s_571_572 s_571_571 v_571_571;
asr s_571_572 s_571_572 1;
assert
    true
&&
    neg_f_531_low60_40_low20_1 = neg_g_531_low60_40_low20_0,
    u_571_572 = r_571_571,
    v_571_572 = s_571_571,
    neg_g_531_low60_40_low20_1 * (const 64 2) = neg_g_531_low60_40_low20_0 - neg_f_531_low60_40_low20_0,
    r_571_572 * (const 64 2) = r_571_571 - u_571_571,
    s_571_572 * (const 64 2) = s_571_571 - v_571_571
;

assume
    neg_f_531_low60_40_low20_1 = neg_g_531_low60_40_low20_0,
    u_571_572 = r_571_571,
    v_571_572 = s_571_571,
    neg_g_531_low60_40_low20_1 * 2 = neg_g_531_low60_40_low20_0 - neg_f_531_low60_40_low20_0,
    r_571_572 * 2 = r_571_571 - u_571_571,
    s_571_572 * 2 = s_571_571 - v_571_571
&&
    true
;

{
    u_571_572 * neg_f_531_low60_40_low20_0 + v_571_572 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_572 * neg_f_531_low60_40_low20_0 + s_571_572 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_1 + u_571_572 * (const 64 (2**21)) + v_571_572 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_1 + r_571_572 * (const 64 (2**21)) + s_571_572 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_1,
    neg_f_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_1,
    neg_g_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 572)) <=s delta, delta <=s (const 64 (1 + 2*572)),
    (const 64 (-(2**20))) <=s u_571_572, u_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_572, v_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_572, r_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_572, s_571_572 <=s (const 64 ((2**20)-1)),
    u_571_572 + v_571_572 <=s (const 64 (2**20)),
    u_571_572 - v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 + v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 - v_571_572 <=s (const 64 (2**20)),
    r_571_572 + s_571_572 <=s (const 64 (2**20)),
    r_571_572 - s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 + s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 - s_571_572 <=s (const 64 (2**20)),
    u_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_571_572 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_572_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_1,
sint64 neg_g_531_low60_40_low20_1,
sint64 neg_f_531_low60_40_low20_2,
sint64 neg_g_531_low60_40_low20_2,
sint64 u_571_572,
sint64 v_571_572,
sint64 r_571_572,
sint64 s_571_572,
sint64 u_571_573,
sint64 v_571_573,
sint64 r_571_573,
sint64 s_571_573,
bit ne
)={
    u_571_572 * neg_f_531_low60_40_low20_0 + v_571_572 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_1 * (-(2**20)),
    r_571_572 * neg_f_531_low60_40_low20_0 + s_571_572 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_1 * (-(2**20))
&&
    u_571_572 * neg_f_531_low60_40_low20_0 + v_571_572 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_1 * (const 64 (-(2**20))),
    r_571_572 * neg_f_531_low60_40_low20_0 + s_571_572 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_1 + u_571_572 * (const 64 (2**21)) + v_571_572 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_1 + r_571_572 * (const 64 (2**21)) + s_571_572 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_1,
    neg_f_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_1,
    neg_g_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 572)) <=s delta, delta <=s (const 64 (1 + 2*572)),
    (const 64 (-(2**20))) <=s u_571_572, u_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_572, v_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_572, r_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_572, s_571_572 <=s (const 64 ((2**20)-1)),
    u_571_572 + v_571_572 <=s (const 64 (2**20)),
    u_571_572 - v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 + v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 - v_571_572 <=s (const 64 (2**20)),
    r_571_572 + s_571_572 <=s (const 64 (2**20)),
    r_571_572 - s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 + s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 - s_571_572 <=s (const 64 (2**20)),
    u_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_571_572 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step572

// premise a
assume
neg_g_531_low60_40_low20_1 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_1 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_2 neg_f_531_low60_40_low20_1;
mov u_571_573 u_571_572;
mov v_571_573 v_571_572;

asr neg_g_531_low60_40_low20_2 neg_g_531_low60_40_low20_1 1;
asr r_571_573 r_571_572 1;
asr s_571_573 s_571_572 1;
assert
    true
&&
    neg_f_531_low60_40_low20_2 = neg_f_531_low60_40_low20_1,
    u_571_573 = u_571_572,
    v_571_573 = v_571_572,
    neg_g_531_low60_40_low20_2 * (const 64 2) = neg_g_531_low60_40_low20_1,
    r_571_573 * (const 64 2) = r_571_572,
    s_571_573 * (const 64 2) = s_571_572
;

assume
    neg_f_531_low60_40_low20_2 = neg_f_531_low60_40_low20_1,
    u_571_573 = u_571_572,
    v_571_573 = v_571_572,
    neg_g_531_low60_40_low20_2 * 2 = neg_g_531_low60_40_low20_1,
    r_571_573 * 2 = r_571_572,
    s_571_573 * 2 = s_571_572
&&
    true
;

{
    u_571_573 * neg_f_531_low60_40_low20_0 + v_571_573 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_573 * neg_f_531_low60_40_low20_0 + s_571_573 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_2 + u_571_573 * (const 64 (2**21)) + v_571_573 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_2 + r_571_573 * (const 64 (2**21)) + s_571_573 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_2,
    neg_f_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_2,
    neg_g_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 573)) <=s delta, delta <=s (const 64 (1 + 2*573)),
    (const 64 (-(2**20))) <=s u_571_573, u_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_573, v_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_573, r_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_573, s_571_573 <=s (const 64 ((2**20)-1)),
    u_571_573 + v_571_573 <=s (const 64 (2**20)),
    u_571_573 - v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 + v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 - v_571_573 <=s (const 64 (2**20)),
    r_571_573 + s_571_573 <=s (const 64 (2**20)),
    r_571_573 - s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 + s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 - s_571_573 <=s (const 64 (2**20)),
    u_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_571_573 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_572_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_1,
sint64 neg_g_531_low60_40_low20_1,
sint64 neg_f_531_low60_40_low20_2,
sint64 neg_g_531_low60_40_low20_2,
sint64 u_571_572,
sint64 v_571_572,
sint64 r_571_572,
sint64 s_571_572,
sint64 u_571_573,
sint64 v_571_573,
sint64 r_571_573,
sint64 s_571_573,
bit ne
)={
    u_571_572 * neg_f_531_low60_40_low20_0 + v_571_572 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_1 * (-(2**20)),
    r_571_572 * neg_f_531_low60_40_low20_0 + s_571_572 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_1 * (-(2**20))
&&
    u_571_572 * neg_f_531_low60_40_low20_0 + v_571_572 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_1 * (const 64 (-(2**20))),
    r_571_572 * neg_f_531_low60_40_low20_0 + s_571_572 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_1 + u_571_572 * (const 64 (2**21)) + v_571_572 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_1 + r_571_572 * (const 64 (2**21)) + s_571_572 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_1,
    neg_f_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_1,
    neg_g_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 572)) <=s delta, delta <=s (const 64 (1 + 2*572)),
    (const 64 (-(2**20))) <=s u_571_572, u_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_572, v_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_572, r_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_572, s_571_572 <=s (const 64 ((2**20)-1)),
    u_571_572 + v_571_572 <=s (const 64 (2**20)),
    u_571_572 - v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 + v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 - v_571_572 <=s (const 64 (2**20)),
    r_571_572 + s_571_572 <=s (const 64 (2**20)),
    r_571_572 - s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 + s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 - s_571_572 <=s (const 64 (2**20)),
    u_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_571_572 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step572

// premise b
assume
neg_g_531_low60_40_low20_1 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_2 neg_f_531_low60_40_low20_1;
mov u_571_573 u_571_572;
mov v_571_573 v_571_572;

add neg_g_531_low60_40_low20_2 neg_g_531_low60_40_low20_1 neg_f_531_low60_40_low20_1;
asr neg_g_531_low60_40_low20_2 neg_g_531_low60_40_low20_2 1;
add r_571_573 r_571_572 u_571_572;
asr r_571_573 r_571_573 1;
add s_571_573 s_571_572 v_571_572;
asr s_571_573 s_571_573 1;
assert
    true
&&
    neg_f_531_low60_40_low20_2 = neg_f_531_low60_40_low20_1,
    u_571_573 = u_571_572,
    v_571_573 = v_571_572,
    neg_g_531_low60_40_low20_2 * (const 64 2) = neg_g_531_low60_40_low20_1 + neg_f_531_low60_40_low20_1,
    r_571_573 * (const 64 2) = r_571_572 + u_571_572,
    s_571_573 * (const 64 2) = s_571_572 + v_571_572
;

assume
    neg_f_531_low60_40_low20_2 = neg_f_531_low60_40_low20_1,
    u_571_573 = u_571_572,
    v_571_573 = v_571_572,
    neg_g_531_low60_40_low20_2 * 2 = neg_g_531_low60_40_low20_1 + neg_f_531_low60_40_low20_1,
    r_571_573 * 2 = r_571_572 + u_571_572,
    s_571_573 * 2 = s_571_572 + v_571_572
&&
    true
;

{
    u_571_573 * neg_f_531_low60_40_low20_0 + v_571_573 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_573 * neg_f_531_low60_40_low20_0 + s_571_573 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_2 + u_571_573 * (const 64 (2**21)) + v_571_573 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_2 + r_571_573 * (const 64 (2**21)) + s_571_573 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_2,
    neg_f_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_2,
    neg_g_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 573)) <=s delta, delta <=s (const 64 (1 + 2*573)),
    (const 64 (-(2**20))) <=s u_571_573, u_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_573, v_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_573, r_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_573, s_571_573 <=s (const 64 ((2**20)-1)),
    u_571_573 + v_571_573 <=s (const 64 (2**20)),
    u_571_573 - v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 + v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 - v_571_573 <=s (const 64 (2**20)),
    r_571_573 + s_571_573 <=s (const 64 (2**20)),
    r_571_573 - s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 + s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 - s_571_573 <=s (const 64 (2**20)),
    u_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_571_573 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_572_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_1,
sint64 neg_g_531_low60_40_low20_1,
sint64 neg_f_531_low60_40_low20_2,
sint64 neg_g_531_low60_40_low20_2,
sint64 u_571_572,
sint64 v_571_572,
sint64 r_571_572,
sint64 s_571_572,
sint64 u_571_573,
sint64 v_571_573,
sint64 r_571_573,
sint64 s_571_573,
bit ne
)={
    u_571_572 * neg_f_531_low60_40_low20_0 + v_571_572 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_1 * (-(2**20)),
    r_571_572 * neg_f_531_low60_40_low20_0 + s_571_572 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_1 * (-(2**20))
&&
    u_571_572 * neg_f_531_low60_40_low20_0 + v_571_572 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_1 * (const 64 (-(2**20))),
    r_571_572 * neg_f_531_low60_40_low20_0 + s_571_572 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_1 + u_571_572 * (const 64 (2**21)) + v_571_572 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_1 + r_571_572 * (const 64 (2**21)) + s_571_572 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_1,
    neg_f_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_1,
    neg_g_531_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 572)) <=s delta, delta <=s (const 64 (1 + 2*572)),
    (const 64 (-(2**20))) <=s u_571_572, u_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_572, v_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_572, r_571_572 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_572, s_571_572 <=s (const 64 ((2**20)-1)),
    u_571_572 + v_571_572 <=s (const 64 (2**20)),
    u_571_572 - v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 + v_571_572 <=s (const 64 (2**20)),
    (const 64 0) - u_571_572 - v_571_572 <=s (const 64 (2**20)),
    r_571_572 + s_571_572 <=s (const 64 (2**20)),
    r_571_572 - s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 + s_571_572 <=s (const 64 (2**20)),
    (const 64 0) - r_571_572 - s_571_572 <=s (const 64 (2**20)),
    u_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_571_572 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_571_572 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step572

// premise c
assume
neg_g_531_low60_40_low20_1 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_2 neg_g_531_low60_40_low20_1;
mov u_571_573 r_571_572;
mov v_571_573 s_571_572;

subs dc neg_g_531_low60_40_low20_2 neg_g_531_low60_40_low20_1 neg_f_531_low60_40_low20_1;
asr neg_g_531_low60_40_low20_2 neg_g_531_low60_40_low20_2 1;
subs dc r_571_573 r_571_572 u_571_572;
asr r_571_573 r_571_573 1;
subs dc s_571_573 s_571_572 v_571_572;
asr s_571_573 s_571_573 1;
assert
    true
&&
    neg_f_531_low60_40_low20_2 = neg_g_531_low60_40_low20_1,
    u_571_573 = r_571_572,
    v_571_573 = s_571_572,
    neg_g_531_low60_40_low20_2 * (const 64 2) = neg_g_531_low60_40_low20_1 - neg_f_531_low60_40_low20_1,
    r_571_573 * (const 64 2) = r_571_572 - u_571_572,
    s_571_573 * (const 64 2) = s_571_572 - v_571_572
;

assume
    neg_f_531_low60_40_low20_2 = neg_g_531_low60_40_low20_1,
    u_571_573 = r_571_572,
    v_571_573 = s_571_572,
    neg_g_531_low60_40_low20_2 * 2 = neg_g_531_low60_40_low20_1 - neg_f_531_low60_40_low20_1,
    r_571_573 * 2 = r_571_572 - u_571_572,
    s_571_573 * 2 = s_571_572 - v_571_572
&&
    true
;

{
    u_571_573 * neg_f_531_low60_40_low20_0 + v_571_573 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_573 * neg_f_531_low60_40_low20_0 + s_571_573 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_2 + u_571_573 * (const 64 (2**21)) + v_571_573 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_2 + r_571_573 * (const 64 (2**21)) + s_571_573 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_2,
    neg_f_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_2,
    neg_g_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 573)) <=s delta, delta <=s (const 64 (1 + 2*573)),
    (const 64 (-(2**20))) <=s u_571_573, u_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_573, v_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_573, r_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_573, s_571_573 <=s (const 64 ((2**20)-1)),
    u_571_573 + v_571_573 <=s (const 64 (2**20)),
    u_571_573 - v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 + v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 - v_571_573 <=s (const 64 (2**20)),
    r_571_573 + s_571_573 <=s (const 64 (2**20)),
    r_571_573 - s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 + s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 - s_571_573 <=s (const 64 (2**20)),
    u_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_571_573 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_573_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_2,
sint64 neg_g_531_low60_40_low20_2,
sint64 neg_f_531_low60_40_low20_3,
sint64 neg_g_531_low60_40_low20_3,
sint64 u_571_573,
sint64 v_571_573,
sint64 r_571_573,
sint64 s_571_573,
sint64 u_571_574,
sint64 v_571_574,
sint64 r_571_574,
sint64 s_571_574,
bit ne
)={
    u_571_573 * neg_f_531_low60_40_low20_0 + v_571_573 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_2 * (-(2**20)),
    r_571_573 * neg_f_531_low60_40_low20_0 + s_571_573 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_2 * (-(2**20))
&&
    u_571_573 * neg_f_531_low60_40_low20_0 + v_571_573 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_2 * (const 64 (-(2**20))),
    r_571_573 * neg_f_531_low60_40_low20_0 + s_571_573 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_2 + u_571_573 * (const 64 (2**21)) + v_571_573 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_2 + r_571_573 * (const 64 (2**21)) + s_571_573 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_2,
    neg_f_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_2,
    neg_g_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 573)) <=s delta, delta <=s (const 64 (1 + 2*573)),
    (const 64 (-(2**20))) <=s u_571_573, u_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_573, v_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_573, r_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_573, s_571_573 <=s (const 64 ((2**20)-1)),
    u_571_573 + v_571_573 <=s (const 64 (2**20)),
    u_571_573 - v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 + v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 - v_571_573 <=s (const 64 (2**20)),
    r_571_573 + s_571_573 <=s (const 64 (2**20)),
    r_571_573 - s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 + s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 - s_571_573 <=s (const 64 (2**20)),
    u_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_571_573 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step573

// premise a
assume
neg_g_531_low60_40_low20_2 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_2 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_3 neg_f_531_low60_40_low20_2;
mov u_571_574 u_571_573;
mov v_571_574 v_571_573;

asr neg_g_531_low60_40_low20_3 neg_g_531_low60_40_low20_2 1;
asr r_571_574 r_571_573 1;
asr s_571_574 s_571_573 1;
assert
    true
&&
    neg_f_531_low60_40_low20_3 = neg_f_531_low60_40_low20_2,
    u_571_574 = u_571_573,
    v_571_574 = v_571_573,
    neg_g_531_low60_40_low20_3 * (const 64 2) = neg_g_531_low60_40_low20_2,
    r_571_574 * (const 64 2) = r_571_573,
    s_571_574 * (const 64 2) = s_571_573
;

assume
    neg_f_531_low60_40_low20_3 = neg_f_531_low60_40_low20_2,
    u_571_574 = u_571_573,
    v_571_574 = v_571_573,
    neg_g_531_low60_40_low20_3 * 2 = neg_g_531_low60_40_low20_2,
    r_571_574 * 2 = r_571_573,
    s_571_574 * 2 = s_571_573
&&
    true
;

{
    u_571_574 * neg_f_531_low60_40_low20_0 + v_571_574 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_574 * neg_f_531_low60_40_low20_0 + s_571_574 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_3 + u_571_574 * (const 64 (2**21)) + v_571_574 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_3 + r_571_574 * (const 64 (2**21)) + s_571_574 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_3,
    neg_f_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_3,
    neg_g_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 574)) <=s delta, delta <=s (const 64 (1 + 2*574)),
    (const 64 (-(2**20))) <=s u_571_574, u_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_574, v_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_574, r_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_574, s_571_574 <=s (const 64 ((2**20)-1)),
    u_571_574 + v_571_574 <=s (const 64 (2**20)),
    u_571_574 - v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 + v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 - v_571_574 <=s (const 64 (2**20)),
    r_571_574 + s_571_574 <=s (const 64 (2**20)),
    r_571_574 - s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 + s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 - s_571_574 <=s (const 64 (2**20)),
    u_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_571_574 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_573_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_2,
sint64 neg_g_531_low60_40_low20_2,
sint64 neg_f_531_low60_40_low20_3,
sint64 neg_g_531_low60_40_low20_3,
sint64 u_571_573,
sint64 v_571_573,
sint64 r_571_573,
sint64 s_571_573,
sint64 u_571_574,
sint64 v_571_574,
sint64 r_571_574,
sint64 s_571_574,
bit ne
)={
    u_571_573 * neg_f_531_low60_40_low20_0 + v_571_573 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_2 * (-(2**20)),
    r_571_573 * neg_f_531_low60_40_low20_0 + s_571_573 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_2 * (-(2**20))
&&
    u_571_573 * neg_f_531_low60_40_low20_0 + v_571_573 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_2 * (const 64 (-(2**20))),
    r_571_573 * neg_f_531_low60_40_low20_0 + s_571_573 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_2 + u_571_573 * (const 64 (2**21)) + v_571_573 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_2 + r_571_573 * (const 64 (2**21)) + s_571_573 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_2,
    neg_f_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_2,
    neg_g_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 573)) <=s delta, delta <=s (const 64 (1 + 2*573)),
    (const 64 (-(2**20))) <=s u_571_573, u_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_573, v_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_573, r_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_573, s_571_573 <=s (const 64 ((2**20)-1)),
    u_571_573 + v_571_573 <=s (const 64 (2**20)),
    u_571_573 - v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 + v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 - v_571_573 <=s (const 64 (2**20)),
    r_571_573 + s_571_573 <=s (const 64 (2**20)),
    r_571_573 - s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 + s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 - s_571_573 <=s (const 64 (2**20)),
    u_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_571_573 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step573

// premise b
assume
neg_g_531_low60_40_low20_2 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_3 neg_f_531_low60_40_low20_2;
mov u_571_574 u_571_573;
mov v_571_574 v_571_573;

add neg_g_531_low60_40_low20_3 neg_g_531_low60_40_low20_2 neg_f_531_low60_40_low20_2;
asr neg_g_531_low60_40_low20_3 neg_g_531_low60_40_low20_3 1;
add r_571_574 r_571_573 u_571_573;
asr r_571_574 r_571_574 1;
add s_571_574 s_571_573 v_571_573;
asr s_571_574 s_571_574 1;
assert
    true
&&
    neg_f_531_low60_40_low20_3 = neg_f_531_low60_40_low20_2,
    u_571_574 = u_571_573,
    v_571_574 = v_571_573,
    neg_g_531_low60_40_low20_3 * (const 64 2) = neg_g_531_low60_40_low20_2 + neg_f_531_low60_40_low20_2,
    r_571_574 * (const 64 2) = r_571_573 + u_571_573,
    s_571_574 * (const 64 2) = s_571_573 + v_571_573
;

assume
    neg_f_531_low60_40_low20_3 = neg_f_531_low60_40_low20_2,
    u_571_574 = u_571_573,
    v_571_574 = v_571_573,
    neg_g_531_low60_40_low20_3 * 2 = neg_g_531_low60_40_low20_2 + neg_f_531_low60_40_low20_2,
    r_571_574 * 2 = r_571_573 + u_571_573,
    s_571_574 * 2 = s_571_573 + v_571_573
&&
    true
;

{
    u_571_574 * neg_f_531_low60_40_low20_0 + v_571_574 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_574 * neg_f_531_low60_40_low20_0 + s_571_574 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_3 + u_571_574 * (const 64 (2**21)) + v_571_574 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_3 + r_571_574 * (const 64 (2**21)) + s_571_574 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_3,
    neg_f_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_3,
    neg_g_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 574)) <=s delta, delta <=s (const 64 (1 + 2*574)),
    (const 64 (-(2**20))) <=s u_571_574, u_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_574, v_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_574, r_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_574, s_571_574 <=s (const 64 ((2**20)-1)),
    u_571_574 + v_571_574 <=s (const 64 (2**20)),
    u_571_574 - v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 + v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 - v_571_574 <=s (const 64 (2**20)),
    r_571_574 + s_571_574 <=s (const 64 (2**20)),
    r_571_574 - s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 + s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 - s_571_574 <=s (const 64 (2**20)),
    u_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_571_574 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_573_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_2,
sint64 neg_g_531_low60_40_low20_2,
sint64 neg_f_531_low60_40_low20_3,
sint64 neg_g_531_low60_40_low20_3,
sint64 u_571_573,
sint64 v_571_573,
sint64 r_571_573,
sint64 s_571_573,
sint64 u_571_574,
sint64 v_571_574,
sint64 r_571_574,
sint64 s_571_574,
bit ne
)={
    u_571_573 * neg_f_531_low60_40_low20_0 + v_571_573 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_2 * (-(2**20)),
    r_571_573 * neg_f_531_low60_40_low20_0 + s_571_573 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_2 * (-(2**20))
&&
    u_571_573 * neg_f_531_low60_40_low20_0 + v_571_573 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_2 * (const 64 (-(2**20))),
    r_571_573 * neg_f_531_low60_40_low20_0 + s_571_573 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_2 + u_571_573 * (const 64 (2**21)) + v_571_573 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_2 + r_571_573 * (const 64 (2**21)) + s_571_573 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_2,
    neg_f_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_2,
    neg_g_531_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 573)) <=s delta, delta <=s (const 64 (1 + 2*573)),
    (const 64 (-(2**20))) <=s u_571_573, u_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_573, v_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_573, r_571_573 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_573, s_571_573 <=s (const 64 ((2**20)-1)),
    u_571_573 + v_571_573 <=s (const 64 (2**20)),
    u_571_573 - v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 + v_571_573 <=s (const 64 (2**20)),
    (const 64 0) - u_571_573 - v_571_573 <=s (const 64 (2**20)),
    r_571_573 + s_571_573 <=s (const 64 (2**20)),
    r_571_573 - s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 + s_571_573 <=s (const 64 (2**20)),
    (const 64 0) - r_571_573 - s_571_573 <=s (const 64 (2**20)),
    u_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_571_573 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_571_573 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step573

// premise c
assume
neg_g_531_low60_40_low20_2 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_3 neg_g_531_low60_40_low20_2;
mov u_571_574 r_571_573;
mov v_571_574 s_571_573;

subs dc neg_g_531_low60_40_low20_3 neg_g_531_low60_40_low20_2 neg_f_531_low60_40_low20_2;
asr neg_g_531_low60_40_low20_3 neg_g_531_low60_40_low20_3 1;
subs dc r_571_574 r_571_573 u_571_573;
asr r_571_574 r_571_574 1;
subs dc s_571_574 s_571_573 v_571_573;
asr s_571_574 s_571_574 1;
assert
    true
&&
    neg_f_531_low60_40_low20_3 = neg_g_531_low60_40_low20_2,
    u_571_574 = r_571_573,
    v_571_574 = s_571_573,
    neg_g_531_low60_40_low20_3 * (const 64 2) = neg_g_531_low60_40_low20_2 - neg_f_531_low60_40_low20_2,
    r_571_574 * (const 64 2) = r_571_573 - u_571_573,
    s_571_574 * (const 64 2) = s_571_573 - v_571_573
;

assume
    neg_f_531_low60_40_low20_3 = neg_g_531_low60_40_low20_2,
    u_571_574 = r_571_573,
    v_571_574 = s_571_573,
    neg_g_531_low60_40_low20_3 * 2 = neg_g_531_low60_40_low20_2 - neg_f_531_low60_40_low20_2,
    r_571_574 * 2 = r_571_573 - u_571_573,
    s_571_574 * 2 = s_571_573 - v_571_573
&&
    true
;

{
    u_571_574 * neg_f_531_low60_40_low20_0 + v_571_574 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_574 * neg_f_531_low60_40_low20_0 + s_571_574 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_3 + u_571_574 * (const 64 (2**21)) + v_571_574 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_3 + r_571_574 * (const 64 (2**21)) + s_571_574 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_3,
    neg_f_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_3,
    neg_g_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 574)) <=s delta, delta <=s (const 64 (1 + 2*574)),
    (const 64 (-(2**20))) <=s u_571_574, u_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_574, v_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_574, r_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_574, s_571_574 <=s (const 64 ((2**20)-1)),
    u_571_574 + v_571_574 <=s (const 64 (2**20)),
    u_571_574 - v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 + v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 - v_571_574 <=s (const 64 (2**20)),
    r_571_574 + s_571_574 <=s (const 64 (2**20)),
    r_571_574 - s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 + s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 - s_571_574 <=s (const 64 (2**20)),
    u_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_571_574 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_574_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_3,
sint64 neg_g_531_low60_40_low20_3,
sint64 neg_f_531_low60_40_low20_4,
sint64 neg_g_531_low60_40_low20_4,
sint64 u_571_574,
sint64 v_571_574,
sint64 r_571_574,
sint64 s_571_574,
sint64 u_571_575,
sint64 v_571_575,
sint64 r_571_575,
sint64 s_571_575,
bit ne
)={
    u_571_574 * neg_f_531_low60_40_low20_0 + v_571_574 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_3 * (-(2**20)),
    r_571_574 * neg_f_531_low60_40_low20_0 + s_571_574 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_3 * (-(2**20))
&&
    u_571_574 * neg_f_531_low60_40_low20_0 + v_571_574 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_3 * (const 64 (-(2**20))),
    r_571_574 * neg_f_531_low60_40_low20_0 + s_571_574 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_3 + u_571_574 * (const 64 (2**21)) + v_571_574 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_3 + r_571_574 * (const 64 (2**21)) + s_571_574 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_3,
    neg_f_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_3,
    neg_g_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 574)) <=s delta, delta <=s (const 64 (1 + 2*574)),
    (const 64 (-(2**20))) <=s u_571_574, u_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_574, v_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_574, r_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_574, s_571_574 <=s (const 64 ((2**20)-1)),
    u_571_574 + v_571_574 <=s (const 64 (2**20)),
    u_571_574 - v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 + v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 - v_571_574 <=s (const 64 (2**20)),
    r_571_574 + s_571_574 <=s (const 64 (2**20)),
    r_571_574 - s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 + s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 - s_571_574 <=s (const 64 (2**20)),
    u_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_571_574 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step574

// premise a
assume
neg_g_531_low60_40_low20_3 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_3 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_4 neg_f_531_low60_40_low20_3;
mov u_571_575 u_571_574;
mov v_571_575 v_571_574;

asr neg_g_531_low60_40_low20_4 neg_g_531_low60_40_low20_3 1;
asr r_571_575 r_571_574 1;
asr s_571_575 s_571_574 1;
assert
    true
&&
    neg_f_531_low60_40_low20_4 = neg_f_531_low60_40_low20_3,
    u_571_575 = u_571_574,
    v_571_575 = v_571_574,
    neg_g_531_low60_40_low20_4 * (const 64 2) = neg_g_531_low60_40_low20_3,
    r_571_575 * (const 64 2) = r_571_574,
    s_571_575 * (const 64 2) = s_571_574
;

assume
    neg_f_531_low60_40_low20_4 = neg_f_531_low60_40_low20_3,
    u_571_575 = u_571_574,
    v_571_575 = v_571_574,
    neg_g_531_low60_40_low20_4 * 2 = neg_g_531_low60_40_low20_3,
    r_571_575 * 2 = r_571_574,
    s_571_575 * 2 = s_571_574
&&
    true
;

{
    u_571_575 * neg_f_531_low60_40_low20_0 + v_571_575 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_575 * neg_f_531_low60_40_low20_0 + s_571_575 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_4 + u_571_575 * (const 64 (2**21)) + v_571_575 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_4 + r_571_575 * (const 64 (2**21)) + s_571_575 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_4,
    neg_f_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_4,
    neg_g_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 575)) <=s delta, delta <=s (const 64 (1 + 2*575)),
    (const 64 (-(2**20))) <=s u_571_575, u_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_575, v_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_575, r_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_575, s_571_575 <=s (const 64 ((2**20)-1)),
    u_571_575 + v_571_575 <=s (const 64 (2**20)),
    u_571_575 - v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 + v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 - v_571_575 <=s (const 64 (2**20)),
    r_571_575 + s_571_575 <=s (const 64 (2**20)),
    r_571_575 - s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 + s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 - s_571_575 <=s (const 64 (2**20)),
    u_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_571_575 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_574_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_3,
sint64 neg_g_531_low60_40_low20_3,
sint64 neg_f_531_low60_40_low20_4,
sint64 neg_g_531_low60_40_low20_4,
sint64 u_571_574,
sint64 v_571_574,
sint64 r_571_574,
sint64 s_571_574,
sint64 u_571_575,
sint64 v_571_575,
sint64 r_571_575,
sint64 s_571_575,
bit ne
)={
    u_571_574 * neg_f_531_low60_40_low20_0 + v_571_574 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_3 * (-(2**20)),
    r_571_574 * neg_f_531_low60_40_low20_0 + s_571_574 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_3 * (-(2**20))
&&
    u_571_574 * neg_f_531_low60_40_low20_0 + v_571_574 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_3 * (const 64 (-(2**20))),
    r_571_574 * neg_f_531_low60_40_low20_0 + s_571_574 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_3 + u_571_574 * (const 64 (2**21)) + v_571_574 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_3 + r_571_574 * (const 64 (2**21)) + s_571_574 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_3,
    neg_f_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_3,
    neg_g_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 574)) <=s delta, delta <=s (const 64 (1 + 2*574)),
    (const 64 (-(2**20))) <=s u_571_574, u_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_574, v_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_574, r_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_574, s_571_574 <=s (const 64 ((2**20)-1)),
    u_571_574 + v_571_574 <=s (const 64 (2**20)),
    u_571_574 - v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 + v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 - v_571_574 <=s (const 64 (2**20)),
    r_571_574 + s_571_574 <=s (const 64 (2**20)),
    r_571_574 - s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 + s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 - s_571_574 <=s (const 64 (2**20)),
    u_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_571_574 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step574

// premise b
assume
neg_g_531_low60_40_low20_3 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_4 neg_f_531_low60_40_low20_3;
mov u_571_575 u_571_574;
mov v_571_575 v_571_574;

add neg_g_531_low60_40_low20_4 neg_g_531_low60_40_low20_3 neg_f_531_low60_40_low20_3;
asr neg_g_531_low60_40_low20_4 neg_g_531_low60_40_low20_4 1;
add r_571_575 r_571_574 u_571_574;
asr r_571_575 r_571_575 1;
add s_571_575 s_571_574 v_571_574;
asr s_571_575 s_571_575 1;
assert
    true
&&
    neg_f_531_low60_40_low20_4 = neg_f_531_low60_40_low20_3,
    u_571_575 = u_571_574,
    v_571_575 = v_571_574,
    neg_g_531_low60_40_low20_4 * (const 64 2) = neg_g_531_low60_40_low20_3 + neg_f_531_low60_40_low20_3,
    r_571_575 * (const 64 2) = r_571_574 + u_571_574,
    s_571_575 * (const 64 2) = s_571_574 + v_571_574
;

assume
    neg_f_531_low60_40_low20_4 = neg_f_531_low60_40_low20_3,
    u_571_575 = u_571_574,
    v_571_575 = v_571_574,
    neg_g_531_low60_40_low20_4 * 2 = neg_g_531_low60_40_low20_3 + neg_f_531_low60_40_low20_3,
    r_571_575 * 2 = r_571_574 + u_571_574,
    s_571_575 * 2 = s_571_574 + v_571_574
&&
    true
;

{
    u_571_575 * neg_f_531_low60_40_low20_0 + v_571_575 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_575 * neg_f_531_low60_40_low20_0 + s_571_575 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_4 + u_571_575 * (const 64 (2**21)) + v_571_575 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_4 + r_571_575 * (const 64 (2**21)) + s_571_575 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_4,
    neg_f_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_4,
    neg_g_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 575)) <=s delta, delta <=s (const 64 (1 + 2*575)),
    (const 64 (-(2**20))) <=s u_571_575, u_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_575, v_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_575, r_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_575, s_571_575 <=s (const 64 ((2**20)-1)),
    u_571_575 + v_571_575 <=s (const 64 (2**20)),
    u_571_575 - v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 + v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 - v_571_575 <=s (const 64 (2**20)),
    r_571_575 + s_571_575 <=s (const 64 (2**20)),
    r_571_575 - s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 + s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 - s_571_575 <=s (const 64 (2**20)),
    u_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_571_575 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_574_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_3,
sint64 neg_g_531_low60_40_low20_3,
sint64 neg_f_531_low60_40_low20_4,
sint64 neg_g_531_low60_40_low20_4,
sint64 u_571_574,
sint64 v_571_574,
sint64 r_571_574,
sint64 s_571_574,
sint64 u_571_575,
sint64 v_571_575,
sint64 r_571_575,
sint64 s_571_575,
bit ne
)={
    u_571_574 * neg_f_531_low60_40_low20_0 + v_571_574 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_3 * (-(2**20)),
    r_571_574 * neg_f_531_low60_40_low20_0 + s_571_574 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_3 * (-(2**20))
&&
    u_571_574 * neg_f_531_low60_40_low20_0 + v_571_574 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_3 * (const 64 (-(2**20))),
    r_571_574 * neg_f_531_low60_40_low20_0 + s_571_574 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_3 + u_571_574 * (const 64 (2**21)) + v_571_574 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_3 + r_571_574 * (const 64 (2**21)) + s_571_574 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_3,
    neg_f_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_3,
    neg_g_531_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 574)) <=s delta, delta <=s (const 64 (1 + 2*574)),
    (const 64 (-(2**20))) <=s u_571_574, u_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_574, v_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_574, r_571_574 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_574, s_571_574 <=s (const 64 ((2**20)-1)),
    u_571_574 + v_571_574 <=s (const 64 (2**20)),
    u_571_574 - v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 + v_571_574 <=s (const 64 (2**20)),
    (const 64 0) - u_571_574 - v_571_574 <=s (const 64 (2**20)),
    r_571_574 + s_571_574 <=s (const 64 (2**20)),
    r_571_574 - s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 + s_571_574 <=s (const 64 (2**20)),
    (const 64 0) - r_571_574 - s_571_574 <=s (const 64 (2**20)),
    u_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_571_574 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_571_574 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step574

// premise c
assume
neg_g_531_low60_40_low20_3 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_4 neg_g_531_low60_40_low20_3;
mov u_571_575 r_571_574;
mov v_571_575 s_571_574;

subs dc neg_g_531_low60_40_low20_4 neg_g_531_low60_40_low20_3 neg_f_531_low60_40_low20_3;
asr neg_g_531_low60_40_low20_4 neg_g_531_low60_40_low20_4 1;
subs dc r_571_575 r_571_574 u_571_574;
asr r_571_575 r_571_575 1;
subs dc s_571_575 s_571_574 v_571_574;
asr s_571_575 s_571_575 1;
assert
    true
&&
    neg_f_531_low60_40_low20_4 = neg_g_531_low60_40_low20_3,
    u_571_575 = r_571_574,
    v_571_575 = s_571_574,
    neg_g_531_low60_40_low20_4 * (const 64 2) = neg_g_531_low60_40_low20_3 - neg_f_531_low60_40_low20_3,
    r_571_575 * (const 64 2) = r_571_574 - u_571_574,
    s_571_575 * (const 64 2) = s_571_574 - v_571_574
;

assume
    neg_f_531_low60_40_low20_4 = neg_g_531_low60_40_low20_3,
    u_571_575 = r_571_574,
    v_571_575 = s_571_574,
    neg_g_531_low60_40_low20_4 * 2 = neg_g_531_low60_40_low20_3 - neg_f_531_low60_40_low20_3,
    r_571_575 * 2 = r_571_574 - u_571_574,
    s_571_575 * 2 = s_571_574 - v_571_574
&&
    true
;

{
    u_571_575 * neg_f_531_low60_40_low20_0 + v_571_575 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_575 * neg_f_531_low60_40_low20_0 + s_571_575 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_4 + u_571_575 * (const 64 (2**21)) + v_571_575 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_4 + r_571_575 * (const 64 (2**21)) + s_571_575 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_4,
    neg_f_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_4,
    neg_g_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 575)) <=s delta, delta <=s (const 64 (1 + 2*575)),
    (const 64 (-(2**20))) <=s u_571_575, u_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_575, v_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_575, r_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_575, s_571_575 <=s (const 64 ((2**20)-1)),
    u_571_575 + v_571_575 <=s (const 64 (2**20)),
    u_571_575 - v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 + v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 - v_571_575 <=s (const 64 (2**20)),
    r_571_575 + s_571_575 <=s (const 64 (2**20)),
    r_571_575 - s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 + s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 - s_571_575 <=s (const 64 (2**20)),
    u_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_571_575 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_575_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_4,
sint64 neg_g_531_low60_40_low20_4,
sint64 neg_f_531_low60_40_low20_5,
sint64 neg_g_531_low60_40_low20_5,
sint64 u_571_575,
sint64 v_571_575,
sint64 r_571_575,
sint64 s_571_575,
sint64 u_571_576,
sint64 v_571_576,
sint64 r_571_576,
sint64 s_571_576,
bit ne
)={
    u_571_575 * neg_f_531_low60_40_low20_0 + v_571_575 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_4 * (-(2**20)),
    r_571_575 * neg_f_531_low60_40_low20_0 + s_571_575 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_4 * (-(2**20))
&&
    u_571_575 * neg_f_531_low60_40_low20_0 + v_571_575 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_4 * (const 64 (-(2**20))),
    r_571_575 * neg_f_531_low60_40_low20_0 + s_571_575 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_4 + u_571_575 * (const 64 (2**21)) + v_571_575 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_4 + r_571_575 * (const 64 (2**21)) + s_571_575 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_4,
    neg_f_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_4,
    neg_g_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 575)) <=s delta, delta <=s (const 64 (1 + 2*575)),
    (const 64 (-(2**20))) <=s u_571_575, u_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_575, v_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_575, r_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_575, s_571_575 <=s (const 64 ((2**20)-1)),
    u_571_575 + v_571_575 <=s (const 64 (2**20)),
    u_571_575 - v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 + v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 - v_571_575 <=s (const 64 (2**20)),
    r_571_575 + s_571_575 <=s (const 64 (2**20)),
    r_571_575 - s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 + s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 - s_571_575 <=s (const 64 (2**20)),
    u_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_571_575 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step575

// premise a
assume
neg_g_531_low60_40_low20_4 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_4 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_5 neg_f_531_low60_40_low20_4;
mov u_571_576 u_571_575;
mov v_571_576 v_571_575;

asr neg_g_531_low60_40_low20_5 neg_g_531_low60_40_low20_4 1;
asr r_571_576 r_571_575 1;
asr s_571_576 s_571_575 1;
assert
    true
&&
    neg_f_531_low60_40_low20_5 = neg_f_531_low60_40_low20_4,
    u_571_576 = u_571_575,
    v_571_576 = v_571_575,
    neg_g_531_low60_40_low20_5 * (const 64 2) = neg_g_531_low60_40_low20_4,
    r_571_576 * (const 64 2) = r_571_575,
    s_571_576 * (const 64 2) = s_571_575
;

assume
    neg_f_531_low60_40_low20_5 = neg_f_531_low60_40_low20_4,
    u_571_576 = u_571_575,
    v_571_576 = v_571_575,
    neg_g_531_low60_40_low20_5 * 2 = neg_g_531_low60_40_low20_4,
    r_571_576 * 2 = r_571_575,
    s_571_576 * 2 = s_571_575
&&
    true
;

{
    u_571_576 * neg_f_531_low60_40_low20_0 + v_571_576 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_576 * neg_f_531_low60_40_low20_0 + s_571_576 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_5 + u_571_576 * (const 64 (2**21)) + v_571_576 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_5 + r_571_576 * (const 64 (2**21)) + s_571_576 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_5,
    neg_f_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_5,
    neg_g_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 576)) <=s delta, delta <=s (const 64 (1 + 2*576)),
    (const 64 (-(2**20))) <=s u_571_576, u_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_576, v_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_576, r_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_576, s_571_576 <=s (const 64 ((2**20)-1)),
    u_571_576 + v_571_576 <=s (const 64 (2**20)),
    u_571_576 - v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 + v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 - v_571_576 <=s (const 64 (2**20)),
    r_571_576 + s_571_576 <=s (const 64 (2**20)),
    r_571_576 - s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 + s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 - s_571_576 <=s (const 64 (2**20)),
    u_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_571_576 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_575_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_4,
sint64 neg_g_531_low60_40_low20_4,
sint64 neg_f_531_low60_40_low20_5,
sint64 neg_g_531_low60_40_low20_5,
sint64 u_571_575,
sint64 v_571_575,
sint64 r_571_575,
sint64 s_571_575,
sint64 u_571_576,
sint64 v_571_576,
sint64 r_571_576,
sint64 s_571_576,
bit ne
)={
    u_571_575 * neg_f_531_low60_40_low20_0 + v_571_575 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_4 * (-(2**20)),
    r_571_575 * neg_f_531_low60_40_low20_0 + s_571_575 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_4 * (-(2**20))
&&
    u_571_575 * neg_f_531_low60_40_low20_0 + v_571_575 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_4 * (const 64 (-(2**20))),
    r_571_575 * neg_f_531_low60_40_low20_0 + s_571_575 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_4 + u_571_575 * (const 64 (2**21)) + v_571_575 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_4 + r_571_575 * (const 64 (2**21)) + s_571_575 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_4,
    neg_f_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_4,
    neg_g_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 575)) <=s delta, delta <=s (const 64 (1 + 2*575)),
    (const 64 (-(2**20))) <=s u_571_575, u_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_575, v_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_575, r_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_575, s_571_575 <=s (const 64 ((2**20)-1)),
    u_571_575 + v_571_575 <=s (const 64 (2**20)),
    u_571_575 - v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 + v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 - v_571_575 <=s (const 64 (2**20)),
    r_571_575 + s_571_575 <=s (const 64 (2**20)),
    r_571_575 - s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 + s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 - s_571_575 <=s (const 64 (2**20)),
    u_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_571_575 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step575

// premise b
assume
neg_g_531_low60_40_low20_4 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_5 neg_f_531_low60_40_low20_4;
mov u_571_576 u_571_575;
mov v_571_576 v_571_575;

add neg_g_531_low60_40_low20_5 neg_g_531_low60_40_low20_4 neg_f_531_low60_40_low20_4;
asr neg_g_531_low60_40_low20_5 neg_g_531_low60_40_low20_5 1;
add r_571_576 r_571_575 u_571_575;
asr r_571_576 r_571_576 1;
add s_571_576 s_571_575 v_571_575;
asr s_571_576 s_571_576 1;
assert
    true
&&
    neg_f_531_low60_40_low20_5 = neg_f_531_low60_40_low20_4,
    u_571_576 = u_571_575,
    v_571_576 = v_571_575,
    neg_g_531_low60_40_low20_5 * (const 64 2) = neg_g_531_low60_40_low20_4 + neg_f_531_low60_40_low20_4,
    r_571_576 * (const 64 2) = r_571_575 + u_571_575,
    s_571_576 * (const 64 2) = s_571_575 + v_571_575
;

assume
    neg_f_531_low60_40_low20_5 = neg_f_531_low60_40_low20_4,
    u_571_576 = u_571_575,
    v_571_576 = v_571_575,
    neg_g_531_low60_40_low20_5 * 2 = neg_g_531_low60_40_low20_4 + neg_f_531_low60_40_low20_4,
    r_571_576 * 2 = r_571_575 + u_571_575,
    s_571_576 * 2 = s_571_575 + v_571_575
&&
    true
;

{
    u_571_576 * neg_f_531_low60_40_low20_0 + v_571_576 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_576 * neg_f_531_low60_40_low20_0 + s_571_576 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_5 + u_571_576 * (const 64 (2**21)) + v_571_576 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_5 + r_571_576 * (const 64 (2**21)) + s_571_576 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_5,
    neg_f_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_5,
    neg_g_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 576)) <=s delta, delta <=s (const 64 (1 + 2*576)),
    (const 64 (-(2**20))) <=s u_571_576, u_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_576, v_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_576, r_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_576, s_571_576 <=s (const 64 ((2**20)-1)),
    u_571_576 + v_571_576 <=s (const 64 (2**20)),
    u_571_576 - v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 + v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 - v_571_576 <=s (const 64 (2**20)),
    r_571_576 + s_571_576 <=s (const 64 (2**20)),
    r_571_576 - s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 + s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 - s_571_576 <=s (const 64 (2**20)),
    u_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_571_576 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_575_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_4,
sint64 neg_g_531_low60_40_low20_4,
sint64 neg_f_531_low60_40_low20_5,
sint64 neg_g_531_low60_40_low20_5,
sint64 u_571_575,
sint64 v_571_575,
sint64 r_571_575,
sint64 s_571_575,
sint64 u_571_576,
sint64 v_571_576,
sint64 r_571_576,
sint64 s_571_576,
bit ne
)={
    u_571_575 * neg_f_531_low60_40_low20_0 + v_571_575 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_4 * (-(2**20)),
    r_571_575 * neg_f_531_low60_40_low20_0 + s_571_575 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_4 * (-(2**20))
&&
    u_571_575 * neg_f_531_low60_40_low20_0 + v_571_575 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_4 * (const 64 (-(2**20))),
    r_571_575 * neg_f_531_low60_40_low20_0 + s_571_575 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_4 + u_571_575 * (const 64 (2**21)) + v_571_575 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_4 + r_571_575 * (const 64 (2**21)) + s_571_575 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_4,
    neg_f_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_4,
    neg_g_531_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 575)) <=s delta, delta <=s (const 64 (1 + 2*575)),
    (const 64 (-(2**20))) <=s u_571_575, u_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_575, v_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_575, r_571_575 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_575, s_571_575 <=s (const 64 ((2**20)-1)),
    u_571_575 + v_571_575 <=s (const 64 (2**20)),
    u_571_575 - v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 + v_571_575 <=s (const 64 (2**20)),
    (const 64 0) - u_571_575 - v_571_575 <=s (const 64 (2**20)),
    r_571_575 + s_571_575 <=s (const 64 (2**20)),
    r_571_575 - s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 + s_571_575 <=s (const 64 (2**20)),
    (const 64 0) - r_571_575 - s_571_575 <=s (const 64 (2**20)),
    u_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_571_575 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_571_575 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step575

// premise c
assume
neg_g_531_low60_40_low20_4 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_5 neg_g_531_low60_40_low20_4;
mov u_571_576 r_571_575;
mov v_571_576 s_571_575;

subs dc neg_g_531_low60_40_low20_5 neg_g_531_low60_40_low20_4 neg_f_531_low60_40_low20_4;
asr neg_g_531_low60_40_low20_5 neg_g_531_low60_40_low20_5 1;
subs dc r_571_576 r_571_575 u_571_575;
asr r_571_576 r_571_576 1;
subs dc s_571_576 s_571_575 v_571_575;
asr s_571_576 s_571_576 1;
assert
    true
&&
    neg_f_531_low60_40_low20_5 = neg_g_531_low60_40_low20_4,
    u_571_576 = r_571_575,
    v_571_576 = s_571_575,
    neg_g_531_low60_40_low20_5 * (const 64 2) = neg_g_531_low60_40_low20_4 - neg_f_531_low60_40_low20_4,
    r_571_576 * (const 64 2) = r_571_575 - u_571_575,
    s_571_576 * (const 64 2) = s_571_575 - v_571_575
;

assume
    neg_f_531_low60_40_low20_5 = neg_g_531_low60_40_low20_4,
    u_571_576 = r_571_575,
    v_571_576 = s_571_575,
    neg_g_531_low60_40_low20_5 * 2 = neg_g_531_low60_40_low20_4 - neg_f_531_low60_40_low20_4,
    r_571_576 * 2 = r_571_575 - u_571_575,
    s_571_576 * 2 = s_571_575 - v_571_575
&&
    true
;

{
    u_571_576 * neg_f_531_low60_40_low20_0 + v_571_576 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_576 * neg_f_531_low60_40_low20_0 + s_571_576 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_5 + u_571_576 * (const 64 (2**21)) + v_571_576 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_5 + r_571_576 * (const 64 (2**21)) + s_571_576 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_5,
    neg_f_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_5,
    neg_g_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 576)) <=s delta, delta <=s (const 64 (1 + 2*576)),
    (const 64 (-(2**20))) <=s u_571_576, u_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_576, v_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_576, r_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_576, s_571_576 <=s (const 64 ((2**20)-1)),
    u_571_576 + v_571_576 <=s (const 64 (2**20)),
    u_571_576 - v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 + v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 - v_571_576 <=s (const 64 (2**20)),
    r_571_576 + s_571_576 <=s (const 64 (2**20)),
    r_571_576 - s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 + s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 - s_571_576 <=s (const 64 (2**20)),
    u_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_571_576 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_576_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_5,
sint64 neg_g_531_low60_40_low20_5,
sint64 neg_f_531_low60_40_low20_6,
sint64 neg_g_531_low60_40_low20_6,
sint64 u_571_576,
sint64 v_571_576,
sint64 r_571_576,
sint64 s_571_576,
sint64 u_571_577,
sint64 v_571_577,
sint64 r_571_577,
sint64 s_571_577,
bit ne
)={
    u_571_576 * neg_f_531_low60_40_low20_0 + v_571_576 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_5 * (-(2**20)),
    r_571_576 * neg_f_531_low60_40_low20_0 + s_571_576 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_5 * (-(2**20))
&&
    u_571_576 * neg_f_531_low60_40_low20_0 + v_571_576 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_5 * (const 64 (-(2**20))),
    r_571_576 * neg_f_531_low60_40_low20_0 + s_571_576 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_5 + u_571_576 * (const 64 (2**21)) + v_571_576 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_5 + r_571_576 * (const 64 (2**21)) + s_571_576 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_5,
    neg_f_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_5,
    neg_g_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 576)) <=s delta, delta <=s (const 64 (1 + 2*576)),
    (const 64 (-(2**20))) <=s u_571_576, u_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_576, v_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_576, r_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_576, s_571_576 <=s (const 64 ((2**20)-1)),
    u_571_576 + v_571_576 <=s (const 64 (2**20)),
    u_571_576 - v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 + v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 - v_571_576 <=s (const 64 (2**20)),
    r_571_576 + s_571_576 <=s (const 64 (2**20)),
    r_571_576 - s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 + s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 - s_571_576 <=s (const 64 (2**20)),
    u_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_571_576 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step576

// premise a
assume
neg_g_531_low60_40_low20_5 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_5 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_6 neg_f_531_low60_40_low20_5;
mov u_571_577 u_571_576;
mov v_571_577 v_571_576;

asr neg_g_531_low60_40_low20_6 neg_g_531_low60_40_low20_5 1;
asr r_571_577 r_571_576 1;
asr s_571_577 s_571_576 1;
assert
    true
&&
    neg_f_531_low60_40_low20_6 = neg_f_531_low60_40_low20_5,
    u_571_577 = u_571_576,
    v_571_577 = v_571_576,
    neg_g_531_low60_40_low20_6 * (const 64 2) = neg_g_531_low60_40_low20_5,
    r_571_577 * (const 64 2) = r_571_576,
    s_571_577 * (const 64 2) = s_571_576
;

assume
    neg_f_531_low60_40_low20_6 = neg_f_531_low60_40_low20_5,
    u_571_577 = u_571_576,
    v_571_577 = v_571_576,
    neg_g_531_low60_40_low20_6 * 2 = neg_g_531_low60_40_low20_5,
    r_571_577 * 2 = r_571_576,
    s_571_577 * 2 = s_571_576
&&
    true
;

{
    u_571_577 * neg_f_531_low60_40_low20_0 + v_571_577 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_577 * neg_f_531_low60_40_low20_0 + s_571_577 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_6 + u_571_577 * (const 64 (2**21)) + v_571_577 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_6 + r_571_577 * (const 64 (2**21)) + s_571_577 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_6,
    neg_f_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_6,
    neg_g_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 577)) <=s delta, delta <=s (const 64 (1 + 2*577)),
    (const 64 (-(2**20))) <=s u_571_577, u_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_577, v_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_577, r_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_577, s_571_577 <=s (const 64 ((2**20)-1)),
    u_571_577 + v_571_577 <=s (const 64 (2**20)),
    u_571_577 - v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 + v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 - v_571_577 <=s (const 64 (2**20)),
    r_571_577 + s_571_577 <=s (const 64 (2**20)),
    r_571_577 - s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 + s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 - s_571_577 <=s (const 64 (2**20)),
    u_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_571_577 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_576_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_5,
sint64 neg_g_531_low60_40_low20_5,
sint64 neg_f_531_low60_40_low20_6,
sint64 neg_g_531_low60_40_low20_6,
sint64 u_571_576,
sint64 v_571_576,
sint64 r_571_576,
sint64 s_571_576,
sint64 u_571_577,
sint64 v_571_577,
sint64 r_571_577,
sint64 s_571_577,
bit ne
)={
    u_571_576 * neg_f_531_low60_40_low20_0 + v_571_576 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_5 * (-(2**20)),
    r_571_576 * neg_f_531_low60_40_low20_0 + s_571_576 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_5 * (-(2**20))
&&
    u_571_576 * neg_f_531_low60_40_low20_0 + v_571_576 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_5 * (const 64 (-(2**20))),
    r_571_576 * neg_f_531_low60_40_low20_0 + s_571_576 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_5 + u_571_576 * (const 64 (2**21)) + v_571_576 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_5 + r_571_576 * (const 64 (2**21)) + s_571_576 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_5,
    neg_f_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_5,
    neg_g_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 576)) <=s delta, delta <=s (const 64 (1 + 2*576)),
    (const 64 (-(2**20))) <=s u_571_576, u_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_576, v_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_576, r_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_576, s_571_576 <=s (const 64 ((2**20)-1)),
    u_571_576 + v_571_576 <=s (const 64 (2**20)),
    u_571_576 - v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 + v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 - v_571_576 <=s (const 64 (2**20)),
    r_571_576 + s_571_576 <=s (const 64 (2**20)),
    r_571_576 - s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 + s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 - s_571_576 <=s (const 64 (2**20)),
    u_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_571_576 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step576

// premise b
assume
neg_g_531_low60_40_low20_5 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_6 neg_f_531_low60_40_low20_5;
mov u_571_577 u_571_576;
mov v_571_577 v_571_576;

add neg_g_531_low60_40_low20_6 neg_g_531_low60_40_low20_5 neg_f_531_low60_40_low20_5;
asr neg_g_531_low60_40_low20_6 neg_g_531_low60_40_low20_6 1;
add r_571_577 r_571_576 u_571_576;
asr r_571_577 r_571_577 1;
add s_571_577 s_571_576 v_571_576;
asr s_571_577 s_571_577 1;
assert
    true
&&
    neg_f_531_low60_40_low20_6 = neg_f_531_low60_40_low20_5,
    u_571_577 = u_571_576,
    v_571_577 = v_571_576,
    neg_g_531_low60_40_low20_6 * (const 64 2) = neg_g_531_low60_40_low20_5 + neg_f_531_low60_40_low20_5,
    r_571_577 * (const 64 2) = r_571_576 + u_571_576,
    s_571_577 * (const 64 2) = s_571_576 + v_571_576
;

assume
    neg_f_531_low60_40_low20_6 = neg_f_531_low60_40_low20_5,
    u_571_577 = u_571_576,
    v_571_577 = v_571_576,
    neg_g_531_low60_40_low20_6 * 2 = neg_g_531_low60_40_low20_5 + neg_f_531_low60_40_low20_5,
    r_571_577 * 2 = r_571_576 + u_571_576,
    s_571_577 * 2 = s_571_576 + v_571_576
&&
    true
;

{
    u_571_577 * neg_f_531_low60_40_low20_0 + v_571_577 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_577 * neg_f_531_low60_40_low20_0 + s_571_577 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_6 + u_571_577 * (const 64 (2**21)) + v_571_577 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_6 + r_571_577 * (const 64 (2**21)) + s_571_577 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_6,
    neg_f_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_6,
    neg_g_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 577)) <=s delta, delta <=s (const 64 (1 + 2*577)),
    (const 64 (-(2**20))) <=s u_571_577, u_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_577, v_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_577, r_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_577, s_571_577 <=s (const 64 ((2**20)-1)),
    u_571_577 + v_571_577 <=s (const 64 (2**20)),
    u_571_577 - v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 + v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 - v_571_577 <=s (const 64 (2**20)),
    r_571_577 + s_571_577 <=s (const 64 (2**20)),
    r_571_577 - s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 + s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 - s_571_577 <=s (const 64 (2**20)),
    u_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_571_577 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_576_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_5,
sint64 neg_g_531_low60_40_low20_5,
sint64 neg_f_531_low60_40_low20_6,
sint64 neg_g_531_low60_40_low20_6,
sint64 u_571_576,
sint64 v_571_576,
sint64 r_571_576,
sint64 s_571_576,
sint64 u_571_577,
sint64 v_571_577,
sint64 r_571_577,
sint64 s_571_577,
bit ne
)={
    u_571_576 * neg_f_531_low60_40_low20_0 + v_571_576 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_5 * (-(2**20)),
    r_571_576 * neg_f_531_low60_40_low20_0 + s_571_576 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_5 * (-(2**20))
&&
    u_571_576 * neg_f_531_low60_40_low20_0 + v_571_576 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_5 * (const 64 (-(2**20))),
    r_571_576 * neg_f_531_low60_40_low20_0 + s_571_576 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_5 + u_571_576 * (const 64 (2**21)) + v_571_576 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_5 + r_571_576 * (const 64 (2**21)) + s_571_576 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_5,
    neg_f_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_5,
    neg_g_531_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 576)) <=s delta, delta <=s (const 64 (1 + 2*576)),
    (const 64 (-(2**20))) <=s u_571_576, u_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_576, v_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_576, r_571_576 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_576, s_571_576 <=s (const 64 ((2**20)-1)),
    u_571_576 + v_571_576 <=s (const 64 (2**20)),
    u_571_576 - v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 + v_571_576 <=s (const 64 (2**20)),
    (const 64 0) - u_571_576 - v_571_576 <=s (const 64 (2**20)),
    r_571_576 + s_571_576 <=s (const 64 (2**20)),
    r_571_576 - s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 + s_571_576 <=s (const 64 (2**20)),
    (const 64 0) - r_571_576 - s_571_576 <=s (const 64 (2**20)),
    u_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_571_576 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_571_576 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step576

// premise c
assume
neg_g_531_low60_40_low20_5 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_6 neg_g_531_low60_40_low20_5;
mov u_571_577 r_571_576;
mov v_571_577 s_571_576;

subs dc neg_g_531_low60_40_low20_6 neg_g_531_low60_40_low20_5 neg_f_531_low60_40_low20_5;
asr neg_g_531_low60_40_low20_6 neg_g_531_low60_40_low20_6 1;
subs dc r_571_577 r_571_576 u_571_576;
asr r_571_577 r_571_577 1;
subs dc s_571_577 s_571_576 v_571_576;
asr s_571_577 s_571_577 1;
assert
    true
&&
    neg_f_531_low60_40_low20_6 = neg_g_531_low60_40_low20_5,
    u_571_577 = r_571_576,
    v_571_577 = s_571_576,
    neg_g_531_low60_40_low20_6 * (const 64 2) = neg_g_531_low60_40_low20_5 - neg_f_531_low60_40_low20_5,
    r_571_577 * (const 64 2) = r_571_576 - u_571_576,
    s_571_577 * (const 64 2) = s_571_576 - v_571_576
;

assume
    neg_f_531_low60_40_low20_6 = neg_g_531_low60_40_low20_5,
    u_571_577 = r_571_576,
    v_571_577 = s_571_576,
    neg_g_531_low60_40_low20_6 * 2 = neg_g_531_low60_40_low20_5 - neg_f_531_low60_40_low20_5,
    r_571_577 * 2 = r_571_576 - u_571_576,
    s_571_577 * 2 = s_571_576 - v_571_576
&&
    true
;

{
    u_571_577 * neg_f_531_low60_40_low20_0 + v_571_577 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_577 * neg_f_531_low60_40_low20_0 + s_571_577 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_6 + u_571_577 * (const 64 (2**21)) + v_571_577 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_6 + r_571_577 * (const 64 (2**21)) + s_571_577 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_6,
    neg_f_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_6,
    neg_g_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 577)) <=s delta, delta <=s (const 64 (1 + 2*577)),
    (const 64 (-(2**20))) <=s u_571_577, u_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_577, v_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_577, r_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_577, s_571_577 <=s (const 64 ((2**20)-1)),
    u_571_577 + v_571_577 <=s (const 64 (2**20)),
    u_571_577 - v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 + v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 - v_571_577 <=s (const 64 (2**20)),
    r_571_577 + s_571_577 <=s (const 64 (2**20)),
    r_571_577 - s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 + s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 - s_571_577 <=s (const 64 (2**20)),
    u_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_571_577 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_577_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_6,
sint64 neg_g_531_low60_40_low20_6,
sint64 neg_f_531_low60_40_low20_7,
sint64 neg_g_531_low60_40_low20_7,
sint64 u_571_577,
sint64 v_571_577,
sint64 r_571_577,
sint64 s_571_577,
sint64 u_571_578,
sint64 v_571_578,
sint64 r_571_578,
sint64 s_571_578,
bit ne
)={
    u_571_577 * neg_f_531_low60_40_low20_0 + v_571_577 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_6 * (-(2**20)),
    r_571_577 * neg_f_531_low60_40_low20_0 + s_571_577 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_6 * (-(2**20))
&&
    u_571_577 * neg_f_531_low60_40_low20_0 + v_571_577 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_6 * (const 64 (-(2**20))),
    r_571_577 * neg_f_531_low60_40_low20_0 + s_571_577 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_6 + u_571_577 * (const 64 (2**21)) + v_571_577 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_6 + r_571_577 * (const 64 (2**21)) + s_571_577 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_6,
    neg_f_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_6,
    neg_g_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 577)) <=s delta, delta <=s (const 64 (1 + 2*577)),
    (const 64 (-(2**20))) <=s u_571_577, u_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_577, v_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_577, r_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_577, s_571_577 <=s (const 64 ((2**20)-1)),
    u_571_577 + v_571_577 <=s (const 64 (2**20)),
    u_571_577 - v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 + v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 - v_571_577 <=s (const 64 (2**20)),
    r_571_577 + s_571_577 <=s (const 64 (2**20)),
    r_571_577 - s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 + s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 - s_571_577 <=s (const 64 (2**20)),
    u_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_571_577 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step577

// premise a
assume
neg_g_531_low60_40_low20_6 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_6 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_7 neg_f_531_low60_40_low20_6;
mov u_571_578 u_571_577;
mov v_571_578 v_571_577;

asr neg_g_531_low60_40_low20_7 neg_g_531_low60_40_low20_6 1;
asr r_571_578 r_571_577 1;
asr s_571_578 s_571_577 1;
assert
    true
&&
    neg_f_531_low60_40_low20_7 = neg_f_531_low60_40_low20_6,
    u_571_578 = u_571_577,
    v_571_578 = v_571_577,
    neg_g_531_low60_40_low20_7 * (const 64 2) = neg_g_531_low60_40_low20_6,
    r_571_578 * (const 64 2) = r_571_577,
    s_571_578 * (const 64 2) = s_571_577
;

assume
    neg_f_531_low60_40_low20_7 = neg_f_531_low60_40_low20_6,
    u_571_578 = u_571_577,
    v_571_578 = v_571_577,
    neg_g_531_low60_40_low20_7 * 2 = neg_g_531_low60_40_low20_6,
    r_571_578 * 2 = r_571_577,
    s_571_578 * 2 = s_571_577
&&
    true
;

{
    u_571_578 * neg_f_531_low60_40_low20_0 + v_571_578 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_578 * neg_f_531_low60_40_low20_0 + s_571_578 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_7 + u_571_578 * (const 64 (2**21)) + v_571_578 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_7 + r_571_578 * (const 64 (2**21)) + s_571_578 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_7,
    neg_f_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_7,
    neg_g_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 578)) <=s delta, delta <=s (const 64 (1 + 2*578)),
    (const 64 (-(2**20))) <=s u_571_578, u_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_578, v_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_578, r_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_578, s_571_578 <=s (const 64 ((2**20)-1)),
    u_571_578 + v_571_578 <=s (const 64 (2**20)),
    u_571_578 - v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 + v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 - v_571_578 <=s (const 64 (2**20)),
    r_571_578 + s_571_578 <=s (const 64 (2**20)),
    r_571_578 - s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 + s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 - s_571_578 <=s (const 64 (2**20)),
    u_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_571_578 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_577_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_6,
sint64 neg_g_531_low60_40_low20_6,
sint64 neg_f_531_low60_40_low20_7,
sint64 neg_g_531_low60_40_low20_7,
sint64 u_571_577,
sint64 v_571_577,
sint64 r_571_577,
sint64 s_571_577,
sint64 u_571_578,
sint64 v_571_578,
sint64 r_571_578,
sint64 s_571_578,
bit ne
)={
    u_571_577 * neg_f_531_low60_40_low20_0 + v_571_577 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_6 * (-(2**20)),
    r_571_577 * neg_f_531_low60_40_low20_0 + s_571_577 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_6 * (-(2**20))
&&
    u_571_577 * neg_f_531_low60_40_low20_0 + v_571_577 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_6 * (const 64 (-(2**20))),
    r_571_577 * neg_f_531_low60_40_low20_0 + s_571_577 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_6 + u_571_577 * (const 64 (2**21)) + v_571_577 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_6 + r_571_577 * (const 64 (2**21)) + s_571_577 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_6,
    neg_f_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_6,
    neg_g_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 577)) <=s delta, delta <=s (const 64 (1 + 2*577)),
    (const 64 (-(2**20))) <=s u_571_577, u_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_577, v_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_577, r_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_577, s_571_577 <=s (const 64 ((2**20)-1)),
    u_571_577 + v_571_577 <=s (const 64 (2**20)),
    u_571_577 - v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 + v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 - v_571_577 <=s (const 64 (2**20)),
    r_571_577 + s_571_577 <=s (const 64 (2**20)),
    r_571_577 - s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 + s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 - s_571_577 <=s (const 64 (2**20)),
    u_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_571_577 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step577

// premise b
assume
neg_g_531_low60_40_low20_6 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_7 neg_f_531_low60_40_low20_6;
mov u_571_578 u_571_577;
mov v_571_578 v_571_577;

add neg_g_531_low60_40_low20_7 neg_g_531_low60_40_low20_6 neg_f_531_low60_40_low20_6;
asr neg_g_531_low60_40_low20_7 neg_g_531_low60_40_low20_7 1;
add r_571_578 r_571_577 u_571_577;
asr r_571_578 r_571_578 1;
add s_571_578 s_571_577 v_571_577;
asr s_571_578 s_571_578 1;
assert
    true
&&
    neg_f_531_low60_40_low20_7 = neg_f_531_low60_40_low20_6,
    u_571_578 = u_571_577,
    v_571_578 = v_571_577,
    neg_g_531_low60_40_low20_7 * (const 64 2) = neg_g_531_low60_40_low20_6 + neg_f_531_low60_40_low20_6,
    r_571_578 * (const 64 2) = r_571_577 + u_571_577,
    s_571_578 * (const 64 2) = s_571_577 + v_571_577
;

assume
    neg_f_531_low60_40_low20_7 = neg_f_531_low60_40_low20_6,
    u_571_578 = u_571_577,
    v_571_578 = v_571_577,
    neg_g_531_low60_40_low20_7 * 2 = neg_g_531_low60_40_low20_6 + neg_f_531_low60_40_low20_6,
    r_571_578 * 2 = r_571_577 + u_571_577,
    s_571_578 * 2 = s_571_577 + v_571_577
&&
    true
;

{
    u_571_578 * neg_f_531_low60_40_low20_0 + v_571_578 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_578 * neg_f_531_low60_40_low20_0 + s_571_578 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_7 + u_571_578 * (const 64 (2**21)) + v_571_578 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_7 + r_571_578 * (const 64 (2**21)) + s_571_578 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_7,
    neg_f_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_7,
    neg_g_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 578)) <=s delta, delta <=s (const 64 (1 + 2*578)),
    (const 64 (-(2**20))) <=s u_571_578, u_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_578, v_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_578, r_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_578, s_571_578 <=s (const 64 ((2**20)-1)),
    u_571_578 + v_571_578 <=s (const 64 (2**20)),
    u_571_578 - v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 + v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 - v_571_578 <=s (const 64 (2**20)),
    r_571_578 + s_571_578 <=s (const 64 (2**20)),
    r_571_578 - s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 + s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 - s_571_578 <=s (const 64 (2**20)),
    u_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_571_578 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_577_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_6,
sint64 neg_g_531_low60_40_low20_6,
sint64 neg_f_531_low60_40_low20_7,
sint64 neg_g_531_low60_40_low20_7,
sint64 u_571_577,
sint64 v_571_577,
sint64 r_571_577,
sint64 s_571_577,
sint64 u_571_578,
sint64 v_571_578,
sint64 r_571_578,
sint64 s_571_578,
bit ne
)={
    u_571_577 * neg_f_531_low60_40_low20_0 + v_571_577 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_6 * (-(2**20)),
    r_571_577 * neg_f_531_low60_40_low20_0 + s_571_577 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_6 * (-(2**20))
&&
    u_571_577 * neg_f_531_low60_40_low20_0 + v_571_577 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_6 * (const 64 (-(2**20))),
    r_571_577 * neg_f_531_low60_40_low20_0 + s_571_577 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_6 + u_571_577 * (const 64 (2**21)) + v_571_577 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_6 + r_571_577 * (const 64 (2**21)) + s_571_577 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_6,
    neg_f_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_6,
    neg_g_531_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 577)) <=s delta, delta <=s (const 64 (1 + 2*577)),
    (const 64 (-(2**20))) <=s u_571_577, u_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_577, v_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_577, r_571_577 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_577, s_571_577 <=s (const 64 ((2**20)-1)),
    u_571_577 + v_571_577 <=s (const 64 (2**20)),
    u_571_577 - v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 + v_571_577 <=s (const 64 (2**20)),
    (const 64 0) - u_571_577 - v_571_577 <=s (const 64 (2**20)),
    r_571_577 + s_571_577 <=s (const 64 (2**20)),
    r_571_577 - s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 + s_571_577 <=s (const 64 (2**20)),
    (const 64 0) - r_571_577 - s_571_577 <=s (const 64 (2**20)),
    u_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_571_577 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_571_577 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step577

// premise c
assume
neg_g_531_low60_40_low20_6 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_7 neg_g_531_low60_40_low20_6;
mov u_571_578 r_571_577;
mov v_571_578 s_571_577;

subs dc neg_g_531_low60_40_low20_7 neg_g_531_low60_40_low20_6 neg_f_531_low60_40_low20_6;
asr neg_g_531_low60_40_low20_7 neg_g_531_low60_40_low20_7 1;
subs dc r_571_578 r_571_577 u_571_577;
asr r_571_578 r_571_578 1;
subs dc s_571_578 s_571_577 v_571_577;
asr s_571_578 s_571_578 1;
assert
    true
&&
    neg_f_531_low60_40_low20_7 = neg_g_531_low60_40_low20_6,
    u_571_578 = r_571_577,
    v_571_578 = s_571_577,
    neg_g_531_low60_40_low20_7 * (const 64 2) = neg_g_531_low60_40_low20_6 - neg_f_531_low60_40_low20_6,
    r_571_578 * (const 64 2) = r_571_577 - u_571_577,
    s_571_578 * (const 64 2) = s_571_577 - v_571_577
;

assume
    neg_f_531_low60_40_low20_7 = neg_g_531_low60_40_low20_6,
    u_571_578 = r_571_577,
    v_571_578 = s_571_577,
    neg_g_531_low60_40_low20_7 * 2 = neg_g_531_low60_40_low20_6 - neg_f_531_low60_40_low20_6,
    r_571_578 * 2 = r_571_577 - u_571_577,
    s_571_578 * 2 = s_571_577 - v_571_577
&&
    true
;

{
    u_571_578 * neg_f_531_low60_40_low20_0 + v_571_578 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_578 * neg_f_531_low60_40_low20_0 + s_571_578 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_7 + u_571_578 * (const 64 (2**21)) + v_571_578 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_7 + r_571_578 * (const 64 (2**21)) + s_571_578 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_7,
    neg_f_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_7,
    neg_g_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 578)) <=s delta, delta <=s (const 64 (1 + 2*578)),
    (const 64 (-(2**20))) <=s u_571_578, u_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_578, v_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_578, r_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_578, s_571_578 <=s (const 64 ((2**20)-1)),
    u_571_578 + v_571_578 <=s (const 64 (2**20)),
    u_571_578 - v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 + v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 - v_571_578 <=s (const 64 (2**20)),
    r_571_578 + s_571_578 <=s (const 64 (2**20)),
    r_571_578 - s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 + s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 - s_571_578 <=s (const 64 (2**20)),
    u_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_571_578 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_578_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_7,
sint64 neg_g_531_low60_40_low20_7,
sint64 neg_f_531_low60_40_low20_8,
sint64 neg_g_531_low60_40_low20_8,
sint64 u_571_578,
sint64 v_571_578,
sint64 r_571_578,
sint64 s_571_578,
sint64 u_571_579,
sint64 v_571_579,
sint64 r_571_579,
sint64 s_571_579,
bit ne
)={
    u_571_578 * neg_f_531_low60_40_low20_0 + v_571_578 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_7 * (-(2**20)),
    r_571_578 * neg_f_531_low60_40_low20_0 + s_571_578 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_7 * (-(2**20))
&&
    u_571_578 * neg_f_531_low60_40_low20_0 + v_571_578 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_7 * (const 64 (-(2**20))),
    r_571_578 * neg_f_531_low60_40_low20_0 + s_571_578 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_7 + u_571_578 * (const 64 (2**21)) + v_571_578 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_7 + r_571_578 * (const 64 (2**21)) + s_571_578 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_7,
    neg_f_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_7,
    neg_g_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 578)) <=s delta, delta <=s (const 64 (1 + 2*578)),
    (const 64 (-(2**20))) <=s u_571_578, u_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_578, v_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_578, r_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_578, s_571_578 <=s (const 64 ((2**20)-1)),
    u_571_578 + v_571_578 <=s (const 64 (2**20)),
    u_571_578 - v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 + v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 - v_571_578 <=s (const 64 (2**20)),
    r_571_578 + s_571_578 <=s (const 64 (2**20)),
    r_571_578 - s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 + s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 - s_571_578 <=s (const 64 (2**20)),
    u_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_571_578 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step578

// premise a
assume
neg_g_531_low60_40_low20_7 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_7 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_8 neg_f_531_low60_40_low20_7;
mov u_571_579 u_571_578;
mov v_571_579 v_571_578;

asr neg_g_531_low60_40_low20_8 neg_g_531_low60_40_low20_7 1;
asr r_571_579 r_571_578 1;
asr s_571_579 s_571_578 1;
assert
    true
&&
    neg_f_531_low60_40_low20_8 = neg_f_531_low60_40_low20_7,
    u_571_579 = u_571_578,
    v_571_579 = v_571_578,
    neg_g_531_low60_40_low20_8 * (const 64 2) = neg_g_531_low60_40_low20_7,
    r_571_579 * (const 64 2) = r_571_578,
    s_571_579 * (const 64 2) = s_571_578
;

assume
    neg_f_531_low60_40_low20_8 = neg_f_531_low60_40_low20_7,
    u_571_579 = u_571_578,
    v_571_579 = v_571_578,
    neg_g_531_low60_40_low20_8 * 2 = neg_g_531_low60_40_low20_7,
    r_571_579 * 2 = r_571_578,
    s_571_579 * 2 = s_571_578
&&
    true
;

{
    u_571_579 * neg_f_531_low60_40_low20_0 + v_571_579 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_579 * neg_f_531_low60_40_low20_0 + s_571_579 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_8 + u_571_579 * (const 64 (2**21)) + v_571_579 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_8 + r_571_579 * (const 64 (2**21)) + s_571_579 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_8,
    neg_f_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_8,
    neg_g_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 579)) <=s delta, delta <=s (const 64 (1 + 2*579)),
    (const 64 (-(2**20))) <=s u_571_579, u_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_579, v_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_579, r_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_579, s_571_579 <=s (const 64 ((2**20)-1)),
    u_571_579 + v_571_579 <=s (const 64 (2**20)),
    u_571_579 - v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 + v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 - v_571_579 <=s (const 64 (2**20)),
    r_571_579 + s_571_579 <=s (const 64 (2**20)),
    r_571_579 - s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 + s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 - s_571_579 <=s (const 64 (2**20)),
    u_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_571_579 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_578_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_7,
sint64 neg_g_531_low60_40_low20_7,
sint64 neg_f_531_low60_40_low20_8,
sint64 neg_g_531_low60_40_low20_8,
sint64 u_571_578,
sint64 v_571_578,
sint64 r_571_578,
sint64 s_571_578,
sint64 u_571_579,
sint64 v_571_579,
sint64 r_571_579,
sint64 s_571_579,
bit ne
)={
    u_571_578 * neg_f_531_low60_40_low20_0 + v_571_578 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_7 * (-(2**20)),
    r_571_578 * neg_f_531_low60_40_low20_0 + s_571_578 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_7 * (-(2**20))
&&
    u_571_578 * neg_f_531_low60_40_low20_0 + v_571_578 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_7 * (const 64 (-(2**20))),
    r_571_578 * neg_f_531_low60_40_low20_0 + s_571_578 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_7 + u_571_578 * (const 64 (2**21)) + v_571_578 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_7 + r_571_578 * (const 64 (2**21)) + s_571_578 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_7,
    neg_f_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_7,
    neg_g_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 578)) <=s delta, delta <=s (const 64 (1 + 2*578)),
    (const 64 (-(2**20))) <=s u_571_578, u_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_578, v_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_578, r_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_578, s_571_578 <=s (const 64 ((2**20)-1)),
    u_571_578 + v_571_578 <=s (const 64 (2**20)),
    u_571_578 - v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 + v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 - v_571_578 <=s (const 64 (2**20)),
    r_571_578 + s_571_578 <=s (const 64 (2**20)),
    r_571_578 - s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 + s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 - s_571_578 <=s (const 64 (2**20)),
    u_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_571_578 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step578

// premise b
assume
neg_g_531_low60_40_low20_7 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_8 neg_f_531_low60_40_low20_7;
mov u_571_579 u_571_578;
mov v_571_579 v_571_578;

add neg_g_531_low60_40_low20_8 neg_g_531_low60_40_low20_7 neg_f_531_low60_40_low20_7;
asr neg_g_531_low60_40_low20_8 neg_g_531_low60_40_low20_8 1;
add r_571_579 r_571_578 u_571_578;
asr r_571_579 r_571_579 1;
add s_571_579 s_571_578 v_571_578;
asr s_571_579 s_571_579 1;
assert
    true
&&
    neg_f_531_low60_40_low20_8 = neg_f_531_low60_40_low20_7,
    u_571_579 = u_571_578,
    v_571_579 = v_571_578,
    neg_g_531_low60_40_low20_8 * (const 64 2) = neg_g_531_low60_40_low20_7 + neg_f_531_low60_40_low20_7,
    r_571_579 * (const 64 2) = r_571_578 + u_571_578,
    s_571_579 * (const 64 2) = s_571_578 + v_571_578
;

assume
    neg_f_531_low60_40_low20_8 = neg_f_531_low60_40_low20_7,
    u_571_579 = u_571_578,
    v_571_579 = v_571_578,
    neg_g_531_low60_40_low20_8 * 2 = neg_g_531_low60_40_low20_7 + neg_f_531_low60_40_low20_7,
    r_571_579 * 2 = r_571_578 + u_571_578,
    s_571_579 * 2 = s_571_578 + v_571_578
&&
    true
;

{
    u_571_579 * neg_f_531_low60_40_low20_0 + v_571_579 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_579 * neg_f_531_low60_40_low20_0 + s_571_579 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_8 + u_571_579 * (const 64 (2**21)) + v_571_579 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_8 + r_571_579 * (const 64 (2**21)) + s_571_579 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_8,
    neg_f_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_8,
    neg_g_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 579)) <=s delta, delta <=s (const 64 (1 + 2*579)),
    (const 64 (-(2**20))) <=s u_571_579, u_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_579, v_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_579, r_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_579, s_571_579 <=s (const 64 ((2**20)-1)),
    u_571_579 + v_571_579 <=s (const 64 (2**20)),
    u_571_579 - v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 + v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 - v_571_579 <=s (const 64 (2**20)),
    r_571_579 + s_571_579 <=s (const 64 (2**20)),
    r_571_579 - s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 + s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 - s_571_579 <=s (const 64 (2**20)),
    u_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_571_579 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_578_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_7,
sint64 neg_g_531_low60_40_low20_7,
sint64 neg_f_531_low60_40_low20_8,
sint64 neg_g_531_low60_40_low20_8,
sint64 u_571_578,
sint64 v_571_578,
sint64 r_571_578,
sint64 s_571_578,
sint64 u_571_579,
sint64 v_571_579,
sint64 r_571_579,
sint64 s_571_579,
bit ne
)={
    u_571_578 * neg_f_531_low60_40_low20_0 + v_571_578 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_7 * (-(2**20)),
    r_571_578 * neg_f_531_low60_40_low20_0 + s_571_578 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_7 * (-(2**20))
&&
    u_571_578 * neg_f_531_low60_40_low20_0 + v_571_578 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_7 * (const 64 (-(2**20))),
    r_571_578 * neg_f_531_low60_40_low20_0 + s_571_578 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_7 + u_571_578 * (const 64 (2**21)) + v_571_578 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_7 + r_571_578 * (const 64 (2**21)) + s_571_578 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_7,
    neg_f_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_7,
    neg_g_531_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 578)) <=s delta, delta <=s (const 64 (1 + 2*578)),
    (const 64 (-(2**20))) <=s u_571_578, u_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_578, v_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_578, r_571_578 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_578, s_571_578 <=s (const 64 ((2**20)-1)),
    u_571_578 + v_571_578 <=s (const 64 (2**20)),
    u_571_578 - v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 + v_571_578 <=s (const 64 (2**20)),
    (const 64 0) - u_571_578 - v_571_578 <=s (const 64 (2**20)),
    r_571_578 + s_571_578 <=s (const 64 (2**20)),
    r_571_578 - s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 + s_571_578 <=s (const 64 (2**20)),
    (const 64 0) - r_571_578 - s_571_578 <=s (const 64 (2**20)),
    u_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_571_578 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_571_578 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step578

// premise c
assume
neg_g_531_low60_40_low20_7 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_8 neg_g_531_low60_40_low20_7;
mov u_571_579 r_571_578;
mov v_571_579 s_571_578;

subs dc neg_g_531_low60_40_low20_8 neg_g_531_low60_40_low20_7 neg_f_531_low60_40_low20_7;
asr neg_g_531_low60_40_low20_8 neg_g_531_low60_40_low20_8 1;
subs dc r_571_579 r_571_578 u_571_578;
asr r_571_579 r_571_579 1;
subs dc s_571_579 s_571_578 v_571_578;
asr s_571_579 s_571_579 1;
assert
    true
&&
    neg_f_531_low60_40_low20_8 = neg_g_531_low60_40_low20_7,
    u_571_579 = r_571_578,
    v_571_579 = s_571_578,
    neg_g_531_low60_40_low20_8 * (const 64 2) = neg_g_531_low60_40_low20_7 - neg_f_531_low60_40_low20_7,
    r_571_579 * (const 64 2) = r_571_578 - u_571_578,
    s_571_579 * (const 64 2) = s_571_578 - v_571_578
;

assume
    neg_f_531_low60_40_low20_8 = neg_g_531_low60_40_low20_7,
    u_571_579 = r_571_578,
    v_571_579 = s_571_578,
    neg_g_531_low60_40_low20_8 * 2 = neg_g_531_low60_40_low20_7 - neg_f_531_low60_40_low20_7,
    r_571_579 * 2 = r_571_578 - u_571_578,
    s_571_579 * 2 = s_571_578 - v_571_578
&&
    true
;

{
    u_571_579 * neg_f_531_low60_40_low20_0 + v_571_579 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_579 * neg_f_531_low60_40_low20_0 + s_571_579 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_8 + u_571_579 * (const 64 (2**21)) + v_571_579 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_8 + r_571_579 * (const 64 (2**21)) + s_571_579 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_8,
    neg_f_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_8,
    neg_g_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 579)) <=s delta, delta <=s (const 64 (1 + 2*579)),
    (const 64 (-(2**20))) <=s u_571_579, u_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_579, v_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_579, r_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_579, s_571_579 <=s (const 64 ((2**20)-1)),
    u_571_579 + v_571_579 <=s (const 64 (2**20)),
    u_571_579 - v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 + v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 - v_571_579 <=s (const 64 (2**20)),
    r_571_579 + s_571_579 <=s (const 64 (2**20)),
    r_571_579 - s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 + s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 - s_571_579 <=s (const 64 (2**20)),
    u_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_571_579 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_579_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_8,
sint64 neg_g_531_low60_40_low20_8,
sint64 neg_f_531_low60_40_low20_9,
sint64 neg_g_531_low60_40_low20_9,
sint64 u_571_579,
sint64 v_571_579,
sint64 r_571_579,
sint64 s_571_579,
sint64 u_571_580,
sint64 v_571_580,
sint64 r_571_580,
sint64 s_571_580,
bit ne
)={
    u_571_579 * neg_f_531_low60_40_low20_0 + v_571_579 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_8 * (-(2**20)),
    r_571_579 * neg_f_531_low60_40_low20_0 + s_571_579 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_8 * (-(2**20))
&&
    u_571_579 * neg_f_531_low60_40_low20_0 + v_571_579 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_8 * (const 64 (-(2**20))),
    r_571_579 * neg_f_531_low60_40_low20_0 + s_571_579 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_8 + u_571_579 * (const 64 (2**21)) + v_571_579 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_8 + r_571_579 * (const 64 (2**21)) + s_571_579 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_8,
    neg_f_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_8,
    neg_g_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 579)) <=s delta, delta <=s (const 64 (1 + 2*579)),
    (const 64 (-(2**20))) <=s u_571_579, u_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_579, v_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_579, r_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_579, s_571_579 <=s (const 64 ((2**20)-1)),
    u_571_579 + v_571_579 <=s (const 64 (2**20)),
    u_571_579 - v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 + v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 - v_571_579 <=s (const 64 (2**20)),
    r_571_579 + s_571_579 <=s (const 64 (2**20)),
    r_571_579 - s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 + s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 - s_571_579 <=s (const 64 (2**20)),
    u_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_571_579 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step579

// premise a
assume
neg_g_531_low60_40_low20_8 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_8 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_9 neg_f_531_low60_40_low20_8;
mov u_571_580 u_571_579;
mov v_571_580 v_571_579;

asr neg_g_531_low60_40_low20_9 neg_g_531_low60_40_low20_8 1;
asr r_571_580 r_571_579 1;
asr s_571_580 s_571_579 1;
assert
    true
&&
    neg_f_531_low60_40_low20_9 = neg_f_531_low60_40_low20_8,
    u_571_580 = u_571_579,
    v_571_580 = v_571_579,
    neg_g_531_low60_40_low20_9 * (const 64 2) = neg_g_531_low60_40_low20_8,
    r_571_580 * (const 64 2) = r_571_579,
    s_571_580 * (const 64 2) = s_571_579
;

assume
    neg_f_531_low60_40_low20_9 = neg_f_531_low60_40_low20_8,
    u_571_580 = u_571_579,
    v_571_580 = v_571_579,
    neg_g_531_low60_40_low20_9 * 2 = neg_g_531_low60_40_low20_8,
    r_571_580 * 2 = r_571_579,
    s_571_580 * 2 = s_571_579
&&
    true
;

{
    u_571_580 * neg_f_531_low60_40_low20_0 + v_571_580 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_580 * neg_f_531_low60_40_low20_0 + s_571_580 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_9 + u_571_580 * (const 64 (2**21)) + v_571_580 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_9 + r_571_580 * (const 64 (2**21)) + s_571_580 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_9,
    neg_f_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_9,
    neg_g_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 580)) <=s delta, delta <=s (const 64 (1 + 2*580)),
    (const 64 (-(2**20))) <=s u_571_580, u_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_580, v_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_580, r_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_580, s_571_580 <=s (const 64 ((2**20)-1)),
    u_571_580 + v_571_580 <=s (const 64 (2**20)),
    u_571_580 - v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 + v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 - v_571_580 <=s (const 64 (2**20)),
    r_571_580 + s_571_580 <=s (const 64 (2**20)),
    r_571_580 - s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 + s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 - s_571_580 <=s (const 64 (2**20)),
    u_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_571_580 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_579_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_8,
sint64 neg_g_531_low60_40_low20_8,
sint64 neg_f_531_low60_40_low20_9,
sint64 neg_g_531_low60_40_low20_9,
sint64 u_571_579,
sint64 v_571_579,
sint64 r_571_579,
sint64 s_571_579,
sint64 u_571_580,
sint64 v_571_580,
sint64 r_571_580,
sint64 s_571_580,
bit ne
)={
    u_571_579 * neg_f_531_low60_40_low20_0 + v_571_579 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_8 * (-(2**20)),
    r_571_579 * neg_f_531_low60_40_low20_0 + s_571_579 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_8 * (-(2**20))
&&
    u_571_579 * neg_f_531_low60_40_low20_0 + v_571_579 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_8 * (const 64 (-(2**20))),
    r_571_579 * neg_f_531_low60_40_low20_0 + s_571_579 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_8 + u_571_579 * (const 64 (2**21)) + v_571_579 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_8 + r_571_579 * (const 64 (2**21)) + s_571_579 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_8,
    neg_f_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_8,
    neg_g_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 579)) <=s delta, delta <=s (const 64 (1 + 2*579)),
    (const 64 (-(2**20))) <=s u_571_579, u_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_579, v_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_579, r_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_579, s_571_579 <=s (const 64 ((2**20)-1)),
    u_571_579 + v_571_579 <=s (const 64 (2**20)),
    u_571_579 - v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 + v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 - v_571_579 <=s (const 64 (2**20)),
    r_571_579 + s_571_579 <=s (const 64 (2**20)),
    r_571_579 - s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 + s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 - s_571_579 <=s (const 64 (2**20)),
    u_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_571_579 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step579

// premise b
assume
neg_g_531_low60_40_low20_8 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_9 neg_f_531_low60_40_low20_8;
mov u_571_580 u_571_579;
mov v_571_580 v_571_579;

add neg_g_531_low60_40_low20_9 neg_g_531_low60_40_low20_8 neg_f_531_low60_40_low20_8;
asr neg_g_531_low60_40_low20_9 neg_g_531_low60_40_low20_9 1;
add r_571_580 r_571_579 u_571_579;
asr r_571_580 r_571_580 1;
add s_571_580 s_571_579 v_571_579;
asr s_571_580 s_571_580 1;
assert
    true
&&
    neg_f_531_low60_40_low20_9 = neg_f_531_low60_40_low20_8,
    u_571_580 = u_571_579,
    v_571_580 = v_571_579,
    neg_g_531_low60_40_low20_9 * (const 64 2) = neg_g_531_low60_40_low20_8 + neg_f_531_low60_40_low20_8,
    r_571_580 * (const 64 2) = r_571_579 + u_571_579,
    s_571_580 * (const 64 2) = s_571_579 + v_571_579
;

assume
    neg_f_531_low60_40_low20_9 = neg_f_531_low60_40_low20_8,
    u_571_580 = u_571_579,
    v_571_580 = v_571_579,
    neg_g_531_low60_40_low20_9 * 2 = neg_g_531_low60_40_low20_8 + neg_f_531_low60_40_low20_8,
    r_571_580 * 2 = r_571_579 + u_571_579,
    s_571_580 * 2 = s_571_579 + v_571_579
&&
    true
;

{
    u_571_580 * neg_f_531_low60_40_low20_0 + v_571_580 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_580 * neg_f_531_low60_40_low20_0 + s_571_580 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_9 + u_571_580 * (const 64 (2**21)) + v_571_580 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_9 + r_571_580 * (const 64 (2**21)) + s_571_580 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_9,
    neg_f_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_9,
    neg_g_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 580)) <=s delta, delta <=s (const 64 (1 + 2*580)),
    (const 64 (-(2**20))) <=s u_571_580, u_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_580, v_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_580, r_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_580, s_571_580 <=s (const 64 ((2**20)-1)),
    u_571_580 + v_571_580 <=s (const 64 (2**20)),
    u_571_580 - v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 + v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 - v_571_580 <=s (const 64 (2**20)),
    r_571_580 + s_571_580 <=s (const 64 (2**20)),
    r_571_580 - s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 + s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 - s_571_580 <=s (const 64 (2**20)),
    u_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_571_580 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_579_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_8,
sint64 neg_g_531_low60_40_low20_8,
sint64 neg_f_531_low60_40_low20_9,
sint64 neg_g_531_low60_40_low20_9,
sint64 u_571_579,
sint64 v_571_579,
sint64 r_571_579,
sint64 s_571_579,
sint64 u_571_580,
sint64 v_571_580,
sint64 r_571_580,
sint64 s_571_580,
bit ne
)={
    u_571_579 * neg_f_531_low60_40_low20_0 + v_571_579 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_8 * (-(2**20)),
    r_571_579 * neg_f_531_low60_40_low20_0 + s_571_579 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_8 * (-(2**20))
&&
    u_571_579 * neg_f_531_low60_40_low20_0 + v_571_579 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_8 * (const 64 (-(2**20))),
    r_571_579 * neg_f_531_low60_40_low20_0 + s_571_579 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_8 + u_571_579 * (const 64 (2**21)) + v_571_579 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_8 + r_571_579 * (const 64 (2**21)) + s_571_579 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_8,
    neg_f_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_8,
    neg_g_531_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 579)) <=s delta, delta <=s (const 64 (1 + 2*579)),
    (const 64 (-(2**20))) <=s u_571_579, u_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_579, v_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_579, r_571_579 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_579, s_571_579 <=s (const 64 ((2**20)-1)),
    u_571_579 + v_571_579 <=s (const 64 (2**20)),
    u_571_579 - v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 + v_571_579 <=s (const 64 (2**20)),
    (const 64 0) - u_571_579 - v_571_579 <=s (const 64 (2**20)),
    r_571_579 + s_571_579 <=s (const 64 (2**20)),
    r_571_579 - s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 + s_571_579 <=s (const 64 (2**20)),
    (const 64 0) - r_571_579 - s_571_579 <=s (const 64 (2**20)),
    u_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_571_579 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_571_579 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step579

// premise c
assume
neg_g_531_low60_40_low20_8 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_9 neg_g_531_low60_40_low20_8;
mov u_571_580 r_571_579;
mov v_571_580 s_571_579;

subs dc neg_g_531_low60_40_low20_9 neg_g_531_low60_40_low20_8 neg_f_531_low60_40_low20_8;
asr neg_g_531_low60_40_low20_9 neg_g_531_low60_40_low20_9 1;
subs dc r_571_580 r_571_579 u_571_579;
asr r_571_580 r_571_580 1;
subs dc s_571_580 s_571_579 v_571_579;
asr s_571_580 s_571_580 1;
assert
    true
&&
    neg_f_531_low60_40_low20_9 = neg_g_531_low60_40_low20_8,
    u_571_580 = r_571_579,
    v_571_580 = s_571_579,
    neg_g_531_low60_40_low20_9 * (const 64 2) = neg_g_531_low60_40_low20_8 - neg_f_531_low60_40_low20_8,
    r_571_580 * (const 64 2) = r_571_579 - u_571_579,
    s_571_580 * (const 64 2) = s_571_579 - v_571_579
;

assume
    neg_f_531_low60_40_low20_9 = neg_g_531_low60_40_low20_8,
    u_571_580 = r_571_579,
    v_571_580 = s_571_579,
    neg_g_531_low60_40_low20_9 * 2 = neg_g_531_low60_40_low20_8 - neg_f_531_low60_40_low20_8,
    r_571_580 * 2 = r_571_579 - u_571_579,
    s_571_580 * 2 = s_571_579 - v_571_579
&&
    true
;

{
    u_571_580 * neg_f_531_low60_40_low20_0 + v_571_580 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_580 * neg_f_531_low60_40_low20_0 + s_571_580 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_9 + u_571_580 * (const 64 (2**21)) + v_571_580 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_9 + r_571_580 * (const 64 (2**21)) + s_571_580 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_9,
    neg_f_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_9,
    neg_g_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 580)) <=s delta, delta <=s (const 64 (1 + 2*580)),
    (const 64 (-(2**20))) <=s u_571_580, u_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_580, v_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_580, r_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_580, s_571_580 <=s (const 64 ((2**20)-1)),
    u_571_580 + v_571_580 <=s (const 64 (2**20)),
    u_571_580 - v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 + v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 - v_571_580 <=s (const 64 (2**20)),
    r_571_580 + s_571_580 <=s (const 64 (2**20)),
    r_571_580 - s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 + s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 - s_571_580 <=s (const 64 (2**20)),
    u_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_571_580 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_580_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_9,
sint64 neg_g_531_low60_40_low20_9,
sint64 neg_f_531_low60_40_low20_10,
sint64 neg_g_531_low60_40_low20_10,
sint64 u_571_580,
sint64 v_571_580,
sint64 r_571_580,
sint64 s_571_580,
sint64 u_571_581,
sint64 v_571_581,
sint64 r_571_581,
sint64 s_571_581,
bit ne
)={
    u_571_580 * neg_f_531_low60_40_low20_0 + v_571_580 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_9 * (-(2**20)),
    r_571_580 * neg_f_531_low60_40_low20_0 + s_571_580 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_9 * (-(2**20))
&&
    u_571_580 * neg_f_531_low60_40_low20_0 + v_571_580 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_9 * (const 64 (-(2**20))),
    r_571_580 * neg_f_531_low60_40_low20_0 + s_571_580 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_9 + u_571_580 * (const 64 (2**21)) + v_571_580 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_9 + r_571_580 * (const 64 (2**21)) + s_571_580 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_9,
    neg_f_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_9,
    neg_g_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 580)) <=s delta, delta <=s (const 64 (1 + 2*580)),
    (const 64 (-(2**20))) <=s u_571_580, u_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_580, v_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_580, r_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_580, s_571_580 <=s (const 64 ((2**20)-1)),
    u_571_580 + v_571_580 <=s (const 64 (2**20)),
    u_571_580 - v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 + v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 - v_571_580 <=s (const 64 (2**20)),
    r_571_580 + s_571_580 <=s (const 64 (2**20)),
    r_571_580 - s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 + s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 - s_571_580 <=s (const 64 (2**20)),
    u_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_571_580 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step580

// premise a
assume
neg_g_531_low60_40_low20_9 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_9 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_10 neg_f_531_low60_40_low20_9;
mov u_571_581 u_571_580;
mov v_571_581 v_571_580;

asr neg_g_531_low60_40_low20_10 neg_g_531_low60_40_low20_9 1;
asr r_571_581 r_571_580 1;
asr s_571_581 s_571_580 1;
assert
    true
&&
    neg_f_531_low60_40_low20_10 = neg_f_531_low60_40_low20_9,
    u_571_581 = u_571_580,
    v_571_581 = v_571_580,
    neg_g_531_low60_40_low20_10 * (const 64 2) = neg_g_531_low60_40_low20_9,
    r_571_581 * (const 64 2) = r_571_580,
    s_571_581 * (const 64 2) = s_571_580
;

assume
    neg_f_531_low60_40_low20_10 = neg_f_531_low60_40_low20_9,
    u_571_581 = u_571_580,
    v_571_581 = v_571_580,
    neg_g_531_low60_40_low20_10 * 2 = neg_g_531_low60_40_low20_9,
    r_571_581 * 2 = r_571_580,
    s_571_581 * 2 = s_571_580
&&
    true
;

{
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_10 + u_571_581 * (const 64 (2**21)) + v_571_581 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_10 + r_571_581 * (const 64 (2**21)) + s_571_581 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_10,
    neg_f_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_10,
    neg_g_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 581)) <=s delta, delta <=s (const 64 (1 + 2*581)),
    (const 64 (-(2**20))) <=s u_571_581, u_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_581, v_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_581, r_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_581, s_571_581 <=s (const 64 ((2**20)-1)),
    u_571_581 + v_571_581 <=s (const 64 (2**20)),
    u_571_581 - v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 + v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 - v_571_581 <=s (const 64 (2**20)),
    r_571_581 + s_571_581 <=s (const 64 (2**20)),
    r_571_581 - s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 + s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 - s_571_581 <=s (const 64 (2**20)),
    u_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_571_581 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_580_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_9,
sint64 neg_g_531_low60_40_low20_9,
sint64 neg_f_531_low60_40_low20_10,
sint64 neg_g_531_low60_40_low20_10,
sint64 u_571_580,
sint64 v_571_580,
sint64 r_571_580,
sint64 s_571_580,
sint64 u_571_581,
sint64 v_571_581,
sint64 r_571_581,
sint64 s_571_581,
bit ne
)={
    u_571_580 * neg_f_531_low60_40_low20_0 + v_571_580 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_9 * (-(2**20)),
    r_571_580 * neg_f_531_low60_40_low20_0 + s_571_580 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_9 * (-(2**20))
&&
    u_571_580 * neg_f_531_low60_40_low20_0 + v_571_580 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_9 * (const 64 (-(2**20))),
    r_571_580 * neg_f_531_low60_40_low20_0 + s_571_580 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_9 + u_571_580 * (const 64 (2**21)) + v_571_580 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_9 + r_571_580 * (const 64 (2**21)) + s_571_580 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_9,
    neg_f_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_9,
    neg_g_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 580)) <=s delta, delta <=s (const 64 (1 + 2*580)),
    (const 64 (-(2**20))) <=s u_571_580, u_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_580, v_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_580, r_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_580, s_571_580 <=s (const 64 ((2**20)-1)),
    u_571_580 + v_571_580 <=s (const 64 (2**20)),
    u_571_580 - v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 + v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 - v_571_580 <=s (const 64 (2**20)),
    r_571_580 + s_571_580 <=s (const 64 (2**20)),
    r_571_580 - s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 + s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 - s_571_580 <=s (const 64 (2**20)),
    u_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_571_580 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step580

// premise b
assume
neg_g_531_low60_40_low20_9 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_10 neg_f_531_low60_40_low20_9;
mov u_571_581 u_571_580;
mov v_571_581 v_571_580;

add neg_g_531_low60_40_low20_10 neg_g_531_low60_40_low20_9 neg_f_531_low60_40_low20_9;
asr neg_g_531_low60_40_low20_10 neg_g_531_low60_40_low20_10 1;
add r_571_581 r_571_580 u_571_580;
asr r_571_581 r_571_581 1;
add s_571_581 s_571_580 v_571_580;
asr s_571_581 s_571_581 1;
assert
    true
&&
    neg_f_531_low60_40_low20_10 = neg_f_531_low60_40_low20_9,
    u_571_581 = u_571_580,
    v_571_581 = v_571_580,
    neg_g_531_low60_40_low20_10 * (const 64 2) = neg_g_531_low60_40_low20_9 + neg_f_531_low60_40_low20_9,
    r_571_581 * (const 64 2) = r_571_580 + u_571_580,
    s_571_581 * (const 64 2) = s_571_580 + v_571_580
;

assume
    neg_f_531_low60_40_low20_10 = neg_f_531_low60_40_low20_9,
    u_571_581 = u_571_580,
    v_571_581 = v_571_580,
    neg_g_531_low60_40_low20_10 * 2 = neg_g_531_low60_40_low20_9 + neg_f_531_low60_40_low20_9,
    r_571_581 * 2 = r_571_580 + u_571_580,
    s_571_581 * 2 = s_571_580 + v_571_580
&&
    true
;

{
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_10 + u_571_581 * (const 64 (2**21)) + v_571_581 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_10 + r_571_581 * (const 64 (2**21)) + s_571_581 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_10,
    neg_f_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_10,
    neg_g_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 581)) <=s delta, delta <=s (const 64 (1 + 2*581)),
    (const 64 (-(2**20))) <=s u_571_581, u_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_581, v_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_581, r_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_581, s_571_581 <=s (const 64 ((2**20)-1)),
    u_571_581 + v_571_581 <=s (const 64 (2**20)),
    u_571_581 - v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 + v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 - v_571_581 <=s (const 64 (2**20)),
    r_571_581 + s_571_581 <=s (const 64 (2**20)),
    r_571_581 - s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 + s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 - s_571_581 <=s (const 64 (2**20)),
    u_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_571_581 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_580_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_9,
sint64 neg_g_531_low60_40_low20_9,
sint64 neg_f_531_low60_40_low20_10,
sint64 neg_g_531_low60_40_low20_10,
sint64 u_571_580,
sint64 v_571_580,
sint64 r_571_580,
sint64 s_571_580,
sint64 u_571_581,
sint64 v_571_581,
sint64 r_571_581,
sint64 s_571_581,
bit ne
)={
    u_571_580 * neg_f_531_low60_40_low20_0 + v_571_580 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_9 * (-(2**20)),
    r_571_580 * neg_f_531_low60_40_low20_0 + s_571_580 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_9 * (-(2**20))
&&
    u_571_580 * neg_f_531_low60_40_low20_0 + v_571_580 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_9 * (const 64 (-(2**20))),
    r_571_580 * neg_f_531_low60_40_low20_0 + s_571_580 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_9 + u_571_580 * (const 64 (2**21)) + v_571_580 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_9 + r_571_580 * (const 64 (2**21)) + s_571_580 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_9,
    neg_f_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_9,
    neg_g_531_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 580)) <=s delta, delta <=s (const 64 (1 + 2*580)),
    (const 64 (-(2**20))) <=s u_571_580, u_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_580, v_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_580, r_571_580 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_580, s_571_580 <=s (const 64 ((2**20)-1)),
    u_571_580 + v_571_580 <=s (const 64 (2**20)),
    u_571_580 - v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 + v_571_580 <=s (const 64 (2**20)),
    (const 64 0) - u_571_580 - v_571_580 <=s (const 64 (2**20)),
    r_571_580 + s_571_580 <=s (const 64 (2**20)),
    r_571_580 - s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 + s_571_580 <=s (const 64 (2**20)),
    (const 64 0) - r_571_580 - s_571_580 <=s (const 64 (2**20)),
    u_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_571_580 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_571_580 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step580

// premise c
assume
neg_g_531_low60_40_low20_9 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_10 neg_g_531_low60_40_low20_9;
mov u_571_581 r_571_580;
mov v_571_581 s_571_580;

subs dc neg_g_531_low60_40_low20_10 neg_g_531_low60_40_low20_9 neg_f_531_low60_40_low20_9;
asr neg_g_531_low60_40_low20_10 neg_g_531_low60_40_low20_10 1;
subs dc r_571_581 r_571_580 u_571_580;
asr r_571_581 r_571_581 1;
subs dc s_571_581 s_571_580 v_571_580;
asr s_571_581 s_571_581 1;
assert
    true
&&
    neg_f_531_low60_40_low20_10 = neg_g_531_low60_40_low20_9,
    u_571_581 = r_571_580,
    v_571_581 = s_571_580,
    neg_g_531_low60_40_low20_10 * (const 64 2) = neg_g_531_low60_40_low20_9 - neg_f_531_low60_40_low20_9,
    r_571_581 * (const 64 2) = r_571_580 - u_571_580,
    s_571_581 * (const 64 2) = s_571_580 - v_571_580
;

assume
    neg_f_531_low60_40_low20_10 = neg_g_531_low60_40_low20_9,
    u_571_581 = r_571_580,
    v_571_581 = s_571_580,
    neg_g_531_low60_40_low20_10 * 2 = neg_g_531_low60_40_low20_9 - neg_f_531_low60_40_low20_9,
    r_571_581 * 2 = r_571_580 - u_571_580,
    s_571_581 * 2 = s_571_580 - v_571_580
&&
    true
;

{
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_10 + u_571_581 * (const 64 (2**21)) + v_571_581 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_10 + r_571_581 * (const 64 (2**21)) + s_571_581 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_10,
    neg_f_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_10,
    neg_g_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 581)) <=s delta, delta <=s (const 64 (1 + 2*581)),
    (const 64 (-(2**20))) <=s u_571_581, u_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_581, v_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_581, r_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_581, s_571_581 <=s (const 64 ((2**20)-1)),
    u_571_581 + v_571_581 <=s (const 64 (2**20)),
    u_571_581 - v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 + v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 - v_571_581 <=s (const 64 (2**20)),
    r_571_581 + s_571_581 <=s (const 64 (2**20)),
    r_571_581 - s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 + s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 - s_571_581 <=s (const 64 (2**20)),
    u_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_571_581 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_581_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_10,
sint64 neg_g_531_low60_40_low20_10,
sint64 neg_f_531_low60_40_low20_11,
sint64 neg_g_531_low60_40_low20_11,
sint64 u_571_581,
sint64 v_571_581,
sint64 r_571_581,
sint64 s_571_581,
sint64 u_571_582,
sint64 v_571_582,
sint64 r_571_582,
sint64 s_571_582,
bit ne
)={
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (-(2**20)),
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (-(2**20))
&&
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (const 64 (-(2**20))),
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_10 + u_571_581 * (const 64 (2**21)) + v_571_581 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_10 + r_571_581 * (const 64 (2**21)) + s_571_581 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_10,
    neg_f_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_10,
    neg_g_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 581)) <=s delta, delta <=s (const 64 (1 + 2*581)),
    (const 64 (-(2**20))) <=s u_571_581, u_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_581, v_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_581, r_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_581, s_571_581 <=s (const 64 ((2**20)-1)),
    u_571_581 + v_571_581 <=s (const 64 (2**20)),
    u_571_581 - v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 + v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 - v_571_581 <=s (const 64 (2**20)),
    r_571_581 + s_571_581 <=s (const 64 (2**20)),
    r_571_581 - s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 + s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 - s_571_581 <=s (const 64 (2**20)),
    u_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_571_581 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step581

// premise a
assume
neg_g_531_low60_40_low20_10 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_10 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_11 neg_f_531_low60_40_low20_10;
mov u_571_582 u_571_581;
mov v_571_582 v_571_581;

asr neg_g_531_low60_40_low20_11 neg_g_531_low60_40_low20_10 1;
asr r_571_582 r_571_581 1;
asr s_571_582 s_571_581 1;
assert
    true
&&
    neg_f_531_low60_40_low20_11 = neg_f_531_low60_40_low20_10,
    u_571_582 = u_571_581,
    v_571_582 = v_571_581,
    neg_g_531_low60_40_low20_11 * (const 64 2) = neg_g_531_low60_40_low20_10,
    r_571_582 * (const 64 2) = r_571_581,
    s_571_582 * (const 64 2) = s_571_581
;

assume
    neg_f_531_low60_40_low20_11 = neg_f_531_low60_40_low20_10,
    u_571_582 = u_571_581,
    v_571_582 = v_571_581,
    neg_g_531_low60_40_low20_11 * 2 = neg_g_531_low60_40_low20_10,
    r_571_582 * 2 = r_571_581,
    s_571_582 * 2 = s_571_581
&&
    true
;

{
    u_571_582 * neg_f_531_low60_40_low20_0 + v_571_582 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_582 * neg_f_531_low60_40_low20_0 + s_571_582 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_11 + u_571_582 * (const 64 (2**21)) + v_571_582 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_11 + r_571_582 * (const 64 (2**21)) + s_571_582 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_11,
    neg_f_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_11,
    neg_g_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 582)) <=s delta, delta <=s (const 64 (1 + 2*582)),
    (const 64 (-(2**20))) <=s u_571_582, u_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_582, v_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_582, r_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_582, s_571_582 <=s (const 64 ((2**20)-1)),
    u_571_582 + v_571_582 <=s (const 64 (2**20)),
    u_571_582 - v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 + v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 - v_571_582 <=s (const 64 (2**20)),
    r_571_582 + s_571_582 <=s (const 64 (2**20)),
    r_571_582 - s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 + s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 - s_571_582 <=s (const 64 (2**20)),
    u_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_571_582 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_581_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_10,
sint64 neg_g_531_low60_40_low20_10,
sint64 neg_f_531_low60_40_low20_11,
sint64 neg_g_531_low60_40_low20_11,
sint64 u_571_581,
sint64 v_571_581,
sint64 r_571_581,
sint64 s_571_581,
sint64 u_571_582,
sint64 v_571_582,
sint64 r_571_582,
sint64 s_571_582,
bit ne
)={
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (-(2**20)),
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (-(2**20))
&&
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (const 64 (-(2**20))),
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_10 + u_571_581 * (const 64 (2**21)) + v_571_581 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_10 + r_571_581 * (const 64 (2**21)) + s_571_581 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_10,
    neg_f_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_10,
    neg_g_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 581)) <=s delta, delta <=s (const 64 (1 + 2*581)),
    (const 64 (-(2**20))) <=s u_571_581, u_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_581, v_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_581, r_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_581, s_571_581 <=s (const 64 ((2**20)-1)),
    u_571_581 + v_571_581 <=s (const 64 (2**20)),
    u_571_581 - v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 + v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 - v_571_581 <=s (const 64 (2**20)),
    r_571_581 + s_571_581 <=s (const 64 (2**20)),
    r_571_581 - s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 + s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 - s_571_581 <=s (const 64 (2**20)),
    u_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_571_581 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step581

// premise b
assume
neg_g_531_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_11 neg_f_531_low60_40_low20_10;
mov u_571_582 u_571_581;
mov v_571_582 v_571_581;

add neg_g_531_low60_40_low20_11 neg_g_531_low60_40_low20_10 neg_f_531_low60_40_low20_10;
asr neg_g_531_low60_40_low20_11 neg_g_531_low60_40_low20_11 1;
add r_571_582 r_571_581 u_571_581;
asr r_571_582 r_571_582 1;
add s_571_582 s_571_581 v_571_581;
asr s_571_582 s_571_582 1;
assert
    true
&&
    neg_f_531_low60_40_low20_11 = neg_f_531_low60_40_low20_10,
    u_571_582 = u_571_581,
    v_571_582 = v_571_581,
    neg_g_531_low60_40_low20_11 * (const 64 2) = neg_g_531_low60_40_low20_10 + neg_f_531_low60_40_low20_10,
    r_571_582 * (const 64 2) = r_571_581 + u_571_581,
    s_571_582 * (const 64 2) = s_571_581 + v_571_581
;

assume
    neg_f_531_low60_40_low20_11 = neg_f_531_low60_40_low20_10,
    u_571_582 = u_571_581,
    v_571_582 = v_571_581,
    neg_g_531_low60_40_low20_11 * 2 = neg_g_531_low60_40_low20_10 + neg_f_531_low60_40_low20_10,
    r_571_582 * 2 = r_571_581 + u_571_581,
    s_571_582 * 2 = s_571_581 + v_571_581
&&
    true
;

{
    u_571_582 * neg_f_531_low60_40_low20_0 + v_571_582 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_582 * neg_f_531_low60_40_low20_0 + s_571_582 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_11 + u_571_582 * (const 64 (2**21)) + v_571_582 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_11 + r_571_582 * (const 64 (2**21)) + s_571_582 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_11,
    neg_f_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_11,
    neg_g_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 582)) <=s delta, delta <=s (const 64 (1 + 2*582)),
    (const 64 (-(2**20))) <=s u_571_582, u_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_582, v_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_582, r_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_582, s_571_582 <=s (const 64 ((2**20)-1)),
    u_571_582 + v_571_582 <=s (const 64 (2**20)),
    u_571_582 - v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 + v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 - v_571_582 <=s (const 64 (2**20)),
    r_571_582 + s_571_582 <=s (const 64 (2**20)),
    r_571_582 - s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 + s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 - s_571_582 <=s (const 64 (2**20)),
    u_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_571_582 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_581_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_10,
sint64 neg_g_531_low60_40_low20_10,
sint64 neg_f_531_low60_40_low20_11,
sint64 neg_g_531_low60_40_low20_11,
sint64 u_571_581,
sint64 v_571_581,
sint64 r_571_581,
sint64 s_571_581,
sint64 u_571_582,
sint64 v_571_582,
sint64 r_571_582,
sint64 s_571_582,
bit ne
)={
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (-(2**20)),
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (-(2**20))
&&
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (const 64 (-(2**20))),
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_10 + u_571_581 * (const 64 (2**21)) + v_571_581 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_10 + r_571_581 * (const 64 (2**21)) + s_571_581 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_10,
    neg_f_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_10,
    neg_g_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 581)) <=s delta, delta <=s (const 64 (1 + 2*581)),
    (const 64 (-(2**20))) <=s u_571_581, u_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_581, v_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_581, r_571_581 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_581, s_571_581 <=s (const 64 ((2**20)-1)),
    u_571_581 + v_571_581 <=s (const 64 (2**20)),
    u_571_581 - v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 + v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 - v_571_581 <=s (const 64 (2**20)),
    r_571_581 + s_571_581 <=s (const 64 (2**20)),
    r_571_581 - s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 + s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 - s_571_581 <=s (const 64 (2**20)),
    u_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_571_581 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step581

// premise c
assume
neg_g_531_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_11 neg_g_531_low60_40_low20_10;
mov u_571_582 r_571_581;
mov v_571_582 s_571_581;

subs dc neg_g_531_low60_40_low20_11 neg_g_531_low60_40_low20_10 neg_f_531_low60_40_low20_10;
asr neg_g_531_low60_40_low20_11 neg_g_531_low60_40_low20_11 1;
subs dc r_571_582 r_571_581 u_571_581;
asr r_571_582 r_571_582 1;
subs dc s_571_582 s_571_581 v_571_581;
asr s_571_582 s_571_582 1;
assert
    true
&&
    neg_f_531_low60_40_low20_11 = neg_g_531_low60_40_low20_10,
    u_571_582 = r_571_581,
    v_571_582 = s_571_581,
    neg_g_531_low60_40_low20_11 * (const 64 2) = neg_g_531_low60_40_low20_10 - neg_f_531_low60_40_low20_10,
    r_571_582 * (const 64 2) = r_571_581 - u_571_581,
    s_571_582 * (const 64 2) = s_571_581 - v_571_581
;

assume
    neg_f_531_low60_40_low20_11 = neg_g_531_low60_40_low20_10,
    u_571_582 = r_571_581,
    v_571_582 = s_571_581,
    neg_g_531_low60_40_low20_11 * 2 = neg_g_531_low60_40_low20_10 - neg_f_531_low60_40_low20_10,
    r_571_582 * 2 = r_571_581 - u_571_581,
    s_571_582 * 2 = s_571_581 - v_571_581
&&
    true
;

{
    u_571_582 * neg_f_531_low60_40_low20_0 + v_571_582 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_582 * neg_f_531_low60_40_low20_0 + s_571_582 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_11 + u_571_582 * (const 64 (2**21)) + v_571_582 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_11 + r_571_582 * (const 64 (2**21)) + s_571_582 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_11,
    neg_f_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_11,
    neg_g_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 582)) <=s delta, delta <=s (const 64 (1 + 2*582)),
    (const 64 (-(2**20))) <=s u_571_582, u_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_582, v_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_582, r_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_582, s_571_582 <=s (const 64 ((2**20)-1)),
    u_571_582 + v_571_582 <=s (const 64 (2**20)),
    u_571_582 - v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 + v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 - v_571_582 <=s (const 64 (2**20)),
    r_571_582 + s_571_582 <=s (const 64 (2**20)),
    r_571_582 - s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 + s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 - s_571_582 <=s (const 64 (2**20)),
    u_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_571_582 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_582_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_11,
sint64 neg_g_531_low60_40_low20_11,
sint64 neg_f_531_low60_40_low20_12,
sint64 neg_g_531_low60_40_low20_12,
sint64 u_571_582,
sint64 v_571_582,
sint64 r_571_582,
sint64 s_571_582,
sint64 u_571_583,
sint64 v_571_583,
sint64 r_571_583,
sint64 s_571_583,
bit ne
)={
    u_571_582 * neg_f_531_low60_40_low20_0 + v_571_582 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_11 * (-(2**20)),
    r_571_582 * neg_f_531_low60_40_low20_0 + s_571_582 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_11 * (-(2**20))
&&
    u_571_582 * neg_f_531_low60_40_low20_0 + v_571_582 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_11 * (const 64 (-(2**20))),
    r_571_582 * neg_f_531_low60_40_low20_0 + s_571_582 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_11 + u_571_582 * (const 64 (2**21)) + v_571_582 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_11 + r_571_582 * (const 64 (2**21)) + s_571_582 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_11,
    neg_f_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_11,
    neg_g_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 582)) <=s delta, delta <=s (const 64 (1 + 2*582)),
    (const 64 (-(2**20))) <=s u_571_582, u_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_582, v_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_582, r_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_582, s_571_582 <=s (const 64 ((2**20)-1)),
    u_571_582 + v_571_582 <=s (const 64 (2**20)),
    u_571_582 - v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 + v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 - v_571_582 <=s (const 64 (2**20)),
    r_571_582 + s_571_582 <=s (const 64 (2**20)),
    r_571_582 - s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 + s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 - s_571_582 <=s (const 64 (2**20)),
    u_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_571_582 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step582

// premise a
assume
neg_g_531_low60_40_low20_11 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_11 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_12 neg_f_531_low60_40_low20_11;
mov u_571_583 u_571_582;
mov v_571_583 v_571_582;

asr neg_g_531_low60_40_low20_12 neg_g_531_low60_40_low20_11 1;
asr r_571_583 r_571_582 1;
asr s_571_583 s_571_582 1;
assert
    true
&&
    neg_f_531_low60_40_low20_12 = neg_f_531_low60_40_low20_11,
    u_571_583 = u_571_582,
    v_571_583 = v_571_582,
    neg_g_531_low60_40_low20_12 * (const 64 2) = neg_g_531_low60_40_low20_11,
    r_571_583 * (const 64 2) = r_571_582,
    s_571_583 * (const 64 2) = s_571_582
;

assume
    neg_f_531_low60_40_low20_12 = neg_f_531_low60_40_low20_11,
    u_571_583 = u_571_582,
    v_571_583 = v_571_582,
    neg_g_531_low60_40_low20_12 * 2 = neg_g_531_low60_40_low20_11,
    r_571_583 * 2 = r_571_582,
    s_571_583 * 2 = s_571_582
&&
    true
;

{
    u_571_583 * neg_f_531_low60_40_low20_0 + v_571_583 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_583 * neg_f_531_low60_40_low20_0 + s_571_583 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_12 + u_571_583 * (const 64 (2**21)) + v_571_583 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_12 + r_571_583 * (const 64 (2**21)) + s_571_583 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_12,
    neg_f_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_12,
    neg_g_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 583)) <=s delta, delta <=s (const 64 (1 + 2*583)),
    (const 64 (-(2**20))) <=s u_571_583, u_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_583, v_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_583, r_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_583, s_571_583 <=s (const 64 ((2**20)-1)),
    u_571_583 + v_571_583 <=s (const 64 (2**20)),
    u_571_583 - v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 + v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 - v_571_583 <=s (const 64 (2**20)),
    r_571_583 + s_571_583 <=s (const 64 (2**20)),
    r_571_583 - s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 + s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 - s_571_583 <=s (const 64 (2**20)),
    u_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_571_583 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_582_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_11,
sint64 neg_g_531_low60_40_low20_11,
sint64 neg_f_531_low60_40_low20_12,
sint64 neg_g_531_low60_40_low20_12,
sint64 u_571_582,
sint64 v_571_582,
sint64 r_571_582,
sint64 s_571_582,
sint64 u_571_583,
sint64 v_571_583,
sint64 r_571_583,
sint64 s_571_583,
bit ne
)={
    u_571_582 * neg_f_531_low60_40_low20_0 + v_571_582 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_11 * (-(2**20)),
    r_571_582 * neg_f_531_low60_40_low20_0 + s_571_582 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_11 * (-(2**20))
&&
    u_571_582 * neg_f_531_low60_40_low20_0 + v_571_582 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_11 * (const 64 (-(2**20))),
    r_571_582 * neg_f_531_low60_40_low20_0 + s_571_582 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_11 + u_571_582 * (const 64 (2**21)) + v_571_582 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_11 + r_571_582 * (const 64 (2**21)) + s_571_582 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_11,
    neg_f_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_11,
    neg_g_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 582)) <=s delta, delta <=s (const 64 (1 + 2*582)),
    (const 64 (-(2**20))) <=s u_571_582, u_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_582, v_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_582, r_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_582, s_571_582 <=s (const 64 ((2**20)-1)),
    u_571_582 + v_571_582 <=s (const 64 (2**20)),
    u_571_582 - v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 + v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 - v_571_582 <=s (const 64 (2**20)),
    r_571_582 + s_571_582 <=s (const 64 (2**20)),
    r_571_582 - s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 + s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 - s_571_582 <=s (const 64 (2**20)),
    u_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_571_582 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step582

// premise b
assume
neg_g_531_low60_40_low20_11 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_12 neg_f_531_low60_40_low20_11;
mov u_571_583 u_571_582;
mov v_571_583 v_571_582;

add neg_g_531_low60_40_low20_12 neg_g_531_low60_40_low20_11 neg_f_531_low60_40_low20_11;
asr neg_g_531_low60_40_low20_12 neg_g_531_low60_40_low20_12 1;
add r_571_583 r_571_582 u_571_582;
asr r_571_583 r_571_583 1;
add s_571_583 s_571_582 v_571_582;
asr s_571_583 s_571_583 1;
assert
    true
&&
    neg_f_531_low60_40_low20_12 = neg_f_531_low60_40_low20_11,
    u_571_583 = u_571_582,
    v_571_583 = v_571_582,
    neg_g_531_low60_40_low20_12 * (const 64 2) = neg_g_531_low60_40_low20_11 + neg_f_531_low60_40_low20_11,
    r_571_583 * (const 64 2) = r_571_582 + u_571_582,
    s_571_583 * (const 64 2) = s_571_582 + v_571_582
;

assume
    neg_f_531_low60_40_low20_12 = neg_f_531_low60_40_low20_11,
    u_571_583 = u_571_582,
    v_571_583 = v_571_582,
    neg_g_531_low60_40_low20_12 * 2 = neg_g_531_low60_40_low20_11 + neg_f_531_low60_40_low20_11,
    r_571_583 * 2 = r_571_582 + u_571_582,
    s_571_583 * 2 = s_571_582 + v_571_582
&&
    true
;

{
    u_571_583 * neg_f_531_low60_40_low20_0 + v_571_583 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_583 * neg_f_531_low60_40_low20_0 + s_571_583 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_12 + u_571_583 * (const 64 (2**21)) + v_571_583 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_12 + r_571_583 * (const 64 (2**21)) + s_571_583 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_12,
    neg_f_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_12,
    neg_g_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 583)) <=s delta, delta <=s (const 64 (1 + 2*583)),
    (const 64 (-(2**20))) <=s u_571_583, u_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_583, v_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_583, r_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_583, s_571_583 <=s (const 64 ((2**20)-1)),
    u_571_583 + v_571_583 <=s (const 64 (2**20)),
    u_571_583 - v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 + v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 - v_571_583 <=s (const 64 (2**20)),
    r_571_583 + s_571_583 <=s (const 64 (2**20)),
    r_571_583 - s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 + s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 - s_571_583 <=s (const 64 (2**20)),
    u_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_571_583 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_582_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_11,
sint64 neg_g_531_low60_40_low20_11,
sint64 neg_f_531_low60_40_low20_12,
sint64 neg_g_531_low60_40_low20_12,
sint64 u_571_582,
sint64 v_571_582,
sint64 r_571_582,
sint64 s_571_582,
sint64 u_571_583,
sint64 v_571_583,
sint64 r_571_583,
sint64 s_571_583,
bit ne
)={
    u_571_582 * neg_f_531_low60_40_low20_0 + v_571_582 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_11 * (-(2**20)),
    r_571_582 * neg_f_531_low60_40_low20_0 + s_571_582 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_11 * (-(2**20))
&&
    u_571_582 * neg_f_531_low60_40_low20_0 + v_571_582 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_11 * (const 64 (-(2**20))),
    r_571_582 * neg_f_531_low60_40_low20_0 + s_571_582 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_11 + u_571_582 * (const 64 (2**21)) + v_571_582 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_11 + r_571_582 * (const 64 (2**21)) + s_571_582 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_11,
    neg_f_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_11,
    neg_g_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 582)) <=s delta, delta <=s (const 64 (1 + 2*582)),
    (const 64 (-(2**20))) <=s u_571_582, u_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_582, v_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_582, r_571_582 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_582, s_571_582 <=s (const 64 ((2**20)-1)),
    u_571_582 + v_571_582 <=s (const 64 (2**20)),
    u_571_582 - v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 + v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 - v_571_582 <=s (const 64 (2**20)),
    r_571_582 + s_571_582 <=s (const 64 (2**20)),
    r_571_582 - s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 + s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 - s_571_582 <=s (const 64 (2**20)),
    u_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_571_582 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step582

// premise c
assume
neg_g_531_low60_40_low20_11 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_12 neg_g_531_low60_40_low20_11;
mov u_571_583 r_571_582;
mov v_571_583 s_571_582;

subs dc neg_g_531_low60_40_low20_12 neg_g_531_low60_40_low20_11 neg_f_531_low60_40_low20_11;
asr neg_g_531_low60_40_low20_12 neg_g_531_low60_40_low20_12 1;
subs dc r_571_583 r_571_582 u_571_582;
asr r_571_583 r_571_583 1;
subs dc s_571_583 s_571_582 v_571_582;
asr s_571_583 s_571_583 1;
assert
    true
&&
    neg_f_531_low60_40_low20_12 = neg_g_531_low60_40_low20_11,
    u_571_583 = r_571_582,
    v_571_583 = s_571_582,
    neg_g_531_low60_40_low20_12 * (const 64 2) = neg_g_531_low60_40_low20_11 - neg_f_531_low60_40_low20_11,
    r_571_583 * (const 64 2) = r_571_582 - u_571_582,
    s_571_583 * (const 64 2) = s_571_582 - v_571_582
;

assume
    neg_f_531_low60_40_low20_12 = neg_g_531_low60_40_low20_11,
    u_571_583 = r_571_582,
    v_571_583 = s_571_582,
    neg_g_531_low60_40_low20_12 * 2 = neg_g_531_low60_40_low20_11 - neg_f_531_low60_40_low20_11,
    r_571_583 * 2 = r_571_582 - u_571_582,
    s_571_583 * 2 = s_571_582 - v_571_582
&&
    true
;

{
    u_571_583 * neg_f_531_low60_40_low20_0 + v_571_583 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_583 * neg_f_531_low60_40_low20_0 + s_571_583 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_12 + u_571_583 * (const 64 (2**21)) + v_571_583 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_12 + r_571_583 * (const 64 (2**21)) + s_571_583 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_12,
    neg_f_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_12,
    neg_g_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 583)) <=s delta, delta <=s (const 64 (1 + 2*583)),
    (const 64 (-(2**20))) <=s u_571_583, u_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_583, v_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_583, r_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_583, s_571_583 <=s (const 64 ((2**20)-1)),
    u_571_583 + v_571_583 <=s (const 64 (2**20)),
    u_571_583 - v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 + v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 - v_571_583 <=s (const 64 (2**20)),
    r_571_583 + s_571_583 <=s (const 64 (2**20)),
    r_571_583 - s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 + s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 - s_571_583 <=s (const 64 (2**20)),
    u_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_571_583 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_583_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_12,
sint64 neg_g_531_low60_40_low20_12,
sint64 neg_f_531_low60_40_low20_13,
sint64 neg_g_531_low60_40_low20_13,
sint64 u_571_583,
sint64 v_571_583,
sint64 r_571_583,
sint64 s_571_583,
sint64 u_571_584,
sint64 v_571_584,
sint64 r_571_584,
sint64 s_571_584,
bit ne
)={
    u_571_583 * neg_f_531_low60_40_low20_0 + v_571_583 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_12 * (-(2**20)),
    r_571_583 * neg_f_531_low60_40_low20_0 + s_571_583 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_12 * (-(2**20))
&&
    u_571_583 * neg_f_531_low60_40_low20_0 + v_571_583 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_12 * (const 64 (-(2**20))),
    r_571_583 * neg_f_531_low60_40_low20_0 + s_571_583 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_12 + u_571_583 * (const 64 (2**21)) + v_571_583 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_12 + r_571_583 * (const 64 (2**21)) + s_571_583 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_12,
    neg_f_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_12,
    neg_g_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 583)) <=s delta, delta <=s (const 64 (1 + 2*583)),
    (const 64 (-(2**20))) <=s u_571_583, u_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_583, v_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_583, r_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_583, s_571_583 <=s (const 64 ((2**20)-1)),
    u_571_583 + v_571_583 <=s (const 64 (2**20)),
    u_571_583 - v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 + v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 - v_571_583 <=s (const 64 (2**20)),
    r_571_583 + s_571_583 <=s (const 64 (2**20)),
    r_571_583 - s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 + s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 - s_571_583 <=s (const 64 (2**20)),
    u_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_571_583 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step583

// premise a
assume
neg_g_531_low60_40_low20_12 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_12 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_13 neg_f_531_low60_40_low20_12;
mov u_571_584 u_571_583;
mov v_571_584 v_571_583;

asr neg_g_531_low60_40_low20_13 neg_g_531_low60_40_low20_12 1;
asr r_571_584 r_571_583 1;
asr s_571_584 s_571_583 1;
assert
    true
&&
    neg_f_531_low60_40_low20_13 = neg_f_531_low60_40_low20_12,
    u_571_584 = u_571_583,
    v_571_584 = v_571_583,
    neg_g_531_low60_40_low20_13 * (const 64 2) = neg_g_531_low60_40_low20_12,
    r_571_584 * (const 64 2) = r_571_583,
    s_571_584 * (const 64 2) = s_571_583
;

assume
    neg_f_531_low60_40_low20_13 = neg_f_531_low60_40_low20_12,
    u_571_584 = u_571_583,
    v_571_584 = v_571_583,
    neg_g_531_low60_40_low20_13 * 2 = neg_g_531_low60_40_low20_12,
    r_571_584 * 2 = r_571_583,
    s_571_584 * 2 = s_571_583
&&
    true
;

{
    u_571_584 * neg_f_531_low60_40_low20_0 + v_571_584 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_584 * neg_f_531_low60_40_low20_0 + s_571_584 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_13 + u_571_584 * (const 64 (2**21)) + v_571_584 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_13 + r_571_584 * (const 64 (2**21)) + s_571_584 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_13,
    neg_f_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_13,
    neg_g_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 584)) <=s delta, delta <=s (const 64 (1 + 2*584)),
    (const 64 (-(2**20))) <=s u_571_584, u_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_584, v_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_584, r_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_584, s_571_584 <=s (const 64 ((2**20)-1)),
    u_571_584 + v_571_584 <=s (const 64 (2**20)),
    u_571_584 - v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 + v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 - v_571_584 <=s (const 64 (2**20)),
    r_571_584 + s_571_584 <=s (const 64 (2**20)),
    r_571_584 - s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 + s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 - s_571_584 <=s (const 64 (2**20)),
    u_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_571_584 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_583_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_12,
sint64 neg_g_531_low60_40_low20_12,
sint64 neg_f_531_low60_40_low20_13,
sint64 neg_g_531_low60_40_low20_13,
sint64 u_571_583,
sint64 v_571_583,
sint64 r_571_583,
sint64 s_571_583,
sint64 u_571_584,
sint64 v_571_584,
sint64 r_571_584,
sint64 s_571_584,
bit ne
)={
    u_571_583 * neg_f_531_low60_40_low20_0 + v_571_583 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_12 * (-(2**20)),
    r_571_583 * neg_f_531_low60_40_low20_0 + s_571_583 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_12 * (-(2**20))
&&
    u_571_583 * neg_f_531_low60_40_low20_0 + v_571_583 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_12 * (const 64 (-(2**20))),
    r_571_583 * neg_f_531_low60_40_low20_0 + s_571_583 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_12 + u_571_583 * (const 64 (2**21)) + v_571_583 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_12 + r_571_583 * (const 64 (2**21)) + s_571_583 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_12,
    neg_f_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_12,
    neg_g_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 583)) <=s delta, delta <=s (const 64 (1 + 2*583)),
    (const 64 (-(2**20))) <=s u_571_583, u_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_583, v_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_583, r_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_583, s_571_583 <=s (const 64 ((2**20)-1)),
    u_571_583 + v_571_583 <=s (const 64 (2**20)),
    u_571_583 - v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 + v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 - v_571_583 <=s (const 64 (2**20)),
    r_571_583 + s_571_583 <=s (const 64 (2**20)),
    r_571_583 - s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 + s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 - s_571_583 <=s (const 64 (2**20)),
    u_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_571_583 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step583

// premise b
assume
neg_g_531_low60_40_low20_12 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_13 neg_f_531_low60_40_low20_12;
mov u_571_584 u_571_583;
mov v_571_584 v_571_583;

add neg_g_531_low60_40_low20_13 neg_g_531_low60_40_low20_12 neg_f_531_low60_40_low20_12;
asr neg_g_531_low60_40_low20_13 neg_g_531_low60_40_low20_13 1;
add r_571_584 r_571_583 u_571_583;
asr r_571_584 r_571_584 1;
add s_571_584 s_571_583 v_571_583;
asr s_571_584 s_571_584 1;
assert
    true
&&
    neg_f_531_low60_40_low20_13 = neg_f_531_low60_40_low20_12,
    u_571_584 = u_571_583,
    v_571_584 = v_571_583,
    neg_g_531_low60_40_low20_13 * (const 64 2) = neg_g_531_low60_40_low20_12 + neg_f_531_low60_40_low20_12,
    r_571_584 * (const 64 2) = r_571_583 + u_571_583,
    s_571_584 * (const 64 2) = s_571_583 + v_571_583
;

assume
    neg_f_531_low60_40_low20_13 = neg_f_531_low60_40_low20_12,
    u_571_584 = u_571_583,
    v_571_584 = v_571_583,
    neg_g_531_low60_40_low20_13 * 2 = neg_g_531_low60_40_low20_12 + neg_f_531_low60_40_low20_12,
    r_571_584 * 2 = r_571_583 + u_571_583,
    s_571_584 * 2 = s_571_583 + v_571_583
&&
    true
;

{
    u_571_584 * neg_f_531_low60_40_low20_0 + v_571_584 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_584 * neg_f_531_low60_40_low20_0 + s_571_584 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_13 + u_571_584 * (const 64 (2**21)) + v_571_584 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_13 + r_571_584 * (const 64 (2**21)) + s_571_584 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_13,
    neg_f_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_13,
    neg_g_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 584)) <=s delta, delta <=s (const 64 (1 + 2*584)),
    (const 64 (-(2**20))) <=s u_571_584, u_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_584, v_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_584, r_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_584, s_571_584 <=s (const 64 ((2**20)-1)),
    u_571_584 + v_571_584 <=s (const 64 (2**20)),
    u_571_584 - v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 + v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 - v_571_584 <=s (const 64 (2**20)),
    r_571_584 + s_571_584 <=s (const 64 (2**20)),
    r_571_584 - s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 + s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 - s_571_584 <=s (const 64 (2**20)),
    u_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_571_584 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_583_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_12,
sint64 neg_g_531_low60_40_low20_12,
sint64 neg_f_531_low60_40_low20_13,
sint64 neg_g_531_low60_40_low20_13,
sint64 u_571_583,
sint64 v_571_583,
sint64 r_571_583,
sint64 s_571_583,
sint64 u_571_584,
sint64 v_571_584,
sint64 r_571_584,
sint64 s_571_584,
bit ne
)={
    u_571_583 * neg_f_531_low60_40_low20_0 + v_571_583 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_12 * (-(2**20)),
    r_571_583 * neg_f_531_low60_40_low20_0 + s_571_583 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_12 * (-(2**20))
&&
    u_571_583 * neg_f_531_low60_40_low20_0 + v_571_583 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_12 * (const 64 (-(2**20))),
    r_571_583 * neg_f_531_low60_40_low20_0 + s_571_583 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_12 + u_571_583 * (const 64 (2**21)) + v_571_583 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_12 + r_571_583 * (const 64 (2**21)) + s_571_583 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_12,
    neg_f_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_12,
    neg_g_531_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 583)) <=s delta, delta <=s (const 64 (1 + 2*583)),
    (const 64 (-(2**20))) <=s u_571_583, u_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_583, v_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_583, r_571_583 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_583, s_571_583 <=s (const 64 ((2**20)-1)),
    u_571_583 + v_571_583 <=s (const 64 (2**20)),
    u_571_583 - v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 + v_571_583 <=s (const 64 (2**20)),
    (const 64 0) - u_571_583 - v_571_583 <=s (const 64 (2**20)),
    r_571_583 + s_571_583 <=s (const 64 (2**20)),
    r_571_583 - s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 + s_571_583 <=s (const 64 (2**20)),
    (const 64 0) - r_571_583 - s_571_583 <=s (const 64 (2**20)),
    u_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_571_583 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_571_583 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step583

// premise c
assume
neg_g_531_low60_40_low20_12 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_13 neg_g_531_low60_40_low20_12;
mov u_571_584 r_571_583;
mov v_571_584 s_571_583;

subs dc neg_g_531_low60_40_low20_13 neg_g_531_low60_40_low20_12 neg_f_531_low60_40_low20_12;
asr neg_g_531_low60_40_low20_13 neg_g_531_low60_40_low20_13 1;
subs dc r_571_584 r_571_583 u_571_583;
asr r_571_584 r_571_584 1;
subs dc s_571_584 s_571_583 v_571_583;
asr s_571_584 s_571_584 1;
assert
    true
&&
    neg_f_531_low60_40_low20_13 = neg_g_531_low60_40_low20_12,
    u_571_584 = r_571_583,
    v_571_584 = s_571_583,
    neg_g_531_low60_40_low20_13 * (const 64 2) = neg_g_531_low60_40_low20_12 - neg_f_531_low60_40_low20_12,
    r_571_584 * (const 64 2) = r_571_583 - u_571_583,
    s_571_584 * (const 64 2) = s_571_583 - v_571_583
;

assume
    neg_f_531_low60_40_low20_13 = neg_g_531_low60_40_low20_12,
    u_571_584 = r_571_583,
    v_571_584 = s_571_583,
    neg_g_531_low60_40_low20_13 * 2 = neg_g_531_low60_40_low20_12 - neg_f_531_low60_40_low20_12,
    r_571_584 * 2 = r_571_583 - u_571_583,
    s_571_584 * 2 = s_571_583 - v_571_583
&&
    true
;

{
    u_571_584 * neg_f_531_low60_40_low20_0 + v_571_584 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_584 * neg_f_531_low60_40_low20_0 + s_571_584 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_13 + u_571_584 * (const 64 (2**21)) + v_571_584 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_13 + r_571_584 * (const 64 (2**21)) + s_571_584 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_13,
    neg_f_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_13,
    neg_g_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 584)) <=s delta, delta <=s (const 64 (1 + 2*584)),
    (const 64 (-(2**20))) <=s u_571_584, u_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_584, v_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_584, r_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_584, s_571_584 <=s (const 64 ((2**20)-1)),
    u_571_584 + v_571_584 <=s (const 64 (2**20)),
    u_571_584 - v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 + v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 - v_571_584 <=s (const 64 (2**20)),
    r_571_584 + s_571_584 <=s (const 64 (2**20)),
    r_571_584 - s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 + s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 - s_571_584 <=s (const 64 (2**20)),
    u_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_571_584 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_584_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_13,
sint64 neg_g_531_low60_40_low20_13,
sint64 neg_f_531_low60_40_low20_14,
sint64 neg_g_531_low60_40_low20_14,
sint64 u_571_584,
sint64 v_571_584,
sint64 r_571_584,
sint64 s_571_584,
sint64 u_571_585,
sint64 v_571_585,
sint64 r_571_585,
sint64 s_571_585,
bit ne
)={
    u_571_584 * neg_f_531_low60_40_low20_0 + v_571_584 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_13 * (-(2**20)),
    r_571_584 * neg_f_531_low60_40_low20_0 + s_571_584 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_13 * (-(2**20))
&&
    u_571_584 * neg_f_531_low60_40_low20_0 + v_571_584 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_13 * (const 64 (-(2**20))),
    r_571_584 * neg_f_531_low60_40_low20_0 + s_571_584 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_13 + u_571_584 * (const 64 (2**21)) + v_571_584 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_13 + r_571_584 * (const 64 (2**21)) + s_571_584 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_13,
    neg_f_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_13,
    neg_g_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 584)) <=s delta, delta <=s (const 64 (1 + 2*584)),
    (const 64 (-(2**20))) <=s u_571_584, u_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_584, v_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_584, r_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_584, s_571_584 <=s (const 64 ((2**20)-1)),
    u_571_584 + v_571_584 <=s (const 64 (2**20)),
    u_571_584 - v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 + v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 - v_571_584 <=s (const 64 (2**20)),
    r_571_584 + s_571_584 <=s (const 64 (2**20)),
    r_571_584 - s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 + s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 - s_571_584 <=s (const 64 (2**20)),
    u_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_571_584 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step584

// premise a
assume
neg_g_531_low60_40_low20_13 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_13 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_14 neg_f_531_low60_40_low20_13;
mov u_571_585 u_571_584;
mov v_571_585 v_571_584;

asr neg_g_531_low60_40_low20_14 neg_g_531_low60_40_low20_13 1;
asr r_571_585 r_571_584 1;
asr s_571_585 s_571_584 1;
assert
    true
&&
    neg_f_531_low60_40_low20_14 = neg_f_531_low60_40_low20_13,
    u_571_585 = u_571_584,
    v_571_585 = v_571_584,
    neg_g_531_low60_40_low20_14 * (const 64 2) = neg_g_531_low60_40_low20_13,
    r_571_585 * (const 64 2) = r_571_584,
    s_571_585 * (const 64 2) = s_571_584
;

assume
    neg_f_531_low60_40_low20_14 = neg_f_531_low60_40_low20_13,
    u_571_585 = u_571_584,
    v_571_585 = v_571_584,
    neg_g_531_low60_40_low20_14 * 2 = neg_g_531_low60_40_low20_13,
    r_571_585 * 2 = r_571_584,
    s_571_585 * 2 = s_571_584
&&
    true
;

{
    u_571_585 * neg_f_531_low60_40_low20_0 + v_571_585 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_585 * neg_f_531_low60_40_low20_0 + s_571_585 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_14 + u_571_585 * (const 64 (2**21)) + v_571_585 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_14 + r_571_585 * (const 64 (2**21)) + s_571_585 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_14,
    neg_f_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_14,
    neg_g_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 585)) <=s delta, delta <=s (const 64 (1 + 2*585)),
    (const 64 (-(2**20))) <=s u_571_585, u_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_585, v_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_585, r_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_585, s_571_585 <=s (const 64 ((2**20)-1)),
    u_571_585 + v_571_585 <=s (const 64 (2**20)),
    u_571_585 - v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 + v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 - v_571_585 <=s (const 64 (2**20)),
    r_571_585 + s_571_585 <=s (const 64 (2**20)),
    r_571_585 - s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 + s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 - s_571_585 <=s (const 64 (2**20)),
    u_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_571_585 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_584_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_13,
sint64 neg_g_531_low60_40_low20_13,
sint64 neg_f_531_low60_40_low20_14,
sint64 neg_g_531_low60_40_low20_14,
sint64 u_571_584,
sint64 v_571_584,
sint64 r_571_584,
sint64 s_571_584,
sint64 u_571_585,
sint64 v_571_585,
sint64 r_571_585,
sint64 s_571_585,
bit ne
)={
    u_571_584 * neg_f_531_low60_40_low20_0 + v_571_584 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_13 * (-(2**20)),
    r_571_584 * neg_f_531_low60_40_low20_0 + s_571_584 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_13 * (-(2**20))
&&
    u_571_584 * neg_f_531_low60_40_low20_0 + v_571_584 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_13 * (const 64 (-(2**20))),
    r_571_584 * neg_f_531_low60_40_low20_0 + s_571_584 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_13 + u_571_584 * (const 64 (2**21)) + v_571_584 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_13 + r_571_584 * (const 64 (2**21)) + s_571_584 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_13,
    neg_f_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_13,
    neg_g_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 584)) <=s delta, delta <=s (const 64 (1 + 2*584)),
    (const 64 (-(2**20))) <=s u_571_584, u_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_584, v_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_584, r_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_584, s_571_584 <=s (const 64 ((2**20)-1)),
    u_571_584 + v_571_584 <=s (const 64 (2**20)),
    u_571_584 - v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 + v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 - v_571_584 <=s (const 64 (2**20)),
    r_571_584 + s_571_584 <=s (const 64 (2**20)),
    r_571_584 - s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 + s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 - s_571_584 <=s (const 64 (2**20)),
    u_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_571_584 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step584

// premise b
assume
neg_g_531_low60_40_low20_13 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_14 neg_f_531_low60_40_low20_13;
mov u_571_585 u_571_584;
mov v_571_585 v_571_584;

add neg_g_531_low60_40_low20_14 neg_g_531_low60_40_low20_13 neg_f_531_low60_40_low20_13;
asr neg_g_531_low60_40_low20_14 neg_g_531_low60_40_low20_14 1;
add r_571_585 r_571_584 u_571_584;
asr r_571_585 r_571_585 1;
add s_571_585 s_571_584 v_571_584;
asr s_571_585 s_571_585 1;
assert
    true
&&
    neg_f_531_low60_40_low20_14 = neg_f_531_low60_40_low20_13,
    u_571_585 = u_571_584,
    v_571_585 = v_571_584,
    neg_g_531_low60_40_low20_14 * (const 64 2) = neg_g_531_low60_40_low20_13 + neg_f_531_low60_40_low20_13,
    r_571_585 * (const 64 2) = r_571_584 + u_571_584,
    s_571_585 * (const 64 2) = s_571_584 + v_571_584
;

assume
    neg_f_531_low60_40_low20_14 = neg_f_531_low60_40_low20_13,
    u_571_585 = u_571_584,
    v_571_585 = v_571_584,
    neg_g_531_low60_40_low20_14 * 2 = neg_g_531_low60_40_low20_13 + neg_f_531_low60_40_low20_13,
    r_571_585 * 2 = r_571_584 + u_571_584,
    s_571_585 * 2 = s_571_584 + v_571_584
&&
    true
;

{
    u_571_585 * neg_f_531_low60_40_low20_0 + v_571_585 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_585 * neg_f_531_low60_40_low20_0 + s_571_585 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_14 + u_571_585 * (const 64 (2**21)) + v_571_585 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_14 + r_571_585 * (const 64 (2**21)) + s_571_585 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_14,
    neg_f_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_14,
    neg_g_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 585)) <=s delta, delta <=s (const 64 (1 + 2*585)),
    (const 64 (-(2**20))) <=s u_571_585, u_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_585, v_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_585, r_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_585, s_571_585 <=s (const 64 ((2**20)-1)),
    u_571_585 + v_571_585 <=s (const 64 (2**20)),
    u_571_585 - v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 + v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 - v_571_585 <=s (const 64 (2**20)),
    r_571_585 + s_571_585 <=s (const 64 (2**20)),
    r_571_585 - s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 + s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 - s_571_585 <=s (const 64 (2**20)),
    u_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_571_585 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_584_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_13,
sint64 neg_g_531_low60_40_low20_13,
sint64 neg_f_531_low60_40_low20_14,
sint64 neg_g_531_low60_40_low20_14,
sint64 u_571_584,
sint64 v_571_584,
sint64 r_571_584,
sint64 s_571_584,
sint64 u_571_585,
sint64 v_571_585,
sint64 r_571_585,
sint64 s_571_585,
bit ne
)={
    u_571_584 * neg_f_531_low60_40_low20_0 + v_571_584 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_13 * (-(2**20)),
    r_571_584 * neg_f_531_low60_40_low20_0 + s_571_584 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_13 * (-(2**20))
&&
    u_571_584 * neg_f_531_low60_40_low20_0 + v_571_584 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_13 * (const 64 (-(2**20))),
    r_571_584 * neg_f_531_low60_40_low20_0 + s_571_584 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_13 + u_571_584 * (const 64 (2**21)) + v_571_584 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_13 + r_571_584 * (const 64 (2**21)) + s_571_584 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_13,
    neg_f_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_13,
    neg_g_531_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 584)) <=s delta, delta <=s (const 64 (1 + 2*584)),
    (const 64 (-(2**20))) <=s u_571_584, u_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_584, v_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_584, r_571_584 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_584, s_571_584 <=s (const 64 ((2**20)-1)),
    u_571_584 + v_571_584 <=s (const 64 (2**20)),
    u_571_584 - v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 + v_571_584 <=s (const 64 (2**20)),
    (const 64 0) - u_571_584 - v_571_584 <=s (const 64 (2**20)),
    r_571_584 + s_571_584 <=s (const 64 (2**20)),
    r_571_584 - s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 + s_571_584 <=s (const 64 (2**20)),
    (const 64 0) - r_571_584 - s_571_584 <=s (const 64 (2**20)),
    u_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_571_584 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_571_584 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step584

// premise c
assume
neg_g_531_low60_40_low20_13 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_14 neg_g_531_low60_40_low20_13;
mov u_571_585 r_571_584;
mov v_571_585 s_571_584;

subs dc neg_g_531_low60_40_low20_14 neg_g_531_low60_40_low20_13 neg_f_531_low60_40_low20_13;
asr neg_g_531_low60_40_low20_14 neg_g_531_low60_40_low20_14 1;
subs dc r_571_585 r_571_584 u_571_584;
asr r_571_585 r_571_585 1;
subs dc s_571_585 s_571_584 v_571_584;
asr s_571_585 s_571_585 1;
assert
    true
&&
    neg_f_531_low60_40_low20_14 = neg_g_531_low60_40_low20_13,
    u_571_585 = r_571_584,
    v_571_585 = s_571_584,
    neg_g_531_low60_40_low20_14 * (const 64 2) = neg_g_531_low60_40_low20_13 - neg_f_531_low60_40_low20_13,
    r_571_585 * (const 64 2) = r_571_584 - u_571_584,
    s_571_585 * (const 64 2) = s_571_584 - v_571_584
;

assume
    neg_f_531_low60_40_low20_14 = neg_g_531_low60_40_low20_13,
    u_571_585 = r_571_584,
    v_571_585 = s_571_584,
    neg_g_531_low60_40_low20_14 * 2 = neg_g_531_low60_40_low20_13 - neg_f_531_low60_40_low20_13,
    r_571_585 * 2 = r_571_584 - u_571_584,
    s_571_585 * 2 = s_571_584 - v_571_584
&&
    true
;

{
    u_571_585 * neg_f_531_low60_40_low20_0 + v_571_585 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_585 * neg_f_531_low60_40_low20_0 + s_571_585 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_14 + u_571_585 * (const 64 (2**21)) + v_571_585 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_14 + r_571_585 * (const 64 (2**21)) + s_571_585 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_14,
    neg_f_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_14,
    neg_g_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 585)) <=s delta, delta <=s (const 64 (1 + 2*585)),
    (const 64 (-(2**20))) <=s u_571_585, u_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_585, v_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_585, r_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_585, s_571_585 <=s (const 64 ((2**20)-1)),
    u_571_585 + v_571_585 <=s (const 64 (2**20)),
    u_571_585 - v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 + v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 - v_571_585 <=s (const 64 (2**20)),
    r_571_585 + s_571_585 <=s (const 64 (2**20)),
    r_571_585 - s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 + s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 - s_571_585 <=s (const 64 (2**20)),
    u_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_571_585 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_585_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_14,
sint64 neg_g_531_low60_40_low20_14,
sint64 neg_f_531_low60_40_low20_15,
sint64 neg_g_531_low60_40_low20_15,
sint64 u_571_585,
sint64 v_571_585,
sint64 r_571_585,
sint64 s_571_585,
sint64 u_571_586,
sint64 v_571_586,
sint64 r_571_586,
sint64 s_571_586,
bit ne
)={
    u_571_585 * neg_f_531_low60_40_low20_0 + v_571_585 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_14 * (-(2**20)),
    r_571_585 * neg_f_531_low60_40_low20_0 + s_571_585 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_14 * (-(2**20))
&&
    u_571_585 * neg_f_531_low60_40_low20_0 + v_571_585 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_14 * (const 64 (-(2**20))),
    r_571_585 * neg_f_531_low60_40_low20_0 + s_571_585 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_14 + u_571_585 * (const 64 (2**21)) + v_571_585 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_14 + r_571_585 * (const 64 (2**21)) + s_571_585 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_14,
    neg_f_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_14,
    neg_g_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 585)) <=s delta, delta <=s (const 64 (1 + 2*585)),
    (const 64 (-(2**20))) <=s u_571_585, u_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_585, v_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_585, r_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_585, s_571_585 <=s (const 64 ((2**20)-1)),
    u_571_585 + v_571_585 <=s (const 64 (2**20)),
    u_571_585 - v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 + v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 - v_571_585 <=s (const 64 (2**20)),
    r_571_585 + s_571_585 <=s (const 64 (2**20)),
    r_571_585 - s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 + s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 - s_571_585 <=s (const 64 (2**20)),
    u_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_571_585 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step585

// premise a
assume
neg_g_531_low60_40_low20_14 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_14 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_15 neg_f_531_low60_40_low20_14;
mov u_571_586 u_571_585;
mov v_571_586 v_571_585;

asr neg_g_531_low60_40_low20_15 neg_g_531_low60_40_low20_14 1;
asr r_571_586 r_571_585 1;
asr s_571_586 s_571_585 1;
assert
    true
&&
    neg_f_531_low60_40_low20_15 = neg_f_531_low60_40_low20_14,
    u_571_586 = u_571_585,
    v_571_586 = v_571_585,
    neg_g_531_low60_40_low20_15 * (const 64 2) = neg_g_531_low60_40_low20_14,
    r_571_586 * (const 64 2) = r_571_585,
    s_571_586 * (const 64 2) = s_571_585
;

assume
    neg_f_531_low60_40_low20_15 = neg_f_531_low60_40_low20_14,
    u_571_586 = u_571_585,
    v_571_586 = v_571_585,
    neg_g_531_low60_40_low20_15 * 2 = neg_g_531_low60_40_low20_14,
    r_571_586 * 2 = r_571_585,
    s_571_586 * 2 = s_571_585
&&
    true
;

{
    u_571_586 * neg_f_531_low60_40_low20_0 + v_571_586 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_586 * neg_f_531_low60_40_low20_0 + s_571_586 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_15 + u_571_586 * (const 64 (2**21)) + v_571_586 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_15 + r_571_586 * (const 64 (2**21)) + s_571_586 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_15,
    neg_f_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_15,
    neg_g_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 586)) <=s delta, delta <=s (const 64 (1 + 2*586)),
    (const 64 (-(2**20))) <=s u_571_586, u_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_586, v_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_586, r_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_586, s_571_586 <=s (const 64 ((2**20)-1)),
    u_571_586 + v_571_586 <=s (const 64 (2**20)),
    u_571_586 - v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 + v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 - v_571_586 <=s (const 64 (2**20)),
    r_571_586 + s_571_586 <=s (const 64 (2**20)),
    r_571_586 - s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 + s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 - s_571_586 <=s (const 64 (2**20)),
    u_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_571_586 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_585_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_14,
sint64 neg_g_531_low60_40_low20_14,
sint64 neg_f_531_low60_40_low20_15,
sint64 neg_g_531_low60_40_low20_15,
sint64 u_571_585,
sint64 v_571_585,
sint64 r_571_585,
sint64 s_571_585,
sint64 u_571_586,
sint64 v_571_586,
sint64 r_571_586,
sint64 s_571_586,
bit ne
)={
    u_571_585 * neg_f_531_low60_40_low20_0 + v_571_585 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_14 * (-(2**20)),
    r_571_585 * neg_f_531_low60_40_low20_0 + s_571_585 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_14 * (-(2**20))
&&
    u_571_585 * neg_f_531_low60_40_low20_0 + v_571_585 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_14 * (const 64 (-(2**20))),
    r_571_585 * neg_f_531_low60_40_low20_0 + s_571_585 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_14 + u_571_585 * (const 64 (2**21)) + v_571_585 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_14 + r_571_585 * (const 64 (2**21)) + s_571_585 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_14,
    neg_f_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_14,
    neg_g_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 585)) <=s delta, delta <=s (const 64 (1 + 2*585)),
    (const 64 (-(2**20))) <=s u_571_585, u_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_585, v_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_585, r_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_585, s_571_585 <=s (const 64 ((2**20)-1)),
    u_571_585 + v_571_585 <=s (const 64 (2**20)),
    u_571_585 - v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 + v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 - v_571_585 <=s (const 64 (2**20)),
    r_571_585 + s_571_585 <=s (const 64 (2**20)),
    r_571_585 - s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 + s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 - s_571_585 <=s (const 64 (2**20)),
    u_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_571_585 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step585

// premise b
assume
neg_g_531_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_15 neg_f_531_low60_40_low20_14;
mov u_571_586 u_571_585;
mov v_571_586 v_571_585;

add neg_g_531_low60_40_low20_15 neg_g_531_low60_40_low20_14 neg_f_531_low60_40_low20_14;
asr neg_g_531_low60_40_low20_15 neg_g_531_low60_40_low20_15 1;
add r_571_586 r_571_585 u_571_585;
asr r_571_586 r_571_586 1;
add s_571_586 s_571_585 v_571_585;
asr s_571_586 s_571_586 1;
assert
    true
&&
    neg_f_531_low60_40_low20_15 = neg_f_531_low60_40_low20_14,
    u_571_586 = u_571_585,
    v_571_586 = v_571_585,
    neg_g_531_low60_40_low20_15 * (const 64 2) = neg_g_531_low60_40_low20_14 + neg_f_531_low60_40_low20_14,
    r_571_586 * (const 64 2) = r_571_585 + u_571_585,
    s_571_586 * (const 64 2) = s_571_585 + v_571_585
;

assume
    neg_f_531_low60_40_low20_15 = neg_f_531_low60_40_low20_14,
    u_571_586 = u_571_585,
    v_571_586 = v_571_585,
    neg_g_531_low60_40_low20_15 * 2 = neg_g_531_low60_40_low20_14 + neg_f_531_low60_40_low20_14,
    r_571_586 * 2 = r_571_585 + u_571_585,
    s_571_586 * 2 = s_571_585 + v_571_585
&&
    true
;

{
    u_571_586 * neg_f_531_low60_40_low20_0 + v_571_586 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_586 * neg_f_531_low60_40_low20_0 + s_571_586 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_15 + u_571_586 * (const 64 (2**21)) + v_571_586 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_15 + r_571_586 * (const 64 (2**21)) + s_571_586 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_15,
    neg_f_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_15,
    neg_g_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 586)) <=s delta, delta <=s (const 64 (1 + 2*586)),
    (const 64 (-(2**20))) <=s u_571_586, u_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_586, v_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_586, r_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_586, s_571_586 <=s (const 64 ((2**20)-1)),
    u_571_586 + v_571_586 <=s (const 64 (2**20)),
    u_571_586 - v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 + v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 - v_571_586 <=s (const 64 (2**20)),
    r_571_586 + s_571_586 <=s (const 64 (2**20)),
    r_571_586 - s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 + s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 - s_571_586 <=s (const 64 (2**20)),
    u_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_571_586 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_585_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_14,
sint64 neg_g_531_low60_40_low20_14,
sint64 neg_f_531_low60_40_low20_15,
sint64 neg_g_531_low60_40_low20_15,
sint64 u_571_585,
sint64 v_571_585,
sint64 r_571_585,
sint64 s_571_585,
sint64 u_571_586,
sint64 v_571_586,
sint64 r_571_586,
sint64 s_571_586,
bit ne
)={
    u_571_585 * neg_f_531_low60_40_low20_0 + v_571_585 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_14 * (-(2**20)),
    r_571_585 * neg_f_531_low60_40_low20_0 + s_571_585 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_14 * (-(2**20))
&&
    u_571_585 * neg_f_531_low60_40_low20_0 + v_571_585 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_14 * (const 64 (-(2**20))),
    r_571_585 * neg_f_531_low60_40_low20_0 + s_571_585 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_14 + u_571_585 * (const 64 (2**21)) + v_571_585 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_14 + r_571_585 * (const 64 (2**21)) + s_571_585 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_14,
    neg_f_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_14,
    neg_g_531_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 585)) <=s delta, delta <=s (const 64 (1 + 2*585)),
    (const 64 (-(2**20))) <=s u_571_585, u_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_585, v_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_585, r_571_585 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_585, s_571_585 <=s (const 64 ((2**20)-1)),
    u_571_585 + v_571_585 <=s (const 64 (2**20)),
    u_571_585 - v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 + v_571_585 <=s (const 64 (2**20)),
    (const 64 0) - u_571_585 - v_571_585 <=s (const 64 (2**20)),
    r_571_585 + s_571_585 <=s (const 64 (2**20)),
    r_571_585 - s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 + s_571_585 <=s (const 64 (2**20)),
    (const 64 0) - r_571_585 - s_571_585 <=s (const 64 (2**20)),
    u_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_571_585 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_571_585 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step585

// premise c
assume
neg_g_531_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_15 neg_g_531_low60_40_low20_14;
mov u_571_586 r_571_585;
mov v_571_586 s_571_585;

subs dc neg_g_531_low60_40_low20_15 neg_g_531_low60_40_low20_14 neg_f_531_low60_40_low20_14;
asr neg_g_531_low60_40_low20_15 neg_g_531_low60_40_low20_15 1;
subs dc r_571_586 r_571_585 u_571_585;
asr r_571_586 r_571_586 1;
subs dc s_571_586 s_571_585 v_571_585;
asr s_571_586 s_571_586 1;
assert
    true
&&
    neg_f_531_low60_40_low20_15 = neg_g_531_low60_40_low20_14,
    u_571_586 = r_571_585,
    v_571_586 = s_571_585,
    neg_g_531_low60_40_low20_15 * (const 64 2) = neg_g_531_low60_40_low20_14 - neg_f_531_low60_40_low20_14,
    r_571_586 * (const 64 2) = r_571_585 - u_571_585,
    s_571_586 * (const 64 2) = s_571_585 - v_571_585
;

assume
    neg_f_531_low60_40_low20_15 = neg_g_531_low60_40_low20_14,
    u_571_586 = r_571_585,
    v_571_586 = s_571_585,
    neg_g_531_low60_40_low20_15 * 2 = neg_g_531_low60_40_low20_14 - neg_f_531_low60_40_low20_14,
    r_571_586 * 2 = r_571_585 - u_571_585,
    s_571_586 * 2 = s_571_585 - v_571_585
&&
    true
;

{
    u_571_586 * neg_f_531_low60_40_low20_0 + v_571_586 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_586 * neg_f_531_low60_40_low20_0 + s_571_586 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_15 + u_571_586 * (const 64 (2**21)) + v_571_586 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_15 + r_571_586 * (const 64 (2**21)) + s_571_586 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_15,
    neg_f_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_15,
    neg_g_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 586)) <=s delta, delta <=s (const 64 (1 + 2*586)),
    (const 64 (-(2**20))) <=s u_571_586, u_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_586, v_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_586, r_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_586, s_571_586 <=s (const 64 ((2**20)-1)),
    u_571_586 + v_571_586 <=s (const 64 (2**20)),
    u_571_586 - v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 + v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 - v_571_586 <=s (const 64 (2**20)),
    r_571_586 + s_571_586 <=s (const 64 (2**20)),
    r_571_586 - s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 + s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 - s_571_586 <=s (const 64 (2**20)),
    u_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_571_586 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_586_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_15,
sint64 neg_g_531_low60_40_low20_15,
sint64 neg_f_531_low60_40_low20_16,
sint64 neg_g_531_low60_40_low20_16,
sint64 u_571_586,
sint64 v_571_586,
sint64 r_571_586,
sint64 s_571_586,
sint64 u_571_587,
sint64 v_571_587,
sint64 r_571_587,
sint64 s_571_587,
bit ne
)={
    u_571_586 * neg_f_531_low60_40_low20_0 + v_571_586 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_15 * (-(2**20)),
    r_571_586 * neg_f_531_low60_40_low20_0 + s_571_586 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_15 * (-(2**20))
&&
    u_571_586 * neg_f_531_low60_40_low20_0 + v_571_586 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_15 * (const 64 (-(2**20))),
    r_571_586 * neg_f_531_low60_40_low20_0 + s_571_586 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_15 + u_571_586 * (const 64 (2**21)) + v_571_586 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_15 + r_571_586 * (const 64 (2**21)) + s_571_586 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_15,
    neg_f_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_15,
    neg_g_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 586)) <=s delta, delta <=s (const 64 (1 + 2*586)),
    (const 64 (-(2**20))) <=s u_571_586, u_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_586, v_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_586, r_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_586, s_571_586 <=s (const 64 ((2**20)-1)),
    u_571_586 + v_571_586 <=s (const 64 (2**20)),
    u_571_586 - v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 + v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 - v_571_586 <=s (const 64 (2**20)),
    r_571_586 + s_571_586 <=s (const 64 (2**20)),
    r_571_586 - s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 + s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 - s_571_586 <=s (const 64 (2**20)),
    u_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_571_586 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step586

// premise a
assume
neg_g_531_low60_40_low20_15 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_15 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_16 neg_f_531_low60_40_low20_15;
mov u_571_587 u_571_586;
mov v_571_587 v_571_586;

asr neg_g_531_low60_40_low20_16 neg_g_531_low60_40_low20_15 1;
asr r_571_587 r_571_586 1;
asr s_571_587 s_571_586 1;
assert
    true
&&
    neg_f_531_low60_40_low20_16 = neg_f_531_low60_40_low20_15,
    u_571_587 = u_571_586,
    v_571_587 = v_571_586,
    neg_g_531_low60_40_low20_16 * (const 64 2) = neg_g_531_low60_40_low20_15,
    r_571_587 * (const 64 2) = r_571_586,
    s_571_587 * (const 64 2) = s_571_586
;

assume
    neg_f_531_low60_40_low20_16 = neg_f_531_low60_40_low20_15,
    u_571_587 = u_571_586,
    v_571_587 = v_571_586,
    neg_g_531_low60_40_low20_16 * 2 = neg_g_531_low60_40_low20_15,
    r_571_587 * 2 = r_571_586,
    s_571_587 * 2 = s_571_586
&&
    true
;

{
    u_571_587 * neg_f_531_low60_40_low20_0 + v_571_587 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_587 * neg_f_531_low60_40_low20_0 + s_571_587 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_16 + u_571_587 * (const 64 (2**21)) + v_571_587 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_16 + r_571_587 * (const 64 (2**21)) + s_571_587 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_16,
    neg_f_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_16,
    neg_g_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 587)) <=s delta, delta <=s (const 64 (1 + 2*587)),
    (const 64 (-(2**20))) <=s u_571_587, u_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_587, v_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_587, r_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_587, s_571_587 <=s (const 64 ((2**20)-1)),
    u_571_587 + v_571_587 <=s (const 64 (2**20)),
    u_571_587 - v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 + v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 - v_571_587 <=s (const 64 (2**20)),
    r_571_587 + s_571_587 <=s (const 64 (2**20)),
    r_571_587 - s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 + s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 - s_571_587 <=s (const 64 (2**20)),
    u_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_571_587 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_586_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_15,
sint64 neg_g_531_low60_40_low20_15,
sint64 neg_f_531_low60_40_low20_16,
sint64 neg_g_531_low60_40_low20_16,
sint64 u_571_586,
sint64 v_571_586,
sint64 r_571_586,
sint64 s_571_586,
sint64 u_571_587,
sint64 v_571_587,
sint64 r_571_587,
sint64 s_571_587,
bit ne
)={
    u_571_586 * neg_f_531_low60_40_low20_0 + v_571_586 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_15 * (-(2**20)),
    r_571_586 * neg_f_531_low60_40_low20_0 + s_571_586 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_15 * (-(2**20))
&&
    u_571_586 * neg_f_531_low60_40_low20_0 + v_571_586 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_15 * (const 64 (-(2**20))),
    r_571_586 * neg_f_531_low60_40_low20_0 + s_571_586 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_15 + u_571_586 * (const 64 (2**21)) + v_571_586 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_15 + r_571_586 * (const 64 (2**21)) + s_571_586 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_15,
    neg_f_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_15,
    neg_g_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 586)) <=s delta, delta <=s (const 64 (1 + 2*586)),
    (const 64 (-(2**20))) <=s u_571_586, u_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_586, v_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_586, r_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_586, s_571_586 <=s (const 64 ((2**20)-1)),
    u_571_586 + v_571_586 <=s (const 64 (2**20)),
    u_571_586 - v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 + v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 - v_571_586 <=s (const 64 (2**20)),
    r_571_586 + s_571_586 <=s (const 64 (2**20)),
    r_571_586 - s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 + s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 - s_571_586 <=s (const 64 (2**20)),
    u_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_571_586 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step586

// premise b
assume
neg_g_531_low60_40_low20_15 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_16 neg_f_531_low60_40_low20_15;
mov u_571_587 u_571_586;
mov v_571_587 v_571_586;

add neg_g_531_low60_40_low20_16 neg_g_531_low60_40_low20_15 neg_f_531_low60_40_low20_15;
asr neg_g_531_low60_40_low20_16 neg_g_531_low60_40_low20_16 1;
add r_571_587 r_571_586 u_571_586;
asr r_571_587 r_571_587 1;
add s_571_587 s_571_586 v_571_586;
asr s_571_587 s_571_587 1;
assert
    true
&&
    neg_f_531_low60_40_low20_16 = neg_f_531_low60_40_low20_15,
    u_571_587 = u_571_586,
    v_571_587 = v_571_586,
    neg_g_531_low60_40_low20_16 * (const 64 2) = neg_g_531_low60_40_low20_15 + neg_f_531_low60_40_low20_15,
    r_571_587 * (const 64 2) = r_571_586 + u_571_586,
    s_571_587 * (const 64 2) = s_571_586 + v_571_586
;

assume
    neg_f_531_low60_40_low20_16 = neg_f_531_low60_40_low20_15,
    u_571_587 = u_571_586,
    v_571_587 = v_571_586,
    neg_g_531_low60_40_low20_16 * 2 = neg_g_531_low60_40_low20_15 + neg_f_531_low60_40_low20_15,
    r_571_587 * 2 = r_571_586 + u_571_586,
    s_571_587 * 2 = s_571_586 + v_571_586
&&
    true
;

{
    u_571_587 * neg_f_531_low60_40_low20_0 + v_571_587 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_587 * neg_f_531_low60_40_low20_0 + s_571_587 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_16 + u_571_587 * (const 64 (2**21)) + v_571_587 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_16 + r_571_587 * (const 64 (2**21)) + s_571_587 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_16,
    neg_f_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_16,
    neg_g_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 587)) <=s delta, delta <=s (const 64 (1 + 2*587)),
    (const 64 (-(2**20))) <=s u_571_587, u_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_587, v_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_587, r_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_587, s_571_587 <=s (const 64 ((2**20)-1)),
    u_571_587 + v_571_587 <=s (const 64 (2**20)),
    u_571_587 - v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 + v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 - v_571_587 <=s (const 64 (2**20)),
    r_571_587 + s_571_587 <=s (const 64 (2**20)),
    r_571_587 - s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 + s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 - s_571_587 <=s (const 64 (2**20)),
    u_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_571_587 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_586_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_15,
sint64 neg_g_531_low60_40_low20_15,
sint64 neg_f_531_low60_40_low20_16,
sint64 neg_g_531_low60_40_low20_16,
sint64 u_571_586,
sint64 v_571_586,
sint64 r_571_586,
sint64 s_571_586,
sint64 u_571_587,
sint64 v_571_587,
sint64 r_571_587,
sint64 s_571_587,
bit ne
)={
    u_571_586 * neg_f_531_low60_40_low20_0 + v_571_586 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_15 * (-(2**20)),
    r_571_586 * neg_f_531_low60_40_low20_0 + s_571_586 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_15 * (-(2**20))
&&
    u_571_586 * neg_f_531_low60_40_low20_0 + v_571_586 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_15 * (const 64 (-(2**20))),
    r_571_586 * neg_f_531_low60_40_low20_0 + s_571_586 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_15 + u_571_586 * (const 64 (2**21)) + v_571_586 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_15 + r_571_586 * (const 64 (2**21)) + s_571_586 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_15,
    neg_f_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_15,
    neg_g_531_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 586)) <=s delta, delta <=s (const 64 (1 + 2*586)),
    (const 64 (-(2**20))) <=s u_571_586, u_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_586, v_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_586, r_571_586 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_586, s_571_586 <=s (const 64 ((2**20)-1)),
    u_571_586 + v_571_586 <=s (const 64 (2**20)),
    u_571_586 - v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 + v_571_586 <=s (const 64 (2**20)),
    (const 64 0) - u_571_586 - v_571_586 <=s (const 64 (2**20)),
    r_571_586 + s_571_586 <=s (const 64 (2**20)),
    r_571_586 - s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 + s_571_586 <=s (const 64 (2**20)),
    (const 64 0) - r_571_586 - s_571_586 <=s (const 64 (2**20)),
    u_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_571_586 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_571_586 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step586

// premise c
assume
neg_g_531_low60_40_low20_15 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_16 neg_g_531_low60_40_low20_15;
mov u_571_587 r_571_586;
mov v_571_587 s_571_586;

subs dc neg_g_531_low60_40_low20_16 neg_g_531_low60_40_low20_15 neg_f_531_low60_40_low20_15;
asr neg_g_531_low60_40_low20_16 neg_g_531_low60_40_low20_16 1;
subs dc r_571_587 r_571_586 u_571_586;
asr r_571_587 r_571_587 1;
subs dc s_571_587 s_571_586 v_571_586;
asr s_571_587 s_571_587 1;
assert
    true
&&
    neg_f_531_low60_40_low20_16 = neg_g_531_low60_40_low20_15,
    u_571_587 = r_571_586,
    v_571_587 = s_571_586,
    neg_g_531_low60_40_low20_16 * (const 64 2) = neg_g_531_low60_40_low20_15 - neg_f_531_low60_40_low20_15,
    r_571_587 * (const 64 2) = r_571_586 - u_571_586,
    s_571_587 * (const 64 2) = s_571_586 - v_571_586
;

assume
    neg_f_531_low60_40_low20_16 = neg_g_531_low60_40_low20_15,
    u_571_587 = r_571_586,
    v_571_587 = s_571_586,
    neg_g_531_low60_40_low20_16 * 2 = neg_g_531_low60_40_low20_15 - neg_f_531_low60_40_low20_15,
    r_571_587 * 2 = r_571_586 - u_571_586,
    s_571_587 * 2 = s_571_586 - v_571_586
&&
    true
;

{
    u_571_587 * neg_f_531_low60_40_low20_0 + v_571_587 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_587 * neg_f_531_low60_40_low20_0 + s_571_587 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_16 + u_571_587 * (const 64 (2**21)) + v_571_587 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_16 + r_571_587 * (const 64 (2**21)) + s_571_587 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_16,
    neg_f_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_16,
    neg_g_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 587)) <=s delta, delta <=s (const 64 (1 + 2*587)),
    (const 64 (-(2**20))) <=s u_571_587, u_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_587, v_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_587, r_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_587, s_571_587 <=s (const 64 ((2**20)-1)),
    u_571_587 + v_571_587 <=s (const 64 (2**20)),
    u_571_587 - v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 + v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 - v_571_587 <=s (const 64 (2**20)),
    r_571_587 + s_571_587 <=s (const 64 (2**20)),
    r_571_587 - s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 + s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 - s_571_587 <=s (const 64 (2**20)),
    u_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_571_587 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_587_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_16,
sint64 neg_g_531_low60_40_low20_16,
sint64 neg_f_531_low60_40_low20_17,
sint64 neg_g_531_low60_40_low20_17,
sint64 u_571_587,
sint64 v_571_587,
sint64 r_571_587,
sint64 s_571_587,
sint64 u_571_588,
sint64 v_571_588,
sint64 r_571_588,
sint64 s_571_588,
bit ne
)={
    u_571_587 * neg_f_531_low60_40_low20_0 + v_571_587 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_16 * (-(2**20)),
    r_571_587 * neg_f_531_low60_40_low20_0 + s_571_587 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_16 * (-(2**20))
&&
    u_571_587 * neg_f_531_low60_40_low20_0 + v_571_587 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_16 * (const 64 (-(2**20))),
    r_571_587 * neg_f_531_low60_40_low20_0 + s_571_587 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_16 + u_571_587 * (const 64 (2**21)) + v_571_587 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_16 + r_571_587 * (const 64 (2**21)) + s_571_587 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_16,
    neg_f_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_16,
    neg_g_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 587)) <=s delta, delta <=s (const 64 (1 + 2*587)),
    (const 64 (-(2**20))) <=s u_571_587, u_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_587, v_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_587, r_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_587, s_571_587 <=s (const 64 ((2**20)-1)),
    u_571_587 + v_571_587 <=s (const 64 (2**20)),
    u_571_587 - v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 + v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 - v_571_587 <=s (const 64 (2**20)),
    r_571_587 + s_571_587 <=s (const 64 (2**20)),
    r_571_587 - s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 + s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 - s_571_587 <=s (const 64 (2**20)),
    u_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_571_587 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step587

// premise a
assume
neg_g_531_low60_40_low20_16 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_16 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_17 neg_f_531_low60_40_low20_16;
mov u_571_588 u_571_587;
mov v_571_588 v_571_587;

asr neg_g_531_low60_40_low20_17 neg_g_531_low60_40_low20_16 1;
asr r_571_588 r_571_587 1;
asr s_571_588 s_571_587 1;
assert
    true
&&
    neg_f_531_low60_40_low20_17 = neg_f_531_low60_40_low20_16,
    u_571_588 = u_571_587,
    v_571_588 = v_571_587,
    neg_g_531_low60_40_low20_17 * (const 64 2) = neg_g_531_low60_40_low20_16,
    r_571_588 * (const 64 2) = r_571_587,
    s_571_588 * (const 64 2) = s_571_587
;

assume
    neg_f_531_low60_40_low20_17 = neg_f_531_low60_40_low20_16,
    u_571_588 = u_571_587,
    v_571_588 = v_571_587,
    neg_g_531_low60_40_low20_17 * 2 = neg_g_531_low60_40_low20_16,
    r_571_588 * 2 = r_571_587,
    s_571_588 * 2 = s_571_587
&&
    true
;

{
    u_571_588 * neg_f_531_low60_40_low20_0 + v_571_588 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_588 * neg_f_531_low60_40_low20_0 + s_571_588 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_17 + u_571_588 * (const 64 (2**21)) + v_571_588 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_17 + r_571_588 * (const 64 (2**21)) + s_571_588 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_17,
    neg_f_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_17,
    neg_g_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 588)) <=s delta, delta <=s (const 64 (1 + 2*588)),
    (const 64 (-(2**20))) <=s u_571_588, u_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_588, v_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_588, r_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_588, s_571_588 <=s (const 64 ((2**20)-1)),
    u_571_588 + v_571_588 <=s (const 64 (2**20)),
    u_571_588 - v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 + v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 - v_571_588 <=s (const 64 (2**20)),
    r_571_588 + s_571_588 <=s (const 64 (2**20)),
    r_571_588 - s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 + s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 - s_571_588 <=s (const 64 (2**20)),
    u_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_571_588 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_587_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_16,
sint64 neg_g_531_low60_40_low20_16,
sint64 neg_f_531_low60_40_low20_17,
sint64 neg_g_531_low60_40_low20_17,
sint64 u_571_587,
sint64 v_571_587,
sint64 r_571_587,
sint64 s_571_587,
sint64 u_571_588,
sint64 v_571_588,
sint64 r_571_588,
sint64 s_571_588,
bit ne
)={
    u_571_587 * neg_f_531_low60_40_low20_0 + v_571_587 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_16 * (-(2**20)),
    r_571_587 * neg_f_531_low60_40_low20_0 + s_571_587 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_16 * (-(2**20))
&&
    u_571_587 * neg_f_531_low60_40_low20_0 + v_571_587 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_16 * (const 64 (-(2**20))),
    r_571_587 * neg_f_531_low60_40_low20_0 + s_571_587 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_16 + u_571_587 * (const 64 (2**21)) + v_571_587 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_16 + r_571_587 * (const 64 (2**21)) + s_571_587 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_16,
    neg_f_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_16,
    neg_g_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 587)) <=s delta, delta <=s (const 64 (1 + 2*587)),
    (const 64 (-(2**20))) <=s u_571_587, u_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_587, v_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_587, r_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_587, s_571_587 <=s (const 64 ((2**20)-1)),
    u_571_587 + v_571_587 <=s (const 64 (2**20)),
    u_571_587 - v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 + v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 - v_571_587 <=s (const 64 (2**20)),
    r_571_587 + s_571_587 <=s (const 64 (2**20)),
    r_571_587 - s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 + s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 - s_571_587 <=s (const 64 (2**20)),
    u_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_571_587 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step587

// premise b
assume
neg_g_531_low60_40_low20_16 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_17 neg_f_531_low60_40_low20_16;
mov u_571_588 u_571_587;
mov v_571_588 v_571_587;

add neg_g_531_low60_40_low20_17 neg_g_531_low60_40_low20_16 neg_f_531_low60_40_low20_16;
asr neg_g_531_low60_40_low20_17 neg_g_531_low60_40_low20_17 1;
add r_571_588 r_571_587 u_571_587;
asr r_571_588 r_571_588 1;
add s_571_588 s_571_587 v_571_587;
asr s_571_588 s_571_588 1;
assert
    true
&&
    neg_f_531_low60_40_low20_17 = neg_f_531_low60_40_low20_16,
    u_571_588 = u_571_587,
    v_571_588 = v_571_587,
    neg_g_531_low60_40_low20_17 * (const 64 2) = neg_g_531_low60_40_low20_16 + neg_f_531_low60_40_low20_16,
    r_571_588 * (const 64 2) = r_571_587 + u_571_587,
    s_571_588 * (const 64 2) = s_571_587 + v_571_587
;

assume
    neg_f_531_low60_40_low20_17 = neg_f_531_low60_40_low20_16,
    u_571_588 = u_571_587,
    v_571_588 = v_571_587,
    neg_g_531_low60_40_low20_17 * 2 = neg_g_531_low60_40_low20_16 + neg_f_531_low60_40_low20_16,
    r_571_588 * 2 = r_571_587 + u_571_587,
    s_571_588 * 2 = s_571_587 + v_571_587
&&
    true
;

{
    u_571_588 * neg_f_531_low60_40_low20_0 + v_571_588 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_588 * neg_f_531_low60_40_low20_0 + s_571_588 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_17 + u_571_588 * (const 64 (2**21)) + v_571_588 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_17 + r_571_588 * (const 64 (2**21)) + s_571_588 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_17,
    neg_f_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_17,
    neg_g_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 588)) <=s delta, delta <=s (const 64 (1 + 2*588)),
    (const 64 (-(2**20))) <=s u_571_588, u_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_588, v_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_588, r_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_588, s_571_588 <=s (const 64 ((2**20)-1)),
    u_571_588 + v_571_588 <=s (const 64 (2**20)),
    u_571_588 - v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 + v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 - v_571_588 <=s (const 64 (2**20)),
    r_571_588 + s_571_588 <=s (const 64 (2**20)),
    r_571_588 - s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 + s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 - s_571_588 <=s (const 64 (2**20)),
    u_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_571_588 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_587_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_16,
sint64 neg_g_531_low60_40_low20_16,
sint64 neg_f_531_low60_40_low20_17,
sint64 neg_g_531_low60_40_low20_17,
sint64 u_571_587,
sint64 v_571_587,
sint64 r_571_587,
sint64 s_571_587,
sint64 u_571_588,
sint64 v_571_588,
sint64 r_571_588,
sint64 s_571_588,
bit ne
)={
    u_571_587 * neg_f_531_low60_40_low20_0 + v_571_587 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_16 * (-(2**20)),
    r_571_587 * neg_f_531_low60_40_low20_0 + s_571_587 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_16 * (-(2**20))
&&
    u_571_587 * neg_f_531_low60_40_low20_0 + v_571_587 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_16 * (const 64 (-(2**20))),
    r_571_587 * neg_f_531_low60_40_low20_0 + s_571_587 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_16 + u_571_587 * (const 64 (2**21)) + v_571_587 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_16 + r_571_587 * (const 64 (2**21)) + s_571_587 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_16,
    neg_f_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_16,
    neg_g_531_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 587)) <=s delta, delta <=s (const 64 (1 + 2*587)),
    (const 64 (-(2**20))) <=s u_571_587, u_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_587, v_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_587, r_571_587 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_587, s_571_587 <=s (const 64 ((2**20)-1)),
    u_571_587 + v_571_587 <=s (const 64 (2**20)),
    u_571_587 - v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 + v_571_587 <=s (const 64 (2**20)),
    (const 64 0) - u_571_587 - v_571_587 <=s (const 64 (2**20)),
    r_571_587 + s_571_587 <=s (const 64 (2**20)),
    r_571_587 - s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 + s_571_587 <=s (const 64 (2**20)),
    (const 64 0) - r_571_587 - s_571_587 <=s (const 64 (2**20)),
    u_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_571_587 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_571_587 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step587

// premise c
assume
neg_g_531_low60_40_low20_16 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_17 neg_g_531_low60_40_low20_16;
mov u_571_588 r_571_587;
mov v_571_588 s_571_587;

subs dc neg_g_531_low60_40_low20_17 neg_g_531_low60_40_low20_16 neg_f_531_low60_40_low20_16;
asr neg_g_531_low60_40_low20_17 neg_g_531_low60_40_low20_17 1;
subs dc r_571_588 r_571_587 u_571_587;
asr r_571_588 r_571_588 1;
subs dc s_571_588 s_571_587 v_571_587;
asr s_571_588 s_571_588 1;
assert
    true
&&
    neg_f_531_low60_40_low20_17 = neg_g_531_low60_40_low20_16,
    u_571_588 = r_571_587,
    v_571_588 = s_571_587,
    neg_g_531_low60_40_low20_17 * (const 64 2) = neg_g_531_low60_40_low20_16 - neg_f_531_low60_40_low20_16,
    r_571_588 * (const 64 2) = r_571_587 - u_571_587,
    s_571_588 * (const 64 2) = s_571_587 - v_571_587
;

assume
    neg_f_531_low60_40_low20_17 = neg_g_531_low60_40_low20_16,
    u_571_588 = r_571_587,
    v_571_588 = s_571_587,
    neg_g_531_low60_40_low20_17 * 2 = neg_g_531_low60_40_low20_16 - neg_f_531_low60_40_low20_16,
    r_571_588 * 2 = r_571_587 - u_571_587,
    s_571_588 * 2 = s_571_587 - v_571_587
&&
    true
;

{
    u_571_588 * neg_f_531_low60_40_low20_0 + v_571_588 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_588 * neg_f_531_low60_40_low20_0 + s_571_588 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_17 + u_571_588 * (const 64 (2**21)) + v_571_588 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_17 + r_571_588 * (const 64 (2**21)) + s_571_588 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_17,
    neg_f_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_17,
    neg_g_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 588)) <=s delta, delta <=s (const 64 (1 + 2*588)),
    (const 64 (-(2**20))) <=s u_571_588, u_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_588, v_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_588, r_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_588, s_571_588 <=s (const 64 ((2**20)-1)),
    u_571_588 + v_571_588 <=s (const 64 (2**20)),
    u_571_588 - v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 + v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 - v_571_588 <=s (const 64 (2**20)),
    r_571_588 + s_571_588 <=s (const 64 (2**20)),
    r_571_588 - s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 + s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 - s_571_588 <=s (const 64 (2**20)),
    u_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_571_588 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_588_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_17,
sint64 neg_g_531_low60_40_low20_17,
sint64 neg_f_531_low60_40_low20_18,
sint64 neg_g_531_low60_40_low20_18,
sint64 u_571_588,
sint64 v_571_588,
sint64 r_571_588,
sint64 s_571_588,
sint64 u_571_589,
sint64 v_571_589,
sint64 r_571_589,
sint64 s_571_589,
bit ne
)={
    u_571_588 * neg_f_531_low60_40_low20_0 + v_571_588 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_17 * (-(2**20)),
    r_571_588 * neg_f_531_low60_40_low20_0 + s_571_588 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_17 * (-(2**20))
&&
    u_571_588 * neg_f_531_low60_40_low20_0 + v_571_588 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_17 * (const 64 (-(2**20))),
    r_571_588 * neg_f_531_low60_40_low20_0 + s_571_588 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_17 + u_571_588 * (const 64 (2**21)) + v_571_588 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_17 + r_571_588 * (const 64 (2**21)) + s_571_588 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_17,
    neg_f_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_17,
    neg_g_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 588)) <=s delta, delta <=s (const 64 (1 + 2*588)),
    (const 64 (-(2**20))) <=s u_571_588, u_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_588, v_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_588, r_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_588, s_571_588 <=s (const 64 ((2**20)-1)),
    u_571_588 + v_571_588 <=s (const 64 (2**20)),
    u_571_588 - v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 + v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 - v_571_588 <=s (const 64 (2**20)),
    r_571_588 + s_571_588 <=s (const 64 (2**20)),
    r_571_588 - s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 + s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 - s_571_588 <=s (const 64 (2**20)),
    u_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_571_588 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step588

// premise a
assume
neg_g_531_low60_40_low20_17 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_17 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_18 neg_f_531_low60_40_low20_17;
mov u_571_589 u_571_588;
mov v_571_589 v_571_588;

asr neg_g_531_low60_40_low20_18 neg_g_531_low60_40_low20_17 1;
asr r_571_589 r_571_588 1;
asr s_571_589 s_571_588 1;
assert
    true
&&
    neg_f_531_low60_40_low20_18 = neg_f_531_low60_40_low20_17,
    u_571_589 = u_571_588,
    v_571_589 = v_571_588,
    neg_g_531_low60_40_low20_18 * (const 64 2) = neg_g_531_low60_40_low20_17,
    r_571_589 * (const 64 2) = r_571_588,
    s_571_589 * (const 64 2) = s_571_588
;

assume
    neg_f_531_low60_40_low20_18 = neg_f_531_low60_40_low20_17,
    u_571_589 = u_571_588,
    v_571_589 = v_571_588,
    neg_g_531_low60_40_low20_18 * 2 = neg_g_531_low60_40_low20_17,
    r_571_589 * 2 = r_571_588,
    s_571_589 * 2 = s_571_588
&&
    true
;

{
    u_571_589 * neg_f_531_low60_40_low20_0 + v_571_589 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_589 * neg_f_531_low60_40_low20_0 + s_571_589 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_18 + u_571_589 * (const 64 (2**21)) + v_571_589 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_18 + r_571_589 * (const 64 (2**21)) + s_571_589 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_18,
    neg_f_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_18,
    neg_g_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 589)) <=s delta, delta <=s (const 64 (1 + 2*589)),
    (const 64 (-(2**20))) <=s u_571_589, u_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_589, v_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_589, r_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_589, s_571_589 <=s (const 64 ((2**20)-1)),
    u_571_589 + v_571_589 <=s (const 64 (2**20)),
    u_571_589 - v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 + v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 - v_571_589 <=s (const 64 (2**20)),
    r_571_589 + s_571_589 <=s (const 64 (2**20)),
    r_571_589 - s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 + s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 - s_571_589 <=s (const 64 (2**20)),
    u_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_571_589 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_588_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_17,
sint64 neg_g_531_low60_40_low20_17,
sint64 neg_f_531_low60_40_low20_18,
sint64 neg_g_531_low60_40_low20_18,
sint64 u_571_588,
sint64 v_571_588,
sint64 r_571_588,
sint64 s_571_588,
sint64 u_571_589,
sint64 v_571_589,
sint64 r_571_589,
sint64 s_571_589,
bit ne
)={
    u_571_588 * neg_f_531_low60_40_low20_0 + v_571_588 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_17 * (-(2**20)),
    r_571_588 * neg_f_531_low60_40_low20_0 + s_571_588 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_17 * (-(2**20))
&&
    u_571_588 * neg_f_531_low60_40_low20_0 + v_571_588 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_17 * (const 64 (-(2**20))),
    r_571_588 * neg_f_531_low60_40_low20_0 + s_571_588 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_17 + u_571_588 * (const 64 (2**21)) + v_571_588 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_17 + r_571_588 * (const 64 (2**21)) + s_571_588 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_17,
    neg_f_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_17,
    neg_g_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 588)) <=s delta, delta <=s (const 64 (1 + 2*588)),
    (const 64 (-(2**20))) <=s u_571_588, u_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_588, v_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_588, r_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_588, s_571_588 <=s (const 64 ((2**20)-1)),
    u_571_588 + v_571_588 <=s (const 64 (2**20)),
    u_571_588 - v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 + v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 - v_571_588 <=s (const 64 (2**20)),
    r_571_588 + s_571_588 <=s (const 64 (2**20)),
    r_571_588 - s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 + s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 - s_571_588 <=s (const 64 (2**20)),
    u_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_571_588 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step588

// premise b
assume
neg_g_531_low60_40_low20_17 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_18 neg_f_531_low60_40_low20_17;
mov u_571_589 u_571_588;
mov v_571_589 v_571_588;

add neg_g_531_low60_40_low20_18 neg_g_531_low60_40_low20_17 neg_f_531_low60_40_low20_17;
asr neg_g_531_low60_40_low20_18 neg_g_531_low60_40_low20_18 1;
add r_571_589 r_571_588 u_571_588;
asr r_571_589 r_571_589 1;
add s_571_589 s_571_588 v_571_588;
asr s_571_589 s_571_589 1;
assert
    true
&&
    neg_f_531_low60_40_low20_18 = neg_f_531_low60_40_low20_17,
    u_571_589 = u_571_588,
    v_571_589 = v_571_588,
    neg_g_531_low60_40_low20_18 * (const 64 2) = neg_g_531_low60_40_low20_17 + neg_f_531_low60_40_low20_17,
    r_571_589 * (const 64 2) = r_571_588 + u_571_588,
    s_571_589 * (const 64 2) = s_571_588 + v_571_588
;

assume
    neg_f_531_low60_40_low20_18 = neg_f_531_low60_40_low20_17,
    u_571_589 = u_571_588,
    v_571_589 = v_571_588,
    neg_g_531_low60_40_low20_18 * 2 = neg_g_531_low60_40_low20_17 + neg_f_531_low60_40_low20_17,
    r_571_589 * 2 = r_571_588 + u_571_588,
    s_571_589 * 2 = s_571_588 + v_571_588
&&
    true
;

{
    u_571_589 * neg_f_531_low60_40_low20_0 + v_571_589 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_589 * neg_f_531_low60_40_low20_0 + s_571_589 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_18 + u_571_589 * (const 64 (2**21)) + v_571_589 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_18 + r_571_589 * (const 64 (2**21)) + s_571_589 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_18,
    neg_f_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_18,
    neg_g_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 589)) <=s delta, delta <=s (const 64 (1 + 2*589)),
    (const 64 (-(2**20))) <=s u_571_589, u_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_589, v_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_589, r_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_589, s_571_589 <=s (const 64 ((2**20)-1)),
    u_571_589 + v_571_589 <=s (const 64 (2**20)),
    u_571_589 - v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 + v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 - v_571_589 <=s (const 64 (2**20)),
    r_571_589 + s_571_589 <=s (const 64 (2**20)),
    r_571_589 - s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 + s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 - s_571_589 <=s (const 64 (2**20)),
    u_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_571_589 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_588_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_17,
sint64 neg_g_531_low60_40_low20_17,
sint64 neg_f_531_low60_40_low20_18,
sint64 neg_g_531_low60_40_low20_18,
sint64 u_571_588,
sint64 v_571_588,
sint64 r_571_588,
sint64 s_571_588,
sint64 u_571_589,
sint64 v_571_589,
sint64 r_571_589,
sint64 s_571_589,
bit ne
)={
    u_571_588 * neg_f_531_low60_40_low20_0 + v_571_588 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_17 * (-(2**20)),
    r_571_588 * neg_f_531_low60_40_low20_0 + s_571_588 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_17 * (-(2**20))
&&
    u_571_588 * neg_f_531_low60_40_low20_0 + v_571_588 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_17 * (const 64 (-(2**20))),
    r_571_588 * neg_f_531_low60_40_low20_0 + s_571_588 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_17 + u_571_588 * (const 64 (2**21)) + v_571_588 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_17 + r_571_588 * (const 64 (2**21)) + s_571_588 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_17,
    neg_f_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_17,
    neg_g_531_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 588)) <=s delta, delta <=s (const 64 (1 + 2*588)),
    (const 64 (-(2**20))) <=s u_571_588, u_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_588, v_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_588, r_571_588 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_588, s_571_588 <=s (const 64 ((2**20)-1)),
    u_571_588 + v_571_588 <=s (const 64 (2**20)),
    u_571_588 - v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 + v_571_588 <=s (const 64 (2**20)),
    (const 64 0) - u_571_588 - v_571_588 <=s (const 64 (2**20)),
    r_571_588 + s_571_588 <=s (const 64 (2**20)),
    r_571_588 - s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 + s_571_588 <=s (const 64 (2**20)),
    (const 64 0) - r_571_588 - s_571_588 <=s (const 64 (2**20)),
    u_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_571_588 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_571_588 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step588

// premise c
assume
neg_g_531_low60_40_low20_17 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_18 neg_g_531_low60_40_low20_17;
mov u_571_589 r_571_588;
mov v_571_589 s_571_588;

subs dc neg_g_531_low60_40_low20_18 neg_g_531_low60_40_low20_17 neg_f_531_low60_40_low20_17;
asr neg_g_531_low60_40_low20_18 neg_g_531_low60_40_low20_18 1;
subs dc r_571_589 r_571_588 u_571_588;
asr r_571_589 r_571_589 1;
subs dc s_571_589 s_571_588 v_571_588;
asr s_571_589 s_571_589 1;
assert
    true
&&
    neg_f_531_low60_40_low20_18 = neg_g_531_low60_40_low20_17,
    u_571_589 = r_571_588,
    v_571_589 = s_571_588,
    neg_g_531_low60_40_low20_18 * (const 64 2) = neg_g_531_low60_40_low20_17 - neg_f_531_low60_40_low20_17,
    r_571_589 * (const 64 2) = r_571_588 - u_571_588,
    s_571_589 * (const 64 2) = s_571_588 - v_571_588
;

assume
    neg_f_531_low60_40_low20_18 = neg_g_531_low60_40_low20_17,
    u_571_589 = r_571_588,
    v_571_589 = s_571_588,
    neg_g_531_low60_40_low20_18 * 2 = neg_g_531_low60_40_low20_17 - neg_f_531_low60_40_low20_17,
    r_571_589 * 2 = r_571_588 - u_571_588,
    s_571_589 * 2 = s_571_588 - v_571_588
&&
    true
;

{
    u_571_589 * neg_f_531_low60_40_low20_0 + v_571_589 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_589 * neg_f_531_low60_40_low20_0 + s_571_589 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_18 + u_571_589 * (const 64 (2**21)) + v_571_589 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_18 + r_571_589 * (const 64 (2**21)) + s_571_589 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_18,
    neg_f_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_18,
    neg_g_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 589)) <=s delta, delta <=s (const 64 (1 + 2*589)),
    (const 64 (-(2**20))) <=s u_571_589, u_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_589, v_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_589, r_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_589, s_571_589 <=s (const 64 ((2**20)-1)),
    u_571_589 + v_571_589 <=s (const 64 (2**20)),
    u_571_589 - v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 + v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 - v_571_589 <=s (const 64 (2**20)),
    r_571_589 + s_571_589 <=s (const 64 (2**20)),
    r_571_589 - s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 + s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 - s_571_589 <=s (const 64 (2**20)),
    u_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_571_589 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_589_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_18,
sint64 neg_g_531_low60_40_low20_18,
sint64 neg_f_531_low60_40_low20_19,
sint64 neg_g_531_low60_40_low20_19,
sint64 u_571_589,
sint64 v_571_589,
sint64 r_571_589,
sint64 s_571_589,
sint64 u_571_590,
sint64 v_571_590,
sint64 r_571_590,
sint64 s_571_590,
bit ne
)={
    u_571_589 * neg_f_531_low60_40_low20_0 + v_571_589 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_18 * (-(2**20)),
    r_571_589 * neg_f_531_low60_40_low20_0 + s_571_589 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_18 * (-(2**20))
&&
    u_571_589 * neg_f_531_low60_40_low20_0 + v_571_589 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_18 * (const 64 (-(2**20))),
    r_571_589 * neg_f_531_low60_40_low20_0 + s_571_589 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_18 + u_571_589 * (const 64 (2**21)) + v_571_589 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_18 + r_571_589 * (const 64 (2**21)) + s_571_589 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_18,
    neg_f_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_18,
    neg_g_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 589)) <=s delta, delta <=s (const 64 (1 + 2*589)),
    (const 64 (-(2**20))) <=s u_571_589, u_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_589, v_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_589, r_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_589, s_571_589 <=s (const 64 ((2**20)-1)),
    u_571_589 + v_571_589 <=s (const 64 (2**20)),
    u_571_589 - v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 + v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 - v_571_589 <=s (const 64 (2**20)),
    r_571_589 + s_571_589 <=s (const 64 (2**20)),
    r_571_589 - s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 + s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 - s_571_589 <=s (const 64 (2**20)),
    u_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_571_589 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step589

// premise a
assume
neg_g_531_low60_40_low20_18 = 0 (mod 2)
&&
neg_g_531_low60_40_low20_18 = const 64 0 (mod (const 64 2))
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

mov neg_f_531_low60_40_low20_19 neg_f_531_low60_40_low20_18;
mov u_571_590 u_571_589;
mov v_571_590 v_571_589;

asr neg_g_531_low60_40_low20_19 neg_g_531_low60_40_low20_18 1;
asr r_571_590 r_571_589 1;
asr s_571_590 s_571_589 1;
assert
    true
&&
    neg_f_531_low60_40_low20_19 = neg_f_531_low60_40_low20_18,
    u_571_590 = u_571_589,
    v_571_590 = v_571_589,
    neg_g_531_low60_40_low20_19 * (const 64 2) = neg_g_531_low60_40_low20_18,
    r_571_590 * (const 64 2) = r_571_589,
    s_571_590 * (const 64 2) = s_571_589
;

assume
    neg_f_531_low60_40_low20_19 = neg_f_531_low60_40_low20_18,
    u_571_590 = u_571_589,
    v_571_590 = v_571_589,
    neg_g_531_low60_40_low20_19 * 2 = neg_g_531_low60_40_low20_18,
    r_571_590 * 2 = r_571_589,
    s_571_590 * 2 = s_571_589
&&
    true
;

{
    u_571_590 * neg_f_531_low60_40_low20_0 + v_571_590 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_590 * neg_f_531_low60_40_low20_0 + s_571_590 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_19 + u_571_590 * (const 64 (2**21)) + v_571_590 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_19 + r_571_590 * (const 64 (2**21)) + s_571_590 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_19,
    neg_f_531_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_19,
    neg_g_531_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 590)) <=s delta, delta <=s (const 64 (1 + 2*590)),
    (const 64 (-(2**20))) <=s u_571_590, u_571_590 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_590, v_571_590 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_590, r_571_590 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_590, s_571_590 <=s (const 64 ((2**20)-1)),
    u_571_590 + v_571_590 <=s (const 64 (2**20)),
    u_571_590 - v_571_590 <=s (const 64 (2**20)),
    (const 64 0) - u_571_590 + v_571_590 <=s (const 64 (2**20)),
    (const 64 0) - u_571_590 - v_571_590 <=s (const 64 (2**20)),
    r_571_590 + s_571_590 <=s (const 64 (2**20)),
    r_571_590 - s_571_590 <=s (const 64 (2**20)),
    (const 64 0) - r_571_590 + s_571_590 <=s (const 64 (2**20)),
    (const 64 0) - r_571_590 - s_571_590 <=s (const 64 (2**20)),
    u_571_590 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_571_590 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_571_590 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_571_590 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_589_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_18,
sint64 neg_g_531_low60_40_low20_18,
sint64 neg_f_531_low60_40_low20_19,
sint64 neg_g_531_low60_40_low20_19,
sint64 u_571_589,
sint64 v_571_589,
sint64 r_571_589,
sint64 s_571_589,
sint64 u_571_590,
sint64 v_571_590,
sint64 r_571_590,
sint64 s_571_590,
bit ne
)={
    u_571_589 * neg_f_531_low60_40_low20_0 + v_571_589 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_18 * (-(2**20)),
    r_571_589 * neg_f_531_low60_40_low20_0 + s_571_589 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_18 * (-(2**20))
&&
    u_571_589 * neg_f_531_low60_40_low20_0 + v_571_589 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_18 * (const 64 (-(2**20))),
    r_571_589 * neg_f_531_low60_40_low20_0 + s_571_589 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_18 + u_571_589 * (const 64 (2**21)) + v_571_589 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_18 + r_571_589 * (const 64 (2**21)) + s_571_589 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_18,
    neg_f_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_18,
    neg_g_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 589)) <=s delta, delta <=s (const 64 (1 + 2*589)),
    (const 64 (-(2**20))) <=s u_571_589, u_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_589, v_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_589, r_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_589, s_571_589 <=s (const 64 ((2**20)-1)),
    u_571_589 + v_571_589 <=s (const 64 (2**20)),
    u_571_589 - v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 + v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 - v_571_589 <=s (const 64 (2**20)),
    r_571_589 + s_571_589 <=s (const 64 (2**20)),
    r_571_589 - s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 + s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 - s_571_589 <=s (const 64 (2**20)),
    u_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_571_589 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step589

// premise b
assume
neg_g_531_low60_40_low20_18 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_19 neg_f_531_low60_40_low20_18;
mov u_571_590 u_571_589;
mov v_571_590 v_571_589;

add neg_g_531_low60_40_low20_19 neg_g_531_low60_40_low20_18 neg_f_531_low60_40_low20_18;
asr neg_g_531_low60_40_low20_19 neg_g_531_low60_40_low20_19 1;
add r_571_590 r_571_589 u_571_589;
asr r_571_590 r_571_590 1;
add s_571_590 s_571_589 v_571_589;
asr s_571_590 s_571_590 1;
assert
    true
&&
    neg_f_531_low60_40_low20_19 = neg_f_531_low60_40_low20_18,
    u_571_590 = u_571_589,
    v_571_590 = v_571_589,
    neg_g_531_low60_40_low20_19 * (const 64 2) = neg_g_531_low60_40_low20_18 + neg_f_531_low60_40_low20_18,
    r_571_590 * (const 64 2) = r_571_589 + u_571_589,
    s_571_590 * (const 64 2) = s_571_589 + v_571_589
;

assume
    neg_f_531_low60_40_low20_19 = neg_f_531_low60_40_low20_18,
    u_571_590 = u_571_589,
    v_571_590 = v_571_589,
    neg_g_531_low60_40_low20_19 * 2 = neg_g_531_low60_40_low20_18 + neg_f_531_low60_40_low20_18,
    r_571_590 * 2 = r_571_589 + u_571_589,
    s_571_590 * 2 = s_571_589 + v_571_589
&&
    true
;

{
    u_571_590 * neg_f_531_low60_40_low20_0 + v_571_590 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_590 * neg_f_531_low60_40_low20_0 + s_571_590 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_19 + u_571_590 * (const 64 (2**21)) + v_571_590 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_19 + r_571_590 * (const 64 (2**21)) + s_571_590 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_19,
    neg_f_531_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_19,
    neg_g_531_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 590)) <=s delta, delta <=s (const 64 (1 + 2*590)),
    (const 64 (-(2**20))) <=s u_571_590, u_571_590 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_590, v_571_590 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_590, r_571_590 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_590, s_571_590 <=s (const 64 ((2**20)-1)),
    u_571_590 + v_571_590 <=s (const 64 (2**20)),
    u_571_590 - v_571_590 <=s (const 64 (2**20)),
    (const 64 0) - u_571_590 + v_571_590 <=s (const 64 (2**20)),
    (const 64 0) - u_571_590 - v_571_590 <=s (const 64 (2**20)),
    r_571_590 + s_571_590 <=s (const 64 (2**20)),
    r_571_590 - s_571_590 <=s (const 64 (2**20)),
    (const 64 0) - r_571_590 + s_571_590 <=s (const 64 (2**20)),
    (const 64 0) - r_571_590 - s_571_590 <=s (const 64 (2**20)),
    u_571_590 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_571_590 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_571_590 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_571_590 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_589_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_18,
sint64 neg_g_531_low60_40_low20_18,
sint64 neg_f_531_low60_40_low20_19,
sint64 neg_g_531_low60_40_low20_19,
sint64 u_571_589,
sint64 v_571_589,
sint64 r_571_589,
sint64 s_571_589,
sint64 u_571_590,
sint64 v_571_590,
sint64 r_571_590,
sint64 s_571_590,
bit ne
)={
    u_571_589 * neg_f_531_low60_40_low20_0 + v_571_589 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_18 * (-(2**20)),
    r_571_589 * neg_f_531_low60_40_low20_0 + s_571_589 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_18 * (-(2**20))
&&
    u_571_589 * neg_f_531_low60_40_low20_0 + v_571_589 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_18 * (const 64 (-(2**20))),
    r_571_589 * neg_f_531_low60_40_low20_0 + s_571_589 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_18 + u_571_589 * (const 64 (2**21)) + v_571_589 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_18 + r_571_589 * (const 64 (2**21)) + s_571_589 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_18,
    neg_f_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_18,
    neg_g_531_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 589)) <=s delta, delta <=s (const 64 (1 + 2*589)),
    (const 64 (-(2**20))) <=s u_571_589, u_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_589, v_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_589, r_571_589 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_589, s_571_589 <=s (const 64 ((2**20)-1)),
    u_571_589 + v_571_589 <=s (const 64 (2**20)),
    u_571_589 - v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 + v_571_589 <=s (const 64 (2**20)),
    (const 64 0) - u_571_589 - v_571_589 <=s (const 64 (2**20)),
    r_571_589 + s_571_589 <=s (const 64 (2**20)),
    r_571_589 - s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 + s_571_589 <=s (const 64 (2**20)),
    (const 64 0) - r_571_589 - s_571_589 <=s (const 64 (2**20)),
    u_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_571_589 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_571_589 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step589

// premise c
assume
neg_g_531_low60_40_low20_18 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_19 neg_g_531_low60_40_low20_18;
mov u_571_590 r_571_589;
mov v_571_590 s_571_589;

subs dc neg_g_531_low60_40_low20_19 neg_g_531_low60_40_low20_18 neg_f_531_low60_40_low20_18;
asr neg_g_531_low60_40_low20_19 neg_g_531_low60_40_low20_19 1;
subs dc r_571_590 r_571_589 u_571_589;
asr r_571_590 r_571_590 1;
subs dc s_571_590 s_571_589 v_571_589;
asr s_571_590 s_571_590 1;
assert
    true
&&
    neg_f_531_low60_40_low20_19 = neg_g_531_low60_40_low20_18,
    u_571_590 = r_571_589,
    v_571_590 = s_571_589,
    neg_g_531_low60_40_low20_19 * (const 64 2) = neg_g_531_low60_40_low20_18 - neg_f_531_low60_40_low20_18,
    r_571_590 * (const 64 2) = r_571_589 - u_571_589,
    s_571_590 * (const 64 2) = s_571_589 - v_571_589
;

assume
    neg_f_531_low60_40_low20_19 = neg_g_531_low60_40_low20_18,
    u_571_590 = r_571_589,
    v_571_590 = s_571_589,
    neg_g_531_low60_40_low20_19 * 2 = neg_g_531_low60_40_low20_18 - neg_f_531_low60_40_low20_18,
    r_571_590 * 2 = r_571_589 - u_571_589,
    s_571_590 * 2 = s_571_589 - v_571_589
&&
    true
;

{
    u_571_590 * neg_f_531_low60_40_low20_0 + v_571_590 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_590 * neg_f_531_low60_40_low20_0 + s_571_590 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_19 + u_571_590 * (const 64 (2**21)) + v_571_590 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_19 + r_571_590 * (const 64 (2**21)) + s_571_590 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_19,
    neg_f_531_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_19,
    neg_g_531_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 590)) <=s delta, delta <=s (const 64 (1 + 2*590)),
    (const 64 (-(2**20))) <=s u_571_590, u_571_590 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_571_590, v_571_590 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_571_590, r_571_590 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_571_590, s_571_590 <=s (const 64 ((2**20)-1)),
    u_571_590 + v_571_590 <=s (const 64 (2**20)),
    u_571_590 - v_571_590 <=s (const 64 (2**20)),
    (const 64 0) - u_571_590 + v_571_590 <=s (const 64 (2**20)),
    (const 64 0) - u_571_590 - v_571_590 <=s (const 64 (2**20)),
    r_571_590 + s_571_590 <=s (const 64 (2**20)),
    r_571_590 - s_571_590 <=s (const 64 (2**20)),
    (const 64 0) - r_571_590 + s_571_590 <=s (const 64 (2**20)),
    (const 64 0) - r_571_590 - s_571_590 <=s (const 64 (2**20)),
    u_571_590 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_571_590 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_571_590 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_571_590 = (const 64 0) (mod (const 64 (2**(20-19))))
}

