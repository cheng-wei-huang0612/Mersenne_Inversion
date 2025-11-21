proc divstep_315_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_1,
sint64 g_295_low60_20_low20_1,
sint64 u_315_315,
sint64 v_315_315,
sint64 r_315_315,
sint64 s_315_315,
sint64 u_315_316,
sint64 v_315_316,
sint64 r_315_316,
sint64 s_315_316,
bit ne
)={
    u_315_315 * f_295_low60_20_low20_0 + v_315_315 * g_295_low60_20_low20_0 = f_295_low60_20_low20_0 * (-(2**20)),
    r_315_315 * f_295_low60_20_low20_0 + s_315_315 * g_295_low60_20_low20_0 = g_295_low60_20_low20_0 * (-(2**20))
&&
    u_315_315 * f_295_low60_20_low20_0 + v_315_315 * g_295_low60_20_low20_0 = f_295_low60_20_low20_0 * (const 64 (-(2**20))),
    r_315_315 * f_295_low60_20_low20_0 + s_315_315 * g_295_low60_20_low20_0 = g_295_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_0 + u_315_315 * (const 64 (2**21)) + v_315_315 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_0 + r_315_315 * (const 64 (2**21)) + s_315_315 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 315)) <=s delta, delta <=s (const 64 (1 + 2*315)),
    u_315_315 = (const 64 (-(2**20))),
    v_315_315 = (const 64 (0)),
    r_315_315 = (const 64 (0)),
    s_315_315 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise a
assume
g_295_low60_20_low20_0 = 0 (mod 2)
&&
g_295_low60_20_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_295_low60_20_low20_1 f_295_low60_20_low20_0;
mov u_315_316 u_315_315;
mov v_315_316 v_315_315;

asr g_295_low60_20_low20_1 g_295_low60_20_low20_0 1;
asr r_315_316 r_315_315 1;
asr s_315_316 s_315_315 1;
assert
    true
&&
    f_295_low60_20_low20_1 = f_295_low60_20_low20_0,
    u_315_316 = u_315_315,
    v_315_316 = v_315_315,
    g_295_low60_20_low20_1 * (const 64 2) = g_295_low60_20_low20_0,
    r_315_316 * (const 64 2) = r_315_315,
    s_315_316 * (const 64 2) = s_315_315
;

assume
    f_295_low60_20_low20_1 = f_295_low60_20_low20_0,
    u_315_316 = u_315_315,
    v_315_316 = v_315_315,
    g_295_low60_20_low20_1 * 2 = g_295_low60_20_low20_0,
    r_315_316 * 2 = r_315_315,
    s_315_316 * 2 = s_315_315
&&
    true
;

{
    u_315_316 * f_295_low60_20_low20_0 + v_315_316 * g_295_low60_20_low20_0 = f_295_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_316 * f_295_low60_20_low20_0 + s_315_316 * g_295_low60_20_low20_0 = g_295_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_1 + u_315_316 * (const 64 (2**21)) + v_315_316 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_1 + r_315_316 * (const 64 (2**21)) + s_315_316 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_1,
    f_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_1,
    g_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 316)) <=s delta, delta <=s (const 64 (1 + 2*316)),
    (const 64 (-(2**20))) <=s u_315_316, u_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_316, v_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_316, r_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_316, s_315_316 <=s (const 64 ((2**20))),
    u_315_316 + v_315_316 <=s (const 64 (2**20)),
    u_315_316 - v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 + v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 - v_315_316 <=s (const 64 (2**20)),
    r_315_316 + s_315_316 <=s (const 64 (2**20)),
    r_315_316 - s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 + s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 - s_315_316 <=s (const 64 (2**20)),
    u_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_315_316 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_315_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_1,
sint64 g_295_low60_20_low20_1,
sint64 u_315_315,
sint64 v_315_315,
sint64 r_315_315,
sint64 s_315_315,
sint64 u_315_316,
sint64 v_315_316,
sint64 r_315_316,
sint64 s_315_316,
bit ne
)={
    u_315_315 * f_295_low60_20_low20_0 + v_315_315 * g_295_low60_20_low20_0 = f_295_low60_20_low20_0 * (-(2**20)),
    r_315_315 * f_295_low60_20_low20_0 + s_315_315 * g_295_low60_20_low20_0 = g_295_low60_20_low20_0 * (-(2**20))
&&
    u_315_315 * f_295_low60_20_low20_0 + v_315_315 * g_295_low60_20_low20_0 = f_295_low60_20_low20_0 * (const 64 (-(2**20))),
    r_315_315 * f_295_low60_20_low20_0 + s_315_315 * g_295_low60_20_low20_0 = g_295_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_0 + u_315_315 * (const 64 (2**21)) + v_315_315 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_0 + r_315_315 * (const 64 (2**21)) + s_315_315 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 315)) <=s delta, delta <=s (const 64 (1 + 2*315)),
    u_315_315 = (const 64 (-(2**20))),
    v_315_315 = (const 64 (0)),
    r_315_315 = (const 64 (0)),
    s_315_315 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise b
assume
g_295_low60_20_low20_0 = 1 (mod 2)
&&
g_295_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_1 f_295_low60_20_low20_0;
mov u_315_316 u_315_315;
mov v_315_316 v_315_315;

add g_295_low60_20_low20_1 g_295_low60_20_low20_0 f_295_low60_20_low20_0;
asr g_295_low60_20_low20_1 g_295_low60_20_low20_1 1;
add r_315_316 r_315_315 u_315_315;
asr r_315_316 r_315_316 1;
add s_315_316 s_315_315 v_315_315;
asr s_315_316 s_315_316 1;
assert
    true
&&
    f_295_low60_20_low20_1 = f_295_low60_20_low20_0,
    u_315_316 = u_315_315,
    v_315_316 = v_315_315,
    g_295_low60_20_low20_1 * (const 64 2) = g_295_low60_20_low20_0 + f_295_low60_20_low20_0,
    r_315_316 * (const 64 2) = r_315_315 + u_315_315,
    s_315_316 * (const 64 2) = s_315_315 + v_315_315
;

assume
    f_295_low60_20_low20_1 = f_295_low60_20_low20_0,
    u_315_316 = u_315_315,
    v_315_316 = v_315_315,
    g_295_low60_20_low20_1 * 2 = g_295_low60_20_low20_0 + f_295_low60_20_low20_0,
    r_315_316 * 2 = r_315_315 + u_315_315,
    s_315_316 * 2 = s_315_315 + v_315_315
&&
    true
;

{
    u_315_316 * f_295_low60_20_low20_0 + v_315_316 * g_295_low60_20_low20_0 = f_295_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_316 * f_295_low60_20_low20_0 + s_315_316 * g_295_low60_20_low20_0 = g_295_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_1 + u_315_316 * (const 64 (2**21)) + v_315_316 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_1 + r_315_316 * (const 64 (2**21)) + s_315_316 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_1,
    f_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_1,
    g_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 316)) <=s delta, delta <=s (const 64 (1 + 2*316)),
    (const 64 (-(2**20))) <=s u_315_316, u_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_316, v_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_316, r_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_316, s_315_316 <=s (const 64 ((2**20))),
    u_315_316 + v_315_316 <=s (const 64 (2**20)),
    u_315_316 - v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 + v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 - v_315_316 <=s (const 64 (2**20)),
    r_315_316 + s_315_316 <=s (const 64 (2**20)),
    r_315_316 - s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 + s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 - s_315_316 <=s (const 64 (2**20)),
    u_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_315_316 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_315_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_1,
sint64 g_295_low60_20_low20_1,
sint64 u_315_315,
sint64 v_315_315,
sint64 r_315_315,
sint64 s_315_315,
sint64 u_315_316,
sint64 v_315_316,
sint64 r_315_316,
sint64 s_315_316,
bit ne
)={
    u_315_315 * f_295_low60_20_low20_0 + v_315_315 * g_295_low60_20_low20_0 = f_295_low60_20_low20_0 * (-(2**20)),
    r_315_315 * f_295_low60_20_low20_0 + s_315_315 * g_295_low60_20_low20_0 = g_295_low60_20_low20_0 * (-(2**20))
&&
    u_315_315 * f_295_low60_20_low20_0 + v_315_315 * g_295_low60_20_low20_0 = f_295_low60_20_low20_0 * (const 64 (-(2**20))),
    r_315_315 * f_295_low60_20_low20_0 + s_315_315 * g_295_low60_20_low20_0 = g_295_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_0 + u_315_315 * (const 64 (2**21)) + v_315_315 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_0 + r_315_315 * (const 64 (2**21)) + s_315_315 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 315)) <=s delta, delta <=s (const 64 (1 + 2*315)),
    u_315_315 = (const 64 (-(2**20))),
    v_315_315 = (const 64 (0)),
    r_315_315 = (const 64 (0)),
    s_315_315 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise c
assume
g_295_low60_20_low20_0 = 1 (mod 2)
&&
g_295_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_1 g_295_low60_20_low20_0;
mov u_315_316 r_315_315;
mov v_315_316 s_315_315;

subs dc g_295_low60_20_low20_1 g_295_low60_20_low20_0 f_295_low60_20_low20_0;
asr g_295_low60_20_low20_1 g_295_low60_20_low20_1 1;
subs dc r_315_316 r_315_315 u_315_315;
asr r_315_316 r_315_316 1;
subs dc s_315_316 s_315_315 v_315_315;
asr s_315_316 s_315_316 1;
assert
    true
&&
    f_295_low60_20_low20_1 = g_295_low60_20_low20_0,
    u_315_316 = r_315_315,
    v_315_316 = s_315_315,
    g_295_low60_20_low20_1 * (const 64 2) = g_295_low60_20_low20_0 - f_295_low60_20_low20_0,
    r_315_316 * (const 64 2) = r_315_315 - u_315_315,
    s_315_316 * (const 64 2) = s_315_315 - v_315_315
;

assume
    f_295_low60_20_low20_1 = g_295_low60_20_low20_0,
    u_315_316 = r_315_315,
    v_315_316 = s_315_315,
    g_295_low60_20_low20_1 * 2 = g_295_low60_20_low20_0 - f_295_low60_20_low20_0,
    r_315_316 * 2 = r_315_315 - u_315_315,
    s_315_316 * 2 = s_315_315 - v_315_315
&&
    true
;

{
    u_315_316 * f_295_low60_20_low20_0 + v_315_316 * g_295_low60_20_low20_0 = f_295_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_316 * f_295_low60_20_low20_0 + s_315_316 * g_295_low60_20_low20_0 = g_295_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_1 + u_315_316 * (const 64 (2**21)) + v_315_316 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_1 + r_315_316 * (const 64 (2**21)) + s_315_316 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_1,
    f_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_1,
    g_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 316)) <=s delta, delta <=s (const 64 (1 + 2*316)),
    (const 64 (-(2**20))) <=s u_315_316, u_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_316, v_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_316, r_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_316, s_315_316 <=s (const 64 ((2**20))),
    u_315_316 + v_315_316 <=s (const 64 (2**20)),
    u_315_316 - v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 + v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 - v_315_316 <=s (const 64 (2**20)),
    r_315_316 + s_315_316 <=s (const 64 (2**20)),
    r_315_316 - s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 + s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 - s_315_316 <=s (const 64 (2**20)),
    u_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_315_316 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_316_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_1,
sint64 g_295_low60_20_low20_1,
sint64 f_295_low60_20_low20_2,
sint64 g_295_low60_20_low20_2,
sint64 u_315_316,
sint64 v_315_316,
sint64 r_315_316,
sint64 s_315_316,
sint64 u_315_317,
sint64 v_315_317,
sint64 r_315_317,
sint64 s_315_317,
bit ne
)={
    u_315_316 * f_295_low60_20_low20_0 + v_315_316 * g_295_low60_20_low20_0 = f_295_low60_20_low20_1 * (-(2**20)),
    r_315_316 * f_295_low60_20_low20_0 + s_315_316 * g_295_low60_20_low20_0 = g_295_low60_20_low20_1 * (-(2**20))
&&
    u_315_316 * f_295_low60_20_low20_0 + v_315_316 * g_295_low60_20_low20_0 = f_295_low60_20_low20_1 * (const 64 (-(2**20))),
    r_315_316 * f_295_low60_20_low20_0 + s_315_316 * g_295_low60_20_low20_0 = g_295_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_1 + u_315_316 * (const 64 (2**21)) + v_315_316 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_1 + r_315_316 * (const 64 (2**21)) + s_315_316 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_1,
    f_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_1,
    g_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 316)) <=s delta, delta <=s (const 64 (1 + 2*316)),
    (const 64 (-(2**20))) <=s u_315_316, u_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_316, v_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_316, r_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_316, s_315_316 <=s (const 64 ((2**20))),
    u_315_316 + v_315_316 <=s (const 64 (2**20)),
    u_315_316 - v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 + v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 - v_315_316 <=s (const 64 (2**20)),
    r_315_316 + s_315_316 <=s (const 64 (2**20)),
    r_315_316 - s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 + s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 - s_315_316 <=s (const 64 (2**20)),
    u_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_315_316 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise a
assume
g_295_low60_20_low20_1 = 0 (mod 2)
&&
g_295_low60_20_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_2 f_295_low60_20_low20_1;
mov u_315_317 u_315_316;
mov v_315_317 v_315_316;

asr g_295_low60_20_low20_2 g_295_low60_20_low20_1 1;
asr r_315_317 r_315_316 1;
asr s_315_317 s_315_316 1;
assert
    true
&&
    f_295_low60_20_low20_2 = f_295_low60_20_low20_1,
    u_315_317 = u_315_316,
    v_315_317 = v_315_316,
    g_295_low60_20_low20_2 * (const 64 2) = g_295_low60_20_low20_1,
    r_315_317 * (const 64 2) = r_315_316,
    s_315_317 * (const 64 2) = s_315_316
;

assume
    f_295_low60_20_low20_2 = f_295_low60_20_low20_1,
    u_315_317 = u_315_316,
    v_315_317 = v_315_316,
    g_295_low60_20_low20_2 * 2 = g_295_low60_20_low20_1,
    r_315_317 * 2 = r_315_316,
    s_315_317 * 2 = s_315_316
&&
    true
;

{
    u_315_317 * f_295_low60_20_low20_0 + v_315_317 * g_295_low60_20_low20_0 = f_295_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_317 * f_295_low60_20_low20_0 + s_315_317 * g_295_low60_20_low20_0 = g_295_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_2 + u_315_317 * (const 64 (2**21)) + v_315_317 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_2 + r_315_317 * (const 64 (2**21)) + s_315_317 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_2,
    f_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_2,
    g_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 317)) <=s delta, delta <=s (const 64 (1 + 2*317)),
    (const 64 (-(2**20))) <=s u_315_317, u_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_317, v_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_317, r_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_317, s_315_317 <=s (const 64 ((2**20))),
    u_315_317 + v_315_317 <=s (const 64 (2**20)),
    u_315_317 - v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 + v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 - v_315_317 <=s (const 64 (2**20)),
    r_315_317 + s_315_317 <=s (const 64 (2**20)),
    r_315_317 - s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 + s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 - s_315_317 <=s (const 64 (2**20)),
    u_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_315_317 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_316_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_1,
sint64 g_295_low60_20_low20_1,
sint64 f_295_low60_20_low20_2,
sint64 g_295_low60_20_low20_2,
sint64 u_315_316,
sint64 v_315_316,
sint64 r_315_316,
sint64 s_315_316,
sint64 u_315_317,
sint64 v_315_317,
sint64 r_315_317,
sint64 s_315_317,
bit ne
)={
    u_315_316 * f_295_low60_20_low20_0 + v_315_316 * g_295_low60_20_low20_0 = f_295_low60_20_low20_1 * (-(2**20)),
    r_315_316 * f_295_low60_20_low20_0 + s_315_316 * g_295_low60_20_low20_0 = g_295_low60_20_low20_1 * (-(2**20))
&&
    u_315_316 * f_295_low60_20_low20_0 + v_315_316 * g_295_low60_20_low20_0 = f_295_low60_20_low20_1 * (const 64 (-(2**20))),
    r_315_316 * f_295_low60_20_low20_0 + s_315_316 * g_295_low60_20_low20_0 = g_295_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_1 + u_315_316 * (const 64 (2**21)) + v_315_316 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_1 + r_315_316 * (const 64 (2**21)) + s_315_316 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_1,
    f_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_1,
    g_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 316)) <=s delta, delta <=s (const 64 (1 + 2*316)),
    (const 64 (-(2**20))) <=s u_315_316, u_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_316, v_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_316, r_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_316, s_315_316 <=s (const 64 ((2**20))),
    u_315_316 + v_315_316 <=s (const 64 (2**20)),
    u_315_316 - v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 + v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 - v_315_316 <=s (const 64 (2**20)),
    r_315_316 + s_315_316 <=s (const 64 (2**20)),
    r_315_316 - s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 + s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 - s_315_316 <=s (const 64 (2**20)),
    u_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_315_316 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise b
assume
g_295_low60_20_low20_1 = 1 (mod 2)
&&
g_295_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_2 f_295_low60_20_low20_1;
mov u_315_317 u_315_316;
mov v_315_317 v_315_316;

add g_295_low60_20_low20_2 g_295_low60_20_low20_1 f_295_low60_20_low20_1;
asr g_295_low60_20_low20_2 g_295_low60_20_low20_2 1;
add r_315_317 r_315_316 u_315_316;
asr r_315_317 r_315_317 1;
add s_315_317 s_315_316 v_315_316;
asr s_315_317 s_315_317 1;
assert
    true
&&
    f_295_low60_20_low20_2 = f_295_low60_20_low20_1,
    u_315_317 = u_315_316,
    v_315_317 = v_315_316,
    g_295_low60_20_low20_2 * (const 64 2) = g_295_low60_20_low20_1 + f_295_low60_20_low20_1,
    r_315_317 * (const 64 2) = r_315_316 + u_315_316,
    s_315_317 * (const 64 2) = s_315_316 + v_315_316
;

assume
    f_295_low60_20_low20_2 = f_295_low60_20_low20_1,
    u_315_317 = u_315_316,
    v_315_317 = v_315_316,
    g_295_low60_20_low20_2 * 2 = g_295_low60_20_low20_1 + f_295_low60_20_low20_1,
    r_315_317 * 2 = r_315_316 + u_315_316,
    s_315_317 * 2 = s_315_316 + v_315_316
&&
    true
;

{
    u_315_317 * f_295_low60_20_low20_0 + v_315_317 * g_295_low60_20_low20_0 = f_295_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_317 * f_295_low60_20_low20_0 + s_315_317 * g_295_low60_20_low20_0 = g_295_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_2 + u_315_317 * (const 64 (2**21)) + v_315_317 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_2 + r_315_317 * (const 64 (2**21)) + s_315_317 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_2,
    f_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_2,
    g_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 317)) <=s delta, delta <=s (const 64 (1 + 2*317)),
    (const 64 (-(2**20))) <=s u_315_317, u_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_317, v_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_317, r_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_317, s_315_317 <=s (const 64 ((2**20))),
    u_315_317 + v_315_317 <=s (const 64 (2**20)),
    u_315_317 - v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 + v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 - v_315_317 <=s (const 64 (2**20)),
    r_315_317 + s_315_317 <=s (const 64 (2**20)),
    r_315_317 - s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 + s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 - s_315_317 <=s (const 64 (2**20)),
    u_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_315_317 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_316_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_1,
sint64 g_295_low60_20_low20_1,
sint64 f_295_low60_20_low20_2,
sint64 g_295_low60_20_low20_2,
sint64 u_315_316,
sint64 v_315_316,
sint64 r_315_316,
sint64 s_315_316,
sint64 u_315_317,
sint64 v_315_317,
sint64 r_315_317,
sint64 s_315_317,
bit ne
)={
    u_315_316 * f_295_low60_20_low20_0 + v_315_316 * g_295_low60_20_low20_0 = f_295_low60_20_low20_1 * (-(2**20)),
    r_315_316 * f_295_low60_20_low20_0 + s_315_316 * g_295_low60_20_low20_0 = g_295_low60_20_low20_1 * (-(2**20))
&&
    u_315_316 * f_295_low60_20_low20_0 + v_315_316 * g_295_low60_20_low20_0 = f_295_low60_20_low20_1 * (const 64 (-(2**20))),
    r_315_316 * f_295_low60_20_low20_0 + s_315_316 * g_295_low60_20_low20_0 = g_295_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_1 + u_315_316 * (const 64 (2**21)) + v_315_316 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_1 + r_315_316 * (const 64 (2**21)) + s_315_316 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_1,
    f_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_1,
    g_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 316)) <=s delta, delta <=s (const 64 (1 + 2*316)),
    (const 64 (-(2**20))) <=s u_315_316, u_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_316, v_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_316, r_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_316, s_315_316 <=s (const 64 ((2**20))),
    u_315_316 + v_315_316 <=s (const 64 (2**20)),
    u_315_316 - v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 + v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 - v_315_316 <=s (const 64 (2**20)),
    r_315_316 + s_315_316 <=s (const 64 (2**20)),
    r_315_316 - s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 + s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 - s_315_316 <=s (const 64 (2**20)),
    u_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_315_316 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise c
assume
g_295_low60_20_low20_1 = 1 (mod 2)
&&
g_295_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_2 g_295_low60_20_low20_1;
mov u_315_317 r_315_316;
mov v_315_317 s_315_316;

subs dc g_295_low60_20_low20_2 g_295_low60_20_low20_1 f_295_low60_20_low20_1;
asr g_295_low60_20_low20_2 g_295_low60_20_low20_2 1;
subs dc r_315_317 r_315_316 u_315_316;
asr r_315_317 r_315_317 1;
subs dc s_315_317 s_315_316 v_315_316;
asr s_315_317 s_315_317 1;
assert
    true
&&
    f_295_low60_20_low20_2 = g_295_low60_20_low20_1,
    u_315_317 = r_315_316,
    v_315_317 = s_315_316,
    g_295_low60_20_low20_2 * (const 64 2) = g_295_low60_20_low20_1 - f_295_low60_20_low20_1,
    r_315_317 * (const 64 2) = r_315_316 - u_315_316,
    s_315_317 * (const 64 2) = s_315_316 - v_315_316
;

assume
    f_295_low60_20_low20_2 = g_295_low60_20_low20_1,
    u_315_317 = r_315_316,
    v_315_317 = s_315_316,
    g_295_low60_20_low20_2 * 2 = g_295_low60_20_low20_1 - f_295_low60_20_low20_1,
    r_315_317 * 2 = r_315_316 - u_315_316,
    s_315_317 * 2 = s_315_316 - v_315_316
&&
    true
;

{
    u_315_317 * f_295_low60_20_low20_0 + v_315_317 * g_295_low60_20_low20_0 = f_295_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_317 * f_295_low60_20_low20_0 + s_315_317 * g_295_low60_20_low20_0 = g_295_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_2 + u_315_317 * (const 64 (2**21)) + v_315_317 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_2 + r_315_317 * (const 64 (2**21)) + s_315_317 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_2,
    f_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_2,
    g_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 317)) <=s delta, delta <=s (const 64 (1 + 2*317)),
    (const 64 (-(2**20))) <=s u_315_317, u_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_317, v_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_317, r_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_317, s_315_317 <=s (const 64 ((2**20))),
    u_315_317 + v_315_317 <=s (const 64 (2**20)),
    u_315_317 - v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 + v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 - v_315_317 <=s (const 64 (2**20)),
    r_315_317 + s_315_317 <=s (const 64 (2**20)),
    r_315_317 - s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 + s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 - s_315_317 <=s (const 64 (2**20)),
    u_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_315_317 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_317_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_2,
sint64 g_295_low60_20_low20_2,
sint64 f_295_low60_20_low20_3,
sint64 g_295_low60_20_low20_3,
sint64 u_315_317,
sint64 v_315_317,
sint64 r_315_317,
sint64 s_315_317,
sint64 u_315_318,
sint64 v_315_318,
sint64 r_315_318,
sint64 s_315_318,
bit ne
)={
    u_315_317 * f_295_low60_20_low20_0 + v_315_317 * g_295_low60_20_low20_0 = f_295_low60_20_low20_2 * (-(2**20)),
    r_315_317 * f_295_low60_20_low20_0 + s_315_317 * g_295_low60_20_low20_0 = g_295_low60_20_low20_2 * (-(2**20))
&&
    u_315_317 * f_295_low60_20_low20_0 + v_315_317 * g_295_low60_20_low20_0 = f_295_low60_20_low20_2 * (const 64 (-(2**20))),
    r_315_317 * f_295_low60_20_low20_0 + s_315_317 * g_295_low60_20_low20_0 = g_295_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_2 + u_315_317 * (const 64 (2**21)) + v_315_317 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_2 + r_315_317 * (const 64 (2**21)) + s_315_317 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_2,
    f_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_2,
    g_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 317)) <=s delta, delta <=s (const 64 (1 + 2*317)),
    (const 64 (-(2**20))) <=s u_315_317, u_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_317, v_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_317, r_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_317, s_315_317 <=s (const 64 ((2**20))),
    u_315_317 + v_315_317 <=s (const 64 (2**20)),
    u_315_317 - v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 + v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 - v_315_317 <=s (const 64 (2**20)),
    r_315_317 + s_315_317 <=s (const 64 (2**20)),
    r_315_317 - s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 + s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 - s_315_317 <=s (const 64 (2**20)),
    u_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_315_317 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise a
assume
g_295_low60_20_low20_2 = 0 (mod 2)
&&
g_295_low60_20_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_3 f_295_low60_20_low20_2;
mov u_315_318 u_315_317;
mov v_315_318 v_315_317;

asr g_295_low60_20_low20_3 g_295_low60_20_low20_2 1;
asr r_315_318 r_315_317 1;
asr s_315_318 s_315_317 1;
assert
    true
&&
    f_295_low60_20_low20_3 = f_295_low60_20_low20_2,
    u_315_318 = u_315_317,
    v_315_318 = v_315_317,
    g_295_low60_20_low20_3 * (const 64 2) = g_295_low60_20_low20_2,
    r_315_318 * (const 64 2) = r_315_317,
    s_315_318 * (const 64 2) = s_315_317
;

assume
    f_295_low60_20_low20_3 = f_295_low60_20_low20_2,
    u_315_318 = u_315_317,
    v_315_318 = v_315_317,
    g_295_low60_20_low20_3 * 2 = g_295_low60_20_low20_2,
    r_315_318 * 2 = r_315_317,
    s_315_318 * 2 = s_315_317
&&
    true
;

{
    u_315_318 * f_295_low60_20_low20_0 + v_315_318 * g_295_low60_20_low20_0 = f_295_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_318 * f_295_low60_20_low20_0 + s_315_318 * g_295_low60_20_low20_0 = g_295_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_3 + u_315_318 * (const 64 (2**21)) + v_315_318 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_3 + r_315_318 * (const 64 (2**21)) + s_315_318 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_3,
    f_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_3,
    g_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 318)) <=s delta, delta <=s (const 64 (1 + 2*318)),
    (const 64 (-(2**20))) <=s u_315_318, u_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_318, v_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_318, r_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_318, s_315_318 <=s (const 64 ((2**20))),
    u_315_318 + v_315_318 <=s (const 64 (2**20)),
    u_315_318 - v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 + v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 - v_315_318 <=s (const 64 (2**20)),
    r_315_318 + s_315_318 <=s (const 64 (2**20)),
    r_315_318 - s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 + s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 - s_315_318 <=s (const 64 (2**20)),
    u_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_315_318 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_317_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_2,
sint64 g_295_low60_20_low20_2,
sint64 f_295_low60_20_low20_3,
sint64 g_295_low60_20_low20_3,
sint64 u_315_317,
sint64 v_315_317,
sint64 r_315_317,
sint64 s_315_317,
sint64 u_315_318,
sint64 v_315_318,
sint64 r_315_318,
sint64 s_315_318,
bit ne
)={
    u_315_317 * f_295_low60_20_low20_0 + v_315_317 * g_295_low60_20_low20_0 = f_295_low60_20_low20_2 * (-(2**20)),
    r_315_317 * f_295_low60_20_low20_0 + s_315_317 * g_295_low60_20_low20_0 = g_295_low60_20_low20_2 * (-(2**20))
&&
    u_315_317 * f_295_low60_20_low20_0 + v_315_317 * g_295_low60_20_low20_0 = f_295_low60_20_low20_2 * (const 64 (-(2**20))),
    r_315_317 * f_295_low60_20_low20_0 + s_315_317 * g_295_low60_20_low20_0 = g_295_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_2 + u_315_317 * (const 64 (2**21)) + v_315_317 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_2 + r_315_317 * (const 64 (2**21)) + s_315_317 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_2,
    f_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_2,
    g_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 317)) <=s delta, delta <=s (const 64 (1 + 2*317)),
    (const 64 (-(2**20))) <=s u_315_317, u_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_317, v_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_317, r_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_317, s_315_317 <=s (const 64 ((2**20))),
    u_315_317 + v_315_317 <=s (const 64 (2**20)),
    u_315_317 - v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 + v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 - v_315_317 <=s (const 64 (2**20)),
    r_315_317 + s_315_317 <=s (const 64 (2**20)),
    r_315_317 - s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 + s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 - s_315_317 <=s (const 64 (2**20)),
    u_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_315_317 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise b
assume
g_295_low60_20_low20_2 = 1 (mod 2)
&&
g_295_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_3 f_295_low60_20_low20_2;
mov u_315_318 u_315_317;
mov v_315_318 v_315_317;

add g_295_low60_20_low20_3 g_295_low60_20_low20_2 f_295_low60_20_low20_2;
asr g_295_low60_20_low20_3 g_295_low60_20_low20_3 1;
add r_315_318 r_315_317 u_315_317;
asr r_315_318 r_315_318 1;
add s_315_318 s_315_317 v_315_317;
asr s_315_318 s_315_318 1;
assert
    true
&&
    f_295_low60_20_low20_3 = f_295_low60_20_low20_2,
    u_315_318 = u_315_317,
    v_315_318 = v_315_317,
    g_295_low60_20_low20_3 * (const 64 2) = g_295_low60_20_low20_2 + f_295_low60_20_low20_2,
    r_315_318 * (const 64 2) = r_315_317 + u_315_317,
    s_315_318 * (const 64 2) = s_315_317 + v_315_317
;

assume
    f_295_low60_20_low20_3 = f_295_low60_20_low20_2,
    u_315_318 = u_315_317,
    v_315_318 = v_315_317,
    g_295_low60_20_low20_3 * 2 = g_295_low60_20_low20_2 + f_295_low60_20_low20_2,
    r_315_318 * 2 = r_315_317 + u_315_317,
    s_315_318 * 2 = s_315_317 + v_315_317
&&
    true
;

{
    u_315_318 * f_295_low60_20_low20_0 + v_315_318 * g_295_low60_20_low20_0 = f_295_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_318 * f_295_low60_20_low20_0 + s_315_318 * g_295_low60_20_low20_0 = g_295_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_3 + u_315_318 * (const 64 (2**21)) + v_315_318 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_3 + r_315_318 * (const 64 (2**21)) + s_315_318 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_3,
    f_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_3,
    g_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 318)) <=s delta, delta <=s (const 64 (1 + 2*318)),
    (const 64 (-(2**20))) <=s u_315_318, u_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_318, v_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_318, r_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_318, s_315_318 <=s (const 64 ((2**20))),
    u_315_318 + v_315_318 <=s (const 64 (2**20)),
    u_315_318 - v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 + v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 - v_315_318 <=s (const 64 (2**20)),
    r_315_318 + s_315_318 <=s (const 64 (2**20)),
    r_315_318 - s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 + s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 - s_315_318 <=s (const 64 (2**20)),
    u_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_315_318 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_317_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_2,
