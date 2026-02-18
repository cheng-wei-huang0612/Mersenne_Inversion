proc divstep_394_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_1,
sint64 g_354_low60_40_low20_1,
sint64 u_394_394,
sint64 v_394_394,
sint64 r_394_394,
sint64 s_394_394,
sint64 u_394_395,
sint64 v_394_395,
sint64 r_394_395,
sint64 s_394_395,
bit ne
)={
    u_394_394 * f_354_low60_40_low20_0 + v_394_394 * g_354_low60_40_low20_0 = f_354_low60_40_low20_0 * (-(2**20)),
    r_394_394 * f_354_low60_40_low20_0 + s_394_394 * g_354_low60_40_low20_0 = g_354_low60_40_low20_0 * (-(2**20))
&&
    u_394_394 * f_354_low60_40_low20_0 + v_394_394 * g_354_low60_40_low20_0 = f_354_low60_40_low20_0 * (const 64 (-(2**20))),
    r_394_394 * f_354_low60_40_low20_0 + s_394_394 * g_354_low60_40_low20_0 = g_354_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_0 + u_394_394 * (const 64 (2**21)) + v_394_394 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_0 + r_394_394 * (const 64 (2**21)) + s_394_394 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 394)) <=s delta, delta <=s (const 64 (1 + 2*394)),
    u_394_394 = (const 64 (-(2**20))),
    v_394_394 = (const 64 (0)),
    r_394_394 = (const 64 (0)),
    s_394_394 = (const 64 (-(2**20)))
}



// divsteps
// step394

// premise a
assume
g_354_low60_40_low20_0 = 0 (mod 2)
&&
g_354_low60_40_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_354_low60_40_low20_1 f_354_low60_40_low20_0;
mov u_394_395 u_394_394;
mov v_394_395 v_394_394;

asr g_354_low60_40_low20_1 g_354_low60_40_low20_0 1;
asr r_394_395 r_394_394 1;
asr s_394_395 s_394_394 1;
assert
    true
&&
    f_354_low60_40_low20_1 = f_354_low60_40_low20_0,
    u_394_395 = u_394_394,
    v_394_395 = v_394_394,
    g_354_low60_40_low20_1 * (const 64 2) = g_354_low60_40_low20_0,
    r_394_395 * (const 64 2) = r_394_394,
    s_394_395 * (const 64 2) = s_394_394
;

assume
    f_354_low60_40_low20_1 = f_354_low60_40_low20_0,
    u_394_395 = u_394_394,
    v_394_395 = v_394_394,
    g_354_low60_40_low20_1 * 2 = g_354_low60_40_low20_0,
    r_394_395 * 2 = r_394_394,
    s_394_395 * 2 = s_394_394
&&
    true
;

{
    u_394_395 * f_354_low60_40_low20_0 + v_394_395 * g_354_low60_40_low20_0 = f_354_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_395 * f_354_low60_40_low20_0 + s_394_395 * g_354_low60_40_low20_0 = g_354_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_1 + u_394_395 * (const 64 (2**21)) + v_394_395 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_1 + r_394_395 * (const 64 (2**21)) + s_394_395 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_1,
    f_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_1,
    g_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 395)) <=s delta, delta <=s (const 64 (1 + 2*395)),
    (const 64 (-(2**20))) <=s u_394_395, u_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_395, v_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_395, r_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_395, s_394_395 <=s (const 64 ((2**20)-1)),
    u_394_395 + v_394_395 <=s (const 64 (2**20)),
    u_394_395 - v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 + v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 - v_394_395 <=s (const 64 (2**20)),
    r_394_395 + s_394_395 <=s (const 64 (2**20)),
    r_394_395 - s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 + s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 - s_394_395 <=s (const 64 (2**20)),
    u_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_394_395 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_394_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_1,
sint64 g_354_low60_40_low20_1,
sint64 u_394_394,
sint64 v_394_394,
sint64 r_394_394,
sint64 s_394_394,
sint64 u_394_395,
sint64 v_394_395,
sint64 r_394_395,
sint64 s_394_395,
bit ne
)={
    u_394_394 * f_354_low60_40_low20_0 + v_394_394 * g_354_low60_40_low20_0 = f_354_low60_40_low20_0 * (-(2**20)),
    r_394_394 * f_354_low60_40_low20_0 + s_394_394 * g_354_low60_40_low20_0 = g_354_low60_40_low20_0 * (-(2**20))
&&
    u_394_394 * f_354_low60_40_low20_0 + v_394_394 * g_354_low60_40_low20_0 = f_354_low60_40_low20_0 * (const 64 (-(2**20))),
    r_394_394 * f_354_low60_40_low20_0 + s_394_394 * g_354_low60_40_low20_0 = g_354_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_0 + u_394_394 * (const 64 (2**21)) + v_394_394 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_0 + r_394_394 * (const 64 (2**21)) + s_394_394 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 394)) <=s delta, delta <=s (const 64 (1 + 2*394)),
    u_394_394 = (const 64 (-(2**20))),
    v_394_394 = (const 64 (0)),
    r_394_394 = (const 64 (0)),
    s_394_394 = (const 64 (-(2**20)))
}



// divsteps
// step394

// premise b
assume
g_354_low60_40_low20_0 = 1 (mod 2)
&&
g_354_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_1 f_354_low60_40_low20_0;
mov u_394_395 u_394_394;
mov v_394_395 v_394_394;

add g_354_low60_40_low20_1 g_354_low60_40_low20_0 f_354_low60_40_low20_0;
asr g_354_low60_40_low20_1 g_354_low60_40_low20_1 1;
add r_394_395 r_394_394 u_394_394;
asr r_394_395 r_394_395 1;
add s_394_395 s_394_394 v_394_394;
asr s_394_395 s_394_395 1;
assert
    true
&&
    f_354_low60_40_low20_1 = f_354_low60_40_low20_0,
    u_394_395 = u_394_394,
    v_394_395 = v_394_394,
    g_354_low60_40_low20_1 * (const 64 2) = g_354_low60_40_low20_0 + f_354_low60_40_low20_0,
    r_394_395 * (const 64 2) = r_394_394 + u_394_394,
    s_394_395 * (const 64 2) = s_394_394 + v_394_394
;

assume
    f_354_low60_40_low20_1 = f_354_low60_40_low20_0,
    u_394_395 = u_394_394,
    v_394_395 = v_394_394,
    g_354_low60_40_low20_1 * 2 = g_354_low60_40_low20_0 + f_354_low60_40_low20_0,
    r_394_395 * 2 = r_394_394 + u_394_394,
    s_394_395 * 2 = s_394_394 + v_394_394
&&
    true
;

{
    u_394_395 * f_354_low60_40_low20_0 + v_394_395 * g_354_low60_40_low20_0 = f_354_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_395 * f_354_low60_40_low20_0 + s_394_395 * g_354_low60_40_low20_0 = g_354_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_1 + u_394_395 * (const 64 (2**21)) + v_394_395 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_1 + r_394_395 * (const 64 (2**21)) + s_394_395 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_1,
    f_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_1,
    g_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 395)) <=s delta, delta <=s (const 64 (1 + 2*395)),
    (const 64 (-(2**20))) <=s u_394_395, u_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_395, v_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_395, r_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_395, s_394_395 <=s (const 64 ((2**20)-1)),
    u_394_395 + v_394_395 <=s (const 64 (2**20)),
    u_394_395 - v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 + v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 - v_394_395 <=s (const 64 (2**20)),
    r_394_395 + s_394_395 <=s (const 64 (2**20)),
    r_394_395 - s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 + s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 - s_394_395 <=s (const 64 (2**20)),
    u_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_394_395 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_394_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_1,
sint64 g_354_low60_40_low20_1,
sint64 u_394_394,
sint64 v_394_394,
sint64 r_394_394,
sint64 s_394_394,
sint64 u_394_395,
sint64 v_394_395,
sint64 r_394_395,
sint64 s_394_395,
bit ne
)={
    u_394_394 * f_354_low60_40_low20_0 + v_394_394 * g_354_low60_40_low20_0 = f_354_low60_40_low20_0 * (-(2**20)),
    r_394_394 * f_354_low60_40_low20_0 + s_394_394 * g_354_low60_40_low20_0 = g_354_low60_40_low20_0 * (-(2**20))
&&
    u_394_394 * f_354_low60_40_low20_0 + v_394_394 * g_354_low60_40_low20_0 = f_354_low60_40_low20_0 * (const 64 (-(2**20))),
    r_394_394 * f_354_low60_40_low20_0 + s_394_394 * g_354_low60_40_low20_0 = g_354_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_0 + u_394_394 * (const 64 (2**21)) + v_394_394 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_0 + r_394_394 * (const 64 (2**21)) + s_394_394 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 394)) <=s delta, delta <=s (const 64 (1 + 2*394)),
    u_394_394 = (const 64 (-(2**20))),
    v_394_394 = (const 64 (0)),
    r_394_394 = (const 64 (0)),
    s_394_394 = (const 64 (-(2**20)))
}



// divsteps
// step394

// premise c
assume
g_354_low60_40_low20_0 = 1 (mod 2)
&&
g_354_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_1 g_354_low60_40_low20_0;
mov u_394_395 r_394_394;
mov v_394_395 s_394_394;

subs dc g_354_low60_40_low20_1 g_354_low60_40_low20_0 f_354_low60_40_low20_0;
asr g_354_low60_40_low20_1 g_354_low60_40_low20_1 1;
subs dc r_394_395 r_394_394 u_394_394;
asr r_394_395 r_394_395 1;
subs dc s_394_395 s_394_394 v_394_394;
asr s_394_395 s_394_395 1;
assert
    true
&&
    f_354_low60_40_low20_1 = g_354_low60_40_low20_0,
    u_394_395 = r_394_394,
    v_394_395 = s_394_394,
    g_354_low60_40_low20_1 * (const 64 2) = g_354_low60_40_low20_0 - f_354_low60_40_low20_0,
    r_394_395 * (const 64 2) = r_394_394 - u_394_394,
    s_394_395 * (const 64 2) = s_394_394 - v_394_394
;

assume
    f_354_low60_40_low20_1 = g_354_low60_40_low20_0,
    u_394_395 = r_394_394,
    v_394_395 = s_394_394,
    g_354_low60_40_low20_1 * 2 = g_354_low60_40_low20_0 - f_354_low60_40_low20_0,
    r_394_395 * 2 = r_394_394 - u_394_394,
    s_394_395 * 2 = s_394_394 - v_394_394
&&
    true
;

{
    u_394_395 * f_354_low60_40_low20_0 + v_394_395 * g_354_low60_40_low20_0 = f_354_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_395 * f_354_low60_40_low20_0 + s_394_395 * g_354_low60_40_low20_0 = g_354_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_1 + u_394_395 * (const 64 (2**21)) + v_394_395 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_1 + r_394_395 * (const 64 (2**21)) + s_394_395 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_1,
    f_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_1,
    g_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 395)) <=s delta, delta <=s (const 64 (1 + 2*395)),
    (const 64 (-(2**20))) <=s u_394_395, u_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_395, v_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_395, r_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_395, s_394_395 <=s (const 64 ((2**20)-1)),
    u_394_395 + v_394_395 <=s (const 64 (2**20)),
    u_394_395 - v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 + v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 - v_394_395 <=s (const 64 (2**20)),
    r_394_395 + s_394_395 <=s (const 64 (2**20)),
    r_394_395 - s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 + s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 - s_394_395 <=s (const 64 (2**20)),
    u_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_394_395 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_395_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_1,
sint64 g_354_low60_40_low20_1,
sint64 f_354_low60_40_low20_2,
sint64 g_354_low60_40_low20_2,
sint64 u_394_395,
sint64 v_394_395,
sint64 r_394_395,
sint64 s_394_395,
sint64 u_394_396,
sint64 v_394_396,
sint64 r_394_396,
sint64 s_394_396,
bit ne
)={
    u_394_395 * f_354_low60_40_low20_0 + v_394_395 * g_354_low60_40_low20_0 = f_354_low60_40_low20_1 * (-(2**20)),
    r_394_395 * f_354_low60_40_low20_0 + s_394_395 * g_354_low60_40_low20_0 = g_354_low60_40_low20_1 * (-(2**20))
&&
    u_394_395 * f_354_low60_40_low20_0 + v_394_395 * g_354_low60_40_low20_0 = f_354_low60_40_low20_1 * (const 64 (-(2**20))),
    r_394_395 * f_354_low60_40_low20_0 + s_394_395 * g_354_low60_40_low20_0 = g_354_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_1 + u_394_395 * (const 64 (2**21)) + v_394_395 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_1 + r_394_395 * (const 64 (2**21)) + s_394_395 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_1,
    f_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_1,
    g_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 395)) <=s delta, delta <=s (const 64 (1 + 2*395)),
    (const 64 (-(2**20))) <=s u_394_395, u_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_395, v_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_395, r_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_395, s_394_395 <=s (const 64 ((2**20)-1)),
    u_394_395 + v_394_395 <=s (const 64 (2**20)),
    u_394_395 - v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 + v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 - v_394_395 <=s (const 64 (2**20)),
    r_394_395 + s_394_395 <=s (const 64 (2**20)),
    r_394_395 - s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 + s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 - s_394_395 <=s (const 64 (2**20)),
    u_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_394_395 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step395

// premise a
assume
g_354_low60_40_low20_1 = 0 (mod 2)
&&
g_354_low60_40_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_2 f_354_low60_40_low20_1;
mov u_394_396 u_394_395;
mov v_394_396 v_394_395;

asr g_354_low60_40_low20_2 g_354_low60_40_low20_1 1;
asr r_394_396 r_394_395 1;
asr s_394_396 s_394_395 1;
assert
    true
&&
    f_354_low60_40_low20_2 = f_354_low60_40_low20_1,
    u_394_396 = u_394_395,
    v_394_396 = v_394_395,
    g_354_low60_40_low20_2 * (const 64 2) = g_354_low60_40_low20_1,
    r_394_396 * (const 64 2) = r_394_395,
    s_394_396 * (const 64 2) = s_394_395
;

assume
    f_354_low60_40_low20_2 = f_354_low60_40_low20_1,
    u_394_396 = u_394_395,
    v_394_396 = v_394_395,
    g_354_low60_40_low20_2 * 2 = g_354_low60_40_low20_1,
    r_394_396 * 2 = r_394_395,
    s_394_396 * 2 = s_394_395
&&
    true
;

{
    u_394_396 * f_354_low60_40_low20_0 + v_394_396 * g_354_low60_40_low20_0 = f_354_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_396 * f_354_low60_40_low20_0 + s_394_396 * g_354_low60_40_low20_0 = g_354_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_2 + u_394_396 * (const 64 (2**21)) + v_394_396 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_2 + r_394_396 * (const 64 (2**21)) + s_394_396 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_2,
    f_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_2,
    g_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 396)) <=s delta, delta <=s (const 64 (1 + 2*396)),
    (const 64 (-(2**20))) <=s u_394_396, u_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_396, v_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_396, r_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_396, s_394_396 <=s (const 64 ((2**20)-1)),
    u_394_396 + v_394_396 <=s (const 64 (2**20)),
    u_394_396 - v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 + v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 - v_394_396 <=s (const 64 (2**20)),
    r_394_396 + s_394_396 <=s (const 64 (2**20)),
    r_394_396 - s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 + s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 - s_394_396 <=s (const 64 (2**20)),
    u_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_394_396 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_395_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_1,
sint64 g_354_low60_40_low20_1,
sint64 f_354_low60_40_low20_2,
sint64 g_354_low60_40_low20_2,
sint64 u_394_395,
sint64 v_394_395,
sint64 r_394_395,
sint64 s_394_395,
sint64 u_394_396,
sint64 v_394_396,
sint64 r_394_396,
sint64 s_394_396,
bit ne
)={
    u_394_395 * f_354_low60_40_low20_0 + v_394_395 * g_354_low60_40_low20_0 = f_354_low60_40_low20_1 * (-(2**20)),
    r_394_395 * f_354_low60_40_low20_0 + s_394_395 * g_354_low60_40_low20_0 = g_354_low60_40_low20_1 * (-(2**20))
&&
    u_394_395 * f_354_low60_40_low20_0 + v_394_395 * g_354_low60_40_low20_0 = f_354_low60_40_low20_1 * (const 64 (-(2**20))),
    r_394_395 * f_354_low60_40_low20_0 + s_394_395 * g_354_low60_40_low20_0 = g_354_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_1 + u_394_395 * (const 64 (2**21)) + v_394_395 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_1 + r_394_395 * (const 64 (2**21)) + s_394_395 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_1,
    f_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_1,
    g_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 395)) <=s delta, delta <=s (const 64 (1 + 2*395)),
    (const 64 (-(2**20))) <=s u_394_395, u_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_395, v_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_395, r_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_395, s_394_395 <=s (const 64 ((2**20)-1)),
    u_394_395 + v_394_395 <=s (const 64 (2**20)),
    u_394_395 - v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 + v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 - v_394_395 <=s (const 64 (2**20)),
    r_394_395 + s_394_395 <=s (const 64 (2**20)),
    r_394_395 - s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 + s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 - s_394_395 <=s (const 64 (2**20)),
    u_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_394_395 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step395

// premise b
assume
g_354_low60_40_low20_1 = 1 (mod 2)
&&
g_354_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_2 f_354_low60_40_low20_1;
mov u_394_396 u_394_395;
mov v_394_396 v_394_395;

add g_354_low60_40_low20_2 g_354_low60_40_low20_1 f_354_low60_40_low20_1;
asr g_354_low60_40_low20_2 g_354_low60_40_low20_2 1;
add r_394_396 r_394_395 u_394_395;
asr r_394_396 r_394_396 1;
add s_394_396 s_394_395 v_394_395;
asr s_394_396 s_394_396 1;
assert
    true
&&
    f_354_low60_40_low20_2 = f_354_low60_40_low20_1,
    u_394_396 = u_394_395,
    v_394_396 = v_394_395,
    g_354_low60_40_low20_2 * (const 64 2) = g_354_low60_40_low20_1 + f_354_low60_40_low20_1,
    r_394_396 * (const 64 2) = r_394_395 + u_394_395,
    s_394_396 * (const 64 2) = s_394_395 + v_394_395
;

assume
    f_354_low60_40_low20_2 = f_354_low60_40_low20_1,
    u_394_396 = u_394_395,
    v_394_396 = v_394_395,
    g_354_low60_40_low20_2 * 2 = g_354_low60_40_low20_1 + f_354_low60_40_low20_1,
    r_394_396 * 2 = r_394_395 + u_394_395,
    s_394_396 * 2 = s_394_395 + v_394_395
&&
    true
;

{
    u_394_396 * f_354_low60_40_low20_0 + v_394_396 * g_354_low60_40_low20_0 = f_354_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_396 * f_354_low60_40_low20_0 + s_394_396 * g_354_low60_40_low20_0 = g_354_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_2 + u_394_396 * (const 64 (2**21)) + v_394_396 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_2 + r_394_396 * (const 64 (2**21)) + s_394_396 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_2,
    f_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_2,
    g_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 396)) <=s delta, delta <=s (const 64 (1 + 2*396)),
    (const 64 (-(2**20))) <=s u_394_396, u_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_396, v_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_396, r_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_396, s_394_396 <=s (const 64 ((2**20)-1)),
    u_394_396 + v_394_396 <=s (const 64 (2**20)),
    u_394_396 - v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 + v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 - v_394_396 <=s (const 64 (2**20)),
    r_394_396 + s_394_396 <=s (const 64 (2**20)),
    r_394_396 - s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 + s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 - s_394_396 <=s (const 64 (2**20)),
    u_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_394_396 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_395_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_1,
sint64 g_354_low60_40_low20_1,
sint64 f_354_low60_40_low20_2,
sint64 g_354_low60_40_low20_2,
sint64 u_394_395,
sint64 v_394_395,
sint64 r_394_395,
sint64 s_394_395,
sint64 u_394_396,
sint64 v_394_396,
sint64 r_394_396,
sint64 s_394_396,
bit ne
)={
    u_394_395 * f_354_low60_40_low20_0 + v_394_395 * g_354_low60_40_low20_0 = f_354_low60_40_low20_1 * (-(2**20)),
    r_394_395 * f_354_low60_40_low20_0 + s_394_395 * g_354_low60_40_low20_0 = g_354_low60_40_low20_1 * (-(2**20))
&&
    u_394_395 * f_354_low60_40_low20_0 + v_394_395 * g_354_low60_40_low20_0 = f_354_low60_40_low20_1 * (const 64 (-(2**20))),
    r_394_395 * f_354_low60_40_low20_0 + s_394_395 * g_354_low60_40_low20_0 = g_354_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_1 + u_394_395 * (const 64 (2**21)) + v_394_395 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_1 + r_394_395 * (const 64 (2**21)) + s_394_395 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_1,
    f_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_1,
    g_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 395)) <=s delta, delta <=s (const 64 (1 + 2*395)),
    (const 64 (-(2**20))) <=s u_394_395, u_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_395, v_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_395, r_394_395 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_395, s_394_395 <=s (const 64 ((2**20)-1)),
    u_394_395 + v_394_395 <=s (const 64 (2**20)),
    u_394_395 - v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 + v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 - v_394_395 <=s (const 64 (2**20)),
    r_394_395 + s_394_395 <=s (const 64 (2**20)),
    r_394_395 - s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 + s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 - s_394_395 <=s (const 64 (2**20)),
    u_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_394_395 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step395

// premise c
assume
g_354_low60_40_low20_1 = 1 (mod 2)
&&
g_354_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_2 g_354_low60_40_low20_1;
mov u_394_396 r_394_395;
mov v_394_396 s_394_395;

subs dc g_354_low60_40_low20_2 g_354_low60_40_low20_1 f_354_low60_40_low20_1;
asr g_354_low60_40_low20_2 g_354_low60_40_low20_2 1;
subs dc r_394_396 r_394_395 u_394_395;
asr r_394_396 r_394_396 1;
subs dc s_394_396 s_394_395 v_394_395;
asr s_394_396 s_394_396 1;
assert
    true
&&
    f_354_low60_40_low20_2 = g_354_low60_40_low20_1,
    u_394_396 = r_394_395,
    v_394_396 = s_394_395,
    g_354_low60_40_low20_2 * (const 64 2) = g_354_low60_40_low20_1 - f_354_low60_40_low20_1,
    r_394_396 * (const 64 2) = r_394_395 - u_394_395,
    s_394_396 * (const 64 2) = s_394_395 - v_394_395
;

assume
    f_354_low60_40_low20_2 = g_354_low60_40_low20_1,
    u_394_396 = r_394_395,
    v_394_396 = s_394_395,
    g_354_low60_40_low20_2 * 2 = g_354_low60_40_low20_1 - f_354_low60_40_low20_1,
    r_394_396 * 2 = r_394_395 - u_394_395,
    s_394_396 * 2 = s_394_395 - v_394_395
&&
    true
;

{
    u_394_396 * f_354_low60_40_low20_0 + v_394_396 * g_354_low60_40_low20_0 = f_354_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_396 * f_354_low60_40_low20_0 + s_394_396 * g_354_low60_40_low20_0 = g_354_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_2 + u_394_396 * (const 64 (2**21)) + v_394_396 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_2 + r_394_396 * (const 64 (2**21)) + s_394_396 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_2,
    f_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_2,
    g_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 396)) <=s delta, delta <=s (const 64 (1 + 2*396)),
    (const 64 (-(2**20))) <=s u_394_396, u_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_396, v_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_396, r_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_396, s_394_396 <=s (const 64 ((2**20)-1)),
    u_394_396 + v_394_396 <=s (const 64 (2**20)),
    u_394_396 - v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 + v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 - v_394_396 <=s (const 64 (2**20)),
    r_394_396 + s_394_396 <=s (const 64 (2**20)),
    r_394_396 - s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 + s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 - s_394_396 <=s (const 64 (2**20)),
    u_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_394_396 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_396_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_2,
sint64 g_354_low60_40_low20_2,
sint64 f_354_low60_40_low20_3,
sint64 g_354_low60_40_low20_3,
sint64 u_394_396,
sint64 v_394_396,
sint64 r_394_396,
sint64 s_394_396,
sint64 u_394_397,
sint64 v_394_397,
sint64 r_394_397,
sint64 s_394_397,
bit ne
)={
    u_394_396 * f_354_low60_40_low20_0 + v_394_396 * g_354_low60_40_low20_0 = f_354_low60_40_low20_2 * (-(2**20)),
    r_394_396 * f_354_low60_40_low20_0 + s_394_396 * g_354_low60_40_low20_0 = g_354_low60_40_low20_2 * (-(2**20))
&&
    u_394_396 * f_354_low60_40_low20_0 + v_394_396 * g_354_low60_40_low20_0 = f_354_low60_40_low20_2 * (const 64 (-(2**20))),
    r_394_396 * f_354_low60_40_low20_0 + s_394_396 * g_354_low60_40_low20_0 = g_354_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_2 + u_394_396 * (const 64 (2**21)) + v_394_396 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_2 + r_394_396 * (const 64 (2**21)) + s_394_396 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_2,
    f_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_2,
    g_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 396)) <=s delta, delta <=s (const 64 (1 + 2*396)),
    (const 64 (-(2**20))) <=s u_394_396, u_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_396, v_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_396, r_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_396, s_394_396 <=s (const 64 ((2**20)-1)),
    u_394_396 + v_394_396 <=s (const 64 (2**20)),
    u_394_396 - v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 + v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 - v_394_396 <=s (const 64 (2**20)),
    r_394_396 + s_394_396 <=s (const 64 (2**20)),
    r_394_396 - s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 + s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 - s_394_396 <=s (const 64 (2**20)),
    u_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_394_396 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step396

// premise a
assume
g_354_low60_40_low20_2 = 0 (mod 2)
&&
g_354_low60_40_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_3 f_354_low60_40_low20_2;
mov u_394_397 u_394_396;
mov v_394_397 v_394_396;

asr g_354_low60_40_low20_3 g_354_low60_40_low20_2 1;
asr r_394_397 r_394_396 1;
asr s_394_397 s_394_396 1;
assert
    true
&&
    f_354_low60_40_low20_3 = f_354_low60_40_low20_2,
    u_394_397 = u_394_396,
    v_394_397 = v_394_396,
    g_354_low60_40_low20_3 * (const 64 2) = g_354_low60_40_low20_2,
    r_394_397 * (const 64 2) = r_394_396,
    s_394_397 * (const 64 2) = s_394_396
;

assume
    f_354_low60_40_low20_3 = f_354_low60_40_low20_2,
    u_394_397 = u_394_396,
    v_394_397 = v_394_396,
    g_354_low60_40_low20_3 * 2 = g_354_low60_40_low20_2,
    r_394_397 * 2 = r_394_396,
    s_394_397 * 2 = s_394_396
&&
    true
;

{
    u_394_397 * f_354_low60_40_low20_0 + v_394_397 * g_354_low60_40_low20_0 = f_354_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_397 * f_354_low60_40_low20_0 + s_394_397 * g_354_low60_40_low20_0 = g_354_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_3 + u_394_397 * (const 64 (2**21)) + v_394_397 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_3 + r_394_397 * (const 64 (2**21)) + s_394_397 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_3,
    f_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_3,
    g_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 397)) <=s delta, delta <=s (const 64 (1 + 2*397)),
    (const 64 (-(2**20))) <=s u_394_397, u_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_397, v_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_397, r_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_397, s_394_397 <=s (const 64 ((2**20)-1)),
    u_394_397 + v_394_397 <=s (const 64 (2**20)),
    u_394_397 - v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 + v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 - v_394_397 <=s (const 64 (2**20)),
    r_394_397 + s_394_397 <=s (const 64 (2**20)),
    r_394_397 - s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 + s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 - s_394_397 <=s (const 64 (2**20)),
    u_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_394_397 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_396_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_2,
sint64 g_354_low60_40_low20_2,
sint64 f_354_low60_40_low20_3,
sint64 g_354_low60_40_low20_3,
sint64 u_394_396,
sint64 v_394_396,
sint64 r_394_396,
sint64 s_394_396,
sint64 u_394_397,
sint64 v_394_397,
sint64 r_394_397,
sint64 s_394_397,
bit ne
)={
    u_394_396 * f_354_low60_40_low20_0 + v_394_396 * g_354_low60_40_low20_0 = f_354_low60_40_low20_2 * (-(2**20)),
    r_394_396 * f_354_low60_40_low20_0 + s_394_396 * g_354_low60_40_low20_0 = g_354_low60_40_low20_2 * (-(2**20))
&&
    u_394_396 * f_354_low60_40_low20_0 + v_394_396 * g_354_low60_40_low20_0 = f_354_low60_40_low20_2 * (const 64 (-(2**20))),
    r_394_396 * f_354_low60_40_low20_0 + s_394_396 * g_354_low60_40_low20_0 = g_354_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_2 + u_394_396 * (const 64 (2**21)) + v_394_396 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_2 + r_394_396 * (const 64 (2**21)) + s_394_396 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_2,
    f_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_2,
    g_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 396)) <=s delta, delta <=s (const 64 (1 + 2*396)),
    (const 64 (-(2**20))) <=s u_394_396, u_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_396, v_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_396, r_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_396, s_394_396 <=s (const 64 ((2**20)-1)),
    u_394_396 + v_394_396 <=s (const 64 (2**20)),
    u_394_396 - v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 + v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 - v_394_396 <=s (const 64 (2**20)),
    r_394_396 + s_394_396 <=s (const 64 (2**20)),
    r_394_396 - s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 + s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 - s_394_396 <=s (const 64 (2**20)),
    u_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_394_396 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step396

