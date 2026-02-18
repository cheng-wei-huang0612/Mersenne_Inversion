proc divstep_099_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_1,
sint64 neg_g_59_low60_40_low20_1,
sint64 u_99_99,
sint64 v_99_99,
sint64 r_99_99,
sint64 s_99_99,
sint64 u_99_100,
sint64 v_99_100,
sint64 r_99_100,
sint64 s_99_100,
bit ne
)={
    u_99_99 * neg_f_59_low60_40_low20_0 + v_99_99 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_0 * (-(2**20)),
    r_99_99 * neg_f_59_low60_40_low20_0 + s_99_99 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_0 * (-(2**20))
&&
    u_99_99 * neg_f_59_low60_40_low20_0 + v_99_99 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_0 * (const 64 (-(2**20))),
    r_99_99 * neg_f_59_low60_40_low20_0 + s_99_99 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_0 + u_99_99 * (const 64 (2**21)) + v_99_99 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_0 + r_99_99 * (const 64 (2**21)) + s_99_99 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 99)) <=s delta, delta <=s (const 64 (1 + 2*99)),
    u_99_99 = (const 64 (-(2**20))),
    v_99_99 = (const 64 (0)),
    r_99_99 = (const 64 (0)),
    s_99_99 = (const 64 (-(2**20)))
}



// divsteps
// step99

// premise a
assume
neg_g_59_low60_40_low20_0 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_59_low60_40_low20_1 neg_f_59_low60_40_low20_0;
mov u_99_100 u_99_99;
mov v_99_100 v_99_99;

asr neg_g_59_low60_40_low20_1 neg_g_59_low60_40_low20_0 1;
asr r_99_100 r_99_99 1;
asr s_99_100 s_99_99 1;
assert
    true
&&
    neg_f_59_low60_40_low20_1 = neg_f_59_low60_40_low20_0,
    u_99_100 = u_99_99,
    v_99_100 = v_99_99,
    neg_g_59_low60_40_low20_1 * (const 64 2) = neg_g_59_low60_40_low20_0,
    r_99_100 * (const 64 2) = r_99_99,
    s_99_100 * (const 64 2) = s_99_99
;

assume
    neg_f_59_low60_40_low20_1 = neg_f_59_low60_40_low20_0,
    u_99_100 = u_99_99,
    v_99_100 = v_99_99,
    neg_g_59_low60_40_low20_1 * 2 = neg_g_59_low60_40_low20_0,
    r_99_100 * 2 = r_99_99,
    s_99_100 * 2 = s_99_99
&&
    true
;

{
    u_99_100 * neg_f_59_low60_40_low20_0 + v_99_100 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_100 * neg_f_59_low60_40_low20_0 + s_99_100 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_1 + u_99_100 * (const 64 (2**21)) + v_99_100 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_1 + r_99_100 * (const 64 (2**21)) + s_99_100 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_1,
    neg_f_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_1,
    neg_g_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 100)) <=s delta, delta <=s (const 64 (1 + 2*100)),
    (const 64 (-(2**20))) <=s u_99_100, u_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_100, v_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_100, r_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_100, s_99_100 <=s (const 64 ((2**20)-1)),
    u_99_100 + v_99_100 <=s (const 64 (2**20)),
    u_99_100 - v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 + v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 - v_99_100 <=s (const 64 (2**20)),
    r_99_100 + s_99_100 <=s (const 64 (2**20)),
    r_99_100 - s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 + s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 - s_99_100 <=s (const 64 (2**20)),
    u_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_99_100 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_099_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_1,
sint64 neg_g_59_low60_40_low20_1,
sint64 u_99_99,
sint64 v_99_99,
sint64 r_99_99,
sint64 s_99_99,
sint64 u_99_100,
sint64 v_99_100,
sint64 r_99_100,
sint64 s_99_100,
bit ne
)={
    u_99_99 * neg_f_59_low60_40_low20_0 + v_99_99 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_0 * (-(2**20)),
    r_99_99 * neg_f_59_low60_40_low20_0 + s_99_99 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_0 * (-(2**20))
&&
    u_99_99 * neg_f_59_low60_40_low20_0 + v_99_99 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_0 * (const 64 (-(2**20))),
    r_99_99 * neg_f_59_low60_40_low20_0 + s_99_99 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_0 + u_99_99 * (const 64 (2**21)) + v_99_99 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_0 + r_99_99 * (const 64 (2**21)) + s_99_99 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 99)) <=s delta, delta <=s (const 64 (1 + 2*99)),
    u_99_99 = (const 64 (-(2**20))),
    v_99_99 = (const 64 (0)),
    r_99_99 = (const 64 (0)),
    s_99_99 = (const 64 (-(2**20)))
}



// divsteps
// step99

// premise b
assume
neg_g_59_low60_40_low20_0 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_1 neg_f_59_low60_40_low20_0;
mov u_99_100 u_99_99;
mov v_99_100 v_99_99;

add neg_g_59_low60_40_low20_1 neg_g_59_low60_40_low20_0 neg_f_59_low60_40_low20_0;
asr neg_g_59_low60_40_low20_1 neg_g_59_low60_40_low20_1 1;
add r_99_100 r_99_99 u_99_99;
asr r_99_100 r_99_100 1;
add s_99_100 s_99_99 v_99_99;
asr s_99_100 s_99_100 1;
assert
    true
&&
    neg_f_59_low60_40_low20_1 = neg_f_59_low60_40_low20_0,
    u_99_100 = u_99_99,
    v_99_100 = v_99_99,
    neg_g_59_low60_40_low20_1 * (const 64 2) = neg_g_59_low60_40_low20_0 + neg_f_59_low60_40_low20_0,
    r_99_100 * (const 64 2) = r_99_99 + u_99_99,
    s_99_100 * (const 64 2) = s_99_99 + v_99_99
;

assume
    neg_f_59_low60_40_low20_1 = neg_f_59_low60_40_low20_0,
    u_99_100 = u_99_99,
    v_99_100 = v_99_99,
    neg_g_59_low60_40_low20_1 * 2 = neg_g_59_low60_40_low20_0 + neg_f_59_low60_40_low20_0,
    r_99_100 * 2 = r_99_99 + u_99_99,
    s_99_100 * 2 = s_99_99 + v_99_99
&&
    true
;

{
    u_99_100 * neg_f_59_low60_40_low20_0 + v_99_100 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_100 * neg_f_59_low60_40_low20_0 + s_99_100 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_1 + u_99_100 * (const 64 (2**21)) + v_99_100 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_1 + r_99_100 * (const 64 (2**21)) + s_99_100 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_1,
    neg_f_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_1,
    neg_g_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 100)) <=s delta, delta <=s (const 64 (1 + 2*100)),
    (const 64 (-(2**20))) <=s u_99_100, u_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_100, v_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_100, r_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_100, s_99_100 <=s (const 64 ((2**20)-1)),
    u_99_100 + v_99_100 <=s (const 64 (2**20)),
    u_99_100 - v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 + v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 - v_99_100 <=s (const 64 (2**20)),
    r_99_100 + s_99_100 <=s (const 64 (2**20)),
    r_99_100 - s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 + s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 - s_99_100 <=s (const 64 (2**20)),
    u_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_99_100 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_099_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_1,
sint64 neg_g_59_low60_40_low20_1,
sint64 u_99_99,
sint64 v_99_99,
sint64 r_99_99,
sint64 s_99_99,
sint64 u_99_100,
sint64 v_99_100,
sint64 r_99_100,
sint64 s_99_100,
bit ne
)={
    u_99_99 * neg_f_59_low60_40_low20_0 + v_99_99 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_0 * (-(2**20)),
    r_99_99 * neg_f_59_low60_40_low20_0 + s_99_99 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_0 * (-(2**20))
&&
    u_99_99 * neg_f_59_low60_40_low20_0 + v_99_99 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_0 * (const 64 (-(2**20))),
    r_99_99 * neg_f_59_low60_40_low20_0 + s_99_99 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_0 + u_99_99 * (const 64 (2**21)) + v_99_99 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_0 + r_99_99 * (const 64 (2**21)) + s_99_99 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 99)) <=s delta, delta <=s (const 64 (1 + 2*99)),
    u_99_99 = (const 64 (-(2**20))),
    v_99_99 = (const 64 (0)),
    r_99_99 = (const 64 (0)),
    s_99_99 = (const 64 (-(2**20)))
}



// divsteps
// step99

// premise c
assume
neg_g_59_low60_40_low20_0 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_1 neg_g_59_low60_40_low20_0;
mov u_99_100 r_99_99;
mov v_99_100 s_99_99;

subs dc neg_g_59_low60_40_low20_1 neg_g_59_low60_40_low20_0 neg_f_59_low60_40_low20_0;
asr neg_g_59_low60_40_low20_1 neg_g_59_low60_40_low20_1 1;
subs dc r_99_100 r_99_99 u_99_99;
asr r_99_100 r_99_100 1;
subs dc s_99_100 s_99_99 v_99_99;
asr s_99_100 s_99_100 1;
assert
    true
&&
    neg_f_59_low60_40_low20_1 = neg_g_59_low60_40_low20_0,
    u_99_100 = r_99_99,
    v_99_100 = s_99_99,
    neg_g_59_low60_40_low20_1 * (const 64 2) = neg_g_59_low60_40_low20_0 - neg_f_59_low60_40_low20_0,
    r_99_100 * (const 64 2) = r_99_99 - u_99_99,
    s_99_100 * (const 64 2) = s_99_99 - v_99_99
;

assume
    neg_f_59_low60_40_low20_1 = neg_g_59_low60_40_low20_0,
    u_99_100 = r_99_99,
    v_99_100 = s_99_99,
    neg_g_59_low60_40_low20_1 * 2 = neg_g_59_low60_40_low20_0 - neg_f_59_low60_40_low20_0,
    r_99_100 * 2 = r_99_99 - u_99_99,
    s_99_100 * 2 = s_99_99 - v_99_99
&&
    true
;

{
    u_99_100 * neg_f_59_low60_40_low20_0 + v_99_100 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_100 * neg_f_59_low60_40_low20_0 + s_99_100 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_1 + u_99_100 * (const 64 (2**21)) + v_99_100 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_1 + r_99_100 * (const 64 (2**21)) + s_99_100 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_1,
    neg_f_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_1,
    neg_g_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 100)) <=s delta, delta <=s (const 64 (1 + 2*100)),
    (const 64 (-(2**20))) <=s u_99_100, u_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_100, v_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_100, r_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_100, s_99_100 <=s (const 64 ((2**20)-1)),
    u_99_100 + v_99_100 <=s (const 64 (2**20)),
    u_99_100 - v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 + v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 - v_99_100 <=s (const 64 (2**20)),
    r_99_100 + s_99_100 <=s (const 64 (2**20)),
    r_99_100 - s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 + s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 - s_99_100 <=s (const 64 (2**20)),
    u_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_99_100 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_100_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_1,
sint64 neg_g_59_low60_40_low20_1,
sint64 neg_f_59_low60_40_low20_2,
sint64 neg_g_59_low60_40_low20_2,
sint64 u_99_100,
sint64 v_99_100,
sint64 r_99_100,
sint64 s_99_100,
sint64 u_99_101,
sint64 v_99_101,
sint64 r_99_101,
sint64 s_99_101,
bit ne
)={
    u_99_100 * neg_f_59_low60_40_low20_0 + v_99_100 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_1 * (-(2**20)),
    r_99_100 * neg_f_59_low60_40_low20_0 + s_99_100 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_1 * (-(2**20))
&&
    u_99_100 * neg_f_59_low60_40_low20_0 + v_99_100 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_1 * (const 64 (-(2**20))),
    r_99_100 * neg_f_59_low60_40_low20_0 + s_99_100 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_1 + u_99_100 * (const 64 (2**21)) + v_99_100 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_1 + r_99_100 * (const 64 (2**21)) + s_99_100 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_1,
    neg_f_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_1,
    neg_g_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 100)) <=s delta, delta <=s (const 64 (1 + 2*100)),
    (const 64 (-(2**20))) <=s u_99_100, u_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_100, v_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_100, r_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_100, s_99_100 <=s (const 64 ((2**20)-1)),
    u_99_100 + v_99_100 <=s (const 64 (2**20)),
    u_99_100 - v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 + v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 - v_99_100 <=s (const 64 (2**20)),
    r_99_100 + s_99_100 <=s (const 64 (2**20)),
    r_99_100 - s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 + s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 - s_99_100 <=s (const 64 (2**20)),
    u_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_99_100 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step100

// premise a
assume
neg_g_59_low60_40_low20_1 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_2 neg_f_59_low60_40_low20_1;
mov u_99_101 u_99_100;
mov v_99_101 v_99_100;

asr neg_g_59_low60_40_low20_2 neg_g_59_low60_40_low20_1 1;
asr r_99_101 r_99_100 1;
asr s_99_101 s_99_100 1;
assert
    true
&&
    neg_f_59_low60_40_low20_2 = neg_f_59_low60_40_low20_1,
    u_99_101 = u_99_100,
    v_99_101 = v_99_100,
    neg_g_59_low60_40_low20_2 * (const 64 2) = neg_g_59_low60_40_low20_1,
    r_99_101 * (const 64 2) = r_99_100,
    s_99_101 * (const 64 2) = s_99_100
;

assume
    neg_f_59_low60_40_low20_2 = neg_f_59_low60_40_low20_1,
    u_99_101 = u_99_100,
    v_99_101 = v_99_100,
    neg_g_59_low60_40_low20_2 * 2 = neg_g_59_low60_40_low20_1,
    r_99_101 * 2 = r_99_100,
    s_99_101 * 2 = s_99_100
&&
    true
;

{
    u_99_101 * neg_f_59_low60_40_low20_0 + v_99_101 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_101 * neg_f_59_low60_40_low20_0 + s_99_101 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_2 + u_99_101 * (const 64 (2**21)) + v_99_101 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_2 + r_99_101 * (const 64 (2**21)) + s_99_101 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_2,
    neg_f_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_2,
    neg_g_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 101)) <=s delta, delta <=s (const 64 (1 + 2*101)),
    (const 64 (-(2**20))) <=s u_99_101, u_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_101, v_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_101, r_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_101, s_99_101 <=s (const 64 ((2**20)-1)),
    u_99_101 + v_99_101 <=s (const 64 (2**20)),
    u_99_101 - v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 + v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 - v_99_101 <=s (const 64 (2**20)),
    r_99_101 + s_99_101 <=s (const 64 (2**20)),
    r_99_101 - s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 + s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 - s_99_101 <=s (const 64 (2**20)),
    u_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_99_101 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_100_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_1,
sint64 neg_g_59_low60_40_low20_1,
sint64 neg_f_59_low60_40_low20_2,
sint64 neg_g_59_low60_40_low20_2,
sint64 u_99_100,
sint64 v_99_100,
sint64 r_99_100,
sint64 s_99_100,
sint64 u_99_101,
sint64 v_99_101,
sint64 r_99_101,
sint64 s_99_101,
bit ne
)={
    u_99_100 * neg_f_59_low60_40_low20_0 + v_99_100 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_1 * (-(2**20)),
    r_99_100 * neg_f_59_low60_40_low20_0 + s_99_100 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_1 * (-(2**20))
&&
    u_99_100 * neg_f_59_low60_40_low20_0 + v_99_100 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_1 * (const 64 (-(2**20))),
    r_99_100 * neg_f_59_low60_40_low20_0 + s_99_100 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_1 + u_99_100 * (const 64 (2**21)) + v_99_100 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_1 + r_99_100 * (const 64 (2**21)) + s_99_100 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_1,
    neg_f_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_1,
    neg_g_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 100)) <=s delta, delta <=s (const 64 (1 + 2*100)),
    (const 64 (-(2**20))) <=s u_99_100, u_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_100, v_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_100, r_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_100, s_99_100 <=s (const 64 ((2**20)-1)),
    u_99_100 + v_99_100 <=s (const 64 (2**20)),
    u_99_100 - v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 + v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 - v_99_100 <=s (const 64 (2**20)),
    r_99_100 + s_99_100 <=s (const 64 (2**20)),
    r_99_100 - s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 + s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 - s_99_100 <=s (const 64 (2**20)),
    u_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_99_100 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step100

// premise b
assume
neg_g_59_low60_40_low20_1 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_2 neg_f_59_low60_40_low20_1;
mov u_99_101 u_99_100;
mov v_99_101 v_99_100;

add neg_g_59_low60_40_low20_2 neg_g_59_low60_40_low20_1 neg_f_59_low60_40_low20_1;
asr neg_g_59_low60_40_low20_2 neg_g_59_low60_40_low20_2 1;
add r_99_101 r_99_100 u_99_100;
asr r_99_101 r_99_101 1;
add s_99_101 s_99_100 v_99_100;
asr s_99_101 s_99_101 1;
assert
    true
&&
    neg_f_59_low60_40_low20_2 = neg_f_59_low60_40_low20_1,
    u_99_101 = u_99_100,
    v_99_101 = v_99_100,
    neg_g_59_low60_40_low20_2 * (const 64 2) = neg_g_59_low60_40_low20_1 + neg_f_59_low60_40_low20_1,
    r_99_101 * (const 64 2) = r_99_100 + u_99_100,
    s_99_101 * (const 64 2) = s_99_100 + v_99_100
;

assume
    neg_f_59_low60_40_low20_2 = neg_f_59_low60_40_low20_1,
    u_99_101 = u_99_100,
    v_99_101 = v_99_100,
    neg_g_59_low60_40_low20_2 * 2 = neg_g_59_low60_40_low20_1 + neg_f_59_low60_40_low20_1,
    r_99_101 * 2 = r_99_100 + u_99_100,
    s_99_101 * 2 = s_99_100 + v_99_100
&&
    true
;

{
    u_99_101 * neg_f_59_low60_40_low20_0 + v_99_101 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_101 * neg_f_59_low60_40_low20_0 + s_99_101 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_2 + u_99_101 * (const 64 (2**21)) + v_99_101 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_2 + r_99_101 * (const 64 (2**21)) + s_99_101 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_2,
    neg_f_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_2,
    neg_g_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 101)) <=s delta, delta <=s (const 64 (1 + 2*101)),
    (const 64 (-(2**20))) <=s u_99_101, u_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_101, v_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_101, r_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_101, s_99_101 <=s (const 64 ((2**20)-1)),
    u_99_101 + v_99_101 <=s (const 64 (2**20)),
    u_99_101 - v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 + v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 - v_99_101 <=s (const 64 (2**20)),
    r_99_101 + s_99_101 <=s (const 64 (2**20)),
    r_99_101 - s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 + s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 - s_99_101 <=s (const 64 (2**20)),
    u_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_99_101 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_100_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_1,
sint64 neg_g_59_low60_40_low20_1,
sint64 neg_f_59_low60_40_low20_2,
sint64 neg_g_59_low60_40_low20_2,
sint64 u_99_100,
sint64 v_99_100,
sint64 r_99_100,
sint64 s_99_100,
sint64 u_99_101,
sint64 v_99_101,
sint64 r_99_101,
sint64 s_99_101,
bit ne
)={
    u_99_100 * neg_f_59_low60_40_low20_0 + v_99_100 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_1 * (-(2**20)),
    r_99_100 * neg_f_59_low60_40_low20_0 + s_99_100 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_1 * (-(2**20))
&&
    u_99_100 * neg_f_59_low60_40_low20_0 + v_99_100 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_1 * (const 64 (-(2**20))),
    r_99_100 * neg_f_59_low60_40_low20_0 + s_99_100 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_1 + u_99_100 * (const 64 (2**21)) + v_99_100 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_1 + r_99_100 * (const 64 (2**21)) + s_99_100 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_1,
    neg_f_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_1,
    neg_g_59_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 100)) <=s delta, delta <=s (const 64 (1 + 2*100)),
    (const 64 (-(2**20))) <=s u_99_100, u_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_100, v_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_100, r_99_100 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_100, s_99_100 <=s (const 64 ((2**20)-1)),
    u_99_100 + v_99_100 <=s (const 64 (2**20)),
    u_99_100 - v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 + v_99_100 <=s (const 64 (2**20)),
    (const 64 0) - u_99_100 - v_99_100 <=s (const 64 (2**20)),
    r_99_100 + s_99_100 <=s (const 64 (2**20)),
    r_99_100 - s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 + s_99_100 <=s (const 64 (2**20)),
    (const 64 0) - r_99_100 - s_99_100 <=s (const 64 (2**20)),
    u_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_99_100 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_99_100 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step100

// premise c
assume
neg_g_59_low60_40_low20_1 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_2 neg_g_59_low60_40_low20_1;
mov u_99_101 r_99_100;
mov v_99_101 s_99_100;

subs dc neg_g_59_low60_40_low20_2 neg_g_59_low60_40_low20_1 neg_f_59_low60_40_low20_1;
asr neg_g_59_low60_40_low20_2 neg_g_59_low60_40_low20_2 1;
subs dc r_99_101 r_99_100 u_99_100;
asr r_99_101 r_99_101 1;
subs dc s_99_101 s_99_100 v_99_100;
asr s_99_101 s_99_101 1;
assert
    true
&&
    neg_f_59_low60_40_low20_2 = neg_g_59_low60_40_low20_1,
    u_99_101 = r_99_100,
    v_99_101 = s_99_100,
    neg_g_59_low60_40_low20_2 * (const 64 2) = neg_g_59_low60_40_low20_1 - neg_f_59_low60_40_low20_1,
    r_99_101 * (const 64 2) = r_99_100 - u_99_100,
    s_99_101 * (const 64 2) = s_99_100 - v_99_100
;

assume
    neg_f_59_low60_40_low20_2 = neg_g_59_low60_40_low20_1,
    u_99_101 = r_99_100,
    v_99_101 = s_99_100,
    neg_g_59_low60_40_low20_2 * 2 = neg_g_59_low60_40_low20_1 - neg_f_59_low60_40_low20_1,
    r_99_101 * 2 = r_99_100 - u_99_100,
    s_99_101 * 2 = s_99_100 - v_99_100
&&
    true
;

{
    u_99_101 * neg_f_59_low60_40_low20_0 + v_99_101 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_101 * neg_f_59_low60_40_low20_0 + s_99_101 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_2 + u_99_101 * (const 64 (2**21)) + v_99_101 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_2 + r_99_101 * (const 64 (2**21)) + s_99_101 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_2,
    neg_f_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_2,
    neg_g_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 101)) <=s delta, delta <=s (const 64 (1 + 2*101)),
    (const 64 (-(2**20))) <=s u_99_101, u_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_101, v_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_101, r_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_101, s_99_101 <=s (const 64 ((2**20)-1)),
    u_99_101 + v_99_101 <=s (const 64 (2**20)),
    u_99_101 - v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 + v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 - v_99_101 <=s (const 64 (2**20)),
    r_99_101 + s_99_101 <=s (const 64 (2**20)),
    r_99_101 - s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 + s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 - s_99_101 <=s (const 64 (2**20)),
    u_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_99_101 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_101_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_2,
sint64 neg_g_59_low60_40_low20_2,
sint64 neg_f_59_low60_40_low20_3,
sint64 neg_g_59_low60_40_low20_3,
sint64 u_99_101,
sint64 v_99_101,
sint64 r_99_101,
sint64 s_99_101,
sint64 u_99_102,
sint64 v_99_102,
sint64 r_99_102,
sint64 s_99_102,
bit ne
)={
    u_99_101 * neg_f_59_low60_40_low20_0 + v_99_101 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_2 * (-(2**20)),
    r_99_101 * neg_f_59_low60_40_low20_0 + s_99_101 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_2 * (-(2**20))
&&
    u_99_101 * neg_f_59_low60_40_low20_0 + v_99_101 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_2 * (const 64 (-(2**20))),
    r_99_101 * neg_f_59_low60_40_low20_0 + s_99_101 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_2 + u_99_101 * (const 64 (2**21)) + v_99_101 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_2 + r_99_101 * (const 64 (2**21)) + s_99_101 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_2,
    neg_f_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_2,
    neg_g_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 101)) <=s delta, delta <=s (const 64 (1 + 2*101)),
    (const 64 (-(2**20))) <=s u_99_101, u_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_101, v_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_101, r_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_101, s_99_101 <=s (const 64 ((2**20)-1)),
    u_99_101 + v_99_101 <=s (const 64 (2**20)),
    u_99_101 - v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 + v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 - v_99_101 <=s (const 64 (2**20)),
    r_99_101 + s_99_101 <=s (const 64 (2**20)),
    r_99_101 - s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 + s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 - s_99_101 <=s (const 64 (2**20)),
    u_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_99_101 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step101

// premise a
assume
neg_g_59_low60_40_low20_2 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_3 neg_f_59_low60_40_low20_2;
mov u_99_102 u_99_101;
mov v_99_102 v_99_101;

asr neg_g_59_low60_40_low20_3 neg_g_59_low60_40_low20_2 1;
asr r_99_102 r_99_101 1;
asr s_99_102 s_99_101 1;
assert
    true
&&
    neg_f_59_low60_40_low20_3 = neg_f_59_low60_40_low20_2,
    u_99_102 = u_99_101,
    v_99_102 = v_99_101,
    neg_g_59_low60_40_low20_3 * (const 64 2) = neg_g_59_low60_40_low20_2,
    r_99_102 * (const 64 2) = r_99_101,
    s_99_102 * (const 64 2) = s_99_101
;

assume
    neg_f_59_low60_40_low20_3 = neg_f_59_low60_40_low20_2,
    u_99_102 = u_99_101,
    v_99_102 = v_99_101,
    neg_g_59_low60_40_low20_3 * 2 = neg_g_59_low60_40_low20_2,
    r_99_102 * 2 = r_99_101,
    s_99_102 * 2 = s_99_101
&&
    true
;

{
    u_99_102 * neg_f_59_low60_40_low20_0 + v_99_102 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_102 * neg_f_59_low60_40_low20_0 + s_99_102 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_3 + u_99_102 * (const 64 (2**21)) + v_99_102 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_3 + r_99_102 * (const 64 (2**21)) + s_99_102 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_3,
    neg_f_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_3,
    neg_g_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 102)) <=s delta, delta <=s (const 64 (1 + 2*102)),
    (const 64 (-(2**20))) <=s u_99_102, u_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_102, v_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_102, r_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_102, s_99_102 <=s (const 64 ((2**20)-1)),
    u_99_102 + v_99_102 <=s (const 64 (2**20)),
    u_99_102 - v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 + v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 - v_99_102 <=s (const 64 (2**20)),
    r_99_102 + s_99_102 <=s (const 64 (2**20)),
    r_99_102 - s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 + s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 - s_99_102 <=s (const 64 (2**20)),
    u_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_99_102 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_101_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_2,
sint64 neg_g_59_low60_40_low20_2,
sint64 neg_f_59_low60_40_low20_3,
sint64 neg_g_59_low60_40_low20_3,
sint64 u_99_101,
sint64 v_99_101,
sint64 r_99_101,
sint64 s_99_101,
sint64 u_99_102,
sint64 v_99_102,
sint64 r_99_102,
sint64 s_99_102,
bit ne
)={
    u_99_101 * neg_f_59_low60_40_low20_0 + v_99_101 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_2 * (-(2**20)),
    r_99_101 * neg_f_59_low60_40_low20_0 + s_99_101 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_2 * (-(2**20))
&&
    u_99_101 * neg_f_59_low60_40_low20_0 + v_99_101 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_2 * (const 64 (-(2**20))),
    r_99_101 * neg_f_59_low60_40_low20_0 + s_99_101 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_2 + u_99_101 * (const 64 (2**21)) + v_99_101 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_2 + r_99_101 * (const 64 (2**21)) + s_99_101 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_2,
    neg_f_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_2,
    neg_g_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 101)) <=s delta, delta <=s (const 64 (1 + 2*101)),
    (const 64 (-(2**20))) <=s u_99_101, u_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_101, v_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_101, r_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_101, s_99_101 <=s (const 64 ((2**20)-1)),
    u_99_101 + v_99_101 <=s (const 64 (2**20)),
    u_99_101 - v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 + v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 - v_99_101 <=s (const 64 (2**20)),
    r_99_101 + s_99_101 <=s (const 64 (2**20)),
    r_99_101 - s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 + s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 - s_99_101 <=s (const 64 (2**20)),
    u_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_99_101 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step101

// premise b
assume
neg_g_59_low60_40_low20_2 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_3 neg_f_59_low60_40_low20_2;
mov u_99_102 u_99_101;
mov v_99_102 v_99_101;

