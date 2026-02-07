proc divstep_492_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_1,
sint64 neg_g_472_low60_20_low20_1,
sint64 u_492_492,
sint64 v_492_492,
sint64 r_492_492,
sint64 s_492_492,
sint64 u_492_493,
sint64 v_492_493,
sint64 r_492_493,
sint64 s_492_493,
bit ne
)={
    u_492_492 * neg_f_472_low60_20_low20_0 + v_492_492 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_0 * (-(2**20)),
    r_492_492 * neg_f_472_low60_20_low20_0 + s_492_492 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_0 * (-(2**20))
&&
    u_492_492 * neg_f_472_low60_20_low20_0 + v_492_492 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_0 * (const 64 (-(2**20))),
    r_492_492 * neg_f_472_low60_20_low20_0 + s_492_492 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_0 + u_492_492 * (const 64 (2**21)) + v_492_492 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_0 + r_492_492 * (const 64 (2**21)) + s_492_492 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 492)) <=s delta, delta <=s (const 64 (1 + 2*492)),
    u_492_492 = (const 64 (-(2**20))),
    v_492_492 = (const 64 (0)),
    r_492_492 = (const 64 (0)),
    s_492_492 = (const 64 (-(2**20)))
}



// divsteps
// step492

// premise a
assume
neg_g_472_low60_20_low20_0 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_472_low60_20_low20_1 neg_f_472_low60_20_low20_0;
mov u_492_493 u_492_492;
mov v_492_493 v_492_492;

asr neg_g_472_low60_20_low20_1 neg_g_472_low60_20_low20_0 1;
asr r_492_493 r_492_492 1;
asr s_492_493 s_492_492 1;
assert
    true
&&
    neg_f_472_low60_20_low20_1 = neg_f_472_low60_20_low20_0,
    u_492_493 = u_492_492,
    v_492_493 = v_492_492,
    neg_g_472_low60_20_low20_1 * (const 64 2) = neg_g_472_low60_20_low20_0,
    r_492_493 * (const 64 2) = r_492_492,
    s_492_493 * (const 64 2) = s_492_492
;

assume
    neg_f_472_low60_20_low20_1 = neg_f_472_low60_20_low20_0,
    u_492_493 = u_492_492,
    v_492_493 = v_492_492,
    neg_g_472_low60_20_low20_1 * 2 = neg_g_472_low60_20_low20_0,
    r_492_493 * 2 = r_492_492,
    s_492_493 * 2 = s_492_492
&&
    true
;

{
    u_492_493 * neg_f_472_low60_20_low20_0 + v_492_493 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_493 * neg_f_472_low60_20_low20_0 + s_492_493 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_1 + u_492_493 * (const 64 (2**21)) + v_492_493 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_1 + r_492_493 * (const 64 (2**21)) + s_492_493 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_1,
    neg_f_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_1,
    neg_g_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 493)) <=s delta, delta <=s (const 64 (1 + 2*493)),
    (const 64 (-(2**20))) <=s u_492_493, u_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_493, v_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_493, r_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_493, s_492_493 <=s (const 64 ((2**20))),
    u_492_493 + v_492_493 <=s (const 64 (2**20)),
    u_492_493 - v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 + v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 - v_492_493 <=s (const 64 (2**20)),
    r_492_493 + s_492_493 <=s (const 64 (2**20)),
    r_492_493 - s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 + s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 - s_492_493 <=s (const 64 (2**20)),
    u_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_492_493 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_492_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_1,
sint64 neg_g_472_low60_20_low20_1,
sint64 u_492_492,
sint64 v_492_492,
sint64 r_492_492,
sint64 s_492_492,
sint64 u_492_493,
sint64 v_492_493,
sint64 r_492_493,
sint64 s_492_493,
bit ne
)={
    u_492_492 * neg_f_472_low60_20_low20_0 + v_492_492 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_0 * (-(2**20)),
    r_492_492 * neg_f_472_low60_20_low20_0 + s_492_492 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_0 * (-(2**20))
&&
    u_492_492 * neg_f_472_low60_20_low20_0 + v_492_492 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_0 * (const 64 (-(2**20))),
    r_492_492 * neg_f_472_low60_20_low20_0 + s_492_492 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_0 + u_492_492 * (const 64 (2**21)) + v_492_492 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_0 + r_492_492 * (const 64 (2**21)) + s_492_492 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 492)) <=s delta, delta <=s (const 64 (1 + 2*492)),
    u_492_492 = (const 64 (-(2**20))),
    v_492_492 = (const 64 (0)),
    r_492_492 = (const 64 (0)),
    s_492_492 = (const 64 (-(2**20)))
}



// divsteps
// step492

// premise b
assume
neg_g_472_low60_20_low20_0 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_1 neg_f_472_low60_20_low20_0;
mov u_492_493 u_492_492;
mov v_492_493 v_492_492;

add neg_g_472_low60_20_low20_1 neg_g_472_low60_20_low20_0 neg_f_472_low60_20_low20_0;
asr neg_g_472_low60_20_low20_1 neg_g_472_low60_20_low20_1 1;
add r_492_493 r_492_492 u_492_492;
asr r_492_493 r_492_493 1;
add s_492_493 s_492_492 v_492_492;
asr s_492_493 s_492_493 1;
assert
    true
&&
    neg_f_472_low60_20_low20_1 = neg_f_472_low60_20_low20_0,
    u_492_493 = u_492_492,
    v_492_493 = v_492_492,
    neg_g_472_low60_20_low20_1 * (const 64 2) = neg_g_472_low60_20_low20_0 + neg_f_472_low60_20_low20_0,
    r_492_493 * (const 64 2) = r_492_492 + u_492_492,
    s_492_493 * (const 64 2) = s_492_492 + v_492_492
;

assume
    neg_f_472_low60_20_low20_1 = neg_f_472_low60_20_low20_0,
    u_492_493 = u_492_492,
    v_492_493 = v_492_492,
    neg_g_472_low60_20_low20_1 * 2 = neg_g_472_low60_20_low20_0 + neg_f_472_low60_20_low20_0,
    r_492_493 * 2 = r_492_492 + u_492_492,
    s_492_493 * 2 = s_492_492 + v_492_492
&&
    true
;

{
    u_492_493 * neg_f_472_low60_20_low20_0 + v_492_493 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_493 * neg_f_472_low60_20_low20_0 + s_492_493 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_1 + u_492_493 * (const 64 (2**21)) + v_492_493 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_1 + r_492_493 * (const 64 (2**21)) + s_492_493 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_1,
    neg_f_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_1,
    neg_g_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 493)) <=s delta, delta <=s (const 64 (1 + 2*493)),
    (const 64 (-(2**20))) <=s u_492_493, u_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_493, v_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_493, r_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_493, s_492_493 <=s (const 64 ((2**20))),
    u_492_493 + v_492_493 <=s (const 64 (2**20)),
    u_492_493 - v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 + v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 - v_492_493 <=s (const 64 (2**20)),
    r_492_493 + s_492_493 <=s (const 64 (2**20)),
    r_492_493 - s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 + s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 - s_492_493 <=s (const 64 (2**20)),
    u_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_492_493 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_492_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_1,
sint64 neg_g_472_low60_20_low20_1,
sint64 u_492_492,
sint64 v_492_492,
sint64 r_492_492,
sint64 s_492_492,
sint64 u_492_493,
sint64 v_492_493,
sint64 r_492_493,
sint64 s_492_493,
bit ne
)={
    u_492_492 * neg_f_472_low60_20_low20_0 + v_492_492 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_0 * (-(2**20)),
    r_492_492 * neg_f_472_low60_20_low20_0 + s_492_492 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_0 * (-(2**20))
&&
    u_492_492 * neg_f_472_low60_20_low20_0 + v_492_492 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_0 * (const 64 (-(2**20))),
    r_492_492 * neg_f_472_low60_20_low20_0 + s_492_492 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_0 + u_492_492 * (const 64 (2**21)) + v_492_492 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_0 + r_492_492 * (const 64 (2**21)) + s_492_492 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 492)) <=s delta, delta <=s (const 64 (1 + 2*492)),
    u_492_492 = (const 64 (-(2**20))),
    v_492_492 = (const 64 (0)),
    r_492_492 = (const 64 (0)),
    s_492_492 = (const 64 (-(2**20)))
}



// divsteps
// step492

// premise c
assume
neg_g_472_low60_20_low20_0 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_1 neg_g_472_low60_20_low20_0;
mov u_492_493 r_492_492;
mov v_492_493 s_492_492;

subs dc neg_g_472_low60_20_low20_1 neg_g_472_low60_20_low20_0 neg_f_472_low60_20_low20_0;
asr neg_g_472_low60_20_low20_1 neg_g_472_low60_20_low20_1 1;
subs dc r_492_493 r_492_492 u_492_492;
asr r_492_493 r_492_493 1;
subs dc s_492_493 s_492_492 v_492_492;
asr s_492_493 s_492_493 1;
assert
    true
&&
    neg_f_472_low60_20_low20_1 = neg_g_472_low60_20_low20_0,
    u_492_493 = r_492_492,
    v_492_493 = s_492_492,
    neg_g_472_low60_20_low20_1 * (const 64 2) = neg_g_472_low60_20_low20_0 - neg_f_472_low60_20_low20_0,
    r_492_493 * (const 64 2) = r_492_492 - u_492_492,
    s_492_493 * (const 64 2) = s_492_492 - v_492_492
;

assume
    neg_f_472_low60_20_low20_1 = neg_g_472_low60_20_low20_0,
    u_492_493 = r_492_492,
    v_492_493 = s_492_492,
    neg_g_472_low60_20_low20_1 * 2 = neg_g_472_low60_20_low20_0 - neg_f_472_low60_20_low20_0,
    r_492_493 * 2 = r_492_492 - u_492_492,
    s_492_493 * 2 = s_492_492 - v_492_492
&&
    true
;

{
    u_492_493 * neg_f_472_low60_20_low20_0 + v_492_493 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_493 * neg_f_472_low60_20_low20_0 + s_492_493 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_1 + u_492_493 * (const 64 (2**21)) + v_492_493 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_1 + r_492_493 * (const 64 (2**21)) + s_492_493 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_1,
    neg_f_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_1,
    neg_g_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 493)) <=s delta, delta <=s (const 64 (1 + 2*493)),
    (const 64 (-(2**20))) <=s u_492_493, u_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_493, v_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_493, r_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_493, s_492_493 <=s (const 64 ((2**20))),
    u_492_493 + v_492_493 <=s (const 64 (2**20)),
    u_492_493 - v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 + v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 - v_492_493 <=s (const 64 (2**20)),
    r_492_493 + s_492_493 <=s (const 64 (2**20)),
    r_492_493 - s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 + s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 - s_492_493 <=s (const 64 (2**20)),
    u_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_492_493 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_493_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_1,
sint64 neg_g_472_low60_20_low20_1,
sint64 neg_f_472_low60_20_low20_2,
sint64 neg_g_472_low60_20_low20_2,
sint64 u_492_493,
sint64 v_492_493,
sint64 r_492_493,
sint64 s_492_493,
sint64 u_492_494,
sint64 v_492_494,
sint64 r_492_494,
sint64 s_492_494,
bit ne
)={
    u_492_493 * neg_f_472_low60_20_low20_0 + v_492_493 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_1 * (-(2**20)),
    r_492_493 * neg_f_472_low60_20_low20_0 + s_492_493 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_1 * (-(2**20))
&&
    u_492_493 * neg_f_472_low60_20_low20_0 + v_492_493 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_1 * (const 64 (-(2**20))),
    r_492_493 * neg_f_472_low60_20_low20_0 + s_492_493 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_1 + u_492_493 * (const 64 (2**21)) + v_492_493 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_1 + r_492_493 * (const 64 (2**21)) + s_492_493 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_1,
    neg_f_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_1,
    neg_g_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 493)) <=s delta, delta <=s (const 64 (1 + 2*493)),
    (const 64 (-(2**20))) <=s u_492_493, u_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_493, v_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_493, r_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_493, s_492_493 <=s (const 64 ((2**20))),
    u_492_493 + v_492_493 <=s (const 64 (2**20)),
    u_492_493 - v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 + v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 - v_492_493 <=s (const 64 (2**20)),
    r_492_493 + s_492_493 <=s (const 64 (2**20)),
    r_492_493 - s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 + s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 - s_492_493 <=s (const 64 (2**20)),
    u_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_492_493 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step493

// premise a
assume
neg_g_472_low60_20_low20_1 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_2 neg_f_472_low60_20_low20_1;
mov u_492_494 u_492_493;
mov v_492_494 v_492_493;

asr neg_g_472_low60_20_low20_2 neg_g_472_low60_20_low20_1 1;
asr r_492_494 r_492_493 1;
asr s_492_494 s_492_493 1;
assert
    true
&&
    neg_f_472_low60_20_low20_2 = neg_f_472_low60_20_low20_1,
    u_492_494 = u_492_493,
    v_492_494 = v_492_493,
    neg_g_472_low60_20_low20_2 * (const 64 2) = neg_g_472_low60_20_low20_1,
    r_492_494 * (const 64 2) = r_492_493,
    s_492_494 * (const 64 2) = s_492_493
;

assume
    neg_f_472_low60_20_low20_2 = neg_f_472_low60_20_low20_1,
    u_492_494 = u_492_493,
    v_492_494 = v_492_493,
    neg_g_472_low60_20_low20_2 * 2 = neg_g_472_low60_20_low20_1,
    r_492_494 * 2 = r_492_493,
    s_492_494 * 2 = s_492_493
&&
    true
;

{
    u_492_494 * neg_f_472_low60_20_low20_0 + v_492_494 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_494 * neg_f_472_low60_20_low20_0 + s_492_494 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_2 + u_492_494 * (const 64 (2**21)) + v_492_494 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_2 + r_492_494 * (const 64 (2**21)) + s_492_494 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_2,
    neg_f_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_2,
    neg_g_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 494)) <=s delta, delta <=s (const 64 (1 + 2*494)),
    (const 64 (-(2**20))) <=s u_492_494, u_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_494, v_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_494, r_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_494, s_492_494 <=s (const 64 ((2**20))),
    u_492_494 + v_492_494 <=s (const 64 (2**20)),
    u_492_494 - v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 + v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 - v_492_494 <=s (const 64 (2**20)),
    r_492_494 + s_492_494 <=s (const 64 (2**20)),
    r_492_494 - s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 + s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 - s_492_494 <=s (const 64 (2**20)),
    u_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_492_494 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_493_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_1,
sint64 neg_g_472_low60_20_low20_1,
sint64 neg_f_472_low60_20_low20_2,
sint64 neg_g_472_low60_20_low20_2,
sint64 u_492_493,
sint64 v_492_493,
sint64 r_492_493,
sint64 s_492_493,
sint64 u_492_494,
sint64 v_492_494,
sint64 r_492_494,
sint64 s_492_494,
bit ne
)={
    u_492_493 * neg_f_472_low60_20_low20_0 + v_492_493 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_1 * (-(2**20)),
    r_492_493 * neg_f_472_low60_20_low20_0 + s_492_493 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_1 * (-(2**20))
&&
    u_492_493 * neg_f_472_low60_20_low20_0 + v_492_493 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_1 * (const 64 (-(2**20))),
    r_492_493 * neg_f_472_low60_20_low20_0 + s_492_493 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_1 + u_492_493 * (const 64 (2**21)) + v_492_493 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_1 + r_492_493 * (const 64 (2**21)) + s_492_493 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_1,
    neg_f_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_1,
    neg_g_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 493)) <=s delta, delta <=s (const 64 (1 + 2*493)),
    (const 64 (-(2**20))) <=s u_492_493, u_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_493, v_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_493, r_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_493, s_492_493 <=s (const 64 ((2**20))),
    u_492_493 + v_492_493 <=s (const 64 (2**20)),
    u_492_493 - v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 + v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 - v_492_493 <=s (const 64 (2**20)),
    r_492_493 + s_492_493 <=s (const 64 (2**20)),
    r_492_493 - s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 + s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 - s_492_493 <=s (const 64 (2**20)),
    u_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_492_493 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step493

// premise b
assume
neg_g_472_low60_20_low20_1 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_2 neg_f_472_low60_20_low20_1;
mov u_492_494 u_492_493;
mov v_492_494 v_492_493;

add neg_g_472_low60_20_low20_2 neg_g_472_low60_20_low20_1 neg_f_472_low60_20_low20_1;
asr neg_g_472_low60_20_low20_2 neg_g_472_low60_20_low20_2 1;
add r_492_494 r_492_493 u_492_493;
asr r_492_494 r_492_494 1;
add s_492_494 s_492_493 v_492_493;
asr s_492_494 s_492_494 1;
assert
    true
&&
    neg_f_472_low60_20_low20_2 = neg_f_472_low60_20_low20_1,
    u_492_494 = u_492_493,
    v_492_494 = v_492_493,
    neg_g_472_low60_20_low20_2 * (const 64 2) = neg_g_472_low60_20_low20_1 + neg_f_472_low60_20_low20_1,
    r_492_494 * (const 64 2) = r_492_493 + u_492_493,
    s_492_494 * (const 64 2) = s_492_493 + v_492_493
;

assume
    neg_f_472_low60_20_low20_2 = neg_f_472_low60_20_low20_1,
    u_492_494 = u_492_493,
    v_492_494 = v_492_493,
    neg_g_472_low60_20_low20_2 * 2 = neg_g_472_low60_20_low20_1 + neg_f_472_low60_20_low20_1,
    r_492_494 * 2 = r_492_493 + u_492_493,
    s_492_494 * 2 = s_492_493 + v_492_493
&&
    true
;

{
    u_492_494 * neg_f_472_low60_20_low20_0 + v_492_494 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_494 * neg_f_472_low60_20_low20_0 + s_492_494 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_2 + u_492_494 * (const 64 (2**21)) + v_492_494 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_2 + r_492_494 * (const 64 (2**21)) + s_492_494 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_2,
    neg_f_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_2,
    neg_g_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 494)) <=s delta, delta <=s (const 64 (1 + 2*494)),
    (const 64 (-(2**20))) <=s u_492_494, u_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_494, v_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_494, r_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_494, s_492_494 <=s (const 64 ((2**20))),
    u_492_494 + v_492_494 <=s (const 64 (2**20)),
    u_492_494 - v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 + v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 - v_492_494 <=s (const 64 (2**20)),
    r_492_494 + s_492_494 <=s (const 64 (2**20)),
    r_492_494 - s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 + s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 - s_492_494 <=s (const 64 (2**20)),
    u_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_492_494 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_493_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_1,
sint64 neg_g_472_low60_20_low20_1,
sint64 neg_f_472_low60_20_low20_2,
sint64 neg_g_472_low60_20_low20_2,
sint64 u_492_493,
sint64 v_492_493,
sint64 r_492_493,
sint64 s_492_493,
sint64 u_492_494,
sint64 v_492_494,
sint64 r_492_494,
sint64 s_492_494,
bit ne
)={
    u_492_493 * neg_f_472_low60_20_low20_0 + v_492_493 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_1 * (-(2**20)),
    r_492_493 * neg_f_472_low60_20_low20_0 + s_492_493 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_1 * (-(2**20))
&&
    u_492_493 * neg_f_472_low60_20_low20_0 + v_492_493 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_1 * (const 64 (-(2**20))),
    r_492_493 * neg_f_472_low60_20_low20_0 + s_492_493 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_1 + u_492_493 * (const 64 (2**21)) + v_492_493 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_1 + r_492_493 * (const 64 (2**21)) + s_492_493 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_1,
    neg_f_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_1,
    neg_g_472_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 493)) <=s delta, delta <=s (const 64 (1 + 2*493)),
    (const 64 (-(2**20))) <=s u_492_493, u_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_493, v_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_493, r_492_493 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_493, s_492_493 <=s (const 64 ((2**20))),
    u_492_493 + v_492_493 <=s (const 64 (2**20)),
    u_492_493 - v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 + v_492_493 <=s (const 64 (2**20)),
    (const 64 0) - u_492_493 - v_492_493 <=s (const 64 (2**20)),
    r_492_493 + s_492_493 <=s (const 64 (2**20)),
    r_492_493 - s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 + s_492_493 <=s (const 64 (2**20)),
    (const 64 0) - r_492_493 - s_492_493 <=s (const 64 (2**20)),
    u_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_492_493 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_492_493 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step493

// premise c
assume
neg_g_472_low60_20_low20_1 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_2 neg_g_472_low60_20_low20_1;
mov u_492_494 r_492_493;
mov v_492_494 s_492_493;

subs dc neg_g_472_low60_20_low20_2 neg_g_472_low60_20_low20_1 neg_f_472_low60_20_low20_1;
asr neg_g_472_low60_20_low20_2 neg_g_472_low60_20_low20_2 1;
subs dc r_492_494 r_492_493 u_492_493;
asr r_492_494 r_492_494 1;
subs dc s_492_494 s_492_493 v_492_493;
asr s_492_494 s_492_494 1;
assert
    true
&&
    neg_f_472_low60_20_low20_2 = neg_g_472_low60_20_low20_1,
    u_492_494 = r_492_493,
    v_492_494 = s_492_493,
    neg_g_472_low60_20_low20_2 * (const 64 2) = neg_g_472_low60_20_low20_1 - neg_f_472_low60_20_low20_1,
    r_492_494 * (const 64 2) = r_492_493 - u_492_493,
    s_492_494 * (const 64 2) = s_492_493 - v_492_493
;

assume
    neg_f_472_low60_20_low20_2 = neg_g_472_low60_20_low20_1,
    u_492_494 = r_492_493,
    v_492_494 = s_492_493,
    neg_g_472_low60_20_low20_2 * 2 = neg_g_472_low60_20_low20_1 - neg_f_472_low60_20_low20_1,
    r_492_494 * 2 = r_492_493 - u_492_493,
    s_492_494 * 2 = s_492_493 - v_492_493
&&
    true
;

{
    u_492_494 * neg_f_472_low60_20_low20_0 + v_492_494 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_494 * neg_f_472_low60_20_low20_0 + s_492_494 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_2 + u_492_494 * (const 64 (2**21)) + v_492_494 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_2 + r_492_494 * (const 64 (2**21)) + s_492_494 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_2,
    neg_f_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_2,
    neg_g_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 494)) <=s delta, delta <=s (const 64 (1 + 2*494)),
    (const 64 (-(2**20))) <=s u_492_494, u_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_494, v_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_494, r_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_494, s_492_494 <=s (const 64 ((2**20))),
    u_492_494 + v_492_494 <=s (const 64 (2**20)),
    u_492_494 - v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 + v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 - v_492_494 <=s (const 64 (2**20)),
    r_492_494 + s_492_494 <=s (const 64 (2**20)),
    r_492_494 - s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 + s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 - s_492_494 <=s (const 64 (2**20)),
    u_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_492_494 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_494_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_2,
sint64 neg_g_472_low60_20_low20_2,
sint64 neg_f_472_low60_20_low20_3,
sint64 neg_g_472_low60_20_low20_3,
sint64 u_492_494,
sint64 v_492_494,
sint64 r_492_494,
sint64 s_492_494,
sint64 u_492_495,
sint64 v_492_495,
sint64 r_492_495,
sint64 s_492_495,
bit ne
)={
    u_492_494 * neg_f_472_low60_20_low20_0 + v_492_494 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_2 * (-(2**20)),
    r_492_494 * neg_f_472_low60_20_low20_0 + s_492_494 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_2 * (-(2**20))
&&
    u_492_494 * neg_f_472_low60_20_low20_0 + v_492_494 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_2 * (const 64 (-(2**20))),
    r_492_494 * neg_f_472_low60_20_low20_0 + s_492_494 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_2 + u_492_494 * (const 64 (2**21)) + v_492_494 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_2 + r_492_494 * (const 64 (2**21)) + s_492_494 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_2,
    neg_f_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_2,
    neg_g_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 494)) <=s delta, delta <=s (const 64 (1 + 2*494)),
    (const 64 (-(2**20))) <=s u_492_494, u_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_494, v_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_494, r_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_494, s_492_494 <=s (const 64 ((2**20))),
    u_492_494 + v_492_494 <=s (const 64 (2**20)),
    u_492_494 - v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 + v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 - v_492_494 <=s (const 64 (2**20)),
    r_492_494 + s_492_494 <=s (const 64 (2**20)),
    r_492_494 - s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 + s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 - s_492_494 <=s (const 64 (2**20)),
    u_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_492_494 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step494

// premise a
assume
neg_g_472_low60_20_low20_2 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_3 neg_f_472_low60_20_low20_2;
mov u_492_495 u_492_494;
mov v_492_495 v_492_494;

asr neg_g_472_low60_20_low20_3 neg_g_472_low60_20_low20_2 1;
asr r_492_495 r_492_494 1;
asr s_492_495 s_492_494 1;
assert
    true
&&
    neg_f_472_low60_20_low20_3 = neg_f_472_low60_20_low20_2,
    u_492_495 = u_492_494,
    v_492_495 = v_492_494,
    neg_g_472_low60_20_low20_3 * (const 64 2) = neg_g_472_low60_20_low20_2,
    r_492_495 * (const 64 2) = r_492_494,
    s_492_495 * (const 64 2) = s_492_494
;

assume
    neg_f_472_low60_20_low20_3 = neg_f_472_low60_20_low20_2,
    u_492_495 = u_492_494,
    v_492_495 = v_492_494,
    neg_g_472_low60_20_low20_3 * 2 = neg_g_472_low60_20_low20_2,
    r_492_495 * 2 = r_492_494,
    s_492_495 * 2 = s_492_494
&&
    true
;

{
    u_492_495 * neg_f_472_low60_20_low20_0 + v_492_495 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_495 * neg_f_472_low60_20_low20_0 + s_492_495 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_3 + u_492_495 * (const 64 (2**21)) + v_492_495 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_3 + r_492_495 * (const 64 (2**21)) + s_492_495 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_3,
    neg_f_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_3,
    neg_g_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 495)) <=s delta, delta <=s (const 64 (1 + 2*495)),
    (const 64 (-(2**20))) <=s u_492_495, u_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_495, v_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_495, r_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_495, s_492_495 <=s (const 64 ((2**20))),
    u_492_495 + v_492_495 <=s (const 64 (2**20)),
    u_492_495 - v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 + v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 - v_492_495 <=s (const 64 (2**20)),
    r_492_495 + s_492_495 <=s (const 64 (2**20)),
    r_492_495 - s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 + s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 - s_492_495 <=s (const 64 (2**20)),
    u_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_492_495 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_494_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_2,
sint64 neg_g_472_low60_20_low20_2,
sint64 neg_f_472_low60_20_low20_3,
sint64 neg_g_472_low60_20_low20_3,
sint64 u_492_494,
sint64 v_492_494,
sint64 r_492_494,
sint64 s_492_494,
sint64 u_492_495,
sint64 v_492_495,
sint64 r_492_495,
sint64 s_492_495,
bit ne
)={
    u_492_494 * neg_f_472_low60_20_low20_0 + v_492_494 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_2 * (-(2**20)),
    r_492_494 * neg_f_472_low60_20_low20_0 + s_492_494 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_2 * (-(2**20))
&&
    u_492_494 * neg_f_472_low60_20_low20_0 + v_492_494 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_2 * (const 64 (-(2**20))),
    r_492_494 * neg_f_472_low60_20_low20_0 + s_492_494 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_2 + u_492_494 * (const 64 (2**21)) + v_492_494 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_2 + r_492_494 * (const 64 (2**21)) + s_492_494 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_2,
    neg_f_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_2,
    neg_g_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 494)) <=s delta, delta <=s (const 64 (1 + 2*494)),
    (const 64 (-(2**20))) <=s u_492_494, u_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_494, v_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_494, r_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_494, s_492_494 <=s (const 64 ((2**20))),
    u_492_494 + v_492_494 <=s (const 64 (2**20)),
    u_492_494 - v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 + v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 - v_492_494 <=s (const 64 (2**20)),
    r_492_494 + s_492_494 <=s (const 64 (2**20)),
    r_492_494 - s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 + s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 - s_492_494 <=s (const 64 (2**20)),
    u_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_492_494 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step494

// premise b
assume
neg_g_472_low60_20_low20_2 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_3 neg_f_472_low60_20_low20_2;
mov u_492_495 u_492_494;
mov v_492_495 v_492_494;

add neg_g_472_low60_20_low20_3 neg_g_472_low60_20_low20_2 neg_f_472_low60_20_low20_2;
asr neg_g_472_low60_20_low20_3 neg_g_472_low60_20_low20_3 1;
add r_492_495 r_492_494 u_492_494;
asr r_492_495 r_492_495 1;
add s_492_495 s_492_494 v_492_494;
asr s_492_495 s_492_495 1;
assert
    true
&&
    neg_f_472_low60_20_low20_3 = neg_f_472_low60_20_low20_2,
    u_492_495 = u_492_494,
    v_492_495 = v_492_494,
    neg_g_472_low60_20_low20_3 * (const 64 2) = neg_g_472_low60_20_low20_2 + neg_f_472_low60_20_low20_2,
    r_492_495 * (const 64 2) = r_492_494 + u_492_494,
    s_492_495 * (const 64 2) = s_492_494 + v_492_494
;

assume
    neg_f_472_low60_20_low20_3 = neg_f_472_low60_20_low20_2,
    u_492_495 = u_492_494,
    v_492_495 = v_492_494,
    neg_g_472_low60_20_low20_3 * 2 = neg_g_472_low60_20_low20_2 + neg_f_472_low60_20_low20_2,
    r_492_495 * 2 = r_492_494 + u_492_494,
    s_492_495 * 2 = s_492_494 + v_492_494
&&
    true
;

{
    u_492_495 * neg_f_472_low60_20_low20_0 + v_492_495 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_495 * neg_f_472_low60_20_low20_0 + s_492_495 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_3 + u_492_495 * (const 64 (2**21)) + v_492_495 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_3 + r_492_495 * (const 64 (2**21)) + s_492_495 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_3,
    neg_f_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_3,
    neg_g_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 495)) <=s delta, delta <=s (const 64 (1 + 2*495)),
    (const 64 (-(2**20))) <=s u_492_495, u_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_495, v_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_495, r_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_495, s_492_495 <=s (const 64 ((2**20))),
    u_492_495 + v_492_495 <=s (const 64 (2**20)),
    u_492_495 - v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 + v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 - v_492_495 <=s (const 64 (2**20)),
    r_492_495 + s_492_495 <=s (const 64 (2**20)),
    r_492_495 - s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 + s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 - s_492_495 <=s (const 64 (2**20)),
    u_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_492_495 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_494_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_2,
