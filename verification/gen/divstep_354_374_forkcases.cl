proc divstep_354_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_1,
sint64 g_354_low60_0_low20_1,
sint64 u_354_354,
sint64 v_354_354,
sint64 r_354_354,
sint64 s_354_354,
sint64 u_354_355,
sint64 v_354_355,
sint64 r_354_355,
sint64 s_354_355,
bit ne
)={
    u_354_354 * f_354_low60_0_low20_0 + v_354_354 * g_354_low60_0_low20_0 = f_354_low60_0_low20_0 * (-(2**20)),
    r_354_354 * f_354_low60_0_low20_0 + s_354_354 * g_354_low60_0_low20_0 = g_354_low60_0_low20_0 * (-(2**20))
&&
    u_354_354 * f_354_low60_0_low20_0 + v_354_354 * g_354_low60_0_low20_0 = f_354_low60_0_low20_0 * (const 64 (-(2**20))),
    r_354_354 * f_354_low60_0_low20_0 + s_354_354 * g_354_low60_0_low20_0 = g_354_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_0 + u_354_354 * (const 64 (2**21)) + v_354_354 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_0 + r_354_354 * (const 64 (2**21)) + s_354_354 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 354)) <=s delta, delta <=s (const 64 (1 + 2*354)),
    u_354_354 = (const 64 (-(2**20))),
    v_354_354 = (const 64 (0)),
    r_354_354 = (const 64 (0)),
    s_354_354 = (const 64 (-(2**20)))
}



// divsteps
// step0

// premise a
assume
g_354_low60_0_low20_0 = 0 (mod 2)
&&
g_354_low60_0_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_354_low60_0_low20_1 f_354_low60_0_low20_0;
mov u_354_355 u_354_354;
mov v_354_355 v_354_354;

asr g_354_low60_0_low20_1 g_354_low60_0_low20_0 1;
asr r_354_355 r_354_354 1;
asr s_354_355 s_354_354 1;
assert
    true
&&
    f_354_low60_0_low20_1 = f_354_low60_0_low20_0,
    u_354_355 = u_354_354,
    v_354_355 = v_354_354,
    g_354_low60_0_low20_1 * (const 64 2) = g_354_low60_0_low20_0,
    r_354_355 * (const 64 2) = r_354_354,
    s_354_355 * (const 64 2) = s_354_354
;

assume
    f_354_low60_0_low20_1 = f_354_low60_0_low20_0,
    u_354_355 = u_354_354,
    v_354_355 = v_354_354,
    g_354_low60_0_low20_1 * 2 = g_354_low60_0_low20_0,
    r_354_355 * 2 = r_354_354,
    s_354_355 * 2 = s_354_354
&&
    true
;

{
    u_354_355 * f_354_low60_0_low20_0 + v_354_355 * g_354_low60_0_low20_0 = f_354_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_355 * f_354_low60_0_low20_0 + s_354_355 * g_354_low60_0_low20_0 = g_354_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_1 + u_354_355 * (const 64 (2**21)) + v_354_355 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_1 + r_354_355 * (const 64 (2**21)) + s_354_355 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_1,
    f_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_1,
    g_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 355)) <=s delta, delta <=s (const 64 (1 + 2*355)),
    (const 64 (-(2**20))) <=s u_354_355, u_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_355, v_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_355, r_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_355, s_354_355 <=s (const 64 ((2**20))),
    u_354_355 + v_354_355 <=s (const 64 (2**20)),
    u_354_355 - v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 + v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 - v_354_355 <=s (const 64 (2**20)),
    r_354_355 + s_354_355 <=s (const 64 (2**20)),
    r_354_355 - s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 + s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 - s_354_355 <=s (const 64 (2**20)),
    u_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_354_355 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_354_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_1,
sint64 g_354_low60_0_low20_1,
sint64 u_354_354,
sint64 v_354_354,
sint64 r_354_354,
sint64 s_354_354,
sint64 u_354_355,
sint64 v_354_355,
sint64 r_354_355,
sint64 s_354_355,
bit ne
)={
    u_354_354 * f_354_low60_0_low20_0 + v_354_354 * g_354_low60_0_low20_0 = f_354_low60_0_low20_0 * (-(2**20)),
    r_354_354 * f_354_low60_0_low20_0 + s_354_354 * g_354_low60_0_low20_0 = g_354_low60_0_low20_0 * (-(2**20))
&&
    u_354_354 * f_354_low60_0_low20_0 + v_354_354 * g_354_low60_0_low20_0 = f_354_low60_0_low20_0 * (const 64 (-(2**20))),
    r_354_354 * f_354_low60_0_low20_0 + s_354_354 * g_354_low60_0_low20_0 = g_354_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_0 + u_354_354 * (const 64 (2**21)) + v_354_354 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_0 + r_354_354 * (const 64 (2**21)) + s_354_354 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 354)) <=s delta, delta <=s (const 64 (1 + 2*354)),
    u_354_354 = (const 64 (-(2**20))),
    v_354_354 = (const 64 (0)),
    r_354_354 = (const 64 (0)),
    s_354_354 = (const 64 (-(2**20)))
}



// divsteps
// step0

// premise b
assume
g_354_low60_0_low20_0 = 1 (mod 2)
&&
g_354_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_1 f_354_low60_0_low20_0;
mov u_354_355 u_354_354;
mov v_354_355 v_354_354;

add g_354_low60_0_low20_1 g_354_low60_0_low20_0 f_354_low60_0_low20_0;
asr g_354_low60_0_low20_1 g_354_low60_0_low20_1 1;
add r_354_355 r_354_354 u_354_354;
asr r_354_355 r_354_355 1;
add s_354_355 s_354_354 v_354_354;
asr s_354_355 s_354_355 1;
assert
    true
&&
    f_354_low60_0_low20_1 = f_354_low60_0_low20_0,
    u_354_355 = u_354_354,
    v_354_355 = v_354_354,
    g_354_low60_0_low20_1 * (const 64 2) = g_354_low60_0_low20_0 + f_354_low60_0_low20_0,
    r_354_355 * (const 64 2) = r_354_354 + u_354_354,
    s_354_355 * (const 64 2) = s_354_354 + v_354_354
;

assume
    f_354_low60_0_low20_1 = f_354_low60_0_low20_0,
    u_354_355 = u_354_354,
    v_354_355 = v_354_354,
    g_354_low60_0_low20_1 * 2 = g_354_low60_0_low20_0 + f_354_low60_0_low20_0,
    r_354_355 * 2 = r_354_354 + u_354_354,
    s_354_355 * 2 = s_354_354 + v_354_354
&&
    true
;

{
    u_354_355 * f_354_low60_0_low20_0 + v_354_355 * g_354_low60_0_low20_0 = f_354_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_355 * f_354_low60_0_low20_0 + s_354_355 * g_354_low60_0_low20_0 = g_354_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_1 + u_354_355 * (const 64 (2**21)) + v_354_355 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_1 + r_354_355 * (const 64 (2**21)) + s_354_355 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_1,
    f_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_1,
    g_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 355)) <=s delta, delta <=s (const 64 (1 + 2*355)),
    (const 64 (-(2**20))) <=s u_354_355, u_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_355, v_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_355, r_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_355, s_354_355 <=s (const 64 ((2**20))),
    u_354_355 + v_354_355 <=s (const 64 (2**20)),
    u_354_355 - v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 + v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 - v_354_355 <=s (const 64 (2**20)),
    r_354_355 + s_354_355 <=s (const 64 (2**20)),
    r_354_355 - s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 + s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 - s_354_355 <=s (const 64 (2**20)),
    u_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_354_355 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_354_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_1,
sint64 g_354_low60_0_low20_1,
sint64 u_354_354,
sint64 v_354_354,
sint64 r_354_354,
sint64 s_354_354,
sint64 u_354_355,
sint64 v_354_355,
sint64 r_354_355,
sint64 s_354_355,
bit ne
)={
    u_354_354 * f_354_low60_0_low20_0 + v_354_354 * g_354_low60_0_low20_0 = f_354_low60_0_low20_0 * (-(2**20)),
    r_354_354 * f_354_low60_0_low20_0 + s_354_354 * g_354_low60_0_low20_0 = g_354_low60_0_low20_0 * (-(2**20))
&&
    u_354_354 * f_354_low60_0_low20_0 + v_354_354 * g_354_low60_0_low20_0 = f_354_low60_0_low20_0 * (const 64 (-(2**20))),
    r_354_354 * f_354_low60_0_low20_0 + s_354_354 * g_354_low60_0_low20_0 = g_354_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_0 + u_354_354 * (const 64 (2**21)) + v_354_354 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_0 + r_354_354 * (const 64 (2**21)) + s_354_354 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 354)) <=s delta, delta <=s (const 64 (1 + 2*354)),
    u_354_354 = (const 64 (-(2**20))),
    v_354_354 = (const 64 (0)),
    r_354_354 = (const 64 (0)),
    s_354_354 = (const 64 (-(2**20)))
}



// divsteps
// step0

// premise c
assume
g_354_low60_0_low20_0 = 1 (mod 2)
&&
g_354_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_1 g_354_low60_0_low20_0;
mov u_354_355 r_354_354;
mov v_354_355 s_354_354;

subs dc g_354_low60_0_low20_1 g_354_low60_0_low20_0 f_354_low60_0_low20_0;
asr g_354_low60_0_low20_1 g_354_low60_0_low20_1 1;
subs dc r_354_355 r_354_354 u_354_354;
asr r_354_355 r_354_355 1;
subs dc s_354_355 s_354_354 v_354_354;
asr s_354_355 s_354_355 1;
assert
    true
&&
    f_354_low60_0_low20_1 = g_354_low60_0_low20_0,
    u_354_355 = r_354_354,
    v_354_355 = s_354_354,
    g_354_low60_0_low20_1 * (const 64 2) = g_354_low60_0_low20_0 - f_354_low60_0_low20_0,
    r_354_355 * (const 64 2) = r_354_354 - u_354_354,
    s_354_355 * (const 64 2) = s_354_354 - v_354_354
;

assume
    f_354_low60_0_low20_1 = g_354_low60_0_low20_0,
    u_354_355 = r_354_354,
    v_354_355 = s_354_354,
    g_354_low60_0_low20_1 * 2 = g_354_low60_0_low20_0 - f_354_low60_0_low20_0,
    r_354_355 * 2 = r_354_354 - u_354_354,
    s_354_355 * 2 = s_354_354 - v_354_354
&&
    true
;

{
    u_354_355 * f_354_low60_0_low20_0 + v_354_355 * g_354_low60_0_low20_0 = f_354_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_355 * f_354_low60_0_low20_0 + s_354_355 * g_354_low60_0_low20_0 = g_354_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_1 + u_354_355 * (const 64 (2**21)) + v_354_355 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_1 + r_354_355 * (const 64 (2**21)) + s_354_355 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_1,
    f_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_1,
    g_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 355)) <=s delta, delta <=s (const 64 (1 + 2*355)),
    (const 64 (-(2**20))) <=s u_354_355, u_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_355, v_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_355, r_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_355, s_354_355 <=s (const 64 ((2**20))),
    u_354_355 + v_354_355 <=s (const 64 (2**20)),
    u_354_355 - v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 + v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 - v_354_355 <=s (const 64 (2**20)),
    r_354_355 + s_354_355 <=s (const 64 (2**20)),
    r_354_355 - s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 + s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 - s_354_355 <=s (const 64 (2**20)),
    u_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_354_355 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_355_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_1,
sint64 g_354_low60_0_low20_1,
sint64 f_354_low60_0_low20_2,
sint64 g_354_low60_0_low20_2,
sint64 u_354_355,
sint64 v_354_355,
sint64 r_354_355,
sint64 s_354_355,
sint64 u_354_356,
sint64 v_354_356,
sint64 r_354_356,
sint64 s_354_356,
bit ne
)={
    u_354_355 * f_354_low60_0_low20_0 + v_354_355 * g_354_low60_0_low20_0 = f_354_low60_0_low20_1 * (-(2**20)),
    r_354_355 * f_354_low60_0_low20_0 + s_354_355 * g_354_low60_0_low20_0 = g_354_low60_0_low20_1 * (-(2**20))
&&
    u_354_355 * f_354_low60_0_low20_0 + v_354_355 * g_354_low60_0_low20_0 = f_354_low60_0_low20_1 * (const 64 (-(2**20))),
    r_354_355 * f_354_low60_0_low20_0 + s_354_355 * g_354_low60_0_low20_0 = g_354_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_1 + u_354_355 * (const 64 (2**21)) + v_354_355 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_1 + r_354_355 * (const 64 (2**21)) + s_354_355 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_1,
    f_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_1,
    g_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 355)) <=s delta, delta <=s (const 64 (1 + 2*355)),
    (const 64 (-(2**20))) <=s u_354_355, u_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_355, v_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_355, r_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_355, s_354_355 <=s (const 64 ((2**20))),
    u_354_355 + v_354_355 <=s (const 64 (2**20)),
    u_354_355 - v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 + v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 - v_354_355 <=s (const 64 (2**20)),
    r_354_355 + s_354_355 <=s (const 64 (2**20)),
    r_354_355 - s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 + s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 - s_354_355 <=s (const 64 (2**20)),
    u_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_354_355 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step1

// premise a
assume
g_354_low60_0_low20_1 = 0 (mod 2)
&&
g_354_low60_0_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_2 f_354_low60_0_low20_1;
mov u_354_356 u_354_355;
mov v_354_356 v_354_355;

asr g_354_low60_0_low20_2 g_354_low60_0_low20_1 1;
asr r_354_356 r_354_355 1;
asr s_354_356 s_354_355 1;
assert
    true
&&
    f_354_low60_0_low20_2 = f_354_low60_0_low20_1,
    u_354_356 = u_354_355,
    v_354_356 = v_354_355,
    g_354_low60_0_low20_2 * (const 64 2) = g_354_low60_0_low20_1,
    r_354_356 * (const 64 2) = r_354_355,
    s_354_356 * (const 64 2) = s_354_355
;

assume
    f_354_low60_0_low20_2 = f_354_low60_0_low20_1,
    u_354_356 = u_354_355,
    v_354_356 = v_354_355,
    g_354_low60_0_low20_2 * 2 = g_354_low60_0_low20_1,
    r_354_356 * 2 = r_354_355,
    s_354_356 * 2 = s_354_355
&&
    true
;

{
    u_354_356 * f_354_low60_0_low20_0 + v_354_356 * g_354_low60_0_low20_0 = f_354_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_356 * f_354_low60_0_low20_0 + s_354_356 * g_354_low60_0_low20_0 = g_354_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_2 + u_354_356 * (const 64 (2**21)) + v_354_356 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_2 + r_354_356 * (const 64 (2**21)) + s_354_356 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_2,
    f_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_2,
    g_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 356)) <=s delta, delta <=s (const 64 (1 + 2*356)),
    (const 64 (-(2**20))) <=s u_354_356, u_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_356, v_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_356, r_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_356, s_354_356 <=s (const 64 ((2**20))),
    u_354_356 + v_354_356 <=s (const 64 (2**20)),
    u_354_356 - v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 + v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 - v_354_356 <=s (const 64 (2**20)),
    r_354_356 + s_354_356 <=s (const 64 (2**20)),
    r_354_356 - s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 + s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 - s_354_356 <=s (const 64 (2**20)),
    u_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_354_356 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_355_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_1,
sint64 g_354_low60_0_low20_1,
sint64 f_354_low60_0_low20_2,
sint64 g_354_low60_0_low20_2,
sint64 u_354_355,
sint64 v_354_355,
sint64 r_354_355,
sint64 s_354_355,
sint64 u_354_356,
sint64 v_354_356,
sint64 r_354_356,
sint64 s_354_356,
bit ne
)={
    u_354_355 * f_354_low60_0_low20_0 + v_354_355 * g_354_low60_0_low20_0 = f_354_low60_0_low20_1 * (-(2**20)),
    r_354_355 * f_354_low60_0_low20_0 + s_354_355 * g_354_low60_0_low20_0 = g_354_low60_0_low20_1 * (-(2**20))
&&
    u_354_355 * f_354_low60_0_low20_0 + v_354_355 * g_354_low60_0_low20_0 = f_354_low60_0_low20_1 * (const 64 (-(2**20))),
    r_354_355 * f_354_low60_0_low20_0 + s_354_355 * g_354_low60_0_low20_0 = g_354_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_1 + u_354_355 * (const 64 (2**21)) + v_354_355 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_1 + r_354_355 * (const 64 (2**21)) + s_354_355 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_1,
    f_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_1,
    g_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 355)) <=s delta, delta <=s (const 64 (1 + 2*355)),
    (const 64 (-(2**20))) <=s u_354_355, u_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_355, v_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_355, r_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_355, s_354_355 <=s (const 64 ((2**20))),
    u_354_355 + v_354_355 <=s (const 64 (2**20)),
    u_354_355 - v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 + v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 - v_354_355 <=s (const 64 (2**20)),
    r_354_355 + s_354_355 <=s (const 64 (2**20)),
    r_354_355 - s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 + s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 - s_354_355 <=s (const 64 (2**20)),
    u_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_354_355 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step1

// premise b
assume
g_354_low60_0_low20_1 = 1 (mod 2)
&&
g_354_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_2 f_354_low60_0_low20_1;
mov u_354_356 u_354_355;
mov v_354_356 v_354_355;

add g_354_low60_0_low20_2 g_354_low60_0_low20_1 f_354_low60_0_low20_1;
asr g_354_low60_0_low20_2 g_354_low60_0_low20_2 1;
add r_354_356 r_354_355 u_354_355;
asr r_354_356 r_354_356 1;
add s_354_356 s_354_355 v_354_355;
asr s_354_356 s_354_356 1;
assert
    true
&&
    f_354_low60_0_low20_2 = f_354_low60_0_low20_1,
    u_354_356 = u_354_355,
    v_354_356 = v_354_355,
    g_354_low60_0_low20_2 * (const 64 2) = g_354_low60_0_low20_1 + f_354_low60_0_low20_1,
    r_354_356 * (const 64 2) = r_354_355 + u_354_355,
    s_354_356 * (const 64 2) = s_354_355 + v_354_355
;

assume
    f_354_low60_0_low20_2 = f_354_low60_0_low20_1,
    u_354_356 = u_354_355,
    v_354_356 = v_354_355,
    g_354_low60_0_low20_2 * 2 = g_354_low60_0_low20_1 + f_354_low60_0_low20_1,
    r_354_356 * 2 = r_354_355 + u_354_355,
    s_354_356 * 2 = s_354_355 + v_354_355
&&
    true
;

{
    u_354_356 * f_354_low60_0_low20_0 + v_354_356 * g_354_low60_0_low20_0 = f_354_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_356 * f_354_low60_0_low20_0 + s_354_356 * g_354_low60_0_low20_0 = g_354_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_2 + u_354_356 * (const 64 (2**21)) + v_354_356 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_2 + r_354_356 * (const 64 (2**21)) + s_354_356 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_2,
    f_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_2,
    g_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 356)) <=s delta, delta <=s (const 64 (1 + 2*356)),
    (const 64 (-(2**20))) <=s u_354_356, u_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_356, v_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_356, r_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_356, s_354_356 <=s (const 64 ((2**20))),
    u_354_356 + v_354_356 <=s (const 64 (2**20)),
    u_354_356 - v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 + v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 - v_354_356 <=s (const 64 (2**20)),
    r_354_356 + s_354_356 <=s (const 64 (2**20)),
    r_354_356 - s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 + s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 - s_354_356 <=s (const 64 (2**20)),
    u_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_354_356 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_355_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_1,
sint64 g_354_low60_0_low20_1,
sint64 f_354_low60_0_low20_2,
sint64 g_354_low60_0_low20_2,
sint64 u_354_355,
sint64 v_354_355,
sint64 r_354_355,
sint64 s_354_355,
sint64 u_354_356,
sint64 v_354_356,
sint64 r_354_356,
sint64 s_354_356,
bit ne
)={
    u_354_355 * f_354_low60_0_low20_0 + v_354_355 * g_354_low60_0_low20_0 = f_354_low60_0_low20_1 * (-(2**20)),
    r_354_355 * f_354_low60_0_low20_0 + s_354_355 * g_354_low60_0_low20_0 = g_354_low60_0_low20_1 * (-(2**20))
&&
    u_354_355 * f_354_low60_0_low20_0 + v_354_355 * g_354_low60_0_low20_0 = f_354_low60_0_low20_1 * (const 64 (-(2**20))),
    r_354_355 * f_354_low60_0_low20_0 + s_354_355 * g_354_low60_0_low20_0 = g_354_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_1 + u_354_355 * (const 64 (2**21)) + v_354_355 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_1 + r_354_355 * (const 64 (2**21)) + s_354_355 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_1,
    f_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_1,
    g_354_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 355)) <=s delta, delta <=s (const 64 (1 + 2*355)),
    (const 64 (-(2**20))) <=s u_354_355, u_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_355, v_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_355, r_354_355 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_355, s_354_355 <=s (const 64 ((2**20))),
    u_354_355 + v_354_355 <=s (const 64 (2**20)),
    u_354_355 - v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 + v_354_355 <=s (const 64 (2**20)),
    (const 64 0) - u_354_355 - v_354_355 <=s (const 64 (2**20)),
    r_354_355 + s_354_355 <=s (const 64 (2**20)),
    r_354_355 - s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 + s_354_355 <=s (const 64 (2**20)),
    (const 64 0) - r_354_355 - s_354_355 <=s (const 64 (2**20)),
    u_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_354_355 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_354_355 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step1

// premise c
assume
g_354_low60_0_low20_1 = 1 (mod 2)
&&
g_354_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_2 g_354_low60_0_low20_1;
mov u_354_356 r_354_355;
mov v_354_356 s_354_355;

subs dc g_354_low60_0_low20_2 g_354_low60_0_low20_1 f_354_low60_0_low20_1;
asr g_354_low60_0_low20_2 g_354_low60_0_low20_2 1;
subs dc r_354_356 r_354_355 u_354_355;
asr r_354_356 r_354_356 1;
subs dc s_354_356 s_354_355 v_354_355;
asr s_354_356 s_354_356 1;
assert
    true
&&
    f_354_low60_0_low20_2 = g_354_low60_0_low20_1,
    u_354_356 = r_354_355,
    v_354_356 = s_354_355,
    g_354_low60_0_low20_2 * (const 64 2) = g_354_low60_0_low20_1 - f_354_low60_0_low20_1,
    r_354_356 * (const 64 2) = r_354_355 - u_354_355,
    s_354_356 * (const 64 2) = s_354_355 - v_354_355
;

assume
    f_354_low60_0_low20_2 = g_354_low60_0_low20_1,
    u_354_356 = r_354_355,
    v_354_356 = s_354_355,
    g_354_low60_0_low20_2 * 2 = g_354_low60_0_low20_1 - f_354_low60_0_low20_1,
    r_354_356 * 2 = r_354_355 - u_354_355,
    s_354_356 * 2 = s_354_355 - v_354_355
&&
    true
;

{
    u_354_356 * f_354_low60_0_low20_0 + v_354_356 * g_354_low60_0_low20_0 = f_354_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_356 * f_354_low60_0_low20_0 + s_354_356 * g_354_low60_0_low20_0 = g_354_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_2 + u_354_356 * (const 64 (2**21)) + v_354_356 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_2 + r_354_356 * (const 64 (2**21)) + s_354_356 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_2,
    f_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_2,
    g_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 356)) <=s delta, delta <=s (const 64 (1 + 2*356)),
    (const 64 (-(2**20))) <=s u_354_356, u_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_356, v_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_356, r_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_356, s_354_356 <=s (const 64 ((2**20))),
    u_354_356 + v_354_356 <=s (const 64 (2**20)),
    u_354_356 - v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 + v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 - v_354_356 <=s (const 64 (2**20)),
    r_354_356 + s_354_356 <=s (const 64 (2**20)),
    r_354_356 - s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 + s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 - s_354_356 <=s (const 64 (2**20)),
    u_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_354_356 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_356_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_2,
sint64 g_354_low60_0_low20_2,
sint64 f_354_low60_0_low20_3,
sint64 g_354_low60_0_low20_3,
sint64 u_354_356,
sint64 v_354_356,
sint64 r_354_356,
sint64 s_354_356,
sint64 u_354_357,
sint64 v_354_357,
sint64 r_354_357,
sint64 s_354_357,
bit ne
)={
    u_354_356 * f_354_low60_0_low20_0 + v_354_356 * g_354_low60_0_low20_0 = f_354_low60_0_low20_2 * (-(2**20)),
    r_354_356 * f_354_low60_0_low20_0 + s_354_356 * g_354_low60_0_low20_0 = g_354_low60_0_low20_2 * (-(2**20))
&&
    u_354_356 * f_354_low60_0_low20_0 + v_354_356 * g_354_low60_0_low20_0 = f_354_low60_0_low20_2 * (const 64 (-(2**20))),
    r_354_356 * f_354_low60_0_low20_0 + s_354_356 * g_354_low60_0_low20_0 = g_354_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_2 + u_354_356 * (const 64 (2**21)) + v_354_356 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_2 + r_354_356 * (const 64 (2**21)) + s_354_356 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_2,
    f_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_2,
    g_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 356)) <=s delta, delta <=s (const 64 (1 + 2*356)),
    (const 64 (-(2**20))) <=s u_354_356, u_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_356, v_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_356, r_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_356, s_354_356 <=s (const 64 ((2**20))),
    u_354_356 + v_354_356 <=s (const 64 (2**20)),
    u_354_356 - v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 + v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 - v_354_356 <=s (const 64 (2**20)),
    r_354_356 + s_354_356 <=s (const 64 (2**20)),
    r_354_356 - s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 + s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 - s_354_356 <=s (const 64 (2**20)),
    u_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_354_356 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step2

// premise a
assume
g_354_low60_0_low20_2 = 0 (mod 2)
&&
g_354_low60_0_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_3 f_354_low60_0_low20_2;
mov u_354_357 u_354_356;
mov v_354_357 v_354_356;

asr g_354_low60_0_low20_3 g_354_low60_0_low20_2 1;
asr r_354_357 r_354_356 1;
asr s_354_357 s_354_356 1;
assert
    true
&&
    f_354_low60_0_low20_3 = f_354_low60_0_low20_2,
    u_354_357 = u_354_356,
    v_354_357 = v_354_356,
    g_354_low60_0_low20_3 * (const 64 2) = g_354_low60_0_low20_2,
    r_354_357 * (const 64 2) = r_354_356,
    s_354_357 * (const 64 2) = s_354_356
;

assume
    f_354_low60_0_low20_3 = f_354_low60_0_low20_2,
    u_354_357 = u_354_356,
    v_354_357 = v_354_356,
    g_354_low60_0_low20_3 * 2 = g_354_low60_0_low20_2,
    r_354_357 * 2 = r_354_356,
    s_354_357 * 2 = s_354_356
&&
    true
;

{
    u_354_357 * f_354_low60_0_low20_0 + v_354_357 * g_354_low60_0_low20_0 = f_354_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_357 * f_354_low60_0_low20_0 + s_354_357 * g_354_low60_0_low20_0 = g_354_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_3 + u_354_357 * (const 64 (2**21)) + v_354_357 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_3 + r_354_357 * (const 64 (2**21)) + s_354_357 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_3,
    f_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_3,
    g_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 357)) <=s delta, delta <=s (const 64 (1 + 2*357)),
    (const 64 (-(2**20))) <=s u_354_357, u_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_357, v_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_357, r_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_357, s_354_357 <=s (const 64 ((2**20))),
    u_354_357 + v_354_357 <=s (const 64 (2**20)),
    u_354_357 - v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 + v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 - v_354_357 <=s (const 64 (2**20)),
    r_354_357 + s_354_357 <=s (const 64 (2**20)),
    r_354_357 - s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 + s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 - s_354_357 <=s (const 64 (2**20)),
    u_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_354_357 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_356_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_2,
sint64 g_354_low60_0_low20_2,
sint64 f_354_low60_0_low20_3,
sint64 g_354_low60_0_low20_3,
sint64 u_354_356,
sint64 v_354_356,
sint64 r_354_356,
sint64 s_354_356,
sint64 u_354_357,
sint64 v_354_357,
sint64 r_354_357,
sint64 s_354_357,
bit ne
)={
    u_354_356 * f_354_low60_0_low20_0 + v_354_356 * g_354_low60_0_low20_0 = f_354_low60_0_low20_2 * (-(2**20)),
    r_354_356 * f_354_low60_0_low20_0 + s_354_356 * g_354_low60_0_low20_0 = g_354_low60_0_low20_2 * (-(2**20))
&&
    u_354_356 * f_354_low60_0_low20_0 + v_354_356 * g_354_low60_0_low20_0 = f_354_low60_0_low20_2 * (const 64 (-(2**20))),
    r_354_356 * f_354_low60_0_low20_0 + s_354_356 * g_354_low60_0_low20_0 = g_354_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_2 + u_354_356 * (const 64 (2**21)) + v_354_356 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_2 + r_354_356 * (const 64 (2**21)) + s_354_356 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_2,
    f_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_2,
    g_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 356)) <=s delta, delta <=s (const 64 (1 + 2*356)),
    (const 64 (-(2**20))) <=s u_354_356, u_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_356, v_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_356, r_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_356, s_354_356 <=s (const 64 ((2**20))),
    u_354_356 + v_354_356 <=s (const 64 (2**20)),
    u_354_356 - v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 + v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 - v_354_356 <=s (const 64 (2**20)),
    r_354_356 + s_354_356 <=s (const 64 (2**20)),
    r_354_356 - s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 + s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 - s_354_356 <=s (const 64 (2**20)),
    u_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_354_356 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step2

// premise b
assume
g_354_low60_0_low20_2 = 1 (mod 2)
&&
g_354_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_3 f_354_low60_0_low20_2;
mov u_354_357 u_354_356;
mov v_354_357 v_354_356;

add g_354_low60_0_low20_3 g_354_low60_0_low20_2 f_354_low60_0_low20_2;
asr g_354_low60_0_low20_3 g_354_low60_0_low20_3 1;
add r_354_357 r_354_356 u_354_356;
asr r_354_357 r_354_357 1;
add s_354_357 s_354_356 v_354_356;
asr s_354_357 s_354_357 1;
assert
    true
&&
    f_354_low60_0_low20_3 = f_354_low60_0_low20_2,
    u_354_357 = u_354_356,
    v_354_357 = v_354_356,
    g_354_low60_0_low20_3 * (const 64 2) = g_354_low60_0_low20_2 + f_354_low60_0_low20_2,
    r_354_357 * (const 64 2) = r_354_356 + u_354_356,
    s_354_357 * (const 64 2) = s_354_356 + v_354_356
;

assume
    f_354_low60_0_low20_3 = f_354_low60_0_low20_2,
    u_354_357 = u_354_356,
    v_354_357 = v_354_356,
    g_354_low60_0_low20_3 * 2 = g_354_low60_0_low20_2 + f_354_low60_0_low20_2,
    r_354_357 * 2 = r_354_356 + u_354_356,
    s_354_357 * 2 = s_354_356 + v_354_356