sint64 g_295_low60_20_low20_2,
sint64 f_295_low60_20_low20_3,
sint64 g_295_low60_20_low20_3,
sint64 u_315_317,
sint64 v_315_317,
sint64 r_315_317,
sint64 s_315_317,
sint64 u_315_318,
sint64 v_315_318,
sint64 r_315_318,
sint64 s_315_318,
bit ne
)={
    u_315_317 * f_295_low60_20_low20_0 + v_315_317 * g_295_low60_20_low20_0 = f_295_low60_20_low20_2 * (-(2**20)),
    r_315_317 * f_295_low60_20_low20_0 + s_315_317 * g_295_low60_20_low20_0 = g_295_low60_20_low20_2 * (-(2**20))
&&
    u_315_317 * f_295_low60_20_low20_0 + v_315_317 * g_295_low60_20_low20_0 = f_295_low60_20_low20_2 * (const 64 (-(2**20))),
    r_315_317 * f_295_low60_20_low20_0 + s_315_317 * g_295_low60_20_low20_0 = g_295_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_2 + u_315_317 * (const 64 (2**21)) + v_315_317 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_2 + r_315_317 * (const 64 (2**21)) + s_315_317 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_2,
    f_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_2,
    g_295_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 317)) <=s delta, delta <=s (const 64 (1 + 2*317)),
    (const 64 (-(2**20))) <=s u_315_317, u_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_317, v_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_317, r_315_317 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_317, s_315_317 <=s (const 64 ((2**20))),
    u_315_317 + v_315_317 <=s (const 64 (2**20)),
    u_315_317 - v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 + v_315_317 <=s (const 64 (2**20)),
    (const 64 0) - u_315_317 - v_315_317 <=s (const 64 (2**20)),
    r_315_317 + s_315_317 <=s (const 64 (2**20)),
    r_315_317 - s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 + s_315_317 <=s (const 64 (2**20)),
    (const 64 0) - r_315_317 - s_315_317 <=s (const 64 (2**20)),
    u_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_315_317 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_315_317 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise c
assume
g_295_low60_20_low20_2 = 1 (mod 2)
&&
g_295_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_3 g_295_low60_20_low20_2;
mov u_315_318 r_315_317;
mov v_315_318 s_315_317;

subs dc g_295_low60_20_low20_3 g_295_low60_20_low20_2 f_295_low60_20_low20_2;
asr g_295_low60_20_low20_3 g_295_low60_20_low20_3 1;
subs dc r_315_318 r_315_317 u_315_317;
asr r_315_318 r_315_318 1;
subs dc s_315_318 s_315_317 v_315_317;
asr s_315_318 s_315_318 1;
assert
    true
&&
    f_295_low60_20_low20_3 = g_295_low60_20_low20_2,
    u_315_318 = r_315_317,
    v_315_318 = s_315_317,
    g_295_low60_20_low20_3 * (const 64 2) = g_295_low60_20_low20_2 - f_295_low60_20_low20_2,
    r_315_318 * (const 64 2) = r_315_317 - u_315_317,
    s_315_318 * (const 64 2) = s_315_317 - v_315_317
;

assume
    f_295_low60_20_low20_3 = g_295_low60_20_low20_2,
    u_315_318 = r_315_317,
    v_315_318 = s_315_317,
    g_295_low60_20_low20_3 * 2 = g_295_low60_20_low20_2 - f_295_low60_20_low20_2,
    r_315_318 * 2 = r_315_317 - u_315_317,
    s_315_318 * 2 = s_315_317 - v_315_317
&&
    true
;

{
    u_315_318 * f_295_low60_20_low20_0 + v_315_318 * g_295_low60_20_low20_0 = f_295_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_318 * f_295_low60_20_low20_0 + s_315_318 * g_295_low60_20_low20_0 = g_295_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_3 + u_315_318 * (const 64 (2**21)) + v_315_318 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_3 + r_315_318 * (const 64 (2**21)) + s_315_318 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_3,
    f_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_3,
    g_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 318)) <=s delta, delta <=s (const 64 (1 + 2*318)),
    (const 64 (-(2**20))) <=s u_315_318, u_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_318, v_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_318, r_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_318, s_315_318 <=s (const 64 ((2**20))),
    u_315_318 + v_315_318 <=s (const 64 (2**20)),
    u_315_318 - v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 + v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 - v_315_318 <=s (const 64 (2**20)),
    r_315_318 + s_315_318 <=s (const 64 (2**20)),
    r_315_318 - s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 + s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 - s_315_318 <=s (const 64 (2**20)),
    u_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_315_318 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_318_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_3,
sint64 g_295_low60_20_low20_3,
sint64 f_295_low60_20_low20_4,
sint64 g_295_low60_20_low20_4,
sint64 u_315_318,
sint64 v_315_318,
sint64 r_315_318,
sint64 s_315_318,
sint64 u_315_319,
sint64 v_315_319,
sint64 r_315_319,
sint64 s_315_319,
bit ne
)={
    u_315_318 * f_295_low60_20_low20_0 + v_315_318 * g_295_low60_20_low20_0 = f_295_low60_20_low20_3 * (-(2**20)),
    r_315_318 * f_295_low60_20_low20_0 + s_315_318 * g_295_low60_20_low20_0 = g_295_low60_20_low20_3 * (-(2**20))
&&
    u_315_318 * f_295_low60_20_low20_0 + v_315_318 * g_295_low60_20_low20_0 = f_295_low60_20_low20_3 * (const 64 (-(2**20))),
    r_315_318 * f_295_low60_20_low20_0 + s_315_318 * g_295_low60_20_low20_0 = g_295_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_3 + u_315_318 * (const 64 (2**21)) + v_315_318 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_3 + r_315_318 * (const 64 (2**21)) + s_315_318 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_3,
    f_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_3,
    g_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 318)) <=s delta, delta <=s (const 64 (1 + 2*318)),
    (const 64 (-(2**20))) <=s u_315_318, u_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_318, v_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_318, r_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_318, s_315_318 <=s (const 64 ((2**20))),
    u_315_318 + v_315_318 <=s (const 64 (2**20)),
    u_315_318 - v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 + v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 - v_315_318 <=s (const 64 (2**20)),
    r_315_318 + s_315_318 <=s (const 64 (2**20)),
    r_315_318 - s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 + s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 - s_315_318 <=s (const 64 (2**20)),
    u_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_315_318 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise a
assume
g_295_low60_20_low20_3 = 0 (mod 2)
&&
g_295_low60_20_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_4 f_295_low60_20_low20_3;
mov u_315_319 u_315_318;
mov v_315_319 v_315_318;

asr g_295_low60_20_low20_4 g_295_low60_20_low20_3 1;
asr r_315_319 r_315_318 1;
asr s_315_319 s_315_318 1;
assert
    true
&&
    f_295_low60_20_low20_4 = f_295_low60_20_low20_3,
    u_315_319 = u_315_318,
    v_315_319 = v_315_318,
    g_295_low60_20_low20_4 * (const 64 2) = g_295_low60_20_low20_3,
    r_315_319 * (const 64 2) = r_315_318,
    s_315_319 * (const 64 2) = s_315_318
;

assume
    f_295_low60_20_low20_4 = f_295_low60_20_low20_3,
    u_315_319 = u_315_318,
    v_315_319 = v_315_318,
    g_295_low60_20_low20_4 * 2 = g_295_low60_20_low20_3,
    r_315_319 * 2 = r_315_318,
    s_315_319 * 2 = s_315_318
&&
    true
;

{
    u_315_319 * f_295_low60_20_low20_0 + v_315_319 * g_295_low60_20_low20_0 = f_295_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_319 * f_295_low60_20_low20_0 + s_315_319 * g_295_low60_20_low20_0 = g_295_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_4 + u_315_319 * (const 64 (2**21)) + v_315_319 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_4 + r_315_319 * (const 64 (2**21)) + s_315_319 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_4,
    f_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_4,
    g_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 319)) <=s delta, delta <=s (const 64 (1 + 2*319)),
    (const 64 (-(2**20))) <=s u_315_319, u_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_319, v_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_319, r_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_319, s_315_319 <=s (const 64 ((2**20))),
    u_315_319 + v_315_319 <=s (const 64 (2**20)),
    u_315_319 - v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 + v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 - v_315_319 <=s (const 64 (2**20)),
    r_315_319 + s_315_319 <=s (const 64 (2**20)),
    r_315_319 - s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 + s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 - s_315_319 <=s (const 64 (2**20)),
    u_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_315_319 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_318_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_3,
sint64 g_295_low60_20_low20_3,
sint64 f_295_low60_20_low20_4,
sint64 g_295_low60_20_low20_4,
sint64 u_315_318,
sint64 v_315_318,
sint64 r_315_318,
sint64 s_315_318,
sint64 u_315_319,
sint64 v_315_319,
sint64 r_315_319,
sint64 s_315_319,
bit ne
)={
    u_315_318 * f_295_low60_20_low20_0 + v_315_318 * g_295_low60_20_low20_0 = f_295_low60_20_low20_3 * (-(2**20)),
    r_315_318 * f_295_low60_20_low20_0 + s_315_318 * g_295_low60_20_low20_0 = g_295_low60_20_low20_3 * (-(2**20))
&&
    u_315_318 * f_295_low60_20_low20_0 + v_315_318 * g_295_low60_20_low20_0 = f_295_low60_20_low20_3 * (const 64 (-(2**20))),
    r_315_318 * f_295_low60_20_low20_0 + s_315_318 * g_295_low60_20_low20_0 = g_295_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_3 + u_315_318 * (const 64 (2**21)) + v_315_318 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_3 + r_315_318 * (const 64 (2**21)) + s_315_318 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_3,
    f_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_3,
    g_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 318)) <=s delta, delta <=s (const 64 (1 + 2*318)),
    (const 64 (-(2**20))) <=s u_315_318, u_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_318, v_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_318, r_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_318, s_315_318 <=s (const 64 ((2**20))),
    u_315_318 + v_315_318 <=s (const 64 (2**20)),
    u_315_318 - v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 + v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 - v_315_318 <=s (const 64 (2**20)),
    r_315_318 + s_315_318 <=s (const 64 (2**20)),
    r_315_318 - s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 + s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 - s_315_318 <=s (const 64 (2**20)),
    u_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_315_318 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise b
assume
g_295_low60_20_low20_3 = 1 (mod 2)
&&
g_295_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_4 f_295_low60_20_low20_3;
mov u_315_319 u_315_318;
mov v_315_319 v_315_318;

add g_295_low60_20_low20_4 g_295_low60_20_low20_3 f_295_low60_20_low20_3;
asr g_295_low60_20_low20_4 g_295_low60_20_low20_4 1;
add r_315_319 r_315_318 u_315_318;
asr r_315_319 r_315_319 1;
add s_315_319 s_315_318 v_315_318;
asr s_315_319 s_315_319 1;
assert
    true
&&
    f_295_low60_20_low20_4 = f_295_low60_20_low20_3,
    u_315_319 = u_315_318,
    v_315_319 = v_315_318,
    g_295_low60_20_low20_4 * (const 64 2) = g_295_low60_20_low20_3 + f_295_low60_20_low20_3,
    r_315_319 * (const 64 2) = r_315_318 + u_315_318,
    s_315_319 * (const 64 2) = s_315_318 + v_315_318
;

assume
    f_295_low60_20_low20_4 = f_295_low60_20_low20_3,
    u_315_319 = u_315_318,
    v_315_319 = v_315_318,
    g_295_low60_20_low20_4 * 2 = g_295_low60_20_low20_3 + f_295_low60_20_low20_3,
    r_315_319 * 2 = r_315_318 + u_315_318,
    s_315_319 * 2 = s_315_318 + v_315_318
&&
    true
;

{
    u_315_319 * f_295_low60_20_low20_0 + v_315_319 * g_295_low60_20_low20_0 = f_295_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_319 * f_295_low60_20_low20_0 + s_315_319 * g_295_low60_20_low20_0 = g_295_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_4 + u_315_319 * (const 64 (2**21)) + v_315_319 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_4 + r_315_319 * (const 64 (2**21)) + s_315_319 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_4,
    f_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_4,
    g_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 319)) <=s delta, delta <=s (const 64 (1 + 2*319)),
    (const 64 (-(2**20))) <=s u_315_319, u_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_319, v_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_319, r_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_319, s_315_319 <=s (const 64 ((2**20))),
    u_315_319 + v_315_319 <=s (const 64 (2**20)),
    u_315_319 - v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 + v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 - v_315_319 <=s (const 64 (2**20)),
    r_315_319 + s_315_319 <=s (const 64 (2**20)),
    r_315_319 - s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 + s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 - s_315_319 <=s (const 64 (2**20)),
    u_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_315_319 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_318_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_3,
sint64 g_295_low60_20_low20_3,
sint64 f_295_low60_20_low20_4,
sint64 g_295_low60_20_low20_4,
sint64 u_315_318,
sint64 v_315_318,
sint64 r_315_318,
sint64 s_315_318,
sint64 u_315_319,
sint64 v_315_319,
sint64 r_315_319,
sint64 s_315_319,
bit ne
)={
    u_315_318 * f_295_low60_20_low20_0 + v_315_318 * g_295_low60_20_low20_0 = f_295_low60_20_low20_3 * (-(2**20)),
    r_315_318 * f_295_low60_20_low20_0 + s_315_318 * g_295_low60_20_low20_0 = g_295_low60_20_low20_3 * (-(2**20))
&&
    u_315_318 * f_295_low60_20_low20_0 + v_315_318 * g_295_low60_20_low20_0 = f_295_low60_20_low20_3 * (const 64 (-(2**20))),
    r_315_318 * f_295_low60_20_low20_0 + s_315_318 * g_295_low60_20_low20_0 = g_295_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_3 + u_315_318 * (const 64 (2**21)) + v_315_318 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_3 + r_315_318 * (const 64 (2**21)) + s_315_318 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_3,
    f_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_3,
    g_295_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 318)) <=s delta, delta <=s (const 64 (1 + 2*318)),
    (const 64 (-(2**20))) <=s u_315_318, u_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_318, v_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_318, r_315_318 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_318, s_315_318 <=s (const 64 ((2**20))),
    u_315_318 + v_315_318 <=s (const 64 (2**20)),
    u_315_318 - v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 + v_315_318 <=s (const 64 (2**20)),
    (const 64 0) - u_315_318 - v_315_318 <=s (const 64 (2**20)),
    r_315_318 + s_315_318 <=s (const 64 (2**20)),
    r_315_318 - s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 + s_315_318 <=s (const 64 (2**20)),
    (const 64 0) - r_315_318 - s_315_318 <=s (const 64 (2**20)),
    u_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_315_318 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_315_318 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise c
assume
g_295_low60_20_low20_3 = 1 (mod 2)
&&
g_295_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_4 g_295_low60_20_low20_3;
mov u_315_319 r_315_318;
mov v_315_319 s_315_318;

subs dc g_295_low60_20_low20_4 g_295_low60_20_low20_3 f_295_low60_20_low20_3;
asr g_295_low60_20_low20_4 g_295_low60_20_low20_4 1;
subs dc r_315_319 r_315_318 u_315_318;
asr r_315_319 r_315_319 1;
subs dc s_315_319 s_315_318 v_315_318;
asr s_315_319 s_315_319 1;
assert
    true
&&
    f_295_low60_20_low20_4 = g_295_low60_20_low20_3,
    u_315_319 = r_315_318,
    v_315_319 = s_315_318,
    g_295_low60_20_low20_4 * (const 64 2) = g_295_low60_20_low20_3 - f_295_low60_20_low20_3,
    r_315_319 * (const 64 2) = r_315_318 - u_315_318,
    s_315_319 * (const 64 2) = s_315_318 - v_315_318
;

assume
    f_295_low60_20_low20_4 = g_295_low60_20_low20_3,
    u_315_319 = r_315_318,
    v_315_319 = s_315_318,
    g_295_low60_20_low20_4 * 2 = g_295_low60_20_low20_3 - f_295_low60_20_low20_3,
    r_315_319 * 2 = r_315_318 - u_315_318,
    s_315_319 * 2 = s_315_318 - v_315_318
&&
    true
;

{
    u_315_319 * f_295_low60_20_low20_0 + v_315_319 * g_295_low60_20_low20_0 = f_295_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_319 * f_295_low60_20_low20_0 + s_315_319 * g_295_low60_20_low20_0 = g_295_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_4 + u_315_319 * (const 64 (2**21)) + v_315_319 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_4 + r_315_319 * (const 64 (2**21)) + s_315_319 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_4,
    f_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_4,
    g_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 319)) <=s delta, delta <=s (const 64 (1 + 2*319)),
    (const 64 (-(2**20))) <=s u_315_319, u_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_319, v_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_319, r_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_319, s_315_319 <=s (const 64 ((2**20))),
    u_315_319 + v_315_319 <=s (const 64 (2**20)),
    u_315_319 - v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 + v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 - v_315_319 <=s (const 64 (2**20)),
    r_315_319 + s_315_319 <=s (const 64 (2**20)),
    r_315_319 - s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 + s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 - s_315_319 <=s (const 64 (2**20)),
    u_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_315_319 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_319_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_4,
sint64 g_295_low60_20_low20_4,
sint64 f_295_low60_20_low20_5,
sint64 g_295_low60_20_low20_5,
sint64 u_315_319,
sint64 v_315_319,
sint64 r_315_319,
sint64 s_315_319,
sint64 u_315_320,
sint64 v_315_320,
sint64 r_315_320,
sint64 s_315_320,
bit ne
)={
    u_315_319 * f_295_low60_20_low20_0 + v_315_319 * g_295_low60_20_low20_0 = f_295_low60_20_low20_4 * (-(2**20)),
    r_315_319 * f_295_low60_20_low20_0 + s_315_319 * g_295_low60_20_low20_0 = g_295_low60_20_low20_4 * (-(2**20))
&&
    u_315_319 * f_295_low60_20_low20_0 + v_315_319 * g_295_low60_20_low20_0 = f_295_low60_20_low20_4 * (const 64 (-(2**20))),
    r_315_319 * f_295_low60_20_low20_0 + s_315_319 * g_295_low60_20_low20_0 = g_295_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_4 + u_315_319 * (const 64 (2**21)) + v_315_319 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_4 + r_315_319 * (const 64 (2**21)) + s_315_319 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_4,
    f_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_4,
    g_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 319)) <=s delta, delta <=s (const 64 (1 + 2*319)),
    (const 64 (-(2**20))) <=s u_315_319, u_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_319, v_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_319, r_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_319, s_315_319 <=s (const 64 ((2**20))),
    u_315_319 + v_315_319 <=s (const 64 (2**20)),
    u_315_319 - v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 + v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 - v_315_319 <=s (const 64 (2**20)),
    r_315_319 + s_315_319 <=s (const 64 (2**20)),
    r_315_319 - s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 + s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 - s_315_319 <=s (const 64 (2**20)),
    u_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_315_319 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise a
assume
g_295_low60_20_low20_4 = 0 (mod 2)
&&
g_295_low60_20_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_5 f_295_low60_20_low20_4;
mov u_315_320 u_315_319;
mov v_315_320 v_315_319;

asr g_295_low60_20_low20_5 g_295_low60_20_low20_4 1;
asr r_315_320 r_315_319 1;
asr s_315_320 s_315_319 1;
assert
    true
&&
    f_295_low60_20_low20_5 = f_295_low60_20_low20_4,
    u_315_320 = u_315_319,
    v_315_320 = v_315_319,
    g_295_low60_20_low20_5 * (const 64 2) = g_295_low60_20_low20_4,
    r_315_320 * (const 64 2) = r_315_319,
    s_315_320 * (const 64 2) = s_315_319
;

assume
    f_295_low60_20_low20_5 = f_295_low60_20_low20_4,
    u_315_320 = u_315_319,
    v_315_320 = v_315_319,
    g_295_low60_20_low20_5 * 2 = g_295_low60_20_low20_4,
    r_315_320 * 2 = r_315_319,
    s_315_320 * 2 = s_315_319
&&
    true
;

{
    u_315_320 * f_295_low60_20_low20_0 + v_315_320 * g_295_low60_20_low20_0 = f_295_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_320 * f_295_low60_20_low20_0 + s_315_320 * g_295_low60_20_low20_0 = g_295_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_5 + u_315_320 * (const 64 (2**21)) + v_315_320 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_5 + r_315_320 * (const 64 (2**21)) + s_315_320 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_5,
    f_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_5,
    g_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 320)) <=s delta, delta <=s (const 64 (1 + 2*320)),
    (const 64 (-(2**20))) <=s u_315_320, u_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_320, v_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_320, r_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_320, s_315_320 <=s (const 64 ((2**20))),
    u_315_320 + v_315_320 <=s (const 64 (2**20)),
    u_315_320 - v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 + v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 - v_315_320 <=s (const 64 (2**20)),
    r_315_320 + s_315_320 <=s (const 64 (2**20)),
    r_315_320 - s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 + s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 - s_315_320 <=s (const 64 (2**20)),
    u_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_315_320 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_319_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_4,
sint64 g_295_low60_20_low20_4,
sint64 f_295_low60_20_low20_5,
sint64 g_295_low60_20_low20_5,
sint64 u_315_319,
sint64 v_315_319,
sint64 r_315_319,
sint64 s_315_319,
sint64 u_315_320,
sint64 v_315_320,
sint64 r_315_320,
sint64 s_315_320,
bit ne
)={
    u_315_319 * f_295_low60_20_low20_0 + v_315_319 * g_295_low60_20_low20_0 = f_295_low60_20_low20_4 * (-(2**20)),
    r_315_319 * f_295_low60_20_low20_0 + s_315_319 * g_295_low60_20_low20_0 = g_295_low60_20_low20_4 * (-(2**20))
&&
    u_315_319 * f_295_low60_20_low20_0 + v_315_319 * g_295_low60_20_low20_0 = f_295_low60_20_low20_4 * (const 64 (-(2**20))),
    r_315_319 * f_295_low60_20_low20_0 + s_315_319 * g_295_low60_20_low20_0 = g_295_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_4 + u_315_319 * (const 64 (2**21)) + v_315_319 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_4 + r_315_319 * (const 64 (2**21)) + s_315_319 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_4,
    f_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_4,
    g_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 319)) <=s delta, delta <=s (const 64 (1 + 2*319)),
    (const 64 (-(2**20))) <=s u_315_319, u_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_319, v_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_319, r_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_319, s_315_319 <=s (const 64 ((2**20))),
    u_315_319 + v_315_319 <=s (const 64 (2**20)),
    u_315_319 - v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 + v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 - v_315_319 <=s (const 64 (2**20)),
    r_315_319 + s_315_319 <=s (const 64 (2**20)),
    r_315_319 - s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 + s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 - s_315_319 <=s (const 64 (2**20)),
    u_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_315_319 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise b
assume
g_295_low60_20_low20_4 = 1 (mod 2)
&&
g_295_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_5 f_295_low60_20_low20_4;
mov u_315_320 u_315_319;
mov v_315_320 v_315_319;

add g_295_low60_20_low20_5 g_295_low60_20_low20_4 f_295_low60_20_low20_4;
asr g_295_low60_20_low20_5 g_295_low60_20_low20_5 1;
add r_315_320 r_315_319 u_315_319;
asr r_315_320 r_315_320 1;
add s_315_320 s_315_319 v_315_319;
asr s_315_320 s_315_320 1;
assert
    true
&&
    f_295_low60_20_low20_5 = f_295_low60_20_low20_4,
    u_315_320 = u_315_319,
    v_315_320 = v_315_319,
    g_295_low60_20_low20_5 * (const 64 2) = g_295_low60_20_low20_4 + f_295_low60_20_low20_4,
    r_315_320 * (const 64 2) = r_315_319 + u_315_319,
    s_315_320 * (const 64 2) = s_315_319 + v_315_319
;

assume
    f_295_low60_20_low20_5 = f_295_low60_20_low20_4,
    u_315_320 = u_315_319,
    v_315_320 = v_315_319,
    g_295_low60_20_low20_5 * 2 = g_295_low60_20_low20_4 + f_295_low60_20_low20_4,
    r_315_320 * 2 = r_315_319 + u_315_319,
    s_315_320 * 2 = s_315_319 + v_315_319
&&
    true
;

{
    u_315_320 * f_295_low60_20_low20_0 + v_315_320 * g_295_low60_20_low20_0 = f_295_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_320 * f_295_low60_20_low20_0 + s_315_320 * g_295_low60_20_low20_0 = g_295_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_5 + u_315_320 * (const 64 (2**21)) + v_315_320 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_5 + r_315_320 * (const 64 (2**21)) + s_315_320 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_5,
    f_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_5,
    g_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 320)) <=s delta, delta <=s (const 64 (1 + 2*320)),
    (const 64 (-(2**20))) <=s u_315_320, u_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_320, v_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_320, r_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_320, s_315_320 <=s (const 64 ((2**20))),
    u_315_320 + v_315_320 <=s (const 64 (2**20)),
    u_315_320 - v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 + v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 - v_315_320 <=s (const 64 (2**20)),
    r_315_320 + s_315_320 <=s (const 64 (2**20)),
    r_315_320 - s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 + s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 - s_315_320 <=s (const 64 (2**20)),
    u_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_315_320 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_319_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_4,
sint64 g_295_low60_20_low20_4,
sint64 f_295_low60_20_low20_5,
sint64 g_295_low60_20_low20_5,
sint64 u_315_319,
sint64 v_315_319,
sint64 r_315_319,
sint64 s_315_319,
sint64 u_315_320,
sint64 v_315_320,
sint64 r_315_320,
sint64 s_315_320,
bit ne
)={
    u_315_319 * f_295_low60_20_low20_0 + v_315_319 * g_295_low60_20_low20_0 = f_295_low60_20_low20_4 * (-(2**20)),
    r_315_319 * f_295_low60_20_low20_0 + s_315_319 * g_295_low60_20_low20_0 = g_295_low60_20_low20_4 * (-(2**20))
&&
    u_315_319 * f_295_low60_20_low20_0 + v_315_319 * g_295_low60_20_low20_0 = f_295_low60_20_low20_4 * (const 64 (-(2**20))),
    r_315_319 * f_295_low60_20_low20_0 + s_315_319 * g_295_low60_20_low20_0 = g_295_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_4 + u_315_319 * (const 64 (2**21)) + v_315_319 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_4 + r_315_319 * (const 64 (2**21)) + s_315_319 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_4,
    f_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_4,
    g_295_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 319)) <=s delta, delta <=s (const 64 (1 + 2*319)),
    (const 64 (-(2**20))) <=s u_315_319, u_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_319, v_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_319, r_315_319 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_319, s_315_319 <=s (const 64 ((2**20))),
    u_315_319 + v_315_319 <=s (const 64 (2**20)),
    u_315_319 - v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 + v_315_319 <=s (const 64 (2**20)),
    (const 64 0) - u_315_319 - v_315_319 <=s (const 64 (2**20)),
    r_315_319 + s_315_319 <=s (const 64 (2**20)),
    r_315_319 - s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 + s_315_319 <=s (const 64 (2**20)),
    (const 64 0) - r_315_319 - s_315_319 <=s (const 64 (2**20)),
    u_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_315_319 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_315_319 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise c
assume
g_295_low60_20_low20_4 = 1 (mod 2)
&&
g_295_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_5 g_295_low60_20_low20_4;
mov u_315_320 r_315_319;
mov v_315_320 s_315_319;

subs dc g_295_low60_20_low20_5 g_295_low60_20_low20_4 f_295_low60_20_low20_4;
asr g_295_low60_20_low20_5 g_295_low60_20_low20_5 1;
subs dc r_315_320 r_315_319 u_315_319;
asr r_315_320 r_315_320 1;
subs dc s_315_320 s_315_319 v_315_319;
asr s_315_320 s_315_320 1;
assert
    true
&&
    f_295_low60_20_low20_5 = g_295_low60_20_low20_4,
    u_315_320 = r_315_319,
    v_315_320 = s_315_319,
    g_295_low60_20_low20_5 * (const 64 2) = g_295_low60_20_low20_4 - f_295_low60_20_low20_4,
    r_315_320 * (const 64 2) = r_315_319 - u_315_319,
    s_315_320 * (const 64 2) = s_315_319 - v_315_319
;

assume
    f_295_low60_20_low20_5 = g_295_low60_20_low20_4,
    u_315_320 = r_315_319,
    v_315_320 = s_315_319,
    g_295_low60_20_low20_5 * 2 = g_295_low60_20_low20_4 - f_295_low60_20_low20_4,
    r_315_320 * 2 = r_315_319 - u_315_319,
    s_315_320 * 2 = s_315_319 - v_315_319
&&
    true
;

{
    u_315_320 * f_295_low60_20_low20_0 + v_315_320 * g_295_low60_20_low20_0 = f_295_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_320 * f_295_low60_20_low20_0 + s_315_320 * g_295_low60_20_low20_0 = g_295_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_5 + u_315_320 * (const 64 (2**21)) + v_315_320 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_5 + r_315_320 * (const 64 (2**21)) + s_315_320 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_5,
    f_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_5,
    g_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 320)) <=s delta, delta <=s (const 64 (1 + 2*320)),
    (const 64 (-(2**20))) <=s u_315_320, u_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_320, v_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_320, r_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_320, s_315_320 <=s (const 64 ((2**20))),
    u_315_320 + v_315_320 <=s (const 64 (2**20)),
    u_315_320 - v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 + v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 - v_315_320 <=s (const 64 (2**20)),
    r_315_320 + s_315_320 <=s (const 64 (2**20)),
    r_315_320 - s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 + s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 - s_315_320 <=s (const 64 (2**20)),
    u_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_315_320 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_320_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_5,
sint64 g_295_low60_20_low20_5,
sint64 f_295_low60_20_low20_6,
sint64 g_295_low60_20_low20_6,
sint64 u_315_320,
sint64 v_315_320,
sint64 r_315_320,
sint64 s_315_320,
sint64 u_315_321,
sint64 v_315_321,
sint64 r_315_321,
sint64 s_315_321,
bit ne
)={
    u_315_320 * f_295_low60_20_low20_0 + v_315_320 * g_295_low60_20_low20_0 = f_295_low60_20_low20_5 * (-(2**20)),
    r_315_320 * f_295_low60_20_low20_0 + s_315_320 * g_295_low60_20_low20_0 = g_295_low60_20_low20_5 * (-(2**20))
&&
    u_315_320 * f_295_low60_20_low20_0 + v_315_320 * g_295_low60_20_low20_0 = f_295_low60_20_low20_5 * (const 64 (-(2**20))),
    r_315_320 * f_295_low60_20_low20_0 + s_315_320 * g_295_low60_20_low20_0 = g_295_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_5 + u_315_320 * (const 64 (2**21)) + v_315_320 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_5 + r_315_320 * (const 64 (2**21)) + s_315_320 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_5,
    f_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_5,
    g_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 320)) <=s delta, delta <=s (const 64 (1 + 2*320)),
    (const 64 (-(2**20))) <=s u_315_320, u_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_320, v_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_320, r_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_320, s_315_320 <=s (const 64 ((2**20))),
    u_315_320 + v_315_320 <=s (const 64 (2**20)),
    u_315_320 - v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 + v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 - v_315_320 <=s (const 64 (2**20)),
    r_315_320 + s_315_320 <=s (const 64 (2**20)),
    r_315_320 - s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 + s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 - s_315_320 <=s (const 64 (2**20)),
    u_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_315_320 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise a
