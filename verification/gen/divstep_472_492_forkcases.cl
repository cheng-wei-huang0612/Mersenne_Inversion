proc divstep_472_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_1,
sint64 g_472_low60_0_low20_1,
sint64 u_472_472,
sint64 v_472_472,
sint64 r_472_472,
sint64 s_472_472,
sint64 u_472_473,
sint64 v_472_473,
sint64 r_472_473,
sint64 s_472_473,
bit ne
)={
    u_472_472 * f_472_low60_0_low20_0 + v_472_472 * g_472_low60_0_low20_0 = f_472_low60_0_low20_0 * (-(2**20)),
    r_472_472 * f_472_low60_0_low20_0 + s_472_472 * g_472_low60_0_low20_0 = g_472_low60_0_low20_0 * (-(2**20))
&&
    u_472_472 * f_472_low60_0_low20_0 + v_472_472 * g_472_low60_0_low20_0 = f_472_low60_0_low20_0 * (const 64 (-(2**20))),
    r_472_472 * f_472_low60_0_low20_0 + s_472_472 * g_472_low60_0_low20_0 = g_472_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_0 + u_472_472 * (const 64 (2**21)) + v_472_472 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_0 + r_472_472 * (const 64 (2**21)) + s_472_472 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 472)) <=s delta, delta <=s (const 64 (1 + 2*472)),
    u_472_472 = (const 64 (-(2**20))),
    v_472_472 = (const 64 (0)),
    r_472_472 = (const 64 (0)),
    s_472_472 = (const 64 (-(2**20)))
}



// divsteps
// step472

// premise a
assume
g_472_low60_0_low20_0 = 0 (mod 2)
&&
g_472_low60_0_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_472_low60_0_low20_1 f_472_low60_0_low20_0;
mov u_472_473 u_472_472;
mov v_472_473 v_472_472;

asr g_472_low60_0_low20_1 g_472_low60_0_low20_0 1;
asr r_472_473 r_472_472 1;
asr s_472_473 s_472_472 1;
assert
    true
&&
    f_472_low60_0_low20_1 = f_472_low60_0_low20_0,
    u_472_473 = u_472_472,
    v_472_473 = v_472_472,
    g_472_low60_0_low20_1 * (const 64 2) = g_472_low60_0_low20_0,
    r_472_473 * (const 64 2) = r_472_472,
    s_472_473 * (const 64 2) = s_472_472
;

assume
    f_472_low60_0_low20_1 = f_472_low60_0_low20_0,
    u_472_473 = u_472_472,
    v_472_473 = v_472_472,
    g_472_low60_0_low20_1 * 2 = g_472_low60_0_low20_0,
    r_472_473 * 2 = r_472_472,
    s_472_473 * 2 = s_472_472
&&
    true
;

{
    u_472_473 * f_472_low60_0_low20_0 + v_472_473 * g_472_low60_0_low20_0 = f_472_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_473 * f_472_low60_0_low20_0 + s_472_473 * g_472_low60_0_low20_0 = g_472_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_1 + u_472_473 * (const 64 (2**21)) + v_472_473 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_1 + r_472_473 * (const 64 (2**21)) + s_472_473 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_1,
    f_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_1,
    g_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 473)) <=s delta, delta <=s (const 64 (1 + 2*473)),
    (const 64 (-(2**20))) <=s u_472_473, u_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_473, v_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_473, r_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_473, s_472_473 <=s (const 64 ((2**20))),
    u_472_473 + v_472_473 <=s (const 64 (2**20)),
    u_472_473 - v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 + v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 - v_472_473 <=s (const 64 (2**20)),
    r_472_473 + s_472_473 <=s (const 64 (2**20)),
    r_472_473 - s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 + s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 - s_472_473 <=s (const 64 (2**20)),
    u_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_472_473 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_472_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_1,
sint64 g_472_low60_0_low20_1,
sint64 u_472_472,
sint64 v_472_472,
sint64 r_472_472,
sint64 s_472_472,
sint64 u_472_473,
sint64 v_472_473,
sint64 r_472_473,
sint64 s_472_473,
bit ne
)={
    u_472_472 * f_472_low60_0_low20_0 + v_472_472 * g_472_low60_0_low20_0 = f_472_low60_0_low20_0 * (-(2**20)),
    r_472_472 * f_472_low60_0_low20_0 + s_472_472 * g_472_low60_0_low20_0 = g_472_low60_0_low20_0 * (-(2**20))
&&
    u_472_472 * f_472_low60_0_low20_0 + v_472_472 * g_472_low60_0_low20_0 = f_472_low60_0_low20_0 * (const 64 (-(2**20))),
    r_472_472 * f_472_low60_0_low20_0 + s_472_472 * g_472_low60_0_low20_0 = g_472_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_0 + u_472_472 * (const 64 (2**21)) + v_472_472 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_0 + r_472_472 * (const 64 (2**21)) + s_472_472 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 472)) <=s delta, delta <=s (const 64 (1 + 2*472)),
    u_472_472 = (const 64 (-(2**20))),
    v_472_472 = (const 64 (0)),
    r_472_472 = (const 64 (0)),
    s_472_472 = (const 64 (-(2**20)))
}



// divsteps
// step472

// premise b
assume
g_472_low60_0_low20_0 = 1 (mod 2)
&&
g_472_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_1 f_472_low60_0_low20_0;
mov u_472_473 u_472_472;
mov v_472_473 v_472_472;

add g_472_low60_0_low20_1 g_472_low60_0_low20_0 f_472_low60_0_low20_0;
asr g_472_low60_0_low20_1 g_472_low60_0_low20_1 1;
add r_472_473 r_472_472 u_472_472;
asr r_472_473 r_472_473 1;
add s_472_473 s_472_472 v_472_472;
asr s_472_473 s_472_473 1;
assert
    true
&&
    f_472_low60_0_low20_1 = f_472_low60_0_low20_0,
    u_472_473 = u_472_472,
    v_472_473 = v_472_472,
    g_472_low60_0_low20_1 * (const 64 2) = g_472_low60_0_low20_0 + f_472_low60_0_low20_0,
    r_472_473 * (const 64 2) = r_472_472 + u_472_472,
    s_472_473 * (const 64 2) = s_472_472 + v_472_472
;

assume
    f_472_low60_0_low20_1 = f_472_low60_0_low20_0,
    u_472_473 = u_472_472,
    v_472_473 = v_472_472,
    g_472_low60_0_low20_1 * 2 = g_472_low60_0_low20_0 + f_472_low60_0_low20_0,
    r_472_473 * 2 = r_472_472 + u_472_472,
    s_472_473 * 2 = s_472_472 + v_472_472
&&
    true
;

{
    u_472_473 * f_472_low60_0_low20_0 + v_472_473 * g_472_low60_0_low20_0 = f_472_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_473 * f_472_low60_0_low20_0 + s_472_473 * g_472_low60_0_low20_0 = g_472_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_1 + u_472_473 * (const 64 (2**21)) + v_472_473 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_1 + r_472_473 * (const 64 (2**21)) + s_472_473 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_1,
    f_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_1,
    g_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 473)) <=s delta, delta <=s (const 64 (1 + 2*473)),
    (const 64 (-(2**20))) <=s u_472_473, u_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_473, v_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_473, r_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_473, s_472_473 <=s (const 64 ((2**20))),
    u_472_473 + v_472_473 <=s (const 64 (2**20)),
    u_472_473 - v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 + v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 - v_472_473 <=s (const 64 (2**20)),
    r_472_473 + s_472_473 <=s (const 64 (2**20)),
    r_472_473 - s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 + s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 - s_472_473 <=s (const 64 (2**20)),
    u_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_472_473 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_472_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_1,
sint64 g_472_low60_0_low20_1,
sint64 u_472_472,
sint64 v_472_472,
sint64 r_472_472,
sint64 s_472_472,
sint64 u_472_473,
sint64 v_472_473,
sint64 r_472_473,
sint64 s_472_473,
bit ne
)={
    u_472_472 * f_472_low60_0_low20_0 + v_472_472 * g_472_low60_0_low20_0 = f_472_low60_0_low20_0 * (-(2**20)),
    r_472_472 * f_472_low60_0_low20_0 + s_472_472 * g_472_low60_0_low20_0 = g_472_low60_0_low20_0 * (-(2**20))
&&
    u_472_472 * f_472_low60_0_low20_0 + v_472_472 * g_472_low60_0_low20_0 = f_472_low60_0_low20_0 * (const 64 (-(2**20))),
    r_472_472 * f_472_low60_0_low20_0 + s_472_472 * g_472_low60_0_low20_0 = g_472_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_0 + u_472_472 * (const 64 (2**21)) + v_472_472 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_0 + r_472_472 * (const 64 (2**21)) + s_472_472 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 472)) <=s delta, delta <=s (const 64 (1 + 2*472)),
    u_472_472 = (const 64 (-(2**20))),
    v_472_472 = (const 64 (0)),
    r_472_472 = (const 64 (0)),
    s_472_472 = (const 64 (-(2**20)))
}



// divsteps
// step472

// premise c
assume
g_472_low60_0_low20_0 = 1 (mod 2)
&&
g_472_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_1 g_472_low60_0_low20_0;
mov u_472_473 r_472_472;
mov v_472_473 s_472_472;

subs dc g_472_low60_0_low20_1 g_472_low60_0_low20_0 f_472_low60_0_low20_0;
asr g_472_low60_0_low20_1 g_472_low60_0_low20_1 1;
subs dc r_472_473 r_472_472 u_472_472;
asr r_472_473 r_472_473 1;
subs dc s_472_473 s_472_472 v_472_472;
asr s_472_473 s_472_473 1;
assert
    true
&&
    f_472_low60_0_low20_1 = g_472_low60_0_low20_0,
    u_472_473 = r_472_472,
    v_472_473 = s_472_472,
    g_472_low60_0_low20_1 * (const 64 2) = g_472_low60_0_low20_0 - f_472_low60_0_low20_0,
    r_472_473 * (const 64 2) = r_472_472 - u_472_472,
    s_472_473 * (const 64 2) = s_472_472 - v_472_472
;

assume
    f_472_low60_0_low20_1 = g_472_low60_0_low20_0,
    u_472_473 = r_472_472,
    v_472_473 = s_472_472,
    g_472_low60_0_low20_1 * 2 = g_472_low60_0_low20_0 - f_472_low60_0_low20_0,
    r_472_473 * 2 = r_472_472 - u_472_472,
    s_472_473 * 2 = s_472_472 - v_472_472
&&
    true
;

{
    u_472_473 * f_472_low60_0_low20_0 + v_472_473 * g_472_low60_0_low20_0 = f_472_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_473 * f_472_low60_0_low20_0 + s_472_473 * g_472_low60_0_low20_0 = g_472_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_1 + u_472_473 * (const 64 (2**21)) + v_472_473 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_1 + r_472_473 * (const 64 (2**21)) + s_472_473 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_1,
    f_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_1,
    g_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 473)) <=s delta, delta <=s (const 64 (1 + 2*473)),
    (const 64 (-(2**20))) <=s u_472_473, u_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_473, v_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_473, r_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_473, s_472_473 <=s (const 64 ((2**20))),
    u_472_473 + v_472_473 <=s (const 64 (2**20)),
    u_472_473 - v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 + v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 - v_472_473 <=s (const 64 (2**20)),
    r_472_473 + s_472_473 <=s (const 64 (2**20)),
    r_472_473 - s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 + s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 - s_472_473 <=s (const 64 (2**20)),
    u_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_472_473 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_473_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_1,
sint64 g_472_low60_0_low20_1,
sint64 f_472_low60_0_low20_2,
sint64 g_472_low60_0_low20_2,
sint64 u_472_473,
sint64 v_472_473,
sint64 r_472_473,
sint64 s_472_473,
sint64 u_472_474,
sint64 v_472_474,
sint64 r_472_474,
sint64 s_472_474,
bit ne
)={
    u_472_473 * f_472_low60_0_low20_0 + v_472_473 * g_472_low60_0_low20_0 = f_472_low60_0_low20_1 * (-(2**20)),
    r_472_473 * f_472_low60_0_low20_0 + s_472_473 * g_472_low60_0_low20_0 = g_472_low60_0_low20_1 * (-(2**20))
&&
    u_472_473 * f_472_low60_0_low20_0 + v_472_473 * g_472_low60_0_low20_0 = f_472_low60_0_low20_1 * (const 64 (-(2**20))),
    r_472_473 * f_472_low60_0_low20_0 + s_472_473 * g_472_low60_0_low20_0 = g_472_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_1 + u_472_473 * (const 64 (2**21)) + v_472_473 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_1 + r_472_473 * (const 64 (2**21)) + s_472_473 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_1,
    f_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_1,
    g_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 473)) <=s delta, delta <=s (const 64 (1 + 2*473)),
    (const 64 (-(2**20))) <=s u_472_473, u_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_473, v_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_473, r_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_473, s_472_473 <=s (const 64 ((2**20))),
    u_472_473 + v_472_473 <=s (const 64 (2**20)),
    u_472_473 - v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 + v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 - v_472_473 <=s (const 64 (2**20)),
    r_472_473 + s_472_473 <=s (const 64 (2**20)),
    r_472_473 - s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 + s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 - s_472_473 <=s (const 64 (2**20)),
    u_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_472_473 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step473

// premise a
assume
g_472_low60_0_low20_1 = 0 (mod 2)
&&
g_472_low60_0_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_2 f_472_low60_0_low20_1;
mov u_472_474 u_472_473;
mov v_472_474 v_472_473;

asr g_472_low60_0_low20_2 g_472_low60_0_low20_1 1;
asr r_472_474 r_472_473 1;
asr s_472_474 s_472_473 1;
assert
    true
&&
    f_472_low60_0_low20_2 = f_472_low60_0_low20_1,
    u_472_474 = u_472_473,
    v_472_474 = v_472_473,
    g_472_low60_0_low20_2 * (const 64 2) = g_472_low60_0_low20_1,
    r_472_474 * (const 64 2) = r_472_473,
    s_472_474 * (const 64 2) = s_472_473
;

assume
    f_472_low60_0_low20_2 = f_472_low60_0_low20_1,
    u_472_474 = u_472_473,
    v_472_474 = v_472_473,
    g_472_low60_0_low20_2 * 2 = g_472_low60_0_low20_1,
    r_472_474 * 2 = r_472_473,
    s_472_474 * 2 = s_472_473
&&
    true
;

{
    u_472_474 * f_472_low60_0_low20_0 + v_472_474 * g_472_low60_0_low20_0 = f_472_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_474 * f_472_low60_0_low20_0 + s_472_474 * g_472_low60_0_low20_0 = g_472_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_2 + u_472_474 * (const 64 (2**21)) + v_472_474 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_2 + r_472_474 * (const 64 (2**21)) + s_472_474 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_2,
    f_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_2,
    g_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 474)) <=s delta, delta <=s (const 64 (1 + 2*474)),
    (const 64 (-(2**20))) <=s u_472_474, u_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_474, v_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_474, r_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_474, s_472_474 <=s (const 64 ((2**20))),
    u_472_474 + v_472_474 <=s (const 64 (2**20)),
    u_472_474 - v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 + v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 - v_472_474 <=s (const 64 (2**20)),
    r_472_474 + s_472_474 <=s (const 64 (2**20)),
    r_472_474 - s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 + s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 - s_472_474 <=s (const 64 (2**20)),
    u_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_472_474 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_473_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_1,
sint64 g_472_low60_0_low20_1,
sint64 f_472_low60_0_low20_2,
sint64 g_472_low60_0_low20_2,
sint64 u_472_473,
sint64 v_472_473,
sint64 r_472_473,
sint64 s_472_473,
sint64 u_472_474,
sint64 v_472_474,
sint64 r_472_474,
sint64 s_472_474,
bit ne
)={
    u_472_473 * f_472_low60_0_low20_0 + v_472_473 * g_472_low60_0_low20_0 = f_472_low60_0_low20_1 * (-(2**20)),
    r_472_473 * f_472_low60_0_low20_0 + s_472_473 * g_472_low60_0_low20_0 = g_472_low60_0_low20_1 * (-(2**20))
&&
    u_472_473 * f_472_low60_0_low20_0 + v_472_473 * g_472_low60_0_low20_0 = f_472_low60_0_low20_1 * (const 64 (-(2**20))),
    r_472_473 * f_472_low60_0_low20_0 + s_472_473 * g_472_low60_0_low20_0 = g_472_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_1 + u_472_473 * (const 64 (2**21)) + v_472_473 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_1 + r_472_473 * (const 64 (2**21)) + s_472_473 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_1,
    f_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_1,
    g_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 473)) <=s delta, delta <=s (const 64 (1 + 2*473)),
    (const 64 (-(2**20))) <=s u_472_473, u_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_473, v_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_473, r_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_473, s_472_473 <=s (const 64 ((2**20))),
    u_472_473 + v_472_473 <=s (const 64 (2**20)),
    u_472_473 - v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 + v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 - v_472_473 <=s (const 64 (2**20)),
    r_472_473 + s_472_473 <=s (const 64 (2**20)),
    r_472_473 - s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 + s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 - s_472_473 <=s (const 64 (2**20)),
    u_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_472_473 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step473

// premise b
assume
g_472_low60_0_low20_1 = 1 (mod 2)
&&
g_472_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_2 f_472_low60_0_low20_1;
mov u_472_474 u_472_473;
mov v_472_474 v_472_473;

add g_472_low60_0_low20_2 g_472_low60_0_low20_1 f_472_low60_0_low20_1;
asr g_472_low60_0_low20_2 g_472_low60_0_low20_2 1;
add r_472_474 r_472_473 u_472_473;
asr r_472_474 r_472_474 1;
add s_472_474 s_472_473 v_472_473;
asr s_472_474 s_472_474 1;
assert
    true
&&
    f_472_low60_0_low20_2 = f_472_low60_0_low20_1,
    u_472_474 = u_472_473,
    v_472_474 = v_472_473,
    g_472_low60_0_low20_2 * (const 64 2) = g_472_low60_0_low20_1 + f_472_low60_0_low20_1,
    r_472_474 * (const 64 2) = r_472_473 + u_472_473,
    s_472_474 * (const 64 2) = s_472_473 + v_472_473
;

assume
    f_472_low60_0_low20_2 = f_472_low60_0_low20_1,
    u_472_474 = u_472_473,
    v_472_474 = v_472_473,
    g_472_low60_0_low20_2 * 2 = g_472_low60_0_low20_1 + f_472_low60_0_low20_1,
    r_472_474 * 2 = r_472_473 + u_472_473,
    s_472_474 * 2 = s_472_473 + v_472_473
&&
    true
;

{
    u_472_474 * f_472_low60_0_low20_0 + v_472_474 * g_472_low60_0_low20_0 = f_472_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_474 * f_472_low60_0_low20_0 + s_472_474 * g_472_low60_0_low20_0 = g_472_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_2 + u_472_474 * (const 64 (2**21)) + v_472_474 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_2 + r_472_474 * (const 64 (2**21)) + s_472_474 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_2,
    f_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_2,
    g_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 474)) <=s delta, delta <=s (const 64 (1 + 2*474)),
    (const 64 (-(2**20))) <=s u_472_474, u_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_474, v_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_474, r_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_474, s_472_474 <=s (const 64 ((2**20))),
    u_472_474 + v_472_474 <=s (const 64 (2**20)),
    u_472_474 - v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 + v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 - v_472_474 <=s (const 64 (2**20)),
    r_472_474 + s_472_474 <=s (const 64 (2**20)),
    r_472_474 - s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 + s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 - s_472_474 <=s (const 64 (2**20)),
    u_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_472_474 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_473_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_1,
sint64 g_472_low60_0_low20_1,
sint64 f_472_low60_0_low20_2,
sint64 g_472_low60_0_low20_2,
sint64 u_472_473,
sint64 v_472_473,
sint64 r_472_473,
sint64 s_472_473,
sint64 u_472_474,
sint64 v_472_474,
sint64 r_472_474,
sint64 s_472_474,
bit ne
)={
    u_472_473 * f_472_low60_0_low20_0 + v_472_473 * g_472_low60_0_low20_0 = f_472_low60_0_low20_1 * (-(2**20)),
    r_472_473 * f_472_low60_0_low20_0 + s_472_473 * g_472_low60_0_low20_0 = g_472_low60_0_low20_1 * (-(2**20))
&&
    u_472_473 * f_472_low60_0_low20_0 + v_472_473 * g_472_low60_0_low20_0 = f_472_low60_0_low20_1 * (const 64 (-(2**20))),
    r_472_473 * f_472_low60_0_low20_0 + s_472_473 * g_472_low60_0_low20_0 = g_472_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_1 + u_472_473 * (const 64 (2**21)) + v_472_473 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_1 + r_472_473 * (const 64 (2**21)) + s_472_473 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_1,
    f_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_1,
    g_472_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 473)) <=s delta, delta <=s (const 64 (1 + 2*473)),
    (const 64 (-(2**20))) <=s u_472_473, u_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_473, v_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_473, r_472_473 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_473, s_472_473 <=s (const 64 ((2**20))),
    u_472_473 + v_472_473 <=s (const 64 (2**20)),
    u_472_473 - v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 + v_472_473 <=s (const 64 (2**20)),
    (const 64 0) - u_472_473 - v_472_473 <=s (const 64 (2**20)),
    r_472_473 + s_472_473 <=s (const 64 (2**20)),
    r_472_473 - s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 + s_472_473 <=s (const 64 (2**20)),
    (const 64 0) - r_472_473 - s_472_473 <=s (const 64 (2**20)),
    u_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_472_473 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_472_473 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step473

// premise c
assume
g_472_low60_0_low20_1 = 1 (mod 2)
&&
g_472_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_2 g_472_low60_0_low20_1;
mov u_472_474 r_472_473;
mov v_472_474 s_472_473;

subs dc g_472_low60_0_low20_2 g_472_low60_0_low20_1 f_472_low60_0_low20_1;
asr g_472_low60_0_low20_2 g_472_low60_0_low20_2 1;
subs dc r_472_474 r_472_473 u_472_473;
asr r_472_474 r_472_474 1;
subs dc s_472_474 s_472_473 v_472_473;
asr s_472_474 s_472_474 1;
assert
    true
&&
    f_472_low60_0_low20_2 = g_472_low60_0_low20_1,
    u_472_474 = r_472_473,
    v_472_474 = s_472_473,
    g_472_low60_0_low20_2 * (const 64 2) = g_472_low60_0_low20_1 - f_472_low60_0_low20_1,
    r_472_474 * (const 64 2) = r_472_473 - u_472_473,
    s_472_474 * (const 64 2) = s_472_473 - v_472_473
;

assume
    f_472_low60_0_low20_2 = g_472_low60_0_low20_1,
    u_472_474 = r_472_473,
    v_472_474 = s_472_473,
    g_472_low60_0_low20_2 * 2 = g_472_low60_0_low20_1 - f_472_low60_0_low20_1,
    r_472_474 * 2 = r_472_473 - u_472_473,
    s_472_474 * 2 = s_472_473 - v_472_473
&&
    true
;

{
    u_472_474 * f_472_low60_0_low20_0 + v_472_474 * g_472_low60_0_low20_0 = f_472_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_474 * f_472_low60_0_low20_0 + s_472_474 * g_472_low60_0_low20_0 = g_472_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_2 + u_472_474 * (const 64 (2**21)) + v_472_474 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_2 + r_472_474 * (const 64 (2**21)) + s_472_474 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_2,
    f_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_2,
    g_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 474)) <=s delta, delta <=s (const 64 (1 + 2*474)),
    (const 64 (-(2**20))) <=s u_472_474, u_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_474, v_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_474, r_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_474, s_472_474 <=s (const 64 ((2**20))),
    u_472_474 + v_472_474 <=s (const 64 (2**20)),
    u_472_474 - v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 + v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 - v_472_474 <=s (const 64 (2**20)),
    r_472_474 + s_472_474 <=s (const 64 (2**20)),
    r_472_474 - s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 + s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 - s_472_474 <=s (const 64 (2**20)),
    u_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_472_474 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_474_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_2,
sint64 g_472_low60_0_low20_2,
sint64 f_472_low60_0_low20_3,
sint64 g_472_low60_0_low20_3,
sint64 u_472_474,
sint64 v_472_474,
sint64 r_472_474,
sint64 s_472_474,
sint64 u_472_475,
sint64 v_472_475,
sint64 r_472_475,
sint64 s_472_475,
bit ne
)={
    u_472_474 * f_472_low60_0_low20_0 + v_472_474 * g_472_low60_0_low20_0 = f_472_low60_0_low20_2 * (-(2**20)),
    r_472_474 * f_472_low60_0_low20_0 + s_472_474 * g_472_low60_0_low20_0 = g_472_low60_0_low20_2 * (-(2**20))
&&
    u_472_474 * f_472_low60_0_low20_0 + v_472_474 * g_472_low60_0_low20_0 = f_472_low60_0_low20_2 * (const 64 (-(2**20))),
    r_472_474 * f_472_low60_0_low20_0 + s_472_474 * g_472_low60_0_low20_0 = g_472_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_2 + u_472_474 * (const 64 (2**21)) + v_472_474 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_2 + r_472_474 * (const 64 (2**21)) + s_472_474 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_2,
    f_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_2,
    g_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 474)) <=s delta, delta <=s (const 64 (1 + 2*474)),
    (const 64 (-(2**20))) <=s u_472_474, u_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_474, v_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_474, r_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_474, s_472_474 <=s (const 64 ((2**20))),
    u_472_474 + v_472_474 <=s (const 64 (2**20)),
    u_472_474 - v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 + v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 - v_472_474 <=s (const 64 (2**20)),
    r_472_474 + s_472_474 <=s (const 64 (2**20)),
    r_472_474 - s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 + s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 - s_472_474 <=s (const 64 (2**20)),
    u_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_472_474 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step474

// premise a
assume
g_472_low60_0_low20_2 = 0 (mod 2)
&&
g_472_low60_0_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_3 f_472_low60_0_low20_2;
mov u_472_475 u_472_474;
mov v_472_475 v_472_474;

asr g_472_low60_0_low20_3 g_472_low60_0_low20_2 1;
asr r_472_475 r_472_474 1;
asr s_472_475 s_472_474 1;
assert
    true
&&
    f_472_low60_0_low20_3 = f_472_low60_0_low20_2,
    u_472_475 = u_472_474,
    v_472_475 = v_472_474,
    g_472_low60_0_low20_3 * (const 64 2) = g_472_low60_0_low20_2,
    r_472_475 * (const 64 2) = r_472_474,
    s_472_475 * (const 64 2) = s_472_474
;

assume
    f_472_low60_0_low20_3 = f_472_low60_0_low20_2,
    u_472_475 = u_472_474,
    v_472_475 = v_472_474,
    g_472_low60_0_low20_3 * 2 = g_472_low60_0_low20_2,
    r_472_475 * 2 = r_472_474,
    s_472_475 * 2 = s_472_474
&&
    true
;

{
    u_472_475 * f_472_low60_0_low20_0 + v_472_475 * g_472_low60_0_low20_0 = f_472_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_475 * f_472_low60_0_low20_0 + s_472_475 * g_472_low60_0_low20_0 = g_472_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_3 + u_472_475 * (const 64 (2**21)) + v_472_475 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_3 + r_472_475 * (const 64 (2**21)) + s_472_475 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_3,
    f_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_3,
    g_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 475)) <=s delta, delta <=s (const 64 (1 + 2*475)),
    (const 64 (-(2**20))) <=s u_472_475, u_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_475, v_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_475, r_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_475, s_472_475 <=s (const 64 ((2**20))),
    u_472_475 + v_472_475 <=s (const 64 (2**20)),
    u_472_475 - v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 + v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 - v_472_475 <=s (const 64 (2**20)),
    r_472_475 + s_472_475 <=s (const 64 (2**20)),
    r_472_475 - s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 + s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 - s_472_475 <=s (const 64 (2**20)),
    u_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_472_475 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_474_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_2,
sint64 g_472_low60_0_low20_2,
sint64 f_472_low60_0_low20_3,
sint64 g_472_low60_0_low20_3,
sint64 u_472_474,
sint64 v_472_474,
sint64 r_472_474,
sint64 s_472_474,
sint64 u_472_475,
sint64 v_472_475,
sint64 r_472_475,
sint64 s_472_475,
bit ne
)={
    u_472_474 * f_472_low60_0_low20_0 + v_472_474 * g_472_low60_0_low20_0 = f_472_low60_0_low20_2 * (-(2**20)),
    r_472_474 * f_472_low60_0_low20_0 + s_472_474 * g_472_low60_0_low20_0 = g_472_low60_0_low20_2 * (-(2**20))
&&
    u_472_474 * f_472_low60_0_low20_0 + v_472_474 * g_472_low60_0_low20_0 = f_472_low60_0_low20_2 * (const 64 (-(2**20))),
    r_472_474 * f_472_low60_0_low20_0 + s_472_474 * g_472_low60_0_low20_0 = g_472_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_2 + u_472_474 * (const 64 (2**21)) + v_472_474 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_2 + r_472_474 * (const 64 (2**21)) + s_472_474 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_2,
    f_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_2,
    g_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 474)) <=s delta, delta <=s (const 64 (1 + 2*474)),
    (const 64 (-(2**20))) <=s u_472_474, u_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_474, v_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_474, r_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_474, s_472_474 <=s (const 64 ((2**20))),
    u_472_474 + v_472_474 <=s (const 64 (2**20)),
    u_472_474 - v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 + v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 - v_472_474 <=s (const 64 (2**20)),
    r_472_474 + s_472_474 <=s (const 64 (2**20)),
    r_472_474 - s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 + s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 - s_472_474 <=s (const 64 (2**20)),
    u_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_472_474 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step474

// premise b
assume
g_472_low60_0_low20_2 = 1 (mod 2)
&&
g_472_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_3 f_472_low60_0_low20_2;
mov u_472_475 u_472_474;
mov v_472_475 v_472_474;

add g_472_low60_0_low20_3 g_472_low60_0_low20_2 f_472_low60_0_low20_2;
asr g_472_low60_0_low20_3 g_472_low60_0_low20_3 1;
add r_472_475 r_472_474 u_472_474;
asr r_472_475 r_472_475 1;
add s_472_475 s_472_474 v_472_474;
asr s_472_475 s_472_475 1;
assert
    true
&&
    f_472_low60_0_low20_3 = f_472_low60_0_low20_2,
    u_472_475 = u_472_474,
    v_472_475 = v_472_474,
    g_472_low60_0_low20_3 * (const 64 2) = g_472_low60_0_low20_2 + f_472_low60_0_low20_2,
    r_472_475 * (const 64 2) = r_472_474 + u_472_474,
    s_472_475 * (const 64 2) = s_472_474 + v_472_474
;

assume
    f_472_low60_0_low20_3 = f_472_low60_0_low20_2,
    u_472_475 = u_472_474,
    v_472_475 = v_472_474,
    g_472_low60_0_low20_3 * 2 = g_472_low60_0_low20_2 + f_472_low60_0_low20_2,
    r_472_475 * 2 = r_472_474 + u_472_474,
    s_472_475 * 2 = s_472_474 + v_472_474
&&
    true
;

