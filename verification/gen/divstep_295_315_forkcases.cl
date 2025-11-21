proc divstep_295_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_1,
sint64 neg_g_295_low60_0_low20_1,
sint64 u_295_295,
sint64 v_295_295,
sint64 r_295_295,
sint64 s_295_295,
sint64 u_295_296,
sint64 v_295_296,
sint64 r_295_296,
sint64 s_295_296,
bit ne
)={
    u_295_295 * neg_f_295_low60_0_low20_0 + v_295_295 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_0 * (-(2**20)),
    r_295_295 * neg_f_295_low60_0_low20_0 + s_295_295 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_0 * (-(2**20))
&&
    u_295_295 * neg_f_295_low60_0_low20_0 + v_295_295 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_0 * (const 64 (-(2**20))),
    r_295_295 * neg_f_295_low60_0_low20_0 + s_295_295 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_0 + u_295_295 * (const 64 (2**21)) + v_295_295 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_0 + r_295_295 * (const 64 (2**21)) + s_295_295 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 295)) <=s delta, delta <=s (const 64 (1 + 2*295)),
    u_295_295 = (const 64 (-(2**20))),
    v_295_295 = (const 64 (0)),
    r_295_295 = (const 64 (0)),
    s_295_295 = (const 64 (-(2**20)))
}



// divsteps
// step295

// premise a
assume
neg_g_295_low60_0_low20_0 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_295_low60_0_low20_1 neg_f_295_low60_0_low20_0;
mov u_295_296 u_295_295;
mov v_295_296 v_295_295;

asr neg_g_295_low60_0_low20_1 neg_g_295_low60_0_low20_0 1;
asr r_295_296 r_295_295 1;
asr s_295_296 s_295_295 1;
assert
    true
&&
    neg_f_295_low60_0_low20_1 = neg_f_295_low60_0_low20_0,
    u_295_296 = u_295_295,
    v_295_296 = v_295_295,
    neg_g_295_low60_0_low20_1 * (const 64 2) = neg_g_295_low60_0_low20_0,
    r_295_296 * (const 64 2) = r_295_295,
    s_295_296 * (const 64 2) = s_295_295
;

assume
    neg_f_295_low60_0_low20_1 = neg_f_295_low60_0_low20_0,
    u_295_296 = u_295_295,
    v_295_296 = v_295_295,
    neg_g_295_low60_0_low20_1 * 2 = neg_g_295_low60_0_low20_0,
    r_295_296 * 2 = r_295_295,
    s_295_296 * 2 = s_295_295
&&
    true
;

{
    u_295_296 * neg_f_295_low60_0_low20_0 + v_295_296 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_296 * neg_f_295_low60_0_low20_0 + s_295_296 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_1 + u_295_296 * (const 64 (2**21)) + v_295_296 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_1 + r_295_296 * (const 64 (2**21)) + s_295_296 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_1,
    neg_f_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_1,
    neg_g_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 296)) <=s delta, delta <=s (const 64 (1 + 2*296)),
    (const 64 (-(2**20))) <=s u_295_296, u_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_296, v_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_296, r_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_296, s_295_296 <=s (const 64 ((2**20))),
    u_295_296 + v_295_296 <=s (const 64 (2**20)),
    u_295_296 - v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 + v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 - v_295_296 <=s (const 64 (2**20)),
    r_295_296 + s_295_296 <=s (const 64 (2**20)),
    r_295_296 - s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 + s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 - s_295_296 <=s (const 64 (2**20)),
    u_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_295_296 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_295_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_1,
sint64 neg_g_295_low60_0_low20_1,
sint64 u_295_295,
sint64 v_295_295,
sint64 r_295_295,
sint64 s_295_295,
sint64 u_295_296,
sint64 v_295_296,
sint64 r_295_296,
sint64 s_295_296,
bit ne
)={
    u_295_295 * neg_f_295_low60_0_low20_0 + v_295_295 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_0 * (-(2**20)),
    r_295_295 * neg_f_295_low60_0_low20_0 + s_295_295 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_0 * (-(2**20))
&&
    u_295_295 * neg_f_295_low60_0_low20_0 + v_295_295 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_0 * (const 64 (-(2**20))),
    r_295_295 * neg_f_295_low60_0_low20_0 + s_295_295 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_0 + u_295_295 * (const 64 (2**21)) + v_295_295 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_0 + r_295_295 * (const 64 (2**21)) + s_295_295 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 295)) <=s delta, delta <=s (const 64 (1 + 2*295)),
    u_295_295 = (const 64 (-(2**20))),
    v_295_295 = (const 64 (0)),
    r_295_295 = (const 64 (0)),
    s_295_295 = (const 64 (-(2**20)))
}



// divsteps
// step295

// premise b
assume
neg_g_295_low60_0_low20_0 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_1 neg_f_295_low60_0_low20_0;
mov u_295_296 u_295_295;
mov v_295_296 v_295_295;

add neg_g_295_low60_0_low20_1 neg_g_295_low60_0_low20_0 neg_f_295_low60_0_low20_0;
asr neg_g_295_low60_0_low20_1 neg_g_295_low60_0_low20_1 1;
add r_295_296 r_295_295 u_295_295;
asr r_295_296 r_295_296 1;
add s_295_296 s_295_295 v_295_295;
asr s_295_296 s_295_296 1;
assert
    true
&&
    neg_f_295_low60_0_low20_1 = neg_f_295_low60_0_low20_0,
    u_295_296 = u_295_295,
    v_295_296 = v_295_295,
    neg_g_295_low60_0_low20_1 * (const 64 2) = neg_g_295_low60_0_low20_0 + neg_f_295_low60_0_low20_0,
    r_295_296 * (const 64 2) = r_295_295 + u_295_295,
    s_295_296 * (const 64 2) = s_295_295 + v_295_295
;

assume
    neg_f_295_low60_0_low20_1 = neg_f_295_low60_0_low20_0,
    u_295_296 = u_295_295,
    v_295_296 = v_295_295,
    neg_g_295_low60_0_low20_1 * 2 = neg_g_295_low60_0_low20_0 + neg_f_295_low60_0_low20_0,
    r_295_296 * 2 = r_295_295 + u_295_295,
    s_295_296 * 2 = s_295_295 + v_295_295
&&
    true
;

{
    u_295_296 * neg_f_295_low60_0_low20_0 + v_295_296 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_296 * neg_f_295_low60_0_low20_0 + s_295_296 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_1 + u_295_296 * (const 64 (2**21)) + v_295_296 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_1 + r_295_296 * (const 64 (2**21)) + s_295_296 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_1,
    neg_f_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_1,
    neg_g_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 296)) <=s delta, delta <=s (const 64 (1 + 2*296)),
    (const 64 (-(2**20))) <=s u_295_296, u_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_296, v_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_296, r_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_296, s_295_296 <=s (const 64 ((2**20))),
    u_295_296 + v_295_296 <=s (const 64 (2**20)),
    u_295_296 - v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 + v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 - v_295_296 <=s (const 64 (2**20)),
    r_295_296 + s_295_296 <=s (const 64 (2**20)),
    r_295_296 - s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 + s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 - s_295_296 <=s (const 64 (2**20)),
    u_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_295_296 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_295_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_1,
sint64 neg_g_295_low60_0_low20_1,
sint64 u_295_295,
sint64 v_295_295,
sint64 r_295_295,
sint64 s_295_295,
sint64 u_295_296,
sint64 v_295_296,
sint64 r_295_296,
sint64 s_295_296,
bit ne
)={
    u_295_295 * neg_f_295_low60_0_low20_0 + v_295_295 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_0 * (-(2**20)),
    r_295_295 * neg_f_295_low60_0_low20_0 + s_295_295 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_0 * (-(2**20))
&&
    u_295_295 * neg_f_295_low60_0_low20_0 + v_295_295 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_0 * (const 64 (-(2**20))),
    r_295_295 * neg_f_295_low60_0_low20_0 + s_295_295 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_0 + u_295_295 * (const 64 (2**21)) + v_295_295 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_0 + r_295_295 * (const 64 (2**21)) + s_295_295 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 295)) <=s delta, delta <=s (const 64 (1 + 2*295)),
    u_295_295 = (const 64 (-(2**20))),
    v_295_295 = (const 64 (0)),
    r_295_295 = (const 64 (0)),
    s_295_295 = (const 64 (-(2**20)))
}



// divsteps
// step295

// premise c
assume
neg_g_295_low60_0_low20_0 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_1 neg_g_295_low60_0_low20_0;
mov u_295_296 r_295_295;
mov v_295_296 s_295_295;

subs dc neg_g_295_low60_0_low20_1 neg_g_295_low60_0_low20_0 neg_f_295_low60_0_low20_0;
asr neg_g_295_low60_0_low20_1 neg_g_295_low60_0_low20_1 1;
subs dc r_295_296 r_295_295 u_295_295;
asr r_295_296 r_295_296 1;
subs dc s_295_296 s_295_295 v_295_295;
asr s_295_296 s_295_296 1;
assert
    true
&&
    neg_f_295_low60_0_low20_1 = neg_g_295_low60_0_low20_0,
    u_295_296 = r_295_295,
    v_295_296 = s_295_295,
    neg_g_295_low60_0_low20_1 * (const 64 2) = neg_g_295_low60_0_low20_0 - neg_f_295_low60_0_low20_0,
    r_295_296 * (const 64 2) = r_295_295 - u_295_295,
    s_295_296 * (const 64 2) = s_295_295 - v_295_295
;

assume
    neg_f_295_low60_0_low20_1 = neg_g_295_low60_0_low20_0,
    u_295_296 = r_295_295,
    v_295_296 = s_295_295,
    neg_g_295_low60_0_low20_1 * 2 = neg_g_295_low60_0_low20_0 - neg_f_295_low60_0_low20_0,
    r_295_296 * 2 = r_295_295 - u_295_295,
    s_295_296 * 2 = s_295_295 - v_295_295
&&
    true
;

{
    u_295_296 * neg_f_295_low60_0_low20_0 + v_295_296 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_296 * neg_f_295_low60_0_low20_0 + s_295_296 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_1 + u_295_296 * (const 64 (2**21)) + v_295_296 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_1 + r_295_296 * (const 64 (2**21)) + s_295_296 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_1,
    neg_f_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_1,
    neg_g_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 296)) <=s delta, delta <=s (const 64 (1 + 2*296)),
    (const 64 (-(2**20))) <=s u_295_296, u_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_296, v_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_296, r_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_296, s_295_296 <=s (const 64 ((2**20))),
    u_295_296 + v_295_296 <=s (const 64 (2**20)),
    u_295_296 - v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 + v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 - v_295_296 <=s (const 64 (2**20)),
    r_295_296 + s_295_296 <=s (const 64 (2**20)),
    r_295_296 - s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 + s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 - s_295_296 <=s (const 64 (2**20)),
    u_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_295_296 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_296_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_1,
sint64 neg_g_295_low60_0_low20_1,
sint64 neg_f_295_low60_0_low20_2,
sint64 neg_g_295_low60_0_low20_2,
sint64 u_295_296,
sint64 v_295_296,
sint64 r_295_296,
sint64 s_295_296,
sint64 u_295_297,
sint64 v_295_297,
sint64 r_295_297,
sint64 s_295_297,
bit ne
)={
    u_295_296 * neg_f_295_low60_0_low20_0 + v_295_296 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_1 * (-(2**20)),
    r_295_296 * neg_f_295_low60_0_low20_0 + s_295_296 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_1 * (-(2**20))
&&
    u_295_296 * neg_f_295_low60_0_low20_0 + v_295_296 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_1 * (const 64 (-(2**20))),
    r_295_296 * neg_f_295_low60_0_low20_0 + s_295_296 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_1 + u_295_296 * (const 64 (2**21)) + v_295_296 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_1 + r_295_296 * (const 64 (2**21)) + s_295_296 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_1,
    neg_f_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_1,
    neg_g_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 296)) <=s delta, delta <=s (const 64 (1 + 2*296)),
    (const 64 (-(2**20))) <=s u_295_296, u_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_296, v_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_296, r_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_296, s_295_296 <=s (const 64 ((2**20))),
    u_295_296 + v_295_296 <=s (const 64 (2**20)),
    u_295_296 - v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 + v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 - v_295_296 <=s (const 64 (2**20)),
    r_295_296 + s_295_296 <=s (const 64 (2**20)),
    r_295_296 - s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 + s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 - s_295_296 <=s (const 64 (2**20)),
    u_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_295_296 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step296

// premise a
assume
neg_g_295_low60_0_low20_1 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_2 neg_f_295_low60_0_low20_1;
mov u_295_297 u_295_296;
mov v_295_297 v_295_296;

asr neg_g_295_low60_0_low20_2 neg_g_295_low60_0_low20_1 1;
asr r_295_297 r_295_296 1;
asr s_295_297 s_295_296 1;
assert
    true
&&
    neg_f_295_low60_0_low20_2 = neg_f_295_low60_0_low20_1,
    u_295_297 = u_295_296,
    v_295_297 = v_295_296,
    neg_g_295_low60_0_low20_2 * (const 64 2) = neg_g_295_low60_0_low20_1,
    r_295_297 * (const 64 2) = r_295_296,
    s_295_297 * (const 64 2) = s_295_296
;

assume
    neg_f_295_low60_0_low20_2 = neg_f_295_low60_0_low20_1,
    u_295_297 = u_295_296,
    v_295_297 = v_295_296,
    neg_g_295_low60_0_low20_2 * 2 = neg_g_295_low60_0_low20_1,
    r_295_297 * 2 = r_295_296,
    s_295_297 * 2 = s_295_296
&&
    true
;

{
    u_295_297 * neg_f_295_low60_0_low20_0 + v_295_297 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_297 * neg_f_295_low60_0_low20_0 + s_295_297 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_2 + u_295_297 * (const 64 (2**21)) + v_295_297 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_2 + r_295_297 * (const 64 (2**21)) + s_295_297 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_2,
    neg_f_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_2,
    neg_g_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 297)) <=s delta, delta <=s (const 64 (1 + 2*297)),
    (const 64 (-(2**20))) <=s u_295_297, u_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_297, v_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_297, r_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_297, s_295_297 <=s (const 64 ((2**20))),
    u_295_297 + v_295_297 <=s (const 64 (2**20)),
    u_295_297 - v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 + v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 - v_295_297 <=s (const 64 (2**20)),
    r_295_297 + s_295_297 <=s (const 64 (2**20)),
    r_295_297 - s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 + s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 - s_295_297 <=s (const 64 (2**20)),
    u_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_295_297 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_296_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_1,
sint64 neg_g_295_low60_0_low20_1,
sint64 neg_f_295_low60_0_low20_2,
sint64 neg_g_295_low60_0_low20_2,
sint64 u_295_296,
sint64 v_295_296,
sint64 r_295_296,
sint64 s_295_296,
sint64 u_295_297,
sint64 v_295_297,
sint64 r_295_297,
sint64 s_295_297,
bit ne
)={
    u_295_296 * neg_f_295_low60_0_low20_0 + v_295_296 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_1 * (-(2**20)),
    r_295_296 * neg_f_295_low60_0_low20_0 + s_295_296 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_1 * (-(2**20))
&&
    u_295_296 * neg_f_295_low60_0_low20_0 + v_295_296 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_1 * (const 64 (-(2**20))),
    r_295_296 * neg_f_295_low60_0_low20_0 + s_295_296 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_1 + u_295_296 * (const 64 (2**21)) + v_295_296 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_1 + r_295_296 * (const 64 (2**21)) + s_295_296 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_1,
    neg_f_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_1,
    neg_g_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 296)) <=s delta, delta <=s (const 64 (1 + 2*296)),
    (const 64 (-(2**20))) <=s u_295_296, u_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_296, v_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_296, r_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_296, s_295_296 <=s (const 64 ((2**20))),
    u_295_296 + v_295_296 <=s (const 64 (2**20)),
    u_295_296 - v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 + v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 - v_295_296 <=s (const 64 (2**20)),
    r_295_296 + s_295_296 <=s (const 64 (2**20)),
    r_295_296 - s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 + s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 - s_295_296 <=s (const 64 (2**20)),
    u_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_295_296 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step296

// premise b
assume
neg_g_295_low60_0_low20_1 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_2 neg_f_295_low60_0_low20_1;
mov u_295_297 u_295_296;
mov v_295_297 v_295_296;

add neg_g_295_low60_0_low20_2 neg_g_295_low60_0_low20_1 neg_f_295_low60_0_low20_1;
asr neg_g_295_low60_0_low20_2 neg_g_295_low60_0_low20_2 1;
add r_295_297 r_295_296 u_295_296;
asr r_295_297 r_295_297 1;
add s_295_297 s_295_296 v_295_296;
asr s_295_297 s_295_297 1;
assert
    true
&&
    neg_f_295_low60_0_low20_2 = neg_f_295_low60_0_low20_1,
    u_295_297 = u_295_296,
    v_295_297 = v_295_296,
    neg_g_295_low60_0_low20_2 * (const 64 2) = neg_g_295_low60_0_low20_1 + neg_f_295_low60_0_low20_1,
    r_295_297 * (const 64 2) = r_295_296 + u_295_296,
    s_295_297 * (const 64 2) = s_295_296 + v_295_296
;

assume
    neg_f_295_low60_0_low20_2 = neg_f_295_low60_0_low20_1,
    u_295_297 = u_295_296,
    v_295_297 = v_295_296,
    neg_g_295_low60_0_low20_2 * 2 = neg_g_295_low60_0_low20_1 + neg_f_295_low60_0_low20_1,
    r_295_297 * 2 = r_295_296 + u_295_296,
    s_295_297 * 2 = s_295_296 + v_295_296
&&
    true
;

{
    u_295_297 * neg_f_295_low60_0_low20_0 + v_295_297 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_297 * neg_f_295_low60_0_low20_0 + s_295_297 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_2 + u_295_297 * (const 64 (2**21)) + v_295_297 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_2 + r_295_297 * (const 64 (2**21)) + s_295_297 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_2,
    neg_f_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_2,
    neg_g_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 297)) <=s delta, delta <=s (const 64 (1 + 2*297)),
    (const 64 (-(2**20))) <=s u_295_297, u_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_297, v_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_297, r_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_297, s_295_297 <=s (const 64 ((2**20))),
    u_295_297 + v_295_297 <=s (const 64 (2**20)),
    u_295_297 - v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 + v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 - v_295_297 <=s (const 64 (2**20)),
    r_295_297 + s_295_297 <=s (const 64 (2**20)),
    r_295_297 - s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 + s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 - s_295_297 <=s (const 64 (2**20)),
    u_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_295_297 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_296_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_1,
sint64 neg_g_295_low60_0_low20_1,
sint64 neg_f_295_low60_0_low20_2,
sint64 neg_g_295_low60_0_low20_2,
sint64 u_295_296,
sint64 v_295_296,
sint64 r_295_296,
sint64 s_295_296,
sint64 u_295_297,
sint64 v_295_297,
sint64 r_295_297,
sint64 s_295_297,
bit ne
)={
    u_295_296 * neg_f_295_low60_0_low20_0 + v_295_296 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_1 * (-(2**20)),
    r_295_296 * neg_f_295_low60_0_low20_0 + s_295_296 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_1 * (-(2**20))
&&
    u_295_296 * neg_f_295_low60_0_low20_0 + v_295_296 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_1 * (const 64 (-(2**20))),
    r_295_296 * neg_f_295_low60_0_low20_0 + s_295_296 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_1 + u_295_296 * (const 64 (2**21)) + v_295_296 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_1 + r_295_296 * (const 64 (2**21)) + s_295_296 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_1,
    neg_f_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_1,
    neg_g_295_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 296)) <=s delta, delta <=s (const 64 (1 + 2*296)),
    (const 64 (-(2**20))) <=s u_295_296, u_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_296, v_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_296, r_295_296 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_296, s_295_296 <=s (const 64 ((2**20))),
    u_295_296 + v_295_296 <=s (const 64 (2**20)),
    u_295_296 - v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 + v_295_296 <=s (const 64 (2**20)),
    (const 64 0) - u_295_296 - v_295_296 <=s (const 64 (2**20)),
    r_295_296 + s_295_296 <=s (const 64 (2**20)),
    r_295_296 - s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 + s_295_296 <=s (const 64 (2**20)),
    (const 64 0) - r_295_296 - s_295_296 <=s (const 64 (2**20)),
    u_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_295_296 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_295_296 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step296

// premise c
assume
neg_g_295_low60_0_low20_1 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_2 neg_g_295_low60_0_low20_1;
mov u_295_297 r_295_296;
mov v_295_297 s_295_296;

subs dc neg_g_295_low60_0_low20_2 neg_g_295_low60_0_low20_1 neg_f_295_low60_0_low20_1;
asr neg_g_295_low60_0_low20_2 neg_g_295_low60_0_low20_2 1;
subs dc r_295_297 r_295_296 u_295_296;
asr r_295_297 r_295_297 1;
subs dc s_295_297 s_295_296 v_295_296;
asr s_295_297 s_295_297 1;
assert
    true
&&
    neg_f_295_low60_0_low20_2 = neg_g_295_low60_0_low20_1,
    u_295_297 = r_295_296,
    v_295_297 = s_295_296,
    neg_g_295_low60_0_low20_2 * (const 64 2) = neg_g_295_low60_0_low20_1 - neg_f_295_low60_0_low20_1,
    r_295_297 * (const 64 2) = r_295_296 - u_295_296,
    s_295_297 * (const 64 2) = s_295_296 - v_295_296
;

assume
    neg_f_295_low60_0_low20_2 = neg_g_295_low60_0_low20_1,
    u_295_297 = r_295_296,
    v_295_297 = s_295_296,
    neg_g_295_low60_0_low20_2 * 2 = neg_g_295_low60_0_low20_1 - neg_f_295_low60_0_low20_1,
    r_295_297 * 2 = r_295_296 - u_295_296,
    s_295_297 * 2 = s_295_296 - v_295_296
&&
    true
;

{
    u_295_297 * neg_f_295_low60_0_low20_0 + v_295_297 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_297 * neg_f_295_low60_0_low20_0 + s_295_297 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_2 + u_295_297 * (const 64 (2**21)) + v_295_297 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_2 + r_295_297 * (const 64 (2**21)) + s_295_297 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_2,
    neg_f_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_2,
    neg_g_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 297)) <=s delta, delta <=s (const 64 (1 + 2*297)),
    (const 64 (-(2**20))) <=s u_295_297, u_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_297, v_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_297, r_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_297, s_295_297 <=s (const 64 ((2**20))),
    u_295_297 + v_295_297 <=s (const 64 (2**20)),
    u_295_297 - v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 + v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 - v_295_297 <=s (const 64 (2**20)),
    r_295_297 + s_295_297 <=s (const 64 (2**20)),
    r_295_297 - s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 + s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 - s_295_297 <=s (const 64 (2**20)),
    u_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_295_297 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_297_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_2,
sint64 neg_g_295_low60_0_low20_2,
sint64 neg_f_295_low60_0_low20_3,
sint64 neg_g_295_low60_0_low20_3,
sint64 u_295_297,
sint64 v_295_297,
sint64 r_295_297,
sint64 s_295_297,
sint64 u_295_298,
sint64 v_295_298,
sint64 r_295_298,
sint64 s_295_298,
bit ne
)={
    u_295_297 * neg_f_295_low60_0_low20_0 + v_295_297 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_2 * (-(2**20)),
    r_295_297 * neg_f_295_low60_0_low20_0 + s_295_297 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_2 * (-(2**20))
&&
    u_295_297 * neg_f_295_low60_0_low20_0 + v_295_297 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_2 * (const 64 (-(2**20))),
    r_295_297 * neg_f_295_low60_0_low20_0 + s_295_297 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_2 + u_295_297 * (const 64 (2**21)) + v_295_297 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_2 + r_295_297 * (const 64 (2**21)) + s_295_297 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_2,
    neg_f_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_2,
    neg_g_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 297)) <=s delta, delta <=s (const 64 (1 + 2*297)),
    (const 64 (-(2**20))) <=s u_295_297, u_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_297, v_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_297, r_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_297, s_295_297 <=s (const 64 ((2**20))),
    u_295_297 + v_295_297 <=s (const 64 (2**20)),
    u_295_297 - v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 + v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 - v_295_297 <=s (const 64 (2**20)),
    r_295_297 + s_295_297 <=s (const 64 (2**20)),
    r_295_297 - s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 + s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 - s_295_297 <=s (const 64 (2**20)),
    u_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_295_297 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step297

// premise a
assume
neg_g_295_low60_0_low20_2 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_3 neg_f_295_low60_0_low20_2;
mov u_295_298 u_295_297;
mov v_295_298 v_295_297;

asr neg_g_295_low60_0_low20_3 neg_g_295_low60_0_low20_2 1;
asr r_295_298 r_295_297 1;
asr s_295_298 s_295_297 1;
assert
    true
&&
    neg_f_295_low60_0_low20_3 = neg_f_295_low60_0_low20_2,
    u_295_298 = u_295_297,
    v_295_298 = v_295_297,
    neg_g_295_low60_0_low20_3 * (const 64 2) = neg_g_295_low60_0_low20_2,
    r_295_298 * (const 64 2) = r_295_297,
    s_295_298 * (const 64 2) = s_295_297
;

assume
    neg_f_295_low60_0_low20_3 = neg_f_295_low60_0_low20_2,
    u_295_298 = u_295_297,
    v_295_298 = v_295_297,
    neg_g_295_low60_0_low20_3 * 2 = neg_g_295_low60_0_low20_2,
    r_295_298 * 2 = r_295_297,
    s_295_298 * 2 = s_295_297
&&
    true
;

{
    u_295_298 * neg_f_295_low60_0_low20_0 + v_295_298 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_298 * neg_f_295_low60_0_low20_0 + s_295_298 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_3 + u_295_298 * (const 64 (2**21)) + v_295_298 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_3 + r_295_298 * (const 64 (2**21)) + s_295_298 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_3,
    neg_f_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_3,
    neg_g_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 298)) <=s delta, delta <=s (const 64 (1 + 2*298)),
    (const 64 (-(2**20))) <=s u_295_298, u_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_298, v_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_298, r_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_298, s_295_298 <=s (const 64 ((2**20))),
    u_295_298 + v_295_298 <=s (const 64 (2**20)),
    u_295_298 - v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 + v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 - v_295_298 <=s (const 64 (2**20)),
    r_295_298 + s_295_298 <=s (const 64 (2**20)),
    r_295_298 - s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 + s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 - s_295_298 <=s (const 64 (2**20)),
    u_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_295_298 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_297_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_2,
sint64 neg_g_295_low60_0_low20_2,
sint64 neg_f_295_low60_0_low20_3,
sint64 neg_g_295_low60_0_low20_3,
sint64 u_295_297,
sint64 v_295_297,
sint64 r_295_297,
sint64 s_295_297,
sint64 u_295_298,
sint64 v_295_298,
sint64 r_295_298,
sint64 s_295_298,
bit ne
)={
    u_295_297 * neg_f_295_low60_0_low20_0 + v_295_297 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_2 * (-(2**20)),
    r_295_297 * neg_f_295_low60_0_low20_0 + s_295_297 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_2 * (-(2**20))
&&
    u_295_297 * neg_f_295_low60_0_low20_0 + v_295_297 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_2 * (const 64 (-(2**20))),
    r_295_297 * neg_f_295_low60_0_low20_0 + s_295_297 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_2 + u_295_297 * (const 64 (2**21)) + v_295_297 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_2 + r_295_297 * (const 64 (2**21)) + s_295_297 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_2,
    neg_f_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_2,
    neg_g_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 297)) <=s delta, delta <=s (const 64 (1 + 2*297)),
    (const 64 (-(2**20))) <=s u_295_297, u_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_297, v_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_297, r_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_297, s_295_297 <=s (const 64 ((2**20))),
    u_295_297 + v_295_297 <=s (const 64 (2**20)),
    u_295_297 - v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 + v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 - v_295_297 <=s (const 64 (2**20)),
    r_295_297 + s_295_297 <=s (const 64 (2**20)),
    r_295_297 - s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 + s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 - s_295_297 <=s (const 64 (2**20)),
    u_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_295_297 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step297

// premise b
assume
neg_g_295_low60_0_low20_2 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_3 neg_f_295_low60_0_low20_2;
mov u_295_298 u_295_297;
mov v_295_298 v_295_297;

add neg_g_295_low60_0_low20_3 neg_g_295_low60_0_low20_2 neg_f_295_low60_0_low20_2;
asr neg_g_295_low60_0_low20_3 neg_g_295_low60_0_low20_3 1;
add r_295_298 r_295_297 u_295_297;
asr r_295_298 r_295_298 1;
add s_295_298 s_295_297 v_295_297;
asr s_295_298 s_295_298 1;
assert
    true
&&
    neg_f_295_low60_0_low20_3 = neg_f_295_low60_0_low20_2,
    u_295_298 = u_295_297,
    v_295_298 = v_295_297,
    neg_g_295_low60_0_low20_3 * (const 64 2) = neg_g_295_low60_0_low20_2 + neg_f_295_low60_0_low20_2,
    r_295_298 * (const 64 2) = r_295_297 + u_295_297,
    s_295_298 * (const 64 2) = s_295_297 + v_295_297
;

assume
    neg_f_295_low60_0_low20_3 = neg_f_295_low60_0_low20_2,
    u_295_298 = u_295_297,
    v_295_298 = v_295_297,
    neg_g_295_low60_0_low20_3 * 2 = neg_g_295_low60_0_low20_2 + neg_f_295_low60_0_low20_2,
    r_295_298 * 2 = r_295_297 + u_295_297,
    s_295_298 * 2 = s_295_297 + v_295_297
&&
    true
;