&&
    true
;

{
    u_354_357 * f_354_low60_0_low20_0 + v_354_357 * g_354_low60_0_low20_0 = f_354_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_357 * f_354_low60_0_low20_0 + s_354_357 * g_354_low60_0_low20_0 = g_354_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_3 + u_354_357 * (const 64 (2**21)) + v_354_357 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_3 + r_354_357 * (const 64 (2**21)) + s_354_357 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_3,
    f_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_3,
    g_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 357)) <=s delta, delta <=s (const 64 (1 + 2*357)),
    (const 64 (-(2**20))) <=s u_354_357, u_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_357, v_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_357, r_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_357, s_354_357 <=s (const 64 ((2**20))),
    u_354_357 + v_354_357 <=s (const 64 (2**20)),
    u_354_357 - v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 + v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 - v_354_357 <=s (const 64 (2**20)),
    r_354_357 + s_354_357 <=s (const 64 (2**20)),
    r_354_357 - s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 + s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 - s_354_357 <=s (const 64 (2**20)),
    u_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_354_357 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_356_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_2,
sint64 g_354_low60_0_low20_2,
sint64 f_354_low60_0_low20_3,
sint64 g_354_low60_0_low20_3,
sint64 u_354_356,
sint64 v_354_356,
sint64 r_354_356,
sint64 s_354_356,
sint64 u_354_357,
sint64 v_354_357,
sint64 r_354_357,
sint64 s_354_357,
bit ne
)={
    u_354_356 * f_354_low60_0_low20_0 + v_354_356 * g_354_low60_0_low20_0 = f_354_low60_0_low20_2 * (-(2**20)),
    r_354_356 * f_354_low60_0_low20_0 + s_354_356 * g_354_low60_0_low20_0 = g_354_low60_0_low20_2 * (-(2**20))
&&
    u_354_356 * f_354_low60_0_low20_0 + v_354_356 * g_354_low60_0_low20_0 = f_354_low60_0_low20_2 * (const 64 (-(2**20))),
    r_354_356 * f_354_low60_0_low20_0 + s_354_356 * g_354_low60_0_low20_0 = g_354_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_2 + u_354_356 * (const 64 (2**21)) + v_354_356 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_2 + r_354_356 * (const 64 (2**21)) + s_354_356 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_2,
    f_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_2,
    g_354_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 356)) <=s delta, delta <=s (const 64 (1 + 2*356)),
    (const 64 (-(2**20))) <=s u_354_356, u_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_356, v_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_356, r_354_356 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_356, s_354_356 <=s (const 64 ((2**20))),
    u_354_356 + v_354_356 <=s (const 64 (2**20)),
    u_354_356 - v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 + v_354_356 <=s (const 64 (2**20)),
    (const 64 0) - u_354_356 - v_354_356 <=s (const 64 (2**20)),
    r_354_356 + s_354_356 <=s (const 64 (2**20)),
    r_354_356 - s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 + s_354_356 <=s (const 64 (2**20)),
    (const 64 0) - r_354_356 - s_354_356 <=s (const 64 (2**20)),
    u_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_354_356 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_354_356 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step2

// premise c
assume
g_354_low60_0_low20_2 = 1 (mod 2)
&&
g_354_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_3 g_354_low60_0_low20_2;
mov u_354_357 r_354_356;
mov v_354_357 s_354_356;

subs dc g_354_low60_0_low20_3 g_354_low60_0_low20_2 f_354_low60_0_low20_2;
asr g_354_low60_0_low20_3 g_354_low60_0_low20_3 1;
subs dc r_354_357 r_354_356 u_354_356;
asr r_354_357 r_354_357 1;
subs dc s_354_357 s_354_356 v_354_356;
asr s_354_357 s_354_357 1;
assert
    true
&&
    f_354_low60_0_low20_3 = g_354_low60_0_low20_2,
    u_354_357 = r_354_356,
    v_354_357 = s_354_356,
    g_354_low60_0_low20_3 * (const 64 2) = g_354_low60_0_low20_2 - f_354_low60_0_low20_2,
    r_354_357 * (const 64 2) = r_354_356 - u_354_356,
    s_354_357 * (const 64 2) = s_354_356 - v_354_356
;

assume
    f_354_low60_0_low20_3 = g_354_low60_0_low20_2,
    u_354_357 = r_354_356,
    v_354_357 = s_354_356,
    g_354_low60_0_low20_3 * 2 = g_354_low60_0_low20_2 - f_354_low60_0_low20_2,
    r_354_357 * 2 = r_354_356 - u_354_356,
    s_354_357 * 2 = s_354_356 - v_354_356
&&
    true
;

{
    u_354_357 * f_354_low60_0_low20_0 + v_354_357 * g_354_low60_0_low20_0 = f_354_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_357 * f_354_low60_0_low20_0 + s_354_357 * g_354_low60_0_low20_0 = g_354_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_3 + u_354_357 * (const 64 (2**21)) + v_354_357 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_3 + r_354_357 * (const 64 (2**21)) + s_354_357 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_3,
    f_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_3,
    g_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 357)) <=s delta, delta <=s (const 64 (1 + 2*357)),
    (const 64 (-(2**20))) <=s u_354_357, u_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_357, v_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_357, r_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_357, s_354_357 <=s (const 64 ((2**20))),
    u_354_357 + v_354_357 <=s (const 64 (2**20)),
    u_354_357 - v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 + v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 - v_354_357 <=s (const 64 (2**20)),
    r_354_357 + s_354_357 <=s (const 64 (2**20)),
    r_354_357 - s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 + s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 - s_354_357 <=s (const 64 (2**20)),
    u_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_354_357 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_357_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_3,
sint64 g_354_low60_0_low20_3,
sint64 f_354_low60_0_low20_4,
sint64 g_354_low60_0_low20_4,
sint64 u_354_357,
sint64 v_354_357,
sint64 r_354_357,
sint64 s_354_357,
sint64 u_354_358,
sint64 v_354_358,
sint64 r_354_358,
sint64 s_354_358,
bit ne
)={
    u_354_357 * f_354_low60_0_low20_0 + v_354_357 * g_354_low60_0_low20_0 = f_354_low60_0_low20_3 * (-(2**20)),
    r_354_357 * f_354_low60_0_low20_0 + s_354_357 * g_354_low60_0_low20_0 = g_354_low60_0_low20_3 * (-(2**20))
&&
    u_354_357 * f_354_low60_0_low20_0 + v_354_357 * g_354_low60_0_low20_0 = f_354_low60_0_low20_3 * (const 64 (-(2**20))),
    r_354_357 * f_354_low60_0_low20_0 + s_354_357 * g_354_low60_0_low20_0 = g_354_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_3 + u_354_357 * (const 64 (2**21)) + v_354_357 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_3 + r_354_357 * (const 64 (2**21)) + s_354_357 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_3,
    f_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_3,
    g_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 357)) <=s delta, delta <=s (const 64 (1 + 2*357)),
    (const 64 (-(2**20))) <=s u_354_357, u_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_357, v_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_357, r_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_357, s_354_357 <=s (const 64 ((2**20))),
    u_354_357 + v_354_357 <=s (const 64 (2**20)),
    u_354_357 - v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 + v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 - v_354_357 <=s (const 64 (2**20)),
    r_354_357 + s_354_357 <=s (const 64 (2**20)),
    r_354_357 - s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 + s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 - s_354_357 <=s (const 64 (2**20)),
    u_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_354_357 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step3

// premise a
assume
g_354_low60_0_low20_3 = 0 (mod 2)
&&
g_354_low60_0_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_4 f_354_low60_0_low20_3;
mov u_354_358 u_354_357;
mov v_354_358 v_354_357;

asr g_354_low60_0_low20_4 g_354_low60_0_low20_3 1;
asr r_354_358 r_354_357 1;
asr s_354_358 s_354_357 1;
assert
    true
&&
    f_354_low60_0_low20_4 = f_354_low60_0_low20_3,
    u_354_358 = u_354_357,
    v_354_358 = v_354_357,
    g_354_low60_0_low20_4 * (const 64 2) = g_354_low60_0_low20_3,
    r_354_358 * (const 64 2) = r_354_357,
    s_354_358 * (const 64 2) = s_354_357
;

assume
    f_354_low60_0_low20_4 = f_354_low60_0_low20_3,
    u_354_358 = u_354_357,
    v_354_358 = v_354_357,
    g_354_low60_0_low20_4 * 2 = g_354_low60_0_low20_3,
    r_354_358 * 2 = r_354_357,
    s_354_358 * 2 = s_354_357
&&
    true
;

{
    u_354_358 * f_354_low60_0_low20_0 + v_354_358 * g_354_low60_0_low20_0 = f_354_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_358 * f_354_low60_0_low20_0 + s_354_358 * g_354_low60_0_low20_0 = g_354_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_4 + u_354_358 * (const 64 (2**21)) + v_354_358 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_4 + r_354_358 * (const 64 (2**21)) + s_354_358 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_4,
    f_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_4,
    g_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 358)) <=s delta, delta <=s (const 64 (1 + 2*358)),
    (const 64 (-(2**20))) <=s u_354_358, u_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_358, v_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_358, r_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_358, s_354_358 <=s (const 64 ((2**20))),
    u_354_358 + v_354_358 <=s (const 64 (2**20)),
    u_354_358 - v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 + v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 - v_354_358 <=s (const 64 (2**20)),
    r_354_358 + s_354_358 <=s (const 64 (2**20)),
    r_354_358 - s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 + s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 - s_354_358 <=s (const 64 (2**20)),
    u_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_354_358 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_357_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_3,
sint64 g_354_low60_0_low20_3,
sint64 f_354_low60_0_low20_4,
sint64 g_354_low60_0_low20_4,
sint64 u_354_357,
sint64 v_354_357,
sint64 r_354_357,
sint64 s_354_357,
sint64 u_354_358,
sint64 v_354_358,
sint64 r_354_358,
sint64 s_354_358,
bit ne
)={
    u_354_357 * f_354_low60_0_low20_0 + v_354_357 * g_354_low60_0_low20_0 = f_354_low60_0_low20_3 * (-(2**20)),
    r_354_357 * f_354_low60_0_low20_0 + s_354_357 * g_354_low60_0_low20_0 = g_354_low60_0_low20_3 * (-(2**20))
&&
    u_354_357 * f_354_low60_0_low20_0 + v_354_357 * g_354_low60_0_low20_0 = f_354_low60_0_low20_3 * (const 64 (-(2**20))),
    r_354_357 * f_354_low60_0_low20_0 + s_354_357 * g_354_low60_0_low20_0 = g_354_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_3 + u_354_357 * (const 64 (2**21)) + v_354_357 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_3 + r_354_357 * (const 64 (2**21)) + s_354_357 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_3,
    f_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_3,
    g_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 357)) <=s delta, delta <=s (const 64 (1 + 2*357)),
    (const 64 (-(2**20))) <=s u_354_357, u_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_357, v_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_357, r_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_357, s_354_357 <=s (const 64 ((2**20))),
    u_354_357 + v_354_357 <=s (const 64 (2**20)),
    u_354_357 - v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 + v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 - v_354_357 <=s (const 64 (2**20)),
    r_354_357 + s_354_357 <=s (const 64 (2**20)),
    r_354_357 - s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 + s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 - s_354_357 <=s (const 64 (2**20)),
    u_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_354_357 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step3

// premise b
assume
g_354_low60_0_low20_3 = 1 (mod 2)
&&
g_354_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_4 f_354_low60_0_low20_3;
mov u_354_358 u_354_357;
mov v_354_358 v_354_357;

add g_354_low60_0_low20_4 g_354_low60_0_low20_3 f_354_low60_0_low20_3;
asr g_354_low60_0_low20_4 g_354_low60_0_low20_4 1;
add r_354_358 r_354_357 u_354_357;
asr r_354_358 r_354_358 1;
add s_354_358 s_354_357 v_354_357;
asr s_354_358 s_354_358 1;
assert
    true
&&
    f_354_low60_0_low20_4 = f_354_low60_0_low20_3,
    u_354_358 = u_354_357,
    v_354_358 = v_354_357,
    g_354_low60_0_low20_4 * (const 64 2) = g_354_low60_0_low20_3 + f_354_low60_0_low20_3,
    r_354_358 * (const 64 2) = r_354_357 + u_354_357,
    s_354_358 * (const 64 2) = s_354_357 + v_354_357
;

assume
    f_354_low60_0_low20_4 = f_354_low60_0_low20_3,
    u_354_358 = u_354_357,
    v_354_358 = v_354_357,
    g_354_low60_0_low20_4 * 2 = g_354_low60_0_low20_3 + f_354_low60_0_low20_3,
    r_354_358 * 2 = r_354_357 + u_354_357,
    s_354_358 * 2 = s_354_357 + v_354_357
&&
    true
;

{
    u_354_358 * f_354_low60_0_low20_0 + v_354_358 * g_354_low60_0_low20_0 = f_354_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_358 * f_354_low60_0_low20_0 + s_354_358 * g_354_low60_0_low20_0 = g_354_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_4 + u_354_358 * (const 64 (2**21)) + v_354_358 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_4 + r_354_358 * (const 64 (2**21)) + s_354_358 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_4,
    f_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_4,
    g_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 358)) <=s delta, delta <=s (const 64 (1 + 2*358)),
    (const 64 (-(2**20))) <=s u_354_358, u_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_358, v_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_358, r_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_358, s_354_358 <=s (const 64 ((2**20))),
    u_354_358 + v_354_358 <=s (const 64 (2**20)),
    u_354_358 - v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 + v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 - v_354_358 <=s (const 64 (2**20)),
    r_354_358 + s_354_358 <=s (const 64 (2**20)),
    r_354_358 - s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 + s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 - s_354_358 <=s (const 64 (2**20)),
    u_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_354_358 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_357_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_3,
sint64 g_354_low60_0_low20_3,
sint64 f_354_low60_0_low20_4,
sint64 g_354_low60_0_low20_4,
sint64 u_354_357,
sint64 v_354_357,
sint64 r_354_357,
sint64 s_354_357,
sint64 u_354_358,
sint64 v_354_358,
sint64 r_354_358,
sint64 s_354_358,
bit ne
)={
    u_354_357 * f_354_low60_0_low20_0 + v_354_357 * g_354_low60_0_low20_0 = f_354_low60_0_low20_3 * (-(2**20)),
    r_354_357 * f_354_low60_0_low20_0 + s_354_357 * g_354_low60_0_low20_0 = g_354_low60_0_low20_3 * (-(2**20))
&&
    u_354_357 * f_354_low60_0_low20_0 + v_354_357 * g_354_low60_0_low20_0 = f_354_low60_0_low20_3 * (const 64 (-(2**20))),
    r_354_357 * f_354_low60_0_low20_0 + s_354_357 * g_354_low60_0_low20_0 = g_354_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_3 + u_354_357 * (const 64 (2**21)) + v_354_357 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_3 + r_354_357 * (const 64 (2**21)) + s_354_357 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_3,
    f_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_3,
    g_354_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 357)) <=s delta, delta <=s (const 64 (1 + 2*357)),
    (const 64 (-(2**20))) <=s u_354_357, u_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_357, v_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_357, r_354_357 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_357, s_354_357 <=s (const 64 ((2**20))),
    u_354_357 + v_354_357 <=s (const 64 (2**20)),
    u_354_357 - v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 + v_354_357 <=s (const 64 (2**20)),
    (const 64 0) - u_354_357 - v_354_357 <=s (const 64 (2**20)),
    r_354_357 + s_354_357 <=s (const 64 (2**20)),
    r_354_357 - s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 + s_354_357 <=s (const 64 (2**20)),
    (const 64 0) - r_354_357 - s_354_357 <=s (const 64 (2**20)),
    u_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_354_357 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_354_357 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step3

// premise c
assume
g_354_low60_0_low20_3 = 1 (mod 2)
&&
g_354_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_4 g_354_low60_0_low20_3;
mov u_354_358 r_354_357;
mov v_354_358 s_354_357;

subs dc g_354_low60_0_low20_4 g_354_low60_0_low20_3 f_354_low60_0_low20_3;
asr g_354_low60_0_low20_4 g_354_low60_0_low20_4 1;
subs dc r_354_358 r_354_357 u_354_357;
asr r_354_358 r_354_358 1;
subs dc s_354_358 s_354_357 v_354_357;
asr s_354_358 s_354_358 1;
assert
    true
&&
    f_354_low60_0_low20_4 = g_354_low60_0_low20_3,
    u_354_358 = r_354_357,
    v_354_358 = s_354_357,
    g_354_low60_0_low20_4 * (const 64 2) = g_354_low60_0_low20_3 - f_354_low60_0_low20_3,
    r_354_358 * (const 64 2) = r_354_357 - u_354_357,
    s_354_358 * (const 64 2) = s_354_357 - v_354_357
;

assume
    f_354_low60_0_low20_4 = g_354_low60_0_low20_3,
    u_354_358 = r_354_357,
    v_354_358 = s_354_357,
    g_354_low60_0_low20_4 * 2 = g_354_low60_0_low20_3 - f_354_low60_0_low20_3,
    r_354_358 * 2 = r_354_357 - u_354_357,
    s_354_358 * 2 = s_354_357 - v_354_357
&&
    true
;

{
    u_354_358 * f_354_low60_0_low20_0 + v_354_358 * g_354_low60_0_low20_0 = f_354_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_358 * f_354_low60_0_low20_0 + s_354_358 * g_354_low60_0_low20_0 = g_354_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_4 + u_354_358 * (const 64 (2**21)) + v_354_358 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_4 + r_354_358 * (const 64 (2**21)) + s_354_358 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_4,
    f_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_4,
    g_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 358)) <=s delta, delta <=s (const 64 (1 + 2*358)),
    (const 64 (-(2**20))) <=s u_354_358, u_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_358, v_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_358, r_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_358, s_354_358 <=s (const 64 ((2**20))),
    u_354_358 + v_354_358 <=s (const 64 (2**20)),
    u_354_358 - v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 + v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 - v_354_358 <=s (const 64 (2**20)),
    r_354_358 + s_354_358 <=s (const 64 (2**20)),
    r_354_358 - s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 + s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 - s_354_358 <=s (const 64 (2**20)),
    u_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_354_358 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_358_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_4,
sint64 g_354_low60_0_low20_4,
sint64 f_354_low60_0_low20_5,
sint64 g_354_low60_0_low20_5,
sint64 u_354_358,
sint64 v_354_358,
sint64 r_354_358,
sint64 s_354_358,
sint64 u_354_359,
sint64 v_354_359,
sint64 r_354_359,
sint64 s_354_359,
bit ne
)={
    u_354_358 * f_354_low60_0_low20_0 + v_354_358 * g_354_low60_0_low20_0 = f_354_low60_0_low20_4 * (-(2**20)),
    r_354_358 * f_354_low60_0_low20_0 + s_354_358 * g_354_low60_0_low20_0 = g_354_low60_0_low20_4 * (-(2**20))
&&
    u_354_358 * f_354_low60_0_low20_0 + v_354_358 * g_354_low60_0_low20_0 = f_354_low60_0_low20_4 * (const 64 (-(2**20))),
    r_354_358 * f_354_low60_0_low20_0 + s_354_358 * g_354_low60_0_low20_0 = g_354_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_4 + u_354_358 * (const 64 (2**21)) + v_354_358 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_4 + r_354_358 * (const 64 (2**21)) + s_354_358 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_4,
    f_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_4,
    g_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 358)) <=s delta, delta <=s (const 64 (1 + 2*358)),
    (const 64 (-(2**20))) <=s u_354_358, u_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_358, v_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_358, r_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_358, s_354_358 <=s (const 64 ((2**20))),
    u_354_358 + v_354_358 <=s (const 64 (2**20)),
    u_354_358 - v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 + v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 - v_354_358 <=s (const 64 (2**20)),
    r_354_358 + s_354_358 <=s (const 64 (2**20)),
    r_354_358 - s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 + s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 - s_354_358 <=s (const 64 (2**20)),
    u_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_354_358 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step4

// premise a
assume
g_354_low60_0_low20_4 = 0 (mod 2)
&&
g_354_low60_0_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_5 f_354_low60_0_low20_4;
mov u_354_359 u_354_358;
mov v_354_359 v_354_358;

asr g_354_low60_0_low20_5 g_354_low60_0_low20_4 1;
asr r_354_359 r_354_358 1;
asr s_354_359 s_354_358 1;
assert
    true
&&
    f_354_low60_0_low20_5 = f_354_low60_0_low20_4,
    u_354_359 = u_354_358,
    v_354_359 = v_354_358,
    g_354_low60_0_low20_5 * (const 64 2) = g_354_low60_0_low20_4,
    r_354_359 * (const 64 2) = r_354_358,
    s_354_359 * (const 64 2) = s_354_358
;

assume
    f_354_low60_0_low20_5 = f_354_low60_0_low20_4,
    u_354_359 = u_354_358,
    v_354_359 = v_354_358,
    g_354_low60_0_low20_5 * 2 = g_354_low60_0_low20_4,
    r_354_359 * 2 = r_354_358,
    s_354_359 * 2 = s_354_358
&&
    true
;

{
    u_354_359 * f_354_low60_0_low20_0 + v_354_359 * g_354_low60_0_low20_0 = f_354_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_359 * f_354_low60_0_low20_0 + s_354_359 * g_354_low60_0_low20_0 = g_354_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_5 + u_354_359 * (const 64 (2**21)) + v_354_359 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_5 + r_354_359 * (const 64 (2**21)) + s_354_359 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_5,
    f_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_5,
    g_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 359)) <=s delta, delta <=s (const 64 (1 + 2*359)),
    (const 64 (-(2**20))) <=s u_354_359, u_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_359, v_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_359, r_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_359, s_354_359 <=s (const 64 ((2**20))),
    u_354_359 + v_354_359 <=s (const 64 (2**20)),
    u_354_359 - v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 + v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 - v_354_359 <=s (const 64 (2**20)),
    r_354_359 + s_354_359 <=s (const 64 (2**20)),
    r_354_359 - s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 + s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 - s_354_359 <=s (const 64 (2**20)),
    u_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_354_359 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_358_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_4,
sint64 g_354_low60_0_low20_4,
sint64 f_354_low60_0_low20_5,
sint64 g_354_low60_0_low20_5,
sint64 u_354_358,
sint64 v_354_358,
sint64 r_354_358,
sint64 s_354_358,
sint64 u_354_359,
sint64 v_354_359,
sint64 r_354_359,
sint64 s_354_359,
bit ne
)={
    u_354_358 * f_354_low60_0_low20_0 + v_354_358 * g_354_low60_0_low20_0 = f_354_low60_0_low20_4 * (-(2**20)),
    r_354_358 * f_354_low60_0_low20_0 + s_354_358 * g_354_low60_0_low20_0 = g_354_low60_0_low20_4 * (-(2**20))
&&
    u_354_358 * f_354_low60_0_low20_0 + v_354_358 * g_354_low60_0_low20_0 = f_354_low60_0_low20_4 * (const 64 (-(2**20))),
    r_354_358 * f_354_low60_0_low20_0 + s_354_358 * g_354_low60_0_low20_0 = g_354_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_4 + u_354_358 * (const 64 (2**21)) + v_354_358 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_4 + r_354_358 * (const 64 (2**21)) + s_354_358 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_4,
    f_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_4,
    g_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 358)) <=s delta, delta <=s (const 64 (1 + 2*358)),
    (const 64 (-(2**20))) <=s u_354_358, u_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_358, v_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_358, r_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_358, s_354_358 <=s (const 64 ((2**20))),
    u_354_358 + v_354_358 <=s (const 64 (2**20)),
    u_354_358 - v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 + v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 - v_354_358 <=s (const 64 (2**20)),
    r_354_358 + s_354_358 <=s (const 64 (2**20)),
    r_354_358 - s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 + s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 - s_354_358 <=s (const 64 (2**20)),
    u_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_354_358 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step4

// premise b
assume
g_354_low60_0_low20_4 = 1 (mod 2)
&&
g_354_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_5 f_354_low60_0_low20_4;
mov u_354_359 u_354_358;
mov v_354_359 v_354_358;

add g_354_low60_0_low20_5 g_354_low60_0_low20_4 f_354_low60_0_low20_4;
asr g_354_low60_0_low20_5 g_354_low60_0_low20_5 1;
add r_354_359 r_354_358 u_354_358;
asr r_354_359 r_354_359 1;
add s_354_359 s_354_358 v_354_358;
asr s_354_359 s_354_359 1;
assert
    true
&&
    f_354_low60_0_low20_5 = f_354_low60_0_low20_4,
    u_354_359 = u_354_358,
    v_354_359 = v_354_358,
    g_354_low60_0_low20_5 * (const 64 2) = g_354_low60_0_low20_4 + f_354_low60_0_low20_4,
    r_354_359 * (const 64 2) = r_354_358 + u_354_358,
    s_354_359 * (const 64 2) = s_354_358 + v_354_358
;

assume
    f_354_low60_0_low20_5 = f_354_low60_0_low20_4,
    u_354_359 = u_354_358,
    v_354_359 = v_354_358,
    g_354_low60_0_low20_5 * 2 = g_354_low60_0_low20_4 + f_354_low60_0_low20_4,
    r_354_359 * 2 = r_354_358 + u_354_358,
    s_354_359 * 2 = s_354_358 + v_354_358
&&
    true
;

{
    u_354_359 * f_354_low60_0_low20_0 + v_354_359 * g_354_low60_0_low20_0 = f_354_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_359 * f_354_low60_0_low20_0 + s_354_359 * g_354_low60_0_low20_0 = g_354_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_5 + u_354_359 * (const 64 (2**21)) + v_354_359 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_5 + r_354_359 * (const 64 (2**21)) + s_354_359 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_5,
    f_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_5,
    g_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 359)) <=s delta, delta <=s (const 64 (1 + 2*359)),
    (const 64 (-(2**20))) <=s u_354_359, u_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_359, v_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_359, r_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_359, s_354_359 <=s (const 64 ((2**20))),
    u_354_359 + v_354_359 <=s (const 64 (2**20)),
    u_354_359 - v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 + v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 - v_354_359 <=s (const 64 (2**20)),
    r_354_359 + s_354_359 <=s (const 64 (2**20)),
    r_354_359 - s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 + s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 - s_354_359 <=s (const 64 (2**20)),
    u_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_354_359 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_358_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_4,
sint64 g_354_low60_0_low20_4,
sint64 f_354_low60_0_low20_5,
sint64 g_354_low60_0_low20_5,
sint64 u_354_358,
sint64 v_354_358,
sint64 r_354_358,
sint64 s_354_358,
sint64 u_354_359,
sint64 v_354_359,
sint64 r_354_359,
sint64 s_354_359,
bit ne
)={
    u_354_358 * f_354_low60_0_low20_0 + v_354_358 * g_354_low60_0_low20_0 = f_354_low60_0_low20_4 * (-(2**20)),
    r_354_358 * f_354_low60_0_low20_0 + s_354_358 * g_354_low60_0_low20_0 = g_354_low60_0_low20_4 * (-(2**20))
&&
    u_354_358 * f_354_low60_0_low20_0 + v_354_358 * g_354_low60_0_low20_0 = f_354_low60_0_low20_4 * (const 64 (-(2**20))),
    r_354_358 * f_354_low60_0_low20_0 + s_354_358 * g_354_low60_0_low20_0 = g_354_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_4 + u_354_358 * (const 64 (2**21)) + v_354_358 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_4 + r_354_358 * (const 64 (2**21)) + s_354_358 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_4,
    f_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_4,
    g_354_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 358)) <=s delta, delta <=s (const 64 (1 + 2*358)),
    (const 64 (-(2**20))) <=s u_354_358, u_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_358, v_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_358, r_354_358 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_358, s_354_358 <=s (const 64 ((2**20))),
    u_354_358 + v_354_358 <=s (const 64 (2**20)),
    u_354_358 - v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 + v_354_358 <=s (const 64 (2**20)),
    (const 64 0) - u_354_358 - v_354_358 <=s (const 64 (2**20)),
    r_354_358 + s_354_358 <=s (const 64 (2**20)),
    r_354_358 - s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 + s_354_358 <=s (const 64 (2**20)),
    (const 64 0) - r_354_358 - s_354_358 <=s (const 64 (2**20)),
    u_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_354_358 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_354_358 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step4

// premise c
assume
g_354_low60_0_low20_4 = 1 (mod 2)
&&
g_354_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_5 g_354_low60_0_low20_4;
mov u_354_359 r_354_358;
mov v_354_359 s_354_358;

subs dc g_354_low60_0_low20_5 g_354_low60_0_low20_4 f_354_low60_0_low20_4;
asr g_354_low60_0_low20_5 g_354_low60_0_low20_5 1;
subs dc r_354_359 r_354_358 u_354_358;
asr r_354_359 r_354_359 1;
subs dc s_354_359 s_354_358 v_354_358;
asr s_354_359 s_354_359 1;
assert
    true
&&
    f_354_low60_0_low20_5 = g_354_low60_0_low20_4,
    u_354_359 = r_354_358,
    v_354_359 = s_354_358,
    g_354_low60_0_low20_5 * (const 64 2) = g_354_low60_0_low20_4 - f_354_low60_0_low20_4,
    r_354_359 * (const 64 2) = r_354_358 - u_354_358,
    s_354_359 * (const 64 2) = s_354_358 - v_354_358
;

assume
    f_354_low60_0_low20_5 = g_354_low60_0_low20_4,
    u_354_359 = r_354_358,
    v_354_359 = s_354_358,
    g_354_low60_0_low20_5 * 2 = g_354_low60_0_low20_4 - f_354_low60_0_low20_4,
    r_354_359 * 2 = r_354_358 - u_354_358,
    s_354_359 * 2 = s_354_358 - v_354_358
&&
    true
;

{
    u_354_359 * f_354_low60_0_low20_0 + v_354_359 * g_354_low60_0_low20_0 = f_354_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_359 * f_354_low60_0_low20_0 + s_354_359 * g_354_low60_0_low20_0 = g_354_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_5 + u_354_359 * (const 64 (2**21)) + v_354_359 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_5 + r_354_359 * (const 64 (2**21)) + s_354_359 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_5,
    f_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_5,
    g_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 359)) <=s delta, delta <=s (const 64 (1 + 2*359)),
    (const 64 (-(2**20))) <=s u_354_359, u_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_359, v_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_359, r_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_359, s_354_359 <=s (const 64 ((2**20))),
    u_354_359 + v_354_359 <=s (const 64 (2**20)),
    u_354_359 - v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 + v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 - v_354_359 <=s (const 64 (2**20)),
    r_354_359 + s_354_359 <=s (const 64 (2**20)),
    r_354_359 - s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 + s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 - s_354_359 <=s (const 64 (2**20)),
    u_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_354_359 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_359_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_5,