// premise b
assume
g_354_low60_40_low20_2 = 1 (mod 2)
&&
g_354_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_3 f_354_low60_40_low20_2;
mov u_394_397 u_394_396;
mov v_394_397 v_394_396;

add g_354_low60_40_low20_3 g_354_low60_40_low20_2 f_354_low60_40_low20_2;
asr g_354_low60_40_low20_3 g_354_low60_40_low20_3 1;
add r_394_397 r_394_396 u_394_396;
asr r_394_397 r_394_397 1;
add s_394_397 s_394_396 v_394_396;
asr s_394_397 s_394_397 1;
assert
    true
&&
    f_354_low60_40_low20_3 = f_354_low60_40_low20_2,
    u_394_397 = u_394_396,
    v_394_397 = v_394_396,
    g_354_low60_40_low20_3 * (const 64 2) = g_354_low60_40_low20_2 + f_354_low60_40_low20_2,
    r_394_397 * (const 64 2) = r_394_396 + u_394_396,
    s_394_397 * (const 64 2) = s_394_396 + v_394_396
;

assume
    f_354_low60_40_low20_3 = f_354_low60_40_low20_2,
    u_394_397 = u_394_396,
    v_394_397 = v_394_396,
    g_354_low60_40_low20_3 * 2 = g_354_low60_40_low20_2 + f_354_low60_40_low20_2,
    r_394_397 * 2 = r_394_396 + u_394_396,
    s_394_397 * 2 = s_394_396 + v_394_396
&&
    true
;

{
    u_394_397 * f_354_low60_40_low20_0 + v_394_397 * g_354_low60_40_low20_0 = f_354_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_397 * f_354_low60_40_low20_0 + s_394_397 * g_354_low60_40_low20_0 = g_354_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_3 + u_394_397 * (const 64 (2**21)) + v_394_397 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_3 + r_394_397 * (const 64 (2**21)) + s_394_397 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_3,
    f_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_3,
    g_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 397)) <=s delta, delta <=s (const 64 (1 + 2*397)),
    (const 64 (-(2**20))) <=s u_394_397, u_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_397, v_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_397, r_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_397, s_394_397 <=s (const 64 ((2**20)-1)),
    u_394_397 + v_394_397 <=s (const 64 (2**20)),
    u_394_397 - v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 + v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 - v_394_397 <=s (const 64 (2**20)),
    r_394_397 + s_394_397 <=s (const 64 (2**20)),
    r_394_397 - s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 + s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 - s_394_397 <=s (const 64 (2**20)),
    u_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_394_397 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_396_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_2,
sint64 g_354_low60_40_low20_2,
sint64 f_354_low60_40_low20_3,
sint64 g_354_low60_40_low20_3,
sint64 u_394_396,
sint64 v_394_396,
sint64 r_394_396,
sint64 s_394_396,
sint64 u_394_397,
sint64 v_394_397,
sint64 r_394_397,
sint64 s_394_397,
bit ne
)={
    u_394_396 * f_354_low60_40_low20_0 + v_394_396 * g_354_low60_40_low20_0 = f_354_low60_40_low20_2 * (-(2**20)),
    r_394_396 * f_354_low60_40_low20_0 + s_394_396 * g_354_low60_40_low20_0 = g_354_low60_40_low20_2 * (-(2**20))
&&
    u_394_396 * f_354_low60_40_low20_0 + v_394_396 * g_354_low60_40_low20_0 = f_354_low60_40_low20_2 * (const 64 (-(2**20))),
    r_394_396 * f_354_low60_40_low20_0 + s_394_396 * g_354_low60_40_low20_0 = g_354_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_2 + u_394_396 * (const 64 (2**21)) + v_394_396 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_2 + r_394_396 * (const 64 (2**21)) + s_394_396 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_2,
    f_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_2,
    g_354_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 396)) <=s delta, delta <=s (const 64 (1 + 2*396)),
    (const 64 (-(2**20))) <=s u_394_396, u_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_396, v_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_396, r_394_396 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_396, s_394_396 <=s (const 64 ((2**20)-1)),
    u_394_396 + v_394_396 <=s (const 64 (2**20)),
    u_394_396 - v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 + v_394_396 <=s (const 64 (2**20)),
    (const 64 0) - u_394_396 - v_394_396 <=s (const 64 (2**20)),
    r_394_396 + s_394_396 <=s (const 64 (2**20)),
    r_394_396 - s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 + s_394_396 <=s (const 64 (2**20)),
    (const 64 0) - r_394_396 - s_394_396 <=s (const 64 (2**20)),
    u_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_394_396 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_394_396 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step396

// premise c
assume
g_354_low60_40_low20_2 = 1 (mod 2)
&&
g_354_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_3 g_354_low60_40_low20_2;
mov u_394_397 r_394_396;
mov v_394_397 s_394_396;

subs dc g_354_low60_40_low20_3 g_354_low60_40_low20_2 f_354_low60_40_low20_2;
asr g_354_low60_40_low20_3 g_354_low60_40_low20_3 1;
subs dc r_394_397 r_394_396 u_394_396;
asr r_394_397 r_394_397 1;
subs dc s_394_397 s_394_396 v_394_396;
asr s_394_397 s_394_397 1;
assert
    true
&&
    f_354_low60_40_low20_3 = g_354_low60_40_low20_2,
    u_394_397 = r_394_396,
    v_394_397 = s_394_396,
    g_354_low60_40_low20_3 * (const 64 2) = g_354_low60_40_low20_2 - f_354_low60_40_low20_2,
    r_394_397 * (const 64 2) = r_394_396 - u_394_396,
    s_394_397 * (const 64 2) = s_394_396 - v_394_396
;

assume
    f_354_low60_40_low20_3 = g_354_low60_40_low20_2,
    u_394_397 = r_394_396,
    v_394_397 = s_394_396,
    g_354_low60_40_low20_3 * 2 = g_354_low60_40_low20_2 - f_354_low60_40_low20_2,
    r_394_397 * 2 = r_394_396 - u_394_396,
    s_394_397 * 2 = s_394_396 - v_394_396
&&
    true
;

{
    u_394_397 * f_354_low60_40_low20_0 + v_394_397 * g_354_low60_40_low20_0 = f_354_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_397 * f_354_low60_40_low20_0 + s_394_397 * g_354_low60_40_low20_0 = g_354_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_3 + u_394_397 * (const 64 (2**21)) + v_394_397 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_3 + r_394_397 * (const 64 (2**21)) + s_394_397 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_3,
    f_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_3,
    g_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 397)) <=s delta, delta <=s (const 64 (1 + 2*397)),
    (const 64 (-(2**20))) <=s u_394_397, u_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_397, v_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_397, r_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_397, s_394_397 <=s (const 64 ((2**20)-1)),
    u_394_397 + v_394_397 <=s (const 64 (2**20)),
    u_394_397 - v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 + v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 - v_394_397 <=s (const 64 (2**20)),
    r_394_397 + s_394_397 <=s (const 64 (2**20)),
    r_394_397 - s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 + s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 - s_394_397 <=s (const 64 (2**20)),
    u_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_394_397 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_397_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_3,
sint64 g_354_low60_40_low20_3,
sint64 f_354_low60_40_low20_4,
sint64 g_354_low60_40_low20_4,
sint64 u_394_397,
sint64 v_394_397,
sint64 r_394_397,
sint64 s_394_397,
sint64 u_394_398,
sint64 v_394_398,
sint64 r_394_398,
sint64 s_394_398,
bit ne
)={
    u_394_397 * f_354_low60_40_low20_0 + v_394_397 * g_354_low60_40_low20_0 = f_354_low60_40_low20_3 * (-(2**20)),
    r_394_397 * f_354_low60_40_low20_0 + s_394_397 * g_354_low60_40_low20_0 = g_354_low60_40_low20_3 * (-(2**20))
&&
    u_394_397 * f_354_low60_40_low20_0 + v_394_397 * g_354_low60_40_low20_0 = f_354_low60_40_low20_3 * (const 64 (-(2**20))),
    r_394_397 * f_354_low60_40_low20_0 + s_394_397 * g_354_low60_40_low20_0 = g_354_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_3 + u_394_397 * (const 64 (2**21)) + v_394_397 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_3 + r_394_397 * (const 64 (2**21)) + s_394_397 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_3,
    f_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_3,
    g_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 397)) <=s delta, delta <=s (const 64 (1 + 2*397)),
    (const 64 (-(2**20))) <=s u_394_397, u_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_397, v_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_397, r_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_397, s_394_397 <=s (const 64 ((2**20)-1)),
    u_394_397 + v_394_397 <=s (const 64 (2**20)),
    u_394_397 - v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 + v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 - v_394_397 <=s (const 64 (2**20)),
    r_394_397 + s_394_397 <=s (const 64 (2**20)),
    r_394_397 - s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 + s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 - s_394_397 <=s (const 64 (2**20)),
    u_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_394_397 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step397

// premise a
assume
g_354_low60_40_low20_3 = 0 (mod 2)
&&
g_354_low60_40_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_4 f_354_low60_40_low20_3;
mov u_394_398 u_394_397;
mov v_394_398 v_394_397;

asr g_354_low60_40_low20_4 g_354_low60_40_low20_3 1;
asr r_394_398 r_394_397 1;
asr s_394_398 s_394_397 1;
assert
    true
&&
    f_354_low60_40_low20_4 = f_354_low60_40_low20_3,
    u_394_398 = u_394_397,
    v_394_398 = v_394_397,
    g_354_low60_40_low20_4 * (const 64 2) = g_354_low60_40_low20_3,
    r_394_398 * (const 64 2) = r_394_397,
    s_394_398 * (const 64 2) = s_394_397
;

assume
    f_354_low60_40_low20_4 = f_354_low60_40_low20_3,
    u_394_398 = u_394_397,
    v_394_398 = v_394_397,
    g_354_low60_40_low20_4 * 2 = g_354_low60_40_low20_3,
    r_394_398 * 2 = r_394_397,
    s_394_398 * 2 = s_394_397
&&
    true
;

{
    u_394_398 * f_354_low60_40_low20_0 + v_394_398 * g_354_low60_40_low20_0 = f_354_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_398 * f_354_low60_40_low20_0 + s_394_398 * g_354_low60_40_low20_0 = g_354_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_4 + u_394_398 * (const 64 (2**21)) + v_394_398 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_4 + r_394_398 * (const 64 (2**21)) + s_394_398 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_4,
    f_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_4,
    g_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 398)) <=s delta, delta <=s (const 64 (1 + 2*398)),
    (const 64 (-(2**20))) <=s u_394_398, u_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_398, v_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_398, r_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_398, s_394_398 <=s (const 64 ((2**20)-1)),
    u_394_398 + v_394_398 <=s (const 64 (2**20)),
    u_394_398 - v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 + v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 - v_394_398 <=s (const 64 (2**20)),
    r_394_398 + s_394_398 <=s (const 64 (2**20)),
    r_394_398 - s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 + s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 - s_394_398 <=s (const 64 (2**20)),
    u_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_394_398 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_397_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_3,
sint64 g_354_low60_40_low20_3,
sint64 f_354_low60_40_low20_4,
sint64 g_354_low60_40_low20_4,
sint64 u_394_397,
sint64 v_394_397,
sint64 r_394_397,
sint64 s_394_397,
sint64 u_394_398,
sint64 v_394_398,
sint64 r_394_398,
sint64 s_394_398,
bit ne
)={
    u_394_397 * f_354_low60_40_low20_0 + v_394_397 * g_354_low60_40_low20_0 = f_354_low60_40_low20_3 * (-(2**20)),
    r_394_397 * f_354_low60_40_low20_0 + s_394_397 * g_354_low60_40_low20_0 = g_354_low60_40_low20_3 * (-(2**20))
&&
    u_394_397 * f_354_low60_40_low20_0 + v_394_397 * g_354_low60_40_low20_0 = f_354_low60_40_low20_3 * (const 64 (-(2**20))),
    r_394_397 * f_354_low60_40_low20_0 + s_394_397 * g_354_low60_40_low20_0 = g_354_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_3 + u_394_397 * (const 64 (2**21)) + v_394_397 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_3 + r_394_397 * (const 64 (2**21)) + s_394_397 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_3,
    f_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_3,
    g_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 397)) <=s delta, delta <=s (const 64 (1 + 2*397)),
    (const 64 (-(2**20))) <=s u_394_397, u_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_397, v_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_397, r_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_397, s_394_397 <=s (const 64 ((2**20)-1)),
    u_394_397 + v_394_397 <=s (const 64 (2**20)),
    u_394_397 - v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 + v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 - v_394_397 <=s (const 64 (2**20)),
    r_394_397 + s_394_397 <=s (const 64 (2**20)),
    r_394_397 - s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 + s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 - s_394_397 <=s (const 64 (2**20)),
    u_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_394_397 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step397

// premise b
assume
g_354_low60_40_low20_3 = 1 (mod 2)
&&
g_354_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_4 f_354_low60_40_low20_3;
mov u_394_398 u_394_397;
mov v_394_398 v_394_397;

add g_354_low60_40_low20_4 g_354_low60_40_low20_3 f_354_low60_40_low20_3;
asr g_354_low60_40_low20_4 g_354_low60_40_low20_4 1;
add r_394_398 r_394_397 u_394_397;
asr r_394_398 r_394_398 1;
add s_394_398 s_394_397 v_394_397;
asr s_394_398 s_394_398 1;
assert
    true
&&
    f_354_low60_40_low20_4 = f_354_low60_40_low20_3,
    u_394_398 = u_394_397,
    v_394_398 = v_394_397,
    g_354_low60_40_low20_4 * (const 64 2) = g_354_low60_40_low20_3 + f_354_low60_40_low20_3,
    r_394_398 * (const 64 2) = r_394_397 + u_394_397,
    s_394_398 * (const 64 2) = s_394_397 + v_394_397
;

assume
    f_354_low60_40_low20_4 = f_354_low60_40_low20_3,
    u_394_398 = u_394_397,
    v_394_398 = v_394_397,
    g_354_low60_40_low20_4 * 2 = g_354_low60_40_low20_3 + f_354_low60_40_low20_3,
    r_394_398 * 2 = r_394_397 + u_394_397,
    s_394_398 * 2 = s_394_397 + v_394_397
&&
    true
;

{
    u_394_398 * f_354_low60_40_low20_0 + v_394_398 * g_354_low60_40_low20_0 = f_354_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_398 * f_354_low60_40_low20_0 + s_394_398 * g_354_low60_40_low20_0 = g_354_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_4 + u_394_398 * (const 64 (2**21)) + v_394_398 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_4 + r_394_398 * (const 64 (2**21)) + s_394_398 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_4,
    f_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_4,
    g_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 398)) <=s delta, delta <=s (const 64 (1 + 2*398)),
    (const 64 (-(2**20))) <=s u_394_398, u_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_398, v_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_398, r_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_398, s_394_398 <=s (const 64 ((2**20)-1)),
    u_394_398 + v_394_398 <=s (const 64 (2**20)),
    u_394_398 - v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 + v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 - v_394_398 <=s (const 64 (2**20)),
    r_394_398 + s_394_398 <=s (const 64 (2**20)),
    r_394_398 - s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 + s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 - s_394_398 <=s (const 64 (2**20)),
    u_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_394_398 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_397_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_3,
sint64 g_354_low60_40_low20_3,
sint64 f_354_low60_40_low20_4,
sint64 g_354_low60_40_low20_4,
sint64 u_394_397,
sint64 v_394_397,
sint64 r_394_397,
sint64 s_394_397,
sint64 u_394_398,
sint64 v_394_398,
sint64 r_394_398,
sint64 s_394_398,
bit ne
)={
    u_394_397 * f_354_low60_40_low20_0 + v_394_397 * g_354_low60_40_low20_0 = f_354_low60_40_low20_3 * (-(2**20)),
    r_394_397 * f_354_low60_40_low20_0 + s_394_397 * g_354_low60_40_low20_0 = g_354_low60_40_low20_3 * (-(2**20))
&&
    u_394_397 * f_354_low60_40_low20_0 + v_394_397 * g_354_low60_40_low20_0 = f_354_low60_40_low20_3 * (const 64 (-(2**20))),
    r_394_397 * f_354_low60_40_low20_0 + s_394_397 * g_354_low60_40_low20_0 = g_354_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_3 + u_394_397 * (const 64 (2**21)) + v_394_397 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_3 + r_394_397 * (const 64 (2**21)) + s_394_397 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_3,
    f_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_3,
    g_354_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 397)) <=s delta, delta <=s (const 64 (1 + 2*397)),
    (const 64 (-(2**20))) <=s u_394_397, u_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_397, v_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_397, r_394_397 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_397, s_394_397 <=s (const 64 ((2**20)-1)),
    u_394_397 + v_394_397 <=s (const 64 (2**20)),
    u_394_397 - v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 + v_394_397 <=s (const 64 (2**20)),
    (const 64 0) - u_394_397 - v_394_397 <=s (const 64 (2**20)),
    r_394_397 + s_394_397 <=s (const 64 (2**20)),
    r_394_397 - s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 + s_394_397 <=s (const 64 (2**20)),
    (const 64 0) - r_394_397 - s_394_397 <=s (const 64 (2**20)),
    u_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_394_397 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_394_397 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step397

// premise c
assume
g_354_low60_40_low20_3 = 1 (mod 2)
&&
g_354_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_4 g_354_low60_40_low20_3;
mov u_394_398 r_394_397;
mov v_394_398 s_394_397;

subs dc g_354_low60_40_low20_4 g_354_low60_40_low20_3 f_354_low60_40_low20_3;
asr g_354_low60_40_low20_4 g_354_low60_40_low20_4 1;
subs dc r_394_398 r_394_397 u_394_397;
asr r_394_398 r_394_398 1;
subs dc s_394_398 s_394_397 v_394_397;
asr s_394_398 s_394_398 1;
assert
    true
&&
    f_354_low60_40_low20_4 = g_354_low60_40_low20_3,
    u_394_398 = r_394_397,
    v_394_398 = s_394_397,
    g_354_low60_40_low20_4 * (const 64 2) = g_354_low60_40_low20_3 - f_354_low60_40_low20_3,
    r_394_398 * (const 64 2) = r_394_397 - u_394_397,
    s_394_398 * (const 64 2) = s_394_397 - v_394_397
;

assume
    f_354_low60_40_low20_4 = g_354_low60_40_low20_3,
    u_394_398 = r_394_397,
    v_394_398 = s_394_397,
    g_354_low60_40_low20_4 * 2 = g_354_low60_40_low20_3 - f_354_low60_40_low20_3,
    r_394_398 * 2 = r_394_397 - u_394_397,
    s_394_398 * 2 = s_394_397 - v_394_397
&&
    true
;

{
    u_394_398 * f_354_low60_40_low20_0 + v_394_398 * g_354_low60_40_low20_0 = f_354_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_398 * f_354_low60_40_low20_0 + s_394_398 * g_354_low60_40_low20_0 = g_354_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_4 + u_394_398 * (const 64 (2**21)) + v_394_398 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_4 + r_394_398 * (const 64 (2**21)) + s_394_398 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_4,
    f_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_4,
    g_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 398)) <=s delta, delta <=s (const 64 (1 + 2*398)),
    (const 64 (-(2**20))) <=s u_394_398, u_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_398, v_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_398, r_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_398, s_394_398 <=s (const 64 ((2**20)-1)),
    u_394_398 + v_394_398 <=s (const 64 (2**20)),
    u_394_398 - v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 + v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 - v_394_398 <=s (const 64 (2**20)),
    r_394_398 + s_394_398 <=s (const 64 (2**20)),
    r_394_398 - s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 + s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 - s_394_398 <=s (const 64 (2**20)),
    u_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_394_398 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_398_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_4,
sint64 g_354_low60_40_low20_4,
sint64 f_354_low60_40_low20_5,
sint64 g_354_low60_40_low20_5,
sint64 u_394_398,
sint64 v_394_398,
sint64 r_394_398,
sint64 s_394_398,
sint64 u_394_399,
sint64 v_394_399,
sint64 r_394_399,
sint64 s_394_399,
bit ne
)={
    u_394_398 * f_354_low60_40_low20_0 + v_394_398 * g_354_low60_40_low20_0 = f_354_low60_40_low20_4 * (-(2**20)),
    r_394_398 * f_354_low60_40_low20_0 + s_394_398 * g_354_low60_40_low20_0 = g_354_low60_40_low20_4 * (-(2**20))
&&
    u_394_398 * f_354_low60_40_low20_0 + v_394_398 * g_354_low60_40_low20_0 = f_354_low60_40_low20_4 * (const 64 (-(2**20))),
    r_394_398 * f_354_low60_40_low20_0 + s_394_398 * g_354_low60_40_low20_0 = g_354_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_4 + u_394_398 * (const 64 (2**21)) + v_394_398 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_4 + r_394_398 * (const 64 (2**21)) + s_394_398 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_4,
    f_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_4,
    g_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 398)) <=s delta, delta <=s (const 64 (1 + 2*398)),
    (const 64 (-(2**20))) <=s u_394_398, u_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_398, v_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_398, r_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_398, s_394_398 <=s (const 64 ((2**20)-1)),
    u_394_398 + v_394_398 <=s (const 64 (2**20)),
    u_394_398 - v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 + v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 - v_394_398 <=s (const 64 (2**20)),
    r_394_398 + s_394_398 <=s (const 64 (2**20)),
    r_394_398 - s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 + s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 - s_394_398 <=s (const 64 (2**20)),
    u_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_394_398 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step398

// premise a
assume
g_354_low60_40_low20_4 = 0 (mod 2)
&&
g_354_low60_40_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_5 f_354_low60_40_low20_4;
mov u_394_399 u_394_398;
mov v_394_399 v_394_398;

asr g_354_low60_40_low20_5 g_354_low60_40_low20_4 1;
asr r_394_399 r_394_398 1;
asr s_394_399 s_394_398 1;
assert
    true
&&
    f_354_low60_40_low20_5 = f_354_low60_40_low20_4,
    u_394_399 = u_394_398,
    v_394_399 = v_394_398,
    g_354_low60_40_low20_5 * (const 64 2) = g_354_low60_40_low20_4,
    r_394_399 * (const 64 2) = r_394_398,
    s_394_399 * (const 64 2) = s_394_398
;

assume
    f_354_low60_40_low20_5 = f_354_low60_40_low20_4,
    u_394_399 = u_394_398,
    v_394_399 = v_394_398,
    g_354_low60_40_low20_5 * 2 = g_354_low60_40_low20_4,
    r_394_399 * 2 = r_394_398,
    s_394_399 * 2 = s_394_398
&&
    true
;

{
    u_394_399 * f_354_low60_40_low20_0 + v_394_399 * g_354_low60_40_low20_0 = f_354_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_399 * f_354_low60_40_low20_0 + s_394_399 * g_354_low60_40_low20_0 = g_354_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_5 + u_394_399 * (const 64 (2**21)) + v_394_399 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_5 + r_394_399 * (const 64 (2**21)) + s_394_399 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_5,
    f_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_5,
    g_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 399)) <=s delta, delta <=s (const 64 (1 + 2*399)),
    (const 64 (-(2**20))) <=s u_394_399, u_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_399, v_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_399, r_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_399, s_394_399 <=s (const 64 ((2**20)-1)),
    u_394_399 + v_394_399 <=s (const 64 (2**20)),
    u_394_399 - v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 + v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 - v_394_399 <=s (const 64 (2**20)),
    r_394_399 + s_394_399 <=s (const 64 (2**20)),
    r_394_399 - s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 + s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 - s_394_399 <=s (const 64 (2**20)),
    u_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_394_399 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_398_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_4,
sint64 g_354_low60_40_low20_4,
sint64 f_354_low60_40_low20_5,
sint64 g_354_low60_40_low20_5,
sint64 u_394_398,
sint64 v_394_398,
sint64 r_394_398,
sint64 s_394_398,
sint64 u_394_399,
sint64 v_394_399,
sint64 r_394_399,
sint64 s_394_399,
bit ne
)={
    u_394_398 * f_354_low60_40_low20_0 + v_394_398 * g_354_low60_40_low20_0 = f_354_low60_40_low20_4 * (-(2**20)),
    r_394_398 * f_354_low60_40_low20_0 + s_394_398 * g_354_low60_40_low20_0 = g_354_low60_40_low20_4 * (-(2**20))
&&
    u_394_398 * f_354_low60_40_low20_0 + v_394_398 * g_354_low60_40_low20_0 = f_354_low60_40_low20_4 * (const 64 (-(2**20))),
    r_394_398 * f_354_low60_40_low20_0 + s_394_398 * g_354_low60_40_low20_0 = g_354_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_4 + u_394_398 * (const 64 (2**21)) + v_394_398 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_4 + r_394_398 * (const 64 (2**21)) + s_394_398 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_4,
    f_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_4,
    g_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 398)) <=s delta, delta <=s (const 64 (1 + 2*398)),
    (const 64 (-(2**20))) <=s u_394_398, u_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_398, v_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_398, r_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_398, s_394_398 <=s (const 64 ((2**20)-1)),
    u_394_398 + v_394_398 <=s (const 64 (2**20)),
    u_394_398 - v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 + v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 - v_394_398 <=s (const 64 (2**20)),
    r_394_398 + s_394_398 <=s (const 64 (2**20)),
    r_394_398 - s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 + s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 - s_394_398 <=s (const 64 (2**20)),
    u_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_394_398 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step398

// premise b
assume
g_354_low60_40_low20_4 = 1 (mod 2)
&&
g_354_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_5 f_354_low60_40_low20_4;
mov u_394_399 u_394_398;
mov v_394_399 v_394_398;

add g_354_low60_40_low20_5 g_354_low60_40_low20_4 f_354_low60_40_low20_4;
asr g_354_low60_40_low20_5 g_354_low60_40_low20_5 1;
add r_394_399 r_394_398 u_394_398;
asr r_394_399 r_394_399 1;
add s_394_399 s_394_398 v_394_398;
asr s_394_399 s_394_399 1;
assert
    true
&&
    f_354_low60_40_low20_5 = f_354_low60_40_low20_4,
    u_394_399 = u_394_398,
    v_394_399 = v_394_398,
    g_354_low60_40_low20_5 * (const 64 2) = g_354_low60_40_low20_4 + f_354_low60_40_low20_4,
    r_394_399 * (const 64 2) = r_394_398 + u_394_398,
    s_394_399 * (const 64 2) = s_394_398 + v_394_398
;

assume
    f_354_low60_40_low20_5 = f_354_low60_40_low20_4,
    u_394_399 = u_394_398,
    v_394_399 = v_394_398,
    g_354_low60_40_low20_5 * 2 = g_354_low60_40_low20_4 + f_354_low60_40_low20_4,
    r_394_399 * 2 = r_394_398 + u_394_398,
    s_394_399 * 2 = s_394_398 + v_394_398
&&
    true
;

{
    u_394_399 * f_354_low60_40_low20_0 + v_394_399 * g_354_low60_40_low20_0 = f_354_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_399 * f_354_low60_40_low20_0 + s_394_399 * g_354_low60_40_low20_0 = g_354_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_5 + u_394_399 * (const 64 (2**21)) + v_394_399 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_5 + r_394_399 * (const 64 (2**21)) + s_394_399 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_5,
    f_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_5,
    g_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 399)) <=s delta, delta <=s (const 64 (1 + 2*399)),
    (const 64 (-(2**20))) <=s u_394_399, u_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_399, v_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_399, r_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_399, s_394_399 <=s (const 64 ((2**20)-1)),
    u_394_399 + v_394_399 <=s (const 64 (2**20)),
    u_394_399 - v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 + v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 - v_394_399 <=s (const 64 (2**20)),
    r_394_399 + s_394_399 <=s (const 64 (2**20)),
    r_394_399 - s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 + s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 - s_394_399 <=s (const 64 (2**20)),
    u_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_394_399 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_398_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_4,
sint64 g_354_low60_40_low20_4,
sint64 f_354_low60_40_low20_5,
sint64 g_354_low60_40_low20_5,
sint64 u_394_398,
sint64 v_394_398,
sint64 r_394_398,
sint64 s_394_398,
sint64 u_394_399,
sint64 v_394_399,
sint64 r_394_399,
sint64 s_394_399,
bit ne
)={
    u_394_398 * f_354_low60_40_low20_0 + v_394_398 * g_354_low60_40_low20_0 = f_354_low60_40_low20_4 * (-(2**20)),
    r_394_398 * f_354_low60_40_low20_0 + s_394_398 * g_354_low60_40_low20_0 = g_354_low60_40_low20_4 * (-(2**20))
&&
    u_394_398 * f_354_low60_40_low20_0 + v_394_398 * g_354_low60_40_low20_0 = f_354_low60_40_low20_4 * (const 64 (-(2**20))),
    r_394_398 * f_354_low60_40_low20_0 + s_394_398 * g_354_low60_40_low20_0 = g_354_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_4 + u_394_398 * (const 64 (2**21)) + v_394_398 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_4 + r_394_398 * (const 64 (2**21)) + s_394_398 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_4,
    f_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_4,
    g_354_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 398)) <=s delta, delta <=s (const 64 (1 + 2*398)),
    (const 64 (-(2**20))) <=s u_394_398, u_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_398, v_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_398, r_394_398 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_398, s_394_398 <=s (const 64 ((2**20)-1)),
    u_394_398 + v_394_398 <=s (const 64 (2**20)),
    u_394_398 - v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 + v_394_398 <=s (const 64 (2**20)),
    (const 64 0) - u_394_398 - v_394_398 <=s (const 64 (2**20)),
    r_394_398 + s_394_398 <=s (const 64 (2**20)),
    r_394_398 - s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 + s_394_398 <=s (const 64 (2**20)),
    (const 64 0) - r_394_398 - s_394_398 <=s (const 64 (2**20)),
    u_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_394_398 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_394_398 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step398

