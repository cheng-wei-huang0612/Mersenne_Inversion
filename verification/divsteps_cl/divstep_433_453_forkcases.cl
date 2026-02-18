proc divstep_433_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_1,
sint64 g_413_low60_20_low20_1,
sint64 u_433_433,
sint64 v_433_433,
sint64 r_433_433,
sint64 s_433_433,
sint64 u_433_434,
sint64 v_433_434,
sint64 r_433_434,
sint64 s_433_434,
bit ne
)={
    u_433_433 * f_413_low60_20_low20_0 + v_433_433 * g_413_low60_20_low20_0 = f_413_low60_20_low20_0 * (-(2**20)),
    r_433_433 * f_413_low60_20_low20_0 + s_433_433 * g_413_low60_20_low20_0 = g_413_low60_20_low20_0 * (-(2**20))
&&
    u_433_433 * f_413_low60_20_low20_0 + v_433_433 * g_413_low60_20_low20_0 = f_413_low60_20_low20_0 * (const 64 (-(2**20))),
    r_433_433 * f_413_low60_20_low20_0 + s_433_433 * g_413_low60_20_low20_0 = g_413_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_0 + u_433_433 * (const 64 (2**21)) + v_433_433 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_0 + r_433_433 * (const 64 (2**21)) + s_433_433 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 433)) <=s delta, delta <=s (const 64 (1 + 2*433)),
    u_433_433 = (const 64 (-(2**20))),
    v_433_433 = (const 64 (0)),
    r_433_433 = (const 64 (0)),
    s_433_433 = (const 64 (-(2**20)))
}



// divsteps
// step433

// premise a
assume
g_413_low60_20_low20_0 = 0 (mod 2)
&&
g_413_low60_20_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_413_low60_20_low20_1 f_413_low60_20_low20_0;
mov u_433_434 u_433_433;
mov v_433_434 v_433_433;

asr g_413_low60_20_low20_1 g_413_low60_20_low20_0 1;
asr r_433_434 r_433_433 1;
asr s_433_434 s_433_433 1;
assert
    true
&&
    f_413_low60_20_low20_1 = f_413_low60_20_low20_0,
    u_433_434 = u_433_433,
    v_433_434 = v_433_433,
    g_413_low60_20_low20_1 * (const 64 2) = g_413_low60_20_low20_0,
    r_433_434 * (const 64 2) = r_433_433,
    s_433_434 * (const 64 2) = s_433_433
;

assume
    f_413_low60_20_low20_1 = f_413_low60_20_low20_0,
    u_433_434 = u_433_433,
    v_433_434 = v_433_433,
    g_413_low60_20_low20_1 * 2 = g_413_low60_20_low20_0,
    r_433_434 * 2 = r_433_433,
    s_433_434 * 2 = s_433_433
&&
    true
;

{
    u_433_434 * f_413_low60_20_low20_0 + v_433_434 * g_413_low60_20_low20_0 = f_413_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_434 * f_413_low60_20_low20_0 + s_433_434 * g_413_low60_20_low20_0 = g_413_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_1 + u_433_434 * (const 64 (2**21)) + v_433_434 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_1 + r_433_434 * (const 64 (2**21)) + s_433_434 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_1,
    f_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_1,
    g_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 434)) <=s delta, delta <=s (const 64 (1 + 2*434)),
    (const 64 (-(2**20))) <=s u_433_434, u_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_434, v_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_434, r_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_434, s_433_434 <=s (const 64 ((2**20)-1)),
    u_433_434 + v_433_434 <=s (const 64 (2**20)),
    u_433_434 - v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 + v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 - v_433_434 <=s (const 64 (2**20)),
    r_433_434 + s_433_434 <=s (const 64 (2**20)),
    r_433_434 - s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 + s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 - s_433_434 <=s (const 64 (2**20)),
    u_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_433_434 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_433_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_1,
sint64 g_413_low60_20_low20_1,
sint64 u_433_433,
sint64 v_433_433,
sint64 r_433_433,
sint64 s_433_433,
sint64 u_433_434,
sint64 v_433_434,
sint64 r_433_434,
sint64 s_433_434,
bit ne
)={
    u_433_433 * f_413_low60_20_low20_0 + v_433_433 * g_413_low60_20_low20_0 = f_413_low60_20_low20_0 * (-(2**20)),
    r_433_433 * f_413_low60_20_low20_0 + s_433_433 * g_413_low60_20_low20_0 = g_413_low60_20_low20_0 * (-(2**20))
&&
    u_433_433 * f_413_low60_20_low20_0 + v_433_433 * g_413_low60_20_low20_0 = f_413_low60_20_low20_0 * (const 64 (-(2**20))),
    r_433_433 * f_413_low60_20_low20_0 + s_433_433 * g_413_low60_20_low20_0 = g_413_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_0 + u_433_433 * (const 64 (2**21)) + v_433_433 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_0 + r_433_433 * (const 64 (2**21)) + s_433_433 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 433)) <=s delta, delta <=s (const 64 (1 + 2*433)),
    u_433_433 = (const 64 (-(2**20))),
    v_433_433 = (const 64 (0)),
    r_433_433 = (const 64 (0)),
    s_433_433 = (const 64 (-(2**20)))
}



// divsteps
// step433

// premise b
assume
g_413_low60_20_low20_0 = 1 (mod 2)
&&
g_413_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_1 f_413_low60_20_low20_0;
mov u_433_434 u_433_433;
mov v_433_434 v_433_433;

add g_413_low60_20_low20_1 g_413_low60_20_low20_0 f_413_low60_20_low20_0;
asr g_413_low60_20_low20_1 g_413_low60_20_low20_1 1;
add r_433_434 r_433_433 u_433_433;
asr r_433_434 r_433_434 1;
add s_433_434 s_433_433 v_433_433;
asr s_433_434 s_433_434 1;
assert
    true
&&
    f_413_low60_20_low20_1 = f_413_low60_20_low20_0,
    u_433_434 = u_433_433,
    v_433_434 = v_433_433,
    g_413_low60_20_low20_1 * (const 64 2) = g_413_low60_20_low20_0 + f_413_low60_20_low20_0,
    r_433_434 * (const 64 2) = r_433_433 + u_433_433,
    s_433_434 * (const 64 2) = s_433_433 + v_433_433
;

assume
    f_413_low60_20_low20_1 = f_413_low60_20_low20_0,
    u_433_434 = u_433_433,
    v_433_434 = v_433_433,
    g_413_low60_20_low20_1 * 2 = g_413_low60_20_low20_0 + f_413_low60_20_low20_0,
    r_433_434 * 2 = r_433_433 + u_433_433,
    s_433_434 * 2 = s_433_433 + v_433_433
&&
    true
;

{
    u_433_434 * f_413_low60_20_low20_0 + v_433_434 * g_413_low60_20_low20_0 = f_413_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_434 * f_413_low60_20_low20_0 + s_433_434 * g_413_low60_20_low20_0 = g_413_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_1 + u_433_434 * (const 64 (2**21)) + v_433_434 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_1 + r_433_434 * (const 64 (2**21)) + s_433_434 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_1,
    f_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_1,
    g_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 434)) <=s delta, delta <=s (const 64 (1 + 2*434)),
    (const 64 (-(2**20))) <=s u_433_434, u_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_434, v_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_434, r_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_434, s_433_434 <=s (const 64 ((2**20)-1)),
    u_433_434 + v_433_434 <=s (const 64 (2**20)),
    u_433_434 - v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 + v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 - v_433_434 <=s (const 64 (2**20)),
    r_433_434 + s_433_434 <=s (const 64 (2**20)),
    r_433_434 - s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 + s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 - s_433_434 <=s (const 64 (2**20)),
    u_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_433_434 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_433_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_1,
sint64 g_413_low60_20_low20_1,
sint64 u_433_433,
sint64 v_433_433,
sint64 r_433_433,
sint64 s_433_433,
sint64 u_433_434,
sint64 v_433_434,
sint64 r_433_434,
sint64 s_433_434,
bit ne
)={
    u_433_433 * f_413_low60_20_low20_0 + v_433_433 * g_413_low60_20_low20_0 = f_413_low60_20_low20_0 * (-(2**20)),
    r_433_433 * f_413_low60_20_low20_0 + s_433_433 * g_413_low60_20_low20_0 = g_413_low60_20_low20_0 * (-(2**20))
&&
    u_433_433 * f_413_low60_20_low20_0 + v_433_433 * g_413_low60_20_low20_0 = f_413_low60_20_low20_0 * (const 64 (-(2**20))),
    r_433_433 * f_413_low60_20_low20_0 + s_433_433 * g_413_low60_20_low20_0 = g_413_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_0 + u_433_433 * (const 64 (2**21)) + v_433_433 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_0 + r_433_433 * (const 64 (2**21)) + s_433_433 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 433)) <=s delta, delta <=s (const 64 (1 + 2*433)),
    u_433_433 = (const 64 (-(2**20))),
    v_433_433 = (const 64 (0)),
    r_433_433 = (const 64 (0)),
    s_433_433 = (const 64 (-(2**20)))
}



// divsteps
// step433

// premise c
assume
g_413_low60_20_low20_0 = 1 (mod 2)
&&
g_413_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_1 g_413_low60_20_low20_0;
mov u_433_434 r_433_433;
mov v_433_434 s_433_433;

subs dc g_413_low60_20_low20_1 g_413_low60_20_low20_0 f_413_low60_20_low20_0;
asr g_413_low60_20_low20_1 g_413_low60_20_low20_1 1;
subs dc r_433_434 r_433_433 u_433_433;
asr r_433_434 r_433_434 1;
subs dc s_433_434 s_433_433 v_433_433;
asr s_433_434 s_433_434 1;
assert
    true
&&
    f_413_low60_20_low20_1 = g_413_low60_20_low20_0,
    u_433_434 = r_433_433,
    v_433_434 = s_433_433,
    g_413_low60_20_low20_1 * (const 64 2) = g_413_low60_20_low20_0 - f_413_low60_20_low20_0,
    r_433_434 * (const 64 2) = r_433_433 - u_433_433,
    s_433_434 * (const 64 2) = s_433_433 - v_433_433
;

assume
    f_413_low60_20_low20_1 = g_413_low60_20_low20_0,
    u_433_434 = r_433_433,
    v_433_434 = s_433_433,
    g_413_low60_20_low20_1 * 2 = g_413_low60_20_low20_0 - f_413_low60_20_low20_0,
    r_433_434 * 2 = r_433_433 - u_433_433,
    s_433_434 * 2 = s_433_433 - v_433_433
&&
    true
;

{
    u_433_434 * f_413_low60_20_low20_0 + v_433_434 * g_413_low60_20_low20_0 = f_413_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_434 * f_413_low60_20_low20_0 + s_433_434 * g_413_low60_20_low20_0 = g_413_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_1 + u_433_434 * (const 64 (2**21)) + v_433_434 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_1 + r_433_434 * (const 64 (2**21)) + s_433_434 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_1,
    f_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_1,
    g_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 434)) <=s delta, delta <=s (const 64 (1 + 2*434)),
    (const 64 (-(2**20))) <=s u_433_434, u_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_434, v_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_434, r_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_434, s_433_434 <=s (const 64 ((2**20)-1)),
    u_433_434 + v_433_434 <=s (const 64 (2**20)),
    u_433_434 - v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 + v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 - v_433_434 <=s (const 64 (2**20)),
    r_433_434 + s_433_434 <=s (const 64 (2**20)),
    r_433_434 - s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 + s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 - s_433_434 <=s (const 64 (2**20)),
    u_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_433_434 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_434_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_1,
sint64 g_413_low60_20_low20_1,
sint64 f_413_low60_20_low20_2,
sint64 g_413_low60_20_low20_2,
sint64 u_433_434,
sint64 v_433_434,
sint64 r_433_434,
sint64 s_433_434,
sint64 u_433_435,
sint64 v_433_435,
sint64 r_433_435,
sint64 s_433_435,
bit ne
)={
    u_433_434 * f_413_low60_20_low20_0 + v_433_434 * g_413_low60_20_low20_0 = f_413_low60_20_low20_1 * (-(2**20)),
    r_433_434 * f_413_low60_20_low20_0 + s_433_434 * g_413_low60_20_low20_0 = g_413_low60_20_low20_1 * (-(2**20))
&&
    u_433_434 * f_413_low60_20_low20_0 + v_433_434 * g_413_low60_20_low20_0 = f_413_low60_20_low20_1 * (const 64 (-(2**20))),
    r_433_434 * f_413_low60_20_low20_0 + s_433_434 * g_413_low60_20_low20_0 = g_413_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_1 + u_433_434 * (const 64 (2**21)) + v_433_434 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_1 + r_433_434 * (const 64 (2**21)) + s_433_434 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_1,
    f_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_1,
    g_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 434)) <=s delta, delta <=s (const 64 (1 + 2*434)),
    (const 64 (-(2**20))) <=s u_433_434, u_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_434, v_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_434, r_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_434, s_433_434 <=s (const 64 ((2**20)-1)),
    u_433_434 + v_433_434 <=s (const 64 (2**20)),
    u_433_434 - v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 + v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 - v_433_434 <=s (const 64 (2**20)),
    r_433_434 + s_433_434 <=s (const 64 (2**20)),
    r_433_434 - s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 + s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 - s_433_434 <=s (const 64 (2**20)),
    u_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_433_434 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step434

// premise a
assume
g_413_low60_20_low20_1 = 0 (mod 2)
&&
g_413_low60_20_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_2 f_413_low60_20_low20_1;
mov u_433_435 u_433_434;
mov v_433_435 v_433_434;

asr g_413_low60_20_low20_2 g_413_low60_20_low20_1 1;
asr r_433_435 r_433_434 1;
asr s_433_435 s_433_434 1;
assert
    true
&&
    f_413_low60_20_low20_2 = f_413_low60_20_low20_1,
    u_433_435 = u_433_434,
    v_433_435 = v_433_434,
    g_413_low60_20_low20_2 * (const 64 2) = g_413_low60_20_low20_1,
    r_433_435 * (const 64 2) = r_433_434,
    s_433_435 * (const 64 2) = s_433_434
;

assume
    f_413_low60_20_low20_2 = f_413_low60_20_low20_1,
    u_433_435 = u_433_434,
    v_433_435 = v_433_434,
    g_413_low60_20_low20_2 * 2 = g_413_low60_20_low20_1,
    r_433_435 * 2 = r_433_434,
    s_433_435 * 2 = s_433_434
&&
    true
;

{
    u_433_435 * f_413_low60_20_low20_0 + v_433_435 * g_413_low60_20_low20_0 = f_413_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_435 * f_413_low60_20_low20_0 + s_433_435 * g_413_low60_20_low20_0 = g_413_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_2 + u_433_435 * (const 64 (2**21)) + v_433_435 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_2 + r_433_435 * (const 64 (2**21)) + s_433_435 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_2,
    f_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_2,
    g_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 435)) <=s delta, delta <=s (const 64 (1 + 2*435)),
    (const 64 (-(2**20))) <=s u_433_435, u_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_435, v_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_435, r_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_435, s_433_435 <=s (const 64 ((2**20)-1)),
    u_433_435 + v_433_435 <=s (const 64 (2**20)),
    u_433_435 - v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 + v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 - v_433_435 <=s (const 64 (2**20)),
    r_433_435 + s_433_435 <=s (const 64 (2**20)),
    r_433_435 - s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 + s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 - s_433_435 <=s (const 64 (2**20)),
    u_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_433_435 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_434_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_1,
sint64 g_413_low60_20_low20_1,
sint64 f_413_low60_20_low20_2,
sint64 g_413_low60_20_low20_2,
sint64 u_433_434,
sint64 v_433_434,
sint64 r_433_434,
sint64 s_433_434,
sint64 u_433_435,
sint64 v_433_435,
sint64 r_433_435,
sint64 s_433_435,
bit ne
)={
    u_433_434 * f_413_low60_20_low20_0 + v_433_434 * g_413_low60_20_low20_0 = f_413_low60_20_low20_1 * (-(2**20)),
    r_433_434 * f_413_low60_20_low20_0 + s_433_434 * g_413_low60_20_low20_0 = g_413_low60_20_low20_1 * (-(2**20))
&&
    u_433_434 * f_413_low60_20_low20_0 + v_433_434 * g_413_low60_20_low20_0 = f_413_low60_20_low20_1 * (const 64 (-(2**20))),
    r_433_434 * f_413_low60_20_low20_0 + s_433_434 * g_413_low60_20_low20_0 = g_413_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_1 + u_433_434 * (const 64 (2**21)) + v_433_434 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_1 + r_433_434 * (const 64 (2**21)) + s_433_434 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_1,
    f_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_1,
    g_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 434)) <=s delta, delta <=s (const 64 (1 + 2*434)),
    (const 64 (-(2**20))) <=s u_433_434, u_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_434, v_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_434, r_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_434, s_433_434 <=s (const 64 ((2**20)-1)),
    u_433_434 + v_433_434 <=s (const 64 (2**20)),
    u_433_434 - v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 + v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 - v_433_434 <=s (const 64 (2**20)),
    r_433_434 + s_433_434 <=s (const 64 (2**20)),
    r_433_434 - s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 + s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 - s_433_434 <=s (const 64 (2**20)),
    u_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_433_434 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step434

// premise b
assume
g_413_low60_20_low20_1 = 1 (mod 2)
&&
g_413_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_2 f_413_low60_20_low20_1;
mov u_433_435 u_433_434;
mov v_433_435 v_433_434;

add g_413_low60_20_low20_2 g_413_low60_20_low20_1 f_413_low60_20_low20_1;
asr g_413_low60_20_low20_2 g_413_low60_20_low20_2 1;
add r_433_435 r_433_434 u_433_434;
asr r_433_435 r_433_435 1;
add s_433_435 s_433_434 v_433_434;
asr s_433_435 s_433_435 1;
assert
    true
&&
    f_413_low60_20_low20_2 = f_413_low60_20_low20_1,
    u_433_435 = u_433_434,
    v_433_435 = v_433_434,
    g_413_low60_20_low20_2 * (const 64 2) = g_413_low60_20_low20_1 + f_413_low60_20_low20_1,
    r_433_435 * (const 64 2) = r_433_434 + u_433_434,
    s_433_435 * (const 64 2) = s_433_434 + v_433_434
;

assume
    f_413_low60_20_low20_2 = f_413_low60_20_low20_1,
    u_433_435 = u_433_434,
    v_433_435 = v_433_434,
    g_413_low60_20_low20_2 * 2 = g_413_low60_20_low20_1 + f_413_low60_20_low20_1,
    r_433_435 * 2 = r_433_434 + u_433_434,
    s_433_435 * 2 = s_433_434 + v_433_434
&&
    true
;

{
    u_433_435 * f_413_low60_20_low20_0 + v_433_435 * g_413_low60_20_low20_0 = f_413_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_435 * f_413_low60_20_low20_0 + s_433_435 * g_413_low60_20_low20_0 = g_413_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_2 + u_433_435 * (const 64 (2**21)) + v_433_435 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_2 + r_433_435 * (const 64 (2**21)) + s_433_435 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_2,
    f_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_2,
    g_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 435)) <=s delta, delta <=s (const 64 (1 + 2*435)),
    (const 64 (-(2**20))) <=s u_433_435, u_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_435, v_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_435, r_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_435, s_433_435 <=s (const 64 ((2**20)-1)),
    u_433_435 + v_433_435 <=s (const 64 (2**20)),
    u_433_435 - v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 + v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 - v_433_435 <=s (const 64 (2**20)),
    r_433_435 + s_433_435 <=s (const 64 (2**20)),
    r_433_435 - s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 + s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 - s_433_435 <=s (const 64 (2**20)),
    u_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_433_435 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_434_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_1,
sint64 g_413_low60_20_low20_1,
sint64 f_413_low60_20_low20_2,
sint64 g_413_low60_20_low20_2,
sint64 u_433_434,
sint64 v_433_434,
sint64 r_433_434,
sint64 s_433_434,
sint64 u_433_435,
sint64 v_433_435,
sint64 r_433_435,
sint64 s_433_435,
bit ne
)={
    u_433_434 * f_413_low60_20_low20_0 + v_433_434 * g_413_low60_20_low20_0 = f_413_low60_20_low20_1 * (-(2**20)),
    r_433_434 * f_413_low60_20_low20_0 + s_433_434 * g_413_low60_20_low20_0 = g_413_low60_20_low20_1 * (-(2**20))
&&
    u_433_434 * f_413_low60_20_low20_0 + v_433_434 * g_413_low60_20_low20_0 = f_413_low60_20_low20_1 * (const 64 (-(2**20))),
    r_433_434 * f_413_low60_20_low20_0 + s_433_434 * g_413_low60_20_low20_0 = g_413_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_1 + u_433_434 * (const 64 (2**21)) + v_433_434 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_1 + r_433_434 * (const 64 (2**21)) + s_433_434 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_1,
    f_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_1,
    g_413_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 434)) <=s delta, delta <=s (const 64 (1 + 2*434)),
    (const 64 (-(2**20))) <=s u_433_434, u_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_434, v_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_434, r_433_434 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_434, s_433_434 <=s (const 64 ((2**20)-1)),
    u_433_434 + v_433_434 <=s (const 64 (2**20)),
    u_433_434 - v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 + v_433_434 <=s (const 64 (2**20)),
    (const 64 0) - u_433_434 - v_433_434 <=s (const 64 (2**20)),
    r_433_434 + s_433_434 <=s (const 64 (2**20)),
    r_433_434 - s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 + s_433_434 <=s (const 64 (2**20)),
    (const 64 0) - r_433_434 - s_433_434 <=s (const 64 (2**20)),
    u_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_433_434 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_433_434 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step434

// premise c
assume
g_413_low60_20_low20_1 = 1 (mod 2)
&&
g_413_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_2 g_413_low60_20_low20_1;
mov u_433_435 r_433_434;
mov v_433_435 s_433_434;

subs dc g_413_low60_20_low20_2 g_413_low60_20_low20_1 f_413_low60_20_low20_1;
asr g_413_low60_20_low20_2 g_413_low60_20_low20_2 1;
subs dc r_433_435 r_433_434 u_433_434;
asr r_433_435 r_433_435 1;
subs dc s_433_435 s_433_434 v_433_434;
asr s_433_435 s_433_435 1;
assert
    true
&&
    f_413_low60_20_low20_2 = g_413_low60_20_low20_1,
    u_433_435 = r_433_434,
    v_433_435 = s_433_434,
    g_413_low60_20_low20_2 * (const 64 2) = g_413_low60_20_low20_1 - f_413_low60_20_low20_1,
    r_433_435 * (const 64 2) = r_433_434 - u_433_434,
    s_433_435 * (const 64 2) = s_433_434 - v_433_434
;

assume
    f_413_low60_20_low20_2 = g_413_low60_20_low20_1,
    u_433_435 = r_433_434,
    v_433_435 = s_433_434,
    g_413_low60_20_low20_2 * 2 = g_413_low60_20_low20_1 - f_413_low60_20_low20_1,
    r_433_435 * 2 = r_433_434 - u_433_434,
    s_433_435 * 2 = s_433_434 - v_433_434
&&
    true
;

{
    u_433_435 * f_413_low60_20_low20_0 + v_433_435 * g_413_low60_20_low20_0 = f_413_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_435 * f_413_low60_20_low20_0 + s_433_435 * g_413_low60_20_low20_0 = g_413_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_2 + u_433_435 * (const 64 (2**21)) + v_433_435 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_2 + r_433_435 * (const 64 (2**21)) + s_433_435 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_2,
    f_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_2,
    g_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 435)) <=s delta, delta <=s (const 64 (1 + 2*435)),
    (const 64 (-(2**20))) <=s u_433_435, u_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_435, v_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_435, r_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_435, s_433_435 <=s (const 64 ((2**20)-1)),
    u_433_435 + v_433_435 <=s (const 64 (2**20)),
    u_433_435 - v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 + v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 - v_433_435 <=s (const 64 (2**20)),
    r_433_435 + s_433_435 <=s (const 64 (2**20)),
    r_433_435 - s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 + s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 - s_433_435 <=s (const 64 (2**20)),
    u_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_433_435 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_435_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_2,
sint64 g_413_low60_20_low20_2,
sint64 f_413_low60_20_low20_3,
sint64 g_413_low60_20_low20_3,
sint64 u_433_435,
sint64 v_433_435,
sint64 r_433_435,
sint64 s_433_435,
sint64 u_433_436,
sint64 v_433_436,
sint64 r_433_436,
sint64 s_433_436,
bit ne
)={
    u_433_435 * f_413_low60_20_low20_0 + v_433_435 * g_413_low60_20_low20_0 = f_413_low60_20_low20_2 * (-(2**20)),
    r_433_435 * f_413_low60_20_low20_0 + s_433_435 * g_413_low60_20_low20_0 = g_413_low60_20_low20_2 * (-(2**20))
&&
    u_433_435 * f_413_low60_20_low20_0 + v_433_435 * g_413_low60_20_low20_0 = f_413_low60_20_low20_2 * (const 64 (-(2**20))),
    r_433_435 * f_413_low60_20_low20_0 + s_433_435 * g_413_low60_20_low20_0 = g_413_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_2 + u_433_435 * (const 64 (2**21)) + v_433_435 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_2 + r_433_435 * (const 64 (2**21)) + s_433_435 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_2,
    f_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_2,
    g_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 435)) <=s delta, delta <=s (const 64 (1 + 2*435)),
    (const 64 (-(2**20))) <=s u_433_435, u_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_435, v_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_435, r_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_435, s_433_435 <=s (const 64 ((2**20)-1)),
    u_433_435 + v_433_435 <=s (const 64 (2**20)),
    u_433_435 - v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 + v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 - v_433_435 <=s (const 64 (2**20)),
    r_433_435 + s_433_435 <=s (const 64 (2**20)),
    r_433_435 - s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 + s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 - s_433_435 <=s (const 64 (2**20)),
    u_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_433_435 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step435

// premise a
assume
g_413_low60_20_low20_2 = 0 (mod 2)
&&
g_413_low60_20_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_3 f_413_low60_20_low20_2;
mov u_433_436 u_433_435;
mov v_433_436 v_433_435;

asr g_413_low60_20_low20_3 g_413_low60_20_low20_2 1;
asr r_433_436 r_433_435 1;
asr s_433_436 s_433_435 1;
assert
    true
&&
    f_413_low60_20_low20_3 = f_413_low60_20_low20_2,
    u_433_436 = u_433_435,
    v_433_436 = v_433_435,
    g_413_low60_20_low20_3 * (const 64 2) = g_413_low60_20_low20_2,
    r_433_436 * (const 64 2) = r_433_435,
    s_433_436 * (const 64 2) = s_433_435
;

assume
    f_413_low60_20_low20_3 = f_413_low60_20_low20_2,
    u_433_436 = u_433_435,
    v_433_436 = v_433_435,
    g_413_low60_20_low20_3 * 2 = g_413_low60_20_low20_2,
    r_433_436 * 2 = r_433_435,
    s_433_436 * 2 = s_433_435
&&
    true
;

{
    u_433_436 * f_413_low60_20_low20_0 + v_433_436 * g_413_low60_20_low20_0 = f_413_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_436 * f_413_low60_20_low20_0 + s_433_436 * g_413_low60_20_low20_0 = g_413_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_3 + u_433_436 * (const 64 (2**21)) + v_433_436 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_3 + r_433_436 * (const 64 (2**21)) + s_433_436 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_3,
    f_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_3,
    g_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 436)) <=s delta, delta <=s (const 64 (1 + 2*436)),
    (const 64 (-(2**20))) <=s u_433_436, u_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_436, v_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_436, r_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_436, s_433_436 <=s (const 64 ((2**20)-1)),
    u_433_436 + v_433_436 <=s (const 64 (2**20)),
    u_433_436 - v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 + v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 - v_433_436 <=s (const 64 (2**20)),
    r_433_436 + s_433_436 <=s (const 64 (2**20)),
    r_433_436 - s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 + s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 - s_433_436 <=s (const 64 (2**20)),
    u_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_433_436 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_435_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_2,
sint64 g_413_low60_20_low20_2,
sint64 f_413_low60_20_low20_3,
sint64 g_413_low60_20_low20_3,
sint64 u_433_435,
sint64 v_433_435,
sint64 r_433_435,
sint64 s_433_435,
sint64 u_433_436,
sint64 v_433_436,
sint64 r_433_436,
sint64 s_433_436,
bit ne
)={
    u_433_435 * f_413_low60_20_low20_0 + v_433_435 * g_413_low60_20_low20_0 = f_413_low60_20_low20_2 * (-(2**20)),
    r_433_435 * f_413_low60_20_low20_0 + s_433_435 * g_413_low60_20_low20_0 = g_413_low60_20_low20_2 * (-(2**20))
&&
    u_433_435 * f_413_low60_20_low20_0 + v_433_435 * g_413_low60_20_low20_0 = f_413_low60_20_low20_2 * (const 64 (-(2**20))),
    r_433_435 * f_413_low60_20_low20_0 + s_433_435 * g_413_low60_20_low20_0 = g_413_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_2 + u_433_435 * (const 64 (2**21)) + v_433_435 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_2 + r_433_435 * (const 64 (2**21)) + s_433_435 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_2,
    f_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_2,
    g_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 435)) <=s delta, delta <=s (const 64 (1 + 2*435)),
    (const 64 (-(2**20))) <=s u_433_435, u_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_435, v_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_435, r_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_435, s_433_435 <=s (const 64 ((2**20)-1)),
    u_433_435 + v_433_435 <=s (const 64 (2**20)),
    u_433_435 - v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 + v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 - v_433_435 <=s (const 64 (2**20)),
    r_433_435 + s_433_435 <=s (const 64 (2**20)),
    r_433_435 - s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 + s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 - s_433_435 <=s (const 64 (2**20)),
    u_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_433_435 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step435

// premise b
assume
g_413_low60_20_low20_2 = 1 (mod 2)
&&
g_413_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_3 f_413_low60_20_low20_2;
mov u_433_436 u_433_435;
mov v_433_436 v_433_435;

add g_413_low60_20_low20_3 g_413_low60_20_low20_2 f_413_low60_20_low20_2;
asr g_413_low60_20_low20_3 g_413_low60_20_low20_3 1;
add r_433_436 r_433_435 u_433_435;
asr r_433_436 r_433_436 1;
add s_433_436 s_433_435 v_433_435;
asr s_433_436 s_433_436 1;
assert
    true
&&
    f_413_low60_20_low20_3 = f_413_low60_20_low20_2,
    u_433_436 = u_433_435,
    v_433_436 = v_433_435,
    g_413_low60_20_low20_3 * (const 64 2) = g_413_low60_20_low20_2 + f_413_low60_20_low20_2,
    r_433_436 * (const 64 2) = r_433_435 + u_433_435,
    s_433_436 * (const 64 2) = s_433_435 + v_433_435
;

assume
    f_413_low60_20_low20_3 = f_413_low60_20_low20_2,
    u_433_436 = u_433_435,
    v_433_436 = v_433_435,
    g_413_low60_20_low20_3 * 2 = g_413_low60_20_low20_2 + f_413_low60_20_low20_2,
    r_433_436 * 2 = r_433_435 + u_433_435,
    s_433_436 * 2 = s_433_435 + v_433_435
&&
    true
;

