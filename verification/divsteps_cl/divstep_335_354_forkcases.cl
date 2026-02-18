proc divstep_335_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_1,
sint64 neg_g_295_low60_40_low20_1,
sint64 u_335_335,
sint64 v_335_335,
sint64 r_335_335,
sint64 s_335_335,
sint64 u_335_336,
sint64 v_335_336,
sint64 r_335_336,
sint64 s_335_336,
bit ne
)={
    u_335_335 * neg_f_295_low60_40_low20_0 + v_335_335 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_0 * (-(2**20)),
    r_335_335 * neg_f_295_low60_40_low20_0 + s_335_335 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_0 * (-(2**20))
&&
    u_335_335 * neg_f_295_low60_40_low20_0 + v_335_335 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_0 * (const 64 (-(2**20))),
    r_335_335 * neg_f_295_low60_40_low20_0 + s_335_335 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_0 + u_335_335 * (const 64 (2**21)) + v_335_335 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_0 + r_335_335 * (const 64 (2**21)) + s_335_335 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 335)) <=s delta, delta <=s (const 64 (1 + 2*335)),
    u_335_335 = (const 64 (-(2**20))),
    v_335_335 = (const 64 (0)),
    r_335_335 = (const 64 (0)),
    s_335_335 = (const 64 (-(2**20)))
}



// divsteps
// step335

// premise a
assume
neg_g_295_low60_40_low20_0 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_295_low60_40_low20_1 neg_f_295_low60_40_low20_0;
mov u_335_336 u_335_335;
mov v_335_336 v_335_335;

asr neg_g_295_low60_40_low20_1 neg_g_295_low60_40_low20_0 1;
asr r_335_336 r_335_335 1;
asr s_335_336 s_335_335 1;
assert
    true
&&
    neg_f_295_low60_40_low20_1 = neg_f_295_low60_40_low20_0,
    u_335_336 = u_335_335,
    v_335_336 = v_335_335,
    neg_g_295_low60_40_low20_1 * (const 64 2) = neg_g_295_low60_40_low20_0,
    r_335_336 * (const 64 2) = r_335_335,
    s_335_336 * (const 64 2) = s_335_335
;

assume
    neg_f_295_low60_40_low20_1 = neg_f_295_low60_40_low20_0,
    u_335_336 = u_335_335,
    v_335_336 = v_335_335,
    neg_g_295_low60_40_low20_1 * 2 = neg_g_295_low60_40_low20_0,
    r_335_336 * 2 = r_335_335,
    s_335_336 * 2 = s_335_335
&&
    true
;

{
    u_335_336 * neg_f_295_low60_40_low20_0 + v_335_336 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_336 * neg_f_295_low60_40_low20_0 + s_335_336 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_1 + u_335_336 * (const 64 (2**21)) + v_335_336 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_1 + r_335_336 * (const 64 (2**21)) + s_335_336 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_1,
    neg_f_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_1,
    neg_g_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 336)) <=s delta, delta <=s (const 64 (1 + 2*336)),
    (const 64 (-(2**20))) <=s u_335_336, u_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_336, v_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_336, r_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_336, s_335_336 <=s (const 64 ((2**20)-1)),
    u_335_336 + v_335_336 <=s (const 64 (2**20)),
    u_335_336 - v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 + v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 - v_335_336 <=s (const 64 (2**20)),
    r_335_336 + s_335_336 <=s (const 64 (2**20)),
    r_335_336 - s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 + s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 - s_335_336 <=s (const 64 (2**20)),
    u_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_335_336 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_335_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_1,
sint64 neg_g_295_low60_40_low20_1,
sint64 u_335_335,
sint64 v_335_335,
sint64 r_335_335,
sint64 s_335_335,
sint64 u_335_336,
sint64 v_335_336,
sint64 r_335_336,
sint64 s_335_336,
bit ne
)={
    u_335_335 * neg_f_295_low60_40_low20_0 + v_335_335 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_0 * (-(2**20)),
    r_335_335 * neg_f_295_low60_40_low20_0 + s_335_335 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_0 * (-(2**20))
&&
    u_335_335 * neg_f_295_low60_40_low20_0 + v_335_335 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_0 * (const 64 (-(2**20))),
    r_335_335 * neg_f_295_low60_40_low20_0 + s_335_335 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_0 + u_335_335 * (const 64 (2**21)) + v_335_335 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_0 + r_335_335 * (const 64 (2**21)) + s_335_335 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 335)) <=s delta, delta <=s (const 64 (1 + 2*335)),
    u_335_335 = (const 64 (-(2**20))),
    v_335_335 = (const 64 (0)),
    r_335_335 = (const 64 (0)),
    s_335_335 = (const 64 (-(2**20)))
}



// divsteps
// step335

// premise b
assume
neg_g_295_low60_40_low20_0 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_1 neg_f_295_low60_40_low20_0;
mov u_335_336 u_335_335;
mov v_335_336 v_335_335;

add neg_g_295_low60_40_low20_1 neg_g_295_low60_40_low20_0 neg_f_295_low60_40_low20_0;
asr neg_g_295_low60_40_low20_1 neg_g_295_low60_40_low20_1 1;
add r_335_336 r_335_335 u_335_335;
asr r_335_336 r_335_336 1;
add s_335_336 s_335_335 v_335_335;
asr s_335_336 s_335_336 1;
assert
    true
&&
    neg_f_295_low60_40_low20_1 = neg_f_295_low60_40_low20_0,
    u_335_336 = u_335_335,
    v_335_336 = v_335_335,
    neg_g_295_low60_40_low20_1 * (const 64 2) = neg_g_295_low60_40_low20_0 + neg_f_295_low60_40_low20_0,
    r_335_336 * (const 64 2) = r_335_335 + u_335_335,
    s_335_336 * (const 64 2) = s_335_335 + v_335_335
;

assume
    neg_f_295_low60_40_low20_1 = neg_f_295_low60_40_low20_0,
    u_335_336 = u_335_335,
    v_335_336 = v_335_335,
    neg_g_295_low60_40_low20_1 * 2 = neg_g_295_low60_40_low20_0 + neg_f_295_low60_40_low20_0,
    r_335_336 * 2 = r_335_335 + u_335_335,
    s_335_336 * 2 = s_335_335 + v_335_335
&&
    true
;

{
    u_335_336 * neg_f_295_low60_40_low20_0 + v_335_336 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_336 * neg_f_295_low60_40_low20_0 + s_335_336 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_1 + u_335_336 * (const 64 (2**21)) + v_335_336 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_1 + r_335_336 * (const 64 (2**21)) + s_335_336 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_1,
    neg_f_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_1,
    neg_g_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 336)) <=s delta, delta <=s (const 64 (1 + 2*336)),
    (const 64 (-(2**20))) <=s u_335_336, u_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_336, v_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_336, r_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_336, s_335_336 <=s (const 64 ((2**20)-1)),
    u_335_336 + v_335_336 <=s (const 64 (2**20)),
    u_335_336 - v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 + v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 - v_335_336 <=s (const 64 (2**20)),
    r_335_336 + s_335_336 <=s (const 64 (2**20)),
    r_335_336 - s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 + s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 - s_335_336 <=s (const 64 (2**20)),
    u_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_335_336 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_335_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_1,
sint64 neg_g_295_low60_40_low20_1,
sint64 u_335_335,
sint64 v_335_335,
sint64 r_335_335,
sint64 s_335_335,
sint64 u_335_336,
sint64 v_335_336,
sint64 r_335_336,
sint64 s_335_336,
bit ne
)={
    u_335_335 * neg_f_295_low60_40_low20_0 + v_335_335 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_0 * (-(2**20)),
    r_335_335 * neg_f_295_low60_40_low20_0 + s_335_335 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_0 * (-(2**20))
&&
    u_335_335 * neg_f_295_low60_40_low20_0 + v_335_335 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_0 * (const 64 (-(2**20))),
    r_335_335 * neg_f_295_low60_40_low20_0 + s_335_335 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_0 + u_335_335 * (const 64 (2**21)) + v_335_335 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_0 + r_335_335 * (const 64 (2**21)) + s_335_335 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 335)) <=s delta, delta <=s (const 64 (1 + 2*335)),
    u_335_335 = (const 64 (-(2**20))),
    v_335_335 = (const 64 (0)),
    r_335_335 = (const 64 (0)),
    s_335_335 = (const 64 (-(2**20)))
}



// divsteps
// step335

// premise c
assume
neg_g_295_low60_40_low20_0 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_1 neg_g_295_low60_40_low20_0;
mov u_335_336 r_335_335;
mov v_335_336 s_335_335;

subs dc neg_g_295_low60_40_low20_1 neg_g_295_low60_40_low20_0 neg_f_295_low60_40_low20_0;
asr neg_g_295_low60_40_low20_1 neg_g_295_low60_40_low20_1 1;
subs dc r_335_336 r_335_335 u_335_335;
asr r_335_336 r_335_336 1;
subs dc s_335_336 s_335_335 v_335_335;
asr s_335_336 s_335_336 1;
assert
    true
&&
    neg_f_295_low60_40_low20_1 = neg_g_295_low60_40_low20_0,
    u_335_336 = r_335_335,
    v_335_336 = s_335_335,
    neg_g_295_low60_40_low20_1 * (const 64 2) = neg_g_295_low60_40_low20_0 - neg_f_295_low60_40_low20_0,
    r_335_336 * (const 64 2) = r_335_335 - u_335_335,
    s_335_336 * (const 64 2) = s_335_335 - v_335_335
;

assume
    neg_f_295_low60_40_low20_1 = neg_g_295_low60_40_low20_0,
    u_335_336 = r_335_335,
    v_335_336 = s_335_335,
    neg_g_295_low60_40_low20_1 * 2 = neg_g_295_low60_40_low20_0 - neg_f_295_low60_40_low20_0,
    r_335_336 * 2 = r_335_335 - u_335_335,
    s_335_336 * 2 = s_335_335 - v_335_335
&&
    true
;

{
    u_335_336 * neg_f_295_low60_40_low20_0 + v_335_336 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_336 * neg_f_295_low60_40_low20_0 + s_335_336 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_1 + u_335_336 * (const 64 (2**21)) + v_335_336 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_1 + r_335_336 * (const 64 (2**21)) + s_335_336 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_1,
    neg_f_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_1,
    neg_g_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 336)) <=s delta, delta <=s (const 64 (1 + 2*336)),
    (const 64 (-(2**20))) <=s u_335_336, u_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_336, v_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_336, r_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_336, s_335_336 <=s (const 64 ((2**20)-1)),
    u_335_336 + v_335_336 <=s (const 64 (2**20)),
    u_335_336 - v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 + v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 - v_335_336 <=s (const 64 (2**20)),
    r_335_336 + s_335_336 <=s (const 64 (2**20)),
    r_335_336 - s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 + s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 - s_335_336 <=s (const 64 (2**20)),
    u_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_335_336 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_336_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_1,
sint64 neg_g_295_low60_40_low20_1,
sint64 neg_f_295_low60_40_low20_2,
sint64 neg_g_295_low60_40_low20_2,
sint64 u_335_336,
sint64 v_335_336,
sint64 r_335_336,
sint64 s_335_336,
sint64 u_335_337,
sint64 v_335_337,
sint64 r_335_337,
sint64 s_335_337,
bit ne
)={
    u_335_336 * neg_f_295_low60_40_low20_0 + v_335_336 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_1 * (-(2**20)),
    r_335_336 * neg_f_295_low60_40_low20_0 + s_335_336 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_1 * (-(2**20))
&&
    u_335_336 * neg_f_295_low60_40_low20_0 + v_335_336 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_1 * (const 64 (-(2**20))),
    r_335_336 * neg_f_295_low60_40_low20_0 + s_335_336 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_1 + u_335_336 * (const 64 (2**21)) + v_335_336 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_1 + r_335_336 * (const 64 (2**21)) + s_335_336 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_1,
    neg_f_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_1,
    neg_g_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 336)) <=s delta, delta <=s (const 64 (1 + 2*336)),
    (const 64 (-(2**20))) <=s u_335_336, u_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_336, v_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_336, r_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_336, s_335_336 <=s (const 64 ((2**20)-1)),
    u_335_336 + v_335_336 <=s (const 64 (2**20)),
    u_335_336 - v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 + v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 - v_335_336 <=s (const 64 (2**20)),
    r_335_336 + s_335_336 <=s (const 64 (2**20)),
    r_335_336 - s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 + s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 - s_335_336 <=s (const 64 (2**20)),
    u_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_335_336 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step336

// premise a
assume
neg_g_295_low60_40_low20_1 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_2 neg_f_295_low60_40_low20_1;
mov u_335_337 u_335_336;
mov v_335_337 v_335_336;

asr neg_g_295_low60_40_low20_2 neg_g_295_low60_40_low20_1 1;
asr r_335_337 r_335_336 1;
asr s_335_337 s_335_336 1;
assert
    true
&&
    neg_f_295_low60_40_low20_2 = neg_f_295_low60_40_low20_1,
    u_335_337 = u_335_336,
    v_335_337 = v_335_336,
    neg_g_295_low60_40_low20_2 * (const 64 2) = neg_g_295_low60_40_low20_1,
    r_335_337 * (const 64 2) = r_335_336,
    s_335_337 * (const 64 2) = s_335_336
;

assume
    neg_f_295_low60_40_low20_2 = neg_f_295_low60_40_low20_1,
    u_335_337 = u_335_336,
    v_335_337 = v_335_336,
    neg_g_295_low60_40_low20_2 * 2 = neg_g_295_low60_40_low20_1,
    r_335_337 * 2 = r_335_336,
    s_335_337 * 2 = s_335_336
&&
    true
;

{
    u_335_337 * neg_f_295_low60_40_low20_0 + v_335_337 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_337 * neg_f_295_low60_40_low20_0 + s_335_337 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_2 + u_335_337 * (const 64 (2**21)) + v_335_337 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_2 + r_335_337 * (const 64 (2**21)) + s_335_337 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_2,
    neg_f_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_2,
    neg_g_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 337)) <=s delta, delta <=s (const 64 (1 + 2*337)),
    (const 64 (-(2**20))) <=s u_335_337, u_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_337, v_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_337, r_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_337, s_335_337 <=s (const 64 ((2**20)-1)),
    u_335_337 + v_335_337 <=s (const 64 (2**20)),
    u_335_337 - v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 + v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 - v_335_337 <=s (const 64 (2**20)),
    r_335_337 + s_335_337 <=s (const 64 (2**20)),
    r_335_337 - s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 + s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 - s_335_337 <=s (const 64 (2**20)),
    u_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_335_337 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_336_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_1,
sint64 neg_g_295_low60_40_low20_1,
sint64 neg_f_295_low60_40_low20_2,
sint64 neg_g_295_low60_40_low20_2,
sint64 u_335_336,
sint64 v_335_336,
sint64 r_335_336,
sint64 s_335_336,
sint64 u_335_337,
sint64 v_335_337,
sint64 r_335_337,
sint64 s_335_337,
bit ne
)={
    u_335_336 * neg_f_295_low60_40_low20_0 + v_335_336 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_1 * (-(2**20)),
    r_335_336 * neg_f_295_low60_40_low20_0 + s_335_336 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_1 * (-(2**20))
&&
    u_335_336 * neg_f_295_low60_40_low20_0 + v_335_336 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_1 * (const 64 (-(2**20))),
    r_335_336 * neg_f_295_low60_40_low20_0 + s_335_336 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_1 + u_335_336 * (const 64 (2**21)) + v_335_336 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_1 + r_335_336 * (const 64 (2**21)) + s_335_336 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_1,
    neg_f_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_1,
    neg_g_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 336)) <=s delta, delta <=s (const 64 (1 + 2*336)),
    (const 64 (-(2**20))) <=s u_335_336, u_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_336, v_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_336, r_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_336, s_335_336 <=s (const 64 ((2**20)-1)),
    u_335_336 + v_335_336 <=s (const 64 (2**20)),
    u_335_336 - v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 + v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 - v_335_336 <=s (const 64 (2**20)),
    r_335_336 + s_335_336 <=s (const 64 (2**20)),
    r_335_336 - s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 + s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 - s_335_336 <=s (const 64 (2**20)),
    u_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_335_336 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step336

// premise b
assume
neg_g_295_low60_40_low20_1 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_2 neg_f_295_low60_40_low20_1;
mov u_335_337 u_335_336;
mov v_335_337 v_335_336;

add neg_g_295_low60_40_low20_2 neg_g_295_low60_40_low20_1 neg_f_295_low60_40_low20_1;
asr neg_g_295_low60_40_low20_2 neg_g_295_low60_40_low20_2 1;
add r_335_337 r_335_336 u_335_336;
asr r_335_337 r_335_337 1;
add s_335_337 s_335_336 v_335_336;
asr s_335_337 s_335_337 1;
assert
    true
&&
    neg_f_295_low60_40_low20_2 = neg_f_295_low60_40_low20_1,
    u_335_337 = u_335_336,
    v_335_337 = v_335_336,
    neg_g_295_low60_40_low20_2 * (const 64 2) = neg_g_295_low60_40_low20_1 + neg_f_295_low60_40_low20_1,
    r_335_337 * (const 64 2) = r_335_336 + u_335_336,
    s_335_337 * (const 64 2) = s_335_336 + v_335_336
;

assume
    neg_f_295_low60_40_low20_2 = neg_f_295_low60_40_low20_1,
    u_335_337 = u_335_336,
    v_335_337 = v_335_336,
    neg_g_295_low60_40_low20_2 * 2 = neg_g_295_low60_40_low20_1 + neg_f_295_low60_40_low20_1,
    r_335_337 * 2 = r_335_336 + u_335_336,
    s_335_337 * 2 = s_335_336 + v_335_336
&&
    true
;

{
    u_335_337 * neg_f_295_low60_40_low20_0 + v_335_337 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_337 * neg_f_295_low60_40_low20_0 + s_335_337 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_2 + u_335_337 * (const 64 (2**21)) + v_335_337 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_2 + r_335_337 * (const 64 (2**21)) + s_335_337 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_2,
    neg_f_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_2,
    neg_g_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 337)) <=s delta, delta <=s (const 64 (1 + 2*337)),
    (const 64 (-(2**20))) <=s u_335_337, u_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_337, v_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_337, r_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_337, s_335_337 <=s (const 64 ((2**20)-1)),
    u_335_337 + v_335_337 <=s (const 64 (2**20)),
    u_335_337 - v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 + v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 - v_335_337 <=s (const 64 (2**20)),
    r_335_337 + s_335_337 <=s (const 64 (2**20)),
    r_335_337 - s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 + s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 - s_335_337 <=s (const 64 (2**20)),
    u_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_335_337 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_336_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_1,
sint64 neg_g_295_low60_40_low20_1,
sint64 neg_f_295_low60_40_low20_2,
sint64 neg_g_295_low60_40_low20_2,
sint64 u_335_336,
sint64 v_335_336,
sint64 r_335_336,
sint64 s_335_336,
sint64 u_335_337,
sint64 v_335_337,
sint64 r_335_337,
sint64 s_335_337,
bit ne
)={
    u_335_336 * neg_f_295_low60_40_low20_0 + v_335_336 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_1 * (-(2**20)),
    r_335_336 * neg_f_295_low60_40_low20_0 + s_335_336 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_1 * (-(2**20))
&&
    u_335_336 * neg_f_295_low60_40_low20_0 + v_335_336 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_1 * (const 64 (-(2**20))),
    r_335_336 * neg_f_295_low60_40_low20_0 + s_335_336 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_1 + u_335_336 * (const 64 (2**21)) + v_335_336 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_1 + r_335_336 * (const 64 (2**21)) + s_335_336 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_1,
    neg_f_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_1,
    neg_g_295_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 336)) <=s delta, delta <=s (const 64 (1 + 2*336)),
    (const 64 (-(2**20))) <=s u_335_336, u_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_336, v_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_336, r_335_336 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_336, s_335_336 <=s (const 64 ((2**20)-1)),
    u_335_336 + v_335_336 <=s (const 64 (2**20)),
    u_335_336 - v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 + v_335_336 <=s (const 64 (2**20)),
    (const 64 0) - u_335_336 - v_335_336 <=s (const 64 (2**20)),
    r_335_336 + s_335_336 <=s (const 64 (2**20)),
    r_335_336 - s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 + s_335_336 <=s (const 64 (2**20)),
    (const 64 0) - r_335_336 - s_335_336 <=s (const 64 (2**20)),
    u_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_335_336 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_335_336 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step336

// premise c
assume
neg_g_295_low60_40_low20_1 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_2 neg_g_295_low60_40_low20_1;
mov u_335_337 r_335_336;
mov v_335_337 s_335_336;

subs dc neg_g_295_low60_40_low20_2 neg_g_295_low60_40_low20_1 neg_f_295_low60_40_low20_1;
asr neg_g_295_low60_40_low20_2 neg_g_295_low60_40_low20_2 1;
subs dc r_335_337 r_335_336 u_335_336;
asr r_335_337 r_335_337 1;
subs dc s_335_337 s_335_336 v_335_336;
asr s_335_337 s_335_337 1;
assert
    true
&&
    neg_f_295_low60_40_low20_2 = neg_g_295_low60_40_low20_1,
    u_335_337 = r_335_336,
    v_335_337 = s_335_336,
    neg_g_295_low60_40_low20_2 * (const 64 2) = neg_g_295_low60_40_low20_1 - neg_f_295_low60_40_low20_1,
    r_335_337 * (const 64 2) = r_335_336 - u_335_336,
    s_335_337 * (const 64 2) = s_335_336 - v_335_336
;

assume
    neg_f_295_low60_40_low20_2 = neg_g_295_low60_40_low20_1,
    u_335_337 = r_335_336,
    v_335_337 = s_335_336,
    neg_g_295_low60_40_low20_2 * 2 = neg_g_295_low60_40_low20_1 - neg_f_295_low60_40_low20_1,
    r_335_337 * 2 = r_335_336 - u_335_336,
    s_335_337 * 2 = s_335_336 - v_335_336
&&
    true
;

{
    u_335_337 * neg_f_295_low60_40_low20_0 + v_335_337 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_337 * neg_f_295_low60_40_low20_0 + s_335_337 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_2 + u_335_337 * (const 64 (2**21)) + v_335_337 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_2 + r_335_337 * (const 64 (2**21)) + s_335_337 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_2,
    neg_f_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_2,
    neg_g_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 337)) <=s delta, delta <=s (const 64 (1 + 2*337)),
    (const 64 (-(2**20))) <=s u_335_337, u_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_337, v_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_337, r_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_337, s_335_337 <=s (const 64 ((2**20)-1)),
    u_335_337 + v_335_337 <=s (const 64 (2**20)),
    u_335_337 - v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 + v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 - v_335_337 <=s (const 64 (2**20)),
    r_335_337 + s_335_337 <=s (const 64 (2**20)),
    r_335_337 - s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 + s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 - s_335_337 <=s (const 64 (2**20)),
    u_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_335_337 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_337_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_2,
sint64 neg_g_295_low60_40_low20_2,
sint64 neg_f_295_low60_40_low20_3,
sint64 neg_g_295_low60_40_low20_3,
sint64 u_335_337,
sint64 v_335_337,
sint64 r_335_337,
sint64 s_335_337,
sint64 u_335_338,
sint64 v_335_338,
sint64 r_335_338,
sint64 s_335_338,
bit ne
)={
    u_335_337 * neg_f_295_low60_40_low20_0 + v_335_337 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_2 * (-(2**20)),
    r_335_337 * neg_f_295_low60_40_low20_0 + s_335_337 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_2 * (-(2**20))
&&
    u_335_337 * neg_f_295_low60_40_low20_0 + v_335_337 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_2 * (const 64 (-(2**20))),
    r_335_337 * neg_f_295_low60_40_low20_0 + s_335_337 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_2 + u_335_337 * (const 64 (2**21)) + v_335_337 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_2 + r_335_337 * (const 64 (2**21)) + s_335_337 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_2,
    neg_f_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_2,
    neg_g_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 337)) <=s delta, delta <=s (const 64 (1 + 2*337)),
    (const 64 (-(2**20))) <=s u_335_337, u_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_337, v_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_337, r_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_337, s_335_337 <=s (const 64 ((2**20)-1)),
    u_335_337 + v_335_337 <=s (const 64 (2**20)),
    u_335_337 - v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 + v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 - v_335_337 <=s (const 64 (2**20)),
    r_335_337 + s_335_337 <=s (const 64 (2**20)),
    r_335_337 - s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 + s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 - s_335_337 <=s (const 64 (2**20)),
    u_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_335_337 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step337

// premise a
assume
neg_g_295_low60_40_low20_2 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_3 neg_f_295_low60_40_low20_2;
mov u_335_338 u_335_337;
mov v_335_338 v_335_337;

asr neg_g_295_low60_40_low20_3 neg_g_295_low60_40_low20_2 1;
asr r_335_338 r_335_337 1;
asr s_335_338 s_335_337 1;
assert
    true
&&
    neg_f_295_low60_40_low20_3 = neg_f_295_low60_40_low20_2,
    u_335_338 = u_335_337,
    v_335_338 = v_335_337,
    neg_g_295_low60_40_low20_3 * (const 64 2) = neg_g_295_low60_40_low20_2,
    r_335_338 * (const 64 2) = r_335_337,
    s_335_338 * (const 64 2) = s_335_337
;

assume
    neg_f_295_low60_40_low20_3 = neg_f_295_low60_40_low20_2,
    u_335_338 = u_335_337,
    v_335_338 = v_335_337,
    neg_g_295_low60_40_low20_3 * 2 = neg_g_295_low60_40_low20_2,
    r_335_338 * 2 = r_335_337,
    s_335_338 * 2 = s_335_337
&&
    true
;

{
    u_335_338 * neg_f_295_low60_40_low20_0 + v_335_338 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_338 * neg_f_295_low60_40_low20_0 + s_335_338 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_3 + u_335_338 * (const 64 (2**21)) + v_335_338 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_3 + r_335_338 * (const 64 (2**21)) + s_335_338 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_3,
    neg_f_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_3,
    neg_g_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 338)) <=s delta, delta <=s (const 64 (1 + 2*338)),
    (const 64 (-(2**20))) <=s u_335_338, u_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_338, v_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_338, r_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_338, s_335_338 <=s (const 64 ((2**20)-1)),
    u_335_338 + v_335_338 <=s (const 64 (2**20)),
    u_335_338 - v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 + v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 - v_335_338 <=s (const 64 (2**20)),
    r_335_338 + s_335_338 <=s (const 64 (2**20)),
    r_335_338 - s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 + s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 - s_335_338 <=s (const 64 (2**20)),
    u_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_335_338 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_337_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_2,
sint64 neg_g_295_low60_40_low20_2,
sint64 neg_f_295_low60_40_low20_3,
sint64 neg_g_295_low60_40_low20_3,
sint64 u_335_337,
sint64 v_335_337,
sint64 r_335_337,
sint64 s_335_337,
sint64 u_335_338,
sint64 v_335_338,
sint64 r_335_338,
sint64 s_335_338,
bit ne
)={
    u_335_337 * neg_f_295_low60_40_low20_0 + v_335_337 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_2 * (-(2**20)),
    r_335_337 * neg_f_295_low60_40_low20_0 + s_335_337 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_2 * (-(2**20))
&&
    u_335_337 * neg_f_295_low60_40_low20_0 + v_335_337 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_2 * (const 64 (-(2**20))),
    r_335_337 * neg_f_295_low60_40_low20_0 + s_335_337 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_2 + u_335_337 * (const 64 (2**21)) + v_335_337 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_2 + r_335_337 * (const 64 (2**21)) + s_335_337 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_2,
    neg_f_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_2,
    neg_g_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 337)) <=s delta, delta <=s (const 64 (1 + 2*337)),
    (const 64 (-(2**20))) <=s u_335_337, u_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_337, v_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_337, r_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_337, s_335_337 <=s (const 64 ((2**20)-1)),
    u_335_337 + v_335_337 <=s (const 64 (2**20)),
    u_335_337 - v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 + v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 - v_335_337 <=s (const 64 (2**20)),
    r_335_337 + s_335_337 <=s (const 64 (2**20)),
    r_335_337 - s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 + s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 - s_335_337 <=s (const 64 (2**20)),
    u_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_335_337 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step337

// premise b
assume
neg_g_295_low60_40_low20_2 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_3 neg_f_295_low60_40_low20_2;
mov u_335_338 u_335_337;
mov v_335_338 v_335_337;

add neg_g_295_low60_40_low20_3 neg_g_295_low60_40_low20_2 neg_f_295_low60_40_low20_2;
asr neg_g_295_low60_40_low20_3 neg_g_295_low60_40_low20_3 1;
add r_335_338 r_335_337 u_335_337;
asr r_335_338 r_335_338 1;
add s_335_338 s_335_337 v_335_337;
asr s_335_338 s_335_338 1;
assert
    true