add neg_g_59_low60_40_low20_3 neg_g_59_low60_40_low20_2 neg_f_59_low60_40_low20_2;
asr neg_g_59_low60_40_low20_3 neg_g_59_low60_40_low20_3 1;
add r_99_102 r_99_101 u_99_101;
asr r_99_102 r_99_102 1;
add s_99_102 s_99_101 v_99_101;
asr s_99_102 s_99_102 1;
assert
    true
&&
    neg_f_59_low60_40_low20_3 = neg_f_59_low60_40_low20_2,
    u_99_102 = u_99_101,
    v_99_102 = v_99_101,
    neg_g_59_low60_40_low20_3 * (const 64 2) = neg_g_59_low60_40_low20_2 + neg_f_59_low60_40_low20_2,
    r_99_102 * (const 64 2) = r_99_101 + u_99_101,
    s_99_102 * (const 64 2) = s_99_101 + v_99_101
;

assume
    neg_f_59_low60_40_low20_3 = neg_f_59_low60_40_low20_2,
    u_99_102 = u_99_101,
    v_99_102 = v_99_101,
    neg_g_59_low60_40_low20_3 * 2 = neg_g_59_low60_40_low20_2 + neg_f_59_low60_40_low20_2,
    r_99_102 * 2 = r_99_101 + u_99_101,
    s_99_102 * 2 = s_99_101 + v_99_101
&&
    true
;

{
    u_99_102 * neg_f_59_low60_40_low20_0 + v_99_102 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_102 * neg_f_59_low60_40_low20_0 + s_99_102 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_3 + u_99_102 * (const 64 (2**21)) + v_99_102 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_3 + r_99_102 * (const 64 (2**21)) + s_99_102 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_3,
    neg_f_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_3,
    neg_g_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 102)) <=s delta, delta <=s (const 64 (1 + 2*102)),
    (const 64 (-(2**20))) <=s u_99_102, u_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_102, v_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_102, r_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_102, s_99_102 <=s (const 64 ((2**20)-1)),
    u_99_102 + v_99_102 <=s (const 64 (2**20)),
    u_99_102 - v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 + v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 - v_99_102 <=s (const 64 (2**20)),
    r_99_102 + s_99_102 <=s (const 64 (2**20)),
    r_99_102 - s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 + s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 - s_99_102 <=s (const 64 (2**20)),
    u_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_99_102 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_101_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_2,
sint64 neg_g_59_low60_40_low20_2,
sint64 neg_f_59_low60_40_low20_3,
sint64 neg_g_59_low60_40_low20_3,
sint64 u_99_101,
sint64 v_99_101,
sint64 r_99_101,
sint64 s_99_101,
sint64 u_99_102,
sint64 v_99_102,
sint64 r_99_102,
sint64 s_99_102,
bit ne
)={
    u_99_101 * neg_f_59_low60_40_low20_0 + v_99_101 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_2 * (-(2**20)),
    r_99_101 * neg_f_59_low60_40_low20_0 + s_99_101 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_2 * (-(2**20))
&&
    u_99_101 * neg_f_59_low60_40_low20_0 + v_99_101 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_2 * (const 64 (-(2**20))),
    r_99_101 * neg_f_59_low60_40_low20_0 + s_99_101 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_2 + u_99_101 * (const 64 (2**21)) + v_99_101 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_2 + r_99_101 * (const 64 (2**21)) + s_99_101 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_2,
    neg_f_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_2,
    neg_g_59_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 101)) <=s delta, delta <=s (const 64 (1 + 2*101)),
    (const 64 (-(2**20))) <=s u_99_101, u_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_101, v_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_101, r_99_101 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_101, s_99_101 <=s (const 64 ((2**20)-1)),
    u_99_101 + v_99_101 <=s (const 64 (2**20)),
    u_99_101 - v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 + v_99_101 <=s (const 64 (2**20)),
    (const 64 0) - u_99_101 - v_99_101 <=s (const 64 (2**20)),
    r_99_101 + s_99_101 <=s (const 64 (2**20)),
    r_99_101 - s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 + s_99_101 <=s (const 64 (2**20)),
    (const 64 0) - r_99_101 - s_99_101 <=s (const 64 (2**20)),
    u_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_99_101 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_99_101 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step101

// premise c
assume
neg_g_59_low60_40_low20_2 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_3 neg_g_59_low60_40_low20_2;
mov u_99_102 r_99_101;
mov v_99_102 s_99_101;

subs dc neg_g_59_low60_40_low20_3 neg_g_59_low60_40_low20_2 neg_f_59_low60_40_low20_2;
asr neg_g_59_low60_40_low20_3 neg_g_59_low60_40_low20_3 1;
subs dc r_99_102 r_99_101 u_99_101;
asr r_99_102 r_99_102 1;
subs dc s_99_102 s_99_101 v_99_101;
asr s_99_102 s_99_102 1;
assert
    true
&&
    neg_f_59_low60_40_low20_3 = neg_g_59_low60_40_low20_2,
    u_99_102 = r_99_101,
    v_99_102 = s_99_101,
    neg_g_59_low60_40_low20_3 * (const 64 2) = neg_g_59_low60_40_low20_2 - neg_f_59_low60_40_low20_2,
    r_99_102 * (const 64 2) = r_99_101 - u_99_101,
    s_99_102 * (const 64 2) = s_99_101 - v_99_101
;

assume
    neg_f_59_low60_40_low20_3 = neg_g_59_low60_40_low20_2,
    u_99_102 = r_99_101,
    v_99_102 = s_99_101,
    neg_g_59_low60_40_low20_3 * 2 = neg_g_59_low60_40_low20_2 - neg_f_59_low60_40_low20_2,
    r_99_102 * 2 = r_99_101 - u_99_101,
    s_99_102 * 2 = s_99_101 - v_99_101
&&
    true
;

{
    u_99_102 * neg_f_59_low60_40_low20_0 + v_99_102 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_102 * neg_f_59_low60_40_low20_0 + s_99_102 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_3 + u_99_102 * (const 64 (2**21)) + v_99_102 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_3 + r_99_102 * (const 64 (2**21)) + s_99_102 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_3,
    neg_f_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_3,
    neg_g_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 102)) <=s delta, delta <=s (const 64 (1 + 2*102)),
    (const 64 (-(2**20))) <=s u_99_102, u_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_102, v_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_102, r_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_102, s_99_102 <=s (const 64 ((2**20)-1)),
    u_99_102 + v_99_102 <=s (const 64 (2**20)),
    u_99_102 - v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 + v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 - v_99_102 <=s (const 64 (2**20)),
    r_99_102 + s_99_102 <=s (const 64 (2**20)),
    r_99_102 - s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 + s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 - s_99_102 <=s (const 64 (2**20)),
    u_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_99_102 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_102_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_3,
sint64 neg_g_59_low60_40_low20_3,
sint64 neg_f_59_low60_40_low20_4,
sint64 neg_g_59_low60_40_low20_4,
sint64 u_99_102,
sint64 v_99_102,
sint64 r_99_102,
sint64 s_99_102,
sint64 u_99_103,
sint64 v_99_103,
sint64 r_99_103,
sint64 s_99_103,
bit ne
)={
    u_99_102 * neg_f_59_low60_40_low20_0 + v_99_102 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_3 * (-(2**20)),
    r_99_102 * neg_f_59_low60_40_low20_0 + s_99_102 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_3 * (-(2**20))
&&
    u_99_102 * neg_f_59_low60_40_low20_0 + v_99_102 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_3 * (const 64 (-(2**20))),
    r_99_102 * neg_f_59_low60_40_low20_0 + s_99_102 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_3 + u_99_102 * (const 64 (2**21)) + v_99_102 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_3 + r_99_102 * (const 64 (2**21)) + s_99_102 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_3,
    neg_f_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_3,
    neg_g_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 102)) <=s delta, delta <=s (const 64 (1 + 2*102)),
    (const 64 (-(2**20))) <=s u_99_102, u_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_102, v_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_102, r_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_102, s_99_102 <=s (const 64 ((2**20)-1)),
    u_99_102 + v_99_102 <=s (const 64 (2**20)),
    u_99_102 - v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 + v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 - v_99_102 <=s (const 64 (2**20)),
    r_99_102 + s_99_102 <=s (const 64 (2**20)),
    r_99_102 - s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 + s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 - s_99_102 <=s (const 64 (2**20)),
    u_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_99_102 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step102

// premise a
assume
neg_g_59_low60_40_low20_3 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_4 neg_f_59_low60_40_low20_3;
mov u_99_103 u_99_102;
mov v_99_103 v_99_102;

asr neg_g_59_low60_40_low20_4 neg_g_59_low60_40_low20_3 1;
asr r_99_103 r_99_102 1;
asr s_99_103 s_99_102 1;
assert
    true
&&
    neg_f_59_low60_40_low20_4 = neg_f_59_low60_40_low20_3,
    u_99_103 = u_99_102,
    v_99_103 = v_99_102,
    neg_g_59_low60_40_low20_4 * (const 64 2) = neg_g_59_low60_40_low20_3,
    r_99_103 * (const 64 2) = r_99_102,
    s_99_103 * (const 64 2) = s_99_102
;

assume
    neg_f_59_low60_40_low20_4 = neg_f_59_low60_40_low20_3,
    u_99_103 = u_99_102,
    v_99_103 = v_99_102,
    neg_g_59_low60_40_low20_4 * 2 = neg_g_59_low60_40_low20_3,
    r_99_103 * 2 = r_99_102,
    s_99_103 * 2 = s_99_102
&&
    true
;

{
    u_99_103 * neg_f_59_low60_40_low20_0 + v_99_103 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_103 * neg_f_59_low60_40_low20_0 + s_99_103 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_4 + u_99_103 * (const 64 (2**21)) + v_99_103 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_4 + r_99_103 * (const 64 (2**21)) + s_99_103 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_4,
    neg_f_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_4,
    neg_g_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 103)) <=s delta, delta <=s (const 64 (1 + 2*103)),
    (const 64 (-(2**20))) <=s u_99_103, u_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_103, v_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_103, r_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_103, s_99_103 <=s (const 64 ((2**20)-1)),
    u_99_103 + v_99_103 <=s (const 64 (2**20)),
    u_99_103 - v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 + v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 - v_99_103 <=s (const 64 (2**20)),
    r_99_103 + s_99_103 <=s (const 64 (2**20)),
    r_99_103 - s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 + s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 - s_99_103 <=s (const 64 (2**20)),
    u_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_99_103 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_102_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_3,
sint64 neg_g_59_low60_40_low20_3,
sint64 neg_f_59_low60_40_low20_4,
sint64 neg_g_59_low60_40_low20_4,
sint64 u_99_102,
sint64 v_99_102,
sint64 r_99_102,
sint64 s_99_102,
sint64 u_99_103,
sint64 v_99_103,
sint64 r_99_103,
sint64 s_99_103,
bit ne
)={
    u_99_102 * neg_f_59_low60_40_low20_0 + v_99_102 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_3 * (-(2**20)),
    r_99_102 * neg_f_59_low60_40_low20_0 + s_99_102 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_3 * (-(2**20))
&&
    u_99_102 * neg_f_59_low60_40_low20_0 + v_99_102 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_3 * (const 64 (-(2**20))),
    r_99_102 * neg_f_59_low60_40_low20_0 + s_99_102 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_3 + u_99_102 * (const 64 (2**21)) + v_99_102 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_3 + r_99_102 * (const 64 (2**21)) + s_99_102 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_3,
    neg_f_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_3,
    neg_g_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 102)) <=s delta, delta <=s (const 64 (1 + 2*102)),
    (const 64 (-(2**20))) <=s u_99_102, u_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_102, v_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_102, r_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_102, s_99_102 <=s (const 64 ((2**20)-1)),
    u_99_102 + v_99_102 <=s (const 64 (2**20)),
    u_99_102 - v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 + v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 - v_99_102 <=s (const 64 (2**20)),
    r_99_102 + s_99_102 <=s (const 64 (2**20)),
    r_99_102 - s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 + s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 - s_99_102 <=s (const 64 (2**20)),
    u_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_99_102 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step102

// premise b
assume
neg_g_59_low60_40_low20_3 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_4 neg_f_59_low60_40_low20_3;
mov u_99_103 u_99_102;
mov v_99_103 v_99_102;

add neg_g_59_low60_40_low20_4 neg_g_59_low60_40_low20_3 neg_f_59_low60_40_low20_3;
asr neg_g_59_low60_40_low20_4 neg_g_59_low60_40_low20_4 1;
add r_99_103 r_99_102 u_99_102;
asr r_99_103 r_99_103 1;
add s_99_103 s_99_102 v_99_102;
asr s_99_103 s_99_103 1;
assert
    true
&&
    neg_f_59_low60_40_low20_4 = neg_f_59_low60_40_low20_3,
    u_99_103 = u_99_102,
    v_99_103 = v_99_102,
    neg_g_59_low60_40_low20_4 * (const 64 2) = neg_g_59_low60_40_low20_3 + neg_f_59_low60_40_low20_3,
    r_99_103 * (const 64 2) = r_99_102 + u_99_102,
    s_99_103 * (const 64 2) = s_99_102 + v_99_102
;

assume
    neg_f_59_low60_40_low20_4 = neg_f_59_low60_40_low20_3,
    u_99_103 = u_99_102,
    v_99_103 = v_99_102,
    neg_g_59_low60_40_low20_4 * 2 = neg_g_59_low60_40_low20_3 + neg_f_59_low60_40_low20_3,
    r_99_103 * 2 = r_99_102 + u_99_102,
    s_99_103 * 2 = s_99_102 + v_99_102
&&
    true
;

{
    u_99_103 * neg_f_59_low60_40_low20_0 + v_99_103 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_103 * neg_f_59_low60_40_low20_0 + s_99_103 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_4 + u_99_103 * (const 64 (2**21)) + v_99_103 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_4 + r_99_103 * (const 64 (2**21)) + s_99_103 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_4,
    neg_f_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_4,
    neg_g_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 103)) <=s delta, delta <=s (const 64 (1 + 2*103)),
    (const 64 (-(2**20))) <=s u_99_103, u_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_103, v_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_103, r_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_103, s_99_103 <=s (const 64 ((2**20)-1)),
    u_99_103 + v_99_103 <=s (const 64 (2**20)),
    u_99_103 - v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 + v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 - v_99_103 <=s (const 64 (2**20)),
    r_99_103 + s_99_103 <=s (const 64 (2**20)),
    r_99_103 - s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 + s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 - s_99_103 <=s (const 64 (2**20)),
    u_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_99_103 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_102_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_3,
sint64 neg_g_59_low60_40_low20_3,
sint64 neg_f_59_low60_40_low20_4,
sint64 neg_g_59_low60_40_low20_4,
sint64 u_99_102,
sint64 v_99_102,
sint64 r_99_102,
sint64 s_99_102,
sint64 u_99_103,
sint64 v_99_103,
sint64 r_99_103,
sint64 s_99_103,
bit ne
)={
    u_99_102 * neg_f_59_low60_40_low20_0 + v_99_102 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_3 * (-(2**20)),
    r_99_102 * neg_f_59_low60_40_low20_0 + s_99_102 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_3 * (-(2**20))
&&
    u_99_102 * neg_f_59_low60_40_low20_0 + v_99_102 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_3 * (const 64 (-(2**20))),
    r_99_102 * neg_f_59_low60_40_low20_0 + s_99_102 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_3 + u_99_102 * (const 64 (2**21)) + v_99_102 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_3 + r_99_102 * (const 64 (2**21)) + s_99_102 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_3,
    neg_f_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_3,
    neg_g_59_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 102)) <=s delta, delta <=s (const 64 (1 + 2*102)),
    (const 64 (-(2**20))) <=s u_99_102, u_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_102, v_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_102, r_99_102 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_102, s_99_102 <=s (const 64 ((2**20)-1)),
    u_99_102 + v_99_102 <=s (const 64 (2**20)),
    u_99_102 - v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 + v_99_102 <=s (const 64 (2**20)),
    (const 64 0) - u_99_102 - v_99_102 <=s (const 64 (2**20)),
    r_99_102 + s_99_102 <=s (const 64 (2**20)),
    r_99_102 - s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 + s_99_102 <=s (const 64 (2**20)),
    (const 64 0) - r_99_102 - s_99_102 <=s (const 64 (2**20)),
    u_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_99_102 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_99_102 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step102

// premise c
assume
neg_g_59_low60_40_low20_3 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_4 neg_g_59_low60_40_low20_3;
mov u_99_103 r_99_102;
mov v_99_103 s_99_102;

subs dc neg_g_59_low60_40_low20_4 neg_g_59_low60_40_low20_3 neg_f_59_low60_40_low20_3;
asr neg_g_59_low60_40_low20_4 neg_g_59_low60_40_low20_4 1;
subs dc r_99_103 r_99_102 u_99_102;
asr r_99_103 r_99_103 1;
subs dc s_99_103 s_99_102 v_99_102;
asr s_99_103 s_99_103 1;
assert
    true
&&
    neg_f_59_low60_40_low20_4 = neg_g_59_low60_40_low20_3,
    u_99_103 = r_99_102,
    v_99_103 = s_99_102,
    neg_g_59_low60_40_low20_4 * (const 64 2) = neg_g_59_low60_40_low20_3 - neg_f_59_low60_40_low20_3,
    r_99_103 * (const 64 2) = r_99_102 - u_99_102,
    s_99_103 * (const 64 2) = s_99_102 - v_99_102
;

assume
    neg_f_59_low60_40_low20_4 = neg_g_59_low60_40_low20_3,
    u_99_103 = r_99_102,
    v_99_103 = s_99_102,
    neg_g_59_low60_40_low20_4 * 2 = neg_g_59_low60_40_low20_3 - neg_f_59_low60_40_low20_3,
    r_99_103 * 2 = r_99_102 - u_99_102,
    s_99_103 * 2 = s_99_102 - v_99_102
&&
    true
;

{
    u_99_103 * neg_f_59_low60_40_low20_0 + v_99_103 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_103 * neg_f_59_low60_40_low20_0 + s_99_103 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_4 + u_99_103 * (const 64 (2**21)) + v_99_103 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_4 + r_99_103 * (const 64 (2**21)) + s_99_103 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_4,
    neg_f_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_4,
    neg_g_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 103)) <=s delta, delta <=s (const 64 (1 + 2*103)),
    (const 64 (-(2**20))) <=s u_99_103, u_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_103, v_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_103, r_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_103, s_99_103 <=s (const 64 ((2**20)-1)),
    u_99_103 + v_99_103 <=s (const 64 (2**20)),
    u_99_103 - v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 + v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 - v_99_103 <=s (const 64 (2**20)),
    r_99_103 + s_99_103 <=s (const 64 (2**20)),
    r_99_103 - s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 + s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 - s_99_103 <=s (const 64 (2**20)),
    u_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_99_103 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_103_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_4,
sint64 neg_g_59_low60_40_low20_4,
sint64 neg_f_59_low60_40_low20_5,
sint64 neg_g_59_low60_40_low20_5,
sint64 u_99_103,
sint64 v_99_103,
sint64 r_99_103,
sint64 s_99_103,
sint64 u_99_104,
sint64 v_99_104,
sint64 r_99_104,
sint64 s_99_104,
bit ne
)={
    u_99_103 * neg_f_59_low60_40_low20_0 + v_99_103 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_4 * (-(2**20)),
    r_99_103 * neg_f_59_low60_40_low20_0 + s_99_103 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_4 * (-(2**20))
&&
    u_99_103 * neg_f_59_low60_40_low20_0 + v_99_103 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_4 * (const 64 (-(2**20))),
    r_99_103 * neg_f_59_low60_40_low20_0 + s_99_103 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_4 + u_99_103 * (const 64 (2**21)) + v_99_103 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_4 + r_99_103 * (const 64 (2**21)) + s_99_103 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_4,
    neg_f_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_4,
    neg_g_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 103)) <=s delta, delta <=s (const 64 (1 + 2*103)),
    (const 64 (-(2**20))) <=s u_99_103, u_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_103, v_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_103, r_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_103, s_99_103 <=s (const 64 ((2**20)-1)),
    u_99_103 + v_99_103 <=s (const 64 (2**20)),
    u_99_103 - v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 + v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 - v_99_103 <=s (const 64 (2**20)),
    r_99_103 + s_99_103 <=s (const 64 (2**20)),
    r_99_103 - s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 + s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 - s_99_103 <=s (const 64 (2**20)),
    u_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_99_103 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step103

// premise a
assume
neg_g_59_low60_40_low20_4 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_5 neg_f_59_low60_40_low20_4;
mov u_99_104 u_99_103;
mov v_99_104 v_99_103;

asr neg_g_59_low60_40_low20_5 neg_g_59_low60_40_low20_4 1;
asr r_99_104 r_99_103 1;
asr s_99_104 s_99_103 1;
assert
    true
&&
    neg_f_59_low60_40_low20_5 = neg_f_59_low60_40_low20_4,
    u_99_104 = u_99_103,
    v_99_104 = v_99_103,
    neg_g_59_low60_40_low20_5 * (const 64 2) = neg_g_59_low60_40_low20_4,
    r_99_104 * (const 64 2) = r_99_103,
    s_99_104 * (const 64 2) = s_99_103
;

assume
    neg_f_59_low60_40_low20_5 = neg_f_59_low60_40_low20_4,
    u_99_104 = u_99_103,
    v_99_104 = v_99_103,
    neg_g_59_low60_40_low20_5 * 2 = neg_g_59_low60_40_low20_4,
    r_99_104 * 2 = r_99_103,
    s_99_104 * 2 = s_99_103
&&
    true
;

{
    u_99_104 * neg_f_59_low60_40_low20_0 + v_99_104 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_104 * neg_f_59_low60_40_low20_0 + s_99_104 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_5 + u_99_104 * (const 64 (2**21)) + v_99_104 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_5 + r_99_104 * (const 64 (2**21)) + s_99_104 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_5,
    neg_f_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_5,
    neg_g_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 104)) <=s delta, delta <=s (const 64 (1 + 2*104)),
    (const 64 (-(2**20))) <=s u_99_104, u_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_104, v_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_104, r_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_104, s_99_104 <=s (const 64 ((2**20)-1)),
    u_99_104 + v_99_104 <=s (const 64 (2**20)),
    u_99_104 - v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 + v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 - v_99_104 <=s (const 64 (2**20)),
    r_99_104 + s_99_104 <=s (const 64 (2**20)),
    r_99_104 - s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 + s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 - s_99_104 <=s (const 64 (2**20)),
    u_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_99_104 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_103_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_4,
sint64 neg_g_59_low60_40_low20_4,
sint64 neg_f_59_low60_40_low20_5,
sint64 neg_g_59_low60_40_low20_5,
sint64 u_99_103,
sint64 v_99_103,
sint64 r_99_103,
sint64 s_99_103,
sint64 u_99_104,
sint64 v_99_104,
sint64 r_99_104,
sint64 s_99_104,
bit ne
)={
    u_99_103 * neg_f_59_low60_40_low20_0 + v_99_103 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_4 * (-(2**20)),
    r_99_103 * neg_f_59_low60_40_low20_0 + s_99_103 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_4 * (-(2**20))
&&
    u_99_103 * neg_f_59_low60_40_low20_0 + v_99_103 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_4 * (const 64 (-(2**20))),
    r_99_103 * neg_f_59_low60_40_low20_0 + s_99_103 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_4 + u_99_103 * (const 64 (2**21)) + v_99_103 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_4 + r_99_103 * (const 64 (2**21)) + s_99_103 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_4,
    neg_f_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_4,
    neg_g_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 103)) <=s delta, delta <=s (const 64 (1 + 2*103)),
    (const 64 (-(2**20))) <=s u_99_103, u_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_103, v_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_103, r_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_103, s_99_103 <=s (const 64 ((2**20)-1)),
    u_99_103 + v_99_103 <=s (const 64 (2**20)),
    u_99_103 - v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 + v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 - v_99_103 <=s (const 64 (2**20)),
    r_99_103 + s_99_103 <=s (const 64 (2**20)),
    r_99_103 - s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 + s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 - s_99_103 <=s (const 64 (2**20)),
    u_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_99_103 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step103

// premise b
assume
neg_g_59_low60_40_low20_4 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_5 neg_f_59_low60_40_low20_4;
mov u_99_104 u_99_103;
mov v_99_104 v_99_103;

add neg_g_59_low60_40_low20_5 neg_g_59_low60_40_low20_4 neg_f_59_low60_40_low20_4;
asr neg_g_59_low60_40_low20_5 neg_g_59_low60_40_low20_5 1;
add r_99_104 r_99_103 u_99_103;
asr r_99_104 r_99_104 1;
add s_99_104 s_99_103 v_99_103;
asr s_99_104 s_99_104 1;
assert
    true
&&
    neg_f_59_low60_40_low20_5 = neg_f_59_low60_40_low20_4,
    u_99_104 = u_99_103,
    v_99_104 = v_99_103,
    neg_g_59_low60_40_low20_5 * (const 64 2) = neg_g_59_low60_40_low20_4 + neg_f_59_low60_40_low20_4,
    r_99_104 * (const 64 2) = r_99_103 + u_99_103,
    s_99_104 * (const 64 2) = s_99_103 + v_99_103
;

assume
    neg_f_59_low60_40_low20_5 = neg_f_59_low60_40_low20_4,
    u_99_104 = u_99_103,
    v_99_104 = v_99_103,
    neg_g_59_low60_40_low20_5 * 2 = neg_g_59_low60_40_low20_4 + neg_f_59_low60_40_low20_4,
    r_99_104 * 2 = r_99_103 + u_99_103,
    s_99_104 * 2 = s_99_103 + v_99_103
&&
    true
;

{
    u_99_104 * neg_f_59_low60_40_low20_0 + v_99_104 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_104 * neg_f_59_low60_40_low20_0 + s_99_104 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_5 + u_99_104 * (const 64 (2**21)) + v_99_104 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_5 + r_99_104 * (const 64 (2**21)) + s_99_104 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_5,
    neg_f_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_5,
    neg_g_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 104)) <=s delta, delta <=s (const 64 (1 + 2*104)),
    (const 64 (-(2**20))) <=s u_99_104, u_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_104, v_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_104, r_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_104, s_99_104 <=s (const 64 ((2**20)-1)),
    u_99_104 + v_99_104 <=s (const 64 (2**20)),
    u_99_104 - v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 + v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 - v_99_104 <=s (const 64 (2**20)),
    r_99_104 + s_99_104 <=s (const 64 (2**20)),
    r_99_104 - s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 + s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 - s_99_104 <=s (const 64 (2**20)),
    u_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_99_104 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_103_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_4,
sint64 neg_g_59_low60_40_low20_4,
sint64 neg_f_59_low60_40_low20_5,
sint64 neg_g_59_low60_40_low20_5,
sint64 u_99_103,
sint64 v_99_103,
sint64 r_99_103,
sint64 s_99_103,
sint64 u_99_104,
sint64 v_99_104,
sint64 r_99_104,
sint64 s_99_104,
bit ne
)={
    u_99_103 * neg_f_59_low60_40_low20_0 + v_99_103 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_4 * (-(2**20)),
    r_99_103 * neg_f_59_low60_40_low20_0 + s_99_103 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_4 * (-(2**20))
&&
    u_99_103 * neg_f_59_low60_40_low20_0 + v_99_103 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_4 * (const 64 (-(2**20))),
    r_99_103 * neg_f_59_low60_40_low20_0 + s_99_103 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_4 + u_99_103 * (const 64 (2**21)) + v_99_103 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_4 + r_99_103 * (const 64 (2**21)) + s_99_103 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_4,
    neg_f_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_4,
    neg_g_59_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 103)) <=s delta, delta <=s (const 64 (1 + 2*103)),
    (const 64 (-(2**20))) <=s u_99_103, u_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_103, v_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_103, r_99_103 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_103, s_99_103 <=s (const 64 ((2**20)-1)),
    u_99_103 + v_99_103 <=s (const 64 (2**20)),
    u_99_103 - v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 + v_99_103 <=s (const 64 (2**20)),
    (const 64 0) - u_99_103 - v_99_103 <=s (const 64 (2**20)),
    r_99_103 + s_99_103 <=s (const 64 (2**20)),
    r_99_103 - s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 + s_99_103 <=s (const 64 (2**20)),
    (const 64 0) - r_99_103 - s_99_103 <=s (const 64 (2**20)),
    u_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_99_103 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_99_103 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step103

// premise c
assume
neg_g_59_low60_40_low20_4 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_5 neg_g_59_low60_40_low20_4;
mov u_99_104 r_99_103;
mov v_99_104 s_99_103;