sint64 g_354_low60_0_low20_5,
sint64 f_354_low60_0_low20_6,
sint64 g_354_low60_0_low20_6,
sint64 u_354_359,
sint64 v_354_359,
sint64 r_354_359,
sint64 s_354_359,
sint64 u_354_360,
sint64 v_354_360,
sint64 r_354_360,
sint64 s_354_360,
bit ne
)={
    u_354_359 * f_354_low60_0_low20_0 + v_354_359 * g_354_low60_0_low20_0 = f_354_low60_0_low20_5 * (-(2**20)),
    r_354_359 * f_354_low60_0_low20_0 + s_354_359 * g_354_low60_0_low20_0 = g_354_low60_0_low20_5 * (-(2**20))
&&
    u_354_359 * f_354_low60_0_low20_0 + v_354_359 * g_354_low60_0_low20_0 = f_354_low60_0_low20_5 * (const 64 (-(2**20))),
    r_354_359 * f_354_low60_0_low20_0 + s_354_359 * g_354_low60_0_low20_0 = g_354_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_5 + u_354_359 * (const 64 (2**21)) + v_354_359 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_5 + r_354_359 * (const 64 (2**21)) + s_354_359 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_5,
    f_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_5,
    g_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 359)) <=s delta, delta <=s (const 64 (1 + 2*359)),
    (const 64 (-(2**20))) <=s u_354_359, u_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_359, v_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_359, r_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_359, s_354_359 <=s (const 64 ((2**20))),
    u_354_359 + v_354_359 <=s (const 64 (2**20)),
    u_354_359 - v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 + v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 - v_354_359 <=s (const 64 (2**20)),
    r_354_359 + s_354_359 <=s (const 64 (2**20)),
    r_354_359 - s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 + s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 - s_354_359 <=s (const 64 (2**20)),
    u_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_354_359 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step5

// premise a
assume
g_354_low60_0_low20_5 = 0 (mod 2)
&&
g_354_low60_0_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_6 f_354_low60_0_low20_5;
mov u_354_360 u_354_359;
mov v_354_360 v_354_359;

asr g_354_low60_0_low20_6 g_354_low60_0_low20_5 1;
asr r_354_360 r_354_359 1;
asr s_354_360 s_354_359 1;
assert
    true
&&
    f_354_low60_0_low20_6 = f_354_low60_0_low20_5,
    u_354_360 = u_354_359,
    v_354_360 = v_354_359,
    g_354_low60_0_low20_6 * (const 64 2) = g_354_low60_0_low20_5,
    r_354_360 * (const 64 2) = r_354_359,
    s_354_360 * (const 64 2) = s_354_359
;

assume
    f_354_low60_0_low20_6 = f_354_low60_0_low20_5,
    u_354_360 = u_354_359,
    v_354_360 = v_354_359,
    g_354_low60_0_low20_6 * 2 = g_354_low60_0_low20_5,
    r_354_360 * 2 = r_354_359,
    s_354_360 * 2 = s_354_359
&&
    true
;

{
    u_354_360 * f_354_low60_0_low20_0 + v_354_360 * g_354_low60_0_low20_0 = f_354_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_360 * f_354_low60_0_low20_0 + s_354_360 * g_354_low60_0_low20_0 = g_354_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_6 + u_354_360 * (const 64 (2**21)) + v_354_360 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_6 + r_354_360 * (const 64 (2**21)) + s_354_360 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_6,
    f_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_6,
    g_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 360)) <=s delta, delta <=s (const 64 (1 + 2*360)),
    (const 64 (-(2**20))) <=s u_354_360, u_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_360, v_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_360, r_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_360, s_354_360 <=s (const 64 ((2**20))),
    u_354_360 + v_354_360 <=s (const 64 (2**20)),
    u_354_360 - v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 + v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 - v_354_360 <=s (const 64 (2**20)),
    r_354_360 + s_354_360 <=s (const 64 (2**20)),
    r_354_360 - s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 + s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 - s_354_360 <=s (const 64 (2**20)),
    u_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_354_360 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_359_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_5,
sint64 g_354_low60_0_low20_5,
sint64 f_354_low60_0_low20_6,
sint64 g_354_low60_0_low20_6,
sint64 u_354_359,
sint64 v_354_359,
sint64 r_354_359,
sint64 s_354_359,
sint64 u_354_360,
sint64 v_354_360,
sint64 r_354_360,
sint64 s_354_360,
bit ne
)={
    u_354_359 * f_354_low60_0_low20_0 + v_354_359 * g_354_low60_0_low20_0 = f_354_low60_0_low20_5 * (-(2**20)),
    r_354_359 * f_354_low60_0_low20_0 + s_354_359 * g_354_low60_0_low20_0 = g_354_low60_0_low20_5 * (-(2**20))
&&
    u_354_359 * f_354_low60_0_low20_0 + v_354_359 * g_354_low60_0_low20_0 = f_354_low60_0_low20_5 * (const 64 (-(2**20))),
    r_354_359 * f_354_low60_0_low20_0 + s_354_359 * g_354_low60_0_low20_0 = g_354_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_5 + u_354_359 * (const 64 (2**21)) + v_354_359 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_5 + r_354_359 * (const 64 (2**21)) + s_354_359 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_5,
    f_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_5,
    g_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 359)) <=s delta, delta <=s (const 64 (1 + 2*359)),
    (const 64 (-(2**20))) <=s u_354_359, u_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_359, v_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_359, r_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_359, s_354_359 <=s (const 64 ((2**20))),
    u_354_359 + v_354_359 <=s (const 64 (2**20)),
    u_354_359 - v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 + v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 - v_354_359 <=s (const 64 (2**20)),
    r_354_359 + s_354_359 <=s (const 64 (2**20)),
    r_354_359 - s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 + s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 - s_354_359 <=s (const 64 (2**20)),
    u_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_354_359 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step5

// premise b
assume
g_354_low60_0_low20_5 = 1 (mod 2)
&&
g_354_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_6 f_354_low60_0_low20_5;
mov u_354_360 u_354_359;
mov v_354_360 v_354_359;

add g_354_low60_0_low20_6 g_354_low60_0_low20_5 f_354_low60_0_low20_5;
asr g_354_low60_0_low20_6 g_354_low60_0_low20_6 1;
add r_354_360 r_354_359 u_354_359;
asr r_354_360 r_354_360 1;
add s_354_360 s_354_359 v_354_359;
asr s_354_360 s_354_360 1;
assert
    true
&&
    f_354_low60_0_low20_6 = f_354_low60_0_low20_5,
    u_354_360 = u_354_359,
    v_354_360 = v_354_359,
    g_354_low60_0_low20_6 * (const 64 2) = g_354_low60_0_low20_5 + f_354_low60_0_low20_5,
    r_354_360 * (const 64 2) = r_354_359 + u_354_359,
    s_354_360 * (const 64 2) = s_354_359 + v_354_359
;

assume
    f_354_low60_0_low20_6 = f_354_low60_0_low20_5,
    u_354_360 = u_354_359,
    v_354_360 = v_354_359,
    g_354_low60_0_low20_6 * 2 = g_354_low60_0_low20_5 + f_354_low60_0_low20_5,
    r_354_360 * 2 = r_354_359 + u_354_359,
    s_354_360 * 2 = s_354_359 + v_354_359
&&
    true
;

{
    u_354_360 * f_354_low60_0_low20_0 + v_354_360 * g_354_low60_0_low20_0 = f_354_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_360 * f_354_low60_0_low20_0 + s_354_360 * g_354_low60_0_low20_0 = g_354_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_6 + u_354_360 * (const 64 (2**21)) + v_354_360 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_6 + r_354_360 * (const 64 (2**21)) + s_354_360 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_6,
    f_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_6,
    g_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 360)) <=s delta, delta <=s (const 64 (1 + 2*360)),
    (const 64 (-(2**20))) <=s u_354_360, u_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_360, v_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_360, r_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_360, s_354_360 <=s (const 64 ((2**20))),
    u_354_360 + v_354_360 <=s (const 64 (2**20)),
    u_354_360 - v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 + v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 - v_354_360 <=s (const 64 (2**20)),
    r_354_360 + s_354_360 <=s (const 64 (2**20)),
    r_354_360 - s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 + s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 - s_354_360 <=s (const 64 (2**20)),
    u_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_354_360 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_359_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_5,
sint64 g_354_low60_0_low20_5,
sint64 f_354_low60_0_low20_6,
sint64 g_354_low60_0_low20_6,
sint64 u_354_359,
sint64 v_354_359,
sint64 r_354_359,
sint64 s_354_359,
sint64 u_354_360,
sint64 v_354_360,
sint64 r_354_360,
sint64 s_354_360,
bit ne
)={
    u_354_359 * f_354_low60_0_low20_0 + v_354_359 * g_354_low60_0_low20_0 = f_354_low60_0_low20_5 * (-(2**20)),
    r_354_359 * f_354_low60_0_low20_0 + s_354_359 * g_354_low60_0_low20_0 = g_354_low60_0_low20_5 * (-(2**20))
&&
    u_354_359 * f_354_low60_0_low20_0 + v_354_359 * g_354_low60_0_low20_0 = f_354_low60_0_low20_5 * (const 64 (-(2**20))),
    r_354_359 * f_354_low60_0_low20_0 + s_354_359 * g_354_low60_0_low20_0 = g_354_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_5 + u_354_359 * (const 64 (2**21)) + v_354_359 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_5 + r_354_359 * (const 64 (2**21)) + s_354_359 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_5,
    f_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_5,
    g_354_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 359)) <=s delta, delta <=s (const 64 (1 + 2*359)),
    (const 64 (-(2**20))) <=s u_354_359, u_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_359, v_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_359, r_354_359 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_359, s_354_359 <=s (const 64 ((2**20))),
    u_354_359 + v_354_359 <=s (const 64 (2**20)),
    u_354_359 - v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 + v_354_359 <=s (const 64 (2**20)),
    (const 64 0) - u_354_359 - v_354_359 <=s (const 64 (2**20)),
    r_354_359 + s_354_359 <=s (const 64 (2**20)),
    r_354_359 - s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 + s_354_359 <=s (const 64 (2**20)),
    (const 64 0) - r_354_359 - s_354_359 <=s (const 64 (2**20)),
    u_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_354_359 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_354_359 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step5

// premise c
assume
g_354_low60_0_low20_5 = 1 (mod 2)
&&
g_354_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_6 g_354_low60_0_low20_5;
mov u_354_360 r_354_359;
mov v_354_360 s_354_359;

subs dc g_354_low60_0_low20_6 g_354_low60_0_low20_5 f_354_low60_0_low20_5;
asr g_354_low60_0_low20_6 g_354_low60_0_low20_6 1;
subs dc r_354_360 r_354_359 u_354_359;
asr r_354_360 r_354_360 1;
subs dc s_354_360 s_354_359 v_354_359;
asr s_354_360 s_354_360 1;
assert
    true
&&
    f_354_low60_0_low20_6 = g_354_low60_0_low20_5,
    u_354_360 = r_354_359,
    v_354_360 = s_354_359,
    g_354_low60_0_low20_6 * (const 64 2) = g_354_low60_0_low20_5 - f_354_low60_0_low20_5,
    r_354_360 * (const 64 2) = r_354_359 - u_354_359,
    s_354_360 * (const 64 2) = s_354_359 - v_354_359
;

assume
    f_354_low60_0_low20_6 = g_354_low60_0_low20_5,
    u_354_360 = r_354_359,
    v_354_360 = s_354_359,
    g_354_low60_0_low20_6 * 2 = g_354_low60_0_low20_5 - f_354_low60_0_low20_5,
    r_354_360 * 2 = r_354_359 - u_354_359,
    s_354_360 * 2 = s_354_359 - v_354_359
&&
    true
;

{
    u_354_360 * f_354_low60_0_low20_0 + v_354_360 * g_354_low60_0_low20_0 = f_354_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_360 * f_354_low60_0_low20_0 + s_354_360 * g_354_low60_0_low20_0 = g_354_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_6 + u_354_360 * (const 64 (2**21)) + v_354_360 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_6 + r_354_360 * (const 64 (2**21)) + s_354_360 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_6,
    f_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_6,
    g_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 360)) <=s delta, delta <=s (const 64 (1 + 2*360)),
    (const 64 (-(2**20))) <=s u_354_360, u_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_360, v_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_360, r_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_360, s_354_360 <=s (const 64 ((2**20))),
    u_354_360 + v_354_360 <=s (const 64 (2**20)),
    u_354_360 - v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 + v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 - v_354_360 <=s (const 64 (2**20)),
    r_354_360 + s_354_360 <=s (const 64 (2**20)),
    r_354_360 - s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 + s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 - s_354_360 <=s (const 64 (2**20)),
    u_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_354_360 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_360_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_6,
sint64 g_354_low60_0_low20_6,
sint64 f_354_low60_0_low20_7,
sint64 g_354_low60_0_low20_7,
sint64 u_354_360,
sint64 v_354_360,
sint64 r_354_360,
sint64 s_354_360,
sint64 u_354_361,
sint64 v_354_361,
sint64 r_354_361,
sint64 s_354_361,
bit ne
)={
    u_354_360 * f_354_low60_0_low20_0 + v_354_360 * g_354_low60_0_low20_0 = f_354_low60_0_low20_6 * (-(2**20)),
    r_354_360 * f_354_low60_0_low20_0 + s_354_360 * g_354_low60_0_low20_0 = g_354_low60_0_low20_6 * (-(2**20))
&&
    u_354_360 * f_354_low60_0_low20_0 + v_354_360 * g_354_low60_0_low20_0 = f_354_low60_0_low20_6 * (const 64 (-(2**20))),
    r_354_360 * f_354_low60_0_low20_0 + s_354_360 * g_354_low60_0_low20_0 = g_354_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_6 + u_354_360 * (const 64 (2**21)) + v_354_360 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_6 + r_354_360 * (const 64 (2**21)) + s_354_360 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_6,
    f_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_6,
    g_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 360)) <=s delta, delta <=s (const 64 (1 + 2*360)),
    (const 64 (-(2**20))) <=s u_354_360, u_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_360, v_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_360, r_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_360, s_354_360 <=s (const 64 ((2**20))),
    u_354_360 + v_354_360 <=s (const 64 (2**20)),
    u_354_360 - v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 + v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 - v_354_360 <=s (const 64 (2**20)),
    r_354_360 + s_354_360 <=s (const 64 (2**20)),
    r_354_360 - s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 + s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 - s_354_360 <=s (const 64 (2**20)),
    u_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_354_360 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step6

// premise a
assume
g_354_low60_0_low20_6 = 0 (mod 2)
&&
g_354_low60_0_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_7 f_354_low60_0_low20_6;
mov u_354_361 u_354_360;
mov v_354_361 v_354_360;

asr g_354_low60_0_low20_7 g_354_low60_0_low20_6 1;
asr r_354_361 r_354_360 1;
asr s_354_361 s_354_360 1;
assert
    true
&&
    f_354_low60_0_low20_7 = f_354_low60_0_low20_6,
    u_354_361 = u_354_360,
    v_354_361 = v_354_360,
    g_354_low60_0_low20_7 * (const 64 2) = g_354_low60_0_low20_6,
    r_354_361 * (const 64 2) = r_354_360,
    s_354_361 * (const 64 2) = s_354_360
;

assume
    f_354_low60_0_low20_7 = f_354_low60_0_low20_6,
    u_354_361 = u_354_360,
    v_354_361 = v_354_360,
    g_354_low60_0_low20_7 * 2 = g_354_low60_0_low20_6,
    r_354_361 * 2 = r_354_360,
    s_354_361 * 2 = s_354_360
&&
    true
;

{
    u_354_361 * f_354_low60_0_low20_0 + v_354_361 * g_354_low60_0_low20_0 = f_354_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_361 * f_354_low60_0_low20_0 + s_354_361 * g_354_low60_0_low20_0 = g_354_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_7 + u_354_361 * (const 64 (2**21)) + v_354_361 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_7 + r_354_361 * (const 64 (2**21)) + s_354_361 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_7,
    f_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_7,
    g_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 361)) <=s delta, delta <=s (const 64 (1 + 2*361)),
    (const 64 (-(2**20))) <=s u_354_361, u_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_361, v_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_361, r_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_361, s_354_361 <=s (const 64 ((2**20))),
    u_354_361 + v_354_361 <=s (const 64 (2**20)),
    u_354_361 - v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 + v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 - v_354_361 <=s (const 64 (2**20)),
    r_354_361 + s_354_361 <=s (const 64 (2**20)),
    r_354_361 - s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 + s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 - s_354_361 <=s (const 64 (2**20)),
    u_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_354_361 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_360_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_6,
sint64 g_354_low60_0_low20_6,
sint64 f_354_low60_0_low20_7,
sint64 g_354_low60_0_low20_7,
sint64 u_354_360,
sint64 v_354_360,
sint64 r_354_360,
sint64 s_354_360,
sint64 u_354_361,
sint64 v_354_361,
sint64 r_354_361,
sint64 s_354_361,
bit ne
)={
    u_354_360 * f_354_low60_0_low20_0 + v_354_360 * g_354_low60_0_low20_0 = f_354_low60_0_low20_6 * (-(2**20)),
    r_354_360 * f_354_low60_0_low20_0 + s_354_360 * g_354_low60_0_low20_0 = g_354_low60_0_low20_6 * (-(2**20))
&&
    u_354_360 * f_354_low60_0_low20_0 + v_354_360 * g_354_low60_0_low20_0 = f_354_low60_0_low20_6 * (const 64 (-(2**20))),
    r_354_360 * f_354_low60_0_low20_0 + s_354_360 * g_354_low60_0_low20_0 = g_354_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_6 + u_354_360 * (const 64 (2**21)) + v_354_360 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_6 + r_354_360 * (const 64 (2**21)) + s_354_360 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_6,
    f_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_6,
    g_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 360)) <=s delta, delta <=s (const 64 (1 + 2*360)),
    (const 64 (-(2**20))) <=s u_354_360, u_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_360, v_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_360, r_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_360, s_354_360 <=s (const 64 ((2**20))),
    u_354_360 + v_354_360 <=s (const 64 (2**20)),
    u_354_360 - v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 + v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 - v_354_360 <=s (const 64 (2**20)),
    r_354_360 + s_354_360 <=s (const 64 (2**20)),
    r_354_360 - s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 + s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 - s_354_360 <=s (const 64 (2**20)),
    u_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_354_360 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step6

// premise b
assume
g_354_low60_0_low20_6 = 1 (mod 2)
&&
g_354_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_7 f_354_low60_0_low20_6;
mov u_354_361 u_354_360;
mov v_354_361 v_354_360;

add g_354_low60_0_low20_7 g_354_low60_0_low20_6 f_354_low60_0_low20_6;
asr g_354_low60_0_low20_7 g_354_low60_0_low20_7 1;
add r_354_361 r_354_360 u_354_360;
asr r_354_361 r_354_361 1;
add s_354_361 s_354_360 v_354_360;
asr s_354_361 s_354_361 1;
assert
    true
&&
    f_354_low60_0_low20_7 = f_354_low60_0_low20_6,
    u_354_361 = u_354_360,
    v_354_361 = v_354_360,
    g_354_low60_0_low20_7 * (const 64 2) = g_354_low60_0_low20_6 + f_354_low60_0_low20_6,
    r_354_361 * (const 64 2) = r_354_360 + u_354_360,
    s_354_361 * (const 64 2) = s_354_360 + v_354_360
;

assume
    f_354_low60_0_low20_7 = f_354_low60_0_low20_6,
    u_354_361 = u_354_360,
    v_354_361 = v_354_360,
    g_354_low60_0_low20_7 * 2 = g_354_low60_0_low20_6 + f_354_low60_0_low20_6,
    r_354_361 * 2 = r_354_360 + u_354_360,
    s_354_361 * 2 = s_354_360 + v_354_360
&&
    true
;

{
    u_354_361 * f_354_low60_0_low20_0 + v_354_361 * g_354_low60_0_low20_0 = f_354_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_361 * f_354_low60_0_low20_0 + s_354_361 * g_354_low60_0_low20_0 = g_354_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_7 + u_354_361 * (const 64 (2**21)) + v_354_361 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_7 + r_354_361 * (const 64 (2**21)) + s_354_361 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_7,
    f_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_7,
    g_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 361)) <=s delta, delta <=s (const 64 (1 + 2*361)),
    (const 64 (-(2**20))) <=s u_354_361, u_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_361, v_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_361, r_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_361, s_354_361 <=s (const 64 ((2**20))),
    u_354_361 + v_354_361 <=s (const 64 (2**20)),
    u_354_361 - v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 + v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 - v_354_361 <=s (const 64 (2**20)),
    r_354_361 + s_354_361 <=s (const 64 (2**20)),
    r_354_361 - s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 + s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 - s_354_361 <=s (const 64 (2**20)),
    u_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_354_361 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_360_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_6,
sint64 g_354_low60_0_low20_6,
sint64 f_354_low60_0_low20_7,
sint64 g_354_low60_0_low20_7,
sint64 u_354_360,
sint64 v_354_360,
sint64 r_354_360,
sint64 s_354_360,
sint64 u_354_361,
sint64 v_354_361,
sint64 r_354_361,
sint64 s_354_361,
bit ne
)={
    u_354_360 * f_354_low60_0_low20_0 + v_354_360 * g_354_low60_0_low20_0 = f_354_low60_0_low20_6 * (-(2**20)),
    r_354_360 * f_354_low60_0_low20_0 + s_354_360 * g_354_low60_0_low20_0 = g_354_low60_0_low20_6 * (-(2**20))
&&
    u_354_360 * f_354_low60_0_low20_0 + v_354_360 * g_354_low60_0_low20_0 = f_354_low60_0_low20_6 * (const 64 (-(2**20))),
    r_354_360 * f_354_low60_0_low20_0 + s_354_360 * g_354_low60_0_low20_0 = g_354_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_6 + u_354_360 * (const 64 (2**21)) + v_354_360 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_6 + r_354_360 * (const 64 (2**21)) + s_354_360 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_6,
    f_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_6,
    g_354_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 360)) <=s delta, delta <=s (const 64 (1 + 2*360)),
    (const 64 (-(2**20))) <=s u_354_360, u_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_360, v_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_360, r_354_360 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_360, s_354_360 <=s (const 64 ((2**20))),
    u_354_360 + v_354_360 <=s (const 64 (2**20)),
    u_354_360 - v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 + v_354_360 <=s (const 64 (2**20)),
    (const 64 0) - u_354_360 - v_354_360 <=s (const 64 (2**20)),
    r_354_360 + s_354_360 <=s (const 64 (2**20)),
    r_354_360 - s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 + s_354_360 <=s (const 64 (2**20)),
    (const 64 0) - r_354_360 - s_354_360 <=s (const 64 (2**20)),
    u_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_354_360 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_354_360 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step6

// premise c
assume
g_354_low60_0_low20_6 = 1 (mod 2)
&&
g_354_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_7 g_354_low60_0_low20_6;
mov u_354_361 r_354_360;
mov v_354_361 s_354_360;

subs dc g_354_low60_0_low20_7 g_354_low60_0_low20_6 f_354_low60_0_low20_6;
asr g_354_low60_0_low20_7 g_354_low60_0_low20_7 1;
subs dc r_354_361 r_354_360 u_354_360;
asr r_354_361 r_354_361 1;
subs dc s_354_361 s_354_360 v_354_360;
asr s_354_361 s_354_361 1;
assert
    true
&&
    f_354_low60_0_low20_7 = g_354_low60_0_low20_6,
    u_354_361 = r_354_360,
    v_354_361 = s_354_360,
    g_354_low60_0_low20_7 * (const 64 2) = g_354_low60_0_low20_6 - f_354_low60_0_low20_6,
    r_354_361 * (const 64 2) = r_354_360 - u_354_360,
    s_354_361 * (const 64 2) = s_354_360 - v_354_360
;

assume
    f_354_low60_0_low20_7 = g_354_low60_0_low20_6,
    u_354_361 = r_354_360,
    v_354_361 = s_354_360,
    g_354_low60_0_low20_7 * 2 = g_354_low60_0_low20_6 - f_354_low60_0_low20_6,
    r_354_361 * 2 = r_354_360 - u_354_360,
    s_354_361 * 2 = s_354_360 - v_354_360
&&
    true
;

{
    u_354_361 * f_354_low60_0_low20_0 + v_354_361 * g_354_low60_0_low20_0 = f_354_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_361 * f_354_low60_0_low20_0 + s_354_361 * g_354_low60_0_low20_0 = g_354_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_7 + u_354_361 * (const 64 (2**21)) + v_354_361 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_7 + r_354_361 * (const 64 (2**21)) + s_354_361 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_7,
    f_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_7,
    g_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 361)) <=s delta, delta <=s (const 64 (1 + 2*361)),
    (const 64 (-(2**20))) <=s u_354_361, u_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_361, v_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_361, r_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_361, s_354_361 <=s (const 64 ((2**20))),
    u_354_361 + v_354_361 <=s (const 64 (2**20)),
    u_354_361 - v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 + v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 - v_354_361 <=s (const 64 (2**20)),
    r_354_361 + s_354_361 <=s (const 64 (2**20)),
    r_354_361 - s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 + s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 - s_354_361 <=s (const 64 (2**20)),
    u_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_354_361 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_361_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_7,
sint64 g_354_low60_0_low20_7,
sint64 f_354_low60_0_low20_8,
sint64 g_354_low60_0_low20_8,
sint64 u_354_361,
sint64 v_354_361,
sint64 r_354_361,
sint64 s_354_361,
sint64 u_354_362,
sint64 v_354_362,
sint64 r_354_362,
sint64 s_354_362,
bit ne
)={
    u_354_361 * f_354_low60_0_low20_0 + v_354_361 * g_354_low60_0_low20_0 = f_354_low60_0_low20_7 * (-(2**20)),
    r_354_361 * f_354_low60_0_low20_0 + s_354_361 * g_354_low60_0_low20_0 = g_354_low60_0_low20_7 * (-(2**20))
&&
    u_354_361 * f_354_low60_0_low20_0 + v_354_361 * g_354_low60_0_low20_0 = f_354_low60_0_low20_7 * (const 64 (-(2**20))),
    r_354_361 * f_354_low60_0_low20_0 + s_354_361 * g_354_low60_0_low20_0 = g_354_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_7 + u_354_361 * (const 64 (2**21)) + v_354_361 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_7 + r_354_361 * (const 64 (2**21)) + s_354_361 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_7,
    f_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_7,
    g_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 361)) <=s delta, delta <=s (const 64 (1 + 2*361)),
    (const 64 (-(2**20))) <=s u_354_361, u_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_361, v_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_361, r_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_361, s_354_361 <=s (const 64 ((2**20))),
    u_354_361 + v_354_361 <=s (const 64 (2**20)),
    u_354_361 - v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 + v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 - v_354_361 <=s (const 64 (2**20)),
    r_354_361 + s_354_361 <=s (const 64 (2**20)),
    r_354_361 - s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 + s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 - s_354_361 <=s (const 64 (2**20)),
    u_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_354_361 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step7

// premise a
assume
g_354_low60_0_low20_7 = 0 (mod 2)
&&
g_354_low60_0_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_8 f_354_low60_0_low20_7;
mov u_354_362 u_354_361;
mov v_354_362 v_354_361;

asr g_354_low60_0_low20_8 g_354_low60_0_low20_7 1;
asr r_354_362 r_354_361 1;
asr s_354_362 s_354_361 1;
assert
    true
&&
    f_354_low60_0_low20_8 = f_354_low60_0_low20_7,
    u_354_362 = u_354_361,
    v_354_362 = v_354_361,
    g_354_low60_0_low20_8 * (const 64 2) = g_354_low60_0_low20_7,
    r_354_362 * (const 64 2) = r_354_361,
    s_354_362 * (const 64 2) = s_354_361
;

assume
    f_354_low60_0_low20_8 = f_354_low60_0_low20_7,
    u_354_362 = u_354_361,
    v_354_362 = v_354_361,
    g_354_low60_0_low20_8 * 2 = g_354_low60_0_low20_7,
    r_354_362 * 2 = r_354_361,
    s_354_362 * 2 = s_354_361
&&
    true
;

{
    u_354_362 * f_354_low60_0_low20_0 + v_354_362 * g_354_low60_0_low20_0 = f_354_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_362 * f_354_low60_0_low20_0 + s_354_362 * g_354_low60_0_low20_0 = g_354_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_8 + u_354_362 * (const 64 (2**21)) + v_354_362 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_8 + r_354_362 * (const 64 (2**21)) + s_354_362 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_8,
    f_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_8,
    g_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 362)) <=s delta, delta <=s (const 64 (1 + 2*362)),
    (const 64 (-(2**20))) <=s u_354_362, u_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_362, v_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_362, r_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_362, s_354_362 <=s (const 64 ((2**20))),
    u_354_362 + v_354_362 <=s (const 64 (2**20)),
    u_354_362 - v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 + v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 - v_354_362 <=s (const 64 (2**20)),
    r_354_362 + s_354_362 <=s (const 64 (2**20)),
    r_354_362 - s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 + s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 - s_354_362 <=s (const 64 (2**20)),
    u_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_354_362 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_361_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_7,
sint64 g_354_low60_0_low20_7,
sint64 f_354_low60_0_low20_8,
sint64 g_354_low60_0_low20_8,
sint64 u_354_361,
sint64 v_354_361,
sint64 r_354_361,
sint64 s_354_361,
sint64 u_354_362,
sint64 v_354_362,
sint64 r_354_362,
sint64 s_354_362,
bit ne
)={
    u_354_361 * f_354_low60_0_low20_0 + v_354_361 * g_354_low60_0_low20_0 = f_354_low60_0_low20_7 * (-(2**20)),
    r_354_361 * f_354_low60_0_low20_0 + s_354_361 * g_354_low60_0_low20_0 = g_354_low60_0_low20_7 * (-(2**20))
&&
    u_354_361 * f_354_low60_0_low20_0 + v_354_361 * g_354_low60_0_low20_0 = f_354_low60_0_low20_7 * (const 64 (-(2**20))),
    r_354_361 * f_354_low60_0_low20_0 + s_354_361 * g_354_low60_0_low20_0 = g_354_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_7 + u_354_361 * (const 64 (2**21)) + v_354_361 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_7 + r_354_361 * (const 64 (2**21)) + s_354_361 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_7,
    f_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_7,
    g_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 361)) <=s delta, delta <=s (const 64 (1 + 2*361)),
    (const 64 (-(2**20))) <=s u_354_361, u_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_361, v_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_361, r_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_361, s_354_361 <=s (const 64 ((2**20))),
    u_354_361 + v_354_361 <=s (const 64 (2**20)),
    u_354_361 - v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 + v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 - v_354_361 <=s (const 64 (2**20)),
    r_354_361 + s_354_361 <=s (const 64 (2**20)),
    r_354_361 - s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 + s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 - s_354_361 <=s (const 64 (2**20)),
    u_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_354_361 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step7