sint64 neg_g_472_low60_20_low20_2,
sint64 neg_f_472_low60_20_low20_3,
sint64 neg_g_472_low60_20_low20_3,
sint64 u_492_494,
sint64 v_492_494,
sint64 r_492_494,
sint64 s_492_494,
sint64 u_492_495,
sint64 v_492_495,
sint64 r_492_495,
sint64 s_492_495,
bit ne
)={
    u_492_494 * neg_f_472_low60_20_low20_0 + v_492_494 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_2 * (-(2**20)),
    r_492_494 * neg_f_472_low60_20_low20_0 + s_492_494 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_2 * (-(2**20))
&&
    u_492_494 * neg_f_472_low60_20_low20_0 + v_492_494 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_2 * (const 64 (-(2**20))),
    r_492_494 * neg_f_472_low60_20_low20_0 + s_492_494 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_2 + u_492_494 * (const 64 (2**21)) + v_492_494 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_2 + r_492_494 * (const 64 (2**21)) + s_492_494 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_2,
    neg_f_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_2,
    neg_g_472_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 494)) <=s delta, delta <=s (const 64 (1 + 2*494)),
    (const 64 (-(2**20))) <=s u_492_494, u_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_494, v_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_494, r_492_494 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_494, s_492_494 <=s (const 64 ((2**20))),
    u_492_494 + v_492_494 <=s (const 64 (2**20)),
    u_492_494 - v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 + v_492_494 <=s (const 64 (2**20)),
    (const 64 0) - u_492_494 - v_492_494 <=s (const 64 (2**20)),
    r_492_494 + s_492_494 <=s (const 64 (2**20)),
    r_492_494 - s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 + s_492_494 <=s (const 64 (2**20)),
    (const 64 0) - r_492_494 - s_492_494 <=s (const 64 (2**20)),
    u_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_492_494 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_492_494 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step494

// premise c
assume
neg_g_472_low60_20_low20_2 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_3 neg_g_472_low60_20_low20_2;
mov u_492_495 r_492_494;
mov v_492_495 s_492_494;

subs dc neg_g_472_low60_20_low20_3 neg_g_472_low60_20_low20_2 neg_f_472_low60_20_low20_2;
asr neg_g_472_low60_20_low20_3 neg_g_472_low60_20_low20_3 1;
subs dc r_492_495 r_492_494 u_492_494;
asr r_492_495 r_492_495 1;
subs dc s_492_495 s_492_494 v_492_494;
asr s_492_495 s_492_495 1;
assert
    true
&&
    neg_f_472_low60_20_low20_3 = neg_g_472_low60_20_low20_2,
    u_492_495 = r_492_494,
    v_492_495 = s_492_494,
    neg_g_472_low60_20_low20_3 * (const 64 2) = neg_g_472_low60_20_low20_2 - neg_f_472_low60_20_low20_2,
    r_492_495 * (const 64 2) = r_492_494 - u_492_494,
    s_492_495 * (const 64 2) = s_492_494 - v_492_494
;

assume
    neg_f_472_low60_20_low20_3 = neg_g_472_low60_20_low20_2,
    u_492_495 = r_492_494,
    v_492_495 = s_492_494,
    neg_g_472_low60_20_low20_3 * 2 = neg_g_472_low60_20_low20_2 - neg_f_472_low60_20_low20_2,
    r_492_495 * 2 = r_492_494 - u_492_494,
    s_492_495 * 2 = s_492_494 - v_492_494
&&
    true
;

{
    u_492_495 * neg_f_472_low60_20_low20_0 + v_492_495 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_495 * neg_f_472_low60_20_low20_0 + s_492_495 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_3 + u_492_495 * (const 64 (2**21)) + v_492_495 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_3 + r_492_495 * (const 64 (2**21)) + s_492_495 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_3,
    neg_f_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_3,
    neg_g_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 495)) <=s delta, delta <=s (const 64 (1 + 2*495)),
    (const 64 (-(2**20))) <=s u_492_495, u_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_495, v_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_495, r_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_495, s_492_495 <=s (const 64 ((2**20))),
    u_492_495 + v_492_495 <=s (const 64 (2**20)),
    u_492_495 - v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 + v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 - v_492_495 <=s (const 64 (2**20)),
    r_492_495 + s_492_495 <=s (const 64 (2**20)),
    r_492_495 - s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 + s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 - s_492_495 <=s (const 64 (2**20)),
    u_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_492_495 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_495_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_3,
sint64 neg_g_472_low60_20_low20_3,
sint64 neg_f_472_low60_20_low20_4,
sint64 neg_g_472_low60_20_low20_4,
sint64 u_492_495,
sint64 v_492_495,
sint64 r_492_495,
sint64 s_492_495,
sint64 u_492_496,
sint64 v_492_496,
sint64 r_492_496,
sint64 s_492_496,
bit ne
)={
    u_492_495 * neg_f_472_low60_20_low20_0 + v_492_495 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_3 * (-(2**20)),
    r_492_495 * neg_f_472_low60_20_low20_0 + s_492_495 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_3 * (-(2**20))
&&
    u_492_495 * neg_f_472_low60_20_low20_0 + v_492_495 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_3 * (const 64 (-(2**20))),
    r_492_495 * neg_f_472_low60_20_low20_0 + s_492_495 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_3 + u_492_495 * (const 64 (2**21)) + v_492_495 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_3 + r_492_495 * (const 64 (2**21)) + s_492_495 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_3,
    neg_f_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_3,
    neg_g_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 495)) <=s delta, delta <=s (const 64 (1 + 2*495)),
    (const 64 (-(2**20))) <=s u_492_495, u_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_495, v_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_495, r_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_495, s_492_495 <=s (const 64 ((2**20))),
    u_492_495 + v_492_495 <=s (const 64 (2**20)),
    u_492_495 - v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 + v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 - v_492_495 <=s (const 64 (2**20)),
    r_492_495 + s_492_495 <=s (const 64 (2**20)),
    r_492_495 - s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 + s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 - s_492_495 <=s (const 64 (2**20)),
    u_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_492_495 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step495

// premise a
assume
neg_g_472_low60_20_low20_3 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_4 neg_f_472_low60_20_low20_3;
mov u_492_496 u_492_495;
mov v_492_496 v_492_495;

asr neg_g_472_low60_20_low20_4 neg_g_472_low60_20_low20_3 1;
asr r_492_496 r_492_495 1;
asr s_492_496 s_492_495 1;
assert
    true
&&
    neg_f_472_low60_20_low20_4 = neg_f_472_low60_20_low20_3,
    u_492_496 = u_492_495,
    v_492_496 = v_492_495,
    neg_g_472_low60_20_low20_4 * (const 64 2) = neg_g_472_low60_20_low20_3,
    r_492_496 * (const 64 2) = r_492_495,
    s_492_496 * (const 64 2) = s_492_495
;

assume
    neg_f_472_low60_20_low20_4 = neg_f_472_low60_20_low20_3,
    u_492_496 = u_492_495,
    v_492_496 = v_492_495,
    neg_g_472_low60_20_low20_4 * 2 = neg_g_472_low60_20_low20_3,
    r_492_496 * 2 = r_492_495,
    s_492_496 * 2 = s_492_495
&&
    true
;

{
    u_492_496 * neg_f_472_low60_20_low20_0 + v_492_496 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_496 * neg_f_472_low60_20_low20_0 + s_492_496 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_4 + u_492_496 * (const 64 (2**21)) + v_492_496 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_4 + r_492_496 * (const 64 (2**21)) + s_492_496 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_4,
    neg_f_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_4,
    neg_g_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 496)) <=s delta, delta <=s (const 64 (1 + 2*496)),
    (const 64 (-(2**20))) <=s u_492_496, u_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_496, v_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_496, r_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_496, s_492_496 <=s (const 64 ((2**20))),
    u_492_496 + v_492_496 <=s (const 64 (2**20)),
    u_492_496 - v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 + v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 - v_492_496 <=s (const 64 (2**20)),
    r_492_496 + s_492_496 <=s (const 64 (2**20)),
    r_492_496 - s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 + s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 - s_492_496 <=s (const 64 (2**20)),
    u_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_492_496 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_495_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_3,
sint64 neg_g_472_low60_20_low20_3,
sint64 neg_f_472_low60_20_low20_4,
sint64 neg_g_472_low60_20_low20_4,
sint64 u_492_495,
sint64 v_492_495,
sint64 r_492_495,
sint64 s_492_495,
sint64 u_492_496,
sint64 v_492_496,
sint64 r_492_496,
sint64 s_492_496,
bit ne
)={
    u_492_495 * neg_f_472_low60_20_low20_0 + v_492_495 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_3 * (-(2**20)),
    r_492_495 * neg_f_472_low60_20_low20_0 + s_492_495 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_3 * (-(2**20))
&&
    u_492_495 * neg_f_472_low60_20_low20_0 + v_492_495 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_3 * (const 64 (-(2**20))),
    r_492_495 * neg_f_472_low60_20_low20_0 + s_492_495 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_3 + u_492_495 * (const 64 (2**21)) + v_492_495 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_3 + r_492_495 * (const 64 (2**21)) + s_492_495 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_3,
    neg_f_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_3,
    neg_g_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 495)) <=s delta, delta <=s (const 64 (1 + 2*495)),
    (const 64 (-(2**20))) <=s u_492_495, u_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_495, v_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_495, r_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_495, s_492_495 <=s (const 64 ((2**20))),
    u_492_495 + v_492_495 <=s (const 64 (2**20)),
    u_492_495 - v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 + v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 - v_492_495 <=s (const 64 (2**20)),
    r_492_495 + s_492_495 <=s (const 64 (2**20)),
    r_492_495 - s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 + s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 - s_492_495 <=s (const 64 (2**20)),
    u_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_492_495 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step495

// premise b
assume
neg_g_472_low60_20_low20_3 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_4 neg_f_472_low60_20_low20_3;
mov u_492_496 u_492_495;
mov v_492_496 v_492_495;

add neg_g_472_low60_20_low20_4 neg_g_472_low60_20_low20_3 neg_f_472_low60_20_low20_3;
asr neg_g_472_low60_20_low20_4 neg_g_472_low60_20_low20_4 1;
add r_492_496 r_492_495 u_492_495;
asr r_492_496 r_492_496 1;
add s_492_496 s_492_495 v_492_495;
asr s_492_496 s_492_496 1;
assert
    true
&&
    neg_f_472_low60_20_low20_4 = neg_f_472_low60_20_low20_3,
    u_492_496 = u_492_495,
    v_492_496 = v_492_495,
    neg_g_472_low60_20_low20_4 * (const 64 2) = neg_g_472_low60_20_low20_3 + neg_f_472_low60_20_low20_3,
    r_492_496 * (const 64 2) = r_492_495 + u_492_495,
    s_492_496 * (const 64 2) = s_492_495 + v_492_495
;

assume
    neg_f_472_low60_20_low20_4 = neg_f_472_low60_20_low20_3,
    u_492_496 = u_492_495,
    v_492_496 = v_492_495,
    neg_g_472_low60_20_low20_4 * 2 = neg_g_472_low60_20_low20_3 + neg_f_472_low60_20_low20_3,
    r_492_496 * 2 = r_492_495 + u_492_495,
    s_492_496 * 2 = s_492_495 + v_492_495
&&
    true
;

{
    u_492_496 * neg_f_472_low60_20_low20_0 + v_492_496 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_496 * neg_f_472_low60_20_low20_0 + s_492_496 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_4 + u_492_496 * (const 64 (2**21)) + v_492_496 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_4 + r_492_496 * (const 64 (2**21)) + s_492_496 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_4,
    neg_f_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_4,
    neg_g_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 496)) <=s delta, delta <=s (const 64 (1 + 2*496)),
    (const 64 (-(2**20))) <=s u_492_496, u_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_496, v_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_496, r_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_496, s_492_496 <=s (const 64 ((2**20))),
    u_492_496 + v_492_496 <=s (const 64 (2**20)),
    u_492_496 - v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 + v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 - v_492_496 <=s (const 64 (2**20)),
    r_492_496 + s_492_496 <=s (const 64 (2**20)),
    r_492_496 - s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 + s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 - s_492_496 <=s (const 64 (2**20)),
    u_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_492_496 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_495_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_3,
sint64 neg_g_472_low60_20_low20_3,
sint64 neg_f_472_low60_20_low20_4,
sint64 neg_g_472_low60_20_low20_4,
sint64 u_492_495,
sint64 v_492_495,
sint64 r_492_495,
sint64 s_492_495,
sint64 u_492_496,
sint64 v_492_496,
sint64 r_492_496,
sint64 s_492_496,
bit ne
)={
    u_492_495 * neg_f_472_low60_20_low20_0 + v_492_495 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_3 * (-(2**20)),
    r_492_495 * neg_f_472_low60_20_low20_0 + s_492_495 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_3 * (-(2**20))
&&
    u_492_495 * neg_f_472_low60_20_low20_0 + v_492_495 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_3 * (const 64 (-(2**20))),
    r_492_495 * neg_f_472_low60_20_low20_0 + s_492_495 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_3 + u_492_495 * (const 64 (2**21)) + v_492_495 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_3 + r_492_495 * (const 64 (2**21)) + s_492_495 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_3,
    neg_f_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_3,
    neg_g_472_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 495)) <=s delta, delta <=s (const 64 (1 + 2*495)),
    (const 64 (-(2**20))) <=s u_492_495, u_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_495, v_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_495, r_492_495 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_495, s_492_495 <=s (const 64 ((2**20))),
    u_492_495 + v_492_495 <=s (const 64 (2**20)),
    u_492_495 - v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 + v_492_495 <=s (const 64 (2**20)),
    (const 64 0) - u_492_495 - v_492_495 <=s (const 64 (2**20)),
    r_492_495 + s_492_495 <=s (const 64 (2**20)),
    r_492_495 - s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 + s_492_495 <=s (const 64 (2**20)),
    (const 64 0) - r_492_495 - s_492_495 <=s (const 64 (2**20)),
    u_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_492_495 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_492_495 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step495

// premise c
assume
neg_g_472_low60_20_low20_3 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_4 neg_g_472_low60_20_low20_3;
mov u_492_496 r_492_495;
mov v_492_496 s_492_495;

subs dc neg_g_472_low60_20_low20_4 neg_g_472_low60_20_low20_3 neg_f_472_low60_20_low20_3;
asr neg_g_472_low60_20_low20_4 neg_g_472_low60_20_low20_4 1;
subs dc r_492_496 r_492_495 u_492_495;
asr r_492_496 r_492_496 1;
subs dc s_492_496 s_492_495 v_492_495;
asr s_492_496 s_492_496 1;
assert
    true
&&
    neg_f_472_low60_20_low20_4 = neg_g_472_low60_20_low20_3,
    u_492_496 = r_492_495,
    v_492_496 = s_492_495,
    neg_g_472_low60_20_low20_4 * (const 64 2) = neg_g_472_low60_20_low20_3 - neg_f_472_low60_20_low20_3,
    r_492_496 * (const 64 2) = r_492_495 - u_492_495,
    s_492_496 * (const 64 2) = s_492_495 - v_492_495
;

assume
    neg_f_472_low60_20_low20_4 = neg_g_472_low60_20_low20_3,
    u_492_496 = r_492_495,
    v_492_496 = s_492_495,
    neg_g_472_low60_20_low20_4 * 2 = neg_g_472_low60_20_low20_3 - neg_f_472_low60_20_low20_3,
    r_492_496 * 2 = r_492_495 - u_492_495,
    s_492_496 * 2 = s_492_495 - v_492_495
&&
    true
;

{
    u_492_496 * neg_f_472_low60_20_low20_0 + v_492_496 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_496 * neg_f_472_low60_20_low20_0 + s_492_496 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_4 + u_492_496 * (const 64 (2**21)) + v_492_496 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_4 + r_492_496 * (const 64 (2**21)) + s_492_496 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_4,
    neg_f_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_4,
    neg_g_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 496)) <=s delta, delta <=s (const 64 (1 + 2*496)),
    (const 64 (-(2**20))) <=s u_492_496, u_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_496, v_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_496, r_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_496, s_492_496 <=s (const 64 ((2**20))),
    u_492_496 + v_492_496 <=s (const 64 (2**20)),
    u_492_496 - v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 + v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 - v_492_496 <=s (const 64 (2**20)),
    r_492_496 + s_492_496 <=s (const 64 (2**20)),
    r_492_496 - s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 + s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 - s_492_496 <=s (const 64 (2**20)),
    u_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_492_496 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_496_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_4,
sint64 neg_g_472_low60_20_low20_4,
sint64 neg_f_472_low60_20_low20_5,
sint64 neg_g_472_low60_20_low20_5,
sint64 u_492_496,
sint64 v_492_496,
sint64 r_492_496,
sint64 s_492_496,
sint64 u_492_497,
sint64 v_492_497,
sint64 r_492_497,
sint64 s_492_497,
bit ne
)={
    u_492_496 * neg_f_472_low60_20_low20_0 + v_492_496 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_4 * (-(2**20)),
    r_492_496 * neg_f_472_low60_20_low20_0 + s_492_496 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_4 * (-(2**20))
&&
    u_492_496 * neg_f_472_low60_20_low20_0 + v_492_496 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_4 * (const 64 (-(2**20))),
    r_492_496 * neg_f_472_low60_20_low20_0 + s_492_496 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_4 + u_492_496 * (const 64 (2**21)) + v_492_496 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_4 + r_492_496 * (const 64 (2**21)) + s_492_496 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_4,
    neg_f_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_4,
    neg_g_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 496)) <=s delta, delta <=s (const 64 (1 + 2*496)),
    (const 64 (-(2**20))) <=s u_492_496, u_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_496, v_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_496, r_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_496, s_492_496 <=s (const 64 ((2**20))),
    u_492_496 + v_492_496 <=s (const 64 (2**20)),
    u_492_496 - v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 + v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 - v_492_496 <=s (const 64 (2**20)),
    r_492_496 + s_492_496 <=s (const 64 (2**20)),
    r_492_496 - s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 + s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 - s_492_496 <=s (const 64 (2**20)),
    u_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_492_496 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step496

// premise a
assume
neg_g_472_low60_20_low20_4 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_5 neg_f_472_low60_20_low20_4;
mov u_492_497 u_492_496;
mov v_492_497 v_492_496;

asr neg_g_472_low60_20_low20_5 neg_g_472_low60_20_low20_4 1;
asr r_492_497 r_492_496 1;
asr s_492_497 s_492_496 1;
assert
    true
&&
    neg_f_472_low60_20_low20_5 = neg_f_472_low60_20_low20_4,
    u_492_497 = u_492_496,
    v_492_497 = v_492_496,
    neg_g_472_low60_20_low20_5 * (const 64 2) = neg_g_472_low60_20_low20_4,
    r_492_497 * (const 64 2) = r_492_496,
    s_492_497 * (const 64 2) = s_492_496
;

assume
    neg_f_472_low60_20_low20_5 = neg_f_472_low60_20_low20_4,
    u_492_497 = u_492_496,
    v_492_497 = v_492_496,
    neg_g_472_low60_20_low20_5 * 2 = neg_g_472_low60_20_low20_4,
    r_492_497 * 2 = r_492_496,
    s_492_497 * 2 = s_492_496
&&
    true
;

{
    u_492_497 * neg_f_472_low60_20_low20_0 + v_492_497 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_497 * neg_f_472_low60_20_low20_0 + s_492_497 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_5 + u_492_497 * (const 64 (2**21)) + v_492_497 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_5 + r_492_497 * (const 64 (2**21)) + s_492_497 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_5,
    neg_f_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_5,
    neg_g_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 497)) <=s delta, delta <=s (const 64 (1 + 2*497)),
    (const 64 (-(2**20))) <=s u_492_497, u_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_497, v_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_497, r_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_497, s_492_497 <=s (const 64 ((2**20))),
    u_492_497 + v_492_497 <=s (const 64 (2**20)),
    u_492_497 - v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 + v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 - v_492_497 <=s (const 64 (2**20)),
    r_492_497 + s_492_497 <=s (const 64 (2**20)),
    r_492_497 - s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 + s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 - s_492_497 <=s (const 64 (2**20)),
    u_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_492_497 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_496_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_4,
sint64 neg_g_472_low60_20_low20_4,
sint64 neg_f_472_low60_20_low20_5,
sint64 neg_g_472_low60_20_low20_5,
sint64 u_492_496,
sint64 v_492_496,
sint64 r_492_496,
sint64 s_492_496,
sint64 u_492_497,
sint64 v_492_497,
sint64 r_492_497,
sint64 s_492_497,
bit ne
)={
    u_492_496 * neg_f_472_low60_20_low20_0 + v_492_496 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_4 * (-(2**20)),
    r_492_496 * neg_f_472_low60_20_low20_0 + s_492_496 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_4 * (-(2**20))
&&
    u_492_496 * neg_f_472_low60_20_low20_0 + v_492_496 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_4 * (const 64 (-(2**20))),
    r_492_496 * neg_f_472_low60_20_low20_0 + s_492_496 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_4 + u_492_496 * (const 64 (2**21)) + v_492_496 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_4 + r_492_496 * (const 64 (2**21)) + s_492_496 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_4,
    neg_f_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_4,
    neg_g_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 496)) <=s delta, delta <=s (const 64 (1 + 2*496)),
    (const 64 (-(2**20))) <=s u_492_496, u_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_496, v_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_496, r_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_496, s_492_496 <=s (const 64 ((2**20))),
    u_492_496 + v_492_496 <=s (const 64 (2**20)),
    u_492_496 - v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 + v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 - v_492_496 <=s (const 64 (2**20)),
    r_492_496 + s_492_496 <=s (const 64 (2**20)),
    r_492_496 - s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 + s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 - s_492_496 <=s (const 64 (2**20)),
    u_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_492_496 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step496

// premise b
assume
neg_g_472_low60_20_low20_4 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_5 neg_f_472_low60_20_low20_4;
mov u_492_497 u_492_496;
mov v_492_497 v_492_496;

add neg_g_472_low60_20_low20_5 neg_g_472_low60_20_low20_4 neg_f_472_low60_20_low20_4;
asr neg_g_472_low60_20_low20_5 neg_g_472_low60_20_low20_5 1;
add r_492_497 r_492_496 u_492_496;
asr r_492_497 r_492_497 1;
add s_492_497 s_492_496 v_492_496;
asr s_492_497 s_492_497 1;
assert
    true
&&
    neg_f_472_low60_20_low20_5 = neg_f_472_low60_20_low20_4,
    u_492_497 = u_492_496,
    v_492_497 = v_492_496,
    neg_g_472_low60_20_low20_5 * (const 64 2) = neg_g_472_low60_20_low20_4 + neg_f_472_low60_20_low20_4,
    r_492_497 * (const 64 2) = r_492_496 + u_492_496,
    s_492_497 * (const 64 2) = s_492_496 + v_492_496
;

assume
    neg_f_472_low60_20_low20_5 = neg_f_472_low60_20_low20_4,
    u_492_497 = u_492_496,
    v_492_497 = v_492_496,
    neg_g_472_low60_20_low20_5 * 2 = neg_g_472_low60_20_low20_4 + neg_f_472_low60_20_low20_4,
    r_492_497 * 2 = r_492_496 + u_492_496,
    s_492_497 * 2 = s_492_496 + v_492_496
&&
    true
;

{
    u_492_497 * neg_f_472_low60_20_low20_0 + v_492_497 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_497 * neg_f_472_low60_20_low20_0 + s_492_497 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_5 + u_492_497 * (const 64 (2**21)) + v_492_497 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_5 + r_492_497 * (const 64 (2**21)) + s_492_497 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_5,
    neg_f_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_5,
    neg_g_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 497)) <=s delta, delta <=s (const 64 (1 + 2*497)),
    (const 64 (-(2**20))) <=s u_492_497, u_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_497, v_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_497, r_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_497, s_492_497 <=s (const 64 ((2**20))),
    u_492_497 + v_492_497 <=s (const 64 (2**20)),
    u_492_497 - v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 + v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 - v_492_497 <=s (const 64 (2**20)),
    r_492_497 + s_492_497 <=s (const 64 (2**20)),
    r_492_497 - s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 + s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 - s_492_497 <=s (const 64 (2**20)),
    u_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_492_497 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_496_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_4,
sint64 neg_g_472_low60_20_low20_4,
sint64 neg_f_472_low60_20_low20_5,
sint64 neg_g_472_low60_20_low20_5,
sint64 u_492_496,
sint64 v_492_496,
sint64 r_492_496,
sint64 s_492_496,
sint64 u_492_497,
sint64 v_492_497,
sint64 r_492_497,
sint64 s_492_497,
bit ne
)={
    u_492_496 * neg_f_472_low60_20_low20_0 + v_492_496 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_4 * (-(2**20)),
    r_492_496 * neg_f_472_low60_20_low20_0 + s_492_496 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_4 * (-(2**20))
&&
    u_492_496 * neg_f_472_low60_20_low20_0 + v_492_496 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_4 * (const 64 (-(2**20))),
    r_492_496 * neg_f_472_low60_20_low20_0 + s_492_496 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_4 + u_492_496 * (const 64 (2**21)) + v_492_496 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_4 + r_492_496 * (const 64 (2**21)) + s_492_496 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_4,
    neg_f_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_4,
    neg_g_472_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 496)) <=s delta, delta <=s (const 64 (1 + 2*496)),
    (const 64 (-(2**20))) <=s u_492_496, u_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_496, v_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_496, r_492_496 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_496, s_492_496 <=s (const 64 ((2**20))),
    u_492_496 + v_492_496 <=s (const 64 (2**20)),
    u_492_496 - v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 + v_492_496 <=s (const 64 (2**20)),
    (const 64 0) - u_492_496 - v_492_496 <=s (const 64 (2**20)),
    r_492_496 + s_492_496 <=s (const 64 (2**20)),
    r_492_496 - s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 + s_492_496 <=s (const 64 (2**20)),
    (const 64 0) - r_492_496 - s_492_496 <=s (const 64 (2**20)),
    u_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_492_496 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_492_496 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step496

// premise c
assume
neg_g_472_low60_20_low20_4 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_5 neg_g_472_low60_20_low20_4;
mov u_492_497 r_492_496;
mov v_492_497 s_492_496;

subs dc neg_g_472_low60_20_low20_5 neg_g_472_low60_20_low20_4 neg_f_472_low60_20_low20_4;
asr neg_g_472_low60_20_low20_5 neg_g_472_low60_20_low20_5 1;
subs dc r_492_497 r_492_496 u_492_496;
asr r_492_497 r_492_497 1;
subs dc s_492_497 s_492_496 v_492_496;
asr s_492_497 s_492_497 1;
assert
    true
&&
    neg_f_472_low60_20_low20_5 = neg_g_472_low60_20_low20_4,
    u_492_497 = r_492_496,
    v_492_497 = s_492_496,
    neg_g_472_low60_20_low20_5 * (const 64 2) = neg_g_472_low60_20_low20_4 - neg_f_472_low60_20_low20_4,
    r_492_497 * (const 64 2) = r_492_496 - u_492_496,
    s_492_497 * (const 64 2) = s_492_496 - v_492_496
;

assume
    neg_f_472_low60_20_low20_5 = neg_g_472_low60_20_low20_4,
    u_492_497 = r_492_496,
    v_492_497 = s_492_496,
    neg_g_472_low60_20_low20_5 * 2 = neg_g_472_low60_20_low20_4 - neg_f_472_low60_20_low20_4,
    r_492_497 * 2 = r_492_496 - u_492_496,
    s_492_497 * 2 = s_492_496 - v_492_496
&&
    true
;

{
    u_492_497 * neg_f_472_low60_20_low20_0 + v_492_497 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_497 * neg_f_472_low60_20_low20_0 + s_492_497 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_5 + u_492_497 * (const 64 (2**21)) + v_492_497 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_5 + r_492_497 * (const 64 (2**21)) + s_492_497 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_5,
    neg_f_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_5,
    neg_g_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 497)) <=s delta, delta <=s (const 64 (1 + 2*497)),
    (const 64 (-(2**20))) <=s u_492_497, u_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_497, v_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_497, r_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_497, s_492_497 <=s (const 64 ((2**20))),
    u_492_497 + v_492_497 <=s (const 64 (2**20)),
    u_492_497 - v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 + v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 - v_492_497 <=s (const 64 (2**20)),
    r_492_497 + s_492_497 <=s (const 64 (2**20)),
    r_492_497 - s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 + s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 - s_492_497 <=s (const 64 (2**20)),
    u_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_492_497 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_497_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_5,
sint64 neg_g_472_low60_20_low20_5,
sint64 neg_f_472_low60_20_low20_6,
sint64 neg_g_472_low60_20_low20_6,
sint64 u_492_497,
sint64 v_492_497,
sint64 r_492_497,
sint64 s_492_497,
sint64 u_492_498,
sint64 v_492_498,
sint64 r_492_498,
sint64 s_492_498,
bit ne
)={
    u_492_497 * neg_f_472_low60_20_low20_0 + v_492_497 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_5 * (-(2**20)),
    r_492_497 * neg_f_472_low60_20_low20_0 + s_492_497 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_5 * (-(2**20))
&&
    u_492_497 * neg_f_472_low60_20_low20_0 + v_492_497 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_5 * (const 64 (-(2**20))),
    r_492_497 * neg_f_472_low60_20_low20_0 + s_492_497 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_5 + u_492_497 * (const 64 (2**21)) + v_492_497 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_5 + r_492_497 * (const 64 (2**21)) + s_492_497 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_5,
    neg_f_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_5,
    neg_g_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 497)) <=s delta, delta <=s (const 64 (1 + 2*497)),
    (const 64 (-(2**20))) <=s u_492_497, u_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_497, v_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_497, r_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_497, s_492_497 <=s (const 64 ((2**20))),
    u_492_497 + v_492_497 <=s (const 64 (2**20)),
    u_492_497 - v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 + v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 - v_492_497 <=s (const 64 (2**20)),
    r_492_497 + s_492_497 <=s (const 64 (2**20)),
    r_492_497 - s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 + s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 - s_492_497 <=s (const 64 (2**20)),
    u_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_492_497 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step497

