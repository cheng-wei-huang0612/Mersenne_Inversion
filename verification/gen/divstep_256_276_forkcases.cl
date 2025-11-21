proc divstep_256_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_1,
sint64 neg_g_236_low60_20_low20_1,
sint64 u_256_256,
sint64 v_256_256,
sint64 r_256_256,
sint64 s_256_256,
sint64 u_256_257,
sint64 v_256_257,
sint64 r_256_257,
sint64 s_256_257,
bit ne
)={
    u_256_256 * neg_f_236_low60_20_low20_0 + v_256_256 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_0 * (-(2**20)),
    r_256_256 * neg_f_236_low60_20_low20_0 + s_256_256 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_0 * (-(2**20))
&&
    u_256_256 * neg_f_236_low60_20_low20_0 + v_256_256 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_0 * (const 64 (-(2**20))),
    r_256_256 * neg_f_236_low60_20_low20_0 + s_256_256 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_0 + u_256_256 * (const 64 (2**21)) + v_256_256 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_0 + r_256_256 * (const 64 (2**21)) + s_256_256 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 256)) <=s delta, delta <=s (const 64 (1 + 2*256)),
    u_256_256 = (const 64 (-(2**20))),
    v_256_256 = (const 64 (0)),
    r_256_256 = (const 64 (0)),
    s_256_256 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise a
assume
neg_g_236_low60_20_low20_0 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_236_low60_20_low20_1 neg_f_236_low60_20_low20_0;
mov u_256_257 u_256_256;
mov v_256_257 v_256_256;

asr neg_g_236_low60_20_low20_1 neg_g_236_low60_20_low20_0 1;
asr r_256_257 r_256_256 1;
asr s_256_257 s_256_256 1;
assert
    true
&&
    neg_f_236_low60_20_low20_1 = neg_f_236_low60_20_low20_0,
    u_256_257 = u_256_256,
    v_256_257 = v_256_256,
    neg_g_236_low60_20_low20_1 * (const 64 2) = neg_g_236_low60_20_low20_0,
    r_256_257 * (const 64 2) = r_256_256,
    s_256_257 * (const 64 2) = s_256_256
;

assume
    neg_f_236_low60_20_low20_1 = neg_f_236_low60_20_low20_0,
    u_256_257 = u_256_256,
    v_256_257 = v_256_256,
    neg_g_236_low60_20_low20_1 * 2 = neg_g_236_low60_20_low20_0,
    r_256_257 * 2 = r_256_256,
    s_256_257 * 2 = s_256_256
&&
    true
;

{
    u_256_257 * neg_f_236_low60_20_low20_0 + v_256_257 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_257 * neg_f_236_low60_20_low20_0 + s_256_257 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_1 + u_256_257 * (const 64 (2**21)) + v_256_257 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_1 + r_256_257 * (const 64 (2**21)) + s_256_257 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_1,
    neg_f_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_1,
    neg_g_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 257)) <=s delta, delta <=s (const 64 (1 + 2*257)),
    (const 64 (-(2**20))) <=s u_256_257, u_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_257, v_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_257, r_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_257, s_256_257 <=s (const 64 ((2**20))),
    u_256_257 + v_256_257 <=s (const 64 (2**20)),
    u_256_257 - v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 + v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 - v_256_257 <=s (const 64 (2**20)),
    r_256_257 + s_256_257 <=s (const 64 (2**20)),
    r_256_257 - s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 + s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 - s_256_257 <=s (const 64 (2**20)),
    u_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_256_257 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_256_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_1,
sint64 neg_g_236_low60_20_low20_1,
sint64 u_256_256,
sint64 v_256_256,
sint64 r_256_256,
sint64 s_256_256,
sint64 u_256_257,
sint64 v_256_257,
sint64 r_256_257,
sint64 s_256_257,
bit ne
)={
    u_256_256 * neg_f_236_low60_20_low20_0 + v_256_256 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_0 * (-(2**20)),
    r_256_256 * neg_f_236_low60_20_low20_0 + s_256_256 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_0 * (-(2**20))
&&
    u_256_256 * neg_f_236_low60_20_low20_0 + v_256_256 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_0 * (const 64 (-(2**20))),
    r_256_256 * neg_f_236_low60_20_low20_0 + s_256_256 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_0 + u_256_256 * (const 64 (2**21)) + v_256_256 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_0 + r_256_256 * (const 64 (2**21)) + s_256_256 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 256)) <=s delta, delta <=s (const 64 (1 + 2*256)),
    u_256_256 = (const 64 (-(2**20))),
    v_256_256 = (const 64 (0)),
    r_256_256 = (const 64 (0)),
    s_256_256 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise b
assume
neg_g_236_low60_20_low20_0 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_1 neg_f_236_low60_20_low20_0;
mov u_256_257 u_256_256;
mov v_256_257 v_256_256;

add neg_g_236_low60_20_low20_1 neg_g_236_low60_20_low20_0 neg_f_236_low60_20_low20_0;
asr neg_g_236_low60_20_low20_1 neg_g_236_low60_20_low20_1 1;
add r_256_257 r_256_256 u_256_256;
asr r_256_257 r_256_257 1;
add s_256_257 s_256_256 v_256_256;
asr s_256_257 s_256_257 1;
assert
    true
&&
    neg_f_236_low60_20_low20_1 = neg_f_236_low60_20_low20_0,
    u_256_257 = u_256_256,
    v_256_257 = v_256_256,
    neg_g_236_low60_20_low20_1 * (const 64 2) = neg_g_236_low60_20_low20_0 + neg_f_236_low60_20_low20_0,
    r_256_257 * (const 64 2) = r_256_256 + u_256_256,
    s_256_257 * (const 64 2) = s_256_256 + v_256_256
;

assume
    neg_f_236_low60_20_low20_1 = neg_f_236_low60_20_low20_0,
    u_256_257 = u_256_256,
    v_256_257 = v_256_256,
    neg_g_236_low60_20_low20_1 * 2 = neg_g_236_low60_20_low20_0 + neg_f_236_low60_20_low20_0,
    r_256_257 * 2 = r_256_256 + u_256_256,
    s_256_257 * 2 = s_256_256 + v_256_256
&&
    true
;

{
    u_256_257 * neg_f_236_low60_20_low20_0 + v_256_257 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_257 * neg_f_236_low60_20_low20_0 + s_256_257 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_1 + u_256_257 * (const 64 (2**21)) + v_256_257 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_1 + r_256_257 * (const 64 (2**21)) + s_256_257 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_1,
    neg_f_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_1,
    neg_g_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 257)) <=s delta, delta <=s (const 64 (1 + 2*257)),
    (const 64 (-(2**20))) <=s u_256_257, u_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_257, v_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_257, r_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_257, s_256_257 <=s (const 64 ((2**20))),
    u_256_257 + v_256_257 <=s (const 64 (2**20)),
    u_256_257 - v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 + v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 - v_256_257 <=s (const 64 (2**20)),
    r_256_257 + s_256_257 <=s (const 64 (2**20)),
    r_256_257 - s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 + s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 - s_256_257 <=s (const 64 (2**20)),
    u_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_256_257 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_256_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_1,
sint64 neg_g_236_low60_20_low20_1,
sint64 u_256_256,
sint64 v_256_256,
sint64 r_256_256,
sint64 s_256_256,
sint64 u_256_257,
sint64 v_256_257,
sint64 r_256_257,
sint64 s_256_257,
bit ne
)={
    u_256_256 * neg_f_236_low60_20_low20_0 + v_256_256 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_0 * (-(2**20)),
    r_256_256 * neg_f_236_low60_20_low20_0 + s_256_256 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_0 * (-(2**20))
&&
    u_256_256 * neg_f_236_low60_20_low20_0 + v_256_256 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_0 * (const 64 (-(2**20))),
    r_256_256 * neg_f_236_low60_20_low20_0 + s_256_256 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_0 + u_256_256 * (const 64 (2**21)) + v_256_256 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_0 + r_256_256 * (const 64 (2**21)) + s_256_256 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 256)) <=s delta, delta <=s (const 64 (1 + 2*256)),
    u_256_256 = (const 64 (-(2**20))),
    v_256_256 = (const 64 (0)),
    r_256_256 = (const 64 (0)),
    s_256_256 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise c
assume
neg_g_236_low60_20_low20_0 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_1 neg_g_236_low60_20_low20_0;
mov u_256_257 r_256_256;
mov v_256_257 s_256_256;

subs dc neg_g_236_low60_20_low20_1 neg_g_236_low60_20_low20_0 neg_f_236_low60_20_low20_0;
asr neg_g_236_low60_20_low20_1 neg_g_236_low60_20_low20_1 1;
subs dc r_256_257 r_256_256 u_256_256;
asr r_256_257 r_256_257 1;
subs dc s_256_257 s_256_256 v_256_256;
asr s_256_257 s_256_257 1;
assert
    true
&&
    neg_f_236_low60_20_low20_1 = neg_g_236_low60_20_low20_0,
    u_256_257 = r_256_256,
    v_256_257 = s_256_256,
    neg_g_236_low60_20_low20_1 * (const 64 2) = neg_g_236_low60_20_low20_0 - neg_f_236_low60_20_low20_0,
    r_256_257 * (const 64 2) = r_256_256 - u_256_256,
    s_256_257 * (const 64 2) = s_256_256 - v_256_256
;

assume
    neg_f_236_low60_20_low20_1 = neg_g_236_low60_20_low20_0,
    u_256_257 = r_256_256,
    v_256_257 = s_256_256,
    neg_g_236_low60_20_low20_1 * 2 = neg_g_236_low60_20_low20_0 - neg_f_236_low60_20_low20_0,
    r_256_257 * 2 = r_256_256 - u_256_256,
    s_256_257 * 2 = s_256_256 - v_256_256
&&
    true
;

{
    u_256_257 * neg_f_236_low60_20_low20_0 + v_256_257 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_257 * neg_f_236_low60_20_low20_0 + s_256_257 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_1 + u_256_257 * (const 64 (2**21)) + v_256_257 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_1 + r_256_257 * (const 64 (2**21)) + s_256_257 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_1,
    neg_f_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_1,
    neg_g_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 257)) <=s delta, delta <=s (const 64 (1 + 2*257)),
    (const 64 (-(2**20))) <=s u_256_257, u_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_257, v_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_257, r_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_257, s_256_257 <=s (const 64 ((2**20))),
    u_256_257 + v_256_257 <=s (const 64 (2**20)),
    u_256_257 - v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 + v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 - v_256_257 <=s (const 64 (2**20)),
    r_256_257 + s_256_257 <=s (const 64 (2**20)),
    r_256_257 - s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 + s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 - s_256_257 <=s (const 64 (2**20)),
    u_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_256_257 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_257_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_1,
sint64 neg_g_236_low60_20_low20_1,
sint64 neg_f_236_low60_20_low20_2,
sint64 neg_g_236_low60_20_low20_2,
sint64 u_256_257,
sint64 v_256_257,
sint64 r_256_257,
sint64 s_256_257,
sint64 u_256_258,
sint64 v_256_258,
sint64 r_256_258,
sint64 s_256_258,
bit ne
)={
    u_256_257 * neg_f_236_low60_20_low20_0 + v_256_257 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_1 * (-(2**20)),
    r_256_257 * neg_f_236_low60_20_low20_0 + s_256_257 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_1 * (-(2**20))
&&
    u_256_257 * neg_f_236_low60_20_low20_0 + v_256_257 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_1 * (const 64 (-(2**20))),
    r_256_257 * neg_f_236_low60_20_low20_0 + s_256_257 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_1 + u_256_257 * (const 64 (2**21)) + v_256_257 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_1 + r_256_257 * (const 64 (2**21)) + s_256_257 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_1,
    neg_f_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_1,
    neg_g_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 257)) <=s delta, delta <=s (const 64 (1 + 2*257)),
    (const 64 (-(2**20))) <=s u_256_257, u_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_257, v_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_257, r_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_257, s_256_257 <=s (const 64 ((2**20))),
    u_256_257 + v_256_257 <=s (const 64 (2**20)),
    u_256_257 - v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 + v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 - v_256_257 <=s (const 64 (2**20)),
    r_256_257 + s_256_257 <=s (const 64 (2**20)),
    r_256_257 - s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 + s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 - s_256_257 <=s (const 64 (2**20)),
    u_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_256_257 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise a
assume
neg_g_236_low60_20_low20_1 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_2 neg_f_236_low60_20_low20_1;
mov u_256_258 u_256_257;
mov v_256_258 v_256_257;

asr neg_g_236_low60_20_low20_2 neg_g_236_low60_20_low20_1 1;
asr r_256_258 r_256_257 1;
asr s_256_258 s_256_257 1;
assert
    true
&&
    neg_f_236_low60_20_low20_2 = neg_f_236_low60_20_low20_1,
    u_256_258 = u_256_257,
    v_256_258 = v_256_257,
    neg_g_236_low60_20_low20_2 * (const 64 2) = neg_g_236_low60_20_low20_1,
    r_256_258 * (const 64 2) = r_256_257,
    s_256_258 * (const 64 2) = s_256_257
;

assume
    neg_f_236_low60_20_low20_2 = neg_f_236_low60_20_low20_1,
    u_256_258 = u_256_257,
    v_256_258 = v_256_257,
    neg_g_236_low60_20_low20_2 * 2 = neg_g_236_low60_20_low20_1,
    r_256_258 * 2 = r_256_257,
    s_256_258 * 2 = s_256_257
&&
    true
;

{
    u_256_258 * neg_f_236_low60_20_low20_0 + v_256_258 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_258 * neg_f_236_low60_20_low20_0 + s_256_258 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_2 + u_256_258 * (const 64 (2**21)) + v_256_258 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_2 + r_256_258 * (const 64 (2**21)) + s_256_258 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_2,
    neg_f_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_2,
    neg_g_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 258)) <=s delta, delta <=s (const 64 (1 + 2*258)),
    (const 64 (-(2**20))) <=s u_256_258, u_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_258, v_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_258, r_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_258, s_256_258 <=s (const 64 ((2**20))),
    u_256_258 + v_256_258 <=s (const 64 (2**20)),
    u_256_258 - v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 + v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 - v_256_258 <=s (const 64 (2**20)),
    r_256_258 + s_256_258 <=s (const 64 (2**20)),
    r_256_258 - s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 + s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 - s_256_258 <=s (const 64 (2**20)),
    u_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_256_258 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_257_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_1,
sint64 neg_g_236_low60_20_low20_1,
sint64 neg_f_236_low60_20_low20_2,
sint64 neg_g_236_low60_20_low20_2,
sint64 u_256_257,
sint64 v_256_257,
sint64 r_256_257,
sint64 s_256_257,
sint64 u_256_258,
sint64 v_256_258,
sint64 r_256_258,
sint64 s_256_258,
bit ne
)={
    u_256_257 * neg_f_236_low60_20_low20_0 + v_256_257 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_1 * (-(2**20)),
    r_256_257 * neg_f_236_low60_20_low20_0 + s_256_257 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_1 * (-(2**20))
&&
    u_256_257 * neg_f_236_low60_20_low20_0 + v_256_257 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_1 * (const 64 (-(2**20))),
    r_256_257 * neg_f_236_low60_20_low20_0 + s_256_257 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_1 + u_256_257 * (const 64 (2**21)) + v_256_257 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_1 + r_256_257 * (const 64 (2**21)) + s_256_257 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_1,
    neg_f_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_1,
    neg_g_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 257)) <=s delta, delta <=s (const 64 (1 + 2*257)),
    (const 64 (-(2**20))) <=s u_256_257, u_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_257, v_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_257, r_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_257, s_256_257 <=s (const 64 ((2**20))),
    u_256_257 + v_256_257 <=s (const 64 (2**20)),
    u_256_257 - v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 + v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 - v_256_257 <=s (const 64 (2**20)),
    r_256_257 + s_256_257 <=s (const 64 (2**20)),
    r_256_257 - s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 + s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 - s_256_257 <=s (const 64 (2**20)),
    u_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_256_257 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise b
assume
neg_g_236_low60_20_low20_1 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_2 neg_f_236_low60_20_low20_1;
mov u_256_258 u_256_257;
mov v_256_258 v_256_257;

add neg_g_236_low60_20_low20_2 neg_g_236_low60_20_low20_1 neg_f_236_low60_20_low20_1;
asr neg_g_236_low60_20_low20_2 neg_g_236_low60_20_low20_2 1;
add r_256_258 r_256_257 u_256_257;
asr r_256_258 r_256_258 1;
add s_256_258 s_256_257 v_256_257;
asr s_256_258 s_256_258 1;
assert
    true
&&
    neg_f_236_low60_20_low20_2 = neg_f_236_low60_20_low20_1,
    u_256_258 = u_256_257,
    v_256_258 = v_256_257,
    neg_g_236_low60_20_low20_2 * (const 64 2) = neg_g_236_low60_20_low20_1 + neg_f_236_low60_20_low20_1,
    r_256_258 * (const 64 2) = r_256_257 + u_256_257,
    s_256_258 * (const 64 2) = s_256_257 + v_256_257
;

assume
    neg_f_236_low60_20_low20_2 = neg_f_236_low60_20_low20_1,
    u_256_258 = u_256_257,
    v_256_258 = v_256_257,
    neg_g_236_low60_20_low20_2 * 2 = neg_g_236_low60_20_low20_1 + neg_f_236_low60_20_low20_1,
    r_256_258 * 2 = r_256_257 + u_256_257,
    s_256_258 * 2 = s_256_257 + v_256_257
&&
    true
;

{
    u_256_258 * neg_f_236_low60_20_low20_0 + v_256_258 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_258 * neg_f_236_low60_20_low20_0 + s_256_258 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_2 + u_256_258 * (const 64 (2**21)) + v_256_258 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_2 + r_256_258 * (const 64 (2**21)) + s_256_258 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_2,
    neg_f_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_2,
    neg_g_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 258)) <=s delta, delta <=s (const 64 (1 + 2*258)),
    (const 64 (-(2**20))) <=s u_256_258, u_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_258, v_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_258, r_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_258, s_256_258 <=s (const 64 ((2**20))),
    u_256_258 + v_256_258 <=s (const 64 (2**20)),
    u_256_258 - v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 + v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 - v_256_258 <=s (const 64 (2**20)),
    r_256_258 + s_256_258 <=s (const 64 (2**20)),
    r_256_258 - s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 + s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 - s_256_258 <=s (const 64 (2**20)),
    u_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_256_258 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_257_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_1,
sint64 neg_g_236_low60_20_low20_1,
sint64 neg_f_236_low60_20_low20_2,
sint64 neg_g_236_low60_20_low20_2,
sint64 u_256_257,
sint64 v_256_257,
sint64 r_256_257,
sint64 s_256_257,
sint64 u_256_258,
sint64 v_256_258,
sint64 r_256_258,
sint64 s_256_258,
bit ne
)={
    u_256_257 * neg_f_236_low60_20_low20_0 + v_256_257 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_1 * (-(2**20)),
    r_256_257 * neg_f_236_low60_20_low20_0 + s_256_257 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_1 * (-(2**20))
&&
    u_256_257 * neg_f_236_low60_20_low20_0 + v_256_257 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_1 * (const 64 (-(2**20))),
    r_256_257 * neg_f_236_low60_20_low20_0 + s_256_257 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_1 + u_256_257 * (const 64 (2**21)) + v_256_257 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_1 + r_256_257 * (const 64 (2**21)) + s_256_257 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_1,
    neg_f_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_1,
    neg_g_236_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 257)) <=s delta, delta <=s (const 64 (1 + 2*257)),
    (const 64 (-(2**20))) <=s u_256_257, u_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_257, v_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_257, r_256_257 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_257, s_256_257 <=s (const 64 ((2**20))),
    u_256_257 + v_256_257 <=s (const 64 (2**20)),
    u_256_257 - v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 + v_256_257 <=s (const 64 (2**20)),
    (const 64 0) - u_256_257 - v_256_257 <=s (const 64 (2**20)),
    r_256_257 + s_256_257 <=s (const 64 (2**20)),
    r_256_257 - s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 + s_256_257 <=s (const 64 (2**20)),
    (const 64 0) - r_256_257 - s_256_257 <=s (const 64 (2**20)),
    u_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_256_257 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_256_257 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise c
assume
neg_g_236_low60_20_low20_1 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_2 neg_g_236_low60_20_low20_1;
mov u_256_258 r_256_257;
mov v_256_258 s_256_257;

subs dc neg_g_236_low60_20_low20_2 neg_g_236_low60_20_low20_1 neg_f_236_low60_20_low20_1;
asr neg_g_236_low60_20_low20_2 neg_g_236_low60_20_low20_2 1;
subs dc r_256_258 r_256_257 u_256_257;
asr r_256_258 r_256_258 1;
subs dc s_256_258 s_256_257 v_256_257;
asr s_256_258 s_256_258 1;
assert
    true
&&
    neg_f_236_low60_20_low20_2 = neg_g_236_low60_20_low20_1,
    u_256_258 = r_256_257,
    v_256_258 = s_256_257,
    neg_g_236_low60_20_low20_2 * (const 64 2) = neg_g_236_low60_20_low20_1 - neg_f_236_low60_20_low20_1,
    r_256_258 * (const 64 2) = r_256_257 - u_256_257,
    s_256_258 * (const 64 2) = s_256_257 - v_256_257
;

assume
    neg_f_236_low60_20_low20_2 = neg_g_236_low60_20_low20_1,
    u_256_258 = r_256_257,
    v_256_258 = s_256_257,
    neg_g_236_low60_20_low20_2 * 2 = neg_g_236_low60_20_low20_1 - neg_f_236_low60_20_low20_1,
    r_256_258 * 2 = r_256_257 - u_256_257,
    s_256_258 * 2 = s_256_257 - v_256_257
&&
    true
;

{
    u_256_258 * neg_f_236_low60_20_low20_0 + v_256_258 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_258 * neg_f_236_low60_20_low20_0 + s_256_258 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_2 + u_256_258 * (const 64 (2**21)) + v_256_258 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_2 + r_256_258 * (const 64 (2**21)) + s_256_258 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_2,
    neg_f_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_2,
    neg_g_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 258)) <=s delta, delta <=s (const 64 (1 + 2*258)),
    (const 64 (-(2**20))) <=s u_256_258, u_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_258, v_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_258, r_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_258, s_256_258 <=s (const 64 ((2**20))),
    u_256_258 + v_256_258 <=s (const 64 (2**20)),
    u_256_258 - v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 + v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 - v_256_258 <=s (const 64 (2**20)),
    r_256_258 + s_256_258 <=s (const 64 (2**20)),
    r_256_258 - s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 + s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 - s_256_258 <=s (const 64 (2**20)),
    u_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_256_258 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_258_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_2,
sint64 neg_g_236_low60_20_low20_2,
sint64 neg_f_236_low60_20_low20_3,
sint64 neg_g_236_low60_20_low20_3,
sint64 u_256_258,
sint64 v_256_258,
sint64 r_256_258,
sint64 s_256_258,
sint64 u_256_259,
sint64 v_256_259,
sint64 r_256_259,
sint64 s_256_259,
bit ne
)={
    u_256_258 * neg_f_236_low60_20_low20_0 + v_256_258 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_2 * (-(2**20)),
    r_256_258 * neg_f_236_low60_20_low20_0 + s_256_258 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_2 * (-(2**20))
&&
    u_256_258 * neg_f_236_low60_20_low20_0 + v_256_258 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_2 * (const 64 (-(2**20))),
    r_256_258 * neg_f_236_low60_20_low20_0 + s_256_258 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_2 + u_256_258 * (const 64 (2**21)) + v_256_258 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_2 + r_256_258 * (const 64 (2**21)) + s_256_258 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_2,
    neg_f_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_2,
    neg_g_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 258)) <=s delta, delta <=s (const 64 (1 + 2*258)),
    (const 64 (-(2**20))) <=s u_256_258, u_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_258, v_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_258, r_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_258, s_256_258 <=s (const 64 ((2**20))),
    u_256_258 + v_256_258 <=s (const 64 (2**20)),
    u_256_258 - v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 + v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 - v_256_258 <=s (const 64 (2**20)),
    r_256_258 + s_256_258 <=s (const 64 (2**20)),
    r_256_258 - s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 + s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 - s_256_258 <=s (const 64 (2**20)),
    u_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_256_258 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise a
assume
neg_g_236_low60_20_low20_2 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_3 neg_f_236_low60_20_low20_2;
mov u_256_259 u_256_258;
mov v_256_259 v_256_258;

asr neg_g_236_low60_20_low20_3 neg_g_236_low60_20_low20_2 1;
asr r_256_259 r_256_258 1;
asr s_256_259 s_256_258 1;
assert
    true
&&
    neg_f_236_low60_20_low20_3 = neg_f_236_low60_20_low20_2,
    u_256_259 = u_256_258,
    v_256_259 = v_256_258,
    neg_g_236_low60_20_low20_3 * (const 64 2) = neg_g_236_low60_20_low20_2,
    r_256_259 * (const 64 2) = r_256_258,
    s_256_259 * (const 64 2) = s_256_258
;

assume
    neg_f_236_low60_20_low20_3 = neg_f_236_low60_20_low20_2,
    u_256_259 = u_256_258,
    v_256_259 = v_256_258,
    neg_g_236_low60_20_low20_3 * 2 = neg_g_236_low60_20_low20_2,
    r_256_259 * 2 = r_256_258,
    s_256_259 * 2 = s_256_258
&&
    true
;

{
    u_256_259 * neg_f_236_low60_20_low20_0 + v_256_259 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_259 * neg_f_236_low60_20_low20_0 + s_256_259 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_3 + u_256_259 * (const 64 (2**21)) + v_256_259 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_3 + r_256_259 * (const 64 (2**21)) + s_256_259 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_3,
    neg_f_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_3,
    neg_g_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 259)) <=s delta, delta <=s (const 64 (1 + 2*259)),
    (const 64 (-(2**20))) <=s u_256_259, u_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_259, v_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_259, r_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_259, s_256_259 <=s (const 64 ((2**20))),
    u_256_259 + v_256_259 <=s (const 64 (2**20)),
    u_256_259 - v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 + v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 - v_256_259 <=s (const 64 (2**20)),
    r_256_259 + s_256_259 <=s (const 64 (2**20)),
    r_256_259 - s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 + s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 - s_256_259 <=s (const 64 (2**20)),
    u_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_256_259 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_258_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_2,
sint64 neg_g_236_low60_20_low20_2,
sint64 neg_f_236_low60_20_low20_3,
sint64 neg_g_236_low60_20_low20_3,
sint64 u_256_258,
sint64 v_256_258,
sint64 r_256_258,
sint64 s_256_258,
sint64 u_256_259,
sint64 v_256_259,
sint64 r_256_259,
sint64 s_256_259,
bit ne
)={
    u_256_258 * neg_f_236_low60_20_low20_0 + v_256_258 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_2 * (-(2**20)),
    r_256_258 * neg_f_236_low60_20_low20_0 + s_256_258 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_2 * (-(2**20))
&&
    u_256_258 * neg_f_236_low60_20_low20_0 + v_256_258 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_2 * (const 64 (-(2**20))),
    r_256_258 * neg_f_236_low60_20_low20_0 + s_256_258 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_2 + u_256_258 * (const 64 (2**21)) + v_256_258 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_2 + r_256_258 * (const 64 (2**21)) + s_256_258 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_2,
    neg_f_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_2,
    neg_g_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 258)) <=s delta, delta <=s (const 64 (1 + 2*258)),
    (const 64 (-(2**20))) <=s u_256_258, u_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_258, v_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_258, r_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_258, s_256_258 <=s (const 64 ((2**20))),
    u_256_258 + v_256_258 <=s (const 64 (2**20)),
    u_256_258 - v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 + v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 - v_256_258 <=s (const 64 (2**20)),
    r_256_258 + s_256_258 <=s (const 64 (2**20)),
    r_256_258 - s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 + s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 - s_256_258 <=s (const 64 (2**20)),
    u_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_256_258 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise b
assume
neg_g_236_low60_20_low20_2 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_3 neg_f_236_low60_20_low20_2;
mov u_256_259 u_256_258;
mov v_256_259 v_256_258;

add neg_g_236_low60_20_low20_3 neg_g_236_low60_20_low20_2 neg_f_236_low60_20_low20_2;
asr neg_g_236_low60_20_low20_3 neg_g_236_low60_20_low20_3 1;
add r_256_259 r_256_258 u_256_258;
asr r_256_259 r_256_259 1;
add s_256_259 s_256_258 v_256_258;
asr s_256_259 s_256_259 1;
assert
    true