assume
g_295_low60_20_low20_5 = 0 (mod 2)
&&
g_295_low60_20_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_6 f_295_low60_20_low20_5;
mov u_315_321 u_315_320;
mov v_315_321 v_315_320;

asr g_295_low60_20_low20_6 g_295_low60_20_low20_5 1;
asr r_315_321 r_315_320 1;
asr s_315_321 s_315_320 1;
assert
    true
&&
    f_295_low60_20_low20_6 = f_295_low60_20_low20_5,
    u_315_321 = u_315_320,
    v_315_321 = v_315_320,
    g_295_low60_20_low20_6 * (const 64 2) = g_295_low60_20_low20_5,
    r_315_321 * (const 64 2) = r_315_320,
    s_315_321 * (const 64 2) = s_315_320
;

assume
    f_295_low60_20_low20_6 = f_295_low60_20_low20_5,
    u_315_321 = u_315_320,
    v_315_321 = v_315_320,
    g_295_low60_20_low20_6 * 2 = g_295_low60_20_low20_5,
    r_315_321 * 2 = r_315_320,
    s_315_321 * 2 = s_315_320
&&
    true
;

{
    u_315_321 * f_295_low60_20_low20_0 + v_315_321 * g_295_low60_20_low20_0 = f_295_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_321 * f_295_low60_20_low20_0 + s_315_321 * g_295_low60_20_low20_0 = g_295_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_6 + u_315_321 * (const 64 (2**21)) + v_315_321 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_6 + r_315_321 * (const 64 (2**21)) + s_315_321 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_6,
    f_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_6,
    g_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 321)) <=s delta, delta <=s (const 64 (1 + 2*321)),
    (const 64 (-(2**20))) <=s u_315_321, u_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_321, v_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_321, r_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_321, s_315_321 <=s (const 64 ((2**20))),
    u_315_321 + v_315_321 <=s (const 64 (2**20)),
    u_315_321 - v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 + v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 - v_315_321 <=s (const 64 (2**20)),
    r_315_321 + s_315_321 <=s (const 64 (2**20)),
    r_315_321 - s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 + s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 - s_315_321 <=s (const 64 (2**20)),
    u_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_315_321 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_320_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_5,
sint64 g_295_low60_20_low20_5,
sint64 f_295_low60_20_low20_6,
sint64 g_295_low60_20_low20_6,
sint64 u_315_320,
sint64 v_315_320,
sint64 r_315_320,
sint64 s_315_320,
sint64 u_315_321,
sint64 v_315_321,
sint64 r_315_321,
sint64 s_315_321,
bit ne
)={
    u_315_320 * f_295_low60_20_low20_0 + v_315_320 * g_295_low60_20_low20_0 = f_295_low60_20_low20_5 * (-(2**20)),
    r_315_320 * f_295_low60_20_low20_0 + s_315_320 * g_295_low60_20_low20_0 = g_295_low60_20_low20_5 * (-(2**20))
&&
    u_315_320 * f_295_low60_20_low20_0 + v_315_320 * g_295_low60_20_low20_0 = f_295_low60_20_low20_5 * (const 64 (-(2**20))),
    r_315_320 * f_295_low60_20_low20_0 + s_315_320 * g_295_low60_20_low20_0 = g_295_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_5 + u_315_320 * (const 64 (2**21)) + v_315_320 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_5 + r_315_320 * (const 64 (2**21)) + s_315_320 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_5,
    f_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_5,
    g_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 320)) <=s delta, delta <=s (const 64 (1 + 2*320)),
    (const 64 (-(2**20))) <=s u_315_320, u_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_320, v_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_320, r_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_320, s_315_320 <=s (const 64 ((2**20))),
    u_315_320 + v_315_320 <=s (const 64 (2**20)),
    u_315_320 - v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 + v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 - v_315_320 <=s (const 64 (2**20)),
    r_315_320 + s_315_320 <=s (const 64 (2**20)),
    r_315_320 - s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 + s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 - s_315_320 <=s (const 64 (2**20)),
    u_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_315_320 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise b
assume
g_295_low60_20_low20_5 = 1 (mod 2)
&&
g_295_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_6 f_295_low60_20_low20_5;
mov u_315_321 u_315_320;
mov v_315_321 v_315_320;

add g_295_low60_20_low20_6 g_295_low60_20_low20_5 f_295_low60_20_low20_5;
asr g_295_low60_20_low20_6 g_295_low60_20_low20_6 1;
add r_315_321 r_315_320 u_315_320;
asr r_315_321 r_315_321 1;
add s_315_321 s_315_320 v_315_320;
asr s_315_321 s_315_321 1;
assert
    true
&&
    f_295_low60_20_low20_6 = f_295_low60_20_low20_5,
    u_315_321 = u_315_320,
    v_315_321 = v_315_320,
    g_295_low60_20_low20_6 * (const 64 2) = g_295_low60_20_low20_5 + f_295_low60_20_low20_5,
    r_315_321 * (const 64 2) = r_315_320 + u_315_320,
    s_315_321 * (const 64 2) = s_315_320 + v_315_320
;

assume
    f_295_low60_20_low20_6 = f_295_low60_20_low20_5,
    u_315_321 = u_315_320,
    v_315_321 = v_315_320,
    g_295_low60_20_low20_6 * 2 = g_295_low60_20_low20_5 + f_295_low60_20_low20_5,
    r_315_321 * 2 = r_315_320 + u_315_320,
    s_315_321 * 2 = s_315_320 + v_315_320
&&
    true
;

{
    u_315_321 * f_295_low60_20_low20_0 + v_315_321 * g_295_low60_20_low20_0 = f_295_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_321 * f_295_low60_20_low20_0 + s_315_321 * g_295_low60_20_low20_0 = g_295_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_6 + u_315_321 * (const 64 (2**21)) + v_315_321 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_6 + r_315_321 * (const 64 (2**21)) + s_315_321 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_6,
    f_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_6,
    g_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 321)) <=s delta, delta <=s (const 64 (1 + 2*321)),
    (const 64 (-(2**20))) <=s u_315_321, u_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_321, v_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_321, r_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_321, s_315_321 <=s (const 64 ((2**20))),
    u_315_321 + v_315_321 <=s (const 64 (2**20)),
    u_315_321 - v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 + v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 - v_315_321 <=s (const 64 (2**20)),
    r_315_321 + s_315_321 <=s (const 64 (2**20)),
    r_315_321 - s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 + s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 - s_315_321 <=s (const 64 (2**20)),
    u_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_315_321 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_320_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_5,
sint64 g_295_low60_20_low20_5,
sint64 f_295_low60_20_low20_6,
sint64 g_295_low60_20_low20_6,
sint64 u_315_320,
sint64 v_315_320,
sint64 r_315_320,
sint64 s_315_320,
sint64 u_315_321,
sint64 v_315_321,
sint64 r_315_321,
sint64 s_315_321,
bit ne
)={
    u_315_320 * f_295_low60_20_low20_0 + v_315_320 * g_295_low60_20_low20_0 = f_295_low60_20_low20_5 * (-(2**20)),
    r_315_320 * f_295_low60_20_low20_0 + s_315_320 * g_295_low60_20_low20_0 = g_295_low60_20_low20_5 * (-(2**20))
&&
    u_315_320 * f_295_low60_20_low20_0 + v_315_320 * g_295_low60_20_low20_0 = f_295_low60_20_low20_5 * (const 64 (-(2**20))),
    r_315_320 * f_295_low60_20_low20_0 + s_315_320 * g_295_low60_20_low20_0 = g_295_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_5 + u_315_320 * (const 64 (2**21)) + v_315_320 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_5 + r_315_320 * (const 64 (2**21)) + s_315_320 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_5,
    f_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_5,
    g_295_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 320)) <=s delta, delta <=s (const 64 (1 + 2*320)),
    (const 64 (-(2**20))) <=s u_315_320, u_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_320, v_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_320, r_315_320 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_320, s_315_320 <=s (const 64 ((2**20))),
    u_315_320 + v_315_320 <=s (const 64 (2**20)),
    u_315_320 - v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 + v_315_320 <=s (const 64 (2**20)),
    (const 64 0) - u_315_320 - v_315_320 <=s (const 64 (2**20)),
    r_315_320 + s_315_320 <=s (const 64 (2**20)),
    r_315_320 - s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 + s_315_320 <=s (const 64 (2**20)),
    (const 64 0) - r_315_320 - s_315_320 <=s (const 64 (2**20)),
    u_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_315_320 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_315_320 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise c
assume
g_295_low60_20_low20_5 = 1 (mod 2)
&&
g_295_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_6 g_295_low60_20_low20_5;
mov u_315_321 r_315_320;
mov v_315_321 s_315_320;

subs dc g_295_low60_20_low20_6 g_295_low60_20_low20_5 f_295_low60_20_low20_5;
asr g_295_low60_20_low20_6 g_295_low60_20_low20_6 1;
subs dc r_315_321 r_315_320 u_315_320;
asr r_315_321 r_315_321 1;
subs dc s_315_321 s_315_320 v_315_320;
asr s_315_321 s_315_321 1;
assert
    true
&&
    f_295_low60_20_low20_6 = g_295_low60_20_low20_5,
    u_315_321 = r_315_320,
    v_315_321 = s_315_320,
    g_295_low60_20_low20_6 * (const 64 2) = g_295_low60_20_low20_5 - f_295_low60_20_low20_5,
    r_315_321 * (const 64 2) = r_315_320 - u_315_320,
    s_315_321 * (const 64 2) = s_315_320 - v_315_320
;

assume
    f_295_low60_20_low20_6 = g_295_low60_20_low20_5,
    u_315_321 = r_315_320,
    v_315_321 = s_315_320,
    g_295_low60_20_low20_6 * 2 = g_295_low60_20_low20_5 - f_295_low60_20_low20_5,
    r_315_321 * 2 = r_315_320 - u_315_320,
    s_315_321 * 2 = s_315_320 - v_315_320
&&
    true
;

{
    u_315_321 * f_295_low60_20_low20_0 + v_315_321 * g_295_low60_20_low20_0 = f_295_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_321 * f_295_low60_20_low20_0 + s_315_321 * g_295_low60_20_low20_0 = g_295_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_6 + u_315_321 * (const 64 (2**21)) + v_315_321 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_6 + r_315_321 * (const 64 (2**21)) + s_315_321 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_6,
    f_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_6,
    g_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 321)) <=s delta, delta <=s (const 64 (1 + 2*321)),
    (const 64 (-(2**20))) <=s u_315_321, u_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_321, v_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_321, r_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_321, s_315_321 <=s (const 64 ((2**20))),
    u_315_321 + v_315_321 <=s (const 64 (2**20)),
    u_315_321 - v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 + v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 - v_315_321 <=s (const 64 (2**20)),
    r_315_321 + s_315_321 <=s (const 64 (2**20)),
    r_315_321 - s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 + s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 - s_315_321 <=s (const 64 (2**20)),
    u_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_315_321 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_321_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_6,
sint64 g_295_low60_20_low20_6,
sint64 f_295_low60_20_low20_7,
sint64 g_295_low60_20_low20_7,
sint64 u_315_321,
sint64 v_315_321,
sint64 r_315_321,
sint64 s_315_321,
sint64 u_315_322,
sint64 v_315_322,
sint64 r_315_322,
sint64 s_315_322,
bit ne
)={
    u_315_321 * f_295_low60_20_low20_0 + v_315_321 * g_295_low60_20_low20_0 = f_295_low60_20_low20_6 * (-(2**20)),
    r_315_321 * f_295_low60_20_low20_0 + s_315_321 * g_295_low60_20_low20_0 = g_295_low60_20_low20_6 * (-(2**20))
&&
    u_315_321 * f_295_low60_20_low20_0 + v_315_321 * g_295_low60_20_low20_0 = f_295_low60_20_low20_6 * (const 64 (-(2**20))),
    r_315_321 * f_295_low60_20_low20_0 + s_315_321 * g_295_low60_20_low20_0 = g_295_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_6 + u_315_321 * (const 64 (2**21)) + v_315_321 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_6 + r_315_321 * (const 64 (2**21)) + s_315_321 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_6,
    f_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_6,
    g_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 321)) <=s delta, delta <=s (const 64 (1 + 2*321)),
    (const 64 (-(2**20))) <=s u_315_321, u_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_321, v_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_321, r_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_321, s_315_321 <=s (const 64 ((2**20))),
    u_315_321 + v_315_321 <=s (const 64 (2**20)),
    u_315_321 - v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 + v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 - v_315_321 <=s (const 64 (2**20)),
    r_315_321 + s_315_321 <=s (const 64 (2**20)),
    r_315_321 - s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 + s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 - s_315_321 <=s (const 64 (2**20)),
    u_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_315_321 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise a
assume
g_295_low60_20_low20_6 = 0 (mod 2)
&&
g_295_low60_20_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_7 f_295_low60_20_low20_6;
mov u_315_322 u_315_321;
mov v_315_322 v_315_321;

asr g_295_low60_20_low20_7 g_295_low60_20_low20_6 1;
asr r_315_322 r_315_321 1;
asr s_315_322 s_315_321 1;
assert
    true
&&
    f_295_low60_20_low20_7 = f_295_low60_20_low20_6,
    u_315_322 = u_315_321,
    v_315_322 = v_315_321,
    g_295_low60_20_low20_7 * (const 64 2) = g_295_low60_20_low20_6,
    r_315_322 * (const 64 2) = r_315_321,
    s_315_322 * (const 64 2) = s_315_321
;

assume
    f_295_low60_20_low20_7 = f_295_low60_20_low20_6,
    u_315_322 = u_315_321,
    v_315_322 = v_315_321,
    g_295_low60_20_low20_7 * 2 = g_295_low60_20_low20_6,
    r_315_322 * 2 = r_315_321,
    s_315_322 * 2 = s_315_321
&&
    true
;

{
    u_315_322 * f_295_low60_20_low20_0 + v_315_322 * g_295_low60_20_low20_0 = f_295_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_322 * f_295_low60_20_low20_0 + s_315_322 * g_295_low60_20_low20_0 = g_295_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_7 + u_315_322 * (const 64 (2**21)) + v_315_322 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_7 + r_315_322 * (const 64 (2**21)) + s_315_322 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_7,
    f_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_7,
    g_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 322)) <=s delta, delta <=s (const 64 (1 + 2*322)),
    (const 64 (-(2**20))) <=s u_315_322, u_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_322, v_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_322, r_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_322, s_315_322 <=s (const 64 ((2**20))),
    u_315_322 + v_315_322 <=s (const 64 (2**20)),
    u_315_322 - v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 + v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 - v_315_322 <=s (const 64 (2**20)),
    r_315_322 + s_315_322 <=s (const 64 (2**20)),
    r_315_322 - s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 + s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 - s_315_322 <=s (const 64 (2**20)),
    u_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_315_322 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_321_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_6,
sint64 g_295_low60_20_low20_6,
sint64 f_295_low60_20_low20_7,
sint64 g_295_low60_20_low20_7,
sint64 u_315_321,
sint64 v_315_321,
sint64 r_315_321,
sint64 s_315_321,
sint64 u_315_322,
sint64 v_315_322,
sint64 r_315_322,
sint64 s_315_322,
bit ne
)={
    u_315_321 * f_295_low60_20_low20_0 + v_315_321 * g_295_low60_20_low20_0 = f_295_low60_20_low20_6 * (-(2**20)),
    r_315_321 * f_295_low60_20_low20_0 + s_315_321 * g_295_low60_20_low20_0 = g_295_low60_20_low20_6 * (-(2**20))
&&
    u_315_321 * f_295_low60_20_low20_0 + v_315_321 * g_295_low60_20_low20_0 = f_295_low60_20_low20_6 * (const 64 (-(2**20))),
    r_315_321 * f_295_low60_20_low20_0 + s_315_321 * g_295_low60_20_low20_0 = g_295_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_6 + u_315_321 * (const 64 (2**21)) + v_315_321 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_6 + r_315_321 * (const 64 (2**21)) + s_315_321 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_6,
    f_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_6,
    g_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 321)) <=s delta, delta <=s (const 64 (1 + 2*321)),
    (const 64 (-(2**20))) <=s u_315_321, u_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_321, v_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_321, r_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_321, s_315_321 <=s (const 64 ((2**20))),
    u_315_321 + v_315_321 <=s (const 64 (2**20)),
    u_315_321 - v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 + v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 - v_315_321 <=s (const 64 (2**20)),
    r_315_321 + s_315_321 <=s (const 64 (2**20)),
    r_315_321 - s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 + s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 - s_315_321 <=s (const 64 (2**20)),
    u_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_315_321 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise b
assume
g_295_low60_20_low20_6 = 1 (mod 2)
&&
g_295_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_7 f_295_low60_20_low20_6;
mov u_315_322 u_315_321;
mov v_315_322 v_315_321;

add g_295_low60_20_low20_7 g_295_low60_20_low20_6 f_295_low60_20_low20_6;
asr g_295_low60_20_low20_7 g_295_low60_20_low20_7 1;
add r_315_322 r_315_321 u_315_321;
asr r_315_322 r_315_322 1;
add s_315_322 s_315_321 v_315_321;
asr s_315_322 s_315_322 1;
assert
    true
&&
    f_295_low60_20_low20_7 = f_295_low60_20_low20_6,
    u_315_322 = u_315_321,
    v_315_322 = v_315_321,
    g_295_low60_20_low20_7 * (const 64 2) = g_295_low60_20_low20_6 + f_295_low60_20_low20_6,
    r_315_322 * (const 64 2) = r_315_321 + u_315_321,
    s_315_322 * (const 64 2) = s_315_321 + v_315_321
;

assume
    f_295_low60_20_low20_7 = f_295_low60_20_low20_6,
    u_315_322 = u_315_321,
    v_315_322 = v_315_321,
    g_295_low60_20_low20_7 * 2 = g_295_low60_20_low20_6 + f_295_low60_20_low20_6,
    r_315_322 * 2 = r_315_321 + u_315_321,
    s_315_322 * 2 = s_315_321 + v_315_321
&&
    true
;

{
    u_315_322 * f_295_low60_20_low20_0 + v_315_322 * g_295_low60_20_low20_0 = f_295_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_322 * f_295_low60_20_low20_0 + s_315_322 * g_295_low60_20_low20_0 = g_295_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_7 + u_315_322 * (const 64 (2**21)) + v_315_322 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_7 + r_315_322 * (const 64 (2**21)) + s_315_322 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_7,
    f_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_7,
    g_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 322)) <=s delta, delta <=s (const 64 (1 + 2*322)),
    (const 64 (-(2**20))) <=s u_315_322, u_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_322, v_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_322, r_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_322, s_315_322 <=s (const 64 ((2**20))),
    u_315_322 + v_315_322 <=s (const 64 (2**20)),
    u_315_322 - v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 + v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 - v_315_322 <=s (const 64 (2**20)),
    r_315_322 + s_315_322 <=s (const 64 (2**20)),
    r_315_322 - s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 + s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 - s_315_322 <=s (const 64 (2**20)),
    u_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_315_322 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_321_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_6,
sint64 g_295_low60_20_low20_6,
sint64 f_295_low60_20_low20_7,
sint64 g_295_low60_20_low20_7,
sint64 u_315_321,
sint64 v_315_321,
sint64 r_315_321,
sint64 s_315_321,
sint64 u_315_322,
sint64 v_315_322,
sint64 r_315_322,
sint64 s_315_322,
bit ne
)={
    u_315_321 * f_295_low60_20_low20_0 + v_315_321 * g_295_low60_20_low20_0 = f_295_low60_20_low20_6 * (-(2**20)),
    r_315_321 * f_295_low60_20_low20_0 + s_315_321 * g_295_low60_20_low20_0 = g_295_low60_20_low20_6 * (-(2**20))
&&
    u_315_321 * f_295_low60_20_low20_0 + v_315_321 * g_295_low60_20_low20_0 = f_295_low60_20_low20_6 * (const 64 (-(2**20))),
    r_315_321 * f_295_low60_20_low20_0 + s_315_321 * g_295_low60_20_low20_0 = g_295_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_6 + u_315_321 * (const 64 (2**21)) + v_315_321 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_6 + r_315_321 * (const 64 (2**21)) + s_315_321 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_6,
    f_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_6,
    g_295_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 321)) <=s delta, delta <=s (const 64 (1 + 2*321)),
    (const 64 (-(2**20))) <=s u_315_321, u_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_321, v_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_321, r_315_321 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_321, s_315_321 <=s (const 64 ((2**20))),
    u_315_321 + v_315_321 <=s (const 64 (2**20)),
    u_315_321 - v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 + v_315_321 <=s (const 64 (2**20)),
    (const 64 0) - u_315_321 - v_315_321 <=s (const 64 (2**20)),
    r_315_321 + s_315_321 <=s (const 64 (2**20)),
    r_315_321 - s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 + s_315_321 <=s (const 64 (2**20)),
    (const 64 0) - r_315_321 - s_315_321 <=s (const 64 (2**20)),
    u_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_315_321 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_315_321 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise c
assume
g_295_low60_20_low20_6 = 1 (mod 2)
&&
g_295_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_7 g_295_low60_20_low20_6;
mov u_315_322 r_315_321;
mov v_315_322 s_315_321;

subs dc g_295_low60_20_low20_7 g_295_low60_20_low20_6 f_295_low60_20_low20_6;
asr g_295_low60_20_low20_7 g_295_low60_20_low20_7 1;
subs dc r_315_322 r_315_321 u_315_321;
asr r_315_322 r_315_322 1;
subs dc s_315_322 s_315_321 v_315_321;
asr s_315_322 s_315_322 1;
assert
    true
&&
    f_295_low60_20_low20_7 = g_295_low60_20_low20_6,
    u_315_322 = r_315_321,
    v_315_322 = s_315_321,
    g_295_low60_20_low20_7 * (const 64 2) = g_295_low60_20_low20_6 - f_295_low60_20_low20_6,
    r_315_322 * (const 64 2) = r_315_321 - u_315_321,
    s_315_322 * (const 64 2) = s_315_321 - v_315_321
;

assume
    f_295_low60_20_low20_7 = g_295_low60_20_low20_6,
    u_315_322 = r_315_321,
    v_315_322 = s_315_321,
    g_295_low60_20_low20_7 * 2 = g_295_low60_20_low20_6 - f_295_low60_20_low20_6,
    r_315_322 * 2 = r_315_321 - u_315_321,
    s_315_322 * 2 = s_315_321 - v_315_321
&&
    true
;

{
    u_315_322 * f_295_low60_20_low20_0 + v_315_322 * g_295_low60_20_low20_0 = f_295_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_322 * f_295_low60_20_low20_0 + s_315_322 * g_295_low60_20_low20_0 = g_295_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_7 + u_315_322 * (const 64 (2**21)) + v_315_322 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_7 + r_315_322 * (const 64 (2**21)) + s_315_322 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_7,
    f_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_7,
    g_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 322)) <=s delta, delta <=s (const 64 (1 + 2*322)),
    (const 64 (-(2**20))) <=s u_315_322, u_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_322, v_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_322, r_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_322, s_315_322 <=s (const 64 ((2**20))),
    u_315_322 + v_315_322 <=s (const 64 (2**20)),
    u_315_322 - v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 + v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 - v_315_322 <=s (const 64 (2**20)),
    r_315_322 + s_315_322 <=s (const 64 (2**20)),
    r_315_322 - s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 + s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 - s_315_322 <=s (const 64 (2**20)),
    u_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_315_322 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_322_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_7,
sint64 g_295_low60_20_low20_7,
sint64 f_295_low60_20_low20_8,
sint64 g_295_low60_20_low20_8,
sint64 u_315_322,
sint64 v_315_322,
sint64 r_315_322,
sint64 s_315_322,
sint64 u_315_323,
sint64 v_315_323,
sint64 r_315_323,
sint64 s_315_323,
bit ne
)={
    u_315_322 * f_295_low60_20_low20_0 + v_315_322 * g_295_low60_20_low20_0 = f_295_low60_20_low20_7 * (-(2**20)),
    r_315_322 * f_295_low60_20_low20_0 + s_315_322 * g_295_low60_20_low20_0 = g_295_low60_20_low20_7 * (-(2**20))
&&
    u_315_322 * f_295_low60_20_low20_0 + v_315_322 * g_295_low60_20_low20_0 = f_295_low60_20_low20_7 * (const 64 (-(2**20))),
    r_315_322 * f_295_low60_20_low20_0 + s_315_322 * g_295_low60_20_low20_0 = g_295_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_7 + u_315_322 * (const 64 (2**21)) + v_315_322 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_7 + r_315_322 * (const 64 (2**21)) + s_315_322 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_7,
    f_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_7,
    g_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 322)) <=s delta, delta <=s (const 64 (1 + 2*322)),
    (const 64 (-(2**20))) <=s u_315_322, u_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_322, v_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_322, r_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_322, s_315_322 <=s (const 64 ((2**20))),
    u_315_322 + v_315_322 <=s (const 64 (2**20)),
    u_315_322 - v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 + v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 - v_315_322 <=s (const 64 (2**20)),
    r_315_322 + s_315_322 <=s (const 64 (2**20)),
    r_315_322 - s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 + s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 - s_315_322 <=s (const 64 (2**20)),
    u_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_315_322 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise a
assume
g_295_low60_20_low20_7 = 0 (mod 2)
&&
g_295_low60_20_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_8 f_295_low60_20_low20_7;
mov u_315_323 u_315_322;
mov v_315_323 v_315_322;

asr g_295_low60_20_low20_8 g_295_low60_20_low20_7 1;
asr r_315_323 r_315_322 1;
asr s_315_323 s_315_322 1;
assert
    true
&&
    f_295_low60_20_low20_8 = f_295_low60_20_low20_7,
    u_315_323 = u_315_322,
    v_315_323 = v_315_322,
    g_295_low60_20_low20_8 * (const 64 2) = g_295_low60_20_low20_7,
    r_315_323 * (const 64 2) = r_315_322,
    s_315_323 * (const 64 2) = s_315_322
;

assume
    f_295_low60_20_low20_8 = f_295_low60_20_low20_7,
    u_315_323 = u_315_322,
    v_315_323 = v_315_322,
    g_295_low60_20_low20_8 * 2 = g_295_low60_20_low20_7,
    r_315_323 * 2 = r_315_322,
    s_315_323 * 2 = s_315_322
&&
    true
;

{
    u_315_323 * f_295_low60_20_low20_0 + v_315_323 * g_295_low60_20_low20_0 = f_295_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_323 * f_295_low60_20_low20_0 + s_315_323 * g_295_low60_20_low20_0 = g_295_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_8 + u_315_323 * (const 64 (2**21)) + v_315_323 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_8 + r_315_323 * (const 64 (2**21)) + s_315_323 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_8,
    f_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_8,
    g_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 323)) <=s delta, delta <=s (const 64 (1 + 2*323)),
    (const 64 (-(2**20))) <=s u_315_323, u_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_323, v_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_323, r_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_323, s_315_323 <=s (const 64 ((2**20))),
    u_315_323 + v_315_323 <=s (const 64 (2**20)),
    u_315_323 - v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 + v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 - v_315_323 <=s (const 64 (2**20)),
    r_315_323 + s_315_323 <=s (const 64 (2**20)),
    r_315_323 - s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 + s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 - s_315_323 <=s (const 64 (2**20)),
    u_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_315_323 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_322_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_7,
sint64 g_295_low60_20_low20_7,
sint64 f_295_low60_20_low20_8,
sint64 g_295_low60_20_low20_8,
sint64 u_315_322,
sint64 v_315_322,
sint64 r_315_322,
sint64 s_315_322,
sint64 u_315_323,
sint64 v_315_323,
sint64 r_315_323,
sint64 s_315_323,
bit ne
)={
    u_315_322 * f_295_low60_20_low20_0 + v_315_322 * g_295_low60_20_low20_0 = f_295_low60_20_low20_7 * (-(2**20)),
    r_315_322 * f_295_low60_20_low20_0 + s_315_322 * g_295_low60_20_low20_0 = g_295_low60_20_low20_7 * (-(2**20))
&&
    u_315_322 * f_295_low60_20_low20_0 + v_315_322 * g_295_low60_20_low20_0 = f_295_low60_20_low20_7 * (const 64 (-(2**20))),
    r_315_322 * f_295_low60_20_low20_0 + s_315_322 * g_295_low60_20_low20_0 = g_295_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_7 + u_315_322 * (const 64 (2**21)) + v_315_322 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_7 + r_315_322 * (const 64 (2**21)) + s_315_322 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_7,
    f_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_7,
    g_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 322)) <=s delta, delta <=s (const 64 (1 + 2*322)),
    (const 64 (-(2**20))) <=s u_315_322, u_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_322, v_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_322, r_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_322, s_315_322 <=s (const 64 ((2**20))),
    u_315_322 + v_315_322 <=s (const 64 (2**20)),
    u_315_322 - v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 + v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 - v_315_322 <=s (const 64 (2**20)),
    r_315_322 + s_315_322 <=s (const 64 (2**20)),
    r_315_322 - s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 + s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 - s_315_322 <=s (const 64 (2**20)),
    u_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_315_322 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise b
assume
g_295_low60_20_low20_7 = 1 (mod 2)
&&
g_295_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_8 f_295_low60_20_low20_7;
mov u_315_323 u_315_322;
mov v_315_323 v_315_322;

add g_295_low60_20_low20_8 g_295_low60_20_low20_7 f_295_low60_20_low20_7;
asr g_295_low60_20_low20_8 g_295_low60_20_low20_8 1;
add r_315_323 r_315_322 u_315_322;
asr r_315_323 r_315_323 1;
add s_315_323 s_315_322 v_315_322;
asr s_315_323 s_315_323 1;
assert
    true
&&
    f_295_low60_20_low20_8 = f_295_low60_20_low20_7,
    u_315_323 = u_315_322,
    v_315_323 = v_315_322,
    g_295_low60_20_low20_8 * (const 64 2) = g_295_low60_20_low20_7 + f_295_low60_20_low20_7,
    r_315_323 * (const 64 2) = r_315_322 + u_315_322,
    s_315_323 * (const 64 2) = s_315_322 + v_315_322
;

assume
    f_295_low60_20_low20_8 = f_295_low60_20_low20_7,
    u_315_323 = u_315_322,
    v_315_323 = v_315_322,
    g_295_low60_20_low20_8 * 2 = g_295_low60_20_low20_7 + f_295_low60_20_low20_7,
    r_315_323 * 2 = r_315_322 + u_315_322,
    s_315_323 * 2 = s_315_322 + v_315_322
&&
    true
;

{
    u_315_323 * f_295_low60_20_low20_0 + v_315_323 * g_295_low60_20_low20_0 = f_295_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_323 * f_295_low60_20_low20_0 + s_315_323 * g_295_low60_20_low20_0 = g_295_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_8 + u_315_323 * (const 64 (2**21)) + v_315_323 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_8 + r_315_323 * (const 64 (2**21)) + s_315_323 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_8,
    f_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_8,
    g_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 323)) <=s delta, delta <=s (const 64 (1 + 2*323)),
    (const 64 (-(2**20))) <=s u_315_323, u_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_323, v_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_323, r_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_323, s_315_323 <=s (const 64 ((2**20))),
    u_315_323 + v_315_323 <=s (const 64 (2**20)),
    u_315_323 - v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 + v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 - v_315_323 <=s (const 64 (2**20)),
    r_315_323 + s_315_323 <=s (const 64 (2**20)),
    r_315_323 - s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 + s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 - s_315_323 <=s (const 64 (2**20)),
    u_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_315_323 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_322_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_7,