{
    u_295_298 * neg_f_295_low60_0_low20_0 + v_295_298 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_298 * neg_f_295_low60_0_low20_0 + s_295_298 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_3 + u_295_298 * (const 64 (2**21)) + v_295_298 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_3 + r_295_298 * (const 64 (2**21)) + s_295_298 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_3,
    neg_f_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_3,
    neg_g_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 298)) <=s delta, delta <=s (const 64 (1 + 2*298)),
    (const 64 (-(2**20))) <=s u_295_298, u_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_298, v_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_298, r_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_298, s_295_298 <=s (const 64 ((2**20))),
    u_295_298 + v_295_298 <=s (const 64 (2**20)),
    u_295_298 - v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 + v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 - v_295_298 <=s (const 64 (2**20)),
    r_295_298 + s_295_298 <=s (const 64 (2**20)),
    r_295_298 - s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 + s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 - s_295_298 <=s (const 64 (2**20)),
    u_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_295_298 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_297_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_2,
sint64 neg_g_295_low60_0_low20_2,
sint64 neg_f_295_low60_0_low20_3,
sint64 neg_g_295_low60_0_low20_3,
sint64 u_295_297,
sint64 v_295_297,
sint64 r_295_297,
sint64 s_295_297,
sint64 u_295_298,
sint64 v_295_298,
sint64 r_295_298,
sint64 s_295_298,
bit ne
)={
    u_295_297 * neg_f_295_low60_0_low20_0 + v_295_297 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_2 * (-(2**20)),
    r_295_297 * neg_f_295_low60_0_low20_0 + s_295_297 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_2 * (-(2**20))
&&
    u_295_297 * neg_f_295_low60_0_low20_0 + v_295_297 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_2 * (const 64 (-(2**20))),
    r_295_297 * neg_f_295_low60_0_low20_0 + s_295_297 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_2 + u_295_297 * (const 64 (2**21)) + v_295_297 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_2 + r_295_297 * (const 64 (2**21)) + s_295_297 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_2,
    neg_f_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_2,
    neg_g_295_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 297)) <=s delta, delta <=s (const 64 (1 + 2*297)),
    (const 64 (-(2**20))) <=s u_295_297, u_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_297, v_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_297, r_295_297 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_297, s_295_297 <=s (const 64 ((2**20))),
    u_295_297 + v_295_297 <=s (const 64 (2**20)),
    u_295_297 - v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 + v_295_297 <=s (const 64 (2**20)),
    (const 64 0) - u_295_297 - v_295_297 <=s (const 64 (2**20)),
    r_295_297 + s_295_297 <=s (const 64 (2**20)),
    r_295_297 - s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 + s_295_297 <=s (const 64 (2**20)),
    (const 64 0) - r_295_297 - s_295_297 <=s (const 64 (2**20)),
    u_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_295_297 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_295_297 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step297

// premise c
assume
neg_g_295_low60_0_low20_2 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_3 neg_g_295_low60_0_low20_2;
mov u_295_298 r_295_297;
mov v_295_298 s_295_297;

subs dc neg_g_295_low60_0_low20_3 neg_g_295_low60_0_low20_2 neg_f_295_low60_0_low20_2;
asr neg_g_295_low60_0_low20_3 neg_g_295_low60_0_low20_3 1;
subs dc r_295_298 r_295_297 u_295_297;
asr r_295_298 r_295_298 1;
subs dc s_295_298 s_295_297 v_295_297;
asr s_295_298 s_295_298 1;
assert
    true
&&
    neg_f_295_low60_0_low20_3 = neg_g_295_low60_0_low20_2,
    u_295_298 = r_295_297,
    v_295_298 = s_295_297,
    neg_g_295_low60_0_low20_3 * (const 64 2) = neg_g_295_low60_0_low20_2 - neg_f_295_low60_0_low20_2,
    r_295_298 * (const 64 2) = r_295_297 - u_295_297,
    s_295_298 * (const 64 2) = s_295_297 - v_295_297
;

assume
    neg_f_295_low60_0_low20_3 = neg_g_295_low60_0_low20_2,
    u_295_298 = r_295_297,
    v_295_298 = s_295_297,
    neg_g_295_low60_0_low20_3 * 2 = neg_g_295_low60_0_low20_2 - neg_f_295_low60_0_low20_2,
    r_295_298 * 2 = r_295_297 - u_295_297,
    s_295_298 * 2 = s_295_297 - v_295_297
&&
    true
;

{
    u_295_298 * neg_f_295_low60_0_low20_0 + v_295_298 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_298 * neg_f_295_low60_0_low20_0 + s_295_298 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_3 + u_295_298 * (const 64 (2**21)) + v_295_298 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_3 + r_295_298 * (const 64 (2**21)) + s_295_298 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_3,
    neg_f_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_3,
    neg_g_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 298)) <=s delta, delta <=s (const 64 (1 + 2*298)),
    (const 64 (-(2**20))) <=s u_295_298, u_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_298, v_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_298, r_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_298, s_295_298 <=s (const 64 ((2**20))),
    u_295_298 + v_295_298 <=s (const 64 (2**20)),
    u_295_298 - v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 + v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 - v_295_298 <=s (const 64 (2**20)),
    r_295_298 + s_295_298 <=s (const 64 (2**20)),
    r_295_298 - s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 + s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 - s_295_298 <=s (const 64 (2**20)),
    u_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_295_298 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_298_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_3,
sint64 neg_g_295_low60_0_low20_3,
sint64 neg_f_295_low60_0_low20_4,
sint64 neg_g_295_low60_0_low20_4,
sint64 u_295_298,
sint64 v_295_298,
sint64 r_295_298,
sint64 s_295_298,
sint64 u_295_299,
sint64 v_295_299,
sint64 r_295_299,
sint64 s_295_299,
bit ne
)={
    u_295_298 * neg_f_295_low60_0_low20_0 + v_295_298 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_3 * (-(2**20)),
    r_295_298 * neg_f_295_low60_0_low20_0 + s_295_298 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_3 * (-(2**20))
&&
    u_295_298 * neg_f_295_low60_0_low20_0 + v_295_298 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_3 * (const 64 (-(2**20))),
    r_295_298 * neg_f_295_low60_0_low20_0 + s_295_298 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_3 + u_295_298 * (const 64 (2**21)) + v_295_298 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_3 + r_295_298 * (const 64 (2**21)) + s_295_298 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_3,
    neg_f_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_3,
    neg_g_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 298)) <=s delta, delta <=s (const 64 (1 + 2*298)),
    (const 64 (-(2**20))) <=s u_295_298, u_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_298, v_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_298, r_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_298, s_295_298 <=s (const 64 ((2**20))),
    u_295_298 + v_295_298 <=s (const 64 (2**20)),
    u_295_298 - v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 + v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 - v_295_298 <=s (const 64 (2**20)),
    r_295_298 + s_295_298 <=s (const 64 (2**20)),
    r_295_298 - s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 + s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 - s_295_298 <=s (const 64 (2**20)),
    u_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_295_298 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step298

// premise a
assume
neg_g_295_low60_0_low20_3 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_4 neg_f_295_low60_0_low20_3;
mov u_295_299 u_295_298;
mov v_295_299 v_295_298;

asr neg_g_295_low60_0_low20_4 neg_g_295_low60_0_low20_3 1;
asr r_295_299 r_295_298 1;
asr s_295_299 s_295_298 1;
assert
    true
&&
    neg_f_295_low60_0_low20_4 = neg_f_295_low60_0_low20_3,
    u_295_299 = u_295_298,
    v_295_299 = v_295_298,
    neg_g_295_low60_0_low20_4 * (const 64 2) = neg_g_295_low60_0_low20_3,
    r_295_299 * (const 64 2) = r_295_298,
    s_295_299 * (const 64 2) = s_295_298
;

assume
    neg_f_295_low60_0_low20_4 = neg_f_295_low60_0_low20_3,
    u_295_299 = u_295_298,
    v_295_299 = v_295_298,
    neg_g_295_low60_0_low20_4 * 2 = neg_g_295_low60_0_low20_3,
    r_295_299 * 2 = r_295_298,
    s_295_299 * 2 = s_295_298
&&
    true
;

{
    u_295_299 * neg_f_295_low60_0_low20_0 + v_295_299 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_299 * neg_f_295_low60_0_low20_0 + s_295_299 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_4 + u_295_299 * (const 64 (2**21)) + v_295_299 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_4 + r_295_299 * (const 64 (2**21)) + s_295_299 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_4,
    neg_f_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_4,
    neg_g_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 299)) <=s delta, delta <=s (const 64 (1 + 2*299)),
    (const 64 (-(2**20))) <=s u_295_299, u_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_299, v_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_299, r_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_299, s_295_299 <=s (const 64 ((2**20))),
    u_295_299 + v_295_299 <=s (const 64 (2**20)),
    u_295_299 - v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 + v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 - v_295_299 <=s (const 64 (2**20)),
    r_295_299 + s_295_299 <=s (const 64 (2**20)),
    r_295_299 - s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 + s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 - s_295_299 <=s (const 64 (2**20)),
    u_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_295_299 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_298_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_3,
sint64 neg_g_295_low60_0_low20_3,
sint64 neg_f_295_low60_0_low20_4,
sint64 neg_g_295_low60_0_low20_4,
sint64 u_295_298,
sint64 v_295_298,
sint64 r_295_298,
sint64 s_295_298,
sint64 u_295_299,
sint64 v_295_299,
sint64 r_295_299,
sint64 s_295_299,
bit ne
)={
    u_295_298 * neg_f_295_low60_0_low20_0 + v_295_298 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_3 * (-(2**20)),
    r_295_298 * neg_f_295_low60_0_low20_0 + s_295_298 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_3 * (-(2**20))
&&
    u_295_298 * neg_f_295_low60_0_low20_0 + v_295_298 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_3 * (const 64 (-(2**20))),
    r_295_298 * neg_f_295_low60_0_low20_0 + s_295_298 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_3 + u_295_298 * (const 64 (2**21)) + v_295_298 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_3 + r_295_298 * (const 64 (2**21)) + s_295_298 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_3,
    neg_f_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_3,
    neg_g_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 298)) <=s delta, delta <=s (const 64 (1 + 2*298)),
    (const 64 (-(2**20))) <=s u_295_298, u_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_298, v_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_298, r_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_298, s_295_298 <=s (const 64 ((2**20))),
    u_295_298 + v_295_298 <=s (const 64 (2**20)),
    u_295_298 - v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 + v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 - v_295_298 <=s (const 64 (2**20)),
    r_295_298 + s_295_298 <=s (const 64 (2**20)),
    r_295_298 - s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 + s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 - s_295_298 <=s (const 64 (2**20)),
    u_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_295_298 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step298

// premise b
assume
neg_g_295_low60_0_low20_3 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_4 neg_f_295_low60_0_low20_3;
mov u_295_299 u_295_298;
mov v_295_299 v_295_298;

add neg_g_295_low60_0_low20_4 neg_g_295_low60_0_low20_3 neg_f_295_low60_0_low20_3;
asr neg_g_295_low60_0_low20_4 neg_g_295_low60_0_low20_4 1;
add r_295_299 r_295_298 u_295_298;
asr r_295_299 r_295_299 1;
add s_295_299 s_295_298 v_295_298;
asr s_295_299 s_295_299 1;
assert
    true
&&
    neg_f_295_low60_0_low20_4 = neg_f_295_low60_0_low20_3,
    u_295_299 = u_295_298,
    v_295_299 = v_295_298,
    neg_g_295_low60_0_low20_4 * (const 64 2) = neg_g_295_low60_0_low20_3 + neg_f_295_low60_0_low20_3,
    r_295_299 * (const 64 2) = r_295_298 + u_295_298,
    s_295_299 * (const 64 2) = s_295_298 + v_295_298
;

assume
    neg_f_295_low60_0_low20_4 = neg_f_295_low60_0_low20_3,
    u_295_299 = u_295_298,
    v_295_299 = v_295_298,
    neg_g_295_low60_0_low20_4 * 2 = neg_g_295_low60_0_low20_3 + neg_f_295_low60_0_low20_3,
    r_295_299 * 2 = r_295_298 + u_295_298,
    s_295_299 * 2 = s_295_298 + v_295_298
&&
    true
;

{
    u_295_299 * neg_f_295_low60_0_low20_0 + v_295_299 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_299 * neg_f_295_low60_0_low20_0 + s_295_299 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_4 + u_295_299 * (const 64 (2**21)) + v_295_299 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_4 + r_295_299 * (const 64 (2**21)) + s_295_299 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_4,
    neg_f_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_4,
    neg_g_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 299)) <=s delta, delta <=s (const 64 (1 + 2*299)),
    (const 64 (-(2**20))) <=s u_295_299, u_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_299, v_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_299, r_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_299, s_295_299 <=s (const 64 ((2**20))),
    u_295_299 + v_295_299 <=s (const 64 (2**20)),
    u_295_299 - v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 + v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 - v_295_299 <=s (const 64 (2**20)),
    r_295_299 + s_295_299 <=s (const 64 (2**20)),
    r_295_299 - s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 + s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 - s_295_299 <=s (const 64 (2**20)),
    u_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_295_299 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_298_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_3,
sint64 neg_g_295_low60_0_low20_3,
sint64 neg_f_295_low60_0_low20_4,
sint64 neg_g_295_low60_0_low20_4,
sint64 u_295_298,
sint64 v_295_298,
sint64 r_295_298,
sint64 s_295_298,
sint64 u_295_299,
sint64 v_295_299,
sint64 r_295_299,
sint64 s_295_299,
bit ne
)={
    u_295_298 * neg_f_295_low60_0_low20_0 + v_295_298 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_3 * (-(2**20)),
    r_295_298 * neg_f_295_low60_0_low20_0 + s_295_298 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_3 * (-(2**20))
&&
    u_295_298 * neg_f_295_low60_0_low20_0 + v_295_298 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_3 * (const 64 (-(2**20))),
    r_295_298 * neg_f_295_low60_0_low20_0 + s_295_298 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_3 + u_295_298 * (const 64 (2**21)) + v_295_298 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_3 + r_295_298 * (const 64 (2**21)) + s_295_298 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_3,
    neg_f_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_3,
    neg_g_295_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 298)) <=s delta, delta <=s (const 64 (1 + 2*298)),
    (const 64 (-(2**20))) <=s u_295_298, u_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_298, v_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_298, r_295_298 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_298, s_295_298 <=s (const 64 ((2**20))),
    u_295_298 + v_295_298 <=s (const 64 (2**20)),
    u_295_298 - v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 + v_295_298 <=s (const 64 (2**20)),
    (const 64 0) - u_295_298 - v_295_298 <=s (const 64 (2**20)),
    r_295_298 + s_295_298 <=s (const 64 (2**20)),
    r_295_298 - s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 + s_295_298 <=s (const 64 (2**20)),
    (const 64 0) - r_295_298 - s_295_298 <=s (const 64 (2**20)),
    u_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_295_298 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_295_298 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step298

// premise c
assume
neg_g_295_low60_0_low20_3 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_4 neg_g_295_low60_0_low20_3;
mov u_295_299 r_295_298;
mov v_295_299 s_295_298;

subs dc neg_g_295_low60_0_low20_4 neg_g_295_low60_0_low20_3 neg_f_295_low60_0_low20_3;
asr neg_g_295_low60_0_low20_4 neg_g_295_low60_0_low20_4 1;
subs dc r_295_299 r_295_298 u_295_298;
asr r_295_299 r_295_299 1;
subs dc s_295_299 s_295_298 v_295_298;
asr s_295_299 s_295_299 1;
assert
    true
&&
    neg_f_295_low60_0_low20_4 = neg_g_295_low60_0_low20_3,
    u_295_299 = r_295_298,
    v_295_299 = s_295_298,
    neg_g_295_low60_0_low20_4 * (const 64 2) = neg_g_295_low60_0_low20_3 - neg_f_295_low60_0_low20_3,
    r_295_299 * (const 64 2) = r_295_298 - u_295_298,
    s_295_299 * (const 64 2) = s_295_298 - v_295_298
;

assume
    neg_f_295_low60_0_low20_4 = neg_g_295_low60_0_low20_3,
    u_295_299 = r_295_298,
    v_295_299 = s_295_298,
    neg_g_295_low60_0_low20_4 * 2 = neg_g_295_low60_0_low20_3 - neg_f_295_low60_0_low20_3,
    r_295_299 * 2 = r_295_298 - u_295_298,
    s_295_299 * 2 = s_295_298 - v_295_298
&&
    true
;

{
    u_295_299 * neg_f_295_low60_0_low20_0 + v_295_299 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_299 * neg_f_295_low60_0_low20_0 + s_295_299 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_4 + u_295_299 * (const 64 (2**21)) + v_295_299 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_4 + r_295_299 * (const 64 (2**21)) + s_295_299 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_4,
    neg_f_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_4,
    neg_g_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 299)) <=s delta, delta <=s (const 64 (1 + 2*299)),
    (const 64 (-(2**20))) <=s u_295_299, u_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_299, v_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_299, r_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_299, s_295_299 <=s (const 64 ((2**20))),
    u_295_299 + v_295_299 <=s (const 64 (2**20)),
    u_295_299 - v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 + v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 - v_295_299 <=s (const 64 (2**20)),
    r_295_299 + s_295_299 <=s (const 64 (2**20)),
    r_295_299 - s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 + s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 - s_295_299 <=s (const 64 (2**20)),
    u_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_295_299 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_299_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_4,
sint64 neg_g_295_low60_0_low20_4,
sint64 neg_f_295_low60_0_low20_5,
sint64 neg_g_295_low60_0_low20_5,
sint64 u_295_299,
sint64 v_295_299,
sint64 r_295_299,
sint64 s_295_299,
sint64 u_295_300,
sint64 v_295_300,
sint64 r_295_300,
sint64 s_295_300,
bit ne
)={
    u_295_299 * neg_f_295_low60_0_low20_0 + v_295_299 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_4 * (-(2**20)),
    r_295_299 * neg_f_295_low60_0_low20_0 + s_295_299 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_4 * (-(2**20))
&&
    u_295_299 * neg_f_295_low60_0_low20_0 + v_295_299 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_4 * (const 64 (-(2**20))),
    r_295_299 * neg_f_295_low60_0_low20_0 + s_295_299 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_4 + u_295_299 * (const 64 (2**21)) + v_295_299 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_4 + r_295_299 * (const 64 (2**21)) + s_295_299 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_4,
    neg_f_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_4,
    neg_g_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 299)) <=s delta, delta <=s (const 64 (1 + 2*299)),
    (const 64 (-(2**20))) <=s u_295_299, u_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_299, v_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_299, r_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_299, s_295_299 <=s (const 64 ((2**20))),
    u_295_299 + v_295_299 <=s (const 64 (2**20)),
    u_295_299 - v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 + v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 - v_295_299 <=s (const 64 (2**20)),
    r_295_299 + s_295_299 <=s (const 64 (2**20)),
    r_295_299 - s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 + s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 - s_295_299 <=s (const 64 (2**20)),
    u_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_295_299 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step299

// premise a
assume
neg_g_295_low60_0_low20_4 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_5 neg_f_295_low60_0_low20_4;
mov u_295_300 u_295_299;
mov v_295_300 v_295_299;

asr neg_g_295_low60_0_low20_5 neg_g_295_low60_0_low20_4 1;
asr r_295_300 r_295_299 1;
asr s_295_300 s_295_299 1;
assert
    true
&&
    neg_f_295_low60_0_low20_5 = neg_f_295_low60_0_low20_4,
    u_295_300 = u_295_299,
    v_295_300 = v_295_299,
    neg_g_295_low60_0_low20_5 * (const 64 2) = neg_g_295_low60_0_low20_4,
    r_295_300 * (const 64 2) = r_295_299,
    s_295_300 * (const 64 2) = s_295_299
;

assume
    neg_f_295_low60_0_low20_5 = neg_f_295_low60_0_low20_4,
    u_295_300 = u_295_299,
    v_295_300 = v_295_299,
    neg_g_295_low60_0_low20_5 * 2 = neg_g_295_low60_0_low20_4,
    r_295_300 * 2 = r_295_299,
    s_295_300 * 2 = s_295_299
&&
    true
;

{
    u_295_300 * neg_f_295_low60_0_low20_0 + v_295_300 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_300 * neg_f_295_low60_0_low20_0 + s_295_300 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_5 + u_295_300 * (const 64 (2**21)) + v_295_300 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_5 + r_295_300 * (const 64 (2**21)) + s_295_300 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_5,
    neg_f_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_5,
    neg_g_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 300)) <=s delta, delta <=s (const 64 (1 + 2*300)),
    (const 64 (-(2**20))) <=s u_295_300, u_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_300, v_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_300, r_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_300, s_295_300 <=s (const 64 ((2**20))),
    u_295_300 + v_295_300 <=s (const 64 (2**20)),
    u_295_300 - v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 + v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 - v_295_300 <=s (const 64 (2**20)),
    r_295_300 + s_295_300 <=s (const 64 (2**20)),
    r_295_300 - s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 + s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 - s_295_300 <=s (const 64 (2**20)),
    u_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_295_300 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_299_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_4,
sint64 neg_g_295_low60_0_low20_4,
sint64 neg_f_295_low60_0_low20_5,
sint64 neg_g_295_low60_0_low20_5,
sint64 u_295_299,
sint64 v_295_299,
sint64 r_295_299,
sint64 s_295_299,
sint64 u_295_300,
sint64 v_295_300,
sint64 r_295_300,
sint64 s_295_300,
bit ne
)={
    u_295_299 * neg_f_295_low60_0_low20_0 + v_295_299 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_4 * (-(2**20)),
    r_295_299 * neg_f_295_low60_0_low20_0 + s_295_299 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_4 * (-(2**20))
&&
    u_295_299 * neg_f_295_low60_0_low20_0 + v_295_299 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_4 * (const 64 (-(2**20))),
    r_295_299 * neg_f_295_low60_0_low20_0 + s_295_299 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_4 + u_295_299 * (const 64 (2**21)) + v_295_299 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_4 + r_295_299 * (const 64 (2**21)) + s_295_299 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_4,
    neg_f_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_4,
    neg_g_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 299)) <=s delta, delta <=s (const 64 (1 + 2*299)),
    (const 64 (-(2**20))) <=s u_295_299, u_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_299, v_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_299, r_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_299, s_295_299 <=s (const 64 ((2**20))),
    u_295_299 + v_295_299 <=s (const 64 (2**20)),
    u_295_299 - v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 + v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 - v_295_299 <=s (const 64 (2**20)),
    r_295_299 + s_295_299 <=s (const 64 (2**20)),
    r_295_299 - s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 + s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 - s_295_299 <=s (const 64 (2**20)),
    u_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_295_299 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step299

// premise b
assume
neg_g_295_low60_0_low20_4 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_5 neg_f_295_low60_0_low20_4;
mov u_295_300 u_295_299;
mov v_295_300 v_295_299;

add neg_g_295_low60_0_low20_5 neg_g_295_low60_0_low20_4 neg_f_295_low60_0_low20_4;
asr neg_g_295_low60_0_low20_5 neg_g_295_low60_0_low20_5 1;
add r_295_300 r_295_299 u_295_299;
asr r_295_300 r_295_300 1;
add s_295_300 s_295_299 v_295_299;
asr s_295_300 s_295_300 1;
assert
    true
&&
    neg_f_295_low60_0_low20_5 = neg_f_295_low60_0_low20_4,
    u_295_300 = u_295_299,
    v_295_300 = v_295_299,
    neg_g_295_low60_0_low20_5 * (const 64 2) = neg_g_295_low60_0_low20_4 + neg_f_295_low60_0_low20_4,
    r_295_300 * (const 64 2) = r_295_299 + u_295_299,
    s_295_300 * (const 64 2) = s_295_299 + v_295_299
;

assume
    neg_f_295_low60_0_low20_5 = neg_f_295_low60_0_low20_4,
    u_295_300 = u_295_299,
    v_295_300 = v_295_299,
    neg_g_295_low60_0_low20_5 * 2 = neg_g_295_low60_0_low20_4 + neg_f_295_low60_0_low20_4,
    r_295_300 * 2 = r_295_299 + u_295_299,
    s_295_300 * 2 = s_295_299 + v_295_299
&&
    true
;

{
    u_295_300 * neg_f_295_low60_0_low20_0 + v_295_300 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_300 * neg_f_295_low60_0_low20_0 + s_295_300 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_5 + u_295_300 * (const 64 (2**21)) + v_295_300 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_5 + r_295_300 * (const 64 (2**21)) + s_295_300 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_5,
    neg_f_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_5,
    neg_g_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 300)) <=s delta, delta <=s (const 64 (1 + 2*300)),
    (const 64 (-(2**20))) <=s u_295_300, u_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_300, v_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_300, r_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_300, s_295_300 <=s (const 64 ((2**20))),
    u_295_300 + v_295_300 <=s (const 64 (2**20)),
    u_295_300 - v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 + v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 - v_295_300 <=s (const 64 (2**20)),
    r_295_300 + s_295_300 <=s (const 64 (2**20)),
    r_295_300 - s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 + s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 - s_295_300 <=s (const 64 (2**20)),
    u_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_295_300 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_299_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_4,
sint64 neg_g_295_low60_0_low20_4,
sint64 neg_f_295_low60_0_low20_5,
sint64 neg_g_295_low60_0_low20_5,
sint64 u_295_299,
sint64 v_295_299,
sint64 r_295_299,
sint64 s_295_299,
sint64 u_295_300,
sint64 v_295_300,
sint64 r_295_300,
sint64 s_295_300,
bit ne
)={
    u_295_299 * neg_f_295_low60_0_low20_0 + v_295_299 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_4 * (-(2**20)),
    r_295_299 * neg_f_295_low60_0_low20_0 + s_295_299 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_4 * (-(2**20))
&&
    u_295_299 * neg_f_295_low60_0_low20_0 + v_295_299 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_4 * (const 64 (-(2**20))),
    r_295_299 * neg_f_295_low60_0_low20_0 + s_295_299 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_4 + u_295_299 * (const 64 (2**21)) + v_295_299 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_4 + r_295_299 * (const 64 (2**21)) + s_295_299 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_4,
    neg_f_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_4,
    neg_g_295_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 299)) <=s delta, delta <=s (const 64 (1 + 2*299)),
    (const 64 (-(2**20))) <=s u_295_299, u_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_299, v_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_299, r_295_299 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_299, s_295_299 <=s (const 64 ((2**20))),
    u_295_299 + v_295_299 <=s (const 64 (2**20)),
    u_295_299 - v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 + v_295_299 <=s (const 64 (2**20)),
    (const 64 0) - u_295_299 - v_295_299 <=s (const 64 (2**20)),
    r_295_299 + s_295_299 <=s (const 64 (2**20)),
    r_295_299 - s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 + s_295_299 <=s (const 64 (2**20)),
    (const 64 0) - r_295_299 - s_295_299 <=s (const 64 (2**20)),
    u_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_295_299 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_295_299 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step299

// premise c
assume
neg_g_295_low60_0_low20_4 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_5 neg_g_295_low60_0_low20_4;
mov u_295_300 r_295_299;
mov v_295_300 s_295_299;

subs dc neg_g_295_low60_0_low20_5 neg_g_295_low60_0_low20_4 neg_f_295_low60_0_low20_4;
asr neg_g_295_low60_0_low20_5 neg_g_295_low60_0_low20_5 1;
subs dc r_295_300 r_295_299 u_295_299;
asr r_295_300 r_295_300 1;
subs dc s_295_300 s_295_299 v_295_299;
asr s_295_300 s_295_300 1;
assert
    true
&&
    neg_f_295_low60_0_low20_5 = neg_g_295_low60_0_low20_4,
    u_295_300 = r_295_299,
    v_295_300 = s_295_299,
    neg_g_295_low60_0_low20_5 * (const 64 2) = neg_g_295_low60_0_low20_4 - neg_f_295_low60_0_low20_4,
    r_295_300 * (const 64 2) = r_295_299 - u_295_299,
    s_295_300 * (const 64 2) = s_295_299 - v_295_299
;

assume
    neg_f_295_low60_0_low20_5 = neg_g_295_low60_0_low20_4,
    u_295_300 = r_295_299,
    v_295_300 = s_295_299,
    neg_g_295_low60_0_low20_5 * 2 = neg_g_295_low60_0_low20_4 - neg_f_295_low60_0_low20_4,
    r_295_300 * 2 = r_295_299 - u_295_299,
    s_295_300 * 2 = s_295_299 - v_295_299
&&
    true
;

{
    u_295_300 * neg_f_295_low60_0_low20_0 + v_295_300 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_300 * neg_f_295_low60_0_low20_0 + s_295_300 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_5 + u_295_300 * (const 64 (2**21)) + v_295_300 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_5 + r_295_300 * (const 64 (2**21)) + s_295_300 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_5,
    neg_f_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_5,
    neg_g_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 300)) <=s delta, delta <=s (const 64 (1 + 2*300)),
    (const 64 (-(2**20))) <=s u_295_300, u_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_300, v_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_300, r_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_300, s_295_300 <=s (const 64 ((2**20))),
    u_295_300 + v_295_300 <=s (const 64 (2**20)),
    u_295_300 - v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 + v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 - v_295_300 <=s (const 64 (2**20)),
    r_295_300 + s_295_300 <=s (const 64 (2**20)),
    r_295_300 - s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 + s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 - s_295_300 <=s (const 64 (2**20)),
    u_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_295_300 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_300_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_5,
sint64 neg_g_295_low60_0_low20_5,
sint64 neg_f_295_low60_0_low20_6,
sint64 neg_g_295_low60_0_low20_6,
sint64 u_295_300,
sint64 v_295_300,
sint64 r_295_300,
sint64 s_295_300,
sint64 u_295_301,
sint64 v_295_301,
sint64 r_295_301,
sint64 s_295_301,
bit ne
)={
    u_295_300 * neg_f_295_low60_0_low20_0 + v_295_300 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_5 * (-(2**20)),
    r_295_300 * neg_f_295_low60_0_low20_0 + s_295_300 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_5 * (-(2**20))
&&
    u_295_300 * neg_f_295_low60_0_low20_0 + v_295_300 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_5 * (const 64 (-(2**20))),
    r_295_300 * neg_f_295_low60_0_low20_0 + s_295_300 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_5 + u_295_300 * (const 64 (2**21)) + v_295_300 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_5 + r_295_300 * (const 64 (2**21)) + s_295_300 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_5,
    neg_f_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_5,
    neg_g_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 300)) <=s delta, delta <=s (const 64 (1 + 2*300)),
    (const 64 (-(2**20))) <=s u_295_300, u_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_300, v_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_300, r_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_300, s_295_300 <=s (const 64 ((2**20))),
    u_295_300 + v_295_300 <=s (const 64 (2**20)),
    u_295_300 - v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 + v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 - v_295_300 <=s (const 64 (2**20)),
    r_295_300 + s_295_300 <=s (const 64 (2**20)),
    r_295_300 - s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 + s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 - s_295_300 <=s (const 64 (2**20)),
    u_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_295_300 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step300