&&
    neg_f_295_low60_40_low20_3 = neg_f_295_low60_40_low20_2,
    u_335_338 = u_335_337,
    v_335_338 = v_335_337,
    neg_g_295_low60_40_low20_3 * (const 64 2) = neg_g_295_low60_40_low20_2 + neg_f_295_low60_40_low20_2,
    r_335_338 * (const 64 2) = r_335_337 + u_335_337,
    s_335_338 * (const 64 2) = s_335_337 + v_335_337
;

assume
    neg_f_295_low60_40_low20_3 = neg_f_295_low60_40_low20_2,
    u_335_338 = u_335_337,
    v_335_338 = v_335_337,
    neg_g_295_low60_40_low20_3 * 2 = neg_g_295_low60_40_low20_2 + neg_f_295_low60_40_low20_2,
    r_335_338 * 2 = r_335_337 + u_335_337,
    s_335_338 * 2 = s_335_337 + v_335_337
&&
    true
;

{
    u_335_338 * neg_f_295_low60_40_low20_0 + v_335_338 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_338 * neg_f_295_low60_40_low20_0 + s_335_338 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_3 + u_335_338 * (const 64 (2**21)) + v_335_338 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_3 + r_335_338 * (const 64 (2**21)) + s_335_338 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_3,
    neg_f_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_3,
    neg_g_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 338)) <=s delta, delta <=s (const 64 (1 + 2*338)),
    (const 64 (-(2**20))) <=s u_335_338, u_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_338, v_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_338, r_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_338, s_335_338 <=s (const 64 ((2**20)-1)),
    u_335_338 + v_335_338 <=s (const 64 (2**20)),
    u_335_338 - v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 + v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 - v_335_338 <=s (const 64 (2**20)),
    r_335_338 + s_335_338 <=s (const 64 (2**20)),
    r_335_338 - s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 + s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 - s_335_338 <=s (const 64 (2**20)),
    u_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_335_338 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_337_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_2,
sint64 neg_g_295_low60_40_low20_2,
sint64 neg_f_295_low60_40_low20_3,
sint64 neg_g_295_low60_40_low20_3,
sint64 u_335_337,
sint64 v_335_337,
sint64 r_335_337,
sint64 s_335_337,
sint64 u_335_338,
sint64 v_335_338,
sint64 r_335_338,
sint64 s_335_338,
bit ne
)={
    u_335_337 * neg_f_295_low60_40_low20_0 + v_335_337 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_2 * (-(2**20)),
    r_335_337 * neg_f_295_low60_40_low20_0 + s_335_337 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_2 * (-(2**20))
&&
    u_335_337 * neg_f_295_low60_40_low20_0 + v_335_337 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_2 * (const 64 (-(2**20))),
    r_335_337 * neg_f_295_low60_40_low20_0 + s_335_337 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_2 + u_335_337 * (const 64 (2**21)) + v_335_337 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_2 + r_335_337 * (const 64 (2**21)) + s_335_337 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_2,
    neg_f_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_2,
    neg_g_295_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 337)) <=s delta, delta <=s (const 64 (1 + 2*337)),
    (const 64 (-(2**20))) <=s u_335_337, u_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_337, v_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_337, r_335_337 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_337, s_335_337 <=s (const 64 ((2**20)-1)),
    u_335_337 + v_335_337 <=s (const 64 (2**20)),
    u_335_337 - v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 + v_335_337 <=s (const 64 (2**20)),
    (const 64 0) - u_335_337 - v_335_337 <=s (const 64 (2**20)),
    r_335_337 + s_335_337 <=s (const 64 (2**20)),
    r_335_337 - s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 + s_335_337 <=s (const 64 (2**20)),
    (const 64 0) - r_335_337 - s_335_337 <=s (const 64 (2**20)),
    u_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_335_337 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_335_337 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step337

// premise c
assume
neg_g_295_low60_40_low20_2 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_3 neg_g_295_low60_40_low20_2;
mov u_335_338 r_335_337;
mov v_335_338 s_335_337;

subs dc neg_g_295_low60_40_low20_3 neg_g_295_low60_40_low20_2 neg_f_295_low60_40_low20_2;
asr neg_g_295_low60_40_low20_3 neg_g_295_low60_40_low20_3 1;
subs dc r_335_338 r_335_337 u_335_337;
asr r_335_338 r_335_338 1;
subs dc s_335_338 s_335_337 v_335_337;
asr s_335_338 s_335_338 1;
assert
    true
&&
    neg_f_295_low60_40_low20_3 = neg_g_295_low60_40_low20_2,
    u_335_338 = r_335_337,
    v_335_338 = s_335_337,
    neg_g_295_low60_40_low20_3 * (const 64 2) = neg_g_295_low60_40_low20_2 - neg_f_295_low60_40_low20_2,
    r_335_338 * (const 64 2) = r_335_337 - u_335_337,
    s_335_338 * (const 64 2) = s_335_337 - v_335_337
;

assume
    neg_f_295_low60_40_low20_3 = neg_g_295_low60_40_low20_2,
    u_335_338 = r_335_337,
    v_335_338 = s_335_337,
    neg_g_295_low60_40_low20_3 * 2 = neg_g_295_low60_40_low20_2 - neg_f_295_low60_40_low20_2,
    r_335_338 * 2 = r_335_337 - u_335_337,
    s_335_338 * 2 = s_335_337 - v_335_337
&&
    true
;

{
    u_335_338 * neg_f_295_low60_40_low20_0 + v_335_338 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_338 * neg_f_295_low60_40_low20_0 + s_335_338 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_3 + u_335_338 * (const 64 (2**21)) + v_335_338 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_3 + r_335_338 * (const 64 (2**21)) + s_335_338 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_3,
    neg_f_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_3,
    neg_g_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 338)) <=s delta, delta <=s (const 64 (1 + 2*338)),
    (const 64 (-(2**20))) <=s u_335_338, u_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_338, v_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_338, r_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_338, s_335_338 <=s (const 64 ((2**20)-1)),
    u_335_338 + v_335_338 <=s (const 64 (2**20)),
    u_335_338 - v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 + v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 - v_335_338 <=s (const 64 (2**20)),
    r_335_338 + s_335_338 <=s (const 64 (2**20)),
    r_335_338 - s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 + s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 - s_335_338 <=s (const 64 (2**20)),
    u_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_335_338 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_338_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_3,
sint64 neg_g_295_low60_40_low20_3,
sint64 neg_f_295_low60_40_low20_4,
sint64 neg_g_295_low60_40_low20_4,
sint64 u_335_338,
sint64 v_335_338,
sint64 r_335_338,
sint64 s_335_338,
sint64 u_335_339,
sint64 v_335_339,
sint64 r_335_339,
sint64 s_335_339,
bit ne
)={
    u_335_338 * neg_f_295_low60_40_low20_0 + v_335_338 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_3 * (-(2**20)),
    r_335_338 * neg_f_295_low60_40_low20_0 + s_335_338 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_3 * (-(2**20))
&&
    u_335_338 * neg_f_295_low60_40_low20_0 + v_335_338 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_3 * (const 64 (-(2**20))),
    r_335_338 * neg_f_295_low60_40_low20_0 + s_335_338 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_3 + u_335_338 * (const 64 (2**21)) + v_335_338 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_3 + r_335_338 * (const 64 (2**21)) + s_335_338 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_3,
    neg_f_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_3,
    neg_g_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 338)) <=s delta, delta <=s (const 64 (1 + 2*338)),
    (const 64 (-(2**20))) <=s u_335_338, u_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_338, v_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_338, r_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_338, s_335_338 <=s (const 64 ((2**20)-1)),
    u_335_338 + v_335_338 <=s (const 64 (2**20)),
    u_335_338 - v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 + v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 - v_335_338 <=s (const 64 (2**20)),
    r_335_338 + s_335_338 <=s (const 64 (2**20)),
    r_335_338 - s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 + s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 - s_335_338 <=s (const 64 (2**20)),
    u_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_335_338 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step338

// premise a
assume
neg_g_295_low60_40_low20_3 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_4 neg_f_295_low60_40_low20_3;
mov u_335_339 u_335_338;
mov v_335_339 v_335_338;

asr neg_g_295_low60_40_low20_4 neg_g_295_low60_40_low20_3 1;
asr r_335_339 r_335_338 1;
asr s_335_339 s_335_338 1;
assert
    true
&&
    neg_f_295_low60_40_low20_4 = neg_f_295_low60_40_low20_3,
    u_335_339 = u_335_338,
    v_335_339 = v_335_338,
    neg_g_295_low60_40_low20_4 * (const 64 2) = neg_g_295_low60_40_low20_3,
    r_335_339 * (const 64 2) = r_335_338,
    s_335_339 * (const 64 2) = s_335_338
;

assume
    neg_f_295_low60_40_low20_4 = neg_f_295_low60_40_low20_3,
    u_335_339 = u_335_338,
    v_335_339 = v_335_338,
    neg_g_295_low60_40_low20_4 * 2 = neg_g_295_low60_40_low20_3,
    r_335_339 * 2 = r_335_338,
    s_335_339 * 2 = s_335_338
&&
    true
;

{
    u_335_339 * neg_f_295_low60_40_low20_0 + v_335_339 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_339 * neg_f_295_low60_40_low20_0 + s_335_339 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_4 + u_335_339 * (const 64 (2**21)) + v_335_339 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_4 + r_335_339 * (const 64 (2**21)) + s_335_339 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_4,
    neg_f_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_4,
    neg_g_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 339)) <=s delta, delta <=s (const 64 (1 + 2*339)),
    (const 64 (-(2**20))) <=s u_335_339, u_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_339, v_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_339, r_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_339, s_335_339 <=s (const 64 ((2**20)-1)),
    u_335_339 + v_335_339 <=s (const 64 (2**20)),
    u_335_339 - v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 + v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 - v_335_339 <=s (const 64 (2**20)),
    r_335_339 + s_335_339 <=s (const 64 (2**20)),
    r_335_339 - s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 + s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 - s_335_339 <=s (const 64 (2**20)),
    u_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_335_339 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_338_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_3,
sint64 neg_g_295_low60_40_low20_3,
sint64 neg_f_295_low60_40_low20_4,
sint64 neg_g_295_low60_40_low20_4,
sint64 u_335_338,
sint64 v_335_338,
sint64 r_335_338,
sint64 s_335_338,
sint64 u_335_339,
sint64 v_335_339,
sint64 r_335_339,
sint64 s_335_339,
bit ne
)={
    u_335_338 * neg_f_295_low60_40_low20_0 + v_335_338 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_3 * (-(2**20)),
    r_335_338 * neg_f_295_low60_40_low20_0 + s_335_338 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_3 * (-(2**20))
&&
    u_335_338 * neg_f_295_low60_40_low20_0 + v_335_338 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_3 * (const 64 (-(2**20))),
    r_335_338 * neg_f_295_low60_40_low20_0 + s_335_338 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_3 + u_335_338 * (const 64 (2**21)) + v_335_338 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_3 + r_335_338 * (const 64 (2**21)) + s_335_338 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_3,
    neg_f_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_3,
    neg_g_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 338)) <=s delta, delta <=s (const 64 (1 + 2*338)),
    (const 64 (-(2**20))) <=s u_335_338, u_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_338, v_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_338, r_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_338, s_335_338 <=s (const 64 ((2**20)-1)),
    u_335_338 + v_335_338 <=s (const 64 (2**20)),
    u_335_338 - v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 + v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 - v_335_338 <=s (const 64 (2**20)),
    r_335_338 + s_335_338 <=s (const 64 (2**20)),
    r_335_338 - s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 + s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 - s_335_338 <=s (const 64 (2**20)),
    u_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_335_338 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step338

// premise b
assume
neg_g_295_low60_40_low20_3 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_4 neg_f_295_low60_40_low20_3;
mov u_335_339 u_335_338;
mov v_335_339 v_335_338;

add neg_g_295_low60_40_low20_4 neg_g_295_low60_40_low20_3 neg_f_295_low60_40_low20_3;
asr neg_g_295_low60_40_low20_4 neg_g_295_low60_40_low20_4 1;
add r_335_339 r_335_338 u_335_338;
asr r_335_339 r_335_339 1;
add s_335_339 s_335_338 v_335_338;
asr s_335_339 s_335_339 1;
assert
    true
&&
    neg_f_295_low60_40_low20_4 = neg_f_295_low60_40_low20_3,
    u_335_339 = u_335_338,
    v_335_339 = v_335_338,
    neg_g_295_low60_40_low20_4 * (const 64 2) = neg_g_295_low60_40_low20_3 + neg_f_295_low60_40_low20_3,
    r_335_339 * (const 64 2) = r_335_338 + u_335_338,
    s_335_339 * (const 64 2) = s_335_338 + v_335_338
;

assume
    neg_f_295_low60_40_low20_4 = neg_f_295_low60_40_low20_3,
    u_335_339 = u_335_338,
    v_335_339 = v_335_338,
    neg_g_295_low60_40_low20_4 * 2 = neg_g_295_low60_40_low20_3 + neg_f_295_low60_40_low20_3,
    r_335_339 * 2 = r_335_338 + u_335_338,
    s_335_339 * 2 = s_335_338 + v_335_338
&&
    true
;

{
    u_335_339 * neg_f_295_low60_40_low20_0 + v_335_339 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_339 * neg_f_295_low60_40_low20_0 + s_335_339 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_4 + u_335_339 * (const 64 (2**21)) + v_335_339 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_4 + r_335_339 * (const 64 (2**21)) + s_335_339 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_4,
    neg_f_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_4,
    neg_g_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 339)) <=s delta, delta <=s (const 64 (1 + 2*339)),
    (const 64 (-(2**20))) <=s u_335_339, u_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_339, v_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_339, r_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_339, s_335_339 <=s (const 64 ((2**20)-1)),
    u_335_339 + v_335_339 <=s (const 64 (2**20)),
    u_335_339 - v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 + v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 - v_335_339 <=s (const 64 (2**20)),
    r_335_339 + s_335_339 <=s (const 64 (2**20)),
    r_335_339 - s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 + s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 - s_335_339 <=s (const 64 (2**20)),
    u_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_335_339 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_338_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_3,
sint64 neg_g_295_low60_40_low20_3,
sint64 neg_f_295_low60_40_low20_4,
sint64 neg_g_295_low60_40_low20_4,
sint64 u_335_338,
sint64 v_335_338,
sint64 r_335_338,
sint64 s_335_338,
sint64 u_335_339,
sint64 v_335_339,
sint64 r_335_339,
sint64 s_335_339,
bit ne
)={
    u_335_338 * neg_f_295_low60_40_low20_0 + v_335_338 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_3 * (-(2**20)),
    r_335_338 * neg_f_295_low60_40_low20_0 + s_335_338 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_3 * (-(2**20))
&&
    u_335_338 * neg_f_295_low60_40_low20_0 + v_335_338 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_3 * (const 64 (-(2**20))),
    r_335_338 * neg_f_295_low60_40_low20_0 + s_335_338 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_3 + u_335_338 * (const 64 (2**21)) + v_335_338 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_3 + r_335_338 * (const 64 (2**21)) + s_335_338 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_3,
    neg_f_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_3,
    neg_g_295_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 338)) <=s delta, delta <=s (const 64 (1 + 2*338)),
    (const 64 (-(2**20))) <=s u_335_338, u_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_338, v_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_338, r_335_338 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_338, s_335_338 <=s (const 64 ((2**20)-1)),
    u_335_338 + v_335_338 <=s (const 64 (2**20)),
    u_335_338 - v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 + v_335_338 <=s (const 64 (2**20)),
    (const 64 0) - u_335_338 - v_335_338 <=s (const 64 (2**20)),
    r_335_338 + s_335_338 <=s (const 64 (2**20)),
    r_335_338 - s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 + s_335_338 <=s (const 64 (2**20)),
    (const 64 0) - r_335_338 - s_335_338 <=s (const 64 (2**20)),
    u_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_335_338 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_335_338 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step338

// premise c
assume
neg_g_295_low60_40_low20_3 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_4 neg_g_295_low60_40_low20_3;
mov u_335_339 r_335_338;
mov v_335_339 s_335_338;

subs dc neg_g_295_low60_40_low20_4 neg_g_295_low60_40_low20_3 neg_f_295_low60_40_low20_3;
asr neg_g_295_low60_40_low20_4 neg_g_295_low60_40_low20_4 1;
subs dc r_335_339 r_335_338 u_335_338;
asr r_335_339 r_335_339 1;
subs dc s_335_339 s_335_338 v_335_338;
asr s_335_339 s_335_339 1;
assert
    true
&&
    neg_f_295_low60_40_low20_4 = neg_g_295_low60_40_low20_3,
    u_335_339 = r_335_338,
    v_335_339 = s_335_338,
    neg_g_295_low60_40_low20_4 * (const 64 2) = neg_g_295_low60_40_low20_3 - neg_f_295_low60_40_low20_3,
    r_335_339 * (const 64 2) = r_335_338 - u_335_338,
    s_335_339 * (const 64 2) = s_335_338 - v_335_338
;

assume
    neg_f_295_low60_40_low20_4 = neg_g_295_low60_40_low20_3,
    u_335_339 = r_335_338,
    v_335_339 = s_335_338,
    neg_g_295_low60_40_low20_4 * 2 = neg_g_295_low60_40_low20_3 - neg_f_295_low60_40_low20_3,
    r_335_339 * 2 = r_335_338 - u_335_338,
    s_335_339 * 2 = s_335_338 - v_335_338
&&
    true
;

{
    u_335_339 * neg_f_295_low60_40_low20_0 + v_335_339 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_339 * neg_f_295_low60_40_low20_0 + s_335_339 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_4 + u_335_339 * (const 64 (2**21)) + v_335_339 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_4 + r_335_339 * (const 64 (2**21)) + s_335_339 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_4,
    neg_f_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_4,
    neg_g_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 339)) <=s delta, delta <=s (const 64 (1 + 2*339)),
    (const 64 (-(2**20))) <=s u_335_339, u_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_339, v_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_339, r_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_339, s_335_339 <=s (const 64 ((2**20)-1)),
    u_335_339 + v_335_339 <=s (const 64 (2**20)),
    u_335_339 - v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 + v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 - v_335_339 <=s (const 64 (2**20)),
    r_335_339 + s_335_339 <=s (const 64 (2**20)),
    r_335_339 - s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 + s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 - s_335_339 <=s (const 64 (2**20)),
    u_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_335_339 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_339_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_4,
sint64 neg_g_295_low60_40_low20_4,
sint64 neg_f_295_low60_40_low20_5,
sint64 neg_g_295_low60_40_low20_5,
sint64 u_335_339,
sint64 v_335_339,
sint64 r_335_339,
sint64 s_335_339,
sint64 u_335_340,
sint64 v_335_340,
sint64 r_335_340,
sint64 s_335_340,
bit ne
)={
    u_335_339 * neg_f_295_low60_40_low20_0 + v_335_339 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_4 * (-(2**20)),
    r_335_339 * neg_f_295_low60_40_low20_0 + s_335_339 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_4 * (-(2**20))
&&
    u_335_339 * neg_f_295_low60_40_low20_0 + v_335_339 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_4 * (const 64 (-(2**20))),
    r_335_339 * neg_f_295_low60_40_low20_0 + s_335_339 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_4 + u_335_339 * (const 64 (2**21)) + v_335_339 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_4 + r_335_339 * (const 64 (2**21)) + s_335_339 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_4,
    neg_f_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_4,
    neg_g_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 339)) <=s delta, delta <=s (const 64 (1 + 2*339)),
    (const 64 (-(2**20))) <=s u_335_339, u_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_339, v_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_339, r_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_339, s_335_339 <=s (const 64 ((2**20)-1)),
    u_335_339 + v_335_339 <=s (const 64 (2**20)),
    u_335_339 - v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 + v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 - v_335_339 <=s (const 64 (2**20)),
    r_335_339 + s_335_339 <=s (const 64 (2**20)),
    r_335_339 - s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 + s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 - s_335_339 <=s (const 64 (2**20)),
    u_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_335_339 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step339

// premise a
assume
neg_g_295_low60_40_low20_4 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_5 neg_f_295_low60_40_low20_4;
mov u_335_340 u_335_339;
mov v_335_340 v_335_339;

asr neg_g_295_low60_40_low20_5 neg_g_295_low60_40_low20_4 1;
asr r_335_340 r_335_339 1;
asr s_335_340 s_335_339 1;
assert
    true
&&
    neg_f_295_low60_40_low20_5 = neg_f_295_low60_40_low20_4,
    u_335_340 = u_335_339,
    v_335_340 = v_335_339,
    neg_g_295_low60_40_low20_5 * (const 64 2) = neg_g_295_low60_40_low20_4,
    r_335_340 * (const 64 2) = r_335_339,
    s_335_340 * (const 64 2) = s_335_339
;

assume
    neg_f_295_low60_40_low20_5 = neg_f_295_low60_40_low20_4,
    u_335_340 = u_335_339,
    v_335_340 = v_335_339,
    neg_g_295_low60_40_low20_5 * 2 = neg_g_295_low60_40_low20_4,
    r_335_340 * 2 = r_335_339,
    s_335_340 * 2 = s_335_339
&&
    true
;

{
    u_335_340 * neg_f_295_low60_40_low20_0 + v_335_340 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_340 * neg_f_295_low60_40_low20_0 + s_335_340 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_5 + u_335_340 * (const 64 (2**21)) + v_335_340 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_5 + r_335_340 * (const 64 (2**21)) + s_335_340 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_5,
    neg_f_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_5,
    neg_g_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 340)) <=s delta, delta <=s (const 64 (1 + 2*340)),
    (const 64 (-(2**20))) <=s u_335_340, u_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_340, v_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_340, r_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_340, s_335_340 <=s (const 64 ((2**20)-1)),
    u_335_340 + v_335_340 <=s (const 64 (2**20)),
    u_335_340 - v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 + v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 - v_335_340 <=s (const 64 (2**20)),
    r_335_340 + s_335_340 <=s (const 64 (2**20)),
    r_335_340 - s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 + s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 - s_335_340 <=s (const 64 (2**20)),
    u_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_335_340 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_339_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_4,
sint64 neg_g_295_low60_40_low20_4,
sint64 neg_f_295_low60_40_low20_5,
sint64 neg_g_295_low60_40_low20_5,
sint64 u_335_339,
sint64 v_335_339,
sint64 r_335_339,
sint64 s_335_339,
sint64 u_335_340,
sint64 v_335_340,
sint64 r_335_340,
sint64 s_335_340,
bit ne
)={
    u_335_339 * neg_f_295_low60_40_low20_0 + v_335_339 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_4 * (-(2**20)),
    r_335_339 * neg_f_295_low60_40_low20_0 + s_335_339 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_4 * (-(2**20))
&&
    u_335_339 * neg_f_295_low60_40_low20_0 + v_335_339 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_4 * (const 64 (-(2**20))),
    r_335_339 * neg_f_295_low60_40_low20_0 + s_335_339 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_4 + u_335_339 * (const 64 (2**21)) + v_335_339 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_4 + r_335_339 * (const 64 (2**21)) + s_335_339 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_4,
    neg_f_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_4,
    neg_g_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 339)) <=s delta, delta <=s (const 64 (1 + 2*339)),
    (const 64 (-(2**20))) <=s u_335_339, u_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_339, v_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_339, r_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_339, s_335_339 <=s (const 64 ((2**20)-1)),
    u_335_339 + v_335_339 <=s (const 64 (2**20)),
    u_335_339 - v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 + v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 - v_335_339 <=s (const 64 (2**20)),
    r_335_339 + s_335_339 <=s (const 64 (2**20)),
    r_335_339 - s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 + s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 - s_335_339 <=s (const 64 (2**20)),
    u_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_335_339 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step339

// premise b
assume
neg_g_295_low60_40_low20_4 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_5 neg_f_295_low60_40_low20_4;
mov u_335_340 u_335_339;
mov v_335_340 v_335_339;

add neg_g_295_low60_40_low20_5 neg_g_295_low60_40_low20_4 neg_f_295_low60_40_low20_4;
asr neg_g_295_low60_40_low20_5 neg_g_295_low60_40_low20_5 1;
add r_335_340 r_335_339 u_335_339;
asr r_335_340 r_335_340 1;
add s_335_340 s_335_339 v_335_339;
asr s_335_340 s_335_340 1;
assert
    true
&&
    neg_f_295_low60_40_low20_5 = neg_f_295_low60_40_low20_4,
    u_335_340 = u_335_339,
    v_335_340 = v_335_339,
    neg_g_295_low60_40_low20_5 * (const 64 2) = neg_g_295_low60_40_low20_4 + neg_f_295_low60_40_low20_4,
    r_335_340 * (const 64 2) = r_335_339 + u_335_339,
    s_335_340 * (const 64 2) = s_335_339 + v_335_339
;

assume
    neg_f_295_low60_40_low20_5 = neg_f_295_low60_40_low20_4,
    u_335_340 = u_335_339,
    v_335_340 = v_335_339,
    neg_g_295_low60_40_low20_5 * 2 = neg_g_295_low60_40_low20_4 + neg_f_295_low60_40_low20_4,
    r_335_340 * 2 = r_335_339 + u_335_339,
    s_335_340 * 2 = s_335_339 + v_335_339
&&
    true
;

{
    u_335_340 * neg_f_295_low60_40_low20_0 + v_335_340 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_340 * neg_f_295_low60_40_low20_0 + s_335_340 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_5 + u_335_340 * (const 64 (2**21)) + v_335_340 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_5 + r_335_340 * (const 64 (2**21)) + s_335_340 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_5,
    neg_f_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_5,
    neg_g_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 340)) <=s delta, delta <=s (const 64 (1 + 2*340)),
    (const 64 (-(2**20))) <=s u_335_340, u_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_340, v_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_340, r_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_340, s_335_340 <=s (const 64 ((2**20)-1)),
    u_335_340 + v_335_340 <=s (const 64 (2**20)),
    u_335_340 - v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 + v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 - v_335_340 <=s (const 64 (2**20)),
    r_335_340 + s_335_340 <=s (const 64 (2**20)),
    r_335_340 - s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 + s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 - s_335_340 <=s (const 64 (2**20)),
    u_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_335_340 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_339_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_4,
sint64 neg_g_295_low60_40_low20_4,
sint64 neg_f_295_low60_40_low20_5,
sint64 neg_g_295_low60_40_low20_5,
sint64 u_335_339,
sint64 v_335_339,
sint64 r_335_339,
sint64 s_335_339,
sint64 u_335_340,
sint64 v_335_340,
sint64 r_335_340,
sint64 s_335_340,
bit ne
)={
    u_335_339 * neg_f_295_low60_40_low20_0 + v_335_339 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_4 * (-(2**20)),
    r_335_339 * neg_f_295_low60_40_low20_0 + s_335_339 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_4 * (-(2**20))
&&
    u_335_339 * neg_f_295_low60_40_low20_0 + v_335_339 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_4 * (const 64 (-(2**20))),
    r_335_339 * neg_f_295_low60_40_low20_0 + s_335_339 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_4 + u_335_339 * (const 64 (2**21)) + v_335_339 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_4 + r_335_339 * (const 64 (2**21)) + s_335_339 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_4,
    neg_f_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_4,
    neg_g_295_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 339)) <=s delta, delta <=s (const 64 (1 + 2*339)),
    (const 64 (-(2**20))) <=s u_335_339, u_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_339, v_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_339, r_335_339 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_339, s_335_339 <=s (const 64 ((2**20)-1)),
    u_335_339 + v_335_339 <=s (const 64 (2**20)),
    u_335_339 - v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 + v_335_339 <=s (const 64 (2**20)),
    (const 64 0) - u_335_339 - v_335_339 <=s (const 64 (2**20)),
    r_335_339 + s_335_339 <=s (const 64 (2**20)),
    r_335_339 - s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 + s_335_339 <=s (const 64 (2**20)),
    (const 64 0) - r_335_339 - s_335_339 <=s (const 64 (2**20)),
    u_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_335_339 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_335_339 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step339

// premise c
assume
neg_g_295_low60_40_low20_4 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_5 neg_g_295_low60_40_low20_4;
mov u_335_340 r_335_339;
mov v_335_340 s_335_339;

subs dc neg_g_295_low60_40_low20_5 neg_g_295_low60_40_low20_4 neg_f_295_low60_40_low20_4;
asr neg_g_295_low60_40_low20_5 neg_g_295_low60_40_low20_5 1;
subs dc r_335_340 r_335_339 u_335_339;
asr r_335_340 r_335_340 1;
subs dc s_335_340 s_335_339 v_335_339;
asr s_335_340 s_335_340 1;
assert
    true
&&
    neg_f_295_low60_40_low20_5 = neg_g_295_low60_40_low20_4,
    u_335_340 = r_335_339,
    v_335_340 = s_335_339,
    neg_g_295_low60_40_low20_5 * (const 64 2) = neg_g_295_low60_40_low20_4 - neg_f_295_low60_40_low20_4,
    r_335_340 * (const 64 2) = r_335_339 - u_335_339,
    s_335_340 * (const 64 2) = s_335_339 - v_335_339