&&
    neg_f_236_low60_20_low20_3 = neg_f_236_low60_20_low20_2,
    u_256_259 = u_256_258,
    v_256_259 = v_256_258,
    neg_g_236_low60_20_low20_3 * (const 64 2) = neg_g_236_low60_20_low20_2 + neg_f_236_low60_20_low20_2,
    r_256_259 * (const 64 2) = r_256_258 + u_256_258,
    s_256_259 * (const 64 2) = s_256_258 + v_256_258
;

assume
    neg_f_236_low60_20_low20_3 = neg_f_236_low60_20_low20_2,
    u_256_259 = u_256_258,
    v_256_259 = v_256_258,
    neg_g_236_low60_20_low20_3 * 2 = neg_g_236_low60_20_low20_2 + neg_f_236_low60_20_low20_2,
    r_256_259 * 2 = r_256_258 + u_256_258,
    s_256_259 * 2 = s_256_258 + v_256_258
&&
    true
;

{
    u_256_259 * neg_f_236_low60_20_low20_0 + v_256_259 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_259 * neg_f_236_low60_20_low20_0 + s_256_259 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_3 + u_256_259 * (const 64 (2**21)) + v_256_259 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_3 + r_256_259 * (const 64 (2**21)) + s_256_259 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_3,
    neg_f_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_3,
    neg_g_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 259)) <=s delta, delta <=s (const 64 (1 + 2*259)),
    (const 64 (-(2**20))) <=s u_256_259, u_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_259, v_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_259, r_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_259, s_256_259 <=s (const 64 ((2**20))),
    u_256_259 + v_256_259 <=s (const 64 (2**20)),
    u_256_259 - v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 + v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 - v_256_259 <=s (const 64 (2**20)),
    r_256_259 + s_256_259 <=s (const 64 (2**20)),
    r_256_259 - s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 + s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 - s_256_259 <=s (const 64 (2**20)),
    u_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_256_259 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_258_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_2,
sint64 neg_g_236_low60_20_low20_2,
sint64 neg_f_236_low60_20_low20_3,
sint64 neg_g_236_low60_20_low20_3,
sint64 u_256_258,
sint64 v_256_258,
sint64 r_256_258,
sint64 s_256_258,
sint64 u_256_259,
sint64 v_256_259,
sint64 r_256_259,
sint64 s_256_259,
bit ne
)={
    u_256_258 * neg_f_236_low60_20_low20_0 + v_256_258 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_2 * (-(2**20)),
    r_256_258 * neg_f_236_low60_20_low20_0 + s_256_258 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_2 * (-(2**20))
&&
    u_256_258 * neg_f_236_low60_20_low20_0 + v_256_258 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_2 * (const 64 (-(2**20))),
    r_256_258 * neg_f_236_low60_20_low20_0 + s_256_258 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_2 + u_256_258 * (const 64 (2**21)) + v_256_258 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_2 + r_256_258 * (const 64 (2**21)) + s_256_258 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_2,
    neg_f_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_2,
    neg_g_236_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 258)) <=s delta, delta <=s (const 64 (1 + 2*258)),
    (const 64 (-(2**20))) <=s u_256_258, u_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_258, v_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_258, r_256_258 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_258, s_256_258 <=s (const 64 ((2**20))),
    u_256_258 + v_256_258 <=s (const 64 (2**20)),
    u_256_258 - v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 + v_256_258 <=s (const 64 (2**20)),
    (const 64 0) - u_256_258 - v_256_258 <=s (const 64 (2**20)),
    r_256_258 + s_256_258 <=s (const 64 (2**20)),
    r_256_258 - s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 + s_256_258 <=s (const 64 (2**20)),
    (const 64 0) - r_256_258 - s_256_258 <=s (const 64 (2**20)),
    u_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_256_258 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_256_258 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise c
assume
neg_g_236_low60_20_low20_2 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_3 neg_g_236_low60_20_low20_2;
mov u_256_259 r_256_258;
mov v_256_259 s_256_258;

subs dc neg_g_236_low60_20_low20_3 neg_g_236_low60_20_low20_2 neg_f_236_low60_20_low20_2;
asr neg_g_236_low60_20_low20_3 neg_g_236_low60_20_low20_3 1;
subs dc r_256_259 r_256_258 u_256_258;
asr r_256_259 r_256_259 1;
subs dc s_256_259 s_256_258 v_256_258;
asr s_256_259 s_256_259 1;
assert
    true
&&
    neg_f_236_low60_20_low20_3 = neg_g_236_low60_20_low20_2,
    u_256_259 = r_256_258,
    v_256_259 = s_256_258,
    neg_g_236_low60_20_low20_3 * (const 64 2) = neg_g_236_low60_20_low20_2 - neg_f_236_low60_20_low20_2,
    r_256_259 * (const 64 2) = r_256_258 - u_256_258,
    s_256_259 * (const 64 2) = s_256_258 - v_256_258
;

assume
    neg_f_236_low60_20_low20_3 = neg_g_236_low60_20_low20_2,
    u_256_259 = r_256_258,
    v_256_259 = s_256_258,
    neg_g_236_low60_20_low20_3 * 2 = neg_g_236_low60_20_low20_2 - neg_f_236_low60_20_low20_2,
    r_256_259 * 2 = r_256_258 - u_256_258,
    s_256_259 * 2 = s_256_258 - v_256_258
&&
    true
;

{
    u_256_259 * neg_f_236_low60_20_low20_0 + v_256_259 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_259 * neg_f_236_low60_20_low20_0 + s_256_259 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_3 + u_256_259 * (const 64 (2**21)) + v_256_259 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_3 + r_256_259 * (const 64 (2**21)) + s_256_259 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_3,
    neg_f_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_3,
    neg_g_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 259)) <=s delta, delta <=s (const 64 (1 + 2*259)),
    (const 64 (-(2**20))) <=s u_256_259, u_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_259, v_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_259, r_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_259, s_256_259 <=s (const 64 ((2**20))),
    u_256_259 + v_256_259 <=s (const 64 (2**20)),
    u_256_259 - v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 + v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 - v_256_259 <=s (const 64 (2**20)),
    r_256_259 + s_256_259 <=s (const 64 (2**20)),
    r_256_259 - s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 + s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 - s_256_259 <=s (const 64 (2**20)),
    u_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_256_259 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_259_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_3,
sint64 neg_g_236_low60_20_low20_3,
sint64 neg_f_236_low60_20_low20_4,
sint64 neg_g_236_low60_20_low20_4,
sint64 u_256_259,
sint64 v_256_259,
sint64 r_256_259,
sint64 s_256_259,
sint64 u_256_260,
sint64 v_256_260,
sint64 r_256_260,
sint64 s_256_260,
bit ne
)={
    u_256_259 * neg_f_236_low60_20_low20_0 + v_256_259 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_3 * (-(2**20)),
    r_256_259 * neg_f_236_low60_20_low20_0 + s_256_259 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_3 * (-(2**20))
&&
    u_256_259 * neg_f_236_low60_20_low20_0 + v_256_259 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_3 * (const 64 (-(2**20))),
    r_256_259 * neg_f_236_low60_20_low20_0 + s_256_259 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_3 + u_256_259 * (const 64 (2**21)) + v_256_259 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_3 + r_256_259 * (const 64 (2**21)) + s_256_259 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_3,
    neg_f_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_3,
    neg_g_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 259)) <=s delta, delta <=s (const 64 (1 + 2*259)),
    (const 64 (-(2**20))) <=s u_256_259, u_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_259, v_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_259, r_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_259, s_256_259 <=s (const 64 ((2**20))),
    u_256_259 + v_256_259 <=s (const 64 (2**20)),
    u_256_259 - v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 + v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 - v_256_259 <=s (const 64 (2**20)),
    r_256_259 + s_256_259 <=s (const 64 (2**20)),
    r_256_259 - s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 + s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 - s_256_259 <=s (const 64 (2**20)),
    u_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_256_259 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise a
assume
neg_g_236_low60_20_low20_3 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_4 neg_f_236_low60_20_low20_3;
mov u_256_260 u_256_259;
mov v_256_260 v_256_259;

asr neg_g_236_low60_20_low20_4 neg_g_236_low60_20_low20_3 1;
asr r_256_260 r_256_259 1;
asr s_256_260 s_256_259 1;
assert
    true
&&
    neg_f_236_low60_20_low20_4 = neg_f_236_low60_20_low20_3,
    u_256_260 = u_256_259,
    v_256_260 = v_256_259,
    neg_g_236_low60_20_low20_4 * (const 64 2) = neg_g_236_low60_20_low20_3,
    r_256_260 * (const 64 2) = r_256_259,
    s_256_260 * (const 64 2) = s_256_259
;

assume
    neg_f_236_low60_20_low20_4 = neg_f_236_low60_20_low20_3,
    u_256_260 = u_256_259,
    v_256_260 = v_256_259,
    neg_g_236_low60_20_low20_4 * 2 = neg_g_236_low60_20_low20_3,
    r_256_260 * 2 = r_256_259,
    s_256_260 * 2 = s_256_259
&&
    true
;

{
    u_256_260 * neg_f_236_low60_20_low20_0 + v_256_260 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_260 * neg_f_236_low60_20_low20_0 + s_256_260 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_4 + u_256_260 * (const 64 (2**21)) + v_256_260 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_4 + r_256_260 * (const 64 (2**21)) + s_256_260 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_4,
    neg_f_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_4,
    neg_g_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 260)) <=s delta, delta <=s (const 64 (1 + 2*260)),
    (const 64 (-(2**20))) <=s u_256_260, u_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_260, v_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_260, r_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_260, s_256_260 <=s (const 64 ((2**20))),
    u_256_260 + v_256_260 <=s (const 64 (2**20)),
    u_256_260 - v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 + v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 - v_256_260 <=s (const 64 (2**20)),
    r_256_260 + s_256_260 <=s (const 64 (2**20)),
    r_256_260 - s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 + s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 - s_256_260 <=s (const 64 (2**20)),
    u_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_256_260 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_259_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_3,
sint64 neg_g_236_low60_20_low20_3,
sint64 neg_f_236_low60_20_low20_4,
sint64 neg_g_236_low60_20_low20_4,
sint64 u_256_259,
sint64 v_256_259,
sint64 r_256_259,
sint64 s_256_259,
sint64 u_256_260,
sint64 v_256_260,
sint64 r_256_260,
sint64 s_256_260,
bit ne
)={
    u_256_259 * neg_f_236_low60_20_low20_0 + v_256_259 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_3 * (-(2**20)),
    r_256_259 * neg_f_236_low60_20_low20_0 + s_256_259 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_3 * (-(2**20))
&&
    u_256_259 * neg_f_236_low60_20_low20_0 + v_256_259 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_3 * (const 64 (-(2**20))),
    r_256_259 * neg_f_236_low60_20_low20_0 + s_256_259 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_3 + u_256_259 * (const 64 (2**21)) + v_256_259 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_3 + r_256_259 * (const 64 (2**21)) + s_256_259 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_3,
    neg_f_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_3,
    neg_g_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 259)) <=s delta, delta <=s (const 64 (1 + 2*259)),
    (const 64 (-(2**20))) <=s u_256_259, u_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_259, v_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_259, r_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_259, s_256_259 <=s (const 64 ((2**20))),
    u_256_259 + v_256_259 <=s (const 64 (2**20)),
    u_256_259 - v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 + v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 - v_256_259 <=s (const 64 (2**20)),
    r_256_259 + s_256_259 <=s (const 64 (2**20)),
    r_256_259 - s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 + s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 - s_256_259 <=s (const 64 (2**20)),
    u_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_256_259 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise b
assume
neg_g_236_low60_20_low20_3 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_4 neg_f_236_low60_20_low20_3;
mov u_256_260 u_256_259;
mov v_256_260 v_256_259;

add neg_g_236_low60_20_low20_4 neg_g_236_low60_20_low20_3 neg_f_236_low60_20_low20_3;
asr neg_g_236_low60_20_low20_4 neg_g_236_low60_20_low20_4 1;
add r_256_260 r_256_259 u_256_259;
asr r_256_260 r_256_260 1;
add s_256_260 s_256_259 v_256_259;
asr s_256_260 s_256_260 1;
assert
    true
&&
    neg_f_236_low60_20_low20_4 = neg_f_236_low60_20_low20_3,
    u_256_260 = u_256_259,
    v_256_260 = v_256_259,
    neg_g_236_low60_20_low20_4 * (const 64 2) = neg_g_236_low60_20_low20_3 + neg_f_236_low60_20_low20_3,
    r_256_260 * (const 64 2) = r_256_259 + u_256_259,
    s_256_260 * (const 64 2) = s_256_259 + v_256_259
;

assume
    neg_f_236_low60_20_low20_4 = neg_f_236_low60_20_low20_3,
    u_256_260 = u_256_259,
    v_256_260 = v_256_259,
    neg_g_236_low60_20_low20_4 * 2 = neg_g_236_low60_20_low20_3 + neg_f_236_low60_20_low20_3,
    r_256_260 * 2 = r_256_259 + u_256_259,
    s_256_260 * 2 = s_256_259 + v_256_259
&&
    true
;

{
    u_256_260 * neg_f_236_low60_20_low20_0 + v_256_260 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_260 * neg_f_236_low60_20_low20_0 + s_256_260 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_4 + u_256_260 * (const 64 (2**21)) + v_256_260 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_4 + r_256_260 * (const 64 (2**21)) + s_256_260 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_4,
    neg_f_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_4,
    neg_g_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 260)) <=s delta, delta <=s (const 64 (1 + 2*260)),
    (const 64 (-(2**20))) <=s u_256_260, u_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_260, v_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_260, r_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_260, s_256_260 <=s (const 64 ((2**20))),
    u_256_260 + v_256_260 <=s (const 64 (2**20)),
    u_256_260 - v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 + v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 - v_256_260 <=s (const 64 (2**20)),
    r_256_260 + s_256_260 <=s (const 64 (2**20)),
    r_256_260 - s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 + s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 - s_256_260 <=s (const 64 (2**20)),
    u_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_256_260 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_259_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_3,
sint64 neg_g_236_low60_20_low20_3,
sint64 neg_f_236_low60_20_low20_4,
sint64 neg_g_236_low60_20_low20_4,
sint64 u_256_259,
sint64 v_256_259,
sint64 r_256_259,
sint64 s_256_259,
sint64 u_256_260,
sint64 v_256_260,
sint64 r_256_260,
sint64 s_256_260,
bit ne
)={
    u_256_259 * neg_f_236_low60_20_low20_0 + v_256_259 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_3 * (-(2**20)),
    r_256_259 * neg_f_236_low60_20_low20_0 + s_256_259 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_3 * (-(2**20))
&&
    u_256_259 * neg_f_236_low60_20_low20_0 + v_256_259 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_3 * (const 64 (-(2**20))),
    r_256_259 * neg_f_236_low60_20_low20_0 + s_256_259 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_3 + u_256_259 * (const 64 (2**21)) + v_256_259 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_3 + r_256_259 * (const 64 (2**21)) + s_256_259 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_3,
    neg_f_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_3,
    neg_g_236_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 259)) <=s delta, delta <=s (const 64 (1 + 2*259)),
    (const 64 (-(2**20))) <=s u_256_259, u_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_259, v_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_259, r_256_259 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_259, s_256_259 <=s (const 64 ((2**20))),
    u_256_259 + v_256_259 <=s (const 64 (2**20)),
    u_256_259 - v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 + v_256_259 <=s (const 64 (2**20)),
    (const 64 0) - u_256_259 - v_256_259 <=s (const 64 (2**20)),
    r_256_259 + s_256_259 <=s (const 64 (2**20)),
    r_256_259 - s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 + s_256_259 <=s (const 64 (2**20)),
    (const 64 0) - r_256_259 - s_256_259 <=s (const 64 (2**20)),
    u_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_256_259 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_256_259 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise c
assume
neg_g_236_low60_20_low20_3 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_4 neg_g_236_low60_20_low20_3;
mov u_256_260 r_256_259;
mov v_256_260 s_256_259;

subs dc neg_g_236_low60_20_low20_4 neg_g_236_low60_20_low20_3 neg_f_236_low60_20_low20_3;
asr neg_g_236_low60_20_low20_4 neg_g_236_low60_20_low20_4 1;
subs dc r_256_260 r_256_259 u_256_259;
asr r_256_260 r_256_260 1;
subs dc s_256_260 s_256_259 v_256_259;
asr s_256_260 s_256_260 1;
assert
    true
&&
    neg_f_236_low60_20_low20_4 = neg_g_236_low60_20_low20_3,
    u_256_260 = r_256_259,
    v_256_260 = s_256_259,
    neg_g_236_low60_20_low20_4 * (const 64 2) = neg_g_236_low60_20_low20_3 - neg_f_236_low60_20_low20_3,
    r_256_260 * (const 64 2) = r_256_259 - u_256_259,
    s_256_260 * (const 64 2) = s_256_259 - v_256_259
;

assume
    neg_f_236_low60_20_low20_4 = neg_g_236_low60_20_low20_3,
    u_256_260 = r_256_259,
    v_256_260 = s_256_259,
    neg_g_236_low60_20_low20_4 * 2 = neg_g_236_low60_20_low20_3 - neg_f_236_low60_20_low20_3,
    r_256_260 * 2 = r_256_259 - u_256_259,
    s_256_260 * 2 = s_256_259 - v_256_259
&&
    true
;

{
    u_256_260 * neg_f_236_low60_20_low20_0 + v_256_260 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_260 * neg_f_236_low60_20_low20_0 + s_256_260 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_4 + u_256_260 * (const 64 (2**21)) + v_256_260 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_4 + r_256_260 * (const 64 (2**21)) + s_256_260 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_4,
    neg_f_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_4,
    neg_g_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 260)) <=s delta, delta <=s (const 64 (1 + 2*260)),
    (const 64 (-(2**20))) <=s u_256_260, u_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_260, v_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_260, r_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_260, s_256_260 <=s (const 64 ((2**20))),
    u_256_260 + v_256_260 <=s (const 64 (2**20)),
    u_256_260 - v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 + v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 - v_256_260 <=s (const 64 (2**20)),
    r_256_260 + s_256_260 <=s (const 64 (2**20)),
    r_256_260 - s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 + s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 - s_256_260 <=s (const 64 (2**20)),
    u_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_256_260 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_260_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_4,
sint64 neg_g_236_low60_20_low20_4,
sint64 neg_f_236_low60_20_low20_5,
sint64 neg_g_236_low60_20_low20_5,
sint64 u_256_260,
sint64 v_256_260,
sint64 r_256_260,
sint64 s_256_260,
sint64 u_256_261,
sint64 v_256_261,
sint64 r_256_261,
sint64 s_256_261,
bit ne
)={
    u_256_260 * neg_f_236_low60_20_low20_0 + v_256_260 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_4 * (-(2**20)),
    r_256_260 * neg_f_236_low60_20_low20_0 + s_256_260 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_4 * (-(2**20))
&&
    u_256_260 * neg_f_236_low60_20_low20_0 + v_256_260 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_4 * (const 64 (-(2**20))),
    r_256_260 * neg_f_236_low60_20_low20_0 + s_256_260 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_4 + u_256_260 * (const 64 (2**21)) + v_256_260 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_4 + r_256_260 * (const 64 (2**21)) + s_256_260 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_4,
    neg_f_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_4,
    neg_g_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 260)) <=s delta, delta <=s (const 64 (1 + 2*260)),
    (const 64 (-(2**20))) <=s u_256_260, u_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_260, v_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_260, r_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_260, s_256_260 <=s (const 64 ((2**20))),
    u_256_260 + v_256_260 <=s (const 64 (2**20)),
    u_256_260 - v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 + v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 - v_256_260 <=s (const 64 (2**20)),
    r_256_260 + s_256_260 <=s (const 64 (2**20)),
    r_256_260 - s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 + s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 - s_256_260 <=s (const 64 (2**20)),
    u_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_256_260 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise a
assume
neg_g_236_low60_20_low20_4 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_5 neg_f_236_low60_20_low20_4;
mov u_256_261 u_256_260;
mov v_256_261 v_256_260;

asr neg_g_236_low60_20_low20_5 neg_g_236_low60_20_low20_4 1;
asr r_256_261 r_256_260 1;
asr s_256_261 s_256_260 1;
assert
    true
&&
    neg_f_236_low60_20_low20_5 = neg_f_236_low60_20_low20_4,
    u_256_261 = u_256_260,
    v_256_261 = v_256_260,
    neg_g_236_low60_20_low20_5 * (const 64 2) = neg_g_236_low60_20_low20_4,
    r_256_261 * (const 64 2) = r_256_260,
    s_256_261 * (const 64 2) = s_256_260
;

assume
    neg_f_236_low60_20_low20_5 = neg_f_236_low60_20_low20_4,
    u_256_261 = u_256_260,
    v_256_261 = v_256_260,
    neg_g_236_low60_20_low20_5 * 2 = neg_g_236_low60_20_low20_4,
    r_256_261 * 2 = r_256_260,
    s_256_261 * 2 = s_256_260
&&
    true
;

{
    u_256_261 * neg_f_236_low60_20_low20_0 + v_256_261 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_261 * neg_f_236_low60_20_low20_0 + s_256_261 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_5 + u_256_261 * (const 64 (2**21)) + v_256_261 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_5 + r_256_261 * (const 64 (2**21)) + s_256_261 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_5,
    neg_f_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_5,
    neg_g_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 261)) <=s delta, delta <=s (const 64 (1 + 2*261)),
    (const 64 (-(2**20))) <=s u_256_261, u_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_261, v_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_261, r_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_261, s_256_261 <=s (const 64 ((2**20))),
    u_256_261 + v_256_261 <=s (const 64 (2**20)),
    u_256_261 - v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 + v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 - v_256_261 <=s (const 64 (2**20)),
    r_256_261 + s_256_261 <=s (const 64 (2**20)),
    r_256_261 - s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 + s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 - s_256_261 <=s (const 64 (2**20)),
    u_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_256_261 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_260_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_4,
sint64 neg_g_236_low60_20_low20_4,
sint64 neg_f_236_low60_20_low20_5,
sint64 neg_g_236_low60_20_low20_5,
sint64 u_256_260,
sint64 v_256_260,
sint64 r_256_260,
sint64 s_256_260,
sint64 u_256_261,
sint64 v_256_261,
sint64 r_256_261,
sint64 s_256_261,
bit ne
)={
    u_256_260 * neg_f_236_low60_20_low20_0 + v_256_260 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_4 * (-(2**20)),
    r_256_260 * neg_f_236_low60_20_low20_0 + s_256_260 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_4 * (-(2**20))
&&
    u_256_260 * neg_f_236_low60_20_low20_0 + v_256_260 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_4 * (const 64 (-(2**20))),
    r_256_260 * neg_f_236_low60_20_low20_0 + s_256_260 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_4 + u_256_260 * (const 64 (2**21)) + v_256_260 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_4 + r_256_260 * (const 64 (2**21)) + s_256_260 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_4,
    neg_f_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_4,
    neg_g_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 260)) <=s delta, delta <=s (const 64 (1 + 2*260)),
    (const 64 (-(2**20))) <=s u_256_260, u_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_260, v_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_260, r_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_260, s_256_260 <=s (const 64 ((2**20))),
    u_256_260 + v_256_260 <=s (const 64 (2**20)),
    u_256_260 - v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 + v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 - v_256_260 <=s (const 64 (2**20)),
    r_256_260 + s_256_260 <=s (const 64 (2**20)),
    r_256_260 - s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 + s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 - s_256_260 <=s (const 64 (2**20)),
    u_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_256_260 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise b
assume
neg_g_236_low60_20_low20_4 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_5 neg_f_236_low60_20_low20_4;
mov u_256_261 u_256_260;
mov v_256_261 v_256_260;

add neg_g_236_low60_20_low20_5 neg_g_236_low60_20_low20_4 neg_f_236_low60_20_low20_4;
asr neg_g_236_low60_20_low20_5 neg_g_236_low60_20_low20_5 1;
add r_256_261 r_256_260 u_256_260;
asr r_256_261 r_256_261 1;
add s_256_261 s_256_260 v_256_260;
asr s_256_261 s_256_261 1;
assert
    true
&&
    neg_f_236_low60_20_low20_5 = neg_f_236_low60_20_low20_4,
    u_256_261 = u_256_260,
    v_256_261 = v_256_260,
    neg_g_236_low60_20_low20_5 * (const 64 2) = neg_g_236_low60_20_low20_4 + neg_f_236_low60_20_low20_4,
    r_256_261 * (const 64 2) = r_256_260 + u_256_260,
    s_256_261 * (const 64 2) = s_256_260 + v_256_260
;

assume
    neg_f_236_low60_20_low20_5 = neg_f_236_low60_20_low20_4,
    u_256_261 = u_256_260,
    v_256_261 = v_256_260,
    neg_g_236_low60_20_low20_5 * 2 = neg_g_236_low60_20_low20_4 + neg_f_236_low60_20_low20_4,
    r_256_261 * 2 = r_256_260 + u_256_260,
    s_256_261 * 2 = s_256_260 + v_256_260
&&
    true
;

{
    u_256_261 * neg_f_236_low60_20_low20_0 + v_256_261 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_261 * neg_f_236_low60_20_low20_0 + s_256_261 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_5 + u_256_261 * (const 64 (2**21)) + v_256_261 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_5 + r_256_261 * (const 64 (2**21)) + s_256_261 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_5,
    neg_f_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_5,
    neg_g_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 261)) <=s delta, delta <=s (const 64 (1 + 2*261)),
    (const 64 (-(2**20))) <=s u_256_261, u_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_261, v_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_261, r_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_261, s_256_261 <=s (const 64 ((2**20))),
    u_256_261 + v_256_261 <=s (const 64 (2**20)),
    u_256_261 - v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 + v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 - v_256_261 <=s (const 64 (2**20)),
    r_256_261 + s_256_261 <=s (const 64 (2**20)),
    r_256_261 - s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 + s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 - s_256_261 <=s (const 64 (2**20)),
    u_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_256_261 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_260_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_4,
sint64 neg_g_236_low60_20_low20_4,
sint64 neg_f_236_low60_20_low20_5,
sint64 neg_g_236_low60_20_low20_5,
sint64 u_256_260,
sint64 v_256_260,
sint64 r_256_260,
sint64 s_256_260,
sint64 u_256_261,
sint64 v_256_261,
sint64 r_256_261,
sint64 s_256_261,
bit ne
)={
    u_256_260 * neg_f_236_low60_20_low20_0 + v_256_260 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_4 * (-(2**20)),
    r_256_260 * neg_f_236_low60_20_low20_0 + s_256_260 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_4 * (-(2**20))
&&
    u_256_260 * neg_f_236_low60_20_low20_0 + v_256_260 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_4 * (const 64 (-(2**20))),
    r_256_260 * neg_f_236_low60_20_low20_0 + s_256_260 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_4 + u_256_260 * (const 64 (2**21)) + v_256_260 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_4 + r_256_260 * (const 64 (2**21)) + s_256_260 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_4,
    neg_f_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_4,
    neg_g_236_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 260)) <=s delta, delta <=s (const 64 (1 + 2*260)),
    (const 64 (-(2**20))) <=s u_256_260, u_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_260, v_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_260, r_256_260 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_260, s_256_260 <=s (const 64 ((2**20))),
    u_256_260 + v_256_260 <=s (const 64 (2**20)),
    u_256_260 - v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 + v_256_260 <=s (const 64 (2**20)),
    (const 64 0) - u_256_260 - v_256_260 <=s (const 64 (2**20)),
    r_256_260 + s_256_260 <=s (const 64 (2**20)),
    r_256_260 - s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 + s_256_260 <=s (const 64 (2**20)),
    (const 64 0) - r_256_260 - s_256_260 <=s (const 64 (2**20)),
    u_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_256_260 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_256_260 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise c
assume
neg_g_236_low60_20_low20_4 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_5 neg_g_236_low60_20_low20_4;
mov u_256_261 r_256_260;
mov v_256_261 s_256_260;

subs dc neg_g_236_low60_20_low20_5 neg_g_236_low60_20_low20_4 neg_f_236_low60_20_low20_4;
asr neg_g_236_low60_20_low20_5 neg_g_236_low60_20_low20_5 1;
subs dc r_256_261 r_256_260 u_256_260;
asr r_256_261 r_256_261 1;
subs dc s_256_261 s_256_260 v_256_260;
asr s_256_261 s_256_261 1;
assert
    true
&&
    neg_f_236_low60_20_low20_5 = neg_g_236_low60_20_low20_4,
    u_256_261 = r_256_260,
    v_256_261 = s_256_260,
    neg_g_236_low60_20_low20_5 * (const 64 2) = neg_g_236_low60_20_low20_4 - neg_f_236_low60_20_low20_4,
    r_256_261 * (const 64 2) = r_256_260 - u_256_260,
    s_256_261 * (const 64 2) = s_256_260 - v_256_260