// premise a
assume
neg_g_295_low60_0_low20_5 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_6 neg_f_295_low60_0_low20_5;
mov u_295_301 u_295_300;
mov v_295_301 v_295_300;

asr neg_g_295_low60_0_low20_6 neg_g_295_low60_0_low20_5 1;
asr r_295_301 r_295_300 1;
asr s_295_301 s_295_300 1;
assert
    true
&&
    neg_f_295_low60_0_low20_6 = neg_f_295_low60_0_low20_5,
    u_295_301 = u_295_300,
    v_295_301 = v_295_300,
    neg_g_295_low60_0_low20_6 * (const 64 2) = neg_g_295_low60_0_low20_5,
    r_295_301 * (const 64 2) = r_295_300,
    s_295_301 * (const 64 2) = s_295_300
;

assume
    neg_f_295_low60_0_low20_6 = neg_f_295_low60_0_low20_5,
    u_295_301 = u_295_300,
    v_295_301 = v_295_300,
    neg_g_295_low60_0_low20_6 * 2 = neg_g_295_low60_0_low20_5,
    r_295_301 * 2 = r_295_300,
    s_295_301 * 2 = s_295_300
&&
    true
;

{
    u_295_301 * neg_f_295_low60_0_low20_0 + v_295_301 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_301 * neg_f_295_low60_0_low20_0 + s_295_301 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_6 + u_295_301 * (const 64 (2**21)) + v_295_301 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_6 + r_295_301 * (const 64 (2**21)) + s_295_301 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_6,
    neg_f_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_6,
    neg_g_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 301)) <=s delta, delta <=s (const 64 (1 + 2*301)),
    (const 64 (-(2**20))) <=s u_295_301, u_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_301, v_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_301, r_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_301, s_295_301 <=s (const 64 ((2**20))),
    u_295_301 + v_295_301 <=s (const 64 (2**20)),
    u_295_301 - v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 + v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 - v_295_301 <=s (const 64 (2**20)),
    r_295_301 + s_295_301 <=s (const 64 (2**20)),
    r_295_301 - s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 + s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 - s_295_301 <=s (const 64 (2**20)),
    u_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_295_301 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_300_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_5,
sint64 neg_g_295_low60_0_low20_5,
sint64 neg_f_295_low60_0_low20_6,
sint64 neg_g_295_low60_0_low20_6,
sint64 u_295_300,
sint64 v_295_300,
sint64 r_295_300,
sint64 s_295_300,
sint64 u_295_301,
sint64 v_295_301,
sint64 r_295_301,
sint64 s_295_301,
bit ne
)={
    u_295_300 * neg_f_295_low60_0_low20_0 + v_295_300 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_5 * (-(2**20)),
    r_295_300 * neg_f_295_low60_0_low20_0 + s_295_300 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_5 * (-(2**20))
&&
    u_295_300 * neg_f_295_low60_0_low20_0 + v_295_300 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_5 * (const 64 (-(2**20))),
    r_295_300 * neg_f_295_low60_0_low20_0 + s_295_300 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_5 + u_295_300 * (const 64 (2**21)) + v_295_300 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_5 + r_295_300 * (const 64 (2**21)) + s_295_300 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_5,
    neg_f_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_5,
    neg_g_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 300)) <=s delta, delta <=s (const 64 (1 + 2*300)),
    (const 64 (-(2**20))) <=s u_295_300, u_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_300, v_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_300, r_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_300, s_295_300 <=s (const 64 ((2**20))),
    u_295_300 + v_295_300 <=s (const 64 (2**20)),
    u_295_300 - v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 + v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 - v_295_300 <=s (const 64 (2**20)),
    r_295_300 + s_295_300 <=s (const 64 (2**20)),
    r_295_300 - s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 + s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 - s_295_300 <=s (const 64 (2**20)),
    u_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_295_300 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step300

// premise b
assume
neg_g_295_low60_0_low20_5 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_6 neg_f_295_low60_0_low20_5;
mov u_295_301 u_295_300;
mov v_295_301 v_295_300;

add neg_g_295_low60_0_low20_6 neg_g_295_low60_0_low20_5 neg_f_295_low60_0_low20_5;
asr neg_g_295_low60_0_low20_6 neg_g_295_low60_0_low20_6 1;
add r_295_301 r_295_300 u_295_300;
asr r_295_301 r_295_301 1;
add s_295_301 s_295_300 v_295_300;
asr s_295_301 s_295_301 1;
assert
    true
&&
    neg_f_295_low60_0_low20_6 = neg_f_295_low60_0_low20_5,
    u_295_301 = u_295_300,
    v_295_301 = v_295_300,
    neg_g_295_low60_0_low20_6 * (const 64 2) = neg_g_295_low60_0_low20_5 + neg_f_295_low60_0_low20_5,
    r_295_301 * (const 64 2) = r_295_300 + u_295_300,
    s_295_301 * (const 64 2) = s_295_300 + v_295_300
;

assume
    neg_f_295_low60_0_low20_6 = neg_f_295_low60_0_low20_5,
    u_295_301 = u_295_300,
    v_295_301 = v_295_300,
    neg_g_295_low60_0_low20_6 * 2 = neg_g_295_low60_0_low20_5 + neg_f_295_low60_0_low20_5,
    r_295_301 * 2 = r_295_300 + u_295_300,
    s_295_301 * 2 = s_295_300 + v_295_300
&&
    true
;

{
    u_295_301 * neg_f_295_low60_0_low20_0 + v_295_301 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_301 * neg_f_295_low60_0_low20_0 + s_295_301 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_6 + u_295_301 * (const 64 (2**21)) + v_295_301 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_6 + r_295_301 * (const 64 (2**21)) + s_295_301 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_6,
    neg_f_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_6,
    neg_g_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 301)) <=s delta, delta <=s (const 64 (1 + 2*301)),
    (const 64 (-(2**20))) <=s u_295_301, u_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_301, v_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_301, r_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_301, s_295_301 <=s (const 64 ((2**20))),
    u_295_301 + v_295_301 <=s (const 64 (2**20)),
    u_295_301 - v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 + v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 - v_295_301 <=s (const 64 (2**20)),
    r_295_301 + s_295_301 <=s (const 64 (2**20)),
    r_295_301 - s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 + s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 - s_295_301 <=s (const 64 (2**20)),
    u_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_295_301 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_300_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_5,
sint64 neg_g_295_low60_0_low20_5,
sint64 neg_f_295_low60_0_low20_6,
sint64 neg_g_295_low60_0_low20_6,
sint64 u_295_300,
sint64 v_295_300,
sint64 r_295_300,
sint64 s_295_300,
sint64 u_295_301,
sint64 v_295_301,
sint64 r_295_301,
sint64 s_295_301,
bit ne
)={
    u_295_300 * neg_f_295_low60_0_low20_0 + v_295_300 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_5 * (-(2**20)),
    r_295_300 * neg_f_295_low60_0_low20_0 + s_295_300 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_5 * (-(2**20))
&&
    u_295_300 * neg_f_295_low60_0_low20_0 + v_295_300 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_5 * (const 64 (-(2**20))),
    r_295_300 * neg_f_295_low60_0_low20_0 + s_295_300 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_5 + u_295_300 * (const 64 (2**21)) + v_295_300 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_5 + r_295_300 * (const 64 (2**21)) + s_295_300 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_5,
    neg_f_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_5,
    neg_g_295_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 300)) <=s delta, delta <=s (const 64 (1 + 2*300)),
    (const 64 (-(2**20))) <=s u_295_300, u_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_300, v_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_300, r_295_300 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_300, s_295_300 <=s (const 64 ((2**20))),
    u_295_300 + v_295_300 <=s (const 64 (2**20)),
    u_295_300 - v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 + v_295_300 <=s (const 64 (2**20)),
    (const 64 0) - u_295_300 - v_295_300 <=s (const 64 (2**20)),
    r_295_300 + s_295_300 <=s (const 64 (2**20)),
    r_295_300 - s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 + s_295_300 <=s (const 64 (2**20)),
    (const 64 0) - r_295_300 - s_295_300 <=s (const 64 (2**20)),
    u_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_295_300 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_295_300 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step300

// premise c
assume
neg_g_295_low60_0_low20_5 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_6 neg_g_295_low60_0_low20_5;
mov u_295_301 r_295_300;
mov v_295_301 s_295_300;

subs dc neg_g_295_low60_0_low20_6 neg_g_295_low60_0_low20_5 neg_f_295_low60_0_low20_5;
asr neg_g_295_low60_0_low20_6 neg_g_295_low60_0_low20_6 1;
subs dc r_295_301 r_295_300 u_295_300;
asr r_295_301 r_295_301 1;
subs dc s_295_301 s_295_300 v_295_300;
asr s_295_301 s_295_301 1;
assert
    true
&&
    neg_f_295_low60_0_low20_6 = neg_g_295_low60_0_low20_5,
    u_295_301 = r_295_300,
    v_295_301 = s_295_300,
    neg_g_295_low60_0_low20_6 * (const 64 2) = neg_g_295_low60_0_low20_5 - neg_f_295_low60_0_low20_5,
    r_295_301 * (const 64 2) = r_295_300 - u_295_300,
    s_295_301 * (const 64 2) = s_295_300 - v_295_300
;

assume
    neg_f_295_low60_0_low20_6 = neg_g_295_low60_0_low20_5,
    u_295_301 = r_295_300,
    v_295_301 = s_295_300,
    neg_g_295_low60_0_low20_6 * 2 = neg_g_295_low60_0_low20_5 - neg_f_295_low60_0_low20_5,
    r_295_301 * 2 = r_295_300 - u_295_300,
    s_295_301 * 2 = s_295_300 - v_295_300
&&
    true
;

{
    u_295_301 * neg_f_295_low60_0_low20_0 + v_295_301 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_301 * neg_f_295_low60_0_low20_0 + s_295_301 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_6 + u_295_301 * (const 64 (2**21)) + v_295_301 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_6 + r_295_301 * (const 64 (2**21)) + s_295_301 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_6,
    neg_f_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_6,
    neg_g_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 301)) <=s delta, delta <=s (const 64 (1 + 2*301)),
    (const 64 (-(2**20))) <=s u_295_301, u_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_301, v_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_301, r_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_301, s_295_301 <=s (const 64 ((2**20))),
    u_295_301 + v_295_301 <=s (const 64 (2**20)),
    u_295_301 - v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 + v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 - v_295_301 <=s (const 64 (2**20)),
    r_295_301 + s_295_301 <=s (const 64 (2**20)),
    r_295_301 - s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 + s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 - s_295_301 <=s (const 64 (2**20)),
    u_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_295_301 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_301_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_6,
sint64 neg_g_295_low60_0_low20_6,
sint64 neg_f_295_low60_0_low20_7,
sint64 neg_g_295_low60_0_low20_7,
sint64 u_295_301,
sint64 v_295_301,
sint64 r_295_301,
sint64 s_295_301,
sint64 u_295_302,
sint64 v_295_302,
sint64 r_295_302,
sint64 s_295_302,
bit ne
)={
    u_295_301 * neg_f_295_low60_0_low20_0 + v_295_301 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_6 * (-(2**20)),
    r_295_301 * neg_f_295_low60_0_low20_0 + s_295_301 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_6 * (-(2**20))
&&
    u_295_301 * neg_f_295_low60_0_low20_0 + v_295_301 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_6 * (const 64 (-(2**20))),
    r_295_301 * neg_f_295_low60_0_low20_0 + s_295_301 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_6 + u_295_301 * (const 64 (2**21)) + v_295_301 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_6 + r_295_301 * (const 64 (2**21)) + s_295_301 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_6,
    neg_f_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_6,
    neg_g_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 301)) <=s delta, delta <=s (const 64 (1 + 2*301)),
    (const 64 (-(2**20))) <=s u_295_301, u_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_301, v_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_301, r_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_301, s_295_301 <=s (const 64 ((2**20))),
    u_295_301 + v_295_301 <=s (const 64 (2**20)),
    u_295_301 - v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 + v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 - v_295_301 <=s (const 64 (2**20)),
    r_295_301 + s_295_301 <=s (const 64 (2**20)),
    r_295_301 - s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 + s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 - s_295_301 <=s (const 64 (2**20)),
    u_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_295_301 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step301

// premise a
assume
neg_g_295_low60_0_low20_6 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_7 neg_f_295_low60_0_low20_6;
mov u_295_302 u_295_301;
mov v_295_302 v_295_301;

asr neg_g_295_low60_0_low20_7 neg_g_295_low60_0_low20_6 1;
asr r_295_302 r_295_301 1;
asr s_295_302 s_295_301 1;
assert
    true
&&
    neg_f_295_low60_0_low20_7 = neg_f_295_low60_0_low20_6,
    u_295_302 = u_295_301,
    v_295_302 = v_295_301,
    neg_g_295_low60_0_low20_7 * (const 64 2) = neg_g_295_low60_0_low20_6,
    r_295_302 * (const 64 2) = r_295_301,
    s_295_302 * (const 64 2) = s_295_301
;

assume
    neg_f_295_low60_0_low20_7 = neg_f_295_low60_0_low20_6,
    u_295_302 = u_295_301,
    v_295_302 = v_295_301,
    neg_g_295_low60_0_low20_7 * 2 = neg_g_295_low60_0_low20_6,
    r_295_302 * 2 = r_295_301,
    s_295_302 * 2 = s_295_301
&&
    true
;

{
    u_295_302 * neg_f_295_low60_0_low20_0 + v_295_302 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_302 * neg_f_295_low60_0_low20_0 + s_295_302 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_7 + u_295_302 * (const 64 (2**21)) + v_295_302 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_7 + r_295_302 * (const 64 (2**21)) + s_295_302 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_7,
    neg_f_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_7,
    neg_g_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 302)) <=s delta, delta <=s (const 64 (1 + 2*302)),
    (const 64 (-(2**20))) <=s u_295_302, u_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_302, v_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_302, r_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_302, s_295_302 <=s (const 64 ((2**20))),
    u_295_302 + v_295_302 <=s (const 64 (2**20)),
    u_295_302 - v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 + v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 - v_295_302 <=s (const 64 (2**20)),
    r_295_302 + s_295_302 <=s (const 64 (2**20)),
    r_295_302 - s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 + s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 - s_295_302 <=s (const 64 (2**20)),
    u_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_295_302 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_301_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_6,
sint64 neg_g_295_low60_0_low20_6,
sint64 neg_f_295_low60_0_low20_7,
sint64 neg_g_295_low60_0_low20_7,
sint64 u_295_301,
sint64 v_295_301,
sint64 r_295_301,
sint64 s_295_301,
sint64 u_295_302,
sint64 v_295_302,
sint64 r_295_302,
sint64 s_295_302,
bit ne
)={
    u_295_301 * neg_f_295_low60_0_low20_0 + v_295_301 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_6 * (-(2**20)),
    r_295_301 * neg_f_295_low60_0_low20_0 + s_295_301 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_6 * (-(2**20))
&&
    u_295_301 * neg_f_295_low60_0_low20_0 + v_295_301 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_6 * (const 64 (-(2**20))),
    r_295_301 * neg_f_295_low60_0_low20_0 + s_295_301 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_6 + u_295_301 * (const 64 (2**21)) + v_295_301 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_6 + r_295_301 * (const 64 (2**21)) + s_295_301 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_6,
    neg_f_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_6,
    neg_g_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 301)) <=s delta, delta <=s (const 64 (1 + 2*301)),
    (const 64 (-(2**20))) <=s u_295_301, u_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_301, v_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_301, r_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_301, s_295_301 <=s (const 64 ((2**20))),
    u_295_301 + v_295_301 <=s (const 64 (2**20)),
    u_295_301 - v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 + v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 - v_295_301 <=s (const 64 (2**20)),
    r_295_301 + s_295_301 <=s (const 64 (2**20)),
    r_295_301 - s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 + s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 - s_295_301 <=s (const 64 (2**20)),
    u_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_295_301 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step301

// premise b
assume
neg_g_295_low60_0_low20_6 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_7 neg_f_295_low60_0_low20_6;
mov u_295_302 u_295_301;
mov v_295_302 v_295_301;

add neg_g_295_low60_0_low20_7 neg_g_295_low60_0_low20_6 neg_f_295_low60_0_low20_6;
asr neg_g_295_low60_0_low20_7 neg_g_295_low60_0_low20_7 1;
add r_295_302 r_295_301 u_295_301;
asr r_295_302 r_295_302 1;
add s_295_302 s_295_301 v_295_301;
asr s_295_302 s_295_302 1;
assert
    true
&&
    neg_f_295_low60_0_low20_7 = neg_f_295_low60_0_low20_6,
    u_295_302 = u_295_301,
    v_295_302 = v_295_301,
    neg_g_295_low60_0_low20_7 * (const 64 2) = neg_g_295_low60_0_low20_6 + neg_f_295_low60_0_low20_6,
    r_295_302 * (const 64 2) = r_295_301 + u_295_301,
    s_295_302 * (const 64 2) = s_295_301 + v_295_301
;

assume
    neg_f_295_low60_0_low20_7 = neg_f_295_low60_0_low20_6,
    u_295_302 = u_295_301,
    v_295_302 = v_295_301,
    neg_g_295_low60_0_low20_7 * 2 = neg_g_295_low60_0_low20_6 + neg_f_295_low60_0_low20_6,
    r_295_302 * 2 = r_295_301 + u_295_301,
    s_295_302 * 2 = s_295_301 + v_295_301
&&
    true
;

{
    u_295_302 * neg_f_295_low60_0_low20_0 + v_295_302 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_302 * neg_f_295_low60_0_low20_0 + s_295_302 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_7 + u_295_302 * (const 64 (2**21)) + v_295_302 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_7 + r_295_302 * (const 64 (2**21)) + s_295_302 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_7,
    neg_f_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_7,
    neg_g_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 302)) <=s delta, delta <=s (const 64 (1 + 2*302)),
    (const 64 (-(2**20))) <=s u_295_302, u_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_302, v_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_302, r_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_302, s_295_302 <=s (const 64 ((2**20))),
    u_295_302 + v_295_302 <=s (const 64 (2**20)),
    u_295_302 - v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 + v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 - v_295_302 <=s (const 64 (2**20)),
    r_295_302 + s_295_302 <=s (const 64 (2**20)),
    r_295_302 - s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 + s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 - s_295_302 <=s (const 64 (2**20)),
    u_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_295_302 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_301_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_6,
sint64 neg_g_295_low60_0_low20_6,
sint64 neg_f_295_low60_0_low20_7,
sint64 neg_g_295_low60_0_low20_7,
sint64 u_295_301,
sint64 v_295_301,
sint64 r_295_301,
sint64 s_295_301,
sint64 u_295_302,
sint64 v_295_302,
sint64 r_295_302,
sint64 s_295_302,
bit ne
)={
    u_295_301 * neg_f_295_low60_0_low20_0 + v_295_301 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_6 * (-(2**20)),
    r_295_301 * neg_f_295_low60_0_low20_0 + s_295_301 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_6 * (-(2**20))
&&
    u_295_301 * neg_f_295_low60_0_low20_0 + v_295_301 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_6 * (const 64 (-(2**20))),
    r_295_301 * neg_f_295_low60_0_low20_0 + s_295_301 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_6 + u_295_301 * (const 64 (2**21)) + v_295_301 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_6 + r_295_301 * (const 64 (2**21)) + s_295_301 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_6,
    neg_f_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_6,
    neg_g_295_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 301)) <=s delta, delta <=s (const 64 (1 + 2*301)),
    (const 64 (-(2**20))) <=s u_295_301, u_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_301, v_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_301, r_295_301 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_301, s_295_301 <=s (const 64 ((2**20))),
    u_295_301 + v_295_301 <=s (const 64 (2**20)),
    u_295_301 - v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 + v_295_301 <=s (const 64 (2**20)),
    (const 64 0) - u_295_301 - v_295_301 <=s (const 64 (2**20)),
    r_295_301 + s_295_301 <=s (const 64 (2**20)),
    r_295_301 - s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 + s_295_301 <=s (const 64 (2**20)),
    (const 64 0) - r_295_301 - s_295_301 <=s (const 64 (2**20)),
    u_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_295_301 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_295_301 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step301

// premise c
assume
neg_g_295_low60_0_low20_6 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_7 neg_g_295_low60_0_low20_6;
mov u_295_302 r_295_301;
mov v_295_302 s_295_301;

subs dc neg_g_295_low60_0_low20_7 neg_g_295_low60_0_low20_6 neg_f_295_low60_0_low20_6;
asr neg_g_295_low60_0_low20_7 neg_g_295_low60_0_low20_7 1;
subs dc r_295_302 r_295_301 u_295_301;
asr r_295_302 r_295_302 1;
subs dc s_295_302 s_295_301 v_295_301;
asr s_295_302 s_295_302 1;
assert
    true
&&
    neg_f_295_low60_0_low20_7 = neg_g_295_low60_0_low20_6,
    u_295_302 = r_295_301,
    v_295_302 = s_295_301,
    neg_g_295_low60_0_low20_7 * (const 64 2) = neg_g_295_low60_0_low20_6 - neg_f_295_low60_0_low20_6,
    r_295_302 * (const 64 2) = r_295_301 - u_295_301,
    s_295_302 * (const 64 2) = s_295_301 - v_295_301
;

assume
    neg_f_295_low60_0_low20_7 = neg_g_295_low60_0_low20_6,
    u_295_302 = r_295_301,
    v_295_302 = s_295_301,
    neg_g_295_low60_0_low20_7 * 2 = neg_g_295_low60_0_low20_6 - neg_f_295_low60_0_low20_6,
    r_295_302 * 2 = r_295_301 - u_295_301,
    s_295_302 * 2 = s_295_301 - v_295_301
&&
    true
;

{
    u_295_302 * neg_f_295_low60_0_low20_0 + v_295_302 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_302 * neg_f_295_low60_0_low20_0 + s_295_302 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_7 + u_295_302 * (const 64 (2**21)) + v_295_302 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_7 + r_295_302 * (const 64 (2**21)) + s_295_302 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_7,
    neg_f_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_7,
    neg_g_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 302)) <=s delta, delta <=s (const 64 (1 + 2*302)),
    (const 64 (-(2**20))) <=s u_295_302, u_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_302, v_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_302, r_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_302, s_295_302 <=s (const 64 ((2**20))),
    u_295_302 + v_295_302 <=s (const 64 (2**20)),
    u_295_302 - v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 + v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 - v_295_302 <=s (const 64 (2**20)),
    r_295_302 + s_295_302 <=s (const 64 (2**20)),
    r_295_302 - s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 + s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 - s_295_302 <=s (const 64 (2**20)),
    u_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_295_302 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_302_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_7,
sint64 neg_g_295_low60_0_low20_7,
sint64 neg_f_295_low60_0_low20_8,
sint64 neg_g_295_low60_0_low20_8,
sint64 u_295_302,
sint64 v_295_302,
sint64 r_295_302,
sint64 s_295_302,
sint64 u_295_303,
sint64 v_295_303,
sint64 r_295_303,
sint64 s_295_303,
bit ne
)={
    u_295_302 * neg_f_295_low60_0_low20_0 + v_295_302 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_7 * (-(2**20)),
    r_295_302 * neg_f_295_low60_0_low20_0 + s_295_302 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_7 * (-(2**20))
&&
    u_295_302 * neg_f_295_low60_0_low20_0 + v_295_302 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_7 * (const 64 (-(2**20))),
    r_295_302 * neg_f_295_low60_0_low20_0 + s_295_302 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_7 + u_295_302 * (const 64 (2**21)) + v_295_302 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_7 + r_295_302 * (const 64 (2**21)) + s_295_302 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_7,
    neg_f_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_7,
    neg_g_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 302)) <=s delta, delta <=s (const 64 (1 + 2*302)),
    (const 64 (-(2**20))) <=s u_295_302, u_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_302, v_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_302, r_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_302, s_295_302 <=s (const 64 ((2**20))),
    u_295_302 + v_295_302 <=s (const 64 (2**20)),
    u_295_302 - v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 + v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 - v_295_302 <=s (const 64 (2**20)),
    r_295_302 + s_295_302 <=s (const 64 (2**20)),
    r_295_302 - s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 + s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 - s_295_302 <=s (const 64 (2**20)),
    u_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_295_302 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step302

// premise a
assume
neg_g_295_low60_0_low20_7 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_8 neg_f_295_low60_0_low20_7;
mov u_295_303 u_295_302;
mov v_295_303 v_295_302;

asr neg_g_295_low60_0_low20_8 neg_g_295_low60_0_low20_7 1;
asr r_295_303 r_295_302 1;
asr s_295_303 s_295_302 1;
assert
    true
&&
    neg_f_295_low60_0_low20_8 = neg_f_295_low60_0_low20_7,
    u_295_303 = u_295_302,
    v_295_303 = v_295_302,
    neg_g_295_low60_0_low20_8 * (const 64 2) = neg_g_295_low60_0_low20_7,
    r_295_303 * (const 64 2) = r_295_302,
    s_295_303 * (const 64 2) = s_295_302
;

assume
    neg_f_295_low60_0_low20_8 = neg_f_295_low60_0_low20_7,
    u_295_303 = u_295_302,
    v_295_303 = v_295_302,
    neg_g_295_low60_0_low20_8 * 2 = neg_g_295_low60_0_low20_7,
    r_295_303 * 2 = r_295_302,
    s_295_303 * 2 = s_295_302
&&
    true
;

{
    u_295_303 * neg_f_295_low60_0_low20_0 + v_295_303 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_303 * neg_f_295_low60_0_low20_0 + s_295_303 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_8 + u_295_303 * (const 64 (2**21)) + v_295_303 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_8 + r_295_303 * (const 64 (2**21)) + s_295_303 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_8,
    neg_f_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_8,
    neg_g_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 303)) <=s delta, delta <=s (const 64 (1 + 2*303)),
    (const 64 (-(2**20))) <=s u_295_303, u_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_303, v_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_303, r_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_303, s_295_303 <=s (const 64 ((2**20))),
    u_295_303 + v_295_303 <=s (const 64 (2**20)),
    u_295_303 - v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 + v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 - v_295_303 <=s (const 64 (2**20)),
    r_295_303 + s_295_303 <=s (const 64 (2**20)),
    r_295_303 - s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 + s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 - s_295_303 <=s (const 64 (2**20)),
    u_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_295_303 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_302_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_7,
sint64 neg_g_295_low60_0_low20_7,
sint64 neg_f_295_low60_0_low20_8,
sint64 neg_g_295_low60_0_low20_8,
sint64 u_295_302,
sint64 v_295_302,
sint64 r_295_302,
sint64 s_295_302,
sint64 u_295_303,
sint64 v_295_303,
sint64 r_295_303,
sint64 s_295_303,
bit ne
)={
    u_295_302 * neg_f_295_low60_0_low20_0 + v_295_302 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_7 * (-(2**20)),
    r_295_302 * neg_f_295_low60_0_low20_0 + s_295_302 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_7 * (-(2**20))
&&
    u_295_302 * neg_f_295_low60_0_low20_0 + v_295_302 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_7 * (const 64 (-(2**20))),
    r_295_302 * neg_f_295_low60_0_low20_0 + s_295_302 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_7 + u_295_302 * (const 64 (2**21)) + v_295_302 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_7 + r_295_302 * (const 64 (2**21)) + s_295_302 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_7,
    neg_f_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_7,
    neg_g_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 302)) <=s delta, delta <=s (const 64 (1 + 2*302)),
    (const 64 (-(2**20))) <=s u_295_302, u_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_302, v_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_302, r_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_302, s_295_302 <=s (const 64 ((2**20))),
    u_295_302 + v_295_302 <=s (const 64 (2**20)),
    u_295_302 - v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 + v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 - v_295_302 <=s (const 64 (2**20)),
    r_295_302 + s_295_302 <=s (const 64 (2**20)),
    r_295_302 - s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 + s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 - s_295_302 <=s (const 64 (2**20)),
    u_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_295_302 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step302

// premise b
assume
neg_g_295_low60_0_low20_7 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_8 neg_f_295_low60_0_low20_7;
mov u_295_303 u_295_302;
mov v_295_303 v_295_302;

add neg_g_295_low60_0_low20_8 neg_g_295_low60_0_low20_7 neg_f_295_low60_0_low20_7;
asr neg_g_295_low60_0_low20_8 neg_g_295_low60_0_low20_8 1;
add r_295_303 r_295_302 u_295_302;
asr r_295_303 r_295_303 1;
add s_295_303 s_295_302 v_295_302;
asr s_295_303 s_295_303 1;
assert
    true
&&
    neg_f_295_low60_0_low20_8 = neg_f_295_low60_0_low20_7,
    u_295_303 = u_295_302,
    v_295_303 = v_295_302,
    neg_g_295_low60_0_low20_8 * (const 64 2) = neg_g_295_low60_0_low20_7 + neg_f_295_low60_0_low20_7,
    r_295_303 * (const 64 2) = r_295_302 + u_295_302,
    s_295_303 * (const 64 2) = s_295_302 + v_295_302
;

assume
    neg_f_295_low60_0_low20_8 = neg_f_295_low60_0_low20_7,
    u_295_303 = u_295_302,
    v_295_303 = v_295_302,
    neg_g_295_low60_0_low20_8 * 2 = neg_g_295_low60_0_low20_7 + neg_f_295_low60_0_low20_7,
    r_295_303 * 2 = r_295_302 + u_295_302,
    s_295_303 * 2 = s_295_302 + v_295_302