{
    u_472_475 * f_472_low60_0_low20_0 + v_472_475 * g_472_low60_0_low20_0 = f_472_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_475 * f_472_low60_0_low20_0 + s_472_475 * g_472_low60_0_low20_0 = g_472_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_3 + u_472_475 * (const 64 (2**21)) + v_472_475 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_3 + r_472_475 * (const 64 (2**21)) + s_472_475 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_3,
    f_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_3,
    g_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 475)) <=s delta, delta <=s (const 64 (1 + 2*475)),
    (const 64 (-(2**20))) <=s u_472_475, u_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_475, v_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_475, r_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_475, s_472_475 <=s (const 64 ((2**20))),
    u_472_475 + v_472_475 <=s (const 64 (2**20)),
    u_472_475 - v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 + v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 - v_472_475 <=s (const 64 (2**20)),
    r_472_475 + s_472_475 <=s (const 64 (2**20)),
    r_472_475 - s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 + s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 - s_472_475 <=s (const 64 (2**20)),
    u_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_472_475 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_474_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_2,
sint64 g_472_low60_0_low20_2,
sint64 f_472_low60_0_low20_3,
sint64 g_472_low60_0_low20_3,
sint64 u_472_474,
sint64 v_472_474,
sint64 r_472_474,
sint64 s_472_474,
sint64 u_472_475,
sint64 v_472_475,
sint64 r_472_475,
sint64 s_472_475,
bit ne
)={
    u_472_474 * f_472_low60_0_low20_0 + v_472_474 * g_472_low60_0_low20_0 = f_472_low60_0_low20_2 * (-(2**20)),
    r_472_474 * f_472_low60_0_low20_0 + s_472_474 * g_472_low60_0_low20_0 = g_472_low60_0_low20_2 * (-(2**20))
&&
    u_472_474 * f_472_low60_0_low20_0 + v_472_474 * g_472_low60_0_low20_0 = f_472_low60_0_low20_2 * (const 64 (-(2**20))),
    r_472_474 * f_472_low60_0_low20_0 + s_472_474 * g_472_low60_0_low20_0 = g_472_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_2 + u_472_474 * (const 64 (2**21)) + v_472_474 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_2 + r_472_474 * (const 64 (2**21)) + s_472_474 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_2,
    f_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_2,
    g_472_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 474)) <=s delta, delta <=s (const 64 (1 + 2*474)),
    (const 64 (-(2**20))) <=s u_472_474, u_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_474, v_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_474, r_472_474 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_474, s_472_474 <=s (const 64 ((2**20))),
    u_472_474 + v_472_474 <=s (const 64 (2**20)),
    u_472_474 - v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 + v_472_474 <=s (const 64 (2**20)),
    (const 64 0) - u_472_474 - v_472_474 <=s (const 64 (2**20)),
    r_472_474 + s_472_474 <=s (const 64 (2**20)),
    r_472_474 - s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 + s_472_474 <=s (const 64 (2**20)),
    (const 64 0) - r_472_474 - s_472_474 <=s (const 64 (2**20)),
    u_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_472_474 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_472_474 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step474

// premise c
assume
g_472_low60_0_low20_2 = 1 (mod 2)
&&
g_472_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_3 g_472_low60_0_low20_2;
mov u_472_475 r_472_474;
mov v_472_475 s_472_474;

subs dc g_472_low60_0_low20_3 g_472_low60_0_low20_2 f_472_low60_0_low20_2;
asr g_472_low60_0_low20_3 g_472_low60_0_low20_3 1;
subs dc r_472_475 r_472_474 u_472_474;
asr r_472_475 r_472_475 1;
subs dc s_472_475 s_472_474 v_472_474;
asr s_472_475 s_472_475 1;
assert
    true
&&
    f_472_low60_0_low20_3 = g_472_low60_0_low20_2,
    u_472_475 = r_472_474,
    v_472_475 = s_472_474,
    g_472_low60_0_low20_3 * (const 64 2) = g_472_low60_0_low20_2 - f_472_low60_0_low20_2,
    r_472_475 * (const 64 2) = r_472_474 - u_472_474,
    s_472_475 * (const 64 2) = s_472_474 - v_472_474
;

assume
    f_472_low60_0_low20_3 = g_472_low60_0_low20_2,
    u_472_475 = r_472_474,
    v_472_475 = s_472_474,
    g_472_low60_0_low20_3 * 2 = g_472_low60_0_low20_2 - f_472_low60_0_low20_2,
    r_472_475 * 2 = r_472_474 - u_472_474,
    s_472_475 * 2 = s_472_474 - v_472_474
&&
    true
;

{
    u_472_475 * f_472_low60_0_low20_0 + v_472_475 * g_472_low60_0_low20_0 = f_472_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_475 * f_472_low60_0_low20_0 + s_472_475 * g_472_low60_0_low20_0 = g_472_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_3 + u_472_475 * (const 64 (2**21)) + v_472_475 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_3 + r_472_475 * (const 64 (2**21)) + s_472_475 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_3,
    f_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_3,
    g_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 475)) <=s delta, delta <=s (const 64 (1 + 2*475)),
    (const 64 (-(2**20))) <=s u_472_475, u_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_475, v_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_475, r_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_475, s_472_475 <=s (const 64 ((2**20))),
    u_472_475 + v_472_475 <=s (const 64 (2**20)),
    u_472_475 - v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 + v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 - v_472_475 <=s (const 64 (2**20)),
    r_472_475 + s_472_475 <=s (const 64 (2**20)),
    r_472_475 - s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 + s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 - s_472_475 <=s (const 64 (2**20)),
    u_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_472_475 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_475_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_3,
sint64 g_472_low60_0_low20_3,
sint64 f_472_low60_0_low20_4,
sint64 g_472_low60_0_low20_4,
sint64 u_472_475,
sint64 v_472_475,
sint64 r_472_475,
sint64 s_472_475,
sint64 u_472_476,
sint64 v_472_476,
sint64 r_472_476,
sint64 s_472_476,
bit ne
)={
    u_472_475 * f_472_low60_0_low20_0 + v_472_475 * g_472_low60_0_low20_0 = f_472_low60_0_low20_3 * (-(2**20)),
    r_472_475 * f_472_low60_0_low20_0 + s_472_475 * g_472_low60_0_low20_0 = g_472_low60_0_low20_3 * (-(2**20))
&&
    u_472_475 * f_472_low60_0_low20_0 + v_472_475 * g_472_low60_0_low20_0 = f_472_low60_0_low20_3 * (const 64 (-(2**20))),
    r_472_475 * f_472_low60_0_low20_0 + s_472_475 * g_472_low60_0_low20_0 = g_472_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_3 + u_472_475 * (const 64 (2**21)) + v_472_475 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_3 + r_472_475 * (const 64 (2**21)) + s_472_475 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_3,
    f_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_3,
    g_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 475)) <=s delta, delta <=s (const 64 (1 + 2*475)),
    (const 64 (-(2**20))) <=s u_472_475, u_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_475, v_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_475, r_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_475, s_472_475 <=s (const 64 ((2**20))),
    u_472_475 + v_472_475 <=s (const 64 (2**20)),
    u_472_475 - v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 + v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 - v_472_475 <=s (const 64 (2**20)),
    r_472_475 + s_472_475 <=s (const 64 (2**20)),
    r_472_475 - s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 + s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 - s_472_475 <=s (const 64 (2**20)),
    u_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_472_475 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step475

// premise a
assume
g_472_low60_0_low20_3 = 0 (mod 2)
&&
g_472_low60_0_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_4 f_472_low60_0_low20_3;
mov u_472_476 u_472_475;
mov v_472_476 v_472_475;

asr g_472_low60_0_low20_4 g_472_low60_0_low20_3 1;
asr r_472_476 r_472_475 1;
asr s_472_476 s_472_475 1;
assert
    true
&&
    f_472_low60_0_low20_4 = f_472_low60_0_low20_3,
    u_472_476 = u_472_475,
    v_472_476 = v_472_475,
    g_472_low60_0_low20_4 * (const 64 2) = g_472_low60_0_low20_3,
    r_472_476 * (const 64 2) = r_472_475,
    s_472_476 * (const 64 2) = s_472_475
;

assume
    f_472_low60_0_low20_4 = f_472_low60_0_low20_3,
    u_472_476 = u_472_475,
    v_472_476 = v_472_475,
    g_472_low60_0_low20_4 * 2 = g_472_low60_0_low20_3,
    r_472_476 * 2 = r_472_475,
    s_472_476 * 2 = s_472_475
&&
    true
;

{
    u_472_476 * f_472_low60_0_low20_0 + v_472_476 * g_472_low60_0_low20_0 = f_472_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_476 * f_472_low60_0_low20_0 + s_472_476 * g_472_low60_0_low20_0 = g_472_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_4 + u_472_476 * (const 64 (2**21)) + v_472_476 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_4 + r_472_476 * (const 64 (2**21)) + s_472_476 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_4,
    f_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_4,
    g_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 476)) <=s delta, delta <=s (const 64 (1 + 2*476)),
    (const 64 (-(2**20))) <=s u_472_476, u_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_476, v_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_476, r_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_476, s_472_476 <=s (const 64 ((2**20))),
    u_472_476 + v_472_476 <=s (const 64 (2**20)),
    u_472_476 - v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 + v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 - v_472_476 <=s (const 64 (2**20)),
    r_472_476 + s_472_476 <=s (const 64 (2**20)),
    r_472_476 - s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 + s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 - s_472_476 <=s (const 64 (2**20)),
    u_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_472_476 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_475_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_3,
sint64 g_472_low60_0_low20_3,
sint64 f_472_low60_0_low20_4,
sint64 g_472_low60_0_low20_4,
sint64 u_472_475,
sint64 v_472_475,
sint64 r_472_475,
sint64 s_472_475,
sint64 u_472_476,
sint64 v_472_476,
sint64 r_472_476,
sint64 s_472_476,
bit ne
)={
    u_472_475 * f_472_low60_0_low20_0 + v_472_475 * g_472_low60_0_low20_0 = f_472_low60_0_low20_3 * (-(2**20)),
    r_472_475 * f_472_low60_0_low20_0 + s_472_475 * g_472_low60_0_low20_0 = g_472_low60_0_low20_3 * (-(2**20))
&&
    u_472_475 * f_472_low60_0_low20_0 + v_472_475 * g_472_low60_0_low20_0 = f_472_low60_0_low20_3 * (const 64 (-(2**20))),
    r_472_475 * f_472_low60_0_low20_0 + s_472_475 * g_472_low60_0_low20_0 = g_472_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_3 + u_472_475 * (const 64 (2**21)) + v_472_475 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_3 + r_472_475 * (const 64 (2**21)) + s_472_475 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_3,
    f_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_3,
    g_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 475)) <=s delta, delta <=s (const 64 (1 + 2*475)),
    (const 64 (-(2**20))) <=s u_472_475, u_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_475, v_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_475, r_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_475, s_472_475 <=s (const 64 ((2**20))),
    u_472_475 + v_472_475 <=s (const 64 (2**20)),
    u_472_475 - v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 + v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 - v_472_475 <=s (const 64 (2**20)),
    r_472_475 + s_472_475 <=s (const 64 (2**20)),
    r_472_475 - s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 + s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 - s_472_475 <=s (const 64 (2**20)),
    u_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_472_475 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step475

// premise b
assume
g_472_low60_0_low20_3 = 1 (mod 2)
&&
g_472_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_4 f_472_low60_0_low20_3;
mov u_472_476 u_472_475;
mov v_472_476 v_472_475;

add g_472_low60_0_low20_4 g_472_low60_0_low20_3 f_472_low60_0_low20_3;
asr g_472_low60_0_low20_4 g_472_low60_0_low20_4 1;
add r_472_476 r_472_475 u_472_475;
asr r_472_476 r_472_476 1;
add s_472_476 s_472_475 v_472_475;
asr s_472_476 s_472_476 1;
assert
    true
&&
    f_472_low60_0_low20_4 = f_472_low60_0_low20_3,
    u_472_476 = u_472_475,
    v_472_476 = v_472_475,
    g_472_low60_0_low20_4 * (const 64 2) = g_472_low60_0_low20_3 + f_472_low60_0_low20_3,
    r_472_476 * (const 64 2) = r_472_475 + u_472_475,
    s_472_476 * (const 64 2) = s_472_475 + v_472_475
;

assume
    f_472_low60_0_low20_4 = f_472_low60_0_low20_3,
    u_472_476 = u_472_475,
    v_472_476 = v_472_475,
    g_472_low60_0_low20_4 * 2 = g_472_low60_0_low20_3 + f_472_low60_0_low20_3,
    r_472_476 * 2 = r_472_475 + u_472_475,
    s_472_476 * 2 = s_472_475 + v_472_475
&&
    true
;

{
    u_472_476 * f_472_low60_0_low20_0 + v_472_476 * g_472_low60_0_low20_0 = f_472_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_476 * f_472_low60_0_low20_0 + s_472_476 * g_472_low60_0_low20_0 = g_472_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_4 + u_472_476 * (const 64 (2**21)) + v_472_476 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_4 + r_472_476 * (const 64 (2**21)) + s_472_476 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_4,
    f_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_4,
    g_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 476)) <=s delta, delta <=s (const 64 (1 + 2*476)),
    (const 64 (-(2**20))) <=s u_472_476, u_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_476, v_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_476, r_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_476, s_472_476 <=s (const 64 ((2**20))),
    u_472_476 + v_472_476 <=s (const 64 (2**20)),
    u_472_476 - v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 + v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 - v_472_476 <=s (const 64 (2**20)),
    r_472_476 + s_472_476 <=s (const 64 (2**20)),
    r_472_476 - s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 + s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 - s_472_476 <=s (const 64 (2**20)),
    u_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_472_476 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_475_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_3,
sint64 g_472_low60_0_low20_3,
sint64 f_472_low60_0_low20_4,
sint64 g_472_low60_0_low20_4,
sint64 u_472_475,
sint64 v_472_475,
sint64 r_472_475,
sint64 s_472_475,
sint64 u_472_476,
sint64 v_472_476,
sint64 r_472_476,
sint64 s_472_476,
bit ne
)={
    u_472_475 * f_472_low60_0_low20_0 + v_472_475 * g_472_low60_0_low20_0 = f_472_low60_0_low20_3 * (-(2**20)),
    r_472_475 * f_472_low60_0_low20_0 + s_472_475 * g_472_low60_0_low20_0 = g_472_low60_0_low20_3 * (-(2**20))
&&
    u_472_475 * f_472_low60_0_low20_0 + v_472_475 * g_472_low60_0_low20_0 = f_472_low60_0_low20_3 * (const 64 (-(2**20))),
    r_472_475 * f_472_low60_0_low20_0 + s_472_475 * g_472_low60_0_low20_0 = g_472_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_3 + u_472_475 * (const 64 (2**21)) + v_472_475 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_3 + r_472_475 * (const 64 (2**21)) + s_472_475 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_3,
    f_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_3,
    g_472_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 475)) <=s delta, delta <=s (const 64 (1 + 2*475)),
    (const 64 (-(2**20))) <=s u_472_475, u_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_475, v_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_475, r_472_475 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_475, s_472_475 <=s (const 64 ((2**20))),
    u_472_475 + v_472_475 <=s (const 64 (2**20)),
    u_472_475 - v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 + v_472_475 <=s (const 64 (2**20)),
    (const 64 0) - u_472_475 - v_472_475 <=s (const 64 (2**20)),
    r_472_475 + s_472_475 <=s (const 64 (2**20)),
    r_472_475 - s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 + s_472_475 <=s (const 64 (2**20)),
    (const 64 0) - r_472_475 - s_472_475 <=s (const 64 (2**20)),
    u_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_472_475 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_472_475 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step475

// premise c
assume
g_472_low60_0_low20_3 = 1 (mod 2)
&&
g_472_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_4 g_472_low60_0_low20_3;
mov u_472_476 r_472_475;
mov v_472_476 s_472_475;

subs dc g_472_low60_0_low20_4 g_472_low60_0_low20_3 f_472_low60_0_low20_3;
asr g_472_low60_0_low20_4 g_472_low60_0_low20_4 1;
subs dc r_472_476 r_472_475 u_472_475;
asr r_472_476 r_472_476 1;
subs dc s_472_476 s_472_475 v_472_475;
asr s_472_476 s_472_476 1;
assert
    true
&&
    f_472_low60_0_low20_4 = g_472_low60_0_low20_3,
    u_472_476 = r_472_475,
    v_472_476 = s_472_475,
    g_472_low60_0_low20_4 * (const 64 2) = g_472_low60_0_low20_3 - f_472_low60_0_low20_3,
    r_472_476 * (const 64 2) = r_472_475 - u_472_475,
    s_472_476 * (const 64 2) = s_472_475 - v_472_475
;

assume
    f_472_low60_0_low20_4 = g_472_low60_0_low20_3,
    u_472_476 = r_472_475,
    v_472_476 = s_472_475,
    g_472_low60_0_low20_4 * 2 = g_472_low60_0_low20_3 - f_472_low60_0_low20_3,
    r_472_476 * 2 = r_472_475 - u_472_475,
    s_472_476 * 2 = s_472_475 - v_472_475
&&
    true
;

{
    u_472_476 * f_472_low60_0_low20_0 + v_472_476 * g_472_low60_0_low20_0 = f_472_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_476 * f_472_low60_0_low20_0 + s_472_476 * g_472_low60_0_low20_0 = g_472_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_4 + u_472_476 * (const 64 (2**21)) + v_472_476 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_4 + r_472_476 * (const 64 (2**21)) + s_472_476 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_4,
    f_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_4,
    g_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 476)) <=s delta, delta <=s (const 64 (1 + 2*476)),
    (const 64 (-(2**20))) <=s u_472_476, u_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_476, v_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_476, r_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_476, s_472_476 <=s (const 64 ((2**20))),
    u_472_476 + v_472_476 <=s (const 64 (2**20)),
    u_472_476 - v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 + v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 - v_472_476 <=s (const 64 (2**20)),
    r_472_476 + s_472_476 <=s (const 64 (2**20)),
    r_472_476 - s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 + s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 - s_472_476 <=s (const 64 (2**20)),
    u_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_472_476 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_476_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_4,
sint64 g_472_low60_0_low20_4,
sint64 f_472_low60_0_low20_5,
sint64 g_472_low60_0_low20_5,
sint64 u_472_476,
sint64 v_472_476,
sint64 r_472_476,
sint64 s_472_476,
sint64 u_472_477,
sint64 v_472_477,
sint64 r_472_477,
sint64 s_472_477,
bit ne
)={
    u_472_476 * f_472_low60_0_low20_0 + v_472_476 * g_472_low60_0_low20_0 = f_472_low60_0_low20_4 * (-(2**20)),
    r_472_476 * f_472_low60_0_low20_0 + s_472_476 * g_472_low60_0_low20_0 = g_472_low60_0_low20_4 * (-(2**20))
&&
    u_472_476 * f_472_low60_0_low20_0 + v_472_476 * g_472_low60_0_low20_0 = f_472_low60_0_low20_4 * (const 64 (-(2**20))),
    r_472_476 * f_472_low60_0_low20_0 + s_472_476 * g_472_low60_0_low20_0 = g_472_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_4 + u_472_476 * (const 64 (2**21)) + v_472_476 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_4 + r_472_476 * (const 64 (2**21)) + s_472_476 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_4,
    f_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_4,
    g_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 476)) <=s delta, delta <=s (const 64 (1 + 2*476)),
    (const 64 (-(2**20))) <=s u_472_476, u_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_476, v_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_476, r_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_476, s_472_476 <=s (const 64 ((2**20))),
    u_472_476 + v_472_476 <=s (const 64 (2**20)),
    u_472_476 - v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 + v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 - v_472_476 <=s (const 64 (2**20)),
    r_472_476 + s_472_476 <=s (const 64 (2**20)),
    r_472_476 - s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 + s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 - s_472_476 <=s (const 64 (2**20)),
    u_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_472_476 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step476

// premise a
assume
g_472_low60_0_low20_4 = 0 (mod 2)
&&
g_472_low60_0_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_5 f_472_low60_0_low20_4;
mov u_472_477 u_472_476;
mov v_472_477 v_472_476;

asr g_472_low60_0_low20_5 g_472_low60_0_low20_4 1;
asr r_472_477 r_472_476 1;
asr s_472_477 s_472_476 1;
assert
    true
&&
    f_472_low60_0_low20_5 = f_472_low60_0_low20_4,
    u_472_477 = u_472_476,
    v_472_477 = v_472_476,
    g_472_low60_0_low20_5 * (const 64 2) = g_472_low60_0_low20_4,
    r_472_477 * (const 64 2) = r_472_476,
    s_472_477 * (const 64 2) = s_472_476
;

assume
    f_472_low60_0_low20_5 = f_472_low60_0_low20_4,
    u_472_477 = u_472_476,
    v_472_477 = v_472_476,
    g_472_low60_0_low20_5 * 2 = g_472_low60_0_low20_4,
    r_472_477 * 2 = r_472_476,
    s_472_477 * 2 = s_472_476
&&
    true
;

{
    u_472_477 * f_472_low60_0_low20_0 + v_472_477 * g_472_low60_0_low20_0 = f_472_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_477 * f_472_low60_0_low20_0 + s_472_477 * g_472_low60_0_low20_0 = g_472_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_5 + u_472_477 * (const 64 (2**21)) + v_472_477 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_5 + r_472_477 * (const 64 (2**21)) + s_472_477 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_5,
    f_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_5,
    g_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 477)) <=s delta, delta <=s (const 64 (1 + 2*477)),
    (const 64 (-(2**20))) <=s u_472_477, u_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_477, v_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_477, r_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_477, s_472_477 <=s (const 64 ((2**20))),
    u_472_477 + v_472_477 <=s (const 64 (2**20)),
    u_472_477 - v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 + v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 - v_472_477 <=s (const 64 (2**20)),
    r_472_477 + s_472_477 <=s (const 64 (2**20)),
    r_472_477 - s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 + s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 - s_472_477 <=s (const 64 (2**20)),
    u_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_472_477 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_476_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_4,
sint64 g_472_low60_0_low20_4,
sint64 f_472_low60_0_low20_5,
sint64 g_472_low60_0_low20_5,
sint64 u_472_476,
sint64 v_472_476,
sint64 r_472_476,
sint64 s_472_476,
sint64 u_472_477,
sint64 v_472_477,
sint64 r_472_477,
sint64 s_472_477,
bit ne
)={
    u_472_476 * f_472_low60_0_low20_0 + v_472_476 * g_472_low60_0_low20_0 = f_472_low60_0_low20_4 * (-(2**20)),
    r_472_476 * f_472_low60_0_low20_0 + s_472_476 * g_472_low60_0_low20_0 = g_472_low60_0_low20_4 * (-(2**20))
&&
    u_472_476 * f_472_low60_0_low20_0 + v_472_476 * g_472_low60_0_low20_0 = f_472_low60_0_low20_4 * (const 64 (-(2**20))),
    r_472_476 * f_472_low60_0_low20_0 + s_472_476 * g_472_low60_0_low20_0 = g_472_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_4 + u_472_476 * (const 64 (2**21)) + v_472_476 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_4 + r_472_476 * (const 64 (2**21)) + s_472_476 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_4,
    f_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_4,
    g_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 476)) <=s delta, delta <=s (const 64 (1 + 2*476)),
    (const 64 (-(2**20))) <=s u_472_476, u_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_476, v_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_476, r_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_476, s_472_476 <=s (const 64 ((2**20))),
    u_472_476 + v_472_476 <=s (const 64 (2**20)),
    u_472_476 - v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 + v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 - v_472_476 <=s (const 64 (2**20)),
    r_472_476 + s_472_476 <=s (const 64 (2**20)),
    r_472_476 - s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 + s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 - s_472_476 <=s (const 64 (2**20)),
    u_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_472_476 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step476

// premise b
assume
g_472_low60_0_low20_4 = 1 (mod 2)
&&
g_472_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_5 f_472_low60_0_low20_4;
mov u_472_477 u_472_476;
mov v_472_477 v_472_476;

add g_472_low60_0_low20_5 g_472_low60_0_low20_4 f_472_low60_0_low20_4;
asr g_472_low60_0_low20_5 g_472_low60_0_low20_5 1;
add r_472_477 r_472_476 u_472_476;
asr r_472_477 r_472_477 1;
add s_472_477 s_472_476 v_472_476;
asr s_472_477 s_472_477 1;
assert
    true
&&
    f_472_low60_0_low20_5 = f_472_low60_0_low20_4,
    u_472_477 = u_472_476,
    v_472_477 = v_472_476,
    g_472_low60_0_low20_5 * (const 64 2) = g_472_low60_0_low20_4 + f_472_low60_0_low20_4,
    r_472_477 * (const 64 2) = r_472_476 + u_472_476,
    s_472_477 * (const 64 2) = s_472_476 + v_472_476
;

assume
    f_472_low60_0_low20_5 = f_472_low60_0_low20_4,
    u_472_477 = u_472_476,
    v_472_477 = v_472_476,
    g_472_low60_0_low20_5 * 2 = g_472_low60_0_low20_4 + f_472_low60_0_low20_4,
    r_472_477 * 2 = r_472_476 + u_472_476,
    s_472_477 * 2 = s_472_476 + v_472_476
&&
    true
;

{
    u_472_477 * f_472_low60_0_low20_0 + v_472_477 * g_472_low60_0_low20_0 = f_472_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_477 * f_472_low60_0_low20_0 + s_472_477 * g_472_low60_0_low20_0 = g_472_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_5 + u_472_477 * (const 64 (2**21)) + v_472_477 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_5 + r_472_477 * (const 64 (2**21)) + s_472_477 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_5,
    f_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_5,
    g_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 477)) <=s delta, delta <=s (const 64 (1 + 2*477)),
    (const 64 (-(2**20))) <=s u_472_477, u_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_477, v_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_477, r_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_477, s_472_477 <=s (const 64 ((2**20))),
    u_472_477 + v_472_477 <=s (const 64 (2**20)),
    u_472_477 - v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 + v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 - v_472_477 <=s (const 64 (2**20)),
    r_472_477 + s_472_477 <=s (const 64 (2**20)),
    r_472_477 - s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 + s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 - s_472_477 <=s (const 64 (2**20)),
    u_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_472_477 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_476_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_4,
sint64 g_472_low60_0_low20_4,
sint64 f_472_low60_0_low20_5,
sint64 g_472_low60_0_low20_5,
sint64 u_472_476,
sint64 v_472_476,
sint64 r_472_476,
sint64 s_472_476,
sint64 u_472_477,
sint64 v_472_477,
sint64 r_472_477,
sint64 s_472_477,
bit ne
)={
    u_472_476 * f_472_low60_0_low20_0 + v_472_476 * g_472_low60_0_low20_0 = f_472_low60_0_low20_4 * (-(2**20)),
    r_472_476 * f_472_low60_0_low20_0 + s_472_476 * g_472_low60_0_low20_0 = g_472_low60_0_low20_4 * (-(2**20))
&&
    u_472_476 * f_472_low60_0_low20_0 + v_472_476 * g_472_low60_0_low20_0 = f_472_low60_0_low20_4 * (const 64 (-(2**20))),
    r_472_476 * f_472_low60_0_low20_0 + s_472_476 * g_472_low60_0_low20_0 = g_472_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_4 + u_472_476 * (const 64 (2**21)) + v_472_476 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_4 + r_472_476 * (const 64 (2**21)) + s_472_476 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_4,
    f_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_4,
    g_472_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 476)) <=s delta, delta <=s (const 64 (1 + 2*476)),
    (const 64 (-(2**20))) <=s u_472_476, u_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_476, v_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_476, r_472_476 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_476, s_472_476 <=s (const 64 ((2**20))),
    u_472_476 + v_472_476 <=s (const 64 (2**20)),
    u_472_476 - v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 + v_472_476 <=s (const 64 (2**20)),
    (const 64 0) - u_472_476 - v_472_476 <=s (const 64 (2**20)),
    r_472_476 + s_472_476 <=s (const 64 (2**20)),
    r_472_476 - s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 + s_472_476 <=s (const 64 (2**20)),
    (const 64 0) - r_472_476 - s_472_476 <=s (const 64 (2**20)),
    u_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_472_476 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_472_476 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step476

// premise c
assume
g_472_low60_0_low20_4 = 1 (mod 2)
&&
g_472_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_5 g_472_low60_0_low20_4;
mov u_472_477 r_472_476;
mov v_472_477 s_472_476;

subs dc g_472_low60_0_low20_5 g_472_low60_0_low20_4 f_472_low60_0_low20_4;
asr g_472_low60_0_low20_5 g_472_low60_0_low20_5 1;
subs dc r_472_477 r_472_476 u_472_476;
asr r_472_477 r_472_477 1;
subs dc s_472_477 s_472_476 v_472_476;
asr s_472_477 s_472_477 1;
assert
    true
&&
    f_472_low60_0_low20_5 = g_472_low60_0_low20_4,
    u_472_477 = r_472_476,
    v_472_477 = s_472_476,
    g_472_low60_0_low20_5 * (const 64 2) = g_472_low60_0_low20_4 - f_472_low60_0_low20_4,
    r_472_477 * (const 64 2) = r_472_476 - u_472_476,
    s_472_477 * (const 64 2) = s_472_476 - v_472_476
;

assume
    f_472_low60_0_low20_5 = g_472_low60_0_low20_4,
    u_472_477 = r_472_476,
    v_472_477 = s_472_476,
    g_472_low60_0_low20_5 * 2 = g_472_low60_0_low20_4 - f_472_low60_0_low20_4,
    r_472_477 * 2 = r_472_476 - u_472_476,
    s_472_477 * 2 = s_472_476 - v_472_476
&&
    true
;

{
    u_472_477 * f_472_low60_0_low20_0 + v_472_477 * g_472_low60_0_low20_0 = f_472_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_477 * f_472_low60_0_low20_0 + s_472_477 * g_472_low60_0_low20_0 = g_472_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_5 + u_472_477 * (const 64 (2**21)) + v_472_477 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_5 + r_472_477 * (const 64 (2**21)) + s_472_477 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_5,
    f_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_5,
    g_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 477)) <=s delta, delta <=s (const 64 (1 + 2*477)),
    (const 64 (-(2**20))) <=s u_472_477, u_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_477, v_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_477, r_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_477, s_472_477 <=s (const 64 ((2**20))),
    u_472_477 + v_472_477 <=s (const 64 (2**20)),
    u_472_477 - v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 + v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 - v_472_477 <=s (const 64 (2**20)),
    r_472_477 + s_472_477 <=s (const 64 (2**20)),
    r_472_477 - s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 + s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 - s_472_477 <=s (const 64 (2**20)),
    u_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_472_477 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_477_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_5,
