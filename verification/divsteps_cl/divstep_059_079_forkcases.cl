proc divstep_059_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_1,
sint64 neg_g_59_low60_0_low20_1,
sint64 u_59_59,
sint64 v_59_59,
sint64 r_59_59,
sint64 s_59_59,
sint64 u_59_60,
sint64 v_59_60,
sint64 r_59_60,
sint64 s_59_60,
bit ne
)={
    u_59_59 * neg_f_59_low60_0_low20_0 + v_59_59 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_0 * (-(2**20)),
    r_59_59 * neg_f_59_low60_0_low20_0 + s_59_59 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_0 * (-(2**20))
&&
    u_59_59 * neg_f_59_low60_0_low20_0 + v_59_59 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_0 * (const 64 (-(2**20))),
    r_59_59 * neg_f_59_low60_0_low20_0 + s_59_59 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_0 + u_59_59 * (const 64 (2**21)) + v_59_59 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_0 + r_59_59 * (const 64 (2**21)) + s_59_59 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    u_59_59 = (const 64 (-(2**20))),
    v_59_59 = (const 64 (0)),
    r_59_59 = (const 64 (0)),
    s_59_59 = (const 64 (-(2**20)))
}



// divsteps
// step59

// premise a
assume
neg_g_59_low60_0_low20_0 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_59_low60_0_low20_1 neg_f_59_low60_0_low20_0;
mov u_59_60 u_59_59;
mov v_59_60 v_59_59;

asr neg_g_59_low60_0_low20_1 neg_g_59_low60_0_low20_0 1;
asr r_59_60 r_59_59 1;
asr s_59_60 s_59_59 1;
assert
    true
&&
    neg_f_59_low60_0_low20_1 = neg_f_59_low60_0_low20_0,
    u_59_60 = u_59_59,
    v_59_60 = v_59_59,
    neg_g_59_low60_0_low20_1 * (const 64 2) = neg_g_59_low60_0_low20_0,
    r_59_60 * (const 64 2) = r_59_59,
    s_59_60 * (const 64 2) = s_59_59
;

assume
    neg_f_59_low60_0_low20_1 = neg_f_59_low60_0_low20_0,
    u_59_60 = u_59_59,
    v_59_60 = v_59_59,
    neg_g_59_low60_0_low20_1 * 2 = neg_g_59_low60_0_low20_0,
    r_59_60 * 2 = r_59_59,
    s_59_60 * 2 = s_59_59
&&
    true
;

{
    u_59_60 * neg_f_59_low60_0_low20_0 + v_59_60 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_60 * neg_f_59_low60_0_low20_0 + s_59_60 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_1 + u_59_60 * (const 64 (2**21)) + v_59_60 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_1 + r_59_60 * (const 64 (2**21)) + s_59_60 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_1,
    neg_f_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_1,
    neg_g_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 60)) <=s delta, delta <=s (const 64 (1 + 2*60)),
    (const 64 (-(2**20))) <=s u_59_60, u_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_60, v_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_60, r_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_60, s_59_60 <=s (const 64 ((2**20))),
    u_59_60 + v_59_60 <=s (const 64 (2**20)),
    u_59_60 - v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 + v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 - v_59_60 <=s (const 64 (2**20)),
    r_59_60 + s_59_60 <=s (const 64 (2**20)),
    r_59_60 - s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 + s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 - s_59_60 <=s (const 64 (2**20)),
    u_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_59_60 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_059_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_1,
sint64 neg_g_59_low60_0_low20_1,
sint64 u_59_59,
sint64 v_59_59,
sint64 r_59_59,
sint64 s_59_59,
sint64 u_59_60,
sint64 v_59_60,
sint64 r_59_60,
sint64 s_59_60,
bit ne
)={
    u_59_59 * neg_f_59_low60_0_low20_0 + v_59_59 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_0 * (-(2**20)),
    r_59_59 * neg_f_59_low60_0_low20_0 + s_59_59 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_0 * (-(2**20))
&&
    u_59_59 * neg_f_59_low60_0_low20_0 + v_59_59 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_0 * (const 64 (-(2**20))),
    r_59_59 * neg_f_59_low60_0_low20_0 + s_59_59 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_0 + u_59_59 * (const 64 (2**21)) + v_59_59 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_0 + r_59_59 * (const 64 (2**21)) + s_59_59 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    u_59_59 = (const 64 (-(2**20))),
    v_59_59 = (const 64 (0)),
    r_59_59 = (const 64 (0)),
    s_59_59 = (const 64 (-(2**20)))
}



// divsteps
// step59

// premise b
assume
neg_g_59_low60_0_low20_0 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_1 neg_f_59_low60_0_low20_0;
mov u_59_60 u_59_59;
mov v_59_60 v_59_59;

add neg_g_59_low60_0_low20_1 neg_g_59_low60_0_low20_0 neg_f_59_low60_0_low20_0;
asr neg_g_59_low60_0_low20_1 neg_g_59_low60_0_low20_1 1;
add r_59_60 r_59_59 u_59_59;
asr r_59_60 r_59_60 1;
add s_59_60 s_59_59 v_59_59;
asr s_59_60 s_59_60 1;
assert
    true
&&
    neg_f_59_low60_0_low20_1 = neg_f_59_low60_0_low20_0,
    u_59_60 = u_59_59,
    v_59_60 = v_59_59,
    neg_g_59_low60_0_low20_1 * (const 64 2) = neg_g_59_low60_0_low20_0 + neg_f_59_low60_0_low20_0,
    r_59_60 * (const 64 2) = r_59_59 + u_59_59,
    s_59_60 * (const 64 2) = s_59_59 + v_59_59
;

assume
    neg_f_59_low60_0_low20_1 = neg_f_59_low60_0_low20_0,
    u_59_60 = u_59_59,
    v_59_60 = v_59_59,
    neg_g_59_low60_0_low20_1 * 2 = neg_g_59_low60_0_low20_0 + neg_f_59_low60_0_low20_0,
    r_59_60 * 2 = r_59_59 + u_59_59,
    s_59_60 * 2 = s_59_59 + v_59_59
&&
    true
;

{
    u_59_60 * neg_f_59_low60_0_low20_0 + v_59_60 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_60 * neg_f_59_low60_0_low20_0 + s_59_60 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_1 + u_59_60 * (const 64 (2**21)) + v_59_60 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_1 + r_59_60 * (const 64 (2**21)) + s_59_60 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_1,
    neg_f_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_1,
    neg_g_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 60)) <=s delta, delta <=s (const 64 (1 + 2*60)),
    (const 64 (-(2**20))) <=s u_59_60, u_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_60, v_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_60, r_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_60, s_59_60 <=s (const 64 ((2**20))),
    u_59_60 + v_59_60 <=s (const 64 (2**20)),
    u_59_60 - v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 + v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 - v_59_60 <=s (const 64 (2**20)),
    r_59_60 + s_59_60 <=s (const 64 (2**20)),
    r_59_60 - s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 + s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 - s_59_60 <=s (const 64 (2**20)),
    u_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_59_60 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_059_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_1,
sint64 neg_g_59_low60_0_low20_1,
sint64 u_59_59,
sint64 v_59_59,
sint64 r_59_59,
sint64 s_59_59,
sint64 u_59_60,
sint64 v_59_60,
sint64 r_59_60,
sint64 s_59_60,
bit ne
)={
    u_59_59 * neg_f_59_low60_0_low20_0 + v_59_59 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_0 * (-(2**20)),
    r_59_59 * neg_f_59_low60_0_low20_0 + s_59_59 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_0 * (-(2**20))
&&
    u_59_59 * neg_f_59_low60_0_low20_0 + v_59_59 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_0 * (const 64 (-(2**20))),
    r_59_59 * neg_f_59_low60_0_low20_0 + s_59_59 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_0 + u_59_59 * (const 64 (2**21)) + v_59_59 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_0 + r_59_59 * (const 64 (2**21)) + s_59_59 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    u_59_59 = (const 64 (-(2**20))),
    v_59_59 = (const 64 (0)),
    r_59_59 = (const 64 (0)),
    s_59_59 = (const 64 (-(2**20)))
}



// divsteps
// step59

// premise c
assume
neg_g_59_low60_0_low20_0 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_1 neg_g_59_low60_0_low20_0;
mov u_59_60 r_59_59;
mov v_59_60 s_59_59;

subs dc neg_g_59_low60_0_low20_1 neg_g_59_low60_0_low20_0 neg_f_59_low60_0_low20_0;
asr neg_g_59_low60_0_low20_1 neg_g_59_low60_0_low20_1 1;
subs dc r_59_60 r_59_59 u_59_59;
asr r_59_60 r_59_60 1;
subs dc s_59_60 s_59_59 v_59_59;
asr s_59_60 s_59_60 1;
assert
    true
&&
    neg_f_59_low60_0_low20_1 = neg_g_59_low60_0_low20_0,
    u_59_60 = r_59_59,
    v_59_60 = s_59_59,
    neg_g_59_low60_0_low20_1 * (const 64 2) = neg_g_59_low60_0_low20_0 - neg_f_59_low60_0_low20_0,
    r_59_60 * (const 64 2) = r_59_59 - u_59_59,
    s_59_60 * (const 64 2) = s_59_59 - v_59_59
;

assume
    neg_f_59_low60_0_low20_1 = neg_g_59_low60_0_low20_0,
    u_59_60 = r_59_59,
    v_59_60 = s_59_59,
    neg_g_59_low60_0_low20_1 * 2 = neg_g_59_low60_0_low20_0 - neg_f_59_low60_0_low20_0,
    r_59_60 * 2 = r_59_59 - u_59_59,
    s_59_60 * 2 = s_59_59 - v_59_59
&&
    true
;

{
    u_59_60 * neg_f_59_low60_0_low20_0 + v_59_60 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_60 * neg_f_59_low60_0_low20_0 + s_59_60 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_1 + u_59_60 * (const 64 (2**21)) + v_59_60 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_1 + r_59_60 * (const 64 (2**21)) + s_59_60 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_1,
    neg_f_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_1,
    neg_g_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 60)) <=s delta, delta <=s (const 64 (1 + 2*60)),
    (const 64 (-(2**20))) <=s u_59_60, u_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_60, v_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_60, r_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_60, s_59_60 <=s (const 64 ((2**20))),
    u_59_60 + v_59_60 <=s (const 64 (2**20)),
    u_59_60 - v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 + v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 - v_59_60 <=s (const 64 (2**20)),
    r_59_60 + s_59_60 <=s (const 64 (2**20)),
    r_59_60 - s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 + s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 - s_59_60 <=s (const 64 (2**20)),
    u_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_59_60 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_060_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_1,
sint64 neg_g_59_low60_0_low20_1,
sint64 neg_f_59_low60_0_low20_2,
sint64 neg_g_59_low60_0_low20_2,
sint64 u_59_60,
sint64 v_59_60,
sint64 r_59_60,
sint64 s_59_60,
sint64 u_59_61,
sint64 v_59_61,
sint64 r_59_61,
sint64 s_59_61,
bit ne
)={
    u_59_60 * neg_f_59_low60_0_low20_0 + v_59_60 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_1 * (-(2**20)),
    r_59_60 * neg_f_59_low60_0_low20_0 + s_59_60 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_1 * (-(2**20))
&&
    u_59_60 * neg_f_59_low60_0_low20_0 + v_59_60 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_1 * (const 64 (-(2**20))),
    r_59_60 * neg_f_59_low60_0_low20_0 + s_59_60 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_1 + u_59_60 * (const 64 (2**21)) + v_59_60 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_1 + r_59_60 * (const 64 (2**21)) + s_59_60 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_1,
    neg_f_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_1,
    neg_g_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 60)) <=s delta, delta <=s (const 64 (1 + 2*60)),
    (const 64 (-(2**20))) <=s u_59_60, u_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_60, v_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_60, r_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_60, s_59_60 <=s (const 64 ((2**20))),
    u_59_60 + v_59_60 <=s (const 64 (2**20)),
    u_59_60 - v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 + v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 - v_59_60 <=s (const 64 (2**20)),
    r_59_60 + s_59_60 <=s (const 64 (2**20)),
    r_59_60 - s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 + s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 - s_59_60 <=s (const 64 (2**20)),
    u_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_59_60 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step60

// premise a
assume
neg_g_59_low60_0_low20_1 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_2 neg_f_59_low60_0_low20_1;
mov u_59_61 u_59_60;
mov v_59_61 v_59_60;

asr neg_g_59_low60_0_low20_2 neg_g_59_low60_0_low20_1 1;
asr r_59_61 r_59_60 1;
asr s_59_61 s_59_60 1;
assert
    true
&&
    neg_f_59_low60_0_low20_2 = neg_f_59_low60_0_low20_1,
    u_59_61 = u_59_60,
    v_59_61 = v_59_60,
    neg_g_59_low60_0_low20_2 * (const 64 2) = neg_g_59_low60_0_low20_1,
    r_59_61 * (const 64 2) = r_59_60,
    s_59_61 * (const 64 2) = s_59_60
;

assume
    neg_f_59_low60_0_low20_2 = neg_f_59_low60_0_low20_1,
    u_59_61 = u_59_60,
    v_59_61 = v_59_60,
    neg_g_59_low60_0_low20_2 * 2 = neg_g_59_low60_0_low20_1,
    r_59_61 * 2 = r_59_60,
    s_59_61 * 2 = s_59_60
&&
    true
;

{
    u_59_61 * neg_f_59_low60_0_low20_0 + v_59_61 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_61 * neg_f_59_low60_0_low20_0 + s_59_61 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_2 + u_59_61 * (const 64 (2**21)) + v_59_61 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_2 + r_59_61 * (const 64 (2**21)) + s_59_61 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_2,
    neg_f_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_2,
    neg_g_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 61)) <=s delta, delta <=s (const 64 (1 + 2*61)),
    (const 64 (-(2**20))) <=s u_59_61, u_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_61, v_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_61, r_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_61, s_59_61 <=s (const 64 ((2**20))),
    u_59_61 + v_59_61 <=s (const 64 (2**20)),
    u_59_61 - v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 + v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 - v_59_61 <=s (const 64 (2**20)),
    r_59_61 + s_59_61 <=s (const 64 (2**20)),
    r_59_61 - s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 + s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 - s_59_61 <=s (const 64 (2**20)),
    u_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_59_61 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_060_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_1,
sint64 neg_g_59_low60_0_low20_1,
sint64 neg_f_59_low60_0_low20_2,
sint64 neg_g_59_low60_0_low20_2,
sint64 u_59_60,
sint64 v_59_60,
sint64 r_59_60,
sint64 s_59_60,
sint64 u_59_61,
sint64 v_59_61,
sint64 r_59_61,
sint64 s_59_61,
bit ne
)={
    u_59_60 * neg_f_59_low60_0_low20_0 + v_59_60 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_1 * (-(2**20)),
    r_59_60 * neg_f_59_low60_0_low20_0 + s_59_60 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_1 * (-(2**20))
&&
    u_59_60 * neg_f_59_low60_0_low20_0 + v_59_60 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_1 * (const 64 (-(2**20))),
    r_59_60 * neg_f_59_low60_0_low20_0 + s_59_60 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_1 + u_59_60 * (const 64 (2**21)) + v_59_60 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_1 + r_59_60 * (const 64 (2**21)) + s_59_60 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_1,
    neg_f_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_1,
    neg_g_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 60)) <=s delta, delta <=s (const 64 (1 + 2*60)),
    (const 64 (-(2**20))) <=s u_59_60, u_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_60, v_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_60, r_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_60, s_59_60 <=s (const 64 ((2**20))),
    u_59_60 + v_59_60 <=s (const 64 (2**20)),
    u_59_60 - v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 + v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 - v_59_60 <=s (const 64 (2**20)),
    r_59_60 + s_59_60 <=s (const 64 (2**20)),
    r_59_60 - s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 + s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 - s_59_60 <=s (const 64 (2**20)),
    u_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_59_60 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step60

// premise b
assume
neg_g_59_low60_0_low20_1 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_2 neg_f_59_low60_0_low20_1;
mov u_59_61 u_59_60;
mov v_59_61 v_59_60;

add neg_g_59_low60_0_low20_2 neg_g_59_low60_0_low20_1 neg_f_59_low60_0_low20_1;
asr neg_g_59_low60_0_low20_2 neg_g_59_low60_0_low20_2 1;
add r_59_61 r_59_60 u_59_60;
asr r_59_61 r_59_61 1;
add s_59_61 s_59_60 v_59_60;
asr s_59_61 s_59_61 1;
assert
    true
&&
    neg_f_59_low60_0_low20_2 = neg_f_59_low60_0_low20_1,
    u_59_61 = u_59_60,
    v_59_61 = v_59_60,
    neg_g_59_low60_0_low20_2 * (const 64 2) = neg_g_59_low60_0_low20_1 + neg_f_59_low60_0_low20_1,
    r_59_61 * (const 64 2) = r_59_60 + u_59_60,
    s_59_61 * (const 64 2) = s_59_60 + v_59_60
;

assume
    neg_f_59_low60_0_low20_2 = neg_f_59_low60_0_low20_1,
    u_59_61 = u_59_60,
    v_59_61 = v_59_60,
    neg_g_59_low60_0_low20_2 * 2 = neg_g_59_low60_0_low20_1 + neg_f_59_low60_0_low20_1,
    r_59_61 * 2 = r_59_60 + u_59_60,
    s_59_61 * 2 = s_59_60 + v_59_60
&&
    true
;

{
    u_59_61 * neg_f_59_low60_0_low20_0 + v_59_61 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_61 * neg_f_59_low60_0_low20_0 + s_59_61 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_2 + u_59_61 * (const 64 (2**21)) + v_59_61 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_2 + r_59_61 * (const 64 (2**21)) + s_59_61 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_2,
    neg_f_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_2,
    neg_g_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 61)) <=s delta, delta <=s (const 64 (1 + 2*61)),
    (const 64 (-(2**20))) <=s u_59_61, u_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_61, v_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_61, r_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_61, s_59_61 <=s (const 64 ((2**20))),
    u_59_61 + v_59_61 <=s (const 64 (2**20)),
    u_59_61 - v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 + v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 - v_59_61 <=s (const 64 (2**20)),
    r_59_61 + s_59_61 <=s (const 64 (2**20)),
    r_59_61 - s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 + s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 - s_59_61 <=s (const 64 (2**20)),
    u_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_59_61 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_060_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_1,
sint64 neg_g_59_low60_0_low20_1,
sint64 neg_f_59_low60_0_low20_2,
sint64 neg_g_59_low60_0_low20_2,
sint64 u_59_60,
sint64 v_59_60,
sint64 r_59_60,
sint64 s_59_60,
sint64 u_59_61,
sint64 v_59_61,
sint64 r_59_61,
sint64 s_59_61,
bit ne
)={
    u_59_60 * neg_f_59_low60_0_low20_0 + v_59_60 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_1 * (-(2**20)),
    r_59_60 * neg_f_59_low60_0_low20_0 + s_59_60 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_1 * (-(2**20))
&&
    u_59_60 * neg_f_59_low60_0_low20_0 + v_59_60 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_1 * (const 64 (-(2**20))),
    r_59_60 * neg_f_59_low60_0_low20_0 + s_59_60 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_1 + u_59_60 * (const 64 (2**21)) + v_59_60 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_1 + r_59_60 * (const 64 (2**21)) + s_59_60 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_1,
    neg_f_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_1,
    neg_g_59_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 60)) <=s delta, delta <=s (const 64 (1 + 2*60)),
    (const 64 (-(2**20))) <=s u_59_60, u_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_60, v_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_60, r_59_60 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_60, s_59_60 <=s (const 64 ((2**20))),
    u_59_60 + v_59_60 <=s (const 64 (2**20)),
    u_59_60 - v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 + v_59_60 <=s (const 64 (2**20)),
    (const 64 0) - u_59_60 - v_59_60 <=s (const 64 (2**20)),
    r_59_60 + s_59_60 <=s (const 64 (2**20)),
    r_59_60 - s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 + s_59_60 <=s (const 64 (2**20)),
    (const 64 0) - r_59_60 - s_59_60 <=s (const 64 (2**20)),
    u_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_59_60 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_59_60 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step60

// premise c
assume
neg_g_59_low60_0_low20_1 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_2 neg_g_59_low60_0_low20_1;
mov u_59_61 r_59_60;
mov v_59_61 s_59_60;

subs dc neg_g_59_low60_0_low20_2 neg_g_59_low60_0_low20_1 neg_f_59_low60_0_low20_1;
asr neg_g_59_low60_0_low20_2 neg_g_59_low60_0_low20_2 1;
subs dc r_59_61 r_59_60 u_59_60;
asr r_59_61 r_59_61 1;
subs dc s_59_61 s_59_60 v_59_60;
asr s_59_61 s_59_61 1;
assert
    true
&&
    neg_f_59_low60_0_low20_2 = neg_g_59_low60_0_low20_1,
    u_59_61 = r_59_60,
    v_59_61 = s_59_60,
    neg_g_59_low60_0_low20_2 * (const 64 2) = neg_g_59_low60_0_low20_1 - neg_f_59_low60_0_low20_1,
    r_59_61 * (const 64 2) = r_59_60 - u_59_60,
    s_59_61 * (const 64 2) = s_59_60 - v_59_60
;

assume
    neg_f_59_low60_0_low20_2 = neg_g_59_low60_0_low20_1,
    u_59_61 = r_59_60,
    v_59_61 = s_59_60,
    neg_g_59_low60_0_low20_2 * 2 = neg_g_59_low60_0_low20_1 - neg_f_59_low60_0_low20_1,
    r_59_61 * 2 = r_59_60 - u_59_60,
    s_59_61 * 2 = s_59_60 - v_59_60
&&
    true
;

{
    u_59_61 * neg_f_59_low60_0_low20_0 + v_59_61 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_61 * neg_f_59_low60_0_low20_0 + s_59_61 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_2 + u_59_61 * (const 64 (2**21)) + v_59_61 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_2 + r_59_61 * (const 64 (2**21)) + s_59_61 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_2,
    neg_f_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_2,
    neg_g_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 61)) <=s delta, delta <=s (const 64 (1 + 2*61)),
    (const 64 (-(2**20))) <=s u_59_61, u_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_61, v_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_61, r_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_61, s_59_61 <=s (const 64 ((2**20))),
    u_59_61 + v_59_61 <=s (const 64 (2**20)),
    u_59_61 - v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 + v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 - v_59_61 <=s (const 64 (2**20)),
    r_59_61 + s_59_61 <=s (const 64 (2**20)),
    r_59_61 - s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 + s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 - s_59_61 <=s (const 64 (2**20)),
    u_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_59_61 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_061_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_2,
sint64 neg_g_59_low60_0_low20_2,
sint64 neg_f_59_low60_0_low20_3,
sint64 neg_g_59_low60_0_low20_3,
sint64 u_59_61,
sint64 v_59_61,
sint64 r_59_61,
sint64 s_59_61,
sint64 u_59_62,
sint64 v_59_62,
sint64 r_59_62,
sint64 s_59_62,
bit ne
)={
    u_59_61 * neg_f_59_low60_0_low20_0 + v_59_61 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_2 * (-(2**20)),
    r_59_61 * neg_f_59_low60_0_low20_0 + s_59_61 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_2 * (-(2**20))
&&
    u_59_61 * neg_f_59_low60_0_low20_0 + v_59_61 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_2 * (const 64 (-(2**20))),
    r_59_61 * neg_f_59_low60_0_low20_0 + s_59_61 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_2 + u_59_61 * (const 64 (2**21)) + v_59_61 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_2 + r_59_61 * (const 64 (2**21)) + s_59_61 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_2,
    neg_f_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_2,
    neg_g_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 61)) <=s delta, delta <=s (const 64 (1 + 2*61)),
    (const 64 (-(2**20))) <=s u_59_61, u_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_61, v_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_61, r_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_61, s_59_61 <=s (const 64 ((2**20))),
    u_59_61 + v_59_61 <=s (const 64 (2**20)),
    u_59_61 - v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 + v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 - v_59_61 <=s (const 64 (2**20)),
    r_59_61 + s_59_61 <=s (const 64 (2**20)),
    r_59_61 - s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 + s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 - s_59_61 <=s (const 64 (2**20)),
    u_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_59_61 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step61

// premise a
assume
neg_g_59_low60_0_low20_2 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_3 neg_f_59_low60_0_low20_2;
mov u_59_62 u_59_61;
mov v_59_62 v_59_61;

asr neg_g_59_low60_0_low20_3 neg_g_59_low60_0_low20_2 1;
asr r_59_62 r_59_61 1;
asr s_59_62 s_59_61 1;
assert
    true
&&
    neg_f_59_low60_0_low20_3 = neg_f_59_low60_0_low20_2,
    u_59_62 = u_59_61,
    v_59_62 = v_59_61,
    neg_g_59_low60_0_low20_3 * (const 64 2) = neg_g_59_low60_0_low20_2,
    r_59_62 * (const 64 2) = r_59_61,
    s_59_62 * (const 64 2) = s_59_61
;

assume
    neg_f_59_low60_0_low20_3 = neg_f_59_low60_0_low20_2,
    u_59_62 = u_59_61,
    v_59_62 = v_59_61,
    neg_g_59_low60_0_low20_3 * 2 = neg_g_59_low60_0_low20_2,
    r_59_62 * 2 = r_59_61,
    s_59_62 * 2 = s_59_61
&&
    true
;

{
    u_59_62 * neg_f_59_low60_0_low20_0 + v_59_62 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_62 * neg_f_59_low60_0_low20_0 + s_59_62 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_3 + u_59_62 * (const 64 (2**21)) + v_59_62 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_3 + r_59_62 * (const 64 (2**21)) + s_59_62 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_3,
    neg_f_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_3,
    neg_g_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 62)) <=s delta, delta <=s (const 64 (1 + 2*62)),
    (const 64 (-(2**20))) <=s u_59_62, u_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_62, v_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_62, r_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_62, s_59_62 <=s (const 64 ((2**20))),
    u_59_62 + v_59_62 <=s (const 64 (2**20)),
    u_59_62 - v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 + v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 - v_59_62 <=s (const 64 (2**20)),
    r_59_62 + s_59_62 <=s (const 64 (2**20)),
    r_59_62 - s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 + s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 - s_59_62 <=s (const 64 (2**20)),
    u_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_59_62 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_061_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_2,
sint64 neg_g_59_low60_0_low20_2,
sint64 neg_f_59_low60_0_low20_3,
sint64 neg_g_59_low60_0_low20_3,
sint64 u_59_61,
sint64 v_59_61,
sint64 r_59_61,
sint64 s_59_61,
sint64 u_59_62,
sint64 v_59_62,
sint64 r_59_62,
sint64 s_59_62,
bit ne
)={
    u_59_61 * neg_f_59_low60_0_low20_0 + v_59_61 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_2 * (-(2**20)),
    r_59_61 * neg_f_59_low60_0_low20_0 + s_59_61 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_2 * (-(2**20))
&&
    u_59_61 * neg_f_59_low60_0_low20_0 + v_59_61 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_2 * (const 64 (-(2**20))),
    r_59_61 * neg_f_59_low60_0_low20_0 + s_59_61 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_2 + u_59_61 * (const 64 (2**21)) + v_59_61 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_2 + r_59_61 * (const 64 (2**21)) + s_59_61 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_2,
    neg_f_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_2,
    neg_g_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 61)) <=s delta, delta <=s (const 64 (1 + 2*61)),
    (const 64 (-(2**20))) <=s u_59_61, u_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_61, v_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_61, r_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_61, s_59_61 <=s (const 64 ((2**20))),
    u_59_61 + v_59_61 <=s (const 64 (2**20)),
    u_59_61 - v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 + v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 - v_59_61 <=s (const 64 (2**20)),
    r_59_61 + s_59_61 <=s (const 64 (2**20)),
    r_59_61 - s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 + s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 - s_59_61 <=s (const 64 (2**20)),
    u_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_59_61 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step61

// premise b
assume
neg_g_59_low60_0_low20_2 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_3 neg_f_59_low60_0_low20_2;
mov u_59_62 u_59_61;
mov v_59_62 v_59_61;

add neg_g_59_low60_0_low20_3 neg_g_59_low60_0_low20_2 neg_f_59_low60_0_low20_2;
asr neg_g_59_low60_0_low20_3 neg_g_59_low60_0_low20_3 1;
add r_59_62 r_59_61 u_59_61;
asr r_59_62 r_59_62 1;
add s_59_62 s_59_61 v_59_61;
asr s_59_62 s_59_62 1;
assert
    true
&&
    neg_f_59_low60_0_low20_3 = neg_f_59_low60_0_low20_2,
    u_59_62 = u_59_61,
    v_59_62 = v_59_61,
    neg_g_59_low60_0_low20_3 * (const 64 2) = neg_g_59_low60_0_low20_2 + neg_f_59_low60_0_low20_2,
    r_59_62 * (const 64 2) = r_59_61 + u_59_61,
    s_59_62 * (const 64 2) = s_59_61 + v_59_61
;

assume
    neg_f_59_low60_0_low20_3 = neg_f_59_low60_0_low20_2,
    u_59_62 = u_59_61,
    v_59_62 = v_59_61,
    neg_g_59_low60_0_low20_3 * 2 = neg_g_59_low60_0_low20_2 + neg_f_59_low60_0_low20_2,
    r_59_62 * 2 = r_59_61 + u_59_61,
    s_59_62 * 2 = s_59_61 + v_59_61
&&
    true
;

{
    u_59_62 * neg_f_59_low60_0_low20_0 + v_59_62 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_62 * neg_f_59_low60_0_low20_0 + s_59_62 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_3 + u_59_62 * (const 64 (2**21)) + v_59_62 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_3 + r_59_62 * (const 64 (2**21)) + s_59_62 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_3,
    neg_f_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_3,
    neg_g_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 62)) <=s delta, delta <=s (const 64 (1 + 2*62)),
    (const 64 (-(2**20))) <=s u_59_62, u_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_62, v_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_62, r_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_62, s_59_62 <=s (const 64 ((2**20))),
    u_59_62 + v_59_62 <=s (const 64 (2**20)),
    u_59_62 - v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 + v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 - v_59_62 <=s (const 64 (2**20)),
    r_59_62 + s_59_62 <=s (const 64 (2**20)),
    r_59_62 - s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 + s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 - s_59_62 <=s (const 64 (2**20)),
    u_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_59_62 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_061_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_2,
