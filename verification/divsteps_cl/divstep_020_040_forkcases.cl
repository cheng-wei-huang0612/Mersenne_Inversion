proc divstep_020_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_1,
sint64 neg_g_0_low60_20_low20_1,
sint64 u_20_20,
sint64 v_20_20,
sint64 r_20_20,
sint64 s_20_20,
sint64 u_20_21,
sint64 v_20_21,
sint64 r_20_21,
sint64 s_20_21,
bit ne
)={
    u_20_20 * neg_f_0_low60_20_low20_0 + v_20_20 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_0 * (-(2**20)),
    r_20_20 * neg_f_0_low60_20_low20_0 + s_20_20 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_0 * (-(2**20))
&&
    u_20_20 * neg_f_0_low60_20_low20_0 + v_20_20 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_0 * (const 64 (-(2**20))),
    r_20_20 * neg_f_0_low60_20_low20_0 + s_20_20 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_0 + u_20_20 * (const 64 (2**21)) + v_20_20 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_0 + r_20_20 * (const 64 (2**21)) + s_20_20 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 20)) <=s delta, delta <=s (const 64 (1 + 2*20)),
    u_20_20 = (const 64 (-(2**20))),
    v_20_20 = (const 64 (0)),
    r_20_20 = (const 64 (0)),
    s_20_20 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise a
assume
neg_g_0_low60_20_low20_0 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_0_low60_20_low20_1 neg_f_0_low60_20_low20_0;
mov u_20_21 u_20_20;
mov v_20_21 v_20_20;

asr neg_g_0_low60_20_low20_1 neg_g_0_low60_20_low20_0 1;
asr r_20_21 r_20_20 1;
asr s_20_21 s_20_20 1;
assert
    true
&&
    neg_f_0_low60_20_low20_1 = neg_f_0_low60_20_low20_0,
    u_20_21 = u_20_20,
    v_20_21 = v_20_20,
    neg_g_0_low60_20_low20_1 * (const 64 2) = neg_g_0_low60_20_low20_0,
    r_20_21 * (const 64 2) = r_20_20,
    s_20_21 * (const 64 2) = s_20_20
;

assume
    neg_f_0_low60_20_low20_1 = neg_f_0_low60_20_low20_0,
    u_20_21 = u_20_20,
    v_20_21 = v_20_20,
    neg_g_0_low60_20_low20_1 * 2 = neg_g_0_low60_20_low20_0,
    r_20_21 * 2 = r_20_20,
    s_20_21 * 2 = s_20_20
&&
    true
;

{
    u_20_21 * neg_f_0_low60_20_low20_0 + v_20_21 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_21 * neg_f_0_low60_20_low20_0 + s_20_21 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_1 + u_20_21 * (const 64 (2**21)) + v_20_21 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_1 + r_20_21 * (const 64 (2**21)) + s_20_21 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_1,
    neg_f_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_1,
    neg_g_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 21)) <=s delta, delta <=s (const 64 (1 + 2*21)),
    (const 64 (-(2**20))) <=s u_20_21, u_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_21, v_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_21, r_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_21, s_20_21 <=s (const 64 ((2**20)-1)),
    u_20_21 + v_20_21 <=s (const 64 (2**20)),
    u_20_21 - v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 + v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 - v_20_21 <=s (const 64 (2**20)),
    r_20_21 + s_20_21 <=s (const 64 (2**20)),
    r_20_21 - s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 + s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 - s_20_21 <=s (const 64 (2**20)),
    u_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_20_21 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_020_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_1,
sint64 neg_g_0_low60_20_low20_1,
sint64 u_20_20,
sint64 v_20_20,
sint64 r_20_20,
sint64 s_20_20,
sint64 u_20_21,
sint64 v_20_21,
sint64 r_20_21,
sint64 s_20_21,
bit ne
)={
    u_20_20 * neg_f_0_low60_20_low20_0 + v_20_20 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_0 * (-(2**20)),
    r_20_20 * neg_f_0_low60_20_low20_0 + s_20_20 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_0 * (-(2**20))
&&
    u_20_20 * neg_f_0_low60_20_low20_0 + v_20_20 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_0 * (const 64 (-(2**20))),
    r_20_20 * neg_f_0_low60_20_low20_0 + s_20_20 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_0 + u_20_20 * (const 64 (2**21)) + v_20_20 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_0 + r_20_20 * (const 64 (2**21)) + s_20_20 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 20)) <=s delta, delta <=s (const 64 (1 + 2*20)),
    u_20_20 = (const 64 (-(2**20))),
    v_20_20 = (const 64 (0)),
    r_20_20 = (const 64 (0)),
    s_20_20 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise b
assume
neg_g_0_low60_20_low20_0 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_1 neg_f_0_low60_20_low20_0;
mov u_20_21 u_20_20;
mov v_20_21 v_20_20;

add neg_g_0_low60_20_low20_1 neg_g_0_low60_20_low20_0 neg_f_0_low60_20_low20_0;
asr neg_g_0_low60_20_low20_1 neg_g_0_low60_20_low20_1 1;
add r_20_21 r_20_20 u_20_20;
asr r_20_21 r_20_21 1;
add s_20_21 s_20_20 v_20_20;
asr s_20_21 s_20_21 1;
assert
    true
&&
    neg_f_0_low60_20_low20_1 = neg_f_0_low60_20_low20_0,
    u_20_21 = u_20_20,
    v_20_21 = v_20_20,
    neg_g_0_low60_20_low20_1 * (const 64 2) = neg_g_0_low60_20_low20_0 + neg_f_0_low60_20_low20_0,
    r_20_21 * (const 64 2) = r_20_20 + u_20_20,
    s_20_21 * (const 64 2) = s_20_20 + v_20_20
;

assume
    neg_f_0_low60_20_low20_1 = neg_f_0_low60_20_low20_0,
    u_20_21 = u_20_20,
    v_20_21 = v_20_20,
    neg_g_0_low60_20_low20_1 * 2 = neg_g_0_low60_20_low20_0 + neg_f_0_low60_20_low20_0,
    r_20_21 * 2 = r_20_20 + u_20_20,
    s_20_21 * 2 = s_20_20 + v_20_20
&&
    true
;

{
    u_20_21 * neg_f_0_low60_20_low20_0 + v_20_21 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_21 * neg_f_0_low60_20_low20_0 + s_20_21 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_1 + u_20_21 * (const 64 (2**21)) + v_20_21 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_1 + r_20_21 * (const 64 (2**21)) + s_20_21 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_1,
    neg_f_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_1,
    neg_g_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 21)) <=s delta, delta <=s (const 64 (1 + 2*21)),
    (const 64 (-(2**20))) <=s u_20_21, u_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_21, v_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_21, r_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_21, s_20_21 <=s (const 64 ((2**20)-1)),
    u_20_21 + v_20_21 <=s (const 64 (2**20)),
    u_20_21 - v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 + v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 - v_20_21 <=s (const 64 (2**20)),
    r_20_21 + s_20_21 <=s (const 64 (2**20)),
    r_20_21 - s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 + s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 - s_20_21 <=s (const 64 (2**20)),
    u_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_20_21 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_020_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_1,
sint64 neg_g_0_low60_20_low20_1,
sint64 u_20_20,
sint64 v_20_20,
sint64 r_20_20,
sint64 s_20_20,
sint64 u_20_21,
sint64 v_20_21,
sint64 r_20_21,
sint64 s_20_21,
bit ne
)={
    u_20_20 * neg_f_0_low60_20_low20_0 + v_20_20 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_0 * (-(2**20)),
    r_20_20 * neg_f_0_low60_20_low20_0 + s_20_20 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_0 * (-(2**20))
&&
    u_20_20 * neg_f_0_low60_20_low20_0 + v_20_20 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_0 * (const 64 (-(2**20))),
    r_20_20 * neg_f_0_low60_20_low20_0 + s_20_20 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_0 + u_20_20 * (const 64 (2**21)) + v_20_20 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_0 + r_20_20 * (const 64 (2**21)) + s_20_20 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 20)) <=s delta, delta <=s (const 64 (1 + 2*20)),
    u_20_20 = (const 64 (-(2**20))),
    v_20_20 = (const 64 (0)),
    r_20_20 = (const 64 (0)),
    s_20_20 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise c
assume
neg_g_0_low60_20_low20_0 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_1 neg_g_0_low60_20_low20_0;
mov u_20_21 r_20_20;
mov v_20_21 s_20_20;

subs dc neg_g_0_low60_20_low20_1 neg_g_0_low60_20_low20_0 neg_f_0_low60_20_low20_0;
asr neg_g_0_low60_20_low20_1 neg_g_0_low60_20_low20_1 1;
subs dc r_20_21 r_20_20 u_20_20;
asr r_20_21 r_20_21 1;
subs dc s_20_21 s_20_20 v_20_20;
asr s_20_21 s_20_21 1;
assert
    true
&&
    neg_f_0_low60_20_low20_1 = neg_g_0_low60_20_low20_0,
    u_20_21 = r_20_20,
    v_20_21 = s_20_20,
    neg_g_0_low60_20_low20_1 * (const 64 2) = neg_g_0_low60_20_low20_0 - neg_f_0_low60_20_low20_0,
    r_20_21 * (const 64 2) = r_20_20 - u_20_20,
    s_20_21 * (const 64 2) = s_20_20 - v_20_20
;

assume
    neg_f_0_low60_20_low20_1 = neg_g_0_low60_20_low20_0,
    u_20_21 = r_20_20,
    v_20_21 = s_20_20,
    neg_g_0_low60_20_low20_1 * 2 = neg_g_0_low60_20_low20_0 - neg_f_0_low60_20_low20_0,
    r_20_21 * 2 = r_20_20 - u_20_20,
    s_20_21 * 2 = s_20_20 - v_20_20
&&
    true
;

{
    u_20_21 * neg_f_0_low60_20_low20_0 + v_20_21 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_21 * neg_f_0_low60_20_low20_0 + s_20_21 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_1 + u_20_21 * (const 64 (2**21)) + v_20_21 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_1 + r_20_21 * (const 64 (2**21)) + s_20_21 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_1,
    neg_f_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_1,
    neg_g_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 21)) <=s delta, delta <=s (const 64 (1 + 2*21)),
    (const 64 (-(2**20))) <=s u_20_21, u_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_21, v_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_21, r_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_21, s_20_21 <=s (const 64 ((2**20)-1)),
    u_20_21 + v_20_21 <=s (const 64 (2**20)),
    u_20_21 - v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 + v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 - v_20_21 <=s (const 64 (2**20)),
    r_20_21 + s_20_21 <=s (const 64 (2**20)),
    r_20_21 - s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 + s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 - s_20_21 <=s (const 64 (2**20)),
    u_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_20_21 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_021_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_1,
sint64 neg_g_0_low60_20_low20_1,
sint64 neg_f_0_low60_20_low20_2,
sint64 neg_g_0_low60_20_low20_2,
sint64 u_20_21,
sint64 v_20_21,
sint64 r_20_21,
sint64 s_20_21,
sint64 u_20_22,
sint64 v_20_22,
sint64 r_20_22,
sint64 s_20_22,
bit ne
)={
    u_20_21 * neg_f_0_low60_20_low20_0 + v_20_21 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_1 * (-(2**20)),
    r_20_21 * neg_f_0_low60_20_low20_0 + s_20_21 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_1 * (-(2**20))
&&
    u_20_21 * neg_f_0_low60_20_low20_0 + v_20_21 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_1 * (const 64 (-(2**20))),
    r_20_21 * neg_f_0_low60_20_low20_0 + s_20_21 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_1 + u_20_21 * (const 64 (2**21)) + v_20_21 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_1 + r_20_21 * (const 64 (2**21)) + s_20_21 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_1,
    neg_f_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_1,
    neg_g_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 21)) <=s delta, delta <=s (const 64 (1 + 2*21)),
    (const 64 (-(2**20))) <=s u_20_21, u_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_21, v_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_21, r_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_21, s_20_21 <=s (const 64 ((2**20)-1)),
    u_20_21 + v_20_21 <=s (const 64 (2**20)),
    u_20_21 - v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 + v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 - v_20_21 <=s (const 64 (2**20)),
    r_20_21 + s_20_21 <=s (const 64 (2**20)),
    r_20_21 - s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 + s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 - s_20_21 <=s (const 64 (2**20)),
    u_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_20_21 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise a
assume
neg_g_0_low60_20_low20_1 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_2 neg_f_0_low60_20_low20_1;
mov u_20_22 u_20_21;
mov v_20_22 v_20_21;

asr neg_g_0_low60_20_low20_2 neg_g_0_low60_20_low20_1 1;
asr r_20_22 r_20_21 1;
asr s_20_22 s_20_21 1;
assert
    true
&&
    neg_f_0_low60_20_low20_2 = neg_f_0_low60_20_low20_1,
    u_20_22 = u_20_21,
    v_20_22 = v_20_21,
    neg_g_0_low60_20_low20_2 * (const 64 2) = neg_g_0_low60_20_low20_1,
    r_20_22 * (const 64 2) = r_20_21,
    s_20_22 * (const 64 2) = s_20_21
;

assume
    neg_f_0_low60_20_low20_2 = neg_f_0_low60_20_low20_1,
    u_20_22 = u_20_21,
    v_20_22 = v_20_21,
    neg_g_0_low60_20_low20_2 * 2 = neg_g_0_low60_20_low20_1,
    r_20_22 * 2 = r_20_21,
    s_20_22 * 2 = s_20_21
&&
    true
;

{
    u_20_22 * neg_f_0_low60_20_low20_0 + v_20_22 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_22 * neg_f_0_low60_20_low20_0 + s_20_22 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_2 + u_20_22 * (const 64 (2**21)) + v_20_22 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_2 + r_20_22 * (const 64 (2**21)) + s_20_22 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_2,
    neg_f_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_2,
    neg_g_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 22)) <=s delta, delta <=s (const 64 (1 + 2*22)),
    (const 64 (-(2**20))) <=s u_20_22, u_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_22, v_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_22, r_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_22, s_20_22 <=s (const 64 ((2**20)-1)),
    u_20_22 + v_20_22 <=s (const 64 (2**20)),
    u_20_22 - v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 + v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 - v_20_22 <=s (const 64 (2**20)),
    r_20_22 + s_20_22 <=s (const 64 (2**20)),
    r_20_22 - s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 + s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 - s_20_22 <=s (const 64 (2**20)),
    u_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_20_22 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_021_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_1,
sint64 neg_g_0_low60_20_low20_1,
sint64 neg_f_0_low60_20_low20_2,
sint64 neg_g_0_low60_20_low20_2,
sint64 u_20_21,
sint64 v_20_21,
sint64 r_20_21,
sint64 s_20_21,
sint64 u_20_22,
sint64 v_20_22,
sint64 r_20_22,
sint64 s_20_22,
bit ne
)={
    u_20_21 * neg_f_0_low60_20_low20_0 + v_20_21 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_1 * (-(2**20)),
    r_20_21 * neg_f_0_low60_20_low20_0 + s_20_21 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_1 * (-(2**20))
&&
    u_20_21 * neg_f_0_low60_20_low20_0 + v_20_21 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_1 * (const 64 (-(2**20))),
    r_20_21 * neg_f_0_low60_20_low20_0 + s_20_21 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_1 + u_20_21 * (const 64 (2**21)) + v_20_21 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_1 + r_20_21 * (const 64 (2**21)) + s_20_21 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_1,
    neg_f_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_1,
    neg_g_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 21)) <=s delta, delta <=s (const 64 (1 + 2*21)),
    (const 64 (-(2**20))) <=s u_20_21, u_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_21, v_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_21, r_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_21, s_20_21 <=s (const 64 ((2**20)-1)),
    u_20_21 + v_20_21 <=s (const 64 (2**20)),
    u_20_21 - v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 + v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 - v_20_21 <=s (const 64 (2**20)),
    r_20_21 + s_20_21 <=s (const 64 (2**20)),
    r_20_21 - s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 + s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 - s_20_21 <=s (const 64 (2**20)),
    u_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_20_21 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise b
assume
neg_g_0_low60_20_low20_1 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_2 neg_f_0_low60_20_low20_1;
mov u_20_22 u_20_21;
mov v_20_22 v_20_21;

add neg_g_0_low60_20_low20_2 neg_g_0_low60_20_low20_1 neg_f_0_low60_20_low20_1;
asr neg_g_0_low60_20_low20_2 neg_g_0_low60_20_low20_2 1;
add r_20_22 r_20_21 u_20_21;
asr r_20_22 r_20_22 1;
add s_20_22 s_20_21 v_20_21;
asr s_20_22 s_20_22 1;
assert
    true
&&
    neg_f_0_low60_20_low20_2 = neg_f_0_low60_20_low20_1,
    u_20_22 = u_20_21,
    v_20_22 = v_20_21,
    neg_g_0_low60_20_low20_2 * (const 64 2) = neg_g_0_low60_20_low20_1 + neg_f_0_low60_20_low20_1,
    r_20_22 * (const 64 2) = r_20_21 + u_20_21,
    s_20_22 * (const 64 2) = s_20_21 + v_20_21
;

assume
    neg_f_0_low60_20_low20_2 = neg_f_0_low60_20_low20_1,
    u_20_22 = u_20_21,
    v_20_22 = v_20_21,
    neg_g_0_low60_20_low20_2 * 2 = neg_g_0_low60_20_low20_1 + neg_f_0_low60_20_low20_1,
    r_20_22 * 2 = r_20_21 + u_20_21,
    s_20_22 * 2 = s_20_21 + v_20_21
&&
    true
;

{
    u_20_22 * neg_f_0_low60_20_low20_0 + v_20_22 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_22 * neg_f_0_low60_20_low20_0 + s_20_22 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_2 + u_20_22 * (const 64 (2**21)) + v_20_22 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_2 + r_20_22 * (const 64 (2**21)) + s_20_22 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_2,
    neg_f_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_2,
    neg_g_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 22)) <=s delta, delta <=s (const 64 (1 + 2*22)),
    (const 64 (-(2**20))) <=s u_20_22, u_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_22, v_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_22, r_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_22, s_20_22 <=s (const 64 ((2**20)-1)),
    u_20_22 + v_20_22 <=s (const 64 (2**20)),
    u_20_22 - v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 + v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 - v_20_22 <=s (const 64 (2**20)),
    r_20_22 + s_20_22 <=s (const 64 (2**20)),
    r_20_22 - s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 + s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 - s_20_22 <=s (const 64 (2**20)),
    u_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_20_22 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_021_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_1,
sint64 neg_g_0_low60_20_low20_1,
sint64 neg_f_0_low60_20_low20_2,
sint64 neg_g_0_low60_20_low20_2,
sint64 u_20_21,
sint64 v_20_21,
sint64 r_20_21,
sint64 s_20_21,
sint64 u_20_22,
sint64 v_20_22,
sint64 r_20_22,
sint64 s_20_22,
bit ne
)={
    u_20_21 * neg_f_0_low60_20_low20_0 + v_20_21 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_1 * (-(2**20)),
    r_20_21 * neg_f_0_low60_20_low20_0 + s_20_21 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_1 * (-(2**20))
&&
    u_20_21 * neg_f_0_low60_20_low20_0 + v_20_21 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_1 * (const 64 (-(2**20))),
    r_20_21 * neg_f_0_low60_20_low20_0 + s_20_21 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_1 + u_20_21 * (const 64 (2**21)) + v_20_21 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_1 + r_20_21 * (const 64 (2**21)) + s_20_21 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_1,
    neg_f_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_1,
    neg_g_0_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 21)) <=s delta, delta <=s (const 64 (1 + 2*21)),
    (const 64 (-(2**20))) <=s u_20_21, u_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_21, v_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_21, r_20_21 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_21, s_20_21 <=s (const 64 ((2**20)-1)),
    u_20_21 + v_20_21 <=s (const 64 (2**20)),
    u_20_21 - v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 + v_20_21 <=s (const 64 (2**20)),
    (const 64 0) - u_20_21 - v_20_21 <=s (const 64 (2**20)),
    r_20_21 + s_20_21 <=s (const 64 (2**20)),
    r_20_21 - s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 + s_20_21 <=s (const 64 (2**20)),
    (const 64 0) - r_20_21 - s_20_21 <=s (const 64 (2**20)),
    u_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_20_21 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_20_21 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise c
assume
neg_g_0_low60_20_low20_1 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_2 neg_g_0_low60_20_low20_1;
mov u_20_22 r_20_21;
mov v_20_22 s_20_21;

subs dc neg_g_0_low60_20_low20_2 neg_g_0_low60_20_low20_1 neg_f_0_low60_20_low20_1;
asr neg_g_0_low60_20_low20_2 neg_g_0_low60_20_low20_2 1;
subs dc r_20_22 r_20_21 u_20_21;
asr r_20_22 r_20_22 1;
subs dc s_20_22 s_20_21 v_20_21;
asr s_20_22 s_20_22 1;
assert
    true
&&
    neg_f_0_low60_20_low20_2 = neg_g_0_low60_20_low20_1,
    u_20_22 = r_20_21,
    v_20_22 = s_20_21,
    neg_g_0_low60_20_low20_2 * (const 64 2) = neg_g_0_low60_20_low20_1 - neg_f_0_low60_20_low20_1,
    r_20_22 * (const 64 2) = r_20_21 - u_20_21,
    s_20_22 * (const 64 2) = s_20_21 - v_20_21
;

assume
    neg_f_0_low60_20_low20_2 = neg_g_0_low60_20_low20_1,
    u_20_22 = r_20_21,
    v_20_22 = s_20_21,
    neg_g_0_low60_20_low20_2 * 2 = neg_g_0_low60_20_low20_1 - neg_f_0_low60_20_low20_1,
    r_20_22 * 2 = r_20_21 - u_20_21,
    s_20_22 * 2 = s_20_21 - v_20_21
&&
    true
;

{
    u_20_22 * neg_f_0_low60_20_low20_0 + v_20_22 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_22 * neg_f_0_low60_20_low20_0 + s_20_22 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_2 + u_20_22 * (const 64 (2**21)) + v_20_22 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_2 + r_20_22 * (const 64 (2**21)) + s_20_22 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_2,
    neg_f_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_2,
    neg_g_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 22)) <=s delta, delta <=s (const 64 (1 + 2*22)),
    (const 64 (-(2**20))) <=s u_20_22, u_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_22, v_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_22, r_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_22, s_20_22 <=s (const 64 ((2**20)-1)),
    u_20_22 + v_20_22 <=s (const 64 (2**20)),
    u_20_22 - v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 + v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 - v_20_22 <=s (const 64 (2**20)),
    r_20_22 + s_20_22 <=s (const 64 (2**20)),
    r_20_22 - s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 + s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 - s_20_22 <=s (const 64 (2**20)),
    u_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_20_22 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_022_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_2,
sint64 neg_g_0_low60_20_low20_2,
sint64 neg_f_0_low60_20_low20_3,
sint64 neg_g_0_low60_20_low20_3,
sint64 u_20_22,
sint64 v_20_22,
sint64 r_20_22,
sint64 s_20_22,
sint64 u_20_23,
sint64 v_20_23,
sint64 r_20_23,
sint64 s_20_23,
bit ne
)={
    u_20_22 * neg_f_0_low60_20_low20_0 + v_20_22 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_2 * (-(2**20)),
    r_20_22 * neg_f_0_low60_20_low20_0 + s_20_22 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_2 * (-(2**20))
&&
    u_20_22 * neg_f_0_low60_20_low20_0 + v_20_22 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_2 * (const 64 (-(2**20))),
    r_20_22 * neg_f_0_low60_20_low20_0 + s_20_22 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_2 + u_20_22 * (const 64 (2**21)) + v_20_22 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_2 + r_20_22 * (const 64 (2**21)) + s_20_22 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_2,
    neg_f_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_2,
    neg_g_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 22)) <=s delta, delta <=s (const 64 (1 + 2*22)),
    (const 64 (-(2**20))) <=s u_20_22, u_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_22, v_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_22, r_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_22, s_20_22 <=s (const 64 ((2**20)-1)),
    u_20_22 + v_20_22 <=s (const 64 (2**20)),
    u_20_22 - v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 + v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 - v_20_22 <=s (const 64 (2**20)),
    r_20_22 + s_20_22 <=s (const 64 (2**20)),
    r_20_22 - s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 + s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 - s_20_22 <=s (const 64 (2**20)),
    u_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_20_22 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise a
assume
neg_g_0_low60_20_low20_2 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_3 neg_f_0_low60_20_low20_2;
mov u_20_23 u_20_22;
mov v_20_23 v_20_22;

asr neg_g_0_low60_20_low20_3 neg_g_0_low60_20_low20_2 1;
asr r_20_23 r_20_22 1;
asr s_20_23 s_20_22 1;
assert
    true
&&
    neg_f_0_low60_20_low20_3 = neg_f_0_low60_20_low20_2,
    u_20_23 = u_20_22,
    v_20_23 = v_20_22,
    neg_g_0_low60_20_low20_3 * (const 64 2) = neg_g_0_low60_20_low20_2,
    r_20_23 * (const 64 2) = r_20_22,
    s_20_23 * (const 64 2) = s_20_22
;

assume
    neg_f_0_low60_20_low20_3 = neg_f_0_low60_20_low20_2,
    u_20_23 = u_20_22,
    v_20_23 = v_20_22,
    neg_g_0_low60_20_low20_3 * 2 = neg_g_0_low60_20_low20_2,
    r_20_23 * 2 = r_20_22,
    s_20_23 * 2 = s_20_22
&&
    true
;

{
    u_20_23 * neg_f_0_low60_20_low20_0 + v_20_23 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_23 * neg_f_0_low60_20_low20_0 + s_20_23 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_3 + u_20_23 * (const 64 (2**21)) + v_20_23 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_3 + r_20_23 * (const 64 (2**21)) + s_20_23 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_3,
    neg_f_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_3,
    neg_g_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 23)) <=s delta, delta <=s (const 64 (1 + 2*23)),
    (const 64 (-(2**20))) <=s u_20_23, u_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_23, v_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_23, r_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_23, s_20_23 <=s (const 64 ((2**20)-1)),
    u_20_23 + v_20_23 <=s (const 64 (2**20)),
    u_20_23 - v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 + v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 - v_20_23 <=s (const 64 (2**20)),
    r_20_23 + s_20_23 <=s (const 64 (2**20)),
    r_20_23 - s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 + s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 - s_20_23 <=s (const 64 (2**20)),
    u_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_20_23 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_022_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_2,
sint64 neg_g_0_low60_20_low20_2,
sint64 neg_f_0_low60_20_low20_3,
sint64 neg_g_0_low60_20_low20_3,
sint64 u_20_22,
sint64 v_20_22,
sint64 r_20_22,
sint64 s_20_22,
sint64 u_20_23,
sint64 v_20_23,
sint64 r_20_23,
sint64 s_20_23,
bit ne
)={
    u_20_22 * neg_f_0_low60_20_low20_0 + v_20_22 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_2 * (-(2**20)),
    r_20_22 * neg_f_0_low60_20_low20_0 + s_20_22 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_2 * (-(2**20))
&&
    u_20_22 * neg_f_0_low60_20_low20_0 + v_20_22 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_2 * (const 64 (-(2**20))),
    r_20_22 * neg_f_0_low60_20_low20_0 + s_20_22 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_2 + u_20_22 * (const 64 (2**21)) + v_20_22 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_2 + r_20_22 * (const 64 (2**21)) + s_20_22 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_2,
    neg_f_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_2,
    neg_g_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 22)) <=s delta, delta <=s (const 64 (1 + 2*22)),
    (const 64 (-(2**20))) <=s u_20_22, u_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_22, v_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_22, r_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_22, s_20_22 <=s (const 64 ((2**20)-1)),
    u_20_22 + v_20_22 <=s (const 64 (2**20)),
    u_20_22 - v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 + v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 - v_20_22 <=s (const 64 (2**20)),
    r_20_22 + s_20_22 <=s (const 64 (2**20)),
    r_20_22 - s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 + s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 - s_20_22 <=s (const 64 (2**20)),
    u_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_20_22 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise b
assume
neg_g_0_low60_20_low20_2 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_3 neg_f_0_low60_20_low20_2;
mov u_20_23 u_20_22;
mov v_20_23 v_20_22;

add neg_g_0_low60_20_low20_3 neg_g_0_low60_20_low20_2 neg_f_0_low60_20_low20_2;
asr neg_g_0_low60_20_low20_3 neg_g_0_low60_20_low20_3 1;
add r_20_23 r_20_22 u_20_22;
asr r_20_23 r_20_23 1;
add s_20_23 s_20_22 v_20_22;
asr s_20_23 s_20_23 1;
assert
    true
&&
    neg_f_0_low60_20_low20_3 = neg_f_0_low60_20_low20_2,
    u_20_23 = u_20_22,
    v_20_23 = v_20_22,
    neg_g_0_low60_20_low20_3 * (const 64 2) = neg_g_0_low60_20_low20_2 + neg_f_0_low60_20_low20_2,
    r_20_23 * (const 64 2) = r_20_22 + u_20_22,
    s_20_23 * (const 64 2) = s_20_22 + v_20_22
;

assume
    neg_f_0_low60_20_low20_3 = neg_f_0_low60_20_low20_2,
    u_20_23 = u_20_22,
    v_20_23 = v_20_22,
    neg_g_0_low60_20_low20_3 * 2 = neg_g_0_low60_20_low20_2 + neg_f_0_low60_20_low20_2,
    r_20_23 * 2 = r_20_22 + u_20_22,
    s_20_23 * 2 = s_20_22 + v_20_22
&&
    true
;