sint64 g_472_low60_0_low20_5,
sint64 f_472_low60_0_low20_6,
sint64 g_472_low60_0_low20_6,
sint64 u_472_477,
sint64 v_472_477,
sint64 r_472_477,
sint64 s_472_477,
sint64 u_472_478,
sint64 v_472_478,
sint64 r_472_478,
sint64 s_472_478,
bit ne
)={
    u_472_477 * f_472_low60_0_low20_0 + v_472_477 * g_472_low60_0_low20_0 = f_472_low60_0_low20_5 * (-(2**20)),
    r_472_477 * f_472_low60_0_low20_0 + s_472_477 * g_472_low60_0_low20_0 = g_472_low60_0_low20_5 * (-(2**20))
&&
    u_472_477 * f_472_low60_0_low20_0 + v_472_477 * g_472_low60_0_low20_0 = f_472_low60_0_low20_5 * (const 64 (-(2**20))),
    r_472_477 * f_472_low60_0_low20_0 + s_472_477 * g_472_low60_0_low20_0 = g_472_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_5 + u_472_477 * (const 64 (2**21)) + v_472_477 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_5 + r_472_477 * (const 64 (2**21)) + s_472_477 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_5,
    f_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_5,
    g_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 477)) <=s delta, delta <=s (const 64 (1 + 2*477)),
    (const 64 (-(2**20))) <=s u_472_477, u_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_477, v_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_477, r_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_477, s_472_477 <=s (const 64 ((2**20))),
    u_472_477 + v_472_477 <=s (const 64 (2**20)),
    u_472_477 - v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 + v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 - v_472_477 <=s (const 64 (2**20)),
    r_472_477 + s_472_477 <=s (const 64 (2**20)),
    r_472_477 - s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 + s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 - s_472_477 <=s (const 64 (2**20)),
    u_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_472_477 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step477

// premise a
assume
g_472_low60_0_low20_5 = 0 (mod 2)
&&
g_472_low60_0_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_6 f_472_low60_0_low20_5;
mov u_472_478 u_472_477;
mov v_472_478 v_472_477;

asr g_472_low60_0_low20_6 g_472_low60_0_low20_5 1;
asr r_472_478 r_472_477 1;
asr s_472_478 s_472_477 1;
assert
    true
&&
    f_472_low60_0_low20_6 = f_472_low60_0_low20_5,
    u_472_478 = u_472_477,
    v_472_478 = v_472_477,
    g_472_low60_0_low20_6 * (const 64 2) = g_472_low60_0_low20_5,
    r_472_478 * (const 64 2) = r_472_477,
    s_472_478 * (const 64 2) = s_472_477
;

assume
    f_472_low60_0_low20_6 = f_472_low60_0_low20_5,
    u_472_478 = u_472_477,
    v_472_478 = v_472_477,
    g_472_low60_0_low20_6 * 2 = g_472_low60_0_low20_5,
    r_472_478 * 2 = r_472_477,
    s_472_478 * 2 = s_472_477
&&
    true
;

{
    u_472_478 * f_472_low60_0_low20_0 + v_472_478 * g_472_low60_0_low20_0 = f_472_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_478 * f_472_low60_0_low20_0 + s_472_478 * g_472_low60_0_low20_0 = g_472_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_6 + u_472_478 * (const 64 (2**21)) + v_472_478 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_6 + r_472_478 * (const 64 (2**21)) + s_472_478 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_6,
    f_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_6,
    g_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 478)) <=s delta, delta <=s (const 64 (1 + 2*478)),
    (const 64 (-(2**20))) <=s u_472_478, u_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_478, v_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_478, r_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_478, s_472_478 <=s (const 64 ((2**20))),
    u_472_478 + v_472_478 <=s (const 64 (2**20)),
    u_472_478 - v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 + v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 - v_472_478 <=s (const 64 (2**20)),
    r_472_478 + s_472_478 <=s (const 64 (2**20)),
    r_472_478 - s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 + s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 - s_472_478 <=s (const 64 (2**20)),
    u_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_472_478 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_477_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_5,
sint64 g_472_low60_0_low20_5,
sint64 f_472_low60_0_low20_6,
sint64 g_472_low60_0_low20_6,
sint64 u_472_477,
sint64 v_472_477,
sint64 r_472_477,
sint64 s_472_477,
sint64 u_472_478,
sint64 v_472_478,
sint64 r_472_478,
sint64 s_472_478,
bit ne
)={
    u_472_477 * f_472_low60_0_low20_0 + v_472_477 * g_472_low60_0_low20_0 = f_472_low60_0_low20_5 * (-(2**20)),
    r_472_477 * f_472_low60_0_low20_0 + s_472_477 * g_472_low60_0_low20_0 = g_472_low60_0_low20_5 * (-(2**20))
&&
    u_472_477 * f_472_low60_0_low20_0 + v_472_477 * g_472_low60_0_low20_0 = f_472_low60_0_low20_5 * (const 64 (-(2**20))),
    r_472_477 * f_472_low60_0_low20_0 + s_472_477 * g_472_low60_0_low20_0 = g_472_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_5 + u_472_477 * (const 64 (2**21)) + v_472_477 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_5 + r_472_477 * (const 64 (2**21)) + s_472_477 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_5,
    f_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_5,
    g_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 477)) <=s delta, delta <=s (const 64 (1 + 2*477)),
    (const 64 (-(2**20))) <=s u_472_477, u_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_477, v_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_477, r_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_477, s_472_477 <=s (const 64 ((2**20))),
    u_472_477 + v_472_477 <=s (const 64 (2**20)),
    u_472_477 - v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 + v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 - v_472_477 <=s (const 64 (2**20)),
    r_472_477 + s_472_477 <=s (const 64 (2**20)),
    r_472_477 - s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 + s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 - s_472_477 <=s (const 64 (2**20)),
    u_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_472_477 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step477

// premise b
assume
g_472_low60_0_low20_5 = 1 (mod 2)
&&
g_472_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_6 f_472_low60_0_low20_5;
mov u_472_478 u_472_477;
mov v_472_478 v_472_477;

add g_472_low60_0_low20_6 g_472_low60_0_low20_5 f_472_low60_0_low20_5;
asr g_472_low60_0_low20_6 g_472_low60_0_low20_6 1;
add r_472_478 r_472_477 u_472_477;
asr r_472_478 r_472_478 1;
add s_472_478 s_472_477 v_472_477;
asr s_472_478 s_472_478 1;
assert
    true
&&
    f_472_low60_0_low20_6 = f_472_low60_0_low20_5,
    u_472_478 = u_472_477,
    v_472_478 = v_472_477,
    g_472_low60_0_low20_6 * (const 64 2) = g_472_low60_0_low20_5 + f_472_low60_0_low20_5,
    r_472_478 * (const 64 2) = r_472_477 + u_472_477,
    s_472_478 * (const 64 2) = s_472_477 + v_472_477
;

assume
    f_472_low60_0_low20_6 = f_472_low60_0_low20_5,
    u_472_478 = u_472_477,
    v_472_478 = v_472_477,
    g_472_low60_0_low20_6 * 2 = g_472_low60_0_low20_5 + f_472_low60_0_low20_5,
    r_472_478 * 2 = r_472_477 + u_472_477,
    s_472_478 * 2 = s_472_477 + v_472_477
&&
    true
;

{
    u_472_478 * f_472_low60_0_low20_0 + v_472_478 * g_472_low60_0_low20_0 = f_472_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_478 * f_472_low60_0_low20_0 + s_472_478 * g_472_low60_0_low20_0 = g_472_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_6 + u_472_478 * (const 64 (2**21)) + v_472_478 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_6 + r_472_478 * (const 64 (2**21)) + s_472_478 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_6,
    f_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_6,
    g_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 478)) <=s delta, delta <=s (const 64 (1 + 2*478)),
    (const 64 (-(2**20))) <=s u_472_478, u_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_478, v_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_478, r_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_478, s_472_478 <=s (const 64 ((2**20))),
    u_472_478 + v_472_478 <=s (const 64 (2**20)),
    u_472_478 - v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 + v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 - v_472_478 <=s (const 64 (2**20)),
    r_472_478 + s_472_478 <=s (const 64 (2**20)),
    r_472_478 - s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 + s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 - s_472_478 <=s (const 64 (2**20)),
    u_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_472_478 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_477_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_5,
sint64 g_472_low60_0_low20_5,
sint64 f_472_low60_0_low20_6,
sint64 g_472_low60_0_low20_6,
sint64 u_472_477,
sint64 v_472_477,
sint64 r_472_477,
sint64 s_472_477,
sint64 u_472_478,
sint64 v_472_478,
sint64 r_472_478,
sint64 s_472_478,
bit ne
)={
    u_472_477 * f_472_low60_0_low20_0 + v_472_477 * g_472_low60_0_low20_0 = f_472_low60_0_low20_5 * (-(2**20)),
    r_472_477 * f_472_low60_0_low20_0 + s_472_477 * g_472_low60_0_low20_0 = g_472_low60_0_low20_5 * (-(2**20))
&&
    u_472_477 * f_472_low60_0_low20_0 + v_472_477 * g_472_low60_0_low20_0 = f_472_low60_0_low20_5 * (const 64 (-(2**20))),
    r_472_477 * f_472_low60_0_low20_0 + s_472_477 * g_472_low60_0_low20_0 = g_472_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_5 + u_472_477 * (const 64 (2**21)) + v_472_477 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_5 + r_472_477 * (const 64 (2**21)) + s_472_477 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_5,
    f_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_5,
    g_472_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 477)) <=s delta, delta <=s (const 64 (1 + 2*477)),
    (const 64 (-(2**20))) <=s u_472_477, u_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_477, v_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_477, r_472_477 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_477, s_472_477 <=s (const 64 ((2**20))),
    u_472_477 + v_472_477 <=s (const 64 (2**20)),
    u_472_477 - v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 + v_472_477 <=s (const 64 (2**20)),
    (const 64 0) - u_472_477 - v_472_477 <=s (const 64 (2**20)),
    r_472_477 + s_472_477 <=s (const 64 (2**20)),
    r_472_477 - s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 + s_472_477 <=s (const 64 (2**20)),
    (const 64 0) - r_472_477 - s_472_477 <=s (const 64 (2**20)),
    u_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_472_477 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_472_477 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step477

// premise c
assume
g_472_low60_0_low20_5 = 1 (mod 2)
&&
g_472_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_6 g_472_low60_0_low20_5;
mov u_472_478 r_472_477;
mov v_472_478 s_472_477;

subs dc g_472_low60_0_low20_6 g_472_low60_0_low20_5 f_472_low60_0_low20_5;
asr g_472_low60_0_low20_6 g_472_low60_0_low20_6 1;
subs dc r_472_478 r_472_477 u_472_477;
asr r_472_478 r_472_478 1;
subs dc s_472_478 s_472_477 v_472_477;
asr s_472_478 s_472_478 1;
assert
    true
&&
    f_472_low60_0_low20_6 = g_472_low60_0_low20_5,
    u_472_478 = r_472_477,
    v_472_478 = s_472_477,
    g_472_low60_0_low20_6 * (const 64 2) = g_472_low60_0_low20_5 - f_472_low60_0_low20_5,
    r_472_478 * (const 64 2) = r_472_477 - u_472_477,
    s_472_478 * (const 64 2) = s_472_477 - v_472_477
;

assume
    f_472_low60_0_low20_6 = g_472_low60_0_low20_5,
    u_472_478 = r_472_477,
    v_472_478 = s_472_477,
    g_472_low60_0_low20_6 * 2 = g_472_low60_0_low20_5 - f_472_low60_0_low20_5,
    r_472_478 * 2 = r_472_477 - u_472_477,
    s_472_478 * 2 = s_472_477 - v_472_477
&&
    true
;

{
    u_472_478 * f_472_low60_0_low20_0 + v_472_478 * g_472_low60_0_low20_0 = f_472_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_478 * f_472_low60_0_low20_0 + s_472_478 * g_472_low60_0_low20_0 = g_472_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_6 + u_472_478 * (const 64 (2**21)) + v_472_478 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_6 + r_472_478 * (const 64 (2**21)) + s_472_478 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_6,
    f_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_6,
    g_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 478)) <=s delta, delta <=s (const 64 (1 + 2*478)),
    (const 64 (-(2**20))) <=s u_472_478, u_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_478, v_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_478, r_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_478, s_472_478 <=s (const 64 ((2**20))),
    u_472_478 + v_472_478 <=s (const 64 (2**20)),
    u_472_478 - v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 + v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 - v_472_478 <=s (const 64 (2**20)),
    r_472_478 + s_472_478 <=s (const 64 (2**20)),
    r_472_478 - s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 + s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 - s_472_478 <=s (const 64 (2**20)),
    u_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_472_478 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_478_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_6,
sint64 g_472_low60_0_low20_6,
sint64 f_472_low60_0_low20_7,
sint64 g_472_low60_0_low20_7,
sint64 u_472_478,
sint64 v_472_478,
sint64 r_472_478,
sint64 s_472_478,
sint64 u_472_479,
sint64 v_472_479,
sint64 r_472_479,
sint64 s_472_479,
bit ne
)={
    u_472_478 * f_472_low60_0_low20_0 + v_472_478 * g_472_low60_0_low20_0 = f_472_low60_0_low20_6 * (-(2**20)),
    r_472_478 * f_472_low60_0_low20_0 + s_472_478 * g_472_low60_0_low20_0 = g_472_low60_0_low20_6 * (-(2**20))
&&
    u_472_478 * f_472_low60_0_low20_0 + v_472_478 * g_472_low60_0_low20_0 = f_472_low60_0_low20_6 * (const 64 (-(2**20))),
    r_472_478 * f_472_low60_0_low20_0 + s_472_478 * g_472_low60_0_low20_0 = g_472_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_6 + u_472_478 * (const 64 (2**21)) + v_472_478 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_6 + r_472_478 * (const 64 (2**21)) + s_472_478 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_6,
    f_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_6,
    g_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 478)) <=s delta, delta <=s (const 64 (1 + 2*478)),
    (const 64 (-(2**20))) <=s u_472_478, u_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_478, v_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_478, r_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_478, s_472_478 <=s (const 64 ((2**20))),
    u_472_478 + v_472_478 <=s (const 64 (2**20)),
    u_472_478 - v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 + v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 - v_472_478 <=s (const 64 (2**20)),
    r_472_478 + s_472_478 <=s (const 64 (2**20)),
    r_472_478 - s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 + s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 - s_472_478 <=s (const 64 (2**20)),
    u_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_472_478 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step478

// premise a
assume
g_472_low60_0_low20_6 = 0 (mod 2)
&&
g_472_low60_0_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_7 f_472_low60_0_low20_6;
mov u_472_479 u_472_478;
mov v_472_479 v_472_478;

asr g_472_low60_0_low20_7 g_472_low60_0_low20_6 1;
asr r_472_479 r_472_478 1;
asr s_472_479 s_472_478 1;
assert
    true
&&
    f_472_low60_0_low20_7 = f_472_low60_0_low20_6,
    u_472_479 = u_472_478,
    v_472_479 = v_472_478,
    g_472_low60_0_low20_7 * (const 64 2) = g_472_low60_0_low20_6,
    r_472_479 * (const 64 2) = r_472_478,
    s_472_479 * (const 64 2) = s_472_478
;

assume
    f_472_low60_0_low20_7 = f_472_low60_0_low20_6,
    u_472_479 = u_472_478,
    v_472_479 = v_472_478,
    g_472_low60_0_low20_7 * 2 = g_472_low60_0_low20_6,
    r_472_479 * 2 = r_472_478,
    s_472_479 * 2 = s_472_478
&&
    true
;

{
    u_472_479 * f_472_low60_0_low20_0 + v_472_479 * g_472_low60_0_low20_0 = f_472_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_479 * f_472_low60_0_low20_0 + s_472_479 * g_472_low60_0_low20_0 = g_472_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_7 + u_472_479 * (const 64 (2**21)) + v_472_479 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_7 + r_472_479 * (const 64 (2**21)) + s_472_479 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_7,
    f_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_7,
    g_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 479)) <=s delta, delta <=s (const 64 (1 + 2*479)),
    (const 64 (-(2**20))) <=s u_472_479, u_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_479, v_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_479, r_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_479, s_472_479 <=s (const 64 ((2**20))),
    u_472_479 + v_472_479 <=s (const 64 (2**20)),
    u_472_479 - v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 + v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 - v_472_479 <=s (const 64 (2**20)),
    r_472_479 + s_472_479 <=s (const 64 (2**20)),
    r_472_479 - s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 + s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 - s_472_479 <=s (const 64 (2**20)),
    u_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_472_479 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_478_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_6,
sint64 g_472_low60_0_low20_6,
sint64 f_472_low60_0_low20_7,
sint64 g_472_low60_0_low20_7,
sint64 u_472_478,
sint64 v_472_478,
sint64 r_472_478,
sint64 s_472_478,
sint64 u_472_479,
sint64 v_472_479,
sint64 r_472_479,
sint64 s_472_479,
bit ne
)={
    u_472_478 * f_472_low60_0_low20_0 + v_472_478 * g_472_low60_0_low20_0 = f_472_low60_0_low20_6 * (-(2**20)),
    r_472_478 * f_472_low60_0_low20_0 + s_472_478 * g_472_low60_0_low20_0 = g_472_low60_0_low20_6 * (-(2**20))
&&
    u_472_478 * f_472_low60_0_low20_0 + v_472_478 * g_472_low60_0_low20_0 = f_472_low60_0_low20_6 * (const 64 (-(2**20))),
    r_472_478 * f_472_low60_0_low20_0 + s_472_478 * g_472_low60_0_low20_0 = g_472_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_6 + u_472_478 * (const 64 (2**21)) + v_472_478 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_6 + r_472_478 * (const 64 (2**21)) + s_472_478 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_6,
    f_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_6,
    g_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 478)) <=s delta, delta <=s (const 64 (1 + 2*478)),
    (const 64 (-(2**20))) <=s u_472_478, u_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_478, v_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_478, r_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_478, s_472_478 <=s (const 64 ((2**20))),
    u_472_478 + v_472_478 <=s (const 64 (2**20)),
    u_472_478 - v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 + v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 - v_472_478 <=s (const 64 (2**20)),
    r_472_478 + s_472_478 <=s (const 64 (2**20)),
    r_472_478 - s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 + s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 - s_472_478 <=s (const 64 (2**20)),
    u_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_472_478 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step478

// premise b
assume
g_472_low60_0_low20_6 = 1 (mod 2)
&&
g_472_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_7 f_472_low60_0_low20_6;
mov u_472_479 u_472_478;
mov v_472_479 v_472_478;

add g_472_low60_0_low20_7 g_472_low60_0_low20_6 f_472_low60_0_low20_6;
asr g_472_low60_0_low20_7 g_472_low60_0_low20_7 1;
add r_472_479 r_472_478 u_472_478;
asr r_472_479 r_472_479 1;
add s_472_479 s_472_478 v_472_478;
asr s_472_479 s_472_479 1;
assert
    true
&&
    f_472_low60_0_low20_7 = f_472_low60_0_low20_6,
    u_472_479 = u_472_478,
    v_472_479 = v_472_478,
    g_472_low60_0_low20_7 * (const 64 2) = g_472_low60_0_low20_6 + f_472_low60_0_low20_6,
    r_472_479 * (const 64 2) = r_472_478 + u_472_478,
    s_472_479 * (const 64 2) = s_472_478 + v_472_478
;

assume
    f_472_low60_0_low20_7 = f_472_low60_0_low20_6,
    u_472_479 = u_472_478,
    v_472_479 = v_472_478,
    g_472_low60_0_low20_7 * 2 = g_472_low60_0_low20_6 + f_472_low60_0_low20_6,
    r_472_479 * 2 = r_472_478 + u_472_478,
    s_472_479 * 2 = s_472_478 + v_472_478
&&
    true
;

{
    u_472_479 * f_472_low60_0_low20_0 + v_472_479 * g_472_low60_0_low20_0 = f_472_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_479 * f_472_low60_0_low20_0 + s_472_479 * g_472_low60_0_low20_0 = g_472_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_7 + u_472_479 * (const 64 (2**21)) + v_472_479 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_7 + r_472_479 * (const 64 (2**21)) + s_472_479 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_7,
    f_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_7,
    g_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 479)) <=s delta, delta <=s (const 64 (1 + 2*479)),
    (const 64 (-(2**20))) <=s u_472_479, u_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_479, v_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_479, r_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_479, s_472_479 <=s (const 64 ((2**20))),
    u_472_479 + v_472_479 <=s (const 64 (2**20)),
    u_472_479 - v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 + v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 - v_472_479 <=s (const 64 (2**20)),
    r_472_479 + s_472_479 <=s (const 64 (2**20)),
    r_472_479 - s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 + s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 - s_472_479 <=s (const 64 (2**20)),
    u_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_472_479 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_478_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_6,
sint64 g_472_low60_0_low20_6,
sint64 f_472_low60_0_low20_7,
sint64 g_472_low60_0_low20_7,
sint64 u_472_478,
sint64 v_472_478,
sint64 r_472_478,
sint64 s_472_478,
sint64 u_472_479,
sint64 v_472_479,
sint64 r_472_479,
sint64 s_472_479,
bit ne
)={
    u_472_478 * f_472_low60_0_low20_0 + v_472_478 * g_472_low60_0_low20_0 = f_472_low60_0_low20_6 * (-(2**20)),
    r_472_478 * f_472_low60_0_low20_0 + s_472_478 * g_472_low60_0_low20_0 = g_472_low60_0_low20_6 * (-(2**20))
&&
    u_472_478 * f_472_low60_0_low20_0 + v_472_478 * g_472_low60_0_low20_0 = f_472_low60_0_low20_6 * (const 64 (-(2**20))),
    r_472_478 * f_472_low60_0_low20_0 + s_472_478 * g_472_low60_0_low20_0 = g_472_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_6 + u_472_478 * (const 64 (2**21)) + v_472_478 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_6 + r_472_478 * (const 64 (2**21)) + s_472_478 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_6,
    f_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_6,
    g_472_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 478)) <=s delta, delta <=s (const 64 (1 + 2*478)),
    (const 64 (-(2**20))) <=s u_472_478, u_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_478, v_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_478, r_472_478 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_478, s_472_478 <=s (const 64 ((2**20))),
    u_472_478 + v_472_478 <=s (const 64 (2**20)),
    u_472_478 - v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 + v_472_478 <=s (const 64 (2**20)),
    (const 64 0) - u_472_478 - v_472_478 <=s (const 64 (2**20)),
    r_472_478 + s_472_478 <=s (const 64 (2**20)),
    r_472_478 - s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 + s_472_478 <=s (const 64 (2**20)),
    (const 64 0) - r_472_478 - s_472_478 <=s (const 64 (2**20)),
    u_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_472_478 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_472_478 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step478

// premise c
assume
g_472_low60_0_low20_6 = 1 (mod 2)
&&
g_472_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_7 g_472_low60_0_low20_6;
mov u_472_479 r_472_478;
mov v_472_479 s_472_478;

subs dc g_472_low60_0_low20_7 g_472_low60_0_low20_6 f_472_low60_0_low20_6;
asr g_472_low60_0_low20_7 g_472_low60_0_low20_7 1;
subs dc r_472_479 r_472_478 u_472_478;
asr r_472_479 r_472_479 1;
subs dc s_472_479 s_472_478 v_472_478;
asr s_472_479 s_472_479 1;
assert
    true
&&
    f_472_low60_0_low20_7 = g_472_low60_0_low20_6,
    u_472_479 = r_472_478,
    v_472_479 = s_472_478,
    g_472_low60_0_low20_7 * (const 64 2) = g_472_low60_0_low20_6 - f_472_low60_0_low20_6,
    r_472_479 * (const 64 2) = r_472_478 - u_472_478,
    s_472_479 * (const 64 2) = s_472_478 - v_472_478
;

assume
    f_472_low60_0_low20_7 = g_472_low60_0_low20_6,
    u_472_479 = r_472_478,
    v_472_479 = s_472_478,
    g_472_low60_0_low20_7 * 2 = g_472_low60_0_low20_6 - f_472_low60_0_low20_6,
    r_472_479 * 2 = r_472_478 - u_472_478,
    s_472_479 * 2 = s_472_478 - v_472_478
&&
    true
;

{
    u_472_479 * f_472_low60_0_low20_0 + v_472_479 * g_472_low60_0_low20_0 = f_472_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_479 * f_472_low60_0_low20_0 + s_472_479 * g_472_low60_0_low20_0 = g_472_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_7 + u_472_479 * (const 64 (2**21)) + v_472_479 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_7 + r_472_479 * (const 64 (2**21)) + s_472_479 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_7,
    f_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_7,
    g_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 479)) <=s delta, delta <=s (const 64 (1 + 2*479)),
    (const 64 (-(2**20))) <=s u_472_479, u_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_479, v_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_479, r_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_479, s_472_479 <=s (const 64 ((2**20))),
    u_472_479 + v_472_479 <=s (const 64 (2**20)),
    u_472_479 - v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 + v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 - v_472_479 <=s (const 64 (2**20)),
    r_472_479 + s_472_479 <=s (const 64 (2**20)),
    r_472_479 - s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 + s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 - s_472_479 <=s (const 64 (2**20)),
    u_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_472_479 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_479_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_7,
sint64 g_472_low60_0_low20_7,
sint64 f_472_low60_0_low20_8,
sint64 g_472_low60_0_low20_8,
sint64 u_472_479,
sint64 v_472_479,
sint64 r_472_479,
sint64 s_472_479,
sint64 u_472_480,
sint64 v_472_480,
sint64 r_472_480,
sint64 s_472_480,
bit ne
)={
    u_472_479 * f_472_low60_0_low20_0 + v_472_479 * g_472_low60_0_low20_0 = f_472_low60_0_low20_7 * (-(2**20)),
    r_472_479 * f_472_low60_0_low20_0 + s_472_479 * g_472_low60_0_low20_0 = g_472_low60_0_low20_7 * (-(2**20))
&&
    u_472_479 * f_472_low60_0_low20_0 + v_472_479 * g_472_low60_0_low20_0 = f_472_low60_0_low20_7 * (const 64 (-(2**20))),
    r_472_479 * f_472_low60_0_low20_0 + s_472_479 * g_472_low60_0_low20_0 = g_472_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_7 + u_472_479 * (const 64 (2**21)) + v_472_479 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_7 + r_472_479 * (const 64 (2**21)) + s_472_479 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_7,
    f_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_7,
    g_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 479)) <=s delta, delta <=s (const 64 (1 + 2*479)),
    (const 64 (-(2**20))) <=s u_472_479, u_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_479, v_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_479, r_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_479, s_472_479 <=s (const 64 ((2**20))),
    u_472_479 + v_472_479 <=s (const 64 (2**20)),
    u_472_479 - v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 + v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 - v_472_479 <=s (const 64 (2**20)),
    r_472_479 + s_472_479 <=s (const 64 (2**20)),
    r_472_479 - s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 + s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 - s_472_479 <=s (const 64 (2**20)),
    u_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_472_479 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step479

// premise a
assume
g_472_low60_0_low20_7 = 0 (mod 2)
&&
g_472_low60_0_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_8 f_472_low60_0_low20_7;
mov u_472_480 u_472_479;
mov v_472_480 v_472_479;

asr g_472_low60_0_low20_8 g_472_low60_0_low20_7 1;
asr r_472_480 r_472_479 1;
asr s_472_480 s_472_479 1;
assert
    true
&&
    f_472_low60_0_low20_8 = f_472_low60_0_low20_7,
    u_472_480 = u_472_479,
    v_472_480 = v_472_479,
    g_472_low60_0_low20_8 * (const 64 2) = g_472_low60_0_low20_7,
    r_472_480 * (const 64 2) = r_472_479,
    s_472_480 * (const 64 2) = s_472_479
;

assume
    f_472_low60_0_low20_8 = f_472_low60_0_low20_7,
    u_472_480 = u_472_479,
    v_472_480 = v_472_479,
    g_472_low60_0_low20_8 * 2 = g_472_low60_0_low20_7,
    r_472_480 * 2 = r_472_479,
    s_472_480 * 2 = s_472_479
&&
    true
;

{
    u_472_480 * f_472_low60_0_low20_0 + v_472_480 * g_472_low60_0_low20_0 = f_472_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_480 * f_472_low60_0_low20_0 + s_472_480 * g_472_low60_0_low20_0 = g_472_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_8 + u_472_480 * (const 64 (2**21)) + v_472_480 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_8 + r_472_480 * (const 64 (2**21)) + s_472_480 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_8,
    f_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_8,
    g_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 480)) <=s delta, delta <=s (const 64 (1 + 2*480)),
    (const 64 (-(2**20))) <=s u_472_480, u_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_480, v_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_480, r_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_480, s_472_480 <=s (const 64 ((2**20))),
    u_472_480 + v_472_480 <=s (const 64 (2**20)),
    u_472_480 - v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 + v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 - v_472_480 <=s (const 64 (2**20)),
    r_472_480 + s_472_480 <=s (const 64 (2**20)),
    r_472_480 - s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 + s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 - s_472_480 <=s (const 64 (2**20)),
    u_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_472_480 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_479_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_7,
sint64 g_472_low60_0_low20_7,
sint64 f_472_low60_0_low20_8,
sint64 g_472_low60_0_low20_8,
sint64 u_472_479,
sint64 v_472_479,
sint64 r_472_479,
sint64 s_472_479,
sint64 u_472_480,
sint64 v_472_480,
sint64 r_472_480,
sint64 s_472_480,
bit ne
)={
    u_472_479 * f_472_low60_0_low20_0 + v_472_479 * g_472_low60_0_low20_0 = f_472_low60_0_low20_7 * (-(2**20)),
    r_472_479 * f_472_low60_0_low20_0 + s_472_479 * g_472_low60_0_low20_0 = g_472_low60_0_low20_7 * (-(2**20))
&&
    u_472_479 * f_472_low60_0_low20_0 + v_472_479 * g_472_low60_0_low20_0 = f_472_low60_0_low20_7 * (const 64 (-(2**20))),
    r_472_479 * f_472_low60_0_low20_0 + s_472_479 * g_472_low60_0_low20_0 = g_472_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_7 + u_472_479 * (const 64 (2**21)) + v_472_479 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_7 + r_472_479 * (const 64 (2**21)) + s_472_479 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_7,
    f_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_7,
    g_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 479)) <=s delta, delta <=s (const 64 (1 + 2*479)),
    (const 64 (-(2**20))) <=s u_472_479, u_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_479, v_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_479, r_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_479, s_472_479 <=s (const 64 ((2**20))),
    u_472_479 + v_472_479 <=s (const 64 (2**20)),
    u_472_479 - v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 + v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 - v_472_479 <=s (const 64 (2**20)),
    r_472_479 + s_472_479 <=s (const 64 (2**20)),
    r_472_479 - s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 + s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 - s_472_479 <=s (const 64 (2**20)),
    u_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_472_479 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step479

// premise b
assume
g_472_low60_0_low20_7 = 1 (mod 2)
&&
g_472_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_8 f_472_low60_0_low20_7;
mov u_472_480 u_472_479;
mov v_472_480 v_472_479;

add g_472_low60_0_low20_8 g_472_low60_0_low20_7 f_472_low60_0_low20_7;
asr g_472_low60_0_low20_8 g_472_low60_0_low20_8 1;
add r_472_480 r_472_479 u_472_479;
asr r_472_480 r_472_480 1;
add s_472_480 s_472_479 v_472_479;
asr s_472_480 s_472_480 1;
assert
    true
&&
    f_472_low60_0_low20_8 = f_472_low60_0_low20_7,
    u_472_480 = u_472_479,
    v_472_480 = v_472_479,
    g_472_low60_0_low20_8 * (const 64 2) = g_472_low60_0_low20_7 + f_472_low60_0_low20_7,
    r_472_480 * (const 64 2) = r_472_479 + u_472_479,
    s_472_480 * (const 64 2) = s_472_479 + v_472_479