;

assume
    neg_f_295_low60_40_low20_5 = neg_g_295_low60_40_low20_4,
    u_335_340 = r_335_339,
    v_335_340 = s_335_339,
    neg_g_295_low60_40_low20_5 * 2 = neg_g_295_low60_40_low20_4 - neg_f_295_low60_40_low20_4,
    r_335_340 * 2 = r_335_339 - u_335_339,
    s_335_340 * 2 = s_335_339 - v_335_339
&&
    true
;

{
    u_335_340 * neg_f_295_low60_40_low20_0 + v_335_340 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_340 * neg_f_295_low60_40_low20_0 + s_335_340 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_5 + u_335_340 * (const 64 (2**21)) + v_335_340 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_5 + r_335_340 * (const 64 (2**21)) + s_335_340 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_5,
    neg_f_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_5,
    neg_g_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 340)) <=s delta, delta <=s (const 64 (1 + 2*340)),
    (const 64 (-(2**20))) <=s u_335_340, u_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_340, v_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_340, r_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_340, s_335_340 <=s (const 64 ((2**20)-1)),
    u_335_340 + v_335_340 <=s (const 64 (2**20)),
    u_335_340 - v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 + v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 - v_335_340 <=s (const 64 (2**20)),
    r_335_340 + s_335_340 <=s (const 64 (2**20)),
    r_335_340 - s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 + s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 - s_335_340 <=s (const 64 (2**20)),
    u_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_335_340 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_340_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_5,
sint64 neg_g_295_low60_40_low20_5,
sint64 neg_f_295_low60_40_low20_6,
sint64 neg_g_295_low60_40_low20_6,
sint64 u_335_340,
sint64 v_335_340,
sint64 r_335_340,
sint64 s_335_340,
sint64 u_335_341,
sint64 v_335_341,
sint64 r_335_341,
sint64 s_335_341,
bit ne
)={
    u_335_340 * neg_f_295_low60_40_low20_0 + v_335_340 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_5 * (-(2**20)),
    r_335_340 * neg_f_295_low60_40_low20_0 + s_335_340 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_5 * (-(2**20))
&&
    u_335_340 * neg_f_295_low60_40_low20_0 + v_335_340 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_5 * (const 64 (-(2**20))),
    r_335_340 * neg_f_295_low60_40_low20_0 + s_335_340 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_5 + u_335_340 * (const 64 (2**21)) + v_335_340 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_5 + r_335_340 * (const 64 (2**21)) + s_335_340 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_5,
    neg_f_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_5,
    neg_g_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 340)) <=s delta, delta <=s (const 64 (1 + 2*340)),
    (const 64 (-(2**20))) <=s u_335_340, u_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_340, v_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_340, r_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_340, s_335_340 <=s (const 64 ((2**20)-1)),
    u_335_340 + v_335_340 <=s (const 64 (2**20)),
    u_335_340 - v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 + v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 - v_335_340 <=s (const 64 (2**20)),
    r_335_340 + s_335_340 <=s (const 64 (2**20)),
    r_335_340 - s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 + s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 - s_335_340 <=s (const 64 (2**20)),
    u_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_335_340 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step340

// premise a
assume
neg_g_295_low60_40_low20_5 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_6 neg_f_295_low60_40_low20_5;
mov u_335_341 u_335_340;
mov v_335_341 v_335_340;

asr neg_g_295_low60_40_low20_6 neg_g_295_low60_40_low20_5 1;
asr r_335_341 r_335_340 1;
asr s_335_341 s_335_340 1;
assert
    true
&&
    neg_f_295_low60_40_low20_6 = neg_f_295_low60_40_low20_5,
    u_335_341 = u_335_340,
    v_335_341 = v_335_340,
    neg_g_295_low60_40_low20_6 * (const 64 2) = neg_g_295_low60_40_low20_5,
    r_335_341 * (const 64 2) = r_335_340,
    s_335_341 * (const 64 2) = s_335_340
;

assume
    neg_f_295_low60_40_low20_6 = neg_f_295_low60_40_low20_5,
    u_335_341 = u_335_340,
    v_335_341 = v_335_340,
    neg_g_295_low60_40_low20_6 * 2 = neg_g_295_low60_40_low20_5,
    r_335_341 * 2 = r_335_340,
    s_335_341 * 2 = s_335_340
&&
    true
;

{
    u_335_341 * neg_f_295_low60_40_low20_0 + v_335_341 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_341 * neg_f_295_low60_40_low20_0 + s_335_341 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_6 + u_335_341 * (const 64 (2**21)) + v_335_341 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_6 + r_335_341 * (const 64 (2**21)) + s_335_341 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_6,
    neg_f_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_6,
    neg_g_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 341)) <=s delta, delta <=s (const 64 (1 + 2*341)),
    (const 64 (-(2**20))) <=s u_335_341, u_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_341, v_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_341, r_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_341, s_335_341 <=s (const 64 ((2**20)-1)),
    u_335_341 + v_335_341 <=s (const 64 (2**20)),
    u_335_341 - v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 + v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 - v_335_341 <=s (const 64 (2**20)),
    r_335_341 + s_335_341 <=s (const 64 (2**20)),
    r_335_341 - s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 + s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 - s_335_341 <=s (const 64 (2**20)),
    u_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_335_341 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_340_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_5,
sint64 neg_g_295_low60_40_low20_5,
sint64 neg_f_295_low60_40_low20_6,
sint64 neg_g_295_low60_40_low20_6,
sint64 u_335_340,
sint64 v_335_340,
sint64 r_335_340,
sint64 s_335_340,
sint64 u_335_341,
sint64 v_335_341,
sint64 r_335_341,
sint64 s_335_341,
bit ne
)={
    u_335_340 * neg_f_295_low60_40_low20_0 + v_335_340 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_5 * (-(2**20)),
    r_335_340 * neg_f_295_low60_40_low20_0 + s_335_340 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_5 * (-(2**20))
&&
    u_335_340 * neg_f_295_low60_40_low20_0 + v_335_340 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_5 * (const 64 (-(2**20))),
    r_335_340 * neg_f_295_low60_40_low20_0 + s_335_340 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_5 + u_335_340 * (const 64 (2**21)) + v_335_340 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_5 + r_335_340 * (const 64 (2**21)) + s_335_340 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_5,
    neg_f_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_5,
    neg_g_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 340)) <=s delta, delta <=s (const 64 (1 + 2*340)),
    (const 64 (-(2**20))) <=s u_335_340, u_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_340, v_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_340, r_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_340, s_335_340 <=s (const 64 ((2**20)-1)),
    u_335_340 + v_335_340 <=s (const 64 (2**20)),
    u_335_340 - v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 + v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 - v_335_340 <=s (const 64 (2**20)),
    r_335_340 + s_335_340 <=s (const 64 (2**20)),
    r_335_340 - s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 + s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 - s_335_340 <=s (const 64 (2**20)),
    u_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_335_340 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step340

// premise b
assume
neg_g_295_low60_40_low20_5 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_6 neg_f_295_low60_40_low20_5;
mov u_335_341 u_335_340;
mov v_335_341 v_335_340;

add neg_g_295_low60_40_low20_6 neg_g_295_low60_40_low20_5 neg_f_295_low60_40_low20_5;
asr neg_g_295_low60_40_low20_6 neg_g_295_low60_40_low20_6 1;
add r_335_341 r_335_340 u_335_340;
asr r_335_341 r_335_341 1;
add s_335_341 s_335_340 v_335_340;
asr s_335_341 s_335_341 1;
assert
    true
&&
    neg_f_295_low60_40_low20_6 = neg_f_295_low60_40_low20_5,
    u_335_341 = u_335_340,
    v_335_341 = v_335_340,
    neg_g_295_low60_40_low20_6 * (const 64 2) = neg_g_295_low60_40_low20_5 + neg_f_295_low60_40_low20_5,
    r_335_341 * (const 64 2) = r_335_340 + u_335_340,
    s_335_341 * (const 64 2) = s_335_340 + v_335_340
;

assume
    neg_f_295_low60_40_low20_6 = neg_f_295_low60_40_low20_5,
    u_335_341 = u_335_340,
    v_335_341 = v_335_340,
    neg_g_295_low60_40_low20_6 * 2 = neg_g_295_low60_40_low20_5 + neg_f_295_low60_40_low20_5,
    r_335_341 * 2 = r_335_340 + u_335_340,
    s_335_341 * 2 = s_335_340 + v_335_340
&&
    true
;

{
    u_335_341 * neg_f_295_low60_40_low20_0 + v_335_341 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_341 * neg_f_295_low60_40_low20_0 + s_335_341 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_6 + u_335_341 * (const 64 (2**21)) + v_335_341 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_6 + r_335_341 * (const 64 (2**21)) + s_335_341 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_6,
    neg_f_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_6,
    neg_g_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 341)) <=s delta, delta <=s (const 64 (1 + 2*341)),
    (const 64 (-(2**20))) <=s u_335_341, u_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_341, v_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_341, r_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_341, s_335_341 <=s (const 64 ((2**20)-1)),
    u_335_341 + v_335_341 <=s (const 64 (2**20)),
    u_335_341 - v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 + v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 - v_335_341 <=s (const 64 (2**20)),
    r_335_341 + s_335_341 <=s (const 64 (2**20)),
    r_335_341 - s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 + s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 - s_335_341 <=s (const 64 (2**20)),
    u_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_335_341 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_340_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_5,
sint64 neg_g_295_low60_40_low20_5,
sint64 neg_f_295_low60_40_low20_6,
sint64 neg_g_295_low60_40_low20_6,
sint64 u_335_340,
sint64 v_335_340,
sint64 r_335_340,
sint64 s_335_340,
sint64 u_335_341,
sint64 v_335_341,
sint64 r_335_341,
sint64 s_335_341,
bit ne
)={
    u_335_340 * neg_f_295_low60_40_low20_0 + v_335_340 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_5 * (-(2**20)),
    r_335_340 * neg_f_295_low60_40_low20_0 + s_335_340 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_5 * (-(2**20))
&&
    u_335_340 * neg_f_295_low60_40_low20_0 + v_335_340 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_5 * (const 64 (-(2**20))),
    r_335_340 * neg_f_295_low60_40_low20_0 + s_335_340 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_5 + u_335_340 * (const 64 (2**21)) + v_335_340 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_5 + r_335_340 * (const 64 (2**21)) + s_335_340 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_5,
    neg_f_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_5,
    neg_g_295_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 340)) <=s delta, delta <=s (const 64 (1 + 2*340)),
    (const 64 (-(2**20))) <=s u_335_340, u_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_340, v_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_340, r_335_340 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_340, s_335_340 <=s (const 64 ((2**20)-1)),
    u_335_340 + v_335_340 <=s (const 64 (2**20)),
    u_335_340 - v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 + v_335_340 <=s (const 64 (2**20)),
    (const 64 0) - u_335_340 - v_335_340 <=s (const 64 (2**20)),
    r_335_340 + s_335_340 <=s (const 64 (2**20)),
    r_335_340 - s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 + s_335_340 <=s (const 64 (2**20)),
    (const 64 0) - r_335_340 - s_335_340 <=s (const 64 (2**20)),
    u_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_335_340 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_335_340 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step340

// premise c
assume
neg_g_295_low60_40_low20_5 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_6 neg_g_295_low60_40_low20_5;
mov u_335_341 r_335_340;
mov v_335_341 s_335_340;

subs dc neg_g_295_low60_40_low20_6 neg_g_295_low60_40_low20_5 neg_f_295_low60_40_low20_5;
asr neg_g_295_low60_40_low20_6 neg_g_295_low60_40_low20_6 1;
subs dc r_335_341 r_335_340 u_335_340;
asr r_335_341 r_335_341 1;
subs dc s_335_341 s_335_340 v_335_340;
asr s_335_341 s_335_341 1;
assert
    true
&&
    neg_f_295_low60_40_low20_6 = neg_g_295_low60_40_low20_5,
    u_335_341 = r_335_340,
    v_335_341 = s_335_340,
    neg_g_295_low60_40_low20_6 * (const 64 2) = neg_g_295_low60_40_low20_5 - neg_f_295_low60_40_low20_5,
    r_335_341 * (const 64 2) = r_335_340 - u_335_340,
    s_335_341 * (const 64 2) = s_335_340 - v_335_340
;

assume
    neg_f_295_low60_40_low20_6 = neg_g_295_low60_40_low20_5,
    u_335_341 = r_335_340,
    v_335_341 = s_335_340,
    neg_g_295_low60_40_low20_6 * 2 = neg_g_295_low60_40_low20_5 - neg_f_295_low60_40_low20_5,
    r_335_341 * 2 = r_335_340 - u_335_340,
    s_335_341 * 2 = s_335_340 - v_335_340
&&
    true
;

{
    u_335_341 * neg_f_295_low60_40_low20_0 + v_335_341 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_341 * neg_f_295_low60_40_low20_0 + s_335_341 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_6 + u_335_341 * (const 64 (2**21)) + v_335_341 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_6 + r_335_341 * (const 64 (2**21)) + s_335_341 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_6,
    neg_f_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_6,
    neg_g_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 341)) <=s delta, delta <=s (const 64 (1 + 2*341)),
    (const 64 (-(2**20))) <=s u_335_341, u_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_341, v_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_341, r_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_341, s_335_341 <=s (const 64 ((2**20)-1)),
    u_335_341 + v_335_341 <=s (const 64 (2**20)),
    u_335_341 - v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 + v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 - v_335_341 <=s (const 64 (2**20)),
    r_335_341 + s_335_341 <=s (const 64 (2**20)),
    r_335_341 - s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 + s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 - s_335_341 <=s (const 64 (2**20)),
    u_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_335_341 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_341_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_6,
sint64 neg_g_295_low60_40_low20_6,
sint64 neg_f_295_low60_40_low20_7,
sint64 neg_g_295_low60_40_low20_7,
sint64 u_335_341,
sint64 v_335_341,
sint64 r_335_341,
sint64 s_335_341,
sint64 u_335_342,
sint64 v_335_342,
sint64 r_335_342,
sint64 s_335_342,
bit ne
)={
    u_335_341 * neg_f_295_low60_40_low20_0 + v_335_341 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_6 * (-(2**20)),
    r_335_341 * neg_f_295_low60_40_low20_0 + s_335_341 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_6 * (-(2**20))
&&
    u_335_341 * neg_f_295_low60_40_low20_0 + v_335_341 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_6 * (const 64 (-(2**20))),
    r_335_341 * neg_f_295_low60_40_low20_0 + s_335_341 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_6 + u_335_341 * (const 64 (2**21)) + v_335_341 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_6 + r_335_341 * (const 64 (2**21)) + s_335_341 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_6,
    neg_f_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_6,
    neg_g_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 341)) <=s delta, delta <=s (const 64 (1 + 2*341)),
    (const 64 (-(2**20))) <=s u_335_341, u_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_341, v_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_341, r_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_341, s_335_341 <=s (const 64 ((2**20)-1)),
    u_335_341 + v_335_341 <=s (const 64 (2**20)),
    u_335_341 - v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 + v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 - v_335_341 <=s (const 64 (2**20)),
    r_335_341 + s_335_341 <=s (const 64 (2**20)),
    r_335_341 - s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 + s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 - s_335_341 <=s (const 64 (2**20)),
    u_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_335_341 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step341

// premise a
assume
neg_g_295_low60_40_low20_6 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_7 neg_f_295_low60_40_low20_6;
mov u_335_342 u_335_341;
mov v_335_342 v_335_341;

asr neg_g_295_low60_40_low20_7 neg_g_295_low60_40_low20_6 1;
asr r_335_342 r_335_341 1;
asr s_335_342 s_335_341 1;
assert
    true
&&
    neg_f_295_low60_40_low20_7 = neg_f_295_low60_40_low20_6,
    u_335_342 = u_335_341,
    v_335_342 = v_335_341,
    neg_g_295_low60_40_low20_7 * (const 64 2) = neg_g_295_low60_40_low20_6,
    r_335_342 * (const 64 2) = r_335_341,
    s_335_342 * (const 64 2) = s_335_341
;

assume
    neg_f_295_low60_40_low20_7 = neg_f_295_low60_40_low20_6,
    u_335_342 = u_335_341,
    v_335_342 = v_335_341,
    neg_g_295_low60_40_low20_7 * 2 = neg_g_295_low60_40_low20_6,
    r_335_342 * 2 = r_335_341,
    s_335_342 * 2 = s_335_341
&&
    true
;

{
    u_335_342 * neg_f_295_low60_40_low20_0 + v_335_342 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_342 * neg_f_295_low60_40_low20_0 + s_335_342 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_7 + u_335_342 * (const 64 (2**21)) + v_335_342 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_7 + r_335_342 * (const 64 (2**21)) + s_335_342 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_7,
    neg_f_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_7,
    neg_g_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 342)) <=s delta, delta <=s (const 64 (1 + 2*342)),
    (const 64 (-(2**20))) <=s u_335_342, u_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_342, v_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_342, r_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_342, s_335_342 <=s (const 64 ((2**20)-1)),
    u_335_342 + v_335_342 <=s (const 64 (2**20)),
    u_335_342 - v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 + v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 - v_335_342 <=s (const 64 (2**20)),
    r_335_342 + s_335_342 <=s (const 64 (2**20)),
    r_335_342 - s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 + s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 - s_335_342 <=s (const 64 (2**20)),
    u_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_335_342 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_341_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_6,
sint64 neg_g_295_low60_40_low20_6,
sint64 neg_f_295_low60_40_low20_7,
sint64 neg_g_295_low60_40_low20_7,
sint64 u_335_341,
sint64 v_335_341,
sint64 r_335_341,
sint64 s_335_341,
sint64 u_335_342,
sint64 v_335_342,
sint64 r_335_342,
sint64 s_335_342,
bit ne
)={
    u_335_341 * neg_f_295_low60_40_low20_0 + v_335_341 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_6 * (-(2**20)),
    r_335_341 * neg_f_295_low60_40_low20_0 + s_335_341 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_6 * (-(2**20))
&&
    u_335_341 * neg_f_295_low60_40_low20_0 + v_335_341 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_6 * (const 64 (-(2**20))),
    r_335_341 * neg_f_295_low60_40_low20_0 + s_335_341 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_6 + u_335_341 * (const 64 (2**21)) + v_335_341 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_6 + r_335_341 * (const 64 (2**21)) + s_335_341 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_6,
    neg_f_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_6,
    neg_g_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 341)) <=s delta, delta <=s (const 64 (1 + 2*341)),
    (const 64 (-(2**20))) <=s u_335_341, u_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_341, v_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_341, r_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_341, s_335_341 <=s (const 64 ((2**20)-1)),
    u_335_341 + v_335_341 <=s (const 64 (2**20)),
    u_335_341 - v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 + v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 - v_335_341 <=s (const 64 (2**20)),
    r_335_341 + s_335_341 <=s (const 64 (2**20)),
    r_335_341 - s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 + s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 - s_335_341 <=s (const 64 (2**20)),
    u_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_335_341 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step341

// premise b
assume
neg_g_295_low60_40_low20_6 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_7 neg_f_295_low60_40_low20_6;
mov u_335_342 u_335_341;
mov v_335_342 v_335_341;

add neg_g_295_low60_40_low20_7 neg_g_295_low60_40_low20_6 neg_f_295_low60_40_low20_6;
asr neg_g_295_low60_40_low20_7 neg_g_295_low60_40_low20_7 1;
add r_335_342 r_335_341 u_335_341;
asr r_335_342 r_335_342 1;
add s_335_342 s_335_341 v_335_341;
asr s_335_342 s_335_342 1;
assert
    true
&&
    neg_f_295_low60_40_low20_7 = neg_f_295_low60_40_low20_6,
    u_335_342 = u_335_341,
    v_335_342 = v_335_341,
    neg_g_295_low60_40_low20_7 * (const 64 2) = neg_g_295_low60_40_low20_6 + neg_f_295_low60_40_low20_6,
    r_335_342 * (const 64 2) = r_335_341 + u_335_341,
    s_335_342 * (const 64 2) = s_335_341 + v_335_341
;

assume
    neg_f_295_low60_40_low20_7 = neg_f_295_low60_40_low20_6,
    u_335_342 = u_335_341,
    v_335_342 = v_335_341,
    neg_g_295_low60_40_low20_7 * 2 = neg_g_295_low60_40_low20_6 + neg_f_295_low60_40_low20_6,
    r_335_342 * 2 = r_335_341 + u_335_341,
    s_335_342 * 2 = s_335_341 + v_335_341
&&
    true
;

{
    u_335_342 * neg_f_295_low60_40_low20_0 + v_335_342 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_342 * neg_f_295_low60_40_low20_0 + s_335_342 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_7 + u_335_342 * (const 64 (2**21)) + v_335_342 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_7 + r_335_342 * (const 64 (2**21)) + s_335_342 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_7,
    neg_f_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_7,
    neg_g_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 342)) <=s delta, delta <=s (const 64 (1 + 2*342)),
    (const 64 (-(2**20))) <=s u_335_342, u_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_342, v_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_342, r_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_342, s_335_342 <=s (const 64 ((2**20)-1)),
    u_335_342 + v_335_342 <=s (const 64 (2**20)),
    u_335_342 - v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 + v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 - v_335_342 <=s (const 64 (2**20)),
    r_335_342 + s_335_342 <=s (const 64 (2**20)),
    r_335_342 - s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 + s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 - s_335_342 <=s (const 64 (2**20)),
    u_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_335_342 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_341_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_6,
sint64 neg_g_295_low60_40_low20_6,
sint64 neg_f_295_low60_40_low20_7,
sint64 neg_g_295_low60_40_low20_7,
sint64 u_335_341,
sint64 v_335_341,
sint64 r_335_341,
sint64 s_335_341,
sint64 u_335_342,
sint64 v_335_342,
sint64 r_335_342,
sint64 s_335_342,
bit ne
)={
    u_335_341 * neg_f_295_low60_40_low20_0 + v_335_341 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_6 * (-(2**20)),
    r_335_341 * neg_f_295_low60_40_low20_0 + s_335_341 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_6 * (-(2**20))
&&
    u_335_341 * neg_f_295_low60_40_low20_0 + v_335_341 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_6 * (const 64 (-(2**20))),
    r_335_341 * neg_f_295_low60_40_low20_0 + s_335_341 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_6 + u_335_341 * (const 64 (2**21)) + v_335_341 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_6 + r_335_341 * (const 64 (2**21)) + s_335_341 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_6,
    neg_f_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_6,
    neg_g_295_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 341)) <=s delta, delta <=s (const 64 (1 + 2*341)),
    (const 64 (-(2**20))) <=s u_335_341, u_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_341, v_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_341, r_335_341 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_341, s_335_341 <=s (const 64 ((2**20)-1)),
    u_335_341 + v_335_341 <=s (const 64 (2**20)),
    u_335_341 - v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 + v_335_341 <=s (const 64 (2**20)),
    (const 64 0) - u_335_341 - v_335_341 <=s (const 64 (2**20)),
    r_335_341 + s_335_341 <=s (const 64 (2**20)),
    r_335_341 - s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 + s_335_341 <=s (const 64 (2**20)),
    (const 64 0) - r_335_341 - s_335_341 <=s (const 64 (2**20)),
    u_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_335_341 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_335_341 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step341

// premise c
assume
neg_g_295_low60_40_low20_6 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_7 neg_g_295_low60_40_low20_6;
mov u_335_342 r_335_341;
mov v_335_342 s_335_341;

subs dc neg_g_295_low60_40_low20_7 neg_g_295_low60_40_low20_6 neg_f_295_low60_40_low20_6;
asr neg_g_295_low60_40_low20_7 neg_g_295_low60_40_low20_7 1;
subs dc r_335_342 r_335_341 u_335_341;
asr r_335_342 r_335_342 1;
subs dc s_335_342 s_335_341 v_335_341;
asr s_335_342 s_335_342 1;
assert
    true
&&
    neg_f_295_low60_40_low20_7 = neg_g_295_low60_40_low20_6,
    u_335_342 = r_335_341,
    v_335_342 = s_335_341,
    neg_g_295_low60_40_low20_7 * (const 64 2) = neg_g_295_low60_40_low20_6 - neg_f_295_low60_40_low20_6,
    r_335_342 * (const 64 2) = r_335_341 - u_335_341,
    s_335_342 * (const 64 2) = s_335_341 - v_335_341
;

assume
    neg_f_295_low60_40_low20_7 = neg_g_295_low60_40_low20_6,
    u_335_342 = r_335_341,
    v_335_342 = s_335_341,
    neg_g_295_low60_40_low20_7 * 2 = neg_g_295_low60_40_low20_6 - neg_f_295_low60_40_low20_6,
    r_335_342 * 2 = r_335_341 - u_335_341,
    s_335_342 * 2 = s_335_341 - v_335_341
&&
    true
;

{
    u_335_342 * neg_f_295_low60_40_low20_0 + v_335_342 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_342 * neg_f_295_low60_40_low20_0 + s_335_342 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_7 + u_335_342 * (const 64 (2**21)) + v_335_342 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_7 + r_335_342 * (const 64 (2**21)) + s_335_342 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_7,
    neg_f_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_7,
    neg_g_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 342)) <=s delta, delta <=s (const 64 (1 + 2*342)),
    (const 64 (-(2**20))) <=s u_335_342, u_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_342, v_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_342, r_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_342, s_335_342 <=s (const 64 ((2**20)-1)),
    u_335_342 + v_335_342 <=s (const 64 (2**20)),
    u_335_342 - v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 + v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 - v_335_342 <=s (const 64 (2**20)),
    r_335_342 + s_335_342 <=s (const 64 (2**20)),
    r_335_342 - s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 + s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 - s_335_342 <=s (const 64 (2**20)),
    u_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_335_342 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_342_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_7,
sint64 neg_g_295_low60_40_low20_7,
sint64 neg_f_295_low60_40_low20_8,
sint64 neg_g_295_low60_40_low20_8,
sint64 u_335_342,
sint64 v_335_342,
sint64 r_335_342,
sint64 s_335_342,
sint64 u_335_343,
sint64 v_335_343,
sint64 r_335_343,
sint64 s_335_343,
bit ne
)={
    u_335_342 * neg_f_295_low60_40_low20_0 + v_335_342 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_7 * (-(2**20)),
    r_335_342 * neg_f_295_low60_40_low20_0 + s_335_342 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_7 * (-(2**20))
&&
    u_335_342 * neg_f_295_low60_40_low20_0 + v_335_342 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_7 * (const 64 (-(2**20))),
    r_335_342 * neg_f_295_low60_40_low20_0 + s_335_342 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_7 + u_335_342 * (const 64 (2**21)) + v_335_342 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_7 + r_335_342 * (const 64 (2**21)) + s_335_342 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_7,
    neg_f_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_7,
    neg_g_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 342)) <=s delta, delta <=s (const 64 (1 + 2*342)),
    (const 64 (-(2**20))) <=s u_335_342, u_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_342, v_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_342, r_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_342, s_335_342 <=s (const 64 ((2**20)-1)),
    u_335_342 + v_335_342 <=s (const 64 (2**20)),
    u_335_342 - v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 + v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 - v_335_342 <=s (const 64 (2**20)),
    r_335_342 + s_335_342 <=s (const 64 (2**20)),
    r_335_342 - s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 + s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 - s_335_342 <=s (const 64 (2**20)),
    u_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_335_342 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step342

// premise a
assume
neg_g_295_low60_40_low20_7 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_8 neg_f_295_low60_40_low20_7;
mov u_335_343 u_335_342;
mov v_335_343 v_335_342;

asr neg_g_295_low60_40_low20_8 neg_g_295_low60_40_low20_7 1;
asr r_335_343 r_335_342 1;
asr s_335_343 s_335_342 1;
assert
    true
&&
    neg_f_295_low60_40_low20_8 = neg_f_295_low60_40_low20_7,
    u_335_343 = u_335_342,
    v_335_343 = v_335_342,
    neg_g_295_low60_40_low20_8 * (const 64 2) = neg_g_295_low60_40_low20_7,
    r_335_343 * (const 64 2) = r_335_342,
    s_335_343 * (const 64 2) = s_335_342
;

assume
    neg_f_295_low60_40_low20_8 = neg_f_295_low60_40_low20_7,
    u_335_343 = u_335_342,
    v_335_343 = v_335_342,
    neg_g_295_low60_40_low20_8 * 2 = neg_g_295_low60_40_low20_7,
    r_335_343 * 2 = r_335_342,
    s_335_343 * 2 = s_335_342
&&
    true
;