&&
    true
;

{
    u_295_303 * neg_f_295_low60_0_low20_0 + v_295_303 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_303 * neg_f_295_low60_0_low20_0 + s_295_303 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_8 + u_295_303 * (const 64 (2**21)) + v_295_303 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_8 + r_295_303 * (const 64 (2**21)) + s_295_303 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_8,
    neg_f_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_8,
    neg_g_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 303)) <=s delta, delta <=s (const 64 (1 + 2*303)),
    (const 64 (-(2**20))) <=s u_295_303, u_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_303, v_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_303, r_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_303, s_295_303 <=s (const 64 ((2**20))),
    u_295_303 + v_295_303 <=s (const 64 (2**20)),
    u_295_303 - v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 + v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 - v_295_303 <=s (const 64 (2**20)),
    r_295_303 + s_295_303 <=s (const 64 (2**20)),
    r_295_303 - s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 + s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 - s_295_303 <=s (const 64 (2**20)),
    u_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_295_303 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_302_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_7,
sint64 neg_g_295_low60_0_low20_7,
sint64 neg_f_295_low60_0_low20_8,
sint64 neg_g_295_low60_0_low20_8,
sint64 u_295_302,
sint64 v_295_302,
sint64 r_295_302,
sint64 s_295_302,
sint64 u_295_303,
sint64 v_295_303,
sint64 r_295_303,
sint64 s_295_303,
bit ne
)={
    u_295_302 * neg_f_295_low60_0_low20_0 + v_295_302 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_7 * (-(2**20)),
    r_295_302 * neg_f_295_low60_0_low20_0 + s_295_302 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_7 * (-(2**20))
&&
    u_295_302 * neg_f_295_low60_0_low20_0 + v_295_302 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_7 * (const 64 (-(2**20))),
    r_295_302 * neg_f_295_low60_0_low20_0 + s_295_302 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_7 + u_295_302 * (const 64 (2**21)) + v_295_302 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_7 + r_295_302 * (const 64 (2**21)) + s_295_302 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_7,
    neg_f_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_7,
    neg_g_295_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 302)) <=s delta, delta <=s (const 64 (1 + 2*302)),
    (const 64 (-(2**20))) <=s u_295_302, u_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_302, v_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_302, r_295_302 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_302, s_295_302 <=s (const 64 ((2**20))),
    u_295_302 + v_295_302 <=s (const 64 (2**20)),
    u_295_302 - v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 + v_295_302 <=s (const 64 (2**20)),
    (const 64 0) - u_295_302 - v_295_302 <=s (const 64 (2**20)),
    r_295_302 + s_295_302 <=s (const 64 (2**20)),
    r_295_302 - s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 + s_295_302 <=s (const 64 (2**20)),
    (const 64 0) - r_295_302 - s_295_302 <=s (const 64 (2**20)),
    u_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_295_302 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_295_302 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step302

// premise c
assume
neg_g_295_low60_0_low20_7 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_8 neg_g_295_low60_0_low20_7;
mov u_295_303 r_295_302;
mov v_295_303 s_295_302;

subs dc neg_g_295_low60_0_low20_8 neg_g_295_low60_0_low20_7 neg_f_295_low60_0_low20_7;
asr neg_g_295_low60_0_low20_8 neg_g_295_low60_0_low20_8 1;
subs dc r_295_303 r_295_302 u_295_302;
asr r_295_303 r_295_303 1;
subs dc s_295_303 s_295_302 v_295_302;
asr s_295_303 s_295_303 1;
assert
    true
&&
    neg_f_295_low60_0_low20_8 = neg_g_295_low60_0_low20_7,
    u_295_303 = r_295_302,
    v_295_303 = s_295_302,
    neg_g_295_low60_0_low20_8 * (const 64 2) = neg_g_295_low60_0_low20_7 - neg_f_295_low60_0_low20_7,
    r_295_303 * (const 64 2) = r_295_302 - u_295_302,
    s_295_303 * (const 64 2) = s_295_302 - v_295_302
;

assume
    neg_f_295_low60_0_low20_8 = neg_g_295_low60_0_low20_7,
    u_295_303 = r_295_302,
    v_295_303 = s_295_302,
    neg_g_295_low60_0_low20_8 * 2 = neg_g_295_low60_0_low20_7 - neg_f_295_low60_0_low20_7,
    r_295_303 * 2 = r_295_302 - u_295_302,
    s_295_303 * 2 = s_295_302 - v_295_302
&&
    true
;

{
    u_295_303 * neg_f_295_low60_0_low20_0 + v_295_303 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_303 * neg_f_295_low60_0_low20_0 + s_295_303 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_8 + u_295_303 * (const 64 (2**21)) + v_295_303 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_8 + r_295_303 * (const 64 (2**21)) + s_295_303 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_8,
    neg_f_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_8,
    neg_g_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 303)) <=s delta, delta <=s (const 64 (1 + 2*303)),
    (const 64 (-(2**20))) <=s u_295_303, u_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_303, v_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_303, r_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_303, s_295_303 <=s (const 64 ((2**20))),
    u_295_303 + v_295_303 <=s (const 64 (2**20)),
    u_295_303 - v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 + v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 - v_295_303 <=s (const 64 (2**20)),
    r_295_303 + s_295_303 <=s (const 64 (2**20)),
    r_295_303 - s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 + s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 - s_295_303 <=s (const 64 (2**20)),
    u_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_295_303 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_303_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_8,
sint64 neg_g_295_low60_0_low20_8,
sint64 neg_f_295_low60_0_low20_9,
sint64 neg_g_295_low60_0_low20_9,
sint64 u_295_303,
sint64 v_295_303,
sint64 r_295_303,
sint64 s_295_303,
sint64 u_295_304,
sint64 v_295_304,
sint64 r_295_304,
sint64 s_295_304,
bit ne
)={
    u_295_303 * neg_f_295_low60_0_low20_0 + v_295_303 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_8 * (-(2**20)),
    r_295_303 * neg_f_295_low60_0_low20_0 + s_295_303 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_8 * (-(2**20))
&&
    u_295_303 * neg_f_295_low60_0_low20_0 + v_295_303 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_8 * (const 64 (-(2**20))),
    r_295_303 * neg_f_295_low60_0_low20_0 + s_295_303 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_8 + u_295_303 * (const 64 (2**21)) + v_295_303 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_8 + r_295_303 * (const 64 (2**21)) + s_295_303 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_8,
    neg_f_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_8,
    neg_g_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 303)) <=s delta, delta <=s (const 64 (1 + 2*303)),
    (const 64 (-(2**20))) <=s u_295_303, u_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_303, v_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_303, r_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_303, s_295_303 <=s (const 64 ((2**20))),
    u_295_303 + v_295_303 <=s (const 64 (2**20)),
    u_295_303 - v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 + v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 - v_295_303 <=s (const 64 (2**20)),
    r_295_303 + s_295_303 <=s (const 64 (2**20)),
    r_295_303 - s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 + s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 - s_295_303 <=s (const 64 (2**20)),
    u_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_295_303 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step303

// premise a
assume
neg_g_295_low60_0_low20_8 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_9 neg_f_295_low60_0_low20_8;
mov u_295_304 u_295_303;
mov v_295_304 v_295_303;

asr neg_g_295_low60_0_low20_9 neg_g_295_low60_0_low20_8 1;
asr r_295_304 r_295_303 1;
asr s_295_304 s_295_303 1;
assert
    true
&&
    neg_f_295_low60_0_low20_9 = neg_f_295_low60_0_low20_8,
    u_295_304 = u_295_303,
    v_295_304 = v_295_303,
    neg_g_295_low60_0_low20_9 * (const 64 2) = neg_g_295_low60_0_low20_8,
    r_295_304 * (const 64 2) = r_295_303,
    s_295_304 * (const 64 2) = s_295_303
;

assume
    neg_f_295_low60_0_low20_9 = neg_f_295_low60_0_low20_8,
    u_295_304 = u_295_303,
    v_295_304 = v_295_303,
    neg_g_295_low60_0_low20_9 * 2 = neg_g_295_low60_0_low20_8,
    r_295_304 * 2 = r_295_303,
    s_295_304 * 2 = s_295_303
&&
    true
;

{
    u_295_304 * neg_f_295_low60_0_low20_0 + v_295_304 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_304 * neg_f_295_low60_0_low20_0 + s_295_304 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_9 + u_295_304 * (const 64 (2**21)) + v_295_304 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_9 + r_295_304 * (const 64 (2**21)) + s_295_304 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_9,
    neg_f_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_9,
    neg_g_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 304)) <=s delta, delta <=s (const 64 (1 + 2*304)),
    (const 64 (-(2**20))) <=s u_295_304, u_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_304, v_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_304, r_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_304, s_295_304 <=s (const 64 ((2**20))),
    u_295_304 + v_295_304 <=s (const 64 (2**20)),
    u_295_304 - v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 + v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 - v_295_304 <=s (const 64 (2**20)),
    r_295_304 + s_295_304 <=s (const 64 (2**20)),
    r_295_304 - s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 + s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 - s_295_304 <=s (const 64 (2**20)),
    u_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_295_304 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_303_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_8,
sint64 neg_g_295_low60_0_low20_8,
sint64 neg_f_295_low60_0_low20_9,
sint64 neg_g_295_low60_0_low20_9,
sint64 u_295_303,
sint64 v_295_303,
sint64 r_295_303,
sint64 s_295_303,
sint64 u_295_304,
sint64 v_295_304,
sint64 r_295_304,
sint64 s_295_304,
bit ne
)={
    u_295_303 * neg_f_295_low60_0_low20_0 + v_295_303 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_8 * (-(2**20)),
    r_295_303 * neg_f_295_low60_0_low20_0 + s_295_303 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_8 * (-(2**20))
&&
    u_295_303 * neg_f_295_low60_0_low20_0 + v_295_303 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_8 * (const 64 (-(2**20))),
    r_295_303 * neg_f_295_low60_0_low20_0 + s_295_303 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_8 + u_295_303 * (const 64 (2**21)) + v_295_303 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_8 + r_295_303 * (const 64 (2**21)) + s_295_303 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_8,
    neg_f_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_8,
    neg_g_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 303)) <=s delta, delta <=s (const 64 (1 + 2*303)),
    (const 64 (-(2**20))) <=s u_295_303, u_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_303, v_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_303, r_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_303, s_295_303 <=s (const 64 ((2**20))),
    u_295_303 + v_295_303 <=s (const 64 (2**20)),
    u_295_303 - v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 + v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 - v_295_303 <=s (const 64 (2**20)),
    r_295_303 + s_295_303 <=s (const 64 (2**20)),
    r_295_303 - s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 + s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 - s_295_303 <=s (const 64 (2**20)),
    u_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_295_303 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step303

// premise b
assume
neg_g_295_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_9 neg_f_295_low60_0_low20_8;
mov u_295_304 u_295_303;
mov v_295_304 v_295_303;

add neg_g_295_low60_0_low20_9 neg_g_295_low60_0_low20_8 neg_f_295_low60_0_low20_8;
asr neg_g_295_low60_0_low20_9 neg_g_295_low60_0_low20_9 1;
add r_295_304 r_295_303 u_295_303;
asr r_295_304 r_295_304 1;
add s_295_304 s_295_303 v_295_303;
asr s_295_304 s_295_304 1;
assert
    true
&&
    neg_f_295_low60_0_low20_9 = neg_f_295_low60_0_low20_8,
    u_295_304 = u_295_303,
    v_295_304 = v_295_303,
    neg_g_295_low60_0_low20_9 * (const 64 2) = neg_g_295_low60_0_low20_8 + neg_f_295_low60_0_low20_8,
    r_295_304 * (const 64 2) = r_295_303 + u_295_303,
    s_295_304 * (const 64 2) = s_295_303 + v_295_303
;

assume
    neg_f_295_low60_0_low20_9 = neg_f_295_low60_0_low20_8,
    u_295_304 = u_295_303,
    v_295_304 = v_295_303,
    neg_g_295_low60_0_low20_9 * 2 = neg_g_295_low60_0_low20_8 + neg_f_295_low60_0_low20_8,
    r_295_304 * 2 = r_295_303 + u_295_303,
    s_295_304 * 2 = s_295_303 + v_295_303
&&
    true
;

{
    u_295_304 * neg_f_295_low60_0_low20_0 + v_295_304 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_304 * neg_f_295_low60_0_low20_0 + s_295_304 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_9 + u_295_304 * (const 64 (2**21)) + v_295_304 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_9 + r_295_304 * (const 64 (2**21)) + s_295_304 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_9,
    neg_f_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_9,
    neg_g_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 304)) <=s delta, delta <=s (const 64 (1 + 2*304)),
    (const 64 (-(2**20))) <=s u_295_304, u_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_304, v_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_304, r_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_304, s_295_304 <=s (const 64 ((2**20))),
    u_295_304 + v_295_304 <=s (const 64 (2**20)),
    u_295_304 - v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 + v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 - v_295_304 <=s (const 64 (2**20)),
    r_295_304 + s_295_304 <=s (const 64 (2**20)),
    r_295_304 - s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 + s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 - s_295_304 <=s (const 64 (2**20)),
    u_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_295_304 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_303_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_8,
sint64 neg_g_295_low60_0_low20_8,
sint64 neg_f_295_low60_0_low20_9,
sint64 neg_g_295_low60_0_low20_9,
sint64 u_295_303,
sint64 v_295_303,
sint64 r_295_303,
sint64 s_295_303,
sint64 u_295_304,
sint64 v_295_304,
sint64 r_295_304,
sint64 s_295_304,
bit ne
)={
    u_295_303 * neg_f_295_low60_0_low20_0 + v_295_303 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_8 * (-(2**20)),
    r_295_303 * neg_f_295_low60_0_low20_0 + s_295_303 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_8 * (-(2**20))
&&
    u_295_303 * neg_f_295_low60_0_low20_0 + v_295_303 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_8 * (const 64 (-(2**20))),
    r_295_303 * neg_f_295_low60_0_low20_0 + s_295_303 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_8 + u_295_303 * (const 64 (2**21)) + v_295_303 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_8 + r_295_303 * (const 64 (2**21)) + s_295_303 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_8,
    neg_f_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_8,
    neg_g_295_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 303)) <=s delta, delta <=s (const 64 (1 + 2*303)),
    (const 64 (-(2**20))) <=s u_295_303, u_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_303, v_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_303, r_295_303 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_303, s_295_303 <=s (const 64 ((2**20))),
    u_295_303 + v_295_303 <=s (const 64 (2**20)),
    u_295_303 - v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 + v_295_303 <=s (const 64 (2**20)),
    (const 64 0) - u_295_303 - v_295_303 <=s (const 64 (2**20)),
    r_295_303 + s_295_303 <=s (const 64 (2**20)),
    r_295_303 - s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 + s_295_303 <=s (const 64 (2**20)),
    (const 64 0) - r_295_303 - s_295_303 <=s (const 64 (2**20)),
    u_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_295_303 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_295_303 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step303

// premise c
assume
neg_g_295_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_9 neg_g_295_low60_0_low20_8;
mov u_295_304 r_295_303;
mov v_295_304 s_295_303;

subs dc neg_g_295_low60_0_low20_9 neg_g_295_low60_0_low20_8 neg_f_295_low60_0_low20_8;
asr neg_g_295_low60_0_low20_9 neg_g_295_low60_0_low20_9 1;
subs dc r_295_304 r_295_303 u_295_303;
asr r_295_304 r_295_304 1;
subs dc s_295_304 s_295_303 v_295_303;
asr s_295_304 s_295_304 1;
assert
    true
&&
    neg_f_295_low60_0_low20_9 = neg_g_295_low60_0_low20_8,
    u_295_304 = r_295_303,
    v_295_304 = s_295_303,
    neg_g_295_low60_0_low20_9 * (const 64 2) = neg_g_295_low60_0_low20_8 - neg_f_295_low60_0_low20_8,
    r_295_304 * (const 64 2) = r_295_303 - u_295_303,
    s_295_304 * (const 64 2) = s_295_303 - v_295_303
;

assume
    neg_f_295_low60_0_low20_9 = neg_g_295_low60_0_low20_8,
    u_295_304 = r_295_303,
    v_295_304 = s_295_303,
    neg_g_295_low60_0_low20_9 * 2 = neg_g_295_low60_0_low20_8 - neg_f_295_low60_0_low20_8,
    r_295_304 * 2 = r_295_303 - u_295_303,
    s_295_304 * 2 = s_295_303 - v_295_303
&&
    true
;

{
    u_295_304 * neg_f_295_low60_0_low20_0 + v_295_304 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_304 * neg_f_295_low60_0_low20_0 + s_295_304 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_9 + u_295_304 * (const 64 (2**21)) + v_295_304 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_9 + r_295_304 * (const 64 (2**21)) + s_295_304 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_9,
    neg_f_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_9,
    neg_g_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 304)) <=s delta, delta <=s (const 64 (1 + 2*304)),
    (const 64 (-(2**20))) <=s u_295_304, u_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_304, v_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_304, r_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_304, s_295_304 <=s (const 64 ((2**20))),
    u_295_304 + v_295_304 <=s (const 64 (2**20)),
    u_295_304 - v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 + v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 - v_295_304 <=s (const 64 (2**20)),
    r_295_304 + s_295_304 <=s (const 64 (2**20)),
    r_295_304 - s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 + s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 - s_295_304 <=s (const 64 (2**20)),
    u_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_295_304 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_304_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_9,
sint64 neg_g_295_low60_0_low20_9,
sint64 neg_f_295_low60_0_low20_10,
sint64 neg_g_295_low60_0_low20_10,
sint64 u_295_304,
sint64 v_295_304,
sint64 r_295_304,
sint64 s_295_304,
sint64 u_295_305,
sint64 v_295_305,
sint64 r_295_305,
sint64 s_295_305,
bit ne
)={
    u_295_304 * neg_f_295_low60_0_low20_0 + v_295_304 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_9 * (-(2**20)),
    r_295_304 * neg_f_295_low60_0_low20_0 + s_295_304 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_9 * (-(2**20))
&&
    u_295_304 * neg_f_295_low60_0_low20_0 + v_295_304 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_9 * (const 64 (-(2**20))),
    r_295_304 * neg_f_295_low60_0_low20_0 + s_295_304 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_9 + u_295_304 * (const 64 (2**21)) + v_295_304 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_9 + r_295_304 * (const 64 (2**21)) + s_295_304 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_9,
    neg_f_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_9,
    neg_g_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 304)) <=s delta, delta <=s (const 64 (1 + 2*304)),
    (const 64 (-(2**20))) <=s u_295_304, u_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_304, v_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_304, r_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_304, s_295_304 <=s (const 64 ((2**20))),
    u_295_304 + v_295_304 <=s (const 64 (2**20)),
    u_295_304 - v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 + v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 - v_295_304 <=s (const 64 (2**20)),
    r_295_304 + s_295_304 <=s (const 64 (2**20)),
    r_295_304 - s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 + s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 - s_295_304 <=s (const 64 (2**20)),
    u_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_295_304 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step304

// premise a
assume
neg_g_295_low60_0_low20_9 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_10 neg_f_295_low60_0_low20_9;
mov u_295_305 u_295_304;
mov v_295_305 v_295_304;

asr neg_g_295_low60_0_low20_10 neg_g_295_low60_0_low20_9 1;
asr r_295_305 r_295_304 1;
asr s_295_305 s_295_304 1;
assert
    true
&&
    neg_f_295_low60_0_low20_10 = neg_f_295_low60_0_low20_9,
    u_295_305 = u_295_304,
    v_295_305 = v_295_304,
    neg_g_295_low60_0_low20_10 * (const 64 2) = neg_g_295_low60_0_low20_9,
    r_295_305 * (const 64 2) = r_295_304,
    s_295_305 * (const 64 2) = s_295_304
;

assume
    neg_f_295_low60_0_low20_10 = neg_f_295_low60_0_low20_9,
    u_295_305 = u_295_304,
    v_295_305 = v_295_304,
    neg_g_295_low60_0_low20_10 * 2 = neg_g_295_low60_0_low20_9,
    r_295_305 * 2 = r_295_304,
    s_295_305 * 2 = s_295_304
&&
    true
;

{
    u_295_305 * neg_f_295_low60_0_low20_0 + v_295_305 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_305 * neg_f_295_low60_0_low20_0 + s_295_305 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_10 + u_295_305 * (const 64 (2**21)) + v_295_305 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_10 + r_295_305 * (const 64 (2**21)) + s_295_305 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_10,
    neg_f_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_10,
    neg_g_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 305)) <=s delta, delta <=s (const 64 (1 + 2*305)),
    (const 64 (-(2**20))) <=s u_295_305, u_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_305, v_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_305, r_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_305, s_295_305 <=s (const 64 ((2**20))),
    u_295_305 + v_295_305 <=s (const 64 (2**20)),
    u_295_305 - v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 + v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 - v_295_305 <=s (const 64 (2**20)),
    r_295_305 + s_295_305 <=s (const 64 (2**20)),
    r_295_305 - s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 + s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 - s_295_305 <=s (const 64 (2**20)),
    u_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_295_305 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_304_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_9,
sint64 neg_g_295_low60_0_low20_9,
sint64 neg_f_295_low60_0_low20_10,
sint64 neg_g_295_low60_0_low20_10,
sint64 u_295_304,
sint64 v_295_304,
sint64 r_295_304,
sint64 s_295_304,
sint64 u_295_305,
sint64 v_295_305,
sint64 r_295_305,
sint64 s_295_305,
bit ne
)={
    u_295_304 * neg_f_295_low60_0_low20_0 + v_295_304 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_9 * (-(2**20)),
    r_295_304 * neg_f_295_low60_0_low20_0 + s_295_304 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_9 * (-(2**20))
&&
    u_295_304 * neg_f_295_low60_0_low20_0 + v_295_304 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_9 * (const 64 (-(2**20))),
    r_295_304 * neg_f_295_low60_0_low20_0 + s_295_304 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_9 + u_295_304 * (const 64 (2**21)) + v_295_304 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_9 + r_295_304 * (const 64 (2**21)) + s_295_304 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_9,
    neg_f_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_9,
    neg_g_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 304)) <=s delta, delta <=s (const 64 (1 + 2*304)),
    (const 64 (-(2**20))) <=s u_295_304, u_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_304, v_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_304, r_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_304, s_295_304 <=s (const 64 ((2**20))),
    u_295_304 + v_295_304 <=s (const 64 (2**20)),
    u_295_304 - v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 + v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 - v_295_304 <=s (const 64 (2**20)),
    r_295_304 + s_295_304 <=s (const 64 (2**20)),
    r_295_304 - s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 + s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 - s_295_304 <=s (const 64 (2**20)),
    u_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_295_304 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step304

// premise b
assume
neg_g_295_low60_0_low20_9 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_10 neg_f_295_low60_0_low20_9;
mov u_295_305 u_295_304;
mov v_295_305 v_295_304;

add neg_g_295_low60_0_low20_10 neg_g_295_low60_0_low20_9 neg_f_295_low60_0_low20_9;
asr neg_g_295_low60_0_low20_10 neg_g_295_low60_0_low20_10 1;
add r_295_305 r_295_304 u_295_304;
asr r_295_305 r_295_305 1;
add s_295_305 s_295_304 v_295_304;
asr s_295_305 s_295_305 1;
assert
    true
&&
    neg_f_295_low60_0_low20_10 = neg_f_295_low60_0_low20_9,
    u_295_305 = u_295_304,
    v_295_305 = v_295_304,
    neg_g_295_low60_0_low20_10 * (const 64 2) = neg_g_295_low60_0_low20_9 + neg_f_295_low60_0_low20_9,
    r_295_305 * (const 64 2) = r_295_304 + u_295_304,
    s_295_305 * (const 64 2) = s_295_304 + v_295_304
;

assume
    neg_f_295_low60_0_low20_10 = neg_f_295_low60_0_low20_9,
    u_295_305 = u_295_304,
    v_295_305 = v_295_304,
    neg_g_295_low60_0_low20_10 * 2 = neg_g_295_low60_0_low20_9 + neg_f_295_low60_0_low20_9,
    r_295_305 * 2 = r_295_304 + u_295_304,
    s_295_305 * 2 = s_295_304 + v_295_304
&&
    true
;

{
    u_295_305 * neg_f_295_low60_0_low20_0 + v_295_305 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_305 * neg_f_295_low60_0_low20_0 + s_295_305 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_10 + u_295_305 * (const 64 (2**21)) + v_295_305 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_10 + r_295_305 * (const 64 (2**21)) + s_295_305 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_10,
    neg_f_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_10,
    neg_g_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 305)) <=s delta, delta <=s (const 64 (1 + 2*305)),
    (const 64 (-(2**20))) <=s u_295_305, u_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_305, v_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_305, r_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_305, s_295_305 <=s (const 64 ((2**20))),
    u_295_305 + v_295_305 <=s (const 64 (2**20)),
    u_295_305 - v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 + v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 - v_295_305 <=s (const 64 (2**20)),
    r_295_305 + s_295_305 <=s (const 64 (2**20)),
    r_295_305 - s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 + s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 - s_295_305 <=s (const 64 (2**20)),
    u_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_295_305 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_304_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_9,
sint64 neg_g_295_low60_0_low20_9,
sint64 neg_f_295_low60_0_low20_10,
sint64 neg_g_295_low60_0_low20_10,
sint64 u_295_304,
sint64 v_295_304,
sint64 r_295_304,
sint64 s_295_304,
sint64 u_295_305,
sint64 v_295_305,
sint64 r_295_305,
sint64 s_295_305,
bit ne
)={
    u_295_304 * neg_f_295_low60_0_low20_0 + v_295_304 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_9 * (-(2**20)),
    r_295_304 * neg_f_295_low60_0_low20_0 + s_295_304 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_9 * (-(2**20))
&&
    u_295_304 * neg_f_295_low60_0_low20_0 + v_295_304 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_9 * (const 64 (-(2**20))),
    r_295_304 * neg_f_295_low60_0_low20_0 + s_295_304 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_9 + u_295_304 * (const 64 (2**21)) + v_295_304 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_9 + r_295_304 * (const 64 (2**21)) + s_295_304 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_9,
    neg_f_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_9,
    neg_g_295_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 304)) <=s delta, delta <=s (const 64 (1 + 2*304)),
    (const 64 (-(2**20))) <=s u_295_304, u_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_304, v_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_304, r_295_304 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_304, s_295_304 <=s (const 64 ((2**20))),
    u_295_304 + v_295_304 <=s (const 64 (2**20)),
    u_295_304 - v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 + v_295_304 <=s (const 64 (2**20)),
    (const 64 0) - u_295_304 - v_295_304 <=s (const 64 (2**20)),
    r_295_304 + s_295_304 <=s (const 64 (2**20)),
    r_295_304 - s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 + s_295_304 <=s (const 64 (2**20)),
    (const 64 0) - r_295_304 - s_295_304 <=s (const 64 (2**20)),
    u_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_295_304 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_295_304 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step304

// premise c
assume
neg_g_295_low60_0_low20_9 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_10 neg_g_295_low60_0_low20_9;
mov u_295_305 r_295_304;
mov v_295_305 s_295_304;

subs dc neg_g_295_low60_0_low20_10 neg_g_295_low60_0_low20_9 neg_f_295_low60_0_low20_9;
asr neg_g_295_low60_0_low20_10 neg_g_295_low60_0_low20_10 1;
subs dc r_295_305 r_295_304 u_295_304;
asr r_295_305 r_295_305 1;
subs dc s_295_305 s_295_304 v_295_304;
asr s_295_305 s_295_305 1;
assert
    true
&&
    neg_f_295_low60_0_low20_10 = neg_g_295_low60_0_low20_9,
    u_295_305 = r_295_304,
    v_295_305 = s_295_304,
    neg_g_295_low60_0_low20_10 * (const 64 2) = neg_g_295_low60_0_low20_9 - neg_f_295_low60_0_low20_9,
    r_295_305 * (const 64 2) = r_295_304 - u_295_304,
    s_295_305 * (const 64 2) = s_295_304 - v_295_304
;

assume
    neg_f_295_low60_0_low20_10 = neg_g_295_low60_0_low20_9,
    u_295_305 = r_295_304,
    v_295_305 = s_295_304,
    neg_g_295_low60_0_low20_10 * 2 = neg_g_295_low60_0_low20_9 - neg_f_295_low60_0_low20_9,
    r_295_305 * 2 = r_295_304 - u_295_304,
    s_295_305 * 2 = s_295_304 - v_295_304
&&
    true
;

{
    u_295_305 * neg_f_295_low60_0_low20_0 + v_295_305 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_305 * neg_f_295_low60_0_low20_0 + s_295_305 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_10 + u_295_305 * (const 64 (2**21)) + v_295_305 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_10 + r_295_305 * (const 64 (2**21)) + s_295_305 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_10,
    neg_f_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_10,
    neg_g_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 305)) <=s delta, delta <=s (const 64 (1 + 2*305)),
    (const 64 (-(2**20))) <=s u_295_305, u_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_305, v_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_305, r_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_305, s_295_305 <=s (const 64 ((2**20))),
    u_295_305 + v_295_305 <=s (const 64 (2**20)),
    u_295_305 - v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 + v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 - v_295_305 <=s (const 64 (2**20)),
    r_295_305 + s_295_305 <=s (const 64 (2**20)),
    r_295_305 - s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 + s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 - s_295_305 <=s (const 64 (2**20)),
    u_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_295_305 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_305_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_10,