subs dc neg_g_59_low60_40_low20_5 neg_g_59_low60_40_low20_4 neg_f_59_low60_40_low20_4;
asr neg_g_59_low60_40_low20_5 neg_g_59_low60_40_low20_5 1;
subs dc r_99_104 r_99_103 u_99_103;
asr r_99_104 r_99_104 1;
subs dc s_99_104 s_99_103 v_99_103;
asr s_99_104 s_99_104 1;
assert
    true
&&
    neg_f_59_low60_40_low20_5 = neg_g_59_low60_40_low20_4,
    u_99_104 = r_99_103,
    v_99_104 = s_99_103,
    neg_g_59_low60_40_low20_5 * (const 64 2) = neg_g_59_low60_40_low20_4 - neg_f_59_low60_40_low20_4,
    r_99_104 * (const 64 2) = r_99_103 - u_99_103,
    s_99_104 * (const 64 2) = s_99_103 - v_99_103
;

assume
    neg_f_59_low60_40_low20_5 = neg_g_59_low60_40_low20_4,
    u_99_104 = r_99_103,
    v_99_104 = s_99_103,
    neg_g_59_low60_40_low20_5 * 2 = neg_g_59_low60_40_low20_4 - neg_f_59_low60_40_low20_4,
    r_99_104 * 2 = r_99_103 - u_99_103,
    s_99_104 * 2 = s_99_103 - v_99_103
&&
    true
;

{
    u_99_104 * neg_f_59_low60_40_low20_0 + v_99_104 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_104 * neg_f_59_low60_40_low20_0 + s_99_104 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_5 + u_99_104 * (const 64 (2**21)) + v_99_104 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_5 + r_99_104 * (const 64 (2**21)) + s_99_104 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_5,
    neg_f_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_5,
    neg_g_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 104)) <=s delta, delta <=s (const 64 (1 + 2*104)),
    (const 64 (-(2**20))) <=s u_99_104, u_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_104, v_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_104, r_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_104, s_99_104 <=s (const 64 ((2**20)-1)),
    u_99_104 + v_99_104 <=s (const 64 (2**20)),
    u_99_104 - v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 + v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 - v_99_104 <=s (const 64 (2**20)),
    r_99_104 + s_99_104 <=s (const 64 (2**20)),
    r_99_104 - s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 + s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 - s_99_104 <=s (const 64 (2**20)),
    u_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_99_104 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_104_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_5,
sint64 neg_g_59_low60_40_low20_5,
sint64 neg_f_59_low60_40_low20_6,
sint64 neg_g_59_low60_40_low20_6,
sint64 u_99_104,
sint64 v_99_104,
sint64 r_99_104,
sint64 s_99_104,
sint64 u_99_105,
sint64 v_99_105,
sint64 r_99_105,
sint64 s_99_105,
bit ne
)={
    u_99_104 * neg_f_59_low60_40_low20_0 + v_99_104 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_5 * (-(2**20)),
    r_99_104 * neg_f_59_low60_40_low20_0 + s_99_104 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_5 * (-(2**20))
&&
    u_99_104 * neg_f_59_low60_40_low20_0 + v_99_104 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_5 * (const 64 (-(2**20))),
    r_99_104 * neg_f_59_low60_40_low20_0 + s_99_104 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_5 + u_99_104 * (const 64 (2**21)) + v_99_104 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_5 + r_99_104 * (const 64 (2**21)) + s_99_104 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_5,
    neg_f_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_5,
    neg_g_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 104)) <=s delta, delta <=s (const 64 (1 + 2*104)),
    (const 64 (-(2**20))) <=s u_99_104, u_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_104, v_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_104, r_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_104, s_99_104 <=s (const 64 ((2**20)-1)),
    u_99_104 + v_99_104 <=s (const 64 (2**20)),
    u_99_104 - v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 + v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 - v_99_104 <=s (const 64 (2**20)),
    r_99_104 + s_99_104 <=s (const 64 (2**20)),
    r_99_104 - s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 + s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 - s_99_104 <=s (const 64 (2**20)),
    u_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_99_104 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step104

// premise a
assume
neg_g_59_low60_40_low20_5 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_6 neg_f_59_low60_40_low20_5;
mov u_99_105 u_99_104;
mov v_99_105 v_99_104;

asr neg_g_59_low60_40_low20_6 neg_g_59_low60_40_low20_5 1;
asr r_99_105 r_99_104 1;
asr s_99_105 s_99_104 1;
assert
    true
&&
    neg_f_59_low60_40_low20_6 = neg_f_59_low60_40_low20_5,
    u_99_105 = u_99_104,
    v_99_105 = v_99_104,
    neg_g_59_low60_40_low20_6 * (const 64 2) = neg_g_59_low60_40_low20_5,
    r_99_105 * (const 64 2) = r_99_104,
    s_99_105 * (const 64 2) = s_99_104
;

assume
    neg_f_59_low60_40_low20_6 = neg_f_59_low60_40_low20_5,
    u_99_105 = u_99_104,
    v_99_105 = v_99_104,
    neg_g_59_low60_40_low20_6 * 2 = neg_g_59_low60_40_low20_5,
    r_99_105 * 2 = r_99_104,
    s_99_105 * 2 = s_99_104
&&
    true
;

{
    u_99_105 * neg_f_59_low60_40_low20_0 + v_99_105 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_105 * neg_f_59_low60_40_low20_0 + s_99_105 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_6 + u_99_105 * (const 64 (2**21)) + v_99_105 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_6 + r_99_105 * (const 64 (2**21)) + s_99_105 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_6,
    neg_f_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_6,
    neg_g_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 105)) <=s delta, delta <=s (const 64 (1 + 2*105)),
    (const 64 (-(2**20))) <=s u_99_105, u_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_105, v_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_105, r_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_105, s_99_105 <=s (const 64 ((2**20)-1)),
    u_99_105 + v_99_105 <=s (const 64 (2**20)),
    u_99_105 - v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 + v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 - v_99_105 <=s (const 64 (2**20)),
    r_99_105 + s_99_105 <=s (const 64 (2**20)),
    r_99_105 - s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 + s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 - s_99_105 <=s (const 64 (2**20)),
    u_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_99_105 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_104_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_5,
sint64 neg_g_59_low60_40_low20_5,
sint64 neg_f_59_low60_40_low20_6,
sint64 neg_g_59_low60_40_low20_6,
sint64 u_99_104,
sint64 v_99_104,
sint64 r_99_104,
sint64 s_99_104,
sint64 u_99_105,
sint64 v_99_105,
sint64 r_99_105,
sint64 s_99_105,
bit ne
)={
    u_99_104 * neg_f_59_low60_40_low20_0 + v_99_104 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_5 * (-(2**20)),
    r_99_104 * neg_f_59_low60_40_low20_0 + s_99_104 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_5 * (-(2**20))
&&
    u_99_104 * neg_f_59_low60_40_low20_0 + v_99_104 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_5 * (const 64 (-(2**20))),
    r_99_104 * neg_f_59_low60_40_low20_0 + s_99_104 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_5 + u_99_104 * (const 64 (2**21)) + v_99_104 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_5 + r_99_104 * (const 64 (2**21)) + s_99_104 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_5,
    neg_f_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_5,
    neg_g_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 104)) <=s delta, delta <=s (const 64 (1 + 2*104)),
    (const 64 (-(2**20))) <=s u_99_104, u_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_104, v_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_104, r_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_104, s_99_104 <=s (const 64 ((2**20)-1)),
    u_99_104 + v_99_104 <=s (const 64 (2**20)),
    u_99_104 - v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 + v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 - v_99_104 <=s (const 64 (2**20)),
    r_99_104 + s_99_104 <=s (const 64 (2**20)),
    r_99_104 - s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 + s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 - s_99_104 <=s (const 64 (2**20)),
    u_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_99_104 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step104

// premise b
assume
neg_g_59_low60_40_low20_5 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_6 neg_f_59_low60_40_low20_5;
mov u_99_105 u_99_104;
mov v_99_105 v_99_104;

add neg_g_59_low60_40_low20_6 neg_g_59_low60_40_low20_5 neg_f_59_low60_40_low20_5;
asr neg_g_59_low60_40_low20_6 neg_g_59_low60_40_low20_6 1;
add r_99_105 r_99_104 u_99_104;
asr r_99_105 r_99_105 1;
add s_99_105 s_99_104 v_99_104;
asr s_99_105 s_99_105 1;
assert
    true
&&
    neg_f_59_low60_40_low20_6 = neg_f_59_low60_40_low20_5,
    u_99_105 = u_99_104,
    v_99_105 = v_99_104,
    neg_g_59_low60_40_low20_6 * (const 64 2) = neg_g_59_low60_40_low20_5 + neg_f_59_low60_40_low20_5,
    r_99_105 * (const 64 2) = r_99_104 + u_99_104,
    s_99_105 * (const 64 2) = s_99_104 + v_99_104
;

assume
    neg_f_59_low60_40_low20_6 = neg_f_59_low60_40_low20_5,
    u_99_105 = u_99_104,
    v_99_105 = v_99_104,
    neg_g_59_low60_40_low20_6 * 2 = neg_g_59_low60_40_low20_5 + neg_f_59_low60_40_low20_5,
    r_99_105 * 2 = r_99_104 + u_99_104,
    s_99_105 * 2 = s_99_104 + v_99_104
&&
    true
;

{
    u_99_105 * neg_f_59_low60_40_low20_0 + v_99_105 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_105 * neg_f_59_low60_40_low20_0 + s_99_105 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_6 + u_99_105 * (const 64 (2**21)) + v_99_105 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_6 + r_99_105 * (const 64 (2**21)) + s_99_105 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_6,
    neg_f_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_6,
    neg_g_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 105)) <=s delta, delta <=s (const 64 (1 + 2*105)),
    (const 64 (-(2**20))) <=s u_99_105, u_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_105, v_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_105, r_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_105, s_99_105 <=s (const 64 ((2**20)-1)),
    u_99_105 + v_99_105 <=s (const 64 (2**20)),
    u_99_105 - v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 + v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 - v_99_105 <=s (const 64 (2**20)),
    r_99_105 + s_99_105 <=s (const 64 (2**20)),
    r_99_105 - s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 + s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 - s_99_105 <=s (const 64 (2**20)),
    u_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_99_105 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_104_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_5,
sint64 neg_g_59_low60_40_low20_5,
sint64 neg_f_59_low60_40_low20_6,
sint64 neg_g_59_low60_40_low20_6,
sint64 u_99_104,
sint64 v_99_104,
sint64 r_99_104,
sint64 s_99_104,
sint64 u_99_105,
sint64 v_99_105,
sint64 r_99_105,
sint64 s_99_105,
bit ne
)={
    u_99_104 * neg_f_59_low60_40_low20_0 + v_99_104 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_5 * (-(2**20)),
    r_99_104 * neg_f_59_low60_40_low20_0 + s_99_104 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_5 * (-(2**20))
&&
    u_99_104 * neg_f_59_low60_40_low20_0 + v_99_104 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_5 * (const 64 (-(2**20))),
    r_99_104 * neg_f_59_low60_40_low20_0 + s_99_104 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_5 + u_99_104 * (const 64 (2**21)) + v_99_104 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_5 + r_99_104 * (const 64 (2**21)) + s_99_104 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_5,
    neg_f_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_5,
    neg_g_59_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 104)) <=s delta, delta <=s (const 64 (1 + 2*104)),
    (const 64 (-(2**20))) <=s u_99_104, u_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_104, v_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_104, r_99_104 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_104, s_99_104 <=s (const 64 ((2**20)-1)),
    u_99_104 + v_99_104 <=s (const 64 (2**20)),
    u_99_104 - v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 + v_99_104 <=s (const 64 (2**20)),
    (const 64 0) - u_99_104 - v_99_104 <=s (const 64 (2**20)),
    r_99_104 + s_99_104 <=s (const 64 (2**20)),
    r_99_104 - s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 + s_99_104 <=s (const 64 (2**20)),
    (const 64 0) - r_99_104 - s_99_104 <=s (const 64 (2**20)),
    u_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_99_104 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_99_104 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step104

// premise c
assume
neg_g_59_low60_40_low20_5 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_6 neg_g_59_low60_40_low20_5;
mov u_99_105 r_99_104;
mov v_99_105 s_99_104;

subs dc neg_g_59_low60_40_low20_6 neg_g_59_low60_40_low20_5 neg_f_59_low60_40_low20_5;
asr neg_g_59_low60_40_low20_6 neg_g_59_low60_40_low20_6 1;
subs dc r_99_105 r_99_104 u_99_104;
asr r_99_105 r_99_105 1;
subs dc s_99_105 s_99_104 v_99_104;
asr s_99_105 s_99_105 1;
assert
    true
&&
    neg_f_59_low60_40_low20_6 = neg_g_59_low60_40_low20_5,
    u_99_105 = r_99_104,
    v_99_105 = s_99_104,
    neg_g_59_low60_40_low20_6 * (const 64 2) = neg_g_59_low60_40_low20_5 - neg_f_59_low60_40_low20_5,
    r_99_105 * (const 64 2) = r_99_104 - u_99_104,
    s_99_105 * (const 64 2) = s_99_104 - v_99_104
;

assume
    neg_f_59_low60_40_low20_6 = neg_g_59_low60_40_low20_5,
    u_99_105 = r_99_104,
    v_99_105 = s_99_104,
    neg_g_59_low60_40_low20_6 * 2 = neg_g_59_low60_40_low20_5 - neg_f_59_low60_40_low20_5,
    r_99_105 * 2 = r_99_104 - u_99_104,
    s_99_105 * 2 = s_99_104 - v_99_104
&&
    true
;

{
    u_99_105 * neg_f_59_low60_40_low20_0 + v_99_105 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_105 * neg_f_59_low60_40_low20_0 + s_99_105 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_6 + u_99_105 * (const 64 (2**21)) + v_99_105 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_6 + r_99_105 * (const 64 (2**21)) + s_99_105 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_6,
    neg_f_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_6,
    neg_g_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 105)) <=s delta, delta <=s (const 64 (1 + 2*105)),
    (const 64 (-(2**20))) <=s u_99_105, u_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_105, v_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_105, r_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_105, s_99_105 <=s (const 64 ((2**20)-1)),
    u_99_105 + v_99_105 <=s (const 64 (2**20)),
    u_99_105 - v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 + v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 - v_99_105 <=s (const 64 (2**20)),
    r_99_105 + s_99_105 <=s (const 64 (2**20)),
    r_99_105 - s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 + s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 - s_99_105 <=s (const 64 (2**20)),
    u_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_99_105 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_105_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_6,
sint64 neg_g_59_low60_40_low20_6,
sint64 neg_f_59_low60_40_low20_7,
sint64 neg_g_59_low60_40_low20_7,
sint64 u_99_105,
sint64 v_99_105,
sint64 r_99_105,
sint64 s_99_105,
sint64 u_99_106,
sint64 v_99_106,
sint64 r_99_106,
sint64 s_99_106,
bit ne
)={
    u_99_105 * neg_f_59_low60_40_low20_0 + v_99_105 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_6 * (-(2**20)),
    r_99_105 * neg_f_59_low60_40_low20_0 + s_99_105 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_6 * (-(2**20))
&&
    u_99_105 * neg_f_59_low60_40_low20_0 + v_99_105 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_6 * (const 64 (-(2**20))),
    r_99_105 * neg_f_59_low60_40_low20_0 + s_99_105 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_6 + u_99_105 * (const 64 (2**21)) + v_99_105 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_6 + r_99_105 * (const 64 (2**21)) + s_99_105 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_6,
    neg_f_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_6,
    neg_g_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 105)) <=s delta, delta <=s (const 64 (1 + 2*105)),
    (const 64 (-(2**20))) <=s u_99_105, u_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_105, v_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_105, r_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_105, s_99_105 <=s (const 64 ((2**20)-1)),
    u_99_105 + v_99_105 <=s (const 64 (2**20)),
    u_99_105 - v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 + v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 - v_99_105 <=s (const 64 (2**20)),
    r_99_105 + s_99_105 <=s (const 64 (2**20)),
    r_99_105 - s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 + s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 - s_99_105 <=s (const 64 (2**20)),
    u_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_99_105 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step105

// premise a
assume
neg_g_59_low60_40_low20_6 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_7 neg_f_59_low60_40_low20_6;
mov u_99_106 u_99_105;
mov v_99_106 v_99_105;

asr neg_g_59_low60_40_low20_7 neg_g_59_low60_40_low20_6 1;
asr r_99_106 r_99_105 1;
asr s_99_106 s_99_105 1;
assert
    true
&&
    neg_f_59_low60_40_low20_7 = neg_f_59_low60_40_low20_6,
    u_99_106 = u_99_105,
    v_99_106 = v_99_105,
    neg_g_59_low60_40_low20_7 * (const 64 2) = neg_g_59_low60_40_low20_6,
    r_99_106 * (const 64 2) = r_99_105,
    s_99_106 * (const 64 2) = s_99_105
;

assume
    neg_f_59_low60_40_low20_7 = neg_f_59_low60_40_low20_6,
    u_99_106 = u_99_105,
    v_99_106 = v_99_105,
    neg_g_59_low60_40_low20_7 * 2 = neg_g_59_low60_40_low20_6,
    r_99_106 * 2 = r_99_105,
    s_99_106 * 2 = s_99_105
&&
    true
;

{
    u_99_106 * neg_f_59_low60_40_low20_0 + v_99_106 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_106 * neg_f_59_low60_40_low20_0 + s_99_106 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_7 + u_99_106 * (const 64 (2**21)) + v_99_106 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_7 + r_99_106 * (const 64 (2**21)) + s_99_106 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_7,
    neg_f_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_7,
    neg_g_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 106)) <=s delta, delta <=s (const 64 (1 + 2*106)),
    (const 64 (-(2**20))) <=s u_99_106, u_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_106, v_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_106, r_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_106, s_99_106 <=s (const 64 ((2**20)-1)),
    u_99_106 + v_99_106 <=s (const 64 (2**20)),
    u_99_106 - v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 + v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 - v_99_106 <=s (const 64 (2**20)),
    r_99_106 + s_99_106 <=s (const 64 (2**20)),
    r_99_106 - s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 + s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 - s_99_106 <=s (const 64 (2**20)),
    u_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_99_106 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_105_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_6,
sint64 neg_g_59_low60_40_low20_6,
sint64 neg_f_59_low60_40_low20_7,
sint64 neg_g_59_low60_40_low20_7,
sint64 u_99_105,
sint64 v_99_105,
sint64 r_99_105,
sint64 s_99_105,
sint64 u_99_106,
sint64 v_99_106,
sint64 r_99_106,
sint64 s_99_106,
bit ne
)={
    u_99_105 * neg_f_59_low60_40_low20_0 + v_99_105 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_6 * (-(2**20)),
    r_99_105 * neg_f_59_low60_40_low20_0 + s_99_105 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_6 * (-(2**20))
&&
    u_99_105 * neg_f_59_low60_40_low20_0 + v_99_105 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_6 * (const 64 (-(2**20))),
    r_99_105 * neg_f_59_low60_40_low20_0 + s_99_105 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_6 + u_99_105 * (const 64 (2**21)) + v_99_105 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_6 + r_99_105 * (const 64 (2**21)) + s_99_105 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_6,
    neg_f_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_6,
    neg_g_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 105)) <=s delta, delta <=s (const 64 (1 + 2*105)),
    (const 64 (-(2**20))) <=s u_99_105, u_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_105, v_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_105, r_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_105, s_99_105 <=s (const 64 ((2**20)-1)),
    u_99_105 + v_99_105 <=s (const 64 (2**20)),
    u_99_105 - v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 + v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 - v_99_105 <=s (const 64 (2**20)),
    r_99_105 + s_99_105 <=s (const 64 (2**20)),
    r_99_105 - s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 + s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 - s_99_105 <=s (const 64 (2**20)),
    u_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_99_105 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step105

// premise b
assume
neg_g_59_low60_40_low20_6 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_7 neg_f_59_low60_40_low20_6;
mov u_99_106 u_99_105;
mov v_99_106 v_99_105;

add neg_g_59_low60_40_low20_7 neg_g_59_low60_40_low20_6 neg_f_59_low60_40_low20_6;
asr neg_g_59_low60_40_low20_7 neg_g_59_low60_40_low20_7 1;
add r_99_106 r_99_105 u_99_105;
asr r_99_106 r_99_106 1;
add s_99_106 s_99_105 v_99_105;
asr s_99_106 s_99_106 1;
assert
    true
&&
    neg_f_59_low60_40_low20_7 = neg_f_59_low60_40_low20_6,
    u_99_106 = u_99_105,
    v_99_106 = v_99_105,
    neg_g_59_low60_40_low20_7 * (const 64 2) = neg_g_59_low60_40_low20_6 + neg_f_59_low60_40_low20_6,
    r_99_106 * (const 64 2) = r_99_105 + u_99_105,
    s_99_106 * (const 64 2) = s_99_105 + v_99_105
;

assume
    neg_f_59_low60_40_low20_7 = neg_f_59_low60_40_low20_6,
    u_99_106 = u_99_105,
    v_99_106 = v_99_105,
    neg_g_59_low60_40_low20_7 * 2 = neg_g_59_low60_40_low20_6 + neg_f_59_low60_40_low20_6,
    r_99_106 * 2 = r_99_105 + u_99_105,
    s_99_106 * 2 = s_99_105 + v_99_105
&&
    true
;

{
    u_99_106 * neg_f_59_low60_40_low20_0 + v_99_106 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_106 * neg_f_59_low60_40_low20_0 + s_99_106 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_7 + u_99_106 * (const 64 (2**21)) + v_99_106 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_7 + r_99_106 * (const 64 (2**21)) + s_99_106 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_7,
    neg_f_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_7,
    neg_g_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 106)) <=s delta, delta <=s (const 64 (1 + 2*106)),
    (const 64 (-(2**20))) <=s u_99_106, u_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_106, v_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_106, r_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_106, s_99_106 <=s (const 64 ((2**20)-1)),
    u_99_106 + v_99_106 <=s (const 64 (2**20)),
    u_99_106 - v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 + v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 - v_99_106 <=s (const 64 (2**20)),
    r_99_106 + s_99_106 <=s (const 64 (2**20)),
    r_99_106 - s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 + s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 - s_99_106 <=s (const 64 (2**20)),
    u_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_99_106 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_105_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_6,
sint64 neg_g_59_low60_40_low20_6,
sint64 neg_f_59_low60_40_low20_7,
sint64 neg_g_59_low60_40_low20_7,
sint64 u_99_105,
sint64 v_99_105,
sint64 r_99_105,
sint64 s_99_105,
sint64 u_99_106,
sint64 v_99_106,
sint64 r_99_106,
sint64 s_99_106,
bit ne
)={
    u_99_105 * neg_f_59_low60_40_low20_0 + v_99_105 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_6 * (-(2**20)),
    r_99_105 * neg_f_59_low60_40_low20_0 + s_99_105 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_6 * (-(2**20))
&&
    u_99_105 * neg_f_59_low60_40_low20_0 + v_99_105 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_6 * (const 64 (-(2**20))),
    r_99_105 * neg_f_59_low60_40_low20_0 + s_99_105 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_6 + u_99_105 * (const 64 (2**21)) + v_99_105 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_6 + r_99_105 * (const 64 (2**21)) + s_99_105 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_6,
    neg_f_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_6,
    neg_g_59_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 105)) <=s delta, delta <=s (const 64 (1 + 2*105)),
    (const 64 (-(2**20))) <=s u_99_105, u_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_105, v_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_105, r_99_105 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_105, s_99_105 <=s (const 64 ((2**20)-1)),
    u_99_105 + v_99_105 <=s (const 64 (2**20)),
    u_99_105 - v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 + v_99_105 <=s (const 64 (2**20)),
    (const 64 0) - u_99_105 - v_99_105 <=s (const 64 (2**20)),
    r_99_105 + s_99_105 <=s (const 64 (2**20)),
    r_99_105 - s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 + s_99_105 <=s (const 64 (2**20)),
    (const 64 0) - r_99_105 - s_99_105 <=s (const 64 (2**20)),
    u_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_99_105 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_99_105 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step105

// premise c
assume
neg_g_59_low60_40_low20_6 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_7 neg_g_59_low60_40_low20_6;
mov u_99_106 r_99_105;
mov v_99_106 s_99_105;

subs dc neg_g_59_low60_40_low20_7 neg_g_59_low60_40_low20_6 neg_f_59_low60_40_low20_6;
asr neg_g_59_low60_40_low20_7 neg_g_59_low60_40_low20_7 1;
subs dc r_99_106 r_99_105 u_99_105;
asr r_99_106 r_99_106 1;
subs dc s_99_106 s_99_105 v_99_105;
asr s_99_106 s_99_106 1;
assert
    true
&&
    neg_f_59_low60_40_low20_7 = neg_g_59_low60_40_low20_6,
    u_99_106 = r_99_105,
    v_99_106 = s_99_105,
    neg_g_59_low60_40_low20_7 * (const 64 2) = neg_g_59_low60_40_low20_6 - neg_f_59_low60_40_low20_6,
    r_99_106 * (const 64 2) = r_99_105 - u_99_105,
    s_99_106 * (const 64 2) = s_99_105 - v_99_105
;

assume
    neg_f_59_low60_40_low20_7 = neg_g_59_low60_40_low20_6,
    u_99_106 = r_99_105,
    v_99_106 = s_99_105,
    neg_g_59_low60_40_low20_7 * 2 = neg_g_59_low60_40_low20_6 - neg_f_59_low60_40_low20_6,
    r_99_106 * 2 = r_99_105 - u_99_105,
    s_99_106 * 2 = s_99_105 - v_99_105
&&
    true
;

{
    u_99_106 * neg_f_59_low60_40_low20_0 + v_99_106 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_106 * neg_f_59_low60_40_low20_0 + s_99_106 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_7 + u_99_106 * (const 64 (2**21)) + v_99_106 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_7 + r_99_106 * (const 64 (2**21)) + s_99_106 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_7,
    neg_f_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_7,
    neg_g_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 106)) <=s delta, delta <=s (const 64 (1 + 2*106)),
    (const 64 (-(2**20))) <=s u_99_106, u_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_106, v_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_106, r_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_106, s_99_106 <=s (const 64 ((2**20)-1)),
    u_99_106 + v_99_106 <=s (const 64 (2**20)),
    u_99_106 - v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 + v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 - v_99_106 <=s (const 64 (2**20)),
    r_99_106 + s_99_106 <=s (const 64 (2**20)),
    r_99_106 - s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 + s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 - s_99_106 <=s (const 64 (2**20)),
    u_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_99_106 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_106_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_7,
sint64 neg_g_59_low60_40_low20_7,
sint64 neg_f_59_low60_40_low20_8,
sint64 neg_g_59_low60_40_low20_8,
sint64 u_99_106,
sint64 v_99_106,
sint64 r_99_106,
sint64 s_99_106,
sint64 u_99_107,
sint64 v_99_107,
sint64 r_99_107,
sint64 s_99_107,
bit ne
)={
    u_99_106 * neg_f_59_low60_40_low20_0 + v_99_106 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_7 * (-(2**20)),
    r_99_106 * neg_f_59_low60_40_low20_0 + s_99_106 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_7 * (-(2**20))
&&
    u_99_106 * neg_f_59_low60_40_low20_0 + v_99_106 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_7 * (const 64 (-(2**20))),
    r_99_106 * neg_f_59_low60_40_low20_0 + s_99_106 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_7 + u_99_106 * (const 64 (2**21)) + v_99_106 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_7 + r_99_106 * (const 64 (2**21)) + s_99_106 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_7,
    neg_f_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_7,
    neg_g_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 106)) <=s delta, delta <=s (const 64 (1 + 2*106)),
    (const 64 (-(2**20))) <=s u_99_106, u_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_106, v_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_106, r_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_106, s_99_106 <=s (const 64 ((2**20)-1)),
    u_99_106 + v_99_106 <=s (const 64 (2**20)),
    u_99_106 - v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 + v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 - v_99_106 <=s (const 64 (2**20)),
    r_99_106 + s_99_106 <=s (const 64 (2**20)),
    r_99_106 - s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 + s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 - s_99_106 <=s (const 64 (2**20)),
    u_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_99_106 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step106

// premise a
assume
neg_g_59_low60_40_low20_7 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_8 neg_f_59_low60_40_low20_7;
mov u_99_107 u_99_106;
mov v_99_107 v_99_106;

asr neg_g_59_low60_40_low20_8 neg_g_59_low60_40_low20_7 1;
asr r_99_107 r_99_106 1;
asr s_99_107 s_99_106 1;
assert
    true
&&
    neg_f_59_low60_40_low20_8 = neg_f_59_low60_40_low20_7,
    u_99_107 = u_99_106,
    v_99_107 = v_99_106,
    neg_g_59_low60_40_low20_8 * (const 64 2) = neg_g_59_low60_40_low20_7,
    r_99_107 * (const 64 2) = r_99_106,
    s_99_107 * (const 64 2) = s_99_106