{
    u_335_343 * neg_f_295_low60_40_low20_0 + v_335_343 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_343 * neg_f_295_low60_40_low20_0 + s_335_343 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_8 + u_335_343 * (const 64 (2**21)) + v_335_343 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_8 + r_335_343 * (const 64 (2**21)) + s_335_343 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_8,
    neg_f_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_8,
    neg_g_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 343)) <=s delta, delta <=s (const 64 (1 + 2*343)),
    (const 64 (-(2**20))) <=s u_335_343, u_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_343, v_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_343, r_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_343, s_335_343 <=s (const 64 ((2**20)-1)),
    u_335_343 + v_335_343 <=s (const 64 (2**20)),
    u_335_343 - v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 + v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 - v_335_343 <=s (const 64 (2**20)),
    r_335_343 + s_335_343 <=s (const 64 (2**20)),
    r_335_343 - s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 + s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 - s_335_343 <=s (const 64 (2**20)),
    u_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_335_343 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_342_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_7,
sint64 neg_g_295_low60_40_low20_7,
sint64 neg_f_295_low60_40_low20_8,
sint64 neg_g_295_low60_40_low20_8,
sint64 u_335_342,
sint64 v_335_342,
sint64 r_335_342,
sint64 s_335_342,
sint64 u_335_343,
sint64 v_335_343,
sint64 r_335_343,
sint64 s_335_343,
bit ne
)={
    u_335_342 * neg_f_295_low60_40_low20_0 + v_335_342 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_7 * (-(2**20)),
    r_335_342 * neg_f_295_low60_40_low20_0 + s_335_342 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_7 * (-(2**20))
&&
    u_335_342 * neg_f_295_low60_40_low20_0 + v_335_342 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_7 * (const 64 (-(2**20))),
    r_335_342 * neg_f_295_low60_40_low20_0 + s_335_342 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_7 + u_335_342 * (const 64 (2**21)) + v_335_342 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_7 + r_335_342 * (const 64 (2**21)) + s_335_342 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_7,
    neg_f_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_7,
    neg_g_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 342)) <=s delta, delta <=s (const 64 (1 + 2*342)),
    (const 64 (-(2**20))) <=s u_335_342, u_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_342, v_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_342, r_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_342, s_335_342 <=s (const 64 ((2**20)-1)),
    u_335_342 + v_335_342 <=s (const 64 (2**20)),
    u_335_342 - v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 + v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 - v_335_342 <=s (const 64 (2**20)),
    r_335_342 + s_335_342 <=s (const 64 (2**20)),
    r_335_342 - s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 + s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 - s_335_342 <=s (const 64 (2**20)),
    u_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_335_342 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step342

// premise b
assume
neg_g_295_low60_40_low20_7 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_8 neg_f_295_low60_40_low20_7;
mov u_335_343 u_335_342;
mov v_335_343 v_335_342;

add neg_g_295_low60_40_low20_8 neg_g_295_low60_40_low20_7 neg_f_295_low60_40_low20_7;
asr neg_g_295_low60_40_low20_8 neg_g_295_low60_40_low20_8 1;
add r_335_343 r_335_342 u_335_342;
asr r_335_343 r_335_343 1;
add s_335_343 s_335_342 v_335_342;
asr s_335_343 s_335_343 1;
assert
    true
&&
    neg_f_295_low60_40_low20_8 = neg_f_295_low60_40_low20_7,
    u_335_343 = u_335_342,
    v_335_343 = v_335_342,
    neg_g_295_low60_40_low20_8 * (const 64 2) = neg_g_295_low60_40_low20_7 + neg_f_295_low60_40_low20_7,
    r_335_343 * (const 64 2) = r_335_342 + u_335_342,
    s_335_343 * (const 64 2) = s_335_342 + v_335_342
;

assume
    neg_f_295_low60_40_low20_8 = neg_f_295_low60_40_low20_7,
    u_335_343 = u_335_342,
    v_335_343 = v_335_342,
    neg_g_295_low60_40_low20_8 * 2 = neg_g_295_low60_40_low20_7 + neg_f_295_low60_40_low20_7,
    r_335_343 * 2 = r_335_342 + u_335_342,
    s_335_343 * 2 = s_335_342 + v_335_342
&&
    true
;

{
    u_335_343 * neg_f_295_low60_40_low20_0 + v_335_343 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_343 * neg_f_295_low60_40_low20_0 + s_335_343 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_8 + u_335_343 * (const 64 (2**21)) + v_335_343 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_8 + r_335_343 * (const 64 (2**21)) + s_335_343 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_8,
    neg_f_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_8,
    neg_g_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 343)) <=s delta, delta <=s (const 64 (1 + 2*343)),
    (const 64 (-(2**20))) <=s u_335_343, u_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_343, v_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_343, r_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_343, s_335_343 <=s (const 64 ((2**20)-1)),
    u_335_343 + v_335_343 <=s (const 64 (2**20)),
    u_335_343 - v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 + v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 - v_335_343 <=s (const 64 (2**20)),
    r_335_343 + s_335_343 <=s (const 64 (2**20)),
    r_335_343 - s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 + s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 - s_335_343 <=s (const 64 (2**20)),
    u_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_335_343 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_342_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_7,
sint64 neg_g_295_low60_40_low20_7,
sint64 neg_f_295_low60_40_low20_8,
sint64 neg_g_295_low60_40_low20_8,
sint64 u_335_342,
sint64 v_335_342,
sint64 r_335_342,
sint64 s_335_342,
sint64 u_335_343,
sint64 v_335_343,
sint64 r_335_343,
sint64 s_335_343,
bit ne
)={
    u_335_342 * neg_f_295_low60_40_low20_0 + v_335_342 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_7 * (-(2**20)),
    r_335_342 * neg_f_295_low60_40_low20_0 + s_335_342 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_7 * (-(2**20))
&&
    u_335_342 * neg_f_295_low60_40_low20_0 + v_335_342 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_7 * (const 64 (-(2**20))),
    r_335_342 * neg_f_295_low60_40_low20_0 + s_335_342 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_7 + u_335_342 * (const 64 (2**21)) + v_335_342 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_7 + r_335_342 * (const 64 (2**21)) + s_335_342 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_7,
    neg_f_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_7,
    neg_g_295_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 342)) <=s delta, delta <=s (const 64 (1 + 2*342)),
    (const 64 (-(2**20))) <=s u_335_342, u_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_342, v_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_342, r_335_342 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_342, s_335_342 <=s (const 64 ((2**20)-1)),
    u_335_342 + v_335_342 <=s (const 64 (2**20)),
    u_335_342 - v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 + v_335_342 <=s (const 64 (2**20)),
    (const 64 0) - u_335_342 - v_335_342 <=s (const 64 (2**20)),
    r_335_342 + s_335_342 <=s (const 64 (2**20)),
    r_335_342 - s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 + s_335_342 <=s (const 64 (2**20)),
    (const 64 0) - r_335_342 - s_335_342 <=s (const 64 (2**20)),
    u_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_335_342 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_335_342 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step342

// premise c
assume
neg_g_295_low60_40_low20_7 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_8 neg_g_295_low60_40_low20_7;
mov u_335_343 r_335_342;
mov v_335_343 s_335_342;

subs dc neg_g_295_low60_40_low20_8 neg_g_295_low60_40_low20_7 neg_f_295_low60_40_low20_7;
asr neg_g_295_low60_40_low20_8 neg_g_295_low60_40_low20_8 1;
subs dc r_335_343 r_335_342 u_335_342;
asr r_335_343 r_335_343 1;
subs dc s_335_343 s_335_342 v_335_342;
asr s_335_343 s_335_343 1;
assert
    true
&&
    neg_f_295_low60_40_low20_8 = neg_g_295_low60_40_low20_7,
    u_335_343 = r_335_342,
    v_335_343 = s_335_342,
    neg_g_295_low60_40_low20_8 * (const 64 2) = neg_g_295_low60_40_low20_7 - neg_f_295_low60_40_low20_7,
    r_335_343 * (const 64 2) = r_335_342 - u_335_342,
    s_335_343 * (const 64 2) = s_335_342 - v_335_342
;

assume
    neg_f_295_low60_40_low20_8 = neg_g_295_low60_40_low20_7,
    u_335_343 = r_335_342,
    v_335_343 = s_335_342,
    neg_g_295_low60_40_low20_8 * 2 = neg_g_295_low60_40_low20_7 - neg_f_295_low60_40_low20_7,
    r_335_343 * 2 = r_335_342 - u_335_342,
    s_335_343 * 2 = s_335_342 - v_335_342
&&
    true
;

{
    u_335_343 * neg_f_295_low60_40_low20_0 + v_335_343 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_343 * neg_f_295_low60_40_low20_0 + s_335_343 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_8 + u_335_343 * (const 64 (2**21)) + v_335_343 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_8 + r_335_343 * (const 64 (2**21)) + s_335_343 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_8,
    neg_f_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_8,
    neg_g_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 343)) <=s delta, delta <=s (const 64 (1 + 2*343)),
    (const 64 (-(2**20))) <=s u_335_343, u_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_343, v_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_343, r_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_343, s_335_343 <=s (const 64 ((2**20)-1)),
    u_335_343 + v_335_343 <=s (const 64 (2**20)),
    u_335_343 - v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 + v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 - v_335_343 <=s (const 64 (2**20)),
    r_335_343 + s_335_343 <=s (const 64 (2**20)),
    r_335_343 - s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 + s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 - s_335_343 <=s (const 64 (2**20)),
    u_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_335_343 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_343_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_8,
sint64 neg_g_295_low60_40_low20_8,
sint64 neg_f_295_low60_40_low20_9,
sint64 neg_g_295_low60_40_low20_9,
sint64 u_335_343,
sint64 v_335_343,
sint64 r_335_343,
sint64 s_335_343,
sint64 u_335_344,
sint64 v_335_344,
sint64 r_335_344,
sint64 s_335_344,
bit ne
)={
    u_335_343 * neg_f_295_low60_40_low20_0 + v_335_343 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_8 * (-(2**20)),
    r_335_343 * neg_f_295_low60_40_low20_0 + s_335_343 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_8 * (-(2**20))
&&
    u_335_343 * neg_f_295_low60_40_low20_0 + v_335_343 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_8 * (const 64 (-(2**20))),
    r_335_343 * neg_f_295_low60_40_low20_0 + s_335_343 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_8 + u_335_343 * (const 64 (2**21)) + v_335_343 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_8 + r_335_343 * (const 64 (2**21)) + s_335_343 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_8,
    neg_f_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_8,
    neg_g_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 343)) <=s delta, delta <=s (const 64 (1 + 2*343)),
    (const 64 (-(2**20))) <=s u_335_343, u_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_343, v_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_343, r_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_343, s_335_343 <=s (const 64 ((2**20)-1)),
    u_335_343 + v_335_343 <=s (const 64 (2**20)),
    u_335_343 - v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 + v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 - v_335_343 <=s (const 64 (2**20)),
    r_335_343 + s_335_343 <=s (const 64 (2**20)),
    r_335_343 - s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 + s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 - s_335_343 <=s (const 64 (2**20)),
    u_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_335_343 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step343

// premise a
assume
neg_g_295_low60_40_low20_8 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_9 neg_f_295_low60_40_low20_8;
mov u_335_344 u_335_343;
mov v_335_344 v_335_343;

asr neg_g_295_low60_40_low20_9 neg_g_295_low60_40_low20_8 1;
asr r_335_344 r_335_343 1;
asr s_335_344 s_335_343 1;
assert
    true
&&
    neg_f_295_low60_40_low20_9 = neg_f_295_low60_40_low20_8,
    u_335_344 = u_335_343,
    v_335_344 = v_335_343,
    neg_g_295_low60_40_low20_9 * (const 64 2) = neg_g_295_low60_40_low20_8,
    r_335_344 * (const 64 2) = r_335_343,
    s_335_344 * (const 64 2) = s_335_343
;

assume
    neg_f_295_low60_40_low20_9 = neg_f_295_low60_40_low20_8,
    u_335_344 = u_335_343,
    v_335_344 = v_335_343,
    neg_g_295_low60_40_low20_9 * 2 = neg_g_295_low60_40_low20_8,
    r_335_344 * 2 = r_335_343,
    s_335_344 * 2 = s_335_343
&&
    true
;

{
    u_335_344 * neg_f_295_low60_40_low20_0 + v_335_344 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_344 * neg_f_295_low60_40_low20_0 + s_335_344 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_9 + u_335_344 * (const 64 (2**21)) + v_335_344 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_9 + r_335_344 * (const 64 (2**21)) + s_335_344 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_9,
    neg_f_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_9,
    neg_g_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 344)) <=s delta, delta <=s (const 64 (1 + 2*344)),
    (const 64 (-(2**20))) <=s u_335_344, u_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_344, v_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_344, r_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_344, s_335_344 <=s (const 64 ((2**20)-1)),
    u_335_344 + v_335_344 <=s (const 64 (2**20)),
    u_335_344 - v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 + v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 - v_335_344 <=s (const 64 (2**20)),
    r_335_344 + s_335_344 <=s (const 64 (2**20)),
    r_335_344 - s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 + s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 - s_335_344 <=s (const 64 (2**20)),
    u_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_335_344 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_343_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_8,
sint64 neg_g_295_low60_40_low20_8,
sint64 neg_f_295_low60_40_low20_9,
sint64 neg_g_295_low60_40_low20_9,
sint64 u_335_343,
sint64 v_335_343,
sint64 r_335_343,
sint64 s_335_343,
sint64 u_335_344,
sint64 v_335_344,
sint64 r_335_344,
sint64 s_335_344,
bit ne
)={
    u_335_343 * neg_f_295_low60_40_low20_0 + v_335_343 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_8 * (-(2**20)),
    r_335_343 * neg_f_295_low60_40_low20_0 + s_335_343 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_8 * (-(2**20))
&&
    u_335_343 * neg_f_295_low60_40_low20_0 + v_335_343 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_8 * (const 64 (-(2**20))),
    r_335_343 * neg_f_295_low60_40_low20_0 + s_335_343 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_8 + u_335_343 * (const 64 (2**21)) + v_335_343 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_8 + r_335_343 * (const 64 (2**21)) + s_335_343 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_8,
    neg_f_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_8,
    neg_g_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 343)) <=s delta, delta <=s (const 64 (1 + 2*343)),
    (const 64 (-(2**20))) <=s u_335_343, u_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_343, v_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_343, r_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_343, s_335_343 <=s (const 64 ((2**20)-1)),
    u_335_343 + v_335_343 <=s (const 64 (2**20)),
    u_335_343 - v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 + v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 - v_335_343 <=s (const 64 (2**20)),
    r_335_343 + s_335_343 <=s (const 64 (2**20)),
    r_335_343 - s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 + s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 - s_335_343 <=s (const 64 (2**20)),
    u_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_335_343 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step343

// premise b
assume
neg_g_295_low60_40_low20_8 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_9 neg_f_295_low60_40_low20_8;
mov u_335_344 u_335_343;
mov v_335_344 v_335_343;

add neg_g_295_low60_40_low20_9 neg_g_295_low60_40_low20_8 neg_f_295_low60_40_low20_8;
asr neg_g_295_low60_40_low20_9 neg_g_295_low60_40_low20_9 1;
add r_335_344 r_335_343 u_335_343;
asr r_335_344 r_335_344 1;
add s_335_344 s_335_343 v_335_343;
asr s_335_344 s_335_344 1;
assert
    true
&&
    neg_f_295_low60_40_low20_9 = neg_f_295_low60_40_low20_8,
    u_335_344 = u_335_343,
    v_335_344 = v_335_343,
    neg_g_295_low60_40_low20_9 * (const 64 2) = neg_g_295_low60_40_low20_8 + neg_f_295_low60_40_low20_8,
    r_335_344 * (const 64 2) = r_335_343 + u_335_343,
    s_335_344 * (const 64 2) = s_335_343 + v_335_343
;

assume
    neg_f_295_low60_40_low20_9 = neg_f_295_low60_40_low20_8,
    u_335_344 = u_335_343,
    v_335_344 = v_335_343,
    neg_g_295_low60_40_low20_9 * 2 = neg_g_295_low60_40_low20_8 + neg_f_295_low60_40_low20_8,
    r_335_344 * 2 = r_335_343 + u_335_343,
    s_335_344 * 2 = s_335_343 + v_335_343
&&
    true
;

{
    u_335_344 * neg_f_295_low60_40_low20_0 + v_335_344 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_344 * neg_f_295_low60_40_low20_0 + s_335_344 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_9 + u_335_344 * (const 64 (2**21)) + v_335_344 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_9 + r_335_344 * (const 64 (2**21)) + s_335_344 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_9,
    neg_f_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_9,
    neg_g_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 344)) <=s delta, delta <=s (const 64 (1 + 2*344)),
    (const 64 (-(2**20))) <=s u_335_344, u_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_344, v_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_344, r_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_344, s_335_344 <=s (const 64 ((2**20)-1)),
    u_335_344 + v_335_344 <=s (const 64 (2**20)),
    u_335_344 - v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 + v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 - v_335_344 <=s (const 64 (2**20)),
    r_335_344 + s_335_344 <=s (const 64 (2**20)),
    r_335_344 - s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 + s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 - s_335_344 <=s (const 64 (2**20)),
    u_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_335_344 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_343_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_8,
sint64 neg_g_295_low60_40_low20_8,
sint64 neg_f_295_low60_40_low20_9,
sint64 neg_g_295_low60_40_low20_9,
sint64 u_335_343,
sint64 v_335_343,
sint64 r_335_343,
sint64 s_335_343,
sint64 u_335_344,
sint64 v_335_344,
sint64 r_335_344,
sint64 s_335_344,
bit ne
)={
    u_335_343 * neg_f_295_low60_40_low20_0 + v_335_343 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_8 * (-(2**20)),
    r_335_343 * neg_f_295_low60_40_low20_0 + s_335_343 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_8 * (-(2**20))
&&
    u_335_343 * neg_f_295_low60_40_low20_0 + v_335_343 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_8 * (const 64 (-(2**20))),
    r_335_343 * neg_f_295_low60_40_low20_0 + s_335_343 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_8 + u_335_343 * (const 64 (2**21)) + v_335_343 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_8 + r_335_343 * (const 64 (2**21)) + s_335_343 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_8,
    neg_f_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_8,
    neg_g_295_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 343)) <=s delta, delta <=s (const 64 (1 + 2*343)),
    (const 64 (-(2**20))) <=s u_335_343, u_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_343, v_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_343, r_335_343 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_343, s_335_343 <=s (const 64 ((2**20)-1)),
    u_335_343 + v_335_343 <=s (const 64 (2**20)),
    u_335_343 - v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 + v_335_343 <=s (const 64 (2**20)),
    (const 64 0) - u_335_343 - v_335_343 <=s (const 64 (2**20)),
    r_335_343 + s_335_343 <=s (const 64 (2**20)),
    r_335_343 - s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 + s_335_343 <=s (const 64 (2**20)),
    (const 64 0) - r_335_343 - s_335_343 <=s (const 64 (2**20)),
    u_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_335_343 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_335_343 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step343

// premise c
assume
neg_g_295_low60_40_low20_8 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_9 neg_g_295_low60_40_low20_8;
mov u_335_344 r_335_343;
mov v_335_344 s_335_343;

subs dc neg_g_295_low60_40_low20_9 neg_g_295_low60_40_low20_8 neg_f_295_low60_40_low20_8;
asr neg_g_295_low60_40_low20_9 neg_g_295_low60_40_low20_9 1;
subs dc r_335_344 r_335_343 u_335_343;
asr r_335_344 r_335_344 1;
subs dc s_335_344 s_335_343 v_335_343;
asr s_335_344 s_335_344 1;
assert
    true
&&
    neg_f_295_low60_40_low20_9 = neg_g_295_low60_40_low20_8,
    u_335_344 = r_335_343,
    v_335_344 = s_335_343,
    neg_g_295_low60_40_low20_9 * (const 64 2) = neg_g_295_low60_40_low20_8 - neg_f_295_low60_40_low20_8,
    r_335_344 * (const 64 2) = r_335_343 - u_335_343,
    s_335_344 * (const 64 2) = s_335_343 - v_335_343
;

assume
    neg_f_295_low60_40_low20_9 = neg_g_295_low60_40_low20_8,
    u_335_344 = r_335_343,
    v_335_344 = s_335_343,
    neg_g_295_low60_40_low20_9 * 2 = neg_g_295_low60_40_low20_8 - neg_f_295_low60_40_low20_8,
    r_335_344 * 2 = r_335_343 - u_335_343,
    s_335_344 * 2 = s_335_343 - v_335_343
&&
    true
;

{
    u_335_344 * neg_f_295_low60_40_low20_0 + v_335_344 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_344 * neg_f_295_low60_40_low20_0 + s_335_344 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_9 + u_335_344 * (const 64 (2**21)) + v_335_344 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_9 + r_335_344 * (const 64 (2**21)) + s_335_344 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_9,
    neg_f_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_9,
    neg_g_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 344)) <=s delta, delta <=s (const 64 (1 + 2*344)),
    (const 64 (-(2**20))) <=s u_335_344, u_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_344, v_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_344, r_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_344, s_335_344 <=s (const 64 ((2**20)-1)),
    u_335_344 + v_335_344 <=s (const 64 (2**20)),
    u_335_344 - v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 + v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 - v_335_344 <=s (const 64 (2**20)),
    r_335_344 + s_335_344 <=s (const 64 (2**20)),
    r_335_344 - s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 + s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 - s_335_344 <=s (const 64 (2**20)),
    u_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_335_344 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_344_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_9,
sint64 neg_g_295_low60_40_low20_9,
sint64 neg_f_295_low60_40_low20_10,
sint64 neg_g_295_low60_40_low20_10,
sint64 u_335_344,
sint64 v_335_344,
sint64 r_335_344,
sint64 s_335_344,
sint64 u_335_345,
sint64 v_335_345,
sint64 r_335_345,
sint64 s_335_345,
bit ne
)={
    u_335_344 * neg_f_295_low60_40_low20_0 + v_335_344 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_9 * (-(2**20)),
    r_335_344 * neg_f_295_low60_40_low20_0 + s_335_344 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_9 * (-(2**20))
&&
    u_335_344 * neg_f_295_low60_40_low20_0 + v_335_344 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_9 * (const 64 (-(2**20))),
    r_335_344 * neg_f_295_low60_40_low20_0 + s_335_344 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_9 + u_335_344 * (const 64 (2**21)) + v_335_344 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_9 + r_335_344 * (const 64 (2**21)) + s_335_344 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_9,
    neg_f_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_9,
    neg_g_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 344)) <=s delta, delta <=s (const 64 (1 + 2*344)),
    (const 64 (-(2**20))) <=s u_335_344, u_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_344, v_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_344, r_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_344, s_335_344 <=s (const 64 ((2**20)-1)),
    u_335_344 + v_335_344 <=s (const 64 (2**20)),
    u_335_344 - v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 + v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 - v_335_344 <=s (const 64 (2**20)),
    r_335_344 + s_335_344 <=s (const 64 (2**20)),
    r_335_344 - s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 + s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 - s_335_344 <=s (const 64 (2**20)),
    u_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_335_344 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step344

// premise a
assume
neg_g_295_low60_40_low20_9 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_10 neg_f_295_low60_40_low20_9;
mov u_335_345 u_335_344;
mov v_335_345 v_335_344;

asr neg_g_295_low60_40_low20_10 neg_g_295_low60_40_low20_9 1;
asr r_335_345 r_335_344 1;
asr s_335_345 s_335_344 1;
assert
    true
&&
    neg_f_295_low60_40_low20_10 = neg_f_295_low60_40_low20_9,
    u_335_345 = u_335_344,
    v_335_345 = v_335_344,
    neg_g_295_low60_40_low20_10 * (const 64 2) = neg_g_295_low60_40_low20_9,
    r_335_345 * (const 64 2) = r_335_344,
    s_335_345 * (const 64 2) = s_335_344
;

assume
    neg_f_295_low60_40_low20_10 = neg_f_295_low60_40_low20_9,
    u_335_345 = u_335_344,
    v_335_345 = v_335_344,
    neg_g_295_low60_40_low20_10 * 2 = neg_g_295_low60_40_low20_9,
    r_335_345 * 2 = r_335_344,
    s_335_345 * 2 = s_335_344
&&
    true
;

{
    u_335_345 * neg_f_295_low60_40_low20_0 + v_335_345 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_345 * neg_f_295_low60_40_low20_0 + s_335_345 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_10 + u_335_345 * (const 64 (2**21)) + v_335_345 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_10 + r_335_345 * (const 64 (2**21)) + s_335_345 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_10,
    neg_f_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_10,
    neg_g_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 345)) <=s delta, delta <=s (const 64 (1 + 2*345)),
    (const 64 (-(2**20))) <=s u_335_345, u_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_345, v_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_345, r_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_345, s_335_345 <=s (const 64 ((2**20)-1)),
    u_335_345 + v_335_345 <=s (const 64 (2**20)),
    u_335_345 - v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 + v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 - v_335_345 <=s (const 64 (2**20)),
    r_335_345 + s_335_345 <=s (const 64 (2**20)),
    r_335_345 - s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 + s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 - s_335_345 <=s (const 64 (2**20)),
    u_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_335_345 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_344_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_9,
sint64 neg_g_295_low60_40_low20_9,
sint64 neg_f_295_low60_40_low20_10,
sint64 neg_g_295_low60_40_low20_10,
sint64 u_335_344,
sint64 v_335_344,
sint64 r_335_344,
sint64 s_335_344,
sint64 u_335_345,
sint64 v_335_345,
sint64 r_335_345,
sint64 s_335_345,
bit ne
)={
    u_335_344 * neg_f_295_low60_40_low20_0 + v_335_344 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_9 * (-(2**20)),
    r_335_344 * neg_f_295_low60_40_low20_0 + s_335_344 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_9 * (-(2**20))
&&
    u_335_344 * neg_f_295_low60_40_low20_0 + v_335_344 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_9 * (const 64 (-(2**20))),
    r_335_344 * neg_f_295_low60_40_low20_0 + s_335_344 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_9 + u_335_344 * (const 64 (2**21)) + v_335_344 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_9 + r_335_344 * (const 64 (2**21)) + s_335_344 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_9,
    neg_f_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_9,
    neg_g_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 344)) <=s delta, delta <=s (const 64 (1 + 2*344)),
    (const 64 (-(2**20))) <=s u_335_344, u_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_344, v_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_344, r_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_344, s_335_344 <=s (const 64 ((2**20)-1)),
    u_335_344 + v_335_344 <=s (const 64 (2**20)),
    u_335_344 - v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 + v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 - v_335_344 <=s (const 64 (2**20)),
    r_335_344 + s_335_344 <=s (const 64 (2**20)),
    r_335_344 - s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 + s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 - s_335_344 <=s (const 64 (2**20)),
    u_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_335_344 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step344

// premise b
assume
neg_g_295_low60_40_low20_9 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_10 neg_f_295_low60_40_low20_9;
mov u_335_345 u_335_344;
mov v_335_345 v_335_344;

add neg_g_295_low60_40_low20_10 neg_g_295_low60_40_low20_9 neg_f_295_low60_40_low20_9;
asr neg_g_295_low60_40_low20_10 neg_g_295_low60_40_low20_10 1;
add r_335_345 r_335_344 u_335_344;
asr r_335_345 r_335_345 1;
add s_335_345 s_335_344 v_335_344;
asr s_335_345 s_335_345 1;
assert
    true
&&
    neg_f_295_low60_40_low20_10 = neg_f_295_low60_40_low20_9,
    u_335_345 = u_335_344,
    v_335_345 = v_335_344,
    neg_g_295_low60_40_low20_10 * (const 64 2) = neg_g_295_low60_40_low20_9 + neg_f_295_low60_40_low20_9,
    r_335_345 * (const 64 2) = r_335_344 + u_335_344,
    s_335_345 * (const 64 2) = s_335_344 + v_335_344
;

assume
    neg_f_295_low60_40_low20_10 = neg_f_295_low60_40_low20_9,
    u_335_345 = u_335_344,
    v_335_345 = v_335_344,
    neg_g_295_low60_40_low20_10 * 2 = neg_g_295_low60_40_low20_9 + neg_f_295_low60_40_low20_9,
    r_335_345 * 2 = r_335_344 + u_335_344,
    s_335_345 * 2 = s_335_344 + v_335_344
&&
    true
;

{
    u_335_345 * neg_f_295_low60_40_low20_0 + v_335_345 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_345 * neg_f_295_low60_40_low20_0 + s_335_345 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_10 + u_335_345 * (const 64 (2**21)) + v_335_345 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_10 + r_335_345 * (const 64 (2**21)) + s_335_345 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_10,
    neg_f_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_10,
    neg_g_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 345)) <=s delta, delta <=s (const 64 (1 + 2*345)),
    (const 64 (-(2**20))) <=s u_335_345, u_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_345, v_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_345, r_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_345, s_335_345 <=s (const 64 ((2**20)-1)),
    u_335_345 + v_335_345 <=s (const 64 (2**20)),
    u_335_345 - v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 + v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 - v_335_345 <=s (const 64 (2**20)),
    r_335_345 + s_335_345 <=s (const 64 (2**20)),
    r_335_345 - s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 + s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 - s_335_345 <=s (const 64 (2**20)),
    u_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_335_345 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_344_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_9,