{
    u_433_436 * f_413_low60_20_low20_0 + v_433_436 * g_413_low60_20_low20_0 = f_413_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_436 * f_413_low60_20_low20_0 + s_433_436 * g_413_low60_20_low20_0 = g_413_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_3 + u_433_436 * (const 64 (2**21)) + v_433_436 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_3 + r_433_436 * (const 64 (2**21)) + s_433_436 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_3,
    f_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_3,
    g_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 436)) <=s delta, delta <=s (const 64 (1 + 2*436)),
    (const 64 (-(2**20))) <=s u_433_436, u_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_436, v_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_436, r_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_436, s_433_436 <=s (const 64 ((2**20)-1)),
    u_433_436 + v_433_436 <=s (const 64 (2**20)),
    u_433_436 - v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 + v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 - v_433_436 <=s (const 64 (2**20)),
    r_433_436 + s_433_436 <=s (const 64 (2**20)),
    r_433_436 - s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 + s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 - s_433_436 <=s (const 64 (2**20)),
    u_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_433_436 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_435_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_2,
sint64 g_413_low60_20_low20_2,
sint64 f_413_low60_20_low20_3,
sint64 g_413_low60_20_low20_3,
sint64 u_433_435,
sint64 v_433_435,
sint64 r_433_435,
sint64 s_433_435,
sint64 u_433_436,
sint64 v_433_436,
sint64 r_433_436,
sint64 s_433_436,
bit ne
)={
    u_433_435 * f_413_low60_20_low20_0 + v_433_435 * g_413_low60_20_low20_0 = f_413_low60_20_low20_2 * (-(2**20)),
    r_433_435 * f_413_low60_20_low20_0 + s_433_435 * g_413_low60_20_low20_0 = g_413_low60_20_low20_2 * (-(2**20))
&&
    u_433_435 * f_413_low60_20_low20_0 + v_433_435 * g_413_low60_20_low20_0 = f_413_low60_20_low20_2 * (const 64 (-(2**20))),
    r_433_435 * f_413_low60_20_low20_0 + s_433_435 * g_413_low60_20_low20_0 = g_413_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_2 + u_433_435 * (const 64 (2**21)) + v_433_435 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_2 + r_433_435 * (const 64 (2**21)) + s_433_435 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_2,
    f_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_2,
    g_413_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 435)) <=s delta, delta <=s (const 64 (1 + 2*435)),
    (const 64 (-(2**20))) <=s u_433_435, u_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_435, v_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_435, r_433_435 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_435, s_433_435 <=s (const 64 ((2**20)-1)),
    u_433_435 + v_433_435 <=s (const 64 (2**20)),
    u_433_435 - v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 + v_433_435 <=s (const 64 (2**20)),
    (const 64 0) - u_433_435 - v_433_435 <=s (const 64 (2**20)),
    r_433_435 + s_433_435 <=s (const 64 (2**20)),
    r_433_435 - s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 + s_433_435 <=s (const 64 (2**20)),
    (const 64 0) - r_433_435 - s_433_435 <=s (const 64 (2**20)),
    u_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_433_435 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_433_435 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step435

// premise c
assume
g_413_low60_20_low20_2 = 1 (mod 2)
&&
g_413_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_3 g_413_low60_20_low20_2;
mov u_433_436 r_433_435;
mov v_433_436 s_433_435;

subs dc g_413_low60_20_low20_3 g_413_low60_20_low20_2 f_413_low60_20_low20_2;
asr g_413_low60_20_low20_3 g_413_low60_20_low20_3 1;
subs dc r_433_436 r_433_435 u_433_435;
asr r_433_436 r_433_436 1;
subs dc s_433_436 s_433_435 v_433_435;
asr s_433_436 s_433_436 1;
assert
    true
&&
    f_413_low60_20_low20_3 = g_413_low60_20_low20_2,
    u_433_436 = r_433_435,
    v_433_436 = s_433_435,
    g_413_low60_20_low20_3 * (const 64 2) = g_413_low60_20_low20_2 - f_413_low60_20_low20_2,
    r_433_436 * (const 64 2) = r_433_435 - u_433_435,
    s_433_436 * (const 64 2) = s_433_435 - v_433_435
;

assume
    f_413_low60_20_low20_3 = g_413_low60_20_low20_2,
    u_433_436 = r_433_435,
    v_433_436 = s_433_435,
    g_413_low60_20_low20_3 * 2 = g_413_low60_20_low20_2 - f_413_low60_20_low20_2,
    r_433_436 * 2 = r_433_435 - u_433_435,
    s_433_436 * 2 = s_433_435 - v_433_435
&&
    true
;

{
    u_433_436 * f_413_low60_20_low20_0 + v_433_436 * g_413_low60_20_low20_0 = f_413_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_436 * f_413_low60_20_low20_0 + s_433_436 * g_413_low60_20_low20_0 = g_413_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_3 + u_433_436 * (const 64 (2**21)) + v_433_436 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_3 + r_433_436 * (const 64 (2**21)) + s_433_436 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_3,
    f_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_3,
    g_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 436)) <=s delta, delta <=s (const 64 (1 + 2*436)),
    (const 64 (-(2**20))) <=s u_433_436, u_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_436, v_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_436, r_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_436, s_433_436 <=s (const 64 ((2**20)-1)),
    u_433_436 + v_433_436 <=s (const 64 (2**20)),
    u_433_436 - v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 + v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 - v_433_436 <=s (const 64 (2**20)),
    r_433_436 + s_433_436 <=s (const 64 (2**20)),
    r_433_436 - s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 + s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 - s_433_436 <=s (const 64 (2**20)),
    u_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_433_436 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_436_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_3,
sint64 g_413_low60_20_low20_3,
sint64 f_413_low60_20_low20_4,
sint64 g_413_low60_20_low20_4,
sint64 u_433_436,
sint64 v_433_436,
sint64 r_433_436,
sint64 s_433_436,
sint64 u_433_437,
sint64 v_433_437,
sint64 r_433_437,
sint64 s_433_437,
bit ne
)={
    u_433_436 * f_413_low60_20_low20_0 + v_433_436 * g_413_low60_20_low20_0 = f_413_low60_20_low20_3 * (-(2**20)),
    r_433_436 * f_413_low60_20_low20_0 + s_433_436 * g_413_low60_20_low20_0 = g_413_low60_20_low20_3 * (-(2**20))
&&
    u_433_436 * f_413_low60_20_low20_0 + v_433_436 * g_413_low60_20_low20_0 = f_413_low60_20_low20_3 * (const 64 (-(2**20))),
    r_433_436 * f_413_low60_20_low20_0 + s_433_436 * g_413_low60_20_low20_0 = g_413_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_3 + u_433_436 * (const 64 (2**21)) + v_433_436 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_3 + r_433_436 * (const 64 (2**21)) + s_433_436 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_3,
    f_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_3,
    g_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 436)) <=s delta, delta <=s (const 64 (1 + 2*436)),
    (const 64 (-(2**20))) <=s u_433_436, u_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_436, v_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_436, r_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_436, s_433_436 <=s (const 64 ((2**20)-1)),
    u_433_436 + v_433_436 <=s (const 64 (2**20)),
    u_433_436 - v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 + v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 - v_433_436 <=s (const 64 (2**20)),
    r_433_436 + s_433_436 <=s (const 64 (2**20)),
    r_433_436 - s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 + s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 - s_433_436 <=s (const 64 (2**20)),
    u_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_433_436 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step436

// premise a
assume
g_413_low60_20_low20_3 = 0 (mod 2)
&&
g_413_low60_20_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_4 f_413_low60_20_low20_3;
mov u_433_437 u_433_436;
mov v_433_437 v_433_436;

asr g_413_low60_20_low20_4 g_413_low60_20_low20_3 1;
asr r_433_437 r_433_436 1;
asr s_433_437 s_433_436 1;
assert
    true
&&
    f_413_low60_20_low20_4 = f_413_low60_20_low20_3,
    u_433_437 = u_433_436,
    v_433_437 = v_433_436,
    g_413_low60_20_low20_4 * (const 64 2) = g_413_low60_20_low20_3,
    r_433_437 * (const 64 2) = r_433_436,
    s_433_437 * (const 64 2) = s_433_436
;

assume
    f_413_low60_20_low20_4 = f_413_low60_20_low20_3,
    u_433_437 = u_433_436,
    v_433_437 = v_433_436,
    g_413_low60_20_low20_4 * 2 = g_413_low60_20_low20_3,
    r_433_437 * 2 = r_433_436,
    s_433_437 * 2 = s_433_436
&&
    true
;

{
    u_433_437 * f_413_low60_20_low20_0 + v_433_437 * g_413_low60_20_low20_0 = f_413_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_437 * f_413_low60_20_low20_0 + s_433_437 * g_413_low60_20_low20_0 = g_413_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_4 + u_433_437 * (const 64 (2**21)) + v_433_437 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_4 + r_433_437 * (const 64 (2**21)) + s_433_437 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_4,
    f_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_4,
    g_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 437)) <=s delta, delta <=s (const 64 (1 + 2*437)),
    (const 64 (-(2**20))) <=s u_433_437, u_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_437, v_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_437, r_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_437, s_433_437 <=s (const 64 ((2**20)-1)),
    u_433_437 + v_433_437 <=s (const 64 (2**20)),
    u_433_437 - v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 + v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 - v_433_437 <=s (const 64 (2**20)),
    r_433_437 + s_433_437 <=s (const 64 (2**20)),
    r_433_437 - s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 + s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 - s_433_437 <=s (const 64 (2**20)),
    u_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_433_437 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_436_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_3,
sint64 g_413_low60_20_low20_3,
sint64 f_413_low60_20_low20_4,
sint64 g_413_low60_20_low20_4,
sint64 u_433_436,
sint64 v_433_436,
sint64 r_433_436,
sint64 s_433_436,
sint64 u_433_437,
sint64 v_433_437,
sint64 r_433_437,
sint64 s_433_437,
bit ne
)={
    u_433_436 * f_413_low60_20_low20_0 + v_433_436 * g_413_low60_20_low20_0 = f_413_low60_20_low20_3 * (-(2**20)),
    r_433_436 * f_413_low60_20_low20_0 + s_433_436 * g_413_low60_20_low20_0 = g_413_low60_20_low20_3 * (-(2**20))
&&
    u_433_436 * f_413_low60_20_low20_0 + v_433_436 * g_413_low60_20_low20_0 = f_413_low60_20_low20_3 * (const 64 (-(2**20))),
    r_433_436 * f_413_low60_20_low20_0 + s_433_436 * g_413_low60_20_low20_0 = g_413_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_3 + u_433_436 * (const 64 (2**21)) + v_433_436 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_3 + r_433_436 * (const 64 (2**21)) + s_433_436 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_3,
    f_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_3,
    g_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 436)) <=s delta, delta <=s (const 64 (1 + 2*436)),
    (const 64 (-(2**20))) <=s u_433_436, u_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_436, v_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_436, r_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_436, s_433_436 <=s (const 64 ((2**20)-1)),
    u_433_436 + v_433_436 <=s (const 64 (2**20)),
    u_433_436 - v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 + v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 - v_433_436 <=s (const 64 (2**20)),
    r_433_436 + s_433_436 <=s (const 64 (2**20)),
    r_433_436 - s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 + s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 - s_433_436 <=s (const 64 (2**20)),
    u_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_433_436 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step436

// premise b
assume
g_413_low60_20_low20_3 = 1 (mod 2)
&&
g_413_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_4 f_413_low60_20_low20_3;
mov u_433_437 u_433_436;
mov v_433_437 v_433_436;

add g_413_low60_20_low20_4 g_413_low60_20_low20_3 f_413_low60_20_low20_3;
asr g_413_low60_20_low20_4 g_413_low60_20_low20_4 1;
add r_433_437 r_433_436 u_433_436;
asr r_433_437 r_433_437 1;
add s_433_437 s_433_436 v_433_436;
asr s_433_437 s_433_437 1;
assert
    true
&&
    f_413_low60_20_low20_4 = f_413_low60_20_low20_3,
    u_433_437 = u_433_436,
    v_433_437 = v_433_436,
    g_413_low60_20_low20_4 * (const 64 2) = g_413_low60_20_low20_3 + f_413_low60_20_low20_3,
    r_433_437 * (const 64 2) = r_433_436 + u_433_436,
    s_433_437 * (const 64 2) = s_433_436 + v_433_436
;

assume
    f_413_low60_20_low20_4 = f_413_low60_20_low20_3,
    u_433_437 = u_433_436,
    v_433_437 = v_433_436,
    g_413_low60_20_low20_4 * 2 = g_413_low60_20_low20_3 + f_413_low60_20_low20_3,
    r_433_437 * 2 = r_433_436 + u_433_436,
    s_433_437 * 2 = s_433_436 + v_433_436
&&
    true
;

{
    u_433_437 * f_413_low60_20_low20_0 + v_433_437 * g_413_low60_20_low20_0 = f_413_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_437 * f_413_low60_20_low20_0 + s_433_437 * g_413_low60_20_low20_0 = g_413_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_4 + u_433_437 * (const 64 (2**21)) + v_433_437 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_4 + r_433_437 * (const 64 (2**21)) + s_433_437 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_4,
    f_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_4,
    g_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 437)) <=s delta, delta <=s (const 64 (1 + 2*437)),
    (const 64 (-(2**20))) <=s u_433_437, u_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_437, v_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_437, r_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_437, s_433_437 <=s (const 64 ((2**20)-1)),
    u_433_437 + v_433_437 <=s (const 64 (2**20)),
    u_433_437 - v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 + v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 - v_433_437 <=s (const 64 (2**20)),
    r_433_437 + s_433_437 <=s (const 64 (2**20)),
    r_433_437 - s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 + s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 - s_433_437 <=s (const 64 (2**20)),
    u_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_433_437 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_436_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_3,
sint64 g_413_low60_20_low20_3,
sint64 f_413_low60_20_low20_4,
sint64 g_413_low60_20_low20_4,
sint64 u_433_436,
sint64 v_433_436,
sint64 r_433_436,
sint64 s_433_436,
sint64 u_433_437,
sint64 v_433_437,
sint64 r_433_437,
sint64 s_433_437,
bit ne
)={
    u_433_436 * f_413_low60_20_low20_0 + v_433_436 * g_413_low60_20_low20_0 = f_413_low60_20_low20_3 * (-(2**20)),
    r_433_436 * f_413_low60_20_low20_0 + s_433_436 * g_413_low60_20_low20_0 = g_413_low60_20_low20_3 * (-(2**20))
&&
    u_433_436 * f_413_low60_20_low20_0 + v_433_436 * g_413_low60_20_low20_0 = f_413_low60_20_low20_3 * (const 64 (-(2**20))),
    r_433_436 * f_413_low60_20_low20_0 + s_433_436 * g_413_low60_20_low20_0 = g_413_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_3 + u_433_436 * (const 64 (2**21)) + v_433_436 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_3 + r_433_436 * (const 64 (2**21)) + s_433_436 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_3,
    f_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_3,
    g_413_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 436)) <=s delta, delta <=s (const 64 (1 + 2*436)),
    (const 64 (-(2**20))) <=s u_433_436, u_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_436, v_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_436, r_433_436 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_436, s_433_436 <=s (const 64 ((2**20)-1)),
    u_433_436 + v_433_436 <=s (const 64 (2**20)),
    u_433_436 - v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 + v_433_436 <=s (const 64 (2**20)),
    (const 64 0) - u_433_436 - v_433_436 <=s (const 64 (2**20)),
    r_433_436 + s_433_436 <=s (const 64 (2**20)),
    r_433_436 - s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 + s_433_436 <=s (const 64 (2**20)),
    (const 64 0) - r_433_436 - s_433_436 <=s (const 64 (2**20)),
    u_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_433_436 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_433_436 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step436

// premise c
assume
g_413_low60_20_low20_3 = 1 (mod 2)
&&
g_413_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_4 g_413_low60_20_low20_3;
mov u_433_437 r_433_436;
mov v_433_437 s_433_436;

subs dc g_413_low60_20_low20_4 g_413_low60_20_low20_3 f_413_low60_20_low20_3;
asr g_413_low60_20_low20_4 g_413_low60_20_low20_4 1;
subs dc r_433_437 r_433_436 u_433_436;
asr r_433_437 r_433_437 1;
subs dc s_433_437 s_433_436 v_433_436;
asr s_433_437 s_433_437 1;
assert
    true
&&
    f_413_low60_20_low20_4 = g_413_low60_20_low20_3,
    u_433_437 = r_433_436,
    v_433_437 = s_433_436,
    g_413_low60_20_low20_4 * (const 64 2) = g_413_low60_20_low20_3 - f_413_low60_20_low20_3,
    r_433_437 * (const 64 2) = r_433_436 - u_433_436,
    s_433_437 * (const 64 2) = s_433_436 - v_433_436
;

assume
    f_413_low60_20_low20_4 = g_413_low60_20_low20_3,
    u_433_437 = r_433_436,
    v_433_437 = s_433_436,
    g_413_low60_20_low20_4 * 2 = g_413_low60_20_low20_3 - f_413_low60_20_low20_3,
    r_433_437 * 2 = r_433_436 - u_433_436,
    s_433_437 * 2 = s_433_436 - v_433_436
&&
    true
;

{
    u_433_437 * f_413_low60_20_low20_0 + v_433_437 * g_413_low60_20_low20_0 = f_413_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_437 * f_413_low60_20_low20_0 + s_433_437 * g_413_low60_20_low20_0 = g_413_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_4 + u_433_437 * (const 64 (2**21)) + v_433_437 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_4 + r_433_437 * (const 64 (2**21)) + s_433_437 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_4,
    f_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_4,
    g_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 437)) <=s delta, delta <=s (const 64 (1 + 2*437)),
    (const 64 (-(2**20))) <=s u_433_437, u_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_437, v_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_437, r_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_437, s_433_437 <=s (const 64 ((2**20)-1)),
    u_433_437 + v_433_437 <=s (const 64 (2**20)),
    u_433_437 - v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 + v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 - v_433_437 <=s (const 64 (2**20)),
    r_433_437 + s_433_437 <=s (const 64 (2**20)),
    r_433_437 - s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 + s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 - s_433_437 <=s (const 64 (2**20)),
    u_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_433_437 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_437_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_4,
sint64 g_413_low60_20_low20_4,
sint64 f_413_low60_20_low20_5,
sint64 g_413_low60_20_low20_5,
sint64 u_433_437,
sint64 v_433_437,
sint64 r_433_437,
sint64 s_433_437,
sint64 u_433_438,
sint64 v_433_438,
sint64 r_433_438,
sint64 s_433_438,
bit ne
)={
    u_433_437 * f_413_low60_20_low20_0 + v_433_437 * g_413_low60_20_low20_0 = f_413_low60_20_low20_4 * (-(2**20)),
    r_433_437 * f_413_low60_20_low20_0 + s_433_437 * g_413_low60_20_low20_0 = g_413_low60_20_low20_4 * (-(2**20))
&&
    u_433_437 * f_413_low60_20_low20_0 + v_433_437 * g_413_low60_20_low20_0 = f_413_low60_20_low20_4 * (const 64 (-(2**20))),
    r_433_437 * f_413_low60_20_low20_0 + s_433_437 * g_413_low60_20_low20_0 = g_413_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_4 + u_433_437 * (const 64 (2**21)) + v_433_437 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_4 + r_433_437 * (const 64 (2**21)) + s_433_437 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_4,
    f_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_4,
    g_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 437)) <=s delta, delta <=s (const 64 (1 + 2*437)),
    (const 64 (-(2**20))) <=s u_433_437, u_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_437, v_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_437, r_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_437, s_433_437 <=s (const 64 ((2**20)-1)),
    u_433_437 + v_433_437 <=s (const 64 (2**20)),
    u_433_437 - v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 + v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 - v_433_437 <=s (const 64 (2**20)),
    r_433_437 + s_433_437 <=s (const 64 (2**20)),
    r_433_437 - s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 + s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 - s_433_437 <=s (const 64 (2**20)),
    u_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_433_437 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step437

// premise a
assume
g_413_low60_20_low20_4 = 0 (mod 2)
&&
g_413_low60_20_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_5 f_413_low60_20_low20_4;
mov u_433_438 u_433_437;
mov v_433_438 v_433_437;

asr g_413_low60_20_low20_5 g_413_low60_20_low20_4 1;
asr r_433_438 r_433_437 1;
asr s_433_438 s_433_437 1;
assert
    true
&&
    f_413_low60_20_low20_5 = f_413_low60_20_low20_4,
    u_433_438 = u_433_437,
    v_433_438 = v_433_437,
    g_413_low60_20_low20_5 * (const 64 2) = g_413_low60_20_low20_4,
    r_433_438 * (const 64 2) = r_433_437,
    s_433_438 * (const 64 2) = s_433_437
;

assume
    f_413_low60_20_low20_5 = f_413_low60_20_low20_4,
    u_433_438 = u_433_437,
    v_433_438 = v_433_437,
    g_413_low60_20_low20_5 * 2 = g_413_low60_20_low20_4,
    r_433_438 * 2 = r_433_437,
    s_433_438 * 2 = s_433_437
&&
    true
;

{
    u_433_438 * f_413_low60_20_low20_0 + v_433_438 * g_413_low60_20_low20_0 = f_413_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_438 * f_413_low60_20_low20_0 + s_433_438 * g_413_low60_20_low20_0 = g_413_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_5 + u_433_438 * (const 64 (2**21)) + v_433_438 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_5 + r_433_438 * (const 64 (2**21)) + s_433_438 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_5,
    f_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_5,
    g_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 438)) <=s delta, delta <=s (const 64 (1 + 2*438)),
    (const 64 (-(2**20))) <=s u_433_438, u_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_438, v_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_438, r_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_438, s_433_438 <=s (const 64 ((2**20)-1)),
    u_433_438 + v_433_438 <=s (const 64 (2**20)),
    u_433_438 - v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 + v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 - v_433_438 <=s (const 64 (2**20)),
    r_433_438 + s_433_438 <=s (const 64 (2**20)),
    r_433_438 - s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 + s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 - s_433_438 <=s (const 64 (2**20)),
    u_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_433_438 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_437_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_4,
sint64 g_413_low60_20_low20_4,
sint64 f_413_low60_20_low20_5,
sint64 g_413_low60_20_low20_5,
sint64 u_433_437,
sint64 v_433_437,
sint64 r_433_437,
sint64 s_433_437,
sint64 u_433_438,
sint64 v_433_438,
sint64 r_433_438,
sint64 s_433_438,
bit ne
)={
    u_433_437 * f_413_low60_20_low20_0 + v_433_437 * g_413_low60_20_low20_0 = f_413_low60_20_low20_4 * (-(2**20)),
    r_433_437 * f_413_low60_20_low20_0 + s_433_437 * g_413_low60_20_low20_0 = g_413_low60_20_low20_4 * (-(2**20))
&&
    u_433_437 * f_413_low60_20_low20_0 + v_433_437 * g_413_low60_20_low20_0 = f_413_low60_20_low20_4 * (const 64 (-(2**20))),
    r_433_437 * f_413_low60_20_low20_0 + s_433_437 * g_413_low60_20_low20_0 = g_413_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_4 + u_433_437 * (const 64 (2**21)) + v_433_437 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_4 + r_433_437 * (const 64 (2**21)) + s_433_437 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_4,
    f_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_4,
    g_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 437)) <=s delta, delta <=s (const 64 (1 + 2*437)),
    (const 64 (-(2**20))) <=s u_433_437, u_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_437, v_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_437, r_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_437, s_433_437 <=s (const 64 ((2**20)-1)),
    u_433_437 + v_433_437 <=s (const 64 (2**20)),
    u_433_437 - v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 + v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 - v_433_437 <=s (const 64 (2**20)),
    r_433_437 + s_433_437 <=s (const 64 (2**20)),
    r_433_437 - s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 + s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 - s_433_437 <=s (const 64 (2**20)),
    u_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_433_437 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step437

// premise b
assume
g_413_low60_20_low20_4 = 1 (mod 2)
&&
g_413_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_5 f_413_low60_20_low20_4;
mov u_433_438 u_433_437;
mov v_433_438 v_433_437;

add g_413_low60_20_low20_5 g_413_low60_20_low20_4 f_413_low60_20_low20_4;
asr g_413_low60_20_low20_5 g_413_low60_20_low20_5 1;
add r_433_438 r_433_437 u_433_437;
asr r_433_438 r_433_438 1;
add s_433_438 s_433_437 v_433_437;
asr s_433_438 s_433_438 1;
assert
    true
&&
    f_413_low60_20_low20_5 = f_413_low60_20_low20_4,
    u_433_438 = u_433_437,
    v_433_438 = v_433_437,
    g_413_low60_20_low20_5 * (const 64 2) = g_413_low60_20_low20_4 + f_413_low60_20_low20_4,
    r_433_438 * (const 64 2) = r_433_437 + u_433_437,
    s_433_438 * (const 64 2) = s_433_437 + v_433_437
;

assume
    f_413_low60_20_low20_5 = f_413_low60_20_low20_4,
    u_433_438 = u_433_437,
    v_433_438 = v_433_437,
    g_413_low60_20_low20_5 * 2 = g_413_low60_20_low20_4 + f_413_low60_20_low20_4,
    r_433_438 * 2 = r_433_437 + u_433_437,
    s_433_438 * 2 = s_433_437 + v_433_437
&&
    true
;

{
    u_433_438 * f_413_low60_20_low20_0 + v_433_438 * g_413_low60_20_low20_0 = f_413_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_438 * f_413_low60_20_low20_0 + s_433_438 * g_413_low60_20_low20_0 = g_413_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_5 + u_433_438 * (const 64 (2**21)) + v_433_438 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_5 + r_433_438 * (const 64 (2**21)) + s_433_438 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_5,
    f_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_5,
    g_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 438)) <=s delta, delta <=s (const 64 (1 + 2*438)),
    (const 64 (-(2**20))) <=s u_433_438, u_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_438, v_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_438, r_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_438, s_433_438 <=s (const 64 ((2**20)-1)),
    u_433_438 + v_433_438 <=s (const 64 (2**20)),
    u_433_438 - v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 + v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 - v_433_438 <=s (const 64 (2**20)),
    r_433_438 + s_433_438 <=s (const 64 (2**20)),
    r_433_438 - s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 + s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 - s_433_438 <=s (const 64 (2**20)),
    u_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_433_438 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_437_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_4,
sint64 g_413_low60_20_low20_4,
sint64 f_413_low60_20_low20_5,
sint64 g_413_low60_20_low20_5,
sint64 u_433_437,
sint64 v_433_437,
sint64 r_433_437,
sint64 s_433_437,
sint64 u_433_438,
sint64 v_433_438,
sint64 r_433_438,
sint64 s_433_438,
bit ne
)={
    u_433_437 * f_413_low60_20_low20_0 + v_433_437 * g_413_low60_20_low20_0 = f_413_low60_20_low20_4 * (-(2**20)),
    r_433_437 * f_413_low60_20_low20_0 + s_433_437 * g_413_low60_20_low20_0 = g_413_low60_20_low20_4 * (-(2**20))
&&
    u_433_437 * f_413_low60_20_low20_0 + v_433_437 * g_413_low60_20_low20_0 = f_413_low60_20_low20_4 * (const 64 (-(2**20))),
    r_433_437 * f_413_low60_20_low20_0 + s_433_437 * g_413_low60_20_low20_0 = g_413_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_4 + u_433_437 * (const 64 (2**21)) + v_433_437 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_4 + r_433_437 * (const 64 (2**21)) + s_433_437 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_4,
    f_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_4,
    g_413_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 437)) <=s delta, delta <=s (const 64 (1 + 2*437)),
    (const 64 (-(2**20))) <=s u_433_437, u_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_437, v_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_437, r_433_437 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_437, s_433_437 <=s (const 64 ((2**20)-1)),
    u_433_437 + v_433_437 <=s (const 64 (2**20)),
    u_433_437 - v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 + v_433_437 <=s (const 64 (2**20)),
    (const 64 0) - u_433_437 - v_433_437 <=s (const 64 (2**20)),
    r_433_437 + s_433_437 <=s (const 64 (2**20)),
    r_433_437 - s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 + s_433_437 <=s (const 64 (2**20)),
    (const 64 0) - r_433_437 - s_433_437 <=s (const 64 (2**20)),
    u_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_433_437 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_433_437 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step437

// premise c
assume
g_413_low60_20_low20_4 = 1 (mod 2)
&&
g_413_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_5 g_413_low60_20_low20_4;
mov u_433_438 r_433_437;
mov v_433_438 s_433_437;

subs dc g_413_low60_20_low20_5 g_413_low60_20_low20_4 f_413_low60_20_low20_4;
asr g_413_low60_20_low20_5 g_413_low60_20_low20_5 1;
subs dc r_433_438 r_433_437 u_433_437;
asr r_433_438 r_433_438 1;
subs dc s_433_438 s_433_437 v_433_437;
asr s_433_438 s_433_438 1;
assert
    true
&&
    f_413_low60_20_low20_5 = g_413_low60_20_low20_4,
    u_433_438 = r_433_437,
    v_433_438 = s_433_437,
    g_413_low60_20_low20_5 * (const 64 2) = g_413_low60_20_low20_4 - f_413_low60_20_low20_4,
    r_433_438 * (const 64 2) = r_433_437 - u_433_437,
    s_433_438 * (const 64 2) = s_433_437 - v_433_437
;

assume
    f_413_low60_20_low20_5 = g_413_low60_20_low20_4,
    u_433_438 = r_433_437,
    v_433_438 = s_433_437,
    g_413_low60_20_low20_5 * 2 = g_413_low60_20_low20_4 - f_413_low60_20_low20_4,
    r_433_438 * 2 = r_433_437 - u_433_437,
    s_433_438 * 2 = s_433_437 - v_433_437
&&
    true
;

{
    u_433_438 * f_413_low60_20_low20_0 + v_433_438 * g_413_low60_20_low20_0 = f_413_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_438 * f_413_low60_20_low20_0 + s_433_438 * g_413_low60_20_low20_0 = g_413_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_5 + u_433_438 * (const 64 (2**21)) + v_433_438 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_5 + r_433_438 * (const 64 (2**21)) + s_433_438 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_5,
    f_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_5,
    g_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 438)) <=s delta, delta <=s (const 64 (1 + 2*438)),
    (const 64 (-(2**20))) <=s u_433_438, u_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_438, v_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_438, r_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_438, s_433_438 <=s (const 64 ((2**20)-1)),
    u_433_438 + v_433_438 <=s (const 64 (2**20)),
    u_433_438 - v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 + v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 - v_433_438 <=s (const 64 (2**20)),
    r_433_438 + s_433_438 <=s (const 64 (2**20)),
    r_433_438 - s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 + s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 - s_433_438 <=s (const 64 (2**20)),
    u_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_433_438 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_438_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_5,