// premise b
assume
g_354_low60_0_low20_7 = 1 (mod 2)
&&
g_354_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_8 f_354_low60_0_low20_7;
mov u_354_362 u_354_361;
mov v_354_362 v_354_361;

add g_354_low60_0_low20_8 g_354_low60_0_low20_7 f_354_low60_0_low20_7;
asr g_354_low60_0_low20_8 g_354_low60_0_low20_8 1;
add r_354_362 r_354_361 u_354_361;
asr r_354_362 r_354_362 1;
add s_354_362 s_354_361 v_354_361;
asr s_354_362 s_354_362 1;
assert
    true
&&
    f_354_low60_0_low20_8 = f_354_low60_0_low20_7,
    u_354_362 = u_354_361,
    v_354_362 = v_354_361,
    g_354_low60_0_low20_8 * (const 64 2) = g_354_low60_0_low20_7 + f_354_low60_0_low20_7,
    r_354_362 * (const 64 2) = r_354_361 + u_354_361,
    s_354_362 * (const 64 2) = s_354_361 + v_354_361
;

assume
    f_354_low60_0_low20_8 = f_354_low60_0_low20_7,
    u_354_362 = u_354_361,
    v_354_362 = v_354_361,
    g_354_low60_0_low20_8 * 2 = g_354_low60_0_low20_7 + f_354_low60_0_low20_7,
    r_354_362 * 2 = r_354_361 + u_354_361,
    s_354_362 * 2 = s_354_361 + v_354_361
&&
    true
;

{
    u_354_362 * f_354_low60_0_low20_0 + v_354_362 * g_354_low60_0_low20_0 = f_354_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_362 * f_354_low60_0_low20_0 + s_354_362 * g_354_low60_0_low20_0 = g_354_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_8 + u_354_362 * (const 64 (2**21)) + v_354_362 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_8 + r_354_362 * (const 64 (2**21)) + s_354_362 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_8,
    f_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_8,
    g_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 362)) <=s delta, delta <=s (const 64 (1 + 2*362)),
    (const 64 (-(2**20))) <=s u_354_362, u_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_362, v_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_362, r_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_362, s_354_362 <=s (const 64 ((2**20))),
    u_354_362 + v_354_362 <=s (const 64 (2**20)),
    u_354_362 - v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 + v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 - v_354_362 <=s (const 64 (2**20)),
    r_354_362 + s_354_362 <=s (const 64 (2**20)),
    r_354_362 - s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 + s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 - s_354_362 <=s (const 64 (2**20)),
    u_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_354_362 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_361_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_7,
sint64 g_354_low60_0_low20_7,
sint64 f_354_low60_0_low20_8,
sint64 g_354_low60_0_low20_8,
sint64 u_354_361,
sint64 v_354_361,
sint64 r_354_361,
sint64 s_354_361,
sint64 u_354_362,
sint64 v_354_362,
sint64 r_354_362,
sint64 s_354_362,
bit ne
)={
    u_354_361 * f_354_low60_0_low20_0 + v_354_361 * g_354_low60_0_low20_0 = f_354_low60_0_low20_7 * (-(2**20)),
    r_354_361 * f_354_low60_0_low20_0 + s_354_361 * g_354_low60_0_low20_0 = g_354_low60_0_low20_7 * (-(2**20))
&&
    u_354_361 * f_354_low60_0_low20_0 + v_354_361 * g_354_low60_0_low20_0 = f_354_low60_0_low20_7 * (const 64 (-(2**20))),
    r_354_361 * f_354_low60_0_low20_0 + s_354_361 * g_354_low60_0_low20_0 = g_354_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_7 + u_354_361 * (const 64 (2**21)) + v_354_361 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_7 + r_354_361 * (const 64 (2**21)) + s_354_361 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_7,
    f_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_7,
    g_354_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 361)) <=s delta, delta <=s (const 64 (1 + 2*361)),
    (const 64 (-(2**20))) <=s u_354_361, u_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_361, v_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_361, r_354_361 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_361, s_354_361 <=s (const 64 ((2**20))),
    u_354_361 + v_354_361 <=s (const 64 (2**20)),
    u_354_361 - v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 + v_354_361 <=s (const 64 (2**20)),
    (const 64 0) - u_354_361 - v_354_361 <=s (const 64 (2**20)),
    r_354_361 + s_354_361 <=s (const 64 (2**20)),
    r_354_361 - s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 + s_354_361 <=s (const 64 (2**20)),
    (const 64 0) - r_354_361 - s_354_361 <=s (const 64 (2**20)),
    u_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_354_361 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_354_361 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step7

// premise c
assume
g_354_low60_0_low20_7 = 1 (mod 2)
&&
g_354_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_8 g_354_low60_0_low20_7;
mov u_354_362 r_354_361;
mov v_354_362 s_354_361;

subs dc g_354_low60_0_low20_8 g_354_low60_0_low20_7 f_354_low60_0_low20_7;
asr g_354_low60_0_low20_8 g_354_low60_0_low20_8 1;
subs dc r_354_362 r_354_361 u_354_361;
asr r_354_362 r_354_362 1;
subs dc s_354_362 s_354_361 v_354_361;
asr s_354_362 s_354_362 1;
assert
    true
&&
    f_354_low60_0_low20_8 = g_354_low60_0_low20_7,
    u_354_362 = r_354_361,
    v_354_362 = s_354_361,
    g_354_low60_0_low20_8 * (const 64 2) = g_354_low60_0_low20_7 - f_354_low60_0_low20_7,
    r_354_362 * (const 64 2) = r_354_361 - u_354_361,
    s_354_362 * (const 64 2) = s_354_361 - v_354_361
;

assume
    f_354_low60_0_low20_8 = g_354_low60_0_low20_7,
    u_354_362 = r_354_361,
    v_354_362 = s_354_361,
    g_354_low60_0_low20_8 * 2 = g_354_low60_0_low20_7 - f_354_low60_0_low20_7,
    r_354_362 * 2 = r_354_361 - u_354_361,
    s_354_362 * 2 = s_354_361 - v_354_361
&&
    true
;

{
    u_354_362 * f_354_low60_0_low20_0 + v_354_362 * g_354_low60_0_low20_0 = f_354_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_362 * f_354_low60_0_low20_0 + s_354_362 * g_354_low60_0_low20_0 = g_354_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_8 + u_354_362 * (const 64 (2**21)) + v_354_362 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_8 + r_354_362 * (const 64 (2**21)) + s_354_362 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_8,
    f_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_8,
    g_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 362)) <=s delta, delta <=s (const 64 (1 + 2*362)),
    (const 64 (-(2**20))) <=s u_354_362, u_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_362, v_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_362, r_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_362, s_354_362 <=s (const 64 ((2**20))),
    u_354_362 + v_354_362 <=s (const 64 (2**20)),
    u_354_362 - v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 + v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 - v_354_362 <=s (const 64 (2**20)),
    r_354_362 + s_354_362 <=s (const 64 (2**20)),
    r_354_362 - s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 + s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 - s_354_362 <=s (const 64 (2**20)),
    u_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_354_362 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_362_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_8,
sint64 g_354_low60_0_low20_8,
sint64 f_354_low60_0_low20_9,
sint64 g_354_low60_0_low20_9,
sint64 u_354_362,
sint64 v_354_362,
sint64 r_354_362,
sint64 s_354_362,
sint64 u_354_363,
sint64 v_354_363,
sint64 r_354_363,
sint64 s_354_363,
bit ne
)={
    u_354_362 * f_354_low60_0_low20_0 + v_354_362 * g_354_low60_0_low20_0 = f_354_low60_0_low20_8 * (-(2**20)),
    r_354_362 * f_354_low60_0_low20_0 + s_354_362 * g_354_low60_0_low20_0 = g_354_low60_0_low20_8 * (-(2**20))
&&
    u_354_362 * f_354_low60_0_low20_0 + v_354_362 * g_354_low60_0_low20_0 = f_354_low60_0_low20_8 * (const 64 (-(2**20))),
    r_354_362 * f_354_low60_0_low20_0 + s_354_362 * g_354_low60_0_low20_0 = g_354_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_8 + u_354_362 * (const 64 (2**21)) + v_354_362 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_8 + r_354_362 * (const 64 (2**21)) + s_354_362 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_8,
    f_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_8,
    g_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 362)) <=s delta, delta <=s (const 64 (1 + 2*362)),
    (const 64 (-(2**20))) <=s u_354_362, u_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_362, v_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_362, r_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_362, s_354_362 <=s (const 64 ((2**20))),
    u_354_362 + v_354_362 <=s (const 64 (2**20)),
    u_354_362 - v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 + v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 - v_354_362 <=s (const 64 (2**20)),
    r_354_362 + s_354_362 <=s (const 64 (2**20)),
    r_354_362 - s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 + s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 - s_354_362 <=s (const 64 (2**20)),
    u_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_354_362 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step8

// premise a
assume
g_354_low60_0_low20_8 = 0 (mod 2)
&&
g_354_low60_0_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_9 f_354_low60_0_low20_8;
mov u_354_363 u_354_362;
mov v_354_363 v_354_362;

asr g_354_low60_0_low20_9 g_354_low60_0_low20_8 1;
asr r_354_363 r_354_362 1;
asr s_354_363 s_354_362 1;
assert
    true
&&
    f_354_low60_0_low20_9 = f_354_low60_0_low20_8,
    u_354_363 = u_354_362,
    v_354_363 = v_354_362,
    g_354_low60_0_low20_9 * (const 64 2) = g_354_low60_0_low20_8,
    r_354_363 * (const 64 2) = r_354_362,
    s_354_363 * (const 64 2) = s_354_362
;

assume
    f_354_low60_0_low20_9 = f_354_low60_0_low20_8,
    u_354_363 = u_354_362,
    v_354_363 = v_354_362,
    g_354_low60_0_low20_9 * 2 = g_354_low60_0_low20_8,
    r_354_363 * 2 = r_354_362,
    s_354_363 * 2 = s_354_362
&&
    true
;

{
    u_354_363 * f_354_low60_0_low20_0 + v_354_363 * g_354_low60_0_low20_0 = f_354_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_363 * f_354_low60_0_low20_0 + s_354_363 * g_354_low60_0_low20_0 = g_354_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_9 + u_354_363 * (const 64 (2**21)) + v_354_363 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_9 + r_354_363 * (const 64 (2**21)) + s_354_363 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_9,
    f_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_9,
    g_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 363)) <=s delta, delta <=s (const 64 (1 + 2*363)),
    (const 64 (-(2**20))) <=s u_354_363, u_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_363, v_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_363, r_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_363, s_354_363 <=s (const 64 ((2**20))),
    u_354_363 + v_354_363 <=s (const 64 (2**20)),
    u_354_363 - v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 + v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 - v_354_363 <=s (const 64 (2**20)),
    r_354_363 + s_354_363 <=s (const 64 (2**20)),
    r_354_363 - s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 + s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 - s_354_363 <=s (const 64 (2**20)),
    u_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_354_363 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_362_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_8,
sint64 g_354_low60_0_low20_8,
sint64 f_354_low60_0_low20_9,
sint64 g_354_low60_0_low20_9,
sint64 u_354_362,
sint64 v_354_362,
sint64 r_354_362,
sint64 s_354_362,
sint64 u_354_363,
sint64 v_354_363,
sint64 r_354_363,
sint64 s_354_363,
bit ne
)={
    u_354_362 * f_354_low60_0_low20_0 + v_354_362 * g_354_low60_0_low20_0 = f_354_low60_0_low20_8 * (-(2**20)),
    r_354_362 * f_354_low60_0_low20_0 + s_354_362 * g_354_low60_0_low20_0 = g_354_low60_0_low20_8 * (-(2**20))
&&
    u_354_362 * f_354_low60_0_low20_0 + v_354_362 * g_354_low60_0_low20_0 = f_354_low60_0_low20_8 * (const 64 (-(2**20))),
    r_354_362 * f_354_low60_0_low20_0 + s_354_362 * g_354_low60_0_low20_0 = g_354_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_8 + u_354_362 * (const 64 (2**21)) + v_354_362 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_8 + r_354_362 * (const 64 (2**21)) + s_354_362 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_8,
    f_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_8,
    g_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 362)) <=s delta, delta <=s (const 64 (1 + 2*362)),
    (const 64 (-(2**20))) <=s u_354_362, u_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_362, v_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_362, r_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_362, s_354_362 <=s (const 64 ((2**20))),
    u_354_362 + v_354_362 <=s (const 64 (2**20)),
    u_354_362 - v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 + v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 - v_354_362 <=s (const 64 (2**20)),
    r_354_362 + s_354_362 <=s (const 64 (2**20)),
    r_354_362 - s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 + s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 - s_354_362 <=s (const 64 (2**20)),
    u_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_354_362 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step8

// premise b
assume
g_354_low60_0_low20_8 = 1 (mod 2)
&&
g_354_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_9 f_354_low60_0_low20_8;
mov u_354_363 u_354_362;
mov v_354_363 v_354_362;

add g_354_low60_0_low20_9 g_354_low60_0_low20_8 f_354_low60_0_low20_8;
asr g_354_low60_0_low20_9 g_354_low60_0_low20_9 1;
add r_354_363 r_354_362 u_354_362;
asr r_354_363 r_354_363 1;
add s_354_363 s_354_362 v_354_362;
asr s_354_363 s_354_363 1;
assert
    true
&&
    f_354_low60_0_low20_9 = f_354_low60_0_low20_8,
    u_354_363 = u_354_362,
    v_354_363 = v_354_362,
    g_354_low60_0_low20_9 * (const 64 2) = g_354_low60_0_low20_8 + f_354_low60_0_low20_8,
    r_354_363 * (const 64 2) = r_354_362 + u_354_362,
    s_354_363 * (const 64 2) = s_354_362 + v_354_362
;

assume
    f_354_low60_0_low20_9 = f_354_low60_0_low20_8,
    u_354_363 = u_354_362,
    v_354_363 = v_354_362,
    g_354_low60_0_low20_9 * 2 = g_354_low60_0_low20_8 + f_354_low60_0_low20_8,
    r_354_363 * 2 = r_354_362 + u_354_362,
    s_354_363 * 2 = s_354_362 + v_354_362
&&
    true
;

{
    u_354_363 * f_354_low60_0_low20_0 + v_354_363 * g_354_low60_0_low20_0 = f_354_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_363 * f_354_low60_0_low20_0 + s_354_363 * g_354_low60_0_low20_0 = g_354_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_9 + u_354_363 * (const 64 (2**21)) + v_354_363 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_9 + r_354_363 * (const 64 (2**21)) + s_354_363 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_9,
    f_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_9,
    g_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 363)) <=s delta, delta <=s (const 64 (1 + 2*363)),
    (const 64 (-(2**20))) <=s u_354_363, u_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_363, v_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_363, r_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_363, s_354_363 <=s (const 64 ((2**20))),
    u_354_363 + v_354_363 <=s (const 64 (2**20)),
    u_354_363 - v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 + v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 - v_354_363 <=s (const 64 (2**20)),
    r_354_363 + s_354_363 <=s (const 64 (2**20)),
    r_354_363 - s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 + s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 - s_354_363 <=s (const 64 (2**20)),
    u_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_354_363 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_362_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_8,
sint64 g_354_low60_0_low20_8,
sint64 f_354_low60_0_low20_9,
sint64 g_354_low60_0_low20_9,
sint64 u_354_362,
sint64 v_354_362,
sint64 r_354_362,
sint64 s_354_362,
sint64 u_354_363,
sint64 v_354_363,
sint64 r_354_363,
sint64 s_354_363,
bit ne
)={
    u_354_362 * f_354_low60_0_low20_0 + v_354_362 * g_354_low60_0_low20_0 = f_354_low60_0_low20_8 * (-(2**20)),
    r_354_362 * f_354_low60_0_low20_0 + s_354_362 * g_354_low60_0_low20_0 = g_354_low60_0_low20_8 * (-(2**20))
&&
    u_354_362 * f_354_low60_0_low20_0 + v_354_362 * g_354_low60_0_low20_0 = f_354_low60_0_low20_8 * (const 64 (-(2**20))),
    r_354_362 * f_354_low60_0_low20_0 + s_354_362 * g_354_low60_0_low20_0 = g_354_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_8 + u_354_362 * (const 64 (2**21)) + v_354_362 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_8 + r_354_362 * (const 64 (2**21)) + s_354_362 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_8,
    f_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_8,
    g_354_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 362)) <=s delta, delta <=s (const 64 (1 + 2*362)),
    (const 64 (-(2**20))) <=s u_354_362, u_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_362, v_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_362, r_354_362 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_362, s_354_362 <=s (const 64 ((2**20))),
    u_354_362 + v_354_362 <=s (const 64 (2**20)),
    u_354_362 - v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 + v_354_362 <=s (const 64 (2**20)),
    (const 64 0) - u_354_362 - v_354_362 <=s (const 64 (2**20)),
    r_354_362 + s_354_362 <=s (const 64 (2**20)),
    r_354_362 - s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 + s_354_362 <=s (const 64 (2**20)),
    (const 64 0) - r_354_362 - s_354_362 <=s (const 64 (2**20)),
    u_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_354_362 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_354_362 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step8

// premise c
assume
g_354_low60_0_low20_8 = 1 (mod 2)
&&
g_354_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_9 g_354_low60_0_low20_8;
mov u_354_363 r_354_362;
mov v_354_363 s_354_362;

subs dc g_354_low60_0_low20_9 g_354_low60_0_low20_8 f_354_low60_0_low20_8;
asr g_354_low60_0_low20_9 g_354_low60_0_low20_9 1;
subs dc r_354_363 r_354_362 u_354_362;
asr r_354_363 r_354_363 1;
subs dc s_354_363 s_354_362 v_354_362;
asr s_354_363 s_354_363 1;
assert
    true
&&
    f_354_low60_0_low20_9 = g_354_low60_0_low20_8,
    u_354_363 = r_354_362,
    v_354_363 = s_354_362,
    g_354_low60_0_low20_9 * (const 64 2) = g_354_low60_0_low20_8 - f_354_low60_0_low20_8,
    r_354_363 * (const 64 2) = r_354_362 - u_354_362,
    s_354_363 * (const 64 2) = s_354_362 - v_354_362
;

assume
    f_354_low60_0_low20_9 = g_354_low60_0_low20_8,
    u_354_363 = r_354_362,
    v_354_363 = s_354_362,
    g_354_low60_0_low20_9 * 2 = g_354_low60_0_low20_8 - f_354_low60_0_low20_8,
    r_354_363 * 2 = r_354_362 - u_354_362,
    s_354_363 * 2 = s_354_362 - v_354_362
&&
    true
;

{
    u_354_363 * f_354_low60_0_low20_0 + v_354_363 * g_354_low60_0_low20_0 = f_354_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_363 * f_354_low60_0_low20_0 + s_354_363 * g_354_low60_0_low20_0 = g_354_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_9 + u_354_363 * (const 64 (2**21)) + v_354_363 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_9 + r_354_363 * (const 64 (2**21)) + s_354_363 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_9,
    f_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_9,
    g_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 363)) <=s delta, delta <=s (const 64 (1 + 2*363)),
    (const 64 (-(2**20))) <=s u_354_363, u_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_363, v_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_363, r_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_363, s_354_363 <=s (const 64 ((2**20))),
    u_354_363 + v_354_363 <=s (const 64 (2**20)),
    u_354_363 - v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 + v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 - v_354_363 <=s (const 64 (2**20)),
    r_354_363 + s_354_363 <=s (const 64 (2**20)),
    r_354_363 - s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 + s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 - s_354_363 <=s (const 64 (2**20)),
    u_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_354_363 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_363_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_9,
sint64 g_354_low60_0_low20_9,
sint64 f_354_low60_0_low20_10,
sint64 g_354_low60_0_low20_10,
sint64 u_354_363,
sint64 v_354_363,
sint64 r_354_363,
sint64 s_354_363,
sint64 u_354_364,
sint64 v_354_364,
sint64 r_354_364,
sint64 s_354_364,
bit ne
)={
    u_354_363 * f_354_low60_0_low20_0 + v_354_363 * g_354_low60_0_low20_0 = f_354_low60_0_low20_9 * (-(2**20)),
    r_354_363 * f_354_low60_0_low20_0 + s_354_363 * g_354_low60_0_low20_0 = g_354_low60_0_low20_9 * (-(2**20))
&&
    u_354_363 * f_354_low60_0_low20_0 + v_354_363 * g_354_low60_0_low20_0 = f_354_low60_0_low20_9 * (const 64 (-(2**20))),
    r_354_363 * f_354_low60_0_low20_0 + s_354_363 * g_354_low60_0_low20_0 = g_354_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_9 + u_354_363 * (const 64 (2**21)) + v_354_363 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_9 + r_354_363 * (const 64 (2**21)) + s_354_363 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_9,
    f_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_9,
    g_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 363)) <=s delta, delta <=s (const 64 (1 + 2*363)),
    (const 64 (-(2**20))) <=s u_354_363, u_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_363, v_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_363, r_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_363, s_354_363 <=s (const 64 ((2**20))),
    u_354_363 + v_354_363 <=s (const 64 (2**20)),
    u_354_363 - v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 + v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 - v_354_363 <=s (const 64 (2**20)),
    r_354_363 + s_354_363 <=s (const 64 (2**20)),
    r_354_363 - s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 + s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 - s_354_363 <=s (const 64 (2**20)),
    u_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_354_363 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step9

// premise a
assume
g_354_low60_0_low20_9 = 0 (mod 2)
&&
g_354_low60_0_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_10 f_354_low60_0_low20_9;
mov u_354_364 u_354_363;
mov v_354_364 v_354_363;

asr g_354_low60_0_low20_10 g_354_low60_0_low20_9 1;
asr r_354_364 r_354_363 1;
asr s_354_364 s_354_363 1;
assert
    true
&&
    f_354_low60_0_low20_10 = f_354_low60_0_low20_9,
    u_354_364 = u_354_363,
    v_354_364 = v_354_363,
    g_354_low60_0_low20_10 * (const 64 2) = g_354_low60_0_low20_9,
    r_354_364 * (const 64 2) = r_354_363,
    s_354_364 * (const 64 2) = s_354_363
;

assume
    f_354_low60_0_low20_10 = f_354_low60_0_low20_9,
    u_354_364 = u_354_363,
    v_354_364 = v_354_363,
    g_354_low60_0_low20_10 * 2 = g_354_low60_0_low20_9,
    r_354_364 * 2 = r_354_363,
    s_354_364 * 2 = s_354_363
&&
    true
;

{
    u_354_364 * f_354_low60_0_low20_0 + v_354_364 * g_354_low60_0_low20_0 = f_354_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_364 * f_354_low60_0_low20_0 + s_354_364 * g_354_low60_0_low20_0 = g_354_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_10 + u_354_364 * (const 64 (2**21)) + v_354_364 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_10 + r_354_364 * (const 64 (2**21)) + s_354_364 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_10,
    f_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_10,
    g_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 364)) <=s delta, delta <=s (const 64 (1 + 2*364)),
    (const 64 (-(2**20))) <=s u_354_364, u_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_364, v_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_364, r_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_364, s_354_364 <=s (const 64 ((2**20))),
    u_354_364 + v_354_364 <=s (const 64 (2**20)),
    u_354_364 - v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 + v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 - v_354_364 <=s (const 64 (2**20)),
    r_354_364 + s_354_364 <=s (const 64 (2**20)),
    r_354_364 - s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 + s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 - s_354_364 <=s (const 64 (2**20)),
    u_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_354_364 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_363_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_9,
sint64 g_354_low60_0_low20_9,
sint64 f_354_low60_0_low20_10,
sint64 g_354_low60_0_low20_10,
sint64 u_354_363,
sint64 v_354_363,
sint64 r_354_363,
sint64 s_354_363,
sint64 u_354_364,
sint64 v_354_364,
sint64 r_354_364,
sint64 s_354_364,
bit ne
)={
    u_354_363 * f_354_low60_0_low20_0 + v_354_363 * g_354_low60_0_low20_0 = f_354_low60_0_low20_9 * (-(2**20)),
    r_354_363 * f_354_low60_0_low20_0 + s_354_363 * g_354_low60_0_low20_0 = g_354_low60_0_low20_9 * (-(2**20))
&&
    u_354_363 * f_354_low60_0_low20_0 + v_354_363 * g_354_low60_0_low20_0 = f_354_low60_0_low20_9 * (const 64 (-(2**20))),
    r_354_363 * f_354_low60_0_low20_0 + s_354_363 * g_354_low60_0_low20_0 = g_354_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_9 + u_354_363 * (const 64 (2**21)) + v_354_363 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_9 + r_354_363 * (const 64 (2**21)) + s_354_363 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_9,
    f_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_9,
    g_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 363)) <=s delta, delta <=s (const 64 (1 + 2*363)),
    (const 64 (-(2**20))) <=s u_354_363, u_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_363, v_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_363, r_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_363, s_354_363 <=s (const 64 ((2**20))),
    u_354_363 + v_354_363 <=s (const 64 (2**20)),
    u_354_363 - v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 + v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 - v_354_363 <=s (const 64 (2**20)),
    r_354_363 + s_354_363 <=s (const 64 (2**20)),
    r_354_363 - s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 + s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 - s_354_363 <=s (const 64 (2**20)),
    u_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_354_363 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step9

// premise b
assume
g_354_low60_0_low20_9 = 1 (mod 2)
&&
g_354_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_10 f_354_low60_0_low20_9;
mov u_354_364 u_354_363;
mov v_354_364 v_354_363;

add g_354_low60_0_low20_10 g_354_low60_0_low20_9 f_354_low60_0_low20_9;
asr g_354_low60_0_low20_10 g_354_low60_0_low20_10 1;
add r_354_364 r_354_363 u_354_363;
asr r_354_364 r_354_364 1;
add s_354_364 s_354_363 v_354_363;
asr s_354_364 s_354_364 1;
assert
    true
&&
    f_354_low60_0_low20_10 = f_354_low60_0_low20_9,
    u_354_364 = u_354_363,
    v_354_364 = v_354_363,
    g_354_low60_0_low20_10 * (const 64 2) = g_354_low60_0_low20_9 + f_354_low60_0_low20_9,
    r_354_364 * (const 64 2) = r_354_363 + u_354_363,
    s_354_364 * (const 64 2) = s_354_363 + v_354_363
;

assume
    f_354_low60_0_low20_10 = f_354_low60_0_low20_9,
    u_354_364 = u_354_363,
    v_354_364 = v_354_363,
    g_354_low60_0_low20_10 * 2 = g_354_low60_0_low20_9 + f_354_low60_0_low20_9,
    r_354_364 * 2 = r_354_363 + u_354_363,
    s_354_364 * 2 = s_354_363 + v_354_363
&&
    true
;

{
    u_354_364 * f_354_low60_0_low20_0 + v_354_364 * g_354_low60_0_low20_0 = f_354_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_364 * f_354_low60_0_low20_0 + s_354_364 * g_354_low60_0_low20_0 = g_354_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_10 + u_354_364 * (const 64 (2**21)) + v_354_364 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_10 + r_354_364 * (const 64 (2**21)) + s_354_364 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_10,
    f_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_10,
    g_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 364)) <=s delta, delta <=s (const 64 (1 + 2*364)),
    (const 64 (-(2**20))) <=s u_354_364, u_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_364, v_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_364, r_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_364, s_354_364 <=s (const 64 ((2**20))),
    u_354_364 + v_354_364 <=s (const 64 (2**20)),
    u_354_364 - v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 + v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 - v_354_364 <=s (const 64 (2**20)),
    r_354_364 + s_354_364 <=s (const 64 (2**20)),
    r_354_364 - s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 + s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 - s_354_364 <=s (const 64 (2**20)),
    u_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_354_364 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_363_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_9,
sint64 g_354_low60_0_low20_9,
sint64 f_354_low60_0_low20_10,
sint64 g_354_low60_0_low20_10,
sint64 u_354_363,
sint64 v_354_363,
sint64 r_354_363,
sint64 s_354_363,
sint64 u_354_364,
sint64 v_354_364,
sint64 r_354_364,
sint64 s_354_364,
bit ne
)={
    u_354_363 * f_354_low60_0_low20_0 + v_354_363 * g_354_low60_0_low20_0 = f_354_low60_0_low20_9 * (-(2**20)),
    r_354_363 * f_354_low60_0_low20_0 + s_354_363 * g_354_low60_0_low20_0 = g_354_low60_0_low20_9 * (-(2**20))
&&
    u_354_363 * f_354_low60_0_low20_0 + v_354_363 * g_354_low60_0_low20_0 = f_354_low60_0_low20_9 * (const 64 (-(2**20))),
    r_354_363 * f_354_low60_0_low20_0 + s_354_363 * g_354_low60_0_low20_0 = g_354_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_9 + u_354_363 * (const 64 (2**21)) + v_354_363 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_9 + r_354_363 * (const 64 (2**21)) + s_354_363 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_9,
    f_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_9,
    g_354_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 363)) <=s delta, delta <=s (const 64 (1 + 2*363)),
    (const 64 (-(2**20))) <=s u_354_363, u_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_363, v_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_363, r_354_363 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_363, s_354_363 <=s (const 64 ((2**20))),
    u_354_363 + v_354_363 <=s (const 64 (2**20)),
    u_354_363 - v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 + v_354_363 <=s (const 64 (2**20)),
    (const 64 0) - u_354_363 - v_354_363 <=s (const 64 (2**20)),
    r_354_363 + s_354_363 <=s (const 64 (2**20)),
    r_354_363 - s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 + s_354_363 <=s (const 64 (2**20)),
    (const 64 0) - r_354_363 - s_354_363 <=s (const 64 (2**20)),
    u_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_354_363 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_354_363 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step9

// premise c
assume
g_354_low60_0_low20_9 = 1 (mod 2)
&&
g_354_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_10 g_354_low60_0_low20_9;
mov u_354_364 r_354_363;
mov v_354_364 s_354_363;

subs dc g_354_low60_0_low20_10 g_354_low60_0_low20_9 f_354_low60_0_low20_9;
asr g_354_low60_0_low20_10 g_354_low60_0_low20_10 1;
subs dc r_354_364 r_354_363 u_354_363;
asr r_354_364 r_354_364 1;
subs dc s_354_364 s_354_363 v_354_363;
asr s_354_364 s_354_364 1;
assert
    true
&&
    f_354_low60_0_low20_10 = g_354_low60_0_low20_9,
    u_354_364 = r_354_363,
    v_354_364 = s_354_363,
    g_354_low60_0_low20_10 * (const 64 2) = g_354_low60_0_low20_9 - f_354_low60_0_low20_9,
    r_354_364 * (const 64 2) = r_354_363 - u_354_363,
    s_354_364 * (const 64 2) = s_354_363 - v_354_363
;