sint64 neg_g_295_low60_40_low20_9,
sint64 neg_f_295_low60_40_low20_10,
sint64 neg_g_295_low60_40_low20_10,
sint64 u_335_344,
sint64 v_335_344,
sint64 r_335_344,
sint64 s_335_344,
sint64 u_335_345,
sint64 v_335_345,
sint64 r_335_345,
sint64 s_335_345,
bit ne
)={
    u_335_344 * neg_f_295_low60_40_low20_0 + v_335_344 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_9 * (-(2**20)),
    r_335_344 * neg_f_295_low60_40_low20_0 + s_335_344 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_9 * (-(2**20))
&&
    u_335_344 * neg_f_295_low60_40_low20_0 + v_335_344 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_9 * (const 64 (-(2**20))),
    r_335_344 * neg_f_295_low60_40_low20_0 + s_335_344 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_9 + u_335_344 * (const 64 (2**21)) + v_335_344 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_9 + r_335_344 * (const 64 (2**21)) + s_335_344 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_9,
    neg_f_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_9,
    neg_g_295_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 344)) <=s delta, delta <=s (const 64 (1 + 2*344)),
    (const 64 (-(2**20))) <=s u_335_344, u_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_344, v_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_344, r_335_344 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_344, s_335_344 <=s (const 64 ((2**20)-1)),
    u_335_344 + v_335_344 <=s (const 64 (2**20)),
    u_335_344 - v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 + v_335_344 <=s (const 64 (2**20)),
    (const 64 0) - u_335_344 - v_335_344 <=s (const 64 (2**20)),
    r_335_344 + s_335_344 <=s (const 64 (2**20)),
    r_335_344 - s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 + s_335_344 <=s (const 64 (2**20)),
    (const 64 0) - r_335_344 - s_335_344 <=s (const 64 (2**20)),
    u_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_335_344 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_335_344 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step344

// premise c
assume
neg_g_295_low60_40_low20_9 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_10 neg_g_295_low60_40_low20_9;
mov u_335_345 r_335_344;
mov v_335_345 s_335_344;

subs dc neg_g_295_low60_40_low20_10 neg_g_295_low60_40_low20_9 neg_f_295_low60_40_low20_9;
asr neg_g_295_low60_40_low20_10 neg_g_295_low60_40_low20_10 1;
subs dc r_335_345 r_335_344 u_335_344;
asr r_335_345 r_335_345 1;
subs dc s_335_345 s_335_344 v_335_344;
asr s_335_345 s_335_345 1;
assert
    true
&&
    neg_f_295_low60_40_low20_10 = neg_g_295_low60_40_low20_9,
    u_335_345 = r_335_344,
    v_335_345 = s_335_344,
    neg_g_295_low60_40_low20_10 * (const 64 2) = neg_g_295_low60_40_low20_9 - neg_f_295_low60_40_low20_9,
    r_335_345 * (const 64 2) = r_335_344 - u_335_344,
    s_335_345 * (const 64 2) = s_335_344 - v_335_344
;

assume
    neg_f_295_low60_40_low20_10 = neg_g_295_low60_40_low20_9,
    u_335_345 = r_335_344,
    v_335_345 = s_335_344,
    neg_g_295_low60_40_low20_10 * 2 = neg_g_295_low60_40_low20_9 - neg_f_295_low60_40_low20_9,
    r_335_345 * 2 = r_335_344 - u_335_344,
    s_335_345 * 2 = s_335_344 - v_335_344
&&
    true
;

{
    u_335_345 * neg_f_295_low60_40_low20_0 + v_335_345 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_345 * neg_f_295_low60_40_low20_0 + s_335_345 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_10 + u_335_345 * (const 64 (2**21)) + v_335_345 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_10 + r_335_345 * (const 64 (2**21)) + s_335_345 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_10,
    neg_f_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_10,
    neg_g_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 345)) <=s delta, delta <=s (const 64 (1 + 2*345)),
    (const 64 (-(2**20))) <=s u_335_345, u_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_345, v_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_345, r_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_345, s_335_345 <=s (const 64 ((2**20)-1)),
    u_335_345 + v_335_345 <=s (const 64 (2**20)),
    u_335_345 - v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 + v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 - v_335_345 <=s (const 64 (2**20)),
    r_335_345 + s_335_345 <=s (const 64 (2**20)),
    r_335_345 - s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 + s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 - s_335_345 <=s (const 64 (2**20)),
    u_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_335_345 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_345_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_10,
sint64 neg_g_295_low60_40_low20_10,
sint64 neg_f_295_low60_40_low20_11,
sint64 neg_g_295_low60_40_low20_11,
sint64 u_335_345,
sint64 v_335_345,
sint64 r_335_345,
sint64 s_335_345,
sint64 u_335_346,
sint64 v_335_346,
sint64 r_335_346,
sint64 s_335_346,
bit ne
)={
    u_335_345 * neg_f_295_low60_40_low20_0 + v_335_345 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_10 * (-(2**20)),
    r_335_345 * neg_f_295_low60_40_low20_0 + s_335_345 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_10 * (-(2**20))
&&
    u_335_345 * neg_f_295_low60_40_low20_0 + v_335_345 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_10 * (const 64 (-(2**20))),
    r_335_345 * neg_f_295_low60_40_low20_0 + s_335_345 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_10 + u_335_345 * (const 64 (2**21)) + v_335_345 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_10 + r_335_345 * (const 64 (2**21)) + s_335_345 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_10,
    neg_f_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_10,
    neg_g_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 345)) <=s delta, delta <=s (const 64 (1 + 2*345)),
    (const 64 (-(2**20))) <=s u_335_345, u_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_345, v_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_345, r_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_345, s_335_345 <=s (const 64 ((2**20)-1)),
    u_335_345 + v_335_345 <=s (const 64 (2**20)),
    u_335_345 - v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 + v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 - v_335_345 <=s (const 64 (2**20)),
    r_335_345 + s_335_345 <=s (const 64 (2**20)),
    r_335_345 - s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 + s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 - s_335_345 <=s (const 64 (2**20)),
    u_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_335_345 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step345

// premise a
assume
neg_g_295_low60_40_low20_10 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_11 neg_f_295_low60_40_low20_10;
mov u_335_346 u_335_345;
mov v_335_346 v_335_345;

asr neg_g_295_low60_40_low20_11 neg_g_295_low60_40_low20_10 1;
asr r_335_346 r_335_345 1;
asr s_335_346 s_335_345 1;
assert
    true
&&
    neg_f_295_low60_40_low20_11 = neg_f_295_low60_40_low20_10,
    u_335_346 = u_335_345,
    v_335_346 = v_335_345,
    neg_g_295_low60_40_low20_11 * (const 64 2) = neg_g_295_low60_40_low20_10,
    r_335_346 * (const 64 2) = r_335_345,
    s_335_346 * (const 64 2) = s_335_345
;

assume
    neg_f_295_low60_40_low20_11 = neg_f_295_low60_40_low20_10,
    u_335_346 = u_335_345,
    v_335_346 = v_335_345,
    neg_g_295_low60_40_low20_11 * 2 = neg_g_295_low60_40_low20_10,
    r_335_346 * 2 = r_335_345,
    s_335_346 * 2 = s_335_345
&&
    true
;

{
    u_335_346 * neg_f_295_low60_40_low20_0 + v_335_346 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_346 * neg_f_295_low60_40_low20_0 + s_335_346 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_11 + u_335_346 * (const 64 (2**21)) + v_335_346 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_11 + r_335_346 * (const 64 (2**21)) + s_335_346 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_11,
    neg_f_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_11,
    neg_g_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 346)) <=s delta, delta <=s (const 64 (1 + 2*346)),
    (const 64 (-(2**20))) <=s u_335_346, u_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_346, v_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_346, r_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_346, s_335_346 <=s (const 64 ((2**20)-1)),
    u_335_346 + v_335_346 <=s (const 64 (2**20)),
    u_335_346 - v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 + v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 - v_335_346 <=s (const 64 (2**20)),
    r_335_346 + s_335_346 <=s (const 64 (2**20)),
    r_335_346 - s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 + s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 - s_335_346 <=s (const 64 (2**20)),
    u_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_335_346 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_345_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_10,
sint64 neg_g_295_low60_40_low20_10,
sint64 neg_f_295_low60_40_low20_11,
sint64 neg_g_295_low60_40_low20_11,
sint64 u_335_345,
sint64 v_335_345,
sint64 r_335_345,
sint64 s_335_345,
sint64 u_335_346,
sint64 v_335_346,
sint64 r_335_346,
sint64 s_335_346,
bit ne
)={
    u_335_345 * neg_f_295_low60_40_low20_0 + v_335_345 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_10 * (-(2**20)),
    r_335_345 * neg_f_295_low60_40_low20_0 + s_335_345 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_10 * (-(2**20))
&&
    u_335_345 * neg_f_295_low60_40_low20_0 + v_335_345 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_10 * (const 64 (-(2**20))),
    r_335_345 * neg_f_295_low60_40_low20_0 + s_335_345 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_10 + u_335_345 * (const 64 (2**21)) + v_335_345 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_10 + r_335_345 * (const 64 (2**21)) + s_335_345 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_10,
    neg_f_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_10,
    neg_g_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 345)) <=s delta, delta <=s (const 64 (1 + 2*345)),
    (const 64 (-(2**20))) <=s u_335_345, u_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_345, v_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_345, r_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_345, s_335_345 <=s (const 64 ((2**20)-1)),
    u_335_345 + v_335_345 <=s (const 64 (2**20)),
    u_335_345 - v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 + v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 - v_335_345 <=s (const 64 (2**20)),
    r_335_345 + s_335_345 <=s (const 64 (2**20)),
    r_335_345 - s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 + s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 - s_335_345 <=s (const 64 (2**20)),
    u_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_335_345 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step345

// premise b
assume
neg_g_295_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_11 neg_f_295_low60_40_low20_10;
mov u_335_346 u_335_345;
mov v_335_346 v_335_345;

add neg_g_295_low60_40_low20_11 neg_g_295_low60_40_low20_10 neg_f_295_low60_40_low20_10;
asr neg_g_295_low60_40_low20_11 neg_g_295_low60_40_low20_11 1;
add r_335_346 r_335_345 u_335_345;
asr r_335_346 r_335_346 1;
add s_335_346 s_335_345 v_335_345;
asr s_335_346 s_335_346 1;
assert
    true
&&
    neg_f_295_low60_40_low20_11 = neg_f_295_low60_40_low20_10,
    u_335_346 = u_335_345,
    v_335_346 = v_335_345,
    neg_g_295_low60_40_low20_11 * (const 64 2) = neg_g_295_low60_40_low20_10 + neg_f_295_low60_40_low20_10,
    r_335_346 * (const 64 2) = r_335_345 + u_335_345,
    s_335_346 * (const 64 2) = s_335_345 + v_335_345
;

assume
    neg_f_295_low60_40_low20_11 = neg_f_295_low60_40_low20_10,
    u_335_346 = u_335_345,
    v_335_346 = v_335_345,
    neg_g_295_low60_40_low20_11 * 2 = neg_g_295_low60_40_low20_10 + neg_f_295_low60_40_low20_10,
    r_335_346 * 2 = r_335_345 + u_335_345,
    s_335_346 * 2 = s_335_345 + v_335_345
&&
    true
;

{
    u_335_346 * neg_f_295_low60_40_low20_0 + v_335_346 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_346 * neg_f_295_low60_40_low20_0 + s_335_346 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_11 + u_335_346 * (const 64 (2**21)) + v_335_346 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_11 + r_335_346 * (const 64 (2**21)) + s_335_346 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_11,
    neg_f_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_11,
    neg_g_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 346)) <=s delta, delta <=s (const 64 (1 + 2*346)),
    (const 64 (-(2**20))) <=s u_335_346, u_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_346, v_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_346, r_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_346, s_335_346 <=s (const 64 ((2**20)-1)),
    u_335_346 + v_335_346 <=s (const 64 (2**20)),
    u_335_346 - v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 + v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 - v_335_346 <=s (const 64 (2**20)),
    r_335_346 + s_335_346 <=s (const 64 (2**20)),
    r_335_346 - s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 + s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 - s_335_346 <=s (const 64 (2**20)),
    u_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_335_346 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_345_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_10,
sint64 neg_g_295_low60_40_low20_10,
sint64 neg_f_295_low60_40_low20_11,
sint64 neg_g_295_low60_40_low20_11,
sint64 u_335_345,
sint64 v_335_345,
sint64 r_335_345,
sint64 s_335_345,
sint64 u_335_346,
sint64 v_335_346,
sint64 r_335_346,
sint64 s_335_346,
bit ne
)={
    u_335_345 * neg_f_295_low60_40_low20_0 + v_335_345 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_10 * (-(2**20)),
    r_335_345 * neg_f_295_low60_40_low20_0 + s_335_345 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_10 * (-(2**20))
&&
    u_335_345 * neg_f_295_low60_40_low20_0 + v_335_345 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_10 * (const 64 (-(2**20))),
    r_335_345 * neg_f_295_low60_40_low20_0 + s_335_345 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_10 + u_335_345 * (const 64 (2**21)) + v_335_345 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_10 + r_335_345 * (const 64 (2**21)) + s_335_345 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_10,
    neg_f_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_10,
    neg_g_295_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 345)) <=s delta, delta <=s (const 64 (1 + 2*345)),
    (const 64 (-(2**20))) <=s u_335_345, u_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_345, v_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_345, r_335_345 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_345, s_335_345 <=s (const 64 ((2**20)-1)),
    u_335_345 + v_335_345 <=s (const 64 (2**20)),
    u_335_345 - v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 + v_335_345 <=s (const 64 (2**20)),
    (const 64 0) - u_335_345 - v_335_345 <=s (const 64 (2**20)),
    r_335_345 + s_335_345 <=s (const 64 (2**20)),
    r_335_345 - s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 + s_335_345 <=s (const 64 (2**20)),
    (const 64 0) - r_335_345 - s_335_345 <=s (const 64 (2**20)),
    u_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_335_345 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_335_345 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step345

// premise c
assume
neg_g_295_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_11 neg_g_295_low60_40_low20_10;
mov u_335_346 r_335_345;
mov v_335_346 s_335_345;

subs dc neg_g_295_low60_40_low20_11 neg_g_295_low60_40_low20_10 neg_f_295_low60_40_low20_10;
asr neg_g_295_low60_40_low20_11 neg_g_295_low60_40_low20_11 1;
subs dc r_335_346 r_335_345 u_335_345;
asr r_335_346 r_335_346 1;
subs dc s_335_346 s_335_345 v_335_345;
asr s_335_346 s_335_346 1;
assert
    true
&&
    neg_f_295_low60_40_low20_11 = neg_g_295_low60_40_low20_10,
    u_335_346 = r_335_345,
    v_335_346 = s_335_345,
    neg_g_295_low60_40_low20_11 * (const 64 2) = neg_g_295_low60_40_low20_10 - neg_f_295_low60_40_low20_10,
    r_335_346 * (const 64 2) = r_335_345 - u_335_345,
    s_335_346 * (const 64 2) = s_335_345 - v_335_345
;

assume
    neg_f_295_low60_40_low20_11 = neg_g_295_low60_40_low20_10,
    u_335_346 = r_335_345,
    v_335_346 = s_335_345,
    neg_g_295_low60_40_low20_11 * 2 = neg_g_295_low60_40_low20_10 - neg_f_295_low60_40_low20_10,
    r_335_346 * 2 = r_335_345 - u_335_345,
    s_335_346 * 2 = s_335_345 - v_335_345
&&
    true
;

{
    u_335_346 * neg_f_295_low60_40_low20_0 + v_335_346 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_346 * neg_f_295_low60_40_low20_0 + s_335_346 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_11 + u_335_346 * (const 64 (2**21)) + v_335_346 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_11 + r_335_346 * (const 64 (2**21)) + s_335_346 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_11,
    neg_f_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_11,
    neg_g_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 346)) <=s delta, delta <=s (const 64 (1 + 2*346)),
    (const 64 (-(2**20))) <=s u_335_346, u_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_346, v_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_346, r_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_346, s_335_346 <=s (const 64 ((2**20)-1)),
    u_335_346 + v_335_346 <=s (const 64 (2**20)),
    u_335_346 - v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 + v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 - v_335_346 <=s (const 64 (2**20)),
    r_335_346 + s_335_346 <=s (const 64 (2**20)),
    r_335_346 - s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 + s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 - s_335_346 <=s (const 64 (2**20)),
    u_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_335_346 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_346_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_11,
sint64 neg_g_295_low60_40_low20_11,
sint64 neg_f_295_low60_40_low20_12,
sint64 neg_g_295_low60_40_low20_12,
sint64 u_335_346,
sint64 v_335_346,
sint64 r_335_346,
sint64 s_335_346,
sint64 u_335_347,
sint64 v_335_347,
sint64 r_335_347,
sint64 s_335_347,
bit ne
)={
    u_335_346 * neg_f_295_low60_40_low20_0 + v_335_346 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_11 * (-(2**20)),
    r_335_346 * neg_f_295_low60_40_low20_0 + s_335_346 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_11 * (-(2**20))
&&
    u_335_346 * neg_f_295_low60_40_low20_0 + v_335_346 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_11 * (const 64 (-(2**20))),
    r_335_346 * neg_f_295_low60_40_low20_0 + s_335_346 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_11 + u_335_346 * (const 64 (2**21)) + v_335_346 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_11 + r_335_346 * (const 64 (2**21)) + s_335_346 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_11,
    neg_f_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_11,
    neg_g_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 346)) <=s delta, delta <=s (const 64 (1 + 2*346)),
    (const 64 (-(2**20))) <=s u_335_346, u_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_346, v_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_346, r_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_346, s_335_346 <=s (const 64 ((2**20)-1)),
    u_335_346 + v_335_346 <=s (const 64 (2**20)),
    u_335_346 - v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 + v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 - v_335_346 <=s (const 64 (2**20)),
    r_335_346 + s_335_346 <=s (const 64 (2**20)),
    r_335_346 - s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 + s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 - s_335_346 <=s (const 64 (2**20)),
    u_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_335_346 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step346

// premise a
assume
neg_g_295_low60_40_low20_11 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_12 neg_f_295_low60_40_low20_11;
mov u_335_347 u_335_346;
mov v_335_347 v_335_346;

asr neg_g_295_low60_40_low20_12 neg_g_295_low60_40_low20_11 1;
asr r_335_347 r_335_346 1;
asr s_335_347 s_335_346 1;
assert
    true
&&
    neg_f_295_low60_40_low20_12 = neg_f_295_low60_40_low20_11,
    u_335_347 = u_335_346,
    v_335_347 = v_335_346,
    neg_g_295_low60_40_low20_12 * (const 64 2) = neg_g_295_low60_40_low20_11,
    r_335_347 * (const 64 2) = r_335_346,
    s_335_347 * (const 64 2) = s_335_346
;

assume
    neg_f_295_low60_40_low20_12 = neg_f_295_low60_40_low20_11,
    u_335_347 = u_335_346,
    v_335_347 = v_335_346,
    neg_g_295_low60_40_low20_12 * 2 = neg_g_295_low60_40_low20_11,
    r_335_347 * 2 = r_335_346,
    s_335_347 * 2 = s_335_346
&&
    true
;

{
    u_335_347 * neg_f_295_low60_40_low20_0 + v_335_347 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_347 * neg_f_295_low60_40_low20_0 + s_335_347 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_12 + u_335_347 * (const 64 (2**21)) + v_335_347 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_12 + r_335_347 * (const 64 (2**21)) + s_335_347 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_12,
    neg_f_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_12,
    neg_g_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 347)) <=s delta, delta <=s (const 64 (1 + 2*347)),
    (const 64 (-(2**20))) <=s u_335_347, u_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_347, v_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_347, r_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_347, s_335_347 <=s (const 64 ((2**20)-1)),
    u_335_347 + v_335_347 <=s (const 64 (2**20)),
    u_335_347 - v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 + v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 - v_335_347 <=s (const 64 (2**20)),
    r_335_347 + s_335_347 <=s (const 64 (2**20)),
    r_335_347 - s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 + s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 - s_335_347 <=s (const 64 (2**20)),
    u_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_335_347 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_346_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_11,
sint64 neg_g_295_low60_40_low20_11,
sint64 neg_f_295_low60_40_low20_12,
sint64 neg_g_295_low60_40_low20_12,
sint64 u_335_346,
sint64 v_335_346,
sint64 r_335_346,
sint64 s_335_346,
sint64 u_335_347,
sint64 v_335_347,
sint64 r_335_347,
sint64 s_335_347,
bit ne
)={
    u_335_346 * neg_f_295_low60_40_low20_0 + v_335_346 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_11 * (-(2**20)),
    r_335_346 * neg_f_295_low60_40_low20_0 + s_335_346 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_11 * (-(2**20))
&&
    u_335_346 * neg_f_295_low60_40_low20_0 + v_335_346 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_11 * (const 64 (-(2**20))),
    r_335_346 * neg_f_295_low60_40_low20_0 + s_335_346 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_11 + u_335_346 * (const 64 (2**21)) + v_335_346 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_11 + r_335_346 * (const 64 (2**21)) + s_335_346 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_11,
    neg_f_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_11,
    neg_g_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 346)) <=s delta, delta <=s (const 64 (1 + 2*346)),
    (const 64 (-(2**20))) <=s u_335_346, u_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_346, v_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_346, r_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_346, s_335_346 <=s (const 64 ((2**20)-1)),
    u_335_346 + v_335_346 <=s (const 64 (2**20)),
    u_335_346 - v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 + v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 - v_335_346 <=s (const 64 (2**20)),
    r_335_346 + s_335_346 <=s (const 64 (2**20)),
    r_335_346 - s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 + s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 - s_335_346 <=s (const 64 (2**20)),
    u_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_335_346 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step346

// premise b
assume
neg_g_295_low60_40_low20_11 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_12 neg_f_295_low60_40_low20_11;
mov u_335_347 u_335_346;
mov v_335_347 v_335_346;

add neg_g_295_low60_40_low20_12 neg_g_295_low60_40_low20_11 neg_f_295_low60_40_low20_11;
asr neg_g_295_low60_40_low20_12 neg_g_295_low60_40_low20_12 1;
add r_335_347 r_335_346 u_335_346;
asr r_335_347 r_335_347 1;
add s_335_347 s_335_346 v_335_346;
asr s_335_347 s_335_347 1;
assert
    true
&&
    neg_f_295_low60_40_low20_12 = neg_f_295_low60_40_low20_11,
    u_335_347 = u_335_346,
    v_335_347 = v_335_346,
    neg_g_295_low60_40_low20_12 * (const 64 2) = neg_g_295_low60_40_low20_11 + neg_f_295_low60_40_low20_11,
    r_335_347 * (const 64 2) = r_335_346 + u_335_346,
    s_335_347 * (const 64 2) = s_335_346 + v_335_346
;

assume
    neg_f_295_low60_40_low20_12 = neg_f_295_low60_40_low20_11,
    u_335_347 = u_335_346,
    v_335_347 = v_335_346,
    neg_g_295_low60_40_low20_12 * 2 = neg_g_295_low60_40_low20_11 + neg_f_295_low60_40_low20_11,
    r_335_347 * 2 = r_335_346 + u_335_346,
    s_335_347 * 2 = s_335_346 + v_335_346
&&
    true
;

{
    u_335_347 * neg_f_295_low60_40_low20_0 + v_335_347 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_347 * neg_f_295_low60_40_low20_0 + s_335_347 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_12 + u_335_347 * (const 64 (2**21)) + v_335_347 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_12 + r_335_347 * (const 64 (2**21)) + s_335_347 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_12,
    neg_f_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_12,
    neg_g_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 347)) <=s delta, delta <=s (const 64 (1 + 2*347)),
    (const 64 (-(2**20))) <=s u_335_347, u_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_347, v_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_347, r_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_347, s_335_347 <=s (const 64 ((2**20)-1)),
    u_335_347 + v_335_347 <=s (const 64 (2**20)),
    u_335_347 - v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 + v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 - v_335_347 <=s (const 64 (2**20)),
    r_335_347 + s_335_347 <=s (const 64 (2**20)),
    r_335_347 - s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 + s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 - s_335_347 <=s (const 64 (2**20)),
    u_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_335_347 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_346_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_11,
sint64 neg_g_295_low60_40_low20_11,
sint64 neg_f_295_low60_40_low20_12,
sint64 neg_g_295_low60_40_low20_12,
sint64 u_335_346,
sint64 v_335_346,
sint64 r_335_346,
sint64 s_335_346,
sint64 u_335_347,
sint64 v_335_347,
sint64 r_335_347,
sint64 s_335_347,
bit ne
)={
    u_335_346 * neg_f_295_low60_40_low20_0 + v_335_346 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_11 * (-(2**20)),
    r_335_346 * neg_f_295_low60_40_low20_0 + s_335_346 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_11 * (-(2**20))
&&
    u_335_346 * neg_f_295_low60_40_low20_0 + v_335_346 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_11 * (const 64 (-(2**20))),
    r_335_346 * neg_f_295_low60_40_low20_0 + s_335_346 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_11 + u_335_346 * (const 64 (2**21)) + v_335_346 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_11 + r_335_346 * (const 64 (2**21)) + s_335_346 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_11,
    neg_f_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_11,
    neg_g_295_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 346)) <=s delta, delta <=s (const 64 (1 + 2*346)),
    (const 64 (-(2**20))) <=s u_335_346, u_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_346, v_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_346, r_335_346 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_346, s_335_346 <=s (const 64 ((2**20)-1)),
    u_335_346 + v_335_346 <=s (const 64 (2**20)),
    u_335_346 - v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 + v_335_346 <=s (const 64 (2**20)),
    (const 64 0) - u_335_346 - v_335_346 <=s (const 64 (2**20)),
    r_335_346 + s_335_346 <=s (const 64 (2**20)),
    r_335_346 - s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 + s_335_346 <=s (const 64 (2**20)),
    (const 64 0) - r_335_346 - s_335_346 <=s (const 64 (2**20)),
    u_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_335_346 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_335_346 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step346

// premise c
assume
neg_g_295_low60_40_low20_11 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_12 neg_g_295_low60_40_low20_11;
mov u_335_347 r_335_346;
mov v_335_347 s_335_346;

subs dc neg_g_295_low60_40_low20_12 neg_g_295_low60_40_low20_11 neg_f_295_low60_40_low20_11;
asr neg_g_295_low60_40_low20_12 neg_g_295_low60_40_low20_12 1;
subs dc r_335_347 r_335_346 u_335_346;
asr r_335_347 r_335_347 1;
subs dc s_335_347 s_335_346 v_335_346;
asr s_335_347 s_335_347 1;
assert
    true
&&
    neg_f_295_low60_40_low20_12 = neg_g_295_low60_40_low20_11,
    u_335_347 = r_335_346,
    v_335_347 = s_335_346,
    neg_g_295_low60_40_low20_12 * (const 64 2) = neg_g_295_low60_40_low20_11 - neg_f_295_low60_40_low20_11,
    r_335_347 * (const 64 2) = r_335_346 - u_335_346,
    s_335_347 * (const 64 2) = s_335_346 - v_335_346
;

assume
    neg_f_295_low60_40_low20_12 = neg_g_295_low60_40_low20_11,
    u_335_347 = r_335_346,
    v_335_347 = s_335_346,
    neg_g_295_low60_40_low20_12 * 2 = neg_g_295_low60_40_low20_11 - neg_f_295_low60_40_low20_11,
    r_335_347 * 2 = r_335_346 - u_335_346,
    s_335_347 * 2 = s_335_346 - v_335_346
&&
    true
;

{
    u_335_347 * neg_f_295_low60_40_low20_0 + v_335_347 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_347 * neg_f_295_low60_40_low20_0 + s_335_347 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_12 + u_335_347 * (const 64 (2**21)) + v_335_347 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_12 + r_335_347 * (const 64 (2**21)) + s_335_347 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_12,
    neg_f_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_12,
    neg_g_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 347)) <=s delta, delta <=s (const 64 (1 + 2*347)),
    (const 64 (-(2**20))) <=s u_335_347, u_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_347, v_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_347, r_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_347, s_335_347 <=s (const 64 ((2**20)-1)),
    u_335_347 + v_335_347 <=s (const 64 (2**20)),
    u_335_347 - v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 + v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 - v_335_347 <=s (const 64 (2**20)),
    r_335_347 + s_335_347 <=s (const 64 (2**20)),
    r_335_347 - s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 + s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 - s_335_347 <=s (const 64 (2**20)),
    u_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_335_347 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_347_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_12,