// premise a
assume
neg_g_472_low60_20_low20_5 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_6 neg_f_472_low60_20_low20_5;
mov u_492_498 u_492_497;
mov v_492_498 v_492_497;

asr neg_g_472_low60_20_low20_6 neg_g_472_low60_20_low20_5 1;
asr r_492_498 r_492_497 1;
asr s_492_498 s_492_497 1;
assert
    true
&&
    neg_f_472_low60_20_low20_6 = neg_f_472_low60_20_low20_5,
    u_492_498 = u_492_497,
    v_492_498 = v_492_497,
    neg_g_472_low60_20_low20_6 * (const 64 2) = neg_g_472_low60_20_low20_5,
    r_492_498 * (const 64 2) = r_492_497,
    s_492_498 * (const 64 2) = s_492_497
;

assume
    neg_f_472_low60_20_low20_6 = neg_f_472_low60_20_low20_5,
    u_492_498 = u_492_497,
    v_492_498 = v_492_497,
    neg_g_472_low60_20_low20_6 * 2 = neg_g_472_low60_20_low20_5,
    r_492_498 * 2 = r_492_497,
    s_492_498 * 2 = s_492_497
&&
    true
;

{
    u_492_498 * neg_f_472_low60_20_low20_0 + v_492_498 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_498 * neg_f_472_low60_20_low20_0 + s_492_498 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_6 + u_492_498 * (const 64 (2**21)) + v_492_498 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_6 + r_492_498 * (const 64 (2**21)) + s_492_498 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_6,
    neg_f_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_6,
    neg_g_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 498)) <=s delta, delta <=s (const 64 (1 + 2*498)),
    (const 64 (-(2**20))) <=s u_492_498, u_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_498, v_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_498, r_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_498, s_492_498 <=s (const 64 ((2**20))),
    u_492_498 + v_492_498 <=s (const 64 (2**20)),
    u_492_498 - v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 + v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 - v_492_498 <=s (const 64 (2**20)),
    r_492_498 + s_492_498 <=s (const 64 (2**20)),
    r_492_498 - s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 + s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 - s_492_498 <=s (const 64 (2**20)),
    u_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_492_498 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_497_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_5,
sint64 neg_g_472_low60_20_low20_5,
sint64 neg_f_472_low60_20_low20_6,
sint64 neg_g_472_low60_20_low20_6,
sint64 u_492_497,
sint64 v_492_497,
sint64 r_492_497,
sint64 s_492_497,
sint64 u_492_498,
sint64 v_492_498,
sint64 r_492_498,
sint64 s_492_498,
bit ne
)={
    u_492_497 * neg_f_472_low60_20_low20_0 + v_492_497 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_5 * (-(2**20)),
    r_492_497 * neg_f_472_low60_20_low20_0 + s_492_497 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_5 * (-(2**20))
&&
    u_492_497 * neg_f_472_low60_20_low20_0 + v_492_497 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_5 * (const 64 (-(2**20))),
    r_492_497 * neg_f_472_low60_20_low20_0 + s_492_497 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_5 + u_492_497 * (const 64 (2**21)) + v_492_497 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_5 + r_492_497 * (const 64 (2**21)) + s_492_497 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_5,
    neg_f_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_5,
    neg_g_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 497)) <=s delta, delta <=s (const 64 (1 + 2*497)),
    (const 64 (-(2**20))) <=s u_492_497, u_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_497, v_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_497, r_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_497, s_492_497 <=s (const 64 ((2**20))),
    u_492_497 + v_492_497 <=s (const 64 (2**20)),
    u_492_497 - v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 + v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 - v_492_497 <=s (const 64 (2**20)),
    r_492_497 + s_492_497 <=s (const 64 (2**20)),
    r_492_497 - s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 + s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 - s_492_497 <=s (const 64 (2**20)),
    u_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_492_497 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step497

// premise b
assume
neg_g_472_low60_20_low20_5 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_6 neg_f_472_low60_20_low20_5;
mov u_492_498 u_492_497;
mov v_492_498 v_492_497;

add neg_g_472_low60_20_low20_6 neg_g_472_low60_20_low20_5 neg_f_472_low60_20_low20_5;
asr neg_g_472_low60_20_low20_6 neg_g_472_low60_20_low20_6 1;
add r_492_498 r_492_497 u_492_497;
asr r_492_498 r_492_498 1;
add s_492_498 s_492_497 v_492_497;
asr s_492_498 s_492_498 1;
assert
    true
&&
    neg_f_472_low60_20_low20_6 = neg_f_472_low60_20_low20_5,
    u_492_498 = u_492_497,
    v_492_498 = v_492_497,
    neg_g_472_low60_20_low20_6 * (const 64 2) = neg_g_472_low60_20_low20_5 + neg_f_472_low60_20_low20_5,
    r_492_498 * (const 64 2) = r_492_497 + u_492_497,
    s_492_498 * (const 64 2) = s_492_497 + v_492_497
;

assume
    neg_f_472_low60_20_low20_6 = neg_f_472_low60_20_low20_5,
    u_492_498 = u_492_497,
    v_492_498 = v_492_497,
    neg_g_472_low60_20_low20_6 * 2 = neg_g_472_low60_20_low20_5 + neg_f_472_low60_20_low20_5,
    r_492_498 * 2 = r_492_497 + u_492_497,
    s_492_498 * 2 = s_492_497 + v_492_497
&&
    true
;

{
    u_492_498 * neg_f_472_low60_20_low20_0 + v_492_498 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_498 * neg_f_472_low60_20_low20_0 + s_492_498 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_6 + u_492_498 * (const 64 (2**21)) + v_492_498 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_6 + r_492_498 * (const 64 (2**21)) + s_492_498 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_6,
    neg_f_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_6,
    neg_g_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 498)) <=s delta, delta <=s (const 64 (1 + 2*498)),
    (const 64 (-(2**20))) <=s u_492_498, u_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_498, v_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_498, r_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_498, s_492_498 <=s (const 64 ((2**20))),
    u_492_498 + v_492_498 <=s (const 64 (2**20)),
    u_492_498 - v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 + v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 - v_492_498 <=s (const 64 (2**20)),
    r_492_498 + s_492_498 <=s (const 64 (2**20)),
    r_492_498 - s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 + s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 - s_492_498 <=s (const 64 (2**20)),
    u_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_492_498 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_497_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_5,
sint64 neg_g_472_low60_20_low20_5,
sint64 neg_f_472_low60_20_low20_6,
sint64 neg_g_472_low60_20_low20_6,
sint64 u_492_497,
sint64 v_492_497,
sint64 r_492_497,
sint64 s_492_497,
sint64 u_492_498,
sint64 v_492_498,
sint64 r_492_498,
sint64 s_492_498,
bit ne
)={
    u_492_497 * neg_f_472_low60_20_low20_0 + v_492_497 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_5 * (-(2**20)),
    r_492_497 * neg_f_472_low60_20_low20_0 + s_492_497 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_5 * (-(2**20))
&&
    u_492_497 * neg_f_472_low60_20_low20_0 + v_492_497 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_5 * (const 64 (-(2**20))),
    r_492_497 * neg_f_472_low60_20_low20_0 + s_492_497 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_5 + u_492_497 * (const 64 (2**21)) + v_492_497 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_5 + r_492_497 * (const 64 (2**21)) + s_492_497 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_5,
    neg_f_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_5,
    neg_g_472_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 497)) <=s delta, delta <=s (const 64 (1 + 2*497)),
    (const 64 (-(2**20))) <=s u_492_497, u_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_497, v_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_497, r_492_497 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_497, s_492_497 <=s (const 64 ((2**20))),
    u_492_497 + v_492_497 <=s (const 64 (2**20)),
    u_492_497 - v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 + v_492_497 <=s (const 64 (2**20)),
    (const 64 0) - u_492_497 - v_492_497 <=s (const 64 (2**20)),
    r_492_497 + s_492_497 <=s (const 64 (2**20)),
    r_492_497 - s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 + s_492_497 <=s (const 64 (2**20)),
    (const 64 0) - r_492_497 - s_492_497 <=s (const 64 (2**20)),
    u_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_492_497 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_492_497 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step497

// premise c
assume
neg_g_472_low60_20_low20_5 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_6 neg_g_472_low60_20_low20_5;
mov u_492_498 r_492_497;
mov v_492_498 s_492_497;

subs dc neg_g_472_low60_20_low20_6 neg_g_472_low60_20_low20_5 neg_f_472_low60_20_low20_5;
asr neg_g_472_low60_20_low20_6 neg_g_472_low60_20_low20_6 1;
subs dc r_492_498 r_492_497 u_492_497;
asr r_492_498 r_492_498 1;
subs dc s_492_498 s_492_497 v_492_497;
asr s_492_498 s_492_498 1;
assert
    true
&&
    neg_f_472_low60_20_low20_6 = neg_g_472_low60_20_low20_5,
    u_492_498 = r_492_497,
    v_492_498 = s_492_497,
    neg_g_472_low60_20_low20_6 * (const 64 2) = neg_g_472_low60_20_low20_5 - neg_f_472_low60_20_low20_5,
    r_492_498 * (const 64 2) = r_492_497 - u_492_497,
    s_492_498 * (const 64 2) = s_492_497 - v_492_497
;

assume
    neg_f_472_low60_20_low20_6 = neg_g_472_low60_20_low20_5,
    u_492_498 = r_492_497,
    v_492_498 = s_492_497,
    neg_g_472_low60_20_low20_6 * 2 = neg_g_472_low60_20_low20_5 - neg_f_472_low60_20_low20_5,
    r_492_498 * 2 = r_492_497 - u_492_497,
    s_492_498 * 2 = s_492_497 - v_492_497
&&
    true
;

{
    u_492_498 * neg_f_472_low60_20_low20_0 + v_492_498 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_498 * neg_f_472_low60_20_low20_0 + s_492_498 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_6 + u_492_498 * (const 64 (2**21)) + v_492_498 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_6 + r_492_498 * (const 64 (2**21)) + s_492_498 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_6,
    neg_f_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_6,
    neg_g_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 498)) <=s delta, delta <=s (const 64 (1 + 2*498)),
    (const 64 (-(2**20))) <=s u_492_498, u_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_498, v_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_498, r_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_498, s_492_498 <=s (const 64 ((2**20))),
    u_492_498 + v_492_498 <=s (const 64 (2**20)),
    u_492_498 - v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 + v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 - v_492_498 <=s (const 64 (2**20)),
    r_492_498 + s_492_498 <=s (const 64 (2**20)),
    r_492_498 - s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 + s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 - s_492_498 <=s (const 64 (2**20)),
    u_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_492_498 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_498_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_6,
sint64 neg_g_472_low60_20_low20_6,
sint64 neg_f_472_low60_20_low20_7,
sint64 neg_g_472_low60_20_low20_7,
sint64 u_492_498,
sint64 v_492_498,
sint64 r_492_498,
sint64 s_492_498,
sint64 u_492_499,
sint64 v_492_499,
sint64 r_492_499,
sint64 s_492_499,
bit ne
)={
    u_492_498 * neg_f_472_low60_20_low20_0 + v_492_498 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_6 * (-(2**20)),
    r_492_498 * neg_f_472_low60_20_low20_0 + s_492_498 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_6 * (-(2**20))
&&
    u_492_498 * neg_f_472_low60_20_low20_0 + v_492_498 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_6 * (const 64 (-(2**20))),
    r_492_498 * neg_f_472_low60_20_low20_0 + s_492_498 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_6 + u_492_498 * (const 64 (2**21)) + v_492_498 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_6 + r_492_498 * (const 64 (2**21)) + s_492_498 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_6,
    neg_f_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_6,
    neg_g_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 498)) <=s delta, delta <=s (const 64 (1 + 2*498)),
    (const 64 (-(2**20))) <=s u_492_498, u_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_498, v_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_498, r_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_498, s_492_498 <=s (const 64 ((2**20))),
    u_492_498 + v_492_498 <=s (const 64 (2**20)),
    u_492_498 - v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 + v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 - v_492_498 <=s (const 64 (2**20)),
    r_492_498 + s_492_498 <=s (const 64 (2**20)),
    r_492_498 - s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 + s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 - s_492_498 <=s (const 64 (2**20)),
    u_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_492_498 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step498

// premise a
assume
neg_g_472_low60_20_low20_6 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_7 neg_f_472_low60_20_low20_6;
mov u_492_499 u_492_498;
mov v_492_499 v_492_498;

asr neg_g_472_low60_20_low20_7 neg_g_472_low60_20_low20_6 1;
asr r_492_499 r_492_498 1;
asr s_492_499 s_492_498 1;
assert
    true
&&
    neg_f_472_low60_20_low20_7 = neg_f_472_low60_20_low20_6,
    u_492_499 = u_492_498,
    v_492_499 = v_492_498,
    neg_g_472_low60_20_low20_7 * (const 64 2) = neg_g_472_low60_20_low20_6,
    r_492_499 * (const 64 2) = r_492_498,
    s_492_499 * (const 64 2) = s_492_498
;

assume
    neg_f_472_low60_20_low20_7 = neg_f_472_low60_20_low20_6,
    u_492_499 = u_492_498,
    v_492_499 = v_492_498,
    neg_g_472_low60_20_low20_7 * 2 = neg_g_472_low60_20_low20_6,
    r_492_499 * 2 = r_492_498,
    s_492_499 * 2 = s_492_498
&&
    true
;

{
    u_492_499 * neg_f_472_low60_20_low20_0 + v_492_499 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_499 * neg_f_472_low60_20_low20_0 + s_492_499 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_7 + u_492_499 * (const 64 (2**21)) + v_492_499 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_7 + r_492_499 * (const 64 (2**21)) + s_492_499 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_7,
    neg_f_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_7,
    neg_g_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 499)) <=s delta, delta <=s (const 64 (1 + 2*499)),
    (const 64 (-(2**20))) <=s u_492_499, u_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_499, v_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_499, r_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_499, s_492_499 <=s (const 64 ((2**20))),
    u_492_499 + v_492_499 <=s (const 64 (2**20)),
    u_492_499 - v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 + v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 - v_492_499 <=s (const 64 (2**20)),
    r_492_499 + s_492_499 <=s (const 64 (2**20)),
    r_492_499 - s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 + s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 - s_492_499 <=s (const 64 (2**20)),
    u_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_492_499 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_498_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_6,
sint64 neg_g_472_low60_20_low20_6,
sint64 neg_f_472_low60_20_low20_7,
sint64 neg_g_472_low60_20_low20_7,
sint64 u_492_498,
sint64 v_492_498,
sint64 r_492_498,
sint64 s_492_498,
sint64 u_492_499,
sint64 v_492_499,
sint64 r_492_499,
sint64 s_492_499,
bit ne
)={
    u_492_498 * neg_f_472_low60_20_low20_0 + v_492_498 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_6 * (-(2**20)),
    r_492_498 * neg_f_472_low60_20_low20_0 + s_492_498 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_6 * (-(2**20))
&&
    u_492_498 * neg_f_472_low60_20_low20_0 + v_492_498 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_6 * (const 64 (-(2**20))),
    r_492_498 * neg_f_472_low60_20_low20_0 + s_492_498 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_6 + u_492_498 * (const 64 (2**21)) + v_492_498 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_6 + r_492_498 * (const 64 (2**21)) + s_492_498 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_6,
    neg_f_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_6,
    neg_g_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 498)) <=s delta, delta <=s (const 64 (1 + 2*498)),
    (const 64 (-(2**20))) <=s u_492_498, u_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_498, v_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_498, r_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_498, s_492_498 <=s (const 64 ((2**20))),
    u_492_498 + v_492_498 <=s (const 64 (2**20)),
    u_492_498 - v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 + v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 - v_492_498 <=s (const 64 (2**20)),
    r_492_498 + s_492_498 <=s (const 64 (2**20)),
    r_492_498 - s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 + s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 - s_492_498 <=s (const 64 (2**20)),
    u_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_492_498 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step498

// premise b
assume
neg_g_472_low60_20_low20_6 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_7 neg_f_472_low60_20_low20_6;
mov u_492_499 u_492_498;
mov v_492_499 v_492_498;

add neg_g_472_low60_20_low20_7 neg_g_472_low60_20_low20_6 neg_f_472_low60_20_low20_6;
asr neg_g_472_low60_20_low20_7 neg_g_472_low60_20_low20_7 1;
add r_492_499 r_492_498 u_492_498;
asr r_492_499 r_492_499 1;
add s_492_499 s_492_498 v_492_498;
asr s_492_499 s_492_499 1;
assert
    true
&&
    neg_f_472_low60_20_low20_7 = neg_f_472_low60_20_low20_6,
    u_492_499 = u_492_498,
    v_492_499 = v_492_498,
    neg_g_472_low60_20_low20_7 * (const 64 2) = neg_g_472_low60_20_low20_6 + neg_f_472_low60_20_low20_6,
    r_492_499 * (const 64 2) = r_492_498 + u_492_498,
    s_492_499 * (const 64 2) = s_492_498 + v_492_498
;

assume
    neg_f_472_low60_20_low20_7 = neg_f_472_low60_20_low20_6,
    u_492_499 = u_492_498,
    v_492_499 = v_492_498,
    neg_g_472_low60_20_low20_7 * 2 = neg_g_472_low60_20_low20_6 + neg_f_472_low60_20_low20_6,
    r_492_499 * 2 = r_492_498 + u_492_498,
    s_492_499 * 2 = s_492_498 + v_492_498
&&
    true
;

{
    u_492_499 * neg_f_472_low60_20_low20_0 + v_492_499 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_499 * neg_f_472_low60_20_low20_0 + s_492_499 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_7 + u_492_499 * (const 64 (2**21)) + v_492_499 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_7 + r_492_499 * (const 64 (2**21)) + s_492_499 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_7,
    neg_f_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_7,
    neg_g_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 499)) <=s delta, delta <=s (const 64 (1 + 2*499)),
    (const 64 (-(2**20))) <=s u_492_499, u_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_499, v_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_499, r_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_499, s_492_499 <=s (const 64 ((2**20))),
    u_492_499 + v_492_499 <=s (const 64 (2**20)),
    u_492_499 - v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 + v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 - v_492_499 <=s (const 64 (2**20)),
    r_492_499 + s_492_499 <=s (const 64 (2**20)),
    r_492_499 - s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 + s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 - s_492_499 <=s (const 64 (2**20)),
    u_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_492_499 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_498_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_6,
sint64 neg_g_472_low60_20_low20_6,
sint64 neg_f_472_low60_20_low20_7,
sint64 neg_g_472_low60_20_low20_7,
sint64 u_492_498,
sint64 v_492_498,
sint64 r_492_498,
sint64 s_492_498,
sint64 u_492_499,
sint64 v_492_499,
sint64 r_492_499,
sint64 s_492_499,
bit ne
)={
    u_492_498 * neg_f_472_low60_20_low20_0 + v_492_498 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_6 * (-(2**20)),
    r_492_498 * neg_f_472_low60_20_low20_0 + s_492_498 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_6 * (-(2**20))
&&
    u_492_498 * neg_f_472_low60_20_low20_0 + v_492_498 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_6 * (const 64 (-(2**20))),
    r_492_498 * neg_f_472_low60_20_low20_0 + s_492_498 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_6 + u_492_498 * (const 64 (2**21)) + v_492_498 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_6 + r_492_498 * (const 64 (2**21)) + s_492_498 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_6,
    neg_f_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_6,
    neg_g_472_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 498)) <=s delta, delta <=s (const 64 (1 + 2*498)),
    (const 64 (-(2**20))) <=s u_492_498, u_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_498, v_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_498, r_492_498 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_498, s_492_498 <=s (const 64 ((2**20))),
    u_492_498 + v_492_498 <=s (const 64 (2**20)),
    u_492_498 - v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 + v_492_498 <=s (const 64 (2**20)),
    (const 64 0) - u_492_498 - v_492_498 <=s (const 64 (2**20)),
    r_492_498 + s_492_498 <=s (const 64 (2**20)),
    r_492_498 - s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 + s_492_498 <=s (const 64 (2**20)),
    (const 64 0) - r_492_498 - s_492_498 <=s (const 64 (2**20)),
    u_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_492_498 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_492_498 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step498

// premise c
assume
neg_g_472_low60_20_low20_6 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_7 neg_g_472_low60_20_low20_6;
mov u_492_499 r_492_498;
mov v_492_499 s_492_498;

subs dc neg_g_472_low60_20_low20_7 neg_g_472_low60_20_low20_6 neg_f_472_low60_20_low20_6;
asr neg_g_472_low60_20_low20_7 neg_g_472_low60_20_low20_7 1;
subs dc r_492_499 r_492_498 u_492_498;
asr r_492_499 r_492_499 1;
subs dc s_492_499 s_492_498 v_492_498;
asr s_492_499 s_492_499 1;
assert
    true
&&
    neg_f_472_low60_20_low20_7 = neg_g_472_low60_20_low20_6,
    u_492_499 = r_492_498,
    v_492_499 = s_492_498,
    neg_g_472_low60_20_low20_7 * (const 64 2) = neg_g_472_low60_20_low20_6 - neg_f_472_low60_20_low20_6,
    r_492_499 * (const 64 2) = r_492_498 - u_492_498,
    s_492_499 * (const 64 2) = s_492_498 - v_492_498
;

assume
    neg_f_472_low60_20_low20_7 = neg_g_472_low60_20_low20_6,
    u_492_499 = r_492_498,
    v_492_499 = s_492_498,
    neg_g_472_low60_20_low20_7 * 2 = neg_g_472_low60_20_low20_6 - neg_f_472_low60_20_low20_6,
    r_492_499 * 2 = r_492_498 - u_492_498,
    s_492_499 * 2 = s_492_498 - v_492_498
&&
    true
;

{
    u_492_499 * neg_f_472_low60_20_low20_0 + v_492_499 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_499 * neg_f_472_low60_20_low20_0 + s_492_499 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_7 + u_492_499 * (const 64 (2**21)) + v_492_499 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_7 + r_492_499 * (const 64 (2**21)) + s_492_499 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_7,
    neg_f_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_7,
    neg_g_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 499)) <=s delta, delta <=s (const 64 (1 + 2*499)),
    (const 64 (-(2**20))) <=s u_492_499, u_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_499, v_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_499, r_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_499, s_492_499 <=s (const 64 ((2**20))),
    u_492_499 + v_492_499 <=s (const 64 (2**20)),
    u_492_499 - v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 + v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 - v_492_499 <=s (const 64 (2**20)),
    r_492_499 + s_492_499 <=s (const 64 (2**20)),
    r_492_499 - s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 + s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 - s_492_499 <=s (const 64 (2**20)),
    u_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_492_499 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_499_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_7,
sint64 neg_g_472_low60_20_low20_7,
sint64 neg_f_472_low60_20_low20_8,
sint64 neg_g_472_low60_20_low20_8,
sint64 u_492_499,
sint64 v_492_499,
sint64 r_492_499,
sint64 s_492_499,
sint64 u_492_500,
sint64 v_492_500,
sint64 r_492_500,
sint64 s_492_500,
bit ne
)={
    u_492_499 * neg_f_472_low60_20_low20_0 + v_492_499 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_7 * (-(2**20)),
    r_492_499 * neg_f_472_low60_20_low20_0 + s_492_499 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_7 * (-(2**20))
&&
    u_492_499 * neg_f_472_low60_20_low20_0 + v_492_499 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_7 * (const 64 (-(2**20))),
    r_492_499 * neg_f_472_low60_20_low20_0 + s_492_499 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_7 + u_492_499 * (const 64 (2**21)) + v_492_499 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_7 + r_492_499 * (const 64 (2**21)) + s_492_499 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_7,
    neg_f_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_7,
    neg_g_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 499)) <=s delta, delta <=s (const 64 (1 + 2*499)),
    (const 64 (-(2**20))) <=s u_492_499, u_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_499, v_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_499, r_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_499, s_492_499 <=s (const 64 ((2**20))),
    u_492_499 + v_492_499 <=s (const 64 (2**20)),
    u_492_499 - v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 + v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 - v_492_499 <=s (const 64 (2**20)),
    r_492_499 + s_492_499 <=s (const 64 (2**20)),
    r_492_499 - s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 + s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 - s_492_499 <=s (const 64 (2**20)),
    u_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_492_499 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step499

// premise a
assume
neg_g_472_low60_20_low20_7 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_8 neg_f_472_low60_20_low20_7;
mov u_492_500 u_492_499;
mov v_492_500 v_492_499;

asr neg_g_472_low60_20_low20_8 neg_g_472_low60_20_low20_7 1;
asr r_492_500 r_492_499 1;
asr s_492_500 s_492_499 1;
assert
    true
&&
    neg_f_472_low60_20_low20_8 = neg_f_472_low60_20_low20_7,
    u_492_500 = u_492_499,
    v_492_500 = v_492_499,
    neg_g_472_low60_20_low20_8 * (const 64 2) = neg_g_472_low60_20_low20_7,
    r_492_500 * (const 64 2) = r_492_499,
    s_492_500 * (const 64 2) = s_492_499
;

assume
    neg_f_472_low60_20_low20_8 = neg_f_472_low60_20_low20_7,
    u_492_500 = u_492_499,
    v_492_500 = v_492_499,
    neg_g_472_low60_20_low20_8 * 2 = neg_g_472_low60_20_low20_7,
    r_492_500 * 2 = r_492_499,
    s_492_500 * 2 = s_492_499
&&
    true
;

{
    u_492_500 * neg_f_472_low60_20_low20_0 + v_492_500 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_500 * neg_f_472_low60_20_low20_0 + s_492_500 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_8 + u_492_500 * (const 64 (2**21)) + v_492_500 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_8 + r_492_500 * (const 64 (2**21)) + s_492_500 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_8,
    neg_f_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_8,
    neg_g_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 500)) <=s delta, delta <=s (const 64 (1 + 2*500)),
    (const 64 (-(2**20))) <=s u_492_500, u_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_500, v_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_500, r_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_500, s_492_500 <=s (const 64 ((2**20))),
    u_492_500 + v_492_500 <=s (const 64 (2**20)),
    u_492_500 - v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 + v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 - v_492_500 <=s (const 64 (2**20)),
    r_492_500 + s_492_500 <=s (const 64 (2**20)),
    r_492_500 - s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 + s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 - s_492_500 <=s (const 64 (2**20)),
    u_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_492_500 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_499_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_7,
sint64 neg_g_472_low60_20_low20_7,
sint64 neg_f_472_low60_20_low20_8,
sint64 neg_g_472_low60_20_low20_8,
sint64 u_492_499,
sint64 v_492_499,
sint64 r_492_499,
sint64 s_492_499,
sint64 u_492_500,
sint64 v_492_500,
sint64 r_492_500,
sint64 s_492_500,
bit ne
)={
    u_492_499 * neg_f_472_low60_20_low20_0 + v_492_499 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_7 * (-(2**20)),
    r_492_499 * neg_f_472_low60_20_low20_0 + s_492_499 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_7 * (-(2**20))
&&
    u_492_499 * neg_f_472_low60_20_low20_0 + v_492_499 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_7 * (const 64 (-(2**20))),
    r_492_499 * neg_f_472_low60_20_low20_0 + s_492_499 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_7 + u_492_499 * (const 64 (2**21)) + v_492_499 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_7 + r_492_499 * (const 64 (2**21)) + s_492_499 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_7,
    neg_f_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_7,
    neg_g_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 499)) <=s delta, delta <=s (const 64 (1 + 2*499)),
    (const 64 (-(2**20))) <=s u_492_499, u_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_499, v_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_499, r_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_499, s_492_499 <=s (const 64 ((2**20))),
    u_492_499 + v_492_499 <=s (const 64 (2**20)),
    u_492_499 - v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 + v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 - v_492_499 <=s (const 64 (2**20)),
    r_492_499 + s_492_499 <=s (const 64 (2**20)),
    r_492_499 - s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 + s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 - s_492_499 <=s (const 64 (2**20)),
    u_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_492_499 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step499

// premise b
assume
neg_g_472_low60_20_low20_7 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_8 neg_f_472_low60_20_low20_7;
mov u_492_500 u_492_499;
mov v_492_500 v_492_499;

add neg_g_472_low60_20_low20_8 neg_g_472_low60_20_low20_7 neg_f_472_low60_20_low20_7;
asr neg_g_472_low60_20_low20_8 neg_g_472_low60_20_low20_8 1;
add r_492_500 r_492_499 u_492_499;
asr r_492_500 r_492_500 1;
add s_492_500 s_492_499 v_492_499;
asr s_492_500 s_492_500 1;
assert
    true
&&
    neg_f_472_low60_20_low20_8 = neg_f_472_low60_20_low20_7,
    u_492_500 = u_492_499,
    v_492_500 = v_492_499,
    neg_g_472_low60_20_low20_8 * (const 64 2) = neg_g_472_low60_20_low20_7 + neg_f_472_low60_20_low20_7,
    r_492_500 * (const 64 2) = r_492_499 + u_492_499,
    s_492_500 * (const 64 2) = s_492_499 + v_492_499
;

assume
    neg_f_472_low60_20_low20_8 = neg_f_472_low60_20_low20_7,
    u_492_500 = u_492_499,
    v_492_500 = v_492_499,
    neg_g_472_low60_20_low20_8 * 2 = neg_g_472_low60_20_low20_7 + neg_f_472_low60_20_low20_7,
    r_492_500 * 2 = r_492_499 + u_492_499,
    s_492_500 * 2 = s_492_499 + v_492_499
&&
    true
;

{
    u_492_500 * neg_f_472_low60_20_low20_0 + v_492_500 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_500 * neg_f_472_low60_20_low20_0 + s_492_500 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_8 + u_492_500 * (const 64 (2**21)) + v_492_500 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_8 + r_492_500 * (const 64 (2**21)) + s_492_500 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_8,
    neg_f_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_8,
    neg_g_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 500)) <=s delta, delta <=s (const 64 (1 + 2*500)),
    (const 64 (-(2**20))) <=s u_492_500, u_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_500, v_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_500, r_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_500, s_492_500 <=s (const 64 ((2**20))),
    u_492_500 + v_492_500 <=s (const 64 (2**20)),
    u_492_500 - v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 + v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 - v_492_500 <=s (const 64 (2**20)),
    r_492_500 + s_492_500 <=s (const 64 (2**20)),
    r_492_500 - s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 + s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 - s_492_500 <=s (const 64 (2**20)),
    u_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_492_500 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_499_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_7,