;

assume
    neg_f_236_low60_20_low20_5 = neg_g_236_low60_20_low20_4,
    u_256_261 = r_256_260,
    v_256_261 = s_256_260,
    neg_g_236_low60_20_low20_5 * 2 = neg_g_236_low60_20_low20_4 - neg_f_236_low60_20_low20_4,
    r_256_261 * 2 = r_256_260 - u_256_260,
    s_256_261 * 2 = s_256_260 - v_256_260
&&
    true
;

{
    u_256_261 * neg_f_236_low60_20_low20_0 + v_256_261 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_261 * neg_f_236_low60_20_low20_0 + s_256_261 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_5 + u_256_261 * (const 64 (2**21)) + v_256_261 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_5 + r_256_261 * (const 64 (2**21)) + s_256_261 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_5,
    neg_f_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_5,
    neg_g_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 261)) <=s delta, delta <=s (const 64 (1 + 2*261)),
    (const 64 (-(2**20))) <=s u_256_261, u_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_261, v_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_261, r_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_261, s_256_261 <=s (const 64 ((2**20))),
    u_256_261 + v_256_261 <=s (const 64 (2**20)),
    u_256_261 - v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 + v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 - v_256_261 <=s (const 64 (2**20)),
    r_256_261 + s_256_261 <=s (const 64 (2**20)),
    r_256_261 - s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 + s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 - s_256_261 <=s (const 64 (2**20)),
    u_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_256_261 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_261_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_5,
sint64 neg_g_236_low60_20_low20_5,
sint64 neg_f_236_low60_20_low20_6,
sint64 neg_g_236_low60_20_low20_6,
sint64 u_256_261,
sint64 v_256_261,
sint64 r_256_261,
sint64 s_256_261,
sint64 u_256_262,
sint64 v_256_262,
sint64 r_256_262,
sint64 s_256_262,
bit ne
)={
    u_256_261 * neg_f_236_low60_20_low20_0 + v_256_261 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_5 * (-(2**20)),
    r_256_261 * neg_f_236_low60_20_low20_0 + s_256_261 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_5 * (-(2**20))
&&
    u_256_261 * neg_f_236_low60_20_low20_0 + v_256_261 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_5 * (const 64 (-(2**20))),
    r_256_261 * neg_f_236_low60_20_low20_0 + s_256_261 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_5 + u_256_261 * (const 64 (2**21)) + v_256_261 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_5 + r_256_261 * (const 64 (2**21)) + s_256_261 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_5,
    neg_f_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_5,
    neg_g_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 261)) <=s delta, delta <=s (const 64 (1 + 2*261)),
    (const 64 (-(2**20))) <=s u_256_261, u_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_261, v_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_261, r_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_261, s_256_261 <=s (const 64 ((2**20))),
    u_256_261 + v_256_261 <=s (const 64 (2**20)),
    u_256_261 - v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 + v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 - v_256_261 <=s (const 64 (2**20)),
    r_256_261 + s_256_261 <=s (const 64 (2**20)),
    r_256_261 - s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 + s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 - s_256_261 <=s (const 64 (2**20)),
    u_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_256_261 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise a
assume
neg_g_236_low60_20_low20_5 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_6 neg_f_236_low60_20_low20_5;
mov u_256_262 u_256_261;
mov v_256_262 v_256_261;

asr neg_g_236_low60_20_low20_6 neg_g_236_low60_20_low20_5 1;
asr r_256_262 r_256_261 1;
asr s_256_262 s_256_261 1;
assert
    true
&&
    neg_f_236_low60_20_low20_6 = neg_f_236_low60_20_low20_5,
    u_256_262 = u_256_261,
    v_256_262 = v_256_261,
    neg_g_236_low60_20_low20_6 * (const 64 2) = neg_g_236_low60_20_low20_5,
    r_256_262 * (const 64 2) = r_256_261,
    s_256_262 * (const 64 2) = s_256_261
;

assume
    neg_f_236_low60_20_low20_6 = neg_f_236_low60_20_low20_5,
    u_256_262 = u_256_261,
    v_256_262 = v_256_261,
    neg_g_236_low60_20_low20_6 * 2 = neg_g_236_low60_20_low20_5,
    r_256_262 * 2 = r_256_261,
    s_256_262 * 2 = s_256_261
&&
    true
;

{
    u_256_262 * neg_f_236_low60_20_low20_0 + v_256_262 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_262 * neg_f_236_low60_20_low20_0 + s_256_262 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_6 + u_256_262 * (const 64 (2**21)) + v_256_262 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_6 + r_256_262 * (const 64 (2**21)) + s_256_262 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_6,
    neg_f_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_6,
    neg_g_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 262)) <=s delta, delta <=s (const 64 (1 + 2*262)),
    (const 64 (-(2**20))) <=s u_256_262, u_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_262, v_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_262, r_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_262, s_256_262 <=s (const 64 ((2**20))),
    u_256_262 + v_256_262 <=s (const 64 (2**20)),
    u_256_262 - v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 + v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 - v_256_262 <=s (const 64 (2**20)),
    r_256_262 + s_256_262 <=s (const 64 (2**20)),
    r_256_262 - s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 + s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 - s_256_262 <=s (const 64 (2**20)),
    u_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_256_262 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_261_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_5,
sint64 neg_g_236_low60_20_low20_5,
sint64 neg_f_236_low60_20_low20_6,
sint64 neg_g_236_low60_20_low20_6,
sint64 u_256_261,
sint64 v_256_261,
sint64 r_256_261,
sint64 s_256_261,
sint64 u_256_262,
sint64 v_256_262,
sint64 r_256_262,
sint64 s_256_262,
bit ne
)={
    u_256_261 * neg_f_236_low60_20_low20_0 + v_256_261 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_5 * (-(2**20)),
    r_256_261 * neg_f_236_low60_20_low20_0 + s_256_261 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_5 * (-(2**20))
&&
    u_256_261 * neg_f_236_low60_20_low20_0 + v_256_261 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_5 * (const 64 (-(2**20))),
    r_256_261 * neg_f_236_low60_20_low20_0 + s_256_261 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_5 + u_256_261 * (const 64 (2**21)) + v_256_261 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_5 + r_256_261 * (const 64 (2**21)) + s_256_261 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_5,
    neg_f_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_5,
    neg_g_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 261)) <=s delta, delta <=s (const 64 (1 + 2*261)),
    (const 64 (-(2**20))) <=s u_256_261, u_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_261, v_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_261, r_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_261, s_256_261 <=s (const 64 ((2**20))),
    u_256_261 + v_256_261 <=s (const 64 (2**20)),
    u_256_261 - v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 + v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 - v_256_261 <=s (const 64 (2**20)),
    r_256_261 + s_256_261 <=s (const 64 (2**20)),
    r_256_261 - s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 + s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 - s_256_261 <=s (const 64 (2**20)),
    u_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_256_261 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise b
assume
neg_g_236_low60_20_low20_5 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_6 neg_f_236_low60_20_low20_5;
mov u_256_262 u_256_261;
mov v_256_262 v_256_261;

add neg_g_236_low60_20_low20_6 neg_g_236_low60_20_low20_5 neg_f_236_low60_20_low20_5;
asr neg_g_236_low60_20_low20_6 neg_g_236_low60_20_low20_6 1;
add r_256_262 r_256_261 u_256_261;
asr r_256_262 r_256_262 1;
add s_256_262 s_256_261 v_256_261;
asr s_256_262 s_256_262 1;
assert
    true
&&
    neg_f_236_low60_20_low20_6 = neg_f_236_low60_20_low20_5,
    u_256_262 = u_256_261,
    v_256_262 = v_256_261,
    neg_g_236_low60_20_low20_6 * (const 64 2) = neg_g_236_low60_20_low20_5 + neg_f_236_low60_20_low20_5,
    r_256_262 * (const 64 2) = r_256_261 + u_256_261,
    s_256_262 * (const 64 2) = s_256_261 + v_256_261
;

assume
    neg_f_236_low60_20_low20_6 = neg_f_236_low60_20_low20_5,
    u_256_262 = u_256_261,
    v_256_262 = v_256_261,
    neg_g_236_low60_20_low20_6 * 2 = neg_g_236_low60_20_low20_5 + neg_f_236_low60_20_low20_5,
    r_256_262 * 2 = r_256_261 + u_256_261,
    s_256_262 * 2 = s_256_261 + v_256_261
&&
    true
;

{
    u_256_262 * neg_f_236_low60_20_low20_0 + v_256_262 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_262 * neg_f_236_low60_20_low20_0 + s_256_262 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_6 + u_256_262 * (const 64 (2**21)) + v_256_262 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_6 + r_256_262 * (const 64 (2**21)) + s_256_262 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_6,
    neg_f_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_6,
    neg_g_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 262)) <=s delta, delta <=s (const 64 (1 + 2*262)),
    (const 64 (-(2**20))) <=s u_256_262, u_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_262, v_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_262, r_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_262, s_256_262 <=s (const 64 ((2**20))),
    u_256_262 + v_256_262 <=s (const 64 (2**20)),
    u_256_262 - v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 + v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 - v_256_262 <=s (const 64 (2**20)),
    r_256_262 + s_256_262 <=s (const 64 (2**20)),
    r_256_262 - s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 + s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 - s_256_262 <=s (const 64 (2**20)),
    u_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_256_262 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_261_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_5,
sint64 neg_g_236_low60_20_low20_5,
sint64 neg_f_236_low60_20_low20_6,
sint64 neg_g_236_low60_20_low20_6,
sint64 u_256_261,
sint64 v_256_261,
sint64 r_256_261,
sint64 s_256_261,
sint64 u_256_262,
sint64 v_256_262,
sint64 r_256_262,
sint64 s_256_262,
bit ne
)={
    u_256_261 * neg_f_236_low60_20_low20_0 + v_256_261 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_5 * (-(2**20)),
    r_256_261 * neg_f_236_low60_20_low20_0 + s_256_261 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_5 * (-(2**20))
&&
    u_256_261 * neg_f_236_low60_20_low20_0 + v_256_261 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_5 * (const 64 (-(2**20))),
    r_256_261 * neg_f_236_low60_20_low20_0 + s_256_261 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_5 + u_256_261 * (const 64 (2**21)) + v_256_261 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_5 + r_256_261 * (const 64 (2**21)) + s_256_261 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_5,
    neg_f_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_5,
    neg_g_236_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 261)) <=s delta, delta <=s (const 64 (1 + 2*261)),
    (const 64 (-(2**20))) <=s u_256_261, u_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_261, v_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_261, r_256_261 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_261, s_256_261 <=s (const 64 ((2**20))),
    u_256_261 + v_256_261 <=s (const 64 (2**20)),
    u_256_261 - v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 + v_256_261 <=s (const 64 (2**20)),
    (const 64 0) - u_256_261 - v_256_261 <=s (const 64 (2**20)),
    r_256_261 + s_256_261 <=s (const 64 (2**20)),
    r_256_261 - s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 + s_256_261 <=s (const 64 (2**20)),
    (const 64 0) - r_256_261 - s_256_261 <=s (const 64 (2**20)),
    u_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_256_261 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_256_261 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise c
assume
neg_g_236_low60_20_low20_5 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_6 neg_g_236_low60_20_low20_5;
mov u_256_262 r_256_261;
mov v_256_262 s_256_261;

subs dc neg_g_236_low60_20_low20_6 neg_g_236_low60_20_low20_5 neg_f_236_low60_20_low20_5;
asr neg_g_236_low60_20_low20_6 neg_g_236_low60_20_low20_6 1;
subs dc r_256_262 r_256_261 u_256_261;
asr r_256_262 r_256_262 1;
subs dc s_256_262 s_256_261 v_256_261;
asr s_256_262 s_256_262 1;
assert
    true
&&
    neg_f_236_low60_20_low20_6 = neg_g_236_low60_20_low20_5,
    u_256_262 = r_256_261,
    v_256_262 = s_256_261,
    neg_g_236_low60_20_low20_6 * (const 64 2) = neg_g_236_low60_20_low20_5 - neg_f_236_low60_20_low20_5,
    r_256_262 * (const 64 2) = r_256_261 - u_256_261,
    s_256_262 * (const 64 2) = s_256_261 - v_256_261
;

assume
    neg_f_236_low60_20_low20_6 = neg_g_236_low60_20_low20_5,
    u_256_262 = r_256_261,
    v_256_262 = s_256_261,
    neg_g_236_low60_20_low20_6 * 2 = neg_g_236_low60_20_low20_5 - neg_f_236_low60_20_low20_5,
    r_256_262 * 2 = r_256_261 - u_256_261,
    s_256_262 * 2 = s_256_261 - v_256_261
&&
    true
;

{
    u_256_262 * neg_f_236_low60_20_low20_0 + v_256_262 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_262 * neg_f_236_low60_20_low20_0 + s_256_262 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_6 + u_256_262 * (const 64 (2**21)) + v_256_262 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_6 + r_256_262 * (const 64 (2**21)) + s_256_262 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_6,
    neg_f_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_6,
    neg_g_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 262)) <=s delta, delta <=s (const 64 (1 + 2*262)),
    (const 64 (-(2**20))) <=s u_256_262, u_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_262, v_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_262, r_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_262, s_256_262 <=s (const 64 ((2**20))),
    u_256_262 + v_256_262 <=s (const 64 (2**20)),
    u_256_262 - v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 + v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 - v_256_262 <=s (const 64 (2**20)),
    r_256_262 + s_256_262 <=s (const 64 (2**20)),
    r_256_262 - s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 + s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 - s_256_262 <=s (const 64 (2**20)),
    u_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_256_262 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_262_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_6,
sint64 neg_g_236_low60_20_low20_6,
sint64 neg_f_236_low60_20_low20_7,
sint64 neg_g_236_low60_20_low20_7,
sint64 u_256_262,
sint64 v_256_262,
sint64 r_256_262,
sint64 s_256_262,
sint64 u_256_263,
sint64 v_256_263,
sint64 r_256_263,
sint64 s_256_263,
bit ne
)={
    u_256_262 * neg_f_236_low60_20_low20_0 + v_256_262 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_6 * (-(2**20)),
    r_256_262 * neg_f_236_low60_20_low20_0 + s_256_262 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_6 * (-(2**20))
&&
    u_256_262 * neg_f_236_low60_20_low20_0 + v_256_262 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_6 * (const 64 (-(2**20))),
    r_256_262 * neg_f_236_low60_20_low20_0 + s_256_262 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_6 + u_256_262 * (const 64 (2**21)) + v_256_262 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_6 + r_256_262 * (const 64 (2**21)) + s_256_262 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_6,
    neg_f_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_6,
    neg_g_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 262)) <=s delta, delta <=s (const 64 (1 + 2*262)),
    (const 64 (-(2**20))) <=s u_256_262, u_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_262, v_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_262, r_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_262, s_256_262 <=s (const 64 ((2**20))),
    u_256_262 + v_256_262 <=s (const 64 (2**20)),
    u_256_262 - v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 + v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 - v_256_262 <=s (const 64 (2**20)),
    r_256_262 + s_256_262 <=s (const 64 (2**20)),
    r_256_262 - s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 + s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 - s_256_262 <=s (const 64 (2**20)),
    u_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_256_262 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise a
assume
neg_g_236_low60_20_low20_6 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_7 neg_f_236_low60_20_low20_6;
mov u_256_263 u_256_262;
mov v_256_263 v_256_262;

asr neg_g_236_low60_20_low20_7 neg_g_236_low60_20_low20_6 1;
asr r_256_263 r_256_262 1;
asr s_256_263 s_256_262 1;
assert
    true
&&
    neg_f_236_low60_20_low20_7 = neg_f_236_low60_20_low20_6,
    u_256_263 = u_256_262,
    v_256_263 = v_256_262,
    neg_g_236_low60_20_low20_7 * (const 64 2) = neg_g_236_low60_20_low20_6,
    r_256_263 * (const 64 2) = r_256_262,
    s_256_263 * (const 64 2) = s_256_262
;

assume
    neg_f_236_low60_20_low20_7 = neg_f_236_low60_20_low20_6,
    u_256_263 = u_256_262,
    v_256_263 = v_256_262,
    neg_g_236_low60_20_low20_7 * 2 = neg_g_236_low60_20_low20_6,
    r_256_263 * 2 = r_256_262,
    s_256_263 * 2 = s_256_262
&&
    true
;

{
    u_256_263 * neg_f_236_low60_20_low20_0 + v_256_263 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_263 * neg_f_236_low60_20_low20_0 + s_256_263 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_7 + u_256_263 * (const 64 (2**21)) + v_256_263 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_7 + r_256_263 * (const 64 (2**21)) + s_256_263 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_7,
    neg_f_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_7,
    neg_g_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 263)) <=s delta, delta <=s (const 64 (1 + 2*263)),
    (const 64 (-(2**20))) <=s u_256_263, u_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_263, v_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_263, r_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_263, s_256_263 <=s (const 64 ((2**20))),
    u_256_263 + v_256_263 <=s (const 64 (2**20)),
    u_256_263 - v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 + v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 - v_256_263 <=s (const 64 (2**20)),
    r_256_263 + s_256_263 <=s (const 64 (2**20)),
    r_256_263 - s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 + s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 - s_256_263 <=s (const 64 (2**20)),
    u_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_256_263 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_262_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_6,
sint64 neg_g_236_low60_20_low20_6,
sint64 neg_f_236_low60_20_low20_7,
sint64 neg_g_236_low60_20_low20_7,
sint64 u_256_262,
sint64 v_256_262,
sint64 r_256_262,
sint64 s_256_262,
sint64 u_256_263,
sint64 v_256_263,
sint64 r_256_263,
sint64 s_256_263,
bit ne
)={
    u_256_262 * neg_f_236_low60_20_low20_0 + v_256_262 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_6 * (-(2**20)),
    r_256_262 * neg_f_236_low60_20_low20_0 + s_256_262 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_6 * (-(2**20))
&&
    u_256_262 * neg_f_236_low60_20_low20_0 + v_256_262 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_6 * (const 64 (-(2**20))),
    r_256_262 * neg_f_236_low60_20_low20_0 + s_256_262 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_6 + u_256_262 * (const 64 (2**21)) + v_256_262 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_6 + r_256_262 * (const 64 (2**21)) + s_256_262 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_6,
    neg_f_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_6,
    neg_g_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 262)) <=s delta, delta <=s (const 64 (1 + 2*262)),
    (const 64 (-(2**20))) <=s u_256_262, u_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_262, v_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_262, r_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_262, s_256_262 <=s (const 64 ((2**20))),
    u_256_262 + v_256_262 <=s (const 64 (2**20)),
    u_256_262 - v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 + v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 - v_256_262 <=s (const 64 (2**20)),
    r_256_262 + s_256_262 <=s (const 64 (2**20)),
    r_256_262 - s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 + s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 - s_256_262 <=s (const 64 (2**20)),
    u_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_256_262 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise b
assume
neg_g_236_low60_20_low20_6 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_7 neg_f_236_low60_20_low20_6;
mov u_256_263 u_256_262;
mov v_256_263 v_256_262;

add neg_g_236_low60_20_low20_7 neg_g_236_low60_20_low20_6 neg_f_236_low60_20_low20_6;
asr neg_g_236_low60_20_low20_7 neg_g_236_low60_20_low20_7 1;
add r_256_263 r_256_262 u_256_262;
asr r_256_263 r_256_263 1;
add s_256_263 s_256_262 v_256_262;
asr s_256_263 s_256_263 1;
assert
    true
&&
    neg_f_236_low60_20_low20_7 = neg_f_236_low60_20_low20_6,
    u_256_263 = u_256_262,
    v_256_263 = v_256_262,
    neg_g_236_low60_20_low20_7 * (const 64 2) = neg_g_236_low60_20_low20_6 + neg_f_236_low60_20_low20_6,
    r_256_263 * (const 64 2) = r_256_262 + u_256_262,
    s_256_263 * (const 64 2) = s_256_262 + v_256_262
;

assume
    neg_f_236_low60_20_low20_7 = neg_f_236_low60_20_low20_6,
    u_256_263 = u_256_262,
    v_256_263 = v_256_262,
    neg_g_236_low60_20_low20_7 * 2 = neg_g_236_low60_20_low20_6 + neg_f_236_low60_20_low20_6,
    r_256_263 * 2 = r_256_262 + u_256_262,
    s_256_263 * 2 = s_256_262 + v_256_262
&&
    true
;

{
    u_256_263 * neg_f_236_low60_20_low20_0 + v_256_263 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_263 * neg_f_236_low60_20_low20_0 + s_256_263 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_7 + u_256_263 * (const 64 (2**21)) + v_256_263 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_7 + r_256_263 * (const 64 (2**21)) + s_256_263 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_7,
    neg_f_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_7,
    neg_g_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 263)) <=s delta, delta <=s (const 64 (1 + 2*263)),
    (const 64 (-(2**20))) <=s u_256_263, u_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_263, v_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_263, r_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_263, s_256_263 <=s (const 64 ((2**20))),
    u_256_263 + v_256_263 <=s (const 64 (2**20)),
    u_256_263 - v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 + v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 - v_256_263 <=s (const 64 (2**20)),
    r_256_263 + s_256_263 <=s (const 64 (2**20)),
    r_256_263 - s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 + s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 - s_256_263 <=s (const 64 (2**20)),
    u_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_256_263 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_262_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_6,
sint64 neg_g_236_low60_20_low20_6,
sint64 neg_f_236_low60_20_low20_7,
sint64 neg_g_236_low60_20_low20_7,
sint64 u_256_262,
sint64 v_256_262,
sint64 r_256_262,
sint64 s_256_262,
sint64 u_256_263,
sint64 v_256_263,
sint64 r_256_263,
sint64 s_256_263,
bit ne
)={
    u_256_262 * neg_f_236_low60_20_low20_0 + v_256_262 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_6 * (-(2**20)),
    r_256_262 * neg_f_236_low60_20_low20_0 + s_256_262 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_6 * (-(2**20))
&&
    u_256_262 * neg_f_236_low60_20_low20_0 + v_256_262 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_6 * (const 64 (-(2**20))),
    r_256_262 * neg_f_236_low60_20_low20_0 + s_256_262 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_6 + u_256_262 * (const 64 (2**21)) + v_256_262 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_6 + r_256_262 * (const 64 (2**21)) + s_256_262 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_6,
    neg_f_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_6,
    neg_g_236_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 262)) <=s delta, delta <=s (const 64 (1 + 2*262)),
    (const 64 (-(2**20))) <=s u_256_262, u_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_262, v_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_262, r_256_262 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_262, s_256_262 <=s (const 64 ((2**20))),
    u_256_262 + v_256_262 <=s (const 64 (2**20)),
    u_256_262 - v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 + v_256_262 <=s (const 64 (2**20)),
    (const 64 0) - u_256_262 - v_256_262 <=s (const 64 (2**20)),
    r_256_262 + s_256_262 <=s (const 64 (2**20)),
    r_256_262 - s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 + s_256_262 <=s (const 64 (2**20)),
    (const 64 0) - r_256_262 - s_256_262 <=s (const 64 (2**20)),
    u_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_256_262 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_256_262 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise c
assume
neg_g_236_low60_20_low20_6 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_7 neg_g_236_low60_20_low20_6;
mov u_256_263 r_256_262;
mov v_256_263 s_256_262;

subs dc neg_g_236_low60_20_low20_7 neg_g_236_low60_20_low20_6 neg_f_236_low60_20_low20_6;
asr neg_g_236_low60_20_low20_7 neg_g_236_low60_20_low20_7 1;
subs dc r_256_263 r_256_262 u_256_262;
asr r_256_263 r_256_263 1;
subs dc s_256_263 s_256_262 v_256_262;
asr s_256_263 s_256_263 1;
assert
    true
&&
    neg_f_236_low60_20_low20_7 = neg_g_236_low60_20_low20_6,
    u_256_263 = r_256_262,
    v_256_263 = s_256_262,
    neg_g_236_low60_20_low20_7 * (const 64 2) = neg_g_236_low60_20_low20_6 - neg_f_236_low60_20_low20_6,
    r_256_263 * (const 64 2) = r_256_262 - u_256_262,
    s_256_263 * (const 64 2) = s_256_262 - v_256_262
;

assume
    neg_f_236_low60_20_low20_7 = neg_g_236_low60_20_low20_6,
    u_256_263 = r_256_262,
    v_256_263 = s_256_262,
    neg_g_236_low60_20_low20_7 * 2 = neg_g_236_low60_20_low20_6 - neg_f_236_low60_20_low20_6,
    r_256_263 * 2 = r_256_262 - u_256_262,
    s_256_263 * 2 = s_256_262 - v_256_262
&&
    true
;

{
    u_256_263 * neg_f_236_low60_20_low20_0 + v_256_263 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_263 * neg_f_236_low60_20_low20_0 + s_256_263 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_7 + u_256_263 * (const 64 (2**21)) + v_256_263 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_7 + r_256_263 * (const 64 (2**21)) + s_256_263 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_7,
    neg_f_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_7,
    neg_g_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 263)) <=s delta, delta <=s (const 64 (1 + 2*263)),
    (const 64 (-(2**20))) <=s u_256_263, u_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_263, v_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_263, r_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_263, s_256_263 <=s (const 64 ((2**20))),
    u_256_263 + v_256_263 <=s (const 64 (2**20)),
    u_256_263 - v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 + v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 - v_256_263 <=s (const 64 (2**20)),
    r_256_263 + s_256_263 <=s (const 64 (2**20)),
    r_256_263 - s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 + s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 - s_256_263 <=s (const 64 (2**20)),
    u_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_256_263 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_263_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_7,
sint64 neg_g_236_low60_20_low20_7,
sint64 neg_f_236_low60_20_low20_8,
sint64 neg_g_236_low60_20_low20_8,
sint64 u_256_263,
sint64 v_256_263,
sint64 r_256_263,
sint64 s_256_263,
sint64 u_256_264,
sint64 v_256_264,
sint64 r_256_264,
sint64 s_256_264,
bit ne
)={
    u_256_263 * neg_f_236_low60_20_low20_0 + v_256_263 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_7 * (-(2**20)),
    r_256_263 * neg_f_236_low60_20_low20_0 + s_256_263 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_7 * (-(2**20))
&&
    u_256_263 * neg_f_236_low60_20_low20_0 + v_256_263 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_7 * (const 64 (-(2**20))),
    r_256_263 * neg_f_236_low60_20_low20_0 + s_256_263 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_7 + u_256_263 * (const 64 (2**21)) + v_256_263 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_7 + r_256_263 * (const 64 (2**21)) + s_256_263 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_7,
    neg_f_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_7,
    neg_g_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 263)) <=s delta, delta <=s (const 64 (1 + 2*263)),
    (const 64 (-(2**20))) <=s u_256_263, u_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_263, v_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_263, r_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_263, s_256_263 <=s (const 64 ((2**20))),
    u_256_263 + v_256_263 <=s (const 64 (2**20)),
    u_256_263 - v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 + v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 - v_256_263 <=s (const 64 (2**20)),
    r_256_263 + s_256_263 <=s (const 64 (2**20)),
    r_256_263 - s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 + s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 - s_256_263 <=s (const 64 (2**20)),
    u_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_256_263 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise a
assume
neg_g_236_low60_20_low20_7 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_8 neg_f_236_low60_20_low20_7;
mov u_256_264 u_256_263;
mov v_256_264 v_256_263;

asr neg_g_236_low60_20_low20_8 neg_g_236_low60_20_low20_7 1;
asr r_256_264 r_256_263 1;
asr s_256_264 s_256_263 1;
assert
    true
&&
    neg_f_236_low60_20_low20_8 = neg_f_236_low60_20_low20_7,
    u_256_264 = u_256_263,
    v_256_264 = v_256_263,
    neg_g_236_low60_20_low20_8 * (const 64 2) = neg_g_236_low60_20_low20_7,
    r_256_264 * (const 64 2) = r_256_263,
    s_256_264 * (const 64 2) = s_256_263
;

assume
    neg_f_236_low60_20_low20_8 = neg_f_236_low60_20_low20_7,
    u_256_264 = u_256_263,
    v_256_264 = v_256_263,
    neg_g_236_low60_20_low20_8 * 2 = neg_g_236_low60_20_low20_7,
    r_256_264 * 2 = r_256_263,
    s_256_264 * 2 = s_256_263
&&
    true
;