// premise c
assume
g_354_low60_40_low20_4 = 1 (mod 2)
&&
g_354_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_5 g_354_low60_40_low20_4;
mov u_394_399 r_394_398;
mov v_394_399 s_394_398;

subs dc g_354_low60_40_low20_5 g_354_low60_40_low20_4 f_354_low60_40_low20_4;
asr g_354_low60_40_low20_5 g_354_low60_40_low20_5 1;
subs dc r_394_399 r_394_398 u_394_398;
asr r_394_399 r_394_399 1;
subs dc s_394_399 s_394_398 v_394_398;
asr s_394_399 s_394_399 1;
assert
    true
&&
    f_354_low60_40_low20_5 = g_354_low60_40_low20_4,
    u_394_399 = r_394_398,
    v_394_399 = s_394_398,
    g_354_low60_40_low20_5 * (const 64 2) = g_354_low60_40_low20_4 - f_354_low60_40_low20_4,
    r_394_399 * (const 64 2) = r_394_398 - u_394_398,
    s_394_399 * (const 64 2) = s_394_398 - v_394_398
;

assume
    f_354_low60_40_low20_5 = g_354_low60_40_low20_4,
    u_394_399 = r_394_398,
    v_394_399 = s_394_398,
    g_354_low60_40_low20_5 * 2 = g_354_low60_40_low20_4 - f_354_low60_40_low20_4,
    r_394_399 * 2 = r_394_398 - u_394_398,
    s_394_399 * 2 = s_394_398 - v_394_398
&&
    true
;

{
    u_394_399 * f_354_low60_40_low20_0 + v_394_399 * g_354_low60_40_low20_0 = f_354_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_399 * f_354_low60_40_low20_0 + s_394_399 * g_354_low60_40_low20_0 = g_354_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_5 + u_394_399 * (const 64 (2**21)) + v_394_399 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_5 + r_394_399 * (const 64 (2**21)) + s_394_399 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_5,
    f_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_5,
    g_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 399)) <=s delta, delta <=s (const 64 (1 + 2*399)),
    (const 64 (-(2**20))) <=s u_394_399, u_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_399, v_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_399, r_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_399, s_394_399 <=s (const 64 ((2**20)-1)),
    u_394_399 + v_394_399 <=s (const 64 (2**20)),
    u_394_399 - v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 + v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 - v_394_399 <=s (const 64 (2**20)),
    r_394_399 + s_394_399 <=s (const 64 (2**20)),
    r_394_399 - s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 + s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 - s_394_399 <=s (const 64 (2**20)),
    u_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_394_399 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_399_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_5,
sint64 g_354_low60_40_low20_5,
sint64 f_354_low60_40_low20_6,
sint64 g_354_low60_40_low20_6,
sint64 u_394_399,
sint64 v_394_399,
sint64 r_394_399,
sint64 s_394_399,
sint64 u_394_400,
sint64 v_394_400,
sint64 r_394_400,
sint64 s_394_400,
bit ne
)={
    u_394_399 * f_354_low60_40_low20_0 + v_394_399 * g_354_low60_40_low20_0 = f_354_low60_40_low20_5 * (-(2**20)),
    r_394_399 * f_354_low60_40_low20_0 + s_394_399 * g_354_low60_40_low20_0 = g_354_low60_40_low20_5 * (-(2**20))
&&
    u_394_399 * f_354_low60_40_low20_0 + v_394_399 * g_354_low60_40_low20_0 = f_354_low60_40_low20_5 * (const 64 (-(2**20))),
    r_394_399 * f_354_low60_40_low20_0 + s_394_399 * g_354_low60_40_low20_0 = g_354_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_5 + u_394_399 * (const 64 (2**21)) + v_394_399 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_5 + r_394_399 * (const 64 (2**21)) + s_394_399 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_5,
    f_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_5,
    g_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 399)) <=s delta, delta <=s (const 64 (1 + 2*399)),
    (const 64 (-(2**20))) <=s u_394_399, u_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_399, v_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_399, r_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_399, s_394_399 <=s (const 64 ((2**20)-1)),
    u_394_399 + v_394_399 <=s (const 64 (2**20)),
    u_394_399 - v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 + v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 - v_394_399 <=s (const 64 (2**20)),
    r_394_399 + s_394_399 <=s (const 64 (2**20)),
    r_394_399 - s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 + s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 - s_394_399 <=s (const 64 (2**20)),
    u_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_394_399 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step399

// premise a
assume
g_354_low60_40_low20_5 = 0 (mod 2)
&&
g_354_low60_40_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_6 f_354_low60_40_low20_5;
mov u_394_400 u_394_399;
mov v_394_400 v_394_399;

asr g_354_low60_40_low20_6 g_354_low60_40_low20_5 1;
asr r_394_400 r_394_399 1;
asr s_394_400 s_394_399 1;
assert
    true
&&
    f_354_low60_40_low20_6 = f_354_low60_40_low20_5,
    u_394_400 = u_394_399,
    v_394_400 = v_394_399,
    g_354_low60_40_low20_6 * (const 64 2) = g_354_low60_40_low20_5,
    r_394_400 * (const 64 2) = r_394_399,
    s_394_400 * (const 64 2) = s_394_399
;

assume
    f_354_low60_40_low20_6 = f_354_low60_40_low20_5,
    u_394_400 = u_394_399,
    v_394_400 = v_394_399,
    g_354_low60_40_low20_6 * 2 = g_354_low60_40_low20_5,
    r_394_400 * 2 = r_394_399,
    s_394_400 * 2 = s_394_399
&&
    true
;

{
    u_394_400 * f_354_low60_40_low20_0 + v_394_400 * g_354_low60_40_low20_0 = f_354_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_400 * f_354_low60_40_low20_0 + s_394_400 * g_354_low60_40_low20_0 = g_354_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_6 + u_394_400 * (const 64 (2**21)) + v_394_400 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_6 + r_394_400 * (const 64 (2**21)) + s_394_400 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_6,
    f_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_6,
    g_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 400)) <=s delta, delta <=s (const 64 (1 + 2*400)),
    (const 64 (-(2**20))) <=s u_394_400, u_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_400, v_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_400, r_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_400, s_394_400 <=s (const 64 ((2**20)-1)),
    u_394_400 + v_394_400 <=s (const 64 (2**20)),
    u_394_400 - v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 + v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 - v_394_400 <=s (const 64 (2**20)),
    r_394_400 + s_394_400 <=s (const 64 (2**20)),
    r_394_400 - s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 + s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 - s_394_400 <=s (const 64 (2**20)),
    u_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_394_400 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_399_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_5,
sint64 g_354_low60_40_low20_5,
sint64 f_354_low60_40_low20_6,
sint64 g_354_low60_40_low20_6,
sint64 u_394_399,
sint64 v_394_399,
sint64 r_394_399,
sint64 s_394_399,
sint64 u_394_400,
sint64 v_394_400,
sint64 r_394_400,
sint64 s_394_400,
bit ne
)={
    u_394_399 * f_354_low60_40_low20_0 + v_394_399 * g_354_low60_40_low20_0 = f_354_low60_40_low20_5 * (-(2**20)),
    r_394_399 * f_354_low60_40_low20_0 + s_394_399 * g_354_low60_40_low20_0 = g_354_low60_40_low20_5 * (-(2**20))
&&
    u_394_399 * f_354_low60_40_low20_0 + v_394_399 * g_354_low60_40_low20_0 = f_354_low60_40_low20_5 * (const 64 (-(2**20))),
    r_394_399 * f_354_low60_40_low20_0 + s_394_399 * g_354_low60_40_low20_0 = g_354_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_5 + u_394_399 * (const 64 (2**21)) + v_394_399 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_5 + r_394_399 * (const 64 (2**21)) + s_394_399 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_5,
    f_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_5,
    g_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 399)) <=s delta, delta <=s (const 64 (1 + 2*399)),
    (const 64 (-(2**20))) <=s u_394_399, u_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_399, v_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_399, r_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_399, s_394_399 <=s (const 64 ((2**20)-1)),
    u_394_399 + v_394_399 <=s (const 64 (2**20)),
    u_394_399 - v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 + v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 - v_394_399 <=s (const 64 (2**20)),
    r_394_399 + s_394_399 <=s (const 64 (2**20)),
    r_394_399 - s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 + s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 - s_394_399 <=s (const 64 (2**20)),
    u_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_394_399 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step399

// premise b
assume
g_354_low60_40_low20_5 = 1 (mod 2)
&&
g_354_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_6 f_354_low60_40_low20_5;
mov u_394_400 u_394_399;
mov v_394_400 v_394_399;

add g_354_low60_40_low20_6 g_354_low60_40_low20_5 f_354_low60_40_low20_5;
asr g_354_low60_40_low20_6 g_354_low60_40_low20_6 1;
add r_394_400 r_394_399 u_394_399;
asr r_394_400 r_394_400 1;
add s_394_400 s_394_399 v_394_399;
asr s_394_400 s_394_400 1;
assert
    true
&&
    f_354_low60_40_low20_6 = f_354_low60_40_low20_5,
    u_394_400 = u_394_399,
    v_394_400 = v_394_399,
    g_354_low60_40_low20_6 * (const 64 2) = g_354_low60_40_low20_5 + f_354_low60_40_low20_5,
    r_394_400 * (const 64 2) = r_394_399 + u_394_399,
    s_394_400 * (const 64 2) = s_394_399 + v_394_399
;

assume
    f_354_low60_40_low20_6 = f_354_low60_40_low20_5,
    u_394_400 = u_394_399,
    v_394_400 = v_394_399,
    g_354_low60_40_low20_6 * 2 = g_354_low60_40_low20_5 + f_354_low60_40_low20_5,
    r_394_400 * 2 = r_394_399 + u_394_399,
    s_394_400 * 2 = s_394_399 + v_394_399
&&
    true
;

{
    u_394_400 * f_354_low60_40_low20_0 + v_394_400 * g_354_low60_40_low20_0 = f_354_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_400 * f_354_low60_40_low20_0 + s_394_400 * g_354_low60_40_low20_0 = g_354_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_6 + u_394_400 * (const 64 (2**21)) + v_394_400 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_6 + r_394_400 * (const 64 (2**21)) + s_394_400 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_6,
    f_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_6,
    g_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 400)) <=s delta, delta <=s (const 64 (1 + 2*400)),
    (const 64 (-(2**20))) <=s u_394_400, u_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_400, v_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_400, r_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_400, s_394_400 <=s (const 64 ((2**20)-1)),
    u_394_400 + v_394_400 <=s (const 64 (2**20)),
    u_394_400 - v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 + v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 - v_394_400 <=s (const 64 (2**20)),
    r_394_400 + s_394_400 <=s (const 64 (2**20)),
    r_394_400 - s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 + s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 - s_394_400 <=s (const 64 (2**20)),
    u_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_394_400 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_399_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_5,
sint64 g_354_low60_40_low20_5,
sint64 f_354_low60_40_low20_6,
sint64 g_354_low60_40_low20_6,
sint64 u_394_399,
sint64 v_394_399,
sint64 r_394_399,
sint64 s_394_399,
sint64 u_394_400,
sint64 v_394_400,
sint64 r_394_400,
sint64 s_394_400,
bit ne
)={
    u_394_399 * f_354_low60_40_low20_0 + v_394_399 * g_354_low60_40_low20_0 = f_354_low60_40_low20_5 * (-(2**20)),
    r_394_399 * f_354_low60_40_low20_0 + s_394_399 * g_354_low60_40_low20_0 = g_354_low60_40_low20_5 * (-(2**20))
&&
    u_394_399 * f_354_low60_40_low20_0 + v_394_399 * g_354_low60_40_low20_0 = f_354_low60_40_low20_5 * (const 64 (-(2**20))),
    r_394_399 * f_354_low60_40_low20_0 + s_394_399 * g_354_low60_40_low20_0 = g_354_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_5 + u_394_399 * (const 64 (2**21)) + v_394_399 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_5 + r_394_399 * (const 64 (2**21)) + s_394_399 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_5,
    f_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_5,
    g_354_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 399)) <=s delta, delta <=s (const 64 (1 + 2*399)),
    (const 64 (-(2**20))) <=s u_394_399, u_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_399, v_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_399, r_394_399 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_399, s_394_399 <=s (const 64 ((2**20)-1)),
    u_394_399 + v_394_399 <=s (const 64 (2**20)),
    u_394_399 - v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 + v_394_399 <=s (const 64 (2**20)),
    (const 64 0) - u_394_399 - v_394_399 <=s (const 64 (2**20)),
    r_394_399 + s_394_399 <=s (const 64 (2**20)),
    r_394_399 - s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 + s_394_399 <=s (const 64 (2**20)),
    (const 64 0) - r_394_399 - s_394_399 <=s (const 64 (2**20)),
    u_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_394_399 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_394_399 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step399

// premise c
assume
g_354_low60_40_low20_5 = 1 (mod 2)
&&
g_354_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_6 g_354_low60_40_low20_5;
mov u_394_400 r_394_399;
mov v_394_400 s_394_399;

subs dc g_354_low60_40_low20_6 g_354_low60_40_low20_5 f_354_low60_40_low20_5;
asr g_354_low60_40_low20_6 g_354_low60_40_low20_6 1;
subs dc r_394_400 r_394_399 u_394_399;
asr r_394_400 r_394_400 1;
subs dc s_394_400 s_394_399 v_394_399;
asr s_394_400 s_394_400 1;
assert
    true
&&
    f_354_low60_40_low20_6 = g_354_low60_40_low20_5,
    u_394_400 = r_394_399,
    v_394_400 = s_394_399,
    g_354_low60_40_low20_6 * (const 64 2) = g_354_low60_40_low20_5 - f_354_low60_40_low20_5,
    r_394_400 * (const 64 2) = r_394_399 - u_394_399,
    s_394_400 * (const 64 2) = s_394_399 - v_394_399
;

assume
    f_354_low60_40_low20_6 = g_354_low60_40_low20_5,
    u_394_400 = r_394_399,
    v_394_400 = s_394_399,
    g_354_low60_40_low20_6 * 2 = g_354_low60_40_low20_5 - f_354_low60_40_low20_5,
    r_394_400 * 2 = r_394_399 - u_394_399,
    s_394_400 * 2 = s_394_399 - v_394_399
&&
    true
;

{
    u_394_400 * f_354_low60_40_low20_0 + v_394_400 * g_354_low60_40_low20_0 = f_354_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_400 * f_354_low60_40_low20_0 + s_394_400 * g_354_low60_40_low20_0 = g_354_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_6 + u_394_400 * (const 64 (2**21)) + v_394_400 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_6 + r_394_400 * (const 64 (2**21)) + s_394_400 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_6,
    f_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_6,
    g_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 400)) <=s delta, delta <=s (const 64 (1 + 2*400)),
    (const 64 (-(2**20))) <=s u_394_400, u_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_400, v_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_400, r_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_400, s_394_400 <=s (const 64 ((2**20)-1)),
    u_394_400 + v_394_400 <=s (const 64 (2**20)),
    u_394_400 - v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 + v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 - v_394_400 <=s (const 64 (2**20)),
    r_394_400 + s_394_400 <=s (const 64 (2**20)),
    r_394_400 - s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 + s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 - s_394_400 <=s (const 64 (2**20)),
    u_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_394_400 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_400_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_6,
sint64 g_354_low60_40_low20_6,
sint64 f_354_low60_40_low20_7,
sint64 g_354_low60_40_low20_7,
sint64 u_394_400,
sint64 v_394_400,
sint64 r_394_400,
sint64 s_394_400,
sint64 u_394_401,
sint64 v_394_401,
sint64 r_394_401,
sint64 s_394_401,
bit ne
)={
    u_394_400 * f_354_low60_40_low20_0 + v_394_400 * g_354_low60_40_low20_0 = f_354_low60_40_low20_6 * (-(2**20)),
    r_394_400 * f_354_low60_40_low20_0 + s_394_400 * g_354_low60_40_low20_0 = g_354_low60_40_low20_6 * (-(2**20))
&&
    u_394_400 * f_354_low60_40_low20_0 + v_394_400 * g_354_low60_40_low20_0 = f_354_low60_40_low20_6 * (const 64 (-(2**20))),
    r_394_400 * f_354_low60_40_low20_0 + s_394_400 * g_354_low60_40_low20_0 = g_354_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_6 + u_394_400 * (const 64 (2**21)) + v_394_400 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_6 + r_394_400 * (const 64 (2**21)) + s_394_400 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_6,
    f_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_6,
    g_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 400)) <=s delta, delta <=s (const 64 (1 + 2*400)),
    (const 64 (-(2**20))) <=s u_394_400, u_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_400, v_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_400, r_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_400, s_394_400 <=s (const 64 ((2**20)-1)),
    u_394_400 + v_394_400 <=s (const 64 (2**20)),
    u_394_400 - v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 + v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 - v_394_400 <=s (const 64 (2**20)),
    r_394_400 + s_394_400 <=s (const 64 (2**20)),
    r_394_400 - s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 + s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 - s_394_400 <=s (const 64 (2**20)),
    u_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_394_400 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step400

// premise a
assume
g_354_low60_40_low20_6 = 0 (mod 2)
&&
g_354_low60_40_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_7 f_354_low60_40_low20_6;
mov u_394_401 u_394_400;
mov v_394_401 v_394_400;

asr g_354_low60_40_low20_7 g_354_low60_40_low20_6 1;
asr r_394_401 r_394_400 1;
asr s_394_401 s_394_400 1;
assert
    true
&&
    f_354_low60_40_low20_7 = f_354_low60_40_low20_6,
    u_394_401 = u_394_400,
    v_394_401 = v_394_400,
    g_354_low60_40_low20_7 * (const 64 2) = g_354_low60_40_low20_6,
    r_394_401 * (const 64 2) = r_394_400,
    s_394_401 * (const 64 2) = s_394_400
;

assume
    f_354_low60_40_low20_7 = f_354_low60_40_low20_6,
    u_394_401 = u_394_400,
    v_394_401 = v_394_400,
    g_354_low60_40_low20_7 * 2 = g_354_low60_40_low20_6,
    r_394_401 * 2 = r_394_400,
    s_394_401 * 2 = s_394_400
&&
    true
;

{
    u_394_401 * f_354_low60_40_low20_0 + v_394_401 * g_354_low60_40_low20_0 = f_354_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_401 * f_354_low60_40_low20_0 + s_394_401 * g_354_low60_40_low20_0 = g_354_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_7 + u_394_401 * (const 64 (2**21)) + v_394_401 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_7 + r_394_401 * (const 64 (2**21)) + s_394_401 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_7,
    f_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_7,
    g_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 401)) <=s delta, delta <=s (const 64 (1 + 2*401)),
    (const 64 (-(2**20))) <=s u_394_401, u_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_401, v_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_401, r_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_401, s_394_401 <=s (const 64 ((2**20)-1)),
    u_394_401 + v_394_401 <=s (const 64 (2**20)),
    u_394_401 - v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 + v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 - v_394_401 <=s (const 64 (2**20)),
    r_394_401 + s_394_401 <=s (const 64 (2**20)),
    r_394_401 - s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 + s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 - s_394_401 <=s (const 64 (2**20)),
    u_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_394_401 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_400_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_6,
sint64 g_354_low60_40_low20_6,
sint64 f_354_low60_40_low20_7,
sint64 g_354_low60_40_low20_7,
sint64 u_394_400,
sint64 v_394_400,
sint64 r_394_400,
sint64 s_394_400,
sint64 u_394_401,
sint64 v_394_401,
sint64 r_394_401,
sint64 s_394_401,
bit ne
)={
    u_394_400 * f_354_low60_40_low20_0 + v_394_400 * g_354_low60_40_low20_0 = f_354_low60_40_low20_6 * (-(2**20)),
    r_394_400 * f_354_low60_40_low20_0 + s_394_400 * g_354_low60_40_low20_0 = g_354_low60_40_low20_6 * (-(2**20))
&&
    u_394_400 * f_354_low60_40_low20_0 + v_394_400 * g_354_low60_40_low20_0 = f_354_low60_40_low20_6 * (const 64 (-(2**20))),
    r_394_400 * f_354_low60_40_low20_0 + s_394_400 * g_354_low60_40_low20_0 = g_354_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_6 + u_394_400 * (const 64 (2**21)) + v_394_400 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_6 + r_394_400 * (const 64 (2**21)) + s_394_400 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_6,
    f_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_6,
    g_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 400)) <=s delta, delta <=s (const 64 (1 + 2*400)),
    (const 64 (-(2**20))) <=s u_394_400, u_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_400, v_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_400, r_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_400, s_394_400 <=s (const 64 ((2**20)-1)),
    u_394_400 + v_394_400 <=s (const 64 (2**20)),
    u_394_400 - v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 + v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 - v_394_400 <=s (const 64 (2**20)),
    r_394_400 + s_394_400 <=s (const 64 (2**20)),
    r_394_400 - s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 + s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 - s_394_400 <=s (const 64 (2**20)),
    u_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_394_400 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step400

// premise b
assume
g_354_low60_40_low20_6 = 1 (mod 2)
&&
g_354_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_7 f_354_low60_40_low20_6;
mov u_394_401 u_394_400;
mov v_394_401 v_394_400;

add g_354_low60_40_low20_7 g_354_low60_40_low20_6 f_354_low60_40_low20_6;
asr g_354_low60_40_low20_7 g_354_low60_40_low20_7 1;
add r_394_401 r_394_400 u_394_400;
asr r_394_401 r_394_401 1;
add s_394_401 s_394_400 v_394_400;
asr s_394_401 s_394_401 1;
assert
    true
&&
    f_354_low60_40_low20_7 = f_354_low60_40_low20_6,
    u_394_401 = u_394_400,
    v_394_401 = v_394_400,
    g_354_low60_40_low20_7 * (const 64 2) = g_354_low60_40_low20_6 + f_354_low60_40_low20_6,
    r_394_401 * (const 64 2) = r_394_400 + u_394_400,
    s_394_401 * (const 64 2) = s_394_400 + v_394_400
;

assume
    f_354_low60_40_low20_7 = f_354_low60_40_low20_6,
    u_394_401 = u_394_400,
    v_394_401 = v_394_400,
    g_354_low60_40_low20_7 * 2 = g_354_low60_40_low20_6 + f_354_low60_40_low20_6,
    r_394_401 * 2 = r_394_400 + u_394_400,
    s_394_401 * 2 = s_394_400 + v_394_400
&&
    true
;

{
    u_394_401 * f_354_low60_40_low20_0 + v_394_401 * g_354_low60_40_low20_0 = f_354_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_401 * f_354_low60_40_low20_0 + s_394_401 * g_354_low60_40_low20_0 = g_354_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_7 + u_394_401 * (const 64 (2**21)) + v_394_401 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_7 + r_394_401 * (const 64 (2**21)) + s_394_401 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_7,
    f_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_7,
    g_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 401)) <=s delta, delta <=s (const 64 (1 + 2*401)),
    (const 64 (-(2**20))) <=s u_394_401, u_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_401, v_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_401, r_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_401, s_394_401 <=s (const 64 ((2**20)-1)),
    u_394_401 + v_394_401 <=s (const 64 (2**20)),
    u_394_401 - v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 + v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 - v_394_401 <=s (const 64 (2**20)),
    r_394_401 + s_394_401 <=s (const 64 (2**20)),
    r_394_401 - s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 + s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 - s_394_401 <=s (const 64 (2**20)),
    u_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_394_401 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_400_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_6,
sint64 g_354_low60_40_low20_6,
sint64 f_354_low60_40_low20_7,
sint64 g_354_low60_40_low20_7,
sint64 u_394_400,
sint64 v_394_400,
sint64 r_394_400,
sint64 s_394_400,
sint64 u_394_401,
sint64 v_394_401,
sint64 r_394_401,
sint64 s_394_401,
bit ne
)={
    u_394_400 * f_354_low60_40_low20_0 + v_394_400 * g_354_low60_40_low20_0 = f_354_low60_40_low20_6 * (-(2**20)),
    r_394_400 * f_354_low60_40_low20_0 + s_394_400 * g_354_low60_40_low20_0 = g_354_low60_40_low20_6 * (-(2**20))
&&
    u_394_400 * f_354_low60_40_low20_0 + v_394_400 * g_354_low60_40_low20_0 = f_354_low60_40_low20_6 * (const 64 (-(2**20))),
    r_394_400 * f_354_low60_40_low20_0 + s_394_400 * g_354_low60_40_low20_0 = g_354_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_6 + u_394_400 * (const 64 (2**21)) + v_394_400 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_6 + r_394_400 * (const 64 (2**21)) + s_394_400 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_6,
    f_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_6,
    g_354_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 400)) <=s delta, delta <=s (const 64 (1 + 2*400)),
    (const 64 (-(2**20))) <=s u_394_400, u_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_400, v_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_400, r_394_400 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_400, s_394_400 <=s (const 64 ((2**20)-1)),
    u_394_400 + v_394_400 <=s (const 64 (2**20)),
    u_394_400 - v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 + v_394_400 <=s (const 64 (2**20)),
    (const 64 0) - u_394_400 - v_394_400 <=s (const 64 (2**20)),
    r_394_400 + s_394_400 <=s (const 64 (2**20)),
    r_394_400 - s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 + s_394_400 <=s (const 64 (2**20)),
    (const 64 0) - r_394_400 - s_394_400 <=s (const 64 (2**20)),
    u_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_394_400 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_394_400 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step400

// premise c
assume
g_354_low60_40_low20_6 = 1 (mod 2)
&&
g_354_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_7 g_354_low60_40_low20_6;
mov u_394_401 r_394_400;
mov v_394_401 s_394_400;

subs dc g_354_low60_40_low20_7 g_354_low60_40_low20_6 f_354_low60_40_low20_6;
asr g_354_low60_40_low20_7 g_354_low60_40_low20_7 1;
subs dc r_394_401 r_394_400 u_394_400;
asr r_394_401 r_394_401 1;
subs dc s_394_401 s_394_400 v_394_400;
asr s_394_401 s_394_401 1;
assert
    true
&&
    f_354_low60_40_low20_7 = g_354_low60_40_low20_6,
    u_394_401 = r_394_400,
    v_394_401 = s_394_400,
    g_354_low60_40_low20_7 * (const 64 2) = g_354_low60_40_low20_6 - f_354_low60_40_low20_6,
    r_394_401 * (const 64 2) = r_394_400 - u_394_400,
    s_394_401 * (const 64 2) = s_394_400 - v_394_400
;

assume
    f_354_low60_40_low20_7 = g_354_low60_40_low20_6,
    u_394_401 = r_394_400,
    v_394_401 = s_394_400,
    g_354_low60_40_low20_7 * 2 = g_354_low60_40_low20_6 - f_354_low60_40_low20_6,
    r_394_401 * 2 = r_394_400 - u_394_400,
    s_394_401 * 2 = s_394_400 - v_394_400
&&
    true
;

{
    u_394_401 * f_354_low60_40_low20_0 + v_394_401 * g_354_low60_40_low20_0 = f_354_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_401 * f_354_low60_40_low20_0 + s_394_401 * g_354_low60_40_low20_0 = g_354_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_7 + u_394_401 * (const 64 (2**21)) + v_394_401 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_7 + r_394_401 * (const 64 (2**21)) + s_394_401 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_7,
    f_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_7,
    g_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 401)) <=s delta, delta <=s (const 64 (1 + 2*401)),
    (const 64 (-(2**20))) <=s u_394_401, u_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_401, v_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_401, r_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_401, s_394_401 <=s (const 64 ((2**20)-1)),
    u_394_401 + v_394_401 <=s (const 64 (2**20)),
    u_394_401 - v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 + v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 - v_394_401 <=s (const 64 (2**20)),
    r_394_401 + s_394_401 <=s (const 64 (2**20)),
    r_394_401 - s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 + s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 - s_394_401 <=s (const 64 (2**20)),
    u_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_394_401 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_401_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_7,
sint64 g_354_low60_40_low20_7,
sint64 f_354_low60_40_low20_8,
sint64 g_354_low60_40_low20_8,
sint64 u_394_401,
sint64 v_394_401,
sint64 r_394_401,
sint64 s_394_401,
sint64 u_394_402,
sint64 v_394_402,
sint64 r_394_402,
sint64 s_394_402,
bit ne
)={
    u_394_401 * f_354_low60_40_low20_0 + v_394_401 * g_354_low60_40_low20_0 = f_354_low60_40_low20_7 * (-(2**20)),
    r_394_401 * f_354_low60_40_low20_0 + s_394_401 * g_354_low60_40_low20_0 = g_354_low60_40_low20_7 * (-(2**20))
&&
    u_394_401 * f_354_low60_40_low20_0 + v_394_401 * g_354_low60_40_low20_0 = f_354_low60_40_low20_7 * (const 64 (-(2**20))),
    r_394_401 * f_354_low60_40_low20_0 + s_394_401 * g_354_low60_40_low20_0 = g_354_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_7 + u_394_401 * (const 64 (2**21)) + v_394_401 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_7 + r_394_401 * (const 64 (2**21)) + s_394_401 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_7,
    f_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_7,
    g_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 401)) <=s delta, delta <=s (const 64 (1 + 2*401)),
    (const 64 (-(2**20))) <=s u_394_401, u_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_401, v_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_401, r_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_401, s_394_401 <=s (const 64 ((2**20)-1)),
    u_394_401 + v_394_401 <=s (const 64 (2**20)),
    u_394_401 - v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 + v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 - v_394_401 <=s (const 64 (2**20)),
    r_394_401 + s_394_401 <=s (const 64 (2**20)),
    r_394_401 - s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 + s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 - s_394_401 <=s (const 64 (2**20)),
    u_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_394_401 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step401