sint64 neg_g_472_low60_20_low20_7,
sint64 neg_f_472_low60_20_low20_8,
sint64 neg_g_472_low60_20_low20_8,
sint64 u_492_499,
sint64 v_492_499,
sint64 r_492_499,
sint64 s_492_499,
sint64 u_492_500,
sint64 v_492_500,
sint64 r_492_500,
sint64 s_492_500,
bit ne
)={
    u_492_499 * neg_f_472_low60_20_low20_0 + v_492_499 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_7 * (-(2**20)),
    r_492_499 * neg_f_472_low60_20_low20_0 + s_492_499 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_7 * (-(2**20))
&&
    u_492_499 * neg_f_472_low60_20_low20_0 + v_492_499 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_7 * (const 64 (-(2**20))),
    r_492_499 * neg_f_472_low60_20_low20_0 + s_492_499 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_7 + u_492_499 * (const 64 (2**21)) + v_492_499 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_7 + r_492_499 * (const 64 (2**21)) + s_492_499 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_7,
    neg_f_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_7,
    neg_g_472_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 499)) <=s delta, delta <=s (const 64 (1 + 2*499)),
    (const 64 (-(2**20))) <=s u_492_499, u_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_499, v_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_499, r_492_499 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_499, s_492_499 <=s (const 64 ((2**20))),
    u_492_499 + v_492_499 <=s (const 64 (2**20)),
    u_492_499 - v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 + v_492_499 <=s (const 64 (2**20)),
    (const 64 0) - u_492_499 - v_492_499 <=s (const 64 (2**20)),
    r_492_499 + s_492_499 <=s (const 64 (2**20)),
    r_492_499 - s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 + s_492_499 <=s (const 64 (2**20)),
    (const 64 0) - r_492_499 - s_492_499 <=s (const 64 (2**20)),
    u_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_492_499 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_492_499 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step499

// premise c
assume
neg_g_472_low60_20_low20_7 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_8 neg_g_472_low60_20_low20_7;
mov u_492_500 r_492_499;
mov v_492_500 s_492_499;

subs dc neg_g_472_low60_20_low20_8 neg_g_472_low60_20_low20_7 neg_f_472_low60_20_low20_7;
asr neg_g_472_low60_20_low20_8 neg_g_472_low60_20_low20_8 1;
subs dc r_492_500 r_492_499 u_492_499;
asr r_492_500 r_492_500 1;
subs dc s_492_500 s_492_499 v_492_499;
asr s_492_500 s_492_500 1;
assert
    true
&&
    neg_f_472_low60_20_low20_8 = neg_g_472_low60_20_low20_7,
    u_492_500 = r_492_499,
    v_492_500 = s_492_499,
    neg_g_472_low60_20_low20_8 * (const 64 2) = neg_g_472_low60_20_low20_7 - neg_f_472_low60_20_low20_7,
    r_492_500 * (const 64 2) = r_492_499 - u_492_499,
    s_492_500 * (const 64 2) = s_492_499 - v_492_499
;

assume
    neg_f_472_low60_20_low20_8 = neg_g_472_low60_20_low20_7,
    u_492_500 = r_492_499,
    v_492_500 = s_492_499,
    neg_g_472_low60_20_low20_8 * 2 = neg_g_472_low60_20_low20_7 - neg_f_472_low60_20_low20_7,
    r_492_500 * 2 = r_492_499 - u_492_499,
    s_492_500 * 2 = s_492_499 - v_492_499
&&
    true
;

{
    u_492_500 * neg_f_472_low60_20_low20_0 + v_492_500 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_500 * neg_f_472_low60_20_low20_0 + s_492_500 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_8 + u_492_500 * (const 64 (2**21)) + v_492_500 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_8 + r_492_500 * (const 64 (2**21)) + s_492_500 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_8,
    neg_f_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_8,
    neg_g_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 500)) <=s delta, delta <=s (const 64 (1 + 2*500)),
    (const 64 (-(2**20))) <=s u_492_500, u_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_500, v_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_500, r_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_500, s_492_500 <=s (const 64 ((2**20))),
    u_492_500 + v_492_500 <=s (const 64 (2**20)),
    u_492_500 - v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 + v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 - v_492_500 <=s (const 64 (2**20)),
    r_492_500 + s_492_500 <=s (const 64 (2**20)),
    r_492_500 - s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 + s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 - s_492_500 <=s (const 64 (2**20)),
    u_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_492_500 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_500_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_8,
sint64 neg_g_472_low60_20_low20_8,
sint64 neg_f_472_low60_20_low20_9,
sint64 neg_g_472_low60_20_low20_9,
sint64 u_492_500,
sint64 v_492_500,
sint64 r_492_500,
sint64 s_492_500,
sint64 u_492_501,
sint64 v_492_501,
sint64 r_492_501,
sint64 s_492_501,
bit ne
)={
    u_492_500 * neg_f_472_low60_20_low20_0 + v_492_500 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_8 * (-(2**20)),
    r_492_500 * neg_f_472_low60_20_low20_0 + s_492_500 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_8 * (-(2**20))
&&
    u_492_500 * neg_f_472_low60_20_low20_0 + v_492_500 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_8 * (const 64 (-(2**20))),
    r_492_500 * neg_f_472_low60_20_low20_0 + s_492_500 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_8 + u_492_500 * (const 64 (2**21)) + v_492_500 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_8 + r_492_500 * (const 64 (2**21)) + s_492_500 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_8,
    neg_f_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_8,
    neg_g_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 500)) <=s delta, delta <=s (const 64 (1 + 2*500)),
    (const 64 (-(2**20))) <=s u_492_500, u_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_500, v_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_500, r_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_500, s_492_500 <=s (const 64 ((2**20))),
    u_492_500 + v_492_500 <=s (const 64 (2**20)),
    u_492_500 - v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 + v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 - v_492_500 <=s (const 64 (2**20)),
    r_492_500 + s_492_500 <=s (const 64 (2**20)),
    r_492_500 - s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 + s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 - s_492_500 <=s (const 64 (2**20)),
    u_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_492_500 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step500

// premise a
assume
neg_g_472_low60_20_low20_8 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_9 neg_f_472_low60_20_low20_8;
mov u_492_501 u_492_500;
mov v_492_501 v_492_500;

asr neg_g_472_low60_20_low20_9 neg_g_472_low60_20_low20_8 1;
asr r_492_501 r_492_500 1;
asr s_492_501 s_492_500 1;
assert
    true
&&
    neg_f_472_low60_20_low20_9 = neg_f_472_low60_20_low20_8,
    u_492_501 = u_492_500,
    v_492_501 = v_492_500,
    neg_g_472_low60_20_low20_9 * (const 64 2) = neg_g_472_low60_20_low20_8,
    r_492_501 * (const 64 2) = r_492_500,
    s_492_501 * (const 64 2) = s_492_500
;

assume
    neg_f_472_low60_20_low20_9 = neg_f_472_low60_20_low20_8,
    u_492_501 = u_492_500,
    v_492_501 = v_492_500,
    neg_g_472_low60_20_low20_9 * 2 = neg_g_472_low60_20_low20_8,
    r_492_501 * 2 = r_492_500,
    s_492_501 * 2 = s_492_500
&&
    true
;

{
    u_492_501 * neg_f_472_low60_20_low20_0 + v_492_501 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_501 * neg_f_472_low60_20_low20_0 + s_492_501 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_9 + u_492_501 * (const 64 (2**21)) + v_492_501 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_9 + r_492_501 * (const 64 (2**21)) + s_492_501 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_9,
    neg_f_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_9,
    neg_g_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 501)) <=s delta, delta <=s (const 64 (1 + 2*501)),
    (const 64 (-(2**20))) <=s u_492_501, u_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_501, v_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_501, r_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_501, s_492_501 <=s (const 64 ((2**20))),
    u_492_501 + v_492_501 <=s (const 64 (2**20)),
    u_492_501 - v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 + v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 - v_492_501 <=s (const 64 (2**20)),
    r_492_501 + s_492_501 <=s (const 64 (2**20)),
    r_492_501 - s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 + s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 - s_492_501 <=s (const 64 (2**20)),
    u_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_492_501 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_500_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_8,
sint64 neg_g_472_low60_20_low20_8,
sint64 neg_f_472_low60_20_low20_9,
sint64 neg_g_472_low60_20_low20_9,
sint64 u_492_500,
sint64 v_492_500,
sint64 r_492_500,
sint64 s_492_500,
sint64 u_492_501,
sint64 v_492_501,
sint64 r_492_501,
sint64 s_492_501,
bit ne
)={
    u_492_500 * neg_f_472_low60_20_low20_0 + v_492_500 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_8 * (-(2**20)),
    r_492_500 * neg_f_472_low60_20_low20_0 + s_492_500 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_8 * (-(2**20))
&&
    u_492_500 * neg_f_472_low60_20_low20_0 + v_492_500 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_8 * (const 64 (-(2**20))),
    r_492_500 * neg_f_472_low60_20_low20_0 + s_492_500 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_8 + u_492_500 * (const 64 (2**21)) + v_492_500 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_8 + r_492_500 * (const 64 (2**21)) + s_492_500 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_8,
    neg_f_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_8,
    neg_g_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 500)) <=s delta, delta <=s (const 64 (1 + 2*500)),
    (const 64 (-(2**20))) <=s u_492_500, u_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_500, v_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_500, r_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_500, s_492_500 <=s (const 64 ((2**20))),
    u_492_500 + v_492_500 <=s (const 64 (2**20)),
    u_492_500 - v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 + v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 - v_492_500 <=s (const 64 (2**20)),
    r_492_500 + s_492_500 <=s (const 64 (2**20)),
    r_492_500 - s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 + s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 - s_492_500 <=s (const 64 (2**20)),
    u_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_492_500 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step500

// premise b
assume
neg_g_472_low60_20_low20_8 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_9 neg_f_472_low60_20_low20_8;
mov u_492_501 u_492_500;
mov v_492_501 v_492_500;

add neg_g_472_low60_20_low20_9 neg_g_472_low60_20_low20_8 neg_f_472_low60_20_low20_8;
asr neg_g_472_low60_20_low20_9 neg_g_472_low60_20_low20_9 1;
add r_492_501 r_492_500 u_492_500;
asr r_492_501 r_492_501 1;
add s_492_501 s_492_500 v_492_500;
asr s_492_501 s_492_501 1;
assert
    true
&&
    neg_f_472_low60_20_low20_9 = neg_f_472_low60_20_low20_8,
    u_492_501 = u_492_500,
    v_492_501 = v_492_500,
    neg_g_472_low60_20_low20_9 * (const 64 2) = neg_g_472_low60_20_low20_8 + neg_f_472_low60_20_low20_8,
    r_492_501 * (const 64 2) = r_492_500 + u_492_500,
    s_492_501 * (const 64 2) = s_492_500 + v_492_500
;

assume
    neg_f_472_low60_20_low20_9 = neg_f_472_low60_20_low20_8,
    u_492_501 = u_492_500,
    v_492_501 = v_492_500,
    neg_g_472_low60_20_low20_9 * 2 = neg_g_472_low60_20_low20_8 + neg_f_472_low60_20_low20_8,
    r_492_501 * 2 = r_492_500 + u_492_500,
    s_492_501 * 2 = s_492_500 + v_492_500
&&
    true
;

{
    u_492_501 * neg_f_472_low60_20_low20_0 + v_492_501 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_501 * neg_f_472_low60_20_low20_0 + s_492_501 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_9 + u_492_501 * (const 64 (2**21)) + v_492_501 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_9 + r_492_501 * (const 64 (2**21)) + s_492_501 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_9,
    neg_f_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_9,
    neg_g_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 501)) <=s delta, delta <=s (const 64 (1 + 2*501)),
    (const 64 (-(2**20))) <=s u_492_501, u_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_501, v_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_501, r_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_501, s_492_501 <=s (const 64 ((2**20))),
    u_492_501 + v_492_501 <=s (const 64 (2**20)),
    u_492_501 - v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 + v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 - v_492_501 <=s (const 64 (2**20)),
    r_492_501 + s_492_501 <=s (const 64 (2**20)),
    r_492_501 - s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 + s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 - s_492_501 <=s (const 64 (2**20)),
    u_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_492_501 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_500_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_8,
sint64 neg_g_472_low60_20_low20_8,
sint64 neg_f_472_low60_20_low20_9,
sint64 neg_g_472_low60_20_low20_9,
sint64 u_492_500,
sint64 v_492_500,
sint64 r_492_500,
sint64 s_492_500,
sint64 u_492_501,
sint64 v_492_501,
sint64 r_492_501,
sint64 s_492_501,
bit ne
)={
    u_492_500 * neg_f_472_low60_20_low20_0 + v_492_500 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_8 * (-(2**20)),
    r_492_500 * neg_f_472_low60_20_low20_0 + s_492_500 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_8 * (-(2**20))
&&
    u_492_500 * neg_f_472_low60_20_low20_0 + v_492_500 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_8 * (const 64 (-(2**20))),
    r_492_500 * neg_f_472_low60_20_low20_0 + s_492_500 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_8 + u_492_500 * (const 64 (2**21)) + v_492_500 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_8 + r_492_500 * (const 64 (2**21)) + s_492_500 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_8,
    neg_f_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_8,
    neg_g_472_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 500)) <=s delta, delta <=s (const 64 (1 + 2*500)),
    (const 64 (-(2**20))) <=s u_492_500, u_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_500, v_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_500, r_492_500 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_500, s_492_500 <=s (const 64 ((2**20))),
    u_492_500 + v_492_500 <=s (const 64 (2**20)),
    u_492_500 - v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 + v_492_500 <=s (const 64 (2**20)),
    (const 64 0) - u_492_500 - v_492_500 <=s (const 64 (2**20)),
    r_492_500 + s_492_500 <=s (const 64 (2**20)),
    r_492_500 - s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 + s_492_500 <=s (const 64 (2**20)),
    (const 64 0) - r_492_500 - s_492_500 <=s (const 64 (2**20)),
    u_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_492_500 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_492_500 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step500

// premise c
assume
neg_g_472_low60_20_low20_8 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_9 neg_g_472_low60_20_low20_8;
mov u_492_501 r_492_500;
mov v_492_501 s_492_500;

subs dc neg_g_472_low60_20_low20_9 neg_g_472_low60_20_low20_8 neg_f_472_low60_20_low20_8;
asr neg_g_472_low60_20_low20_9 neg_g_472_low60_20_low20_9 1;
subs dc r_492_501 r_492_500 u_492_500;
asr r_492_501 r_492_501 1;
subs dc s_492_501 s_492_500 v_492_500;
asr s_492_501 s_492_501 1;
assert
    true
&&
    neg_f_472_low60_20_low20_9 = neg_g_472_low60_20_low20_8,
    u_492_501 = r_492_500,
    v_492_501 = s_492_500,
    neg_g_472_low60_20_low20_9 * (const 64 2) = neg_g_472_low60_20_low20_8 - neg_f_472_low60_20_low20_8,
    r_492_501 * (const 64 2) = r_492_500 - u_492_500,
    s_492_501 * (const 64 2) = s_492_500 - v_492_500
;

assume
    neg_f_472_low60_20_low20_9 = neg_g_472_low60_20_low20_8,
    u_492_501 = r_492_500,
    v_492_501 = s_492_500,
    neg_g_472_low60_20_low20_9 * 2 = neg_g_472_low60_20_low20_8 - neg_f_472_low60_20_low20_8,
    r_492_501 * 2 = r_492_500 - u_492_500,
    s_492_501 * 2 = s_492_500 - v_492_500
&&
    true
;

{
    u_492_501 * neg_f_472_low60_20_low20_0 + v_492_501 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_501 * neg_f_472_low60_20_low20_0 + s_492_501 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_9 + u_492_501 * (const 64 (2**21)) + v_492_501 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_9 + r_492_501 * (const 64 (2**21)) + s_492_501 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_9,
    neg_f_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_9,
    neg_g_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 501)) <=s delta, delta <=s (const 64 (1 + 2*501)),
    (const 64 (-(2**20))) <=s u_492_501, u_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_501, v_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_501, r_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_501, s_492_501 <=s (const 64 ((2**20))),
    u_492_501 + v_492_501 <=s (const 64 (2**20)),
    u_492_501 - v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 + v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 - v_492_501 <=s (const 64 (2**20)),
    r_492_501 + s_492_501 <=s (const 64 (2**20)),
    r_492_501 - s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 + s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 - s_492_501 <=s (const 64 (2**20)),
    u_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_492_501 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_501_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_9,
sint64 neg_g_472_low60_20_low20_9,
sint64 neg_f_472_low60_20_low20_10,
sint64 neg_g_472_low60_20_low20_10,
sint64 u_492_501,
sint64 v_492_501,
sint64 r_492_501,
sint64 s_492_501,
sint64 u_492_502,
sint64 v_492_502,
sint64 r_492_502,
sint64 s_492_502,
bit ne
)={
    u_492_501 * neg_f_472_low60_20_low20_0 + v_492_501 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_9 * (-(2**20)),
    r_492_501 * neg_f_472_low60_20_low20_0 + s_492_501 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_9 * (-(2**20))
&&
    u_492_501 * neg_f_472_low60_20_low20_0 + v_492_501 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_9 * (const 64 (-(2**20))),
    r_492_501 * neg_f_472_low60_20_low20_0 + s_492_501 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_9 + u_492_501 * (const 64 (2**21)) + v_492_501 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_9 + r_492_501 * (const 64 (2**21)) + s_492_501 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_9,
    neg_f_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_9,
    neg_g_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 501)) <=s delta, delta <=s (const 64 (1 + 2*501)),
    (const 64 (-(2**20))) <=s u_492_501, u_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_501, v_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_501, r_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_501, s_492_501 <=s (const 64 ((2**20))),
    u_492_501 + v_492_501 <=s (const 64 (2**20)),
    u_492_501 - v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 + v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 - v_492_501 <=s (const 64 (2**20)),
    r_492_501 + s_492_501 <=s (const 64 (2**20)),
    r_492_501 - s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 + s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 - s_492_501 <=s (const 64 (2**20)),
    u_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_492_501 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step501

// premise a
assume
neg_g_472_low60_20_low20_9 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_10 neg_f_472_low60_20_low20_9;
mov u_492_502 u_492_501;
mov v_492_502 v_492_501;

asr neg_g_472_low60_20_low20_10 neg_g_472_low60_20_low20_9 1;
asr r_492_502 r_492_501 1;
asr s_492_502 s_492_501 1;
assert
    true
&&
    neg_f_472_low60_20_low20_10 = neg_f_472_low60_20_low20_9,
    u_492_502 = u_492_501,
    v_492_502 = v_492_501,
    neg_g_472_low60_20_low20_10 * (const 64 2) = neg_g_472_low60_20_low20_9,
    r_492_502 * (const 64 2) = r_492_501,
    s_492_502 * (const 64 2) = s_492_501
;

assume
    neg_f_472_low60_20_low20_10 = neg_f_472_low60_20_low20_9,
    u_492_502 = u_492_501,
    v_492_502 = v_492_501,
    neg_g_472_low60_20_low20_10 * 2 = neg_g_472_low60_20_low20_9,
    r_492_502 * 2 = r_492_501,
    s_492_502 * 2 = s_492_501
&&
    true
;

{
    u_492_502 * neg_f_472_low60_20_low20_0 + v_492_502 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_502 * neg_f_472_low60_20_low20_0 + s_492_502 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_10 + u_492_502 * (const 64 (2**21)) + v_492_502 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_10 + r_492_502 * (const 64 (2**21)) + s_492_502 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_10,
    neg_f_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_10,
    neg_g_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 502)) <=s delta, delta <=s (const 64 (1 + 2*502)),
    (const 64 (-(2**20))) <=s u_492_502, u_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_502, v_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_502, r_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_502, s_492_502 <=s (const 64 ((2**20))),
    u_492_502 + v_492_502 <=s (const 64 (2**20)),
    u_492_502 - v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 + v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 - v_492_502 <=s (const 64 (2**20)),
    r_492_502 + s_492_502 <=s (const 64 (2**20)),
    r_492_502 - s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 + s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 - s_492_502 <=s (const 64 (2**20)),
    u_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_492_502 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_501_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_9,
sint64 neg_g_472_low60_20_low20_9,
sint64 neg_f_472_low60_20_low20_10,
sint64 neg_g_472_low60_20_low20_10,
sint64 u_492_501,
sint64 v_492_501,
sint64 r_492_501,
sint64 s_492_501,
sint64 u_492_502,
sint64 v_492_502,
sint64 r_492_502,
sint64 s_492_502,
bit ne
)={
    u_492_501 * neg_f_472_low60_20_low20_0 + v_492_501 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_9 * (-(2**20)),
    r_492_501 * neg_f_472_low60_20_low20_0 + s_492_501 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_9 * (-(2**20))
&&
    u_492_501 * neg_f_472_low60_20_low20_0 + v_492_501 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_9 * (const 64 (-(2**20))),
    r_492_501 * neg_f_472_low60_20_low20_0 + s_492_501 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_9 + u_492_501 * (const 64 (2**21)) + v_492_501 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_9 + r_492_501 * (const 64 (2**21)) + s_492_501 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_9,
    neg_f_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_9,
    neg_g_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 501)) <=s delta, delta <=s (const 64 (1 + 2*501)),
    (const 64 (-(2**20))) <=s u_492_501, u_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_501, v_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_501, r_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_501, s_492_501 <=s (const 64 ((2**20))),
    u_492_501 + v_492_501 <=s (const 64 (2**20)),
    u_492_501 - v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 + v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 - v_492_501 <=s (const 64 (2**20)),
    r_492_501 + s_492_501 <=s (const 64 (2**20)),
    r_492_501 - s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 + s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 - s_492_501 <=s (const 64 (2**20)),
    u_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_492_501 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step501

// premise b
assume
neg_g_472_low60_20_low20_9 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_10 neg_f_472_low60_20_low20_9;
mov u_492_502 u_492_501;
mov v_492_502 v_492_501;

add neg_g_472_low60_20_low20_10 neg_g_472_low60_20_low20_9 neg_f_472_low60_20_low20_9;
asr neg_g_472_low60_20_low20_10 neg_g_472_low60_20_low20_10 1;
add r_492_502 r_492_501 u_492_501;
asr r_492_502 r_492_502 1;
add s_492_502 s_492_501 v_492_501;
asr s_492_502 s_492_502 1;
assert
    true
&&
    neg_f_472_low60_20_low20_10 = neg_f_472_low60_20_low20_9,
    u_492_502 = u_492_501,
    v_492_502 = v_492_501,
    neg_g_472_low60_20_low20_10 * (const 64 2) = neg_g_472_low60_20_low20_9 + neg_f_472_low60_20_low20_9,
    r_492_502 * (const 64 2) = r_492_501 + u_492_501,
    s_492_502 * (const 64 2) = s_492_501 + v_492_501
;

assume
    neg_f_472_low60_20_low20_10 = neg_f_472_low60_20_low20_9,
    u_492_502 = u_492_501,
    v_492_502 = v_492_501,
    neg_g_472_low60_20_low20_10 * 2 = neg_g_472_low60_20_low20_9 + neg_f_472_low60_20_low20_9,
    r_492_502 * 2 = r_492_501 + u_492_501,
    s_492_502 * 2 = s_492_501 + v_492_501
&&
    true
;

{
    u_492_502 * neg_f_472_low60_20_low20_0 + v_492_502 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_502 * neg_f_472_low60_20_low20_0 + s_492_502 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_10 + u_492_502 * (const 64 (2**21)) + v_492_502 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_10 + r_492_502 * (const 64 (2**21)) + s_492_502 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_10,
    neg_f_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_10,
    neg_g_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 502)) <=s delta, delta <=s (const 64 (1 + 2*502)),
    (const 64 (-(2**20))) <=s u_492_502, u_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_502, v_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_502, r_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_502, s_492_502 <=s (const 64 ((2**20))),
    u_492_502 + v_492_502 <=s (const 64 (2**20)),
    u_492_502 - v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 + v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 - v_492_502 <=s (const 64 (2**20)),
    r_492_502 + s_492_502 <=s (const 64 (2**20)),
    r_492_502 - s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 + s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 - s_492_502 <=s (const 64 (2**20)),
    u_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_492_502 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_501_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_9,
sint64 neg_g_472_low60_20_low20_9,
sint64 neg_f_472_low60_20_low20_10,
sint64 neg_g_472_low60_20_low20_10,
sint64 u_492_501,
sint64 v_492_501,
sint64 r_492_501,
sint64 s_492_501,
sint64 u_492_502,
sint64 v_492_502,
sint64 r_492_502,
sint64 s_492_502,
bit ne
)={
    u_492_501 * neg_f_472_low60_20_low20_0 + v_492_501 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_9 * (-(2**20)),
    r_492_501 * neg_f_472_low60_20_low20_0 + s_492_501 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_9 * (-(2**20))
&&
    u_492_501 * neg_f_472_low60_20_low20_0 + v_492_501 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_9 * (const 64 (-(2**20))),
    r_492_501 * neg_f_472_low60_20_low20_0 + s_492_501 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_9 + u_492_501 * (const 64 (2**21)) + v_492_501 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_9 + r_492_501 * (const 64 (2**21)) + s_492_501 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_9,
    neg_f_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_9,
    neg_g_472_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 501)) <=s delta, delta <=s (const 64 (1 + 2*501)),
    (const 64 (-(2**20))) <=s u_492_501, u_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_501, v_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_501, r_492_501 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_501, s_492_501 <=s (const 64 ((2**20))),
    u_492_501 + v_492_501 <=s (const 64 (2**20)),
    u_492_501 - v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 + v_492_501 <=s (const 64 (2**20)),
    (const 64 0) - u_492_501 - v_492_501 <=s (const 64 (2**20)),
    r_492_501 + s_492_501 <=s (const 64 (2**20)),
    r_492_501 - s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 + s_492_501 <=s (const 64 (2**20)),
    (const 64 0) - r_492_501 - s_492_501 <=s (const 64 (2**20)),
    u_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_492_501 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_492_501 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step501

// premise c
assume
neg_g_472_low60_20_low20_9 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_10 neg_g_472_low60_20_low20_9;
mov u_492_502 r_492_501;
mov v_492_502 s_492_501;

subs dc neg_g_472_low60_20_low20_10 neg_g_472_low60_20_low20_9 neg_f_472_low60_20_low20_9;
asr neg_g_472_low60_20_low20_10 neg_g_472_low60_20_low20_10 1;
subs dc r_492_502 r_492_501 u_492_501;
asr r_492_502 r_492_502 1;
subs dc s_492_502 s_492_501 v_492_501;
asr s_492_502 s_492_502 1;
assert
    true
&&
    neg_f_472_low60_20_low20_10 = neg_g_472_low60_20_low20_9,
    u_492_502 = r_492_501,
    v_492_502 = s_492_501,
    neg_g_472_low60_20_low20_10 * (const 64 2) = neg_g_472_low60_20_low20_9 - neg_f_472_low60_20_low20_9,
    r_492_502 * (const 64 2) = r_492_501 - u_492_501,
    s_492_502 * (const 64 2) = s_492_501 - v_492_501
;

assume
    neg_f_472_low60_20_low20_10 = neg_g_472_low60_20_low20_9,
    u_492_502 = r_492_501,
    v_492_502 = s_492_501,
    neg_g_472_low60_20_low20_10 * 2 = neg_g_472_low60_20_low20_9 - neg_f_472_low60_20_low20_9,
    r_492_502 * 2 = r_492_501 - u_492_501,
    s_492_502 * 2 = s_492_501 - v_492_501
&&
    true
;

{
    u_492_502 * neg_f_472_low60_20_low20_0 + v_492_502 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_502 * neg_f_472_low60_20_low20_0 + s_492_502 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_10 + u_492_502 * (const 64 (2**21)) + v_492_502 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_10 + r_492_502 * (const 64 (2**21)) + s_492_502 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_10,
    neg_f_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_10,
    neg_g_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 502)) <=s delta, delta <=s (const 64 (1 + 2*502)),
    (const 64 (-(2**20))) <=s u_492_502, u_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_502, v_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_502, r_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_502, s_492_502 <=s (const 64 ((2**20))),
    u_492_502 + v_492_502 <=s (const 64 (2**20)),
    u_492_502 - v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 + v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 - v_492_502 <=s (const 64 (2**20)),
    r_492_502 + s_492_502 <=s (const 64 (2**20)),
    r_492_502 - s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 + s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 - s_492_502 <=s (const 64 (2**20)),
    u_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_492_502 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_502_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_10,
sint64 neg_g_472_low60_20_low20_10,
sint64 neg_f_472_low60_20_low20_11,
sint64 neg_g_472_low60_20_low20_11,
sint64 u_492_502,
sint64 v_492_502,
sint64 r_492_502,
sint64 s_492_502,
sint64 u_492_503,
sint64 v_492_503,
sint64 r_492_503,
sint64 s_492_503,
bit ne
)={
    u_492_502 * neg_f_472_low60_20_low20_0 + v_492_502 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_10 * (-(2**20)),
    r_492_502 * neg_f_472_low60_20_low20_0 + s_492_502 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_10 * (-(2**20))
&&
    u_492_502 * neg_f_472_low60_20_low20_0 + v_492_502 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_10 * (const 64 (-(2**20))),
    r_492_502 * neg_f_472_low60_20_low20_0 + s_492_502 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_10 + u_492_502 * (const 64 (2**21)) + v_492_502 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_10 + r_492_502 * (const 64 (2**21)) + s_492_502 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_10,
    neg_f_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_10,
    neg_g_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 502)) <=s delta, delta <=s (const 64 (1 + 2*502)),
    (const 64 (-(2**20))) <=s u_492_502, u_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_502, v_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_502, r_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_502, s_492_502 <=s (const 64 ((2**20))),
    u_492_502 + v_492_502 <=s (const 64 (2**20)),
    u_492_502 - v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 + v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 - v_492_502 <=s (const 64 (2**20)),
    r_492_502 + s_492_502 <=s (const 64 (2**20)),
    r_492_502 - s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 + s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 - s_492_502 <=s (const 64 (2**20)),
    u_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_492_502 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step502

// premise a
assume
neg_g_472_low60_20_low20_10 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_11 neg_f_472_low60_20_low20_10;
mov u_492_503 u_492_502;
mov v_492_503 v_492_502;