{
    u_20_23 * neg_f_0_low60_20_low20_0 + v_20_23 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_23 * neg_f_0_low60_20_low20_0 + s_20_23 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_3 + u_20_23 * (const 64 (2**21)) + v_20_23 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_3 + r_20_23 * (const 64 (2**21)) + s_20_23 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_3,
    neg_f_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_3,
    neg_g_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 23)) <=s delta, delta <=s (const 64 (1 + 2*23)),
    (const 64 (-(2**20))) <=s u_20_23, u_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_23, v_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_23, r_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_23, s_20_23 <=s (const 64 ((2**20)-1)),
    u_20_23 + v_20_23 <=s (const 64 (2**20)),
    u_20_23 - v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 + v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 - v_20_23 <=s (const 64 (2**20)),
    r_20_23 + s_20_23 <=s (const 64 (2**20)),
    r_20_23 - s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 + s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 - s_20_23 <=s (const 64 (2**20)),
    u_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_20_23 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_022_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_2,
sint64 neg_g_0_low60_20_low20_2,
sint64 neg_f_0_low60_20_low20_3,
sint64 neg_g_0_low60_20_low20_3,
sint64 u_20_22,
sint64 v_20_22,
sint64 r_20_22,
sint64 s_20_22,
sint64 u_20_23,
sint64 v_20_23,
sint64 r_20_23,
sint64 s_20_23,
bit ne
)={
    u_20_22 * neg_f_0_low60_20_low20_0 + v_20_22 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_2 * (-(2**20)),
    r_20_22 * neg_f_0_low60_20_low20_0 + s_20_22 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_2 * (-(2**20))
&&
    u_20_22 * neg_f_0_low60_20_low20_0 + v_20_22 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_2 * (const 64 (-(2**20))),
    r_20_22 * neg_f_0_low60_20_low20_0 + s_20_22 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_2 + u_20_22 * (const 64 (2**21)) + v_20_22 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_2 + r_20_22 * (const 64 (2**21)) + s_20_22 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_2,
    neg_f_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_2,
    neg_g_0_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 22)) <=s delta, delta <=s (const 64 (1 + 2*22)),
    (const 64 (-(2**20))) <=s u_20_22, u_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_22, v_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_22, r_20_22 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_22, s_20_22 <=s (const 64 ((2**20)-1)),
    u_20_22 + v_20_22 <=s (const 64 (2**20)),
    u_20_22 - v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 + v_20_22 <=s (const 64 (2**20)),
    (const 64 0) - u_20_22 - v_20_22 <=s (const 64 (2**20)),
    r_20_22 + s_20_22 <=s (const 64 (2**20)),
    r_20_22 - s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 + s_20_22 <=s (const 64 (2**20)),
    (const 64 0) - r_20_22 - s_20_22 <=s (const 64 (2**20)),
    u_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_20_22 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_20_22 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise c
assume
neg_g_0_low60_20_low20_2 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_3 neg_g_0_low60_20_low20_2;
mov u_20_23 r_20_22;
mov v_20_23 s_20_22;

subs dc neg_g_0_low60_20_low20_3 neg_g_0_low60_20_low20_2 neg_f_0_low60_20_low20_2;
asr neg_g_0_low60_20_low20_3 neg_g_0_low60_20_low20_3 1;
subs dc r_20_23 r_20_22 u_20_22;
asr r_20_23 r_20_23 1;
subs dc s_20_23 s_20_22 v_20_22;
asr s_20_23 s_20_23 1;
assert
    true
&&
    neg_f_0_low60_20_low20_3 = neg_g_0_low60_20_low20_2,
    u_20_23 = r_20_22,
    v_20_23 = s_20_22,
    neg_g_0_low60_20_low20_3 * (const 64 2) = neg_g_0_low60_20_low20_2 - neg_f_0_low60_20_low20_2,
    r_20_23 * (const 64 2) = r_20_22 - u_20_22,
    s_20_23 * (const 64 2) = s_20_22 - v_20_22
;

assume
    neg_f_0_low60_20_low20_3 = neg_g_0_low60_20_low20_2,
    u_20_23 = r_20_22,
    v_20_23 = s_20_22,
    neg_g_0_low60_20_low20_3 * 2 = neg_g_0_low60_20_low20_2 - neg_f_0_low60_20_low20_2,
    r_20_23 * 2 = r_20_22 - u_20_22,
    s_20_23 * 2 = s_20_22 - v_20_22
&&
    true
;

{
    u_20_23 * neg_f_0_low60_20_low20_0 + v_20_23 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_23 * neg_f_0_low60_20_low20_0 + s_20_23 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_3 + u_20_23 * (const 64 (2**21)) + v_20_23 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_3 + r_20_23 * (const 64 (2**21)) + s_20_23 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_3,
    neg_f_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_3,
    neg_g_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 23)) <=s delta, delta <=s (const 64 (1 + 2*23)),
    (const 64 (-(2**20))) <=s u_20_23, u_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_23, v_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_23, r_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_23, s_20_23 <=s (const 64 ((2**20)-1)),
    u_20_23 + v_20_23 <=s (const 64 (2**20)),
    u_20_23 - v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 + v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 - v_20_23 <=s (const 64 (2**20)),
    r_20_23 + s_20_23 <=s (const 64 (2**20)),
    r_20_23 - s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 + s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 - s_20_23 <=s (const 64 (2**20)),
    u_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_20_23 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_023_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_3,
sint64 neg_g_0_low60_20_low20_3,
sint64 neg_f_0_low60_20_low20_4,
sint64 neg_g_0_low60_20_low20_4,
sint64 u_20_23,
sint64 v_20_23,
sint64 r_20_23,
sint64 s_20_23,
sint64 u_20_24,
sint64 v_20_24,
sint64 r_20_24,
sint64 s_20_24,
bit ne
)={
    u_20_23 * neg_f_0_low60_20_low20_0 + v_20_23 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_3 * (-(2**20)),
    r_20_23 * neg_f_0_low60_20_low20_0 + s_20_23 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_3 * (-(2**20))
&&
    u_20_23 * neg_f_0_low60_20_low20_0 + v_20_23 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_3 * (const 64 (-(2**20))),
    r_20_23 * neg_f_0_low60_20_low20_0 + s_20_23 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_3 + u_20_23 * (const 64 (2**21)) + v_20_23 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_3 + r_20_23 * (const 64 (2**21)) + s_20_23 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_3,
    neg_f_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_3,
    neg_g_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 23)) <=s delta, delta <=s (const 64 (1 + 2*23)),
    (const 64 (-(2**20))) <=s u_20_23, u_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_23, v_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_23, r_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_23, s_20_23 <=s (const 64 ((2**20)-1)),
    u_20_23 + v_20_23 <=s (const 64 (2**20)),
    u_20_23 - v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 + v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 - v_20_23 <=s (const 64 (2**20)),
    r_20_23 + s_20_23 <=s (const 64 (2**20)),
    r_20_23 - s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 + s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 - s_20_23 <=s (const 64 (2**20)),
    u_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_20_23 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise a
assume
neg_g_0_low60_20_low20_3 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_4 neg_f_0_low60_20_low20_3;
mov u_20_24 u_20_23;
mov v_20_24 v_20_23;

asr neg_g_0_low60_20_low20_4 neg_g_0_low60_20_low20_3 1;
asr r_20_24 r_20_23 1;
asr s_20_24 s_20_23 1;
assert
    true
&&
    neg_f_0_low60_20_low20_4 = neg_f_0_low60_20_low20_3,
    u_20_24 = u_20_23,
    v_20_24 = v_20_23,
    neg_g_0_low60_20_low20_4 * (const 64 2) = neg_g_0_low60_20_low20_3,
    r_20_24 * (const 64 2) = r_20_23,
    s_20_24 * (const 64 2) = s_20_23
;

assume
    neg_f_0_low60_20_low20_4 = neg_f_0_low60_20_low20_3,
    u_20_24 = u_20_23,
    v_20_24 = v_20_23,
    neg_g_0_low60_20_low20_4 * 2 = neg_g_0_low60_20_low20_3,
    r_20_24 * 2 = r_20_23,
    s_20_24 * 2 = s_20_23
&&
    true
;

{
    u_20_24 * neg_f_0_low60_20_low20_0 + v_20_24 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_24 * neg_f_0_low60_20_low20_0 + s_20_24 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_4 + u_20_24 * (const 64 (2**21)) + v_20_24 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_4 + r_20_24 * (const 64 (2**21)) + s_20_24 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_4,
    neg_f_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_4,
    neg_g_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 24)) <=s delta, delta <=s (const 64 (1 + 2*24)),
    (const 64 (-(2**20))) <=s u_20_24, u_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_24, v_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_24, r_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_24, s_20_24 <=s (const 64 ((2**20)-1)),
    u_20_24 + v_20_24 <=s (const 64 (2**20)),
    u_20_24 - v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 + v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 - v_20_24 <=s (const 64 (2**20)),
    r_20_24 + s_20_24 <=s (const 64 (2**20)),
    r_20_24 - s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 + s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 - s_20_24 <=s (const 64 (2**20)),
    u_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_20_24 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_023_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_3,
sint64 neg_g_0_low60_20_low20_3,
sint64 neg_f_0_low60_20_low20_4,
sint64 neg_g_0_low60_20_low20_4,
sint64 u_20_23,
sint64 v_20_23,
sint64 r_20_23,
sint64 s_20_23,
sint64 u_20_24,
sint64 v_20_24,
sint64 r_20_24,
sint64 s_20_24,
bit ne
)={
    u_20_23 * neg_f_0_low60_20_low20_0 + v_20_23 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_3 * (-(2**20)),
    r_20_23 * neg_f_0_low60_20_low20_0 + s_20_23 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_3 * (-(2**20))
&&
    u_20_23 * neg_f_0_low60_20_low20_0 + v_20_23 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_3 * (const 64 (-(2**20))),
    r_20_23 * neg_f_0_low60_20_low20_0 + s_20_23 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_3 + u_20_23 * (const 64 (2**21)) + v_20_23 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_3 + r_20_23 * (const 64 (2**21)) + s_20_23 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_3,
    neg_f_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_3,
    neg_g_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 23)) <=s delta, delta <=s (const 64 (1 + 2*23)),
    (const 64 (-(2**20))) <=s u_20_23, u_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_23, v_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_23, r_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_23, s_20_23 <=s (const 64 ((2**20)-1)),
    u_20_23 + v_20_23 <=s (const 64 (2**20)),
    u_20_23 - v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 + v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 - v_20_23 <=s (const 64 (2**20)),
    r_20_23 + s_20_23 <=s (const 64 (2**20)),
    r_20_23 - s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 + s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 - s_20_23 <=s (const 64 (2**20)),
    u_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_20_23 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise b
assume
neg_g_0_low60_20_low20_3 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_4 neg_f_0_low60_20_low20_3;
mov u_20_24 u_20_23;
mov v_20_24 v_20_23;

add neg_g_0_low60_20_low20_4 neg_g_0_low60_20_low20_3 neg_f_0_low60_20_low20_3;
asr neg_g_0_low60_20_low20_4 neg_g_0_low60_20_low20_4 1;
add r_20_24 r_20_23 u_20_23;
asr r_20_24 r_20_24 1;
add s_20_24 s_20_23 v_20_23;
asr s_20_24 s_20_24 1;
assert
    true
&&
    neg_f_0_low60_20_low20_4 = neg_f_0_low60_20_low20_3,
    u_20_24 = u_20_23,
    v_20_24 = v_20_23,
    neg_g_0_low60_20_low20_4 * (const 64 2) = neg_g_0_low60_20_low20_3 + neg_f_0_low60_20_low20_3,
    r_20_24 * (const 64 2) = r_20_23 + u_20_23,
    s_20_24 * (const 64 2) = s_20_23 + v_20_23
;

assume
    neg_f_0_low60_20_low20_4 = neg_f_0_low60_20_low20_3,
    u_20_24 = u_20_23,
    v_20_24 = v_20_23,
    neg_g_0_low60_20_low20_4 * 2 = neg_g_0_low60_20_low20_3 + neg_f_0_low60_20_low20_3,
    r_20_24 * 2 = r_20_23 + u_20_23,
    s_20_24 * 2 = s_20_23 + v_20_23
&&
    true
;

{
    u_20_24 * neg_f_0_low60_20_low20_0 + v_20_24 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_24 * neg_f_0_low60_20_low20_0 + s_20_24 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_4 + u_20_24 * (const 64 (2**21)) + v_20_24 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_4 + r_20_24 * (const 64 (2**21)) + s_20_24 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_4,
    neg_f_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_4,
    neg_g_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 24)) <=s delta, delta <=s (const 64 (1 + 2*24)),
    (const 64 (-(2**20))) <=s u_20_24, u_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_24, v_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_24, r_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_24, s_20_24 <=s (const 64 ((2**20)-1)),
    u_20_24 + v_20_24 <=s (const 64 (2**20)),
    u_20_24 - v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 + v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 - v_20_24 <=s (const 64 (2**20)),
    r_20_24 + s_20_24 <=s (const 64 (2**20)),
    r_20_24 - s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 + s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 - s_20_24 <=s (const 64 (2**20)),
    u_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_20_24 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_023_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_3,
sint64 neg_g_0_low60_20_low20_3,
sint64 neg_f_0_low60_20_low20_4,
sint64 neg_g_0_low60_20_low20_4,
sint64 u_20_23,
sint64 v_20_23,
sint64 r_20_23,
sint64 s_20_23,
sint64 u_20_24,
sint64 v_20_24,
sint64 r_20_24,
sint64 s_20_24,
bit ne
)={
    u_20_23 * neg_f_0_low60_20_low20_0 + v_20_23 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_3 * (-(2**20)),
    r_20_23 * neg_f_0_low60_20_low20_0 + s_20_23 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_3 * (-(2**20))
&&
    u_20_23 * neg_f_0_low60_20_low20_0 + v_20_23 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_3 * (const 64 (-(2**20))),
    r_20_23 * neg_f_0_low60_20_low20_0 + s_20_23 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_3 + u_20_23 * (const 64 (2**21)) + v_20_23 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_3 + r_20_23 * (const 64 (2**21)) + s_20_23 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_3,
    neg_f_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_3,
    neg_g_0_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 23)) <=s delta, delta <=s (const 64 (1 + 2*23)),
    (const 64 (-(2**20))) <=s u_20_23, u_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_23, v_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_23, r_20_23 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_23, s_20_23 <=s (const 64 ((2**20)-1)),
    u_20_23 + v_20_23 <=s (const 64 (2**20)),
    u_20_23 - v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 + v_20_23 <=s (const 64 (2**20)),
    (const 64 0) - u_20_23 - v_20_23 <=s (const 64 (2**20)),
    r_20_23 + s_20_23 <=s (const 64 (2**20)),
    r_20_23 - s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 + s_20_23 <=s (const 64 (2**20)),
    (const 64 0) - r_20_23 - s_20_23 <=s (const 64 (2**20)),
    u_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_20_23 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_20_23 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise c
assume
neg_g_0_low60_20_low20_3 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_4 neg_g_0_low60_20_low20_3;
mov u_20_24 r_20_23;
mov v_20_24 s_20_23;

subs dc neg_g_0_low60_20_low20_4 neg_g_0_low60_20_low20_3 neg_f_0_low60_20_low20_3;
asr neg_g_0_low60_20_low20_4 neg_g_0_low60_20_low20_4 1;
subs dc r_20_24 r_20_23 u_20_23;
asr r_20_24 r_20_24 1;
subs dc s_20_24 s_20_23 v_20_23;
asr s_20_24 s_20_24 1;
assert
    true
&&
    neg_f_0_low60_20_low20_4 = neg_g_0_low60_20_low20_3,
    u_20_24 = r_20_23,
    v_20_24 = s_20_23,
    neg_g_0_low60_20_low20_4 * (const 64 2) = neg_g_0_low60_20_low20_3 - neg_f_0_low60_20_low20_3,
    r_20_24 * (const 64 2) = r_20_23 - u_20_23,
    s_20_24 * (const 64 2) = s_20_23 - v_20_23
;

assume
    neg_f_0_low60_20_low20_4 = neg_g_0_low60_20_low20_3,
    u_20_24 = r_20_23,
    v_20_24 = s_20_23,
    neg_g_0_low60_20_low20_4 * 2 = neg_g_0_low60_20_low20_3 - neg_f_0_low60_20_low20_3,
    r_20_24 * 2 = r_20_23 - u_20_23,
    s_20_24 * 2 = s_20_23 - v_20_23
&&
    true
;

{
    u_20_24 * neg_f_0_low60_20_low20_0 + v_20_24 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_24 * neg_f_0_low60_20_low20_0 + s_20_24 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_4 + u_20_24 * (const 64 (2**21)) + v_20_24 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_4 + r_20_24 * (const 64 (2**21)) + s_20_24 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_4,
    neg_f_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_4,
    neg_g_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 24)) <=s delta, delta <=s (const 64 (1 + 2*24)),
    (const 64 (-(2**20))) <=s u_20_24, u_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_24, v_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_24, r_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_24, s_20_24 <=s (const 64 ((2**20)-1)),
    u_20_24 + v_20_24 <=s (const 64 (2**20)),
    u_20_24 - v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 + v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 - v_20_24 <=s (const 64 (2**20)),
    r_20_24 + s_20_24 <=s (const 64 (2**20)),
    r_20_24 - s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 + s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 - s_20_24 <=s (const 64 (2**20)),
    u_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_20_24 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_024_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_4,
sint64 neg_g_0_low60_20_low20_4,
sint64 neg_f_0_low60_20_low20_5,
sint64 neg_g_0_low60_20_low20_5,
sint64 u_20_24,
sint64 v_20_24,
sint64 r_20_24,
sint64 s_20_24,
sint64 u_20_25,
sint64 v_20_25,
sint64 r_20_25,
sint64 s_20_25,
bit ne
)={
    u_20_24 * neg_f_0_low60_20_low20_0 + v_20_24 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_4 * (-(2**20)),
    r_20_24 * neg_f_0_low60_20_low20_0 + s_20_24 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_4 * (-(2**20))
&&
    u_20_24 * neg_f_0_low60_20_low20_0 + v_20_24 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_4 * (const 64 (-(2**20))),
    r_20_24 * neg_f_0_low60_20_low20_0 + s_20_24 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_4 + u_20_24 * (const 64 (2**21)) + v_20_24 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_4 + r_20_24 * (const 64 (2**21)) + s_20_24 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_4,
    neg_f_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_4,
    neg_g_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 24)) <=s delta, delta <=s (const 64 (1 + 2*24)),
    (const 64 (-(2**20))) <=s u_20_24, u_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_24, v_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_24, r_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_24, s_20_24 <=s (const 64 ((2**20)-1)),
    u_20_24 + v_20_24 <=s (const 64 (2**20)),
    u_20_24 - v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 + v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 - v_20_24 <=s (const 64 (2**20)),
    r_20_24 + s_20_24 <=s (const 64 (2**20)),
    r_20_24 - s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 + s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 - s_20_24 <=s (const 64 (2**20)),
    u_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_20_24 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise a
assume
neg_g_0_low60_20_low20_4 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_5 neg_f_0_low60_20_low20_4;
mov u_20_25 u_20_24;
mov v_20_25 v_20_24;

asr neg_g_0_low60_20_low20_5 neg_g_0_low60_20_low20_4 1;
asr r_20_25 r_20_24 1;
asr s_20_25 s_20_24 1;
assert
    true
&&
    neg_f_0_low60_20_low20_5 = neg_f_0_low60_20_low20_4,
    u_20_25 = u_20_24,
    v_20_25 = v_20_24,
    neg_g_0_low60_20_low20_5 * (const 64 2) = neg_g_0_low60_20_low20_4,
    r_20_25 * (const 64 2) = r_20_24,
    s_20_25 * (const 64 2) = s_20_24
;

assume
    neg_f_0_low60_20_low20_5 = neg_f_0_low60_20_low20_4,
    u_20_25 = u_20_24,
    v_20_25 = v_20_24,
    neg_g_0_low60_20_low20_5 * 2 = neg_g_0_low60_20_low20_4,
    r_20_25 * 2 = r_20_24,
    s_20_25 * 2 = s_20_24
&&
    true
;

{
    u_20_25 * neg_f_0_low60_20_low20_0 + v_20_25 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_25 * neg_f_0_low60_20_low20_0 + s_20_25 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_5 + u_20_25 * (const 64 (2**21)) + v_20_25 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_5 + r_20_25 * (const 64 (2**21)) + s_20_25 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_5,
    neg_f_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_5,
    neg_g_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 25)) <=s delta, delta <=s (const 64 (1 + 2*25)),
    (const 64 (-(2**20))) <=s u_20_25, u_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_25, v_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_25, r_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_25, s_20_25 <=s (const 64 ((2**20)-1)),
    u_20_25 + v_20_25 <=s (const 64 (2**20)),
    u_20_25 - v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 + v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 - v_20_25 <=s (const 64 (2**20)),
    r_20_25 + s_20_25 <=s (const 64 (2**20)),
    r_20_25 - s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 + s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 - s_20_25 <=s (const 64 (2**20)),
    u_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_20_25 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_024_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_4,
sint64 neg_g_0_low60_20_low20_4,
sint64 neg_f_0_low60_20_low20_5,
sint64 neg_g_0_low60_20_low20_5,
sint64 u_20_24,
sint64 v_20_24,
sint64 r_20_24,
sint64 s_20_24,
sint64 u_20_25,
sint64 v_20_25,
sint64 r_20_25,
sint64 s_20_25,
bit ne
)={
    u_20_24 * neg_f_0_low60_20_low20_0 + v_20_24 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_4 * (-(2**20)),
    r_20_24 * neg_f_0_low60_20_low20_0 + s_20_24 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_4 * (-(2**20))
&&
    u_20_24 * neg_f_0_low60_20_low20_0 + v_20_24 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_4 * (const 64 (-(2**20))),
    r_20_24 * neg_f_0_low60_20_low20_0 + s_20_24 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_4 + u_20_24 * (const 64 (2**21)) + v_20_24 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_4 + r_20_24 * (const 64 (2**21)) + s_20_24 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_4,
    neg_f_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_4,
    neg_g_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 24)) <=s delta, delta <=s (const 64 (1 + 2*24)),
    (const 64 (-(2**20))) <=s u_20_24, u_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_24, v_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_24, r_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_24, s_20_24 <=s (const 64 ((2**20)-1)),
    u_20_24 + v_20_24 <=s (const 64 (2**20)),
    u_20_24 - v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 + v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 - v_20_24 <=s (const 64 (2**20)),
    r_20_24 + s_20_24 <=s (const 64 (2**20)),
    r_20_24 - s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 + s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 - s_20_24 <=s (const 64 (2**20)),
    u_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_20_24 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise b
assume
neg_g_0_low60_20_low20_4 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_5 neg_f_0_low60_20_low20_4;
mov u_20_25 u_20_24;
mov v_20_25 v_20_24;

add neg_g_0_low60_20_low20_5 neg_g_0_low60_20_low20_4 neg_f_0_low60_20_low20_4;
asr neg_g_0_low60_20_low20_5 neg_g_0_low60_20_low20_5 1;
add r_20_25 r_20_24 u_20_24;
asr r_20_25 r_20_25 1;
add s_20_25 s_20_24 v_20_24;
asr s_20_25 s_20_25 1;
assert
    true
&&
    neg_f_0_low60_20_low20_5 = neg_f_0_low60_20_low20_4,
    u_20_25 = u_20_24,
    v_20_25 = v_20_24,
    neg_g_0_low60_20_low20_5 * (const 64 2) = neg_g_0_low60_20_low20_4 + neg_f_0_low60_20_low20_4,
    r_20_25 * (const 64 2) = r_20_24 + u_20_24,
    s_20_25 * (const 64 2) = s_20_24 + v_20_24
;

assume
    neg_f_0_low60_20_low20_5 = neg_f_0_low60_20_low20_4,
    u_20_25 = u_20_24,
    v_20_25 = v_20_24,
    neg_g_0_low60_20_low20_5 * 2 = neg_g_0_low60_20_low20_4 + neg_f_0_low60_20_low20_4,
    r_20_25 * 2 = r_20_24 + u_20_24,
    s_20_25 * 2 = s_20_24 + v_20_24
&&
    true
;

{
    u_20_25 * neg_f_0_low60_20_low20_0 + v_20_25 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_25 * neg_f_0_low60_20_low20_0 + s_20_25 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_5 + u_20_25 * (const 64 (2**21)) + v_20_25 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_5 + r_20_25 * (const 64 (2**21)) + s_20_25 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_5,
    neg_f_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_5,
    neg_g_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 25)) <=s delta, delta <=s (const 64 (1 + 2*25)),
    (const 64 (-(2**20))) <=s u_20_25, u_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_25, v_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_25, r_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_25, s_20_25 <=s (const 64 ((2**20)-1)),
    u_20_25 + v_20_25 <=s (const 64 (2**20)),
    u_20_25 - v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 + v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 - v_20_25 <=s (const 64 (2**20)),
    r_20_25 + s_20_25 <=s (const 64 (2**20)),
    r_20_25 - s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 + s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 - s_20_25 <=s (const 64 (2**20)),
    u_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_20_25 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_024_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_4,
sint64 neg_g_0_low60_20_low20_4,
sint64 neg_f_0_low60_20_low20_5,
sint64 neg_g_0_low60_20_low20_5,
sint64 u_20_24,
sint64 v_20_24,
sint64 r_20_24,
sint64 s_20_24,
sint64 u_20_25,
sint64 v_20_25,
sint64 r_20_25,
sint64 s_20_25,
bit ne
)={
    u_20_24 * neg_f_0_low60_20_low20_0 + v_20_24 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_4 * (-(2**20)),
    r_20_24 * neg_f_0_low60_20_low20_0 + s_20_24 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_4 * (-(2**20))
&&
    u_20_24 * neg_f_0_low60_20_low20_0 + v_20_24 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_4 * (const 64 (-(2**20))),
    r_20_24 * neg_f_0_low60_20_low20_0 + s_20_24 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_4 + u_20_24 * (const 64 (2**21)) + v_20_24 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_4 + r_20_24 * (const 64 (2**21)) + s_20_24 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_4,
    neg_f_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_4,
    neg_g_0_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 24)) <=s delta, delta <=s (const 64 (1 + 2*24)),
    (const 64 (-(2**20))) <=s u_20_24, u_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_24, v_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_24, r_20_24 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_24, s_20_24 <=s (const 64 ((2**20)-1)),
    u_20_24 + v_20_24 <=s (const 64 (2**20)),
    u_20_24 - v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 + v_20_24 <=s (const 64 (2**20)),
    (const 64 0) - u_20_24 - v_20_24 <=s (const 64 (2**20)),
    r_20_24 + s_20_24 <=s (const 64 (2**20)),
    r_20_24 - s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 + s_20_24 <=s (const 64 (2**20)),
    (const 64 0) - r_20_24 - s_20_24 <=s (const 64 (2**20)),
    u_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_20_24 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_20_24 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise c
assume
neg_g_0_low60_20_low20_4 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_5 neg_g_0_low60_20_low20_4;
mov u_20_25 r_20_24;
mov v_20_25 s_20_24;

subs dc neg_g_0_low60_20_low20_5 neg_g_0_low60_20_low20_4 neg_f_0_low60_20_low20_4;
asr neg_g_0_low60_20_low20_5 neg_g_0_low60_20_low20_5 1;
subs dc r_20_25 r_20_24 u_20_24;
asr r_20_25 r_20_25 1;
subs dc s_20_25 s_20_24 v_20_24;
asr s_20_25 s_20_25 1;
assert
    true
&&
    neg_f_0_low60_20_low20_5 = neg_g_0_low60_20_low20_4,
    u_20_25 = r_20_24,
    v_20_25 = s_20_24,
    neg_g_0_low60_20_low20_5 * (const 64 2) = neg_g_0_low60_20_low20_4 - neg_f_0_low60_20_low20_4,
    r_20_25 * (const 64 2) = r_20_24 - u_20_24,
    s_20_25 * (const 64 2) = s_20_24 - v_20_24
;

assume
    neg_f_0_low60_20_low20_5 = neg_g_0_low60_20_low20_4,
    u_20_25 = r_20_24,
    v_20_25 = s_20_24,
    neg_g_0_low60_20_low20_5 * 2 = neg_g_0_low60_20_low20_4 - neg_f_0_low60_20_low20_4,
    r_20_25 * 2 = r_20_24 - u_20_24,
    s_20_25 * 2 = s_20_24 - v_20_24
&&
    true
;

{
    u_20_25 * neg_f_0_low60_20_low20_0 + v_20_25 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_25 * neg_f_0_low60_20_low20_0 + s_20_25 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_5 + u_20_25 * (const 64 (2**21)) + v_20_25 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_5 + r_20_25 * (const 64 (2**21)) + s_20_25 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_5,
    neg_f_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_5,
    neg_g_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 25)) <=s delta, delta <=s (const 64 (1 + 2*25)),
    (const 64 (-(2**20))) <=s u_20_25, u_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_25, v_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_25, r_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_25, s_20_25 <=s (const 64 ((2**20)-1)),
    u_20_25 + v_20_25 <=s (const 64 (2**20)),
    u_20_25 - v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 + v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 - v_20_25 <=s (const 64 (2**20)),
    r_20_25 + s_20_25 <=s (const 64 (2**20)),
    r_20_25 - s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 + s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 - s_20_25 <=s (const 64 (2**20)),
    u_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_20_25 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_025_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_5,
sint64 neg_g_0_low60_20_low20_5,
sint64 neg_f_0_low60_20_low20_6,
sint64 neg_g_0_low60_20_low20_6,
sint64 u_20_25,
sint64 v_20_25,
sint64 r_20_25,
sint64 s_20_25,
sint64 u_20_26,
sint64 v_20_26,
sint64 r_20_26,
sint64 s_20_26,
bit ne
)={
    u_20_25 * neg_f_0_low60_20_low20_0 + v_20_25 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_5 * (-(2**20)),
    r_20_25 * neg_f_0_low60_20_low20_0 + s_20_25 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_5 * (-(2**20))
&&
    u_20_25 * neg_f_0_low60_20_low20_0 + v_20_25 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_5 * (const 64 (-(2**20))),
    r_20_25 * neg_f_0_low60_20_low20_0 + s_20_25 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_5 + u_20_25 * (const 64 (2**21)) + v_20_25 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_5 + r_20_25 * (const 64 (2**21)) + s_20_25 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_5,
    neg_f_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_5,
    neg_g_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 25)) <=s delta, delta <=s (const 64 (1 + 2*25)),
    (const 64 (-(2**20))) <=s u_20_25, u_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_25, v_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_25, r_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_25, s_20_25 <=s (const 64 ((2**20)-1)),
    u_20_25 + v_20_25 <=s (const 64 (2**20)),
    u_20_25 - v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 + v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 - v_20_25 <=s (const 64 (2**20)),
    r_20_25 + s_20_25 <=s (const 64 (2**20)),
    r_20_25 - s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 + s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 - s_20_25 <=s (const 64 (2**20)),
    u_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_20_25 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise a