{
    u_256_264 * neg_f_236_low60_20_low20_0 + v_256_264 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_264 * neg_f_236_low60_20_low20_0 + s_256_264 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_8 + u_256_264 * (const 64 (2**21)) + v_256_264 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_8 + r_256_264 * (const 64 (2**21)) + s_256_264 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_8,
    neg_f_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_8,
    neg_g_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 264)) <=s delta, delta <=s (const 64 (1 + 2*264)),
    (const 64 (-(2**20))) <=s u_256_264, u_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_264, v_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_264, r_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_264, s_256_264 <=s (const 64 ((2**20))),
    u_256_264 + v_256_264 <=s (const 64 (2**20)),
    u_256_264 - v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 + v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 - v_256_264 <=s (const 64 (2**20)),
    r_256_264 + s_256_264 <=s (const 64 (2**20)),
    r_256_264 - s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 + s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 - s_256_264 <=s (const 64 (2**20)),
    u_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_256_264 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_263_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_7,
sint64 neg_g_236_low60_20_low20_7,
sint64 neg_f_236_low60_20_low20_8,
sint64 neg_g_236_low60_20_low20_8,
sint64 u_256_263,
sint64 v_256_263,
sint64 r_256_263,
sint64 s_256_263,
sint64 u_256_264,
sint64 v_256_264,
sint64 r_256_264,
sint64 s_256_264,
bit ne
)={
    u_256_263 * neg_f_236_low60_20_low20_0 + v_256_263 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_7 * (-(2**20)),
    r_256_263 * neg_f_236_low60_20_low20_0 + s_256_263 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_7 * (-(2**20))
&&
    u_256_263 * neg_f_236_low60_20_low20_0 + v_256_263 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_7 * (const 64 (-(2**20))),
    r_256_263 * neg_f_236_low60_20_low20_0 + s_256_263 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_7 + u_256_263 * (const 64 (2**21)) + v_256_263 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_7 + r_256_263 * (const 64 (2**21)) + s_256_263 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_7,
    neg_f_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_7,
    neg_g_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 263)) <=s delta, delta <=s (const 64 (1 + 2*263)),
    (const 64 (-(2**20))) <=s u_256_263, u_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_263, v_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_263, r_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_263, s_256_263 <=s (const 64 ((2**20))),
    u_256_263 + v_256_263 <=s (const 64 (2**20)),
    u_256_263 - v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 + v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 - v_256_263 <=s (const 64 (2**20)),
    r_256_263 + s_256_263 <=s (const 64 (2**20)),
    r_256_263 - s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 + s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 - s_256_263 <=s (const 64 (2**20)),
    u_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_256_263 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise b
assume
neg_g_236_low60_20_low20_7 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_8 neg_f_236_low60_20_low20_7;
mov u_256_264 u_256_263;
mov v_256_264 v_256_263;

add neg_g_236_low60_20_low20_8 neg_g_236_low60_20_low20_7 neg_f_236_low60_20_low20_7;
asr neg_g_236_low60_20_low20_8 neg_g_236_low60_20_low20_8 1;
add r_256_264 r_256_263 u_256_263;
asr r_256_264 r_256_264 1;
add s_256_264 s_256_263 v_256_263;
asr s_256_264 s_256_264 1;
assert
    true
&&
    neg_f_236_low60_20_low20_8 = neg_f_236_low60_20_low20_7,
    u_256_264 = u_256_263,
    v_256_264 = v_256_263,
    neg_g_236_low60_20_low20_8 * (const 64 2) = neg_g_236_low60_20_low20_7 + neg_f_236_low60_20_low20_7,
    r_256_264 * (const 64 2) = r_256_263 + u_256_263,
    s_256_264 * (const 64 2) = s_256_263 + v_256_263
;

assume
    neg_f_236_low60_20_low20_8 = neg_f_236_low60_20_low20_7,
    u_256_264 = u_256_263,
    v_256_264 = v_256_263,
    neg_g_236_low60_20_low20_8 * 2 = neg_g_236_low60_20_low20_7 + neg_f_236_low60_20_low20_7,
    r_256_264 * 2 = r_256_263 + u_256_263,
    s_256_264 * 2 = s_256_263 + v_256_263
&&
    true
;

{
    u_256_264 * neg_f_236_low60_20_low20_0 + v_256_264 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_264 * neg_f_236_low60_20_low20_0 + s_256_264 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_8 + u_256_264 * (const 64 (2**21)) + v_256_264 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_8 + r_256_264 * (const 64 (2**21)) + s_256_264 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_8,
    neg_f_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_8,
    neg_g_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 264)) <=s delta, delta <=s (const 64 (1 + 2*264)),
    (const 64 (-(2**20))) <=s u_256_264, u_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_264, v_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_264, r_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_264, s_256_264 <=s (const 64 ((2**20))),
    u_256_264 + v_256_264 <=s (const 64 (2**20)),
    u_256_264 - v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 + v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 - v_256_264 <=s (const 64 (2**20)),
    r_256_264 + s_256_264 <=s (const 64 (2**20)),
    r_256_264 - s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 + s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 - s_256_264 <=s (const 64 (2**20)),
    u_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_256_264 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_263_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_7,
sint64 neg_g_236_low60_20_low20_7,
sint64 neg_f_236_low60_20_low20_8,
sint64 neg_g_236_low60_20_low20_8,
sint64 u_256_263,
sint64 v_256_263,
sint64 r_256_263,
sint64 s_256_263,
sint64 u_256_264,
sint64 v_256_264,
sint64 r_256_264,
sint64 s_256_264,
bit ne
)={
    u_256_263 * neg_f_236_low60_20_low20_0 + v_256_263 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_7 * (-(2**20)),
    r_256_263 * neg_f_236_low60_20_low20_0 + s_256_263 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_7 * (-(2**20))
&&
    u_256_263 * neg_f_236_low60_20_low20_0 + v_256_263 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_7 * (const 64 (-(2**20))),
    r_256_263 * neg_f_236_low60_20_low20_0 + s_256_263 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_7 + u_256_263 * (const 64 (2**21)) + v_256_263 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_7 + r_256_263 * (const 64 (2**21)) + s_256_263 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_7,
    neg_f_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_7,
    neg_g_236_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 263)) <=s delta, delta <=s (const 64 (1 + 2*263)),
    (const 64 (-(2**20))) <=s u_256_263, u_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_263, v_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_263, r_256_263 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_263, s_256_263 <=s (const 64 ((2**20))),
    u_256_263 + v_256_263 <=s (const 64 (2**20)),
    u_256_263 - v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 + v_256_263 <=s (const 64 (2**20)),
    (const 64 0) - u_256_263 - v_256_263 <=s (const 64 (2**20)),
    r_256_263 + s_256_263 <=s (const 64 (2**20)),
    r_256_263 - s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 + s_256_263 <=s (const 64 (2**20)),
    (const 64 0) - r_256_263 - s_256_263 <=s (const 64 (2**20)),
    u_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_256_263 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_256_263 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise c
assume
neg_g_236_low60_20_low20_7 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_8 neg_g_236_low60_20_low20_7;
mov u_256_264 r_256_263;
mov v_256_264 s_256_263;

subs dc neg_g_236_low60_20_low20_8 neg_g_236_low60_20_low20_7 neg_f_236_low60_20_low20_7;
asr neg_g_236_low60_20_low20_8 neg_g_236_low60_20_low20_8 1;
subs dc r_256_264 r_256_263 u_256_263;
asr r_256_264 r_256_264 1;
subs dc s_256_264 s_256_263 v_256_263;
asr s_256_264 s_256_264 1;
assert
    true
&&
    neg_f_236_low60_20_low20_8 = neg_g_236_low60_20_low20_7,
    u_256_264 = r_256_263,
    v_256_264 = s_256_263,
    neg_g_236_low60_20_low20_8 * (const 64 2) = neg_g_236_low60_20_low20_7 - neg_f_236_low60_20_low20_7,
    r_256_264 * (const 64 2) = r_256_263 - u_256_263,
    s_256_264 * (const 64 2) = s_256_263 - v_256_263
;

assume
    neg_f_236_low60_20_low20_8 = neg_g_236_low60_20_low20_7,
    u_256_264 = r_256_263,
    v_256_264 = s_256_263,
    neg_g_236_low60_20_low20_8 * 2 = neg_g_236_low60_20_low20_7 - neg_f_236_low60_20_low20_7,
    r_256_264 * 2 = r_256_263 - u_256_263,
    s_256_264 * 2 = s_256_263 - v_256_263
&&
    true
;

{
    u_256_264 * neg_f_236_low60_20_low20_0 + v_256_264 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_264 * neg_f_236_low60_20_low20_0 + s_256_264 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_8 + u_256_264 * (const 64 (2**21)) + v_256_264 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_8 + r_256_264 * (const 64 (2**21)) + s_256_264 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_8,
    neg_f_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_8,
    neg_g_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 264)) <=s delta, delta <=s (const 64 (1 + 2*264)),
    (const 64 (-(2**20))) <=s u_256_264, u_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_264, v_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_264, r_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_264, s_256_264 <=s (const 64 ((2**20))),
    u_256_264 + v_256_264 <=s (const 64 (2**20)),
    u_256_264 - v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 + v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 - v_256_264 <=s (const 64 (2**20)),
    r_256_264 + s_256_264 <=s (const 64 (2**20)),
    r_256_264 - s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 + s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 - s_256_264 <=s (const 64 (2**20)),
    u_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_256_264 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_264_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_8,
sint64 neg_g_236_low60_20_low20_8,
sint64 neg_f_236_low60_20_low20_9,
sint64 neg_g_236_low60_20_low20_9,
sint64 u_256_264,
sint64 v_256_264,
sint64 r_256_264,
sint64 s_256_264,
sint64 u_256_265,
sint64 v_256_265,
sint64 r_256_265,
sint64 s_256_265,
bit ne
)={
    u_256_264 * neg_f_236_low60_20_low20_0 + v_256_264 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_8 * (-(2**20)),
    r_256_264 * neg_f_236_low60_20_low20_0 + s_256_264 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_8 * (-(2**20))
&&
    u_256_264 * neg_f_236_low60_20_low20_0 + v_256_264 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_8 * (const 64 (-(2**20))),
    r_256_264 * neg_f_236_low60_20_low20_0 + s_256_264 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_8 + u_256_264 * (const 64 (2**21)) + v_256_264 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_8 + r_256_264 * (const 64 (2**21)) + s_256_264 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_8,
    neg_f_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_8,
    neg_g_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 264)) <=s delta, delta <=s (const 64 (1 + 2*264)),
    (const 64 (-(2**20))) <=s u_256_264, u_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_264, v_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_264, r_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_264, s_256_264 <=s (const 64 ((2**20))),
    u_256_264 + v_256_264 <=s (const 64 (2**20)),
    u_256_264 - v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 + v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 - v_256_264 <=s (const 64 (2**20)),
    r_256_264 + s_256_264 <=s (const 64 (2**20)),
    r_256_264 - s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 + s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 - s_256_264 <=s (const 64 (2**20)),
    u_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_256_264 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise a
assume
neg_g_236_low60_20_low20_8 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_9 neg_f_236_low60_20_low20_8;
mov u_256_265 u_256_264;
mov v_256_265 v_256_264;

asr neg_g_236_low60_20_low20_9 neg_g_236_low60_20_low20_8 1;
asr r_256_265 r_256_264 1;
asr s_256_265 s_256_264 1;
assert
    true
&&
    neg_f_236_low60_20_low20_9 = neg_f_236_low60_20_low20_8,
    u_256_265 = u_256_264,
    v_256_265 = v_256_264,
    neg_g_236_low60_20_low20_9 * (const 64 2) = neg_g_236_low60_20_low20_8,
    r_256_265 * (const 64 2) = r_256_264,
    s_256_265 * (const 64 2) = s_256_264
;

assume
    neg_f_236_low60_20_low20_9 = neg_f_236_low60_20_low20_8,
    u_256_265 = u_256_264,
    v_256_265 = v_256_264,
    neg_g_236_low60_20_low20_9 * 2 = neg_g_236_low60_20_low20_8,
    r_256_265 * 2 = r_256_264,
    s_256_265 * 2 = s_256_264
&&
    true
;

{
    u_256_265 * neg_f_236_low60_20_low20_0 + v_256_265 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_265 * neg_f_236_low60_20_low20_0 + s_256_265 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_9 + u_256_265 * (const 64 (2**21)) + v_256_265 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_9 + r_256_265 * (const 64 (2**21)) + s_256_265 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_9,
    neg_f_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_9,
    neg_g_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 265)) <=s delta, delta <=s (const 64 (1 + 2*265)),
    (const 64 (-(2**20))) <=s u_256_265, u_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_265, v_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_265, r_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_265, s_256_265 <=s (const 64 ((2**20))),
    u_256_265 + v_256_265 <=s (const 64 (2**20)),
    u_256_265 - v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 + v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 - v_256_265 <=s (const 64 (2**20)),
    r_256_265 + s_256_265 <=s (const 64 (2**20)),
    r_256_265 - s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 + s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 - s_256_265 <=s (const 64 (2**20)),
    u_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_256_265 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_264_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_8,
sint64 neg_g_236_low60_20_low20_8,
sint64 neg_f_236_low60_20_low20_9,
sint64 neg_g_236_low60_20_low20_9,
sint64 u_256_264,
sint64 v_256_264,
sint64 r_256_264,
sint64 s_256_264,
sint64 u_256_265,
sint64 v_256_265,
sint64 r_256_265,
sint64 s_256_265,
bit ne
)={
    u_256_264 * neg_f_236_low60_20_low20_0 + v_256_264 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_8 * (-(2**20)),
    r_256_264 * neg_f_236_low60_20_low20_0 + s_256_264 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_8 * (-(2**20))
&&
    u_256_264 * neg_f_236_low60_20_low20_0 + v_256_264 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_8 * (const 64 (-(2**20))),
    r_256_264 * neg_f_236_low60_20_low20_0 + s_256_264 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_8 + u_256_264 * (const 64 (2**21)) + v_256_264 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_8 + r_256_264 * (const 64 (2**21)) + s_256_264 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_8,
    neg_f_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_8,
    neg_g_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 264)) <=s delta, delta <=s (const 64 (1 + 2*264)),
    (const 64 (-(2**20))) <=s u_256_264, u_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_264, v_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_264, r_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_264, s_256_264 <=s (const 64 ((2**20))),
    u_256_264 + v_256_264 <=s (const 64 (2**20)),
    u_256_264 - v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 + v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 - v_256_264 <=s (const 64 (2**20)),
    r_256_264 + s_256_264 <=s (const 64 (2**20)),
    r_256_264 - s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 + s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 - s_256_264 <=s (const 64 (2**20)),
    u_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_256_264 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise b
assume
neg_g_236_low60_20_low20_8 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_9 neg_f_236_low60_20_low20_8;
mov u_256_265 u_256_264;
mov v_256_265 v_256_264;

add neg_g_236_low60_20_low20_9 neg_g_236_low60_20_low20_8 neg_f_236_low60_20_low20_8;
asr neg_g_236_low60_20_low20_9 neg_g_236_low60_20_low20_9 1;
add r_256_265 r_256_264 u_256_264;
asr r_256_265 r_256_265 1;
add s_256_265 s_256_264 v_256_264;
asr s_256_265 s_256_265 1;
assert
    true
&&
    neg_f_236_low60_20_low20_9 = neg_f_236_low60_20_low20_8,
    u_256_265 = u_256_264,
    v_256_265 = v_256_264,
    neg_g_236_low60_20_low20_9 * (const 64 2) = neg_g_236_low60_20_low20_8 + neg_f_236_low60_20_low20_8,
    r_256_265 * (const 64 2) = r_256_264 + u_256_264,
    s_256_265 * (const 64 2) = s_256_264 + v_256_264
;

assume
    neg_f_236_low60_20_low20_9 = neg_f_236_low60_20_low20_8,
    u_256_265 = u_256_264,
    v_256_265 = v_256_264,
    neg_g_236_low60_20_low20_9 * 2 = neg_g_236_low60_20_low20_8 + neg_f_236_low60_20_low20_8,
    r_256_265 * 2 = r_256_264 + u_256_264,
    s_256_265 * 2 = s_256_264 + v_256_264
&&
    true
;

{
    u_256_265 * neg_f_236_low60_20_low20_0 + v_256_265 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_265 * neg_f_236_low60_20_low20_0 + s_256_265 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_9 + u_256_265 * (const 64 (2**21)) + v_256_265 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_9 + r_256_265 * (const 64 (2**21)) + s_256_265 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_9,
    neg_f_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_9,
    neg_g_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 265)) <=s delta, delta <=s (const 64 (1 + 2*265)),
    (const 64 (-(2**20))) <=s u_256_265, u_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_265, v_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_265, r_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_265, s_256_265 <=s (const 64 ((2**20))),
    u_256_265 + v_256_265 <=s (const 64 (2**20)),
    u_256_265 - v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 + v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 - v_256_265 <=s (const 64 (2**20)),
    r_256_265 + s_256_265 <=s (const 64 (2**20)),
    r_256_265 - s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 + s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 - s_256_265 <=s (const 64 (2**20)),
    u_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_256_265 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_264_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_8,
sint64 neg_g_236_low60_20_low20_8,
sint64 neg_f_236_low60_20_low20_9,
sint64 neg_g_236_low60_20_low20_9,
sint64 u_256_264,
sint64 v_256_264,
sint64 r_256_264,
sint64 s_256_264,
sint64 u_256_265,
sint64 v_256_265,
sint64 r_256_265,
sint64 s_256_265,
bit ne
)={
    u_256_264 * neg_f_236_low60_20_low20_0 + v_256_264 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_8 * (-(2**20)),
    r_256_264 * neg_f_236_low60_20_low20_0 + s_256_264 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_8 * (-(2**20))
&&
    u_256_264 * neg_f_236_low60_20_low20_0 + v_256_264 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_8 * (const 64 (-(2**20))),
    r_256_264 * neg_f_236_low60_20_low20_0 + s_256_264 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_8 + u_256_264 * (const 64 (2**21)) + v_256_264 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_8 + r_256_264 * (const 64 (2**21)) + s_256_264 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_8,
    neg_f_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_8,
    neg_g_236_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 264)) <=s delta, delta <=s (const 64 (1 + 2*264)),
    (const 64 (-(2**20))) <=s u_256_264, u_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_264, v_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_264, r_256_264 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_264, s_256_264 <=s (const 64 ((2**20))),
    u_256_264 + v_256_264 <=s (const 64 (2**20)),
    u_256_264 - v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 + v_256_264 <=s (const 64 (2**20)),
    (const 64 0) - u_256_264 - v_256_264 <=s (const 64 (2**20)),
    r_256_264 + s_256_264 <=s (const 64 (2**20)),
    r_256_264 - s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 + s_256_264 <=s (const 64 (2**20)),
    (const 64 0) - r_256_264 - s_256_264 <=s (const 64 (2**20)),
    u_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_256_264 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_256_264 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise c
assume
neg_g_236_low60_20_low20_8 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_9 neg_g_236_low60_20_low20_8;
mov u_256_265 r_256_264;
mov v_256_265 s_256_264;

subs dc neg_g_236_low60_20_low20_9 neg_g_236_low60_20_low20_8 neg_f_236_low60_20_low20_8;
asr neg_g_236_low60_20_low20_9 neg_g_236_low60_20_low20_9 1;
subs dc r_256_265 r_256_264 u_256_264;
asr r_256_265 r_256_265 1;
subs dc s_256_265 s_256_264 v_256_264;
asr s_256_265 s_256_265 1;
assert
    true
&&
    neg_f_236_low60_20_low20_9 = neg_g_236_low60_20_low20_8,
    u_256_265 = r_256_264,
    v_256_265 = s_256_264,
    neg_g_236_low60_20_low20_9 * (const 64 2) = neg_g_236_low60_20_low20_8 - neg_f_236_low60_20_low20_8,
    r_256_265 * (const 64 2) = r_256_264 - u_256_264,
    s_256_265 * (const 64 2) = s_256_264 - v_256_264
;

assume
    neg_f_236_low60_20_low20_9 = neg_g_236_low60_20_low20_8,
    u_256_265 = r_256_264,
    v_256_265 = s_256_264,
    neg_g_236_low60_20_low20_9 * 2 = neg_g_236_low60_20_low20_8 - neg_f_236_low60_20_low20_8,
    r_256_265 * 2 = r_256_264 - u_256_264,
    s_256_265 * 2 = s_256_264 - v_256_264
&&
    true
;

{
    u_256_265 * neg_f_236_low60_20_low20_0 + v_256_265 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_265 * neg_f_236_low60_20_low20_0 + s_256_265 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_9 + u_256_265 * (const 64 (2**21)) + v_256_265 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_9 + r_256_265 * (const 64 (2**21)) + s_256_265 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_9,
    neg_f_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_9,
    neg_g_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 265)) <=s delta, delta <=s (const 64 (1 + 2*265)),
    (const 64 (-(2**20))) <=s u_256_265, u_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_265, v_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_265, r_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_265, s_256_265 <=s (const 64 ((2**20))),
    u_256_265 + v_256_265 <=s (const 64 (2**20)),
    u_256_265 - v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 + v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 - v_256_265 <=s (const 64 (2**20)),
    r_256_265 + s_256_265 <=s (const 64 (2**20)),
    r_256_265 - s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 + s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 - s_256_265 <=s (const 64 (2**20)),
    u_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_256_265 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_265_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_9,
sint64 neg_g_236_low60_20_low20_9,
sint64 neg_f_236_low60_20_low20_10,
sint64 neg_g_236_low60_20_low20_10,
sint64 u_256_265,
sint64 v_256_265,
sint64 r_256_265,
sint64 s_256_265,
sint64 u_256_266,
sint64 v_256_266,
sint64 r_256_266,
sint64 s_256_266,
bit ne
)={
    u_256_265 * neg_f_236_low60_20_low20_0 + v_256_265 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_9 * (-(2**20)),
    r_256_265 * neg_f_236_low60_20_low20_0 + s_256_265 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_9 * (-(2**20))
&&
    u_256_265 * neg_f_236_low60_20_low20_0 + v_256_265 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_9 * (const 64 (-(2**20))),
    r_256_265 * neg_f_236_low60_20_low20_0 + s_256_265 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_9 + u_256_265 * (const 64 (2**21)) + v_256_265 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_9 + r_256_265 * (const 64 (2**21)) + s_256_265 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_9,
    neg_f_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_9,
    neg_g_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 265)) <=s delta, delta <=s (const 64 (1 + 2*265)),
    (const 64 (-(2**20))) <=s u_256_265, u_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_265, v_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_265, r_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_265, s_256_265 <=s (const 64 ((2**20))),
    u_256_265 + v_256_265 <=s (const 64 (2**20)),
    u_256_265 - v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 + v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 - v_256_265 <=s (const 64 (2**20)),
    r_256_265 + s_256_265 <=s (const 64 (2**20)),
    r_256_265 - s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 + s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 - s_256_265 <=s (const 64 (2**20)),
    u_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_256_265 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise a
assume
neg_g_236_low60_20_low20_9 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_10 neg_f_236_low60_20_low20_9;
mov u_256_266 u_256_265;
mov v_256_266 v_256_265;

asr neg_g_236_low60_20_low20_10 neg_g_236_low60_20_low20_9 1;
asr r_256_266 r_256_265 1;
asr s_256_266 s_256_265 1;
assert
    true
&&
    neg_f_236_low60_20_low20_10 = neg_f_236_low60_20_low20_9,
    u_256_266 = u_256_265,
    v_256_266 = v_256_265,
    neg_g_236_low60_20_low20_10 * (const 64 2) = neg_g_236_low60_20_low20_9,
    r_256_266 * (const 64 2) = r_256_265,
    s_256_266 * (const 64 2) = s_256_265
;

assume
    neg_f_236_low60_20_low20_10 = neg_f_236_low60_20_low20_9,
    u_256_266 = u_256_265,
    v_256_266 = v_256_265,
    neg_g_236_low60_20_low20_10 * 2 = neg_g_236_low60_20_low20_9,
    r_256_266 * 2 = r_256_265,
    s_256_266 * 2 = s_256_265
&&
    true
;

{
    u_256_266 * neg_f_236_low60_20_low20_0 + v_256_266 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_266 * neg_f_236_low60_20_low20_0 + s_256_266 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_10 + u_256_266 * (const 64 (2**21)) + v_256_266 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_10 + r_256_266 * (const 64 (2**21)) + s_256_266 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_10,
    neg_f_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_10,
    neg_g_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 266)) <=s delta, delta <=s (const 64 (1 + 2*266)),
    (const 64 (-(2**20))) <=s u_256_266, u_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_266, v_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_266, r_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_266, s_256_266 <=s (const 64 ((2**20))),
    u_256_266 + v_256_266 <=s (const 64 (2**20)),
    u_256_266 - v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 + v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 - v_256_266 <=s (const 64 (2**20)),
    r_256_266 + s_256_266 <=s (const 64 (2**20)),
    r_256_266 - s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 + s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 - s_256_266 <=s (const 64 (2**20)),
    u_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_256_266 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_265_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_9,
sint64 neg_g_236_low60_20_low20_9,
sint64 neg_f_236_low60_20_low20_10,
sint64 neg_g_236_low60_20_low20_10,
sint64 u_256_265,
sint64 v_256_265,
sint64 r_256_265,
sint64 s_256_265,
sint64 u_256_266,
sint64 v_256_266,
sint64 r_256_266,
sint64 s_256_266,
bit ne
)={
    u_256_265 * neg_f_236_low60_20_low20_0 + v_256_265 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_9 * (-(2**20)),
    r_256_265 * neg_f_236_low60_20_low20_0 + s_256_265 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_9 * (-(2**20))
&&
    u_256_265 * neg_f_236_low60_20_low20_0 + v_256_265 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_9 * (const 64 (-(2**20))),
    r_256_265 * neg_f_236_low60_20_low20_0 + s_256_265 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_9 + u_256_265 * (const 64 (2**21)) + v_256_265 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_9 + r_256_265 * (const 64 (2**21)) + s_256_265 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_9,
    neg_f_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_9,
    neg_g_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 265)) <=s delta, delta <=s (const 64 (1 + 2*265)),
    (const 64 (-(2**20))) <=s u_256_265, u_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_265, v_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_265, r_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_265, s_256_265 <=s (const 64 ((2**20))),
    u_256_265 + v_256_265 <=s (const 64 (2**20)),
    u_256_265 - v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 + v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 - v_256_265 <=s (const 64 (2**20)),
    r_256_265 + s_256_265 <=s (const 64 (2**20)),
    r_256_265 - s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 + s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 - s_256_265 <=s (const 64 (2**20)),
    u_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_256_265 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise b
assume
neg_g_236_low60_20_low20_9 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_10 neg_f_236_low60_20_low20_9;
mov u_256_266 u_256_265;
mov v_256_266 v_256_265;

add neg_g_236_low60_20_low20_10 neg_g_236_low60_20_low20_9 neg_f_236_low60_20_low20_9;
asr neg_g_236_low60_20_low20_10 neg_g_236_low60_20_low20_10 1;
add r_256_266 r_256_265 u_256_265;
asr r_256_266 r_256_266 1;
add s_256_266 s_256_265 v_256_265;
asr s_256_266 s_256_266 1;
assert
    true
&&
    neg_f_236_low60_20_low20_10 = neg_f_236_low60_20_low20_9,
    u_256_266 = u_256_265,
    v_256_266 = v_256_265,
    neg_g_236_low60_20_low20_10 * (const 64 2) = neg_g_236_low60_20_low20_9 + neg_f_236_low60_20_low20_9,
    r_256_266 * (const 64 2) = r_256_265 + u_256_265,
    s_256_266 * (const 64 2) = s_256_265 + v_256_265
;

assume
    neg_f_236_low60_20_low20_10 = neg_f_236_low60_20_low20_9,
    u_256_266 = u_256_265,
    v_256_266 = v_256_265,
    neg_g_236_low60_20_low20_10 * 2 = neg_g_236_low60_20_low20_9 + neg_f_236_low60_20_low20_9,
    r_256_266 * 2 = r_256_265 + u_256_265,
    s_256_266 * 2 = s_256_265 + v_256_265
&&
    true
;

{
    u_256_266 * neg_f_236_low60_20_low20_0 + v_256_266 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_266 * neg_f_236_low60_20_low20_0 + s_256_266 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_10 + u_256_266 * (const 64 (2**21)) + v_256_266 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_10 + r_256_266 * (const 64 (2**21)) + s_256_266 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_10,
    neg_f_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_10,
    neg_g_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 266)) <=s delta, delta <=s (const 64 (1 + 2*266)),
    (const 64 (-(2**20))) <=s u_256_266, u_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_266, v_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_266, r_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_266, s_256_266 <=s (const 64 ((2**20))),
    u_256_266 + v_256_266 <=s (const 64 (2**20)),
    u_256_266 - v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 + v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 - v_256_266 <=s (const 64 (2**20)),
    r_256_266 + s_256_266 <=s (const 64 (2**20)),
    r_256_266 - s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 + s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 - s_256_266 <=s (const 64 (2**20)),
    u_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_256_266 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_265_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_9,