;

assume
    f_472_low60_0_low20_8 = f_472_low60_0_low20_7,
    u_472_480 = u_472_479,
    v_472_480 = v_472_479,
    g_472_low60_0_low20_8 * 2 = g_472_low60_0_low20_7 + f_472_low60_0_low20_7,
    r_472_480 * 2 = r_472_479 + u_472_479,
    s_472_480 * 2 = s_472_479 + v_472_479
&&
    true
;

{
    u_472_480 * f_472_low60_0_low20_0 + v_472_480 * g_472_low60_0_low20_0 = f_472_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_480 * f_472_low60_0_low20_0 + s_472_480 * g_472_low60_0_low20_0 = g_472_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_8 + u_472_480 * (const 64 (2**21)) + v_472_480 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_8 + r_472_480 * (const 64 (2**21)) + s_472_480 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_8,
    f_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_8,
    g_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 480)) <=s delta, delta <=s (const 64 (1 + 2*480)),
    (const 64 (-(2**20))) <=s u_472_480, u_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_480, v_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_480, r_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_480, s_472_480 <=s (const 64 ((2**20))),
    u_472_480 + v_472_480 <=s (const 64 (2**20)),
    u_472_480 - v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 + v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 - v_472_480 <=s (const 64 (2**20)),
    r_472_480 + s_472_480 <=s (const 64 (2**20)),
    r_472_480 - s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 + s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 - s_472_480 <=s (const 64 (2**20)),
    u_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_472_480 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_479_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_7,
sint64 g_472_low60_0_low20_7,
sint64 f_472_low60_0_low20_8,
sint64 g_472_low60_0_low20_8,
sint64 u_472_479,
sint64 v_472_479,
sint64 r_472_479,
sint64 s_472_479,
sint64 u_472_480,
sint64 v_472_480,
sint64 r_472_480,
sint64 s_472_480,
bit ne
)={
    u_472_479 * f_472_low60_0_low20_0 + v_472_479 * g_472_low60_0_low20_0 = f_472_low60_0_low20_7 * (-(2**20)),
    r_472_479 * f_472_low60_0_low20_0 + s_472_479 * g_472_low60_0_low20_0 = g_472_low60_0_low20_7 * (-(2**20))
&&
    u_472_479 * f_472_low60_0_low20_0 + v_472_479 * g_472_low60_0_low20_0 = f_472_low60_0_low20_7 * (const 64 (-(2**20))),
    r_472_479 * f_472_low60_0_low20_0 + s_472_479 * g_472_low60_0_low20_0 = g_472_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_7 + u_472_479 * (const 64 (2**21)) + v_472_479 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_7 + r_472_479 * (const 64 (2**21)) + s_472_479 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_7,
    f_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_7,
    g_472_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 479)) <=s delta, delta <=s (const 64 (1 + 2*479)),
    (const 64 (-(2**20))) <=s u_472_479, u_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_479, v_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_479, r_472_479 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_479, s_472_479 <=s (const 64 ((2**20))),
    u_472_479 + v_472_479 <=s (const 64 (2**20)),
    u_472_479 - v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 + v_472_479 <=s (const 64 (2**20)),
    (const 64 0) - u_472_479 - v_472_479 <=s (const 64 (2**20)),
    r_472_479 + s_472_479 <=s (const 64 (2**20)),
    r_472_479 - s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 + s_472_479 <=s (const 64 (2**20)),
    (const 64 0) - r_472_479 - s_472_479 <=s (const 64 (2**20)),
    u_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_472_479 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_472_479 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step479

// premise c
assume
g_472_low60_0_low20_7 = 1 (mod 2)
&&
g_472_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_8 g_472_low60_0_low20_7;
mov u_472_480 r_472_479;
mov v_472_480 s_472_479;

subs dc g_472_low60_0_low20_8 g_472_low60_0_low20_7 f_472_low60_0_low20_7;
asr g_472_low60_0_low20_8 g_472_low60_0_low20_8 1;
subs dc r_472_480 r_472_479 u_472_479;
asr r_472_480 r_472_480 1;
subs dc s_472_480 s_472_479 v_472_479;
asr s_472_480 s_472_480 1;
assert
    true
&&
    f_472_low60_0_low20_8 = g_472_low60_0_low20_7,
    u_472_480 = r_472_479,
    v_472_480 = s_472_479,
    g_472_low60_0_low20_8 * (const 64 2) = g_472_low60_0_low20_7 - f_472_low60_0_low20_7,
    r_472_480 * (const 64 2) = r_472_479 - u_472_479,
    s_472_480 * (const 64 2) = s_472_479 - v_472_479
;

assume
    f_472_low60_0_low20_8 = g_472_low60_0_low20_7,
    u_472_480 = r_472_479,
    v_472_480 = s_472_479,
    g_472_low60_0_low20_8 * 2 = g_472_low60_0_low20_7 - f_472_low60_0_low20_7,
    r_472_480 * 2 = r_472_479 - u_472_479,
    s_472_480 * 2 = s_472_479 - v_472_479
&&
    true
;

{
    u_472_480 * f_472_low60_0_low20_0 + v_472_480 * g_472_low60_0_low20_0 = f_472_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_480 * f_472_low60_0_low20_0 + s_472_480 * g_472_low60_0_low20_0 = g_472_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_8 + u_472_480 * (const 64 (2**21)) + v_472_480 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_8 + r_472_480 * (const 64 (2**21)) + s_472_480 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_8,
    f_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_8,
    g_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 480)) <=s delta, delta <=s (const 64 (1 + 2*480)),
    (const 64 (-(2**20))) <=s u_472_480, u_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_480, v_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_480, r_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_480, s_472_480 <=s (const 64 ((2**20))),
    u_472_480 + v_472_480 <=s (const 64 (2**20)),
    u_472_480 - v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 + v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 - v_472_480 <=s (const 64 (2**20)),
    r_472_480 + s_472_480 <=s (const 64 (2**20)),
    r_472_480 - s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 + s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 - s_472_480 <=s (const 64 (2**20)),
    u_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_472_480 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_480_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_8,
sint64 g_472_low60_0_low20_8,
sint64 f_472_low60_0_low20_9,
sint64 g_472_low60_0_low20_9,
sint64 u_472_480,
sint64 v_472_480,
sint64 r_472_480,
sint64 s_472_480,
sint64 u_472_481,
sint64 v_472_481,
sint64 r_472_481,
sint64 s_472_481,
bit ne
)={
    u_472_480 * f_472_low60_0_low20_0 + v_472_480 * g_472_low60_0_low20_0 = f_472_low60_0_low20_8 * (-(2**20)),
    r_472_480 * f_472_low60_0_low20_0 + s_472_480 * g_472_low60_0_low20_0 = g_472_low60_0_low20_8 * (-(2**20))
&&
    u_472_480 * f_472_low60_0_low20_0 + v_472_480 * g_472_low60_0_low20_0 = f_472_low60_0_low20_8 * (const 64 (-(2**20))),
    r_472_480 * f_472_low60_0_low20_0 + s_472_480 * g_472_low60_0_low20_0 = g_472_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_8 + u_472_480 * (const 64 (2**21)) + v_472_480 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_8 + r_472_480 * (const 64 (2**21)) + s_472_480 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_8,
    f_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_8,
    g_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 480)) <=s delta, delta <=s (const 64 (1 + 2*480)),
    (const 64 (-(2**20))) <=s u_472_480, u_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_480, v_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_480, r_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_480, s_472_480 <=s (const 64 ((2**20))),
    u_472_480 + v_472_480 <=s (const 64 (2**20)),
    u_472_480 - v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 + v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 - v_472_480 <=s (const 64 (2**20)),
    r_472_480 + s_472_480 <=s (const 64 (2**20)),
    r_472_480 - s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 + s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 - s_472_480 <=s (const 64 (2**20)),
    u_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_472_480 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step480

// premise a
assume
g_472_low60_0_low20_8 = 0 (mod 2)
&&
g_472_low60_0_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_9 f_472_low60_0_low20_8;
mov u_472_481 u_472_480;
mov v_472_481 v_472_480;

asr g_472_low60_0_low20_9 g_472_low60_0_low20_8 1;
asr r_472_481 r_472_480 1;
asr s_472_481 s_472_480 1;
assert
    true
&&
    f_472_low60_0_low20_9 = f_472_low60_0_low20_8,
    u_472_481 = u_472_480,
    v_472_481 = v_472_480,
    g_472_low60_0_low20_9 * (const 64 2) = g_472_low60_0_low20_8,
    r_472_481 * (const 64 2) = r_472_480,
    s_472_481 * (const 64 2) = s_472_480
;

assume
    f_472_low60_0_low20_9 = f_472_low60_0_low20_8,
    u_472_481 = u_472_480,
    v_472_481 = v_472_480,
    g_472_low60_0_low20_9 * 2 = g_472_low60_0_low20_8,
    r_472_481 * 2 = r_472_480,
    s_472_481 * 2 = s_472_480
&&
    true
;

{
    u_472_481 * f_472_low60_0_low20_0 + v_472_481 * g_472_low60_0_low20_0 = f_472_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_481 * f_472_low60_0_low20_0 + s_472_481 * g_472_low60_0_low20_0 = g_472_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_9 + u_472_481 * (const 64 (2**21)) + v_472_481 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_9 + r_472_481 * (const 64 (2**21)) + s_472_481 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_9,
    f_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_9,
    g_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 481)) <=s delta, delta <=s (const 64 (1 + 2*481)),
    (const 64 (-(2**20))) <=s u_472_481, u_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_481, v_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_481, r_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_481, s_472_481 <=s (const 64 ((2**20))),
    u_472_481 + v_472_481 <=s (const 64 (2**20)),
    u_472_481 - v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 + v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 - v_472_481 <=s (const 64 (2**20)),
    r_472_481 + s_472_481 <=s (const 64 (2**20)),
    r_472_481 - s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 + s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 - s_472_481 <=s (const 64 (2**20)),
    u_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_472_481 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_480_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_8,
sint64 g_472_low60_0_low20_8,
sint64 f_472_low60_0_low20_9,
sint64 g_472_low60_0_low20_9,
sint64 u_472_480,
sint64 v_472_480,
sint64 r_472_480,
sint64 s_472_480,
sint64 u_472_481,
sint64 v_472_481,
sint64 r_472_481,
sint64 s_472_481,
bit ne
)={
    u_472_480 * f_472_low60_0_low20_0 + v_472_480 * g_472_low60_0_low20_0 = f_472_low60_0_low20_8 * (-(2**20)),
    r_472_480 * f_472_low60_0_low20_0 + s_472_480 * g_472_low60_0_low20_0 = g_472_low60_0_low20_8 * (-(2**20))
&&
    u_472_480 * f_472_low60_0_low20_0 + v_472_480 * g_472_low60_0_low20_0 = f_472_low60_0_low20_8 * (const 64 (-(2**20))),
    r_472_480 * f_472_low60_0_low20_0 + s_472_480 * g_472_low60_0_low20_0 = g_472_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_8 + u_472_480 * (const 64 (2**21)) + v_472_480 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_8 + r_472_480 * (const 64 (2**21)) + s_472_480 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_8,
    f_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_8,
    g_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 480)) <=s delta, delta <=s (const 64 (1 + 2*480)),
    (const 64 (-(2**20))) <=s u_472_480, u_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_480, v_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_480, r_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_480, s_472_480 <=s (const 64 ((2**20))),
    u_472_480 + v_472_480 <=s (const 64 (2**20)),
    u_472_480 - v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 + v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 - v_472_480 <=s (const 64 (2**20)),
    r_472_480 + s_472_480 <=s (const 64 (2**20)),
    r_472_480 - s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 + s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 - s_472_480 <=s (const 64 (2**20)),
    u_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_472_480 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step480

// premise b
assume
g_472_low60_0_low20_8 = 1 (mod 2)
&&
g_472_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_9 f_472_low60_0_low20_8;
mov u_472_481 u_472_480;
mov v_472_481 v_472_480;

add g_472_low60_0_low20_9 g_472_low60_0_low20_8 f_472_low60_0_low20_8;
asr g_472_low60_0_low20_9 g_472_low60_0_low20_9 1;
add r_472_481 r_472_480 u_472_480;
asr r_472_481 r_472_481 1;
add s_472_481 s_472_480 v_472_480;
asr s_472_481 s_472_481 1;
assert
    true
&&
    f_472_low60_0_low20_9 = f_472_low60_0_low20_8,
    u_472_481 = u_472_480,
    v_472_481 = v_472_480,
    g_472_low60_0_low20_9 * (const 64 2) = g_472_low60_0_low20_8 + f_472_low60_0_low20_8,
    r_472_481 * (const 64 2) = r_472_480 + u_472_480,
    s_472_481 * (const 64 2) = s_472_480 + v_472_480
;

assume
    f_472_low60_0_low20_9 = f_472_low60_0_low20_8,
    u_472_481 = u_472_480,
    v_472_481 = v_472_480,
    g_472_low60_0_low20_9 * 2 = g_472_low60_0_low20_8 + f_472_low60_0_low20_8,
    r_472_481 * 2 = r_472_480 + u_472_480,
    s_472_481 * 2 = s_472_480 + v_472_480
&&
    true
;

{
    u_472_481 * f_472_low60_0_low20_0 + v_472_481 * g_472_low60_0_low20_0 = f_472_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_481 * f_472_low60_0_low20_0 + s_472_481 * g_472_low60_0_low20_0 = g_472_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_9 + u_472_481 * (const 64 (2**21)) + v_472_481 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_9 + r_472_481 * (const 64 (2**21)) + s_472_481 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_9,
    f_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_9,
    g_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 481)) <=s delta, delta <=s (const 64 (1 + 2*481)),
    (const 64 (-(2**20))) <=s u_472_481, u_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_481, v_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_481, r_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_481, s_472_481 <=s (const 64 ((2**20))),
    u_472_481 + v_472_481 <=s (const 64 (2**20)),
    u_472_481 - v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 + v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 - v_472_481 <=s (const 64 (2**20)),
    r_472_481 + s_472_481 <=s (const 64 (2**20)),
    r_472_481 - s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 + s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 - s_472_481 <=s (const 64 (2**20)),
    u_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_472_481 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_480_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_8,
sint64 g_472_low60_0_low20_8,
sint64 f_472_low60_0_low20_9,
sint64 g_472_low60_0_low20_9,
sint64 u_472_480,
sint64 v_472_480,
sint64 r_472_480,
sint64 s_472_480,
sint64 u_472_481,
sint64 v_472_481,
sint64 r_472_481,
sint64 s_472_481,
bit ne
)={
    u_472_480 * f_472_low60_0_low20_0 + v_472_480 * g_472_low60_0_low20_0 = f_472_low60_0_low20_8 * (-(2**20)),
    r_472_480 * f_472_low60_0_low20_0 + s_472_480 * g_472_low60_0_low20_0 = g_472_low60_0_low20_8 * (-(2**20))
&&
    u_472_480 * f_472_low60_0_low20_0 + v_472_480 * g_472_low60_0_low20_0 = f_472_low60_0_low20_8 * (const 64 (-(2**20))),
    r_472_480 * f_472_low60_0_low20_0 + s_472_480 * g_472_low60_0_low20_0 = g_472_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_8 + u_472_480 * (const 64 (2**21)) + v_472_480 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_8 + r_472_480 * (const 64 (2**21)) + s_472_480 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_8,
    f_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_8,
    g_472_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 480)) <=s delta, delta <=s (const 64 (1 + 2*480)),
    (const 64 (-(2**20))) <=s u_472_480, u_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_480, v_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_480, r_472_480 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_480, s_472_480 <=s (const 64 ((2**20))),
    u_472_480 + v_472_480 <=s (const 64 (2**20)),
    u_472_480 - v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 + v_472_480 <=s (const 64 (2**20)),
    (const 64 0) - u_472_480 - v_472_480 <=s (const 64 (2**20)),
    r_472_480 + s_472_480 <=s (const 64 (2**20)),
    r_472_480 - s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 + s_472_480 <=s (const 64 (2**20)),
    (const 64 0) - r_472_480 - s_472_480 <=s (const 64 (2**20)),
    u_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_472_480 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_472_480 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step480

// premise c
assume
g_472_low60_0_low20_8 = 1 (mod 2)
&&
g_472_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_9 g_472_low60_0_low20_8;
mov u_472_481 r_472_480;
mov v_472_481 s_472_480;

subs dc g_472_low60_0_low20_9 g_472_low60_0_low20_8 f_472_low60_0_low20_8;
asr g_472_low60_0_low20_9 g_472_low60_0_low20_9 1;
subs dc r_472_481 r_472_480 u_472_480;
asr r_472_481 r_472_481 1;
subs dc s_472_481 s_472_480 v_472_480;
asr s_472_481 s_472_481 1;
assert
    true
&&
    f_472_low60_0_low20_9 = g_472_low60_0_low20_8,
    u_472_481 = r_472_480,
    v_472_481 = s_472_480,
    g_472_low60_0_low20_9 * (const 64 2) = g_472_low60_0_low20_8 - f_472_low60_0_low20_8,
    r_472_481 * (const 64 2) = r_472_480 - u_472_480,
    s_472_481 * (const 64 2) = s_472_480 - v_472_480
;

assume
    f_472_low60_0_low20_9 = g_472_low60_0_low20_8,
    u_472_481 = r_472_480,
    v_472_481 = s_472_480,
    g_472_low60_0_low20_9 * 2 = g_472_low60_0_low20_8 - f_472_low60_0_low20_8,
    r_472_481 * 2 = r_472_480 - u_472_480,
    s_472_481 * 2 = s_472_480 - v_472_480
&&
    true
;

{
    u_472_481 * f_472_low60_0_low20_0 + v_472_481 * g_472_low60_0_low20_0 = f_472_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_481 * f_472_low60_0_low20_0 + s_472_481 * g_472_low60_0_low20_0 = g_472_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_9 + u_472_481 * (const 64 (2**21)) + v_472_481 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_9 + r_472_481 * (const 64 (2**21)) + s_472_481 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_9,
    f_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_9,
    g_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 481)) <=s delta, delta <=s (const 64 (1 + 2*481)),
    (const 64 (-(2**20))) <=s u_472_481, u_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_481, v_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_481, r_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_481, s_472_481 <=s (const 64 ((2**20))),
    u_472_481 + v_472_481 <=s (const 64 (2**20)),
    u_472_481 - v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 + v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 - v_472_481 <=s (const 64 (2**20)),
    r_472_481 + s_472_481 <=s (const 64 (2**20)),
    r_472_481 - s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 + s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 - s_472_481 <=s (const 64 (2**20)),
    u_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_472_481 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_481_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_9,
sint64 g_472_low60_0_low20_9,
sint64 f_472_low60_0_low20_10,
sint64 g_472_low60_0_low20_10,
sint64 u_472_481,
sint64 v_472_481,
sint64 r_472_481,
sint64 s_472_481,
sint64 u_472_482,
sint64 v_472_482,
sint64 r_472_482,
sint64 s_472_482,
bit ne
)={
    u_472_481 * f_472_low60_0_low20_0 + v_472_481 * g_472_low60_0_low20_0 = f_472_low60_0_low20_9 * (-(2**20)),
    r_472_481 * f_472_low60_0_low20_0 + s_472_481 * g_472_low60_0_low20_0 = g_472_low60_0_low20_9 * (-(2**20))
&&
    u_472_481 * f_472_low60_0_low20_0 + v_472_481 * g_472_low60_0_low20_0 = f_472_low60_0_low20_9 * (const 64 (-(2**20))),
    r_472_481 * f_472_low60_0_low20_0 + s_472_481 * g_472_low60_0_low20_0 = g_472_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_9 + u_472_481 * (const 64 (2**21)) + v_472_481 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_9 + r_472_481 * (const 64 (2**21)) + s_472_481 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_9,
    f_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_9,
    g_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 481)) <=s delta, delta <=s (const 64 (1 + 2*481)),
    (const 64 (-(2**20))) <=s u_472_481, u_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_481, v_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_481, r_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_481, s_472_481 <=s (const 64 ((2**20))),
    u_472_481 + v_472_481 <=s (const 64 (2**20)),
    u_472_481 - v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 + v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 - v_472_481 <=s (const 64 (2**20)),
    r_472_481 + s_472_481 <=s (const 64 (2**20)),
    r_472_481 - s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 + s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 - s_472_481 <=s (const 64 (2**20)),
    u_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_472_481 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step481

// premise a
assume
g_472_low60_0_low20_9 = 0 (mod 2)
&&
g_472_low60_0_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_10 f_472_low60_0_low20_9;
mov u_472_482 u_472_481;
mov v_472_482 v_472_481;

asr g_472_low60_0_low20_10 g_472_low60_0_low20_9 1;
asr r_472_482 r_472_481 1;
asr s_472_482 s_472_481 1;
assert
    true
&&
    f_472_low60_0_low20_10 = f_472_low60_0_low20_9,
    u_472_482 = u_472_481,
    v_472_482 = v_472_481,
    g_472_low60_0_low20_10 * (const 64 2) = g_472_low60_0_low20_9,
    r_472_482 * (const 64 2) = r_472_481,
    s_472_482 * (const 64 2) = s_472_481
;

assume
    f_472_low60_0_low20_10 = f_472_low60_0_low20_9,
    u_472_482 = u_472_481,
    v_472_482 = v_472_481,
    g_472_low60_0_low20_10 * 2 = g_472_low60_0_low20_9,
    r_472_482 * 2 = r_472_481,
    s_472_482 * 2 = s_472_481
&&
    true
;

{
    u_472_482 * f_472_low60_0_low20_0 + v_472_482 * g_472_low60_0_low20_0 = f_472_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_482 * f_472_low60_0_low20_0 + s_472_482 * g_472_low60_0_low20_0 = g_472_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_10 + u_472_482 * (const 64 (2**21)) + v_472_482 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_10 + r_472_482 * (const 64 (2**21)) + s_472_482 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_10,
    f_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_10,
    g_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 482)) <=s delta, delta <=s (const 64 (1 + 2*482)),
    (const 64 (-(2**20))) <=s u_472_482, u_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_482, v_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_482, r_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_482, s_472_482 <=s (const 64 ((2**20))),
    u_472_482 + v_472_482 <=s (const 64 (2**20)),
    u_472_482 - v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 + v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 - v_472_482 <=s (const 64 (2**20)),
    r_472_482 + s_472_482 <=s (const 64 (2**20)),
    r_472_482 - s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 + s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 - s_472_482 <=s (const 64 (2**20)),
    u_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_472_482 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_481_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_9,
sint64 g_472_low60_0_low20_9,
sint64 f_472_low60_0_low20_10,
sint64 g_472_low60_0_low20_10,
sint64 u_472_481,
sint64 v_472_481,
sint64 r_472_481,
sint64 s_472_481,
sint64 u_472_482,
sint64 v_472_482,
sint64 r_472_482,
sint64 s_472_482,
bit ne
)={
    u_472_481 * f_472_low60_0_low20_0 + v_472_481 * g_472_low60_0_low20_0 = f_472_low60_0_low20_9 * (-(2**20)),
    r_472_481 * f_472_low60_0_low20_0 + s_472_481 * g_472_low60_0_low20_0 = g_472_low60_0_low20_9 * (-(2**20))
&&
    u_472_481 * f_472_low60_0_low20_0 + v_472_481 * g_472_low60_0_low20_0 = f_472_low60_0_low20_9 * (const 64 (-(2**20))),
    r_472_481 * f_472_low60_0_low20_0 + s_472_481 * g_472_low60_0_low20_0 = g_472_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_9 + u_472_481 * (const 64 (2**21)) + v_472_481 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_9 + r_472_481 * (const 64 (2**21)) + s_472_481 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_9,
    f_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_9,
    g_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 481)) <=s delta, delta <=s (const 64 (1 + 2*481)),
    (const 64 (-(2**20))) <=s u_472_481, u_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_481, v_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_481, r_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_481, s_472_481 <=s (const 64 ((2**20))),
    u_472_481 + v_472_481 <=s (const 64 (2**20)),
    u_472_481 - v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 + v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 - v_472_481 <=s (const 64 (2**20)),
    r_472_481 + s_472_481 <=s (const 64 (2**20)),
    r_472_481 - s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 + s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 - s_472_481 <=s (const 64 (2**20)),
    u_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_472_481 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step481

// premise b
assume
g_472_low60_0_low20_9 = 1 (mod 2)
&&
g_472_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_10 f_472_low60_0_low20_9;
mov u_472_482 u_472_481;
mov v_472_482 v_472_481;

add g_472_low60_0_low20_10 g_472_low60_0_low20_9 f_472_low60_0_low20_9;
asr g_472_low60_0_low20_10 g_472_low60_0_low20_10 1;
add r_472_482 r_472_481 u_472_481;
asr r_472_482 r_472_482 1;
add s_472_482 s_472_481 v_472_481;
asr s_472_482 s_472_482 1;
assert
    true
&&
    f_472_low60_0_low20_10 = f_472_low60_0_low20_9,
    u_472_482 = u_472_481,
    v_472_482 = v_472_481,
    g_472_low60_0_low20_10 * (const 64 2) = g_472_low60_0_low20_9 + f_472_low60_0_low20_9,
    r_472_482 * (const 64 2) = r_472_481 + u_472_481,
    s_472_482 * (const 64 2) = s_472_481 + v_472_481
;

assume
    f_472_low60_0_low20_10 = f_472_low60_0_low20_9,
    u_472_482 = u_472_481,
    v_472_482 = v_472_481,
    g_472_low60_0_low20_10 * 2 = g_472_low60_0_low20_9 + f_472_low60_0_low20_9,
    r_472_482 * 2 = r_472_481 + u_472_481,
    s_472_482 * 2 = s_472_481 + v_472_481
&&
    true
;

{
    u_472_482 * f_472_low60_0_low20_0 + v_472_482 * g_472_low60_0_low20_0 = f_472_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_482 * f_472_low60_0_low20_0 + s_472_482 * g_472_low60_0_low20_0 = g_472_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_10 + u_472_482 * (const 64 (2**21)) + v_472_482 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_10 + r_472_482 * (const 64 (2**21)) + s_472_482 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_10,
    f_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_10,
    g_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 482)) <=s delta, delta <=s (const 64 (1 + 2*482)),
    (const 64 (-(2**20))) <=s u_472_482, u_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_482, v_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_482, r_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_482, s_472_482 <=s (const 64 ((2**20))),
    u_472_482 + v_472_482 <=s (const 64 (2**20)),
    u_472_482 - v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 + v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 - v_472_482 <=s (const 64 (2**20)),
    r_472_482 + s_472_482 <=s (const 64 (2**20)),
    r_472_482 - s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 + s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 - s_472_482 <=s (const 64 (2**20)),
    u_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_472_482 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_481_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_9,
sint64 g_472_low60_0_low20_9,
sint64 f_472_low60_0_low20_10,
sint64 g_472_low60_0_low20_10,
sint64 u_472_481,
sint64 v_472_481,
sint64 r_472_481,
sint64 s_472_481,
sint64 u_472_482,
sint64 v_472_482,
sint64 r_472_482,
sint64 s_472_482,
bit ne
)={
    u_472_481 * f_472_low60_0_low20_0 + v_472_481 * g_472_low60_0_low20_0 = f_472_low60_0_low20_9 * (-(2**20)),
    r_472_481 * f_472_low60_0_low20_0 + s_472_481 * g_472_low60_0_low20_0 = g_472_low60_0_low20_9 * (-(2**20))
&&
    u_472_481 * f_472_low60_0_low20_0 + v_472_481 * g_472_low60_0_low20_0 = f_472_low60_0_low20_9 * (const 64 (-(2**20))),
    r_472_481 * f_472_low60_0_low20_0 + s_472_481 * g_472_low60_0_low20_0 = g_472_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_9 + u_472_481 * (const 64 (2**21)) + v_472_481 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_9 + r_472_481 * (const 64 (2**21)) + s_472_481 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_9,
    f_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_9,
    g_472_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 481)) <=s delta, delta <=s (const 64 (1 + 2*481)),
    (const 64 (-(2**20))) <=s u_472_481, u_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_481, v_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_481, r_472_481 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_481, s_472_481 <=s (const 64 ((2**20))),
    u_472_481 + v_472_481 <=s (const 64 (2**20)),
    u_472_481 - v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 + v_472_481 <=s (const 64 (2**20)),
    (const 64 0) - u_472_481 - v_472_481 <=s (const 64 (2**20)),
    r_472_481 + s_472_481 <=s (const 64 (2**20)),
    r_472_481 - s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 + s_472_481 <=s (const 64 (2**20)),
    (const 64 0) - r_472_481 - s_472_481 <=s (const 64 (2**20)),
    u_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_472_481 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_472_481 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step481

// premise c
assume
g_472_low60_0_low20_9 = 1 (mod 2)
&&
g_472_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_10 g_472_low60_0_low20_9;
mov u_472_482 r_472_481;
mov v_472_482 s_472_481;

subs dc g_472_low60_0_low20_10 g_472_low60_0_low20_9 f_472_low60_0_low20_9;
asr g_472_low60_0_low20_10 g_472_low60_0_low20_10 1;
subs dc r_472_482 r_472_481 u_472_481;
asr r_472_482 r_472_482 1;
subs dc s_472_482 s_472_481 v_472_481;
asr s_472_482 s_472_482 1;
assert
    true
&&
    f_472_low60_0_low20_10 = g_472_low60_0_low20_9,
    u_472_482 = r_472_481,
    v_472_482 = s_472_481,
    g_472_low60_0_low20_10 * (const 64 2) = g_472_low60_0_low20_9 - f_472_low60_0_low20_9,
    r_472_482 * (const 64 2) = r_472_481 - u_472_481,
    s_472_482 * (const 64 2) = s_472_481 - v_472_481
;

assume
    f_472_low60_0_low20_10 = g_472_low60_0_low20_9,
    u_472_482 = r_472_481,
    v_472_482 = s_472_481,
    g_472_low60_0_low20_10 * 2 = g_472_low60_0_low20_9 - f_472_low60_0_low20_9,
    r_472_482 * 2 = r_472_481 - u_472_481,
    s_472_482 * 2 = s_472_481 - v_472_481
&&
    true
;

{
    u_472_482 * f_472_low60_0_low20_0 + v_472_482 * g_472_low60_0_low20_0 = f_472_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_482 * f_472_low60_0_low20_0 + s_472_482 * g_472_low60_0_low20_0 = g_472_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_10 + u_472_482 * (const 64 (2**21)) + v_472_482 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_10 + r_472_482 * (const 64 (2**21)) + s_472_482 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_10,
    f_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_10,
    g_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 482)) <=s delta, delta <=s (const 64 (1 + 2*482)),
    (const 64 (-(2**20))) <=s u_472_482, u_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_482, v_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_482, r_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_482, s_472_482 <=s (const 64 ((2**20))),
    u_472_482 + v_472_482 <=s (const 64 (2**20)),
    u_472_482 - v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 + v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 - v_472_482 <=s (const 64 (2**20)),
    r_472_482 + s_472_482 <=s (const 64 (2**20)),
    r_472_482 - s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 + s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 - s_472_482 <=s (const 64 (2**20)),
    u_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_472_482 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_482_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_10,