assume
    f_354_low60_0_low20_10 = g_354_low60_0_low20_9,
    u_354_364 = r_354_363,
    v_354_364 = s_354_363,
    g_354_low60_0_low20_10 * 2 = g_354_low60_0_low20_9 - f_354_low60_0_low20_9,
    r_354_364 * 2 = r_354_363 - u_354_363,
    s_354_364 * 2 = s_354_363 - v_354_363
&&
    true
;

{
    u_354_364 * f_354_low60_0_low20_0 + v_354_364 * g_354_low60_0_low20_0 = f_354_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_364 * f_354_low60_0_low20_0 + s_354_364 * g_354_low60_0_low20_0 = g_354_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_10 + u_354_364 * (const 64 (2**21)) + v_354_364 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_10 + r_354_364 * (const 64 (2**21)) + s_354_364 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_10,
    f_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_10,
    g_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 364)) <=s delta, delta <=s (const 64 (1 + 2*364)),
    (const 64 (-(2**20))) <=s u_354_364, u_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_364, v_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_364, r_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_364, s_354_364 <=s (const 64 ((2**20))),
    u_354_364 + v_354_364 <=s (const 64 (2**20)),
    u_354_364 - v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 + v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 - v_354_364 <=s (const 64 (2**20)),
    r_354_364 + s_354_364 <=s (const 64 (2**20)),
    r_354_364 - s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 + s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 - s_354_364 <=s (const 64 (2**20)),
    u_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_354_364 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_364_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_10,
sint64 g_354_low60_0_low20_10,
sint64 f_354_low60_0_low20_11,
sint64 g_354_low60_0_low20_11,
sint64 u_354_364,
sint64 v_354_364,
sint64 r_354_364,
sint64 s_354_364,
sint64 u_354_365,
sint64 v_354_365,
sint64 r_354_365,
sint64 s_354_365,
bit ne
)={
    u_354_364 * f_354_low60_0_low20_0 + v_354_364 * g_354_low60_0_low20_0 = f_354_low60_0_low20_10 * (-(2**20)),
    r_354_364 * f_354_low60_0_low20_0 + s_354_364 * g_354_low60_0_low20_0 = g_354_low60_0_low20_10 * (-(2**20))
&&
    u_354_364 * f_354_low60_0_low20_0 + v_354_364 * g_354_low60_0_low20_0 = f_354_low60_0_low20_10 * (const 64 (-(2**20))),
    r_354_364 * f_354_low60_0_low20_0 + s_354_364 * g_354_low60_0_low20_0 = g_354_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_10 + u_354_364 * (const 64 (2**21)) + v_354_364 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_10 + r_354_364 * (const 64 (2**21)) + s_354_364 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_10,
    f_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_10,
    g_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 364)) <=s delta, delta <=s (const 64 (1 + 2*364)),
    (const 64 (-(2**20))) <=s u_354_364, u_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_364, v_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_364, r_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_364, s_354_364 <=s (const 64 ((2**20))),
    u_354_364 + v_354_364 <=s (const 64 (2**20)),
    u_354_364 - v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 + v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 - v_354_364 <=s (const 64 (2**20)),
    r_354_364 + s_354_364 <=s (const 64 (2**20)),
    r_354_364 - s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 + s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 - s_354_364 <=s (const 64 (2**20)),
    u_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_354_364 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step10

// premise a
assume
g_354_low60_0_low20_10 = 0 (mod 2)
&&
g_354_low60_0_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_11 f_354_low60_0_low20_10;
mov u_354_365 u_354_364;
mov v_354_365 v_354_364;

asr g_354_low60_0_low20_11 g_354_low60_0_low20_10 1;
asr r_354_365 r_354_364 1;
asr s_354_365 s_354_364 1;
assert
    true
&&
    f_354_low60_0_low20_11 = f_354_low60_0_low20_10,
    u_354_365 = u_354_364,
    v_354_365 = v_354_364,
    g_354_low60_0_low20_11 * (const 64 2) = g_354_low60_0_low20_10,
    r_354_365 * (const 64 2) = r_354_364,
    s_354_365 * (const 64 2) = s_354_364
;

assume
    f_354_low60_0_low20_11 = f_354_low60_0_low20_10,
    u_354_365 = u_354_364,
    v_354_365 = v_354_364,
    g_354_low60_0_low20_11 * 2 = g_354_low60_0_low20_10,
    r_354_365 * 2 = r_354_364,
    s_354_365 * 2 = s_354_364
&&
    true
;

{
    u_354_365 * f_354_low60_0_low20_0 + v_354_365 * g_354_low60_0_low20_0 = f_354_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_365 * f_354_low60_0_low20_0 + s_354_365 * g_354_low60_0_low20_0 = g_354_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_11 + u_354_365 * (const 64 (2**21)) + v_354_365 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_11 + r_354_365 * (const 64 (2**21)) + s_354_365 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_11,
    f_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_11,
    g_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 365)) <=s delta, delta <=s (const 64 (1 + 2*365)),
    (const 64 (-(2**20))) <=s u_354_365, u_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_365, v_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_365, r_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_365, s_354_365 <=s (const 64 ((2**20))),
    u_354_365 + v_354_365 <=s (const 64 (2**20)),
    u_354_365 - v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 + v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 - v_354_365 <=s (const 64 (2**20)),
    r_354_365 + s_354_365 <=s (const 64 (2**20)),
    r_354_365 - s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 + s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 - s_354_365 <=s (const 64 (2**20)),
    u_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_354_365 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_364_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_10,
sint64 g_354_low60_0_low20_10,
sint64 f_354_low60_0_low20_11,
sint64 g_354_low60_0_low20_11,
sint64 u_354_364,
sint64 v_354_364,
sint64 r_354_364,
sint64 s_354_364,
sint64 u_354_365,
sint64 v_354_365,
sint64 r_354_365,
sint64 s_354_365,
bit ne
)={
    u_354_364 * f_354_low60_0_low20_0 + v_354_364 * g_354_low60_0_low20_0 = f_354_low60_0_low20_10 * (-(2**20)),
    r_354_364 * f_354_low60_0_low20_0 + s_354_364 * g_354_low60_0_low20_0 = g_354_low60_0_low20_10 * (-(2**20))
&&
    u_354_364 * f_354_low60_0_low20_0 + v_354_364 * g_354_low60_0_low20_0 = f_354_low60_0_low20_10 * (const 64 (-(2**20))),
    r_354_364 * f_354_low60_0_low20_0 + s_354_364 * g_354_low60_0_low20_0 = g_354_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_10 + u_354_364 * (const 64 (2**21)) + v_354_364 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_10 + r_354_364 * (const 64 (2**21)) + s_354_364 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_10,
    f_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_10,
    g_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 364)) <=s delta, delta <=s (const 64 (1 + 2*364)),
    (const 64 (-(2**20))) <=s u_354_364, u_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_364, v_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_364, r_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_364, s_354_364 <=s (const 64 ((2**20))),
    u_354_364 + v_354_364 <=s (const 64 (2**20)),
    u_354_364 - v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 + v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 - v_354_364 <=s (const 64 (2**20)),
    r_354_364 + s_354_364 <=s (const 64 (2**20)),
    r_354_364 - s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 + s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 - s_354_364 <=s (const 64 (2**20)),
    u_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_354_364 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step10

// premise b
assume
g_354_low60_0_low20_10 = 1 (mod 2)
&&
g_354_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_11 f_354_low60_0_low20_10;
mov u_354_365 u_354_364;
mov v_354_365 v_354_364;

add g_354_low60_0_low20_11 g_354_low60_0_low20_10 f_354_low60_0_low20_10;
asr g_354_low60_0_low20_11 g_354_low60_0_low20_11 1;
add r_354_365 r_354_364 u_354_364;
asr r_354_365 r_354_365 1;
add s_354_365 s_354_364 v_354_364;
asr s_354_365 s_354_365 1;
assert
    true
&&
    f_354_low60_0_low20_11 = f_354_low60_0_low20_10,
    u_354_365 = u_354_364,
    v_354_365 = v_354_364,
    g_354_low60_0_low20_11 * (const 64 2) = g_354_low60_0_low20_10 + f_354_low60_0_low20_10,
    r_354_365 * (const 64 2) = r_354_364 + u_354_364,
    s_354_365 * (const 64 2) = s_354_364 + v_354_364
;

assume
    f_354_low60_0_low20_11 = f_354_low60_0_low20_10,
    u_354_365 = u_354_364,
    v_354_365 = v_354_364,
    g_354_low60_0_low20_11 * 2 = g_354_low60_0_low20_10 + f_354_low60_0_low20_10,
    r_354_365 * 2 = r_354_364 + u_354_364,
    s_354_365 * 2 = s_354_364 + v_354_364
&&
    true
;

{
    u_354_365 * f_354_low60_0_low20_0 + v_354_365 * g_354_low60_0_low20_0 = f_354_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_365 * f_354_low60_0_low20_0 + s_354_365 * g_354_low60_0_low20_0 = g_354_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_11 + u_354_365 * (const 64 (2**21)) + v_354_365 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_11 + r_354_365 * (const 64 (2**21)) + s_354_365 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_11,
    f_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_11,
    g_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 365)) <=s delta, delta <=s (const 64 (1 + 2*365)),
    (const 64 (-(2**20))) <=s u_354_365, u_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_365, v_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_365, r_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_365, s_354_365 <=s (const 64 ((2**20))),
    u_354_365 + v_354_365 <=s (const 64 (2**20)),
    u_354_365 - v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 + v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 - v_354_365 <=s (const 64 (2**20)),
    r_354_365 + s_354_365 <=s (const 64 (2**20)),
    r_354_365 - s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 + s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 - s_354_365 <=s (const 64 (2**20)),
    u_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_354_365 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_364_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_10,
sint64 g_354_low60_0_low20_10,
sint64 f_354_low60_0_low20_11,
sint64 g_354_low60_0_low20_11,
sint64 u_354_364,
sint64 v_354_364,
sint64 r_354_364,
sint64 s_354_364,
sint64 u_354_365,
sint64 v_354_365,
sint64 r_354_365,
sint64 s_354_365,
bit ne
)={
    u_354_364 * f_354_low60_0_low20_0 + v_354_364 * g_354_low60_0_low20_0 = f_354_low60_0_low20_10 * (-(2**20)),
    r_354_364 * f_354_low60_0_low20_0 + s_354_364 * g_354_low60_0_low20_0 = g_354_low60_0_low20_10 * (-(2**20))
&&
    u_354_364 * f_354_low60_0_low20_0 + v_354_364 * g_354_low60_0_low20_0 = f_354_low60_0_low20_10 * (const 64 (-(2**20))),
    r_354_364 * f_354_low60_0_low20_0 + s_354_364 * g_354_low60_0_low20_0 = g_354_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_10 + u_354_364 * (const 64 (2**21)) + v_354_364 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_10 + r_354_364 * (const 64 (2**21)) + s_354_364 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_10,
    f_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_10,
    g_354_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 364)) <=s delta, delta <=s (const 64 (1 + 2*364)),
    (const 64 (-(2**20))) <=s u_354_364, u_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_364, v_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_364, r_354_364 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_364, s_354_364 <=s (const 64 ((2**20))),
    u_354_364 + v_354_364 <=s (const 64 (2**20)),
    u_354_364 - v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 + v_354_364 <=s (const 64 (2**20)),
    (const 64 0) - u_354_364 - v_354_364 <=s (const 64 (2**20)),
    r_354_364 + s_354_364 <=s (const 64 (2**20)),
    r_354_364 - s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 + s_354_364 <=s (const 64 (2**20)),
    (const 64 0) - r_354_364 - s_354_364 <=s (const 64 (2**20)),
    u_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_354_364 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_354_364 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step10

// premise c
assume
g_354_low60_0_low20_10 = 1 (mod 2)
&&
g_354_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_11 g_354_low60_0_low20_10;
mov u_354_365 r_354_364;
mov v_354_365 s_354_364;

subs dc g_354_low60_0_low20_11 g_354_low60_0_low20_10 f_354_low60_0_low20_10;
asr g_354_low60_0_low20_11 g_354_low60_0_low20_11 1;
subs dc r_354_365 r_354_364 u_354_364;
asr r_354_365 r_354_365 1;
subs dc s_354_365 s_354_364 v_354_364;
asr s_354_365 s_354_365 1;
assert
    true
&&
    f_354_low60_0_low20_11 = g_354_low60_0_low20_10,
    u_354_365 = r_354_364,
    v_354_365 = s_354_364,
    g_354_low60_0_low20_11 * (const 64 2) = g_354_low60_0_low20_10 - f_354_low60_0_low20_10,
    r_354_365 * (const 64 2) = r_354_364 - u_354_364,
    s_354_365 * (const 64 2) = s_354_364 - v_354_364
;

assume
    f_354_low60_0_low20_11 = g_354_low60_0_low20_10,
    u_354_365 = r_354_364,
    v_354_365 = s_354_364,
    g_354_low60_0_low20_11 * 2 = g_354_low60_0_low20_10 - f_354_low60_0_low20_10,
    r_354_365 * 2 = r_354_364 - u_354_364,
    s_354_365 * 2 = s_354_364 - v_354_364
&&
    true
;

{
    u_354_365 * f_354_low60_0_low20_0 + v_354_365 * g_354_low60_0_low20_0 = f_354_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_365 * f_354_low60_0_low20_0 + s_354_365 * g_354_low60_0_low20_0 = g_354_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_11 + u_354_365 * (const 64 (2**21)) + v_354_365 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_11 + r_354_365 * (const 64 (2**21)) + s_354_365 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_11,
    f_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_11,
    g_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 365)) <=s delta, delta <=s (const 64 (1 + 2*365)),
    (const 64 (-(2**20))) <=s u_354_365, u_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_365, v_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_365, r_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_365, s_354_365 <=s (const 64 ((2**20))),
    u_354_365 + v_354_365 <=s (const 64 (2**20)),
    u_354_365 - v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 + v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 - v_354_365 <=s (const 64 (2**20)),
    r_354_365 + s_354_365 <=s (const 64 (2**20)),
    r_354_365 - s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 + s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 - s_354_365 <=s (const 64 (2**20)),
    u_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_354_365 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_365_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_11,
sint64 g_354_low60_0_low20_11,
sint64 f_354_low60_0_low20_12,
sint64 g_354_low60_0_low20_12,
sint64 u_354_365,
sint64 v_354_365,
sint64 r_354_365,
sint64 s_354_365,
sint64 u_354_366,
sint64 v_354_366,
sint64 r_354_366,
sint64 s_354_366,
bit ne
)={
    u_354_365 * f_354_low60_0_low20_0 + v_354_365 * g_354_low60_0_low20_0 = f_354_low60_0_low20_11 * (-(2**20)),
    r_354_365 * f_354_low60_0_low20_0 + s_354_365 * g_354_low60_0_low20_0 = g_354_low60_0_low20_11 * (-(2**20))
&&
    u_354_365 * f_354_low60_0_low20_0 + v_354_365 * g_354_low60_0_low20_0 = f_354_low60_0_low20_11 * (const 64 (-(2**20))),
    r_354_365 * f_354_low60_0_low20_0 + s_354_365 * g_354_low60_0_low20_0 = g_354_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_11 + u_354_365 * (const 64 (2**21)) + v_354_365 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_11 + r_354_365 * (const 64 (2**21)) + s_354_365 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_11,
    f_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_11,
    g_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 365)) <=s delta, delta <=s (const 64 (1 + 2*365)),
    (const 64 (-(2**20))) <=s u_354_365, u_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_365, v_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_365, r_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_365, s_354_365 <=s (const 64 ((2**20))),
    u_354_365 + v_354_365 <=s (const 64 (2**20)),
    u_354_365 - v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 + v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 - v_354_365 <=s (const 64 (2**20)),
    r_354_365 + s_354_365 <=s (const 64 (2**20)),
    r_354_365 - s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 + s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 - s_354_365 <=s (const 64 (2**20)),
    u_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_354_365 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step11

// premise a
assume
g_354_low60_0_low20_11 = 0 (mod 2)
&&
g_354_low60_0_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_12 f_354_low60_0_low20_11;
mov u_354_366 u_354_365;
mov v_354_366 v_354_365;

asr g_354_low60_0_low20_12 g_354_low60_0_low20_11 1;
asr r_354_366 r_354_365 1;
asr s_354_366 s_354_365 1;
assert
    true
&&
    f_354_low60_0_low20_12 = f_354_low60_0_low20_11,
    u_354_366 = u_354_365,
    v_354_366 = v_354_365,
    g_354_low60_0_low20_12 * (const 64 2) = g_354_low60_0_low20_11,
    r_354_366 * (const 64 2) = r_354_365,
    s_354_366 * (const 64 2) = s_354_365
;

assume
    f_354_low60_0_low20_12 = f_354_low60_0_low20_11,
    u_354_366 = u_354_365,
    v_354_366 = v_354_365,
    g_354_low60_0_low20_12 * 2 = g_354_low60_0_low20_11,
    r_354_366 * 2 = r_354_365,
    s_354_366 * 2 = s_354_365
&&
    true
;

{
    u_354_366 * f_354_low60_0_low20_0 + v_354_366 * g_354_low60_0_low20_0 = f_354_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_366 * f_354_low60_0_low20_0 + s_354_366 * g_354_low60_0_low20_0 = g_354_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_12 + u_354_366 * (const 64 (2**21)) + v_354_366 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_12 + r_354_366 * (const 64 (2**21)) + s_354_366 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_12,
    f_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_12,
    g_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 366)) <=s delta, delta <=s (const 64 (1 + 2*366)),
    (const 64 (-(2**20))) <=s u_354_366, u_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_366, v_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_366, r_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_366, s_354_366 <=s (const 64 ((2**20))),
    u_354_366 + v_354_366 <=s (const 64 (2**20)),
    u_354_366 - v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 + v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 - v_354_366 <=s (const 64 (2**20)),
    r_354_366 + s_354_366 <=s (const 64 (2**20)),
    r_354_366 - s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 + s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 - s_354_366 <=s (const 64 (2**20)),
    u_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_354_366 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_365_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_11,
sint64 g_354_low60_0_low20_11,
sint64 f_354_low60_0_low20_12,
sint64 g_354_low60_0_low20_12,
sint64 u_354_365,
sint64 v_354_365,
sint64 r_354_365,
sint64 s_354_365,
sint64 u_354_366,
sint64 v_354_366,
sint64 r_354_366,
sint64 s_354_366,
bit ne
)={
    u_354_365 * f_354_low60_0_low20_0 + v_354_365 * g_354_low60_0_low20_0 = f_354_low60_0_low20_11 * (-(2**20)),
    r_354_365 * f_354_low60_0_low20_0 + s_354_365 * g_354_low60_0_low20_0 = g_354_low60_0_low20_11 * (-(2**20))
&&
    u_354_365 * f_354_low60_0_low20_0 + v_354_365 * g_354_low60_0_low20_0 = f_354_low60_0_low20_11 * (const 64 (-(2**20))),
    r_354_365 * f_354_low60_0_low20_0 + s_354_365 * g_354_low60_0_low20_0 = g_354_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_11 + u_354_365 * (const 64 (2**21)) + v_354_365 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_11 + r_354_365 * (const 64 (2**21)) + s_354_365 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_11,
    f_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_11,
    g_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 365)) <=s delta, delta <=s (const 64 (1 + 2*365)),
    (const 64 (-(2**20))) <=s u_354_365, u_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_365, v_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_365, r_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_365, s_354_365 <=s (const 64 ((2**20))),
    u_354_365 + v_354_365 <=s (const 64 (2**20)),
    u_354_365 - v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 + v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 - v_354_365 <=s (const 64 (2**20)),
    r_354_365 + s_354_365 <=s (const 64 (2**20)),
    r_354_365 - s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 + s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 - s_354_365 <=s (const 64 (2**20)),
    u_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_354_365 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step11

// premise b
assume
g_354_low60_0_low20_11 = 1 (mod 2)
&&
g_354_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_12 f_354_low60_0_low20_11;
mov u_354_366 u_354_365;
mov v_354_366 v_354_365;

add g_354_low60_0_low20_12 g_354_low60_0_low20_11 f_354_low60_0_low20_11;
asr g_354_low60_0_low20_12 g_354_low60_0_low20_12 1;
add r_354_366 r_354_365 u_354_365;
asr r_354_366 r_354_366 1;
add s_354_366 s_354_365 v_354_365;
asr s_354_366 s_354_366 1;
assert
    true
&&
    f_354_low60_0_low20_12 = f_354_low60_0_low20_11,
    u_354_366 = u_354_365,
    v_354_366 = v_354_365,
    g_354_low60_0_low20_12 * (const 64 2) = g_354_low60_0_low20_11 + f_354_low60_0_low20_11,
    r_354_366 * (const 64 2) = r_354_365 + u_354_365,
    s_354_366 * (const 64 2) = s_354_365 + v_354_365
;

assume
    f_354_low60_0_low20_12 = f_354_low60_0_low20_11,
    u_354_366 = u_354_365,
    v_354_366 = v_354_365,
    g_354_low60_0_low20_12 * 2 = g_354_low60_0_low20_11 + f_354_low60_0_low20_11,
    r_354_366 * 2 = r_354_365 + u_354_365,
    s_354_366 * 2 = s_354_365 + v_354_365
&&
    true
;

{
    u_354_366 * f_354_low60_0_low20_0 + v_354_366 * g_354_low60_0_low20_0 = f_354_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_366 * f_354_low60_0_low20_0 + s_354_366 * g_354_low60_0_low20_0 = g_354_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_12 + u_354_366 * (const 64 (2**21)) + v_354_366 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_12 + r_354_366 * (const 64 (2**21)) + s_354_366 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_12,
    f_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_12,
    g_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 366)) <=s delta, delta <=s (const 64 (1 + 2*366)),
    (const 64 (-(2**20))) <=s u_354_366, u_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_366, v_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_366, r_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_366, s_354_366 <=s (const 64 ((2**20))),
    u_354_366 + v_354_366 <=s (const 64 (2**20)),
    u_354_366 - v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 + v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 - v_354_366 <=s (const 64 (2**20)),
    r_354_366 + s_354_366 <=s (const 64 (2**20)),
    r_354_366 - s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 + s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 - s_354_366 <=s (const 64 (2**20)),
    u_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_354_366 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_365_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_11,
sint64 g_354_low60_0_low20_11,
sint64 f_354_low60_0_low20_12,
sint64 g_354_low60_0_low20_12,
sint64 u_354_365,
sint64 v_354_365,
sint64 r_354_365,
sint64 s_354_365,
sint64 u_354_366,
sint64 v_354_366,
sint64 r_354_366,
sint64 s_354_366,
bit ne
)={
    u_354_365 * f_354_low60_0_low20_0 + v_354_365 * g_354_low60_0_low20_0 = f_354_low60_0_low20_11 * (-(2**20)),
    r_354_365 * f_354_low60_0_low20_0 + s_354_365 * g_354_low60_0_low20_0 = g_354_low60_0_low20_11 * (-(2**20))
&&
    u_354_365 * f_354_low60_0_low20_0 + v_354_365 * g_354_low60_0_low20_0 = f_354_low60_0_low20_11 * (const 64 (-(2**20))),
    r_354_365 * f_354_low60_0_low20_0 + s_354_365 * g_354_low60_0_low20_0 = g_354_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_11 + u_354_365 * (const 64 (2**21)) + v_354_365 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_11 + r_354_365 * (const 64 (2**21)) + s_354_365 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_11,
    f_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_11,
    g_354_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 365)) <=s delta, delta <=s (const 64 (1 + 2*365)),
    (const 64 (-(2**20))) <=s u_354_365, u_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_365, v_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_365, r_354_365 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_365, s_354_365 <=s (const 64 ((2**20))),
    u_354_365 + v_354_365 <=s (const 64 (2**20)),
    u_354_365 - v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 + v_354_365 <=s (const 64 (2**20)),
    (const 64 0) - u_354_365 - v_354_365 <=s (const 64 (2**20)),
    r_354_365 + s_354_365 <=s (const 64 (2**20)),
    r_354_365 - s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 + s_354_365 <=s (const 64 (2**20)),
    (const 64 0) - r_354_365 - s_354_365 <=s (const 64 (2**20)),
    u_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_354_365 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_354_365 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step11

// premise c
assume
g_354_low60_0_low20_11 = 1 (mod 2)
&&
g_354_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_12 g_354_low60_0_low20_11;
mov u_354_366 r_354_365;
mov v_354_366 s_354_365;

subs dc g_354_low60_0_low20_12 g_354_low60_0_low20_11 f_354_low60_0_low20_11;
asr g_354_low60_0_low20_12 g_354_low60_0_low20_12 1;
subs dc r_354_366 r_354_365 u_354_365;
asr r_354_366 r_354_366 1;
subs dc s_354_366 s_354_365 v_354_365;
asr s_354_366 s_354_366 1;
assert
    true
&&
    f_354_low60_0_low20_12 = g_354_low60_0_low20_11,
    u_354_366 = r_354_365,
    v_354_366 = s_354_365,
    g_354_low60_0_low20_12 * (const 64 2) = g_354_low60_0_low20_11 - f_354_low60_0_low20_11,
    r_354_366 * (const 64 2) = r_354_365 - u_354_365,
    s_354_366 * (const 64 2) = s_354_365 - v_354_365
;

assume
    f_354_low60_0_low20_12 = g_354_low60_0_low20_11,
    u_354_366 = r_354_365,
    v_354_366 = s_354_365,
    g_354_low60_0_low20_12 * 2 = g_354_low60_0_low20_11 - f_354_low60_0_low20_11,
    r_354_366 * 2 = r_354_365 - u_354_365,
    s_354_366 * 2 = s_354_365 - v_354_365
&&
    true
;

{
    u_354_366 * f_354_low60_0_low20_0 + v_354_366 * g_354_low60_0_low20_0 = f_354_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_366 * f_354_low60_0_low20_0 + s_354_366 * g_354_low60_0_low20_0 = g_354_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_12 + u_354_366 * (const 64 (2**21)) + v_354_366 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_12 + r_354_366 * (const 64 (2**21)) + s_354_366 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_12,
    f_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_12,
    g_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 366)) <=s delta, delta <=s (const 64 (1 + 2*366)),
    (const 64 (-(2**20))) <=s u_354_366, u_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_366, v_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_366, r_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_366, s_354_366 <=s (const 64 ((2**20))),
    u_354_366 + v_354_366 <=s (const 64 (2**20)),
    u_354_366 - v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 + v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 - v_354_366 <=s (const 64 (2**20)),
    r_354_366 + s_354_366 <=s (const 64 (2**20)),
    r_354_366 - s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 + s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 - s_354_366 <=s (const 64 (2**20)),
    u_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_354_366 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_366_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_12,
sint64 g_354_low60_0_low20_12,
sint64 f_354_low60_0_low20_13,
sint64 g_354_low60_0_low20_13,
sint64 u_354_366,
sint64 v_354_366,
sint64 r_354_366,
sint64 s_354_366,
sint64 u_354_367,
sint64 v_354_367,
sint64 r_354_367,
sint64 s_354_367,
bit ne
)={
    u_354_366 * f_354_low60_0_low20_0 + v_354_366 * g_354_low60_0_low20_0 = f_354_low60_0_low20_12 * (-(2**20)),
    r_354_366 * f_354_low60_0_low20_0 + s_354_366 * g_354_low60_0_low20_0 = g_354_low60_0_low20_12 * (-(2**20))
&&
    u_354_366 * f_354_low60_0_low20_0 + v_354_366 * g_354_low60_0_low20_0 = f_354_low60_0_low20_12 * (const 64 (-(2**20))),
    r_354_366 * f_354_low60_0_low20_0 + s_354_366 * g_354_low60_0_low20_0 = g_354_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_12 + u_354_366 * (const 64 (2**21)) + v_354_366 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_12 + r_354_366 * (const 64 (2**21)) + s_354_366 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_12,
    f_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_12,
    g_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 366)) <=s delta, delta <=s (const 64 (1 + 2*366)),
    (const 64 (-(2**20))) <=s u_354_366, u_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_366, v_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_366, r_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_366, s_354_366 <=s (const 64 ((2**20))),
    u_354_366 + v_354_366 <=s (const 64 (2**20)),
    u_354_366 - v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 + v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 - v_354_366 <=s (const 64 (2**20)),
    r_354_366 + s_354_366 <=s (const 64 (2**20)),
    r_354_366 - s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 + s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 - s_354_366 <=s (const 64 (2**20)),
    u_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_354_366 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step12

// premise a
assume
g_354_low60_0_low20_12 = 0 (mod 2)
&&
g_354_low60_0_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_13 f_354_low60_0_low20_12;
mov u_354_367 u_354_366;
mov v_354_367 v_354_366;

asr g_354_low60_0_low20_13 g_354_low60_0_low20_12 1;
asr r_354_367 r_354_366 1;
asr s_354_367 s_354_366 1;
assert
    true
&&
    f_354_low60_0_low20_13 = f_354_low60_0_low20_12,
    u_354_367 = u_354_366,
    v_354_367 = v_354_366,
    g_354_low60_0_low20_13 * (const 64 2) = g_354_low60_0_low20_12,
    r_354_367 * (const 64 2) = r_354_366,
    s_354_367 * (const 64 2) = s_354_366
;

assume
    f_354_low60_0_low20_13 = f_354_low60_0_low20_12,
    u_354_367 = u_354_366,
    v_354_367 = v_354_366,
    g_354_low60_0_low20_13 * 2 = g_354_low60_0_low20_12,
    r_354_367 * 2 = r_354_366,
    s_354_367 * 2 = s_354_366
&&
    true
;

{
    u_354_367 * f_354_low60_0_low20_0 + v_354_367 * g_354_low60_0_low20_0 = f_354_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_367 * f_354_low60_0_low20_0 + s_354_367 * g_354_low60_0_low20_0 = g_354_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_13 + u_354_367 * (const 64 (2**21)) + v_354_367 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_13 + r_354_367 * (const 64 (2**21)) + s_354_367 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_13,
    f_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_13,
    g_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 367)) <=s delta, delta <=s (const 64 (1 + 2*367)),
    (const 64 (-(2**20))) <=s u_354_367, u_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_367, v_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_367, r_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_367, s_354_367 <=s (const 64 ((2**20))),
    u_354_367 + v_354_367 <=s (const 64 (2**20)),
    u_354_367 - v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 + v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 - v_354_367 <=s (const 64 (2**20)),
    r_354_367 + s_354_367 <=s (const 64 (2**20)),
    r_354_367 - s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 + s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 - s_354_367 <=s (const 64 (2**20)),
    u_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_354_367 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_366_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_12,