sint64 neg_g_59_low60_0_low20_2,
sint64 neg_f_59_low60_0_low20_3,
sint64 neg_g_59_low60_0_low20_3,
sint64 u_59_61,
sint64 v_59_61,
sint64 r_59_61,
sint64 s_59_61,
sint64 u_59_62,
sint64 v_59_62,
sint64 r_59_62,
sint64 s_59_62,
bit ne
)={
    u_59_61 * neg_f_59_low60_0_low20_0 + v_59_61 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_2 * (-(2**20)),
    r_59_61 * neg_f_59_low60_0_low20_0 + s_59_61 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_2 * (-(2**20))
&&
    u_59_61 * neg_f_59_low60_0_low20_0 + v_59_61 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_2 * (const 64 (-(2**20))),
    r_59_61 * neg_f_59_low60_0_low20_0 + s_59_61 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_2 + u_59_61 * (const 64 (2**21)) + v_59_61 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_2 + r_59_61 * (const 64 (2**21)) + s_59_61 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_2,
    neg_f_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_2,
    neg_g_59_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 61)) <=s delta, delta <=s (const 64 (1 + 2*61)),
    (const 64 (-(2**20))) <=s u_59_61, u_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_61, v_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_61, r_59_61 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_61, s_59_61 <=s (const 64 ((2**20))),
    u_59_61 + v_59_61 <=s (const 64 (2**20)),
    u_59_61 - v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 + v_59_61 <=s (const 64 (2**20)),
    (const 64 0) - u_59_61 - v_59_61 <=s (const 64 (2**20)),
    r_59_61 + s_59_61 <=s (const 64 (2**20)),
    r_59_61 - s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 + s_59_61 <=s (const 64 (2**20)),
    (const 64 0) - r_59_61 - s_59_61 <=s (const 64 (2**20)),
    u_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_59_61 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_59_61 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step61

// premise c
assume
neg_g_59_low60_0_low20_2 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_3 neg_g_59_low60_0_low20_2;
mov u_59_62 r_59_61;
mov v_59_62 s_59_61;

subs dc neg_g_59_low60_0_low20_3 neg_g_59_low60_0_low20_2 neg_f_59_low60_0_low20_2;
asr neg_g_59_low60_0_low20_3 neg_g_59_low60_0_low20_3 1;
subs dc r_59_62 r_59_61 u_59_61;
asr r_59_62 r_59_62 1;
subs dc s_59_62 s_59_61 v_59_61;
asr s_59_62 s_59_62 1;
assert
    true
&&
    neg_f_59_low60_0_low20_3 = neg_g_59_low60_0_low20_2,
    u_59_62 = r_59_61,
    v_59_62 = s_59_61,
    neg_g_59_low60_0_low20_3 * (const 64 2) = neg_g_59_low60_0_low20_2 - neg_f_59_low60_0_low20_2,
    r_59_62 * (const 64 2) = r_59_61 - u_59_61,
    s_59_62 * (const 64 2) = s_59_61 - v_59_61
;

assume
    neg_f_59_low60_0_low20_3 = neg_g_59_low60_0_low20_2,
    u_59_62 = r_59_61,
    v_59_62 = s_59_61,
    neg_g_59_low60_0_low20_3 * 2 = neg_g_59_low60_0_low20_2 - neg_f_59_low60_0_low20_2,
    r_59_62 * 2 = r_59_61 - u_59_61,
    s_59_62 * 2 = s_59_61 - v_59_61
&&
    true
;

{
    u_59_62 * neg_f_59_low60_0_low20_0 + v_59_62 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_62 * neg_f_59_low60_0_low20_0 + s_59_62 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_3 + u_59_62 * (const 64 (2**21)) + v_59_62 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_3 + r_59_62 * (const 64 (2**21)) + s_59_62 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_3,
    neg_f_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_3,
    neg_g_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 62)) <=s delta, delta <=s (const 64 (1 + 2*62)),
    (const 64 (-(2**20))) <=s u_59_62, u_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_62, v_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_62, r_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_62, s_59_62 <=s (const 64 ((2**20))),
    u_59_62 + v_59_62 <=s (const 64 (2**20)),
    u_59_62 - v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 + v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 - v_59_62 <=s (const 64 (2**20)),
    r_59_62 + s_59_62 <=s (const 64 (2**20)),
    r_59_62 - s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 + s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 - s_59_62 <=s (const 64 (2**20)),
    u_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_59_62 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_062_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_3,
sint64 neg_g_59_low60_0_low20_3,
sint64 neg_f_59_low60_0_low20_4,
sint64 neg_g_59_low60_0_low20_4,
sint64 u_59_62,
sint64 v_59_62,
sint64 r_59_62,
sint64 s_59_62,
sint64 u_59_63,
sint64 v_59_63,
sint64 r_59_63,
sint64 s_59_63,
bit ne
)={
    u_59_62 * neg_f_59_low60_0_low20_0 + v_59_62 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_3 * (-(2**20)),
    r_59_62 * neg_f_59_low60_0_low20_0 + s_59_62 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_3 * (-(2**20))
&&
    u_59_62 * neg_f_59_low60_0_low20_0 + v_59_62 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_3 * (const 64 (-(2**20))),
    r_59_62 * neg_f_59_low60_0_low20_0 + s_59_62 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_3 + u_59_62 * (const 64 (2**21)) + v_59_62 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_3 + r_59_62 * (const 64 (2**21)) + s_59_62 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_3,
    neg_f_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_3,
    neg_g_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 62)) <=s delta, delta <=s (const 64 (1 + 2*62)),
    (const 64 (-(2**20))) <=s u_59_62, u_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_62, v_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_62, r_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_62, s_59_62 <=s (const 64 ((2**20))),
    u_59_62 + v_59_62 <=s (const 64 (2**20)),
    u_59_62 - v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 + v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 - v_59_62 <=s (const 64 (2**20)),
    r_59_62 + s_59_62 <=s (const 64 (2**20)),
    r_59_62 - s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 + s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 - s_59_62 <=s (const 64 (2**20)),
    u_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_59_62 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step62

// premise a
assume
neg_g_59_low60_0_low20_3 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_4 neg_f_59_low60_0_low20_3;
mov u_59_63 u_59_62;
mov v_59_63 v_59_62;

asr neg_g_59_low60_0_low20_4 neg_g_59_low60_0_low20_3 1;
asr r_59_63 r_59_62 1;
asr s_59_63 s_59_62 1;
assert
    true
&&
    neg_f_59_low60_0_low20_4 = neg_f_59_low60_0_low20_3,
    u_59_63 = u_59_62,
    v_59_63 = v_59_62,
    neg_g_59_low60_0_low20_4 * (const 64 2) = neg_g_59_low60_0_low20_3,
    r_59_63 * (const 64 2) = r_59_62,
    s_59_63 * (const 64 2) = s_59_62
;

assume
    neg_f_59_low60_0_low20_4 = neg_f_59_low60_0_low20_3,
    u_59_63 = u_59_62,
    v_59_63 = v_59_62,
    neg_g_59_low60_0_low20_4 * 2 = neg_g_59_low60_0_low20_3,
    r_59_63 * 2 = r_59_62,
    s_59_63 * 2 = s_59_62
&&
    true
;

{
    u_59_63 * neg_f_59_low60_0_low20_0 + v_59_63 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_63 * neg_f_59_low60_0_low20_0 + s_59_63 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_4 + u_59_63 * (const 64 (2**21)) + v_59_63 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_4 + r_59_63 * (const 64 (2**21)) + s_59_63 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_4,
    neg_f_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_4,
    neg_g_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 63)) <=s delta, delta <=s (const 64 (1 + 2*63)),
    (const 64 (-(2**20))) <=s u_59_63, u_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_63, v_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_63, r_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_63, s_59_63 <=s (const 64 ((2**20))),
    u_59_63 + v_59_63 <=s (const 64 (2**20)),
    u_59_63 - v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 + v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 - v_59_63 <=s (const 64 (2**20)),
    r_59_63 + s_59_63 <=s (const 64 (2**20)),
    r_59_63 - s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 + s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 - s_59_63 <=s (const 64 (2**20)),
    u_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_59_63 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_062_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_3,
sint64 neg_g_59_low60_0_low20_3,
sint64 neg_f_59_low60_0_low20_4,
sint64 neg_g_59_low60_0_low20_4,
sint64 u_59_62,
sint64 v_59_62,
sint64 r_59_62,
sint64 s_59_62,
sint64 u_59_63,
sint64 v_59_63,
sint64 r_59_63,
sint64 s_59_63,
bit ne
)={
    u_59_62 * neg_f_59_low60_0_low20_0 + v_59_62 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_3 * (-(2**20)),
    r_59_62 * neg_f_59_low60_0_low20_0 + s_59_62 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_3 * (-(2**20))
&&
    u_59_62 * neg_f_59_low60_0_low20_0 + v_59_62 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_3 * (const 64 (-(2**20))),
    r_59_62 * neg_f_59_low60_0_low20_0 + s_59_62 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_3 + u_59_62 * (const 64 (2**21)) + v_59_62 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_3 + r_59_62 * (const 64 (2**21)) + s_59_62 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_3,
    neg_f_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_3,
    neg_g_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 62)) <=s delta, delta <=s (const 64 (1 + 2*62)),
    (const 64 (-(2**20))) <=s u_59_62, u_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_62, v_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_62, r_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_62, s_59_62 <=s (const 64 ((2**20))),
    u_59_62 + v_59_62 <=s (const 64 (2**20)),
    u_59_62 - v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 + v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 - v_59_62 <=s (const 64 (2**20)),
    r_59_62 + s_59_62 <=s (const 64 (2**20)),
    r_59_62 - s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 + s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 - s_59_62 <=s (const 64 (2**20)),
    u_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_59_62 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step62

// premise b
assume
neg_g_59_low60_0_low20_3 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_4 neg_f_59_low60_0_low20_3;
mov u_59_63 u_59_62;
mov v_59_63 v_59_62;

add neg_g_59_low60_0_low20_4 neg_g_59_low60_0_low20_3 neg_f_59_low60_0_low20_3;
asr neg_g_59_low60_0_low20_4 neg_g_59_low60_0_low20_4 1;
add r_59_63 r_59_62 u_59_62;
asr r_59_63 r_59_63 1;
add s_59_63 s_59_62 v_59_62;
asr s_59_63 s_59_63 1;
assert
    true
&&
    neg_f_59_low60_0_low20_4 = neg_f_59_low60_0_low20_3,
    u_59_63 = u_59_62,
    v_59_63 = v_59_62,
    neg_g_59_low60_0_low20_4 * (const 64 2) = neg_g_59_low60_0_low20_3 + neg_f_59_low60_0_low20_3,
    r_59_63 * (const 64 2) = r_59_62 + u_59_62,
    s_59_63 * (const 64 2) = s_59_62 + v_59_62
;

assume
    neg_f_59_low60_0_low20_4 = neg_f_59_low60_0_low20_3,
    u_59_63 = u_59_62,
    v_59_63 = v_59_62,
    neg_g_59_low60_0_low20_4 * 2 = neg_g_59_low60_0_low20_3 + neg_f_59_low60_0_low20_3,
    r_59_63 * 2 = r_59_62 + u_59_62,
    s_59_63 * 2 = s_59_62 + v_59_62
&&
    true
;

{
    u_59_63 * neg_f_59_low60_0_low20_0 + v_59_63 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_63 * neg_f_59_low60_0_low20_0 + s_59_63 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_4 + u_59_63 * (const 64 (2**21)) + v_59_63 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_4 + r_59_63 * (const 64 (2**21)) + s_59_63 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_4,
    neg_f_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_4,
    neg_g_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 63)) <=s delta, delta <=s (const 64 (1 + 2*63)),
    (const 64 (-(2**20))) <=s u_59_63, u_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_63, v_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_63, r_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_63, s_59_63 <=s (const 64 ((2**20))),
    u_59_63 + v_59_63 <=s (const 64 (2**20)),
    u_59_63 - v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 + v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 - v_59_63 <=s (const 64 (2**20)),
    r_59_63 + s_59_63 <=s (const 64 (2**20)),
    r_59_63 - s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 + s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 - s_59_63 <=s (const 64 (2**20)),
    u_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_59_63 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_062_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_3,
sint64 neg_g_59_low60_0_low20_3,
sint64 neg_f_59_low60_0_low20_4,
sint64 neg_g_59_low60_0_low20_4,
sint64 u_59_62,
sint64 v_59_62,
sint64 r_59_62,
sint64 s_59_62,
sint64 u_59_63,
sint64 v_59_63,
sint64 r_59_63,
sint64 s_59_63,
bit ne
)={
    u_59_62 * neg_f_59_low60_0_low20_0 + v_59_62 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_3 * (-(2**20)),
    r_59_62 * neg_f_59_low60_0_low20_0 + s_59_62 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_3 * (-(2**20))
&&
    u_59_62 * neg_f_59_low60_0_low20_0 + v_59_62 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_3 * (const 64 (-(2**20))),
    r_59_62 * neg_f_59_low60_0_low20_0 + s_59_62 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_3 + u_59_62 * (const 64 (2**21)) + v_59_62 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_3 + r_59_62 * (const 64 (2**21)) + s_59_62 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_3,
    neg_f_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_3,
    neg_g_59_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 62)) <=s delta, delta <=s (const 64 (1 + 2*62)),
    (const 64 (-(2**20))) <=s u_59_62, u_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_62, v_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_62, r_59_62 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_62, s_59_62 <=s (const 64 ((2**20))),
    u_59_62 + v_59_62 <=s (const 64 (2**20)),
    u_59_62 - v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 + v_59_62 <=s (const 64 (2**20)),
    (const 64 0) - u_59_62 - v_59_62 <=s (const 64 (2**20)),
    r_59_62 + s_59_62 <=s (const 64 (2**20)),
    r_59_62 - s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 + s_59_62 <=s (const 64 (2**20)),
    (const 64 0) - r_59_62 - s_59_62 <=s (const 64 (2**20)),
    u_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_59_62 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_59_62 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step62

// premise c
assume
neg_g_59_low60_0_low20_3 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_4 neg_g_59_low60_0_low20_3;
mov u_59_63 r_59_62;
mov v_59_63 s_59_62;

subs dc neg_g_59_low60_0_low20_4 neg_g_59_low60_0_low20_3 neg_f_59_low60_0_low20_3;
asr neg_g_59_low60_0_low20_4 neg_g_59_low60_0_low20_4 1;
subs dc r_59_63 r_59_62 u_59_62;
asr r_59_63 r_59_63 1;
subs dc s_59_63 s_59_62 v_59_62;
asr s_59_63 s_59_63 1;
assert
    true
&&
    neg_f_59_low60_0_low20_4 = neg_g_59_low60_0_low20_3,
    u_59_63 = r_59_62,
    v_59_63 = s_59_62,
    neg_g_59_low60_0_low20_4 * (const 64 2) = neg_g_59_low60_0_low20_3 - neg_f_59_low60_0_low20_3,
    r_59_63 * (const 64 2) = r_59_62 - u_59_62,
    s_59_63 * (const 64 2) = s_59_62 - v_59_62
;

assume
    neg_f_59_low60_0_low20_4 = neg_g_59_low60_0_low20_3,
    u_59_63 = r_59_62,
    v_59_63 = s_59_62,
    neg_g_59_low60_0_low20_4 * 2 = neg_g_59_low60_0_low20_3 - neg_f_59_low60_0_low20_3,
    r_59_63 * 2 = r_59_62 - u_59_62,
    s_59_63 * 2 = s_59_62 - v_59_62
&&
    true
;

{
    u_59_63 * neg_f_59_low60_0_low20_0 + v_59_63 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_63 * neg_f_59_low60_0_low20_0 + s_59_63 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_4 + u_59_63 * (const 64 (2**21)) + v_59_63 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_4 + r_59_63 * (const 64 (2**21)) + s_59_63 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_4,
    neg_f_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_4,
    neg_g_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 63)) <=s delta, delta <=s (const 64 (1 + 2*63)),
    (const 64 (-(2**20))) <=s u_59_63, u_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_63, v_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_63, r_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_63, s_59_63 <=s (const 64 ((2**20))),
    u_59_63 + v_59_63 <=s (const 64 (2**20)),
    u_59_63 - v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 + v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 - v_59_63 <=s (const 64 (2**20)),
    r_59_63 + s_59_63 <=s (const 64 (2**20)),
    r_59_63 - s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 + s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 - s_59_63 <=s (const 64 (2**20)),
    u_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_59_63 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_063_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_4,
sint64 neg_g_59_low60_0_low20_4,
sint64 neg_f_59_low60_0_low20_5,
sint64 neg_g_59_low60_0_low20_5,
sint64 u_59_63,
sint64 v_59_63,
sint64 r_59_63,
sint64 s_59_63,
sint64 u_59_64,
sint64 v_59_64,
sint64 r_59_64,
sint64 s_59_64,
bit ne
)={
    u_59_63 * neg_f_59_low60_0_low20_0 + v_59_63 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_4 * (-(2**20)),
    r_59_63 * neg_f_59_low60_0_low20_0 + s_59_63 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_4 * (-(2**20))
&&
    u_59_63 * neg_f_59_low60_0_low20_0 + v_59_63 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_4 * (const 64 (-(2**20))),
    r_59_63 * neg_f_59_low60_0_low20_0 + s_59_63 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_4 + u_59_63 * (const 64 (2**21)) + v_59_63 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_4 + r_59_63 * (const 64 (2**21)) + s_59_63 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_4,
    neg_f_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_4,
    neg_g_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 63)) <=s delta, delta <=s (const 64 (1 + 2*63)),
    (const 64 (-(2**20))) <=s u_59_63, u_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_63, v_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_63, r_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_63, s_59_63 <=s (const 64 ((2**20))),
    u_59_63 + v_59_63 <=s (const 64 (2**20)),
    u_59_63 - v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 + v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 - v_59_63 <=s (const 64 (2**20)),
    r_59_63 + s_59_63 <=s (const 64 (2**20)),
    r_59_63 - s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 + s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 - s_59_63 <=s (const 64 (2**20)),
    u_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_59_63 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step63

// premise a
assume
neg_g_59_low60_0_low20_4 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_5 neg_f_59_low60_0_low20_4;
mov u_59_64 u_59_63;
mov v_59_64 v_59_63;

asr neg_g_59_low60_0_low20_5 neg_g_59_low60_0_low20_4 1;
asr r_59_64 r_59_63 1;
asr s_59_64 s_59_63 1;
assert
    true
&&
    neg_f_59_low60_0_low20_5 = neg_f_59_low60_0_low20_4,
    u_59_64 = u_59_63,
    v_59_64 = v_59_63,
    neg_g_59_low60_0_low20_5 * (const 64 2) = neg_g_59_low60_0_low20_4,
    r_59_64 * (const 64 2) = r_59_63,
    s_59_64 * (const 64 2) = s_59_63
;

assume
    neg_f_59_low60_0_low20_5 = neg_f_59_low60_0_low20_4,
    u_59_64 = u_59_63,
    v_59_64 = v_59_63,
    neg_g_59_low60_0_low20_5 * 2 = neg_g_59_low60_0_low20_4,
    r_59_64 * 2 = r_59_63,
    s_59_64 * 2 = s_59_63
&&
    true
;

{
    u_59_64 * neg_f_59_low60_0_low20_0 + v_59_64 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_64 * neg_f_59_low60_0_low20_0 + s_59_64 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_5 + u_59_64 * (const 64 (2**21)) + v_59_64 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_5 + r_59_64 * (const 64 (2**21)) + s_59_64 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_5,
    neg_f_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_5,
    neg_g_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 64)) <=s delta, delta <=s (const 64 (1 + 2*64)),
    (const 64 (-(2**20))) <=s u_59_64, u_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_64, v_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_64, r_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_64, s_59_64 <=s (const 64 ((2**20))),
    u_59_64 + v_59_64 <=s (const 64 (2**20)),
    u_59_64 - v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 + v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 - v_59_64 <=s (const 64 (2**20)),
    r_59_64 + s_59_64 <=s (const 64 (2**20)),
    r_59_64 - s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 + s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 - s_59_64 <=s (const 64 (2**20)),
    u_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_59_64 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_063_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_4,
sint64 neg_g_59_low60_0_low20_4,
sint64 neg_f_59_low60_0_low20_5,
sint64 neg_g_59_low60_0_low20_5,
sint64 u_59_63,
sint64 v_59_63,
sint64 r_59_63,
sint64 s_59_63,
sint64 u_59_64,
sint64 v_59_64,
sint64 r_59_64,
sint64 s_59_64,
bit ne
)={
    u_59_63 * neg_f_59_low60_0_low20_0 + v_59_63 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_4 * (-(2**20)),
    r_59_63 * neg_f_59_low60_0_low20_0 + s_59_63 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_4 * (-(2**20))
&&
    u_59_63 * neg_f_59_low60_0_low20_0 + v_59_63 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_4 * (const 64 (-(2**20))),
    r_59_63 * neg_f_59_low60_0_low20_0 + s_59_63 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_4 + u_59_63 * (const 64 (2**21)) + v_59_63 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_4 + r_59_63 * (const 64 (2**21)) + s_59_63 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_4,
    neg_f_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_4,
    neg_g_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 63)) <=s delta, delta <=s (const 64 (1 + 2*63)),
    (const 64 (-(2**20))) <=s u_59_63, u_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_63, v_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_63, r_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_63, s_59_63 <=s (const 64 ((2**20))),
    u_59_63 + v_59_63 <=s (const 64 (2**20)),
    u_59_63 - v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 + v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 - v_59_63 <=s (const 64 (2**20)),
    r_59_63 + s_59_63 <=s (const 64 (2**20)),
    r_59_63 - s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 + s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 - s_59_63 <=s (const 64 (2**20)),
    u_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_59_63 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step63

// premise b
assume
neg_g_59_low60_0_low20_4 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_5 neg_f_59_low60_0_low20_4;
mov u_59_64 u_59_63;
mov v_59_64 v_59_63;

add neg_g_59_low60_0_low20_5 neg_g_59_low60_0_low20_4 neg_f_59_low60_0_low20_4;
asr neg_g_59_low60_0_low20_5 neg_g_59_low60_0_low20_5 1;
add r_59_64 r_59_63 u_59_63;
asr r_59_64 r_59_64 1;
add s_59_64 s_59_63 v_59_63;
asr s_59_64 s_59_64 1;
assert
    true
&&
    neg_f_59_low60_0_low20_5 = neg_f_59_low60_0_low20_4,
    u_59_64 = u_59_63,
    v_59_64 = v_59_63,
    neg_g_59_low60_0_low20_5 * (const 64 2) = neg_g_59_low60_0_low20_4 + neg_f_59_low60_0_low20_4,
    r_59_64 * (const 64 2) = r_59_63 + u_59_63,
    s_59_64 * (const 64 2) = s_59_63 + v_59_63
;

assume
    neg_f_59_low60_0_low20_5 = neg_f_59_low60_0_low20_4,
    u_59_64 = u_59_63,
    v_59_64 = v_59_63,
    neg_g_59_low60_0_low20_5 * 2 = neg_g_59_low60_0_low20_4 + neg_f_59_low60_0_low20_4,
    r_59_64 * 2 = r_59_63 + u_59_63,
    s_59_64 * 2 = s_59_63 + v_59_63
&&
    true
;

{
    u_59_64 * neg_f_59_low60_0_low20_0 + v_59_64 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_64 * neg_f_59_low60_0_low20_0 + s_59_64 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_5 + u_59_64 * (const 64 (2**21)) + v_59_64 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_5 + r_59_64 * (const 64 (2**21)) + s_59_64 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_5,
    neg_f_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_5,
    neg_g_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 64)) <=s delta, delta <=s (const 64 (1 + 2*64)),
    (const 64 (-(2**20))) <=s u_59_64, u_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_64, v_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_64, r_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_64, s_59_64 <=s (const 64 ((2**20))),
    u_59_64 + v_59_64 <=s (const 64 (2**20)),
    u_59_64 - v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 + v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 - v_59_64 <=s (const 64 (2**20)),
    r_59_64 + s_59_64 <=s (const 64 (2**20)),
    r_59_64 - s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 + s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 - s_59_64 <=s (const 64 (2**20)),
    u_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_59_64 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_063_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_4,
sint64 neg_g_59_low60_0_low20_4,
sint64 neg_f_59_low60_0_low20_5,
sint64 neg_g_59_low60_0_low20_5,
sint64 u_59_63,
sint64 v_59_63,
sint64 r_59_63,
sint64 s_59_63,
sint64 u_59_64,
sint64 v_59_64,
sint64 r_59_64,
sint64 s_59_64,
bit ne
)={
    u_59_63 * neg_f_59_low60_0_low20_0 + v_59_63 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_4 * (-(2**20)),
    r_59_63 * neg_f_59_low60_0_low20_0 + s_59_63 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_4 * (-(2**20))
&&
    u_59_63 * neg_f_59_low60_0_low20_0 + v_59_63 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_4 * (const 64 (-(2**20))),
    r_59_63 * neg_f_59_low60_0_low20_0 + s_59_63 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_4 + u_59_63 * (const 64 (2**21)) + v_59_63 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_4 + r_59_63 * (const 64 (2**21)) + s_59_63 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_4,
    neg_f_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_4,
    neg_g_59_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 63)) <=s delta, delta <=s (const 64 (1 + 2*63)),
    (const 64 (-(2**20))) <=s u_59_63, u_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_63, v_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_63, r_59_63 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_63, s_59_63 <=s (const 64 ((2**20))),
    u_59_63 + v_59_63 <=s (const 64 (2**20)),
    u_59_63 - v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 + v_59_63 <=s (const 64 (2**20)),
    (const 64 0) - u_59_63 - v_59_63 <=s (const 64 (2**20)),
    r_59_63 + s_59_63 <=s (const 64 (2**20)),
    r_59_63 - s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 + s_59_63 <=s (const 64 (2**20)),
    (const 64 0) - r_59_63 - s_59_63 <=s (const 64 (2**20)),
    u_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_59_63 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_59_63 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step63

// premise c
assume
neg_g_59_low60_0_low20_4 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_5 neg_g_59_low60_0_low20_4;
mov u_59_64 r_59_63;
mov v_59_64 s_59_63;

subs dc neg_g_59_low60_0_low20_5 neg_g_59_low60_0_low20_4 neg_f_59_low60_0_low20_4;
asr neg_g_59_low60_0_low20_5 neg_g_59_low60_0_low20_5 1;
subs dc r_59_64 r_59_63 u_59_63;
asr r_59_64 r_59_64 1;
subs dc s_59_64 s_59_63 v_59_63;
asr s_59_64 s_59_64 1;
assert
    true
&&
    neg_f_59_low60_0_low20_5 = neg_g_59_low60_0_low20_4,
    u_59_64 = r_59_63,
    v_59_64 = s_59_63,
    neg_g_59_low60_0_low20_5 * (const 64 2) = neg_g_59_low60_0_low20_4 - neg_f_59_low60_0_low20_4,
    r_59_64 * (const 64 2) = r_59_63 - u_59_63,
    s_59_64 * (const 64 2) = s_59_63 - v_59_63
;

assume
    neg_f_59_low60_0_low20_5 = neg_g_59_low60_0_low20_4,
    u_59_64 = r_59_63,
    v_59_64 = s_59_63,
    neg_g_59_low60_0_low20_5 * 2 = neg_g_59_low60_0_low20_4 - neg_f_59_low60_0_low20_4,
    r_59_64 * 2 = r_59_63 - u_59_63,
    s_59_64 * 2 = s_59_63 - v_59_63
&&
    true
;

{
    u_59_64 * neg_f_59_low60_0_low20_0 + v_59_64 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_64 * neg_f_59_low60_0_low20_0 + s_59_64 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_5 + u_59_64 * (const 64 (2**21)) + v_59_64 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_5 + r_59_64 * (const 64 (2**21)) + s_59_64 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_5,
    neg_f_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_5,
    neg_g_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 64)) <=s delta, delta <=s (const 64 (1 + 2*64)),
    (const 64 (-(2**20))) <=s u_59_64, u_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_64, v_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_64, r_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_64, s_59_64 <=s (const 64 ((2**20))),
    u_59_64 + v_59_64 <=s (const 64 (2**20)),
    u_59_64 - v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 + v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 - v_59_64 <=s (const 64 (2**20)),
    r_59_64 + s_59_64 <=s (const 64 (2**20)),
    r_59_64 - s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 + s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 - s_59_64 <=s (const 64 (2**20)),
    u_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_59_64 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_064_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_5,
sint64 neg_g_59_low60_0_low20_5,
sint64 neg_f_59_low60_0_low20_6,
sint64 neg_g_59_low60_0_low20_6,
sint64 u_59_64,
sint64 v_59_64,
sint64 r_59_64,
sint64 s_59_64,
sint64 u_59_65,
sint64 v_59_65,
sint64 r_59_65,
sint64 s_59_65,
bit ne
)={
    u_59_64 * neg_f_59_low60_0_low20_0 + v_59_64 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_5 * (-(2**20)),
    r_59_64 * neg_f_59_low60_0_low20_0 + s_59_64 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_5 * (-(2**20))
&&
    u_59_64 * neg_f_59_low60_0_low20_0 + v_59_64 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_5 * (const 64 (-(2**20))),
    r_59_64 * neg_f_59_low60_0_low20_0 + s_59_64 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_5 + u_59_64 * (const 64 (2**21)) + v_59_64 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_5 + r_59_64 * (const 64 (2**21)) + s_59_64 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_5,
    neg_f_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_5,
    neg_g_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 64)) <=s delta, delta <=s (const 64 (1 + 2*64)),
    (const 64 (-(2**20))) <=s u_59_64, u_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_64, v_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_64, r_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_64, s_59_64 <=s (const 64 ((2**20))),
    u_59_64 + v_59_64 <=s (const 64 (2**20)),
    u_59_64 - v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 + v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 - v_59_64 <=s (const 64 (2**20)),
    r_59_64 + s_59_64 <=s (const 64 (2**20)),
    r_59_64 - s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 + s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 - s_59_64 <=s (const 64 (2**20)),
    u_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_59_64 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step64