sint64 g_472_low60_0_low20_10,
sint64 f_472_low60_0_low20_11,
sint64 g_472_low60_0_low20_11,
sint64 u_472_482,
sint64 v_472_482,
sint64 r_472_482,
sint64 s_472_482,
sint64 u_472_483,
sint64 v_472_483,
sint64 r_472_483,
sint64 s_472_483,
bit ne
)={
    u_472_482 * f_472_low60_0_low20_0 + v_472_482 * g_472_low60_0_low20_0 = f_472_low60_0_low20_10 * (-(2**20)),
    r_472_482 * f_472_low60_0_low20_0 + s_472_482 * g_472_low60_0_low20_0 = g_472_low60_0_low20_10 * (-(2**20))
&&
    u_472_482 * f_472_low60_0_low20_0 + v_472_482 * g_472_low60_0_low20_0 = f_472_low60_0_low20_10 * (const 64 (-(2**20))),
    r_472_482 * f_472_low60_0_low20_0 + s_472_482 * g_472_low60_0_low20_0 = g_472_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_10 + u_472_482 * (const 64 (2**21)) + v_472_482 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_10 + r_472_482 * (const 64 (2**21)) + s_472_482 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_10,
    f_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_10,
    g_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 482)) <=s delta, delta <=s (const 64 (1 + 2*482)),
    (const 64 (-(2**20))) <=s u_472_482, u_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_482, v_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_482, r_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_482, s_472_482 <=s (const 64 ((2**20))),
    u_472_482 + v_472_482 <=s (const 64 (2**20)),
    u_472_482 - v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 + v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 - v_472_482 <=s (const 64 (2**20)),
    r_472_482 + s_472_482 <=s (const 64 (2**20)),
    r_472_482 - s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 + s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 - s_472_482 <=s (const 64 (2**20)),
    u_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_472_482 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step482

// premise a
assume
g_472_low60_0_low20_10 = 0 (mod 2)
&&
g_472_low60_0_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_11 f_472_low60_0_low20_10;
mov u_472_483 u_472_482;
mov v_472_483 v_472_482;

asr g_472_low60_0_low20_11 g_472_low60_0_low20_10 1;
asr r_472_483 r_472_482 1;
asr s_472_483 s_472_482 1;
assert
    true
&&
    f_472_low60_0_low20_11 = f_472_low60_0_low20_10,
    u_472_483 = u_472_482,
    v_472_483 = v_472_482,
    g_472_low60_0_low20_11 * (const 64 2) = g_472_low60_0_low20_10,
    r_472_483 * (const 64 2) = r_472_482,
    s_472_483 * (const 64 2) = s_472_482
;

assume
    f_472_low60_0_low20_11 = f_472_low60_0_low20_10,
    u_472_483 = u_472_482,
    v_472_483 = v_472_482,
    g_472_low60_0_low20_11 * 2 = g_472_low60_0_low20_10,
    r_472_483 * 2 = r_472_482,
    s_472_483 * 2 = s_472_482
&&
    true
;

{
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_11 + u_472_483 * (const 64 (2**21)) + v_472_483 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_11 + r_472_483 * (const 64 (2**21)) + s_472_483 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_11,
    f_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_11,
    g_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 483)) <=s delta, delta <=s (const 64 (1 + 2*483)),
    (const 64 (-(2**20))) <=s u_472_483, u_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_483, v_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_483, r_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_483, s_472_483 <=s (const 64 ((2**20))),
    u_472_483 + v_472_483 <=s (const 64 (2**20)),
    u_472_483 - v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 + v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 - v_472_483 <=s (const 64 (2**20)),
    r_472_483 + s_472_483 <=s (const 64 (2**20)),
    r_472_483 - s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 + s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 - s_472_483 <=s (const 64 (2**20)),
    u_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_472_483 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_482_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_10,
sint64 g_472_low60_0_low20_10,
sint64 f_472_low60_0_low20_11,
sint64 g_472_low60_0_low20_11,
sint64 u_472_482,
sint64 v_472_482,
sint64 r_472_482,
sint64 s_472_482,
sint64 u_472_483,
sint64 v_472_483,
sint64 r_472_483,
sint64 s_472_483,
bit ne
)={
    u_472_482 * f_472_low60_0_low20_0 + v_472_482 * g_472_low60_0_low20_0 = f_472_low60_0_low20_10 * (-(2**20)),
    r_472_482 * f_472_low60_0_low20_0 + s_472_482 * g_472_low60_0_low20_0 = g_472_low60_0_low20_10 * (-(2**20))
&&
    u_472_482 * f_472_low60_0_low20_0 + v_472_482 * g_472_low60_0_low20_0 = f_472_low60_0_low20_10 * (const 64 (-(2**20))),
    r_472_482 * f_472_low60_0_low20_0 + s_472_482 * g_472_low60_0_low20_0 = g_472_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_10 + u_472_482 * (const 64 (2**21)) + v_472_482 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_10 + r_472_482 * (const 64 (2**21)) + s_472_482 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_10,
    f_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_10,
    g_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 482)) <=s delta, delta <=s (const 64 (1 + 2*482)),
    (const 64 (-(2**20))) <=s u_472_482, u_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_482, v_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_482, r_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_482, s_472_482 <=s (const 64 ((2**20))),
    u_472_482 + v_472_482 <=s (const 64 (2**20)),
    u_472_482 - v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 + v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 - v_472_482 <=s (const 64 (2**20)),
    r_472_482 + s_472_482 <=s (const 64 (2**20)),
    r_472_482 - s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 + s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 - s_472_482 <=s (const 64 (2**20)),
    u_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_472_482 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step482

// premise b
assume
g_472_low60_0_low20_10 = 1 (mod 2)
&&
g_472_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_11 f_472_low60_0_low20_10;
mov u_472_483 u_472_482;
mov v_472_483 v_472_482;

add g_472_low60_0_low20_11 g_472_low60_0_low20_10 f_472_low60_0_low20_10;
asr g_472_low60_0_low20_11 g_472_low60_0_low20_11 1;
add r_472_483 r_472_482 u_472_482;
asr r_472_483 r_472_483 1;
add s_472_483 s_472_482 v_472_482;
asr s_472_483 s_472_483 1;
assert
    true
&&
    f_472_low60_0_low20_11 = f_472_low60_0_low20_10,
    u_472_483 = u_472_482,
    v_472_483 = v_472_482,
    g_472_low60_0_low20_11 * (const 64 2) = g_472_low60_0_low20_10 + f_472_low60_0_low20_10,
    r_472_483 * (const 64 2) = r_472_482 + u_472_482,
    s_472_483 * (const 64 2) = s_472_482 + v_472_482
;

assume
    f_472_low60_0_low20_11 = f_472_low60_0_low20_10,
    u_472_483 = u_472_482,
    v_472_483 = v_472_482,
    g_472_low60_0_low20_11 * 2 = g_472_low60_0_low20_10 + f_472_low60_0_low20_10,
    r_472_483 * 2 = r_472_482 + u_472_482,
    s_472_483 * 2 = s_472_482 + v_472_482
&&
    true
;

{
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_11 + u_472_483 * (const 64 (2**21)) + v_472_483 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_11 + r_472_483 * (const 64 (2**21)) + s_472_483 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_11,
    f_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_11,
    g_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 483)) <=s delta, delta <=s (const 64 (1 + 2*483)),
    (const 64 (-(2**20))) <=s u_472_483, u_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_483, v_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_483, r_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_483, s_472_483 <=s (const 64 ((2**20))),
    u_472_483 + v_472_483 <=s (const 64 (2**20)),
    u_472_483 - v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 + v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 - v_472_483 <=s (const 64 (2**20)),
    r_472_483 + s_472_483 <=s (const 64 (2**20)),
    r_472_483 - s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 + s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 - s_472_483 <=s (const 64 (2**20)),
    u_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_472_483 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_482_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_10,
sint64 g_472_low60_0_low20_10,
sint64 f_472_low60_0_low20_11,
sint64 g_472_low60_0_low20_11,
sint64 u_472_482,
sint64 v_472_482,
sint64 r_472_482,
sint64 s_472_482,
sint64 u_472_483,
sint64 v_472_483,
sint64 r_472_483,
sint64 s_472_483,
bit ne
)={
    u_472_482 * f_472_low60_0_low20_0 + v_472_482 * g_472_low60_0_low20_0 = f_472_low60_0_low20_10 * (-(2**20)),
    r_472_482 * f_472_low60_0_low20_0 + s_472_482 * g_472_low60_0_low20_0 = g_472_low60_0_low20_10 * (-(2**20))
&&
    u_472_482 * f_472_low60_0_low20_0 + v_472_482 * g_472_low60_0_low20_0 = f_472_low60_0_low20_10 * (const 64 (-(2**20))),
    r_472_482 * f_472_low60_0_low20_0 + s_472_482 * g_472_low60_0_low20_0 = g_472_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_10 + u_472_482 * (const 64 (2**21)) + v_472_482 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_10 + r_472_482 * (const 64 (2**21)) + s_472_482 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_10,
    f_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_10,
    g_472_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 482)) <=s delta, delta <=s (const 64 (1 + 2*482)),
    (const 64 (-(2**20))) <=s u_472_482, u_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_482, v_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_482, r_472_482 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_482, s_472_482 <=s (const 64 ((2**20))),
    u_472_482 + v_472_482 <=s (const 64 (2**20)),
    u_472_482 - v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 + v_472_482 <=s (const 64 (2**20)),
    (const 64 0) - u_472_482 - v_472_482 <=s (const 64 (2**20)),
    r_472_482 + s_472_482 <=s (const 64 (2**20)),
    r_472_482 - s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 + s_472_482 <=s (const 64 (2**20)),
    (const 64 0) - r_472_482 - s_472_482 <=s (const 64 (2**20)),
    u_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_472_482 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_472_482 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step482

// premise c
assume
g_472_low60_0_low20_10 = 1 (mod 2)
&&
g_472_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_11 g_472_low60_0_low20_10;
mov u_472_483 r_472_482;
mov v_472_483 s_472_482;

subs dc g_472_low60_0_low20_11 g_472_low60_0_low20_10 f_472_low60_0_low20_10;
asr g_472_low60_0_low20_11 g_472_low60_0_low20_11 1;
subs dc r_472_483 r_472_482 u_472_482;
asr r_472_483 r_472_483 1;
subs dc s_472_483 s_472_482 v_472_482;
asr s_472_483 s_472_483 1;
assert
    true
&&
    f_472_low60_0_low20_11 = g_472_low60_0_low20_10,
    u_472_483 = r_472_482,
    v_472_483 = s_472_482,
    g_472_low60_0_low20_11 * (const 64 2) = g_472_low60_0_low20_10 - f_472_low60_0_low20_10,
    r_472_483 * (const 64 2) = r_472_482 - u_472_482,
    s_472_483 * (const 64 2) = s_472_482 - v_472_482
;

assume
    f_472_low60_0_low20_11 = g_472_low60_0_low20_10,
    u_472_483 = r_472_482,
    v_472_483 = s_472_482,
    g_472_low60_0_low20_11 * 2 = g_472_low60_0_low20_10 - f_472_low60_0_low20_10,
    r_472_483 * 2 = r_472_482 - u_472_482,
    s_472_483 * 2 = s_472_482 - v_472_482
&&
    true
;

{
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_11 + u_472_483 * (const 64 (2**21)) + v_472_483 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_11 + r_472_483 * (const 64 (2**21)) + s_472_483 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_11,
    f_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_11,
    g_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 483)) <=s delta, delta <=s (const 64 (1 + 2*483)),
    (const 64 (-(2**20))) <=s u_472_483, u_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_483, v_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_483, r_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_483, s_472_483 <=s (const 64 ((2**20))),
    u_472_483 + v_472_483 <=s (const 64 (2**20)),
    u_472_483 - v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 + v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 - v_472_483 <=s (const 64 (2**20)),
    r_472_483 + s_472_483 <=s (const 64 (2**20)),
    r_472_483 - s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 + s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 - s_472_483 <=s (const 64 (2**20)),
    u_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_472_483 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_483_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_11,
sint64 g_472_low60_0_low20_11,
sint64 f_472_low60_0_low20_12,
sint64 g_472_low60_0_low20_12,
sint64 u_472_483,
sint64 v_472_483,
sint64 r_472_483,
sint64 s_472_483,
sint64 u_472_484,
sint64 v_472_484,
sint64 r_472_484,
sint64 s_472_484,
bit ne
)={
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (-(2**20)),
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (-(2**20))
&&
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (const 64 (-(2**20))),
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_11 + u_472_483 * (const 64 (2**21)) + v_472_483 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_11 + r_472_483 * (const 64 (2**21)) + s_472_483 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_11,
    f_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_11,
    g_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 483)) <=s delta, delta <=s (const 64 (1 + 2*483)),
    (const 64 (-(2**20))) <=s u_472_483, u_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_483, v_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_483, r_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_483, s_472_483 <=s (const 64 ((2**20))),
    u_472_483 + v_472_483 <=s (const 64 (2**20)),
    u_472_483 - v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 + v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 - v_472_483 <=s (const 64 (2**20)),
    r_472_483 + s_472_483 <=s (const 64 (2**20)),
    r_472_483 - s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 + s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 - s_472_483 <=s (const 64 (2**20)),
    u_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_472_483 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step483

// premise a
assume
g_472_low60_0_low20_11 = 0 (mod 2)
&&
g_472_low60_0_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_12 f_472_low60_0_low20_11;
mov u_472_484 u_472_483;
mov v_472_484 v_472_483;

asr g_472_low60_0_low20_12 g_472_low60_0_low20_11 1;
asr r_472_484 r_472_483 1;
asr s_472_484 s_472_483 1;
assert
    true
&&
    f_472_low60_0_low20_12 = f_472_low60_0_low20_11,
    u_472_484 = u_472_483,
    v_472_484 = v_472_483,
    g_472_low60_0_low20_12 * (const 64 2) = g_472_low60_0_low20_11,
    r_472_484 * (const 64 2) = r_472_483,
    s_472_484 * (const 64 2) = s_472_483
;

assume
    f_472_low60_0_low20_12 = f_472_low60_0_low20_11,
    u_472_484 = u_472_483,
    v_472_484 = v_472_483,
    g_472_low60_0_low20_12 * 2 = g_472_low60_0_low20_11,
    r_472_484 * 2 = r_472_483,
    s_472_484 * 2 = s_472_483
&&
    true
;

{
    u_472_484 * f_472_low60_0_low20_0 + v_472_484 * g_472_low60_0_low20_0 = f_472_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_484 * f_472_low60_0_low20_0 + s_472_484 * g_472_low60_0_low20_0 = g_472_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_12 + u_472_484 * (const 64 (2**21)) + v_472_484 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_12 + r_472_484 * (const 64 (2**21)) + s_472_484 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_12,
    f_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_12,
    g_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 484)) <=s delta, delta <=s (const 64 (1 + 2*484)),
    (const 64 (-(2**20))) <=s u_472_484, u_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_484, v_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_484, r_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_484, s_472_484 <=s (const 64 ((2**20))),
    u_472_484 + v_472_484 <=s (const 64 (2**20)),
    u_472_484 - v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 + v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 - v_472_484 <=s (const 64 (2**20)),
    r_472_484 + s_472_484 <=s (const 64 (2**20)),
    r_472_484 - s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 + s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 - s_472_484 <=s (const 64 (2**20)),
    u_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_472_484 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_483_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_11,
sint64 g_472_low60_0_low20_11,
sint64 f_472_low60_0_low20_12,
sint64 g_472_low60_0_low20_12,
sint64 u_472_483,
sint64 v_472_483,
sint64 r_472_483,
sint64 s_472_483,
sint64 u_472_484,
sint64 v_472_484,
sint64 r_472_484,
sint64 s_472_484,
bit ne
)={
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (-(2**20)),
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (-(2**20))
&&
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (const 64 (-(2**20))),
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_11 + u_472_483 * (const 64 (2**21)) + v_472_483 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_11 + r_472_483 * (const 64 (2**21)) + s_472_483 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_11,
    f_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_11,
    g_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 483)) <=s delta, delta <=s (const 64 (1 + 2*483)),
    (const 64 (-(2**20))) <=s u_472_483, u_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_483, v_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_483, r_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_483, s_472_483 <=s (const 64 ((2**20))),
    u_472_483 + v_472_483 <=s (const 64 (2**20)),
    u_472_483 - v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 + v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 - v_472_483 <=s (const 64 (2**20)),
    r_472_483 + s_472_483 <=s (const 64 (2**20)),
    r_472_483 - s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 + s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 - s_472_483 <=s (const 64 (2**20)),
    u_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_472_483 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step483

// premise b
assume
g_472_low60_0_low20_11 = 1 (mod 2)
&&
g_472_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_12 f_472_low60_0_low20_11;
mov u_472_484 u_472_483;
mov v_472_484 v_472_483;

add g_472_low60_0_low20_12 g_472_low60_0_low20_11 f_472_low60_0_low20_11;
asr g_472_low60_0_low20_12 g_472_low60_0_low20_12 1;
add r_472_484 r_472_483 u_472_483;
asr r_472_484 r_472_484 1;
add s_472_484 s_472_483 v_472_483;
asr s_472_484 s_472_484 1;
assert
    true
&&
    f_472_low60_0_low20_12 = f_472_low60_0_low20_11,
    u_472_484 = u_472_483,
    v_472_484 = v_472_483,
    g_472_low60_0_low20_12 * (const 64 2) = g_472_low60_0_low20_11 + f_472_low60_0_low20_11,
    r_472_484 * (const 64 2) = r_472_483 + u_472_483,
    s_472_484 * (const 64 2) = s_472_483 + v_472_483
;

assume
    f_472_low60_0_low20_12 = f_472_low60_0_low20_11,
    u_472_484 = u_472_483,
    v_472_484 = v_472_483,
    g_472_low60_0_low20_12 * 2 = g_472_low60_0_low20_11 + f_472_low60_0_low20_11,
    r_472_484 * 2 = r_472_483 + u_472_483,
    s_472_484 * 2 = s_472_483 + v_472_483
&&
    true
;

{
    u_472_484 * f_472_low60_0_low20_0 + v_472_484 * g_472_low60_0_low20_0 = f_472_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_484 * f_472_low60_0_low20_0 + s_472_484 * g_472_low60_0_low20_0 = g_472_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_12 + u_472_484 * (const 64 (2**21)) + v_472_484 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_12 + r_472_484 * (const 64 (2**21)) + s_472_484 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_12,
    f_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_12,
    g_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 484)) <=s delta, delta <=s (const 64 (1 + 2*484)),
    (const 64 (-(2**20))) <=s u_472_484, u_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_484, v_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_484, r_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_484, s_472_484 <=s (const 64 ((2**20))),
    u_472_484 + v_472_484 <=s (const 64 (2**20)),
    u_472_484 - v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 + v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 - v_472_484 <=s (const 64 (2**20)),
    r_472_484 + s_472_484 <=s (const 64 (2**20)),
    r_472_484 - s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 + s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 - s_472_484 <=s (const 64 (2**20)),
    u_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_472_484 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_483_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_11,
sint64 g_472_low60_0_low20_11,
sint64 f_472_low60_0_low20_12,
sint64 g_472_low60_0_low20_12,
sint64 u_472_483,
sint64 v_472_483,
sint64 r_472_483,
sint64 s_472_483,
sint64 u_472_484,
sint64 v_472_484,
sint64 r_472_484,
sint64 s_472_484,
bit ne
)={
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (-(2**20)),
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (-(2**20))
&&
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (const 64 (-(2**20))),
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_11 + u_472_483 * (const 64 (2**21)) + v_472_483 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_11 + r_472_483 * (const 64 (2**21)) + s_472_483 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_11,
    f_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_11,
    g_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 483)) <=s delta, delta <=s (const 64 (1 + 2*483)),
    (const 64 (-(2**20))) <=s u_472_483, u_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_483, v_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_483, r_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_483, s_472_483 <=s (const 64 ((2**20))),
    u_472_483 + v_472_483 <=s (const 64 (2**20)),
    u_472_483 - v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 + v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 - v_472_483 <=s (const 64 (2**20)),
    r_472_483 + s_472_483 <=s (const 64 (2**20)),
    r_472_483 - s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 + s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 - s_472_483 <=s (const 64 (2**20)),
    u_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_472_483 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step483

// premise c
assume
g_472_low60_0_low20_11 = 1 (mod 2)
&&
g_472_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_12 g_472_low60_0_low20_11;
mov u_472_484 r_472_483;
mov v_472_484 s_472_483;

subs dc g_472_low60_0_low20_12 g_472_low60_0_low20_11 f_472_low60_0_low20_11;
asr g_472_low60_0_low20_12 g_472_low60_0_low20_12 1;
subs dc r_472_484 r_472_483 u_472_483;
asr r_472_484 r_472_484 1;
subs dc s_472_484 s_472_483 v_472_483;
asr s_472_484 s_472_484 1;
assert
    true
&&
    f_472_low60_0_low20_12 = g_472_low60_0_low20_11,
    u_472_484 = r_472_483,
    v_472_484 = s_472_483,
    g_472_low60_0_low20_12 * (const 64 2) = g_472_low60_0_low20_11 - f_472_low60_0_low20_11,
    r_472_484 * (const 64 2) = r_472_483 - u_472_483,
    s_472_484 * (const 64 2) = s_472_483 - v_472_483
;

assume
    f_472_low60_0_low20_12 = g_472_low60_0_low20_11,
    u_472_484 = r_472_483,
    v_472_484 = s_472_483,
    g_472_low60_0_low20_12 * 2 = g_472_low60_0_low20_11 - f_472_low60_0_low20_11,
    r_472_484 * 2 = r_472_483 - u_472_483,
    s_472_484 * 2 = s_472_483 - v_472_483
&&
    true
;

{
    u_472_484 * f_472_low60_0_low20_0 + v_472_484 * g_472_low60_0_low20_0 = f_472_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_484 * f_472_low60_0_low20_0 + s_472_484 * g_472_low60_0_low20_0 = g_472_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_12 + u_472_484 * (const 64 (2**21)) + v_472_484 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_12 + r_472_484 * (const 64 (2**21)) + s_472_484 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_12,
    f_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_12,
    g_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 484)) <=s delta, delta <=s (const 64 (1 + 2*484)),
    (const 64 (-(2**20))) <=s u_472_484, u_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_484, v_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_484, r_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_484, s_472_484 <=s (const 64 ((2**20))),
    u_472_484 + v_472_484 <=s (const 64 (2**20)),
    u_472_484 - v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 + v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 - v_472_484 <=s (const 64 (2**20)),
    r_472_484 + s_472_484 <=s (const 64 (2**20)),
    r_472_484 - s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 + s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 - s_472_484 <=s (const 64 (2**20)),
    u_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_472_484 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_484_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_12,
sint64 g_472_low60_0_low20_12,
sint64 f_472_low60_0_low20_13,
sint64 g_472_low60_0_low20_13,
sint64 u_472_484,
sint64 v_472_484,
sint64 r_472_484,
sint64 s_472_484,
sint64 u_472_485,
sint64 v_472_485,
sint64 r_472_485,
sint64 s_472_485,
bit ne
)={
    u_472_484 * f_472_low60_0_low20_0 + v_472_484 * g_472_low60_0_low20_0 = f_472_low60_0_low20_12 * (-(2**20)),
    r_472_484 * f_472_low60_0_low20_0 + s_472_484 * g_472_low60_0_low20_0 = g_472_low60_0_low20_12 * (-(2**20))
&&
    u_472_484 * f_472_low60_0_low20_0 + v_472_484 * g_472_low60_0_low20_0 = f_472_low60_0_low20_12 * (const 64 (-(2**20))),
    r_472_484 * f_472_low60_0_low20_0 + s_472_484 * g_472_low60_0_low20_0 = g_472_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_12 + u_472_484 * (const 64 (2**21)) + v_472_484 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_12 + r_472_484 * (const 64 (2**21)) + s_472_484 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_12,
    f_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_12,
    g_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 484)) <=s delta, delta <=s (const 64 (1 + 2*484)),
    (const 64 (-(2**20))) <=s u_472_484, u_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_484, v_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_484, r_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_484, s_472_484 <=s (const 64 ((2**20))),
    u_472_484 + v_472_484 <=s (const 64 (2**20)),
    u_472_484 - v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 + v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 - v_472_484 <=s (const 64 (2**20)),
    r_472_484 + s_472_484 <=s (const 64 (2**20)),
    r_472_484 - s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 + s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 - s_472_484 <=s (const 64 (2**20)),
    u_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_472_484 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step484

// premise a
assume
g_472_low60_0_low20_12 = 0 (mod 2)
&&
g_472_low60_0_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_13 f_472_low60_0_low20_12;
mov u_472_485 u_472_484;
mov v_472_485 v_472_484;

asr g_472_low60_0_low20_13 g_472_low60_0_low20_12 1;
asr r_472_485 r_472_484 1;
asr s_472_485 s_472_484 1;
assert
    true
&&
    f_472_low60_0_low20_13 = f_472_low60_0_low20_12,
    u_472_485 = u_472_484,
    v_472_485 = v_472_484,
    g_472_low60_0_low20_13 * (const 64 2) = g_472_low60_0_low20_12,
    r_472_485 * (const 64 2) = r_472_484,
    s_472_485 * (const 64 2) = s_472_484
;

assume
    f_472_low60_0_low20_13 = f_472_low60_0_low20_12,
    u_472_485 = u_472_484,
    v_472_485 = v_472_484,
    g_472_low60_0_low20_13 * 2 = g_472_low60_0_low20_12,
    r_472_485 * 2 = r_472_484,
    s_472_485 * 2 = s_472_484
&&
    true
;

{
    u_472_485 * f_472_low60_0_low20_0 + v_472_485 * g_472_low60_0_low20_0 = f_472_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_485 * f_472_low60_0_low20_0 + s_472_485 * g_472_low60_0_low20_0 = g_472_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_13 + u_472_485 * (const 64 (2**21)) + v_472_485 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_13 + r_472_485 * (const 64 (2**21)) + s_472_485 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_13,
    f_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_13,
    g_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 485)) <=s delta, delta <=s (const 64 (1 + 2*485)),
    (const 64 (-(2**20))) <=s u_472_485, u_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_485, v_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_485, r_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_485, s_472_485 <=s (const 64 ((2**20))),
    u_472_485 + v_472_485 <=s (const 64 (2**20)),
    u_472_485 - v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 + v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 - v_472_485 <=s (const 64 (2**20)),
    r_472_485 + s_472_485 <=s (const 64 (2**20)),
    r_472_485 - s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 + s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 - s_472_485 <=s (const 64 (2**20)),
    u_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_472_485 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_484_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_12,
sint64 g_472_low60_0_low20_12,
sint64 f_472_low60_0_low20_13,
sint64 g_472_low60_0_low20_13,
sint64 u_472_484,
sint64 v_472_484,
sint64 r_472_484,
sint64 s_472_484,
sint64 u_472_485,
sint64 v_472_485,
sint64 r_472_485,
sint64 s_472_485,
bit ne
)={
    u_472_484 * f_472_low60_0_low20_0 + v_472_484 * g_472_low60_0_low20_0 = f_472_low60_0_low20_12 * (-(2**20)),
    r_472_484 * f_472_low60_0_low20_0 + s_472_484 * g_472_low60_0_low20_0 = g_472_low60_0_low20_12 * (-(2**20))
&&
    u_472_484 * f_472_low60_0_low20_0 + v_472_484 * g_472_low60_0_low20_0 = f_472_low60_0_low20_12 * (const 64 (-(2**20))),
    r_472_484 * f_472_low60_0_low20_0 + s_472_484 * g_472_low60_0_low20_0 = g_472_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_12 + u_472_484 * (const 64 (2**21)) + v_472_484 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_12 + r_472_484 * (const 64 (2**21)) + s_472_484 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_12,
    f_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_12,
    g_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 484)) <=s delta, delta <=s (const 64 (1 + 2*484)),
    (const 64 (-(2**20))) <=s u_472_484, u_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_484, v_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_484, r_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_484, s_472_484 <=s (const 64 ((2**20))),
    u_472_484 + v_472_484 <=s (const 64 (2**20)),
    u_472_484 - v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 + v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 - v_472_484 <=s (const 64 (2**20)),
    r_472_484 + s_472_484 <=s (const 64 (2**20)),
    r_472_484 - s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 + s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 - s_472_484 <=s (const 64 (2**20)),
    u_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_472_484 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step484

// premise b
assume
g_472_low60_0_low20_12 = 1 (mod 2)
&&
g_472_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_13 f_472_low60_0_low20_12;
mov u_472_485 u_472_484;
mov v_472_485 v_472_484;

add g_472_low60_0_low20_13 g_472_low60_0_low20_12 f_472_low60_0_low20_12;
asr g_472_low60_0_low20_13 g_472_low60_0_low20_13 1;
add r_472_485 r_472_484 u_472_484;
asr r_472_485 r_472_485 1;
add s_472_485 s_472_484 v_472_484;
asr s_472_485 s_472_485 1;
assert
    true
&&
    f_472_low60_0_low20_13 = f_472_low60_0_low20_12,
    u_472_485 = u_472_484,
    v_472_485 = v_472_484,
    g_472_low60_0_low20_13 * (const 64 2) = g_472_low60_0_low20_12 + f_472_low60_0_low20_12,
    r_472_485 * (const 64 2) = r_472_484 + u_472_484,
    s_472_485 * (const 64 2) = s_472_484 + v_472_484
;

assume
    f_472_low60_0_low20_13 = f_472_low60_0_low20_12,
    u_472_485 = u_472_484,
    v_472_485 = v_472_484,
    g_472_low60_0_low20_13 * 2 = g_472_low60_0_low20_12 + f_472_low60_0_low20_12,
    r_472_485 * 2 = r_472_484 + u_472_484,
    s_472_485 * 2 = s_472_484 + v_472_484
&&
    true
;

{
    u_472_485 * f_472_low60_0_low20_0 + v_472_485 * g_472_low60_0_low20_0 = f_472_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_485 * f_472_low60_0_low20_0 + s_472_485 * g_472_low60_0_low20_0 = g_472_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_13 + u_472_485 * (const 64 (2**21)) + v_472_485 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_13 + r_472_485 * (const 64 (2**21)) + s_472_485 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_13,
    f_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_13,
    g_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 485)) <=s delta, delta <=s (const 64 (1 + 2*485)),
    (const 64 (-(2**20))) <=s u_472_485, u_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_485, v_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_485, r_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_485, s_472_485 <=s (const 64 ((2**20))),
    u_472_485 + v_472_485 <=s (const 64 (2**20)),
    u_472_485 - v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 + v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 - v_472_485 <=s (const 64 (2**20)),
    r_472_485 + s_472_485 <=s (const 64 (2**20)),
    r_472_485 - s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 + s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 - s_472_485 <=s (const 64 (2**20)),
    u_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_472_485 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_484_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_12,