sint64 neg_g_295_low60_0_low20_10,
sint64 neg_f_295_low60_0_low20_11,
sint64 neg_g_295_low60_0_low20_11,
sint64 u_295_305,
sint64 v_295_305,
sint64 r_295_305,
sint64 s_295_305,
sint64 u_295_306,
sint64 v_295_306,
sint64 r_295_306,
sint64 s_295_306,
bit ne
)={
    u_295_305 * neg_f_295_low60_0_low20_0 + v_295_305 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_10 * (-(2**20)),
    r_295_305 * neg_f_295_low60_0_low20_0 + s_295_305 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_10 * (-(2**20))
&&
    u_295_305 * neg_f_295_low60_0_low20_0 + v_295_305 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_10 * (const 64 (-(2**20))),
    r_295_305 * neg_f_295_low60_0_low20_0 + s_295_305 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_10 + u_295_305 * (const 64 (2**21)) + v_295_305 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_10 + r_295_305 * (const 64 (2**21)) + s_295_305 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_10,
    neg_f_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_10,
    neg_g_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 305)) <=s delta, delta <=s (const 64 (1 + 2*305)),
    (const 64 (-(2**20))) <=s u_295_305, u_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_305, v_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_305, r_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_305, s_295_305 <=s (const 64 ((2**20))),
    u_295_305 + v_295_305 <=s (const 64 (2**20)),
    u_295_305 - v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 + v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 - v_295_305 <=s (const 64 (2**20)),
    r_295_305 + s_295_305 <=s (const 64 (2**20)),
    r_295_305 - s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 + s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 - s_295_305 <=s (const 64 (2**20)),
    u_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_295_305 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step305

// premise a
assume
neg_g_295_low60_0_low20_10 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_11 neg_f_295_low60_0_low20_10;
mov u_295_306 u_295_305;
mov v_295_306 v_295_305;

asr neg_g_295_low60_0_low20_11 neg_g_295_low60_0_low20_10 1;
asr r_295_306 r_295_305 1;
asr s_295_306 s_295_305 1;
assert
    true
&&
    neg_f_295_low60_0_low20_11 = neg_f_295_low60_0_low20_10,
    u_295_306 = u_295_305,
    v_295_306 = v_295_305,
    neg_g_295_low60_0_low20_11 * (const 64 2) = neg_g_295_low60_0_low20_10,
    r_295_306 * (const 64 2) = r_295_305,
    s_295_306 * (const 64 2) = s_295_305
;

assume
    neg_f_295_low60_0_low20_11 = neg_f_295_low60_0_low20_10,
    u_295_306 = u_295_305,
    v_295_306 = v_295_305,
    neg_g_295_low60_0_low20_11 * 2 = neg_g_295_low60_0_low20_10,
    r_295_306 * 2 = r_295_305,
    s_295_306 * 2 = s_295_305
&&
    true
;

{
    u_295_306 * neg_f_295_low60_0_low20_0 + v_295_306 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_306 * neg_f_295_low60_0_low20_0 + s_295_306 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_11 + u_295_306 * (const 64 (2**21)) + v_295_306 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_11 + r_295_306 * (const 64 (2**21)) + s_295_306 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_11,
    neg_f_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_11,
    neg_g_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 306)) <=s delta, delta <=s (const 64 (1 + 2*306)),
    (const 64 (-(2**20))) <=s u_295_306, u_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_306, v_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_306, r_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_306, s_295_306 <=s (const 64 ((2**20))),
    u_295_306 + v_295_306 <=s (const 64 (2**20)),
    u_295_306 - v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 + v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 - v_295_306 <=s (const 64 (2**20)),
    r_295_306 + s_295_306 <=s (const 64 (2**20)),
    r_295_306 - s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 + s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 - s_295_306 <=s (const 64 (2**20)),
    u_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_295_306 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_305_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_10,
sint64 neg_g_295_low60_0_low20_10,
sint64 neg_f_295_low60_0_low20_11,
sint64 neg_g_295_low60_0_low20_11,
sint64 u_295_305,
sint64 v_295_305,
sint64 r_295_305,
sint64 s_295_305,
sint64 u_295_306,
sint64 v_295_306,
sint64 r_295_306,
sint64 s_295_306,
bit ne
)={
    u_295_305 * neg_f_295_low60_0_low20_0 + v_295_305 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_10 * (-(2**20)),
    r_295_305 * neg_f_295_low60_0_low20_0 + s_295_305 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_10 * (-(2**20))
&&
    u_295_305 * neg_f_295_low60_0_low20_0 + v_295_305 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_10 * (const 64 (-(2**20))),
    r_295_305 * neg_f_295_low60_0_low20_0 + s_295_305 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_10 + u_295_305 * (const 64 (2**21)) + v_295_305 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_10 + r_295_305 * (const 64 (2**21)) + s_295_305 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_10,
    neg_f_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_10,
    neg_g_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 305)) <=s delta, delta <=s (const 64 (1 + 2*305)),
    (const 64 (-(2**20))) <=s u_295_305, u_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_305, v_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_305, r_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_305, s_295_305 <=s (const 64 ((2**20))),
    u_295_305 + v_295_305 <=s (const 64 (2**20)),
    u_295_305 - v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 + v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 - v_295_305 <=s (const 64 (2**20)),
    r_295_305 + s_295_305 <=s (const 64 (2**20)),
    r_295_305 - s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 + s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 - s_295_305 <=s (const 64 (2**20)),
    u_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_295_305 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step305

// premise b
assume
neg_g_295_low60_0_low20_10 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_11 neg_f_295_low60_0_low20_10;
mov u_295_306 u_295_305;
mov v_295_306 v_295_305;

add neg_g_295_low60_0_low20_11 neg_g_295_low60_0_low20_10 neg_f_295_low60_0_low20_10;
asr neg_g_295_low60_0_low20_11 neg_g_295_low60_0_low20_11 1;
add r_295_306 r_295_305 u_295_305;
asr r_295_306 r_295_306 1;
add s_295_306 s_295_305 v_295_305;
asr s_295_306 s_295_306 1;
assert
    true
&&
    neg_f_295_low60_0_low20_11 = neg_f_295_low60_0_low20_10,
    u_295_306 = u_295_305,
    v_295_306 = v_295_305,
    neg_g_295_low60_0_low20_11 * (const 64 2) = neg_g_295_low60_0_low20_10 + neg_f_295_low60_0_low20_10,
    r_295_306 * (const 64 2) = r_295_305 + u_295_305,
    s_295_306 * (const 64 2) = s_295_305 + v_295_305
;

assume
    neg_f_295_low60_0_low20_11 = neg_f_295_low60_0_low20_10,
    u_295_306 = u_295_305,
    v_295_306 = v_295_305,
    neg_g_295_low60_0_low20_11 * 2 = neg_g_295_low60_0_low20_10 + neg_f_295_low60_0_low20_10,
    r_295_306 * 2 = r_295_305 + u_295_305,
    s_295_306 * 2 = s_295_305 + v_295_305
&&
    true
;

{
    u_295_306 * neg_f_295_low60_0_low20_0 + v_295_306 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_306 * neg_f_295_low60_0_low20_0 + s_295_306 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_11 + u_295_306 * (const 64 (2**21)) + v_295_306 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_11 + r_295_306 * (const 64 (2**21)) + s_295_306 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_11,
    neg_f_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_11,
    neg_g_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 306)) <=s delta, delta <=s (const 64 (1 + 2*306)),
    (const 64 (-(2**20))) <=s u_295_306, u_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_306, v_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_306, r_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_306, s_295_306 <=s (const 64 ((2**20))),
    u_295_306 + v_295_306 <=s (const 64 (2**20)),
    u_295_306 - v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 + v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 - v_295_306 <=s (const 64 (2**20)),
    r_295_306 + s_295_306 <=s (const 64 (2**20)),
    r_295_306 - s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 + s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 - s_295_306 <=s (const 64 (2**20)),
    u_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_295_306 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_305_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_10,
sint64 neg_g_295_low60_0_low20_10,
sint64 neg_f_295_low60_0_low20_11,
sint64 neg_g_295_low60_0_low20_11,
sint64 u_295_305,
sint64 v_295_305,
sint64 r_295_305,
sint64 s_295_305,
sint64 u_295_306,
sint64 v_295_306,
sint64 r_295_306,
sint64 s_295_306,
bit ne
)={
    u_295_305 * neg_f_295_low60_0_low20_0 + v_295_305 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_10 * (-(2**20)),
    r_295_305 * neg_f_295_low60_0_low20_0 + s_295_305 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_10 * (-(2**20))
&&
    u_295_305 * neg_f_295_low60_0_low20_0 + v_295_305 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_10 * (const 64 (-(2**20))),
    r_295_305 * neg_f_295_low60_0_low20_0 + s_295_305 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_10 + u_295_305 * (const 64 (2**21)) + v_295_305 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_10 + r_295_305 * (const 64 (2**21)) + s_295_305 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_10,
    neg_f_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_10,
    neg_g_295_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 305)) <=s delta, delta <=s (const 64 (1 + 2*305)),
    (const 64 (-(2**20))) <=s u_295_305, u_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_305, v_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_305, r_295_305 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_305, s_295_305 <=s (const 64 ((2**20))),
    u_295_305 + v_295_305 <=s (const 64 (2**20)),
    u_295_305 - v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 + v_295_305 <=s (const 64 (2**20)),
    (const 64 0) - u_295_305 - v_295_305 <=s (const 64 (2**20)),
    r_295_305 + s_295_305 <=s (const 64 (2**20)),
    r_295_305 - s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 + s_295_305 <=s (const 64 (2**20)),
    (const 64 0) - r_295_305 - s_295_305 <=s (const 64 (2**20)),
    u_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_295_305 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_295_305 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step305

// premise c
assume
neg_g_295_low60_0_low20_10 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_11 neg_g_295_low60_0_low20_10;
mov u_295_306 r_295_305;
mov v_295_306 s_295_305;

subs dc neg_g_295_low60_0_low20_11 neg_g_295_low60_0_low20_10 neg_f_295_low60_0_low20_10;
asr neg_g_295_low60_0_low20_11 neg_g_295_low60_0_low20_11 1;
subs dc r_295_306 r_295_305 u_295_305;
asr r_295_306 r_295_306 1;
subs dc s_295_306 s_295_305 v_295_305;
asr s_295_306 s_295_306 1;
assert
    true
&&
    neg_f_295_low60_0_low20_11 = neg_g_295_low60_0_low20_10,
    u_295_306 = r_295_305,
    v_295_306 = s_295_305,
    neg_g_295_low60_0_low20_11 * (const 64 2) = neg_g_295_low60_0_low20_10 - neg_f_295_low60_0_low20_10,
    r_295_306 * (const 64 2) = r_295_305 - u_295_305,
    s_295_306 * (const 64 2) = s_295_305 - v_295_305
;

assume
    neg_f_295_low60_0_low20_11 = neg_g_295_low60_0_low20_10,
    u_295_306 = r_295_305,
    v_295_306 = s_295_305,
    neg_g_295_low60_0_low20_11 * 2 = neg_g_295_low60_0_low20_10 - neg_f_295_low60_0_low20_10,
    r_295_306 * 2 = r_295_305 - u_295_305,
    s_295_306 * 2 = s_295_305 - v_295_305
&&
    true
;

{
    u_295_306 * neg_f_295_low60_0_low20_0 + v_295_306 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_306 * neg_f_295_low60_0_low20_0 + s_295_306 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_11 + u_295_306 * (const 64 (2**21)) + v_295_306 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_11 + r_295_306 * (const 64 (2**21)) + s_295_306 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_11,
    neg_f_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_11,
    neg_g_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 306)) <=s delta, delta <=s (const 64 (1 + 2*306)),
    (const 64 (-(2**20))) <=s u_295_306, u_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_306, v_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_306, r_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_306, s_295_306 <=s (const 64 ((2**20))),
    u_295_306 + v_295_306 <=s (const 64 (2**20)),
    u_295_306 - v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 + v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 - v_295_306 <=s (const 64 (2**20)),
    r_295_306 + s_295_306 <=s (const 64 (2**20)),
    r_295_306 - s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 + s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 - s_295_306 <=s (const 64 (2**20)),
    u_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_295_306 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_306_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_11,
sint64 neg_g_295_low60_0_low20_11,
sint64 neg_f_295_low60_0_low20_12,
sint64 neg_g_295_low60_0_low20_12,
sint64 u_295_306,
sint64 v_295_306,
sint64 r_295_306,
sint64 s_295_306,
sint64 u_295_307,
sint64 v_295_307,
sint64 r_295_307,
sint64 s_295_307,
bit ne
)={
    u_295_306 * neg_f_295_low60_0_low20_0 + v_295_306 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_11 * (-(2**20)),
    r_295_306 * neg_f_295_low60_0_low20_0 + s_295_306 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_11 * (-(2**20))
&&
    u_295_306 * neg_f_295_low60_0_low20_0 + v_295_306 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_11 * (const 64 (-(2**20))),
    r_295_306 * neg_f_295_low60_0_low20_0 + s_295_306 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_11 + u_295_306 * (const 64 (2**21)) + v_295_306 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_11 + r_295_306 * (const 64 (2**21)) + s_295_306 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_11,
    neg_f_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_11,
    neg_g_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 306)) <=s delta, delta <=s (const 64 (1 + 2*306)),
    (const 64 (-(2**20))) <=s u_295_306, u_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_306, v_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_306, r_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_306, s_295_306 <=s (const 64 ((2**20))),
    u_295_306 + v_295_306 <=s (const 64 (2**20)),
    u_295_306 - v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 + v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 - v_295_306 <=s (const 64 (2**20)),
    r_295_306 + s_295_306 <=s (const 64 (2**20)),
    r_295_306 - s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 + s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 - s_295_306 <=s (const 64 (2**20)),
    u_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_295_306 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step306

// premise a
assume
neg_g_295_low60_0_low20_11 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_12 neg_f_295_low60_0_low20_11;
mov u_295_307 u_295_306;
mov v_295_307 v_295_306;

asr neg_g_295_low60_0_low20_12 neg_g_295_low60_0_low20_11 1;
asr r_295_307 r_295_306 1;
asr s_295_307 s_295_306 1;
assert
    true
&&
    neg_f_295_low60_0_low20_12 = neg_f_295_low60_0_low20_11,
    u_295_307 = u_295_306,
    v_295_307 = v_295_306,
    neg_g_295_low60_0_low20_12 * (const 64 2) = neg_g_295_low60_0_low20_11,
    r_295_307 * (const 64 2) = r_295_306,
    s_295_307 * (const 64 2) = s_295_306
;

assume
    neg_f_295_low60_0_low20_12 = neg_f_295_low60_0_low20_11,
    u_295_307 = u_295_306,
    v_295_307 = v_295_306,
    neg_g_295_low60_0_low20_12 * 2 = neg_g_295_low60_0_low20_11,
    r_295_307 * 2 = r_295_306,
    s_295_307 * 2 = s_295_306
&&
    true
;

{
    u_295_307 * neg_f_295_low60_0_low20_0 + v_295_307 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_307 * neg_f_295_low60_0_low20_0 + s_295_307 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_12 + u_295_307 * (const 64 (2**21)) + v_295_307 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_12 + r_295_307 * (const 64 (2**21)) + s_295_307 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_12,
    neg_f_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_12,
    neg_g_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 307)) <=s delta, delta <=s (const 64 (1 + 2*307)),
    (const 64 (-(2**20))) <=s u_295_307, u_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_307, v_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_307, r_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_307, s_295_307 <=s (const 64 ((2**20))),
    u_295_307 + v_295_307 <=s (const 64 (2**20)),
    u_295_307 - v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 + v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 - v_295_307 <=s (const 64 (2**20)),
    r_295_307 + s_295_307 <=s (const 64 (2**20)),
    r_295_307 - s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 + s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 - s_295_307 <=s (const 64 (2**20)),
    u_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_295_307 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_306_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_11,
sint64 neg_g_295_low60_0_low20_11,
sint64 neg_f_295_low60_0_low20_12,
sint64 neg_g_295_low60_0_low20_12,
sint64 u_295_306,
sint64 v_295_306,
sint64 r_295_306,
sint64 s_295_306,
sint64 u_295_307,
sint64 v_295_307,
sint64 r_295_307,
sint64 s_295_307,
bit ne
)={
    u_295_306 * neg_f_295_low60_0_low20_0 + v_295_306 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_11 * (-(2**20)),
    r_295_306 * neg_f_295_low60_0_low20_0 + s_295_306 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_11 * (-(2**20))
&&
    u_295_306 * neg_f_295_low60_0_low20_0 + v_295_306 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_11 * (const 64 (-(2**20))),
    r_295_306 * neg_f_295_low60_0_low20_0 + s_295_306 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_11 + u_295_306 * (const 64 (2**21)) + v_295_306 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_11 + r_295_306 * (const 64 (2**21)) + s_295_306 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_11,
    neg_f_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_11,
    neg_g_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 306)) <=s delta, delta <=s (const 64 (1 + 2*306)),
    (const 64 (-(2**20))) <=s u_295_306, u_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_306, v_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_306, r_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_306, s_295_306 <=s (const 64 ((2**20))),
    u_295_306 + v_295_306 <=s (const 64 (2**20)),
    u_295_306 - v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 + v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 - v_295_306 <=s (const 64 (2**20)),
    r_295_306 + s_295_306 <=s (const 64 (2**20)),
    r_295_306 - s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 + s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 - s_295_306 <=s (const 64 (2**20)),
    u_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_295_306 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step306

// premise b
assume
neg_g_295_low60_0_low20_11 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_12 neg_f_295_low60_0_low20_11;
mov u_295_307 u_295_306;
mov v_295_307 v_295_306;

add neg_g_295_low60_0_low20_12 neg_g_295_low60_0_low20_11 neg_f_295_low60_0_low20_11;
asr neg_g_295_low60_0_low20_12 neg_g_295_low60_0_low20_12 1;
add r_295_307 r_295_306 u_295_306;
asr r_295_307 r_295_307 1;
add s_295_307 s_295_306 v_295_306;
asr s_295_307 s_295_307 1;
assert
    true
&&
    neg_f_295_low60_0_low20_12 = neg_f_295_low60_0_low20_11,
    u_295_307 = u_295_306,
    v_295_307 = v_295_306,
    neg_g_295_low60_0_low20_12 * (const 64 2) = neg_g_295_low60_0_low20_11 + neg_f_295_low60_0_low20_11,
    r_295_307 * (const 64 2) = r_295_306 + u_295_306,
    s_295_307 * (const 64 2) = s_295_306 + v_295_306
;

assume
    neg_f_295_low60_0_low20_12 = neg_f_295_low60_0_low20_11,
    u_295_307 = u_295_306,
    v_295_307 = v_295_306,
    neg_g_295_low60_0_low20_12 * 2 = neg_g_295_low60_0_low20_11 + neg_f_295_low60_0_low20_11,
    r_295_307 * 2 = r_295_306 + u_295_306,
    s_295_307 * 2 = s_295_306 + v_295_306
&&
    true
;

{
    u_295_307 * neg_f_295_low60_0_low20_0 + v_295_307 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_307 * neg_f_295_low60_0_low20_0 + s_295_307 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_12 + u_295_307 * (const 64 (2**21)) + v_295_307 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_12 + r_295_307 * (const 64 (2**21)) + s_295_307 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_12,
    neg_f_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_12,
    neg_g_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 307)) <=s delta, delta <=s (const 64 (1 + 2*307)),
    (const 64 (-(2**20))) <=s u_295_307, u_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_307, v_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_307, r_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_307, s_295_307 <=s (const 64 ((2**20))),
    u_295_307 + v_295_307 <=s (const 64 (2**20)),
    u_295_307 - v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 + v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 - v_295_307 <=s (const 64 (2**20)),
    r_295_307 + s_295_307 <=s (const 64 (2**20)),
    r_295_307 - s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 + s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 - s_295_307 <=s (const 64 (2**20)),
    u_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_295_307 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_306_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_11,
sint64 neg_g_295_low60_0_low20_11,
sint64 neg_f_295_low60_0_low20_12,
sint64 neg_g_295_low60_0_low20_12,
sint64 u_295_306,
sint64 v_295_306,
sint64 r_295_306,
sint64 s_295_306,
sint64 u_295_307,
sint64 v_295_307,
sint64 r_295_307,
sint64 s_295_307,
bit ne
)={
    u_295_306 * neg_f_295_low60_0_low20_0 + v_295_306 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_11 * (-(2**20)),
    r_295_306 * neg_f_295_low60_0_low20_0 + s_295_306 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_11 * (-(2**20))
&&
    u_295_306 * neg_f_295_low60_0_low20_0 + v_295_306 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_11 * (const 64 (-(2**20))),
    r_295_306 * neg_f_295_low60_0_low20_0 + s_295_306 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_11 + u_295_306 * (const 64 (2**21)) + v_295_306 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_11 + r_295_306 * (const 64 (2**21)) + s_295_306 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_11,
    neg_f_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_11,
    neg_g_295_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 306)) <=s delta, delta <=s (const 64 (1 + 2*306)),
    (const 64 (-(2**20))) <=s u_295_306, u_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_306, v_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_306, r_295_306 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_306, s_295_306 <=s (const 64 ((2**20))),
    u_295_306 + v_295_306 <=s (const 64 (2**20)),
    u_295_306 - v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 + v_295_306 <=s (const 64 (2**20)),
    (const 64 0) - u_295_306 - v_295_306 <=s (const 64 (2**20)),
    r_295_306 + s_295_306 <=s (const 64 (2**20)),
    r_295_306 - s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 + s_295_306 <=s (const 64 (2**20)),
    (const 64 0) - r_295_306 - s_295_306 <=s (const 64 (2**20)),
    u_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_295_306 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_295_306 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step306

// premise c
assume
neg_g_295_low60_0_low20_11 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_12 neg_g_295_low60_0_low20_11;
mov u_295_307 r_295_306;
mov v_295_307 s_295_306;

subs dc neg_g_295_low60_0_low20_12 neg_g_295_low60_0_low20_11 neg_f_295_low60_0_low20_11;
asr neg_g_295_low60_0_low20_12 neg_g_295_low60_0_low20_12 1;
subs dc r_295_307 r_295_306 u_295_306;
asr r_295_307 r_295_307 1;
subs dc s_295_307 s_295_306 v_295_306;
asr s_295_307 s_295_307 1;
assert
    true
&&
    neg_f_295_low60_0_low20_12 = neg_g_295_low60_0_low20_11,
    u_295_307 = r_295_306,
    v_295_307 = s_295_306,
    neg_g_295_low60_0_low20_12 * (const 64 2) = neg_g_295_low60_0_low20_11 - neg_f_295_low60_0_low20_11,
    r_295_307 * (const 64 2) = r_295_306 - u_295_306,
    s_295_307 * (const 64 2) = s_295_306 - v_295_306
;

assume
    neg_f_295_low60_0_low20_12 = neg_g_295_low60_0_low20_11,
    u_295_307 = r_295_306,
    v_295_307 = s_295_306,
    neg_g_295_low60_0_low20_12 * 2 = neg_g_295_low60_0_low20_11 - neg_f_295_low60_0_low20_11,
    r_295_307 * 2 = r_295_306 - u_295_306,
    s_295_307 * 2 = s_295_306 - v_295_306
&&
    true
;

{
    u_295_307 * neg_f_295_low60_0_low20_0 + v_295_307 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_307 * neg_f_295_low60_0_low20_0 + s_295_307 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_12 + u_295_307 * (const 64 (2**21)) + v_295_307 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_12 + r_295_307 * (const 64 (2**21)) + s_295_307 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_12,
    neg_f_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_12,
    neg_g_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 307)) <=s delta, delta <=s (const 64 (1 + 2*307)),
    (const 64 (-(2**20))) <=s u_295_307, u_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_307, v_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_307, r_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_307, s_295_307 <=s (const 64 ((2**20))),
    u_295_307 + v_295_307 <=s (const 64 (2**20)),
    u_295_307 - v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 + v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 - v_295_307 <=s (const 64 (2**20)),
    r_295_307 + s_295_307 <=s (const 64 (2**20)),
    r_295_307 - s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 + s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 - s_295_307 <=s (const 64 (2**20)),
    u_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_295_307 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_307_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_12,
sint64 neg_g_295_low60_0_low20_12,
sint64 neg_f_295_low60_0_low20_13,
sint64 neg_g_295_low60_0_low20_13,
sint64 u_295_307,
sint64 v_295_307,
sint64 r_295_307,
sint64 s_295_307,
sint64 u_295_308,
sint64 v_295_308,
sint64 r_295_308,
sint64 s_295_308,
bit ne
)={
    u_295_307 * neg_f_295_low60_0_low20_0 + v_295_307 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_12 * (-(2**20)),
    r_295_307 * neg_f_295_low60_0_low20_0 + s_295_307 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_12 * (-(2**20))
&&
    u_295_307 * neg_f_295_low60_0_low20_0 + v_295_307 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_12 * (const 64 (-(2**20))),
    r_295_307 * neg_f_295_low60_0_low20_0 + s_295_307 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_12 + u_295_307 * (const 64 (2**21)) + v_295_307 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_12 + r_295_307 * (const 64 (2**21)) + s_295_307 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_12,
    neg_f_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_12,
    neg_g_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 307)) <=s delta, delta <=s (const 64 (1 + 2*307)),
    (const 64 (-(2**20))) <=s u_295_307, u_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_307, v_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_307, r_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_307, s_295_307 <=s (const 64 ((2**20))),
    u_295_307 + v_295_307 <=s (const 64 (2**20)),
    u_295_307 - v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 + v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 - v_295_307 <=s (const 64 (2**20)),
    r_295_307 + s_295_307 <=s (const 64 (2**20)),
    r_295_307 - s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 + s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 - s_295_307 <=s (const 64 (2**20)),
    u_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_295_307 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step307

// premise a
assume
neg_g_295_low60_0_low20_12 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_13 neg_f_295_low60_0_low20_12;
mov u_295_308 u_295_307;
mov v_295_308 v_295_307;

asr neg_g_295_low60_0_low20_13 neg_g_295_low60_0_low20_12 1;
asr r_295_308 r_295_307 1;
asr s_295_308 s_295_307 1;
assert
    true
&&
    neg_f_295_low60_0_low20_13 = neg_f_295_low60_0_low20_12,
    u_295_308 = u_295_307,
    v_295_308 = v_295_307,
    neg_g_295_low60_0_low20_13 * (const 64 2) = neg_g_295_low60_0_low20_12,
    r_295_308 * (const 64 2) = r_295_307,
    s_295_308 * (const 64 2) = s_295_307
;

assume
    neg_f_295_low60_0_low20_13 = neg_f_295_low60_0_low20_12,
    u_295_308 = u_295_307,
    v_295_308 = v_295_307,
    neg_g_295_low60_0_low20_13 * 2 = neg_g_295_low60_0_low20_12,
    r_295_308 * 2 = r_295_307,
    s_295_308 * 2 = s_295_307
&&
    true
;

{
    u_295_308 * neg_f_295_low60_0_low20_0 + v_295_308 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_308 * neg_f_295_low60_0_low20_0 + s_295_308 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_13 + u_295_308 * (const 64 (2**21)) + v_295_308 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_13 + r_295_308 * (const 64 (2**21)) + s_295_308 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_13,
    neg_f_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_13,
    neg_g_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 308)) <=s delta, delta <=s (const 64 (1 + 2*308)),
    (const 64 (-(2**20))) <=s u_295_308, u_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_308, v_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_308, r_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_308, s_295_308 <=s (const 64 ((2**20))),
    u_295_308 + v_295_308 <=s (const 64 (2**20)),
    u_295_308 - v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 + v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 - v_295_308 <=s (const 64 (2**20)),
    r_295_308 + s_295_308 <=s (const 64 (2**20)),
    r_295_308 - s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 + s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 - s_295_308 <=s (const 64 (2**20)),
    u_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_295_308 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_307_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_12,
sint64 neg_g_295_low60_0_low20_12,
sint64 neg_f_295_low60_0_low20_13,
sint64 neg_g_295_low60_0_low20_13,
sint64 u_295_307,
sint64 v_295_307,
sint64 r_295_307,
sint64 s_295_307,
sint64 u_295_308,
sint64 v_295_308,
sint64 r_295_308,
sint64 s_295_308,
bit ne
)={
    u_295_307 * neg_f_295_low60_0_low20_0 + v_295_307 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_12 * (-(2**20)),
    r_295_307 * neg_f_295_low60_0_low20_0 + s_295_307 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_12 * (-(2**20))
&&
    u_295_307 * neg_f_295_low60_0_low20_0 + v_295_307 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_12 * (const 64 (-(2**20))),
    r_295_307 * neg_f_295_low60_0_low20_0 + s_295_307 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_12 + u_295_307 * (const 64 (2**21)) + v_295_307 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_12 + r_295_307 * (const 64 (2**21)) + s_295_307 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_12,
    neg_f_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_12,
    neg_g_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 307)) <=s delta, delta <=s (const 64 (1 + 2*307)),
    (const 64 (-(2**20))) <=s u_295_307, u_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_307, v_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_307, r_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_307, s_295_307 <=s (const 64 ((2**20))),
    u_295_307 + v_295_307 <=s (const 64 (2**20)),
    u_295_307 - v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 + v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 - v_295_307 <=s (const 64 (2**20)),
    r_295_307 + s_295_307 <=s (const 64 (2**20)),
    r_295_307 - s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 + s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 - s_295_307 <=s (const 64 (2**20)),
    u_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_295_307 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step307

// premise b
assume
neg_g_295_low60_0_low20_12 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_13 neg_f_295_low60_0_low20_12;
mov u_295_308 u_295_307;
mov v_295_308 v_295_307;

add neg_g_295_low60_0_low20_13 neg_g_295_low60_0_low20_12 neg_f_295_low60_0_low20_12;
asr neg_g_295_low60_0_low20_13 neg_g_295_low60_0_low20_13 1;
add r_295_308 r_295_307 u_295_307;
asr r_295_308 r_295_308 1;
add s_295_308 s_295_307 v_295_307;
asr s_295_308 s_295_308 1;
assert
    true
&&
    neg_f_295_low60_0_low20_13 = neg_f_295_low60_0_low20_12,
    u_295_308 = u_295_307,
    v_295_308 = v_295_307,
    neg_g_295_low60_0_low20_13 * (const 64 2) = neg_g_295_low60_0_low20_12 + neg_f_295_low60_0_low20_12,
    r_295_308 * (const 64 2) = r_295_307 + u_295_307,
    s_295_308 * (const 64 2) = s_295_307 + v_295_307