;

assume
    neg_f_59_low60_40_low20_8 = neg_f_59_low60_40_low20_7,
    u_99_107 = u_99_106,
    v_99_107 = v_99_106,
    neg_g_59_low60_40_low20_8 * 2 = neg_g_59_low60_40_low20_7,
    r_99_107 * 2 = r_99_106,
    s_99_107 * 2 = s_99_106
&&
    true
;

{
    u_99_107 * neg_f_59_low60_40_low20_0 + v_99_107 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_107 * neg_f_59_low60_40_low20_0 + s_99_107 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_8 + u_99_107 * (const 64 (2**21)) + v_99_107 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_8 + r_99_107 * (const 64 (2**21)) + s_99_107 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_8,
    neg_f_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_8,
    neg_g_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 107)) <=s delta, delta <=s (const 64 (1 + 2*107)),
    (const 64 (-(2**20))) <=s u_99_107, u_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_107, v_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_107, r_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_107, s_99_107 <=s (const 64 ((2**20)-1)),
    u_99_107 + v_99_107 <=s (const 64 (2**20)),
    u_99_107 - v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 + v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 - v_99_107 <=s (const 64 (2**20)),
    r_99_107 + s_99_107 <=s (const 64 (2**20)),
    r_99_107 - s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 + s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 - s_99_107 <=s (const 64 (2**20)),
    u_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_99_107 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_106_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_7,
sint64 neg_g_59_low60_40_low20_7,
sint64 neg_f_59_low60_40_low20_8,
sint64 neg_g_59_low60_40_low20_8,
sint64 u_99_106,
sint64 v_99_106,
sint64 r_99_106,
sint64 s_99_106,
sint64 u_99_107,
sint64 v_99_107,
sint64 r_99_107,
sint64 s_99_107,
bit ne
)={
    u_99_106 * neg_f_59_low60_40_low20_0 + v_99_106 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_7 * (-(2**20)),
    r_99_106 * neg_f_59_low60_40_low20_0 + s_99_106 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_7 * (-(2**20))
&&
    u_99_106 * neg_f_59_low60_40_low20_0 + v_99_106 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_7 * (const 64 (-(2**20))),
    r_99_106 * neg_f_59_low60_40_low20_0 + s_99_106 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_7 + u_99_106 * (const 64 (2**21)) + v_99_106 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_7 + r_99_106 * (const 64 (2**21)) + s_99_106 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_7,
    neg_f_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_7,
    neg_g_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 106)) <=s delta, delta <=s (const 64 (1 + 2*106)),
    (const 64 (-(2**20))) <=s u_99_106, u_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_106, v_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_106, r_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_106, s_99_106 <=s (const 64 ((2**20)-1)),
    u_99_106 + v_99_106 <=s (const 64 (2**20)),
    u_99_106 - v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 + v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 - v_99_106 <=s (const 64 (2**20)),
    r_99_106 + s_99_106 <=s (const 64 (2**20)),
    r_99_106 - s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 + s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 - s_99_106 <=s (const 64 (2**20)),
    u_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_99_106 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step106

// premise b
assume
neg_g_59_low60_40_low20_7 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_8 neg_f_59_low60_40_low20_7;
mov u_99_107 u_99_106;
mov v_99_107 v_99_106;

add neg_g_59_low60_40_low20_8 neg_g_59_low60_40_low20_7 neg_f_59_low60_40_low20_7;
asr neg_g_59_low60_40_low20_8 neg_g_59_low60_40_low20_8 1;
add r_99_107 r_99_106 u_99_106;
asr r_99_107 r_99_107 1;
add s_99_107 s_99_106 v_99_106;
asr s_99_107 s_99_107 1;
assert
    true
&&
    neg_f_59_low60_40_low20_8 = neg_f_59_low60_40_low20_7,
    u_99_107 = u_99_106,
    v_99_107 = v_99_106,
    neg_g_59_low60_40_low20_8 * (const 64 2) = neg_g_59_low60_40_low20_7 + neg_f_59_low60_40_low20_7,
    r_99_107 * (const 64 2) = r_99_106 + u_99_106,
    s_99_107 * (const 64 2) = s_99_106 + v_99_106
;

assume
    neg_f_59_low60_40_low20_8 = neg_f_59_low60_40_low20_7,
    u_99_107 = u_99_106,
    v_99_107 = v_99_106,
    neg_g_59_low60_40_low20_8 * 2 = neg_g_59_low60_40_low20_7 + neg_f_59_low60_40_low20_7,
    r_99_107 * 2 = r_99_106 + u_99_106,
    s_99_107 * 2 = s_99_106 + v_99_106
&&
    true
;

{
    u_99_107 * neg_f_59_low60_40_low20_0 + v_99_107 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_107 * neg_f_59_low60_40_low20_0 + s_99_107 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_8 + u_99_107 * (const 64 (2**21)) + v_99_107 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_8 + r_99_107 * (const 64 (2**21)) + s_99_107 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_8,
    neg_f_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_8,
    neg_g_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 107)) <=s delta, delta <=s (const 64 (1 + 2*107)),
    (const 64 (-(2**20))) <=s u_99_107, u_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_107, v_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_107, r_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_107, s_99_107 <=s (const 64 ((2**20)-1)),
    u_99_107 + v_99_107 <=s (const 64 (2**20)),
    u_99_107 - v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 + v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 - v_99_107 <=s (const 64 (2**20)),
    r_99_107 + s_99_107 <=s (const 64 (2**20)),
    r_99_107 - s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 + s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 - s_99_107 <=s (const 64 (2**20)),
    u_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_99_107 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_106_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_7,
sint64 neg_g_59_low60_40_low20_7,
sint64 neg_f_59_low60_40_low20_8,
sint64 neg_g_59_low60_40_low20_8,
sint64 u_99_106,
sint64 v_99_106,
sint64 r_99_106,
sint64 s_99_106,
sint64 u_99_107,
sint64 v_99_107,
sint64 r_99_107,
sint64 s_99_107,
bit ne
)={
    u_99_106 * neg_f_59_low60_40_low20_0 + v_99_106 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_7 * (-(2**20)),
    r_99_106 * neg_f_59_low60_40_low20_0 + s_99_106 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_7 * (-(2**20))
&&
    u_99_106 * neg_f_59_low60_40_low20_0 + v_99_106 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_7 * (const 64 (-(2**20))),
    r_99_106 * neg_f_59_low60_40_low20_0 + s_99_106 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_7 + u_99_106 * (const 64 (2**21)) + v_99_106 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_7 + r_99_106 * (const 64 (2**21)) + s_99_106 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_7,
    neg_f_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_7,
    neg_g_59_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 106)) <=s delta, delta <=s (const 64 (1 + 2*106)),
    (const 64 (-(2**20))) <=s u_99_106, u_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_106, v_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_106, r_99_106 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_106, s_99_106 <=s (const 64 ((2**20)-1)),
    u_99_106 + v_99_106 <=s (const 64 (2**20)),
    u_99_106 - v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 + v_99_106 <=s (const 64 (2**20)),
    (const 64 0) - u_99_106 - v_99_106 <=s (const 64 (2**20)),
    r_99_106 + s_99_106 <=s (const 64 (2**20)),
    r_99_106 - s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 + s_99_106 <=s (const 64 (2**20)),
    (const 64 0) - r_99_106 - s_99_106 <=s (const 64 (2**20)),
    u_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_99_106 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_99_106 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step106

// premise c
assume
neg_g_59_low60_40_low20_7 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_8 neg_g_59_low60_40_low20_7;
mov u_99_107 r_99_106;
mov v_99_107 s_99_106;

subs dc neg_g_59_low60_40_low20_8 neg_g_59_low60_40_low20_7 neg_f_59_low60_40_low20_7;
asr neg_g_59_low60_40_low20_8 neg_g_59_low60_40_low20_8 1;
subs dc r_99_107 r_99_106 u_99_106;
asr r_99_107 r_99_107 1;
subs dc s_99_107 s_99_106 v_99_106;
asr s_99_107 s_99_107 1;
assert
    true
&&
    neg_f_59_low60_40_low20_8 = neg_g_59_low60_40_low20_7,
    u_99_107 = r_99_106,
    v_99_107 = s_99_106,
    neg_g_59_low60_40_low20_8 * (const 64 2) = neg_g_59_low60_40_low20_7 - neg_f_59_low60_40_low20_7,
    r_99_107 * (const 64 2) = r_99_106 - u_99_106,
    s_99_107 * (const 64 2) = s_99_106 - v_99_106
;

assume
    neg_f_59_low60_40_low20_8 = neg_g_59_low60_40_low20_7,
    u_99_107 = r_99_106,
    v_99_107 = s_99_106,
    neg_g_59_low60_40_low20_8 * 2 = neg_g_59_low60_40_low20_7 - neg_f_59_low60_40_low20_7,
    r_99_107 * 2 = r_99_106 - u_99_106,
    s_99_107 * 2 = s_99_106 - v_99_106
&&
    true
;

{
    u_99_107 * neg_f_59_low60_40_low20_0 + v_99_107 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_107 * neg_f_59_low60_40_low20_0 + s_99_107 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_8 + u_99_107 * (const 64 (2**21)) + v_99_107 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_8 + r_99_107 * (const 64 (2**21)) + s_99_107 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_8,
    neg_f_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_8,
    neg_g_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 107)) <=s delta, delta <=s (const 64 (1 + 2*107)),
    (const 64 (-(2**20))) <=s u_99_107, u_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_107, v_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_107, r_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_107, s_99_107 <=s (const 64 ((2**20)-1)),
    u_99_107 + v_99_107 <=s (const 64 (2**20)),
    u_99_107 - v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 + v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 - v_99_107 <=s (const 64 (2**20)),
    r_99_107 + s_99_107 <=s (const 64 (2**20)),
    r_99_107 - s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 + s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 - s_99_107 <=s (const 64 (2**20)),
    u_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_99_107 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_107_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_8,
sint64 neg_g_59_low60_40_low20_8,
sint64 neg_f_59_low60_40_low20_9,
sint64 neg_g_59_low60_40_low20_9,
sint64 u_99_107,
sint64 v_99_107,
sint64 r_99_107,
sint64 s_99_107,
sint64 u_99_108,
sint64 v_99_108,
sint64 r_99_108,
sint64 s_99_108,
bit ne
)={
    u_99_107 * neg_f_59_low60_40_low20_0 + v_99_107 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_8 * (-(2**20)),
    r_99_107 * neg_f_59_low60_40_low20_0 + s_99_107 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_8 * (-(2**20))
&&
    u_99_107 * neg_f_59_low60_40_low20_0 + v_99_107 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_8 * (const 64 (-(2**20))),
    r_99_107 * neg_f_59_low60_40_low20_0 + s_99_107 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_8 + u_99_107 * (const 64 (2**21)) + v_99_107 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_8 + r_99_107 * (const 64 (2**21)) + s_99_107 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_8,
    neg_f_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_8,
    neg_g_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 107)) <=s delta, delta <=s (const 64 (1 + 2*107)),
    (const 64 (-(2**20))) <=s u_99_107, u_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_107, v_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_107, r_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_107, s_99_107 <=s (const 64 ((2**20)-1)),
    u_99_107 + v_99_107 <=s (const 64 (2**20)),
    u_99_107 - v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 + v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 - v_99_107 <=s (const 64 (2**20)),
    r_99_107 + s_99_107 <=s (const 64 (2**20)),
    r_99_107 - s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 + s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 - s_99_107 <=s (const 64 (2**20)),
    u_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_99_107 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step107

// premise a
assume
neg_g_59_low60_40_low20_8 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_9 neg_f_59_low60_40_low20_8;
mov u_99_108 u_99_107;
mov v_99_108 v_99_107;

asr neg_g_59_low60_40_low20_9 neg_g_59_low60_40_low20_8 1;
asr r_99_108 r_99_107 1;
asr s_99_108 s_99_107 1;
assert
    true
&&
    neg_f_59_low60_40_low20_9 = neg_f_59_low60_40_low20_8,
    u_99_108 = u_99_107,
    v_99_108 = v_99_107,
    neg_g_59_low60_40_low20_9 * (const 64 2) = neg_g_59_low60_40_low20_8,
    r_99_108 * (const 64 2) = r_99_107,
    s_99_108 * (const 64 2) = s_99_107
;

assume
    neg_f_59_low60_40_low20_9 = neg_f_59_low60_40_low20_8,
    u_99_108 = u_99_107,
    v_99_108 = v_99_107,
    neg_g_59_low60_40_low20_9 * 2 = neg_g_59_low60_40_low20_8,
    r_99_108 * 2 = r_99_107,
    s_99_108 * 2 = s_99_107
&&
    true
;

{
    u_99_108 * neg_f_59_low60_40_low20_0 + v_99_108 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_108 * neg_f_59_low60_40_low20_0 + s_99_108 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_9 + u_99_108 * (const 64 (2**21)) + v_99_108 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_9 + r_99_108 * (const 64 (2**21)) + s_99_108 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_9,
    neg_f_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_9,
    neg_g_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 108)) <=s delta, delta <=s (const 64 (1 + 2*108)),
    (const 64 (-(2**20))) <=s u_99_108, u_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_108, v_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_108, r_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_108, s_99_108 <=s (const 64 ((2**20)-1)),
    u_99_108 + v_99_108 <=s (const 64 (2**20)),
    u_99_108 - v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 + v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 - v_99_108 <=s (const 64 (2**20)),
    r_99_108 + s_99_108 <=s (const 64 (2**20)),
    r_99_108 - s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 + s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 - s_99_108 <=s (const 64 (2**20)),
    u_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_99_108 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_107_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_8,
sint64 neg_g_59_low60_40_low20_8,
sint64 neg_f_59_low60_40_low20_9,
sint64 neg_g_59_low60_40_low20_9,
sint64 u_99_107,
sint64 v_99_107,
sint64 r_99_107,
sint64 s_99_107,
sint64 u_99_108,
sint64 v_99_108,
sint64 r_99_108,
sint64 s_99_108,
bit ne
)={
    u_99_107 * neg_f_59_low60_40_low20_0 + v_99_107 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_8 * (-(2**20)),
    r_99_107 * neg_f_59_low60_40_low20_0 + s_99_107 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_8 * (-(2**20))
&&
    u_99_107 * neg_f_59_low60_40_low20_0 + v_99_107 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_8 * (const 64 (-(2**20))),
    r_99_107 * neg_f_59_low60_40_low20_0 + s_99_107 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_8 + u_99_107 * (const 64 (2**21)) + v_99_107 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_8 + r_99_107 * (const 64 (2**21)) + s_99_107 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_8,
    neg_f_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_8,
    neg_g_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 107)) <=s delta, delta <=s (const 64 (1 + 2*107)),
    (const 64 (-(2**20))) <=s u_99_107, u_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_107, v_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_107, r_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_107, s_99_107 <=s (const 64 ((2**20)-1)),
    u_99_107 + v_99_107 <=s (const 64 (2**20)),
    u_99_107 - v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 + v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 - v_99_107 <=s (const 64 (2**20)),
    r_99_107 + s_99_107 <=s (const 64 (2**20)),
    r_99_107 - s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 + s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 - s_99_107 <=s (const 64 (2**20)),
    u_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_99_107 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step107

// premise b
assume
neg_g_59_low60_40_low20_8 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_9 neg_f_59_low60_40_low20_8;
mov u_99_108 u_99_107;
mov v_99_108 v_99_107;

add neg_g_59_low60_40_low20_9 neg_g_59_low60_40_low20_8 neg_f_59_low60_40_low20_8;
asr neg_g_59_low60_40_low20_9 neg_g_59_low60_40_low20_9 1;
add r_99_108 r_99_107 u_99_107;
asr r_99_108 r_99_108 1;
add s_99_108 s_99_107 v_99_107;
asr s_99_108 s_99_108 1;
assert
    true
&&
    neg_f_59_low60_40_low20_9 = neg_f_59_low60_40_low20_8,
    u_99_108 = u_99_107,
    v_99_108 = v_99_107,
    neg_g_59_low60_40_low20_9 * (const 64 2) = neg_g_59_low60_40_low20_8 + neg_f_59_low60_40_low20_8,
    r_99_108 * (const 64 2) = r_99_107 + u_99_107,
    s_99_108 * (const 64 2) = s_99_107 + v_99_107
;

assume
    neg_f_59_low60_40_low20_9 = neg_f_59_low60_40_low20_8,
    u_99_108 = u_99_107,
    v_99_108 = v_99_107,
    neg_g_59_low60_40_low20_9 * 2 = neg_g_59_low60_40_low20_8 + neg_f_59_low60_40_low20_8,
    r_99_108 * 2 = r_99_107 + u_99_107,
    s_99_108 * 2 = s_99_107 + v_99_107
&&
    true
;

{
    u_99_108 * neg_f_59_low60_40_low20_0 + v_99_108 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_108 * neg_f_59_low60_40_low20_0 + s_99_108 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_9 + u_99_108 * (const 64 (2**21)) + v_99_108 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_9 + r_99_108 * (const 64 (2**21)) + s_99_108 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_9,
    neg_f_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_9,
    neg_g_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 108)) <=s delta, delta <=s (const 64 (1 + 2*108)),
    (const 64 (-(2**20))) <=s u_99_108, u_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_108, v_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_108, r_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_108, s_99_108 <=s (const 64 ((2**20)-1)),
    u_99_108 + v_99_108 <=s (const 64 (2**20)),
    u_99_108 - v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 + v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 - v_99_108 <=s (const 64 (2**20)),
    r_99_108 + s_99_108 <=s (const 64 (2**20)),
    r_99_108 - s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 + s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 - s_99_108 <=s (const 64 (2**20)),
    u_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_99_108 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_107_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_8,
sint64 neg_g_59_low60_40_low20_8,
sint64 neg_f_59_low60_40_low20_9,
sint64 neg_g_59_low60_40_low20_9,
sint64 u_99_107,
sint64 v_99_107,
sint64 r_99_107,
sint64 s_99_107,
sint64 u_99_108,
sint64 v_99_108,
sint64 r_99_108,
sint64 s_99_108,
bit ne
)={
    u_99_107 * neg_f_59_low60_40_low20_0 + v_99_107 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_8 * (-(2**20)),
    r_99_107 * neg_f_59_low60_40_low20_0 + s_99_107 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_8 * (-(2**20))
&&
    u_99_107 * neg_f_59_low60_40_low20_0 + v_99_107 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_8 * (const 64 (-(2**20))),
    r_99_107 * neg_f_59_low60_40_low20_0 + s_99_107 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_8 + u_99_107 * (const 64 (2**21)) + v_99_107 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_8 + r_99_107 * (const 64 (2**21)) + s_99_107 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_8,
    neg_f_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_8,
    neg_g_59_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 107)) <=s delta, delta <=s (const 64 (1 + 2*107)),
    (const 64 (-(2**20))) <=s u_99_107, u_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_107, v_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_107, r_99_107 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_107, s_99_107 <=s (const 64 ((2**20)-1)),
    u_99_107 + v_99_107 <=s (const 64 (2**20)),
    u_99_107 - v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 + v_99_107 <=s (const 64 (2**20)),
    (const 64 0) - u_99_107 - v_99_107 <=s (const 64 (2**20)),
    r_99_107 + s_99_107 <=s (const 64 (2**20)),
    r_99_107 - s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 + s_99_107 <=s (const 64 (2**20)),
    (const 64 0) - r_99_107 - s_99_107 <=s (const 64 (2**20)),
    u_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_99_107 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_99_107 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step107

// premise c
assume
neg_g_59_low60_40_low20_8 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_9 neg_g_59_low60_40_low20_8;
mov u_99_108 r_99_107;
mov v_99_108 s_99_107;

subs dc neg_g_59_low60_40_low20_9 neg_g_59_low60_40_low20_8 neg_f_59_low60_40_low20_8;
asr neg_g_59_low60_40_low20_9 neg_g_59_low60_40_low20_9 1;
subs dc r_99_108 r_99_107 u_99_107;
asr r_99_108 r_99_108 1;
subs dc s_99_108 s_99_107 v_99_107;
asr s_99_108 s_99_108 1;
assert
    true
&&
    neg_f_59_low60_40_low20_9 = neg_g_59_low60_40_low20_8,
    u_99_108 = r_99_107,
    v_99_108 = s_99_107,
    neg_g_59_low60_40_low20_9 * (const 64 2) = neg_g_59_low60_40_low20_8 - neg_f_59_low60_40_low20_8,
    r_99_108 * (const 64 2) = r_99_107 - u_99_107,
    s_99_108 * (const 64 2) = s_99_107 - v_99_107
;

assume
    neg_f_59_low60_40_low20_9 = neg_g_59_low60_40_low20_8,
    u_99_108 = r_99_107,
    v_99_108 = s_99_107,
    neg_g_59_low60_40_low20_9 * 2 = neg_g_59_low60_40_low20_8 - neg_f_59_low60_40_low20_8,
    r_99_108 * 2 = r_99_107 - u_99_107,
    s_99_108 * 2 = s_99_107 - v_99_107
&&
    true
;

{
    u_99_108 * neg_f_59_low60_40_low20_0 + v_99_108 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_108 * neg_f_59_low60_40_low20_0 + s_99_108 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_9 + u_99_108 * (const 64 (2**21)) + v_99_108 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_9 + r_99_108 * (const 64 (2**21)) + s_99_108 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_9,
    neg_f_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_9,
    neg_g_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 108)) <=s delta, delta <=s (const 64 (1 + 2*108)),
    (const 64 (-(2**20))) <=s u_99_108, u_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_108, v_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_108, r_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_108, s_99_108 <=s (const 64 ((2**20)-1)),
    u_99_108 + v_99_108 <=s (const 64 (2**20)),
    u_99_108 - v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 + v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 - v_99_108 <=s (const 64 (2**20)),
    r_99_108 + s_99_108 <=s (const 64 (2**20)),
    r_99_108 - s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 + s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 - s_99_108 <=s (const 64 (2**20)),
    u_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_99_108 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_108_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_9,
sint64 neg_g_59_low60_40_low20_9,
sint64 neg_f_59_low60_40_low20_10,
sint64 neg_g_59_low60_40_low20_10,
sint64 u_99_108,
sint64 v_99_108,
sint64 r_99_108,
sint64 s_99_108,
sint64 u_99_109,
sint64 v_99_109,
sint64 r_99_109,
sint64 s_99_109,
bit ne
)={
    u_99_108 * neg_f_59_low60_40_low20_0 + v_99_108 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_9 * (-(2**20)),
    r_99_108 * neg_f_59_low60_40_low20_0 + s_99_108 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_9 * (-(2**20))
&&
    u_99_108 * neg_f_59_low60_40_low20_0 + v_99_108 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_9 * (const 64 (-(2**20))),
    r_99_108 * neg_f_59_low60_40_low20_0 + s_99_108 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_9 + u_99_108 * (const 64 (2**21)) + v_99_108 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_9 + r_99_108 * (const 64 (2**21)) + s_99_108 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_9,
    neg_f_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_9,
    neg_g_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 108)) <=s delta, delta <=s (const 64 (1 + 2*108)),
    (const 64 (-(2**20))) <=s u_99_108, u_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_108, v_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_108, r_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_108, s_99_108 <=s (const 64 ((2**20)-1)),
    u_99_108 + v_99_108 <=s (const 64 (2**20)),
    u_99_108 - v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 + v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 - v_99_108 <=s (const 64 (2**20)),
    r_99_108 + s_99_108 <=s (const 64 (2**20)),
    r_99_108 - s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 + s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 - s_99_108 <=s (const 64 (2**20)),
    u_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_99_108 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step108

// premise a
assume
neg_g_59_low60_40_low20_9 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_10 neg_f_59_low60_40_low20_9;
mov u_99_109 u_99_108;
mov v_99_109 v_99_108;

asr neg_g_59_low60_40_low20_10 neg_g_59_low60_40_low20_9 1;
asr r_99_109 r_99_108 1;
asr s_99_109 s_99_108 1;
assert
    true
&&
    neg_f_59_low60_40_low20_10 = neg_f_59_low60_40_low20_9,
    u_99_109 = u_99_108,
    v_99_109 = v_99_108,
    neg_g_59_low60_40_low20_10 * (const 64 2) = neg_g_59_low60_40_low20_9,
    r_99_109 * (const 64 2) = r_99_108,
    s_99_109 * (const 64 2) = s_99_108
;

assume
    neg_f_59_low60_40_low20_10 = neg_f_59_low60_40_low20_9,
    u_99_109 = u_99_108,
    v_99_109 = v_99_108,
    neg_g_59_low60_40_low20_10 * 2 = neg_g_59_low60_40_low20_9,
    r_99_109 * 2 = r_99_108,
    s_99_109 * 2 = s_99_108
&&
    true
;

{
    u_99_109 * neg_f_59_low60_40_low20_0 + v_99_109 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_109 * neg_f_59_low60_40_low20_0 + s_99_109 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_10 + u_99_109 * (const 64 (2**21)) + v_99_109 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_10 + r_99_109 * (const 64 (2**21)) + s_99_109 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_10,
    neg_f_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_10,
    neg_g_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 109)) <=s delta, delta <=s (const 64 (1 + 2*109)),
    (const 64 (-(2**20))) <=s u_99_109, u_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_109, v_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_109, r_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_109, s_99_109 <=s (const 64 ((2**20)-1)),
    u_99_109 + v_99_109 <=s (const 64 (2**20)),
    u_99_109 - v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 + v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 - v_99_109 <=s (const 64 (2**20)),
    r_99_109 + s_99_109 <=s (const 64 (2**20)),
    r_99_109 - s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 + s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 - s_99_109 <=s (const 64 (2**20)),
    u_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_99_109 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_108_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_9,
sint64 neg_g_59_low60_40_low20_9,
sint64 neg_f_59_low60_40_low20_10,
sint64 neg_g_59_low60_40_low20_10,
sint64 u_99_108,
sint64 v_99_108,
sint64 r_99_108,
sint64 s_99_108,
sint64 u_99_109,
sint64 v_99_109,
sint64 r_99_109,
sint64 s_99_109,
bit ne
)={
    u_99_108 * neg_f_59_low60_40_low20_0 + v_99_108 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_9 * (-(2**20)),
    r_99_108 * neg_f_59_low60_40_low20_0 + s_99_108 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_9 * (-(2**20))
&&
    u_99_108 * neg_f_59_low60_40_low20_0 + v_99_108 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_9 * (const 64 (-(2**20))),
    r_99_108 * neg_f_59_low60_40_low20_0 + s_99_108 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_9 + u_99_108 * (const 64 (2**21)) + v_99_108 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_9 + r_99_108 * (const 64 (2**21)) + s_99_108 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_9,
    neg_f_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_9,
    neg_g_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 108)) <=s delta, delta <=s (const 64 (1 + 2*108)),
    (const 64 (-(2**20))) <=s u_99_108, u_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_108, v_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_108, r_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_108, s_99_108 <=s (const 64 ((2**20)-1)),
    u_99_108 + v_99_108 <=s (const 64 (2**20)),
    u_99_108 - v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 + v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 - v_99_108 <=s (const 64 (2**20)),
    r_99_108 + s_99_108 <=s (const 64 (2**20)),
    r_99_108 - s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 + s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 - s_99_108 <=s (const 64 (2**20)),
    u_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_99_108 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step108

// premise b
assume
neg_g_59_low60_40_low20_9 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_10 neg_f_59_low60_40_low20_9;
mov u_99_109 u_99_108;
mov v_99_109 v_99_108;

add neg_g_59_low60_40_low20_10 neg_g_59_low60_40_low20_9 neg_f_59_low60_40_low20_9;
asr neg_g_59_low60_40_low20_10 neg_g_59_low60_40_low20_10 1;
add r_99_109 r_99_108 u_99_108;
asr r_99_109 r_99_109 1;
add s_99_109 s_99_108 v_99_108;
asr s_99_109 s_99_109 1;
assert
    true
&&
    neg_f_59_low60_40_low20_10 = neg_f_59_low60_40_low20_9,
    u_99_109 = u_99_108,
    v_99_109 = v_99_108,
    neg_g_59_low60_40_low20_10 * (const 64 2) = neg_g_59_low60_40_low20_9 + neg_f_59_low60_40_low20_9,
    r_99_109 * (const 64 2) = r_99_108 + u_99_108,
    s_99_109 * (const 64 2) = s_99_108 + v_99_108
;