assume
neg_g_0_low60_20_low20_5 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_6 neg_f_0_low60_20_low20_5;
mov u_20_26 u_20_25;
mov v_20_26 v_20_25;

asr neg_g_0_low60_20_low20_6 neg_g_0_low60_20_low20_5 1;
asr r_20_26 r_20_25 1;
asr s_20_26 s_20_25 1;
assert
    true
&&
    neg_f_0_low60_20_low20_6 = neg_f_0_low60_20_low20_5,
    u_20_26 = u_20_25,
    v_20_26 = v_20_25,
    neg_g_0_low60_20_low20_6 * (const 64 2) = neg_g_0_low60_20_low20_5,
    r_20_26 * (const 64 2) = r_20_25,
    s_20_26 * (const 64 2) = s_20_25
;

assume
    neg_f_0_low60_20_low20_6 = neg_f_0_low60_20_low20_5,
    u_20_26 = u_20_25,
    v_20_26 = v_20_25,
    neg_g_0_low60_20_low20_6 * 2 = neg_g_0_low60_20_low20_5,
    r_20_26 * 2 = r_20_25,
    s_20_26 * 2 = s_20_25
&&
    true
;

{
    u_20_26 * neg_f_0_low60_20_low20_0 + v_20_26 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_26 * neg_f_0_low60_20_low20_0 + s_20_26 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_6 + u_20_26 * (const 64 (2**21)) + v_20_26 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_6 + r_20_26 * (const 64 (2**21)) + s_20_26 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_6,
    neg_f_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_6,
    neg_g_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 26)) <=s delta, delta <=s (const 64 (1 + 2*26)),
    (const 64 (-(2**20))) <=s u_20_26, u_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_26, v_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_26, r_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_26, s_20_26 <=s (const 64 ((2**20)-1)),
    u_20_26 + v_20_26 <=s (const 64 (2**20)),
    u_20_26 - v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 + v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 - v_20_26 <=s (const 64 (2**20)),
    r_20_26 + s_20_26 <=s (const 64 (2**20)),
    r_20_26 - s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 + s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 - s_20_26 <=s (const 64 (2**20)),
    u_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_20_26 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_025_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_5,
sint64 neg_g_0_low60_20_low20_5,
sint64 neg_f_0_low60_20_low20_6,
sint64 neg_g_0_low60_20_low20_6,
sint64 u_20_25,
sint64 v_20_25,
sint64 r_20_25,
sint64 s_20_25,
sint64 u_20_26,
sint64 v_20_26,
sint64 r_20_26,
sint64 s_20_26,
bit ne
)={
    u_20_25 * neg_f_0_low60_20_low20_0 + v_20_25 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_5 * (-(2**20)),
    r_20_25 * neg_f_0_low60_20_low20_0 + s_20_25 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_5 * (-(2**20))
&&
    u_20_25 * neg_f_0_low60_20_low20_0 + v_20_25 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_5 * (const 64 (-(2**20))),
    r_20_25 * neg_f_0_low60_20_low20_0 + s_20_25 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_5 + u_20_25 * (const 64 (2**21)) + v_20_25 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_5 + r_20_25 * (const 64 (2**21)) + s_20_25 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_5,
    neg_f_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_5,
    neg_g_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 25)) <=s delta, delta <=s (const 64 (1 + 2*25)),
    (const 64 (-(2**20))) <=s u_20_25, u_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_25, v_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_25, r_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_25, s_20_25 <=s (const 64 ((2**20)-1)),
    u_20_25 + v_20_25 <=s (const 64 (2**20)),
    u_20_25 - v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 + v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 - v_20_25 <=s (const 64 (2**20)),
    r_20_25 + s_20_25 <=s (const 64 (2**20)),
    r_20_25 - s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 + s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 - s_20_25 <=s (const 64 (2**20)),
    u_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_20_25 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise b
assume
neg_g_0_low60_20_low20_5 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_6 neg_f_0_low60_20_low20_5;
mov u_20_26 u_20_25;
mov v_20_26 v_20_25;

add neg_g_0_low60_20_low20_6 neg_g_0_low60_20_low20_5 neg_f_0_low60_20_low20_5;
asr neg_g_0_low60_20_low20_6 neg_g_0_low60_20_low20_6 1;
add r_20_26 r_20_25 u_20_25;
asr r_20_26 r_20_26 1;
add s_20_26 s_20_25 v_20_25;
asr s_20_26 s_20_26 1;
assert
    true
&&
    neg_f_0_low60_20_low20_6 = neg_f_0_low60_20_low20_5,
    u_20_26 = u_20_25,
    v_20_26 = v_20_25,
    neg_g_0_low60_20_low20_6 * (const 64 2) = neg_g_0_low60_20_low20_5 + neg_f_0_low60_20_low20_5,
    r_20_26 * (const 64 2) = r_20_25 + u_20_25,
    s_20_26 * (const 64 2) = s_20_25 + v_20_25
;

assume
    neg_f_0_low60_20_low20_6 = neg_f_0_low60_20_low20_5,
    u_20_26 = u_20_25,
    v_20_26 = v_20_25,
    neg_g_0_low60_20_low20_6 * 2 = neg_g_0_low60_20_low20_5 + neg_f_0_low60_20_low20_5,
    r_20_26 * 2 = r_20_25 + u_20_25,
    s_20_26 * 2 = s_20_25 + v_20_25
&&
    true
;

{
    u_20_26 * neg_f_0_low60_20_low20_0 + v_20_26 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_26 * neg_f_0_low60_20_low20_0 + s_20_26 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_6 + u_20_26 * (const 64 (2**21)) + v_20_26 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_6 + r_20_26 * (const 64 (2**21)) + s_20_26 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_6,
    neg_f_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_6,
    neg_g_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 26)) <=s delta, delta <=s (const 64 (1 + 2*26)),
    (const 64 (-(2**20))) <=s u_20_26, u_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_26, v_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_26, r_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_26, s_20_26 <=s (const 64 ((2**20)-1)),
    u_20_26 + v_20_26 <=s (const 64 (2**20)),
    u_20_26 - v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 + v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 - v_20_26 <=s (const 64 (2**20)),
    r_20_26 + s_20_26 <=s (const 64 (2**20)),
    r_20_26 - s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 + s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 - s_20_26 <=s (const 64 (2**20)),
    u_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_20_26 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_025_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_5,
sint64 neg_g_0_low60_20_low20_5,
sint64 neg_f_0_low60_20_low20_6,
sint64 neg_g_0_low60_20_low20_6,
sint64 u_20_25,
sint64 v_20_25,
sint64 r_20_25,
sint64 s_20_25,
sint64 u_20_26,
sint64 v_20_26,
sint64 r_20_26,
sint64 s_20_26,
bit ne
)={
    u_20_25 * neg_f_0_low60_20_low20_0 + v_20_25 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_5 * (-(2**20)),
    r_20_25 * neg_f_0_low60_20_low20_0 + s_20_25 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_5 * (-(2**20))
&&
    u_20_25 * neg_f_0_low60_20_low20_0 + v_20_25 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_5 * (const 64 (-(2**20))),
    r_20_25 * neg_f_0_low60_20_low20_0 + s_20_25 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_5 + u_20_25 * (const 64 (2**21)) + v_20_25 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_5 + r_20_25 * (const 64 (2**21)) + s_20_25 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_5,
    neg_f_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_5,
    neg_g_0_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 25)) <=s delta, delta <=s (const 64 (1 + 2*25)),
    (const 64 (-(2**20))) <=s u_20_25, u_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_25, v_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_25, r_20_25 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_25, s_20_25 <=s (const 64 ((2**20)-1)),
    u_20_25 + v_20_25 <=s (const 64 (2**20)),
    u_20_25 - v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 + v_20_25 <=s (const 64 (2**20)),
    (const 64 0) - u_20_25 - v_20_25 <=s (const 64 (2**20)),
    r_20_25 + s_20_25 <=s (const 64 (2**20)),
    r_20_25 - s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 + s_20_25 <=s (const 64 (2**20)),
    (const 64 0) - r_20_25 - s_20_25 <=s (const 64 (2**20)),
    u_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_20_25 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_20_25 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise c
assume
neg_g_0_low60_20_low20_5 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_6 neg_g_0_low60_20_low20_5;
mov u_20_26 r_20_25;
mov v_20_26 s_20_25;

subs dc neg_g_0_low60_20_low20_6 neg_g_0_low60_20_low20_5 neg_f_0_low60_20_low20_5;
asr neg_g_0_low60_20_low20_6 neg_g_0_low60_20_low20_6 1;
subs dc r_20_26 r_20_25 u_20_25;
asr r_20_26 r_20_26 1;
subs dc s_20_26 s_20_25 v_20_25;
asr s_20_26 s_20_26 1;
assert
    true
&&
    neg_f_0_low60_20_low20_6 = neg_g_0_low60_20_low20_5,
    u_20_26 = r_20_25,
    v_20_26 = s_20_25,
    neg_g_0_low60_20_low20_6 * (const 64 2) = neg_g_0_low60_20_low20_5 - neg_f_0_low60_20_low20_5,
    r_20_26 * (const 64 2) = r_20_25 - u_20_25,
    s_20_26 * (const 64 2) = s_20_25 - v_20_25
;

assume
    neg_f_0_low60_20_low20_6 = neg_g_0_low60_20_low20_5,
    u_20_26 = r_20_25,
    v_20_26 = s_20_25,
    neg_g_0_low60_20_low20_6 * 2 = neg_g_0_low60_20_low20_5 - neg_f_0_low60_20_low20_5,
    r_20_26 * 2 = r_20_25 - u_20_25,
    s_20_26 * 2 = s_20_25 - v_20_25
&&
    true
;

{
    u_20_26 * neg_f_0_low60_20_low20_0 + v_20_26 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_26 * neg_f_0_low60_20_low20_0 + s_20_26 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_6 + u_20_26 * (const 64 (2**21)) + v_20_26 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_6 + r_20_26 * (const 64 (2**21)) + s_20_26 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_6,
    neg_f_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_6,
    neg_g_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 26)) <=s delta, delta <=s (const 64 (1 + 2*26)),
    (const 64 (-(2**20))) <=s u_20_26, u_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_26, v_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_26, r_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_26, s_20_26 <=s (const 64 ((2**20)-1)),
    u_20_26 + v_20_26 <=s (const 64 (2**20)),
    u_20_26 - v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 + v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 - v_20_26 <=s (const 64 (2**20)),
    r_20_26 + s_20_26 <=s (const 64 (2**20)),
    r_20_26 - s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 + s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 - s_20_26 <=s (const 64 (2**20)),
    u_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_20_26 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_026_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_6,
sint64 neg_g_0_low60_20_low20_6,
sint64 neg_f_0_low60_20_low20_7,
sint64 neg_g_0_low60_20_low20_7,
sint64 u_20_26,
sint64 v_20_26,
sint64 r_20_26,
sint64 s_20_26,
sint64 u_20_27,
sint64 v_20_27,
sint64 r_20_27,
sint64 s_20_27,
bit ne
)={
    u_20_26 * neg_f_0_low60_20_low20_0 + v_20_26 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_6 * (-(2**20)),
    r_20_26 * neg_f_0_low60_20_low20_0 + s_20_26 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_6 * (-(2**20))
&&
    u_20_26 * neg_f_0_low60_20_low20_0 + v_20_26 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_6 * (const 64 (-(2**20))),
    r_20_26 * neg_f_0_low60_20_low20_0 + s_20_26 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_6 + u_20_26 * (const 64 (2**21)) + v_20_26 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_6 + r_20_26 * (const 64 (2**21)) + s_20_26 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_6,
    neg_f_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_6,
    neg_g_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 26)) <=s delta, delta <=s (const 64 (1 + 2*26)),
    (const 64 (-(2**20))) <=s u_20_26, u_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_26, v_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_26, r_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_26, s_20_26 <=s (const 64 ((2**20)-1)),
    u_20_26 + v_20_26 <=s (const 64 (2**20)),
    u_20_26 - v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 + v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 - v_20_26 <=s (const 64 (2**20)),
    r_20_26 + s_20_26 <=s (const 64 (2**20)),
    r_20_26 - s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 + s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 - s_20_26 <=s (const 64 (2**20)),
    u_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_20_26 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise a
assume
neg_g_0_low60_20_low20_6 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_7 neg_f_0_low60_20_low20_6;
mov u_20_27 u_20_26;
mov v_20_27 v_20_26;

asr neg_g_0_low60_20_low20_7 neg_g_0_low60_20_low20_6 1;
asr r_20_27 r_20_26 1;
asr s_20_27 s_20_26 1;
assert
    true
&&
    neg_f_0_low60_20_low20_7 = neg_f_0_low60_20_low20_6,
    u_20_27 = u_20_26,
    v_20_27 = v_20_26,
    neg_g_0_low60_20_low20_7 * (const 64 2) = neg_g_0_low60_20_low20_6,
    r_20_27 * (const 64 2) = r_20_26,
    s_20_27 * (const 64 2) = s_20_26
;

assume
    neg_f_0_low60_20_low20_7 = neg_f_0_low60_20_low20_6,
    u_20_27 = u_20_26,
    v_20_27 = v_20_26,
    neg_g_0_low60_20_low20_7 * 2 = neg_g_0_low60_20_low20_6,
    r_20_27 * 2 = r_20_26,
    s_20_27 * 2 = s_20_26
&&
    true
;

{
    u_20_27 * neg_f_0_low60_20_low20_0 + v_20_27 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_27 * neg_f_0_low60_20_low20_0 + s_20_27 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_7 + u_20_27 * (const 64 (2**21)) + v_20_27 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_7 + r_20_27 * (const 64 (2**21)) + s_20_27 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_7,
    neg_f_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_7,
    neg_g_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 27)) <=s delta, delta <=s (const 64 (1 + 2*27)),
    (const 64 (-(2**20))) <=s u_20_27, u_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_27, v_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_27, r_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_27, s_20_27 <=s (const 64 ((2**20)-1)),
    u_20_27 + v_20_27 <=s (const 64 (2**20)),
    u_20_27 - v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 + v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 - v_20_27 <=s (const 64 (2**20)),
    r_20_27 + s_20_27 <=s (const 64 (2**20)),
    r_20_27 - s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 + s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 - s_20_27 <=s (const 64 (2**20)),
    u_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_20_27 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_026_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_6,
sint64 neg_g_0_low60_20_low20_6,
sint64 neg_f_0_low60_20_low20_7,
sint64 neg_g_0_low60_20_low20_7,
sint64 u_20_26,
sint64 v_20_26,
sint64 r_20_26,
sint64 s_20_26,
sint64 u_20_27,
sint64 v_20_27,
sint64 r_20_27,
sint64 s_20_27,
bit ne
)={
    u_20_26 * neg_f_0_low60_20_low20_0 + v_20_26 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_6 * (-(2**20)),
    r_20_26 * neg_f_0_low60_20_low20_0 + s_20_26 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_6 * (-(2**20))
&&
    u_20_26 * neg_f_0_low60_20_low20_0 + v_20_26 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_6 * (const 64 (-(2**20))),
    r_20_26 * neg_f_0_low60_20_low20_0 + s_20_26 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_6 + u_20_26 * (const 64 (2**21)) + v_20_26 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_6 + r_20_26 * (const 64 (2**21)) + s_20_26 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_6,
    neg_f_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_6,
    neg_g_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 26)) <=s delta, delta <=s (const 64 (1 + 2*26)),
    (const 64 (-(2**20))) <=s u_20_26, u_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_26, v_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_26, r_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_26, s_20_26 <=s (const 64 ((2**20)-1)),
    u_20_26 + v_20_26 <=s (const 64 (2**20)),
    u_20_26 - v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 + v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 - v_20_26 <=s (const 64 (2**20)),
    r_20_26 + s_20_26 <=s (const 64 (2**20)),
    r_20_26 - s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 + s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 - s_20_26 <=s (const 64 (2**20)),
    u_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_20_26 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise b
assume
neg_g_0_low60_20_low20_6 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_7 neg_f_0_low60_20_low20_6;
mov u_20_27 u_20_26;
mov v_20_27 v_20_26;

add neg_g_0_low60_20_low20_7 neg_g_0_low60_20_low20_6 neg_f_0_low60_20_low20_6;
asr neg_g_0_low60_20_low20_7 neg_g_0_low60_20_low20_7 1;
add r_20_27 r_20_26 u_20_26;
asr r_20_27 r_20_27 1;
add s_20_27 s_20_26 v_20_26;
asr s_20_27 s_20_27 1;
assert
    true
&&
    neg_f_0_low60_20_low20_7 = neg_f_0_low60_20_low20_6,
    u_20_27 = u_20_26,
    v_20_27 = v_20_26,
    neg_g_0_low60_20_low20_7 * (const 64 2) = neg_g_0_low60_20_low20_6 + neg_f_0_low60_20_low20_6,
    r_20_27 * (const 64 2) = r_20_26 + u_20_26,
    s_20_27 * (const 64 2) = s_20_26 + v_20_26
;

assume
    neg_f_0_low60_20_low20_7 = neg_f_0_low60_20_low20_6,
    u_20_27 = u_20_26,
    v_20_27 = v_20_26,
    neg_g_0_low60_20_low20_7 * 2 = neg_g_0_low60_20_low20_6 + neg_f_0_low60_20_low20_6,
    r_20_27 * 2 = r_20_26 + u_20_26,
    s_20_27 * 2 = s_20_26 + v_20_26
&&
    true
;

{
    u_20_27 * neg_f_0_low60_20_low20_0 + v_20_27 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_27 * neg_f_0_low60_20_low20_0 + s_20_27 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_7 + u_20_27 * (const 64 (2**21)) + v_20_27 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_7 + r_20_27 * (const 64 (2**21)) + s_20_27 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_7,
    neg_f_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_7,
    neg_g_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 27)) <=s delta, delta <=s (const 64 (1 + 2*27)),
    (const 64 (-(2**20))) <=s u_20_27, u_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_27, v_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_27, r_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_27, s_20_27 <=s (const 64 ((2**20)-1)),
    u_20_27 + v_20_27 <=s (const 64 (2**20)),
    u_20_27 - v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 + v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 - v_20_27 <=s (const 64 (2**20)),
    r_20_27 + s_20_27 <=s (const 64 (2**20)),
    r_20_27 - s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 + s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 - s_20_27 <=s (const 64 (2**20)),
    u_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_20_27 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_026_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_6,
sint64 neg_g_0_low60_20_low20_6,
sint64 neg_f_0_low60_20_low20_7,
sint64 neg_g_0_low60_20_low20_7,
sint64 u_20_26,
sint64 v_20_26,
sint64 r_20_26,
sint64 s_20_26,
sint64 u_20_27,
sint64 v_20_27,
sint64 r_20_27,
sint64 s_20_27,
bit ne
)={
    u_20_26 * neg_f_0_low60_20_low20_0 + v_20_26 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_6 * (-(2**20)),
    r_20_26 * neg_f_0_low60_20_low20_0 + s_20_26 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_6 * (-(2**20))
&&
    u_20_26 * neg_f_0_low60_20_low20_0 + v_20_26 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_6 * (const 64 (-(2**20))),
    r_20_26 * neg_f_0_low60_20_low20_0 + s_20_26 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_6 + u_20_26 * (const 64 (2**21)) + v_20_26 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_6 + r_20_26 * (const 64 (2**21)) + s_20_26 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_6,
    neg_f_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_6,
    neg_g_0_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 26)) <=s delta, delta <=s (const 64 (1 + 2*26)),
    (const 64 (-(2**20))) <=s u_20_26, u_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_26, v_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_26, r_20_26 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_26, s_20_26 <=s (const 64 ((2**20)-1)),
    u_20_26 + v_20_26 <=s (const 64 (2**20)),
    u_20_26 - v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 + v_20_26 <=s (const 64 (2**20)),
    (const 64 0) - u_20_26 - v_20_26 <=s (const 64 (2**20)),
    r_20_26 + s_20_26 <=s (const 64 (2**20)),
    r_20_26 - s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 + s_20_26 <=s (const 64 (2**20)),
    (const 64 0) - r_20_26 - s_20_26 <=s (const 64 (2**20)),
    u_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_20_26 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_20_26 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise c
assume
neg_g_0_low60_20_low20_6 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_7 neg_g_0_low60_20_low20_6;
mov u_20_27 r_20_26;
mov v_20_27 s_20_26;

subs dc neg_g_0_low60_20_low20_7 neg_g_0_low60_20_low20_6 neg_f_0_low60_20_low20_6;
asr neg_g_0_low60_20_low20_7 neg_g_0_low60_20_low20_7 1;
subs dc r_20_27 r_20_26 u_20_26;
asr r_20_27 r_20_27 1;
subs dc s_20_27 s_20_26 v_20_26;
asr s_20_27 s_20_27 1;
assert
    true
&&
    neg_f_0_low60_20_low20_7 = neg_g_0_low60_20_low20_6,
    u_20_27 = r_20_26,
    v_20_27 = s_20_26,
    neg_g_0_low60_20_low20_7 * (const 64 2) = neg_g_0_low60_20_low20_6 - neg_f_0_low60_20_low20_6,
    r_20_27 * (const 64 2) = r_20_26 - u_20_26,
    s_20_27 * (const 64 2) = s_20_26 - v_20_26
;

assume
    neg_f_0_low60_20_low20_7 = neg_g_0_low60_20_low20_6,
    u_20_27 = r_20_26,
    v_20_27 = s_20_26,
    neg_g_0_low60_20_low20_7 * 2 = neg_g_0_low60_20_low20_6 - neg_f_0_low60_20_low20_6,
    r_20_27 * 2 = r_20_26 - u_20_26,
    s_20_27 * 2 = s_20_26 - v_20_26
&&
    true
;

{
    u_20_27 * neg_f_0_low60_20_low20_0 + v_20_27 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_27 * neg_f_0_low60_20_low20_0 + s_20_27 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_7 + u_20_27 * (const 64 (2**21)) + v_20_27 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_7 + r_20_27 * (const 64 (2**21)) + s_20_27 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_7,
    neg_f_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_7,
    neg_g_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 27)) <=s delta, delta <=s (const 64 (1 + 2*27)),
    (const 64 (-(2**20))) <=s u_20_27, u_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_27, v_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_27, r_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_27, s_20_27 <=s (const 64 ((2**20)-1)),
    u_20_27 + v_20_27 <=s (const 64 (2**20)),
    u_20_27 - v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 + v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 - v_20_27 <=s (const 64 (2**20)),
    r_20_27 + s_20_27 <=s (const 64 (2**20)),
    r_20_27 - s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 + s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 - s_20_27 <=s (const 64 (2**20)),
    u_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_20_27 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_027_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_7,
sint64 neg_g_0_low60_20_low20_7,
sint64 neg_f_0_low60_20_low20_8,
sint64 neg_g_0_low60_20_low20_8,
sint64 u_20_27,
sint64 v_20_27,
sint64 r_20_27,
sint64 s_20_27,
sint64 u_20_28,
sint64 v_20_28,
sint64 r_20_28,
sint64 s_20_28,
bit ne
)={
    u_20_27 * neg_f_0_low60_20_low20_0 + v_20_27 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_7 * (-(2**20)),
    r_20_27 * neg_f_0_low60_20_low20_0 + s_20_27 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_7 * (-(2**20))
&&
    u_20_27 * neg_f_0_low60_20_low20_0 + v_20_27 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_7 * (const 64 (-(2**20))),
    r_20_27 * neg_f_0_low60_20_low20_0 + s_20_27 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_7 + u_20_27 * (const 64 (2**21)) + v_20_27 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_7 + r_20_27 * (const 64 (2**21)) + s_20_27 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_7,
    neg_f_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_7,
    neg_g_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 27)) <=s delta, delta <=s (const 64 (1 + 2*27)),
    (const 64 (-(2**20))) <=s u_20_27, u_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_27, v_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_27, r_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_27, s_20_27 <=s (const 64 ((2**20)-1)),
    u_20_27 + v_20_27 <=s (const 64 (2**20)),
    u_20_27 - v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 + v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 - v_20_27 <=s (const 64 (2**20)),
    r_20_27 + s_20_27 <=s (const 64 (2**20)),
    r_20_27 - s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 + s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 - s_20_27 <=s (const 64 (2**20)),
    u_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_20_27 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise a
assume
neg_g_0_low60_20_low20_7 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_8 neg_f_0_low60_20_low20_7;
mov u_20_28 u_20_27;
mov v_20_28 v_20_27;

asr neg_g_0_low60_20_low20_8 neg_g_0_low60_20_low20_7 1;
asr r_20_28 r_20_27 1;
asr s_20_28 s_20_27 1;
assert
    true
&&
    neg_f_0_low60_20_low20_8 = neg_f_0_low60_20_low20_7,
    u_20_28 = u_20_27,
    v_20_28 = v_20_27,
    neg_g_0_low60_20_low20_8 * (const 64 2) = neg_g_0_low60_20_low20_7,
    r_20_28 * (const 64 2) = r_20_27,
    s_20_28 * (const 64 2) = s_20_27
;

assume
    neg_f_0_low60_20_low20_8 = neg_f_0_low60_20_low20_7,
    u_20_28 = u_20_27,
    v_20_28 = v_20_27,
    neg_g_0_low60_20_low20_8 * 2 = neg_g_0_low60_20_low20_7,
    r_20_28 * 2 = r_20_27,
    s_20_28 * 2 = s_20_27
&&
    true
;

{
    u_20_28 * neg_f_0_low60_20_low20_0 + v_20_28 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_28 * neg_f_0_low60_20_low20_0 + s_20_28 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_8 + u_20_28 * (const 64 (2**21)) + v_20_28 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_8 + r_20_28 * (const 64 (2**21)) + s_20_28 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_8,
    neg_f_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_8,
    neg_g_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 28)) <=s delta, delta <=s (const 64 (1 + 2*28)),
    (const 64 (-(2**20))) <=s u_20_28, u_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_28, v_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_28, r_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_28, s_20_28 <=s (const 64 ((2**20)-1)),
    u_20_28 + v_20_28 <=s (const 64 (2**20)),
    u_20_28 - v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 + v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 - v_20_28 <=s (const 64 (2**20)),
    r_20_28 + s_20_28 <=s (const 64 (2**20)),
    r_20_28 - s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 + s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 - s_20_28 <=s (const 64 (2**20)),
    u_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_20_28 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_027_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_7,
sint64 neg_g_0_low60_20_low20_7,
sint64 neg_f_0_low60_20_low20_8,
sint64 neg_g_0_low60_20_low20_8,
sint64 u_20_27,
sint64 v_20_27,
sint64 r_20_27,
sint64 s_20_27,
sint64 u_20_28,
sint64 v_20_28,
sint64 r_20_28,
sint64 s_20_28,
bit ne
)={
    u_20_27 * neg_f_0_low60_20_low20_0 + v_20_27 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_7 * (-(2**20)),
    r_20_27 * neg_f_0_low60_20_low20_0 + s_20_27 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_7 * (-(2**20))
&&
    u_20_27 * neg_f_0_low60_20_low20_0 + v_20_27 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_7 * (const 64 (-(2**20))),
    r_20_27 * neg_f_0_low60_20_low20_0 + s_20_27 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_7 + u_20_27 * (const 64 (2**21)) + v_20_27 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_7 + r_20_27 * (const 64 (2**21)) + s_20_27 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_7,
    neg_f_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_7,
    neg_g_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 27)) <=s delta, delta <=s (const 64 (1 + 2*27)),
    (const 64 (-(2**20))) <=s u_20_27, u_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_27, v_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_27, r_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_27, s_20_27 <=s (const 64 ((2**20)-1)),
    u_20_27 + v_20_27 <=s (const 64 (2**20)),
    u_20_27 - v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 + v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 - v_20_27 <=s (const 64 (2**20)),
    r_20_27 + s_20_27 <=s (const 64 (2**20)),
    r_20_27 - s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 + s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 - s_20_27 <=s (const 64 (2**20)),
    u_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_20_27 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise b
assume
neg_g_0_low60_20_low20_7 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_8 neg_f_0_low60_20_low20_7;
mov u_20_28 u_20_27;
mov v_20_28 v_20_27;

add neg_g_0_low60_20_low20_8 neg_g_0_low60_20_low20_7 neg_f_0_low60_20_low20_7;
asr neg_g_0_low60_20_low20_8 neg_g_0_low60_20_low20_8 1;
add r_20_28 r_20_27 u_20_27;
asr r_20_28 r_20_28 1;
add s_20_28 s_20_27 v_20_27;
asr s_20_28 s_20_28 1;
assert
    true
&&
    neg_f_0_low60_20_low20_8 = neg_f_0_low60_20_low20_7,
    u_20_28 = u_20_27,
    v_20_28 = v_20_27,
    neg_g_0_low60_20_low20_8 * (const 64 2) = neg_g_0_low60_20_low20_7 + neg_f_0_low60_20_low20_7,
    r_20_28 * (const 64 2) = r_20_27 + u_20_27,
    s_20_28 * (const 64 2) = s_20_27 + v_20_27
;

assume
    neg_f_0_low60_20_low20_8 = neg_f_0_low60_20_low20_7,
    u_20_28 = u_20_27,
    v_20_28 = v_20_27,
    neg_g_0_low60_20_low20_8 * 2 = neg_g_0_low60_20_low20_7 + neg_f_0_low60_20_low20_7,
    r_20_28 * 2 = r_20_27 + u_20_27,
    s_20_28 * 2 = s_20_27 + v_20_27