sint64 g_354_low60_0_low20_12,
sint64 f_354_low60_0_low20_13,
sint64 g_354_low60_0_low20_13,
sint64 u_354_366,
sint64 v_354_366,
sint64 r_354_366,
sint64 s_354_366,
sint64 u_354_367,
sint64 v_354_367,
sint64 r_354_367,
sint64 s_354_367,
bit ne
)={
    u_354_366 * f_354_low60_0_low20_0 + v_354_366 * g_354_low60_0_low20_0 = f_354_low60_0_low20_12 * (-(2**20)),
    r_354_366 * f_354_low60_0_low20_0 + s_354_366 * g_354_low60_0_low20_0 = g_354_low60_0_low20_12 * (-(2**20))
&&
    u_354_366 * f_354_low60_0_low20_0 + v_354_366 * g_354_low60_0_low20_0 = f_354_low60_0_low20_12 * (const 64 (-(2**20))),
    r_354_366 * f_354_low60_0_low20_0 + s_354_366 * g_354_low60_0_low20_0 = g_354_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_12 + u_354_366 * (const 64 (2**21)) + v_354_366 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_12 + r_354_366 * (const 64 (2**21)) + s_354_366 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_12,
    f_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_12,
    g_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 366)) <=s delta, delta <=s (const 64 (1 + 2*366)),
    (const 64 (-(2**20))) <=s u_354_366, u_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_366, v_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_366, r_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_366, s_354_366 <=s (const 64 ((2**20))),
    u_354_366 + v_354_366 <=s (const 64 (2**20)),
    u_354_366 - v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 + v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 - v_354_366 <=s (const 64 (2**20)),
    r_354_366 + s_354_366 <=s (const 64 (2**20)),
    r_354_366 - s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 + s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 - s_354_366 <=s (const 64 (2**20)),
    u_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_354_366 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step12

// premise b
assume
g_354_low60_0_low20_12 = 1 (mod 2)
&&
g_354_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_13 f_354_low60_0_low20_12;
mov u_354_367 u_354_366;
mov v_354_367 v_354_366;

add g_354_low60_0_low20_13 g_354_low60_0_low20_12 f_354_low60_0_low20_12;
asr g_354_low60_0_low20_13 g_354_low60_0_low20_13 1;
add r_354_367 r_354_366 u_354_366;
asr r_354_367 r_354_367 1;
add s_354_367 s_354_366 v_354_366;
asr s_354_367 s_354_367 1;
assert
    true
&&
    f_354_low60_0_low20_13 = f_354_low60_0_low20_12,
    u_354_367 = u_354_366,
    v_354_367 = v_354_366,
    g_354_low60_0_low20_13 * (const 64 2) = g_354_low60_0_low20_12 + f_354_low60_0_low20_12,
    r_354_367 * (const 64 2) = r_354_366 + u_354_366,
    s_354_367 * (const 64 2) = s_354_366 + v_354_366
;

assume
    f_354_low60_0_low20_13 = f_354_low60_0_low20_12,
    u_354_367 = u_354_366,
    v_354_367 = v_354_366,
    g_354_low60_0_low20_13 * 2 = g_354_low60_0_low20_12 + f_354_low60_0_low20_12,
    r_354_367 * 2 = r_354_366 + u_354_366,
    s_354_367 * 2 = s_354_366 + v_354_366
&&
    true
;

{
    u_354_367 * f_354_low60_0_low20_0 + v_354_367 * g_354_low60_0_low20_0 = f_354_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_367 * f_354_low60_0_low20_0 + s_354_367 * g_354_low60_0_low20_0 = g_354_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_13 + u_354_367 * (const 64 (2**21)) + v_354_367 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_13 + r_354_367 * (const 64 (2**21)) + s_354_367 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_13,
    f_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_13,
    g_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 367)) <=s delta, delta <=s (const 64 (1 + 2*367)),
    (const 64 (-(2**20))) <=s u_354_367, u_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_367, v_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_367, r_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_367, s_354_367 <=s (const 64 ((2**20))),
    u_354_367 + v_354_367 <=s (const 64 (2**20)),
    u_354_367 - v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 + v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 - v_354_367 <=s (const 64 (2**20)),
    r_354_367 + s_354_367 <=s (const 64 (2**20)),
    r_354_367 - s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 + s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 - s_354_367 <=s (const 64 (2**20)),
    u_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_354_367 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_366_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_12,
sint64 g_354_low60_0_low20_12,
sint64 f_354_low60_0_low20_13,
sint64 g_354_low60_0_low20_13,
sint64 u_354_366,
sint64 v_354_366,
sint64 r_354_366,
sint64 s_354_366,
sint64 u_354_367,
sint64 v_354_367,
sint64 r_354_367,
sint64 s_354_367,
bit ne
)={
    u_354_366 * f_354_low60_0_low20_0 + v_354_366 * g_354_low60_0_low20_0 = f_354_low60_0_low20_12 * (-(2**20)),
    r_354_366 * f_354_low60_0_low20_0 + s_354_366 * g_354_low60_0_low20_0 = g_354_low60_0_low20_12 * (-(2**20))
&&
    u_354_366 * f_354_low60_0_low20_0 + v_354_366 * g_354_low60_0_low20_0 = f_354_low60_0_low20_12 * (const 64 (-(2**20))),
    r_354_366 * f_354_low60_0_low20_0 + s_354_366 * g_354_low60_0_low20_0 = g_354_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_12 + u_354_366 * (const 64 (2**21)) + v_354_366 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_12 + r_354_366 * (const 64 (2**21)) + s_354_366 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_12,
    f_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_12,
    g_354_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 366)) <=s delta, delta <=s (const 64 (1 + 2*366)),
    (const 64 (-(2**20))) <=s u_354_366, u_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_366, v_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_366, r_354_366 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_366, s_354_366 <=s (const 64 ((2**20))),
    u_354_366 + v_354_366 <=s (const 64 (2**20)),
    u_354_366 - v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 + v_354_366 <=s (const 64 (2**20)),
    (const 64 0) - u_354_366 - v_354_366 <=s (const 64 (2**20)),
    r_354_366 + s_354_366 <=s (const 64 (2**20)),
    r_354_366 - s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 + s_354_366 <=s (const 64 (2**20)),
    (const 64 0) - r_354_366 - s_354_366 <=s (const 64 (2**20)),
    u_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_354_366 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_354_366 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step12

// premise c
assume
g_354_low60_0_low20_12 = 1 (mod 2)
&&
g_354_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_13 g_354_low60_0_low20_12;
mov u_354_367 r_354_366;
mov v_354_367 s_354_366;

subs dc g_354_low60_0_low20_13 g_354_low60_0_low20_12 f_354_low60_0_low20_12;
asr g_354_low60_0_low20_13 g_354_low60_0_low20_13 1;
subs dc r_354_367 r_354_366 u_354_366;
asr r_354_367 r_354_367 1;
subs dc s_354_367 s_354_366 v_354_366;
asr s_354_367 s_354_367 1;
assert
    true
&&
    f_354_low60_0_low20_13 = g_354_low60_0_low20_12,
    u_354_367 = r_354_366,
    v_354_367 = s_354_366,
    g_354_low60_0_low20_13 * (const 64 2) = g_354_low60_0_low20_12 - f_354_low60_0_low20_12,
    r_354_367 * (const 64 2) = r_354_366 - u_354_366,
    s_354_367 * (const 64 2) = s_354_366 - v_354_366
;

assume
    f_354_low60_0_low20_13 = g_354_low60_0_low20_12,
    u_354_367 = r_354_366,
    v_354_367 = s_354_366,
    g_354_low60_0_low20_13 * 2 = g_354_low60_0_low20_12 - f_354_low60_0_low20_12,
    r_354_367 * 2 = r_354_366 - u_354_366,
    s_354_367 * 2 = s_354_366 - v_354_366
&&
    true
;

{
    u_354_367 * f_354_low60_0_low20_0 + v_354_367 * g_354_low60_0_low20_0 = f_354_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_367 * f_354_low60_0_low20_0 + s_354_367 * g_354_low60_0_low20_0 = g_354_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_13 + u_354_367 * (const 64 (2**21)) + v_354_367 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_13 + r_354_367 * (const 64 (2**21)) + s_354_367 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_13,
    f_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_13,
    g_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 367)) <=s delta, delta <=s (const 64 (1 + 2*367)),
    (const 64 (-(2**20))) <=s u_354_367, u_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_367, v_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_367, r_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_367, s_354_367 <=s (const 64 ((2**20))),
    u_354_367 + v_354_367 <=s (const 64 (2**20)),
    u_354_367 - v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 + v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 - v_354_367 <=s (const 64 (2**20)),
    r_354_367 + s_354_367 <=s (const 64 (2**20)),
    r_354_367 - s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 + s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 - s_354_367 <=s (const 64 (2**20)),
    u_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_354_367 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_367_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_13,
sint64 g_354_low60_0_low20_13,
sint64 f_354_low60_0_low20_14,
sint64 g_354_low60_0_low20_14,
sint64 u_354_367,
sint64 v_354_367,
sint64 r_354_367,
sint64 s_354_367,
sint64 u_354_368,
sint64 v_354_368,
sint64 r_354_368,
sint64 s_354_368,
bit ne
)={
    u_354_367 * f_354_low60_0_low20_0 + v_354_367 * g_354_low60_0_low20_0 = f_354_low60_0_low20_13 * (-(2**20)),
    r_354_367 * f_354_low60_0_low20_0 + s_354_367 * g_354_low60_0_low20_0 = g_354_low60_0_low20_13 * (-(2**20))
&&
    u_354_367 * f_354_low60_0_low20_0 + v_354_367 * g_354_low60_0_low20_0 = f_354_low60_0_low20_13 * (const 64 (-(2**20))),
    r_354_367 * f_354_low60_0_low20_0 + s_354_367 * g_354_low60_0_low20_0 = g_354_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_13 + u_354_367 * (const 64 (2**21)) + v_354_367 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_13 + r_354_367 * (const 64 (2**21)) + s_354_367 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_13,
    f_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_13,
    g_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 367)) <=s delta, delta <=s (const 64 (1 + 2*367)),
    (const 64 (-(2**20))) <=s u_354_367, u_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_367, v_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_367, r_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_367, s_354_367 <=s (const 64 ((2**20))),
    u_354_367 + v_354_367 <=s (const 64 (2**20)),
    u_354_367 - v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 + v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 - v_354_367 <=s (const 64 (2**20)),
    r_354_367 + s_354_367 <=s (const 64 (2**20)),
    r_354_367 - s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 + s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 - s_354_367 <=s (const 64 (2**20)),
    u_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_354_367 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step13

// premise a
assume
g_354_low60_0_low20_13 = 0 (mod 2)
&&
g_354_low60_0_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_14 f_354_low60_0_low20_13;
mov u_354_368 u_354_367;
mov v_354_368 v_354_367;

asr g_354_low60_0_low20_14 g_354_low60_0_low20_13 1;
asr r_354_368 r_354_367 1;
asr s_354_368 s_354_367 1;
assert
    true
&&
    f_354_low60_0_low20_14 = f_354_low60_0_low20_13,
    u_354_368 = u_354_367,
    v_354_368 = v_354_367,
    g_354_low60_0_low20_14 * (const 64 2) = g_354_low60_0_low20_13,
    r_354_368 * (const 64 2) = r_354_367,
    s_354_368 * (const 64 2) = s_354_367
;

assume
    f_354_low60_0_low20_14 = f_354_low60_0_low20_13,
    u_354_368 = u_354_367,
    v_354_368 = v_354_367,
    g_354_low60_0_low20_14 * 2 = g_354_low60_0_low20_13,
    r_354_368 * 2 = r_354_367,
    s_354_368 * 2 = s_354_367
&&
    true
;

{
    u_354_368 * f_354_low60_0_low20_0 + v_354_368 * g_354_low60_0_low20_0 = f_354_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_368 * f_354_low60_0_low20_0 + s_354_368 * g_354_low60_0_low20_0 = g_354_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_14 + u_354_368 * (const 64 (2**21)) + v_354_368 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_14 + r_354_368 * (const 64 (2**21)) + s_354_368 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_14,
    f_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_14,
    g_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 368)) <=s delta, delta <=s (const 64 (1 + 2*368)),
    (const 64 (-(2**20))) <=s u_354_368, u_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_368, v_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_368, r_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_368, s_354_368 <=s (const 64 ((2**20))),
    u_354_368 + v_354_368 <=s (const 64 (2**20)),
    u_354_368 - v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 + v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 - v_354_368 <=s (const 64 (2**20)),
    r_354_368 + s_354_368 <=s (const 64 (2**20)),
    r_354_368 - s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 + s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 - s_354_368 <=s (const 64 (2**20)),
    u_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_354_368 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_367_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_13,
sint64 g_354_low60_0_low20_13,
sint64 f_354_low60_0_low20_14,
sint64 g_354_low60_0_low20_14,
sint64 u_354_367,
sint64 v_354_367,
sint64 r_354_367,
sint64 s_354_367,
sint64 u_354_368,
sint64 v_354_368,
sint64 r_354_368,
sint64 s_354_368,
bit ne
)={
    u_354_367 * f_354_low60_0_low20_0 + v_354_367 * g_354_low60_0_low20_0 = f_354_low60_0_low20_13 * (-(2**20)),
    r_354_367 * f_354_low60_0_low20_0 + s_354_367 * g_354_low60_0_low20_0 = g_354_low60_0_low20_13 * (-(2**20))
&&
    u_354_367 * f_354_low60_0_low20_0 + v_354_367 * g_354_low60_0_low20_0 = f_354_low60_0_low20_13 * (const 64 (-(2**20))),
    r_354_367 * f_354_low60_0_low20_0 + s_354_367 * g_354_low60_0_low20_0 = g_354_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_13 + u_354_367 * (const 64 (2**21)) + v_354_367 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_13 + r_354_367 * (const 64 (2**21)) + s_354_367 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_13,
    f_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_13,
    g_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 367)) <=s delta, delta <=s (const 64 (1 + 2*367)),
    (const 64 (-(2**20))) <=s u_354_367, u_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_367, v_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_367, r_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_367, s_354_367 <=s (const 64 ((2**20))),
    u_354_367 + v_354_367 <=s (const 64 (2**20)),
    u_354_367 - v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 + v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 - v_354_367 <=s (const 64 (2**20)),
    r_354_367 + s_354_367 <=s (const 64 (2**20)),
    r_354_367 - s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 + s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 - s_354_367 <=s (const 64 (2**20)),
    u_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_354_367 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step13

// premise b
assume
g_354_low60_0_low20_13 = 1 (mod 2)
&&
g_354_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_14 f_354_low60_0_low20_13;
mov u_354_368 u_354_367;
mov v_354_368 v_354_367;

add g_354_low60_0_low20_14 g_354_low60_0_low20_13 f_354_low60_0_low20_13;
asr g_354_low60_0_low20_14 g_354_low60_0_low20_14 1;
add r_354_368 r_354_367 u_354_367;
asr r_354_368 r_354_368 1;
add s_354_368 s_354_367 v_354_367;
asr s_354_368 s_354_368 1;
assert
    true
&&
    f_354_low60_0_low20_14 = f_354_low60_0_low20_13,
    u_354_368 = u_354_367,
    v_354_368 = v_354_367,
    g_354_low60_0_low20_14 * (const 64 2) = g_354_low60_0_low20_13 + f_354_low60_0_low20_13,
    r_354_368 * (const 64 2) = r_354_367 + u_354_367,
    s_354_368 * (const 64 2) = s_354_367 + v_354_367
;

assume
    f_354_low60_0_low20_14 = f_354_low60_0_low20_13,
    u_354_368 = u_354_367,
    v_354_368 = v_354_367,
    g_354_low60_0_low20_14 * 2 = g_354_low60_0_low20_13 + f_354_low60_0_low20_13,
    r_354_368 * 2 = r_354_367 + u_354_367,
    s_354_368 * 2 = s_354_367 + v_354_367
&&
    true
;

{
    u_354_368 * f_354_low60_0_low20_0 + v_354_368 * g_354_low60_0_low20_0 = f_354_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_368 * f_354_low60_0_low20_0 + s_354_368 * g_354_low60_0_low20_0 = g_354_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_14 + u_354_368 * (const 64 (2**21)) + v_354_368 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_14 + r_354_368 * (const 64 (2**21)) + s_354_368 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_14,
    f_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_14,
    g_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 368)) <=s delta, delta <=s (const 64 (1 + 2*368)),
    (const 64 (-(2**20))) <=s u_354_368, u_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_368, v_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_368, r_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_368, s_354_368 <=s (const 64 ((2**20))),
    u_354_368 + v_354_368 <=s (const 64 (2**20)),
    u_354_368 - v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 + v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 - v_354_368 <=s (const 64 (2**20)),
    r_354_368 + s_354_368 <=s (const 64 (2**20)),
    r_354_368 - s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 + s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 - s_354_368 <=s (const 64 (2**20)),
    u_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_354_368 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_367_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_13,
sint64 g_354_low60_0_low20_13,
sint64 f_354_low60_0_low20_14,
sint64 g_354_low60_0_low20_14,
sint64 u_354_367,
sint64 v_354_367,
sint64 r_354_367,
sint64 s_354_367,
sint64 u_354_368,
sint64 v_354_368,
sint64 r_354_368,
sint64 s_354_368,
bit ne
)={
    u_354_367 * f_354_low60_0_low20_0 + v_354_367 * g_354_low60_0_low20_0 = f_354_low60_0_low20_13 * (-(2**20)),
    r_354_367 * f_354_low60_0_low20_0 + s_354_367 * g_354_low60_0_low20_0 = g_354_low60_0_low20_13 * (-(2**20))
&&
    u_354_367 * f_354_low60_0_low20_0 + v_354_367 * g_354_low60_0_low20_0 = f_354_low60_0_low20_13 * (const 64 (-(2**20))),
    r_354_367 * f_354_low60_0_low20_0 + s_354_367 * g_354_low60_0_low20_0 = g_354_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_13 + u_354_367 * (const 64 (2**21)) + v_354_367 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_13 + r_354_367 * (const 64 (2**21)) + s_354_367 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_13,
    f_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_13,
    g_354_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 367)) <=s delta, delta <=s (const 64 (1 + 2*367)),
    (const 64 (-(2**20))) <=s u_354_367, u_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_367, v_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_367, r_354_367 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_367, s_354_367 <=s (const 64 ((2**20))),
    u_354_367 + v_354_367 <=s (const 64 (2**20)),
    u_354_367 - v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 + v_354_367 <=s (const 64 (2**20)),
    (const 64 0) - u_354_367 - v_354_367 <=s (const 64 (2**20)),
    r_354_367 + s_354_367 <=s (const 64 (2**20)),
    r_354_367 - s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 + s_354_367 <=s (const 64 (2**20)),
    (const 64 0) - r_354_367 - s_354_367 <=s (const 64 (2**20)),
    u_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_354_367 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_354_367 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step13

// premise c
assume
g_354_low60_0_low20_13 = 1 (mod 2)
&&
g_354_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_14 g_354_low60_0_low20_13;
mov u_354_368 r_354_367;
mov v_354_368 s_354_367;

subs dc g_354_low60_0_low20_14 g_354_low60_0_low20_13 f_354_low60_0_low20_13;
asr g_354_low60_0_low20_14 g_354_low60_0_low20_14 1;
subs dc r_354_368 r_354_367 u_354_367;
asr r_354_368 r_354_368 1;
subs dc s_354_368 s_354_367 v_354_367;
asr s_354_368 s_354_368 1;
assert
    true
&&
    f_354_low60_0_low20_14 = g_354_low60_0_low20_13,
    u_354_368 = r_354_367,
    v_354_368 = s_354_367,
    g_354_low60_0_low20_14 * (const 64 2) = g_354_low60_0_low20_13 - f_354_low60_0_low20_13,
    r_354_368 * (const 64 2) = r_354_367 - u_354_367,
    s_354_368 * (const 64 2) = s_354_367 - v_354_367
;

assume
    f_354_low60_0_low20_14 = g_354_low60_0_low20_13,
    u_354_368 = r_354_367,
    v_354_368 = s_354_367,
    g_354_low60_0_low20_14 * 2 = g_354_low60_0_low20_13 - f_354_low60_0_low20_13,
    r_354_368 * 2 = r_354_367 - u_354_367,
    s_354_368 * 2 = s_354_367 - v_354_367
&&
    true
;

{
    u_354_368 * f_354_low60_0_low20_0 + v_354_368 * g_354_low60_0_low20_0 = f_354_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_368 * f_354_low60_0_low20_0 + s_354_368 * g_354_low60_0_low20_0 = g_354_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_14 + u_354_368 * (const 64 (2**21)) + v_354_368 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_14 + r_354_368 * (const 64 (2**21)) + s_354_368 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_14,
    f_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_14,
    g_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 368)) <=s delta, delta <=s (const 64 (1 + 2*368)),
    (const 64 (-(2**20))) <=s u_354_368, u_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_368, v_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_368, r_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_368, s_354_368 <=s (const 64 ((2**20))),
    u_354_368 + v_354_368 <=s (const 64 (2**20)),
    u_354_368 - v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 + v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 - v_354_368 <=s (const 64 (2**20)),
    r_354_368 + s_354_368 <=s (const 64 (2**20)),
    r_354_368 - s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 + s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 - s_354_368 <=s (const 64 (2**20)),
    u_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_354_368 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_368_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_14,
sint64 g_354_low60_0_low20_14,
sint64 f_354_low60_0_low20_15,
sint64 g_354_low60_0_low20_15,
sint64 u_354_368,
sint64 v_354_368,
sint64 r_354_368,
sint64 s_354_368,
sint64 u_354_369,
sint64 v_354_369,
sint64 r_354_369,
sint64 s_354_369,
bit ne
)={
    u_354_368 * f_354_low60_0_low20_0 + v_354_368 * g_354_low60_0_low20_0 = f_354_low60_0_low20_14 * (-(2**20)),
    r_354_368 * f_354_low60_0_low20_0 + s_354_368 * g_354_low60_0_low20_0 = g_354_low60_0_low20_14 * (-(2**20))
&&
    u_354_368 * f_354_low60_0_low20_0 + v_354_368 * g_354_low60_0_low20_0 = f_354_low60_0_low20_14 * (const 64 (-(2**20))),
    r_354_368 * f_354_low60_0_low20_0 + s_354_368 * g_354_low60_0_low20_0 = g_354_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_14 + u_354_368 * (const 64 (2**21)) + v_354_368 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_14 + r_354_368 * (const 64 (2**21)) + s_354_368 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_14,
    f_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_14,
    g_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 368)) <=s delta, delta <=s (const 64 (1 + 2*368)),
    (const 64 (-(2**20))) <=s u_354_368, u_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_368, v_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_368, r_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_368, s_354_368 <=s (const 64 ((2**20))),
    u_354_368 + v_354_368 <=s (const 64 (2**20)),
    u_354_368 - v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 + v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 - v_354_368 <=s (const 64 (2**20)),
    r_354_368 + s_354_368 <=s (const 64 (2**20)),
    r_354_368 - s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 + s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 - s_354_368 <=s (const 64 (2**20)),
    u_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_354_368 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step14

// premise a
assume
g_354_low60_0_low20_14 = 0 (mod 2)
&&
g_354_low60_0_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_15 f_354_low60_0_low20_14;
mov u_354_369 u_354_368;
mov v_354_369 v_354_368;

asr g_354_low60_0_low20_15 g_354_low60_0_low20_14 1;
asr r_354_369 r_354_368 1;
asr s_354_369 s_354_368 1;
assert
    true
&&
    f_354_low60_0_low20_15 = f_354_low60_0_low20_14,
    u_354_369 = u_354_368,
    v_354_369 = v_354_368,
    g_354_low60_0_low20_15 * (const 64 2) = g_354_low60_0_low20_14,
    r_354_369 * (const 64 2) = r_354_368,
    s_354_369 * (const 64 2) = s_354_368
;

assume
    f_354_low60_0_low20_15 = f_354_low60_0_low20_14,
    u_354_369 = u_354_368,
    v_354_369 = v_354_368,
    g_354_low60_0_low20_15 * 2 = g_354_low60_0_low20_14,
    r_354_369 * 2 = r_354_368,
    s_354_369 * 2 = s_354_368
&&
    true
;

{
    u_354_369 * f_354_low60_0_low20_0 + v_354_369 * g_354_low60_0_low20_0 = f_354_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_369 * f_354_low60_0_low20_0 + s_354_369 * g_354_low60_0_low20_0 = g_354_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_15 + u_354_369 * (const 64 (2**21)) + v_354_369 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_15 + r_354_369 * (const 64 (2**21)) + s_354_369 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_15,
    f_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_15,
    g_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 369)) <=s delta, delta <=s (const 64 (1 + 2*369)),
    (const 64 (-(2**20))) <=s u_354_369, u_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_369, v_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_369, r_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_369, s_354_369 <=s (const 64 ((2**20))),
    u_354_369 + v_354_369 <=s (const 64 (2**20)),
    u_354_369 - v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 + v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 - v_354_369 <=s (const 64 (2**20)),
    r_354_369 + s_354_369 <=s (const 64 (2**20)),
    r_354_369 - s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 + s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 - s_354_369 <=s (const 64 (2**20)),
    u_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_354_369 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_368_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_14,
sint64 g_354_low60_0_low20_14,
sint64 f_354_low60_0_low20_15,
sint64 g_354_low60_0_low20_15,
sint64 u_354_368,
sint64 v_354_368,
sint64 r_354_368,
sint64 s_354_368,
sint64 u_354_369,
sint64 v_354_369,
sint64 r_354_369,
sint64 s_354_369,
bit ne
)={
    u_354_368 * f_354_low60_0_low20_0 + v_354_368 * g_354_low60_0_low20_0 = f_354_low60_0_low20_14 * (-(2**20)),
    r_354_368 * f_354_low60_0_low20_0 + s_354_368 * g_354_low60_0_low20_0 = g_354_low60_0_low20_14 * (-(2**20))
&&
    u_354_368 * f_354_low60_0_low20_0 + v_354_368 * g_354_low60_0_low20_0 = f_354_low60_0_low20_14 * (const 64 (-(2**20))),
    r_354_368 * f_354_low60_0_low20_0 + s_354_368 * g_354_low60_0_low20_0 = g_354_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_14 + u_354_368 * (const 64 (2**21)) + v_354_368 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_14 + r_354_368 * (const 64 (2**21)) + s_354_368 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_14,
    f_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_14,
    g_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 368)) <=s delta, delta <=s (const 64 (1 + 2*368)),
    (const 64 (-(2**20))) <=s u_354_368, u_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_368, v_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_368, r_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_368, s_354_368 <=s (const 64 ((2**20))),
    u_354_368 + v_354_368 <=s (const 64 (2**20)),
    u_354_368 - v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 + v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 - v_354_368 <=s (const 64 (2**20)),
    r_354_368 + s_354_368 <=s (const 64 (2**20)),
    r_354_368 - s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 + s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 - s_354_368 <=s (const 64 (2**20)),
    u_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_354_368 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step14

// premise b
assume
g_354_low60_0_low20_14 = 1 (mod 2)
&&
g_354_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_15 f_354_low60_0_low20_14;
mov u_354_369 u_354_368;
mov v_354_369 v_354_368;

add g_354_low60_0_low20_15 g_354_low60_0_low20_14 f_354_low60_0_low20_14;
asr g_354_low60_0_low20_15 g_354_low60_0_low20_15 1;
add r_354_369 r_354_368 u_354_368;
asr r_354_369 r_354_369 1;
add s_354_369 s_354_368 v_354_368;
asr s_354_369 s_354_369 1;
assert
    true
&&
    f_354_low60_0_low20_15 = f_354_low60_0_low20_14,
    u_354_369 = u_354_368,
    v_354_369 = v_354_368,
    g_354_low60_0_low20_15 * (const 64 2) = g_354_low60_0_low20_14 + f_354_low60_0_low20_14,
    r_354_369 * (const 64 2) = r_354_368 + u_354_368,
    s_354_369 * (const 64 2) = s_354_368 + v_354_368
;

assume
    f_354_low60_0_low20_15 = f_354_low60_0_low20_14,
    u_354_369 = u_354_368,
    v_354_369 = v_354_368,
    g_354_low60_0_low20_15 * 2 = g_354_low60_0_low20_14 + f_354_low60_0_low20_14,
    r_354_369 * 2 = r_354_368 + u_354_368,
    s_354_369 * 2 = s_354_368 + v_354_368
&&
    true
;

{
    u_354_369 * f_354_low60_0_low20_0 + v_354_369 * g_354_low60_0_low20_0 = f_354_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_369 * f_354_low60_0_low20_0 + s_354_369 * g_354_low60_0_low20_0 = g_354_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_15 + u_354_369 * (const 64 (2**21)) + v_354_369 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_15 + r_354_369 * (const 64 (2**21)) + s_354_369 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_15,
    f_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_15,
    g_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 369)) <=s delta, delta <=s (const 64 (1 + 2*369)),
    (const 64 (-(2**20))) <=s u_354_369, u_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_369, v_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_369, r_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_369, s_354_369 <=s (const 64 ((2**20))),
    u_354_369 + v_354_369 <=s (const 64 (2**20)),
    u_354_369 - v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 + v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 - v_354_369 <=s (const 64 (2**20)),
    r_354_369 + s_354_369 <=s (const 64 (2**20)),
    r_354_369 - s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 + s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 - s_354_369 <=s (const 64 (2**20)),
    u_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_354_369 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_368_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_14,
sint64 g_354_low60_0_low20_14,
sint64 f_354_low60_0_low20_15,
sint64 g_354_low60_0_low20_15,
sint64 u_354_368,
sint64 v_354_368,
sint64 r_354_368,
sint64 s_354_368,
sint64 u_354_369,
sint64 v_354_369,
sint64 r_354_369,
sint64 s_354_369,
bit ne
)={
    u_354_368 * f_354_low60_0_low20_0 + v_354_368 * g_354_low60_0_low20_0 = f_354_low60_0_low20_14 * (-(2**20)),
    r_354_368 * f_354_low60_0_low20_0 + s_354_368 * g_354_low60_0_low20_0 = g_354_low60_0_low20_14 * (-(2**20))
&&
    u_354_368 * f_354_low60_0_low20_0 + v_354_368 * g_354_low60_0_low20_0 = f_354_low60_0_low20_14 * (const 64 (-(2**20))),
    r_354_368 * f_354_low60_0_low20_0 + s_354_368 * g_354_low60_0_low20_0 = g_354_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_14 + u_354_368 * (const 64 (2**21)) + v_354_368 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_14 + r_354_368 * (const 64 (2**21)) + s_354_368 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_14,
    f_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_14,
    g_354_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 368)) <=s delta, delta <=s (const 64 (1 + 2*368)),
    (const 64 (-(2**20))) <=s u_354_368, u_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_368, v_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_368, r_354_368 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_368, s_354_368 <=s (const 64 ((2**20))),
    u_354_368 + v_354_368 <=s (const 64 (2**20)),
    u_354_368 - v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 + v_354_368 <=s (const 64 (2**20)),
    (const 64 0) - u_354_368 - v_354_368 <=s (const 64 (2**20)),
    r_354_368 + s_354_368 <=s (const 64 (2**20)),
    r_354_368 - s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 + s_354_368 <=s (const 64 (2**20)),
    (const 64 0) - r_354_368 - s_354_368 <=s (const 64 (2**20)),
    u_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_354_368 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_354_368 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step14