assume
    neg_f_59_low60_40_low20_10 = neg_f_59_low60_40_low20_9,
    u_99_109 = u_99_108,
    v_99_109 = v_99_108,
    neg_g_59_low60_40_low20_10 * 2 = neg_g_59_low60_40_low20_9 + neg_f_59_low60_40_low20_9,
    r_99_109 * 2 = r_99_108 + u_99_108,
    s_99_109 * 2 = s_99_108 + v_99_108
&&
    true
;

{
    u_99_109 * neg_f_59_low60_40_low20_0 + v_99_109 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_109 * neg_f_59_low60_40_low20_0 + s_99_109 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_10 + u_99_109 * (const 64 (2**21)) + v_99_109 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_10 + r_99_109 * (const 64 (2**21)) + s_99_109 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_10,
    neg_f_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_10,
    neg_g_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 109)) <=s delta, delta <=s (const 64 (1 + 2*109)),
    (const 64 (-(2**20))) <=s u_99_109, u_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_109, v_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_109, r_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_109, s_99_109 <=s (const 64 ((2**20)-1)),
    u_99_109 + v_99_109 <=s (const 64 (2**20)),
    u_99_109 - v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 + v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 - v_99_109 <=s (const 64 (2**20)),
    r_99_109 + s_99_109 <=s (const 64 (2**20)),
    r_99_109 - s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 + s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 - s_99_109 <=s (const 64 (2**20)),
    u_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_99_109 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_108_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_9,
sint64 neg_g_59_low60_40_low20_9,
sint64 neg_f_59_low60_40_low20_10,
sint64 neg_g_59_low60_40_low20_10,
sint64 u_99_108,
sint64 v_99_108,
sint64 r_99_108,
sint64 s_99_108,
sint64 u_99_109,
sint64 v_99_109,
sint64 r_99_109,
sint64 s_99_109,
bit ne
)={
    u_99_108 * neg_f_59_low60_40_low20_0 + v_99_108 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_9 * (-(2**20)),
    r_99_108 * neg_f_59_low60_40_low20_0 + s_99_108 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_9 * (-(2**20))
&&
    u_99_108 * neg_f_59_low60_40_low20_0 + v_99_108 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_9 * (const 64 (-(2**20))),
    r_99_108 * neg_f_59_low60_40_low20_0 + s_99_108 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_9 + u_99_108 * (const 64 (2**21)) + v_99_108 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_9 + r_99_108 * (const 64 (2**21)) + s_99_108 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_9,
    neg_f_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_9,
    neg_g_59_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 108)) <=s delta, delta <=s (const 64 (1 + 2*108)),
    (const 64 (-(2**20))) <=s u_99_108, u_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_108, v_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_108, r_99_108 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_108, s_99_108 <=s (const 64 ((2**20)-1)),
    u_99_108 + v_99_108 <=s (const 64 (2**20)),
    u_99_108 - v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 + v_99_108 <=s (const 64 (2**20)),
    (const 64 0) - u_99_108 - v_99_108 <=s (const 64 (2**20)),
    r_99_108 + s_99_108 <=s (const 64 (2**20)),
    r_99_108 - s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 + s_99_108 <=s (const 64 (2**20)),
    (const 64 0) - r_99_108 - s_99_108 <=s (const 64 (2**20)),
    u_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_99_108 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_99_108 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step108

// premise c
assume
neg_g_59_low60_40_low20_9 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_10 neg_g_59_low60_40_low20_9;
mov u_99_109 r_99_108;
mov v_99_109 s_99_108;

subs dc neg_g_59_low60_40_low20_10 neg_g_59_low60_40_low20_9 neg_f_59_low60_40_low20_9;
asr neg_g_59_low60_40_low20_10 neg_g_59_low60_40_low20_10 1;
subs dc r_99_109 r_99_108 u_99_108;
asr r_99_109 r_99_109 1;
subs dc s_99_109 s_99_108 v_99_108;
asr s_99_109 s_99_109 1;
assert
    true
&&
    neg_f_59_low60_40_low20_10 = neg_g_59_low60_40_low20_9,
    u_99_109 = r_99_108,
    v_99_109 = s_99_108,
    neg_g_59_low60_40_low20_10 * (const 64 2) = neg_g_59_low60_40_low20_9 - neg_f_59_low60_40_low20_9,
    r_99_109 * (const 64 2) = r_99_108 - u_99_108,
    s_99_109 * (const 64 2) = s_99_108 - v_99_108
;

assume
    neg_f_59_low60_40_low20_10 = neg_g_59_low60_40_low20_9,
    u_99_109 = r_99_108,
    v_99_109 = s_99_108,
    neg_g_59_low60_40_low20_10 * 2 = neg_g_59_low60_40_low20_9 - neg_f_59_low60_40_low20_9,
    r_99_109 * 2 = r_99_108 - u_99_108,
    s_99_109 * 2 = s_99_108 - v_99_108
&&
    true
;

{
    u_99_109 * neg_f_59_low60_40_low20_0 + v_99_109 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_109 * neg_f_59_low60_40_low20_0 + s_99_109 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_10 + u_99_109 * (const 64 (2**21)) + v_99_109 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_10 + r_99_109 * (const 64 (2**21)) + s_99_109 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_10,
    neg_f_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_10,
    neg_g_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 109)) <=s delta, delta <=s (const 64 (1 + 2*109)),
    (const 64 (-(2**20))) <=s u_99_109, u_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_109, v_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_109, r_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_109, s_99_109 <=s (const 64 ((2**20)-1)),
    u_99_109 + v_99_109 <=s (const 64 (2**20)),
    u_99_109 - v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 + v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 - v_99_109 <=s (const 64 (2**20)),
    r_99_109 + s_99_109 <=s (const 64 (2**20)),
    r_99_109 - s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 + s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 - s_99_109 <=s (const 64 (2**20)),
    u_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_99_109 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_109_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_10,
sint64 neg_g_59_low60_40_low20_10,
sint64 neg_f_59_low60_40_low20_11,
sint64 neg_g_59_low60_40_low20_11,
sint64 u_99_109,
sint64 v_99_109,
sint64 r_99_109,
sint64 s_99_109,
sint64 u_99_110,
sint64 v_99_110,
sint64 r_99_110,
sint64 s_99_110,
bit ne
)={
    u_99_109 * neg_f_59_low60_40_low20_0 + v_99_109 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_10 * (-(2**20)),
    r_99_109 * neg_f_59_low60_40_low20_0 + s_99_109 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_10 * (-(2**20))
&&
    u_99_109 * neg_f_59_low60_40_low20_0 + v_99_109 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_10 * (const 64 (-(2**20))),
    r_99_109 * neg_f_59_low60_40_low20_0 + s_99_109 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_10 + u_99_109 * (const 64 (2**21)) + v_99_109 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_10 + r_99_109 * (const 64 (2**21)) + s_99_109 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_10,
    neg_f_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_10,
    neg_g_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 109)) <=s delta, delta <=s (const 64 (1 + 2*109)),
    (const 64 (-(2**20))) <=s u_99_109, u_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_109, v_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_109, r_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_109, s_99_109 <=s (const 64 ((2**20)-1)),
    u_99_109 + v_99_109 <=s (const 64 (2**20)),
    u_99_109 - v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 + v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 - v_99_109 <=s (const 64 (2**20)),
    r_99_109 + s_99_109 <=s (const 64 (2**20)),
    r_99_109 - s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 + s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 - s_99_109 <=s (const 64 (2**20)),
    u_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_99_109 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step109

// premise a
assume
neg_g_59_low60_40_low20_10 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_11 neg_f_59_low60_40_low20_10;
mov u_99_110 u_99_109;
mov v_99_110 v_99_109;

asr neg_g_59_low60_40_low20_11 neg_g_59_low60_40_low20_10 1;
asr r_99_110 r_99_109 1;
asr s_99_110 s_99_109 1;
assert
    true
&&
    neg_f_59_low60_40_low20_11 = neg_f_59_low60_40_low20_10,
    u_99_110 = u_99_109,
    v_99_110 = v_99_109,
    neg_g_59_low60_40_low20_11 * (const 64 2) = neg_g_59_low60_40_low20_10,
    r_99_110 * (const 64 2) = r_99_109,
    s_99_110 * (const 64 2) = s_99_109
;

assume
    neg_f_59_low60_40_low20_11 = neg_f_59_low60_40_low20_10,
    u_99_110 = u_99_109,
    v_99_110 = v_99_109,
    neg_g_59_low60_40_low20_11 * 2 = neg_g_59_low60_40_low20_10,
    r_99_110 * 2 = r_99_109,
    s_99_110 * 2 = s_99_109
&&
    true
;

{
    u_99_110 * neg_f_59_low60_40_low20_0 + v_99_110 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_110 * neg_f_59_low60_40_low20_0 + s_99_110 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_11 + u_99_110 * (const 64 (2**21)) + v_99_110 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_11 + r_99_110 * (const 64 (2**21)) + s_99_110 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_11,
    neg_f_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_11,
    neg_g_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 110)) <=s delta, delta <=s (const 64 (1 + 2*110)),
    (const 64 (-(2**20))) <=s u_99_110, u_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_110, v_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_110, r_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_110, s_99_110 <=s (const 64 ((2**20)-1)),
    u_99_110 + v_99_110 <=s (const 64 (2**20)),
    u_99_110 - v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 + v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 - v_99_110 <=s (const 64 (2**20)),
    r_99_110 + s_99_110 <=s (const 64 (2**20)),
    r_99_110 - s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 + s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 - s_99_110 <=s (const 64 (2**20)),
    u_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_99_110 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_109_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_10,
sint64 neg_g_59_low60_40_low20_10,
sint64 neg_f_59_low60_40_low20_11,
sint64 neg_g_59_low60_40_low20_11,
sint64 u_99_109,
sint64 v_99_109,
sint64 r_99_109,
sint64 s_99_109,
sint64 u_99_110,
sint64 v_99_110,
sint64 r_99_110,
sint64 s_99_110,
bit ne
)={
    u_99_109 * neg_f_59_low60_40_low20_0 + v_99_109 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_10 * (-(2**20)),
    r_99_109 * neg_f_59_low60_40_low20_0 + s_99_109 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_10 * (-(2**20))
&&
    u_99_109 * neg_f_59_low60_40_low20_0 + v_99_109 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_10 * (const 64 (-(2**20))),
    r_99_109 * neg_f_59_low60_40_low20_0 + s_99_109 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_10 + u_99_109 * (const 64 (2**21)) + v_99_109 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_10 + r_99_109 * (const 64 (2**21)) + s_99_109 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_10,
    neg_f_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_10,
    neg_g_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 109)) <=s delta, delta <=s (const 64 (1 + 2*109)),
    (const 64 (-(2**20))) <=s u_99_109, u_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_109, v_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_109, r_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_109, s_99_109 <=s (const 64 ((2**20)-1)),
    u_99_109 + v_99_109 <=s (const 64 (2**20)),
    u_99_109 - v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 + v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 - v_99_109 <=s (const 64 (2**20)),
    r_99_109 + s_99_109 <=s (const 64 (2**20)),
    r_99_109 - s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 + s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 - s_99_109 <=s (const 64 (2**20)),
    u_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_99_109 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step109

// premise b
assume
neg_g_59_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_11 neg_f_59_low60_40_low20_10;
mov u_99_110 u_99_109;
mov v_99_110 v_99_109;

add neg_g_59_low60_40_low20_11 neg_g_59_low60_40_low20_10 neg_f_59_low60_40_low20_10;
asr neg_g_59_low60_40_low20_11 neg_g_59_low60_40_low20_11 1;
add r_99_110 r_99_109 u_99_109;
asr r_99_110 r_99_110 1;
add s_99_110 s_99_109 v_99_109;
asr s_99_110 s_99_110 1;
assert
    true
&&
    neg_f_59_low60_40_low20_11 = neg_f_59_low60_40_low20_10,
    u_99_110 = u_99_109,
    v_99_110 = v_99_109,
    neg_g_59_low60_40_low20_11 * (const 64 2) = neg_g_59_low60_40_low20_10 + neg_f_59_low60_40_low20_10,
    r_99_110 * (const 64 2) = r_99_109 + u_99_109,
    s_99_110 * (const 64 2) = s_99_109 + v_99_109
;

assume
    neg_f_59_low60_40_low20_11 = neg_f_59_low60_40_low20_10,
    u_99_110 = u_99_109,
    v_99_110 = v_99_109,
    neg_g_59_low60_40_low20_11 * 2 = neg_g_59_low60_40_low20_10 + neg_f_59_low60_40_low20_10,
    r_99_110 * 2 = r_99_109 + u_99_109,
    s_99_110 * 2 = s_99_109 + v_99_109
&&
    true
;

{
    u_99_110 * neg_f_59_low60_40_low20_0 + v_99_110 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_110 * neg_f_59_low60_40_low20_0 + s_99_110 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_11 + u_99_110 * (const 64 (2**21)) + v_99_110 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_11 + r_99_110 * (const 64 (2**21)) + s_99_110 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_11,
    neg_f_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_11,
    neg_g_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 110)) <=s delta, delta <=s (const 64 (1 + 2*110)),
    (const 64 (-(2**20))) <=s u_99_110, u_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_110, v_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_110, r_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_110, s_99_110 <=s (const 64 ((2**20)-1)),
    u_99_110 + v_99_110 <=s (const 64 (2**20)),
    u_99_110 - v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 + v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 - v_99_110 <=s (const 64 (2**20)),
    r_99_110 + s_99_110 <=s (const 64 (2**20)),
    r_99_110 - s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 + s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 - s_99_110 <=s (const 64 (2**20)),
    u_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_99_110 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_109_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_10,
sint64 neg_g_59_low60_40_low20_10,
sint64 neg_f_59_low60_40_low20_11,
sint64 neg_g_59_low60_40_low20_11,
sint64 u_99_109,
sint64 v_99_109,
sint64 r_99_109,
sint64 s_99_109,
sint64 u_99_110,
sint64 v_99_110,
sint64 r_99_110,
sint64 s_99_110,
bit ne
)={
    u_99_109 * neg_f_59_low60_40_low20_0 + v_99_109 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_10 * (-(2**20)),
    r_99_109 * neg_f_59_low60_40_low20_0 + s_99_109 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_10 * (-(2**20))
&&
    u_99_109 * neg_f_59_low60_40_low20_0 + v_99_109 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_10 * (const 64 (-(2**20))),
    r_99_109 * neg_f_59_low60_40_low20_0 + s_99_109 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_10 + u_99_109 * (const 64 (2**21)) + v_99_109 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_10 + r_99_109 * (const 64 (2**21)) + s_99_109 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_10,
    neg_f_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_10,
    neg_g_59_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 109)) <=s delta, delta <=s (const 64 (1 + 2*109)),
    (const 64 (-(2**20))) <=s u_99_109, u_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_109, v_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_109, r_99_109 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_109, s_99_109 <=s (const 64 ((2**20)-1)),
    u_99_109 + v_99_109 <=s (const 64 (2**20)),
    u_99_109 - v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 + v_99_109 <=s (const 64 (2**20)),
    (const 64 0) - u_99_109 - v_99_109 <=s (const 64 (2**20)),
    r_99_109 + s_99_109 <=s (const 64 (2**20)),
    r_99_109 - s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 + s_99_109 <=s (const 64 (2**20)),
    (const 64 0) - r_99_109 - s_99_109 <=s (const 64 (2**20)),
    u_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_99_109 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_99_109 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step109

// premise c
assume
neg_g_59_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_11 neg_g_59_low60_40_low20_10;
mov u_99_110 r_99_109;
mov v_99_110 s_99_109;

subs dc neg_g_59_low60_40_low20_11 neg_g_59_low60_40_low20_10 neg_f_59_low60_40_low20_10;
asr neg_g_59_low60_40_low20_11 neg_g_59_low60_40_low20_11 1;
subs dc r_99_110 r_99_109 u_99_109;
asr r_99_110 r_99_110 1;
subs dc s_99_110 s_99_109 v_99_109;
asr s_99_110 s_99_110 1;
assert
    true
&&
    neg_f_59_low60_40_low20_11 = neg_g_59_low60_40_low20_10,
    u_99_110 = r_99_109,
    v_99_110 = s_99_109,
    neg_g_59_low60_40_low20_11 * (const 64 2) = neg_g_59_low60_40_low20_10 - neg_f_59_low60_40_low20_10,
    r_99_110 * (const 64 2) = r_99_109 - u_99_109,
    s_99_110 * (const 64 2) = s_99_109 - v_99_109
;

assume
    neg_f_59_low60_40_low20_11 = neg_g_59_low60_40_low20_10,
    u_99_110 = r_99_109,
    v_99_110 = s_99_109,
    neg_g_59_low60_40_low20_11 * 2 = neg_g_59_low60_40_low20_10 - neg_f_59_low60_40_low20_10,
    r_99_110 * 2 = r_99_109 - u_99_109,
    s_99_110 * 2 = s_99_109 - v_99_109
&&
    true
;

{
    u_99_110 * neg_f_59_low60_40_low20_0 + v_99_110 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_110 * neg_f_59_low60_40_low20_0 + s_99_110 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_11 + u_99_110 * (const 64 (2**21)) + v_99_110 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_11 + r_99_110 * (const 64 (2**21)) + s_99_110 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_11,
    neg_f_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_11,
    neg_g_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 110)) <=s delta, delta <=s (const 64 (1 + 2*110)),
    (const 64 (-(2**20))) <=s u_99_110, u_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_110, v_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_110, r_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_110, s_99_110 <=s (const 64 ((2**20)-1)),
    u_99_110 + v_99_110 <=s (const 64 (2**20)),
    u_99_110 - v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 + v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 - v_99_110 <=s (const 64 (2**20)),
    r_99_110 + s_99_110 <=s (const 64 (2**20)),
    r_99_110 - s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 + s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 - s_99_110 <=s (const 64 (2**20)),
    u_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_99_110 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_110_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_11,
sint64 neg_g_59_low60_40_low20_11,
sint64 neg_f_59_low60_40_low20_12,
sint64 neg_g_59_low60_40_low20_12,
sint64 u_99_110,
sint64 v_99_110,
sint64 r_99_110,
sint64 s_99_110,
sint64 u_99_111,
sint64 v_99_111,
sint64 r_99_111,
sint64 s_99_111,
bit ne
)={
    u_99_110 * neg_f_59_low60_40_low20_0 + v_99_110 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_11 * (-(2**20)),
    r_99_110 * neg_f_59_low60_40_low20_0 + s_99_110 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_11 * (-(2**20))
&&
    u_99_110 * neg_f_59_low60_40_low20_0 + v_99_110 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_11 * (const 64 (-(2**20))),
    r_99_110 * neg_f_59_low60_40_low20_0 + s_99_110 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_11 + u_99_110 * (const 64 (2**21)) + v_99_110 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_11 + r_99_110 * (const 64 (2**21)) + s_99_110 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_11,
    neg_f_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_11,
    neg_g_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 110)) <=s delta, delta <=s (const 64 (1 + 2*110)),
    (const 64 (-(2**20))) <=s u_99_110, u_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_110, v_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_110, r_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_110, s_99_110 <=s (const 64 ((2**20)-1)),
    u_99_110 + v_99_110 <=s (const 64 (2**20)),
    u_99_110 - v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 + v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 - v_99_110 <=s (const 64 (2**20)),
    r_99_110 + s_99_110 <=s (const 64 (2**20)),
    r_99_110 - s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 + s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 - s_99_110 <=s (const 64 (2**20)),
    u_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_99_110 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step110

// premise a
assume
neg_g_59_low60_40_low20_11 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_12 neg_f_59_low60_40_low20_11;
mov u_99_111 u_99_110;
mov v_99_111 v_99_110;

asr neg_g_59_low60_40_low20_12 neg_g_59_low60_40_low20_11 1;
asr r_99_111 r_99_110 1;
asr s_99_111 s_99_110 1;
assert
    true
&&
    neg_f_59_low60_40_low20_12 = neg_f_59_low60_40_low20_11,
    u_99_111 = u_99_110,
    v_99_111 = v_99_110,
    neg_g_59_low60_40_low20_12 * (const 64 2) = neg_g_59_low60_40_low20_11,
    r_99_111 * (const 64 2) = r_99_110,
    s_99_111 * (const 64 2) = s_99_110
;

assume
    neg_f_59_low60_40_low20_12 = neg_f_59_low60_40_low20_11,
    u_99_111 = u_99_110,
    v_99_111 = v_99_110,
    neg_g_59_low60_40_low20_12 * 2 = neg_g_59_low60_40_low20_11,
    r_99_111 * 2 = r_99_110,
    s_99_111 * 2 = s_99_110
&&
    true
;

{
    u_99_111 * neg_f_59_low60_40_low20_0 + v_99_111 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_111 * neg_f_59_low60_40_low20_0 + s_99_111 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_12 + u_99_111 * (const 64 (2**21)) + v_99_111 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_12 + r_99_111 * (const 64 (2**21)) + s_99_111 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_12,
    neg_f_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_12,
    neg_g_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 111)) <=s delta, delta <=s (const 64 (1 + 2*111)),
    (const 64 (-(2**20))) <=s u_99_111, u_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_111, v_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_111, r_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_111, s_99_111 <=s (const 64 ((2**20)-1)),
    u_99_111 + v_99_111 <=s (const 64 (2**20)),
    u_99_111 - v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 + v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 - v_99_111 <=s (const 64 (2**20)),
    r_99_111 + s_99_111 <=s (const 64 (2**20)),
    r_99_111 - s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 + s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 - s_99_111 <=s (const 64 (2**20)),
    u_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_99_111 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_110_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_11,
sint64 neg_g_59_low60_40_low20_11,
sint64 neg_f_59_low60_40_low20_12,
sint64 neg_g_59_low60_40_low20_12,
sint64 u_99_110,
sint64 v_99_110,
sint64 r_99_110,
sint64 s_99_110,
sint64 u_99_111,
sint64 v_99_111,
sint64 r_99_111,
sint64 s_99_111,
bit ne
)={
    u_99_110 * neg_f_59_low60_40_low20_0 + v_99_110 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_11 * (-(2**20)),
    r_99_110 * neg_f_59_low60_40_low20_0 + s_99_110 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_11 * (-(2**20))
&&
    u_99_110 * neg_f_59_low60_40_low20_0 + v_99_110 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_11 * (const 64 (-(2**20))),
    r_99_110 * neg_f_59_low60_40_low20_0 + s_99_110 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_11 + u_99_110 * (const 64 (2**21)) + v_99_110 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_11 + r_99_110 * (const 64 (2**21)) + s_99_110 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_11,
    neg_f_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_11,
    neg_g_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 110)) <=s delta, delta <=s (const 64 (1 + 2*110)),
    (const 64 (-(2**20))) <=s u_99_110, u_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_110, v_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_110, r_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_110, s_99_110 <=s (const 64 ((2**20)-1)),
    u_99_110 + v_99_110 <=s (const 64 (2**20)),
    u_99_110 - v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 + v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 - v_99_110 <=s (const 64 (2**20)),
    r_99_110 + s_99_110 <=s (const 64 (2**20)),
    r_99_110 - s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 + s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 - s_99_110 <=s (const 64 (2**20)),
    u_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_99_110 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step110

// premise b
assume
neg_g_59_low60_40_low20_11 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_12 neg_f_59_low60_40_low20_11;
mov u_99_111 u_99_110;
mov v_99_111 v_99_110;

add neg_g_59_low60_40_low20_12 neg_g_59_low60_40_low20_11 neg_f_59_low60_40_low20_11;
asr neg_g_59_low60_40_low20_12 neg_g_59_low60_40_low20_12 1;
add r_99_111 r_99_110 u_99_110;
asr r_99_111 r_99_111 1;
add s_99_111 s_99_110 v_99_110;
asr s_99_111 s_99_111 1;
assert
    true
&&
    neg_f_59_low60_40_low20_12 = neg_f_59_low60_40_low20_11,
    u_99_111 = u_99_110,
    v_99_111 = v_99_110,
    neg_g_59_low60_40_low20_12 * (const 64 2) = neg_g_59_low60_40_low20_11 + neg_f_59_low60_40_low20_11,
    r_99_111 * (const 64 2) = r_99_110 + u_99_110,
    s_99_111 * (const 64 2) = s_99_110 + v_99_110
;

assume
    neg_f_59_low60_40_low20_12 = neg_f_59_low60_40_low20_11,
    u_99_111 = u_99_110,
    v_99_111 = v_99_110,
    neg_g_59_low60_40_low20_12 * 2 = neg_g_59_low60_40_low20_11 + neg_f_59_low60_40_low20_11,
    r_99_111 * 2 = r_99_110 + u_99_110,
    s_99_111 * 2 = s_99_110 + v_99_110
&&
    true
;

{
    u_99_111 * neg_f_59_low60_40_low20_0 + v_99_111 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_111 * neg_f_59_low60_40_low20_0 + s_99_111 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_12 + u_99_111 * (const 64 (2**21)) + v_99_111 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_12 + r_99_111 * (const 64 (2**21)) + s_99_111 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_12,
    neg_f_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_12,
    neg_g_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 111)) <=s delta, delta <=s (const 64 (1 + 2*111)),
    (const 64 (-(2**20))) <=s u_99_111, u_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_111, v_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_111, r_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_111, s_99_111 <=s (const 64 ((2**20)-1)),
    u_99_111 + v_99_111 <=s (const 64 (2**20)),
    u_99_111 - v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 + v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 - v_99_111 <=s (const 64 (2**20)),
    r_99_111 + s_99_111 <=s (const 64 (2**20)),
    r_99_111 - s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 + s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 - s_99_111 <=s (const 64 (2**20)),
    u_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_99_111 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_110_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_11,
sint64 neg_g_59_low60_40_low20_11,
sint64 neg_f_59_low60_40_low20_12,
sint64 neg_g_59_low60_40_low20_12,
sint64 u_99_110,
sint64 v_99_110,
sint64 r_99_110,
sint64 s_99_110,
sint64 u_99_111,
sint64 v_99_111,
sint64 r_99_111,
sint64 s_99_111,
bit ne
)={
    u_99_110 * neg_f_59_low60_40_low20_0 + v_99_110 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_11 * (-(2**20)),
    r_99_110 * neg_f_59_low60_40_low20_0 + s_99_110 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_11 * (-(2**20))
&&
    u_99_110 * neg_f_59_low60_40_low20_0 + v_99_110 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_11 * (const 64 (-(2**20))),
    r_99_110 * neg_f_59_low60_40_low20_0 + s_99_110 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_11 + u_99_110 * (const 64 (2**21)) + v_99_110 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_11 + r_99_110 * (const 64 (2**21)) + s_99_110 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_11,
    neg_f_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_11,
    neg_g_59_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 110)) <=s delta, delta <=s (const 64 (1 + 2*110)),
    (const 64 (-(2**20))) <=s u_99_110, u_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_110, v_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_110, r_99_110 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_110, s_99_110 <=s (const 64 ((2**20)-1)),
    u_99_110 + v_99_110 <=s (const 64 (2**20)),
    u_99_110 - v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 + v_99_110 <=s (const 64 (2**20)),
    (const 64 0) - u_99_110 - v_99_110 <=s (const 64 (2**20)),
    r_99_110 + s_99_110 <=s (const 64 (2**20)),
    r_99_110 - s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 + s_99_110 <=s (const 64 (2**20)),
    (const 64 0) - r_99_110 - s_99_110 <=s (const 64 (2**20)),
    u_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_99_110 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_99_110 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step110

// premise c
assume
neg_g_59_low60_40_low20_11 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_12 neg_g_59_low60_40_low20_11;
mov u_99_111 r_99_110;
mov v_99_111 s_99_110;

subs dc neg_g_59_low60_40_low20_12 neg_g_59_low60_40_low20_11 neg_f_59_low60_40_low20_11;
asr neg_g_59_low60_40_low20_12 neg_g_59_low60_40_low20_12 1;
subs dc r_99_111 r_99_110 u_99_110;
asr r_99_111 r_99_111 1;
subs dc s_99_111 s_99_110 v_99_110;
asr s_99_111 s_99_111 1;
assert
    true
&&
    neg_f_59_low60_40_low20_12 = neg_g_59_low60_40_low20_11,
    u_99_111 = r_99_110,
    v_99_111 = s_99_110,
    neg_g_59_low60_40_low20_12 * (const 64 2) = neg_g_59_low60_40_low20_11 - neg_f_59_low60_40_low20_11,
    r_99_111 * (const 64 2) = r_99_110 - u_99_110,
    s_99_111 * (const 64 2) = s_99_110 - v_99_110
;