sint64 g_413_low60_20_low20_5,
sint64 f_413_low60_20_low20_6,
sint64 g_413_low60_20_low20_6,
sint64 u_433_438,
sint64 v_433_438,
sint64 r_433_438,
sint64 s_433_438,
sint64 u_433_439,
sint64 v_433_439,
sint64 r_433_439,
sint64 s_433_439,
bit ne
)={
    u_433_438 * f_413_low60_20_low20_0 + v_433_438 * g_413_low60_20_low20_0 = f_413_low60_20_low20_5 * (-(2**20)),
    r_433_438 * f_413_low60_20_low20_0 + s_433_438 * g_413_low60_20_low20_0 = g_413_low60_20_low20_5 * (-(2**20))
&&
    u_433_438 * f_413_low60_20_low20_0 + v_433_438 * g_413_low60_20_low20_0 = f_413_low60_20_low20_5 * (const 64 (-(2**20))),
    r_433_438 * f_413_low60_20_low20_0 + s_433_438 * g_413_low60_20_low20_0 = g_413_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_5 + u_433_438 * (const 64 (2**21)) + v_433_438 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_5 + r_433_438 * (const 64 (2**21)) + s_433_438 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_5,
    f_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_5,
    g_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 438)) <=s delta, delta <=s (const 64 (1 + 2*438)),
    (const 64 (-(2**20))) <=s u_433_438, u_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_438, v_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_438, r_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_438, s_433_438 <=s (const 64 ((2**20)-1)),
    u_433_438 + v_433_438 <=s (const 64 (2**20)),
    u_433_438 - v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 + v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 - v_433_438 <=s (const 64 (2**20)),
    r_433_438 + s_433_438 <=s (const 64 (2**20)),
    r_433_438 - s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 + s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 - s_433_438 <=s (const 64 (2**20)),
    u_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_433_438 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step438

// premise a
assume
g_413_low60_20_low20_5 = 0 (mod 2)
&&
g_413_low60_20_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_6 f_413_low60_20_low20_5;
mov u_433_439 u_433_438;
mov v_433_439 v_433_438;

asr g_413_low60_20_low20_6 g_413_low60_20_low20_5 1;
asr r_433_439 r_433_438 1;
asr s_433_439 s_433_438 1;
assert
    true
&&
    f_413_low60_20_low20_6 = f_413_low60_20_low20_5,
    u_433_439 = u_433_438,
    v_433_439 = v_433_438,
    g_413_low60_20_low20_6 * (const 64 2) = g_413_low60_20_low20_5,
    r_433_439 * (const 64 2) = r_433_438,
    s_433_439 * (const 64 2) = s_433_438
;

assume
    f_413_low60_20_low20_6 = f_413_low60_20_low20_5,
    u_433_439 = u_433_438,
    v_433_439 = v_433_438,
    g_413_low60_20_low20_6 * 2 = g_413_low60_20_low20_5,
    r_433_439 * 2 = r_433_438,
    s_433_439 * 2 = s_433_438
&&
    true
;

{
    u_433_439 * f_413_low60_20_low20_0 + v_433_439 * g_413_low60_20_low20_0 = f_413_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_439 * f_413_low60_20_low20_0 + s_433_439 * g_413_low60_20_low20_0 = g_413_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_6 + u_433_439 * (const 64 (2**21)) + v_433_439 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_6 + r_433_439 * (const 64 (2**21)) + s_433_439 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_6,
    f_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_6,
    g_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 439)) <=s delta, delta <=s (const 64 (1 + 2*439)),
    (const 64 (-(2**20))) <=s u_433_439, u_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_439, v_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_439, r_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_439, s_433_439 <=s (const 64 ((2**20)-1)),
    u_433_439 + v_433_439 <=s (const 64 (2**20)),
    u_433_439 - v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 + v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 - v_433_439 <=s (const 64 (2**20)),
    r_433_439 + s_433_439 <=s (const 64 (2**20)),
    r_433_439 - s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 + s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 - s_433_439 <=s (const 64 (2**20)),
    u_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_433_439 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_438_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_5,
sint64 g_413_low60_20_low20_5,
sint64 f_413_low60_20_low20_6,
sint64 g_413_low60_20_low20_6,
sint64 u_433_438,
sint64 v_433_438,
sint64 r_433_438,
sint64 s_433_438,
sint64 u_433_439,
sint64 v_433_439,
sint64 r_433_439,
sint64 s_433_439,
bit ne
)={
    u_433_438 * f_413_low60_20_low20_0 + v_433_438 * g_413_low60_20_low20_0 = f_413_low60_20_low20_5 * (-(2**20)),
    r_433_438 * f_413_low60_20_low20_0 + s_433_438 * g_413_low60_20_low20_0 = g_413_low60_20_low20_5 * (-(2**20))
&&
    u_433_438 * f_413_low60_20_low20_0 + v_433_438 * g_413_low60_20_low20_0 = f_413_low60_20_low20_5 * (const 64 (-(2**20))),
    r_433_438 * f_413_low60_20_low20_0 + s_433_438 * g_413_low60_20_low20_0 = g_413_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_5 + u_433_438 * (const 64 (2**21)) + v_433_438 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_5 + r_433_438 * (const 64 (2**21)) + s_433_438 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_5,
    f_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_5,
    g_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 438)) <=s delta, delta <=s (const 64 (1 + 2*438)),
    (const 64 (-(2**20))) <=s u_433_438, u_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_438, v_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_438, r_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_438, s_433_438 <=s (const 64 ((2**20)-1)),
    u_433_438 + v_433_438 <=s (const 64 (2**20)),
    u_433_438 - v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 + v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 - v_433_438 <=s (const 64 (2**20)),
    r_433_438 + s_433_438 <=s (const 64 (2**20)),
    r_433_438 - s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 + s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 - s_433_438 <=s (const 64 (2**20)),
    u_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_433_438 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step438

// premise b
assume
g_413_low60_20_low20_5 = 1 (mod 2)
&&
g_413_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_6 f_413_low60_20_low20_5;
mov u_433_439 u_433_438;
mov v_433_439 v_433_438;

add g_413_low60_20_low20_6 g_413_low60_20_low20_5 f_413_low60_20_low20_5;
asr g_413_low60_20_low20_6 g_413_low60_20_low20_6 1;
add r_433_439 r_433_438 u_433_438;
asr r_433_439 r_433_439 1;
add s_433_439 s_433_438 v_433_438;
asr s_433_439 s_433_439 1;
assert
    true
&&
    f_413_low60_20_low20_6 = f_413_low60_20_low20_5,
    u_433_439 = u_433_438,
    v_433_439 = v_433_438,
    g_413_low60_20_low20_6 * (const 64 2) = g_413_low60_20_low20_5 + f_413_low60_20_low20_5,
    r_433_439 * (const 64 2) = r_433_438 + u_433_438,
    s_433_439 * (const 64 2) = s_433_438 + v_433_438
;

assume
    f_413_low60_20_low20_6 = f_413_low60_20_low20_5,
    u_433_439 = u_433_438,
    v_433_439 = v_433_438,
    g_413_low60_20_low20_6 * 2 = g_413_low60_20_low20_5 + f_413_low60_20_low20_5,
    r_433_439 * 2 = r_433_438 + u_433_438,
    s_433_439 * 2 = s_433_438 + v_433_438
&&
    true
;

{
    u_433_439 * f_413_low60_20_low20_0 + v_433_439 * g_413_low60_20_low20_0 = f_413_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_439 * f_413_low60_20_low20_0 + s_433_439 * g_413_low60_20_low20_0 = g_413_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_6 + u_433_439 * (const 64 (2**21)) + v_433_439 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_6 + r_433_439 * (const 64 (2**21)) + s_433_439 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_6,
    f_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_6,
    g_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 439)) <=s delta, delta <=s (const 64 (1 + 2*439)),
    (const 64 (-(2**20))) <=s u_433_439, u_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_439, v_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_439, r_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_439, s_433_439 <=s (const 64 ((2**20)-1)),
    u_433_439 + v_433_439 <=s (const 64 (2**20)),
    u_433_439 - v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 + v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 - v_433_439 <=s (const 64 (2**20)),
    r_433_439 + s_433_439 <=s (const 64 (2**20)),
    r_433_439 - s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 + s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 - s_433_439 <=s (const 64 (2**20)),
    u_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_433_439 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_438_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_5,
sint64 g_413_low60_20_low20_5,
sint64 f_413_low60_20_low20_6,
sint64 g_413_low60_20_low20_6,
sint64 u_433_438,
sint64 v_433_438,
sint64 r_433_438,
sint64 s_433_438,
sint64 u_433_439,
sint64 v_433_439,
sint64 r_433_439,
sint64 s_433_439,
bit ne
)={
    u_433_438 * f_413_low60_20_low20_0 + v_433_438 * g_413_low60_20_low20_0 = f_413_low60_20_low20_5 * (-(2**20)),
    r_433_438 * f_413_low60_20_low20_0 + s_433_438 * g_413_low60_20_low20_0 = g_413_low60_20_low20_5 * (-(2**20))
&&
    u_433_438 * f_413_low60_20_low20_0 + v_433_438 * g_413_low60_20_low20_0 = f_413_low60_20_low20_5 * (const 64 (-(2**20))),
    r_433_438 * f_413_low60_20_low20_0 + s_433_438 * g_413_low60_20_low20_0 = g_413_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_5 + u_433_438 * (const 64 (2**21)) + v_433_438 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_5 + r_433_438 * (const 64 (2**21)) + s_433_438 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_5,
    f_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_5,
    g_413_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 438)) <=s delta, delta <=s (const 64 (1 + 2*438)),
    (const 64 (-(2**20))) <=s u_433_438, u_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_438, v_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_438, r_433_438 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_438, s_433_438 <=s (const 64 ((2**20)-1)),
    u_433_438 + v_433_438 <=s (const 64 (2**20)),
    u_433_438 - v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 + v_433_438 <=s (const 64 (2**20)),
    (const 64 0) - u_433_438 - v_433_438 <=s (const 64 (2**20)),
    r_433_438 + s_433_438 <=s (const 64 (2**20)),
    r_433_438 - s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 + s_433_438 <=s (const 64 (2**20)),
    (const 64 0) - r_433_438 - s_433_438 <=s (const 64 (2**20)),
    u_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_433_438 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_433_438 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step438

// premise c
assume
g_413_low60_20_low20_5 = 1 (mod 2)
&&
g_413_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_6 g_413_low60_20_low20_5;
mov u_433_439 r_433_438;
mov v_433_439 s_433_438;

subs dc g_413_low60_20_low20_6 g_413_low60_20_low20_5 f_413_low60_20_low20_5;
asr g_413_low60_20_low20_6 g_413_low60_20_low20_6 1;
subs dc r_433_439 r_433_438 u_433_438;
asr r_433_439 r_433_439 1;
subs dc s_433_439 s_433_438 v_433_438;
asr s_433_439 s_433_439 1;
assert
    true
&&
    f_413_low60_20_low20_6 = g_413_low60_20_low20_5,
    u_433_439 = r_433_438,
    v_433_439 = s_433_438,
    g_413_low60_20_low20_6 * (const 64 2) = g_413_low60_20_low20_5 - f_413_low60_20_low20_5,
    r_433_439 * (const 64 2) = r_433_438 - u_433_438,
    s_433_439 * (const 64 2) = s_433_438 - v_433_438
;

assume
    f_413_low60_20_low20_6 = g_413_low60_20_low20_5,
    u_433_439 = r_433_438,
    v_433_439 = s_433_438,
    g_413_low60_20_low20_6 * 2 = g_413_low60_20_low20_5 - f_413_low60_20_low20_5,
    r_433_439 * 2 = r_433_438 - u_433_438,
    s_433_439 * 2 = s_433_438 - v_433_438
&&
    true
;

{
    u_433_439 * f_413_low60_20_low20_0 + v_433_439 * g_413_low60_20_low20_0 = f_413_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_439 * f_413_low60_20_low20_0 + s_433_439 * g_413_low60_20_low20_0 = g_413_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_6 + u_433_439 * (const 64 (2**21)) + v_433_439 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_6 + r_433_439 * (const 64 (2**21)) + s_433_439 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_6,
    f_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_6,
    g_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 439)) <=s delta, delta <=s (const 64 (1 + 2*439)),
    (const 64 (-(2**20))) <=s u_433_439, u_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_439, v_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_439, r_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_439, s_433_439 <=s (const 64 ((2**20)-1)),
    u_433_439 + v_433_439 <=s (const 64 (2**20)),
    u_433_439 - v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 + v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 - v_433_439 <=s (const 64 (2**20)),
    r_433_439 + s_433_439 <=s (const 64 (2**20)),
    r_433_439 - s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 + s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 - s_433_439 <=s (const 64 (2**20)),
    u_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_433_439 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_439_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_6,
sint64 g_413_low60_20_low20_6,
sint64 f_413_low60_20_low20_7,
sint64 g_413_low60_20_low20_7,
sint64 u_433_439,
sint64 v_433_439,
sint64 r_433_439,
sint64 s_433_439,
sint64 u_433_440,
sint64 v_433_440,
sint64 r_433_440,
sint64 s_433_440,
bit ne
)={
    u_433_439 * f_413_low60_20_low20_0 + v_433_439 * g_413_low60_20_low20_0 = f_413_low60_20_low20_6 * (-(2**20)),
    r_433_439 * f_413_low60_20_low20_0 + s_433_439 * g_413_low60_20_low20_0 = g_413_low60_20_low20_6 * (-(2**20))
&&
    u_433_439 * f_413_low60_20_low20_0 + v_433_439 * g_413_low60_20_low20_0 = f_413_low60_20_low20_6 * (const 64 (-(2**20))),
    r_433_439 * f_413_low60_20_low20_0 + s_433_439 * g_413_low60_20_low20_0 = g_413_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_6 + u_433_439 * (const 64 (2**21)) + v_433_439 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_6 + r_433_439 * (const 64 (2**21)) + s_433_439 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_6,
    f_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_6,
    g_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 439)) <=s delta, delta <=s (const 64 (1 + 2*439)),
    (const 64 (-(2**20))) <=s u_433_439, u_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_439, v_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_439, r_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_439, s_433_439 <=s (const 64 ((2**20)-1)),
    u_433_439 + v_433_439 <=s (const 64 (2**20)),
    u_433_439 - v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 + v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 - v_433_439 <=s (const 64 (2**20)),
    r_433_439 + s_433_439 <=s (const 64 (2**20)),
    r_433_439 - s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 + s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 - s_433_439 <=s (const 64 (2**20)),
    u_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_433_439 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step439

// premise a
assume
g_413_low60_20_low20_6 = 0 (mod 2)
&&
g_413_low60_20_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_7 f_413_low60_20_low20_6;
mov u_433_440 u_433_439;
mov v_433_440 v_433_439;

asr g_413_low60_20_low20_7 g_413_low60_20_low20_6 1;
asr r_433_440 r_433_439 1;
asr s_433_440 s_433_439 1;
assert
    true
&&
    f_413_low60_20_low20_7 = f_413_low60_20_low20_6,
    u_433_440 = u_433_439,
    v_433_440 = v_433_439,
    g_413_low60_20_low20_7 * (const 64 2) = g_413_low60_20_low20_6,
    r_433_440 * (const 64 2) = r_433_439,
    s_433_440 * (const 64 2) = s_433_439
;

assume
    f_413_low60_20_low20_7 = f_413_low60_20_low20_6,
    u_433_440 = u_433_439,
    v_433_440 = v_433_439,
    g_413_low60_20_low20_7 * 2 = g_413_low60_20_low20_6,
    r_433_440 * 2 = r_433_439,
    s_433_440 * 2 = s_433_439
&&
    true
;

{
    u_433_440 * f_413_low60_20_low20_0 + v_433_440 * g_413_low60_20_low20_0 = f_413_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_440 * f_413_low60_20_low20_0 + s_433_440 * g_413_low60_20_low20_0 = g_413_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_7 + u_433_440 * (const 64 (2**21)) + v_433_440 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_7 + r_433_440 * (const 64 (2**21)) + s_433_440 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_7,
    f_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_7,
    g_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 440)) <=s delta, delta <=s (const 64 (1 + 2*440)),
    (const 64 (-(2**20))) <=s u_433_440, u_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_440, v_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_440, r_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_440, s_433_440 <=s (const 64 ((2**20)-1)),
    u_433_440 + v_433_440 <=s (const 64 (2**20)),
    u_433_440 - v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 + v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 - v_433_440 <=s (const 64 (2**20)),
    r_433_440 + s_433_440 <=s (const 64 (2**20)),
    r_433_440 - s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 + s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 - s_433_440 <=s (const 64 (2**20)),
    u_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_433_440 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_439_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_6,
sint64 g_413_low60_20_low20_6,
sint64 f_413_low60_20_low20_7,
sint64 g_413_low60_20_low20_7,
sint64 u_433_439,
sint64 v_433_439,
sint64 r_433_439,
sint64 s_433_439,
sint64 u_433_440,
sint64 v_433_440,
sint64 r_433_440,
sint64 s_433_440,
bit ne
)={
    u_433_439 * f_413_low60_20_low20_0 + v_433_439 * g_413_low60_20_low20_0 = f_413_low60_20_low20_6 * (-(2**20)),
    r_433_439 * f_413_low60_20_low20_0 + s_433_439 * g_413_low60_20_low20_0 = g_413_low60_20_low20_6 * (-(2**20))
&&
    u_433_439 * f_413_low60_20_low20_0 + v_433_439 * g_413_low60_20_low20_0 = f_413_low60_20_low20_6 * (const 64 (-(2**20))),
    r_433_439 * f_413_low60_20_low20_0 + s_433_439 * g_413_low60_20_low20_0 = g_413_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_6 + u_433_439 * (const 64 (2**21)) + v_433_439 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_6 + r_433_439 * (const 64 (2**21)) + s_433_439 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_6,
    f_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_6,
    g_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 439)) <=s delta, delta <=s (const 64 (1 + 2*439)),
    (const 64 (-(2**20))) <=s u_433_439, u_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_439, v_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_439, r_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_439, s_433_439 <=s (const 64 ((2**20)-1)),
    u_433_439 + v_433_439 <=s (const 64 (2**20)),
    u_433_439 - v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 + v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 - v_433_439 <=s (const 64 (2**20)),
    r_433_439 + s_433_439 <=s (const 64 (2**20)),
    r_433_439 - s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 + s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 - s_433_439 <=s (const 64 (2**20)),
    u_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_433_439 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step439

// premise b
assume
g_413_low60_20_low20_6 = 1 (mod 2)
&&
g_413_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_7 f_413_low60_20_low20_6;
mov u_433_440 u_433_439;
mov v_433_440 v_433_439;

add g_413_low60_20_low20_7 g_413_low60_20_low20_6 f_413_low60_20_low20_6;
asr g_413_low60_20_low20_7 g_413_low60_20_low20_7 1;
add r_433_440 r_433_439 u_433_439;
asr r_433_440 r_433_440 1;
add s_433_440 s_433_439 v_433_439;
asr s_433_440 s_433_440 1;
assert
    true
&&
    f_413_low60_20_low20_7 = f_413_low60_20_low20_6,
    u_433_440 = u_433_439,
    v_433_440 = v_433_439,
    g_413_low60_20_low20_7 * (const 64 2) = g_413_low60_20_low20_6 + f_413_low60_20_low20_6,
    r_433_440 * (const 64 2) = r_433_439 + u_433_439,
    s_433_440 * (const 64 2) = s_433_439 + v_433_439
;

assume
    f_413_low60_20_low20_7 = f_413_low60_20_low20_6,
    u_433_440 = u_433_439,
    v_433_440 = v_433_439,
    g_413_low60_20_low20_7 * 2 = g_413_low60_20_low20_6 + f_413_low60_20_low20_6,
    r_433_440 * 2 = r_433_439 + u_433_439,
    s_433_440 * 2 = s_433_439 + v_433_439
&&
    true
;

{
    u_433_440 * f_413_low60_20_low20_0 + v_433_440 * g_413_low60_20_low20_0 = f_413_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_440 * f_413_low60_20_low20_0 + s_433_440 * g_413_low60_20_low20_0 = g_413_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_7 + u_433_440 * (const 64 (2**21)) + v_433_440 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_7 + r_433_440 * (const 64 (2**21)) + s_433_440 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_7,
    f_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_7,
    g_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 440)) <=s delta, delta <=s (const 64 (1 + 2*440)),
    (const 64 (-(2**20))) <=s u_433_440, u_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_440, v_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_440, r_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_440, s_433_440 <=s (const 64 ((2**20)-1)),
    u_433_440 + v_433_440 <=s (const 64 (2**20)),
    u_433_440 - v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 + v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 - v_433_440 <=s (const 64 (2**20)),
    r_433_440 + s_433_440 <=s (const 64 (2**20)),
    r_433_440 - s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 + s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 - s_433_440 <=s (const 64 (2**20)),
    u_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_433_440 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_439_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_6,
sint64 g_413_low60_20_low20_6,
sint64 f_413_low60_20_low20_7,
sint64 g_413_low60_20_low20_7,
sint64 u_433_439,
sint64 v_433_439,
sint64 r_433_439,
sint64 s_433_439,
sint64 u_433_440,
sint64 v_433_440,
sint64 r_433_440,
sint64 s_433_440,
bit ne
)={
    u_433_439 * f_413_low60_20_low20_0 + v_433_439 * g_413_low60_20_low20_0 = f_413_low60_20_low20_6 * (-(2**20)),
    r_433_439 * f_413_low60_20_low20_0 + s_433_439 * g_413_low60_20_low20_0 = g_413_low60_20_low20_6 * (-(2**20))
&&
    u_433_439 * f_413_low60_20_low20_0 + v_433_439 * g_413_low60_20_low20_0 = f_413_low60_20_low20_6 * (const 64 (-(2**20))),
    r_433_439 * f_413_low60_20_low20_0 + s_433_439 * g_413_low60_20_low20_0 = g_413_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_6 + u_433_439 * (const 64 (2**21)) + v_433_439 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_6 + r_433_439 * (const 64 (2**21)) + s_433_439 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_6,
    f_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_6,
    g_413_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 439)) <=s delta, delta <=s (const 64 (1 + 2*439)),
    (const 64 (-(2**20))) <=s u_433_439, u_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_439, v_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_439, r_433_439 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_439, s_433_439 <=s (const 64 ((2**20)-1)),
    u_433_439 + v_433_439 <=s (const 64 (2**20)),
    u_433_439 - v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 + v_433_439 <=s (const 64 (2**20)),
    (const 64 0) - u_433_439 - v_433_439 <=s (const 64 (2**20)),
    r_433_439 + s_433_439 <=s (const 64 (2**20)),
    r_433_439 - s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 + s_433_439 <=s (const 64 (2**20)),
    (const 64 0) - r_433_439 - s_433_439 <=s (const 64 (2**20)),
    u_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_433_439 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_433_439 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step439

// premise c
assume
g_413_low60_20_low20_6 = 1 (mod 2)
&&
g_413_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_7 g_413_low60_20_low20_6;
mov u_433_440 r_433_439;
mov v_433_440 s_433_439;

subs dc g_413_low60_20_low20_7 g_413_low60_20_low20_6 f_413_low60_20_low20_6;
asr g_413_low60_20_low20_7 g_413_low60_20_low20_7 1;
subs dc r_433_440 r_433_439 u_433_439;
asr r_433_440 r_433_440 1;
subs dc s_433_440 s_433_439 v_433_439;
asr s_433_440 s_433_440 1;
assert
    true
&&
    f_413_low60_20_low20_7 = g_413_low60_20_low20_6,
    u_433_440 = r_433_439,
    v_433_440 = s_433_439,
    g_413_low60_20_low20_7 * (const 64 2) = g_413_low60_20_low20_6 - f_413_low60_20_low20_6,
    r_433_440 * (const 64 2) = r_433_439 - u_433_439,
    s_433_440 * (const 64 2) = s_433_439 - v_433_439
;

assume
    f_413_low60_20_low20_7 = g_413_low60_20_low20_6,
    u_433_440 = r_433_439,
    v_433_440 = s_433_439,
    g_413_low60_20_low20_7 * 2 = g_413_low60_20_low20_6 - f_413_low60_20_low20_6,
    r_433_440 * 2 = r_433_439 - u_433_439,
    s_433_440 * 2 = s_433_439 - v_433_439
&&
    true
;

{
    u_433_440 * f_413_low60_20_low20_0 + v_433_440 * g_413_low60_20_low20_0 = f_413_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_440 * f_413_low60_20_low20_0 + s_433_440 * g_413_low60_20_low20_0 = g_413_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_7 + u_433_440 * (const 64 (2**21)) + v_433_440 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_7 + r_433_440 * (const 64 (2**21)) + s_433_440 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_7,
    f_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_7,
    g_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 440)) <=s delta, delta <=s (const 64 (1 + 2*440)),
    (const 64 (-(2**20))) <=s u_433_440, u_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_440, v_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_440, r_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_440, s_433_440 <=s (const 64 ((2**20)-1)),
    u_433_440 + v_433_440 <=s (const 64 (2**20)),
    u_433_440 - v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 + v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 - v_433_440 <=s (const 64 (2**20)),
    r_433_440 + s_433_440 <=s (const 64 (2**20)),
    r_433_440 - s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 + s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 - s_433_440 <=s (const 64 (2**20)),
    u_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_433_440 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_440_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_7,
sint64 g_413_low60_20_low20_7,
sint64 f_413_low60_20_low20_8,
sint64 g_413_low60_20_low20_8,
sint64 u_433_440,
sint64 v_433_440,
sint64 r_433_440,
sint64 s_433_440,
sint64 u_433_441,
sint64 v_433_441,
sint64 r_433_441,
sint64 s_433_441,
bit ne
)={
    u_433_440 * f_413_low60_20_low20_0 + v_433_440 * g_413_low60_20_low20_0 = f_413_low60_20_low20_7 * (-(2**20)),
    r_433_440 * f_413_low60_20_low20_0 + s_433_440 * g_413_low60_20_low20_0 = g_413_low60_20_low20_7 * (-(2**20))
&&
    u_433_440 * f_413_low60_20_low20_0 + v_433_440 * g_413_low60_20_low20_0 = f_413_low60_20_low20_7 * (const 64 (-(2**20))),
    r_433_440 * f_413_low60_20_low20_0 + s_433_440 * g_413_low60_20_low20_0 = g_413_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_7 + u_433_440 * (const 64 (2**21)) + v_433_440 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_7 + r_433_440 * (const 64 (2**21)) + s_433_440 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_7,
    f_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_7,
    g_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 440)) <=s delta, delta <=s (const 64 (1 + 2*440)),
    (const 64 (-(2**20))) <=s u_433_440, u_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_440, v_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_440, r_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_440, s_433_440 <=s (const 64 ((2**20)-1)),
    u_433_440 + v_433_440 <=s (const 64 (2**20)),
    u_433_440 - v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 + v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 - v_433_440 <=s (const 64 (2**20)),
    r_433_440 + s_433_440 <=s (const 64 (2**20)),
    r_433_440 - s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 + s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 - s_433_440 <=s (const 64 (2**20)),
    u_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_433_440 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step440

// premise a
assume
g_413_low60_20_low20_7 = 0 (mod 2)
&&
g_413_low60_20_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_8 f_413_low60_20_low20_7;
mov u_433_441 u_433_440;
mov v_433_441 v_433_440;

asr g_413_low60_20_low20_8 g_413_low60_20_low20_7 1;
asr r_433_441 r_433_440 1;
asr s_433_441 s_433_440 1;
assert
    true
&&
    f_413_low60_20_low20_8 = f_413_low60_20_low20_7,
    u_433_441 = u_433_440,
    v_433_441 = v_433_440,
    g_413_low60_20_low20_8 * (const 64 2) = g_413_low60_20_low20_7,
    r_433_441 * (const 64 2) = r_433_440,
    s_433_441 * (const 64 2) = s_433_440
;

assume
    f_413_low60_20_low20_8 = f_413_low60_20_low20_7,
    u_433_441 = u_433_440,
    v_433_441 = v_433_440,
    g_413_low60_20_low20_8 * 2 = g_413_low60_20_low20_7,
    r_433_441 * 2 = r_433_440,
    s_433_441 * 2 = s_433_440
&&
    true
;

{
    u_433_441 * f_413_low60_20_low20_0 + v_433_441 * g_413_low60_20_low20_0 = f_413_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_441 * f_413_low60_20_low20_0 + s_433_441 * g_413_low60_20_low20_0 = g_413_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_8 + u_433_441 * (const 64 (2**21)) + v_433_441 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_8 + r_433_441 * (const 64 (2**21)) + s_433_441 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_8,
    f_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_8,
    g_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 441)) <=s delta, delta <=s (const 64 (1 + 2*441)),
    (const 64 (-(2**20))) <=s u_433_441, u_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_441, v_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_441, r_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_441, s_433_441 <=s (const 64 ((2**20)-1)),
    u_433_441 + v_433_441 <=s (const 64 (2**20)),
    u_433_441 - v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 + v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 - v_433_441 <=s (const 64 (2**20)),
    r_433_441 + s_433_441 <=s (const 64 (2**20)),
    r_433_441 - s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 + s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 - s_433_441 <=s (const 64 (2**20)),
    u_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_433_441 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_440_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_7,
sint64 g_413_low60_20_low20_7,
sint64 f_413_low60_20_low20_8,
sint64 g_413_low60_20_low20_8,
sint64 u_433_440,
sint64 v_433_440,
sint64 r_433_440,
sint64 s_433_440,
sint64 u_433_441,
sint64 v_433_441,
sint64 r_433_441,
sint64 s_433_441,
bit ne
)={
    u_433_440 * f_413_low60_20_low20_0 + v_433_440 * g_413_low60_20_low20_0 = f_413_low60_20_low20_7 * (-(2**20)),
    r_433_440 * f_413_low60_20_low20_0 + s_433_440 * g_413_low60_20_low20_0 = g_413_low60_20_low20_7 * (-(2**20))
&&
    u_433_440 * f_413_low60_20_low20_0 + v_433_440 * g_413_low60_20_low20_0 = f_413_low60_20_low20_7 * (const 64 (-(2**20))),
    r_433_440 * f_413_low60_20_low20_0 + s_433_440 * g_413_low60_20_low20_0 = g_413_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_7 + u_433_440 * (const 64 (2**21)) + v_433_440 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_7 + r_433_440 * (const 64 (2**21)) + s_433_440 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_7,
    f_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_7,
    g_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 440)) <=s delta, delta <=s (const 64 (1 + 2*440)),
    (const 64 (-(2**20))) <=s u_433_440, u_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_440, v_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_440, r_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_440, s_433_440 <=s (const 64 ((2**20)-1)),
    u_433_440 + v_433_440 <=s (const 64 (2**20)),
    u_433_440 - v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 + v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 - v_433_440 <=s (const 64 (2**20)),
    r_433_440 + s_433_440 <=s (const 64 (2**20)),
    r_433_440 - s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 + s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 - s_433_440 <=s (const 64 (2**20)),
    u_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_433_440 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step440

// premise b
assume
g_413_low60_20_low20_7 = 1 (mod 2)
&&
g_413_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_8 f_413_low60_20_low20_7;
mov u_433_441 u_433_440;
mov v_433_441 v_433_440;

add g_413_low60_20_low20_8 g_413_low60_20_low20_7 f_413_low60_20_low20_7;
asr g_413_low60_20_low20_8 g_413_low60_20_low20_8 1;
add r_433_441 r_433_440 u_433_440;
asr r_433_441 r_433_441 1;
add s_433_441 s_433_440 v_433_440;
asr s_433_441 s_433_441 1;
assert
    true
&&
    f_413_low60_20_low20_8 = f_413_low60_20_low20_7,
    u_433_441 = u_433_440,
    v_433_441 = v_433_440,
    g_413_low60_20_low20_8 * (const 64 2) = g_413_low60_20_low20_7 + f_413_low60_20_low20_7,
    r_433_441 * (const 64 2) = r_433_440 + u_433_440,
    s_433_441 * (const 64 2) = s_433_440 + v_433_440
