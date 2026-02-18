proc divstep_040_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_1,
sint64 g_0_low60_40_low20_1,
sint64 u_40_40,
sint64 v_40_40,
sint64 r_40_40,
sint64 s_40_40,
sint64 u_40_41,
sint64 v_40_41,
sint64 r_40_41,
sint64 s_40_41,
bit ne
)={
    u_40_40 * f_0_low60_40_low20_0 + v_40_40 * g_0_low60_40_low20_0 = f_0_low60_40_low20_0 * (-(2**20)),
    r_40_40 * f_0_low60_40_low20_0 + s_40_40 * g_0_low60_40_low20_0 = g_0_low60_40_low20_0 * (-(2**20))
&&
    u_40_40 * f_0_low60_40_low20_0 + v_40_40 * g_0_low60_40_low20_0 = f_0_low60_40_low20_0 * (const 64 (-(2**20))),
    r_40_40 * f_0_low60_40_low20_0 + s_40_40 * g_0_low60_40_low20_0 = g_0_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_0 + u_40_40 * (const 64 (2**21)) + v_40_40 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_0 + r_40_40 * (const 64 (2**21)) + s_40_40 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 40)) <=s delta, delta <=s (const 64 (1 + 2*40)),
    u_40_40 = (const 64 (-(2**20))),
    v_40_40 = (const 64 (0)),
    r_40_40 = (const 64 (0)),
    s_40_40 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise a
assume
g_0_low60_40_low20_0 = 0 (mod 2)
&&
g_0_low60_40_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_0_low60_40_low20_1 f_0_low60_40_low20_0;
mov u_40_41 u_40_40;
mov v_40_41 v_40_40;

asr g_0_low60_40_low20_1 g_0_low60_40_low20_0 1;
asr r_40_41 r_40_40 1;
asr s_40_41 s_40_40 1;
assert
    true
&&
    f_0_low60_40_low20_1 = f_0_low60_40_low20_0,
    u_40_41 = u_40_40,
    v_40_41 = v_40_40,
    g_0_low60_40_low20_1 * (const 64 2) = g_0_low60_40_low20_0,
    r_40_41 * (const 64 2) = r_40_40,
    s_40_41 * (const 64 2) = s_40_40
;

assume
    f_0_low60_40_low20_1 = f_0_low60_40_low20_0,
    u_40_41 = u_40_40,
    v_40_41 = v_40_40,
    g_0_low60_40_low20_1 * 2 = g_0_low60_40_low20_0,
    r_40_41 * 2 = r_40_40,
    s_40_41 * 2 = s_40_40
&&
    true
;

{
    u_40_41 * f_0_low60_40_low20_0 + v_40_41 * g_0_low60_40_low20_0 = f_0_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_41 * f_0_low60_40_low20_0 + s_40_41 * g_0_low60_40_low20_0 = g_0_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_1 + u_40_41 * (const 64 (2**21)) + v_40_41 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_1 + r_40_41 * (const 64 (2**21)) + s_40_41 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_1,
    f_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_1,
    g_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 41)) <=s delta, delta <=s (const 64 (1 + 2*41)),
    (const 64 (-(2**20))) <=s u_40_41, u_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_41, v_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_41, r_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_41, s_40_41 <=s (const 64 ((2**20)-1)),
    u_40_41 + v_40_41 <=s (const 64 (2**20)),
    u_40_41 - v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 + v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 - v_40_41 <=s (const 64 (2**20)),
    r_40_41 + s_40_41 <=s (const 64 (2**20)),
    r_40_41 - s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 + s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 - s_40_41 <=s (const 64 (2**20)),
    u_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_40_41 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_040_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_1,
sint64 g_0_low60_40_low20_1,
sint64 u_40_40,
sint64 v_40_40,
sint64 r_40_40,
sint64 s_40_40,
sint64 u_40_41,
sint64 v_40_41,
sint64 r_40_41,
sint64 s_40_41,
bit ne
)={
    u_40_40 * f_0_low60_40_low20_0 + v_40_40 * g_0_low60_40_low20_0 = f_0_low60_40_low20_0 * (-(2**20)),
    r_40_40 * f_0_low60_40_low20_0 + s_40_40 * g_0_low60_40_low20_0 = g_0_low60_40_low20_0 * (-(2**20))
&&
    u_40_40 * f_0_low60_40_low20_0 + v_40_40 * g_0_low60_40_low20_0 = f_0_low60_40_low20_0 * (const 64 (-(2**20))),
    r_40_40 * f_0_low60_40_low20_0 + s_40_40 * g_0_low60_40_low20_0 = g_0_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_0 + u_40_40 * (const 64 (2**21)) + v_40_40 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_0 + r_40_40 * (const 64 (2**21)) + s_40_40 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 40)) <=s delta, delta <=s (const 64 (1 + 2*40)),
    u_40_40 = (const 64 (-(2**20))),
    v_40_40 = (const 64 (0)),
    r_40_40 = (const 64 (0)),
    s_40_40 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise b
assume
g_0_low60_40_low20_0 = 1 (mod 2)
&&
g_0_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_1 f_0_low60_40_low20_0;
mov u_40_41 u_40_40;
mov v_40_41 v_40_40;

add g_0_low60_40_low20_1 g_0_low60_40_low20_0 f_0_low60_40_low20_0;
asr g_0_low60_40_low20_1 g_0_low60_40_low20_1 1;
add r_40_41 r_40_40 u_40_40;
asr r_40_41 r_40_41 1;
add s_40_41 s_40_40 v_40_40;
asr s_40_41 s_40_41 1;
assert
    true
&&
    f_0_low60_40_low20_1 = f_0_low60_40_low20_0,
    u_40_41 = u_40_40,
    v_40_41 = v_40_40,
    g_0_low60_40_low20_1 * (const 64 2) = g_0_low60_40_low20_0 + f_0_low60_40_low20_0,
    r_40_41 * (const 64 2) = r_40_40 + u_40_40,
    s_40_41 * (const 64 2) = s_40_40 + v_40_40
;

assume
    f_0_low60_40_low20_1 = f_0_low60_40_low20_0,
    u_40_41 = u_40_40,
    v_40_41 = v_40_40,
    g_0_low60_40_low20_1 * 2 = g_0_low60_40_low20_0 + f_0_low60_40_low20_0,
    r_40_41 * 2 = r_40_40 + u_40_40,
    s_40_41 * 2 = s_40_40 + v_40_40
&&
    true
;

{
    u_40_41 * f_0_low60_40_low20_0 + v_40_41 * g_0_low60_40_low20_0 = f_0_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_41 * f_0_low60_40_low20_0 + s_40_41 * g_0_low60_40_low20_0 = g_0_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_1 + u_40_41 * (const 64 (2**21)) + v_40_41 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_1 + r_40_41 * (const 64 (2**21)) + s_40_41 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_1,
    f_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_1,
    g_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 41)) <=s delta, delta <=s (const 64 (1 + 2*41)),
    (const 64 (-(2**20))) <=s u_40_41, u_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_41, v_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_41, r_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_41, s_40_41 <=s (const 64 ((2**20)-1)),
    u_40_41 + v_40_41 <=s (const 64 (2**20)),
    u_40_41 - v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 + v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 - v_40_41 <=s (const 64 (2**20)),
    r_40_41 + s_40_41 <=s (const 64 (2**20)),
    r_40_41 - s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 + s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 - s_40_41 <=s (const 64 (2**20)),
    u_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_40_41 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_040_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_1,
sint64 g_0_low60_40_low20_1,
sint64 u_40_40,
sint64 v_40_40,
sint64 r_40_40,
sint64 s_40_40,
sint64 u_40_41,
sint64 v_40_41,
sint64 r_40_41,
sint64 s_40_41,
bit ne
)={
    u_40_40 * f_0_low60_40_low20_0 + v_40_40 * g_0_low60_40_low20_0 = f_0_low60_40_low20_0 * (-(2**20)),
    r_40_40 * f_0_low60_40_low20_0 + s_40_40 * g_0_low60_40_low20_0 = g_0_low60_40_low20_0 * (-(2**20))
&&
    u_40_40 * f_0_low60_40_low20_0 + v_40_40 * g_0_low60_40_low20_0 = f_0_low60_40_low20_0 * (const 64 (-(2**20))),
    r_40_40 * f_0_low60_40_low20_0 + s_40_40 * g_0_low60_40_low20_0 = g_0_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_0 + u_40_40 * (const 64 (2**21)) + v_40_40 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_0 + r_40_40 * (const 64 (2**21)) + s_40_40 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 40)) <=s delta, delta <=s (const 64 (1 + 2*40)),
    u_40_40 = (const 64 (-(2**20))),
    v_40_40 = (const 64 (0)),
    r_40_40 = (const 64 (0)),
    s_40_40 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise c
assume
g_0_low60_40_low20_0 = 1 (mod 2)
&&
g_0_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_1 g_0_low60_40_low20_0;
mov u_40_41 r_40_40;
mov v_40_41 s_40_40;

subs dc g_0_low60_40_low20_1 g_0_low60_40_low20_0 f_0_low60_40_low20_0;
asr g_0_low60_40_low20_1 g_0_low60_40_low20_1 1;
subs dc r_40_41 r_40_40 u_40_40;
asr r_40_41 r_40_41 1;
subs dc s_40_41 s_40_40 v_40_40;
asr s_40_41 s_40_41 1;
assert
    true
&&
    f_0_low60_40_low20_1 = g_0_low60_40_low20_0,
    u_40_41 = r_40_40,
    v_40_41 = s_40_40,
    g_0_low60_40_low20_1 * (const 64 2) = g_0_low60_40_low20_0 - f_0_low60_40_low20_0,
    r_40_41 * (const 64 2) = r_40_40 - u_40_40,
    s_40_41 * (const 64 2) = s_40_40 - v_40_40
;

assume
    f_0_low60_40_low20_1 = g_0_low60_40_low20_0,
    u_40_41 = r_40_40,
    v_40_41 = s_40_40,
    g_0_low60_40_low20_1 * 2 = g_0_low60_40_low20_0 - f_0_low60_40_low20_0,
    r_40_41 * 2 = r_40_40 - u_40_40,
    s_40_41 * 2 = s_40_40 - v_40_40
&&
    true
;

{
    u_40_41 * f_0_low60_40_low20_0 + v_40_41 * g_0_low60_40_low20_0 = f_0_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_41 * f_0_low60_40_low20_0 + s_40_41 * g_0_low60_40_low20_0 = g_0_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_1 + u_40_41 * (const 64 (2**21)) + v_40_41 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_1 + r_40_41 * (const 64 (2**21)) + s_40_41 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_1,
    f_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_1,
    g_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 41)) <=s delta, delta <=s (const 64 (1 + 2*41)),
    (const 64 (-(2**20))) <=s u_40_41, u_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_41, v_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_41, r_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_41, s_40_41 <=s (const 64 ((2**20)-1)),
    u_40_41 + v_40_41 <=s (const 64 (2**20)),
    u_40_41 - v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 + v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 - v_40_41 <=s (const 64 (2**20)),
    r_40_41 + s_40_41 <=s (const 64 (2**20)),
    r_40_41 - s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 + s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 - s_40_41 <=s (const 64 (2**20)),
    u_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_40_41 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_041_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_1,
sint64 g_0_low60_40_low20_1,
sint64 f_0_low60_40_low20_2,
sint64 g_0_low60_40_low20_2,
sint64 u_40_41,
sint64 v_40_41,
sint64 r_40_41,
sint64 s_40_41,
sint64 u_40_42,
sint64 v_40_42,
sint64 r_40_42,
sint64 s_40_42,
bit ne
)={
    u_40_41 * f_0_low60_40_low20_0 + v_40_41 * g_0_low60_40_low20_0 = f_0_low60_40_low20_1 * (-(2**20)),
    r_40_41 * f_0_low60_40_low20_0 + s_40_41 * g_0_low60_40_low20_0 = g_0_low60_40_low20_1 * (-(2**20))
&&
    u_40_41 * f_0_low60_40_low20_0 + v_40_41 * g_0_low60_40_low20_0 = f_0_low60_40_low20_1 * (const 64 (-(2**20))),
    r_40_41 * f_0_low60_40_low20_0 + s_40_41 * g_0_low60_40_low20_0 = g_0_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_1 + u_40_41 * (const 64 (2**21)) + v_40_41 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_1 + r_40_41 * (const 64 (2**21)) + s_40_41 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_1,
    f_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_1,
    g_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 41)) <=s delta, delta <=s (const 64 (1 + 2*41)),
    (const 64 (-(2**20))) <=s u_40_41, u_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_41, v_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_41, r_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_41, s_40_41 <=s (const 64 ((2**20)-1)),
    u_40_41 + v_40_41 <=s (const 64 (2**20)),
    u_40_41 - v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 + v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 - v_40_41 <=s (const 64 (2**20)),
    r_40_41 + s_40_41 <=s (const 64 (2**20)),
    r_40_41 - s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 + s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 - s_40_41 <=s (const 64 (2**20)),
    u_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_40_41 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise a
assume
g_0_low60_40_low20_1 = 0 (mod 2)
&&
g_0_low60_40_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_2 f_0_low60_40_low20_1;
mov u_40_42 u_40_41;
mov v_40_42 v_40_41;

asr g_0_low60_40_low20_2 g_0_low60_40_low20_1 1;
asr r_40_42 r_40_41 1;
asr s_40_42 s_40_41 1;
assert
    true
&&
    f_0_low60_40_low20_2 = f_0_low60_40_low20_1,
    u_40_42 = u_40_41,
    v_40_42 = v_40_41,
    g_0_low60_40_low20_2 * (const 64 2) = g_0_low60_40_low20_1,
    r_40_42 * (const 64 2) = r_40_41,
    s_40_42 * (const 64 2) = s_40_41
;

assume
    f_0_low60_40_low20_2 = f_0_low60_40_low20_1,
    u_40_42 = u_40_41,
    v_40_42 = v_40_41,
    g_0_low60_40_low20_2 * 2 = g_0_low60_40_low20_1,
    r_40_42 * 2 = r_40_41,
    s_40_42 * 2 = s_40_41
&&
    true
;

{
    u_40_42 * f_0_low60_40_low20_0 + v_40_42 * g_0_low60_40_low20_0 = f_0_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_42 * f_0_low60_40_low20_0 + s_40_42 * g_0_low60_40_low20_0 = g_0_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_2 + u_40_42 * (const 64 (2**21)) + v_40_42 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_2 + r_40_42 * (const 64 (2**21)) + s_40_42 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_2,
    f_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_2,
    g_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 42)) <=s delta, delta <=s (const 64 (1 + 2*42)),
    (const 64 (-(2**20))) <=s u_40_42, u_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_42, v_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_42, r_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_42, s_40_42 <=s (const 64 ((2**20)-1)),
    u_40_42 + v_40_42 <=s (const 64 (2**20)),
    u_40_42 - v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 + v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 - v_40_42 <=s (const 64 (2**20)),
    r_40_42 + s_40_42 <=s (const 64 (2**20)),
    r_40_42 - s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 + s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 - s_40_42 <=s (const 64 (2**20)),
    u_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_40_42 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_041_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_1,
sint64 g_0_low60_40_low20_1,
sint64 f_0_low60_40_low20_2,
sint64 g_0_low60_40_low20_2,
sint64 u_40_41,
sint64 v_40_41,
sint64 r_40_41,
sint64 s_40_41,
sint64 u_40_42,
sint64 v_40_42,
sint64 r_40_42,
sint64 s_40_42,
bit ne
)={
    u_40_41 * f_0_low60_40_low20_0 + v_40_41 * g_0_low60_40_low20_0 = f_0_low60_40_low20_1 * (-(2**20)),
    r_40_41 * f_0_low60_40_low20_0 + s_40_41 * g_0_low60_40_low20_0 = g_0_low60_40_low20_1 * (-(2**20))
&&
    u_40_41 * f_0_low60_40_low20_0 + v_40_41 * g_0_low60_40_low20_0 = f_0_low60_40_low20_1 * (const 64 (-(2**20))),
    r_40_41 * f_0_low60_40_low20_0 + s_40_41 * g_0_low60_40_low20_0 = g_0_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_1 + u_40_41 * (const 64 (2**21)) + v_40_41 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_1 + r_40_41 * (const 64 (2**21)) + s_40_41 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_1,
    f_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_1,
    g_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 41)) <=s delta, delta <=s (const 64 (1 + 2*41)),
    (const 64 (-(2**20))) <=s u_40_41, u_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_41, v_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_41, r_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_41, s_40_41 <=s (const 64 ((2**20)-1)),
    u_40_41 + v_40_41 <=s (const 64 (2**20)),
    u_40_41 - v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 + v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 - v_40_41 <=s (const 64 (2**20)),
    r_40_41 + s_40_41 <=s (const 64 (2**20)),
    r_40_41 - s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 + s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 - s_40_41 <=s (const 64 (2**20)),
    u_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_40_41 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise b
assume
g_0_low60_40_low20_1 = 1 (mod 2)
&&
g_0_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_2 f_0_low60_40_low20_1;
mov u_40_42 u_40_41;
mov v_40_42 v_40_41;

add g_0_low60_40_low20_2 g_0_low60_40_low20_1 f_0_low60_40_low20_1;
asr g_0_low60_40_low20_2 g_0_low60_40_low20_2 1;
add r_40_42 r_40_41 u_40_41;
asr r_40_42 r_40_42 1;
add s_40_42 s_40_41 v_40_41;
asr s_40_42 s_40_42 1;
assert
    true
&&
    f_0_low60_40_low20_2 = f_0_low60_40_low20_1,
    u_40_42 = u_40_41,
    v_40_42 = v_40_41,
    g_0_low60_40_low20_2 * (const 64 2) = g_0_low60_40_low20_1 + f_0_low60_40_low20_1,
    r_40_42 * (const 64 2) = r_40_41 + u_40_41,
    s_40_42 * (const 64 2) = s_40_41 + v_40_41
;

assume
    f_0_low60_40_low20_2 = f_0_low60_40_low20_1,
    u_40_42 = u_40_41,
    v_40_42 = v_40_41,
    g_0_low60_40_low20_2 * 2 = g_0_low60_40_low20_1 + f_0_low60_40_low20_1,
    r_40_42 * 2 = r_40_41 + u_40_41,
    s_40_42 * 2 = s_40_41 + v_40_41
&&
    true
;

{
    u_40_42 * f_0_low60_40_low20_0 + v_40_42 * g_0_low60_40_low20_0 = f_0_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_42 * f_0_low60_40_low20_0 + s_40_42 * g_0_low60_40_low20_0 = g_0_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_2 + u_40_42 * (const 64 (2**21)) + v_40_42 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_2 + r_40_42 * (const 64 (2**21)) + s_40_42 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_2,
    f_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_2,
    g_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 42)) <=s delta, delta <=s (const 64 (1 + 2*42)),
    (const 64 (-(2**20))) <=s u_40_42, u_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_42, v_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_42, r_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_42, s_40_42 <=s (const 64 ((2**20)-1)),
    u_40_42 + v_40_42 <=s (const 64 (2**20)),
    u_40_42 - v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 + v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 - v_40_42 <=s (const 64 (2**20)),
    r_40_42 + s_40_42 <=s (const 64 (2**20)),
    r_40_42 - s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 + s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 - s_40_42 <=s (const 64 (2**20)),
    u_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_40_42 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_041_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_1,
sint64 g_0_low60_40_low20_1,
sint64 f_0_low60_40_low20_2,
sint64 g_0_low60_40_low20_2,
sint64 u_40_41,
sint64 v_40_41,
sint64 r_40_41,
sint64 s_40_41,
sint64 u_40_42,
sint64 v_40_42,
sint64 r_40_42,
sint64 s_40_42,
bit ne
)={
    u_40_41 * f_0_low60_40_low20_0 + v_40_41 * g_0_low60_40_low20_0 = f_0_low60_40_low20_1 * (-(2**20)),
    r_40_41 * f_0_low60_40_low20_0 + s_40_41 * g_0_low60_40_low20_0 = g_0_low60_40_low20_1 * (-(2**20))
&&
    u_40_41 * f_0_low60_40_low20_0 + v_40_41 * g_0_low60_40_low20_0 = f_0_low60_40_low20_1 * (const 64 (-(2**20))),
    r_40_41 * f_0_low60_40_low20_0 + s_40_41 * g_0_low60_40_low20_0 = g_0_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_1 + u_40_41 * (const 64 (2**21)) + v_40_41 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_1 + r_40_41 * (const 64 (2**21)) + s_40_41 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_1,
    f_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_1,
    g_0_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 41)) <=s delta, delta <=s (const 64 (1 + 2*41)),
    (const 64 (-(2**20))) <=s u_40_41, u_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_41, v_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_41, r_40_41 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_41, s_40_41 <=s (const 64 ((2**20)-1)),
    u_40_41 + v_40_41 <=s (const 64 (2**20)),
    u_40_41 - v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 + v_40_41 <=s (const 64 (2**20)),
    (const 64 0) - u_40_41 - v_40_41 <=s (const 64 (2**20)),
    r_40_41 + s_40_41 <=s (const 64 (2**20)),
    r_40_41 - s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 + s_40_41 <=s (const 64 (2**20)),
    (const 64 0) - r_40_41 - s_40_41 <=s (const 64 (2**20)),
    u_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_40_41 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_40_41 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise c
assume
g_0_low60_40_low20_1 = 1 (mod 2)
&&
g_0_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_2 g_0_low60_40_low20_1;
mov u_40_42 r_40_41;
mov v_40_42 s_40_41;

subs dc g_0_low60_40_low20_2 g_0_low60_40_low20_1 f_0_low60_40_low20_1;
asr g_0_low60_40_low20_2 g_0_low60_40_low20_2 1;
subs dc r_40_42 r_40_41 u_40_41;
asr r_40_42 r_40_42 1;
subs dc s_40_42 s_40_41 v_40_41;
asr s_40_42 s_40_42 1;
assert
    true
&&
    f_0_low60_40_low20_2 = g_0_low60_40_low20_1,
    u_40_42 = r_40_41,
    v_40_42 = s_40_41,
    g_0_low60_40_low20_2 * (const 64 2) = g_0_low60_40_low20_1 - f_0_low60_40_low20_1,
    r_40_42 * (const 64 2) = r_40_41 - u_40_41,
    s_40_42 * (const 64 2) = s_40_41 - v_40_41
;

assume
    f_0_low60_40_low20_2 = g_0_low60_40_low20_1,
    u_40_42 = r_40_41,
    v_40_42 = s_40_41,
    g_0_low60_40_low20_2 * 2 = g_0_low60_40_low20_1 - f_0_low60_40_low20_1,
    r_40_42 * 2 = r_40_41 - u_40_41,
    s_40_42 * 2 = s_40_41 - v_40_41
&&
    true
;

{
    u_40_42 * f_0_low60_40_low20_0 + v_40_42 * g_0_low60_40_low20_0 = f_0_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_42 * f_0_low60_40_low20_0 + s_40_42 * g_0_low60_40_low20_0 = g_0_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_2 + u_40_42 * (const 64 (2**21)) + v_40_42 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_2 + r_40_42 * (const 64 (2**21)) + s_40_42 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_2,
    f_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_2,
    g_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 42)) <=s delta, delta <=s (const 64 (1 + 2*42)),
    (const 64 (-(2**20))) <=s u_40_42, u_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_42, v_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_42, r_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_42, s_40_42 <=s (const 64 ((2**20)-1)),
    u_40_42 + v_40_42 <=s (const 64 (2**20)),
    u_40_42 - v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 + v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 - v_40_42 <=s (const 64 (2**20)),
    r_40_42 + s_40_42 <=s (const 64 (2**20)),
    r_40_42 - s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 + s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 - s_40_42 <=s (const 64 (2**20)),
    u_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_40_42 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_042_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_2,
sint64 g_0_low60_40_low20_2,
sint64 f_0_low60_40_low20_3,
sint64 g_0_low60_40_low20_3,
sint64 u_40_42,
sint64 v_40_42,
sint64 r_40_42,
sint64 s_40_42,
sint64 u_40_43,
sint64 v_40_43,
sint64 r_40_43,
sint64 s_40_43,
bit ne
)={
    u_40_42 * f_0_low60_40_low20_0 + v_40_42 * g_0_low60_40_low20_0 = f_0_low60_40_low20_2 * (-(2**20)),
    r_40_42 * f_0_low60_40_low20_0 + s_40_42 * g_0_low60_40_low20_0 = g_0_low60_40_low20_2 * (-(2**20))
&&
    u_40_42 * f_0_low60_40_low20_0 + v_40_42 * g_0_low60_40_low20_0 = f_0_low60_40_low20_2 * (const 64 (-(2**20))),
    r_40_42 * f_0_low60_40_low20_0 + s_40_42 * g_0_low60_40_low20_0 = g_0_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_2 + u_40_42 * (const 64 (2**21)) + v_40_42 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_2 + r_40_42 * (const 64 (2**21)) + s_40_42 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_2,
    f_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_2,
    g_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 42)) <=s delta, delta <=s (const 64 (1 + 2*42)),
    (const 64 (-(2**20))) <=s u_40_42, u_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_42, v_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_42, r_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_42, s_40_42 <=s (const 64 ((2**20)-1)),
    u_40_42 + v_40_42 <=s (const 64 (2**20)),
    u_40_42 - v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 + v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 - v_40_42 <=s (const 64 (2**20)),
    r_40_42 + s_40_42 <=s (const 64 (2**20)),
    r_40_42 - s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 + s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 - s_40_42 <=s (const 64 (2**20)),
    u_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_40_42 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise a
assume
g_0_low60_40_low20_2 = 0 (mod 2)
&&
g_0_low60_40_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_3 f_0_low60_40_low20_2;
mov u_40_43 u_40_42;
mov v_40_43 v_40_42;

asr g_0_low60_40_low20_3 g_0_low60_40_low20_2 1;
asr r_40_43 r_40_42 1;
asr s_40_43 s_40_42 1;
assert
    true
&&
    f_0_low60_40_low20_3 = f_0_low60_40_low20_2,
    u_40_43 = u_40_42,
    v_40_43 = v_40_42,
    g_0_low60_40_low20_3 * (const 64 2) = g_0_low60_40_low20_2,
    r_40_43 * (const 64 2) = r_40_42,
    s_40_43 * (const 64 2) = s_40_42
;

assume
    f_0_low60_40_low20_3 = f_0_low60_40_low20_2,
    u_40_43 = u_40_42,
    v_40_43 = v_40_42,
    g_0_low60_40_low20_3 * 2 = g_0_low60_40_low20_2,
    r_40_43 * 2 = r_40_42,
    s_40_43 * 2 = s_40_42
&&
    true
;

{
    u_40_43 * f_0_low60_40_low20_0 + v_40_43 * g_0_low60_40_low20_0 = f_0_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_43 * f_0_low60_40_low20_0 + s_40_43 * g_0_low60_40_low20_0 = g_0_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_3 + u_40_43 * (const 64 (2**21)) + v_40_43 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_3 + r_40_43 * (const 64 (2**21)) + s_40_43 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_3,
    f_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_3,
    g_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 43)) <=s delta, delta <=s (const 64 (1 + 2*43)),
    (const 64 (-(2**20))) <=s u_40_43, u_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_43, v_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_43, r_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_43, s_40_43 <=s (const 64 ((2**20)-1)),
    u_40_43 + v_40_43 <=s (const 64 (2**20)),
    u_40_43 - v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 + v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 - v_40_43 <=s (const 64 (2**20)),
    r_40_43 + s_40_43 <=s (const 64 (2**20)),
    r_40_43 - s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 + s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 - s_40_43 <=s (const 64 (2**20)),
    u_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_40_43 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_042_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_2,
sint64 g_0_low60_40_low20_2,
sint64 f_0_low60_40_low20_3,
sint64 g_0_low60_40_low20_3,
sint64 u_40_42,
sint64 v_40_42,
sint64 r_40_42,
sint64 s_40_42,
sint64 u_40_43,
sint64 v_40_43,
sint64 r_40_43,
sint64 s_40_43,
bit ne
)={
    u_40_42 * f_0_low60_40_low20_0 + v_40_42 * g_0_low60_40_low20_0 = f_0_low60_40_low20_2 * (-(2**20)),
    r_40_42 * f_0_low60_40_low20_0 + s_40_42 * g_0_low60_40_low20_0 = g_0_low60_40_low20_2 * (-(2**20))
&&
    u_40_42 * f_0_low60_40_low20_0 + v_40_42 * g_0_low60_40_low20_0 = f_0_low60_40_low20_2 * (const 64 (-(2**20))),
    r_40_42 * f_0_low60_40_low20_0 + s_40_42 * g_0_low60_40_low20_0 = g_0_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_2 + u_40_42 * (const 64 (2**21)) + v_40_42 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_2 + r_40_42 * (const 64 (2**21)) + s_40_42 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_2,
    f_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_2,
    g_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 42)) <=s delta, delta <=s (const 64 (1 + 2*42)),
    (const 64 (-(2**20))) <=s u_40_42, u_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_42, v_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_42, r_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_42, s_40_42 <=s (const 64 ((2**20)-1)),
    u_40_42 + v_40_42 <=s (const 64 (2**20)),
    u_40_42 - v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 + v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 - v_40_42 <=s (const 64 (2**20)),
    r_40_42 + s_40_42 <=s (const 64 (2**20)),
    r_40_42 - s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 + s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 - s_40_42 <=s (const 64 (2**20)),
    u_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_40_42 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise b