sint64 g_295_low60_20_low20_7,
sint64 f_295_low60_20_low20_8,
sint64 g_295_low60_20_low20_8,
sint64 u_315_322,
sint64 v_315_322,
sint64 r_315_322,
sint64 s_315_322,
sint64 u_315_323,
sint64 v_315_323,
sint64 r_315_323,
sint64 s_315_323,
bit ne
)={
    u_315_322 * f_295_low60_20_low20_0 + v_315_322 * g_295_low60_20_low20_0 = f_295_low60_20_low20_7 * (-(2**20)),
    r_315_322 * f_295_low60_20_low20_0 + s_315_322 * g_295_low60_20_low20_0 = g_295_low60_20_low20_7 * (-(2**20))
&&
    u_315_322 * f_295_low60_20_low20_0 + v_315_322 * g_295_low60_20_low20_0 = f_295_low60_20_low20_7 * (const 64 (-(2**20))),
    r_315_322 * f_295_low60_20_low20_0 + s_315_322 * g_295_low60_20_low20_0 = g_295_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_7 + u_315_322 * (const 64 (2**21)) + v_315_322 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_7 + r_315_322 * (const 64 (2**21)) + s_315_322 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_7,
    f_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_7,
    g_295_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 322)) <=s delta, delta <=s (const 64 (1 + 2*322)),
    (const 64 (-(2**20))) <=s u_315_322, u_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_322, v_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_322, r_315_322 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_322, s_315_322 <=s (const 64 ((2**20))),
    u_315_322 + v_315_322 <=s (const 64 (2**20)),
    u_315_322 - v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 + v_315_322 <=s (const 64 (2**20)),
    (const 64 0) - u_315_322 - v_315_322 <=s (const 64 (2**20)),
    r_315_322 + s_315_322 <=s (const 64 (2**20)),
    r_315_322 - s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 + s_315_322 <=s (const 64 (2**20)),
    (const 64 0) - r_315_322 - s_315_322 <=s (const 64 (2**20)),
    u_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_315_322 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_315_322 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise c
assume
g_295_low60_20_low20_7 = 1 (mod 2)
&&
g_295_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_8 g_295_low60_20_low20_7;
mov u_315_323 r_315_322;
mov v_315_323 s_315_322;

subs dc g_295_low60_20_low20_8 g_295_low60_20_low20_7 f_295_low60_20_low20_7;
asr g_295_low60_20_low20_8 g_295_low60_20_low20_8 1;
subs dc r_315_323 r_315_322 u_315_322;
asr r_315_323 r_315_323 1;
subs dc s_315_323 s_315_322 v_315_322;
asr s_315_323 s_315_323 1;
assert
    true
&&
    f_295_low60_20_low20_8 = g_295_low60_20_low20_7,
    u_315_323 = r_315_322,
    v_315_323 = s_315_322,
    g_295_low60_20_low20_8 * (const 64 2) = g_295_low60_20_low20_7 - f_295_low60_20_low20_7,
    r_315_323 * (const 64 2) = r_315_322 - u_315_322,
    s_315_323 * (const 64 2) = s_315_322 - v_315_322
;

assume
    f_295_low60_20_low20_8 = g_295_low60_20_low20_7,
    u_315_323 = r_315_322,
    v_315_323 = s_315_322,
    g_295_low60_20_low20_8 * 2 = g_295_low60_20_low20_7 - f_295_low60_20_low20_7,
    r_315_323 * 2 = r_315_322 - u_315_322,
    s_315_323 * 2 = s_315_322 - v_315_322
&&
    true
;

{
    u_315_323 * f_295_low60_20_low20_0 + v_315_323 * g_295_low60_20_low20_0 = f_295_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_323 * f_295_low60_20_low20_0 + s_315_323 * g_295_low60_20_low20_0 = g_295_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_8 + u_315_323 * (const 64 (2**21)) + v_315_323 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_8 + r_315_323 * (const 64 (2**21)) + s_315_323 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_8,
    f_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_8,
    g_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 323)) <=s delta, delta <=s (const 64 (1 + 2*323)),
    (const 64 (-(2**20))) <=s u_315_323, u_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_323, v_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_323, r_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_323, s_315_323 <=s (const 64 ((2**20))),
    u_315_323 + v_315_323 <=s (const 64 (2**20)),
    u_315_323 - v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 + v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 - v_315_323 <=s (const 64 (2**20)),
    r_315_323 + s_315_323 <=s (const 64 (2**20)),
    r_315_323 - s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 + s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 - s_315_323 <=s (const 64 (2**20)),
    u_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_315_323 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_323_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_8,
sint64 g_295_low60_20_low20_8,
sint64 f_295_low60_20_low20_9,
sint64 g_295_low60_20_low20_9,
sint64 u_315_323,
sint64 v_315_323,
sint64 r_315_323,
sint64 s_315_323,
sint64 u_315_324,
sint64 v_315_324,
sint64 r_315_324,
sint64 s_315_324,
bit ne
)={
    u_315_323 * f_295_low60_20_low20_0 + v_315_323 * g_295_low60_20_low20_0 = f_295_low60_20_low20_8 * (-(2**20)),
    r_315_323 * f_295_low60_20_low20_0 + s_315_323 * g_295_low60_20_low20_0 = g_295_low60_20_low20_8 * (-(2**20))
&&
    u_315_323 * f_295_low60_20_low20_0 + v_315_323 * g_295_low60_20_low20_0 = f_295_low60_20_low20_8 * (const 64 (-(2**20))),
    r_315_323 * f_295_low60_20_low20_0 + s_315_323 * g_295_low60_20_low20_0 = g_295_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_8 + u_315_323 * (const 64 (2**21)) + v_315_323 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_8 + r_315_323 * (const 64 (2**21)) + s_315_323 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_8,
    f_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_8,
    g_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 323)) <=s delta, delta <=s (const 64 (1 + 2*323)),
    (const 64 (-(2**20))) <=s u_315_323, u_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_323, v_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_323, r_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_323, s_315_323 <=s (const 64 ((2**20))),
    u_315_323 + v_315_323 <=s (const 64 (2**20)),
    u_315_323 - v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 + v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 - v_315_323 <=s (const 64 (2**20)),
    r_315_323 + s_315_323 <=s (const 64 (2**20)),
    r_315_323 - s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 + s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 - s_315_323 <=s (const 64 (2**20)),
    u_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_315_323 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise a
assume
g_295_low60_20_low20_8 = 0 (mod 2)
&&
g_295_low60_20_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_9 f_295_low60_20_low20_8;
mov u_315_324 u_315_323;
mov v_315_324 v_315_323;

asr g_295_low60_20_low20_9 g_295_low60_20_low20_8 1;
asr r_315_324 r_315_323 1;
asr s_315_324 s_315_323 1;
assert
    true
&&
    f_295_low60_20_low20_9 = f_295_low60_20_low20_8,
    u_315_324 = u_315_323,
    v_315_324 = v_315_323,
    g_295_low60_20_low20_9 * (const 64 2) = g_295_low60_20_low20_8,
    r_315_324 * (const 64 2) = r_315_323,
    s_315_324 * (const 64 2) = s_315_323
;

assume
    f_295_low60_20_low20_9 = f_295_low60_20_low20_8,
    u_315_324 = u_315_323,
    v_315_324 = v_315_323,
    g_295_low60_20_low20_9 * 2 = g_295_low60_20_low20_8,
    r_315_324 * 2 = r_315_323,
    s_315_324 * 2 = s_315_323
&&
    true
;

{
    u_315_324 * f_295_low60_20_low20_0 + v_315_324 * g_295_low60_20_low20_0 = f_295_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_324 * f_295_low60_20_low20_0 + s_315_324 * g_295_low60_20_low20_0 = g_295_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_9 + u_315_324 * (const 64 (2**21)) + v_315_324 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_9 + r_315_324 * (const 64 (2**21)) + s_315_324 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_9,
    f_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_9,
    g_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 324)) <=s delta, delta <=s (const 64 (1 + 2*324)),
    (const 64 (-(2**20))) <=s u_315_324, u_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_324, v_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_324, r_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_324, s_315_324 <=s (const 64 ((2**20))),
    u_315_324 + v_315_324 <=s (const 64 (2**20)),
    u_315_324 - v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 + v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 - v_315_324 <=s (const 64 (2**20)),
    r_315_324 + s_315_324 <=s (const 64 (2**20)),
    r_315_324 - s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 + s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 - s_315_324 <=s (const 64 (2**20)),
    u_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_315_324 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_323_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_8,
sint64 g_295_low60_20_low20_8,
sint64 f_295_low60_20_low20_9,
sint64 g_295_low60_20_low20_9,
sint64 u_315_323,
sint64 v_315_323,
sint64 r_315_323,
sint64 s_315_323,
sint64 u_315_324,
sint64 v_315_324,
sint64 r_315_324,
sint64 s_315_324,
bit ne
)={
    u_315_323 * f_295_low60_20_low20_0 + v_315_323 * g_295_low60_20_low20_0 = f_295_low60_20_low20_8 * (-(2**20)),
    r_315_323 * f_295_low60_20_low20_0 + s_315_323 * g_295_low60_20_low20_0 = g_295_low60_20_low20_8 * (-(2**20))
&&
    u_315_323 * f_295_low60_20_low20_0 + v_315_323 * g_295_low60_20_low20_0 = f_295_low60_20_low20_8 * (const 64 (-(2**20))),
    r_315_323 * f_295_low60_20_low20_0 + s_315_323 * g_295_low60_20_low20_0 = g_295_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_8 + u_315_323 * (const 64 (2**21)) + v_315_323 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_8 + r_315_323 * (const 64 (2**21)) + s_315_323 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_8,
    f_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_8,
    g_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 323)) <=s delta, delta <=s (const 64 (1 + 2*323)),
    (const 64 (-(2**20))) <=s u_315_323, u_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_323, v_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_323, r_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_323, s_315_323 <=s (const 64 ((2**20))),
    u_315_323 + v_315_323 <=s (const 64 (2**20)),
    u_315_323 - v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 + v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 - v_315_323 <=s (const 64 (2**20)),
    r_315_323 + s_315_323 <=s (const 64 (2**20)),
    r_315_323 - s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 + s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 - s_315_323 <=s (const 64 (2**20)),
    u_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_315_323 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise b
assume
g_295_low60_20_low20_8 = 1 (mod 2)
&&
g_295_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_9 f_295_low60_20_low20_8;
mov u_315_324 u_315_323;
mov v_315_324 v_315_323;

add g_295_low60_20_low20_9 g_295_low60_20_low20_8 f_295_low60_20_low20_8;
asr g_295_low60_20_low20_9 g_295_low60_20_low20_9 1;
add r_315_324 r_315_323 u_315_323;
asr r_315_324 r_315_324 1;
add s_315_324 s_315_323 v_315_323;
asr s_315_324 s_315_324 1;
assert
    true
&&
    f_295_low60_20_low20_9 = f_295_low60_20_low20_8,
    u_315_324 = u_315_323,
    v_315_324 = v_315_323,
    g_295_low60_20_low20_9 * (const 64 2) = g_295_low60_20_low20_8 + f_295_low60_20_low20_8,
    r_315_324 * (const 64 2) = r_315_323 + u_315_323,
    s_315_324 * (const 64 2) = s_315_323 + v_315_323
;

assume
    f_295_low60_20_low20_9 = f_295_low60_20_low20_8,
    u_315_324 = u_315_323,
    v_315_324 = v_315_323,
    g_295_low60_20_low20_9 * 2 = g_295_low60_20_low20_8 + f_295_low60_20_low20_8,
    r_315_324 * 2 = r_315_323 + u_315_323,
    s_315_324 * 2 = s_315_323 + v_315_323
&&
    true
;

{
    u_315_324 * f_295_low60_20_low20_0 + v_315_324 * g_295_low60_20_low20_0 = f_295_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_324 * f_295_low60_20_low20_0 + s_315_324 * g_295_low60_20_low20_0 = g_295_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_9 + u_315_324 * (const 64 (2**21)) + v_315_324 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_9 + r_315_324 * (const 64 (2**21)) + s_315_324 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_9,
    f_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_9,
    g_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 324)) <=s delta, delta <=s (const 64 (1 + 2*324)),
    (const 64 (-(2**20))) <=s u_315_324, u_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_324, v_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_324, r_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_324, s_315_324 <=s (const 64 ((2**20))),
    u_315_324 + v_315_324 <=s (const 64 (2**20)),
    u_315_324 - v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 + v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 - v_315_324 <=s (const 64 (2**20)),
    r_315_324 + s_315_324 <=s (const 64 (2**20)),
    r_315_324 - s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 + s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 - s_315_324 <=s (const 64 (2**20)),
    u_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_315_324 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_323_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_8,
sint64 g_295_low60_20_low20_8,
sint64 f_295_low60_20_low20_9,
sint64 g_295_low60_20_low20_9,
sint64 u_315_323,
sint64 v_315_323,
sint64 r_315_323,
sint64 s_315_323,
sint64 u_315_324,
sint64 v_315_324,
sint64 r_315_324,
sint64 s_315_324,
bit ne
)={
    u_315_323 * f_295_low60_20_low20_0 + v_315_323 * g_295_low60_20_low20_0 = f_295_low60_20_low20_8 * (-(2**20)),
    r_315_323 * f_295_low60_20_low20_0 + s_315_323 * g_295_low60_20_low20_0 = g_295_low60_20_low20_8 * (-(2**20))
&&
    u_315_323 * f_295_low60_20_low20_0 + v_315_323 * g_295_low60_20_low20_0 = f_295_low60_20_low20_8 * (const 64 (-(2**20))),
    r_315_323 * f_295_low60_20_low20_0 + s_315_323 * g_295_low60_20_low20_0 = g_295_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_8 + u_315_323 * (const 64 (2**21)) + v_315_323 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_8 + r_315_323 * (const 64 (2**21)) + s_315_323 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_8,
    f_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_8,
    g_295_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 323)) <=s delta, delta <=s (const 64 (1 + 2*323)),
    (const 64 (-(2**20))) <=s u_315_323, u_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_323, v_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_323, r_315_323 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_323, s_315_323 <=s (const 64 ((2**20))),
    u_315_323 + v_315_323 <=s (const 64 (2**20)),
    u_315_323 - v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 + v_315_323 <=s (const 64 (2**20)),
    (const 64 0) - u_315_323 - v_315_323 <=s (const 64 (2**20)),
    r_315_323 + s_315_323 <=s (const 64 (2**20)),
    r_315_323 - s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 + s_315_323 <=s (const 64 (2**20)),
    (const 64 0) - r_315_323 - s_315_323 <=s (const 64 (2**20)),
    u_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_315_323 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_315_323 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise c
assume
g_295_low60_20_low20_8 = 1 (mod 2)
&&
g_295_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_9 g_295_low60_20_low20_8;
mov u_315_324 r_315_323;
mov v_315_324 s_315_323;

subs dc g_295_low60_20_low20_9 g_295_low60_20_low20_8 f_295_low60_20_low20_8;
asr g_295_low60_20_low20_9 g_295_low60_20_low20_9 1;
subs dc r_315_324 r_315_323 u_315_323;
asr r_315_324 r_315_324 1;
subs dc s_315_324 s_315_323 v_315_323;
asr s_315_324 s_315_324 1;
assert
    true
&&
    f_295_low60_20_low20_9 = g_295_low60_20_low20_8,
    u_315_324 = r_315_323,
    v_315_324 = s_315_323,
    g_295_low60_20_low20_9 * (const 64 2) = g_295_low60_20_low20_8 - f_295_low60_20_low20_8,
    r_315_324 * (const 64 2) = r_315_323 - u_315_323,
    s_315_324 * (const 64 2) = s_315_323 - v_315_323
;

assume
    f_295_low60_20_low20_9 = g_295_low60_20_low20_8,
    u_315_324 = r_315_323,
    v_315_324 = s_315_323,
    g_295_low60_20_low20_9 * 2 = g_295_low60_20_low20_8 - f_295_low60_20_low20_8,
    r_315_324 * 2 = r_315_323 - u_315_323,
    s_315_324 * 2 = s_315_323 - v_315_323
&&
    true
;

{
    u_315_324 * f_295_low60_20_low20_0 + v_315_324 * g_295_low60_20_low20_0 = f_295_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_324 * f_295_low60_20_low20_0 + s_315_324 * g_295_low60_20_low20_0 = g_295_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_9 + u_315_324 * (const 64 (2**21)) + v_315_324 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_9 + r_315_324 * (const 64 (2**21)) + s_315_324 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_9,
    f_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_9,
    g_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 324)) <=s delta, delta <=s (const 64 (1 + 2*324)),
    (const 64 (-(2**20))) <=s u_315_324, u_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_324, v_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_324, r_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_324, s_315_324 <=s (const 64 ((2**20))),
    u_315_324 + v_315_324 <=s (const 64 (2**20)),
    u_315_324 - v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 + v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 - v_315_324 <=s (const 64 (2**20)),
    r_315_324 + s_315_324 <=s (const 64 (2**20)),
    r_315_324 - s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 + s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 - s_315_324 <=s (const 64 (2**20)),
    u_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_315_324 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_324_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_9,
sint64 g_295_low60_20_low20_9,
sint64 f_295_low60_20_low20_10,
sint64 g_295_low60_20_low20_10,
sint64 u_315_324,
sint64 v_315_324,
sint64 r_315_324,
sint64 s_315_324,
sint64 u_315_325,
sint64 v_315_325,
sint64 r_315_325,
sint64 s_315_325,
bit ne
)={
    u_315_324 * f_295_low60_20_low20_0 + v_315_324 * g_295_low60_20_low20_0 = f_295_low60_20_low20_9 * (-(2**20)),
    r_315_324 * f_295_low60_20_low20_0 + s_315_324 * g_295_low60_20_low20_0 = g_295_low60_20_low20_9 * (-(2**20))
&&
    u_315_324 * f_295_low60_20_low20_0 + v_315_324 * g_295_low60_20_low20_0 = f_295_low60_20_low20_9 * (const 64 (-(2**20))),
    r_315_324 * f_295_low60_20_low20_0 + s_315_324 * g_295_low60_20_low20_0 = g_295_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_9 + u_315_324 * (const 64 (2**21)) + v_315_324 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_9 + r_315_324 * (const 64 (2**21)) + s_315_324 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_9,
    f_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_9,
    g_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 324)) <=s delta, delta <=s (const 64 (1 + 2*324)),
    (const 64 (-(2**20))) <=s u_315_324, u_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_324, v_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_324, r_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_324, s_315_324 <=s (const 64 ((2**20))),
    u_315_324 + v_315_324 <=s (const 64 (2**20)),
    u_315_324 - v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 + v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 - v_315_324 <=s (const 64 (2**20)),
    r_315_324 + s_315_324 <=s (const 64 (2**20)),
    r_315_324 - s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 + s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 - s_315_324 <=s (const 64 (2**20)),
    u_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_315_324 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise a
assume
g_295_low60_20_low20_9 = 0 (mod 2)
&&
g_295_low60_20_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_10 f_295_low60_20_low20_9;
mov u_315_325 u_315_324;
mov v_315_325 v_315_324;

asr g_295_low60_20_low20_10 g_295_low60_20_low20_9 1;
asr r_315_325 r_315_324 1;
asr s_315_325 s_315_324 1;
assert
    true
&&
    f_295_low60_20_low20_10 = f_295_low60_20_low20_9,
    u_315_325 = u_315_324,
    v_315_325 = v_315_324,
    g_295_low60_20_low20_10 * (const 64 2) = g_295_low60_20_low20_9,
    r_315_325 * (const 64 2) = r_315_324,
    s_315_325 * (const 64 2) = s_315_324
;

assume
    f_295_low60_20_low20_10 = f_295_low60_20_low20_9,
    u_315_325 = u_315_324,
    v_315_325 = v_315_324,
    g_295_low60_20_low20_10 * 2 = g_295_low60_20_low20_9,
    r_315_325 * 2 = r_315_324,
    s_315_325 * 2 = s_315_324
&&
    true
;

{
    u_315_325 * f_295_low60_20_low20_0 + v_315_325 * g_295_low60_20_low20_0 = f_295_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_325 * f_295_low60_20_low20_0 + s_315_325 * g_295_low60_20_low20_0 = g_295_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_10 + u_315_325 * (const 64 (2**21)) + v_315_325 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_10 + r_315_325 * (const 64 (2**21)) + s_315_325 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_10,
    f_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_10,
    g_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 325)) <=s delta, delta <=s (const 64 (1 + 2*325)),
    (const 64 (-(2**20))) <=s u_315_325, u_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_325, v_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_325, r_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_325, s_315_325 <=s (const 64 ((2**20))),
    u_315_325 + v_315_325 <=s (const 64 (2**20)),
    u_315_325 - v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 + v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 - v_315_325 <=s (const 64 (2**20)),
    r_315_325 + s_315_325 <=s (const 64 (2**20)),
    r_315_325 - s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 + s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 - s_315_325 <=s (const 64 (2**20)),
    u_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_315_325 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_324_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_9,
sint64 g_295_low60_20_low20_9,
sint64 f_295_low60_20_low20_10,
sint64 g_295_low60_20_low20_10,
sint64 u_315_324,
sint64 v_315_324,
sint64 r_315_324,
sint64 s_315_324,
sint64 u_315_325,
sint64 v_315_325,
sint64 r_315_325,
sint64 s_315_325,
bit ne
)={
    u_315_324 * f_295_low60_20_low20_0 + v_315_324 * g_295_low60_20_low20_0 = f_295_low60_20_low20_9 * (-(2**20)),
    r_315_324 * f_295_low60_20_low20_0 + s_315_324 * g_295_low60_20_low20_0 = g_295_low60_20_low20_9 * (-(2**20))
&&
    u_315_324 * f_295_low60_20_low20_0 + v_315_324 * g_295_low60_20_low20_0 = f_295_low60_20_low20_9 * (const 64 (-(2**20))),
    r_315_324 * f_295_low60_20_low20_0 + s_315_324 * g_295_low60_20_low20_0 = g_295_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_9 + u_315_324 * (const 64 (2**21)) + v_315_324 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_9 + r_315_324 * (const 64 (2**21)) + s_315_324 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_9,
    f_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_9,
    g_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 324)) <=s delta, delta <=s (const 64 (1 + 2*324)),
    (const 64 (-(2**20))) <=s u_315_324, u_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_324, v_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_324, r_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_324, s_315_324 <=s (const 64 ((2**20))),
    u_315_324 + v_315_324 <=s (const 64 (2**20)),
    u_315_324 - v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 + v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 - v_315_324 <=s (const 64 (2**20)),
    r_315_324 + s_315_324 <=s (const 64 (2**20)),
    r_315_324 - s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 + s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 - s_315_324 <=s (const 64 (2**20)),
    u_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_315_324 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise b
assume
g_295_low60_20_low20_9 = 1 (mod 2)
&&
g_295_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_10 f_295_low60_20_low20_9;
mov u_315_325 u_315_324;
mov v_315_325 v_315_324;

add g_295_low60_20_low20_10 g_295_low60_20_low20_9 f_295_low60_20_low20_9;
asr g_295_low60_20_low20_10 g_295_low60_20_low20_10 1;
add r_315_325 r_315_324 u_315_324;
asr r_315_325 r_315_325 1;
add s_315_325 s_315_324 v_315_324;
asr s_315_325 s_315_325 1;
assert
    true
&&
    f_295_low60_20_low20_10 = f_295_low60_20_low20_9,
    u_315_325 = u_315_324,
    v_315_325 = v_315_324,
    g_295_low60_20_low20_10 * (const 64 2) = g_295_low60_20_low20_9 + f_295_low60_20_low20_9,
    r_315_325 * (const 64 2) = r_315_324 + u_315_324,
    s_315_325 * (const 64 2) = s_315_324 + v_315_324
;

assume
    f_295_low60_20_low20_10 = f_295_low60_20_low20_9,
    u_315_325 = u_315_324,
    v_315_325 = v_315_324,
    g_295_low60_20_low20_10 * 2 = g_295_low60_20_low20_9 + f_295_low60_20_low20_9,
    r_315_325 * 2 = r_315_324 + u_315_324,
    s_315_325 * 2 = s_315_324 + v_315_324
&&
    true
;

{
    u_315_325 * f_295_low60_20_low20_0 + v_315_325 * g_295_low60_20_low20_0 = f_295_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_325 * f_295_low60_20_low20_0 + s_315_325 * g_295_low60_20_low20_0 = g_295_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_10 + u_315_325 * (const 64 (2**21)) + v_315_325 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_10 + r_315_325 * (const 64 (2**21)) + s_315_325 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_10,
    f_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_10,
    g_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 325)) <=s delta, delta <=s (const 64 (1 + 2*325)),
    (const 64 (-(2**20))) <=s u_315_325, u_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_325, v_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_325, r_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_325, s_315_325 <=s (const 64 ((2**20))),
    u_315_325 + v_315_325 <=s (const 64 (2**20)),
    u_315_325 - v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 + v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 - v_315_325 <=s (const 64 (2**20)),
    r_315_325 + s_315_325 <=s (const 64 (2**20)),
    r_315_325 - s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 + s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 - s_315_325 <=s (const 64 (2**20)),
    u_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_315_325 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_324_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_9,
sint64 g_295_low60_20_low20_9,
sint64 f_295_low60_20_low20_10,
sint64 g_295_low60_20_low20_10,
sint64 u_315_324,
sint64 v_315_324,
sint64 r_315_324,
sint64 s_315_324,
sint64 u_315_325,
sint64 v_315_325,
sint64 r_315_325,
sint64 s_315_325,
bit ne
)={
    u_315_324 * f_295_low60_20_low20_0 + v_315_324 * g_295_low60_20_low20_0 = f_295_low60_20_low20_9 * (-(2**20)),
    r_315_324 * f_295_low60_20_low20_0 + s_315_324 * g_295_low60_20_low20_0 = g_295_low60_20_low20_9 * (-(2**20))
&&
    u_315_324 * f_295_low60_20_low20_0 + v_315_324 * g_295_low60_20_low20_0 = f_295_low60_20_low20_9 * (const 64 (-(2**20))),
    r_315_324 * f_295_low60_20_low20_0 + s_315_324 * g_295_low60_20_low20_0 = g_295_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_9 + u_315_324 * (const 64 (2**21)) + v_315_324 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_9 + r_315_324 * (const 64 (2**21)) + s_315_324 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_9,
    f_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_9,
    g_295_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 324)) <=s delta, delta <=s (const 64 (1 + 2*324)),
    (const 64 (-(2**20))) <=s u_315_324, u_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_324, v_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_324, r_315_324 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_324, s_315_324 <=s (const 64 ((2**20))),
    u_315_324 + v_315_324 <=s (const 64 (2**20)),
    u_315_324 - v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 + v_315_324 <=s (const 64 (2**20)),
    (const 64 0) - u_315_324 - v_315_324 <=s (const 64 (2**20)),
    r_315_324 + s_315_324 <=s (const 64 (2**20)),
    r_315_324 - s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 + s_315_324 <=s (const 64 (2**20)),
    (const 64 0) - r_315_324 - s_315_324 <=s (const 64 (2**20)),
    u_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_315_324 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_315_324 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise c
assume
g_295_low60_20_low20_9 = 1 (mod 2)
&&
g_295_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_10 g_295_low60_20_low20_9;
mov u_315_325 r_315_324;
mov v_315_325 s_315_324;

subs dc g_295_low60_20_low20_10 g_295_low60_20_low20_9 f_295_low60_20_low20_9;
asr g_295_low60_20_low20_10 g_295_low60_20_low20_10 1;
subs dc r_315_325 r_315_324 u_315_324;
asr r_315_325 r_315_325 1;
subs dc s_315_325 s_315_324 v_315_324;
asr s_315_325 s_315_325 1;
assert
    true
&&
    f_295_low60_20_low20_10 = g_295_low60_20_low20_9,
    u_315_325 = r_315_324,
    v_315_325 = s_315_324,
    g_295_low60_20_low20_10 * (const 64 2) = g_295_low60_20_low20_9 - f_295_low60_20_low20_9,
    r_315_325 * (const 64 2) = r_315_324 - u_315_324,
    s_315_325 * (const 64 2) = s_315_324 - v_315_324
;

assume
    f_295_low60_20_low20_10 = g_295_low60_20_low20_9,
    u_315_325 = r_315_324,
    v_315_325 = s_315_324,
    g_295_low60_20_low20_10 * 2 = g_295_low60_20_low20_9 - f_295_low60_20_low20_9,
    r_315_325 * 2 = r_315_324 - u_315_324,
    s_315_325 * 2 = s_315_324 - v_315_324
&&
    true
;

{
    u_315_325 * f_295_low60_20_low20_0 + v_315_325 * g_295_low60_20_low20_0 = f_295_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_325 * f_295_low60_20_low20_0 + s_315_325 * g_295_low60_20_low20_0 = g_295_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_10 + u_315_325 * (const 64 (2**21)) + v_315_325 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_10 + r_315_325 * (const 64 (2**21)) + s_315_325 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_10,
    f_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_10,
    g_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 325)) <=s delta, delta <=s (const 64 (1 + 2*325)),
    (const 64 (-(2**20))) <=s u_315_325, u_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_325, v_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_325, r_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_325, s_315_325 <=s (const 64 ((2**20))),
    u_315_325 + v_315_325 <=s (const 64 (2**20)),
    u_315_325 - v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 + v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 - v_315_325 <=s (const 64 (2**20)),
    r_315_325 + s_315_325 <=s (const 64 (2**20)),
    r_315_325 - s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 + s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 - s_315_325 <=s (const 64 (2**20)),
    u_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_315_325 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_325_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_10,
sint64 g_295_low60_20_low20_10,
sint64 f_295_low60_20_low20_11,
sint64 g_295_low60_20_low20_11,
sint64 u_315_325,
sint64 v_315_325,
sint64 r_315_325,
sint64 s_315_325,
sint64 u_315_326,
sint64 v_315_326,
sint64 r_315_326,
sint64 s_315_326,
bit ne
)={
    u_315_325 * f_295_low60_20_low20_0 + v_315_325 * g_295_low60_20_low20_0 = f_295_low60_20_low20_10 * (-(2**20)),
    r_315_325 * f_295_low60_20_low20_0 + s_315_325 * g_295_low60_20_low20_0 = g_295_low60_20_low20_10 * (-(2**20))
&&
    u_315_325 * f_295_low60_20_low20_0 + v_315_325 * g_295_low60_20_low20_0 = f_295_low60_20_low20_10 * (const 64 (-(2**20))),
    r_315_325 * f_295_low60_20_low20_0 + s_315_325 * g_295_low60_20_low20_0 = g_295_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_10 + u_315_325 * (const 64 (2**21)) + v_315_325 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_10 + r_315_325 * (const 64 (2**21)) + s_315_325 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_10,
    f_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_10,
    g_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 325)) <=s delta, delta <=s (const 64 (1 + 2*325)),
    (const 64 (-(2**20))) <=s u_315_325, u_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_325, v_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_325, r_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_325, s_315_325 <=s (const 64 ((2**20))),
    u_315_325 + v_315_325 <=s (const 64 (2**20)),
    u_315_325 - v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 + v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 - v_315_325 <=s (const 64 (2**20)),
    r_315_325 + s_315_325 <=s (const 64 (2**20)),
    r_315_325 - s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 + s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 - s_315_325 <=s (const 64 (2**20)),
    u_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_315_325 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise a