;

assume
    neg_f_295_low60_0_low20_13 = neg_f_295_low60_0_low20_12,
    u_295_308 = u_295_307,
    v_295_308 = v_295_307,
    neg_g_295_low60_0_low20_13 * 2 = neg_g_295_low60_0_low20_12 + neg_f_295_low60_0_low20_12,
    r_295_308 * 2 = r_295_307 + u_295_307,
    s_295_308 * 2 = s_295_307 + v_295_307
&&
    true
;

{
    u_295_308 * neg_f_295_low60_0_low20_0 + v_295_308 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_308 * neg_f_295_low60_0_low20_0 + s_295_308 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_13 + u_295_308 * (const 64 (2**21)) + v_295_308 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_13 + r_295_308 * (const 64 (2**21)) + s_295_308 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_13,
    neg_f_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_13,
    neg_g_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 308)) <=s delta, delta <=s (const 64 (1 + 2*308)),
    (const 64 (-(2**20))) <=s u_295_308, u_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_308, v_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_308, r_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_308, s_295_308 <=s (const 64 ((2**20))),
    u_295_308 + v_295_308 <=s (const 64 (2**20)),
    u_295_308 - v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 + v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 - v_295_308 <=s (const 64 (2**20)),
    r_295_308 + s_295_308 <=s (const 64 (2**20)),
    r_295_308 - s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 + s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 - s_295_308 <=s (const 64 (2**20)),
    u_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_295_308 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_307_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_12,
sint64 neg_g_295_low60_0_low20_12,
sint64 neg_f_295_low60_0_low20_13,
sint64 neg_g_295_low60_0_low20_13,
sint64 u_295_307,
sint64 v_295_307,
sint64 r_295_307,
sint64 s_295_307,
sint64 u_295_308,
sint64 v_295_308,
sint64 r_295_308,
sint64 s_295_308,
bit ne
)={
    u_295_307 * neg_f_295_low60_0_low20_0 + v_295_307 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_12 * (-(2**20)),
    r_295_307 * neg_f_295_low60_0_low20_0 + s_295_307 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_12 * (-(2**20))
&&
    u_295_307 * neg_f_295_low60_0_low20_0 + v_295_307 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_12 * (const 64 (-(2**20))),
    r_295_307 * neg_f_295_low60_0_low20_0 + s_295_307 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_12 + u_295_307 * (const 64 (2**21)) + v_295_307 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_12 + r_295_307 * (const 64 (2**21)) + s_295_307 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_12,
    neg_f_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_12,
    neg_g_295_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 307)) <=s delta, delta <=s (const 64 (1 + 2*307)),
    (const 64 (-(2**20))) <=s u_295_307, u_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_307, v_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_307, r_295_307 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_307, s_295_307 <=s (const 64 ((2**20))),
    u_295_307 + v_295_307 <=s (const 64 (2**20)),
    u_295_307 - v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 + v_295_307 <=s (const 64 (2**20)),
    (const 64 0) - u_295_307 - v_295_307 <=s (const 64 (2**20)),
    r_295_307 + s_295_307 <=s (const 64 (2**20)),
    r_295_307 - s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 + s_295_307 <=s (const 64 (2**20)),
    (const 64 0) - r_295_307 - s_295_307 <=s (const 64 (2**20)),
    u_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_295_307 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_295_307 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step307

// premise c
assume
neg_g_295_low60_0_low20_12 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_13 neg_g_295_low60_0_low20_12;
mov u_295_308 r_295_307;
mov v_295_308 s_295_307;

subs dc neg_g_295_low60_0_low20_13 neg_g_295_low60_0_low20_12 neg_f_295_low60_0_low20_12;
asr neg_g_295_low60_0_low20_13 neg_g_295_low60_0_low20_13 1;
subs dc r_295_308 r_295_307 u_295_307;
asr r_295_308 r_295_308 1;
subs dc s_295_308 s_295_307 v_295_307;
asr s_295_308 s_295_308 1;
assert
    true
&&
    neg_f_295_low60_0_low20_13 = neg_g_295_low60_0_low20_12,
    u_295_308 = r_295_307,
    v_295_308 = s_295_307,
    neg_g_295_low60_0_low20_13 * (const 64 2) = neg_g_295_low60_0_low20_12 - neg_f_295_low60_0_low20_12,
    r_295_308 * (const 64 2) = r_295_307 - u_295_307,
    s_295_308 * (const 64 2) = s_295_307 - v_295_307
;

assume
    neg_f_295_low60_0_low20_13 = neg_g_295_low60_0_low20_12,
    u_295_308 = r_295_307,
    v_295_308 = s_295_307,
    neg_g_295_low60_0_low20_13 * 2 = neg_g_295_low60_0_low20_12 - neg_f_295_low60_0_low20_12,
    r_295_308 * 2 = r_295_307 - u_295_307,
    s_295_308 * 2 = s_295_307 - v_295_307
&&
    true
;

{
    u_295_308 * neg_f_295_low60_0_low20_0 + v_295_308 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_308 * neg_f_295_low60_0_low20_0 + s_295_308 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_13 + u_295_308 * (const 64 (2**21)) + v_295_308 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_13 + r_295_308 * (const 64 (2**21)) + s_295_308 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_13,
    neg_f_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_13,
    neg_g_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 308)) <=s delta, delta <=s (const 64 (1 + 2*308)),
    (const 64 (-(2**20))) <=s u_295_308, u_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_308, v_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_308, r_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_308, s_295_308 <=s (const 64 ((2**20))),
    u_295_308 + v_295_308 <=s (const 64 (2**20)),
    u_295_308 - v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 + v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 - v_295_308 <=s (const 64 (2**20)),
    r_295_308 + s_295_308 <=s (const 64 (2**20)),
    r_295_308 - s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 + s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 - s_295_308 <=s (const 64 (2**20)),
    u_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_295_308 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_308_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_13,
sint64 neg_g_295_low60_0_low20_13,
sint64 neg_f_295_low60_0_low20_14,
sint64 neg_g_295_low60_0_low20_14,
sint64 u_295_308,
sint64 v_295_308,
sint64 r_295_308,
sint64 s_295_308,
sint64 u_295_309,
sint64 v_295_309,
sint64 r_295_309,
sint64 s_295_309,
bit ne
)={
    u_295_308 * neg_f_295_low60_0_low20_0 + v_295_308 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_13 * (-(2**20)),
    r_295_308 * neg_f_295_low60_0_low20_0 + s_295_308 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_13 * (-(2**20))
&&
    u_295_308 * neg_f_295_low60_0_low20_0 + v_295_308 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_13 * (const 64 (-(2**20))),
    r_295_308 * neg_f_295_low60_0_low20_0 + s_295_308 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_13 + u_295_308 * (const 64 (2**21)) + v_295_308 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_13 + r_295_308 * (const 64 (2**21)) + s_295_308 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_13,
    neg_f_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_13,
    neg_g_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 308)) <=s delta, delta <=s (const 64 (1 + 2*308)),
    (const 64 (-(2**20))) <=s u_295_308, u_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_308, v_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_308, r_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_308, s_295_308 <=s (const 64 ((2**20))),
    u_295_308 + v_295_308 <=s (const 64 (2**20)),
    u_295_308 - v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 + v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 - v_295_308 <=s (const 64 (2**20)),
    r_295_308 + s_295_308 <=s (const 64 (2**20)),
    r_295_308 - s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 + s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 - s_295_308 <=s (const 64 (2**20)),
    u_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_295_308 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step308

// premise a
assume
neg_g_295_low60_0_low20_13 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_14 neg_f_295_low60_0_low20_13;
mov u_295_309 u_295_308;
mov v_295_309 v_295_308;

asr neg_g_295_low60_0_low20_14 neg_g_295_low60_0_low20_13 1;
asr r_295_309 r_295_308 1;
asr s_295_309 s_295_308 1;
assert
    true
&&
    neg_f_295_low60_0_low20_14 = neg_f_295_low60_0_low20_13,
    u_295_309 = u_295_308,
    v_295_309 = v_295_308,
    neg_g_295_low60_0_low20_14 * (const 64 2) = neg_g_295_low60_0_low20_13,
    r_295_309 * (const 64 2) = r_295_308,
    s_295_309 * (const 64 2) = s_295_308
;

assume
    neg_f_295_low60_0_low20_14 = neg_f_295_low60_0_low20_13,
    u_295_309 = u_295_308,
    v_295_309 = v_295_308,
    neg_g_295_low60_0_low20_14 * 2 = neg_g_295_low60_0_low20_13,
    r_295_309 * 2 = r_295_308,
    s_295_309 * 2 = s_295_308
&&
    true
;

{
    u_295_309 * neg_f_295_low60_0_low20_0 + v_295_309 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_309 * neg_f_295_low60_0_low20_0 + s_295_309 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_14 + u_295_309 * (const 64 (2**21)) + v_295_309 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_14 + r_295_309 * (const 64 (2**21)) + s_295_309 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_14,
    neg_f_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_14,
    neg_g_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 309)) <=s delta, delta <=s (const 64 (1 + 2*309)),
    (const 64 (-(2**20))) <=s u_295_309, u_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_309, v_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_309, r_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_309, s_295_309 <=s (const 64 ((2**20))),
    u_295_309 + v_295_309 <=s (const 64 (2**20)),
    u_295_309 - v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 + v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 - v_295_309 <=s (const 64 (2**20)),
    r_295_309 + s_295_309 <=s (const 64 (2**20)),
    r_295_309 - s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 + s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 - s_295_309 <=s (const 64 (2**20)),
    u_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_295_309 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_308_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_13,
sint64 neg_g_295_low60_0_low20_13,
sint64 neg_f_295_low60_0_low20_14,
sint64 neg_g_295_low60_0_low20_14,
sint64 u_295_308,
sint64 v_295_308,
sint64 r_295_308,
sint64 s_295_308,
sint64 u_295_309,
sint64 v_295_309,
sint64 r_295_309,
sint64 s_295_309,
bit ne
)={
    u_295_308 * neg_f_295_low60_0_low20_0 + v_295_308 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_13 * (-(2**20)),
    r_295_308 * neg_f_295_low60_0_low20_0 + s_295_308 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_13 * (-(2**20))
&&
    u_295_308 * neg_f_295_low60_0_low20_0 + v_295_308 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_13 * (const 64 (-(2**20))),
    r_295_308 * neg_f_295_low60_0_low20_0 + s_295_308 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_13 + u_295_308 * (const 64 (2**21)) + v_295_308 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_13 + r_295_308 * (const 64 (2**21)) + s_295_308 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_13,
    neg_f_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_13,
    neg_g_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 308)) <=s delta, delta <=s (const 64 (1 + 2*308)),
    (const 64 (-(2**20))) <=s u_295_308, u_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_308, v_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_308, r_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_308, s_295_308 <=s (const 64 ((2**20))),
    u_295_308 + v_295_308 <=s (const 64 (2**20)),
    u_295_308 - v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 + v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 - v_295_308 <=s (const 64 (2**20)),
    r_295_308 + s_295_308 <=s (const 64 (2**20)),
    r_295_308 - s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 + s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 - s_295_308 <=s (const 64 (2**20)),
    u_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_295_308 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step308

// premise b
assume
neg_g_295_low60_0_low20_13 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_14 neg_f_295_low60_0_low20_13;
mov u_295_309 u_295_308;
mov v_295_309 v_295_308;

add neg_g_295_low60_0_low20_14 neg_g_295_low60_0_low20_13 neg_f_295_low60_0_low20_13;
asr neg_g_295_low60_0_low20_14 neg_g_295_low60_0_low20_14 1;
add r_295_309 r_295_308 u_295_308;
asr r_295_309 r_295_309 1;
add s_295_309 s_295_308 v_295_308;
asr s_295_309 s_295_309 1;
assert
    true
&&
    neg_f_295_low60_0_low20_14 = neg_f_295_low60_0_low20_13,
    u_295_309 = u_295_308,
    v_295_309 = v_295_308,
    neg_g_295_low60_0_low20_14 * (const 64 2) = neg_g_295_low60_0_low20_13 + neg_f_295_low60_0_low20_13,
    r_295_309 * (const 64 2) = r_295_308 + u_295_308,
    s_295_309 * (const 64 2) = s_295_308 + v_295_308
;

assume
    neg_f_295_low60_0_low20_14 = neg_f_295_low60_0_low20_13,
    u_295_309 = u_295_308,
    v_295_309 = v_295_308,
    neg_g_295_low60_0_low20_14 * 2 = neg_g_295_low60_0_low20_13 + neg_f_295_low60_0_low20_13,
    r_295_309 * 2 = r_295_308 + u_295_308,
    s_295_309 * 2 = s_295_308 + v_295_308
&&
    true
;

{
    u_295_309 * neg_f_295_low60_0_low20_0 + v_295_309 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_309 * neg_f_295_low60_0_low20_0 + s_295_309 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_14 + u_295_309 * (const 64 (2**21)) + v_295_309 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_14 + r_295_309 * (const 64 (2**21)) + s_295_309 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_14,
    neg_f_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_14,
    neg_g_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 309)) <=s delta, delta <=s (const 64 (1 + 2*309)),
    (const 64 (-(2**20))) <=s u_295_309, u_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_309, v_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_309, r_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_309, s_295_309 <=s (const 64 ((2**20))),
    u_295_309 + v_295_309 <=s (const 64 (2**20)),
    u_295_309 - v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 + v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 - v_295_309 <=s (const 64 (2**20)),
    r_295_309 + s_295_309 <=s (const 64 (2**20)),
    r_295_309 - s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 + s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 - s_295_309 <=s (const 64 (2**20)),
    u_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_295_309 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_308_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_13,
sint64 neg_g_295_low60_0_low20_13,
sint64 neg_f_295_low60_0_low20_14,
sint64 neg_g_295_low60_0_low20_14,
sint64 u_295_308,
sint64 v_295_308,
sint64 r_295_308,
sint64 s_295_308,
sint64 u_295_309,
sint64 v_295_309,
sint64 r_295_309,
sint64 s_295_309,
bit ne
)={
    u_295_308 * neg_f_295_low60_0_low20_0 + v_295_308 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_13 * (-(2**20)),
    r_295_308 * neg_f_295_low60_0_low20_0 + s_295_308 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_13 * (-(2**20))
&&
    u_295_308 * neg_f_295_low60_0_low20_0 + v_295_308 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_13 * (const 64 (-(2**20))),
    r_295_308 * neg_f_295_low60_0_low20_0 + s_295_308 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_13 + u_295_308 * (const 64 (2**21)) + v_295_308 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_13 + r_295_308 * (const 64 (2**21)) + s_295_308 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_13,
    neg_f_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_13,
    neg_g_295_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 308)) <=s delta, delta <=s (const 64 (1 + 2*308)),
    (const 64 (-(2**20))) <=s u_295_308, u_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_308, v_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_308, r_295_308 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_308, s_295_308 <=s (const 64 ((2**20))),
    u_295_308 + v_295_308 <=s (const 64 (2**20)),
    u_295_308 - v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 + v_295_308 <=s (const 64 (2**20)),
    (const 64 0) - u_295_308 - v_295_308 <=s (const 64 (2**20)),
    r_295_308 + s_295_308 <=s (const 64 (2**20)),
    r_295_308 - s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 + s_295_308 <=s (const 64 (2**20)),
    (const 64 0) - r_295_308 - s_295_308 <=s (const 64 (2**20)),
    u_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_295_308 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_295_308 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step308

// premise c
assume
neg_g_295_low60_0_low20_13 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_14 neg_g_295_low60_0_low20_13;
mov u_295_309 r_295_308;
mov v_295_309 s_295_308;

subs dc neg_g_295_low60_0_low20_14 neg_g_295_low60_0_low20_13 neg_f_295_low60_0_low20_13;
asr neg_g_295_low60_0_low20_14 neg_g_295_low60_0_low20_14 1;
subs dc r_295_309 r_295_308 u_295_308;
asr r_295_309 r_295_309 1;
subs dc s_295_309 s_295_308 v_295_308;
asr s_295_309 s_295_309 1;
assert
    true
&&
    neg_f_295_low60_0_low20_14 = neg_g_295_low60_0_low20_13,
    u_295_309 = r_295_308,
    v_295_309 = s_295_308,
    neg_g_295_low60_0_low20_14 * (const 64 2) = neg_g_295_low60_0_low20_13 - neg_f_295_low60_0_low20_13,
    r_295_309 * (const 64 2) = r_295_308 - u_295_308,
    s_295_309 * (const 64 2) = s_295_308 - v_295_308
;

assume
    neg_f_295_low60_0_low20_14 = neg_g_295_low60_0_low20_13,
    u_295_309 = r_295_308,
    v_295_309 = s_295_308,
    neg_g_295_low60_0_low20_14 * 2 = neg_g_295_low60_0_low20_13 - neg_f_295_low60_0_low20_13,
    r_295_309 * 2 = r_295_308 - u_295_308,
    s_295_309 * 2 = s_295_308 - v_295_308
&&
    true
;

{
    u_295_309 * neg_f_295_low60_0_low20_0 + v_295_309 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_309 * neg_f_295_low60_0_low20_0 + s_295_309 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_14 + u_295_309 * (const 64 (2**21)) + v_295_309 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_14 + r_295_309 * (const 64 (2**21)) + s_295_309 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_14,
    neg_f_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_14,
    neg_g_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 309)) <=s delta, delta <=s (const 64 (1 + 2*309)),
    (const 64 (-(2**20))) <=s u_295_309, u_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_309, v_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_309, r_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_309, s_295_309 <=s (const 64 ((2**20))),
    u_295_309 + v_295_309 <=s (const 64 (2**20)),
    u_295_309 - v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 + v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 - v_295_309 <=s (const 64 (2**20)),
    r_295_309 + s_295_309 <=s (const 64 (2**20)),
    r_295_309 - s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 + s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 - s_295_309 <=s (const 64 (2**20)),
    u_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_295_309 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_309_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_14,
sint64 neg_g_295_low60_0_low20_14,
sint64 neg_f_295_low60_0_low20_15,
sint64 neg_g_295_low60_0_low20_15,
sint64 u_295_309,
sint64 v_295_309,
sint64 r_295_309,
sint64 s_295_309,
sint64 u_295_310,
sint64 v_295_310,
sint64 r_295_310,
sint64 s_295_310,
bit ne
)={
    u_295_309 * neg_f_295_low60_0_low20_0 + v_295_309 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_14 * (-(2**20)),
    r_295_309 * neg_f_295_low60_0_low20_0 + s_295_309 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_14 * (-(2**20))
&&
    u_295_309 * neg_f_295_low60_0_low20_0 + v_295_309 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_14 * (const 64 (-(2**20))),
    r_295_309 * neg_f_295_low60_0_low20_0 + s_295_309 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_14 + u_295_309 * (const 64 (2**21)) + v_295_309 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_14 + r_295_309 * (const 64 (2**21)) + s_295_309 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_14,
    neg_f_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_14,
    neg_g_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 309)) <=s delta, delta <=s (const 64 (1 + 2*309)),
    (const 64 (-(2**20))) <=s u_295_309, u_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_309, v_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_309, r_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_309, s_295_309 <=s (const 64 ((2**20))),
    u_295_309 + v_295_309 <=s (const 64 (2**20)),
    u_295_309 - v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 + v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 - v_295_309 <=s (const 64 (2**20)),
    r_295_309 + s_295_309 <=s (const 64 (2**20)),
    r_295_309 - s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 + s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 - s_295_309 <=s (const 64 (2**20)),
    u_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_295_309 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step309

// premise a
assume
neg_g_295_low60_0_low20_14 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_15 neg_f_295_low60_0_low20_14;
mov u_295_310 u_295_309;
mov v_295_310 v_295_309;

asr neg_g_295_low60_0_low20_15 neg_g_295_low60_0_low20_14 1;
asr r_295_310 r_295_309 1;
asr s_295_310 s_295_309 1;
assert
    true
&&
    neg_f_295_low60_0_low20_15 = neg_f_295_low60_0_low20_14,
    u_295_310 = u_295_309,
    v_295_310 = v_295_309,
    neg_g_295_low60_0_low20_15 * (const 64 2) = neg_g_295_low60_0_low20_14,
    r_295_310 * (const 64 2) = r_295_309,
    s_295_310 * (const 64 2) = s_295_309
;

assume
    neg_f_295_low60_0_low20_15 = neg_f_295_low60_0_low20_14,
    u_295_310 = u_295_309,
    v_295_310 = v_295_309,
    neg_g_295_low60_0_low20_15 * 2 = neg_g_295_low60_0_low20_14,
    r_295_310 * 2 = r_295_309,
    s_295_310 * 2 = s_295_309
&&
    true
;

{
    u_295_310 * neg_f_295_low60_0_low20_0 + v_295_310 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_310 * neg_f_295_low60_0_low20_0 + s_295_310 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_15 + u_295_310 * (const 64 (2**21)) + v_295_310 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_15 + r_295_310 * (const 64 (2**21)) + s_295_310 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_15,
    neg_f_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_15,
    neg_g_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 310)) <=s delta, delta <=s (const 64 (1 + 2*310)),
    (const 64 (-(2**20))) <=s u_295_310, u_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_310, v_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_310, r_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_310, s_295_310 <=s (const 64 ((2**20))),
    u_295_310 + v_295_310 <=s (const 64 (2**20)),
    u_295_310 - v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 + v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 - v_295_310 <=s (const 64 (2**20)),
    r_295_310 + s_295_310 <=s (const 64 (2**20)),
    r_295_310 - s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 + s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 - s_295_310 <=s (const 64 (2**20)),
    u_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_295_310 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_309_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_14,
sint64 neg_g_295_low60_0_low20_14,
sint64 neg_f_295_low60_0_low20_15,
sint64 neg_g_295_low60_0_low20_15,
sint64 u_295_309,
sint64 v_295_309,
sint64 r_295_309,
sint64 s_295_309,
sint64 u_295_310,
sint64 v_295_310,
sint64 r_295_310,
sint64 s_295_310,
bit ne
)={
    u_295_309 * neg_f_295_low60_0_low20_0 + v_295_309 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_14 * (-(2**20)),
    r_295_309 * neg_f_295_low60_0_low20_0 + s_295_309 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_14 * (-(2**20))
&&
    u_295_309 * neg_f_295_low60_0_low20_0 + v_295_309 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_14 * (const 64 (-(2**20))),
    r_295_309 * neg_f_295_low60_0_low20_0 + s_295_309 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_14 + u_295_309 * (const 64 (2**21)) + v_295_309 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_14 + r_295_309 * (const 64 (2**21)) + s_295_309 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_14,
    neg_f_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_14,
    neg_g_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 309)) <=s delta, delta <=s (const 64 (1 + 2*309)),
    (const 64 (-(2**20))) <=s u_295_309, u_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_309, v_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_309, r_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_309, s_295_309 <=s (const 64 ((2**20))),
    u_295_309 + v_295_309 <=s (const 64 (2**20)),
    u_295_309 - v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 + v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 - v_295_309 <=s (const 64 (2**20)),
    r_295_309 + s_295_309 <=s (const 64 (2**20)),
    r_295_309 - s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 + s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 - s_295_309 <=s (const 64 (2**20)),
    u_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_295_309 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step309

// premise b
assume
neg_g_295_low60_0_low20_14 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_15 neg_f_295_low60_0_low20_14;
mov u_295_310 u_295_309;
mov v_295_310 v_295_309;

add neg_g_295_low60_0_low20_15 neg_g_295_low60_0_low20_14 neg_f_295_low60_0_low20_14;
asr neg_g_295_low60_0_low20_15 neg_g_295_low60_0_low20_15 1;
add r_295_310 r_295_309 u_295_309;
asr r_295_310 r_295_310 1;
add s_295_310 s_295_309 v_295_309;
asr s_295_310 s_295_310 1;
assert
    true
&&
    neg_f_295_low60_0_low20_15 = neg_f_295_low60_0_low20_14,
    u_295_310 = u_295_309,
    v_295_310 = v_295_309,
    neg_g_295_low60_0_low20_15 * (const 64 2) = neg_g_295_low60_0_low20_14 + neg_f_295_low60_0_low20_14,
    r_295_310 * (const 64 2) = r_295_309 + u_295_309,
    s_295_310 * (const 64 2) = s_295_309 + v_295_309
;

assume
    neg_f_295_low60_0_low20_15 = neg_f_295_low60_0_low20_14,
    u_295_310 = u_295_309,
    v_295_310 = v_295_309,
    neg_g_295_low60_0_low20_15 * 2 = neg_g_295_low60_0_low20_14 + neg_f_295_low60_0_low20_14,
    r_295_310 * 2 = r_295_309 + u_295_309,
    s_295_310 * 2 = s_295_309 + v_295_309
&&
    true
;

{
    u_295_310 * neg_f_295_low60_0_low20_0 + v_295_310 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_310 * neg_f_295_low60_0_low20_0 + s_295_310 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_15 + u_295_310 * (const 64 (2**21)) + v_295_310 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_15 + r_295_310 * (const 64 (2**21)) + s_295_310 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_15,
    neg_f_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_15,
    neg_g_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 310)) <=s delta, delta <=s (const 64 (1 + 2*310)),
    (const 64 (-(2**20))) <=s u_295_310, u_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_310, v_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_310, r_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_310, s_295_310 <=s (const 64 ((2**20))),
    u_295_310 + v_295_310 <=s (const 64 (2**20)),
    u_295_310 - v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 + v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 - v_295_310 <=s (const 64 (2**20)),
    r_295_310 + s_295_310 <=s (const 64 (2**20)),
    r_295_310 - s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 + s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 - s_295_310 <=s (const 64 (2**20)),
    u_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_295_310 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_309_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_14,
sint64 neg_g_295_low60_0_low20_14,
sint64 neg_f_295_low60_0_low20_15,
sint64 neg_g_295_low60_0_low20_15,
sint64 u_295_309,
sint64 v_295_309,
sint64 r_295_309,
sint64 s_295_309,
sint64 u_295_310,
sint64 v_295_310,
sint64 r_295_310,
sint64 s_295_310,
bit ne
)={
    u_295_309 * neg_f_295_low60_0_low20_0 + v_295_309 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_14 * (-(2**20)),
    r_295_309 * neg_f_295_low60_0_low20_0 + s_295_309 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_14 * (-(2**20))
&&
    u_295_309 * neg_f_295_low60_0_low20_0 + v_295_309 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_14 * (const 64 (-(2**20))),
    r_295_309 * neg_f_295_low60_0_low20_0 + s_295_309 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_14 + u_295_309 * (const 64 (2**21)) + v_295_309 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_14 + r_295_309 * (const 64 (2**21)) + s_295_309 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_14,
    neg_f_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_14,
    neg_g_295_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 309)) <=s delta, delta <=s (const 64 (1 + 2*309)),
    (const 64 (-(2**20))) <=s u_295_309, u_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_309, v_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_309, r_295_309 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_309, s_295_309 <=s (const 64 ((2**20))),
    u_295_309 + v_295_309 <=s (const 64 (2**20)),
    u_295_309 - v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 + v_295_309 <=s (const 64 (2**20)),
    (const 64 0) - u_295_309 - v_295_309 <=s (const 64 (2**20)),
    r_295_309 + s_295_309 <=s (const 64 (2**20)),
    r_295_309 - s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 + s_295_309 <=s (const 64 (2**20)),
    (const 64 0) - r_295_309 - s_295_309 <=s (const 64 (2**20)),
    u_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_295_309 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_295_309 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step309

// premise c
assume
neg_g_295_low60_0_low20_14 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_15 neg_g_295_low60_0_low20_14;
mov u_295_310 r_295_309;
mov v_295_310 s_295_309;

subs dc neg_g_295_low60_0_low20_15 neg_g_295_low60_0_low20_14 neg_f_295_low60_0_low20_14;
asr neg_g_295_low60_0_low20_15 neg_g_295_low60_0_low20_15 1;
subs dc r_295_310 r_295_309 u_295_309;
asr r_295_310 r_295_310 1;
subs dc s_295_310 s_295_309 v_295_309;
asr s_295_310 s_295_310 1;
assert
    true
&&
    neg_f_295_low60_0_low20_15 = neg_g_295_low60_0_low20_14,
    u_295_310 = r_295_309,
    v_295_310 = s_295_309,
    neg_g_295_low60_0_low20_15 * (const 64 2) = neg_g_295_low60_0_low20_14 - neg_f_295_low60_0_low20_14,
    r_295_310 * (const 64 2) = r_295_309 - u_295_309,
    s_295_310 * (const 64 2) = s_295_309 - v_295_309
;

assume
    neg_f_295_low60_0_low20_15 = neg_g_295_low60_0_low20_14,
    u_295_310 = r_295_309,
    v_295_310 = s_295_309,
    neg_g_295_low60_0_low20_15 * 2 = neg_g_295_low60_0_low20_14 - neg_f_295_low60_0_low20_14,
    r_295_310 * 2 = r_295_309 - u_295_309,
    s_295_310 * 2 = s_295_309 - v_295_309
&&
    true
;

{
    u_295_310 * neg_f_295_low60_0_low20_0 + v_295_310 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_310 * neg_f_295_low60_0_low20_0 + s_295_310 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_15 + u_295_310 * (const 64 (2**21)) + v_295_310 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_15 + r_295_310 * (const 64 (2**21)) + s_295_310 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_15,
    neg_f_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_15,
    neg_g_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 310)) <=s delta, delta <=s (const 64 (1 + 2*310)),
    (const 64 (-(2**20))) <=s u_295_310, u_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_310, v_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_310, r_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_310, s_295_310 <=s (const 64 ((2**20))),
    u_295_310 + v_295_310 <=s (const 64 (2**20)),
    u_295_310 - v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 + v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 - v_295_310 <=s (const 64 (2**20)),
    r_295_310 + s_295_310 <=s (const 64 (2**20)),
    r_295_310 - s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 + s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 - s_295_310 <=s (const 64 (2**20)),
    u_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_295_310 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_310_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_15,