;

assume
    f_413_low60_20_low20_8 = f_413_low60_20_low20_7,
    u_433_441 = u_433_440,
    v_433_441 = v_433_440,
    g_413_low60_20_low20_8 * 2 = g_413_low60_20_low20_7 + f_413_low60_20_low20_7,
    r_433_441 * 2 = r_433_440 + u_433_440,
    s_433_441 * 2 = s_433_440 + v_433_440
&&
    true
;

{
    u_433_441 * f_413_low60_20_low20_0 + v_433_441 * g_413_low60_20_low20_0 = f_413_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_441 * f_413_low60_20_low20_0 + s_433_441 * g_413_low60_20_low20_0 = g_413_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_8 + u_433_441 * (const 64 (2**21)) + v_433_441 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_8 + r_433_441 * (const 64 (2**21)) + s_433_441 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_8,
    f_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_8,
    g_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 441)) <=s delta, delta <=s (const 64 (1 + 2*441)),
    (const 64 (-(2**20))) <=s u_433_441, u_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_441, v_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_441, r_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_441, s_433_441 <=s (const 64 ((2**20)-1)),
    u_433_441 + v_433_441 <=s (const 64 (2**20)),
    u_433_441 - v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 + v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 - v_433_441 <=s (const 64 (2**20)),
    r_433_441 + s_433_441 <=s (const 64 (2**20)),
    r_433_441 - s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 + s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 - s_433_441 <=s (const 64 (2**20)),
    u_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_433_441 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_440_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_7,
sint64 g_413_low60_20_low20_7,
sint64 f_413_low60_20_low20_8,
sint64 g_413_low60_20_low20_8,
sint64 u_433_440,
sint64 v_433_440,
sint64 r_433_440,
sint64 s_433_440,
sint64 u_433_441,
sint64 v_433_441,
sint64 r_433_441,
sint64 s_433_441,
bit ne
)={
    u_433_440 * f_413_low60_20_low20_0 + v_433_440 * g_413_low60_20_low20_0 = f_413_low60_20_low20_7 * (-(2**20)),
    r_433_440 * f_413_low60_20_low20_0 + s_433_440 * g_413_low60_20_low20_0 = g_413_low60_20_low20_7 * (-(2**20))
&&
    u_433_440 * f_413_low60_20_low20_0 + v_433_440 * g_413_low60_20_low20_0 = f_413_low60_20_low20_7 * (const 64 (-(2**20))),
    r_433_440 * f_413_low60_20_low20_0 + s_433_440 * g_413_low60_20_low20_0 = g_413_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_7 + u_433_440 * (const 64 (2**21)) + v_433_440 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_7 + r_433_440 * (const 64 (2**21)) + s_433_440 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_7,
    f_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_7,
    g_413_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 440)) <=s delta, delta <=s (const 64 (1 + 2*440)),
    (const 64 (-(2**20))) <=s u_433_440, u_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_440, v_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_440, r_433_440 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_440, s_433_440 <=s (const 64 ((2**20)-1)),
    u_433_440 + v_433_440 <=s (const 64 (2**20)),
    u_433_440 - v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 + v_433_440 <=s (const 64 (2**20)),
    (const 64 0) - u_433_440 - v_433_440 <=s (const 64 (2**20)),
    r_433_440 + s_433_440 <=s (const 64 (2**20)),
    r_433_440 - s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 + s_433_440 <=s (const 64 (2**20)),
    (const 64 0) - r_433_440 - s_433_440 <=s (const 64 (2**20)),
    u_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_433_440 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_433_440 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step440

// premise c
assume
g_413_low60_20_low20_7 = 1 (mod 2)
&&
g_413_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_8 g_413_low60_20_low20_7;
mov u_433_441 r_433_440;
mov v_433_441 s_433_440;

subs dc g_413_low60_20_low20_8 g_413_low60_20_low20_7 f_413_low60_20_low20_7;
asr g_413_low60_20_low20_8 g_413_low60_20_low20_8 1;
subs dc r_433_441 r_433_440 u_433_440;
asr r_433_441 r_433_441 1;
subs dc s_433_441 s_433_440 v_433_440;
asr s_433_441 s_433_441 1;
assert
    true
&&
    f_413_low60_20_low20_8 = g_413_low60_20_low20_7,
    u_433_441 = r_433_440,
    v_433_441 = s_433_440,
    g_413_low60_20_low20_8 * (const 64 2) = g_413_low60_20_low20_7 - f_413_low60_20_low20_7,
    r_433_441 * (const 64 2) = r_433_440 - u_433_440,
    s_433_441 * (const 64 2) = s_433_440 - v_433_440
;

assume
    f_413_low60_20_low20_8 = g_413_low60_20_low20_7,
    u_433_441 = r_433_440,
    v_433_441 = s_433_440,
    g_413_low60_20_low20_8 * 2 = g_413_low60_20_low20_7 - f_413_low60_20_low20_7,
    r_433_441 * 2 = r_433_440 - u_433_440,
    s_433_441 * 2 = s_433_440 - v_433_440
&&
    true
;

{
    u_433_441 * f_413_low60_20_low20_0 + v_433_441 * g_413_low60_20_low20_0 = f_413_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_441 * f_413_low60_20_low20_0 + s_433_441 * g_413_low60_20_low20_0 = g_413_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_8 + u_433_441 * (const 64 (2**21)) + v_433_441 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_8 + r_433_441 * (const 64 (2**21)) + s_433_441 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_8,
    f_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_8,
    g_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 441)) <=s delta, delta <=s (const 64 (1 + 2*441)),
    (const 64 (-(2**20))) <=s u_433_441, u_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_441, v_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_441, r_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_441, s_433_441 <=s (const 64 ((2**20)-1)),
    u_433_441 + v_433_441 <=s (const 64 (2**20)),
    u_433_441 - v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 + v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 - v_433_441 <=s (const 64 (2**20)),
    r_433_441 + s_433_441 <=s (const 64 (2**20)),
    r_433_441 - s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 + s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 - s_433_441 <=s (const 64 (2**20)),
    u_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_433_441 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_441_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_8,
sint64 g_413_low60_20_low20_8,
sint64 f_413_low60_20_low20_9,
sint64 g_413_low60_20_low20_9,
sint64 u_433_441,
sint64 v_433_441,
sint64 r_433_441,
sint64 s_433_441,
sint64 u_433_442,
sint64 v_433_442,
sint64 r_433_442,
sint64 s_433_442,
bit ne
)={
    u_433_441 * f_413_low60_20_low20_0 + v_433_441 * g_413_low60_20_low20_0 = f_413_low60_20_low20_8 * (-(2**20)),
    r_433_441 * f_413_low60_20_low20_0 + s_433_441 * g_413_low60_20_low20_0 = g_413_low60_20_low20_8 * (-(2**20))
&&
    u_433_441 * f_413_low60_20_low20_0 + v_433_441 * g_413_low60_20_low20_0 = f_413_low60_20_low20_8 * (const 64 (-(2**20))),
    r_433_441 * f_413_low60_20_low20_0 + s_433_441 * g_413_low60_20_low20_0 = g_413_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_8 + u_433_441 * (const 64 (2**21)) + v_433_441 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_8 + r_433_441 * (const 64 (2**21)) + s_433_441 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_8,
    f_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_8,
    g_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 441)) <=s delta, delta <=s (const 64 (1 + 2*441)),
    (const 64 (-(2**20))) <=s u_433_441, u_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_441, v_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_441, r_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_441, s_433_441 <=s (const 64 ((2**20)-1)),
    u_433_441 + v_433_441 <=s (const 64 (2**20)),
    u_433_441 - v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 + v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 - v_433_441 <=s (const 64 (2**20)),
    r_433_441 + s_433_441 <=s (const 64 (2**20)),
    r_433_441 - s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 + s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 - s_433_441 <=s (const 64 (2**20)),
    u_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_433_441 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step441

// premise a
assume
g_413_low60_20_low20_8 = 0 (mod 2)
&&
g_413_low60_20_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_9 f_413_low60_20_low20_8;
mov u_433_442 u_433_441;
mov v_433_442 v_433_441;

asr g_413_low60_20_low20_9 g_413_low60_20_low20_8 1;
asr r_433_442 r_433_441 1;
asr s_433_442 s_433_441 1;
assert
    true
&&
    f_413_low60_20_low20_9 = f_413_low60_20_low20_8,
    u_433_442 = u_433_441,
    v_433_442 = v_433_441,
    g_413_low60_20_low20_9 * (const 64 2) = g_413_low60_20_low20_8,
    r_433_442 * (const 64 2) = r_433_441,
    s_433_442 * (const 64 2) = s_433_441
;

assume
    f_413_low60_20_low20_9 = f_413_low60_20_low20_8,
    u_433_442 = u_433_441,
    v_433_442 = v_433_441,
    g_413_low60_20_low20_9 * 2 = g_413_low60_20_low20_8,
    r_433_442 * 2 = r_433_441,
    s_433_442 * 2 = s_433_441
&&
    true
;

{
    u_433_442 * f_413_low60_20_low20_0 + v_433_442 * g_413_low60_20_low20_0 = f_413_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_442 * f_413_low60_20_low20_0 + s_433_442 * g_413_low60_20_low20_0 = g_413_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_9 + u_433_442 * (const 64 (2**21)) + v_433_442 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_9 + r_433_442 * (const 64 (2**21)) + s_433_442 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_9,
    f_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_9,
    g_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 442)) <=s delta, delta <=s (const 64 (1 + 2*442)),
    (const 64 (-(2**20))) <=s u_433_442, u_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_442, v_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_442, r_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_442, s_433_442 <=s (const 64 ((2**20)-1)),
    u_433_442 + v_433_442 <=s (const 64 (2**20)),
    u_433_442 - v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 + v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 - v_433_442 <=s (const 64 (2**20)),
    r_433_442 + s_433_442 <=s (const 64 (2**20)),
    r_433_442 - s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 + s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 - s_433_442 <=s (const 64 (2**20)),
    u_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_433_442 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_441_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_8,
sint64 g_413_low60_20_low20_8,
sint64 f_413_low60_20_low20_9,
sint64 g_413_low60_20_low20_9,
sint64 u_433_441,
sint64 v_433_441,
sint64 r_433_441,
sint64 s_433_441,
sint64 u_433_442,
sint64 v_433_442,
sint64 r_433_442,
sint64 s_433_442,
bit ne
)={
    u_433_441 * f_413_low60_20_low20_0 + v_433_441 * g_413_low60_20_low20_0 = f_413_low60_20_low20_8 * (-(2**20)),
    r_433_441 * f_413_low60_20_low20_0 + s_433_441 * g_413_low60_20_low20_0 = g_413_low60_20_low20_8 * (-(2**20))
&&
    u_433_441 * f_413_low60_20_low20_0 + v_433_441 * g_413_low60_20_low20_0 = f_413_low60_20_low20_8 * (const 64 (-(2**20))),
    r_433_441 * f_413_low60_20_low20_0 + s_433_441 * g_413_low60_20_low20_0 = g_413_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_8 + u_433_441 * (const 64 (2**21)) + v_433_441 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_8 + r_433_441 * (const 64 (2**21)) + s_433_441 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_8,
    f_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_8,
    g_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 441)) <=s delta, delta <=s (const 64 (1 + 2*441)),
    (const 64 (-(2**20))) <=s u_433_441, u_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_441, v_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_441, r_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_441, s_433_441 <=s (const 64 ((2**20)-1)),
    u_433_441 + v_433_441 <=s (const 64 (2**20)),
    u_433_441 - v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 + v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 - v_433_441 <=s (const 64 (2**20)),
    r_433_441 + s_433_441 <=s (const 64 (2**20)),
    r_433_441 - s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 + s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 - s_433_441 <=s (const 64 (2**20)),
    u_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_433_441 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step441

// premise b
assume
g_413_low60_20_low20_8 = 1 (mod 2)
&&
g_413_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_9 f_413_low60_20_low20_8;
mov u_433_442 u_433_441;
mov v_433_442 v_433_441;

add g_413_low60_20_low20_9 g_413_low60_20_low20_8 f_413_low60_20_low20_8;
asr g_413_low60_20_low20_9 g_413_low60_20_low20_9 1;
add r_433_442 r_433_441 u_433_441;
asr r_433_442 r_433_442 1;
add s_433_442 s_433_441 v_433_441;
asr s_433_442 s_433_442 1;
assert
    true
&&
    f_413_low60_20_low20_9 = f_413_low60_20_low20_8,
    u_433_442 = u_433_441,
    v_433_442 = v_433_441,
    g_413_low60_20_low20_9 * (const 64 2) = g_413_low60_20_low20_8 + f_413_low60_20_low20_8,
    r_433_442 * (const 64 2) = r_433_441 + u_433_441,
    s_433_442 * (const 64 2) = s_433_441 + v_433_441
;

assume
    f_413_low60_20_low20_9 = f_413_low60_20_low20_8,
    u_433_442 = u_433_441,
    v_433_442 = v_433_441,
    g_413_low60_20_low20_9 * 2 = g_413_low60_20_low20_8 + f_413_low60_20_low20_8,
    r_433_442 * 2 = r_433_441 + u_433_441,
    s_433_442 * 2 = s_433_441 + v_433_441
&&
    true
;

{
    u_433_442 * f_413_low60_20_low20_0 + v_433_442 * g_413_low60_20_low20_0 = f_413_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_442 * f_413_low60_20_low20_0 + s_433_442 * g_413_low60_20_low20_0 = g_413_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_9 + u_433_442 * (const 64 (2**21)) + v_433_442 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_9 + r_433_442 * (const 64 (2**21)) + s_433_442 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_9,
    f_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_9,
    g_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 442)) <=s delta, delta <=s (const 64 (1 + 2*442)),
    (const 64 (-(2**20))) <=s u_433_442, u_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_442, v_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_442, r_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_442, s_433_442 <=s (const 64 ((2**20)-1)),
    u_433_442 + v_433_442 <=s (const 64 (2**20)),
    u_433_442 - v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 + v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 - v_433_442 <=s (const 64 (2**20)),
    r_433_442 + s_433_442 <=s (const 64 (2**20)),
    r_433_442 - s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 + s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 - s_433_442 <=s (const 64 (2**20)),
    u_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_433_442 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_441_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_8,
sint64 g_413_low60_20_low20_8,
sint64 f_413_low60_20_low20_9,
sint64 g_413_low60_20_low20_9,
sint64 u_433_441,
sint64 v_433_441,
sint64 r_433_441,
sint64 s_433_441,
sint64 u_433_442,
sint64 v_433_442,
sint64 r_433_442,
sint64 s_433_442,
bit ne
)={
    u_433_441 * f_413_low60_20_low20_0 + v_433_441 * g_413_low60_20_low20_0 = f_413_low60_20_low20_8 * (-(2**20)),
    r_433_441 * f_413_low60_20_low20_0 + s_433_441 * g_413_low60_20_low20_0 = g_413_low60_20_low20_8 * (-(2**20))
&&
    u_433_441 * f_413_low60_20_low20_0 + v_433_441 * g_413_low60_20_low20_0 = f_413_low60_20_low20_8 * (const 64 (-(2**20))),
    r_433_441 * f_413_low60_20_low20_0 + s_433_441 * g_413_low60_20_low20_0 = g_413_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_8 + u_433_441 * (const 64 (2**21)) + v_433_441 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_8 + r_433_441 * (const 64 (2**21)) + s_433_441 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_8,
    f_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_8,
    g_413_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 441)) <=s delta, delta <=s (const 64 (1 + 2*441)),
    (const 64 (-(2**20))) <=s u_433_441, u_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_441, v_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_441, r_433_441 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_441, s_433_441 <=s (const 64 ((2**20)-1)),
    u_433_441 + v_433_441 <=s (const 64 (2**20)),
    u_433_441 - v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 + v_433_441 <=s (const 64 (2**20)),
    (const 64 0) - u_433_441 - v_433_441 <=s (const 64 (2**20)),
    r_433_441 + s_433_441 <=s (const 64 (2**20)),
    r_433_441 - s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 + s_433_441 <=s (const 64 (2**20)),
    (const 64 0) - r_433_441 - s_433_441 <=s (const 64 (2**20)),
    u_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_433_441 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_433_441 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step441

// premise c
assume
g_413_low60_20_low20_8 = 1 (mod 2)
&&
g_413_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_9 g_413_low60_20_low20_8;
mov u_433_442 r_433_441;
mov v_433_442 s_433_441;

subs dc g_413_low60_20_low20_9 g_413_low60_20_low20_8 f_413_low60_20_low20_8;
asr g_413_low60_20_low20_9 g_413_low60_20_low20_9 1;
subs dc r_433_442 r_433_441 u_433_441;
asr r_433_442 r_433_442 1;
subs dc s_433_442 s_433_441 v_433_441;
asr s_433_442 s_433_442 1;
assert
    true
&&
    f_413_low60_20_low20_9 = g_413_low60_20_low20_8,
    u_433_442 = r_433_441,
    v_433_442 = s_433_441,
    g_413_low60_20_low20_9 * (const 64 2) = g_413_low60_20_low20_8 - f_413_low60_20_low20_8,
    r_433_442 * (const 64 2) = r_433_441 - u_433_441,
    s_433_442 * (const 64 2) = s_433_441 - v_433_441
;

assume
    f_413_low60_20_low20_9 = g_413_low60_20_low20_8,
    u_433_442 = r_433_441,
    v_433_442 = s_433_441,
    g_413_low60_20_low20_9 * 2 = g_413_low60_20_low20_8 - f_413_low60_20_low20_8,
    r_433_442 * 2 = r_433_441 - u_433_441,
    s_433_442 * 2 = s_433_441 - v_433_441
&&
    true
;

{
    u_433_442 * f_413_low60_20_low20_0 + v_433_442 * g_413_low60_20_low20_0 = f_413_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_442 * f_413_low60_20_low20_0 + s_433_442 * g_413_low60_20_low20_0 = g_413_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_9 + u_433_442 * (const 64 (2**21)) + v_433_442 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_9 + r_433_442 * (const 64 (2**21)) + s_433_442 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_9,
    f_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_9,
    g_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 442)) <=s delta, delta <=s (const 64 (1 + 2*442)),
    (const 64 (-(2**20))) <=s u_433_442, u_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_442, v_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_442, r_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_442, s_433_442 <=s (const 64 ((2**20)-1)),
    u_433_442 + v_433_442 <=s (const 64 (2**20)),
    u_433_442 - v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 + v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 - v_433_442 <=s (const 64 (2**20)),
    r_433_442 + s_433_442 <=s (const 64 (2**20)),
    r_433_442 - s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 + s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 - s_433_442 <=s (const 64 (2**20)),
    u_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_433_442 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_442_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_9,
sint64 g_413_low60_20_low20_9,
sint64 f_413_low60_20_low20_10,
sint64 g_413_low60_20_low20_10,
sint64 u_433_442,
sint64 v_433_442,
sint64 r_433_442,
sint64 s_433_442,
sint64 u_433_443,
sint64 v_433_443,
sint64 r_433_443,
sint64 s_433_443,
bit ne
)={
    u_433_442 * f_413_low60_20_low20_0 + v_433_442 * g_413_low60_20_low20_0 = f_413_low60_20_low20_9 * (-(2**20)),
    r_433_442 * f_413_low60_20_low20_0 + s_433_442 * g_413_low60_20_low20_0 = g_413_low60_20_low20_9 * (-(2**20))
&&
    u_433_442 * f_413_low60_20_low20_0 + v_433_442 * g_413_low60_20_low20_0 = f_413_low60_20_low20_9 * (const 64 (-(2**20))),
    r_433_442 * f_413_low60_20_low20_0 + s_433_442 * g_413_low60_20_low20_0 = g_413_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_9 + u_433_442 * (const 64 (2**21)) + v_433_442 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_9 + r_433_442 * (const 64 (2**21)) + s_433_442 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_9,
    f_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_9,
    g_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 442)) <=s delta, delta <=s (const 64 (1 + 2*442)),
    (const 64 (-(2**20))) <=s u_433_442, u_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_442, v_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_442, r_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_442, s_433_442 <=s (const 64 ((2**20)-1)),
    u_433_442 + v_433_442 <=s (const 64 (2**20)),
    u_433_442 - v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 + v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 - v_433_442 <=s (const 64 (2**20)),
    r_433_442 + s_433_442 <=s (const 64 (2**20)),
    r_433_442 - s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 + s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 - s_433_442 <=s (const 64 (2**20)),
    u_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_433_442 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step442

// premise a
assume
g_413_low60_20_low20_9 = 0 (mod 2)
&&
g_413_low60_20_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_10 f_413_low60_20_low20_9;
mov u_433_443 u_433_442;
mov v_433_443 v_433_442;

asr g_413_low60_20_low20_10 g_413_low60_20_low20_9 1;
asr r_433_443 r_433_442 1;
asr s_433_443 s_433_442 1;
assert
    true
&&
    f_413_low60_20_low20_10 = f_413_low60_20_low20_9,
    u_433_443 = u_433_442,
    v_433_443 = v_433_442,
    g_413_low60_20_low20_10 * (const 64 2) = g_413_low60_20_low20_9,
    r_433_443 * (const 64 2) = r_433_442,
    s_433_443 * (const 64 2) = s_433_442
;

assume
    f_413_low60_20_low20_10 = f_413_low60_20_low20_9,
    u_433_443 = u_433_442,
    v_433_443 = v_433_442,
    g_413_low60_20_low20_10 * 2 = g_413_low60_20_low20_9,
    r_433_443 * 2 = r_433_442,
    s_433_443 * 2 = s_433_442
&&
    true
;

{
    u_433_443 * f_413_low60_20_low20_0 + v_433_443 * g_413_low60_20_low20_0 = f_413_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_443 * f_413_low60_20_low20_0 + s_433_443 * g_413_low60_20_low20_0 = g_413_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_10 + u_433_443 * (const 64 (2**21)) + v_433_443 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_10 + r_433_443 * (const 64 (2**21)) + s_433_443 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_10,
    f_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_10,
    g_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 443)) <=s delta, delta <=s (const 64 (1 + 2*443)),
    (const 64 (-(2**20))) <=s u_433_443, u_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_443, v_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_443, r_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_443, s_433_443 <=s (const 64 ((2**20)-1)),
    u_433_443 + v_433_443 <=s (const 64 (2**20)),
    u_433_443 - v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 + v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 - v_433_443 <=s (const 64 (2**20)),
    r_433_443 + s_433_443 <=s (const 64 (2**20)),
    r_433_443 - s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 + s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 - s_433_443 <=s (const 64 (2**20)),
    u_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_433_443 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_442_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_9,
sint64 g_413_low60_20_low20_9,
sint64 f_413_low60_20_low20_10,
sint64 g_413_low60_20_low20_10,
sint64 u_433_442,
sint64 v_433_442,
sint64 r_433_442,
sint64 s_433_442,
sint64 u_433_443,
sint64 v_433_443,
sint64 r_433_443,
sint64 s_433_443,
bit ne
)={
    u_433_442 * f_413_low60_20_low20_0 + v_433_442 * g_413_low60_20_low20_0 = f_413_low60_20_low20_9 * (-(2**20)),
    r_433_442 * f_413_low60_20_low20_0 + s_433_442 * g_413_low60_20_low20_0 = g_413_low60_20_low20_9 * (-(2**20))
&&
    u_433_442 * f_413_low60_20_low20_0 + v_433_442 * g_413_low60_20_low20_0 = f_413_low60_20_low20_9 * (const 64 (-(2**20))),
    r_433_442 * f_413_low60_20_low20_0 + s_433_442 * g_413_low60_20_low20_0 = g_413_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_9 + u_433_442 * (const 64 (2**21)) + v_433_442 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_9 + r_433_442 * (const 64 (2**21)) + s_433_442 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_9,
    f_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_9,
    g_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 442)) <=s delta, delta <=s (const 64 (1 + 2*442)),
    (const 64 (-(2**20))) <=s u_433_442, u_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_442, v_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_442, r_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_442, s_433_442 <=s (const 64 ((2**20)-1)),
    u_433_442 + v_433_442 <=s (const 64 (2**20)),
    u_433_442 - v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 + v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 - v_433_442 <=s (const 64 (2**20)),
    r_433_442 + s_433_442 <=s (const 64 (2**20)),
    r_433_442 - s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 + s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 - s_433_442 <=s (const 64 (2**20)),
    u_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_433_442 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step442

// premise b
assume
g_413_low60_20_low20_9 = 1 (mod 2)
&&
g_413_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_10 f_413_low60_20_low20_9;
mov u_433_443 u_433_442;
mov v_433_443 v_433_442;

add g_413_low60_20_low20_10 g_413_low60_20_low20_9 f_413_low60_20_low20_9;
asr g_413_low60_20_low20_10 g_413_low60_20_low20_10 1;
add r_433_443 r_433_442 u_433_442;
asr r_433_443 r_433_443 1;
add s_433_443 s_433_442 v_433_442;
asr s_433_443 s_433_443 1;
assert
    true
&&
    f_413_low60_20_low20_10 = f_413_low60_20_low20_9,
    u_433_443 = u_433_442,
    v_433_443 = v_433_442,
    g_413_low60_20_low20_10 * (const 64 2) = g_413_low60_20_low20_9 + f_413_low60_20_low20_9,
    r_433_443 * (const 64 2) = r_433_442 + u_433_442,
    s_433_443 * (const 64 2) = s_433_442 + v_433_442
;

assume
    f_413_low60_20_low20_10 = f_413_low60_20_low20_9,
    u_433_443 = u_433_442,
    v_433_443 = v_433_442,
    g_413_low60_20_low20_10 * 2 = g_413_low60_20_low20_9 + f_413_low60_20_low20_9,
    r_433_443 * 2 = r_433_442 + u_433_442,
    s_433_443 * 2 = s_433_442 + v_433_442
&&
    true
;

{
    u_433_443 * f_413_low60_20_low20_0 + v_433_443 * g_413_low60_20_low20_0 = f_413_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_443 * f_413_low60_20_low20_0 + s_433_443 * g_413_low60_20_low20_0 = g_413_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_10 + u_433_443 * (const 64 (2**21)) + v_433_443 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_10 + r_433_443 * (const 64 (2**21)) + s_433_443 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_10,
    f_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_10,
    g_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 443)) <=s delta, delta <=s (const 64 (1 + 2*443)),
    (const 64 (-(2**20))) <=s u_433_443, u_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_443, v_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_443, r_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_443, s_433_443 <=s (const 64 ((2**20)-1)),
    u_433_443 + v_433_443 <=s (const 64 (2**20)),
    u_433_443 - v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 + v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 - v_433_443 <=s (const 64 (2**20)),
    r_433_443 + s_433_443 <=s (const 64 (2**20)),
    r_433_443 - s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 + s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 - s_433_443 <=s (const 64 (2**20)),
    u_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_433_443 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_442_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_9,
sint64 g_413_low60_20_low20_9,
sint64 f_413_low60_20_low20_10,
sint64 g_413_low60_20_low20_10,
sint64 u_433_442,
sint64 v_433_442,
sint64 r_433_442,
sint64 s_433_442,
sint64 u_433_443,
sint64 v_433_443,
sint64 r_433_443,
sint64 s_433_443,
bit ne
)={
    u_433_442 * f_413_low60_20_low20_0 + v_433_442 * g_413_low60_20_low20_0 = f_413_low60_20_low20_9 * (-(2**20)),
    r_433_442 * f_413_low60_20_low20_0 + s_433_442 * g_413_low60_20_low20_0 = g_413_low60_20_low20_9 * (-(2**20))
&&
    u_433_442 * f_413_low60_20_low20_0 + v_433_442 * g_413_low60_20_low20_0 = f_413_low60_20_low20_9 * (const 64 (-(2**20))),
    r_433_442 * f_413_low60_20_low20_0 + s_433_442 * g_413_low60_20_low20_0 = g_413_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_9 + u_433_442 * (const 64 (2**21)) + v_433_442 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_9 + r_433_442 * (const 64 (2**21)) + s_433_442 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_9,
    f_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_9,
    g_413_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 442)) <=s delta, delta <=s (const 64 (1 + 2*442)),
    (const 64 (-(2**20))) <=s u_433_442, u_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_442, v_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_442, r_433_442 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_442, s_433_442 <=s (const 64 ((2**20)-1)),
    u_433_442 + v_433_442 <=s (const 64 (2**20)),
    u_433_442 - v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 + v_433_442 <=s (const 64 (2**20)),
    (const 64 0) - u_433_442 - v_433_442 <=s (const 64 (2**20)),
    r_433_442 + s_433_442 <=s (const 64 (2**20)),
    r_433_442 - s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 + s_433_442 <=s (const 64 (2**20)),
    (const 64 0) - r_433_442 - s_433_442 <=s (const 64 (2**20)),
    u_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_433_442 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_433_442 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step442

// premise c
assume
g_413_low60_20_low20_9 = 1 (mod 2)
&&
g_413_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_10 g_413_low60_20_low20_9;
mov u_433_443 r_433_442;
mov v_433_443 s_433_442;

subs dc g_413_low60_20_low20_10 g_413_low60_20_low20_9 f_413_low60_20_low20_9;
asr g_413_low60_20_low20_10 g_413_low60_20_low20_10 1;
subs dc r_433_443 r_433_442 u_433_442;
asr r_433_443 r_433_443 1;
subs dc s_433_443 s_433_442 v_433_442;
asr s_433_443 s_433_443 1;
assert
    true
&&
    f_413_low60_20_low20_10 = g_413_low60_20_low20_9,
    u_433_443 = r_433_442,
    v_433_443 = s_433_442,
    g_413_low60_20_low20_10 * (const 64 2) = g_413_low60_20_low20_9 - f_413_low60_20_low20_9,
    r_433_443 * (const 64 2) = r_433_442 - u_433_442,
    s_433_443 * (const 64 2) = s_433_442 - v_433_442
;

assume
    f_413_low60_20_low20_10 = g_413_low60_20_low20_9,
    u_433_443 = r_433_442,
    v_433_443 = s_433_442,
    g_413_low60_20_low20_10 * 2 = g_413_low60_20_low20_9 - f_413_low60_20_low20_9,
    r_433_443 * 2 = r_433_442 - u_433_442,
    s_433_443 * 2 = s_433_442 - v_433_442
&&
    true
;

{
    u_433_443 * f_413_low60_20_low20_0 + v_433_443 * g_413_low60_20_low20_0 = f_413_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_443 * f_413_low60_20_low20_0 + s_433_443 * g_413_low60_20_low20_0 = g_413_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_10 + u_433_443 * (const 64 (2**21)) + v_433_443 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_10 + r_433_443 * (const 64 (2**21)) + s_433_443 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_10,
    f_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_10,
    g_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 443)) <=s delta, delta <=s (const 64 (1 + 2*443)),
    (const 64 (-(2**20))) <=s u_433_443, u_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_443, v_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_443, r_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_443, s_433_443 <=s (const 64 ((2**20)-1)),
    u_433_443 + v_433_443 <=s (const 64 (2**20)),
    u_433_443 - v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 + v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 - v_433_443 <=s (const 64 (2**20)),
    r_433_443 + s_433_443 <=s (const 64 (2**20)),
    r_433_443 - s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 + s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 - s_433_443 <=s (const 64 (2**20)),
    u_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_433_443 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_443_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_10,