sint64 neg_g_236_low60_20_low20_9,
sint64 neg_f_236_low60_20_low20_10,
sint64 neg_g_236_low60_20_low20_10,
sint64 u_256_265,
sint64 v_256_265,
sint64 r_256_265,
sint64 s_256_265,
sint64 u_256_266,
sint64 v_256_266,
sint64 r_256_266,
sint64 s_256_266,
bit ne
)={
    u_256_265 * neg_f_236_low60_20_low20_0 + v_256_265 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_9 * (-(2**20)),
    r_256_265 * neg_f_236_low60_20_low20_0 + s_256_265 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_9 * (-(2**20))
&&
    u_256_265 * neg_f_236_low60_20_low20_0 + v_256_265 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_9 * (const 64 (-(2**20))),
    r_256_265 * neg_f_236_low60_20_low20_0 + s_256_265 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_9 + u_256_265 * (const 64 (2**21)) + v_256_265 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_9 + r_256_265 * (const 64 (2**21)) + s_256_265 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_9,
    neg_f_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_9,
    neg_g_236_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 265)) <=s delta, delta <=s (const 64 (1 + 2*265)),
    (const 64 (-(2**20))) <=s u_256_265, u_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_265, v_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_265, r_256_265 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_265, s_256_265 <=s (const 64 ((2**20))),
    u_256_265 + v_256_265 <=s (const 64 (2**20)),
    u_256_265 - v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 + v_256_265 <=s (const 64 (2**20)),
    (const 64 0) - u_256_265 - v_256_265 <=s (const 64 (2**20)),
    r_256_265 + s_256_265 <=s (const 64 (2**20)),
    r_256_265 - s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 + s_256_265 <=s (const 64 (2**20)),
    (const 64 0) - r_256_265 - s_256_265 <=s (const 64 (2**20)),
    u_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_256_265 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_256_265 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise c
assume
neg_g_236_low60_20_low20_9 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_10 neg_g_236_low60_20_low20_9;
mov u_256_266 r_256_265;
mov v_256_266 s_256_265;

subs dc neg_g_236_low60_20_low20_10 neg_g_236_low60_20_low20_9 neg_f_236_low60_20_low20_9;
asr neg_g_236_low60_20_low20_10 neg_g_236_low60_20_low20_10 1;
subs dc r_256_266 r_256_265 u_256_265;
asr r_256_266 r_256_266 1;
subs dc s_256_266 s_256_265 v_256_265;
asr s_256_266 s_256_266 1;
assert
    true
&&
    neg_f_236_low60_20_low20_10 = neg_g_236_low60_20_low20_9,
    u_256_266 = r_256_265,
    v_256_266 = s_256_265,
    neg_g_236_low60_20_low20_10 * (const 64 2) = neg_g_236_low60_20_low20_9 - neg_f_236_low60_20_low20_9,
    r_256_266 * (const 64 2) = r_256_265 - u_256_265,
    s_256_266 * (const 64 2) = s_256_265 - v_256_265
;

assume
    neg_f_236_low60_20_low20_10 = neg_g_236_low60_20_low20_9,
    u_256_266 = r_256_265,
    v_256_266 = s_256_265,
    neg_g_236_low60_20_low20_10 * 2 = neg_g_236_low60_20_low20_9 - neg_f_236_low60_20_low20_9,
    r_256_266 * 2 = r_256_265 - u_256_265,
    s_256_266 * 2 = s_256_265 - v_256_265
&&
    true
;

{
    u_256_266 * neg_f_236_low60_20_low20_0 + v_256_266 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_266 * neg_f_236_low60_20_low20_0 + s_256_266 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_10 + u_256_266 * (const 64 (2**21)) + v_256_266 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_10 + r_256_266 * (const 64 (2**21)) + s_256_266 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_10,
    neg_f_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_10,
    neg_g_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 266)) <=s delta, delta <=s (const 64 (1 + 2*266)),
    (const 64 (-(2**20))) <=s u_256_266, u_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_266, v_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_266, r_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_266, s_256_266 <=s (const 64 ((2**20))),
    u_256_266 + v_256_266 <=s (const 64 (2**20)),
    u_256_266 - v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 + v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 - v_256_266 <=s (const 64 (2**20)),
    r_256_266 + s_256_266 <=s (const 64 (2**20)),
    r_256_266 - s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 + s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 - s_256_266 <=s (const 64 (2**20)),
    u_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_256_266 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_266_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_10,
sint64 neg_g_236_low60_20_low20_10,
sint64 neg_f_236_low60_20_low20_11,
sint64 neg_g_236_low60_20_low20_11,
sint64 u_256_266,
sint64 v_256_266,
sint64 r_256_266,
sint64 s_256_266,
sint64 u_256_267,
sint64 v_256_267,
sint64 r_256_267,
sint64 s_256_267,
bit ne
)={
    u_256_266 * neg_f_236_low60_20_low20_0 + v_256_266 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_10 * (-(2**20)),
    r_256_266 * neg_f_236_low60_20_low20_0 + s_256_266 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_10 * (-(2**20))
&&
    u_256_266 * neg_f_236_low60_20_low20_0 + v_256_266 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_10 * (const 64 (-(2**20))),
    r_256_266 * neg_f_236_low60_20_low20_0 + s_256_266 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_10 + u_256_266 * (const 64 (2**21)) + v_256_266 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_10 + r_256_266 * (const 64 (2**21)) + s_256_266 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_10,
    neg_f_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_10,
    neg_g_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 266)) <=s delta, delta <=s (const 64 (1 + 2*266)),
    (const 64 (-(2**20))) <=s u_256_266, u_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_266, v_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_266, r_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_266, s_256_266 <=s (const 64 ((2**20))),
    u_256_266 + v_256_266 <=s (const 64 (2**20)),
    u_256_266 - v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 + v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 - v_256_266 <=s (const 64 (2**20)),
    r_256_266 + s_256_266 <=s (const 64 (2**20)),
    r_256_266 - s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 + s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 - s_256_266 <=s (const 64 (2**20)),
    u_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_256_266 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise a
assume
neg_g_236_low60_20_low20_10 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_11 neg_f_236_low60_20_low20_10;
mov u_256_267 u_256_266;
mov v_256_267 v_256_266;

asr neg_g_236_low60_20_low20_11 neg_g_236_low60_20_low20_10 1;
asr r_256_267 r_256_266 1;
asr s_256_267 s_256_266 1;
assert
    true
&&
    neg_f_236_low60_20_low20_11 = neg_f_236_low60_20_low20_10,
    u_256_267 = u_256_266,
    v_256_267 = v_256_266,
    neg_g_236_low60_20_low20_11 * (const 64 2) = neg_g_236_low60_20_low20_10,
    r_256_267 * (const 64 2) = r_256_266,
    s_256_267 * (const 64 2) = s_256_266
;

assume
    neg_f_236_low60_20_low20_11 = neg_f_236_low60_20_low20_10,
    u_256_267 = u_256_266,
    v_256_267 = v_256_266,
    neg_g_236_low60_20_low20_11 * 2 = neg_g_236_low60_20_low20_10,
    r_256_267 * 2 = r_256_266,
    s_256_267 * 2 = s_256_266
&&
    true
;

{
    u_256_267 * neg_f_236_low60_20_low20_0 + v_256_267 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_267 * neg_f_236_low60_20_low20_0 + s_256_267 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_11 + u_256_267 * (const 64 (2**21)) + v_256_267 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_11 + r_256_267 * (const 64 (2**21)) + s_256_267 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_11,
    neg_f_236_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_11,
    neg_g_236_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
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

proc divstep_266_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_10,
sint64 neg_g_236_low60_20_low20_10,
sint64 neg_f_236_low60_20_low20_11,
sint64 neg_g_236_low60_20_low20_11,
sint64 u_256_266,
sint64 v_256_266,
sint64 r_256_266,
sint64 s_256_266,
sint64 u_256_267,
sint64 v_256_267,
sint64 r_256_267,
sint64 s_256_267,
bit ne
)={
    u_256_266 * neg_f_236_low60_20_low20_0 + v_256_266 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_10 * (-(2**20)),
    r_256_266 * neg_f_236_low60_20_low20_0 + s_256_266 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_10 * (-(2**20))
&&
    u_256_266 * neg_f_236_low60_20_low20_0 + v_256_266 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_10 * (const 64 (-(2**20))),
    r_256_266 * neg_f_236_low60_20_low20_0 + s_256_266 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_10 + u_256_266 * (const 64 (2**21)) + v_256_266 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_10 + r_256_266 * (const 64 (2**21)) + s_256_266 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_10,
    neg_f_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_10,
    neg_g_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 266)) <=s delta, delta <=s (const 64 (1 + 2*266)),
    (const 64 (-(2**20))) <=s u_256_266, u_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_266, v_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_266, r_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_266, s_256_266 <=s (const 64 ((2**20))),
    u_256_266 + v_256_266 <=s (const 64 (2**20)),
    u_256_266 - v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 + v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 - v_256_266 <=s (const 64 (2**20)),
    r_256_266 + s_256_266 <=s (const 64 (2**20)),
    r_256_266 - s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 + s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 - s_256_266 <=s (const 64 (2**20)),
    u_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_256_266 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise b
assume
neg_g_236_low60_20_low20_10 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_11 neg_f_236_low60_20_low20_10;
mov u_256_267 u_256_266;
mov v_256_267 v_256_266;

add neg_g_236_low60_20_low20_11 neg_g_236_low60_20_low20_10 neg_f_236_low60_20_low20_10;
asr neg_g_236_low60_20_low20_11 neg_g_236_low60_20_low20_11 1;
add r_256_267 r_256_266 u_256_266;
asr r_256_267 r_256_267 1;
add s_256_267 s_256_266 v_256_266;
asr s_256_267 s_256_267 1;
assert
    true
&&
    neg_f_236_low60_20_low20_11 = neg_f_236_low60_20_low20_10,
    u_256_267 = u_256_266,
    v_256_267 = v_256_266,
    neg_g_236_low60_20_low20_11 * (const 64 2) = neg_g_236_low60_20_low20_10 + neg_f_236_low60_20_low20_10,
    r_256_267 * (const 64 2) = r_256_266 + u_256_266,
    s_256_267 * (const 64 2) = s_256_266 + v_256_266
;

assume
    neg_f_236_low60_20_low20_11 = neg_f_236_low60_20_low20_10,
    u_256_267 = u_256_266,
    v_256_267 = v_256_266,
    neg_g_236_low60_20_low20_11 * 2 = neg_g_236_low60_20_low20_10 + neg_f_236_low60_20_low20_10,
    r_256_267 * 2 = r_256_266 + u_256_266,
    s_256_267 * 2 = s_256_266 + v_256_266
&&
    true
;

{
    u_256_267 * neg_f_236_low60_20_low20_0 + v_256_267 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_267 * neg_f_236_low60_20_low20_0 + s_256_267 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_11 + u_256_267 * (const 64 (2**21)) + v_256_267 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_11 + r_256_267 * (const 64 (2**21)) + s_256_267 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_11,
    neg_f_236_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_11,
    neg_g_236_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
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

proc divstep_266_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_10,
sint64 neg_g_236_low60_20_low20_10,
sint64 neg_f_236_low60_20_low20_11,
sint64 neg_g_236_low60_20_low20_11,
sint64 u_256_266,
sint64 v_256_266,
sint64 r_256_266,
sint64 s_256_266,
sint64 u_256_267,
sint64 v_256_267,
sint64 r_256_267,
sint64 s_256_267,
bit ne
)={
    u_256_266 * neg_f_236_low60_20_low20_0 + v_256_266 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_10 * (-(2**20)),
    r_256_266 * neg_f_236_low60_20_low20_0 + s_256_266 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_10 * (-(2**20))
&&
    u_256_266 * neg_f_236_low60_20_low20_0 + v_256_266 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_10 * (const 64 (-(2**20))),
    r_256_266 * neg_f_236_low60_20_low20_0 + s_256_266 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_10 + u_256_266 * (const 64 (2**21)) + v_256_266 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_10 + r_256_266 * (const 64 (2**21)) + s_256_266 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_10,
    neg_f_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_10,
    neg_g_236_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 266)) <=s delta, delta <=s (const 64 (1 + 2*266)),
    (const 64 (-(2**20))) <=s u_256_266, u_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_266, v_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_266, r_256_266 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_266, s_256_266 <=s (const 64 ((2**20))),
    u_256_266 + v_256_266 <=s (const 64 (2**20)),
    u_256_266 - v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 + v_256_266 <=s (const 64 (2**20)),
    (const 64 0) - u_256_266 - v_256_266 <=s (const 64 (2**20)),
    r_256_266 + s_256_266 <=s (const 64 (2**20)),
    r_256_266 - s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 + s_256_266 <=s (const 64 (2**20)),
    (const 64 0) - r_256_266 - s_256_266 <=s (const 64 (2**20)),
    u_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_256_266 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_256_266 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise c
assume
neg_g_236_low60_20_low20_10 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_11 neg_g_236_low60_20_low20_10;
mov u_256_267 r_256_266;
mov v_256_267 s_256_266;

subs dc neg_g_236_low60_20_low20_11 neg_g_236_low60_20_low20_10 neg_f_236_low60_20_low20_10;
asr neg_g_236_low60_20_low20_11 neg_g_236_low60_20_low20_11 1;
subs dc r_256_267 r_256_266 u_256_266;
asr r_256_267 r_256_267 1;
subs dc s_256_267 s_256_266 v_256_266;
asr s_256_267 s_256_267 1;
assert
    true
&&
    neg_f_236_low60_20_low20_11 = neg_g_236_low60_20_low20_10,
    u_256_267 = r_256_266,
    v_256_267 = s_256_266,
    neg_g_236_low60_20_low20_11 * (const 64 2) = neg_g_236_low60_20_low20_10 - neg_f_236_low60_20_low20_10,
    r_256_267 * (const 64 2) = r_256_266 - u_256_266,
    s_256_267 * (const 64 2) = s_256_266 - v_256_266
;

assume
    neg_f_236_low60_20_low20_11 = neg_g_236_low60_20_low20_10,
    u_256_267 = r_256_266,
    v_256_267 = s_256_266,
    neg_g_236_low60_20_low20_11 * 2 = neg_g_236_low60_20_low20_10 - neg_f_236_low60_20_low20_10,
    r_256_267 * 2 = r_256_266 - u_256_266,
    s_256_267 * 2 = s_256_266 - v_256_266
&&
    true
;

{
    u_256_267 * neg_f_236_low60_20_low20_0 + v_256_267 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_267 * neg_f_236_low60_20_low20_0 + s_256_267 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_11 + u_256_267 * (const 64 (2**21)) + v_256_267 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_11 + r_256_267 * (const 64 (2**21)) + s_256_267 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_11,
    neg_f_236_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_11,
    neg_g_236_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
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
// step31

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

proc divstep_267_b (
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
// step31

// premise b
assume
neg_g_236_low60_20_low20_11 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_12 neg_f_236_low60_20_low20_11;
mov u_256_268 u_256_267;
mov v_256_268 v_256_267;

add neg_g_236_low60_20_low20_12 neg_g_236_low60_20_low20_11 neg_f_236_low60_20_low20_11;
asr neg_g_236_low60_20_low20_12 neg_g_236_low60_20_low20_12 1;
add r_256_268 r_256_267 u_256_267;
asr r_256_268 r_256_268 1;
add s_256_268 s_256_267 v_256_267;
asr s_256_268 s_256_268 1;
assert
    true
&&
    neg_f_236_low60_20_low20_12 = neg_f_236_low60_20_low20_11,
    u_256_268 = u_256_267,
    v_256_268 = v_256_267,
    neg_g_236_low60_20_low20_12 * (const 64 2) = neg_g_236_low60_20_low20_11 + neg_f_236_low60_20_low20_11,
    r_256_268 * (const 64 2) = r_256_267 + u_256_267,
    s_256_268 * (const 64 2) = s_256_267 + v_256_267
;

assume
    neg_f_236_low60_20_low20_12 = neg_f_236_low60_20_low20_11,
    u_256_268 = u_256_267,
    v_256_268 = v_256_267,
    neg_g_236_low60_20_low20_12 * 2 = neg_g_236_low60_20_low20_11 + neg_f_236_low60_20_low20_11,
    r_256_268 * 2 = r_256_267 + u_256_267,
    s_256_268 * 2 = s_256_267 + v_256_267
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

proc divstep_267_c (
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
// step31

// premise c
assume
neg_g_236_low60_20_low20_11 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_12 neg_g_236_low60_20_low20_11;
mov u_256_268 r_256_267;
mov v_256_268 s_256_267;

subs dc neg_g_236_low60_20_low20_12 neg_g_236_low60_20_low20_11 neg_f_236_low60_20_low20_11;
asr neg_g_236_low60_20_low20_12 neg_g_236_low60_20_low20_12 1;
subs dc r_256_268 r_256_267 u_256_267;
asr r_256_268 r_256_268 1;
subs dc s_256_268 s_256_267 v_256_267;
asr s_256_268 s_256_268 1;
assert
    true
&&
    neg_f_236_low60_20_low20_12 = neg_g_236_low60_20_low20_11,
    u_256_268 = r_256_267,
    v_256_268 = s_256_267,
    neg_g_236_low60_20_low20_12 * (const 64 2) = neg_g_236_low60_20_low20_11 - neg_f_236_low60_20_low20_11,
    r_256_268 * (const 64 2) = r_256_267 - u_256_267,
    s_256_268 * (const 64 2) = s_256_267 - v_256_267
;

assume
    neg_f_236_low60_20_low20_12 = neg_g_236_low60_20_low20_11,
    u_256_268 = r_256_267,
    v_256_268 = s_256_267,
    neg_g_236_low60_20_low20_12 * 2 = neg_g_236_low60_20_low20_11 - neg_f_236_low60_20_low20_11,
    r_256_268 * 2 = r_256_267 - u_256_267,
    s_256_268 * 2 = s_256_267 - v_256_267
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

proc divstep_268_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_12,
sint64 neg_g_236_low60_20_low20_12,
sint64 neg_f_236_low60_20_low20_13,
sint64 neg_g_236_low60_20_low20_13,
sint64 u_256_268,
sint64 v_256_268,
sint64 r_256_268,
sint64 s_256_268,
sint64 u_256_269,
sint64 v_256_269,
sint64 r_256_269,
sint64 s_256_269,
bit ne
)={
    u_256_268 * neg_f_236_low60_20_low20_0 + v_256_268 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_12 * (-(2**20)),
    r_256_268 * neg_f_236_low60_20_low20_0 + s_256_268 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_12 * (-(2**20))
&&
    u_256_268 * neg_f_236_low60_20_low20_0 + v_256_268 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_12 * (const 64 (-(2**20))),
    r_256_268 * neg_f_236_low60_20_low20_0 + s_256_268 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_12 + u_256_268 * (const 64 (2**21)) + v_256_268 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_12 + r_256_268 * (const 64 (2**21)) + s_256_268 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_12,
    neg_f_236_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_12,
    neg_g_236_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
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



// divsteps
// step32

// premise a
assume
neg_g_236_low60_20_low20_12 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_13 neg_f_236_low60_20_low20_12;
mov u_256_269 u_256_268;
mov v_256_269 v_256_268;

asr neg_g_236_low60_20_low20_13 neg_g_236_low60_20_low20_12 1;
asr r_256_269 r_256_268 1;
asr s_256_269 s_256_268 1;
assert
    true
&&
    neg_f_236_low60_20_low20_13 = neg_f_236_low60_20_low20_12,
    u_256_269 = u_256_268,
    v_256_269 = v_256_268,
    neg_g_236_low60_20_low20_13 * (const 64 2) = neg_g_236_low60_20_low20_12,
    r_256_269 * (const 64 2) = r_256_268,
    s_256_269 * (const 64 2) = s_256_268
;

assume
    neg_f_236_low60_20_low20_13 = neg_f_236_low60_20_low20_12,
    u_256_269 = u_256_268,
    v_256_269 = v_256_268,
    neg_g_236_low60_20_low20_13 * 2 = neg_g_236_low60_20_low20_12,
    r_256_269 * 2 = r_256_268,
    s_256_269 * 2 = s_256_268
&&
    true
;

{
    u_256_269 * neg_f_236_low60_20_low20_0 + v_256_269 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_269 * neg_f_236_low60_20_low20_0 + s_256_269 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_13 + u_256_269 * (const 64 (2**21)) + v_256_269 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_13 + r_256_269 * (const 64 (2**21)) + s_256_269 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_13,
    neg_f_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_13,
    neg_g_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 269)) <=s delta, delta <=s (const 64 (1 + 2*269)),
    (const 64 (-(2**20))) <=s u_256_269, u_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_269, v_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_269, r_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_269, s_256_269 <=s (const 64 ((2**20))),
    u_256_269 + v_256_269 <=s (const 64 (2**20)),
    u_256_269 - v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 + v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 - v_256_269 <=s (const 64 (2**20)),
    r_256_269 + s_256_269 <=s (const 64 (2**20)),
    r_256_269 - s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 + s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 - s_256_269 <=s (const 64 (2**20)),
    u_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_256_269 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_268_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_12,
sint64 neg_g_236_low60_20_low20_12,
sint64 neg_f_236_low60_20_low20_13,
sint64 neg_g_236_low60_20_low20_13,
sint64 u_256_268,
sint64 v_256_268,
sint64 r_256_268,
sint64 s_256_268,
sint64 u_256_269,
sint64 v_256_269,
sint64 r_256_269,
sint64 s_256_269,
bit ne
)={
    u_256_268 * neg_f_236_low60_20_low20_0 + v_256_268 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_12 * (-(2**20)),
    r_256_268 * neg_f_236_low60_20_low20_0 + s_256_268 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_12 * (-(2**20))
&&
    u_256_268 * neg_f_236_low60_20_low20_0 + v_256_268 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_12 * (const 64 (-(2**20))),
    r_256_268 * neg_f_236_low60_20_low20_0 + s_256_268 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_12 + u_256_268 * (const 64 (2**21)) + v_256_268 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_12 + r_256_268 * (const 64 (2**21)) + s_256_268 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_12,
    neg_f_236_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_12,
    neg_g_236_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
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



// divsteps
// step32

// premise b
assume
neg_g_236_low60_20_low20_12 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_13 neg_f_236_low60_20_low20_12;
mov u_256_269 u_256_268;
mov v_256_269 v_256_268;

add neg_g_236_low60_20_low20_13 neg_g_236_low60_20_low20_12 neg_f_236_low60_20_low20_12;
asr neg_g_236_low60_20_low20_13 neg_g_236_low60_20_low20_13 1;
add r_256_269 r_256_268 u_256_268;
asr r_256_269 r_256_269 1;
add s_256_269 s_256_268 v_256_268;
asr s_256_269 s_256_269 1;
assert
    true
&&
    neg_f_236_low60_20_low20_13 = neg_f_236_low60_20_low20_12,
    u_256_269 = u_256_268,
    v_256_269 = v_256_268,
    neg_g_236_low60_20_low20_13 * (const 64 2) = neg_g_236_low60_20_low20_12 + neg_f_236_low60_20_low20_12,
    r_256_269 * (const 64 2) = r_256_268 + u_256_268,
    s_256_269 * (const 64 2) = s_256_268 + v_256_268
;

assume
    neg_f_236_low60_20_low20_13 = neg_f_236_low60_20_low20_12,
    u_256_269 = u_256_268,
    v_256_269 = v_256_268,
    neg_g_236_low60_20_low20_13 * 2 = neg_g_236_low60_20_low20_12 + neg_f_236_low60_20_low20_12,
    r_256_269 * 2 = r_256_268 + u_256_268,
    s_256_269 * 2 = s_256_268 + v_256_268
&&
    true
;

{
    u_256_269 * neg_f_236_low60_20_low20_0 + v_256_269 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_269 * neg_f_236_low60_20_low20_0 + s_256_269 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_13 + u_256_269 * (const 64 (2**21)) + v_256_269 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_13 + r_256_269 * (const 64 (2**21)) + s_256_269 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_13,
    neg_f_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_13,
    neg_g_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 269)) <=s delta, delta <=s (const 64 (1 + 2*269)),
    (const 64 (-(2**20))) <=s u_256_269, u_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_269, v_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_269, r_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_269, s_256_269 <=s (const 64 ((2**20))),
    u_256_269 + v_256_269 <=s (const 64 (2**20)),
    u_256_269 - v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 + v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 - v_256_269 <=s (const 64 (2**20)),
    r_256_269 + s_256_269 <=s (const 64 (2**20)),
    r_256_269 - s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 + s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 - s_256_269 <=s (const 64 (2**20)),
    u_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_256_269 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_268_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_12,
sint64 neg_g_236_low60_20_low20_12,
sint64 neg_f_236_low60_20_low20_13,
sint64 neg_g_236_low60_20_low20_13,
sint64 u_256_268,
sint64 v_256_268,
sint64 r_256_268,
sint64 s_256_268,
sint64 u_256_269,
sint64 v_256_269,
sint64 r_256_269,
sint64 s_256_269,
bit ne
)={
    u_256_268 * neg_f_236_low60_20_low20_0 + v_256_268 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_12 * (-(2**20)),
    r_256_268 * neg_f_236_low60_20_low20_0 + s_256_268 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_12 * (-(2**20))
&&
    u_256_268 * neg_f_236_low60_20_low20_0 + v_256_268 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_12 * (const 64 (-(2**20))),
    r_256_268 * neg_f_236_low60_20_low20_0 + s_256_268 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_12 + u_256_268 * (const 64 (2**21)) + v_256_268 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_12 + r_256_268 * (const 64 (2**21)) + s_256_268 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_12,
    neg_f_236_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_12,
    neg_g_236_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
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



// divsteps
// step32

// premise c
assume
neg_g_236_low60_20_low20_12 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_13 neg_g_236_low60_20_low20_12;
mov u_256_269 r_256_268;
mov v_256_269 s_256_268;

subs dc neg_g_236_low60_20_low20_13 neg_g_236_low60_20_low20_12 neg_f_236_low60_20_low20_12;
asr neg_g_236_low60_20_low20_13 neg_g_236_low60_20_low20_13 1;
subs dc r_256_269 r_256_268 u_256_268;
asr r_256_269 r_256_269 1;
subs dc s_256_269 s_256_268 v_256_268;
asr s_256_269 s_256_269 1;
assert
    true
&&
    neg_f_236_low60_20_low20_13 = neg_g_236_low60_20_low20_12,
    u_256_269 = r_256_268,
    v_256_269 = s_256_268,
    neg_g_236_low60_20_low20_13 * (const 64 2) = neg_g_236_low60_20_low20_12 - neg_f_236_low60_20_low20_12,
    r_256_269 * (const 64 2) = r_256_268 - u_256_268,
    s_256_269 * (const 64 2) = s_256_268 - v_256_268
;

assume
    neg_f_236_low60_20_low20_13 = neg_g_236_low60_20_low20_12,
    u_256_269 = r_256_268,
    v_256_269 = s_256_268,
    neg_g_236_low60_20_low20_13 * 2 = neg_g_236_low60_20_low20_12 - neg_f_236_low60_20_low20_12,
    r_256_269 * 2 = r_256_268 - u_256_268,
    s_256_269 * 2 = s_256_268 - v_256_268
&&
    true
;

{
    u_256_269 * neg_f_236_low60_20_low20_0 + v_256_269 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_269 * neg_f_236_low60_20_low20_0 + s_256_269 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_13 + u_256_269 * (const 64 (2**21)) + v_256_269 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_13 + r_256_269 * (const 64 (2**21)) + s_256_269 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_13,
    neg_f_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_13,
    neg_g_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 269)) <=s delta, delta <=s (const 64 (1 + 2*269)),
    (const 64 (-(2**20))) <=s u_256_269, u_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_269, v_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_269, r_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_269, s_256_269 <=s (const 64 ((2**20))),
    u_256_269 + v_256_269 <=s (const 64 (2**20)),
    u_256_269 - v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 + v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 - v_256_269 <=s (const 64 (2**20)),
    r_256_269 + s_256_269 <=s (const 64 (2**20)),
    r_256_269 - s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 + s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 - s_256_269 <=s (const 64 (2**20)),
    u_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_256_269 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_269_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_13,