sint64 neg_g_295_low60_0_low20_15,
sint64 neg_f_295_low60_0_low20_16,
sint64 neg_g_295_low60_0_low20_16,
sint64 u_295_310,
sint64 v_295_310,
sint64 r_295_310,
sint64 s_295_310,
sint64 u_295_311,
sint64 v_295_311,
sint64 r_295_311,
sint64 s_295_311,
bit ne
)={
    u_295_310 * neg_f_295_low60_0_low20_0 + v_295_310 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_15 * (-(2**20)),
    r_295_310 * neg_f_295_low60_0_low20_0 + s_295_310 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_15 * (-(2**20))
&&
    u_295_310 * neg_f_295_low60_0_low20_0 + v_295_310 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_15 * (const 64 (-(2**20))),
    r_295_310 * neg_f_295_low60_0_low20_0 + s_295_310 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_15 + u_295_310 * (const 64 (2**21)) + v_295_310 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_15 + r_295_310 * (const 64 (2**21)) + s_295_310 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_15,
    neg_f_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_15,
    neg_g_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 310)) <=s delta, delta <=s (const 64 (1 + 2*310)),
    (const 64 (-(2**20))) <=s u_295_310, u_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_310, v_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_310, r_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_310, s_295_310 <=s (const 64 ((2**20))),
    u_295_310 + v_295_310 <=s (const 64 (2**20)),
    u_295_310 - v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 + v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 - v_295_310 <=s (const 64 (2**20)),
    r_295_310 + s_295_310 <=s (const 64 (2**20)),
    r_295_310 - s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 + s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 - s_295_310 <=s (const 64 (2**20)),
    u_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_295_310 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step310

// premise a
assume
neg_g_295_low60_0_low20_15 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_16 neg_f_295_low60_0_low20_15;
mov u_295_311 u_295_310;
mov v_295_311 v_295_310;

asr neg_g_295_low60_0_low20_16 neg_g_295_low60_0_low20_15 1;
asr r_295_311 r_295_310 1;
asr s_295_311 s_295_310 1;
assert
    true
&&
    neg_f_295_low60_0_low20_16 = neg_f_295_low60_0_low20_15,
    u_295_311 = u_295_310,
    v_295_311 = v_295_310,
    neg_g_295_low60_0_low20_16 * (const 64 2) = neg_g_295_low60_0_low20_15,
    r_295_311 * (const 64 2) = r_295_310,
    s_295_311 * (const 64 2) = s_295_310
;

assume
    neg_f_295_low60_0_low20_16 = neg_f_295_low60_0_low20_15,
    u_295_311 = u_295_310,
    v_295_311 = v_295_310,
    neg_g_295_low60_0_low20_16 * 2 = neg_g_295_low60_0_low20_15,
    r_295_311 * 2 = r_295_310,
    s_295_311 * 2 = s_295_310
&&
    true
;

{
    u_295_311 * neg_f_295_low60_0_low20_0 + v_295_311 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_311 * neg_f_295_low60_0_low20_0 + s_295_311 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_16 + u_295_311 * (const 64 (2**21)) + v_295_311 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_16 + r_295_311 * (const 64 (2**21)) + s_295_311 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_16,
    neg_f_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_16,
    neg_g_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 311)) <=s delta, delta <=s (const 64 (1 + 2*311)),
    (const 64 (-(2**20))) <=s u_295_311, u_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_311, v_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_311, r_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_311, s_295_311 <=s (const 64 ((2**20))),
    u_295_311 + v_295_311 <=s (const 64 (2**20)),
    u_295_311 - v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 + v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 - v_295_311 <=s (const 64 (2**20)),
    r_295_311 + s_295_311 <=s (const 64 (2**20)),
    r_295_311 - s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 + s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 - s_295_311 <=s (const 64 (2**20)),
    u_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_295_311 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_310_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_15,
sint64 neg_g_295_low60_0_low20_15,
sint64 neg_f_295_low60_0_low20_16,
sint64 neg_g_295_low60_0_low20_16,
sint64 u_295_310,
sint64 v_295_310,
sint64 r_295_310,
sint64 s_295_310,
sint64 u_295_311,
sint64 v_295_311,
sint64 r_295_311,
sint64 s_295_311,
bit ne
)={
    u_295_310 * neg_f_295_low60_0_low20_0 + v_295_310 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_15 * (-(2**20)),
    r_295_310 * neg_f_295_low60_0_low20_0 + s_295_310 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_15 * (-(2**20))
&&
    u_295_310 * neg_f_295_low60_0_low20_0 + v_295_310 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_15 * (const 64 (-(2**20))),
    r_295_310 * neg_f_295_low60_0_low20_0 + s_295_310 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_15 + u_295_310 * (const 64 (2**21)) + v_295_310 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_15 + r_295_310 * (const 64 (2**21)) + s_295_310 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_15,
    neg_f_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_15,
    neg_g_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 310)) <=s delta, delta <=s (const 64 (1 + 2*310)),
    (const 64 (-(2**20))) <=s u_295_310, u_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_310, v_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_310, r_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_310, s_295_310 <=s (const 64 ((2**20))),
    u_295_310 + v_295_310 <=s (const 64 (2**20)),
    u_295_310 - v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 + v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 - v_295_310 <=s (const 64 (2**20)),
    r_295_310 + s_295_310 <=s (const 64 (2**20)),
    r_295_310 - s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 + s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 - s_295_310 <=s (const 64 (2**20)),
    u_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_295_310 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step310

// premise b
assume
neg_g_295_low60_0_low20_15 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_16 neg_f_295_low60_0_low20_15;
mov u_295_311 u_295_310;
mov v_295_311 v_295_310;

add neg_g_295_low60_0_low20_16 neg_g_295_low60_0_low20_15 neg_f_295_low60_0_low20_15;
asr neg_g_295_low60_0_low20_16 neg_g_295_low60_0_low20_16 1;
add r_295_311 r_295_310 u_295_310;
asr r_295_311 r_295_311 1;
add s_295_311 s_295_310 v_295_310;
asr s_295_311 s_295_311 1;
assert
    true
&&
    neg_f_295_low60_0_low20_16 = neg_f_295_low60_0_low20_15,
    u_295_311 = u_295_310,
    v_295_311 = v_295_310,
    neg_g_295_low60_0_low20_16 * (const 64 2) = neg_g_295_low60_0_low20_15 + neg_f_295_low60_0_low20_15,
    r_295_311 * (const 64 2) = r_295_310 + u_295_310,
    s_295_311 * (const 64 2) = s_295_310 + v_295_310
;

assume
    neg_f_295_low60_0_low20_16 = neg_f_295_low60_0_low20_15,
    u_295_311 = u_295_310,
    v_295_311 = v_295_310,
    neg_g_295_low60_0_low20_16 * 2 = neg_g_295_low60_0_low20_15 + neg_f_295_low60_0_low20_15,
    r_295_311 * 2 = r_295_310 + u_295_310,
    s_295_311 * 2 = s_295_310 + v_295_310
&&
    true
;

{
    u_295_311 * neg_f_295_low60_0_low20_0 + v_295_311 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_311 * neg_f_295_low60_0_low20_0 + s_295_311 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_16 + u_295_311 * (const 64 (2**21)) + v_295_311 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_16 + r_295_311 * (const 64 (2**21)) + s_295_311 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_16,
    neg_f_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_16,
    neg_g_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 311)) <=s delta, delta <=s (const 64 (1 + 2*311)),
    (const 64 (-(2**20))) <=s u_295_311, u_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_311, v_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_311, r_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_311, s_295_311 <=s (const 64 ((2**20))),
    u_295_311 + v_295_311 <=s (const 64 (2**20)),
    u_295_311 - v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 + v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 - v_295_311 <=s (const 64 (2**20)),
    r_295_311 + s_295_311 <=s (const 64 (2**20)),
    r_295_311 - s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 + s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 - s_295_311 <=s (const 64 (2**20)),
    u_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_295_311 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_310_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_15,
sint64 neg_g_295_low60_0_low20_15,
sint64 neg_f_295_low60_0_low20_16,
sint64 neg_g_295_low60_0_low20_16,
sint64 u_295_310,
sint64 v_295_310,
sint64 r_295_310,
sint64 s_295_310,
sint64 u_295_311,
sint64 v_295_311,
sint64 r_295_311,
sint64 s_295_311,
bit ne
)={
    u_295_310 * neg_f_295_low60_0_low20_0 + v_295_310 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_15 * (-(2**20)),
    r_295_310 * neg_f_295_low60_0_low20_0 + s_295_310 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_15 * (-(2**20))
&&
    u_295_310 * neg_f_295_low60_0_low20_0 + v_295_310 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_15 * (const 64 (-(2**20))),
    r_295_310 * neg_f_295_low60_0_low20_0 + s_295_310 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_15 + u_295_310 * (const 64 (2**21)) + v_295_310 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_15 + r_295_310 * (const 64 (2**21)) + s_295_310 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_15,
    neg_f_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_15,
    neg_g_295_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 310)) <=s delta, delta <=s (const 64 (1 + 2*310)),
    (const 64 (-(2**20))) <=s u_295_310, u_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_310, v_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_310, r_295_310 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_310, s_295_310 <=s (const 64 ((2**20))),
    u_295_310 + v_295_310 <=s (const 64 (2**20)),
    u_295_310 - v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 + v_295_310 <=s (const 64 (2**20)),
    (const 64 0) - u_295_310 - v_295_310 <=s (const 64 (2**20)),
    r_295_310 + s_295_310 <=s (const 64 (2**20)),
    r_295_310 - s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 + s_295_310 <=s (const 64 (2**20)),
    (const 64 0) - r_295_310 - s_295_310 <=s (const 64 (2**20)),
    u_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_295_310 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_295_310 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step310

// premise c
assume
neg_g_295_low60_0_low20_15 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_16 neg_g_295_low60_0_low20_15;
mov u_295_311 r_295_310;
mov v_295_311 s_295_310;

subs dc neg_g_295_low60_0_low20_16 neg_g_295_low60_0_low20_15 neg_f_295_low60_0_low20_15;
asr neg_g_295_low60_0_low20_16 neg_g_295_low60_0_low20_16 1;
subs dc r_295_311 r_295_310 u_295_310;
asr r_295_311 r_295_311 1;
subs dc s_295_311 s_295_310 v_295_310;
asr s_295_311 s_295_311 1;
assert
    true
&&
    neg_f_295_low60_0_low20_16 = neg_g_295_low60_0_low20_15,
    u_295_311 = r_295_310,
    v_295_311 = s_295_310,
    neg_g_295_low60_0_low20_16 * (const 64 2) = neg_g_295_low60_0_low20_15 - neg_f_295_low60_0_low20_15,
    r_295_311 * (const 64 2) = r_295_310 - u_295_310,
    s_295_311 * (const 64 2) = s_295_310 - v_295_310
;

assume
    neg_f_295_low60_0_low20_16 = neg_g_295_low60_0_low20_15,
    u_295_311 = r_295_310,
    v_295_311 = s_295_310,
    neg_g_295_low60_0_low20_16 * 2 = neg_g_295_low60_0_low20_15 - neg_f_295_low60_0_low20_15,
    r_295_311 * 2 = r_295_310 - u_295_310,
    s_295_311 * 2 = s_295_310 - v_295_310
&&
    true
;

{
    u_295_311 * neg_f_295_low60_0_low20_0 + v_295_311 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_311 * neg_f_295_low60_0_low20_0 + s_295_311 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_16 + u_295_311 * (const 64 (2**21)) + v_295_311 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_16 + r_295_311 * (const 64 (2**21)) + s_295_311 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_16,
    neg_f_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_16,
    neg_g_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 311)) <=s delta, delta <=s (const 64 (1 + 2*311)),
    (const 64 (-(2**20))) <=s u_295_311, u_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_311, v_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_311, r_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_311, s_295_311 <=s (const 64 ((2**20))),
    u_295_311 + v_295_311 <=s (const 64 (2**20)),
    u_295_311 - v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 + v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 - v_295_311 <=s (const 64 (2**20)),
    r_295_311 + s_295_311 <=s (const 64 (2**20)),
    r_295_311 - s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 + s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 - s_295_311 <=s (const 64 (2**20)),
    u_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_295_311 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_311_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_16,
sint64 neg_g_295_low60_0_low20_16,
sint64 neg_f_295_low60_0_low20_17,
sint64 neg_g_295_low60_0_low20_17,
sint64 u_295_311,
sint64 v_295_311,
sint64 r_295_311,
sint64 s_295_311,
sint64 u_295_312,
sint64 v_295_312,
sint64 r_295_312,
sint64 s_295_312,
bit ne
)={
    u_295_311 * neg_f_295_low60_0_low20_0 + v_295_311 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_16 * (-(2**20)),
    r_295_311 * neg_f_295_low60_0_low20_0 + s_295_311 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_16 * (-(2**20))
&&
    u_295_311 * neg_f_295_low60_0_low20_0 + v_295_311 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_16 * (const 64 (-(2**20))),
    r_295_311 * neg_f_295_low60_0_low20_0 + s_295_311 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_16 + u_295_311 * (const 64 (2**21)) + v_295_311 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_16 + r_295_311 * (const 64 (2**21)) + s_295_311 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_16,
    neg_f_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_16,
    neg_g_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 311)) <=s delta, delta <=s (const 64 (1 + 2*311)),
    (const 64 (-(2**20))) <=s u_295_311, u_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_311, v_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_311, r_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_311, s_295_311 <=s (const 64 ((2**20))),
    u_295_311 + v_295_311 <=s (const 64 (2**20)),
    u_295_311 - v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 + v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 - v_295_311 <=s (const 64 (2**20)),
    r_295_311 + s_295_311 <=s (const 64 (2**20)),
    r_295_311 - s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 + s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 - s_295_311 <=s (const 64 (2**20)),
    u_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_295_311 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step311

// premise a
assume
neg_g_295_low60_0_low20_16 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_17 neg_f_295_low60_0_low20_16;
mov u_295_312 u_295_311;
mov v_295_312 v_295_311;

asr neg_g_295_low60_0_low20_17 neg_g_295_low60_0_low20_16 1;
asr r_295_312 r_295_311 1;
asr s_295_312 s_295_311 1;
assert
    true
&&
    neg_f_295_low60_0_low20_17 = neg_f_295_low60_0_low20_16,
    u_295_312 = u_295_311,
    v_295_312 = v_295_311,
    neg_g_295_low60_0_low20_17 * (const 64 2) = neg_g_295_low60_0_low20_16,
    r_295_312 * (const 64 2) = r_295_311,
    s_295_312 * (const 64 2) = s_295_311
;

assume
    neg_f_295_low60_0_low20_17 = neg_f_295_low60_0_low20_16,
    u_295_312 = u_295_311,
    v_295_312 = v_295_311,
    neg_g_295_low60_0_low20_17 * 2 = neg_g_295_low60_0_low20_16,
    r_295_312 * 2 = r_295_311,
    s_295_312 * 2 = s_295_311
&&
    true
;

{
    u_295_312 * neg_f_295_low60_0_low20_0 + v_295_312 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_312 * neg_f_295_low60_0_low20_0 + s_295_312 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_17 + u_295_312 * (const 64 (2**21)) + v_295_312 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_17 + r_295_312 * (const 64 (2**21)) + s_295_312 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_17,
    neg_f_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_17,
    neg_g_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 312)) <=s delta, delta <=s (const 64 (1 + 2*312)),
    (const 64 (-(2**20))) <=s u_295_312, u_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_312, v_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_312, r_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_312, s_295_312 <=s (const 64 ((2**20))),
    u_295_312 + v_295_312 <=s (const 64 (2**20)),
    u_295_312 - v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 + v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 - v_295_312 <=s (const 64 (2**20)),
    r_295_312 + s_295_312 <=s (const 64 (2**20)),
    r_295_312 - s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 + s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 - s_295_312 <=s (const 64 (2**20)),
    u_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_295_312 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_311_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_16,
sint64 neg_g_295_low60_0_low20_16,
sint64 neg_f_295_low60_0_low20_17,
sint64 neg_g_295_low60_0_low20_17,
sint64 u_295_311,
sint64 v_295_311,
sint64 r_295_311,
sint64 s_295_311,
sint64 u_295_312,
sint64 v_295_312,
sint64 r_295_312,
sint64 s_295_312,
bit ne
)={
    u_295_311 * neg_f_295_low60_0_low20_0 + v_295_311 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_16 * (-(2**20)),
    r_295_311 * neg_f_295_low60_0_low20_0 + s_295_311 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_16 * (-(2**20))
&&
    u_295_311 * neg_f_295_low60_0_low20_0 + v_295_311 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_16 * (const 64 (-(2**20))),
    r_295_311 * neg_f_295_low60_0_low20_0 + s_295_311 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_16 + u_295_311 * (const 64 (2**21)) + v_295_311 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_16 + r_295_311 * (const 64 (2**21)) + s_295_311 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_16,
    neg_f_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_16,
    neg_g_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 311)) <=s delta, delta <=s (const 64 (1 + 2*311)),
    (const 64 (-(2**20))) <=s u_295_311, u_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_311, v_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_311, r_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_311, s_295_311 <=s (const 64 ((2**20))),
    u_295_311 + v_295_311 <=s (const 64 (2**20)),
    u_295_311 - v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 + v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 - v_295_311 <=s (const 64 (2**20)),
    r_295_311 + s_295_311 <=s (const 64 (2**20)),
    r_295_311 - s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 + s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 - s_295_311 <=s (const 64 (2**20)),
    u_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_295_311 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step311

// premise b
assume
neg_g_295_low60_0_low20_16 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_17 neg_f_295_low60_0_low20_16;
mov u_295_312 u_295_311;
mov v_295_312 v_295_311;

add neg_g_295_low60_0_low20_17 neg_g_295_low60_0_low20_16 neg_f_295_low60_0_low20_16;
asr neg_g_295_low60_0_low20_17 neg_g_295_low60_0_low20_17 1;
add r_295_312 r_295_311 u_295_311;
asr r_295_312 r_295_312 1;
add s_295_312 s_295_311 v_295_311;
asr s_295_312 s_295_312 1;
assert
    true
&&
    neg_f_295_low60_0_low20_17 = neg_f_295_low60_0_low20_16,
    u_295_312 = u_295_311,
    v_295_312 = v_295_311,
    neg_g_295_low60_0_low20_17 * (const 64 2) = neg_g_295_low60_0_low20_16 + neg_f_295_low60_0_low20_16,
    r_295_312 * (const 64 2) = r_295_311 + u_295_311,
    s_295_312 * (const 64 2) = s_295_311 + v_295_311
;

assume
    neg_f_295_low60_0_low20_17 = neg_f_295_low60_0_low20_16,
    u_295_312 = u_295_311,
    v_295_312 = v_295_311,
    neg_g_295_low60_0_low20_17 * 2 = neg_g_295_low60_0_low20_16 + neg_f_295_low60_0_low20_16,
    r_295_312 * 2 = r_295_311 + u_295_311,
    s_295_312 * 2 = s_295_311 + v_295_311
&&
    true
;

{
    u_295_312 * neg_f_295_low60_0_low20_0 + v_295_312 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_312 * neg_f_295_low60_0_low20_0 + s_295_312 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_17 + u_295_312 * (const 64 (2**21)) + v_295_312 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_17 + r_295_312 * (const 64 (2**21)) + s_295_312 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_17,
    neg_f_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_17,
    neg_g_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 312)) <=s delta, delta <=s (const 64 (1 + 2*312)),
    (const 64 (-(2**20))) <=s u_295_312, u_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_312, v_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_312, r_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_312, s_295_312 <=s (const 64 ((2**20))),
    u_295_312 + v_295_312 <=s (const 64 (2**20)),
    u_295_312 - v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 + v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 - v_295_312 <=s (const 64 (2**20)),
    r_295_312 + s_295_312 <=s (const 64 (2**20)),
    r_295_312 - s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 + s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 - s_295_312 <=s (const 64 (2**20)),
    u_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_295_312 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_311_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_16,
sint64 neg_g_295_low60_0_low20_16,
sint64 neg_f_295_low60_0_low20_17,
sint64 neg_g_295_low60_0_low20_17,
sint64 u_295_311,
sint64 v_295_311,
sint64 r_295_311,
sint64 s_295_311,
sint64 u_295_312,
sint64 v_295_312,
sint64 r_295_312,
sint64 s_295_312,
bit ne
)={
    u_295_311 * neg_f_295_low60_0_low20_0 + v_295_311 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_16 * (-(2**20)),
    r_295_311 * neg_f_295_low60_0_low20_0 + s_295_311 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_16 * (-(2**20))
&&
    u_295_311 * neg_f_295_low60_0_low20_0 + v_295_311 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_16 * (const 64 (-(2**20))),
    r_295_311 * neg_f_295_low60_0_low20_0 + s_295_311 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_16 + u_295_311 * (const 64 (2**21)) + v_295_311 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_16 + r_295_311 * (const 64 (2**21)) + s_295_311 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_16,
    neg_f_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_16,
    neg_g_295_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 311)) <=s delta, delta <=s (const 64 (1 + 2*311)),
    (const 64 (-(2**20))) <=s u_295_311, u_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_311, v_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_311, r_295_311 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_311, s_295_311 <=s (const 64 ((2**20))),
    u_295_311 + v_295_311 <=s (const 64 (2**20)),
    u_295_311 - v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 + v_295_311 <=s (const 64 (2**20)),
    (const 64 0) - u_295_311 - v_295_311 <=s (const 64 (2**20)),
    r_295_311 + s_295_311 <=s (const 64 (2**20)),
    r_295_311 - s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 + s_295_311 <=s (const 64 (2**20)),
    (const 64 0) - r_295_311 - s_295_311 <=s (const 64 (2**20)),
    u_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_295_311 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_295_311 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step311

// premise c
assume
neg_g_295_low60_0_low20_16 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_17 neg_g_295_low60_0_low20_16;
mov u_295_312 r_295_311;
mov v_295_312 s_295_311;

subs dc neg_g_295_low60_0_low20_17 neg_g_295_low60_0_low20_16 neg_f_295_low60_0_low20_16;
asr neg_g_295_low60_0_low20_17 neg_g_295_low60_0_low20_17 1;
subs dc r_295_312 r_295_311 u_295_311;
asr r_295_312 r_295_312 1;
subs dc s_295_312 s_295_311 v_295_311;
asr s_295_312 s_295_312 1;
assert
    true
&&
    neg_f_295_low60_0_low20_17 = neg_g_295_low60_0_low20_16,
    u_295_312 = r_295_311,
    v_295_312 = s_295_311,
    neg_g_295_low60_0_low20_17 * (const 64 2) = neg_g_295_low60_0_low20_16 - neg_f_295_low60_0_low20_16,
    r_295_312 * (const 64 2) = r_295_311 - u_295_311,
    s_295_312 * (const 64 2) = s_295_311 - v_295_311
;

assume
    neg_f_295_low60_0_low20_17 = neg_g_295_low60_0_low20_16,
    u_295_312 = r_295_311,
    v_295_312 = s_295_311,
    neg_g_295_low60_0_low20_17 * 2 = neg_g_295_low60_0_low20_16 - neg_f_295_low60_0_low20_16,
    r_295_312 * 2 = r_295_311 - u_295_311,
    s_295_312 * 2 = s_295_311 - v_295_311
&&
    true
;

{
    u_295_312 * neg_f_295_low60_0_low20_0 + v_295_312 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_312 * neg_f_295_low60_0_low20_0 + s_295_312 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_17 + u_295_312 * (const 64 (2**21)) + v_295_312 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_17 + r_295_312 * (const 64 (2**21)) + s_295_312 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_17,
    neg_f_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_17,
    neg_g_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 312)) <=s delta, delta <=s (const 64 (1 + 2*312)),
    (const 64 (-(2**20))) <=s u_295_312, u_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_312, v_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_312, r_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_312, s_295_312 <=s (const 64 ((2**20))),
    u_295_312 + v_295_312 <=s (const 64 (2**20)),
    u_295_312 - v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 + v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 - v_295_312 <=s (const 64 (2**20)),
    r_295_312 + s_295_312 <=s (const 64 (2**20)),
    r_295_312 - s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 + s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 - s_295_312 <=s (const 64 (2**20)),
    u_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_295_312 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_312_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_17,
sint64 neg_g_295_low60_0_low20_17,
sint64 neg_f_295_low60_0_low20_18,
sint64 neg_g_295_low60_0_low20_18,
sint64 u_295_312,
sint64 v_295_312,
sint64 r_295_312,
sint64 s_295_312,
sint64 u_295_313,
sint64 v_295_313,
sint64 r_295_313,
sint64 s_295_313,
bit ne
)={
    u_295_312 * neg_f_295_low60_0_low20_0 + v_295_312 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_17 * (-(2**20)),
    r_295_312 * neg_f_295_low60_0_low20_0 + s_295_312 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_17 * (-(2**20))
&&
    u_295_312 * neg_f_295_low60_0_low20_0 + v_295_312 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_17 * (const 64 (-(2**20))),
    r_295_312 * neg_f_295_low60_0_low20_0 + s_295_312 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_17 + u_295_312 * (const 64 (2**21)) + v_295_312 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_17 + r_295_312 * (const 64 (2**21)) + s_295_312 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_17,
    neg_f_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_17,
    neg_g_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 312)) <=s delta, delta <=s (const 64 (1 + 2*312)),
    (const 64 (-(2**20))) <=s u_295_312, u_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_312, v_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_312, r_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_312, s_295_312 <=s (const 64 ((2**20))),
    u_295_312 + v_295_312 <=s (const 64 (2**20)),
    u_295_312 - v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 + v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 - v_295_312 <=s (const 64 (2**20)),
    r_295_312 + s_295_312 <=s (const 64 (2**20)),
    r_295_312 - s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 + s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 - s_295_312 <=s (const 64 (2**20)),
    u_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_295_312 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step312

// premise a
assume
neg_g_295_low60_0_low20_17 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_18 neg_f_295_low60_0_low20_17;
mov u_295_313 u_295_312;
mov v_295_313 v_295_312;

asr neg_g_295_low60_0_low20_18 neg_g_295_low60_0_low20_17 1;
asr r_295_313 r_295_312 1;
asr s_295_313 s_295_312 1;
assert
    true
&&
    neg_f_295_low60_0_low20_18 = neg_f_295_low60_0_low20_17,
    u_295_313 = u_295_312,
    v_295_313 = v_295_312,
    neg_g_295_low60_0_low20_18 * (const 64 2) = neg_g_295_low60_0_low20_17,
    r_295_313 * (const 64 2) = r_295_312,
    s_295_313 * (const 64 2) = s_295_312
;

assume
    neg_f_295_low60_0_low20_18 = neg_f_295_low60_0_low20_17,
    u_295_313 = u_295_312,
    v_295_313 = v_295_312,
    neg_g_295_low60_0_low20_18 * 2 = neg_g_295_low60_0_low20_17,
    r_295_313 * 2 = r_295_312,
    s_295_313 * 2 = s_295_312
&&
    true
;

{
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_18 + u_295_313 * (const 64 (2**21)) + v_295_313 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_18 + r_295_313 * (const 64 (2**21)) + s_295_313 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_18,
    neg_f_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_18,
    neg_g_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 313)) <=s delta, delta <=s (const 64 (1 + 2*313)),
    (const 64 (-(2**20))) <=s u_295_313, u_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_313, v_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_313, r_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_313, s_295_313 <=s (const 64 ((2**20))),
    u_295_313 + v_295_313 <=s (const 64 (2**20)),
    u_295_313 - v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 + v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 - v_295_313 <=s (const 64 (2**20)),
    r_295_313 + s_295_313 <=s (const 64 (2**20)),
    r_295_313 - s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 + s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 - s_295_313 <=s (const 64 (2**20)),
    u_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_295_313 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_312_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_17,
sint64 neg_g_295_low60_0_low20_17,
sint64 neg_f_295_low60_0_low20_18,
sint64 neg_g_295_low60_0_low20_18,
sint64 u_295_312,
sint64 v_295_312,
sint64 r_295_312,
sint64 s_295_312,
sint64 u_295_313,
sint64 v_295_313,
sint64 r_295_313,
sint64 s_295_313,
bit ne
)={
    u_295_312 * neg_f_295_low60_0_low20_0 + v_295_312 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_17 * (-(2**20)),
    r_295_312 * neg_f_295_low60_0_low20_0 + s_295_312 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_17 * (-(2**20))
&&
    u_295_312 * neg_f_295_low60_0_low20_0 + v_295_312 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_17 * (const 64 (-(2**20))),
    r_295_312 * neg_f_295_low60_0_low20_0 + s_295_312 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_17 + u_295_312 * (const 64 (2**21)) + v_295_312 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_17 + r_295_312 * (const 64 (2**21)) + s_295_312 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_17,
    neg_f_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_17,
    neg_g_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 312)) <=s delta, delta <=s (const 64 (1 + 2*312)),
    (const 64 (-(2**20))) <=s u_295_312, u_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_312, v_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_312, r_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_312, s_295_312 <=s (const 64 ((2**20))),
    u_295_312 + v_295_312 <=s (const 64 (2**20)),
    u_295_312 - v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 + v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 - v_295_312 <=s (const 64 (2**20)),
    r_295_312 + s_295_312 <=s (const 64 (2**20)),
    r_295_312 - s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 + s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 - s_295_312 <=s (const 64 (2**20)),
    u_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_295_312 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step312

// premise b
assume
neg_g_295_low60_0_low20_17 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_18 neg_f_295_low60_0_low20_17;
mov u_295_313 u_295_312;
mov v_295_313 v_295_312;

add neg_g_295_low60_0_low20_18 neg_g_295_low60_0_low20_17 neg_f_295_low60_0_low20_17;
asr neg_g_295_low60_0_low20_18 neg_g_295_low60_0_low20_18 1;
add r_295_313 r_295_312 u_295_312;
asr r_295_313 r_295_313 1;
add s_295_313 s_295_312 v_295_312;
asr s_295_313 s_295_313 1;
assert
    true