// premise a
assume
g_354_low60_40_low20_7 = 0 (mod 2)
&&
g_354_low60_40_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_8 f_354_low60_40_low20_7;
mov u_394_402 u_394_401;
mov v_394_402 v_394_401;

asr g_354_low60_40_low20_8 g_354_low60_40_low20_7 1;
asr r_394_402 r_394_401 1;
asr s_394_402 s_394_401 1;
assert
    true
&&
    f_354_low60_40_low20_8 = f_354_low60_40_low20_7,
    u_394_402 = u_394_401,
    v_394_402 = v_394_401,
    g_354_low60_40_low20_8 * (const 64 2) = g_354_low60_40_low20_7,
    r_394_402 * (const 64 2) = r_394_401,
    s_394_402 * (const 64 2) = s_394_401
;

assume
    f_354_low60_40_low20_8 = f_354_low60_40_low20_7,
    u_394_402 = u_394_401,
    v_394_402 = v_394_401,
    g_354_low60_40_low20_8 * 2 = g_354_low60_40_low20_7,
    r_394_402 * 2 = r_394_401,
    s_394_402 * 2 = s_394_401
&&
    true
;

{
    u_394_402 * f_354_low60_40_low20_0 + v_394_402 * g_354_low60_40_low20_0 = f_354_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_402 * f_354_low60_40_low20_0 + s_394_402 * g_354_low60_40_low20_0 = g_354_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_8 + u_394_402 * (const 64 (2**21)) + v_394_402 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_8 + r_394_402 * (const 64 (2**21)) + s_394_402 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_8,
    f_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_8,
    g_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 402)) <=s delta, delta <=s (const 64 (1 + 2*402)),
    (const 64 (-(2**20))) <=s u_394_402, u_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_402, v_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_402, r_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_402, s_394_402 <=s (const 64 ((2**20)-1)),
    u_394_402 + v_394_402 <=s (const 64 (2**20)),
    u_394_402 - v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 + v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 - v_394_402 <=s (const 64 (2**20)),
    r_394_402 + s_394_402 <=s (const 64 (2**20)),
    r_394_402 - s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 + s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 - s_394_402 <=s (const 64 (2**20)),
    u_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_394_402 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_401_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_7,
sint64 g_354_low60_40_low20_7,
sint64 f_354_low60_40_low20_8,
sint64 g_354_low60_40_low20_8,
sint64 u_394_401,
sint64 v_394_401,
sint64 r_394_401,
sint64 s_394_401,
sint64 u_394_402,
sint64 v_394_402,
sint64 r_394_402,
sint64 s_394_402,
bit ne
)={
    u_394_401 * f_354_low60_40_low20_0 + v_394_401 * g_354_low60_40_low20_0 = f_354_low60_40_low20_7 * (-(2**20)),
    r_394_401 * f_354_low60_40_low20_0 + s_394_401 * g_354_low60_40_low20_0 = g_354_low60_40_low20_7 * (-(2**20))
&&
    u_394_401 * f_354_low60_40_low20_0 + v_394_401 * g_354_low60_40_low20_0 = f_354_low60_40_low20_7 * (const 64 (-(2**20))),
    r_394_401 * f_354_low60_40_low20_0 + s_394_401 * g_354_low60_40_low20_0 = g_354_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_7 + u_394_401 * (const 64 (2**21)) + v_394_401 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_7 + r_394_401 * (const 64 (2**21)) + s_394_401 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_7,
    f_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_7,
    g_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 401)) <=s delta, delta <=s (const 64 (1 + 2*401)),
    (const 64 (-(2**20))) <=s u_394_401, u_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_401, v_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_401, r_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_401, s_394_401 <=s (const 64 ((2**20)-1)),
    u_394_401 + v_394_401 <=s (const 64 (2**20)),
    u_394_401 - v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 + v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 - v_394_401 <=s (const 64 (2**20)),
    r_394_401 + s_394_401 <=s (const 64 (2**20)),
    r_394_401 - s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 + s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 - s_394_401 <=s (const 64 (2**20)),
    u_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_394_401 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step401

// premise b
assume
g_354_low60_40_low20_7 = 1 (mod 2)
&&
g_354_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_8 f_354_low60_40_low20_7;
mov u_394_402 u_394_401;
mov v_394_402 v_394_401;

add g_354_low60_40_low20_8 g_354_low60_40_low20_7 f_354_low60_40_low20_7;
asr g_354_low60_40_low20_8 g_354_low60_40_low20_8 1;
add r_394_402 r_394_401 u_394_401;
asr r_394_402 r_394_402 1;
add s_394_402 s_394_401 v_394_401;
asr s_394_402 s_394_402 1;
assert
    true
&&
    f_354_low60_40_low20_8 = f_354_low60_40_low20_7,
    u_394_402 = u_394_401,
    v_394_402 = v_394_401,
    g_354_low60_40_low20_8 * (const 64 2) = g_354_low60_40_low20_7 + f_354_low60_40_low20_7,
    r_394_402 * (const 64 2) = r_394_401 + u_394_401,
    s_394_402 * (const 64 2) = s_394_401 + v_394_401
;

assume
    f_354_low60_40_low20_8 = f_354_low60_40_low20_7,
    u_394_402 = u_394_401,
    v_394_402 = v_394_401,
    g_354_low60_40_low20_8 * 2 = g_354_low60_40_low20_7 + f_354_low60_40_low20_7,
    r_394_402 * 2 = r_394_401 + u_394_401,
    s_394_402 * 2 = s_394_401 + v_394_401
&&
    true
;

{
    u_394_402 * f_354_low60_40_low20_0 + v_394_402 * g_354_low60_40_low20_0 = f_354_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_402 * f_354_low60_40_low20_0 + s_394_402 * g_354_low60_40_low20_0 = g_354_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_8 + u_394_402 * (const 64 (2**21)) + v_394_402 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_8 + r_394_402 * (const 64 (2**21)) + s_394_402 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_8,
    f_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_8,
    g_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 402)) <=s delta, delta <=s (const 64 (1 + 2*402)),
    (const 64 (-(2**20))) <=s u_394_402, u_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_402, v_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_402, r_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_402, s_394_402 <=s (const 64 ((2**20)-1)),
    u_394_402 + v_394_402 <=s (const 64 (2**20)),
    u_394_402 - v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 + v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 - v_394_402 <=s (const 64 (2**20)),
    r_394_402 + s_394_402 <=s (const 64 (2**20)),
    r_394_402 - s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 + s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 - s_394_402 <=s (const 64 (2**20)),
    u_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_394_402 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_401_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_7,
sint64 g_354_low60_40_low20_7,
sint64 f_354_low60_40_low20_8,
sint64 g_354_low60_40_low20_8,
sint64 u_394_401,
sint64 v_394_401,
sint64 r_394_401,
sint64 s_394_401,
sint64 u_394_402,
sint64 v_394_402,
sint64 r_394_402,
sint64 s_394_402,
bit ne
)={
    u_394_401 * f_354_low60_40_low20_0 + v_394_401 * g_354_low60_40_low20_0 = f_354_low60_40_low20_7 * (-(2**20)),
    r_394_401 * f_354_low60_40_low20_0 + s_394_401 * g_354_low60_40_low20_0 = g_354_low60_40_low20_7 * (-(2**20))
&&
    u_394_401 * f_354_low60_40_low20_0 + v_394_401 * g_354_low60_40_low20_0 = f_354_low60_40_low20_7 * (const 64 (-(2**20))),
    r_394_401 * f_354_low60_40_low20_0 + s_394_401 * g_354_low60_40_low20_0 = g_354_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_7 + u_394_401 * (const 64 (2**21)) + v_394_401 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_7 + r_394_401 * (const 64 (2**21)) + s_394_401 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_7,
    f_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_7,
    g_354_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 401)) <=s delta, delta <=s (const 64 (1 + 2*401)),
    (const 64 (-(2**20))) <=s u_394_401, u_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_401, v_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_401, r_394_401 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_401, s_394_401 <=s (const 64 ((2**20)-1)),
    u_394_401 + v_394_401 <=s (const 64 (2**20)),
    u_394_401 - v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 + v_394_401 <=s (const 64 (2**20)),
    (const 64 0) - u_394_401 - v_394_401 <=s (const 64 (2**20)),
    r_394_401 + s_394_401 <=s (const 64 (2**20)),
    r_394_401 - s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 + s_394_401 <=s (const 64 (2**20)),
    (const 64 0) - r_394_401 - s_394_401 <=s (const 64 (2**20)),
    u_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_394_401 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_394_401 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step401

// premise c
assume
g_354_low60_40_low20_7 = 1 (mod 2)
&&
g_354_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_8 g_354_low60_40_low20_7;
mov u_394_402 r_394_401;
mov v_394_402 s_394_401;

subs dc g_354_low60_40_low20_8 g_354_low60_40_low20_7 f_354_low60_40_low20_7;
asr g_354_low60_40_low20_8 g_354_low60_40_low20_8 1;
subs dc r_394_402 r_394_401 u_394_401;
asr r_394_402 r_394_402 1;
subs dc s_394_402 s_394_401 v_394_401;
asr s_394_402 s_394_402 1;
assert
    true
&&
    f_354_low60_40_low20_8 = g_354_low60_40_low20_7,
    u_394_402 = r_394_401,
    v_394_402 = s_394_401,
    g_354_low60_40_low20_8 * (const 64 2) = g_354_low60_40_low20_7 - f_354_low60_40_low20_7,
    r_394_402 * (const 64 2) = r_394_401 - u_394_401,
    s_394_402 * (const 64 2) = s_394_401 - v_394_401
;

assume
    f_354_low60_40_low20_8 = g_354_low60_40_low20_7,
    u_394_402 = r_394_401,
    v_394_402 = s_394_401,
    g_354_low60_40_low20_8 * 2 = g_354_low60_40_low20_7 - f_354_low60_40_low20_7,
    r_394_402 * 2 = r_394_401 - u_394_401,
    s_394_402 * 2 = s_394_401 - v_394_401
&&
    true
;

{
    u_394_402 * f_354_low60_40_low20_0 + v_394_402 * g_354_low60_40_low20_0 = f_354_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_402 * f_354_low60_40_low20_0 + s_394_402 * g_354_low60_40_low20_0 = g_354_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_8 + u_394_402 * (const 64 (2**21)) + v_394_402 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_8 + r_394_402 * (const 64 (2**21)) + s_394_402 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_8,
    f_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_8,
    g_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 402)) <=s delta, delta <=s (const 64 (1 + 2*402)),
    (const 64 (-(2**20))) <=s u_394_402, u_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_402, v_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_402, r_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_402, s_394_402 <=s (const 64 ((2**20)-1)),
    u_394_402 + v_394_402 <=s (const 64 (2**20)),
    u_394_402 - v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 + v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 - v_394_402 <=s (const 64 (2**20)),
    r_394_402 + s_394_402 <=s (const 64 (2**20)),
    r_394_402 - s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 + s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 - s_394_402 <=s (const 64 (2**20)),
    u_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_394_402 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_402_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_8,
sint64 g_354_low60_40_low20_8,
sint64 f_354_low60_40_low20_9,
sint64 g_354_low60_40_low20_9,
sint64 u_394_402,
sint64 v_394_402,
sint64 r_394_402,
sint64 s_394_402,
sint64 u_394_403,
sint64 v_394_403,
sint64 r_394_403,
sint64 s_394_403,
bit ne
)={
    u_394_402 * f_354_low60_40_low20_0 + v_394_402 * g_354_low60_40_low20_0 = f_354_low60_40_low20_8 * (-(2**20)),
    r_394_402 * f_354_low60_40_low20_0 + s_394_402 * g_354_low60_40_low20_0 = g_354_low60_40_low20_8 * (-(2**20))
&&
    u_394_402 * f_354_low60_40_low20_0 + v_394_402 * g_354_low60_40_low20_0 = f_354_low60_40_low20_8 * (const 64 (-(2**20))),
    r_394_402 * f_354_low60_40_low20_0 + s_394_402 * g_354_low60_40_low20_0 = g_354_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_8 + u_394_402 * (const 64 (2**21)) + v_394_402 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_8 + r_394_402 * (const 64 (2**21)) + s_394_402 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_8,
    f_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_8,
    g_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 402)) <=s delta, delta <=s (const 64 (1 + 2*402)),
    (const 64 (-(2**20))) <=s u_394_402, u_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_402, v_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_402, r_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_402, s_394_402 <=s (const 64 ((2**20)-1)),
    u_394_402 + v_394_402 <=s (const 64 (2**20)),
    u_394_402 - v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 + v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 - v_394_402 <=s (const 64 (2**20)),
    r_394_402 + s_394_402 <=s (const 64 (2**20)),
    r_394_402 - s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 + s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 - s_394_402 <=s (const 64 (2**20)),
    u_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_394_402 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step402

// premise a
assume
g_354_low60_40_low20_8 = 0 (mod 2)
&&
g_354_low60_40_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_9 f_354_low60_40_low20_8;
mov u_394_403 u_394_402;
mov v_394_403 v_394_402;

asr g_354_low60_40_low20_9 g_354_low60_40_low20_8 1;
asr r_394_403 r_394_402 1;
asr s_394_403 s_394_402 1;
assert
    true
&&
    f_354_low60_40_low20_9 = f_354_low60_40_low20_8,
    u_394_403 = u_394_402,
    v_394_403 = v_394_402,
    g_354_low60_40_low20_9 * (const 64 2) = g_354_low60_40_low20_8,
    r_394_403 * (const 64 2) = r_394_402,
    s_394_403 * (const 64 2) = s_394_402
;

assume
    f_354_low60_40_low20_9 = f_354_low60_40_low20_8,
    u_394_403 = u_394_402,
    v_394_403 = v_394_402,
    g_354_low60_40_low20_9 * 2 = g_354_low60_40_low20_8,
    r_394_403 * 2 = r_394_402,
    s_394_403 * 2 = s_394_402
&&
    true
;

{
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_9 + u_394_403 * (const 64 (2**21)) + v_394_403 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_9 + r_394_403 * (const 64 (2**21)) + s_394_403 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_9,
    f_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_9,
    g_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 403)) <=s delta, delta <=s (const 64 (1 + 2*403)),
    (const 64 (-(2**20))) <=s u_394_403, u_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_403, v_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_403, r_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_403, s_394_403 <=s (const 64 ((2**20)-1)),
    u_394_403 + v_394_403 <=s (const 64 (2**20)),
    u_394_403 - v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 + v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 - v_394_403 <=s (const 64 (2**20)),
    r_394_403 + s_394_403 <=s (const 64 (2**20)),
    r_394_403 - s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 + s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 - s_394_403 <=s (const 64 (2**20)),
    u_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_394_403 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_402_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_8,
sint64 g_354_low60_40_low20_8,
sint64 f_354_low60_40_low20_9,
sint64 g_354_low60_40_low20_9,
sint64 u_394_402,
sint64 v_394_402,
sint64 r_394_402,
sint64 s_394_402,
sint64 u_394_403,
sint64 v_394_403,
sint64 r_394_403,
sint64 s_394_403,
bit ne
)={
    u_394_402 * f_354_low60_40_low20_0 + v_394_402 * g_354_low60_40_low20_0 = f_354_low60_40_low20_8 * (-(2**20)),
    r_394_402 * f_354_low60_40_low20_0 + s_394_402 * g_354_low60_40_low20_0 = g_354_low60_40_low20_8 * (-(2**20))
&&
    u_394_402 * f_354_low60_40_low20_0 + v_394_402 * g_354_low60_40_low20_0 = f_354_low60_40_low20_8 * (const 64 (-(2**20))),
    r_394_402 * f_354_low60_40_low20_0 + s_394_402 * g_354_low60_40_low20_0 = g_354_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_8 + u_394_402 * (const 64 (2**21)) + v_394_402 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_8 + r_394_402 * (const 64 (2**21)) + s_394_402 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_8,
    f_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_8,
    g_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 402)) <=s delta, delta <=s (const 64 (1 + 2*402)),
    (const 64 (-(2**20))) <=s u_394_402, u_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_402, v_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_402, r_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_402, s_394_402 <=s (const 64 ((2**20)-1)),
    u_394_402 + v_394_402 <=s (const 64 (2**20)),
    u_394_402 - v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 + v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 - v_394_402 <=s (const 64 (2**20)),
    r_394_402 + s_394_402 <=s (const 64 (2**20)),
    r_394_402 - s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 + s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 - s_394_402 <=s (const 64 (2**20)),
    u_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_394_402 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step402

// premise b
assume
g_354_low60_40_low20_8 = 1 (mod 2)
&&
g_354_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_9 f_354_low60_40_low20_8;
mov u_394_403 u_394_402;
mov v_394_403 v_394_402;

add g_354_low60_40_low20_9 g_354_low60_40_low20_8 f_354_low60_40_low20_8;
asr g_354_low60_40_low20_9 g_354_low60_40_low20_9 1;
add r_394_403 r_394_402 u_394_402;
asr r_394_403 r_394_403 1;
add s_394_403 s_394_402 v_394_402;
asr s_394_403 s_394_403 1;
assert
    true
&&
    f_354_low60_40_low20_9 = f_354_low60_40_low20_8,
    u_394_403 = u_394_402,
    v_394_403 = v_394_402,
    g_354_low60_40_low20_9 * (const 64 2) = g_354_low60_40_low20_8 + f_354_low60_40_low20_8,
    r_394_403 * (const 64 2) = r_394_402 + u_394_402,
    s_394_403 * (const 64 2) = s_394_402 + v_394_402
;

assume
    f_354_low60_40_low20_9 = f_354_low60_40_low20_8,
    u_394_403 = u_394_402,
    v_394_403 = v_394_402,
    g_354_low60_40_low20_9 * 2 = g_354_low60_40_low20_8 + f_354_low60_40_low20_8,
    r_394_403 * 2 = r_394_402 + u_394_402,
    s_394_403 * 2 = s_394_402 + v_394_402
&&
    true
;

{
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_9 + u_394_403 * (const 64 (2**21)) + v_394_403 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_9 + r_394_403 * (const 64 (2**21)) + s_394_403 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_9,
    f_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_9,
    g_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 403)) <=s delta, delta <=s (const 64 (1 + 2*403)),
    (const 64 (-(2**20))) <=s u_394_403, u_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_403, v_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_403, r_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_403, s_394_403 <=s (const 64 ((2**20)-1)),
    u_394_403 + v_394_403 <=s (const 64 (2**20)),
    u_394_403 - v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 + v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 - v_394_403 <=s (const 64 (2**20)),
    r_394_403 + s_394_403 <=s (const 64 (2**20)),
    r_394_403 - s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 + s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 - s_394_403 <=s (const 64 (2**20)),
    u_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_394_403 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_402_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_8,
sint64 g_354_low60_40_low20_8,
sint64 f_354_low60_40_low20_9,
sint64 g_354_low60_40_low20_9,
sint64 u_394_402,
sint64 v_394_402,
sint64 r_394_402,
sint64 s_394_402,
sint64 u_394_403,
sint64 v_394_403,
sint64 r_394_403,
sint64 s_394_403,
bit ne
)={
    u_394_402 * f_354_low60_40_low20_0 + v_394_402 * g_354_low60_40_low20_0 = f_354_low60_40_low20_8 * (-(2**20)),
    r_394_402 * f_354_low60_40_low20_0 + s_394_402 * g_354_low60_40_low20_0 = g_354_low60_40_low20_8 * (-(2**20))
&&
    u_394_402 * f_354_low60_40_low20_0 + v_394_402 * g_354_low60_40_low20_0 = f_354_low60_40_low20_8 * (const 64 (-(2**20))),
    r_394_402 * f_354_low60_40_low20_0 + s_394_402 * g_354_low60_40_low20_0 = g_354_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_8 + u_394_402 * (const 64 (2**21)) + v_394_402 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_8 + r_394_402 * (const 64 (2**21)) + s_394_402 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_8,
    f_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_8,
    g_354_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 402)) <=s delta, delta <=s (const 64 (1 + 2*402)),
    (const 64 (-(2**20))) <=s u_394_402, u_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_402, v_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_402, r_394_402 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_402, s_394_402 <=s (const 64 ((2**20)-1)),
    u_394_402 + v_394_402 <=s (const 64 (2**20)),
    u_394_402 - v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 + v_394_402 <=s (const 64 (2**20)),
    (const 64 0) - u_394_402 - v_394_402 <=s (const 64 (2**20)),
    r_394_402 + s_394_402 <=s (const 64 (2**20)),
    r_394_402 - s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 + s_394_402 <=s (const 64 (2**20)),
    (const 64 0) - r_394_402 - s_394_402 <=s (const 64 (2**20)),
    u_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_394_402 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_394_402 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step402

// premise c
assume
g_354_low60_40_low20_8 = 1 (mod 2)
&&
g_354_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_9 g_354_low60_40_low20_8;
mov u_394_403 r_394_402;
mov v_394_403 s_394_402;

subs dc g_354_low60_40_low20_9 g_354_low60_40_low20_8 f_354_low60_40_low20_8;
asr g_354_low60_40_low20_9 g_354_low60_40_low20_9 1;
subs dc r_394_403 r_394_402 u_394_402;
asr r_394_403 r_394_403 1;
subs dc s_394_403 s_394_402 v_394_402;
asr s_394_403 s_394_403 1;
assert
    true
&&
    f_354_low60_40_low20_9 = g_354_low60_40_low20_8,
    u_394_403 = r_394_402,
    v_394_403 = s_394_402,
    g_354_low60_40_low20_9 * (const 64 2) = g_354_low60_40_low20_8 - f_354_low60_40_low20_8,
    r_394_403 * (const 64 2) = r_394_402 - u_394_402,
    s_394_403 * (const 64 2) = s_394_402 - v_394_402
;

assume
    f_354_low60_40_low20_9 = g_354_low60_40_low20_8,
    u_394_403 = r_394_402,
    v_394_403 = s_394_402,
    g_354_low60_40_low20_9 * 2 = g_354_low60_40_low20_8 - f_354_low60_40_low20_8,
    r_394_403 * 2 = r_394_402 - u_394_402,
    s_394_403 * 2 = s_394_402 - v_394_402
&&
    true
;

{
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_9 + u_394_403 * (const 64 (2**21)) + v_394_403 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_9 + r_394_403 * (const 64 (2**21)) + s_394_403 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_9,
    f_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_9,
    g_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 403)) <=s delta, delta <=s (const 64 (1 + 2*403)),
    (const 64 (-(2**20))) <=s u_394_403, u_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_403, v_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_403, r_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_403, s_394_403 <=s (const 64 ((2**20)-1)),
    u_394_403 + v_394_403 <=s (const 64 (2**20)),
    u_394_403 - v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 + v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 - v_394_403 <=s (const 64 (2**20)),
    r_394_403 + s_394_403 <=s (const 64 (2**20)),
    r_394_403 - s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 + s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 - s_394_403 <=s (const 64 (2**20)),
    u_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_394_403 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_403_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_9,
sint64 g_354_low60_40_low20_9,
sint64 f_354_low60_40_low20_10,
sint64 g_354_low60_40_low20_10,
sint64 u_394_403,
sint64 v_394_403,
sint64 r_394_403,
sint64 s_394_403,
sint64 u_394_404,
sint64 v_394_404,
sint64 r_394_404,
sint64 s_394_404,
bit ne
)={
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (-(2**20)),
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (-(2**20))
&&
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (const 64 (-(2**20))),
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_9 + u_394_403 * (const 64 (2**21)) + v_394_403 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_9 + r_394_403 * (const 64 (2**21)) + s_394_403 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_9,
    f_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_9,
    g_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 403)) <=s delta, delta <=s (const 64 (1 + 2*403)),
    (const 64 (-(2**20))) <=s u_394_403, u_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_403, v_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_403, r_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_403, s_394_403 <=s (const 64 ((2**20)-1)),
    u_394_403 + v_394_403 <=s (const 64 (2**20)),
    u_394_403 - v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 + v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 - v_394_403 <=s (const 64 (2**20)),
    r_394_403 + s_394_403 <=s (const 64 (2**20)),
    r_394_403 - s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 + s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 - s_394_403 <=s (const 64 (2**20)),
    u_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_394_403 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step403

// premise a
assume
g_354_low60_40_low20_9 = 0 (mod 2)
&&
g_354_low60_40_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_10 f_354_low60_40_low20_9;
mov u_394_404 u_394_403;
mov v_394_404 v_394_403;

asr g_354_low60_40_low20_10 g_354_low60_40_low20_9 1;
asr r_394_404 r_394_403 1;
asr s_394_404 s_394_403 1;
assert
    true
&&
    f_354_low60_40_low20_10 = f_354_low60_40_low20_9,
    u_394_404 = u_394_403,
    v_394_404 = v_394_403,
    g_354_low60_40_low20_10 * (const 64 2) = g_354_low60_40_low20_9,
    r_394_404 * (const 64 2) = r_394_403,
    s_394_404 * (const 64 2) = s_394_403
;

assume
    f_354_low60_40_low20_10 = f_354_low60_40_low20_9,
    u_394_404 = u_394_403,
    v_394_404 = v_394_403,
    g_354_low60_40_low20_10 * 2 = g_354_low60_40_low20_9,
    r_394_404 * 2 = r_394_403,
    s_394_404 * 2 = s_394_403
&&
    true
;

{
    u_394_404 * f_354_low60_40_low20_0 + v_394_404 * g_354_low60_40_low20_0 = f_354_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_404 * f_354_low60_40_low20_0 + s_394_404 * g_354_low60_40_low20_0 = g_354_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_10 + u_394_404 * (const 64 (2**21)) + v_394_404 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_10 + r_394_404 * (const 64 (2**21)) + s_394_404 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_10,
    f_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_10,
    g_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 404)) <=s delta, delta <=s (const 64 (1 + 2*404)),
    (const 64 (-(2**20))) <=s u_394_404, u_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_404, v_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_404, r_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_404, s_394_404 <=s (const 64 ((2**20)-1)),
    u_394_404 + v_394_404 <=s (const 64 (2**20)),
    u_394_404 - v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 + v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 - v_394_404 <=s (const 64 (2**20)),
    r_394_404 + s_394_404 <=s (const 64 (2**20)),
    r_394_404 - s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 + s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 - s_394_404 <=s (const 64 (2**20)),
    u_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_394_404 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_403_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_9,
sint64 g_354_low60_40_low20_9,
sint64 f_354_low60_40_low20_10,
sint64 g_354_low60_40_low20_10,
sint64 u_394_403,
sint64 v_394_403,
sint64 r_394_403,
sint64 s_394_403,
sint64 u_394_404,
sint64 v_394_404,
sint64 r_394_404,
sint64 s_394_404,
bit ne
)={
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (-(2**20)),
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (-(2**20))
&&
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (const 64 (-(2**20))),
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_9 + u_394_403 * (const 64 (2**21)) + v_394_403 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_9 + r_394_403 * (const 64 (2**21)) + s_394_403 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_9,
    f_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_9,
    g_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 403)) <=s delta, delta <=s (const 64 (1 + 2*403)),
    (const 64 (-(2**20))) <=s u_394_403, u_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_403, v_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_403, r_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_403, s_394_403 <=s (const 64 ((2**20)-1)),
    u_394_403 + v_394_403 <=s (const 64 (2**20)),
    u_394_403 - v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 + v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 - v_394_403 <=s (const 64 (2**20)),
    r_394_403 + s_394_403 <=s (const 64 (2**20)),
    r_394_403 - s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 + s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 - s_394_403 <=s (const 64 (2**20)),
    u_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_394_403 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step403

// premise b
assume
g_354_low60_40_low20_9 = 1 (mod 2)
&&
g_354_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_10 f_354_low60_40_low20_9;
mov u_394_404 u_394_403;
mov v_394_404 v_394_403;

add g_354_low60_40_low20_10 g_354_low60_40_low20_9 f_354_low60_40_low20_9;
asr g_354_low60_40_low20_10 g_354_low60_40_low20_10 1;
add r_394_404 r_394_403 u_394_403;
asr r_394_404 r_394_404 1;
add s_394_404 s_394_403 v_394_403;
asr s_394_404 s_394_404 1;
assert
    true
&&
    f_354_low60_40_low20_10 = f_354_low60_40_low20_9,
    u_394_404 = u_394_403,
    v_394_404 = v_394_403,
    g_354_low60_40_low20_10 * (const 64 2) = g_354_low60_40_low20_9 + f_354_low60_40_low20_9,
    r_394_404 * (const 64 2) = r_394_403 + u_394_403,
    s_394_404 * (const 64 2) = s_394_403 + v_394_403
;