assume
g_295_low60_20_low20_10 = 0 (mod 2)
&&
g_295_low60_20_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_11 f_295_low60_20_low20_10;
mov u_315_326 u_315_325;
mov v_315_326 v_315_325;

asr g_295_low60_20_low20_11 g_295_low60_20_low20_10 1;
asr r_315_326 r_315_325 1;
asr s_315_326 s_315_325 1;
assert
    true
&&
    f_295_low60_20_low20_11 = f_295_low60_20_low20_10,
    u_315_326 = u_315_325,
    v_315_326 = v_315_325,
    g_295_low60_20_low20_11 * (const 64 2) = g_295_low60_20_low20_10,
    r_315_326 * (const 64 2) = r_315_325,
    s_315_326 * (const 64 2) = s_315_325
;

assume
    f_295_low60_20_low20_11 = f_295_low60_20_low20_10,
    u_315_326 = u_315_325,
    v_315_326 = v_315_325,
    g_295_low60_20_low20_11 * 2 = g_295_low60_20_low20_10,
    r_315_326 * 2 = r_315_325,
    s_315_326 * 2 = s_315_325
&&
    true
;

{
    u_315_326 * f_295_low60_20_low20_0 + v_315_326 * g_295_low60_20_low20_0 = f_295_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_326 * f_295_low60_20_low20_0 + s_315_326 * g_295_low60_20_low20_0 = g_295_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_11 + u_315_326 * (const 64 (2**21)) + v_315_326 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_11 + r_315_326 * (const 64 (2**21)) + s_315_326 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_11,
    f_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_11,
    g_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 326)) <=s delta, delta <=s (const 64 (1 + 2*326)),
    (const 64 (-(2**20))) <=s u_315_326, u_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_326, v_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_326, r_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_326, s_315_326 <=s (const 64 ((2**20))),
    u_315_326 + v_315_326 <=s (const 64 (2**20)),
    u_315_326 - v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 + v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 - v_315_326 <=s (const 64 (2**20)),
    r_315_326 + s_315_326 <=s (const 64 (2**20)),
    r_315_326 - s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 + s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 - s_315_326 <=s (const 64 (2**20)),
    u_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_315_326 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_325_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_10,
sint64 g_295_low60_20_low20_10,
sint64 f_295_low60_20_low20_11,
sint64 g_295_low60_20_low20_11,
sint64 u_315_325,
sint64 v_315_325,
sint64 r_315_325,
sint64 s_315_325,
sint64 u_315_326,
sint64 v_315_326,
sint64 r_315_326,
sint64 s_315_326,
bit ne
)={
    u_315_325 * f_295_low60_20_low20_0 + v_315_325 * g_295_low60_20_low20_0 = f_295_low60_20_low20_10 * (-(2**20)),
    r_315_325 * f_295_low60_20_low20_0 + s_315_325 * g_295_low60_20_low20_0 = g_295_low60_20_low20_10 * (-(2**20))
&&
    u_315_325 * f_295_low60_20_low20_0 + v_315_325 * g_295_low60_20_low20_0 = f_295_low60_20_low20_10 * (const 64 (-(2**20))),
    r_315_325 * f_295_low60_20_low20_0 + s_315_325 * g_295_low60_20_low20_0 = g_295_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_10 + u_315_325 * (const 64 (2**21)) + v_315_325 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_10 + r_315_325 * (const 64 (2**21)) + s_315_325 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_10,
    f_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_10,
    g_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 325)) <=s delta, delta <=s (const 64 (1 + 2*325)),
    (const 64 (-(2**20))) <=s u_315_325, u_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_325, v_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_325, r_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_325, s_315_325 <=s (const 64 ((2**20))),
    u_315_325 + v_315_325 <=s (const 64 (2**20)),
    u_315_325 - v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 + v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 - v_315_325 <=s (const 64 (2**20)),
    r_315_325 + s_315_325 <=s (const 64 (2**20)),
    r_315_325 - s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 + s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 - s_315_325 <=s (const 64 (2**20)),
    u_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_315_325 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise b
assume
g_295_low60_20_low20_10 = 1 (mod 2)
&&
g_295_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_11 f_295_low60_20_low20_10;
mov u_315_326 u_315_325;
mov v_315_326 v_315_325;

add g_295_low60_20_low20_11 g_295_low60_20_low20_10 f_295_low60_20_low20_10;
asr g_295_low60_20_low20_11 g_295_low60_20_low20_11 1;
add r_315_326 r_315_325 u_315_325;
asr r_315_326 r_315_326 1;
add s_315_326 s_315_325 v_315_325;
asr s_315_326 s_315_326 1;
assert
    true
&&
    f_295_low60_20_low20_11 = f_295_low60_20_low20_10,
    u_315_326 = u_315_325,
    v_315_326 = v_315_325,
    g_295_low60_20_low20_11 * (const 64 2) = g_295_low60_20_low20_10 + f_295_low60_20_low20_10,
    r_315_326 * (const 64 2) = r_315_325 + u_315_325,
    s_315_326 * (const 64 2) = s_315_325 + v_315_325
;

assume
    f_295_low60_20_low20_11 = f_295_low60_20_low20_10,
    u_315_326 = u_315_325,
    v_315_326 = v_315_325,
    g_295_low60_20_low20_11 * 2 = g_295_low60_20_low20_10 + f_295_low60_20_low20_10,
    r_315_326 * 2 = r_315_325 + u_315_325,
    s_315_326 * 2 = s_315_325 + v_315_325
&&
    true
;

{
    u_315_326 * f_295_low60_20_low20_0 + v_315_326 * g_295_low60_20_low20_0 = f_295_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_326 * f_295_low60_20_low20_0 + s_315_326 * g_295_low60_20_low20_0 = g_295_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_11 + u_315_326 * (const 64 (2**21)) + v_315_326 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_11 + r_315_326 * (const 64 (2**21)) + s_315_326 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_11,
    f_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_11,
    g_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 326)) <=s delta, delta <=s (const 64 (1 + 2*326)),
    (const 64 (-(2**20))) <=s u_315_326, u_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_326, v_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_326, r_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_326, s_315_326 <=s (const 64 ((2**20))),
    u_315_326 + v_315_326 <=s (const 64 (2**20)),
    u_315_326 - v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 + v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 - v_315_326 <=s (const 64 (2**20)),
    r_315_326 + s_315_326 <=s (const 64 (2**20)),
    r_315_326 - s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 + s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 - s_315_326 <=s (const 64 (2**20)),
    u_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_315_326 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_325_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_10,
sint64 g_295_low60_20_low20_10,
sint64 f_295_low60_20_low20_11,
sint64 g_295_low60_20_low20_11,
sint64 u_315_325,
sint64 v_315_325,
sint64 r_315_325,
sint64 s_315_325,
sint64 u_315_326,
sint64 v_315_326,
sint64 r_315_326,
sint64 s_315_326,
bit ne
)={
    u_315_325 * f_295_low60_20_low20_0 + v_315_325 * g_295_low60_20_low20_0 = f_295_low60_20_low20_10 * (-(2**20)),
    r_315_325 * f_295_low60_20_low20_0 + s_315_325 * g_295_low60_20_low20_0 = g_295_low60_20_low20_10 * (-(2**20))
&&
    u_315_325 * f_295_low60_20_low20_0 + v_315_325 * g_295_low60_20_low20_0 = f_295_low60_20_low20_10 * (const 64 (-(2**20))),
    r_315_325 * f_295_low60_20_low20_0 + s_315_325 * g_295_low60_20_low20_0 = g_295_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_10 + u_315_325 * (const 64 (2**21)) + v_315_325 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_10 + r_315_325 * (const 64 (2**21)) + s_315_325 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_10,
    f_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_10,
    g_295_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 325)) <=s delta, delta <=s (const 64 (1 + 2*325)),
    (const 64 (-(2**20))) <=s u_315_325, u_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_325, v_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_325, r_315_325 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_325, s_315_325 <=s (const 64 ((2**20))),
    u_315_325 + v_315_325 <=s (const 64 (2**20)),
    u_315_325 - v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 + v_315_325 <=s (const 64 (2**20)),
    (const 64 0) - u_315_325 - v_315_325 <=s (const 64 (2**20)),
    r_315_325 + s_315_325 <=s (const 64 (2**20)),
    r_315_325 - s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 + s_315_325 <=s (const 64 (2**20)),
    (const 64 0) - r_315_325 - s_315_325 <=s (const 64 (2**20)),
    u_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_315_325 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_315_325 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise c
assume
g_295_low60_20_low20_10 = 1 (mod 2)
&&
g_295_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_11 g_295_low60_20_low20_10;
mov u_315_326 r_315_325;
mov v_315_326 s_315_325;

subs dc g_295_low60_20_low20_11 g_295_low60_20_low20_10 f_295_low60_20_low20_10;
asr g_295_low60_20_low20_11 g_295_low60_20_low20_11 1;
subs dc r_315_326 r_315_325 u_315_325;
asr r_315_326 r_315_326 1;
subs dc s_315_326 s_315_325 v_315_325;
asr s_315_326 s_315_326 1;
assert
    true
&&
    f_295_low60_20_low20_11 = g_295_low60_20_low20_10,
    u_315_326 = r_315_325,
    v_315_326 = s_315_325,
    g_295_low60_20_low20_11 * (const 64 2) = g_295_low60_20_low20_10 - f_295_low60_20_low20_10,
    r_315_326 * (const 64 2) = r_315_325 - u_315_325,
    s_315_326 * (const 64 2) = s_315_325 - v_315_325
;

assume
    f_295_low60_20_low20_11 = g_295_low60_20_low20_10,
    u_315_326 = r_315_325,
    v_315_326 = s_315_325,
    g_295_low60_20_low20_11 * 2 = g_295_low60_20_low20_10 - f_295_low60_20_low20_10,
    r_315_326 * 2 = r_315_325 - u_315_325,
    s_315_326 * 2 = s_315_325 - v_315_325
&&
    true
;

{
    u_315_326 * f_295_low60_20_low20_0 + v_315_326 * g_295_low60_20_low20_0 = f_295_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_326 * f_295_low60_20_low20_0 + s_315_326 * g_295_low60_20_low20_0 = g_295_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_11 + u_315_326 * (const 64 (2**21)) + v_315_326 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_11 + r_315_326 * (const 64 (2**21)) + s_315_326 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_11,
    f_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_11,
    g_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 326)) <=s delta, delta <=s (const 64 (1 + 2*326)),
    (const 64 (-(2**20))) <=s u_315_326, u_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_326, v_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_326, r_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_326, s_315_326 <=s (const 64 ((2**20))),
    u_315_326 + v_315_326 <=s (const 64 (2**20)),
    u_315_326 - v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 + v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 - v_315_326 <=s (const 64 (2**20)),
    r_315_326 + s_315_326 <=s (const 64 (2**20)),
    r_315_326 - s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 + s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 - s_315_326 <=s (const 64 (2**20)),
    u_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_315_326 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_326_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_11,
sint64 g_295_low60_20_low20_11,
sint64 f_295_low60_20_low20_12,
sint64 g_295_low60_20_low20_12,
sint64 u_315_326,
sint64 v_315_326,
sint64 r_315_326,
sint64 s_315_326,
sint64 u_315_327,
sint64 v_315_327,
sint64 r_315_327,
sint64 s_315_327,
bit ne
)={
    u_315_326 * f_295_low60_20_low20_0 + v_315_326 * g_295_low60_20_low20_0 = f_295_low60_20_low20_11 * (-(2**20)),
    r_315_326 * f_295_low60_20_low20_0 + s_315_326 * g_295_low60_20_low20_0 = g_295_low60_20_low20_11 * (-(2**20))
&&
    u_315_326 * f_295_low60_20_low20_0 + v_315_326 * g_295_low60_20_low20_0 = f_295_low60_20_low20_11 * (const 64 (-(2**20))),
    r_315_326 * f_295_low60_20_low20_0 + s_315_326 * g_295_low60_20_low20_0 = g_295_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_11 + u_315_326 * (const 64 (2**21)) + v_315_326 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_11 + r_315_326 * (const 64 (2**21)) + s_315_326 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_11,
    f_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_11,
    g_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 326)) <=s delta, delta <=s (const 64 (1 + 2*326)),
    (const 64 (-(2**20))) <=s u_315_326, u_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_326, v_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_326, r_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_326, s_315_326 <=s (const 64 ((2**20))),
    u_315_326 + v_315_326 <=s (const 64 (2**20)),
    u_315_326 - v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 + v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 - v_315_326 <=s (const 64 (2**20)),
    r_315_326 + s_315_326 <=s (const 64 (2**20)),
    r_315_326 - s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 + s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 - s_315_326 <=s (const 64 (2**20)),
    u_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_315_326 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step31

// premise a
assume
g_295_low60_20_low20_11 = 0 (mod 2)
&&
g_295_low60_20_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_12 f_295_low60_20_low20_11;
mov u_315_327 u_315_326;
mov v_315_327 v_315_326;

asr g_295_low60_20_low20_12 g_295_low60_20_low20_11 1;
asr r_315_327 r_315_326 1;
asr s_315_327 s_315_326 1;
assert
    true
&&
    f_295_low60_20_low20_12 = f_295_low60_20_low20_11,
    u_315_327 = u_315_326,
    v_315_327 = v_315_326,
    g_295_low60_20_low20_12 * (const 64 2) = g_295_low60_20_low20_11,
    r_315_327 * (const 64 2) = r_315_326,
    s_315_327 * (const 64 2) = s_315_326
;

assume
    f_295_low60_20_low20_12 = f_295_low60_20_low20_11,
    u_315_327 = u_315_326,
    v_315_327 = v_315_326,
    g_295_low60_20_low20_12 * 2 = g_295_low60_20_low20_11,
    r_315_327 * 2 = r_315_326,
    s_315_327 * 2 = s_315_326
&&
    true
;

{
    u_315_327 * f_295_low60_20_low20_0 + v_315_327 * g_295_low60_20_low20_0 = f_295_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_327 * f_295_low60_20_low20_0 + s_315_327 * g_295_low60_20_low20_0 = g_295_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_12 + u_315_327 * (const 64 (2**21)) + v_315_327 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_12 + r_315_327 * (const 64 (2**21)) + s_315_327 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_12,
    f_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_12,
    g_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 327)) <=s delta, delta <=s (const 64 (1 + 2*327)),
    (const 64 (-(2**20))) <=s u_315_327, u_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_327, v_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_327, r_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_327, s_315_327 <=s (const 64 ((2**20))),
    u_315_327 + v_315_327 <=s (const 64 (2**20)),
    u_315_327 - v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 + v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 - v_315_327 <=s (const 64 (2**20)),
    r_315_327 + s_315_327 <=s (const 64 (2**20)),
    r_315_327 - s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 + s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 - s_315_327 <=s (const 64 (2**20)),
    u_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_315_327 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_326_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_11,
sint64 g_295_low60_20_low20_11,
sint64 f_295_low60_20_low20_12,
sint64 g_295_low60_20_low20_12,
sint64 u_315_326,
sint64 v_315_326,
sint64 r_315_326,
sint64 s_315_326,
sint64 u_315_327,
sint64 v_315_327,
sint64 r_315_327,
sint64 s_315_327,
bit ne
)={
    u_315_326 * f_295_low60_20_low20_0 + v_315_326 * g_295_low60_20_low20_0 = f_295_low60_20_low20_11 * (-(2**20)),
    r_315_326 * f_295_low60_20_low20_0 + s_315_326 * g_295_low60_20_low20_0 = g_295_low60_20_low20_11 * (-(2**20))
&&
    u_315_326 * f_295_low60_20_low20_0 + v_315_326 * g_295_low60_20_low20_0 = f_295_low60_20_low20_11 * (const 64 (-(2**20))),
    r_315_326 * f_295_low60_20_low20_0 + s_315_326 * g_295_low60_20_low20_0 = g_295_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_11 + u_315_326 * (const 64 (2**21)) + v_315_326 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_11 + r_315_326 * (const 64 (2**21)) + s_315_326 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_11,
    f_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_11,
    g_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 326)) <=s delta, delta <=s (const 64 (1 + 2*326)),
    (const 64 (-(2**20))) <=s u_315_326, u_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_326, v_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_326, r_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_326, s_315_326 <=s (const 64 ((2**20))),
    u_315_326 + v_315_326 <=s (const 64 (2**20)),
    u_315_326 - v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 + v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 - v_315_326 <=s (const 64 (2**20)),
    r_315_326 + s_315_326 <=s (const 64 (2**20)),
    r_315_326 - s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 + s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 - s_315_326 <=s (const 64 (2**20)),
    u_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_315_326 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step31

// premise b
assume
g_295_low60_20_low20_11 = 1 (mod 2)
&&
g_295_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_12 f_295_low60_20_low20_11;
mov u_315_327 u_315_326;
mov v_315_327 v_315_326;

add g_295_low60_20_low20_12 g_295_low60_20_low20_11 f_295_low60_20_low20_11;
asr g_295_low60_20_low20_12 g_295_low60_20_low20_12 1;
add r_315_327 r_315_326 u_315_326;
asr r_315_327 r_315_327 1;
add s_315_327 s_315_326 v_315_326;
asr s_315_327 s_315_327 1;
assert
    true
&&
    f_295_low60_20_low20_12 = f_295_low60_20_low20_11,
    u_315_327 = u_315_326,
    v_315_327 = v_315_326,
    g_295_low60_20_low20_12 * (const 64 2) = g_295_low60_20_low20_11 + f_295_low60_20_low20_11,
    r_315_327 * (const 64 2) = r_315_326 + u_315_326,
    s_315_327 * (const 64 2) = s_315_326 + v_315_326
;

assume
    f_295_low60_20_low20_12 = f_295_low60_20_low20_11,
    u_315_327 = u_315_326,
    v_315_327 = v_315_326,
    g_295_low60_20_low20_12 * 2 = g_295_low60_20_low20_11 + f_295_low60_20_low20_11,
    r_315_327 * 2 = r_315_326 + u_315_326,
    s_315_327 * 2 = s_315_326 + v_315_326
&&
    true
;

{
    u_315_327 * f_295_low60_20_low20_0 + v_315_327 * g_295_low60_20_low20_0 = f_295_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_327 * f_295_low60_20_low20_0 + s_315_327 * g_295_low60_20_low20_0 = g_295_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_12 + u_315_327 * (const 64 (2**21)) + v_315_327 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_12 + r_315_327 * (const 64 (2**21)) + s_315_327 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_12,
    f_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_12,
    g_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 327)) <=s delta, delta <=s (const 64 (1 + 2*327)),
    (const 64 (-(2**20))) <=s u_315_327, u_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_327, v_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_327, r_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_327, s_315_327 <=s (const 64 ((2**20))),
    u_315_327 + v_315_327 <=s (const 64 (2**20)),
    u_315_327 - v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 + v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 - v_315_327 <=s (const 64 (2**20)),
    r_315_327 + s_315_327 <=s (const 64 (2**20)),
    r_315_327 - s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 + s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 - s_315_327 <=s (const 64 (2**20)),
    u_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_315_327 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_326_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_11,
sint64 g_295_low60_20_low20_11,
sint64 f_295_low60_20_low20_12,
sint64 g_295_low60_20_low20_12,
sint64 u_315_326,
sint64 v_315_326,
sint64 r_315_326,
sint64 s_315_326,
sint64 u_315_327,
sint64 v_315_327,
sint64 r_315_327,
sint64 s_315_327,
bit ne
)={
    u_315_326 * f_295_low60_20_low20_0 + v_315_326 * g_295_low60_20_low20_0 = f_295_low60_20_low20_11 * (-(2**20)),
    r_315_326 * f_295_low60_20_low20_0 + s_315_326 * g_295_low60_20_low20_0 = g_295_low60_20_low20_11 * (-(2**20))
&&
    u_315_326 * f_295_low60_20_low20_0 + v_315_326 * g_295_low60_20_low20_0 = f_295_low60_20_low20_11 * (const 64 (-(2**20))),
    r_315_326 * f_295_low60_20_low20_0 + s_315_326 * g_295_low60_20_low20_0 = g_295_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_11 + u_315_326 * (const 64 (2**21)) + v_315_326 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_11 + r_315_326 * (const 64 (2**21)) + s_315_326 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_11,
    f_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_11,
    g_295_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 326)) <=s delta, delta <=s (const 64 (1 + 2*326)),
    (const 64 (-(2**20))) <=s u_315_326, u_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_326, v_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_326, r_315_326 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_326, s_315_326 <=s (const 64 ((2**20))),
    u_315_326 + v_315_326 <=s (const 64 (2**20)),
    u_315_326 - v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 + v_315_326 <=s (const 64 (2**20)),
    (const 64 0) - u_315_326 - v_315_326 <=s (const 64 (2**20)),
    r_315_326 + s_315_326 <=s (const 64 (2**20)),
    r_315_326 - s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 + s_315_326 <=s (const 64 (2**20)),
    (const 64 0) - r_315_326 - s_315_326 <=s (const 64 (2**20)),
    u_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_315_326 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_315_326 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step31

// premise c
assume
g_295_low60_20_low20_11 = 1 (mod 2)
&&
g_295_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_12 g_295_low60_20_low20_11;
mov u_315_327 r_315_326;
mov v_315_327 s_315_326;

subs dc g_295_low60_20_low20_12 g_295_low60_20_low20_11 f_295_low60_20_low20_11;
asr g_295_low60_20_low20_12 g_295_low60_20_low20_12 1;
subs dc r_315_327 r_315_326 u_315_326;
asr r_315_327 r_315_327 1;
subs dc s_315_327 s_315_326 v_315_326;
asr s_315_327 s_315_327 1;
assert
    true
&&
    f_295_low60_20_low20_12 = g_295_low60_20_low20_11,
    u_315_327 = r_315_326,
    v_315_327 = s_315_326,
    g_295_low60_20_low20_12 * (const 64 2) = g_295_low60_20_low20_11 - f_295_low60_20_low20_11,
    r_315_327 * (const 64 2) = r_315_326 - u_315_326,
    s_315_327 * (const 64 2) = s_315_326 - v_315_326
;

assume
    f_295_low60_20_low20_12 = g_295_low60_20_low20_11,
    u_315_327 = r_315_326,
    v_315_327 = s_315_326,
    g_295_low60_20_low20_12 * 2 = g_295_low60_20_low20_11 - f_295_low60_20_low20_11,
    r_315_327 * 2 = r_315_326 - u_315_326,
    s_315_327 * 2 = s_315_326 - v_315_326
&&
    true
;

{
    u_315_327 * f_295_low60_20_low20_0 + v_315_327 * g_295_low60_20_low20_0 = f_295_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_327 * f_295_low60_20_low20_0 + s_315_327 * g_295_low60_20_low20_0 = g_295_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_12 + u_315_327 * (const 64 (2**21)) + v_315_327 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_12 + r_315_327 * (const 64 (2**21)) + s_315_327 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_12,
    f_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_12,
    g_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 327)) <=s delta, delta <=s (const 64 (1 + 2*327)),
    (const 64 (-(2**20))) <=s u_315_327, u_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_327, v_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_327, r_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_327, s_315_327 <=s (const 64 ((2**20))),
    u_315_327 + v_315_327 <=s (const 64 (2**20)),
    u_315_327 - v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 + v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 - v_315_327 <=s (const 64 (2**20)),
    r_315_327 + s_315_327 <=s (const 64 (2**20)),
    r_315_327 - s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 + s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 - s_315_327 <=s (const 64 (2**20)),
    u_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_315_327 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_327_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_12,
sint64 g_295_low60_20_low20_12,
sint64 f_295_low60_20_low20_13,
sint64 g_295_low60_20_low20_13,
sint64 u_315_327,
sint64 v_315_327,
sint64 r_315_327,
sint64 s_315_327,
sint64 u_315_328,
sint64 v_315_328,
sint64 r_315_328,
sint64 s_315_328,
bit ne
)={
    u_315_327 * f_295_low60_20_low20_0 + v_315_327 * g_295_low60_20_low20_0 = f_295_low60_20_low20_12 * (-(2**20)),
    r_315_327 * f_295_low60_20_low20_0 + s_315_327 * g_295_low60_20_low20_0 = g_295_low60_20_low20_12 * (-(2**20))
&&
    u_315_327 * f_295_low60_20_low20_0 + v_315_327 * g_295_low60_20_low20_0 = f_295_low60_20_low20_12 * (const 64 (-(2**20))),
    r_315_327 * f_295_low60_20_low20_0 + s_315_327 * g_295_low60_20_low20_0 = g_295_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_12 + u_315_327 * (const 64 (2**21)) + v_315_327 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_12 + r_315_327 * (const 64 (2**21)) + s_315_327 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_12,
    f_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_12,
    g_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 327)) <=s delta, delta <=s (const 64 (1 + 2*327)),
    (const 64 (-(2**20))) <=s u_315_327, u_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_327, v_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_327, r_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_327, s_315_327 <=s (const 64 ((2**20))),
    u_315_327 + v_315_327 <=s (const 64 (2**20)),
    u_315_327 - v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 + v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 - v_315_327 <=s (const 64 (2**20)),
    r_315_327 + s_315_327 <=s (const 64 (2**20)),
    r_315_327 - s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 + s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 - s_315_327 <=s (const 64 (2**20)),
    u_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_315_327 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step32

// premise a
assume
g_295_low60_20_low20_12 = 0 (mod 2)
&&
g_295_low60_20_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_13 f_295_low60_20_low20_12;
mov u_315_328 u_315_327;
mov v_315_328 v_315_327;

asr g_295_low60_20_low20_13 g_295_low60_20_low20_12 1;
asr r_315_328 r_315_327 1;
asr s_315_328 s_315_327 1;
assert
    true
&&
    f_295_low60_20_low20_13 = f_295_low60_20_low20_12,
    u_315_328 = u_315_327,
    v_315_328 = v_315_327,
    g_295_low60_20_low20_13 * (const 64 2) = g_295_low60_20_low20_12,
    r_315_328 * (const 64 2) = r_315_327,
    s_315_328 * (const 64 2) = s_315_327
;

assume
    f_295_low60_20_low20_13 = f_295_low60_20_low20_12,
    u_315_328 = u_315_327,
    v_315_328 = v_315_327,
    g_295_low60_20_low20_13 * 2 = g_295_low60_20_low20_12,
    r_315_328 * 2 = r_315_327,
    s_315_328 * 2 = s_315_327
&&
    true
;

{
    u_315_328 * f_295_low60_20_low20_0 + v_315_328 * g_295_low60_20_low20_0 = f_295_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_328 * f_295_low60_20_low20_0 + s_315_328 * g_295_low60_20_low20_0 = g_295_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_13 + u_315_328 * (const 64 (2**21)) + v_315_328 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_13 + r_315_328 * (const 64 (2**21)) + s_315_328 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_13,
    f_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_13,
    g_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 328)) <=s delta, delta <=s (const 64 (1 + 2*328)),
    (const 64 (-(2**20))) <=s u_315_328, u_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_328, v_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_328, r_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_328, s_315_328 <=s (const 64 ((2**20))),
    u_315_328 + v_315_328 <=s (const 64 (2**20)),
    u_315_328 - v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 + v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 - v_315_328 <=s (const 64 (2**20)),
    r_315_328 + s_315_328 <=s (const 64 (2**20)),
    r_315_328 - s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 + s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 - s_315_328 <=s (const 64 (2**20)),
    u_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_315_328 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_327_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_12,
sint64 g_295_low60_20_low20_12,
sint64 f_295_low60_20_low20_13,
sint64 g_295_low60_20_low20_13,
sint64 u_315_327,
sint64 v_315_327,
sint64 r_315_327,
sint64 s_315_327,
sint64 u_315_328,
sint64 v_315_328,
sint64 r_315_328,
sint64 s_315_328,
bit ne
)={
    u_315_327 * f_295_low60_20_low20_0 + v_315_327 * g_295_low60_20_low20_0 = f_295_low60_20_low20_12 * (-(2**20)),
    r_315_327 * f_295_low60_20_low20_0 + s_315_327 * g_295_low60_20_low20_0 = g_295_low60_20_low20_12 * (-(2**20))
&&
    u_315_327 * f_295_low60_20_low20_0 + v_315_327 * g_295_low60_20_low20_0 = f_295_low60_20_low20_12 * (const 64 (-(2**20))),
    r_315_327 * f_295_low60_20_low20_0 + s_315_327 * g_295_low60_20_low20_0 = g_295_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_12 + u_315_327 * (const 64 (2**21)) + v_315_327 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_12 + r_315_327 * (const 64 (2**21)) + s_315_327 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_12,
    f_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_12,
    g_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 327)) <=s delta, delta <=s (const 64 (1 + 2*327)),
    (const 64 (-(2**20))) <=s u_315_327, u_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_327, v_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_327, r_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_327, s_315_327 <=s (const 64 ((2**20))),
    u_315_327 + v_315_327 <=s (const 64 (2**20)),
    u_315_327 - v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 + v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 - v_315_327 <=s (const 64 (2**20)),
    r_315_327 + s_315_327 <=s (const 64 (2**20)),
    r_315_327 - s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 + s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 - s_315_327 <=s (const 64 (2**20)),
    u_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_315_327 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step32

// premise b
assume
g_295_low60_20_low20_12 = 1 (mod 2)
&&
g_295_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_13 f_295_low60_20_low20_12;
mov u_315_328 u_315_327;
mov v_315_328 v_315_327;

add g_295_low60_20_low20_13 g_295_low60_20_low20_12 f_295_low60_20_low20_12;
asr g_295_low60_20_low20_13 g_295_low60_20_low20_13 1;
add r_315_328 r_315_327 u_315_327;
asr r_315_328 r_315_328 1;
add s_315_328 s_315_327 v_315_327;
asr s_315_328 s_315_328 1;
assert
    true
&&
    f_295_low60_20_low20_13 = f_295_low60_20_low20_12,
    u_315_328 = u_315_327,
    v_315_328 = v_315_327,
    g_295_low60_20_low20_13 * (const 64 2) = g_295_low60_20_low20_12 + f_295_low60_20_low20_12,
    r_315_328 * (const 64 2) = r_315_327 + u_315_327,
    s_315_328 * (const 64 2) = s_315_327 + v_315_327
;

assume
    f_295_low60_20_low20_13 = f_295_low60_20_low20_12,
    u_315_328 = u_315_327,
    v_315_328 = v_315_327,
    g_295_low60_20_low20_13 * 2 = g_295_low60_20_low20_12 + f_295_low60_20_low20_12,
    r_315_328 * 2 = r_315_327 + u_315_327,
    s_315_328 * 2 = s_315_327 + v_315_327
&&
    true
;

{
    u_315_328 * f_295_low60_20_low20_0 + v_315_328 * g_295_low60_20_low20_0 = f_295_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_328 * f_295_low60_20_low20_0 + s_315_328 * g_295_low60_20_low20_0 = g_295_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_13 + u_315_328 * (const 64 (2**21)) + v_315_328 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_13 + r_315_328 * (const 64 (2**21)) + s_315_328 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_13,
    f_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_13,
    g_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 328)) <=s delta, delta <=s (const 64 (1 + 2*328)),
    (const 64 (-(2**20))) <=s u_315_328, u_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_328, v_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_328, r_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_328, s_315_328 <=s (const 64 ((2**20))),
    u_315_328 + v_315_328 <=s (const 64 (2**20)),
    u_315_328 - v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 + v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 - v_315_328 <=s (const 64 (2**20)),
    r_315_328 + s_315_328 <=s (const 64 (2**20)),
    r_315_328 - s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 + s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 - s_315_328 <=s (const 64 (2**20)),
    u_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_315_328 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_327_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_12,