assume
g_0_low60_40_low20_2 = 1 (mod 2)
&&
g_0_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_3 f_0_low60_40_low20_2;
mov u_40_43 u_40_42;
mov v_40_43 v_40_42;

add g_0_low60_40_low20_3 g_0_low60_40_low20_2 f_0_low60_40_low20_2;
asr g_0_low60_40_low20_3 g_0_low60_40_low20_3 1;
add r_40_43 r_40_42 u_40_42;
asr r_40_43 r_40_43 1;
add s_40_43 s_40_42 v_40_42;
asr s_40_43 s_40_43 1;
assert
    true
&&
    f_0_low60_40_low20_3 = f_0_low60_40_low20_2,
    u_40_43 = u_40_42,
    v_40_43 = v_40_42,
    g_0_low60_40_low20_3 * (const 64 2) = g_0_low60_40_low20_2 + f_0_low60_40_low20_2,
    r_40_43 * (const 64 2) = r_40_42 + u_40_42,
    s_40_43 * (const 64 2) = s_40_42 + v_40_42
;

assume
    f_0_low60_40_low20_3 = f_0_low60_40_low20_2,
    u_40_43 = u_40_42,
    v_40_43 = v_40_42,
    g_0_low60_40_low20_3 * 2 = g_0_low60_40_low20_2 + f_0_low60_40_low20_2,
    r_40_43 * 2 = r_40_42 + u_40_42,
    s_40_43 * 2 = s_40_42 + v_40_42
&&
    true
;

{
    u_40_43 * f_0_low60_40_low20_0 + v_40_43 * g_0_low60_40_low20_0 = f_0_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_43 * f_0_low60_40_low20_0 + s_40_43 * g_0_low60_40_low20_0 = g_0_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_3 + u_40_43 * (const 64 (2**21)) + v_40_43 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_3 + r_40_43 * (const 64 (2**21)) + s_40_43 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_3,
    f_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_3,
    g_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 43)) <=s delta, delta <=s (const 64 (1 + 2*43)),
    (const 64 (-(2**20))) <=s u_40_43, u_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_43, v_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_43, r_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_43, s_40_43 <=s (const 64 ((2**20)-1)),
    u_40_43 + v_40_43 <=s (const 64 (2**20)),
    u_40_43 - v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 + v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 - v_40_43 <=s (const 64 (2**20)),
    r_40_43 + s_40_43 <=s (const 64 (2**20)),
    r_40_43 - s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 + s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 - s_40_43 <=s (const 64 (2**20)),
    u_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_40_43 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_042_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_2,
sint64 g_0_low60_40_low20_2,
sint64 f_0_low60_40_low20_3,
sint64 g_0_low60_40_low20_3,
sint64 u_40_42,
sint64 v_40_42,
sint64 r_40_42,
sint64 s_40_42,
sint64 u_40_43,
sint64 v_40_43,
sint64 r_40_43,
sint64 s_40_43,
bit ne
)={
    u_40_42 * f_0_low60_40_low20_0 + v_40_42 * g_0_low60_40_low20_0 = f_0_low60_40_low20_2 * (-(2**20)),
    r_40_42 * f_0_low60_40_low20_0 + s_40_42 * g_0_low60_40_low20_0 = g_0_low60_40_low20_2 * (-(2**20))
&&
    u_40_42 * f_0_low60_40_low20_0 + v_40_42 * g_0_low60_40_low20_0 = f_0_low60_40_low20_2 * (const 64 (-(2**20))),
    r_40_42 * f_0_low60_40_low20_0 + s_40_42 * g_0_low60_40_low20_0 = g_0_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_2 + u_40_42 * (const 64 (2**21)) + v_40_42 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_2 + r_40_42 * (const 64 (2**21)) + s_40_42 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_2,
    f_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_2,
    g_0_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 42)) <=s delta, delta <=s (const 64 (1 + 2*42)),
    (const 64 (-(2**20))) <=s u_40_42, u_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_42, v_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_42, r_40_42 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_42, s_40_42 <=s (const 64 ((2**20)-1)),
    u_40_42 + v_40_42 <=s (const 64 (2**20)),
    u_40_42 - v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 + v_40_42 <=s (const 64 (2**20)),
    (const 64 0) - u_40_42 - v_40_42 <=s (const 64 (2**20)),
    r_40_42 + s_40_42 <=s (const 64 (2**20)),
    r_40_42 - s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 + s_40_42 <=s (const 64 (2**20)),
    (const 64 0) - r_40_42 - s_40_42 <=s (const 64 (2**20)),
    u_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_40_42 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_40_42 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise c
assume
g_0_low60_40_low20_2 = 1 (mod 2)
&&
g_0_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_3 g_0_low60_40_low20_2;
mov u_40_43 r_40_42;
mov v_40_43 s_40_42;

subs dc g_0_low60_40_low20_3 g_0_low60_40_low20_2 f_0_low60_40_low20_2;
asr g_0_low60_40_low20_3 g_0_low60_40_low20_3 1;
subs dc r_40_43 r_40_42 u_40_42;
asr r_40_43 r_40_43 1;
subs dc s_40_43 s_40_42 v_40_42;
asr s_40_43 s_40_43 1;
assert
    true
&&
    f_0_low60_40_low20_3 = g_0_low60_40_low20_2,
    u_40_43 = r_40_42,
    v_40_43 = s_40_42,
    g_0_low60_40_low20_3 * (const 64 2) = g_0_low60_40_low20_2 - f_0_low60_40_low20_2,
    r_40_43 * (const 64 2) = r_40_42 - u_40_42,
    s_40_43 * (const 64 2) = s_40_42 - v_40_42
;

assume
    f_0_low60_40_low20_3 = g_0_low60_40_low20_2,
    u_40_43 = r_40_42,
    v_40_43 = s_40_42,
    g_0_low60_40_low20_3 * 2 = g_0_low60_40_low20_2 - f_0_low60_40_low20_2,
    r_40_43 * 2 = r_40_42 - u_40_42,
    s_40_43 * 2 = s_40_42 - v_40_42
&&
    true
;

{
    u_40_43 * f_0_low60_40_low20_0 + v_40_43 * g_0_low60_40_low20_0 = f_0_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_43 * f_0_low60_40_low20_0 + s_40_43 * g_0_low60_40_low20_0 = g_0_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_3 + u_40_43 * (const 64 (2**21)) + v_40_43 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_3 + r_40_43 * (const 64 (2**21)) + s_40_43 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_3,
    f_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_3,
    g_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 43)) <=s delta, delta <=s (const 64 (1 + 2*43)),
    (const 64 (-(2**20))) <=s u_40_43, u_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_43, v_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_43, r_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_43, s_40_43 <=s (const 64 ((2**20)-1)),
    u_40_43 + v_40_43 <=s (const 64 (2**20)),
    u_40_43 - v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 + v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 - v_40_43 <=s (const 64 (2**20)),
    r_40_43 + s_40_43 <=s (const 64 (2**20)),
    r_40_43 - s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 + s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 - s_40_43 <=s (const 64 (2**20)),
    u_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_40_43 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_043_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_3,
sint64 g_0_low60_40_low20_3,
sint64 f_0_low60_40_low20_4,
sint64 g_0_low60_40_low20_4,
sint64 u_40_43,
sint64 v_40_43,
sint64 r_40_43,
sint64 s_40_43,
sint64 u_40_44,
sint64 v_40_44,
sint64 r_40_44,
sint64 s_40_44,
bit ne
)={
    u_40_43 * f_0_low60_40_low20_0 + v_40_43 * g_0_low60_40_low20_0 = f_0_low60_40_low20_3 * (-(2**20)),
    r_40_43 * f_0_low60_40_low20_0 + s_40_43 * g_0_low60_40_low20_0 = g_0_low60_40_low20_3 * (-(2**20))
&&
    u_40_43 * f_0_low60_40_low20_0 + v_40_43 * g_0_low60_40_low20_0 = f_0_low60_40_low20_3 * (const 64 (-(2**20))),
    r_40_43 * f_0_low60_40_low20_0 + s_40_43 * g_0_low60_40_low20_0 = g_0_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_3 + u_40_43 * (const 64 (2**21)) + v_40_43 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_3 + r_40_43 * (const 64 (2**21)) + s_40_43 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_3,
    f_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_3,
    g_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 43)) <=s delta, delta <=s (const 64 (1 + 2*43)),
    (const 64 (-(2**20))) <=s u_40_43, u_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_43, v_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_43, r_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_43, s_40_43 <=s (const 64 ((2**20)-1)),
    u_40_43 + v_40_43 <=s (const 64 (2**20)),
    u_40_43 - v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 + v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 - v_40_43 <=s (const 64 (2**20)),
    r_40_43 + s_40_43 <=s (const 64 (2**20)),
    r_40_43 - s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 + s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 - s_40_43 <=s (const 64 (2**20)),
    u_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_40_43 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise a
assume
g_0_low60_40_low20_3 = 0 (mod 2)
&&
g_0_low60_40_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_4 f_0_low60_40_low20_3;
mov u_40_44 u_40_43;
mov v_40_44 v_40_43;

asr g_0_low60_40_low20_4 g_0_low60_40_low20_3 1;
asr r_40_44 r_40_43 1;
asr s_40_44 s_40_43 1;
assert
    true
&&
    f_0_low60_40_low20_4 = f_0_low60_40_low20_3,
    u_40_44 = u_40_43,
    v_40_44 = v_40_43,
    g_0_low60_40_low20_4 * (const 64 2) = g_0_low60_40_low20_3,
    r_40_44 * (const 64 2) = r_40_43,
    s_40_44 * (const 64 2) = s_40_43
;

assume
    f_0_low60_40_low20_4 = f_0_low60_40_low20_3,
    u_40_44 = u_40_43,
    v_40_44 = v_40_43,
    g_0_low60_40_low20_4 * 2 = g_0_low60_40_low20_3,
    r_40_44 * 2 = r_40_43,
    s_40_44 * 2 = s_40_43
&&
    true
;

{
    u_40_44 * f_0_low60_40_low20_0 + v_40_44 * g_0_low60_40_low20_0 = f_0_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_44 * f_0_low60_40_low20_0 + s_40_44 * g_0_low60_40_low20_0 = g_0_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_4 + u_40_44 * (const 64 (2**21)) + v_40_44 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_4 + r_40_44 * (const 64 (2**21)) + s_40_44 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_4,
    f_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_4,
    g_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 44)) <=s delta, delta <=s (const 64 (1 + 2*44)),
    (const 64 (-(2**20))) <=s u_40_44, u_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_44, v_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_44, r_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_44, s_40_44 <=s (const 64 ((2**20)-1)),
    u_40_44 + v_40_44 <=s (const 64 (2**20)),
    u_40_44 - v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 + v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 - v_40_44 <=s (const 64 (2**20)),
    r_40_44 + s_40_44 <=s (const 64 (2**20)),
    r_40_44 - s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 + s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 - s_40_44 <=s (const 64 (2**20)),
    u_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_40_44 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_043_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_3,
sint64 g_0_low60_40_low20_3,
sint64 f_0_low60_40_low20_4,
sint64 g_0_low60_40_low20_4,
sint64 u_40_43,
sint64 v_40_43,
sint64 r_40_43,
sint64 s_40_43,
sint64 u_40_44,
sint64 v_40_44,
sint64 r_40_44,
sint64 s_40_44,
bit ne
)={
    u_40_43 * f_0_low60_40_low20_0 + v_40_43 * g_0_low60_40_low20_0 = f_0_low60_40_low20_3 * (-(2**20)),
    r_40_43 * f_0_low60_40_low20_0 + s_40_43 * g_0_low60_40_low20_0 = g_0_low60_40_low20_3 * (-(2**20))
&&
    u_40_43 * f_0_low60_40_low20_0 + v_40_43 * g_0_low60_40_low20_0 = f_0_low60_40_low20_3 * (const 64 (-(2**20))),
    r_40_43 * f_0_low60_40_low20_0 + s_40_43 * g_0_low60_40_low20_0 = g_0_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_3 + u_40_43 * (const 64 (2**21)) + v_40_43 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_3 + r_40_43 * (const 64 (2**21)) + s_40_43 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_3,
    f_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_3,
    g_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 43)) <=s delta, delta <=s (const 64 (1 + 2*43)),
    (const 64 (-(2**20))) <=s u_40_43, u_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_43, v_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_43, r_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_43, s_40_43 <=s (const 64 ((2**20)-1)),
    u_40_43 + v_40_43 <=s (const 64 (2**20)),
    u_40_43 - v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 + v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 - v_40_43 <=s (const 64 (2**20)),
    r_40_43 + s_40_43 <=s (const 64 (2**20)),
    r_40_43 - s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 + s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 - s_40_43 <=s (const 64 (2**20)),
    u_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_40_43 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise b
assume
g_0_low60_40_low20_3 = 1 (mod 2)
&&
g_0_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_4 f_0_low60_40_low20_3;
mov u_40_44 u_40_43;
mov v_40_44 v_40_43;

add g_0_low60_40_low20_4 g_0_low60_40_low20_3 f_0_low60_40_low20_3;
asr g_0_low60_40_low20_4 g_0_low60_40_low20_4 1;
add r_40_44 r_40_43 u_40_43;
asr r_40_44 r_40_44 1;
add s_40_44 s_40_43 v_40_43;
asr s_40_44 s_40_44 1;
assert
    true
&&
    f_0_low60_40_low20_4 = f_0_low60_40_low20_3,
    u_40_44 = u_40_43,
    v_40_44 = v_40_43,
    g_0_low60_40_low20_4 * (const 64 2) = g_0_low60_40_low20_3 + f_0_low60_40_low20_3,
    r_40_44 * (const 64 2) = r_40_43 + u_40_43,
    s_40_44 * (const 64 2) = s_40_43 + v_40_43
;

assume
    f_0_low60_40_low20_4 = f_0_low60_40_low20_3,
    u_40_44 = u_40_43,
    v_40_44 = v_40_43,
    g_0_low60_40_low20_4 * 2 = g_0_low60_40_low20_3 + f_0_low60_40_low20_3,
    r_40_44 * 2 = r_40_43 + u_40_43,
    s_40_44 * 2 = s_40_43 + v_40_43
&&
    true
;

{
    u_40_44 * f_0_low60_40_low20_0 + v_40_44 * g_0_low60_40_low20_0 = f_0_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_44 * f_0_low60_40_low20_0 + s_40_44 * g_0_low60_40_low20_0 = g_0_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_4 + u_40_44 * (const 64 (2**21)) + v_40_44 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_4 + r_40_44 * (const 64 (2**21)) + s_40_44 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_4,
    f_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_4,
    g_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 44)) <=s delta, delta <=s (const 64 (1 + 2*44)),
    (const 64 (-(2**20))) <=s u_40_44, u_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_44, v_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_44, r_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_44, s_40_44 <=s (const 64 ((2**20)-1)),
    u_40_44 + v_40_44 <=s (const 64 (2**20)),
    u_40_44 - v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 + v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 - v_40_44 <=s (const 64 (2**20)),
    r_40_44 + s_40_44 <=s (const 64 (2**20)),
    r_40_44 - s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 + s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 - s_40_44 <=s (const 64 (2**20)),
    u_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_40_44 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_043_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_3,
sint64 g_0_low60_40_low20_3,
sint64 f_0_low60_40_low20_4,
sint64 g_0_low60_40_low20_4,
sint64 u_40_43,
sint64 v_40_43,
sint64 r_40_43,
sint64 s_40_43,
sint64 u_40_44,
sint64 v_40_44,
sint64 r_40_44,
sint64 s_40_44,
bit ne
)={
    u_40_43 * f_0_low60_40_low20_0 + v_40_43 * g_0_low60_40_low20_0 = f_0_low60_40_low20_3 * (-(2**20)),
    r_40_43 * f_0_low60_40_low20_0 + s_40_43 * g_0_low60_40_low20_0 = g_0_low60_40_low20_3 * (-(2**20))
&&
    u_40_43 * f_0_low60_40_low20_0 + v_40_43 * g_0_low60_40_low20_0 = f_0_low60_40_low20_3 * (const 64 (-(2**20))),
    r_40_43 * f_0_low60_40_low20_0 + s_40_43 * g_0_low60_40_low20_0 = g_0_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_3 + u_40_43 * (const 64 (2**21)) + v_40_43 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_3 + r_40_43 * (const 64 (2**21)) + s_40_43 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_3,
    f_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_3,
    g_0_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 43)) <=s delta, delta <=s (const 64 (1 + 2*43)),
    (const 64 (-(2**20))) <=s u_40_43, u_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_43, v_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_43, r_40_43 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_43, s_40_43 <=s (const 64 ((2**20)-1)),
    u_40_43 + v_40_43 <=s (const 64 (2**20)),
    u_40_43 - v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 + v_40_43 <=s (const 64 (2**20)),
    (const 64 0) - u_40_43 - v_40_43 <=s (const 64 (2**20)),
    r_40_43 + s_40_43 <=s (const 64 (2**20)),
    r_40_43 - s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 + s_40_43 <=s (const 64 (2**20)),
    (const 64 0) - r_40_43 - s_40_43 <=s (const 64 (2**20)),
    u_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_40_43 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_40_43 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise c
assume
g_0_low60_40_low20_3 = 1 (mod 2)
&&
g_0_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_4 g_0_low60_40_low20_3;
mov u_40_44 r_40_43;
mov v_40_44 s_40_43;

subs dc g_0_low60_40_low20_4 g_0_low60_40_low20_3 f_0_low60_40_low20_3;
asr g_0_low60_40_low20_4 g_0_low60_40_low20_4 1;
subs dc r_40_44 r_40_43 u_40_43;
asr r_40_44 r_40_44 1;
subs dc s_40_44 s_40_43 v_40_43;
asr s_40_44 s_40_44 1;
assert
    true
&&
    f_0_low60_40_low20_4 = g_0_low60_40_low20_3,
    u_40_44 = r_40_43,
    v_40_44 = s_40_43,
    g_0_low60_40_low20_4 * (const 64 2) = g_0_low60_40_low20_3 - f_0_low60_40_low20_3,
    r_40_44 * (const 64 2) = r_40_43 - u_40_43,
    s_40_44 * (const 64 2) = s_40_43 - v_40_43
;

assume
    f_0_low60_40_low20_4 = g_0_low60_40_low20_3,
    u_40_44 = r_40_43,
    v_40_44 = s_40_43,
    g_0_low60_40_low20_4 * 2 = g_0_low60_40_low20_3 - f_0_low60_40_low20_3,
    r_40_44 * 2 = r_40_43 - u_40_43,
    s_40_44 * 2 = s_40_43 - v_40_43
&&
    true
;

{
    u_40_44 * f_0_low60_40_low20_0 + v_40_44 * g_0_low60_40_low20_0 = f_0_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_44 * f_0_low60_40_low20_0 + s_40_44 * g_0_low60_40_low20_0 = g_0_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_4 + u_40_44 * (const 64 (2**21)) + v_40_44 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_4 + r_40_44 * (const 64 (2**21)) + s_40_44 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_4,
    f_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_4,
    g_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 44)) <=s delta, delta <=s (const 64 (1 + 2*44)),
    (const 64 (-(2**20))) <=s u_40_44, u_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_44, v_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_44, r_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_44, s_40_44 <=s (const 64 ((2**20)-1)),
    u_40_44 + v_40_44 <=s (const 64 (2**20)),
    u_40_44 - v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 + v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 - v_40_44 <=s (const 64 (2**20)),
    r_40_44 + s_40_44 <=s (const 64 (2**20)),
    r_40_44 - s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 + s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 - s_40_44 <=s (const 64 (2**20)),
    u_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_40_44 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_044_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_4,
sint64 g_0_low60_40_low20_4,
sint64 f_0_low60_40_low20_5,
sint64 g_0_low60_40_low20_5,
sint64 u_40_44,
sint64 v_40_44,
sint64 r_40_44,
sint64 s_40_44,
sint64 u_40_45,
sint64 v_40_45,
sint64 r_40_45,
sint64 s_40_45,
bit ne
)={
    u_40_44 * f_0_low60_40_low20_0 + v_40_44 * g_0_low60_40_low20_0 = f_0_low60_40_low20_4 * (-(2**20)),
    r_40_44 * f_0_low60_40_low20_0 + s_40_44 * g_0_low60_40_low20_0 = g_0_low60_40_low20_4 * (-(2**20))
&&
    u_40_44 * f_0_low60_40_low20_0 + v_40_44 * g_0_low60_40_low20_0 = f_0_low60_40_low20_4 * (const 64 (-(2**20))),
    r_40_44 * f_0_low60_40_low20_0 + s_40_44 * g_0_low60_40_low20_0 = g_0_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_4 + u_40_44 * (const 64 (2**21)) + v_40_44 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_4 + r_40_44 * (const 64 (2**21)) + s_40_44 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_4,
    f_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_4,
    g_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 44)) <=s delta, delta <=s (const 64 (1 + 2*44)),
    (const 64 (-(2**20))) <=s u_40_44, u_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_44, v_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_44, r_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_44, s_40_44 <=s (const 64 ((2**20)-1)),
    u_40_44 + v_40_44 <=s (const 64 (2**20)),
    u_40_44 - v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 + v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 - v_40_44 <=s (const 64 (2**20)),
    r_40_44 + s_40_44 <=s (const 64 (2**20)),
    r_40_44 - s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 + s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 - s_40_44 <=s (const 64 (2**20)),
    u_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_40_44 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise a
assume
g_0_low60_40_low20_4 = 0 (mod 2)
&&
g_0_low60_40_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_5 f_0_low60_40_low20_4;
mov u_40_45 u_40_44;
mov v_40_45 v_40_44;

asr g_0_low60_40_low20_5 g_0_low60_40_low20_4 1;
asr r_40_45 r_40_44 1;
asr s_40_45 s_40_44 1;
assert
    true
&&
    f_0_low60_40_low20_5 = f_0_low60_40_low20_4,
    u_40_45 = u_40_44,
    v_40_45 = v_40_44,
    g_0_low60_40_low20_5 * (const 64 2) = g_0_low60_40_low20_4,
    r_40_45 * (const 64 2) = r_40_44,
    s_40_45 * (const 64 2) = s_40_44
;

assume
    f_0_low60_40_low20_5 = f_0_low60_40_low20_4,
    u_40_45 = u_40_44,
    v_40_45 = v_40_44,
    g_0_low60_40_low20_5 * 2 = g_0_low60_40_low20_4,
    r_40_45 * 2 = r_40_44,
    s_40_45 * 2 = s_40_44
&&
    true
;

{
    u_40_45 * f_0_low60_40_low20_0 + v_40_45 * g_0_low60_40_low20_0 = f_0_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_45 * f_0_low60_40_low20_0 + s_40_45 * g_0_low60_40_low20_0 = g_0_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_5 + u_40_45 * (const 64 (2**21)) + v_40_45 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_5 + r_40_45 * (const 64 (2**21)) + s_40_45 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_5,
    f_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_5,
    g_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 45)) <=s delta, delta <=s (const 64 (1 + 2*45)),
    (const 64 (-(2**20))) <=s u_40_45, u_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_45, v_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_45, r_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_45, s_40_45 <=s (const 64 ((2**20)-1)),
    u_40_45 + v_40_45 <=s (const 64 (2**20)),
    u_40_45 - v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 + v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 - v_40_45 <=s (const 64 (2**20)),
    r_40_45 + s_40_45 <=s (const 64 (2**20)),
    r_40_45 - s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 + s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 - s_40_45 <=s (const 64 (2**20)),
    u_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_40_45 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_044_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_4,
sint64 g_0_low60_40_low20_4,
sint64 f_0_low60_40_low20_5,
sint64 g_0_low60_40_low20_5,
sint64 u_40_44,
sint64 v_40_44,
sint64 r_40_44,
sint64 s_40_44,
sint64 u_40_45,
sint64 v_40_45,
sint64 r_40_45,
sint64 s_40_45,
bit ne
)={
    u_40_44 * f_0_low60_40_low20_0 + v_40_44 * g_0_low60_40_low20_0 = f_0_low60_40_low20_4 * (-(2**20)),
    r_40_44 * f_0_low60_40_low20_0 + s_40_44 * g_0_low60_40_low20_0 = g_0_low60_40_low20_4 * (-(2**20))
&&
    u_40_44 * f_0_low60_40_low20_0 + v_40_44 * g_0_low60_40_low20_0 = f_0_low60_40_low20_4 * (const 64 (-(2**20))),
    r_40_44 * f_0_low60_40_low20_0 + s_40_44 * g_0_low60_40_low20_0 = g_0_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_4 + u_40_44 * (const 64 (2**21)) + v_40_44 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_4 + r_40_44 * (const 64 (2**21)) + s_40_44 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_4,
    f_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_4,
    g_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 44)) <=s delta, delta <=s (const 64 (1 + 2*44)),
    (const 64 (-(2**20))) <=s u_40_44, u_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_44, v_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_44, r_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_44, s_40_44 <=s (const 64 ((2**20)-1)),
    u_40_44 + v_40_44 <=s (const 64 (2**20)),
    u_40_44 - v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 + v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 - v_40_44 <=s (const 64 (2**20)),
    r_40_44 + s_40_44 <=s (const 64 (2**20)),
    r_40_44 - s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 + s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 - s_40_44 <=s (const 64 (2**20)),
    u_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_40_44 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise b
assume
g_0_low60_40_low20_4 = 1 (mod 2)
&&
g_0_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_5 f_0_low60_40_low20_4;
mov u_40_45 u_40_44;
mov v_40_45 v_40_44;

add g_0_low60_40_low20_5 g_0_low60_40_low20_4 f_0_low60_40_low20_4;
asr g_0_low60_40_low20_5 g_0_low60_40_low20_5 1;
add r_40_45 r_40_44 u_40_44;
asr r_40_45 r_40_45 1;
add s_40_45 s_40_44 v_40_44;
asr s_40_45 s_40_45 1;
assert
    true
&&
    f_0_low60_40_low20_5 = f_0_low60_40_low20_4,
    u_40_45 = u_40_44,
    v_40_45 = v_40_44,
    g_0_low60_40_low20_5 * (const 64 2) = g_0_low60_40_low20_4 + f_0_low60_40_low20_4,
    r_40_45 * (const 64 2) = r_40_44 + u_40_44,
    s_40_45 * (const 64 2) = s_40_44 + v_40_44
;

assume
    f_0_low60_40_low20_5 = f_0_low60_40_low20_4,
    u_40_45 = u_40_44,
    v_40_45 = v_40_44,
    g_0_low60_40_low20_5 * 2 = g_0_low60_40_low20_4 + f_0_low60_40_low20_4,
    r_40_45 * 2 = r_40_44 + u_40_44,
    s_40_45 * 2 = s_40_44 + v_40_44
&&
    true
;

{
    u_40_45 * f_0_low60_40_low20_0 + v_40_45 * g_0_low60_40_low20_0 = f_0_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_45 * f_0_low60_40_low20_0 + s_40_45 * g_0_low60_40_low20_0 = g_0_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_5 + u_40_45 * (const 64 (2**21)) + v_40_45 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_5 + r_40_45 * (const 64 (2**21)) + s_40_45 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_5,
    f_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_5,
    g_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 45)) <=s delta, delta <=s (const 64 (1 + 2*45)),
    (const 64 (-(2**20))) <=s u_40_45, u_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_45, v_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_45, r_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_45, s_40_45 <=s (const 64 ((2**20)-1)),
    u_40_45 + v_40_45 <=s (const 64 (2**20)),
    u_40_45 - v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 + v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 - v_40_45 <=s (const 64 (2**20)),
    r_40_45 + s_40_45 <=s (const 64 (2**20)),
    r_40_45 - s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 + s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 - s_40_45 <=s (const 64 (2**20)),
    u_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_40_45 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_044_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_4,