sint64 neg_g_295_low60_40_low20_12,
sint64 neg_f_295_low60_40_low20_13,
sint64 neg_g_295_low60_40_low20_13,
sint64 u_335_347,
sint64 v_335_347,
sint64 r_335_347,
sint64 s_335_347,
sint64 u_335_348,
sint64 v_335_348,
sint64 r_335_348,
sint64 s_335_348,
bit ne
)={
    u_335_347 * neg_f_295_low60_40_low20_0 + v_335_347 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_12 * (-(2**20)),
    r_335_347 * neg_f_295_low60_40_low20_0 + s_335_347 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_12 * (-(2**20))
&&
    u_335_347 * neg_f_295_low60_40_low20_0 + v_335_347 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_12 * (const 64 (-(2**20))),
    r_335_347 * neg_f_295_low60_40_low20_0 + s_335_347 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_12 + u_335_347 * (const 64 (2**21)) + v_335_347 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_12 + r_335_347 * (const 64 (2**21)) + s_335_347 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_12,
    neg_f_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_12,
    neg_g_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 347)) <=s delta, delta <=s (const 64 (1 + 2*347)),
    (const 64 (-(2**20))) <=s u_335_347, u_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_347, v_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_347, r_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_347, s_335_347 <=s (const 64 ((2**20)-1)),
    u_335_347 + v_335_347 <=s (const 64 (2**20)),
    u_335_347 - v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 + v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 - v_335_347 <=s (const 64 (2**20)),
    r_335_347 + s_335_347 <=s (const 64 (2**20)),
    r_335_347 - s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 + s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 - s_335_347 <=s (const 64 (2**20)),
    u_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_335_347 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step347

// premise a
assume
neg_g_295_low60_40_low20_12 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_13 neg_f_295_low60_40_low20_12;
mov u_335_348 u_335_347;
mov v_335_348 v_335_347;

asr neg_g_295_low60_40_low20_13 neg_g_295_low60_40_low20_12 1;
asr r_335_348 r_335_347 1;
asr s_335_348 s_335_347 1;
assert
    true
&&
    neg_f_295_low60_40_low20_13 = neg_f_295_low60_40_low20_12,
    u_335_348 = u_335_347,
    v_335_348 = v_335_347,
    neg_g_295_low60_40_low20_13 * (const 64 2) = neg_g_295_low60_40_low20_12,
    r_335_348 * (const 64 2) = r_335_347,
    s_335_348 * (const 64 2) = s_335_347
;

assume
    neg_f_295_low60_40_low20_13 = neg_f_295_low60_40_low20_12,
    u_335_348 = u_335_347,
    v_335_348 = v_335_347,
    neg_g_295_low60_40_low20_13 * 2 = neg_g_295_low60_40_low20_12,
    r_335_348 * 2 = r_335_347,
    s_335_348 * 2 = s_335_347
&&
    true
;

{
    u_335_348 * neg_f_295_low60_40_low20_0 + v_335_348 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_348 * neg_f_295_low60_40_low20_0 + s_335_348 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_13 + u_335_348 * (const 64 (2**21)) + v_335_348 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_13 + r_335_348 * (const 64 (2**21)) + s_335_348 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_13,
    neg_f_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_13,
    neg_g_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 348)) <=s delta, delta <=s (const 64 (1 + 2*348)),
    (const 64 (-(2**20))) <=s u_335_348, u_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_348, v_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_348, r_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_348, s_335_348 <=s (const 64 ((2**20)-1)),
    u_335_348 + v_335_348 <=s (const 64 (2**20)),
    u_335_348 - v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 + v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 - v_335_348 <=s (const 64 (2**20)),
    r_335_348 + s_335_348 <=s (const 64 (2**20)),
    r_335_348 - s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 + s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 - s_335_348 <=s (const 64 (2**20)),
    u_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_335_348 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_347_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_12,
sint64 neg_g_295_low60_40_low20_12,
sint64 neg_f_295_low60_40_low20_13,
sint64 neg_g_295_low60_40_low20_13,
sint64 u_335_347,
sint64 v_335_347,
sint64 r_335_347,
sint64 s_335_347,
sint64 u_335_348,
sint64 v_335_348,
sint64 r_335_348,
sint64 s_335_348,
bit ne
)={
    u_335_347 * neg_f_295_low60_40_low20_0 + v_335_347 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_12 * (-(2**20)),
    r_335_347 * neg_f_295_low60_40_low20_0 + s_335_347 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_12 * (-(2**20))
&&
    u_335_347 * neg_f_295_low60_40_low20_0 + v_335_347 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_12 * (const 64 (-(2**20))),
    r_335_347 * neg_f_295_low60_40_low20_0 + s_335_347 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_12 + u_335_347 * (const 64 (2**21)) + v_335_347 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_12 + r_335_347 * (const 64 (2**21)) + s_335_347 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_12,
    neg_f_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_12,
    neg_g_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 347)) <=s delta, delta <=s (const 64 (1 + 2*347)),
    (const 64 (-(2**20))) <=s u_335_347, u_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_347, v_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_347, r_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_347, s_335_347 <=s (const 64 ((2**20)-1)),
    u_335_347 + v_335_347 <=s (const 64 (2**20)),
    u_335_347 - v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 + v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 - v_335_347 <=s (const 64 (2**20)),
    r_335_347 + s_335_347 <=s (const 64 (2**20)),
    r_335_347 - s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 + s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 - s_335_347 <=s (const 64 (2**20)),
    u_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_335_347 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step347

// premise b
assume
neg_g_295_low60_40_low20_12 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_13 neg_f_295_low60_40_low20_12;
mov u_335_348 u_335_347;
mov v_335_348 v_335_347;

add neg_g_295_low60_40_low20_13 neg_g_295_low60_40_low20_12 neg_f_295_low60_40_low20_12;
asr neg_g_295_low60_40_low20_13 neg_g_295_low60_40_low20_13 1;
add r_335_348 r_335_347 u_335_347;
asr r_335_348 r_335_348 1;
add s_335_348 s_335_347 v_335_347;
asr s_335_348 s_335_348 1;
assert
    true
&&
    neg_f_295_low60_40_low20_13 = neg_f_295_low60_40_low20_12,
    u_335_348 = u_335_347,
    v_335_348 = v_335_347,
    neg_g_295_low60_40_low20_13 * (const 64 2) = neg_g_295_low60_40_low20_12 + neg_f_295_low60_40_low20_12,
    r_335_348 * (const 64 2) = r_335_347 + u_335_347,
    s_335_348 * (const 64 2) = s_335_347 + v_335_347
;

assume
    neg_f_295_low60_40_low20_13 = neg_f_295_low60_40_low20_12,
    u_335_348 = u_335_347,
    v_335_348 = v_335_347,
    neg_g_295_low60_40_low20_13 * 2 = neg_g_295_low60_40_low20_12 + neg_f_295_low60_40_low20_12,
    r_335_348 * 2 = r_335_347 + u_335_347,
    s_335_348 * 2 = s_335_347 + v_335_347
&&
    true
;

{
    u_335_348 * neg_f_295_low60_40_low20_0 + v_335_348 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_348 * neg_f_295_low60_40_low20_0 + s_335_348 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_13 + u_335_348 * (const 64 (2**21)) + v_335_348 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_13 + r_335_348 * (const 64 (2**21)) + s_335_348 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_13,
    neg_f_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_13,
    neg_g_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 348)) <=s delta, delta <=s (const 64 (1 + 2*348)),
    (const 64 (-(2**20))) <=s u_335_348, u_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_348, v_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_348, r_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_348, s_335_348 <=s (const 64 ((2**20)-1)),
    u_335_348 + v_335_348 <=s (const 64 (2**20)),
    u_335_348 - v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 + v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 - v_335_348 <=s (const 64 (2**20)),
    r_335_348 + s_335_348 <=s (const 64 (2**20)),
    r_335_348 - s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 + s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 - s_335_348 <=s (const 64 (2**20)),
    u_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_335_348 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_347_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_12,
sint64 neg_g_295_low60_40_low20_12,
sint64 neg_f_295_low60_40_low20_13,
sint64 neg_g_295_low60_40_low20_13,
sint64 u_335_347,
sint64 v_335_347,
sint64 r_335_347,
sint64 s_335_347,
sint64 u_335_348,
sint64 v_335_348,
sint64 r_335_348,
sint64 s_335_348,
bit ne
)={
    u_335_347 * neg_f_295_low60_40_low20_0 + v_335_347 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_12 * (-(2**20)),
    r_335_347 * neg_f_295_low60_40_low20_0 + s_335_347 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_12 * (-(2**20))
&&
    u_335_347 * neg_f_295_low60_40_low20_0 + v_335_347 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_12 * (const 64 (-(2**20))),
    r_335_347 * neg_f_295_low60_40_low20_0 + s_335_347 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_12 + u_335_347 * (const 64 (2**21)) + v_335_347 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_12 + r_335_347 * (const 64 (2**21)) + s_335_347 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_12,
    neg_f_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_12,
    neg_g_295_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 347)) <=s delta, delta <=s (const 64 (1 + 2*347)),
    (const 64 (-(2**20))) <=s u_335_347, u_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_347, v_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_347, r_335_347 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_347, s_335_347 <=s (const 64 ((2**20)-1)),
    u_335_347 + v_335_347 <=s (const 64 (2**20)),
    u_335_347 - v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 + v_335_347 <=s (const 64 (2**20)),
    (const 64 0) - u_335_347 - v_335_347 <=s (const 64 (2**20)),
    r_335_347 + s_335_347 <=s (const 64 (2**20)),
    r_335_347 - s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 + s_335_347 <=s (const 64 (2**20)),
    (const 64 0) - r_335_347 - s_335_347 <=s (const 64 (2**20)),
    u_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_335_347 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_335_347 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step347

// premise c
assume
neg_g_295_low60_40_low20_12 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_13 neg_g_295_low60_40_low20_12;
mov u_335_348 r_335_347;
mov v_335_348 s_335_347;

subs dc neg_g_295_low60_40_low20_13 neg_g_295_low60_40_low20_12 neg_f_295_low60_40_low20_12;
asr neg_g_295_low60_40_low20_13 neg_g_295_low60_40_low20_13 1;
subs dc r_335_348 r_335_347 u_335_347;
asr r_335_348 r_335_348 1;
subs dc s_335_348 s_335_347 v_335_347;
asr s_335_348 s_335_348 1;
assert
    true
&&
    neg_f_295_low60_40_low20_13 = neg_g_295_low60_40_low20_12,
    u_335_348 = r_335_347,
    v_335_348 = s_335_347,
    neg_g_295_low60_40_low20_13 * (const 64 2) = neg_g_295_low60_40_low20_12 - neg_f_295_low60_40_low20_12,
    r_335_348 * (const 64 2) = r_335_347 - u_335_347,
    s_335_348 * (const 64 2) = s_335_347 - v_335_347
;

assume
    neg_f_295_low60_40_low20_13 = neg_g_295_low60_40_low20_12,
    u_335_348 = r_335_347,
    v_335_348 = s_335_347,
    neg_g_295_low60_40_low20_13 * 2 = neg_g_295_low60_40_low20_12 - neg_f_295_low60_40_low20_12,
    r_335_348 * 2 = r_335_347 - u_335_347,
    s_335_348 * 2 = s_335_347 - v_335_347
&&
    true
;

{
    u_335_348 * neg_f_295_low60_40_low20_0 + v_335_348 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_348 * neg_f_295_low60_40_low20_0 + s_335_348 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_13 + u_335_348 * (const 64 (2**21)) + v_335_348 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_13 + r_335_348 * (const 64 (2**21)) + s_335_348 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_13,
    neg_f_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_13,
    neg_g_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 348)) <=s delta, delta <=s (const 64 (1 + 2*348)),
    (const 64 (-(2**20))) <=s u_335_348, u_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_348, v_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_348, r_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_348, s_335_348 <=s (const 64 ((2**20)-1)),
    u_335_348 + v_335_348 <=s (const 64 (2**20)),
    u_335_348 - v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 + v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 - v_335_348 <=s (const 64 (2**20)),
    r_335_348 + s_335_348 <=s (const 64 (2**20)),
    r_335_348 - s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 + s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 - s_335_348 <=s (const 64 (2**20)),
    u_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_335_348 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_348_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_13,
sint64 neg_g_295_low60_40_low20_13,
sint64 neg_f_295_low60_40_low20_14,
sint64 neg_g_295_low60_40_low20_14,
sint64 u_335_348,
sint64 v_335_348,
sint64 r_335_348,
sint64 s_335_348,
sint64 u_335_349,
sint64 v_335_349,
sint64 r_335_349,
sint64 s_335_349,
bit ne
)={
    u_335_348 * neg_f_295_low60_40_low20_0 + v_335_348 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_13 * (-(2**20)),
    r_335_348 * neg_f_295_low60_40_low20_0 + s_335_348 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_13 * (-(2**20))
&&
    u_335_348 * neg_f_295_low60_40_low20_0 + v_335_348 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_13 * (const 64 (-(2**20))),
    r_335_348 * neg_f_295_low60_40_low20_0 + s_335_348 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_13 + u_335_348 * (const 64 (2**21)) + v_335_348 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_13 + r_335_348 * (const 64 (2**21)) + s_335_348 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_13,
    neg_f_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_13,
    neg_g_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 348)) <=s delta, delta <=s (const 64 (1 + 2*348)),
    (const 64 (-(2**20))) <=s u_335_348, u_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_348, v_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_348, r_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_348, s_335_348 <=s (const 64 ((2**20)-1)),
    u_335_348 + v_335_348 <=s (const 64 (2**20)),
    u_335_348 - v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 + v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 - v_335_348 <=s (const 64 (2**20)),
    r_335_348 + s_335_348 <=s (const 64 (2**20)),
    r_335_348 - s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 + s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 - s_335_348 <=s (const 64 (2**20)),
    u_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_335_348 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step348

// premise a
assume
neg_g_295_low60_40_low20_13 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_14 neg_f_295_low60_40_low20_13;
mov u_335_349 u_335_348;
mov v_335_349 v_335_348;

asr neg_g_295_low60_40_low20_14 neg_g_295_low60_40_low20_13 1;
asr r_335_349 r_335_348 1;
asr s_335_349 s_335_348 1;
assert
    true
&&
    neg_f_295_low60_40_low20_14 = neg_f_295_low60_40_low20_13,
    u_335_349 = u_335_348,
    v_335_349 = v_335_348,
    neg_g_295_low60_40_low20_14 * (const 64 2) = neg_g_295_low60_40_low20_13,
    r_335_349 * (const 64 2) = r_335_348,
    s_335_349 * (const 64 2) = s_335_348
;

assume
    neg_f_295_low60_40_low20_14 = neg_f_295_low60_40_low20_13,
    u_335_349 = u_335_348,
    v_335_349 = v_335_348,
    neg_g_295_low60_40_low20_14 * 2 = neg_g_295_low60_40_low20_13,
    r_335_349 * 2 = r_335_348,
    s_335_349 * 2 = s_335_348
&&
    true
;

{
    u_335_349 * neg_f_295_low60_40_low20_0 + v_335_349 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_349 * neg_f_295_low60_40_low20_0 + s_335_349 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_14 + u_335_349 * (const 64 (2**21)) + v_335_349 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_14 + r_335_349 * (const 64 (2**21)) + s_335_349 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_14,
    neg_f_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_14,
    neg_g_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 349)) <=s delta, delta <=s (const 64 (1 + 2*349)),
    (const 64 (-(2**20))) <=s u_335_349, u_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_349, v_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_349, r_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_349, s_335_349 <=s (const 64 ((2**20)-1)),
    u_335_349 + v_335_349 <=s (const 64 (2**20)),
    u_335_349 - v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 + v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 - v_335_349 <=s (const 64 (2**20)),
    r_335_349 + s_335_349 <=s (const 64 (2**20)),
    r_335_349 - s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 + s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 - s_335_349 <=s (const 64 (2**20)),
    u_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_335_349 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_348_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_13,
sint64 neg_g_295_low60_40_low20_13,
sint64 neg_f_295_low60_40_low20_14,
sint64 neg_g_295_low60_40_low20_14,
sint64 u_335_348,
sint64 v_335_348,
sint64 r_335_348,
sint64 s_335_348,
sint64 u_335_349,
sint64 v_335_349,
sint64 r_335_349,
sint64 s_335_349,
bit ne
)={
    u_335_348 * neg_f_295_low60_40_low20_0 + v_335_348 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_13 * (-(2**20)),
    r_335_348 * neg_f_295_low60_40_low20_0 + s_335_348 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_13 * (-(2**20))
&&
    u_335_348 * neg_f_295_low60_40_low20_0 + v_335_348 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_13 * (const 64 (-(2**20))),
    r_335_348 * neg_f_295_low60_40_low20_0 + s_335_348 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_13 + u_335_348 * (const 64 (2**21)) + v_335_348 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_13 + r_335_348 * (const 64 (2**21)) + s_335_348 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_13,
    neg_f_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_13,
    neg_g_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 348)) <=s delta, delta <=s (const 64 (1 + 2*348)),
    (const 64 (-(2**20))) <=s u_335_348, u_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_348, v_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_348, r_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_348, s_335_348 <=s (const 64 ((2**20)-1)),
    u_335_348 + v_335_348 <=s (const 64 (2**20)),
    u_335_348 - v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 + v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 - v_335_348 <=s (const 64 (2**20)),
    r_335_348 + s_335_348 <=s (const 64 (2**20)),
    r_335_348 - s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 + s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 - s_335_348 <=s (const 64 (2**20)),
    u_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_335_348 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step348

// premise b
assume
neg_g_295_low60_40_low20_13 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_14 neg_f_295_low60_40_low20_13;
mov u_335_349 u_335_348;
mov v_335_349 v_335_348;

add neg_g_295_low60_40_low20_14 neg_g_295_low60_40_low20_13 neg_f_295_low60_40_low20_13;
asr neg_g_295_low60_40_low20_14 neg_g_295_low60_40_low20_14 1;
add r_335_349 r_335_348 u_335_348;
asr r_335_349 r_335_349 1;
add s_335_349 s_335_348 v_335_348;
asr s_335_349 s_335_349 1;
assert
    true
&&
    neg_f_295_low60_40_low20_14 = neg_f_295_low60_40_low20_13,
    u_335_349 = u_335_348,
    v_335_349 = v_335_348,
    neg_g_295_low60_40_low20_14 * (const 64 2) = neg_g_295_low60_40_low20_13 + neg_f_295_low60_40_low20_13,
    r_335_349 * (const 64 2) = r_335_348 + u_335_348,
    s_335_349 * (const 64 2) = s_335_348 + v_335_348
;

assume
    neg_f_295_low60_40_low20_14 = neg_f_295_low60_40_low20_13,
    u_335_349 = u_335_348,
    v_335_349 = v_335_348,
    neg_g_295_low60_40_low20_14 * 2 = neg_g_295_low60_40_low20_13 + neg_f_295_low60_40_low20_13,
    r_335_349 * 2 = r_335_348 + u_335_348,
    s_335_349 * 2 = s_335_348 + v_335_348
&&
    true
;

{
    u_335_349 * neg_f_295_low60_40_low20_0 + v_335_349 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_349 * neg_f_295_low60_40_low20_0 + s_335_349 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_14 + u_335_349 * (const 64 (2**21)) + v_335_349 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_14 + r_335_349 * (const 64 (2**21)) + s_335_349 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_14,
    neg_f_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_14,
    neg_g_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 349)) <=s delta, delta <=s (const 64 (1 + 2*349)),
    (const 64 (-(2**20))) <=s u_335_349, u_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_349, v_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_349, r_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_349, s_335_349 <=s (const 64 ((2**20)-1)),
    u_335_349 + v_335_349 <=s (const 64 (2**20)),
    u_335_349 - v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 + v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 - v_335_349 <=s (const 64 (2**20)),
    r_335_349 + s_335_349 <=s (const 64 (2**20)),
    r_335_349 - s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 + s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 - s_335_349 <=s (const 64 (2**20)),
    u_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_335_349 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_348_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_13,
sint64 neg_g_295_low60_40_low20_13,
sint64 neg_f_295_low60_40_low20_14,
sint64 neg_g_295_low60_40_low20_14,
sint64 u_335_348,
sint64 v_335_348,
sint64 r_335_348,
sint64 s_335_348,
sint64 u_335_349,
sint64 v_335_349,
sint64 r_335_349,
sint64 s_335_349,
bit ne
)={
    u_335_348 * neg_f_295_low60_40_low20_0 + v_335_348 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_13 * (-(2**20)),
    r_335_348 * neg_f_295_low60_40_low20_0 + s_335_348 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_13 * (-(2**20))
&&
    u_335_348 * neg_f_295_low60_40_low20_0 + v_335_348 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_13 * (const 64 (-(2**20))),
    r_335_348 * neg_f_295_low60_40_low20_0 + s_335_348 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_13 + u_335_348 * (const 64 (2**21)) + v_335_348 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_13 + r_335_348 * (const 64 (2**21)) + s_335_348 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_13,
    neg_f_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_13,
    neg_g_295_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 348)) <=s delta, delta <=s (const 64 (1 + 2*348)),
    (const 64 (-(2**20))) <=s u_335_348, u_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_348, v_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_348, r_335_348 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_348, s_335_348 <=s (const 64 ((2**20)-1)),
    u_335_348 + v_335_348 <=s (const 64 (2**20)),
    u_335_348 - v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 + v_335_348 <=s (const 64 (2**20)),
    (const 64 0) - u_335_348 - v_335_348 <=s (const 64 (2**20)),
    r_335_348 + s_335_348 <=s (const 64 (2**20)),
    r_335_348 - s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 + s_335_348 <=s (const 64 (2**20)),
    (const 64 0) - r_335_348 - s_335_348 <=s (const 64 (2**20)),
    u_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_335_348 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_335_348 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step348

// premise c
assume
neg_g_295_low60_40_low20_13 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_14 neg_g_295_low60_40_low20_13;
mov u_335_349 r_335_348;
mov v_335_349 s_335_348;

subs dc neg_g_295_low60_40_low20_14 neg_g_295_low60_40_low20_13 neg_f_295_low60_40_low20_13;
asr neg_g_295_low60_40_low20_14 neg_g_295_low60_40_low20_14 1;
subs dc r_335_349 r_335_348 u_335_348;
asr r_335_349 r_335_349 1;
subs dc s_335_349 s_335_348 v_335_348;
asr s_335_349 s_335_349 1;
assert
    true
&&
    neg_f_295_low60_40_low20_14 = neg_g_295_low60_40_low20_13,
    u_335_349 = r_335_348,
    v_335_349 = s_335_348,
    neg_g_295_low60_40_low20_14 * (const 64 2) = neg_g_295_low60_40_low20_13 - neg_f_295_low60_40_low20_13,
    r_335_349 * (const 64 2) = r_335_348 - u_335_348,
    s_335_349 * (const 64 2) = s_335_348 - v_335_348
;

assume
    neg_f_295_low60_40_low20_14 = neg_g_295_low60_40_low20_13,
    u_335_349 = r_335_348,
    v_335_349 = s_335_348,
    neg_g_295_low60_40_low20_14 * 2 = neg_g_295_low60_40_low20_13 - neg_f_295_low60_40_low20_13,
    r_335_349 * 2 = r_335_348 - u_335_348,
    s_335_349 * 2 = s_335_348 - v_335_348
&&
    true
;

{
    u_335_349 * neg_f_295_low60_40_low20_0 + v_335_349 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_349 * neg_f_295_low60_40_low20_0 + s_335_349 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_14 + u_335_349 * (const 64 (2**21)) + v_335_349 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_14 + r_335_349 * (const 64 (2**21)) + s_335_349 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_14,
    neg_f_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_14,
    neg_g_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 349)) <=s delta, delta <=s (const 64 (1 + 2*349)),
    (const 64 (-(2**20))) <=s u_335_349, u_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_349, v_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_349, r_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_349, s_335_349 <=s (const 64 ((2**20)-1)),
    u_335_349 + v_335_349 <=s (const 64 (2**20)),
    u_335_349 - v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 + v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 - v_335_349 <=s (const 64 (2**20)),
    r_335_349 + s_335_349 <=s (const 64 (2**20)),
    r_335_349 - s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 + s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 - s_335_349 <=s (const 64 (2**20)),
    u_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_335_349 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_349_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_14,
sint64 neg_g_295_low60_40_low20_14,
sint64 neg_f_295_low60_40_low20_15,
sint64 neg_g_295_low60_40_low20_15,
sint64 u_335_349,
sint64 v_335_349,
sint64 r_335_349,
sint64 s_335_349,
sint64 u_335_350,
sint64 v_335_350,
sint64 r_335_350,
sint64 s_335_350,
bit ne
)={
    u_335_349 * neg_f_295_low60_40_low20_0 + v_335_349 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_14 * (-(2**20)),
    r_335_349 * neg_f_295_low60_40_low20_0 + s_335_349 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_14 * (-(2**20))
&&
    u_335_349 * neg_f_295_low60_40_low20_0 + v_335_349 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_14 * (const 64 (-(2**20))),
    r_335_349 * neg_f_295_low60_40_low20_0 + s_335_349 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_14 + u_335_349 * (const 64 (2**21)) + v_335_349 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_14 + r_335_349 * (const 64 (2**21)) + s_335_349 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_14,
    neg_f_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_14,
    neg_g_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 349)) <=s delta, delta <=s (const 64 (1 + 2*349)),
    (const 64 (-(2**20))) <=s u_335_349, u_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_349, v_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_349, r_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_349, s_335_349 <=s (const 64 ((2**20)-1)),
    u_335_349 + v_335_349 <=s (const 64 (2**20)),
    u_335_349 - v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 + v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 - v_335_349 <=s (const 64 (2**20)),
    r_335_349 + s_335_349 <=s (const 64 (2**20)),
    r_335_349 - s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 + s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 - s_335_349 <=s (const 64 (2**20)),
    u_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_335_349 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step349

// premise a
assume
neg_g_295_low60_40_low20_14 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_15 neg_f_295_low60_40_low20_14;
mov u_335_350 u_335_349;
mov v_335_350 v_335_349;

asr neg_g_295_low60_40_low20_15 neg_g_295_low60_40_low20_14 1;
asr r_335_350 r_335_349 1;
asr s_335_350 s_335_349 1;
assert
    true
&&
    neg_f_295_low60_40_low20_15 = neg_f_295_low60_40_low20_14,
    u_335_350 = u_335_349,
    v_335_350 = v_335_349,
    neg_g_295_low60_40_low20_15 * (const 64 2) = neg_g_295_low60_40_low20_14,
    r_335_350 * (const 64 2) = r_335_349,
    s_335_350 * (const 64 2) = s_335_349
;

assume
    neg_f_295_low60_40_low20_15 = neg_f_295_low60_40_low20_14,
    u_335_350 = u_335_349,
    v_335_350 = v_335_349,
    neg_g_295_low60_40_low20_15 * 2 = neg_g_295_low60_40_low20_14,
    r_335_350 * 2 = r_335_349,
    s_335_350 * 2 = s_335_349
&&
    true
;

{
    u_335_350 * neg_f_295_low60_40_low20_0 + v_335_350 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_350 * neg_f_295_low60_40_low20_0 + s_335_350 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_15 + u_335_350 * (const 64 (2**21)) + v_335_350 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_15 + r_335_350 * (const 64 (2**21)) + s_335_350 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_15,
    neg_f_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_15,
    neg_g_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 350)) <=s delta, delta <=s (const 64 (1 + 2*350)),
    (const 64 (-(2**20))) <=s u_335_350, u_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_350, v_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_350, r_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_350, s_335_350 <=s (const 64 ((2**20)-1)),
    u_335_350 + v_335_350 <=s (const 64 (2**20)),
    u_335_350 - v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 + v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 - v_335_350 <=s (const 64 (2**20)),
    r_335_350 + s_335_350 <=s (const 64 (2**20)),
    r_335_350 - s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 + s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 - s_335_350 <=s (const 64 (2**20)),
    u_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_335_350 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_349_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_14,
sint64 neg_g_295_low60_40_low20_14,
sint64 neg_f_295_low60_40_low20_15,
sint64 neg_g_295_low60_40_low20_15,
sint64 u_335_349,
sint64 v_335_349,
sint64 r_335_349,
sint64 s_335_349,
sint64 u_335_350,
sint64 v_335_350,
sint64 r_335_350,
sint64 s_335_350,
bit ne
)={
    u_335_349 * neg_f_295_low60_40_low20_0 + v_335_349 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_14 * (-(2**20)),
    r_335_349 * neg_f_295_low60_40_low20_0 + s_335_349 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_14 * (-(2**20))
&&
    u_335_349 * neg_f_295_low60_40_low20_0 + v_335_349 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_14 * (const 64 (-(2**20))),
    r_335_349 * neg_f_295_low60_40_low20_0 + s_335_349 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_14 + u_335_349 * (const 64 (2**21)) + v_335_349 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_14 + r_335_349 * (const 64 (2**21)) + s_335_349 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_14,
    neg_f_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_14,
    neg_g_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 349)) <=s delta, delta <=s (const 64 (1 + 2*349)),
    (const 64 (-(2**20))) <=s u_335_349, u_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_349, v_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_349, r_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_349, s_335_349 <=s (const 64 ((2**20)-1)),
    u_335_349 + v_335_349 <=s (const 64 (2**20)),
    u_335_349 - v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 + v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 - v_335_349 <=s (const 64 (2**20)),
    r_335_349 + s_335_349 <=s (const 64 (2**20)),
    r_335_349 - s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 + s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 - s_335_349 <=s (const 64 (2**20)),
    u_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_335_349 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step349