assume
    neg_f_59_low60_40_low20_12 = neg_g_59_low60_40_low20_11,
    u_99_111 = r_99_110,
    v_99_111 = s_99_110,
    neg_g_59_low60_40_low20_12 * 2 = neg_g_59_low60_40_low20_11 - neg_f_59_low60_40_low20_11,
    r_99_111 * 2 = r_99_110 - u_99_110,
    s_99_111 * 2 = s_99_110 - v_99_110
&&
    true
;

{
    u_99_111 * neg_f_59_low60_40_low20_0 + v_99_111 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_111 * neg_f_59_low60_40_low20_0 + s_99_111 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_12 + u_99_111 * (const 64 (2**21)) + v_99_111 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_12 + r_99_111 * (const 64 (2**21)) + s_99_111 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_12,
    neg_f_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_12,
    neg_g_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 111)) <=s delta, delta <=s (const 64 (1 + 2*111)),
    (const 64 (-(2**20))) <=s u_99_111, u_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_111, v_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_111, r_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_111, s_99_111 <=s (const 64 ((2**20)-1)),
    u_99_111 + v_99_111 <=s (const 64 (2**20)),
    u_99_111 - v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 + v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 - v_99_111 <=s (const 64 (2**20)),
    r_99_111 + s_99_111 <=s (const 64 (2**20)),
    r_99_111 - s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 + s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 - s_99_111 <=s (const 64 (2**20)),
    u_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_99_111 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_111_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_12,
sint64 neg_g_59_low60_40_low20_12,
sint64 neg_f_59_low60_40_low20_13,
sint64 neg_g_59_low60_40_low20_13,
sint64 u_99_111,
sint64 v_99_111,
sint64 r_99_111,
sint64 s_99_111,
sint64 u_99_112,
sint64 v_99_112,
sint64 r_99_112,
sint64 s_99_112,
bit ne
)={
    u_99_111 * neg_f_59_low60_40_low20_0 + v_99_111 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_12 * (-(2**20)),
    r_99_111 * neg_f_59_low60_40_low20_0 + s_99_111 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_12 * (-(2**20))
&&
    u_99_111 * neg_f_59_low60_40_low20_0 + v_99_111 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_12 * (const 64 (-(2**20))),
    r_99_111 * neg_f_59_low60_40_low20_0 + s_99_111 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_12 + u_99_111 * (const 64 (2**21)) + v_99_111 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_12 + r_99_111 * (const 64 (2**21)) + s_99_111 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_12,
    neg_f_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_12,
    neg_g_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 111)) <=s delta, delta <=s (const 64 (1 + 2*111)),
    (const 64 (-(2**20))) <=s u_99_111, u_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_111, v_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_111, r_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_111, s_99_111 <=s (const 64 ((2**20)-1)),
    u_99_111 + v_99_111 <=s (const 64 (2**20)),
    u_99_111 - v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 + v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 - v_99_111 <=s (const 64 (2**20)),
    r_99_111 + s_99_111 <=s (const 64 (2**20)),
    r_99_111 - s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 + s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 - s_99_111 <=s (const 64 (2**20)),
    u_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_99_111 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step111

// premise a
assume
neg_g_59_low60_40_low20_12 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_13 neg_f_59_low60_40_low20_12;
mov u_99_112 u_99_111;
mov v_99_112 v_99_111;

asr neg_g_59_low60_40_low20_13 neg_g_59_low60_40_low20_12 1;
asr r_99_112 r_99_111 1;
asr s_99_112 s_99_111 1;
assert
    true
&&
    neg_f_59_low60_40_low20_13 = neg_f_59_low60_40_low20_12,
    u_99_112 = u_99_111,
    v_99_112 = v_99_111,
    neg_g_59_low60_40_low20_13 * (const 64 2) = neg_g_59_low60_40_low20_12,
    r_99_112 * (const 64 2) = r_99_111,
    s_99_112 * (const 64 2) = s_99_111
;

assume
    neg_f_59_low60_40_low20_13 = neg_f_59_low60_40_low20_12,
    u_99_112 = u_99_111,
    v_99_112 = v_99_111,
    neg_g_59_low60_40_low20_13 * 2 = neg_g_59_low60_40_low20_12,
    r_99_112 * 2 = r_99_111,
    s_99_112 * 2 = s_99_111
&&
    true
;

{
    u_99_112 * neg_f_59_low60_40_low20_0 + v_99_112 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_112 * neg_f_59_low60_40_low20_0 + s_99_112 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_13 + u_99_112 * (const 64 (2**21)) + v_99_112 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_13 + r_99_112 * (const 64 (2**21)) + s_99_112 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_13,
    neg_f_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_13,
    neg_g_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 112)) <=s delta, delta <=s (const 64 (1 + 2*112)),
    (const 64 (-(2**20))) <=s u_99_112, u_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_112, v_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_112, r_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_112, s_99_112 <=s (const 64 ((2**20)-1)),
    u_99_112 + v_99_112 <=s (const 64 (2**20)),
    u_99_112 - v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 + v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 - v_99_112 <=s (const 64 (2**20)),
    r_99_112 + s_99_112 <=s (const 64 (2**20)),
    r_99_112 - s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 + s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 - s_99_112 <=s (const 64 (2**20)),
    u_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_99_112 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_111_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_12,
sint64 neg_g_59_low60_40_low20_12,
sint64 neg_f_59_low60_40_low20_13,
sint64 neg_g_59_low60_40_low20_13,
sint64 u_99_111,
sint64 v_99_111,
sint64 r_99_111,
sint64 s_99_111,
sint64 u_99_112,
sint64 v_99_112,
sint64 r_99_112,
sint64 s_99_112,
bit ne
)={
    u_99_111 * neg_f_59_low60_40_low20_0 + v_99_111 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_12 * (-(2**20)),
    r_99_111 * neg_f_59_low60_40_low20_0 + s_99_111 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_12 * (-(2**20))
&&
    u_99_111 * neg_f_59_low60_40_low20_0 + v_99_111 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_12 * (const 64 (-(2**20))),
    r_99_111 * neg_f_59_low60_40_low20_0 + s_99_111 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_12 + u_99_111 * (const 64 (2**21)) + v_99_111 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_12 + r_99_111 * (const 64 (2**21)) + s_99_111 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_12,
    neg_f_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_12,
    neg_g_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 111)) <=s delta, delta <=s (const 64 (1 + 2*111)),
    (const 64 (-(2**20))) <=s u_99_111, u_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_111, v_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_111, r_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_111, s_99_111 <=s (const 64 ((2**20)-1)),
    u_99_111 + v_99_111 <=s (const 64 (2**20)),
    u_99_111 - v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 + v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 - v_99_111 <=s (const 64 (2**20)),
    r_99_111 + s_99_111 <=s (const 64 (2**20)),
    r_99_111 - s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 + s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 - s_99_111 <=s (const 64 (2**20)),
    u_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_99_111 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step111

// premise b
assume
neg_g_59_low60_40_low20_12 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_13 neg_f_59_low60_40_low20_12;
mov u_99_112 u_99_111;
mov v_99_112 v_99_111;

add neg_g_59_low60_40_low20_13 neg_g_59_low60_40_low20_12 neg_f_59_low60_40_low20_12;
asr neg_g_59_low60_40_low20_13 neg_g_59_low60_40_low20_13 1;
add r_99_112 r_99_111 u_99_111;
asr r_99_112 r_99_112 1;
add s_99_112 s_99_111 v_99_111;
asr s_99_112 s_99_112 1;
assert
    true
&&
    neg_f_59_low60_40_low20_13 = neg_f_59_low60_40_low20_12,
    u_99_112 = u_99_111,
    v_99_112 = v_99_111,
    neg_g_59_low60_40_low20_13 * (const 64 2) = neg_g_59_low60_40_low20_12 + neg_f_59_low60_40_low20_12,
    r_99_112 * (const 64 2) = r_99_111 + u_99_111,
    s_99_112 * (const 64 2) = s_99_111 + v_99_111
;

assume
    neg_f_59_low60_40_low20_13 = neg_f_59_low60_40_low20_12,
    u_99_112 = u_99_111,
    v_99_112 = v_99_111,
    neg_g_59_low60_40_low20_13 * 2 = neg_g_59_low60_40_low20_12 + neg_f_59_low60_40_low20_12,
    r_99_112 * 2 = r_99_111 + u_99_111,
    s_99_112 * 2 = s_99_111 + v_99_111
&&
    true
;

{
    u_99_112 * neg_f_59_low60_40_low20_0 + v_99_112 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_112 * neg_f_59_low60_40_low20_0 + s_99_112 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_13 + u_99_112 * (const 64 (2**21)) + v_99_112 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_13 + r_99_112 * (const 64 (2**21)) + s_99_112 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_13,
    neg_f_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_13,
    neg_g_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 112)) <=s delta, delta <=s (const 64 (1 + 2*112)),
    (const 64 (-(2**20))) <=s u_99_112, u_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_112, v_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_112, r_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_112, s_99_112 <=s (const 64 ((2**20)-1)),
    u_99_112 + v_99_112 <=s (const 64 (2**20)),
    u_99_112 - v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 + v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 - v_99_112 <=s (const 64 (2**20)),
    r_99_112 + s_99_112 <=s (const 64 (2**20)),
    r_99_112 - s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 + s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 - s_99_112 <=s (const 64 (2**20)),
    u_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_99_112 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_111_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_12,
sint64 neg_g_59_low60_40_low20_12,
sint64 neg_f_59_low60_40_low20_13,
sint64 neg_g_59_low60_40_low20_13,
sint64 u_99_111,
sint64 v_99_111,
sint64 r_99_111,
sint64 s_99_111,
sint64 u_99_112,
sint64 v_99_112,
sint64 r_99_112,
sint64 s_99_112,
bit ne
)={
    u_99_111 * neg_f_59_low60_40_low20_0 + v_99_111 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_12 * (-(2**20)),
    r_99_111 * neg_f_59_low60_40_low20_0 + s_99_111 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_12 * (-(2**20))
&&
    u_99_111 * neg_f_59_low60_40_low20_0 + v_99_111 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_12 * (const 64 (-(2**20))),
    r_99_111 * neg_f_59_low60_40_low20_0 + s_99_111 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_12 + u_99_111 * (const 64 (2**21)) + v_99_111 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_12 + r_99_111 * (const 64 (2**21)) + s_99_111 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_12,
    neg_f_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_12,
    neg_g_59_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 111)) <=s delta, delta <=s (const 64 (1 + 2*111)),
    (const 64 (-(2**20))) <=s u_99_111, u_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_111, v_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_111, r_99_111 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_111, s_99_111 <=s (const 64 ((2**20)-1)),
    u_99_111 + v_99_111 <=s (const 64 (2**20)),
    u_99_111 - v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 + v_99_111 <=s (const 64 (2**20)),
    (const 64 0) - u_99_111 - v_99_111 <=s (const 64 (2**20)),
    r_99_111 + s_99_111 <=s (const 64 (2**20)),
    r_99_111 - s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 + s_99_111 <=s (const 64 (2**20)),
    (const 64 0) - r_99_111 - s_99_111 <=s (const 64 (2**20)),
    u_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_99_111 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_99_111 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step111

// premise c
assume
neg_g_59_low60_40_low20_12 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_13 neg_g_59_low60_40_low20_12;
mov u_99_112 r_99_111;
mov v_99_112 s_99_111;

subs dc neg_g_59_low60_40_low20_13 neg_g_59_low60_40_low20_12 neg_f_59_low60_40_low20_12;
asr neg_g_59_low60_40_low20_13 neg_g_59_low60_40_low20_13 1;
subs dc r_99_112 r_99_111 u_99_111;
asr r_99_112 r_99_112 1;
subs dc s_99_112 s_99_111 v_99_111;
asr s_99_112 s_99_112 1;
assert
    true
&&
    neg_f_59_low60_40_low20_13 = neg_g_59_low60_40_low20_12,
    u_99_112 = r_99_111,
    v_99_112 = s_99_111,
    neg_g_59_low60_40_low20_13 * (const 64 2) = neg_g_59_low60_40_low20_12 - neg_f_59_low60_40_low20_12,
    r_99_112 * (const 64 2) = r_99_111 - u_99_111,
    s_99_112 * (const 64 2) = s_99_111 - v_99_111
;

assume
    neg_f_59_low60_40_low20_13 = neg_g_59_low60_40_low20_12,
    u_99_112 = r_99_111,
    v_99_112 = s_99_111,
    neg_g_59_low60_40_low20_13 * 2 = neg_g_59_low60_40_low20_12 - neg_f_59_low60_40_low20_12,
    r_99_112 * 2 = r_99_111 - u_99_111,
    s_99_112 * 2 = s_99_111 - v_99_111
&&
    true
;

{
    u_99_112 * neg_f_59_low60_40_low20_0 + v_99_112 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_112 * neg_f_59_low60_40_low20_0 + s_99_112 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_13 + u_99_112 * (const 64 (2**21)) + v_99_112 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_13 + r_99_112 * (const 64 (2**21)) + s_99_112 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_13,
    neg_f_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_13,
    neg_g_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 112)) <=s delta, delta <=s (const 64 (1 + 2*112)),
    (const 64 (-(2**20))) <=s u_99_112, u_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_112, v_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_112, r_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_112, s_99_112 <=s (const 64 ((2**20)-1)),
    u_99_112 + v_99_112 <=s (const 64 (2**20)),
    u_99_112 - v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 + v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 - v_99_112 <=s (const 64 (2**20)),
    r_99_112 + s_99_112 <=s (const 64 (2**20)),
    r_99_112 - s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 + s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 - s_99_112 <=s (const 64 (2**20)),
    u_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_99_112 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_112_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_13,
sint64 neg_g_59_low60_40_low20_13,
sint64 neg_f_59_low60_40_low20_14,
sint64 neg_g_59_low60_40_low20_14,
sint64 u_99_112,
sint64 v_99_112,
sint64 r_99_112,
sint64 s_99_112,
sint64 u_99_113,
sint64 v_99_113,
sint64 r_99_113,
sint64 s_99_113,
bit ne
)={
    u_99_112 * neg_f_59_low60_40_low20_0 + v_99_112 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_13 * (-(2**20)),
    r_99_112 * neg_f_59_low60_40_low20_0 + s_99_112 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_13 * (-(2**20))
&&
    u_99_112 * neg_f_59_low60_40_low20_0 + v_99_112 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_13 * (const 64 (-(2**20))),
    r_99_112 * neg_f_59_low60_40_low20_0 + s_99_112 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_13 + u_99_112 * (const 64 (2**21)) + v_99_112 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_13 + r_99_112 * (const 64 (2**21)) + s_99_112 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_13,
    neg_f_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_13,
    neg_g_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 112)) <=s delta, delta <=s (const 64 (1 + 2*112)),
    (const 64 (-(2**20))) <=s u_99_112, u_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_112, v_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_112, r_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_112, s_99_112 <=s (const 64 ((2**20)-1)),
    u_99_112 + v_99_112 <=s (const 64 (2**20)),
    u_99_112 - v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 + v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 - v_99_112 <=s (const 64 (2**20)),
    r_99_112 + s_99_112 <=s (const 64 (2**20)),
    r_99_112 - s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 + s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 - s_99_112 <=s (const 64 (2**20)),
    u_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_99_112 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step112

// premise a
assume
neg_g_59_low60_40_low20_13 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_14 neg_f_59_low60_40_low20_13;
mov u_99_113 u_99_112;
mov v_99_113 v_99_112;

asr neg_g_59_low60_40_low20_14 neg_g_59_low60_40_low20_13 1;
asr r_99_113 r_99_112 1;
asr s_99_113 s_99_112 1;
assert
    true
&&
    neg_f_59_low60_40_low20_14 = neg_f_59_low60_40_low20_13,
    u_99_113 = u_99_112,
    v_99_113 = v_99_112,
    neg_g_59_low60_40_low20_14 * (const 64 2) = neg_g_59_low60_40_low20_13,
    r_99_113 * (const 64 2) = r_99_112,
    s_99_113 * (const 64 2) = s_99_112
;

assume
    neg_f_59_low60_40_low20_14 = neg_f_59_low60_40_low20_13,
    u_99_113 = u_99_112,
    v_99_113 = v_99_112,
    neg_g_59_low60_40_low20_14 * 2 = neg_g_59_low60_40_low20_13,
    r_99_113 * 2 = r_99_112,
    s_99_113 * 2 = s_99_112
&&
    true
;

{
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_14 + u_99_113 * (const 64 (2**21)) + v_99_113 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_14 + r_99_113 * (const 64 (2**21)) + s_99_113 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_14,
    neg_f_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_14,
    neg_g_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 113)) <=s delta, delta <=s (const 64 (1 + 2*113)),
    (const 64 (-(2**20))) <=s u_99_113, u_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_113, v_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_113, r_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_113, s_99_113 <=s (const 64 ((2**20)-1)),
    u_99_113 + v_99_113 <=s (const 64 (2**20)),
    u_99_113 - v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 + v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 - v_99_113 <=s (const 64 (2**20)),
    r_99_113 + s_99_113 <=s (const 64 (2**20)),
    r_99_113 - s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 + s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 - s_99_113 <=s (const 64 (2**20)),
    u_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_99_113 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_112_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_13,
sint64 neg_g_59_low60_40_low20_13,
sint64 neg_f_59_low60_40_low20_14,
sint64 neg_g_59_low60_40_low20_14,
sint64 u_99_112,
sint64 v_99_112,
sint64 r_99_112,
sint64 s_99_112,
sint64 u_99_113,
sint64 v_99_113,
sint64 r_99_113,
sint64 s_99_113,
bit ne
)={
    u_99_112 * neg_f_59_low60_40_low20_0 + v_99_112 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_13 * (-(2**20)),
    r_99_112 * neg_f_59_low60_40_low20_0 + s_99_112 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_13 * (-(2**20))
&&
    u_99_112 * neg_f_59_low60_40_low20_0 + v_99_112 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_13 * (const 64 (-(2**20))),
    r_99_112 * neg_f_59_low60_40_low20_0 + s_99_112 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_13 + u_99_112 * (const 64 (2**21)) + v_99_112 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_13 + r_99_112 * (const 64 (2**21)) + s_99_112 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_13,
    neg_f_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_13,
    neg_g_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 112)) <=s delta, delta <=s (const 64 (1 + 2*112)),
    (const 64 (-(2**20))) <=s u_99_112, u_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_112, v_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_112, r_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_112, s_99_112 <=s (const 64 ((2**20)-1)),
    u_99_112 + v_99_112 <=s (const 64 (2**20)),
    u_99_112 - v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 + v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 - v_99_112 <=s (const 64 (2**20)),
    r_99_112 + s_99_112 <=s (const 64 (2**20)),
    r_99_112 - s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 + s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 - s_99_112 <=s (const 64 (2**20)),
    u_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_99_112 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step112

// premise b
assume
neg_g_59_low60_40_low20_13 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_14 neg_f_59_low60_40_low20_13;
mov u_99_113 u_99_112;
mov v_99_113 v_99_112;

add neg_g_59_low60_40_low20_14 neg_g_59_low60_40_low20_13 neg_f_59_low60_40_low20_13;
asr neg_g_59_low60_40_low20_14 neg_g_59_low60_40_low20_14 1;
add r_99_113 r_99_112 u_99_112;
asr r_99_113 r_99_113 1;
add s_99_113 s_99_112 v_99_112;
asr s_99_113 s_99_113 1;
assert
    true
&&
    neg_f_59_low60_40_low20_14 = neg_f_59_low60_40_low20_13,
    u_99_113 = u_99_112,
    v_99_113 = v_99_112,
    neg_g_59_low60_40_low20_14 * (const 64 2) = neg_g_59_low60_40_low20_13 + neg_f_59_low60_40_low20_13,
    r_99_113 * (const 64 2) = r_99_112 + u_99_112,
    s_99_113 * (const 64 2) = s_99_112 + v_99_112
;

assume
    neg_f_59_low60_40_low20_14 = neg_f_59_low60_40_low20_13,
    u_99_113 = u_99_112,
    v_99_113 = v_99_112,
    neg_g_59_low60_40_low20_14 * 2 = neg_g_59_low60_40_low20_13 + neg_f_59_low60_40_low20_13,
    r_99_113 * 2 = r_99_112 + u_99_112,
    s_99_113 * 2 = s_99_112 + v_99_112
&&
    true
;

{
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_14 + u_99_113 * (const 64 (2**21)) + v_99_113 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_14 + r_99_113 * (const 64 (2**21)) + s_99_113 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_14,
    neg_f_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_14,
    neg_g_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 113)) <=s delta, delta <=s (const 64 (1 + 2*113)),
    (const 64 (-(2**20))) <=s u_99_113, u_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_113, v_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_113, r_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_113, s_99_113 <=s (const 64 ((2**20)-1)),
    u_99_113 + v_99_113 <=s (const 64 (2**20)),
    u_99_113 - v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 + v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 - v_99_113 <=s (const 64 (2**20)),
    r_99_113 + s_99_113 <=s (const 64 (2**20)),
    r_99_113 - s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 + s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 - s_99_113 <=s (const 64 (2**20)),
    u_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_99_113 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_112_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_13,
sint64 neg_g_59_low60_40_low20_13,
sint64 neg_f_59_low60_40_low20_14,
sint64 neg_g_59_low60_40_low20_14,
sint64 u_99_112,
sint64 v_99_112,
sint64 r_99_112,
sint64 s_99_112,
sint64 u_99_113,
sint64 v_99_113,
sint64 r_99_113,
sint64 s_99_113,
bit ne
)={
    u_99_112 * neg_f_59_low60_40_low20_0 + v_99_112 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_13 * (-(2**20)),
    r_99_112 * neg_f_59_low60_40_low20_0 + s_99_112 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_13 * (-(2**20))
&&
    u_99_112 * neg_f_59_low60_40_low20_0 + v_99_112 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_13 * (const 64 (-(2**20))),
    r_99_112 * neg_f_59_low60_40_low20_0 + s_99_112 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_13 + u_99_112 * (const 64 (2**21)) + v_99_112 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_13 + r_99_112 * (const 64 (2**21)) + s_99_112 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_13,
    neg_f_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_13,
    neg_g_59_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 112)) <=s delta, delta <=s (const 64 (1 + 2*112)),
    (const 64 (-(2**20))) <=s u_99_112, u_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_112, v_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_112, r_99_112 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_112, s_99_112 <=s (const 64 ((2**20)-1)),
    u_99_112 + v_99_112 <=s (const 64 (2**20)),
    u_99_112 - v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 + v_99_112 <=s (const 64 (2**20)),
    (const 64 0) - u_99_112 - v_99_112 <=s (const 64 (2**20)),
    r_99_112 + s_99_112 <=s (const 64 (2**20)),
    r_99_112 - s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 + s_99_112 <=s (const 64 (2**20)),
    (const 64 0) - r_99_112 - s_99_112 <=s (const 64 (2**20)),
    u_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_99_112 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_99_112 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step112

// premise c
assume
neg_g_59_low60_40_low20_13 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_14 neg_g_59_low60_40_low20_13;
mov u_99_113 r_99_112;
mov v_99_113 s_99_112;

subs dc neg_g_59_low60_40_low20_14 neg_g_59_low60_40_low20_13 neg_f_59_low60_40_low20_13;
asr neg_g_59_low60_40_low20_14 neg_g_59_low60_40_low20_14 1;
subs dc r_99_113 r_99_112 u_99_112;
asr r_99_113 r_99_113 1;
subs dc s_99_113 s_99_112 v_99_112;
asr s_99_113 s_99_113 1;
assert
    true
&&
    neg_f_59_low60_40_low20_14 = neg_g_59_low60_40_low20_13,
    u_99_113 = r_99_112,
    v_99_113 = s_99_112,
    neg_g_59_low60_40_low20_14 * (const 64 2) = neg_g_59_low60_40_low20_13 - neg_f_59_low60_40_low20_13,
    r_99_113 * (const 64 2) = r_99_112 - u_99_112,
    s_99_113 * (const 64 2) = s_99_112 - v_99_112
;

assume
    neg_f_59_low60_40_low20_14 = neg_g_59_low60_40_low20_13,
    u_99_113 = r_99_112,
    v_99_113 = s_99_112,
    neg_g_59_low60_40_low20_14 * 2 = neg_g_59_low60_40_low20_13 - neg_f_59_low60_40_low20_13,
    r_99_113 * 2 = r_99_112 - u_99_112,
    s_99_113 * 2 = s_99_112 - v_99_112
&&
    true
;

{
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_14 + u_99_113 * (const 64 (2**21)) + v_99_113 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_14 + r_99_113 * (const 64 (2**21)) + s_99_113 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_14,
    neg_f_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_14,
    neg_g_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 113)) <=s delta, delta <=s (const 64 (1 + 2*113)),
    (const 64 (-(2**20))) <=s u_99_113, u_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_113, v_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_113, r_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_113, s_99_113 <=s (const 64 ((2**20)-1)),
    u_99_113 + v_99_113 <=s (const 64 (2**20)),
    u_99_113 - v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 + v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 - v_99_113 <=s (const 64 (2**20)),
    r_99_113 + s_99_113 <=s (const 64 (2**20)),
    r_99_113 - s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 + s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 - s_99_113 <=s (const 64 (2**20)),
    u_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_99_113 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_113_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_14,
sint64 neg_g_59_low60_40_low20_14,
sint64 neg_f_59_low60_40_low20_15,
sint64 neg_g_59_low60_40_low20_15,
sint64 u_99_113,
sint64 v_99_113,
sint64 r_99_113,
sint64 s_99_113,
sint64 u_99_114,
sint64 v_99_114,
sint64 r_99_114,
sint64 s_99_114,
bit ne
)={
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (-(2**20)),
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (-(2**20))
&&
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (const 64 (-(2**20))),
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_14 + u_99_113 * (const 64 (2**21)) + v_99_113 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_14 + r_99_113 * (const 64 (2**21)) + s_99_113 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_14,
    neg_f_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_14,
    neg_g_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 113)) <=s delta, delta <=s (const 64 (1 + 2*113)),
    (const 64 (-(2**20))) <=s u_99_113, u_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_113, v_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_113, r_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_113, s_99_113 <=s (const 64 ((2**20)-1)),
    u_99_113 + v_99_113 <=s (const 64 (2**20)),
    u_99_113 - v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 + v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 - v_99_113 <=s (const 64 (2**20)),
    r_99_113 + s_99_113 <=s (const 64 (2**20)),
    r_99_113 - s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 + s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 - s_99_113 <=s (const 64 (2**20)),
    u_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_99_113 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step113

// premise a
assume
neg_g_59_low60_40_low20_14 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_15 neg_f_59_low60_40_low20_14;
mov u_99_114 u_99_113;
mov v_99_114 v_99_113;

asr neg_g_59_low60_40_low20_15 neg_g_59_low60_40_low20_14 1;
asr r_99_114 r_99_113 1;
asr s_99_114 s_99_113 1;
assert
    true
&&
    neg_f_59_low60_40_low20_15 = neg_f_59_low60_40_low20_14,
    u_99_114 = u_99_113,
    v_99_114 = v_99_113,
    neg_g_59_low60_40_low20_15 * (const 64 2) = neg_g_59_low60_40_low20_14,
    r_99_114 * (const 64 2) = r_99_113,
    s_99_114 * (const 64 2) = s_99_113
;

assume
    neg_f_59_low60_40_low20_15 = neg_f_59_low60_40_low20_14,
    u_99_114 = u_99_113,
    v_99_114 = v_99_113,
    neg_g_59_low60_40_low20_15 * 2 = neg_g_59_low60_40_low20_14,
    r_99_114 * 2 = r_99_113,
    s_99_114 * 2 = s_99_113
&&
    true
;

{
    u_99_114 * neg_f_59_low60_40_low20_0 + v_99_114 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_114 * neg_f_59_low60_40_low20_0 + s_99_114 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_15 + u_99_114 * (const 64 (2**21)) + v_99_114 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_15 + r_99_114 * (const 64 (2**21)) + s_99_114 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_15,
    neg_f_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_15,
    neg_g_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 114)) <=s delta, delta <=s (const 64 (1 + 2*114)),
    (const 64 (-(2**20))) <=s u_99_114, u_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_114, v_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_114, r_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_114, s_99_114 <=s (const 64 ((2**20)-1)),
    u_99_114 + v_99_114 <=s (const 64 (2**20)),
    u_99_114 - v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 + v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 - v_99_114 <=s (const 64 (2**20)),
    r_99_114 + s_99_114 <=s (const 64 (2**20)),
    r_99_114 - s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 + s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 - s_99_114 <=s (const 64 (2**20)),
    u_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_99_114 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_113_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_14,