&&
    true
;

{
    u_20_28 * neg_f_0_low60_20_low20_0 + v_20_28 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_28 * neg_f_0_low60_20_low20_0 + s_20_28 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_8 + u_20_28 * (const 64 (2**21)) + v_20_28 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_8 + r_20_28 * (const 64 (2**21)) + s_20_28 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_8,
    neg_f_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_8,
    neg_g_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 28)) <=s delta, delta <=s (const 64 (1 + 2*28)),
    (const 64 (-(2**20))) <=s u_20_28, u_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_28, v_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_28, r_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_28, s_20_28 <=s (const 64 ((2**20)-1)),
    u_20_28 + v_20_28 <=s (const 64 (2**20)),
    u_20_28 - v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 + v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 - v_20_28 <=s (const 64 (2**20)),
    r_20_28 + s_20_28 <=s (const 64 (2**20)),
    r_20_28 - s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 + s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 - s_20_28 <=s (const 64 (2**20)),
    u_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_20_28 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_027_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_7,
sint64 neg_g_0_low60_20_low20_7,
sint64 neg_f_0_low60_20_low20_8,
sint64 neg_g_0_low60_20_low20_8,
sint64 u_20_27,
sint64 v_20_27,
sint64 r_20_27,
sint64 s_20_27,
sint64 u_20_28,
sint64 v_20_28,
sint64 r_20_28,
sint64 s_20_28,
bit ne
)={
    u_20_27 * neg_f_0_low60_20_low20_0 + v_20_27 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_7 * (-(2**20)),
    r_20_27 * neg_f_0_low60_20_low20_0 + s_20_27 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_7 * (-(2**20))
&&
    u_20_27 * neg_f_0_low60_20_low20_0 + v_20_27 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_7 * (const 64 (-(2**20))),
    r_20_27 * neg_f_0_low60_20_low20_0 + s_20_27 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_7 + u_20_27 * (const 64 (2**21)) + v_20_27 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_7 + r_20_27 * (const 64 (2**21)) + s_20_27 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_7,
    neg_f_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_7,
    neg_g_0_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 27)) <=s delta, delta <=s (const 64 (1 + 2*27)),
    (const 64 (-(2**20))) <=s u_20_27, u_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_27, v_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_27, r_20_27 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_27, s_20_27 <=s (const 64 ((2**20)-1)),
    u_20_27 + v_20_27 <=s (const 64 (2**20)),
    u_20_27 - v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 + v_20_27 <=s (const 64 (2**20)),
    (const 64 0) - u_20_27 - v_20_27 <=s (const 64 (2**20)),
    r_20_27 + s_20_27 <=s (const 64 (2**20)),
    r_20_27 - s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 + s_20_27 <=s (const 64 (2**20)),
    (const 64 0) - r_20_27 - s_20_27 <=s (const 64 (2**20)),
    u_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_20_27 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_20_27 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise c
assume
neg_g_0_low60_20_low20_7 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_8 neg_g_0_low60_20_low20_7;
mov u_20_28 r_20_27;
mov v_20_28 s_20_27;

subs dc neg_g_0_low60_20_low20_8 neg_g_0_low60_20_low20_7 neg_f_0_low60_20_low20_7;
asr neg_g_0_low60_20_low20_8 neg_g_0_low60_20_low20_8 1;
subs dc r_20_28 r_20_27 u_20_27;
asr r_20_28 r_20_28 1;
subs dc s_20_28 s_20_27 v_20_27;
asr s_20_28 s_20_28 1;
assert
    true
&&
    neg_f_0_low60_20_low20_8 = neg_g_0_low60_20_low20_7,
    u_20_28 = r_20_27,
    v_20_28 = s_20_27,
    neg_g_0_low60_20_low20_8 * (const 64 2) = neg_g_0_low60_20_low20_7 - neg_f_0_low60_20_low20_7,
    r_20_28 * (const 64 2) = r_20_27 - u_20_27,
    s_20_28 * (const 64 2) = s_20_27 - v_20_27
;

assume
    neg_f_0_low60_20_low20_8 = neg_g_0_low60_20_low20_7,
    u_20_28 = r_20_27,
    v_20_28 = s_20_27,
    neg_g_0_low60_20_low20_8 * 2 = neg_g_0_low60_20_low20_7 - neg_f_0_low60_20_low20_7,
    r_20_28 * 2 = r_20_27 - u_20_27,
    s_20_28 * 2 = s_20_27 - v_20_27
&&
    true
;

{
    u_20_28 * neg_f_0_low60_20_low20_0 + v_20_28 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_28 * neg_f_0_low60_20_low20_0 + s_20_28 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_8 + u_20_28 * (const 64 (2**21)) + v_20_28 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_8 + r_20_28 * (const 64 (2**21)) + s_20_28 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_8,
    neg_f_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_8,
    neg_g_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 28)) <=s delta, delta <=s (const 64 (1 + 2*28)),
    (const 64 (-(2**20))) <=s u_20_28, u_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_28, v_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_28, r_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_28, s_20_28 <=s (const 64 ((2**20)-1)),
    u_20_28 + v_20_28 <=s (const 64 (2**20)),
    u_20_28 - v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 + v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 - v_20_28 <=s (const 64 (2**20)),
    r_20_28 + s_20_28 <=s (const 64 (2**20)),
    r_20_28 - s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 + s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 - s_20_28 <=s (const 64 (2**20)),
    u_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_20_28 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_028_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_8,
sint64 neg_g_0_low60_20_low20_8,
sint64 neg_f_0_low60_20_low20_9,
sint64 neg_g_0_low60_20_low20_9,
sint64 u_20_28,
sint64 v_20_28,
sint64 r_20_28,
sint64 s_20_28,
sint64 u_20_29,
sint64 v_20_29,
sint64 r_20_29,
sint64 s_20_29,
bit ne
)={
    u_20_28 * neg_f_0_low60_20_low20_0 + v_20_28 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_8 * (-(2**20)),
    r_20_28 * neg_f_0_low60_20_low20_0 + s_20_28 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_8 * (-(2**20))
&&
    u_20_28 * neg_f_0_low60_20_low20_0 + v_20_28 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_8 * (const 64 (-(2**20))),
    r_20_28 * neg_f_0_low60_20_low20_0 + s_20_28 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_8 + u_20_28 * (const 64 (2**21)) + v_20_28 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_8 + r_20_28 * (const 64 (2**21)) + s_20_28 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_8,
    neg_f_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_8,
    neg_g_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 28)) <=s delta, delta <=s (const 64 (1 + 2*28)),
    (const 64 (-(2**20))) <=s u_20_28, u_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_28, v_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_28, r_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_28, s_20_28 <=s (const 64 ((2**20)-1)),
    u_20_28 + v_20_28 <=s (const 64 (2**20)),
    u_20_28 - v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 + v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 - v_20_28 <=s (const 64 (2**20)),
    r_20_28 + s_20_28 <=s (const 64 (2**20)),
    r_20_28 - s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 + s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 - s_20_28 <=s (const 64 (2**20)),
    u_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_20_28 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise a
assume
neg_g_0_low60_20_low20_8 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_9 neg_f_0_low60_20_low20_8;
mov u_20_29 u_20_28;
mov v_20_29 v_20_28;

asr neg_g_0_low60_20_low20_9 neg_g_0_low60_20_low20_8 1;
asr r_20_29 r_20_28 1;
asr s_20_29 s_20_28 1;
assert
    true
&&
    neg_f_0_low60_20_low20_9 = neg_f_0_low60_20_low20_8,
    u_20_29 = u_20_28,
    v_20_29 = v_20_28,
    neg_g_0_low60_20_low20_9 * (const 64 2) = neg_g_0_low60_20_low20_8,
    r_20_29 * (const 64 2) = r_20_28,
    s_20_29 * (const 64 2) = s_20_28
;

assume
    neg_f_0_low60_20_low20_9 = neg_f_0_low60_20_low20_8,
    u_20_29 = u_20_28,
    v_20_29 = v_20_28,
    neg_g_0_low60_20_low20_9 * 2 = neg_g_0_low60_20_low20_8,
    r_20_29 * 2 = r_20_28,
    s_20_29 * 2 = s_20_28
&&
    true
;

{
    u_20_29 * neg_f_0_low60_20_low20_0 + v_20_29 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_29 * neg_f_0_low60_20_low20_0 + s_20_29 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_9 + u_20_29 * (const 64 (2**21)) + v_20_29 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_9 + r_20_29 * (const 64 (2**21)) + s_20_29 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_9,
    neg_f_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_9,
    neg_g_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 29)) <=s delta, delta <=s (const 64 (1 + 2*29)),
    (const 64 (-(2**20))) <=s u_20_29, u_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_29, v_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_29, r_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_29, s_20_29 <=s (const 64 ((2**20)-1)),
    u_20_29 + v_20_29 <=s (const 64 (2**20)),
    u_20_29 - v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 + v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 - v_20_29 <=s (const 64 (2**20)),
    r_20_29 + s_20_29 <=s (const 64 (2**20)),
    r_20_29 - s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 + s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 - s_20_29 <=s (const 64 (2**20)),
    u_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_20_29 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_028_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_8,
sint64 neg_g_0_low60_20_low20_8,
sint64 neg_f_0_low60_20_low20_9,
sint64 neg_g_0_low60_20_low20_9,
sint64 u_20_28,
sint64 v_20_28,
sint64 r_20_28,
sint64 s_20_28,
sint64 u_20_29,
sint64 v_20_29,
sint64 r_20_29,
sint64 s_20_29,
bit ne
)={
    u_20_28 * neg_f_0_low60_20_low20_0 + v_20_28 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_8 * (-(2**20)),
    r_20_28 * neg_f_0_low60_20_low20_0 + s_20_28 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_8 * (-(2**20))
&&
    u_20_28 * neg_f_0_low60_20_low20_0 + v_20_28 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_8 * (const 64 (-(2**20))),
    r_20_28 * neg_f_0_low60_20_low20_0 + s_20_28 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_8 + u_20_28 * (const 64 (2**21)) + v_20_28 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_8 + r_20_28 * (const 64 (2**21)) + s_20_28 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_8,
    neg_f_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_8,
    neg_g_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 28)) <=s delta, delta <=s (const 64 (1 + 2*28)),
    (const 64 (-(2**20))) <=s u_20_28, u_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_28, v_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_28, r_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_28, s_20_28 <=s (const 64 ((2**20)-1)),
    u_20_28 + v_20_28 <=s (const 64 (2**20)),
    u_20_28 - v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 + v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 - v_20_28 <=s (const 64 (2**20)),
    r_20_28 + s_20_28 <=s (const 64 (2**20)),
    r_20_28 - s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 + s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 - s_20_28 <=s (const 64 (2**20)),
    u_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_20_28 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise b
assume
neg_g_0_low60_20_low20_8 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_9 neg_f_0_low60_20_low20_8;
mov u_20_29 u_20_28;
mov v_20_29 v_20_28;

add neg_g_0_low60_20_low20_9 neg_g_0_low60_20_low20_8 neg_f_0_low60_20_low20_8;
asr neg_g_0_low60_20_low20_9 neg_g_0_low60_20_low20_9 1;
add r_20_29 r_20_28 u_20_28;
asr r_20_29 r_20_29 1;
add s_20_29 s_20_28 v_20_28;
asr s_20_29 s_20_29 1;
assert
    true
&&
    neg_f_0_low60_20_low20_9 = neg_f_0_low60_20_low20_8,
    u_20_29 = u_20_28,
    v_20_29 = v_20_28,
    neg_g_0_low60_20_low20_9 * (const 64 2) = neg_g_0_low60_20_low20_8 + neg_f_0_low60_20_low20_8,
    r_20_29 * (const 64 2) = r_20_28 + u_20_28,
    s_20_29 * (const 64 2) = s_20_28 + v_20_28
;

assume
    neg_f_0_low60_20_low20_9 = neg_f_0_low60_20_low20_8,
    u_20_29 = u_20_28,
    v_20_29 = v_20_28,
    neg_g_0_low60_20_low20_9 * 2 = neg_g_0_low60_20_low20_8 + neg_f_0_low60_20_low20_8,
    r_20_29 * 2 = r_20_28 + u_20_28,
    s_20_29 * 2 = s_20_28 + v_20_28
&&
    true
;

{
    u_20_29 * neg_f_0_low60_20_low20_0 + v_20_29 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_29 * neg_f_0_low60_20_low20_0 + s_20_29 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_9 + u_20_29 * (const 64 (2**21)) + v_20_29 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_9 + r_20_29 * (const 64 (2**21)) + s_20_29 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_9,
    neg_f_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_9,
    neg_g_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 29)) <=s delta, delta <=s (const 64 (1 + 2*29)),
    (const 64 (-(2**20))) <=s u_20_29, u_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_29, v_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_29, r_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_29, s_20_29 <=s (const 64 ((2**20)-1)),
    u_20_29 + v_20_29 <=s (const 64 (2**20)),
    u_20_29 - v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 + v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 - v_20_29 <=s (const 64 (2**20)),
    r_20_29 + s_20_29 <=s (const 64 (2**20)),
    r_20_29 - s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 + s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 - s_20_29 <=s (const 64 (2**20)),
    u_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_20_29 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_028_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_8,
sint64 neg_g_0_low60_20_low20_8,
sint64 neg_f_0_low60_20_low20_9,
sint64 neg_g_0_low60_20_low20_9,
sint64 u_20_28,
sint64 v_20_28,
sint64 r_20_28,
sint64 s_20_28,
sint64 u_20_29,
sint64 v_20_29,
sint64 r_20_29,
sint64 s_20_29,
bit ne
)={
    u_20_28 * neg_f_0_low60_20_low20_0 + v_20_28 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_8 * (-(2**20)),
    r_20_28 * neg_f_0_low60_20_low20_0 + s_20_28 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_8 * (-(2**20))
&&
    u_20_28 * neg_f_0_low60_20_low20_0 + v_20_28 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_8 * (const 64 (-(2**20))),
    r_20_28 * neg_f_0_low60_20_low20_0 + s_20_28 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_8 + u_20_28 * (const 64 (2**21)) + v_20_28 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_8 + r_20_28 * (const 64 (2**21)) + s_20_28 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_8,
    neg_f_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_8,
    neg_g_0_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 28)) <=s delta, delta <=s (const 64 (1 + 2*28)),
    (const 64 (-(2**20))) <=s u_20_28, u_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_28, v_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_28, r_20_28 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_28, s_20_28 <=s (const 64 ((2**20)-1)),
    u_20_28 + v_20_28 <=s (const 64 (2**20)),
    u_20_28 - v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 + v_20_28 <=s (const 64 (2**20)),
    (const 64 0) - u_20_28 - v_20_28 <=s (const 64 (2**20)),
    r_20_28 + s_20_28 <=s (const 64 (2**20)),
    r_20_28 - s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 + s_20_28 <=s (const 64 (2**20)),
    (const 64 0) - r_20_28 - s_20_28 <=s (const 64 (2**20)),
    u_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_20_28 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_20_28 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise c
assume
neg_g_0_low60_20_low20_8 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_9 neg_g_0_low60_20_low20_8;
mov u_20_29 r_20_28;
mov v_20_29 s_20_28;

subs dc neg_g_0_low60_20_low20_9 neg_g_0_low60_20_low20_8 neg_f_0_low60_20_low20_8;
asr neg_g_0_low60_20_low20_9 neg_g_0_low60_20_low20_9 1;
subs dc r_20_29 r_20_28 u_20_28;
asr r_20_29 r_20_29 1;
subs dc s_20_29 s_20_28 v_20_28;
asr s_20_29 s_20_29 1;
assert
    true
&&
    neg_f_0_low60_20_low20_9 = neg_g_0_low60_20_low20_8,
    u_20_29 = r_20_28,
    v_20_29 = s_20_28,
    neg_g_0_low60_20_low20_9 * (const 64 2) = neg_g_0_low60_20_low20_8 - neg_f_0_low60_20_low20_8,
    r_20_29 * (const 64 2) = r_20_28 - u_20_28,
    s_20_29 * (const 64 2) = s_20_28 - v_20_28
;

assume
    neg_f_0_low60_20_low20_9 = neg_g_0_low60_20_low20_8,
    u_20_29 = r_20_28,
    v_20_29 = s_20_28,
    neg_g_0_low60_20_low20_9 * 2 = neg_g_0_low60_20_low20_8 - neg_f_0_low60_20_low20_8,
    r_20_29 * 2 = r_20_28 - u_20_28,
    s_20_29 * 2 = s_20_28 - v_20_28
&&
    true
;

{
    u_20_29 * neg_f_0_low60_20_low20_0 + v_20_29 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_29 * neg_f_0_low60_20_low20_0 + s_20_29 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_9 + u_20_29 * (const 64 (2**21)) + v_20_29 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_9 + r_20_29 * (const 64 (2**21)) + s_20_29 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_9,
    neg_f_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_9,
    neg_g_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 29)) <=s delta, delta <=s (const 64 (1 + 2*29)),
    (const 64 (-(2**20))) <=s u_20_29, u_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_29, v_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_29, r_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_29, s_20_29 <=s (const 64 ((2**20)-1)),
    u_20_29 + v_20_29 <=s (const 64 (2**20)),
    u_20_29 - v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 + v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 - v_20_29 <=s (const 64 (2**20)),
    r_20_29 + s_20_29 <=s (const 64 (2**20)),
    r_20_29 - s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 + s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 - s_20_29 <=s (const 64 (2**20)),
    u_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_20_29 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_029_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_9,
sint64 neg_g_0_low60_20_low20_9,
sint64 neg_f_0_low60_20_low20_10,
sint64 neg_g_0_low60_20_low20_10,
sint64 u_20_29,
sint64 v_20_29,
sint64 r_20_29,
sint64 s_20_29,
sint64 u_20_30,
sint64 v_20_30,
sint64 r_20_30,
sint64 s_20_30,
bit ne
)={
    u_20_29 * neg_f_0_low60_20_low20_0 + v_20_29 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_9 * (-(2**20)),
    r_20_29 * neg_f_0_low60_20_low20_0 + s_20_29 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_9 * (-(2**20))
&&
    u_20_29 * neg_f_0_low60_20_low20_0 + v_20_29 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_9 * (const 64 (-(2**20))),
    r_20_29 * neg_f_0_low60_20_low20_0 + s_20_29 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_9 + u_20_29 * (const 64 (2**21)) + v_20_29 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_9 + r_20_29 * (const 64 (2**21)) + s_20_29 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_9,
    neg_f_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_9,
    neg_g_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 29)) <=s delta, delta <=s (const 64 (1 + 2*29)),
    (const 64 (-(2**20))) <=s u_20_29, u_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_29, v_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_29, r_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_29, s_20_29 <=s (const 64 ((2**20)-1)),
    u_20_29 + v_20_29 <=s (const 64 (2**20)),
    u_20_29 - v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 + v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 - v_20_29 <=s (const 64 (2**20)),
    r_20_29 + s_20_29 <=s (const 64 (2**20)),
    r_20_29 - s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 + s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 - s_20_29 <=s (const 64 (2**20)),
    u_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_20_29 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise a
assume
neg_g_0_low60_20_low20_9 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_10 neg_f_0_low60_20_low20_9;
mov u_20_30 u_20_29;
mov v_20_30 v_20_29;

asr neg_g_0_low60_20_low20_10 neg_g_0_low60_20_low20_9 1;
asr r_20_30 r_20_29 1;
asr s_20_30 s_20_29 1;
assert
    true
&&
    neg_f_0_low60_20_low20_10 = neg_f_0_low60_20_low20_9,
    u_20_30 = u_20_29,
    v_20_30 = v_20_29,
    neg_g_0_low60_20_low20_10 * (const 64 2) = neg_g_0_low60_20_low20_9,
    r_20_30 * (const 64 2) = r_20_29,
    s_20_30 * (const 64 2) = s_20_29
;

assume
    neg_f_0_low60_20_low20_10 = neg_f_0_low60_20_low20_9,
    u_20_30 = u_20_29,
    v_20_30 = v_20_29,
    neg_g_0_low60_20_low20_10 * 2 = neg_g_0_low60_20_low20_9,
    r_20_30 * 2 = r_20_29,
    s_20_30 * 2 = s_20_29
&&
    true
;

{
    u_20_30 * neg_f_0_low60_20_low20_0 + v_20_30 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_30 * neg_f_0_low60_20_low20_0 + s_20_30 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_10 + u_20_30 * (const 64 (2**21)) + v_20_30 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_10 + r_20_30 * (const 64 (2**21)) + s_20_30 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_10,
    neg_f_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_10,
    neg_g_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 30)) <=s delta, delta <=s (const 64 (1 + 2*30)),
    (const 64 (-(2**20))) <=s u_20_30, u_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_30, v_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_30, r_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_30, s_20_30 <=s (const 64 ((2**20)-1)),
    u_20_30 + v_20_30 <=s (const 64 (2**20)),
    u_20_30 - v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 + v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 - v_20_30 <=s (const 64 (2**20)),
    r_20_30 + s_20_30 <=s (const 64 (2**20)),
    r_20_30 - s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 + s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 - s_20_30 <=s (const 64 (2**20)),
    u_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_20_30 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_029_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_9,
sint64 neg_g_0_low60_20_low20_9,
sint64 neg_f_0_low60_20_low20_10,
sint64 neg_g_0_low60_20_low20_10,
sint64 u_20_29,
sint64 v_20_29,
sint64 r_20_29,
sint64 s_20_29,
sint64 u_20_30,
sint64 v_20_30,
sint64 r_20_30,
sint64 s_20_30,
bit ne
)={
    u_20_29 * neg_f_0_low60_20_low20_0 + v_20_29 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_9 * (-(2**20)),
    r_20_29 * neg_f_0_low60_20_low20_0 + s_20_29 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_9 * (-(2**20))
&&
    u_20_29 * neg_f_0_low60_20_low20_0 + v_20_29 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_9 * (const 64 (-(2**20))),
    r_20_29 * neg_f_0_low60_20_low20_0 + s_20_29 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_9 + u_20_29 * (const 64 (2**21)) + v_20_29 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_9 + r_20_29 * (const 64 (2**21)) + s_20_29 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_9,
    neg_f_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_9,
    neg_g_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 29)) <=s delta, delta <=s (const 64 (1 + 2*29)),
    (const 64 (-(2**20))) <=s u_20_29, u_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_29, v_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_29, r_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_29, s_20_29 <=s (const 64 ((2**20)-1)),
    u_20_29 + v_20_29 <=s (const 64 (2**20)),
    u_20_29 - v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 + v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 - v_20_29 <=s (const 64 (2**20)),
    r_20_29 + s_20_29 <=s (const 64 (2**20)),
    r_20_29 - s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 + s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 - s_20_29 <=s (const 64 (2**20)),
    u_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_20_29 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise b
assume
neg_g_0_low60_20_low20_9 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_10 neg_f_0_low60_20_low20_9;
mov u_20_30 u_20_29;
mov v_20_30 v_20_29;

add neg_g_0_low60_20_low20_10 neg_g_0_low60_20_low20_9 neg_f_0_low60_20_low20_9;
asr neg_g_0_low60_20_low20_10 neg_g_0_low60_20_low20_10 1;
add r_20_30 r_20_29 u_20_29;
asr r_20_30 r_20_30 1;
add s_20_30 s_20_29 v_20_29;
asr s_20_30 s_20_30 1;
assert
    true
&&
    neg_f_0_low60_20_low20_10 = neg_f_0_low60_20_low20_9,
    u_20_30 = u_20_29,
    v_20_30 = v_20_29,
    neg_g_0_low60_20_low20_10 * (const 64 2) = neg_g_0_low60_20_low20_9 + neg_f_0_low60_20_low20_9,
    r_20_30 * (const 64 2) = r_20_29 + u_20_29,
    s_20_30 * (const 64 2) = s_20_29 + v_20_29
;

assume
    neg_f_0_low60_20_low20_10 = neg_f_0_low60_20_low20_9,
    u_20_30 = u_20_29,
    v_20_30 = v_20_29,
    neg_g_0_low60_20_low20_10 * 2 = neg_g_0_low60_20_low20_9 + neg_f_0_low60_20_low20_9,
    r_20_30 * 2 = r_20_29 + u_20_29,
    s_20_30 * 2 = s_20_29 + v_20_29
&&
    true
;

{
    u_20_30 * neg_f_0_low60_20_low20_0 + v_20_30 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_30 * neg_f_0_low60_20_low20_0 + s_20_30 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_10 + u_20_30 * (const 64 (2**21)) + v_20_30 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_10 + r_20_30 * (const 64 (2**21)) + s_20_30 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_10,
    neg_f_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_10,
    neg_g_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 30)) <=s delta, delta <=s (const 64 (1 + 2*30)),
    (const 64 (-(2**20))) <=s u_20_30, u_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_30, v_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_30, r_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_30, s_20_30 <=s (const 64 ((2**20)-1)),
    u_20_30 + v_20_30 <=s (const 64 (2**20)),
    u_20_30 - v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 + v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 - v_20_30 <=s (const 64 (2**20)),
    r_20_30 + s_20_30 <=s (const 64 (2**20)),
    r_20_30 - s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 + s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 - s_20_30 <=s (const 64 (2**20)),
    u_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_20_30 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_029_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_9,
sint64 neg_g_0_low60_20_low20_9,
sint64 neg_f_0_low60_20_low20_10,
sint64 neg_g_0_low60_20_low20_10,
sint64 u_20_29,
sint64 v_20_29,
sint64 r_20_29,
sint64 s_20_29,
sint64 u_20_30,
sint64 v_20_30,
sint64 r_20_30,
sint64 s_20_30,
bit ne
)={
    u_20_29 * neg_f_0_low60_20_low20_0 + v_20_29 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_9 * (-(2**20)),
    r_20_29 * neg_f_0_low60_20_low20_0 + s_20_29 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_9 * (-(2**20))
&&
    u_20_29 * neg_f_0_low60_20_low20_0 + v_20_29 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_9 * (const 64 (-(2**20))),
    r_20_29 * neg_f_0_low60_20_low20_0 + s_20_29 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_9 + u_20_29 * (const 64 (2**21)) + v_20_29 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_9 + r_20_29 * (const 64 (2**21)) + s_20_29 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_9,
    neg_f_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_9,
    neg_g_0_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 29)) <=s delta, delta <=s (const 64 (1 + 2*29)),
    (const 64 (-(2**20))) <=s u_20_29, u_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_29, v_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_29, r_20_29 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_29, s_20_29 <=s (const 64 ((2**20)-1)),
    u_20_29 + v_20_29 <=s (const 64 (2**20)),
    u_20_29 - v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 + v_20_29 <=s (const 64 (2**20)),
    (const 64 0) - u_20_29 - v_20_29 <=s (const 64 (2**20)),
    r_20_29 + s_20_29 <=s (const 64 (2**20)),
    r_20_29 - s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 + s_20_29 <=s (const 64 (2**20)),
    (const 64 0) - r_20_29 - s_20_29 <=s (const 64 (2**20)),
    u_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_20_29 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_20_29 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise c
assume
neg_g_0_low60_20_low20_9 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_10 neg_g_0_low60_20_low20_9;
mov u_20_30 r_20_29;
mov v_20_30 s_20_29;

subs dc neg_g_0_low60_20_low20_10 neg_g_0_low60_20_low20_9 neg_f_0_low60_20_low20_9;
asr neg_g_0_low60_20_low20_10 neg_g_0_low60_20_low20_10 1;
subs dc r_20_30 r_20_29 u_20_29;
asr r_20_30 r_20_30 1;
subs dc s_20_30 s_20_29 v_20_29;
asr s_20_30 s_20_30 1;
assert
    true
&&
    neg_f_0_low60_20_low20_10 = neg_g_0_low60_20_low20_9,
    u_20_30 = r_20_29,
    v_20_30 = s_20_29,
    neg_g_0_low60_20_low20_10 * (const 64 2) = neg_g_0_low60_20_low20_9 - neg_f_0_low60_20_low20_9,
    r_20_30 * (const 64 2) = r_20_29 - u_20_29,
    s_20_30 * (const 64 2) = s_20_29 - v_20_29
;

assume
    neg_f_0_low60_20_low20_10 = neg_g_0_low60_20_low20_9,
    u_20_30 = r_20_29,
    v_20_30 = s_20_29,
    neg_g_0_low60_20_low20_10 * 2 = neg_g_0_low60_20_low20_9 - neg_f_0_low60_20_low20_9,
    r_20_30 * 2 = r_20_29 - u_20_29,
    s_20_30 * 2 = s_20_29 - v_20_29
&&
    true
;

{
    u_20_30 * neg_f_0_low60_20_low20_0 + v_20_30 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_30 * neg_f_0_low60_20_low20_0 + s_20_30 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_10 + u_20_30 * (const 64 (2**21)) + v_20_30 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_10 + r_20_30 * (const 64 (2**21)) + s_20_30 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_10,
    neg_f_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_10,
    neg_g_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 30)) <=s delta, delta <=s (const 64 (1 + 2*30)),
    (const 64 (-(2**20))) <=s u_20_30, u_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_30, v_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_30, r_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_30, s_20_30 <=s (const 64 ((2**20)-1)),
    u_20_30 + v_20_30 <=s (const 64 (2**20)),
    u_20_30 - v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 + v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 - v_20_30 <=s (const 64 (2**20)),
    r_20_30 + s_20_30 <=s (const 64 (2**20)),
    r_20_30 - s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 + s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 - s_20_30 <=s (const 64 (2**20)),
    u_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_20_30 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_030_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_10,