// premise a
assume
neg_g_59_low60_0_low20_5 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_6 neg_f_59_low60_0_low20_5;
mov u_59_65 u_59_64;
mov v_59_65 v_59_64;

asr neg_g_59_low60_0_low20_6 neg_g_59_low60_0_low20_5 1;
asr r_59_65 r_59_64 1;
asr s_59_65 s_59_64 1;
assert
    true
&&
    neg_f_59_low60_0_low20_6 = neg_f_59_low60_0_low20_5,
    u_59_65 = u_59_64,
    v_59_65 = v_59_64,
    neg_g_59_low60_0_low20_6 * (const 64 2) = neg_g_59_low60_0_low20_5,
    r_59_65 * (const 64 2) = r_59_64,
    s_59_65 * (const 64 2) = s_59_64
;

assume
    neg_f_59_low60_0_low20_6 = neg_f_59_low60_0_low20_5,
    u_59_65 = u_59_64,
    v_59_65 = v_59_64,
    neg_g_59_low60_0_low20_6 * 2 = neg_g_59_low60_0_low20_5,
    r_59_65 * 2 = r_59_64,
    s_59_65 * 2 = s_59_64
&&
    true
;

{
    u_59_65 * neg_f_59_low60_0_low20_0 + v_59_65 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_65 * neg_f_59_low60_0_low20_0 + s_59_65 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_6 + u_59_65 * (const 64 (2**21)) + v_59_65 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_6 + r_59_65 * (const 64 (2**21)) + s_59_65 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_6,
    neg_f_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_6,
    neg_g_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 65)) <=s delta, delta <=s (const 64 (1 + 2*65)),
    (const 64 (-(2**20))) <=s u_59_65, u_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_65, v_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_65, r_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_65, s_59_65 <=s (const 64 ((2**20))),
    u_59_65 + v_59_65 <=s (const 64 (2**20)),
    u_59_65 - v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 + v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 - v_59_65 <=s (const 64 (2**20)),
    r_59_65 + s_59_65 <=s (const 64 (2**20)),
    r_59_65 - s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 + s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 - s_59_65 <=s (const 64 (2**20)),
    u_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_59_65 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_064_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_5,
sint64 neg_g_59_low60_0_low20_5,
sint64 neg_f_59_low60_0_low20_6,
sint64 neg_g_59_low60_0_low20_6,
sint64 u_59_64,
sint64 v_59_64,
sint64 r_59_64,
sint64 s_59_64,
sint64 u_59_65,
sint64 v_59_65,
sint64 r_59_65,
sint64 s_59_65,
bit ne
)={
    u_59_64 * neg_f_59_low60_0_low20_0 + v_59_64 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_5 * (-(2**20)),
    r_59_64 * neg_f_59_low60_0_low20_0 + s_59_64 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_5 * (-(2**20))
&&
    u_59_64 * neg_f_59_low60_0_low20_0 + v_59_64 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_5 * (const 64 (-(2**20))),
    r_59_64 * neg_f_59_low60_0_low20_0 + s_59_64 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_5 + u_59_64 * (const 64 (2**21)) + v_59_64 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_5 + r_59_64 * (const 64 (2**21)) + s_59_64 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_5,
    neg_f_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_5,
    neg_g_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 64)) <=s delta, delta <=s (const 64 (1 + 2*64)),
    (const 64 (-(2**20))) <=s u_59_64, u_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_64, v_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_64, r_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_64, s_59_64 <=s (const 64 ((2**20))),
    u_59_64 + v_59_64 <=s (const 64 (2**20)),
    u_59_64 - v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 + v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 - v_59_64 <=s (const 64 (2**20)),
    r_59_64 + s_59_64 <=s (const 64 (2**20)),
    r_59_64 - s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 + s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 - s_59_64 <=s (const 64 (2**20)),
    u_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_59_64 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step64

// premise b
assume
neg_g_59_low60_0_low20_5 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_6 neg_f_59_low60_0_low20_5;
mov u_59_65 u_59_64;
mov v_59_65 v_59_64;

add neg_g_59_low60_0_low20_6 neg_g_59_low60_0_low20_5 neg_f_59_low60_0_low20_5;
asr neg_g_59_low60_0_low20_6 neg_g_59_low60_0_low20_6 1;
add r_59_65 r_59_64 u_59_64;
asr r_59_65 r_59_65 1;
add s_59_65 s_59_64 v_59_64;
asr s_59_65 s_59_65 1;
assert
    true
&&
    neg_f_59_low60_0_low20_6 = neg_f_59_low60_0_low20_5,
    u_59_65 = u_59_64,
    v_59_65 = v_59_64,
    neg_g_59_low60_0_low20_6 * (const 64 2) = neg_g_59_low60_0_low20_5 + neg_f_59_low60_0_low20_5,
    r_59_65 * (const 64 2) = r_59_64 + u_59_64,
    s_59_65 * (const 64 2) = s_59_64 + v_59_64
;

assume
    neg_f_59_low60_0_low20_6 = neg_f_59_low60_0_low20_5,
    u_59_65 = u_59_64,
    v_59_65 = v_59_64,
    neg_g_59_low60_0_low20_6 * 2 = neg_g_59_low60_0_low20_5 + neg_f_59_low60_0_low20_5,
    r_59_65 * 2 = r_59_64 + u_59_64,
    s_59_65 * 2 = s_59_64 + v_59_64
&&
    true
;

{
    u_59_65 * neg_f_59_low60_0_low20_0 + v_59_65 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_65 * neg_f_59_low60_0_low20_0 + s_59_65 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_6 + u_59_65 * (const 64 (2**21)) + v_59_65 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_6 + r_59_65 * (const 64 (2**21)) + s_59_65 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_6,
    neg_f_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_6,
    neg_g_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 65)) <=s delta, delta <=s (const 64 (1 + 2*65)),
    (const 64 (-(2**20))) <=s u_59_65, u_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_65, v_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_65, r_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_65, s_59_65 <=s (const 64 ((2**20))),
    u_59_65 + v_59_65 <=s (const 64 (2**20)),
    u_59_65 - v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 + v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 - v_59_65 <=s (const 64 (2**20)),
    r_59_65 + s_59_65 <=s (const 64 (2**20)),
    r_59_65 - s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 + s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 - s_59_65 <=s (const 64 (2**20)),
    u_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_59_65 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_064_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_5,
sint64 neg_g_59_low60_0_low20_5,
sint64 neg_f_59_low60_0_low20_6,
sint64 neg_g_59_low60_0_low20_6,
sint64 u_59_64,
sint64 v_59_64,
sint64 r_59_64,
sint64 s_59_64,
sint64 u_59_65,
sint64 v_59_65,
sint64 r_59_65,
sint64 s_59_65,
bit ne
)={
    u_59_64 * neg_f_59_low60_0_low20_0 + v_59_64 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_5 * (-(2**20)),
    r_59_64 * neg_f_59_low60_0_low20_0 + s_59_64 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_5 * (-(2**20))
&&
    u_59_64 * neg_f_59_low60_0_low20_0 + v_59_64 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_5 * (const 64 (-(2**20))),
    r_59_64 * neg_f_59_low60_0_low20_0 + s_59_64 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_5 + u_59_64 * (const 64 (2**21)) + v_59_64 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_5 + r_59_64 * (const 64 (2**21)) + s_59_64 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_5,
    neg_f_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_5,
    neg_g_59_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 64)) <=s delta, delta <=s (const 64 (1 + 2*64)),
    (const 64 (-(2**20))) <=s u_59_64, u_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_64, v_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_64, r_59_64 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_64, s_59_64 <=s (const 64 ((2**20))),
    u_59_64 + v_59_64 <=s (const 64 (2**20)),
    u_59_64 - v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 + v_59_64 <=s (const 64 (2**20)),
    (const 64 0) - u_59_64 - v_59_64 <=s (const 64 (2**20)),
    r_59_64 + s_59_64 <=s (const 64 (2**20)),
    r_59_64 - s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 + s_59_64 <=s (const 64 (2**20)),
    (const 64 0) - r_59_64 - s_59_64 <=s (const 64 (2**20)),
    u_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_59_64 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_59_64 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step64

// premise c
assume
neg_g_59_low60_0_low20_5 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_6 neg_g_59_low60_0_low20_5;
mov u_59_65 r_59_64;
mov v_59_65 s_59_64;

subs dc neg_g_59_low60_0_low20_6 neg_g_59_low60_0_low20_5 neg_f_59_low60_0_low20_5;
asr neg_g_59_low60_0_low20_6 neg_g_59_low60_0_low20_6 1;
subs dc r_59_65 r_59_64 u_59_64;
asr r_59_65 r_59_65 1;
subs dc s_59_65 s_59_64 v_59_64;
asr s_59_65 s_59_65 1;
assert
    true
&&
    neg_f_59_low60_0_low20_6 = neg_g_59_low60_0_low20_5,
    u_59_65 = r_59_64,
    v_59_65 = s_59_64,
    neg_g_59_low60_0_low20_6 * (const 64 2) = neg_g_59_low60_0_low20_5 - neg_f_59_low60_0_low20_5,
    r_59_65 * (const 64 2) = r_59_64 - u_59_64,
    s_59_65 * (const 64 2) = s_59_64 - v_59_64
;

assume
    neg_f_59_low60_0_low20_6 = neg_g_59_low60_0_low20_5,
    u_59_65 = r_59_64,
    v_59_65 = s_59_64,
    neg_g_59_low60_0_low20_6 * 2 = neg_g_59_low60_0_low20_5 - neg_f_59_low60_0_low20_5,
    r_59_65 * 2 = r_59_64 - u_59_64,
    s_59_65 * 2 = s_59_64 - v_59_64
&&
    true
;

{
    u_59_65 * neg_f_59_low60_0_low20_0 + v_59_65 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_65 * neg_f_59_low60_0_low20_0 + s_59_65 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_6 + u_59_65 * (const 64 (2**21)) + v_59_65 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_6 + r_59_65 * (const 64 (2**21)) + s_59_65 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_6,
    neg_f_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_6,
    neg_g_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 65)) <=s delta, delta <=s (const 64 (1 + 2*65)),
    (const 64 (-(2**20))) <=s u_59_65, u_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_65, v_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_65, r_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_65, s_59_65 <=s (const 64 ((2**20))),
    u_59_65 + v_59_65 <=s (const 64 (2**20)),
    u_59_65 - v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 + v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 - v_59_65 <=s (const 64 (2**20)),
    r_59_65 + s_59_65 <=s (const 64 (2**20)),
    r_59_65 - s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 + s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 - s_59_65 <=s (const 64 (2**20)),
    u_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_59_65 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_065_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_6,
sint64 neg_g_59_low60_0_low20_6,
sint64 neg_f_59_low60_0_low20_7,
sint64 neg_g_59_low60_0_low20_7,
sint64 u_59_65,
sint64 v_59_65,
sint64 r_59_65,
sint64 s_59_65,
sint64 u_59_66,
sint64 v_59_66,
sint64 r_59_66,
sint64 s_59_66,
bit ne
)={
    u_59_65 * neg_f_59_low60_0_low20_0 + v_59_65 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_6 * (-(2**20)),
    r_59_65 * neg_f_59_low60_0_low20_0 + s_59_65 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_6 * (-(2**20))
&&
    u_59_65 * neg_f_59_low60_0_low20_0 + v_59_65 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_6 * (const 64 (-(2**20))),
    r_59_65 * neg_f_59_low60_0_low20_0 + s_59_65 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_6 + u_59_65 * (const 64 (2**21)) + v_59_65 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_6 + r_59_65 * (const 64 (2**21)) + s_59_65 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_6,
    neg_f_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_6,
    neg_g_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 65)) <=s delta, delta <=s (const 64 (1 + 2*65)),
    (const 64 (-(2**20))) <=s u_59_65, u_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_65, v_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_65, r_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_65, s_59_65 <=s (const 64 ((2**20))),
    u_59_65 + v_59_65 <=s (const 64 (2**20)),
    u_59_65 - v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 + v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 - v_59_65 <=s (const 64 (2**20)),
    r_59_65 + s_59_65 <=s (const 64 (2**20)),
    r_59_65 - s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 + s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 - s_59_65 <=s (const 64 (2**20)),
    u_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_59_65 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step65

// premise a
assume
neg_g_59_low60_0_low20_6 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_7 neg_f_59_low60_0_low20_6;
mov u_59_66 u_59_65;
mov v_59_66 v_59_65;

asr neg_g_59_low60_0_low20_7 neg_g_59_low60_0_low20_6 1;
asr r_59_66 r_59_65 1;
asr s_59_66 s_59_65 1;
assert
    true
&&
    neg_f_59_low60_0_low20_7 = neg_f_59_low60_0_low20_6,
    u_59_66 = u_59_65,
    v_59_66 = v_59_65,
    neg_g_59_low60_0_low20_7 * (const 64 2) = neg_g_59_low60_0_low20_6,
    r_59_66 * (const 64 2) = r_59_65,
    s_59_66 * (const 64 2) = s_59_65
;

assume
    neg_f_59_low60_0_low20_7 = neg_f_59_low60_0_low20_6,
    u_59_66 = u_59_65,
    v_59_66 = v_59_65,
    neg_g_59_low60_0_low20_7 * 2 = neg_g_59_low60_0_low20_6,
    r_59_66 * 2 = r_59_65,
    s_59_66 * 2 = s_59_65
&&
    true
;

{
    u_59_66 * neg_f_59_low60_0_low20_0 + v_59_66 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_66 * neg_f_59_low60_0_low20_0 + s_59_66 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_7 + u_59_66 * (const 64 (2**21)) + v_59_66 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_7 + r_59_66 * (const 64 (2**21)) + s_59_66 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_7,
    neg_f_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_7,
    neg_g_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 66)) <=s delta, delta <=s (const 64 (1 + 2*66)),
    (const 64 (-(2**20))) <=s u_59_66, u_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_66, v_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_66, r_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_66, s_59_66 <=s (const 64 ((2**20))),
    u_59_66 + v_59_66 <=s (const 64 (2**20)),
    u_59_66 - v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 + v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 - v_59_66 <=s (const 64 (2**20)),
    r_59_66 + s_59_66 <=s (const 64 (2**20)),
    r_59_66 - s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 + s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 - s_59_66 <=s (const 64 (2**20)),
    u_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_59_66 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_065_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_6,
sint64 neg_g_59_low60_0_low20_6,
sint64 neg_f_59_low60_0_low20_7,
sint64 neg_g_59_low60_0_low20_7,
sint64 u_59_65,
sint64 v_59_65,
sint64 r_59_65,
sint64 s_59_65,
sint64 u_59_66,
sint64 v_59_66,
sint64 r_59_66,
sint64 s_59_66,
bit ne
)={
    u_59_65 * neg_f_59_low60_0_low20_0 + v_59_65 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_6 * (-(2**20)),
    r_59_65 * neg_f_59_low60_0_low20_0 + s_59_65 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_6 * (-(2**20))
&&
    u_59_65 * neg_f_59_low60_0_low20_0 + v_59_65 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_6 * (const 64 (-(2**20))),
    r_59_65 * neg_f_59_low60_0_low20_0 + s_59_65 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_6 + u_59_65 * (const 64 (2**21)) + v_59_65 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_6 + r_59_65 * (const 64 (2**21)) + s_59_65 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_6,
    neg_f_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_6,
    neg_g_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 65)) <=s delta, delta <=s (const 64 (1 + 2*65)),
    (const 64 (-(2**20))) <=s u_59_65, u_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_65, v_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_65, r_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_65, s_59_65 <=s (const 64 ((2**20))),
    u_59_65 + v_59_65 <=s (const 64 (2**20)),
    u_59_65 - v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 + v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 - v_59_65 <=s (const 64 (2**20)),
    r_59_65 + s_59_65 <=s (const 64 (2**20)),
    r_59_65 - s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 + s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 - s_59_65 <=s (const 64 (2**20)),
    u_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_59_65 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step65

// premise b
assume
neg_g_59_low60_0_low20_6 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_7 neg_f_59_low60_0_low20_6;
mov u_59_66 u_59_65;
mov v_59_66 v_59_65;

add neg_g_59_low60_0_low20_7 neg_g_59_low60_0_low20_6 neg_f_59_low60_0_low20_6;
asr neg_g_59_low60_0_low20_7 neg_g_59_low60_0_low20_7 1;
add r_59_66 r_59_65 u_59_65;
asr r_59_66 r_59_66 1;
add s_59_66 s_59_65 v_59_65;
asr s_59_66 s_59_66 1;
assert
    true
&&
    neg_f_59_low60_0_low20_7 = neg_f_59_low60_0_low20_6,
    u_59_66 = u_59_65,
    v_59_66 = v_59_65,
    neg_g_59_low60_0_low20_7 * (const 64 2) = neg_g_59_low60_0_low20_6 + neg_f_59_low60_0_low20_6,
    r_59_66 * (const 64 2) = r_59_65 + u_59_65,
    s_59_66 * (const 64 2) = s_59_65 + v_59_65
;

assume
    neg_f_59_low60_0_low20_7 = neg_f_59_low60_0_low20_6,
    u_59_66 = u_59_65,
    v_59_66 = v_59_65,
    neg_g_59_low60_0_low20_7 * 2 = neg_g_59_low60_0_low20_6 + neg_f_59_low60_0_low20_6,
    r_59_66 * 2 = r_59_65 + u_59_65,
    s_59_66 * 2 = s_59_65 + v_59_65
&&
    true
;

{
    u_59_66 * neg_f_59_low60_0_low20_0 + v_59_66 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_66 * neg_f_59_low60_0_low20_0 + s_59_66 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_7 + u_59_66 * (const 64 (2**21)) + v_59_66 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_7 + r_59_66 * (const 64 (2**21)) + s_59_66 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_7,
    neg_f_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_7,
    neg_g_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 66)) <=s delta, delta <=s (const 64 (1 + 2*66)),
    (const 64 (-(2**20))) <=s u_59_66, u_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_66, v_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_66, r_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_66, s_59_66 <=s (const 64 ((2**20))),
    u_59_66 + v_59_66 <=s (const 64 (2**20)),
    u_59_66 - v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 + v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 - v_59_66 <=s (const 64 (2**20)),
    r_59_66 + s_59_66 <=s (const 64 (2**20)),
    r_59_66 - s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 + s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 - s_59_66 <=s (const 64 (2**20)),
    u_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_59_66 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_065_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_6,
sint64 neg_g_59_low60_0_low20_6,
sint64 neg_f_59_low60_0_low20_7,
sint64 neg_g_59_low60_0_low20_7,
sint64 u_59_65,
sint64 v_59_65,
sint64 r_59_65,
sint64 s_59_65,
sint64 u_59_66,
sint64 v_59_66,
sint64 r_59_66,
sint64 s_59_66,
bit ne
)={
    u_59_65 * neg_f_59_low60_0_low20_0 + v_59_65 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_6 * (-(2**20)),
    r_59_65 * neg_f_59_low60_0_low20_0 + s_59_65 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_6 * (-(2**20))
&&
    u_59_65 * neg_f_59_low60_0_low20_0 + v_59_65 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_6 * (const 64 (-(2**20))),
    r_59_65 * neg_f_59_low60_0_low20_0 + s_59_65 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_6 + u_59_65 * (const 64 (2**21)) + v_59_65 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_6 + r_59_65 * (const 64 (2**21)) + s_59_65 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_6,
    neg_f_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_6,
    neg_g_59_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 65)) <=s delta, delta <=s (const 64 (1 + 2*65)),
    (const 64 (-(2**20))) <=s u_59_65, u_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_65, v_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_65, r_59_65 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_65, s_59_65 <=s (const 64 ((2**20))),
    u_59_65 + v_59_65 <=s (const 64 (2**20)),
    u_59_65 - v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 + v_59_65 <=s (const 64 (2**20)),
    (const 64 0) - u_59_65 - v_59_65 <=s (const 64 (2**20)),
    r_59_65 + s_59_65 <=s (const 64 (2**20)),
    r_59_65 - s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 + s_59_65 <=s (const 64 (2**20)),
    (const 64 0) - r_59_65 - s_59_65 <=s (const 64 (2**20)),
    u_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_59_65 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_59_65 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step65

// premise c
assume
neg_g_59_low60_0_low20_6 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_7 neg_g_59_low60_0_low20_6;
mov u_59_66 r_59_65;
mov v_59_66 s_59_65;

subs dc neg_g_59_low60_0_low20_7 neg_g_59_low60_0_low20_6 neg_f_59_low60_0_low20_6;
asr neg_g_59_low60_0_low20_7 neg_g_59_low60_0_low20_7 1;
subs dc r_59_66 r_59_65 u_59_65;
asr r_59_66 r_59_66 1;
subs dc s_59_66 s_59_65 v_59_65;
asr s_59_66 s_59_66 1;
assert
    true
&&
    neg_f_59_low60_0_low20_7 = neg_g_59_low60_0_low20_6,
    u_59_66 = r_59_65,
    v_59_66 = s_59_65,
    neg_g_59_low60_0_low20_7 * (const 64 2) = neg_g_59_low60_0_low20_6 - neg_f_59_low60_0_low20_6,
    r_59_66 * (const 64 2) = r_59_65 - u_59_65,
    s_59_66 * (const 64 2) = s_59_65 - v_59_65
;

assume
    neg_f_59_low60_0_low20_7 = neg_g_59_low60_0_low20_6,
    u_59_66 = r_59_65,
    v_59_66 = s_59_65,
    neg_g_59_low60_0_low20_7 * 2 = neg_g_59_low60_0_low20_6 - neg_f_59_low60_0_low20_6,
    r_59_66 * 2 = r_59_65 - u_59_65,
    s_59_66 * 2 = s_59_65 - v_59_65
&&
    true
;

{
    u_59_66 * neg_f_59_low60_0_low20_0 + v_59_66 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_66 * neg_f_59_low60_0_low20_0 + s_59_66 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_7 + u_59_66 * (const 64 (2**21)) + v_59_66 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_7 + r_59_66 * (const 64 (2**21)) + s_59_66 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_7,
    neg_f_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_7,
    neg_g_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 66)) <=s delta, delta <=s (const 64 (1 + 2*66)),
    (const 64 (-(2**20))) <=s u_59_66, u_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_66, v_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_66, r_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_66, s_59_66 <=s (const 64 ((2**20))),
    u_59_66 + v_59_66 <=s (const 64 (2**20)),
    u_59_66 - v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 + v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 - v_59_66 <=s (const 64 (2**20)),
    r_59_66 + s_59_66 <=s (const 64 (2**20)),
    r_59_66 - s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 + s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 - s_59_66 <=s (const 64 (2**20)),
    u_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_59_66 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_066_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_7,
sint64 neg_g_59_low60_0_low20_7,
sint64 neg_f_59_low60_0_low20_8,
sint64 neg_g_59_low60_0_low20_8,
sint64 u_59_66,
sint64 v_59_66,
sint64 r_59_66,
sint64 s_59_66,
sint64 u_59_67,
sint64 v_59_67,
sint64 r_59_67,
sint64 s_59_67,
bit ne
)={
    u_59_66 * neg_f_59_low60_0_low20_0 + v_59_66 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_7 * (-(2**20)),
    r_59_66 * neg_f_59_low60_0_low20_0 + s_59_66 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_7 * (-(2**20))
&&
    u_59_66 * neg_f_59_low60_0_low20_0 + v_59_66 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_7 * (const 64 (-(2**20))),
    r_59_66 * neg_f_59_low60_0_low20_0 + s_59_66 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_7 + u_59_66 * (const 64 (2**21)) + v_59_66 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_7 + r_59_66 * (const 64 (2**21)) + s_59_66 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_7,
    neg_f_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_7,
    neg_g_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 66)) <=s delta, delta <=s (const 64 (1 + 2*66)),
    (const 64 (-(2**20))) <=s u_59_66, u_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_66, v_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_66, r_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_66, s_59_66 <=s (const 64 ((2**20))),
    u_59_66 + v_59_66 <=s (const 64 (2**20)),
    u_59_66 - v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 + v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 - v_59_66 <=s (const 64 (2**20)),
    r_59_66 + s_59_66 <=s (const 64 (2**20)),
    r_59_66 - s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 + s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 - s_59_66 <=s (const 64 (2**20)),
    u_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_59_66 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step66

// premise a
assume
neg_g_59_low60_0_low20_7 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_8 neg_f_59_low60_0_low20_7;
mov u_59_67 u_59_66;
mov v_59_67 v_59_66;

asr neg_g_59_low60_0_low20_8 neg_g_59_low60_0_low20_7 1;
asr r_59_67 r_59_66 1;
asr s_59_67 s_59_66 1;
assert
    true
&&
    neg_f_59_low60_0_low20_8 = neg_f_59_low60_0_low20_7,
    u_59_67 = u_59_66,
    v_59_67 = v_59_66,
    neg_g_59_low60_0_low20_8 * (const 64 2) = neg_g_59_low60_0_low20_7,
    r_59_67 * (const 64 2) = r_59_66,
    s_59_67 * (const 64 2) = s_59_66
;

assume
    neg_f_59_low60_0_low20_8 = neg_f_59_low60_0_low20_7,
    u_59_67 = u_59_66,
    v_59_67 = v_59_66,
    neg_g_59_low60_0_low20_8 * 2 = neg_g_59_low60_0_low20_7,
    r_59_67 * 2 = r_59_66,
    s_59_67 * 2 = s_59_66
&&
    true
;

{
    u_59_67 * neg_f_59_low60_0_low20_0 + v_59_67 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_67 * neg_f_59_low60_0_low20_0 + s_59_67 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_8 + u_59_67 * (const 64 (2**21)) + v_59_67 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_8 + r_59_67 * (const 64 (2**21)) + s_59_67 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_8,
    neg_f_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_8,
    neg_g_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 67)) <=s delta, delta <=s (const 64 (1 + 2*67)),
    (const 64 (-(2**20))) <=s u_59_67, u_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_67, v_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_67, r_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_67, s_59_67 <=s (const 64 ((2**20))),
    u_59_67 + v_59_67 <=s (const 64 (2**20)),
    u_59_67 - v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 + v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 - v_59_67 <=s (const 64 (2**20)),
    r_59_67 + s_59_67 <=s (const 64 (2**20)),
    r_59_67 - s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 + s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 - s_59_67 <=s (const 64 (2**20)),
    u_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_59_67 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_066_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_7,
sint64 neg_g_59_low60_0_low20_7,
sint64 neg_f_59_low60_0_low20_8,
sint64 neg_g_59_low60_0_low20_8,
sint64 u_59_66,
sint64 v_59_66,
sint64 r_59_66,
sint64 s_59_66,
sint64 u_59_67,
sint64 v_59_67,
sint64 r_59_67,
sint64 s_59_67,
bit ne
)={
    u_59_66 * neg_f_59_low60_0_low20_0 + v_59_66 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_7 * (-(2**20)),
    r_59_66 * neg_f_59_low60_0_low20_0 + s_59_66 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_7 * (-(2**20))
&&
    u_59_66 * neg_f_59_low60_0_low20_0 + v_59_66 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_7 * (const 64 (-(2**20))),
    r_59_66 * neg_f_59_low60_0_low20_0 + s_59_66 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_7 + u_59_66 * (const 64 (2**21)) + v_59_66 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_7 + r_59_66 * (const 64 (2**21)) + s_59_66 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_7,
    neg_f_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_7,
    neg_g_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 66)) <=s delta, delta <=s (const 64 (1 + 2*66)),
    (const 64 (-(2**20))) <=s u_59_66, u_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_66, v_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_66, r_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_66, s_59_66 <=s (const 64 ((2**20))),
    u_59_66 + v_59_66 <=s (const 64 (2**20)),
    u_59_66 - v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 + v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 - v_59_66 <=s (const 64 (2**20)),
    r_59_66 + s_59_66 <=s (const 64 (2**20)),
    r_59_66 - s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 + s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 - s_59_66 <=s (const 64 (2**20)),
    u_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_59_66 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step66

// premise b
assume
neg_g_59_low60_0_low20_7 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_8 neg_f_59_low60_0_low20_7;
mov u_59_67 u_59_66;
mov v_59_67 v_59_66;

add neg_g_59_low60_0_low20_8 neg_g_59_low60_0_low20_7 neg_f_59_low60_0_low20_7;
asr neg_g_59_low60_0_low20_8 neg_g_59_low60_0_low20_8 1;
add r_59_67 r_59_66 u_59_66;
asr r_59_67 r_59_67 1;
add s_59_67 s_59_66 v_59_66;
asr s_59_67 s_59_67 1;
assert
    true
&&
    neg_f_59_low60_0_low20_8 = neg_f_59_low60_0_low20_7,
    u_59_67 = u_59_66,
    v_59_67 = v_59_66,
    neg_g_59_low60_0_low20_8 * (const 64 2) = neg_g_59_low60_0_low20_7 + neg_f_59_low60_0_low20_7,
    r_59_67 * (const 64 2) = r_59_66 + u_59_66,
    s_59_67 * (const 64 2) = s_59_66 + v_59_66
;

assume
    neg_f_59_low60_0_low20_8 = neg_f_59_low60_0_low20_7,
    u_59_67 = u_59_66,
    v_59_67 = v_59_66,
    neg_g_59_low60_0_low20_8 * 2 = neg_g_59_low60_0_low20_7 + neg_f_59_low60_0_low20_7,
    r_59_67 * 2 = r_59_66 + u_59_66,
    s_59_67 * 2 = s_59_66 + v_59_66
&&
    true
;

{
    u_59_67 * neg_f_59_low60_0_low20_0 + v_59_67 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_67 * neg_f_59_low60_0_low20_0 + s_59_67 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_8 + u_59_67 * (const 64 (2**21)) + v_59_67 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_8 + r_59_67 * (const 64 (2**21)) + s_59_67 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_8,
    neg_f_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_8,
    neg_g_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 67)) <=s delta, delta <=s (const 64 (1 + 2*67)),
    (const 64 (-(2**20))) <=s u_59_67, u_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_67, v_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_67, r_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_67, s_59_67 <=s (const 64 ((2**20))),
    u_59_67 + v_59_67 <=s (const 64 (2**20)),
    u_59_67 - v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 + v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 - v_59_67 <=s (const 64 (2**20)),
    r_59_67 + s_59_67 <=s (const 64 (2**20)),
    r_59_67 - s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 + s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 - s_59_67 <=s (const 64 (2**20)),
    u_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_59_67 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_066_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_7,