asr neg_g_472_low60_20_low20_11 neg_g_472_low60_20_low20_10 1;
asr r_492_503 r_492_502 1;
asr s_492_503 s_492_502 1;
assert
    true
&&
    neg_f_472_low60_20_low20_11 = neg_f_472_low60_20_low20_10,
    u_492_503 = u_492_502,
    v_492_503 = v_492_502,
    neg_g_472_low60_20_low20_11 * (const 64 2) = neg_g_472_low60_20_low20_10,
    r_492_503 * (const 64 2) = r_492_502,
    s_492_503 * (const 64 2) = s_492_502
;

assume
    neg_f_472_low60_20_low20_11 = neg_f_472_low60_20_low20_10,
    u_492_503 = u_492_502,
    v_492_503 = v_492_502,
    neg_g_472_low60_20_low20_11 * 2 = neg_g_472_low60_20_low20_10,
    r_492_503 * 2 = r_492_502,
    s_492_503 * 2 = s_492_502
&&
    true
;

{
    u_492_503 * neg_f_472_low60_20_low20_0 + v_492_503 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_503 * neg_f_472_low60_20_low20_0 + s_492_503 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_11 + u_492_503 * (const 64 (2**21)) + v_492_503 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_11 + r_492_503 * (const 64 (2**21)) + s_492_503 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_11,
    neg_f_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_11,
    neg_g_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 503)) <=s delta, delta <=s (const 64 (1 + 2*503)),
    (const 64 (-(2**20))) <=s u_492_503, u_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_503, v_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_503, r_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_503, s_492_503 <=s (const 64 ((2**20))),
    u_492_503 + v_492_503 <=s (const 64 (2**20)),
    u_492_503 - v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 + v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 - v_492_503 <=s (const 64 (2**20)),
    r_492_503 + s_492_503 <=s (const 64 (2**20)),
    r_492_503 - s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 + s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 - s_492_503 <=s (const 64 (2**20)),
    u_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_492_503 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_502_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_10,
sint64 neg_g_472_low60_20_low20_10,
sint64 neg_f_472_low60_20_low20_11,
sint64 neg_g_472_low60_20_low20_11,
sint64 u_492_502,
sint64 v_492_502,
sint64 r_492_502,
sint64 s_492_502,
sint64 u_492_503,
sint64 v_492_503,
sint64 r_492_503,
sint64 s_492_503,
bit ne
)={
    u_492_502 * neg_f_472_low60_20_low20_0 + v_492_502 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_10 * (-(2**20)),
    r_492_502 * neg_f_472_low60_20_low20_0 + s_492_502 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_10 * (-(2**20))
&&
    u_492_502 * neg_f_472_low60_20_low20_0 + v_492_502 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_10 * (const 64 (-(2**20))),
    r_492_502 * neg_f_472_low60_20_low20_0 + s_492_502 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_10 + u_492_502 * (const 64 (2**21)) + v_492_502 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_10 + r_492_502 * (const 64 (2**21)) + s_492_502 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_10,
    neg_f_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_10,
    neg_g_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 502)) <=s delta, delta <=s (const 64 (1 + 2*502)),
    (const 64 (-(2**20))) <=s u_492_502, u_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_502, v_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_502, r_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_502, s_492_502 <=s (const 64 ((2**20))),
    u_492_502 + v_492_502 <=s (const 64 (2**20)),
    u_492_502 - v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 + v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 - v_492_502 <=s (const 64 (2**20)),
    r_492_502 + s_492_502 <=s (const 64 (2**20)),
    r_492_502 - s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 + s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 - s_492_502 <=s (const 64 (2**20)),
    u_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_492_502 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step502

// premise b
assume
neg_g_472_low60_20_low20_10 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_11 neg_f_472_low60_20_low20_10;
mov u_492_503 u_492_502;
mov v_492_503 v_492_502;

add neg_g_472_low60_20_low20_11 neg_g_472_low60_20_low20_10 neg_f_472_low60_20_low20_10;
asr neg_g_472_low60_20_low20_11 neg_g_472_low60_20_low20_11 1;
add r_492_503 r_492_502 u_492_502;
asr r_492_503 r_492_503 1;
add s_492_503 s_492_502 v_492_502;
asr s_492_503 s_492_503 1;
assert
    true
&&
    neg_f_472_low60_20_low20_11 = neg_f_472_low60_20_low20_10,
    u_492_503 = u_492_502,
    v_492_503 = v_492_502,
    neg_g_472_low60_20_low20_11 * (const 64 2) = neg_g_472_low60_20_low20_10 + neg_f_472_low60_20_low20_10,
    r_492_503 * (const 64 2) = r_492_502 + u_492_502,
    s_492_503 * (const 64 2) = s_492_502 + v_492_502
;

assume
    neg_f_472_low60_20_low20_11 = neg_f_472_low60_20_low20_10,
    u_492_503 = u_492_502,
    v_492_503 = v_492_502,
    neg_g_472_low60_20_low20_11 * 2 = neg_g_472_low60_20_low20_10 + neg_f_472_low60_20_low20_10,
    r_492_503 * 2 = r_492_502 + u_492_502,
    s_492_503 * 2 = s_492_502 + v_492_502
&&
    true
;

{
    u_492_503 * neg_f_472_low60_20_low20_0 + v_492_503 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_503 * neg_f_472_low60_20_low20_0 + s_492_503 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_11 + u_492_503 * (const 64 (2**21)) + v_492_503 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_11 + r_492_503 * (const 64 (2**21)) + s_492_503 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_11,
    neg_f_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_11,
    neg_g_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 503)) <=s delta, delta <=s (const 64 (1 + 2*503)),
    (const 64 (-(2**20))) <=s u_492_503, u_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_503, v_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_503, r_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_503, s_492_503 <=s (const 64 ((2**20))),
    u_492_503 + v_492_503 <=s (const 64 (2**20)),
    u_492_503 - v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 + v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 - v_492_503 <=s (const 64 (2**20)),
    r_492_503 + s_492_503 <=s (const 64 (2**20)),
    r_492_503 - s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 + s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 - s_492_503 <=s (const 64 (2**20)),
    u_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_492_503 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_502_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_10,
sint64 neg_g_472_low60_20_low20_10,
sint64 neg_f_472_low60_20_low20_11,
sint64 neg_g_472_low60_20_low20_11,
sint64 u_492_502,
sint64 v_492_502,
sint64 r_492_502,
sint64 s_492_502,
sint64 u_492_503,
sint64 v_492_503,
sint64 r_492_503,
sint64 s_492_503,
bit ne
)={
    u_492_502 * neg_f_472_low60_20_low20_0 + v_492_502 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_10 * (-(2**20)),
    r_492_502 * neg_f_472_low60_20_low20_0 + s_492_502 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_10 * (-(2**20))
&&
    u_492_502 * neg_f_472_low60_20_low20_0 + v_492_502 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_10 * (const 64 (-(2**20))),
    r_492_502 * neg_f_472_low60_20_low20_0 + s_492_502 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_10 + u_492_502 * (const 64 (2**21)) + v_492_502 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_10 + r_492_502 * (const 64 (2**21)) + s_492_502 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_10,
    neg_f_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_10,
    neg_g_472_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 502)) <=s delta, delta <=s (const 64 (1 + 2*502)),
    (const 64 (-(2**20))) <=s u_492_502, u_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_502, v_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_502, r_492_502 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_502, s_492_502 <=s (const 64 ((2**20))),
    u_492_502 + v_492_502 <=s (const 64 (2**20)),
    u_492_502 - v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 + v_492_502 <=s (const 64 (2**20)),
    (const 64 0) - u_492_502 - v_492_502 <=s (const 64 (2**20)),
    r_492_502 + s_492_502 <=s (const 64 (2**20)),
    r_492_502 - s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 + s_492_502 <=s (const 64 (2**20)),
    (const 64 0) - r_492_502 - s_492_502 <=s (const 64 (2**20)),
    u_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_492_502 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_492_502 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step502

// premise c
assume
neg_g_472_low60_20_low20_10 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_11 neg_g_472_low60_20_low20_10;
mov u_492_503 r_492_502;
mov v_492_503 s_492_502;

subs dc neg_g_472_low60_20_low20_11 neg_g_472_low60_20_low20_10 neg_f_472_low60_20_low20_10;
asr neg_g_472_low60_20_low20_11 neg_g_472_low60_20_low20_11 1;
subs dc r_492_503 r_492_502 u_492_502;
asr r_492_503 r_492_503 1;
subs dc s_492_503 s_492_502 v_492_502;
asr s_492_503 s_492_503 1;
assert
    true
&&
    neg_f_472_low60_20_low20_11 = neg_g_472_low60_20_low20_10,
    u_492_503 = r_492_502,
    v_492_503 = s_492_502,
    neg_g_472_low60_20_low20_11 * (const 64 2) = neg_g_472_low60_20_low20_10 - neg_f_472_low60_20_low20_10,
    r_492_503 * (const 64 2) = r_492_502 - u_492_502,
    s_492_503 * (const 64 2) = s_492_502 - v_492_502
;

assume
    neg_f_472_low60_20_low20_11 = neg_g_472_low60_20_low20_10,
    u_492_503 = r_492_502,
    v_492_503 = s_492_502,
    neg_g_472_low60_20_low20_11 * 2 = neg_g_472_low60_20_low20_10 - neg_f_472_low60_20_low20_10,
    r_492_503 * 2 = r_492_502 - u_492_502,
    s_492_503 * 2 = s_492_502 - v_492_502
&&
    true
;

{
    u_492_503 * neg_f_472_low60_20_low20_0 + v_492_503 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_503 * neg_f_472_low60_20_low20_0 + s_492_503 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_11 + u_492_503 * (const 64 (2**21)) + v_492_503 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_11 + r_492_503 * (const 64 (2**21)) + s_492_503 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_11,
    neg_f_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_11,
    neg_g_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 503)) <=s delta, delta <=s (const 64 (1 + 2*503)),
    (const 64 (-(2**20))) <=s u_492_503, u_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_503, v_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_503, r_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_503, s_492_503 <=s (const 64 ((2**20))),
    u_492_503 + v_492_503 <=s (const 64 (2**20)),
    u_492_503 - v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 + v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 - v_492_503 <=s (const 64 (2**20)),
    r_492_503 + s_492_503 <=s (const 64 (2**20)),
    r_492_503 - s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 + s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 - s_492_503 <=s (const 64 (2**20)),
    u_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_492_503 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_503_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_11,
sint64 neg_g_472_low60_20_low20_11,
sint64 neg_f_472_low60_20_low20_12,
sint64 neg_g_472_low60_20_low20_12,
sint64 u_492_503,
sint64 v_492_503,
sint64 r_492_503,
sint64 s_492_503,
sint64 u_492_504,
sint64 v_492_504,
sint64 r_492_504,
sint64 s_492_504,
bit ne
)={
    u_492_503 * neg_f_472_low60_20_low20_0 + v_492_503 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_11 * (-(2**20)),
    r_492_503 * neg_f_472_low60_20_low20_0 + s_492_503 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_11 * (-(2**20))
&&
    u_492_503 * neg_f_472_low60_20_low20_0 + v_492_503 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_11 * (const 64 (-(2**20))),
    r_492_503 * neg_f_472_low60_20_low20_0 + s_492_503 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_11 + u_492_503 * (const 64 (2**21)) + v_492_503 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_11 + r_492_503 * (const 64 (2**21)) + s_492_503 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_11,
    neg_f_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_11,
    neg_g_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 503)) <=s delta, delta <=s (const 64 (1 + 2*503)),
    (const 64 (-(2**20))) <=s u_492_503, u_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_503, v_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_503, r_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_503, s_492_503 <=s (const 64 ((2**20))),
    u_492_503 + v_492_503 <=s (const 64 (2**20)),
    u_492_503 - v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 + v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 - v_492_503 <=s (const 64 (2**20)),
    r_492_503 + s_492_503 <=s (const 64 (2**20)),
    r_492_503 - s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 + s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 - s_492_503 <=s (const 64 (2**20)),
    u_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_492_503 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step503

// premise a
assume
neg_g_472_low60_20_low20_11 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_12 neg_f_472_low60_20_low20_11;
mov u_492_504 u_492_503;
mov v_492_504 v_492_503;

asr neg_g_472_low60_20_low20_12 neg_g_472_low60_20_low20_11 1;
asr r_492_504 r_492_503 1;
asr s_492_504 s_492_503 1;
assert
    true
&&
    neg_f_472_low60_20_low20_12 = neg_f_472_low60_20_low20_11,
    u_492_504 = u_492_503,
    v_492_504 = v_492_503,
    neg_g_472_low60_20_low20_12 * (const 64 2) = neg_g_472_low60_20_low20_11,
    r_492_504 * (const 64 2) = r_492_503,
    s_492_504 * (const 64 2) = s_492_503
;

assume
    neg_f_472_low60_20_low20_12 = neg_f_472_low60_20_low20_11,
    u_492_504 = u_492_503,
    v_492_504 = v_492_503,
    neg_g_472_low60_20_low20_12 * 2 = neg_g_472_low60_20_low20_11,
    r_492_504 * 2 = r_492_503,
    s_492_504 * 2 = s_492_503
&&
    true
;

{
    u_492_504 * neg_f_472_low60_20_low20_0 + v_492_504 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_504 * neg_f_472_low60_20_low20_0 + s_492_504 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_12 + u_492_504 * (const 64 (2**21)) + v_492_504 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_12 + r_492_504 * (const 64 (2**21)) + s_492_504 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_12,
    neg_f_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_12,
    neg_g_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 504)) <=s delta, delta <=s (const 64 (1 + 2*504)),
    (const 64 (-(2**20))) <=s u_492_504, u_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_504, v_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_504, r_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_504, s_492_504 <=s (const 64 ((2**20))),
    u_492_504 + v_492_504 <=s (const 64 (2**20)),
    u_492_504 - v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 + v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 - v_492_504 <=s (const 64 (2**20)),
    r_492_504 + s_492_504 <=s (const 64 (2**20)),
    r_492_504 - s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 + s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 - s_492_504 <=s (const 64 (2**20)),
    u_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_492_504 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_503_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_11,
sint64 neg_g_472_low60_20_low20_11,
sint64 neg_f_472_low60_20_low20_12,
sint64 neg_g_472_low60_20_low20_12,
sint64 u_492_503,
sint64 v_492_503,
sint64 r_492_503,
sint64 s_492_503,
sint64 u_492_504,
sint64 v_492_504,
sint64 r_492_504,
sint64 s_492_504,
bit ne
)={
    u_492_503 * neg_f_472_low60_20_low20_0 + v_492_503 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_11 * (-(2**20)),
    r_492_503 * neg_f_472_low60_20_low20_0 + s_492_503 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_11 * (-(2**20))
&&
    u_492_503 * neg_f_472_low60_20_low20_0 + v_492_503 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_11 * (const 64 (-(2**20))),
    r_492_503 * neg_f_472_low60_20_low20_0 + s_492_503 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_11 + u_492_503 * (const 64 (2**21)) + v_492_503 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_11 + r_492_503 * (const 64 (2**21)) + s_492_503 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_11,
    neg_f_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_11,
    neg_g_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 503)) <=s delta, delta <=s (const 64 (1 + 2*503)),
    (const 64 (-(2**20))) <=s u_492_503, u_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_503, v_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_503, r_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_503, s_492_503 <=s (const 64 ((2**20))),
    u_492_503 + v_492_503 <=s (const 64 (2**20)),
    u_492_503 - v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 + v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 - v_492_503 <=s (const 64 (2**20)),
    r_492_503 + s_492_503 <=s (const 64 (2**20)),
    r_492_503 - s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 + s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 - s_492_503 <=s (const 64 (2**20)),
    u_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_492_503 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step503

// premise b
assume
neg_g_472_low60_20_low20_11 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_12 neg_f_472_low60_20_low20_11;
mov u_492_504 u_492_503;
mov v_492_504 v_492_503;

add neg_g_472_low60_20_low20_12 neg_g_472_low60_20_low20_11 neg_f_472_low60_20_low20_11;
asr neg_g_472_low60_20_low20_12 neg_g_472_low60_20_low20_12 1;
add r_492_504 r_492_503 u_492_503;
asr r_492_504 r_492_504 1;
add s_492_504 s_492_503 v_492_503;
asr s_492_504 s_492_504 1;
assert
    true
&&
    neg_f_472_low60_20_low20_12 = neg_f_472_low60_20_low20_11,
    u_492_504 = u_492_503,
    v_492_504 = v_492_503,
    neg_g_472_low60_20_low20_12 * (const 64 2) = neg_g_472_low60_20_low20_11 + neg_f_472_low60_20_low20_11,
    r_492_504 * (const 64 2) = r_492_503 + u_492_503,
    s_492_504 * (const 64 2) = s_492_503 + v_492_503
;

assume
    neg_f_472_low60_20_low20_12 = neg_f_472_low60_20_low20_11,
    u_492_504 = u_492_503,
    v_492_504 = v_492_503,
    neg_g_472_low60_20_low20_12 * 2 = neg_g_472_low60_20_low20_11 + neg_f_472_low60_20_low20_11,
    r_492_504 * 2 = r_492_503 + u_492_503,
    s_492_504 * 2 = s_492_503 + v_492_503
&&
    true
;

{
    u_492_504 * neg_f_472_low60_20_low20_0 + v_492_504 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_504 * neg_f_472_low60_20_low20_0 + s_492_504 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_12 + u_492_504 * (const 64 (2**21)) + v_492_504 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_12 + r_492_504 * (const 64 (2**21)) + s_492_504 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_12,
    neg_f_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_12,
    neg_g_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 504)) <=s delta, delta <=s (const 64 (1 + 2*504)),
    (const 64 (-(2**20))) <=s u_492_504, u_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_504, v_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_504, r_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_504, s_492_504 <=s (const 64 ((2**20))),
    u_492_504 + v_492_504 <=s (const 64 (2**20)),
    u_492_504 - v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 + v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 - v_492_504 <=s (const 64 (2**20)),
    r_492_504 + s_492_504 <=s (const 64 (2**20)),
    r_492_504 - s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 + s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 - s_492_504 <=s (const 64 (2**20)),
    u_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_492_504 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_503_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_11,
sint64 neg_g_472_low60_20_low20_11,
sint64 neg_f_472_low60_20_low20_12,
sint64 neg_g_472_low60_20_low20_12,
sint64 u_492_503,
sint64 v_492_503,
sint64 r_492_503,
sint64 s_492_503,
sint64 u_492_504,
sint64 v_492_504,
sint64 r_492_504,
sint64 s_492_504,
bit ne
)={
    u_492_503 * neg_f_472_low60_20_low20_0 + v_492_503 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_11 * (-(2**20)),
    r_492_503 * neg_f_472_low60_20_low20_0 + s_492_503 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_11 * (-(2**20))
&&
    u_492_503 * neg_f_472_low60_20_low20_0 + v_492_503 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_11 * (const 64 (-(2**20))),
    r_492_503 * neg_f_472_low60_20_low20_0 + s_492_503 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_11 + u_492_503 * (const 64 (2**21)) + v_492_503 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_11 + r_492_503 * (const 64 (2**21)) + s_492_503 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_11,
    neg_f_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_11,
    neg_g_472_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 503)) <=s delta, delta <=s (const 64 (1 + 2*503)),
    (const 64 (-(2**20))) <=s u_492_503, u_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_503, v_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_503, r_492_503 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_503, s_492_503 <=s (const 64 ((2**20))),
    u_492_503 + v_492_503 <=s (const 64 (2**20)),
    u_492_503 - v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 + v_492_503 <=s (const 64 (2**20)),
    (const 64 0) - u_492_503 - v_492_503 <=s (const 64 (2**20)),
    r_492_503 + s_492_503 <=s (const 64 (2**20)),
    r_492_503 - s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 + s_492_503 <=s (const 64 (2**20)),
    (const 64 0) - r_492_503 - s_492_503 <=s (const 64 (2**20)),
    u_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_492_503 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_492_503 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step503

// premise c
assume
neg_g_472_low60_20_low20_11 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_12 neg_g_472_low60_20_low20_11;
mov u_492_504 r_492_503;
mov v_492_504 s_492_503;

subs dc neg_g_472_low60_20_low20_12 neg_g_472_low60_20_low20_11 neg_f_472_low60_20_low20_11;
asr neg_g_472_low60_20_low20_12 neg_g_472_low60_20_low20_12 1;
subs dc r_492_504 r_492_503 u_492_503;
asr r_492_504 r_492_504 1;
subs dc s_492_504 s_492_503 v_492_503;
asr s_492_504 s_492_504 1;
assert
    true
&&
    neg_f_472_low60_20_low20_12 = neg_g_472_low60_20_low20_11,
    u_492_504 = r_492_503,
    v_492_504 = s_492_503,
    neg_g_472_low60_20_low20_12 * (const 64 2) = neg_g_472_low60_20_low20_11 - neg_f_472_low60_20_low20_11,
    r_492_504 * (const 64 2) = r_492_503 - u_492_503,
    s_492_504 * (const 64 2) = s_492_503 - v_492_503
;

assume
    neg_f_472_low60_20_low20_12 = neg_g_472_low60_20_low20_11,
    u_492_504 = r_492_503,
    v_492_504 = s_492_503,
    neg_g_472_low60_20_low20_12 * 2 = neg_g_472_low60_20_low20_11 - neg_f_472_low60_20_low20_11,
    r_492_504 * 2 = r_492_503 - u_492_503,
    s_492_504 * 2 = s_492_503 - v_492_503
&&
    true
;

{
    u_492_504 * neg_f_472_low60_20_low20_0 + v_492_504 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_504 * neg_f_472_low60_20_low20_0 + s_492_504 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_12 + u_492_504 * (const 64 (2**21)) + v_492_504 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_12 + r_492_504 * (const 64 (2**21)) + s_492_504 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_12,
    neg_f_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_12,
    neg_g_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 504)) <=s delta, delta <=s (const 64 (1 + 2*504)),
    (const 64 (-(2**20))) <=s u_492_504, u_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_504, v_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_504, r_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_504, s_492_504 <=s (const 64 ((2**20))),
    u_492_504 + v_492_504 <=s (const 64 (2**20)),
    u_492_504 - v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 + v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 - v_492_504 <=s (const 64 (2**20)),
    r_492_504 + s_492_504 <=s (const 64 (2**20)),
    r_492_504 - s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 + s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 - s_492_504 <=s (const 64 (2**20)),
    u_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_492_504 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_504_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_12,
sint64 neg_g_472_low60_20_low20_12,
sint64 neg_f_472_low60_20_low20_13,
sint64 neg_g_472_low60_20_low20_13,
sint64 u_492_504,
sint64 v_492_504,
sint64 r_492_504,
sint64 s_492_504,
sint64 u_492_505,
sint64 v_492_505,
sint64 r_492_505,
sint64 s_492_505,
bit ne
)={
    u_492_504 * neg_f_472_low60_20_low20_0 + v_492_504 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_12 * (-(2**20)),
    r_492_504 * neg_f_472_low60_20_low20_0 + s_492_504 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_12 * (-(2**20))
&&
    u_492_504 * neg_f_472_low60_20_low20_0 + v_492_504 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_12 * (const 64 (-(2**20))),
    r_492_504 * neg_f_472_low60_20_low20_0 + s_492_504 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_12 + u_492_504 * (const 64 (2**21)) + v_492_504 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_12 + r_492_504 * (const 64 (2**21)) + s_492_504 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_12,
    neg_f_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_12,
    neg_g_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 504)) <=s delta, delta <=s (const 64 (1 + 2*504)),
    (const 64 (-(2**20))) <=s u_492_504, u_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_504, v_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_504, r_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_504, s_492_504 <=s (const 64 ((2**20))),
    u_492_504 + v_492_504 <=s (const 64 (2**20)),
    u_492_504 - v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 + v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 - v_492_504 <=s (const 64 (2**20)),
    r_492_504 + s_492_504 <=s (const 64 (2**20)),
    r_492_504 - s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 + s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 - s_492_504 <=s (const 64 (2**20)),
    u_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_492_504 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step504

// premise a
assume
neg_g_472_low60_20_low20_12 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_13 neg_f_472_low60_20_low20_12;
mov u_492_505 u_492_504;
mov v_492_505 v_492_504;

asr neg_g_472_low60_20_low20_13 neg_g_472_low60_20_low20_12 1;
asr r_492_505 r_492_504 1;
asr s_492_505 s_492_504 1;
assert
    true
&&
    neg_f_472_low60_20_low20_13 = neg_f_472_low60_20_low20_12,
    u_492_505 = u_492_504,
    v_492_505 = v_492_504,
    neg_g_472_low60_20_low20_13 * (const 64 2) = neg_g_472_low60_20_low20_12,
    r_492_505 * (const 64 2) = r_492_504,
    s_492_505 * (const 64 2) = s_492_504
;

assume
    neg_f_472_low60_20_low20_13 = neg_f_472_low60_20_low20_12,
    u_492_505 = u_492_504,
    v_492_505 = v_492_504,
    neg_g_472_low60_20_low20_13 * 2 = neg_g_472_low60_20_low20_12,
    r_492_505 * 2 = r_492_504,
    s_492_505 * 2 = s_492_504
&&
    true
;

{
    u_492_505 * neg_f_472_low60_20_low20_0 + v_492_505 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_505 * neg_f_472_low60_20_low20_0 + s_492_505 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_13 + u_492_505 * (const 64 (2**21)) + v_492_505 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_13 + r_492_505 * (const 64 (2**21)) + s_492_505 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_13,
    neg_f_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_13,
    neg_g_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 505)) <=s delta, delta <=s (const 64 (1 + 2*505)),
    (const 64 (-(2**20))) <=s u_492_505, u_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_505, v_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_505, r_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_505, s_492_505 <=s (const 64 ((2**20))),
    u_492_505 + v_492_505 <=s (const 64 (2**20)),
    u_492_505 - v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 + v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 - v_492_505 <=s (const 64 (2**20)),
    r_492_505 + s_492_505 <=s (const 64 (2**20)),
    r_492_505 - s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 + s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 - s_492_505 <=s (const 64 (2**20)),
    u_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_492_505 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_504_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_12,
sint64 neg_g_472_low60_20_low20_12,
sint64 neg_f_472_low60_20_low20_13,
sint64 neg_g_472_low60_20_low20_13,
sint64 u_492_504,
sint64 v_492_504,
sint64 r_492_504,
sint64 s_492_504,
sint64 u_492_505,
sint64 v_492_505,
sint64 r_492_505,
sint64 s_492_505,
bit ne
)={
    u_492_504 * neg_f_472_low60_20_low20_0 + v_492_504 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_12 * (-(2**20)),
    r_492_504 * neg_f_472_low60_20_low20_0 + s_492_504 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_12 * (-(2**20))
&&
    u_492_504 * neg_f_472_low60_20_low20_0 + v_492_504 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_12 * (const 64 (-(2**20))),
    r_492_504 * neg_f_472_low60_20_low20_0 + s_492_504 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_12 + u_492_504 * (const 64 (2**21)) + v_492_504 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_12 + r_492_504 * (const 64 (2**21)) + s_492_504 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_12,
    neg_f_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_12,
    neg_g_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 504)) <=s delta, delta <=s (const 64 (1 + 2*504)),
    (const 64 (-(2**20))) <=s u_492_504, u_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_504, v_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_504, r_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_504, s_492_504 <=s (const 64 ((2**20))),
    u_492_504 + v_492_504 <=s (const 64 (2**20)),
    u_492_504 - v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 + v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 - v_492_504 <=s (const 64 (2**20)),
    r_492_504 + s_492_504 <=s (const 64 (2**20)),
    r_492_504 - s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 + s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 - s_492_504 <=s (const 64 (2**20)),
    u_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_492_504 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step504

// premise b
assume
neg_g_472_low60_20_low20_12 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_13 neg_f_472_low60_20_low20_12;
mov u_492_505 u_492_504;
mov v_492_505 v_492_504;

add neg_g_472_low60_20_low20_13 neg_g_472_low60_20_low20_12 neg_f_472_low60_20_low20_12;
asr neg_g_472_low60_20_low20_13 neg_g_472_low60_20_low20_13 1;
add r_492_505 r_492_504 u_492_504;
asr r_492_505 r_492_505 1;
add s_492_505 s_492_504 v_492_504;
asr s_492_505 s_492_505 1;
assert
    true
&&
    neg_f_472_low60_20_low20_13 = neg_f_472_low60_20_low20_12,
    u_492_505 = u_492_504,
    v_492_505 = v_492_504,
    neg_g_472_low60_20_low20_13 * (const 64 2) = neg_g_472_low60_20_low20_12 + neg_f_472_low60_20_low20_12,
    r_492_505 * (const 64 2) = r_492_504 + u_492_504,
    s_492_505 * (const 64 2) = s_492_504 + v_492_504
;

assume
    neg_f_472_low60_20_low20_13 = neg_f_472_low60_20_low20_12,
    u_492_505 = u_492_504,
    v_492_505 = v_492_504,
    neg_g_472_low60_20_low20_13 * 2 = neg_g_472_low60_20_low20_12 + neg_f_472_low60_20_low20_12,
    r_492_505 * 2 = r_492_504 + u_492_504,
    s_492_505 * 2 = s_492_504 + v_492_504
&&
    true
;

{
    u_492_505 * neg_f_472_low60_20_low20_0 + v_492_505 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_505 * neg_f_472_low60_20_low20_0 + s_492_505 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_13 + u_492_505 * (const 64 (2**21)) + v_492_505 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_13 + r_492_505 * (const 64 (2**21)) + s_492_505 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_13,
    neg_f_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_13,
    neg_g_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 505)) <=s delta, delta <=s (const 64 (1 + 2*505)),
    (const 64 (-(2**20))) <=s u_492_505, u_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_505, v_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_505, r_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_505, s_492_505 <=s (const 64 ((2**20))),
    u_492_505 + v_492_505 <=s (const 64 (2**20)),
    u_492_505 - v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 + v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 - v_492_505 <=s (const 64 (2**20)),
    r_492_505 + s_492_505 <=s (const 64 (2**20)),
    r_492_505 - s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 + s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 - s_492_505 <=s (const 64 (2**20)),
    u_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_492_505 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_504_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_12,