sint64 g_0_low60_40_low20_4,
sint64 f_0_low60_40_low20_5,
sint64 g_0_low60_40_low20_5,
sint64 u_40_44,
sint64 v_40_44,
sint64 r_40_44,
sint64 s_40_44,
sint64 u_40_45,
sint64 v_40_45,
sint64 r_40_45,
sint64 s_40_45,
bit ne
)={
    u_40_44 * f_0_low60_40_low20_0 + v_40_44 * g_0_low60_40_low20_0 = f_0_low60_40_low20_4 * (-(2**20)),
    r_40_44 * f_0_low60_40_low20_0 + s_40_44 * g_0_low60_40_low20_0 = g_0_low60_40_low20_4 * (-(2**20))
&&
    u_40_44 * f_0_low60_40_low20_0 + v_40_44 * g_0_low60_40_low20_0 = f_0_low60_40_low20_4 * (const 64 (-(2**20))),
    r_40_44 * f_0_low60_40_low20_0 + s_40_44 * g_0_low60_40_low20_0 = g_0_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_4 + u_40_44 * (const 64 (2**21)) + v_40_44 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_4 + r_40_44 * (const 64 (2**21)) + s_40_44 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_4,
    f_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_4,
    g_0_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 44)) <=s delta, delta <=s (const 64 (1 + 2*44)),
    (const 64 (-(2**20))) <=s u_40_44, u_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_44, v_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_44, r_40_44 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_44, s_40_44 <=s (const 64 ((2**20)-1)),
    u_40_44 + v_40_44 <=s (const 64 (2**20)),
    u_40_44 - v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 + v_40_44 <=s (const 64 (2**20)),
    (const 64 0) - u_40_44 - v_40_44 <=s (const 64 (2**20)),
    r_40_44 + s_40_44 <=s (const 64 (2**20)),
    r_40_44 - s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 + s_40_44 <=s (const 64 (2**20)),
    (const 64 0) - r_40_44 - s_40_44 <=s (const 64 (2**20)),
    u_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_40_44 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_40_44 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise c
assume
g_0_low60_40_low20_4 = 1 (mod 2)
&&
g_0_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_5 g_0_low60_40_low20_4;
mov u_40_45 r_40_44;
mov v_40_45 s_40_44;

subs dc g_0_low60_40_low20_5 g_0_low60_40_low20_4 f_0_low60_40_low20_4;
asr g_0_low60_40_low20_5 g_0_low60_40_low20_5 1;
subs dc r_40_45 r_40_44 u_40_44;
asr r_40_45 r_40_45 1;
subs dc s_40_45 s_40_44 v_40_44;
asr s_40_45 s_40_45 1;
assert
    true
&&
    f_0_low60_40_low20_5 = g_0_low60_40_low20_4,
    u_40_45 = r_40_44,
    v_40_45 = s_40_44,
    g_0_low60_40_low20_5 * (const 64 2) = g_0_low60_40_low20_4 - f_0_low60_40_low20_4,
    r_40_45 * (const 64 2) = r_40_44 - u_40_44,
    s_40_45 * (const 64 2) = s_40_44 - v_40_44
;

assume
    f_0_low60_40_low20_5 = g_0_low60_40_low20_4,
    u_40_45 = r_40_44,
    v_40_45 = s_40_44,
    g_0_low60_40_low20_5 * 2 = g_0_low60_40_low20_4 - f_0_low60_40_low20_4,
    r_40_45 * 2 = r_40_44 - u_40_44,
    s_40_45 * 2 = s_40_44 - v_40_44
&&
    true
;

{
    u_40_45 * f_0_low60_40_low20_0 + v_40_45 * g_0_low60_40_low20_0 = f_0_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_45 * f_0_low60_40_low20_0 + s_40_45 * g_0_low60_40_low20_0 = g_0_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_5 + u_40_45 * (const 64 (2**21)) + v_40_45 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_5 + r_40_45 * (const 64 (2**21)) + s_40_45 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_5,
    f_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_5,
    g_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 45)) <=s delta, delta <=s (const 64 (1 + 2*45)),
    (const 64 (-(2**20))) <=s u_40_45, u_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_45, v_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_45, r_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_45, s_40_45 <=s (const 64 ((2**20)-1)),
    u_40_45 + v_40_45 <=s (const 64 (2**20)),
    u_40_45 - v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 + v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 - v_40_45 <=s (const 64 (2**20)),
    r_40_45 + s_40_45 <=s (const 64 (2**20)),
    r_40_45 - s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 + s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 - s_40_45 <=s (const 64 (2**20)),
    u_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_40_45 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_045_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_5,
sint64 g_0_low60_40_low20_5,
sint64 f_0_low60_40_low20_6,
sint64 g_0_low60_40_low20_6,
sint64 u_40_45,
sint64 v_40_45,
sint64 r_40_45,
sint64 s_40_45,
sint64 u_40_46,
sint64 v_40_46,
sint64 r_40_46,
sint64 s_40_46,
bit ne
)={
    u_40_45 * f_0_low60_40_low20_0 + v_40_45 * g_0_low60_40_low20_0 = f_0_low60_40_low20_5 * (-(2**20)),
    r_40_45 * f_0_low60_40_low20_0 + s_40_45 * g_0_low60_40_low20_0 = g_0_low60_40_low20_5 * (-(2**20))
&&
    u_40_45 * f_0_low60_40_low20_0 + v_40_45 * g_0_low60_40_low20_0 = f_0_low60_40_low20_5 * (const 64 (-(2**20))),
    r_40_45 * f_0_low60_40_low20_0 + s_40_45 * g_0_low60_40_low20_0 = g_0_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_5 + u_40_45 * (const 64 (2**21)) + v_40_45 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_5 + r_40_45 * (const 64 (2**21)) + s_40_45 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_5,
    f_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_5,
    g_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 45)) <=s delta, delta <=s (const 64 (1 + 2*45)),
    (const 64 (-(2**20))) <=s u_40_45, u_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_45, v_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_45, r_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_45, s_40_45 <=s (const 64 ((2**20)-1)),
    u_40_45 + v_40_45 <=s (const 64 (2**20)),
    u_40_45 - v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 + v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 - v_40_45 <=s (const 64 (2**20)),
    r_40_45 + s_40_45 <=s (const 64 (2**20)),
    r_40_45 - s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 + s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 - s_40_45 <=s (const 64 (2**20)),
    u_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_40_45 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise a
assume
g_0_low60_40_low20_5 = 0 (mod 2)
&&
g_0_low60_40_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_6 f_0_low60_40_low20_5;
mov u_40_46 u_40_45;
mov v_40_46 v_40_45;

asr g_0_low60_40_low20_6 g_0_low60_40_low20_5 1;
asr r_40_46 r_40_45 1;
asr s_40_46 s_40_45 1;
assert
    true
&&
    f_0_low60_40_low20_6 = f_0_low60_40_low20_5,
    u_40_46 = u_40_45,
    v_40_46 = v_40_45,
    g_0_low60_40_low20_6 * (const 64 2) = g_0_low60_40_low20_5,
    r_40_46 * (const 64 2) = r_40_45,
    s_40_46 * (const 64 2) = s_40_45
;

assume
    f_0_low60_40_low20_6 = f_0_low60_40_low20_5,
    u_40_46 = u_40_45,
    v_40_46 = v_40_45,
    g_0_low60_40_low20_6 * 2 = g_0_low60_40_low20_5,
    r_40_46 * 2 = r_40_45,
    s_40_46 * 2 = s_40_45
&&
    true
;

{
    u_40_46 * f_0_low60_40_low20_0 + v_40_46 * g_0_low60_40_low20_0 = f_0_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_46 * f_0_low60_40_low20_0 + s_40_46 * g_0_low60_40_low20_0 = g_0_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_6 + u_40_46 * (const 64 (2**21)) + v_40_46 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_6 + r_40_46 * (const 64 (2**21)) + s_40_46 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_6,
    f_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_6,
    g_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 46)) <=s delta, delta <=s (const 64 (1 + 2*46)),
    (const 64 (-(2**20))) <=s u_40_46, u_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_46, v_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_46, r_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_46, s_40_46 <=s (const 64 ((2**20)-1)),
    u_40_46 + v_40_46 <=s (const 64 (2**20)),
    u_40_46 - v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 + v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 - v_40_46 <=s (const 64 (2**20)),
    r_40_46 + s_40_46 <=s (const 64 (2**20)),
    r_40_46 - s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 + s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 - s_40_46 <=s (const 64 (2**20)),
    u_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_40_46 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_045_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_5,
sint64 g_0_low60_40_low20_5,
sint64 f_0_low60_40_low20_6,
sint64 g_0_low60_40_low20_6,
sint64 u_40_45,
sint64 v_40_45,
sint64 r_40_45,
sint64 s_40_45,
sint64 u_40_46,
sint64 v_40_46,
sint64 r_40_46,
sint64 s_40_46,
bit ne
)={
    u_40_45 * f_0_low60_40_low20_0 + v_40_45 * g_0_low60_40_low20_0 = f_0_low60_40_low20_5 * (-(2**20)),
    r_40_45 * f_0_low60_40_low20_0 + s_40_45 * g_0_low60_40_low20_0 = g_0_low60_40_low20_5 * (-(2**20))
&&
    u_40_45 * f_0_low60_40_low20_0 + v_40_45 * g_0_low60_40_low20_0 = f_0_low60_40_low20_5 * (const 64 (-(2**20))),
    r_40_45 * f_0_low60_40_low20_0 + s_40_45 * g_0_low60_40_low20_0 = g_0_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_5 + u_40_45 * (const 64 (2**21)) + v_40_45 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_5 + r_40_45 * (const 64 (2**21)) + s_40_45 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_5,
    f_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_5,
    g_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 45)) <=s delta, delta <=s (const 64 (1 + 2*45)),
    (const 64 (-(2**20))) <=s u_40_45, u_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_45, v_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_45, r_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_45, s_40_45 <=s (const 64 ((2**20)-1)),
    u_40_45 + v_40_45 <=s (const 64 (2**20)),
    u_40_45 - v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 + v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 - v_40_45 <=s (const 64 (2**20)),
    r_40_45 + s_40_45 <=s (const 64 (2**20)),
    r_40_45 - s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 + s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 - s_40_45 <=s (const 64 (2**20)),
    u_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_40_45 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise b
assume
g_0_low60_40_low20_5 = 1 (mod 2)
&&
g_0_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_6 f_0_low60_40_low20_5;
mov u_40_46 u_40_45;
mov v_40_46 v_40_45;

add g_0_low60_40_low20_6 g_0_low60_40_low20_5 f_0_low60_40_low20_5;
asr g_0_low60_40_low20_6 g_0_low60_40_low20_6 1;
add r_40_46 r_40_45 u_40_45;
asr r_40_46 r_40_46 1;
add s_40_46 s_40_45 v_40_45;
asr s_40_46 s_40_46 1;
assert
    true
&&
    f_0_low60_40_low20_6 = f_0_low60_40_low20_5,
    u_40_46 = u_40_45,
    v_40_46 = v_40_45,
    g_0_low60_40_low20_6 * (const 64 2) = g_0_low60_40_low20_5 + f_0_low60_40_low20_5,
    r_40_46 * (const 64 2) = r_40_45 + u_40_45,
    s_40_46 * (const 64 2) = s_40_45 + v_40_45
;

assume
    f_0_low60_40_low20_6 = f_0_low60_40_low20_5,
    u_40_46 = u_40_45,
    v_40_46 = v_40_45,
    g_0_low60_40_low20_6 * 2 = g_0_low60_40_low20_5 + f_0_low60_40_low20_5,
    r_40_46 * 2 = r_40_45 + u_40_45,
    s_40_46 * 2 = s_40_45 + v_40_45
&&
    true
;

{
    u_40_46 * f_0_low60_40_low20_0 + v_40_46 * g_0_low60_40_low20_0 = f_0_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_46 * f_0_low60_40_low20_0 + s_40_46 * g_0_low60_40_low20_0 = g_0_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_6 + u_40_46 * (const 64 (2**21)) + v_40_46 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_6 + r_40_46 * (const 64 (2**21)) + s_40_46 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_6,
    f_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_6,
    g_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 46)) <=s delta, delta <=s (const 64 (1 + 2*46)),
    (const 64 (-(2**20))) <=s u_40_46, u_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_46, v_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_46, r_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_46, s_40_46 <=s (const 64 ((2**20)-1)),
    u_40_46 + v_40_46 <=s (const 64 (2**20)),
    u_40_46 - v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 + v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 - v_40_46 <=s (const 64 (2**20)),
    r_40_46 + s_40_46 <=s (const 64 (2**20)),
    r_40_46 - s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 + s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 - s_40_46 <=s (const 64 (2**20)),
    u_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_40_46 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_045_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_5,
sint64 g_0_low60_40_low20_5,
sint64 f_0_low60_40_low20_6,
sint64 g_0_low60_40_low20_6,
sint64 u_40_45,
sint64 v_40_45,
sint64 r_40_45,
sint64 s_40_45,
sint64 u_40_46,
sint64 v_40_46,
sint64 r_40_46,
sint64 s_40_46,
bit ne
)={
    u_40_45 * f_0_low60_40_low20_0 + v_40_45 * g_0_low60_40_low20_0 = f_0_low60_40_low20_5 * (-(2**20)),
    r_40_45 * f_0_low60_40_low20_0 + s_40_45 * g_0_low60_40_low20_0 = g_0_low60_40_low20_5 * (-(2**20))
&&
    u_40_45 * f_0_low60_40_low20_0 + v_40_45 * g_0_low60_40_low20_0 = f_0_low60_40_low20_5 * (const 64 (-(2**20))),
    r_40_45 * f_0_low60_40_low20_0 + s_40_45 * g_0_low60_40_low20_0 = g_0_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_5 + u_40_45 * (const 64 (2**21)) + v_40_45 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_5 + r_40_45 * (const 64 (2**21)) + s_40_45 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_5,
    f_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_5,
    g_0_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 45)) <=s delta, delta <=s (const 64 (1 + 2*45)),
    (const 64 (-(2**20))) <=s u_40_45, u_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_45, v_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_45, r_40_45 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_45, s_40_45 <=s (const 64 ((2**20)-1)),
    u_40_45 + v_40_45 <=s (const 64 (2**20)),
    u_40_45 - v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 + v_40_45 <=s (const 64 (2**20)),
    (const 64 0) - u_40_45 - v_40_45 <=s (const 64 (2**20)),
    r_40_45 + s_40_45 <=s (const 64 (2**20)),
    r_40_45 - s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 + s_40_45 <=s (const 64 (2**20)),
    (const 64 0) - r_40_45 - s_40_45 <=s (const 64 (2**20)),
    u_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_40_45 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_40_45 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise c
assume
g_0_low60_40_low20_5 = 1 (mod 2)
&&
g_0_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_6 g_0_low60_40_low20_5;
mov u_40_46 r_40_45;
mov v_40_46 s_40_45;

subs dc g_0_low60_40_low20_6 g_0_low60_40_low20_5 f_0_low60_40_low20_5;
asr g_0_low60_40_low20_6 g_0_low60_40_low20_6 1;
subs dc r_40_46 r_40_45 u_40_45;
asr r_40_46 r_40_46 1;
subs dc s_40_46 s_40_45 v_40_45;
asr s_40_46 s_40_46 1;
assert
    true
&&
    f_0_low60_40_low20_6 = g_0_low60_40_low20_5,
    u_40_46 = r_40_45,
    v_40_46 = s_40_45,
    g_0_low60_40_low20_6 * (const 64 2) = g_0_low60_40_low20_5 - f_0_low60_40_low20_5,
    r_40_46 * (const 64 2) = r_40_45 - u_40_45,
    s_40_46 * (const 64 2) = s_40_45 - v_40_45
;

assume
    f_0_low60_40_low20_6 = g_0_low60_40_low20_5,
    u_40_46 = r_40_45,
    v_40_46 = s_40_45,
    g_0_low60_40_low20_6 * 2 = g_0_low60_40_low20_5 - f_0_low60_40_low20_5,
    r_40_46 * 2 = r_40_45 - u_40_45,
    s_40_46 * 2 = s_40_45 - v_40_45
&&
    true
;

{
    u_40_46 * f_0_low60_40_low20_0 + v_40_46 * g_0_low60_40_low20_0 = f_0_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_46 * f_0_low60_40_low20_0 + s_40_46 * g_0_low60_40_low20_0 = g_0_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_6 + u_40_46 * (const 64 (2**21)) + v_40_46 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_6 + r_40_46 * (const 64 (2**21)) + s_40_46 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_6,
    f_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_6,
    g_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 46)) <=s delta, delta <=s (const 64 (1 + 2*46)),
    (const 64 (-(2**20))) <=s u_40_46, u_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_46, v_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_46, r_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_46, s_40_46 <=s (const 64 ((2**20)-1)),
    u_40_46 + v_40_46 <=s (const 64 (2**20)),
    u_40_46 - v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 + v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 - v_40_46 <=s (const 64 (2**20)),
    r_40_46 + s_40_46 <=s (const 64 (2**20)),
    r_40_46 - s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 + s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 - s_40_46 <=s (const 64 (2**20)),
    u_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_40_46 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_046_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_6,
sint64 g_0_low60_40_low20_6,
sint64 f_0_low60_40_low20_7,
sint64 g_0_low60_40_low20_7,
sint64 u_40_46,
sint64 v_40_46,
sint64 r_40_46,
sint64 s_40_46,
sint64 u_40_47,
sint64 v_40_47,
sint64 r_40_47,
sint64 s_40_47,
bit ne
)={
    u_40_46 * f_0_low60_40_low20_0 + v_40_46 * g_0_low60_40_low20_0 = f_0_low60_40_low20_6 * (-(2**20)),
    r_40_46 * f_0_low60_40_low20_0 + s_40_46 * g_0_low60_40_low20_0 = g_0_low60_40_low20_6 * (-(2**20))
&&
    u_40_46 * f_0_low60_40_low20_0 + v_40_46 * g_0_low60_40_low20_0 = f_0_low60_40_low20_6 * (const 64 (-(2**20))),
    r_40_46 * f_0_low60_40_low20_0 + s_40_46 * g_0_low60_40_low20_0 = g_0_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_6 + u_40_46 * (const 64 (2**21)) + v_40_46 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_6 + r_40_46 * (const 64 (2**21)) + s_40_46 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_6,
    f_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_6,
    g_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 46)) <=s delta, delta <=s (const 64 (1 + 2*46)),
    (const 64 (-(2**20))) <=s u_40_46, u_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_46, v_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_46, r_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_46, s_40_46 <=s (const 64 ((2**20)-1)),
    u_40_46 + v_40_46 <=s (const 64 (2**20)),
    u_40_46 - v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 + v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 - v_40_46 <=s (const 64 (2**20)),
    r_40_46 + s_40_46 <=s (const 64 (2**20)),
    r_40_46 - s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 + s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 - s_40_46 <=s (const 64 (2**20)),
    u_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_40_46 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise a
assume
g_0_low60_40_low20_6 = 0 (mod 2)
&&
g_0_low60_40_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_7 f_0_low60_40_low20_6;
mov u_40_47 u_40_46;
mov v_40_47 v_40_46;

asr g_0_low60_40_low20_7 g_0_low60_40_low20_6 1;
asr r_40_47 r_40_46 1;
asr s_40_47 s_40_46 1;
assert
    true
&&
    f_0_low60_40_low20_7 = f_0_low60_40_low20_6,
    u_40_47 = u_40_46,
    v_40_47 = v_40_46,
    g_0_low60_40_low20_7 * (const 64 2) = g_0_low60_40_low20_6,
    r_40_47 * (const 64 2) = r_40_46,
    s_40_47 * (const 64 2) = s_40_46
;

assume
    f_0_low60_40_low20_7 = f_0_low60_40_low20_6,
    u_40_47 = u_40_46,
    v_40_47 = v_40_46,
    g_0_low60_40_low20_7 * 2 = g_0_low60_40_low20_6,
    r_40_47 * 2 = r_40_46,
    s_40_47 * 2 = s_40_46
&&
    true
;

{
    u_40_47 * f_0_low60_40_low20_0 + v_40_47 * g_0_low60_40_low20_0 = f_0_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_47 * f_0_low60_40_low20_0 + s_40_47 * g_0_low60_40_low20_0 = g_0_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_7 + u_40_47 * (const 64 (2**21)) + v_40_47 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_7 + r_40_47 * (const 64 (2**21)) + s_40_47 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_7,
    f_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_7,
    g_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 47)) <=s delta, delta <=s (const 64 (1 + 2*47)),
    (const 64 (-(2**20))) <=s u_40_47, u_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_47, v_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_47, r_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_47, s_40_47 <=s (const 64 ((2**20)-1)),
    u_40_47 + v_40_47 <=s (const 64 (2**20)),
    u_40_47 - v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 + v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 - v_40_47 <=s (const 64 (2**20)),
    r_40_47 + s_40_47 <=s (const 64 (2**20)),
    r_40_47 - s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 + s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 - s_40_47 <=s (const 64 (2**20)),
    u_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_40_47 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_046_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_6,
sint64 g_0_low60_40_low20_6,
sint64 f_0_low60_40_low20_7,
sint64 g_0_low60_40_low20_7,
sint64 u_40_46,
sint64 v_40_46,
sint64 r_40_46,
sint64 s_40_46,
sint64 u_40_47,
sint64 v_40_47,
sint64 r_40_47,
sint64 s_40_47,
bit ne
)={
    u_40_46 * f_0_low60_40_low20_0 + v_40_46 * g_0_low60_40_low20_0 = f_0_low60_40_low20_6 * (-(2**20)),
    r_40_46 * f_0_low60_40_low20_0 + s_40_46 * g_0_low60_40_low20_0 = g_0_low60_40_low20_6 * (-(2**20))
&&
    u_40_46 * f_0_low60_40_low20_0 + v_40_46 * g_0_low60_40_low20_0 = f_0_low60_40_low20_6 * (const 64 (-(2**20))),
    r_40_46 * f_0_low60_40_low20_0 + s_40_46 * g_0_low60_40_low20_0 = g_0_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_6 + u_40_46 * (const 64 (2**21)) + v_40_46 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_6 + r_40_46 * (const 64 (2**21)) + s_40_46 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_6,
    f_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_6,
    g_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 46)) <=s delta, delta <=s (const 64 (1 + 2*46)),
    (const 64 (-(2**20))) <=s u_40_46, u_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_46, v_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_46, r_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_46, s_40_46 <=s (const 64 ((2**20)-1)),
    u_40_46 + v_40_46 <=s (const 64 (2**20)),
    u_40_46 - v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 + v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 - v_40_46 <=s (const 64 (2**20)),
    r_40_46 + s_40_46 <=s (const 64 (2**20)),
    r_40_46 - s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 + s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 - s_40_46 <=s (const 64 (2**20)),
    u_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_40_46 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise b
assume
g_0_low60_40_low20_6 = 1 (mod 2)
&&
g_0_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_7 f_0_low60_40_low20_6;
mov u_40_47 u_40_46;
mov v_40_47 v_40_46;

add g_0_low60_40_low20_7 g_0_low60_40_low20_6 f_0_low60_40_low20_6;
asr g_0_low60_40_low20_7 g_0_low60_40_low20_7 1;
add r_40_47 r_40_46 u_40_46;
asr r_40_47 r_40_47 1;
add s_40_47 s_40_46 v_40_46;
asr s_40_47 s_40_47 1;
assert
    true
&&
    f_0_low60_40_low20_7 = f_0_low60_40_low20_6,
    u_40_47 = u_40_46,
    v_40_47 = v_40_46,
    g_0_low60_40_low20_7 * (const 64 2) = g_0_low60_40_low20_6 + f_0_low60_40_low20_6,
    r_40_47 * (const 64 2) = r_40_46 + u_40_46,
    s_40_47 * (const 64 2) = s_40_46 + v_40_46
;

assume
    f_0_low60_40_low20_7 = f_0_low60_40_low20_6,
    u_40_47 = u_40_46,
    v_40_47 = v_40_46,
    g_0_low60_40_low20_7 * 2 = g_0_low60_40_low20_6 + f_0_low60_40_low20_6,
    r_40_47 * 2 = r_40_46 + u_40_46,
    s_40_47 * 2 = s_40_46 + v_40_46
&&
    true
;

{
    u_40_47 * f_0_low60_40_low20_0 + v_40_47 * g_0_low60_40_low20_0 = f_0_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_47 * f_0_low60_40_low20_0 + s_40_47 * g_0_low60_40_low20_0 = g_0_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_7 + u_40_47 * (const 64 (2**21)) + v_40_47 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_7 + r_40_47 * (const 64 (2**21)) + s_40_47 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_7,
    f_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_7,
    g_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 47)) <=s delta, delta <=s (const 64 (1 + 2*47)),
    (const 64 (-(2**20))) <=s u_40_47, u_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_47, v_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_47, r_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_47, s_40_47 <=s (const 64 ((2**20)-1)),
    u_40_47 + v_40_47 <=s (const 64 (2**20)),
    u_40_47 - v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 + v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 - v_40_47 <=s (const 64 (2**20)),
    r_40_47 + s_40_47 <=s (const 64 (2**20)),
    r_40_47 - s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 + s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 - s_40_47 <=s (const 64 (2**20)),
    u_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_40_47 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_046_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_6,
sint64 g_0_low60_40_low20_6,
sint64 f_0_low60_40_low20_7,
sint64 g_0_low60_40_low20_7,
sint64 u_40_46,
sint64 v_40_46,
sint64 r_40_46,
sint64 s_40_46,
sint64 u_40_47,
sint64 v_40_47,
sint64 r_40_47,
sint64 s_40_47,
bit ne
)={
    u_40_46 * f_0_low60_40_low20_0 + v_40_46 * g_0_low60_40_low20_0 = f_0_low60_40_low20_6 * (-(2**20)),
    r_40_46 * f_0_low60_40_low20_0 + s_40_46 * g_0_low60_40_low20_0 = g_0_low60_40_low20_6 * (-(2**20))
&&
    u_40_46 * f_0_low60_40_low20_0 + v_40_46 * g_0_low60_40_low20_0 = f_0_low60_40_low20_6 * (const 64 (-(2**20))),
    r_40_46 * f_0_low60_40_low20_0 + s_40_46 * g_0_low60_40_low20_0 = g_0_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_6 + u_40_46 * (const 64 (2**21)) + v_40_46 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_6 + r_40_46 * (const 64 (2**21)) + s_40_46 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_6,
    f_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_6,
    g_0_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 46)) <=s delta, delta <=s (const 64 (1 + 2*46)),
    (const 64 (-(2**20))) <=s u_40_46, u_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_46, v_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_46, r_40_46 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_46, s_40_46 <=s (const 64 ((2**20)-1)),
    u_40_46 + v_40_46 <=s (const 64 (2**20)),
    u_40_46 - v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 + v_40_46 <=s (const 64 (2**20)),
    (const 64 0) - u_40_46 - v_40_46 <=s (const 64 (2**20)),
    r_40_46 + s_40_46 <=s (const 64 (2**20)),
    r_40_46 - s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 + s_40_46 <=s (const 64 (2**20)),
    (const 64 0) - r_40_46 - s_40_46 <=s (const 64 (2**20)),
    u_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_40_46 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_40_46 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise c
assume
g_0_low60_40_low20_6 = 1 (mod 2)
&&
g_0_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_7 g_0_low60_40_low20_6;
mov u_40_47 r_40_46;
mov v_40_47 s_40_46;

subs dc g_0_low60_40_low20_7 g_0_low60_40_low20_6 f_0_low60_40_low20_6;
asr g_0_low60_40_low20_7 g_0_low60_40_low20_7 1;
subs dc r_40_47 r_40_46 u_40_46;
asr r_40_47 r_40_47 1;
subs dc s_40_47 s_40_46 v_40_46;
asr s_40_47 s_40_47 1;
assert
    true
&&
    f_0_low60_40_low20_7 = g_0_low60_40_low20_6,
    u_40_47 = r_40_46,
    v_40_47 = s_40_46,
    g_0_low60_40_low20_7 * (const 64 2) = g_0_low60_40_low20_6 - f_0_low60_40_low20_6,
    r_40_47 * (const 64 2) = r_40_46 - u_40_46,
    s_40_47 * (const 64 2) = s_40_46 - v_40_46
;

assume
    f_0_low60_40_low20_7 = g_0_low60_40_low20_6,
    u_40_47 = r_40_46,
    v_40_47 = s_40_46,
    g_0_low60_40_low20_7 * 2 = g_0_low60_40_low20_6 - f_0_low60_40_low20_6,
    r_40_47 * 2 = r_40_46 - u_40_46,
    s_40_47 * 2 = s_40_46 - v_40_46
&&
    true
;

{
    u_40_47 * f_0_low60_40_low20_0 + v_40_47 * g_0_low60_40_low20_0 = f_0_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_47 * f_0_low60_40_low20_0 + s_40_47 * g_0_low60_40_low20_0 = g_0_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_7 + u_40_47 * (const 64 (2**21)) + v_40_47 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_7 + r_40_47 * (const 64 (2**21)) + s_40_47 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_7,
    f_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_7,
    g_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 47)) <=s delta, delta <=s (const 64 (1 + 2*47)),
    (const 64 (-(2**20))) <=s u_40_47, u_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_47, v_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_47, r_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_47, s_40_47 <=s (const 64 ((2**20)-1)),
    u_40_47 + v_40_47 <=s (const 64 (2**20)),
    u_40_47 - v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 + v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 - v_40_47 <=s (const 64 (2**20)),
    r_40_47 + s_40_47 <=s (const 64 (2**20)),
    r_40_47 - s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 + s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 - s_40_47 <=s (const 64 (2**20)),
    u_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_40_47 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_047_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_7,