sint64 neg_g_59_low60_40_low20_14,
sint64 neg_f_59_low60_40_low20_15,
sint64 neg_g_59_low60_40_low20_15,
sint64 u_99_113,
sint64 v_99_113,
sint64 r_99_113,
sint64 s_99_113,
sint64 u_99_114,
sint64 v_99_114,
sint64 r_99_114,
sint64 s_99_114,
bit ne
)={
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (-(2**20)),
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (-(2**20))
&&
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (const 64 (-(2**20))),
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_14 + u_99_113 * (const 64 (2**21)) + v_99_113 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_14 + r_99_113 * (const 64 (2**21)) + s_99_113 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_14,
    neg_f_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_14,
    neg_g_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 113)) <=s delta, delta <=s (const 64 (1 + 2*113)),
    (const 64 (-(2**20))) <=s u_99_113, u_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_113, v_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_113, r_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_113, s_99_113 <=s (const 64 ((2**20)-1)),
    u_99_113 + v_99_113 <=s (const 64 (2**20)),
    u_99_113 - v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 + v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 - v_99_113 <=s (const 64 (2**20)),
    r_99_113 + s_99_113 <=s (const 64 (2**20)),
    r_99_113 - s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 + s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 - s_99_113 <=s (const 64 (2**20)),
    u_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_99_113 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step113

// premise b
assume
neg_g_59_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_15 neg_f_59_low60_40_low20_14;
mov u_99_114 u_99_113;
mov v_99_114 v_99_113;

add neg_g_59_low60_40_low20_15 neg_g_59_low60_40_low20_14 neg_f_59_low60_40_low20_14;
asr neg_g_59_low60_40_low20_15 neg_g_59_low60_40_low20_15 1;
add r_99_114 r_99_113 u_99_113;
asr r_99_114 r_99_114 1;
add s_99_114 s_99_113 v_99_113;
asr s_99_114 s_99_114 1;
assert
    true
&&
    neg_f_59_low60_40_low20_15 = neg_f_59_low60_40_low20_14,
    u_99_114 = u_99_113,
    v_99_114 = v_99_113,
    neg_g_59_low60_40_low20_15 * (const 64 2) = neg_g_59_low60_40_low20_14 + neg_f_59_low60_40_low20_14,
    r_99_114 * (const 64 2) = r_99_113 + u_99_113,
    s_99_114 * (const 64 2) = s_99_113 + v_99_113
;

assume
    neg_f_59_low60_40_low20_15 = neg_f_59_low60_40_low20_14,
    u_99_114 = u_99_113,
    v_99_114 = v_99_113,
    neg_g_59_low60_40_low20_15 * 2 = neg_g_59_low60_40_low20_14 + neg_f_59_low60_40_low20_14,
    r_99_114 * 2 = r_99_113 + u_99_113,
    s_99_114 * 2 = s_99_113 + v_99_113
&&
    true
;

{
    u_99_114 * neg_f_59_low60_40_low20_0 + v_99_114 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_114 * neg_f_59_low60_40_low20_0 + s_99_114 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_15 + u_99_114 * (const 64 (2**21)) + v_99_114 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_15 + r_99_114 * (const 64 (2**21)) + s_99_114 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_15,
    neg_f_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_15,
    neg_g_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 114)) <=s delta, delta <=s (const 64 (1 + 2*114)),
    (const 64 (-(2**20))) <=s u_99_114, u_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_114, v_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_114, r_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_114, s_99_114 <=s (const 64 ((2**20)-1)),
    u_99_114 + v_99_114 <=s (const 64 (2**20)),
    u_99_114 - v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 + v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 - v_99_114 <=s (const 64 (2**20)),
    r_99_114 + s_99_114 <=s (const 64 (2**20)),
    r_99_114 - s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 + s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 - s_99_114 <=s (const 64 (2**20)),
    u_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_99_114 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_113_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_14,
sint64 neg_g_59_low60_40_low20_14,
sint64 neg_f_59_low60_40_low20_15,
sint64 neg_g_59_low60_40_low20_15,
sint64 u_99_113,
sint64 v_99_113,
sint64 r_99_113,
sint64 s_99_113,
sint64 u_99_114,
sint64 v_99_114,
sint64 r_99_114,
sint64 s_99_114,
bit ne
)={
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (-(2**20)),
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (-(2**20))
&&
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (const 64 (-(2**20))),
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_14 + u_99_113 * (const 64 (2**21)) + v_99_113 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_14 + r_99_113 * (const 64 (2**21)) + s_99_113 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_14,
    neg_f_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_14,
    neg_g_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 113)) <=s delta, delta <=s (const 64 (1 + 2*113)),
    (const 64 (-(2**20))) <=s u_99_113, u_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_113, v_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_113, r_99_113 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_113, s_99_113 <=s (const 64 ((2**20)-1)),
    u_99_113 + v_99_113 <=s (const 64 (2**20)),
    u_99_113 - v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 + v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 - v_99_113 <=s (const 64 (2**20)),
    r_99_113 + s_99_113 <=s (const 64 (2**20)),
    r_99_113 - s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 + s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 - s_99_113 <=s (const 64 (2**20)),
    u_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_99_113 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step113

// premise c
assume
neg_g_59_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_15 neg_g_59_low60_40_low20_14;
mov u_99_114 r_99_113;
mov v_99_114 s_99_113;

subs dc neg_g_59_low60_40_low20_15 neg_g_59_low60_40_low20_14 neg_f_59_low60_40_low20_14;
asr neg_g_59_low60_40_low20_15 neg_g_59_low60_40_low20_15 1;
subs dc r_99_114 r_99_113 u_99_113;
asr r_99_114 r_99_114 1;
subs dc s_99_114 s_99_113 v_99_113;
asr s_99_114 s_99_114 1;
assert
    true
&&
    neg_f_59_low60_40_low20_15 = neg_g_59_low60_40_low20_14,
    u_99_114 = r_99_113,
    v_99_114 = s_99_113,
    neg_g_59_low60_40_low20_15 * (const 64 2) = neg_g_59_low60_40_low20_14 - neg_f_59_low60_40_low20_14,
    r_99_114 * (const 64 2) = r_99_113 - u_99_113,
    s_99_114 * (const 64 2) = s_99_113 - v_99_113
;

assume
    neg_f_59_low60_40_low20_15 = neg_g_59_low60_40_low20_14,
    u_99_114 = r_99_113,
    v_99_114 = s_99_113,
    neg_g_59_low60_40_low20_15 * 2 = neg_g_59_low60_40_low20_14 - neg_f_59_low60_40_low20_14,
    r_99_114 * 2 = r_99_113 - u_99_113,
    s_99_114 * 2 = s_99_113 - v_99_113
&&
    true
;

{
    u_99_114 * neg_f_59_low60_40_low20_0 + v_99_114 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_114 * neg_f_59_low60_40_low20_0 + s_99_114 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_15 + u_99_114 * (const 64 (2**21)) + v_99_114 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_15 + r_99_114 * (const 64 (2**21)) + s_99_114 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_15,
    neg_f_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_15,
    neg_g_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 114)) <=s delta, delta <=s (const 64 (1 + 2*114)),
    (const 64 (-(2**20))) <=s u_99_114, u_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_114, v_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_114, r_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_114, s_99_114 <=s (const 64 ((2**20)-1)),
    u_99_114 + v_99_114 <=s (const 64 (2**20)),
    u_99_114 - v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 + v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 - v_99_114 <=s (const 64 (2**20)),
    r_99_114 + s_99_114 <=s (const 64 (2**20)),
    r_99_114 - s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 + s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 - s_99_114 <=s (const 64 (2**20)),
    u_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_99_114 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_114_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_15,
sint64 neg_g_59_low60_40_low20_15,
sint64 neg_f_59_low60_40_low20_16,
sint64 neg_g_59_low60_40_low20_16,
sint64 u_99_114,
sint64 v_99_114,
sint64 r_99_114,
sint64 s_99_114,
sint64 u_99_115,
sint64 v_99_115,
sint64 r_99_115,
sint64 s_99_115,
bit ne
)={
    u_99_114 * neg_f_59_low60_40_low20_0 + v_99_114 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_15 * (-(2**20)),
    r_99_114 * neg_f_59_low60_40_low20_0 + s_99_114 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_15 * (-(2**20))
&&
    u_99_114 * neg_f_59_low60_40_low20_0 + v_99_114 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_15 * (const 64 (-(2**20))),
    r_99_114 * neg_f_59_low60_40_low20_0 + s_99_114 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_15 + u_99_114 * (const 64 (2**21)) + v_99_114 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_15 + r_99_114 * (const 64 (2**21)) + s_99_114 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_15,
    neg_f_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_15,
    neg_g_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 114)) <=s delta, delta <=s (const 64 (1 + 2*114)),
    (const 64 (-(2**20))) <=s u_99_114, u_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_114, v_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_114, r_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_114, s_99_114 <=s (const 64 ((2**20)-1)),
    u_99_114 + v_99_114 <=s (const 64 (2**20)),
    u_99_114 - v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 + v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 - v_99_114 <=s (const 64 (2**20)),
    r_99_114 + s_99_114 <=s (const 64 (2**20)),
    r_99_114 - s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 + s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 - s_99_114 <=s (const 64 (2**20)),
    u_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_99_114 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step114

// premise a
assume
neg_g_59_low60_40_low20_15 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_16 neg_f_59_low60_40_low20_15;
mov u_99_115 u_99_114;
mov v_99_115 v_99_114;

asr neg_g_59_low60_40_low20_16 neg_g_59_low60_40_low20_15 1;
asr r_99_115 r_99_114 1;
asr s_99_115 s_99_114 1;
assert
    true
&&
    neg_f_59_low60_40_low20_16 = neg_f_59_low60_40_low20_15,
    u_99_115 = u_99_114,
    v_99_115 = v_99_114,
    neg_g_59_low60_40_low20_16 * (const 64 2) = neg_g_59_low60_40_low20_15,
    r_99_115 * (const 64 2) = r_99_114,
    s_99_115 * (const 64 2) = s_99_114
;

assume
    neg_f_59_low60_40_low20_16 = neg_f_59_low60_40_low20_15,
    u_99_115 = u_99_114,
    v_99_115 = v_99_114,
    neg_g_59_low60_40_low20_16 * 2 = neg_g_59_low60_40_low20_15,
    r_99_115 * 2 = r_99_114,
    s_99_115 * 2 = s_99_114
&&
    true
;

{
    u_99_115 * neg_f_59_low60_40_low20_0 + v_99_115 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_115 * neg_f_59_low60_40_low20_0 + s_99_115 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_16 + u_99_115 * (const 64 (2**21)) + v_99_115 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_16 + r_99_115 * (const 64 (2**21)) + s_99_115 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_16,
    neg_f_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_16,
    neg_g_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 115)) <=s delta, delta <=s (const 64 (1 + 2*115)),
    (const 64 (-(2**20))) <=s u_99_115, u_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_115, v_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_115, r_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_115, s_99_115 <=s (const 64 ((2**20)-1)),
    u_99_115 + v_99_115 <=s (const 64 (2**20)),
    u_99_115 - v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 + v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 - v_99_115 <=s (const 64 (2**20)),
    r_99_115 + s_99_115 <=s (const 64 (2**20)),
    r_99_115 - s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 + s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 - s_99_115 <=s (const 64 (2**20)),
    u_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_99_115 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_114_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_15,
sint64 neg_g_59_low60_40_low20_15,
sint64 neg_f_59_low60_40_low20_16,
sint64 neg_g_59_low60_40_low20_16,
sint64 u_99_114,
sint64 v_99_114,
sint64 r_99_114,
sint64 s_99_114,
sint64 u_99_115,
sint64 v_99_115,
sint64 r_99_115,
sint64 s_99_115,
bit ne
)={
    u_99_114 * neg_f_59_low60_40_low20_0 + v_99_114 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_15 * (-(2**20)),
    r_99_114 * neg_f_59_low60_40_low20_0 + s_99_114 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_15 * (-(2**20))
&&
    u_99_114 * neg_f_59_low60_40_low20_0 + v_99_114 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_15 * (const 64 (-(2**20))),
    r_99_114 * neg_f_59_low60_40_low20_0 + s_99_114 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_15 + u_99_114 * (const 64 (2**21)) + v_99_114 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_15 + r_99_114 * (const 64 (2**21)) + s_99_114 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_15,
    neg_f_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_15,
    neg_g_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 114)) <=s delta, delta <=s (const 64 (1 + 2*114)),
    (const 64 (-(2**20))) <=s u_99_114, u_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_114, v_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_114, r_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_114, s_99_114 <=s (const 64 ((2**20)-1)),
    u_99_114 + v_99_114 <=s (const 64 (2**20)),
    u_99_114 - v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 + v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 - v_99_114 <=s (const 64 (2**20)),
    r_99_114 + s_99_114 <=s (const 64 (2**20)),
    r_99_114 - s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 + s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 - s_99_114 <=s (const 64 (2**20)),
    u_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_99_114 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step114

// premise b
assume
neg_g_59_low60_40_low20_15 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_16 neg_f_59_low60_40_low20_15;
mov u_99_115 u_99_114;
mov v_99_115 v_99_114;

add neg_g_59_low60_40_low20_16 neg_g_59_low60_40_low20_15 neg_f_59_low60_40_low20_15;
asr neg_g_59_low60_40_low20_16 neg_g_59_low60_40_low20_16 1;
add r_99_115 r_99_114 u_99_114;
asr r_99_115 r_99_115 1;
add s_99_115 s_99_114 v_99_114;
asr s_99_115 s_99_115 1;
assert
    true
&&
    neg_f_59_low60_40_low20_16 = neg_f_59_low60_40_low20_15,
    u_99_115 = u_99_114,
    v_99_115 = v_99_114,
    neg_g_59_low60_40_low20_16 * (const 64 2) = neg_g_59_low60_40_low20_15 + neg_f_59_low60_40_low20_15,
    r_99_115 * (const 64 2) = r_99_114 + u_99_114,
    s_99_115 * (const 64 2) = s_99_114 + v_99_114
;

assume
    neg_f_59_low60_40_low20_16 = neg_f_59_low60_40_low20_15,
    u_99_115 = u_99_114,
    v_99_115 = v_99_114,
    neg_g_59_low60_40_low20_16 * 2 = neg_g_59_low60_40_low20_15 + neg_f_59_low60_40_low20_15,
    r_99_115 * 2 = r_99_114 + u_99_114,
    s_99_115 * 2 = s_99_114 + v_99_114
&&
    true
;

{
    u_99_115 * neg_f_59_low60_40_low20_0 + v_99_115 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_115 * neg_f_59_low60_40_low20_0 + s_99_115 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_16 + u_99_115 * (const 64 (2**21)) + v_99_115 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_16 + r_99_115 * (const 64 (2**21)) + s_99_115 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_16,
    neg_f_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_16,
    neg_g_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 115)) <=s delta, delta <=s (const 64 (1 + 2*115)),
    (const 64 (-(2**20))) <=s u_99_115, u_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_115, v_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_115, r_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_115, s_99_115 <=s (const 64 ((2**20)-1)),
    u_99_115 + v_99_115 <=s (const 64 (2**20)),
    u_99_115 - v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 + v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 - v_99_115 <=s (const 64 (2**20)),
    r_99_115 + s_99_115 <=s (const 64 (2**20)),
    r_99_115 - s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 + s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 - s_99_115 <=s (const 64 (2**20)),
    u_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_99_115 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_114_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_15,
sint64 neg_g_59_low60_40_low20_15,
sint64 neg_f_59_low60_40_low20_16,
sint64 neg_g_59_low60_40_low20_16,
sint64 u_99_114,
sint64 v_99_114,
sint64 r_99_114,
sint64 s_99_114,
sint64 u_99_115,
sint64 v_99_115,
sint64 r_99_115,
sint64 s_99_115,
bit ne
)={
    u_99_114 * neg_f_59_low60_40_low20_0 + v_99_114 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_15 * (-(2**20)),
    r_99_114 * neg_f_59_low60_40_low20_0 + s_99_114 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_15 * (-(2**20))
&&
    u_99_114 * neg_f_59_low60_40_low20_0 + v_99_114 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_15 * (const 64 (-(2**20))),
    r_99_114 * neg_f_59_low60_40_low20_0 + s_99_114 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_15 + u_99_114 * (const 64 (2**21)) + v_99_114 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_15 + r_99_114 * (const 64 (2**21)) + s_99_114 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_15,
    neg_f_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_15,
    neg_g_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 114)) <=s delta, delta <=s (const 64 (1 + 2*114)),
    (const 64 (-(2**20))) <=s u_99_114, u_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_114, v_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_114, r_99_114 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_114, s_99_114 <=s (const 64 ((2**20)-1)),
    u_99_114 + v_99_114 <=s (const 64 (2**20)),
    u_99_114 - v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 + v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 - v_99_114 <=s (const 64 (2**20)),
    r_99_114 + s_99_114 <=s (const 64 (2**20)),
    r_99_114 - s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 + s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 - s_99_114 <=s (const 64 (2**20)),
    u_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_99_114 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step114

// premise c
assume
neg_g_59_low60_40_low20_15 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_16 neg_g_59_low60_40_low20_15;
mov u_99_115 r_99_114;
mov v_99_115 s_99_114;

subs dc neg_g_59_low60_40_low20_16 neg_g_59_low60_40_low20_15 neg_f_59_low60_40_low20_15;
asr neg_g_59_low60_40_low20_16 neg_g_59_low60_40_low20_16 1;
subs dc r_99_115 r_99_114 u_99_114;
asr r_99_115 r_99_115 1;
subs dc s_99_115 s_99_114 v_99_114;
asr s_99_115 s_99_115 1;
assert
    true
&&
    neg_f_59_low60_40_low20_16 = neg_g_59_low60_40_low20_15,
    u_99_115 = r_99_114,
    v_99_115 = s_99_114,
    neg_g_59_low60_40_low20_16 * (const 64 2) = neg_g_59_low60_40_low20_15 - neg_f_59_low60_40_low20_15,
    r_99_115 * (const 64 2) = r_99_114 - u_99_114,
    s_99_115 * (const 64 2) = s_99_114 - v_99_114
;

assume
    neg_f_59_low60_40_low20_16 = neg_g_59_low60_40_low20_15,
    u_99_115 = r_99_114,
    v_99_115 = s_99_114,
    neg_g_59_low60_40_low20_16 * 2 = neg_g_59_low60_40_low20_15 - neg_f_59_low60_40_low20_15,
    r_99_115 * 2 = r_99_114 - u_99_114,
    s_99_115 * 2 = s_99_114 - v_99_114
&&
    true
;

{
    u_99_115 * neg_f_59_low60_40_low20_0 + v_99_115 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_115 * neg_f_59_low60_40_low20_0 + s_99_115 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_16 + u_99_115 * (const 64 (2**21)) + v_99_115 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_16 + r_99_115 * (const 64 (2**21)) + s_99_115 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_16,
    neg_f_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_16,
    neg_g_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 115)) <=s delta, delta <=s (const 64 (1 + 2*115)),
    (const 64 (-(2**20))) <=s u_99_115, u_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_115, v_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_115, r_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_115, s_99_115 <=s (const 64 ((2**20)-1)),
    u_99_115 + v_99_115 <=s (const 64 (2**20)),
    u_99_115 - v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 + v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 - v_99_115 <=s (const 64 (2**20)),
    r_99_115 + s_99_115 <=s (const 64 (2**20)),
    r_99_115 - s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 + s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 - s_99_115 <=s (const 64 (2**20)),
    u_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_99_115 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_115_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_16,
sint64 neg_g_59_low60_40_low20_16,
sint64 neg_f_59_low60_40_low20_17,
sint64 neg_g_59_low60_40_low20_17,
sint64 u_99_115,
sint64 v_99_115,
sint64 r_99_115,
sint64 s_99_115,
sint64 u_99_116,
sint64 v_99_116,
sint64 r_99_116,
sint64 s_99_116,
bit ne
)={
    u_99_115 * neg_f_59_low60_40_low20_0 + v_99_115 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_16 * (-(2**20)),
    r_99_115 * neg_f_59_low60_40_low20_0 + s_99_115 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_16 * (-(2**20))
&&
    u_99_115 * neg_f_59_low60_40_low20_0 + v_99_115 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_16 * (const 64 (-(2**20))),
    r_99_115 * neg_f_59_low60_40_low20_0 + s_99_115 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_16 + u_99_115 * (const 64 (2**21)) + v_99_115 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_16 + r_99_115 * (const 64 (2**21)) + s_99_115 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_16,
    neg_f_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_16,
    neg_g_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 115)) <=s delta, delta <=s (const 64 (1 + 2*115)),
    (const 64 (-(2**20))) <=s u_99_115, u_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_115, v_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_115, r_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_115, s_99_115 <=s (const 64 ((2**20)-1)),
    u_99_115 + v_99_115 <=s (const 64 (2**20)),
    u_99_115 - v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 + v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 - v_99_115 <=s (const 64 (2**20)),
    r_99_115 + s_99_115 <=s (const 64 (2**20)),
    r_99_115 - s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 + s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 - s_99_115 <=s (const 64 (2**20)),
    u_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_99_115 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step115

// premise a
assume
neg_g_59_low60_40_low20_16 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_17 neg_f_59_low60_40_low20_16;
mov u_99_116 u_99_115;
mov v_99_116 v_99_115;

asr neg_g_59_low60_40_low20_17 neg_g_59_low60_40_low20_16 1;
asr r_99_116 r_99_115 1;
asr s_99_116 s_99_115 1;
assert
    true
&&
    neg_f_59_low60_40_low20_17 = neg_f_59_low60_40_low20_16,
    u_99_116 = u_99_115,
    v_99_116 = v_99_115,
    neg_g_59_low60_40_low20_17 * (const 64 2) = neg_g_59_low60_40_low20_16,
    r_99_116 * (const 64 2) = r_99_115,
    s_99_116 * (const 64 2) = s_99_115
;

assume
    neg_f_59_low60_40_low20_17 = neg_f_59_low60_40_low20_16,
    u_99_116 = u_99_115,
    v_99_116 = v_99_115,
    neg_g_59_low60_40_low20_17 * 2 = neg_g_59_low60_40_low20_16,
    r_99_116 * 2 = r_99_115,
    s_99_116 * 2 = s_99_115
&&
    true
;

{
    u_99_116 * neg_f_59_low60_40_low20_0 + v_99_116 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_116 * neg_f_59_low60_40_low20_0 + s_99_116 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_17 + u_99_116 * (const 64 (2**21)) + v_99_116 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_17 + r_99_116 * (const 64 (2**21)) + s_99_116 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_17,
    neg_f_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_17,
    neg_g_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 116)) <=s delta, delta <=s (const 64 (1 + 2*116)),
    (const 64 (-(2**20))) <=s u_99_116, u_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_116, v_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_116, r_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_116, s_99_116 <=s (const 64 ((2**20)-1)),
    u_99_116 + v_99_116 <=s (const 64 (2**20)),
    u_99_116 - v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 + v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 - v_99_116 <=s (const 64 (2**20)),
    r_99_116 + s_99_116 <=s (const 64 (2**20)),
    r_99_116 - s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 + s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 - s_99_116 <=s (const 64 (2**20)),
    u_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_99_116 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_115_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_16,
sint64 neg_g_59_low60_40_low20_16,
sint64 neg_f_59_low60_40_low20_17,
sint64 neg_g_59_low60_40_low20_17,
sint64 u_99_115,
sint64 v_99_115,
sint64 r_99_115,
sint64 s_99_115,
sint64 u_99_116,
sint64 v_99_116,
sint64 r_99_116,
sint64 s_99_116,
bit ne
)={
    u_99_115 * neg_f_59_low60_40_low20_0 + v_99_115 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_16 * (-(2**20)),
    r_99_115 * neg_f_59_low60_40_low20_0 + s_99_115 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_16 * (-(2**20))
&&
    u_99_115 * neg_f_59_low60_40_low20_0 + v_99_115 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_16 * (const 64 (-(2**20))),
    r_99_115 * neg_f_59_low60_40_low20_0 + s_99_115 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_16 + u_99_115 * (const 64 (2**21)) + v_99_115 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_16 + r_99_115 * (const 64 (2**21)) + s_99_115 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_16,
    neg_f_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_16,
    neg_g_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 115)) <=s delta, delta <=s (const 64 (1 + 2*115)),
    (const 64 (-(2**20))) <=s u_99_115, u_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_115, v_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_115, r_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_115, s_99_115 <=s (const 64 ((2**20)-1)),
    u_99_115 + v_99_115 <=s (const 64 (2**20)),
    u_99_115 - v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 + v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 - v_99_115 <=s (const 64 (2**20)),
    r_99_115 + s_99_115 <=s (const 64 (2**20)),
    r_99_115 - s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 + s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 - s_99_115 <=s (const 64 (2**20)),
    u_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_99_115 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step115

// premise b
assume
neg_g_59_low60_40_low20_16 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_17 neg_f_59_low60_40_low20_16;
mov u_99_116 u_99_115;
mov v_99_116 v_99_115;

add neg_g_59_low60_40_low20_17 neg_g_59_low60_40_low20_16 neg_f_59_low60_40_low20_16;
asr neg_g_59_low60_40_low20_17 neg_g_59_low60_40_low20_17 1;
add r_99_116 r_99_115 u_99_115;
asr r_99_116 r_99_116 1;
add s_99_116 s_99_115 v_99_115;
asr s_99_116 s_99_116 1;
assert
    true
&&
    neg_f_59_low60_40_low20_17 = neg_f_59_low60_40_low20_16,
    u_99_116 = u_99_115,
    v_99_116 = v_99_115,
    neg_g_59_low60_40_low20_17 * (const 64 2) = neg_g_59_low60_40_low20_16 + neg_f_59_low60_40_low20_16,
    r_99_116 * (const 64 2) = r_99_115 + u_99_115,
    s_99_116 * (const 64 2) = s_99_115 + v_99_115
;

assume
    neg_f_59_low60_40_low20_17 = neg_f_59_low60_40_low20_16,
    u_99_116 = u_99_115,
    v_99_116 = v_99_115,
    neg_g_59_low60_40_low20_17 * 2 = neg_g_59_low60_40_low20_16 + neg_f_59_low60_40_low20_16,
    r_99_116 * 2 = r_99_115 + u_99_115,
    s_99_116 * 2 = s_99_115 + v_99_115
&&
    true
;

{
    u_99_116 * neg_f_59_low60_40_low20_0 + v_99_116 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_116 * neg_f_59_low60_40_low20_0 + s_99_116 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_17 + u_99_116 * (const 64 (2**21)) + v_99_116 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_17 + r_99_116 * (const 64 (2**21)) + s_99_116 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_17,
    neg_f_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_17,
    neg_g_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 116)) <=s delta, delta <=s (const 64 (1 + 2*116)),
    (const 64 (-(2**20))) <=s u_99_116, u_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_116, v_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_116, r_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_116, s_99_116 <=s (const 64 ((2**20)-1)),
    u_99_116 + v_99_116 <=s (const 64 (2**20)),
    u_99_116 - v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 + v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 - v_99_116 <=s (const 64 (2**20)),
    r_99_116 + s_99_116 <=s (const 64 (2**20)),
    r_99_116 - s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 + s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 - s_99_116 <=s (const 64 (2**20)),
    u_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_99_116 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_115_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_16,
sint64 neg_g_59_low60_40_low20_16,
sint64 neg_f_59_low60_40_low20_17,
sint64 neg_g_59_low60_40_low20_17,
sint64 u_99_115,
sint64 v_99_115,
sint64 r_99_115,
sint64 s_99_115,
sint64 u_99_116,
sint64 v_99_116,
sint64 r_99_116,
sint64 s_99_116,
bit ne
)={
    u_99_115 * neg_f_59_low60_40_low20_0 + v_99_115 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_16 * (-(2**20)),
    r_99_115 * neg_f_59_low60_40_low20_0 + s_99_115 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_16 * (-(2**20))
&&
    u_99_115 * neg_f_59_low60_40_low20_0 + v_99_115 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_16 * (const 64 (-(2**20))),
    r_99_115 * neg_f_59_low60_40_low20_0 + s_99_115 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_16 + u_99_115 * (const 64 (2**21)) + v_99_115 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_16 + r_99_115 * (const 64 (2**21)) + s_99_115 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_16,
    neg_f_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_16,
    neg_g_59_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 115)) <=s delta, delta <=s (const 64 (1 + 2*115)),
    (const 64 (-(2**20))) <=s u_99_115, u_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_115, v_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_115, r_99_115 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_115, s_99_115 <=s (const 64 ((2**20)-1)),
    u_99_115 + v_99_115 <=s (const 64 (2**20)),
    u_99_115 - v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 + v_99_115 <=s (const 64 (2**20)),
    (const 64 0) - u_99_115 - v_99_115 <=s (const 64 (2**20)),
    r_99_115 + s_99_115 <=s (const 64 (2**20)),
    r_99_115 - s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 + s_99_115 <=s (const 64 (2**20)),
    (const 64 0) - r_99_115 - s_99_115 <=s (const 64 (2**20)),
    u_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_99_115 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_99_115 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step115