sint64 neg_g_59_low60_0_low20_7,
sint64 neg_f_59_low60_0_low20_8,
sint64 neg_g_59_low60_0_low20_8,
sint64 u_59_66,
sint64 v_59_66,
sint64 r_59_66,
sint64 s_59_66,
sint64 u_59_67,
sint64 v_59_67,
sint64 r_59_67,
sint64 s_59_67,
bit ne
)={
    u_59_66 * neg_f_59_low60_0_low20_0 + v_59_66 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_7 * (-(2**20)),
    r_59_66 * neg_f_59_low60_0_low20_0 + s_59_66 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_7 * (-(2**20))
&&
    u_59_66 * neg_f_59_low60_0_low20_0 + v_59_66 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_7 * (const 64 (-(2**20))),
    r_59_66 * neg_f_59_low60_0_low20_0 + s_59_66 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_7 + u_59_66 * (const 64 (2**21)) + v_59_66 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_7 + r_59_66 * (const 64 (2**21)) + s_59_66 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_7,
    neg_f_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_7,
    neg_g_59_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 66)) <=s delta, delta <=s (const 64 (1 + 2*66)),
    (const 64 (-(2**20))) <=s u_59_66, u_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_66, v_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_66, r_59_66 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_66, s_59_66 <=s (const 64 ((2**20))),
    u_59_66 + v_59_66 <=s (const 64 (2**20)),
    u_59_66 - v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 + v_59_66 <=s (const 64 (2**20)),
    (const 64 0) - u_59_66 - v_59_66 <=s (const 64 (2**20)),
    r_59_66 + s_59_66 <=s (const 64 (2**20)),
    r_59_66 - s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 + s_59_66 <=s (const 64 (2**20)),
    (const 64 0) - r_59_66 - s_59_66 <=s (const 64 (2**20)),
    u_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_59_66 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_59_66 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step66

// premise c
assume
neg_g_59_low60_0_low20_7 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_8 neg_g_59_low60_0_low20_7;
mov u_59_67 r_59_66;
mov v_59_67 s_59_66;

subs dc neg_g_59_low60_0_low20_8 neg_g_59_low60_0_low20_7 neg_f_59_low60_0_low20_7;
asr neg_g_59_low60_0_low20_8 neg_g_59_low60_0_low20_8 1;
subs dc r_59_67 r_59_66 u_59_66;
asr r_59_67 r_59_67 1;
subs dc s_59_67 s_59_66 v_59_66;
asr s_59_67 s_59_67 1;
assert
    true
&&
    neg_f_59_low60_0_low20_8 = neg_g_59_low60_0_low20_7,
    u_59_67 = r_59_66,
    v_59_67 = s_59_66,
    neg_g_59_low60_0_low20_8 * (const 64 2) = neg_g_59_low60_0_low20_7 - neg_f_59_low60_0_low20_7,
    r_59_67 * (const 64 2) = r_59_66 - u_59_66,
    s_59_67 * (const 64 2) = s_59_66 - v_59_66
;

assume
    neg_f_59_low60_0_low20_8 = neg_g_59_low60_0_low20_7,
    u_59_67 = r_59_66,
    v_59_67 = s_59_66,
    neg_g_59_low60_0_low20_8 * 2 = neg_g_59_low60_0_low20_7 - neg_f_59_low60_0_low20_7,
    r_59_67 * 2 = r_59_66 - u_59_66,
    s_59_67 * 2 = s_59_66 - v_59_66
&&
    true
;

{
    u_59_67 * neg_f_59_low60_0_low20_0 + v_59_67 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_67 * neg_f_59_low60_0_low20_0 + s_59_67 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_8 + u_59_67 * (const 64 (2**21)) + v_59_67 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_8 + r_59_67 * (const 64 (2**21)) + s_59_67 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_8,
    neg_f_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_8,
    neg_g_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 67)) <=s delta, delta <=s (const 64 (1 + 2*67)),
    (const 64 (-(2**20))) <=s u_59_67, u_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_67, v_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_67, r_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_67, s_59_67 <=s (const 64 ((2**20))),
    u_59_67 + v_59_67 <=s (const 64 (2**20)),
    u_59_67 - v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 + v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 - v_59_67 <=s (const 64 (2**20)),
    r_59_67 + s_59_67 <=s (const 64 (2**20)),
    r_59_67 - s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 + s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 - s_59_67 <=s (const 64 (2**20)),
    u_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_59_67 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_067_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_8,
sint64 neg_g_59_low60_0_low20_8,
sint64 neg_f_59_low60_0_low20_9,
sint64 neg_g_59_low60_0_low20_9,
sint64 u_59_67,
sint64 v_59_67,
sint64 r_59_67,
sint64 s_59_67,
sint64 u_59_68,
sint64 v_59_68,
sint64 r_59_68,
sint64 s_59_68,
bit ne
)={
    u_59_67 * neg_f_59_low60_0_low20_0 + v_59_67 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_8 * (-(2**20)),
    r_59_67 * neg_f_59_low60_0_low20_0 + s_59_67 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_8 * (-(2**20))
&&
    u_59_67 * neg_f_59_low60_0_low20_0 + v_59_67 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_8 * (const 64 (-(2**20))),
    r_59_67 * neg_f_59_low60_0_low20_0 + s_59_67 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_8 + u_59_67 * (const 64 (2**21)) + v_59_67 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_8 + r_59_67 * (const 64 (2**21)) + s_59_67 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_8,
    neg_f_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_8,
    neg_g_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 67)) <=s delta, delta <=s (const 64 (1 + 2*67)),
    (const 64 (-(2**20))) <=s u_59_67, u_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_67, v_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_67, r_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_67, s_59_67 <=s (const 64 ((2**20))),
    u_59_67 + v_59_67 <=s (const 64 (2**20)),
    u_59_67 - v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 + v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 - v_59_67 <=s (const 64 (2**20)),
    r_59_67 + s_59_67 <=s (const 64 (2**20)),
    r_59_67 - s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 + s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 - s_59_67 <=s (const 64 (2**20)),
    u_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_59_67 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step67

// premise a
assume
neg_g_59_low60_0_low20_8 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_9 neg_f_59_low60_0_low20_8;
mov u_59_68 u_59_67;
mov v_59_68 v_59_67;

asr neg_g_59_low60_0_low20_9 neg_g_59_low60_0_low20_8 1;
asr r_59_68 r_59_67 1;
asr s_59_68 s_59_67 1;
assert
    true
&&
    neg_f_59_low60_0_low20_9 = neg_f_59_low60_0_low20_8,
    u_59_68 = u_59_67,
    v_59_68 = v_59_67,
    neg_g_59_low60_0_low20_9 * (const 64 2) = neg_g_59_low60_0_low20_8,
    r_59_68 * (const 64 2) = r_59_67,
    s_59_68 * (const 64 2) = s_59_67
;

assume
    neg_f_59_low60_0_low20_9 = neg_f_59_low60_0_low20_8,
    u_59_68 = u_59_67,
    v_59_68 = v_59_67,
    neg_g_59_low60_0_low20_9 * 2 = neg_g_59_low60_0_low20_8,
    r_59_68 * 2 = r_59_67,
    s_59_68 * 2 = s_59_67
&&
    true
;

{
    u_59_68 * neg_f_59_low60_0_low20_0 + v_59_68 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_68 * neg_f_59_low60_0_low20_0 + s_59_68 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_9 + u_59_68 * (const 64 (2**21)) + v_59_68 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_9 + r_59_68 * (const 64 (2**21)) + s_59_68 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_9,
    neg_f_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_9,
    neg_g_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 68)) <=s delta, delta <=s (const 64 (1 + 2*68)),
    (const 64 (-(2**20))) <=s u_59_68, u_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_68, v_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_68, r_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_68, s_59_68 <=s (const 64 ((2**20))),
    u_59_68 + v_59_68 <=s (const 64 (2**20)),
    u_59_68 - v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 + v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 - v_59_68 <=s (const 64 (2**20)),
    r_59_68 + s_59_68 <=s (const 64 (2**20)),
    r_59_68 - s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 + s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 - s_59_68 <=s (const 64 (2**20)),
    u_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_59_68 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_067_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_8,
sint64 neg_g_59_low60_0_low20_8,
sint64 neg_f_59_low60_0_low20_9,
sint64 neg_g_59_low60_0_low20_9,
sint64 u_59_67,
sint64 v_59_67,
sint64 r_59_67,
sint64 s_59_67,
sint64 u_59_68,
sint64 v_59_68,
sint64 r_59_68,
sint64 s_59_68,
bit ne
)={
    u_59_67 * neg_f_59_low60_0_low20_0 + v_59_67 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_8 * (-(2**20)),
    r_59_67 * neg_f_59_low60_0_low20_0 + s_59_67 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_8 * (-(2**20))
&&
    u_59_67 * neg_f_59_low60_0_low20_0 + v_59_67 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_8 * (const 64 (-(2**20))),
    r_59_67 * neg_f_59_low60_0_low20_0 + s_59_67 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_8 + u_59_67 * (const 64 (2**21)) + v_59_67 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_8 + r_59_67 * (const 64 (2**21)) + s_59_67 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_8,
    neg_f_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_8,
    neg_g_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 67)) <=s delta, delta <=s (const 64 (1 + 2*67)),
    (const 64 (-(2**20))) <=s u_59_67, u_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_67, v_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_67, r_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_67, s_59_67 <=s (const 64 ((2**20))),
    u_59_67 + v_59_67 <=s (const 64 (2**20)),
    u_59_67 - v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 + v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 - v_59_67 <=s (const 64 (2**20)),
    r_59_67 + s_59_67 <=s (const 64 (2**20)),
    r_59_67 - s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 + s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 - s_59_67 <=s (const 64 (2**20)),
    u_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_59_67 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step67

// premise b
assume
neg_g_59_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_9 neg_f_59_low60_0_low20_8;
mov u_59_68 u_59_67;
mov v_59_68 v_59_67;

add neg_g_59_low60_0_low20_9 neg_g_59_low60_0_low20_8 neg_f_59_low60_0_low20_8;
asr neg_g_59_low60_0_low20_9 neg_g_59_low60_0_low20_9 1;
add r_59_68 r_59_67 u_59_67;
asr r_59_68 r_59_68 1;
add s_59_68 s_59_67 v_59_67;
asr s_59_68 s_59_68 1;
assert
    true
&&
    neg_f_59_low60_0_low20_9 = neg_f_59_low60_0_low20_8,
    u_59_68 = u_59_67,
    v_59_68 = v_59_67,
    neg_g_59_low60_0_low20_9 * (const 64 2) = neg_g_59_low60_0_low20_8 + neg_f_59_low60_0_low20_8,
    r_59_68 * (const 64 2) = r_59_67 + u_59_67,
    s_59_68 * (const 64 2) = s_59_67 + v_59_67
;

assume
    neg_f_59_low60_0_low20_9 = neg_f_59_low60_0_low20_8,
    u_59_68 = u_59_67,
    v_59_68 = v_59_67,
    neg_g_59_low60_0_low20_9 * 2 = neg_g_59_low60_0_low20_8 + neg_f_59_low60_0_low20_8,
    r_59_68 * 2 = r_59_67 + u_59_67,
    s_59_68 * 2 = s_59_67 + v_59_67
&&
    true
;

{
    u_59_68 * neg_f_59_low60_0_low20_0 + v_59_68 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_68 * neg_f_59_low60_0_low20_0 + s_59_68 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_9 + u_59_68 * (const 64 (2**21)) + v_59_68 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_9 + r_59_68 * (const 64 (2**21)) + s_59_68 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_9,
    neg_f_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_9,
    neg_g_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 68)) <=s delta, delta <=s (const 64 (1 + 2*68)),
    (const 64 (-(2**20))) <=s u_59_68, u_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_68, v_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_68, r_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_68, s_59_68 <=s (const 64 ((2**20))),
    u_59_68 + v_59_68 <=s (const 64 (2**20)),
    u_59_68 - v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 + v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 - v_59_68 <=s (const 64 (2**20)),
    r_59_68 + s_59_68 <=s (const 64 (2**20)),
    r_59_68 - s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 + s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 - s_59_68 <=s (const 64 (2**20)),
    u_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_59_68 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_067_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_8,
sint64 neg_g_59_low60_0_low20_8,
sint64 neg_f_59_low60_0_low20_9,
sint64 neg_g_59_low60_0_low20_9,
sint64 u_59_67,
sint64 v_59_67,
sint64 r_59_67,
sint64 s_59_67,
sint64 u_59_68,
sint64 v_59_68,
sint64 r_59_68,
sint64 s_59_68,
bit ne
)={
    u_59_67 * neg_f_59_low60_0_low20_0 + v_59_67 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_8 * (-(2**20)),
    r_59_67 * neg_f_59_low60_0_low20_0 + s_59_67 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_8 * (-(2**20))
&&
    u_59_67 * neg_f_59_low60_0_low20_0 + v_59_67 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_8 * (const 64 (-(2**20))),
    r_59_67 * neg_f_59_low60_0_low20_0 + s_59_67 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_8 + u_59_67 * (const 64 (2**21)) + v_59_67 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_8 + r_59_67 * (const 64 (2**21)) + s_59_67 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_8,
    neg_f_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_8,
    neg_g_59_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 67)) <=s delta, delta <=s (const 64 (1 + 2*67)),
    (const 64 (-(2**20))) <=s u_59_67, u_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_67, v_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_67, r_59_67 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_67, s_59_67 <=s (const 64 ((2**20))),
    u_59_67 + v_59_67 <=s (const 64 (2**20)),
    u_59_67 - v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 + v_59_67 <=s (const 64 (2**20)),
    (const 64 0) - u_59_67 - v_59_67 <=s (const 64 (2**20)),
    r_59_67 + s_59_67 <=s (const 64 (2**20)),
    r_59_67 - s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 + s_59_67 <=s (const 64 (2**20)),
    (const 64 0) - r_59_67 - s_59_67 <=s (const 64 (2**20)),
    u_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_59_67 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_59_67 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step67

// premise c
assume
neg_g_59_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_9 neg_g_59_low60_0_low20_8;
mov u_59_68 r_59_67;
mov v_59_68 s_59_67;

subs dc neg_g_59_low60_0_low20_9 neg_g_59_low60_0_low20_8 neg_f_59_low60_0_low20_8;
asr neg_g_59_low60_0_low20_9 neg_g_59_low60_0_low20_9 1;
subs dc r_59_68 r_59_67 u_59_67;
asr r_59_68 r_59_68 1;
subs dc s_59_68 s_59_67 v_59_67;
asr s_59_68 s_59_68 1;
assert
    true
&&
    neg_f_59_low60_0_low20_9 = neg_g_59_low60_0_low20_8,
    u_59_68 = r_59_67,
    v_59_68 = s_59_67,
    neg_g_59_low60_0_low20_9 * (const 64 2) = neg_g_59_low60_0_low20_8 - neg_f_59_low60_0_low20_8,
    r_59_68 * (const 64 2) = r_59_67 - u_59_67,
    s_59_68 * (const 64 2) = s_59_67 - v_59_67
;

assume
    neg_f_59_low60_0_low20_9 = neg_g_59_low60_0_low20_8,
    u_59_68 = r_59_67,
    v_59_68 = s_59_67,
    neg_g_59_low60_0_low20_9 * 2 = neg_g_59_low60_0_low20_8 - neg_f_59_low60_0_low20_8,
    r_59_68 * 2 = r_59_67 - u_59_67,
    s_59_68 * 2 = s_59_67 - v_59_67
&&
    true
;

{
    u_59_68 * neg_f_59_low60_0_low20_0 + v_59_68 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_68 * neg_f_59_low60_0_low20_0 + s_59_68 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_9 + u_59_68 * (const 64 (2**21)) + v_59_68 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_9 + r_59_68 * (const 64 (2**21)) + s_59_68 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_9,
    neg_f_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_9,
    neg_g_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 68)) <=s delta, delta <=s (const 64 (1 + 2*68)),
    (const 64 (-(2**20))) <=s u_59_68, u_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_68, v_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_68, r_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_68, s_59_68 <=s (const 64 ((2**20))),
    u_59_68 + v_59_68 <=s (const 64 (2**20)),
    u_59_68 - v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 + v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 - v_59_68 <=s (const 64 (2**20)),
    r_59_68 + s_59_68 <=s (const 64 (2**20)),
    r_59_68 - s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 + s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 - s_59_68 <=s (const 64 (2**20)),
    u_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_59_68 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_068_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_9,
sint64 neg_g_59_low60_0_low20_9,
sint64 neg_f_59_low60_0_low20_10,
sint64 neg_g_59_low60_0_low20_10,
sint64 u_59_68,
sint64 v_59_68,
sint64 r_59_68,
sint64 s_59_68,
sint64 u_59_69,
sint64 v_59_69,
sint64 r_59_69,
sint64 s_59_69,
bit ne
)={
    u_59_68 * neg_f_59_low60_0_low20_0 + v_59_68 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_9 * (-(2**20)),
    r_59_68 * neg_f_59_low60_0_low20_0 + s_59_68 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_9 * (-(2**20))
&&
    u_59_68 * neg_f_59_low60_0_low20_0 + v_59_68 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_9 * (const 64 (-(2**20))),
    r_59_68 * neg_f_59_low60_0_low20_0 + s_59_68 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_9 + u_59_68 * (const 64 (2**21)) + v_59_68 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_9 + r_59_68 * (const 64 (2**21)) + s_59_68 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_9,
    neg_f_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_9,
    neg_g_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 68)) <=s delta, delta <=s (const 64 (1 + 2*68)),
    (const 64 (-(2**20))) <=s u_59_68, u_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_68, v_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_68, r_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_68, s_59_68 <=s (const 64 ((2**20))),
    u_59_68 + v_59_68 <=s (const 64 (2**20)),
    u_59_68 - v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 + v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 - v_59_68 <=s (const 64 (2**20)),
    r_59_68 + s_59_68 <=s (const 64 (2**20)),
    r_59_68 - s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 + s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 - s_59_68 <=s (const 64 (2**20)),
    u_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_59_68 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step68

// premise a
assume
neg_g_59_low60_0_low20_9 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_10 neg_f_59_low60_0_low20_9;
mov u_59_69 u_59_68;
mov v_59_69 v_59_68;

asr neg_g_59_low60_0_low20_10 neg_g_59_low60_0_low20_9 1;
asr r_59_69 r_59_68 1;
asr s_59_69 s_59_68 1;
assert
    true
&&
    neg_f_59_low60_0_low20_10 = neg_f_59_low60_0_low20_9,
    u_59_69 = u_59_68,
    v_59_69 = v_59_68,
    neg_g_59_low60_0_low20_10 * (const 64 2) = neg_g_59_low60_0_low20_9,
    r_59_69 * (const 64 2) = r_59_68,
    s_59_69 * (const 64 2) = s_59_68
;

assume
    neg_f_59_low60_0_low20_10 = neg_f_59_low60_0_low20_9,
    u_59_69 = u_59_68,
    v_59_69 = v_59_68,
    neg_g_59_low60_0_low20_10 * 2 = neg_g_59_low60_0_low20_9,
    r_59_69 * 2 = r_59_68,
    s_59_69 * 2 = s_59_68
&&
    true
;

{
    u_59_69 * neg_f_59_low60_0_low20_0 + v_59_69 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_69 * neg_f_59_low60_0_low20_0 + s_59_69 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_10 + u_59_69 * (const 64 (2**21)) + v_59_69 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_10 + r_59_69 * (const 64 (2**21)) + s_59_69 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_10,
    neg_f_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_10,
    neg_g_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 69)) <=s delta, delta <=s (const 64 (1 + 2*69)),
    (const 64 (-(2**20))) <=s u_59_69, u_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_69, v_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_69, r_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_69, s_59_69 <=s (const 64 ((2**20))),
    u_59_69 + v_59_69 <=s (const 64 (2**20)),
    u_59_69 - v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 + v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 - v_59_69 <=s (const 64 (2**20)),
    r_59_69 + s_59_69 <=s (const 64 (2**20)),
    r_59_69 - s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 + s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 - s_59_69 <=s (const 64 (2**20)),
    u_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_59_69 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_068_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_9,
sint64 neg_g_59_low60_0_low20_9,
sint64 neg_f_59_low60_0_low20_10,
sint64 neg_g_59_low60_0_low20_10,
sint64 u_59_68,
sint64 v_59_68,
sint64 r_59_68,
sint64 s_59_68,
sint64 u_59_69,
sint64 v_59_69,
sint64 r_59_69,
sint64 s_59_69,
bit ne
)={
    u_59_68 * neg_f_59_low60_0_low20_0 + v_59_68 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_9 * (-(2**20)),
    r_59_68 * neg_f_59_low60_0_low20_0 + s_59_68 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_9 * (-(2**20))
&&
    u_59_68 * neg_f_59_low60_0_low20_0 + v_59_68 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_9 * (const 64 (-(2**20))),
    r_59_68 * neg_f_59_low60_0_low20_0 + s_59_68 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_9 + u_59_68 * (const 64 (2**21)) + v_59_68 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_9 + r_59_68 * (const 64 (2**21)) + s_59_68 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_9,
    neg_f_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_9,
    neg_g_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 68)) <=s delta, delta <=s (const 64 (1 + 2*68)),
    (const 64 (-(2**20))) <=s u_59_68, u_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_68, v_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_68, r_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_68, s_59_68 <=s (const 64 ((2**20))),
    u_59_68 + v_59_68 <=s (const 64 (2**20)),
    u_59_68 - v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 + v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 - v_59_68 <=s (const 64 (2**20)),
    r_59_68 + s_59_68 <=s (const 64 (2**20)),
    r_59_68 - s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 + s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 - s_59_68 <=s (const 64 (2**20)),
    u_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_59_68 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step68

// premise b
assume
neg_g_59_low60_0_low20_9 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_10 neg_f_59_low60_0_low20_9;
mov u_59_69 u_59_68;
mov v_59_69 v_59_68;

add neg_g_59_low60_0_low20_10 neg_g_59_low60_0_low20_9 neg_f_59_low60_0_low20_9;
asr neg_g_59_low60_0_low20_10 neg_g_59_low60_0_low20_10 1;
add r_59_69 r_59_68 u_59_68;
asr r_59_69 r_59_69 1;
add s_59_69 s_59_68 v_59_68;
asr s_59_69 s_59_69 1;
assert
    true
&&
    neg_f_59_low60_0_low20_10 = neg_f_59_low60_0_low20_9,
    u_59_69 = u_59_68,
    v_59_69 = v_59_68,
    neg_g_59_low60_0_low20_10 * (const 64 2) = neg_g_59_low60_0_low20_9 + neg_f_59_low60_0_low20_9,
    r_59_69 * (const 64 2) = r_59_68 + u_59_68,
    s_59_69 * (const 64 2) = s_59_68 + v_59_68
;

assume
    neg_f_59_low60_0_low20_10 = neg_f_59_low60_0_low20_9,
    u_59_69 = u_59_68,
    v_59_69 = v_59_68,
    neg_g_59_low60_0_low20_10 * 2 = neg_g_59_low60_0_low20_9 + neg_f_59_low60_0_low20_9,
    r_59_69 * 2 = r_59_68 + u_59_68,
    s_59_69 * 2 = s_59_68 + v_59_68
&&
    true
;

{
    u_59_69 * neg_f_59_low60_0_low20_0 + v_59_69 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_69 * neg_f_59_low60_0_low20_0 + s_59_69 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_10 + u_59_69 * (const 64 (2**21)) + v_59_69 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_10 + r_59_69 * (const 64 (2**21)) + s_59_69 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_10,
    neg_f_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_10,
    neg_g_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 69)) <=s delta, delta <=s (const 64 (1 + 2*69)),
    (const 64 (-(2**20))) <=s u_59_69, u_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_69, v_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_69, r_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_69, s_59_69 <=s (const 64 ((2**20))),
    u_59_69 + v_59_69 <=s (const 64 (2**20)),
    u_59_69 - v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 + v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 - v_59_69 <=s (const 64 (2**20)),
    r_59_69 + s_59_69 <=s (const 64 (2**20)),
    r_59_69 - s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 + s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 - s_59_69 <=s (const 64 (2**20)),
    u_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_59_69 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_068_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_9,
sint64 neg_g_59_low60_0_low20_9,
sint64 neg_f_59_low60_0_low20_10,
sint64 neg_g_59_low60_0_low20_10,
sint64 u_59_68,
sint64 v_59_68,
sint64 r_59_68,
sint64 s_59_68,
sint64 u_59_69,
sint64 v_59_69,
sint64 r_59_69,
sint64 s_59_69,
bit ne
)={
    u_59_68 * neg_f_59_low60_0_low20_0 + v_59_68 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_9 * (-(2**20)),
    r_59_68 * neg_f_59_low60_0_low20_0 + s_59_68 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_9 * (-(2**20))
&&
    u_59_68 * neg_f_59_low60_0_low20_0 + v_59_68 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_9 * (const 64 (-(2**20))),
    r_59_68 * neg_f_59_low60_0_low20_0 + s_59_68 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_9 + u_59_68 * (const 64 (2**21)) + v_59_68 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_9 + r_59_68 * (const 64 (2**21)) + s_59_68 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_9,
    neg_f_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_9,
    neg_g_59_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 68)) <=s delta, delta <=s (const 64 (1 + 2*68)),
    (const 64 (-(2**20))) <=s u_59_68, u_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_68, v_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_68, r_59_68 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_68, s_59_68 <=s (const 64 ((2**20))),
    u_59_68 + v_59_68 <=s (const 64 (2**20)),
    u_59_68 - v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 + v_59_68 <=s (const 64 (2**20)),
    (const 64 0) - u_59_68 - v_59_68 <=s (const 64 (2**20)),
    r_59_68 + s_59_68 <=s (const 64 (2**20)),
    r_59_68 - s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 + s_59_68 <=s (const 64 (2**20)),
    (const 64 0) - r_59_68 - s_59_68 <=s (const 64 (2**20)),
    u_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_59_68 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_59_68 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step68

// premise c
assume
neg_g_59_low60_0_low20_9 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_10 neg_g_59_low60_0_low20_9;
mov u_59_69 r_59_68;
mov v_59_69 s_59_68;

subs dc neg_g_59_low60_0_low20_10 neg_g_59_low60_0_low20_9 neg_f_59_low60_0_low20_9;
asr neg_g_59_low60_0_low20_10 neg_g_59_low60_0_low20_10 1;
subs dc r_59_69 r_59_68 u_59_68;
asr r_59_69 r_59_69 1;
subs dc s_59_69 s_59_68 v_59_68;
asr s_59_69 s_59_69 1;
assert
    true
&&
    neg_f_59_low60_0_low20_10 = neg_g_59_low60_0_low20_9,
    u_59_69 = r_59_68,
    v_59_69 = s_59_68,
    neg_g_59_low60_0_low20_10 * (const 64 2) = neg_g_59_low60_0_low20_9 - neg_f_59_low60_0_low20_9,
    r_59_69 * (const 64 2) = r_59_68 - u_59_68,
    s_59_69 * (const 64 2) = s_59_68 - v_59_68
;

assume
    neg_f_59_low60_0_low20_10 = neg_g_59_low60_0_low20_9,
    u_59_69 = r_59_68,
    v_59_69 = s_59_68,
    neg_g_59_low60_0_low20_10 * 2 = neg_g_59_low60_0_low20_9 - neg_f_59_low60_0_low20_9,
    r_59_69 * 2 = r_59_68 - u_59_68,
    s_59_69 * 2 = s_59_68 - v_59_68
&&
    true
;

{
    u_59_69 * neg_f_59_low60_0_low20_0 + v_59_69 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_69 * neg_f_59_low60_0_low20_0 + s_59_69 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_10 + u_59_69 * (const 64 (2**21)) + v_59_69 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_10 + r_59_69 * (const 64 (2**21)) + s_59_69 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_10,
    neg_f_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_10,
    neg_g_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 69)) <=s delta, delta <=s (const 64 (1 + 2*69)),
    (const 64 (-(2**20))) <=s u_59_69, u_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_69, v_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_69, r_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_69, s_59_69 <=s (const 64 ((2**20))),
    u_59_69 + v_59_69 <=s (const 64 (2**20)),
    u_59_69 - v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 + v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 - v_59_69 <=s (const 64 (2**20)),
    r_59_69 + s_59_69 <=s (const 64 (2**20)),
    r_59_69 - s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 + s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 - s_59_69 <=s (const 64 (2**20)),
    u_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_59_69 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_069_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_10,
sint64 neg_g_59_low60_0_low20_10,
sint64 neg_f_59_low60_0_low20_11,
sint64 neg_g_59_low60_0_low20_11,
sint64 u_59_69,
sint64 v_59_69,
sint64 r_59_69,
sint64 s_59_69,
sint64 u_59_70,
sint64 v_59_70,
sint64 r_59_70,
sint64 s_59_70,
bit ne
)={
    u_59_69 * neg_f_59_low60_0_low20_0 + v_59_69 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_10 * (-(2**20)),
    r_59_69 * neg_f_59_low60_0_low20_0 + s_59_69 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_10 * (-(2**20))
&&
    u_59_69 * neg_f_59_low60_0_low20_0 + v_59_69 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_10 * (const 64 (-(2**20))),
    r_59_69 * neg_f_59_low60_0_low20_0 + s_59_69 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_10 + u_59_69 * (const 64 (2**21)) + v_59_69 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_10 + r_59_69 * (const 64 (2**21)) + s_59_69 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_10,
    neg_f_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_10,
    neg_g_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 69)) <=s delta, delta <=s (const 64 (1 + 2*69)),
    (const 64 (-(2**20))) <=s u_59_69, u_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_69, v_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_69, r_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_69, s_59_69 <=s (const 64 ((2**20))),
    u_59_69 + v_59_69 <=s (const 64 (2**20)),
    u_59_69 - v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 + v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 - v_59_69 <=s (const 64 (2**20)),
    r_59_69 + s_59_69 <=s (const 64 (2**20)),
    r_59_69 - s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 + s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 - s_59_69 <=s (const 64 (2**20)),
    u_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_59_69 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step69

// premise a
assume
neg_g_59_low60_0_low20_10 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_11 neg_f_59_low60_0_low20_10;
mov u_59_70 u_59_69;
mov v_59_70 v_59_69;