assume
    f_354_low60_40_low20_10 = f_354_low60_40_low20_9,
    u_394_404 = u_394_403,
    v_394_404 = v_394_403,
    g_354_low60_40_low20_10 * 2 = g_354_low60_40_low20_9 + f_354_low60_40_low20_9,
    r_394_404 * 2 = r_394_403 + u_394_403,
    s_394_404 * 2 = s_394_403 + v_394_403
&&
    true
;

{
    u_394_404 * f_354_low60_40_low20_0 + v_394_404 * g_354_low60_40_low20_0 = f_354_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_404 * f_354_low60_40_low20_0 + s_394_404 * g_354_low60_40_low20_0 = g_354_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_10 + u_394_404 * (const 64 (2**21)) + v_394_404 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_10 + r_394_404 * (const 64 (2**21)) + s_394_404 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_10,
    f_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_10,
    g_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 404)) <=s delta, delta <=s (const 64 (1 + 2*404)),
    (const 64 (-(2**20))) <=s u_394_404, u_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_404, v_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_404, r_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_404, s_394_404 <=s (const 64 ((2**20)-1)),
    u_394_404 + v_394_404 <=s (const 64 (2**20)),
    u_394_404 - v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 + v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 - v_394_404 <=s (const 64 (2**20)),
    r_394_404 + s_394_404 <=s (const 64 (2**20)),
    r_394_404 - s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 + s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 - s_394_404 <=s (const 64 (2**20)),
    u_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_394_404 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_403_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_9,
sint64 g_354_low60_40_low20_9,
sint64 f_354_low60_40_low20_10,
sint64 g_354_low60_40_low20_10,
sint64 u_394_403,
sint64 v_394_403,
sint64 r_394_403,
sint64 s_394_403,
sint64 u_394_404,
sint64 v_394_404,
sint64 r_394_404,
sint64 s_394_404,
bit ne
)={
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (-(2**20)),
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (-(2**20))
&&
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (const 64 (-(2**20))),
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_9 + u_394_403 * (const 64 (2**21)) + v_394_403 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_9 + r_394_403 * (const 64 (2**21)) + s_394_403 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_9,
    f_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_9,
    g_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 403)) <=s delta, delta <=s (const 64 (1 + 2*403)),
    (const 64 (-(2**20))) <=s u_394_403, u_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_403, v_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_403, r_394_403 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_403, s_394_403 <=s (const 64 ((2**20)-1)),
    u_394_403 + v_394_403 <=s (const 64 (2**20)),
    u_394_403 - v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 + v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 - v_394_403 <=s (const 64 (2**20)),
    r_394_403 + s_394_403 <=s (const 64 (2**20)),
    r_394_403 - s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 + s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 - s_394_403 <=s (const 64 (2**20)),
    u_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_394_403 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step403

// premise c
assume
g_354_low60_40_low20_9 = 1 (mod 2)
&&
g_354_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_10 g_354_low60_40_low20_9;
mov u_394_404 r_394_403;
mov v_394_404 s_394_403;

subs dc g_354_low60_40_low20_10 g_354_low60_40_low20_9 f_354_low60_40_low20_9;
asr g_354_low60_40_low20_10 g_354_low60_40_low20_10 1;
subs dc r_394_404 r_394_403 u_394_403;
asr r_394_404 r_394_404 1;
subs dc s_394_404 s_394_403 v_394_403;
asr s_394_404 s_394_404 1;
assert
    true
&&
    f_354_low60_40_low20_10 = g_354_low60_40_low20_9,
    u_394_404 = r_394_403,
    v_394_404 = s_394_403,
    g_354_low60_40_low20_10 * (const 64 2) = g_354_low60_40_low20_9 - f_354_low60_40_low20_9,
    r_394_404 * (const 64 2) = r_394_403 - u_394_403,
    s_394_404 * (const 64 2) = s_394_403 - v_394_403
;

assume
    f_354_low60_40_low20_10 = g_354_low60_40_low20_9,
    u_394_404 = r_394_403,
    v_394_404 = s_394_403,
    g_354_low60_40_low20_10 * 2 = g_354_low60_40_low20_9 - f_354_low60_40_low20_9,
    r_394_404 * 2 = r_394_403 - u_394_403,
    s_394_404 * 2 = s_394_403 - v_394_403
&&
    true
;

{
    u_394_404 * f_354_low60_40_low20_0 + v_394_404 * g_354_low60_40_low20_0 = f_354_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_404 * f_354_low60_40_low20_0 + s_394_404 * g_354_low60_40_low20_0 = g_354_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_10 + u_394_404 * (const 64 (2**21)) + v_394_404 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_10 + r_394_404 * (const 64 (2**21)) + s_394_404 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_10,
    f_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_10,
    g_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 404)) <=s delta, delta <=s (const 64 (1 + 2*404)),
    (const 64 (-(2**20))) <=s u_394_404, u_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_404, v_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_404, r_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_404, s_394_404 <=s (const 64 ((2**20)-1)),
    u_394_404 + v_394_404 <=s (const 64 (2**20)),
    u_394_404 - v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 + v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 - v_394_404 <=s (const 64 (2**20)),
    r_394_404 + s_394_404 <=s (const 64 (2**20)),
    r_394_404 - s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 + s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 - s_394_404 <=s (const 64 (2**20)),
    u_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_394_404 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_404_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_10,
sint64 g_354_low60_40_low20_10,
sint64 f_354_low60_40_low20_11,
sint64 g_354_low60_40_low20_11,
sint64 u_394_404,
sint64 v_394_404,
sint64 r_394_404,
sint64 s_394_404,
sint64 u_394_405,
sint64 v_394_405,
sint64 r_394_405,
sint64 s_394_405,
bit ne
)={
    u_394_404 * f_354_low60_40_low20_0 + v_394_404 * g_354_low60_40_low20_0 = f_354_low60_40_low20_10 * (-(2**20)),
    r_394_404 * f_354_low60_40_low20_0 + s_394_404 * g_354_low60_40_low20_0 = g_354_low60_40_low20_10 * (-(2**20))
&&
    u_394_404 * f_354_low60_40_low20_0 + v_394_404 * g_354_low60_40_low20_0 = f_354_low60_40_low20_10 * (const 64 (-(2**20))),
    r_394_404 * f_354_low60_40_low20_0 + s_394_404 * g_354_low60_40_low20_0 = g_354_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_10 + u_394_404 * (const 64 (2**21)) + v_394_404 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_10 + r_394_404 * (const 64 (2**21)) + s_394_404 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_10,
    f_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_10,
    g_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 404)) <=s delta, delta <=s (const 64 (1 + 2*404)),
    (const 64 (-(2**20))) <=s u_394_404, u_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_404, v_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_404, r_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_404, s_394_404 <=s (const 64 ((2**20)-1)),
    u_394_404 + v_394_404 <=s (const 64 (2**20)),
    u_394_404 - v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 + v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 - v_394_404 <=s (const 64 (2**20)),
    r_394_404 + s_394_404 <=s (const 64 (2**20)),
    r_394_404 - s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 + s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 - s_394_404 <=s (const 64 (2**20)),
    u_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_394_404 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step404

// premise a
assume
g_354_low60_40_low20_10 = 0 (mod 2)
&&
g_354_low60_40_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_11 f_354_low60_40_low20_10;
mov u_394_405 u_394_404;
mov v_394_405 v_394_404;

asr g_354_low60_40_low20_11 g_354_low60_40_low20_10 1;
asr r_394_405 r_394_404 1;
asr s_394_405 s_394_404 1;
assert
    true
&&
    f_354_low60_40_low20_11 = f_354_low60_40_low20_10,
    u_394_405 = u_394_404,
    v_394_405 = v_394_404,
    g_354_low60_40_low20_11 * (const 64 2) = g_354_low60_40_low20_10,
    r_394_405 * (const 64 2) = r_394_404,
    s_394_405 * (const 64 2) = s_394_404
;

assume
    f_354_low60_40_low20_11 = f_354_low60_40_low20_10,
    u_394_405 = u_394_404,
    v_394_405 = v_394_404,
    g_354_low60_40_low20_11 * 2 = g_354_low60_40_low20_10,
    r_394_405 * 2 = r_394_404,
    s_394_405 * 2 = s_394_404
&&
    true
;

{
    u_394_405 * f_354_low60_40_low20_0 + v_394_405 * g_354_low60_40_low20_0 = f_354_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_405 * f_354_low60_40_low20_0 + s_394_405 * g_354_low60_40_low20_0 = g_354_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_11 + u_394_405 * (const 64 (2**21)) + v_394_405 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_11 + r_394_405 * (const 64 (2**21)) + s_394_405 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_11,
    f_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_11,
    g_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 405)) <=s delta, delta <=s (const 64 (1 + 2*405)),
    (const 64 (-(2**20))) <=s u_394_405, u_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_405, v_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_405, r_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_405, s_394_405 <=s (const 64 ((2**20)-1)),
    u_394_405 + v_394_405 <=s (const 64 (2**20)),
    u_394_405 - v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 + v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 - v_394_405 <=s (const 64 (2**20)),
    r_394_405 + s_394_405 <=s (const 64 (2**20)),
    r_394_405 - s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 + s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 - s_394_405 <=s (const 64 (2**20)),
    u_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_394_405 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_404_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_10,
sint64 g_354_low60_40_low20_10,
sint64 f_354_low60_40_low20_11,
sint64 g_354_low60_40_low20_11,
sint64 u_394_404,
sint64 v_394_404,
sint64 r_394_404,
sint64 s_394_404,
sint64 u_394_405,
sint64 v_394_405,
sint64 r_394_405,
sint64 s_394_405,
bit ne
)={
    u_394_404 * f_354_low60_40_low20_0 + v_394_404 * g_354_low60_40_low20_0 = f_354_low60_40_low20_10 * (-(2**20)),
    r_394_404 * f_354_low60_40_low20_0 + s_394_404 * g_354_low60_40_low20_0 = g_354_low60_40_low20_10 * (-(2**20))
&&
    u_394_404 * f_354_low60_40_low20_0 + v_394_404 * g_354_low60_40_low20_0 = f_354_low60_40_low20_10 * (const 64 (-(2**20))),
    r_394_404 * f_354_low60_40_low20_0 + s_394_404 * g_354_low60_40_low20_0 = g_354_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_10 + u_394_404 * (const 64 (2**21)) + v_394_404 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_10 + r_394_404 * (const 64 (2**21)) + s_394_404 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_10,
    f_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_10,
    g_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 404)) <=s delta, delta <=s (const 64 (1 + 2*404)),
    (const 64 (-(2**20))) <=s u_394_404, u_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_404, v_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_404, r_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_404, s_394_404 <=s (const 64 ((2**20)-1)),
    u_394_404 + v_394_404 <=s (const 64 (2**20)),
    u_394_404 - v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 + v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 - v_394_404 <=s (const 64 (2**20)),
    r_394_404 + s_394_404 <=s (const 64 (2**20)),
    r_394_404 - s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 + s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 - s_394_404 <=s (const 64 (2**20)),
    u_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_394_404 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step404

// premise b
assume
g_354_low60_40_low20_10 = 1 (mod 2)
&&
g_354_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_11 f_354_low60_40_low20_10;
mov u_394_405 u_394_404;
mov v_394_405 v_394_404;

add g_354_low60_40_low20_11 g_354_low60_40_low20_10 f_354_low60_40_low20_10;
asr g_354_low60_40_low20_11 g_354_low60_40_low20_11 1;
add r_394_405 r_394_404 u_394_404;
asr r_394_405 r_394_405 1;
add s_394_405 s_394_404 v_394_404;
asr s_394_405 s_394_405 1;
assert
    true
&&
    f_354_low60_40_low20_11 = f_354_low60_40_low20_10,
    u_394_405 = u_394_404,
    v_394_405 = v_394_404,
    g_354_low60_40_low20_11 * (const 64 2) = g_354_low60_40_low20_10 + f_354_low60_40_low20_10,
    r_394_405 * (const 64 2) = r_394_404 + u_394_404,
    s_394_405 * (const 64 2) = s_394_404 + v_394_404
;

assume
    f_354_low60_40_low20_11 = f_354_low60_40_low20_10,
    u_394_405 = u_394_404,
    v_394_405 = v_394_404,
    g_354_low60_40_low20_11 * 2 = g_354_low60_40_low20_10 + f_354_low60_40_low20_10,
    r_394_405 * 2 = r_394_404 + u_394_404,
    s_394_405 * 2 = s_394_404 + v_394_404
&&
    true
;

{
    u_394_405 * f_354_low60_40_low20_0 + v_394_405 * g_354_low60_40_low20_0 = f_354_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_405 * f_354_low60_40_low20_0 + s_394_405 * g_354_low60_40_low20_0 = g_354_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_11 + u_394_405 * (const 64 (2**21)) + v_394_405 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_11 + r_394_405 * (const 64 (2**21)) + s_394_405 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_11,
    f_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_11,
    g_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 405)) <=s delta, delta <=s (const 64 (1 + 2*405)),
    (const 64 (-(2**20))) <=s u_394_405, u_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_405, v_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_405, r_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_405, s_394_405 <=s (const 64 ((2**20)-1)),
    u_394_405 + v_394_405 <=s (const 64 (2**20)),
    u_394_405 - v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 + v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 - v_394_405 <=s (const 64 (2**20)),
    r_394_405 + s_394_405 <=s (const 64 (2**20)),
    r_394_405 - s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 + s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 - s_394_405 <=s (const 64 (2**20)),
    u_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_394_405 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_404_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_10,
sint64 g_354_low60_40_low20_10,
sint64 f_354_low60_40_low20_11,
sint64 g_354_low60_40_low20_11,
sint64 u_394_404,
sint64 v_394_404,
sint64 r_394_404,
sint64 s_394_404,
sint64 u_394_405,
sint64 v_394_405,
sint64 r_394_405,
sint64 s_394_405,
bit ne
)={
    u_394_404 * f_354_low60_40_low20_0 + v_394_404 * g_354_low60_40_low20_0 = f_354_low60_40_low20_10 * (-(2**20)),
    r_394_404 * f_354_low60_40_low20_0 + s_394_404 * g_354_low60_40_low20_0 = g_354_low60_40_low20_10 * (-(2**20))
&&
    u_394_404 * f_354_low60_40_low20_0 + v_394_404 * g_354_low60_40_low20_0 = f_354_low60_40_low20_10 * (const 64 (-(2**20))),
    r_394_404 * f_354_low60_40_low20_0 + s_394_404 * g_354_low60_40_low20_0 = g_354_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_10 + u_394_404 * (const 64 (2**21)) + v_394_404 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_10 + r_394_404 * (const 64 (2**21)) + s_394_404 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_10,
    f_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_10,
    g_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 404)) <=s delta, delta <=s (const 64 (1 + 2*404)),
    (const 64 (-(2**20))) <=s u_394_404, u_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_404, v_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_404, r_394_404 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_404, s_394_404 <=s (const 64 ((2**20)-1)),
    u_394_404 + v_394_404 <=s (const 64 (2**20)),
    u_394_404 - v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 + v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 - v_394_404 <=s (const 64 (2**20)),
    r_394_404 + s_394_404 <=s (const 64 (2**20)),
    r_394_404 - s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 + s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 - s_394_404 <=s (const 64 (2**20)),
    u_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_394_404 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step404

// premise c
assume
g_354_low60_40_low20_10 = 1 (mod 2)
&&
g_354_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_11 g_354_low60_40_low20_10;
mov u_394_405 r_394_404;
mov v_394_405 s_394_404;

subs dc g_354_low60_40_low20_11 g_354_low60_40_low20_10 f_354_low60_40_low20_10;
asr g_354_low60_40_low20_11 g_354_low60_40_low20_11 1;
subs dc r_394_405 r_394_404 u_394_404;
asr r_394_405 r_394_405 1;
subs dc s_394_405 s_394_404 v_394_404;
asr s_394_405 s_394_405 1;
assert
    true
&&
    f_354_low60_40_low20_11 = g_354_low60_40_low20_10,
    u_394_405 = r_394_404,
    v_394_405 = s_394_404,
    g_354_low60_40_low20_11 * (const 64 2) = g_354_low60_40_low20_10 - f_354_low60_40_low20_10,
    r_394_405 * (const 64 2) = r_394_404 - u_394_404,
    s_394_405 * (const 64 2) = s_394_404 - v_394_404
;

assume
    f_354_low60_40_low20_11 = g_354_low60_40_low20_10,
    u_394_405 = r_394_404,
    v_394_405 = s_394_404,
    g_354_low60_40_low20_11 * 2 = g_354_low60_40_low20_10 - f_354_low60_40_low20_10,
    r_394_405 * 2 = r_394_404 - u_394_404,
    s_394_405 * 2 = s_394_404 - v_394_404
&&
    true
;

{
    u_394_405 * f_354_low60_40_low20_0 + v_394_405 * g_354_low60_40_low20_0 = f_354_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_405 * f_354_low60_40_low20_0 + s_394_405 * g_354_low60_40_low20_0 = g_354_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_11 + u_394_405 * (const 64 (2**21)) + v_394_405 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_11 + r_394_405 * (const 64 (2**21)) + s_394_405 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_11,
    f_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_11,
    g_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 405)) <=s delta, delta <=s (const 64 (1 + 2*405)),
    (const 64 (-(2**20))) <=s u_394_405, u_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_405, v_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_405, r_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_405, s_394_405 <=s (const 64 ((2**20)-1)),
    u_394_405 + v_394_405 <=s (const 64 (2**20)),
    u_394_405 - v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 + v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 - v_394_405 <=s (const 64 (2**20)),
    r_394_405 + s_394_405 <=s (const 64 (2**20)),
    r_394_405 - s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 + s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 - s_394_405 <=s (const 64 (2**20)),
    u_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_394_405 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_405_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_11,
sint64 g_354_low60_40_low20_11,
sint64 f_354_low60_40_low20_12,
sint64 g_354_low60_40_low20_12,
sint64 u_394_405,
sint64 v_394_405,
sint64 r_394_405,
sint64 s_394_405,
sint64 u_394_406,
sint64 v_394_406,
sint64 r_394_406,
sint64 s_394_406,
bit ne
)={
    u_394_405 * f_354_low60_40_low20_0 + v_394_405 * g_354_low60_40_low20_0 = f_354_low60_40_low20_11 * (-(2**20)),
    r_394_405 * f_354_low60_40_low20_0 + s_394_405 * g_354_low60_40_low20_0 = g_354_low60_40_low20_11 * (-(2**20))
&&
    u_394_405 * f_354_low60_40_low20_0 + v_394_405 * g_354_low60_40_low20_0 = f_354_low60_40_low20_11 * (const 64 (-(2**20))),
    r_394_405 * f_354_low60_40_low20_0 + s_394_405 * g_354_low60_40_low20_0 = g_354_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_11 + u_394_405 * (const 64 (2**21)) + v_394_405 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_11 + r_394_405 * (const 64 (2**21)) + s_394_405 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_11,
    f_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_11,
    g_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 405)) <=s delta, delta <=s (const 64 (1 + 2*405)),
    (const 64 (-(2**20))) <=s u_394_405, u_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_405, v_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_405, r_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_405, s_394_405 <=s (const 64 ((2**20)-1)),
    u_394_405 + v_394_405 <=s (const 64 (2**20)),
    u_394_405 - v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 + v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 - v_394_405 <=s (const 64 (2**20)),
    r_394_405 + s_394_405 <=s (const 64 (2**20)),
    r_394_405 - s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 + s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 - s_394_405 <=s (const 64 (2**20)),
    u_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_394_405 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step405

// premise a
assume
g_354_low60_40_low20_11 = 0 (mod 2)
&&
g_354_low60_40_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_12 f_354_low60_40_low20_11;
mov u_394_406 u_394_405;
mov v_394_406 v_394_405;

asr g_354_low60_40_low20_12 g_354_low60_40_low20_11 1;
asr r_394_406 r_394_405 1;
asr s_394_406 s_394_405 1;
assert
    true
&&
    f_354_low60_40_low20_12 = f_354_low60_40_low20_11,
    u_394_406 = u_394_405,
    v_394_406 = v_394_405,
    g_354_low60_40_low20_12 * (const 64 2) = g_354_low60_40_low20_11,
    r_394_406 * (const 64 2) = r_394_405,
    s_394_406 * (const 64 2) = s_394_405
;

assume
    f_354_low60_40_low20_12 = f_354_low60_40_low20_11,
    u_394_406 = u_394_405,
    v_394_406 = v_394_405,
    g_354_low60_40_low20_12 * 2 = g_354_low60_40_low20_11,
    r_394_406 * 2 = r_394_405,
    s_394_406 * 2 = s_394_405
&&
    true
;

{
    u_394_406 * f_354_low60_40_low20_0 + v_394_406 * g_354_low60_40_low20_0 = f_354_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_406 * f_354_low60_40_low20_0 + s_394_406 * g_354_low60_40_low20_0 = g_354_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_12 + u_394_406 * (const 64 (2**21)) + v_394_406 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_12 + r_394_406 * (const 64 (2**21)) + s_394_406 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_12,
    f_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_12,
    g_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 406)) <=s delta, delta <=s (const 64 (1 + 2*406)),
    (const 64 (-(2**20))) <=s u_394_406, u_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_406, v_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_406, r_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_406, s_394_406 <=s (const 64 ((2**20)-1)),
    u_394_406 + v_394_406 <=s (const 64 (2**20)),
    u_394_406 - v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 + v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 - v_394_406 <=s (const 64 (2**20)),
    r_394_406 + s_394_406 <=s (const 64 (2**20)),
    r_394_406 - s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 + s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 - s_394_406 <=s (const 64 (2**20)),
    u_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_394_406 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_405_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_11,
sint64 g_354_low60_40_low20_11,
sint64 f_354_low60_40_low20_12,
sint64 g_354_low60_40_low20_12,
sint64 u_394_405,
sint64 v_394_405,
sint64 r_394_405,
sint64 s_394_405,
sint64 u_394_406,
sint64 v_394_406,
sint64 r_394_406,
sint64 s_394_406,
bit ne
)={
    u_394_405 * f_354_low60_40_low20_0 + v_394_405 * g_354_low60_40_low20_0 = f_354_low60_40_low20_11 * (-(2**20)),
    r_394_405 * f_354_low60_40_low20_0 + s_394_405 * g_354_low60_40_low20_0 = g_354_low60_40_low20_11 * (-(2**20))
&&
    u_394_405 * f_354_low60_40_low20_0 + v_394_405 * g_354_low60_40_low20_0 = f_354_low60_40_low20_11 * (const 64 (-(2**20))),
    r_394_405 * f_354_low60_40_low20_0 + s_394_405 * g_354_low60_40_low20_0 = g_354_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_11 + u_394_405 * (const 64 (2**21)) + v_394_405 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_11 + r_394_405 * (const 64 (2**21)) + s_394_405 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_11,
    f_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_11,
    g_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 405)) <=s delta, delta <=s (const 64 (1 + 2*405)),
    (const 64 (-(2**20))) <=s u_394_405, u_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_405, v_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_405, r_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_405, s_394_405 <=s (const 64 ((2**20)-1)),
    u_394_405 + v_394_405 <=s (const 64 (2**20)),
    u_394_405 - v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 + v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 - v_394_405 <=s (const 64 (2**20)),
    r_394_405 + s_394_405 <=s (const 64 (2**20)),
    r_394_405 - s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 + s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 - s_394_405 <=s (const 64 (2**20)),
    u_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_394_405 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step405

// premise b
assume
g_354_low60_40_low20_11 = 1 (mod 2)
&&
g_354_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_12 f_354_low60_40_low20_11;
mov u_394_406 u_394_405;
mov v_394_406 v_394_405;

add g_354_low60_40_low20_12 g_354_low60_40_low20_11 f_354_low60_40_low20_11;
asr g_354_low60_40_low20_12 g_354_low60_40_low20_12 1;
add r_394_406 r_394_405 u_394_405;
asr r_394_406 r_394_406 1;
add s_394_406 s_394_405 v_394_405;
asr s_394_406 s_394_406 1;
assert
    true
&&
    f_354_low60_40_low20_12 = f_354_low60_40_low20_11,
    u_394_406 = u_394_405,
    v_394_406 = v_394_405,
    g_354_low60_40_low20_12 * (const 64 2) = g_354_low60_40_low20_11 + f_354_low60_40_low20_11,
    r_394_406 * (const 64 2) = r_394_405 + u_394_405,
    s_394_406 * (const 64 2) = s_394_405 + v_394_405
;

assume
    f_354_low60_40_low20_12 = f_354_low60_40_low20_11,
    u_394_406 = u_394_405,
    v_394_406 = v_394_405,
    g_354_low60_40_low20_12 * 2 = g_354_low60_40_low20_11 + f_354_low60_40_low20_11,
    r_394_406 * 2 = r_394_405 + u_394_405,
    s_394_406 * 2 = s_394_405 + v_394_405
&&
    true
;

{
    u_394_406 * f_354_low60_40_low20_0 + v_394_406 * g_354_low60_40_low20_0 = f_354_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_406 * f_354_low60_40_low20_0 + s_394_406 * g_354_low60_40_low20_0 = g_354_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_12 + u_394_406 * (const 64 (2**21)) + v_394_406 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_12 + r_394_406 * (const 64 (2**21)) + s_394_406 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_12,
    f_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_12,
    g_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 406)) <=s delta, delta <=s (const 64 (1 + 2*406)),
    (const 64 (-(2**20))) <=s u_394_406, u_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_406, v_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_406, r_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_406, s_394_406 <=s (const 64 ((2**20)-1)),
    u_394_406 + v_394_406 <=s (const 64 (2**20)),
    u_394_406 - v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 + v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 - v_394_406 <=s (const 64 (2**20)),
    r_394_406 + s_394_406 <=s (const 64 (2**20)),
    r_394_406 - s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 + s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 - s_394_406 <=s (const 64 (2**20)),
    u_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_394_406 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_405_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_11,
sint64 g_354_low60_40_low20_11,
sint64 f_354_low60_40_low20_12,
sint64 g_354_low60_40_low20_12,
sint64 u_394_405,
sint64 v_394_405,
sint64 r_394_405,
sint64 s_394_405,
sint64 u_394_406,
sint64 v_394_406,
sint64 r_394_406,
sint64 s_394_406,
bit ne
)={
    u_394_405 * f_354_low60_40_low20_0 + v_394_405 * g_354_low60_40_low20_0 = f_354_low60_40_low20_11 * (-(2**20)),
    r_394_405 * f_354_low60_40_low20_0 + s_394_405 * g_354_low60_40_low20_0 = g_354_low60_40_low20_11 * (-(2**20))
&&
    u_394_405 * f_354_low60_40_low20_0 + v_394_405 * g_354_low60_40_low20_0 = f_354_low60_40_low20_11 * (const 64 (-(2**20))),
    r_394_405 * f_354_low60_40_low20_0 + s_394_405 * g_354_low60_40_low20_0 = g_354_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_11 + u_394_405 * (const 64 (2**21)) + v_394_405 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_11 + r_394_405 * (const 64 (2**21)) + s_394_405 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_11,
    f_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_11,
    g_354_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 405)) <=s delta, delta <=s (const 64 (1 + 2*405)),
    (const 64 (-(2**20))) <=s u_394_405, u_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_405, v_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_405, r_394_405 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_405, s_394_405 <=s (const 64 ((2**20)-1)),
    u_394_405 + v_394_405 <=s (const 64 (2**20)),
    u_394_405 - v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 + v_394_405 <=s (const 64 (2**20)),
    (const 64 0) - u_394_405 - v_394_405 <=s (const 64 (2**20)),
    r_394_405 + s_394_405 <=s (const 64 (2**20)),
    r_394_405 - s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 + s_394_405 <=s (const 64 (2**20)),
    (const 64 0) - r_394_405 - s_394_405 <=s (const 64 (2**20)),
    u_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_394_405 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_394_405 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step405

// premise c
assume
g_354_low60_40_low20_11 = 1 (mod 2)
&&
g_354_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_12 g_354_low60_40_low20_11;
mov u_394_406 r_394_405;
mov v_394_406 s_394_405;

subs dc g_354_low60_40_low20_12 g_354_low60_40_low20_11 f_354_low60_40_low20_11;
asr g_354_low60_40_low20_12 g_354_low60_40_low20_12 1;
subs dc r_394_406 r_394_405 u_394_405;
asr r_394_406 r_394_406 1;
subs dc s_394_406 s_394_405 v_394_405;
asr s_394_406 s_394_406 1;
assert
    true
&&
    f_354_low60_40_low20_12 = g_354_low60_40_low20_11,
    u_394_406 = r_394_405,
    v_394_406 = s_394_405,
    g_354_low60_40_low20_12 * (const 64 2) = g_354_low60_40_low20_11 - f_354_low60_40_low20_11,
    r_394_406 * (const 64 2) = r_394_405 - u_394_405,
    s_394_406 * (const 64 2) = s_394_405 - v_394_405
;

assume
    f_354_low60_40_low20_12 = g_354_low60_40_low20_11,
    u_394_406 = r_394_405,
    v_394_406 = s_394_405,
    g_354_low60_40_low20_12 * 2 = g_354_low60_40_low20_11 - f_354_low60_40_low20_11,
    r_394_406 * 2 = r_394_405 - u_394_405,
    s_394_406 * 2 = s_394_405 - v_394_405
&&
    true
;