// premise b
assume
neg_g_295_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_15 neg_f_295_low60_40_low20_14;
mov u_335_350 u_335_349;
mov v_335_350 v_335_349;

add neg_g_295_low60_40_low20_15 neg_g_295_low60_40_low20_14 neg_f_295_low60_40_low20_14;
asr neg_g_295_low60_40_low20_15 neg_g_295_low60_40_low20_15 1;
add r_335_350 r_335_349 u_335_349;
asr r_335_350 r_335_350 1;
add s_335_350 s_335_349 v_335_349;
asr s_335_350 s_335_350 1;
assert
    true
&&
    neg_f_295_low60_40_low20_15 = neg_f_295_low60_40_low20_14,
    u_335_350 = u_335_349,
    v_335_350 = v_335_349,
    neg_g_295_low60_40_low20_15 * (const 64 2) = neg_g_295_low60_40_low20_14 + neg_f_295_low60_40_low20_14,
    r_335_350 * (const 64 2) = r_335_349 + u_335_349,
    s_335_350 * (const 64 2) = s_335_349 + v_335_349
;

assume
    neg_f_295_low60_40_low20_15 = neg_f_295_low60_40_low20_14,
    u_335_350 = u_335_349,
    v_335_350 = v_335_349,
    neg_g_295_low60_40_low20_15 * 2 = neg_g_295_low60_40_low20_14 + neg_f_295_low60_40_low20_14,
    r_335_350 * 2 = r_335_349 + u_335_349,
    s_335_350 * 2 = s_335_349 + v_335_349
&&
    true
;

{
    u_335_350 * neg_f_295_low60_40_low20_0 + v_335_350 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_350 * neg_f_295_low60_40_low20_0 + s_335_350 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_15 + u_335_350 * (const 64 (2**21)) + v_335_350 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_15 + r_335_350 * (const 64 (2**21)) + s_335_350 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_15,
    neg_f_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_15,
    neg_g_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 350)) <=s delta, delta <=s (const 64 (1 + 2*350)),
    (const 64 (-(2**20))) <=s u_335_350, u_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_350, v_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_350, r_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_350, s_335_350 <=s (const 64 ((2**20)-1)),
    u_335_350 + v_335_350 <=s (const 64 (2**20)),
    u_335_350 - v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 + v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 - v_335_350 <=s (const 64 (2**20)),
    r_335_350 + s_335_350 <=s (const 64 (2**20)),
    r_335_350 - s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 + s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 - s_335_350 <=s (const 64 (2**20)),
    u_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_335_350 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_349_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_14,
sint64 neg_g_295_low60_40_low20_14,
sint64 neg_f_295_low60_40_low20_15,
sint64 neg_g_295_low60_40_low20_15,
sint64 u_335_349,
sint64 v_335_349,
sint64 r_335_349,
sint64 s_335_349,
sint64 u_335_350,
sint64 v_335_350,
sint64 r_335_350,
sint64 s_335_350,
bit ne
)={
    u_335_349 * neg_f_295_low60_40_low20_0 + v_335_349 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_14 * (-(2**20)),
    r_335_349 * neg_f_295_low60_40_low20_0 + s_335_349 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_14 * (-(2**20))
&&
    u_335_349 * neg_f_295_low60_40_low20_0 + v_335_349 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_14 * (const 64 (-(2**20))),
    r_335_349 * neg_f_295_low60_40_low20_0 + s_335_349 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_14 + u_335_349 * (const 64 (2**21)) + v_335_349 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_14 + r_335_349 * (const 64 (2**21)) + s_335_349 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_14,
    neg_f_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_14,
    neg_g_295_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 349)) <=s delta, delta <=s (const 64 (1 + 2*349)),
    (const 64 (-(2**20))) <=s u_335_349, u_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_349, v_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_349, r_335_349 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_349, s_335_349 <=s (const 64 ((2**20)-1)),
    u_335_349 + v_335_349 <=s (const 64 (2**20)),
    u_335_349 - v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 + v_335_349 <=s (const 64 (2**20)),
    (const 64 0) - u_335_349 - v_335_349 <=s (const 64 (2**20)),
    r_335_349 + s_335_349 <=s (const 64 (2**20)),
    r_335_349 - s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 + s_335_349 <=s (const 64 (2**20)),
    (const 64 0) - r_335_349 - s_335_349 <=s (const 64 (2**20)),
    u_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_335_349 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_335_349 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step349

// premise c
assume
neg_g_295_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_15 neg_g_295_low60_40_low20_14;
mov u_335_350 r_335_349;
mov v_335_350 s_335_349;

subs dc neg_g_295_low60_40_low20_15 neg_g_295_low60_40_low20_14 neg_f_295_low60_40_low20_14;
asr neg_g_295_low60_40_low20_15 neg_g_295_low60_40_low20_15 1;
subs dc r_335_350 r_335_349 u_335_349;
asr r_335_350 r_335_350 1;
subs dc s_335_350 s_335_349 v_335_349;
asr s_335_350 s_335_350 1;
assert
    true
&&
    neg_f_295_low60_40_low20_15 = neg_g_295_low60_40_low20_14,
    u_335_350 = r_335_349,
    v_335_350 = s_335_349,
    neg_g_295_low60_40_low20_15 * (const 64 2) = neg_g_295_low60_40_low20_14 - neg_f_295_low60_40_low20_14,
    r_335_350 * (const 64 2) = r_335_349 - u_335_349,
    s_335_350 * (const 64 2) = s_335_349 - v_335_349
;

assume
    neg_f_295_low60_40_low20_15 = neg_g_295_low60_40_low20_14,
    u_335_350 = r_335_349,
    v_335_350 = s_335_349,
    neg_g_295_low60_40_low20_15 * 2 = neg_g_295_low60_40_low20_14 - neg_f_295_low60_40_low20_14,
    r_335_350 * 2 = r_335_349 - u_335_349,
    s_335_350 * 2 = s_335_349 - v_335_349
&&
    true
;

{
    u_335_350 * neg_f_295_low60_40_low20_0 + v_335_350 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_350 * neg_f_295_low60_40_low20_0 + s_335_350 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_15 + u_335_350 * (const 64 (2**21)) + v_335_350 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_15 + r_335_350 * (const 64 (2**21)) + s_335_350 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_15,
    neg_f_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_15,
    neg_g_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 350)) <=s delta, delta <=s (const 64 (1 + 2*350)),
    (const 64 (-(2**20))) <=s u_335_350, u_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_350, v_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_350, r_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_350, s_335_350 <=s (const 64 ((2**20)-1)),
    u_335_350 + v_335_350 <=s (const 64 (2**20)),
    u_335_350 - v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 + v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 - v_335_350 <=s (const 64 (2**20)),
    r_335_350 + s_335_350 <=s (const 64 (2**20)),
    r_335_350 - s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 + s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 - s_335_350 <=s (const 64 (2**20)),
    u_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_335_350 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_350_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_15,
sint64 neg_g_295_low60_40_low20_15,
sint64 neg_f_295_low60_40_low20_16,
sint64 neg_g_295_low60_40_low20_16,
sint64 u_335_350,
sint64 v_335_350,
sint64 r_335_350,
sint64 s_335_350,
sint64 u_335_351,
sint64 v_335_351,
sint64 r_335_351,
sint64 s_335_351,
bit ne
)={
    u_335_350 * neg_f_295_low60_40_low20_0 + v_335_350 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_15 * (-(2**20)),
    r_335_350 * neg_f_295_low60_40_low20_0 + s_335_350 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_15 * (-(2**20))
&&
    u_335_350 * neg_f_295_low60_40_low20_0 + v_335_350 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_15 * (const 64 (-(2**20))),
    r_335_350 * neg_f_295_low60_40_low20_0 + s_335_350 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_15 + u_335_350 * (const 64 (2**21)) + v_335_350 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_15 + r_335_350 * (const 64 (2**21)) + s_335_350 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_15,
    neg_f_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_15,
    neg_g_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 350)) <=s delta, delta <=s (const 64 (1 + 2*350)),
    (const 64 (-(2**20))) <=s u_335_350, u_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_350, v_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_350, r_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_350, s_335_350 <=s (const 64 ((2**20)-1)),
    u_335_350 + v_335_350 <=s (const 64 (2**20)),
    u_335_350 - v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 + v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 - v_335_350 <=s (const 64 (2**20)),
    r_335_350 + s_335_350 <=s (const 64 (2**20)),
    r_335_350 - s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 + s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 - s_335_350 <=s (const 64 (2**20)),
    u_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_335_350 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step350

// premise a
assume
neg_g_295_low60_40_low20_15 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_16 neg_f_295_low60_40_low20_15;
mov u_335_351 u_335_350;
mov v_335_351 v_335_350;

asr neg_g_295_low60_40_low20_16 neg_g_295_low60_40_low20_15 1;
asr r_335_351 r_335_350 1;
asr s_335_351 s_335_350 1;
assert
    true
&&
    neg_f_295_low60_40_low20_16 = neg_f_295_low60_40_low20_15,
    u_335_351 = u_335_350,
    v_335_351 = v_335_350,
    neg_g_295_low60_40_low20_16 * (const 64 2) = neg_g_295_low60_40_low20_15,
    r_335_351 * (const 64 2) = r_335_350,
    s_335_351 * (const 64 2) = s_335_350
;

assume
    neg_f_295_low60_40_low20_16 = neg_f_295_low60_40_low20_15,
    u_335_351 = u_335_350,
    v_335_351 = v_335_350,
    neg_g_295_low60_40_low20_16 * 2 = neg_g_295_low60_40_low20_15,
    r_335_351 * 2 = r_335_350,
    s_335_351 * 2 = s_335_350
&&
    true
;

{
    u_335_351 * neg_f_295_low60_40_low20_0 + v_335_351 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_351 * neg_f_295_low60_40_low20_0 + s_335_351 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_16 + u_335_351 * (const 64 (2**21)) + v_335_351 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_16 + r_335_351 * (const 64 (2**21)) + s_335_351 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_16,
    neg_f_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_16,
    neg_g_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 351)) <=s delta, delta <=s (const 64 (1 + 2*351)),
    (const 64 (-(2**20))) <=s u_335_351, u_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_351, v_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_351, r_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_351, s_335_351 <=s (const 64 ((2**20)-1)),
    u_335_351 + v_335_351 <=s (const 64 (2**20)),
    u_335_351 - v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 + v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 - v_335_351 <=s (const 64 (2**20)),
    r_335_351 + s_335_351 <=s (const 64 (2**20)),
    r_335_351 - s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 + s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 - s_335_351 <=s (const 64 (2**20)),
    u_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_335_351 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_350_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_15,
sint64 neg_g_295_low60_40_low20_15,
sint64 neg_f_295_low60_40_low20_16,
sint64 neg_g_295_low60_40_low20_16,
sint64 u_335_350,
sint64 v_335_350,
sint64 r_335_350,
sint64 s_335_350,
sint64 u_335_351,
sint64 v_335_351,
sint64 r_335_351,
sint64 s_335_351,
bit ne
)={
    u_335_350 * neg_f_295_low60_40_low20_0 + v_335_350 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_15 * (-(2**20)),
    r_335_350 * neg_f_295_low60_40_low20_0 + s_335_350 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_15 * (-(2**20))
&&
    u_335_350 * neg_f_295_low60_40_low20_0 + v_335_350 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_15 * (const 64 (-(2**20))),
    r_335_350 * neg_f_295_low60_40_low20_0 + s_335_350 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_15 + u_335_350 * (const 64 (2**21)) + v_335_350 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_15 + r_335_350 * (const 64 (2**21)) + s_335_350 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_15,
    neg_f_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_15,
    neg_g_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 350)) <=s delta, delta <=s (const 64 (1 + 2*350)),
    (const 64 (-(2**20))) <=s u_335_350, u_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_350, v_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_350, r_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_350, s_335_350 <=s (const 64 ((2**20)-1)),
    u_335_350 + v_335_350 <=s (const 64 (2**20)),
    u_335_350 - v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 + v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 - v_335_350 <=s (const 64 (2**20)),
    r_335_350 + s_335_350 <=s (const 64 (2**20)),
    r_335_350 - s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 + s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 - s_335_350 <=s (const 64 (2**20)),
    u_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_335_350 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step350

// premise b
assume
neg_g_295_low60_40_low20_15 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_16 neg_f_295_low60_40_low20_15;
mov u_335_351 u_335_350;
mov v_335_351 v_335_350;

add neg_g_295_low60_40_low20_16 neg_g_295_low60_40_low20_15 neg_f_295_low60_40_low20_15;
asr neg_g_295_low60_40_low20_16 neg_g_295_low60_40_low20_16 1;
add r_335_351 r_335_350 u_335_350;
asr r_335_351 r_335_351 1;
add s_335_351 s_335_350 v_335_350;
asr s_335_351 s_335_351 1;
assert
    true
&&
    neg_f_295_low60_40_low20_16 = neg_f_295_low60_40_low20_15,
    u_335_351 = u_335_350,
    v_335_351 = v_335_350,
    neg_g_295_low60_40_low20_16 * (const 64 2) = neg_g_295_low60_40_low20_15 + neg_f_295_low60_40_low20_15,
    r_335_351 * (const 64 2) = r_335_350 + u_335_350,
    s_335_351 * (const 64 2) = s_335_350 + v_335_350
;

assume
    neg_f_295_low60_40_low20_16 = neg_f_295_low60_40_low20_15,
    u_335_351 = u_335_350,
    v_335_351 = v_335_350,
    neg_g_295_low60_40_low20_16 * 2 = neg_g_295_low60_40_low20_15 + neg_f_295_low60_40_low20_15,
    r_335_351 * 2 = r_335_350 + u_335_350,
    s_335_351 * 2 = s_335_350 + v_335_350
&&
    true
;

{
    u_335_351 * neg_f_295_low60_40_low20_0 + v_335_351 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_351 * neg_f_295_low60_40_low20_0 + s_335_351 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_16 + u_335_351 * (const 64 (2**21)) + v_335_351 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_16 + r_335_351 * (const 64 (2**21)) + s_335_351 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_16,
    neg_f_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_16,
    neg_g_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 351)) <=s delta, delta <=s (const 64 (1 + 2*351)),
    (const 64 (-(2**20))) <=s u_335_351, u_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_351, v_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_351, r_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_351, s_335_351 <=s (const 64 ((2**20)-1)),
    u_335_351 + v_335_351 <=s (const 64 (2**20)),
    u_335_351 - v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 + v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 - v_335_351 <=s (const 64 (2**20)),
    r_335_351 + s_335_351 <=s (const 64 (2**20)),
    r_335_351 - s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 + s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 - s_335_351 <=s (const 64 (2**20)),
    u_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_335_351 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_350_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_15,
sint64 neg_g_295_low60_40_low20_15,
sint64 neg_f_295_low60_40_low20_16,
sint64 neg_g_295_low60_40_low20_16,
sint64 u_335_350,
sint64 v_335_350,
sint64 r_335_350,
sint64 s_335_350,
sint64 u_335_351,
sint64 v_335_351,
sint64 r_335_351,
sint64 s_335_351,
bit ne
)={
    u_335_350 * neg_f_295_low60_40_low20_0 + v_335_350 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_15 * (-(2**20)),
    r_335_350 * neg_f_295_low60_40_low20_0 + s_335_350 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_15 * (-(2**20))
&&
    u_335_350 * neg_f_295_low60_40_low20_0 + v_335_350 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_15 * (const 64 (-(2**20))),
    r_335_350 * neg_f_295_low60_40_low20_0 + s_335_350 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_15 + u_335_350 * (const 64 (2**21)) + v_335_350 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_15 + r_335_350 * (const 64 (2**21)) + s_335_350 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_15,
    neg_f_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_15,
    neg_g_295_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 350)) <=s delta, delta <=s (const 64 (1 + 2*350)),
    (const 64 (-(2**20))) <=s u_335_350, u_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_350, v_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_350, r_335_350 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_350, s_335_350 <=s (const 64 ((2**20)-1)),
    u_335_350 + v_335_350 <=s (const 64 (2**20)),
    u_335_350 - v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 + v_335_350 <=s (const 64 (2**20)),
    (const 64 0) - u_335_350 - v_335_350 <=s (const 64 (2**20)),
    r_335_350 + s_335_350 <=s (const 64 (2**20)),
    r_335_350 - s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 + s_335_350 <=s (const 64 (2**20)),
    (const 64 0) - r_335_350 - s_335_350 <=s (const 64 (2**20)),
    u_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_335_350 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_335_350 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step350

// premise c
assume
neg_g_295_low60_40_low20_15 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_16 neg_g_295_low60_40_low20_15;
mov u_335_351 r_335_350;
mov v_335_351 s_335_350;

subs dc neg_g_295_low60_40_low20_16 neg_g_295_low60_40_low20_15 neg_f_295_low60_40_low20_15;
asr neg_g_295_low60_40_low20_16 neg_g_295_low60_40_low20_16 1;
subs dc r_335_351 r_335_350 u_335_350;
asr r_335_351 r_335_351 1;
subs dc s_335_351 s_335_350 v_335_350;
asr s_335_351 s_335_351 1;
assert
    true
&&
    neg_f_295_low60_40_low20_16 = neg_g_295_low60_40_low20_15,
    u_335_351 = r_335_350,
    v_335_351 = s_335_350,
    neg_g_295_low60_40_low20_16 * (const 64 2) = neg_g_295_low60_40_low20_15 - neg_f_295_low60_40_low20_15,
    r_335_351 * (const 64 2) = r_335_350 - u_335_350,
    s_335_351 * (const 64 2) = s_335_350 - v_335_350
;

assume
    neg_f_295_low60_40_low20_16 = neg_g_295_low60_40_low20_15,
    u_335_351 = r_335_350,
    v_335_351 = s_335_350,
    neg_g_295_low60_40_low20_16 * 2 = neg_g_295_low60_40_low20_15 - neg_f_295_low60_40_low20_15,
    r_335_351 * 2 = r_335_350 - u_335_350,
    s_335_351 * 2 = s_335_350 - v_335_350
&&
    true
;

{
    u_335_351 * neg_f_295_low60_40_low20_0 + v_335_351 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_351 * neg_f_295_low60_40_low20_0 + s_335_351 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_16 + u_335_351 * (const 64 (2**21)) + v_335_351 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_16 + r_335_351 * (const 64 (2**21)) + s_335_351 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_16,
    neg_f_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_16,
    neg_g_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 351)) <=s delta, delta <=s (const 64 (1 + 2*351)),
    (const 64 (-(2**20))) <=s u_335_351, u_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_351, v_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_351, r_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_351, s_335_351 <=s (const 64 ((2**20)-1)),
    u_335_351 + v_335_351 <=s (const 64 (2**20)),
    u_335_351 - v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 + v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 - v_335_351 <=s (const 64 (2**20)),
    r_335_351 + s_335_351 <=s (const 64 (2**20)),
    r_335_351 - s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 + s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 - s_335_351 <=s (const 64 (2**20)),
    u_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_335_351 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_351_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_16,
sint64 neg_g_295_low60_40_low20_16,
sint64 neg_f_295_low60_40_low20_17,
sint64 neg_g_295_low60_40_low20_17,
sint64 u_335_351,
sint64 v_335_351,
sint64 r_335_351,
sint64 s_335_351,
sint64 u_335_352,
sint64 v_335_352,
sint64 r_335_352,
sint64 s_335_352,
bit ne
)={
    u_335_351 * neg_f_295_low60_40_low20_0 + v_335_351 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_16 * (-(2**20)),
    r_335_351 * neg_f_295_low60_40_low20_0 + s_335_351 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_16 * (-(2**20))
&&
    u_335_351 * neg_f_295_low60_40_low20_0 + v_335_351 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_16 * (const 64 (-(2**20))),
    r_335_351 * neg_f_295_low60_40_low20_0 + s_335_351 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_16 + u_335_351 * (const 64 (2**21)) + v_335_351 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_16 + r_335_351 * (const 64 (2**21)) + s_335_351 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_16,
    neg_f_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_16,
    neg_g_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 351)) <=s delta, delta <=s (const 64 (1 + 2*351)),
    (const 64 (-(2**20))) <=s u_335_351, u_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_351, v_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_351, r_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_351, s_335_351 <=s (const 64 ((2**20)-1)),
    u_335_351 + v_335_351 <=s (const 64 (2**20)),
    u_335_351 - v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 + v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 - v_335_351 <=s (const 64 (2**20)),
    r_335_351 + s_335_351 <=s (const 64 (2**20)),
    r_335_351 - s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 + s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 - s_335_351 <=s (const 64 (2**20)),
    u_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_335_351 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step351

// premise a
assume
neg_g_295_low60_40_low20_16 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_17 neg_f_295_low60_40_low20_16;
mov u_335_352 u_335_351;
mov v_335_352 v_335_351;

asr neg_g_295_low60_40_low20_17 neg_g_295_low60_40_low20_16 1;
asr r_335_352 r_335_351 1;
asr s_335_352 s_335_351 1;
assert
    true
&&
    neg_f_295_low60_40_low20_17 = neg_f_295_low60_40_low20_16,
    u_335_352 = u_335_351,
    v_335_352 = v_335_351,
    neg_g_295_low60_40_low20_17 * (const 64 2) = neg_g_295_low60_40_low20_16,
    r_335_352 * (const 64 2) = r_335_351,
    s_335_352 * (const 64 2) = s_335_351
;

assume
    neg_f_295_low60_40_low20_17 = neg_f_295_low60_40_low20_16,
    u_335_352 = u_335_351,
    v_335_352 = v_335_351,
    neg_g_295_low60_40_low20_17 * 2 = neg_g_295_low60_40_low20_16,
    r_335_352 * 2 = r_335_351,
    s_335_352 * 2 = s_335_351
&&
    true
;

{
    u_335_352 * neg_f_295_low60_40_low20_0 + v_335_352 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_352 * neg_f_295_low60_40_low20_0 + s_335_352 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_17 + u_335_352 * (const 64 (2**21)) + v_335_352 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_17 + r_335_352 * (const 64 (2**21)) + s_335_352 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_17,
    neg_f_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_17,
    neg_g_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 352)) <=s delta, delta <=s (const 64 (1 + 2*352)),
    (const 64 (-(2**20))) <=s u_335_352, u_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_352, v_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_352, r_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_352, s_335_352 <=s (const 64 ((2**20)-1)),
    u_335_352 + v_335_352 <=s (const 64 (2**20)),
    u_335_352 - v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 + v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 - v_335_352 <=s (const 64 (2**20)),
    r_335_352 + s_335_352 <=s (const 64 (2**20)),
    r_335_352 - s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 + s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 - s_335_352 <=s (const 64 (2**20)),
    u_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_335_352 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_351_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_16,
sint64 neg_g_295_low60_40_low20_16,
sint64 neg_f_295_low60_40_low20_17,
sint64 neg_g_295_low60_40_low20_17,
sint64 u_335_351,
sint64 v_335_351,
sint64 r_335_351,
sint64 s_335_351,
sint64 u_335_352,
sint64 v_335_352,
sint64 r_335_352,
sint64 s_335_352,
bit ne
)={
    u_335_351 * neg_f_295_low60_40_low20_0 + v_335_351 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_16 * (-(2**20)),
    r_335_351 * neg_f_295_low60_40_low20_0 + s_335_351 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_16 * (-(2**20))
&&
    u_335_351 * neg_f_295_low60_40_low20_0 + v_335_351 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_16 * (const 64 (-(2**20))),
    r_335_351 * neg_f_295_low60_40_low20_0 + s_335_351 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_16 + u_335_351 * (const 64 (2**21)) + v_335_351 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_16 + r_335_351 * (const 64 (2**21)) + s_335_351 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_16,
    neg_f_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_16,
    neg_g_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 351)) <=s delta, delta <=s (const 64 (1 + 2*351)),
    (const 64 (-(2**20))) <=s u_335_351, u_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_351, v_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_351, r_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_351, s_335_351 <=s (const 64 ((2**20)-1)),
    u_335_351 + v_335_351 <=s (const 64 (2**20)),
    u_335_351 - v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 + v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 - v_335_351 <=s (const 64 (2**20)),
    r_335_351 + s_335_351 <=s (const 64 (2**20)),
    r_335_351 - s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 + s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 - s_335_351 <=s (const 64 (2**20)),
    u_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_335_351 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step351

// premise b
assume
neg_g_295_low60_40_low20_16 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_17 neg_f_295_low60_40_low20_16;
mov u_335_352 u_335_351;
mov v_335_352 v_335_351;

add neg_g_295_low60_40_low20_17 neg_g_295_low60_40_low20_16 neg_f_295_low60_40_low20_16;
asr neg_g_295_low60_40_low20_17 neg_g_295_low60_40_low20_17 1;
add r_335_352 r_335_351 u_335_351;
asr r_335_352 r_335_352 1;
add s_335_352 s_335_351 v_335_351;
asr s_335_352 s_335_352 1;
assert
    true
&&
    neg_f_295_low60_40_low20_17 = neg_f_295_low60_40_low20_16,
    u_335_352 = u_335_351,
    v_335_352 = v_335_351,
    neg_g_295_low60_40_low20_17 * (const 64 2) = neg_g_295_low60_40_low20_16 + neg_f_295_low60_40_low20_16,
    r_335_352 * (const 64 2) = r_335_351 + u_335_351,
    s_335_352 * (const 64 2) = s_335_351 + v_335_351
;

assume
    neg_f_295_low60_40_low20_17 = neg_f_295_low60_40_low20_16,
    u_335_352 = u_335_351,
    v_335_352 = v_335_351,
    neg_g_295_low60_40_low20_17 * 2 = neg_g_295_low60_40_low20_16 + neg_f_295_low60_40_low20_16,
    r_335_352 * 2 = r_335_351 + u_335_351,
    s_335_352 * 2 = s_335_351 + v_335_351
&&
    true
;

{
    u_335_352 * neg_f_295_low60_40_low20_0 + v_335_352 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_352 * neg_f_295_low60_40_low20_0 + s_335_352 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_17 + u_335_352 * (const 64 (2**21)) + v_335_352 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_17 + r_335_352 * (const 64 (2**21)) + s_335_352 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_17,
    neg_f_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_17,
    neg_g_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 352)) <=s delta, delta <=s (const 64 (1 + 2*352)),
    (const 64 (-(2**20))) <=s u_335_352, u_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_352, v_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_352, r_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_352, s_335_352 <=s (const 64 ((2**20)-1)),
    u_335_352 + v_335_352 <=s (const 64 (2**20)),
    u_335_352 - v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 + v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 - v_335_352 <=s (const 64 (2**20)),
    r_335_352 + s_335_352 <=s (const 64 (2**20)),
    r_335_352 - s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 + s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 - s_335_352 <=s (const 64 (2**20)),
    u_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_335_352 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_351_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_16,
sint64 neg_g_295_low60_40_low20_16,
sint64 neg_f_295_low60_40_low20_17,
sint64 neg_g_295_low60_40_low20_17,
sint64 u_335_351,
sint64 v_335_351,
sint64 r_335_351,
sint64 s_335_351,
sint64 u_335_352,
sint64 v_335_352,
sint64 r_335_352,
sint64 s_335_352,
bit ne
)={
    u_335_351 * neg_f_295_low60_40_low20_0 + v_335_351 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_16 * (-(2**20)),
    r_335_351 * neg_f_295_low60_40_low20_0 + s_335_351 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_16 * (-(2**20))
&&
    u_335_351 * neg_f_295_low60_40_low20_0 + v_335_351 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_16 * (const 64 (-(2**20))),
    r_335_351 * neg_f_295_low60_40_low20_0 + s_335_351 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_16 + u_335_351 * (const 64 (2**21)) + v_335_351 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_16 + r_335_351 * (const 64 (2**21)) + s_335_351 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_16,
    neg_f_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_16,
    neg_g_295_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 351)) <=s delta, delta <=s (const 64 (1 + 2*351)),
    (const 64 (-(2**20))) <=s u_335_351, u_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_351, v_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_351, r_335_351 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_351, s_335_351 <=s (const 64 ((2**20)-1)),
    u_335_351 + v_335_351 <=s (const 64 (2**20)),
    u_335_351 - v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 + v_335_351 <=s (const 64 (2**20)),
    (const 64 0) - u_335_351 - v_335_351 <=s (const 64 (2**20)),
    r_335_351 + s_335_351 <=s (const 64 (2**20)),
    r_335_351 - s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 + s_335_351 <=s (const 64 (2**20)),
    (const 64 0) - r_335_351 - s_335_351 <=s (const 64 (2**20)),
    u_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_335_351 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_335_351 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step351