sint64 g_413_low60_20_low20_10,
sint64 f_413_low60_20_low20_11,
sint64 g_413_low60_20_low20_11,
sint64 u_433_443,
sint64 v_433_443,
sint64 r_433_443,
sint64 s_433_443,
sint64 u_433_444,
sint64 v_433_444,
sint64 r_433_444,
sint64 s_433_444,
bit ne
)={
    u_433_443 * f_413_low60_20_low20_0 + v_433_443 * g_413_low60_20_low20_0 = f_413_low60_20_low20_10 * (-(2**20)),
    r_433_443 * f_413_low60_20_low20_0 + s_433_443 * g_413_low60_20_low20_0 = g_413_low60_20_low20_10 * (-(2**20))
&&
    u_433_443 * f_413_low60_20_low20_0 + v_433_443 * g_413_low60_20_low20_0 = f_413_low60_20_low20_10 * (const 64 (-(2**20))),
    r_433_443 * f_413_low60_20_low20_0 + s_433_443 * g_413_low60_20_low20_0 = g_413_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_10 + u_433_443 * (const 64 (2**21)) + v_433_443 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_10 + r_433_443 * (const 64 (2**21)) + s_433_443 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_10,
    f_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_10,
    g_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 443)) <=s delta, delta <=s (const 64 (1 + 2*443)),
    (const 64 (-(2**20))) <=s u_433_443, u_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_443, v_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_443, r_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_443, s_433_443 <=s (const 64 ((2**20)-1)),
    u_433_443 + v_433_443 <=s (const 64 (2**20)),
    u_433_443 - v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 + v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 - v_433_443 <=s (const 64 (2**20)),
    r_433_443 + s_433_443 <=s (const 64 (2**20)),
    r_433_443 - s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 + s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 - s_433_443 <=s (const 64 (2**20)),
    u_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_433_443 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step443

// premise a
assume
g_413_low60_20_low20_10 = 0 (mod 2)
&&
g_413_low60_20_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_11 f_413_low60_20_low20_10;
mov u_433_444 u_433_443;
mov v_433_444 v_433_443;

asr g_413_low60_20_low20_11 g_413_low60_20_low20_10 1;
asr r_433_444 r_433_443 1;
asr s_433_444 s_433_443 1;
assert
    true
&&
    f_413_low60_20_low20_11 = f_413_low60_20_low20_10,
    u_433_444 = u_433_443,
    v_433_444 = v_433_443,
    g_413_low60_20_low20_11 * (const 64 2) = g_413_low60_20_low20_10,
    r_433_444 * (const 64 2) = r_433_443,
    s_433_444 * (const 64 2) = s_433_443
;

assume
    f_413_low60_20_low20_11 = f_413_low60_20_low20_10,
    u_433_444 = u_433_443,
    v_433_444 = v_433_443,
    g_413_low60_20_low20_11 * 2 = g_413_low60_20_low20_10,
    r_433_444 * 2 = r_433_443,
    s_433_444 * 2 = s_433_443
&&
    true
;

{
    u_433_444 * f_413_low60_20_low20_0 + v_433_444 * g_413_low60_20_low20_0 = f_413_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_444 * f_413_low60_20_low20_0 + s_433_444 * g_413_low60_20_low20_0 = g_413_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_11 + u_433_444 * (const 64 (2**21)) + v_433_444 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_11 + r_433_444 * (const 64 (2**21)) + s_433_444 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_11,
    f_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_11,
    g_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 444)) <=s delta, delta <=s (const 64 (1 + 2*444)),
    (const 64 (-(2**20))) <=s u_433_444, u_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_444, v_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_444, r_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_444, s_433_444 <=s (const 64 ((2**20)-1)),
    u_433_444 + v_433_444 <=s (const 64 (2**20)),
    u_433_444 - v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 + v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 - v_433_444 <=s (const 64 (2**20)),
    r_433_444 + s_433_444 <=s (const 64 (2**20)),
    r_433_444 - s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 + s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 - s_433_444 <=s (const 64 (2**20)),
    u_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_433_444 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_443_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_10,
sint64 g_413_low60_20_low20_10,
sint64 f_413_low60_20_low20_11,
sint64 g_413_low60_20_low20_11,
sint64 u_433_443,
sint64 v_433_443,
sint64 r_433_443,
sint64 s_433_443,
sint64 u_433_444,
sint64 v_433_444,
sint64 r_433_444,
sint64 s_433_444,
bit ne
)={
    u_433_443 * f_413_low60_20_low20_0 + v_433_443 * g_413_low60_20_low20_0 = f_413_low60_20_low20_10 * (-(2**20)),
    r_433_443 * f_413_low60_20_low20_0 + s_433_443 * g_413_low60_20_low20_0 = g_413_low60_20_low20_10 * (-(2**20))
&&
    u_433_443 * f_413_low60_20_low20_0 + v_433_443 * g_413_low60_20_low20_0 = f_413_low60_20_low20_10 * (const 64 (-(2**20))),
    r_433_443 * f_413_low60_20_low20_0 + s_433_443 * g_413_low60_20_low20_0 = g_413_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_10 + u_433_443 * (const 64 (2**21)) + v_433_443 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_10 + r_433_443 * (const 64 (2**21)) + s_433_443 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_10,
    f_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_10,
    g_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 443)) <=s delta, delta <=s (const 64 (1 + 2*443)),
    (const 64 (-(2**20))) <=s u_433_443, u_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_443, v_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_443, r_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_443, s_433_443 <=s (const 64 ((2**20)-1)),
    u_433_443 + v_433_443 <=s (const 64 (2**20)),
    u_433_443 - v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 + v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 - v_433_443 <=s (const 64 (2**20)),
    r_433_443 + s_433_443 <=s (const 64 (2**20)),
    r_433_443 - s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 + s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 - s_433_443 <=s (const 64 (2**20)),
    u_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_433_443 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step443

// premise b
assume
g_413_low60_20_low20_10 = 1 (mod 2)
&&
g_413_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_11 f_413_low60_20_low20_10;
mov u_433_444 u_433_443;
mov v_433_444 v_433_443;

add g_413_low60_20_low20_11 g_413_low60_20_low20_10 f_413_low60_20_low20_10;
asr g_413_low60_20_low20_11 g_413_low60_20_low20_11 1;
add r_433_444 r_433_443 u_433_443;
asr r_433_444 r_433_444 1;
add s_433_444 s_433_443 v_433_443;
asr s_433_444 s_433_444 1;
assert
    true
&&
    f_413_low60_20_low20_11 = f_413_low60_20_low20_10,
    u_433_444 = u_433_443,
    v_433_444 = v_433_443,
    g_413_low60_20_low20_11 * (const 64 2) = g_413_low60_20_low20_10 + f_413_low60_20_low20_10,
    r_433_444 * (const 64 2) = r_433_443 + u_433_443,
    s_433_444 * (const 64 2) = s_433_443 + v_433_443
;

assume
    f_413_low60_20_low20_11 = f_413_low60_20_low20_10,
    u_433_444 = u_433_443,
    v_433_444 = v_433_443,
    g_413_low60_20_low20_11 * 2 = g_413_low60_20_low20_10 + f_413_low60_20_low20_10,
    r_433_444 * 2 = r_433_443 + u_433_443,
    s_433_444 * 2 = s_433_443 + v_433_443
&&
    true
;

{
    u_433_444 * f_413_low60_20_low20_0 + v_433_444 * g_413_low60_20_low20_0 = f_413_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_444 * f_413_low60_20_low20_0 + s_433_444 * g_413_low60_20_low20_0 = g_413_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_11 + u_433_444 * (const 64 (2**21)) + v_433_444 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_11 + r_433_444 * (const 64 (2**21)) + s_433_444 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_11,
    f_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_11,
    g_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 444)) <=s delta, delta <=s (const 64 (1 + 2*444)),
    (const 64 (-(2**20))) <=s u_433_444, u_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_444, v_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_444, r_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_444, s_433_444 <=s (const 64 ((2**20)-1)),
    u_433_444 + v_433_444 <=s (const 64 (2**20)),
    u_433_444 - v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 + v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 - v_433_444 <=s (const 64 (2**20)),
    r_433_444 + s_433_444 <=s (const 64 (2**20)),
    r_433_444 - s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 + s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 - s_433_444 <=s (const 64 (2**20)),
    u_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_433_444 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_443_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_10,
sint64 g_413_low60_20_low20_10,
sint64 f_413_low60_20_low20_11,
sint64 g_413_low60_20_low20_11,
sint64 u_433_443,
sint64 v_433_443,
sint64 r_433_443,
sint64 s_433_443,
sint64 u_433_444,
sint64 v_433_444,
sint64 r_433_444,
sint64 s_433_444,
bit ne
)={
    u_433_443 * f_413_low60_20_low20_0 + v_433_443 * g_413_low60_20_low20_0 = f_413_low60_20_low20_10 * (-(2**20)),
    r_433_443 * f_413_low60_20_low20_0 + s_433_443 * g_413_low60_20_low20_0 = g_413_low60_20_low20_10 * (-(2**20))
&&
    u_433_443 * f_413_low60_20_low20_0 + v_433_443 * g_413_low60_20_low20_0 = f_413_low60_20_low20_10 * (const 64 (-(2**20))),
    r_433_443 * f_413_low60_20_low20_0 + s_433_443 * g_413_low60_20_low20_0 = g_413_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_10 + u_433_443 * (const 64 (2**21)) + v_433_443 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_10 + r_433_443 * (const 64 (2**21)) + s_433_443 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_10,
    f_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_10,
    g_413_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 443)) <=s delta, delta <=s (const 64 (1 + 2*443)),
    (const 64 (-(2**20))) <=s u_433_443, u_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_443, v_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_443, r_433_443 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_443, s_433_443 <=s (const 64 ((2**20)-1)),
    u_433_443 + v_433_443 <=s (const 64 (2**20)),
    u_433_443 - v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 + v_433_443 <=s (const 64 (2**20)),
    (const 64 0) - u_433_443 - v_433_443 <=s (const 64 (2**20)),
    r_433_443 + s_433_443 <=s (const 64 (2**20)),
    r_433_443 - s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 + s_433_443 <=s (const 64 (2**20)),
    (const 64 0) - r_433_443 - s_433_443 <=s (const 64 (2**20)),
    u_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_433_443 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_433_443 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step443

// premise c
assume
g_413_low60_20_low20_10 = 1 (mod 2)
&&
g_413_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_11 g_413_low60_20_low20_10;
mov u_433_444 r_433_443;
mov v_433_444 s_433_443;

subs dc g_413_low60_20_low20_11 g_413_low60_20_low20_10 f_413_low60_20_low20_10;
asr g_413_low60_20_low20_11 g_413_low60_20_low20_11 1;
subs dc r_433_444 r_433_443 u_433_443;
asr r_433_444 r_433_444 1;
subs dc s_433_444 s_433_443 v_433_443;
asr s_433_444 s_433_444 1;
assert
    true
&&
    f_413_low60_20_low20_11 = g_413_low60_20_low20_10,
    u_433_444 = r_433_443,
    v_433_444 = s_433_443,
    g_413_low60_20_low20_11 * (const 64 2) = g_413_low60_20_low20_10 - f_413_low60_20_low20_10,
    r_433_444 * (const 64 2) = r_433_443 - u_433_443,
    s_433_444 * (const 64 2) = s_433_443 - v_433_443
;

assume
    f_413_low60_20_low20_11 = g_413_low60_20_low20_10,
    u_433_444 = r_433_443,
    v_433_444 = s_433_443,
    g_413_low60_20_low20_11 * 2 = g_413_low60_20_low20_10 - f_413_low60_20_low20_10,
    r_433_444 * 2 = r_433_443 - u_433_443,
    s_433_444 * 2 = s_433_443 - v_433_443
&&
    true
;

{
    u_433_444 * f_413_low60_20_low20_0 + v_433_444 * g_413_low60_20_low20_0 = f_413_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_444 * f_413_low60_20_low20_0 + s_433_444 * g_413_low60_20_low20_0 = g_413_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_11 + u_433_444 * (const 64 (2**21)) + v_433_444 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_11 + r_433_444 * (const 64 (2**21)) + s_433_444 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_11,
    f_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_11,
    g_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 444)) <=s delta, delta <=s (const 64 (1 + 2*444)),
    (const 64 (-(2**20))) <=s u_433_444, u_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_444, v_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_444, r_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_444, s_433_444 <=s (const 64 ((2**20)-1)),
    u_433_444 + v_433_444 <=s (const 64 (2**20)),
    u_433_444 - v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 + v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 - v_433_444 <=s (const 64 (2**20)),
    r_433_444 + s_433_444 <=s (const 64 (2**20)),
    r_433_444 - s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 + s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 - s_433_444 <=s (const 64 (2**20)),
    u_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_433_444 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_444_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_11,
sint64 g_413_low60_20_low20_11,
sint64 f_413_low60_20_low20_12,
sint64 g_413_low60_20_low20_12,
sint64 u_433_444,
sint64 v_433_444,
sint64 r_433_444,
sint64 s_433_444,
sint64 u_433_445,
sint64 v_433_445,
sint64 r_433_445,
sint64 s_433_445,
bit ne
)={
    u_433_444 * f_413_low60_20_low20_0 + v_433_444 * g_413_low60_20_low20_0 = f_413_low60_20_low20_11 * (-(2**20)),
    r_433_444 * f_413_low60_20_low20_0 + s_433_444 * g_413_low60_20_low20_0 = g_413_low60_20_low20_11 * (-(2**20))
&&
    u_433_444 * f_413_low60_20_low20_0 + v_433_444 * g_413_low60_20_low20_0 = f_413_low60_20_low20_11 * (const 64 (-(2**20))),
    r_433_444 * f_413_low60_20_low20_0 + s_433_444 * g_413_low60_20_low20_0 = g_413_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_11 + u_433_444 * (const 64 (2**21)) + v_433_444 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_11 + r_433_444 * (const 64 (2**21)) + s_433_444 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_11,
    f_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_11,
    g_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 444)) <=s delta, delta <=s (const 64 (1 + 2*444)),
    (const 64 (-(2**20))) <=s u_433_444, u_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_444, v_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_444, r_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_444, s_433_444 <=s (const 64 ((2**20)-1)),
    u_433_444 + v_433_444 <=s (const 64 (2**20)),
    u_433_444 - v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 + v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 - v_433_444 <=s (const 64 (2**20)),
    r_433_444 + s_433_444 <=s (const 64 (2**20)),
    r_433_444 - s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 + s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 - s_433_444 <=s (const 64 (2**20)),
    u_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_433_444 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step444

// premise a
assume
g_413_low60_20_low20_11 = 0 (mod 2)
&&
g_413_low60_20_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_12 f_413_low60_20_low20_11;
mov u_433_445 u_433_444;
mov v_433_445 v_433_444;

asr g_413_low60_20_low20_12 g_413_low60_20_low20_11 1;
asr r_433_445 r_433_444 1;
asr s_433_445 s_433_444 1;
assert
    true
&&
    f_413_low60_20_low20_12 = f_413_low60_20_low20_11,
    u_433_445 = u_433_444,
    v_433_445 = v_433_444,
    g_413_low60_20_low20_12 * (const 64 2) = g_413_low60_20_low20_11,
    r_433_445 * (const 64 2) = r_433_444,
    s_433_445 * (const 64 2) = s_433_444
;

assume
    f_413_low60_20_low20_12 = f_413_low60_20_low20_11,
    u_433_445 = u_433_444,
    v_433_445 = v_433_444,
    g_413_low60_20_low20_12 * 2 = g_413_low60_20_low20_11,
    r_433_445 * 2 = r_433_444,
    s_433_445 * 2 = s_433_444
&&
    true
;

{
    u_433_445 * f_413_low60_20_low20_0 + v_433_445 * g_413_low60_20_low20_0 = f_413_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_445 * f_413_low60_20_low20_0 + s_433_445 * g_413_low60_20_low20_0 = g_413_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_12 + u_433_445 * (const 64 (2**21)) + v_433_445 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_12 + r_433_445 * (const 64 (2**21)) + s_433_445 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_12,
    f_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_12,
    g_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 445)) <=s delta, delta <=s (const 64 (1 + 2*445)),
    (const 64 (-(2**20))) <=s u_433_445, u_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_445, v_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_445, r_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_445, s_433_445 <=s (const 64 ((2**20)-1)),
    u_433_445 + v_433_445 <=s (const 64 (2**20)),
    u_433_445 - v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 + v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 - v_433_445 <=s (const 64 (2**20)),
    r_433_445 + s_433_445 <=s (const 64 (2**20)),
    r_433_445 - s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 + s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 - s_433_445 <=s (const 64 (2**20)),
    u_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_433_445 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_444_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_11,
sint64 g_413_low60_20_low20_11,
sint64 f_413_low60_20_low20_12,
sint64 g_413_low60_20_low20_12,
sint64 u_433_444,
sint64 v_433_444,
sint64 r_433_444,
sint64 s_433_444,
sint64 u_433_445,
sint64 v_433_445,
sint64 r_433_445,
sint64 s_433_445,
bit ne
)={
    u_433_444 * f_413_low60_20_low20_0 + v_433_444 * g_413_low60_20_low20_0 = f_413_low60_20_low20_11 * (-(2**20)),
    r_433_444 * f_413_low60_20_low20_0 + s_433_444 * g_413_low60_20_low20_0 = g_413_low60_20_low20_11 * (-(2**20))
&&
    u_433_444 * f_413_low60_20_low20_0 + v_433_444 * g_413_low60_20_low20_0 = f_413_low60_20_low20_11 * (const 64 (-(2**20))),
    r_433_444 * f_413_low60_20_low20_0 + s_433_444 * g_413_low60_20_low20_0 = g_413_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_11 + u_433_444 * (const 64 (2**21)) + v_433_444 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_11 + r_433_444 * (const 64 (2**21)) + s_433_444 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_11,
    f_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_11,
    g_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 444)) <=s delta, delta <=s (const 64 (1 + 2*444)),
    (const 64 (-(2**20))) <=s u_433_444, u_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_444, v_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_444, r_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_444, s_433_444 <=s (const 64 ((2**20)-1)),
    u_433_444 + v_433_444 <=s (const 64 (2**20)),
    u_433_444 - v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 + v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 - v_433_444 <=s (const 64 (2**20)),
    r_433_444 + s_433_444 <=s (const 64 (2**20)),
    r_433_444 - s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 + s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 - s_433_444 <=s (const 64 (2**20)),
    u_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_433_444 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step444

// premise b
assume
g_413_low60_20_low20_11 = 1 (mod 2)
&&
g_413_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_12 f_413_low60_20_low20_11;
mov u_433_445 u_433_444;
mov v_433_445 v_433_444;

add g_413_low60_20_low20_12 g_413_low60_20_low20_11 f_413_low60_20_low20_11;
asr g_413_low60_20_low20_12 g_413_low60_20_low20_12 1;
add r_433_445 r_433_444 u_433_444;
asr r_433_445 r_433_445 1;
add s_433_445 s_433_444 v_433_444;
asr s_433_445 s_433_445 1;
assert
    true
&&
    f_413_low60_20_low20_12 = f_413_low60_20_low20_11,
    u_433_445 = u_433_444,
    v_433_445 = v_433_444,
    g_413_low60_20_low20_12 * (const 64 2) = g_413_low60_20_low20_11 + f_413_low60_20_low20_11,
    r_433_445 * (const 64 2) = r_433_444 + u_433_444,
    s_433_445 * (const 64 2) = s_433_444 + v_433_444
;

assume
    f_413_low60_20_low20_12 = f_413_low60_20_low20_11,
    u_433_445 = u_433_444,
    v_433_445 = v_433_444,
    g_413_low60_20_low20_12 * 2 = g_413_low60_20_low20_11 + f_413_low60_20_low20_11,
    r_433_445 * 2 = r_433_444 + u_433_444,
    s_433_445 * 2 = s_433_444 + v_433_444
&&
    true
;

{
    u_433_445 * f_413_low60_20_low20_0 + v_433_445 * g_413_low60_20_low20_0 = f_413_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_445 * f_413_low60_20_low20_0 + s_433_445 * g_413_low60_20_low20_0 = g_413_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_12 + u_433_445 * (const 64 (2**21)) + v_433_445 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_12 + r_433_445 * (const 64 (2**21)) + s_433_445 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_12,
    f_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_12,
    g_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 445)) <=s delta, delta <=s (const 64 (1 + 2*445)),
    (const 64 (-(2**20))) <=s u_433_445, u_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_445, v_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_445, r_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_445, s_433_445 <=s (const 64 ((2**20)-1)),
    u_433_445 + v_433_445 <=s (const 64 (2**20)),
    u_433_445 - v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 + v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 - v_433_445 <=s (const 64 (2**20)),
    r_433_445 + s_433_445 <=s (const 64 (2**20)),
    r_433_445 - s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 + s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 - s_433_445 <=s (const 64 (2**20)),
    u_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_433_445 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_444_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_11,
sint64 g_413_low60_20_low20_11,
sint64 f_413_low60_20_low20_12,
sint64 g_413_low60_20_low20_12,
sint64 u_433_444,
sint64 v_433_444,
sint64 r_433_444,
sint64 s_433_444,
sint64 u_433_445,
sint64 v_433_445,
sint64 r_433_445,
sint64 s_433_445,
bit ne
)={
    u_433_444 * f_413_low60_20_low20_0 + v_433_444 * g_413_low60_20_low20_0 = f_413_low60_20_low20_11 * (-(2**20)),
    r_433_444 * f_413_low60_20_low20_0 + s_433_444 * g_413_low60_20_low20_0 = g_413_low60_20_low20_11 * (-(2**20))
&&
    u_433_444 * f_413_low60_20_low20_0 + v_433_444 * g_413_low60_20_low20_0 = f_413_low60_20_low20_11 * (const 64 (-(2**20))),
    r_433_444 * f_413_low60_20_low20_0 + s_433_444 * g_413_low60_20_low20_0 = g_413_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_11 + u_433_444 * (const 64 (2**21)) + v_433_444 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_11 + r_433_444 * (const 64 (2**21)) + s_433_444 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_11,
    f_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_11,
    g_413_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 444)) <=s delta, delta <=s (const 64 (1 + 2*444)),
    (const 64 (-(2**20))) <=s u_433_444, u_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_444, v_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_444, r_433_444 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_444, s_433_444 <=s (const 64 ((2**20)-1)),
    u_433_444 + v_433_444 <=s (const 64 (2**20)),
    u_433_444 - v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 + v_433_444 <=s (const 64 (2**20)),
    (const 64 0) - u_433_444 - v_433_444 <=s (const 64 (2**20)),
    r_433_444 + s_433_444 <=s (const 64 (2**20)),
    r_433_444 - s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 + s_433_444 <=s (const 64 (2**20)),
    (const 64 0) - r_433_444 - s_433_444 <=s (const 64 (2**20)),
    u_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_433_444 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_433_444 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step444

// premise c
assume
g_413_low60_20_low20_11 = 1 (mod 2)
&&
g_413_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_12 g_413_low60_20_low20_11;
mov u_433_445 r_433_444;
mov v_433_445 s_433_444;

subs dc g_413_low60_20_low20_12 g_413_low60_20_low20_11 f_413_low60_20_low20_11;
asr g_413_low60_20_low20_12 g_413_low60_20_low20_12 1;
subs dc r_433_445 r_433_444 u_433_444;
asr r_433_445 r_433_445 1;
subs dc s_433_445 s_433_444 v_433_444;
asr s_433_445 s_433_445 1;
assert
    true
&&
    f_413_low60_20_low20_12 = g_413_low60_20_low20_11,
    u_433_445 = r_433_444,
    v_433_445 = s_433_444,
    g_413_low60_20_low20_12 * (const 64 2) = g_413_low60_20_low20_11 - f_413_low60_20_low20_11,
    r_433_445 * (const 64 2) = r_433_444 - u_433_444,
    s_433_445 * (const 64 2) = s_433_444 - v_433_444
;

assume
    f_413_low60_20_low20_12 = g_413_low60_20_low20_11,
    u_433_445 = r_433_444,
    v_433_445 = s_433_444,
    g_413_low60_20_low20_12 * 2 = g_413_low60_20_low20_11 - f_413_low60_20_low20_11,
    r_433_445 * 2 = r_433_444 - u_433_444,
    s_433_445 * 2 = s_433_444 - v_433_444
&&
    true
;

{
    u_433_445 * f_413_low60_20_low20_0 + v_433_445 * g_413_low60_20_low20_0 = f_413_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_445 * f_413_low60_20_low20_0 + s_433_445 * g_413_low60_20_low20_0 = g_413_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_12 + u_433_445 * (const 64 (2**21)) + v_433_445 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_12 + r_433_445 * (const 64 (2**21)) + s_433_445 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_12,
    f_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_12,
    g_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 445)) <=s delta, delta <=s (const 64 (1 + 2*445)),
    (const 64 (-(2**20))) <=s u_433_445, u_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_445, v_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_445, r_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_445, s_433_445 <=s (const 64 ((2**20)-1)),
    u_433_445 + v_433_445 <=s (const 64 (2**20)),
    u_433_445 - v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 + v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 - v_433_445 <=s (const 64 (2**20)),
    r_433_445 + s_433_445 <=s (const 64 (2**20)),
    r_433_445 - s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 + s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 - s_433_445 <=s (const 64 (2**20)),
    u_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_433_445 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_445_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_12,
sint64 g_413_low60_20_low20_12,
sint64 f_413_low60_20_low20_13,
sint64 g_413_low60_20_low20_13,
sint64 u_433_445,
sint64 v_433_445,
sint64 r_433_445,
sint64 s_433_445,
sint64 u_433_446,
sint64 v_433_446,
sint64 r_433_446,
sint64 s_433_446,
bit ne
)={
    u_433_445 * f_413_low60_20_low20_0 + v_433_445 * g_413_low60_20_low20_0 = f_413_low60_20_low20_12 * (-(2**20)),
    r_433_445 * f_413_low60_20_low20_0 + s_433_445 * g_413_low60_20_low20_0 = g_413_low60_20_low20_12 * (-(2**20))
&&
    u_433_445 * f_413_low60_20_low20_0 + v_433_445 * g_413_low60_20_low20_0 = f_413_low60_20_low20_12 * (const 64 (-(2**20))),
    r_433_445 * f_413_low60_20_low20_0 + s_433_445 * g_413_low60_20_low20_0 = g_413_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_12 + u_433_445 * (const 64 (2**21)) + v_433_445 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_12 + r_433_445 * (const 64 (2**21)) + s_433_445 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_12,
    f_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_12,
    g_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 445)) <=s delta, delta <=s (const 64 (1 + 2*445)),
    (const 64 (-(2**20))) <=s u_433_445, u_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_445, v_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_445, r_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_445, s_433_445 <=s (const 64 ((2**20)-1)),
    u_433_445 + v_433_445 <=s (const 64 (2**20)),
    u_433_445 - v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 + v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 - v_433_445 <=s (const 64 (2**20)),
    r_433_445 + s_433_445 <=s (const 64 (2**20)),
    r_433_445 - s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 + s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 - s_433_445 <=s (const 64 (2**20)),
    u_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_433_445 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step445

// premise a
assume
g_413_low60_20_low20_12 = 0 (mod 2)
&&
g_413_low60_20_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_13 f_413_low60_20_low20_12;
mov u_433_446 u_433_445;
mov v_433_446 v_433_445;

asr g_413_low60_20_low20_13 g_413_low60_20_low20_12 1;
asr r_433_446 r_433_445 1;
asr s_433_446 s_433_445 1;
assert
    true
&&
    f_413_low60_20_low20_13 = f_413_low60_20_low20_12,
    u_433_446 = u_433_445,
    v_433_446 = v_433_445,
    g_413_low60_20_low20_13 * (const 64 2) = g_413_low60_20_low20_12,
    r_433_446 * (const 64 2) = r_433_445,
    s_433_446 * (const 64 2) = s_433_445
;

assume
    f_413_low60_20_low20_13 = f_413_low60_20_low20_12,
    u_433_446 = u_433_445,
    v_433_446 = v_433_445,
    g_413_low60_20_low20_13 * 2 = g_413_low60_20_low20_12,
    r_433_446 * 2 = r_433_445,
    s_433_446 * 2 = s_433_445
&&
    true
;

{
    u_433_446 * f_413_low60_20_low20_0 + v_433_446 * g_413_low60_20_low20_0 = f_413_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_446 * f_413_low60_20_low20_0 + s_433_446 * g_413_low60_20_low20_0 = g_413_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_13 + u_433_446 * (const 64 (2**21)) + v_433_446 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_13 + r_433_446 * (const 64 (2**21)) + s_433_446 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_13,
    f_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_13,
    g_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 446)) <=s delta, delta <=s (const 64 (1 + 2*446)),
    (const 64 (-(2**20))) <=s u_433_446, u_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_446, v_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_446, r_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_446, s_433_446 <=s (const 64 ((2**20)-1)),
    u_433_446 + v_433_446 <=s (const 64 (2**20)),
    u_433_446 - v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 + v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 - v_433_446 <=s (const 64 (2**20)),
    r_433_446 + s_433_446 <=s (const 64 (2**20)),
    r_433_446 - s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 + s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 - s_433_446 <=s (const 64 (2**20)),
    u_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_433_446 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_445_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_12,
sint64 g_413_low60_20_low20_12,
sint64 f_413_low60_20_low20_13,
sint64 g_413_low60_20_low20_13,
sint64 u_433_445,
sint64 v_433_445,
sint64 r_433_445,
sint64 s_433_445,
sint64 u_433_446,
sint64 v_433_446,
sint64 r_433_446,
sint64 s_433_446,
bit ne
)={
    u_433_445 * f_413_low60_20_low20_0 + v_433_445 * g_413_low60_20_low20_0 = f_413_low60_20_low20_12 * (-(2**20)),
    r_433_445 * f_413_low60_20_low20_0 + s_433_445 * g_413_low60_20_low20_0 = g_413_low60_20_low20_12 * (-(2**20))
&&
    u_433_445 * f_413_low60_20_low20_0 + v_433_445 * g_413_low60_20_low20_0 = f_413_low60_20_low20_12 * (const 64 (-(2**20))),
    r_433_445 * f_413_low60_20_low20_0 + s_433_445 * g_413_low60_20_low20_0 = g_413_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_12 + u_433_445 * (const 64 (2**21)) + v_433_445 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_12 + r_433_445 * (const 64 (2**21)) + s_433_445 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_12,
    f_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_12,
    g_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 445)) <=s delta, delta <=s (const 64 (1 + 2*445)),
    (const 64 (-(2**20))) <=s u_433_445, u_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_445, v_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_445, r_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_445, s_433_445 <=s (const 64 ((2**20)-1)),
    u_433_445 + v_433_445 <=s (const 64 (2**20)),
    u_433_445 - v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 + v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 - v_433_445 <=s (const 64 (2**20)),
    r_433_445 + s_433_445 <=s (const 64 (2**20)),
    r_433_445 - s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 + s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 - s_433_445 <=s (const 64 (2**20)),
    u_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_433_445 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step445

// premise b
assume
g_413_low60_20_low20_12 = 1 (mod 2)
&&
g_413_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_13 f_413_low60_20_low20_12;
mov u_433_446 u_433_445;
mov v_433_446 v_433_445;