sint64 g_0_low60_40_low20_7,
sint64 f_0_low60_40_low20_8,
sint64 g_0_low60_40_low20_8,
sint64 u_40_47,
sint64 v_40_47,
sint64 r_40_47,
sint64 s_40_47,
sint64 u_40_48,
sint64 v_40_48,
sint64 r_40_48,
sint64 s_40_48,
bit ne
)={
    u_40_47 * f_0_low60_40_low20_0 + v_40_47 * g_0_low60_40_low20_0 = f_0_low60_40_low20_7 * (-(2**20)),
    r_40_47 * f_0_low60_40_low20_0 + s_40_47 * g_0_low60_40_low20_0 = g_0_low60_40_low20_7 * (-(2**20))
&&
    u_40_47 * f_0_low60_40_low20_0 + v_40_47 * g_0_low60_40_low20_0 = f_0_low60_40_low20_7 * (const 64 (-(2**20))),
    r_40_47 * f_0_low60_40_low20_0 + s_40_47 * g_0_low60_40_low20_0 = g_0_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_7 + u_40_47 * (const 64 (2**21)) + v_40_47 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_7 + r_40_47 * (const 64 (2**21)) + s_40_47 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_7,
    f_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_7,
    g_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 47)) <=s delta, delta <=s (const 64 (1 + 2*47)),
    (const 64 (-(2**20))) <=s u_40_47, u_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_47, v_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_47, r_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_47, s_40_47 <=s (const 64 ((2**20)-1)),
    u_40_47 + v_40_47 <=s (const 64 (2**20)),
    u_40_47 - v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 + v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 - v_40_47 <=s (const 64 (2**20)),
    r_40_47 + s_40_47 <=s (const 64 (2**20)),
    r_40_47 - s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 + s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 - s_40_47 <=s (const 64 (2**20)),
    u_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_40_47 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise a
assume
g_0_low60_40_low20_7 = 0 (mod 2)
&&
g_0_low60_40_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_8 f_0_low60_40_low20_7;
mov u_40_48 u_40_47;
mov v_40_48 v_40_47;

asr g_0_low60_40_low20_8 g_0_low60_40_low20_7 1;
asr r_40_48 r_40_47 1;
asr s_40_48 s_40_47 1;
assert
    true
&&
    f_0_low60_40_low20_8 = f_0_low60_40_low20_7,
    u_40_48 = u_40_47,
    v_40_48 = v_40_47,
    g_0_low60_40_low20_8 * (const 64 2) = g_0_low60_40_low20_7,
    r_40_48 * (const 64 2) = r_40_47,
    s_40_48 * (const 64 2) = s_40_47
;

assume
    f_0_low60_40_low20_8 = f_0_low60_40_low20_7,
    u_40_48 = u_40_47,
    v_40_48 = v_40_47,
    g_0_low60_40_low20_8 * 2 = g_0_low60_40_low20_7,
    r_40_48 * 2 = r_40_47,
    s_40_48 * 2 = s_40_47
&&
    true
;

{
    u_40_48 * f_0_low60_40_low20_0 + v_40_48 * g_0_low60_40_low20_0 = f_0_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_48 * f_0_low60_40_low20_0 + s_40_48 * g_0_low60_40_low20_0 = g_0_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_8 + u_40_48 * (const 64 (2**21)) + v_40_48 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_8 + r_40_48 * (const 64 (2**21)) + s_40_48 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_8,
    f_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_8,
    g_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 48)) <=s delta, delta <=s (const 64 (1 + 2*48)),
    (const 64 (-(2**20))) <=s u_40_48, u_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_48, v_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_48, r_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_48, s_40_48 <=s (const 64 ((2**20)-1)),
    u_40_48 + v_40_48 <=s (const 64 (2**20)),
    u_40_48 - v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 + v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 - v_40_48 <=s (const 64 (2**20)),
    r_40_48 + s_40_48 <=s (const 64 (2**20)),
    r_40_48 - s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 + s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 - s_40_48 <=s (const 64 (2**20)),
    u_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_40_48 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_047_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_7,
sint64 g_0_low60_40_low20_7,
sint64 f_0_low60_40_low20_8,
sint64 g_0_low60_40_low20_8,
sint64 u_40_47,
sint64 v_40_47,
sint64 r_40_47,
sint64 s_40_47,
sint64 u_40_48,
sint64 v_40_48,
sint64 r_40_48,
sint64 s_40_48,
bit ne
)={
    u_40_47 * f_0_low60_40_low20_0 + v_40_47 * g_0_low60_40_low20_0 = f_0_low60_40_low20_7 * (-(2**20)),
    r_40_47 * f_0_low60_40_low20_0 + s_40_47 * g_0_low60_40_low20_0 = g_0_low60_40_low20_7 * (-(2**20))
&&
    u_40_47 * f_0_low60_40_low20_0 + v_40_47 * g_0_low60_40_low20_0 = f_0_low60_40_low20_7 * (const 64 (-(2**20))),
    r_40_47 * f_0_low60_40_low20_0 + s_40_47 * g_0_low60_40_low20_0 = g_0_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_7 + u_40_47 * (const 64 (2**21)) + v_40_47 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_7 + r_40_47 * (const 64 (2**21)) + s_40_47 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_7,
    f_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_7,
    g_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 47)) <=s delta, delta <=s (const 64 (1 + 2*47)),
    (const 64 (-(2**20))) <=s u_40_47, u_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_47, v_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_47, r_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_47, s_40_47 <=s (const 64 ((2**20)-1)),
    u_40_47 + v_40_47 <=s (const 64 (2**20)),
    u_40_47 - v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 + v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 - v_40_47 <=s (const 64 (2**20)),
    r_40_47 + s_40_47 <=s (const 64 (2**20)),
    r_40_47 - s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 + s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 - s_40_47 <=s (const 64 (2**20)),
    u_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_40_47 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise b
assume
g_0_low60_40_low20_7 = 1 (mod 2)
&&
g_0_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_8 f_0_low60_40_low20_7;
mov u_40_48 u_40_47;
mov v_40_48 v_40_47;

add g_0_low60_40_low20_8 g_0_low60_40_low20_7 f_0_low60_40_low20_7;
asr g_0_low60_40_low20_8 g_0_low60_40_low20_8 1;
add r_40_48 r_40_47 u_40_47;
asr r_40_48 r_40_48 1;
add s_40_48 s_40_47 v_40_47;
asr s_40_48 s_40_48 1;
assert
    true
&&
    f_0_low60_40_low20_8 = f_0_low60_40_low20_7,
    u_40_48 = u_40_47,
    v_40_48 = v_40_47,
    g_0_low60_40_low20_8 * (const 64 2) = g_0_low60_40_low20_7 + f_0_low60_40_low20_7,
    r_40_48 * (const 64 2) = r_40_47 + u_40_47,
    s_40_48 * (const 64 2) = s_40_47 + v_40_47
;

assume
    f_0_low60_40_low20_8 = f_0_low60_40_low20_7,
    u_40_48 = u_40_47,
    v_40_48 = v_40_47,
    g_0_low60_40_low20_8 * 2 = g_0_low60_40_low20_7 + f_0_low60_40_low20_7,
    r_40_48 * 2 = r_40_47 + u_40_47,
    s_40_48 * 2 = s_40_47 + v_40_47
&&
    true
;

{
    u_40_48 * f_0_low60_40_low20_0 + v_40_48 * g_0_low60_40_low20_0 = f_0_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_48 * f_0_low60_40_low20_0 + s_40_48 * g_0_low60_40_low20_0 = g_0_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_8 + u_40_48 * (const 64 (2**21)) + v_40_48 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_8 + r_40_48 * (const 64 (2**21)) + s_40_48 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_8,
    f_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_8,
    g_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 48)) <=s delta, delta <=s (const 64 (1 + 2*48)),
    (const 64 (-(2**20))) <=s u_40_48, u_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_48, v_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_48, r_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_48, s_40_48 <=s (const 64 ((2**20)-1)),
    u_40_48 + v_40_48 <=s (const 64 (2**20)),
    u_40_48 - v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 + v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 - v_40_48 <=s (const 64 (2**20)),
    r_40_48 + s_40_48 <=s (const 64 (2**20)),
    r_40_48 - s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 + s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 - s_40_48 <=s (const 64 (2**20)),
    u_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_40_48 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_047_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_7,
sint64 g_0_low60_40_low20_7,
sint64 f_0_low60_40_low20_8,
sint64 g_0_low60_40_low20_8,
sint64 u_40_47,
sint64 v_40_47,
sint64 r_40_47,
sint64 s_40_47,
sint64 u_40_48,
sint64 v_40_48,
sint64 r_40_48,
sint64 s_40_48,
bit ne
)={
    u_40_47 * f_0_low60_40_low20_0 + v_40_47 * g_0_low60_40_low20_0 = f_0_low60_40_low20_7 * (-(2**20)),
    r_40_47 * f_0_low60_40_low20_0 + s_40_47 * g_0_low60_40_low20_0 = g_0_low60_40_low20_7 * (-(2**20))
&&
    u_40_47 * f_0_low60_40_low20_0 + v_40_47 * g_0_low60_40_low20_0 = f_0_low60_40_low20_7 * (const 64 (-(2**20))),
    r_40_47 * f_0_low60_40_low20_0 + s_40_47 * g_0_low60_40_low20_0 = g_0_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_7 + u_40_47 * (const 64 (2**21)) + v_40_47 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_7 + r_40_47 * (const 64 (2**21)) + s_40_47 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_7,
    f_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_7,
    g_0_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 47)) <=s delta, delta <=s (const 64 (1 + 2*47)),
    (const 64 (-(2**20))) <=s u_40_47, u_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_47, v_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_47, r_40_47 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_47, s_40_47 <=s (const 64 ((2**20)-1)),
    u_40_47 + v_40_47 <=s (const 64 (2**20)),
    u_40_47 - v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 + v_40_47 <=s (const 64 (2**20)),
    (const 64 0) - u_40_47 - v_40_47 <=s (const 64 (2**20)),
    r_40_47 + s_40_47 <=s (const 64 (2**20)),
    r_40_47 - s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 + s_40_47 <=s (const 64 (2**20)),
    (const 64 0) - r_40_47 - s_40_47 <=s (const 64 (2**20)),
    u_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_40_47 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_40_47 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise c
assume
g_0_low60_40_low20_7 = 1 (mod 2)
&&
g_0_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_8 g_0_low60_40_low20_7;
mov u_40_48 r_40_47;
mov v_40_48 s_40_47;

subs dc g_0_low60_40_low20_8 g_0_low60_40_low20_7 f_0_low60_40_low20_7;
asr g_0_low60_40_low20_8 g_0_low60_40_low20_8 1;
subs dc r_40_48 r_40_47 u_40_47;
asr r_40_48 r_40_48 1;
subs dc s_40_48 s_40_47 v_40_47;
asr s_40_48 s_40_48 1;
assert
    true
&&
    f_0_low60_40_low20_8 = g_0_low60_40_low20_7,
    u_40_48 = r_40_47,
    v_40_48 = s_40_47,
    g_0_low60_40_low20_8 * (const 64 2) = g_0_low60_40_low20_7 - f_0_low60_40_low20_7,
    r_40_48 * (const 64 2) = r_40_47 - u_40_47,
    s_40_48 * (const 64 2) = s_40_47 - v_40_47
;

assume
    f_0_low60_40_low20_8 = g_0_low60_40_low20_7,
    u_40_48 = r_40_47,
    v_40_48 = s_40_47,
    g_0_low60_40_low20_8 * 2 = g_0_low60_40_low20_7 - f_0_low60_40_low20_7,
    r_40_48 * 2 = r_40_47 - u_40_47,
    s_40_48 * 2 = s_40_47 - v_40_47
&&
    true
;

{
    u_40_48 * f_0_low60_40_low20_0 + v_40_48 * g_0_low60_40_low20_0 = f_0_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_48 * f_0_low60_40_low20_0 + s_40_48 * g_0_low60_40_low20_0 = g_0_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_8 + u_40_48 * (const 64 (2**21)) + v_40_48 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_8 + r_40_48 * (const 64 (2**21)) + s_40_48 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_8,
    f_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_8,
    g_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 48)) <=s delta, delta <=s (const 64 (1 + 2*48)),
    (const 64 (-(2**20))) <=s u_40_48, u_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_48, v_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_48, r_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_48, s_40_48 <=s (const 64 ((2**20)-1)),
    u_40_48 + v_40_48 <=s (const 64 (2**20)),
    u_40_48 - v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 + v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 - v_40_48 <=s (const 64 (2**20)),
    r_40_48 + s_40_48 <=s (const 64 (2**20)),
    r_40_48 - s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 + s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 - s_40_48 <=s (const 64 (2**20)),
    u_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_40_48 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_048_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_8,
sint64 g_0_low60_40_low20_8,
sint64 f_0_low60_40_low20_9,
sint64 g_0_low60_40_low20_9,
sint64 u_40_48,
sint64 v_40_48,
sint64 r_40_48,
sint64 s_40_48,
sint64 u_40_49,
sint64 v_40_49,
sint64 r_40_49,
sint64 s_40_49,
bit ne
)={
    u_40_48 * f_0_low60_40_low20_0 + v_40_48 * g_0_low60_40_low20_0 = f_0_low60_40_low20_8 * (-(2**20)),
    r_40_48 * f_0_low60_40_low20_0 + s_40_48 * g_0_low60_40_low20_0 = g_0_low60_40_low20_8 * (-(2**20))
&&
    u_40_48 * f_0_low60_40_low20_0 + v_40_48 * g_0_low60_40_low20_0 = f_0_low60_40_low20_8 * (const 64 (-(2**20))),
    r_40_48 * f_0_low60_40_low20_0 + s_40_48 * g_0_low60_40_low20_0 = g_0_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_8 + u_40_48 * (const 64 (2**21)) + v_40_48 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_8 + r_40_48 * (const 64 (2**21)) + s_40_48 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_8,
    f_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_8,
    g_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 48)) <=s delta, delta <=s (const 64 (1 + 2*48)),
    (const 64 (-(2**20))) <=s u_40_48, u_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_48, v_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_48, r_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_48, s_40_48 <=s (const 64 ((2**20)-1)),
    u_40_48 + v_40_48 <=s (const 64 (2**20)),
    u_40_48 - v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 + v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 - v_40_48 <=s (const 64 (2**20)),
    r_40_48 + s_40_48 <=s (const 64 (2**20)),
    r_40_48 - s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 + s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 - s_40_48 <=s (const 64 (2**20)),
    u_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_40_48 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise a
assume
g_0_low60_40_low20_8 = 0 (mod 2)
&&
g_0_low60_40_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_9 f_0_low60_40_low20_8;
mov u_40_49 u_40_48;
mov v_40_49 v_40_48;

asr g_0_low60_40_low20_9 g_0_low60_40_low20_8 1;
asr r_40_49 r_40_48 1;
asr s_40_49 s_40_48 1;
assert
    true
&&
    f_0_low60_40_low20_9 = f_0_low60_40_low20_8,
    u_40_49 = u_40_48,
    v_40_49 = v_40_48,
    g_0_low60_40_low20_9 * (const 64 2) = g_0_low60_40_low20_8,
    r_40_49 * (const 64 2) = r_40_48,
    s_40_49 * (const 64 2) = s_40_48
;

assume
    f_0_low60_40_low20_9 = f_0_low60_40_low20_8,
    u_40_49 = u_40_48,
    v_40_49 = v_40_48,
    g_0_low60_40_low20_9 * 2 = g_0_low60_40_low20_8,
    r_40_49 * 2 = r_40_48,
    s_40_49 * 2 = s_40_48
&&
    true
;

{
    u_40_49 * f_0_low60_40_low20_0 + v_40_49 * g_0_low60_40_low20_0 = f_0_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_49 * f_0_low60_40_low20_0 + s_40_49 * g_0_low60_40_low20_0 = g_0_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_9 + u_40_49 * (const 64 (2**21)) + v_40_49 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_9 + r_40_49 * (const 64 (2**21)) + s_40_49 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_9,
    f_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_9,
    g_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 49)) <=s delta, delta <=s (const 64 (1 + 2*49)),
    (const 64 (-(2**20))) <=s u_40_49, u_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_49, v_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_49, r_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_49, s_40_49 <=s (const 64 ((2**20)-1)),
    u_40_49 + v_40_49 <=s (const 64 (2**20)),
    u_40_49 - v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 + v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 - v_40_49 <=s (const 64 (2**20)),
    r_40_49 + s_40_49 <=s (const 64 (2**20)),
    r_40_49 - s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 + s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 - s_40_49 <=s (const 64 (2**20)),
    u_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_40_49 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_048_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_8,
sint64 g_0_low60_40_low20_8,
sint64 f_0_low60_40_low20_9,
sint64 g_0_low60_40_low20_9,
sint64 u_40_48,
sint64 v_40_48,
sint64 r_40_48,
sint64 s_40_48,
sint64 u_40_49,
sint64 v_40_49,
sint64 r_40_49,
sint64 s_40_49,
bit ne
)={
    u_40_48 * f_0_low60_40_low20_0 + v_40_48 * g_0_low60_40_low20_0 = f_0_low60_40_low20_8 * (-(2**20)),
    r_40_48 * f_0_low60_40_low20_0 + s_40_48 * g_0_low60_40_low20_0 = g_0_low60_40_low20_8 * (-(2**20))
&&
    u_40_48 * f_0_low60_40_low20_0 + v_40_48 * g_0_low60_40_low20_0 = f_0_low60_40_low20_8 * (const 64 (-(2**20))),
    r_40_48 * f_0_low60_40_low20_0 + s_40_48 * g_0_low60_40_low20_0 = g_0_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_8 + u_40_48 * (const 64 (2**21)) + v_40_48 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_8 + r_40_48 * (const 64 (2**21)) + s_40_48 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_8,
    f_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_8,
    g_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 48)) <=s delta, delta <=s (const 64 (1 + 2*48)),
    (const 64 (-(2**20))) <=s u_40_48, u_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_48, v_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_48, r_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_48, s_40_48 <=s (const 64 ((2**20)-1)),
    u_40_48 + v_40_48 <=s (const 64 (2**20)),
    u_40_48 - v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 + v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 - v_40_48 <=s (const 64 (2**20)),
    r_40_48 + s_40_48 <=s (const 64 (2**20)),
    r_40_48 - s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 + s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 - s_40_48 <=s (const 64 (2**20)),
    u_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_40_48 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise b
assume
g_0_low60_40_low20_8 = 1 (mod 2)
&&
g_0_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_9 f_0_low60_40_low20_8;
mov u_40_49 u_40_48;
mov v_40_49 v_40_48;

add g_0_low60_40_low20_9 g_0_low60_40_low20_8 f_0_low60_40_low20_8;
asr g_0_low60_40_low20_9 g_0_low60_40_low20_9 1;
add r_40_49 r_40_48 u_40_48;
asr r_40_49 r_40_49 1;
add s_40_49 s_40_48 v_40_48;
asr s_40_49 s_40_49 1;
assert
    true
&&
    f_0_low60_40_low20_9 = f_0_low60_40_low20_8,
    u_40_49 = u_40_48,
    v_40_49 = v_40_48,
    g_0_low60_40_low20_9 * (const 64 2) = g_0_low60_40_low20_8 + f_0_low60_40_low20_8,
    r_40_49 * (const 64 2) = r_40_48 + u_40_48,
    s_40_49 * (const 64 2) = s_40_48 + v_40_48
;

assume
    f_0_low60_40_low20_9 = f_0_low60_40_low20_8,
    u_40_49 = u_40_48,
    v_40_49 = v_40_48,
    g_0_low60_40_low20_9 * 2 = g_0_low60_40_low20_8 + f_0_low60_40_low20_8,
    r_40_49 * 2 = r_40_48 + u_40_48,
    s_40_49 * 2 = s_40_48 + v_40_48
&&
    true
;

{
    u_40_49 * f_0_low60_40_low20_0 + v_40_49 * g_0_low60_40_low20_0 = f_0_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_49 * f_0_low60_40_low20_0 + s_40_49 * g_0_low60_40_low20_0 = g_0_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_9 + u_40_49 * (const 64 (2**21)) + v_40_49 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_9 + r_40_49 * (const 64 (2**21)) + s_40_49 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_9,
    f_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_9,
    g_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 49)) <=s delta, delta <=s (const 64 (1 + 2*49)),
    (const 64 (-(2**20))) <=s u_40_49, u_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_49, v_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_49, r_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_49, s_40_49 <=s (const 64 ((2**20)-1)),
    u_40_49 + v_40_49 <=s (const 64 (2**20)),
    u_40_49 - v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 + v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 - v_40_49 <=s (const 64 (2**20)),
    r_40_49 + s_40_49 <=s (const 64 (2**20)),
    r_40_49 - s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 + s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 - s_40_49 <=s (const 64 (2**20)),
    u_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_40_49 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_048_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_8,
sint64 g_0_low60_40_low20_8,
sint64 f_0_low60_40_low20_9,
sint64 g_0_low60_40_low20_9,
sint64 u_40_48,
sint64 v_40_48,
sint64 r_40_48,
sint64 s_40_48,
sint64 u_40_49,
sint64 v_40_49,
sint64 r_40_49,
sint64 s_40_49,
bit ne
)={
    u_40_48 * f_0_low60_40_low20_0 + v_40_48 * g_0_low60_40_low20_0 = f_0_low60_40_low20_8 * (-(2**20)),
    r_40_48 * f_0_low60_40_low20_0 + s_40_48 * g_0_low60_40_low20_0 = g_0_low60_40_low20_8 * (-(2**20))
&&
    u_40_48 * f_0_low60_40_low20_0 + v_40_48 * g_0_low60_40_low20_0 = f_0_low60_40_low20_8 * (const 64 (-(2**20))),
    r_40_48 * f_0_low60_40_low20_0 + s_40_48 * g_0_low60_40_low20_0 = g_0_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_8 + u_40_48 * (const 64 (2**21)) + v_40_48 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_8 + r_40_48 * (const 64 (2**21)) + s_40_48 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_8,
    f_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_8,
    g_0_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 48)) <=s delta, delta <=s (const 64 (1 + 2*48)),
    (const 64 (-(2**20))) <=s u_40_48, u_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_48, v_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_48, r_40_48 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_48, s_40_48 <=s (const 64 ((2**20)-1)),
    u_40_48 + v_40_48 <=s (const 64 (2**20)),
    u_40_48 - v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 + v_40_48 <=s (const 64 (2**20)),
    (const 64 0) - u_40_48 - v_40_48 <=s (const 64 (2**20)),
    r_40_48 + s_40_48 <=s (const 64 (2**20)),
    r_40_48 - s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 + s_40_48 <=s (const 64 (2**20)),
    (const 64 0) - r_40_48 - s_40_48 <=s (const 64 (2**20)),
    u_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_40_48 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_40_48 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise c
assume
g_0_low60_40_low20_8 = 1 (mod 2)
&&
g_0_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_9 g_0_low60_40_low20_8;
mov u_40_49 r_40_48;
mov v_40_49 s_40_48;

subs dc g_0_low60_40_low20_9 g_0_low60_40_low20_8 f_0_low60_40_low20_8;
asr g_0_low60_40_low20_9 g_0_low60_40_low20_9 1;
subs dc r_40_49 r_40_48 u_40_48;
asr r_40_49 r_40_49 1;
subs dc s_40_49 s_40_48 v_40_48;
asr s_40_49 s_40_49 1;
assert
    true
&&
    f_0_low60_40_low20_9 = g_0_low60_40_low20_8,
    u_40_49 = r_40_48,
    v_40_49 = s_40_48,
    g_0_low60_40_low20_9 * (const 64 2) = g_0_low60_40_low20_8 - f_0_low60_40_low20_8,
    r_40_49 * (const 64 2) = r_40_48 - u_40_48,
    s_40_49 * (const 64 2) = s_40_48 - v_40_48
;

assume
    f_0_low60_40_low20_9 = g_0_low60_40_low20_8,
    u_40_49 = r_40_48,
    v_40_49 = s_40_48,
    g_0_low60_40_low20_9 * 2 = g_0_low60_40_low20_8 - f_0_low60_40_low20_8,
    r_40_49 * 2 = r_40_48 - u_40_48,
    s_40_49 * 2 = s_40_48 - v_40_48
&&
    true
;

{
    u_40_49 * f_0_low60_40_low20_0 + v_40_49 * g_0_low60_40_low20_0 = f_0_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_49 * f_0_low60_40_low20_0 + s_40_49 * g_0_low60_40_low20_0 = g_0_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_9 + u_40_49 * (const 64 (2**21)) + v_40_49 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_9 + r_40_49 * (const 64 (2**21)) + s_40_49 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_9,
    f_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_9,
    g_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 49)) <=s delta, delta <=s (const 64 (1 + 2*49)),
    (const 64 (-(2**20))) <=s u_40_49, u_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_49, v_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_49, r_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_49, s_40_49 <=s (const 64 ((2**20)-1)),
    u_40_49 + v_40_49 <=s (const 64 (2**20)),
    u_40_49 - v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 + v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 - v_40_49 <=s (const 64 (2**20)),
    r_40_49 + s_40_49 <=s (const 64 (2**20)),
    r_40_49 - s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 + s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 - s_40_49 <=s (const 64 (2**20)),
    u_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_40_49 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_049_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_9,
sint64 g_0_low60_40_low20_9,
sint64 f_0_low60_40_low20_10,
sint64 g_0_low60_40_low20_10,
sint64 u_40_49,
sint64 v_40_49,
sint64 r_40_49,
sint64 s_40_49,
sint64 u_40_50,
sint64 v_40_50,
sint64 r_40_50,
sint64 s_40_50,
bit ne
)={
    u_40_49 * f_0_low60_40_low20_0 + v_40_49 * g_0_low60_40_low20_0 = f_0_low60_40_low20_9 * (-(2**20)),
    r_40_49 * f_0_low60_40_low20_0 + s_40_49 * g_0_low60_40_low20_0 = g_0_low60_40_low20_9 * (-(2**20))
&&
    u_40_49 * f_0_low60_40_low20_0 + v_40_49 * g_0_low60_40_low20_0 = f_0_low60_40_low20_9 * (const 64 (-(2**20))),
    r_40_49 * f_0_low60_40_low20_0 + s_40_49 * g_0_low60_40_low20_0 = g_0_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_9 + u_40_49 * (const 64 (2**21)) + v_40_49 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_9 + r_40_49 * (const 64 (2**21)) + s_40_49 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_9,
    f_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_9,
    g_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 49)) <=s delta, delta <=s (const 64 (1 + 2*49)),
    (const 64 (-(2**20))) <=s u_40_49, u_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_49, v_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_49, r_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_49, s_40_49 <=s (const 64 ((2**20)-1)),
    u_40_49 + v_40_49 <=s (const 64 (2**20)),
    u_40_49 - v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 + v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 - v_40_49 <=s (const 64 (2**20)),
    r_40_49 + s_40_49 <=s (const 64 (2**20)),
    r_40_49 - s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 + s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 - s_40_49 <=s (const 64 (2**20)),
    u_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_40_49 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise a
assume
g_0_low60_40_low20_9 = 0 (mod 2)
&&
g_0_low60_40_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_10 f_0_low60_40_low20_9;
mov u_40_50 u_40_49;
mov v_40_50 v_40_49;

asr g_0_low60_40_low20_10 g_0_low60_40_low20_9 1;
asr r_40_50 r_40_49 1;
asr s_40_50 s_40_49 1;
assert
    true
&&
    f_0_low60_40_low20_10 = f_0_low60_40_low20_9,
    u_40_50 = u_40_49,
    v_40_50 = v_40_49,
    g_0_low60_40_low20_10 * (const 64 2) = g_0_low60_40_low20_9,
    r_40_50 * (const 64 2) = r_40_49,
    s_40_50 * (const 64 2) = s_40_49
;

assume
    f_0_low60_40_low20_10 = f_0_low60_40_low20_9,
    u_40_50 = u_40_49,
    v_40_50 = v_40_49,
    g_0_low60_40_low20_10 * 2 = g_0_low60_40_low20_9,
    r_40_50 * 2 = r_40_49,
    s_40_50 * 2 = s_40_49
&&
    true
;

{
    u_40_50 * f_0_low60_40_low20_0 + v_40_50 * g_0_low60_40_low20_0 = f_0_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_50 * f_0_low60_40_low20_0 + s_40_50 * g_0_low60_40_low20_0 = g_0_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_10 + u_40_50 * (const 64 (2**21)) + v_40_50 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_10 + r_40_50 * (const 64 (2**21)) + s_40_50 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_10,
    f_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_10,
    g_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 50)) <=s delta, delta <=s (const 64 (1 + 2*50)),
    (const 64 (-(2**20))) <=s u_40_50, u_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_50, v_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_50, r_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_50, s_40_50 <=s (const 64 ((2**20)-1)),
    u_40_50 + v_40_50 <=s (const 64 (2**20)),
    u_40_50 - v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 + v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 - v_40_50 <=s (const 64 (2**20)),
    r_40_50 + s_40_50 <=s (const 64 (2**20)),
    r_40_50 - s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 + s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 - s_40_50 <=s (const 64 (2**20)),
    u_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_40_50 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_049_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_9,