sint64 g_472_low60_0_low20_12,
sint64 f_472_low60_0_low20_13,
sint64 g_472_low60_0_low20_13,
sint64 u_472_484,
sint64 v_472_484,
sint64 r_472_484,
sint64 s_472_484,
sint64 u_472_485,
sint64 v_472_485,
sint64 r_472_485,
sint64 s_472_485,
bit ne
)={
    u_472_484 * f_472_low60_0_low20_0 + v_472_484 * g_472_low60_0_low20_0 = f_472_low60_0_low20_12 * (-(2**20)),
    r_472_484 * f_472_low60_0_low20_0 + s_472_484 * g_472_low60_0_low20_0 = g_472_low60_0_low20_12 * (-(2**20))
&&
    u_472_484 * f_472_low60_0_low20_0 + v_472_484 * g_472_low60_0_low20_0 = f_472_low60_0_low20_12 * (const 64 (-(2**20))),
    r_472_484 * f_472_low60_0_low20_0 + s_472_484 * g_472_low60_0_low20_0 = g_472_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_12 + u_472_484 * (const 64 (2**21)) + v_472_484 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_12 + r_472_484 * (const 64 (2**21)) + s_472_484 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_12,
    f_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_12,
    g_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 484)) <=s delta, delta <=s (const 64 (1 + 2*484)),
    (const 64 (-(2**20))) <=s u_472_484, u_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_484, v_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_484, r_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_484, s_472_484 <=s (const 64 ((2**20))),
    u_472_484 + v_472_484 <=s (const 64 (2**20)),
    u_472_484 - v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 + v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 - v_472_484 <=s (const 64 (2**20)),
    r_472_484 + s_472_484 <=s (const 64 (2**20)),
    r_472_484 - s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 + s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 - s_472_484 <=s (const 64 (2**20)),
    u_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_472_484 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step484

// premise c
assume
g_472_low60_0_low20_12 = 1 (mod 2)
&&
g_472_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_13 g_472_low60_0_low20_12;
mov u_472_485 r_472_484;
mov v_472_485 s_472_484;

subs dc g_472_low60_0_low20_13 g_472_low60_0_low20_12 f_472_low60_0_low20_12;
asr g_472_low60_0_low20_13 g_472_low60_0_low20_13 1;
subs dc r_472_485 r_472_484 u_472_484;
asr r_472_485 r_472_485 1;
subs dc s_472_485 s_472_484 v_472_484;
asr s_472_485 s_472_485 1;
assert
    true
&&
    f_472_low60_0_low20_13 = g_472_low60_0_low20_12,
    u_472_485 = r_472_484,
    v_472_485 = s_472_484,
    g_472_low60_0_low20_13 * (const 64 2) = g_472_low60_0_low20_12 - f_472_low60_0_low20_12,
    r_472_485 * (const 64 2) = r_472_484 - u_472_484,
    s_472_485 * (const 64 2) = s_472_484 - v_472_484
;

assume
    f_472_low60_0_low20_13 = g_472_low60_0_low20_12,
    u_472_485 = r_472_484,
    v_472_485 = s_472_484,
    g_472_low60_0_low20_13 * 2 = g_472_low60_0_low20_12 - f_472_low60_0_low20_12,
    r_472_485 * 2 = r_472_484 - u_472_484,
    s_472_485 * 2 = s_472_484 - v_472_484
&&
    true
;

{
    u_472_485 * f_472_low60_0_low20_0 + v_472_485 * g_472_low60_0_low20_0 = f_472_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_485 * f_472_low60_0_low20_0 + s_472_485 * g_472_low60_0_low20_0 = g_472_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_13 + u_472_485 * (const 64 (2**21)) + v_472_485 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_13 + r_472_485 * (const 64 (2**21)) + s_472_485 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_13,
    f_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_13,
    g_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 485)) <=s delta, delta <=s (const 64 (1 + 2*485)),
    (const 64 (-(2**20))) <=s u_472_485, u_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_485, v_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_485, r_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_485, s_472_485 <=s (const 64 ((2**20))),
    u_472_485 + v_472_485 <=s (const 64 (2**20)),
    u_472_485 - v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 + v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 - v_472_485 <=s (const 64 (2**20)),
    r_472_485 + s_472_485 <=s (const 64 (2**20)),
    r_472_485 - s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 + s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 - s_472_485 <=s (const 64 (2**20)),
    u_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_472_485 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_485_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_13,
sint64 g_472_low60_0_low20_13,
sint64 f_472_low60_0_low20_14,
sint64 g_472_low60_0_low20_14,
sint64 u_472_485,
sint64 v_472_485,
sint64 r_472_485,
sint64 s_472_485,
sint64 u_472_486,
sint64 v_472_486,
sint64 r_472_486,
sint64 s_472_486,
bit ne
)={
    u_472_485 * f_472_low60_0_low20_0 + v_472_485 * g_472_low60_0_low20_0 = f_472_low60_0_low20_13 * (-(2**20)),
    r_472_485 * f_472_low60_0_low20_0 + s_472_485 * g_472_low60_0_low20_0 = g_472_low60_0_low20_13 * (-(2**20))
&&
    u_472_485 * f_472_low60_0_low20_0 + v_472_485 * g_472_low60_0_low20_0 = f_472_low60_0_low20_13 * (const 64 (-(2**20))),
    r_472_485 * f_472_low60_0_low20_0 + s_472_485 * g_472_low60_0_low20_0 = g_472_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_13 + u_472_485 * (const 64 (2**21)) + v_472_485 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_13 + r_472_485 * (const 64 (2**21)) + s_472_485 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_13,
    f_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_13,
    g_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 485)) <=s delta, delta <=s (const 64 (1 + 2*485)),
    (const 64 (-(2**20))) <=s u_472_485, u_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_485, v_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_485, r_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_485, s_472_485 <=s (const 64 ((2**20))),
    u_472_485 + v_472_485 <=s (const 64 (2**20)),
    u_472_485 - v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 + v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 - v_472_485 <=s (const 64 (2**20)),
    r_472_485 + s_472_485 <=s (const 64 (2**20)),
    r_472_485 - s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 + s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 - s_472_485 <=s (const 64 (2**20)),
    u_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_472_485 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step485

// premise a
assume
g_472_low60_0_low20_13 = 0 (mod 2)
&&
g_472_low60_0_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_14 f_472_low60_0_low20_13;
mov u_472_486 u_472_485;
mov v_472_486 v_472_485;

asr g_472_low60_0_low20_14 g_472_low60_0_low20_13 1;
asr r_472_486 r_472_485 1;
asr s_472_486 s_472_485 1;
assert
    true
&&
    f_472_low60_0_low20_14 = f_472_low60_0_low20_13,
    u_472_486 = u_472_485,
    v_472_486 = v_472_485,
    g_472_low60_0_low20_14 * (const 64 2) = g_472_low60_0_low20_13,
    r_472_486 * (const 64 2) = r_472_485,
    s_472_486 * (const 64 2) = s_472_485
;

assume
    f_472_low60_0_low20_14 = f_472_low60_0_low20_13,
    u_472_486 = u_472_485,
    v_472_486 = v_472_485,
    g_472_low60_0_low20_14 * 2 = g_472_low60_0_low20_13,
    r_472_486 * 2 = r_472_485,
    s_472_486 * 2 = s_472_485
&&
    true
;

{
    u_472_486 * f_472_low60_0_low20_0 + v_472_486 * g_472_low60_0_low20_0 = f_472_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_486 * f_472_low60_0_low20_0 + s_472_486 * g_472_low60_0_low20_0 = g_472_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_14 + u_472_486 * (const 64 (2**21)) + v_472_486 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_14 + r_472_486 * (const 64 (2**21)) + s_472_486 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_14,
    f_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_14,
    g_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 486)) <=s delta, delta <=s (const 64 (1 + 2*486)),
    (const 64 (-(2**20))) <=s u_472_486, u_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_486, v_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_486, r_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_486, s_472_486 <=s (const 64 ((2**20))),
    u_472_486 + v_472_486 <=s (const 64 (2**20)),
    u_472_486 - v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 + v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 - v_472_486 <=s (const 64 (2**20)),
    r_472_486 + s_472_486 <=s (const 64 (2**20)),
    r_472_486 - s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 + s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 - s_472_486 <=s (const 64 (2**20)),
    u_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_472_486 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_485_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_13,
sint64 g_472_low60_0_low20_13,
sint64 f_472_low60_0_low20_14,
sint64 g_472_low60_0_low20_14,
sint64 u_472_485,
sint64 v_472_485,
sint64 r_472_485,
sint64 s_472_485,
sint64 u_472_486,
sint64 v_472_486,
sint64 r_472_486,
sint64 s_472_486,
bit ne
)={
    u_472_485 * f_472_low60_0_low20_0 + v_472_485 * g_472_low60_0_low20_0 = f_472_low60_0_low20_13 * (-(2**20)),
    r_472_485 * f_472_low60_0_low20_0 + s_472_485 * g_472_low60_0_low20_0 = g_472_low60_0_low20_13 * (-(2**20))
&&
    u_472_485 * f_472_low60_0_low20_0 + v_472_485 * g_472_low60_0_low20_0 = f_472_low60_0_low20_13 * (const 64 (-(2**20))),
    r_472_485 * f_472_low60_0_low20_0 + s_472_485 * g_472_low60_0_low20_0 = g_472_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_13 + u_472_485 * (const 64 (2**21)) + v_472_485 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_13 + r_472_485 * (const 64 (2**21)) + s_472_485 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_13,
    f_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_13,
    g_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 485)) <=s delta, delta <=s (const 64 (1 + 2*485)),
    (const 64 (-(2**20))) <=s u_472_485, u_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_485, v_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_485, r_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_485, s_472_485 <=s (const 64 ((2**20))),
    u_472_485 + v_472_485 <=s (const 64 (2**20)),
    u_472_485 - v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 + v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 - v_472_485 <=s (const 64 (2**20)),
    r_472_485 + s_472_485 <=s (const 64 (2**20)),
    r_472_485 - s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 + s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 - s_472_485 <=s (const 64 (2**20)),
    u_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_472_485 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step485

// premise b
assume
g_472_low60_0_low20_13 = 1 (mod 2)
&&
g_472_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_14 f_472_low60_0_low20_13;
mov u_472_486 u_472_485;
mov v_472_486 v_472_485;

add g_472_low60_0_low20_14 g_472_low60_0_low20_13 f_472_low60_0_low20_13;
asr g_472_low60_0_low20_14 g_472_low60_0_low20_14 1;
add r_472_486 r_472_485 u_472_485;
asr r_472_486 r_472_486 1;
add s_472_486 s_472_485 v_472_485;
asr s_472_486 s_472_486 1;
assert
    true
&&
    f_472_low60_0_low20_14 = f_472_low60_0_low20_13,
    u_472_486 = u_472_485,
    v_472_486 = v_472_485,
    g_472_low60_0_low20_14 * (const 64 2) = g_472_low60_0_low20_13 + f_472_low60_0_low20_13,
    r_472_486 * (const 64 2) = r_472_485 + u_472_485,
    s_472_486 * (const 64 2) = s_472_485 + v_472_485
;

assume
    f_472_low60_0_low20_14 = f_472_low60_0_low20_13,
    u_472_486 = u_472_485,
    v_472_486 = v_472_485,
    g_472_low60_0_low20_14 * 2 = g_472_low60_0_low20_13 + f_472_low60_0_low20_13,
    r_472_486 * 2 = r_472_485 + u_472_485,
    s_472_486 * 2 = s_472_485 + v_472_485
&&
    true
;

{
    u_472_486 * f_472_low60_0_low20_0 + v_472_486 * g_472_low60_0_low20_0 = f_472_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_486 * f_472_low60_0_low20_0 + s_472_486 * g_472_low60_0_low20_0 = g_472_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_14 + u_472_486 * (const 64 (2**21)) + v_472_486 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_14 + r_472_486 * (const 64 (2**21)) + s_472_486 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_14,
    f_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_14,
    g_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 486)) <=s delta, delta <=s (const 64 (1 + 2*486)),
    (const 64 (-(2**20))) <=s u_472_486, u_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_486, v_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_486, r_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_486, s_472_486 <=s (const 64 ((2**20))),
    u_472_486 + v_472_486 <=s (const 64 (2**20)),
    u_472_486 - v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 + v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 - v_472_486 <=s (const 64 (2**20)),
    r_472_486 + s_472_486 <=s (const 64 (2**20)),
    r_472_486 - s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 + s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 - s_472_486 <=s (const 64 (2**20)),
    u_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_472_486 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_485_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_13,
sint64 g_472_low60_0_low20_13,
sint64 f_472_low60_0_low20_14,
sint64 g_472_low60_0_low20_14,
sint64 u_472_485,
sint64 v_472_485,
sint64 r_472_485,
sint64 s_472_485,
sint64 u_472_486,
sint64 v_472_486,
sint64 r_472_486,
sint64 s_472_486,
bit ne
)={
    u_472_485 * f_472_low60_0_low20_0 + v_472_485 * g_472_low60_0_low20_0 = f_472_low60_0_low20_13 * (-(2**20)),
    r_472_485 * f_472_low60_0_low20_0 + s_472_485 * g_472_low60_0_low20_0 = g_472_low60_0_low20_13 * (-(2**20))
&&
    u_472_485 * f_472_low60_0_low20_0 + v_472_485 * g_472_low60_0_low20_0 = f_472_low60_0_low20_13 * (const 64 (-(2**20))),
    r_472_485 * f_472_low60_0_low20_0 + s_472_485 * g_472_low60_0_low20_0 = g_472_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_13 + u_472_485 * (const 64 (2**21)) + v_472_485 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_13 + r_472_485 * (const 64 (2**21)) + s_472_485 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_13,
    f_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_13,
    g_472_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 485)) <=s delta, delta <=s (const 64 (1 + 2*485)),
    (const 64 (-(2**20))) <=s u_472_485, u_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_485, v_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_485, r_472_485 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_485, s_472_485 <=s (const 64 ((2**20))),
    u_472_485 + v_472_485 <=s (const 64 (2**20)),
    u_472_485 - v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 + v_472_485 <=s (const 64 (2**20)),
    (const 64 0) - u_472_485 - v_472_485 <=s (const 64 (2**20)),
    r_472_485 + s_472_485 <=s (const 64 (2**20)),
    r_472_485 - s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 + s_472_485 <=s (const 64 (2**20)),
    (const 64 0) - r_472_485 - s_472_485 <=s (const 64 (2**20)),
    u_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_472_485 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_472_485 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step485

// premise c
assume
g_472_low60_0_low20_13 = 1 (mod 2)
&&
g_472_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_14 g_472_low60_0_low20_13;
mov u_472_486 r_472_485;
mov v_472_486 s_472_485;

subs dc g_472_low60_0_low20_14 g_472_low60_0_low20_13 f_472_low60_0_low20_13;
asr g_472_low60_0_low20_14 g_472_low60_0_low20_14 1;
subs dc r_472_486 r_472_485 u_472_485;
asr r_472_486 r_472_486 1;
subs dc s_472_486 s_472_485 v_472_485;
asr s_472_486 s_472_486 1;
assert
    true
&&
    f_472_low60_0_low20_14 = g_472_low60_0_low20_13,
    u_472_486 = r_472_485,
    v_472_486 = s_472_485,
    g_472_low60_0_low20_14 * (const 64 2) = g_472_low60_0_low20_13 - f_472_low60_0_low20_13,
    r_472_486 * (const 64 2) = r_472_485 - u_472_485,
    s_472_486 * (const 64 2) = s_472_485 - v_472_485
;

assume
    f_472_low60_0_low20_14 = g_472_low60_0_low20_13,
    u_472_486 = r_472_485,
    v_472_486 = s_472_485,
    g_472_low60_0_low20_14 * 2 = g_472_low60_0_low20_13 - f_472_low60_0_low20_13,
    r_472_486 * 2 = r_472_485 - u_472_485,
    s_472_486 * 2 = s_472_485 - v_472_485
&&
    true
;

{
    u_472_486 * f_472_low60_0_low20_0 + v_472_486 * g_472_low60_0_low20_0 = f_472_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_486 * f_472_low60_0_low20_0 + s_472_486 * g_472_low60_0_low20_0 = g_472_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_14 + u_472_486 * (const 64 (2**21)) + v_472_486 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_14 + r_472_486 * (const 64 (2**21)) + s_472_486 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_14,
    f_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_14,
    g_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 486)) <=s delta, delta <=s (const 64 (1 + 2*486)),
    (const 64 (-(2**20))) <=s u_472_486, u_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_486, v_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_486, r_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_486, s_472_486 <=s (const 64 ((2**20))),
    u_472_486 + v_472_486 <=s (const 64 (2**20)),
    u_472_486 - v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 + v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 - v_472_486 <=s (const 64 (2**20)),
    r_472_486 + s_472_486 <=s (const 64 (2**20)),
    r_472_486 - s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 + s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 - s_472_486 <=s (const 64 (2**20)),
    u_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_472_486 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_486_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_14,
sint64 g_472_low60_0_low20_14,
sint64 f_472_low60_0_low20_15,
sint64 g_472_low60_0_low20_15,
sint64 u_472_486,
sint64 v_472_486,
sint64 r_472_486,
sint64 s_472_486,
sint64 u_472_487,
sint64 v_472_487,
sint64 r_472_487,
sint64 s_472_487,
bit ne
)={
    u_472_486 * f_472_low60_0_low20_0 + v_472_486 * g_472_low60_0_low20_0 = f_472_low60_0_low20_14 * (-(2**20)),
    r_472_486 * f_472_low60_0_low20_0 + s_472_486 * g_472_low60_0_low20_0 = g_472_low60_0_low20_14 * (-(2**20))
&&
    u_472_486 * f_472_low60_0_low20_0 + v_472_486 * g_472_low60_0_low20_0 = f_472_low60_0_low20_14 * (const 64 (-(2**20))),
    r_472_486 * f_472_low60_0_low20_0 + s_472_486 * g_472_low60_0_low20_0 = g_472_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_14 + u_472_486 * (const 64 (2**21)) + v_472_486 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_14 + r_472_486 * (const 64 (2**21)) + s_472_486 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_14,
    f_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_14,
    g_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 486)) <=s delta, delta <=s (const 64 (1 + 2*486)),
    (const 64 (-(2**20))) <=s u_472_486, u_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_486, v_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_486, r_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_486, s_472_486 <=s (const 64 ((2**20))),
    u_472_486 + v_472_486 <=s (const 64 (2**20)),
    u_472_486 - v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 + v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 - v_472_486 <=s (const 64 (2**20)),
    r_472_486 + s_472_486 <=s (const 64 (2**20)),
    r_472_486 - s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 + s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 - s_472_486 <=s (const 64 (2**20)),
    u_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_472_486 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step486

// premise a
assume
g_472_low60_0_low20_14 = 0 (mod 2)
&&
g_472_low60_0_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_15 f_472_low60_0_low20_14;
mov u_472_487 u_472_486;
mov v_472_487 v_472_486;

asr g_472_low60_0_low20_15 g_472_low60_0_low20_14 1;
asr r_472_487 r_472_486 1;
asr s_472_487 s_472_486 1;
assert
    true
&&
    f_472_low60_0_low20_15 = f_472_low60_0_low20_14,
    u_472_487 = u_472_486,
    v_472_487 = v_472_486,
    g_472_low60_0_low20_15 * (const 64 2) = g_472_low60_0_low20_14,
    r_472_487 * (const 64 2) = r_472_486,
    s_472_487 * (const 64 2) = s_472_486
;

assume
    f_472_low60_0_low20_15 = f_472_low60_0_low20_14,
    u_472_487 = u_472_486,
    v_472_487 = v_472_486,
    g_472_low60_0_low20_15 * 2 = g_472_low60_0_low20_14,
    r_472_487 * 2 = r_472_486,
    s_472_487 * 2 = s_472_486
&&
    true
;

{
    u_472_487 * f_472_low60_0_low20_0 + v_472_487 * g_472_low60_0_low20_0 = f_472_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_487 * f_472_low60_0_low20_0 + s_472_487 * g_472_low60_0_low20_0 = g_472_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_15 + u_472_487 * (const 64 (2**21)) + v_472_487 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_15 + r_472_487 * (const 64 (2**21)) + s_472_487 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_15,
    f_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_15,
    g_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 487)) <=s delta, delta <=s (const 64 (1 + 2*487)),
    (const 64 (-(2**20))) <=s u_472_487, u_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_487, v_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_487, r_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_487, s_472_487 <=s (const 64 ((2**20))),
    u_472_487 + v_472_487 <=s (const 64 (2**20)),
    u_472_487 - v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 + v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 - v_472_487 <=s (const 64 (2**20)),
    r_472_487 + s_472_487 <=s (const 64 (2**20)),
    r_472_487 - s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 + s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 - s_472_487 <=s (const 64 (2**20)),
    u_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_472_487 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_486_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_14,
sint64 g_472_low60_0_low20_14,
sint64 f_472_low60_0_low20_15,
sint64 g_472_low60_0_low20_15,
sint64 u_472_486,
sint64 v_472_486,
sint64 r_472_486,
sint64 s_472_486,
sint64 u_472_487,
sint64 v_472_487,
sint64 r_472_487,
sint64 s_472_487,
bit ne
)={
    u_472_486 * f_472_low60_0_low20_0 + v_472_486 * g_472_low60_0_low20_0 = f_472_low60_0_low20_14 * (-(2**20)),
    r_472_486 * f_472_low60_0_low20_0 + s_472_486 * g_472_low60_0_low20_0 = g_472_low60_0_low20_14 * (-(2**20))
&&
    u_472_486 * f_472_low60_0_low20_0 + v_472_486 * g_472_low60_0_low20_0 = f_472_low60_0_low20_14 * (const 64 (-(2**20))),
    r_472_486 * f_472_low60_0_low20_0 + s_472_486 * g_472_low60_0_low20_0 = g_472_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_14 + u_472_486 * (const 64 (2**21)) + v_472_486 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_14 + r_472_486 * (const 64 (2**21)) + s_472_486 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_14,
    f_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_14,
    g_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 486)) <=s delta, delta <=s (const 64 (1 + 2*486)),
    (const 64 (-(2**20))) <=s u_472_486, u_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_486, v_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_486, r_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_486, s_472_486 <=s (const 64 ((2**20))),
    u_472_486 + v_472_486 <=s (const 64 (2**20)),
    u_472_486 - v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 + v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 - v_472_486 <=s (const 64 (2**20)),
    r_472_486 + s_472_486 <=s (const 64 (2**20)),
    r_472_486 - s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 + s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 - s_472_486 <=s (const 64 (2**20)),
    u_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_472_486 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step486

// premise b
assume
g_472_low60_0_low20_14 = 1 (mod 2)
&&
g_472_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_15 f_472_low60_0_low20_14;
mov u_472_487 u_472_486;
mov v_472_487 v_472_486;

add g_472_low60_0_low20_15 g_472_low60_0_low20_14 f_472_low60_0_low20_14;
asr g_472_low60_0_low20_15 g_472_low60_0_low20_15 1;
add r_472_487 r_472_486 u_472_486;
asr r_472_487 r_472_487 1;
add s_472_487 s_472_486 v_472_486;
asr s_472_487 s_472_487 1;
assert
    true
&&
    f_472_low60_0_low20_15 = f_472_low60_0_low20_14,
    u_472_487 = u_472_486,
    v_472_487 = v_472_486,
    g_472_low60_0_low20_15 * (const 64 2) = g_472_low60_0_low20_14 + f_472_low60_0_low20_14,
    r_472_487 * (const 64 2) = r_472_486 + u_472_486,
    s_472_487 * (const 64 2) = s_472_486 + v_472_486
;

assume
    f_472_low60_0_low20_15 = f_472_low60_0_low20_14,
    u_472_487 = u_472_486,
    v_472_487 = v_472_486,
    g_472_low60_0_low20_15 * 2 = g_472_low60_0_low20_14 + f_472_low60_0_low20_14,
    r_472_487 * 2 = r_472_486 + u_472_486,
    s_472_487 * 2 = s_472_486 + v_472_486
&&
    true
;

{
    u_472_487 * f_472_low60_0_low20_0 + v_472_487 * g_472_low60_0_low20_0 = f_472_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_487 * f_472_low60_0_low20_0 + s_472_487 * g_472_low60_0_low20_0 = g_472_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_15 + u_472_487 * (const 64 (2**21)) + v_472_487 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_15 + r_472_487 * (const 64 (2**21)) + s_472_487 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_15,
    f_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_15,
    g_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 487)) <=s delta, delta <=s (const 64 (1 + 2*487)),
    (const 64 (-(2**20))) <=s u_472_487, u_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_487, v_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_487, r_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_487, s_472_487 <=s (const 64 ((2**20))),
    u_472_487 + v_472_487 <=s (const 64 (2**20)),
    u_472_487 - v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 + v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 - v_472_487 <=s (const 64 (2**20)),
    r_472_487 + s_472_487 <=s (const 64 (2**20)),
    r_472_487 - s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 + s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 - s_472_487 <=s (const 64 (2**20)),
    u_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_472_487 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_486_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_14,
sint64 g_472_low60_0_low20_14,
sint64 f_472_low60_0_low20_15,
sint64 g_472_low60_0_low20_15,
sint64 u_472_486,
sint64 v_472_486,
sint64 r_472_486,
sint64 s_472_486,
sint64 u_472_487,
sint64 v_472_487,
sint64 r_472_487,
sint64 s_472_487,
bit ne
)={
    u_472_486 * f_472_low60_0_low20_0 + v_472_486 * g_472_low60_0_low20_0 = f_472_low60_0_low20_14 * (-(2**20)),
    r_472_486 * f_472_low60_0_low20_0 + s_472_486 * g_472_low60_0_low20_0 = g_472_low60_0_low20_14 * (-(2**20))
&&
    u_472_486 * f_472_low60_0_low20_0 + v_472_486 * g_472_low60_0_low20_0 = f_472_low60_0_low20_14 * (const 64 (-(2**20))),
    r_472_486 * f_472_low60_0_low20_0 + s_472_486 * g_472_low60_0_low20_0 = g_472_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_14 + u_472_486 * (const 64 (2**21)) + v_472_486 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_14 + r_472_486 * (const 64 (2**21)) + s_472_486 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_14,
    f_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_14,
    g_472_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 486)) <=s delta, delta <=s (const 64 (1 + 2*486)),
    (const 64 (-(2**20))) <=s u_472_486, u_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_486, v_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_486, r_472_486 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_486, s_472_486 <=s (const 64 ((2**20))),
    u_472_486 + v_472_486 <=s (const 64 (2**20)),
    u_472_486 - v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 + v_472_486 <=s (const 64 (2**20)),
    (const 64 0) - u_472_486 - v_472_486 <=s (const 64 (2**20)),
    r_472_486 + s_472_486 <=s (const 64 (2**20)),
    r_472_486 - s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 + s_472_486 <=s (const 64 (2**20)),
    (const 64 0) - r_472_486 - s_472_486 <=s (const 64 (2**20)),
    u_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_472_486 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_472_486 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step486

// premise c
assume
g_472_low60_0_low20_14 = 1 (mod 2)
&&
g_472_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_15 g_472_low60_0_low20_14;
mov u_472_487 r_472_486;
mov v_472_487 s_472_486;

subs dc g_472_low60_0_low20_15 g_472_low60_0_low20_14 f_472_low60_0_low20_14;
asr g_472_low60_0_low20_15 g_472_low60_0_low20_15 1;
subs dc r_472_487 r_472_486 u_472_486;
asr r_472_487 r_472_487 1;
subs dc s_472_487 s_472_486 v_472_486;
asr s_472_487 s_472_487 1;
assert
    true
&&
    f_472_low60_0_low20_15 = g_472_low60_0_low20_14,
    u_472_487 = r_472_486,
    v_472_487 = s_472_486,
    g_472_low60_0_low20_15 * (const 64 2) = g_472_low60_0_low20_14 - f_472_low60_0_low20_14,
    r_472_487 * (const 64 2) = r_472_486 - u_472_486,
    s_472_487 * (const 64 2) = s_472_486 - v_472_486
;

assume
    f_472_low60_0_low20_15 = g_472_low60_0_low20_14,
    u_472_487 = r_472_486,
    v_472_487 = s_472_486,
    g_472_low60_0_low20_15 * 2 = g_472_low60_0_low20_14 - f_472_low60_0_low20_14,
    r_472_487 * 2 = r_472_486 - u_472_486,
    s_472_487 * 2 = s_472_486 - v_472_486
&&
    true
;

{
    u_472_487 * f_472_low60_0_low20_0 + v_472_487 * g_472_low60_0_low20_0 = f_472_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_487 * f_472_low60_0_low20_0 + s_472_487 * g_472_low60_0_low20_0 = g_472_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_15 + u_472_487 * (const 64 (2**21)) + v_472_487 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_15 + r_472_487 * (const 64 (2**21)) + s_472_487 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_15,
    f_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_15,
    g_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 487)) <=s delta, delta <=s (const 64 (1 + 2*487)),
    (const 64 (-(2**20))) <=s u_472_487, u_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_487, v_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_487, r_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_487, s_472_487 <=s (const 64 ((2**20))),
    u_472_487 + v_472_487 <=s (const 64 (2**20)),
    u_472_487 - v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 + v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 - v_472_487 <=s (const 64 (2**20)),
    r_472_487 + s_472_487 <=s (const 64 (2**20)),
    r_472_487 - s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 + s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 - s_472_487 <=s (const 64 (2**20)),
    u_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_472_487 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_487_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_15,
sint64 g_472_low60_0_low20_15,
sint64 f_472_low60_0_low20_16,
sint64 g_472_low60_0_low20_16,
sint64 u_472_487,
sint64 v_472_487,
sint64 r_472_487,
sint64 s_472_487,
sint64 u_472_488,
sint64 v_472_488,
sint64 r_472_488,
sint64 s_472_488,
bit ne
)={
    u_472_487 * f_472_low60_0_low20_0 + v_472_487 * g_472_low60_0_low20_0 = f_472_low60_0_low20_15 * (-(2**20)),
    r_472_487 * f_472_low60_0_low20_0 + s_472_487 * g_472_low60_0_low20_0 = g_472_low60_0_low20_15 * (-(2**20))
&&
    u_472_487 * f_472_low60_0_low20_0 + v_472_487 * g_472_low60_0_low20_0 = f_472_low60_0_low20_15 * (const 64 (-(2**20))),
    r_472_487 * f_472_low60_0_low20_0 + s_472_487 * g_472_low60_0_low20_0 = g_472_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_15 + u_472_487 * (const 64 (2**21)) + v_472_487 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_15 + r_472_487 * (const 64 (2**21)) + s_472_487 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_15,
    f_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_15,
    g_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 487)) <=s delta, delta <=s (const 64 (1 + 2*487)),
    (const 64 (-(2**20))) <=s u_472_487, u_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_487, v_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_487, r_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_487, s_472_487 <=s (const 64 ((2**20))),
    u_472_487 + v_472_487 <=s (const 64 (2**20)),
    u_472_487 - v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 + v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 - v_472_487 <=s (const 64 (2**20)),
    r_472_487 + s_472_487 <=s (const 64 (2**20)),
    r_472_487 - s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 + s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 - s_472_487 <=s (const 64 (2**20)),
    u_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_472_487 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step487

// premise a
assume
g_472_low60_0_low20_15 = 0 (mod 2)
&&
g_472_low60_0_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_16 f_472_low60_0_low20_15;
mov u_472_488 u_472_487;
mov v_472_488 v_472_487;