add g_413_low60_20_low20_13 g_413_low60_20_low20_12 f_413_low60_20_low20_12;
asr g_413_low60_20_low20_13 g_413_low60_20_low20_13 1;
add r_433_446 r_433_445 u_433_445;
asr r_433_446 r_433_446 1;
add s_433_446 s_433_445 v_433_445;
asr s_433_446 s_433_446 1;
assert
    true
&&
    f_413_low60_20_low20_13 = f_413_low60_20_low20_12,
    u_433_446 = u_433_445,
    v_433_446 = v_433_445,
    g_413_low60_20_low20_13 * (const 64 2) = g_413_low60_20_low20_12 + f_413_low60_20_low20_12,
    r_433_446 * (const 64 2) = r_433_445 + u_433_445,
    s_433_446 * (const 64 2) = s_433_445 + v_433_445
;

assume
    f_413_low60_20_low20_13 = f_413_low60_20_low20_12,
    u_433_446 = u_433_445,
    v_433_446 = v_433_445,
    g_413_low60_20_low20_13 * 2 = g_413_low60_20_low20_12 + f_413_low60_20_low20_12,
    r_433_446 * 2 = r_433_445 + u_433_445,
    s_433_446 * 2 = s_433_445 + v_433_445
&&
    true
;

{
    u_433_446 * f_413_low60_20_low20_0 + v_433_446 * g_413_low60_20_low20_0 = f_413_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_446 * f_413_low60_20_low20_0 + s_433_446 * g_413_low60_20_low20_0 = g_413_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_13 + u_433_446 * (const 64 (2**21)) + v_433_446 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_13 + r_433_446 * (const 64 (2**21)) + s_433_446 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_13,
    f_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_13,
    g_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 446)) <=s delta, delta <=s (const 64 (1 + 2*446)),
    (const 64 (-(2**20))) <=s u_433_446, u_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_446, v_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_446, r_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_446, s_433_446 <=s (const 64 ((2**20)-1)),
    u_433_446 + v_433_446 <=s (const 64 (2**20)),
    u_433_446 - v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 + v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 - v_433_446 <=s (const 64 (2**20)),
    r_433_446 + s_433_446 <=s (const 64 (2**20)),
    r_433_446 - s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 + s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 - s_433_446 <=s (const 64 (2**20)),
    u_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_433_446 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_445_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_12,
sint64 g_413_low60_20_low20_12,
sint64 f_413_low60_20_low20_13,
sint64 g_413_low60_20_low20_13,
sint64 u_433_445,
sint64 v_433_445,
sint64 r_433_445,
sint64 s_433_445,
sint64 u_433_446,
sint64 v_433_446,
sint64 r_433_446,
sint64 s_433_446,
bit ne
)={
    u_433_445 * f_413_low60_20_low20_0 + v_433_445 * g_413_low60_20_low20_0 = f_413_low60_20_low20_12 * (-(2**20)),
    r_433_445 * f_413_low60_20_low20_0 + s_433_445 * g_413_low60_20_low20_0 = g_413_low60_20_low20_12 * (-(2**20))
&&
    u_433_445 * f_413_low60_20_low20_0 + v_433_445 * g_413_low60_20_low20_0 = f_413_low60_20_low20_12 * (const 64 (-(2**20))),
    r_433_445 * f_413_low60_20_low20_0 + s_433_445 * g_413_low60_20_low20_0 = g_413_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_12 + u_433_445 * (const 64 (2**21)) + v_433_445 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_12 + r_433_445 * (const 64 (2**21)) + s_433_445 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_12,
    f_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_12,
    g_413_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 445)) <=s delta, delta <=s (const 64 (1 + 2*445)),
    (const 64 (-(2**20))) <=s u_433_445, u_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_445, v_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_445, r_433_445 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_445, s_433_445 <=s (const 64 ((2**20)-1)),
    u_433_445 + v_433_445 <=s (const 64 (2**20)),
    u_433_445 - v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 + v_433_445 <=s (const 64 (2**20)),
    (const 64 0) - u_433_445 - v_433_445 <=s (const 64 (2**20)),
    r_433_445 + s_433_445 <=s (const 64 (2**20)),
    r_433_445 - s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 + s_433_445 <=s (const 64 (2**20)),
    (const 64 0) - r_433_445 - s_433_445 <=s (const 64 (2**20)),
    u_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_433_445 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_433_445 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step445

// premise c
assume
g_413_low60_20_low20_12 = 1 (mod 2)
&&
g_413_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_13 g_413_low60_20_low20_12;
mov u_433_446 r_433_445;
mov v_433_446 s_433_445;

subs dc g_413_low60_20_low20_13 g_413_low60_20_low20_12 f_413_low60_20_low20_12;
asr g_413_low60_20_low20_13 g_413_low60_20_low20_13 1;
subs dc r_433_446 r_433_445 u_433_445;
asr r_433_446 r_433_446 1;
subs dc s_433_446 s_433_445 v_433_445;
asr s_433_446 s_433_446 1;
assert
    true
&&
    f_413_low60_20_low20_13 = g_413_low60_20_low20_12,
    u_433_446 = r_433_445,
    v_433_446 = s_433_445,
    g_413_low60_20_low20_13 * (const 64 2) = g_413_low60_20_low20_12 - f_413_low60_20_low20_12,
    r_433_446 * (const 64 2) = r_433_445 - u_433_445,
    s_433_446 * (const 64 2) = s_433_445 - v_433_445
;

assume
    f_413_low60_20_low20_13 = g_413_low60_20_low20_12,
    u_433_446 = r_433_445,
    v_433_446 = s_433_445,
    g_413_low60_20_low20_13 * 2 = g_413_low60_20_low20_12 - f_413_low60_20_low20_12,
    r_433_446 * 2 = r_433_445 - u_433_445,
    s_433_446 * 2 = s_433_445 - v_433_445
&&
    true
;

{
    u_433_446 * f_413_low60_20_low20_0 + v_433_446 * g_413_low60_20_low20_0 = f_413_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_446 * f_413_low60_20_low20_0 + s_433_446 * g_413_low60_20_low20_0 = g_413_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_13 + u_433_446 * (const 64 (2**21)) + v_433_446 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_13 + r_433_446 * (const 64 (2**21)) + s_433_446 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_13,
    f_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_13,
    g_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 446)) <=s delta, delta <=s (const 64 (1 + 2*446)),
    (const 64 (-(2**20))) <=s u_433_446, u_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_446, v_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_446, r_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_446, s_433_446 <=s (const 64 ((2**20)-1)),
    u_433_446 + v_433_446 <=s (const 64 (2**20)),
    u_433_446 - v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 + v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 - v_433_446 <=s (const 64 (2**20)),
    r_433_446 + s_433_446 <=s (const 64 (2**20)),
    r_433_446 - s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 + s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 - s_433_446 <=s (const 64 (2**20)),
    u_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_433_446 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_446_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_13,
sint64 g_413_low60_20_low20_13,
sint64 f_413_low60_20_low20_14,
sint64 g_413_low60_20_low20_14,
sint64 u_433_446,
sint64 v_433_446,
sint64 r_433_446,
sint64 s_433_446,
sint64 u_433_447,
sint64 v_433_447,
sint64 r_433_447,
sint64 s_433_447,
bit ne
)={
    u_433_446 * f_413_low60_20_low20_0 + v_433_446 * g_413_low60_20_low20_0 = f_413_low60_20_low20_13 * (-(2**20)),
    r_433_446 * f_413_low60_20_low20_0 + s_433_446 * g_413_low60_20_low20_0 = g_413_low60_20_low20_13 * (-(2**20))
&&
    u_433_446 * f_413_low60_20_low20_0 + v_433_446 * g_413_low60_20_low20_0 = f_413_low60_20_low20_13 * (const 64 (-(2**20))),
    r_433_446 * f_413_low60_20_low20_0 + s_433_446 * g_413_low60_20_low20_0 = g_413_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_13 + u_433_446 * (const 64 (2**21)) + v_433_446 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_13 + r_433_446 * (const 64 (2**21)) + s_433_446 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_13,
    f_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_13,
    g_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 446)) <=s delta, delta <=s (const 64 (1 + 2*446)),
    (const 64 (-(2**20))) <=s u_433_446, u_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_446, v_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_446, r_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_446, s_433_446 <=s (const 64 ((2**20)-1)),
    u_433_446 + v_433_446 <=s (const 64 (2**20)),
    u_433_446 - v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 + v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 - v_433_446 <=s (const 64 (2**20)),
    r_433_446 + s_433_446 <=s (const 64 (2**20)),
    r_433_446 - s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 + s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 - s_433_446 <=s (const 64 (2**20)),
    u_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_433_446 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step446

// premise a
assume
g_413_low60_20_low20_13 = 0 (mod 2)
&&
g_413_low60_20_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_14 f_413_low60_20_low20_13;
mov u_433_447 u_433_446;
mov v_433_447 v_433_446;

asr g_413_low60_20_low20_14 g_413_low60_20_low20_13 1;
asr r_433_447 r_433_446 1;
asr s_433_447 s_433_446 1;
assert
    true
&&
    f_413_low60_20_low20_14 = f_413_low60_20_low20_13,
    u_433_447 = u_433_446,
    v_433_447 = v_433_446,
    g_413_low60_20_low20_14 * (const 64 2) = g_413_low60_20_low20_13,
    r_433_447 * (const 64 2) = r_433_446,
    s_433_447 * (const 64 2) = s_433_446
;

assume
    f_413_low60_20_low20_14 = f_413_low60_20_low20_13,
    u_433_447 = u_433_446,
    v_433_447 = v_433_446,
    g_413_low60_20_low20_14 * 2 = g_413_low60_20_low20_13,
    r_433_447 * 2 = r_433_446,
    s_433_447 * 2 = s_433_446
&&
    true
;

{
    u_433_447 * f_413_low60_20_low20_0 + v_433_447 * g_413_low60_20_low20_0 = f_413_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_447 * f_413_low60_20_low20_0 + s_433_447 * g_413_low60_20_low20_0 = g_413_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_14 + u_433_447 * (const 64 (2**21)) + v_433_447 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_14 + r_433_447 * (const 64 (2**21)) + s_433_447 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_14,
    f_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_14,
    g_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 447)) <=s delta, delta <=s (const 64 (1 + 2*447)),
    (const 64 (-(2**20))) <=s u_433_447, u_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_447, v_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_447, r_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_447, s_433_447 <=s (const 64 ((2**20)-1)),
    u_433_447 + v_433_447 <=s (const 64 (2**20)),
    u_433_447 - v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 + v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 - v_433_447 <=s (const 64 (2**20)),
    r_433_447 + s_433_447 <=s (const 64 (2**20)),
    r_433_447 - s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 + s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 - s_433_447 <=s (const 64 (2**20)),
    u_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_433_447 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_446_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_13,
sint64 g_413_low60_20_low20_13,
sint64 f_413_low60_20_low20_14,
sint64 g_413_low60_20_low20_14,
sint64 u_433_446,
sint64 v_433_446,
sint64 r_433_446,
sint64 s_433_446,
sint64 u_433_447,
sint64 v_433_447,
sint64 r_433_447,
sint64 s_433_447,
bit ne
)={
    u_433_446 * f_413_low60_20_low20_0 + v_433_446 * g_413_low60_20_low20_0 = f_413_low60_20_low20_13 * (-(2**20)),
    r_433_446 * f_413_low60_20_low20_0 + s_433_446 * g_413_low60_20_low20_0 = g_413_low60_20_low20_13 * (-(2**20))
&&
    u_433_446 * f_413_low60_20_low20_0 + v_433_446 * g_413_low60_20_low20_0 = f_413_low60_20_low20_13 * (const 64 (-(2**20))),
    r_433_446 * f_413_low60_20_low20_0 + s_433_446 * g_413_low60_20_low20_0 = g_413_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_13 + u_433_446 * (const 64 (2**21)) + v_433_446 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_13 + r_433_446 * (const 64 (2**21)) + s_433_446 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_13,
    f_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_13,
    g_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 446)) <=s delta, delta <=s (const 64 (1 + 2*446)),
    (const 64 (-(2**20))) <=s u_433_446, u_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_446, v_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_446, r_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_446, s_433_446 <=s (const 64 ((2**20)-1)),
    u_433_446 + v_433_446 <=s (const 64 (2**20)),
    u_433_446 - v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 + v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 - v_433_446 <=s (const 64 (2**20)),
    r_433_446 + s_433_446 <=s (const 64 (2**20)),
    r_433_446 - s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 + s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 - s_433_446 <=s (const 64 (2**20)),
    u_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_433_446 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step446

// premise b
assume
g_413_low60_20_low20_13 = 1 (mod 2)
&&
g_413_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_14 f_413_low60_20_low20_13;
mov u_433_447 u_433_446;
mov v_433_447 v_433_446;

add g_413_low60_20_low20_14 g_413_low60_20_low20_13 f_413_low60_20_low20_13;
asr g_413_low60_20_low20_14 g_413_low60_20_low20_14 1;
add r_433_447 r_433_446 u_433_446;
asr r_433_447 r_433_447 1;
add s_433_447 s_433_446 v_433_446;
asr s_433_447 s_433_447 1;
assert
    true
&&
    f_413_low60_20_low20_14 = f_413_low60_20_low20_13,
    u_433_447 = u_433_446,
    v_433_447 = v_433_446,
    g_413_low60_20_low20_14 * (const 64 2) = g_413_low60_20_low20_13 + f_413_low60_20_low20_13,
    r_433_447 * (const 64 2) = r_433_446 + u_433_446,
    s_433_447 * (const 64 2) = s_433_446 + v_433_446
;

assume
    f_413_low60_20_low20_14 = f_413_low60_20_low20_13,
    u_433_447 = u_433_446,
    v_433_447 = v_433_446,
    g_413_low60_20_low20_14 * 2 = g_413_low60_20_low20_13 + f_413_low60_20_low20_13,
    r_433_447 * 2 = r_433_446 + u_433_446,
    s_433_447 * 2 = s_433_446 + v_433_446
&&
    true
;

{
    u_433_447 * f_413_low60_20_low20_0 + v_433_447 * g_413_low60_20_low20_0 = f_413_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_447 * f_413_low60_20_low20_0 + s_433_447 * g_413_low60_20_low20_0 = g_413_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_14 + u_433_447 * (const 64 (2**21)) + v_433_447 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_14 + r_433_447 * (const 64 (2**21)) + s_433_447 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_14,
    f_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_14,
    g_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 447)) <=s delta, delta <=s (const 64 (1 + 2*447)),
    (const 64 (-(2**20))) <=s u_433_447, u_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_447, v_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_447, r_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_447, s_433_447 <=s (const 64 ((2**20)-1)),
    u_433_447 + v_433_447 <=s (const 64 (2**20)),
    u_433_447 - v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 + v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 - v_433_447 <=s (const 64 (2**20)),
    r_433_447 + s_433_447 <=s (const 64 (2**20)),
    r_433_447 - s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 + s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 - s_433_447 <=s (const 64 (2**20)),
    u_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_433_447 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_446_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_13,
sint64 g_413_low60_20_low20_13,
sint64 f_413_low60_20_low20_14,
sint64 g_413_low60_20_low20_14,
sint64 u_433_446,
sint64 v_433_446,
sint64 r_433_446,
sint64 s_433_446,
sint64 u_433_447,
sint64 v_433_447,
sint64 r_433_447,
sint64 s_433_447,
bit ne
)={
    u_433_446 * f_413_low60_20_low20_0 + v_433_446 * g_413_low60_20_low20_0 = f_413_low60_20_low20_13 * (-(2**20)),
    r_433_446 * f_413_low60_20_low20_0 + s_433_446 * g_413_low60_20_low20_0 = g_413_low60_20_low20_13 * (-(2**20))
&&
    u_433_446 * f_413_low60_20_low20_0 + v_433_446 * g_413_low60_20_low20_0 = f_413_low60_20_low20_13 * (const 64 (-(2**20))),
    r_433_446 * f_413_low60_20_low20_0 + s_433_446 * g_413_low60_20_low20_0 = g_413_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_13 + u_433_446 * (const 64 (2**21)) + v_433_446 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_13 + r_433_446 * (const 64 (2**21)) + s_433_446 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_13,
    f_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_13,
    g_413_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 446)) <=s delta, delta <=s (const 64 (1 + 2*446)),
    (const 64 (-(2**20))) <=s u_433_446, u_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_446, v_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_446, r_433_446 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_446, s_433_446 <=s (const 64 ((2**20)-1)),
    u_433_446 + v_433_446 <=s (const 64 (2**20)),
    u_433_446 - v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 + v_433_446 <=s (const 64 (2**20)),
    (const 64 0) - u_433_446 - v_433_446 <=s (const 64 (2**20)),
    r_433_446 + s_433_446 <=s (const 64 (2**20)),
    r_433_446 - s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 + s_433_446 <=s (const 64 (2**20)),
    (const 64 0) - r_433_446 - s_433_446 <=s (const 64 (2**20)),
    u_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_433_446 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_433_446 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step446

// premise c
assume
g_413_low60_20_low20_13 = 1 (mod 2)
&&
g_413_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_14 g_413_low60_20_low20_13;
mov u_433_447 r_433_446;
mov v_433_447 s_433_446;

subs dc g_413_low60_20_low20_14 g_413_low60_20_low20_13 f_413_low60_20_low20_13;
asr g_413_low60_20_low20_14 g_413_low60_20_low20_14 1;
subs dc r_433_447 r_433_446 u_433_446;
asr r_433_447 r_433_447 1;
subs dc s_433_447 s_433_446 v_433_446;
asr s_433_447 s_433_447 1;
assert
    true
&&
    f_413_low60_20_low20_14 = g_413_low60_20_low20_13,
    u_433_447 = r_433_446,
    v_433_447 = s_433_446,
    g_413_low60_20_low20_14 * (const 64 2) = g_413_low60_20_low20_13 - f_413_low60_20_low20_13,
    r_433_447 * (const 64 2) = r_433_446 - u_433_446,
    s_433_447 * (const 64 2) = s_433_446 - v_433_446
;

assume
    f_413_low60_20_low20_14 = g_413_low60_20_low20_13,
    u_433_447 = r_433_446,
    v_433_447 = s_433_446,
    g_413_low60_20_low20_14 * 2 = g_413_low60_20_low20_13 - f_413_low60_20_low20_13,
    r_433_447 * 2 = r_433_446 - u_433_446,
    s_433_447 * 2 = s_433_446 - v_433_446
&&
    true
;

{
    u_433_447 * f_413_low60_20_low20_0 + v_433_447 * g_413_low60_20_low20_0 = f_413_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_447 * f_413_low60_20_low20_0 + s_433_447 * g_413_low60_20_low20_0 = g_413_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_14 + u_433_447 * (const 64 (2**21)) + v_433_447 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_14 + r_433_447 * (const 64 (2**21)) + s_433_447 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_14,
    f_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_14,
    g_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 447)) <=s delta, delta <=s (const 64 (1 + 2*447)),
    (const 64 (-(2**20))) <=s u_433_447, u_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_447, v_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_447, r_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_447, s_433_447 <=s (const 64 ((2**20)-1)),
    u_433_447 + v_433_447 <=s (const 64 (2**20)),
    u_433_447 - v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 + v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 - v_433_447 <=s (const 64 (2**20)),
    r_433_447 + s_433_447 <=s (const 64 (2**20)),
    r_433_447 - s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 + s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 - s_433_447 <=s (const 64 (2**20)),
    u_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_433_447 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_447_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_14,
sint64 g_413_low60_20_low20_14,
sint64 f_413_low60_20_low20_15,
sint64 g_413_low60_20_low20_15,
sint64 u_433_447,
sint64 v_433_447,
sint64 r_433_447,
sint64 s_433_447,
sint64 u_433_448,
sint64 v_433_448,
sint64 r_433_448,
sint64 s_433_448,
bit ne
)={
    u_433_447 * f_413_low60_20_low20_0 + v_433_447 * g_413_low60_20_low20_0 = f_413_low60_20_low20_14 * (-(2**20)),
    r_433_447 * f_413_low60_20_low20_0 + s_433_447 * g_413_low60_20_low20_0 = g_413_low60_20_low20_14 * (-(2**20))
&&
    u_433_447 * f_413_low60_20_low20_0 + v_433_447 * g_413_low60_20_low20_0 = f_413_low60_20_low20_14 * (const 64 (-(2**20))),
    r_433_447 * f_413_low60_20_low20_0 + s_433_447 * g_413_low60_20_low20_0 = g_413_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_14 + u_433_447 * (const 64 (2**21)) + v_433_447 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_14 + r_433_447 * (const 64 (2**21)) + s_433_447 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_14,
    f_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_14,
    g_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 447)) <=s delta, delta <=s (const 64 (1 + 2*447)),
    (const 64 (-(2**20))) <=s u_433_447, u_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_447, v_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_447, r_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_447, s_433_447 <=s (const 64 ((2**20)-1)),
    u_433_447 + v_433_447 <=s (const 64 (2**20)),
    u_433_447 - v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 + v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 - v_433_447 <=s (const 64 (2**20)),
    r_433_447 + s_433_447 <=s (const 64 (2**20)),
    r_433_447 - s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 + s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 - s_433_447 <=s (const 64 (2**20)),
    u_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_433_447 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step447

// premise a
assume
g_413_low60_20_low20_14 = 0 (mod 2)
&&
g_413_low60_20_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_15 f_413_low60_20_low20_14;
mov u_433_448 u_433_447;
mov v_433_448 v_433_447;

asr g_413_low60_20_low20_15 g_413_low60_20_low20_14 1;
asr r_433_448 r_433_447 1;
asr s_433_448 s_433_447 1;
assert
    true
&&
    f_413_low60_20_low20_15 = f_413_low60_20_low20_14,
    u_433_448 = u_433_447,
    v_433_448 = v_433_447,
    g_413_low60_20_low20_15 * (const 64 2) = g_413_low60_20_low20_14,
    r_433_448 * (const 64 2) = r_433_447,
    s_433_448 * (const 64 2) = s_433_447
;

assume
    f_413_low60_20_low20_15 = f_413_low60_20_low20_14,
    u_433_448 = u_433_447,
    v_433_448 = v_433_447,
    g_413_low60_20_low20_15 * 2 = g_413_low60_20_low20_14,
    r_433_448 * 2 = r_433_447,
    s_433_448 * 2 = s_433_447
&&
    true
;

{
    u_433_448 * f_413_low60_20_low20_0 + v_433_448 * g_413_low60_20_low20_0 = f_413_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_448 * f_413_low60_20_low20_0 + s_433_448 * g_413_low60_20_low20_0 = g_413_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_15 + u_433_448 * (const 64 (2**21)) + v_433_448 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_15 + r_433_448 * (const 64 (2**21)) + s_433_448 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_15,
    f_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_15,
    g_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 448)) <=s delta, delta <=s (const 64 (1 + 2*448)),
    (const 64 (-(2**20))) <=s u_433_448, u_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_448, v_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_448, r_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_448, s_433_448 <=s (const 64 ((2**20)-1)),
    u_433_448 + v_433_448 <=s (const 64 (2**20)),
    u_433_448 - v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 + v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 - v_433_448 <=s (const 64 (2**20)),
    r_433_448 + s_433_448 <=s (const 64 (2**20)),
    r_433_448 - s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 + s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 - s_433_448 <=s (const 64 (2**20)),
    u_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_433_448 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_447_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_14,
sint64 g_413_low60_20_low20_14,
sint64 f_413_low60_20_low20_15,
sint64 g_413_low60_20_low20_15,
sint64 u_433_447,
sint64 v_433_447,
sint64 r_433_447,
sint64 s_433_447,
sint64 u_433_448,
sint64 v_433_448,
sint64 r_433_448,
sint64 s_433_448,
bit ne
)={
    u_433_447 * f_413_low60_20_low20_0 + v_433_447 * g_413_low60_20_low20_0 = f_413_low60_20_low20_14 * (-(2**20)),
    r_433_447 * f_413_low60_20_low20_0 + s_433_447 * g_413_low60_20_low20_0 = g_413_low60_20_low20_14 * (-(2**20))
&&
    u_433_447 * f_413_low60_20_low20_0 + v_433_447 * g_413_low60_20_low20_0 = f_413_low60_20_low20_14 * (const 64 (-(2**20))),
    r_433_447 * f_413_low60_20_low20_0 + s_433_447 * g_413_low60_20_low20_0 = g_413_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_14 + u_433_447 * (const 64 (2**21)) + v_433_447 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_14 + r_433_447 * (const 64 (2**21)) + s_433_447 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_14,
    f_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_14,
    g_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 447)) <=s delta, delta <=s (const 64 (1 + 2*447)),
    (const 64 (-(2**20))) <=s u_433_447, u_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_447, v_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_447, r_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_447, s_433_447 <=s (const 64 ((2**20)-1)),
    u_433_447 + v_433_447 <=s (const 64 (2**20)),
    u_433_447 - v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 + v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 - v_433_447 <=s (const 64 (2**20)),
    r_433_447 + s_433_447 <=s (const 64 (2**20)),
    r_433_447 - s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 + s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 - s_433_447 <=s (const 64 (2**20)),
    u_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_433_447 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step447

// premise b
assume
g_413_low60_20_low20_14 = 1 (mod 2)
&&
g_413_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_15 f_413_low60_20_low20_14;
mov u_433_448 u_433_447;
mov v_433_448 v_433_447;

add g_413_low60_20_low20_15 g_413_low60_20_low20_14 f_413_low60_20_low20_14;
asr g_413_low60_20_low20_15 g_413_low60_20_low20_15 1;
add r_433_448 r_433_447 u_433_447;
asr r_433_448 r_433_448 1;
add s_433_448 s_433_447 v_433_447;
asr s_433_448 s_433_448 1;
assert
    true
&&
    f_413_low60_20_low20_15 = f_413_low60_20_low20_14,
    u_433_448 = u_433_447,
    v_433_448 = v_433_447,
    g_413_low60_20_low20_15 * (const 64 2) = g_413_low60_20_low20_14 + f_413_low60_20_low20_14,
    r_433_448 * (const 64 2) = r_433_447 + u_433_447,
    s_433_448 * (const 64 2) = s_433_447 + v_433_447
;

assume
    f_413_low60_20_low20_15 = f_413_low60_20_low20_14,
    u_433_448 = u_433_447,
    v_433_448 = v_433_447,
    g_413_low60_20_low20_15 * 2 = g_413_low60_20_low20_14 + f_413_low60_20_low20_14,
    r_433_448 * 2 = r_433_447 + u_433_447,
    s_433_448 * 2 = s_433_447 + v_433_447
&&
    true
;

{
    u_433_448 * f_413_low60_20_low20_0 + v_433_448 * g_413_low60_20_low20_0 = f_413_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_448 * f_413_low60_20_low20_0 + s_433_448 * g_413_low60_20_low20_0 = g_413_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_15 + u_433_448 * (const 64 (2**21)) + v_433_448 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_15 + r_433_448 * (const 64 (2**21)) + s_433_448 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_15,
    f_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_15,
    g_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 448)) <=s delta, delta <=s (const 64 (1 + 2*448)),
    (const 64 (-(2**20))) <=s u_433_448, u_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_448, v_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_448, r_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_448, s_433_448 <=s (const 64 ((2**20)-1)),
    u_433_448 + v_433_448 <=s (const 64 (2**20)),
    u_433_448 - v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 + v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 - v_433_448 <=s (const 64 (2**20)),
    r_433_448 + s_433_448 <=s (const 64 (2**20)),
    r_433_448 - s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 + s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 - s_433_448 <=s (const 64 (2**20)),
    u_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_433_448 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_447_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_14,
sint64 g_413_low60_20_low20_14,
sint64 f_413_low60_20_low20_15,
sint64 g_413_low60_20_low20_15,
sint64 u_433_447,
sint64 v_433_447,
sint64 r_433_447,
sint64 s_433_447,
sint64 u_433_448,
sint64 v_433_448,
sint64 r_433_448,
sint64 s_433_448,
bit ne
)={
    u_433_447 * f_413_low60_20_low20_0 + v_433_447 * g_413_low60_20_low20_0 = f_413_low60_20_low20_14 * (-(2**20)),
    r_433_447 * f_413_low60_20_low20_0 + s_433_447 * g_413_low60_20_low20_0 = g_413_low60_20_low20_14 * (-(2**20))
&&
    u_433_447 * f_413_low60_20_low20_0 + v_433_447 * g_413_low60_20_low20_0 = f_413_low60_20_low20_14 * (const 64 (-(2**20))),
    r_433_447 * f_413_low60_20_low20_0 + s_433_447 * g_413_low60_20_low20_0 = g_413_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_14 + u_433_447 * (const 64 (2**21)) + v_433_447 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_14 + r_433_447 * (const 64 (2**21)) + s_433_447 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_14,
    f_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_14,
    g_413_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 447)) <=s delta, delta <=s (const 64 (1 + 2*447)),
    (const 64 (-(2**20))) <=s u_433_447, u_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_447, v_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_447, r_433_447 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_447, s_433_447 <=s (const 64 ((2**20)-1)),
    u_433_447 + v_433_447 <=s (const 64 (2**20)),
    u_433_447 - v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 + v_433_447 <=s (const 64 (2**20)),
    (const 64 0) - u_433_447 - v_433_447 <=s (const 64 (2**20)),
    r_433_447 + s_433_447 <=s (const 64 (2**20)),
    r_433_447 - s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 + s_433_447 <=s (const 64 (2**20)),
    (const 64 0) - r_433_447 - s_433_447 <=s (const 64 (2**20)),
    u_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_433_447 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_433_447 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step447

// premise c
assume
g_413_low60_20_low20_14 = 1 (mod 2)
&&
g_413_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_15 g_413_low60_20_low20_14;
mov u_433_448 r_433_447;
mov v_433_448 s_433_447;

subs dc g_413_low60_20_low20_15 g_413_low60_20_low20_14 f_413_low60_20_low20_14;
asr g_413_low60_20_low20_15 g_413_low60_20_low20_15 1;
subs dc r_433_448 r_433_447 u_433_447;
asr r_433_448 r_433_448 1;
subs dc s_433_448 s_433_447 v_433_447;
asr s_433_448 s_433_448 1;
assert
    true
&&
    f_413_low60_20_low20_15 = g_413_low60_20_low20_14,
    u_433_448 = r_433_447,
    v_433_448 = s_433_447,
    g_413_low60_20_low20_15 * (const 64 2) = g_413_low60_20_low20_14 - f_413_low60_20_low20_14,
    r_433_448 * (const 64 2) = r_433_447 - u_433_447,
    s_433_448 * (const 64 2) = s_433_447 - v_433_447
;

assume
    f_413_low60_20_low20_15 = g_413_low60_20_low20_14,
    u_433_448 = r_433_447,
    v_433_448 = s_433_447,
    g_413_low60_20_low20_15 * 2 = g_413_low60_20_low20_14 - f_413_low60_20_low20_14,
    r_433_448 * 2 = r_433_447 - u_433_447,
    s_433_448 * 2 = s_433_447 - v_433_447
&&
    true
;