{
    u_394_406 * f_354_low60_40_low20_0 + v_394_406 * g_354_low60_40_low20_0 = f_354_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_406 * f_354_low60_40_low20_0 + s_394_406 * g_354_low60_40_low20_0 = g_354_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_12 + u_394_406 * (const 64 (2**21)) + v_394_406 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_12 + r_394_406 * (const 64 (2**21)) + s_394_406 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_12,
    f_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_12,
    g_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 406)) <=s delta, delta <=s (const 64 (1 + 2*406)),
    (const 64 (-(2**20))) <=s u_394_406, u_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_406, v_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_406, r_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_406, s_394_406 <=s (const 64 ((2**20)-1)),
    u_394_406 + v_394_406 <=s (const 64 (2**20)),
    u_394_406 - v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 + v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 - v_394_406 <=s (const 64 (2**20)),
    r_394_406 + s_394_406 <=s (const 64 (2**20)),
    r_394_406 - s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 + s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 - s_394_406 <=s (const 64 (2**20)),
    u_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_394_406 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_406_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_12,
sint64 g_354_low60_40_low20_12,
sint64 f_354_low60_40_low20_13,
sint64 g_354_low60_40_low20_13,
sint64 u_394_406,
sint64 v_394_406,
sint64 r_394_406,
sint64 s_394_406,
sint64 u_394_407,
sint64 v_394_407,
sint64 r_394_407,
sint64 s_394_407,
bit ne
)={
    u_394_406 * f_354_low60_40_low20_0 + v_394_406 * g_354_low60_40_low20_0 = f_354_low60_40_low20_12 * (-(2**20)),
    r_394_406 * f_354_low60_40_low20_0 + s_394_406 * g_354_low60_40_low20_0 = g_354_low60_40_low20_12 * (-(2**20))
&&
    u_394_406 * f_354_low60_40_low20_0 + v_394_406 * g_354_low60_40_low20_0 = f_354_low60_40_low20_12 * (const 64 (-(2**20))),
    r_394_406 * f_354_low60_40_low20_0 + s_394_406 * g_354_low60_40_low20_0 = g_354_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_12 + u_394_406 * (const 64 (2**21)) + v_394_406 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_12 + r_394_406 * (const 64 (2**21)) + s_394_406 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_12,
    f_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_12,
    g_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 406)) <=s delta, delta <=s (const 64 (1 + 2*406)),
    (const 64 (-(2**20))) <=s u_394_406, u_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_406, v_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_406, r_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_406, s_394_406 <=s (const 64 ((2**20)-1)),
    u_394_406 + v_394_406 <=s (const 64 (2**20)),
    u_394_406 - v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 + v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 - v_394_406 <=s (const 64 (2**20)),
    r_394_406 + s_394_406 <=s (const 64 (2**20)),
    r_394_406 - s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 + s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 - s_394_406 <=s (const 64 (2**20)),
    u_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_394_406 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step406

// premise a
assume
g_354_low60_40_low20_12 = 0 (mod 2)
&&
g_354_low60_40_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_13 f_354_low60_40_low20_12;
mov u_394_407 u_394_406;
mov v_394_407 v_394_406;

asr g_354_low60_40_low20_13 g_354_low60_40_low20_12 1;
asr r_394_407 r_394_406 1;
asr s_394_407 s_394_406 1;
assert
    true
&&
    f_354_low60_40_low20_13 = f_354_low60_40_low20_12,
    u_394_407 = u_394_406,
    v_394_407 = v_394_406,
    g_354_low60_40_low20_13 * (const 64 2) = g_354_low60_40_low20_12,
    r_394_407 * (const 64 2) = r_394_406,
    s_394_407 * (const 64 2) = s_394_406
;

assume
    f_354_low60_40_low20_13 = f_354_low60_40_low20_12,
    u_394_407 = u_394_406,
    v_394_407 = v_394_406,
    g_354_low60_40_low20_13 * 2 = g_354_low60_40_low20_12,
    r_394_407 * 2 = r_394_406,
    s_394_407 * 2 = s_394_406
&&
    true
;

{
    u_394_407 * f_354_low60_40_low20_0 + v_394_407 * g_354_low60_40_low20_0 = f_354_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_407 * f_354_low60_40_low20_0 + s_394_407 * g_354_low60_40_low20_0 = g_354_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_13 + u_394_407 * (const 64 (2**21)) + v_394_407 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_13 + r_394_407 * (const 64 (2**21)) + s_394_407 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_13,
    f_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_13,
    g_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 407)) <=s delta, delta <=s (const 64 (1 + 2*407)),
    (const 64 (-(2**20))) <=s u_394_407, u_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_407, v_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_407, r_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_407, s_394_407 <=s (const 64 ((2**20)-1)),
    u_394_407 + v_394_407 <=s (const 64 (2**20)),
    u_394_407 - v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 + v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 - v_394_407 <=s (const 64 (2**20)),
    r_394_407 + s_394_407 <=s (const 64 (2**20)),
    r_394_407 - s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 + s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 - s_394_407 <=s (const 64 (2**20)),
    u_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_394_407 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_406_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_12,
sint64 g_354_low60_40_low20_12,
sint64 f_354_low60_40_low20_13,
sint64 g_354_low60_40_low20_13,
sint64 u_394_406,
sint64 v_394_406,
sint64 r_394_406,
sint64 s_394_406,
sint64 u_394_407,
sint64 v_394_407,
sint64 r_394_407,
sint64 s_394_407,
bit ne
)={
    u_394_406 * f_354_low60_40_low20_0 + v_394_406 * g_354_low60_40_low20_0 = f_354_low60_40_low20_12 * (-(2**20)),
    r_394_406 * f_354_low60_40_low20_0 + s_394_406 * g_354_low60_40_low20_0 = g_354_low60_40_low20_12 * (-(2**20))
&&
    u_394_406 * f_354_low60_40_low20_0 + v_394_406 * g_354_low60_40_low20_0 = f_354_low60_40_low20_12 * (const 64 (-(2**20))),
    r_394_406 * f_354_low60_40_low20_0 + s_394_406 * g_354_low60_40_low20_0 = g_354_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_12 + u_394_406 * (const 64 (2**21)) + v_394_406 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_12 + r_394_406 * (const 64 (2**21)) + s_394_406 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_12,
    f_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_12,
    g_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 406)) <=s delta, delta <=s (const 64 (1 + 2*406)),
    (const 64 (-(2**20))) <=s u_394_406, u_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_406, v_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_406, r_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_406, s_394_406 <=s (const 64 ((2**20)-1)),
    u_394_406 + v_394_406 <=s (const 64 (2**20)),
    u_394_406 - v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 + v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 - v_394_406 <=s (const 64 (2**20)),
    r_394_406 + s_394_406 <=s (const 64 (2**20)),
    r_394_406 - s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 + s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 - s_394_406 <=s (const 64 (2**20)),
    u_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_394_406 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step406

// premise b
assume
g_354_low60_40_low20_12 = 1 (mod 2)
&&
g_354_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_13 f_354_low60_40_low20_12;
mov u_394_407 u_394_406;
mov v_394_407 v_394_406;

add g_354_low60_40_low20_13 g_354_low60_40_low20_12 f_354_low60_40_low20_12;
asr g_354_low60_40_low20_13 g_354_low60_40_low20_13 1;
add r_394_407 r_394_406 u_394_406;
asr r_394_407 r_394_407 1;
add s_394_407 s_394_406 v_394_406;
asr s_394_407 s_394_407 1;
assert
    true
&&
    f_354_low60_40_low20_13 = f_354_low60_40_low20_12,
    u_394_407 = u_394_406,
    v_394_407 = v_394_406,
    g_354_low60_40_low20_13 * (const 64 2) = g_354_low60_40_low20_12 + f_354_low60_40_low20_12,
    r_394_407 * (const 64 2) = r_394_406 + u_394_406,
    s_394_407 * (const 64 2) = s_394_406 + v_394_406
;

assume
    f_354_low60_40_low20_13 = f_354_low60_40_low20_12,
    u_394_407 = u_394_406,
    v_394_407 = v_394_406,
    g_354_low60_40_low20_13 * 2 = g_354_low60_40_low20_12 + f_354_low60_40_low20_12,
    r_394_407 * 2 = r_394_406 + u_394_406,
    s_394_407 * 2 = s_394_406 + v_394_406
&&
    true
;

{
    u_394_407 * f_354_low60_40_low20_0 + v_394_407 * g_354_low60_40_low20_0 = f_354_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_407 * f_354_low60_40_low20_0 + s_394_407 * g_354_low60_40_low20_0 = g_354_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_13 + u_394_407 * (const 64 (2**21)) + v_394_407 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_13 + r_394_407 * (const 64 (2**21)) + s_394_407 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_13,
    f_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_13,
    g_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 407)) <=s delta, delta <=s (const 64 (1 + 2*407)),
    (const 64 (-(2**20))) <=s u_394_407, u_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_407, v_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_407, r_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_407, s_394_407 <=s (const 64 ((2**20)-1)),
    u_394_407 + v_394_407 <=s (const 64 (2**20)),
    u_394_407 - v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 + v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 - v_394_407 <=s (const 64 (2**20)),
    r_394_407 + s_394_407 <=s (const 64 (2**20)),
    r_394_407 - s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 + s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 - s_394_407 <=s (const 64 (2**20)),
    u_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_394_407 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_406_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_12,
sint64 g_354_low60_40_low20_12,
sint64 f_354_low60_40_low20_13,
sint64 g_354_low60_40_low20_13,
sint64 u_394_406,
sint64 v_394_406,
sint64 r_394_406,
sint64 s_394_406,
sint64 u_394_407,
sint64 v_394_407,
sint64 r_394_407,
sint64 s_394_407,
bit ne
)={
    u_394_406 * f_354_low60_40_low20_0 + v_394_406 * g_354_low60_40_low20_0 = f_354_low60_40_low20_12 * (-(2**20)),
    r_394_406 * f_354_low60_40_low20_0 + s_394_406 * g_354_low60_40_low20_0 = g_354_low60_40_low20_12 * (-(2**20))
&&
    u_394_406 * f_354_low60_40_low20_0 + v_394_406 * g_354_low60_40_low20_0 = f_354_low60_40_low20_12 * (const 64 (-(2**20))),
    r_394_406 * f_354_low60_40_low20_0 + s_394_406 * g_354_low60_40_low20_0 = g_354_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_12 + u_394_406 * (const 64 (2**21)) + v_394_406 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_12 + r_394_406 * (const 64 (2**21)) + s_394_406 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_12,
    f_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_12,
    g_354_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 406)) <=s delta, delta <=s (const 64 (1 + 2*406)),
    (const 64 (-(2**20))) <=s u_394_406, u_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_406, v_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_406, r_394_406 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_406, s_394_406 <=s (const 64 ((2**20)-1)),
    u_394_406 + v_394_406 <=s (const 64 (2**20)),
    u_394_406 - v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 + v_394_406 <=s (const 64 (2**20)),
    (const 64 0) - u_394_406 - v_394_406 <=s (const 64 (2**20)),
    r_394_406 + s_394_406 <=s (const 64 (2**20)),
    r_394_406 - s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 + s_394_406 <=s (const 64 (2**20)),
    (const 64 0) - r_394_406 - s_394_406 <=s (const 64 (2**20)),
    u_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_394_406 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_394_406 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step406

// premise c
assume
g_354_low60_40_low20_12 = 1 (mod 2)
&&
g_354_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_13 g_354_low60_40_low20_12;
mov u_394_407 r_394_406;
mov v_394_407 s_394_406;

subs dc g_354_low60_40_low20_13 g_354_low60_40_low20_12 f_354_low60_40_low20_12;
asr g_354_low60_40_low20_13 g_354_low60_40_low20_13 1;
subs dc r_394_407 r_394_406 u_394_406;
asr r_394_407 r_394_407 1;
subs dc s_394_407 s_394_406 v_394_406;
asr s_394_407 s_394_407 1;
assert
    true
&&
    f_354_low60_40_low20_13 = g_354_low60_40_low20_12,
    u_394_407 = r_394_406,
    v_394_407 = s_394_406,
    g_354_low60_40_low20_13 * (const 64 2) = g_354_low60_40_low20_12 - f_354_low60_40_low20_12,
    r_394_407 * (const 64 2) = r_394_406 - u_394_406,
    s_394_407 * (const 64 2) = s_394_406 - v_394_406
;

assume
    f_354_low60_40_low20_13 = g_354_low60_40_low20_12,
    u_394_407 = r_394_406,
    v_394_407 = s_394_406,
    g_354_low60_40_low20_13 * 2 = g_354_low60_40_low20_12 - f_354_low60_40_low20_12,
    r_394_407 * 2 = r_394_406 - u_394_406,
    s_394_407 * 2 = s_394_406 - v_394_406
&&
    true
;

{
    u_394_407 * f_354_low60_40_low20_0 + v_394_407 * g_354_low60_40_low20_0 = f_354_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_407 * f_354_low60_40_low20_0 + s_394_407 * g_354_low60_40_low20_0 = g_354_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_13 + u_394_407 * (const 64 (2**21)) + v_394_407 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_13 + r_394_407 * (const 64 (2**21)) + s_394_407 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_13,
    f_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_13,
    g_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 407)) <=s delta, delta <=s (const 64 (1 + 2*407)),
    (const 64 (-(2**20))) <=s u_394_407, u_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_407, v_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_407, r_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_407, s_394_407 <=s (const 64 ((2**20)-1)),
    u_394_407 + v_394_407 <=s (const 64 (2**20)),
    u_394_407 - v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 + v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 - v_394_407 <=s (const 64 (2**20)),
    r_394_407 + s_394_407 <=s (const 64 (2**20)),
    r_394_407 - s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 + s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 - s_394_407 <=s (const 64 (2**20)),
    u_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_394_407 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_407_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_13,
sint64 g_354_low60_40_low20_13,
sint64 f_354_low60_40_low20_14,
sint64 g_354_low60_40_low20_14,
sint64 u_394_407,
sint64 v_394_407,
sint64 r_394_407,
sint64 s_394_407,
sint64 u_394_408,
sint64 v_394_408,
sint64 r_394_408,
sint64 s_394_408,
bit ne
)={
    u_394_407 * f_354_low60_40_low20_0 + v_394_407 * g_354_low60_40_low20_0 = f_354_low60_40_low20_13 * (-(2**20)),
    r_394_407 * f_354_low60_40_low20_0 + s_394_407 * g_354_low60_40_low20_0 = g_354_low60_40_low20_13 * (-(2**20))
&&
    u_394_407 * f_354_low60_40_low20_0 + v_394_407 * g_354_low60_40_low20_0 = f_354_low60_40_low20_13 * (const 64 (-(2**20))),
    r_394_407 * f_354_low60_40_low20_0 + s_394_407 * g_354_low60_40_low20_0 = g_354_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_13 + u_394_407 * (const 64 (2**21)) + v_394_407 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_13 + r_394_407 * (const 64 (2**21)) + s_394_407 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_13,
    f_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_13,
    g_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 407)) <=s delta, delta <=s (const 64 (1 + 2*407)),
    (const 64 (-(2**20))) <=s u_394_407, u_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_407, v_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_407, r_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_407, s_394_407 <=s (const 64 ((2**20)-1)),
    u_394_407 + v_394_407 <=s (const 64 (2**20)),
    u_394_407 - v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 + v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 - v_394_407 <=s (const 64 (2**20)),
    r_394_407 + s_394_407 <=s (const 64 (2**20)),
    r_394_407 - s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 + s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 - s_394_407 <=s (const 64 (2**20)),
    u_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_394_407 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step407

// premise a
assume
g_354_low60_40_low20_13 = 0 (mod 2)
&&
g_354_low60_40_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_14 f_354_low60_40_low20_13;
mov u_394_408 u_394_407;
mov v_394_408 v_394_407;

asr g_354_low60_40_low20_14 g_354_low60_40_low20_13 1;
asr r_394_408 r_394_407 1;
asr s_394_408 s_394_407 1;
assert
    true
&&
    f_354_low60_40_low20_14 = f_354_low60_40_low20_13,
    u_394_408 = u_394_407,
    v_394_408 = v_394_407,
    g_354_low60_40_low20_14 * (const 64 2) = g_354_low60_40_low20_13,
    r_394_408 * (const 64 2) = r_394_407,
    s_394_408 * (const 64 2) = s_394_407
;

assume
    f_354_low60_40_low20_14 = f_354_low60_40_low20_13,
    u_394_408 = u_394_407,
    v_394_408 = v_394_407,
    g_354_low60_40_low20_14 * 2 = g_354_low60_40_low20_13,
    r_394_408 * 2 = r_394_407,
    s_394_408 * 2 = s_394_407
&&
    true
;

{
    u_394_408 * f_354_low60_40_low20_0 + v_394_408 * g_354_low60_40_low20_0 = f_354_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_408 * f_354_low60_40_low20_0 + s_394_408 * g_354_low60_40_low20_0 = g_354_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_14 + u_394_408 * (const 64 (2**21)) + v_394_408 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_14 + r_394_408 * (const 64 (2**21)) + s_394_408 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_14,
    f_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_14,
    g_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 408)) <=s delta, delta <=s (const 64 (1 + 2*408)),
    (const 64 (-(2**20))) <=s u_394_408, u_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_408, v_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_408, r_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_408, s_394_408 <=s (const 64 ((2**20)-1)),
    u_394_408 + v_394_408 <=s (const 64 (2**20)),
    u_394_408 - v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 + v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 - v_394_408 <=s (const 64 (2**20)),
    r_394_408 + s_394_408 <=s (const 64 (2**20)),
    r_394_408 - s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 + s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 - s_394_408 <=s (const 64 (2**20)),
    u_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_394_408 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_407_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_13,
sint64 g_354_low60_40_low20_13,
sint64 f_354_low60_40_low20_14,
sint64 g_354_low60_40_low20_14,
sint64 u_394_407,
sint64 v_394_407,
sint64 r_394_407,
sint64 s_394_407,
sint64 u_394_408,
sint64 v_394_408,
sint64 r_394_408,
sint64 s_394_408,
bit ne
)={
    u_394_407 * f_354_low60_40_low20_0 + v_394_407 * g_354_low60_40_low20_0 = f_354_low60_40_low20_13 * (-(2**20)),
    r_394_407 * f_354_low60_40_low20_0 + s_394_407 * g_354_low60_40_low20_0 = g_354_low60_40_low20_13 * (-(2**20))
&&
    u_394_407 * f_354_low60_40_low20_0 + v_394_407 * g_354_low60_40_low20_0 = f_354_low60_40_low20_13 * (const 64 (-(2**20))),
    r_394_407 * f_354_low60_40_low20_0 + s_394_407 * g_354_low60_40_low20_0 = g_354_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_13 + u_394_407 * (const 64 (2**21)) + v_394_407 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_13 + r_394_407 * (const 64 (2**21)) + s_394_407 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_13,
    f_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_13,
    g_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 407)) <=s delta, delta <=s (const 64 (1 + 2*407)),
    (const 64 (-(2**20))) <=s u_394_407, u_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_407, v_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_407, r_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_407, s_394_407 <=s (const 64 ((2**20)-1)),
    u_394_407 + v_394_407 <=s (const 64 (2**20)),
    u_394_407 - v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 + v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 - v_394_407 <=s (const 64 (2**20)),
    r_394_407 + s_394_407 <=s (const 64 (2**20)),
    r_394_407 - s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 + s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 - s_394_407 <=s (const 64 (2**20)),
    u_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_394_407 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step407

// premise b
assume
g_354_low60_40_low20_13 = 1 (mod 2)
&&
g_354_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_14 f_354_low60_40_low20_13;
mov u_394_408 u_394_407;
mov v_394_408 v_394_407;

add g_354_low60_40_low20_14 g_354_low60_40_low20_13 f_354_low60_40_low20_13;
asr g_354_low60_40_low20_14 g_354_low60_40_low20_14 1;
add r_394_408 r_394_407 u_394_407;
asr r_394_408 r_394_408 1;
add s_394_408 s_394_407 v_394_407;
asr s_394_408 s_394_408 1;
assert
    true
&&
    f_354_low60_40_low20_14 = f_354_low60_40_low20_13,
    u_394_408 = u_394_407,
    v_394_408 = v_394_407,
    g_354_low60_40_low20_14 * (const 64 2) = g_354_low60_40_low20_13 + f_354_low60_40_low20_13,
    r_394_408 * (const 64 2) = r_394_407 + u_394_407,
    s_394_408 * (const 64 2) = s_394_407 + v_394_407
;

assume
    f_354_low60_40_low20_14 = f_354_low60_40_low20_13,
    u_394_408 = u_394_407,
    v_394_408 = v_394_407,
    g_354_low60_40_low20_14 * 2 = g_354_low60_40_low20_13 + f_354_low60_40_low20_13,
    r_394_408 * 2 = r_394_407 + u_394_407,
    s_394_408 * 2 = s_394_407 + v_394_407
&&
    true
;

{
    u_394_408 * f_354_low60_40_low20_0 + v_394_408 * g_354_low60_40_low20_0 = f_354_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_408 * f_354_low60_40_low20_0 + s_394_408 * g_354_low60_40_low20_0 = g_354_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_14 + u_394_408 * (const 64 (2**21)) + v_394_408 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_14 + r_394_408 * (const 64 (2**21)) + s_394_408 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_14,
    f_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_14,
    g_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 408)) <=s delta, delta <=s (const 64 (1 + 2*408)),
    (const 64 (-(2**20))) <=s u_394_408, u_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_408, v_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_408, r_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_408, s_394_408 <=s (const 64 ((2**20)-1)),
    u_394_408 + v_394_408 <=s (const 64 (2**20)),
    u_394_408 - v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 + v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 - v_394_408 <=s (const 64 (2**20)),
    r_394_408 + s_394_408 <=s (const 64 (2**20)),
    r_394_408 - s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 + s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 - s_394_408 <=s (const 64 (2**20)),
    u_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_394_408 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_407_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_13,
sint64 g_354_low60_40_low20_13,
sint64 f_354_low60_40_low20_14,
sint64 g_354_low60_40_low20_14,
sint64 u_394_407,
sint64 v_394_407,
sint64 r_394_407,
sint64 s_394_407,
sint64 u_394_408,
sint64 v_394_408,
sint64 r_394_408,
sint64 s_394_408,
bit ne
)={
    u_394_407 * f_354_low60_40_low20_0 + v_394_407 * g_354_low60_40_low20_0 = f_354_low60_40_low20_13 * (-(2**20)),
    r_394_407 * f_354_low60_40_low20_0 + s_394_407 * g_354_low60_40_low20_0 = g_354_low60_40_low20_13 * (-(2**20))
&&
    u_394_407 * f_354_low60_40_low20_0 + v_394_407 * g_354_low60_40_low20_0 = f_354_low60_40_low20_13 * (const 64 (-(2**20))),
    r_394_407 * f_354_low60_40_low20_0 + s_394_407 * g_354_low60_40_low20_0 = g_354_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_13 + u_394_407 * (const 64 (2**21)) + v_394_407 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_13 + r_394_407 * (const 64 (2**21)) + s_394_407 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_13,
    f_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_13,
    g_354_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 407)) <=s delta, delta <=s (const 64 (1 + 2*407)),
    (const 64 (-(2**20))) <=s u_394_407, u_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_407, v_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_407, r_394_407 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_407, s_394_407 <=s (const 64 ((2**20)-1)),
    u_394_407 + v_394_407 <=s (const 64 (2**20)),
    u_394_407 - v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 + v_394_407 <=s (const 64 (2**20)),
    (const 64 0) - u_394_407 - v_394_407 <=s (const 64 (2**20)),
    r_394_407 + s_394_407 <=s (const 64 (2**20)),
    r_394_407 - s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 + s_394_407 <=s (const 64 (2**20)),
    (const 64 0) - r_394_407 - s_394_407 <=s (const 64 (2**20)),
    u_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_394_407 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_394_407 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step407

// premise c
assume
g_354_low60_40_low20_13 = 1 (mod 2)
&&
g_354_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_14 g_354_low60_40_low20_13;
mov u_394_408 r_394_407;
mov v_394_408 s_394_407;

subs dc g_354_low60_40_low20_14 g_354_low60_40_low20_13 f_354_low60_40_low20_13;
asr g_354_low60_40_low20_14 g_354_low60_40_low20_14 1;
subs dc r_394_408 r_394_407 u_394_407;
asr r_394_408 r_394_408 1;
subs dc s_394_408 s_394_407 v_394_407;
asr s_394_408 s_394_408 1;
assert
    true
&&
    f_354_low60_40_low20_14 = g_354_low60_40_low20_13,
    u_394_408 = r_394_407,
    v_394_408 = s_394_407,
    g_354_low60_40_low20_14 * (const 64 2) = g_354_low60_40_low20_13 - f_354_low60_40_low20_13,
    r_394_408 * (const 64 2) = r_394_407 - u_394_407,
    s_394_408 * (const 64 2) = s_394_407 - v_394_407
;

assume
    f_354_low60_40_low20_14 = g_354_low60_40_low20_13,
    u_394_408 = r_394_407,
    v_394_408 = s_394_407,
    g_354_low60_40_low20_14 * 2 = g_354_low60_40_low20_13 - f_354_low60_40_low20_13,
    r_394_408 * 2 = r_394_407 - u_394_407,
    s_394_408 * 2 = s_394_407 - v_394_407
&&
    true
;

{
    u_394_408 * f_354_low60_40_low20_0 + v_394_408 * g_354_low60_40_low20_0 = f_354_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_408 * f_354_low60_40_low20_0 + s_394_408 * g_354_low60_40_low20_0 = g_354_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_14 + u_394_408 * (const 64 (2**21)) + v_394_408 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_14 + r_394_408 * (const 64 (2**21)) + s_394_408 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_14,
    f_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_14,
    g_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 408)) <=s delta, delta <=s (const 64 (1 + 2*408)),
    (const 64 (-(2**20))) <=s u_394_408, u_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_408, v_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_408, r_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_408, s_394_408 <=s (const 64 ((2**20)-1)),
    u_394_408 + v_394_408 <=s (const 64 (2**20)),
    u_394_408 - v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 + v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 - v_394_408 <=s (const 64 (2**20)),
    r_394_408 + s_394_408 <=s (const 64 (2**20)),
    r_394_408 - s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 + s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 - s_394_408 <=s (const 64 (2**20)),
    u_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_394_408 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_408_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_14,
sint64 g_354_low60_40_low20_14,
sint64 f_354_low60_40_low20_15,
sint64 g_354_low60_40_low20_15,
sint64 u_394_408,
sint64 v_394_408,
sint64 r_394_408,
sint64 s_394_408,
sint64 u_394_409,
sint64 v_394_409,
sint64 r_394_409,
sint64 s_394_409,
bit ne
)={
    u_394_408 * f_354_low60_40_low20_0 + v_394_408 * g_354_low60_40_low20_0 = f_354_low60_40_low20_14 * (-(2**20)),
    r_394_408 * f_354_low60_40_low20_0 + s_394_408 * g_354_low60_40_low20_0 = g_354_low60_40_low20_14 * (-(2**20))
&&
    u_394_408 * f_354_low60_40_low20_0 + v_394_408 * g_354_low60_40_low20_0 = f_354_low60_40_low20_14 * (const 64 (-(2**20))),
    r_394_408 * f_354_low60_40_low20_0 + s_394_408 * g_354_low60_40_low20_0 = g_354_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_14 + u_394_408 * (const 64 (2**21)) + v_394_408 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_14 + r_394_408 * (const 64 (2**21)) + s_394_408 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_14,
    f_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_14,
    g_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 408)) <=s delta, delta <=s (const 64 (1 + 2*408)),
    (const 64 (-(2**20))) <=s u_394_408, u_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_408, v_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_408, r_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_408, s_394_408 <=s (const 64 ((2**20)-1)),
    u_394_408 + v_394_408 <=s (const 64 (2**20)),
    u_394_408 - v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 + v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 - v_394_408 <=s (const 64 (2**20)),
    r_394_408 + s_394_408 <=s (const 64 (2**20)),
    r_394_408 - s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 + s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 - s_394_408 <=s (const 64 (2**20)),
    u_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_394_408 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step408

// premise a
assume
g_354_low60_40_low20_14 = 0 (mod 2)
&&
g_354_low60_40_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_15 f_354_low60_40_low20_14;
mov u_394_409 u_394_408;
mov v_394_409 v_394_408;

asr g_354_low60_40_low20_15 g_354_low60_40_low20_14 1;
asr r_394_409 r_394_408 1;
asr s_394_409 s_394_408 1;
assert
    true
&&
    f_354_low60_40_low20_15 = f_354_low60_40_low20_14,
    u_394_409 = u_394_408,
    v_394_409 = v_394_408,
    g_354_low60_40_low20_15 * (const 64 2) = g_354_low60_40_low20_14,
    r_394_409 * (const 64 2) = r_394_408,
    s_394_409 * (const 64 2) = s_394_408
;

assume
    f_354_low60_40_low20_15 = f_354_low60_40_low20_14,
    u_394_409 = u_394_408,
    v_394_409 = v_394_408,
    g_354_low60_40_low20_15 * 2 = g_354_low60_40_low20_14,
    r_394_409 * 2 = r_394_408,
    s_394_409 * 2 = s_394_408
&&
    true
;