sint64 neg_g_236_low60_20_low20_13,
sint64 neg_f_236_low60_20_low20_14,
sint64 neg_g_236_low60_20_low20_14,
sint64 u_256_269,
sint64 v_256_269,
sint64 r_256_269,
sint64 s_256_269,
sint64 u_256_270,
sint64 v_256_270,
sint64 r_256_270,
sint64 s_256_270,
bit ne
)={
    u_256_269 * neg_f_236_low60_20_low20_0 + v_256_269 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_13 * (-(2**20)),
    r_256_269 * neg_f_236_low60_20_low20_0 + s_256_269 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_13 * (-(2**20))
&&
    u_256_269 * neg_f_236_low60_20_low20_0 + v_256_269 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_13 * (const 64 (-(2**20))),
    r_256_269 * neg_f_236_low60_20_low20_0 + s_256_269 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_13 + u_256_269 * (const 64 (2**21)) + v_256_269 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_13 + r_256_269 * (const 64 (2**21)) + s_256_269 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_13,
    neg_f_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_13,
    neg_g_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 269)) <=s delta, delta <=s (const 64 (1 + 2*269)),
    (const 64 (-(2**20))) <=s u_256_269, u_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_269, v_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_269, r_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_269, s_256_269 <=s (const 64 ((2**20))),
    u_256_269 + v_256_269 <=s (const 64 (2**20)),
    u_256_269 - v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 + v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 - v_256_269 <=s (const 64 (2**20)),
    r_256_269 + s_256_269 <=s (const 64 (2**20)),
    r_256_269 - s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 + s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 - s_256_269 <=s (const 64 (2**20)),
    u_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_256_269 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise a
assume
neg_g_236_low60_20_low20_13 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_14 neg_f_236_low60_20_low20_13;
mov u_256_270 u_256_269;
mov v_256_270 v_256_269;

asr neg_g_236_low60_20_low20_14 neg_g_236_low60_20_low20_13 1;
asr r_256_270 r_256_269 1;
asr s_256_270 s_256_269 1;
assert
    true
&&
    neg_f_236_low60_20_low20_14 = neg_f_236_low60_20_low20_13,
    u_256_270 = u_256_269,
    v_256_270 = v_256_269,
    neg_g_236_low60_20_low20_14 * (const 64 2) = neg_g_236_low60_20_low20_13,
    r_256_270 * (const 64 2) = r_256_269,
    s_256_270 * (const 64 2) = s_256_269
;

assume
    neg_f_236_low60_20_low20_14 = neg_f_236_low60_20_low20_13,
    u_256_270 = u_256_269,
    v_256_270 = v_256_269,
    neg_g_236_low60_20_low20_14 * 2 = neg_g_236_low60_20_low20_13,
    r_256_270 * 2 = r_256_269,
    s_256_270 * 2 = s_256_269
&&
    true
;

{
    u_256_270 * neg_f_236_low60_20_low20_0 + v_256_270 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_270 * neg_f_236_low60_20_low20_0 + s_256_270 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_14 + u_256_270 * (const 64 (2**21)) + v_256_270 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_14 + r_256_270 * (const 64 (2**21)) + s_256_270 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_14,
    neg_f_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_14,
    neg_g_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 270)) <=s delta, delta <=s (const 64 (1 + 2*270)),
    (const 64 (-(2**20))) <=s u_256_270, u_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_270, v_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_270, r_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_270, s_256_270 <=s (const 64 ((2**20))),
    u_256_270 + v_256_270 <=s (const 64 (2**20)),
    u_256_270 - v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 + v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 - v_256_270 <=s (const 64 (2**20)),
    r_256_270 + s_256_270 <=s (const 64 (2**20)),
    r_256_270 - s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 + s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 - s_256_270 <=s (const 64 (2**20)),
    u_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_256_270 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_269_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_13,
sint64 neg_g_236_low60_20_low20_13,
sint64 neg_f_236_low60_20_low20_14,
sint64 neg_g_236_low60_20_low20_14,
sint64 u_256_269,
sint64 v_256_269,
sint64 r_256_269,
sint64 s_256_269,
sint64 u_256_270,
sint64 v_256_270,
sint64 r_256_270,
sint64 s_256_270,
bit ne
)={
    u_256_269 * neg_f_236_low60_20_low20_0 + v_256_269 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_13 * (-(2**20)),
    r_256_269 * neg_f_236_low60_20_low20_0 + s_256_269 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_13 * (-(2**20))
&&
    u_256_269 * neg_f_236_low60_20_low20_0 + v_256_269 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_13 * (const 64 (-(2**20))),
    r_256_269 * neg_f_236_low60_20_low20_0 + s_256_269 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_13 + u_256_269 * (const 64 (2**21)) + v_256_269 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_13 + r_256_269 * (const 64 (2**21)) + s_256_269 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_13,
    neg_f_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_13,
    neg_g_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 269)) <=s delta, delta <=s (const 64 (1 + 2*269)),
    (const 64 (-(2**20))) <=s u_256_269, u_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_269, v_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_269, r_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_269, s_256_269 <=s (const 64 ((2**20))),
    u_256_269 + v_256_269 <=s (const 64 (2**20)),
    u_256_269 - v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 + v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 - v_256_269 <=s (const 64 (2**20)),
    r_256_269 + s_256_269 <=s (const 64 (2**20)),
    r_256_269 - s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 + s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 - s_256_269 <=s (const 64 (2**20)),
    u_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_256_269 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise b
assume
neg_g_236_low60_20_low20_13 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_14 neg_f_236_low60_20_low20_13;
mov u_256_270 u_256_269;
mov v_256_270 v_256_269;

add neg_g_236_low60_20_low20_14 neg_g_236_low60_20_low20_13 neg_f_236_low60_20_low20_13;
asr neg_g_236_low60_20_low20_14 neg_g_236_low60_20_low20_14 1;
add r_256_270 r_256_269 u_256_269;
asr r_256_270 r_256_270 1;
add s_256_270 s_256_269 v_256_269;
asr s_256_270 s_256_270 1;
assert
    true
&&
    neg_f_236_low60_20_low20_14 = neg_f_236_low60_20_low20_13,
    u_256_270 = u_256_269,
    v_256_270 = v_256_269,
    neg_g_236_low60_20_low20_14 * (const 64 2) = neg_g_236_low60_20_low20_13 + neg_f_236_low60_20_low20_13,
    r_256_270 * (const 64 2) = r_256_269 + u_256_269,
    s_256_270 * (const 64 2) = s_256_269 + v_256_269
;

assume
    neg_f_236_low60_20_low20_14 = neg_f_236_low60_20_low20_13,
    u_256_270 = u_256_269,
    v_256_270 = v_256_269,
    neg_g_236_low60_20_low20_14 * 2 = neg_g_236_low60_20_low20_13 + neg_f_236_low60_20_low20_13,
    r_256_270 * 2 = r_256_269 + u_256_269,
    s_256_270 * 2 = s_256_269 + v_256_269
&&
    true
;

{
    u_256_270 * neg_f_236_low60_20_low20_0 + v_256_270 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_270 * neg_f_236_low60_20_low20_0 + s_256_270 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_14 + u_256_270 * (const 64 (2**21)) + v_256_270 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_14 + r_256_270 * (const 64 (2**21)) + s_256_270 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_14,
    neg_f_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_14,
    neg_g_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 270)) <=s delta, delta <=s (const 64 (1 + 2*270)),
    (const 64 (-(2**20))) <=s u_256_270, u_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_270, v_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_270, r_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_270, s_256_270 <=s (const 64 ((2**20))),
    u_256_270 + v_256_270 <=s (const 64 (2**20)),
    u_256_270 - v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 + v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 - v_256_270 <=s (const 64 (2**20)),
    r_256_270 + s_256_270 <=s (const 64 (2**20)),
    r_256_270 - s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 + s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 - s_256_270 <=s (const 64 (2**20)),
    u_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_256_270 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_269_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_13,
sint64 neg_g_236_low60_20_low20_13,
sint64 neg_f_236_low60_20_low20_14,
sint64 neg_g_236_low60_20_low20_14,
sint64 u_256_269,
sint64 v_256_269,
sint64 r_256_269,
sint64 s_256_269,
sint64 u_256_270,
sint64 v_256_270,
sint64 r_256_270,
sint64 s_256_270,
bit ne
)={
    u_256_269 * neg_f_236_low60_20_low20_0 + v_256_269 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_13 * (-(2**20)),
    r_256_269 * neg_f_236_low60_20_low20_0 + s_256_269 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_13 * (-(2**20))
&&
    u_256_269 * neg_f_236_low60_20_low20_0 + v_256_269 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_13 * (const 64 (-(2**20))),
    r_256_269 * neg_f_236_low60_20_low20_0 + s_256_269 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_13 + u_256_269 * (const 64 (2**21)) + v_256_269 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_13 + r_256_269 * (const 64 (2**21)) + s_256_269 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_13,
    neg_f_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_13,
    neg_g_236_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 269)) <=s delta, delta <=s (const 64 (1 + 2*269)),
    (const 64 (-(2**20))) <=s u_256_269, u_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_269, v_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_269, r_256_269 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_269, s_256_269 <=s (const 64 ((2**20))),
    u_256_269 + v_256_269 <=s (const 64 (2**20)),
    u_256_269 - v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 + v_256_269 <=s (const 64 (2**20)),
    (const 64 0) - u_256_269 - v_256_269 <=s (const 64 (2**20)),
    r_256_269 + s_256_269 <=s (const 64 (2**20)),
    r_256_269 - s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 + s_256_269 <=s (const 64 (2**20)),
    (const 64 0) - r_256_269 - s_256_269 <=s (const 64 (2**20)),
    u_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_256_269 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_256_269 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise c
assume
neg_g_236_low60_20_low20_13 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_14 neg_g_236_low60_20_low20_13;
mov u_256_270 r_256_269;
mov v_256_270 s_256_269;

subs dc neg_g_236_low60_20_low20_14 neg_g_236_low60_20_low20_13 neg_f_236_low60_20_low20_13;
asr neg_g_236_low60_20_low20_14 neg_g_236_low60_20_low20_14 1;
subs dc r_256_270 r_256_269 u_256_269;
asr r_256_270 r_256_270 1;
subs dc s_256_270 s_256_269 v_256_269;
asr s_256_270 s_256_270 1;
assert
    true
&&
    neg_f_236_low60_20_low20_14 = neg_g_236_low60_20_low20_13,
    u_256_270 = r_256_269,
    v_256_270 = s_256_269,
    neg_g_236_low60_20_low20_14 * (const 64 2) = neg_g_236_low60_20_low20_13 - neg_f_236_low60_20_low20_13,
    r_256_270 * (const 64 2) = r_256_269 - u_256_269,
    s_256_270 * (const 64 2) = s_256_269 - v_256_269
;

assume
    neg_f_236_low60_20_low20_14 = neg_g_236_low60_20_low20_13,
    u_256_270 = r_256_269,
    v_256_270 = s_256_269,
    neg_g_236_low60_20_low20_14 * 2 = neg_g_236_low60_20_low20_13 - neg_f_236_low60_20_low20_13,
    r_256_270 * 2 = r_256_269 - u_256_269,
    s_256_270 * 2 = s_256_269 - v_256_269
&&
    true
;

{
    u_256_270 * neg_f_236_low60_20_low20_0 + v_256_270 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_270 * neg_f_236_low60_20_low20_0 + s_256_270 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_14 + u_256_270 * (const 64 (2**21)) + v_256_270 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_14 + r_256_270 * (const 64 (2**21)) + s_256_270 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_14,
    neg_f_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_14,
    neg_g_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 270)) <=s delta, delta <=s (const 64 (1 + 2*270)),
    (const 64 (-(2**20))) <=s u_256_270, u_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_270, v_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_270, r_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_270, s_256_270 <=s (const 64 ((2**20))),
    u_256_270 + v_256_270 <=s (const 64 (2**20)),
    u_256_270 - v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 + v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 - v_256_270 <=s (const 64 (2**20)),
    r_256_270 + s_256_270 <=s (const 64 (2**20)),
    r_256_270 - s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 + s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 - s_256_270 <=s (const 64 (2**20)),
    u_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_256_270 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_270_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_14,
sint64 neg_g_236_low60_20_low20_14,
sint64 neg_f_236_low60_20_low20_15,
sint64 neg_g_236_low60_20_low20_15,
sint64 u_256_270,
sint64 v_256_270,
sint64 r_256_270,
sint64 s_256_270,
sint64 u_256_271,
sint64 v_256_271,
sint64 r_256_271,
sint64 s_256_271,
bit ne
)={
    u_256_270 * neg_f_236_low60_20_low20_0 + v_256_270 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_14 * (-(2**20)),
    r_256_270 * neg_f_236_low60_20_low20_0 + s_256_270 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_14 * (-(2**20))
&&
    u_256_270 * neg_f_236_low60_20_low20_0 + v_256_270 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_14 * (const 64 (-(2**20))),
    r_256_270 * neg_f_236_low60_20_low20_0 + s_256_270 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_14 + u_256_270 * (const 64 (2**21)) + v_256_270 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_14 + r_256_270 * (const 64 (2**21)) + s_256_270 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_14,
    neg_f_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_14,
    neg_g_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 270)) <=s delta, delta <=s (const 64 (1 + 2*270)),
    (const 64 (-(2**20))) <=s u_256_270, u_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_270, v_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_270, r_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_270, s_256_270 <=s (const 64 ((2**20))),
    u_256_270 + v_256_270 <=s (const 64 (2**20)),
    u_256_270 - v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 + v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 - v_256_270 <=s (const 64 (2**20)),
    r_256_270 + s_256_270 <=s (const 64 (2**20)),
    r_256_270 - s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 + s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 - s_256_270 <=s (const 64 (2**20)),
    u_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_256_270 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise a
assume
neg_g_236_low60_20_low20_14 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_15 neg_f_236_low60_20_low20_14;
mov u_256_271 u_256_270;
mov v_256_271 v_256_270;

asr neg_g_236_low60_20_low20_15 neg_g_236_low60_20_low20_14 1;
asr r_256_271 r_256_270 1;
asr s_256_271 s_256_270 1;
assert
    true
&&
    neg_f_236_low60_20_low20_15 = neg_f_236_low60_20_low20_14,
    u_256_271 = u_256_270,
    v_256_271 = v_256_270,
    neg_g_236_low60_20_low20_15 * (const 64 2) = neg_g_236_low60_20_low20_14,
    r_256_271 * (const 64 2) = r_256_270,
    s_256_271 * (const 64 2) = s_256_270
;

assume
    neg_f_236_low60_20_low20_15 = neg_f_236_low60_20_low20_14,
    u_256_271 = u_256_270,
    v_256_271 = v_256_270,
    neg_g_236_low60_20_low20_15 * 2 = neg_g_236_low60_20_low20_14,
    r_256_271 * 2 = r_256_270,
    s_256_271 * 2 = s_256_270
&&
    true
;

{
    u_256_271 * neg_f_236_low60_20_low20_0 + v_256_271 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_271 * neg_f_236_low60_20_low20_0 + s_256_271 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_15 + u_256_271 * (const 64 (2**21)) + v_256_271 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_15 + r_256_271 * (const 64 (2**21)) + s_256_271 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_15,
    neg_f_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_15,
    neg_g_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 271)) <=s delta, delta <=s (const 64 (1 + 2*271)),
    (const 64 (-(2**20))) <=s u_256_271, u_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_271, v_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_271, r_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_271, s_256_271 <=s (const 64 ((2**20))),
    u_256_271 + v_256_271 <=s (const 64 (2**20)),
    u_256_271 - v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 + v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 - v_256_271 <=s (const 64 (2**20)),
    r_256_271 + s_256_271 <=s (const 64 (2**20)),
    r_256_271 - s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 + s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 - s_256_271 <=s (const 64 (2**20)),
    u_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_256_271 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_270_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_14,
sint64 neg_g_236_low60_20_low20_14,
sint64 neg_f_236_low60_20_low20_15,
sint64 neg_g_236_low60_20_low20_15,
sint64 u_256_270,
sint64 v_256_270,
sint64 r_256_270,
sint64 s_256_270,
sint64 u_256_271,
sint64 v_256_271,
sint64 r_256_271,
sint64 s_256_271,
bit ne
)={
    u_256_270 * neg_f_236_low60_20_low20_0 + v_256_270 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_14 * (-(2**20)),
    r_256_270 * neg_f_236_low60_20_low20_0 + s_256_270 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_14 * (-(2**20))
&&
    u_256_270 * neg_f_236_low60_20_low20_0 + v_256_270 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_14 * (const 64 (-(2**20))),
    r_256_270 * neg_f_236_low60_20_low20_0 + s_256_270 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_14 + u_256_270 * (const 64 (2**21)) + v_256_270 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_14 + r_256_270 * (const 64 (2**21)) + s_256_270 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_14,
    neg_f_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_14,
    neg_g_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 270)) <=s delta, delta <=s (const 64 (1 + 2*270)),
    (const 64 (-(2**20))) <=s u_256_270, u_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_270, v_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_270, r_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_270, s_256_270 <=s (const 64 ((2**20))),
    u_256_270 + v_256_270 <=s (const 64 (2**20)),
    u_256_270 - v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 + v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 - v_256_270 <=s (const 64 (2**20)),
    r_256_270 + s_256_270 <=s (const 64 (2**20)),
    r_256_270 - s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 + s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 - s_256_270 <=s (const 64 (2**20)),
    u_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_256_270 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise b
assume
neg_g_236_low60_20_low20_14 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_15 neg_f_236_low60_20_low20_14;
mov u_256_271 u_256_270;
mov v_256_271 v_256_270;

add neg_g_236_low60_20_low20_15 neg_g_236_low60_20_low20_14 neg_f_236_low60_20_low20_14;
asr neg_g_236_low60_20_low20_15 neg_g_236_low60_20_low20_15 1;
add r_256_271 r_256_270 u_256_270;
asr r_256_271 r_256_271 1;
add s_256_271 s_256_270 v_256_270;
asr s_256_271 s_256_271 1;
assert
    true
&&
    neg_f_236_low60_20_low20_15 = neg_f_236_low60_20_low20_14,
    u_256_271 = u_256_270,
    v_256_271 = v_256_270,
    neg_g_236_low60_20_low20_15 * (const 64 2) = neg_g_236_low60_20_low20_14 + neg_f_236_low60_20_low20_14,
    r_256_271 * (const 64 2) = r_256_270 + u_256_270,
    s_256_271 * (const 64 2) = s_256_270 + v_256_270
;

assume
    neg_f_236_low60_20_low20_15 = neg_f_236_low60_20_low20_14,
    u_256_271 = u_256_270,
    v_256_271 = v_256_270,
    neg_g_236_low60_20_low20_15 * 2 = neg_g_236_low60_20_low20_14 + neg_f_236_low60_20_low20_14,
    r_256_271 * 2 = r_256_270 + u_256_270,
    s_256_271 * 2 = s_256_270 + v_256_270
&&
    true
;

{
    u_256_271 * neg_f_236_low60_20_low20_0 + v_256_271 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_271 * neg_f_236_low60_20_low20_0 + s_256_271 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_15 + u_256_271 * (const 64 (2**21)) + v_256_271 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_15 + r_256_271 * (const 64 (2**21)) + s_256_271 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_15,
    neg_f_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_15,
    neg_g_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 271)) <=s delta, delta <=s (const 64 (1 + 2*271)),
    (const 64 (-(2**20))) <=s u_256_271, u_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_271, v_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_271, r_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_271, s_256_271 <=s (const 64 ((2**20))),
    u_256_271 + v_256_271 <=s (const 64 (2**20)),
    u_256_271 - v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 + v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 - v_256_271 <=s (const 64 (2**20)),
    r_256_271 + s_256_271 <=s (const 64 (2**20)),
    r_256_271 - s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 + s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 - s_256_271 <=s (const 64 (2**20)),
    u_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_256_271 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_270_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_14,
sint64 neg_g_236_low60_20_low20_14,
sint64 neg_f_236_low60_20_low20_15,
sint64 neg_g_236_low60_20_low20_15,
sint64 u_256_270,
sint64 v_256_270,
sint64 r_256_270,
sint64 s_256_270,
sint64 u_256_271,
sint64 v_256_271,
sint64 r_256_271,
sint64 s_256_271,
bit ne
)={
    u_256_270 * neg_f_236_low60_20_low20_0 + v_256_270 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_14 * (-(2**20)),
    r_256_270 * neg_f_236_low60_20_low20_0 + s_256_270 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_14 * (-(2**20))
&&
    u_256_270 * neg_f_236_low60_20_low20_0 + v_256_270 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_14 * (const 64 (-(2**20))),
    r_256_270 * neg_f_236_low60_20_low20_0 + s_256_270 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_14 + u_256_270 * (const 64 (2**21)) + v_256_270 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_14 + r_256_270 * (const 64 (2**21)) + s_256_270 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_14,
    neg_f_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_14,
    neg_g_236_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 270)) <=s delta, delta <=s (const 64 (1 + 2*270)),
    (const 64 (-(2**20))) <=s u_256_270, u_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_270, v_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_270, r_256_270 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_270, s_256_270 <=s (const 64 ((2**20))),
    u_256_270 + v_256_270 <=s (const 64 (2**20)),
    u_256_270 - v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 + v_256_270 <=s (const 64 (2**20)),
    (const 64 0) - u_256_270 - v_256_270 <=s (const 64 (2**20)),
    r_256_270 + s_256_270 <=s (const 64 (2**20)),
    r_256_270 - s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 + s_256_270 <=s (const 64 (2**20)),
    (const 64 0) - r_256_270 - s_256_270 <=s (const 64 (2**20)),
    u_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_256_270 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_256_270 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise c
assume
neg_g_236_low60_20_low20_14 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_15 neg_g_236_low60_20_low20_14;
mov u_256_271 r_256_270;
mov v_256_271 s_256_270;

subs dc neg_g_236_low60_20_low20_15 neg_g_236_low60_20_low20_14 neg_f_236_low60_20_low20_14;
asr neg_g_236_low60_20_low20_15 neg_g_236_low60_20_low20_15 1;
subs dc r_256_271 r_256_270 u_256_270;
asr r_256_271 r_256_271 1;
subs dc s_256_271 s_256_270 v_256_270;
asr s_256_271 s_256_271 1;
assert
    true
&&
    neg_f_236_low60_20_low20_15 = neg_g_236_low60_20_low20_14,
    u_256_271 = r_256_270,
    v_256_271 = s_256_270,
    neg_g_236_low60_20_low20_15 * (const 64 2) = neg_g_236_low60_20_low20_14 - neg_f_236_low60_20_low20_14,
    r_256_271 * (const 64 2) = r_256_270 - u_256_270,
    s_256_271 * (const 64 2) = s_256_270 - v_256_270
;

assume
    neg_f_236_low60_20_low20_15 = neg_g_236_low60_20_low20_14,
    u_256_271 = r_256_270,
    v_256_271 = s_256_270,
    neg_g_236_low60_20_low20_15 * 2 = neg_g_236_low60_20_low20_14 - neg_f_236_low60_20_low20_14,
    r_256_271 * 2 = r_256_270 - u_256_270,
    s_256_271 * 2 = s_256_270 - v_256_270
&&
    true
;

{
    u_256_271 * neg_f_236_low60_20_low20_0 + v_256_271 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_271 * neg_f_236_low60_20_low20_0 + s_256_271 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_15 + u_256_271 * (const 64 (2**21)) + v_256_271 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_15 + r_256_271 * (const 64 (2**21)) + s_256_271 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_15,
    neg_f_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_15,
    neg_g_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 271)) <=s delta, delta <=s (const 64 (1 + 2*271)),
    (const 64 (-(2**20))) <=s u_256_271, u_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_271, v_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_271, r_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_271, s_256_271 <=s (const 64 ((2**20))),
    u_256_271 + v_256_271 <=s (const 64 (2**20)),
    u_256_271 - v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 + v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 - v_256_271 <=s (const 64 (2**20)),
    r_256_271 + s_256_271 <=s (const 64 (2**20)),
    r_256_271 - s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 + s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 - s_256_271 <=s (const 64 (2**20)),
    u_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_256_271 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_271_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_15,
sint64 neg_g_236_low60_20_low20_15,
sint64 neg_f_236_low60_20_low20_16,
sint64 neg_g_236_low60_20_low20_16,
sint64 u_256_271,
sint64 v_256_271,
sint64 r_256_271,
sint64 s_256_271,
sint64 u_256_272,
sint64 v_256_272,
sint64 r_256_272,
sint64 s_256_272,
bit ne
)={
    u_256_271 * neg_f_236_low60_20_low20_0 + v_256_271 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_15 * (-(2**20)),
    r_256_271 * neg_f_236_low60_20_low20_0 + s_256_271 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_15 * (-(2**20))
&&
    u_256_271 * neg_f_236_low60_20_low20_0 + v_256_271 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_15 * (const 64 (-(2**20))),
    r_256_271 * neg_f_236_low60_20_low20_0 + s_256_271 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_15 + u_256_271 * (const 64 (2**21)) + v_256_271 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_15 + r_256_271 * (const 64 (2**21)) + s_256_271 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_15,
    neg_f_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_15,
    neg_g_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 271)) <=s delta, delta <=s (const 64 (1 + 2*271)),
    (const 64 (-(2**20))) <=s u_256_271, u_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_271, v_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_271, r_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_271, s_256_271 <=s (const 64 ((2**20))),
    u_256_271 + v_256_271 <=s (const 64 (2**20)),
    u_256_271 - v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 + v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 - v_256_271 <=s (const 64 (2**20)),
    r_256_271 + s_256_271 <=s (const 64 (2**20)),
    r_256_271 - s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 + s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 - s_256_271 <=s (const 64 (2**20)),
    u_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_256_271 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise a
assume
neg_g_236_low60_20_low20_15 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_16 neg_f_236_low60_20_low20_15;
mov u_256_272 u_256_271;
mov v_256_272 v_256_271;

asr neg_g_236_low60_20_low20_16 neg_g_236_low60_20_low20_15 1;
asr r_256_272 r_256_271 1;
asr s_256_272 s_256_271 1;
assert
    true
&&
    neg_f_236_low60_20_low20_16 = neg_f_236_low60_20_low20_15,
    u_256_272 = u_256_271,
    v_256_272 = v_256_271,
    neg_g_236_low60_20_low20_16 * (const 64 2) = neg_g_236_low60_20_low20_15,
    r_256_272 * (const 64 2) = r_256_271,
    s_256_272 * (const 64 2) = s_256_271
;

assume
    neg_f_236_low60_20_low20_16 = neg_f_236_low60_20_low20_15,
    u_256_272 = u_256_271,
    v_256_272 = v_256_271,
    neg_g_236_low60_20_low20_16 * 2 = neg_g_236_low60_20_low20_15,
    r_256_272 * 2 = r_256_271,
    s_256_272 * 2 = s_256_271
&&
    true
;

{
    u_256_272 * neg_f_236_low60_20_low20_0 + v_256_272 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_272 * neg_f_236_low60_20_low20_0 + s_256_272 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_16 + u_256_272 * (const 64 (2**21)) + v_256_272 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_16 + r_256_272 * (const 64 (2**21)) + s_256_272 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_16,
    neg_f_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_16,
    neg_g_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 272)) <=s delta, delta <=s (const 64 (1 + 2*272)),
    (const 64 (-(2**20))) <=s u_256_272, u_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_272, v_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_272, r_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_272, s_256_272 <=s (const 64 ((2**20))),
    u_256_272 + v_256_272 <=s (const 64 (2**20)),
    u_256_272 - v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 + v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 - v_256_272 <=s (const 64 (2**20)),
    r_256_272 + s_256_272 <=s (const 64 (2**20)),
    r_256_272 - s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 + s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 - s_256_272 <=s (const 64 (2**20)),
    u_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_256_272 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_271_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_15,
sint64 neg_g_236_low60_20_low20_15,
sint64 neg_f_236_low60_20_low20_16,
sint64 neg_g_236_low60_20_low20_16,
sint64 u_256_271,
sint64 v_256_271,
sint64 r_256_271,
sint64 s_256_271,
sint64 u_256_272,
sint64 v_256_272,
sint64 r_256_272,
sint64 s_256_272,
bit ne
)={
    u_256_271 * neg_f_236_low60_20_low20_0 + v_256_271 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_15 * (-(2**20)),
    r_256_271 * neg_f_236_low60_20_low20_0 + s_256_271 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_15 * (-(2**20))
&&
    u_256_271 * neg_f_236_low60_20_low20_0 + v_256_271 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_15 * (const 64 (-(2**20))),
    r_256_271 * neg_f_236_low60_20_low20_0 + s_256_271 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_15 + u_256_271 * (const 64 (2**21)) + v_256_271 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_15 + r_256_271 * (const 64 (2**21)) + s_256_271 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_15,
    neg_f_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_15,
    neg_g_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 271)) <=s delta, delta <=s (const 64 (1 + 2*271)),
    (const 64 (-(2**20))) <=s u_256_271, u_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_271, v_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_271, r_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_271, s_256_271 <=s (const 64 ((2**20))),
    u_256_271 + v_256_271 <=s (const 64 (2**20)),
    u_256_271 - v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 + v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 - v_256_271 <=s (const 64 (2**20)),
    r_256_271 + s_256_271 <=s (const 64 (2**20)),
    r_256_271 - s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 + s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 - s_256_271 <=s (const 64 (2**20)),
    u_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_256_271 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise b