{
    u_433_448 * f_413_low60_20_low20_0 + v_433_448 * g_413_low60_20_low20_0 = f_413_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_448 * f_413_low60_20_low20_0 + s_433_448 * g_413_low60_20_low20_0 = g_413_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_15 + u_433_448 * (const 64 (2**21)) + v_433_448 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_15 + r_433_448 * (const 64 (2**21)) + s_433_448 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_15,
    f_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_15,
    g_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 448)) <=s delta, delta <=s (const 64 (1 + 2*448)),
    (const 64 (-(2**20))) <=s u_433_448, u_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_448, v_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_448, r_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_448, s_433_448 <=s (const 64 ((2**20)-1)),
    u_433_448 + v_433_448 <=s (const 64 (2**20)),
    u_433_448 - v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 + v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 - v_433_448 <=s (const 64 (2**20)),
    r_433_448 + s_433_448 <=s (const 64 (2**20)),
    r_433_448 - s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 + s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 - s_433_448 <=s (const 64 (2**20)),
    u_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_433_448 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_448_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_15,
sint64 g_413_low60_20_low20_15,
sint64 f_413_low60_20_low20_16,
sint64 g_413_low60_20_low20_16,
sint64 u_433_448,
sint64 v_433_448,
sint64 r_433_448,
sint64 s_433_448,
sint64 u_433_449,
sint64 v_433_449,
sint64 r_433_449,
sint64 s_433_449,
bit ne
)={
    u_433_448 * f_413_low60_20_low20_0 + v_433_448 * g_413_low60_20_low20_0 = f_413_low60_20_low20_15 * (-(2**20)),
    r_433_448 * f_413_low60_20_low20_0 + s_433_448 * g_413_low60_20_low20_0 = g_413_low60_20_low20_15 * (-(2**20))
&&
    u_433_448 * f_413_low60_20_low20_0 + v_433_448 * g_413_low60_20_low20_0 = f_413_low60_20_low20_15 * (const 64 (-(2**20))),
    r_433_448 * f_413_low60_20_low20_0 + s_433_448 * g_413_low60_20_low20_0 = g_413_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_15 + u_433_448 * (const 64 (2**21)) + v_433_448 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_15 + r_433_448 * (const 64 (2**21)) + s_433_448 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_15,
    f_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_15,
    g_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 448)) <=s delta, delta <=s (const 64 (1 + 2*448)),
    (const 64 (-(2**20))) <=s u_433_448, u_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_448, v_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_448, r_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_448, s_433_448 <=s (const 64 ((2**20)-1)),
    u_433_448 + v_433_448 <=s (const 64 (2**20)),
    u_433_448 - v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 + v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 - v_433_448 <=s (const 64 (2**20)),
    r_433_448 + s_433_448 <=s (const 64 (2**20)),
    r_433_448 - s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 + s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 - s_433_448 <=s (const 64 (2**20)),
    u_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_433_448 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step448

// premise a
assume
g_413_low60_20_low20_15 = 0 (mod 2)
&&
g_413_low60_20_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_16 f_413_low60_20_low20_15;
mov u_433_449 u_433_448;
mov v_433_449 v_433_448;

asr g_413_low60_20_low20_16 g_413_low60_20_low20_15 1;
asr r_433_449 r_433_448 1;
asr s_433_449 s_433_448 1;
assert
    true
&&
    f_413_low60_20_low20_16 = f_413_low60_20_low20_15,
    u_433_449 = u_433_448,
    v_433_449 = v_433_448,
    g_413_low60_20_low20_16 * (const 64 2) = g_413_low60_20_low20_15,
    r_433_449 * (const 64 2) = r_433_448,
    s_433_449 * (const 64 2) = s_433_448
;

assume
    f_413_low60_20_low20_16 = f_413_low60_20_low20_15,
    u_433_449 = u_433_448,
    v_433_449 = v_433_448,
    g_413_low60_20_low20_16 * 2 = g_413_low60_20_low20_15,
    r_433_449 * 2 = r_433_448,
    s_433_449 * 2 = s_433_448
&&
    true
;

{
    u_433_449 * f_413_low60_20_low20_0 + v_433_449 * g_413_low60_20_low20_0 = f_413_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_449 * f_413_low60_20_low20_0 + s_433_449 * g_413_low60_20_low20_0 = g_413_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_16 + u_433_449 * (const 64 (2**21)) + v_433_449 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_16 + r_433_449 * (const 64 (2**21)) + s_433_449 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_16,
    f_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_16,
    g_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 449)) <=s delta, delta <=s (const 64 (1 + 2*449)),
    (const 64 (-(2**20))) <=s u_433_449, u_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_449, v_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_449, r_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_449, s_433_449 <=s (const 64 ((2**20)-1)),
    u_433_449 + v_433_449 <=s (const 64 (2**20)),
    u_433_449 - v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 + v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 - v_433_449 <=s (const 64 (2**20)),
    r_433_449 + s_433_449 <=s (const 64 (2**20)),
    r_433_449 - s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 + s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 - s_433_449 <=s (const 64 (2**20)),
    u_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_433_449 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_448_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_15,
sint64 g_413_low60_20_low20_15,
sint64 f_413_low60_20_low20_16,
sint64 g_413_low60_20_low20_16,
sint64 u_433_448,
sint64 v_433_448,
sint64 r_433_448,
sint64 s_433_448,
sint64 u_433_449,
sint64 v_433_449,
sint64 r_433_449,
sint64 s_433_449,
bit ne
)={
    u_433_448 * f_413_low60_20_low20_0 + v_433_448 * g_413_low60_20_low20_0 = f_413_low60_20_low20_15 * (-(2**20)),
    r_433_448 * f_413_low60_20_low20_0 + s_433_448 * g_413_low60_20_low20_0 = g_413_low60_20_low20_15 * (-(2**20))
&&
    u_433_448 * f_413_low60_20_low20_0 + v_433_448 * g_413_low60_20_low20_0 = f_413_low60_20_low20_15 * (const 64 (-(2**20))),
    r_433_448 * f_413_low60_20_low20_0 + s_433_448 * g_413_low60_20_low20_0 = g_413_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_15 + u_433_448 * (const 64 (2**21)) + v_433_448 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_15 + r_433_448 * (const 64 (2**21)) + s_433_448 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_15,
    f_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_15,
    g_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 448)) <=s delta, delta <=s (const 64 (1 + 2*448)),
    (const 64 (-(2**20))) <=s u_433_448, u_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_448, v_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_448, r_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_448, s_433_448 <=s (const 64 ((2**20)-1)),
    u_433_448 + v_433_448 <=s (const 64 (2**20)),
    u_433_448 - v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 + v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 - v_433_448 <=s (const 64 (2**20)),
    r_433_448 + s_433_448 <=s (const 64 (2**20)),
    r_433_448 - s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 + s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 - s_433_448 <=s (const 64 (2**20)),
    u_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_433_448 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step448

// premise b
assume
g_413_low60_20_low20_15 = 1 (mod 2)
&&
g_413_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_16 f_413_low60_20_low20_15;
mov u_433_449 u_433_448;
mov v_433_449 v_433_448;

add g_413_low60_20_low20_16 g_413_low60_20_low20_15 f_413_low60_20_low20_15;
asr g_413_low60_20_low20_16 g_413_low60_20_low20_16 1;
add r_433_449 r_433_448 u_433_448;
asr r_433_449 r_433_449 1;
add s_433_449 s_433_448 v_433_448;
asr s_433_449 s_433_449 1;
assert
    true
&&
    f_413_low60_20_low20_16 = f_413_low60_20_low20_15,
    u_433_449 = u_433_448,
    v_433_449 = v_433_448,
    g_413_low60_20_low20_16 * (const 64 2) = g_413_low60_20_low20_15 + f_413_low60_20_low20_15,
    r_433_449 * (const 64 2) = r_433_448 + u_433_448,
    s_433_449 * (const 64 2) = s_433_448 + v_433_448
;

assume
    f_413_low60_20_low20_16 = f_413_low60_20_low20_15,
    u_433_449 = u_433_448,
    v_433_449 = v_433_448,
    g_413_low60_20_low20_16 * 2 = g_413_low60_20_low20_15 + f_413_low60_20_low20_15,
    r_433_449 * 2 = r_433_448 + u_433_448,
    s_433_449 * 2 = s_433_448 + v_433_448
&&
    true
;

{
    u_433_449 * f_413_low60_20_low20_0 + v_433_449 * g_413_low60_20_low20_0 = f_413_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_449 * f_413_low60_20_low20_0 + s_433_449 * g_413_low60_20_low20_0 = g_413_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_16 + u_433_449 * (const 64 (2**21)) + v_433_449 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_16 + r_433_449 * (const 64 (2**21)) + s_433_449 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_16,
    f_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_16,
    g_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 449)) <=s delta, delta <=s (const 64 (1 + 2*449)),
    (const 64 (-(2**20))) <=s u_433_449, u_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_449, v_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_449, r_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_449, s_433_449 <=s (const 64 ((2**20)-1)),
    u_433_449 + v_433_449 <=s (const 64 (2**20)),
    u_433_449 - v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 + v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 - v_433_449 <=s (const 64 (2**20)),
    r_433_449 + s_433_449 <=s (const 64 (2**20)),
    r_433_449 - s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 + s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 - s_433_449 <=s (const 64 (2**20)),
    u_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_433_449 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_448_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_15,
sint64 g_413_low60_20_low20_15,
sint64 f_413_low60_20_low20_16,
sint64 g_413_low60_20_low20_16,
sint64 u_433_448,
sint64 v_433_448,
sint64 r_433_448,
sint64 s_433_448,
sint64 u_433_449,
sint64 v_433_449,
sint64 r_433_449,
sint64 s_433_449,
bit ne
)={
    u_433_448 * f_413_low60_20_low20_0 + v_433_448 * g_413_low60_20_low20_0 = f_413_low60_20_low20_15 * (-(2**20)),
    r_433_448 * f_413_low60_20_low20_0 + s_433_448 * g_413_low60_20_low20_0 = g_413_low60_20_low20_15 * (-(2**20))
&&
    u_433_448 * f_413_low60_20_low20_0 + v_433_448 * g_413_low60_20_low20_0 = f_413_low60_20_low20_15 * (const 64 (-(2**20))),
    r_433_448 * f_413_low60_20_low20_0 + s_433_448 * g_413_low60_20_low20_0 = g_413_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_15 + u_433_448 * (const 64 (2**21)) + v_433_448 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_15 + r_433_448 * (const 64 (2**21)) + s_433_448 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_15,
    f_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_15,
    g_413_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 448)) <=s delta, delta <=s (const 64 (1 + 2*448)),
    (const 64 (-(2**20))) <=s u_433_448, u_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_448, v_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_448, r_433_448 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_448, s_433_448 <=s (const 64 ((2**20)-1)),
    u_433_448 + v_433_448 <=s (const 64 (2**20)),
    u_433_448 - v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 + v_433_448 <=s (const 64 (2**20)),
    (const 64 0) - u_433_448 - v_433_448 <=s (const 64 (2**20)),
    r_433_448 + s_433_448 <=s (const 64 (2**20)),
    r_433_448 - s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 + s_433_448 <=s (const 64 (2**20)),
    (const 64 0) - r_433_448 - s_433_448 <=s (const 64 (2**20)),
    u_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_433_448 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_433_448 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step448

// premise c
assume
g_413_low60_20_low20_15 = 1 (mod 2)
&&
g_413_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_16 g_413_low60_20_low20_15;
mov u_433_449 r_433_448;
mov v_433_449 s_433_448;

subs dc g_413_low60_20_low20_16 g_413_low60_20_low20_15 f_413_low60_20_low20_15;
asr g_413_low60_20_low20_16 g_413_low60_20_low20_16 1;
subs dc r_433_449 r_433_448 u_433_448;
asr r_433_449 r_433_449 1;
subs dc s_433_449 s_433_448 v_433_448;
asr s_433_449 s_433_449 1;
assert
    true
&&
    f_413_low60_20_low20_16 = g_413_low60_20_low20_15,
    u_433_449 = r_433_448,
    v_433_449 = s_433_448,
    g_413_low60_20_low20_16 * (const 64 2) = g_413_low60_20_low20_15 - f_413_low60_20_low20_15,
    r_433_449 * (const 64 2) = r_433_448 - u_433_448,
    s_433_449 * (const 64 2) = s_433_448 - v_433_448
;

assume
    f_413_low60_20_low20_16 = g_413_low60_20_low20_15,
    u_433_449 = r_433_448,
    v_433_449 = s_433_448,
    g_413_low60_20_low20_16 * 2 = g_413_low60_20_low20_15 - f_413_low60_20_low20_15,
    r_433_449 * 2 = r_433_448 - u_433_448,
    s_433_449 * 2 = s_433_448 - v_433_448
&&
    true
;

{
    u_433_449 * f_413_low60_20_low20_0 + v_433_449 * g_413_low60_20_low20_0 = f_413_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_449 * f_413_low60_20_low20_0 + s_433_449 * g_413_low60_20_low20_0 = g_413_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_16 + u_433_449 * (const 64 (2**21)) + v_433_449 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_16 + r_433_449 * (const 64 (2**21)) + s_433_449 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_16,
    f_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_16,
    g_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 449)) <=s delta, delta <=s (const 64 (1 + 2*449)),
    (const 64 (-(2**20))) <=s u_433_449, u_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_449, v_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_449, r_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_449, s_433_449 <=s (const 64 ((2**20)-1)),
    u_433_449 + v_433_449 <=s (const 64 (2**20)),
    u_433_449 - v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 + v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 - v_433_449 <=s (const 64 (2**20)),
    r_433_449 + s_433_449 <=s (const 64 (2**20)),
    r_433_449 - s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 + s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 - s_433_449 <=s (const 64 (2**20)),
    u_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_433_449 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_449_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_16,
sint64 g_413_low60_20_low20_16,
sint64 f_413_low60_20_low20_17,
sint64 g_413_low60_20_low20_17,
sint64 u_433_449,
sint64 v_433_449,
sint64 r_433_449,
sint64 s_433_449,
sint64 u_433_450,
sint64 v_433_450,
sint64 r_433_450,
sint64 s_433_450,
bit ne
)={
    u_433_449 * f_413_low60_20_low20_0 + v_433_449 * g_413_low60_20_low20_0 = f_413_low60_20_low20_16 * (-(2**20)),
    r_433_449 * f_413_low60_20_low20_0 + s_433_449 * g_413_low60_20_low20_0 = g_413_low60_20_low20_16 * (-(2**20))
&&
    u_433_449 * f_413_low60_20_low20_0 + v_433_449 * g_413_low60_20_low20_0 = f_413_low60_20_low20_16 * (const 64 (-(2**20))),
    r_433_449 * f_413_low60_20_low20_0 + s_433_449 * g_413_low60_20_low20_0 = g_413_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_16 + u_433_449 * (const 64 (2**21)) + v_433_449 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_16 + r_433_449 * (const 64 (2**21)) + s_433_449 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_16,
    f_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_16,
    g_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 449)) <=s delta, delta <=s (const 64 (1 + 2*449)),
    (const 64 (-(2**20))) <=s u_433_449, u_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_449, v_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_449, r_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_449, s_433_449 <=s (const 64 ((2**20)-1)),
    u_433_449 + v_433_449 <=s (const 64 (2**20)),
    u_433_449 - v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 + v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 - v_433_449 <=s (const 64 (2**20)),
    r_433_449 + s_433_449 <=s (const 64 (2**20)),
    r_433_449 - s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 + s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 - s_433_449 <=s (const 64 (2**20)),
    u_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_433_449 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step449

// premise a
assume
g_413_low60_20_low20_16 = 0 (mod 2)
&&
g_413_low60_20_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_17 f_413_low60_20_low20_16;
mov u_433_450 u_433_449;
mov v_433_450 v_433_449;

asr g_413_low60_20_low20_17 g_413_low60_20_low20_16 1;
asr r_433_450 r_433_449 1;
asr s_433_450 s_433_449 1;
assert
    true
&&
    f_413_low60_20_low20_17 = f_413_low60_20_low20_16,
    u_433_450 = u_433_449,
    v_433_450 = v_433_449,
    g_413_low60_20_low20_17 * (const 64 2) = g_413_low60_20_low20_16,
    r_433_450 * (const 64 2) = r_433_449,
    s_433_450 * (const 64 2) = s_433_449
;

assume
    f_413_low60_20_low20_17 = f_413_low60_20_low20_16,
    u_433_450 = u_433_449,
    v_433_450 = v_433_449,
    g_413_low60_20_low20_17 * 2 = g_413_low60_20_low20_16,
    r_433_450 * 2 = r_433_449,
    s_433_450 * 2 = s_433_449
&&
    true
;

{
    u_433_450 * f_413_low60_20_low20_0 + v_433_450 * g_413_low60_20_low20_0 = f_413_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_450 * f_413_low60_20_low20_0 + s_433_450 * g_413_low60_20_low20_0 = g_413_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_17 + u_433_450 * (const 64 (2**21)) + v_433_450 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_17 + r_433_450 * (const 64 (2**21)) + s_433_450 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_17,
    f_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_17,
    g_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 450)) <=s delta, delta <=s (const 64 (1 + 2*450)),
    (const 64 (-(2**20))) <=s u_433_450, u_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_450, v_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_450, r_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_450, s_433_450 <=s (const 64 ((2**20)-1)),
    u_433_450 + v_433_450 <=s (const 64 (2**20)),
    u_433_450 - v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 + v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 - v_433_450 <=s (const 64 (2**20)),
    r_433_450 + s_433_450 <=s (const 64 (2**20)),
    r_433_450 - s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 + s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 - s_433_450 <=s (const 64 (2**20)),
    u_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_433_450 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_449_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_16,
sint64 g_413_low60_20_low20_16,
sint64 f_413_low60_20_low20_17,
sint64 g_413_low60_20_low20_17,
sint64 u_433_449,
sint64 v_433_449,
sint64 r_433_449,
sint64 s_433_449,
sint64 u_433_450,
sint64 v_433_450,
sint64 r_433_450,
sint64 s_433_450,
bit ne
)={
    u_433_449 * f_413_low60_20_low20_0 + v_433_449 * g_413_low60_20_low20_0 = f_413_low60_20_low20_16 * (-(2**20)),
    r_433_449 * f_413_low60_20_low20_0 + s_433_449 * g_413_low60_20_low20_0 = g_413_low60_20_low20_16 * (-(2**20))
&&
    u_433_449 * f_413_low60_20_low20_0 + v_433_449 * g_413_low60_20_low20_0 = f_413_low60_20_low20_16 * (const 64 (-(2**20))),
    r_433_449 * f_413_low60_20_low20_0 + s_433_449 * g_413_low60_20_low20_0 = g_413_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_16 + u_433_449 * (const 64 (2**21)) + v_433_449 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_16 + r_433_449 * (const 64 (2**21)) + s_433_449 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_16,
    f_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_16,
    g_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 449)) <=s delta, delta <=s (const 64 (1 + 2*449)),
    (const 64 (-(2**20))) <=s u_433_449, u_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_449, v_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_449, r_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_449, s_433_449 <=s (const 64 ((2**20)-1)),
    u_433_449 + v_433_449 <=s (const 64 (2**20)),
    u_433_449 - v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 + v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 - v_433_449 <=s (const 64 (2**20)),
    r_433_449 + s_433_449 <=s (const 64 (2**20)),
    r_433_449 - s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 + s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 - s_433_449 <=s (const 64 (2**20)),
    u_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_433_449 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step449

// premise b
assume
g_413_low60_20_low20_16 = 1 (mod 2)
&&
g_413_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_17 f_413_low60_20_low20_16;
mov u_433_450 u_433_449;
mov v_433_450 v_433_449;

add g_413_low60_20_low20_17 g_413_low60_20_low20_16 f_413_low60_20_low20_16;
asr g_413_low60_20_low20_17 g_413_low60_20_low20_17 1;
add r_433_450 r_433_449 u_433_449;
asr r_433_450 r_433_450 1;
add s_433_450 s_433_449 v_433_449;
asr s_433_450 s_433_450 1;
assert
    true
&&
    f_413_low60_20_low20_17 = f_413_low60_20_low20_16,
    u_433_450 = u_433_449,
    v_433_450 = v_433_449,
    g_413_low60_20_low20_17 * (const 64 2) = g_413_low60_20_low20_16 + f_413_low60_20_low20_16,
    r_433_450 * (const 64 2) = r_433_449 + u_433_449,
    s_433_450 * (const 64 2) = s_433_449 + v_433_449
;

assume
    f_413_low60_20_low20_17 = f_413_low60_20_low20_16,
    u_433_450 = u_433_449,
    v_433_450 = v_433_449,
    g_413_low60_20_low20_17 * 2 = g_413_low60_20_low20_16 + f_413_low60_20_low20_16,
    r_433_450 * 2 = r_433_449 + u_433_449,
    s_433_450 * 2 = s_433_449 + v_433_449
&&
    true
;

{
    u_433_450 * f_413_low60_20_low20_0 + v_433_450 * g_413_low60_20_low20_0 = f_413_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_450 * f_413_low60_20_low20_0 + s_433_450 * g_413_low60_20_low20_0 = g_413_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_17 + u_433_450 * (const 64 (2**21)) + v_433_450 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_17 + r_433_450 * (const 64 (2**21)) + s_433_450 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_17,
    f_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_17,
    g_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 450)) <=s delta, delta <=s (const 64 (1 + 2*450)),
    (const 64 (-(2**20))) <=s u_433_450, u_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_450, v_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_450, r_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_450, s_433_450 <=s (const 64 ((2**20)-1)),
    u_433_450 + v_433_450 <=s (const 64 (2**20)),
    u_433_450 - v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 + v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 - v_433_450 <=s (const 64 (2**20)),
    r_433_450 + s_433_450 <=s (const 64 (2**20)),
    r_433_450 - s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 + s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 - s_433_450 <=s (const 64 (2**20)),
    u_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_433_450 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_449_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_16,
sint64 g_413_low60_20_low20_16,
sint64 f_413_low60_20_low20_17,
sint64 g_413_low60_20_low20_17,
sint64 u_433_449,
sint64 v_433_449,
sint64 r_433_449,
sint64 s_433_449,
sint64 u_433_450,
sint64 v_433_450,
sint64 r_433_450,
sint64 s_433_450,
bit ne
)={
    u_433_449 * f_413_low60_20_low20_0 + v_433_449 * g_413_low60_20_low20_0 = f_413_low60_20_low20_16 * (-(2**20)),
    r_433_449 * f_413_low60_20_low20_0 + s_433_449 * g_413_low60_20_low20_0 = g_413_low60_20_low20_16 * (-(2**20))
&&
    u_433_449 * f_413_low60_20_low20_0 + v_433_449 * g_413_low60_20_low20_0 = f_413_low60_20_low20_16 * (const 64 (-(2**20))),
    r_433_449 * f_413_low60_20_low20_0 + s_433_449 * g_413_low60_20_low20_0 = g_413_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_16 + u_433_449 * (const 64 (2**21)) + v_433_449 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_16 + r_433_449 * (const 64 (2**21)) + s_433_449 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_16,
    f_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_16,
    g_413_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 449)) <=s delta, delta <=s (const 64 (1 + 2*449)),
    (const 64 (-(2**20))) <=s u_433_449, u_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_449, v_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_449, r_433_449 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_449, s_433_449 <=s (const 64 ((2**20)-1)),
    u_433_449 + v_433_449 <=s (const 64 (2**20)),
    u_433_449 - v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 + v_433_449 <=s (const 64 (2**20)),
    (const 64 0) - u_433_449 - v_433_449 <=s (const 64 (2**20)),
    r_433_449 + s_433_449 <=s (const 64 (2**20)),
    r_433_449 - s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 + s_433_449 <=s (const 64 (2**20)),
    (const 64 0) - r_433_449 - s_433_449 <=s (const 64 (2**20)),
    u_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_433_449 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_433_449 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step449

// premise c
assume
g_413_low60_20_low20_16 = 1 (mod 2)
&&
g_413_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_17 g_413_low60_20_low20_16;
mov u_433_450 r_433_449;
mov v_433_450 s_433_449;

subs dc g_413_low60_20_low20_17 g_413_low60_20_low20_16 f_413_low60_20_low20_16;
asr g_413_low60_20_low20_17 g_413_low60_20_low20_17 1;
subs dc r_433_450 r_433_449 u_433_449;
asr r_433_450 r_433_450 1;
subs dc s_433_450 s_433_449 v_433_449;
asr s_433_450 s_433_450 1;
assert
    true
&&
    f_413_low60_20_low20_17 = g_413_low60_20_low20_16,
    u_433_450 = r_433_449,
    v_433_450 = s_433_449,
    g_413_low60_20_low20_17 * (const 64 2) = g_413_low60_20_low20_16 - f_413_low60_20_low20_16,
    r_433_450 * (const 64 2) = r_433_449 - u_433_449,
    s_433_450 * (const 64 2) = s_433_449 - v_433_449
;

assume
    f_413_low60_20_low20_17 = g_413_low60_20_low20_16,
    u_433_450 = r_433_449,
    v_433_450 = s_433_449,
    g_413_low60_20_low20_17 * 2 = g_413_low60_20_low20_16 - f_413_low60_20_low20_16,
    r_433_450 * 2 = r_433_449 - u_433_449,
    s_433_450 * 2 = s_433_449 - v_433_449
&&
    true
;

{
    u_433_450 * f_413_low60_20_low20_0 + v_433_450 * g_413_low60_20_low20_0 = f_413_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_450 * f_413_low60_20_low20_0 + s_433_450 * g_413_low60_20_low20_0 = g_413_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_17 + u_433_450 * (const 64 (2**21)) + v_433_450 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_17 + r_433_450 * (const 64 (2**21)) + s_433_450 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_17,
    f_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_17,
    g_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 450)) <=s delta, delta <=s (const 64 (1 + 2*450)),
    (const 64 (-(2**20))) <=s u_433_450, u_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_450, v_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_450, r_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_450, s_433_450 <=s (const 64 ((2**20)-1)),
    u_433_450 + v_433_450 <=s (const 64 (2**20)),
    u_433_450 - v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 + v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 - v_433_450 <=s (const 64 (2**20)),
    r_433_450 + s_433_450 <=s (const 64 (2**20)),
    r_433_450 - s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 + s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 - s_433_450 <=s (const 64 (2**20)),
    u_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_433_450 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_450_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_17,
sint64 g_413_low60_20_low20_17,
sint64 f_413_low60_20_low20_18,
sint64 g_413_low60_20_low20_18,
sint64 u_433_450,
sint64 v_433_450,
sint64 r_433_450,
sint64 s_433_450,
sint64 u_433_451,
sint64 v_433_451,
sint64 r_433_451,
sint64 s_433_451,
bit ne
)={
    u_433_450 * f_413_low60_20_low20_0 + v_433_450 * g_413_low60_20_low20_0 = f_413_low60_20_low20_17 * (-(2**20)),
    r_433_450 * f_413_low60_20_low20_0 + s_433_450 * g_413_low60_20_low20_0 = g_413_low60_20_low20_17 * (-(2**20))
&&
    u_433_450 * f_413_low60_20_low20_0 + v_433_450 * g_413_low60_20_low20_0 = f_413_low60_20_low20_17 * (const 64 (-(2**20))),
    r_433_450 * f_413_low60_20_low20_0 + s_433_450 * g_413_low60_20_low20_0 = g_413_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_17 + u_433_450 * (const 64 (2**21)) + v_433_450 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_17 + r_433_450 * (const 64 (2**21)) + s_433_450 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_17,
    f_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_17,
    g_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 450)) <=s delta, delta <=s (const 64 (1 + 2*450)),
    (const 64 (-(2**20))) <=s u_433_450, u_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_450, v_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_450, r_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_450, s_433_450 <=s (const 64 ((2**20)-1)),
    u_433_450 + v_433_450 <=s (const 64 (2**20)),
    u_433_450 - v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 + v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 - v_433_450 <=s (const 64 (2**20)),
    r_433_450 + s_433_450 <=s (const 64 (2**20)),
    r_433_450 - s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 + s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 - s_433_450 <=s (const 64 (2**20)),
    u_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_433_450 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step450

// premise a
assume
g_413_low60_20_low20_17 = 0 (mod 2)
&&
g_413_low60_20_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_18 f_413_low60_20_low20_17;
mov u_433_451 u_433_450;
mov v_433_451 v_433_450;

asr g_413_low60_20_low20_18 g_413_low60_20_low20_17 1;
asr r_433_451 r_433_450 1;
asr s_433_451 s_433_450 1;
assert
    true
&&
    f_413_low60_20_low20_18 = f_413_low60_20_low20_17,
    u_433_451 = u_433_450,
    v_433_451 = v_433_450,
    g_413_low60_20_low20_18 * (const 64 2) = g_413_low60_20_low20_17,
    r_433_451 * (const 64 2) = r_433_450,
    s_433_451 * (const 64 2) = s_433_450
;

assume
    f_413_low60_20_low20_18 = f_413_low60_20_low20_17,
    u_433_451 = u_433_450,
    v_433_451 = v_433_450,
    g_413_low60_20_low20_18 * 2 = g_413_low60_20_low20_17,
    r_433_451 * 2 = r_433_450,
    s_433_451 * 2 = s_433_450
&&
    true
;

{
    u_433_451 * f_413_low60_20_low20_0 + v_433_451 * g_413_low60_20_low20_0 = f_413_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_451 * f_413_low60_20_low20_0 + s_433_451 * g_413_low60_20_low20_0 = g_413_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_18 + u_433_451 * (const 64 (2**21)) + v_433_451 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_18 + r_433_451 * (const 64 (2**21)) + s_433_451 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_18,
    f_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_18,
    g_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 451)) <=s delta, delta <=s (const 64 (1 + 2*451)),
    (const 64 (-(2**20))) <=s u_433_451, u_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_451, v_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_451, r_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_451, s_433_451 <=s (const 64 ((2**20)-1)),
    u_433_451 + v_433_451 <=s (const 64 (2**20)),
    u_433_451 - v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 + v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 - v_433_451 <=s (const 64 (2**20)),
    r_433_451 + s_433_451 <=s (const 64 (2**20)),
    r_433_451 - s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 + s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 - s_433_451 <=s (const 64 (2**20)),
    u_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_433_451 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_450_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_17,
sint64 g_413_low60_20_low20_17,
sint64 f_413_low60_20_low20_18,
sint64 g_413_low60_20_low20_18,
sint64 u_433_450,
sint64 v_433_450,
sint64 r_433_450,
sint64 s_433_450,
sint64 u_433_451,
sint64 v_433_451,
sint64 r_433_451,
sint64 s_433_451,
bit ne
)={
    u_433_450 * f_413_low60_20_low20_0 + v_433_450 * g_413_low60_20_low20_0 = f_413_low60_20_low20_17 * (-(2**20)),
    r_433_450 * f_413_low60_20_low20_0 + s_433_450 * g_413_low60_20_low20_0 = g_413_low60_20_low20_17 * (-(2**20))
&&
    u_433_450 * f_413_low60_20_low20_0 + v_433_450 * g_413_low60_20_low20_0 = f_413_low60_20_low20_17 * (const 64 (-(2**20))),
    r_433_450 * f_413_low60_20_low20_0 + s_433_450 * g_413_low60_20_low20_0 = g_413_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_17 + u_433_450 * (const 64 (2**21)) + v_433_450 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_17 + r_433_450 * (const 64 (2**21)) + s_433_450 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_17,
    f_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_17,
    g_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 450)) <=s delta, delta <=s (const 64 (1 + 2*450)),
    (const 64 (-(2**20))) <=s u_433_450, u_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_450, v_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_450, r_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_450, s_433_450 <=s (const 64 ((2**20)-1)),
    u_433_450 + v_433_450 <=s (const 64 (2**20)),
    u_433_450 - v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 + v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 - v_433_450 <=s (const 64 (2**20)),
    r_433_450 + s_433_450 <=s (const 64 (2**20)),
    r_433_450 - s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 + s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 - s_433_450 <=s (const 64 (2**20)),
    u_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_433_450 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step450