asr neg_g_59_low60_0_low20_11 neg_g_59_low60_0_low20_10 1;
asr r_59_70 r_59_69 1;
asr s_59_70 s_59_69 1;
assert
    true
&&
    neg_f_59_low60_0_low20_11 = neg_f_59_low60_0_low20_10,
    u_59_70 = u_59_69,
    v_59_70 = v_59_69,
    neg_g_59_low60_0_low20_11 * (const 64 2) = neg_g_59_low60_0_low20_10,
    r_59_70 * (const 64 2) = r_59_69,
    s_59_70 * (const 64 2) = s_59_69
;

assume
    neg_f_59_low60_0_low20_11 = neg_f_59_low60_0_low20_10,
    u_59_70 = u_59_69,
    v_59_70 = v_59_69,
    neg_g_59_low60_0_low20_11 * 2 = neg_g_59_low60_0_low20_10,
    r_59_70 * 2 = r_59_69,
    s_59_70 * 2 = s_59_69
&&
    true
;

{
    u_59_70 * neg_f_59_low60_0_low20_0 + v_59_70 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_70 * neg_f_59_low60_0_low20_0 + s_59_70 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_11 + u_59_70 * (const 64 (2**21)) + v_59_70 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_11 + r_59_70 * (const 64 (2**21)) + s_59_70 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_11,
    neg_f_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_11,
    neg_g_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 70)) <=s delta, delta <=s (const 64 (1 + 2*70)),
    (const 64 (-(2**20))) <=s u_59_70, u_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_70, v_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_70, r_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_70, s_59_70 <=s (const 64 ((2**20))),
    u_59_70 + v_59_70 <=s (const 64 (2**20)),
    u_59_70 - v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 + v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 - v_59_70 <=s (const 64 (2**20)),
    r_59_70 + s_59_70 <=s (const 64 (2**20)),
    r_59_70 - s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 + s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 - s_59_70 <=s (const 64 (2**20)),
    u_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_59_70 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_069_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_10,
sint64 neg_g_59_low60_0_low20_10,
sint64 neg_f_59_low60_0_low20_11,
sint64 neg_g_59_low60_0_low20_11,
sint64 u_59_69,
sint64 v_59_69,
sint64 r_59_69,
sint64 s_59_69,
sint64 u_59_70,
sint64 v_59_70,
sint64 r_59_70,
sint64 s_59_70,
bit ne
)={
    u_59_69 * neg_f_59_low60_0_low20_0 + v_59_69 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_10 * (-(2**20)),
    r_59_69 * neg_f_59_low60_0_low20_0 + s_59_69 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_10 * (-(2**20))
&&
    u_59_69 * neg_f_59_low60_0_low20_0 + v_59_69 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_10 * (const 64 (-(2**20))),
    r_59_69 * neg_f_59_low60_0_low20_0 + s_59_69 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_10 + u_59_69 * (const 64 (2**21)) + v_59_69 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_10 + r_59_69 * (const 64 (2**21)) + s_59_69 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_10,
    neg_f_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_10,
    neg_g_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 69)) <=s delta, delta <=s (const 64 (1 + 2*69)),
    (const 64 (-(2**20))) <=s u_59_69, u_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_69, v_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_69, r_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_69, s_59_69 <=s (const 64 ((2**20))),
    u_59_69 + v_59_69 <=s (const 64 (2**20)),
    u_59_69 - v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 + v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 - v_59_69 <=s (const 64 (2**20)),
    r_59_69 + s_59_69 <=s (const 64 (2**20)),
    r_59_69 - s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 + s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 - s_59_69 <=s (const 64 (2**20)),
    u_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_59_69 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step69

// premise b
assume
neg_g_59_low60_0_low20_10 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_11 neg_f_59_low60_0_low20_10;
mov u_59_70 u_59_69;
mov v_59_70 v_59_69;

add neg_g_59_low60_0_low20_11 neg_g_59_low60_0_low20_10 neg_f_59_low60_0_low20_10;
asr neg_g_59_low60_0_low20_11 neg_g_59_low60_0_low20_11 1;
add r_59_70 r_59_69 u_59_69;
asr r_59_70 r_59_70 1;
add s_59_70 s_59_69 v_59_69;
asr s_59_70 s_59_70 1;
assert
    true
&&
    neg_f_59_low60_0_low20_11 = neg_f_59_low60_0_low20_10,
    u_59_70 = u_59_69,
    v_59_70 = v_59_69,
    neg_g_59_low60_0_low20_11 * (const 64 2) = neg_g_59_low60_0_low20_10 + neg_f_59_low60_0_low20_10,
    r_59_70 * (const 64 2) = r_59_69 + u_59_69,
    s_59_70 * (const 64 2) = s_59_69 + v_59_69
;

assume
    neg_f_59_low60_0_low20_11 = neg_f_59_low60_0_low20_10,
    u_59_70 = u_59_69,
    v_59_70 = v_59_69,
    neg_g_59_low60_0_low20_11 * 2 = neg_g_59_low60_0_low20_10 + neg_f_59_low60_0_low20_10,
    r_59_70 * 2 = r_59_69 + u_59_69,
    s_59_70 * 2 = s_59_69 + v_59_69
&&
    true
;

{
    u_59_70 * neg_f_59_low60_0_low20_0 + v_59_70 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_70 * neg_f_59_low60_0_low20_0 + s_59_70 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_11 + u_59_70 * (const 64 (2**21)) + v_59_70 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_11 + r_59_70 * (const 64 (2**21)) + s_59_70 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_11,
    neg_f_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_11,
    neg_g_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 70)) <=s delta, delta <=s (const 64 (1 + 2*70)),
    (const 64 (-(2**20))) <=s u_59_70, u_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_70, v_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_70, r_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_70, s_59_70 <=s (const 64 ((2**20))),
    u_59_70 + v_59_70 <=s (const 64 (2**20)),
    u_59_70 - v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 + v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 - v_59_70 <=s (const 64 (2**20)),
    r_59_70 + s_59_70 <=s (const 64 (2**20)),
    r_59_70 - s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 + s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 - s_59_70 <=s (const 64 (2**20)),
    u_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_59_70 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_069_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_10,
sint64 neg_g_59_low60_0_low20_10,
sint64 neg_f_59_low60_0_low20_11,
sint64 neg_g_59_low60_0_low20_11,
sint64 u_59_69,
sint64 v_59_69,
sint64 r_59_69,
sint64 s_59_69,
sint64 u_59_70,
sint64 v_59_70,
sint64 r_59_70,
sint64 s_59_70,
bit ne
)={
    u_59_69 * neg_f_59_low60_0_low20_0 + v_59_69 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_10 * (-(2**20)),
    r_59_69 * neg_f_59_low60_0_low20_0 + s_59_69 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_10 * (-(2**20))
&&
    u_59_69 * neg_f_59_low60_0_low20_0 + v_59_69 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_10 * (const 64 (-(2**20))),
    r_59_69 * neg_f_59_low60_0_low20_0 + s_59_69 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_10 + u_59_69 * (const 64 (2**21)) + v_59_69 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_10 + r_59_69 * (const 64 (2**21)) + s_59_69 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_10,
    neg_f_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_10,
    neg_g_59_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 69)) <=s delta, delta <=s (const 64 (1 + 2*69)),
    (const 64 (-(2**20))) <=s u_59_69, u_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_69, v_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_69, r_59_69 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_69, s_59_69 <=s (const 64 ((2**20))),
    u_59_69 + v_59_69 <=s (const 64 (2**20)),
    u_59_69 - v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 + v_59_69 <=s (const 64 (2**20)),
    (const 64 0) - u_59_69 - v_59_69 <=s (const 64 (2**20)),
    r_59_69 + s_59_69 <=s (const 64 (2**20)),
    r_59_69 - s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 + s_59_69 <=s (const 64 (2**20)),
    (const 64 0) - r_59_69 - s_59_69 <=s (const 64 (2**20)),
    u_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_59_69 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_59_69 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step69

// premise c
assume
neg_g_59_low60_0_low20_10 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_11 neg_g_59_low60_0_low20_10;
mov u_59_70 r_59_69;
mov v_59_70 s_59_69;

subs dc neg_g_59_low60_0_low20_11 neg_g_59_low60_0_low20_10 neg_f_59_low60_0_low20_10;
asr neg_g_59_low60_0_low20_11 neg_g_59_low60_0_low20_11 1;
subs dc r_59_70 r_59_69 u_59_69;
asr r_59_70 r_59_70 1;
subs dc s_59_70 s_59_69 v_59_69;
asr s_59_70 s_59_70 1;
assert
    true
&&
    neg_f_59_low60_0_low20_11 = neg_g_59_low60_0_low20_10,
    u_59_70 = r_59_69,
    v_59_70 = s_59_69,
    neg_g_59_low60_0_low20_11 * (const 64 2) = neg_g_59_low60_0_low20_10 - neg_f_59_low60_0_low20_10,
    r_59_70 * (const 64 2) = r_59_69 - u_59_69,
    s_59_70 * (const 64 2) = s_59_69 - v_59_69
;

assume
    neg_f_59_low60_0_low20_11 = neg_g_59_low60_0_low20_10,
    u_59_70 = r_59_69,
    v_59_70 = s_59_69,
    neg_g_59_low60_0_low20_11 * 2 = neg_g_59_low60_0_low20_10 - neg_f_59_low60_0_low20_10,
    r_59_70 * 2 = r_59_69 - u_59_69,
    s_59_70 * 2 = s_59_69 - v_59_69
&&
    true
;

{
    u_59_70 * neg_f_59_low60_0_low20_0 + v_59_70 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_70 * neg_f_59_low60_0_low20_0 + s_59_70 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_11 + u_59_70 * (const 64 (2**21)) + v_59_70 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_11 + r_59_70 * (const 64 (2**21)) + s_59_70 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_11,
    neg_f_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_11,
    neg_g_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 70)) <=s delta, delta <=s (const 64 (1 + 2*70)),
    (const 64 (-(2**20))) <=s u_59_70, u_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_70, v_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_70, r_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_70, s_59_70 <=s (const 64 ((2**20))),
    u_59_70 + v_59_70 <=s (const 64 (2**20)),
    u_59_70 - v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 + v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 - v_59_70 <=s (const 64 (2**20)),
    r_59_70 + s_59_70 <=s (const 64 (2**20)),
    r_59_70 - s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 + s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 - s_59_70 <=s (const 64 (2**20)),
    u_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_59_70 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_070_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_11,
sint64 neg_g_59_low60_0_low20_11,
sint64 neg_f_59_low60_0_low20_12,
sint64 neg_g_59_low60_0_low20_12,
sint64 u_59_70,
sint64 v_59_70,
sint64 r_59_70,
sint64 s_59_70,
sint64 u_59_71,
sint64 v_59_71,
sint64 r_59_71,
sint64 s_59_71,
bit ne
)={
    u_59_70 * neg_f_59_low60_0_low20_0 + v_59_70 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_11 * (-(2**20)),
    r_59_70 * neg_f_59_low60_0_low20_0 + s_59_70 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_11 * (-(2**20))
&&
    u_59_70 * neg_f_59_low60_0_low20_0 + v_59_70 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_11 * (const 64 (-(2**20))),
    r_59_70 * neg_f_59_low60_0_low20_0 + s_59_70 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_11 + u_59_70 * (const 64 (2**21)) + v_59_70 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_11 + r_59_70 * (const 64 (2**21)) + s_59_70 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_11,
    neg_f_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_11,
    neg_g_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 70)) <=s delta, delta <=s (const 64 (1 + 2*70)),
    (const 64 (-(2**20))) <=s u_59_70, u_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_70, v_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_70, r_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_70, s_59_70 <=s (const 64 ((2**20))),
    u_59_70 + v_59_70 <=s (const 64 (2**20)),
    u_59_70 - v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 + v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 - v_59_70 <=s (const 64 (2**20)),
    r_59_70 + s_59_70 <=s (const 64 (2**20)),
    r_59_70 - s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 + s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 - s_59_70 <=s (const 64 (2**20)),
    u_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_59_70 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step70

// premise a
assume
neg_g_59_low60_0_low20_11 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_12 neg_f_59_low60_0_low20_11;
mov u_59_71 u_59_70;
mov v_59_71 v_59_70;

asr neg_g_59_low60_0_low20_12 neg_g_59_low60_0_low20_11 1;
asr r_59_71 r_59_70 1;
asr s_59_71 s_59_70 1;
assert
    true
&&
    neg_f_59_low60_0_low20_12 = neg_f_59_low60_0_low20_11,
    u_59_71 = u_59_70,
    v_59_71 = v_59_70,
    neg_g_59_low60_0_low20_12 * (const 64 2) = neg_g_59_low60_0_low20_11,
    r_59_71 * (const 64 2) = r_59_70,
    s_59_71 * (const 64 2) = s_59_70
;

assume
    neg_f_59_low60_0_low20_12 = neg_f_59_low60_0_low20_11,
    u_59_71 = u_59_70,
    v_59_71 = v_59_70,
    neg_g_59_low60_0_low20_12 * 2 = neg_g_59_low60_0_low20_11,
    r_59_71 * 2 = r_59_70,
    s_59_71 * 2 = s_59_70
&&
    true
;

{
    u_59_71 * neg_f_59_low60_0_low20_0 + v_59_71 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_71 * neg_f_59_low60_0_low20_0 + s_59_71 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_12 + u_59_71 * (const 64 (2**21)) + v_59_71 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_12 + r_59_71 * (const 64 (2**21)) + s_59_71 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_12,
    neg_f_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_12,
    neg_g_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 71)) <=s delta, delta <=s (const 64 (1 + 2*71)),
    (const 64 (-(2**20))) <=s u_59_71, u_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_71, v_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_71, r_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_71, s_59_71 <=s (const 64 ((2**20))),
    u_59_71 + v_59_71 <=s (const 64 (2**20)),
    u_59_71 - v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 + v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 - v_59_71 <=s (const 64 (2**20)),
    r_59_71 + s_59_71 <=s (const 64 (2**20)),
    r_59_71 - s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 + s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 - s_59_71 <=s (const 64 (2**20)),
    u_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_59_71 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_070_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_11,
sint64 neg_g_59_low60_0_low20_11,
sint64 neg_f_59_low60_0_low20_12,
sint64 neg_g_59_low60_0_low20_12,
sint64 u_59_70,
sint64 v_59_70,
sint64 r_59_70,
sint64 s_59_70,
sint64 u_59_71,
sint64 v_59_71,
sint64 r_59_71,
sint64 s_59_71,
bit ne
)={
    u_59_70 * neg_f_59_low60_0_low20_0 + v_59_70 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_11 * (-(2**20)),
    r_59_70 * neg_f_59_low60_0_low20_0 + s_59_70 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_11 * (-(2**20))
&&
    u_59_70 * neg_f_59_low60_0_low20_0 + v_59_70 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_11 * (const 64 (-(2**20))),
    r_59_70 * neg_f_59_low60_0_low20_0 + s_59_70 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_11 + u_59_70 * (const 64 (2**21)) + v_59_70 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_11 + r_59_70 * (const 64 (2**21)) + s_59_70 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_11,
    neg_f_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_11,
    neg_g_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 70)) <=s delta, delta <=s (const 64 (1 + 2*70)),
    (const 64 (-(2**20))) <=s u_59_70, u_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_70, v_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_70, r_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_70, s_59_70 <=s (const 64 ((2**20))),
    u_59_70 + v_59_70 <=s (const 64 (2**20)),
    u_59_70 - v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 + v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 - v_59_70 <=s (const 64 (2**20)),
    r_59_70 + s_59_70 <=s (const 64 (2**20)),
    r_59_70 - s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 + s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 - s_59_70 <=s (const 64 (2**20)),
    u_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_59_70 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step70

// premise b
assume
neg_g_59_low60_0_low20_11 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_12 neg_f_59_low60_0_low20_11;
mov u_59_71 u_59_70;
mov v_59_71 v_59_70;

add neg_g_59_low60_0_low20_12 neg_g_59_low60_0_low20_11 neg_f_59_low60_0_low20_11;
asr neg_g_59_low60_0_low20_12 neg_g_59_low60_0_low20_12 1;
add r_59_71 r_59_70 u_59_70;
asr r_59_71 r_59_71 1;
add s_59_71 s_59_70 v_59_70;
asr s_59_71 s_59_71 1;
assert
    true
&&
    neg_f_59_low60_0_low20_12 = neg_f_59_low60_0_low20_11,
    u_59_71 = u_59_70,
    v_59_71 = v_59_70,
    neg_g_59_low60_0_low20_12 * (const 64 2) = neg_g_59_low60_0_low20_11 + neg_f_59_low60_0_low20_11,
    r_59_71 * (const 64 2) = r_59_70 + u_59_70,
    s_59_71 * (const 64 2) = s_59_70 + v_59_70
;

assume
    neg_f_59_low60_0_low20_12 = neg_f_59_low60_0_low20_11,
    u_59_71 = u_59_70,
    v_59_71 = v_59_70,
    neg_g_59_low60_0_low20_12 * 2 = neg_g_59_low60_0_low20_11 + neg_f_59_low60_0_low20_11,
    r_59_71 * 2 = r_59_70 + u_59_70,
    s_59_71 * 2 = s_59_70 + v_59_70
&&
    true
;

{
    u_59_71 * neg_f_59_low60_0_low20_0 + v_59_71 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_71 * neg_f_59_low60_0_low20_0 + s_59_71 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_12 + u_59_71 * (const 64 (2**21)) + v_59_71 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_12 + r_59_71 * (const 64 (2**21)) + s_59_71 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_12,
    neg_f_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_12,
    neg_g_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 71)) <=s delta, delta <=s (const 64 (1 + 2*71)),
    (const 64 (-(2**20))) <=s u_59_71, u_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_71, v_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_71, r_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_71, s_59_71 <=s (const 64 ((2**20))),
    u_59_71 + v_59_71 <=s (const 64 (2**20)),
    u_59_71 - v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 + v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 - v_59_71 <=s (const 64 (2**20)),
    r_59_71 + s_59_71 <=s (const 64 (2**20)),
    r_59_71 - s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 + s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 - s_59_71 <=s (const 64 (2**20)),
    u_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_59_71 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_070_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_11,
sint64 neg_g_59_low60_0_low20_11,
sint64 neg_f_59_low60_0_low20_12,
sint64 neg_g_59_low60_0_low20_12,
sint64 u_59_70,
sint64 v_59_70,
sint64 r_59_70,
sint64 s_59_70,
sint64 u_59_71,
sint64 v_59_71,
sint64 r_59_71,
sint64 s_59_71,
bit ne
)={
    u_59_70 * neg_f_59_low60_0_low20_0 + v_59_70 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_11 * (-(2**20)),
    r_59_70 * neg_f_59_low60_0_low20_0 + s_59_70 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_11 * (-(2**20))
&&
    u_59_70 * neg_f_59_low60_0_low20_0 + v_59_70 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_11 * (const 64 (-(2**20))),
    r_59_70 * neg_f_59_low60_0_low20_0 + s_59_70 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_11 + u_59_70 * (const 64 (2**21)) + v_59_70 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_11 + r_59_70 * (const 64 (2**21)) + s_59_70 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_11,
    neg_f_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_11,
    neg_g_59_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 70)) <=s delta, delta <=s (const 64 (1 + 2*70)),
    (const 64 (-(2**20))) <=s u_59_70, u_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_70, v_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_70, r_59_70 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_70, s_59_70 <=s (const 64 ((2**20))),
    u_59_70 + v_59_70 <=s (const 64 (2**20)),
    u_59_70 - v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 + v_59_70 <=s (const 64 (2**20)),
    (const 64 0) - u_59_70 - v_59_70 <=s (const 64 (2**20)),
    r_59_70 + s_59_70 <=s (const 64 (2**20)),
    r_59_70 - s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 + s_59_70 <=s (const 64 (2**20)),
    (const 64 0) - r_59_70 - s_59_70 <=s (const 64 (2**20)),
    u_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_59_70 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_59_70 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step70

// premise c
assume
neg_g_59_low60_0_low20_11 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_12 neg_g_59_low60_0_low20_11;
mov u_59_71 r_59_70;
mov v_59_71 s_59_70;

subs dc neg_g_59_low60_0_low20_12 neg_g_59_low60_0_low20_11 neg_f_59_low60_0_low20_11;
asr neg_g_59_low60_0_low20_12 neg_g_59_low60_0_low20_12 1;
subs dc r_59_71 r_59_70 u_59_70;
asr r_59_71 r_59_71 1;
subs dc s_59_71 s_59_70 v_59_70;
asr s_59_71 s_59_71 1;
assert
    true
&&
    neg_f_59_low60_0_low20_12 = neg_g_59_low60_0_low20_11,
    u_59_71 = r_59_70,
    v_59_71 = s_59_70,
    neg_g_59_low60_0_low20_12 * (const 64 2) = neg_g_59_low60_0_low20_11 - neg_f_59_low60_0_low20_11,
    r_59_71 * (const 64 2) = r_59_70 - u_59_70,
    s_59_71 * (const 64 2) = s_59_70 - v_59_70
;

assume
    neg_f_59_low60_0_low20_12 = neg_g_59_low60_0_low20_11,
    u_59_71 = r_59_70,
    v_59_71 = s_59_70,
    neg_g_59_low60_0_low20_12 * 2 = neg_g_59_low60_0_low20_11 - neg_f_59_low60_0_low20_11,
    r_59_71 * 2 = r_59_70 - u_59_70,
    s_59_71 * 2 = s_59_70 - v_59_70
&&
    true
;

{
    u_59_71 * neg_f_59_low60_0_low20_0 + v_59_71 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_71 * neg_f_59_low60_0_low20_0 + s_59_71 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_12 + u_59_71 * (const 64 (2**21)) + v_59_71 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_12 + r_59_71 * (const 64 (2**21)) + s_59_71 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_12,
    neg_f_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_12,
    neg_g_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 71)) <=s delta, delta <=s (const 64 (1 + 2*71)),
    (const 64 (-(2**20))) <=s u_59_71, u_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_71, v_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_71, r_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_71, s_59_71 <=s (const 64 ((2**20))),
    u_59_71 + v_59_71 <=s (const 64 (2**20)),
    u_59_71 - v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 + v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 - v_59_71 <=s (const 64 (2**20)),
    r_59_71 + s_59_71 <=s (const 64 (2**20)),
    r_59_71 - s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 + s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 - s_59_71 <=s (const 64 (2**20)),
    u_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_59_71 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_071_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_12,
sint64 neg_g_59_low60_0_low20_12,
sint64 neg_f_59_low60_0_low20_13,
sint64 neg_g_59_low60_0_low20_13,
sint64 u_59_71,
sint64 v_59_71,
sint64 r_59_71,
sint64 s_59_71,
sint64 u_59_72,
sint64 v_59_72,
sint64 r_59_72,
sint64 s_59_72,
bit ne
)={
    u_59_71 * neg_f_59_low60_0_low20_0 + v_59_71 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_12 * (-(2**20)),
    r_59_71 * neg_f_59_low60_0_low20_0 + s_59_71 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_12 * (-(2**20))
&&
    u_59_71 * neg_f_59_low60_0_low20_0 + v_59_71 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_12 * (const 64 (-(2**20))),
    r_59_71 * neg_f_59_low60_0_low20_0 + s_59_71 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_12 + u_59_71 * (const 64 (2**21)) + v_59_71 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_12 + r_59_71 * (const 64 (2**21)) + s_59_71 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_12,
    neg_f_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_12,
    neg_g_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 71)) <=s delta, delta <=s (const 64 (1 + 2*71)),
    (const 64 (-(2**20))) <=s u_59_71, u_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_71, v_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_71, r_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_71, s_59_71 <=s (const 64 ((2**20))),
    u_59_71 + v_59_71 <=s (const 64 (2**20)),
    u_59_71 - v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 + v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 - v_59_71 <=s (const 64 (2**20)),
    r_59_71 + s_59_71 <=s (const 64 (2**20)),
    r_59_71 - s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 + s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 - s_59_71 <=s (const 64 (2**20)),
    u_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_59_71 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step71

// premise a
assume
neg_g_59_low60_0_low20_12 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_13 neg_f_59_low60_0_low20_12;
mov u_59_72 u_59_71;
mov v_59_72 v_59_71;

asr neg_g_59_low60_0_low20_13 neg_g_59_low60_0_low20_12 1;
asr r_59_72 r_59_71 1;
asr s_59_72 s_59_71 1;
assert
    true
&&
    neg_f_59_low60_0_low20_13 = neg_f_59_low60_0_low20_12,
    u_59_72 = u_59_71,
    v_59_72 = v_59_71,
    neg_g_59_low60_0_low20_13 * (const 64 2) = neg_g_59_low60_0_low20_12,
    r_59_72 * (const 64 2) = r_59_71,
    s_59_72 * (const 64 2) = s_59_71
;

assume
    neg_f_59_low60_0_low20_13 = neg_f_59_low60_0_low20_12,
    u_59_72 = u_59_71,
    v_59_72 = v_59_71,
    neg_g_59_low60_0_low20_13 * 2 = neg_g_59_low60_0_low20_12,
    r_59_72 * 2 = r_59_71,
    s_59_72 * 2 = s_59_71
&&
    true
;

{
    u_59_72 * neg_f_59_low60_0_low20_0 + v_59_72 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_72 * neg_f_59_low60_0_low20_0 + s_59_72 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_13 + u_59_72 * (const 64 (2**21)) + v_59_72 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_13 + r_59_72 * (const 64 (2**21)) + s_59_72 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_13,
    neg_f_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_13,
    neg_g_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 72)) <=s delta, delta <=s (const 64 (1 + 2*72)),
    (const 64 (-(2**20))) <=s u_59_72, u_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_72, v_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_72, r_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_72, s_59_72 <=s (const 64 ((2**20))),
    u_59_72 + v_59_72 <=s (const 64 (2**20)),
    u_59_72 - v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 + v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 - v_59_72 <=s (const 64 (2**20)),
    r_59_72 + s_59_72 <=s (const 64 (2**20)),
    r_59_72 - s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 + s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 - s_59_72 <=s (const 64 (2**20)),
    u_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_59_72 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_071_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_12,
sint64 neg_g_59_low60_0_low20_12,
sint64 neg_f_59_low60_0_low20_13,
sint64 neg_g_59_low60_0_low20_13,
sint64 u_59_71,
sint64 v_59_71,
sint64 r_59_71,
sint64 s_59_71,
sint64 u_59_72,
sint64 v_59_72,
sint64 r_59_72,
sint64 s_59_72,
bit ne
)={
    u_59_71 * neg_f_59_low60_0_low20_0 + v_59_71 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_12 * (-(2**20)),
    r_59_71 * neg_f_59_low60_0_low20_0 + s_59_71 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_12 * (-(2**20))
&&
    u_59_71 * neg_f_59_low60_0_low20_0 + v_59_71 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_12 * (const 64 (-(2**20))),
    r_59_71 * neg_f_59_low60_0_low20_0 + s_59_71 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_12 + u_59_71 * (const 64 (2**21)) + v_59_71 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_12 + r_59_71 * (const 64 (2**21)) + s_59_71 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_12,
    neg_f_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_12,
    neg_g_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 71)) <=s delta, delta <=s (const 64 (1 + 2*71)),
    (const 64 (-(2**20))) <=s u_59_71, u_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_71, v_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_71, r_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_71, s_59_71 <=s (const 64 ((2**20))),
    u_59_71 + v_59_71 <=s (const 64 (2**20)),
    u_59_71 - v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 + v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 - v_59_71 <=s (const 64 (2**20)),
    r_59_71 + s_59_71 <=s (const 64 (2**20)),
    r_59_71 - s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 + s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 - s_59_71 <=s (const 64 (2**20)),
    u_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_59_71 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step71

// premise b
assume
neg_g_59_low60_0_low20_12 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_13 neg_f_59_low60_0_low20_12;
mov u_59_72 u_59_71;
mov v_59_72 v_59_71;

add neg_g_59_low60_0_low20_13 neg_g_59_low60_0_low20_12 neg_f_59_low60_0_low20_12;
asr neg_g_59_low60_0_low20_13 neg_g_59_low60_0_low20_13 1;
add r_59_72 r_59_71 u_59_71;
asr r_59_72 r_59_72 1;
add s_59_72 s_59_71 v_59_71;
asr s_59_72 s_59_72 1;
assert
    true
&&
    neg_f_59_low60_0_low20_13 = neg_f_59_low60_0_low20_12,
    u_59_72 = u_59_71,
    v_59_72 = v_59_71,
    neg_g_59_low60_0_low20_13 * (const 64 2) = neg_g_59_low60_0_low20_12 + neg_f_59_low60_0_low20_12,
    r_59_72 * (const 64 2) = r_59_71 + u_59_71,
    s_59_72 * (const 64 2) = s_59_71 + v_59_71
;

assume
    neg_f_59_low60_0_low20_13 = neg_f_59_low60_0_low20_12,
    u_59_72 = u_59_71,
    v_59_72 = v_59_71,
    neg_g_59_low60_0_low20_13 * 2 = neg_g_59_low60_0_low20_12 + neg_f_59_low60_0_low20_12,
    r_59_72 * 2 = r_59_71 + u_59_71,
    s_59_72 * 2 = s_59_71 + v_59_71
&&
    true
;

{
    u_59_72 * neg_f_59_low60_0_low20_0 + v_59_72 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_72 * neg_f_59_low60_0_low20_0 + s_59_72 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_13 + u_59_72 * (const 64 (2**21)) + v_59_72 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_13 + r_59_72 * (const 64 (2**21)) + s_59_72 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_13,
    neg_f_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_13,
    neg_g_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 72)) <=s delta, delta <=s (const 64 (1 + 2*72)),
    (const 64 (-(2**20))) <=s u_59_72, u_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_72, v_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_72, r_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_72, s_59_72 <=s (const 64 ((2**20))),
    u_59_72 + v_59_72 <=s (const 64 (2**20)),
    u_59_72 - v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 + v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 - v_59_72 <=s (const 64 (2**20)),
    r_59_72 + s_59_72 <=s (const 64 (2**20)),
    r_59_72 - s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 + s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 - s_59_72 <=s (const 64 (2**20)),
    u_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_59_72 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_071_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_12,