assume
neg_g_236_low60_20_low20_15 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_16 neg_f_236_low60_20_low20_15;
mov u_256_272 u_256_271;
mov v_256_272 v_256_271;

add neg_g_236_low60_20_low20_16 neg_g_236_low60_20_low20_15 neg_f_236_low60_20_low20_15;
asr neg_g_236_low60_20_low20_16 neg_g_236_low60_20_low20_16 1;
add r_256_272 r_256_271 u_256_271;
asr r_256_272 r_256_272 1;
add s_256_272 s_256_271 v_256_271;
asr s_256_272 s_256_272 1;
assert
    true
&&
    neg_f_236_low60_20_low20_16 = neg_f_236_low60_20_low20_15,
    u_256_272 = u_256_271,
    v_256_272 = v_256_271,
    neg_g_236_low60_20_low20_16 * (const 64 2) = neg_g_236_low60_20_low20_15 + neg_f_236_low60_20_low20_15,
    r_256_272 * (const 64 2) = r_256_271 + u_256_271,
    s_256_272 * (const 64 2) = s_256_271 + v_256_271
;

assume
    neg_f_236_low60_20_low20_16 = neg_f_236_low60_20_low20_15,
    u_256_272 = u_256_271,
    v_256_272 = v_256_271,
    neg_g_236_low60_20_low20_16 * 2 = neg_g_236_low60_20_low20_15 + neg_f_236_low60_20_low20_15,
    r_256_272 * 2 = r_256_271 + u_256_271,
    s_256_272 * 2 = s_256_271 + v_256_271
&&
    true
;

{
    u_256_272 * neg_f_236_low60_20_low20_0 + v_256_272 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_272 * neg_f_236_low60_20_low20_0 + s_256_272 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_16 + u_256_272 * (const 64 (2**21)) + v_256_272 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_16 + r_256_272 * (const 64 (2**21)) + s_256_272 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_16,
    neg_f_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_16,
    neg_g_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 272)) <=s delta, delta <=s (const 64 (1 + 2*272)),
    (const 64 (-(2**20))) <=s u_256_272, u_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_272, v_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_272, r_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_272, s_256_272 <=s (const 64 ((2**20))),
    u_256_272 + v_256_272 <=s (const 64 (2**20)),
    u_256_272 - v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 + v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 - v_256_272 <=s (const 64 (2**20)),
    r_256_272 + s_256_272 <=s (const 64 (2**20)),
    r_256_272 - s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 + s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 - s_256_272 <=s (const 64 (2**20)),
    u_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_256_272 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_271_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_15,
sint64 neg_g_236_low60_20_low20_15,
sint64 neg_f_236_low60_20_low20_16,
sint64 neg_g_236_low60_20_low20_16,
sint64 u_256_271,
sint64 v_256_271,
sint64 r_256_271,
sint64 s_256_271,
sint64 u_256_272,
sint64 v_256_272,
sint64 r_256_272,
sint64 s_256_272,
bit ne
)={
    u_256_271 * neg_f_236_low60_20_low20_0 + v_256_271 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_15 * (-(2**20)),
    r_256_271 * neg_f_236_low60_20_low20_0 + s_256_271 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_15 * (-(2**20))
&&
    u_256_271 * neg_f_236_low60_20_low20_0 + v_256_271 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_15 * (const 64 (-(2**20))),
    r_256_271 * neg_f_236_low60_20_low20_0 + s_256_271 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_15 + u_256_271 * (const 64 (2**21)) + v_256_271 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_15 + r_256_271 * (const 64 (2**21)) + s_256_271 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_15,
    neg_f_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_15,
    neg_g_236_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 271)) <=s delta, delta <=s (const 64 (1 + 2*271)),
    (const 64 (-(2**20))) <=s u_256_271, u_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_271, v_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_271, r_256_271 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_271, s_256_271 <=s (const 64 ((2**20))),
    u_256_271 + v_256_271 <=s (const 64 (2**20)),
    u_256_271 - v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 + v_256_271 <=s (const 64 (2**20)),
    (const 64 0) - u_256_271 - v_256_271 <=s (const 64 (2**20)),
    r_256_271 + s_256_271 <=s (const 64 (2**20)),
    r_256_271 - s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 + s_256_271 <=s (const 64 (2**20)),
    (const 64 0) - r_256_271 - s_256_271 <=s (const 64 (2**20)),
    u_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_256_271 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_256_271 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise c
assume
neg_g_236_low60_20_low20_15 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_16 neg_g_236_low60_20_low20_15;
mov u_256_272 r_256_271;
mov v_256_272 s_256_271;

subs dc neg_g_236_low60_20_low20_16 neg_g_236_low60_20_low20_15 neg_f_236_low60_20_low20_15;
asr neg_g_236_low60_20_low20_16 neg_g_236_low60_20_low20_16 1;
subs dc r_256_272 r_256_271 u_256_271;
asr r_256_272 r_256_272 1;
subs dc s_256_272 s_256_271 v_256_271;
asr s_256_272 s_256_272 1;
assert
    true
&&
    neg_f_236_low60_20_low20_16 = neg_g_236_low60_20_low20_15,
    u_256_272 = r_256_271,
    v_256_272 = s_256_271,
    neg_g_236_low60_20_low20_16 * (const 64 2) = neg_g_236_low60_20_low20_15 - neg_f_236_low60_20_low20_15,
    r_256_272 * (const 64 2) = r_256_271 - u_256_271,
    s_256_272 * (const 64 2) = s_256_271 - v_256_271
;

assume
    neg_f_236_low60_20_low20_16 = neg_g_236_low60_20_low20_15,
    u_256_272 = r_256_271,
    v_256_272 = s_256_271,
    neg_g_236_low60_20_low20_16 * 2 = neg_g_236_low60_20_low20_15 - neg_f_236_low60_20_low20_15,
    r_256_272 * 2 = r_256_271 - u_256_271,
    s_256_272 * 2 = s_256_271 - v_256_271
&&
    true
;

{
    u_256_272 * neg_f_236_low60_20_low20_0 + v_256_272 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_272 * neg_f_236_low60_20_low20_0 + s_256_272 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_16 + u_256_272 * (const 64 (2**21)) + v_256_272 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_16 + r_256_272 * (const 64 (2**21)) + s_256_272 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_16,
    neg_f_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_16,
    neg_g_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 272)) <=s delta, delta <=s (const 64 (1 + 2*272)),
    (const 64 (-(2**20))) <=s u_256_272, u_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_272, v_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_272, r_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_272, s_256_272 <=s (const 64 ((2**20))),
    u_256_272 + v_256_272 <=s (const 64 (2**20)),
    u_256_272 - v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 + v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 - v_256_272 <=s (const 64 (2**20)),
    r_256_272 + s_256_272 <=s (const 64 (2**20)),
    r_256_272 - s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 + s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 - s_256_272 <=s (const 64 (2**20)),
    u_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_256_272 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_272_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_16,
sint64 neg_g_236_low60_20_low20_16,
sint64 neg_f_236_low60_20_low20_17,
sint64 neg_g_236_low60_20_low20_17,
sint64 u_256_272,
sint64 v_256_272,
sint64 r_256_272,
sint64 s_256_272,
sint64 u_256_273,
sint64 v_256_273,
sint64 r_256_273,
sint64 s_256_273,
bit ne
)={
    u_256_272 * neg_f_236_low60_20_low20_0 + v_256_272 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_16 * (-(2**20)),
    r_256_272 * neg_f_236_low60_20_low20_0 + s_256_272 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_16 * (-(2**20))
&&
    u_256_272 * neg_f_236_low60_20_low20_0 + v_256_272 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_16 * (const 64 (-(2**20))),
    r_256_272 * neg_f_236_low60_20_low20_0 + s_256_272 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_16 + u_256_272 * (const 64 (2**21)) + v_256_272 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_16 + r_256_272 * (const 64 (2**21)) + s_256_272 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_16,
    neg_f_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_16,
    neg_g_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 272)) <=s delta, delta <=s (const 64 (1 + 2*272)),
    (const 64 (-(2**20))) <=s u_256_272, u_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_272, v_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_272, r_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_272, s_256_272 <=s (const 64 ((2**20))),
    u_256_272 + v_256_272 <=s (const 64 (2**20)),
    u_256_272 - v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 + v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 - v_256_272 <=s (const 64 (2**20)),
    r_256_272 + s_256_272 <=s (const 64 (2**20)),
    r_256_272 - s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 + s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 - s_256_272 <=s (const 64 (2**20)),
    u_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_256_272 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise a
assume
neg_g_236_low60_20_low20_16 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_17 neg_f_236_low60_20_low20_16;
mov u_256_273 u_256_272;
mov v_256_273 v_256_272;

asr neg_g_236_low60_20_low20_17 neg_g_236_low60_20_low20_16 1;
asr r_256_273 r_256_272 1;
asr s_256_273 s_256_272 1;
assert
    true
&&
    neg_f_236_low60_20_low20_17 = neg_f_236_low60_20_low20_16,
    u_256_273 = u_256_272,
    v_256_273 = v_256_272,
    neg_g_236_low60_20_low20_17 * (const 64 2) = neg_g_236_low60_20_low20_16,
    r_256_273 * (const 64 2) = r_256_272,
    s_256_273 * (const 64 2) = s_256_272
;

assume
    neg_f_236_low60_20_low20_17 = neg_f_236_low60_20_low20_16,
    u_256_273 = u_256_272,
    v_256_273 = v_256_272,
    neg_g_236_low60_20_low20_17 * 2 = neg_g_236_low60_20_low20_16,
    r_256_273 * 2 = r_256_272,
    s_256_273 * 2 = s_256_272
&&
    true
;

{
    u_256_273 * neg_f_236_low60_20_low20_0 + v_256_273 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_273 * neg_f_236_low60_20_low20_0 + s_256_273 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_17 + u_256_273 * (const 64 (2**21)) + v_256_273 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_17 + r_256_273 * (const 64 (2**21)) + s_256_273 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_17,
    neg_f_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_17,
    neg_g_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 273)) <=s delta, delta <=s (const 64 (1 + 2*273)),
    (const 64 (-(2**20))) <=s u_256_273, u_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_273, v_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_273, r_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_273, s_256_273 <=s (const 64 ((2**20))),
    u_256_273 + v_256_273 <=s (const 64 (2**20)),
    u_256_273 - v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 + v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 - v_256_273 <=s (const 64 (2**20)),
    r_256_273 + s_256_273 <=s (const 64 (2**20)),
    r_256_273 - s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 + s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 - s_256_273 <=s (const 64 (2**20)),
    u_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_256_273 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_272_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_16,
sint64 neg_g_236_low60_20_low20_16,
sint64 neg_f_236_low60_20_low20_17,
sint64 neg_g_236_low60_20_low20_17,
sint64 u_256_272,
sint64 v_256_272,
sint64 r_256_272,
sint64 s_256_272,
sint64 u_256_273,
sint64 v_256_273,
sint64 r_256_273,
sint64 s_256_273,
bit ne
)={
    u_256_272 * neg_f_236_low60_20_low20_0 + v_256_272 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_16 * (-(2**20)),
    r_256_272 * neg_f_236_low60_20_low20_0 + s_256_272 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_16 * (-(2**20))
&&
    u_256_272 * neg_f_236_low60_20_low20_0 + v_256_272 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_16 * (const 64 (-(2**20))),
    r_256_272 * neg_f_236_low60_20_low20_0 + s_256_272 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_16 + u_256_272 * (const 64 (2**21)) + v_256_272 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_16 + r_256_272 * (const 64 (2**21)) + s_256_272 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_16,
    neg_f_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_16,
    neg_g_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 272)) <=s delta, delta <=s (const 64 (1 + 2*272)),
    (const 64 (-(2**20))) <=s u_256_272, u_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_272, v_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_272, r_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_272, s_256_272 <=s (const 64 ((2**20))),
    u_256_272 + v_256_272 <=s (const 64 (2**20)),
    u_256_272 - v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 + v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 - v_256_272 <=s (const 64 (2**20)),
    r_256_272 + s_256_272 <=s (const 64 (2**20)),
    r_256_272 - s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 + s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 - s_256_272 <=s (const 64 (2**20)),
    u_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_256_272 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise b
assume
neg_g_236_low60_20_low20_16 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_17 neg_f_236_low60_20_low20_16;
mov u_256_273 u_256_272;
mov v_256_273 v_256_272;

add neg_g_236_low60_20_low20_17 neg_g_236_low60_20_low20_16 neg_f_236_low60_20_low20_16;
asr neg_g_236_low60_20_low20_17 neg_g_236_low60_20_low20_17 1;
add r_256_273 r_256_272 u_256_272;
asr r_256_273 r_256_273 1;
add s_256_273 s_256_272 v_256_272;
asr s_256_273 s_256_273 1;
assert
    true
&&
    neg_f_236_low60_20_low20_17 = neg_f_236_low60_20_low20_16,
    u_256_273 = u_256_272,
    v_256_273 = v_256_272,
    neg_g_236_low60_20_low20_17 * (const 64 2) = neg_g_236_low60_20_low20_16 + neg_f_236_low60_20_low20_16,
    r_256_273 * (const 64 2) = r_256_272 + u_256_272,
    s_256_273 * (const 64 2) = s_256_272 + v_256_272
;

assume
    neg_f_236_low60_20_low20_17 = neg_f_236_low60_20_low20_16,
    u_256_273 = u_256_272,
    v_256_273 = v_256_272,
    neg_g_236_low60_20_low20_17 * 2 = neg_g_236_low60_20_low20_16 + neg_f_236_low60_20_low20_16,
    r_256_273 * 2 = r_256_272 + u_256_272,
    s_256_273 * 2 = s_256_272 + v_256_272
&&
    true
;

{
    u_256_273 * neg_f_236_low60_20_low20_0 + v_256_273 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_273 * neg_f_236_low60_20_low20_0 + s_256_273 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_17 + u_256_273 * (const 64 (2**21)) + v_256_273 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_17 + r_256_273 * (const 64 (2**21)) + s_256_273 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_17,
    neg_f_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_17,
    neg_g_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 273)) <=s delta, delta <=s (const 64 (1 + 2*273)),
    (const 64 (-(2**20))) <=s u_256_273, u_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_273, v_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_273, r_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_273, s_256_273 <=s (const 64 ((2**20))),
    u_256_273 + v_256_273 <=s (const 64 (2**20)),
    u_256_273 - v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 + v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 - v_256_273 <=s (const 64 (2**20)),
    r_256_273 + s_256_273 <=s (const 64 (2**20)),
    r_256_273 - s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 + s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 - s_256_273 <=s (const 64 (2**20)),
    u_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_256_273 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_272_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_16,
sint64 neg_g_236_low60_20_low20_16,
sint64 neg_f_236_low60_20_low20_17,
sint64 neg_g_236_low60_20_low20_17,
sint64 u_256_272,
sint64 v_256_272,
sint64 r_256_272,
sint64 s_256_272,
sint64 u_256_273,
sint64 v_256_273,
sint64 r_256_273,
sint64 s_256_273,
bit ne
)={
    u_256_272 * neg_f_236_low60_20_low20_0 + v_256_272 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_16 * (-(2**20)),
    r_256_272 * neg_f_236_low60_20_low20_0 + s_256_272 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_16 * (-(2**20))
&&
    u_256_272 * neg_f_236_low60_20_low20_0 + v_256_272 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_16 * (const 64 (-(2**20))),
    r_256_272 * neg_f_236_low60_20_low20_0 + s_256_272 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_16 + u_256_272 * (const 64 (2**21)) + v_256_272 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_16 + r_256_272 * (const 64 (2**21)) + s_256_272 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_16,
    neg_f_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_16,
    neg_g_236_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 272)) <=s delta, delta <=s (const 64 (1 + 2*272)),
    (const 64 (-(2**20))) <=s u_256_272, u_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_272, v_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_272, r_256_272 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_272, s_256_272 <=s (const 64 ((2**20))),
    u_256_272 + v_256_272 <=s (const 64 (2**20)),
    u_256_272 - v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 + v_256_272 <=s (const 64 (2**20)),
    (const 64 0) - u_256_272 - v_256_272 <=s (const 64 (2**20)),
    r_256_272 + s_256_272 <=s (const 64 (2**20)),
    r_256_272 - s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 + s_256_272 <=s (const 64 (2**20)),
    (const 64 0) - r_256_272 - s_256_272 <=s (const 64 (2**20)),
    u_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_256_272 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_256_272 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise c
assume
neg_g_236_low60_20_low20_16 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_17 neg_g_236_low60_20_low20_16;
mov u_256_273 r_256_272;
mov v_256_273 s_256_272;

subs dc neg_g_236_low60_20_low20_17 neg_g_236_low60_20_low20_16 neg_f_236_low60_20_low20_16;
asr neg_g_236_low60_20_low20_17 neg_g_236_low60_20_low20_17 1;
subs dc r_256_273 r_256_272 u_256_272;
asr r_256_273 r_256_273 1;
subs dc s_256_273 s_256_272 v_256_272;
asr s_256_273 s_256_273 1;
assert
    true
&&
    neg_f_236_low60_20_low20_17 = neg_g_236_low60_20_low20_16,
    u_256_273 = r_256_272,
    v_256_273 = s_256_272,
    neg_g_236_low60_20_low20_17 * (const 64 2) = neg_g_236_low60_20_low20_16 - neg_f_236_low60_20_low20_16,
    r_256_273 * (const 64 2) = r_256_272 - u_256_272,
    s_256_273 * (const 64 2) = s_256_272 - v_256_272
;

assume
    neg_f_236_low60_20_low20_17 = neg_g_236_low60_20_low20_16,
    u_256_273 = r_256_272,
    v_256_273 = s_256_272,
    neg_g_236_low60_20_low20_17 * 2 = neg_g_236_low60_20_low20_16 - neg_f_236_low60_20_low20_16,
    r_256_273 * 2 = r_256_272 - u_256_272,
    s_256_273 * 2 = s_256_272 - v_256_272
&&
    true
;

{
    u_256_273 * neg_f_236_low60_20_low20_0 + v_256_273 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_273 * neg_f_236_low60_20_low20_0 + s_256_273 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_17 + u_256_273 * (const 64 (2**21)) + v_256_273 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_17 + r_256_273 * (const 64 (2**21)) + s_256_273 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_17,
    neg_f_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_17,
    neg_g_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 273)) <=s delta, delta <=s (const 64 (1 + 2*273)),
    (const 64 (-(2**20))) <=s u_256_273, u_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_273, v_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_273, r_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_273, s_256_273 <=s (const 64 ((2**20))),
    u_256_273 + v_256_273 <=s (const 64 (2**20)),
    u_256_273 - v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 + v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 - v_256_273 <=s (const 64 (2**20)),
    r_256_273 + s_256_273 <=s (const 64 (2**20)),
    r_256_273 - s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 + s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 - s_256_273 <=s (const 64 (2**20)),
    u_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_256_273 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_273_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_17,
sint64 neg_g_236_low60_20_low20_17,
sint64 neg_f_236_low60_20_low20_18,
sint64 neg_g_236_low60_20_low20_18,
sint64 u_256_273,
sint64 v_256_273,
sint64 r_256_273,
sint64 s_256_273,
sint64 u_256_274,
sint64 v_256_274,
sint64 r_256_274,
sint64 s_256_274,
bit ne
)={
    u_256_273 * neg_f_236_low60_20_low20_0 + v_256_273 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_17 * (-(2**20)),
    r_256_273 * neg_f_236_low60_20_low20_0 + s_256_273 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_17 * (-(2**20))
&&
    u_256_273 * neg_f_236_low60_20_low20_0 + v_256_273 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_17 * (const 64 (-(2**20))),
    r_256_273 * neg_f_236_low60_20_low20_0 + s_256_273 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_17 + u_256_273 * (const 64 (2**21)) + v_256_273 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_17 + r_256_273 * (const 64 (2**21)) + s_256_273 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_17,
    neg_f_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_17,
    neg_g_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 273)) <=s delta, delta <=s (const 64 (1 + 2*273)),
    (const 64 (-(2**20))) <=s u_256_273, u_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_273, v_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_273, r_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_273, s_256_273 <=s (const 64 ((2**20))),
    u_256_273 + v_256_273 <=s (const 64 (2**20)),
    u_256_273 - v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 + v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 - v_256_273 <=s (const 64 (2**20)),
    r_256_273 + s_256_273 <=s (const 64 (2**20)),
    r_256_273 - s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 + s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 - s_256_273 <=s (const 64 (2**20)),
    u_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_256_273 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise a
assume
neg_g_236_low60_20_low20_17 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_18 neg_f_236_low60_20_low20_17;
mov u_256_274 u_256_273;
mov v_256_274 v_256_273;

asr neg_g_236_low60_20_low20_18 neg_g_236_low60_20_low20_17 1;
asr r_256_274 r_256_273 1;
asr s_256_274 s_256_273 1;
assert
    true
&&
    neg_f_236_low60_20_low20_18 = neg_f_236_low60_20_low20_17,
    u_256_274 = u_256_273,
    v_256_274 = v_256_273,
    neg_g_236_low60_20_low20_18 * (const 64 2) = neg_g_236_low60_20_low20_17,
    r_256_274 * (const 64 2) = r_256_273,
    s_256_274 * (const 64 2) = s_256_273
;

assume
    neg_f_236_low60_20_low20_18 = neg_f_236_low60_20_low20_17,
    u_256_274 = u_256_273,
    v_256_274 = v_256_273,
    neg_g_236_low60_20_low20_18 * 2 = neg_g_236_low60_20_low20_17,
    r_256_274 * 2 = r_256_273,
    s_256_274 * 2 = s_256_273
&&
    true
;

{
    u_256_274 * neg_f_236_low60_20_low20_0 + v_256_274 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_274 * neg_f_236_low60_20_low20_0 + s_256_274 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_18 + u_256_274 * (const 64 (2**21)) + v_256_274 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_18 + r_256_274 * (const 64 (2**21)) + s_256_274 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_18,
    neg_f_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_18,
    neg_g_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 274)) <=s delta, delta <=s (const 64 (1 + 2*274)),
    (const 64 (-(2**20))) <=s u_256_274, u_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_274, v_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_274, r_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_274, s_256_274 <=s (const 64 ((2**20))),
    u_256_274 + v_256_274 <=s (const 64 (2**20)),
    u_256_274 - v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 + v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 - v_256_274 <=s (const 64 (2**20)),
    r_256_274 + s_256_274 <=s (const 64 (2**20)),
    r_256_274 - s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 + s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 - s_256_274 <=s (const 64 (2**20)),
    u_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_256_274 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_273_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_17,
sint64 neg_g_236_low60_20_low20_17,
sint64 neg_f_236_low60_20_low20_18,
sint64 neg_g_236_low60_20_low20_18,
sint64 u_256_273,
sint64 v_256_273,
sint64 r_256_273,
sint64 s_256_273,
sint64 u_256_274,
sint64 v_256_274,
sint64 r_256_274,
sint64 s_256_274,
bit ne
)={
    u_256_273 * neg_f_236_low60_20_low20_0 + v_256_273 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_17 * (-(2**20)),
    r_256_273 * neg_f_236_low60_20_low20_0 + s_256_273 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_17 * (-(2**20))
&&
    u_256_273 * neg_f_236_low60_20_low20_0 + v_256_273 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_17 * (const 64 (-(2**20))),
    r_256_273 * neg_f_236_low60_20_low20_0 + s_256_273 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_17 + u_256_273 * (const 64 (2**21)) + v_256_273 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_17 + r_256_273 * (const 64 (2**21)) + s_256_273 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_17,
    neg_f_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_17,
    neg_g_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 273)) <=s delta, delta <=s (const 64 (1 + 2*273)),
    (const 64 (-(2**20))) <=s u_256_273, u_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_273, v_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_273, r_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_273, s_256_273 <=s (const 64 ((2**20))),
    u_256_273 + v_256_273 <=s (const 64 (2**20)),
    u_256_273 - v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 + v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 - v_256_273 <=s (const 64 (2**20)),
    r_256_273 + s_256_273 <=s (const 64 (2**20)),
    r_256_273 - s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 + s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 - s_256_273 <=s (const 64 (2**20)),
    u_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_256_273 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise b
assume
neg_g_236_low60_20_low20_17 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_18 neg_f_236_low60_20_low20_17;
mov u_256_274 u_256_273;
mov v_256_274 v_256_273;

add neg_g_236_low60_20_low20_18 neg_g_236_low60_20_low20_17 neg_f_236_low60_20_low20_17;
asr neg_g_236_low60_20_low20_18 neg_g_236_low60_20_low20_18 1;
add r_256_274 r_256_273 u_256_273;
asr r_256_274 r_256_274 1;
add s_256_274 s_256_273 v_256_273;
asr s_256_274 s_256_274 1;
assert
    true
&&
    neg_f_236_low60_20_low20_18 = neg_f_236_low60_20_low20_17,
    u_256_274 = u_256_273,
    v_256_274 = v_256_273,
    neg_g_236_low60_20_low20_18 * (const 64 2) = neg_g_236_low60_20_low20_17 + neg_f_236_low60_20_low20_17,
    r_256_274 * (const 64 2) = r_256_273 + u_256_273,
    s_256_274 * (const 64 2) = s_256_273 + v_256_273
;

assume
    neg_f_236_low60_20_low20_18 = neg_f_236_low60_20_low20_17,
    u_256_274 = u_256_273,
    v_256_274 = v_256_273,
    neg_g_236_low60_20_low20_18 * 2 = neg_g_236_low60_20_low20_17 + neg_f_236_low60_20_low20_17,
    r_256_274 * 2 = r_256_273 + u_256_273,
    s_256_274 * 2 = s_256_273 + v_256_273
&&
    true
;

{
    u_256_274 * neg_f_236_low60_20_low20_0 + v_256_274 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_274 * neg_f_236_low60_20_low20_0 + s_256_274 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_18 + u_256_274 * (const 64 (2**21)) + v_256_274 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_18 + r_256_274 * (const 64 (2**21)) + s_256_274 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_18,
    neg_f_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_18,
    neg_g_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 274)) <=s delta, delta <=s (const 64 (1 + 2*274)),
    (const 64 (-(2**20))) <=s u_256_274, u_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_274, v_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_274, r_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_274, s_256_274 <=s (const 64 ((2**20))),
    u_256_274 + v_256_274 <=s (const 64 (2**20)),
    u_256_274 - v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 + v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 - v_256_274 <=s (const 64 (2**20)),
    r_256_274 + s_256_274 <=s (const 64 (2**20)),
    r_256_274 - s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 + s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 - s_256_274 <=s (const 64 (2**20)),
    u_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_256_274 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_273_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_17,
sint64 neg_g_236_low60_20_low20_17,
sint64 neg_f_236_low60_20_low20_18,
sint64 neg_g_236_low60_20_low20_18,
sint64 u_256_273,
sint64 v_256_273,
sint64 r_256_273,
sint64 s_256_273,
sint64 u_256_274,
sint64 v_256_274,
sint64 r_256_274,
sint64 s_256_274,
bit ne
)={
    u_256_273 * neg_f_236_low60_20_low20_0 + v_256_273 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_17 * (-(2**20)),
    r_256_273 * neg_f_236_low60_20_low20_0 + s_256_273 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_17 * (-(2**20))
&&
    u_256_273 * neg_f_236_low60_20_low20_0 + v_256_273 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_17 * (const 64 (-(2**20))),
    r_256_273 * neg_f_236_low60_20_low20_0 + s_256_273 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_17 + u_256_273 * (const 64 (2**21)) + v_256_273 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_17 + r_256_273 * (const 64 (2**21)) + s_256_273 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_17,
    neg_f_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_17,
    neg_g_236_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 273)) <=s delta, delta <=s (const 64 (1 + 2*273)),
    (const 64 (-(2**20))) <=s u_256_273, u_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_273, v_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_273, r_256_273 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_273, s_256_273 <=s (const 64 ((2**20))),
    u_256_273 + v_256_273 <=s (const 64 (2**20)),
    u_256_273 - v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 + v_256_273 <=s (const 64 (2**20)),
    (const 64 0) - u_256_273 - v_256_273 <=s (const 64 (2**20)),
    r_256_273 + s_256_273 <=s (const 64 (2**20)),
    r_256_273 - s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 + s_256_273 <=s (const 64 (2**20)),
    (const 64 0) - r_256_273 - s_256_273 <=s (const 64 (2**20)),
    u_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_256_273 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_256_273 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise c