// premise c
assume
neg_g_295_low60_40_low20_16 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_17 neg_g_295_low60_40_low20_16;
mov u_335_352 r_335_351;
mov v_335_352 s_335_351;

subs dc neg_g_295_low60_40_low20_17 neg_g_295_low60_40_low20_16 neg_f_295_low60_40_low20_16;
asr neg_g_295_low60_40_low20_17 neg_g_295_low60_40_low20_17 1;
subs dc r_335_352 r_335_351 u_335_351;
asr r_335_352 r_335_352 1;
subs dc s_335_352 s_335_351 v_335_351;
asr s_335_352 s_335_352 1;
assert
    true
&&
    neg_f_295_low60_40_low20_17 = neg_g_295_low60_40_low20_16,
    u_335_352 = r_335_351,
    v_335_352 = s_335_351,
    neg_g_295_low60_40_low20_17 * (const 64 2) = neg_g_295_low60_40_low20_16 - neg_f_295_low60_40_low20_16,
    r_335_352 * (const 64 2) = r_335_351 - u_335_351,
    s_335_352 * (const 64 2) = s_335_351 - v_335_351
;

assume
    neg_f_295_low60_40_low20_17 = neg_g_295_low60_40_low20_16,
    u_335_352 = r_335_351,
    v_335_352 = s_335_351,
    neg_g_295_low60_40_low20_17 * 2 = neg_g_295_low60_40_low20_16 - neg_f_295_low60_40_low20_16,
    r_335_352 * 2 = r_335_351 - u_335_351,
    s_335_352 * 2 = s_335_351 - v_335_351
&&
    true
;

{
    u_335_352 * neg_f_295_low60_40_low20_0 + v_335_352 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_352 * neg_f_295_low60_40_low20_0 + s_335_352 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_17 + u_335_352 * (const 64 (2**21)) + v_335_352 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_17 + r_335_352 * (const 64 (2**21)) + s_335_352 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_17,
    neg_f_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_17,
    neg_g_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 352)) <=s delta, delta <=s (const 64 (1 + 2*352)),
    (const 64 (-(2**20))) <=s u_335_352, u_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_352, v_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_352, r_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_352, s_335_352 <=s (const 64 ((2**20)-1)),
    u_335_352 + v_335_352 <=s (const 64 (2**20)),
    u_335_352 - v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 + v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 - v_335_352 <=s (const 64 (2**20)),
    r_335_352 + s_335_352 <=s (const 64 (2**20)),
    r_335_352 - s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 + s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 - s_335_352 <=s (const 64 (2**20)),
    u_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_335_352 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_352_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_17,
sint64 neg_g_295_low60_40_low20_17,
sint64 neg_f_295_low60_40_low20_18,
sint64 neg_g_295_low60_40_low20_18,
sint64 u_335_352,
sint64 v_335_352,
sint64 r_335_352,
sint64 s_335_352,
sint64 u_335_353,
sint64 v_335_353,
sint64 r_335_353,
sint64 s_335_353,
bit ne
)={
    u_335_352 * neg_f_295_low60_40_low20_0 + v_335_352 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_17 * (-(2**20)),
    r_335_352 * neg_f_295_low60_40_low20_0 + s_335_352 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_17 * (-(2**20))
&&
    u_335_352 * neg_f_295_low60_40_low20_0 + v_335_352 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_17 * (const 64 (-(2**20))),
    r_335_352 * neg_f_295_low60_40_low20_0 + s_335_352 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_17 + u_335_352 * (const 64 (2**21)) + v_335_352 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_17 + r_335_352 * (const 64 (2**21)) + s_335_352 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_17,
    neg_f_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_17,
    neg_g_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 352)) <=s delta, delta <=s (const 64 (1 + 2*352)),
    (const 64 (-(2**20))) <=s u_335_352, u_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_352, v_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_352, r_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_352, s_335_352 <=s (const 64 ((2**20)-1)),
    u_335_352 + v_335_352 <=s (const 64 (2**20)),
    u_335_352 - v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 + v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 - v_335_352 <=s (const 64 (2**20)),
    r_335_352 + s_335_352 <=s (const 64 (2**20)),
    r_335_352 - s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 + s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 - s_335_352 <=s (const 64 (2**20)),
    u_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_335_352 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step352

// premise a
assume
neg_g_295_low60_40_low20_17 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_295_low60_40_low20_18 neg_f_295_low60_40_low20_17;
mov u_335_353 u_335_352;
mov v_335_353 v_335_352;

asr neg_g_295_low60_40_low20_18 neg_g_295_low60_40_low20_17 1;
asr r_335_353 r_335_352 1;
asr s_335_353 s_335_352 1;
assert
    true
&&
    neg_f_295_low60_40_low20_18 = neg_f_295_low60_40_low20_17,
    u_335_353 = u_335_352,
    v_335_353 = v_335_352,
    neg_g_295_low60_40_low20_18 * (const 64 2) = neg_g_295_low60_40_low20_17,
    r_335_353 * (const 64 2) = r_335_352,
    s_335_353 * (const 64 2) = s_335_352
;

assume
    neg_f_295_low60_40_low20_18 = neg_f_295_low60_40_low20_17,
    u_335_353 = u_335_352,
    v_335_353 = v_335_352,
    neg_g_295_low60_40_low20_18 * 2 = neg_g_295_low60_40_low20_17,
    r_335_353 * 2 = r_335_352,
    s_335_353 * 2 = s_335_352
&&
    true
;

{
    u_335_353 * neg_f_295_low60_40_low20_0 + v_335_353 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_353 * neg_f_295_low60_40_low20_0 + s_335_353 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_18 + u_335_353 * (const 64 (2**21)) + v_335_353 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_18 + r_335_353 * (const 64 (2**21)) + s_335_353 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_18,
    neg_f_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_18,
    neg_g_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 353)) <=s delta, delta <=s (const 64 (1 + 2*353)),
    (const 64 (-(2**20))) <=s u_335_353, u_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_353, v_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_353, r_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_353, s_335_353 <=s (const 64 ((2**20)-1)),
    u_335_353 + v_335_353 <=s (const 64 (2**20)),
    u_335_353 - v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 + v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 - v_335_353 <=s (const 64 (2**20)),
    r_335_353 + s_335_353 <=s (const 64 (2**20)),
    r_335_353 - s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 + s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 - s_335_353 <=s (const 64 (2**20)),
    u_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_335_353 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_352_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_17,
sint64 neg_g_295_low60_40_low20_17,
sint64 neg_f_295_low60_40_low20_18,
sint64 neg_g_295_low60_40_low20_18,
sint64 u_335_352,
sint64 v_335_352,
sint64 r_335_352,
sint64 s_335_352,
sint64 u_335_353,
sint64 v_335_353,
sint64 r_335_353,
sint64 s_335_353,
bit ne
)={
    u_335_352 * neg_f_295_low60_40_low20_0 + v_335_352 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_17 * (-(2**20)),
    r_335_352 * neg_f_295_low60_40_low20_0 + s_335_352 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_17 * (-(2**20))
&&
    u_335_352 * neg_f_295_low60_40_low20_0 + v_335_352 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_17 * (const 64 (-(2**20))),
    r_335_352 * neg_f_295_low60_40_low20_0 + s_335_352 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_17 + u_335_352 * (const 64 (2**21)) + v_335_352 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_17 + r_335_352 * (const 64 (2**21)) + s_335_352 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_17,
    neg_f_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_17,
    neg_g_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 352)) <=s delta, delta <=s (const 64 (1 + 2*352)),
    (const 64 (-(2**20))) <=s u_335_352, u_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_352, v_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_352, r_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_352, s_335_352 <=s (const 64 ((2**20)-1)),
    u_335_352 + v_335_352 <=s (const 64 (2**20)),
    u_335_352 - v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 + v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 - v_335_352 <=s (const 64 (2**20)),
    r_335_352 + s_335_352 <=s (const 64 (2**20)),
    r_335_352 - s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 + s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 - s_335_352 <=s (const 64 (2**20)),
    u_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_335_352 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step352

// premise b
assume
neg_g_295_low60_40_low20_17 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_18 neg_f_295_low60_40_low20_17;
mov u_335_353 u_335_352;
mov v_335_353 v_335_352;

add neg_g_295_low60_40_low20_18 neg_g_295_low60_40_low20_17 neg_f_295_low60_40_low20_17;
asr neg_g_295_low60_40_low20_18 neg_g_295_low60_40_low20_18 1;
add r_335_353 r_335_352 u_335_352;
asr r_335_353 r_335_353 1;
add s_335_353 s_335_352 v_335_352;
asr s_335_353 s_335_353 1;
assert
    true
&&
    neg_f_295_low60_40_low20_18 = neg_f_295_low60_40_low20_17,
    u_335_353 = u_335_352,
    v_335_353 = v_335_352,
    neg_g_295_low60_40_low20_18 * (const 64 2) = neg_g_295_low60_40_low20_17 + neg_f_295_low60_40_low20_17,
    r_335_353 * (const 64 2) = r_335_352 + u_335_352,
    s_335_353 * (const 64 2) = s_335_352 + v_335_352
;

assume
    neg_f_295_low60_40_low20_18 = neg_f_295_low60_40_low20_17,
    u_335_353 = u_335_352,
    v_335_353 = v_335_352,
    neg_g_295_low60_40_low20_18 * 2 = neg_g_295_low60_40_low20_17 + neg_f_295_low60_40_low20_17,
    r_335_353 * 2 = r_335_352 + u_335_352,
    s_335_353 * 2 = s_335_352 + v_335_352
&&
    true
;

{
    u_335_353 * neg_f_295_low60_40_low20_0 + v_335_353 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_353 * neg_f_295_low60_40_low20_0 + s_335_353 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_18 + u_335_353 * (const 64 (2**21)) + v_335_353 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_18 + r_335_353 * (const 64 (2**21)) + s_335_353 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_18,
    neg_f_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_18,
    neg_g_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 353)) <=s delta, delta <=s (const 64 (1 + 2*353)),
    (const 64 (-(2**20))) <=s u_335_353, u_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_353, v_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_353, r_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_353, s_335_353 <=s (const 64 ((2**20)-1)),
    u_335_353 + v_335_353 <=s (const 64 (2**20)),
    u_335_353 - v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 + v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 - v_335_353 <=s (const 64 (2**20)),
    r_335_353 + s_335_353 <=s (const 64 (2**20)),
    r_335_353 - s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 + s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 - s_335_353 <=s (const 64 (2**20)),
    u_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_335_353 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_352_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_17,
sint64 neg_g_295_low60_40_low20_17,
sint64 neg_f_295_low60_40_low20_18,
sint64 neg_g_295_low60_40_low20_18,
sint64 u_335_352,
sint64 v_335_352,
sint64 r_335_352,
sint64 s_335_352,
sint64 u_335_353,
sint64 v_335_353,
sint64 r_335_353,
sint64 s_335_353,
bit ne
)={
    u_335_352 * neg_f_295_low60_40_low20_0 + v_335_352 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_17 * (-(2**20)),
    r_335_352 * neg_f_295_low60_40_low20_0 + s_335_352 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_17 * (-(2**20))
&&
    u_335_352 * neg_f_295_low60_40_low20_0 + v_335_352 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_17 * (const 64 (-(2**20))),
    r_335_352 * neg_f_295_low60_40_low20_0 + s_335_352 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_17 + u_335_352 * (const 64 (2**21)) + v_335_352 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_17 + r_335_352 * (const 64 (2**21)) + s_335_352 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_17,
    neg_f_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_17,
    neg_g_295_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 352)) <=s delta, delta <=s (const 64 (1 + 2*352)),
    (const 64 (-(2**20))) <=s u_335_352, u_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_352, v_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_352, r_335_352 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_352, s_335_352 <=s (const 64 ((2**20)-1)),
    u_335_352 + v_335_352 <=s (const 64 (2**20)),
    u_335_352 - v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 + v_335_352 <=s (const 64 (2**20)),
    (const 64 0) - u_335_352 - v_335_352 <=s (const 64 (2**20)),
    r_335_352 + s_335_352 <=s (const 64 (2**20)),
    r_335_352 - s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 + s_335_352 <=s (const 64 (2**20)),
    (const 64 0) - r_335_352 - s_335_352 <=s (const 64 (2**20)),
    u_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_335_352 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_335_352 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step352

// premise c
assume
neg_g_295_low60_40_low20_17 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_18 neg_g_295_low60_40_low20_17;
mov u_335_353 r_335_352;
mov v_335_353 s_335_352;

subs dc neg_g_295_low60_40_low20_18 neg_g_295_low60_40_low20_17 neg_f_295_low60_40_low20_17;
asr neg_g_295_low60_40_low20_18 neg_g_295_low60_40_low20_18 1;
subs dc r_335_353 r_335_352 u_335_352;
asr r_335_353 r_335_353 1;
subs dc s_335_353 s_335_352 v_335_352;
asr s_335_353 s_335_353 1;
assert
    true
&&
    neg_f_295_low60_40_low20_18 = neg_g_295_low60_40_low20_17,
    u_335_353 = r_335_352,
    v_335_353 = s_335_352,
    neg_g_295_low60_40_low20_18 * (const 64 2) = neg_g_295_low60_40_low20_17 - neg_f_295_low60_40_low20_17,
    r_335_353 * (const 64 2) = r_335_352 - u_335_352,
    s_335_353 * (const 64 2) = s_335_352 - v_335_352
;

assume
    neg_f_295_low60_40_low20_18 = neg_g_295_low60_40_low20_17,
    u_335_353 = r_335_352,
    v_335_353 = s_335_352,
    neg_g_295_low60_40_low20_18 * 2 = neg_g_295_low60_40_low20_17 - neg_f_295_low60_40_low20_17,
    r_335_353 * 2 = r_335_352 - u_335_352,
    s_335_353 * 2 = s_335_352 - v_335_352
&&
    true
;

{
    u_335_353 * neg_f_295_low60_40_low20_0 + v_335_353 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_353 * neg_f_295_low60_40_low20_0 + s_335_353 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_18 + u_335_353 * (const 64 (2**21)) + v_335_353 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_18 + r_335_353 * (const 64 (2**21)) + s_335_353 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_18,
    neg_f_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_18,
    neg_g_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 353)) <=s delta, delta <=s (const 64 (1 + 2*353)),
    (const 64 (-(2**20))) <=s u_335_353, u_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_353, v_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_353, r_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_353, s_335_353 <=s (const 64 ((2**20)-1)),
    u_335_353 + v_335_353 <=s (const 64 (2**20)),
    u_335_353 - v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 + v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 - v_335_353 <=s (const 64 (2**20)),
    r_335_353 + s_335_353 <=s (const 64 (2**20)),
    r_335_353 - s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 + s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 - s_335_353 <=s (const 64 (2**20)),
    u_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_335_353 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_353_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_18,
sint64 neg_g_295_low60_40_low20_18,
sint64 neg_f_295_low60_40_low20_19,
sint64 neg_g_295_low60_40_low20_19,
sint64 u_335_353,
sint64 v_335_353,
sint64 r_335_353,
sint64 s_335_353,
sint64 u_335_354,
sint64 v_335_354,
sint64 r_335_354,
sint64 s_335_354,
bit ne
)={
    u_335_353 * neg_f_295_low60_40_low20_0 + v_335_353 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_18 * (-(2**20)),
    r_335_353 * neg_f_295_low60_40_low20_0 + s_335_353 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_18 * (-(2**20))
&&
    u_335_353 * neg_f_295_low60_40_low20_0 + v_335_353 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_18 * (const 64 (-(2**20))),
    r_335_353 * neg_f_295_low60_40_low20_0 + s_335_353 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_18 + u_335_353 * (const 64 (2**21)) + v_335_353 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_18 + r_335_353 * (const 64 (2**21)) + s_335_353 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_18,
    neg_f_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_18,
    neg_g_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 353)) <=s delta, delta <=s (const 64 (1 + 2*353)),
    (const 64 (-(2**20))) <=s u_335_353, u_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_353, v_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_353, r_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_353, s_335_353 <=s (const 64 ((2**20)-1)),
    u_335_353 + v_335_353 <=s (const 64 (2**20)),
    u_335_353 - v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 + v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 - v_335_353 <=s (const 64 (2**20)),
    r_335_353 + s_335_353 <=s (const 64 (2**20)),
    r_335_353 - s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 + s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 - s_335_353 <=s (const 64 (2**20)),
    u_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_335_353 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step353

// premise a
assume
neg_g_295_low60_40_low20_18 = 0 (mod 2)
&&
neg_g_295_low60_40_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov neg_f_295_low60_40_low20_19 neg_f_295_low60_40_low20_18;
mov u_335_354 u_335_353;
mov v_335_354 v_335_353;

asr neg_g_295_low60_40_low20_19 neg_g_295_low60_40_low20_18 1;
asr r_335_354 r_335_353 1;
asr s_335_354 s_335_353 1;
assert
    true
&&
    neg_f_295_low60_40_low20_19 = neg_f_295_low60_40_low20_18,
    u_335_354 = u_335_353,
    v_335_354 = v_335_353,
    neg_g_295_low60_40_low20_19 * (const 64 2) = neg_g_295_low60_40_low20_18,
    r_335_354 * (const 64 2) = r_335_353,
    s_335_354 * (const 64 2) = s_335_353
;

assume
    neg_f_295_low60_40_low20_19 = neg_f_295_low60_40_low20_18,
    u_335_354 = u_335_353,
    v_335_354 = v_335_353,
    neg_g_295_low60_40_low20_19 * 2 = neg_g_295_low60_40_low20_18,
    r_335_354 * 2 = r_335_353,
    s_335_354 * 2 = s_335_353
&&
    true
;

{
    u_335_354 * neg_f_295_low60_40_low20_0 + v_335_354 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_354 * neg_f_295_low60_40_low20_0 + s_335_354 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_19 + u_335_354 * (const 64 (2**21)) + v_335_354 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_19 + r_335_354 * (const 64 (2**21)) + s_335_354 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_19,
    neg_f_295_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_19,
    neg_g_295_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 354)) <=s delta, delta <=s (const 64 (1 + 2*354)),
    (const 64 (-(2**20))) <=s u_335_354, u_335_354 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_354, v_335_354 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_354, r_335_354 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_354, s_335_354 <=s (const 64 ((2**20)-1)),
    u_335_354 + v_335_354 <=s (const 64 (2**20)),
    u_335_354 - v_335_354 <=s (const 64 (2**20)),
    (const 64 0) - u_335_354 + v_335_354 <=s (const 64 (2**20)),
    (const 64 0) - u_335_354 - v_335_354 <=s (const 64 (2**20)),
    r_335_354 + s_335_354 <=s (const 64 (2**20)),
    r_335_354 - s_335_354 <=s (const 64 (2**20)),
    (const 64 0) - r_335_354 + s_335_354 <=s (const 64 (2**20)),
    (const 64 0) - r_335_354 - s_335_354 <=s (const 64 (2**20)),
    u_335_354 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_335_354 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_335_354 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_335_354 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_353_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_18,
sint64 neg_g_295_low60_40_low20_18,
sint64 neg_f_295_low60_40_low20_19,
sint64 neg_g_295_low60_40_low20_19,
sint64 u_335_353,
sint64 v_335_353,
sint64 r_335_353,
sint64 s_335_353,
sint64 u_335_354,
sint64 v_335_354,
sint64 r_335_354,
sint64 s_335_354,
bit ne
)={
    u_335_353 * neg_f_295_low60_40_low20_0 + v_335_353 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_18 * (-(2**20)),
    r_335_353 * neg_f_295_low60_40_low20_0 + s_335_353 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_18 * (-(2**20))
&&
    u_335_353 * neg_f_295_low60_40_low20_0 + v_335_353 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_18 * (const 64 (-(2**20))),
    r_335_353 * neg_f_295_low60_40_low20_0 + s_335_353 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_18 + u_335_353 * (const 64 (2**21)) + v_335_353 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_18 + r_335_353 * (const 64 (2**21)) + s_335_353 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_18,
    neg_f_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_18,
    neg_g_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 353)) <=s delta, delta <=s (const 64 (1 + 2*353)),
    (const 64 (-(2**20))) <=s u_335_353, u_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_353, v_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_353, r_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_353, s_335_353 <=s (const 64 ((2**20)-1)),
    u_335_353 + v_335_353 <=s (const 64 (2**20)),
    u_335_353 - v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 + v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 - v_335_353 <=s (const 64 (2**20)),
    r_335_353 + s_335_353 <=s (const 64 (2**20)),
    r_335_353 - s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 + s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 - s_335_353 <=s (const 64 (2**20)),
    u_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_335_353 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step353

// premise b
assume
neg_g_295_low60_40_low20_18 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_19 neg_f_295_low60_40_low20_18;
mov u_335_354 u_335_353;
mov v_335_354 v_335_353;

add neg_g_295_low60_40_low20_19 neg_g_295_low60_40_low20_18 neg_f_295_low60_40_low20_18;
asr neg_g_295_low60_40_low20_19 neg_g_295_low60_40_low20_19 1;
add r_335_354 r_335_353 u_335_353;
asr r_335_354 r_335_354 1;
add s_335_354 s_335_353 v_335_353;
asr s_335_354 s_335_354 1;
assert
    true
&&
    neg_f_295_low60_40_low20_19 = neg_f_295_low60_40_low20_18,
    u_335_354 = u_335_353,
    v_335_354 = v_335_353,
    neg_g_295_low60_40_low20_19 * (const 64 2) = neg_g_295_low60_40_low20_18 + neg_f_295_low60_40_low20_18,
    r_335_354 * (const 64 2) = r_335_353 + u_335_353,
    s_335_354 * (const 64 2) = s_335_353 + v_335_353
;

assume
    neg_f_295_low60_40_low20_19 = neg_f_295_low60_40_low20_18,
    u_335_354 = u_335_353,
    v_335_354 = v_335_353,
    neg_g_295_low60_40_low20_19 * 2 = neg_g_295_low60_40_low20_18 + neg_f_295_low60_40_low20_18,
    r_335_354 * 2 = r_335_353 + u_335_353,
    s_335_354 * 2 = s_335_353 + v_335_353
&&
    true
;

{
    u_335_354 * neg_f_295_low60_40_low20_0 + v_335_354 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_354 * neg_f_295_low60_40_low20_0 + s_335_354 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_19 + u_335_354 * (const 64 (2**21)) + v_335_354 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_19 + r_335_354 * (const 64 (2**21)) + s_335_354 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_19,
    neg_f_295_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_19,
    neg_g_295_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 354)) <=s delta, delta <=s (const 64 (1 + 2*354)),
    (const 64 (-(2**20))) <=s u_335_354, u_335_354 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_354, v_335_354 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_354, r_335_354 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_354, s_335_354 <=s (const 64 ((2**20)-1)),
    u_335_354 + v_335_354 <=s (const 64 (2**20)),
    u_335_354 - v_335_354 <=s (const 64 (2**20)),
    (const 64 0) - u_335_354 + v_335_354 <=s (const 64 (2**20)),
    (const 64 0) - u_335_354 - v_335_354 <=s (const 64 (2**20)),
    r_335_354 + s_335_354 <=s (const 64 (2**20)),
    r_335_354 - s_335_354 <=s (const 64 (2**20)),
    (const 64 0) - r_335_354 + s_335_354 <=s (const 64 (2**20)),
    (const 64 0) - r_335_354 - s_335_354 <=s (const 64 (2**20)),
    u_335_354 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_335_354 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_335_354 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_335_354 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_353_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_40_low20_0,
sint64 neg_g_295_low60_40_low20_0,
sint64 neg_f_295_low60_40_low20_18,
sint64 neg_g_295_low60_40_low20_18,
sint64 neg_f_295_low60_40_low20_19,
sint64 neg_g_295_low60_40_low20_19,
sint64 u_335_353,
sint64 v_335_353,
sint64 r_335_353,
sint64 s_335_353,
sint64 u_335_354,
sint64 v_335_354,
sint64 r_335_354,
sint64 s_335_354,
bit ne
)={
    u_335_353 * neg_f_295_low60_40_low20_0 + v_335_353 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_18 * (-(2**20)),
    r_335_353 * neg_f_295_low60_40_low20_0 + s_335_353 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_18 * (-(2**20))
&&
    u_335_353 * neg_f_295_low60_40_low20_0 + v_335_353 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_18 * (const 64 (-(2**20))),
    r_335_353 * neg_f_295_low60_40_low20_0 + s_335_353 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_40_low20_18 + u_335_353 * (const 64 (2**21)) + v_335_353 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_18 + r_335_353 * (const 64 (2**21)) + s_335_353 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_40_low20_0,
    neg_f_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_0,
    neg_g_295_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_40_low20_18,
    neg_f_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_40_low20_18,
    neg_g_295_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 353)) <=s delta, delta <=s (const 64 (1 + 2*353)),
    (const 64 (-(2**20))) <=s u_335_353, u_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_353, v_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_353, r_335_353 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_353, s_335_353 <=s (const 64 ((2**20)-1)),
    u_335_353 + v_335_353 <=s (const 64 (2**20)),
    u_335_353 - v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 + v_335_353 <=s (const 64 (2**20)),
    (const 64 0) - u_335_353 - v_335_353 <=s (const 64 (2**20)),
    r_335_353 + s_335_353 <=s (const 64 (2**20)),
    r_335_353 - s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 + s_335_353 <=s (const 64 (2**20)),
    (const 64 0) - r_335_353 - s_335_353 <=s (const 64 (2**20)),
    u_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_335_353 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_335_353 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step353

// premise c
assume
neg_g_295_low60_40_low20_18 = 1 (mod 2)
&&
neg_g_295_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_40_low20_19 neg_g_295_low60_40_low20_18;
mov u_335_354 r_335_353;
mov v_335_354 s_335_353;

subs dc neg_g_295_low60_40_low20_19 neg_g_295_low60_40_low20_18 neg_f_295_low60_40_low20_18;
asr neg_g_295_low60_40_low20_19 neg_g_295_low60_40_low20_19 1;
subs dc r_335_354 r_335_353 u_335_353;
asr r_335_354 r_335_354 1;
subs dc s_335_354 s_335_353 v_335_353;
asr s_335_354 s_335_354 1;
assert
    true
&&
    neg_f_295_low60_40_low20_19 = neg_g_295_low60_40_low20_18,
    u_335_354 = r_335_353,
    v_335_354 = s_335_353,
    neg_g_295_low60_40_low20_19 * (const 64 2) = neg_g_295_low60_40_low20_18 - neg_f_295_low60_40_low20_18,
    r_335_354 * (const 64 2) = r_335_353 - u_335_353,
    s_335_354 * (const 64 2) = s_335_353 - v_335_353
;

assume
    neg_f_295_low60_40_low20_19 = neg_g_295_low60_40_low20_18,
    u_335_354 = r_335_353,
    v_335_354 = s_335_353,
    neg_g_295_low60_40_low20_19 * 2 = neg_g_295_low60_40_low20_18 - neg_f_295_low60_40_low20_18,
    r_335_354 * 2 = r_335_353 - u_335_353,
    s_335_354 * 2 = s_335_353 - v_335_353
&&
    true
;

{
    u_335_354 * neg_f_295_low60_40_low20_0 + v_335_354 * neg_g_295_low60_40_low20_0 = neg_f_295_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_335_354 * neg_f_295_low60_40_low20_0 + s_335_354 * neg_g_295_low60_40_low20_0 = neg_g_295_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_40_low20_19 + u_335_354 * (const 64 (2**21)) + v_335_354 * (const 64 (2**42)),
    grs = neg_g_295_low60_40_low20_19 + r_335_354 * (const 64 (2**21)) + s_335_354 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_40_low20_19,
    neg_f_295_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_40_low20_19,
    neg_g_295_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 354)) <=s delta, delta <=s (const 64 (1 + 2*354)),
    (const 64 (-(2**20))) <=s u_335_354, u_335_354 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_335_354, v_335_354 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_335_354, r_335_354 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_335_354, s_335_354 <=s (const 64 ((2**20)-1)),
    u_335_354 + v_335_354 <=s (const 64 (2**20)),
    u_335_354 - v_335_354 <=s (const 64 (2**20)),
    (const 64 0) - u_335_354 + v_335_354 <=s (const 64 (2**20)),
    (const 64 0) - u_335_354 - v_335_354 <=s (const 64 (2**20)),
    r_335_354 + s_335_354 <=s (const 64 (2**20)),
    r_335_354 - s_335_354 <=s (const 64 (2**20)),
    (const 64 0) - r_335_354 + s_335_354 <=s (const 64 (2**20)),
    (const 64 0) - r_335_354 - s_335_354 <=s (const 64 (2**20)),
    u_335_354 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_335_354 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_335_354 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_335_354 = (const 64 0) (mod (const 64 (2**(20-19))))
}