sint64 neg_g_472_low60_20_low20_12,
sint64 neg_f_472_low60_20_low20_13,
sint64 neg_g_472_low60_20_low20_13,
sint64 u_492_504,
sint64 v_492_504,
sint64 r_492_504,
sint64 s_492_504,
sint64 u_492_505,
sint64 v_492_505,
sint64 r_492_505,
sint64 s_492_505,
bit ne
)={
    u_492_504 * neg_f_472_low60_20_low20_0 + v_492_504 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_12 * (-(2**20)),
    r_492_504 * neg_f_472_low60_20_low20_0 + s_492_504 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_12 * (-(2**20))
&&
    u_492_504 * neg_f_472_low60_20_low20_0 + v_492_504 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_12 * (const 64 (-(2**20))),
    r_492_504 * neg_f_472_low60_20_low20_0 + s_492_504 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_12 + u_492_504 * (const 64 (2**21)) + v_492_504 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_12 + r_492_504 * (const 64 (2**21)) + s_492_504 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_12,
    neg_f_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_12,
    neg_g_472_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 504)) <=s delta, delta <=s (const 64 (1 + 2*504)),
    (const 64 (-(2**20))) <=s u_492_504, u_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_504, v_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_504, r_492_504 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_504, s_492_504 <=s (const 64 ((2**20))),
    u_492_504 + v_492_504 <=s (const 64 (2**20)),
    u_492_504 - v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 + v_492_504 <=s (const 64 (2**20)),
    (const 64 0) - u_492_504 - v_492_504 <=s (const 64 (2**20)),
    r_492_504 + s_492_504 <=s (const 64 (2**20)),
    r_492_504 - s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 + s_492_504 <=s (const 64 (2**20)),
    (const 64 0) - r_492_504 - s_492_504 <=s (const 64 (2**20)),
    u_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_492_504 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_492_504 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step504

// premise c
assume
neg_g_472_low60_20_low20_12 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_13 neg_g_472_low60_20_low20_12;
mov u_492_505 r_492_504;
mov v_492_505 s_492_504;

subs dc neg_g_472_low60_20_low20_13 neg_g_472_low60_20_low20_12 neg_f_472_low60_20_low20_12;
asr neg_g_472_low60_20_low20_13 neg_g_472_low60_20_low20_13 1;
subs dc r_492_505 r_492_504 u_492_504;
asr r_492_505 r_492_505 1;
subs dc s_492_505 s_492_504 v_492_504;
asr s_492_505 s_492_505 1;
assert
    true
&&
    neg_f_472_low60_20_low20_13 = neg_g_472_low60_20_low20_12,
    u_492_505 = r_492_504,
    v_492_505 = s_492_504,
    neg_g_472_low60_20_low20_13 * (const 64 2) = neg_g_472_low60_20_low20_12 - neg_f_472_low60_20_low20_12,
    r_492_505 * (const 64 2) = r_492_504 - u_492_504,
    s_492_505 * (const 64 2) = s_492_504 - v_492_504
;

assume
    neg_f_472_low60_20_low20_13 = neg_g_472_low60_20_low20_12,
    u_492_505 = r_492_504,
    v_492_505 = s_492_504,
    neg_g_472_low60_20_low20_13 * 2 = neg_g_472_low60_20_low20_12 - neg_f_472_low60_20_low20_12,
    r_492_505 * 2 = r_492_504 - u_492_504,
    s_492_505 * 2 = s_492_504 - v_492_504
&&
    true
;

{
    u_492_505 * neg_f_472_low60_20_low20_0 + v_492_505 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_505 * neg_f_472_low60_20_low20_0 + s_492_505 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_13 + u_492_505 * (const 64 (2**21)) + v_492_505 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_13 + r_492_505 * (const 64 (2**21)) + s_492_505 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_13,
    neg_f_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_13,
    neg_g_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 505)) <=s delta, delta <=s (const 64 (1 + 2*505)),
    (const 64 (-(2**20))) <=s u_492_505, u_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_505, v_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_505, r_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_505, s_492_505 <=s (const 64 ((2**20))),
    u_492_505 + v_492_505 <=s (const 64 (2**20)),
    u_492_505 - v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 + v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 - v_492_505 <=s (const 64 (2**20)),
    r_492_505 + s_492_505 <=s (const 64 (2**20)),
    r_492_505 - s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 + s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 - s_492_505 <=s (const 64 (2**20)),
    u_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_492_505 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_505_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_13,
sint64 neg_g_472_low60_20_low20_13,
sint64 neg_f_472_low60_20_low20_14,
sint64 neg_g_472_low60_20_low20_14,
sint64 u_492_505,
sint64 v_492_505,
sint64 r_492_505,
sint64 s_492_505,
sint64 u_492_506,
sint64 v_492_506,
sint64 r_492_506,
sint64 s_492_506,
bit ne
)={
    u_492_505 * neg_f_472_low60_20_low20_0 + v_492_505 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_13 * (-(2**20)),
    r_492_505 * neg_f_472_low60_20_low20_0 + s_492_505 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_13 * (-(2**20))
&&
    u_492_505 * neg_f_472_low60_20_low20_0 + v_492_505 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_13 * (const 64 (-(2**20))),
    r_492_505 * neg_f_472_low60_20_low20_0 + s_492_505 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_13 + u_492_505 * (const 64 (2**21)) + v_492_505 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_13 + r_492_505 * (const 64 (2**21)) + s_492_505 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_13,
    neg_f_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_13,
    neg_g_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 505)) <=s delta, delta <=s (const 64 (1 + 2*505)),
    (const 64 (-(2**20))) <=s u_492_505, u_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_505, v_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_505, r_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_505, s_492_505 <=s (const 64 ((2**20))),
    u_492_505 + v_492_505 <=s (const 64 (2**20)),
    u_492_505 - v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 + v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 - v_492_505 <=s (const 64 (2**20)),
    r_492_505 + s_492_505 <=s (const 64 (2**20)),
    r_492_505 - s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 + s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 - s_492_505 <=s (const 64 (2**20)),
    u_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_492_505 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step505

// premise a
assume
neg_g_472_low60_20_low20_13 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_14 neg_f_472_low60_20_low20_13;
mov u_492_506 u_492_505;
mov v_492_506 v_492_505;

asr neg_g_472_low60_20_low20_14 neg_g_472_low60_20_low20_13 1;
asr r_492_506 r_492_505 1;
asr s_492_506 s_492_505 1;
assert
    true
&&
    neg_f_472_low60_20_low20_14 = neg_f_472_low60_20_low20_13,
    u_492_506 = u_492_505,
    v_492_506 = v_492_505,
    neg_g_472_low60_20_low20_14 * (const 64 2) = neg_g_472_low60_20_low20_13,
    r_492_506 * (const 64 2) = r_492_505,
    s_492_506 * (const 64 2) = s_492_505
;

assume
    neg_f_472_low60_20_low20_14 = neg_f_472_low60_20_low20_13,
    u_492_506 = u_492_505,
    v_492_506 = v_492_505,
    neg_g_472_low60_20_low20_14 * 2 = neg_g_472_low60_20_low20_13,
    r_492_506 * 2 = r_492_505,
    s_492_506 * 2 = s_492_505
&&
    true
;

{
    u_492_506 * neg_f_472_low60_20_low20_0 + v_492_506 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_506 * neg_f_472_low60_20_low20_0 + s_492_506 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_14 + u_492_506 * (const 64 (2**21)) + v_492_506 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_14 + r_492_506 * (const 64 (2**21)) + s_492_506 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_14,
    neg_f_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_14,
    neg_g_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 506)) <=s delta, delta <=s (const 64 (1 + 2*506)),
    (const 64 (-(2**20))) <=s u_492_506, u_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_506, v_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_506, r_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_506, s_492_506 <=s (const 64 ((2**20))),
    u_492_506 + v_492_506 <=s (const 64 (2**20)),
    u_492_506 - v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 + v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 - v_492_506 <=s (const 64 (2**20)),
    r_492_506 + s_492_506 <=s (const 64 (2**20)),
    r_492_506 - s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 + s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 - s_492_506 <=s (const 64 (2**20)),
    u_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_492_506 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_505_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_13,
sint64 neg_g_472_low60_20_low20_13,
sint64 neg_f_472_low60_20_low20_14,
sint64 neg_g_472_low60_20_low20_14,
sint64 u_492_505,
sint64 v_492_505,
sint64 r_492_505,
sint64 s_492_505,
sint64 u_492_506,
sint64 v_492_506,
sint64 r_492_506,
sint64 s_492_506,
bit ne
)={
    u_492_505 * neg_f_472_low60_20_low20_0 + v_492_505 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_13 * (-(2**20)),
    r_492_505 * neg_f_472_low60_20_low20_0 + s_492_505 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_13 * (-(2**20))
&&
    u_492_505 * neg_f_472_low60_20_low20_0 + v_492_505 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_13 * (const 64 (-(2**20))),
    r_492_505 * neg_f_472_low60_20_low20_0 + s_492_505 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_13 + u_492_505 * (const 64 (2**21)) + v_492_505 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_13 + r_492_505 * (const 64 (2**21)) + s_492_505 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_13,
    neg_f_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_13,
    neg_g_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 505)) <=s delta, delta <=s (const 64 (1 + 2*505)),
    (const 64 (-(2**20))) <=s u_492_505, u_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_505, v_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_505, r_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_505, s_492_505 <=s (const 64 ((2**20))),
    u_492_505 + v_492_505 <=s (const 64 (2**20)),
    u_492_505 - v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 + v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 - v_492_505 <=s (const 64 (2**20)),
    r_492_505 + s_492_505 <=s (const 64 (2**20)),
    r_492_505 - s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 + s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 - s_492_505 <=s (const 64 (2**20)),
    u_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_492_505 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step505

// premise b
assume
neg_g_472_low60_20_low20_13 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_14 neg_f_472_low60_20_low20_13;
mov u_492_506 u_492_505;
mov v_492_506 v_492_505;

add neg_g_472_low60_20_low20_14 neg_g_472_low60_20_low20_13 neg_f_472_low60_20_low20_13;
asr neg_g_472_low60_20_low20_14 neg_g_472_low60_20_low20_14 1;
add r_492_506 r_492_505 u_492_505;
asr r_492_506 r_492_506 1;
add s_492_506 s_492_505 v_492_505;
asr s_492_506 s_492_506 1;
assert
    true
&&
    neg_f_472_low60_20_low20_14 = neg_f_472_low60_20_low20_13,
    u_492_506 = u_492_505,
    v_492_506 = v_492_505,
    neg_g_472_low60_20_low20_14 * (const 64 2) = neg_g_472_low60_20_low20_13 + neg_f_472_low60_20_low20_13,
    r_492_506 * (const 64 2) = r_492_505 + u_492_505,
    s_492_506 * (const 64 2) = s_492_505 + v_492_505
;

assume
    neg_f_472_low60_20_low20_14 = neg_f_472_low60_20_low20_13,
    u_492_506 = u_492_505,
    v_492_506 = v_492_505,
    neg_g_472_low60_20_low20_14 * 2 = neg_g_472_low60_20_low20_13 + neg_f_472_low60_20_low20_13,
    r_492_506 * 2 = r_492_505 + u_492_505,
    s_492_506 * 2 = s_492_505 + v_492_505
&&
    true
;

{
    u_492_506 * neg_f_472_low60_20_low20_0 + v_492_506 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_506 * neg_f_472_low60_20_low20_0 + s_492_506 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_14 + u_492_506 * (const 64 (2**21)) + v_492_506 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_14 + r_492_506 * (const 64 (2**21)) + s_492_506 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_14,
    neg_f_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_14,
    neg_g_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 506)) <=s delta, delta <=s (const 64 (1 + 2*506)),
    (const 64 (-(2**20))) <=s u_492_506, u_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_506, v_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_506, r_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_506, s_492_506 <=s (const 64 ((2**20))),
    u_492_506 + v_492_506 <=s (const 64 (2**20)),
    u_492_506 - v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 + v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 - v_492_506 <=s (const 64 (2**20)),
    r_492_506 + s_492_506 <=s (const 64 (2**20)),
    r_492_506 - s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 + s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 - s_492_506 <=s (const 64 (2**20)),
    u_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_492_506 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_505_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_13,
sint64 neg_g_472_low60_20_low20_13,
sint64 neg_f_472_low60_20_low20_14,
sint64 neg_g_472_low60_20_low20_14,
sint64 u_492_505,
sint64 v_492_505,
sint64 r_492_505,
sint64 s_492_505,
sint64 u_492_506,
sint64 v_492_506,
sint64 r_492_506,
sint64 s_492_506,
bit ne
)={
    u_492_505 * neg_f_472_low60_20_low20_0 + v_492_505 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_13 * (-(2**20)),
    r_492_505 * neg_f_472_low60_20_low20_0 + s_492_505 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_13 * (-(2**20))
&&
    u_492_505 * neg_f_472_low60_20_low20_0 + v_492_505 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_13 * (const 64 (-(2**20))),
    r_492_505 * neg_f_472_low60_20_low20_0 + s_492_505 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_13 + u_492_505 * (const 64 (2**21)) + v_492_505 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_13 + r_492_505 * (const 64 (2**21)) + s_492_505 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_13,
    neg_f_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_13,
    neg_g_472_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 505)) <=s delta, delta <=s (const 64 (1 + 2*505)),
    (const 64 (-(2**20))) <=s u_492_505, u_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_505, v_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_505, r_492_505 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_505, s_492_505 <=s (const 64 ((2**20))),
    u_492_505 + v_492_505 <=s (const 64 (2**20)),
    u_492_505 - v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 + v_492_505 <=s (const 64 (2**20)),
    (const 64 0) - u_492_505 - v_492_505 <=s (const 64 (2**20)),
    r_492_505 + s_492_505 <=s (const 64 (2**20)),
    r_492_505 - s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 + s_492_505 <=s (const 64 (2**20)),
    (const 64 0) - r_492_505 - s_492_505 <=s (const 64 (2**20)),
    u_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_492_505 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_492_505 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step505

// premise c
assume
neg_g_472_low60_20_low20_13 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_14 neg_g_472_low60_20_low20_13;
mov u_492_506 r_492_505;
mov v_492_506 s_492_505;

subs dc neg_g_472_low60_20_low20_14 neg_g_472_low60_20_low20_13 neg_f_472_low60_20_low20_13;
asr neg_g_472_low60_20_low20_14 neg_g_472_low60_20_low20_14 1;
subs dc r_492_506 r_492_505 u_492_505;
asr r_492_506 r_492_506 1;
subs dc s_492_506 s_492_505 v_492_505;
asr s_492_506 s_492_506 1;
assert
    true
&&
    neg_f_472_low60_20_low20_14 = neg_g_472_low60_20_low20_13,
    u_492_506 = r_492_505,
    v_492_506 = s_492_505,
    neg_g_472_low60_20_low20_14 * (const 64 2) = neg_g_472_low60_20_low20_13 - neg_f_472_low60_20_low20_13,
    r_492_506 * (const 64 2) = r_492_505 - u_492_505,
    s_492_506 * (const 64 2) = s_492_505 - v_492_505
;

assume
    neg_f_472_low60_20_low20_14 = neg_g_472_low60_20_low20_13,
    u_492_506 = r_492_505,
    v_492_506 = s_492_505,
    neg_g_472_low60_20_low20_14 * 2 = neg_g_472_low60_20_low20_13 - neg_f_472_low60_20_low20_13,
    r_492_506 * 2 = r_492_505 - u_492_505,
    s_492_506 * 2 = s_492_505 - v_492_505
&&
    true
;

{
    u_492_506 * neg_f_472_low60_20_low20_0 + v_492_506 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_506 * neg_f_472_low60_20_low20_0 + s_492_506 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_14 + u_492_506 * (const 64 (2**21)) + v_492_506 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_14 + r_492_506 * (const 64 (2**21)) + s_492_506 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_14,
    neg_f_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_14,
    neg_g_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 506)) <=s delta, delta <=s (const 64 (1 + 2*506)),
    (const 64 (-(2**20))) <=s u_492_506, u_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_506, v_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_506, r_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_506, s_492_506 <=s (const 64 ((2**20))),
    u_492_506 + v_492_506 <=s (const 64 (2**20)),
    u_492_506 - v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 + v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 - v_492_506 <=s (const 64 (2**20)),
    r_492_506 + s_492_506 <=s (const 64 (2**20)),
    r_492_506 - s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 + s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 - s_492_506 <=s (const 64 (2**20)),
    u_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_492_506 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_506_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_14,
sint64 neg_g_472_low60_20_low20_14,
sint64 neg_f_472_low60_20_low20_15,
sint64 neg_g_472_low60_20_low20_15,
sint64 u_492_506,
sint64 v_492_506,
sint64 r_492_506,
sint64 s_492_506,
sint64 u_492_507,
sint64 v_492_507,
sint64 r_492_507,
sint64 s_492_507,
bit ne
)={
    u_492_506 * neg_f_472_low60_20_low20_0 + v_492_506 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_14 * (-(2**20)),
    r_492_506 * neg_f_472_low60_20_low20_0 + s_492_506 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_14 * (-(2**20))
&&
    u_492_506 * neg_f_472_low60_20_low20_0 + v_492_506 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_14 * (const 64 (-(2**20))),
    r_492_506 * neg_f_472_low60_20_low20_0 + s_492_506 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_14 + u_492_506 * (const 64 (2**21)) + v_492_506 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_14 + r_492_506 * (const 64 (2**21)) + s_492_506 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_14,
    neg_f_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_14,
    neg_g_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 506)) <=s delta, delta <=s (const 64 (1 + 2*506)),
    (const 64 (-(2**20))) <=s u_492_506, u_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_506, v_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_506, r_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_506, s_492_506 <=s (const 64 ((2**20))),
    u_492_506 + v_492_506 <=s (const 64 (2**20)),
    u_492_506 - v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 + v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 - v_492_506 <=s (const 64 (2**20)),
    r_492_506 + s_492_506 <=s (const 64 (2**20)),
    r_492_506 - s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 + s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 - s_492_506 <=s (const 64 (2**20)),
    u_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_492_506 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step506

// premise a
assume
neg_g_472_low60_20_low20_14 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_15 neg_f_472_low60_20_low20_14;
mov u_492_507 u_492_506;
mov v_492_507 v_492_506;

asr neg_g_472_low60_20_low20_15 neg_g_472_low60_20_low20_14 1;
asr r_492_507 r_492_506 1;
asr s_492_507 s_492_506 1;
assert
    true
&&
    neg_f_472_low60_20_low20_15 = neg_f_472_low60_20_low20_14,
    u_492_507 = u_492_506,
    v_492_507 = v_492_506,
    neg_g_472_low60_20_low20_15 * (const 64 2) = neg_g_472_low60_20_low20_14,
    r_492_507 * (const 64 2) = r_492_506,
    s_492_507 * (const 64 2) = s_492_506
;

assume
    neg_f_472_low60_20_low20_15 = neg_f_472_low60_20_low20_14,
    u_492_507 = u_492_506,
    v_492_507 = v_492_506,
    neg_g_472_low60_20_low20_15 * 2 = neg_g_472_low60_20_low20_14,
    r_492_507 * 2 = r_492_506,
    s_492_507 * 2 = s_492_506
&&
    true
;

{
    u_492_507 * neg_f_472_low60_20_low20_0 + v_492_507 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_507 * neg_f_472_low60_20_low20_0 + s_492_507 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_15 + u_492_507 * (const 64 (2**21)) + v_492_507 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_15 + r_492_507 * (const 64 (2**21)) + s_492_507 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_15,
    neg_f_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_15,
    neg_g_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 507)) <=s delta, delta <=s (const 64 (1 + 2*507)),
    (const 64 (-(2**20))) <=s u_492_507, u_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_507, v_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_507, r_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_507, s_492_507 <=s (const 64 ((2**20))),
    u_492_507 + v_492_507 <=s (const 64 (2**20)),
    u_492_507 - v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 + v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 - v_492_507 <=s (const 64 (2**20)),
    r_492_507 + s_492_507 <=s (const 64 (2**20)),
    r_492_507 - s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 + s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 - s_492_507 <=s (const 64 (2**20)),
    u_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_492_507 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_506_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_14,
sint64 neg_g_472_low60_20_low20_14,
sint64 neg_f_472_low60_20_low20_15,
sint64 neg_g_472_low60_20_low20_15,
sint64 u_492_506,
sint64 v_492_506,
sint64 r_492_506,
sint64 s_492_506,
sint64 u_492_507,
sint64 v_492_507,
sint64 r_492_507,
sint64 s_492_507,
bit ne
)={
    u_492_506 * neg_f_472_low60_20_low20_0 + v_492_506 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_14 * (-(2**20)),
    r_492_506 * neg_f_472_low60_20_low20_0 + s_492_506 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_14 * (-(2**20))
&&
    u_492_506 * neg_f_472_low60_20_low20_0 + v_492_506 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_14 * (const 64 (-(2**20))),
    r_492_506 * neg_f_472_low60_20_low20_0 + s_492_506 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_14 + u_492_506 * (const 64 (2**21)) + v_492_506 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_14 + r_492_506 * (const 64 (2**21)) + s_492_506 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_14,
    neg_f_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_14,
    neg_g_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 506)) <=s delta, delta <=s (const 64 (1 + 2*506)),
    (const 64 (-(2**20))) <=s u_492_506, u_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_506, v_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_506, r_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_506, s_492_506 <=s (const 64 ((2**20))),
    u_492_506 + v_492_506 <=s (const 64 (2**20)),
    u_492_506 - v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 + v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 - v_492_506 <=s (const 64 (2**20)),
    r_492_506 + s_492_506 <=s (const 64 (2**20)),
    r_492_506 - s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 + s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 - s_492_506 <=s (const 64 (2**20)),
    u_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_492_506 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step506

// premise b
assume
neg_g_472_low60_20_low20_14 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_15 neg_f_472_low60_20_low20_14;
mov u_492_507 u_492_506;
mov v_492_507 v_492_506;

add neg_g_472_low60_20_low20_15 neg_g_472_low60_20_low20_14 neg_f_472_low60_20_low20_14;
asr neg_g_472_low60_20_low20_15 neg_g_472_low60_20_low20_15 1;
add r_492_507 r_492_506 u_492_506;
asr r_492_507 r_492_507 1;
add s_492_507 s_492_506 v_492_506;
asr s_492_507 s_492_507 1;
assert
    true
&&
    neg_f_472_low60_20_low20_15 = neg_f_472_low60_20_low20_14,
    u_492_507 = u_492_506,
    v_492_507 = v_492_506,
    neg_g_472_low60_20_low20_15 * (const 64 2) = neg_g_472_low60_20_low20_14 + neg_f_472_low60_20_low20_14,
    r_492_507 * (const 64 2) = r_492_506 + u_492_506,
    s_492_507 * (const 64 2) = s_492_506 + v_492_506
;

assume
    neg_f_472_low60_20_low20_15 = neg_f_472_low60_20_low20_14,
    u_492_507 = u_492_506,
    v_492_507 = v_492_506,
    neg_g_472_low60_20_low20_15 * 2 = neg_g_472_low60_20_low20_14 + neg_f_472_low60_20_low20_14,
    r_492_507 * 2 = r_492_506 + u_492_506,
    s_492_507 * 2 = s_492_506 + v_492_506
&&
    true
;

{
    u_492_507 * neg_f_472_low60_20_low20_0 + v_492_507 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_507 * neg_f_472_low60_20_low20_0 + s_492_507 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_15 + u_492_507 * (const 64 (2**21)) + v_492_507 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_15 + r_492_507 * (const 64 (2**21)) + s_492_507 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_15,
    neg_f_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_15,
    neg_g_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 507)) <=s delta, delta <=s (const 64 (1 + 2*507)),
    (const 64 (-(2**20))) <=s u_492_507, u_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_507, v_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_507, r_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_507, s_492_507 <=s (const 64 ((2**20))),
    u_492_507 + v_492_507 <=s (const 64 (2**20)),
    u_492_507 - v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 + v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 - v_492_507 <=s (const 64 (2**20)),
    r_492_507 + s_492_507 <=s (const 64 (2**20)),
    r_492_507 - s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 + s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 - s_492_507 <=s (const 64 (2**20)),
    u_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_492_507 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_506_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_14,
sint64 neg_g_472_low60_20_low20_14,
sint64 neg_f_472_low60_20_low20_15,
sint64 neg_g_472_low60_20_low20_15,
sint64 u_492_506,
sint64 v_492_506,
sint64 r_492_506,
sint64 s_492_506,
sint64 u_492_507,
sint64 v_492_507,
sint64 r_492_507,
sint64 s_492_507,
bit ne
)={
    u_492_506 * neg_f_472_low60_20_low20_0 + v_492_506 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_14 * (-(2**20)),
    r_492_506 * neg_f_472_low60_20_low20_0 + s_492_506 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_14 * (-(2**20))
&&
    u_492_506 * neg_f_472_low60_20_low20_0 + v_492_506 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_14 * (const 64 (-(2**20))),
    r_492_506 * neg_f_472_low60_20_low20_0 + s_492_506 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_14 + u_492_506 * (const 64 (2**21)) + v_492_506 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_14 + r_492_506 * (const 64 (2**21)) + s_492_506 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_14,
    neg_f_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_14,
    neg_g_472_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 506)) <=s delta, delta <=s (const 64 (1 + 2*506)),
    (const 64 (-(2**20))) <=s u_492_506, u_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_506, v_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_506, r_492_506 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_506, s_492_506 <=s (const 64 ((2**20))),
    u_492_506 + v_492_506 <=s (const 64 (2**20)),
    u_492_506 - v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 + v_492_506 <=s (const 64 (2**20)),
    (const 64 0) - u_492_506 - v_492_506 <=s (const 64 (2**20)),
    r_492_506 + s_492_506 <=s (const 64 (2**20)),
    r_492_506 - s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 + s_492_506 <=s (const 64 (2**20)),
    (const 64 0) - r_492_506 - s_492_506 <=s (const 64 (2**20)),
    u_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_492_506 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_492_506 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step506

// premise c
assume
neg_g_472_low60_20_low20_14 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_15 neg_g_472_low60_20_low20_14;
mov u_492_507 r_492_506;
mov v_492_507 s_492_506;

subs dc neg_g_472_low60_20_low20_15 neg_g_472_low60_20_low20_14 neg_f_472_low60_20_low20_14;
asr neg_g_472_low60_20_low20_15 neg_g_472_low60_20_low20_15 1;
subs dc r_492_507 r_492_506 u_492_506;
asr r_492_507 r_492_507 1;
subs dc s_492_507 s_492_506 v_492_506;
asr s_492_507 s_492_507 1;
assert
    true
&&
    neg_f_472_low60_20_low20_15 = neg_g_472_low60_20_low20_14,
    u_492_507 = r_492_506,
    v_492_507 = s_492_506,
    neg_g_472_low60_20_low20_15 * (const 64 2) = neg_g_472_low60_20_low20_14 - neg_f_472_low60_20_low20_14,
    r_492_507 * (const 64 2) = r_492_506 - u_492_506,
    s_492_507 * (const 64 2) = s_492_506 - v_492_506
;

assume
    neg_f_472_low60_20_low20_15 = neg_g_472_low60_20_low20_14,
    u_492_507 = r_492_506,
    v_492_507 = s_492_506,
    neg_g_472_low60_20_low20_15 * 2 = neg_g_472_low60_20_low20_14 - neg_f_472_low60_20_low20_14,
    r_492_507 * 2 = r_492_506 - u_492_506,
    s_492_507 * 2 = s_492_506 - v_492_506
&&
    true
;

{
    u_492_507 * neg_f_472_low60_20_low20_0 + v_492_507 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_507 * neg_f_472_low60_20_low20_0 + s_492_507 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_15 + u_492_507 * (const 64 (2**21)) + v_492_507 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_15 + r_492_507 * (const 64 (2**21)) + s_492_507 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_15,
    neg_f_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_15,
    neg_g_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 507)) <=s delta, delta <=s (const 64 (1 + 2*507)),
    (const 64 (-(2**20))) <=s u_492_507, u_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_507, v_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_507, r_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_507, s_492_507 <=s (const 64 ((2**20))),
    u_492_507 + v_492_507 <=s (const 64 (2**20)),
    u_492_507 - v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 + v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 - v_492_507 <=s (const 64 (2**20)),
    r_492_507 + s_492_507 <=s (const 64 (2**20)),
    r_492_507 - s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 + s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 - s_492_507 <=s (const 64 (2**20)),
    u_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_492_507 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_507_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_15,
sint64 neg_g_472_low60_20_low20_15,
sint64 neg_f_472_low60_20_low20_16,
sint64 neg_g_472_low60_20_low20_16,
sint64 u_492_507,
sint64 v_492_507,
sint64 r_492_507,
sint64 s_492_507,
sint64 u_492_508,
sint64 v_492_508,
sint64 r_492_508,
sint64 s_492_508,
bit ne
)={
    u_492_507 * neg_f_472_low60_20_low20_0 + v_492_507 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_15 * (-(2**20)),
    r_492_507 * neg_f_472_low60_20_low20_0 + s_492_507 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_15 * (-(2**20))
&&
    u_492_507 * neg_f_472_low60_20_low20_0 + v_492_507 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_15 * (const 64 (-(2**20))),
    r_492_507 * neg_f_472_low60_20_low20_0 + s_492_507 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_15 + u_492_507 * (const 64 (2**21)) + v_492_507 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_15 + r_492_507 * (const 64 (2**21)) + s_492_507 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_15,
    neg_f_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_15,
    neg_g_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 507)) <=s delta, delta <=s (const 64 (1 + 2*507)),
    (const 64 (-(2**20))) <=s u_492_507, u_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_507, v_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_507, r_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_507, s_492_507 <=s (const 64 ((2**20))),
    u_492_507 + v_492_507 <=s (const 64 (2**20)),
    u_492_507 - v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 + v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 - v_492_507 <=s (const 64 (2**20)),
    r_492_507 + s_492_507 <=s (const 64 (2**20)),
    r_492_507 - s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 + s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 - s_492_507 <=s (const 64 (2**20)),
    u_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_492_507 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step507

// premise a
assume
neg_g_472_low60_20_low20_15 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_16 neg_f_472_low60_20_low20_15;
mov u_492_508 u_492_507;
mov v_492_508 v_492_507;

asr neg_g_472_low60_20_low20_16 neg_g_472_low60_20_low20_15 1;
asr r_492_508 r_492_507 1;
asr s_492_508 s_492_507 1;
assert
    true