asr g_472_low60_0_low20_16 g_472_low60_0_low20_15 1;
asr r_472_488 r_472_487 1;
asr s_472_488 s_472_487 1;
assert
    true
&&
    f_472_low60_0_low20_16 = f_472_low60_0_low20_15,
    u_472_488 = u_472_487,
    v_472_488 = v_472_487,
    g_472_low60_0_low20_16 * (const 64 2) = g_472_low60_0_low20_15,
    r_472_488 * (const 64 2) = r_472_487,
    s_472_488 * (const 64 2) = s_472_487
;

assume
    f_472_low60_0_low20_16 = f_472_low60_0_low20_15,
    u_472_488 = u_472_487,
    v_472_488 = v_472_487,
    g_472_low60_0_low20_16 * 2 = g_472_low60_0_low20_15,
    r_472_488 * 2 = r_472_487,
    s_472_488 * 2 = s_472_487
&&
    true
;

{
    u_472_488 * f_472_low60_0_low20_0 + v_472_488 * g_472_low60_0_low20_0 = f_472_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_488 * f_472_low60_0_low20_0 + s_472_488 * g_472_low60_0_low20_0 = g_472_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_16 + u_472_488 * (const 64 (2**21)) + v_472_488 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_16 + r_472_488 * (const 64 (2**21)) + s_472_488 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_16,
    f_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_16,
    g_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 488)) <=s delta, delta <=s (const 64 (1 + 2*488)),
    (const 64 (-(2**20))) <=s u_472_488, u_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_488, v_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_488, r_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_488, s_472_488 <=s (const 64 ((2**20))),
    u_472_488 + v_472_488 <=s (const 64 (2**20)),
    u_472_488 - v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 + v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 - v_472_488 <=s (const 64 (2**20)),
    r_472_488 + s_472_488 <=s (const 64 (2**20)),
    r_472_488 - s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 + s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 - s_472_488 <=s (const 64 (2**20)),
    u_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_472_488 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_487_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_15,
sint64 g_472_low60_0_low20_15,
sint64 f_472_low60_0_low20_16,
sint64 g_472_low60_0_low20_16,
sint64 u_472_487,
sint64 v_472_487,
sint64 r_472_487,
sint64 s_472_487,
sint64 u_472_488,
sint64 v_472_488,
sint64 r_472_488,
sint64 s_472_488,
bit ne
)={
    u_472_487 * f_472_low60_0_low20_0 + v_472_487 * g_472_low60_0_low20_0 = f_472_low60_0_low20_15 * (-(2**20)),
    r_472_487 * f_472_low60_0_low20_0 + s_472_487 * g_472_low60_0_low20_0 = g_472_low60_0_low20_15 * (-(2**20))
&&
    u_472_487 * f_472_low60_0_low20_0 + v_472_487 * g_472_low60_0_low20_0 = f_472_low60_0_low20_15 * (const 64 (-(2**20))),
    r_472_487 * f_472_low60_0_low20_0 + s_472_487 * g_472_low60_0_low20_0 = g_472_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_15 + u_472_487 * (const 64 (2**21)) + v_472_487 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_15 + r_472_487 * (const 64 (2**21)) + s_472_487 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_15,
    f_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_15,
    g_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 487)) <=s delta, delta <=s (const 64 (1 + 2*487)),
    (const 64 (-(2**20))) <=s u_472_487, u_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_487, v_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_487, r_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_487, s_472_487 <=s (const 64 ((2**20))),
    u_472_487 + v_472_487 <=s (const 64 (2**20)),
    u_472_487 - v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 + v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 - v_472_487 <=s (const 64 (2**20)),
    r_472_487 + s_472_487 <=s (const 64 (2**20)),
    r_472_487 - s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 + s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 - s_472_487 <=s (const 64 (2**20)),
    u_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_472_487 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step487

// premise b
assume
g_472_low60_0_low20_15 = 1 (mod 2)
&&
g_472_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_16 f_472_low60_0_low20_15;
mov u_472_488 u_472_487;
mov v_472_488 v_472_487;

add g_472_low60_0_low20_16 g_472_low60_0_low20_15 f_472_low60_0_low20_15;
asr g_472_low60_0_low20_16 g_472_low60_0_low20_16 1;
add r_472_488 r_472_487 u_472_487;
asr r_472_488 r_472_488 1;
add s_472_488 s_472_487 v_472_487;
asr s_472_488 s_472_488 1;
assert
    true
&&
    f_472_low60_0_low20_16 = f_472_low60_0_low20_15,
    u_472_488 = u_472_487,
    v_472_488 = v_472_487,
    g_472_low60_0_low20_16 * (const 64 2) = g_472_low60_0_low20_15 + f_472_low60_0_low20_15,
    r_472_488 * (const 64 2) = r_472_487 + u_472_487,
    s_472_488 * (const 64 2) = s_472_487 + v_472_487
;

assume
    f_472_low60_0_low20_16 = f_472_low60_0_low20_15,
    u_472_488 = u_472_487,
    v_472_488 = v_472_487,
    g_472_low60_0_low20_16 * 2 = g_472_low60_0_low20_15 + f_472_low60_0_low20_15,
    r_472_488 * 2 = r_472_487 + u_472_487,
    s_472_488 * 2 = s_472_487 + v_472_487
&&
    true
;

{
    u_472_488 * f_472_low60_0_low20_0 + v_472_488 * g_472_low60_0_low20_0 = f_472_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_488 * f_472_low60_0_low20_0 + s_472_488 * g_472_low60_0_low20_0 = g_472_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_16 + u_472_488 * (const 64 (2**21)) + v_472_488 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_16 + r_472_488 * (const 64 (2**21)) + s_472_488 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_16,
    f_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_16,
    g_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 488)) <=s delta, delta <=s (const 64 (1 + 2*488)),
    (const 64 (-(2**20))) <=s u_472_488, u_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_488, v_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_488, r_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_488, s_472_488 <=s (const 64 ((2**20))),
    u_472_488 + v_472_488 <=s (const 64 (2**20)),
    u_472_488 - v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 + v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 - v_472_488 <=s (const 64 (2**20)),
    r_472_488 + s_472_488 <=s (const 64 (2**20)),
    r_472_488 - s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 + s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 - s_472_488 <=s (const 64 (2**20)),
    u_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_472_488 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_487_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_15,
sint64 g_472_low60_0_low20_15,
sint64 f_472_low60_0_low20_16,
sint64 g_472_low60_0_low20_16,
sint64 u_472_487,
sint64 v_472_487,
sint64 r_472_487,
sint64 s_472_487,
sint64 u_472_488,
sint64 v_472_488,
sint64 r_472_488,
sint64 s_472_488,
bit ne
)={
    u_472_487 * f_472_low60_0_low20_0 + v_472_487 * g_472_low60_0_low20_0 = f_472_low60_0_low20_15 * (-(2**20)),
    r_472_487 * f_472_low60_0_low20_0 + s_472_487 * g_472_low60_0_low20_0 = g_472_low60_0_low20_15 * (-(2**20))
&&
    u_472_487 * f_472_low60_0_low20_0 + v_472_487 * g_472_low60_0_low20_0 = f_472_low60_0_low20_15 * (const 64 (-(2**20))),
    r_472_487 * f_472_low60_0_low20_0 + s_472_487 * g_472_low60_0_low20_0 = g_472_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_15 + u_472_487 * (const 64 (2**21)) + v_472_487 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_15 + r_472_487 * (const 64 (2**21)) + s_472_487 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_15,
    f_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_15,
    g_472_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 487)) <=s delta, delta <=s (const 64 (1 + 2*487)),
    (const 64 (-(2**20))) <=s u_472_487, u_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_487, v_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_487, r_472_487 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_487, s_472_487 <=s (const 64 ((2**20))),
    u_472_487 + v_472_487 <=s (const 64 (2**20)),
    u_472_487 - v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 + v_472_487 <=s (const 64 (2**20)),
    (const 64 0) - u_472_487 - v_472_487 <=s (const 64 (2**20)),
    r_472_487 + s_472_487 <=s (const 64 (2**20)),
    r_472_487 - s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 + s_472_487 <=s (const 64 (2**20)),
    (const 64 0) - r_472_487 - s_472_487 <=s (const 64 (2**20)),
    u_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_472_487 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_472_487 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step487

// premise c
assume
g_472_low60_0_low20_15 = 1 (mod 2)
&&
g_472_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_16 g_472_low60_0_low20_15;
mov u_472_488 r_472_487;
mov v_472_488 s_472_487;

subs dc g_472_low60_0_low20_16 g_472_low60_0_low20_15 f_472_low60_0_low20_15;
asr g_472_low60_0_low20_16 g_472_low60_0_low20_16 1;
subs dc r_472_488 r_472_487 u_472_487;
asr r_472_488 r_472_488 1;
subs dc s_472_488 s_472_487 v_472_487;
asr s_472_488 s_472_488 1;
assert
    true
&&
    f_472_low60_0_low20_16 = g_472_low60_0_low20_15,
    u_472_488 = r_472_487,
    v_472_488 = s_472_487,
    g_472_low60_0_low20_16 * (const 64 2) = g_472_low60_0_low20_15 - f_472_low60_0_low20_15,
    r_472_488 * (const 64 2) = r_472_487 - u_472_487,
    s_472_488 * (const 64 2) = s_472_487 - v_472_487
;

assume
    f_472_low60_0_low20_16 = g_472_low60_0_low20_15,
    u_472_488 = r_472_487,
    v_472_488 = s_472_487,
    g_472_low60_0_low20_16 * 2 = g_472_low60_0_low20_15 - f_472_low60_0_low20_15,
    r_472_488 * 2 = r_472_487 - u_472_487,
    s_472_488 * 2 = s_472_487 - v_472_487
&&
    true
;

{
    u_472_488 * f_472_low60_0_low20_0 + v_472_488 * g_472_low60_0_low20_0 = f_472_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_488 * f_472_low60_0_low20_0 + s_472_488 * g_472_low60_0_low20_0 = g_472_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_16 + u_472_488 * (const 64 (2**21)) + v_472_488 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_16 + r_472_488 * (const 64 (2**21)) + s_472_488 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_16,
    f_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_16,
    g_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 488)) <=s delta, delta <=s (const 64 (1 + 2*488)),
    (const 64 (-(2**20))) <=s u_472_488, u_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_488, v_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_488, r_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_488, s_472_488 <=s (const 64 ((2**20))),
    u_472_488 + v_472_488 <=s (const 64 (2**20)),
    u_472_488 - v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 + v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 - v_472_488 <=s (const 64 (2**20)),
    r_472_488 + s_472_488 <=s (const 64 (2**20)),
    r_472_488 - s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 + s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 - s_472_488 <=s (const 64 (2**20)),
    u_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_472_488 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_488_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_16,
sint64 g_472_low60_0_low20_16,
sint64 f_472_low60_0_low20_17,
sint64 g_472_low60_0_low20_17,
sint64 u_472_488,
sint64 v_472_488,
sint64 r_472_488,
sint64 s_472_488,
sint64 u_472_489,
sint64 v_472_489,
sint64 r_472_489,
sint64 s_472_489,
bit ne
)={
    u_472_488 * f_472_low60_0_low20_0 + v_472_488 * g_472_low60_0_low20_0 = f_472_low60_0_low20_16 * (-(2**20)),
    r_472_488 * f_472_low60_0_low20_0 + s_472_488 * g_472_low60_0_low20_0 = g_472_low60_0_low20_16 * (-(2**20))
&&
    u_472_488 * f_472_low60_0_low20_0 + v_472_488 * g_472_low60_0_low20_0 = f_472_low60_0_low20_16 * (const 64 (-(2**20))),
    r_472_488 * f_472_low60_0_low20_0 + s_472_488 * g_472_low60_0_low20_0 = g_472_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_16 + u_472_488 * (const 64 (2**21)) + v_472_488 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_16 + r_472_488 * (const 64 (2**21)) + s_472_488 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_16,
    f_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_16,
    g_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 488)) <=s delta, delta <=s (const 64 (1 + 2*488)),
    (const 64 (-(2**20))) <=s u_472_488, u_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_488, v_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_488, r_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_488, s_472_488 <=s (const 64 ((2**20))),
    u_472_488 + v_472_488 <=s (const 64 (2**20)),
    u_472_488 - v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 + v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 - v_472_488 <=s (const 64 (2**20)),
    r_472_488 + s_472_488 <=s (const 64 (2**20)),
    r_472_488 - s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 + s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 - s_472_488 <=s (const 64 (2**20)),
    u_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_472_488 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step488

// premise a
assume
g_472_low60_0_low20_16 = 0 (mod 2)
&&
g_472_low60_0_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_17 f_472_low60_0_low20_16;
mov u_472_489 u_472_488;
mov v_472_489 v_472_488;

asr g_472_low60_0_low20_17 g_472_low60_0_low20_16 1;
asr r_472_489 r_472_488 1;
asr s_472_489 s_472_488 1;
assert
    true
&&
    f_472_low60_0_low20_17 = f_472_low60_0_low20_16,
    u_472_489 = u_472_488,
    v_472_489 = v_472_488,
    g_472_low60_0_low20_17 * (const 64 2) = g_472_low60_0_low20_16,
    r_472_489 * (const 64 2) = r_472_488,
    s_472_489 * (const 64 2) = s_472_488
;

assume
    f_472_low60_0_low20_17 = f_472_low60_0_low20_16,
    u_472_489 = u_472_488,
    v_472_489 = v_472_488,
    g_472_low60_0_low20_17 * 2 = g_472_low60_0_low20_16,
    r_472_489 * 2 = r_472_488,
    s_472_489 * 2 = s_472_488
&&
    true
;

{
    u_472_489 * f_472_low60_0_low20_0 + v_472_489 * g_472_low60_0_low20_0 = f_472_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_489 * f_472_low60_0_low20_0 + s_472_489 * g_472_low60_0_low20_0 = g_472_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_17 + u_472_489 * (const 64 (2**21)) + v_472_489 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_17 + r_472_489 * (const 64 (2**21)) + s_472_489 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_17,
    f_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_17,
    g_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 489)) <=s delta, delta <=s (const 64 (1 + 2*489)),
    (const 64 (-(2**20))) <=s u_472_489, u_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_489, v_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_489, r_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_489, s_472_489 <=s (const 64 ((2**20))),
    u_472_489 + v_472_489 <=s (const 64 (2**20)),
    u_472_489 - v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 + v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 - v_472_489 <=s (const 64 (2**20)),
    r_472_489 + s_472_489 <=s (const 64 (2**20)),
    r_472_489 - s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 + s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 - s_472_489 <=s (const 64 (2**20)),
    u_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_472_489 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_488_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_16,
sint64 g_472_low60_0_low20_16,
sint64 f_472_low60_0_low20_17,
sint64 g_472_low60_0_low20_17,
sint64 u_472_488,
sint64 v_472_488,
sint64 r_472_488,
sint64 s_472_488,
sint64 u_472_489,
sint64 v_472_489,
sint64 r_472_489,
sint64 s_472_489,
bit ne
)={
    u_472_488 * f_472_low60_0_low20_0 + v_472_488 * g_472_low60_0_low20_0 = f_472_low60_0_low20_16 * (-(2**20)),
    r_472_488 * f_472_low60_0_low20_0 + s_472_488 * g_472_low60_0_low20_0 = g_472_low60_0_low20_16 * (-(2**20))
&&
    u_472_488 * f_472_low60_0_low20_0 + v_472_488 * g_472_low60_0_low20_0 = f_472_low60_0_low20_16 * (const 64 (-(2**20))),
    r_472_488 * f_472_low60_0_low20_0 + s_472_488 * g_472_low60_0_low20_0 = g_472_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_16 + u_472_488 * (const 64 (2**21)) + v_472_488 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_16 + r_472_488 * (const 64 (2**21)) + s_472_488 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_16,
    f_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_16,
    g_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 488)) <=s delta, delta <=s (const 64 (1 + 2*488)),
    (const 64 (-(2**20))) <=s u_472_488, u_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_488, v_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_488, r_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_488, s_472_488 <=s (const 64 ((2**20))),
    u_472_488 + v_472_488 <=s (const 64 (2**20)),
    u_472_488 - v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 + v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 - v_472_488 <=s (const 64 (2**20)),
    r_472_488 + s_472_488 <=s (const 64 (2**20)),
    r_472_488 - s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 + s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 - s_472_488 <=s (const 64 (2**20)),
    u_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_472_488 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step488

// premise b
assume
g_472_low60_0_low20_16 = 1 (mod 2)
&&
g_472_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_17 f_472_low60_0_low20_16;
mov u_472_489 u_472_488;
mov v_472_489 v_472_488;

add g_472_low60_0_low20_17 g_472_low60_0_low20_16 f_472_low60_0_low20_16;
asr g_472_low60_0_low20_17 g_472_low60_0_low20_17 1;
add r_472_489 r_472_488 u_472_488;
asr r_472_489 r_472_489 1;
add s_472_489 s_472_488 v_472_488;
asr s_472_489 s_472_489 1;
assert
    true
&&
    f_472_low60_0_low20_17 = f_472_low60_0_low20_16,
    u_472_489 = u_472_488,
    v_472_489 = v_472_488,
    g_472_low60_0_low20_17 * (const 64 2) = g_472_low60_0_low20_16 + f_472_low60_0_low20_16,
    r_472_489 * (const 64 2) = r_472_488 + u_472_488,
    s_472_489 * (const 64 2) = s_472_488 + v_472_488
;

assume
    f_472_low60_0_low20_17 = f_472_low60_0_low20_16,
    u_472_489 = u_472_488,
    v_472_489 = v_472_488,
    g_472_low60_0_low20_17 * 2 = g_472_low60_0_low20_16 + f_472_low60_0_low20_16,
    r_472_489 * 2 = r_472_488 + u_472_488,
    s_472_489 * 2 = s_472_488 + v_472_488
&&
    true
;

{
    u_472_489 * f_472_low60_0_low20_0 + v_472_489 * g_472_low60_0_low20_0 = f_472_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_489 * f_472_low60_0_low20_0 + s_472_489 * g_472_low60_0_low20_0 = g_472_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_17 + u_472_489 * (const 64 (2**21)) + v_472_489 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_17 + r_472_489 * (const 64 (2**21)) + s_472_489 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_17,
    f_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_17,
    g_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 489)) <=s delta, delta <=s (const 64 (1 + 2*489)),
    (const 64 (-(2**20))) <=s u_472_489, u_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_489, v_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_489, r_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_489, s_472_489 <=s (const 64 ((2**20))),
    u_472_489 + v_472_489 <=s (const 64 (2**20)),
    u_472_489 - v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 + v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 - v_472_489 <=s (const 64 (2**20)),
    r_472_489 + s_472_489 <=s (const 64 (2**20)),
    r_472_489 - s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 + s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 - s_472_489 <=s (const 64 (2**20)),
    u_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_472_489 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_488_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_16,
sint64 g_472_low60_0_low20_16,
sint64 f_472_low60_0_low20_17,
sint64 g_472_low60_0_low20_17,
sint64 u_472_488,
sint64 v_472_488,
sint64 r_472_488,
sint64 s_472_488,
sint64 u_472_489,
sint64 v_472_489,
sint64 r_472_489,
sint64 s_472_489,
bit ne
)={
    u_472_488 * f_472_low60_0_low20_0 + v_472_488 * g_472_low60_0_low20_0 = f_472_low60_0_low20_16 * (-(2**20)),
    r_472_488 * f_472_low60_0_low20_0 + s_472_488 * g_472_low60_0_low20_0 = g_472_low60_0_low20_16 * (-(2**20))
&&
    u_472_488 * f_472_low60_0_low20_0 + v_472_488 * g_472_low60_0_low20_0 = f_472_low60_0_low20_16 * (const 64 (-(2**20))),
    r_472_488 * f_472_low60_0_low20_0 + s_472_488 * g_472_low60_0_low20_0 = g_472_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_16 + u_472_488 * (const 64 (2**21)) + v_472_488 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_16 + r_472_488 * (const 64 (2**21)) + s_472_488 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_16,
    f_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_16,
    g_472_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 488)) <=s delta, delta <=s (const 64 (1 + 2*488)),
    (const 64 (-(2**20))) <=s u_472_488, u_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_488, v_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_488, r_472_488 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_488, s_472_488 <=s (const 64 ((2**20))),
    u_472_488 + v_472_488 <=s (const 64 (2**20)),
    u_472_488 - v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 + v_472_488 <=s (const 64 (2**20)),
    (const 64 0) - u_472_488 - v_472_488 <=s (const 64 (2**20)),
    r_472_488 + s_472_488 <=s (const 64 (2**20)),
    r_472_488 - s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 + s_472_488 <=s (const 64 (2**20)),
    (const 64 0) - r_472_488 - s_472_488 <=s (const 64 (2**20)),
    u_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_472_488 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_472_488 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step488

// premise c
assume
g_472_low60_0_low20_16 = 1 (mod 2)
&&
g_472_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_17 g_472_low60_0_low20_16;
mov u_472_489 r_472_488;
mov v_472_489 s_472_488;

subs dc g_472_low60_0_low20_17 g_472_low60_0_low20_16 f_472_low60_0_low20_16;
asr g_472_low60_0_low20_17 g_472_low60_0_low20_17 1;
subs dc r_472_489 r_472_488 u_472_488;
asr r_472_489 r_472_489 1;
subs dc s_472_489 s_472_488 v_472_488;
asr s_472_489 s_472_489 1;
assert
    true
&&
    f_472_low60_0_low20_17 = g_472_low60_0_low20_16,
    u_472_489 = r_472_488,
    v_472_489 = s_472_488,
    g_472_low60_0_low20_17 * (const 64 2) = g_472_low60_0_low20_16 - f_472_low60_0_low20_16,
    r_472_489 * (const 64 2) = r_472_488 - u_472_488,
    s_472_489 * (const 64 2) = s_472_488 - v_472_488
;

assume
    f_472_low60_0_low20_17 = g_472_low60_0_low20_16,
    u_472_489 = r_472_488,
    v_472_489 = s_472_488,
    g_472_low60_0_low20_17 * 2 = g_472_low60_0_low20_16 - f_472_low60_0_low20_16,
    r_472_489 * 2 = r_472_488 - u_472_488,
    s_472_489 * 2 = s_472_488 - v_472_488
&&
    true
;

{
    u_472_489 * f_472_low60_0_low20_0 + v_472_489 * g_472_low60_0_low20_0 = f_472_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_489 * f_472_low60_0_low20_0 + s_472_489 * g_472_low60_0_low20_0 = g_472_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_17 + u_472_489 * (const 64 (2**21)) + v_472_489 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_17 + r_472_489 * (const 64 (2**21)) + s_472_489 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_17,
    f_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_17,
    g_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 489)) <=s delta, delta <=s (const 64 (1 + 2*489)),
    (const 64 (-(2**20))) <=s u_472_489, u_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_489, v_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_489, r_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_489, s_472_489 <=s (const 64 ((2**20))),
    u_472_489 + v_472_489 <=s (const 64 (2**20)),
    u_472_489 - v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 + v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 - v_472_489 <=s (const 64 (2**20)),
    r_472_489 + s_472_489 <=s (const 64 (2**20)),
    r_472_489 - s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 + s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 - s_472_489 <=s (const 64 (2**20)),
    u_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_472_489 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_489_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_17,
sint64 g_472_low60_0_low20_17,
sint64 f_472_low60_0_low20_18,
sint64 g_472_low60_0_low20_18,
sint64 u_472_489,
sint64 v_472_489,
sint64 r_472_489,
sint64 s_472_489,
sint64 u_472_490,
sint64 v_472_490,
sint64 r_472_490,
sint64 s_472_490,
bit ne
)={
    u_472_489 * f_472_low60_0_low20_0 + v_472_489 * g_472_low60_0_low20_0 = f_472_low60_0_low20_17 * (-(2**20)),
    r_472_489 * f_472_low60_0_low20_0 + s_472_489 * g_472_low60_0_low20_0 = g_472_low60_0_low20_17 * (-(2**20))
&&
    u_472_489 * f_472_low60_0_low20_0 + v_472_489 * g_472_low60_0_low20_0 = f_472_low60_0_low20_17 * (const 64 (-(2**20))),
    r_472_489 * f_472_low60_0_low20_0 + s_472_489 * g_472_low60_0_low20_0 = g_472_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_17 + u_472_489 * (const 64 (2**21)) + v_472_489 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_17 + r_472_489 * (const 64 (2**21)) + s_472_489 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_17,
    f_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_17,
    g_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 489)) <=s delta, delta <=s (const 64 (1 + 2*489)),
    (const 64 (-(2**20))) <=s u_472_489, u_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_489, v_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_489, r_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_489, s_472_489 <=s (const 64 ((2**20))),
    u_472_489 + v_472_489 <=s (const 64 (2**20)),
    u_472_489 - v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 + v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 - v_472_489 <=s (const 64 (2**20)),
    r_472_489 + s_472_489 <=s (const 64 (2**20)),
    r_472_489 - s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 + s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 - s_472_489 <=s (const 64 (2**20)),
    u_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_472_489 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step489

// premise a
assume
g_472_low60_0_low20_17 = 0 (mod 2)
&&
g_472_low60_0_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_18 f_472_low60_0_low20_17;
mov u_472_490 u_472_489;
mov v_472_490 v_472_489;

asr g_472_low60_0_low20_18 g_472_low60_0_low20_17 1;
asr r_472_490 r_472_489 1;
asr s_472_490 s_472_489 1;
assert
    true
&&
    f_472_low60_0_low20_18 = f_472_low60_0_low20_17,
    u_472_490 = u_472_489,
    v_472_490 = v_472_489,
    g_472_low60_0_low20_18 * (const 64 2) = g_472_low60_0_low20_17,
    r_472_490 * (const 64 2) = r_472_489,
    s_472_490 * (const 64 2) = s_472_489
;

assume
    f_472_low60_0_low20_18 = f_472_low60_0_low20_17,
    u_472_490 = u_472_489,
    v_472_490 = v_472_489,
    g_472_low60_0_low20_18 * 2 = g_472_low60_0_low20_17,
    r_472_490 * 2 = r_472_489,
    s_472_490 * 2 = s_472_489
&&
    true
;

{
    u_472_490 * f_472_low60_0_low20_0 + v_472_490 * g_472_low60_0_low20_0 = f_472_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_490 * f_472_low60_0_low20_0 + s_472_490 * g_472_low60_0_low20_0 = g_472_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_18 + u_472_490 * (const 64 (2**21)) + v_472_490 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_18 + r_472_490 * (const 64 (2**21)) + s_472_490 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_18,
    f_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_18,
    g_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 490)) <=s delta, delta <=s (const 64 (1 + 2*490)),
    (const 64 (-(2**20))) <=s u_472_490, u_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_490, v_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_490, r_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_490, s_472_490 <=s (const 64 ((2**20))),
    u_472_490 + v_472_490 <=s (const 64 (2**20)),
    u_472_490 - v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 + v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 - v_472_490 <=s (const 64 (2**20)),
    r_472_490 + s_472_490 <=s (const 64 (2**20)),
    r_472_490 - s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 + s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 - s_472_490 <=s (const 64 (2**20)),
    u_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_472_490 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_489_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_17,
sint64 g_472_low60_0_low20_17,
sint64 f_472_low60_0_low20_18,
sint64 g_472_low60_0_low20_18,
sint64 u_472_489,
sint64 v_472_489,
sint64 r_472_489,
sint64 s_472_489,
sint64 u_472_490,
sint64 v_472_490,
sint64 r_472_490,
sint64 s_472_490,
bit ne
)={
    u_472_489 * f_472_low60_0_low20_0 + v_472_489 * g_472_low60_0_low20_0 = f_472_low60_0_low20_17 * (-(2**20)),
    r_472_489 * f_472_low60_0_low20_0 + s_472_489 * g_472_low60_0_low20_0 = g_472_low60_0_low20_17 * (-(2**20))
&&
    u_472_489 * f_472_low60_0_low20_0 + v_472_489 * g_472_low60_0_low20_0 = f_472_low60_0_low20_17 * (const 64 (-(2**20))),
    r_472_489 * f_472_low60_0_low20_0 + s_472_489 * g_472_low60_0_low20_0 = g_472_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_17 + u_472_489 * (const 64 (2**21)) + v_472_489 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_17 + r_472_489 * (const 64 (2**21)) + s_472_489 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_17,
    f_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_17,
    g_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 489)) <=s delta, delta <=s (const 64 (1 + 2*489)),
    (const 64 (-(2**20))) <=s u_472_489, u_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_489, v_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_489, r_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_489, s_472_489 <=s (const 64 ((2**20))),
    u_472_489 + v_472_489 <=s (const 64 (2**20)),
    u_472_489 - v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 + v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 - v_472_489 <=s (const 64 (2**20)),
    r_472_489 + s_472_489 <=s (const 64 (2**20)),
    r_472_489 - s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 + s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 - s_472_489 <=s (const 64 (2**20)),
    u_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_472_489 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step489

// premise b
assume
g_472_low60_0_low20_17 = 1 (mod 2)
&&
g_472_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_18 f_472_low60_0_low20_17;
mov u_472_490 u_472_489;
mov v_472_490 v_472_489;

add g_472_low60_0_low20_18 g_472_low60_0_low20_17 f_472_low60_0_low20_17;
asr g_472_low60_0_low20_18 g_472_low60_0_low20_18 1;
add r_472_490 r_472_489 u_472_489;
asr r_472_490 r_472_490 1;
add s_472_490 s_472_489 v_472_489;
asr s_472_490 s_472_490 1;
assert
    true
&&
    f_472_low60_0_low20_18 = f_472_low60_0_low20_17,
    u_472_490 = u_472_489,
    v_472_490 = v_472_489,
    g_472_low60_0_low20_18 * (const 64 2) = g_472_low60_0_low20_17 + f_472_low60_0_low20_17,
    r_472_490 * (const 64 2) = r_472_489 + u_472_489,
    s_472_490 * (const 64 2) = s_472_489 + v_472_489
;

assume
    f_472_low60_0_low20_18 = f_472_low60_0_low20_17,
    u_472_490 = u_472_489,
    v_472_490 = v_472_489,
    g_472_low60_0_low20_18 * 2 = g_472_low60_0_low20_17 + f_472_low60_0_low20_17,
    r_472_490 * 2 = r_472_489 + u_472_489,
    s_472_490 * 2 = s_472_489 + v_472_489
&&
    true
;

{
    u_472_490 * f_472_low60_0_low20_0 + v_472_490 * g_472_low60_0_low20_0 = f_472_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_490 * f_472_low60_0_low20_0 + s_472_490 * g_472_low60_0_low20_0 = g_472_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_18 + u_472_490 * (const 64 (2**21)) + v_472_490 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_18 + r_472_490 * (const 64 (2**21)) + s_472_490 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_18,
    f_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_18,
    g_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 490)) <=s delta, delta <=s (const 64 (1 + 2*490)),
    (const 64 (-(2**20))) <=s u_472_490, u_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_490, v_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_490, r_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_490, s_472_490 <=s (const 64 ((2**20))),
    u_472_490 + v_472_490 <=s (const 64 (2**20)),
    u_472_490 - v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 + v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 - v_472_490 <=s (const 64 (2**20)),
    r_472_490 + s_472_490 <=s (const 64 (2**20)),
    r_472_490 - s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 + s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 - s_472_490 <=s (const 64 (2**20)),
    u_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_472_490 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_489_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_17,