sint64 g_295_low60_20_low20_12,
sint64 f_295_low60_20_low20_13,
sint64 g_295_low60_20_low20_13,
sint64 u_315_327,
sint64 v_315_327,
sint64 r_315_327,
sint64 s_315_327,
sint64 u_315_328,
sint64 v_315_328,
sint64 r_315_328,
sint64 s_315_328,
bit ne
)={
    u_315_327 * f_295_low60_20_low20_0 + v_315_327 * g_295_low60_20_low20_0 = f_295_low60_20_low20_12 * (-(2**20)),
    r_315_327 * f_295_low60_20_low20_0 + s_315_327 * g_295_low60_20_low20_0 = g_295_low60_20_low20_12 * (-(2**20))
&&
    u_315_327 * f_295_low60_20_low20_0 + v_315_327 * g_295_low60_20_low20_0 = f_295_low60_20_low20_12 * (const 64 (-(2**20))),
    r_315_327 * f_295_low60_20_low20_0 + s_315_327 * g_295_low60_20_low20_0 = g_295_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_12 + u_315_327 * (const 64 (2**21)) + v_315_327 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_12 + r_315_327 * (const 64 (2**21)) + s_315_327 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_12,
    f_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_12,
    g_295_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 327)) <=s delta, delta <=s (const 64 (1 + 2*327)),
    (const 64 (-(2**20))) <=s u_315_327, u_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_327, v_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_327, r_315_327 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_327, s_315_327 <=s (const 64 ((2**20))),
    u_315_327 + v_315_327 <=s (const 64 (2**20)),
    u_315_327 - v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 + v_315_327 <=s (const 64 (2**20)),
    (const 64 0) - u_315_327 - v_315_327 <=s (const 64 (2**20)),
    r_315_327 + s_315_327 <=s (const 64 (2**20)),
    r_315_327 - s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 + s_315_327 <=s (const 64 (2**20)),
    (const 64 0) - r_315_327 - s_315_327 <=s (const 64 (2**20)),
    u_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_315_327 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_315_327 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step32

// premise c
assume
g_295_low60_20_low20_12 = 1 (mod 2)
&&
g_295_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_13 g_295_low60_20_low20_12;
mov u_315_328 r_315_327;
mov v_315_328 s_315_327;

subs dc g_295_low60_20_low20_13 g_295_low60_20_low20_12 f_295_low60_20_low20_12;
asr g_295_low60_20_low20_13 g_295_low60_20_low20_13 1;
subs dc r_315_328 r_315_327 u_315_327;
asr r_315_328 r_315_328 1;
subs dc s_315_328 s_315_327 v_315_327;
asr s_315_328 s_315_328 1;
assert
    true
&&
    f_295_low60_20_low20_13 = g_295_low60_20_low20_12,
    u_315_328 = r_315_327,
    v_315_328 = s_315_327,
    g_295_low60_20_low20_13 * (const 64 2) = g_295_low60_20_low20_12 - f_295_low60_20_low20_12,
    r_315_328 * (const 64 2) = r_315_327 - u_315_327,
    s_315_328 * (const 64 2) = s_315_327 - v_315_327
;

assume
    f_295_low60_20_low20_13 = g_295_low60_20_low20_12,
    u_315_328 = r_315_327,
    v_315_328 = s_315_327,
    g_295_low60_20_low20_13 * 2 = g_295_low60_20_low20_12 - f_295_low60_20_low20_12,
    r_315_328 * 2 = r_315_327 - u_315_327,
    s_315_328 * 2 = s_315_327 - v_315_327
&&
    true
;

{
    u_315_328 * f_295_low60_20_low20_0 + v_315_328 * g_295_low60_20_low20_0 = f_295_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_328 * f_295_low60_20_low20_0 + s_315_328 * g_295_low60_20_low20_0 = g_295_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_13 + u_315_328 * (const 64 (2**21)) + v_315_328 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_13 + r_315_328 * (const 64 (2**21)) + s_315_328 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_13,
    f_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_13,
    g_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 328)) <=s delta, delta <=s (const 64 (1 + 2*328)),
    (const 64 (-(2**20))) <=s u_315_328, u_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_328, v_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_328, r_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_328, s_315_328 <=s (const 64 ((2**20))),
    u_315_328 + v_315_328 <=s (const 64 (2**20)),
    u_315_328 - v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 + v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 - v_315_328 <=s (const 64 (2**20)),
    r_315_328 + s_315_328 <=s (const 64 (2**20)),
    r_315_328 - s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 + s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 - s_315_328 <=s (const 64 (2**20)),
    u_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_315_328 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_328_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_13,
sint64 g_295_low60_20_low20_13,
sint64 f_295_low60_20_low20_14,
sint64 g_295_low60_20_low20_14,
sint64 u_315_328,
sint64 v_315_328,
sint64 r_315_328,
sint64 s_315_328,
sint64 u_315_329,
sint64 v_315_329,
sint64 r_315_329,
sint64 s_315_329,
bit ne
)={
    u_315_328 * f_295_low60_20_low20_0 + v_315_328 * g_295_low60_20_low20_0 = f_295_low60_20_low20_13 * (-(2**20)),
    r_315_328 * f_295_low60_20_low20_0 + s_315_328 * g_295_low60_20_low20_0 = g_295_low60_20_low20_13 * (-(2**20))
&&
    u_315_328 * f_295_low60_20_low20_0 + v_315_328 * g_295_low60_20_low20_0 = f_295_low60_20_low20_13 * (const 64 (-(2**20))),
    r_315_328 * f_295_low60_20_low20_0 + s_315_328 * g_295_low60_20_low20_0 = g_295_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_13 + u_315_328 * (const 64 (2**21)) + v_315_328 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_13 + r_315_328 * (const 64 (2**21)) + s_315_328 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_13,
    f_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_13,
    g_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 328)) <=s delta, delta <=s (const 64 (1 + 2*328)),
    (const 64 (-(2**20))) <=s u_315_328, u_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_328, v_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_328, r_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_328, s_315_328 <=s (const 64 ((2**20))),
    u_315_328 + v_315_328 <=s (const 64 (2**20)),
    u_315_328 - v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 + v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 - v_315_328 <=s (const 64 (2**20)),
    r_315_328 + s_315_328 <=s (const 64 (2**20)),
    r_315_328 - s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 + s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 - s_315_328 <=s (const 64 (2**20)),
    u_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_315_328 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise a
assume
g_295_low60_20_low20_13 = 0 (mod 2)
&&
g_295_low60_20_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_14 f_295_low60_20_low20_13;
mov u_315_329 u_315_328;
mov v_315_329 v_315_328;

asr g_295_low60_20_low20_14 g_295_low60_20_low20_13 1;
asr r_315_329 r_315_328 1;
asr s_315_329 s_315_328 1;
assert
    true
&&
    f_295_low60_20_low20_14 = f_295_low60_20_low20_13,
    u_315_329 = u_315_328,
    v_315_329 = v_315_328,
    g_295_low60_20_low20_14 * (const 64 2) = g_295_low60_20_low20_13,
    r_315_329 * (const 64 2) = r_315_328,
    s_315_329 * (const 64 2) = s_315_328
;

assume
    f_295_low60_20_low20_14 = f_295_low60_20_low20_13,
    u_315_329 = u_315_328,
    v_315_329 = v_315_328,
    g_295_low60_20_low20_14 * 2 = g_295_low60_20_low20_13,
    r_315_329 * 2 = r_315_328,
    s_315_329 * 2 = s_315_328
&&
    true
;

{
    u_315_329 * f_295_low60_20_low20_0 + v_315_329 * g_295_low60_20_low20_0 = f_295_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_329 * f_295_low60_20_low20_0 + s_315_329 * g_295_low60_20_low20_0 = g_295_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_14 + u_315_329 * (const 64 (2**21)) + v_315_329 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_14 + r_315_329 * (const 64 (2**21)) + s_315_329 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_14,
    f_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_14,
    g_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 329)) <=s delta, delta <=s (const 64 (1 + 2*329)),
    (const 64 (-(2**20))) <=s u_315_329, u_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_329, v_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_329, r_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_329, s_315_329 <=s (const 64 ((2**20))),
    u_315_329 + v_315_329 <=s (const 64 (2**20)),
    u_315_329 - v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 + v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 - v_315_329 <=s (const 64 (2**20)),
    r_315_329 + s_315_329 <=s (const 64 (2**20)),
    r_315_329 - s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 + s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 - s_315_329 <=s (const 64 (2**20)),
    u_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_315_329 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_328_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_13,
sint64 g_295_low60_20_low20_13,
sint64 f_295_low60_20_low20_14,
sint64 g_295_low60_20_low20_14,
sint64 u_315_328,
sint64 v_315_328,
sint64 r_315_328,
sint64 s_315_328,
sint64 u_315_329,
sint64 v_315_329,
sint64 r_315_329,
sint64 s_315_329,
bit ne
)={
    u_315_328 * f_295_low60_20_low20_0 + v_315_328 * g_295_low60_20_low20_0 = f_295_low60_20_low20_13 * (-(2**20)),
    r_315_328 * f_295_low60_20_low20_0 + s_315_328 * g_295_low60_20_low20_0 = g_295_low60_20_low20_13 * (-(2**20))
&&
    u_315_328 * f_295_low60_20_low20_0 + v_315_328 * g_295_low60_20_low20_0 = f_295_low60_20_low20_13 * (const 64 (-(2**20))),
    r_315_328 * f_295_low60_20_low20_0 + s_315_328 * g_295_low60_20_low20_0 = g_295_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_13 + u_315_328 * (const 64 (2**21)) + v_315_328 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_13 + r_315_328 * (const 64 (2**21)) + s_315_328 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_13,
    f_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_13,
    g_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 328)) <=s delta, delta <=s (const 64 (1 + 2*328)),
    (const 64 (-(2**20))) <=s u_315_328, u_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_328, v_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_328, r_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_328, s_315_328 <=s (const 64 ((2**20))),
    u_315_328 + v_315_328 <=s (const 64 (2**20)),
    u_315_328 - v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 + v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 - v_315_328 <=s (const 64 (2**20)),
    r_315_328 + s_315_328 <=s (const 64 (2**20)),
    r_315_328 - s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 + s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 - s_315_328 <=s (const 64 (2**20)),
    u_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_315_328 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise b
assume
g_295_low60_20_low20_13 = 1 (mod 2)
&&
g_295_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_14 f_295_low60_20_low20_13;
mov u_315_329 u_315_328;
mov v_315_329 v_315_328;

add g_295_low60_20_low20_14 g_295_low60_20_low20_13 f_295_low60_20_low20_13;
asr g_295_low60_20_low20_14 g_295_low60_20_low20_14 1;
add r_315_329 r_315_328 u_315_328;
asr r_315_329 r_315_329 1;
add s_315_329 s_315_328 v_315_328;
asr s_315_329 s_315_329 1;
assert
    true
&&
    f_295_low60_20_low20_14 = f_295_low60_20_low20_13,
    u_315_329 = u_315_328,
    v_315_329 = v_315_328,
    g_295_low60_20_low20_14 * (const 64 2) = g_295_low60_20_low20_13 + f_295_low60_20_low20_13,
    r_315_329 * (const 64 2) = r_315_328 + u_315_328,
    s_315_329 * (const 64 2) = s_315_328 + v_315_328
;

assume
    f_295_low60_20_low20_14 = f_295_low60_20_low20_13,
    u_315_329 = u_315_328,
    v_315_329 = v_315_328,
    g_295_low60_20_low20_14 * 2 = g_295_low60_20_low20_13 + f_295_low60_20_low20_13,
    r_315_329 * 2 = r_315_328 + u_315_328,
    s_315_329 * 2 = s_315_328 + v_315_328
&&
    true
;

{
    u_315_329 * f_295_low60_20_low20_0 + v_315_329 * g_295_low60_20_low20_0 = f_295_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_329 * f_295_low60_20_low20_0 + s_315_329 * g_295_low60_20_low20_0 = g_295_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_14 + u_315_329 * (const 64 (2**21)) + v_315_329 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_14 + r_315_329 * (const 64 (2**21)) + s_315_329 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_14,
    f_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_14,
    g_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 329)) <=s delta, delta <=s (const 64 (1 + 2*329)),
    (const 64 (-(2**20))) <=s u_315_329, u_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_329, v_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_329, r_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_329, s_315_329 <=s (const 64 ((2**20))),
    u_315_329 + v_315_329 <=s (const 64 (2**20)),
    u_315_329 - v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 + v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 - v_315_329 <=s (const 64 (2**20)),
    r_315_329 + s_315_329 <=s (const 64 (2**20)),
    r_315_329 - s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 + s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 - s_315_329 <=s (const 64 (2**20)),
    u_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_315_329 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_328_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_13,
sint64 g_295_low60_20_low20_13,
sint64 f_295_low60_20_low20_14,
sint64 g_295_low60_20_low20_14,
sint64 u_315_328,
sint64 v_315_328,
sint64 r_315_328,
sint64 s_315_328,
sint64 u_315_329,
sint64 v_315_329,
sint64 r_315_329,
sint64 s_315_329,
bit ne
)={
    u_315_328 * f_295_low60_20_low20_0 + v_315_328 * g_295_low60_20_low20_0 = f_295_low60_20_low20_13 * (-(2**20)),
    r_315_328 * f_295_low60_20_low20_0 + s_315_328 * g_295_low60_20_low20_0 = g_295_low60_20_low20_13 * (-(2**20))
&&
    u_315_328 * f_295_low60_20_low20_0 + v_315_328 * g_295_low60_20_low20_0 = f_295_low60_20_low20_13 * (const 64 (-(2**20))),
    r_315_328 * f_295_low60_20_low20_0 + s_315_328 * g_295_low60_20_low20_0 = g_295_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_13 + u_315_328 * (const 64 (2**21)) + v_315_328 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_13 + r_315_328 * (const 64 (2**21)) + s_315_328 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_13,
    f_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_13,
    g_295_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 328)) <=s delta, delta <=s (const 64 (1 + 2*328)),
    (const 64 (-(2**20))) <=s u_315_328, u_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_328, v_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_328, r_315_328 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_328, s_315_328 <=s (const 64 ((2**20))),
    u_315_328 + v_315_328 <=s (const 64 (2**20)),
    u_315_328 - v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 + v_315_328 <=s (const 64 (2**20)),
    (const 64 0) - u_315_328 - v_315_328 <=s (const 64 (2**20)),
    r_315_328 + s_315_328 <=s (const 64 (2**20)),
    r_315_328 - s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 + s_315_328 <=s (const 64 (2**20)),
    (const 64 0) - r_315_328 - s_315_328 <=s (const 64 (2**20)),
    u_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_315_328 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_315_328 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise c
assume
g_295_low60_20_low20_13 = 1 (mod 2)
&&
g_295_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_14 g_295_low60_20_low20_13;
mov u_315_329 r_315_328;
mov v_315_329 s_315_328;

subs dc g_295_low60_20_low20_14 g_295_low60_20_low20_13 f_295_low60_20_low20_13;
asr g_295_low60_20_low20_14 g_295_low60_20_low20_14 1;
subs dc r_315_329 r_315_328 u_315_328;
asr r_315_329 r_315_329 1;
subs dc s_315_329 s_315_328 v_315_328;
asr s_315_329 s_315_329 1;
assert
    true
&&
    f_295_low60_20_low20_14 = g_295_low60_20_low20_13,
    u_315_329 = r_315_328,
    v_315_329 = s_315_328,
    g_295_low60_20_low20_14 * (const 64 2) = g_295_low60_20_low20_13 - f_295_low60_20_low20_13,
    r_315_329 * (const 64 2) = r_315_328 - u_315_328,
    s_315_329 * (const 64 2) = s_315_328 - v_315_328
;

assume
    f_295_low60_20_low20_14 = g_295_low60_20_low20_13,
    u_315_329 = r_315_328,
    v_315_329 = s_315_328,
    g_295_low60_20_low20_14 * 2 = g_295_low60_20_low20_13 - f_295_low60_20_low20_13,
    r_315_329 * 2 = r_315_328 - u_315_328,
    s_315_329 * 2 = s_315_328 - v_315_328
&&
    true
;

{
    u_315_329 * f_295_low60_20_low20_0 + v_315_329 * g_295_low60_20_low20_0 = f_295_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_329 * f_295_low60_20_low20_0 + s_315_329 * g_295_low60_20_low20_0 = g_295_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_14 + u_315_329 * (const 64 (2**21)) + v_315_329 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_14 + r_315_329 * (const 64 (2**21)) + s_315_329 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_14,
    f_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_14,
    g_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 329)) <=s delta, delta <=s (const 64 (1 + 2*329)),
    (const 64 (-(2**20))) <=s u_315_329, u_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_329, v_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_329, r_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_329, s_315_329 <=s (const 64 ((2**20))),
    u_315_329 + v_315_329 <=s (const 64 (2**20)),
    u_315_329 - v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 + v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 - v_315_329 <=s (const 64 (2**20)),
    r_315_329 + s_315_329 <=s (const 64 (2**20)),
    r_315_329 - s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 + s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 - s_315_329 <=s (const 64 (2**20)),
    u_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_315_329 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_329_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_14,
sint64 g_295_low60_20_low20_14,
sint64 f_295_low60_20_low20_15,
sint64 g_295_low60_20_low20_15,
sint64 u_315_329,
sint64 v_315_329,
sint64 r_315_329,
sint64 s_315_329,
sint64 u_315_330,
sint64 v_315_330,
sint64 r_315_330,
sint64 s_315_330,
bit ne
)={
    u_315_329 * f_295_low60_20_low20_0 + v_315_329 * g_295_low60_20_low20_0 = f_295_low60_20_low20_14 * (-(2**20)),
    r_315_329 * f_295_low60_20_low20_0 + s_315_329 * g_295_low60_20_low20_0 = g_295_low60_20_low20_14 * (-(2**20))
&&
    u_315_329 * f_295_low60_20_low20_0 + v_315_329 * g_295_low60_20_low20_0 = f_295_low60_20_low20_14 * (const 64 (-(2**20))),
    r_315_329 * f_295_low60_20_low20_0 + s_315_329 * g_295_low60_20_low20_0 = g_295_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_14 + u_315_329 * (const 64 (2**21)) + v_315_329 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_14 + r_315_329 * (const 64 (2**21)) + s_315_329 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_14,
    f_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_14,
    g_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 329)) <=s delta, delta <=s (const 64 (1 + 2*329)),
    (const 64 (-(2**20))) <=s u_315_329, u_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_329, v_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_329, r_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_329, s_315_329 <=s (const 64 ((2**20))),
    u_315_329 + v_315_329 <=s (const 64 (2**20)),
    u_315_329 - v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 + v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 - v_315_329 <=s (const 64 (2**20)),
    r_315_329 + s_315_329 <=s (const 64 (2**20)),
    r_315_329 - s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 + s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 - s_315_329 <=s (const 64 (2**20)),
    u_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_315_329 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise a
assume
g_295_low60_20_low20_14 = 0 (mod 2)
&&
g_295_low60_20_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_15 f_295_low60_20_low20_14;
mov u_315_330 u_315_329;
mov v_315_330 v_315_329;

asr g_295_low60_20_low20_15 g_295_low60_20_low20_14 1;
asr r_315_330 r_315_329 1;
asr s_315_330 s_315_329 1;
assert
    true
&&
    f_295_low60_20_low20_15 = f_295_low60_20_low20_14,
    u_315_330 = u_315_329,
    v_315_330 = v_315_329,
    g_295_low60_20_low20_15 * (const 64 2) = g_295_low60_20_low20_14,
    r_315_330 * (const 64 2) = r_315_329,
    s_315_330 * (const 64 2) = s_315_329
;

assume
    f_295_low60_20_low20_15 = f_295_low60_20_low20_14,
    u_315_330 = u_315_329,
    v_315_330 = v_315_329,
    g_295_low60_20_low20_15 * 2 = g_295_low60_20_low20_14,
    r_315_330 * 2 = r_315_329,
    s_315_330 * 2 = s_315_329
&&
    true
;

{
    u_315_330 * f_295_low60_20_low20_0 + v_315_330 * g_295_low60_20_low20_0 = f_295_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_330 * f_295_low60_20_low20_0 + s_315_330 * g_295_low60_20_low20_0 = g_295_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_15 + u_315_330 * (const 64 (2**21)) + v_315_330 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_15 + r_315_330 * (const 64 (2**21)) + s_315_330 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_15,
    f_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_15,
    g_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 330)) <=s delta, delta <=s (const 64 (1 + 2*330)),
    (const 64 (-(2**20))) <=s u_315_330, u_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_330, v_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_330, r_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_330, s_315_330 <=s (const 64 ((2**20))),
    u_315_330 + v_315_330 <=s (const 64 (2**20)),
    u_315_330 - v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 + v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 - v_315_330 <=s (const 64 (2**20)),
    r_315_330 + s_315_330 <=s (const 64 (2**20)),
    r_315_330 - s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 + s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 - s_315_330 <=s (const 64 (2**20)),
    u_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_315_330 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_329_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_14,
sint64 g_295_low60_20_low20_14,
sint64 f_295_low60_20_low20_15,
sint64 g_295_low60_20_low20_15,
sint64 u_315_329,
sint64 v_315_329,
sint64 r_315_329,
sint64 s_315_329,
sint64 u_315_330,
sint64 v_315_330,
sint64 r_315_330,
sint64 s_315_330,
bit ne
)={
    u_315_329 * f_295_low60_20_low20_0 + v_315_329 * g_295_low60_20_low20_0 = f_295_low60_20_low20_14 * (-(2**20)),
    r_315_329 * f_295_low60_20_low20_0 + s_315_329 * g_295_low60_20_low20_0 = g_295_low60_20_low20_14 * (-(2**20))
&&
    u_315_329 * f_295_low60_20_low20_0 + v_315_329 * g_295_low60_20_low20_0 = f_295_low60_20_low20_14 * (const 64 (-(2**20))),
    r_315_329 * f_295_low60_20_low20_0 + s_315_329 * g_295_low60_20_low20_0 = g_295_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_14 + u_315_329 * (const 64 (2**21)) + v_315_329 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_14 + r_315_329 * (const 64 (2**21)) + s_315_329 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_14,
    f_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_14,
    g_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 329)) <=s delta, delta <=s (const 64 (1 + 2*329)),
    (const 64 (-(2**20))) <=s u_315_329, u_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_329, v_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_329, r_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_329, s_315_329 <=s (const 64 ((2**20))),
    u_315_329 + v_315_329 <=s (const 64 (2**20)),
    u_315_329 - v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 + v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 - v_315_329 <=s (const 64 (2**20)),
    r_315_329 + s_315_329 <=s (const 64 (2**20)),
    r_315_329 - s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 + s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 - s_315_329 <=s (const 64 (2**20)),
    u_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_315_329 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise b
assume
g_295_low60_20_low20_14 = 1 (mod 2)
&&
g_295_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_15 f_295_low60_20_low20_14;
mov u_315_330 u_315_329;
mov v_315_330 v_315_329;

add g_295_low60_20_low20_15 g_295_low60_20_low20_14 f_295_low60_20_low20_14;
asr g_295_low60_20_low20_15 g_295_low60_20_low20_15 1;
add r_315_330 r_315_329 u_315_329;
asr r_315_330 r_315_330 1;
add s_315_330 s_315_329 v_315_329;
asr s_315_330 s_315_330 1;
assert
    true
&&
    f_295_low60_20_low20_15 = f_295_low60_20_low20_14,
    u_315_330 = u_315_329,
    v_315_330 = v_315_329,
    g_295_low60_20_low20_15 * (const 64 2) = g_295_low60_20_low20_14 + f_295_low60_20_low20_14,
    r_315_330 * (const 64 2) = r_315_329 + u_315_329,
    s_315_330 * (const 64 2) = s_315_329 + v_315_329
;

assume
    f_295_low60_20_low20_15 = f_295_low60_20_low20_14,
    u_315_330 = u_315_329,
    v_315_330 = v_315_329,
    g_295_low60_20_low20_15 * 2 = g_295_low60_20_low20_14 + f_295_low60_20_low20_14,
    r_315_330 * 2 = r_315_329 + u_315_329,
    s_315_330 * 2 = s_315_329 + v_315_329
&&
    true
;

{
    u_315_330 * f_295_low60_20_low20_0 + v_315_330 * g_295_low60_20_low20_0 = f_295_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_330 * f_295_low60_20_low20_0 + s_315_330 * g_295_low60_20_low20_0 = g_295_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_15 + u_315_330 * (const 64 (2**21)) + v_315_330 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_15 + r_315_330 * (const 64 (2**21)) + s_315_330 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_15,
    f_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_15,
    g_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 330)) <=s delta, delta <=s (const 64 (1 + 2*330)),
    (const 64 (-(2**20))) <=s u_315_330, u_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_330, v_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_330, r_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_330, s_315_330 <=s (const 64 ((2**20))),
    u_315_330 + v_315_330 <=s (const 64 (2**20)),
    u_315_330 - v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 + v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 - v_315_330 <=s (const 64 (2**20)),
    r_315_330 + s_315_330 <=s (const 64 (2**20)),
    r_315_330 - s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 + s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 - s_315_330 <=s (const 64 (2**20)),
    u_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_315_330 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_329_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_14,
sint64 g_295_low60_20_low20_14,
sint64 f_295_low60_20_low20_15,
sint64 g_295_low60_20_low20_15,
sint64 u_315_329,
sint64 v_315_329,
sint64 r_315_329,
sint64 s_315_329,
sint64 u_315_330,
sint64 v_315_330,
sint64 r_315_330,
sint64 s_315_330,
bit ne
)={
    u_315_329 * f_295_low60_20_low20_0 + v_315_329 * g_295_low60_20_low20_0 = f_295_low60_20_low20_14 * (-(2**20)),
    r_315_329 * f_295_low60_20_low20_0 + s_315_329 * g_295_low60_20_low20_0 = g_295_low60_20_low20_14 * (-(2**20))
&&
    u_315_329 * f_295_low60_20_low20_0 + v_315_329 * g_295_low60_20_low20_0 = f_295_low60_20_low20_14 * (const 64 (-(2**20))),
    r_315_329 * f_295_low60_20_low20_0 + s_315_329 * g_295_low60_20_low20_0 = g_295_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_14 + u_315_329 * (const 64 (2**21)) + v_315_329 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_14 + r_315_329 * (const 64 (2**21)) + s_315_329 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_14,
    f_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_14,
    g_295_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 329)) <=s delta, delta <=s (const 64 (1 + 2*329)),
    (const 64 (-(2**20))) <=s u_315_329, u_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_329, v_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_329, r_315_329 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_329, s_315_329 <=s (const 64 ((2**20))),
    u_315_329 + v_315_329 <=s (const 64 (2**20)),
    u_315_329 - v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 + v_315_329 <=s (const 64 (2**20)),
    (const 64 0) - u_315_329 - v_315_329 <=s (const 64 (2**20)),
    r_315_329 + s_315_329 <=s (const 64 (2**20)),
    r_315_329 - s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 + s_315_329 <=s (const 64 (2**20)),
    (const 64 0) - r_315_329 - s_315_329 <=s (const 64 (2**20)),
    u_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_315_329 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_315_329 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise c
assume
g_295_low60_20_low20_14 = 1 (mod 2)
&&
g_295_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_15 g_295_low60_20_low20_14;
mov u_315_330 r_315_329;
mov v_315_330 s_315_329;

subs dc g_295_low60_20_low20_15 g_295_low60_20_low20_14 f_295_low60_20_low20_14;
asr g_295_low60_20_low20_15 g_295_low60_20_low20_15 1;
subs dc r_315_330 r_315_329 u_315_329;
asr r_315_330 r_315_330 1;
subs dc s_315_330 s_315_329 v_315_329;
asr s_315_330 s_315_330 1;
assert
    true
&&
    f_295_low60_20_low20_15 = g_295_low60_20_low20_14,
    u_315_330 = r_315_329,
    v_315_330 = s_315_329,
    g_295_low60_20_low20_15 * (const 64 2) = g_295_low60_20_low20_14 - f_295_low60_20_low20_14,
    r_315_330 * (const 64 2) = r_315_329 - u_315_329,
    s_315_330 * (const 64 2) = s_315_329 - v_315_329
;

assume
    f_295_low60_20_low20_15 = g_295_low60_20_low20_14,
    u_315_330 = r_315_329,
    v_315_330 = s_315_329,
    g_295_low60_20_low20_15 * 2 = g_295_low60_20_low20_14 - f_295_low60_20_low20_14,
    r_315_330 * 2 = r_315_329 - u_315_329,
    s_315_330 * 2 = s_315_329 - v_315_329
&&
    true
;

{
    u_315_330 * f_295_low60_20_low20_0 + v_315_330 * g_295_low60_20_low20_0 = f_295_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_330 * f_295_low60_20_low20_0 + s_315_330 * g_295_low60_20_low20_0 = g_295_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_15 + u_315_330 * (const 64 (2**21)) + v_315_330 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_15 + r_315_330 * (const 64 (2**21)) + s_315_330 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_15,
    f_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_15,
    g_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 330)) <=s delta, delta <=s (const 64 (1 + 2*330)),
    (const 64 (-(2**20))) <=s u_315_330, u_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_330, v_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_330, r_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_330, s_315_330 <=s (const 64 ((2**20))),
    u_315_330 + v_315_330 <=s (const 64 (2**20)),
    u_315_330 - v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 + v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 - v_315_330 <=s (const 64 (2**20)),
    r_315_330 + s_315_330 <=s (const 64 (2**20)),
    r_315_330 - s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 + s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 - s_315_330 <=s (const 64 (2**20)),
    u_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_315_330 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_330_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_15,
sint64 g_295_low60_20_low20_15,
sint64 f_295_low60_20_low20_16,
sint64 g_295_low60_20_low20_16,
sint64 u_315_330,
sint64 v_315_330,
sint64 r_315_330,
sint64 s_315_330,
sint64 u_315_331,
sint64 v_315_331,
sint64 r_315_331,
sint64 s_315_331,
bit ne
)={
    u_315_330 * f_295_low60_20_low20_0 + v_315_330 * g_295_low60_20_low20_0 = f_295_low60_20_low20_15 * (-(2**20)),
    r_315_330 * f_295_low60_20_low20_0 + s_315_330 * g_295_low60_20_low20_0 = g_295_low60_20_low20_15 * (-(2**20))
&&
    u_315_330 * f_295_low60_20_low20_0 + v_315_330 * g_295_low60_20_low20_0 = f_295_low60_20_low20_15 * (const 64 (-(2**20))),
    r_315_330 * f_295_low60_20_low20_0 + s_315_330 * g_295_low60_20_low20_0 = g_295_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_15 + u_315_330 * (const 64 (2**21)) + v_315_330 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_15 + r_315_330 * (const 64 (2**21)) + s_315_330 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_15,
    f_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_15,
    g_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 330)) <=s delta, delta <=s (const 64 (1 + 2*330)),
    (const 64 (-(2**20))) <=s u_315_330, u_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_330, v_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_330, r_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_330, s_315_330 <=s (const 64 ((2**20))),
    u_315_330 + v_315_330 <=s (const 64 (2**20)),
    u_315_330 - v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 + v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 - v_315_330 <=s (const 64 (2**20)),
    r_315_330 + s_315_330 <=s (const 64 (2**20)),
    r_315_330 - s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 + s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 - s_315_330 <=s (const 64 (2**20)),
    u_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_315_330 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise a