assume
neg_g_236_low60_20_low20_17 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_18 neg_g_236_low60_20_low20_17;
mov u_256_274 r_256_273;
mov v_256_274 s_256_273;

subs dc neg_g_236_low60_20_low20_18 neg_g_236_low60_20_low20_17 neg_f_236_low60_20_low20_17;
asr neg_g_236_low60_20_low20_18 neg_g_236_low60_20_low20_18 1;
subs dc r_256_274 r_256_273 u_256_273;
asr r_256_274 r_256_274 1;
subs dc s_256_274 s_256_273 v_256_273;
asr s_256_274 s_256_274 1;
assert
    true
&&
    neg_f_236_low60_20_low20_18 = neg_g_236_low60_20_low20_17,
    u_256_274 = r_256_273,
    v_256_274 = s_256_273,
    neg_g_236_low60_20_low20_18 * (const 64 2) = neg_g_236_low60_20_low20_17 - neg_f_236_low60_20_low20_17,
    r_256_274 * (const 64 2) = r_256_273 - u_256_273,
    s_256_274 * (const 64 2) = s_256_273 - v_256_273
;

assume
    neg_f_236_low60_20_low20_18 = neg_g_236_low60_20_low20_17,
    u_256_274 = r_256_273,
    v_256_274 = s_256_273,
    neg_g_236_low60_20_low20_18 * 2 = neg_g_236_low60_20_low20_17 - neg_f_236_low60_20_low20_17,
    r_256_274 * 2 = r_256_273 - u_256_273,
    s_256_274 * 2 = s_256_273 - v_256_273
&&
    true
;

{
    u_256_274 * neg_f_236_low60_20_low20_0 + v_256_274 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_274 * neg_f_236_low60_20_low20_0 + s_256_274 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_18 + u_256_274 * (const 64 (2**21)) + v_256_274 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_18 + r_256_274 * (const 64 (2**21)) + s_256_274 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_18,
    neg_f_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_18,
    neg_g_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 274)) <=s delta, delta <=s (const 64 (1 + 2*274)),
    (const 64 (-(2**20))) <=s u_256_274, u_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_274, v_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_274, r_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_274, s_256_274 <=s (const 64 ((2**20))),
    u_256_274 + v_256_274 <=s (const 64 (2**20)),
    u_256_274 - v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 + v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 - v_256_274 <=s (const 64 (2**20)),
    r_256_274 + s_256_274 <=s (const 64 (2**20)),
    r_256_274 - s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 + s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 - s_256_274 <=s (const 64 (2**20)),
    u_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_256_274 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_274_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_18,
sint64 neg_g_236_low60_20_low20_18,
sint64 neg_f_236_low60_20_low20_19,
sint64 neg_g_236_low60_20_low20_19,
sint64 u_256_274,
sint64 v_256_274,
sint64 r_256_274,
sint64 s_256_274,
sint64 u_256_275,
sint64 v_256_275,
sint64 r_256_275,
sint64 s_256_275,
bit ne
)={
    u_256_274 * neg_f_236_low60_20_low20_0 + v_256_274 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_18 * (-(2**20)),
    r_256_274 * neg_f_236_low60_20_low20_0 + s_256_274 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_18 * (-(2**20))
&&
    u_256_274 * neg_f_236_low60_20_low20_0 + v_256_274 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_18 * (const 64 (-(2**20))),
    r_256_274 * neg_f_236_low60_20_low20_0 + s_256_274 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_18 + u_256_274 * (const 64 (2**21)) + v_256_274 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_18 + r_256_274 * (const 64 (2**21)) + s_256_274 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_18,
    neg_f_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_18,
    neg_g_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 274)) <=s delta, delta <=s (const 64 (1 + 2*274)),
    (const 64 (-(2**20))) <=s u_256_274, u_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_274, v_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_274, r_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_274, s_256_274 <=s (const 64 ((2**20))),
    u_256_274 + v_256_274 <=s (const 64 (2**20)),
    u_256_274 - v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 + v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 - v_256_274 <=s (const 64 (2**20)),
    r_256_274 + s_256_274 <=s (const 64 (2**20)),
    r_256_274 - s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 + s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 - s_256_274 <=s (const 64 (2**20)),
    u_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_256_274 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise a
assume
neg_g_236_low60_20_low20_18 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_19 neg_f_236_low60_20_low20_18;
mov u_256_275 u_256_274;
mov v_256_275 v_256_274;

asr neg_g_236_low60_20_low20_19 neg_g_236_low60_20_low20_18 1;
asr r_256_275 r_256_274 1;
asr s_256_275 s_256_274 1;
assert
    true
&&
    neg_f_236_low60_20_low20_19 = neg_f_236_low60_20_low20_18,
    u_256_275 = u_256_274,
    v_256_275 = v_256_274,
    neg_g_236_low60_20_low20_19 * (const 64 2) = neg_g_236_low60_20_low20_18,
    r_256_275 * (const 64 2) = r_256_274,
    s_256_275 * (const 64 2) = s_256_274
;

assume
    neg_f_236_low60_20_low20_19 = neg_f_236_low60_20_low20_18,
    u_256_275 = u_256_274,
    v_256_275 = v_256_274,
    neg_g_236_low60_20_low20_19 * 2 = neg_g_236_low60_20_low20_18,
    r_256_275 * 2 = r_256_274,
    s_256_275 * 2 = s_256_274
&&
    true
;

{
    u_256_275 * neg_f_236_low60_20_low20_0 + v_256_275 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_275 * neg_f_236_low60_20_low20_0 + s_256_275 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_19 + u_256_275 * (const 64 (2**21)) + v_256_275 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_19 + r_256_275 * (const 64 (2**21)) + s_256_275 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_19,
    neg_f_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_19,
    neg_g_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 275)) <=s delta, delta <=s (const 64 (1 + 2*275)),
    (const 64 (-(2**20))) <=s u_256_275, u_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_275, v_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_275, r_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_275, s_256_275 <=s (const 64 ((2**20))),
    u_256_275 + v_256_275 <=s (const 64 (2**20)),
    u_256_275 - v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 + v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 - v_256_275 <=s (const 64 (2**20)),
    r_256_275 + s_256_275 <=s (const 64 (2**20)),
    r_256_275 - s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 + s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 - s_256_275 <=s (const 64 (2**20)),
    u_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_256_275 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_274_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_18,
sint64 neg_g_236_low60_20_low20_18,
sint64 neg_f_236_low60_20_low20_19,
sint64 neg_g_236_low60_20_low20_19,
sint64 u_256_274,
sint64 v_256_274,
sint64 r_256_274,
sint64 s_256_274,
sint64 u_256_275,
sint64 v_256_275,
sint64 r_256_275,
sint64 s_256_275,
bit ne
)={
    u_256_274 * neg_f_236_low60_20_low20_0 + v_256_274 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_18 * (-(2**20)),
    r_256_274 * neg_f_236_low60_20_low20_0 + s_256_274 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_18 * (-(2**20))
&&
    u_256_274 * neg_f_236_low60_20_low20_0 + v_256_274 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_18 * (const 64 (-(2**20))),
    r_256_274 * neg_f_236_low60_20_low20_0 + s_256_274 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_18 + u_256_274 * (const 64 (2**21)) + v_256_274 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_18 + r_256_274 * (const 64 (2**21)) + s_256_274 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_18,
    neg_f_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_18,
    neg_g_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 274)) <=s delta, delta <=s (const 64 (1 + 2*274)),
    (const 64 (-(2**20))) <=s u_256_274, u_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_274, v_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_274, r_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_274, s_256_274 <=s (const 64 ((2**20))),
    u_256_274 + v_256_274 <=s (const 64 (2**20)),
    u_256_274 - v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 + v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 - v_256_274 <=s (const 64 (2**20)),
    r_256_274 + s_256_274 <=s (const 64 (2**20)),
    r_256_274 - s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 + s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 - s_256_274 <=s (const 64 (2**20)),
    u_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_256_274 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise b
assume
neg_g_236_low60_20_low20_18 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_19 neg_f_236_low60_20_low20_18;
mov u_256_275 u_256_274;
mov v_256_275 v_256_274;

add neg_g_236_low60_20_low20_19 neg_g_236_low60_20_low20_18 neg_f_236_low60_20_low20_18;
asr neg_g_236_low60_20_low20_19 neg_g_236_low60_20_low20_19 1;
add r_256_275 r_256_274 u_256_274;
asr r_256_275 r_256_275 1;
add s_256_275 s_256_274 v_256_274;
asr s_256_275 s_256_275 1;
assert
    true
&&
    neg_f_236_low60_20_low20_19 = neg_f_236_low60_20_low20_18,
    u_256_275 = u_256_274,
    v_256_275 = v_256_274,
    neg_g_236_low60_20_low20_19 * (const 64 2) = neg_g_236_low60_20_low20_18 + neg_f_236_low60_20_low20_18,
    r_256_275 * (const 64 2) = r_256_274 + u_256_274,
    s_256_275 * (const 64 2) = s_256_274 + v_256_274
;

assume
    neg_f_236_low60_20_low20_19 = neg_f_236_low60_20_low20_18,
    u_256_275 = u_256_274,
    v_256_275 = v_256_274,
    neg_g_236_low60_20_low20_19 * 2 = neg_g_236_low60_20_low20_18 + neg_f_236_low60_20_low20_18,
    r_256_275 * 2 = r_256_274 + u_256_274,
    s_256_275 * 2 = s_256_274 + v_256_274
&&
    true
;

{
    u_256_275 * neg_f_236_low60_20_low20_0 + v_256_275 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_275 * neg_f_236_low60_20_low20_0 + s_256_275 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_19 + u_256_275 * (const 64 (2**21)) + v_256_275 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_19 + r_256_275 * (const 64 (2**21)) + s_256_275 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_19,
    neg_f_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_19,
    neg_g_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 275)) <=s delta, delta <=s (const 64 (1 + 2*275)),
    (const 64 (-(2**20))) <=s u_256_275, u_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_275, v_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_275, r_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_275, s_256_275 <=s (const 64 ((2**20))),
    u_256_275 + v_256_275 <=s (const 64 (2**20)),
    u_256_275 - v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 + v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 - v_256_275 <=s (const 64 (2**20)),
    r_256_275 + s_256_275 <=s (const 64 (2**20)),
    r_256_275 - s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 + s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 - s_256_275 <=s (const 64 (2**20)),
    u_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_256_275 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_274_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_18,
sint64 neg_g_236_low60_20_low20_18,
sint64 neg_f_236_low60_20_low20_19,
sint64 neg_g_236_low60_20_low20_19,
sint64 u_256_274,
sint64 v_256_274,
sint64 r_256_274,
sint64 s_256_274,
sint64 u_256_275,
sint64 v_256_275,
sint64 r_256_275,
sint64 s_256_275,
bit ne
)={
    u_256_274 * neg_f_236_low60_20_low20_0 + v_256_274 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_18 * (-(2**20)),
    r_256_274 * neg_f_236_low60_20_low20_0 + s_256_274 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_18 * (-(2**20))
&&
    u_256_274 * neg_f_236_low60_20_low20_0 + v_256_274 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_18 * (const 64 (-(2**20))),
    r_256_274 * neg_f_236_low60_20_low20_0 + s_256_274 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_18 + u_256_274 * (const 64 (2**21)) + v_256_274 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_18 + r_256_274 * (const 64 (2**21)) + s_256_274 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_18,
    neg_f_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_18,
    neg_g_236_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 274)) <=s delta, delta <=s (const 64 (1 + 2*274)),
    (const 64 (-(2**20))) <=s u_256_274, u_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_274, v_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_274, r_256_274 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_274, s_256_274 <=s (const 64 ((2**20))),
    u_256_274 + v_256_274 <=s (const 64 (2**20)),
    u_256_274 - v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 + v_256_274 <=s (const 64 (2**20)),
    (const 64 0) - u_256_274 - v_256_274 <=s (const 64 (2**20)),
    r_256_274 + s_256_274 <=s (const 64 (2**20)),
    r_256_274 - s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 + s_256_274 <=s (const 64 (2**20)),
    (const 64 0) - r_256_274 - s_256_274 <=s (const 64 (2**20)),
    u_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_256_274 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_256_274 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise c
assume
neg_g_236_low60_20_low20_18 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_19 neg_g_236_low60_20_low20_18;
mov u_256_275 r_256_274;
mov v_256_275 s_256_274;

subs dc neg_g_236_low60_20_low20_19 neg_g_236_low60_20_low20_18 neg_f_236_low60_20_low20_18;
asr neg_g_236_low60_20_low20_19 neg_g_236_low60_20_low20_19 1;
subs dc r_256_275 r_256_274 u_256_274;
asr r_256_275 r_256_275 1;
subs dc s_256_275 s_256_274 v_256_274;
asr s_256_275 s_256_275 1;
assert
    true
&&
    neg_f_236_low60_20_low20_19 = neg_g_236_low60_20_low20_18,
    u_256_275 = r_256_274,
    v_256_275 = s_256_274,
    neg_g_236_low60_20_low20_19 * (const 64 2) = neg_g_236_low60_20_low20_18 - neg_f_236_low60_20_low20_18,
    r_256_275 * (const 64 2) = r_256_274 - u_256_274,
    s_256_275 * (const 64 2) = s_256_274 - v_256_274
;

assume
    neg_f_236_low60_20_low20_19 = neg_g_236_low60_20_low20_18,
    u_256_275 = r_256_274,
    v_256_275 = s_256_274,
    neg_g_236_low60_20_low20_19 * 2 = neg_g_236_low60_20_low20_18 - neg_f_236_low60_20_low20_18,
    r_256_275 * 2 = r_256_274 - u_256_274,
    s_256_275 * 2 = s_256_274 - v_256_274
&&
    true
;

{
    u_256_275 * neg_f_236_low60_20_low20_0 + v_256_275 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_275 * neg_f_236_low60_20_low20_0 + s_256_275 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_19 + u_256_275 * (const 64 (2**21)) + v_256_275 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_19 + r_256_275 * (const 64 (2**21)) + s_256_275 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_19,
    neg_f_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_19,
    neg_g_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 275)) <=s delta, delta <=s (const 64 (1 + 2*275)),
    (const 64 (-(2**20))) <=s u_256_275, u_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_275, v_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_275, r_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_275, s_256_275 <=s (const 64 ((2**20))),
    u_256_275 + v_256_275 <=s (const 64 (2**20)),
    u_256_275 - v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 + v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 - v_256_275 <=s (const 64 (2**20)),
    r_256_275 + s_256_275 <=s (const 64 (2**20)),
    r_256_275 - s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 + s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 - s_256_275 <=s (const 64 (2**20)),
    u_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_256_275 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_275_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_19,
sint64 neg_g_236_low60_20_low20_19,
sint64 neg_f_236_low60_20_low20_20,
sint64 neg_g_236_low60_20_low20_20,
sint64 u_256_275,
sint64 v_256_275,
sint64 r_256_275,
sint64 s_256_275,
sint64 u_256_276,
sint64 v_256_276,
sint64 r_256_276,
sint64 s_256_276,
bit ne
)={
    u_256_275 * neg_f_236_low60_20_low20_0 + v_256_275 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_19 * (-(2**20)),
    r_256_275 * neg_f_236_low60_20_low20_0 + s_256_275 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_19 * (-(2**20))
&&
    u_256_275 * neg_f_236_low60_20_low20_0 + v_256_275 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_19 * (const 64 (-(2**20))),
    r_256_275 * neg_f_236_low60_20_low20_0 + s_256_275 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_19 + u_256_275 * (const 64 (2**21)) + v_256_275 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_19 + r_256_275 * (const 64 (2**21)) + s_256_275 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_19,
    neg_f_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_19,
    neg_g_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 275)) <=s delta, delta <=s (const 64 (1 + 2*275)),
    (const 64 (-(2**20))) <=s u_256_275, u_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_275, v_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_275, r_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_275, s_256_275 <=s (const 64 ((2**20))),
    u_256_275 + v_256_275 <=s (const 64 (2**20)),
    u_256_275 - v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 + v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 - v_256_275 <=s (const 64 (2**20)),
    r_256_275 + s_256_275 <=s (const 64 (2**20)),
    r_256_275 - s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 + s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 - s_256_275 <=s (const 64 (2**20)),
    u_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_256_275 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise a
assume
neg_g_236_low60_20_low20_19 = 0 (mod 2)
&&
neg_g_236_low60_20_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_236_low60_20_low20_20 neg_f_236_low60_20_low20_19;
mov u_256_276 u_256_275;
mov v_256_276 v_256_275;

asr neg_g_236_low60_20_low20_20 neg_g_236_low60_20_low20_19 1;
asr r_256_276 r_256_275 1;
asr s_256_276 s_256_275 1;
assert
    true
&&
    neg_f_236_low60_20_low20_20 = neg_f_236_low60_20_low20_19,
    u_256_276 = u_256_275,
    v_256_276 = v_256_275,
    neg_g_236_low60_20_low20_20 * (const 64 2) = neg_g_236_low60_20_low20_19,
    r_256_276 * (const 64 2) = r_256_275,
    s_256_276 * (const 64 2) = s_256_275
;

assume
    neg_f_236_low60_20_low20_20 = neg_f_236_low60_20_low20_19,
    u_256_276 = u_256_275,
    v_256_276 = v_256_275,
    neg_g_236_low60_20_low20_20 * 2 = neg_g_236_low60_20_low20_19,
    r_256_276 * 2 = r_256_275,
    s_256_276 * 2 = s_256_275
&&
    true
;

{
    u_256_276 * neg_f_236_low60_20_low20_0 + v_256_276 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_276 * neg_f_236_low60_20_low20_0 + s_256_276 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_20 + u_256_276 * (const 64 (2**21)) + v_256_276 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_20 + r_256_276 * (const 64 (2**21)) + s_256_276 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_20,
    neg_f_236_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_20,
    neg_g_236_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 276)) <=s delta, delta <=s (const 64 (1 + 2*276)),
    (const 64 (-(2**20))) <=s u_256_276, u_256_276 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_276, v_256_276 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_276, r_256_276 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_276, s_256_276 <=s (const 64 ((2**20))),
    u_256_276 + v_256_276 <=s (const 64 (2**20)),
    u_256_276 - v_256_276 <=s (const 64 (2**20)),
    (const 64 0) - u_256_276 + v_256_276 <=s (const 64 (2**20)),
    (const 64 0) - u_256_276 - v_256_276 <=s (const 64 (2**20)),
    r_256_276 + s_256_276 <=s (const 64 (2**20)),
    r_256_276 - s_256_276 <=s (const 64 (2**20)),
    (const 64 0) - r_256_276 + s_256_276 <=s (const 64 (2**20)),
    (const 64 0) - r_256_276 - s_256_276 <=s (const 64 (2**20)),
    u_256_276 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_256_276 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_256_276 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_256_276 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_275_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_19,
sint64 neg_g_236_low60_20_low20_19,
sint64 neg_f_236_low60_20_low20_20,
sint64 neg_g_236_low60_20_low20_20,
sint64 u_256_275,
sint64 v_256_275,
sint64 r_256_275,
sint64 s_256_275,
sint64 u_256_276,
sint64 v_256_276,
sint64 r_256_276,
sint64 s_256_276,
bit ne
)={
    u_256_275 * neg_f_236_low60_20_low20_0 + v_256_275 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_19 * (-(2**20)),
    r_256_275 * neg_f_236_low60_20_low20_0 + s_256_275 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_19 * (-(2**20))
&&
    u_256_275 * neg_f_236_low60_20_low20_0 + v_256_275 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_19 * (const 64 (-(2**20))),
    r_256_275 * neg_f_236_low60_20_low20_0 + s_256_275 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_19 + u_256_275 * (const 64 (2**21)) + v_256_275 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_19 + r_256_275 * (const 64 (2**21)) + s_256_275 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_19,
    neg_f_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_19,
    neg_g_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 275)) <=s delta, delta <=s (const 64 (1 + 2*275)),
    (const 64 (-(2**20))) <=s u_256_275, u_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_275, v_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_275, r_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_275, s_256_275 <=s (const 64 ((2**20))),
    u_256_275 + v_256_275 <=s (const 64 (2**20)),
    u_256_275 - v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 + v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 - v_256_275 <=s (const 64 (2**20)),
    r_256_275 + s_256_275 <=s (const 64 (2**20)),
    r_256_275 - s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 + s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 - s_256_275 <=s (const 64 (2**20)),
    u_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_256_275 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise b
assume
neg_g_236_low60_20_low20_19 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_20 neg_f_236_low60_20_low20_19;
mov u_256_276 u_256_275;
mov v_256_276 v_256_275;

add neg_g_236_low60_20_low20_20 neg_g_236_low60_20_low20_19 neg_f_236_low60_20_low20_19;
asr neg_g_236_low60_20_low20_20 neg_g_236_low60_20_low20_20 1;
add r_256_276 r_256_275 u_256_275;
asr r_256_276 r_256_276 1;
add s_256_276 s_256_275 v_256_275;
asr s_256_276 s_256_276 1;
assert
    true
&&
    neg_f_236_low60_20_low20_20 = neg_f_236_low60_20_low20_19,
    u_256_276 = u_256_275,
    v_256_276 = v_256_275,
    neg_g_236_low60_20_low20_20 * (const 64 2) = neg_g_236_low60_20_low20_19 + neg_f_236_low60_20_low20_19,
    r_256_276 * (const 64 2) = r_256_275 + u_256_275,
    s_256_276 * (const 64 2) = s_256_275 + v_256_275
;

assume
    neg_f_236_low60_20_low20_20 = neg_f_236_low60_20_low20_19,
    u_256_276 = u_256_275,
    v_256_276 = v_256_275,
    neg_g_236_low60_20_low20_20 * 2 = neg_g_236_low60_20_low20_19 + neg_f_236_low60_20_low20_19,
    r_256_276 * 2 = r_256_275 + u_256_275,
    s_256_276 * 2 = s_256_275 + v_256_275
&&
    true
;

{
    u_256_276 * neg_f_236_low60_20_low20_0 + v_256_276 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_276 * neg_f_236_low60_20_low20_0 + s_256_276 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_20 + u_256_276 * (const 64 (2**21)) + v_256_276 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_20 + r_256_276 * (const 64 (2**21)) + s_256_276 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_20,
    neg_f_236_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_20,
    neg_g_236_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 276)) <=s delta, delta <=s (const 64 (1 + 2*276)),
    (const 64 (-(2**20))) <=s u_256_276, u_256_276 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_276, v_256_276 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_276, r_256_276 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_276, s_256_276 <=s (const 64 ((2**20))),
    u_256_276 + v_256_276 <=s (const 64 (2**20)),
    u_256_276 - v_256_276 <=s (const 64 (2**20)),
    (const 64 0) - u_256_276 + v_256_276 <=s (const 64 (2**20)),
    (const 64 0) - u_256_276 - v_256_276 <=s (const 64 (2**20)),
    r_256_276 + s_256_276 <=s (const 64 (2**20)),
    r_256_276 - s_256_276 <=s (const 64 (2**20)),
    (const 64 0) - r_256_276 + s_256_276 <=s (const 64 (2**20)),
    (const 64 0) - r_256_276 - s_256_276 <=s (const 64 (2**20)),
    u_256_276 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_256_276 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_256_276 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_256_276 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_275_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_236_low60_20_low20_0,
sint64 neg_g_236_low60_20_low20_0,
sint64 neg_f_236_low60_20_low20_19,
sint64 neg_g_236_low60_20_low20_19,
sint64 neg_f_236_low60_20_low20_20,
sint64 neg_g_236_low60_20_low20_20,
sint64 u_256_275,
sint64 v_256_275,
sint64 r_256_275,
sint64 s_256_275,
sint64 u_256_276,
sint64 v_256_276,
sint64 r_256_276,
sint64 s_256_276,
bit ne
)={
    u_256_275 * neg_f_236_low60_20_low20_0 + v_256_275 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_19 * (-(2**20)),
    r_256_275 * neg_f_236_low60_20_low20_0 + s_256_275 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_19 * (-(2**20))
&&
    u_256_275 * neg_f_236_low60_20_low20_0 + v_256_275 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_19 * (const 64 (-(2**20))),
    r_256_275 * neg_f_236_low60_20_low20_0 + s_256_275 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_236_low60_20_low20_19 + u_256_275 * (const 64 (2**21)) + v_256_275 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_19 + r_256_275 * (const 64 (2**21)) + s_256_275 * (const 64 (2**42)),
    const 64 0 <=s neg_f_236_low60_20_low20_0,
    neg_f_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_0,
    neg_g_236_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_236_low60_20_low20_19,
    neg_f_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_236_low60_20_low20_19,
    neg_g_236_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 275)) <=s delta, delta <=s (const 64 (1 + 2*275)),
    (const 64 (-(2**20))) <=s u_256_275, u_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_275, v_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_275, r_256_275 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_275, s_256_275 <=s (const 64 ((2**20))),
    u_256_275 + v_256_275 <=s (const 64 (2**20)),
    u_256_275 - v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 + v_256_275 <=s (const 64 (2**20)),
    (const 64 0) - u_256_275 - v_256_275 <=s (const 64 (2**20)),
    r_256_275 + s_256_275 <=s (const 64 (2**20)),
    r_256_275 - s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 + s_256_275 <=s (const 64 (2**20)),
    (const 64 0) - r_256_275 - s_256_275 <=s (const 64 (2**20)),
    u_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_256_275 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_256_275 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise c
assume
neg_g_236_low60_20_low20_19 = 1 (mod 2)
&&
neg_g_236_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_236_low60_20_low20_20 neg_g_236_low60_20_low20_19;
mov u_256_276 r_256_275;
mov v_256_276 s_256_275;

subs dc neg_g_236_low60_20_low20_20 neg_g_236_low60_20_low20_19 neg_f_236_low60_20_low20_19;
asr neg_g_236_low60_20_low20_20 neg_g_236_low60_20_low20_20 1;
subs dc r_256_276 r_256_275 u_256_275;
asr r_256_276 r_256_276 1;
subs dc s_256_276 s_256_275 v_256_275;
asr s_256_276 s_256_276 1;
assert
    true
&&
    neg_f_236_low60_20_low20_20 = neg_g_236_low60_20_low20_19,
    u_256_276 = r_256_275,
    v_256_276 = s_256_275,
    neg_g_236_low60_20_low20_20 * (const 64 2) = neg_g_236_low60_20_low20_19 - neg_f_236_low60_20_low20_19,
    r_256_276 * (const 64 2) = r_256_275 - u_256_275,
    s_256_276 * (const 64 2) = s_256_275 - v_256_275
;

assume
    neg_f_236_low60_20_low20_20 = neg_g_236_low60_20_low20_19,
    u_256_276 = r_256_275,
    v_256_276 = s_256_275,
    neg_g_236_low60_20_low20_20 * 2 = neg_g_236_low60_20_low20_19 - neg_f_236_low60_20_low20_19,
    r_256_276 * 2 = r_256_275 - u_256_275,
    s_256_276 * 2 = s_256_275 - v_256_275
&&
    true
;

{
    u_256_276 * neg_f_236_low60_20_low20_0 + v_256_276 * neg_g_236_low60_20_low20_0 = neg_f_236_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_256_276 * neg_f_236_low60_20_low20_0 + s_256_276 * neg_g_236_low60_20_low20_0 = neg_g_236_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_236_low60_20_low20_20 + u_256_276 * (const 64 (2**21)) + v_256_276 * (const 64 (2**42)),
    grs = neg_g_236_low60_20_low20_20 + r_256_276 * (const 64 (2**21)) + s_256_276 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_236_low60_20_low20_20,
    neg_f_236_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_236_low60_20_low20_20,
    neg_g_236_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 276)) <=s delta, delta <=s (const 64 (1 + 2*276)),
    (const 64 (-(2**20))) <=s u_256_276, u_256_276 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_256_276, v_256_276 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_256_276, r_256_276 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_256_276, s_256_276 <=s (const 64 ((2**20))),
    u_256_276 + v_256_276 <=s (const 64 (2**20)),
    u_256_276 - v_256_276 <=s (const 64 (2**20)),
    (const 64 0) - u_256_276 + v_256_276 <=s (const 64 (2**20)),
    (const 64 0) - u_256_276 - v_256_276 <=s (const 64 (2**20)),
    r_256_276 + s_256_276 <=s (const 64 (2**20)),
    r_256_276 - s_256_276 <=s (const 64 (2**20)),
    (const 64 0) - r_256_276 + s_256_276 <=s (const 64 (2**20)),
    (const 64 0) - r_256_276 - s_256_276 <=s (const 64 (2**20)),
    u_256_276 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_256_276 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_256_276 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_256_276 = (const 64 0) (mod (const 64 (2**(20-20))))
}