sint64 g_472_low60_0_low20_17,
sint64 f_472_low60_0_low20_18,
sint64 g_472_low60_0_low20_18,
sint64 u_472_489,
sint64 v_472_489,
sint64 r_472_489,
sint64 s_472_489,
sint64 u_472_490,
sint64 v_472_490,
sint64 r_472_490,
sint64 s_472_490,
bit ne
)={
    u_472_489 * f_472_low60_0_low20_0 + v_472_489 * g_472_low60_0_low20_0 = f_472_low60_0_low20_17 * (-(2**20)),
    r_472_489 * f_472_low60_0_low20_0 + s_472_489 * g_472_low60_0_low20_0 = g_472_low60_0_low20_17 * (-(2**20))
&&
    u_472_489 * f_472_low60_0_low20_0 + v_472_489 * g_472_low60_0_low20_0 = f_472_low60_0_low20_17 * (const 64 (-(2**20))),
    r_472_489 * f_472_low60_0_low20_0 + s_472_489 * g_472_low60_0_low20_0 = g_472_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_17 + u_472_489 * (const 64 (2**21)) + v_472_489 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_17 + r_472_489 * (const 64 (2**21)) + s_472_489 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_17,
    f_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_17,
    g_472_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 489)) <=s delta, delta <=s (const 64 (1 + 2*489)),
    (const 64 (-(2**20))) <=s u_472_489, u_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_489, v_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_489, r_472_489 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_489, s_472_489 <=s (const 64 ((2**20))),
    u_472_489 + v_472_489 <=s (const 64 (2**20)),
    u_472_489 - v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 + v_472_489 <=s (const 64 (2**20)),
    (const 64 0) - u_472_489 - v_472_489 <=s (const 64 (2**20)),
    r_472_489 + s_472_489 <=s (const 64 (2**20)),
    r_472_489 - s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 + s_472_489 <=s (const 64 (2**20)),
    (const 64 0) - r_472_489 - s_472_489 <=s (const 64 (2**20)),
    u_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_472_489 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_472_489 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step489

// premise c
assume
g_472_low60_0_low20_17 = 1 (mod 2)
&&
g_472_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_18 g_472_low60_0_low20_17;
mov u_472_490 r_472_489;
mov v_472_490 s_472_489;

subs dc g_472_low60_0_low20_18 g_472_low60_0_low20_17 f_472_low60_0_low20_17;
asr g_472_low60_0_low20_18 g_472_low60_0_low20_18 1;
subs dc r_472_490 r_472_489 u_472_489;
asr r_472_490 r_472_490 1;
subs dc s_472_490 s_472_489 v_472_489;
asr s_472_490 s_472_490 1;
assert
    true
&&
    f_472_low60_0_low20_18 = g_472_low60_0_low20_17,
    u_472_490 = r_472_489,
    v_472_490 = s_472_489,
    g_472_low60_0_low20_18 * (const 64 2) = g_472_low60_0_low20_17 - f_472_low60_0_low20_17,
    r_472_490 * (const 64 2) = r_472_489 - u_472_489,
    s_472_490 * (const 64 2) = s_472_489 - v_472_489
;

assume
    f_472_low60_0_low20_18 = g_472_low60_0_low20_17,
    u_472_490 = r_472_489,
    v_472_490 = s_472_489,
    g_472_low60_0_low20_18 * 2 = g_472_low60_0_low20_17 - f_472_low60_0_low20_17,
    r_472_490 * 2 = r_472_489 - u_472_489,
    s_472_490 * 2 = s_472_489 - v_472_489
&&
    true
;

{
    u_472_490 * f_472_low60_0_low20_0 + v_472_490 * g_472_low60_0_low20_0 = f_472_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_490 * f_472_low60_0_low20_0 + s_472_490 * g_472_low60_0_low20_0 = g_472_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_18 + u_472_490 * (const 64 (2**21)) + v_472_490 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_18 + r_472_490 * (const 64 (2**21)) + s_472_490 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_18,
    f_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_18,
    g_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 490)) <=s delta, delta <=s (const 64 (1 + 2*490)),
    (const 64 (-(2**20))) <=s u_472_490, u_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_490, v_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_490, r_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_490, s_472_490 <=s (const 64 ((2**20))),
    u_472_490 + v_472_490 <=s (const 64 (2**20)),
    u_472_490 - v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 + v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 - v_472_490 <=s (const 64 (2**20)),
    r_472_490 + s_472_490 <=s (const 64 (2**20)),
    r_472_490 - s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 + s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 - s_472_490 <=s (const 64 (2**20)),
    u_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_472_490 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_490_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_18,
sint64 g_472_low60_0_low20_18,
sint64 f_472_low60_0_low20_19,
sint64 g_472_low60_0_low20_19,
sint64 u_472_490,
sint64 v_472_490,
sint64 r_472_490,
sint64 s_472_490,
sint64 u_472_491,
sint64 v_472_491,
sint64 r_472_491,
sint64 s_472_491,
bit ne
)={
    u_472_490 * f_472_low60_0_low20_0 + v_472_490 * g_472_low60_0_low20_0 = f_472_low60_0_low20_18 * (-(2**20)),
    r_472_490 * f_472_low60_0_low20_0 + s_472_490 * g_472_low60_0_low20_0 = g_472_low60_0_low20_18 * (-(2**20))
&&
    u_472_490 * f_472_low60_0_low20_0 + v_472_490 * g_472_low60_0_low20_0 = f_472_low60_0_low20_18 * (const 64 (-(2**20))),
    r_472_490 * f_472_low60_0_low20_0 + s_472_490 * g_472_low60_0_low20_0 = g_472_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_18 + u_472_490 * (const 64 (2**21)) + v_472_490 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_18 + r_472_490 * (const 64 (2**21)) + s_472_490 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_18,
    f_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_18,
    g_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 490)) <=s delta, delta <=s (const 64 (1 + 2*490)),
    (const 64 (-(2**20))) <=s u_472_490, u_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_490, v_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_490, r_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_490, s_472_490 <=s (const 64 ((2**20))),
    u_472_490 + v_472_490 <=s (const 64 (2**20)),
    u_472_490 - v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 + v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 - v_472_490 <=s (const 64 (2**20)),
    r_472_490 + s_472_490 <=s (const 64 (2**20)),
    r_472_490 - s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 + s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 - s_472_490 <=s (const 64 (2**20)),
    u_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_472_490 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step490

// premise a
assume
g_472_low60_0_low20_18 = 0 (mod 2)
&&
g_472_low60_0_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_0_low20_19 f_472_low60_0_low20_18;
mov u_472_491 u_472_490;
mov v_472_491 v_472_490;

asr g_472_low60_0_low20_19 g_472_low60_0_low20_18 1;
asr r_472_491 r_472_490 1;
asr s_472_491 s_472_490 1;
assert
    true
&&
    f_472_low60_0_low20_19 = f_472_low60_0_low20_18,
    u_472_491 = u_472_490,
    v_472_491 = v_472_490,
    g_472_low60_0_low20_19 * (const 64 2) = g_472_low60_0_low20_18,
    r_472_491 * (const 64 2) = r_472_490,
    s_472_491 * (const 64 2) = s_472_490
;

assume
    f_472_low60_0_low20_19 = f_472_low60_0_low20_18,
    u_472_491 = u_472_490,
    v_472_491 = v_472_490,
    g_472_low60_0_low20_19 * 2 = g_472_low60_0_low20_18,
    r_472_491 * 2 = r_472_490,
    s_472_491 * 2 = s_472_490
&&
    true
;

{
    u_472_491 * f_472_low60_0_low20_0 + v_472_491 * g_472_low60_0_low20_0 = f_472_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_491 * f_472_low60_0_low20_0 + s_472_491 * g_472_low60_0_low20_0 = g_472_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_19 + u_472_491 * (const 64 (2**21)) + v_472_491 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_19 + r_472_491 * (const 64 (2**21)) + s_472_491 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_19,
    f_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_19,
    g_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 491)) <=s delta, delta <=s (const 64 (1 + 2*491)),
    (const 64 (-(2**20))) <=s u_472_491, u_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_491, v_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_491, r_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_491, s_472_491 <=s (const 64 ((2**20))),
    u_472_491 + v_472_491 <=s (const 64 (2**20)),
    u_472_491 - v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 + v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 - v_472_491 <=s (const 64 (2**20)),
    r_472_491 + s_472_491 <=s (const 64 (2**20)),
    r_472_491 - s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 + s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 - s_472_491 <=s (const 64 (2**20)),
    u_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_472_491 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_490_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_18,
sint64 g_472_low60_0_low20_18,
sint64 f_472_low60_0_low20_19,
sint64 g_472_low60_0_low20_19,
sint64 u_472_490,
sint64 v_472_490,
sint64 r_472_490,
sint64 s_472_490,
sint64 u_472_491,
sint64 v_472_491,
sint64 r_472_491,
sint64 s_472_491,
bit ne
)={
    u_472_490 * f_472_low60_0_low20_0 + v_472_490 * g_472_low60_0_low20_0 = f_472_low60_0_low20_18 * (-(2**20)),
    r_472_490 * f_472_low60_0_low20_0 + s_472_490 * g_472_low60_0_low20_0 = g_472_low60_0_low20_18 * (-(2**20))
&&
    u_472_490 * f_472_low60_0_low20_0 + v_472_490 * g_472_low60_0_low20_0 = f_472_low60_0_low20_18 * (const 64 (-(2**20))),
    r_472_490 * f_472_low60_0_low20_0 + s_472_490 * g_472_low60_0_low20_0 = g_472_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_18 + u_472_490 * (const 64 (2**21)) + v_472_490 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_18 + r_472_490 * (const 64 (2**21)) + s_472_490 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_18,
    f_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_18,
    g_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 490)) <=s delta, delta <=s (const 64 (1 + 2*490)),
    (const 64 (-(2**20))) <=s u_472_490, u_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_490, v_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_490, r_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_490, s_472_490 <=s (const 64 ((2**20))),
    u_472_490 + v_472_490 <=s (const 64 (2**20)),
    u_472_490 - v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 + v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 - v_472_490 <=s (const 64 (2**20)),
    r_472_490 + s_472_490 <=s (const 64 (2**20)),
    r_472_490 - s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 + s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 - s_472_490 <=s (const 64 (2**20)),
    u_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_472_490 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step490

// premise b
assume
g_472_low60_0_low20_18 = 1 (mod 2)
&&
g_472_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_19 f_472_low60_0_low20_18;
mov u_472_491 u_472_490;
mov v_472_491 v_472_490;

add g_472_low60_0_low20_19 g_472_low60_0_low20_18 f_472_low60_0_low20_18;
asr g_472_low60_0_low20_19 g_472_low60_0_low20_19 1;
add r_472_491 r_472_490 u_472_490;
asr r_472_491 r_472_491 1;
add s_472_491 s_472_490 v_472_490;
asr s_472_491 s_472_491 1;
assert
    true
&&
    f_472_low60_0_low20_19 = f_472_low60_0_low20_18,
    u_472_491 = u_472_490,
    v_472_491 = v_472_490,
    g_472_low60_0_low20_19 * (const 64 2) = g_472_low60_0_low20_18 + f_472_low60_0_low20_18,
    r_472_491 * (const 64 2) = r_472_490 + u_472_490,
    s_472_491 * (const 64 2) = s_472_490 + v_472_490
;

assume
    f_472_low60_0_low20_19 = f_472_low60_0_low20_18,
    u_472_491 = u_472_490,
    v_472_491 = v_472_490,
    g_472_low60_0_low20_19 * 2 = g_472_low60_0_low20_18 + f_472_low60_0_low20_18,
    r_472_491 * 2 = r_472_490 + u_472_490,
    s_472_491 * 2 = s_472_490 + v_472_490
&&
    true
;

{
    u_472_491 * f_472_low60_0_low20_0 + v_472_491 * g_472_low60_0_low20_0 = f_472_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_491 * f_472_low60_0_low20_0 + s_472_491 * g_472_low60_0_low20_0 = g_472_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_19 + u_472_491 * (const 64 (2**21)) + v_472_491 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_19 + r_472_491 * (const 64 (2**21)) + s_472_491 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_19,
    f_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_19,
    g_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 491)) <=s delta, delta <=s (const 64 (1 + 2*491)),
    (const 64 (-(2**20))) <=s u_472_491, u_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_491, v_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_491, r_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_491, s_472_491 <=s (const 64 ((2**20))),
    u_472_491 + v_472_491 <=s (const 64 (2**20)),
    u_472_491 - v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 + v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 - v_472_491 <=s (const 64 (2**20)),
    r_472_491 + s_472_491 <=s (const 64 (2**20)),
    r_472_491 - s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 + s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 - s_472_491 <=s (const 64 (2**20)),
    u_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_472_491 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_490_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_18,
sint64 g_472_low60_0_low20_18,
sint64 f_472_low60_0_low20_19,
sint64 g_472_low60_0_low20_19,
sint64 u_472_490,
sint64 v_472_490,
sint64 r_472_490,
sint64 s_472_490,
sint64 u_472_491,
sint64 v_472_491,
sint64 r_472_491,
sint64 s_472_491,
bit ne
)={
    u_472_490 * f_472_low60_0_low20_0 + v_472_490 * g_472_low60_0_low20_0 = f_472_low60_0_low20_18 * (-(2**20)),
    r_472_490 * f_472_low60_0_low20_0 + s_472_490 * g_472_low60_0_low20_0 = g_472_low60_0_low20_18 * (-(2**20))
&&
    u_472_490 * f_472_low60_0_low20_0 + v_472_490 * g_472_low60_0_low20_0 = f_472_low60_0_low20_18 * (const 64 (-(2**20))),
    r_472_490 * f_472_low60_0_low20_0 + s_472_490 * g_472_low60_0_low20_0 = g_472_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_18 + u_472_490 * (const 64 (2**21)) + v_472_490 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_18 + r_472_490 * (const 64 (2**21)) + s_472_490 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_18,
    f_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_18,
    g_472_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 490)) <=s delta, delta <=s (const 64 (1 + 2*490)),
    (const 64 (-(2**20))) <=s u_472_490, u_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_490, v_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_490, r_472_490 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_490, s_472_490 <=s (const 64 ((2**20))),
    u_472_490 + v_472_490 <=s (const 64 (2**20)),
    u_472_490 - v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 + v_472_490 <=s (const 64 (2**20)),
    (const 64 0) - u_472_490 - v_472_490 <=s (const 64 (2**20)),
    r_472_490 + s_472_490 <=s (const 64 (2**20)),
    r_472_490 - s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 + s_472_490 <=s (const 64 (2**20)),
    (const 64 0) - r_472_490 - s_472_490 <=s (const 64 (2**20)),
    u_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_472_490 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_472_490 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step490

// premise c
assume
g_472_low60_0_low20_18 = 1 (mod 2)
&&
g_472_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_19 g_472_low60_0_low20_18;
mov u_472_491 r_472_490;
mov v_472_491 s_472_490;

subs dc g_472_low60_0_low20_19 g_472_low60_0_low20_18 f_472_low60_0_low20_18;
asr g_472_low60_0_low20_19 g_472_low60_0_low20_19 1;
subs dc r_472_491 r_472_490 u_472_490;
asr r_472_491 r_472_491 1;
subs dc s_472_491 s_472_490 v_472_490;
asr s_472_491 s_472_491 1;
assert
    true
&&
    f_472_low60_0_low20_19 = g_472_low60_0_low20_18,
    u_472_491 = r_472_490,
    v_472_491 = s_472_490,
    g_472_low60_0_low20_19 * (const 64 2) = g_472_low60_0_low20_18 - f_472_low60_0_low20_18,
    r_472_491 * (const 64 2) = r_472_490 - u_472_490,
    s_472_491 * (const 64 2) = s_472_490 - v_472_490
;

assume
    f_472_low60_0_low20_19 = g_472_low60_0_low20_18,
    u_472_491 = r_472_490,
    v_472_491 = s_472_490,
    g_472_low60_0_low20_19 * 2 = g_472_low60_0_low20_18 - f_472_low60_0_low20_18,
    r_472_491 * 2 = r_472_490 - u_472_490,
    s_472_491 * 2 = s_472_490 - v_472_490
&&
    true
;

{
    u_472_491 * f_472_low60_0_low20_0 + v_472_491 * g_472_low60_0_low20_0 = f_472_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_491 * f_472_low60_0_low20_0 + s_472_491 * g_472_low60_0_low20_0 = g_472_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_19 + u_472_491 * (const 64 (2**21)) + v_472_491 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_19 + r_472_491 * (const 64 (2**21)) + s_472_491 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_19,
    f_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_19,
    g_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 491)) <=s delta, delta <=s (const 64 (1 + 2*491)),
    (const 64 (-(2**20))) <=s u_472_491, u_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_491, v_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_491, r_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_491, s_472_491 <=s (const 64 ((2**20))),
    u_472_491 + v_472_491 <=s (const 64 (2**20)),
    u_472_491 - v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 + v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 - v_472_491 <=s (const 64 (2**20)),
    r_472_491 + s_472_491 <=s (const 64 (2**20)),
    r_472_491 - s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 + s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 - s_472_491 <=s (const 64 (2**20)),
    u_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_472_491 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_491_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_19,
sint64 g_472_low60_0_low20_19,
sint64 f_472_low60_0_low20_20,
sint64 g_472_low60_0_low20_20,
sint64 u_472_491,
sint64 v_472_491,
sint64 r_472_491,
sint64 s_472_491,
sint64 u_472_492,
sint64 v_472_492,
sint64 r_472_492,
sint64 s_472_492,
bit ne
)={
    u_472_491 * f_472_low60_0_low20_0 + v_472_491 * g_472_low60_0_low20_0 = f_472_low60_0_low20_19 * (-(2**20)),
    r_472_491 * f_472_low60_0_low20_0 + s_472_491 * g_472_low60_0_low20_0 = g_472_low60_0_low20_19 * (-(2**20))
&&
    u_472_491 * f_472_low60_0_low20_0 + v_472_491 * g_472_low60_0_low20_0 = f_472_low60_0_low20_19 * (const 64 (-(2**20))),
    r_472_491 * f_472_low60_0_low20_0 + s_472_491 * g_472_low60_0_low20_0 = g_472_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_19 + u_472_491 * (const 64 (2**21)) + v_472_491 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_19 + r_472_491 * (const 64 (2**21)) + s_472_491 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_19,
    f_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_19,
    g_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 491)) <=s delta, delta <=s (const 64 (1 + 2*491)),
    (const 64 (-(2**20))) <=s u_472_491, u_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_491, v_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_491, r_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_491, s_472_491 <=s (const 64 ((2**20))),
    u_472_491 + v_472_491 <=s (const 64 (2**20)),
    u_472_491 - v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 + v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 - v_472_491 <=s (const 64 (2**20)),
    r_472_491 + s_472_491 <=s (const 64 (2**20)),
    r_472_491 - s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 + s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 - s_472_491 <=s (const 64 (2**20)),
    u_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_472_491 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step491

// premise a
assume
g_472_low60_0_low20_19 = 0 (mod 2)
&&
g_472_low60_0_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov f_472_low60_0_low20_20 f_472_low60_0_low20_19;
mov u_472_492 u_472_491;
mov v_472_492 v_472_491;

asr g_472_low60_0_low20_20 g_472_low60_0_low20_19 1;
asr r_472_492 r_472_491 1;
asr s_472_492 s_472_491 1;
assert
    true
&&
    f_472_low60_0_low20_20 = f_472_low60_0_low20_19,
    u_472_492 = u_472_491,
    v_472_492 = v_472_491,
    g_472_low60_0_low20_20 * (const 64 2) = g_472_low60_0_low20_19,
    r_472_492 * (const 64 2) = r_472_491,
    s_472_492 * (const 64 2) = s_472_491
;

assume
    f_472_low60_0_low20_20 = f_472_low60_0_low20_19,
    u_472_492 = u_472_491,
    v_472_492 = v_472_491,
    g_472_low60_0_low20_20 * 2 = g_472_low60_0_low20_19,
    r_472_492 * 2 = r_472_491,
    s_472_492 * 2 = s_472_491
&&
    true
;

{
    u_472_492 * f_472_low60_0_low20_0 + v_472_492 * g_472_low60_0_low20_0 = f_472_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_492 * f_472_low60_0_low20_0 + s_472_492 * g_472_low60_0_low20_0 = g_472_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_20 + u_472_492 * (const 64 (2**21)) + v_472_492 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_20 + r_472_492 * (const 64 (2**21)) + s_472_492 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_20,
    f_472_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_20,
    g_472_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 492)) <=s delta, delta <=s (const 64 (1 + 2*492)),
    (const 64 (-(2**20))) <=s u_472_492, u_472_492 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_492, v_472_492 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_492, r_472_492 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_492, s_472_492 <=s (const 64 ((2**20))),
    u_472_492 + v_472_492 <=s (const 64 (2**20)),
    u_472_492 - v_472_492 <=s (const 64 (2**20)),
    (const 64 0) - u_472_492 + v_472_492 <=s (const 64 (2**20)),
    (const 64 0) - u_472_492 - v_472_492 <=s (const 64 (2**20)),
    r_472_492 + s_472_492 <=s (const 64 (2**20)),
    r_472_492 - s_472_492 <=s (const 64 (2**20)),
    (const 64 0) - r_472_492 + s_472_492 <=s (const 64 (2**20)),
    (const 64 0) - r_472_492 - s_472_492 <=s (const 64 (2**20)),
    u_472_492 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_472_492 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_472_492 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_472_492 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_491_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_19,
sint64 g_472_low60_0_low20_19,
sint64 f_472_low60_0_low20_20,
sint64 g_472_low60_0_low20_20,
sint64 u_472_491,
sint64 v_472_491,
sint64 r_472_491,
sint64 s_472_491,
sint64 u_472_492,
sint64 v_472_492,
sint64 r_472_492,
sint64 s_472_492,
bit ne
)={
    u_472_491 * f_472_low60_0_low20_0 + v_472_491 * g_472_low60_0_low20_0 = f_472_low60_0_low20_19 * (-(2**20)),
    r_472_491 * f_472_low60_0_low20_0 + s_472_491 * g_472_low60_0_low20_0 = g_472_low60_0_low20_19 * (-(2**20))
&&
    u_472_491 * f_472_low60_0_low20_0 + v_472_491 * g_472_low60_0_low20_0 = f_472_low60_0_low20_19 * (const 64 (-(2**20))),
    r_472_491 * f_472_low60_0_low20_0 + s_472_491 * g_472_low60_0_low20_0 = g_472_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_19 + u_472_491 * (const 64 (2**21)) + v_472_491 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_19 + r_472_491 * (const 64 (2**21)) + s_472_491 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_19,
    f_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_19,
    g_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 491)) <=s delta, delta <=s (const 64 (1 + 2*491)),
    (const 64 (-(2**20))) <=s u_472_491, u_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_491, v_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_491, r_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_491, s_472_491 <=s (const 64 ((2**20))),
    u_472_491 + v_472_491 <=s (const 64 (2**20)),
    u_472_491 - v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 + v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 - v_472_491 <=s (const 64 (2**20)),
    r_472_491 + s_472_491 <=s (const 64 (2**20)),
    r_472_491 - s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 + s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 - s_472_491 <=s (const 64 (2**20)),
    u_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_472_491 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step491

// premise b
assume
g_472_low60_0_low20_19 = 1 (mod 2)
&&
g_472_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_20 f_472_low60_0_low20_19;
mov u_472_492 u_472_491;
mov v_472_492 v_472_491;

add g_472_low60_0_low20_20 g_472_low60_0_low20_19 f_472_low60_0_low20_19;
asr g_472_low60_0_low20_20 g_472_low60_0_low20_20 1;
add r_472_492 r_472_491 u_472_491;
asr r_472_492 r_472_492 1;
add s_472_492 s_472_491 v_472_491;
asr s_472_492 s_472_492 1;
assert
    true
&&
    f_472_low60_0_low20_20 = f_472_low60_0_low20_19,
    u_472_492 = u_472_491,
    v_472_492 = v_472_491,
    g_472_low60_0_low20_20 * (const 64 2) = g_472_low60_0_low20_19 + f_472_low60_0_low20_19,
    r_472_492 * (const 64 2) = r_472_491 + u_472_491,
    s_472_492 * (const 64 2) = s_472_491 + v_472_491
;

assume
    f_472_low60_0_low20_20 = f_472_low60_0_low20_19,
    u_472_492 = u_472_491,
    v_472_492 = v_472_491,
    g_472_low60_0_low20_20 * 2 = g_472_low60_0_low20_19 + f_472_low60_0_low20_19,
    r_472_492 * 2 = r_472_491 + u_472_491,
    s_472_492 * 2 = s_472_491 + v_472_491
&&
    true
;

{
    u_472_492 * f_472_low60_0_low20_0 + v_472_492 * g_472_low60_0_low20_0 = f_472_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_492 * f_472_low60_0_low20_0 + s_472_492 * g_472_low60_0_low20_0 = g_472_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_20 + u_472_492 * (const 64 (2**21)) + v_472_492 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_20 + r_472_492 * (const 64 (2**21)) + s_472_492 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_20,
    f_472_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_20,
    g_472_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 492)) <=s delta, delta <=s (const 64 (1 + 2*492)),
    (const 64 (-(2**20))) <=s u_472_492, u_472_492 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_492, v_472_492 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_492, r_472_492 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_492, s_472_492 <=s (const 64 ((2**20))),
    u_472_492 + v_472_492 <=s (const 64 (2**20)),
    u_472_492 - v_472_492 <=s (const 64 (2**20)),
    (const 64 0) - u_472_492 + v_472_492 <=s (const 64 (2**20)),
    (const 64 0) - u_472_492 - v_472_492 <=s (const 64 (2**20)),
    r_472_492 + s_472_492 <=s (const 64 (2**20)),
    r_472_492 - s_472_492 <=s (const 64 (2**20)),
    (const 64 0) - r_472_492 + s_472_492 <=s (const 64 (2**20)),
    (const 64 0) - r_472_492 - s_472_492 <=s (const 64 (2**20)),
    u_472_492 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_472_492 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_472_492 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_472_492 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_491_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_19,
sint64 g_472_low60_0_low20_19,
sint64 f_472_low60_0_low20_20,
sint64 g_472_low60_0_low20_20,
sint64 u_472_491,
sint64 v_472_491,
sint64 r_472_491,
sint64 s_472_491,
sint64 u_472_492,
sint64 v_472_492,
sint64 r_472_492,
sint64 s_472_492,
bit ne
)={
    u_472_491 * f_472_low60_0_low20_0 + v_472_491 * g_472_low60_0_low20_0 = f_472_low60_0_low20_19 * (-(2**20)),
    r_472_491 * f_472_low60_0_low20_0 + s_472_491 * g_472_low60_0_low20_0 = g_472_low60_0_low20_19 * (-(2**20))
&&
    u_472_491 * f_472_low60_0_low20_0 + v_472_491 * g_472_low60_0_low20_0 = f_472_low60_0_low20_19 * (const 64 (-(2**20))),
    r_472_491 * f_472_low60_0_low20_0 + s_472_491 * g_472_low60_0_low20_0 = g_472_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_19 + u_472_491 * (const 64 (2**21)) + v_472_491 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_19 + r_472_491 * (const 64 (2**21)) + s_472_491 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_19,
    f_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_19,
    g_472_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 491)) <=s delta, delta <=s (const 64 (1 + 2*491)),
    (const 64 (-(2**20))) <=s u_472_491, u_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_491, v_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_491, r_472_491 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_491, s_472_491 <=s (const 64 ((2**20))),
    u_472_491 + v_472_491 <=s (const 64 (2**20)),
    u_472_491 - v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 + v_472_491 <=s (const 64 (2**20)),
    (const 64 0) - u_472_491 - v_472_491 <=s (const 64 (2**20)),
    r_472_491 + s_472_491 <=s (const 64 (2**20)),
    r_472_491 - s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 + s_472_491 <=s (const 64 (2**20)),
    (const 64 0) - r_472_491 - s_472_491 <=s (const 64 (2**20)),
    u_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_472_491 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_472_491 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step491

// premise c
assume
g_472_low60_0_low20_19 = 1 (mod 2)
&&
g_472_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_0_low20_20 g_472_low60_0_low20_19;
mov u_472_492 r_472_491;
mov v_472_492 s_472_491;

subs dc g_472_low60_0_low20_20 g_472_low60_0_low20_19 f_472_low60_0_low20_19;
asr g_472_low60_0_low20_20 g_472_low60_0_low20_20 1;
subs dc r_472_492 r_472_491 u_472_491;
asr r_472_492 r_472_492 1;
subs dc s_472_492 s_472_491 v_472_491;
asr s_472_492 s_472_492 1;
assert
    true
&&
    f_472_low60_0_low20_20 = g_472_low60_0_low20_19,
    u_472_492 = r_472_491,
    v_472_492 = s_472_491,
    g_472_low60_0_low20_20 * (const 64 2) = g_472_low60_0_low20_19 - f_472_low60_0_low20_19,
    r_472_492 * (const 64 2) = r_472_491 - u_472_491,
    s_472_492 * (const 64 2) = s_472_491 - v_472_491
;

assume
    f_472_low60_0_low20_20 = g_472_low60_0_low20_19,
    u_472_492 = r_472_491,
    v_472_492 = s_472_491,
    g_472_low60_0_low20_20 * 2 = g_472_low60_0_low20_19 - f_472_low60_0_low20_19,
    r_472_492 * 2 = r_472_491 - u_472_491,
    s_472_492 * 2 = s_472_491 - v_472_491
&&
    true
;

{
    u_472_492 * f_472_low60_0_low20_0 + v_472_492 * g_472_low60_0_low20_0 = f_472_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_492 * f_472_low60_0_low20_0 + s_472_492 * g_472_low60_0_low20_0 = g_472_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_20 + u_472_492 * (const 64 (2**21)) + v_472_492 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_20 + r_472_492 * (const 64 (2**21)) + s_472_492 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_20,
    f_472_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_20,
    g_472_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 492)) <=s delta, delta <=s (const 64 (1 + 2*492)),
    (const 64 (-(2**20))) <=s u_472_492, u_472_492 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_492, v_472_492 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_492, r_472_492 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_492, s_472_492 <=s (const 64 ((2**20))),
    u_472_492 + v_472_492 <=s (const 64 (2**20)),
    u_472_492 - v_472_492 <=s (const 64 (2**20)),
    (const 64 0) - u_472_492 + v_472_492 <=s (const 64 (2**20)),
    (const 64 0) - u_472_492 - v_472_492 <=s (const 64 (2**20)),
    r_472_492 + s_472_492 <=s (const 64 (2**20)),
    r_472_492 - s_472_492 <=s (const 64 (2**20)),
    (const 64 0) - r_472_492 + s_472_492 <=s (const 64 (2**20)),
    (const 64 0) - r_472_492 - s_472_492 <=s (const 64 (2**20)),
    u_472_492 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_472_492 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_472_492 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_472_492 = (const 64 0) (mod (const 64 (2**(20-20))))
}