sint64 g_0_low60_40_low20_9,
sint64 f_0_low60_40_low20_10,
sint64 g_0_low60_40_low20_10,
sint64 u_40_49,
sint64 v_40_49,
sint64 r_40_49,
sint64 s_40_49,
sint64 u_40_50,
sint64 v_40_50,
sint64 r_40_50,
sint64 s_40_50,
bit ne
)={
    u_40_49 * f_0_low60_40_low20_0 + v_40_49 * g_0_low60_40_low20_0 = f_0_low60_40_low20_9 * (-(2**20)),
    r_40_49 * f_0_low60_40_low20_0 + s_40_49 * g_0_low60_40_low20_0 = g_0_low60_40_low20_9 * (-(2**20))
&&
    u_40_49 * f_0_low60_40_low20_0 + v_40_49 * g_0_low60_40_low20_0 = f_0_low60_40_low20_9 * (const 64 (-(2**20))),
    r_40_49 * f_0_low60_40_low20_0 + s_40_49 * g_0_low60_40_low20_0 = g_0_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_9 + u_40_49 * (const 64 (2**21)) + v_40_49 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_9 + r_40_49 * (const 64 (2**21)) + s_40_49 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_9,
    f_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_9,
    g_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 49)) <=s delta, delta <=s (const 64 (1 + 2*49)),
    (const 64 (-(2**20))) <=s u_40_49, u_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_49, v_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_49, r_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_49, s_40_49 <=s (const 64 ((2**20)-1)),
    u_40_49 + v_40_49 <=s (const 64 (2**20)),
    u_40_49 - v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 + v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 - v_40_49 <=s (const 64 (2**20)),
    r_40_49 + s_40_49 <=s (const 64 (2**20)),
    r_40_49 - s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 + s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 - s_40_49 <=s (const 64 (2**20)),
    u_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_40_49 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise b
assume
g_0_low60_40_low20_9 = 1 (mod 2)
&&
g_0_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_10 f_0_low60_40_low20_9;
mov u_40_50 u_40_49;
mov v_40_50 v_40_49;

add g_0_low60_40_low20_10 g_0_low60_40_low20_9 f_0_low60_40_low20_9;
asr g_0_low60_40_low20_10 g_0_low60_40_low20_10 1;
add r_40_50 r_40_49 u_40_49;
asr r_40_50 r_40_50 1;
add s_40_50 s_40_49 v_40_49;
asr s_40_50 s_40_50 1;
assert
    true
&&
    f_0_low60_40_low20_10 = f_0_low60_40_low20_9,
    u_40_50 = u_40_49,
    v_40_50 = v_40_49,
    g_0_low60_40_low20_10 * (const 64 2) = g_0_low60_40_low20_9 + f_0_low60_40_low20_9,
    r_40_50 * (const 64 2) = r_40_49 + u_40_49,
    s_40_50 * (const 64 2) = s_40_49 + v_40_49
;

assume
    f_0_low60_40_low20_10 = f_0_low60_40_low20_9,
    u_40_50 = u_40_49,
    v_40_50 = v_40_49,
    g_0_low60_40_low20_10 * 2 = g_0_low60_40_low20_9 + f_0_low60_40_low20_9,
    r_40_50 * 2 = r_40_49 + u_40_49,
    s_40_50 * 2 = s_40_49 + v_40_49
&&
    true
;

{
    u_40_50 * f_0_low60_40_low20_0 + v_40_50 * g_0_low60_40_low20_0 = f_0_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_50 * f_0_low60_40_low20_0 + s_40_50 * g_0_low60_40_low20_0 = g_0_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_10 + u_40_50 * (const 64 (2**21)) + v_40_50 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_10 + r_40_50 * (const 64 (2**21)) + s_40_50 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_10,
    f_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_10,
    g_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 50)) <=s delta, delta <=s (const 64 (1 + 2*50)),
    (const 64 (-(2**20))) <=s u_40_50, u_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_50, v_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_50, r_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_50, s_40_50 <=s (const 64 ((2**20)-1)),
    u_40_50 + v_40_50 <=s (const 64 (2**20)),
    u_40_50 - v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 + v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 - v_40_50 <=s (const 64 (2**20)),
    r_40_50 + s_40_50 <=s (const 64 (2**20)),
    r_40_50 - s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 + s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 - s_40_50 <=s (const 64 (2**20)),
    u_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_40_50 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_049_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_9,
sint64 g_0_low60_40_low20_9,
sint64 f_0_low60_40_low20_10,
sint64 g_0_low60_40_low20_10,
sint64 u_40_49,
sint64 v_40_49,
sint64 r_40_49,
sint64 s_40_49,
sint64 u_40_50,
sint64 v_40_50,
sint64 r_40_50,
sint64 s_40_50,
bit ne
)={
    u_40_49 * f_0_low60_40_low20_0 + v_40_49 * g_0_low60_40_low20_0 = f_0_low60_40_low20_9 * (-(2**20)),
    r_40_49 * f_0_low60_40_low20_0 + s_40_49 * g_0_low60_40_low20_0 = g_0_low60_40_low20_9 * (-(2**20))
&&
    u_40_49 * f_0_low60_40_low20_0 + v_40_49 * g_0_low60_40_low20_0 = f_0_low60_40_low20_9 * (const 64 (-(2**20))),
    r_40_49 * f_0_low60_40_low20_0 + s_40_49 * g_0_low60_40_low20_0 = g_0_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_9 + u_40_49 * (const 64 (2**21)) + v_40_49 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_9 + r_40_49 * (const 64 (2**21)) + s_40_49 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_9,
    f_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_9,
    g_0_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 49)) <=s delta, delta <=s (const 64 (1 + 2*49)),
    (const 64 (-(2**20))) <=s u_40_49, u_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_49, v_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_49, r_40_49 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_49, s_40_49 <=s (const 64 ((2**20)-1)),
    u_40_49 + v_40_49 <=s (const 64 (2**20)),
    u_40_49 - v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 + v_40_49 <=s (const 64 (2**20)),
    (const 64 0) - u_40_49 - v_40_49 <=s (const 64 (2**20)),
    r_40_49 + s_40_49 <=s (const 64 (2**20)),
    r_40_49 - s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 + s_40_49 <=s (const 64 (2**20)),
    (const 64 0) - r_40_49 - s_40_49 <=s (const 64 (2**20)),
    u_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_40_49 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_40_49 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise c
assume
g_0_low60_40_low20_9 = 1 (mod 2)
&&
g_0_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_10 g_0_low60_40_low20_9;
mov u_40_50 r_40_49;
mov v_40_50 s_40_49;

subs dc g_0_low60_40_low20_10 g_0_low60_40_low20_9 f_0_low60_40_low20_9;
asr g_0_low60_40_low20_10 g_0_low60_40_low20_10 1;
subs dc r_40_50 r_40_49 u_40_49;
asr r_40_50 r_40_50 1;
subs dc s_40_50 s_40_49 v_40_49;
asr s_40_50 s_40_50 1;
assert
    true
&&
    f_0_low60_40_low20_10 = g_0_low60_40_low20_9,
    u_40_50 = r_40_49,
    v_40_50 = s_40_49,
    g_0_low60_40_low20_10 * (const 64 2) = g_0_low60_40_low20_9 - f_0_low60_40_low20_9,
    r_40_50 * (const 64 2) = r_40_49 - u_40_49,
    s_40_50 * (const 64 2) = s_40_49 - v_40_49
;

assume
    f_0_low60_40_low20_10 = g_0_low60_40_low20_9,
    u_40_50 = r_40_49,
    v_40_50 = s_40_49,
    g_0_low60_40_low20_10 * 2 = g_0_low60_40_low20_9 - f_0_low60_40_low20_9,
    r_40_50 * 2 = r_40_49 - u_40_49,
    s_40_50 * 2 = s_40_49 - v_40_49
&&
    true
;

{
    u_40_50 * f_0_low60_40_low20_0 + v_40_50 * g_0_low60_40_low20_0 = f_0_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_50 * f_0_low60_40_low20_0 + s_40_50 * g_0_low60_40_low20_0 = g_0_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_10 + u_40_50 * (const 64 (2**21)) + v_40_50 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_10 + r_40_50 * (const 64 (2**21)) + s_40_50 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_10,
    f_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_10,
    g_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 50)) <=s delta, delta <=s (const 64 (1 + 2*50)),
    (const 64 (-(2**20))) <=s u_40_50, u_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_50, v_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_50, r_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_50, s_40_50 <=s (const 64 ((2**20)-1)),
    u_40_50 + v_40_50 <=s (const 64 (2**20)),
    u_40_50 - v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 + v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 - v_40_50 <=s (const 64 (2**20)),
    r_40_50 + s_40_50 <=s (const 64 (2**20)),
    r_40_50 - s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 + s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 - s_40_50 <=s (const 64 (2**20)),
    u_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_40_50 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_050_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_10,
sint64 g_0_low60_40_low20_10,
sint64 f_0_low60_40_low20_11,
sint64 g_0_low60_40_low20_11,
sint64 u_40_50,
sint64 v_40_50,
sint64 r_40_50,
sint64 s_40_50,
sint64 u_40_51,
sint64 v_40_51,
sint64 r_40_51,
sint64 s_40_51,
bit ne
)={
    u_40_50 * f_0_low60_40_low20_0 + v_40_50 * g_0_low60_40_low20_0 = f_0_low60_40_low20_10 * (-(2**20)),
    r_40_50 * f_0_low60_40_low20_0 + s_40_50 * g_0_low60_40_low20_0 = g_0_low60_40_low20_10 * (-(2**20))
&&
    u_40_50 * f_0_low60_40_low20_0 + v_40_50 * g_0_low60_40_low20_0 = f_0_low60_40_low20_10 * (const 64 (-(2**20))),
    r_40_50 * f_0_low60_40_low20_0 + s_40_50 * g_0_low60_40_low20_0 = g_0_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_10 + u_40_50 * (const 64 (2**21)) + v_40_50 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_10 + r_40_50 * (const 64 (2**21)) + s_40_50 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_10,
    f_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_10,
    g_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 50)) <=s delta, delta <=s (const 64 (1 + 2*50)),
    (const 64 (-(2**20))) <=s u_40_50, u_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_50, v_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_50, r_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_50, s_40_50 <=s (const 64 ((2**20)-1)),
    u_40_50 + v_40_50 <=s (const 64 (2**20)),
    u_40_50 - v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 + v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 - v_40_50 <=s (const 64 (2**20)),
    r_40_50 + s_40_50 <=s (const 64 (2**20)),
    r_40_50 - s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 + s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 - s_40_50 <=s (const 64 (2**20)),
    u_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_40_50 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise a
assume
g_0_low60_40_low20_10 = 0 (mod 2)
&&
g_0_low60_40_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_11 f_0_low60_40_low20_10;
mov u_40_51 u_40_50;
mov v_40_51 v_40_50;

asr g_0_low60_40_low20_11 g_0_low60_40_low20_10 1;
asr r_40_51 r_40_50 1;
asr s_40_51 s_40_50 1;
assert
    true
&&
    f_0_low60_40_low20_11 = f_0_low60_40_low20_10,
    u_40_51 = u_40_50,
    v_40_51 = v_40_50,
    g_0_low60_40_low20_11 * (const 64 2) = g_0_low60_40_low20_10,
    r_40_51 * (const 64 2) = r_40_50,
    s_40_51 * (const 64 2) = s_40_50
;

assume
    f_0_low60_40_low20_11 = f_0_low60_40_low20_10,
    u_40_51 = u_40_50,
    v_40_51 = v_40_50,
    g_0_low60_40_low20_11 * 2 = g_0_low60_40_low20_10,
    r_40_51 * 2 = r_40_50,
    s_40_51 * 2 = s_40_50
&&
    true
;

{
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_11 + u_40_51 * (const 64 (2**21)) + v_40_51 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_11 + r_40_51 * (const 64 (2**21)) + s_40_51 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_11,
    f_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_11,
    g_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 51)) <=s delta, delta <=s (const 64 (1 + 2*51)),
    (const 64 (-(2**20))) <=s u_40_51, u_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_51, v_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_51, r_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_51, s_40_51 <=s (const 64 ((2**20)-1)),
    u_40_51 + v_40_51 <=s (const 64 (2**20)),
    u_40_51 - v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 + v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 - v_40_51 <=s (const 64 (2**20)),
    r_40_51 + s_40_51 <=s (const 64 (2**20)),
    r_40_51 - s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 + s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 - s_40_51 <=s (const 64 (2**20)),
    u_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_40_51 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_050_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_10,
sint64 g_0_low60_40_low20_10,
sint64 f_0_low60_40_low20_11,
sint64 g_0_low60_40_low20_11,
sint64 u_40_50,
sint64 v_40_50,
sint64 r_40_50,
sint64 s_40_50,
sint64 u_40_51,
sint64 v_40_51,
sint64 r_40_51,
sint64 s_40_51,
bit ne
)={
    u_40_50 * f_0_low60_40_low20_0 + v_40_50 * g_0_low60_40_low20_0 = f_0_low60_40_low20_10 * (-(2**20)),
    r_40_50 * f_0_low60_40_low20_0 + s_40_50 * g_0_low60_40_low20_0 = g_0_low60_40_low20_10 * (-(2**20))
&&
    u_40_50 * f_0_low60_40_low20_0 + v_40_50 * g_0_low60_40_low20_0 = f_0_low60_40_low20_10 * (const 64 (-(2**20))),
    r_40_50 * f_0_low60_40_low20_0 + s_40_50 * g_0_low60_40_low20_0 = g_0_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_10 + u_40_50 * (const 64 (2**21)) + v_40_50 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_10 + r_40_50 * (const 64 (2**21)) + s_40_50 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_10,
    f_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_10,
    g_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 50)) <=s delta, delta <=s (const 64 (1 + 2*50)),
    (const 64 (-(2**20))) <=s u_40_50, u_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_50, v_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_50, r_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_50, s_40_50 <=s (const 64 ((2**20)-1)),
    u_40_50 + v_40_50 <=s (const 64 (2**20)),
    u_40_50 - v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 + v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 - v_40_50 <=s (const 64 (2**20)),
    r_40_50 + s_40_50 <=s (const 64 (2**20)),
    r_40_50 - s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 + s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 - s_40_50 <=s (const 64 (2**20)),
    u_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_40_50 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise b
assume
g_0_low60_40_low20_10 = 1 (mod 2)
&&
g_0_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_11 f_0_low60_40_low20_10;
mov u_40_51 u_40_50;
mov v_40_51 v_40_50;

add g_0_low60_40_low20_11 g_0_low60_40_low20_10 f_0_low60_40_low20_10;
asr g_0_low60_40_low20_11 g_0_low60_40_low20_11 1;
add r_40_51 r_40_50 u_40_50;
asr r_40_51 r_40_51 1;
add s_40_51 s_40_50 v_40_50;
asr s_40_51 s_40_51 1;
assert
    true
&&
    f_0_low60_40_low20_11 = f_0_low60_40_low20_10,
    u_40_51 = u_40_50,
    v_40_51 = v_40_50,
    g_0_low60_40_low20_11 * (const 64 2) = g_0_low60_40_low20_10 + f_0_low60_40_low20_10,
    r_40_51 * (const 64 2) = r_40_50 + u_40_50,
    s_40_51 * (const 64 2) = s_40_50 + v_40_50
;

assume
    f_0_low60_40_low20_11 = f_0_low60_40_low20_10,
    u_40_51 = u_40_50,
    v_40_51 = v_40_50,
    g_0_low60_40_low20_11 * 2 = g_0_low60_40_low20_10 + f_0_low60_40_low20_10,
    r_40_51 * 2 = r_40_50 + u_40_50,
    s_40_51 * 2 = s_40_50 + v_40_50
&&
    true
;

{
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_11 + u_40_51 * (const 64 (2**21)) + v_40_51 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_11 + r_40_51 * (const 64 (2**21)) + s_40_51 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_11,
    f_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_11,
    g_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 51)) <=s delta, delta <=s (const 64 (1 + 2*51)),
    (const 64 (-(2**20))) <=s u_40_51, u_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_51, v_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_51, r_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_51, s_40_51 <=s (const 64 ((2**20)-1)),
    u_40_51 + v_40_51 <=s (const 64 (2**20)),
    u_40_51 - v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 + v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 - v_40_51 <=s (const 64 (2**20)),
    r_40_51 + s_40_51 <=s (const 64 (2**20)),
    r_40_51 - s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 + s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 - s_40_51 <=s (const 64 (2**20)),
    u_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_40_51 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_050_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_10,
sint64 g_0_low60_40_low20_10,
sint64 f_0_low60_40_low20_11,
sint64 g_0_low60_40_low20_11,
sint64 u_40_50,
sint64 v_40_50,
sint64 r_40_50,
sint64 s_40_50,
sint64 u_40_51,
sint64 v_40_51,
sint64 r_40_51,
sint64 s_40_51,
bit ne
)={
    u_40_50 * f_0_low60_40_low20_0 + v_40_50 * g_0_low60_40_low20_0 = f_0_low60_40_low20_10 * (-(2**20)),
    r_40_50 * f_0_low60_40_low20_0 + s_40_50 * g_0_low60_40_low20_0 = g_0_low60_40_low20_10 * (-(2**20))
&&
    u_40_50 * f_0_low60_40_low20_0 + v_40_50 * g_0_low60_40_low20_0 = f_0_low60_40_low20_10 * (const 64 (-(2**20))),
    r_40_50 * f_0_low60_40_low20_0 + s_40_50 * g_0_low60_40_low20_0 = g_0_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_10 + u_40_50 * (const 64 (2**21)) + v_40_50 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_10 + r_40_50 * (const 64 (2**21)) + s_40_50 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_10,
    f_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_10,
    g_0_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 50)) <=s delta, delta <=s (const 64 (1 + 2*50)),
    (const 64 (-(2**20))) <=s u_40_50, u_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_50, v_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_50, r_40_50 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_50, s_40_50 <=s (const 64 ((2**20)-1)),
    u_40_50 + v_40_50 <=s (const 64 (2**20)),
    u_40_50 - v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 + v_40_50 <=s (const 64 (2**20)),
    (const 64 0) - u_40_50 - v_40_50 <=s (const 64 (2**20)),
    r_40_50 + s_40_50 <=s (const 64 (2**20)),
    r_40_50 - s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 + s_40_50 <=s (const 64 (2**20)),
    (const 64 0) - r_40_50 - s_40_50 <=s (const 64 (2**20)),
    u_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_40_50 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_40_50 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise c
assume
g_0_low60_40_low20_10 = 1 (mod 2)
&&
g_0_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_11 g_0_low60_40_low20_10;
mov u_40_51 r_40_50;
mov v_40_51 s_40_50;

subs dc g_0_low60_40_low20_11 g_0_low60_40_low20_10 f_0_low60_40_low20_10;
asr g_0_low60_40_low20_11 g_0_low60_40_low20_11 1;
subs dc r_40_51 r_40_50 u_40_50;
asr r_40_51 r_40_51 1;
subs dc s_40_51 s_40_50 v_40_50;
asr s_40_51 s_40_51 1;
assert
    true
&&
    f_0_low60_40_low20_11 = g_0_low60_40_low20_10,
    u_40_51 = r_40_50,
    v_40_51 = s_40_50,
    g_0_low60_40_low20_11 * (const 64 2) = g_0_low60_40_low20_10 - f_0_low60_40_low20_10,
    r_40_51 * (const 64 2) = r_40_50 - u_40_50,
    s_40_51 * (const 64 2) = s_40_50 - v_40_50
;

assume
    f_0_low60_40_low20_11 = g_0_low60_40_low20_10,
    u_40_51 = r_40_50,
    v_40_51 = s_40_50,
    g_0_low60_40_low20_11 * 2 = g_0_low60_40_low20_10 - f_0_low60_40_low20_10,
    r_40_51 * 2 = r_40_50 - u_40_50,
    s_40_51 * 2 = s_40_50 - v_40_50
&&
    true
;

{
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_11 + u_40_51 * (const 64 (2**21)) + v_40_51 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_11 + r_40_51 * (const 64 (2**21)) + s_40_51 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_11,
    f_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_11,
    g_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 51)) <=s delta, delta <=s (const 64 (1 + 2*51)),
    (const 64 (-(2**20))) <=s u_40_51, u_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_51, v_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_51, r_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_51, s_40_51 <=s (const 64 ((2**20)-1)),
    u_40_51 + v_40_51 <=s (const 64 (2**20)),
    u_40_51 - v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 + v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 - v_40_51 <=s (const 64 (2**20)),
    r_40_51 + s_40_51 <=s (const 64 (2**20)),
    r_40_51 - s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 + s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 - s_40_51 <=s (const 64 (2**20)),
    u_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_40_51 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_051_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_11,
sint64 g_0_low60_40_low20_11,
sint64 f_0_low60_40_low20_12,
sint64 g_0_low60_40_low20_12,
sint64 u_40_51,
sint64 v_40_51,
sint64 r_40_51,
sint64 s_40_51,
sint64 u_40_52,
sint64 v_40_52,
sint64 r_40_52,
sint64 s_40_52,
bit ne
)={
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (-(2**20)),
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (-(2**20))
&&
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (const 64 (-(2**20))),
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_11 + u_40_51 * (const 64 (2**21)) + v_40_51 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_11 + r_40_51 * (const 64 (2**21)) + s_40_51 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_11,
    f_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_11,
    g_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 51)) <=s delta, delta <=s (const 64 (1 + 2*51)),
    (const 64 (-(2**20))) <=s u_40_51, u_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_51, v_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_51, r_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_51, s_40_51 <=s (const 64 ((2**20)-1)),
    u_40_51 + v_40_51 <=s (const 64 (2**20)),
    u_40_51 - v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 + v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 - v_40_51 <=s (const 64 (2**20)),
    r_40_51 + s_40_51 <=s (const 64 (2**20)),
    r_40_51 - s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 + s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 - s_40_51 <=s (const 64 (2**20)),
    u_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_40_51 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise a
assume
g_0_low60_40_low20_11 = 0 (mod 2)
&&
g_0_low60_40_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_12 f_0_low60_40_low20_11;
mov u_40_52 u_40_51;
mov v_40_52 v_40_51;

asr g_0_low60_40_low20_12 g_0_low60_40_low20_11 1;
asr r_40_52 r_40_51 1;
asr s_40_52 s_40_51 1;
assert
    true
&&
    f_0_low60_40_low20_12 = f_0_low60_40_low20_11,
    u_40_52 = u_40_51,
    v_40_52 = v_40_51,
    g_0_low60_40_low20_12 * (const 64 2) = g_0_low60_40_low20_11,
    r_40_52 * (const 64 2) = r_40_51,
    s_40_52 * (const 64 2) = s_40_51
;

assume
    f_0_low60_40_low20_12 = f_0_low60_40_low20_11,
    u_40_52 = u_40_51,
    v_40_52 = v_40_51,
    g_0_low60_40_low20_12 * 2 = g_0_low60_40_low20_11,
    r_40_52 * 2 = r_40_51,
    s_40_52 * 2 = s_40_51
&&
    true
;

{
    u_40_52 * f_0_low60_40_low20_0 + v_40_52 * g_0_low60_40_low20_0 = f_0_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_52 * f_0_low60_40_low20_0 + s_40_52 * g_0_low60_40_low20_0 = g_0_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_12 + u_40_52 * (const 64 (2**21)) + v_40_52 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_12 + r_40_52 * (const 64 (2**21)) + s_40_52 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_12,
    f_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_12,
    g_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 52)) <=s delta, delta <=s (const 64 (1 + 2*52)),
    (const 64 (-(2**20))) <=s u_40_52, u_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_52, v_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_52, r_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_52, s_40_52 <=s (const 64 ((2**20)-1)),
    u_40_52 + v_40_52 <=s (const 64 (2**20)),
    u_40_52 - v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 + v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 - v_40_52 <=s (const 64 (2**20)),
    r_40_52 + s_40_52 <=s (const 64 (2**20)),
    r_40_52 - s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 + s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 - s_40_52 <=s (const 64 (2**20)),
    u_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_40_52 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_051_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_11,
sint64 g_0_low60_40_low20_11,
sint64 f_0_low60_40_low20_12,
sint64 g_0_low60_40_low20_12,
sint64 u_40_51,
sint64 v_40_51,
sint64 r_40_51,
sint64 s_40_51,
sint64 u_40_52,
sint64 v_40_52,
sint64 r_40_52,
sint64 s_40_52,
bit ne
)={
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (-(2**20)),
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (-(2**20))
&&
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (const 64 (-(2**20))),
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_11 + u_40_51 * (const 64 (2**21)) + v_40_51 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_11 + r_40_51 * (const 64 (2**21)) + s_40_51 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_11,
    f_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_11,
    g_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 51)) <=s delta, delta <=s (const 64 (1 + 2*51)),
    (const 64 (-(2**20))) <=s u_40_51, u_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_51, v_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_51, r_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_51, s_40_51 <=s (const 64 ((2**20)-1)),
    u_40_51 + v_40_51 <=s (const 64 (2**20)),
    u_40_51 - v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 + v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 - v_40_51 <=s (const 64 (2**20)),
    r_40_51 + s_40_51 <=s (const 64 (2**20)),
    r_40_51 - s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 + s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 - s_40_51 <=s (const 64 (2**20)),
    u_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_40_51 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise b
assume
g_0_low60_40_low20_11 = 1 (mod 2)
&&
g_0_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_12 f_0_low60_40_low20_11;
mov u_40_52 u_40_51;
mov v_40_52 v_40_51;

add g_0_low60_40_low20_12 g_0_low60_40_low20_11 f_0_low60_40_low20_11;
asr g_0_low60_40_low20_12 g_0_low60_40_low20_12 1;
add r_40_52 r_40_51 u_40_51;
asr r_40_52 r_40_52 1;
add s_40_52 s_40_51 v_40_51;
asr s_40_52 s_40_52 1;
assert
    true
&&
    f_0_low60_40_low20_12 = f_0_low60_40_low20_11,
    u_40_52 = u_40_51,
    v_40_52 = v_40_51,
    g_0_low60_40_low20_12 * (const 64 2) = g_0_low60_40_low20_11 + f_0_low60_40_low20_11,
    r_40_52 * (const 64 2) = r_40_51 + u_40_51,
    s_40_52 * (const 64 2) = s_40_51 + v_40_51
;

assume
    f_0_low60_40_low20_12 = f_0_low60_40_low20_11,
    u_40_52 = u_40_51,
    v_40_52 = v_40_51,
    g_0_low60_40_low20_12 * 2 = g_0_low60_40_low20_11 + f_0_low60_40_low20_11,
    r_40_52 * 2 = r_40_51 + u_40_51,
    s_40_52 * 2 = s_40_51 + v_40_51
&&
    true
;

{
    u_40_52 * f_0_low60_40_low20_0 + v_40_52 * g_0_low60_40_low20_0 = f_0_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_52 * f_0_low60_40_low20_0 + s_40_52 * g_0_low60_40_low20_0 = g_0_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_12 + u_40_52 * (const 64 (2**21)) + v_40_52 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_12 + r_40_52 * (const 64 (2**21)) + s_40_52 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_12,
    f_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_12,
    g_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 52)) <=s delta, delta <=s (const 64 (1 + 2*52)),
    (const 64 (-(2**20))) <=s u_40_52, u_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_52, v_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_52, r_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_52, s_40_52 <=s (const 64 ((2**20)-1)),
    u_40_52 + v_40_52 <=s (const 64 (2**20)),
    u_40_52 - v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 + v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 - v_40_52 <=s (const 64 (2**20)),
    r_40_52 + s_40_52 <=s (const 64 (2**20)),
    r_40_52 - s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 + s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 - s_40_52 <=s (const 64 (2**20)),
    u_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_40_52 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_051_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_11,
sint64 g_0_low60_40_low20_11,
sint64 f_0_low60_40_low20_12,
sint64 g_0_low60_40_low20_12,
sint64 u_40_51,
sint64 v_40_51,
sint64 r_40_51,
sint64 s_40_51,
sint64 u_40_52,
sint64 v_40_52,
sint64 r_40_52,
sint64 s_40_52,
bit ne
)={
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (-(2**20)),
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (-(2**20))
&&
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (const 64 (-(2**20))),
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_11 + u_40_51 * (const 64 (2**21)) + v_40_51 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_11 + r_40_51 * (const 64 (2**21)) + s_40_51 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_11,
    f_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_11,
    g_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 51)) <=s delta, delta <=s (const 64 (1 + 2*51)),
    (const 64 (-(2**20))) <=s u_40_51, u_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_51, v_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_51, r_40_51 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_51, s_40_51 <=s (const 64 ((2**20)-1)),
    u_40_51 + v_40_51 <=s (const 64 (2**20)),
    u_40_51 - v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 + v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 - v_40_51 <=s (const 64 (2**20)),
    r_40_51 + s_40_51 <=s (const 64 (2**20)),
    r_40_51 - s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 + s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 - s_40_51 <=s (const 64 (2**20)),
    u_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_40_51 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise c