&&
    neg_f_472_low60_20_low20_16 = neg_f_472_low60_20_low20_15,
    u_492_508 = u_492_507,
    v_492_508 = v_492_507,
    neg_g_472_low60_20_low20_16 * (const 64 2) = neg_g_472_low60_20_low20_15,
    r_492_508 * (const 64 2) = r_492_507,
    s_492_508 * (const 64 2) = s_492_507
;

assume
    neg_f_472_low60_20_low20_16 = neg_f_472_low60_20_low20_15,
    u_492_508 = u_492_507,
    v_492_508 = v_492_507,
    neg_g_472_low60_20_low20_16 * 2 = neg_g_472_low60_20_low20_15,
    r_492_508 * 2 = r_492_507,
    s_492_508 * 2 = s_492_507
&&
    true
;

{
    u_492_508 * neg_f_472_low60_20_low20_0 + v_492_508 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_508 * neg_f_472_low60_20_low20_0 + s_492_508 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_16 + u_492_508 * (const 64 (2**21)) + v_492_508 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_16 + r_492_508 * (const 64 (2**21)) + s_492_508 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_16,
    neg_f_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_16,
    neg_g_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 508)) <=s delta, delta <=s (const 64 (1 + 2*508)),
    (const 64 (-(2**20))) <=s u_492_508, u_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_508, v_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_508, r_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_508, s_492_508 <=s (const 64 ((2**20))),
    u_492_508 + v_492_508 <=s (const 64 (2**20)),
    u_492_508 - v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 + v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 - v_492_508 <=s (const 64 (2**20)),
    r_492_508 + s_492_508 <=s (const 64 (2**20)),
    r_492_508 - s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 + s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 - s_492_508 <=s (const 64 (2**20)),
    u_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_492_508 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_507_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_15,
sint64 neg_g_472_low60_20_low20_15,
sint64 neg_f_472_low60_20_low20_16,
sint64 neg_g_472_low60_20_low20_16,
sint64 u_492_507,
sint64 v_492_507,
sint64 r_492_507,
sint64 s_492_507,
sint64 u_492_508,
sint64 v_492_508,
sint64 r_492_508,
sint64 s_492_508,
bit ne
)={
    u_492_507 * neg_f_472_low60_20_low20_0 + v_492_507 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_15 * (-(2**20)),
    r_492_507 * neg_f_472_low60_20_low20_0 + s_492_507 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_15 * (-(2**20))
&&
    u_492_507 * neg_f_472_low60_20_low20_0 + v_492_507 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_15 * (const 64 (-(2**20))),
    r_492_507 * neg_f_472_low60_20_low20_0 + s_492_507 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_15 + u_492_507 * (const 64 (2**21)) + v_492_507 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_15 + r_492_507 * (const 64 (2**21)) + s_492_507 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_15,
    neg_f_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_15,
    neg_g_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 507)) <=s delta, delta <=s (const 64 (1 + 2*507)),
    (const 64 (-(2**20))) <=s u_492_507, u_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_507, v_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_507, r_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_507, s_492_507 <=s (const 64 ((2**20))),
    u_492_507 + v_492_507 <=s (const 64 (2**20)),
    u_492_507 - v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 + v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 - v_492_507 <=s (const 64 (2**20)),
    r_492_507 + s_492_507 <=s (const 64 (2**20)),
    r_492_507 - s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 + s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 - s_492_507 <=s (const 64 (2**20)),
    u_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_492_507 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step507

// premise b
assume
neg_g_472_low60_20_low20_15 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_16 neg_f_472_low60_20_low20_15;
mov u_492_508 u_492_507;
mov v_492_508 v_492_507;

add neg_g_472_low60_20_low20_16 neg_g_472_low60_20_low20_15 neg_f_472_low60_20_low20_15;
asr neg_g_472_low60_20_low20_16 neg_g_472_low60_20_low20_16 1;
add r_492_508 r_492_507 u_492_507;
asr r_492_508 r_492_508 1;
add s_492_508 s_492_507 v_492_507;
asr s_492_508 s_492_508 1;
assert
    true
&&
    neg_f_472_low60_20_low20_16 = neg_f_472_low60_20_low20_15,
    u_492_508 = u_492_507,
    v_492_508 = v_492_507,
    neg_g_472_low60_20_low20_16 * (const 64 2) = neg_g_472_low60_20_low20_15 + neg_f_472_low60_20_low20_15,
    r_492_508 * (const 64 2) = r_492_507 + u_492_507,
    s_492_508 * (const 64 2) = s_492_507 + v_492_507
;

assume
    neg_f_472_low60_20_low20_16 = neg_f_472_low60_20_low20_15,
    u_492_508 = u_492_507,
    v_492_508 = v_492_507,
    neg_g_472_low60_20_low20_16 * 2 = neg_g_472_low60_20_low20_15 + neg_f_472_low60_20_low20_15,
    r_492_508 * 2 = r_492_507 + u_492_507,
    s_492_508 * 2 = s_492_507 + v_492_507
&&
    true
;

{
    u_492_508 * neg_f_472_low60_20_low20_0 + v_492_508 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_508 * neg_f_472_low60_20_low20_0 + s_492_508 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_16 + u_492_508 * (const 64 (2**21)) + v_492_508 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_16 + r_492_508 * (const 64 (2**21)) + s_492_508 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_16,
    neg_f_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_16,
    neg_g_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 508)) <=s delta, delta <=s (const 64 (1 + 2*508)),
    (const 64 (-(2**20))) <=s u_492_508, u_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_508, v_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_508, r_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_508, s_492_508 <=s (const 64 ((2**20))),
    u_492_508 + v_492_508 <=s (const 64 (2**20)),
    u_492_508 - v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 + v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 - v_492_508 <=s (const 64 (2**20)),
    r_492_508 + s_492_508 <=s (const 64 (2**20)),
    r_492_508 - s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 + s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 - s_492_508 <=s (const 64 (2**20)),
    u_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_492_508 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_507_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_15,
sint64 neg_g_472_low60_20_low20_15,
sint64 neg_f_472_low60_20_low20_16,
sint64 neg_g_472_low60_20_low20_16,
sint64 u_492_507,
sint64 v_492_507,
sint64 r_492_507,
sint64 s_492_507,
sint64 u_492_508,
sint64 v_492_508,
sint64 r_492_508,
sint64 s_492_508,
bit ne
)={
    u_492_507 * neg_f_472_low60_20_low20_0 + v_492_507 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_15 * (-(2**20)),
    r_492_507 * neg_f_472_low60_20_low20_0 + s_492_507 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_15 * (-(2**20))
&&
    u_492_507 * neg_f_472_low60_20_low20_0 + v_492_507 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_15 * (const 64 (-(2**20))),
    r_492_507 * neg_f_472_low60_20_low20_0 + s_492_507 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_15 + u_492_507 * (const 64 (2**21)) + v_492_507 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_15 + r_492_507 * (const 64 (2**21)) + s_492_507 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_15,
    neg_f_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_15,
    neg_g_472_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 507)) <=s delta, delta <=s (const 64 (1 + 2*507)),
    (const 64 (-(2**20))) <=s u_492_507, u_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_507, v_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_507, r_492_507 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_507, s_492_507 <=s (const 64 ((2**20))),
    u_492_507 + v_492_507 <=s (const 64 (2**20)),
    u_492_507 - v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 + v_492_507 <=s (const 64 (2**20)),
    (const 64 0) - u_492_507 - v_492_507 <=s (const 64 (2**20)),
    r_492_507 + s_492_507 <=s (const 64 (2**20)),
    r_492_507 - s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 + s_492_507 <=s (const 64 (2**20)),
    (const 64 0) - r_492_507 - s_492_507 <=s (const 64 (2**20)),
    u_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_492_507 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_492_507 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step507

// premise c
assume
neg_g_472_low60_20_low20_15 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_16 neg_g_472_low60_20_low20_15;
mov u_492_508 r_492_507;
mov v_492_508 s_492_507;

subs dc neg_g_472_low60_20_low20_16 neg_g_472_low60_20_low20_15 neg_f_472_low60_20_low20_15;
asr neg_g_472_low60_20_low20_16 neg_g_472_low60_20_low20_16 1;
subs dc r_492_508 r_492_507 u_492_507;
asr r_492_508 r_492_508 1;
subs dc s_492_508 s_492_507 v_492_507;
asr s_492_508 s_492_508 1;
assert
    true
&&
    neg_f_472_low60_20_low20_16 = neg_g_472_low60_20_low20_15,
    u_492_508 = r_492_507,
    v_492_508 = s_492_507,
    neg_g_472_low60_20_low20_16 * (const 64 2) = neg_g_472_low60_20_low20_15 - neg_f_472_low60_20_low20_15,
    r_492_508 * (const 64 2) = r_492_507 - u_492_507,
    s_492_508 * (const 64 2) = s_492_507 - v_492_507
;

assume
    neg_f_472_low60_20_low20_16 = neg_g_472_low60_20_low20_15,
    u_492_508 = r_492_507,
    v_492_508 = s_492_507,
    neg_g_472_low60_20_low20_16 * 2 = neg_g_472_low60_20_low20_15 - neg_f_472_low60_20_low20_15,
    r_492_508 * 2 = r_492_507 - u_492_507,
    s_492_508 * 2 = s_492_507 - v_492_507
&&
    true
;

{
    u_492_508 * neg_f_472_low60_20_low20_0 + v_492_508 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_508 * neg_f_472_low60_20_low20_0 + s_492_508 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_16 + u_492_508 * (const 64 (2**21)) + v_492_508 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_16 + r_492_508 * (const 64 (2**21)) + s_492_508 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_16,
    neg_f_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_16,
    neg_g_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 508)) <=s delta, delta <=s (const 64 (1 + 2*508)),
    (const 64 (-(2**20))) <=s u_492_508, u_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_508, v_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_508, r_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_508, s_492_508 <=s (const 64 ((2**20))),
    u_492_508 + v_492_508 <=s (const 64 (2**20)),
    u_492_508 - v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 + v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 - v_492_508 <=s (const 64 (2**20)),
    r_492_508 + s_492_508 <=s (const 64 (2**20)),
    r_492_508 - s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 + s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 - s_492_508 <=s (const 64 (2**20)),
    u_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_492_508 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_508_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_16,
sint64 neg_g_472_low60_20_low20_16,
sint64 neg_f_472_low60_20_low20_17,
sint64 neg_g_472_low60_20_low20_17,
sint64 u_492_508,
sint64 v_492_508,
sint64 r_492_508,
sint64 s_492_508,
sint64 u_492_509,
sint64 v_492_509,
sint64 r_492_509,
sint64 s_492_509,
bit ne
)={
    u_492_508 * neg_f_472_low60_20_low20_0 + v_492_508 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_16 * (-(2**20)),
    r_492_508 * neg_f_472_low60_20_low20_0 + s_492_508 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_16 * (-(2**20))
&&
    u_492_508 * neg_f_472_low60_20_low20_0 + v_492_508 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_16 * (const 64 (-(2**20))),
    r_492_508 * neg_f_472_low60_20_low20_0 + s_492_508 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_16 + u_492_508 * (const 64 (2**21)) + v_492_508 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_16 + r_492_508 * (const 64 (2**21)) + s_492_508 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_16,
    neg_f_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_16,
    neg_g_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 508)) <=s delta, delta <=s (const 64 (1 + 2*508)),
    (const 64 (-(2**20))) <=s u_492_508, u_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_508, v_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_508, r_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_508, s_492_508 <=s (const 64 ((2**20))),
    u_492_508 + v_492_508 <=s (const 64 (2**20)),
    u_492_508 - v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 + v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 - v_492_508 <=s (const 64 (2**20)),
    r_492_508 + s_492_508 <=s (const 64 (2**20)),
    r_492_508 - s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 + s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 - s_492_508 <=s (const 64 (2**20)),
    u_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_492_508 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step508

// premise a
assume
neg_g_472_low60_20_low20_16 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_17 neg_f_472_low60_20_low20_16;
mov u_492_509 u_492_508;
mov v_492_509 v_492_508;

asr neg_g_472_low60_20_low20_17 neg_g_472_low60_20_low20_16 1;
asr r_492_509 r_492_508 1;
asr s_492_509 s_492_508 1;
assert
    true
&&
    neg_f_472_low60_20_low20_17 = neg_f_472_low60_20_low20_16,
    u_492_509 = u_492_508,
    v_492_509 = v_492_508,
    neg_g_472_low60_20_low20_17 * (const 64 2) = neg_g_472_low60_20_low20_16,
    r_492_509 * (const 64 2) = r_492_508,
    s_492_509 * (const 64 2) = s_492_508
;

assume
    neg_f_472_low60_20_low20_17 = neg_f_472_low60_20_low20_16,
    u_492_509 = u_492_508,
    v_492_509 = v_492_508,
    neg_g_472_low60_20_low20_17 * 2 = neg_g_472_low60_20_low20_16,
    r_492_509 * 2 = r_492_508,
    s_492_509 * 2 = s_492_508
&&
    true
;

{
    u_492_509 * neg_f_472_low60_20_low20_0 + v_492_509 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_509 * neg_f_472_low60_20_low20_0 + s_492_509 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_17 + u_492_509 * (const 64 (2**21)) + v_492_509 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_17 + r_492_509 * (const 64 (2**21)) + s_492_509 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_17,
    neg_f_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_17,
    neg_g_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 509)) <=s delta, delta <=s (const 64 (1 + 2*509)),
    (const 64 (-(2**20))) <=s u_492_509, u_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_509, v_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_509, r_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_509, s_492_509 <=s (const 64 ((2**20))),
    u_492_509 + v_492_509 <=s (const 64 (2**20)),
    u_492_509 - v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 + v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 - v_492_509 <=s (const 64 (2**20)),
    r_492_509 + s_492_509 <=s (const 64 (2**20)),
    r_492_509 - s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 + s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 - s_492_509 <=s (const 64 (2**20)),
    u_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_492_509 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_508_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_16,
sint64 neg_g_472_low60_20_low20_16,
sint64 neg_f_472_low60_20_low20_17,
sint64 neg_g_472_low60_20_low20_17,
sint64 u_492_508,
sint64 v_492_508,
sint64 r_492_508,
sint64 s_492_508,
sint64 u_492_509,
sint64 v_492_509,
sint64 r_492_509,
sint64 s_492_509,
bit ne
)={
    u_492_508 * neg_f_472_low60_20_low20_0 + v_492_508 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_16 * (-(2**20)),
    r_492_508 * neg_f_472_low60_20_low20_0 + s_492_508 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_16 * (-(2**20))
&&
    u_492_508 * neg_f_472_low60_20_low20_0 + v_492_508 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_16 * (const 64 (-(2**20))),
    r_492_508 * neg_f_472_low60_20_low20_0 + s_492_508 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_16 + u_492_508 * (const 64 (2**21)) + v_492_508 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_16 + r_492_508 * (const 64 (2**21)) + s_492_508 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_16,
    neg_f_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_16,
    neg_g_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 508)) <=s delta, delta <=s (const 64 (1 + 2*508)),
    (const 64 (-(2**20))) <=s u_492_508, u_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_508, v_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_508, r_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_508, s_492_508 <=s (const 64 ((2**20))),
    u_492_508 + v_492_508 <=s (const 64 (2**20)),
    u_492_508 - v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 + v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 - v_492_508 <=s (const 64 (2**20)),
    r_492_508 + s_492_508 <=s (const 64 (2**20)),
    r_492_508 - s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 + s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 - s_492_508 <=s (const 64 (2**20)),
    u_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_492_508 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step508

// premise b
assume
neg_g_472_low60_20_low20_16 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_17 neg_f_472_low60_20_low20_16;
mov u_492_509 u_492_508;
mov v_492_509 v_492_508;

add neg_g_472_low60_20_low20_17 neg_g_472_low60_20_low20_16 neg_f_472_low60_20_low20_16;
asr neg_g_472_low60_20_low20_17 neg_g_472_low60_20_low20_17 1;
add r_492_509 r_492_508 u_492_508;
asr r_492_509 r_492_509 1;
add s_492_509 s_492_508 v_492_508;
asr s_492_509 s_492_509 1;
assert
    true
&&
    neg_f_472_low60_20_low20_17 = neg_f_472_low60_20_low20_16,
    u_492_509 = u_492_508,
    v_492_509 = v_492_508,
    neg_g_472_low60_20_low20_17 * (const 64 2) = neg_g_472_low60_20_low20_16 + neg_f_472_low60_20_low20_16,
    r_492_509 * (const 64 2) = r_492_508 + u_492_508,
    s_492_509 * (const 64 2) = s_492_508 + v_492_508
;

assume
    neg_f_472_low60_20_low20_17 = neg_f_472_low60_20_low20_16,
    u_492_509 = u_492_508,
    v_492_509 = v_492_508,
    neg_g_472_low60_20_low20_17 * 2 = neg_g_472_low60_20_low20_16 + neg_f_472_low60_20_low20_16,
    r_492_509 * 2 = r_492_508 + u_492_508,
    s_492_509 * 2 = s_492_508 + v_492_508
&&
    true
;

{
    u_492_509 * neg_f_472_low60_20_low20_0 + v_492_509 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_509 * neg_f_472_low60_20_low20_0 + s_492_509 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_17 + u_492_509 * (const 64 (2**21)) + v_492_509 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_17 + r_492_509 * (const 64 (2**21)) + s_492_509 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_17,
    neg_f_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_17,
    neg_g_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 509)) <=s delta, delta <=s (const 64 (1 + 2*509)),
    (const 64 (-(2**20))) <=s u_492_509, u_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_509, v_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_509, r_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_509, s_492_509 <=s (const 64 ((2**20))),
    u_492_509 + v_492_509 <=s (const 64 (2**20)),
    u_492_509 - v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 + v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 - v_492_509 <=s (const 64 (2**20)),
    r_492_509 + s_492_509 <=s (const 64 (2**20)),
    r_492_509 - s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 + s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 - s_492_509 <=s (const 64 (2**20)),
    u_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_492_509 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_508_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_16,
sint64 neg_g_472_low60_20_low20_16,
sint64 neg_f_472_low60_20_low20_17,
sint64 neg_g_472_low60_20_low20_17,
sint64 u_492_508,
sint64 v_492_508,
sint64 r_492_508,
sint64 s_492_508,
sint64 u_492_509,
sint64 v_492_509,
sint64 r_492_509,
sint64 s_492_509,
bit ne
)={
    u_492_508 * neg_f_472_low60_20_low20_0 + v_492_508 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_16 * (-(2**20)),
    r_492_508 * neg_f_472_low60_20_low20_0 + s_492_508 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_16 * (-(2**20))
&&
    u_492_508 * neg_f_472_low60_20_low20_0 + v_492_508 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_16 * (const 64 (-(2**20))),
    r_492_508 * neg_f_472_low60_20_low20_0 + s_492_508 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_16 + u_492_508 * (const 64 (2**21)) + v_492_508 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_16 + r_492_508 * (const 64 (2**21)) + s_492_508 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_16,
    neg_f_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_16,
    neg_g_472_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 508)) <=s delta, delta <=s (const 64 (1 + 2*508)),
    (const 64 (-(2**20))) <=s u_492_508, u_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_508, v_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_508, r_492_508 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_508, s_492_508 <=s (const 64 ((2**20))),
    u_492_508 + v_492_508 <=s (const 64 (2**20)),
    u_492_508 - v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 + v_492_508 <=s (const 64 (2**20)),
    (const 64 0) - u_492_508 - v_492_508 <=s (const 64 (2**20)),
    r_492_508 + s_492_508 <=s (const 64 (2**20)),
    r_492_508 - s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 + s_492_508 <=s (const 64 (2**20)),
    (const 64 0) - r_492_508 - s_492_508 <=s (const 64 (2**20)),
    u_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_492_508 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_492_508 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step508

// premise c
assume
neg_g_472_low60_20_low20_16 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_17 neg_g_472_low60_20_low20_16;
mov u_492_509 r_492_508;
mov v_492_509 s_492_508;

subs dc neg_g_472_low60_20_low20_17 neg_g_472_low60_20_low20_16 neg_f_472_low60_20_low20_16;
asr neg_g_472_low60_20_low20_17 neg_g_472_low60_20_low20_17 1;
subs dc r_492_509 r_492_508 u_492_508;
asr r_492_509 r_492_509 1;
subs dc s_492_509 s_492_508 v_492_508;
asr s_492_509 s_492_509 1;
assert
    true
&&
    neg_f_472_low60_20_low20_17 = neg_g_472_low60_20_low20_16,
    u_492_509 = r_492_508,
    v_492_509 = s_492_508,
    neg_g_472_low60_20_low20_17 * (const 64 2) = neg_g_472_low60_20_low20_16 - neg_f_472_low60_20_low20_16,
    r_492_509 * (const 64 2) = r_492_508 - u_492_508,
    s_492_509 * (const 64 2) = s_492_508 - v_492_508
;

assume
    neg_f_472_low60_20_low20_17 = neg_g_472_low60_20_low20_16,
    u_492_509 = r_492_508,
    v_492_509 = s_492_508,
    neg_g_472_low60_20_low20_17 * 2 = neg_g_472_low60_20_low20_16 - neg_f_472_low60_20_low20_16,
    r_492_509 * 2 = r_492_508 - u_492_508,
    s_492_509 * 2 = s_492_508 - v_492_508
&&
    true
;

{
    u_492_509 * neg_f_472_low60_20_low20_0 + v_492_509 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_509 * neg_f_472_low60_20_low20_0 + s_492_509 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_17 + u_492_509 * (const 64 (2**21)) + v_492_509 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_17 + r_492_509 * (const 64 (2**21)) + s_492_509 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_17,
    neg_f_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_17,
    neg_g_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 509)) <=s delta, delta <=s (const 64 (1 + 2*509)),
    (const 64 (-(2**20))) <=s u_492_509, u_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_509, v_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_509, r_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_509, s_492_509 <=s (const 64 ((2**20))),
    u_492_509 + v_492_509 <=s (const 64 (2**20)),
    u_492_509 - v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 + v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 - v_492_509 <=s (const 64 (2**20)),
    r_492_509 + s_492_509 <=s (const 64 (2**20)),
    r_492_509 - s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 + s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 - s_492_509 <=s (const 64 (2**20)),
    u_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_492_509 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_509_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_17,
sint64 neg_g_472_low60_20_low20_17,
sint64 neg_f_472_low60_20_low20_18,
sint64 neg_g_472_low60_20_low20_18,
sint64 u_492_509,
sint64 v_492_509,
sint64 r_492_509,
sint64 s_492_509,
sint64 u_492_510,
sint64 v_492_510,
sint64 r_492_510,
sint64 s_492_510,
bit ne
)={
    u_492_509 * neg_f_472_low60_20_low20_0 + v_492_509 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_17 * (-(2**20)),
    r_492_509 * neg_f_472_low60_20_low20_0 + s_492_509 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_17 * (-(2**20))
&&
    u_492_509 * neg_f_472_low60_20_low20_0 + v_492_509 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_17 * (const 64 (-(2**20))),
    r_492_509 * neg_f_472_low60_20_low20_0 + s_492_509 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_17 + u_492_509 * (const 64 (2**21)) + v_492_509 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_17 + r_492_509 * (const 64 (2**21)) + s_492_509 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_17,
    neg_f_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_17,
    neg_g_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 509)) <=s delta, delta <=s (const 64 (1 + 2*509)),
    (const 64 (-(2**20))) <=s u_492_509, u_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_509, v_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_509, r_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_509, s_492_509 <=s (const 64 ((2**20))),
    u_492_509 + v_492_509 <=s (const 64 (2**20)),
    u_492_509 - v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 + v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 - v_492_509 <=s (const 64 (2**20)),
    r_492_509 + s_492_509 <=s (const 64 (2**20)),
    r_492_509 - s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 + s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 - s_492_509 <=s (const 64 (2**20)),
    u_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_492_509 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step509

// premise a
assume
neg_g_472_low60_20_low20_17 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_18 neg_f_472_low60_20_low20_17;
mov u_492_510 u_492_509;
mov v_492_510 v_492_509;

asr neg_g_472_low60_20_low20_18 neg_g_472_low60_20_low20_17 1;
asr r_492_510 r_492_509 1;
asr s_492_510 s_492_509 1;
assert
    true
&&
    neg_f_472_low60_20_low20_18 = neg_f_472_low60_20_low20_17,
    u_492_510 = u_492_509,
    v_492_510 = v_492_509,
    neg_g_472_low60_20_low20_18 * (const 64 2) = neg_g_472_low60_20_low20_17,
    r_492_510 * (const 64 2) = r_492_509,
    s_492_510 * (const 64 2) = s_492_509
;

assume
    neg_f_472_low60_20_low20_18 = neg_f_472_low60_20_low20_17,
    u_492_510 = u_492_509,
    v_492_510 = v_492_509,
    neg_g_472_low60_20_low20_18 * 2 = neg_g_472_low60_20_low20_17,
    r_492_510 * 2 = r_492_509,
    s_492_510 * 2 = s_492_509
&&
    true
;

{
    u_492_510 * neg_f_472_low60_20_low20_0 + v_492_510 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_510 * neg_f_472_low60_20_low20_0 + s_492_510 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_18 + u_492_510 * (const 64 (2**21)) + v_492_510 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_18 + r_492_510 * (const 64 (2**21)) + s_492_510 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_18,
    neg_f_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_18,
    neg_g_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 510)) <=s delta, delta <=s (const 64 (1 + 2*510)),
    (const 64 (-(2**20))) <=s u_492_510, u_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_510, v_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_510, r_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_510, s_492_510 <=s (const 64 ((2**20))),
    u_492_510 + v_492_510 <=s (const 64 (2**20)),
    u_492_510 - v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 + v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 - v_492_510 <=s (const 64 (2**20)),
    r_492_510 + s_492_510 <=s (const 64 (2**20)),
    r_492_510 - s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 + s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 - s_492_510 <=s (const 64 (2**20)),
    u_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_492_510 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_509_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_17,
sint64 neg_g_472_low60_20_low20_17,
sint64 neg_f_472_low60_20_low20_18,
sint64 neg_g_472_low60_20_low20_18,
sint64 u_492_509,
sint64 v_492_509,
sint64 r_492_509,
sint64 s_492_509,
sint64 u_492_510,
sint64 v_492_510,
sint64 r_492_510,
sint64 s_492_510,
bit ne
)={
    u_492_509 * neg_f_472_low60_20_low20_0 + v_492_509 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_17 * (-(2**20)),
    r_492_509 * neg_f_472_low60_20_low20_0 + s_492_509 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_17 * (-(2**20))
&&
    u_492_509 * neg_f_472_low60_20_low20_0 + v_492_509 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_17 * (const 64 (-(2**20))),
    r_492_509 * neg_f_472_low60_20_low20_0 + s_492_509 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_17 + u_492_509 * (const 64 (2**21)) + v_492_509 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_17 + r_492_509 * (const 64 (2**21)) + s_492_509 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_17,
    neg_f_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_17,
    neg_g_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 509)) <=s delta, delta <=s (const 64 (1 + 2*509)),
    (const 64 (-(2**20))) <=s u_492_509, u_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_509, v_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_509, r_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_509, s_492_509 <=s (const 64 ((2**20))),
    u_492_509 + v_492_509 <=s (const 64 (2**20)),
    u_492_509 - v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 + v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 - v_492_509 <=s (const 64 (2**20)),
    r_492_509 + s_492_509 <=s (const 64 (2**20)),
    r_492_509 - s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 + s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 - s_492_509 <=s (const 64 (2**20)),
    u_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_492_509 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step509

// premise b
assume
neg_g_472_low60_20_low20_17 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_18 neg_f_472_low60_20_low20_17;
mov u_492_510 u_492_509;
mov v_492_510 v_492_509;

add neg_g_472_low60_20_low20_18 neg_g_472_low60_20_low20_17 neg_f_472_low60_20_low20_17;
asr neg_g_472_low60_20_low20_18 neg_g_472_low60_20_low20_18 1;
add r_492_510 r_492_509 u_492_509;
asr r_492_510 r_492_510 1;
add s_492_510 s_492_509 v_492_509;
asr s_492_510 s_492_510 1;
assert
    true
&&
    neg_f_472_low60_20_low20_18 = neg_f_472_low60_20_low20_17,
    u_492_510 = u_492_509,
    v_492_510 = v_492_509,
    neg_g_472_low60_20_low20_18 * (const 64 2) = neg_g_472_low60_20_low20_17 + neg_f_472_low60_20_low20_17,
    r_492_510 * (const 64 2) = r_492_509 + u_492_509,
    s_492_510 * (const 64 2) = s_492_509 + v_492_509
;

assume
    neg_f_472_low60_20_low20_18 = neg_f_472_low60_20_low20_17,
    u_492_510 = u_492_509,
    v_492_510 = v_492_509,
    neg_g_472_low60_20_low20_18 * 2 = neg_g_472_low60_20_low20_17 + neg_f_472_low60_20_low20_17,
    r_492_510 * 2 = r_492_509 + u_492_509,
    s_492_510 * 2 = s_492_509 + v_492_509
&&
    true
;

{
    u_492_510 * neg_f_472_low60_20_low20_0 + v_492_510 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_510 * neg_f_472_low60_20_low20_0 + s_492_510 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_18 + u_492_510 * (const 64 (2**21)) + v_492_510 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_18 + r_492_510 * (const 64 (2**21)) + s_492_510 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_18,
    neg_f_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_18,
    neg_g_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 510)) <=s delta, delta <=s (const 64 (1 + 2*510)),
    (const 64 (-(2**20))) <=s u_492_510, u_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_510, v_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_510, r_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_510, s_492_510 <=s (const 64 ((2**20))),
    u_492_510 + v_492_510 <=s (const 64 (2**20)),
    u_492_510 - v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 + v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 - v_492_510 <=s (const 64 (2**20)),
    r_492_510 + s_492_510 <=s (const 64 (2**20)),
    r_492_510 - s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 + s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 - s_492_510 <=s (const 64 (2**20)),
    u_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_492_510 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_509_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_17,