{
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_15 + u_394_409 * (const 64 (2**21)) + v_394_409 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_15 + r_394_409 * (const 64 (2**21)) + s_394_409 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_15,
    f_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_15,
    g_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 409)) <=s delta, delta <=s (const 64 (1 + 2*409)),
    (const 64 (-(2**20))) <=s u_394_409, u_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_409, v_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_409, r_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_409, s_394_409 <=s (const 64 ((2**20)-1)),
    u_394_409 + v_394_409 <=s (const 64 (2**20)),
    u_394_409 - v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 + v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 - v_394_409 <=s (const 64 (2**20)),
    r_394_409 + s_394_409 <=s (const 64 (2**20)),
    r_394_409 - s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 + s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 - s_394_409 <=s (const 64 (2**20)),
    u_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_394_409 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_408_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_14,
sint64 g_354_low60_40_low20_14,
sint64 f_354_low60_40_low20_15,
sint64 g_354_low60_40_low20_15,
sint64 u_394_408,
sint64 v_394_408,
sint64 r_394_408,
sint64 s_394_408,
sint64 u_394_409,
sint64 v_394_409,
sint64 r_394_409,
sint64 s_394_409,
bit ne
)={
    u_394_408 * f_354_low60_40_low20_0 + v_394_408 * g_354_low60_40_low20_0 = f_354_low60_40_low20_14 * (-(2**20)),
    r_394_408 * f_354_low60_40_low20_0 + s_394_408 * g_354_low60_40_low20_0 = g_354_low60_40_low20_14 * (-(2**20))
&&
    u_394_408 * f_354_low60_40_low20_0 + v_394_408 * g_354_low60_40_low20_0 = f_354_low60_40_low20_14 * (const 64 (-(2**20))),
    r_394_408 * f_354_low60_40_low20_0 + s_394_408 * g_354_low60_40_low20_0 = g_354_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_14 + u_394_408 * (const 64 (2**21)) + v_394_408 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_14 + r_394_408 * (const 64 (2**21)) + s_394_408 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_14,
    f_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_14,
    g_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 408)) <=s delta, delta <=s (const 64 (1 + 2*408)),
    (const 64 (-(2**20))) <=s u_394_408, u_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_408, v_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_408, r_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_408, s_394_408 <=s (const 64 ((2**20)-1)),
    u_394_408 + v_394_408 <=s (const 64 (2**20)),
    u_394_408 - v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 + v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 - v_394_408 <=s (const 64 (2**20)),
    r_394_408 + s_394_408 <=s (const 64 (2**20)),
    r_394_408 - s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 + s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 - s_394_408 <=s (const 64 (2**20)),
    u_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_394_408 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step408

// premise b
assume
g_354_low60_40_low20_14 = 1 (mod 2)
&&
g_354_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_15 f_354_low60_40_low20_14;
mov u_394_409 u_394_408;
mov v_394_409 v_394_408;

add g_354_low60_40_low20_15 g_354_low60_40_low20_14 f_354_low60_40_low20_14;
asr g_354_low60_40_low20_15 g_354_low60_40_low20_15 1;
add r_394_409 r_394_408 u_394_408;
asr r_394_409 r_394_409 1;
add s_394_409 s_394_408 v_394_408;
asr s_394_409 s_394_409 1;
assert
    true
&&
    f_354_low60_40_low20_15 = f_354_low60_40_low20_14,
    u_394_409 = u_394_408,
    v_394_409 = v_394_408,
    g_354_low60_40_low20_15 * (const 64 2) = g_354_low60_40_low20_14 + f_354_low60_40_low20_14,
    r_394_409 * (const 64 2) = r_394_408 + u_394_408,
    s_394_409 * (const 64 2) = s_394_408 + v_394_408
;

assume
    f_354_low60_40_low20_15 = f_354_low60_40_low20_14,
    u_394_409 = u_394_408,
    v_394_409 = v_394_408,
    g_354_low60_40_low20_15 * 2 = g_354_low60_40_low20_14 + f_354_low60_40_low20_14,
    r_394_409 * 2 = r_394_408 + u_394_408,
    s_394_409 * 2 = s_394_408 + v_394_408
&&
    true
;

{
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_15 + u_394_409 * (const 64 (2**21)) + v_394_409 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_15 + r_394_409 * (const 64 (2**21)) + s_394_409 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_15,
    f_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_15,
    g_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 409)) <=s delta, delta <=s (const 64 (1 + 2*409)),
    (const 64 (-(2**20))) <=s u_394_409, u_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_409, v_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_409, r_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_409, s_394_409 <=s (const 64 ((2**20)-1)),
    u_394_409 + v_394_409 <=s (const 64 (2**20)),
    u_394_409 - v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 + v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 - v_394_409 <=s (const 64 (2**20)),
    r_394_409 + s_394_409 <=s (const 64 (2**20)),
    r_394_409 - s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 + s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 - s_394_409 <=s (const 64 (2**20)),
    u_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_394_409 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_408_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_14,
sint64 g_354_low60_40_low20_14,
sint64 f_354_low60_40_low20_15,
sint64 g_354_low60_40_low20_15,
sint64 u_394_408,
sint64 v_394_408,
sint64 r_394_408,
sint64 s_394_408,
sint64 u_394_409,
sint64 v_394_409,
sint64 r_394_409,
sint64 s_394_409,
bit ne
)={
    u_394_408 * f_354_low60_40_low20_0 + v_394_408 * g_354_low60_40_low20_0 = f_354_low60_40_low20_14 * (-(2**20)),
    r_394_408 * f_354_low60_40_low20_0 + s_394_408 * g_354_low60_40_low20_0 = g_354_low60_40_low20_14 * (-(2**20))
&&
    u_394_408 * f_354_low60_40_low20_0 + v_394_408 * g_354_low60_40_low20_0 = f_354_low60_40_low20_14 * (const 64 (-(2**20))),
    r_394_408 * f_354_low60_40_low20_0 + s_394_408 * g_354_low60_40_low20_0 = g_354_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_14 + u_394_408 * (const 64 (2**21)) + v_394_408 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_14 + r_394_408 * (const 64 (2**21)) + s_394_408 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_14,
    f_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_14,
    g_354_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 408)) <=s delta, delta <=s (const 64 (1 + 2*408)),
    (const 64 (-(2**20))) <=s u_394_408, u_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_408, v_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_408, r_394_408 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_408, s_394_408 <=s (const 64 ((2**20)-1)),
    u_394_408 + v_394_408 <=s (const 64 (2**20)),
    u_394_408 - v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 + v_394_408 <=s (const 64 (2**20)),
    (const 64 0) - u_394_408 - v_394_408 <=s (const 64 (2**20)),
    r_394_408 + s_394_408 <=s (const 64 (2**20)),
    r_394_408 - s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 + s_394_408 <=s (const 64 (2**20)),
    (const 64 0) - r_394_408 - s_394_408 <=s (const 64 (2**20)),
    u_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_394_408 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_394_408 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step408

// premise c
assume
g_354_low60_40_low20_14 = 1 (mod 2)
&&
g_354_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_15 g_354_low60_40_low20_14;
mov u_394_409 r_394_408;
mov v_394_409 s_394_408;

subs dc g_354_low60_40_low20_15 g_354_low60_40_low20_14 f_354_low60_40_low20_14;
asr g_354_low60_40_low20_15 g_354_low60_40_low20_15 1;
subs dc r_394_409 r_394_408 u_394_408;
asr r_394_409 r_394_409 1;
subs dc s_394_409 s_394_408 v_394_408;
asr s_394_409 s_394_409 1;
assert
    true
&&
    f_354_low60_40_low20_15 = g_354_low60_40_low20_14,
    u_394_409 = r_394_408,
    v_394_409 = s_394_408,
    g_354_low60_40_low20_15 * (const 64 2) = g_354_low60_40_low20_14 - f_354_low60_40_low20_14,
    r_394_409 * (const 64 2) = r_394_408 - u_394_408,
    s_394_409 * (const 64 2) = s_394_408 - v_394_408
;

assume
    f_354_low60_40_low20_15 = g_354_low60_40_low20_14,
    u_394_409 = r_394_408,
    v_394_409 = s_394_408,
    g_354_low60_40_low20_15 * 2 = g_354_low60_40_low20_14 - f_354_low60_40_low20_14,
    r_394_409 * 2 = r_394_408 - u_394_408,
    s_394_409 * 2 = s_394_408 - v_394_408
&&
    true
;

{
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_15 + u_394_409 * (const 64 (2**21)) + v_394_409 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_15 + r_394_409 * (const 64 (2**21)) + s_394_409 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_15,
    f_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_15,
    g_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 409)) <=s delta, delta <=s (const 64 (1 + 2*409)),
    (const 64 (-(2**20))) <=s u_394_409, u_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_409, v_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_409, r_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_409, s_394_409 <=s (const 64 ((2**20)-1)),
    u_394_409 + v_394_409 <=s (const 64 (2**20)),
    u_394_409 - v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 + v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 - v_394_409 <=s (const 64 (2**20)),
    r_394_409 + s_394_409 <=s (const 64 (2**20)),
    r_394_409 - s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 + s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 - s_394_409 <=s (const 64 (2**20)),
    u_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_394_409 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_409_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_15,
sint64 g_354_low60_40_low20_15,
sint64 f_354_low60_40_low20_16,
sint64 g_354_low60_40_low20_16,
sint64 u_394_409,
sint64 v_394_409,
sint64 r_394_409,
sint64 s_394_409,
sint64 u_394_410,
sint64 v_394_410,
sint64 r_394_410,
sint64 s_394_410,
bit ne
)={
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (-(2**20)),
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (-(2**20))
&&
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (const 64 (-(2**20))),
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_15 + u_394_409 * (const 64 (2**21)) + v_394_409 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_15 + r_394_409 * (const 64 (2**21)) + s_394_409 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_15,
    f_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_15,
    g_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 409)) <=s delta, delta <=s (const 64 (1 + 2*409)),
    (const 64 (-(2**20))) <=s u_394_409, u_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_409, v_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_409, r_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_409, s_394_409 <=s (const 64 ((2**20)-1)),
    u_394_409 + v_394_409 <=s (const 64 (2**20)),
    u_394_409 - v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 + v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 - v_394_409 <=s (const 64 (2**20)),
    r_394_409 + s_394_409 <=s (const 64 (2**20)),
    r_394_409 - s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 + s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 - s_394_409 <=s (const 64 (2**20)),
    u_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_394_409 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step409

// premise a
assume
g_354_low60_40_low20_15 = 0 (mod 2)
&&
g_354_low60_40_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_16 f_354_low60_40_low20_15;
mov u_394_410 u_394_409;
mov v_394_410 v_394_409;

asr g_354_low60_40_low20_16 g_354_low60_40_low20_15 1;
asr r_394_410 r_394_409 1;
asr s_394_410 s_394_409 1;
assert
    true
&&
    f_354_low60_40_low20_16 = f_354_low60_40_low20_15,
    u_394_410 = u_394_409,
    v_394_410 = v_394_409,
    g_354_low60_40_low20_16 * (const 64 2) = g_354_low60_40_low20_15,
    r_394_410 * (const 64 2) = r_394_409,
    s_394_410 * (const 64 2) = s_394_409
;

assume
    f_354_low60_40_low20_16 = f_354_low60_40_low20_15,
    u_394_410 = u_394_409,
    v_394_410 = v_394_409,
    g_354_low60_40_low20_16 * 2 = g_354_low60_40_low20_15,
    r_394_410 * 2 = r_394_409,
    s_394_410 * 2 = s_394_409
&&
    true
;

{
    u_394_410 * f_354_low60_40_low20_0 + v_394_410 * g_354_low60_40_low20_0 = f_354_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_410 * f_354_low60_40_low20_0 + s_394_410 * g_354_low60_40_low20_0 = g_354_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_16 + u_394_410 * (const 64 (2**21)) + v_394_410 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_16 + r_394_410 * (const 64 (2**21)) + s_394_410 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_16,
    f_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_16,
    g_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 410)) <=s delta, delta <=s (const 64 (1 + 2*410)),
    (const 64 (-(2**20))) <=s u_394_410, u_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_410, v_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_410, r_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_410, s_394_410 <=s (const 64 ((2**20)-1)),
    u_394_410 + v_394_410 <=s (const 64 (2**20)),
    u_394_410 - v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 + v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 - v_394_410 <=s (const 64 (2**20)),
    r_394_410 + s_394_410 <=s (const 64 (2**20)),
    r_394_410 - s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 + s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 - s_394_410 <=s (const 64 (2**20)),
    u_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_394_410 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_409_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_15,
sint64 g_354_low60_40_low20_15,
sint64 f_354_low60_40_low20_16,
sint64 g_354_low60_40_low20_16,
sint64 u_394_409,
sint64 v_394_409,
sint64 r_394_409,
sint64 s_394_409,
sint64 u_394_410,
sint64 v_394_410,
sint64 r_394_410,
sint64 s_394_410,
bit ne
)={
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (-(2**20)),
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (-(2**20))
&&
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (const 64 (-(2**20))),
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_15 + u_394_409 * (const 64 (2**21)) + v_394_409 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_15 + r_394_409 * (const 64 (2**21)) + s_394_409 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_15,
    f_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_15,
    g_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 409)) <=s delta, delta <=s (const 64 (1 + 2*409)),
    (const 64 (-(2**20))) <=s u_394_409, u_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_409, v_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_409, r_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_409, s_394_409 <=s (const 64 ((2**20)-1)),
    u_394_409 + v_394_409 <=s (const 64 (2**20)),
    u_394_409 - v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 + v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 - v_394_409 <=s (const 64 (2**20)),
    r_394_409 + s_394_409 <=s (const 64 (2**20)),
    r_394_409 - s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 + s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 - s_394_409 <=s (const 64 (2**20)),
    u_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_394_409 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step409

// premise b
assume
g_354_low60_40_low20_15 = 1 (mod 2)
&&
g_354_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_16 f_354_low60_40_low20_15;
mov u_394_410 u_394_409;
mov v_394_410 v_394_409;

add g_354_low60_40_low20_16 g_354_low60_40_low20_15 f_354_low60_40_low20_15;
asr g_354_low60_40_low20_16 g_354_low60_40_low20_16 1;
add r_394_410 r_394_409 u_394_409;
asr r_394_410 r_394_410 1;
add s_394_410 s_394_409 v_394_409;
asr s_394_410 s_394_410 1;
assert
    true
&&
    f_354_low60_40_low20_16 = f_354_low60_40_low20_15,
    u_394_410 = u_394_409,
    v_394_410 = v_394_409,
    g_354_low60_40_low20_16 * (const 64 2) = g_354_low60_40_low20_15 + f_354_low60_40_low20_15,
    r_394_410 * (const 64 2) = r_394_409 + u_394_409,
    s_394_410 * (const 64 2) = s_394_409 + v_394_409
;

assume
    f_354_low60_40_low20_16 = f_354_low60_40_low20_15,
    u_394_410 = u_394_409,
    v_394_410 = v_394_409,
    g_354_low60_40_low20_16 * 2 = g_354_low60_40_low20_15 + f_354_low60_40_low20_15,
    r_394_410 * 2 = r_394_409 + u_394_409,
    s_394_410 * 2 = s_394_409 + v_394_409
&&
    true
;

{
    u_394_410 * f_354_low60_40_low20_0 + v_394_410 * g_354_low60_40_low20_0 = f_354_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_410 * f_354_low60_40_low20_0 + s_394_410 * g_354_low60_40_low20_0 = g_354_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_16 + u_394_410 * (const 64 (2**21)) + v_394_410 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_16 + r_394_410 * (const 64 (2**21)) + s_394_410 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_16,
    f_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_16,
    g_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 410)) <=s delta, delta <=s (const 64 (1 + 2*410)),
    (const 64 (-(2**20))) <=s u_394_410, u_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_410, v_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_410, r_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_410, s_394_410 <=s (const 64 ((2**20)-1)),
    u_394_410 + v_394_410 <=s (const 64 (2**20)),
    u_394_410 - v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 + v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 - v_394_410 <=s (const 64 (2**20)),
    r_394_410 + s_394_410 <=s (const 64 (2**20)),
    r_394_410 - s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 + s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 - s_394_410 <=s (const 64 (2**20)),
    u_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_394_410 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_409_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_15,
sint64 g_354_low60_40_low20_15,
sint64 f_354_low60_40_low20_16,
sint64 g_354_low60_40_low20_16,
sint64 u_394_409,
sint64 v_394_409,
sint64 r_394_409,
sint64 s_394_409,
sint64 u_394_410,
sint64 v_394_410,
sint64 r_394_410,
sint64 s_394_410,
bit ne
)={
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (-(2**20)),
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (-(2**20))
&&
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (const 64 (-(2**20))),
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_15 + u_394_409 * (const 64 (2**21)) + v_394_409 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_15 + r_394_409 * (const 64 (2**21)) + s_394_409 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_15,
    f_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_15,
    g_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 409)) <=s delta, delta <=s (const 64 (1 + 2*409)),
    (const 64 (-(2**20))) <=s u_394_409, u_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_409, v_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_409, r_394_409 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_409, s_394_409 <=s (const 64 ((2**20)-1)),
    u_394_409 + v_394_409 <=s (const 64 (2**20)),
    u_394_409 - v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 + v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 - v_394_409 <=s (const 64 (2**20)),
    r_394_409 + s_394_409 <=s (const 64 (2**20)),
    r_394_409 - s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 + s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 - s_394_409 <=s (const 64 (2**20)),
    u_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_394_409 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step409

// premise c
assume
g_354_low60_40_low20_15 = 1 (mod 2)
&&
g_354_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_16 g_354_low60_40_low20_15;
mov u_394_410 r_394_409;
mov v_394_410 s_394_409;

subs dc g_354_low60_40_low20_16 g_354_low60_40_low20_15 f_354_low60_40_low20_15;
asr g_354_low60_40_low20_16 g_354_low60_40_low20_16 1;
subs dc r_394_410 r_394_409 u_394_409;
asr r_394_410 r_394_410 1;
subs dc s_394_410 s_394_409 v_394_409;
asr s_394_410 s_394_410 1;
assert
    true
&&
    f_354_low60_40_low20_16 = g_354_low60_40_low20_15,
    u_394_410 = r_394_409,
    v_394_410 = s_394_409,
    g_354_low60_40_low20_16 * (const 64 2) = g_354_low60_40_low20_15 - f_354_low60_40_low20_15,
    r_394_410 * (const 64 2) = r_394_409 - u_394_409,
    s_394_410 * (const 64 2) = s_394_409 - v_394_409
;

assume
    f_354_low60_40_low20_16 = g_354_low60_40_low20_15,
    u_394_410 = r_394_409,
    v_394_410 = s_394_409,
    g_354_low60_40_low20_16 * 2 = g_354_low60_40_low20_15 - f_354_low60_40_low20_15,
    r_394_410 * 2 = r_394_409 - u_394_409,
    s_394_410 * 2 = s_394_409 - v_394_409
&&
    true
;

{
    u_394_410 * f_354_low60_40_low20_0 + v_394_410 * g_354_low60_40_low20_0 = f_354_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_410 * f_354_low60_40_low20_0 + s_394_410 * g_354_low60_40_low20_0 = g_354_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_16 + u_394_410 * (const 64 (2**21)) + v_394_410 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_16 + r_394_410 * (const 64 (2**21)) + s_394_410 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_16,
    f_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_16,
    g_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 410)) <=s delta, delta <=s (const 64 (1 + 2*410)),
    (const 64 (-(2**20))) <=s u_394_410, u_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_410, v_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_410, r_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_410, s_394_410 <=s (const 64 ((2**20)-1)),
    u_394_410 + v_394_410 <=s (const 64 (2**20)),
    u_394_410 - v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 + v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 - v_394_410 <=s (const 64 (2**20)),
    r_394_410 + s_394_410 <=s (const 64 (2**20)),
    r_394_410 - s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 + s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 - s_394_410 <=s (const 64 (2**20)),
    u_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_394_410 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_410_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_16,
sint64 g_354_low60_40_low20_16,
sint64 f_354_low60_40_low20_17,
sint64 g_354_low60_40_low20_17,
sint64 u_394_410,
sint64 v_394_410,
sint64 r_394_410,
sint64 s_394_410,
sint64 u_394_411,
sint64 v_394_411,
sint64 r_394_411,
sint64 s_394_411,
bit ne
)={
    u_394_410 * f_354_low60_40_low20_0 + v_394_410 * g_354_low60_40_low20_0 = f_354_low60_40_low20_16 * (-(2**20)),
    r_394_410 * f_354_low60_40_low20_0 + s_394_410 * g_354_low60_40_low20_0 = g_354_low60_40_low20_16 * (-(2**20))
&&
    u_394_410 * f_354_low60_40_low20_0 + v_394_410 * g_354_low60_40_low20_0 = f_354_low60_40_low20_16 * (const 64 (-(2**20))),
    r_394_410 * f_354_low60_40_low20_0 + s_394_410 * g_354_low60_40_low20_0 = g_354_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_16 + u_394_410 * (const 64 (2**21)) + v_394_410 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_16 + r_394_410 * (const 64 (2**21)) + s_394_410 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_16,
    f_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_16,
    g_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 410)) <=s delta, delta <=s (const 64 (1 + 2*410)),
    (const 64 (-(2**20))) <=s u_394_410, u_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_410, v_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_410, r_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_410, s_394_410 <=s (const 64 ((2**20)-1)),
    u_394_410 + v_394_410 <=s (const 64 (2**20)),
    u_394_410 - v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 + v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 - v_394_410 <=s (const 64 (2**20)),
    r_394_410 + s_394_410 <=s (const 64 (2**20)),
    r_394_410 - s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 + s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 - s_394_410 <=s (const 64 (2**20)),
    u_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_394_410 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step410

// premise a
assume
g_354_low60_40_low20_16 = 0 (mod 2)
&&
g_354_low60_40_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_17 f_354_low60_40_low20_16;
mov u_394_411 u_394_410;
mov v_394_411 v_394_410;

asr g_354_low60_40_low20_17 g_354_low60_40_low20_16 1;
asr r_394_411 r_394_410 1;
asr s_394_411 s_394_410 1;
assert
    true
&&
    f_354_low60_40_low20_17 = f_354_low60_40_low20_16,
    u_394_411 = u_394_410,
    v_394_411 = v_394_410,
    g_354_low60_40_low20_17 * (const 64 2) = g_354_low60_40_low20_16,
    r_394_411 * (const 64 2) = r_394_410,
    s_394_411 * (const 64 2) = s_394_410
;

assume
    f_354_low60_40_low20_17 = f_354_low60_40_low20_16,
    u_394_411 = u_394_410,
    v_394_411 = v_394_410,
    g_354_low60_40_low20_17 * 2 = g_354_low60_40_low20_16,
    r_394_411 * 2 = r_394_410,
    s_394_411 * 2 = s_394_410
&&
    true
;

{
    u_394_411 * f_354_low60_40_low20_0 + v_394_411 * g_354_low60_40_low20_0 = f_354_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_411 * f_354_low60_40_low20_0 + s_394_411 * g_354_low60_40_low20_0 = g_354_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_17 + u_394_411 * (const 64 (2**21)) + v_394_411 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_17 + r_394_411 * (const 64 (2**21)) + s_394_411 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_17,
    f_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_17,
    g_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 411)) <=s delta, delta <=s (const 64 (1 + 2*411)),
    (const 64 (-(2**20))) <=s u_394_411, u_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_411, v_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_411, r_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_411, s_394_411 <=s (const 64 ((2**20)-1)),
    u_394_411 + v_394_411 <=s (const 64 (2**20)),
    u_394_411 - v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 + v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 - v_394_411 <=s (const 64 (2**20)),
    r_394_411 + s_394_411 <=s (const 64 (2**20)),
    r_394_411 - s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 + s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 - s_394_411 <=s (const 64 (2**20)),
    u_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_394_411 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_410_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_16,
sint64 g_354_low60_40_low20_16,
sint64 f_354_low60_40_low20_17,
sint64 g_354_low60_40_low20_17,
sint64 u_394_410,
sint64 v_394_410,
sint64 r_394_410,
sint64 s_394_410,
sint64 u_394_411,
sint64 v_394_411,
sint64 r_394_411,
sint64 s_394_411,
bit ne
)={
    u_394_410 * f_354_low60_40_low20_0 + v_394_410 * g_354_low60_40_low20_0 = f_354_low60_40_low20_16 * (-(2**20)),
    r_394_410 * f_354_low60_40_low20_0 + s_394_410 * g_354_low60_40_low20_0 = g_354_low60_40_low20_16 * (-(2**20))
&&
    u_394_410 * f_354_low60_40_low20_0 + v_394_410 * g_354_low60_40_low20_0 = f_354_low60_40_low20_16 * (const 64 (-(2**20))),
    r_394_410 * f_354_low60_40_low20_0 + s_394_410 * g_354_low60_40_low20_0 = g_354_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_16 + u_394_410 * (const 64 (2**21)) + v_394_410 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_16 + r_394_410 * (const 64 (2**21)) + s_394_410 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_16,
    f_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_16,
    g_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 410)) <=s delta, delta <=s (const 64 (1 + 2*410)),
    (const 64 (-(2**20))) <=s u_394_410, u_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_410, v_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_410, r_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_410, s_394_410 <=s (const 64 ((2**20)-1)),
    u_394_410 + v_394_410 <=s (const 64 (2**20)),
    u_394_410 - v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 + v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 - v_394_410 <=s (const 64 (2**20)),
    r_394_410 + s_394_410 <=s (const 64 (2**20)),
    r_394_410 - s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 + s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 - s_394_410 <=s (const 64 (2**20)),
    u_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_394_410 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step410

// premise b
assume
g_354_low60_40_low20_16 = 1 (mod 2)
&&
g_354_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_17 f_354_low60_40_low20_16;
mov u_394_411 u_394_410;
mov v_394_411 v_394_410;

add g_354_low60_40_low20_17 g_354_low60_40_low20_16 f_354_low60_40_low20_16;
asr g_354_low60_40_low20_17 g_354_low60_40_low20_17 1;
add r_394_411 r_394_410 u_394_410;
asr r_394_411 r_394_411 1;
add s_394_411 s_394_410 v_394_410;
asr s_394_411 s_394_411 1;
assert
    true
&&
    f_354_low60_40_low20_17 = f_354_low60_40_low20_16,
    u_394_411 = u_394_410,
    v_394_411 = v_394_410,
    g_354_low60_40_low20_17 * (const 64 2) = g_354_low60_40_low20_16 + f_354_low60_40_low20_16,
    r_394_411 * (const 64 2) = r_394_410 + u_394_410,
    s_394_411 * (const 64 2) = s_394_410 + v_394_410
;

assume
    f_354_low60_40_low20_17 = f_354_low60_40_low20_16,
    u_394_411 = u_394_410,
    v_394_411 = v_394_410,
    g_354_low60_40_low20_17 * 2 = g_354_low60_40_low20_16 + f_354_low60_40_low20_16,
    r_394_411 * 2 = r_394_410 + u_394_410,
    s_394_411 * 2 = s_394_410 + v_394_410
&&
    true
;

{
    u_394_411 * f_354_low60_40_low20_0 + v_394_411 * g_354_low60_40_low20_0 = f_354_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_411 * f_354_low60_40_low20_0 + s_394_411 * g_354_low60_40_low20_0 = g_354_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_17 + u_394_411 * (const 64 (2**21)) + v_394_411 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_17 + r_394_411 * (const 64 (2**21)) + s_394_411 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_17,
    f_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_17,
    g_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 411)) <=s delta, delta <=s (const 64 (1 + 2*411)),
    (const 64 (-(2**20))) <=s u_394_411, u_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_411, v_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_411, r_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_411, s_394_411 <=s (const 64 ((2**20)-1)),
    u_394_411 + v_394_411 <=s (const 64 (2**20)),
    u_394_411 - v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 + v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 - v_394_411 <=s (const 64 (2**20)),
    r_394_411 + s_394_411 <=s (const 64 (2**20)),
    r_394_411 - s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 + s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 - s_394_411 <=s (const 64 (2**20)),
    u_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_394_411 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_410_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_16,
sint64 g_354_low60_40_low20_16,
sint64 f_354_low60_40_low20_17,
sint64 g_354_low60_40_low20_17,
sint64 u_394_410,
sint64 v_394_410,
sint64 r_394_410,
sint64 s_394_410,
sint64 u_394_411,
sint64 v_394_411,
sint64 r_394_411,
sint64 s_394_411,
bit ne
)={
    u_394_410 * f_354_low60_40_low20_0 + v_394_410 * g_354_low60_40_low20_0 = f_354_low60_40_low20_16 * (-(2**20)),
    r_394_410 * f_354_low60_40_low20_0 + s_394_410 * g_354_low60_40_low20_0 = g_354_low60_40_low20_16 * (-(2**20))
&&
    u_394_410 * f_354_low60_40_low20_0 + v_394_410 * g_354_low60_40_low20_0 = f_354_low60_40_low20_16 * (const 64 (-(2**20))),
    r_394_410 * f_354_low60_40_low20_0 + s_394_410 * g_354_low60_40_low20_0 = g_354_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_16 + u_394_410 * (const 64 (2**21)) + v_394_410 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_16 + r_394_410 * (const 64 (2**21)) + s_394_410 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_16,
    f_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_16,
    g_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 410)) <=s delta, delta <=s (const 64 (1 + 2*410)),
    (const 64 (-(2**20))) <=s u_394_410, u_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_410, v_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_410, r_394_410 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_410, s_394_410 <=s (const 64 ((2**20)-1)),
    u_394_410 + v_394_410 <=s (const 64 (2**20)),
    u_394_410 - v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 + v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 - v_394_410 <=s (const 64 (2**20)),
    r_394_410 + s_394_410 <=s (const 64 (2**20)),
    r_394_410 - s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 + s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 - s_394_410 <=s (const 64 (2**20)),
    u_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_394_410 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step410