assume
g_0_low60_40_low20_11 = 1 (mod 2)
&&
g_0_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_12 g_0_low60_40_low20_11;
mov u_40_52 r_40_51;
mov v_40_52 s_40_51;

subs dc g_0_low60_40_low20_12 g_0_low60_40_low20_11 f_0_low60_40_low20_11;
asr g_0_low60_40_low20_12 g_0_low60_40_low20_12 1;
subs dc r_40_52 r_40_51 u_40_51;
asr r_40_52 r_40_52 1;
subs dc s_40_52 s_40_51 v_40_51;
asr s_40_52 s_40_52 1;
assert
    true
&&
    f_0_low60_40_low20_12 = g_0_low60_40_low20_11,
    u_40_52 = r_40_51,
    v_40_52 = s_40_51,
    g_0_low60_40_low20_12 * (const 64 2) = g_0_low60_40_low20_11 - f_0_low60_40_low20_11,
    r_40_52 * (const 64 2) = r_40_51 - u_40_51,
    s_40_52 * (const 64 2) = s_40_51 - v_40_51
;

assume
    f_0_low60_40_low20_12 = g_0_low60_40_low20_11,
    u_40_52 = r_40_51,
    v_40_52 = s_40_51,
    g_0_low60_40_low20_12 * 2 = g_0_low60_40_low20_11 - f_0_low60_40_low20_11,
    r_40_52 * 2 = r_40_51 - u_40_51,
    s_40_52 * 2 = s_40_51 - v_40_51
&&
    true
;

{
    u_40_52 * f_0_low60_40_low20_0 + v_40_52 * g_0_low60_40_low20_0 = f_0_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_52 * f_0_low60_40_low20_0 + s_40_52 * g_0_low60_40_low20_0 = g_0_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_12 + u_40_52 * (const 64 (2**21)) + v_40_52 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_12 + r_40_52 * (const 64 (2**21)) + s_40_52 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_12,
    f_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_12,
    g_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 52)) <=s delta, delta <=s (const 64 (1 + 2*52)),
    (const 64 (-(2**20))) <=s u_40_52, u_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_52, v_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_52, r_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_52, s_40_52 <=s (const 64 ((2**20)-1)),
    u_40_52 + v_40_52 <=s (const 64 (2**20)),
    u_40_52 - v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 + v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 - v_40_52 <=s (const 64 (2**20)),
    r_40_52 + s_40_52 <=s (const 64 (2**20)),
    r_40_52 - s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 + s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 - s_40_52 <=s (const 64 (2**20)),
    u_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_40_52 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_052_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_12,
sint64 g_0_low60_40_low20_12,
sint64 f_0_low60_40_low20_13,
sint64 g_0_low60_40_low20_13,
sint64 u_40_52,
sint64 v_40_52,
sint64 r_40_52,
sint64 s_40_52,
sint64 u_40_53,
sint64 v_40_53,
sint64 r_40_53,
sint64 s_40_53,
bit ne
)={
    u_40_52 * f_0_low60_40_low20_0 + v_40_52 * g_0_low60_40_low20_0 = f_0_low60_40_low20_12 * (-(2**20)),
    r_40_52 * f_0_low60_40_low20_0 + s_40_52 * g_0_low60_40_low20_0 = g_0_low60_40_low20_12 * (-(2**20))
&&
    u_40_52 * f_0_low60_40_low20_0 + v_40_52 * g_0_low60_40_low20_0 = f_0_low60_40_low20_12 * (const 64 (-(2**20))),
    r_40_52 * f_0_low60_40_low20_0 + s_40_52 * g_0_low60_40_low20_0 = g_0_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_12 + u_40_52 * (const 64 (2**21)) + v_40_52 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_12 + r_40_52 * (const 64 (2**21)) + s_40_52 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_12,
    f_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_12,
    g_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 52)) <=s delta, delta <=s (const 64 (1 + 2*52)),
    (const 64 (-(2**20))) <=s u_40_52, u_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_52, v_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_52, r_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_52, s_40_52 <=s (const 64 ((2**20)-1)),
    u_40_52 + v_40_52 <=s (const 64 (2**20)),
    u_40_52 - v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 + v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 - v_40_52 <=s (const 64 (2**20)),
    r_40_52 + s_40_52 <=s (const 64 (2**20)),
    r_40_52 - s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 + s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 - s_40_52 <=s (const 64 (2**20)),
    u_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_40_52 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise a
assume
g_0_low60_40_low20_12 = 0 (mod 2)
&&
g_0_low60_40_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_13 f_0_low60_40_low20_12;
mov u_40_53 u_40_52;
mov v_40_53 v_40_52;

asr g_0_low60_40_low20_13 g_0_low60_40_low20_12 1;
asr r_40_53 r_40_52 1;
asr s_40_53 s_40_52 1;
assert
    true
&&
    f_0_low60_40_low20_13 = f_0_low60_40_low20_12,
    u_40_53 = u_40_52,
    v_40_53 = v_40_52,
    g_0_low60_40_low20_13 * (const 64 2) = g_0_low60_40_low20_12,
    r_40_53 * (const 64 2) = r_40_52,
    s_40_53 * (const 64 2) = s_40_52
;

assume
    f_0_low60_40_low20_13 = f_0_low60_40_low20_12,
    u_40_53 = u_40_52,
    v_40_53 = v_40_52,
    g_0_low60_40_low20_13 * 2 = g_0_low60_40_low20_12,
    r_40_53 * 2 = r_40_52,
    s_40_53 * 2 = s_40_52
&&
    true
;

{
    u_40_53 * f_0_low60_40_low20_0 + v_40_53 * g_0_low60_40_low20_0 = f_0_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_53 * f_0_low60_40_low20_0 + s_40_53 * g_0_low60_40_low20_0 = g_0_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_13 + u_40_53 * (const 64 (2**21)) + v_40_53 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_13 + r_40_53 * (const 64 (2**21)) + s_40_53 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_13,
    f_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_13,
    g_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 53)) <=s delta, delta <=s (const 64 (1 + 2*53)),
    (const 64 (-(2**20))) <=s u_40_53, u_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_53, v_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_53, r_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_53, s_40_53 <=s (const 64 ((2**20)-1)),
    u_40_53 + v_40_53 <=s (const 64 (2**20)),
    u_40_53 - v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 + v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 - v_40_53 <=s (const 64 (2**20)),
    r_40_53 + s_40_53 <=s (const 64 (2**20)),
    r_40_53 - s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 + s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 - s_40_53 <=s (const 64 (2**20)),
    u_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_40_53 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_052_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_12,
sint64 g_0_low60_40_low20_12,
sint64 f_0_low60_40_low20_13,
sint64 g_0_low60_40_low20_13,
sint64 u_40_52,
sint64 v_40_52,
sint64 r_40_52,
sint64 s_40_52,
sint64 u_40_53,
sint64 v_40_53,
sint64 r_40_53,
sint64 s_40_53,
bit ne
)={
    u_40_52 * f_0_low60_40_low20_0 + v_40_52 * g_0_low60_40_low20_0 = f_0_low60_40_low20_12 * (-(2**20)),
    r_40_52 * f_0_low60_40_low20_0 + s_40_52 * g_0_low60_40_low20_0 = g_0_low60_40_low20_12 * (-(2**20))
&&
    u_40_52 * f_0_low60_40_low20_0 + v_40_52 * g_0_low60_40_low20_0 = f_0_low60_40_low20_12 * (const 64 (-(2**20))),
    r_40_52 * f_0_low60_40_low20_0 + s_40_52 * g_0_low60_40_low20_0 = g_0_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_12 + u_40_52 * (const 64 (2**21)) + v_40_52 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_12 + r_40_52 * (const 64 (2**21)) + s_40_52 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_12,
    f_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_12,
    g_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 52)) <=s delta, delta <=s (const 64 (1 + 2*52)),
    (const 64 (-(2**20))) <=s u_40_52, u_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_52, v_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_52, r_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_52, s_40_52 <=s (const 64 ((2**20)-1)),
    u_40_52 + v_40_52 <=s (const 64 (2**20)),
    u_40_52 - v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 + v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 - v_40_52 <=s (const 64 (2**20)),
    r_40_52 + s_40_52 <=s (const 64 (2**20)),
    r_40_52 - s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 + s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 - s_40_52 <=s (const 64 (2**20)),
    u_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_40_52 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise b
assume
g_0_low60_40_low20_12 = 1 (mod 2)
&&
g_0_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_13 f_0_low60_40_low20_12;
mov u_40_53 u_40_52;
mov v_40_53 v_40_52;

add g_0_low60_40_low20_13 g_0_low60_40_low20_12 f_0_low60_40_low20_12;
asr g_0_low60_40_low20_13 g_0_low60_40_low20_13 1;
add r_40_53 r_40_52 u_40_52;
asr r_40_53 r_40_53 1;
add s_40_53 s_40_52 v_40_52;
asr s_40_53 s_40_53 1;
assert
    true
&&
    f_0_low60_40_low20_13 = f_0_low60_40_low20_12,
    u_40_53 = u_40_52,
    v_40_53 = v_40_52,
    g_0_low60_40_low20_13 * (const 64 2) = g_0_low60_40_low20_12 + f_0_low60_40_low20_12,
    r_40_53 * (const 64 2) = r_40_52 + u_40_52,
    s_40_53 * (const 64 2) = s_40_52 + v_40_52
;

assume
    f_0_low60_40_low20_13 = f_0_low60_40_low20_12,
    u_40_53 = u_40_52,
    v_40_53 = v_40_52,
    g_0_low60_40_low20_13 * 2 = g_0_low60_40_low20_12 + f_0_low60_40_low20_12,
    r_40_53 * 2 = r_40_52 + u_40_52,
    s_40_53 * 2 = s_40_52 + v_40_52
&&
    true
;

{
    u_40_53 * f_0_low60_40_low20_0 + v_40_53 * g_0_low60_40_low20_0 = f_0_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_53 * f_0_low60_40_low20_0 + s_40_53 * g_0_low60_40_low20_0 = g_0_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_13 + u_40_53 * (const 64 (2**21)) + v_40_53 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_13 + r_40_53 * (const 64 (2**21)) + s_40_53 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_13,
    f_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_13,
    g_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 53)) <=s delta, delta <=s (const 64 (1 + 2*53)),
    (const 64 (-(2**20))) <=s u_40_53, u_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_53, v_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_53, r_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_53, s_40_53 <=s (const 64 ((2**20)-1)),
    u_40_53 + v_40_53 <=s (const 64 (2**20)),
    u_40_53 - v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 + v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 - v_40_53 <=s (const 64 (2**20)),
    r_40_53 + s_40_53 <=s (const 64 (2**20)),
    r_40_53 - s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 + s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 - s_40_53 <=s (const 64 (2**20)),
    u_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_40_53 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_052_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_12,
sint64 g_0_low60_40_low20_12,
sint64 f_0_low60_40_low20_13,
sint64 g_0_low60_40_low20_13,
sint64 u_40_52,
sint64 v_40_52,
sint64 r_40_52,
sint64 s_40_52,
sint64 u_40_53,
sint64 v_40_53,
sint64 r_40_53,
sint64 s_40_53,
bit ne
)={
    u_40_52 * f_0_low60_40_low20_0 + v_40_52 * g_0_low60_40_low20_0 = f_0_low60_40_low20_12 * (-(2**20)),
    r_40_52 * f_0_low60_40_low20_0 + s_40_52 * g_0_low60_40_low20_0 = g_0_low60_40_low20_12 * (-(2**20))
&&
    u_40_52 * f_0_low60_40_low20_0 + v_40_52 * g_0_low60_40_low20_0 = f_0_low60_40_low20_12 * (const 64 (-(2**20))),
    r_40_52 * f_0_low60_40_low20_0 + s_40_52 * g_0_low60_40_low20_0 = g_0_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_12 + u_40_52 * (const 64 (2**21)) + v_40_52 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_12 + r_40_52 * (const 64 (2**21)) + s_40_52 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_12,
    f_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_12,
    g_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 52)) <=s delta, delta <=s (const 64 (1 + 2*52)),
    (const 64 (-(2**20))) <=s u_40_52, u_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_52, v_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_52, r_40_52 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_52, s_40_52 <=s (const 64 ((2**20)-1)),
    u_40_52 + v_40_52 <=s (const 64 (2**20)),
    u_40_52 - v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 + v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 - v_40_52 <=s (const 64 (2**20)),
    r_40_52 + s_40_52 <=s (const 64 (2**20)),
    r_40_52 - s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 + s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 - s_40_52 <=s (const 64 (2**20)),
    u_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_40_52 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise c
assume
g_0_low60_40_low20_12 = 1 (mod 2)
&&
g_0_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_13 g_0_low60_40_low20_12;
mov u_40_53 r_40_52;
mov v_40_53 s_40_52;

subs dc g_0_low60_40_low20_13 g_0_low60_40_low20_12 f_0_low60_40_low20_12;
asr g_0_low60_40_low20_13 g_0_low60_40_low20_13 1;
subs dc r_40_53 r_40_52 u_40_52;
asr r_40_53 r_40_53 1;
subs dc s_40_53 s_40_52 v_40_52;
asr s_40_53 s_40_53 1;
assert
    true
&&
    f_0_low60_40_low20_13 = g_0_low60_40_low20_12,
    u_40_53 = r_40_52,
    v_40_53 = s_40_52,
    g_0_low60_40_low20_13 * (const 64 2) = g_0_low60_40_low20_12 - f_0_low60_40_low20_12,
    r_40_53 * (const 64 2) = r_40_52 - u_40_52,
    s_40_53 * (const 64 2) = s_40_52 - v_40_52
;

assume
    f_0_low60_40_low20_13 = g_0_low60_40_low20_12,
    u_40_53 = r_40_52,
    v_40_53 = s_40_52,
    g_0_low60_40_low20_13 * 2 = g_0_low60_40_low20_12 - f_0_low60_40_low20_12,
    r_40_53 * 2 = r_40_52 - u_40_52,
    s_40_53 * 2 = s_40_52 - v_40_52
&&
    true
;

{
    u_40_53 * f_0_low60_40_low20_0 + v_40_53 * g_0_low60_40_low20_0 = f_0_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_53 * f_0_low60_40_low20_0 + s_40_53 * g_0_low60_40_low20_0 = g_0_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_13 + u_40_53 * (const 64 (2**21)) + v_40_53 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_13 + r_40_53 * (const 64 (2**21)) + s_40_53 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_13,
    f_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_13,
    g_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 53)) <=s delta, delta <=s (const 64 (1 + 2*53)),
    (const 64 (-(2**20))) <=s u_40_53, u_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_53, v_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_53, r_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_53, s_40_53 <=s (const 64 ((2**20)-1)),
    u_40_53 + v_40_53 <=s (const 64 (2**20)),
    u_40_53 - v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 + v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 - v_40_53 <=s (const 64 (2**20)),
    r_40_53 + s_40_53 <=s (const 64 (2**20)),
    r_40_53 - s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 + s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 - s_40_53 <=s (const 64 (2**20)),
    u_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_40_53 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_053_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_13,
sint64 g_0_low60_40_low20_13,
sint64 f_0_low60_40_low20_14,
sint64 g_0_low60_40_low20_14,
sint64 u_40_53,
sint64 v_40_53,
sint64 r_40_53,
sint64 s_40_53,
sint64 u_40_54,
sint64 v_40_54,
sint64 r_40_54,
sint64 s_40_54,
bit ne
)={
    u_40_53 * f_0_low60_40_low20_0 + v_40_53 * g_0_low60_40_low20_0 = f_0_low60_40_low20_13 * (-(2**20)),
    r_40_53 * f_0_low60_40_low20_0 + s_40_53 * g_0_low60_40_low20_0 = g_0_low60_40_low20_13 * (-(2**20))
&&
    u_40_53 * f_0_low60_40_low20_0 + v_40_53 * g_0_low60_40_low20_0 = f_0_low60_40_low20_13 * (const 64 (-(2**20))),
    r_40_53 * f_0_low60_40_low20_0 + s_40_53 * g_0_low60_40_low20_0 = g_0_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_13 + u_40_53 * (const 64 (2**21)) + v_40_53 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_13 + r_40_53 * (const 64 (2**21)) + s_40_53 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_13,
    f_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_13,
    g_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 53)) <=s delta, delta <=s (const 64 (1 + 2*53)),
    (const 64 (-(2**20))) <=s u_40_53, u_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_53, v_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_53, r_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_53, s_40_53 <=s (const 64 ((2**20)-1)),
    u_40_53 + v_40_53 <=s (const 64 (2**20)),
    u_40_53 - v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 + v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 - v_40_53 <=s (const 64 (2**20)),
    r_40_53 + s_40_53 <=s (const 64 (2**20)),
    r_40_53 - s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 + s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 - s_40_53 <=s (const 64 (2**20)),
    u_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_40_53 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise a
assume
g_0_low60_40_low20_13 = 0 (mod 2)
&&
g_0_low60_40_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_14 f_0_low60_40_low20_13;
mov u_40_54 u_40_53;
mov v_40_54 v_40_53;

asr g_0_low60_40_low20_14 g_0_low60_40_low20_13 1;
asr r_40_54 r_40_53 1;
asr s_40_54 s_40_53 1;
assert
    true
&&
    f_0_low60_40_low20_14 = f_0_low60_40_low20_13,
    u_40_54 = u_40_53,
    v_40_54 = v_40_53,
    g_0_low60_40_low20_14 * (const 64 2) = g_0_low60_40_low20_13,
    r_40_54 * (const 64 2) = r_40_53,
    s_40_54 * (const 64 2) = s_40_53
;

assume
    f_0_low60_40_low20_14 = f_0_low60_40_low20_13,
    u_40_54 = u_40_53,
    v_40_54 = v_40_53,
    g_0_low60_40_low20_14 * 2 = g_0_low60_40_low20_13,
    r_40_54 * 2 = r_40_53,
    s_40_54 * 2 = s_40_53
&&
    true
;

{
    u_40_54 * f_0_low60_40_low20_0 + v_40_54 * g_0_low60_40_low20_0 = f_0_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_54 * f_0_low60_40_low20_0 + s_40_54 * g_0_low60_40_low20_0 = g_0_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_14 + u_40_54 * (const 64 (2**21)) + v_40_54 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_14 + r_40_54 * (const 64 (2**21)) + s_40_54 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_14,
    f_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_14,
    g_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 54)) <=s delta, delta <=s (const 64 (1 + 2*54)),
    (const 64 (-(2**20))) <=s u_40_54, u_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_54, v_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_54, r_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_54, s_40_54 <=s (const 64 ((2**20)-1)),
    u_40_54 + v_40_54 <=s (const 64 (2**20)),
    u_40_54 - v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 + v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 - v_40_54 <=s (const 64 (2**20)),
    r_40_54 + s_40_54 <=s (const 64 (2**20)),
    r_40_54 - s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 + s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 - s_40_54 <=s (const 64 (2**20)),
    u_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_40_54 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_053_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_13,
sint64 g_0_low60_40_low20_13,
sint64 f_0_low60_40_low20_14,
sint64 g_0_low60_40_low20_14,
sint64 u_40_53,
sint64 v_40_53,
sint64 r_40_53,
sint64 s_40_53,
sint64 u_40_54,
sint64 v_40_54,
sint64 r_40_54,
sint64 s_40_54,
bit ne
)={
    u_40_53 * f_0_low60_40_low20_0 + v_40_53 * g_0_low60_40_low20_0 = f_0_low60_40_low20_13 * (-(2**20)),
    r_40_53 * f_0_low60_40_low20_0 + s_40_53 * g_0_low60_40_low20_0 = g_0_low60_40_low20_13 * (-(2**20))
&&
    u_40_53 * f_0_low60_40_low20_0 + v_40_53 * g_0_low60_40_low20_0 = f_0_low60_40_low20_13 * (const 64 (-(2**20))),
    r_40_53 * f_0_low60_40_low20_0 + s_40_53 * g_0_low60_40_low20_0 = g_0_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_13 + u_40_53 * (const 64 (2**21)) + v_40_53 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_13 + r_40_53 * (const 64 (2**21)) + s_40_53 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_13,
    f_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_13,
    g_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 53)) <=s delta, delta <=s (const 64 (1 + 2*53)),
    (const 64 (-(2**20))) <=s u_40_53, u_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_53, v_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_53, r_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_53, s_40_53 <=s (const 64 ((2**20)-1)),
    u_40_53 + v_40_53 <=s (const 64 (2**20)),
    u_40_53 - v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 + v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 - v_40_53 <=s (const 64 (2**20)),
    r_40_53 + s_40_53 <=s (const 64 (2**20)),
    r_40_53 - s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 + s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 - s_40_53 <=s (const 64 (2**20)),
    u_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_40_53 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise b
assume
g_0_low60_40_low20_13 = 1 (mod 2)
&&
g_0_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_14 f_0_low60_40_low20_13;
mov u_40_54 u_40_53;
mov v_40_54 v_40_53;

add g_0_low60_40_low20_14 g_0_low60_40_low20_13 f_0_low60_40_low20_13;
asr g_0_low60_40_low20_14 g_0_low60_40_low20_14 1;
add r_40_54 r_40_53 u_40_53;
asr r_40_54 r_40_54 1;
add s_40_54 s_40_53 v_40_53;
asr s_40_54 s_40_54 1;
assert
    true
&&
    f_0_low60_40_low20_14 = f_0_low60_40_low20_13,
    u_40_54 = u_40_53,
    v_40_54 = v_40_53,
    g_0_low60_40_low20_14 * (const 64 2) = g_0_low60_40_low20_13 + f_0_low60_40_low20_13,
    r_40_54 * (const 64 2) = r_40_53 + u_40_53,
    s_40_54 * (const 64 2) = s_40_53 + v_40_53
;

assume
    f_0_low60_40_low20_14 = f_0_low60_40_low20_13,
    u_40_54 = u_40_53,
    v_40_54 = v_40_53,
    g_0_low60_40_low20_14 * 2 = g_0_low60_40_low20_13 + f_0_low60_40_low20_13,
    r_40_54 * 2 = r_40_53 + u_40_53,
    s_40_54 * 2 = s_40_53 + v_40_53
&&
    true
;

{
    u_40_54 * f_0_low60_40_low20_0 + v_40_54 * g_0_low60_40_low20_0 = f_0_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_54 * f_0_low60_40_low20_0 + s_40_54 * g_0_low60_40_low20_0 = g_0_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_14 + u_40_54 * (const 64 (2**21)) + v_40_54 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_14 + r_40_54 * (const 64 (2**21)) + s_40_54 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_14,
    f_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_14,
    g_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 54)) <=s delta, delta <=s (const 64 (1 + 2*54)),
    (const 64 (-(2**20))) <=s u_40_54, u_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_54, v_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_54, r_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_54, s_40_54 <=s (const 64 ((2**20)-1)),
    u_40_54 + v_40_54 <=s (const 64 (2**20)),
    u_40_54 - v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 + v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 - v_40_54 <=s (const 64 (2**20)),
    r_40_54 + s_40_54 <=s (const 64 (2**20)),
    r_40_54 - s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 + s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 - s_40_54 <=s (const 64 (2**20)),
    u_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_40_54 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_053_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_13,
sint64 g_0_low60_40_low20_13,
sint64 f_0_low60_40_low20_14,
sint64 g_0_low60_40_low20_14,
sint64 u_40_53,
sint64 v_40_53,
sint64 r_40_53,
sint64 s_40_53,
sint64 u_40_54,
sint64 v_40_54,
sint64 r_40_54,
sint64 s_40_54,
bit ne
)={
    u_40_53 * f_0_low60_40_low20_0 + v_40_53 * g_0_low60_40_low20_0 = f_0_low60_40_low20_13 * (-(2**20)),
    r_40_53 * f_0_low60_40_low20_0 + s_40_53 * g_0_low60_40_low20_0 = g_0_low60_40_low20_13 * (-(2**20))
&&
    u_40_53 * f_0_low60_40_low20_0 + v_40_53 * g_0_low60_40_low20_0 = f_0_low60_40_low20_13 * (const 64 (-(2**20))),
    r_40_53 * f_0_low60_40_low20_0 + s_40_53 * g_0_low60_40_low20_0 = g_0_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_13 + u_40_53 * (const 64 (2**21)) + v_40_53 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_13 + r_40_53 * (const 64 (2**21)) + s_40_53 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_13,
    f_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_13,
    g_0_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 53)) <=s delta, delta <=s (const 64 (1 + 2*53)),
    (const 64 (-(2**20))) <=s u_40_53, u_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_53, v_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_53, r_40_53 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_53, s_40_53 <=s (const 64 ((2**20)-1)),
    u_40_53 + v_40_53 <=s (const 64 (2**20)),
    u_40_53 - v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 + v_40_53 <=s (const 64 (2**20)),
    (const 64 0) - u_40_53 - v_40_53 <=s (const 64 (2**20)),
    r_40_53 + s_40_53 <=s (const 64 (2**20)),
    r_40_53 - s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 + s_40_53 <=s (const 64 (2**20)),
    (const 64 0) - r_40_53 - s_40_53 <=s (const 64 (2**20)),
    u_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_40_53 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_40_53 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise c
assume
g_0_low60_40_low20_13 = 1 (mod 2)
&&
g_0_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_14 g_0_low60_40_low20_13;
mov u_40_54 r_40_53;
mov v_40_54 s_40_53;

subs dc g_0_low60_40_low20_14 g_0_low60_40_low20_13 f_0_low60_40_low20_13;
asr g_0_low60_40_low20_14 g_0_low60_40_low20_14 1;
subs dc r_40_54 r_40_53 u_40_53;
asr r_40_54 r_40_54 1;
subs dc s_40_54 s_40_53 v_40_53;
asr s_40_54 s_40_54 1;
assert
    true
&&
    f_0_low60_40_low20_14 = g_0_low60_40_low20_13,
    u_40_54 = r_40_53,
    v_40_54 = s_40_53,
    g_0_low60_40_low20_14 * (const 64 2) = g_0_low60_40_low20_13 - f_0_low60_40_low20_13,
    r_40_54 * (const 64 2) = r_40_53 - u_40_53,
    s_40_54 * (const 64 2) = s_40_53 - v_40_53
;

assume
    f_0_low60_40_low20_14 = g_0_low60_40_low20_13,
    u_40_54 = r_40_53,
    v_40_54 = s_40_53,
    g_0_low60_40_low20_14 * 2 = g_0_low60_40_low20_13 - f_0_low60_40_low20_13,
    r_40_54 * 2 = r_40_53 - u_40_53,
    s_40_54 * 2 = s_40_53 - v_40_53
&&
    true
;

{
    u_40_54 * f_0_low60_40_low20_0 + v_40_54 * g_0_low60_40_low20_0 = f_0_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_54 * f_0_low60_40_low20_0 + s_40_54 * g_0_low60_40_low20_0 = g_0_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_14 + u_40_54 * (const 64 (2**21)) + v_40_54 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_14 + r_40_54 * (const 64 (2**21)) + s_40_54 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_14,
    f_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_14,
    g_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 54)) <=s delta, delta <=s (const 64 (1 + 2*54)),
    (const 64 (-(2**20))) <=s u_40_54, u_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_54, v_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_54, r_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_54, s_40_54 <=s (const 64 ((2**20)-1)),
    u_40_54 + v_40_54 <=s (const 64 (2**20)),
    u_40_54 - v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 + v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 - v_40_54 <=s (const 64 (2**20)),
    r_40_54 + s_40_54 <=s (const 64 (2**20)),
    r_40_54 - s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 + s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 - s_40_54 <=s (const 64 (2**20)),
    u_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_40_54 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_054_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_14,
sint64 g_0_low60_40_low20_14,
sint64 f_0_low60_40_low20_15,
sint64 g_0_low60_40_low20_15,
sint64 u_40_54,
sint64 v_40_54,
sint64 r_40_54,
sint64 s_40_54,
sint64 u_40_55,
sint64 v_40_55,
sint64 r_40_55,
sint64 s_40_55,
bit ne
)={
    u_40_54 * f_0_low60_40_low20_0 + v_40_54 * g_0_low60_40_low20_0 = f_0_low60_40_low20_14 * (-(2**20)),
    r_40_54 * f_0_low60_40_low20_0 + s_40_54 * g_0_low60_40_low20_0 = g_0_low60_40_low20_14 * (-(2**20))
&&
    u_40_54 * f_0_low60_40_low20_0 + v_40_54 * g_0_low60_40_low20_0 = f_0_low60_40_low20_14 * (const 64 (-(2**20))),
    r_40_54 * f_0_low60_40_low20_0 + s_40_54 * g_0_low60_40_low20_0 = g_0_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_14 + u_40_54 * (const 64 (2**21)) + v_40_54 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_14 + r_40_54 * (const 64 (2**21)) + s_40_54 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_14,
    f_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_14,
    g_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 54)) <=s delta, delta <=s (const 64 (1 + 2*54)),
    (const 64 (-(2**20))) <=s u_40_54, u_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_54, v_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_54, r_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_54, s_40_54 <=s (const 64 ((2**20)-1)),
    u_40_54 + v_40_54 <=s (const 64 (2**20)),
    u_40_54 - v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 + v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 - v_40_54 <=s (const 64 (2**20)),
    r_40_54 + s_40_54 <=s (const 64 (2**20)),
    r_40_54 - s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 + s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 - s_40_54 <=s (const 64 (2**20)),
    u_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_40_54 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise a