// premise c
assume
g_354_low60_0_low20_14 = 1 (mod 2)
&&
g_354_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_15 g_354_low60_0_low20_14;
mov u_354_369 r_354_368;
mov v_354_369 s_354_368;

subs dc g_354_low60_0_low20_15 g_354_low60_0_low20_14 f_354_low60_0_low20_14;
asr g_354_low60_0_low20_15 g_354_low60_0_low20_15 1;
subs dc r_354_369 r_354_368 u_354_368;
asr r_354_369 r_354_369 1;
subs dc s_354_369 s_354_368 v_354_368;
asr s_354_369 s_354_369 1;
assert
    true
&&
    f_354_low60_0_low20_15 = g_354_low60_0_low20_14,
    u_354_369 = r_354_368,
    v_354_369 = s_354_368,
    g_354_low60_0_low20_15 * (const 64 2) = g_354_low60_0_low20_14 - f_354_low60_0_low20_14,
    r_354_369 * (const 64 2) = r_354_368 - u_354_368,
    s_354_369 * (const 64 2) = s_354_368 - v_354_368
;

assume
    f_354_low60_0_low20_15 = g_354_low60_0_low20_14,
    u_354_369 = r_354_368,
    v_354_369 = s_354_368,
    g_354_low60_0_low20_15 * 2 = g_354_low60_0_low20_14 - f_354_low60_0_low20_14,
    r_354_369 * 2 = r_354_368 - u_354_368,
    s_354_369 * 2 = s_354_368 - v_354_368
&&
    true
;

{
    u_354_369 * f_354_low60_0_low20_0 + v_354_369 * g_354_low60_0_low20_0 = f_354_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_369 * f_354_low60_0_low20_0 + s_354_369 * g_354_low60_0_low20_0 = g_354_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_15 + u_354_369 * (const 64 (2**21)) + v_354_369 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_15 + r_354_369 * (const 64 (2**21)) + s_354_369 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_15,
    f_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_15,
    g_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 369)) <=s delta, delta <=s (const 64 (1 + 2*369)),
    (const 64 (-(2**20))) <=s u_354_369, u_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_369, v_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_369, r_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_369, s_354_369 <=s (const 64 ((2**20))),
    u_354_369 + v_354_369 <=s (const 64 (2**20)),
    u_354_369 - v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 + v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 - v_354_369 <=s (const 64 (2**20)),
    r_354_369 + s_354_369 <=s (const 64 (2**20)),
    r_354_369 - s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 + s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 - s_354_369 <=s (const 64 (2**20)),
    u_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_354_369 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_369_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_15,
sint64 g_354_low60_0_low20_15,
sint64 f_354_low60_0_low20_16,
sint64 g_354_low60_0_low20_16,
sint64 u_354_369,
sint64 v_354_369,
sint64 r_354_369,
sint64 s_354_369,
sint64 u_354_370,
sint64 v_354_370,
sint64 r_354_370,
sint64 s_354_370,
bit ne
)={
    u_354_369 * f_354_low60_0_low20_0 + v_354_369 * g_354_low60_0_low20_0 = f_354_low60_0_low20_15 * (-(2**20)),
    r_354_369 * f_354_low60_0_low20_0 + s_354_369 * g_354_low60_0_low20_0 = g_354_low60_0_low20_15 * (-(2**20))
&&
    u_354_369 * f_354_low60_0_low20_0 + v_354_369 * g_354_low60_0_low20_0 = f_354_low60_0_low20_15 * (const 64 (-(2**20))),
    r_354_369 * f_354_low60_0_low20_0 + s_354_369 * g_354_low60_0_low20_0 = g_354_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_15 + u_354_369 * (const 64 (2**21)) + v_354_369 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_15 + r_354_369 * (const 64 (2**21)) + s_354_369 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_15,
    f_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_15,
    g_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 369)) <=s delta, delta <=s (const 64 (1 + 2*369)),
    (const 64 (-(2**20))) <=s u_354_369, u_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_369, v_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_369, r_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_369, s_354_369 <=s (const 64 ((2**20))),
    u_354_369 + v_354_369 <=s (const 64 (2**20)),
    u_354_369 - v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 + v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 - v_354_369 <=s (const 64 (2**20)),
    r_354_369 + s_354_369 <=s (const 64 (2**20)),
    r_354_369 - s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 + s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 - s_354_369 <=s (const 64 (2**20)),
    u_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_354_369 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step15

// premise a
assume
g_354_low60_0_low20_15 = 0 (mod 2)
&&
g_354_low60_0_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_16 f_354_low60_0_low20_15;
mov u_354_370 u_354_369;
mov v_354_370 v_354_369;

asr g_354_low60_0_low20_16 g_354_low60_0_low20_15 1;
asr r_354_370 r_354_369 1;
asr s_354_370 s_354_369 1;
assert
    true
&&
    f_354_low60_0_low20_16 = f_354_low60_0_low20_15,
    u_354_370 = u_354_369,
    v_354_370 = v_354_369,
    g_354_low60_0_low20_16 * (const 64 2) = g_354_low60_0_low20_15,
    r_354_370 * (const 64 2) = r_354_369,
    s_354_370 * (const 64 2) = s_354_369
;

assume
    f_354_low60_0_low20_16 = f_354_low60_0_low20_15,
    u_354_370 = u_354_369,
    v_354_370 = v_354_369,
    g_354_low60_0_low20_16 * 2 = g_354_low60_0_low20_15,
    r_354_370 * 2 = r_354_369,
    s_354_370 * 2 = s_354_369
&&
    true
;

{
    u_354_370 * f_354_low60_0_low20_0 + v_354_370 * g_354_low60_0_low20_0 = f_354_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_370 * f_354_low60_0_low20_0 + s_354_370 * g_354_low60_0_low20_0 = g_354_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_16 + u_354_370 * (const 64 (2**21)) + v_354_370 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_16 + r_354_370 * (const 64 (2**21)) + s_354_370 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_16,
    f_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_16,
    g_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 370)) <=s delta, delta <=s (const 64 (1 + 2*370)),
    (const 64 (-(2**20))) <=s u_354_370, u_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_370, v_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_370, r_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_370, s_354_370 <=s (const 64 ((2**20))),
    u_354_370 + v_354_370 <=s (const 64 (2**20)),
    u_354_370 - v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 + v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 - v_354_370 <=s (const 64 (2**20)),
    r_354_370 + s_354_370 <=s (const 64 (2**20)),
    r_354_370 - s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 + s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 - s_354_370 <=s (const 64 (2**20)),
    u_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_354_370 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_369_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_15,
sint64 g_354_low60_0_low20_15,
sint64 f_354_low60_0_low20_16,
sint64 g_354_low60_0_low20_16,
sint64 u_354_369,
sint64 v_354_369,
sint64 r_354_369,
sint64 s_354_369,
sint64 u_354_370,
sint64 v_354_370,
sint64 r_354_370,
sint64 s_354_370,
bit ne
)={
    u_354_369 * f_354_low60_0_low20_0 + v_354_369 * g_354_low60_0_low20_0 = f_354_low60_0_low20_15 * (-(2**20)),
    r_354_369 * f_354_low60_0_low20_0 + s_354_369 * g_354_low60_0_low20_0 = g_354_low60_0_low20_15 * (-(2**20))
&&
    u_354_369 * f_354_low60_0_low20_0 + v_354_369 * g_354_low60_0_low20_0 = f_354_low60_0_low20_15 * (const 64 (-(2**20))),
    r_354_369 * f_354_low60_0_low20_0 + s_354_369 * g_354_low60_0_low20_0 = g_354_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_15 + u_354_369 * (const 64 (2**21)) + v_354_369 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_15 + r_354_369 * (const 64 (2**21)) + s_354_369 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_15,
    f_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_15,
    g_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 369)) <=s delta, delta <=s (const 64 (1 + 2*369)),
    (const 64 (-(2**20))) <=s u_354_369, u_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_369, v_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_369, r_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_369, s_354_369 <=s (const 64 ((2**20))),
    u_354_369 + v_354_369 <=s (const 64 (2**20)),
    u_354_369 - v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 + v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 - v_354_369 <=s (const 64 (2**20)),
    r_354_369 + s_354_369 <=s (const 64 (2**20)),
    r_354_369 - s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 + s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 - s_354_369 <=s (const 64 (2**20)),
    u_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_354_369 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step15

// premise b
assume
g_354_low60_0_low20_15 = 1 (mod 2)
&&
g_354_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_16 f_354_low60_0_low20_15;
mov u_354_370 u_354_369;
mov v_354_370 v_354_369;

add g_354_low60_0_low20_16 g_354_low60_0_low20_15 f_354_low60_0_low20_15;
asr g_354_low60_0_low20_16 g_354_low60_0_low20_16 1;
add r_354_370 r_354_369 u_354_369;
asr r_354_370 r_354_370 1;
add s_354_370 s_354_369 v_354_369;
asr s_354_370 s_354_370 1;
assert
    true
&&
    f_354_low60_0_low20_16 = f_354_low60_0_low20_15,
    u_354_370 = u_354_369,
    v_354_370 = v_354_369,
    g_354_low60_0_low20_16 * (const 64 2) = g_354_low60_0_low20_15 + f_354_low60_0_low20_15,
    r_354_370 * (const 64 2) = r_354_369 + u_354_369,
    s_354_370 * (const 64 2) = s_354_369 + v_354_369
;

assume
    f_354_low60_0_low20_16 = f_354_low60_0_low20_15,
    u_354_370 = u_354_369,
    v_354_370 = v_354_369,
    g_354_low60_0_low20_16 * 2 = g_354_low60_0_low20_15 + f_354_low60_0_low20_15,
    r_354_370 * 2 = r_354_369 + u_354_369,
    s_354_370 * 2 = s_354_369 + v_354_369
&&
    true
;

{
    u_354_370 * f_354_low60_0_low20_0 + v_354_370 * g_354_low60_0_low20_0 = f_354_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_370 * f_354_low60_0_low20_0 + s_354_370 * g_354_low60_0_low20_0 = g_354_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_16 + u_354_370 * (const 64 (2**21)) + v_354_370 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_16 + r_354_370 * (const 64 (2**21)) + s_354_370 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_16,
    f_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_16,
    g_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 370)) <=s delta, delta <=s (const 64 (1 + 2*370)),
    (const 64 (-(2**20))) <=s u_354_370, u_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_370, v_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_370, r_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_370, s_354_370 <=s (const 64 ((2**20))),
    u_354_370 + v_354_370 <=s (const 64 (2**20)),
    u_354_370 - v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 + v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 - v_354_370 <=s (const 64 (2**20)),
    r_354_370 + s_354_370 <=s (const 64 (2**20)),
    r_354_370 - s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 + s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 - s_354_370 <=s (const 64 (2**20)),
    u_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_354_370 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_369_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_15,
sint64 g_354_low60_0_low20_15,
sint64 f_354_low60_0_low20_16,
sint64 g_354_low60_0_low20_16,
sint64 u_354_369,
sint64 v_354_369,
sint64 r_354_369,
sint64 s_354_369,
sint64 u_354_370,
sint64 v_354_370,
sint64 r_354_370,
sint64 s_354_370,
bit ne
)={
    u_354_369 * f_354_low60_0_low20_0 + v_354_369 * g_354_low60_0_low20_0 = f_354_low60_0_low20_15 * (-(2**20)),
    r_354_369 * f_354_low60_0_low20_0 + s_354_369 * g_354_low60_0_low20_0 = g_354_low60_0_low20_15 * (-(2**20))
&&
    u_354_369 * f_354_low60_0_low20_0 + v_354_369 * g_354_low60_0_low20_0 = f_354_low60_0_low20_15 * (const 64 (-(2**20))),
    r_354_369 * f_354_low60_0_low20_0 + s_354_369 * g_354_low60_0_low20_0 = g_354_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_15 + u_354_369 * (const 64 (2**21)) + v_354_369 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_15 + r_354_369 * (const 64 (2**21)) + s_354_369 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_15,
    f_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_15,
    g_354_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 369)) <=s delta, delta <=s (const 64 (1 + 2*369)),
    (const 64 (-(2**20))) <=s u_354_369, u_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_369, v_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_369, r_354_369 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_369, s_354_369 <=s (const 64 ((2**20))),
    u_354_369 + v_354_369 <=s (const 64 (2**20)),
    u_354_369 - v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 + v_354_369 <=s (const 64 (2**20)),
    (const 64 0) - u_354_369 - v_354_369 <=s (const 64 (2**20)),
    r_354_369 + s_354_369 <=s (const 64 (2**20)),
    r_354_369 - s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 + s_354_369 <=s (const 64 (2**20)),
    (const 64 0) - r_354_369 - s_354_369 <=s (const 64 (2**20)),
    u_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_354_369 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_354_369 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step15

// premise c
assume
g_354_low60_0_low20_15 = 1 (mod 2)
&&
g_354_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_16 g_354_low60_0_low20_15;
mov u_354_370 r_354_369;
mov v_354_370 s_354_369;

subs dc g_354_low60_0_low20_16 g_354_low60_0_low20_15 f_354_low60_0_low20_15;
asr g_354_low60_0_low20_16 g_354_low60_0_low20_16 1;
subs dc r_354_370 r_354_369 u_354_369;
asr r_354_370 r_354_370 1;
subs dc s_354_370 s_354_369 v_354_369;
asr s_354_370 s_354_370 1;
assert
    true
&&
    f_354_low60_0_low20_16 = g_354_low60_0_low20_15,
    u_354_370 = r_354_369,
    v_354_370 = s_354_369,
    g_354_low60_0_low20_16 * (const 64 2) = g_354_low60_0_low20_15 - f_354_low60_0_low20_15,
    r_354_370 * (const 64 2) = r_354_369 - u_354_369,
    s_354_370 * (const 64 2) = s_354_369 - v_354_369
;

assume
    f_354_low60_0_low20_16 = g_354_low60_0_low20_15,
    u_354_370 = r_354_369,
    v_354_370 = s_354_369,
    g_354_low60_0_low20_16 * 2 = g_354_low60_0_low20_15 - f_354_low60_0_low20_15,
    r_354_370 * 2 = r_354_369 - u_354_369,
    s_354_370 * 2 = s_354_369 - v_354_369
&&
    true
;

{
    u_354_370 * f_354_low60_0_low20_0 + v_354_370 * g_354_low60_0_low20_0 = f_354_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_370 * f_354_low60_0_low20_0 + s_354_370 * g_354_low60_0_low20_0 = g_354_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_16 + u_354_370 * (const 64 (2**21)) + v_354_370 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_16 + r_354_370 * (const 64 (2**21)) + s_354_370 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_16,
    f_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_16,
    g_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 370)) <=s delta, delta <=s (const 64 (1 + 2*370)),
    (const 64 (-(2**20))) <=s u_354_370, u_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_370, v_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_370, r_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_370, s_354_370 <=s (const 64 ((2**20))),
    u_354_370 + v_354_370 <=s (const 64 (2**20)),
    u_354_370 - v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 + v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 - v_354_370 <=s (const 64 (2**20)),
    r_354_370 + s_354_370 <=s (const 64 (2**20)),
    r_354_370 - s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 + s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 - s_354_370 <=s (const 64 (2**20)),
    u_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_354_370 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_370_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_16,
sint64 g_354_low60_0_low20_16,
sint64 f_354_low60_0_low20_17,
sint64 g_354_low60_0_low20_17,
sint64 u_354_370,
sint64 v_354_370,
sint64 r_354_370,
sint64 s_354_370,
sint64 u_354_371,
sint64 v_354_371,
sint64 r_354_371,
sint64 s_354_371,
bit ne
)={
    u_354_370 * f_354_low60_0_low20_0 + v_354_370 * g_354_low60_0_low20_0 = f_354_low60_0_low20_16 * (-(2**20)),
    r_354_370 * f_354_low60_0_low20_0 + s_354_370 * g_354_low60_0_low20_0 = g_354_low60_0_low20_16 * (-(2**20))
&&
    u_354_370 * f_354_low60_0_low20_0 + v_354_370 * g_354_low60_0_low20_0 = f_354_low60_0_low20_16 * (const 64 (-(2**20))),
    r_354_370 * f_354_low60_0_low20_0 + s_354_370 * g_354_low60_0_low20_0 = g_354_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_16 + u_354_370 * (const 64 (2**21)) + v_354_370 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_16 + r_354_370 * (const 64 (2**21)) + s_354_370 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_16,
    f_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_16,
    g_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 370)) <=s delta, delta <=s (const 64 (1 + 2*370)),
    (const 64 (-(2**20))) <=s u_354_370, u_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_370, v_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_370, r_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_370, s_354_370 <=s (const 64 ((2**20))),
    u_354_370 + v_354_370 <=s (const 64 (2**20)),
    u_354_370 - v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 + v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 - v_354_370 <=s (const 64 (2**20)),
    r_354_370 + s_354_370 <=s (const 64 (2**20)),
    r_354_370 - s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 + s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 - s_354_370 <=s (const 64 (2**20)),
    u_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_354_370 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step16

// premise a
assume
g_354_low60_0_low20_16 = 0 (mod 2)
&&
g_354_low60_0_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_17 f_354_low60_0_low20_16;
mov u_354_371 u_354_370;
mov v_354_371 v_354_370;

asr g_354_low60_0_low20_17 g_354_low60_0_low20_16 1;
asr r_354_371 r_354_370 1;
asr s_354_371 s_354_370 1;
assert
    true
&&
    f_354_low60_0_low20_17 = f_354_low60_0_low20_16,
    u_354_371 = u_354_370,
    v_354_371 = v_354_370,
    g_354_low60_0_low20_17 * (const 64 2) = g_354_low60_0_low20_16,
    r_354_371 * (const 64 2) = r_354_370,
    s_354_371 * (const 64 2) = s_354_370
;

assume
    f_354_low60_0_low20_17 = f_354_low60_0_low20_16,
    u_354_371 = u_354_370,
    v_354_371 = v_354_370,
    g_354_low60_0_low20_17 * 2 = g_354_low60_0_low20_16,
    r_354_371 * 2 = r_354_370,
    s_354_371 * 2 = s_354_370
&&
    true
;

{
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_17 + u_354_371 * (const 64 (2**21)) + v_354_371 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_17 + r_354_371 * (const 64 (2**21)) + s_354_371 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_17,
    f_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_17,
    g_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 371)) <=s delta, delta <=s (const 64 (1 + 2*371)),
    (const 64 (-(2**20))) <=s u_354_371, u_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_371, v_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_371, r_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_371, s_354_371 <=s (const 64 ((2**20))),
    u_354_371 + v_354_371 <=s (const 64 (2**20)),
    u_354_371 - v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 + v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 - v_354_371 <=s (const 64 (2**20)),
    r_354_371 + s_354_371 <=s (const 64 (2**20)),
    r_354_371 - s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 + s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 - s_354_371 <=s (const 64 (2**20)),
    u_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_354_371 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_370_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_16,
sint64 g_354_low60_0_low20_16,
sint64 f_354_low60_0_low20_17,
sint64 g_354_low60_0_low20_17,
sint64 u_354_370,
sint64 v_354_370,
sint64 r_354_370,
sint64 s_354_370,
sint64 u_354_371,
sint64 v_354_371,
sint64 r_354_371,
sint64 s_354_371,
bit ne
)={
    u_354_370 * f_354_low60_0_low20_0 + v_354_370 * g_354_low60_0_low20_0 = f_354_low60_0_low20_16 * (-(2**20)),
    r_354_370 * f_354_low60_0_low20_0 + s_354_370 * g_354_low60_0_low20_0 = g_354_low60_0_low20_16 * (-(2**20))
&&
    u_354_370 * f_354_low60_0_low20_0 + v_354_370 * g_354_low60_0_low20_0 = f_354_low60_0_low20_16 * (const 64 (-(2**20))),
    r_354_370 * f_354_low60_0_low20_0 + s_354_370 * g_354_low60_0_low20_0 = g_354_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_16 + u_354_370 * (const 64 (2**21)) + v_354_370 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_16 + r_354_370 * (const 64 (2**21)) + s_354_370 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_16,
    f_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_16,
    g_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 370)) <=s delta, delta <=s (const 64 (1 + 2*370)),
    (const 64 (-(2**20))) <=s u_354_370, u_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_370, v_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_370, r_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_370, s_354_370 <=s (const 64 ((2**20))),
    u_354_370 + v_354_370 <=s (const 64 (2**20)),
    u_354_370 - v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 + v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 - v_354_370 <=s (const 64 (2**20)),
    r_354_370 + s_354_370 <=s (const 64 (2**20)),
    r_354_370 - s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 + s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 - s_354_370 <=s (const 64 (2**20)),
    u_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_354_370 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step16

// premise b
assume
g_354_low60_0_low20_16 = 1 (mod 2)
&&
g_354_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_17 f_354_low60_0_low20_16;
mov u_354_371 u_354_370;
mov v_354_371 v_354_370;

add g_354_low60_0_low20_17 g_354_low60_0_low20_16 f_354_low60_0_low20_16;
asr g_354_low60_0_low20_17 g_354_low60_0_low20_17 1;
add r_354_371 r_354_370 u_354_370;
asr r_354_371 r_354_371 1;
add s_354_371 s_354_370 v_354_370;
asr s_354_371 s_354_371 1;
assert
    true
&&
    f_354_low60_0_low20_17 = f_354_low60_0_low20_16,
    u_354_371 = u_354_370,
    v_354_371 = v_354_370,
    g_354_low60_0_low20_17 * (const 64 2) = g_354_low60_0_low20_16 + f_354_low60_0_low20_16,
    r_354_371 * (const 64 2) = r_354_370 + u_354_370,
    s_354_371 * (const 64 2) = s_354_370 + v_354_370
;

assume
    f_354_low60_0_low20_17 = f_354_low60_0_low20_16,
    u_354_371 = u_354_370,
    v_354_371 = v_354_370,
    g_354_low60_0_low20_17 * 2 = g_354_low60_0_low20_16 + f_354_low60_0_low20_16,
    r_354_371 * 2 = r_354_370 + u_354_370,
    s_354_371 * 2 = s_354_370 + v_354_370
&&
    true
;

{
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_17 + u_354_371 * (const 64 (2**21)) + v_354_371 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_17 + r_354_371 * (const 64 (2**21)) + s_354_371 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_17,
    f_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_17,
    g_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 371)) <=s delta, delta <=s (const 64 (1 + 2*371)),
    (const 64 (-(2**20))) <=s u_354_371, u_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_371, v_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_371, r_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_371, s_354_371 <=s (const 64 ((2**20))),
    u_354_371 + v_354_371 <=s (const 64 (2**20)),
    u_354_371 - v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 + v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 - v_354_371 <=s (const 64 (2**20)),
    r_354_371 + s_354_371 <=s (const 64 (2**20)),
    r_354_371 - s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 + s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 - s_354_371 <=s (const 64 (2**20)),
    u_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_354_371 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_370_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_16,
sint64 g_354_low60_0_low20_16,
sint64 f_354_low60_0_low20_17,
sint64 g_354_low60_0_low20_17,
sint64 u_354_370,
sint64 v_354_370,
sint64 r_354_370,
sint64 s_354_370,
sint64 u_354_371,
sint64 v_354_371,
sint64 r_354_371,
sint64 s_354_371,
bit ne
)={
    u_354_370 * f_354_low60_0_low20_0 + v_354_370 * g_354_low60_0_low20_0 = f_354_low60_0_low20_16 * (-(2**20)),
    r_354_370 * f_354_low60_0_low20_0 + s_354_370 * g_354_low60_0_low20_0 = g_354_low60_0_low20_16 * (-(2**20))
&&
    u_354_370 * f_354_low60_0_low20_0 + v_354_370 * g_354_low60_0_low20_0 = f_354_low60_0_low20_16 * (const 64 (-(2**20))),
    r_354_370 * f_354_low60_0_low20_0 + s_354_370 * g_354_low60_0_low20_0 = g_354_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_16 + u_354_370 * (const 64 (2**21)) + v_354_370 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_16 + r_354_370 * (const 64 (2**21)) + s_354_370 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_16,
    f_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_16,
    g_354_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 370)) <=s delta, delta <=s (const 64 (1 + 2*370)),
    (const 64 (-(2**20))) <=s u_354_370, u_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_370, v_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_370, r_354_370 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_370, s_354_370 <=s (const 64 ((2**20))),
    u_354_370 + v_354_370 <=s (const 64 (2**20)),
    u_354_370 - v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 + v_354_370 <=s (const 64 (2**20)),
    (const 64 0) - u_354_370 - v_354_370 <=s (const 64 (2**20)),
    r_354_370 + s_354_370 <=s (const 64 (2**20)),
    r_354_370 - s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 + s_354_370 <=s (const 64 (2**20)),
    (const 64 0) - r_354_370 - s_354_370 <=s (const 64 (2**20)),
    u_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_354_370 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_354_370 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step16

// premise c
assume
g_354_low60_0_low20_16 = 1 (mod 2)
&&
g_354_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_17 g_354_low60_0_low20_16;
mov u_354_371 r_354_370;
mov v_354_371 s_354_370;

subs dc g_354_low60_0_low20_17 g_354_low60_0_low20_16 f_354_low60_0_low20_16;
asr g_354_low60_0_low20_17 g_354_low60_0_low20_17 1;
subs dc r_354_371 r_354_370 u_354_370;
asr r_354_371 r_354_371 1;
subs dc s_354_371 s_354_370 v_354_370;
asr s_354_371 s_354_371 1;
assert
    true
&&
    f_354_low60_0_low20_17 = g_354_low60_0_low20_16,
    u_354_371 = r_354_370,
    v_354_371 = s_354_370,
    g_354_low60_0_low20_17 * (const 64 2) = g_354_low60_0_low20_16 - f_354_low60_0_low20_16,
    r_354_371 * (const 64 2) = r_354_370 - u_354_370,
    s_354_371 * (const 64 2) = s_354_370 - v_354_370
;

assume
    f_354_low60_0_low20_17 = g_354_low60_0_low20_16,
    u_354_371 = r_354_370,
    v_354_371 = s_354_370,
    g_354_low60_0_low20_17 * 2 = g_354_low60_0_low20_16 - f_354_low60_0_low20_16,
    r_354_371 * 2 = r_354_370 - u_354_370,
    s_354_371 * 2 = s_354_370 - v_354_370
&&
    true
;

{
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_17 + u_354_371 * (const 64 (2**21)) + v_354_371 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_17 + r_354_371 * (const 64 (2**21)) + s_354_371 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_17,
    f_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_17,
    g_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 371)) <=s delta, delta <=s (const 64 (1 + 2*371)),
    (const 64 (-(2**20))) <=s u_354_371, u_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_371, v_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_371, r_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_371, s_354_371 <=s (const 64 ((2**20))),
    u_354_371 + v_354_371 <=s (const 64 (2**20)),
    u_354_371 - v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 + v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 - v_354_371 <=s (const 64 (2**20)),
    r_354_371 + s_354_371 <=s (const 64 (2**20)),
    r_354_371 - s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 + s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 - s_354_371 <=s (const 64 (2**20)),
    u_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_354_371 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_371_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_17,
sint64 g_354_low60_0_low20_17,
sint64 f_354_low60_0_low20_18,
sint64 g_354_low60_0_low20_18,
sint64 u_354_371,
sint64 v_354_371,
sint64 r_354_371,
sint64 s_354_371,
sint64 u_354_372,
sint64 v_354_372,
sint64 r_354_372,
sint64 s_354_372,
bit ne
)={
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (-(2**20)),
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (-(2**20))
&&
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (const 64 (-(2**20))),
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_17 + u_354_371 * (const 64 (2**21)) + v_354_371 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_17 + r_354_371 * (const 64 (2**21)) + s_354_371 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_17,
    f_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_17,
    g_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 371)) <=s delta, delta <=s (const 64 (1 + 2*371)),
    (const 64 (-(2**20))) <=s u_354_371, u_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_371, v_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_371, r_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_371, s_354_371 <=s (const 64 ((2**20))),
    u_354_371 + v_354_371 <=s (const 64 (2**20)),
    u_354_371 - v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 + v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 - v_354_371 <=s (const 64 (2**20)),
    r_354_371 + s_354_371 <=s (const 64 (2**20)),
    r_354_371 - s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 + s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 - s_354_371 <=s (const 64 (2**20)),
    u_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_354_371 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step17

// premise a
assume
g_354_low60_0_low20_17 = 0 (mod 2)
&&
g_354_low60_0_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_18 f_354_low60_0_low20_17;
mov u_354_372 u_354_371;
mov v_354_372 v_354_371;

asr g_354_low60_0_low20_18 g_354_low60_0_low20_17 1;
asr r_354_372 r_354_371 1;
asr s_354_372 s_354_371 1;
assert
    true
&&
    f_354_low60_0_low20_18 = f_354_low60_0_low20_17,
    u_354_372 = u_354_371,
    v_354_372 = v_354_371,
    g_354_low60_0_low20_18 * (const 64 2) = g_354_low60_0_low20_17,
    r_354_372 * (const 64 2) = r_354_371,
    s_354_372 * (const 64 2) = s_354_371
;

assume
    f_354_low60_0_low20_18 = f_354_low60_0_low20_17,
    u_354_372 = u_354_371,
    v_354_372 = v_354_371,
    g_354_low60_0_low20_18 * 2 = g_354_low60_0_low20_17,
    r_354_372 * 2 = r_354_371,
    s_354_372 * 2 = s_354_371
&&
    true
;

{
    u_354_372 * f_354_low60_0_low20_0 + v_354_372 * g_354_low60_0_low20_0 = f_354_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_372 * f_354_low60_0_low20_0 + s_354_372 * g_354_low60_0_low20_0 = g_354_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_18 + u_354_372 * (const 64 (2**21)) + v_354_372 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_18 + r_354_372 * (const 64 (2**21)) + s_354_372 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_18,
    f_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_18,
    g_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 372)) <=s delta, delta <=s (const 64 (1 + 2*372)),
    (const 64 (-(2**20))) <=s u_354_372, u_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_372, v_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_372, r_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_372, s_354_372 <=s (const 64 ((2**20))),
    u_354_372 + v_354_372 <=s (const 64 (2**20)),
    u_354_372 - v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 + v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 - v_354_372 <=s (const 64 (2**20)),
    r_354_372 + s_354_372 <=s (const 64 (2**20)),
    r_354_372 - s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 + s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 - s_354_372 <=s (const 64 (2**20)),
    u_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_354_372 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_371_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_17,