assume
g_295_low60_20_low20_15 = 0 (mod 2)
&&
g_295_low60_20_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_16 f_295_low60_20_low20_15;
mov u_315_331 u_315_330;
mov v_315_331 v_315_330;

asr g_295_low60_20_low20_16 g_295_low60_20_low20_15 1;
asr r_315_331 r_315_330 1;
asr s_315_331 s_315_330 1;
assert
    true
&&
    f_295_low60_20_low20_16 = f_295_low60_20_low20_15,
    u_315_331 = u_315_330,
    v_315_331 = v_315_330,
    g_295_low60_20_low20_16 * (const 64 2) = g_295_low60_20_low20_15,
    r_315_331 * (const 64 2) = r_315_330,
    s_315_331 * (const 64 2) = s_315_330
;

assume
    f_295_low60_20_low20_16 = f_295_low60_20_low20_15,
    u_315_331 = u_315_330,
    v_315_331 = v_315_330,
    g_295_low60_20_low20_16 * 2 = g_295_low60_20_low20_15,
    r_315_331 * 2 = r_315_330,
    s_315_331 * 2 = s_315_330
&&
    true
;

{
    u_315_331 * f_295_low60_20_low20_0 + v_315_331 * g_295_low60_20_low20_0 = f_295_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_331 * f_295_low60_20_low20_0 + s_315_331 * g_295_low60_20_low20_0 = g_295_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_16 + u_315_331 * (const 64 (2**21)) + v_315_331 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_16 + r_315_331 * (const 64 (2**21)) + s_315_331 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_16,
    f_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_16,
    g_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 331)) <=s delta, delta <=s (const 64 (1 + 2*331)),
    (const 64 (-(2**20))) <=s u_315_331, u_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_331, v_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_331, r_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_331, s_315_331 <=s (const 64 ((2**20))),
    u_315_331 + v_315_331 <=s (const 64 (2**20)),
    u_315_331 - v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 + v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 - v_315_331 <=s (const 64 (2**20)),
    r_315_331 + s_315_331 <=s (const 64 (2**20)),
    r_315_331 - s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 + s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 - s_315_331 <=s (const 64 (2**20)),
    u_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_315_331 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_330_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_15,
sint64 g_295_low60_20_low20_15,
sint64 f_295_low60_20_low20_16,
sint64 g_295_low60_20_low20_16,
sint64 u_315_330,
sint64 v_315_330,
sint64 r_315_330,
sint64 s_315_330,
sint64 u_315_331,
sint64 v_315_331,
sint64 r_315_331,
sint64 s_315_331,
bit ne
)={
    u_315_330 * f_295_low60_20_low20_0 + v_315_330 * g_295_low60_20_low20_0 = f_295_low60_20_low20_15 * (-(2**20)),
    r_315_330 * f_295_low60_20_low20_0 + s_315_330 * g_295_low60_20_low20_0 = g_295_low60_20_low20_15 * (-(2**20))
&&
    u_315_330 * f_295_low60_20_low20_0 + v_315_330 * g_295_low60_20_low20_0 = f_295_low60_20_low20_15 * (const 64 (-(2**20))),
    r_315_330 * f_295_low60_20_low20_0 + s_315_330 * g_295_low60_20_low20_0 = g_295_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_15 + u_315_330 * (const 64 (2**21)) + v_315_330 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_15 + r_315_330 * (const 64 (2**21)) + s_315_330 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_15,
    f_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_15,
    g_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 330)) <=s delta, delta <=s (const 64 (1 + 2*330)),
    (const 64 (-(2**20))) <=s u_315_330, u_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_330, v_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_330, r_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_330, s_315_330 <=s (const 64 ((2**20))),
    u_315_330 + v_315_330 <=s (const 64 (2**20)),
    u_315_330 - v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 + v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 - v_315_330 <=s (const 64 (2**20)),
    r_315_330 + s_315_330 <=s (const 64 (2**20)),
    r_315_330 - s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 + s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 - s_315_330 <=s (const 64 (2**20)),
    u_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_315_330 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise b
assume
g_295_low60_20_low20_15 = 1 (mod 2)
&&
g_295_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_16 f_295_low60_20_low20_15;
mov u_315_331 u_315_330;
mov v_315_331 v_315_330;

add g_295_low60_20_low20_16 g_295_low60_20_low20_15 f_295_low60_20_low20_15;
asr g_295_low60_20_low20_16 g_295_low60_20_low20_16 1;
add r_315_331 r_315_330 u_315_330;
asr r_315_331 r_315_331 1;
add s_315_331 s_315_330 v_315_330;
asr s_315_331 s_315_331 1;
assert
    true
&&
    f_295_low60_20_low20_16 = f_295_low60_20_low20_15,
    u_315_331 = u_315_330,
    v_315_331 = v_315_330,
    g_295_low60_20_low20_16 * (const 64 2) = g_295_low60_20_low20_15 + f_295_low60_20_low20_15,
    r_315_331 * (const 64 2) = r_315_330 + u_315_330,
    s_315_331 * (const 64 2) = s_315_330 + v_315_330
;

assume
    f_295_low60_20_low20_16 = f_295_low60_20_low20_15,
    u_315_331 = u_315_330,
    v_315_331 = v_315_330,
    g_295_low60_20_low20_16 * 2 = g_295_low60_20_low20_15 + f_295_low60_20_low20_15,
    r_315_331 * 2 = r_315_330 + u_315_330,
    s_315_331 * 2 = s_315_330 + v_315_330
&&
    true
;

{
    u_315_331 * f_295_low60_20_low20_0 + v_315_331 * g_295_low60_20_low20_0 = f_295_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_331 * f_295_low60_20_low20_0 + s_315_331 * g_295_low60_20_low20_0 = g_295_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_16 + u_315_331 * (const 64 (2**21)) + v_315_331 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_16 + r_315_331 * (const 64 (2**21)) + s_315_331 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_16,
    f_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_16,
    g_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 331)) <=s delta, delta <=s (const 64 (1 + 2*331)),
    (const 64 (-(2**20))) <=s u_315_331, u_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_331, v_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_331, r_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_331, s_315_331 <=s (const 64 ((2**20))),
    u_315_331 + v_315_331 <=s (const 64 (2**20)),
    u_315_331 - v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 + v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 - v_315_331 <=s (const 64 (2**20)),
    r_315_331 + s_315_331 <=s (const 64 (2**20)),
    r_315_331 - s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 + s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 - s_315_331 <=s (const 64 (2**20)),
    u_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_315_331 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_330_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_15,
sint64 g_295_low60_20_low20_15,
sint64 f_295_low60_20_low20_16,
sint64 g_295_low60_20_low20_16,
sint64 u_315_330,
sint64 v_315_330,
sint64 r_315_330,
sint64 s_315_330,
sint64 u_315_331,
sint64 v_315_331,
sint64 r_315_331,
sint64 s_315_331,
bit ne
)={
    u_315_330 * f_295_low60_20_low20_0 + v_315_330 * g_295_low60_20_low20_0 = f_295_low60_20_low20_15 * (-(2**20)),
    r_315_330 * f_295_low60_20_low20_0 + s_315_330 * g_295_low60_20_low20_0 = g_295_low60_20_low20_15 * (-(2**20))
&&
    u_315_330 * f_295_low60_20_low20_0 + v_315_330 * g_295_low60_20_low20_0 = f_295_low60_20_low20_15 * (const 64 (-(2**20))),
    r_315_330 * f_295_low60_20_low20_0 + s_315_330 * g_295_low60_20_low20_0 = g_295_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_15 + u_315_330 * (const 64 (2**21)) + v_315_330 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_15 + r_315_330 * (const 64 (2**21)) + s_315_330 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_15,
    f_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_15,
    g_295_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 330)) <=s delta, delta <=s (const 64 (1 + 2*330)),
    (const 64 (-(2**20))) <=s u_315_330, u_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_330, v_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_330, r_315_330 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_330, s_315_330 <=s (const 64 ((2**20))),
    u_315_330 + v_315_330 <=s (const 64 (2**20)),
    u_315_330 - v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 + v_315_330 <=s (const 64 (2**20)),
    (const 64 0) - u_315_330 - v_315_330 <=s (const 64 (2**20)),
    r_315_330 + s_315_330 <=s (const 64 (2**20)),
    r_315_330 - s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 + s_315_330 <=s (const 64 (2**20)),
    (const 64 0) - r_315_330 - s_315_330 <=s (const 64 (2**20)),
    u_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_315_330 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_315_330 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise c
assume
g_295_low60_20_low20_15 = 1 (mod 2)
&&
g_295_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_16 g_295_low60_20_low20_15;
mov u_315_331 r_315_330;
mov v_315_331 s_315_330;

subs dc g_295_low60_20_low20_16 g_295_low60_20_low20_15 f_295_low60_20_low20_15;
asr g_295_low60_20_low20_16 g_295_low60_20_low20_16 1;
subs dc r_315_331 r_315_330 u_315_330;
asr r_315_331 r_315_331 1;
subs dc s_315_331 s_315_330 v_315_330;
asr s_315_331 s_315_331 1;
assert
    true
&&
    f_295_low60_20_low20_16 = g_295_low60_20_low20_15,
    u_315_331 = r_315_330,
    v_315_331 = s_315_330,
    g_295_low60_20_low20_16 * (const 64 2) = g_295_low60_20_low20_15 - f_295_low60_20_low20_15,
    r_315_331 * (const 64 2) = r_315_330 - u_315_330,
    s_315_331 * (const 64 2) = s_315_330 - v_315_330
;

assume
    f_295_low60_20_low20_16 = g_295_low60_20_low20_15,
    u_315_331 = r_315_330,
    v_315_331 = s_315_330,
    g_295_low60_20_low20_16 * 2 = g_295_low60_20_low20_15 - f_295_low60_20_low20_15,
    r_315_331 * 2 = r_315_330 - u_315_330,
    s_315_331 * 2 = s_315_330 - v_315_330
&&
    true
;

{
    u_315_331 * f_295_low60_20_low20_0 + v_315_331 * g_295_low60_20_low20_0 = f_295_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_331 * f_295_low60_20_low20_0 + s_315_331 * g_295_low60_20_low20_0 = g_295_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_16 + u_315_331 * (const 64 (2**21)) + v_315_331 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_16 + r_315_331 * (const 64 (2**21)) + s_315_331 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_16,
    f_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_16,
    g_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 331)) <=s delta, delta <=s (const 64 (1 + 2*331)),
    (const 64 (-(2**20))) <=s u_315_331, u_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_331, v_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_331, r_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_331, s_315_331 <=s (const 64 ((2**20))),
    u_315_331 + v_315_331 <=s (const 64 (2**20)),
    u_315_331 - v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 + v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 - v_315_331 <=s (const 64 (2**20)),
    r_315_331 + s_315_331 <=s (const 64 (2**20)),
    r_315_331 - s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 + s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 - s_315_331 <=s (const 64 (2**20)),
    u_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_315_331 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_331_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_16,
sint64 g_295_low60_20_low20_16,
sint64 f_295_low60_20_low20_17,
sint64 g_295_low60_20_low20_17,
sint64 u_315_331,
sint64 v_315_331,
sint64 r_315_331,
sint64 s_315_331,
sint64 u_315_332,
sint64 v_315_332,
sint64 r_315_332,
sint64 s_315_332,
bit ne
)={
    u_315_331 * f_295_low60_20_low20_0 + v_315_331 * g_295_low60_20_low20_0 = f_295_low60_20_low20_16 * (-(2**20)),
    r_315_331 * f_295_low60_20_low20_0 + s_315_331 * g_295_low60_20_low20_0 = g_295_low60_20_low20_16 * (-(2**20))
&&
    u_315_331 * f_295_low60_20_low20_0 + v_315_331 * g_295_low60_20_low20_0 = f_295_low60_20_low20_16 * (const 64 (-(2**20))),
    r_315_331 * f_295_low60_20_low20_0 + s_315_331 * g_295_low60_20_low20_0 = g_295_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_16 + u_315_331 * (const 64 (2**21)) + v_315_331 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_16 + r_315_331 * (const 64 (2**21)) + s_315_331 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_16,
    f_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_16,
    g_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 331)) <=s delta, delta <=s (const 64 (1 + 2*331)),
    (const 64 (-(2**20))) <=s u_315_331, u_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_331, v_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_331, r_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_331, s_315_331 <=s (const 64 ((2**20))),
    u_315_331 + v_315_331 <=s (const 64 (2**20)),
    u_315_331 - v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 + v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 - v_315_331 <=s (const 64 (2**20)),
    r_315_331 + s_315_331 <=s (const 64 (2**20)),
    r_315_331 - s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 + s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 - s_315_331 <=s (const 64 (2**20)),
    u_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_315_331 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise a
assume
g_295_low60_20_low20_16 = 0 (mod 2)
&&
g_295_low60_20_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_17 f_295_low60_20_low20_16;
mov u_315_332 u_315_331;
mov v_315_332 v_315_331;

asr g_295_low60_20_low20_17 g_295_low60_20_low20_16 1;
asr r_315_332 r_315_331 1;
asr s_315_332 s_315_331 1;
assert
    true
&&
    f_295_low60_20_low20_17 = f_295_low60_20_low20_16,
    u_315_332 = u_315_331,
    v_315_332 = v_315_331,
    g_295_low60_20_low20_17 * (const 64 2) = g_295_low60_20_low20_16,
    r_315_332 * (const 64 2) = r_315_331,
    s_315_332 * (const 64 2) = s_315_331
;

assume
    f_295_low60_20_low20_17 = f_295_low60_20_low20_16,
    u_315_332 = u_315_331,
    v_315_332 = v_315_331,
    g_295_low60_20_low20_17 * 2 = g_295_low60_20_low20_16,
    r_315_332 * 2 = r_315_331,
    s_315_332 * 2 = s_315_331
&&
    true
;

{
    u_315_332 * f_295_low60_20_low20_0 + v_315_332 * g_295_low60_20_low20_0 = f_295_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_332 * f_295_low60_20_low20_0 + s_315_332 * g_295_low60_20_low20_0 = g_295_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_17 + u_315_332 * (const 64 (2**21)) + v_315_332 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_17 + r_315_332 * (const 64 (2**21)) + s_315_332 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_17,
    f_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_17,
    g_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 332)) <=s delta, delta <=s (const 64 (1 + 2*332)),
    (const 64 (-(2**20))) <=s u_315_332, u_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_332, v_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_332, r_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_332, s_315_332 <=s (const 64 ((2**20))),
    u_315_332 + v_315_332 <=s (const 64 (2**20)),
    u_315_332 - v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 + v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 - v_315_332 <=s (const 64 (2**20)),
    r_315_332 + s_315_332 <=s (const 64 (2**20)),
    r_315_332 - s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 + s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 - s_315_332 <=s (const 64 (2**20)),
    u_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_315_332 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_331_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_16,
sint64 g_295_low60_20_low20_16,
sint64 f_295_low60_20_low20_17,
sint64 g_295_low60_20_low20_17,
sint64 u_315_331,
sint64 v_315_331,
sint64 r_315_331,
sint64 s_315_331,
sint64 u_315_332,
sint64 v_315_332,
sint64 r_315_332,
sint64 s_315_332,
bit ne
)={
    u_315_331 * f_295_low60_20_low20_0 + v_315_331 * g_295_low60_20_low20_0 = f_295_low60_20_low20_16 * (-(2**20)),
    r_315_331 * f_295_low60_20_low20_0 + s_315_331 * g_295_low60_20_low20_0 = g_295_low60_20_low20_16 * (-(2**20))
&&
    u_315_331 * f_295_low60_20_low20_0 + v_315_331 * g_295_low60_20_low20_0 = f_295_low60_20_low20_16 * (const 64 (-(2**20))),
    r_315_331 * f_295_low60_20_low20_0 + s_315_331 * g_295_low60_20_low20_0 = g_295_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_16 + u_315_331 * (const 64 (2**21)) + v_315_331 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_16 + r_315_331 * (const 64 (2**21)) + s_315_331 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_16,
    f_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_16,
    g_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 331)) <=s delta, delta <=s (const 64 (1 + 2*331)),
    (const 64 (-(2**20))) <=s u_315_331, u_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_331, v_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_331, r_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_331, s_315_331 <=s (const 64 ((2**20))),
    u_315_331 + v_315_331 <=s (const 64 (2**20)),
    u_315_331 - v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 + v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 - v_315_331 <=s (const 64 (2**20)),
    r_315_331 + s_315_331 <=s (const 64 (2**20)),
    r_315_331 - s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 + s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 - s_315_331 <=s (const 64 (2**20)),
    u_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_315_331 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise b
assume
g_295_low60_20_low20_16 = 1 (mod 2)
&&
g_295_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_17 f_295_low60_20_low20_16;
mov u_315_332 u_315_331;
mov v_315_332 v_315_331;

add g_295_low60_20_low20_17 g_295_low60_20_low20_16 f_295_low60_20_low20_16;
asr g_295_low60_20_low20_17 g_295_low60_20_low20_17 1;
add r_315_332 r_315_331 u_315_331;
asr r_315_332 r_315_332 1;
add s_315_332 s_315_331 v_315_331;
asr s_315_332 s_315_332 1;
assert
    true
&&
    f_295_low60_20_low20_17 = f_295_low60_20_low20_16,
    u_315_332 = u_315_331,
    v_315_332 = v_315_331,
    g_295_low60_20_low20_17 * (const 64 2) = g_295_low60_20_low20_16 + f_295_low60_20_low20_16,
    r_315_332 * (const 64 2) = r_315_331 + u_315_331,
    s_315_332 * (const 64 2) = s_315_331 + v_315_331
;

assume
    f_295_low60_20_low20_17 = f_295_low60_20_low20_16,
    u_315_332 = u_315_331,
    v_315_332 = v_315_331,
    g_295_low60_20_low20_17 * 2 = g_295_low60_20_low20_16 + f_295_low60_20_low20_16,
    r_315_332 * 2 = r_315_331 + u_315_331,
    s_315_332 * 2 = s_315_331 + v_315_331
&&
    true
;

{
    u_315_332 * f_295_low60_20_low20_0 + v_315_332 * g_295_low60_20_low20_0 = f_295_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_332 * f_295_low60_20_low20_0 + s_315_332 * g_295_low60_20_low20_0 = g_295_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_17 + u_315_332 * (const 64 (2**21)) + v_315_332 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_17 + r_315_332 * (const 64 (2**21)) + s_315_332 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_17,
    f_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_17,
    g_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 332)) <=s delta, delta <=s (const 64 (1 + 2*332)),
    (const 64 (-(2**20))) <=s u_315_332, u_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_332, v_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_332, r_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_332, s_315_332 <=s (const 64 ((2**20))),
    u_315_332 + v_315_332 <=s (const 64 (2**20)),
    u_315_332 - v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 + v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 - v_315_332 <=s (const 64 (2**20)),
    r_315_332 + s_315_332 <=s (const 64 (2**20)),
    r_315_332 - s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 + s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 - s_315_332 <=s (const 64 (2**20)),
    u_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_315_332 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_331_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_16,
sint64 g_295_low60_20_low20_16,
sint64 f_295_low60_20_low20_17,
sint64 g_295_low60_20_low20_17,
sint64 u_315_331,
sint64 v_315_331,
sint64 r_315_331,
sint64 s_315_331,
sint64 u_315_332,
sint64 v_315_332,
sint64 r_315_332,
sint64 s_315_332,
bit ne
)={
    u_315_331 * f_295_low60_20_low20_0 + v_315_331 * g_295_low60_20_low20_0 = f_295_low60_20_low20_16 * (-(2**20)),
    r_315_331 * f_295_low60_20_low20_0 + s_315_331 * g_295_low60_20_low20_0 = g_295_low60_20_low20_16 * (-(2**20))
&&
    u_315_331 * f_295_low60_20_low20_0 + v_315_331 * g_295_low60_20_low20_0 = f_295_low60_20_low20_16 * (const 64 (-(2**20))),
    r_315_331 * f_295_low60_20_low20_0 + s_315_331 * g_295_low60_20_low20_0 = g_295_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_16 + u_315_331 * (const 64 (2**21)) + v_315_331 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_16 + r_315_331 * (const 64 (2**21)) + s_315_331 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_16,
    f_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_16,
    g_295_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 331)) <=s delta, delta <=s (const 64 (1 + 2*331)),
    (const 64 (-(2**20))) <=s u_315_331, u_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_331, v_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_331, r_315_331 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_331, s_315_331 <=s (const 64 ((2**20))),
    u_315_331 + v_315_331 <=s (const 64 (2**20)),
    u_315_331 - v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 + v_315_331 <=s (const 64 (2**20)),
    (const 64 0) - u_315_331 - v_315_331 <=s (const 64 (2**20)),
    r_315_331 + s_315_331 <=s (const 64 (2**20)),
    r_315_331 - s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 + s_315_331 <=s (const 64 (2**20)),
    (const 64 0) - r_315_331 - s_315_331 <=s (const 64 (2**20)),
    u_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_315_331 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_315_331 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise c
assume
g_295_low60_20_low20_16 = 1 (mod 2)
&&
g_295_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_17 g_295_low60_20_low20_16;
mov u_315_332 r_315_331;
mov v_315_332 s_315_331;

subs dc g_295_low60_20_low20_17 g_295_low60_20_low20_16 f_295_low60_20_low20_16;
asr g_295_low60_20_low20_17 g_295_low60_20_low20_17 1;
subs dc r_315_332 r_315_331 u_315_331;
asr r_315_332 r_315_332 1;
subs dc s_315_332 s_315_331 v_315_331;
asr s_315_332 s_315_332 1;
assert
    true
&&
    f_295_low60_20_low20_17 = g_295_low60_20_low20_16,
    u_315_332 = r_315_331,
    v_315_332 = s_315_331,
    g_295_low60_20_low20_17 * (const 64 2) = g_295_low60_20_low20_16 - f_295_low60_20_low20_16,
    r_315_332 * (const 64 2) = r_315_331 - u_315_331,
    s_315_332 * (const 64 2) = s_315_331 - v_315_331
;

assume
    f_295_low60_20_low20_17 = g_295_low60_20_low20_16,
    u_315_332 = r_315_331,
    v_315_332 = s_315_331,
    g_295_low60_20_low20_17 * 2 = g_295_low60_20_low20_16 - f_295_low60_20_low20_16,
    r_315_332 * 2 = r_315_331 - u_315_331,
    s_315_332 * 2 = s_315_331 - v_315_331
&&
    true
;

{
    u_315_332 * f_295_low60_20_low20_0 + v_315_332 * g_295_low60_20_low20_0 = f_295_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_332 * f_295_low60_20_low20_0 + s_315_332 * g_295_low60_20_low20_0 = g_295_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_17 + u_315_332 * (const 64 (2**21)) + v_315_332 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_17 + r_315_332 * (const 64 (2**21)) + s_315_332 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_17,
    f_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_17,
    g_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 332)) <=s delta, delta <=s (const 64 (1 + 2*332)),
    (const 64 (-(2**20))) <=s u_315_332, u_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_332, v_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_332, r_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_332, s_315_332 <=s (const 64 ((2**20))),
    u_315_332 + v_315_332 <=s (const 64 (2**20)),
    u_315_332 - v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 + v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 - v_315_332 <=s (const 64 (2**20)),
    r_315_332 + s_315_332 <=s (const 64 (2**20)),
    r_315_332 - s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 + s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 - s_315_332 <=s (const 64 (2**20)),
    u_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_315_332 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_332_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_17,
sint64 g_295_low60_20_low20_17,
sint64 f_295_low60_20_low20_18,
sint64 g_295_low60_20_low20_18,
sint64 u_315_332,
sint64 v_315_332,
sint64 r_315_332,
sint64 s_315_332,
sint64 u_315_333,
sint64 v_315_333,
sint64 r_315_333,
sint64 s_315_333,
bit ne
)={
    u_315_332 * f_295_low60_20_low20_0 + v_315_332 * g_295_low60_20_low20_0 = f_295_low60_20_low20_17 * (-(2**20)),
    r_315_332 * f_295_low60_20_low20_0 + s_315_332 * g_295_low60_20_low20_0 = g_295_low60_20_low20_17 * (-(2**20))
&&
    u_315_332 * f_295_low60_20_low20_0 + v_315_332 * g_295_low60_20_low20_0 = f_295_low60_20_low20_17 * (const 64 (-(2**20))),
    r_315_332 * f_295_low60_20_low20_0 + s_315_332 * g_295_low60_20_low20_0 = g_295_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_17 + u_315_332 * (const 64 (2**21)) + v_315_332 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_17 + r_315_332 * (const 64 (2**21)) + s_315_332 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_17,
    f_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_17,
    g_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 332)) <=s delta, delta <=s (const 64 (1 + 2*332)),
    (const 64 (-(2**20))) <=s u_315_332, u_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_332, v_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_332, r_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_332, s_315_332 <=s (const 64 ((2**20))),
    u_315_332 + v_315_332 <=s (const 64 (2**20)),
    u_315_332 - v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 + v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 - v_315_332 <=s (const 64 (2**20)),
    r_315_332 + s_315_332 <=s (const 64 (2**20)),
    r_315_332 - s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 + s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 - s_315_332 <=s (const 64 (2**20)),
    u_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_315_332 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise a
assume
g_295_low60_20_low20_17 = 0 (mod 2)
&&
g_295_low60_20_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_18 f_295_low60_20_low20_17;
mov u_315_333 u_315_332;
mov v_315_333 v_315_332;

asr g_295_low60_20_low20_18 g_295_low60_20_low20_17 1;
asr r_315_333 r_315_332 1;
asr s_315_333 s_315_332 1;
assert
    true
&&
    f_295_low60_20_low20_18 = f_295_low60_20_low20_17,
    u_315_333 = u_315_332,
    v_315_333 = v_315_332,
    g_295_low60_20_low20_18 * (const 64 2) = g_295_low60_20_low20_17,
    r_315_333 * (const 64 2) = r_315_332,
    s_315_333 * (const 64 2) = s_315_332
;

assume
    f_295_low60_20_low20_18 = f_295_low60_20_low20_17,
    u_315_333 = u_315_332,
    v_315_333 = v_315_332,
    g_295_low60_20_low20_18 * 2 = g_295_low60_20_low20_17,
    r_315_333 * 2 = r_315_332,
    s_315_333 * 2 = s_315_332
&&
    true
;

{
    u_315_333 * f_295_low60_20_low20_0 + v_315_333 * g_295_low60_20_low20_0 = f_295_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_333 * f_295_low60_20_low20_0 + s_315_333 * g_295_low60_20_low20_0 = g_295_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_18 + u_315_333 * (const 64 (2**21)) + v_315_333 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_18 + r_315_333 * (const 64 (2**21)) + s_315_333 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_18,
    f_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_18,
    g_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 333)) <=s delta, delta <=s (const 64 (1 + 2*333)),
    (const 64 (-(2**20))) <=s u_315_333, u_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_333, v_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_333, r_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_333, s_315_333 <=s (const 64 ((2**20))),
    u_315_333 + v_315_333 <=s (const 64 (2**20)),
    u_315_333 - v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 + v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 - v_315_333 <=s (const 64 (2**20)),
    r_315_333 + s_315_333 <=s (const 64 (2**20)),
    r_315_333 - s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 + s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 - s_315_333 <=s (const 64 (2**20)),
    u_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_315_333 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_332_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_17,
sint64 g_295_low60_20_low20_17,
sint64 f_295_low60_20_low20_18,
sint64 g_295_low60_20_low20_18,
sint64 u_315_332,
sint64 v_315_332,
sint64 r_315_332,
sint64 s_315_332,
sint64 u_315_333,
sint64 v_315_333,
sint64 r_315_333,
sint64 s_315_333,
bit ne
)={
    u_315_332 * f_295_low60_20_low20_0 + v_315_332 * g_295_low60_20_low20_0 = f_295_low60_20_low20_17 * (-(2**20)),
    r_315_332 * f_295_low60_20_low20_0 + s_315_332 * g_295_low60_20_low20_0 = g_295_low60_20_low20_17 * (-(2**20))
&&
    u_315_332 * f_295_low60_20_low20_0 + v_315_332 * g_295_low60_20_low20_0 = f_295_low60_20_low20_17 * (const 64 (-(2**20))),
    r_315_332 * f_295_low60_20_low20_0 + s_315_332 * g_295_low60_20_low20_0 = g_295_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_17 + u_315_332 * (const 64 (2**21)) + v_315_332 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_17 + r_315_332 * (const 64 (2**21)) + s_315_332 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_17,
    f_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_17,
    g_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 332)) <=s delta, delta <=s (const 64 (1 + 2*332)),
    (const 64 (-(2**20))) <=s u_315_332, u_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_332, v_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_332, r_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_332, s_315_332 <=s (const 64 ((2**20))),
    u_315_332 + v_315_332 <=s (const 64 (2**20)),
    u_315_332 - v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 + v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 - v_315_332 <=s (const 64 (2**20)),
    r_315_332 + s_315_332 <=s (const 64 (2**20)),
    r_315_332 - s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 + s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 - s_315_332 <=s (const 64 (2**20)),
    u_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_315_332 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise b
assume
g_295_low60_20_low20_17 = 1 (mod 2)
&&
g_295_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_18 f_295_low60_20_low20_17;
mov u_315_333 u_315_332;
mov v_315_333 v_315_332;

add g_295_low60_20_low20_18 g_295_low60_20_low20_17 f_295_low60_20_low20_17;
asr g_295_low60_20_low20_18 g_295_low60_20_low20_18 1;
add r_315_333 r_315_332 u_315_332;
asr r_315_333 r_315_333 1;
add s_315_333 s_315_332 v_315_332;
asr s_315_333 s_315_333 1;
assert
    true
&&
    f_295_low60_20_low20_18 = f_295_low60_20_low20_17,
    u_315_333 = u_315_332,
    v_315_333 = v_315_332,
    g_295_low60_20_low20_18 * (const 64 2) = g_295_low60_20_low20_17 + f_295_low60_20_low20_17,
    r_315_333 * (const 64 2) = r_315_332 + u_315_332,
    s_315_333 * (const 64 2) = s_315_332 + v_315_332
;

assume
    f_295_low60_20_low20_18 = f_295_low60_20_low20_17,
    u_315_333 = u_315_332,
    v_315_333 = v_315_332,
    g_295_low60_20_low20_18 * 2 = g_295_low60_20_low20_17 + f_295_low60_20_low20_17,
    r_315_333 * 2 = r_315_332 + u_315_332,
    s_315_333 * 2 = s_315_332 + v_315_332
&&
    true
;

{
    u_315_333 * f_295_low60_20_low20_0 + v_315_333 * g_295_low60_20_low20_0 = f_295_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_333 * f_295_low60_20_low20_0 + s_315_333 * g_295_low60_20_low20_0 = g_295_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_18 + u_315_333 * (const 64 (2**21)) + v_315_333 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_18 + r_315_333 * (const 64 (2**21)) + s_315_333 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_18,
    f_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_18,
    g_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 333)) <=s delta, delta <=s (const 64 (1 + 2*333)),
    (const 64 (-(2**20))) <=s u_315_333, u_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_333, v_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_333, r_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_333, s_315_333 <=s (const 64 ((2**20))),
    u_315_333 + v_315_333 <=s (const 64 (2**20)),
    u_315_333 - v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 + v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 - v_315_333 <=s (const 64 (2**20)),
    r_315_333 + s_315_333 <=s (const 64 (2**20)),
    r_315_333 - s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 + s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 - s_315_333 <=s (const 64 (2**20)),
    u_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_315_333 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_332_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_17,