sint64 neg_g_0_low60_20_low20_10,
sint64 neg_f_0_low60_20_low20_11,
sint64 neg_g_0_low60_20_low20_11,
sint64 u_20_30,
sint64 v_20_30,
sint64 r_20_30,
sint64 s_20_30,
sint64 u_20_31,
sint64 v_20_31,
sint64 r_20_31,
sint64 s_20_31,
bit ne
)={
    u_20_30 * neg_f_0_low60_20_low20_0 + v_20_30 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_10 * (-(2**20)),
    r_20_30 * neg_f_0_low60_20_low20_0 + s_20_30 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_10 * (-(2**20))
&&
    u_20_30 * neg_f_0_low60_20_low20_0 + v_20_30 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_10 * (const 64 (-(2**20))),
    r_20_30 * neg_f_0_low60_20_low20_0 + s_20_30 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_10 + u_20_30 * (const 64 (2**21)) + v_20_30 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_10 + r_20_30 * (const 64 (2**21)) + s_20_30 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_10,
    neg_f_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_10,
    neg_g_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 30)) <=s delta, delta <=s (const 64 (1 + 2*30)),
    (const 64 (-(2**20))) <=s u_20_30, u_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_30, v_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_30, r_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_30, s_20_30 <=s (const 64 ((2**20)-1)),
    u_20_30 + v_20_30 <=s (const 64 (2**20)),
    u_20_30 - v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 + v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 - v_20_30 <=s (const 64 (2**20)),
    r_20_30 + s_20_30 <=s (const 64 (2**20)),
    r_20_30 - s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 + s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 - s_20_30 <=s (const 64 (2**20)),
    u_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_20_30 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise a
assume
neg_g_0_low60_20_low20_10 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_11 neg_f_0_low60_20_low20_10;
mov u_20_31 u_20_30;
mov v_20_31 v_20_30;

asr neg_g_0_low60_20_low20_11 neg_g_0_low60_20_low20_10 1;
asr r_20_31 r_20_30 1;
asr s_20_31 s_20_30 1;
assert
    true
&&
    neg_f_0_low60_20_low20_11 = neg_f_0_low60_20_low20_10,
    u_20_31 = u_20_30,
    v_20_31 = v_20_30,
    neg_g_0_low60_20_low20_11 * (const 64 2) = neg_g_0_low60_20_low20_10,
    r_20_31 * (const 64 2) = r_20_30,
    s_20_31 * (const 64 2) = s_20_30
;

assume
    neg_f_0_low60_20_low20_11 = neg_f_0_low60_20_low20_10,
    u_20_31 = u_20_30,
    v_20_31 = v_20_30,
    neg_g_0_low60_20_low20_11 * 2 = neg_g_0_low60_20_low20_10,
    r_20_31 * 2 = r_20_30,
    s_20_31 * 2 = s_20_30
&&
    true
;

{
    u_20_31 * neg_f_0_low60_20_low20_0 + v_20_31 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_31 * neg_f_0_low60_20_low20_0 + s_20_31 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_11 + u_20_31 * (const 64 (2**21)) + v_20_31 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_11 + r_20_31 * (const 64 (2**21)) + s_20_31 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_11,
    neg_f_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_11,
    neg_g_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 31)) <=s delta, delta <=s (const 64 (1 + 2*31)),
    (const 64 (-(2**20))) <=s u_20_31, u_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_31, v_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_31, r_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_31, s_20_31 <=s (const 64 ((2**20)-1)),
    u_20_31 + v_20_31 <=s (const 64 (2**20)),
    u_20_31 - v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 + v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 - v_20_31 <=s (const 64 (2**20)),
    r_20_31 + s_20_31 <=s (const 64 (2**20)),
    r_20_31 - s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 + s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 - s_20_31 <=s (const 64 (2**20)),
    u_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_20_31 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_030_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_10,
sint64 neg_g_0_low60_20_low20_10,
sint64 neg_f_0_low60_20_low20_11,
sint64 neg_g_0_low60_20_low20_11,
sint64 u_20_30,
sint64 v_20_30,
sint64 r_20_30,
sint64 s_20_30,
sint64 u_20_31,
sint64 v_20_31,
sint64 r_20_31,
sint64 s_20_31,
bit ne
)={
    u_20_30 * neg_f_0_low60_20_low20_0 + v_20_30 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_10 * (-(2**20)),
    r_20_30 * neg_f_0_low60_20_low20_0 + s_20_30 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_10 * (-(2**20))
&&
    u_20_30 * neg_f_0_low60_20_low20_0 + v_20_30 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_10 * (const 64 (-(2**20))),
    r_20_30 * neg_f_0_low60_20_low20_0 + s_20_30 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_10 + u_20_30 * (const 64 (2**21)) + v_20_30 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_10 + r_20_30 * (const 64 (2**21)) + s_20_30 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_10,
    neg_f_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_10,
    neg_g_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 30)) <=s delta, delta <=s (const 64 (1 + 2*30)),
    (const 64 (-(2**20))) <=s u_20_30, u_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_30, v_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_30, r_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_30, s_20_30 <=s (const 64 ((2**20)-1)),
    u_20_30 + v_20_30 <=s (const 64 (2**20)),
    u_20_30 - v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 + v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 - v_20_30 <=s (const 64 (2**20)),
    r_20_30 + s_20_30 <=s (const 64 (2**20)),
    r_20_30 - s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 + s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 - s_20_30 <=s (const 64 (2**20)),
    u_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_20_30 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise b
assume
neg_g_0_low60_20_low20_10 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_11 neg_f_0_low60_20_low20_10;
mov u_20_31 u_20_30;
mov v_20_31 v_20_30;

add neg_g_0_low60_20_low20_11 neg_g_0_low60_20_low20_10 neg_f_0_low60_20_low20_10;
asr neg_g_0_low60_20_low20_11 neg_g_0_low60_20_low20_11 1;
add r_20_31 r_20_30 u_20_30;
asr r_20_31 r_20_31 1;
add s_20_31 s_20_30 v_20_30;
asr s_20_31 s_20_31 1;
assert
    true
&&
    neg_f_0_low60_20_low20_11 = neg_f_0_low60_20_low20_10,
    u_20_31 = u_20_30,
    v_20_31 = v_20_30,
    neg_g_0_low60_20_low20_11 * (const 64 2) = neg_g_0_low60_20_low20_10 + neg_f_0_low60_20_low20_10,
    r_20_31 * (const 64 2) = r_20_30 + u_20_30,
    s_20_31 * (const 64 2) = s_20_30 + v_20_30
;

assume
    neg_f_0_low60_20_low20_11 = neg_f_0_low60_20_low20_10,
    u_20_31 = u_20_30,
    v_20_31 = v_20_30,
    neg_g_0_low60_20_low20_11 * 2 = neg_g_0_low60_20_low20_10 + neg_f_0_low60_20_low20_10,
    r_20_31 * 2 = r_20_30 + u_20_30,
    s_20_31 * 2 = s_20_30 + v_20_30
&&
    true
;

{
    u_20_31 * neg_f_0_low60_20_low20_0 + v_20_31 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_31 * neg_f_0_low60_20_low20_0 + s_20_31 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_11 + u_20_31 * (const 64 (2**21)) + v_20_31 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_11 + r_20_31 * (const 64 (2**21)) + s_20_31 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_11,
    neg_f_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_11,
    neg_g_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 31)) <=s delta, delta <=s (const 64 (1 + 2*31)),
    (const 64 (-(2**20))) <=s u_20_31, u_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_31, v_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_31, r_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_31, s_20_31 <=s (const 64 ((2**20)-1)),
    u_20_31 + v_20_31 <=s (const 64 (2**20)),
    u_20_31 - v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 + v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 - v_20_31 <=s (const 64 (2**20)),
    r_20_31 + s_20_31 <=s (const 64 (2**20)),
    r_20_31 - s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 + s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 - s_20_31 <=s (const 64 (2**20)),
    u_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_20_31 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_030_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_10,
sint64 neg_g_0_low60_20_low20_10,
sint64 neg_f_0_low60_20_low20_11,
sint64 neg_g_0_low60_20_low20_11,
sint64 u_20_30,
sint64 v_20_30,
sint64 r_20_30,
sint64 s_20_30,
sint64 u_20_31,
sint64 v_20_31,
sint64 r_20_31,
sint64 s_20_31,
bit ne
)={
    u_20_30 * neg_f_0_low60_20_low20_0 + v_20_30 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_10 * (-(2**20)),
    r_20_30 * neg_f_0_low60_20_low20_0 + s_20_30 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_10 * (-(2**20))
&&
    u_20_30 * neg_f_0_low60_20_low20_0 + v_20_30 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_10 * (const 64 (-(2**20))),
    r_20_30 * neg_f_0_low60_20_low20_0 + s_20_30 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_10 + u_20_30 * (const 64 (2**21)) + v_20_30 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_10 + r_20_30 * (const 64 (2**21)) + s_20_30 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_10,
    neg_f_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_10,
    neg_g_0_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 30)) <=s delta, delta <=s (const 64 (1 + 2*30)),
    (const 64 (-(2**20))) <=s u_20_30, u_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_30, v_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_30, r_20_30 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_30, s_20_30 <=s (const 64 ((2**20)-1)),
    u_20_30 + v_20_30 <=s (const 64 (2**20)),
    u_20_30 - v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 + v_20_30 <=s (const 64 (2**20)),
    (const 64 0) - u_20_30 - v_20_30 <=s (const 64 (2**20)),
    r_20_30 + s_20_30 <=s (const 64 (2**20)),
    r_20_30 - s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 + s_20_30 <=s (const 64 (2**20)),
    (const 64 0) - r_20_30 - s_20_30 <=s (const 64 (2**20)),
    u_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_20_30 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_20_30 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise c
assume
neg_g_0_low60_20_low20_10 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_11 neg_g_0_low60_20_low20_10;
mov u_20_31 r_20_30;
mov v_20_31 s_20_30;

subs dc neg_g_0_low60_20_low20_11 neg_g_0_low60_20_low20_10 neg_f_0_low60_20_low20_10;
asr neg_g_0_low60_20_low20_11 neg_g_0_low60_20_low20_11 1;
subs dc r_20_31 r_20_30 u_20_30;
asr r_20_31 r_20_31 1;
subs dc s_20_31 s_20_30 v_20_30;
asr s_20_31 s_20_31 1;
assert
    true
&&
    neg_f_0_low60_20_low20_11 = neg_g_0_low60_20_low20_10,
    u_20_31 = r_20_30,
    v_20_31 = s_20_30,
    neg_g_0_low60_20_low20_11 * (const 64 2) = neg_g_0_low60_20_low20_10 - neg_f_0_low60_20_low20_10,
    r_20_31 * (const 64 2) = r_20_30 - u_20_30,
    s_20_31 * (const 64 2) = s_20_30 - v_20_30
;

assume
    neg_f_0_low60_20_low20_11 = neg_g_0_low60_20_low20_10,
    u_20_31 = r_20_30,
    v_20_31 = s_20_30,
    neg_g_0_low60_20_low20_11 * 2 = neg_g_0_low60_20_low20_10 - neg_f_0_low60_20_low20_10,
    r_20_31 * 2 = r_20_30 - u_20_30,
    s_20_31 * 2 = s_20_30 - v_20_30
&&
    true
;

{
    u_20_31 * neg_f_0_low60_20_low20_0 + v_20_31 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_31 * neg_f_0_low60_20_low20_0 + s_20_31 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_11 + u_20_31 * (const 64 (2**21)) + v_20_31 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_11 + r_20_31 * (const 64 (2**21)) + s_20_31 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_11,
    neg_f_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_11,
    neg_g_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 31)) <=s delta, delta <=s (const 64 (1 + 2*31)),
    (const 64 (-(2**20))) <=s u_20_31, u_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_31, v_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_31, r_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_31, s_20_31 <=s (const 64 ((2**20)-1)),
    u_20_31 + v_20_31 <=s (const 64 (2**20)),
    u_20_31 - v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 + v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 - v_20_31 <=s (const 64 (2**20)),
    r_20_31 + s_20_31 <=s (const 64 (2**20)),
    r_20_31 - s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 + s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 - s_20_31 <=s (const 64 (2**20)),
    u_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_20_31 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_031_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_11,
sint64 neg_g_0_low60_20_low20_11,
sint64 neg_f_0_low60_20_low20_12,
sint64 neg_g_0_low60_20_low20_12,
sint64 u_20_31,
sint64 v_20_31,
sint64 r_20_31,
sint64 s_20_31,
sint64 u_20_32,
sint64 v_20_32,
sint64 r_20_32,
sint64 s_20_32,
bit ne
)={
    u_20_31 * neg_f_0_low60_20_low20_0 + v_20_31 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_11 * (-(2**20)),
    r_20_31 * neg_f_0_low60_20_low20_0 + s_20_31 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_11 * (-(2**20))
&&
    u_20_31 * neg_f_0_low60_20_low20_0 + v_20_31 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_11 * (const 64 (-(2**20))),
    r_20_31 * neg_f_0_low60_20_low20_0 + s_20_31 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_11 + u_20_31 * (const 64 (2**21)) + v_20_31 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_11 + r_20_31 * (const 64 (2**21)) + s_20_31 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_11,
    neg_f_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_11,
    neg_g_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 31)) <=s delta, delta <=s (const 64 (1 + 2*31)),
    (const 64 (-(2**20))) <=s u_20_31, u_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_31, v_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_31, r_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_31, s_20_31 <=s (const 64 ((2**20)-1)),
    u_20_31 + v_20_31 <=s (const 64 (2**20)),
    u_20_31 - v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 + v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 - v_20_31 <=s (const 64 (2**20)),
    r_20_31 + s_20_31 <=s (const 64 (2**20)),
    r_20_31 - s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 + s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 - s_20_31 <=s (const 64 (2**20)),
    u_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_20_31 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step31

// premise a
assume
neg_g_0_low60_20_low20_11 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_12 neg_f_0_low60_20_low20_11;
mov u_20_32 u_20_31;
mov v_20_32 v_20_31;

asr neg_g_0_low60_20_low20_12 neg_g_0_low60_20_low20_11 1;
asr r_20_32 r_20_31 1;
asr s_20_32 s_20_31 1;
assert
    true
&&
    neg_f_0_low60_20_low20_12 = neg_f_0_low60_20_low20_11,
    u_20_32 = u_20_31,
    v_20_32 = v_20_31,
    neg_g_0_low60_20_low20_12 * (const 64 2) = neg_g_0_low60_20_low20_11,
    r_20_32 * (const 64 2) = r_20_31,
    s_20_32 * (const 64 2) = s_20_31
;

assume
    neg_f_0_low60_20_low20_12 = neg_f_0_low60_20_low20_11,
    u_20_32 = u_20_31,
    v_20_32 = v_20_31,
    neg_g_0_low60_20_low20_12 * 2 = neg_g_0_low60_20_low20_11,
    r_20_32 * 2 = r_20_31,
    s_20_32 * 2 = s_20_31
&&
    true
;

{
    u_20_32 * neg_f_0_low60_20_low20_0 + v_20_32 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_32 * neg_f_0_low60_20_low20_0 + s_20_32 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_12 + u_20_32 * (const 64 (2**21)) + v_20_32 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_12 + r_20_32 * (const 64 (2**21)) + s_20_32 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_12,
    neg_f_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_12,
    neg_g_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 32)) <=s delta, delta <=s (const 64 (1 + 2*32)),
    (const 64 (-(2**20))) <=s u_20_32, u_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_32, v_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_32, r_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_32, s_20_32 <=s (const 64 ((2**20)-1)),
    u_20_32 + v_20_32 <=s (const 64 (2**20)),
    u_20_32 - v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 + v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 - v_20_32 <=s (const 64 (2**20)),
    r_20_32 + s_20_32 <=s (const 64 (2**20)),
    r_20_32 - s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 + s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 - s_20_32 <=s (const 64 (2**20)),
    u_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_20_32 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_031_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_11,
sint64 neg_g_0_low60_20_low20_11,
sint64 neg_f_0_low60_20_low20_12,
sint64 neg_g_0_low60_20_low20_12,
sint64 u_20_31,
sint64 v_20_31,
sint64 r_20_31,
sint64 s_20_31,
sint64 u_20_32,
sint64 v_20_32,
sint64 r_20_32,
sint64 s_20_32,
bit ne
)={
    u_20_31 * neg_f_0_low60_20_low20_0 + v_20_31 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_11 * (-(2**20)),
    r_20_31 * neg_f_0_low60_20_low20_0 + s_20_31 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_11 * (-(2**20))
&&
    u_20_31 * neg_f_0_low60_20_low20_0 + v_20_31 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_11 * (const 64 (-(2**20))),
    r_20_31 * neg_f_0_low60_20_low20_0 + s_20_31 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_11 + u_20_31 * (const 64 (2**21)) + v_20_31 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_11 + r_20_31 * (const 64 (2**21)) + s_20_31 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_11,
    neg_f_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_11,
    neg_g_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 31)) <=s delta, delta <=s (const 64 (1 + 2*31)),
    (const 64 (-(2**20))) <=s u_20_31, u_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_31, v_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_31, r_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_31, s_20_31 <=s (const 64 ((2**20)-1)),
    u_20_31 + v_20_31 <=s (const 64 (2**20)),
    u_20_31 - v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 + v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 - v_20_31 <=s (const 64 (2**20)),
    r_20_31 + s_20_31 <=s (const 64 (2**20)),
    r_20_31 - s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 + s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 - s_20_31 <=s (const 64 (2**20)),
    u_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_20_31 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step31

// premise b
assume
neg_g_0_low60_20_low20_11 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_12 neg_f_0_low60_20_low20_11;
mov u_20_32 u_20_31;
mov v_20_32 v_20_31;

add neg_g_0_low60_20_low20_12 neg_g_0_low60_20_low20_11 neg_f_0_low60_20_low20_11;
asr neg_g_0_low60_20_low20_12 neg_g_0_low60_20_low20_12 1;
add r_20_32 r_20_31 u_20_31;
asr r_20_32 r_20_32 1;
add s_20_32 s_20_31 v_20_31;
asr s_20_32 s_20_32 1;
assert
    true
&&
    neg_f_0_low60_20_low20_12 = neg_f_0_low60_20_low20_11,
    u_20_32 = u_20_31,
    v_20_32 = v_20_31,
    neg_g_0_low60_20_low20_12 * (const 64 2) = neg_g_0_low60_20_low20_11 + neg_f_0_low60_20_low20_11,
    r_20_32 * (const 64 2) = r_20_31 + u_20_31,
    s_20_32 * (const 64 2) = s_20_31 + v_20_31
;

assume
    neg_f_0_low60_20_low20_12 = neg_f_0_low60_20_low20_11,
    u_20_32 = u_20_31,
    v_20_32 = v_20_31,
    neg_g_0_low60_20_low20_12 * 2 = neg_g_0_low60_20_low20_11 + neg_f_0_low60_20_low20_11,
    r_20_32 * 2 = r_20_31 + u_20_31,
    s_20_32 * 2 = s_20_31 + v_20_31
&&
    true
;

{
    u_20_32 * neg_f_0_low60_20_low20_0 + v_20_32 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_32 * neg_f_0_low60_20_low20_0 + s_20_32 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_12 + u_20_32 * (const 64 (2**21)) + v_20_32 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_12 + r_20_32 * (const 64 (2**21)) + s_20_32 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_12,
    neg_f_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_12,
    neg_g_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 32)) <=s delta, delta <=s (const 64 (1 + 2*32)),
    (const 64 (-(2**20))) <=s u_20_32, u_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_32, v_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_32, r_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_32, s_20_32 <=s (const 64 ((2**20)-1)),
    u_20_32 + v_20_32 <=s (const 64 (2**20)),
    u_20_32 - v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 + v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 - v_20_32 <=s (const 64 (2**20)),
    r_20_32 + s_20_32 <=s (const 64 (2**20)),
    r_20_32 - s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 + s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 - s_20_32 <=s (const 64 (2**20)),
    u_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_20_32 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_031_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_11,
sint64 neg_g_0_low60_20_low20_11,
sint64 neg_f_0_low60_20_low20_12,
sint64 neg_g_0_low60_20_low20_12,
sint64 u_20_31,
sint64 v_20_31,
sint64 r_20_31,
sint64 s_20_31,
sint64 u_20_32,
sint64 v_20_32,
sint64 r_20_32,
sint64 s_20_32,
bit ne
)={
    u_20_31 * neg_f_0_low60_20_low20_0 + v_20_31 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_11 * (-(2**20)),
    r_20_31 * neg_f_0_low60_20_low20_0 + s_20_31 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_11 * (-(2**20))
&&
    u_20_31 * neg_f_0_low60_20_low20_0 + v_20_31 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_11 * (const 64 (-(2**20))),
    r_20_31 * neg_f_0_low60_20_low20_0 + s_20_31 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_11 + u_20_31 * (const 64 (2**21)) + v_20_31 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_11 + r_20_31 * (const 64 (2**21)) + s_20_31 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_11,
    neg_f_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_11,
    neg_g_0_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 31)) <=s delta, delta <=s (const 64 (1 + 2*31)),
    (const 64 (-(2**20))) <=s u_20_31, u_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_31, v_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_31, r_20_31 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_31, s_20_31 <=s (const 64 ((2**20)-1)),
    u_20_31 + v_20_31 <=s (const 64 (2**20)),
    u_20_31 - v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 + v_20_31 <=s (const 64 (2**20)),
    (const 64 0) - u_20_31 - v_20_31 <=s (const 64 (2**20)),
    r_20_31 + s_20_31 <=s (const 64 (2**20)),
    r_20_31 - s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 + s_20_31 <=s (const 64 (2**20)),
    (const 64 0) - r_20_31 - s_20_31 <=s (const 64 (2**20)),
    u_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_20_31 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_20_31 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step31

// premise c
assume
neg_g_0_low60_20_low20_11 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_12 neg_g_0_low60_20_low20_11;
mov u_20_32 r_20_31;
mov v_20_32 s_20_31;

subs dc neg_g_0_low60_20_low20_12 neg_g_0_low60_20_low20_11 neg_f_0_low60_20_low20_11;
asr neg_g_0_low60_20_low20_12 neg_g_0_low60_20_low20_12 1;
subs dc r_20_32 r_20_31 u_20_31;
asr r_20_32 r_20_32 1;
subs dc s_20_32 s_20_31 v_20_31;
asr s_20_32 s_20_32 1;
assert
    true
&&
    neg_f_0_low60_20_low20_12 = neg_g_0_low60_20_low20_11,
    u_20_32 = r_20_31,
    v_20_32 = s_20_31,
    neg_g_0_low60_20_low20_12 * (const 64 2) = neg_g_0_low60_20_low20_11 - neg_f_0_low60_20_low20_11,
    r_20_32 * (const 64 2) = r_20_31 - u_20_31,
    s_20_32 * (const 64 2) = s_20_31 - v_20_31
;

assume
    neg_f_0_low60_20_low20_12 = neg_g_0_low60_20_low20_11,
    u_20_32 = r_20_31,
    v_20_32 = s_20_31,
    neg_g_0_low60_20_low20_12 * 2 = neg_g_0_low60_20_low20_11 - neg_f_0_low60_20_low20_11,
    r_20_32 * 2 = r_20_31 - u_20_31,
    s_20_32 * 2 = s_20_31 - v_20_31
&&
    true
;

{
    u_20_32 * neg_f_0_low60_20_low20_0 + v_20_32 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_32 * neg_f_0_low60_20_low20_0 + s_20_32 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_12 + u_20_32 * (const 64 (2**21)) + v_20_32 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_12 + r_20_32 * (const 64 (2**21)) + s_20_32 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_12,
    neg_f_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_12,
    neg_g_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 32)) <=s delta, delta <=s (const 64 (1 + 2*32)),
    (const 64 (-(2**20))) <=s u_20_32, u_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_32, v_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_32, r_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_32, s_20_32 <=s (const 64 ((2**20)-1)),
    u_20_32 + v_20_32 <=s (const 64 (2**20)),
    u_20_32 - v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 + v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 - v_20_32 <=s (const 64 (2**20)),
    r_20_32 + s_20_32 <=s (const 64 (2**20)),
    r_20_32 - s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 + s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 - s_20_32 <=s (const 64 (2**20)),
    u_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_20_32 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_032_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_12,
sint64 neg_g_0_low60_20_low20_12,
sint64 neg_f_0_low60_20_low20_13,
sint64 neg_g_0_low60_20_low20_13,
sint64 u_20_32,
sint64 v_20_32,
sint64 r_20_32,
sint64 s_20_32,
sint64 u_20_33,
sint64 v_20_33,
sint64 r_20_33,
sint64 s_20_33,
bit ne
)={
    u_20_32 * neg_f_0_low60_20_low20_0 + v_20_32 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_12 * (-(2**20)),
    r_20_32 * neg_f_0_low60_20_low20_0 + s_20_32 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_12 * (-(2**20))
&&
    u_20_32 * neg_f_0_low60_20_low20_0 + v_20_32 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_12 * (const 64 (-(2**20))),
    r_20_32 * neg_f_0_low60_20_low20_0 + s_20_32 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_12 + u_20_32 * (const 64 (2**21)) + v_20_32 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_12 + r_20_32 * (const 64 (2**21)) + s_20_32 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_12,
    neg_f_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_12,
    neg_g_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 32)) <=s delta, delta <=s (const 64 (1 + 2*32)),
    (const 64 (-(2**20))) <=s u_20_32, u_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_32, v_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_32, r_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_32, s_20_32 <=s (const 64 ((2**20)-1)),
    u_20_32 + v_20_32 <=s (const 64 (2**20)),
    u_20_32 - v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 + v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 - v_20_32 <=s (const 64 (2**20)),
    r_20_32 + s_20_32 <=s (const 64 (2**20)),
    r_20_32 - s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 + s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 - s_20_32 <=s (const 64 (2**20)),
    u_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_20_32 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step32

// premise a
assume
neg_g_0_low60_20_low20_12 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_13 neg_f_0_low60_20_low20_12;
mov u_20_33 u_20_32;
mov v_20_33 v_20_32;

asr neg_g_0_low60_20_low20_13 neg_g_0_low60_20_low20_12 1;
asr r_20_33 r_20_32 1;
asr s_20_33 s_20_32 1;
assert
    true
&&
    neg_f_0_low60_20_low20_13 = neg_f_0_low60_20_low20_12,
    u_20_33 = u_20_32,
    v_20_33 = v_20_32,
    neg_g_0_low60_20_low20_13 * (const 64 2) = neg_g_0_low60_20_low20_12,
    r_20_33 * (const 64 2) = r_20_32,
    s_20_33 * (const 64 2) = s_20_32
;

assume
    neg_f_0_low60_20_low20_13 = neg_f_0_low60_20_low20_12,
    u_20_33 = u_20_32,
    v_20_33 = v_20_32,
    neg_g_0_low60_20_low20_13 * 2 = neg_g_0_low60_20_low20_12,
    r_20_33 * 2 = r_20_32,
    s_20_33 * 2 = s_20_32
&&
    true
;

{
    u_20_33 * neg_f_0_low60_20_low20_0 + v_20_33 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_33 * neg_f_0_low60_20_low20_0 + s_20_33 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_13 + u_20_33 * (const 64 (2**21)) + v_20_33 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_13 + r_20_33 * (const 64 (2**21)) + s_20_33 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_13,
    neg_f_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_13,
    neg_g_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 33)) <=s delta, delta <=s (const 64 (1 + 2*33)),
    (const 64 (-(2**20))) <=s u_20_33, u_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_33, v_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_33, r_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_33, s_20_33 <=s (const 64 ((2**20)-1)),
    u_20_33 + v_20_33 <=s (const 64 (2**20)),
    u_20_33 - v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 + v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 - v_20_33 <=s (const 64 (2**20)),
    r_20_33 + s_20_33 <=s (const 64 (2**20)),
    r_20_33 - s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 + s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 - s_20_33 <=s (const 64 (2**20)),
    u_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_20_33 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_032_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_12,
sint64 neg_g_0_low60_20_low20_12,
sint64 neg_f_0_low60_20_low20_13,
sint64 neg_g_0_low60_20_low20_13,
sint64 u_20_32,
sint64 v_20_32,
sint64 r_20_32,
sint64 s_20_32,
sint64 u_20_33,
sint64 v_20_33,
sint64 r_20_33,
sint64 s_20_33,
bit ne
)={
    u_20_32 * neg_f_0_low60_20_low20_0 + v_20_32 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_12 * (-(2**20)),
    r_20_32 * neg_f_0_low60_20_low20_0 + s_20_32 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_12 * (-(2**20))
&&
    u_20_32 * neg_f_0_low60_20_low20_0 + v_20_32 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_12 * (const 64 (-(2**20))),
    r_20_32 * neg_f_0_low60_20_low20_0 + s_20_32 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_12 + u_20_32 * (const 64 (2**21)) + v_20_32 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_12 + r_20_32 * (const 64 (2**21)) + s_20_32 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_12,
    neg_f_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_12,
    neg_g_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 32)) <=s delta, delta <=s (const 64 (1 + 2*32)),
    (const 64 (-(2**20))) <=s u_20_32, u_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_32, v_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_32, r_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_32, s_20_32 <=s (const 64 ((2**20)-1)),
    u_20_32 + v_20_32 <=s (const 64 (2**20)),
    u_20_32 - v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 + v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 - v_20_32 <=s (const 64 (2**20)),
    r_20_32 + s_20_32 <=s (const 64 (2**20)),
    r_20_32 - s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 + s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 - s_20_32 <=s (const 64 (2**20)),
    u_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_20_32 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step32

// premise b
assume
neg_g_0_low60_20_low20_12 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_13 neg_f_0_low60_20_low20_12;
mov u_20_33 u_20_32;
mov v_20_33 v_20_32;

add neg_g_0_low60_20_low20_13 neg_g_0_low60_20_low20_12 neg_f_0_low60_20_low20_12;
asr neg_g_0_low60_20_low20_13 neg_g_0_low60_20_low20_13 1;
add r_20_33 r_20_32 u_20_32;
asr r_20_33 r_20_33 1;
add s_20_33 s_20_32 v_20_32;
asr s_20_33 s_20_33 1;
assert
    true
&&
    neg_f_0_low60_20_low20_13 = neg_f_0_low60_20_low20_12,
    u_20_33 = u_20_32,
    v_20_33 = v_20_32,
    neg_g_0_low60_20_low20_13 * (const 64 2) = neg_g_0_low60_20_low20_12 + neg_f_0_low60_20_low20_12,
    r_20_33 * (const 64 2) = r_20_32 + u_20_32,
    s_20_33 * (const 64 2) = s_20_32 + v_20_32