sint64 neg_g_472_low60_20_low20_17,
sint64 neg_f_472_low60_20_low20_18,
sint64 neg_g_472_low60_20_low20_18,
sint64 u_492_509,
sint64 v_492_509,
sint64 r_492_509,
sint64 s_492_509,
sint64 u_492_510,
sint64 v_492_510,
sint64 r_492_510,
sint64 s_492_510,
bit ne
)={
    u_492_509 * neg_f_472_low60_20_low20_0 + v_492_509 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_17 * (-(2**20)),
    r_492_509 * neg_f_472_low60_20_low20_0 + s_492_509 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_17 * (-(2**20))
&&
    u_492_509 * neg_f_472_low60_20_low20_0 + v_492_509 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_17 * (const 64 (-(2**20))),
    r_492_509 * neg_f_472_low60_20_low20_0 + s_492_509 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_17 + u_492_509 * (const 64 (2**21)) + v_492_509 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_17 + r_492_509 * (const 64 (2**21)) + s_492_509 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_17,
    neg_f_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_17,
    neg_g_472_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 509)) <=s delta, delta <=s (const 64 (1 + 2*509)),
    (const 64 (-(2**20))) <=s u_492_509, u_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_509, v_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_509, r_492_509 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_509, s_492_509 <=s (const 64 ((2**20))),
    u_492_509 + v_492_509 <=s (const 64 (2**20)),
    u_492_509 - v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 + v_492_509 <=s (const 64 (2**20)),
    (const 64 0) - u_492_509 - v_492_509 <=s (const 64 (2**20)),
    r_492_509 + s_492_509 <=s (const 64 (2**20)),
    r_492_509 - s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 + s_492_509 <=s (const 64 (2**20)),
    (const 64 0) - r_492_509 - s_492_509 <=s (const 64 (2**20)),
    u_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_492_509 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_492_509 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step509

// premise c
assume
neg_g_472_low60_20_low20_17 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_18 neg_g_472_low60_20_low20_17;
mov u_492_510 r_492_509;
mov v_492_510 s_492_509;

subs dc neg_g_472_low60_20_low20_18 neg_g_472_low60_20_low20_17 neg_f_472_low60_20_low20_17;
asr neg_g_472_low60_20_low20_18 neg_g_472_low60_20_low20_18 1;
subs dc r_492_510 r_492_509 u_492_509;
asr r_492_510 r_492_510 1;
subs dc s_492_510 s_492_509 v_492_509;
asr s_492_510 s_492_510 1;
assert
    true
&&
    neg_f_472_low60_20_low20_18 = neg_g_472_low60_20_low20_17,
    u_492_510 = r_492_509,
    v_492_510 = s_492_509,
    neg_g_472_low60_20_low20_18 * (const 64 2) = neg_g_472_low60_20_low20_17 - neg_f_472_low60_20_low20_17,
    r_492_510 * (const 64 2) = r_492_509 - u_492_509,
    s_492_510 * (const 64 2) = s_492_509 - v_492_509
;

assume
    neg_f_472_low60_20_low20_18 = neg_g_472_low60_20_low20_17,
    u_492_510 = r_492_509,
    v_492_510 = s_492_509,
    neg_g_472_low60_20_low20_18 * 2 = neg_g_472_low60_20_low20_17 - neg_f_472_low60_20_low20_17,
    r_492_510 * 2 = r_492_509 - u_492_509,
    s_492_510 * 2 = s_492_509 - v_492_509
&&
    true
;

{
    u_492_510 * neg_f_472_low60_20_low20_0 + v_492_510 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_510 * neg_f_472_low60_20_low20_0 + s_492_510 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_18 + u_492_510 * (const 64 (2**21)) + v_492_510 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_18 + r_492_510 * (const 64 (2**21)) + s_492_510 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_18,
    neg_f_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_18,
    neg_g_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 510)) <=s delta, delta <=s (const 64 (1 + 2*510)),
    (const 64 (-(2**20))) <=s u_492_510, u_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_510, v_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_510, r_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_510, s_492_510 <=s (const 64 ((2**20))),
    u_492_510 + v_492_510 <=s (const 64 (2**20)),
    u_492_510 - v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 + v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 - v_492_510 <=s (const 64 (2**20)),
    r_492_510 + s_492_510 <=s (const 64 (2**20)),
    r_492_510 - s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 + s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 - s_492_510 <=s (const 64 (2**20)),
    u_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_492_510 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_510_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_18,
sint64 neg_g_472_low60_20_low20_18,
sint64 neg_f_472_low60_20_low20_19,
sint64 neg_g_472_low60_20_low20_19,
sint64 u_492_510,
sint64 v_492_510,
sint64 r_492_510,
sint64 s_492_510,
sint64 u_492_511,
sint64 v_492_511,
sint64 r_492_511,
sint64 s_492_511,
bit ne
)={
    u_492_510 * neg_f_472_low60_20_low20_0 + v_492_510 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_18 * (-(2**20)),
    r_492_510 * neg_f_472_low60_20_low20_0 + s_492_510 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_18 * (-(2**20))
&&
    u_492_510 * neg_f_472_low60_20_low20_0 + v_492_510 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_18 * (const 64 (-(2**20))),
    r_492_510 * neg_f_472_low60_20_low20_0 + s_492_510 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_18 + u_492_510 * (const 64 (2**21)) + v_492_510 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_18 + r_492_510 * (const 64 (2**21)) + s_492_510 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_18,
    neg_f_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_18,
    neg_g_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 510)) <=s delta, delta <=s (const 64 (1 + 2*510)),
    (const 64 (-(2**20))) <=s u_492_510, u_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_510, v_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_510, r_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_510, s_492_510 <=s (const 64 ((2**20))),
    u_492_510 + v_492_510 <=s (const 64 (2**20)),
    u_492_510 - v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 + v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 - v_492_510 <=s (const 64 (2**20)),
    r_492_510 + s_492_510 <=s (const 64 (2**20)),
    r_492_510 - s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 + s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 - s_492_510 <=s (const 64 (2**20)),
    u_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_492_510 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step510

// premise a
assume
neg_g_472_low60_20_low20_18 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_472_low60_20_low20_19 neg_f_472_low60_20_low20_18;
mov u_492_511 u_492_510;
mov v_492_511 v_492_510;

asr neg_g_472_low60_20_low20_19 neg_g_472_low60_20_low20_18 1;
asr r_492_511 r_492_510 1;
asr s_492_511 s_492_510 1;
assert
    true
&&
    neg_f_472_low60_20_low20_19 = neg_f_472_low60_20_low20_18,
    u_492_511 = u_492_510,
    v_492_511 = v_492_510,
    neg_g_472_low60_20_low20_19 * (const 64 2) = neg_g_472_low60_20_low20_18,
    r_492_511 * (const 64 2) = r_492_510,
    s_492_511 * (const 64 2) = s_492_510
;

assume
    neg_f_472_low60_20_low20_19 = neg_f_472_low60_20_low20_18,
    u_492_511 = u_492_510,
    v_492_511 = v_492_510,
    neg_g_472_low60_20_low20_19 * 2 = neg_g_472_low60_20_low20_18,
    r_492_511 * 2 = r_492_510,
    s_492_511 * 2 = s_492_510
&&
    true
;

{
    u_492_511 * neg_f_472_low60_20_low20_0 + v_492_511 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_511 * neg_f_472_low60_20_low20_0 + s_492_511 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_19 + u_492_511 * (const 64 (2**21)) + v_492_511 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_19 + r_492_511 * (const 64 (2**21)) + s_492_511 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_19,
    neg_f_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_19,
    neg_g_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 511)) <=s delta, delta <=s (const 64 (1 + 2*511)),
    (const 64 (-(2**20))) <=s u_492_511, u_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_511, v_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_511, r_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_511, s_492_511 <=s (const 64 ((2**20))),
    u_492_511 + v_492_511 <=s (const 64 (2**20)),
    u_492_511 - v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 + v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 - v_492_511 <=s (const 64 (2**20)),
    r_492_511 + s_492_511 <=s (const 64 (2**20)),
    r_492_511 - s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 + s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 - s_492_511 <=s (const 64 (2**20)),
    u_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_492_511 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_510_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_18,
sint64 neg_g_472_low60_20_low20_18,
sint64 neg_f_472_low60_20_low20_19,
sint64 neg_g_472_low60_20_low20_19,
sint64 u_492_510,
sint64 v_492_510,
sint64 r_492_510,
sint64 s_492_510,
sint64 u_492_511,
sint64 v_492_511,
sint64 r_492_511,
sint64 s_492_511,
bit ne
)={
    u_492_510 * neg_f_472_low60_20_low20_0 + v_492_510 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_18 * (-(2**20)),
    r_492_510 * neg_f_472_low60_20_low20_0 + s_492_510 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_18 * (-(2**20))
&&
    u_492_510 * neg_f_472_low60_20_low20_0 + v_492_510 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_18 * (const 64 (-(2**20))),
    r_492_510 * neg_f_472_low60_20_low20_0 + s_492_510 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_18 + u_492_510 * (const 64 (2**21)) + v_492_510 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_18 + r_492_510 * (const 64 (2**21)) + s_492_510 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_18,
    neg_f_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_18,
    neg_g_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 510)) <=s delta, delta <=s (const 64 (1 + 2*510)),
    (const 64 (-(2**20))) <=s u_492_510, u_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_510, v_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_510, r_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_510, s_492_510 <=s (const 64 ((2**20))),
    u_492_510 + v_492_510 <=s (const 64 (2**20)),
    u_492_510 - v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 + v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 - v_492_510 <=s (const 64 (2**20)),
    r_492_510 + s_492_510 <=s (const 64 (2**20)),
    r_492_510 - s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 + s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 - s_492_510 <=s (const 64 (2**20)),
    u_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_492_510 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step510

// premise b
assume
neg_g_472_low60_20_low20_18 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_19 neg_f_472_low60_20_low20_18;
mov u_492_511 u_492_510;
mov v_492_511 v_492_510;

add neg_g_472_low60_20_low20_19 neg_g_472_low60_20_low20_18 neg_f_472_low60_20_low20_18;
asr neg_g_472_low60_20_low20_19 neg_g_472_low60_20_low20_19 1;
add r_492_511 r_492_510 u_492_510;
asr r_492_511 r_492_511 1;
add s_492_511 s_492_510 v_492_510;
asr s_492_511 s_492_511 1;
assert
    true
&&
    neg_f_472_low60_20_low20_19 = neg_f_472_low60_20_low20_18,
    u_492_511 = u_492_510,
    v_492_511 = v_492_510,
    neg_g_472_low60_20_low20_19 * (const 64 2) = neg_g_472_low60_20_low20_18 + neg_f_472_low60_20_low20_18,
    r_492_511 * (const 64 2) = r_492_510 + u_492_510,
    s_492_511 * (const 64 2) = s_492_510 + v_492_510
;

assume
    neg_f_472_low60_20_low20_19 = neg_f_472_low60_20_low20_18,
    u_492_511 = u_492_510,
    v_492_511 = v_492_510,
    neg_g_472_low60_20_low20_19 * 2 = neg_g_472_low60_20_low20_18 + neg_f_472_low60_20_low20_18,
    r_492_511 * 2 = r_492_510 + u_492_510,
    s_492_511 * 2 = s_492_510 + v_492_510
&&
    true
;

{
    u_492_511 * neg_f_472_low60_20_low20_0 + v_492_511 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_511 * neg_f_472_low60_20_low20_0 + s_492_511 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_19 + u_492_511 * (const 64 (2**21)) + v_492_511 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_19 + r_492_511 * (const 64 (2**21)) + s_492_511 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_19,
    neg_f_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_19,
    neg_g_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 511)) <=s delta, delta <=s (const 64 (1 + 2*511)),
    (const 64 (-(2**20))) <=s u_492_511, u_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_511, v_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_511, r_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_511, s_492_511 <=s (const 64 ((2**20))),
    u_492_511 + v_492_511 <=s (const 64 (2**20)),
    u_492_511 - v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 + v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 - v_492_511 <=s (const 64 (2**20)),
    r_492_511 + s_492_511 <=s (const 64 (2**20)),
    r_492_511 - s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 + s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 - s_492_511 <=s (const 64 (2**20)),
    u_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_492_511 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_510_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_18,
sint64 neg_g_472_low60_20_low20_18,
sint64 neg_f_472_low60_20_low20_19,
sint64 neg_g_472_low60_20_low20_19,
sint64 u_492_510,
sint64 v_492_510,
sint64 r_492_510,
sint64 s_492_510,
sint64 u_492_511,
sint64 v_492_511,
sint64 r_492_511,
sint64 s_492_511,
bit ne
)={
    u_492_510 * neg_f_472_low60_20_low20_0 + v_492_510 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_18 * (-(2**20)),
    r_492_510 * neg_f_472_low60_20_low20_0 + s_492_510 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_18 * (-(2**20))
&&
    u_492_510 * neg_f_472_low60_20_low20_0 + v_492_510 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_18 * (const 64 (-(2**20))),
    r_492_510 * neg_f_472_low60_20_low20_0 + s_492_510 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_18 + u_492_510 * (const 64 (2**21)) + v_492_510 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_18 + r_492_510 * (const 64 (2**21)) + s_492_510 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_18,
    neg_f_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_18,
    neg_g_472_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 510)) <=s delta, delta <=s (const 64 (1 + 2*510)),
    (const 64 (-(2**20))) <=s u_492_510, u_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_510, v_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_510, r_492_510 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_510, s_492_510 <=s (const 64 ((2**20))),
    u_492_510 + v_492_510 <=s (const 64 (2**20)),
    u_492_510 - v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 + v_492_510 <=s (const 64 (2**20)),
    (const 64 0) - u_492_510 - v_492_510 <=s (const 64 (2**20)),
    r_492_510 + s_492_510 <=s (const 64 (2**20)),
    r_492_510 - s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 + s_492_510 <=s (const 64 (2**20)),
    (const 64 0) - r_492_510 - s_492_510 <=s (const 64 (2**20)),
    u_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_492_510 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_492_510 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step510

// premise c
assume
neg_g_472_low60_20_low20_18 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_19 neg_g_472_low60_20_low20_18;
mov u_492_511 r_492_510;
mov v_492_511 s_492_510;

subs dc neg_g_472_low60_20_low20_19 neg_g_472_low60_20_low20_18 neg_f_472_low60_20_low20_18;
asr neg_g_472_low60_20_low20_19 neg_g_472_low60_20_low20_19 1;
subs dc r_492_511 r_492_510 u_492_510;
asr r_492_511 r_492_511 1;
subs dc s_492_511 s_492_510 v_492_510;
asr s_492_511 s_492_511 1;
assert
    true
&&
    neg_f_472_low60_20_low20_19 = neg_g_472_low60_20_low20_18,
    u_492_511 = r_492_510,
    v_492_511 = s_492_510,
    neg_g_472_low60_20_low20_19 * (const 64 2) = neg_g_472_low60_20_low20_18 - neg_f_472_low60_20_low20_18,
    r_492_511 * (const 64 2) = r_492_510 - u_492_510,
    s_492_511 * (const 64 2) = s_492_510 - v_492_510
;

assume
    neg_f_472_low60_20_low20_19 = neg_g_472_low60_20_low20_18,
    u_492_511 = r_492_510,
    v_492_511 = s_492_510,
    neg_g_472_low60_20_low20_19 * 2 = neg_g_472_low60_20_low20_18 - neg_f_472_low60_20_low20_18,
    r_492_511 * 2 = r_492_510 - u_492_510,
    s_492_511 * 2 = s_492_510 - v_492_510
&&
    true
;

{
    u_492_511 * neg_f_472_low60_20_low20_0 + v_492_511 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_511 * neg_f_472_low60_20_low20_0 + s_492_511 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_19 + u_492_511 * (const 64 (2**21)) + v_492_511 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_19 + r_492_511 * (const 64 (2**21)) + s_492_511 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_19,
    neg_f_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_19,
    neg_g_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 511)) <=s delta, delta <=s (const 64 (1 + 2*511)),
    (const 64 (-(2**20))) <=s u_492_511, u_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_511, v_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_511, r_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_511, s_492_511 <=s (const 64 ((2**20))),
    u_492_511 + v_492_511 <=s (const 64 (2**20)),
    u_492_511 - v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 + v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 - v_492_511 <=s (const 64 (2**20)),
    r_492_511 + s_492_511 <=s (const 64 (2**20)),
    r_492_511 - s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 + s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 - s_492_511 <=s (const 64 (2**20)),
    u_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_492_511 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_511_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_19,
sint64 neg_g_472_low60_20_low20_19,
sint64 neg_f_472_low60_20_low20_20,
sint64 neg_g_472_low60_20_low20_20,
sint64 u_492_511,
sint64 v_492_511,
sint64 r_492_511,
sint64 s_492_511,
sint64 u_492_512,
sint64 v_492_512,
sint64 r_492_512,
sint64 s_492_512,
bit ne
)={
    u_492_511 * neg_f_472_low60_20_low20_0 + v_492_511 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_19 * (-(2**20)),
    r_492_511 * neg_f_472_low60_20_low20_0 + s_492_511 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_19 * (-(2**20))
&&
    u_492_511 * neg_f_472_low60_20_low20_0 + v_492_511 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_19 * (const 64 (-(2**20))),
    r_492_511 * neg_f_472_low60_20_low20_0 + s_492_511 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_19 + u_492_511 * (const 64 (2**21)) + v_492_511 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_19 + r_492_511 * (const 64 (2**21)) + s_492_511 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_19,
    neg_f_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_19,
    neg_g_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 511)) <=s delta, delta <=s (const 64 (1 + 2*511)),
    (const 64 (-(2**20))) <=s u_492_511, u_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_511, v_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_511, r_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_511, s_492_511 <=s (const 64 ((2**20))),
    u_492_511 + v_492_511 <=s (const 64 (2**20)),
    u_492_511 - v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 + v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 - v_492_511 <=s (const 64 (2**20)),
    r_492_511 + s_492_511 <=s (const 64 (2**20)),
    r_492_511 - s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 + s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 - s_492_511 <=s (const 64 (2**20)),
    u_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_492_511 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step511

// premise a
assume
neg_g_472_low60_20_low20_19 = 0 (mod 2)
&&
neg_g_472_low60_20_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov neg_f_472_low60_20_low20_20 neg_f_472_low60_20_low20_19;
mov u_492_512 u_492_511;
mov v_492_512 v_492_511;

asr neg_g_472_low60_20_low20_20 neg_g_472_low60_20_low20_19 1;
asr r_492_512 r_492_511 1;
asr s_492_512 s_492_511 1;
assert
    true
&&
    neg_f_472_low60_20_low20_20 = neg_f_472_low60_20_low20_19,
    u_492_512 = u_492_511,
    v_492_512 = v_492_511,
    neg_g_472_low60_20_low20_20 * (const 64 2) = neg_g_472_low60_20_low20_19,
    r_492_512 * (const 64 2) = r_492_511,
    s_492_512 * (const 64 2) = s_492_511
;

assume
    neg_f_472_low60_20_low20_20 = neg_f_472_low60_20_low20_19,
    u_492_512 = u_492_511,
    v_492_512 = v_492_511,
    neg_g_472_low60_20_low20_20 * 2 = neg_g_472_low60_20_low20_19,
    r_492_512 * 2 = r_492_511,
    s_492_512 * 2 = s_492_511
&&
    true
;

{
    u_492_512 * neg_f_472_low60_20_low20_0 + v_492_512 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_512 * neg_f_472_low60_20_low20_0 + s_492_512 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_20 + u_492_512 * (const 64 (2**21)) + v_492_512 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_20 + r_492_512 * (const 64 (2**21)) + s_492_512 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_20,
    neg_f_472_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_20,
    neg_g_472_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 512)) <=s delta, delta <=s (const 64 (1 + 2*512)),
    (const 64 (-(2**20))) <=s u_492_512, u_492_512 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_512, v_492_512 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_512, r_492_512 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_512, s_492_512 <=s (const 64 ((2**20))),
    u_492_512 + v_492_512 <=s (const 64 (2**20)),
    u_492_512 - v_492_512 <=s (const 64 (2**20)),
    (const 64 0) - u_492_512 + v_492_512 <=s (const 64 (2**20)),
    (const 64 0) - u_492_512 - v_492_512 <=s (const 64 (2**20)),
    r_492_512 + s_492_512 <=s (const 64 (2**20)),
    r_492_512 - s_492_512 <=s (const 64 (2**20)),
    (const 64 0) - r_492_512 + s_492_512 <=s (const 64 (2**20)),
    (const 64 0) - r_492_512 - s_492_512 <=s (const 64 (2**20)),
    u_492_512 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_492_512 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_492_512 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_492_512 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_511_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_19,
sint64 neg_g_472_low60_20_low20_19,
sint64 neg_f_472_low60_20_low20_20,
sint64 neg_g_472_low60_20_low20_20,
sint64 u_492_511,
sint64 v_492_511,
sint64 r_492_511,
sint64 s_492_511,
sint64 u_492_512,
sint64 v_492_512,
sint64 r_492_512,
sint64 s_492_512,
bit ne
)={
    u_492_511 * neg_f_472_low60_20_low20_0 + v_492_511 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_19 * (-(2**20)),
    r_492_511 * neg_f_472_low60_20_low20_0 + s_492_511 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_19 * (-(2**20))
&&
    u_492_511 * neg_f_472_low60_20_low20_0 + v_492_511 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_19 * (const 64 (-(2**20))),
    r_492_511 * neg_f_472_low60_20_low20_0 + s_492_511 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_19 + u_492_511 * (const 64 (2**21)) + v_492_511 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_19 + r_492_511 * (const 64 (2**21)) + s_492_511 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_19,
    neg_f_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_19,
    neg_g_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 511)) <=s delta, delta <=s (const 64 (1 + 2*511)),
    (const 64 (-(2**20))) <=s u_492_511, u_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_511, v_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_511, r_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_511, s_492_511 <=s (const 64 ((2**20))),
    u_492_511 + v_492_511 <=s (const 64 (2**20)),
    u_492_511 - v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 + v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 - v_492_511 <=s (const 64 (2**20)),
    r_492_511 + s_492_511 <=s (const 64 (2**20)),
    r_492_511 - s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 + s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 - s_492_511 <=s (const 64 (2**20)),
    u_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_492_511 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step511

// premise b
assume
neg_g_472_low60_20_low20_19 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_20 neg_f_472_low60_20_low20_19;
mov u_492_512 u_492_511;
mov v_492_512 v_492_511;

add neg_g_472_low60_20_low20_20 neg_g_472_low60_20_low20_19 neg_f_472_low60_20_low20_19;
asr neg_g_472_low60_20_low20_20 neg_g_472_low60_20_low20_20 1;
add r_492_512 r_492_511 u_492_511;
asr r_492_512 r_492_512 1;
add s_492_512 s_492_511 v_492_511;
asr s_492_512 s_492_512 1;
assert
    true
&&
    neg_f_472_low60_20_low20_20 = neg_f_472_low60_20_low20_19,
    u_492_512 = u_492_511,
    v_492_512 = v_492_511,
    neg_g_472_low60_20_low20_20 * (const 64 2) = neg_g_472_low60_20_low20_19 + neg_f_472_low60_20_low20_19,
    r_492_512 * (const 64 2) = r_492_511 + u_492_511,
    s_492_512 * (const 64 2) = s_492_511 + v_492_511
;

assume
    neg_f_472_low60_20_low20_20 = neg_f_472_low60_20_low20_19,
    u_492_512 = u_492_511,
    v_492_512 = v_492_511,
    neg_g_472_low60_20_low20_20 * 2 = neg_g_472_low60_20_low20_19 + neg_f_472_low60_20_low20_19,
    r_492_512 * 2 = r_492_511 + u_492_511,
    s_492_512 * 2 = s_492_511 + v_492_511
&&
    true
;

{
    u_492_512 * neg_f_472_low60_20_low20_0 + v_492_512 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_512 * neg_f_472_low60_20_low20_0 + s_492_512 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_20 + u_492_512 * (const 64 (2**21)) + v_492_512 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_20 + r_492_512 * (const 64 (2**21)) + s_492_512 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_20,
    neg_f_472_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_20,
    neg_g_472_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 512)) <=s delta, delta <=s (const 64 (1 + 2*512)),
    (const 64 (-(2**20))) <=s u_492_512, u_492_512 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_512, v_492_512 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_512, r_492_512 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_512, s_492_512 <=s (const 64 ((2**20))),
    u_492_512 + v_492_512 <=s (const 64 (2**20)),
    u_492_512 - v_492_512 <=s (const 64 (2**20)),
    (const 64 0) - u_492_512 + v_492_512 <=s (const 64 (2**20)),
    (const 64 0) - u_492_512 - v_492_512 <=s (const 64 (2**20)),
    r_492_512 + s_492_512 <=s (const 64 (2**20)),
    r_492_512 - s_492_512 <=s (const 64 (2**20)),
    (const 64 0) - r_492_512 + s_492_512 <=s (const 64 (2**20)),
    (const 64 0) - r_492_512 - s_492_512 <=s (const 64 (2**20)),
    u_492_512 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_492_512 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_492_512 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_492_512 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_511_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_472_low60_20_low20_0,
sint64 neg_g_472_low60_20_low20_0,
sint64 neg_f_472_low60_20_low20_19,
sint64 neg_g_472_low60_20_low20_19,
sint64 neg_f_472_low60_20_low20_20,
sint64 neg_g_472_low60_20_low20_20,
sint64 u_492_511,
sint64 v_492_511,
sint64 r_492_511,
sint64 s_492_511,
sint64 u_492_512,
sint64 v_492_512,
sint64 r_492_512,
sint64 s_492_512,
bit ne
)={
    u_492_511 * neg_f_472_low60_20_low20_0 + v_492_511 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_19 * (-(2**20)),
    r_492_511 * neg_f_472_low60_20_low20_0 + s_492_511 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_19 * (-(2**20))
&&
    u_492_511 * neg_f_472_low60_20_low20_0 + v_492_511 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_19 * (const 64 (-(2**20))),
    r_492_511 * neg_f_472_low60_20_low20_0 + s_492_511 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_472_low60_20_low20_19 + u_492_511 * (const 64 (2**21)) + v_492_511 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_19 + r_492_511 * (const 64 (2**21)) + s_492_511 * (const 64 (2**42)),
    const 64 0 <=s neg_f_472_low60_20_low20_0,
    neg_f_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_0,
    neg_g_472_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_472_low60_20_low20_19,
    neg_f_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_472_low60_20_low20_19,
    neg_g_472_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 511)) <=s delta, delta <=s (const 64 (1 + 2*511)),
    (const 64 (-(2**20))) <=s u_492_511, u_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_511, v_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_511, r_492_511 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_511, s_492_511 <=s (const 64 ((2**20))),
    u_492_511 + v_492_511 <=s (const 64 (2**20)),
    u_492_511 - v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 + v_492_511 <=s (const 64 (2**20)),
    (const 64 0) - u_492_511 - v_492_511 <=s (const 64 (2**20)),
    r_492_511 + s_492_511 <=s (const 64 (2**20)),
    r_492_511 - s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 + s_492_511 <=s (const 64 (2**20)),
    (const 64 0) - r_492_511 - s_492_511 <=s (const 64 (2**20)),
    u_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_492_511 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_492_511 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step511

// premise c
assume
neg_g_472_low60_20_low20_19 = 1 (mod 2)
&&
neg_g_472_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_472_low60_20_low20_20 neg_g_472_low60_20_low20_19;
mov u_492_512 r_492_511;
mov v_492_512 s_492_511;

subs dc neg_g_472_low60_20_low20_20 neg_g_472_low60_20_low20_19 neg_f_472_low60_20_low20_19;
asr neg_g_472_low60_20_low20_20 neg_g_472_low60_20_low20_20 1;
subs dc r_492_512 r_492_511 u_492_511;
asr r_492_512 r_492_512 1;
subs dc s_492_512 s_492_511 v_492_511;
asr s_492_512 s_492_512 1;
assert
    true
&&
    neg_f_472_low60_20_low20_20 = neg_g_472_low60_20_low20_19,
    u_492_512 = r_492_511,
    v_492_512 = s_492_511,
    neg_g_472_low60_20_low20_20 * (const 64 2) = neg_g_472_low60_20_low20_19 - neg_f_472_low60_20_low20_19,
    r_492_512 * (const 64 2) = r_492_511 - u_492_511,
    s_492_512 * (const 64 2) = s_492_511 - v_492_511
;

assume
    neg_f_472_low60_20_low20_20 = neg_g_472_low60_20_low20_19,
    u_492_512 = r_492_511,
    v_492_512 = s_492_511,
    neg_g_472_low60_20_low20_20 * 2 = neg_g_472_low60_20_low20_19 - neg_f_472_low60_20_low20_19,
    r_492_512 * 2 = r_492_511 - u_492_511,
    s_492_512 * 2 = s_492_511 - v_492_511
&&
    true
;

{
    u_492_512 * neg_f_472_low60_20_low20_0 + v_492_512 * neg_g_472_low60_20_low20_0 = neg_f_472_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_492_512 * neg_f_472_low60_20_low20_0 + s_492_512 * neg_g_472_low60_20_low20_0 = neg_g_472_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_472_low60_20_low20_20 + u_492_512 * (const 64 (2**21)) + v_492_512 * (const 64 (2**42)),
    grs = neg_g_472_low60_20_low20_20 + r_492_512 * (const 64 (2**21)) + s_492_512 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_472_low60_20_low20_20,
    neg_f_472_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_472_low60_20_low20_20,
    neg_g_472_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 512)) <=s delta, delta <=s (const 64 (1 + 2*512)),
    (const 64 (-(2**20))) <=s u_492_512, u_492_512 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_492_512, v_492_512 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_492_512, r_492_512 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_492_512, s_492_512 <=s (const 64 ((2**20))),
    u_492_512 + v_492_512 <=s (const 64 (2**20)),
    u_492_512 - v_492_512 <=s (const 64 (2**20)),
    (const 64 0) - u_492_512 + v_492_512 <=s (const 64 (2**20)),
    (const 64 0) - u_492_512 - v_492_512 <=s (const 64 (2**20)),
    r_492_512 + s_492_512 <=s (const 64 (2**20)),
    r_492_512 - s_492_512 <=s (const 64 (2**20)),
    (const 64 0) - r_492_512 + s_492_512 <=s (const 64 (2**20)),
    (const 64 0) - r_492_512 - s_492_512 <=s (const 64 (2**20)),
    u_492_512 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_492_512 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_492_512 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_492_512 = (const 64 0) (mod (const 64 (2**(20-20))))
}