sint64 g_295_low60_20_low20_17,
sint64 f_295_low60_20_low20_18,
sint64 g_295_low60_20_low20_18,
sint64 u_315_332,
sint64 v_315_332,
sint64 r_315_332,
sint64 s_315_332,
sint64 u_315_333,
sint64 v_315_333,
sint64 r_315_333,
sint64 s_315_333,
bit ne
)={
    u_315_332 * f_295_low60_20_low20_0 + v_315_332 * g_295_low60_20_low20_0 = f_295_low60_20_low20_17 * (-(2**20)),
    r_315_332 * f_295_low60_20_low20_0 + s_315_332 * g_295_low60_20_low20_0 = g_295_low60_20_low20_17 * (-(2**20))
&&
    u_315_332 * f_295_low60_20_low20_0 + v_315_332 * g_295_low60_20_low20_0 = f_295_low60_20_low20_17 * (const 64 (-(2**20))),
    r_315_332 * f_295_low60_20_low20_0 + s_315_332 * g_295_low60_20_low20_0 = g_295_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_17 + u_315_332 * (const 64 (2**21)) + v_315_332 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_17 + r_315_332 * (const 64 (2**21)) + s_315_332 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_17,
    f_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_17,
    g_295_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 332)) <=s delta, delta <=s (const 64 (1 + 2*332)),
    (const 64 (-(2**20))) <=s u_315_332, u_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_332, v_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_332, r_315_332 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_332, s_315_332 <=s (const 64 ((2**20))),
    u_315_332 + v_315_332 <=s (const 64 (2**20)),
    u_315_332 - v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 + v_315_332 <=s (const 64 (2**20)),
    (const 64 0) - u_315_332 - v_315_332 <=s (const 64 (2**20)),
    r_315_332 + s_315_332 <=s (const 64 (2**20)),
    r_315_332 - s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 + s_315_332 <=s (const 64 (2**20)),
    (const 64 0) - r_315_332 - s_315_332 <=s (const 64 (2**20)),
    u_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_315_332 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_315_332 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise c
assume
g_295_low60_20_low20_17 = 1 (mod 2)
&&
g_295_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_18 g_295_low60_20_low20_17;
mov u_315_333 r_315_332;
mov v_315_333 s_315_332;

subs dc g_295_low60_20_low20_18 g_295_low60_20_low20_17 f_295_low60_20_low20_17;
asr g_295_low60_20_low20_18 g_295_low60_20_low20_18 1;
subs dc r_315_333 r_315_332 u_315_332;
asr r_315_333 r_315_333 1;
subs dc s_315_333 s_315_332 v_315_332;
asr s_315_333 s_315_333 1;
assert
    true
&&
    f_295_low60_20_low20_18 = g_295_low60_20_low20_17,
    u_315_333 = r_315_332,
    v_315_333 = s_315_332,
    g_295_low60_20_low20_18 * (const 64 2) = g_295_low60_20_low20_17 - f_295_low60_20_low20_17,
    r_315_333 * (const 64 2) = r_315_332 - u_315_332,
    s_315_333 * (const 64 2) = s_315_332 - v_315_332
;

assume
    f_295_low60_20_low20_18 = g_295_low60_20_low20_17,
    u_315_333 = r_315_332,
    v_315_333 = s_315_332,
    g_295_low60_20_low20_18 * 2 = g_295_low60_20_low20_17 - f_295_low60_20_low20_17,
    r_315_333 * 2 = r_315_332 - u_315_332,
    s_315_333 * 2 = s_315_332 - v_315_332
&&
    true
;

{
    u_315_333 * f_295_low60_20_low20_0 + v_315_333 * g_295_low60_20_low20_0 = f_295_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_333 * f_295_low60_20_low20_0 + s_315_333 * g_295_low60_20_low20_0 = g_295_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_18 + u_315_333 * (const 64 (2**21)) + v_315_333 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_18 + r_315_333 * (const 64 (2**21)) + s_315_333 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_18,
    f_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_18,
    g_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 333)) <=s delta, delta <=s (const 64 (1 + 2*333)),
    (const 64 (-(2**20))) <=s u_315_333, u_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_333, v_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_333, r_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_333, s_315_333 <=s (const 64 ((2**20))),
    u_315_333 + v_315_333 <=s (const 64 (2**20)),
    u_315_333 - v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 + v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 - v_315_333 <=s (const 64 (2**20)),
    r_315_333 + s_315_333 <=s (const 64 (2**20)),
    r_315_333 - s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 + s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 - s_315_333 <=s (const 64 (2**20)),
    u_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_315_333 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_333_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_18,
sint64 g_295_low60_20_low20_18,
sint64 f_295_low60_20_low20_19,
sint64 g_295_low60_20_low20_19,
sint64 u_315_333,
sint64 v_315_333,
sint64 r_315_333,
sint64 s_315_333,
sint64 u_315_334,
sint64 v_315_334,
sint64 r_315_334,
sint64 s_315_334,
bit ne
)={
    u_315_333 * f_295_low60_20_low20_0 + v_315_333 * g_295_low60_20_low20_0 = f_295_low60_20_low20_18 * (-(2**20)),
    r_315_333 * f_295_low60_20_low20_0 + s_315_333 * g_295_low60_20_low20_0 = g_295_low60_20_low20_18 * (-(2**20))
&&
    u_315_333 * f_295_low60_20_low20_0 + v_315_333 * g_295_low60_20_low20_0 = f_295_low60_20_low20_18 * (const 64 (-(2**20))),
    r_315_333 * f_295_low60_20_low20_0 + s_315_333 * g_295_low60_20_low20_0 = g_295_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_18 + u_315_333 * (const 64 (2**21)) + v_315_333 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_18 + r_315_333 * (const 64 (2**21)) + s_315_333 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_18,
    f_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_18,
    g_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 333)) <=s delta, delta <=s (const 64 (1 + 2*333)),
    (const 64 (-(2**20))) <=s u_315_333, u_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_333, v_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_333, r_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_333, s_315_333 <=s (const 64 ((2**20))),
    u_315_333 + v_315_333 <=s (const 64 (2**20)),
    u_315_333 - v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 + v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 - v_315_333 <=s (const 64 (2**20)),
    r_315_333 + s_315_333 <=s (const 64 (2**20)),
    r_315_333 - s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 + s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 - s_315_333 <=s (const 64 (2**20)),
    u_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_315_333 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise a
assume
g_295_low60_20_low20_18 = 0 (mod 2)
&&
g_295_low60_20_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_19 f_295_low60_20_low20_18;
mov u_315_334 u_315_333;
mov v_315_334 v_315_333;

asr g_295_low60_20_low20_19 g_295_low60_20_low20_18 1;
asr r_315_334 r_315_333 1;
asr s_315_334 s_315_333 1;
assert
    true
&&
    f_295_low60_20_low20_19 = f_295_low60_20_low20_18,
    u_315_334 = u_315_333,
    v_315_334 = v_315_333,
    g_295_low60_20_low20_19 * (const 64 2) = g_295_low60_20_low20_18,
    r_315_334 * (const 64 2) = r_315_333,
    s_315_334 * (const 64 2) = s_315_333
;

assume
    f_295_low60_20_low20_19 = f_295_low60_20_low20_18,
    u_315_334 = u_315_333,
    v_315_334 = v_315_333,
    g_295_low60_20_low20_19 * 2 = g_295_low60_20_low20_18,
    r_315_334 * 2 = r_315_333,
    s_315_334 * 2 = s_315_333
&&
    true
;

{
    u_315_334 * f_295_low60_20_low20_0 + v_315_334 * g_295_low60_20_low20_0 = f_295_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_334 * f_295_low60_20_low20_0 + s_315_334 * g_295_low60_20_low20_0 = g_295_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_19 + u_315_334 * (const 64 (2**21)) + v_315_334 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_19 + r_315_334 * (const 64 (2**21)) + s_315_334 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_19,
    f_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_19,
    g_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 334)) <=s delta, delta <=s (const 64 (1 + 2*334)),
    (const 64 (-(2**20))) <=s u_315_334, u_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_334, v_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_334, r_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_334, s_315_334 <=s (const 64 ((2**20))),
    u_315_334 + v_315_334 <=s (const 64 (2**20)),
    u_315_334 - v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 + v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 - v_315_334 <=s (const 64 (2**20)),
    r_315_334 + s_315_334 <=s (const 64 (2**20)),
    r_315_334 - s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 + s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 - s_315_334 <=s (const 64 (2**20)),
    u_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_315_334 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_333_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_18,
sint64 g_295_low60_20_low20_18,
sint64 f_295_low60_20_low20_19,
sint64 g_295_low60_20_low20_19,
sint64 u_315_333,
sint64 v_315_333,
sint64 r_315_333,
sint64 s_315_333,
sint64 u_315_334,
sint64 v_315_334,
sint64 r_315_334,
sint64 s_315_334,
bit ne
)={
    u_315_333 * f_295_low60_20_low20_0 + v_315_333 * g_295_low60_20_low20_0 = f_295_low60_20_low20_18 * (-(2**20)),
    r_315_333 * f_295_low60_20_low20_0 + s_315_333 * g_295_low60_20_low20_0 = g_295_low60_20_low20_18 * (-(2**20))
&&
    u_315_333 * f_295_low60_20_low20_0 + v_315_333 * g_295_low60_20_low20_0 = f_295_low60_20_low20_18 * (const 64 (-(2**20))),
    r_315_333 * f_295_low60_20_low20_0 + s_315_333 * g_295_low60_20_low20_0 = g_295_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_18 + u_315_333 * (const 64 (2**21)) + v_315_333 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_18 + r_315_333 * (const 64 (2**21)) + s_315_333 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_18,
    f_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_18,
    g_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 333)) <=s delta, delta <=s (const 64 (1 + 2*333)),
    (const 64 (-(2**20))) <=s u_315_333, u_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_333, v_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_333, r_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_333, s_315_333 <=s (const 64 ((2**20))),
    u_315_333 + v_315_333 <=s (const 64 (2**20)),
    u_315_333 - v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 + v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 - v_315_333 <=s (const 64 (2**20)),
    r_315_333 + s_315_333 <=s (const 64 (2**20)),
    r_315_333 - s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 + s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 - s_315_333 <=s (const 64 (2**20)),
    u_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_315_333 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise b
assume
g_295_low60_20_low20_18 = 1 (mod 2)
&&
g_295_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_19 f_295_low60_20_low20_18;
mov u_315_334 u_315_333;
mov v_315_334 v_315_333;

add g_295_low60_20_low20_19 g_295_low60_20_low20_18 f_295_low60_20_low20_18;
asr g_295_low60_20_low20_19 g_295_low60_20_low20_19 1;
add r_315_334 r_315_333 u_315_333;
asr r_315_334 r_315_334 1;
add s_315_334 s_315_333 v_315_333;
asr s_315_334 s_315_334 1;
assert
    true
&&
    f_295_low60_20_low20_19 = f_295_low60_20_low20_18,
    u_315_334 = u_315_333,
    v_315_334 = v_315_333,
    g_295_low60_20_low20_19 * (const 64 2) = g_295_low60_20_low20_18 + f_295_low60_20_low20_18,
    r_315_334 * (const 64 2) = r_315_333 + u_315_333,
    s_315_334 * (const 64 2) = s_315_333 + v_315_333
;

assume
    f_295_low60_20_low20_19 = f_295_low60_20_low20_18,
    u_315_334 = u_315_333,
    v_315_334 = v_315_333,
    g_295_low60_20_low20_19 * 2 = g_295_low60_20_low20_18 + f_295_low60_20_low20_18,
    r_315_334 * 2 = r_315_333 + u_315_333,
    s_315_334 * 2 = s_315_333 + v_315_333
&&
    true
;

{
    u_315_334 * f_295_low60_20_low20_0 + v_315_334 * g_295_low60_20_low20_0 = f_295_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_334 * f_295_low60_20_low20_0 + s_315_334 * g_295_low60_20_low20_0 = g_295_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_19 + u_315_334 * (const 64 (2**21)) + v_315_334 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_19 + r_315_334 * (const 64 (2**21)) + s_315_334 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_19,
    f_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_19,
    g_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 334)) <=s delta, delta <=s (const 64 (1 + 2*334)),
    (const 64 (-(2**20))) <=s u_315_334, u_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_334, v_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_334, r_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_334, s_315_334 <=s (const 64 ((2**20))),
    u_315_334 + v_315_334 <=s (const 64 (2**20)),
    u_315_334 - v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 + v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 - v_315_334 <=s (const 64 (2**20)),
    r_315_334 + s_315_334 <=s (const 64 (2**20)),
    r_315_334 - s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 + s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 - s_315_334 <=s (const 64 (2**20)),
    u_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_315_334 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_333_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_18,
sint64 g_295_low60_20_low20_18,
sint64 f_295_low60_20_low20_19,
sint64 g_295_low60_20_low20_19,
sint64 u_315_333,
sint64 v_315_333,
sint64 r_315_333,
sint64 s_315_333,
sint64 u_315_334,
sint64 v_315_334,
sint64 r_315_334,
sint64 s_315_334,
bit ne
)={
    u_315_333 * f_295_low60_20_low20_0 + v_315_333 * g_295_low60_20_low20_0 = f_295_low60_20_low20_18 * (-(2**20)),
    r_315_333 * f_295_low60_20_low20_0 + s_315_333 * g_295_low60_20_low20_0 = g_295_low60_20_low20_18 * (-(2**20))
&&
    u_315_333 * f_295_low60_20_low20_0 + v_315_333 * g_295_low60_20_low20_0 = f_295_low60_20_low20_18 * (const 64 (-(2**20))),
    r_315_333 * f_295_low60_20_low20_0 + s_315_333 * g_295_low60_20_low20_0 = g_295_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_18 + u_315_333 * (const 64 (2**21)) + v_315_333 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_18 + r_315_333 * (const 64 (2**21)) + s_315_333 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_18,
    f_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_18,
    g_295_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 333)) <=s delta, delta <=s (const 64 (1 + 2*333)),
    (const 64 (-(2**20))) <=s u_315_333, u_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_333, v_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_333, r_315_333 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_333, s_315_333 <=s (const 64 ((2**20))),
    u_315_333 + v_315_333 <=s (const 64 (2**20)),
    u_315_333 - v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 + v_315_333 <=s (const 64 (2**20)),
    (const 64 0) - u_315_333 - v_315_333 <=s (const 64 (2**20)),
    r_315_333 + s_315_333 <=s (const 64 (2**20)),
    r_315_333 - s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 + s_315_333 <=s (const 64 (2**20)),
    (const 64 0) - r_315_333 - s_315_333 <=s (const 64 (2**20)),
    u_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_315_333 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_315_333 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise c
assume
g_295_low60_20_low20_18 = 1 (mod 2)
&&
g_295_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_19 g_295_low60_20_low20_18;
mov u_315_334 r_315_333;
mov v_315_334 s_315_333;

subs dc g_295_low60_20_low20_19 g_295_low60_20_low20_18 f_295_low60_20_low20_18;
asr g_295_low60_20_low20_19 g_295_low60_20_low20_19 1;
subs dc r_315_334 r_315_333 u_315_333;
asr r_315_334 r_315_334 1;
subs dc s_315_334 s_315_333 v_315_333;
asr s_315_334 s_315_334 1;
assert
    true
&&
    f_295_low60_20_low20_19 = g_295_low60_20_low20_18,
    u_315_334 = r_315_333,
    v_315_334 = s_315_333,
    g_295_low60_20_low20_19 * (const 64 2) = g_295_low60_20_low20_18 - f_295_low60_20_low20_18,
    r_315_334 * (const 64 2) = r_315_333 - u_315_333,
    s_315_334 * (const 64 2) = s_315_333 - v_315_333
;

assume
    f_295_low60_20_low20_19 = g_295_low60_20_low20_18,
    u_315_334 = r_315_333,
    v_315_334 = s_315_333,
    g_295_low60_20_low20_19 * 2 = g_295_low60_20_low20_18 - f_295_low60_20_low20_18,
    r_315_334 * 2 = r_315_333 - u_315_333,
    s_315_334 * 2 = s_315_333 - v_315_333
&&
    true
;

{
    u_315_334 * f_295_low60_20_low20_0 + v_315_334 * g_295_low60_20_low20_0 = f_295_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_334 * f_295_low60_20_low20_0 + s_315_334 * g_295_low60_20_low20_0 = g_295_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_19 + u_315_334 * (const 64 (2**21)) + v_315_334 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_19 + r_315_334 * (const 64 (2**21)) + s_315_334 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_19,
    f_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_19,
    g_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 334)) <=s delta, delta <=s (const 64 (1 + 2*334)),
    (const 64 (-(2**20))) <=s u_315_334, u_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_334, v_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_334, r_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_334, s_315_334 <=s (const 64 ((2**20))),
    u_315_334 + v_315_334 <=s (const 64 (2**20)),
    u_315_334 - v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 + v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 - v_315_334 <=s (const 64 (2**20)),
    r_315_334 + s_315_334 <=s (const 64 (2**20)),
    r_315_334 - s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 + s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 - s_315_334 <=s (const 64 (2**20)),
    u_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_315_334 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_334_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_19,
sint64 g_295_low60_20_low20_19,
sint64 f_295_low60_20_low20_20,
sint64 g_295_low60_20_low20_20,
sint64 u_315_334,
sint64 v_315_334,
sint64 r_315_334,
sint64 s_315_334,
sint64 u_315_335,
sint64 v_315_335,
sint64 r_315_335,
sint64 s_315_335,
bit ne
)={
    u_315_334 * f_295_low60_20_low20_0 + v_315_334 * g_295_low60_20_low20_0 = f_295_low60_20_low20_19 * (-(2**20)),
    r_315_334 * f_295_low60_20_low20_0 + s_315_334 * g_295_low60_20_low20_0 = g_295_low60_20_low20_19 * (-(2**20))
&&
    u_315_334 * f_295_low60_20_low20_0 + v_315_334 * g_295_low60_20_low20_0 = f_295_low60_20_low20_19 * (const 64 (-(2**20))),
    r_315_334 * f_295_low60_20_low20_0 + s_315_334 * g_295_low60_20_low20_0 = g_295_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_19 + u_315_334 * (const 64 (2**21)) + v_315_334 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_19 + r_315_334 * (const 64 (2**21)) + s_315_334 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_19,
    f_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_19,
    g_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 334)) <=s delta, delta <=s (const 64 (1 + 2*334)),
    (const 64 (-(2**20))) <=s u_315_334, u_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_334, v_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_334, r_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_334, s_315_334 <=s (const 64 ((2**20))),
    u_315_334 + v_315_334 <=s (const 64 (2**20)),
    u_315_334 - v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 + v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 - v_315_334 <=s (const 64 (2**20)),
    r_315_334 + s_315_334 <=s (const 64 (2**20)),
    r_315_334 - s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 + s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 - s_315_334 <=s (const 64 (2**20)),
    u_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_315_334 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise a
assume
g_295_low60_20_low20_19 = 0 (mod 2)
&&
g_295_low60_20_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_295_low60_20_low20_20 f_295_low60_20_low20_19;
mov u_315_335 u_315_334;
mov v_315_335 v_315_334;

asr g_295_low60_20_low20_20 g_295_low60_20_low20_19 1;
asr r_315_335 r_315_334 1;
asr s_315_335 s_315_334 1;
assert
    true
&&
    f_295_low60_20_low20_20 = f_295_low60_20_low20_19,
    u_315_335 = u_315_334,
    v_315_335 = v_315_334,
    g_295_low60_20_low20_20 * (const 64 2) = g_295_low60_20_low20_19,
    r_315_335 * (const 64 2) = r_315_334,
    s_315_335 * (const 64 2) = s_315_334
;

assume
    f_295_low60_20_low20_20 = f_295_low60_20_low20_19,
    u_315_335 = u_315_334,
    v_315_335 = v_315_334,
    g_295_low60_20_low20_20 * 2 = g_295_low60_20_low20_19,
    r_315_335 * 2 = r_315_334,
    s_315_335 * 2 = s_315_334
&&
    true
;

{
    u_315_335 * f_295_low60_20_low20_0 + v_315_335 * g_295_low60_20_low20_0 = f_295_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_335 * f_295_low60_20_low20_0 + s_315_335 * g_295_low60_20_low20_0 = g_295_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_20 + u_315_335 * (const 64 (2**21)) + v_315_335 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_20 + r_315_335 * (const 64 (2**21)) + s_315_335 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_20,
    f_295_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_20,
    g_295_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 335)) <=s delta, delta <=s (const 64 (1 + 2*335)),
    (const 64 (-(2**20))) <=s u_315_335, u_315_335 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_335, v_315_335 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_335, r_315_335 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_335, s_315_335 <=s (const 64 ((2**20))),
    u_315_335 + v_315_335 <=s (const 64 (2**20)),
    u_315_335 - v_315_335 <=s (const 64 (2**20)),
    (const 64 0) - u_315_335 + v_315_335 <=s (const 64 (2**20)),
    (const 64 0) - u_315_335 - v_315_335 <=s (const 64 (2**20)),
    r_315_335 + s_315_335 <=s (const 64 (2**20)),
    r_315_335 - s_315_335 <=s (const 64 (2**20)),
    (const 64 0) - r_315_335 + s_315_335 <=s (const 64 (2**20)),
    (const 64 0) - r_315_335 - s_315_335 <=s (const 64 (2**20)),
    u_315_335 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_315_335 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_315_335 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_315_335 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_334_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_19,
sint64 g_295_low60_20_low20_19,
sint64 f_295_low60_20_low20_20,
sint64 g_295_low60_20_low20_20,
sint64 u_315_334,
sint64 v_315_334,
sint64 r_315_334,
sint64 s_315_334,
sint64 u_315_335,
sint64 v_315_335,
sint64 r_315_335,
sint64 s_315_335,
bit ne
)={
    u_315_334 * f_295_low60_20_low20_0 + v_315_334 * g_295_low60_20_low20_0 = f_295_low60_20_low20_19 * (-(2**20)),
    r_315_334 * f_295_low60_20_low20_0 + s_315_334 * g_295_low60_20_low20_0 = g_295_low60_20_low20_19 * (-(2**20))
&&
    u_315_334 * f_295_low60_20_low20_0 + v_315_334 * g_295_low60_20_low20_0 = f_295_low60_20_low20_19 * (const 64 (-(2**20))),
    r_315_334 * f_295_low60_20_low20_0 + s_315_334 * g_295_low60_20_low20_0 = g_295_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_19 + u_315_334 * (const 64 (2**21)) + v_315_334 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_19 + r_315_334 * (const 64 (2**21)) + s_315_334 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_19,
    f_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_19,
    g_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 334)) <=s delta, delta <=s (const 64 (1 + 2*334)),
    (const 64 (-(2**20))) <=s u_315_334, u_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_334, v_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_334, r_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_334, s_315_334 <=s (const 64 ((2**20))),
    u_315_334 + v_315_334 <=s (const 64 (2**20)),
    u_315_334 - v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 + v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 - v_315_334 <=s (const 64 (2**20)),
    r_315_334 + s_315_334 <=s (const 64 (2**20)),
    r_315_334 - s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 + s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 - s_315_334 <=s (const 64 (2**20)),
    u_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_315_334 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise b
assume
g_295_low60_20_low20_19 = 1 (mod 2)
&&
g_295_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_20 f_295_low60_20_low20_19;
mov u_315_335 u_315_334;
mov v_315_335 v_315_334;

add g_295_low60_20_low20_20 g_295_low60_20_low20_19 f_295_low60_20_low20_19;
asr g_295_low60_20_low20_20 g_295_low60_20_low20_20 1;
add r_315_335 r_315_334 u_315_334;
asr r_315_335 r_315_335 1;
add s_315_335 s_315_334 v_315_334;
asr s_315_335 s_315_335 1;
assert
    true
&&
    f_295_low60_20_low20_20 = f_295_low60_20_low20_19,
    u_315_335 = u_315_334,
    v_315_335 = v_315_334,
    g_295_low60_20_low20_20 * (const 64 2) = g_295_low60_20_low20_19 + f_295_low60_20_low20_19,
    r_315_335 * (const 64 2) = r_315_334 + u_315_334,
    s_315_335 * (const 64 2) = s_315_334 + v_315_334
;

assume
    f_295_low60_20_low20_20 = f_295_low60_20_low20_19,
    u_315_335 = u_315_334,
    v_315_335 = v_315_334,
    g_295_low60_20_low20_20 * 2 = g_295_low60_20_low20_19 + f_295_low60_20_low20_19,
    r_315_335 * 2 = r_315_334 + u_315_334,
    s_315_335 * 2 = s_315_334 + v_315_334
&&
    true
;

{
    u_315_335 * f_295_low60_20_low20_0 + v_315_335 * g_295_low60_20_low20_0 = f_295_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_335 * f_295_low60_20_low20_0 + s_315_335 * g_295_low60_20_low20_0 = g_295_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_20 + u_315_335 * (const 64 (2**21)) + v_315_335 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_20 + r_315_335 * (const 64 (2**21)) + s_315_335 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_20,
    f_295_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_20,
    g_295_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 335)) <=s delta, delta <=s (const 64 (1 + 2*335)),
    (const 64 (-(2**20))) <=s u_315_335, u_315_335 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_335, v_315_335 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_335, r_315_335 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_335, s_315_335 <=s (const 64 ((2**20))),
    u_315_335 + v_315_335 <=s (const 64 (2**20)),
    u_315_335 - v_315_335 <=s (const 64 (2**20)),
    (const 64 0) - u_315_335 + v_315_335 <=s (const 64 (2**20)),
    (const 64 0) - u_315_335 - v_315_335 <=s (const 64 (2**20)),
    r_315_335 + s_315_335 <=s (const 64 (2**20)),
    r_315_335 - s_315_335 <=s (const 64 (2**20)),
    (const 64 0) - r_315_335 + s_315_335 <=s (const 64 (2**20)),
    (const 64 0) - r_315_335 - s_315_335 <=s (const 64 (2**20)),
    u_315_335 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_315_335 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_315_335 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_315_335 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_334_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_19,
sint64 g_295_low60_20_low20_19,
sint64 f_295_low60_20_low20_20,
sint64 g_295_low60_20_low20_20,
sint64 u_315_334,
sint64 v_315_334,
sint64 r_315_334,
sint64 s_315_334,
sint64 u_315_335,
sint64 v_315_335,
sint64 r_315_335,
sint64 s_315_335,
bit ne
)={
    u_315_334 * f_295_low60_20_low20_0 + v_315_334 * g_295_low60_20_low20_0 = f_295_low60_20_low20_19 * (-(2**20)),
    r_315_334 * f_295_low60_20_low20_0 + s_315_334 * g_295_low60_20_low20_0 = g_295_low60_20_low20_19 * (-(2**20))
&&
    u_315_334 * f_295_low60_20_low20_0 + v_315_334 * g_295_low60_20_low20_0 = f_295_low60_20_low20_19 * (const 64 (-(2**20))),
    r_315_334 * f_295_low60_20_low20_0 + s_315_334 * g_295_low60_20_low20_0 = g_295_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_19 + u_315_334 * (const 64 (2**21)) + v_315_334 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_19 + r_315_334 * (const 64 (2**21)) + s_315_334 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_295_low60_20_low20_19,
    f_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_19,
    g_295_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 334)) <=s delta, delta <=s (const 64 (1 + 2*334)),
    (const 64 (-(2**20))) <=s u_315_334, u_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_334, v_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_334, r_315_334 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_334, s_315_334 <=s (const 64 ((2**20))),
    u_315_334 + v_315_334 <=s (const 64 (2**20)),
    u_315_334 - v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 + v_315_334 <=s (const 64 (2**20)),
    (const 64 0) - u_315_334 - v_315_334 <=s (const 64 (2**20)),
    r_315_334 + s_315_334 <=s (const 64 (2**20)),
    r_315_334 - s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 + s_315_334 <=s (const 64 (2**20)),
    (const 64 0) - r_315_334 - s_315_334 <=s (const 64 (2**20)),
    u_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_315_334 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_315_334 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise c
assume
g_295_low60_20_low20_19 = 1 (mod 2)
&&
g_295_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_295_low60_20_low20_20 g_295_low60_20_low20_19;
mov u_315_335 r_315_334;
mov v_315_335 s_315_334;

subs dc g_295_low60_20_low20_20 g_295_low60_20_low20_19 f_295_low60_20_low20_19;
asr g_295_low60_20_low20_20 g_295_low60_20_low20_20 1;
subs dc r_315_335 r_315_334 u_315_334;
asr r_315_335 r_315_335 1;
subs dc s_315_335 s_315_334 v_315_334;
asr s_315_335 s_315_335 1;
assert
    true
&&
    f_295_low60_20_low20_20 = g_295_low60_20_low20_19,
    u_315_335 = r_315_334,
    v_315_335 = s_315_334,
    g_295_low60_20_low20_20 * (const 64 2) = g_295_low60_20_low20_19 - f_295_low60_20_low20_19,
    r_315_335 * (const 64 2) = r_315_334 - u_315_334,
    s_315_335 * (const 64 2) = s_315_334 - v_315_334
;

assume
    f_295_low60_20_low20_20 = g_295_low60_20_low20_19,
    u_315_335 = r_315_334,
    v_315_335 = s_315_334,
    g_295_low60_20_low20_20 * 2 = g_295_low60_20_low20_19 - f_295_low60_20_low20_19,
    r_315_335 * 2 = r_315_334 - u_315_334,
    s_315_335 * 2 = s_315_334 - v_315_334
&&
    true
;

{
    u_315_335 * f_295_low60_20_low20_0 + v_315_335 * g_295_low60_20_low20_0 = f_295_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_335 * f_295_low60_20_low20_0 + s_315_335 * g_295_low60_20_low20_0 = g_295_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_20 + u_315_335 * (const 64 (2**21)) + v_315_335 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_20 + r_315_335 * (const 64 (2**21)) + s_315_335 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_20,
    f_295_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_20,
    g_295_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 335)) <=s delta, delta <=s (const 64 (1 + 2*335)),
    (const 64 (-(2**20))) <=s u_315_335, u_315_335 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_335, v_315_335 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_335, r_315_335 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_335, s_315_335 <=s (const 64 ((2**20))),
    u_315_335 + v_315_335 <=s (const 64 (2**20)),
    u_315_335 - v_315_335 <=s (const 64 (2**20)),
    (const 64 0) - u_315_335 + v_315_335 <=s (const 64 (2**20)),
    (const 64 0) - u_315_335 - v_315_335 <=s (const 64 (2**20)),
    r_315_335 + s_315_335 <=s (const 64 (2**20)),
    r_315_335 - s_315_335 <=s (const 64 (2**20)),
    (const 64 0) - r_315_335 + s_315_335 <=s (const 64 (2**20)),
    (const 64 0) - r_315_335 - s_315_335 <=s (const 64 (2**20)),
    u_315_335 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_315_335 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_315_335 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_315_335 = (const 64 0) (mod (const 64 (2**(20-20))))
}