&&
    neg_f_295_low60_0_low20_18 = neg_f_295_low60_0_low20_17,
    u_295_313 = u_295_312,
    v_295_313 = v_295_312,
    neg_g_295_low60_0_low20_18 * (const 64 2) = neg_g_295_low60_0_low20_17 + neg_f_295_low60_0_low20_17,
    r_295_313 * (const 64 2) = r_295_312 + u_295_312,
    s_295_313 * (const 64 2) = s_295_312 + v_295_312
;

assume
    neg_f_295_low60_0_low20_18 = neg_f_295_low60_0_low20_17,
    u_295_313 = u_295_312,
    v_295_313 = v_295_312,
    neg_g_295_low60_0_low20_18 * 2 = neg_g_295_low60_0_low20_17 + neg_f_295_low60_0_low20_17,
    r_295_313 * 2 = r_295_312 + u_295_312,
    s_295_313 * 2 = s_295_312 + v_295_312
&&
    true
;

{
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_18 + u_295_313 * (const 64 (2**21)) + v_295_313 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_18 + r_295_313 * (const 64 (2**21)) + s_295_313 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_18,
    neg_f_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_18,
    neg_g_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 313)) <=s delta, delta <=s (const 64 (1 + 2*313)),
    (const 64 (-(2**20))) <=s u_295_313, u_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_313, v_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_313, r_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_313, s_295_313 <=s (const 64 ((2**20))),
    u_295_313 + v_295_313 <=s (const 64 (2**20)),
    u_295_313 - v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 + v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 - v_295_313 <=s (const 64 (2**20)),
    r_295_313 + s_295_313 <=s (const 64 (2**20)),
    r_295_313 - s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 + s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 - s_295_313 <=s (const 64 (2**20)),
    u_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_295_313 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_312_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_17,
sint64 neg_g_295_low60_0_low20_17,
sint64 neg_f_295_low60_0_low20_18,
sint64 neg_g_295_low60_0_low20_18,
sint64 u_295_312,
sint64 v_295_312,
sint64 r_295_312,
sint64 s_295_312,
sint64 u_295_313,
sint64 v_295_313,
sint64 r_295_313,
sint64 s_295_313,
bit ne
)={
    u_295_312 * neg_f_295_low60_0_low20_0 + v_295_312 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_17 * (-(2**20)),
    r_295_312 * neg_f_295_low60_0_low20_0 + s_295_312 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_17 * (-(2**20))
&&
    u_295_312 * neg_f_295_low60_0_low20_0 + v_295_312 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_17 * (const 64 (-(2**20))),
    r_295_312 * neg_f_295_low60_0_low20_0 + s_295_312 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_17 + u_295_312 * (const 64 (2**21)) + v_295_312 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_17 + r_295_312 * (const 64 (2**21)) + s_295_312 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_17,
    neg_f_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_17,
    neg_g_295_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 312)) <=s delta, delta <=s (const 64 (1 + 2*312)),
    (const 64 (-(2**20))) <=s u_295_312, u_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_312, v_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_312, r_295_312 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_312, s_295_312 <=s (const 64 ((2**20))),
    u_295_312 + v_295_312 <=s (const 64 (2**20)),
    u_295_312 - v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 + v_295_312 <=s (const 64 (2**20)),
    (const 64 0) - u_295_312 - v_295_312 <=s (const 64 (2**20)),
    r_295_312 + s_295_312 <=s (const 64 (2**20)),
    r_295_312 - s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 + s_295_312 <=s (const 64 (2**20)),
    (const 64 0) - r_295_312 - s_295_312 <=s (const 64 (2**20)),
    u_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_295_312 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_295_312 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step312

// premise c
assume
neg_g_295_low60_0_low20_17 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_18 neg_g_295_low60_0_low20_17;
mov u_295_313 r_295_312;
mov v_295_313 s_295_312;

subs dc neg_g_295_low60_0_low20_18 neg_g_295_low60_0_low20_17 neg_f_295_low60_0_low20_17;
asr neg_g_295_low60_0_low20_18 neg_g_295_low60_0_low20_18 1;
subs dc r_295_313 r_295_312 u_295_312;
asr r_295_313 r_295_313 1;
subs dc s_295_313 s_295_312 v_295_312;
asr s_295_313 s_295_313 1;
assert
    true
&&
    neg_f_295_low60_0_low20_18 = neg_g_295_low60_0_low20_17,
    u_295_313 = r_295_312,
    v_295_313 = s_295_312,
    neg_g_295_low60_0_low20_18 * (const 64 2) = neg_g_295_low60_0_low20_17 - neg_f_295_low60_0_low20_17,
    r_295_313 * (const 64 2) = r_295_312 - u_295_312,
    s_295_313 * (const 64 2) = s_295_312 - v_295_312
;

assume
    neg_f_295_low60_0_low20_18 = neg_g_295_low60_0_low20_17,
    u_295_313 = r_295_312,
    v_295_313 = s_295_312,
    neg_g_295_low60_0_low20_18 * 2 = neg_g_295_low60_0_low20_17 - neg_f_295_low60_0_low20_17,
    r_295_313 * 2 = r_295_312 - u_295_312,
    s_295_313 * 2 = s_295_312 - v_295_312
&&
    true
;

{
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_18 + u_295_313 * (const 64 (2**21)) + v_295_313 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_18 + r_295_313 * (const 64 (2**21)) + s_295_313 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_18,
    neg_f_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_18,
    neg_g_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 313)) <=s delta, delta <=s (const 64 (1 + 2*313)),
    (const 64 (-(2**20))) <=s u_295_313, u_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_313, v_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_313, r_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_313, s_295_313 <=s (const 64 ((2**20))),
    u_295_313 + v_295_313 <=s (const 64 (2**20)),
    u_295_313 - v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 + v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 - v_295_313 <=s (const 64 (2**20)),
    r_295_313 + s_295_313 <=s (const 64 (2**20)),
    r_295_313 - s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 + s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 - s_295_313 <=s (const 64 (2**20)),
    u_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_295_313 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_313_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_18,
sint64 neg_g_295_low60_0_low20_18,
sint64 neg_f_295_low60_0_low20_19,
sint64 neg_g_295_low60_0_low20_19,
sint64 u_295_313,
sint64 v_295_313,
sint64 r_295_313,
sint64 s_295_313,
sint64 u_295_314,
sint64 v_295_314,
sint64 r_295_314,
sint64 s_295_314,
bit ne
)={
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (-(2**20)),
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (-(2**20))
&&
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (const 64 (-(2**20))),
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_18 + u_295_313 * (const 64 (2**21)) + v_295_313 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_18 + r_295_313 * (const 64 (2**21)) + s_295_313 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_18,
    neg_f_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_18,
    neg_g_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 313)) <=s delta, delta <=s (const 64 (1 + 2*313)),
    (const 64 (-(2**20))) <=s u_295_313, u_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_313, v_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_313, r_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_313, s_295_313 <=s (const 64 ((2**20))),
    u_295_313 + v_295_313 <=s (const 64 (2**20)),
    u_295_313 - v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 + v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 - v_295_313 <=s (const 64 (2**20)),
    r_295_313 + s_295_313 <=s (const 64 (2**20)),
    r_295_313 - s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 + s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 - s_295_313 <=s (const 64 (2**20)),
    u_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_295_313 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step313

// premise a
assume
neg_g_295_low60_0_low20_18 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_0_low20_19 neg_f_295_low60_0_low20_18;
mov u_295_314 u_295_313;
mov v_295_314 v_295_313;

asr neg_g_295_low60_0_low20_19 neg_g_295_low60_0_low20_18 1;
asr r_295_314 r_295_313 1;
asr s_295_314 s_295_313 1;
assert
    true
&&
    neg_f_295_low60_0_low20_19 = neg_f_295_low60_0_low20_18,
    u_295_314 = u_295_313,
    v_295_314 = v_295_313,
    neg_g_295_low60_0_low20_19 * (const 64 2) = neg_g_295_low60_0_low20_18,
    r_295_314 * (const 64 2) = r_295_313,
    s_295_314 * (const 64 2) = s_295_313
;

assume
    neg_f_295_low60_0_low20_19 = neg_f_295_low60_0_low20_18,
    u_295_314 = u_295_313,
    v_295_314 = v_295_313,
    neg_g_295_low60_0_low20_19 * 2 = neg_g_295_low60_0_low20_18,
    r_295_314 * 2 = r_295_313,
    s_295_314 * 2 = s_295_313
&&
    true
;

{
    u_295_314 * neg_f_295_low60_0_low20_0 + v_295_314 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_314 * neg_f_295_low60_0_low20_0 + s_295_314 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_19 + u_295_314 * (const 64 (2**21)) + v_295_314 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_19 + r_295_314 * (const 64 (2**21)) + s_295_314 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_19,
    neg_f_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_19,
    neg_g_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 314)) <=s delta, delta <=s (const 64 (1 + 2*314)),
    (const 64 (-(2**20))) <=s u_295_314, u_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_314, v_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_314, r_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_314, s_295_314 <=s (const 64 ((2**20))),
    u_295_314 + v_295_314 <=s (const 64 (2**20)),
    u_295_314 - v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 + v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 - v_295_314 <=s (const 64 (2**20)),
    r_295_314 + s_295_314 <=s (const 64 (2**20)),
    r_295_314 - s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 + s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 - s_295_314 <=s (const 64 (2**20)),
    u_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_295_314 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_313_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_18,
sint64 neg_g_295_low60_0_low20_18,
sint64 neg_f_295_low60_0_low20_19,
sint64 neg_g_295_low60_0_low20_19,
sint64 u_295_313,
sint64 v_295_313,
sint64 r_295_313,
sint64 s_295_313,
sint64 u_295_314,
sint64 v_295_314,
sint64 r_295_314,
sint64 s_295_314,
bit ne
)={
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (-(2**20)),
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (-(2**20))
&&
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (const 64 (-(2**20))),
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_18 + u_295_313 * (const 64 (2**21)) + v_295_313 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_18 + r_295_313 * (const 64 (2**21)) + s_295_313 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_18,
    neg_f_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_18,
    neg_g_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 313)) <=s delta, delta <=s (const 64 (1 + 2*313)),
    (const 64 (-(2**20))) <=s u_295_313, u_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_313, v_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_313, r_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_313, s_295_313 <=s (const 64 ((2**20))),
    u_295_313 + v_295_313 <=s (const 64 (2**20)),
    u_295_313 - v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 + v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 - v_295_313 <=s (const 64 (2**20)),
    r_295_313 + s_295_313 <=s (const 64 (2**20)),
    r_295_313 - s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 + s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 - s_295_313 <=s (const 64 (2**20)),
    u_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_295_313 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step313

// premise b
assume
neg_g_295_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_19 neg_f_295_low60_0_low20_18;
mov u_295_314 u_295_313;
mov v_295_314 v_295_313;

add neg_g_295_low60_0_low20_19 neg_g_295_low60_0_low20_18 neg_f_295_low60_0_low20_18;
asr neg_g_295_low60_0_low20_19 neg_g_295_low60_0_low20_19 1;
add r_295_314 r_295_313 u_295_313;
asr r_295_314 r_295_314 1;
add s_295_314 s_295_313 v_295_313;
asr s_295_314 s_295_314 1;
assert
    true
&&
    neg_f_295_low60_0_low20_19 = neg_f_295_low60_0_low20_18,
    u_295_314 = u_295_313,
    v_295_314 = v_295_313,
    neg_g_295_low60_0_low20_19 * (const 64 2) = neg_g_295_low60_0_low20_18 + neg_f_295_low60_0_low20_18,
    r_295_314 * (const 64 2) = r_295_313 + u_295_313,
    s_295_314 * (const 64 2) = s_295_313 + v_295_313
;

assume
    neg_f_295_low60_0_low20_19 = neg_f_295_low60_0_low20_18,
    u_295_314 = u_295_313,
    v_295_314 = v_295_313,
    neg_g_295_low60_0_low20_19 * 2 = neg_g_295_low60_0_low20_18 + neg_f_295_low60_0_low20_18,
    r_295_314 * 2 = r_295_313 + u_295_313,
    s_295_314 * 2 = s_295_313 + v_295_313
&&
    true
;

{
    u_295_314 * neg_f_295_low60_0_low20_0 + v_295_314 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_314 * neg_f_295_low60_0_low20_0 + s_295_314 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_19 + u_295_314 * (const 64 (2**21)) + v_295_314 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_19 + r_295_314 * (const 64 (2**21)) + s_295_314 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_19,
    neg_f_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_19,
    neg_g_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 314)) <=s delta, delta <=s (const 64 (1 + 2*314)),
    (const 64 (-(2**20))) <=s u_295_314, u_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_314, v_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_314, r_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_314, s_295_314 <=s (const 64 ((2**20))),
    u_295_314 + v_295_314 <=s (const 64 (2**20)),
    u_295_314 - v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 + v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 - v_295_314 <=s (const 64 (2**20)),
    r_295_314 + s_295_314 <=s (const 64 (2**20)),
    r_295_314 - s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 + s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 - s_295_314 <=s (const 64 (2**20)),
    u_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_295_314 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_313_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_18,
sint64 neg_g_295_low60_0_low20_18,
sint64 neg_f_295_low60_0_low20_19,
sint64 neg_g_295_low60_0_low20_19,
sint64 u_295_313,
sint64 v_295_313,
sint64 r_295_313,
sint64 s_295_313,
sint64 u_295_314,
sint64 v_295_314,
sint64 r_295_314,
sint64 s_295_314,
bit ne
)={
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (-(2**20)),
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (-(2**20))
&&
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (const 64 (-(2**20))),
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_18 + u_295_313 * (const 64 (2**21)) + v_295_313 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_18 + r_295_313 * (const 64 (2**21)) + s_295_313 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_18,
    neg_f_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_18,
    neg_g_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 313)) <=s delta, delta <=s (const 64 (1 + 2*313)),
    (const 64 (-(2**20))) <=s u_295_313, u_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_313, v_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_313, r_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_313, s_295_313 <=s (const 64 ((2**20))),
    u_295_313 + v_295_313 <=s (const 64 (2**20)),
    u_295_313 - v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 + v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 - v_295_313 <=s (const 64 (2**20)),
    r_295_313 + s_295_313 <=s (const 64 (2**20)),
    r_295_313 - s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 + s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 - s_295_313 <=s (const 64 (2**20)),
    u_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_295_313 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step313

// premise c
assume
neg_g_295_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_19 neg_g_295_low60_0_low20_18;
mov u_295_314 r_295_313;
mov v_295_314 s_295_313;

subs dc neg_g_295_low60_0_low20_19 neg_g_295_low60_0_low20_18 neg_f_295_low60_0_low20_18;
asr neg_g_295_low60_0_low20_19 neg_g_295_low60_0_low20_19 1;
subs dc r_295_314 r_295_313 u_295_313;
asr r_295_314 r_295_314 1;
subs dc s_295_314 s_295_313 v_295_313;
asr s_295_314 s_295_314 1;
assert
    true
&&
    neg_f_295_low60_0_low20_19 = neg_g_295_low60_0_low20_18,
    u_295_314 = r_295_313,
    v_295_314 = s_295_313,
    neg_g_295_low60_0_low20_19 * (const 64 2) = neg_g_295_low60_0_low20_18 - neg_f_295_low60_0_low20_18,
    r_295_314 * (const 64 2) = r_295_313 - u_295_313,
    s_295_314 * (const 64 2) = s_295_313 - v_295_313
;

assume
    neg_f_295_low60_0_low20_19 = neg_g_295_low60_0_low20_18,
    u_295_314 = r_295_313,
    v_295_314 = s_295_313,
    neg_g_295_low60_0_low20_19 * 2 = neg_g_295_low60_0_low20_18 - neg_f_295_low60_0_low20_18,
    r_295_314 * 2 = r_295_313 - u_295_313,
    s_295_314 * 2 = s_295_313 - v_295_313
&&
    true
;

{
    u_295_314 * neg_f_295_low60_0_low20_0 + v_295_314 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_314 * neg_f_295_low60_0_low20_0 + s_295_314 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_19 + u_295_314 * (const 64 (2**21)) + v_295_314 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_19 + r_295_314 * (const 64 (2**21)) + s_295_314 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_19,
    neg_f_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_19,
    neg_g_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 314)) <=s delta, delta <=s (const 64 (1 + 2*314)),
    (const 64 (-(2**20))) <=s u_295_314, u_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_314, v_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_314, r_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_314, s_295_314 <=s (const 64 ((2**20))),
    u_295_314 + v_295_314 <=s (const 64 (2**20)),
    u_295_314 - v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 + v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 - v_295_314 <=s (const 64 (2**20)),
    r_295_314 + s_295_314 <=s (const 64 (2**20)),
    r_295_314 - s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 + s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 - s_295_314 <=s (const 64 (2**20)),
    u_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_295_314 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_314_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_19,
sint64 neg_g_295_low60_0_low20_19,
sint64 neg_f_295_low60_0_low20_20,
sint64 neg_g_295_low60_0_low20_20,
sint64 u_295_314,
sint64 v_295_314,
sint64 r_295_314,
sint64 s_295_314,
sint64 u_295_315,
sint64 v_295_315,
sint64 r_295_315,
sint64 s_295_315,
bit ne
)={
    u_295_314 * neg_f_295_low60_0_low20_0 + v_295_314 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_19 * (-(2**20)),
    r_295_314 * neg_f_295_low60_0_low20_0 + s_295_314 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_19 * (-(2**20))
&&
    u_295_314 * neg_f_295_low60_0_low20_0 + v_295_314 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_19 * (const 64 (-(2**20))),
    r_295_314 * neg_f_295_low60_0_low20_0 + s_295_314 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_19 + u_295_314 * (const 64 (2**21)) + v_295_314 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_19 + r_295_314 * (const 64 (2**21)) + s_295_314 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_19,
    neg_f_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_19,
    neg_g_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 314)) <=s delta, delta <=s (const 64 (1 + 2*314)),
    (const 64 (-(2**20))) <=s u_295_314, u_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_314, v_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_314, r_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_314, s_295_314 <=s (const 64 ((2**20))),
    u_295_314 + v_295_314 <=s (const 64 (2**20)),
    u_295_314 - v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 + v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 - v_295_314 <=s (const 64 (2**20)),
    r_295_314 + s_295_314 <=s (const 64 (2**20)),
    r_295_314 - s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 + s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 - s_295_314 <=s (const 64 (2**20)),
    u_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_295_314 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step314

// premise a
assume
neg_g_295_low60_0_low20_19 = 0 (mod 2)
&&
neg_g_295_low60_0_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov neg_f_295_low60_0_low20_20 neg_f_295_low60_0_low20_19;
mov u_295_315 u_295_314;
mov v_295_315 v_295_314;

asr neg_g_295_low60_0_low20_20 neg_g_295_low60_0_low20_19 1;
asr r_295_315 r_295_314 1;
asr s_295_315 s_295_314 1;
assert
    true
&&
    neg_f_295_low60_0_low20_20 = neg_f_295_low60_0_low20_19,
    u_295_315 = u_295_314,
    v_295_315 = v_295_314,
    neg_g_295_low60_0_low20_20 * (const 64 2) = neg_g_295_low60_0_low20_19,
    r_295_315 * (const 64 2) = r_295_314,
    s_295_315 * (const 64 2) = s_295_314
;

assume
    neg_f_295_low60_0_low20_20 = neg_f_295_low60_0_low20_19,
    u_295_315 = u_295_314,
    v_295_315 = v_295_314,
    neg_g_295_low60_0_low20_20 * 2 = neg_g_295_low60_0_low20_19,
    r_295_315 * 2 = r_295_314,
    s_295_315 * 2 = s_295_314
&&
    true
;

{
    u_295_315 * neg_f_295_low60_0_low20_0 + v_295_315 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_315 * neg_f_295_low60_0_low20_0 + s_295_315 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_20 + u_295_315 * (const 64 (2**21)) + v_295_315 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_20 + r_295_315 * (const 64 (2**21)) + s_295_315 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_20,
    neg_f_295_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_20,
    neg_g_295_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 315)) <=s delta, delta <=s (const 64 (1 + 2*315)),
    (const 64 (-(2**20))) <=s u_295_315, u_295_315 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_315, v_295_315 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_315, r_295_315 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_315, s_295_315 <=s (const 64 ((2**20))),
    u_295_315 + v_295_315 <=s (const 64 (2**20)),
    u_295_315 - v_295_315 <=s (const 64 (2**20)),
    (const 64 0) - u_295_315 + v_295_315 <=s (const 64 (2**20)),
    (const 64 0) - u_295_315 - v_295_315 <=s (const 64 (2**20)),
    r_295_315 + s_295_315 <=s (const 64 (2**20)),
    r_295_315 - s_295_315 <=s (const 64 (2**20)),
    (const 64 0) - r_295_315 + s_295_315 <=s (const 64 (2**20)),
    (const 64 0) - r_295_315 - s_295_315 <=s (const 64 (2**20)),
    u_295_315 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_295_315 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_295_315 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_295_315 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_314_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_19,
sint64 neg_g_295_low60_0_low20_19,
sint64 neg_f_295_low60_0_low20_20,
sint64 neg_g_295_low60_0_low20_20,
sint64 u_295_314,
sint64 v_295_314,
sint64 r_295_314,
sint64 s_295_314,
sint64 u_295_315,
sint64 v_295_315,
sint64 r_295_315,
sint64 s_295_315,
bit ne
)={
    u_295_314 * neg_f_295_low60_0_low20_0 + v_295_314 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_19 * (-(2**20)),
    r_295_314 * neg_f_295_low60_0_low20_0 + s_295_314 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_19 * (-(2**20))
&&
    u_295_314 * neg_f_295_low60_0_low20_0 + v_295_314 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_19 * (const 64 (-(2**20))),
    r_295_314 * neg_f_295_low60_0_low20_0 + s_295_314 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_19 + u_295_314 * (const 64 (2**21)) + v_295_314 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_19 + r_295_314 * (const 64 (2**21)) + s_295_314 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_19,
    neg_f_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_19,
    neg_g_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 314)) <=s delta, delta <=s (const 64 (1 + 2*314)),
    (const 64 (-(2**20))) <=s u_295_314, u_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_314, v_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_314, r_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_314, s_295_314 <=s (const 64 ((2**20))),
    u_295_314 + v_295_314 <=s (const 64 (2**20)),
    u_295_314 - v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 + v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 - v_295_314 <=s (const 64 (2**20)),
    r_295_314 + s_295_314 <=s (const 64 (2**20)),
    r_295_314 - s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 + s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 - s_295_314 <=s (const 64 (2**20)),
    u_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_295_314 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step314

// premise b
assume
neg_g_295_low60_0_low20_19 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_20 neg_f_295_low60_0_low20_19;
mov u_295_315 u_295_314;
mov v_295_315 v_295_314;

add neg_g_295_low60_0_low20_20 neg_g_295_low60_0_low20_19 neg_f_295_low60_0_low20_19;
asr neg_g_295_low60_0_low20_20 neg_g_295_low60_0_low20_20 1;
add r_295_315 r_295_314 u_295_314;
asr r_295_315 r_295_315 1;
add s_295_315 s_295_314 v_295_314;
asr s_295_315 s_295_315 1;
assert
    true
&&
    neg_f_295_low60_0_low20_20 = neg_f_295_low60_0_low20_19,
    u_295_315 = u_295_314,
    v_295_315 = v_295_314,
    neg_g_295_low60_0_low20_20 * (const 64 2) = neg_g_295_low60_0_low20_19 + neg_f_295_low60_0_low20_19,
    r_295_315 * (const 64 2) = r_295_314 + u_295_314,
    s_295_315 * (const 64 2) = s_295_314 + v_295_314
;

assume
    neg_f_295_low60_0_low20_20 = neg_f_295_low60_0_low20_19,
    u_295_315 = u_295_314,
    v_295_315 = v_295_314,
    neg_g_295_low60_0_low20_20 * 2 = neg_g_295_low60_0_low20_19 + neg_f_295_low60_0_low20_19,
    r_295_315 * 2 = r_295_314 + u_295_314,
    s_295_315 * 2 = s_295_314 + v_295_314
&&
    true
;

{
    u_295_315 * neg_f_295_low60_0_low20_0 + v_295_315 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_315 * neg_f_295_low60_0_low20_0 + s_295_315 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_20 + u_295_315 * (const 64 (2**21)) + v_295_315 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_20 + r_295_315 * (const 64 (2**21)) + s_295_315 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_20,
    neg_f_295_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_20,
    neg_g_295_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 315)) <=s delta, delta <=s (const 64 (1 + 2*315)),
    (const 64 (-(2**20))) <=s u_295_315, u_295_315 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_315, v_295_315 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_315, r_295_315 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_315, s_295_315 <=s (const 64 ((2**20))),
    u_295_315 + v_295_315 <=s (const 64 (2**20)),
    u_295_315 - v_295_315 <=s (const 64 (2**20)),
    (const 64 0) - u_295_315 + v_295_315 <=s (const 64 (2**20)),
    (const 64 0) - u_295_315 - v_295_315 <=s (const 64 (2**20)),
    r_295_315 + s_295_315 <=s (const 64 (2**20)),
    r_295_315 - s_295_315 <=s (const 64 (2**20)),
    (const 64 0) - r_295_315 + s_295_315 <=s (const 64 (2**20)),
    (const 64 0) - r_295_315 - s_295_315 <=s (const 64 (2**20)),
    u_295_315 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_295_315 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_295_315 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_295_315 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_314_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_19,
sint64 neg_g_295_low60_0_low20_19,
sint64 neg_f_295_low60_0_low20_20,
sint64 neg_g_295_low60_0_low20_20,
sint64 u_295_314,
sint64 v_295_314,
sint64 r_295_314,
sint64 s_295_314,
sint64 u_295_315,
sint64 v_295_315,
sint64 r_295_315,
sint64 s_295_315,
bit ne
)={
    u_295_314 * neg_f_295_low60_0_low20_0 + v_295_314 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_19 * (-(2**20)),
    r_295_314 * neg_f_295_low60_0_low20_0 + s_295_314 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_19 * (-(2**20))
&&
    u_295_314 * neg_f_295_low60_0_low20_0 + v_295_314 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_19 * (const 64 (-(2**20))),
    r_295_314 * neg_f_295_low60_0_low20_0 + s_295_314 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_19 + u_295_314 * (const 64 (2**21)) + v_295_314 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_19 + r_295_314 * (const 64 (2**21)) + s_295_314 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_19,
    neg_f_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_19,
    neg_g_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 314)) <=s delta, delta <=s (const 64 (1 + 2*314)),
    (const 64 (-(2**20))) <=s u_295_314, u_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_314, v_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_314, r_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_314, s_295_314 <=s (const 64 ((2**20))),
    u_295_314 + v_295_314 <=s (const 64 (2**20)),
    u_295_314 - v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 + v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 - v_295_314 <=s (const 64 (2**20)),
    r_295_314 + s_295_314 <=s (const 64 (2**20)),
    r_295_314 - s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 + s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 - s_295_314 <=s (const 64 (2**20)),
    u_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_295_314 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step314

// premise c
assume
neg_g_295_low60_0_low20_19 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_20 neg_g_295_low60_0_low20_19;
mov u_295_315 r_295_314;
mov v_295_315 s_295_314;

subs dc neg_g_295_low60_0_low20_20 neg_g_295_low60_0_low20_19 neg_f_295_low60_0_low20_19;
asr neg_g_295_low60_0_low20_20 neg_g_295_low60_0_low20_20 1;
subs dc r_295_315 r_295_314 u_295_314;
asr r_295_315 r_295_315 1;
subs dc s_295_315 s_295_314 v_295_314;
asr s_295_315 s_295_315 1;
assert
    true
&&
    neg_f_295_low60_0_low20_20 = neg_g_295_low60_0_low20_19,
    u_295_315 = r_295_314,
    v_295_315 = s_295_314,
    neg_g_295_low60_0_low20_20 * (const 64 2) = neg_g_295_low60_0_low20_19 - neg_f_295_low60_0_low20_19,
    r_295_315 * (const 64 2) = r_295_314 - u_295_314,
    s_295_315 * (const 64 2) = s_295_314 - v_295_314
;

assume
    neg_f_295_low60_0_low20_20 = neg_g_295_low60_0_low20_19,
    u_295_315 = r_295_314,
    v_295_315 = s_295_314,
    neg_g_295_low60_0_low20_20 * 2 = neg_g_295_low60_0_low20_19 - neg_f_295_low60_0_low20_19,
    r_295_315 * 2 = r_295_314 - u_295_314,
    s_295_315 * 2 = s_295_314 - v_295_314
&&
    true
;

{
    u_295_315 * neg_f_295_low60_0_low20_0 + v_295_315 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_315 * neg_f_295_low60_0_low20_0 + s_295_315 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_20 + u_295_315 * (const 64 (2**21)) + v_295_315 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_20 + r_295_315 * (const 64 (2**21)) + s_295_315 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_20,
    neg_f_295_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_20,
    neg_g_295_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 315)) <=s delta, delta <=s (const 64 (1 + 2*315)),
    (const 64 (-(2**20))) <=s u_295_315, u_295_315 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_315, v_295_315 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_315, r_295_315 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_315, s_295_315 <=s (const 64 ((2**20))),
    u_295_315 + v_295_315 <=s (const 64 (2**20)),
    u_295_315 - v_295_315 <=s (const 64 (2**20)),
    (const 64 0) - u_295_315 + v_295_315 <=s (const 64 (2**20)),
    (const 64 0) - u_295_315 - v_295_315 <=s (const 64 (2**20)),
    r_295_315 + s_295_315 <=s (const 64 (2**20)),
    r_295_315 - s_295_315 <=s (const 64 (2**20)),
    (const 64 0) - r_295_315 + s_295_315 <=s (const 64 (2**20)),
    (const 64 0) - r_295_315 - s_295_315 <=s (const 64 (2**20)),
    u_295_315 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_295_315 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_295_315 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_295_315 = (const 64 0) (mod (const 64 (2**(20-20))))
}