;

assume
    neg_f_0_low60_20_low20_13 = neg_f_0_low60_20_low20_12,
    u_20_33 = u_20_32,
    v_20_33 = v_20_32,
    neg_g_0_low60_20_low20_13 * 2 = neg_g_0_low60_20_low20_12 + neg_f_0_low60_20_low20_12,
    r_20_33 * 2 = r_20_32 + u_20_32,
    s_20_33 * 2 = s_20_32 + v_20_32
&&
    true
;

{
    u_20_33 * neg_f_0_low60_20_low20_0 + v_20_33 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_33 * neg_f_0_low60_20_low20_0 + s_20_33 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_13 + u_20_33 * (const 64 (2**21)) + v_20_33 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_13 + r_20_33 * (const 64 (2**21)) + s_20_33 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_13,
    neg_f_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_13,
    neg_g_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 33)) <=s delta, delta <=s (const 64 (1 + 2*33)),
    (const 64 (-(2**20))) <=s u_20_33, u_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_33, v_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_33, r_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_33, s_20_33 <=s (const 64 ((2**20)-1)),
    u_20_33 + v_20_33 <=s (const 64 (2**20)),
    u_20_33 - v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 + v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 - v_20_33 <=s (const 64 (2**20)),
    r_20_33 + s_20_33 <=s (const 64 (2**20)),
    r_20_33 - s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 + s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 - s_20_33 <=s (const 64 (2**20)),
    u_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_20_33 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_032_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_12,
sint64 neg_g_0_low60_20_low20_12,
sint64 neg_f_0_low60_20_low20_13,
sint64 neg_g_0_low60_20_low20_13,
sint64 u_20_32,
sint64 v_20_32,
sint64 r_20_32,
sint64 s_20_32,
sint64 u_20_33,
sint64 v_20_33,
sint64 r_20_33,
sint64 s_20_33,
bit ne
)={
    u_20_32 * neg_f_0_low60_20_low20_0 + v_20_32 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_12 * (-(2**20)),
    r_20_32 * neg_f_0_low60_20_low20_0 + s_20_32 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_12 * (-(2**20))
&&
    u_20_32 * neg_f_0_low60_20_low20_0 + v_20_32 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_12 * (const 64 (-(2**20))),
    r_20_32 * neg_f_0_low60_20_low20_0 + s_20_32 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_12 + u_20_32 * (const 64 (2**21)) + v_20_32 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_12 + r_20_32 * (const 64 (2**21)) + s_20_32 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_12,
    neg_f_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_12,
    neg_g_0_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 32)) <=s delta, delta <=s (const 64 (1 + 2*32)),
    (const 64 (-(2**20))) <=s u_20_32, u_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_32, v_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_32, r_20_32 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_32, s_20_32 <=s (const 64 ((2**20)-1)),
    u_20_32 + v_20_32 <=s (const 64 (2**20)),
    u_20_32 - v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 + v_20_32 <=s (const 64 (2**20)),
    (const 64 0) - u_20_32 - v_20_32 <=s (const 64 (2**20)),
    r_20_32 + s_20_32 <=s (const 64 (2**20)),
    r_20_32 - s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 + s_20_32 <=s (const 64 (2**20)),
    (const 64 0) - r_20_32 - s_20_32 <=s (const 64 (2**20)),
    u_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_20_32 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_20_32 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step32

// premise c
assume
neg_g_0_low60_20_low20_12 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_13 neg_g_0_low60_20_low20_12;
mov u_20_33 r_20_32;
mov v_20_33 s_20_32;

subs dc neg_g_0_low60_20_low20_13 neg_g_0_low60_20_low20_12 neg_f_0_low60_20_low20_12;
asr neg_g_0_low60_20_low20_13 neg_g_0_low60_20_low20_13 1;
subs dc r_20_33 r_20_32 u_20_32;
asr r_20_33 r_20_33 1;
subs dc s_20_33 s_20_32 v_20_32;
asr s_20_33 s_20_33 1;
assert
    true
&&
    neg_f_0_low60_20_low20_13 = neg_g_0_low60_20_low20_12,
    u_20_33 = r_20_32,
    v_20_33 = s_20_32,
    neg_g_0_low60_20_low20_13 * (const 64 2) = neg_g_0_low60_20_low20_12 - neg_f_0_low60_20_low20_12,
    r_20_33 * (const 64 2) = r_20_32 - u_20_32,
    s_20_33 * (const 64 2) = s_20_32 - v_20_32
;

assume
    neg_f_0_low60_20_low20_13 = neg_g_0_low60_20_low20_12,
    u_20_33 = r_20_32,
    v_20_33 = s_20_32,
    neg_g_0_low60_20_low20_13 * 2 = neg_g_0_low60_20_low20_12 - neg_f_0_low60_20_low20_12,
    r_20_33 * 2 = r_20_32 - u_20_32,
    s_20_33 * 2 = s_20_32 - v_20_32
&&
    true
;

{
    u_20_33 * neg_f_0_low60_20_low20_0 + v_20_33 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_33 * neg_f_0_low60_20_low20_0 + s_20_33 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_13 + u_20_33 * (const 64 (2**21)) + v_20_33 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_13 + r_20_33 * (const 64 (2**21)) + s_20_33 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_13,
    neg_f_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_13,
    neg_g_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 33)) <=s delta, delta <=s (const 64 (1 + 2*33)),
    (const 64 (-(2**20))) <=s u_20_33, u_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_33, v_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_33, r_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_33, s_20_33 <=s (const 64 ((2**20)-1)),
    u_20_33 + v_20_33 <=s (const 64 (2**20)),
    u_20_33 - v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 + v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 - v_20_33 <=s (const 64 (2**20)),
    r_20_33 + s_20_33 <=s (const 64 (2**20)),
    r_20_33 - s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 + s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 - s_20_33 <=s (const 64 (2**20)),
    u_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_20_33 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_033_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_13,
sint64 neg_g_0_low60_20_low20_13,
sint64 neg_f_0_low60_20_low20_14,
sint64 neg_g_0_low60_20_low20_14,
sint64 u_20_33,
sint64 v_20_33,
sint64 r_20_33,
sint64 s_20_33,
sint64 u_20_34,
sint64 v_20_34,
sint64 r_20_34,
sint64 s_20_34,
bit ne
)={
    u_20_33 * neg_f_0_low60_20_low20_0 + v_20_33 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_13 * (-(2**20)),
    r_20_33 * neg_f_0_low60_20_low20_0 + s_20_33 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_13 * (-(2**20))
&&
    u_20_33 * neg_f_0_low60_20_low20_0 + v_20_33 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_13 * (const 64 (-(2**20))),
    r_20_33 * neg_f_0_low60_20_low20_0 + s_20_33 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_13 + u_20_33 * (const 64 (2**21)) + v_20_33 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_13 + r_20_33 * (const 64 (2**21)) + s_20_33 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_13,
    neg_f_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_13,
    neg_g_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 33)) <=s delta, delta <=s (const 64 (1 + 2*33)),
    (const 64 (-(2**20))) <=s u_20_33, u_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_33, v_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_33, r_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_33, s_20_33 <=s (const 64 ((2**20)-1)),
    u_20_33 + v_20_33 <=s (const 64 (2**20)),
    u_20_33 - v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 + v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 - v_20_33 <=s (const 64 (2**20)),
    r_20_33 + s_20_33 <=s (const 64 (2**20)),
    r_20_33 - s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 + s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 - s_20_33 <=s (const 64 (2**20)),
    u_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_20_33 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise a
assume
neg_g_0_low60_20_low20_13 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_14 neg_f_0_low60_20_low20_13;
mov u_20_34 u_20_33;
mov v_20_34 v_20_33;

asr neg_g_0_low60_20_low20_14 neg_g_0_low60_20_low20_13 1;
asr r_20_34 r_20_33 1;
asr s_20_34 s_20_33 1;
assert
    true
&&
    neg_f_0_low60_20_low20_14 = neg_f_0_low60_20_low20_13,
    u_20_34 = u_20_33,
    v_20_34 = v_20_33,
    neg_g_0_low60_20_low20_14 * (const 64 2) = neg_g_0_low60_20_low20_13,
    r_20_34 * (const 64 2) = r_20_33,
    s_20_34 * (const 64 2) = s_20_33
;

assume
    neg_f_0_low60_20_low20_14 = neg_f_0_low60_20_low20_13,
    u_20_34 = u_20_33,
    v_20_34 = v_20_33,
    neg_g_0_low60_20_low20_14 * 2 = neg_g_0_low60_20_low20_13,
    r_20_34 * 2 = r_20_33,
    s_20_34 * 2 = s_20_33
&&
    true
;

{
    u_20_34 * neg_f_0_low60_20_low20_0 + v_20_34 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_34 * neg_f_0_low60_20_low20_0 + s_20_34 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_14 + u_20_34 * (const 64 (2**21)) + v_20_34 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_14 + r_20_34 * (const 64 (2**21)) + s_20_34 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_14,
    neg_f_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_14,
    neg_g_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 34)) <=s delta, delta <=s (const 64 (1 + 2*34)),
    (const 64 (-(2**20))) <=s u_20_34, u_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_34, v_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_34, r_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_34, s_20_34 <=s (const 64 ((2**20)-1)),
    u_20_34 + v_20_34 <=s (const 64 (2**20)),
    u_20_34 - v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 + v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 - v_20_34 <=s (const 64 (2**20)),
    r_20_34 + s_20_34 <=s (const 64 (2**20)),
    r_20_34 - s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 + s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 - s_20_34 <=s (const 64 (2**20)),
    u_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_20_34 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_033_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_13,
sint64 neg_g_0_low60_20_low20_13,
sint64 neg_f_0_low60_20_low20_14,
sint64 neg_g_0_low60_20_low20_14,
sint64 u_20_33,
sint64 v_20_33,
sint64 r_20_33,
sint64 s_20_33,
sint64 u_20_34,
sint64 v_20_34,
sint64 r_20_34,
sint64 s_20_34,
bit ne
)={
    u_20_33 * neg_f_0_low60_20_low20_0 + v_20_33 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_13 * (-(2**20)),
    r_20_33 * neg_f_0_low60_20_low20_0 + s_20_33 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_13 * (-(2**20))
&&
    u_20_33 * neg_f_0_low60_20_low20_0 + v_20_33 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_13 * (const 64 (-(2**20))),
    r_20_33 * neg_f_0_low60_20_low20_0 + s_20_33 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_13 + u_20_33 * (const 64 (2**21)) + v_20_33 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_13 + r_20_33 * (const 64 (2**21)) + s_20_33 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_13,
    neg_f_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_13,
    neg_g_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 33)) <=s delta, delta <=s (const 64 (1 + 2*33)),
    (const 64 (-(2**20))) <=s u_20_33, u_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_33, v_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_33, r_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_33, s_20_33 <=s (const 64 ((2**20)-1)),
    u_20_33 + v_20_33 <=s (const 64 (2**20)),
    u_20_33 - v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 + v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 - v_20_33 <=s (const 64 (2**20)),
    r_20_33 + s_20_33 <=s (const 64 (2**20)),
    r_20_33 - s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 + s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 - s_20_33 <=s (const 64 (2**20)),
    u_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_20_33 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise b
assume
neg_g_0_low60_20_low20_13 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_14 neg_f_0_low60_20_low20_13;
mov u_20_34 u_20_33;
mov v_20_34 v_20_33;

add neg_g_0_low60_20_low20_14 neg_g_0_low60_20_low20_13 neg_f_0_low60_20_low20_13;
asr neg_g_0_low60_20_low20_14 neg_g_0_low60_20_low20_14 1;
add r_20_34 r_20_33 u_20_33;
asr r_20_34 r_20_34 1;
add s_20_34 s_20_33 v_20_33;
asr s_20_34 s_20_34 1;
assert
    true
&&
    neg_f_0_low60_20_low20_14 = neg_f_0_low60_20_low20_13,
    u_20_34 = u_20_33,
    v_20_34 = v_20_33,
    neg_g_0_low60_20_low20_14 * (const 64 2) = neg_g_0_low60_20_low20_13 + neg_f_0_low60_20_low20_13,
    r_20_34 * (const 64 2) = r_20_33 + u_20_33,
    s_20_34 * (const 64 2) = s_20_33 + v_20_33
;

assume
    neg_f_0_low60_20_low20_14 = neg_f_0_low60_20_low20_13,
    u_20_34 = u_20_33,
    v_20_34 = v_20_33,
    neg_g_0_low60_20_low20_14 * 2 = neg_g_0_low60_20_low20_13 + neg_f_0_low60_20_low20_13,
    r_20_34 * 2 = r_20_33 + u_20_33,
    s_20_34 * 2 = s_20_33 + v_20_33
&&
    true
;

{
    u_20_34 * neg_f_0_low60_20_low20_0 + v_20_34 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_34 * neg_f_0_low60_20_low20_0 + s_20_34 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_14 + u_20_34 * (const 64 (2**21)) + v_20_34 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_14 + r_20_34 * (const 64 (2**21)) + s_20_34 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_14,
    neg_f_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_14,
    neg_g_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 34)) <=s delta, delta <=s (const 64 (1 + 2*34)),
    (const 64 (-(2**20))) <=s u_20_34, u_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_34, v_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_34, r_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_34, s_20_34 <=s (const 64 ((2**20)-1)),
    u_20_34 + v_20_34 <=s (const 64 (2**20)),
    u_20_34 - v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 + v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 - v_20_34 <=s (const 64 (2**20)),
    r_20_34 + s_20_34 <=s (const 64 (2**20)),
    r_20_34 - s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 + s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 - s_20_34 <=s (const 64 (2**20)),
    u_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_20_34 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_033_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_13,
sint64 neg_g_0_low60_20_low20_13,
sint64 neg_f_0_low60_20_low20_14,
sint64 neg_g_0_low60_20_low20_14,
sint64 u_20_33,
sint64 v_20_33,
sint64 r_20_33,
sint64 s_20_33,
sint64 u_20_34,
sint64 v_20_34,
sint64 r_20_34,
sint64 s_20_34,
bit ne
)={
    u_20_33 * neg_f_0_low60_20_low20_0 + v_20_33 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_13 * (-(2**20)),
    r_20_33 * neg_f_0_low60_20_low20_0 + s_20_33 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_13 * (-(2**20))
&&
    u_20_33 * neg_f_0_low60_20_low20_0 + v_20_33 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_13 * (const 64 (-(2**20))),
    r_20_33 * neg_f_0_low60_20_low20_0 + s_20_33 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_13 + u_20_33 * (const 64 (2**21)) + v_20_33 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_13 + r_20_33 * (const 64 (2**21)) + s_20_33 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_13,
    neg_f_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_13,
    neg_g_0_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 33)) <=s delta, delta <=s (const 64 (1 + 2*33)),
    (const 64 (-(2**20))) <=s u_20_33, u_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_33, v_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_33, r_20_33 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_33, s_20_33 <=s (const 64 ((2**20)-1)),
    u_20_33 + v_20_33 <=s (const 64 (2**20)),
    u_20_33 - v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 + v_20_33 <=s (const 64 (2**20)),
    (const 64 0) - u_20_33 - v_20_33 <=s (const 64 (2**20)),
    r_20_33 + s_20_33 <=s (const 64 (2**20)),
    r_20_33 - s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 + s_20_33 <=s (const 64 (2**20)),
    (const 64 0) - r_20_33 - s_20_33 <=s (const 64 (2**20)),
    u_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_20_33 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_20_33 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise c
assume
neg_g_0_low60_20_low20_13 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_14 neg_g_0_low60_20_low20_13;
mov u_20_34 r_20_33;
mov v_20_34 s_20_33;

subs dc neg_g_0_low60_20_low20_14 neg_g_0_low60_20_low20_13 neg_f_0_low60_20_low20_13;
asr neg_g_0_low60_20_low20_14 neg_g_0_low60_20_low20_14 1;
subs dc r_20_34 r_20_33 u_20_33;
asr r_20_34 r_20_34 1;
subs dc s_20_34 s_20_33 v_20_33;
asr s_20_34 s_20_34 1;
assert
    true
&&
    neg_f_0_low60_20_low20_14 = neg_g_0_low60_20_low20_13,
    u_20_34 = r_20_33,
    v_20_34 = s_20_33,
    neg_g_0_low60_20_low20_14 * (const 64 2) = neg_g_0_low60_20_low20_13 - neg_f_0_low60_20_low20_13,
    r_20_34 * (const 64 2) = r_20_33 - u_20_33,
    s_20_34 * (const 64 2) = s_20_33 - v_20_33
;

assume
    neg_f_0_low60_20_low20_14 = neg_g_0_low60_20_low20_13,
    u_20_34 = r_20_33,
    v_20_34 = s_20_33,
    neg_g_0_low60_20_low20_14 * 2 = neg_g_0_low60_20_low20_13 - neg_f_0_low60_20_low20_13,
    r_20_34 * 2 = r_20_33 - u_20_33,
    s_20_34 * 2 = s_20_33 - v_20_33
&&
    true
;

{
    u_20_34 * neg_f_0_low60_20_low20_0 + v_20_34 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_34 * neg_f_0_low60_20_low20_0 + s_20_34 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_14 + u_20_34 * (const 64 (2**21)) + v_20_34 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_14 + r_20_34 * (const 64 (2**21)) + s_20_34 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_14,
    neg_f_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_14,
    neg_g_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 34)) <=s delta, delta <=s (const 64 (1 + 2*34)),
    (const 64 (-(2**20))) <=s u_20_34, u_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_34, v_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_34, r_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_34, s_20_34 <=s (const 64 ((2**20)-1)),
    u_20_34 + v_20_34 <=s (const 64 (2**20)),
    u_20_34 - v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 + v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 - v_20_34 <=s (const 64 (2**20)),
    r_20_34 + s_20_34 <=s (const 64 (2**20)),
    r_20_34 - s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 + s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 - s_20_34 <=s (const 64 (2**20)),
    u_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_20_34 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_034_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_14,
sint64 neg_g_0_low60_20_low20_14,
sint64 neg_f_0_low60_20_low20_15,
sint64 neg_g_0_low60_20_low20_15,
sint64 u_20_34,
sint64 v_20_34,
sint64 r_20_34,
sint64 s_20_34,
sint64 u_20_35,
sint64 v_20_35,
sint64 r_20_35,
sint64 s_20_35,
bit ne
)={
    u_20_34 * neg_f_0_low60_20_low20_0 + v_20_34 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_14 * (-(2**20)),
    r_20_34 * neg_f_0_low60_20_low20_0 + s_20_34 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_14 * (-(2**20))
&&
    u_20_34 * neg_f_0_low60_20_low20_0 + v_20_34 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_14 * (const 64 (-(2**20))),
    r_20_34 * neg_f_0_low60_20_low20_0 + s_20_34 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_14 + u_20_34 * (const 64 (2**21)) + v_20_34 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_14 + r_20_34 * (const 64 (2**21)) + s_20_34 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_14,
    neg_f_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_14,
    neg_g_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 34)) <=s delta, delta <=s (const 64 (1 + 2*34)),
    (const 64 (-(2**20))) <=s u_20_34, u_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_34, v_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_34, r_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_34, s_20_34 <=s (const 64 ((2**20)-1)),
    u_20_34 + v_20_34 <=s (const 64 (2**20)),
    u_20_34 - v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 + v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 - v_20_34 <=s (const 64 (2**20)),
    r_20_34 + s_20_34 <=s (const 64 (2**20)),
    r_20_34 - s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 + s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 - s_20_34 <=s (const 64 (2**20)),
    u_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_20_34 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise a
assume
neg_g_0_low60_20_low20_14 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_15 neg_f_0_low60_20_low20_14;
mov u_20_35 u_20_34;
mov v_20_35 v_20_34;

asr neg_g_0_low60_20_low20_15 neg_g_0_low60_20_low20_14 1;
asr r_20_35 r_20_34 1;
asr s_20_35 s_20_34 1;
assert
    true
&&
    neg_f_0_low60_20_low20_15 = neg_f_0_low60_20_low20_14,
    u_20_35 = u_20_34,
    v_20_35 = v_20_34,
    neg_g_0_low60_20_low20_15 * (const 64 2) = neg_g_0_low60_20_low20_14,
    r_20_35 * (const 64 2) = r_20_34,
    s_20_35 * (const 64 2) = s_20_34
;

assume
    neg_f_0_low60_20_low20_15 = neg_f_0_low60_20_low20_14,
    u_20_35 = u_20_34,
    v_20_35 = v_20_34,
    neg_g_0_low60_20_low20_15 * 2 = neg_g_0_low60_20_low20_14,
    r_20_35 * 2 = r_20_34,
    s_20_35 * 2 = s_20_34
&&
    true
;

{
    u_20_35 * neg_f_0_low60_20_low20_0 + v_20_35 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_35 * neg_f_0_low60_20_low20_0 + s_20_35 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_15 + u_20_35 * (const 64 (2**21)) + v_20_35 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_15 + r_20_35 * (const 64 (2**21)) + s_20_35 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_15,
    neg_f_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_15,
    neg_g_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 35)) <=s delta, delta <=s (const 64 (1 + 2*35)),
    (const 64 (-(2**20))) <=s u_20_35, u_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_35, v_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_35, r_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_35, s_20_35 <=s (const 64 ((2**20)-1)),
    u_20_35 + v_20_35 <=s (const 64 (2**20)),
    u_20_35 - v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 + v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 - v_20_35 <=s (const 64 (2**20)),
    r_20_35 + s_20_35 <=s (const 64 (2**20)),
    r_20_35 - s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 + s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 - s_20_35 <=s (const 64 (2**20)),
    u_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_20_35 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_034_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_14,
sint64 neg_g_0_low60_20_low20_14,
sint64 neg_f_0_low60_20_low20_15,
sint64 neg_g_0_low60_20_low20_15,
sint64 u_20_34,
sint64 v_20_34,
sint64 r_20_34,
sint64 s_20_34,
sint64 u_20_35,
sint64 v_20_35,
sint64 r_20_35,
sint64 s_20_35,
bit ne
)={
    u_20_34 * neg_f_0_low60_20_low20_0 + v_20_34 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_14 * (-(2**20)),
    r_20_34 * neg_f_0_low60_20_low20_0 + s_20_34 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_14 * (-(2**20))
&&
    u_20_34 * neg_f_0_low60_20_low20_0 + v_20_34 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_14 * (const 64 (-(2**20))),
    r_20_34 * neg_f_0_low60_20_low20_0 + s_20_34 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_14 + u_20_34 * (const 64 (2**21)) + v_20_34 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_14 + r_20_34 * (const 64 (2**21)) + s_20_34 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_14,
    neg_f_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_14,
    neg_g_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 34)) <=s delta, delta <=s (const 64 (1 + 2*34)),
    (const 64 (-(2**20))) <=s u_20_34, u_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_34, v_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_34, r_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_34, s_20_34 <=s (const 64 ((2**20)-1)),
    u_20_34 + v_20_34 <=s (const 64 (2**20)),
    u_20_34 - v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 + v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 - v_20_34 <=s (const 64 (2**20)),
    r_20_34 + s_20_34 <=s (const 64 (2**20)),
    r_20_34 - s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 + s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 - s_20_34 <=s (const 64 (2**20)),
    u_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_20_34 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise b
assume
neg_g_0_low60_20_low20_14 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_15 neg_f_0_low60_20_low20_14;
mov u_20_35 u_20_34;
mov v_20_35 v_20_34;

add neg_g_0_low60_20_low20_15 neg_g_0_low60_20_low20_14 neg_f_0_low60_20_low20_14;
asr neg_g_0_low60_20_low20_15 neg_g_0_low60_20_low20_15 1;
add r_20_35 r_20_34 u_20_34;
asr r_20_35 r_20_35 1;
add s_20_35 s_20_34 v_20_34;
asr s_20_35 s_20_35 1;
assert
    true
&&
    neg_f_0_low60_20_low20_15 = neg_f_0_low60_20_low20_14,
    u_20_35 = u_20_34,
    v_20_35 = v_20_34,
    neg_g_0_low60_20_low20_15 * (const 64 2) = neg_g_0_low60_20_low20_14 + neg_f_0_low60_20_low20_14,
    r_20_35 * (const 64 2) = r_20_34 + u_20_34,
    s_20_35 * (const 64 2) = s_20_34 + v_20_34
;

assume
    neg_f_0_low60_20_low20_15 = neg_f_0_low60_20_low20_14,
    u_20_35 = u_20_34,
    v_20_35 = v_20_34,
    neg_g_0_low60_20_low20_15 * 2 = neg_g_0_low60_20_low20_14 + neg_f_0_low60_20_low20_14,
    r_20_35 * 2 = r_20_34 + u_20_34,
    s_20_35 * 2 = s_20_34 + v_20_34
&&
    true
;

{
    u_20_35 * neg_f_0_low60_20_low20_0 + v_20_35 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_35 * neg_f_0_low60_20_low20_0 + s_20_35 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_15 + u_20_35 * (const 64 (2**21)) + v_20_35 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_15 + r_20_35 * (const 64 (2**21)) + s_20_35 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_15,
    neg_f_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_15,
    neg_g_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 35)) <=s delta, delta <=s (const 64 (1 + 2*35)),
    (const 64 (-(2**20))) <=s u_20_35, u_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_35, v_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_35, r_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_35, s_20_35 <=s (const 64 ((2**20)-1)),
    u_20_35 + v_20_35 <=s (const 64 (2**20)),
    u_20_35 - v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 + v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 - v_20_35 <=s (const 64 (2**20)),
    r_20_35 + s_20_35 <=s (const 64 (2**20)),
    r_20_35 - s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 + s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 - s_20_35 <=s (const 64 (2**20)),
    u_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_20_35 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_034_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_14,
sint64 neg_g_0_low60_20_low20_14,
sint64 neg_f_0_low60_20_low20_15,
sint64 neg_g_0_low60_20_low20_15,
sint64 u_20_34,
sint64 v_20_34,
sint64 r_20_34,
sint64 s_20_34,
sint64 u_20_35,
sint64 v_20_35,
sint64 r_20_35,
sint64 s_20_35,
bit ne
)={
    u_20_34 * neg_f_0_low60_20_low20_0 + v_20_34 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_14 * (-(2**20)),
    r_20_34 * neg_f_0_low60_20_low20_0 + s_20_34 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_14 * (-(2**20))
&&
    u_20_34 * neg_f_0_low60_20_low20_0 + v_20_34 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_14 * (const 64 (-(2**20))),
    r_20_34 * neg_f_0_low60_20_low20_0 + s_20_34 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_14 + u_20_34 * (const 64 (2**21)) + v_20_34 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_14 + r_20_34 * (const 64 (2**21)) + s_20_34 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_14,
    neg_f_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_14,
    neg_g_0_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 34)) <=s delta, delta <=s (const 64 (1 + 2*34)),
    (const 64 (-(2**20))) <=s u_20_34, u_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_34, v_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_34, r_20_34 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_34, s_20_34 <=s (const 64 ((2**20)-1)),
    u_20_34 + v_20_34 <=s (const 64 (2**20)),
    u_20_34 - v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 + v_20_34 <=s (const 64 (2**20)),
    (const 64 0) - u_20_34 - v_20_34 <=s (const 64 (2**20)),
    r_20_34 + s_20_34 <=s (const 64 (2**20)),
    r_20_34 - s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 + s_20_34 <=s (const 64 (2**20)),
    (const 64 0) - r_20_34 - s_20_34 <=s (const 64 (2**20)),
    u_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_20_34 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_20_34 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise c
assume
neg_g_0_low60_20_low20_14 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_15 neg_g_0_low60_20_low20_14;
mov u_20_35 r_20_34;
mov v_20_35 s_20_34;

subs dc neg_g_0_low60_20_low20_15 neg_g_0_low60_20_low20_14 neg_f_0_low60_20_low20_14;
asr neg_g_0_low60_20_low20_15 neg_g_0_low60_20_low20_15 1;
subs dc r_20_35 r_20_34 u_20_34;
asr r_20_35 r_20_35 1;
subs dc s_20_35 s_20_34 v_20_34;
asr s_20_35 s_20_35 1;
assert
    true
&&
    neg_f_0_low60_20_low20_15 = neg_g_0_low60_20_low20_14,
    u_20_35 = r_20_34,
    v_20_35 = s_20_34,
    neg_g_0_low60_20_low20_15 * (const 64 2) = neg_g_0_low60_20_low20_14 - neg_f_0_low60_20_low20_14,
    r_20_35 * (const 64 2) = r_20_34 - u_20_34,
    s_20_35 * (const 64 2) = s_20_34 - v_20_34
;

assume
    neg_f_0_low60_20_low20_15 = neg_g_0_low60_20_low20_14,
    u_20_35 = r_20_34,
    v_20_35 = s_20_34,
    neg_g_0_low60_20_low20_15 * 2 = neg_g_0_low60_20_low20_14 - neg_f_0_low60_20_low20_14,
    r_20_35 * 2 = r_20_34 - u_20_34,
    s_20_35 * 2 = s_20_34 - v_20_34
&&
    true
;

{
    u_20_35 * neg_f_0_low60_20_low20_0 + v_20_35 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_35 * neg_f_0_low60_20_low20_0 + s_20_35 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_15 + u_20_35 * (const 64 (2**21)) + v_20_35 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_15 + r_20_35 * (const 64 (2**21)) + s_20_35 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_15,
    neg_f_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_15,
    neg_g_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 35)) <=s delta, delta <=s (const 64 (1 + 2*35)),
    (const 64 (-(2**20))) <=s u_20_35, u_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_35, v_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_35, r_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_35, s_20_35 <=s (const 64 ((2**20)-1)),
    u_20_35 + v_20_35 <=s (const 64 (2**20)),
    u_20_35 - v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 + v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 - v_20_35 <=s (const 64 (2**20)),
    r_20_35 + s_20_35 <=s (const 64 (2**20)),
    r_20_35 - s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 + s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 - s_20_35 <=s (const 64 (2**20)),
    u_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_20_35 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_035_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_15,