sint64 neg_g_59_low60_0_low20_12,
sint64 neg_f_59_low60_0_low20_13,
sint64 neg_g_59_low60_0_low20_13,
sint64 u_59_71,
sint64 v_59_71,
sint64 r_59_71,
sint64 s_59_71,
sint64 u_59_72,
sint64 v_59_72,
sint64 r_59_72,
sint64 s_59_72,
bit ne
)={
    u_59_71 * neg_f_59_low60_0_low20_0 + v_59_71 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_12 * (-(2**20)),
    r_59_71 * neg_f_59_low60_0_low20_0 + s_59_71 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_12 * (-(2**20))
&&
    u_59_71 * neg_f_59_low60_0_low20_0 + v_59_71 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_12 * (const 64 (-(2**20))),
    r_59_71 * neg_f_59_low60_0_low20_0 + s_59_71 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_12 + u_59_71 * (const 64 (2**21)) + v_59_71 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_12 + r_59_71 * (const 64 (2**21)) + s_59_71 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_12,
    neg_f_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_12,
    neg_g_59_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 71)) <=s delta, delta <=s (const 64 (1 + 2*71)),
    (const 64 (-(2**20))) <=s u_59_71, u_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_71, v_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_71, r_59_71 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_71, s_59_71 <=s (const 64 ((2**20))),
    u_59_71 + v_59_71 <=s (const 64 (2**20)),
    u_59_71 - v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 + v_59_71 <=s (const 64 (2**20)),
    (const 64 0) - u_59_71 - v_59_71 <=s (const 64 (2**20)),
    r_59_71 + s_59_71 <=s (const 64 (2**20)),
    r_59_71 - s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 + s_59_71 <=s (const 64 (2**20)),
    (const 64 0) - r_59_71 - s_59_71 <=s (const 64 (2**20)),
    u_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_59_71 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_59_71 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step71

// premise c
assume
neg_g_59_low60_0_low20_12 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_13 neg_g_59_low60_0_low20_12;
mov u_59_72 r_59_71;
mov v_59_72 s_59_71;

subs dc neg_g_59_low60_0_low20_13 neg_g_59_low60_0_low20_12 neg_f_59_low60_0_low20_12;
asr neg_g_59_low60_0_low20_13 neg_g_59_low60_0_low20_13 1;
subs dc r_59_72 r_59_71 u_59_71;
asr r_59_72 r_59_72 1;
subs dc s_59_72 s_59_71 v_59_71;
asr s_59_72 s_59_72 1;
assert
    true
&&
    neg_f_59_low60_0_low20_13 = neg_g_59_low60_0_low20_12,
    u_59_72 = r_59_71,
    v_59_72 = s_59_71,
    neg_g_59_low60_0_low20_13 * (const 64 2) = neg_g_59_low60_0_low20_12 - neg_f_59_low60_0_low20_12,
    r_59_72 * (const 64 2) = r_59_71 - u_59_71,
    s_59_72 * (const 64 2) = s_59_71 - v_59_71
;

assume
    neg_f_59_low60_0_low20_13 = neg_g_59_low60_0_low20_12,
    u_59_72 = r_59_71,
    v_59_72 = s_59_71,
    neg_g_59_low60_0_low20_13 * 2 = neg_g_59_low60_0_low20_12 - neg_f_59_low60_0_low20_12,
    r_59_72 * 2 = r_59_71 - u_59_71,
    s_59_72 * 2 = s_59_71 - v_59_71
&&
    true
;

{
    u_59_72 * neg_f_59_low60_0_low20_0 + v_59_72 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_72 * neg_f_59_low60_0_low20_0 + s_59_72 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_13 + u_59_72 * (const 64 (2**21)) + v_59_72 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_13 + r_59_72 * (const 64 (2**21)) + s_59_72 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_13,
    neg_f_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_13,
    neg_g_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 72)) <=s delta, delta <=s (const 64 (1 + 2*72)),
    (const 64 (-(2**20))) <=s u_59_72, u_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_72, v_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_72, r_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_72, s_59_72 <=s (const 64 ((2**20))),
    u_59_72 + v_59_72 <=s (const 64 (2**20)),
    u_59_72 - v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 + v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 - v_59_72 <=s (const 64 (2**20)),
    r_59_72 + s_59_72 <=s (const 64 (2**20)),
    r_59_72 - s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 + s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 - s_59_72 <=s (const 64 (2**20)),
    u_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_59_72 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_072_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_13,
sint64 neg_g_59_low60_0_low20_13,
sint64 neg_f_59_low60_0_low20_14,
sint64 neg_g_59_low60_0_low20_14,
sint64 u_59_72,
sint64 v_59_72,
sint64 r_59_72,
sint64 s_59_72,
sint64 u_59_73,
sint64 v_59_73,
sint64 r_59_73,
sint64 s_59_73,
bit ne
)={
    u_59_72 * neg_f_59_low60_0_low20_0 + v_59_72 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_13 * (-(2**20)),
    r_59_72 * neg_f_59_low60_0_low20_0 + s_59_72 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_13 * (-(2**20))
&&
    u_59_72 * neg_f_59_low60_0_low20_0 + v_59_72 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_13 * (const 64 (-(2**20))),
    r_59_72 * neg_f_59_low60_0_low20_0 + s_59_72 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_13 + u_59_72 * (const 64 (2**21)) + v_59_72 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_13 + r_59_72 * (const 64 (2**21)) + s_59_72 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_13,
    neg_f_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_13,
    neg_g_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 72)) <=s delta, delta <=s (const 64 (1 + 2*72)),
    (const 64 (-(2**20))) <=s u_59_72, u_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_72, v_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_72, r_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_72, s_59_72 <=s (const 64 ((2**20))),
    u_59_72 + v_59_72 <=s (const 64 (2**20)),
    u_59_72 - v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 + v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 - v_59_72 <=s (const 64 (2**20)),
    r_59_72 + s_59_72 <=s (const 64 (2**20)),
    r_59_72 - s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 + s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 - s_59_72 <=s (const 64 (2**20)),
    u_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_59_72 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step72

// premise a
assume
neg_g_59_low60_0_low20_13 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_14 neg_f_59_low60_0_low20_13;
mov u_59_73 u_59_72;
mov v_59_73 v_59_72;

asr neg_g_59_low60_0_low20_14 neg_g_59_low60_0_low20_13 1;
asr r_59_73 r_59_72 1;
asr s_59_73 s_59_72 1;
assert
    true
&&
    neg_f_59_low60_0_low20_14 = neg_f_59_low60_0_low20_13,
    u_59_73 = u_59_72,
    v_59_73 = v_59_72,
    neg_g_59_low60_0_low20_14 * (const 64 2) = neg_g_59_low60_0_low20_13,
    r_59_73 * (const 64 2) = r_59_72,
    s_59_73 * (const 64 2) = s_59_72
;

assume
    neg_f_59_low60_0_low20_14 = neg_f_59_low60_0_low20_13,
    u_59_73 = u_59_72,
    v_59_73 = v_59_72,
    neg_g_59_low60_0_low20_14 * 2 = neg_g_59_low60_0_low20_13,
    r_59_73 * 2 = r_59_72,
    s_59_73 * 2 = s_59_72
&&
    true
;

{
    u_59_73 * neg_f_59_low60_0_low20_0 + v_59_73 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_73 * neg_f_59_low60_0_low20_0 + s_59_73 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_14 + u_59_73 * (const 64 (2**21)) + v_59_73 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_14 + r_59_73 * (const 64 (2**21)) + s_59_73 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_14,
    neg_f_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_14,
    neg_g_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 73)) <=s delta, delta <=s (const 64 (1 + 2*73)),
    (const 64 (-(2**20))) <=s u_59_73, u_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_73, v_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_73, r_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_73, s_59_73 <=s (const 64 ((2**20))),
    u_59_73 + v_59_73 <=s (const 64 (2**20)),
    u_59_73 - v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 + v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 - v_59_73 <=s (const 64 (2**20)),
    r_59_73 + s_59_73 <=s (const 64 (2**20)),
    r_59_73 - s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 + s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 - s_59_73 <=s (const 64 (2**20)),
    u_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_59_73 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_072_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_13,
sint64 neg_g_59_low60_0_low20_13,
sint64 neg_f_59_low60_0_low20_14,
sint64 neg_g_59_low60_0_low20_14,
sint64 u_59_72,
sint64 v_59_72,
sint64 r_59_72,
sint64 s_59_72,
sint64 u_59_73,
sint64 v_59_73,
sint64 r_59_73,
sint64 s_59_73,
bit ne
)={
    u_59_72 * neg_f_59_low60_0_low20_0 + v_59_72 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_13 * (-(2**20)),
    r_59_72 * neg_f_59_low60_0_low20_0 + s_59_72 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_13 * (-(2**20))
&&
    u_59_72 * neg_f_59_low60_0_low20_0 + v_59_72 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_13 * (const 64 (-(2**20))),
    r_59_72 * neg_f_59_low60_0_low20_0 + s_59_72 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_13 + u_59_72 * (const 64 (2**21)) + v_59_72 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_13 + r_59_72 * (const 64 (2**21)) + s_59_72 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_13,
    neg_f_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_13,
    neg_g_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 72)) <=s delta, delta <=s (const 64 (1 + 2*72)),
    (const 64 (-(2**20))) <=s u_59_72, u_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_72, v_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_72, r_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_72, s_59_72 <=s (const 64 ((2**20))),
    u_59_72 + v_59_72 <=s (const 64 (2**20)),
    u_59_72 - v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 + v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 - v_59_72 <=s (const 64 (2**20)),
    r_59_72 + s_59_72 <=s (const 64 (2**20)),
    r_59_72 - s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 + s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 - s_59_72 <=s (const 64 (2**20)),
    u_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_59_72 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step72

// premise b
assume
neg_g_59_low60_0_low20_13 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_14 neg_f_59_low60_0_low20_13;
mov u_59_73 u_59_72;
mov v_59_73 v_59_72;

add neg_g_59_low60_0_low20_14 neg_g_59_low60_0_low20_13 neg_f_59_low60_0_low20_13;
asr neg_g_59_low60_0_low20_14 neg_g_59_low60_0_low20_14 1;
add r_59_73 r_59_72 u_59_72;
asr r_59_73 r_59_73 1;
add s_59_73 s_59_72 v_59_72;
asr s_59_73 s_59_73 1;
assert
    true
&&
    neg_f_59_low60_0_low20_14 = neg_f_59_low60_0_low20_13,
    u_59_73 = u_59_72,
    v_59_73 = v_59_72,
    neg_g_59_low60_0_low20_14 * (const 64 2) = neg_g_59_low60_0_low20_13 + neg_f_59_low60_0_low20_13,
    r_59_73 * (const 64 2) = r_59_72 + u_59_72,
    s_59_73 * (const 64 2) = s_59_72 + v_59_72
;

assume
    neg_f_59_low60_0_low20_14 = neg_f_59_low60_0_low20_13,
    u_59_73 = u_59_72,
    v_59_73 = v_59_72,
    neg_g_59_low60_0_low20_14 * 2 = neg_g_59_low60_0_low20_13 + neg_f_59_low60_0_low20_13,
    r_59_73 * 2 = r_59_72 + u_59_72,
    s_59_73 * 2 = s_59_72 + v_59_72
&&
    true
;

{
    u_59_73 * neg_f_59_low60_0_low20_0 + v_59_73 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_73 * neg_f_59_low60_0_low20_0 + s_59_73 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_14 + u_59_73 * (const 64 (2**21)) + v_59_73 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_14 + r_59_73 * (const 64 (2**21)) + s_59_73 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_14,
    neg_f_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_14,
    neg_g_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 73)) <=s delta, delta <=s (const 64 (1 + 2*73)),
    (const 64 (-(2**20))) <=s u_59_73, u_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_73, v_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_73, r_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_73, s_59_73 <=s (const 64 ((2**20))),
    u_59_73 + v_59_73 <=s (const 64 (2**20)),
    u_59_73 - v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 + v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 - v_59_73 <=s (const 64 (2**20)),
    r_59_73 + s_59_73 <=s (const 64 (2**20)),
    r_59_73 - s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 + s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 - s_59_73 <=s (const 64 (2**20)),
    u_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_59_73 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_072_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_13,
sint64 neg_g_59_low60_0_low20_13,
sint64 neg_f_59_low60_0_low20_14,
sint64 neg_g_59_low60_0_low20_14,
sint64 u_59_72,
sint64 v_59_72,
sint64 r_59_72,
sint64 s_59_72,
sint64 u_59_73,
sint64 v_59_73,
sint64 r_59_73,
sint64 s_59_73,
bit ne
)={
    u_59_72 * neg_f_59_low60_0_low20_0 + v_59_72 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_13 * (-(2**20)),
    r_59_72 * neg_f_59_low60_0_low20_0 + s_59_72 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_13 * (-(2**20))
&&
    u_59_72 * neg_f_59_low60_0_low20_0 + v_59_72 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_13 * (const 64 (-(2**20))),
    r_59_72 * neg_f_59_low60_0_low20_0 + s_59_72 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_13 + u_59_72 * (const 64 (2**21)) + v_59_72 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_13 + r_59_72 * (const 64 (2**21)) + s_59_72 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_13,
    neg_f_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_13,
    neg_g_59_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 72)) <=s delta, delta <=s (const 64 (1 + 2*72)),
    (const 64 (-(2**20))) <=s u_59_72, u_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_72, v_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_72, r_59_72 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_72, s_59_72 <=s (const 64 ((2**20))),
    u_59_72 + v_59_72 <=s (const 64 (2**20)),
    u_59_72 - v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 + v_59_72 <=s (const 64 (2**20)),
    (const 64 0) - u_59_72 - v_59_72 <=s (const 64 (2**20)),
    r_59_72 + s_59_72 <=s (const 64 (2**20)),
    r_59_72 - s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 + s_59_72 <=s (const 64 (2**20)),
    (const 64 0) - r_59_72 - s_59_72 <=s (const 64 (2**20)),
    u_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_59_72 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_59_72 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step72

// premise c
assume
neg_g_59_low60_0_low20_13 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_14 neg_g_59_low60_0_low20_13;
mov u_59_73 r_59_72;
mov v_59_73 s_59_72;

subs dc neg_g_59_low60_0_low20_14 neg_g_59_low60_0_low20_13 neg_f_59_low60_0_low20_13;
asr neg_g_59_low60_0_low20_14 neg_g_59_low60_0_low20_14 1;
subs dc r_59_73 r_59_72 u_59_72;
asr r_59_73 r_59_73 1;
subs dc s_59_73 s_59_72 v_59_72;
asr s_59_73 s_59_73 1;
assert
    true
&&
    neg_f_59_low60_0_low20_14 = neg_g_59_low60_0_low20_13,
    u_59_73 = r_59_72,
    v_59_73 = s_59_72,
    neg_g_59_low60_0_low20_14 * (const 64 2) = neg_g_59_low60_0_low20_13 - neg_f_59_low60_0_low20_13,
    r_59_73 * (const 64 2) = r_59_72 - u_59_72,
    s_59_73 * (const 64 2) = s_59_72 - v_59_72
;

assume
    neg_f_59_low60_0_low20_14 = neg_g_59_low60_0_low20_13,
    u_59_73 = r_59_72,
    v_59_73 = s_59_72,
    neg_g_59_low60_0_low20_14 * 2 = neg_g_59_low60_0_low20_13 - neg_f_59_low60_0_low20_13,
    r_59_73 * 2 = r_59_72 - u_59_72,
    s_59_73 * 2 = s_59_72 - v_59_72
&&
    true
;

{
    u_59_73 * neg_f_59_low60_0_low20_0 + v_59_73 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_73 * neg_f_59_low60_0_low20_0 + s_59_73 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_14 + u_59_73 * (const 64 (2**21)) + v_59_73 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_14 + r_59_73 * (const 64 (2**21)) + s_59_73 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_14,
    neg_f_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_14,
    neg_g_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 73)) <=s delta, delta <=s (const 64 (1 + 2*73)),
    (const 64 (-(2**20))) <=s u_59_73, u_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_73, v_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_73, r_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_73, s_59_73 <=s (const 64 ((2**20))),
    u_59_73 + v_59_73 <=s (const 64 (2**20)),
    u_59_73 - v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 + v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 - v_59_73 <=s (const 64 (2**20)),
    r_59_73 + s_59_73 <=s (const 64 (2**20)),
    r_59_73 - s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 + s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 - s_59_73 <=s (const 64 (2**20)),
    u_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_59_73 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_073_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_14,
sint64 neg_g_59_low60_0_low20_14,
sint64 neg_f_59_low60_0_low20_15,
sint64 neg_g_59_low60_0_low20_15,
sint64 u_59_73,
sint64 v_59_73,
sint64 r_59_73,
sint64 s_59_73,
sint64 u_59_74,
sint64 v_59_74,
sint64 r_59_74,
sint64 s_59_74,
bit ne
)={
    u_59_73 * neg_f_59_low60_0_low20_0 + v_59_73 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_14 * (-(2**20)),
    r_59_73 * neg_f_59_low60_0_low20_0 + s_59_73 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_14 * (-(2**20))
&&
    u_59_73 * neg_f_59_low60_0_low20_0 + v_59_73 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_14 * (const 64 (-(2**20))),
    r_59_73 * neg_f_59_low60_0_low20_0 + s_59_73 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_14 + u_59_73 * (const 64 (2**21)) + v_59_73 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_14 + r_59_73 * (const 64 (2**21)) + s_59_73 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_14,
    neg_f_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_14,
    neg_g_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 73)) <=s delta, delta <=s (const 64 (1 + 2*73)),
    (const 64 (-(2**20))) <=s u_59_73, u_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_73, v_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_73, r_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_73, s_59_73 <=s (const 64 ((2**20))),
    u_59_73 + v_59_73 <=s (const 64 (2**20)),
    u_59_73 - v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 + v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 - v_59_73 <=s (const 64 (2**20)),
    r_59_73 + s_59_73 <=s (const 64 (2**20)),
    r_59_73 - s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 + s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 - s_59_73 <=s (const 64 (2**20)),
    u_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_59_73 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step73

// premise a
assume
neg_g_59_low60_0_low20_14 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_15 neg_f_59_low60_0_low20_14;
mov u_59_74 u_59_73;
mov v_59_74 v_59_73;

asr neg_g_59_low60_0_low20_15 neg_g_59_low60_0_low20_14 1;
asr r_59_74 r_59_73 1;
asr s_59_74 s_59_73 1;
assert
    true
&&
    neg_f_59_low60_0_low20_15 = neg_f_59_low60_0_low20_14,
    u_59_74 = u_59_73,
    v_59_74 = v_59_73,
    neg_g_59_low60_0_low20_15 * (const 64 2) = neg_g_59_low60_0_low20_14,
    r_59_74 * (const 64 2) = r_59_73,
    s_59_74 * (const 64 2) = s_59_73
;

assume
    neg_f_59_low60_0_low20_15 = neg_f_59_low60_0_low20_14,
    u_59_74 = u_59_73,
    v_59_74 = v_59_73,
    neg_g_59_low60_0_low20_15 * 2 = neg_g_59_low60_0_low20_14,
    r_59_74 * 2 = r_59_73,
    s_59_74 * 2 = s_59_73
&&
    true
;

{
    u_59_74 * neg_f_59_low60_0_low20_0 + v_59_74 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_74 * neg_f_59_low60_0_low20_0 + s_59_74 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_15 + u_59_74 * (const 64 (2**21)) + v_59_74 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_15 + r_59_74 * (const 64 (2**21)) + s_59_74 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_15,
    neg_f_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_15,
    neg_g_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 74)) <=s delta, delta <=s (const 64 (1 + 2*74)),
    (const 64 (-(2**20))) <=s u_59_74, u_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_74, v_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_74, r_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_74, s_59_74 <=s (const 64 ((2**20))),
    u_59_74 + v_59_74 <=s (const 64 (2**20)),
    u_59_74 - v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 + v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 - v_59_74 <=s (const 64 (2**20)),
    r_59_74 + s_59_74 <=s (const 64 (2**20)),
    r_59_74 - s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 + s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 - s_59_74 <=s (const 64 (2**20)),
    u_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_59_74 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_073_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_14,
sint64 neg_g_59_low60_0_low20_14,
sint64 neg_f_59_low60_0_low20_15,
sint64 neg_g_59_low60_0_low20_15,
sint64 u_59_73,
sint64 v_59_73,
sint64 r_59_73,
sint64 s_59_73,
sint64 u_59_74,
sint64 v_59_74,
sint64 r_59_74,
sint64 s_59_74,
bit ne
)={
    u_59_73 * neg_f_59_low60_0_low20_0 + v_59_73 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_14 * (-(2**20)),
    r_59_73 * neg_f_59_low60_0_low20_0 + s_59_73 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_14 * (-(2**20))
&&
    u_59_73 * neg_f_59_low60_0_low20_0 + v_59_73 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_14 * (const 64 (-(2**20))),
    r_59_73 * neg_f_59_low60_0_low20_0 + s_59_73 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_14 + u_59_73 * (const 64 (2**21)) + v_59_73 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_14 + r_59_73 * (const 64 (2**21)) + s_59_73 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_14,
    neg_f_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_14,
    neg_g_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 73)) <=s delta, delta <=s (const 64 (1 + 2*73)),
    (const 64 (-(2**20))) <=s u_59_73, u_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_73, v_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_73, r_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_73, s_59_73 <=s (const 64 ((2**20))),
    u_59_73 + v_59_73 <=s (const 64 (2**20)),
    u_59_73 - v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 + v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 - v_59_73 <=s (const 64 (2**20)),
    r_59_73 + s_59_73 <=s (const 64 (2**20)),
    r_59_73 - s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 + s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 - s_59_73 <=s (const 64 (2**20)),
    u_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_59_73 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step73

// premise b
assume
neg_g_59_low60_0_low20_14 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_15 neg_f_59_low60_0_low20_14;
mov u_59_74 u_59_73;
mov v_59_74 v_59_73;

add neg_g_59_low60_0_low20_15 neg_g_59_low60_0_low20_14 neg_f_59_low60_0_low20_14;
asr neg_g_59_low60_0_low20_15 neg_g_59_low60_0_low20_15 1;
add r_59_74 r_59_73 u_59_73;
asr r_59_74 r_59_74 1;
add s_59_74 s_59_73 v_59_73;
asr s_59_74 s_59_74 1;
assert
    true
&&
    neg_f_59_low60_0_low20_15 = neg_f_59_low60_0_low20_14,
    u_59_74 = u_59_73,
    v_59_74 = v_59_73,
    neg_g_59_low60_0_low20_15 * (const 64 2) = neg_g_59_low60_0_low20_14 + neg_f_59_low60_0_low20_14,
    r_59_74 * (const 64 2) = r_59_73 + u_59_73,
    s_59_74 * (const 64 2) = s_59_73 + v_59_73
;

assume
    neg_f_59_low60_0_low20_15 = neg_f_59_low60_0_low20_14,
    u_59_74 = u_59_73,
    v_59_74 = v_59_73,
    neg_g_59_low60_0_low20_15 * 2 = neg_g_59_low60_0_low20_14 + neg_f_59_low60_0_low20_14,
    r_59_74 * 2 = r_59_73 + u_59_73,
    s_59_74 * 2 = s_59_73 + v_59_73
&&
    true
;

{
    u_59_74 * neg_f_59_low60_0_low20_0 + v_59_74 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_74 * neg_f_59_low60_0_low20_0 + s_59_74 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_15 + u_59_74 * (const 64 (2**21)) + v_59_74 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_15 + r_59_74 * (const 64 (2**21)) + s_59_74 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_15,
    neg_f_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_15,
    neg_g_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 74)) <=s delta, delta <=s (const 64 (1 + 2*74)),
    (const 64 (-(2**20))) <=s u_59_74, u_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_74, v_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_74, r_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_74, s_59_74 <=s (const 64 ((2**20))),
    u_59_74 + v_59_74 <=s (const 64 (2**20)),
    u_59_74 - v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 + v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 - v_59_74 <=s (const 64 (2**20)),
    r_59_74 + s_59_74 <=s (const 64 (2**20)),
    r_59_74 - s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 + s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 - s_59_74 <=s (const 64 (2**20)),
    u_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_59_74 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_073_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_14,
sint64 neg_g_59_low60_0_low20_14,
sint64 neg_f_59_low60_0_low20_15,
sint64 neg_g_59_low60_0_low20_15,
sint64 u_59_73,
sint64 v_59_73,
sint64 r_59_73,
sint64 s_59_73,
sint64 u_59_74,
sint64 v_59_74,
sint64 r_59_74,
sint64 s_59_74,
bit ne
)={
    u_59_73 * neg_f_59_low60_0_low20_0 + v_59_73 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_14 * (-(2**20)),
    r_59_73 * neg_f_59_low60_0_low20_0 + s_59_73 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_14 * (-(2**20))
&&
    u_59_73 * neg_f_59_low60_0_low20_0 + v_59_73 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_14 * (const 64 (-(2**20))),
    r_59_73 * neg_f_59_low60_0_low20_0 + s_59_73 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_14 + u_59_73 * (const 64 (2**21)) + v_59_73 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_14 + r_59_73 * (const 64 (2**21)) + s_59_73 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_14,
    neg_f_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_14,
    neg_g_59_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 73)) <=s delta, delta <=s (const 64 (1 + 2*73)),
    (const 64 (-(2**20))) <=s u_59_73, u_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_73, v_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_73, r_59_73 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_73, s_59_73 <=s (const 64 ((2**20))),
    u_59_73 + v_59_73 <=s (const 64 (2**20)),
    u_59_73 - v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 + v_59_73 <=s (const 64 (2**20)),
    (const 64 0) - u_59_73 - v_59_73 <=s (const 64 (2**20)),
    r_59_73 + s_59_73 <=s (const 64 (2**20)),
    r_59_73 - s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 + s_59_73 <=s (const 64 (2**20)),
    (const 64 0) - r_59_73 - s_59_73 <=s (const 64 (2**20)),
    u_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_59_73 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_59_73 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step73

// premise c
assume
neg_g_59_low60_0_low20_14 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_15 neg_g_59_low60_0_low20_14;
mov u_59_74 r_59_73;
mov v_59_74 s_59_73;

subs dc neg_g_59_low60_0_low20_15 neg_g_59_low60_0_low20_14 neg_f_59_low60_0_low20_14;
asr neg_g_59_low60_0_low20_15 neg_g_59_low60_0_low20_15 1;
subs dc r_59_74 r_59_73 u_59_73;
asr r_59_74 r_59_74 1;
subs dc s_59_74 s_59_73 v_59_73;
asr s_59_74 s_59_74 1;
assert
    true
&&
    neg_f_59_low60_0_low20_15 = neg_g_59_low60_0_low20_14,
    u_59_74 = r_59_73,
    v_59_74 = s_59_73,
    neg_g_59_low60_0_low20_15 * (const 64 2) = neg_g_59_low60_0_low20_14 - neg_f_59_low60_0_low20_14,
    r_59_74 * (const 64 2) = r_59_73 - u_59_73,
    s_59_74 * (const 64 2) = s_59_73 - v_59_73
;

assume
    neg_f_59_low60_0_low20_15 = neg_g_59_low60_0_low20_14,
    u_59_74 = r_59_73,
    v_59_74 = s_59_73,
    neg_g_59_low60_0_low20_15 * 2 = neg_g_59_low60_0_low20_14 - neg_f_59_low60_0_low20_14,
    r_59_74 * 2 = r_59_73 - u_59_73,
    s_59_74 * 2 = s_59_73 - v_59_73
&&
    true
;

{
    u_59_74 * neg_f_59_low60_0_low20_0 + v_59_74 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_74 * neg_f_59_low60_0_low20_0 + s_59_74 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_15 + u_59_74 * (const 64 (2**21)) + v_59_74 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_15 + r_59_74 * (const 64 (2**21)) + s_59_74 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_15,
    neg_f_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_15,
    neg_g_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 74)) <=s delta, delta <=s (const 64 (1 + 2*74)),
    (const 64 (-(2**20))) <=s u_59_74, u_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_74, v_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_74, r_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_74, s_59_74 <=s (const 64 ((2**20))),
    u_59_74 + v_59_74 <=s (const 64 (2**20)),
    u_59_74 - v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 + v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 - v_59_74 <=s (const 64 (2**20)),
    r_59_74 + s_59_74 <=s (const 64 (2**20)),
    r_59_74 - s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 + s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 - s_59_74 <=s (const 64 (2**20)),
    u_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_59_74 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_074_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_15,
sint64 neg_g_59_low60_0_low20_15,
sint64 neg_f_59_low60_0_low20_16,
sint64 neg_g_59_low60_0_low20_16,
sint64 u_59_74,
sint64 v_59_74,
sint64 r_59_74,
sint64 s_59_74,
sint64 u_59_75,
sint64 v_59_75,
sint64 r_59_75,
sint64 s_59_75,
bit ne
)={
    u_59_74 * neg_f_59_low60_0_low20_0 + v_59_74 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_15 * (-(2**20)),
    r_59_74 * neg_f_59_low60_0_low20_0 + s_59_74 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_15 * (-(2**20))
&&
    u_59_74 * neg_f_59_low60_0_low20_0 + v_59_74 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_15 * (const 64 (-(2**20))),
    r_59_74 * neg_f_59_low60_0_low20_0 + s_59_74 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_15 + u_59_74 * (const 64 (2**21)) + v_59_74 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_15 + r_59_74 * (const 64 (2**21)) + s_59_74 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_15,
    neg_f_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_15,
    neg_g_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 74)) <=s delta, delta <=s (const 64 (1 + 2*74)),
    (const 64 (-(2**20))) <=s u_59_74, u_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_74, v_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_74, r_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_74, s_59_74 <=s (const 64 ((2**20))),
    u_59_74 + v_59_74 <=s (const 64 (2**20)),
    u_59_74 - v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 + v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 - v_59_74 <=s (const 64 (2**20)),
    r_59_74 + s_59_74 <=s (const 64 (2**20)),
    r_59_74 - s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 + s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 - s_59_74 <=s (const 64 (2**20)),
    u_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_59_74 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step74

// premise a
assume
neg_g_59_low60_0_low20_15 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_16 neg_f_59_low60_0_low20_15;
mov u_59_75 u_59_74;
mov v_59_75 v_59_74;