// premise c
assume
g_354_low60_40_low20_16 = 1 (mod 2)
&&
g_354_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_17 g_354_low60_40_low20_16;
mov u_394_411 r_394_410;
mov v_394_411 s_394_410;

subs dc g_354_low60_40_low20_17 g_354_low60_40_low20_16 f_354_low60_40_low20_16;
asr g_354_low60_40_low20_17 g_354_low60_40_low20_17 1;
subs dc r_394_411 r_394_410 u_394_410;
asr r_394_411 r_394_411 1;
subs dc s_394_411 s_394_410 v_394_410;
asr s_394_411 s_394_411 1;
assert
    true
&&
    f_354_low60_40_low20_17 = g_354_low60_40_low20_16,
    u_394_411 = r_394_410,
    v_394_411 = s_394_410,
    g_354_low60_40_low20_17 * (const 64 2) = g_354_low60_40_low20_16 - f_354_low60_40_low20_16,
    r_394_411 * (const 64 2) = r_394_410 - u_394_410,
    s_394_411 * (const 64 2) = s_394_410 - v_394_410
;

assume
    f_354_low60_40_low20_17 = g_354_low60_40_low20_16,
    u_394_411 = r_394_410,
    v_394_411 = s_394_410,
    g_354_low60_40_low20_17 * 2 = g_354_low60_40_low20_16 - f_354_low60_40_low20_16,
    r_394_411 * 2 = r_394_410 - u_394_410,
    s_394_411 * 2 = s_394_410 - v_394_410
&&
    true
;

{
    u_394_411 * f_354_low60_40_low20_0 + v_394_411 * g_354_low60_40_low20_0 = f_354_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_411 * f_354_low60_40_low20_0 + s_394_411 * g_354_low60_40_low20_0 = g_354_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_17 + u_394_411 * (const 64 (2**21)) + v_394_411 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_17 + r_394_411 * (const 64 (2**21)) + s_394_411 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_17,
    f_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_17,
    g_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 411)) <=s delta, delta <=s (const 64 (1 + 2*411)),
    (const 64 (-(2**20))) <=s u_394_411, u_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_411, v_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_411, r_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_411, s_394_411 <=s (const 64 ((2**20)-1)),
    u_394_411 + v_394_411 <=s (const 64 (2**20)),
    u_394_411 - v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 + v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 - v_394_411 <=s (const 64 (2**20)),
    r_394_411 + s_394_411 <=s (const 64 (2**20)),
    r_394_411 - s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 + s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 - s_394_411 <=s (const 64 (2**20)),
    u_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_394_411 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_411_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_17,
sint64 g_354_low60_40_low20_17,
sint64 f_354_low60_40_low20_18,
sint64 g_354_low60_40_low20_18,
sint64 u_394_411,
sint64 v_394_411,
sint64 r_394_411,
sint64 s_394_411,
sint64 u_394_412,
sint64 v_394_412,
sint64 r_394_412,
sint64 s_394_412,
bit ne
)={
    u_394_411 * f_354_low60_40_low20_0 + v_394_411 * g_354_low60_40_low20_0 = f_354_low60_40_low20_17 * (-(2**20)),
    r_394_411 * f_354_low60_40_low20_0 + s_394_411 * g_354_low60_40_low20_0 = g_354_low60_40_low20_17 * (-(2**20))
&&
    u_394_411 * f_354_low60_40_low20_0 + v_394_411 * g_354_low60_40_low20_0 = f_354_low60_40_low20_17 * (const 64 (-(2**20))),
    r_394_411 * f_354_low60_40_low20_0 + s_394_411 * g_354_low60_40_low20_0 = g_354_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_17 + u_394_411 * (const 64 (2**21)) + v_394_411 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_17 + r_394_411 * (const 64 (2**21)) + s_394_411 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_17,
    f_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_17,
    g_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 411)) <=s delta, delta <=s (const 64 (1 + 2*411)),
    (const 64 (-(2**20))) <=s u_394_411, u_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_411, v_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_411, r_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_411, s_394_411 <=s (const 64 ((2**20)-1)),
    u_394_411 + v_394_411 <=s (const 64 (2**20)),
    u_394_411 - v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 + v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 - v_394_411 <=s (const 64 (2**20)),
    r_394_411 + s_394_411 <=s (const 64 (2**20)),
    r_394_411 - s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 + s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 - s_394_411 <=s (const 64 (2**20)),
    u_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_394_411 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step411

// premise a
assume
g_354_low60_40_low20_17 = 0 (mod 2)
&&
g_354_low60_40_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_40_low20_18 f_354_low60_40_low20_17;
mov u_394_412 u_394_411;
mov v_394_412 v_394_411;

asr g_354_low60_40_low20_18 g_354_low60_40_low20_17 1;
asr r_394_412 r_394_411 1;
asr s_394_412 s_394_411 1;
assert
    true
&&
    f_354_low60_40_low20_18 = f_354_low60_40_low20_17,
    u_394_412 = u_394_411,
    v_394_412 = v_394_411,
    g_354_low60_40_low20_18 * (const 64 2) = g_354_low60_40_low20_17,
    r_394_412 * (const 64 2) = r_394_411,
    s_394_412 * (const 64 2) = s_394_411
;

assume
    f_354_low60_40_low20_18 = f_354_low60_40_low20_17,
    u_394_412 = u_394_411,
    v_394_412 = v_394_411,
    g_354_low60_40_low20_18 * 2 = g_354_low60_40_low20_17,
    r_394_412 * 2 = r_394_411,
    s_394_412 * 2 = s_394_411
&&
    true
;

{
    u_394_412 * f_354_low60_40_low20_0 + v_394_412 * g_354_low60_40_low20_0 = f_354_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_412 * f_354_low60_40_low20_0 + s_394_412 * g_354_low60_40_low20_0 = g_354_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_18 + u_394_412 * (const 64 (2**21)) + v_394_412 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_18 + r_394_412 * (const 64 (2**21)) + s_394_412 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_18,
    f_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_18,
    g_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 412)) <=s delta, delta <=s (const 64 (1 + 2*412)),
    (const 64 (-(2**20))) <=s u_394_412, u_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_412, v_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_412, r_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_412, s_394_412 <=s (const 64 ((2**20)-1)),
    u_394_412 + v_394_412 <=s (const 64 (2**20)),
    u_394_412 - v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 + v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 - v_394_412 <=s (const 64 (2**20)),
    r_394_412 + s_394_412 <=s (const 64 (2**20)),
    r_394_412 - s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 + s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 - s_394_412 <=s (const 64 (2**20)),
    u_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_394_412 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_411_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_17,
sint64 g_354_low60_40_low20_17,
sint64 f_354_low60_40_low20_18,
sint64 g_354_low60_40_low20_18,
sint64 u_394_411,
sint64 v_394_411,
sint64 r_394_411,
sint64 s_394_411,
sint64 u_394_412,
sint64 v_394_412,
sint64 r_394_412,
sint64 s_394_412,
bit ne
)={
    u_394_411 * f_354_low60_40_low20_0 + v_394_411 * g_354_low60_40_low20_0 = f_354_low60_40_low20_17 * (-(2**20)),
    r_394_411 * f_354_low60_40_low20_0 + s_394_411 * g_354_low60_40_low20_0 = g_354_low60_40_low20_17 * (-(2**20))
&&
    u_394_411 * f_354_low60_40_low20_0 + v_394_411 * g_354_low60_40_low20_0 = f_354_low60_40_low20_17 * (const 64 (-(2**20))),
    r_394_411 * f_354_low60_40_low20_0 + s_394_411 * g_354_low60_40_low20_0 = g_354_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_17 + u_394_411 * (const 64 (2**21)) + v_394_411 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_17 + r_394_411 * (const 64 (2**21)) + s_394_411 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_17,
    f_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_17,
    g_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 411)) <=s delta, delta <=s (const 64 (1 + 2*411)),
    (const 64 (-(2**20))) <=s u_394_411, u_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_411, v_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_411, r_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_411, s_394_411 <=s (const 64 ((2**20)-1)),
    u_394_411 + v_394_411 <=s (const 64 (2**20)),
    u_394_411 - v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 + v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 - v_394_411 <=s (const 64 (2**20)),
    r_394_411 + s_394_411 <=s (const 64 (2**20)),
    r_394_411 - s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 + s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 - s_394_411 <=s (const 64 (2**20)),
    u_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_394_411 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step411

// premise b
assume
g_354_low60_40_low20_17 = 1 (mod 2)
&&
g_354_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_18 f_354_low60_40_low20_17;
mov u_394_412 u_394_411;
mov v_394_412 v_394_411;

add g_354_low60_40_low20_18 g_354_low60_40_low20_17 f_354_low60_40_low20_17;
asr g_354_low60_40_low20_18 g_354_low60_40_low20_18 1;
add r_394_412 r_394_411 u_394_411;
asr r_394_412 r_394_412 1;
add s_394_412 s_394_411 v_394_411;
asr s_394_412 s_394_412 1;
assert
    true
&&
    f_354_low60_40_low20_18 = f_354_low60_40_low20_17,
    u_394_412 = u_394_411,
    v_394_412 = v_394_411,
    g_354_low60_40_low20_18 * (const 64 2) = g_354_low60_40_low20_17 + f_354_low60_40_low20_17,
    r_394_412 * (const 64 2) = r_394_411 + u_394_411,
    s_394_412 * (const 64 2) = s_394_411 + v_394_411
;

assume
    f_354_low60_40_low20_18 = f_354_low60_40_low20_17,
    u_394_412 = u_394_411,
    v_394_412 = v_394_411,
    g_354_low60_40_low20_18 * 2 = g_354_low60_40_low20_17 + f_354_low60_40_low20_17,
    r_394_412 * 2 = r_394_411 + u_394_411,
    s_394_412 * 2 = s_394_411 + v_394_411
&&
    true
;

{
    u_394_412 * f_354_low60_40_low20_0 + v_394_412 * g_354_low60_40_low20_0 = f_354_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_412 * f_354_low60_40_low20_0 + s_394_412 * g_354_low60_40_low20_0 = g_354_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_18 + u_394_412 * (const 64 (2**21)) + v_394_412 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_18 + r_394_412 * (const 64 (2**21)) + s_394_412 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_18,
    f_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_18,
    g_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 412)) <=s delta, delta <=s (const 64 (1 + 2*412)),
    (const 64 (-(2**20))) <=s u_394_412, u_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_412, v_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_412, r_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_412, s_394_412 <=s (const 64 ((2**20)-1)),
    u_394_412 + v_394_412 <=s (const 64 (2**20)),
    u_394_412 - v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 + v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 - v_394_412 <=s (const 64 (2**20)),
    r_394_412 + s_394_412 <=s (const 64 (2**20)),
    r_394_412 - s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 + s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 - s_394_412 <=s (const 64 (2**20)),
    u_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_394_412 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_411_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_17,
sint64 g_354_low60_40_low20_17,
sint64 f_354_low60_40_low20_18,
sint64 g_354_low60_40_low20_18,
sint64 u_394_411,
sint64 v_394_411,
sint64 r_394_411,
sint64 s_394_411,
sint64 u_394_412,
sint64 v_394_412,
sint64 r_394_412,
sint64 s_394_412,
bit ne
)={
    u_394_411 * f_354_low60_40_low20_0 + v_394_411 * g_354_low60_40_low20_0 = f_354_low60_40_low20_17 * (-(2**20)),
    r_394_411 * f_354_low60_40_low20_0 + s_394_411 * g_354_low60_40_low20_0 = g_354_low60_40_low20_17 * (-(2**20))
&&
    u_394_411 * f_354_low60_40_low20_0 + v_394_411 * g_354_low60_40_low20_0 = f_354_low60_40_low20_17 * (const 64 (-(2**20))),
    r_394_411 * f_354_low60_40_low20_0 + s_394_411 * g_354_low60_40_low20_0 = g_354_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_17 + u_394_411 * (const 64 (2**21)) + v_394_411 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_17 + r_394_411 * (const 64 (2**21)) + s_394_411 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_17,
    f_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_17,
    g_354_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 411)) <=s delta, delta <=s (const 64 (1 + 2*411)),
    (const 64 (-(2**20))) <=s u_394_411, u_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_411, v_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_411, r_394_411 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_411, s_394_411 <=s (const 64 ((2**20)-1)),
    u_394_411 + v_394_411 <=s (const 64 (2**20)),
    u_394_411 - v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 + v_394_411 <=s (const 64 (2**20)),
    (const 64 0) - u_394_411 - v_394_411 <=s (const 64 (2**20)),
    r_394_411 + s_394_411 <=s (const 64 (2**20)),
    r_394_411 - s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 + s_394_411 <=s (const 64 (2**20)),
    (const 64 0) - r_394_411 - s_394_411 <=s (const 64 (2**20)),
    u_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_394_411 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_394_411 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step411

// premise c
assume
g_354_low60_40_low20_17 = 1 (mod 2)
&&
g_354_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_18 g_354_low60_40_low20_17;
mov u_394_412 r_394_411;
mov v_394_412 s_394_411;

subs dc g_354_low60_40_low20_18 g_354_low60_40_low20_17 f_354_low60_40_low20_17;
asr g_354_low60_40_low20_18 g_354_low60_40_low20_18 1;
subs dc r_394_412 r_394_411 u_394_411;
asr r_394_412 r_394_412 1;
subs dc s_394_412 s_394_411 v_394_411;
asr s_394_412 s_394_412 1;
assert
    true
&&
    f_354_low60_40_low20_18 = g_354_low60_40_low20_17,
    u_394_412 = r_394_411,
    v_394_412 = s_394_411,
    g_354_low60_40_low20_18 * (const 64 2) = g_354_low60_40_low20_17 - f_354_low60_40_low20_17,
    r_394_412 * (const 64 2) = r_394_411 - u_394_411,
    s_394_412 * (const 64 2) = s_394_411 - v_394_411
;

assume
    f_354_low60_40_low20_18 = g_354_low60_40_low20_17,
    u_394_412 = r_394_411,
    v_394_412 = s_394_411,
    g_354_low60_40_low20_18 * 2 = g_354_low60_40_low20_17 - f_354_low60_40_low20_17,
    r_394_412 * 2 = r_394_411 - u_394_411,
    s_394_412 * 2 = s_394_411 - v_394_411
&&
    true
;

{
    u_394_412 * f_354_low60_40_low20_0 + v_394_412 * g_354_low60_40_low20_0 = f_354_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_412 * f_354_low60_40_low20_0 + s_394_412 * g_354_low60_40_low20_0 = g_354_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_18 + u_394_412 * (const 64 (2**21)) + v_394_412 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_18 + r_394_412 * (const 64 (2**21)) + s_394_412 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_18,
    f_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_18,
    g_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 412)) <=s delta, delta <=s (const 64 (1 + 2*412)),
    (const 64 (-(2**20))) <=s u_394_412, u_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_412, v_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_412, r_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_412, s_394_412 <=s (const 64 ((2**20)-1)),
    u_394_412 + v_394_412 <=s (const 64 (2**20)),
    u_394_412 - v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 + v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 - v_394_412 <=s (const 64 (2**20)),
    r_394_412 + s_394_412 <=s (const 64 (2**20)),
    r_394_412 - s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 + s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 - s_394_412 <=s (const 64 (2**20)),
    u_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_394_412 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_412_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_18,
sint64 g_354_low60_40_low20_18,
sint64 f_354_low60_40_low20_19,
sint64 g_354_low60_40_low20_19,
sint64 u_394_412,
sint64 v_394_412,
sint64 r_394_412,
sint64 s_394_412,
sint64 u_394_413,
sint64 v_394_413,
sint64 r_394_413,
sint64 s_394_413,
bit ne
)={
    u_394_412 * f_354_low60_40_low20_0 + v_394_412 * g_354_low60_40_low20_0 = f_354_low60_40_low20_18 * (-(2**20)),
    r_394_412 * f_354_low60_40_low20_0 + s_394_412 * g_354_low60_40_low20_0 = g_354_low60_40_low20_18 * (-(2**20))
&&
    u_394_412 * f_354_low60_40_low20_0 + v_394_412 * g_354_low60_40_low20_0 = f_354_low60_40_low20_18 * (const 64 (-(2**20))),
    r_394_412 * f_354_low60_40_low20_0 + s_394_412 * g_354_low60_40_low20_0 = g_354_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_18 + u_394_412 * (const 64 (2**21)) + v_394_412 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_18 + r_394_412 * (const 64 (2**21)) + s_394_412 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_18,
    f_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_18,
    g_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 412)) <=s delta, delta <=s (const 64 (1 + 2*412)),
    (const 64 (-(2**20))) <=s u_394_412, u_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_412, v_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_412, r_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_412, s_394_412 <=s (const 64 ((2**20)-1)),
    u_394_412 + v_394_412 <=s (const 64 (2**20)),
    u_394_412 - v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 + v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 - v_394_412 <=s (const 64 (2**20)),
    r_394_412 + s_394_412 <=s (const 64 (2**20)),
    r_394_412 - s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 + s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 - s_394_412 <=s (const 64 (2**20)),
    u_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_394_412 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step412

// premise a
assume
g_354_low60_40_low20_18 = 0 (mod 2)
&&
g_354_low60_40_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov f_354_low60_40_low20_19 f_354_low60_40_low20_18;
mov u_394_413 u_394_412;
mov v_394_413 v_394_412;

asr g_354_low60_40_low20_19 g_354_low60_40_low20_18 1;
asr r_394_413 r_394_412 1;
asr s_394_413 s_394_412 1;
assert
    true
&&
    f_354_low60_40_low20_19 = f_354_low60_40_low20_18,
    u_394_413 = u_394_412,
    v_394_413 = v_394_412,
    g_354_low60_40_low20_19 * (const 64 2) = g_354_low60_40_low20_18,
    r_394_413 * (const 64 2) = r_394_412,
    s_394_413 * (const 64 2) = s_394_412
;

assume
    f_354_low60_40_low20_19 = f_354_low60_40_low20_18,
    u_394_413 = u_394_412,
    v_394_413 = v_394_412,
    g_354_low60_40_low20_19 * 2 = g_354_low60_40_low20_18,
    r_394_413 * 2 = r_394_412,
    s_394_413 * 2 = s_394_412
&&
    true
;

{
    u_394_413 * f_354_low60_40_low20_0 + v_394_413 * g_354_low60_40_low20_0 = f_354_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_413 * f_354_low60_40_low20_0 + s_394_413 * g_354_low60_40_low20_0 = g_354_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_19 + u_394_413 * (const 64 (2**21)) + v_394_413 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_19 + r_394_413 * (const 64 (2**21)) + s_394_413 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_19,
    f_354_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_19,
    g_354_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 413)) <=s delta, delta <=s (const 64 (1 + 2*413)),
    (const 64 (-(2**20))) <=s u_394_413, u_394_413 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_413, v_394_413 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_413, r_394_413 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_413, s_394_413 <=s (const 64 ((2**20)-1)),
    u_394_413 + v_394_413 <=s (const 64 (2**20)),
    u_394_413 - v_394_413 <=s (const 64 (2**20)),
    (const 64 0) - u_394_413 + v_394_413 <=s (const 64 (2**20)),
    (const 64 0) - u_394_413 - v_394_413 <=s (const 64 (2**20)),
    r_394_413 + s_394_413 <=s (const 64 (2**20)),
    r_394_413 - s_394_413 <=s (const 64 (2**20)),
    (const 64 0) - r_394_413 + s_394_413 <=s (const 64 (2**20)),
    (const 64 0) - r_394_413 - s_394_413 <=s (const 64 (2**20)),
    u_394_413 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_394_413 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_394_413 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_394_413 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_412_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_18,
sint64 g_354_low60_40_low20_18,
sint64 f_354_low60_40_low20_19,
sint64 g_354_low60_40_low20_19,
sint64 u_394_412,
sint64 v_394_412,
sint64 r_394_412,
sint64 s_394_412,
sint64 u_394_413,
sint64 v_394_413,
sint64 r_394_413,
sint64 s_394_413,
bit ne
)={
    u_394_412 * f_354_low60_40_low20_0 + v_394_412 * g_354_low60_40_low20_0 = f_354_low60_40_low20_18 * (-(2**20)),
    r_394_412 * f_354_low60_40_low20_0 + s_394_412 * g_354_low60_40_low20_0 = g_354_low60_40_low20_18 * (-(2**20))
&&
    u_394_412 * f_354_low60_40_low20_0 + v_394_412 * g_354_low60_40_low20_0 = f_354_low60_40_low20_18 * (const 64 (-(2**20))),
    r_394_412 * f_354_low60_40_low20_0 + s_394_412 * g_354_low60_40_low20_0 = g_354_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_18 + u_394_412 * (const 64 (2**21)) + v_394_412 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_18 + r_394_412 * (const 64 (2**21)) + s_394_412 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_18,
    f_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_18,
    g_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 412)) <=s delta, delta <=s (const 64 (1 + 2*412)),
    (const 64 (-(2**20))) <=s u_394_412, u_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_412, v_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_412, r_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_412, s_394_412 <=s (const 64 ((2**20)-1)),
    u_394_412 + v_394_412 <=s (const 64 (2**20)),
    u_394_412 - v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 + v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 - v_394_412 <=s (const 64 (2**20)),
    r_394_412 + s_394_412 <=s (const 64 (2**20)),
    r_394_412 - s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 + s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 - s_394_412 <=s (const 64 (2**20)),
    u_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_394_412 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step412

// premise b
assume
g_354_low60_40_low20_18 = 1 (mod 2)
&&
g_354_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_19 f_354_low60_40_low20_18;
mov u_394_413 u_394_412;
mov v_394_413 v_394_412;

add g_354_low60_40_low20_19 g_354_low60_40_low20_18 f_354_low60_40_low20_18;
asr g_354_low60_40_low20_19 g_354_low60_40_low20_19 1;
add r_394_413 r_394_412 u_394_412;
asr r_394_413 r_394_413 1;
add s_394_413 s_394_412 v_394_412;
asr s_394_413 s_394_413 1;
assert
    true
&&
    f_354_low60_40_low20_19 = f_354_low60_40_low20_18,
    u_394_413 = u_394_412,
    v_394_413 = v_394_412,
    g_354_low60_40_low20_19 * (const 64 2) = g_354_low60_40_low20_18 + f_354_low60_40_low20_18,
    r_394_413 * (const 64 2) = r_394_412 + u_394_412,
    s_394_413 * (const 64 2) = s_394_412 + v_394_412
;

assume
    f_354_low60_40_low20_19 = f_354_low60_40_low20_18,
    u_394_413 = u_394_412,
    v_394_413 = v_394_412,
    g_354_low60_40_low20_19 * 2 = g_354_low60_40_low20_18 + f_354_low60_40_low20_18,
    r_394_413 * 2 = r_394_412 + u_394_412,
    s_394_413 * 2 = s_394_412 + v_394_412
&&
    true
;

{
    u_394_413 * f_354_low60_40_low20_0 + v_394_413 * g_354_low60_40_low20_0 = f_354_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_413 * f_354_low60_40_low20_0 + s_394_413 * g_354_low60_40_low20_0 = g_354_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_19 + u_394_413 * (const 64 (2**21)) + v_394_413 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_19 + r_394_413 * (const 64 (2**21)) + s_394_413 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_19,
    f_354_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_19,
    g_354_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 413)) <=s delta, delta <=s (const 64 (1 + 2*413)),
    (const 64 (-(2**20))) <=s u_394_413, u_394_413 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_413, v_394_413 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_413, r_394_413 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_413, s_394_413 <=s (const 64 ((2**20)-1)),
    u_394_413 + v_394_413 <=s (const 64 (2**20)),
    u_394_413 - v_394_413 <=s (const 64 (2**20)),
    (const 64 0) - u_394_413 + v_394_413 <=s (const 64 (2**20)),
    (const 64 0) - u_394_413 - v_394_413 <=s (const 64 (2**20)),
    r_394_413 + s_394_413 <=s (const 64 (2**20)),
    r_394_413 - s_394_413 <=s (const 64 (2**20)),
    (const 64 0) - r_394_413 + s_394_413 <=s (const 64 (2**20)),
    (const 64 0) - r_394_413 - s_394_413 <=s (const 64 (2**20)),
    u_394_413 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_394_413 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_394_413 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_394_413 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_412_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_18,
sint64 g_354_low60_40_low20_18,
sint64 f_354_low60_40_low20_19,
sint64 g_354_low60_40_low20_19,
sint64 u_394_412,
sint64 v_394_412,
sint64 r_394_412,
sint64 s_394_412,
sint64 u_394_413,
sint64 v_394_413,
sint64 r_394_413,
sint64 s_394_413,
bit ne
)={
    u_394_412 * f_354_low60_40_low20_0 + v_394_412 * g_354_low60_40_low20_0 = f_354_low60_40_low20_18 * (-(2**20)),
    r_394_412 * f_354_low60_40_low20_0 + s_394_412 * g_354_low60_40_low20_0 = g_354_low60_40_low20_18 * (-(2**20))
&&
    u_394_412 * f_354_low60_40_low20_0 + v_394_412 * g_354_low60_40_low20_0 = f_354_low60_40_low20_18 * (const 64 (-(2**20))),
    r_394_412 * f_354_low60_40_low20_0 + s_394_412 * g_354_low60_40_low20_0 = g_354_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_18 + u_394_412 * (const 64 (2**21)) + v_394_412 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_18 + r_394_412 * (const 64 (2**21)) + s_394_412 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_18,
    f_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_18,
    g_354_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 412)) <=s delta, delta <=s (const 64 (1 + 2*412)),
    (const 64 (-(2**20))) <=s u_394_412, u_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_412, v_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_412, r_394_412 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_412, s_394_412 <=s (const 64 ((2**20)-1)),
    u_394_412 + v_394_412 <=s (const 64 (2**20)),
    u_394_412 - v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 + v_394_412 <=s (const 64 (2**20)),
    (const 64 0) - u_394_412 - v_394_412 <=s (const 64 (2**20)),
    r_394_412 + s_394_412 <=s (const 64 (2**20)),
    r_394_412 - s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 + s_394_412 <=s (const 64 (2**20)),
    (const 64 0) - r_394_412 - s_394_412 <=s (const 64 (2**20)),
    u_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_394_412 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_394_412 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step412

// premise c
assume
g_354_low60_40_low20_18 = 1 (mod 2)
&&
g_354_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_19 g_354_low60_40_low20_18;
mov u_394_413 r_394_412;
mov v_394_413 s_394_412;

subs dc g_354_low60_40_low20_19 g_354_low60_40_low20_18 f_354_low60_40_low20_18;
asr g_354_low60_40_low20_19 g_354_low60_40_low20_19 1;
subs dc r_394_413 r_394_412 u_394_412;
asr r_394_413 r_394_413 1;
subs dc s_394_413 s_394_412 v_394_412;
asr s_394_413 s_394_413 1;
assert
    true
&&
    f_354_low60_40_low20_19 = g_354_low60_40_low20_18,
    u_394_413 = r_394_412,
    v_394_413 = s_394_412,
    g_354_low60_40_low20_19 * (const 64 2) = g_354_low60_40_low20_18 - f_354_low60_40_low20_18,
    r_394_413 * (const 64 2) = r_394_412 - u_394_412,
    s_394_413 * (const 64 2) = s_394_412 - v_394_412
;

assume
    f_354_low60_40_low20_19 = g_354_low60_40_low20_18,
    u_394_413 = r_394_412,
    v_394_413 = s_394_412,
    g_354_low60_40_low20_19 * 2 = g_354_low60_40_low20_18 - f_354_low60_40_low20_18,
    r_394_413 * 2 = r_394_412 - u_394_412,
    s_394_413 * 2 = s_394_412 - v_394_412
&&
    true
;

{
    u_394_413 * f_354_low60_40_low20_0 + v_394_413 * g_354_low60_40_low20_0 = f_354_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_413 * f_354_low60_40_low20_0 + s_394_413 * g_354_low60_40_low20_0 = g_354_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_19 + u_394_413 * (const 64 (2**21)) + v_394_413 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_19 + r_394_413 * (const 64 (2**21)) + s_394_413 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_19,
    f_354_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_19,
    g_354_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 413)) <=s delta, delta <=s (const 64 (1 + 2*413)),
    (const 64 (-(2**20))) <=s u_394_413, u_394_413 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_394_413, v_394_413 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_394_413, r_394_413 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_394_413, s_394_413 <=s (const 64 ((2**20)-1)),
    u_394_413 + v_394_413 <=s (const 64 (2**20)),
    u_394_413 - v_394_413 <=s (const 64 (2**20)),
    (const 64 0) - u_394_413 + v_394_413 <=s (const 64 (2**20)),
    (const 64 0) - u_394_413 - v_394_413 <=s (const 64 (2**20)),
    r_394_413 + s_394_413 <=s (const 64 (2**20)),
    r_394_413 - s_394_413 <=s (const 64 (2**20)),
    (const 64 0) - r_394_413 + s_394_413 <=s (const 64 (2**20)),
    (const 64 0) - r_394_413 - s_394_413 <=s (const 64 (2**20)),
    u_394_413 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_394_413 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_394_413 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_394_413 = (const 64 0) (mod (const 64 (2**(20-19))))
}