// premise c
assume
neg_g_59_low60_40_low20_16 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_17 neg_g_59_low60_40_low20_16;
mov u_99_116 r_99_115;
mov v_99_116 s_99_115;

subs dc neg_g_59_low60_40_low20_17 neg_g_59_low60_40_low20_16 neg_f_59_low60_40_low20_16;
asr neg_g_59_low60_40_low20_17 neg_g_59_low60_40_low20_17 1;
subs dc r_99_116 r_99_115 u_99_115;
asr r_99_116 r_99_116 1;
subs dc s_99_116 s_99_115 v_99_115;
asr s_99_116 s_99_116 1;
assert
    true
&&
    neg_f_59_low60_40_low20_17 = neg_g_59_low60_40_low20_16,
    u_99_116 = r_99_115,
    v_99_116 = s_99_115,
    neg_g_59_low60_40_low20_17 * (const 64 2) = neg_g_59_low60_40_low20_16 - neg_f_59_low60_40_low20_16,
    r_99_116 * (const 64 2) = r_99_115 - u_99_115,
    s_99_116 * (const 64 2) = s_99_115 - v_99_115
;

assume
    neg_f_59_low60_40_low20_17 = neg_g_59_low60_40_low20_16,
    u_99_116 = r_99_115,
    v_99_116 = s_99_115,
    neg_g_59_low60_40_low20_17 * 2 = neg_g_59_low60_40_low20_16 - neg_f_59_low60_40_low20_16,
    r_99_116 * 2 = r_99_115 - u_99_115,
    s_99_116 * 2 = s_99_115 - v_99_115
&&
    true
;

{
    u_99_116 * neg_f_59_low60_40_low20_0 + v_99_116 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_116 * neg_f_59_low60_40_low20_0 + s_99_116 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_17 + u_99_116 * (const 64 (2**21)) + v_99_116 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_17 + r_99_116 * (const 64 (2**21)) + s_99_116 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_17,
    neg_f_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_17,
    neg_g_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 116)) <=s delta, delta <=s (const 64 (1 + 2*116)),
    (const 64 (-(2**20))) <=s u_99_116, u_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_116, v_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_116, r_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_116, s_99_116 <=s (const 64 ((2**20)-1)),
    u_99_116 + v_99_116 <=s (const 64 (2**20)),
    u_99_116 - v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 + v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 - v_99_116 <=s (const 64 (2**20)),
    r_99_116 + s_99_116 <=s (const 64 (2**20)),
    r_99_116 - s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 + s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 - s_99_116 <=s (const 64 (2**20)),
    u_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_99_116 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_116_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_17,
sint64 neg_g_59_low60_40_low20_17,
sint64 neg_f_59_low60_40_low20_18,
sint64 neg_g_59_low60_40_low20_18,
sint64 u_99_116,
sint64 v_99_116,
sint64 r_99_116,
sint64 s_99_116,
sint64 u_99_117,
sint64 v_99_117,
sint64 r_99_117,
sint64 s_99_117,
bit ne
)={
    u_99_116 * neg_f_59_low60_40_low20_0 + v_99_116 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_17 * (-(2**20)),
    r_99_116 * neg_f_59_low60_40_low20_0 + s_99_116 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_17 * (-(2**20))
&&
    u_99_116 * neg_f_59_low60_40_low20_0 + v_99_116 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_17 * (const 64 (-(2**20))),
    r_99_116 * neg_f_59_low60_40_low20_0 + s_99_116 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_17 + u_99_116 * (const 64 (2**21)) + v_99_116 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_17 + r_99_116 * (const 64 (2**21)) + s_99_116 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_17,
    neg_f_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_17,
    neg_g_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 116)) <=s delta, delta <=s (const 64 (1 + 2*116)),
    (const 64 (-(2**20))) <=s u_99_116, u_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_116, v_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_116, r_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_116, s_99_116 <=s (const 64 ((2**20)-1)),
    u_99_116 + v_99_116 <=s (const 64 (2**20)),
    u_99_116 - v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 + v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 - v_99_116 <=s (const 64 (2**20)),
    r_99_116 + s_99_116 <=s (const 64 (2**20)),
    r_99_116 - s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 + s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 - s_99_116 <=s (const 64 (2**20)),
    u_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_99_116 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step116

// premise a
assume
neg_g_59_low60_40_low20_17 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_59_low60_40_low20_18 neg_f_59_low60_40_low20_17;
mov u_99_117 u_99_116;
mov v_99_117 v_99_116;

asr neg_g_59_low60_40_low20_18 neg_g_59_low60_40_low20_17 1;
asr r_99_117 r_99_116 1;
asr s_99_117 s_99_116 1;
assert
    true
&&
    neg_f_59_low60_40_low20_18 = neg_f_59_low60_40_low20_17,
    u_99_117 = u_99_116,
    v_99_117 = v_99_116,
    neg_g_59_low60_40_low20_18 * (const 64 2) = neg_g_59_low60_40_low20_17,
    r_99_117 * (const 64 2) = r_99_116,
    s_99_117 * (const 64 2) = s_99_116
;

assume
    neg_f_59_low60_40_low20_18 = neg_f_59_low60_40_low20_17,
    u_99_117 = u_99_116,
    v_99_117 = v_99_116,
    neg_g_59_low60_40_low20_18 * 2 = neg_g_59_low60_40_low20_17,
    r_99_117 * 2 = r_99_116,
    s_99_117 * 2 = s_99_116
&&
    true
;

{
    u_99_117 * neg_f_59_low60_40_low20_0 + v_99_117 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_117 * neg_f_59_low60_40_low20_0 + s_99_117 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_18 + u_99_117 * (const 64 (2**21)) + v_99_117 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_18 + r_99_117 * (const 64 (2**21)) + s_99_117 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_18,
    neg_f_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_18,
    neg_g_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 117)) <=s delta, delta <=s (const 64 (1 + 2*117)),
    (const 64 (-(2**20))) <=s u_99_117, u_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_117, v_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_117, r_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_117, s_99_117 <=s (const 64 ((2**20)-1)),
    u_99_117 + v_99_117 <=s (const 64 (2**20)),
    u_99_117 - v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 + v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 - v_99_117 <=s (const 64 (2**20)),
    r_99_117 + s_99_117 <=s (const 64 (2**20)),
    r_99_117 - s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 + s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 - s_99_117 <=s (const 64 (2**20)),
    u_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_99_117 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_116_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_17,
sint64 neg_g_59_low60_40_low20_17,
sint64 neg_f_59_low60_40_low20_18,
sint64 neg_g_59_low60_40_low20_18,
sint64 u_99_116,
sint64 v_99_116,
sint64 r_99_116,
sint64 s_99_116,
sint64 u_99_117,
sint64 v_99_117,
sint64 r_99_117,
sint64 s_99_117,
bit ne
)={
    u_99_116 * neg_f_59_low60_40_low20_0 + v_99_116 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_17 * (-(2**20)),
    r_99_116 * neg_f_59_low60_40_low20_0 + s_99_116 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_17 * (-(2**20))
&&
    u_99_116 * neg_f_59_low60_40_low20_0 + v_99_116 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_17 * (const 64 (-(2**20))),
    r_99_116 * neg_f_59_low60_40_low20_0 + s_99_116 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_17 + u_99_116 * (const 64 (2**21)) + v_99_116 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_17 + r_99_116 * (const 64 (2**21)) + s_99_116 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_17,
    neg_f_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_17,
    neg_g_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 116)) <=s delta, delta <=s (const 64 (1 + 2*116)),
    (const 64 (-(2**20))) <=s u_99_116, u_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_116, v_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_116, r_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_116, s_99_116 <=s (const 64 ((2**20)-1)),
    u_99_116 + v_99_116 <=s (const 64 (2**20)),
    u_99_116 - v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 + v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 - v_99_116 <=s (const 64 (2**20)),
    r_99_116 + s_99_116 <=s (const 64 (2**20)),
    r_99_116 - s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 + s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 - s_99_116 <=s (const 64 (2**20)),
    u_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_99_116 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step116

// premise b
assume
neg_g_59_low60_40_low20_17 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_18 neg_f_59_low60_40_low20_17;
mov u_99_117 u_99_116;
mov v_99_117 v_99_116;

add neg_g_59_low60_40_low20_18 neg_g_59_low60_40_low20_17 neg_f_59_low60_40_low20_17;
asr neg_g_59_low60_40_low20_18 neg_g_59_low60_40_low20_18 1;
add r_99_117 r_99_116 u_99_116;
asr r_99_117 r_99_117 1;
add s_99_117 s_99_116 v_99_116;
asr s_99_117 s_99_117 1;
assert
    true
&&
    neg_f_59_low60_40_low20_18 = neg_f_59_low60_40_low20_17,
    u_99_117 = u_99_116,
    v_99_117 = v_99_116,
    neg_g_59_low60_40_low20_18 * (const 64 2) = neg_g_59_low60_40_low20_17 + neg_f_59_low60_40_low20_17,
    r_99_117 * (const 64 2) = r_99_116 + u_99_116,
    s_99_117 * (const 64 2) = s_99_116 + v_99_116
;

assume
    neg_f_59_low60_40_low20_18 = neg_f_59_low60_40_low20_17,
    u_99_117 = u_99_116,
    v_99_117 = v_99_116,
    neg_g_59_low60_40_low20_18 * 2 = neg_g_59_low60_40_low20_17 + neg_f_59_low60_40_low20_17,
    r_99_117 * 2 = r_99_116 + u_99_116,
    s_99_117 * 2 = s_99_116 + v_99_116
&&
    true
;

{
    u_99_117 * neg_f_59_low60_40_low20_0 + v_99_117 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_117 * neg_f_59_low60_40_low20_0 + s_99_117 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_18 + u_99_117 * (const 64 (2**21)) + v_99_117 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_18 + r_99_117 * (const 64 (2**21)) + s_99_117 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_18,
    neg_f_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_18,
    neg_g_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 117)) <=s delta, delta <=s (const 64 (1 + 2*117)),
    (const 64 (-(2**20))) <=s u_99_117, u_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_117, v_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_117, r_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_117, s_99_117 <=s (const 64 ((2**20)-1)),
    u_99_117 + v_99_117 <=s (const 64 (2**20)),
    u_99_117 - v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 + v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 - v_99_117 <=s (const 64 (2**20)),
    r_99_117 + s_99_117 <=s (const 64 (2**20)),
    r_99_117 - s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 + s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 - s_99_117 <=s (const 64 (2**20)),
    u_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_99_117 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_116_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_17,
sint64 neg_g_59_low60_40_low20_17,
sint64 neg_f_59_low60_40_low20_18,
sint64 neg_g_59_low60_40_low20_18,
sint64 u_99_116,
sint64 v_99_116,
sint64 r_99_116,
sint64 s_99_116,
sint64 u_99_117,
sint64 v_99_117,
sint64 r_99_117,
sint64 s_99_117,
bit ne
)={
    u_99_116 * neg_f_59_low60_40_low20_0 + v_99_116 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_17 * (-(2**20)),
    r_99_116 * neg_f_59_low60_40_low20_0 + s_99_116 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_17 * (-(2**20))
&&
    u_99_116 * neg_f_59_low60_40_low20_0 + v_99_116 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_17 * (const 64 (-(2**20))),
    r_99_116 * neg_f_59_low60_40_low20_0 + s_99_116 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_17 + u_99_116 * (const 64 (2**21)) + v_99_116 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_17 + r_99_116 * (const 64 (2**21)) + s_99_116 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_17,
    neg_f_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_17,
    neg_g_59_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 116)) <=s delta, delta <=s (const 64 (1 + 2*116)),
    (const 64 (-(2**20))) <=s u_99_116, u_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_116, v_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_116, r_99_116 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_116, s_99_116 <=s (const 64 ((2**20)-1)),
    u_99_116 + v_99_116 <=s (const 64 (2**20)),
    u_99_116 - v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 + v_99_116 <=s (const 64 (2**20)),
    (const 64 0) - u_99_116 - v_99_116 <=s (const 64 (2**20)),
    r_99_116 + s_99_116 <=s (const 64 (2**20)),
    r_99_116 - s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 + s_99_116 <=s (const 64 (2**20)),
    (const 64 0) - r_99_116 - s_99_116 <=s (const 64 (2**20)),
    u_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_99_116 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_99_116 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step116

// premise c
assume
neg_g_59_low60_40_low20_17 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_18 neg_g_59_low60_40_low20_17;
mov u_99_117 r_99_116;
mov v_99_117 s_99_116;

subs dc neg_g_59_low60_40_low20_18 neg_g_59_low60_40_low20_17 neg_f_59_low60_40_low20_17;
asr neg_g_59_low60_40_low20_18 neg_g_59_low60_40_low20_18 1;
subs dc r_99_117 r_99_116 u_99_116;
asr r_99_117 r_99_117 1;
subs dc s_99_117 s_99_116 v_99_116;
asr s_99_117 s_99_117 1;
assert
    true
&&
    neg_f_59_low60_40_low20_18 = neg_g_59_low60_40_low20_17,
    u_99_117 = r_99_116,
    v_99_117 = s_99_116,
    neg_g_59_low60_40_low20_18 * (const 64 2) = neg_g_59_low60_40_low20_17 - neg_f_59_low60_40_low20_17,
    r_99_117 * (const 64 2) = r_99_116 - u_99_116,
    s_99_117 * (const 64 2) = s_99_116 - v_99_116
;

assume
    neg_f_59_low60_40_low20_18 = neg_g_59_low60_40_low20_17,
    u_99_117 = r_99_116,
    v_99_117 = s_99_116,
    neg_g_59_low60_40_low20_18 * 2 = neg_g_59_low60_40_low20_17 - neg_f_59_low60_40_low20_17,
    r_99_117 * 2 = r_99_116 - u_99_116,
    s_99_117 * 2 = s_99_116 - v_99_116
&&
    true
;

{
    u_99_117 * neg_f_59_low60_40_low20_0 + v_99_117 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_117 * neg_f_59_low60_40_low20_0 + s_99_117 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_18 + u_99_117 * (const 64 (2**21)) + v_99_117 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_18 + r_99_117 * (const 64 (2**21)) + s_99_117 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_18,
    neg_f_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_18,
    neg_g_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 117)) <=s delta, delta <=s (const 64 (1 + 2*117)),
    (const 64 (-(2**20))) <=s u_99_117, u_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_117, v_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_117, r_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_117, s_99_117 <=s (const 64 ((2**20)-1)),
    u_99_117 + v_99_117 <=s (const 64 (2**20)),
    u_99_117 - v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 + v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 - v_99_117 <=s (const 64 (2**20)),
    r_99_117 + s_99_117 <=s (const 64 (2**20)),
    r_99_117 - s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 + s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 - s_99_117 <=s (const 64 (2**20)),
    u_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_99_117 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_117_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_18,
sint64 neg_g_59_low60_40_low20_18,
sint64 neg_f_59_low60_40_low20_19,
sint64 neg_g_59_low60_40_low20_19,
sint64 u_99_117,
sint64 v_99_117,
sint64 r_99_117,
sint64 s_99_117,
sint64 u_99_118,
sint64 v_99_118,
sint64 r_99_118,
sint64 s_99_118,
bit ne
)={
    u_99_117 * neg_f_59_low60_40_low20_0 + v_99_117 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_18 * (-(2**20)),
    r_99_117 * neg_f_59_low60_40_low20_0 + s_99_117 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_18 * (-(2**20))
&&
    u_99_117 * neg_f_59_low60_40_low20_0 + v_99_117 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_18 * (const 64 (-(2**20))),
    r_99_117 * neg_f_59_low60_40_low20_0 + s_99_117 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_18 + u_99_117 * (const 64 (2**21)) + v_99_117 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_18 + r_99_117 * (const 64 (2**21)) + s_99_117 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_18,
    neg_f_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_18,
    neg_g_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 117)) <=s delta, delta <=s (const 64 (1 + 2*117)),
    (const 64 (-(2**20))) <=s u_99_117, u_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_117, v_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_117, r_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_117, s_99_117 <=s (const 64 ((2**20)-1)),
    u_99_117 + v_99_117 <=s (const 64 (2**20)),
    u_99_117 - v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 + v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 - v_99_117 <=s (const 64 (2**20)),
    r_99_117 + s_99_117 <=s (const 64 (2**20)),
    r_99_117 - s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 + s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 - s_99_117 <=s (const 64 (2**20)),
    u_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_99_117 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step117

// premise a
assume
neg_g_59_low60_40_low20_18 = 0 (mod 2)
&&
neg_g_59_low60_40_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov neg_f_59_low60_40_low20_19 neg_f_59_low60_40_low20_18;
mov u_99_118 u_99_117;
mov v_99_118 v_99_117;

asr neg_g_59_low60_40_low20_19 neg_g_59_low60_40_low20_18 1;
asr r_99_118 r_99_117 1;
asr s_99_118 s_99_117 1;
assert
    true
&&
    neg_f_59_low60_40_low20_19 = neg_f_59_low60_40_low20_18,
    u_99_118 = u_99_117,
    v_99_118 = v_99_117,
    neg_g_59_low60_40_low20_19 * (const 64 2) = neg_g_59_low60_40_low20_18,
    r_99_118 * (const 64 2) = r_99_117,
    s_99_118 * (const 64 2) = s_99_117
;

assume
    neg_f_59_low60_40_low20_19 = neg_f_59_low60_40_low20_18,
    u_99_118 = u_99_117,
    v_99_118 = v_99_117,
    neg_g_59_low60_40_low20_19 * 2 = neg_g_59_low60_40_low20_18,
    r_99_118 * 2 = r_99_117,
    s_99_118 * 2 = s_99_117
&&
    true
;

{
    u_99_118 * neg_f_59_low60_40_low20_0 + v_99_118 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_118 * neg_f_59_low60_40_low20_0 + s_99_118 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_19 + u_99_118 * (const 64 (2**21)) + v_99_118 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_19 + r_99_118 * (const 64 (2**21)) + s_99_118 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_19,
    neg_f_59_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_19,
    neg_g_59_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 118)) <=s delta, delta <=s (const 64 (1 + 2*118)),
    (const 64 (-(2**20))) <=s u_99_118, u_99_118 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_118, v_99_118 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_118, r_99_118 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_118, s_99_118 <=s (const 64 ((2**20)-1)),
    u_99_118 + v_99_118 <=s (const 64 (2**20)),
    u_99_118 - v_99_118 <=s (const 64 (2**20)),
    (const 64 0) - u_99_118 + v_99_118 <=s (const 64 (2**20)),
    (const 64 0) - u_99_118 - v_99_118 <=s (const 64 (2**20)),
    r_99_118 + s_99_118 <=s (const 64 (2**20)),
    r_99_118 - s_99_118 <=s (const 64 (2**20)),
    (const 64 0) - r_99_118 + s_99_118 <=s (const 64 (2**20)),
    (const 64 0) - r_99_118 - s_99_118 <=s (const 64 (2**20)),
    u_99_118 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_99_118 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_99_118 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_99_118 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_117_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_18,
sint64 neg_g_59_low60_40_low20_18,
sint64 neg_f_59_low60_40_low20_19,
sint64 neg_g_59_low60_40_low20_19,
sint64 u_99_117,
sint64 v_99_117,
sint64 r_99_117,
sint64 s_99_117,
sint64 u_99_118,
sint64 v_99_118,
sint64 r_99_118,
sint64 s_99_118,
bit ne
)={
    u_99_117 * neg_f_59_low60_40_low20_0 + v_99_117 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_18 * (-(2**20)),
    r_99_117 * neg_f_59_low60_40_low20_0 + s_99_117 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_18 * (-(2**20))
&&
    u_99_117 * neg_f_59_low60_40_low20_0 + v_99_117 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_18 * (const 64 (-(2**20))),
    r_99_117 * neg_f_59_low60_40_low20_0 + s_99_117 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_18 + u_99_117 * (const 64 (2**21)) + v_99_117 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_18 + r_99_117 * (const 64 (2**21)) + s_99_117 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_18,
    neg_f_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_18,
    neg_g_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 117)) <=s delta, delta <=s (const 64 (1 + 2*117)),
    (const 64 (-(2**20))) <=s u_99_117, u_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_117, v_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_117, r_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_117, s_99_117 <=s (const 64 ((2**20)-1)),
    u_99_117 + v_99_117 <=s (const 64 (2**20)),
    u_99_117 - v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 + v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 - v_99_117 <=s (const 64 (2**20)),
    r_99_117 + s_99_117 <=s (const 64 (2**20)),
    r_99_117 - s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 + s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 - s_99_117 <=s (const 64 (2**20)),
    u_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_99_117 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step117

// premise b
assume
neg_g_59_low60_40_low20_18 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_19 neg_f_59_low60_40_low20_18;
mov u_99_118 u_99_117;
mov v_99_118 v_99_117;

add neg_g_59_low60_40_low20_19 neg_g_59_low60_40_low20_18 neg_f_59_low60_40_low20_18;
asr neg_g_59_low60_40_low20_19 neg_g_59_low60_40_low20_19 1;
add r_99_118 r_99_117 u_99_117;
asr r_99_118 r_99_118 1;
add s_99_118 s_99_117 v_99_117;
asr s_99_118 s_99_118 1;
assert
    true
&&
    neg_f_59_low60_40_low20_19 = neg_f_59_low60_40_low20_18,
    u_99_118 = u_99_117,
    v_99_118 = v_99_117,
    neg_g_59_low60_40_low20_19 * (const 64 2) = neg_g_59_low60_40_low20_18 + neg_f_59_low60_40_low20_18,
    r_99_118 * (const 64 2) = r_99_117 + u_99_117,
    s_99_118 * (const 64 2) = s_99_117 + v_99_117
;

assume
    neg_f_59_low60_40_low20_19 = neg_f_59_low60_40_low20_18,
    u_99_118 = u_99_117,
    v_99_118 = v_99_117,
    neg_g_59_low60_40_low20_19 * 2 = neg_g_59_low60_40_low20_18 + neg_f_59_low60_40_low20_18,
    r_99_118 * 2 = r_99_117 + u_99_117,
    s_99_118 * 2 = s_99_117 + v_99_117
&&
    true
;

{
    u_99_118 * neg_f_59_low60_40_low20_0 + v_99_118 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_118 * neg_f_59_low60_40_low20_0 + s_99_118 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_19 + u_99_118 * (const 64 (2**21)) + v_99_118 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_19 + r_99_118 * (const 64 (2**21)) + s_99_118 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_19,
    neg_f_59_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_19,
    neg_g_59_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 118)) <=s delta, delta <=s (const 64 (1 + 2*118)),
    (const 64 (-(2**20))) <=s u_99_118, u_99_118 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_118, v_99_118 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_118, r_99_118 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_118, s_99_118 <=s (const 64 ((2**20)-1)),
    u_99_118 + v_99_118 <=s (const 64 (2**20)),
    u_99_118 - v_99_118 <=s (const 64 (2**20)),
    (const 64 0) - u_99_118 + v_99_118 <=s (const 64 (2**20)),
    (const 64 0) - u_99_118 - v_99_118 <=s (const 64 (2**20)),
    r_99_118 + s_99_118 <=s (const 64 (2**20)),
    r_99_118 - s_99_118 <=s (const 64 (2**20)),
    (const 64 0) - r_99_118 + s_99_118 <=s (const 64 (2**20)),
    (const 64 0) - r_99_118 - s_99_118 <=s (const 64 (2**20)),
    u_99_118 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_99_118 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_99_118 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_99_118 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_117_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_18,
sint64 neg_g_59_low60_40_low20_18,
sint64 neg_f_59_low60_40_low20_19,
sint64 neg_g_59_low60_40_low20_19,
sint64 u_99_117,
sint64 v_99_117,
sint64 r_99_117,
sint64 s_99_117,
sint64 u_99_118,
sint64 v_99_118,
sint64 r_99_118,
sint64 s_99_118,
bit ne
)={
    u_99_117 * neg_f_59_low60_40_low20_0 + v_99_117 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_18 * (-(2**20)),
    r_99_117 * neg_f_59_low60_40_low20_0 + s_99_117 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_18 * (-(2**20))
&&
    u_99_117 * neg_f_59_low60_40_low20_0 + v_99_117 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_18 * (const 64 (-(2**20))),
    r_99_117 * neg_f_59_low60_40_low20_0 + s_99_117 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_18 + u_99_117 * (const 64 (2**21)) + v_99_117 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_18 + r_99_117 * (const 64 (2**21)) + s_99_117 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_18,
    neg_f_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_18,
    neg_g_59_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 117)) <=s delta, delta <=s (const 64 (1 + 2*117)),
    (const 64 (-(2**20))) <=s u_99_117, u_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_117, v_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_117, r_99_117 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_117, s_99_117 <=s (const 64 ((2**20)-1)),
    u_99_117 + v_99_117 <=s (const 64 (2**20)),
    u_99_117 - v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 + v_99_117 <=s (const 64 (2**20)),
    (const 64 0) - u_99_117 - v_99_117 <=s (const 64 (2**20)),
    r_99_117 + s_99_117 <=s (const 64 (2**20)),
    r_99_117 - s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 + s_99_117 <=s (const 64 (2**20)),
    (const 64 0) - r_99_117 - s_99_117 <=s (const 64 (2**20)),
    u_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_99_117 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_99_117 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step117

// premise c
assume
neg_g_59_low60_40_low20_18 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_19 neg_g_59_low60_40_low20_18;
mov u_99_118 r_99_117;
mov v_99_118 s_99_117;

subs dc neg_g_59_low60_40_low20_19 neg_g_59_low60_40_low20_18 neg_f_59_low60_40_low20_18;
asr neg_g_59_low60_40_low20_19 neg_g_59_low60_40_low20_19 1;
subs dc r_99_118 r_99_117 u_99_117;
asr r_99_118 r_99_118 1;
subs dc s_99_118 s_99_117 v_99_117;
asr s_99_118 s_99_118 1;
assert
    true
&&
    neg_f_59_low60_40_low20_19 = neg_g_59_low60_40_low20_18,
    u_99_118 = r_99_117,
    v_99_118 = s_99_117,
    neg_g_59_low60_40_low20_19 * (const 64 2) = neg_g_59_low60_40_low20_18 - neg_f_59_low60_40_low20_18,
    r_99_118 * (const 64 2) = r_99_117 - u_99_117,
    s_99_118 * (const 64 2) = s_99_117 - v_99_117
;

assume
    neg_f_59_low60_40_low20_19 = neg_g_59_low60_40_low20_18,
    u_99_118 = r_99_117,
    v_99_118 = s_99_117,
    neg_g_59_low60_40_low20_19 * 2 = neg_g_59_low60_40_low20_18 - neg_f_59_low60_40_low20_18,
    r_99_118 * 2 = r_99_117 - u_99_117,
    s_99_118 * 2 = s_99_117 - v_99_117
&&
    true
;

{
    u_99_118 * neg_f_59_low60_40_low20_0 + v_99_118 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_118 * neg_f_59_low60_40_low20_0 + s_99_118 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_19 + u_99_118 * (const 64 (2**21)) + v_99_118 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_19 + r_99_118 * (const 64 (2**21)) + s_99_118 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_19,
    neg_f_59_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_19,
    neg_g_59_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 118)) <=s delta, delta <=s (const 64 (1 + 2*118)),
    (const 64 (-(2**20))) <=s u_99_118, u_99_118 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_99_118, v_99_118 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_99_118, r_99_118 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_99_118, s_99_118 <=s (const 64 ((2**20)-1)),
    u_99_118 + v_99_118 <=s (const 64 (2**20)),
    u_99_118 - v_99_118 <=s (const 64 (2**20)),
    (const 64 0) - u_99_118 + v_99_118 <=s (const 64 (2**20)),
    (const 64 0) - u_99_118 - v_99_118 <=s (const 64 (2**20)),
    r_99_118 + s_99_118 <=s (const 64 (2**20)),
    r_99_118 - s_99_118 <=s (const 64 (2**20)),
    (const 64 0) - r_99_118 + s_99_118 <=s (const 64 (2**20)),
    (const 64 0) - r_99_118 - s_99_118 <=s (const 64 (2**20)),
    u_99_118 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_99_118 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_99_118 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_99_118 = (const 64 0) (mod (const 64 (2**(20-19))))
}