asr neg_g_59_low60_0_low20_16 neg_g_59_low60_0_low20_15 1;
asr r_59_75 r_59_74 1;
asr s_59_75 s_59_74 1;
assert
    true
&&
    neg_f_59_low60_0_low20_16 = neg_f_59_low60_0_low20_15,
    u_59_75 = u_59_74,
    v_59_75 = v_59_74,
    neg_g_59_low60_0_low20_16 * (const 64 2) = neg_g_59_low60_0_low20_15,
    r_59_75 * (const 64 2) = r_59_74,
    s_59_75 * (const 64 2) = s_59_74
;

assume
    neg_f_59_low60_0_low20_16 = neg_f_59_low60_0_low20_15,
    u_59_75 = u_59_74,
    v_59_75 = v_59_74,
    neg_g_59_low60_0_low20_16 * 2 = neg_g_59_low60_0_low20_15,
    r_59_75 * 2 = r_59_74,
    s_59_75 * 2 = s_59_74
&&
    true
;

{
    u_59_75 * neg_f_59_low60_0_low20_0 + v_59_75 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_75 * neg_f_59_low60_0_low20_0 + s_59_75 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_16 + u_59_75 * (const 64 (2**21)) + v_59_75 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_16 + r_59_75 * (const 64 (2**21)) + s_59_75 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_16,
    neg_f_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_16,
    neg_g_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 75)) <=s delta, delta <=s (const 64 (1 + 2*75)),
    (const 64 (-(2**20))) <=s u_59_75, u_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_75, v_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_75, r_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_75, s_59_75 <=s (const 64 ((2**20))),
    u_59_75 + v_59_75 <=s (const 64 (2**20)),
    u_59_75 - v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 + v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 - v_59_75 <=s (const 64 (2**20)),
    r_59_75 + s_59_75 <=s (const 64 (2**20)),
    r_59_75 - s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 + s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 - s_59_75 <=s (const 64 (2**20)),
    u_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_59_75 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_074_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_15,
sint64 neg_g_59_low60_0_low20_15,
sint64 neg_f_59_low60_0_low20_16,
sint64 neg_g_59_low60_0_low20_16,
sint64 u_59_74,
sint64 v_59_74,
sint64 r_59_74,
sint64 s_59_74,
sint64 u_59_75,
sint64 v_59_75,
sint64 r_59_75,
sint64 s_59_75,
bit ne
)={
    u_59_74 * neg_f_59_low60_0_low20_0 + v_59_74 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_15 * (-(2**20)),
    r_59_74 * neg_f_59_low60_0_low20_0 + s_59_74 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_15 * (-(2**20))
&&
    u_59_74 * neg_f_59_low60_0_low20_0 + v_59_74 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_15 * (const 64 (-(2**20))),
    r_59_74 * neg_f_59_low60_0_low20_0 + s_59_74 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_15 + u_59_74 * (const 64 (2**21)) + v_59_74 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_15 + r_59_74 * (const 64 (2**21)) + s_59_74 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_15,
    neg_f_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_15,
    neg_g_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 74)) <=s delta, delta <=s (const 64 (1 + 2*74)),
    (const 64 (-(2**20))) <=s u_59_74, u_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_74, v_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_74, r_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_74, s_59_74 <=s (const 64 ((2**20))),
    u_59_74 + v_59_74 <=s (const 64 (2**20)),
    u_59_74 - v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 + v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 - v_59_74 <=s (const 64 (2**20)),
    r_59_74 + s_59_74 <=s (const 64 (2**20)),
    r_59_74 - s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 + s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 - s_59_74 <=s (const 64 (2**20)),
    u_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_59_74 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step74

// premise b
assume
neg_g_59_low60_0_low20_15 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_16 neg_f_59_low60_0_low20_15;
mov u_59_75 u_59_74;
mov v_59_75 v_59_74;

add neg_g_59_low60_0_low20_16 neg_g_59_low60_0_low20_15 neg_f_59_low60_0_low20_15;
asr neg_g_59_low60_0_low20_16 neg_g_59_low60_0_low20_16 1;
add r_59_75 r_59_74 u_59_74;
asr r_59_75 r_59_75 1;
add s_59_75 s_59_74 v_59_74;
asr s_59_75 s_59_75 1;
assert
    true
&&
    neg_f_59_low60_0_low20_16 = neg_f_59_low60_0_low20_15,
    u_59_75 = u_59_74,
    v_59_75 = v_59_74,
    neg_g_59_low60_0_low20_16 * (const 64 2) = neg_g_59_low60_0_low20_15 + neg_f_59_low60_0_low20_15,
    r_59_75 * (const 64 2) = r_59_74 + u_59_74,
    s_59_75 * (const 64 2) = s_59_74 + v_59_74
;

assume
    neg_f_59_low60_0_low20_16 = neg_f_59_low60_0_low20_15,
    u_59_75 = u_59_74,
    v_59_75 = v_59_74,
    neg_g_59_low60_0_low20_16 * 2 = neg_g_59_low60_0_low20_15 + neg_f_59_low60_0_low20_15,
    r_59_75 * 2 = r_59_74 + u_59_74,
    s_59_75 * 2 = s_59_74 + v_59_74
&&
    true
;

{
    u_59_75 * neg_f_59_low60_0_low20_0 + v_59_75 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_75 * neg_f_59_low60_0_low20_0 + s_59_75 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_16 + u_59_75 * (const 64 (2**21)) + v_59_75 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_16 + r_59_75 * (const 64 (2**21)) + s_59_75 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_16,
    neg_f_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_16,
    neg_g_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 75)) <=s delta, delta <=s (const 64 (1 + 2*75)),
    (const 64 (-(2**20))) <=s u_59_75, u_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_75, v_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_75, r_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_75, s_59_75 <=s (const 64 ((2**20))),
    u_59_75 + v_59_75 <=s (const 64 (2**20)),
    u_59_75 - v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 + v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 - v_59_75 <=s (const 64 (2**20)),
    r_59_75 + s_59_75 <=s (const 64 (2**20)),
    r_59_75 - s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 + s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 - s_59_75 <=s (const 64 (2**20)),
    u_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_59_75 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_074_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_15,
sint64 neg_g_59_low60_0_low20_15,
sint64 neg_f_59_low60_0_low20_16,
sint64 neg_g_59_low60_0_low20_16,
sint64 u_59_74,
sint64 v_59_74,
sint64 r_59_74,
sint64 s_59_74,
sint64 u_59_75,
sint64 v_59_75,
sint64 r_59_75,
sint64 s_59_75,
bit ne
)={
    u_59_74 * neg_f_59_low60_0_low20_0 + v_59_74 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_15 * (-(2**20)),
    r_59_74 * neg_f_59_low60_0_low20_0 + s_59_74 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_15 * (-(2**20))
&&
    u_59_74 * neg_f_59_low60_0_low20_0 + v_59_74 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_15 * (const 64 (-(2**20))),
    r_59_74 * neg_f_59_low60_0_low20_0 + s_59_74 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_15 + u_59_74 * (const 64 (2**21)) + v_59_74 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_15 + r_59_74 * (const 64 (2**21)) + s_59_74 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_15,
    neg_f_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_15,
    neg_g_59_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 74)) <=s delta, delta <=s (const 64 (1 + 2*74)),
    (const 64 (-(2**20))) <=s u_59_74, u_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_74, v_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_74, r_59_74 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_74, s_59_74 <=s (const 64 ((2**20))),
    u_59_74 + v_59_74 <=s (const 64 (2**20)),
    u_59_74 - v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 + v_59_74 <=s (const 64 (2**20)),
    (const 64 0) - u_59_74 - v_59_74 <=s (const 64 (2**20)),
    r_59_74 + s_59_74 <=s (const 64 (2**20)),
    r_59_74 - s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 + s_59_74 <=s (const 64 (2**20)),
    (const 64 0) - r_59_74 - s_59_74 <=s (const 64 (2**20)),
    u_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_59_74 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_59_74 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step74

// premise c
assume
neg_g_59_low60_0_low20_15 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_16 neg_g_59_low60_0_low20_15;
mov u_59_75 r_59_74;
mov v_59_75 s_59_74;

subs dc neg_g_59_low60_0_low20_16 neg_g_59_low60_0_low20_15 neg_f_59_low60_0_low20_15;
asr neg_g_59_low60_0_low20_16 neg_g_59_low60_0_low20_16 1;
subs dc r_59_75 r_59_74 u_59_74;
asr r_59_75 r_59_75 1;
subs dc s_59_75 s_59_74 v_59_74;
asr s_59_75 s_59_75 1;
assert
    true
&&
    neg_f_59_low60_0_low20_16 = neg_g_59_low60_0_low20_15,
    u_59_75 = r_59_74,
    v_59_75 = s_59_74,
    neg_g_59_low60_0_low20_16 * (const 64 2) = neg_g_59_low60_0_low20_15 - neg_f_59_low60_0_low20_15,
    r_59_75 * (const 64 2) = r_59_74 - u_59_74,
    s_59_75 * (const 64 2) = s_59_74 - v_59_74
;

assume
    neg_f_59_low60_0_low20_16 = neg_g_59_low60_0_low20_15,
    u_59_75 = r_59_74,
    v_59_75 = s_59_74,
    neg_g_59_low60_0_low20_16 * 2 = neg_g_59_low60_0_low20_15 - neg_f_59_low60_0_low20_15,
    r_59_75 * 2 = r_59_74 - u_59_74,
    s_59_75 * 2 = s_59_74 - v_59_74
&&
    true
;

{
    u_59_75 * neg_f_59_low60_0_low20_0 + v_59_75 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_75 * neg_f_59_low60_0_low20_0 + s_59_75 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_16 + u_59_75 * (const 64 (2**21)) + v_59_75 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_16 + r_59_75 * (const 64 (2**21)) + s_59_75 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_16,
    neg_f_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_16,
    neg_g_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 75)) <=s delta, delta <=s (const 64 (1 + 2*75)),
    (const 64 (-(2**20))) <=s u_59_75, u_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_75, v_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_75, r_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_75, s_59_75 <=s (const 64 ((2**20))),
    u_59_75 + v_59_75 <=s (const 64 (2**20)),
    u_59_75 - v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 + v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 - v_59_75 <=s (const 64 (2**20)),
    r_59_75 + s_59_75 <=s (const 64 (2**20)),
    r_59_75 - s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 + s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 - s_59_75 <=s (const 64 (2**20)),
    u_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_59_75 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_075_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_16,
sint64 neg_g_59_low60_0_low20_16,
sint64 neg_f_59_low60_0_low20_17,
sint64 neg_g_59_low60_0_low20_17,
sint64 u_59_75,
sint64 v_59_75,
sint64 r_59_75,
sint64 s_59_75,
sint64 u_59_76,
sint64 v_59_76,
sint64 r_59_76,
sint64 s_59_76,
bit ne
)={
    u_59_75 * neg_f_59_low60_0_low20_0 + v_59_75 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_16 * (-(2**20)),
    r_59_75 * neg_f_59_low60_0_low20_0 + s_59_75 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_16 * (-(2**20))
&&
    u_59_75 * neg_f_59_low60_0_low20_0 + v_59_75 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_16 * (const 64 (-(2**20))),
    r_59_75 * neg_f_59_low60_0_low20_0 + s_59_75 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_16 + u_59_75 * (const 64 (2**21)) + v_59_75 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_16 + r_59_75 * (const 64 (2**21)) + s_59_75 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_16,
    neg_f_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_16,
    neg_g_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 75)) <=s delta, delta <=s (const 64 (1 + 2*75)),
    (const 64 (-(2**20))) <=s u_59_75, u_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_75, v_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_75, r_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_75, s_59_75 <=s (const 64 ((2**20))),
    u_59_75 + v_59_75 <=s (const 64 (2**20)),
    u_59_75 - v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 + v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 - v_59_75 <=s (const 64 (2**20)),
    r_59_75 + s_59_75 <=s (const 64 (2**20)),
    r_59_75 - s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 + s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 - s_59_75 <=s (const 64 (2**20)),
    u_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_59_75 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step75

// premise a
assume
neg_g_59_low60_0_low20_16 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_17 neg_f_59_low60_0_low20_16;
mov u_59_76 u_59_75;
mov v_59_76 v_59_75;

asr neg_g_59_low60_0_low20_17 neg_g_59_low60_0_low20_16 1;
asr r_59_76 r_59_75 1;
asr s_59_76 s_59_75 1;
assert
    true
&&
    neg_f_59_low60_0_low20_17 = neg_f_59_low60_0_low20_16,
    u_59_76 = u_59_75,
    v_59_76 = v_59_75,
    neg_g_59_low60_0_low20_17 * (const 64 2) = neg_g_59_low60_0_low20_16,
    r_59_76 * (const 64 2) = r_59_75,
    s_59_76 * (const 64 2) = s_59_75
;

assume
    neg_f_59_low60_0_low20_17 = neg_f_59_low60_0_low20_16,
    u_59_76 = u_59_75,
    v_59_76 = v_59_75,
    neg_g_59_low60_0_low20_17 * 2 = neg_g_59_low60_0_low20_16,
    r_59_76 * 2 = r_59_75,
    s_59_76 * 2 = s_59_75
&&
    true
;

{
    u_59_76 * neg_f_59_low60_0_low20_0 + v_59_76 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_76 * neg_f_59_low60_0_low20_0 + s_59_76 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_17 + u_59_76 * (const 64 (2**21)) + v_59_76 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_17 + r_59_76 * (const 64 (2**21)) + s_59_76 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_17,
    neg_f_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_17,
    neg_g_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 76)) <=s delta, delta <=s (const 64 (1 + 2*76)),
    (const 64 (-(2**20))) <=s u_59_76, u_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_76, v_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_76, r_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_76, s_59_76 <=s (const 64 ((2**20))),
    u_59_76 + v_59_76 <=s (const 64 (2**20)),
    u_59_76 - v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 + v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 - v_59_76 <=s (const 64 (2**20)),
    r_59_76 + s_59_76 <=s (const 64 (2**20)),
    r_59_76 - s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 + s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 - s_59_76 <=s (const 64 (2**20)),
    u_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_59_76 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_075_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_16,
sint64 neg_g_59_low60_0_low20_16,
sint64 neg_f_59_low60_0_low20_17,
sint64 neg_g_59_low60_0_low20_17,
sint64 u_59_75,
sint64 v_59_75,
sint64 r_59_75,
sint64 s_59_75,
sint64 u_59_76,
sint64 v_59_76,
sint64 r_59_76,
sint64 s_59_76,
bit ne
)={
    u_59_75 * neg_f_59_low60_0_low20_0 + v_59_75 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_16 * (-(2**20)),
    r_59_75 * neg_f_59_low60_0_low20_0 + s_59_75 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_16 * (-(2**20))
&&
    u_59_75 * neg_f_59_low60_0_low20_0 + v_59_75 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_16 * (const 64 (-(2**20))),
    r_59_75 * neg_f_59_low60_0_low20_0 + s_59_75 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_16 + u_59_75 * (const 64 (2**21)) + v_59_75 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_16 + r_59_75 * (const 64 (2**21)) + s_59_75 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_16,
    neg_f_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_16,
    neg_g_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 75)) <=s delta, delta <=s (const 64 (1 + 2*75)),
    (const 64 (-(2**20))) <=s u_59_75, u_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_75, v_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_75, r_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_75, s_59_75 <=s (const 64 ((2**20))),
    u_59_75 + v_59_75 <=s (const 64 (2**20)),
    u_59_75 - v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 + v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 - v_59_75 <=s (const 64 (2**20)),
    r_59_75 + s_59_75 <=s (const 64 (2**20)),
    r_59_75 - s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 + s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 - s_59_75 <=s (const 64 (2**20)),
    u_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_59_75 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step75

// premise b
assume
neg_g_59_low60_0_low20_16 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_17 neg_f_59_low60_0_low20_16;
mov u_59_76 u_59_75;
mov v_59_76 v_59_75;

add neg_g_59_low60_0_low20_17 neg_g_59_low60_0_low20_16 neg_f_59_low60_0_low20_16;
asr neg_g_59_low60_0_low20_17 neg_g_59_low60_0_low20_17 1;
add r_59_76 r_59_75 u_59_75;
asr r_59_76 r_59_76 1;
add s_59_76 s_59_75 v_59_75;
asr s_59_76 s_59_76 1;
assert
    true
&&
    neg_f_59_low60_0_low20_17 = neg_f_59_low60_0_low20_16,
    u_59_76 = u_59_75,
    v_59_76 = v_59_75,
    neg_g_59_low60_0_low20_17 * (const 64 2) = neg_g_59_low60_0_low20_16 + neg_f_59_low60_0_low20_16,
    r_59_76 * (const 64 2) = r_59_75 + u_59_75,
    s_59_76 * (const 64 2) = s_59_75 + v_59_75
;

assume
    neg_f_59_low60_0_low20_17 = neg_f_59_low60_0_low20_16,
    u_59_76 = u_59_75,
    v_59_76 = v_59_75,
    neg_g_59_low60_0_low20_17 * 2 = neg_g_59_low60_0_low20_16 + neg_f_59_low60_0_low20_16,
    r_59_76 * 2 = r_59_75 + u_59_75,
    s_59_76 * 2 = s_59_75 + v_59_75
&&
    true
;

{
    u_59_76 * neg_f_59_low60_0_low20_0 + v_59_76 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_76 * neg_f_59_low60_0_low20_0 + s_59_76 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_17 + u_59_76 * (const 64 (2**21)) + v_59_76 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_17 + r_59_76 * (const 64 (2**21)) + s_59_76 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_17,
    neg_f_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_17,
    neg_g_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 76)) <=s delta, delta <=s (const 64 (1 + 2*76)),
    (const 64 (-(2**20))) <=s u_59_76, u_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_76, v_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_76, r_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_76, s_59_76 <=s (const 64 ((2**20))),
    u_59_76 + v_59_76 <=s (const 64 (2**20)),
    u_59_76 - v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 + v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 - v_59_76 <=s (const 64 (2**20)),
    r_59_76 + s_59_76 <=s (const 64 (2**20)),
    r_59_76 - s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 + s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 - s_59_76 <=s (const 64 (2**20)),
    u_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_59_76 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_075_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_16,
sint64 neg_g_59_low60_0_low20_16,
sint64 neg_f_59_low60_0_low20_17,
sint64 neg_g_59_low60_0_low20_17,
sint64 u_59_75,
sint64 v_59_75,
sint64 r_59_75,
sint64 s_59_75,
sint64 u_59_76,
sint64 v_59_76,
sint64 r_59_76,
sint64 s_59_76,
bit ne
)={
    u_59_75 * neg_f_59_low60_0_low20_0 + v_59_75 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_16 * (-(2**20)),
    r_59_75 * neg_f_59_low60_0_low20_0 + s_59_75 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_16 * (-(2**20))
&&
    u_59_75 * neg_f_59_low60_0_low20_0 + v_59_75 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_16 * (const 64 (-(2**20))),
    r_59_75 * neg_f_59_low60_0_low20_0 + s_59_75 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_16 + u_59_75 * (const 64 (2**21)) + v_59_75 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_16 + r_59_75 * (const 64 (2**21)) + s_59_75 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_16,
    neg_f_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_16,
    neg_g_59_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 75)) <=s delta, delta <=s (const 64 (1 + 2*75)),
    (const 64 (-(2**20))) <=s u_59_75, u_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_75, v_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_75, r_59_75 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_75, s_59_75 <=s (const 64 ((2**20))),
    u_59_75 + v_59_75 <=s (const 64 (2**20)),
    u_59_75 - v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 + v_59_75 <=s (const 64 (2**20)),
    (const 64 0) - u_59_75 - v_59_75 <=s (const 64 (2**20)),
    r_59_75 + s_59_75 <=s (const 64 (2**20)),
    r_59_75 - s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 + s_59_75 <=s (const 64 (2**20)),
    (const 64 0) - r_59_75 - s_59_75 <=s (const 64 (2**20)),
    u_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_59_75 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_59_75 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step75

// premise c
assume
neg_g_59_low60_0_low20_16 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_17 neg_g_59_low60_0_low20_16;
mov u_59_76 r_59_75;
mov v_59_76 s_59_75;

subs dc neg_g_59_low60_0_low20_17 neg_g_59_low60_0_low20_16 neg_f_59_low60_0_low20_16;
asr neg_g_59_low60_0_low20_17 neg_g_59_low60_0_low20_17 1;
subs dc r_59_76 r_59_75 u_59_75;
asr r_59_76 r_59_76 1;
subs dc s_59_76 s_59_75 v_59_75;
asr s_59_76 s_59_76 1;
assert
    true
&&
    neg_f_59_low60_0_low20_17 = neg_g_59_low60_0_low20_16,
    u_59_76 = r_59_75,
    v_59_76 = s_59_75,
    neg_g_59_low60_0_low20_17 * (const 64 2) = neg_g_59_low60_0_low20_16 - neg_f_59_low60_0_low20_16,
    r_59_76 * (const 64 2) = r_59_75 - u_59_75,
    s_59_76 * (const 64 2) = s_59_75 - v_59_75
;

assume
    neg_f_59_low60_0_low20_17 = neg_g_59_low60_0_low20_16,
    u_59_76 = r_59_75,
    v_59_76 = s_59_75,
    neg_g_59_low60_0_low20_17 * 2 = neg_g_59_low60_0_low20_16 - neg_f_59_low60_0_low20_16,
    r_59_76 * 2 = r_59_75 - u_59_75,
    s_59_76 * 2 = s_59_75 - v_59_75
&&
    true
;

{
    u_59_76 * neg_f_59_low60_0_low20_0 + v_59_76 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_76 * neg_f_59_low60_0_low20_0 + s_59_76 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_17 + u_59_76 * (const 64 (2**21)) + v_59_76 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_17 + r_59_76 * (const 64 (2**21)) + s_59_76 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_17,
    neg_f_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_17,
    neg_g_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 76)) <=s delta, delta <=s (const 64 (1 + 2*76)),
    (const 64 (-(2**20))) <=s u_59_76, u_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_76, v_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_76, r_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_76, s_59_76 <=s (const 64 ((2**20))),
    u_59_76 + v_59_76 <=s (const 64 (2**20)),
    u_59_76 - v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 + v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 - v_59_76 <=s (const 64 (2**20)),
    r_59_76 + s_59_76 <=s (const 64 (2**20)),
    r_59_76 - s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 + s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 - s_59_76 <=s (const 64 (2**20)),
    u_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_59_76 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_076_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_17,
sint64 neg_g_59_low60_0_low20_17,
sint64 neg_f_59_low60_0_low20_18,
sint64 neg_g_59_low60_0_low20_18,
sint64 u_59_76,
sint64 v_59_76,
sint64 r_59_76,
sint64 s_59_76,
sint64 u_59_77,
sint64 v_59_77,
sint64 r_59_77,
sint64 s_59_77,
bit ne
)={
    u_59_76 * neg_f_59_low60_0_low20_0 + v_59_76 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_17 * (-(2**20)),
    r_59_76 * neg_f_59_low60_0_low20_0 + s_59_76 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_17 * (-(2**20))
&&
    u_59_76 * neg_f_59_low60_0_low20_0 + v_59_76 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_17 * (const 64 (-(2**20))),
    r_59_76 * neg_f_59_low60_0_low20_0 + s_59_76 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_17 + u_59_76 * (const 64 (2**21)) + v_59_76 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_17 + r_59_76 * (const 64 (2**21)) + s_59_76 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_17,
    neg_f_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_17,
    neg_g_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 76)) <=s delta, delta <=s (const 64 (1 + 2*76)),
    (const 64 (-(2**20))) <=s u_59_76, u_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_76, v_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_76, r_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_76, s_59_76 <=s (const 64 ((2**20))),
    u_59_76 + v_59_76 <=s (const 64 (2**20)),
    u_59_76 - v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 + v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 - v_59_76 <=s (const 64 (2**20)),
    r_59_76 + s_59_76 <=s (const 64 (2**20)),
    r_59_76 - s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 + s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 - s_59_76 <=s (const 64 (2**20)),
    u_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_59_76 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step76

// premise a
assume
neg_g_59_low60_0_low20_17 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_18 neg_f_59_low60_0_low20_17;
mov u_59_77 u_59_76;
mov v_59_77 v_59_76;

asr neg_g_59_low60_0_low20_18 neg_g_59_low60_0_low20_17 1;
asr r_59_77 r_59_76 1;
asr s_59_77 s_59_76 1;
assert
    true
&&
    neg_f_59_low60_0_low20_18 = neg_f_59_low60_0_low20_17,
    u_59_77 = u_59_76,
    v_59_77 = v_59_76,
    neg_g_59_low60_0_low20_18 * (const 64 2) = neg_g_59_low60_0_low20_17,
    r_59_77 * (const 64 2) = r_59_76,
    s_59_77 * (const 64 2) = s_59_76
;

assume
    neg_f_59_low60_0_low20_18 = neg_f_59_low60_0_low20_17,
    u_59_77 = u_59_76,
    v_59_77 = v_59_76,
    neg_g_59_low60_0_low20_18 * 2 = neg_g_59_low60_0_low20_17,
    r_59_77 * 2 = r_59_76,
    s_59_77 * 2 = s_59_76
&&
    true
;

{
    u_59_77 * neg_f_59_low60_0_low20_0 + v_59_77 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_77 * neg_f_59_low60_0_low20_0 + s_59_77 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_18 + u_59_77 * (const 64 (2**21)) + v_59_77 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_18 + r_59_77 * (const 64 (2**21)) + s_59_77 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_18,
    neg_f_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_18,
    neg_g_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 77)) <=s delta, delta <=s (const 64 (1 + 2*77)),
    (const 64 (-(2**20))) <=s u_59_77, u_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_77, v_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_77, r_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_77, s_59_77 <=s (const 64 ((2**20))),
    u_59_77 + v_59_77 <=s (const 64 (2**20)),
    u_59_77 - v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 + v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 - v_59_77 <=s (const 64 (2**20)),
    r_59_77 + s_59_77 <=s (const 64 (2**20)),
    r_59_77 - s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 + s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 - s_59_77 <=s (const 64 (2**20)),
    u_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_59_77 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_076_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_17,
sint64 neg_g_59_low60_0_low20_17,
sint64 neg_f_59_low60_0_low20_18,
sint64 neg_g_59_low60_0_low20_18,
sint64 u_59_76,
sint64 v_59_76,
sint64 r_59_76,
sint64 s_59_76,
sint64 u_59_77,
sint64 v_59_77,
sint64 r_59_77,
sint64 s_59_77,
bit ne
)={
    u_59_76 * neg_f_59_low60_0_low20_0 + v_59_76 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_17 * (-(2**20)),
    r_59_76 * neg_f_59_low60_0_low20_0 + s_59_76 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_17 * (-(2**20))
&&
    u_59_76 * neg_f_59_low60_0_low20_0 + v_59_76 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_17 * (const 64 (-(2**20))),
    r_59_76 * neg_f_59_low60_0_low20_0 + s_59_76 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_17 + u_59_76 * (const 64 (2**21)) + v_59_76 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_17 + r_59_76 * (const 64 (2**21)) + s_59_76 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_17,
    neg_f_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_17,
    neg_g_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 76)) <=s delta, delta <=s (const 64 (1 + 2*76)),
    (const 64 (-(2**20))) <=s u_59_76, u_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_76, v_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_76, r_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_76, s_59_76 <=s (const 64 ((2**20))),
    u_59_76 + v_59_76 <=s (const 64 (2**20)),
    u_59_76 - v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 + v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 - v_59_76 <=s (const 64 (2**20)),
    r_59_76 + s_59_76 <=s (const 64 (2**20)),
    r_59_76 - s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 + s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 - s_59_76 <=s (const 64 (2**20)),
    u_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_59_76 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step76

// premise b
assume
neg_g_59_low60_0_low20_17 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_18 neg_f_59_low60_0_low20_17;
mov u_59_77 u_59_76;
mov v_59_77 v_59_76;

add neg_g_59_low60_0_low20_18 neg_g_59_low60_0_low20_17 neg_f_59_low60_0_low20_17;
asr neg_g_59_low60_0_low20_18 neg_g_59_low60_0_low20_18 1;
add r_59_77 r_59_76 u_59_76;
asr r_59_77 r_59_77 1;
add s_59_77 s_59_76 v_59_76;
asr s_59_77 s_59_77 1;
assert
    true
&&
    neg_f_59_low60_0_low20_18 = neg_f_59_low60_0_low20_17,
    u_59_77 = u_59_76,
    v_59_77 = v_59_76,
    neg_g_59_low60_0_low20_18 * (const 64 2) = neg_g_59_low60_0_low20_17 + neg_f_59_low60_0_low20_17,
    r_59_77 * (const 64 2) = r_59_76 + u_59_76,
    s_59_77 * (const 64 2) = s_59_76 + v_59_76
;

assume
    neg_f_59_low60_0_low20_18 = neg_f_59_low60_0_low20_17,
    u_59_77 = u_59_76,
    v_59_77 = v_59_76,
    neg_g_59_low60_0_low20_18 * 2 = neg_g_59_low60_0_low20_17 + neg_f_59_low60_0_low20_17,
    r_59_77 * 2 = r_59_76 + u_59_76,
    s_59_77 * 2 = s_59_76 + v_59_76
&&
    true
;

{
    u_59_77 * neg_f_59_low60_0_low20_0 + v_59_77 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_77 * neg_f_59_low60_0_low20_0 + s_59_77 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_18 + u_59_77 * (const 64 (2**21)) + v_59_77 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_18 + r_59_77 * (const 64 (2**21)) + s_59_77 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_18,
    neg_f_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_18,
    neg_g_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 77)) <=s delta, delta <=s (const 64 (1 + 2*77)),
    (const 64 (-(2**20))) <=s u_59_77, u_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_77, v_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_77, r_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_77, s_59_77 <=s (const 64 ((2**20))),
    u_59_77 + v_59_77 <=s (const 64 (2**20)),
    u_59_77 - v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 + v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 - v_59_77 <=s (const 64 (2**20)),
    r_59_77 + s_59_77 <=s (const 64 (2**20)),
    r_59_77 - s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 + s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 - s_59_77 <=s (const 64 (2**20)),
    u_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_59_77 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_076_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_17,