sint64 g_354_low60_0_low20_17,
sint64 f_354_low60_0_low20_18,
sint64 g_354_low60_0_low20_18,
sint64 u_354_371,
sint64 v_354_371,
sint64 r_354_371,
sint64 s_354_371,
sint64 u_354_372,
sint64 v_354_372,
sint64 r_354_372,
sint64 s_354_372,
bit ne
)={
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (-(2**20)),
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (-(2**20))
&&
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (const 64 (-(2**20))),
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_17 + u_354_371 * (const 64 (2**21)) + v_354_371 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_17 + r_354_371 * (const 64 (2**21)) + s_354_371 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_17,
    f_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_17,
    g_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 371)) <=s delta, delta <=s (const 64 (1 + 2*371)),
    (const 64 (-(2**20))) <=s u_354_371, u_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_371, v_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_371, r_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_371, s_354_371 <=s (const 64 ((2**20))),
    u_354_371 + v_354_371 <=s (const 64 (2**20)),
    u_354_371 - v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 + v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 - v_354_371 <=s (const 64 (2**20)),
    r_354_371 + s_354_371 <=s (const 64 (2**20)),
    r_354_371 - s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 + s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 - s_354_371 <=s (const 64 (2**20)),
    u_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_354_371 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step17

// premise b
assume
g_354_low60_0_low20_17 = 1 (mod 2)
&&
g_354_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_18 f_354_low60_0_low20_17;
mov u_354_372 u_354_371;
mov v_354_372 v_354_371;

add g_354_low60_0_low20_18 g_354_low60_0_low20_17 f_354_low60_0_low20_17;
asr g_354_low60_0_low20_18 g_354_low60_0_low20_18 1;
add r_354_372 r_354_371 u_354_371;
asr r_354_372 r_354_372 1;
add s_354_372 s_354_371 v_354_371;
asr s_354_372 s_354_372 1;
assert
    true
&&
    f_354_low60_0_low20_18 = f_354_low60_0_low20_17,
    u_354_372 = u_354_371,
    v_354_372 = v_354_371,
    g_354_low60_0_low20_18 * (const 64 2) = g_354_low60_0_low20_17 + f_354_low60_0_low20_17,
    r_354_372 * (const 64 2) = r_354_371 + u_354_371,
    s_354_372 * (const 64 2) = s_354_371 + v_354_371
;

assume
    f_354_low60_0_low20_18 = f_354_low60_0_low20_17,
    u_354_372 = u_354_371,
    v_354_372 = v_354_371,
    g_354_low60_0_low20_18 * 2 = g_354_low60_0_low20_17 + f_354_low60_0_low20_17,
    r_354_372 * 2 = r_354_371 + u_354_371,
    s_354_372 * 2 = s_354_371 + v_354_371
&&
    true
;

{
    u_354_372 * f_354_low60_0_low20_0 + v_354_372 * g_354_low60_0_low20_0 = f_354_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_372 * f_354_low60_0_low20_0 + s_354_372 * g_354_low60_0_low20_0 = g_354_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_18 + u_354_372 * (const 64 (2**21)) + v_354_372 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_18 + r_354_372 * (const 64 (2**21)) + s_354_372 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_18,
    f_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_18,
    g_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 372)) <=s delta, delta <=s (const 64 (1 + 2*372)),
    (const 64 (-(2**20))) <=s u_354_372, u_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_372, v_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_372, r_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_372, s_354_372 <=s (const 64 ((2**20))),
    u_354_372 + v_354_372 <=s (const 64 (2**20)),
    u_354_372 - v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 + v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 - v_354_372 <=s (const 64 (2**20)),
    r_354_372 + s_354_372 <=s (const 64 (2**20)),
    r_354_372 - s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 + s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 - s_354_372 <=s (const 64 (2**20)),
    u_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_354_372 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_371_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_17,
sint64 g_354_low60_0_low20_17,
sint64 f_354_low60_0_low20_18,
sint64 g_354_low60_0_low20_18,
sint64 u_354_371,
sint64 v_354_371,
sint64 r_354_371,
sint64 s_354_371,
sint64 u_354_372,
sint64 v_354_372,
sint64 r_354_372,
sint64 s_354_372,
bit ne
)={
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (-(2**20)),
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (-(2**20))
&&
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (const 64 (-(2**20))),
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_17 + u_354_371 * (const 64 (2**21)) + v_354_371 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_17 + r_354_371 * (const 64 (2**21)) + s_354_371 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_17,
    f_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_17,
    g_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 371)) <=s delta, delta <=s (const 64 (1 + 2*371)),
    (const 64 (-(2**20))) <=s u_354_371, u_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_371, v_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_371, r_354_371 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_371, s_354_371 <=s (const 64 ((2**20))),
    u_354_371 + v_354_371 <=s (const 64 (2**20)),
    u_354_371 - v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 + v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 - v_354_371 <=s (const 64 (2**20)),
    r_354_371 + s_354_371 <=s (const 64 (2**20)),
    r_354_371 - s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 + s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 - s_354_371 <=s (const 64 (2**20)),
    u_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_354_371 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step17

// premise c
assume
g_354_low60_0_low20_17 = 1 (mod 2)
&&
g_354_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_18 g_354_low60_0_low20_17;
mov u_354_372 r_354_371;
mov v_354_372 s_354_371;

subs dc g_354_low60_0_low20_18 g_354_low60_0_low20_17 f_354_low60_0_low20_17;
asr g_354_low60_0_low20_18 g_354_low60_0_low20_18 1;
subs dc r_354_372 r_354_371 u_354_371;
asr r_354_372 r_354_372 1;
subs dc s_354_372 s_354_371 v_354_371;
asr s_354_372 s_354_372 1;
assert
    true
&&
    f_354_low60_0_low20_18 = g_354_low60_0_low20_17,
    u_354_372 = r_354_371,
    v_354_372 = s_354_371,
    g_354_low60_0_low20_18 * (const 64 2) = g_354_low60_0_low20_17 - f_354_low60_0_low20_17,
    r_354_372 * (const 64 2) = r_354_371 - u_354_371,
    s_354_372 * (const 64 2) = s_354_371 - v_354_371
;

assume
    f_354_low60_0_low20_18 = g_354_low60_0_low20_17,
    u_354_372 = r_354_371,
    v_354_372 = s_354_371,
    g_354_low60_0_low20_18 * 2 = g_354_low60_0_low20_17 - f_354_low60_0_low20_17,
    r_354_372 * 2 = r_354_371 - u_354_371,
    s_354_372 * 2 = s_354_371 - v_354_371
&&
    true
;

{
    u_354_372 * f_354_low60_0_low20_0 + v_354_372 * g_354_low60_0_low20_0 = f_354_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_372 * f_354_low60_0_low20_0 + s_354_372 * g_354_low60_0_low20_0 = g_354_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_18 + u_354_372 * (const 64 (2**21)) + v_354_372 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_18 + r_354_372 * (const 64 (2**21)) + s_354_372 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_18,
    f_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_18,
    g_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 372)) <=s delta, delta <=s (const 64 (1 + 2*372)),
    (const 64 (-(2**20))) <=s u_354_372, u_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_372, v_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_372, r_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_372, s_354_372 <=s (const 64 ((2**20))),
    u_354_372 + v_354_372 <=s (const 64 (2**20)),
    u_354_372 - v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 + v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 - v_354_372 <=s (const 64 (2**20)),
    r_354_372 + s_354_372 <=s (const 64 (2**20)),
    r_354_372 - s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 + s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 - s_354_372 <=s (const 64 (2**20)),
    u_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_354_372 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_372_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_18,
sint64 g_354_low60_0_low20_18,
sint64 f_354_low60_0_low20_19,
sint64 g_354_low60_0_low20_19,
sint64 u_354_372,
sint64 v_354_372,
sint64 r_354_372,
sint64 s_354_372,
sint64 u_354_373,
sint64 v_354_373,
sint64 r_354_373,
sint64 s_354_373,
bit ne
)={
    u_354_372 * f_354_low60_0_low20_0 + v_354_372 * g_354_low60_0_low20_0 = f_354_low60_0_low20_18 * (-(2**20)),
    r_354_372 * f_354_low60_0_low20_0 + s_354_372 * g_354_low60_0_low20_0 = g_354_low60_0_low20_18 * (-(2**20))
&&
    u_354_372 * f_354_low60_0_low20_0 + v_354_372 * g_354_low60_0_low20_0 = f_354_low60_0_low20_18 * (const 64 (-(2**20))),
    r_354_372 * f_354_low60_0_low20_0 + s_354_372 * g_354_low60_0_low20_0 = g_354_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_18 + u_354_372 * (const 64 (2**21)) + v_354_372 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_18 + r_354_372 * (const 64 (2**21)) + s_354_372 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_18,
    f_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_18,
    g_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 372)) <=s delta, delta <=s (const 64 (1 + 2*372)),
    (const 64 (-(2**20))) <=s u_354_372, u_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_372, v_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_372, r_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_372, s_354_372 <=s (const 64 ((2**20))),
    u_354_372 + v_354_372 <=s (const 64 (2**20)),
    u_354_372 - v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 + v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 - v_354_372 <=s (const 64 (2**20)),
    r_354_372 + s_354_372 <=s (const 64 (2**20)),
    r_354_372 - s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 + s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 - s_354_372 <=s (const 64 (2**20)),
    u_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_354_372 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step18

// premise a
assume
g_354_low60_0_low20_18 = 0 (mod 2)
&&
g_354_low60_0_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_19 f_354_low60_0_low20_18;
mov u_354_373 u_354_372;
mov v_354_373 v_354_372;

asr g_354_low60_0_low20_19 g_354_low60_0_low20_18 1;
asr r_354_373 r_354_372 1;
asr s_354_373 s_354_372 1;
assert
    true
&&
    f_354_low60_0_low20_19 = f_354_low60_0_low20_18,
    u_354_373 = u_354_372,
    v_354_373 = v_354_372,
    g_354_low60_0_low20_19 * (const 64 2) = g_354_low60_0_low20_18,
    r_354_373 * (const 64 2) = r_354_372,
    s_354_373 * (const 64 2) = s_354_372
;

assume
    f_354_low60_0_low20_19 = f_354_low60_0_low20_18,
    u_354_373 = u_354_372,
    v_354_373 = v_354_372,
    g_354_low60_0_low20_19 * 2 = g_354_low60_0_low20_18,
    r_354_373 * 2 = r_354_372,
    s_354_373 * 2 = s_354_372
&&
    true
;

{
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_19 + u_354_373 * (const 64 (2**21)) + v_354_373 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_19 + r_354_373 * (const 64 (2**21)) + s_354_373 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_19,
    f_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_19,
    g_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 373)) <=s delta, delta <=s (const 64 (1 + 2*373)),
    (const 64 (-(2**20))) <=s u_354_373, u_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_373, v_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_373, r_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_373, s_354_373 <=s (const 64 ((2**20))),
    u_354_373 + v_354_373 <=s (const 64 (2**20)),
    u_354_373 - v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 + v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 - v_354_373 <=s (const 64 (2**20)),
    r_354_373 + s_354_373 <=s (const 64 (2**20)),
    r_354_373 - s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 + s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 - s_354_373 <=s (const 64 (2**20)),
    u_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_354_373 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_372_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_18,
sint64 g_354_low60_0_low20_18,
sint64 f_354_low60_0_low20_19,
sint64 g_354_low60_0_low20_19,
sint64 u_354_372,
sint64 v_354_372,
sint64 r_354_372,
sint64 s_354_372,
sint64 u_354_373,
sint64 v_354_373,
sint64 r_354_373,
sint64 s_354_373,
bit ne
)={
    u_354_372 * f_354_low60_0_low20_0 + v_354_372 * g_354_low60_0_low20_0 = f_354_low60_0_low20_18 * (-(2**20)),
    r_354_372 * f_354_low60_0_low20_0 + s_354_372 * g_354_low60_0_low20_0 = g_354_low60_0_low20_18 * (-(2**20))
&&
    u_354_372 * f_354_low60_0_low20_0 + v_354_372 * g_354_low60_0_low20_0 = f_354_low60_0_low20_18 * (const 64 (-(2**20))),
    r_354_372 * f_354_low60_0_low20_0 + s_354_372 * g_354_low60_0_low20_0 = g_354_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_18 + u_354_372 * (const 64 (2**21)) + v_354_372 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_18 + r_354_372 * (const 64 (2**21)) + s_354_372 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_18,
    f_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_18,
    g_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 372)) <=s delta, delta <=s (const 64 (1 + 2*372)),
    (const 64 (-(2**20))) <=s u_354_372, u_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_372, v_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_372, r_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_372, s_354_372 <=s (const 64 ((2**20))),
    u_354_372 + v_354_372 <=s (const 64 (2**20)),
    u_354_372 - v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 + v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 - v_354_372 <=s (const 64 (2**20)),
    r_354_372 + s_354_372 <=s (const 64 (2**20)),
    r_354_372 - s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 + s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 - s_354_372 <=s (const 64 (2**20)),
    u_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_354_372 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step18

// premise b
assume
g_354_low60_0_low20_18 = 1 (mod 2)
&&
g_354_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_19 f_354_low60_0_low20_18;
mov u_354_373 u_354_372;
mov v_354_373 v_354_372;

add g_354_low60_0_low20_19 g_354_low60_0_low20_18 f_354_low60_0_low20_18;
asr g_354_low60_0_low20_19 g_354_low60_0_low20_19 1;
add r_354_373 r_354_372 u_354_372;
asr r_354_373 r_354_373 1;
add s_354_373 s_354_372 v_354_372;
asr s_354_373 s_354_373 1;
assert
    true
&&
    f_354_low60_0_low20_19 = f_354_low60_0_low20_18,
    u_354_373 = u_354_372,
    v_354_373 = v_354_372,
    g_354_low60_0_low20_19 * (const 64 2) = g_354_low60_0_low20_18 + f_354_low60_0_low20_18,
    r_354_373 * (const 64 2) = r_354_372 + u_354_372,
    s_354_373 * (const 64 2) = s_354_372 + v_354_372
;

assume
    f_354_low60_0_low20_19 = f_354_low60_0_low20_18,
    u_354_373 = u_354_372,
    v_354_373 = v_354_372,
    g_354_low60_0_low20_19 * 2 = g_354_low60_0_low20_18 + f_354_low60_0_low20_18,
    r_354_373 * 2 = r_354_372 + u_354_372,
    s_354_373 * 2 = s_354_372 + v_354_372
&&
    true
;

{
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_19 + u_354_373 * (const 64 (2**21)) + v_354_373 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_19 + r_354_373 * (const 64 (2**21)) + s_354_373 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_19,
    f_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_19,
    g_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 373)) <=s delta, delta <=s (const 64 (1 + 2*373)),
    (const 64 (-(2**20))) <=s u_354_373, u_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_373, v_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_373, r_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_373, s_354_373 <=s (const 64 ((2**20))),
    u_354_373 + v_354_373 <=s (const 64 (2**20)),
    u_354_373 - v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 + v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 - v_354_373 <=s (const 64 (2**20)),
    r_354_373 + s_354_373 <=s (const 64 (2**20)),
    r_354_373 - s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 + s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 - s_354_373 <=s (const 64 (2**20)),
    u_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_354_373 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_372_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_18,
sint64 g_354_low60_0_low20_18,
sint64 f_354_low60_0_low20_19,
sint64 g_354_low60_0_low20_19,
sint64 u_354_372,
sint64 v_354_372,
sint64 r_354_372,
sint64 s_354_372,
sint64 u_354_373,
sint64 v_354_373,
sint64 r_354_373,
sint64 s_354_373,
bit ne
)={
    u_354_372 * f_354_low60_0_low20_0 + v_354_372 * g_354_low60_0_low20_0 = f_354_low60_0_low20_18 * (-(2**20)),
    r_354_372 * f_354_low60_0_low20_0 + s_354_372 * g_354_low60_0_low20_0 = g_354_low60_0_low20_18 * (-(2**20))
&&
    u_354_372 * f_354_low60_0_low20_0 + v_354_372 * g_354_low60_0_low20_0 = f_354_low60_0_low20_18 * (const 64 (-(2**20))),
    r_354_372 * f_354_low60_0_low20_0 + s_354_372 * g_354_low60_0_low20_0 = g_354_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_18 + u_354_372 * (const 64 (2**21)) + v_354_372 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_18 + r_354_372 * (const 64 (2**21)) + s_354_372 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_18,
    f_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_18,
    g_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 372)) <=s delta, delta <=s (const 64 (1 + 2*372)),
    (const 64 (-(2**20))) <=s u_354_372, u_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_372, v_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_372, r_354_372 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_372, s_354_372 <=s (const 64 ((2**20))),
    u_354_372 + v_354_372 <=s (const 64 (2**20)),
    u_354_372 - v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 + v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 - v_354_372 <=s (const 64 (2**20)),
    r_354_372 + s_354_372 <=s (const 64 (2**20)),
    r_354_372 - s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 + s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 - s_354_372 <=s (const 64 (2**20)),
    u_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_354_372 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step18

// premise c
assume
g_354_low60_0_low20_18 = 1 (mod 2)
&&
g_354_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_19 g_354_low60_0_low20_18;
mov u_354_373 r_354_372;
mov v_354_373 s_354_372;

subs dc g_354_low60_0_low20_19 g_354_low60_0_low20_18 f_354_low60_0_low20_18;
asr g_354_low60_0_low20_19 g_354_low60_0_low20_19 1;
subs dc r_354_373 r_354_372 u_354_372;
asr r_354_373 r_354_373 1;
subs dc s_354_373 s_354_372 v_354_372;
asr s_354_373 s_354_373 1;
assert
    true
&&
    f_354_low60_0_low20_19 = g_354_low60_0_low20_18,
    u_354_373 = r_354_372,
    v_354_373 = s_354_372,
    g_354_low60_0_low20_19 * (const 64 2) = g_354_low60_0_low20_18 - f_354_low60_0_low20_18,
    r_354_373 * (const 64 2) = r_354_372 - u_354_372,
    s_354_373 * (const 64 2) = s_354_372 - v_354_372
;

assume
    f_354_low60_0_low20_19 = g_354_low60_0_low20_18,
    u_354_373 = r_354_372,
    v_354_373 = s_354_372,
    g_354_low60_0_low20_19 * 2 = g_354_low60_0_low20_18 - f_354_low60_0_low20_18,
    r_354_373 * 2 = r_354_372 - u_354_372,
    s_354_373 * 2 = s_354_372 - v_354_372
&&
    true
;

{
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_19 + u_354_373 * (const 64 (2**21)) + v_354_373 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_19 + r_354_373 * (const 64 (2**21)) + s_354_373 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_19,
    f_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_19,
    g_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 373)) <=s delta, delta <=s (const 64 (1 + 2*373)),
    (const 64 (-(2**20))) <=s u_354_373, u_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_373, v_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_373, r_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_373, s_354_373 <=s (const 64 ((2**20))),
    u_354_373 + v_354_373 <=s (const 64 (2**20)),
    u_354_373 - v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 + v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 - v_354_373 <=s (const 64 (2**20)),
    r_354_373 + s_354_373 <=s (const 64 (2**20)),
    r_354_373 - s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 + s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 - s_354_373 <=s (const 64 (2**20)),
    u_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_354_373 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_373_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_19,
sint64 g_354_low60_0_low20_19,
sint64 f_354_low60_0_low20_20,
sint64 g_354_low60_0_low20_20,
sint64 u_354_373,
sint64 v_354_373,
sint64 r_354_373,
sint64 s_354_373,
sint64 u_354_374,
sint64 v_354_374,
sint64 r_354_374,
sint64 s_354_374,
bit ne
)={
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (-(2**20)),
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (-(2**20))
&&
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (const 64 (-(2**20))),
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_19 + u_354_373 * (const 64 (2**21)) + v_354_373 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_19 + r_354_373 * (const 64 (2**21)) + s_354_373 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_19,
    f_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_19,
    g_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 373)) <=s delta, delta <=s (const 64 (1 + 2*373)),
    (const 64 (-(2**20))) <=s u_354_373, u_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_373, v_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_373, r_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_373, s_354_373 <=s (const 64 ((2**20))),
    u_354_373 + v_354_373 <=s (const 64 (2**20)),
    u_354_373 - v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 + v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 - v_354_373 <=s (const 64 (2**20)),
    r_354_373 + s_354_373 <=s (const 64 (2**20)),
    r_354_373 - s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 + s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 - s_354_373 <=s (const 64 (2**20)),
    u_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_354_373 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step19

// premise a
assume
g_354_low60_0_low20_19 = 0 (mod 2)
&&
g_354_low60_0_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_354_low60_0_low20_20 f_354_low60_0_low20_19;
mov u_354_374 u_354_373;
mov v_354_374 v_354_373;

asr g_354_low60_0_low20_20 g_354_low60_0_low20_19 1;
asr r_354_374 r_354_373 1;
asr s_354_374 s_354_373 1;
assert
    true
&&
    f_354_low60_0_low20_20 = f_354_low60_0_low20_19,
    u_354_374 = u_354_373,
    v_354_374 = v_354_373,
    g_354_low60_0_low20_20 * (const 64 2) = g_354_low60_0_low20_19,
    r_354_374 * (const 64 2) = r_354_373,
    s_354_374 * (const 64 2) = s_354_373
;

assume
    f_354_low60_0_low20_20 = f_354_low60_0_low20_19,
    u_354_374 = u_354_373,
    v_354_374 = v_354_373,
    g_354_low60_0_low20_20 * 2 = g_354_low60_0_low20_19,
    r_354_374 * 2 = r_354_373,
    s_354_374 * 2 = s_354_373
&&
    true
;

{
    u_354_374 * f_354_low60_0_low20_0 + v_354_374 * g_354_low60_0_low20_0 = f_354_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_374 * f_354_low60_0_low20_0 + s_354_374 * g_354_low60_0_low20_0 = g_354_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_20 + u_354_374 * (const 64 (2**21)) + v_354_374 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_20 + r_354_374 * (const 64 (2**21)) + s_354_374 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_20,
    f_354_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_20,
    g_354_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 374)) <=s delta, delta <=s (const 64 (1 + 2*374)),
    (const 64 (-(2**20))) <=s u_354_374, u_354_374 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_374, v_354_374 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_374, r_354_374 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_374, s_354_374 <=s (const 64 ((2**20))),
    u_354_374 + v_354_374 <=s (const 64 (2**20)),
    u_354_374 - v_354_374 <=s (const 64 (2**20)),
    (const 64 0) - u_354_374 + v_354_374 <=s (const 64 (2**20)),
    (const 64 0) - u_354_374 - v_354_374 <=s (const 64 (2**20)),
    r_354_374 + s_354_374 <=s (const 64 (2**20)),
    r_354_374 - s_354_374 <=s (const 64 (2**20)),
    (const 64 0) - r_354_374 + s_354_374 <=s (const 64 (2**20)),
    (const 64 0) - r_354_374 - s_354_374 <=s (const 64 (2**20)),
    u_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_354_374 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_373_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_19,
sint64 g_354_low60_0_low20_19,
sint64 f_354_low60_0_low20_20,
sint64 g_354_low60_0_low20_20,
sint64 u_354_373,
sint64 v_354_373,
sint64 r_354_373,
sint64 s_354_373,
sint64 u_354_374,
sint64 v_354_374,
sint64 r_354_374,
sint64 s_354_374,
bit ne
)={
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (-(2**20)),
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (-(2**20))
&&
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (const 64 (-(2**20))),
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_19 + u_354_373 * (const 64 (2**21)) + v_354_373 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_19 + r_354_373 * (const 64 (2**21)) + s_354_373 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_19,
    f_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_19,
    g_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 373)) <=s delta, delta <=s (const 64 (1 + 2*373)),
    (const 64 (-(2**20))) <=s u_354_373, u_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_373, v_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_373, r_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_373, s_354_373 <=s (const 64 ((2**20))),
    u_354_373 + v_354_373 <=s (const 64 (2**20)),
    u_354_373 - v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 + v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 - v_354_373 <=s (const 64 (2**20)),
    r_354_373 + s_354_373 <=s (const 64 (2**20)),
    r_354_373 - s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 + s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 - s_354_373 <=s (const 64 (2**20)),
    u_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_354_373 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step19

// premise b
assume
g_354_low60_0_low20_19 = 1 (mod 2)
&&
g_354_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_20 f_354_low60_0_low20_19;
mov u_354_374 u_354_373;
mov v_354_374 v_354_373;

add g_354_low60_0_low20_20 g_354_low60_0_low20_19 f_354_low60_0_low20_19;
asr g_354_low60_0_low20_20 g_354_low60_0_low20_20 1;
add r_354_374 r_354_373 u_354_373;
asr r_354_374 r_354_374 1;
add s_354_374 s_354_373 v_354_373;
asr s_354_374 s_354_374 1;
assert
    true
&&
    f_354_low60_0_low20_20 = f_354_low60_0_low20_19,
    u_354_374 = u_354_373,
    v_354_374 = v_354_373,
    g_354_low60_0_low20_20 * (const 64 2) = g_354_low60_0_low20_19 + f_354_low60_0_low20_19,
    r_354_374 * (const 64 2) = r_354_373 + u_354_373,
    s_354_374 * (const 64 2) = s_354_373 + v_354_373
;

assume
    f_354_low60_0_low20_20 = f_354_low60_0_low20_19,
    u_354_374 = u_354_373,
    v_354_374 = v_354_373,
    g_354_low60_0_low20_20 * 2 = g_354_low60_0_low20_19 + f_354_low60_0_low20_19,
    r_354_374 * 2 = r_354_373 + u_354_373,
    s_354_374 * 2 = s_354_373 + v_354_373
&&
    true
;

{
    u_354_374 * f_354_low60_0_low20_0 + v_354_374 * g_354_low60_0_low20_0 = f_354_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_374 * f_354_low60_0_low20_0 + s_354_374 * g_354_low60_0_low20_0 = g_354_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_20 + u_354_374 * (const 64 (2**21)) + v_354_374 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_20 + r_354_374 * (const 64 (2**21)) + s_354_374 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_20,
    f_354_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_20,
    g_354_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 374)) <=s delta, delta <=s (const 64 (1 + 2*374)),
    (const 64 (-(2**20))) <=s u_354_374, u_354_374 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_374, v_354_374 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_374, r_354_374 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_374, s_354_374 <=s (const 64 ((2**20))),
    u_354_374 + v_354_374 <=s (const 64 (2**20)),
    u_354_374 - v_354_374 <=s (const 64 (2**20)),
    (const 64 0) - u_354_374 + v_354_374 <=s (const 64 (2**20)),
    (const 64 0) - u_354_374 - v_354_374 <=s (const 64 (2**20)),
    r_354_374 + s_354_374 <=s (const 64 (2**20)),
    r_354_374 - s_354_374 <=s (const 64 (2**20)),
    (const 64 0) - r_354_374 + s_354_374 <=s (const 64 (2**20)),
    (const 64 0) - r_354_374 - s_354_374 <=s (const 64 (2**20)),
    u_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_354_374 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_373_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_19,
sint64 g_354_low60_0_low20_19,
sint64 f_354_low60_0_low20_20,
sint64 g_354_low60_0_low20_20,
sint64 u_354_373,
sint64 v_354_373,
sint64 r_354_373,
sint64 s_354_373,
sint64 u_354_374,
sint64 v_354_374,
sint64 r_354_374,
sint64 s_354_374,
bit ne
)={
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (-(2**20)),
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (-(2**20))
&&
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (const 64 (-(2**20))),
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_19 + u_354_373 * (const 64 (2**21)) + v_354_373 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_19 + r_354_373 * (const 64 (2**21)) + s_354_373 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_19,
    f_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_19,
    g_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 373)) <=s delta, delta <=s (const 64 (1 + 2*373)),
    (const 64 (-(2**20))) <=s u_354_373, u_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_373, v_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_373, r_354_373 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_373, s_354_373 <=s (const 64 ((2**20))),
    u_354_373 + v_354_373 <=s (const 64 (2**20)),
    u_354_373 - v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 + v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 - v_354_373 <=s (const 64 (2**20)),
    r_354_373 + s_354_373 <=s (const 64 (2**20)),
    r_354_373 - s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 + s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 - s_354_373 <=s (const 64 (2**20)),
    u_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_354_373 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step19

// premise c
assume
g_354_low60_0_low20_19 = 1 (mod 2)
&&
g_354_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_20 g_354_low60_0_low20_19;
mov u_354_374 r_354_373;
mov v_354_374 s_354_373;

subs dc g_354_low60_0_low20_20 g_354_low60_0_low20_19 f_354_low60_0_low20_19;
asr g_354_low60_0_low20_20 g_354_low60_0_low20_20 1;
subs dc r_354_374 r_354_373 u_354_373;
asr r_354_374 r_354_374 1;
subs dc s_354_374 s_354_373 v_354_373;
asr s_354_374 s_354_374 1;
assert
    true
&&
    f_354_low60_0_low20_20 = g_354_low60_0_low20_19,
    u_354_374 = r_354_373,
    v_354_374 = s_354_373,
    g_354_low60_0_low20_20 * (const 64 2) = g_354_low60_0_low20_19 - f_354_low60_0_low20_19,
    r_354_374 * (const 64 2) = r_354_373 - u_354_373,
    s_354_374 * (const 64 2) = s_354_373 - v_354_373
;

assume
    f_354_low60_0_low20_20 = g_354_low60_0_low20_19,
    u_354_374 = r_354_373,
    v_354_374 = s_354_373,
    g_354_low60_0_low20_20 * 2 = g_354_low60_0_low20_19 - f_354_low60_0_low20_19,
    r_354_374 * 2 = r_354_373 - u_354_373,
    s_354_374 * 2 = s_354_373 - v_354_373
&&
    true
;

{
    u_354_374 * f_354_low60_0_low20_0 + v_354_374 * g_354_low60_0_low20_0 = f_354_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_374 * f_354_low60_0_low20_0 + s_354_374 * g_354_low60_0_low20_0 = g_354_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_20 + u_354_374 * (const 64 (2**21)) + v_354_374 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_20 + r_354_374 * (const 64 (2**21)) + s_354_374 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_20,
    f_354_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_20,
    g_354_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 374)) <=s delta, delta <=s (const 64 (1 + 2*374)),
    (const 64 (-(2**20))) <=s u_354_374, u_354_374 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_354_374, v_354_374 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_354_374, r_354_374 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_354_374, s_354_374 <=s (const 64 ((2**20))),
    u_354_374 + v_354_374 <=s (const 64 (2**20)),
    u_354_374 - v_354_374 <=s (const 64 (2**20)),
    (const 64 0) - u_354_374 + v_354_374 <=s (const 64 (2**20)),
    (const 64 0) - u_354_374 - v_354_374 <=s (const 64 (2**20)),
    r_354_374 + s_354_374 <=s (const 64 (2**20)),
    r_354_374 - s_354_374 <=s (const 64 (2**20)),
    (const 64 0) - r_354_374 + s_354_374 <=s (const 64 (2**20)),
    (const 64 0) - r_354_374 - s_354_374 <=s (const 64 (2**20)),
    u_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_354_374 = (const 64 0) (mod (const 64 (2**(20-20))))
}