assume
g_0_low60_40_low20_14 = 0 (mod 2)
&&
g_0_low60_40_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_15 f_0_low60_40_low20_14;
mov u_40_55 u_40_54;
mov v_40_55 v_40_54;

asr g_0_low60_40_low20_15 g_0_low60_40_low20_14 1;
asr r_40_55 r_40_54 1;
asr s_40_55 s_40_54 1;
assert
    true
&&
    f_0_low60_40_low20_15 = f_0_low60_40_low20_14,
    u_40_55 = u_40_54,
    v_40_55 = v_40_54,
    g_0_low60_40_low20_15 * (const 64 2) = g_0_low60_40_low20_14,
    r_40_55 * (const 64 2) = r_40_54,
    s_40_55 * (const 64 2) = s_40_54
;

assume
    f_0_low60_40_low20_15 = f_0_low60_40_low20_14,
    u_40_55 = u_40_54,
    v_40_55 = v_40_54,
    g_0_low60_40_low20_15 * 2 = g_0_low60_40_low20_14,
    r_40_55 * 2 = r_40_54,
    s_40_55 * 2 = s_40_54
&&
    true
;

{
    u_40_55 * f_0_low60_40_low20_0 + v_40_55 * g_0_low60_40_low20_0 = f_0_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_55 * f_0_low60_40_low20_0 + s_40_55 * g_0_low60_40_low20_0 = g_0_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_15 + u_40_55 * (const 64 (2**21)) + v_40_55 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_15 + r_40_55 * (const 64 (2**21)) + s_40_55 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_15,
    f_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_15,
    g_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 55)) <=s delta, delta <=s (const 64 (1 + 2*55)),
    (const 64 (-(2**20))) <=s u_40_55, u_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_55, v_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_55, r_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_55, s_40_55 <=s (const 64 ((2**20)-1)),
    u_40_55 + v_40_55 <=s (const 64 (2**20)),
    u_40_55 - v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 + v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 - v_40_55 <=s (const 64 (2**20)),
    r_40_55 + s_40_55 <=s (const 64 (2**20)),
    r_40_55 - s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 + s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 - s_40_55 <=s (const 64 (2**20)),
    u_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_40_55 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_054_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_14,
sint64 g_0_low60_40_low20_14,
sint64 f_0_low60_40_low20_15,
sint64 g_0_low60_40_low20_15,
sint64 u_40_54,
sint64 v_40_54,
sint64 r_40_54,
sint64 s_40_54,
sint64 u_40_55,
sint64 v_40_55,
sint64 r_40_55,
sint64 s_40_55,
bit ne
)={
    u_40_54 * f_0_low60_40_low20_0 + v_40_54 * g_0_low60_40_low20_0 = f_0_low60_40_low20_14 * (-(2**20)),
    r_40_54 * f_0_low60_40_low20_0 + s_40_54 * g_0_low60_40_low20_0 = g_0_low60_40_low20_14 * (-(2**20))
&&
    u_40_54 * f_0_low60_40_low20_0 + v_40_54 * g_0_low60_40_low20_0 = f_0_low60_40_low20_14 * (const 64 (-(2**20))),
    r_40_54 * f_0_low60_40_low20_0 + s_40_54 * g_0_low60_40_low20_0 = g_0_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_14 + u_40_54 * (const 64 (2**21)) + v_40_54 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_14 + r_40_54 * (const 64 (2**21)) + s_40_54 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_14,
    f_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_14,
    g_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 54)) <=s delta, delta <=s (const 64 (1 + 2*54)),
    (const 64 (-(2**20))) <=s u_40_54, u_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_54, v_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_54, r_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_54, s_40_54 <=s (const 64 ((2**20)-1)),
    u_40_54 + v_40_54 <=s (const 64 (2**20)),
    u_40_54 - v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 + v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 - v_40_54 <=s (const 64 (2**20)),
    r_40_54 + s_40_54 <=s (const 64 (2**20)),
    r_40_54 - s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 + s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 - s_40_54 <=s (const 64 (2**20)),
    u_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_40_54 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise b
assume
g_0_low60_40_low20_14 = 1 (mod 2)
&&
g_0_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_15 f_0_low60_40_low20_14;
mov u_40_55 u_40_54;
mov v_40_55 v_40_54;

add g_0_low60_40_low20_15 g_0_low60_40_low20_14 f_0_low60_40_low20_14;
asr g_0_low60_40_low20_15 g_0_low60_40_low20_15 1;
add r_40_55 r_40_54 u_40_54;
asr r_40_55 r_40_55 1;
add s_40_55 s_40_54 v_40_54;
asr s_40_55 s_40_55 1;
assert
    true
&&
    f_0_low60_40_low20_15 = f_0_low60_40_low20_14,
    u_40_55 = u_40_54,
    v_40_55 = v_40_54,
    g_0_low60_40_low20_15 * (const 64 2) = g_0_low60_40_low20_14 + f_0_low60_40_low20_14,
    r_40_55 * (const 64 2) = r_40_54 + u_40_54,
    s_40_55 * (const 64 2) = s_40_54 + v_40_54
;

assume
    f_0_low60_40_low20_15 = f_0_low60_40_low20_14,
    u_40_55 = u_40_54,
    v_40_55 = v_40_54,
    g_0_low60_40_low20_15 * 2 = g_0_low60_40_low20_14 + f_0_low60_40_low20_14,
    r_40_55 * 2 = r_40_54 + u_40_54,
    s_40_55 * 2 = s_40_54 + v_40_54
&&
    true
;

{
    u_40_55 * f_0_low60_40_low20_0 + v_40_55 * g_0_low60_40_low20_0 = f_0_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_55 * f_0_low60_40_low20_0 + s_40_55 * g_0_low60_40_low20_0 = g_0_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_15 + u_40_55 * (const 64 (2**21)) + v_40_55 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_15 + r_40_55 * (const 64 (2**21)) + s_40_55 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_15,
    f_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_15,
    g_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 55)) <=s delta, delta <=s (const 64 (1 + 2*55)),
    (const 64 (-(2**20))) <=s u_40_55, u_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_55, v_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_55, r_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_55, s_40_55 <=s (const 64 ((2**20)-1)),
    u_40_55 + v_40_55 <=s (const 64 (2**20)),
    u_40_55 - v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 + v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 - v_40_55 <=s (const 64 (2**20)),
    r_40_55 + s_40_55 <=s (const 64 (2**20)),
    r_40_55 - s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 + s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 - s_40_55 <=s (const 64 (2**20)),
    u_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_40_55 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_054_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_14,
sint64 g_0_low60_40_low20_14,
sint64 f_0_low60_40_low20_15,
sint64 g_0_low60_40_low20_15,
sint64 u_40_54,
sint64 v_40_54,
sint64 r_40_54,
sint64 s_40_54,
sint64 u_40_55,
sint64 v_40_55,
sint64 r_40_55,
sint64 s_40_55,
bit ne
)={
    u_40_54 * f_0_low60_40_low20_0 + v_40_54 * g_0_low60_40_low20_0 = f_0_low60_40_low20_14 * (-(2**20)),
    r_40_54 * f_0_low60_40_low20_0 + s_40_54 * g_0_low60_40_low20_0 = g_0_low60_40_low20_14 * (-(2**20))
&&
    u_40_54 * f_0_low60_40_low20_0 + v_40_54 * g_0_low60_40_low20_0 = f_0_low60_40_low20_14 * (const 64 (-(2**20))),
    r_40_54 * f_0_low60_40_low20_0 + s_40_54 * g_0_low60_40_low20_0 = g_0_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_14 + u_40_54 * (const 64 (2**21)) + v_40_54 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_14 + r_40_54 * (const 64 (2**21)) + s_40_54 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_14,
    f_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_14,
    g_0_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 54)) <=s delta, delta <=s (const 64 (1 + 2*54)),
    (const 64 (-(2**20))) <=s u_40_54, u_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_54, v_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_54, r_40_54 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_54, s_40_54 <=s (const 64 ((2**20)-1)),
    u_40_54 + v_40_54 <=s (const 64 (2**20)),
    u_40_54 - v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 + v_40_54 <=s (const 64 (2**20)),
    (const 64 0) - u_40_54 - v_40_54 <=s (const 64 (2**20)),
    r_40_54 + s_40_54 <=s (const 64 (2**20)),
    r_40_54 - s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 + s_40_54 <=s (const 64 (2**20)),
    (const 64 0) - r_40_54 - s_40_54 <=s (const 64 (2**20)),
    u_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_40_54 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_40_54 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise c
assume
g_0_low60_40_low20_14 = 1 (mod 2)
&&
g_0_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_15 g_0_low60_40_low20_14;
mov u_40_55 r_40_54;
mov v_40_55 s_40_54;

subs dc g_0_low60_40_low20_15 g_0_low60_40_low20_14 f_0_low60_40_low20_14;
asr g_0_low60_40_low20_15 g_0_low60_40_low20_15 1;
subs dc r_40_55 r_40_54 u_40_54;
asr r_40_55 r_40_55 1;
subs dc s_40_55 s_40_54 v_40_54;
asr s_40_55 s_40_55 1;
assert
    true
&&
    f_0_low60_40_low20_15 = g_0_low60_40_low20_14,
    u_40_55 = r_40_54,
    v_40_55 = s_40_54,
    g_0_low60_40_low20_15 * (const 64 2) = g_0_low60_40_low20_14 - f_0_low60_40_low20_14,
    r_40_55 * (const 64 2) = r_40_54 - u_40_54,
    s_40_55 * (const 64 2) = s_40_54 - v_40_54
;

assume
    f_0_low60_40_low20_15 = g_0_low60_40_low20_14,
    u_40_55 = r_40_54,
    v_40_55 = s_40_54,
    g_0_low60_40_low20_15 * 2 = g_0_low60_40_low20_14 - f_0_low60_40_low20_14,
    r_40_55 * 2 = r_40_54 - u_40_54,
    s_40_55 * 2 = s_40_54 - v_40_54
&&
    true
;

{
    u_40_55 * f_0_low60_40_low20_0 + v_40_55 * g_0_low60_40_low20_0 = f_0_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_55 * f_0_low60_40_low20_0 + s_40_55 * g_0_low60_40_low20_0 = g_0_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_15 + u_40_55 * (const 64 (2**21)) + v_40_55 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_15 + r_40_55 * (const 64 (2**21)) + s_40_55 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_15,
    f_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_15,
    g_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 55)) <=s delta, delta <=s (const 64 (1 + 2*55)),
    (const 64 (-(2**20))) <=s u_40_55, u_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_55, v_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_55, r_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_55, s_40_55 <=s (const 64 ((2**20)-1)),
    u_40_55 + v_40_55 <=s (const 64 (2**20)),
    u_40_55 - v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 + v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 - v_40_55 <=s (const 64 (2**20)),
    r_40_55 + s_40_55 <=s (const 64 (2**20)),
    r_40_55 - s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 + s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 - s_40_55 <=s (const 64 (2**20)),
    u_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_40_55 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_055_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_15,
sint64 g_0_low60_40_low20_15,
sint64 f_0_low60_40_low20_16,
sint64 g_0_low60_40_low20_16,
sint64 u_40_55,
sint64 v_40_55,
sint64 r_40_55,
sint64 s_40_55,
sint64 u_40_56,
sint64 v_40_56,
sint64 r_40_56,
sint64 s_40_56,
bit ne
)={
    u_40_55 * f_0_low60_40_low20_0 + v_40_55 * g_0_low60_40_low20_0 = f_0_low60_40_low20_15 * (-(2**20)),
    r_40_55 * f_0_low60_40_low20_0 + s_40_55 * g_0_low60_40_low20_0 = g_0_low60_40_low20_15 * (-(2**20))
&&
    u_40_55 * f_0_low60_40_low20_0 + v_40_55 * g_0_low60_40_low20_0 = f_0_low60_40_low20_15 * (const 64 (-(2**20))),
    r_40_55 * f_0_low60_40_low20_0 + s_40_55 * g_0_low60_40_low20_0 = g_0_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_15 + u_40_55 * (const 64 (2**21)) + v_40_55 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_15 + r_40_55 * (const 64 (2**21)) + s_40_55 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_15,
    f_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_15,
    g_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 55)) <=s delta, delta <=s (const 64 (1 + 2*55)),
    (const 64 (-(2**20))) <=s u_40_55, u_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_55, v_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_55, r_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_55, s_40_55 <=s (const 64 ((2**20)-1)),
    u_40_55 + v_40_55 <=s (const 64 (2**20)),
    u_40_55 - v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 + v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 - v_40_55 <=s (const 64 (2**20)),
    r_40_55 + s_40_55 <=s (const 64 (2**20)),
    r_40_55 - s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 + s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 - s_40_55 <=s (const 64 (2**20)),
    u_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_40_55 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise a
assume
g_0_low60_40_low20_15 = 0 (mod 2)
&&
g_0_low60_40_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_16 f_0_low60_40_low20_15;
mov u_40_56 u_40_55;
mov v_40_56 v_40_55;

asr g_0_low60_40_low20_16 g_0_low60_40_low20_15 1;
asr r_40_56 r_40_55 1;
asr s_40_56 s_40_55 1;
assert
    true
&&
    f_0_low60_40_low20_16 = f_0_low60_40_low20_15,
    u_40_56 = u_40_55,
    v_40_56 = v_40_55,
    g_0_low60_40_low20_16 * (const 64 2) = g_0_low60_40_low20_15,
    r_40_56 * (const 64 2) = r_40_55,
    s_40_56 * (const 64 2) = s_40_55
;

assume
    f_0_low60_40_low20_16 = f_0_low60_40_low20_15,
    u_40_56 = u_40_55,
    v_40_56 = v_40_55,
    g_0_low60_40_low20_16 * 2 = g_0_low60_40_low20_15,
    r_40_56 * 2 = r_40_55,
    s_40_56 * 2 = s_40_55
&&
    true
;

{
    u_40_56 * f_0_low60_40_low20_0 + v_40_56 * g_0_low60_40_low20_0 = f_0_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_56 * f_0_low60_40_low20_0 + s_40_56 * g_0_low60_40_low20_0 = g_0_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_16 + u_40_56 * (const 64 (2**21)) + v_40_56 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_16 + r_40_56 * (const 64 (2**21)) + s_40_56 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_16,
    f_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_16,
    g_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 56)) <=s delta, delta <=s (const 64 (1 + 2*56)),
    (const 64 (-(2**20))) <=s u_40_56, u_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_56, v_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_56, r_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_56, s_40_56 <=s (const 64 ((2**20)-1)),
    u_40_56 + v_40_56 <=s (const 64 (2**20)),
    u_40_56 - v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 + v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 - v_40_56 <=s (const 64 (2**20)),
    r_40_56 + s_40_56 <=s (const 64 (2**20)),
    r_40_56 - s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 + s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 - s_40_56 <=s (const 64 (2**20)),
    u_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_40_56 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_055_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_15,
sint64 g_0_low60_40_low20_15,
sint64 f_0_low60_40_low20_16,
sint64 g_0_low60_40_low20_16,
sint64 u_40_55,
sint64 v_40_55,
sint64 r_40_55,
sint64 s_40_55,
sint64 u_40_56,
sint64 v_40_56,
sint64 r_40_56,
sint64 s_40_56,
bit ne
)={
    u_40_55 * f_0_low60_40_low20_0 + v_40_55 * g_0_low60_40_low20_0 = f_0_low60_40_low20_15 * (-(2**20)),
    r_40_55 * f_0_low60_40_low20_0 + s_40_55 * g_0_low60_40_low20_0 = g_0_low60_40_low20_15 * (-(2**20))
&&
    u_40_55 * f_0_low60_40_low20_0 + v_40_55 * g_0_low60_40_low20_0 = f_0_low60_40_low20_15 * (const 64 (-(2**20))),
    r_40_55 * f_0_low60_40_low20_0 + s_40_55 * g_0_low60_40_low20_0 = g_0_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_15 + u_40_55 * (const 64 (2**21)) + v_40_55 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_15 + r_40_55 * (const 64 (2**21)) + s_40_55 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_15,
    f_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_15,
    g_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 55)) <=s delta, delta <=s (const 64 (1 + 2*55)),
    (const 64 (-(2**20))) <=s u_40_55, u_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_55, v_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_55, r_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_55, s_40_55 <=s (const 64 ((2**20)-1)),
    u_40_55 + v_40_55 <=s (const 64 (2**20)),
    u_40_55 - v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 + v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 - v_40_55 <=s (const 64 (2**20)),
    r_40_55 + s_40_55 <=s (const 64 (2**20)),
    r_40_55 - s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 + s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 - s_40_55 <=s (const 64 (2**20)),
    u_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_40_55 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise b
assume
g_0_low60_40_low20_15 = 1 (mod 2)
&&
g_0_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_16 f_0_low60_40_low20_15;
mov u_40_56 u_40_55;
mov v_40_56 v_40_55;

add g_0_low60_40_low20_16 g_0_low60_40_low20_15 f_0_low60_40_low20_15;
asr g_0_low60_40_low20_16 g_0_low60_40_low20_16 1;
add r_40_56 r_40_55 u_40_55;
asr r_40_56 r_40_56 1;
add s_40_56 s_40_55 v_40_55;
asr s_40_56 s_40_56 1;
assert
    true
&&
    f_0_low60_40_low20_16 = f_0_low60_40_low20_15,
    u_40_56 = u_40_55,
    v_40_56 = v_40_55,
    g_0_low60_40_low20_16 * (const 64 2) = g_0_low60_40_low20_15 + f_0_low60_40_low20_15,
    r_40_56 * (const 64 2) = r_40_55 + u_40_55,
    s_40_56 * (const 64 2) = s_40_55 + v_40_55
;

assume
    f_0_low60_40_low20_16 = f_0_low60_40_low20_15,
    u_40_56 = u_40_55,
    v_40_56 = v_40_55,
    g_0_low60_40_low20_16 * 2 = g_0_low60_40_low20_15 + f_0_low60_40_low20_15,
    r_40_56 * 2 = r_40_55 + u_40_55,
    s_40_56 * 2 = s_40_55 + v_40_55
&&
    true
;

{
    u_40_56 * f_0_low60_40_low20_0 + v_40_56 * g_0_low60_40_low20_0 = f_0_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_56 * f_0_low60_40_low20_0 + s_40_56 * g_0_low60_40_low20_0 = g_0_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_16 + u_40_56 * (const 64 (2**21)) + v_40_56 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_16 + r_40_56 * (const 64 (2**21)) + s_40_56 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_16,
    f_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_16,
    g_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 56)) <=s delta, delta <=s (const 64 (1 + 2*56)),
    (const 64 (-(2**20))) <=s u_40_56, u_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_56, v_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_56, r_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_56, s_40_56 <=s (const 64 ((2**20)-1)),
    u_40_56 + v_40_56 <=s (const 64 (2**20)),
    u_40_56 - v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 + v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 - v_40_56 <=s (const 64 (2**20)),
    r_40_56 + s_40_56 <=s (const 64 (2**20)),
    r_40_56 - s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 + s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 - s_40_56 <=s (const 64 (2**20)),
    u_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_40_56 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_055_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_15,
sint64 g_0_low60_40_low20_15,
sint64 f_0_low60_40_low20_16,
sint64 g_0_low60_40_low20_16,
sint64 u_40_55,
sint64 v_40_55,
sint64 r_40_55,
sint64 s_40_55,
sint64 u_40_56,
sint64 v_40_56,
sint64 r_40_56,
sint64 s_40_56,
bit ne
)={
    u_40_55 * f_0_low60_40_low20_0 + v_40_55 * g_0_low60_40_low20_0 = f_0_low60_40_low20_15 * (-(2**20)),
    r_40_55 * f_0_low60_40_low20_0 + s_40_55 * g_0_low60_40_low20_0 = g_0_low60_40_low20_15 * (-(2**20))
&&
    u_40_55 * f_0_low60_40_low20_0 + v_40_55 * g_0_low60_40_low20_0 = f_0_low60_40_low20_15 * (const 64 (-(2**20))),
    r_40_55 * f_0_low60_40_low20_0 + s_40_55 * g_0_low60_40_low20_0 = g_0_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_15 + u_40_55 * (const 64 (2**21)) + v_40_55 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_15 + r_40_55 * (const 64 (2**21)) + s_40_55 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_15,
    f_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_15,
    g_0_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 55)) <=s delta, delta <=s (const 64 (1 + 2*55)),
    (const 64 (-(2**20))) <=s u_40_55, u_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_55, v_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_55, r_40_55 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_55, s_40_55 <=s (const 64 ((2**20)-1)),
    u_40_55 + v_40_55 <=s (const 64 (2**20)),
    u_40_55 - v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 + v_40_55 <=s (const 64 (2**20)),
    (const 64 0) - u_40_55 - v_40_55 <=s (const 64 (2**20)),
    r_40_55 + s_40_55 <=s (const 64 (2**20)),
    r_40_55 - s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 + s_40_55 <=s (const 64 (2**20)),
    (const 64 0) - r_40_55 - s_40_55 <=s (const 64 (2**20)),
    u_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_40_55 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_40_55 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise c
assume
g_0_low60_40_low20_15 = 1 (mod 2)
&&
g_0_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_16 g_0_low60_40_low20_15;
mov u_40_56 r_40_55;
mov v_40_56 s_40_55;

subs dc g_0_low60_40_low20_16 g_0_low60_40_low20_15 f_0_low60_40_low20_15;
asr g_0_low60_40_low20_16 g_0_low60_40_low20_16 1;
subs dc r_40_56 r_40_55 u_40_55;
asr r_40_56 r_40_56 1;
subs dc s_40_56 s_40_55 v_40_55;
asr s_40_56 s_40_56 1;
assert
    true
&&
    f_0_low60_40_low20_16 = g_0_low60_40_low20_15,
    u_40_56 = r_40_55,
    v_40_56 = s_40_55,
    g_0_low60_40_low20_16 * (const 64 2) = g_0_low60_40_low20_15 - f_0_low60_40_low20_15,
    r_40_56 * (const 64 2) = r_40_55 - u_40_55,
    s_40_56 * (const 64 2) = s_40_55 - v_40_55
;

assume
    f_0_low60_40_low20_16 = g_0_low60_40_low20_15,
    u_40_56 = r_40_55,
    v_40_56 = s_40_55,
    g_0_low60_40_low20_16 * 2 = g_0_low60_40_low20_15 - f_0_low60_40_low20_15,
    r_40_56 * 2 = r_40_55 - u_40_55,
    s_40_56 * 2 = s_40_55 - v_40_55
&&
    true
;

{
    u_40_56 * f_0_low60_40_low20_0 + v_40_56 * g_0_low60_40_low20_0 = f_0_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_56 * f_0_low60_40_low20_0 + s_40_56 * g_0_low60_40_low20_0 = g_0_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_16 + u_40_56 * (const 64 (2**21)) + v_40_56 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_16 + r_40_56 * (const 64 (2**21)) + s_40_56 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_16,
    f_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_16,
    g_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 56)) <=s delta, delta <=s (const 64 (1 + 2*56)),
    (const 64 (-(2**20))) <=s u_40_56, u_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_56, v_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_56, r_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_56, s_40_56 <=s (const 64 ((2**20)-1)),
    u_40_56 + v_40_56 <=s (const 64 (2**20)),
    u_40_56 - v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 + v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 - v_40_56 <=s (const 64 (2**20)),
    r_40_56 + s_40_56 <=s (const 64 (2**20)),
    r_40_56 - s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 + s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 - s_40_56 <=s (const 64 (2**20)),
    u_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_40_56 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_056_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_16,
sint64 g_0_low60_40_low20_16,
sint64 f_0_low60_40_low20_17,
sint64 g_0_low60_40_low20_17,
sint64 u_40_56,
sint64 v_40_56,
sint64 r_40_56,
sint64 s_40_56,
sint64 u_40_57,
sint64 v_40_57,
sint64 r_40_57,
sint64 s_40_57,
bit ne
)={
    u_40_56 * f_0_low60_40_low20_0 + v_40_56 * g_0_low60_40_low20_0 = f_0_low60_40_low20_16 * (-(2**20)),
    r_40_56 * f_0_low60_40_low20_0 + s_40_56 * g_0_low60_40_low20_0 = g_0_low60_40_low20_16 * (-(2**20))
&&
    u_40_56 * f_0_low60_40_low20_0 + v_40_56 * g_0_low60_40_low20_0 = f_0_low60_40_low20_16 * (const 64 (-(2**20))),
    r_40_56 * f_0_low60_40_low20_0 + s_40_56 * g_0_low60_40_low20_0 = g_0_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_16 + u_40_56 * (const 64 (2**21)) + v_40_56 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_16 + r_40_56 * (const 64 (2**21)) + s_40_56 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_16,
    f_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_16,
    g_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 56)) <=s delta, delta <=s (const 64 (1 + 2*56)),
    (const 64 (-(2**20))) <=s u_40_56, u_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_56, v_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_56, r_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_56, s_40_56 <=s (const 64 ((2**20)-1)),
    u_40_56 + v_40_56 <=s (const 64 (2**20)),
    u_40_56 - v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 + v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 - v_40_56 <=s (const 64 (2**20)),
    r_40_56 + s_40_56 <=s (const 64 (2**20)),
    r_40_56 - s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 + s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 - s_40_56 <=s (const 64 (2**20)),
    u_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_40_56 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise a
assume
g_0_low60_40_low20_16 = 0 (mod 2)
&&
g_0_low60_40_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_17 f_0_low60_40_low20_16;
mov u_40_57 u_40_56;
mov v_40_57 v_40_56;

asr g_0_low60_40_low20_17 g_0_low60_40_low20_16 1;
asr r_40_57 r_40_56 1;
asr s_40_57 s_40_56 1;
assert
    true
&&
    f_0_low60_40_low20_17 = f_0_low60_40_low20_16,
    u_40_57 = u_40_56,
    v_40_57 = v_40_56,
    g_0_low60_40_low20_17 * (const 64 2) = g_0_low60_40_low20_16,
    r_40_57 * (const 64 2) = r_40_56,
    s_40_57 * (const 64 2) = s_40_56
;

assume
    f_0_low60_40_low20_17 = f_0_low60_40_low20_16,
    u_40_57 = u_40_56,
    v_40_57 = v_40_56,
    g_0_low60_40_low20_17 * 2 = g_0_low60_40_low20_16,
    r_40_57 * 2 = r_40_56,
    s_40_57 * 2 = s_40_56
&&
    true
;

{
    u_40_57 * f_0_low60_40_low20_0 + v_40_57 * g_0_low60_40_low20_0 = f_0_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_57 * f_0_low60_40_low20_0 + s_40_57 * g_0_low60_40_low20_0 = g_0_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_17 + u_40_57 * (const 64 (2**21)) + v_40_57 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_17 + r_40_57 * (const 64 (2**21)) + s_40_57 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_17,
    f_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_17,
    g_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 57)) <=s delta, delta <=s (const 64 (1 + 2*57)),
    (const 64 (-(2**20))) <=s u_40_57, u_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_57, v_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_57, r_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_57, s_40_57 <=s (const 64 ((2**20)-1)),
    u_40_57 + v_40_57 <=s (const 64 (2**20)),
    u_40_57 - v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 + v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 - v_40_57 <=s (const 64 (2**20)),
    r_40_57 + s_40_57 <=s (const 64 (2**20)),
    r_40_57 - s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 + s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 - s_40_57 <=s (const 64 (2**20)),
    u_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_40_57 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_056_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_16,
sint64 g_0_low60_40_low20_16,
sint64 f_0_low60_40_low20_17,
sint64 g_0_low60_40_low20_17,
sint64 u_40_56,
sint64 v_40_56,
sint64 r_40_56,
sint64 s_40_56,
sint64 u_40_57,
sint64 v_40_57,
sint64 r_40_57,
sint64 s_40_57,
bit ne
)={
    u_40_56 * f_0_low60_40_low20_0 + v_40_56 * g_0_low60_40_low20_0 = f_0_low60_40_low20_16 * (-(2**20)),
    r_40_56 * f_0_low60_40_low20_0 + s_40_56 * g_0_low60_40_low20_0 = g_0_low60_40_low20_16 * (-(2**20))
&&
    u_40_56 * f_0_low60_40_low20_0 + v_40_56 * g_0_low60_40_low20_0 = f_0_low60_40_low20_16 * (const 64 (-(2**20))),
    r_40_56 * f_0_low60_40_low20_0 + s_40_56 * g_0_low60_40_low20_0 = g_0_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_16 + u_40_56 * (const 64 (2**21)) + v_40_56 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_16 + r_40_56 * (const 64 (2**21)) + s_40_56 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_16,
    f_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_16,
    g_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 56)) <=s delta, delta <=s (const 64 (1 + 2*56)),
    (const 64 (-(2**20))) <=s u_40_56, u_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_56, v_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_56, r_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_56, s_40_56 <=s (const 64 ((2**20)-1)),
    u_40_56 + v_40_56 <=s (const 64 (2**20)),
    u_40_56 - v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 + v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 - v_40_56 <=s (const 64 (2**20)),
    r_40_56 + s_40_56 <=s (const 64 (2**20)),
    r_40_56 - s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 + s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 - s_40_56 <=s (const 64 (2**20)),
    u_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_40_56 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise b