sint64 neg_g_59_low60_0_low20_17,
sint64 neg_f_59_low60_0_low20_18,
sint64 neg_g_59_low60_0_low20_18,
sint64 u_59_76,
sint64 v_59_76,
sint64 r_59_76,
sint64 s_59_76,
sint64 u_59_77,
sint64 v_59_77,
sint64 r_59_77,
sint64 s_59_77,
bit ne
)={
    u_59_76 * neg_f_59_low60_0_low20_0 + v_59_76 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_17 * (-(2**20)),
    r_59_76 * neg_f_59_low60_0_low20_0 + s_59_76 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_17 * (-(2**20))
&&
    u_59_76 * neg_f_59_low60_0_low20_0 + v_59_76 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_17 * (const 64 (-(2**20))),
    r_59_76 * neg_f_59_low60_0_low20_0 + s_59_76 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_17 + u_59_76 * (const 64 (2**21)) + v_59_76 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_17 + r_59_76 * (const 64 (2**21)) + s_59_76 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_17,
    neg_f_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_17,
    neg_g_59_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 76)) <=s delta, delta <=s (const 64 (1 + 2*76)),
    (const 64 (-(2**20))) <=s u_59_76, u_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_76, v_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_76, r_59_76 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_76, s_59_76 <=s (const 64 ((2**20))),
    u_59_76 + v_59_76 <=s (const 64 (2**20)),
    u_59_76 - v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 + v_59_76 <=s (const 64 (2**20)),
    (const 64 0) - u_59_76 - v_59_76 <=s (const 64 (2**20)),
    r_59_76 + s_59_76 <=s (const 64 (2**20)),
    r_59_76 - s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 + s_59_76 <=s (const 64 (2**20)),
    (const 64 0) - r_59_76 - s_59_76 <=s (const 64 (2**20)),
    u_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_59_76 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_59_76 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step76

// premise c
assume
neg_g_59_low60_0_low20_17 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_18 neg_g_59_low60_0_low20_17;
mov u_59_77 r_59_76;
mov v_59_77 s_59_76;

subs dc neg_g_59_low60_0_low20_18 neg_g_59_low60_0_low20_17 neg_f_59_low60_0_low20_17;
asr neg_g_59_low60_0_low20_18 neg_g_59_low60_0_low20_18 1;
subs dc r_59_77 r_59_76 u_59_76;
asr r_59_77 r_59_77 1;
subs dc s_59_77 s_59_76 v_59_76;
asr s_59_77 s_59_77 1;
assert
    true
&&
    neg_f_59_low60_0_low20_18 = neg_g_59_low60_0_low20_17,
    u_59_77 = r_59_76,
    v_59_77 = s_59_76,
    neg_g_59_low60_0_low20_18 * (const 64 2) = neg_g_59_low60_0_low20_17 - neg_f_59_low60_0_low20_17,
    r_59_77 * (const 64 2) = r_59_76 - u_59_76,
    s_59_77 * (const 64 2) = s_59_76 - v_59_76
;

assume
    neg_f_59_low60_0_low20_18 = neg_g_59_low60_0_low20_17,
    u_59_77 = r_59_76,
    v_59_77 = s_59_76,
    neg_g_59_low60_0_low20_18 * 2 = neg_g_59_low60_0_low20_17 - neg_f_59_low60_0_low20_17,
    r_59_77 * 2 = r_59_76 - u_59_76,
    s_59_77 * 2 = s_59_76 - v_59_76
&&
    true
;

{
    u_59_77 * neg_f_59_low60_0_low20_0 + v_59_77 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_77 * neg_f_59_low60_0_low20_0 + s_59_77 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_18 + u_59_77 * (const 64 (2**21)) + v_59_77 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_18 + r_59_77 * (const 64 (2**21)) + s_59_77 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_18,
    neg_f_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_18,
    neg_g_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 77)) <=s delta, delta <=s (const 64 (1 + 2*77)),
    (const 64 (-(2**20))) <=s u_59_77, u_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_77, v_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_77, r_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_77, s_59_77 <=s (const 64 ((2**20))),
    u_59_77 + v_59_77 <=s (const 64 (2**20)),
    u_59_77 - v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 + v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 - v_59_77 <=s (const 64 (2**20)),
    r_59_77 + s_59_77 <=s (const 64 (2**20)),
    r_59_77 - s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 + s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 - s_59_77 <=s (const 64 (2**20)),
    u_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_59_77 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_077_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_18,
sint64 neg_g_59_low60_0_low20_18,
sint64 neg_f_59_low60_0_low20_19,
sint64 neg_g_59_low60_0_low20_19,
sint64 u_59_77,
sint64 v_59_77,
sint64 r_59_77,
sint64 s_59_77,
sint64 u_59_78,
sint64 v_59_78,
sint64 r_59_78,
sint64 s_59_78,
bit ne
)={
    u_59_77 * neg_f_59_low60_0_low20_0 + v_59_77 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_18 * (-(2**20)),
    r_59_77 * neg_f_59_low60_0_low20_0 + s_59_77 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_18 * (-(2**20))
&&
    u_59_77 * neg_f_59_low60_0_low20_0 + v_59_77 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_18 * (const 64 (-(2**20))),
    r_59_77 * neg_f_59_low60_0_low20_0 + s_59_77 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_18 + u_59_77 * (const 64 (2**21)) + v_59_77 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_18 + r_59_77 * (const 64 (2**21)) + s_59_77 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_18,
    neg_f_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_18,
    neg_g_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 77)) <=s delta, delta <=s (const 64 (1 + 2*77)),
    (const 64 (-(2**20))) <=s u_59_77, u_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_77, v_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_77, r_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_77, s_59_77 <=s (const 64 ((2**20))),
    u_59_77 + v_59_77 <=s (const 64 (2**20)),
    u_59_77 - v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 + v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 - v_59_77 <=s (const 64 (2**20)),
    r_59_77 + s_59_77 <=s (const 64 (2**20)),
    r_59_77 - s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 + s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 - s_59_77 <=s (const 64 (2**20)),
    u_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_59_77 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step77

// premise a
assume
neg_g_59_low60_0_low20_18 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_0_low20_19 neg_f_59_low60_0_low20_18;
mov u_59_78 u_59_77;
mov v_59_78 v_59_77;

asr neg_g_59_low60_0_low20_19 neg_g_59_low60_0_low20_18 1;
asr r_59_78 r_59_77 1;
asr s_59_78 s_59_77 1;
assert
    true
&&
    neg_f_59_low60_0_low20_19 = neg_f_59_low60_0_low20_18,
    u_59_78 = u_59_77,
    v_59_78 = v_59_77,
    neg_g_59_low60_0_low20_19 * (const 64 2) = neg_g_59_low60_0_low20_18,
    r_59_78 * (const 64 2) = r_59_77,
    s_59_78 * (const 64 2) = s_59_77
;

assume
    neg_f_59_low60_0_low20_19 = neg_f_59_low60_0_low20_18,
    u_59_78 = u_59_77,
    v_59_78 = v_59_77,
    neg_g_59_low60_0_low20_19 * 2 = neg_g_59_low60_0_low20_18,
    r_59_78 * 2 = r_59_77,
    s_59_78 * 2 = s_59_77
&&
    true
;

{
    u_59_78 * neg_f_59_low60_0_low20_0 + v_59_78 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_78 * neg_f_59_low60_0_low20_0 + s_59_78 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_19 + u_59_78 * (const 64 (2**21)) + v_59_78 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_19 + r_59_78 * (const 64 (2**21)) + s_59_78 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_19,
    neg_f_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_19,
    neg_g_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 78)) <=s delta, delta <=s (const 64 (1 + 2*78)),
    (const 64 (-(2**20))) <=s u_59_78, u_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_78, v_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_78, r_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_78, s_59_78 <=s (const 64 ((2**20))),
    u_59_78 + v_59_78 <=s (const 64 (2**20)),
    u_59_78 - v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 + v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 - v_59_78 <=s (const 64 (2**20)),
    r_59_78 + s_59_78 <=s (const 64 (2**20)),
    r_59_78 - s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 + s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 - s_59_78 <=s (const 64 (2**20)),
    u_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_59_78 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_077_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_18,
sint64 neg_g_59_low60_0_low20_18,
sint64 neg_f_59_low60_0_low20_19,
sint64 neg_g_59_low60_0_low20_19,
sint64 u_59_77,
sint64 v_59_77,
sint64 r_59_77,
sint64 s_59_77,
sint64 u_59_78,
sint64 v_59_78,
sint64 r_59_78,
sint64 s_59_78,
bit ne
)={
    u_59_77 * neg_f_59_low60_0_low20_0 + v_59_77 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_18 * (-(2**20)),
    r_59_77 * neg_f_59_low60_0_low20_0 + s_59_77 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_18 * (-(2**20))
&&
    u_59_77 * neg_f_59_low60_0_low20_0 + v_59_77 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_18 * (const 64 (-(2**20))),
    r_59_77 * neg_f_59_low60_0_low20_0 + s_59_77 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_18 + u_59_77 * (const 64 (2**21)) + v_59_77 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_18 + r_59_77 * (const 64 (2**21)) + s_59_77 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_18,
    neg_f_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_18,
    neg_g_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 77)) <=s delta, delta <=s (const 64 (1 + 2*77)),
    (const 64 (-(2**20))) <=s u_59_77, u_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_77, v_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_77, r_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_77, s_59_77 <=s (const 64 ((2**20))),
    u_59_77 + v_59_77 <=s (const 64 (2**20)),
    u_59_77 - v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 + v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 - v_59_77 <=s (const 64 (2**20)),
    r_59_77 + s_59_77 <=s (const 64 (2**20)),
    r_59_77 - s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 + s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 - s_59_77 <=s (const 64 (2**20)),
    u_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_59_77 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step77

// premise b
assume
neg_g_59_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_19 neg_f_59_low60_0_low20_18;
mov u_59_78 u_59_77;
mov v_59_78 v_59_77;

add neg_g_59_low60_0_low20_19 neg_g_59_low60_0_low20_18 neg_f_59_low60_0_low20_18;
asr neg_g_59_low60_0_low20_19 neg_g_59_low60_0_low20_19 1;
add r_59_78 r_59_77 u_59_77;
asr r_59_78 r_59_78 1;
add s_59_78 s_59_77 v_59_77;
asr s_59_78 s_59_78 1;
assert
    true
&&
    neg_f_59_low60_0_low20_19 = neg_f_59_low60_0_low20_18,
    u_59_78 = u_59_77,
    v_59_78 = v_59_77,
    neg_g_59_low60_0_low20_19 * (const 64 2) = neg_g_59_low60_0_low20_18 + neg_f_59_low60_0_low20_18,
    r_59_78 * (const 64 2) = r_59_77 + u_59_77,
    s_59_78 * (const 64 2) = s_59_77 + v_59_77
;

assume
    neg_f_59_low60_0_low20_19 = neg_f_59_low60_0_low20_18,
    u_59_78 = u_59_77,
    v_59_78 = v_59_77,
    neg_g_59_low60_0_low20_19 * 2 = neg_g_59_low60_0_low20_18 + neg_f_59_low60_0_low20_18,
    r_59_78 * 2 = r_59_77 + u_59_77,
    s_59_78 * 2 = s_59_77 + v_59_77
&&
    true
;

{
    u_59_78 * neg_f_59_low60_0_low20_0 + v_59_78 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_78 * neg_f_59_low60_0_low20_0 + s_59_78 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_19 + u_59_78 * (const 64 (2**21)) + v_59_78 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_19 + r_59_78 * (const 64 (2**21)) + s_59_78 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_19,
    neg_f_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_19,
    neg_g_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 78)) <=s delta, delta <=s (const 64 (1 + 2*78)),
    (const 64 (-(2**20))) <=s u_59_78, u_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_78, v_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_78, r_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_78, s_59_78 <=s (const 64 ((2**20))),
    u_59_78 + v_59_78 <=s (const 64 (2**20)),
    u_59_78 - v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 + v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 - v_59_78 <=s (const 64 (2**20)),
    r_59_78 + s_59_78 <=s (const 64 (2**20)),
    r_59_78 - s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 + s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 - s_59_78 <=s (const 64 (2**20)),
    u_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_59_78 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_077_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_18,
sint64 neg_g_59_low60_0_low20_18,
sint64 neg_f_59_low60_0_low20_19,
sint64 neg_g_59_low60_0_low20_19,
sint64 u_59_77,
sint64 v_59_77,
sint64 r_59_77,
sint64 s_59_77,
sint64 u_59_78,
sint64 v_59_78,
sint64 r_59_78,
sint64 s_59_78,
bit ne
)={
    u_59_77 * neg_f_59_low60_0_low20_0 + v_59_77 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_18 * (-(2**20)),
    r_59_77 * neg_f_59_low60_0_low20_0 + s_59_77 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_18 * (-(2**20))
&&
    u_59_77 * neg_f_59_low60_0_low20_0 + v_59_77 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_18 * (const 64 (-(2**20))),
    r_59_77 * neg_f_59_low60_0_low20_0 + s_59_77 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_18 + u_59_77 * (const 64 (2**21)) + v_59_77 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_18 + r_59_77 * (const 64 (2**21)) + s_59_77 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_18,
    neg_f_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_18,
    neg_g_59_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 77)) <=s delta, delta <=s (const 64 (1 + 2*77)),
    (const 64 (-(2**20))) <=s u_59_77, u_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_77, v_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_77, r_59_77 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_77, s_59_77 <=s (const 64 ((2**20))),
    u_59_77 + v_59_77 <=s (const 64 (2**20)),
    u_59_77 - v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 + v_59_77 <=s (const 64 (2**20)),
    (const 64 0) - u_59_77 - v_59_77 <=s (const 64 (2**20)),
    r_59_77 + s_59_77 <=s (const 64 (2**20)),
    r_59_77 - s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 + s_59_77 <=s (const 64 (2**20)),
    (const 64 0) - r_59_77 - s_59_77 <=s (const 64 (2**20)),
    u_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_59_77 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_59_77 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step77

// premise c
assume
neg_g_59_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_19 neg_g_59_low60_0_low20_18;
mov u_59_78 r_59_77;
mov v_59_78 s_59_77;

subs dc neg_g_59_low60_0_low20_19 neg_g_59_low60_0_low20_18 neg_f_59_low60_0_low20_18;
asr neg_g_59_low60_0_low20_19 neg_g_59_low60_0_low20_19 1;
subs dc r_59_78 r_59_77 u_59_77;
asr r_59_78 r_59_78 1;
subs dc s_59_78 s_59_77 v_59_77;
asr s_59_78 s_59_78 1;
assert
    true
&&
    neg_f_59_low60_0_low20_19 = neg_g_59_low60_0_low20_18,
    u_59_78 = r_59_77,
    v_59_78 = s_59_77,
    neg_g_59_low60_0_low20_19 * (const 64 2) = neg_g_59_low60_0_low20_18 - neg_f_59_low60_0_low20_18,
    r_59_78 * (const 64 2) = r_59_77 - u_59_77,
    s_59_78 * (const 64 2) = s_59_77 - v_59_77
;

assume
    neg_f_59_low60_0_low20_19 = neg_g_59_low60_0_low20_18,
    u_59_78 = r_59_77,
    v_59_78 = s_59_77,
    neg_g_59_low60_0_low20_19 * 2 = neg_g_59_low60_0_low20_18 - neg_f_59_low60_0_low20_18,
    r_59_78 * 2 = r_59_77 - u_59_77,
    s_59_78 * 2 = s_59_77 - v_59_77
&&
    true
;

{
    u_59_78 * neg_f_59_low60_0_low20_0 + v_59_78 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_78 * neg_f_59_low60_0_low20_0 + s_59_78 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_19 + u_59_78 * (const 64 (2**21)) + v_59_78 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_19 + r_59_78 * (const 64 (2**21)) + s_59_78 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_19,
    neg_f_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_19,
    neg_g_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 78)) <=s delta, delta <=s (const 64 (1 + 2*78)),
    (const 64 (-(2**20))) <=s u_59_78, u_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_78, v_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_78, r_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_78, s_59_78 <=s (const 64 ((2**20))),
    u_59_78 + v_59_78 <=s (const 64 (2**20)),
    u_59_78 - v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 + v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 - v_59_78 <=s (const 64 (2**20)),
    r_59_78 + s_59_78 <=s (const 64 (2**20)),
    r_59_78 - s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 + s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 - s_59_78 <=s (const 64 (2**20)),
    u_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_59_78 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_078_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_19,
sint64 neg_g_59_low60_0_low20_19,
sint64 neg_f_59_low60_0_low20_20,
sint64 neg_g_59_low60_0_low20_20,
sint64 u_59_78,
sint64 v_59_78,
sint64 r_59_78,
sint64 s_59_78,
sint64 u_59_79,
sint64 v_59_79,
sint64 r_59_79,
sint64 s_59_79,
bit ne
)={
    u_59_78 * neg_f_59_low60_0_low20_0 + v_59_78 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_19 * (-(2**20)),
    r_59_78 * neg_f_59_low60_0_low20_0 + s_59_78 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_19 * (-(2**20))
&&
    u_59_78 * neg_f_59_low60_0_low20_0 + v_59_78 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_19 * (const 64 (-(2**20))),
    r_59_78 * neg_f_59_low60_0_low20_0 + s_59_78 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_19 + u_59_78 * (const 64 (2**21)) + v_59_78 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_19 + r_59_78 * (const 64 (2**21)) + s_59_78 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_19,
    neg_f_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_19,
    neg_g_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 78)) <=s delta, delta <=s (const 64 (1 + 2*78)),
    (const 64 (-(2**20))) <=s u_59_78, u_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_78, v_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_78, r_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_78, s_59_78 <=s (const 64 ((2**20))),
    u_59_78 + v_59_78 <=s (const 64 (2**20)),
    u_59_78 - v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 + v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 - v_59_78 <=s (const 64 (2**20)),
    r_59_78 + s_59_78 <=s (const 64 (2**20)),
    r_59_78 - s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 + s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 - s_59_78 <=s (const 64 (2**20)),
    u_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_59_78 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step78

// premise a
assume
neg_g_59_low60_0_low20_19 = 0 (mod 2)
&&
neg_g_59_low60_0_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov neg_f_59_low60_0_low20_20 neg_f_59_low60_0_low20_19;
mov u_59_79 u_59_78;
mov v_59_79 v_59_78;

asr neg_g_59_low60_0_low20_20 neg_g_59_low60_0_low20_19 1;
asr r_59_79 r_59_78 1;
asr s_59_79 s_59_78 1;
assert
    true
&&
    neg_f_59_low60_0_low20_20 = neg_f_59_low60_0_low20_19,
    u_59_79 = u_59_78,
    v_59_79 = v_59_78,
    neg_g_59_low60_0_low20_20 * (const 64 2) = neg_g_59_low60_0_low20_19,
    r_59_79 * (const 64 2) = r_59_78,
    s_59_79 * (const 64 2) = s_59_78
;

assume
    neg_f_59_low60_0_low20_20 = neg_f_59_low60_0_low20_19,
    u_59_79 = u_59_78,
    v_59_79 = v_59_78,
    neg_g_59_low60_0_low20_20 * 2 = neg_g_59_low60_0_low20_19,
    r_59_79 * 2 = r_59_78,
    s_59_79 * 2 = s_59_78
&&
    true
;

{
    u_59_79 * neg_f_59_low60_0_low20_0 + v_59_79 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_79 * neg_f_59_low60_0_low20_0 + s_59_79 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_20 + u_59_79 * (const 64 (2**21)) + v_59_79 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_20 + r_59_79 * (const 64 (2**21)) + s_59_79 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_20,
    neg_f_59_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_20,
    neg_g_59_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 79)) <=s delta, delta <=s (const 64 (1 + 2*79)),
    (const 64 (-(2**20))) <=s u_59_79, u_59_79 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_79, v_59_79 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_79, r_59_79 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_79, s_59_79 <=s (const 64 ((2**20))),
    u_59_79 + v_59_79 <=s (const 64 (2**20)),
    u_59_79 - v_59_79 <=s (const 64 (2**20)),
    (const 64 0) - u_59_79 + v_59_79 <=s (const 64 (2**20)),
    (const 64 0) - u_59_79 - v_59_79 <=s (const 64 (2**20)),
    r_59_79 + s_59_79 <=s (const 64 (2**20)),
    r_59_79 - s_59_79 <=s (const 64 (2**20)),
    (const 64 0) - r_59_79 + s_59_79 <=s (const 64 (2**20)),
    (const 64 0) - r_59_79 - s_59_79 <=s (const 64 (2**20)),
    u_59_79 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_59_79 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_59_79 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_59_79 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_078_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_19,
sint64 neg_g_59_low60_0_low20_19,
sint64 neg_f_59_low60_0_low20_20,
sint64 neg_g_59_low60_0_low20_20,
sint64 u_59_78,
sint64 v_59_78,
sint64 r_59_78,
sint64 s_59_78,
sint64 u_59_79,
sint64 v_59_79,
sint64 r_59_79,
sint64 s_59_79,
bit ne
)={
    u_59_78 * neg_f_59_low60_0_low20_0 + v_59_78 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_19 * (-(2**20)),
    r_59_78 * neg_f_59_low60_0_low20_0 + s_59_78 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_19 * (-(2**20))
&&
    u_59_78 * neg_f_59_low60_0_low20_0 + v_59_78 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_19 * (const 64 (-(2**20))),
    r_59_78 * neg_f_59_low60_0_low20_0 + s_59_78 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_19 + u_59_78 * (const 64 (2**21)) + v_59_78 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_19 + r_59_78 * (const 64 (2**21)) + s_59_78 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_19,
    neg_f_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_19,
    neg_g_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 78)) <=s delta, delta <=s (const 64 (1 + 2*78)),
    (const 64 (-(2**20))) <=s u_59_78, u_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_78, v_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_78, r_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_78, s_59_78 <=s (const 64 ((2**20))),
    u_59_78 + v_59_78 <=s (const 64 (2**20)),
    u_59_78 - v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 + v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 - v_59_78 <=s (const 64 (2**20)),
    r_59_78 + s_59_78 <=s (const 64 (2**20)),
    r_59_78 - s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 + s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 - s_59_78 <=s (const 64 (2**20)),
    u_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_59_78 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step78

// premise b
assume
neg_g_59_low60_0_low20_19 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_20 neg_f_59_low60_0_low20_19;
mov u_59_79 u_59_78;
mov v_59_79 v_59_78;

add neg_g_59_low60_0_low20_20 neg_g_59_low60_0_low20_19 neg_f_59_low60_0_low20_19;
asr neg_g_59_low60_0_low20_20 neg_g_59_low60_0_low20_20 1;
add r_59_79 r_59_78 u_59_78;
asr r_59_79 r_59_79 1;
add s_59_79 s_59_78 v_59_78;
asr s_59_79 s_59_79 1;
assert
    true
&&
    neg_f_59_low60_0_low20_20 = neg_f_59_low60_0_low20_19,
    u_59_79 = u_59_78,
    v_59_79 = v_59_78,
    neg_g_59_low60_0_low20_20 * (const 64 2) = neg_g_59_low60_0_low20_19 + neg_f_59_low60_0_low20_19,
    r_59_79 * (const 64 2) = r_59_78 + u_59_78,
    s_59_79 * (const 64 2) = s_59_78 + v_59_78
;

assume
    neg_f_59_low60_0_low20_20 = neg_f_59_low60_0_low20_19,
    u_59_79 = u_59_78,
    v_59_79 = v_59_78,
    neg_g_59_low60_0_low20_20 * 2 = neg_g_59_low60_0_low20_19 + neg_f_59_low60_0_low20_19,
    r_59_79 * 2 = r_59_78 + u_59_78,
    s_59_79 * 2 = s_59_78 + v_59_78
&&
    true
;

{
    u_59_79 * neg_f_59_low60_0_low20_0 + v_59_79 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_79 * neg_f_59_low60_0_low20_0 + s_59_79 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_20 + u_59_79 * (const 64 (2**21)) + v_59_79 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_20 + r_59_79 * (const 64 (2**21)) + s_59_79 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_20,
    neg_f_59_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_20,
    neg_g_59_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 79)) <=s delta, delta <=s (const 64 (1 + 2*79)),
    (const 64 (-(2**20))) <=s u_59_79, u_59_79 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_79, v_59_79 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_79, r_59_79 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_79, s_59_79 <=s (const 64 ((2**20))),
    u_59_79 + v_59_79 <=s (const 64 (2**20)),
    u_59_79 - v_59_79 <=s (const 64 (2**20)),
    (const 64 0) - u_59_79 + v_59_79 <=s (const 64 (2**20)),
    (const 64 0) - u_59_79 - v_59_79 <=s (const 64 (2**20)),
    r_59_79 + s_59_79 <=s (const 64 (2**20)),
    r_59_79 - s_59_79 <=s (const 64 (2**20)),
    (const 64 0) - r_59_79 + s_59_79 <=s (const 64 (2**20)),
    (const 64 0) - r_59_79 - s_59_79 <=s (const 64 (2**20)),
    u_59_79 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_59_79 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_59_79 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_59_79 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_078_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_0_low20_0,
sint64 neg_g_59_low60_0_low20_0,
sint64 neg_f_59_low60_0_low20_19,
sint64 neg_g_59_low60_0_low20_19,
sint64 neg_f_59_low60_0_low20_20,
sint64 neg_g_59_low60_0_low20_20,
sint64 u_59_78,
sint64 v_59_78,
sint64 r_59_78,
sint64 s_59_78,
sint64 u_59_79,
sint64 v_59_79,
sint64 r_59_79,
sint64 s_59_79,
bit ne
)={
    u_59_78 * neg_f_59_low60_0_low20_0 + v_59_78 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_19 * (-(2**20)),
    r_59_78 * neg_f_59_low60_0_low20_0 + s_59_78 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_19 * (-(2**20))
&&
    u_59_78 * neg_f_59_low60_0_low20_0 + v_59_78 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_19 * (const 64 (-(2**20))),
    r_59_78 * neg_f_59_low60_0_low20_0 + s_59_78 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_0_low20_19 + u_59_78 * (const 64 (2**21)) + v_59_78 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_19 + r_59_78 * (const 64 (2**21)) + s_59_78 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_0_low20_0,
    neg_f_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_0,
    neg_g_59_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_0_low20_19,
    neg_f_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_0_low20_19,
    neg_g_59_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 78)) <=s delta, delta <=s (const 64 (1 + 2*78)),
    (const 64 (-(2**20))) <=s u_59_78, u_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_78, v_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_78, r_59_78 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_78, s_59_78 <=s (const 64 ((2**20))),
    u_59_78 + v_59_78 <=s (const 64 (2**20)),
    u_59_78 - v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 + v_59_78 <=s (const 64 (2**20)),
    (const 64 0) - u_59_78 - v_59_78 <=s (const 64 (2**20)),
    r_59_78 + s_59_78 <=s (const 64 (2**20)),
    r_59_78 - s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 + s_59_78 <=s (const 64 (2**20)),
    (const 64 0) - r_59_78 - s_59_78 <=s (const 64 (2**20)),
    u_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_59_78 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_59_78 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step78

// premise c
assume
neg_g_59_low60_0_low20_19 = 1 (mod 2)
&&
neg_g_59_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_0_low20_20 neg_g_59_low60_0_low20_19;
mov u_59_79 r_59_78;
mov v_59_79 s_59_78;

subs dc neg_g_59_low60_0_low20_20 neg_g_59_low60_0_low20_19 neg_f_59_low60_0_low20_19;
asr neg_g_59_low60_0_low20_20 neg_g_59_low60_0_low20_20 1;
subs dc r_59_79 r_59_78 u_59_78;
asr r_59_79 r_59_79 1;
subs dc s_59_79 s_59_78 v_59_78;
asr s_59_79 s_59_79 1;
assert
    true
&&
    neg_f_59_low60_0_low20_20 = neg_g_59_low60_0_low20_19,
    u_59_79 = r_59_78,
    v_59_79 = s_59_78,
    neg_g_59_low60_0_low20_20 * (const 64 2) = neg_g_59_low60_0_low20_19 - neg_f_59_low60_0_low20_19,
    r_59_79 * (const 64 2) = r_59_78 - u_59_78,
    s_59_79 * (const 64 2) = s_59_78 - v_59_78
;

assume
    neg_f_59_low60_0_low20_20 = neg_g_59_low60_0_low20_19,
    u_59_79 = r_59_78,
    v_59_79 = s_59_78,
    neg_g_59_low60_0_low20_20 * 2 = neg_g_59_low60_0_low20_19 - neg_f_59_low60_0_low20_19,
    r_59_79 * 2 = r_59_78 - u_59_78,
    s_59_79 * 2 = s_59_78 - v_59_78
&&
    true
;

{
    u_59_79 * neg_f_59_low60_0_low20_0 + v_59_79 * neg_g_59_low60_0_low20_0 = neg_f_59_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_59_79 * neg_f_59_low60_0_low20_0 + s_59_79 * neg_g_59_low60_0_low20_0 = neg_g_59_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_0_low20_20 + u_59_79 * (const 64 (2**21)) + v_59_79 * (const 64 (2**42)),
    grs = neg_g_59_low60_0_low20_20 + r_59_79 * (const 64 (2**21)) + s_59_79 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_0_low20_20,
    neg_f_59_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_0_low20_20,
    neg_g_59_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 79)) <=s delta, delta <=s (const 64 (1 + 2*79)),
    (const 64 (-(2**20))) <=s u_59_79, u_59_79 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_59_79, v_59_79 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_59_79, r_59_79 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_59_79, s_59_79 <=s (const 64 ((2**20))),
    u_59_79 + v_59_79 <=s (const 64 (2**20)),
    u_59_79 - v_59_79 <=s (const 64 (2**20)),
    (const 64 0) - u_59_79 + v_59_79 <=s (const 64 (2**20)),
    (const 64 0) - u_59_79 - v_59_79 <=s (const 64 (2**20)),
    r_59_79 + s_59_79 <=s (const 64 (2**20)),
    r_59_79 - s_59_79 <=s (const 64 (2**20)),
    (const 64 0) - r_59_79 + s_59_79 <=s (const 64 (2**20)),
    (const 64 0) - r_59_79 - s_59_79 <=s (const 64 (2**20)),
    u_59_79 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_59_79 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_59_79 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_59_79 = (const 64 0) (mod (const 64 (2**(20-20))))
}