sint64 neg_g_0_low60_20_low20_15,
sint64 neg_f_0_low60_20_low20_16,
sint64 neg_g_0_low60_20_low20_16,
sint64 u_20_35,
sint64 v_20_35,
sint64 r_20_35,
sint64 s_20_35,
sint64 u_20_36,
sint64 v_20_36,
sint64 r_20_36,
sint64 s_20_36,
bit ne
)={
    u_20_35 * neg_f_0_low60_20_low20_0 + v_20_35 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_15 * (-(2**20)),
    r_20_35 * neg_f_0_low60_20_low20_0 + s_20_35 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_15 * (-(2**20))
&&
    u_20_35 * neg_f_0_low60_20_low20_0 + v_20_35 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_15 * (const 64 (-(2**20))),
    r_20_35 * neg_f_0_low60_20_low20_0 + s_20_35 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_15 + u_20_35 * (const 64 (2**21)) + v_20_35 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_15 + r_20_35 * (const 64 (2**21)) + s_20_35 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_15,
    neg_f_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_15,
    neg_g_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 35)) <=s delta, delta <=s (const 64 (1 + 2*35)),
    (const 64 (-(2**20))) <=s u_20_35, u_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_35, v_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_35, r_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_35, s_20_35 <=s (const 64 ((2**20)-1)),
    u_20_35 + v_20_35 <=s (const 64 (2**20)),
    u_20_35 - v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 + v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 - v_20_35 <=s (const 64 (2**20)),
    r_20_35 + s_20_35 <=s (const 64 (2**20)),
    r_20_35 - s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 + s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 - s_20_35 <=s (const 64 (2**20)),
    u_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_20_35 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise a
assume
neg_g_0_low60_20_low20_15 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_16 neg_f_0_low60_20_low20_15;
mov u_20_36 u_20_35;
mov v_20_36 v_20_35;

asr neg_g_0_low60_20_low20_16 neg_g_0_low60_20_low20_15 1;
asr r_20_36 r_20_35 1;
asr s_20_36 s_20_35 1;
assert
    true
&&
    neg_f_0_low60_20_low20_16 = neg_f_0_low60_20_low20_15,
    u_20_36 = u_20_35,
    v_20_36 = v_20_35,
    neg_g_0_low60_20_low20_16 * (const 64 2) = neg_g_0_low60_20_low20_15,
    r_20_36 * (const 64 2) = r_20_35,
    s_20_36 * (const 64 2) = s_20_35
;

assume
    neg_f_0_low60_20_low20_16 = neg_f_0_low60_20_low20_15,
    u_20_36 = u_20_35,
    v_20_36 = v_20_35,
    neg_g_0_low60_20_low20_16 * 2 = neg_g_0_low60_20_low20_15,
    r_20_36 * 2 = r_20_35,
    s_20_36 * 2 = s_20_35
&&
    true
;

{
    u_20_36 * neg_f_0_low60_20_low20_0 + v_20_36 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_36 * neg_f_0_low60_20_low20_0 + s_20_36 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_16 + u_20_36 * (const 64 (2**21)) + v_20_36 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_16 + r_20_36 * (const 64 (2**21)) + s_20_36 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_16,
    neg_f_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_16,
    neg_g_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 36)) <=s delta, delta <=s (const 64 (1 + 2*36)),
    (const 64 (-(2**20))) <=s u_20_36, u_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_36, v_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_36, r_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_36, s_20_36 <=s (const 64 ((2**20)-1)),
    u_20_36 + v_20_36 <=s (const 64 (2**20)),
    u_20_36 - v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 + v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 - v_20_36 <=s (const 64 (2**20)),
    r_20_36 + s_20_36 <=s (const 64 (2**20)),
    r_20_36 - s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 + s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 - s_20_36 <=s (const 64 (2**20)),
    u_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_20_36 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_035_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_15,
sint64 neg_g_0_low60_20_low20_15,
sint64 neg_f_0_low60_20_low20_16,
sint64 neg_g_0_low60_20_low20_16,
sint64 u_20_35,
sint64 v_20_35,
sint64 r_20_35,
sint64 s_20_35,
sint64 u_20_36,
sint64 v_20_36,
sint64 r_20_36,
sint64 s_20_36,
bit ne
)={
    u_20_35 * neg_f_0_low60_20_low20_0 + v_20_35 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_15 * (-(2**20)),
    r_20_35 * neg_f_0_low60_20_low20_0 + s_20_35 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_15 * (-(2**20))
&&
    u_20_35 * neg_f_0_low60_20_low20_0 + v_20_35 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_15 * (const 64 (-(2**20))),
    r_20_35 * neg_f_0_low60_20_low20_0 + s_20_35 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_15 + u_20_35 * (const 64 (2**21)) + v_20_35 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_15 + r_20_35 * (const 64 (2**21)) + s_20_35 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_15,
    neg_f_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_15,
    neg_g_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 35)) <=s delta, delta <=s (const 64 (1 + 2*35)),
    (const 64 (-(2**20))) <=s u_20_35, u_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_35, v_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_35, r_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_35, s_20_35 <=s (const 64 ((2**20)-1)),
    u_20_35 + v_20_35 <=s (const 64 (2**20)),
    u_20_35 - v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 + v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 - v_20_35 <=s (const 64 (2**20)),
    r_20_35 + s_20_35 <=s (const 64 (2**20)),
    r_20_35 - s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 + s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 - s_20_35 <=s (const 64 (2**20)),
    u_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_20_35 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise b
assume
neg_g_0_low60_20_low20_15 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_16 neg_f_0_low60_20_low20_15;
mov u_20_36 u_20_35;
mov v_20_36 v_20_35;

add neg_g_0_low60_20_low20_16 neg_g_0_low60_20_low20_15 neg_f_0_low60_20_low20_15;
asr neg_g_0_low60_20_low20_16 neg_g_0_low60_20_low20_16 1;
add r_20_36 r_20_35 u_20_35;
asr r_20_36 r_20_36 1;
add s_20_36 s_20_35 v_20_35;
asr s_20_36 s_20_36 1;
assert
    true
&&
    neg_f_0_low60_20_low20_16 = neg_f_0_low60_20_low20_15,
    u_20_36 = u_20_35,
    v_20_36 = v_20_35,
    neg_g_0_low60_20_low20_16 * (const 64 2) = neg_g_0_low60_20_low20_15 + neg_f_0_low60_20_low20_15,
    r_20_36 * (const 64 2) = r_20_35 + u_20_35,
    s_20_36 * (const 64 2) = s_20_35 + v_20_35
;

assume
    neg_f_0_low60_20_low20_16 = neg_f_0_low60_20_low20_15,
    u_20_36 = u_20_35,
    v_20_36 = v_20_35,
    neg_g_0_low60_20_low20_16 * 2 = neg_g_0_low60_20_low20_15 + neg_f_0_low60_20_low20_15,
    r_20_36 * 2 = r_20_35 + u_20_35,
    s_20_36 * 2 = s_20_35 + v_20_35
&&
    true
;

{
    u_20_36 * neg_f_0_low60_20_low20_0 + v_20_36 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_36 * neg_f_0_low60_20_low20_0 + s_20_36 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_16 + u_20_36 * (const 64 (2**21)) + v_20_36 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_16 + r_20_36 * (const 64 (2**21)) + s_20_36 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_16,
    neg_f_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_16,
    neg_g_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 36)) <=s delta, delta <=s (const 64 (1 + 2*36)),
    (const 64 (-(2**20))) <=s u_20_36, u_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_36, v_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_36, r_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_36, s_20_36 <=s (const 64 ((2**20)-1)),
    u_20_36 + v_20_36 <=s (const 64 (2**20)),
    u_20_36 - v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 + v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 - v_20_36 <=s (const 64 (2**20)),
    r_20_36 + s_20_36 <=s (const 64 (2**20)),
    r_20_36 - s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 + s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 - s_20_36 <=s (const 64 (2**20)),
    u_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_20_36 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_035_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_15,
sint64 neg_g_0_low60_20_low20_15,
sint64 neg_f_0_low60_20_low20_16,
sint64 neg_g_0_low60_20_low20_16,
sint64 u_20_35,
sint64 v_20_35,
sint64 r_20_35,
sint64 s_20_35,
sint64 u_20_36,
sint64 v_20_36,
sint64 r_20_36,
sint64 s_20_36,
bit ne
)={
    u_20_35 * neg_f_0_low60_20_low20_0 + v_20_35 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_15 * (-(2**20)),
    r_20_35 * neg_f_0_low60_20_low20_0 + s_20_35 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_15 * (-(2**20))
&&
    u_20_35 * neg_f_0_low60_20_low20_0 + v_20_35 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_15 * (const 64 (-(2**20))),
    r_20_35 * neg_f_0_low60_20_low20_0 + s_20_35 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_15 + u_20_35 * (const 64 (2**21)) + v_20_35 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_15 + r_20_35 * (const 64 (2**21)) + s_20_35 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_15,
    neg_f_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_15,
    neg_g_0_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 35)) <=s delta, delta <=s (const 64 (1 + 2*35)),
    (const 64 (-(2**20))) <=s u_20_35, u_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_35, v_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_35, r_20_35 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_35, s_20_35 <=s (const 64 ((2**20)-1)),
    u_20_35 + v_20_35 <=s (const 64 (2**20)),
    u_20_35 - v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 + v_20_35 <=s (const 64 (2**20)),
    (const 64 0) - u_20_35 - v_20_35 <=s (const 64 (2**20)),
    r_20_35 + s_20_35 <=s (const 64 (2**20)),
    r_20_35 - s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 + s_20_35 <=s (const 64 (2**20)),
    (const 64 0) - r_20_35 - s_20_35 <=s (const 64 (2**20)),
    u_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_20_35 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_20_35 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise c
assume
neg_g_0_low60_20_low20_15 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_16 neg_g_0_low60_20_low20_15;
mov u_20_36 r_20_35;
mov v_20_36 s_20_35;

subs dc neg_g_0_low60_20_low20_16 neg_g_0_low60_20_low20_15 neg_f_0_low60_20_low20_15;
asr neg_g_0_low60_20_low20_16 neg_g_0_low60_20_low20_16 1;
subs dc r_20_36 r_20_35 u_20_35;
asr r_20_36 r_20_36 1;
subs dc s_20_36 s_20_35 v_20_35;
asr s_20_36 s_20_36 1;
assert
    true
&&
    neg_f_0_low60_20_low20_16 = neg_g_0_low60_20_low20_15,
    u_20_36 = r_20_35,
    v_20_36 = s_20_35,
    neg_g_0_low60_20_low20_16 * (const 64 2) = neg_g_0_low60_20_low20_15 - neg_f_0_low60_20_low20_15,
    r_20_36 * (const 64 2) = r_20_35 - u_20_35,
    s_20_36 * (const 64 2) = s_20_35 - v_20_35
;

assume
    neg_f_0_low60_20_low20_16 = neg_g_0_low60_20_low20_15,
    u_20_36 = r_20_35,
    v_20_36 = s_20_35,
    neg_g_0_low60_20_low20_16 * 2 = neg_g_0_low60_20_low20_15 - neg_f_0_low60_20_low20_15,
    r_20_36 * 2 = r_20_35 - u_20_35,
    s_20_36 * 2 = s_20_35 - v_20_35
&&
    true
;

{
    u_20_36 * neg_f_0_low60_20_low20_0 + v_20_36 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_36 * neg_f_0_low60_20_low20_0 + s_20_36 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_16 + u_20_36 * (const 64 (2**21)) + v_20_36 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_16 + r_20_36 * (const 64 (2**21)) + s_20_36 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_16,
    neg_f_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_16,
    neg_g_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 36)) <=s delta, delta <=s (const 64 (1 + 2*36)),
    (const 64 (-(2**20))) <=s u_20_36, u_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_36, v_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_36, r_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_36, s_20_36 <=s (const 64 ((2**20)-1)),
    u_20_36 + v_20_36 <=s (const 64 (2**20)),
    u_20_36 - v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 + v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 - v_20_36 <=s (const 64 (2**20)),
    r_20_36 + s_20_36 <=s (const 64 (2**20)),
    r_20_36 - s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 + s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 - s_20_36 <=s (const 64 (2**20)),
    u_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_20_36 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_036_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_16,
sint64 neg_g_0_low60_20_low20_16,
sint64 neg_f_0_low60_20_low20_17,
sint64 neg_g_0_low60_20_low20_17,
sint64 u_20_36,
sint64 v_20_36,
sint64 r_20_36,
sint64 s_20_36,
sint64 u_20_37,
sint64 v_20_37,
sint64 r_20_37,
sint64 s_20_37,
bit ne
)={
    u_20_36 * neg_f_0_low60_20_low20_0 + v_20_36 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_16 * (-(2**20)),
    r_20_36 * neg_f_0_low60_20_low20_0 + s_20_36 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_16 * (-(2**20))
&&
    u_20_36 * neg_f_0_low60_20_low20_0 + v_20_36 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_16 * (const 64 (-(2**20))),
    r_20_36 * neg_f_0_low60_20_low20_0 + s_20_36 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_16 + u_20_36 * (const 64 (2**21)) + v_20_36 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_16 + r_20_36 * (const 64 (2**21)) + s_20_36 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_16,
    neg_f_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_16,
    neg_g_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 36)) <=s delta, delta <=s (const 64 (1 + 2*36)),
    (const 64 (-(2**20))) <=s u_20_36, u_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_36, v_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_36, r_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_36, s_20_36 <=s (const 64 ((2**20)-1)),
    u_20_36 + v_20_36 <=s (const 64 (2**20)),
    u_20_36 - v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 + v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 - v_20_36 <=s (const 64 (2**20)),
    r_20_36 + s_20_36 <=s (const 64 (2**20)),
    r_20_36 - s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 + s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 - s_20_36 <=s (const 64 (2**20)),
    u_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_20_36 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise a
assume
neg_g_0_low60_20_low20_16 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_17 neg_f_0_low60_20_low20_16;
mov u_20_37 u_20_36;
mov v_20_37 v_20_36;

asr neg_g_0_low60_20_low20_17 neg_g_0_low60_20_low20_16 1;
asr r_20_37 r_20_36 1;
asr s_20_37 s_20_36 1;
assert
    true
&&
    neg_f_0_low60_20_low20_17 = neg_f_0_low60_20_low20_16,
    u_20_37 = u_20_36,
    v_20_37 = v_20_36,
    neg_g_0_low60_20_low20_17 * (const 64 2) = neg_g_0_low60_20_low20_16,
    r_20_37 * (const 64 2) = r_20_36,
    s_20_37 * (const 64 2) = s_20_36
;

assume
    neg_f_0_low60_20_low20_17 = neg_f_0_low60_20_low20_16,
    u_20_37 = u_20_36,
    v_20_37 = v_20_36,
    neg_g_0_low60_20_low20_17 * 2 = neg_g_0_low60_20_low20_16,
    r_20_37 * 2 = r_20_36,
    s_20_37 * 2 = s_20_36
&&
    true
;

{
    u_20_37 * neg_f_0_low60_20_low20_0 + v_20_37 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_37 * neg_f_0_low60_20_low20_0 + s_20_37 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_17 + u_20_37 * (const 64 (2**21)) + v_20_37 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_17 + r_20_37 * (const 64 (2**21)) + s_20_37 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_17,
    neg_f_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_17,
    neg_g_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 37)) <=s delta, delta <=s (const 64 (1 + 2*37)),
    (const 64 (-(2**20))) <=s u_20_37, u_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_37, v_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_37, r_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_37, s_20_37 <=s (const 64 ((2**20)-1)),
    u_20_37 + v_20_37 <=s (const 64 (2**20)),
    u_20_37 - v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 + v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 - v_20_37 <=s (const 64 (2**20)),
    r_20_37 + s_20_37 <=s (const 64 (2**20)),
    r_20_37 - s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 + s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 - s_20_37 <=s (const 64 (2**20)),
    u_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_20_37 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_036_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_16,
sint64 neg_g_0_low60_20_low20_16,
sint64 neg_f_0_low60_20_low20_17,
sint64 neg_g_0_low60_20_low20_17,
sint64 u_20_36,
sint64 v_20_36,
sint64 r_20_36,
sint64 s_20_36,
sint64 u_20_37,
sint64 v_20_37,
sint64 r_20_37,
sint64 s_20_37,
bit ne
)={
    u_20_36 * neg_f_0_low60_20_low20_0 + v_20_36 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_16 * (-(2**20)),
    r_20_36 * neg_f_0_low60_20_low20_0 + s_20_36 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_16 * (-(2**20))
&&
    u_20_36 * neg_f_0_low60_20_low20_0 + v_20_36 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_16 * (const 64 (-(2**20))),
    r_20_36 * neg_f_0_low60_20_low20_0 + s_20_36 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_16 + u_20_36 * (const 64 (2**21)) + v_20_36 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_16 + r_20_36 * (const 64 (2**21)) + s_20_36 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_16,
    neg_f_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_16,
    neg_g_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 36)) <=s delta, delta <=s (const 64 (1 + 2*36)),
    (const 64 (-(2**20))) <=s u_20_36, u_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_36, v_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_36, r_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_36, s_20_36 <=s (const 64 ((2**20)-1)),
    u_20_36 + v_20_36 <=s (const 64 (2**20)),
    u_20_36 - v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 + v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 - v_20_36 <=s (const 64 (2**20)),
    r_20_36 + s_20_36 <=s (const 64 (2**20)),
    r_20_36 - s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 + s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 - s_20_36 <=s (const 64 (2**20)),
    u_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_20_36 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise b
assume
neg_g_0_low60_20_low20_16 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_17 neg_f_0_low60_20_low20_16;
mov u_20_37 u_20_36;
mov v_20_37 v_20_36;

add neg_g_0_low60_20_low20_17 neg_g_0_low60_20_low20_16 neg_f_0_low60_20_low20_16;
asr neg_g_0_low60_20_low20_17 neg_g_0_low60_20_low20_17 1;
add r_20_37 r_20_36 u_20_36;
asr r_20_37 r_20_37 1;
add s_20_37 s_20_36 v_20_36;
asr s_20_37 s_20_37 1;
assert
    true
&&
    neg_f_0_low60_20_low20_17 = neg_f_0_low60_20_low20_16,
    u_20_37 = u_20_36,
    v_20_37 = v_20_36,
    neg_g_0_low60_20_low20_17 * (const 64 2) = neg_g_0_low60_20_low20_16 + neg_f_0_low60_20_low20_16,
    r_20_37 * (const 64 2) = r_20_36 + u_20_36,
    s_20_37 * (const 64 2) = s_20_36 + v_20_36
;

assume
    neg_f_0_low60_20_low20_17 = neg_f_0_low60_20_low20_16,
    u_20_37 = u_20_36,
    v_20_37 = v_20_36,
    neg_g_0_low60_20_low20_17 * 2 = neg_g_0_low60_20_low20_16 + neg_f_0_low60_20_low20_16,
    r_20_37 * 2 = r_20_36 + u_20_36,
    s_20_37 * 2 = s_20_36 + v_20_36
&&
    true
;

{
    u_20_37 * neg_f_0_low60_20_low20_0 + v_20_37 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_37 * neg_f_0_low60_20_low20_0 + s_20_37 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_17 + u_20_37 * (const 64 (2**21)) + v_20_37 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_17 + r_20_37 * (const 64 (2**21)) + s_20_37 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_17,
    neg_f_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_17,
    neg_g_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 37)) <=s delta, delta <=s (const 64 (1 + 2*37)),
    (const 64 (-(2**20))) <=s u_20_37, u_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_37, v_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_37, r_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_37, s_20_37 <=s (const 64 ((2**20)-1)),
    u_20_37 + v_20_37 <=s (const 64 (2**20)),
    u_20_37 - v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 + v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 - v_20_37 <=s (const 64 (2**20)),
    r_20_37 + s_20_37 <=s (const 64 (2**20)),
    r_20_37 - s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 + s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 - s_20_37 <=s (const 64 (2**20)),
    u_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_20_37 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_036_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_16,
sint64 neg_g_0_low60_20_low20_16,
sint64 neg_f_0_low60_20_low20_17,
sint64 neg_g_0_low60_20_low20_17,
sint64 u_20_36,
sint64 v_20_36,
sint64 r_20_36,
sint64 s_20_36,
sint64 u_20_37,
sint64 v_20_37,
sint64 r_20_37,
sint64 s_20_37,
bit ne
)={
    u_20_36 * neg_f_0_low60_20_low20_0 + v_20_36 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_16 * (-(2**20)),
    r_20_36 * neg_f_0_low60_20_low20_0 + s_20_36 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_16 * (-(2**20))
&&
    u_20_36 * neg_f_0_low60_20_low20_0 + v_20_36 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_16 * (const 64 (-(2**20))),
    r_20_36 * neg_f_0_low60_20_low20_0 + s_20_36 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_16 + u_20_36 * (const 64 (2**21)) + v_20_36 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_16 + r_20_36 * (const 64 (2**21)) + s_20_36 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_16,
    neg_f_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_16,
    neg_g_0_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 36)) <=s delta, delta <=s (const 64 (1 + 2*36)),
    (const 64 (-(2**20))) <=s u_20_36, u_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_36, v_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_36, r_20_36 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_36, s_20_36 <=s (const 64 ((2**20)-1)),
    u_20_36 + v_20_36 <=s (const 64 (2**20)),
    u_20_36 - v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 + v_20_36 <=s (const 64 (2**20)),
    (const 64 0) - u_20_36 - v_20_36 <=s (const 64 (2**20)),
    r_20_36 + s_20_36 <=s (const 64 (2**20)),
    r_20_36 - s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 + s_20_36 <=s (const 64 (2**20)),
    (const 64 0) - r_20_36 - s_20_36 <=s (const 64 (2**20)),
    u_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_20_36 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_20_36 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise c
assume
neg_g_0_low60_20_low20_16 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_17 neg_g_0_low60_20_low20_16;
mov u_20_37 r_20_36;
mov v_20_37 s_20_36;

subs dc neg_g_0_low60_20_low20_17 neg_g_0_low60_20_low20_16 neg_f_0_low60_20_low20_16;
asr neg_g_0_low60_20_low20_17 neg_g_0_low60_20_low20_17 1;
subs dc r_20_37 r_20_36 u_20_36;
asr r_20_37 r_20_37 1;
subs dc s_20_37 s_20_36 v_20_36;
asr s_20_37 s_20_37 1;
assert
    true
&&
    neg_f_0_low60_20_low20_17 = neg_g_0_low60_20_low20_16,
    u_20_37 = r_20_36,
    v_20_37 = s_20_36,
    neg_g_0_low60_20_low20_17 * (const 64 2) = neg_g_0_low60_20_low20_16 - neg_f_0_low60_20_low20_16,
    r_20_37 * (const 64 2) = r_20_36 - u_20_36,
    s_20_37 * (const 64 2) = s_20_36 - v_20_36
;

assume
    neg_f_0_low60_20_low20_17 = neg_g_0_low60_20_low20_16,
    u_20_37 = r_20_36,
    v_20_37 = s_20_36,
    neg_g_0_low60_20_low20_17 * 2 = neg_g_0_low60_20_low20_16 - neg_f_0_low60_20_low20_16,
    r_20_37 * 2 = r_20_36 - u_20_36,
    s_20_37 * 2 = s_20_36 - v_20_36
&&
    true
;

{
    u_20_37 * neg_f_0_low60_20_low20_0 + v_20_37 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_37 * neg_f_0_low60_20_low20_0 + s_20_37 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_17 + u_20_37 * (const 64 (2**21)) + v_20_37 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_17 + r_20_37 * (const 64 (2**21)) + s_20_37 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_17,
    neg_f_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_17,
    neg_g_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 37)) <=s delta, delta <=s (const 64 (1 + 2*37)),
    (const 64 (-(2**20))) <=s u_20_37, u_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_37, v_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_37, r_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_37, s_20_37 <=s (const 64 ((2**20)-1)),
    u_20_37 + v_20_37 <=s (const 64 (2**20)),
    u_20_37 - v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 + v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 - v_20_37 <=s (const 64 (2**20)),
    r_20_37 + s_20_37 <=s (const 64 (2**20)),
    r_20_37 - s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 + s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 - s_20_37 <=s (const 64 (2**20)),
    u_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_20_37 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_037_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_17,
sint64 neg_g_0_low60_20_low20_17,
sint64 neg_f_0_low60_20_low20_18,
sint64 neg_g_0_low60_20_low20_18,
sint64 u_20_37,
sint64 v_20_37,
sint64 r_20_37,
sint64 s_20_37,
sint64 u_20_38,
sint64 v_20_38,
sint64 r_20_38,
sint64 s_20_38,
bit ne
)={
    u_20_37 * neg_f_0_low60_20_low20_0 + v_20_37 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_17 * (-(2**20)),
    r_20_37 * neg_f_0_low60_20_low20_0 + s_20_37 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_17 * (-(2**20))
&&
    u_20_37 * neg_f_0_low60_20_low20_0 + v_20_37 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_17 * (const 64 (-(2**20))),
    r_20_37 * neg_f_0_low60_20_low20_0 + s_20_37 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_17 + u_20_37 * (const 64 (2**21)) + v_20_37 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_17 + r_20_37 * (const 64 (2**21)) + s_20_37 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_17,
    neg_f_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_17,
    neg_g_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 37)) <=s delta, delta <=s (const 64 (1 + 2*37)),
    (const 64 (-(2**20))) <=s u_20_37, u_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_37, v_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_37, r_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_37, s_20_37 <=s (const 64 ((2**20)-1)),
    u_20_37 + v_20_37 <=s (const 64 (2**20)),
    u_20_37 - v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 + v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 - v_20_37 <=s (const 64 (2**20)),
    r_20_37 + s_20_37 <=s (const 64 (2**20)),
    r_20_37 - s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 + s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 - s_20_37 <=s (const 64 (2**20)),
    u_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_20_37 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise a
assume
neg_g_0_low60_20_low20_17 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_18 neg_f_0_low60_20_low20_17;
mov u_20_38 u_20_37;
mov v_20_38 v_20_37;

asr neg_g_0_low60_20_low20_18 neg_g_0_low60_20_low20_17 1;
asr r_20_38 r_20_37 1;
asr s_20_38 s_20_37 1;
assert
    true
&&
    neg_f_0_low60_20_low20_18 = neg_f_0_low60_20_low20_17,
    u_20_38 = u_20_37,
    v_20_38 = v_20_37,
    neg_g_0_low60_20_low20_18 * (const 64 2) = neg_g_0_low60_20_low20_17,
    r_20_38 * (const 64 2) = r_20_37,
    s_20_38 * (const 64 2) = s_20_37
;

assume
    neg_f_0_low60_20_low20_18 = neg_f_0_low60_20_low20_17,
    u_20_38 = u_20_37,
    v_20_38 = v_20_37,
    neg_g_0_low60_20_low20_18 * 2 = neg_g_0_low60_20_low20_17,
    r_20_38 * 2 = r_20_37,
    s_20_38 * 2 = s_20_37
&&
    true
;

{
    u_20_38 * neg_f_0_low60_20_low20_0 + v_20_38 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_38 * neg_f_0_low60_20_low20_0 + s_20_38 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_18 + u_20_38 * (const 64 (2**21)) + v_20_38 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_18 + r_20_38 * (const 64 (2**21)) + s_20_38 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_18,
    neg_f_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_18,
    neg_g_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 38)) <=s delta, delta <=s (const 64 (1 + 2*38)),
    (const 64 (-(2**20))) <=s u_20_38, u_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_38, v_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_38, r_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_38, s_20_38 <=s (const 64 ((2**20)-1)),
    u_20_38 + v_20_38 <=s (const 64 (2**20)),
    u_20_38 - v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 + v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 - v_20_38 <=s (const 64 (2**20)),
    r_20_38 + s_20_38 <=s (const 64 (2**20)),
    r_20_38 - s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 + s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 - s_20_38 <=s (const 64 (2**20)),
    u_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_20_38 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_037_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_17,
sint64 neg_g_0_low60_20_low20_17,
sint64 neg_f_0_low60_20_low20_18,
sint64 neg_g_0_low60_20_low20_18,
sint64 u_20_37,
sint64 v_20_37,
sint64 r_20_37,
sint64 s_20_37,
sint64 u_20_38,
sint64 v_20_38,
sint64 r_20_38,
sint64 s_20_38,
bit ne
)={
    u_20_37 * neg_f_0_low60_20_low20_0 + v_20_37 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_17 * (-(2**20)),
    r_20_37 * neg_f_0_low60_20_low20_0 + s_20_37 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_17 * (-(2**20))
&&
    u_20_37 * neg_f_0_low60_20_low20_0 + v_20_37 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_17 * (const 64 (-(2**20))),
    r_20_37 * neg_f_0_low60_20_low20_0 + s_20_37 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_17 + u_20_37 * (const 64 (2**21)) + v_20_37 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_17 + r_20_37 * (const 64 (2**21)) + s_20_37 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_17,
    neg_f_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_17,
    neg_g_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 37)) <=s delta, delta <=s (const 64 (1 + 2*37)),
    (const 64 (-(2**20))) <=s u_20_37, u_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_37, v_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_37, r_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_37, s_20_37 <=s (const 64 ((2**20)-1)),
    u_20_37 + v_20_37 <=s (const 64 (2**20)),
    u_20_37 - v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 + v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 - v_20_37 <=s (const 64 (2**20)),
    r_20_37 + s_20_37 <=s (const 64 (2**20)),
    r_20_37 - s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 + s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 - s_20_37 <=s (const 64 (2**20)),
    u_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_20_37 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise b
assume
neg_g_0_low60_20_low20_17 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_18 neg_f_0_low60_20_low20_17;
mov u_20_38 u_20_37;
mov v_20_38 v_20_37;