// premise b
assume
g_413_low60_20_low20_17 = 1 (mod 2)
&&
g_413_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_18 f_413_low60_20_low20_17;
mov u_433_451 u_433_450;
mov v_433_451 v_433_450;

add g_413_low60_20_low20_18 g_413_low60_20_low20_17 f_413_low60_20_low20_17;
asr g_413_low60_20_low20_18 g_413_low60_20_low20_18 1;
add r_433_451 r_433_450 u_433_450;
asr r_433_451 r_433_451 1;
add s_433_451 s_433_450 v_433_450;
asr s_433_451 s_433_451 1;
assert
    true
&&
    f_413_low60_20_low20_18 = f_413_low60_20_low20_17,
    u_433_451 = u_433_450,
    v_433_451 = v_433_450,
    g_413_low60_20_low20_18 * (const 64 2) = g_413_low60_20_low20_17 + f_413_low60_20_low20_17,
    r_433_451 * (const 64 2) = r_433_450 + u_433_450,
    s_433_451 * (const 64 2) = s_433_450 + v_433_450
;

assume
    f_413_low60_20_low20_18 = f_413_low60_20_low20_17,
    u_433_451 = u_433_450,
    v_433_451 = v_433_450,
    g_413_low60_20_low20_18 * 2 = g_413_low60_20_low20_17 + f_413_low60_20_low20_17,
    r_433_451 * 2 = r_433_450 + u_433_450,
    s_433_451 * 2 = s_433_450 + v_433_450
&&
    true
;

{
    u_433_451 * f_413_low60_20_low20_0 + v_433_451 * g_413_low60_20_low20_0 = f_413_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_451 * f_413_low60_20_low20_0 + s_433_451 * g_413_low60_20_low20_0 = g_413_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_18 + u_433_451 * (const 64 (2**21)) + v_433_451 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_18 + r_433_451 * (const 64 (2**21)) + s_433_451 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_18,
    f_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_18,
    g_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 451)) <=s delta, delta <=s (const 64 (1 + 2*451)),
    (const 64 (-(2**20))) <=s u_433_451, u_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_451, v_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_451, r_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_451, s_433_451 <=s (const 64 ((2**20)-1)),
    u_433_451 + v_433_451 <=s (const 64 (2**20)),
    u_433_451 - v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 + v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 - v_433_451 <=s (const 64 (2**20)),
    r_433_451 + s_433_451 <=s (const 64 (2**20)),
    r_433_451 - s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 + s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 - s_433_451 <=s (const 64 (2**20)),
    u_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_433_451 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_450_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_17,
sint64 g_413_low60_20_low20_17,
sint64 f_413_low60_20_low20_18,
sint64 g_413_low60_20_low20_18,
sint64 u_433_450,
sint64 v_433_450,
sint64 r_433_450,
sint64 s_433_450,
sint64 u_433_451,
sint64 v_433_451,
sint64 r_433_451,
sint64 s_433_451,
bit ne
)={
    u_433_450 * f_413_low60_20_low20_0 + v_433_450 * g_413_low60_20_low20_0 = f_413_low60_20_low20_17 * (-(2**20)),
    r_433_450 * f_413_low60_20_low20_0 + s_433_450 * g_413_low60_20_low20_0 = g_413_low60_20_low20_17 * (-(2**20))
&&
    u_433_450 * f_413_low60_20_low20_0 + v_433_450 * g_413_low60_20_low20_0 = f_413_low60_20_low20_17 * (const 64 (-(2**20))),
    r_433_450 * f_413_low60_20_low20_0 + s_433_450 * g_413_low60_20_low20_0 = g_413_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_17 + u_433_450 * (const 64 (2**21)) + v_433_450 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_17 + r_433_450 * (const 64 (2**21)) + s_433_450 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_17,
    f_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_17,
    g_413_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 450)) <=s delta, delta <=s (const 64 (1 + 2*450)),
    (const 64 (-(2**20))) <=s u_433_450, u_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_450, v_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_450, r_433_450 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_450, s_433_450 <=s (const 64 ((2**20)-1)),
    u_433_450 + v_433_450 <=s (const 64 (2**20)),
    u_433_450 - v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 + v_433_450 <=s (const 64 (2**20)),
    (const 64 0) - u_433_450 - v_433_450 <=s (const 64 (2**20)),
    r_433_450 + s_433_450 <=s (const 64 (2**20)),
    r_433_450 - s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 + s_433_450 <=s (const 64 (2**20)),
    (const 64 0) - r_433_450 - s_433_450 <=s (const 64 (2**20)),
    u_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_433_450 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_433_450 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step450

// premise c
assume
g_413_low60_20_low20_17 = 1 (mod 2)
&&
g_413_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_18 g_413_low60_20_low20_17;
mov u_433_451 r_433_450;
mov v_433_451 s_433_450;

subs dc g_413_low60_20_low20_18 g_413_low60_20_low20_17 f_413_low60_20_low20_17;
asr g_413_low60_20_low20_18 g_413_low60_20_low20_18 1;
subs dc r_433_451 r_433_450 u_433_450;
asr r_433_451 r_433_451 1;
subs dc s_433_451 s_433_450 v_433_450;
asr s_433_451 s_433_451 1;
assert
    true
&&
    f_413_low60_20_low20_18 = g_413_low60_20_low20_17,
    u_433_451 = r_433_450,
    v_433_451 = s_433_450,
    g_413_low60_20_low20_18 * (const 64 2) = g_413_low60_20_low20_17 - f_413_low60_20_low20_17,
    r_433_451 * (const 64 2) = r_433_450 - u_433_450,
    s_433_451 * (const 64 2) = s_433_450 - v_433_450
;

assume
    f_413_low60_20_low20_18 = g_413_low60_20_low20_17,
    u_433_451 = r_433_450,
    v_433_451 = s_433_450,
    g_413_low60_20_low20_18 * 2 = g_413_low60_20_low20_17 - f_413_low60_20_low20_17,
    r_433_451 * 2 = r_433_450 - u_433_450,
    s_433_451 * 2 = s_433_450 - v_433_450
&&
    true
;

{
    u_433_451 * f_413_low60_20_low20_0 + v_433_451 * g_413_low60_20_low20_0 = f_413_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_451 * f_413_low60_20_low20_0 + s_433_451 * g_413_low60_20_low20_0 = g_413_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_18 + u_433_451 * (const 64 (2**21)) + v_433_451 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_18 + r_433_451 * (const 64 (2**21)) + s_433_451 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_18,
    f_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_18,
    g_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 451)) <=s delta, delta <=s (const 64 (1 + 2*451)),
    (const 64 (-(2**20))) <=s u_433_451, u_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_451, v_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_451, r_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_451, s_433_451 <=s (const 64 ((2**20)-1)),
    u_433_451 + v_433_451 <=s (const 64 (2**20)),
    u_433_451 - v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 + v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 - v_433_451 <=s (const 64 (2**20)),
    r_433_451 + s_433_451 <=s (const 64 (2**20)),
    r_433_451 - s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 + s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 - s_433_451 <=s (const 64 (2**20)),
    u_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_433_451 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_451_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_18,
sint64 g_413_low60_20_low20_18,
sint64 f_413_low60_20_low20_19,
sint64 g_413_low60_20_low20_19,
sint64 u_433_451,
sint64 v_433_451,
sint64 r_433_451,
sint64 s_433_451,
sint64 u_433_452,
sint64 v_433_452,
sint64 r_433_452,
sint64 s_433_452,
bit ne
)={
    u_433_451 * f_413_low60_20_low20_0 + v_433_451 * g_413_low60_20_low20_0 = f_413_low60_20_low20_18 * (-(2**20)),
    r_433_451 * f_413_low60_20_low20_0 + s_433_451 * g_413_low60_20_low20_0 = g_413_low60_20_low20_18 * (-(2**20))
&&
    u_433_451 * f_413_low60_20_low20_0 + v_433_451 * g_413_low60_20_low20_0 = f_413_low60_20_low20_18 * (const 64 (-(2**20))),
    r_433_451 * f_413_low60_20_low20_0 + s_433_451 * g_413_low60_20_low20_0 = g_413_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_18 + u_433_451 * (const 64 (2**21)) + v_433_451 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_18 + r_433_451 * (const 64 (2**21)) + s_433_451 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_18,
    f_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_18,
    g_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 451)) <=s delta, delta <=s (const 64 (1 + 2*451)),
    (const 64 (-(2**20))) <=s u_433_451, u_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_451, v_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_451, r_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_451, s_433_451 <=s (const 64 ((2**20)-1)),
    u_433_451 + v_433_451 <=s (const 64 (2**20)),
    u_433_451 - v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 + v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 - v_433_451 <=s (const 64 (2**20)),
    r_433_451 + s_433_451 <=s (const 64 (2**20)),
    r_433_451 - s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 + s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 - s_433_451 <=s (const 64 (2**20)),
    u_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_433_451 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step451

// premise a
assume
g_413_low60_20_low20_18 = 0 (mod 2)
&&
g_413_low60_20_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_413_low60_20_low20_19 f_413_low60_20_low20_18;
mov u_433_452 u_433_451;
mov v_433_452 v_433_451;

asr g_413_low60_20_low20_19 g_413_low60_20_low20_18 1;
asr r_433_452 r_433_451 1;
asr s_433_452 s_433_451 1;
assert
    true
&&
    f_413_low60_20_low20_19 = f_413_low60_20_low20_18,
    u_433_452 = u_433_451,
    v_433_452 = v_433_451,
    g_413_low60_20_low20_19 * (const 64 2) = g_413_low60_20_low20_18,
    r_433_452 * (const 64 2) = r_433_451,
    s_433_452 * (const 64 2) = s_433_451
;

assume
    f_413_low60_20_low20_19 = f_413_low60_20_low20_18,
    u_433_452 = u_433_451,
    v_433_452 = v_433_451,
    g_413_low60_20_low20_19 * 2 = g_413_low60_20_low20_18,
    r_433_452 * 2 = r_433_451,
    s_433_452 * 2 = s_433_451
&&
    true
;

{
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_19 + u_433_452 * (const 64 (2**21)) + v_433_452 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_19 + r_433_452 * (const 64 (2**21)) + s_433_452 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_19,
    f_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_19,
    g_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 452)) <=s delta, delta <=s (const 64 (1 + 2*452)),
    (const 64 (-(2**20))) <=s u_433_452, u_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_452, v_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_452, r_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_452, s_433_452 <=s (const 64 ((2**20)-1)),
    u_433_452 + v_433_452 <=s (const 64 (2**20)),
    u_433_452 - v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 + v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 - v_433_452 <=s (const 64 (2**20)),
    r_433_452 + s_433_452 <=s (const 64 (2**20)),
    r_433_452 - s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 + s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 - s_433_452 <=s (const 64 (2**20)),
    u_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_433_452 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_451_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_18,
sint64 g_413_low60_20_low20_18,
sint64 f_413_low60_20_low20_19,
sint64 g_413_low60_20_low20_19,
sint64 u_433_451,
sint64 v_433_451,
sint64 r_433_451,
sint64 s_433_451,
sint64 u_433_452,
sint64 v_433_452,
sint64 r_433_452,
sint64 s_433_452,
bit ne
)={
    u_433_451 * f_413_low60_20_low20_0 + v_433_451 * g_413_low60_20_low20_0 = f_413_low60_20_low20_18 * (-(2**20)),
    r_433_451 * f_413_low60_20_low20_0 + s_433_451 * g_413_low60_20_low20_0 = g_413_low60_20_low20_18 * (-(2**20))
&&
    u_433_451 * f_413_low60_20_low20_0 + v_433_451 * g_413_low60_20_low20_0 = f_413_low60_20_low20_18 * (const 64 (-(2**20))),
    r_433_451 * f_413_low60_20_low20_0 + s_433_451 * g_413_low60_20_low20_0 = g_413_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_18 + u_433_451 * (const 64 (2**21)) + v_433_451 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_18 + r_433_451 * (const 64 (2**21)) + s_433_451 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_18,
    f_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_18,
    g_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 451)) <=s delta, delta <=s (const 64 (1 + 2*451)),
    (const 64 (-(2**20))) <=s u_433_451, u_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_451, v_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_451, r_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_451, s_433_451 <=s (const 64 ((2**20)-1)),
    u_433_451 + v_433_451 <=s (const 64 (2**20)),
    u_433_451 - v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 + v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 - v_433_451 <=s (const 64 (2**20)),
    r_433_451 + s_433_451 <=s (const 64 (2**20)),
    r_433_451 - s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 + s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 - s_433_451 <=s (const 64 (2**20)),
    u_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_433_451 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step451

// premise b
assume
g_413_low60_20_low20_18 = 1 (mod 2)
&&
g_413_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_19 f_413_low60_20_low20_18;
mov u_433_452 u_433_451;
mov v_433_452 v_433_451;

add g_413_low60_20_low20_19 g_413_low60_20_low20_18 f_413_low60_20_low20_18;
asr g_413_low60_20_low20_19 g_413_low60_20_low20_19 1;
add r_433_452 r_433_451 u_433_451;
asr r_433_452 r_433_452 1;
add s_433_452 s_433_451 v_433_451;
asr s_433_452 s_433_452 1;
assert
    true
&&
    f_413_low60_20_low20_19 = f_413_low60_20_low20_18,
    u_433_452 = u_433_451,
    v_433_452 = v_433_451,
    g_413_low60_20_low20_19 * (const 64 2) = g_413_low60_20_low20_18 + f_413_low60_20_low20_18,
    r_433_452 * (const 64 2) = r_433_451 + u_433_451,
    s_433_452 * (const 64 2) = s_433_451 + v_433_451
;

assume
    f_413_low60_20_low20_19 = f_413_low60_20_low20_18,
    u_433_452 = u_433_451,
    v_433_452 = v_433_451,
    g_413_low60_20_low20_19 * 2 = g_413_low60_20_low20_18 + f_413_low60_20_low20_18,
    r_433_452 * 2 = r_433_451 + u_433_451,
    s_433_452 * 2 = s_433_451 + v_433_451
&&
    true
;

{
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_19 + u_433_452 * (const 64 (2**21)) + v_433_452 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_19 + r_433_452 * (const 64 (2**21)) + s_433_452 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_19,
    f_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_19,
    g_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 452)) <=s delta, delta <=s (const 64 (1 + 2*452)),
    (const 64 (-(2**20))) <=s u_433_452, u_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_452, v_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_452, r_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_452, s_433_452 <=s (const 64 ((2**20)-1)),
    u_433_452 + v_433_452 <=s (const 64 (2**20)),
    u_433_452 - v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 + v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 - v_433_452 <=s (const 64 (2**20)),
    r_433_452 + s_433_452 <=s (const 64 (2**20)),
    r_433_452 - s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 + s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 - s_433_452 <=s (const 64 (2**20)),
    u_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_433_452 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_451_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_18,
sint64 g_413_low60_20_low20_18,
sint64 f_413_low60_20_low20_19,
sint64 g_413_low60_20_low20_19,
sint64 u_433_451,
sint64 v_433_451,
sint64 r_433_451,
sint64 s_433_451,
sint64 u_433_452,
sint64 v_433_452,
sint64 r_433_452,
sint64 s_433_452,
bit ne
)={
    u_433_451 * f_413_low60_20_low20_0 + v_433_451 * g_413_low60_20_low20_0 = f_413_low60_20_low20_18 * (-(2**20)),
    r_433_451 * f_413_low60_20_low20_0 + s_433_451 * g_413_low60_20_low20_0 = g_413_low60_20_low20_18 * (-(2**20))
&&
    u_433_451 * f_413_low60_20_low20_0 + v_433_451 * g_413_low60_20_low20_0 = f_413_low60_20_low20_18 * (const 64 (-(2**20))),
    r_433_451 * f_413_low60_20_low20_0 + s_433_451 * g_413_low60_20_low20_0 = g_413_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_18 + u_433_451 * (const 64 (2**21)) + v_433_451 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_18 + r_433_451 * (const 64 (2**21)) + s_433_451 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_18,
    f_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_18,
    g_413_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 451)) <=s delta, delta <=s (const 64 (1 + 2*451)),
    (const 64 (-(2**20))) <=s u_433_451, u_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_451, v_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_451, r_433_451 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_451, s_433_451 <=s (const 64 ((2**20)-1)),
    u_433_451 + v_433_451 <=s (const 64 (2**20)),
    u_433_451 - v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 + v_433_451 <=s (const 64 (2**20)),
    (const 64 0) - u_433_451 - v_433_451 <=s (const 64 (2**20)),
    r_433_451 + s_433_451 <=s (const 64 (2**20)),
    r_433_451 - s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 + s_433_451 <=s (const 64 (2**20)),
    (const 64 0) - r_433_451 - s_433_451 <=s (const 64 (2**20)),
    u_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_433_451 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_433_451 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step451

// premise c
assume
g_413_low60_20_low20_18 = 1 (mod 2)
&&
g_413_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_19 g_413_low60_20_low20_18;
mov u_433_452 r_433_451;
mov v_433_452 s_433_451;

subs dc g_413_low60_20_low20_19 g_413_low60_20_low20_18 f_413_low60_20_low20_18;
asr g_413_low60_20_low20_19 g_413_low60_20_low20_19 1;
subs dc r_433_452 r_433_451 u_433_451;
asr r_433_452 r_433_452 1;
subs dc s_433_452 s_433_451 v_433_451;
asr s_433_452 s_433_452 1;
assert
    true
&&
    f_413_low60_20_low20_19 = g_413_low60_20_low20_18,
    u_433_452 = r_433_451,
    v_433_452 = s_433_451,
    g_413_low60_20_low20_19 * (const 64 2) = g_413_low60_20_low20_18 - f_413_low60_20_low20_18,
    r_433_452 * (const 64 2) = r_433_451 - u_433_451,
    s_433_452 * (const 64 2) = s_433_451 - v_433_451
;

assume
    f_413_low60_20_low20_19 = g_413_low60_20_low20_18,
    u_433_452 = r_433_451,
    v_433_452 = s_433_451,
    g_413_low60_20_low20_19 * 2 = g_413_low60_20_low20_18 - f_413_low60_20_low20_18,
    r_433_452 * 2 = r_433_451 - u_433_451,
    s_433_452 * 2 = s_433_451 - v_433_451
&&
    true
;

{
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_19 + u_433_452 * (const 64 (2**21)) + v_433_452 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_19 + r_433_452 * (const 64 (2**21)) + s_433_452 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_19,
    f_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_19,
    g_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 452)) <=s delta, delta <=s (const 64 (1 + 2*452)),
    (const 64 (-(2**20))) <=s u_433_452, u_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_452, v_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_452, r_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_452, s_433_452 <=s (const 64 ((2**20)-1)),
    u_433_452 + v_433_452 <=s (const 64 (2**20)),
    u_433_452 - v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 + v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 - v_433_452 <=s (const 64 (2**20)),
    r_433_452 + s_433_452 <=s (const 64 (2**20)),
    r_433_452 - s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 + s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 - s_433_452 <=s (const 64 (2**20)),
    u_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_433_452 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_452_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_19,
sint64 g_413_low60_20_low20_19,
sint64 f_413_low60_20_low20_20,
sint64 g_413_low60_20_low20_20,
sint64 u_433_452,
sint64 v_433_452,
sint64 r_433_452,
sint64 s_433_452,
sint64 u_433_453,
sint64 v_433_453,
sint64 r_433_453,
sint64 s_433_453,
bit ne
)={
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (-(2**20)),
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (-(2**20))
&&
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (const 64 (-(2**20))),
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_19 + u_433_452 * (const 64 (2**21)) + v_433_452 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_19 + r_433_452 * (const 64 (2**21)) + s_433_452 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_19,
    f_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_19,
    g_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 452)) <=s delta, delta <=s (const 64 (1 + 2*452)),
    (const 64 (-(2**20))) <=s u_433_452, u_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_452, v_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_452, r_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_452, s_433_452 <=s (const 64 ((2**20)-1)),
    u_433_452 + v_433_452 <=s (const 64 (2**20)),
    u_433_452 - v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 + v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 - v_433_452 <=s (const 64 (2**20)),
    r_433_452 + s_433_452 <=s (const 64 (2**20)),
    r_433_452 - s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 + s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 - s_433_452 <=s (const 64 (2**20)),
    u_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_433_452 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step452

// premise a
assume
g_413_low60_20_low20_19 = 0 (mod 2)
&&
g_413_low60_20_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov f_413_low60_20_low20_20 f_413_low60_20_low20_19;
mov u_433_453 u_433_452;
mov v_433_453 v_433_452;

asr g_413_low60_20_low20_20 g_413_low60_20_low20_19 1;
asr r_433_453 r_433_452 1;
asr s_433_453 s_433_452 1;
assert
    true
&&
    f_413_low60_20_low20_20 = f_413_low60_20_low20_19,
    u_433_453 = u_433_452,
    v_433_453 = v_433_452,
    g_413_low60_20_low20_20 * (const 64 2) = g_413_low60_20_low20_19,
    r_433_453 * (const 64 2) = r_433_452,
    s_433_453 * (const 64 2) = s_433_452
;

assume
    f_413_low60_20_low20_20 = f_413_low60_20_low20_19,
    u_433_453 = u_433_452,
    v_433_453 = v_433_452,
    g_413_low60_20_low20_20 * 2 = g_413_low60_20_low20_19,
    r_433_453 * 2 = r_433_452,
    s_433_453 * 2 = s_433_452
&&
    true
;

{
    u_433_453 * f_413_low60_20_low20_0 + v_433_453 * g_413_low60_20_low20_0 = f_413_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_453 * f_413_low60_20_low20_0 + s_433_453 * g_413_low60_20_low20_0 = g_413_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_20 + u_433_453 * (const 64 (2**21)) + v_433_453 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_20 + r_433_453 * (const 64 (2**21)) + s_433_453 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_20,
    f_413_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_20,
    g_413_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 453)) <=s delta, delta <=s (const 64 (1 + 2*453)),
    (const 64 (-(2**20))) <=s u_433_453, u_433_453 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_453, v_433_453 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_453, r_433_453 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_453, s_433_453 <=s (const 64 ((2**20)-1)),
    u_433_453 + v_433_453 <=s (const 64 (2**20)),
    u_433_453 - v_433_453 <=s (const 64 (2**20)),
    (const 64 0) - u_433_453 + v_433_453 <=s (const 64 (2**20)),
    (const 64 0) - u_433_453 - v_433_453 <=s (const 64 (2**20)),
    r_433_453 + s_433_453 <=s (const 64 (2**20)),
    r_433_453 - s_433_453 <=s (const 64 (2**20)),
    (const 64 0) - r_433_453 + s_433_453 <=s (const 64 (2**20)),
    (const 64 0) - r_433_453 - s_433_453 <=s (const 64 (2**20)),
    u_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_433_453 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_452_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_19,
sint64 g_413_low60_20_low20_19,
sint64 f_413_low60_20_low20_20,
sint64 g_413_low60_20_low20_20,
sint64 u_433_452,
sint64 v_433_452,
sint64 r_433_452,
sint64 s_433_452,
sint64 u_433_453,
sint64 v_433_453,
sint64 r_433_453,
sint64 s_433_453,
bit ne
)={
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (-(2**20)),
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (-(2**20))
&&
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (const 64 (-(2**20))),
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_19 + u_433_452 * (const 64 (2**21)) + v_433_452 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_19 + r_433_452 * (const 64 (2**21)) + s_433_452 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_19,
    f_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_19,
    g_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 452)) <=s delta, delta <=s (const 64 (1 + 2*452)),
    (const 64 (-(2**20))) <=s u_433_452, u_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_452, v_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_452, r_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_452, s_433_452 <=s (const 64 ((2**20)-1)),
    u_433_452 + v_433_452 <=s (const 64 (2**20)),
    u_433_452 - v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 + v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 - v_433_452 <=s (const 64 (2**20)),
    r_433_452 + s_433_452 <=s (const 64 (2**20)),
    r_433_452 - s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 + s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 - s_433_452 <=s (const 64 (2**20)),
    u_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_433_452 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step452

// premise b
assume
g_413_low60_20_low20_19 = 1 (mod 2)
&&
g_413_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_20 f_413_low60_20_low20_19;
mov u_433_453 u_433_452;
mov v_433_453 v_433_452;

add g_413_low60_20_low20_20 g_413_low60_20_low20_19 f_413_low60_20_low20_19;
asr g_413_low60_20_low20_20 g_413_low60_20_low20_20 1;
add r_433_453 r_433_452 u_433_452;
asr r_433_453 r_433_453 1;
add s_433_453 s_433_452 v_433_452;
asr s_433_453 s_433_453 1;
assert
    true
&&
    f_413_low60_20_low20_20 = f_413_low60_20_low20_19,
    u_433_453 = u_433_452,
    v_433_453 = v_433_452,
    g_413_low60_20_low20_20 * (const 64 2) = g_413_low60_20_low20_19 + f_413_low60_20_low20_19,
    r_433_453 * (const 64 2) = r_433_452 + u_433_452,
    s_433_453 * (const 64 2) = s_433_452 + v_433_452
;

assume
    f_413_low60_20_low20_20 = f_413_low60_20_low20_19,
    u_433_453 = u_433_452,
    v_433_453 = v_433_452,
    g_413_low60_20_low20_20 * 2 = g_413_low60_20_low20_19 + f_413_low60_20_low20_19,
    r_433_453 * 2 = r_433_452 + u_433_452,
    s_433_453 * 2 = s_433_452 + v_433_452
&&
    true
;

{
    u_433_453 * f_413_low60_20_low20_0 + v_433_453 * g_413_low60_20_low20_0 = f_413_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_453 * f_413_low60_20_low20_0 + s_433_453 * g_413_low60_20_low20_0 = g_413_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_20 + u_433_453 * (const 64 (2**21)) + v_433_453 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_20 + r_433_453 * (const 64 (2**21)) + s_433_453 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_20,
    f_413_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_20,
    g_413_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 453)) <=s delta, delta <=s (const 64 (1 + 2*453)),
    (const 64 (-(2**20))) <=s u_433_453, u_433_453 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_453, v_433_453 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_453, r_433_453 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_453, s_433_453 <=s (const 64 ((2**20)-1)),
    u_433_453 + v_433_453 <=s (const 64 (2**20)),
    u_433_453 - v_433_453 <=s (const 64 (2**20)),
    (const 64 0) - u_433_453 + v_433_453 <=s (const 64 (2**20)),
    (const 64 0) - u_433_453 - v_433_453 <=s (const 64 (2**20)),
    r_433_453 + s_433_453 <=s (const 64 (2**20)),
    r_433_453 - s_433_453 <=s (const 64 (2**20)),
    (const 64 0) - r_433_453 + s_433_453 <=s (const 64 (2**20)),
    (const 64 0) - r_433_453 - s_433_453 <=s (const 64 (2**20)),
    u_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_433_453 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_452_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_19,
sint64 g_413_low60_20_low20_19,
sint64 f_413_low60_20_low20_20,
sint64 g_413_low60_20_low20_20,
sint64 u_433_452,
sint64 v_433_452,
sint64 r_433_452,
sint64 s_433_452,
sint64 u_433_453,
sint64 v_433_453,
sint64 r_433_453,
sint64 s_433_453,
bit ne
)={
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (-(2**20)),
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (-(2**20))
&&
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (const 64 (-(2**20))),
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_19 + u_433_452 * (const 64 (2**21)) + v_433_452 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_19 + r_433_452 * (const 64 (2**21)) + s_433_452 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_19,
    f_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_19,
    g_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 452)) <=s delta, delta <=s (const 64 (1 + 2*452)),
    (const 64 (-(2**20))) <=s u_433_452, u_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_452, v_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_452, r_433_452 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_452, s_433_452 <=s (const 64 ((2**20)-1)),
    u_433_452 + v_433_452 <=s (const 64 (2**20)),
    u_433_452 - v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 + v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 - v_433_452 <=s (const 64 (2**20)),
    r_433_452 + s_433_452 <=s (const 64 (2**20)),
    r_433_452 - s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 + s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 - s_433_452 <=s (const 64 (2**20)),
    u_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_433_452 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step452

// premise c
assume
g_413_low60_20_low20_19 = 1 (mod 2)
&&
g_413_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_20 g_413_low60_20_low20_19;
mov u_433_453 r_433_452;
mov v_433_453 s_433_452;

subs dc g_413_low60_20_low20_20 g_413_low60_20_low20_19 f_413_low60_20_low20_19;
asr g_413_low60_20_low20_20 g_413_low60_20_low20_20 1;
subs dc r_433_453 r_433_452 u_433_452;
asr r_433_453 r_433_453 1;
subs dc s_433_453 s_433_452 v_433_452;
asr s_433_453 s_433_453 1;
assert
    true
&&
    f_413_low60_20_low20_20 = g_413_low60_20_low20_19,
    u_433_453 = r_433_452,
    v_433_453 = s_433_452,
    g_413_low60_20_low20_20 * (const 64 2) = g_413_low60_20_low20_19 - f_413_low60_20_low20_19,
    r_433_453 * (const 64 2) = r_433_452 - u_433_452,
    s_433_453 * (const 64 2) = s_433_452 - v_433_452
;

assume
    f_413_low60_20_low20_20 = g_413_low60_20_low20_19,
    u_433_453 = r_433_452,
    v_433_453 = s_433_452,
    g_413_low60_20_low20_20 * 2 = g_413_low60_20_low20_19 - f_413_low60_20_low20_19,
    r_433_453 * 2 = r_433_452 - u_433_452,
    s_433_453 * 2 = s_433_452 - v_433_452
&&
    true
;

{
    u_433_453 * f_413_low60_20_low20_0 + v_433_453 * g_413_low60_20_low20_0 = f_413_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_453 * f_413_low60_20_low20_0 + s_433_453 * g_413_low60_20_low20_0 = g_413_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_20 + u_433_453 * (const 64 (2**21)) + v_433_453 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_20 + r_433_453 * (const 64 (2**21)) + s_433_453 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_20,
    f_413_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_20,
    g_413_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 453)) <=s delta, delta <=s (const 64 (1 + 2*453)),
    (const 64 (-(2**20))) <=s u_433_453, u_433_453 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_433_453, v_433_453 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_433_453, r_433_453 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_433_453, s_433_453 <=s (const 64 ((2**20)-1)),
    u_433_453 + v_433_453 <=s (const 64 (2**20)),
    u_433_453 - v_433_453 <=s (const 64 (2**20)),
    (const 64 0) - u_433_453 + v_433_453 <=s (const 64 (2**20)),
    (const 64 0) - u_433_453 - v_433_453 <=s (const 64 (2**20)),
    r_433_453 + s_433_453 <=s (const 64 (2**20)),
    r_433_453 - s_433_453 <=s (const 64 (2**20)),
    (const 64 0) - r_433_453 + s_433_453 <=s (const 64 (2**20)),
    (const 64 0) - r_433_453 - s_433_453 <=s (const 64 (2**20)),
    u_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_433_453 = (const 64 0) (mod (const 64 (2**(20-20))))
}