assume
g_0_low60_40_low20_16 = 1 (mod 2)
&&
g_0_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_17 f_0_low60_40_low20_16;
mov u_40_57 u_40_56;
mov v_40_57 v_40_56;

add g_0_low60_40_low20_17 g_0_low60_40_low20_16 f_0_low60_40_low20_16;
asr g_0_low60_40_low20_17 g_0_low60_40_low20_17 1;
add r_40_57 r_40_56 u_40_56;
asr r_40_57 r_40_57 1;
add s_40_57 s_40_56 v_40_56;
asr s_40_57 s_40_57 1;
assert
    true
&&
    f_0_low60_40_low20_17 = f_0_low60_40_low20_16,
    u_40_57 = u_40_56,
    v_40_57 = v_40_56,
    g_0_low60_40_low20_17 * (const 64 2) = g_0_low60_40_low20_16 + f_0_low60_40_low20_16,
    r_40_57 * (const 64 2) = r_40_56 + u_40_56,
    s_40_57 * (const 64 2) = s_40_56 + v_40_56
;

assume
    f_0_low60_40_low20_17 = f_0_low60_40_low20_16,
    u_40_57 = u_40_56,
    v_40_57 = v_40_56,
    g_0_low60_40_low20_17 * 2 = g_0_low60_40_low20_16 + f_0_low60_40_low20_16,
    r_40_57 * 2 = r_40_56 + u_40_56,
    s_40_57 * 2 = s_40_56 + v_40_56
&&
    true
;

{
    u_40_57 * f_0_low60_40_low20_0 + v_40_57 * g_0_low60_40_low20_0 = f_0_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_57 * f_0_low60_40_low20_0 + s_40_57 * g_0_low60_40_low20_0 = g_0_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_17 + u_40_57 * (const 64 (2**21)) + v_40_57 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_17 + r_40_57 * (const 64 (2**21)) + s_40_57 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_17,
    f_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_17,
    g_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 57)) <=s delta, delta <=s (const 64 (1 + 2*57)),
    (const 64 (-(2**20))) <=s u_40_57, u_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_57, v_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_57, r_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_57, s_40_57 <=s (const 64 ((2**20)-1)),
    u_40_57 + v_40_57 <=s (const 64 (2**20)),
    u_40_57 - v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 + v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 - v_40_57 <=s (const 64 (2**20)),
    r_40_57 + s_40_57 <=s (const 64 (2**20)),
    r_40_57 - s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 + s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 - s_40_57 <=s (const 64 (2**20)),
    u_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_40_57 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_056_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_16,
sint64 g_0_low60_40_low20_16,
sint64 f_0_low60_40_low20_17,
sint64 g_0_low60_40_low20_17,
sint64 u_40_56,
sint64 v_40_56,
sint64 r_40_56,
sint64 s_40_56,
sint64 u_40_57,
sint64 v_40_57,
sint64 r_40_57,
sint64 s_40_57,
bit ne
)={
    u_40_56 * f_0_low60_40_low20_0 + v_40_56 * g_0_low60_40_low20_0 = f_0_low60_40_low20_16 * (-(2**20)),
    r_40_56 * f_0_low60_40_low20_0 + s_40_56 * g_0_low60_40_low20_0 = g_0_low60_40_low20_16 * (-(2**20))
&&
    u_40_56 * f_0_low60_40_low20_0 + v_40_56 * g_0_low60_40_low20_0 = f_0_low60_40_low20_16 * (const 64 (-(2**20))),
    r_40_56 * f_0_low60_40_low20_0 + s_40_56 * g_0_low60_40_low20_0 = g_0_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_16 + u_40_56 * (const 64 (2**21)) + v_40_56 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_16 + r_40_56 * (const 64 (2**21)) + s_40_56 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_16,
    f_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_16,
    g_0_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 56)) <=s delta, delta <=s (const 64 (1 + 2*56)),
    (const 64 (-(2**20))) <=s u_40_56, u_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_56, v_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_56, r_40_56 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_56, s_40_56 <=s (const 64 ((2**20)-1)),
    u_40_56 + v_40_56 <=s (const 64 (2**20)),
    u_40_56 - v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 + v_40_56 <=s (const 64 (2**20)),
    (const 64 0) - u_40_56 - v_40_56 <=s (const 64 (2**20)),
    r_40_56 + s_40_56 <=s (const 64 (2**20)),
    r_40_56 - s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 + s_40_56 <=s (const 64 (2**20)),
    (const 64 0) - r_40_56 - s_40_56 <=s (const 64 (2**20)),
    u_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_40_56 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_40_56 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise c
assume
g_0_low60_40_low20_16 = 1 (mod 2)
&&
g_0_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_17 g_0_low60_40_low20_16;
mov u_40_57 r_40_56;
mov v_40_57 s_40_56;

subs dc g_0_low60_40_low20_17 g_0_low60_40_low20_16 f_0_low60_40_low20_16;
asr g_0_low60_40_low20_17 g_0_low60_40_low20_17 1;
subs dc r_40_57 r_40_56 u_40_56;
asr r_40_57 r_40_57 1;
subs dc s_40_57 s_40_56 v_40_56;
asr s_40_57 s_40_57 1;
assert
    true
&&
    f_0_low60_40_low20_17 = g_0_low60_40_low20_16,
    u_40_57 = r_40_56,
    v_40_57 = s_40_56,
    g_0_low60_40_low20_17 * (const 64 2) = g_0_low60_40_low20_16 - f_0_low60_40_low20_16,
    r_40_57 * (const 64 2) = r_40_56 - u_40_56,
    s_40_57 * (const 64 2) = s_40_56 - v_40_56
;

assume
    f_0_low60_40_low20_17 = g_0_low60_40_low20_16,
    u_40_57 = r_40_56,
    v_40_57 = s_40_56,
    g_0_low60_40_low20_17 * 2 = g_0_low60_40_low20_16 - f_0_low60_40_low20_16,
    r_40_57 * 2 = r_40_56 - u_40_56,
    s_40_57 * 2 = s_40_56 - v_40_56
&&
    true
;

{
    u_40_57 * f_0_low60_40_low20_0 + v_40_57 * g_0_low60_40_low20_0 = f_0_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_57 * f_0_low60_40_low20_0 + s_40_57 * g_0_low60_40_low20_0 = g_0_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_17 + u_40_57 * (const 64 (2**21)) + v_40_57 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_17 + r_40_57 * (const 64 (2**21)) + s_40_57 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_17,
    f_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_17,
    g_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 57)) <=s delta, delta <=s (const 64 (1 + 2*57)),
    (const 64 (-(2**20))) <=s u_40_57, u_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_57, v_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_57, r_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_57, s_40_57 <=s (const 64 ((2**20)-1)),
    u_40_57 + v_40_57 <=s (const 64 (2**20)),
    u_40_57 - v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 + v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 - v_40_57 <=s (const 64 (2**20)),
    r_40_57 + s_40_57 <=s (const 64 (2**20)),
    r_40_57 - s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 + s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 - s_40_57 <=s (const 64 (2**20)),
    u_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_40_57 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_057_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_17,
sint64 g_0_low60_40_low20_17,
sint64 f_0_low60_40_low20_18,
sint64 g_0_low60_40_low20_18,
sint64 u_40_57,
sint64 v_40_57,
sint64 r_40_57,
sint64 s_40_57,
sint64 u_40_58,
sint64 v_40_58,
sint64 r_40_58,
sint64 s_40_58,
bit ne
)={
    u_40_57 * f_0_low60_40_low20_0 + v_40_57 * g_0_low60_40_low20_0 = f_0_low60_40_low20_17 * (-(2**20)),
    r_40_57 * f_0_low60_40_low20_0 + s_40_57 * g_0_low60_40_low20_0 = g_0_low60_40_low20_17 * (-(2**20))
&&
    u_40_57 * f_0_low60_40_low20_0 + v_40_57 * g_0_low60_40_low20_0 = f_0_low60_40_low20_17 * (const 64 (-(2**20))),
    r_40_57 * f_0_low60_40_low20_0 + s_40_57 * g_0_low60_40_low20_0 = g_0_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_17 + u_40_57 * (const 64 (2**21)) + v_40_57 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_17 + r_40_57 * (const 64 (2**21)) + s_40_57 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_17,
    f_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_17,
    g_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 57)) <=s delta, delta <=s (const 64 (1 + 2*57)),
    (const 64 (-(2**20))) <=s u_40_57, u_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_57, v_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_57, r_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_57, s_40_57 <=s (const 64 ((2**20)-1)),
    u_40_57 + v_40_57 <=s (const 64 (2**20)),
    u_40_57 - v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 + v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 - v_40_57 <=s (const 64 (2**20)),
    r_40_57 + s_40_57 <=s (const 64 (2**20)),
    r_40_57 - s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 + s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 - s_40_57 <=s (const 64 (2**20)),
    u_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_40_57 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise a
assume
g_0_low60_40_low20_17 = 0 (mod 2)
&&
g_0_low60_40_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_40_low20_18 f_0_low60_40_low20_17;
mov u_40_58 u_40_57;
mov v_40_58 v_40_57;

asr g_0_low60_40_low20_18 g_0_low60_40_low20_17 1;
asr r_40_58 r_40_57 1;
asr s_40_58 s_40_57 1;
assert
    true
&&
    f_0_low60_40_low20_18 = f_0_low60_40_low20_17,
    u_40_58 = u_40_57,
    v_40_58 = v_40_57,
    g_0_low60_40_low20_18 * (const 64 2) = g_0_low60_40_low20_17,
    r_40_58 * (const 64 2) = r_40_57,
    s_40_58 * (const 64 2) = s_40_57
;

assume
    f_0_low60_40_low20_18 = f_0_low60_40_low20_17,
    u_40_58 = u_40_57,
    v_40_58 = v_40_57,
    g_0_low60_40_low20_18 * 2 = g_0_low60_40_low20_17,
    r_40_58 * 2 = r_40_57,
    s_40_58 * 2 = s_40_57
&&
    true
;

{
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_18 + u_40_58 * (const 64 (2**21)) + v_40_58 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_18 + r_40_58 * (const 64 (2**21)) + s_40_58 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_18,
    f_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_18,
    g_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 58)) <=s delta, delta <=s (const 64 (1 + 2*58)),
    (const 64 (-(2**20))) <=s u_40_58, u_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_58, v_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_58, r_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_58, s_40_58 <=s (const 64 ((2**20)-1)),
    u_40_58 + v_40_58 <=s (const 64 (2**20)),
    u_40_58 - v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 + v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 - v_40_58 <=s (const 64 (2**20)),
    r_40_58 + s_40_58 <=s (const 64 (2**20)),
    r_40_58 - s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 + s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 - s_40_58 <=s (const 64 (2**20)),
    u_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_40_58 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_057_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_17,
sint64 g_0_low60_40_low20_17,
sint64 f_0_low60_40_low20_18,
sint64 g_0_low60_40_low20_18,
sint64 u_40_57,
sint64 v_40_57,
sint64 r_40_57,
sint64 s_40_57,
sint64 u_40_58,
sint64 v_40_58,
sint64 r_40_58,
sint64 s_40_58,
bit ne
)={
    u_40_57 * f_0_low60_40_low20_0 + v_40_57 * g_0_low60_40_low20_0 = f_0_low60_40_low20_17 * (-(2**20)),
    r_40_57 * f_0_low60_40_low20_0 + s_40_57 * g_0_low60_40_low20_0 = g_0_low60_40_low20_17 * (-(2**20))
&&
    u_40_57 * f_0_low60_40_low20_0 + v_40_57 * g_0_low60_40_low20_0 = f_0_low60_40_low20_17 * (const 64 (-(2**20))),
    r_40_57 * f_0_low60_40_low20_0 + s_40_57 * g_0_low60_40_low20_0 = g_0_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_17 + u_40_57 * (const 64 (2**21)) + v_40_57 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_17 + r_40_57 * (const 64 (2**21)) + s_40_57 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_17,
    f_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_17,
    g_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 57)) <=s delta, delta <=s (const 64 (1 + 2*57)),
    (const 64 (-(2**20))) <=s u_40_57, u_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_57, v_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_57, r_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_57, s_40_57 <=s (const 64 ((2**20)-1)),
    u_40_57 + v_40_57 <=s (const 64 (2**20)),
    u_40_57 - v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 + v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 - v_40_57 <=s (const 64 (2**20)),
    r_40_57 + s_40_57 <=s (const 64 (2**20)),
    r_40_57 - s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 + s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 - s_40_57 <=s (const 64 (2**20)),
    u_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_40_57 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise b
assume
g_0_low60_40_low20_17 = 1 (mod 2)
&&
g_0_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_18 f_0_low60_40_low20_17;
mov u_40_58 u_40_57;
mov v_40_58 v_40_57;

add g_0_low60_40_low20_18 g_0_low60_40_low20_17 f_0_low60_40_low20_17;
asr g_0_low60_40_low20_18 g_0_low60_40_low20_18 1;
add r_40_58 r_40_57 u_40_57;
asr r_40_58 r_40_58 1;
add s_40_58 s_40_57 v_40_57;
asr s_40_58 s_40_58 1;
assert
    true
&&
    f_0_low60_40_low20_18 = f_0_low60_40_low20_17,
    u_40_58 = u_40_57,
    v_40_58 = v_40_57,
    g_0_low60_40_low20_18 * (const 64 2) = g_0_low60_40_low20_17 + f_0_low60_40_low20_17,
    r_40_58 * (const 64 2) = r_40_57 + u_40_57,
    s_40_58 * (const 64 2) = s_40_57 + v_40_57
;

assume
    f_0_low60_40_low20_18 = f_0_low60_40_low20_17,
    u_40_58 = u_40_57,
    v_40_58 = v_40_57,
    g_0_low60_40_low20_18 * 2 = g_0_low60_40_low20_17 + f_0_low60_40_low20_17,
    r_40_58 * 2 = r_40_57 + u_40_57,
    s_40_58 * 2 = s_40_57 + v_40_57
&&
    true
;

{
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_18 + u_40_58 * (const 64 (2**21)) + v_40_58 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_18 + r_40_58 * (const 64 (2**21)) + s_40_58 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_18,
    f_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_18,
    g_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 58)) <=s delta, delta <=s (const 64 (1 + 2*58)),
    (const 64 (-(2**20))) <=s u_40_58, u_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_58, v_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_58, r_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_58, s_40_58 <=s (const 64 ((2**20)-1)),
    u_40_58 + v_40_58 <=s (const 64 (2**20)),
    u_40_58 - v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 + v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 - v_40_58 <=s (const 64 (2**20)),
    r_40_58 + s_40_58 <=s (const 64 (2**20)),
    r_40_58 - s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 + s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 - s_40_58 <=s (const 64 (2**20)),
    u_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_40_58 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_057_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_17,
sint64 g_0_low60_40_low20_17,
sint64 f_0_low60_40_low20_18,
sint64 g_0_low60_40_low20_18,
sint64 u_40_57,
sint64 v_40_57,
sint64 r_40_57,
sint64 s_40_57,
sint64 u_40_58,
sint64 v_40_58,
sint64 r_40_58,
sint64 s_40_58,
bit ne
)={
    u_40_57 * f_0_low60_40_low20_0 + v_40_57 * g_0_low60_40_low20_0 = f_0_low60_40_low20_17 * (-(2**20)),
    r_40_57 * f_0_low60_40_low20_0 + s_40_57 * g_0_low60_40_low20_0 = g_0_low60_40_low20_17 * (-(2**20))
&&
    u_40_57 * f_0_low60_40_low20_0 + v_40_57 * g_0_low60_40_low20_0 = f_0_low60_40_low20_17 * (const 64 (-(2**20))),
    r_40_57 * f_0_low60_40_low20_0 + s_40_57 * g_0_low60_40_low20_0 = g_0_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_17 + u_40_57 * (const 64 (2**21)) + v_40_57 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_17 + r_40_57 * (const 64 (2**21)) + s_40_57 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_17,
    f_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_17,
    g_0_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 57)) <=s delta, delta <=s (const 64 (1 + 2*57)),
    (const 64 (-(2**20))) <=s u_40_57, u_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_57, v_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_57, r_40_57 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_57, s_40_57 <=s (const 64 ((2**20)-1)),
    u_40_57 + v_40_57 <=s (const 64 (2**20)),
    u_40_57 - v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 + v_40_57 <=s (const 64 (2**20)),
    (const 64 0) - u_40_57 - v_40_57 <=s (const 64 (2**20)),
    r_40_57 + s_40_57 <=s (const 64 (2**20)),
    r_40_57 - s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 + s_40_57 <=s (const 64 (2**20)),
    (const 64 0) - r_40_57 - s_40_57 <=s (const 64 (2**20)),
    u_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_40_57 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_40_57 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise c
assume
g_0_low60_40_low20_17 = 1 (mod 2)
&&
g_0_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_18 g_0_low60_40_low20_17;
mov u_40_58 r_40_57;
mov v_40_58 s_40_57;

subs dc g_0_low60_40_low20_18 g_0_low60_40_low20_17 f_0_low60_40_low20_17;
asr g_0_low60_40_low20_18 g_0_low60_40_low20_18 1;
subs dc r_40_58 r_40_57 u_40_57;
asr r_40_58 r_40_58 1;
subs dc s_40_58 s_40_57 v_40_57;
asr s_40_58 s_40_58 1;
assert
    true
&&
    f_0_low60_40_low20_18 = g_0_low60_40_low20_17,
    u_40_58 = r_40_57,
    v_40_58 = s_40_57,
    g_0_low60_40_low20_18 * (const 64 2) = g_0_low60_40_low20_17 - f_0_low60_40_low20_17,
    r_40_58 * (const 64 2) = r_40_57 - u_40_57,
    s_40_58 * (const 64 2) = s_40_57 - v_40_57
;

assume
    f_0_low60_40_low20_18 = g_0_low60_40_low20_17,
    u_40_58 = r_40_57,
    v_40_58 = s_40_57,
    g_0_low60_40_low20_18 * 2 = g_0_low60_40_low20_17 - f_0_low60_40_low20_17,
    r_40_58 * 2 = r_40_57 - u_40_57,
    s_40_58 * 2 = s_40_57 - v_40_57
&&
    true
;

{
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_18 + u_40_58 * (const 64 (2**21)) + v_40_58 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_18 + r_40_58 * (const 64 (2**21)) + s_40_58 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_18,
    f_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_18,
    g_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 58)) <=s delta, delta <=s (const 64 (1 + 2*58)),
    (const 64 (-(2**20))) <=s u_40_58, u_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_58, v_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_58, r_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_58, s_40_58 <=s (const 64 ((2**20)-1)),
    u_40_58 + v_40_58 <=s (const 64 (2**20)),
    u_40_58 - v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 + v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 - v_40_58 <=s (const 64 (2**20)),
    r_40_58 + s_40_58 <=s (const 64 (2**20)),
    r_40_58 - s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 + s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 - s_40_58 <=s (const 64 (2**20)),
    u_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_40_58 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_058_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_18,
sint64 g_0_low60_40_low20_18,
sint64 f_0_low60_40_low20_19,
sint64 g_0_low60_40_low20_19,
sint64 u_40_58,
sint64 v_40_58,
sint64 r_40_58,
sint64 s_40_58,
sint64 u_40_59,
sint64 v_40_59,
sint64 r_40_59,
sint64 s_40_59,
bit ne
)={
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (-(2**20)),
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (-(2**20))
&&
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (const 64 (-(2**20))),
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_18 + u_40_58 * (const 64 (2**21)) + v_40_58 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_18 + r_40_58 * (const 64 (2**21)) + s_40_58 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_18,
    f_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_18,
    g_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 58)) <=s delta, delta <=s (const 64 (1 + 2*58)),
    (const 64 (-(2**20))) <=s u_40_58, u_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_58, v_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_58, r_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_58, s_40_58 <=s (const 64 ((2**20)-1)),
    u_40_58 + v_40_58 <=s (const 64 (2**20)),
    u_40_58 - v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 + v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 - v_40_58 <=s (const 64 (2**20)),
    r_40_58 + s_40_58 <=s (const 64 (2**20)),
    r_40_58 - s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 + s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 - s_40_58 <=s (const 64 (2**20)),
    u_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_40_58 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise a
assume
g_0_low60_40_low20_18 = 0 (mod 2)
&&
g_0_low60_40_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov f_0_low60_40_low20_19 f_0_low60_40_low20_18;
mov u_40_59 u_40_58;
mov v_40_59 v_40_58;

asr g_0_low60_40_low20_19 g_0_low60_40_low20_18 1;
asr r_40_59 r_40_58 1;
asr s_40_59 s_40_58 1;
assert
    true
&&
    f_0_low60_40_low20_19 = f_0_low60_40_low20_18,
    u_40_59 = u_40_58,
    v_40_59 = v_40_58,
    g_0_low60_40_low20_19 * (const 64 2) = g_0_low60_40_low20_18,
    r_40_59 * (const 64 2) = r_40_58,
    s_40_59 * (const 64 2) = s_40_58
;

assume
    f_0_low60_40_low20_19 = f_0_low60_40_low20_18,
    u_40_59 = u_40_58,
    v_40_59 = v_40_58,
    g_0_low60_40_low20_19 * 2 = g_0_low60_40_low20_18,
    r_40_59 * 2 = r_40_58,
    s_40_59 * 2 = s_40_58
&&
    true
;

{
    u_40_59 * f_0_low60_40_low20_0 + v_40_59 * g_0_low60_40_low20_0 = f_0_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_59 * f_0_low60_40_low20_0 + s_40_59 * g_0_low60_40_low20_0 = g_0_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_19 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_19 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_19,
    f_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_19,
    g_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20)-1)),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_40_59 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_058_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_18,
sint64 g_0_low60_40_low20_18,
sint64 f_0_low60_40_low20_19,
sint64 g_0_low60_40_low20_19,
sint64 u_40_58,
sint64 v_40_58,
sint64 r_40_58,
sint64 s_40_58,
sint64 u_40_59,
sint64 v_40_59,
sint64 r_40_59,
sint64 s_40_59,
bit ne
)={
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (-(2**20)),
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (-(2**20))
&&
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (const 64 (-(2**20))),
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_18 + u_40_58 * (const 64 (2**21)) + v_40_58 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_18 + r_40_58 * (const 64 (2**21)) + s_40_58 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_18,
    f_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_18,
    g_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 58)) <=s delta, delta <=s (const 64 (1 + 2*58)),
    (const 64 (-(2**20))) <=s u_40_58, u_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_58, v_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_58, r_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_58, s_40_58 <=s (const 64 ((2**20)-1)),
    u_40_58 + v_40_58 <=s (const 64 (2**20)),
    u_40_58 - v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 + v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 - v_40_58 <=s (const 64 (2**20)),
    r_40_58 + s_40_58 <=s (const 64 (2**20)),
    r_40_58 - s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 + s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 - s_40_58 <=s (const 64 (2**20)),
    u_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_40_58 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise b
assume
g_0_low60_40_low20_18 = 1 (mod 2)
&&
g_0_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_19 f_0_low60_40_low20_18;
mov u_40_59 u_40_58;
mov v_40_59 v_40_58;

add g_0_low60_40_low20_19 g_0_low60_40_low20_18 f_0_low60_40_low20_18;
asr g_0_low60_40_low20_19 g_0_low60_40_low20_19 1;
add r_40_59 r_40_58 u_40_58;
asr r_40_59 r_40_59 1;
add s_40_59 s_40_58 v_40_58;
asr s_40_59 s_40_59 1;
assert
    true
&&
    f_0_low60_40_low20_19 = f_0_low60_40_low20_18,
    u_40_59 = u_40_58,
    v_40_59 = v_40_58,
    g_0_low60_40_low20_19 * (const 64 2) = g_0_low60_40_low20_18 + f_0_low60_40_low20_18,
    r_40_59 * (const 64 2) = r_40_58 + u_40_58,
    s_40_59 * (const 64 2) = s_40_58 + v_40_58
;

assume
    f_0_low60_40_low20_19 = f_0_low60_40_low20_18,
    u_40_59 = u_40_58,
    v_40_59 = v_40_58,
    g_0_low60_40_low20_19 * 2 = g_0_low60_40_low20_18 + f_0_low60_40_low20_18,
    r_40_59 * 2 = r_40_58 + u_40_58,
    s_40_59 * 2 = s_40_58 + v_40_58
&&
    true
;

{
    u_40_59 * f_0_low60_40_low20_0 + v_40_59 * g_0_low60_40_low20_0 = f_0_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_59 * f_0_low60_40_low20_0 + s_40_59 * g_0_low60_40_low20_0 = g_0_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_19 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_19 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_19,
    f_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_19,
    g_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20)-1)),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_40_59 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_058_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_18,
sint64 g_0_low60_40_low20_18,
sint64 f_0_low60_40_low20_19,
sint64 g_0_low60_40_low20_19,
sint64 u_40_58,
sint64 v_40_58,
sint64 r_40_58,
sint64 s_40_58,
sint64 u_40_59,
sint64 v_40_59,
sint64 r_40_59,
sint64 s_40_59,
bit ne
)={
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (-(2**20)),
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (-(2**20))
&&
    u_40_58 * f_0_low60_40_low20_0 + v_40_58 * g_0_low60_40_low20_0 = f_0_low60_40_low20_18 * (const 64 (-(2**20))),
    r_40_58 * f_0_low60_40_low20_0 + s_40_58 * g_0_low60_40_low20_0 = g_0_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_18 + u_40_58 * (const 64 (2**21)) + v_40_58 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_18 + r_40_58 * (const 64 (2**21)) + s_40_58 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_18,
    f_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_18,
    g_0_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 58)) <=s delta, delta <=s (const 64 (1 + 2*58)),
    (const 64 (-(2**20))) <=s u_40_58, u_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_58, v_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_58, r_40_58 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_58, s_40_58 <=s (const 64 ((2**20)-1)),
    u_40_58 + v_40_58 <=s (const 64 (2**20)),
    u_40_58 - v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 + v_40_58 <=s (const 64 (2**20)),
    (const 64 0) - u_40_58 - v_40_58 <=s (const 64 (2**20)),
    r_40_58 + s_40_58 <=s (const 64 (2**20)),
    r_40_58 - s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 + s_40_58 <=s (const 64 (2**20)),
    (const 64 0) - r_40_58 - s_40_58 <=s (const 64 (2**20)),
    u_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_40_58 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_40_58 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise c
assume
g_0_low60_40_low20_18 = 1 (mod 2)
&&
g_0_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_19 g_0_low60_40_low20_18;
mov u_40_59 r_40_58;
mov v_40_59 s_40_58;

subs dc g_0_low60_40_low20_19 g_0_low60_40_low20_18 f_0_low60_40_low20_18;
asr g_0_low60_40_low20_19 g_0_low60_40_low20_19 1;
subs dc r_40_59 r_40_58 u_40_58;
asr r_40_59 r_40_59 1;
subs dc s_40_59 s_40_58 v_40_58;
asr s_40_59 s_40_59 1;
assert
    true
&&
    f_0_low60_40_low20_19 = g_0_low60_40_low20_18,
    u_40_59 = r_40_58,
    v_40_59 = s_40_58,
    g_0_low60_40_low20_19 * (const 64 2) = g_0_low60_40_low20_18 - f_0_low60_40_low20_18,
    r_40_59 * (const 64 2) = r_40_58 - u_40_58,
    s_40_59 * (const 64 2) = s_40_58 - v_40_58
;

assume
    f_0_low60_40_low20_19 = g_0_low60_40_low20_18,
    u_40_59 = r_40_58,
    v_40_59 = s_40_58,
    g_0_low60_40_low20_19 * 2 = g_0_low60_40_low20_18 - f_0_low60_40_low20_18,
    r_40_59 * 2 = r_40_58 - u_40_58,
    s_40_59 * 2 = s_40_58 - v_40_58
&&
    true
;

{
    u_40_59 * f_0_low60_40_low20_0 + v_40_59 * g_0_low60_40_low20_0 = f_0_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_59 * f_0_low60_40_low20_0 + s_40_59 * g_0_low60_40_low20_0 = g_0_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_19 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_19 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_19,
    f_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_19,
    g_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20)-1)),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_40_59 = (const 64 0) (mod (const 64 (2**(20-19))))
}