add neg_g_0_low60_20_low20_18 neg_g_0_low60_20_low20_17 neg_f_0_low60_20_low20_17;
asr neg_g_0_low60_20_low20_18 neg_g_0_low60_20_low20_18 1;
add r_20_38 r_20_37 u_20_37;
asr r_20_38 r_20_38 1;
add s_20_38 s_20_37 v_20_37;
asr s_20_38 s_20_38 1;
assert
    true
&&
    neg_f_0_low60_20_low20_18 = neg_f_0_low60_20_low20_17,
    u_20_38 = u_20_37,
    v_20_38 = v_20_37,
    neg_g_0_low60_20_low20_18 * (const 64 2) = neg_g_0_low60_20_low20_17 + neg_f_0_low60_20_low20_17,
    r_20_38 * (const 64 2) = r_20_37 + u_20_37,
    s_20_38 * (const 64 2) = s_20_37 + v_20_37
;

assume
    neg_f_0_low60_20_low20_18 = neg_f_0_low60_20_low20_17,
    u_20_38 = u_20_37,
    v_20_38 = v_20_37,
    neg_g_0_low60_20_low20_18 * 2 = neg_g_0_low60_20_low20_17 + neg_f_0_low60_20_low20_17,
    r_20_38 * 2 = r_20_37 + u_20_37,
    s_20_38 * 2 = s_20_37 + v_20_37
&&
    true
;

{
    u_20_38 * neg_f_0_low60_20_low20_0 + v_20_38 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_38 * neg_f_0_low60_20_low20_0 + s_20_38 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_18 + u_20_38 * (const 64 (2**21)) + v_20_38 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_18 + r_20_38 * (const 64 (2**21)) + s_20_38 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_18,
    neg_f_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_18,
    neg_g_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 38)) <=s delta, delta <=s (const 64 (1 + 2*38)),
    (const 64 (-(2**20))) <=s u_20_38, u_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_38, v_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_38, r_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_38, s_20_38 <=s (const 64 ((2**20)-1)),
    u_20_38 + v_20_38 <=s (const 64 (2**20)),
    u_20_38 - v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 + v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 - v_20_38 <=s (const 64 (2**20)),
    r_20_38 + s_20_38 <=s (const 64 (2**20)),
    r_20_38 - s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 + s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 - s_20_38 <=s (const 64 (2**20)),
    u_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_20_38 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_037_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_17,
sint64 neg_g_0_low60_20_low20_17,
sint64 neg_f_0_low60_20_low20_18,
sint64 neg_g_0_low60_20_low20_18,
sint64 u_20_37,
sint64 v_20_37,
sint64 r_20_37,
sint64 s_20_37,
sint64 u_20_38,
sint64 v_20_38,
sint64 r_20_38,
sint64 s_20_38,
bit ne
)={
    u_20_37 * neg_f_0_low60_20_low20_0 + v_20_37 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_17 * (-(2**20)),
    r_20_37 * neg_f_0_low60_20_low20_0 + s_20_37 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_17 * (-(2**20))
&&
    u_20_37 * neg_f_0_low60_20_low20_0 + v_20_37 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_17 * (const 64 (-(2**20))),
    r_20_37 * neg_f_0_low60_20_low20_0 + s_20_37 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_17 + u_20_37 * (const 64 (2**21)) + v_20_37 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_17 + r_20_37 * (const 64 (2**21)) + s_20_37 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_17,
    neg_f_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_17,
    neg_g_0_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 37)) <=s delta, delta <=s (const 64 (1 + 2*37)),
    (const 64 (-(2**20))) <=s u_20_37, u_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_37, v_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_37, r_20_37 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_37, s_20_37 <=s (const 64 ((2**20)-1)),
    u_20_37 + v_20_37 <=s (const 64 (2**20)),
    u_20_37 - v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 + v_20_37 <=s (const 64 (2**20)),
    (const 64 0) - u_20_37 - v_20_37 <=s (const 64 (2**20)),
    r_20_37 + s_20_37 <=s (const 64 (2**20)),
    r_20_37 - s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 + s_20_37 <=s (const 64 (2**20)),
    (const 64 0) - r_20_37 - s_20_37 <=s (const 64 (2**20)),
    u_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_20_37 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_20_37 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise c
assume
neg_g_0_low60_20_low20_17 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_18 neg_g_0_low60_20_low20_17;
mov u_20_38 r_20_37;
mov v_20_38 s_20_37;

subs dc neg_g_0_low60_20_low20_18 neg_g_0_low60_20_low20_17 neg_f_0_low60_20_low20_17;
asr neg_g_0_low60_20_low20_18 neg_g_0_low60_20_low20_18 1;
subs dc r_20_38 r_20_37 u_20_37;
asr r_20_38 r_20_38 1;
subs dc s_20_38 s_20_37 v_20_37;
asr s_20_38 s_20_38 1;
assert
    true
&&
    neg_f_0_low60_20_low20_18 = neg_g_0_low60_20_low20_17,
    u_20_38 = r_20_37,
    v_20_38 = s_20_37,
    neg_g_0_low60_20_low20_18 * (const 64 2) = neg_g_0_low60_20_low20_17 - neg_f_0_low60_20_low20_17,
    r_20_38 * (const 64 2) = r_20_37 - u_20_37,
    s_20_38 * (const 64 2) = s_20_37 - v_20_37
;

assume
    neg_f_0_low60_20_low20_18 = neg_g_0_low60_20_low20_17,
    u_20_38 = r_20_37,
    v_20_38 = s_20_37,
    neg_g_0_low60_20_low20_18 * 2 = neg_g_0_low60_20_low20_17 - neg_f_0_low60_20_low20_17,
    r_20_38 * 2 = r_20_37 - u_20_37,
    s_20_38 * 2 = s_20_37 - v_20_37
&&
    true
;

{
    u_20_38 * neg_f_0_low60_20_low20_0 + v_20_38 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_38 * neg_f_0_low60_20_low20_0 + s_20_38 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_18 + u_20_38 * (const 64 (2**21)) + v_20_38 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_18 + r_20_38 * (const 64 (2**21)) + s_20_38 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_18,
    neg_f_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_18,
    neg_g_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 38)) <=s delta, delta <=s (const 64 (1 + 2*38)),
    (const 64 (-(2**20))) <=s u_20_38, u_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_38, v_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_38, r_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_38, s_20_38 <=s (const 64 ((2**20)-1)),
    u_20_38 + v_20_38 <=s (const 64 (2**20)),
    u_20_38 - v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 + v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 - v_20_38 <=s (const 64 (2**20)),
    r_20_38 + s_20_38 <=s (const 64 (2**20)),
    r_20_38 - s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 + s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 - s_20_38 <=s (const 64 (2**20)),
    u_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_20_38 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_038_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_18,
sint64 neg_g_0_low60_20_low20_18,
sint64 neg_f_0_low60_20_low20_19,
sint64 neg_g_0_low60_20_low20_19,
sint64 u_20_38,
sint64 v_20_38,
sint64 r_20_38,
sint64 s_20_38,
sint64 u_20_39,
sint64 v_20_39,
sint64 r_20_39,
sint64 s_20_39,
bit ne
)={
    u_20_38 * neg_f_0_low60_20_low20_0 + v_20_38 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_18 * (-(2**20)),
    r_20_38 * neg_f_0_low60_20_low20_0 + s_20_38 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_18 * (-(2**20))
&&
    u_20_38 * neg_f_0_low60_20_low20_0 + v_20_38 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_18 * (const 64 (-(2**20))),
    r_20_38 * neg_f_0_low60_20_low20_0 + s_20_38 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_18 + u_20_38 * (const 64 (2**21)) + v_20_38 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_18 + r_20_38 * (const 64 (2**21)) + s_20_38 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_18,
    neg_f_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_18,
    neg_g_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 38)) <=s delta, delta <=s (const 64 (1 + 2*38)),
    (const 64 (-(2**20))) <=s u_20_38, u_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_38, v_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_38, r_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_38, s_20_38 <=s (const 64 ((2**20)-1)),
    u_20_38 + v_20_38 <=s (const 64 (2**20)),
    u_20_38 - v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 + v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 - v_20_38 <=s (const 64 (2**20)),
    r_20_38 + s_20_38 <=s (const 64 (2**20)),
    r_20_38 - s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 + s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 - s_20_38 <=s (const 64 (2**20)),
    u_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_20_38 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise a
assume
neg_g_0_low60_20_low20_18 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_0_low60_20_low20_19 neg_f_0_low60_20_low20_18;
mov u_20_39 u_20_38;
mov v_20_39 v_20_38;

asr neg_g_0_low60_20_low20_19 neg_g_0_low60_20_low20_18 1;
asr r_20_39 r_20_38 1;
asr s_20_39 s_20_38 1;
assert
    true
&&
    neg_f_0_low60_20_low20_19 = neg_f_0_low60_20_low20_18,
    u_20_39 = u_20_38,
    v_20_39 = v_20_38,
    neg_g_0_low60_20_low20_19 * (const 64 2) = neg_g_0_low60_20_low20_18,
    r_20_39 * (const 64 2) = r_20_38,
    s_20_39 * (const 64 2) = s_20_38
;

assume
    neg_f_0_low60_20_low20_19 = neg_f_0_low60_20_low20_18,
    u_20_39 = u_20_38,
    v_20_39 = v_20_38,
    neg_g_0_low60_20_low20_19 * 2 = neg_g_0_low60_20_low20_18,
    r_20_39 * 2 = r_20_38,
    s_20_39 * 2 = s_20_38
&&
    true
;

{
    u_20_39 * neg_f_0_low60_20_low20_0 + v_20_39 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_39 * neg_f_0_low60_20_low20_0 + s_20_39 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_19 + u_20_39 * (const 64 (2**21)) + v_20_39 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_19 + r_20_39 * (const 64 (2**21)) + s_20_39 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_19,
    neg_f_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_19,
    neg_g_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 39)) <=s delta, delta <=s (const 64 (1 + 2*39)),
    (const 64 (-(2**20))) <=s u_20_39, u_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_39, v_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_39, r_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_39, s_20_39 <=s (const 64 ((2**20)-1)),
    u_20_39 + v_20_39 <=s (const 64 (2**20)),
    u_20_39 - v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 + v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 - v_20_39 <=s (const 64 (2**20)),
    r_20_39 + s_20_39 <=s (const 64 (2**20)),
    r_20_39 - s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 + s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 - s_20_39 <=s (const 64 (2**20)),
    u_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_20_39 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_038_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_18,
sint64 neg_g_0_low60_20_low20_18,
sint64 neg_f_0_low60_20_low20_19,
sint64 neg_g_0_low60_20_low20_19,
sint64 u_20_38,
sint64 v_20_38,
sint64 r_20_38,
sint64 s_20_38,
sint64 u_20_39,
sint64 v_20_39,
sint64 r_20_39,
sint64 s_20_39,
bit ne
)={
    u_20_38 * neg_f_0_low60_20_low20_0 + v_20_38 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_18 * (-(2**20)),
    r_20_38 * neg_f_0_low60_20_low20_0 + s_20_38 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_18 * (-(2**20))
&&
    u_20_38 * neg_f_0_low60_20_low20_0 + v_20_38 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_18 * (const 64 (-(2**20))),
    r_20_38 * neg_f_0_low60_20_low20_0 + s_20_38 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_18 + u_20_38 * (const 64 (2**21)) + v_20_38 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_18 + r_20_38 * (const 64 (2**21)) + s_20_38 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_18,
    neg_f_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_18,
    neg_g_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 38)) <=s delta, delta <=s (const 64 (1 + 2*38)),
    (const 64 (-(2**20))) <=s u_20_38, u_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_38, v_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_38, r_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_38, s_20_38 <=s (const 64 ((2**20)-1)),
    u_20_38 + v_20_38 <=s (const 64 (2**20)),
    u_20_38 - v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 + v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 - v_20_38 <=s (const 64 (2**20)),
    r_20_38 + s_20_38 <=s (const 64 (2**20)),
    r_20_38 - s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 + s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 - s_20_38 <=s (const 64 (2**20)),
    u_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_20_38 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise b
assume
neg_g_0_low60_20_low20_18 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_19 neg_f_0_low60_20_low20_18;
mov u_20_39 u_20_38;
mov v_20_39 v_20_38;

add neg_g_0_low60_20_low20_19 neg_g_0_low60_20_low20_18 neg_f_0_low60_20_low20_18;
asr neg_g_0_low60_20_low20_19 neg_g_0_low60_20_low20_19 1;
add r_20_39 r_20_38 u_20_38;
asr r_20_39 r_20_39 1;
add s_20_39 s_20_38 v_20_38;
asr s_20_39 s_20_39 1;
assert
    true
&&
    neg_f_0_low60_20_low20_19 = neg_f_0_low60_20_low20_18,
    u_20_39 = u_20_38,
    v_20_39 = v_20_38,
    neg_g_0_low60_20_low20_19 * (const 64 2) = neg_g_0_low60_20_low20_18 + neg_f_0_low60_20_low20_18,
    r_20_39 * (const 64 2) = r_20_38 + u_20_38,
    s_20_39 * (const 64 2) = s_20_38 + v_20_38
;

assume
    neg_f_0_low60_20_low20_19 = neg_f_0_low60_20_low20_18,
    u_20_39 = u_20_38,
    v_20_39 = v_20_38,
    neg_g_0_low60_20_low20_19 * 2 = neg_g_0_low60_20_low20_18 + neg_f_0_low60_20_low20_18,
    r_20_39 * 2 = r_20_38 + u_20_38,
    s_20_39 * 2 = s_20_38 + v_20_38
&&
    true
;

{
    u_20_39 * neg_f_0_low60_20_low20_0 + v_20_39 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_39 * neg_f_0_low60_20_low20_0 + s_20_39 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_19 + u_20_39 * (const 64 (2**21)) + v_20_39 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_19 + r_20_39 * (const 64 (2**21)) + s_20_39 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_19,
    neg_f_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_19,
    neg_g_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 39)) <=s delta, delta <=s (const 64 (1 + 2*39)),
    (const 64 (-(2**20))) <=s u_20_39, u_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_39, v_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_39, r_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_39, s_20_39 <=s (const 64 ((2**20)-1)),
    u_20_39 + v_20_39 <=s (const 64 (2**20)),
    u_20_39 - v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 + v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 - v_20_39 <=s (const 64 (2**20)),
    r_20_39 + s_20_39 <=s (const 64 (2**20)),
    r_20_39 - s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 + s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 - s_20_39 <=s (const 64 (2**20)),
    u_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_20_39 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_038_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_18,
sint64 neg_g_0_low60_20_low20_18,
sint64 neg_f_0_low60_20_low20_19,
sint64 neg_g_0_low60_20_low20_19,
sint64 u_20_38,
sint64 v_20_38,
sint64 r_20_38,
sint64 s_20_38,
sint64 u_20_39,
sint64 v_20_39,
sint64 r_20_39,
sint64 s_20_39,
bit ne
)={
    u_20_38 * neg_f_0_low60_20_low20_0 + v_20_38 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_18 * (-(2**20)),
    r_20_38 * neg_f_0_low60_20_low20_0 + s_20_38 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_18 * (-(2**20))
&&
    u_20_38 * neg_f_0_low60_20_low20_0 + v_20_38 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_18 * (const 64 (-(2**20))),
    r_20_38 * neg_f_0_low60_20_low20_0 + s_20_38 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_18 + u_20_38 * (const 64 (2**21)) + v_20_38 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_18 + r_20_38 * (const 64 (2**21)) + s_20_38 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_18,
    neg_f_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_18,
    neg_g_0_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 38)) <=s delta, delta <=s (const 64 (1 + 2*38)),
    (const 64 (-(2**20))) <=s u_20_38, u_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_38, v_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_38, r_20_38 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_38, s_20_38 <=s (const 64 ((2**20)-1)),
    u_20_38 + v_20_38 <=s (const 64 (2**20)),
    u_20_38 - v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 + v_20_38 <=s (const 64 (2**20)),
    (const 64 0) - u_20_38 - v_20_38 <=s (const 64 (2**20)),
    r_20_38 + s_20_38 <=s (const 64 (2**20)),
    r_20_38 - s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 + s_20_38 <=s (const 64 (2**20)),
    (const 64 0) - r_20_38 - s_20_38 <=s (const 64 (2**20)),
    u_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_20_38 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_20_38 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise c
assume
neg_g_0_low60_20_low20_18 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_19 neg_g_0_low60_20_low20_18;
mov u_20_39 r_20_38;
mov v_20_39 s_20_38;

subs dc neg_g_0_low60_20_low20_19 neg_g_0_low60_20_low20_18 neg_f_0_low60_20_low20_18;
asr neg_g_0_low60_20_low20_19 neg_g_0_low60_20_low20_19 1;
subs dc r_20_39 r_20_38 u_20_38;
asr r_20_39 r_20_39 1;
subs dc s_20_39 s_20_38 v_20_38;
asr s_20_39 s_20_39 1;
assert
    true
&&
    neg_f_0_low60_20_low20_19 = neg_g_0_low60_20_low20_18,
    u_20_39 = r_20_38,
    v_20_39 = s_20_38,
    neg_g_0_low60_20_low20_19 * (const 64 2) = neg_g_0_low60_20_low20_18 - neg_f_0_low60_20_low20_18,
    r_20_39 * (const 64 2) = r_20_38 - u_20_38,
    s_20_39 * (const 64 2) = s_20_38 - v_20_38
;

assume
    neg_f_0_low60_20_low20_19 = neg_g_0_low60_20_low20_18,
    u_20_39 = r_20_38,
    v_20_39 = s_20_38,
    neg_g_0_low60_20_low20_19 * 2 = neg_g_0_low60_20_low20_18 - neg_f_0_low60_20_low20_18,
    r_20_39 * 2 = r_20_38 - u_20_38,
    s_20_39 * 2 = s_20_38 - v_20_38
&&
    true
;

{
    u_20_39 * neg_f_0_low60_20_low20_0 + v_20_39 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_39 * neg_f_0_low60_20_low20_0 + s_20_39 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_19 + u_20_39 * (const 64 (2**21)) + v_20_39 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_19 + r_20_39 * (const 64 (2**21)) + s_20_39 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_19,
    neg_f_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_19,
    neg_g_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 39)) <=s delta, delta <=s (const 64 (1 + 2*39)),
    (const 64 (-(2**20))) <=s u_20_39, u_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_39, v_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_39, r_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_39, s_20_39 <=s (const 64 ((2**20)-1)),
    u_20_39 + v_20_39 <=s (const 64 (2**20)),
    u_20_39 - v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 + v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 - v_20_39 <=s (const 64 (2**20)),
    r_20_39 + s_20_39 <=s (const 64 (2**20)),
    r_20_39 - s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 + s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 - s_20_39 <=s (const 64 (2**20)),
    u_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_20_39 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_039_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_19,
sint64 neg_g_0_low60_20_low20_19,
sint64 neg_f_0_low60_20_low20_20,
sint64 neg_g_0_low60_20_low20_20,
sint64 u_20_39,
sint64 v_20_39,
sint64 r_20_39,
sint64 s_20_39,
sint64 u_20_40,
sint64 v_20_40,
sint64 r_20_40,
sint64 s_20_40,
bit ne
)={
    u_20_39 * neg_f_0_low60_20_low20_0 + v_20_39 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_19 * (-(2**20)),
    r_20_39 * neg_f_0_low60_20_low20_0 + s_20_39 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_19 * (-(2**20))
&&
    u_20_39 * neg_f_0_low60_20_low20_0 + v_20_39 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_19 * (const 64 (-(2**20))),
    r_20_39 * neg_f_0_low60_20_low20_0 + s_20_39 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_19 + u_20_39 * (const 64 (2**21)) + v_20_39 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_19 + r_20_39 * (const 64 (2**21)) + s_20_39 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_19,
    neg_f_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_19,
    neg_g_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 39)) <=s delta, delta <=s (const 64 (1 + 2*39)),
    (const 64 (-(2**20))) <=s u_20_39, u_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_39, v_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_39, r_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_39, s_20_39 <=s (const 64 ((2**20)-1)),
    u_20_39 + v_20_39 <=s (const 64 (2**20)),
    u_20_39 - v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 + v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 - v_20_39 <=s (const 64 (2**20)),
    r_20_39 + s_20_39 <=s (const 64 (2**20)),
    r_20_39 - s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 + s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 - s_20_39 <=s (const 64 (2**20)),
    u_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_20_39 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise a
assume
neg_g_0_low60_20_low20_19 = 0 (mod 2)
&&
neg_g_0_low60_20_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov neg_f_0_low60_20_low20_20 neg_f_0_low60_20_low20_19;
mov u_20_40 u_20_39;
mov v_20_40 v_20_39;

asr neg_g_0_low60_20_low20_20 neg_g_0_low60_20_low20_19 1;
asr r_20_40 r_20_39 1;
asr s_20_40 s_20_39 1;
assert
    true
&&
    neg_f_0_low60_20_low20_20 = neg_f_0_low60_20_low20_19,
    u_20_40 = u_20_39,
    v_20_40 = v_20_39,
    neg_g_0_low60_20_low20_20 * (const 64 2) = neg_g_0_low60_20_low20_19,
    r_20_40 * (const 64 2) = r_20_39,
    s_20_40 * (const 64 2) = s_20_39
;

assume
    neg_f_0_low60_20_low20_20 = neg_f_0_low60_20_low20_19,
    u_20_40 = u_20_39,
    v_20_40 = v_20_39,
    neg_g_0_low60_20_low20_20 * 2 = neg_g_0_low60_20_low20_19,
    r_20_40 * 2 = r_20_39,
    s_20_40 * 2 = s_20_39
&&
    true
;

{
    u_20_40 * neg_f_0_low60_20_low20_0 + v_20_40 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_40 * neg_f_0_low60_20_low20_0 + s_20_40 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_20 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_20 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_20,
    neg_f_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_20,
    neg_g_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 40)) <=s delta, delta <=s (const 64 (1 + 2*40)),
    (const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20)-1)),
    u_20_40 + v_20_40 <=s (const 64 (2**20)),
    u_20_40 - v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
    r_20_40 + s_20_40 <=s (const 64 (2**20)),
    r_20_40 - s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),
    u_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_20_40 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_039_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_19,
sint64 neg_g_0_low60_20_low20_19,
sint64 neg_f_0_low60_20_low20_20,
sint64 neg_g_0_low60_20_low20_20,
sint64 u_20_39,
sint64 v_20_39,
sint64 r_20_39,
sint64 s_20_39,
sint64 u_20_40,
sint64 v_20_40,
sint64 r_20_40,
sint64 s_20_40,
bit ne
)={
    u_20_39 * neg_f_0_low60_20_low20_0 + v_20_39 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_19 * (-(2**20)),
    r_20_39 * neg_f_0_low60_20_low20_0 + s_20_39 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_19 * (-(2**20))
&&
    u_20_39 * neg_f_0_low60_20_low20_0 + v_20_39 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_19 * (const 64 (-(2**20))),
    r_20_39 * neg_f_0_low60_20_low20_0 + s_20_39 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_19 + u_20_39 * (const 64 (2**21)) + v_20_39 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_19 + r_20_39 * (const 64 (2**21)) + s_20_39 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_19,
    neg_f_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_19,
    neg_g_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 39)) <=s delta, delta <=s (const 64 (1 + 2*39)),
    (const 64 (-(2**20))) <=s u_20_39, u_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_39, v_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_39, r_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_39, s_20_39 <=s (const 64 ((2**20)-1)),
    u_20_39 + v_20_39 <=s (const 64 (2**20)),
    u_20_39 - v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 + v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 - v_20_39 <=s (const 64 (2**20)),
    r_20_39 + s_20_39 <=s (const 64 (2**20)),
    r_20_39 - s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 + s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 - s_20_39 <=s (const 64 (2**20)),
    u_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_20_39 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise b
assume
neg_g_0_low60_20_low20_19 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_20 neg_f_0_low60_20_low20_19;
mov u_20_40 u_20_39;
mov v_20_40 v_20_39;

add neg_g_0_low60_20_low20_20 neg_g_0_low60_20_low20_19 neg_f_0_low60_20_low20_19;
asr neg_g_0_low60_20_low20_20 neg_g_0_low60_20_low20_20 1;
add r_20_40 r_20_39 u_20_39;
asr r_20_40 r_20_40 1;
add s_20_40 s_20_39 v_20_39;
asr s_20_40 s_20_40 1;
assert
    true
&&
    neg_f_0_low60_20_low20_20 = neg_f_0_low60_20_low20_19,
    u_20_40 = u_20_39,
    v_20_40 = v_20_39,
    neg_g_0_low60_20_low20_20 * (const 64 2) = neg_g_0_low60_20_low20_19 + neg_f_0_low60_20_low20_19,
    r_20_40 * (const 64 2) = r_20_39 + u_20_39,
    s_20_40 * (const 64 2) = s_20_39 + v_20_39
;

assume
    neg_f_0_low60_20_low20_20 = neg_f_0_low60_20_low20_19,
    u_20_40 = u_20_39,
    v_20_40 = v_20_39,
    neg_g_0_low60_20_low20_20 * 2 = neg_g_0_low60_20_low20_19 + neg_f_0_low60_20_low20_19,
    r_20_40 * 2 = r_20_39 + u_20_39,
    s_20_40 * 2 = s_20_39 + v_20_39
&&
    true
;

{
    u_20_40 * neg_f_0_low60_20_low20_0 + v_20_40 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_40 * neg_f_0_low60_20_low20_0 + s_20_40 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_20 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_20 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_20,
    neg_f_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_20,
    neg_g_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 40)) <=s delta, delta <=s (const 64 (1 + 2*40)),
    (const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20)-1)),
    u_20_40 + v_20_40 <=s (const 64 (2**20)),
    u_20_40 - v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
    r_20_40 + s_20_40 <=s (const 64 (2**20)),
    r_20_40 - s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),
    u_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_20_40 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_039_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_0_low60_20_low20_0,
sint64 neg_g_0_low60_20_low20_0,
sint64 neg_f_0_low60_20_low20_19,
sint64 neg_g_0_low60_20_low20_19,
sint64 neg_f_0_low60_20_low20_20,
sint64 neg_g_0_low60_20_low20_20,
sint64 u_20_39,
sint64 v_20_39,
sint64 r_20_39,
sint64 s_20_39,
sint64 u_20_40,
sint64 v_20_40,
sint64 r_20_40,
sint64 s_20_40,
bit ne
)={
    u_20_39 * neg_f_0_low60_20_low20_0 + v_20_39 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_19 * (-(2**20)),
    r_20_39 * neg_f_0_low60_20_low20_0 + s_20_39 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_19 * (-(2**20))
&&
    u_20_39 * neg_f_0_low60_20_low20_0 + v_20_39 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_19 * (const 64 (-(2**20))),
    r_20_39 * neg_f_0_low60_20_low20_0 + s_20_39 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_0_low60_20_low20_19 + u_20_39 * (const 64 (2**21)) + v_20_39 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_19 + r_20_39 * (const 64 (2**21)) + s_20_39 * (const 64 (2**42)),
    const 64 0 <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_0_low60_20_low20_19,
    neg_f_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_0_low60_20_low20_19,
    neg_g_0_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 39)) <=s delta, delta <=s (const 64 (1 + 2*39)),
    (const 64 (-(2**20))) <=s u_20_39, u_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_39, v_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_39, r_20_39 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_39, s_20_39 <=s (const 64 ((2**20)-1)),
    u_20_39 + v_20_39 <=s (const 64 (2**20)),
    u_20_39 - v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 + v_20_39 <=s (const 64 (2**20)),
    (const 64 0) - u_20_39 - v_20_39 <=s (const 64 (2**20)),
    r_20_39 + s_20_39 <=s (const 64 (2**20)),
    r_20_39 - s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 + s_20_39 <=s (const 64 (2**20)),
    (const 64 0) - r_20_39 - s_20_39 <=s (const 64 (2**20)),
    u_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_20_39 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_20_39 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise c
assume
neg_g_0_low60_20_low20_19 = 1 (mod 2)
&&
neg_g_0_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_0_low60_20_low20_20 neg_g_0_low60_20_low20_19;
mov u_20_40 r_20_39;
mov v_20_40 s_20_39;

subs dc neg_g_0_low60_20_low20_20 neg_g_0_low60_20_low20_19 neg_f_0_low60_20_low20_19;
asr neg_g_0_low60_20_low20_20 neg_g_0_low60_20_low20_20 1;
subs dc r_20_40 r_20_39 u_20_39;
asr r_20_40 r_20_40 1;
subs dc s_20_40 s_20_39 v_20_39;
asr s_20_40 s_20_40 1;
assert
    true
&&
    neg_f_0_low60_20_low20_20 = neg_g_0_low60_20_low20_19,
    u_20_40 = r_20_39,
    v_20_40 = s_20_39,
    neg_g_0_low60_20_low20_20 * (const 64 2) = neg_g_0_low60_20_low20_19 - neg_f_0_low60_20_low20_19,
    r_20_40 * (const 64 2) = r_20_39 - u_20_39,
    s_20_40 * (const 64 2) = s_20_39 - v_20_39
;

assume
    neg_f_0_low60_20_low20_20 = neg_g_0_low60_20_low20_19,
    u_20_40 = r_20_39,
    v_20_40 = s_20_39,
    neg_g_0_low60_20_low20_20 * 2 = neg_g_0_low60_20_low20_19 - neg_f_0_low60_20_low20_19,
    r_20_40 * 2 = r_20_39 - u_20_39,
    s_20_40 * 2 = s_20_39 - v_20_39
&&
    true
;

{
    u_20_40 * neg_f_0_low60_20_low20_0 + v_20_40 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_20_40 * neg_f_0_low60_20_low20_0 + s_20_40 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_0_low60_20_low20_20 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_20 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_20,
    neg_f_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_20,
    neg_g_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 40)) <=s delta, delta <=s (const 64 (1 + 2*40)),
    (const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20)-1)),
    u_20_40 + v_20_40 <=s (const 64 (2**20)),
    u_20_40 - v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
    r_20_40 + s_20_40 <=s (const 64 (2**20)),
    r_20_40 - s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),
    u_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_20_40 = (const 64 0) (mod (const 64 (2**(20-20))))
}

