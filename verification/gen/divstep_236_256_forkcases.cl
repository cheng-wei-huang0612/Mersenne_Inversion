proc divstep_236_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_1,
sint64 g_236_low60_0_low20_1,
sint64 u_236_236,
sint64 v_236_236,
sint64 r_236_236,
sint64 s_236_236,
sint64 u_236_237,
sint64 v_236_237,
sint64 r_236_237,
sint64 s_236_237,
bit ne
)={
    u_236_236 * f_236_low60_0_low20_0 + v_236_236 * g_236_low60_0_low20_0 = f_236_low60_0_low20_0 * (-(2**20)),
    r_236_236 * f_236_low60_0_low20_0 + s_236_236 * g_236_low60_0_low20_0 = g_236_low60_0_low20_0 * (-(2**20))
&&
    u_236_236 * f_236_low60_0_low20_0 + v_236_236 * g_236_low60_0_low20_0 = f_236_low60_0_low20_0 * (const 64 (-(2**20))),
    r_236_236 * f_236_low60_0_low20_0 + s_236_236 * g_236_low60_0_low20_0 = g_236_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_0 + u_236_236 * (const 64 (2**21)) + v_236_236 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_0 + r_236_236 * (const 64 (2**21)) + s_236_236 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 236)) <=s delta, delta <=s (const 64 (1 + 2*236)),
    u_236_236 = (const 64 (-(2**20))),
    v_236_236 = (const 64 (0)),
    r_236_236 = (const 64 (0)),
    s_236_236 = (const 64 (-(2**20)))
}



// divsteps
// step236

// premise a
assume
g_236_low60_0_low20_0 = 0 (mod 2)
&&
g_236_low60_0_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_236_low60_0_low20_1 f_236_low60_0_low20_0;
mov u_236_237 u_236_236;
mov v_236_237 v_236_236;

asr g_236_low60_0_low20_1 g_236_low60_0_low20_0 1;
asr r_236_237 r_236_236 1;
asr s_236_237 s_236_236 1;
assert
    true
&&
    f_236_low60_0_low20_1 = f_236_low60_0_low20_0,
    u_236_237 = u_236_236,
    v_236_237 = v_236_236,
    g_236_low60_0_low20_1 * (const 64 2) = g_236_low60_0_low20_0,
    r_236_237 * (const 64 2) = r_236_236,
    s_236_237 * (const 64 2) = s_236_236
;

assume
    f_236_low60_0_low20_1 = f_236_low60_0_low20_0,
    u_236_237 = u_236_236,
    v_236_237 = v_236_236,
    g_236_low60_0_low20_1 * 2 = g_236_low60_0_low20_0,
    r_236_237 * 2 = r_236_236,
    s_236_237 * 2 = s_236_236
&&
    true
;

{
    u_236_237 * f_236_low60_0_low20_0 + v_236_237 * g_236_low60_0_low20_0 = f_236_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_237 * f_236_low60_0_low20_0 + s_236_237 * g_236_low60_0_low20_0 = g_236_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_1 + u_236_237 * (const 64 (2**21)) + v_236_237 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_1 + r_236_237 * (const 64 (2**21)) + s_236_237 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_1,
    f_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_1,
    g_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 237)) <=s delta, delta <=s (const 64 (1 + 2*237)),
    (const 64 (-(2**20))) <=s u_236_237, u_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_237, v_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_237, r_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_237, s_236_237 <=s (const 64 ((2**20))),
    u_236_237 + v_236_237 <=s (const 64 (2**20)),
    u_236_237 - v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 + v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 - v_236_237 <=s (const 64 (2**20)),
    r_236_237 + s_236_237 <=s (const 64 (2**20)),
    r_236_237 - s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 + s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 - s_236_237 <=s (const 64 (2**20)),
    u_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_236_237 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_236_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_1,
sint64 g_236_low60_0_low20_1,
sint64 u_236_236,
sint64 v_236_236,
sint64 r_236_236,
sint64 s_236_236,
sint64 u_236_237,
sint64 v_236_237,
sint64 r_236_237,
sint64 s_236_237,
bit ne
)={
    u_236_236 * f_236_low60_0_low20_0 + v_236_236 * g_236_low60_0_low20_0 = f_236_low60_0_low20_0 * (-(2**20)),
    r_236_236 * f_236_low60_0_low20_0 + s_236_236 * g_236_low60_0_low20_0 = g_236_low60_0_low20_0 * (-(2**20))
&&
    u_236_236 * f_236_low60_0_low20_0 + v_236_236 * g_236_low60_0_low20_0 = f_236_low60_0_low20_0 * (const 64 (-(2**20))),
    r_236_236 * f_236_low60_0_low20_0 + s_236_236 * g_236_low60_0_low20_0 = g_236_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_0 + u_236_236 * (const 64 (2**21)) + v_236_236 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_0 + r_236_236 * (const 64 (2**21)) + s_236_236 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 236)) <=s delta, delta <=s (const 64 (1 + 2*236)),
    u_236_236 = (const 64 (-(2**20))),
    v_236_236 = (const 64 (0)),
    r_236_236 = (const 64 (0)),
    s_236_236 = (const 64 (-(2**20)))
}



// divsteps
// step236

// premise b
assume
g_236_low60_0_low20_0 = 1 (mod 2)
&&
g_236_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_1 f_236_low60_0_low20_0;
mov u_236_237 u_236_236;
mov v_236_237 v_236_236;

add g_236_low60_0_low20_1 g_236_low60_0_low20_0 f_236_low60_0_low20_0;
asr g_236_low60_0_low20_1 g_236_low60_0_low20_1 1;
add r_236_237 r_236_236 u_236_236;
asr r_236_237 r_236_237 1;
add s_236_237 s_236_236 v_236_236;
asr s_236_237 s_236_237 1;
assert
    true
&&
    f_236_low60_0_low20_1 = f_236_low60_0_low20_0,
    u_236_237 = u_236_236,
    v_236_237 = v_236_236,
    g_236_low60_0_low20_1 * (const 64 2) = g_236_low60_0_low20_0 + f_236_low60_0_low20_0,
    r_236_237 * (const 64 2) = r_236_236 + u_236_236,
    s_236_237 * (const 64 2) = s_236_236 + v_236_236
;

assume
    f_236_low60_0_low20_1 = f_236_low60_0_low20_0,
    u_236_237 = u_236_236,
    v_236_237 = v_236_236,
    g_236_low60_0_low20_1 * 2 = g_236_low60_0_low20_0 + f_236_low60_0_low20_0,
    r_236_237 * 2 = r_236_236 + u_236_236,
    s_236_237 * 2 = s_236_236 + v_236_236
&&
    true
;

{
    u_236_237 * f_236_low60_0_low20_0 + v_236_237 * g_236_low60_0_low20_0 = f_236_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_237 * f_236_low60_0_low20_0 + s_236_237 * g_236_low60_0_low20_0 = g_236_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_1 + u_236_237 * (const 64 (2**21)) + v_236_237 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_1 + r_236_237 * (const 64 (2**21)) + s_236_237 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_1,
    f_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_1,
    g_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 237)) <=s delta, delta <=s (const 64 (1 + 2*237)),
    (const 64 (-(2**20))) <=s u_236_237, u_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_237, v_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_237, r_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_237, s_236_237 <=s (const 64 ((2**20))),
    u_236_237 + v_236_237 <=s (const 64 (2**20)),
    u_236_237 - v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 + v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 - v_236_237 <=s (const 64 (2**20)),
    r_236_237 + s_236_237 <=s (const 64 (2**20)),
    r_236_237 - s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 + s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 - s_236_237 <=s (const 64 (2**20)),
    u_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_236_237 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_236_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_1,
sint64 g_236_low60_0_low20_1,
sint64 u_236_236,
sint64 v_236_236,
sint64 r_236_236,
sint64 s_236_236,
sint64 u_236_237,
sint64 v_236_237,
sint64 r_236_237,
sint64 s_236_237,
bit ne
)={
    u_236_236 * f_236_low60_0_low20_0 + v_236_236 * g_236_low60_0_low20_0 = f_236_low60_0_low20_0 * (-(2**20)),
    r_236_236 * f_236_low60_0_low20_0 + s_236_236 * g_236_low60_0_low20_0 = g_236_low60_0_low20_0 * (-(2**20))
&&
    u_236_236 * f_236_low60_0_low20_0 + v_236_236 * g_236_low60_0_low20_0 = f_236_low60_0_low20_0 * (const 64 (-(2**20))),
    r_236_236 * f_236_low60_0_low20_0 + s_236_236 * g_236_low60_0_low20_0 = g_236_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_0 + u_236_236 * (const 64 (2**21)) + v_236_236 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_0 + r_236_236 * (const 64 (2**21)) + s_236_236 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 236)) <=s delta, delta <=s (const 64 (1 + 2*236)),
    u_236_236 = (const 64 (-(2**20))),
    v_236_236 = (const 64 (0)),
    r_236_236 = (const 64 (0)),
    s_236_236 = (const 64 (-(2**20)))
}



// divsteps
// step236

// premise c
assume
g_236_low60_0_low20_0 = 1 (mod 2)
&&
g_236_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_1 g_236_low60_0_low20_0;
mov u_236_237 r_236_236;
mov v_236_237 s_236_236;

subs dc g_236_low60_0_low20_1 g_236_low60_0_low20_0 f_236_low60_0_low20_0;
asr g_236_low60_0_low20_1 g_236_low60_0_low20_1 1;
subs dc r_236_237 r_236_236 u_236_236;
asr r_236_237 r_236_237 1;
subs dc s_236_237 s_236_236 v_236_236;
asr s_236_237 s_236_237 1;
assert
    true
&&
    f_236_low60_0_low20_1 = g_236_low60_0_low20_0,
    u_236_237 = r_236_236,
    v_236_237 = s_236_236,
    g_236_low60_0_low20_1 * (const 64 2) = g_236_low60_0_low20_0 - f_236_low60_0_low20_0,
    r_236_237 * (const 64 2) = r_236_236 - u_236_236,
    s_236_237 * (const 64 2) = s_236_236 - v_236_236
;

assume
    f_236_low60_0_low20_1 = g_236_low60_0_low20_0,
    u_236_237 = r_236_236,
    v_236_237 = s_236_236,
    g_236_low60_0_low20_1 * 2 = g_236_low60_0_low20_0 - f_236_low60_0_low20_0,
    r_236_237 * 2 = r_236_236 - u_236_236,
    s_236_237 * 2 = s_236_236 - v_236_236
&&
    true
;

{
    u_236_237 * f_236_low60_0_low20_0 + v_236_237 * g_236_low60_0_low20_0 = f_236_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_237 * f_236_low60_0_low20_0 + s_236_237 * g_236_low60_0_low20_0 = g_236_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_1 + u_236_237 * (const 64 (2**21)) + v_236_237 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_1 + r_236_237 * (const 64 (2**21)) + s_236_237 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_1,
    f_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_1,
    g_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 237)) <=s delta, delta <=s (const 64 (1 + 2*237)),
    (const 64 (-(2**20))) <=s u_236_237, u_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_237, v_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_237, r_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_237, s_236_237 <=s (const 64 ((2**20))),
    u_236_237 + v_236_237 <=s (const 64 (2**20)),
    u_236_237 - v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 + v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 - v_236_237 <=s (const 64 (2**20)),
    r_236_237 + s_236_237 <=s (const 64 (2**20)),
    r_236_237 - s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 + s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 - s_236_237 <=s (const 64 (2**20)),
    u_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_236_237 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_237_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_1,
sint64 g_236_low60_0_low20_1,
sint64 f_236_low60_0_low20_2,
sint64 g_236_low60_0_low20_2,
sint64 u_236_237,
sint64 v_236_237,
sint64 r_236_237,
sint64 s_236_237,
sint64 u_236_238,
sint64 v_236_238,
sint64 r_236_238,
sint64 s_236_238,
bit ne
)={
    u_236_237 * f_236_low60_0_low20_0 + v_236_237 * g_236_low60_0_low20_0 = f_236_low60_0_low20_1 * (-(2**20)),
    r_236_237 * f_236_low60_0_low20_0 + s_236_237 * g_236_low60_0_low20_0 = g_236_low60_0_low20_1 * (-(2**20))
&&
    u_236_237 * f_236_low60_0_low20_0 + v_236_237 * g_236_low60_0_low20_0 = f_236_low60_0_low20_1 * (const 64 (-(2**20))),
    r_236_237 * f_236_low60_0_low20_0 + s_236_237 * g_236_low60_0_low20_0 = g_236_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_1 + u_236_237 * (const 64 (2**21)) + v_236_237 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_1 + r_236_237 * (const 64 (2**21)) + s_236_237 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_1,
    f_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_1,
    g_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 237)) <=s delta, delta <=s (const 64 (1 + 2*237)),
    (const 64 (-(2**20))) <=s u_236_237, u_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_237, v_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_237, r_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_237, s_236_237 <=s (const 64 ((2**20))),
    u_236_237 + v_236_237 <=s (const 64 (2**20)),
    u_236_237 - v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 + v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 - v_236_237 <=s (const 64 (2**20)),
    r_236_237 + s_236_237 <=s (const 64 (2**20)),
    r_236_237 - s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 + s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 - s_236_237 <=s (const 64 (2**20)),
    u_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_236_237 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step237

// premise a
assume
g_236_low60_0_low20_1 = 0 (mod 2)
&&
g_236_low60_0_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_2 f_236_low60_0_low20_1;
mov u_236_238 u_236_237;
mov v_236_238 v_236_237;

asr g_236_low60_0_low20_2 g_236_low60_0_low20_1 1;
asr r_236_238 r_236_237 1;
asr s_236_238 s_236_237 1;
assert
    true
&&
    f_236_low60_0_low20_2 = f_236_low60_0_low20_1,
    u_236_238 = u_236_237,
    v_236_238 = v_236_237,
    g_236_low60_0_low20_2 * (const 64 2) = g_236_low60_0_low20_1,
    r_236_238 * (const 64 2) = r_236_237,
    s_236_238 * (const 64 2) = s_236_237
;

assume
    f_236_low60_0_low20_2 = f_236_low60_0_low20_1,
    u_236_238 = u_236_237,
    v_236_238 = v_236_237,
    g_236_low60_0_low20_2 * 2 = g_236_low60_0_low20_1,
    r_236_238 * 2 = r_236_237,
    s_236_238 * 2 = s_236_237
&&
    true
;

{
    u_236_238 * f_236_low60_0_low20_0 + v_236_238 * g_236_low60_0_low20_0 = f_236_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_238 * f_236_low60_0_low20_0 + s_236_238 * g_236_low60_0_low20_0 = g_236_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_2 + u_236_238 * (const 64 (2**21)) + v_236_238 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_2 + r_236_238 * (const 64 (2**21)) + s_236_238 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_2,
    f_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_2,
    g_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 238)) <=s delta, delta <=s (const 64 (1 + 2*238)),
    (const 64 (-(2**20))) <=s u_236_238, u_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_238, v_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_238, r_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_238, s_236_238 <=s (const 64 ((2**20))),
    u_236_238 + v_236_238 <=s (const 64 (2**20)),
    u_236_238 - v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 + v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 - v_236_238 <=s (const 64 (2**20)),
    r_236_238 + s_236_238 <=s (const 64 (2**20)),
    r_236_238 - s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 + s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 - s_236_238 <=s (const 64 (2**20)),
    u_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_236_238 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_237_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_1,
sint64 g_236_low60_0_low20_1,
sint64 f_236_low60_0_low20_2,
sint64 g_236_low60_0_low20_2,
sint64 u_236_237,
sint64 v_236_237,
sint64 r_236_237,
sint64 s_236_237,
sint64 u_236_238,
sint64 v_236_238,
sint64 r_236_238,
sint64 s_236_238,
bit ne
)={
    u_236_237 * f_236_low60_0_low20_0 + v_236_237 * g_236_low60_0_low20_0 = f_236_low60_0_low20_1 * (-(2**20)),
    r_236_237 * f_236_low60_0_low20_0 + s_236_237 * g_236_low60_0_low20_0 = g_236_low60_0_low20_1 * (-(2**20))
&&
    u_236_237 * f_236_low60_0_low20_0 + v_236_237 * g_236_low60_0_low20_0 = f_236_low60_0_low20_1 * (const 64 (-(2**20))),
    r_236_237 * f_236_low60_0_low20_0 + s_236_237 * g_236_low60_0_low20_0 = g_236_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_1 + u_236_237 * (const 64 (2**21)) + v_236_237 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_1 + r_236_237 * (const 64 (2**21)) + s_236_237 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_1,
    f_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_1,
    g_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 237)) <=s delta, delta <=s (const 64 (1 + 2*237)),
    (const 64 (-(2**20))) <=s u_236_237, u_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_237, v_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_237, r_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_237, s_236_237 <=s (const 64 ((2**20))),
    u_236_237 + v_236_237 <=s (const 64 (2**20)),
    u_236_237 - v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 + v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 - v_236_237 <=s (const 64 (2**20)),
    r_236_237 + s_236_237 <=s (const 64 (2**20)),
    r_236_237 - s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 + s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 - s_236_237 <=s (const 64 (2**20)),
    u_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_236_237 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step237

// premise b
assume
g_236_low60_0_low20_1 = 1 (mod 2)
&&
g_236_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_2 f_236_low60_0_low20_1;
mov u_236_238 u_236_237;
mov v_236_238 v_236_237;

add g_236_low60_0_low20_2 g_236_low60_0_low20_1 f_236_low60_0_low20_1;
asr g_236_low60_0_low20_2 g_236_low60_0_low20_2 1;
add r_236_238 r_236_237 u_236_237;
asr r_236_238 r_236_238 1;
add s_236_238 s_236_237 v_236_237;
asr s_236_238 s_236_238 1;
assert
    true
&&
    f_236_low60_0_low20_2 = f_236_low60_0_low20_1,
    u_236_238 = u_236_237,
    v_236_238 = v_236_237,
    g_236_low60_0_low20_2 * (const 64 2) = g_236_low60_0_low20_1 + f_236_low60_0_low20_1,
    r_236_238 * (const 64 2) = r_236_237 + u_236_237,
    s_236_238 * (const 64 2) = s_236_237 + v_236_237
;

assume
    f_236_low60_0_low20_2 = f_236_low60_0_low20_1,
    u_236_238 = u_236_237,
    v_236_238 = v_236_237,
    g_236_low60_0_low20_2 * 2 = g_236_low60_0_low20_1 + f_236_low60_0_low20_1,
    r_236_238 * 2 = r_236_237 + u_236_237,
    s_236_238 * 2 = s_236_237 + v_236_237
&&
    true
;

{
    u_236_238 * f_236_low60_0_low20_0 + v_236_238 * g_236_low60_0_low20_0 = f_236_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_238 * f_236_low60_0_low20_0 + s_236_238 * g_236_low60_0_low20_0 = g_236_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_2 + u_236_238 * (const 64 (2**21)) + v_236_238 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_2 + r_236_238 * (const 64 (2**21)) + s_236_238 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_2,
    f_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_2,
    g_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 238)) <=s delta, delta <=s (const 64 (1 + 2*238)),
    (const 64 (-(2**20))) <=s u_236_238, u_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_238, v_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_238, r_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_238, s_236_238 <=s (const 64 ((2**20))),
    u_236_238 + v_236_238 <=s (const 64 (2**20)),
    u_236_238 - v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 + v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 - v_236_238 <=s (const 64 (2**20)),
    r_236_238 + s_236_238 <=s (const 64 (2**20)),
    r_236_238 - s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 + s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 - s_236_238 <=s (const 64 (2**20)),
    u_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_236_238 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_237_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_1,
sint64 g_236_low60_0_low20_1,
sint64 f_236_low60_0_low20_2,
sint64 g_236_low60_0_low20_2,
sint64 u_236_237,
sint64 v_236_237,
sint64 r_236_237,
sint64 s_236_237,
sint64 u_236_238,
sint64 v_236_238,
sint64 r_236_238,
sint64 s_236_238,
bit ne
)={
    u_236_237 * f_236_low60_0_low20_0 + v_236_237 * g_236_low60_0_low20_0 = f_236_low60_0_low20_1 * (-(2**20)),
    r_236_237 * f_236_low60_0_low20_0 + s_236_237 * g_236_low60_0_low20_0 = g_236_low60_0_low20_1 * (-(2**20))
&&
    u_236_237 * f_236_low60_0_low20_0 + v_236_237 * g_236_low60_0_low20_0 = f_236_low60_0_low20_1 * (const 64 (-(2**20))),
    r_236_237 * f_236_low60_0_low20_0 + s_236_237 * g_236_low60_0_low20_0 = g_236_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_1 + u_236_237 * (const 64 (2**21)) + v_236_237 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_1 + r_236_237 * (const 64 (2**21)) + s_236_237 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_1,
    f_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_1,
    g_236_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 237)) <=s delta, delta <=s (const 64 (1 + 2*237)),
    (const 64 (-(2**20))) <=s u_236_237, u_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_237, v_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_237, r_236_237 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_237, s_236_237 <=s (const 64 ((2**20))),
    u_236_237 + v_236_237 <=s (const 64 (2**20)),
    u_236_237 - v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 + v_236_237 <=s (const 64 (2**20)),
    (const 64 0) - u_236_237 - v_236_237 <=s (const 64 (2**20)),
    r_236_237 + s_236_237 <=s (const 64 (2**20)),
    r_236_237 - s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 + s_236_237 <=s (const 64 (2**20)),
    (const 64 0) - r_236_237 - s_236_237 <=s (const 64 (2**20)),
    u_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_236_237 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_236_237 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step237

// premise c
assume
g_236_low60_0_low20_1 = 1 (mod 2)
&&
g_236_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_2 g_236_low60_0_low20_1;
mov u_236_238 r_236_237;
mov v_236_238 s_236_237;

subs dc g_236_low60_0_low20_2 g_236_low60_0_low20_1 f_236_low60_0_low20_1;
asr g_236_low60_0_low20_2 g_236_low60_0_low20_2 1;
subs dc r_236_238 r_236_237 u_236_237;
asr r_236_238 r_236_238 1;
subs dc s_236_238 s_236_237 v_236_237;
asr s_236_238 s_236_238 1;
assert
    true
&&
    f_236_low60_0_low20_2 = g_236_low60_0_low20_1,
    u_236_238 = r_236_237,
    v_236_238 = s_236_237,
    g_236_low60_0_low20_2 * (const 64 2) = g_236_low60_0_low20_1 - f_236_low60_0_low20_1,
    r_236_238 * (const 64 2) = r_236_237 - u_236_237,
    s_236_238 * (const 64 2) = s_236_237 - v_236_237
;

assume
    f_236_low60_0_low20_2 = g_236_low60_0_low20_1,
    u_236_238 = r_236_237,
    v_236_238 = s_236_237,
    g_236_low60_0_low20_2 * 2 = g_236_low60_0_low20_1 - f_236_low60_0_low20_1,
    r_236_238 * 2 = r_236_237 - u_236_237,
    s_236_238 * 2 = s_236_237 - v_236_237
&&
    true
;

{
    u_236_238 * f_236_low60_0_low20_0 + v_236_238 * g_236_low60_0_low20_0 = f_236_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_238 * f_236_low60_0_low20_0 + s_236_238 * g_236_low60_0_low20_0 = g_236_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_2 + u_236_238 * (const 64 (2**21)) + v_236_238 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_2 + r_236_238 * (const 64 (2**21)) + s_236_238 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_2,
    f_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_2,
    g_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 238)) <=s delta, delta <=s (const 64 (1 + 2*238)),
    (const 64 (-(2**20))) <=s u_236_238, u_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_238, v_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_238, r_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_238, s_236_238 <=s (const 64 ((2**20))),
    u_236_238 + v_236_238 <=s (const 64 (2**20)),
    u_236_238 - v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 + v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 - v_236_238 <=s (const 64 (2**20)),
    r_236_238 + s_236_238 <=s (const 64 (2**20)),
    r_236_238 - s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 + s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 - s_236_238 <=s (const 64 (2**20)),
    u_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_236_238 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_238_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_2,
sint64 g_236_low60_0_low20_2,
sint64 f_236_low60_0_low20_3,
sint64 g_236_low60_0_low20_3,
sint64 u_236_238,
sint64 v_236_238,
sint64 r_236_238,
sint64 s_236_238,
sint64 u_236_239,
sint64 v_236_239,
sint64 r_236_239,
sint64 s_236_239,
bit ne
)={
    u_236_238 * f_236_low60_0_low20_0 + v_236_238 * g_236_low60_0_low20_0 = f_236_low60_0_low20_2 * (-(2**20)),
    r_236_238 * f_236_low60_0_low20_0 + s_236_238 * g_236_low60_0_low20_0 = g_236_low60_0_low20_2 * (-(2**20))
&&
    u_236_238 * f_236_low60_0_low20_0 + v_236_238 * g_236_low60_0_low20_0 = f_236_low60_0_low20_2 * (const 64 (-(2**20))),
    r_236_238 * f_236_low60_0_low20_0 + s_236_238 * g_236_low60_0_low20_0 = g_236_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_2 + u_236_238 * (const 64 (2**21)) + v_236_238 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_2 + r_236_238 * (const 64 (2**21)) + s_236_238 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_2,
    f_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_2,
    g_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 238)) <=s delta, delta <=s (const 64 (1 + 2*238)),
    (const 64 (-(2**20))) <=s u_236_238, u_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_238, v_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_238, r_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_238, s_236_238 <=s (const 64 ((2**20))),
    u_236_238 + v_236_238 <=s (const 64 (2**20)),
    u_236_238 - v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 + v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 - v_236_238 <=s (const 64 (2**20)),
    r_236_238 + s_236_238 <=s (const 64 (2**20)),
    r_236_238 - s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 + s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 - s_236_238 <=s (const 64 (2**20)),
    u_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_236_238 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step238

// premise a
assume
g_236_low60_0_low20_2 = 0 (mod 2)
&&
g_236_low60_0_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_3 f_236_low60_0_low20_2;
mov u_236_239 u_236_238;
mov v_236_239 v_236_238;

asr g_236_low60_0_low20_3 g_236_low60_0_low20_2 1;
asr r_236_239 r_236_238 1;
asr s_236_239 s_236_238 1;
assert
    true
&&
    f_236_low60_0_low20_3 = f_236_low60_0_low20_2,
    u_236_239 = u_236_238,
    v_236_239 = v_236_238,
    g_236_low60_0_low20_3 * (const 64 2) = g_236_low60_0_low20_2,
    r_236_239 * (const 64 2) = r_236_238,
    s_236_239 * (const 64 2) = s_236_238
;

assume
    f_236_low60_0_low20_3 = f_236_low60_0_low20_2,
    u_236_239 = u_236_238,
    v_236_239 = v_236_238,
    g_236_low60_0_low20_3 * 2 = g_236_low60_0_low20_2,
    r_236_239 * 2 = r_236_238,
    s_236_239 * 2 = s_236_238
&&
    true
;

{
    u_236_239 * f_236_low60_0_low20_0 + v_236_239 * g_236_low60_0_low20_0 = f_236_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_239 * f_236_low60_0_low20_0 + s_236_239 * g_236_low60_0_low20_0 = g_236_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_3 + u_236_239 * (const 64 (2**21)) + v_236_239 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_3 + r_236_239 * (const 64 (2**21)) + s_236_239 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_3,
    f_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_3,
    g_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 239)) <=s delta, delta <=s (const 64 (1 + 2*239)),
    (const 64 (-(2**20))) <=s u_236_239, u_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_239, v_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_239, r_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_239, s_236_239 <=s (const 64 ((2**20))),
    u_236_239 + v_236_239 <=s (const 64 (2**20)),
    u_236_239 - v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 + v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 - v_236_239 <=s (const 64 (2**20)),
    r_236_239 + s_236_239 <=s (const 64 (2**20)),
    r_236_239 - s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 + s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 - s_236_239 <=s (const 64 (2**20)),
    u_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_236_239 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_238_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_2,
sint64 g_236_low60_0_low20_2,
sint64 f_236_low60_0_low20_3,
sint64 g_236_low60_0_low20_3,
sint64 u_236_238,
sint64 v_236_238,
sint64 r_236_238,
sint64 s_236_238,
sint64 u_236_239,
sint64 v_236_239,
sint64 r_236_239,
sint64 s_236_239,
bit ne
)={
    u_236_238 * f_236_low60_0_low20_0 + v_236_238 * g_236_low60_0_low20_0 = f_236_low60_0_low20_2 * (-(2**20)),
    r_236_238 * f_236_low60_0_low20_0 + s_236_238 * g_236_low60_0_low20_0 = g_236_low60_0_low20_2 * (-(2**20))
&&
    u_236_238 * f_236_low60_0_low20_0 + v_236_238 * g_236_low60_0_low20_0 = f_236_low60_0_low20_2 * (const 64 (-(2**20))),
    r_236_238 * f_236_low60_0_low20_0 + s_236_238 * g_236_low60_0_low20_0 = g_236_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_2 + u_236_238 * (const 64 (2**21)) + v_236_238 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_2 + r_236_238 * (const 64 (2**21)) + s_236_238 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_2,
    f_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_2,
    g_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 238)) <=s delta, delta <=s (const 64 (1 + 2*238)),
    (const 64 (-(2**20))) <=s u_236_238, u_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_238, v_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_238, r_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_238, s_236_238 <=s (const 64 ((2**20))),
    u_236_238 + v_236_238 <=s (const 64 (2**20)),
    u_236_238 - v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 + v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 - v_236_238 <=s (const 64 (2**20)),
    r_236_238 + s_236_238 <=s (const 64 (2**20)),
    r_236_238 - s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 + s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 - s_236_238 <=s (const 64 (2**20)),
    u_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_236_238 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step238

// premise b
assume
g_236_low60_0_low20_2 = 1 (mod 2)
&&
g_236_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_3 f_236_low60_0_low20_2;
mov u_236_239 u_236_238;
mov v_236_239 v_236_238;

add g_236_low60_0_low20_3 g_236_low60_0_low20_2 f_236_low60_0_low20_2;
asr g_236_low60_0_low20_3 g_236_low60_0_low20_3 1;
add r_236_239 r_236_238 u_236_238;
asr r_236_239 r_236_239 1;
add s_236_239 s_236_238 v_236_238;
asr s_236_239 s_236_239 1;
assert
    true
&&
    f_236_low60_0_low20_3 = f_236_low60_0_low20_2,
    u_236_239 = u_236_238,
    v_236_239 = v_236_238,
    g_236_low60_0_low20_3 * (const 64 2) = g_236_low60_0_low20_2 + f_236_low60_0_low20_2,
    r_236_239 * (const 64 2) = r_236_238 + u_236_238,
    s_236_239 * (const 64 2) = s_236_238 + v_236_238
;

assume
    f_236_low60_0_low20_3 = f_236_low60_0_low20_2,
    u_236_239 = u_236_238,
    v_236_239 = v_236_238,
    g_236_low60_0_low20_3 * 2 = g_236_low60_0_low20_2 + f_236_low60_0_low20_2,
    r_236_239 * 2 = r_236_238 + u_236_238,
    s_236_239 * 2 = s_236_238 + v_236_238
&&
    true
;

{
    u_236_239 * f_236_low60_0_low20_0 + v_236_239 * g_236_low60_0_low20_0 = f_236_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_239 * f_236_low60_0_low20_0 + s_236_239 * g_236_low60_0_low20_0 = g_236_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_3 + u_236_239 * (const 64 (2**21)) + v_236_239 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_3 + r_236_239 * (const 64 (2**21)) + s_236_239 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_3,
    f_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_3,
    g_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 239)) <=s delta, delta <=s (const 64 (1 + 2*239)),
    (const 64 (-(2**20))) <=s u_236_239, u_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_239, v_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_239, r_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_239, s_236_239 <=s (const 64 ((2**20))),
    u_236_239 + v_236_239 <=s (const 64 (2**20)),
    u_236_239 - v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 + v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 - v_236_239 <=s (const 64 (2**20)),
    r_236_239 + s_236_239 <=s (const 64 (2**20)),
    r_236_239 - s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 + s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 - s_236_239 <=s (const 64 (2**20)),
    u_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_236_239 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_238_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_2,
sint64 g_236_low60_0_low20_2,
sint64 f_236_low60_0_low20_3,
sint64 g_236_low60_0_low20_3,
sint64 u_236_238,
sint64 v_236_238,
sint64 r_236_238,
sint64 s_236_238,
sint64 u_236_239,
sint64 v_236_239,
sint64 r_236_239,
sint64 s_236_239,
bit ne
)={
    u_236_238 * f_236_low60_0_low20_0 + v_236_238 * g_236_low60_0_low20_0 = f_236_low60_0_low20_2 * (-(2**20)),
    r_236_238 * f_236_low60_0_low20_0 + s_236_238 * g_236_low60_0_low20_0 = g_236_low60_0_low20_2 * (-(2**20))
&&
    u_236_238 * f_236_low60_0_low20_0 + v_236_238 * g_236_low60_0_low20_0 = f_236_low60_0_low20_2 * (const 64 (-(2**20))),
    r_236_238 * f_236_low60_0_low20_0 + s_236_238 * g_236_low60_0_low20_0 = g_236_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_2 + u_236_238 * (const 64 (2**21)) + v_236_238 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_2 + r_236_238 * (const 64 (2**21)) + s_236_238 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_2,
    f_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_2,
    g_236_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 238)) <=s delta, delta <=s (const 64 (1 + 2*238)),
    (const 64 (-(2**20))) <=s u_236_238, u_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_238, v_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_238, r_236_238 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_238, s_236_238 <=s (const 64 ((2**20))),
    u_236_238 + v_236_238 <=s (const 64 (2**20)),
    u_236_238 - v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 + v_236_238 <=s (const 64 (2**20)),
    (const 64 0) - u_236_238 - v_236_238 <=s (const 64 (2**20)),
    r_236_238 + s_236_238 <=s (const 64 (2**20)),
    r_236_238 - s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 + s_236_238 <=s (const 64 (2**20)),
    (const 64 0) - r_236_238 - s_236_238 <=s (const 64 (2**20)),
    u_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_236_238 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_236_238 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step238

// premise c
assume
g_236_low60_0_low20_2 = 1 (mod 2)
&&
g_236_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_3 g_236_low60_0_low20_2;
mov u_236_239 r_236_238;
mov v_236_239 s_236_238;

subs dc g_236_low60_0_low20_3 g_236_low60_0_low20_2 f_236_low60_0_low20_2;
asr g_236_low60_0_low20_3 g_236_low60_0_low20_3 1;
subs dc r_236_239 r_236_238 u_236_238;
asr r_236_239 r_236_239 1;
subs dc s_236_239 s_236_238 v_236_238;
asr s_236_239 s_236_239 1;
assert
    true
&&
    f_236_low60_0_low20_3 = g_236_low60_0_low20_2,
    u_236_239 = r_236_238,
    v_236_239 = s_236_238,
    g_236_low60_0_low20_3 * (const 64 2) = g_236_low60_0_low20_2 - f_236_low60_0_low20_2,
    r_236_239 * (const 64 2) = r_236_238 - u_236_238,
    s_236_239 * (const 64 2) = s_236_238 - v_236_238
;

assume
    f_236_low60_0_low20_3 = g_236_low60_0_low20_2,
    u_236_239 = r_236_238,
    v_236_239 = s_236_238,
    g_236_low60_0_low20_3 * 2 = g_236_low60_0_low20_2 - f_236_low60_0_low20_2,
    r_236_239 * 2 = r_236_238 - u_236_238,
    s_236_239 * 2 = s_236_238 - v_236_238
&&
    true
;

{
    u_236_239 * f_236_low60_0_low20_0 + v_236_239 * g_236_low60_0_low20_0 = f_236_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_239 * f_236_low60_0_low20_0 + s_236_239 * g_236_low60_0_low20_0 = g_236_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_3 + u_236_239 * (const 64 (2**21)) + v_236_239 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_3 + r_236_239 * (const 64 (2**21)) + s_236_239 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_3,
    f_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_3,
    g_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 239)) <=s delta, delta <=s (const 64 (1 + 2*239)),
    (const 64 (-(2**20))) <=s u_236_239, u_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_239, v_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_239, r_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_239, s_236_239 <=s (const 64 ((2**20))),
    u_236_239 + v_236_239 <=s (const 64 (2**20)),
    u_236_239 - v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 + v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 - v_236_239 <=s (const 64 (2**20)),
    r_236_239 + s_236_239 <=s (const 64 (2**20)),
    r_236_239 - s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 + s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 - s_236_239 <=s (const 64 (2**20)),
    u_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_236_239 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_239_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_3,
sint64 g_236_low60_0_low20_3,
sint64 f_236_low60_0_low20_4,
sint64 g_236_low60_0_low20_4,
sint64 u_236_239,
sint64 v_236_239,
sint64 r_236_239,
sint64 s_236_239,
sint64 u_236_240,
sint64 v_236_240,
sint64 r_236_240,
sint64 s_236_240,
bit ne
)={
    u_236_239 * f_236_low60_0_low20_0 + v_236_239 * g_236_low60_0_low20_0 = f_236_low60_0_low20_3 * (-(2**20)),
    r_236_239 * f_236_low60_0_low20_0 + s_236_239 * g_236_low60_0_low20_0 = g_236_low60_0_low20_3 * (-(2**20))
&&
    u_236_239 * f_236_low60_0_low20_0 + v_236_239 * g_236_low60_0_low20_0 = f_236_low60_0_low20_3 * (const 64 (-(2**20))),
    r_236_239 * f_236_low60_0_low20_0 + s_236_239 * g_236_low60_0_low20_0 = g_236_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_3 + u_236_239 * (const 64 (2**21)) + v_236_239 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_3 + r_236_239 * (const 64 (2**21)) + s_236_239 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_3,
    f_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_3,
    g_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 239)) <=s delta, delta <=s (const 64 (1 + 2*239)),
    (const 64 (-(2**20))) <=s u_236_239, u_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_239, v_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_239, r_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_239, s_236_239 <=s (const 64 ((2**20))),
    u_236_239 + v_236_239 <=s (const 64 (2**20)),
    u_236_239 - v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 + v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 - v_236_239 <=s (const 64 (2**20)),
    r_236_239 + s_236_239 <=s (const 64 (2**20)),
    r_236_239 - s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 + s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 - s_236_239 <=s (const 64 (2**20)),
    u_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_236_239 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step239

// premise a
assume
g_236_low60_0_low20_3 = 0 (mod 2)
&&
g_236_low60_0_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_4 f_236_low60_0_low20_3;
mov u_236_240 u_236_239;
mov v_236_240 v_236_239;

asr g_236_low60_0_low20_4 g_236_low60_0_low20_3 1;
asr r_236_240 r_236_239 1;
asr s_236_240 s_236_239 1;
assert
    true
&&
    f_236_low60_0_low20_4 = f_236_low60_0_low20_3,
    u_236_240 = u_236_239,
    v_236_240 = v_236_239,
    g_236_low60_0_low20_4 * (const 64 2) = g_236_low60_0_low20_3,
    r_236_240 * (const 64 2) = r_236_239,
    s_236_240 * (const 64 2) = s_236_239
;

assume
    f_236_low60_0_low20_4 = f_236_low60_0_low20_3,
    u_236_240 = u_236_239,
    v_236_240 = v_236_239,
    g_236_low60_0_low20_4 * 2 = g_236_low60_0_low20_3,
    r_236_240 * 2 = r_236_239,
    s_236_240 * 2 = s_236_239
&&
    true
;

{
    u_236_240 * f_236_low60_0_low20_0 + v_236_240 * g_236_low60_0_low20_0 = f_236_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_240 * f_236_low60_0_low20_0 + s_236_240 * g_236_low60_0_low20_0 = g_236_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_4 + u_236_240 * (const 64 (2**21)) + v_236_240 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_4 + r_236_240 * (const 64 (2**21)) + s_236_240 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_4,
    f_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_4,
    g_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 240)) <=s delta, delta <=s (const 64 (1 + 2*240)),
    (const 64 (-(2**20))) <=s u_236_240, u_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_240, v_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_240, r_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_240, s_236_240 <=s (const 64 ((2**20))),
    u_236_240 + v_236_240 <=s (const 64 (2**20)),
    u_236_240 - v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 + v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 - v_236_240 <=s (const 64 (2**20)),
    r_236_240 + s_236_240 <=s (const 64 (2**20)),
    r_236_240 - s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 + s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 - s_236_240 <=s (const 64 (2**20)),
    u_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_236_240 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_239_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_3,
sint64 g_236_low60_0_low20_3,
sint64 f_236_low60_0_low20_4,
sint64 g_236_low60_0_low20_4,
sint64 u_236_239,
sint64 v_236_239,
sint64 r_236_239,
sint64 s_236_239,
sint64 u_236_240,
sint64 v_236_240,
sint64 r_236_240,
sint64 s_236_240,
bit ne
)={
    u_236_239 * f_236_low60_0_low20_0 + v_236_239 * g_236_low60_0_low20_0 = f_236_low60_0_low20_3 * (-(2**20)),
    r_236_239 * f_236_low60_0_low20_0 + s_236_239 * g_236_low60_0_low20_0 = g_236_low60_0_low20_3 * (-(2**20))
&&
    u_236_239 * f_236_low60_0_low20_0 + v_236_239 * g_236_low60_0_low20_0 = f_236_low60_0_low20_3 * (const 64 (-(2**20))),
    r_236_239 * f_236_low60_0_low20_0 + s_236_239 * g_236_low60_0_low20_0 = g_236_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_3 + u_236_239 * (const 64 (2**21)) + v_236_239 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_3 + r_236_239 * (const 64 (2**21)) + s_236_239 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_3,
    f_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_3,
    g_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 239)) <=s delta, delta <=s (const 64 (1 + 2*239)),
    (const 64 (-(2**20))) <=s u_236_239, u_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_239, v_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_239, r_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_239, s_236_239 <=s (const 64 ((2**20))),
    u_236_239 + v_236_239 <=s (const 64 (2**20)),
    u_236_239 - v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 + v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 - v_236_239 <=s (const 64 (2**20)),
    r_236_239 + s_236_239 <=s (const 64 (2**20)),
    r_236_239 - s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 + s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 - s_236_239 <=s (const 64 (2**20)),
    u_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_236_239 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step239

// premise b
assume
g_236_low60_0_low20_3 = 1 (mod 2)
&&
g_236_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_4 f_236_low60_0_low20_3;
mov u_236_240 u_236_239;
mov v_236_240 v_236_239;

add g_236_low60_0_low20_4 g_236_low60_0_low20_3 f_236_low60_0_low20_3;
asr g_236_low60_0_low20_4 g_236_low60_0_low20_4 1;
add r_236_240 r_236_239 u_236_239;
asr r_236_240 r_236_240 1;
add s_236_240 s_236_239 v_236_239;
asr s_236_240 s_236_240 1;
assert
    true
&&
    f_236_low60_0_low20_4 = f_236_low60_0_low20_3,
    u_236_240 = u_236_239,
    v_236_240 = v_236_239,
    g_236_low60_0_low20_4 * (const 64 2) = g_236_low60_0_low20_3 + f_236_low60_0_low20_3,
    r_236_240 * (const 64 2) = r_236_239 + u_236_239,
    s_236_240 * (const 64 2) = s_236_239 + v_236_239
;

assume
    f_236_low60_0_low20_4 = f_236_low60_0_low20_3,
    u_236_240 = u_236_239,
    v_236_240 = v_236_239,
    g_236_low60_0_low20_4 * 2 = g_236_low60_0_low20_3 + f_236_low60_0_low20_3,
    r_236_240 * 2 = r_236_239 + u_236_239,
    s_236_240 * 2 = s_236_239 + v_236_239
&&
    true
;

{
    u_236_240 * f_236_low60_0_low20_0 + v_236_240 * g_236_low60_0_low20_0 = f_236_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_240 * f_236_low60_0_low20_0 + s_236_240 * g_236_low60_0_low20_0 = g_236_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_4 + u_236_240 * (const 64 (2**21)) + v_236_240 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_4 + r_236_240 * (const 64 (2**21)) + s_236_240 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_4,
    f_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_4,
    g_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 240)) <=s delta, delta <=s (const 64 (1 + 2*240)),
    (const 64 (-(2**20))) <=s u_236_240, u_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_240, v_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_240, r_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_240, s_236_240 <=s (const 64 ((2**20))),
    u_236_240 + v_236_240 <=s (const 64 (2**20)),
    u_236_240 - v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 + v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 - v_236_240 <=s (const 64 (2**20)),
    r_236_240 + s_236_240 <=s (const 64 (2**20)),
    r_236_240 - s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 + s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 - s_236_240 <=s (const 64 (2**20)),
    u_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_236_240 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_239_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_3,
sint64 g_236_low60_0_low20_3,
sint64 f_236_low60_0_low20_4,
sint64 g_236_low60_0_low20_4,
sint64 u_236_239,
sint64 v_236_239,
sint64 r_236_239,
sint64 s_236_239,
sint64 u_236_240,
sint64 v_236_240,
sint64 r_236_240,
sint64 s_236_240,
bit ne
)={
    u_236_239 * f_236_low60_0_low20_0 + v_236_239 * g_236_low60_0_low20_0 = f_236_low60_0_low20_3 * (-(2**20)),
    r_236_239 * f_236_low60_0_low20_0 + s_236_239 * g_236_low60_0_low20_0 = g_236_low60_0_low20_3 * (-(2**20))
&&
    u_236_239 * f_236_low60_0_low20_0 + v_236_239 * g_236_low60_0_low20_0 = f_236_low60_0_low20_3 * (const 64 (-(2**20))),
    r_236_239 * f_236_low60_0_low20_0 + s_236_239 * g_236_low60_0_low20_0 = g_236_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_3 + u_236_239 * (const 64 (2**21)) + v_236_239 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_3 + r_236_239 * (const 64 (2**21)) + s_236_239 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_3,
    f_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_3,
    g_236_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 239)) <=s delta, delta <=s (const 64 (1 + 2*239)),
    (const 64 (-(2**20))) <=s u_236_239, u_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_239, v_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_239, r_236_239 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_239, s_236_239 <=s (const 64 ((2**20))),
    u_236_239 + v_236_239 <=s (const 64 (2**20)),
    u_236_239 - v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 + v_236_239 <=s (const 64 (2**20)),
    (const 64 0) - u_236_239 - v_236_239 <=s (const 64 (2**20)),
    r_236_239 + s_236_239 <=s (const 64 (2**20)),
    r_236_239 - s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 + s_236_239 <=s (const 64 (2**20)),
    (const 64 0) - r_236_239 - s_236_239 <=s (const 64 (2**20)),
    u_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_236_239 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_236_239 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step239

// premise c
assume
g_236_low60_0_low20_3 = 1 (mod 2)
&&
g_236_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_4 g_236_low60_0_low20_3;
mov u_236_240 r_236_239;
mov v_236_240 s_236_239;

subs dc g_236_low60_0_low20_4 g_236_low60_0_low20_3 f_236_low60_0_low20_3;
asr g_236_low60_0_low20_4 g_236_low60_0_low20_4 1;
subs dc r_236_240 r_236_239 u_236_239;
asr r_236_240 r_236_240 1;
subs dc s_236_240 s_236_239 v_236_239;
asr s_236_240 s_236_240 1;
assert
    true
&&
    f_236_low60_0_low20_4 = g_236_low60_0_low20_3,
    u_236_240 = r_236_239,
    v_236_240 = s_236_239,
    g_236_low60_0_low20_4 * (const 64 2) = g_236_low60_0_low20_3 - f_236_low60_0_low20_3,
    r_236_240 * (const 64 2) = r_236_239 - u_236_239,
    s_236_240 * (const 64 2) = s_236_239 - v_236_239
;

assume
    f_236_low60_0_low20_4 = g_236_low60_0_low20_3,
    u_236_240 = r_236_239,
    v_236_240 = s_236_239,
    g_236_low60_0_low20_4 * 2 = g_236_low60_0_low20_3 - f_236_low60_0_low20_3,
    r_236_240 * 2 = r_236_239 - u_236_239,
    s_236_240 * 2 = s_236_239 - v_236_239
&&
    true
;

{
    u_236_240 * f_236_low60_0_low20_0 + v_236_240 * g_236_low60_0_low20_0 = f_236_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_240 * f_236_low60_0_low20_0 + s_236_240 * g_236_low60_0_low20_0 = g_236_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_4 + u_236_240 * (const 64 (2**21)) + v_236_240 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_4 + r_236_240 * (const 64 (2**21)) + s_236_240 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_4,
    f_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_4,
    g_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 240)) <=s delta, delta <=s (const 64 (1 + 2*240)),
    (const 64 (-(2**20))) <=s u_236_240, u_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_240, v_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_240, r_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_240, s_236_240 <=s (const 64 ((2**20))),
    u_236_240 + v_236_240 <=s (const 64 (2**20)),
    u_236_240 - v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 + v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 - v_236_240 <=s (const 64 (2**20)),
    r_236_240 + s_236_240 <=s (const 64 (2**20)),
    r_236_240 - s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 + s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 - s_236_240 <=s (const 64 (2**20)),
    u_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_236_240 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_240_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_4,
sint64 g_236_low60_0_low20_4,
sint64 f_236_low60_0_low20_5,
sint64 g_236_low60_0_low20_5,
sint64 u_236_240,
sint64 v_236_240,
sint64 r_236_240,
sint64 s_236_240,
sint64 u_236_241,
sint64 v_236_241,
sint64 r_236_241,
sint64 s_236_241,
bit ne
)={
    u_236_240 * f_236_low60_0_low20_0 + v_236_240 * g_236_low60_0_low20_0 = f_236_low60_0_low20_4 * (-(2**20)),
    r_236_240 * f_236_low60_0_low20_0 + s_236_240 * g_236_low60_0_low20_0 = g_236_low60_0_low20_4 * (-(2**20))
&&
    u_236_240 * f_236_low60_0_low20_0 + v_236_240 * g_236_low60_0_low20_0 = f_236_low60_0_low20_4 * (const 64 (-(2**20))),
    r_236_240 * f_236_low60_0_low20_0 + s_236_240 * g_236_low60_0_low20_0 = g_236_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_4 + u_236_240 * (const 64 (2**21)) + v_236_240 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_4 + r_236_240 * (const 64 (2**21)) + s_236_240 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_4,
    f_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_4,
    g_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 240)) <=s delta, delta <=s (const 64 (1 + 2*240)),
    (const 64 (-(2**20))) <=s u_236_240, u_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_240, v_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_240, r_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_240, s_236_240 <=s (const 64 ((2**20))),
    u_236_240 + v_236_240 <=s (const 64 (2**20)),
    u_236_240 - v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 + v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 - v_236_240 <=s (const 64 (2**20)),
    r_236_240 + s_236_240 <=s (const 64 (2**20)),
    r_236_240 - s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 + s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 - s_236_240 <=s (const 64 (2**20)),
    u_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_236_240 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step240

// premise a
assume
g_236_low60_0_low20_4 = 0 (mod 2)
&&
g_236_low60_0_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_5 f_236_low60_0_low20_4;
mov u_236_241 u_236_240;
mov v_236_241 v_236_240;

asr g_236_low60_0_low20_5 g_236_low60_0_low20_4 1;
asr r_236_241 r_236_240 1;
asr s_236_241 s_236_240 1;
assert
    true
&&
    f_236_low60_0_low20_5 = f_236_low60_0_low20_4,
    u_236_241 = u_236_240,
    v_236_241 = v_236_240,
    g_236_low60_0_low20_5 * (const 64 2) = g_236_low60_0_low20_4,
    r_236_241 * (const 64 2) = r_236_240,
    s_236_241 * (const 64 2) = s_236_240
;

assume
    f_236_low60_0_low20_5 = f_236_low60_0_low20_4,
    u_236_241 = u_236_240,
    v_236_241 = v_236_240,
    g_236_low60_0_low20_5 * 2 = g_236_low60_0_low20_4,
    r_236_241 * 2 = r_236_240,
    s_236_241 * 2 = s_236_240
&&
    true
;

{
    u_236_241 * f_236_low60_0_low20_0 + v_236_241 * g_236_low60_0_low20_0 = f_236_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_241 * f_236_low60_0_low20_0 + s_236_241 * g_236_low60_0_low20_0 = g_236_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_5 + u_236_241 * (const 64 (2**21)) + v_236_241 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_5 + r_236_241 * (const 64 (2**21)) + s_236_241 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_5,
    f_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_5,
    g_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 241)) <=s delta, delta <=s (const 64 (1 + 2*241)),
    (const 64 (-(2**20))) <=s u_236_241, u_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_241, v_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_241, r_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_241, s_236_241 <=s (const 64 ((2**20))),
    u_236_241 + v_236_241 <=s (const 64 (2**20)),
    u_236_241 - v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 + v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 - v_236_241 <=s (const 64 (2**20)),
    r_236_241 + s_236_241 <=s (const 64 (2**20)),
    r_236_241 - s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 + s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 - s_236_241 <=s (const 64 (2**20)),
    u_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_236_241 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_240_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_4,
sint64 g_236_low60_0_low20_4,
sint64 f_236_low60_0_low20_5,
sint64 g_236_low60_0_low20_5,
sint64 u_236_240,
sint64 v_236_240,
sint64 r_236_240,
sint64 s_236_240,
sint64 u_236_241,
sint64 v_236_241,
sint64 r_236_241,
sint64 s_236_241,
bit ne
)={
    u_236_240 * f_236_low60_0_low20_0 + v_236_240 * g_236_low60_0_low20_0 = f_236_low60_0_low20_4 * (-(2**20)),
    r_236_240 * f_236_low60_0_low20_0 + s_236_240 * g_236_low60_0_low20_0 = g_236_low60_0_low20_4 * (-(2**20))
&&
    u_236_240 * f_236_low60_0_low20_0 + v_236_240 * g_236_low60_0_low20_0 = f_236_low60_0_low20_4 * (const 64 (-(2**20))),
    r_236_240 * f_236_low60_0_low20_0 + s_236_240 * g_236_low60_0_low20_0 = g_236_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_4 + u_236_240 * (const 64 (2**21)) + v_236_240 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_4 + r_236_240 * (const 64 (2**21)) + s_236_240 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_4,
    f_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_4,
    g_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 240)) <=s delta, delta <=s (const 64 (1 + 2*240)),
    (const 64 (-(2**20))) <=s u_236_240, u_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_240, v_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_240, r_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_240, s_236_240 <=s (const 64 ((2**20))),
    u_236_240 + v_236_240 <=s (const 64 (2**20)),
    u_236_240 - v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 + v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 - v_236_240 <=s (const 64 (2**20)),
    r_236_240 + s_236_240 <=s (const 64 (2**20)),
    r_236_240 - s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 + s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 - s_236_240 <=s (const 64 (2**20)),
    u_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_236_240 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step240

// premise b
assume
g_236_low60_0_low20_4 = 1 (mod 2)
&&
g_236_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_5 f_236_low60_0_low20_4;
mov u_236_241 u_236_240;
mov v_236_241 v_236_240;

add g_236_low60_0_low20_5 g_236_low60_0_low20_4 f_236_low60_0_low20_4;
asr g_236_low60_0_low20_5 g_236_low60_0_low20_5 1;
add r_236_241 r_236_240 u_236_240;
asr r_236_241 r_236_241 1;
add s_236_241 s_236_240 v_236_240;
asr s_236_241 s_236_241 1;
assert
    true
&&
    f_236_low60_0_low20_5 = f_236_low60_0_low20_4,
    u_236_241 = u_236_240,
    v_236_241 = v_236_240,
    g_236_low60_0_low20_5 * (const 64 2) = g_236_low60_0_low20_4 + f_236_low60_0_low20_4,
    r_236_241 * (const 64 2) = r_236_240 + u_236_240,
    s_236_241 * (const 64 2) = s_236_240 + v_236_240
;

assume
    f_236_low60_0_low20_5 = f_236_low60_0_low20_4,
    u_236_241 = u_236_240,
    v_236_241 = v_236_240,
    g_236_low60_0_low20_5 * 2 = g_236_low60_0_low20_4 + f_236_low60_0_low20_4,
    r_236_241 * 2 = r_236_240 + u_236_240,
    s_236_241 * 2 = s_236_240 + v_236_240
&&
    true
;

{
    u_236_241 * f_236_low60_0_low20_0 + v_236_241 * g_236_low60_0_low20_0 = f_236_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_241 * f_236_low60_0_low20_0 + s_236_241 * g_236_low60_0_low20_0 = g_236_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_5 + u_236_241 * (const 64 (2**21)) + v_236_241 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_5 + r_236_241 * (const 64 (2**21)) + s_236_241 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_5,
    f_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_5,
    g_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 241)) <=s delta, delta <=s (const 64 (1 + 2*241)),
    (const 64 (-(2**20))) <=s u_236_241, u_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_241, v_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_241, r_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_241, s_236_241 <=s (const 64 ((2**20))),
    u_236_241 + v_236_241 <=s (const 64 (2**20)),
    u_236_241 - v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 + v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 - v_236_241 <=s (const 64 (2**20)),
    r_236_241 + s_236_241 <=s (const 64 (2**20)),
    r_236_241 - s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 + s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 - s_236_241 <=s (const 64 (2**20)),
    u_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_236_241 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_240_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_4,
sint64 g_236_low60_0_low20_4,
sint64 f_236_low60_0_low20_5,
sint64 g_236_low60_0_low20_5,
sint64 u_236_240,
sint64 v_236_240,
sint64 r_236_240,
sint64 s_236_240,
sint64 u_236_241,
sint64 v_236_241,
sint64 r_236_241,
sint64 s_236_241,
bit ne
)={
    u_236_240 * f_236_low60_0_low20_0 + v_236_240 * g_236_low60_0_low20_0 = f_236_low60_0_low20_4 * (-(2**20)),
    r_236_240 * f_236_low60_0_low20_0 + s_236_240 * g_236_low60_0_low20_0 = g_236_low60_0_low20_4 * (-(2**20))
&&
    u_236_240 * f_236_low60_0_low20_0 + v_236_240 * g_236_low60_0_low20_0 = f_236_low60_0_low20_4 * (const 64 (-(2**20))),
    r_236_240 * f_236_low60_0_low20_0 + s_236_240 * g_236_low60_0_low20_0 = g_236_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_4 + u_236_240 * (const 64 (2**21)) + v_236_240 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_4 + r_236_240 * (const 64 (2**21)) + s_236_240 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_4,
    f_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_4,
    g_236_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 240)) <=s delta, delta <=s (const 64 (1 + 2*240)),
    (const 64 (-(2**20))) <=s u_236_240, u_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_240, v_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_240, r_236_240 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_240, s_236_240 <=s (const 64 ((2**20))),
    u_236_240 + v_236_240 <=s (const 64 (2**20)),
    u_236_240 - v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 + v_236_240 <=s (const 64 (2**20)),
    (const 64 0) - u_236_240 - v_236_240 <=s (const 64 (2**20)),
    r_236_240 + s_236_240 <=s (const 64 (2**20)),
    r_236_240 - s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 + s_236_240 <=s (const 64 (2**20)),
    (const 64 0) - r_236_240 - s_236_240 <=s (const 64 (2**20)),
    u_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_236_240 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_236_240 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step240

// premise c
assume
g_236_low60_0_low20_4 = 1 (mod 2)
&&
g_236_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_5 g_236_low60_0_low20_4;
mov u_236_241 r_236_240;
mov v_236_241 s_236_240;

subs dc g_236_low60_0_low20_5 g_236_low60_0_low20_4 f_236_low60_0_low20_4;
asr g_236_low60_0_low20_5 g_236_low60_0_low20_5 1;
subs dc r_236_241 r_236_240 u_236_240;
asr r_236_241 r_236_241 1;
subs dc s_236_241 s_236_240 v_236_240;
asr s_236_241 s_236_241 1;
assert
    true
&&
    f_236_low60_0_low20_5 = g_236_low60_0_low20_4,
    u_236_241 = r_236_240,
    v_236_241 = s_236_240,
    g_236_low60_0_low20_5 * (const 64 2) = g_236_low60_0_low20_4 - f_236_low60_0_low20_4,
    r_236_241 * (const 64 2) = r_236_240 - u_236_240,
    s_236_241 * (const 64 2) = s_236_240 - v_236_240
;

assume
    f_236_low60_0_low20_5 = g_236_low60_0_low20_4,
    u_236_241 = r_236_240,
    v_236_241 = s_236_240,
    g_236_low60_0_low20_5 * 2 = g_236_low60_0_low20_4 - f_236_low60_0_low20_4,
    r_236_241 * 2 = r_236_240 - u_236_240,
    s_236_241 * 2 = s_236_240 - v_236_240
&&
    true
;

{
    u_236_241 * f_236_low60_0_low20_0 + v_236_241 * g_236_low60_0_low20_0 = f_236_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_241 * f_236_low60_0_low20_0 + s_236_241 * g_236_low60_0_low20_0 = g_236_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_5 + u_236_241 * (const 64 (2**21)) + v_236_241 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_5 + r_236_241 * (const 64 (2**21)) + s_236_241 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_5,
    f_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_5,
    g_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 241)) <=s delta, delta <=s (const 64 (1 + 2*241)),
    (const 64 (-(2**20))) <=s u_236_241, u_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_241, v_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_241, r_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_241, s_236_241 <=s (const 64 ((2**20))),
    u_236_241 + v_236_241 <=s (const 64 (2**20)),
    u_236_241 - v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 + v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 - v_236_241 <=s (const 64 (2**20)),
    r_236_241 + s_236_241 <=s (const 64 (2**20)),
    r_236_241 - s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 + s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 - s_236_241 <=s (const 64 (2**20)),
    u_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_236_241 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_241_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_5,
sint64 g_236_low60_0_low20_5,
sint64 f_236_low60_0_low20_6,
sint64 g_236_low60_0_low20_6,
sint64 u_236_241,
sint64 v_236_241,
sint64 r_236_241,
sint64 s_236_241,
sint64 u_236_242,
sint64 v_236_242,
sint64 r_236_242,
sint64 s_236_242,
bit ne
)={
    u_236_241 * f_236_low60_0_low20_0 + v_236_241 * g_236_low60_0_low20_0 = f_236_low60_0_low20_5 * (-(2**20)),
    r_236_241 * f_236_low60_0_low20_0 + s_236_241 * g_236_low60_0_low20_0 = g_236_low60_0_low20_5 * (-(2**20))
&&
    u_236_241 * f_236_low60_0_low20_0 + v_236_241 * g_236_low60_0_low20_0 = f_236_low60_0_low20_5 * (const 64 (-(2**20))),
    r_236_241 * f_236_low60_0_low20_0 + s_236_241 * g_236_low60_0_low20_0 = g_236_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_5 + u_236_241 * (const 64 (2**21)) + v_236_241 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_5 + r_236_241 * (const 64 (2**21)) + s_236_241 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_5,
    f_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_5,
    g_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 241)) <=s delta, delta <=s (const 64 (1 + 2*241)),
    (const 64 (-(2**20))) <=s u_236_241, u_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_241, v_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_241, r_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_241, s_236_241 <=s (const 64 ((2**20))),
    u_236_241 + v_236_241 <=s (const 64 (2**20)),
    u_236_241 - v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 + v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 - v_236_241 <=s (const 64 (2**20)),
    r_236_241 + s_236_241 <=s (const 64 (2**20)),
    r_236_241 - s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 + s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 - s_236_241 <=s (const 64 (2**20)),
    u_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_236_241 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step241

// premise a
assume
g_236_low60_0_low20_5 = 0 (mod 2)
&&
g_236_low60_0_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_6 f_236_low60_0_low20_5;
mov u_236_242 u_236_241;
mov v_236_242 v_236_241;

asr g_236_low60_0_low20_6 g_236_low60_0_low20_5 1;
asr r_236_242 r_236_241 1;
asr s_236_242 s_236_241 1;
assert
    true
&&
    f_236_low60_0_low20_6 = f_236_low60_0_low20_5,
    u_236_242 = u_236_241,
    v_236_242 = v_236_241,
    g_236_low60_0_low20_6 * (const 64 2) = g_236_low60_0_low20_5,
    r_236_242 * (const 64 2) = r_236_241,
    s_236_242 * (const 64 2) = s_236_241
;

assume
    f_236_low60_0_low20_6 = f_236_low60_0_low20_5,
    u_236_242 = u_236_241,
    v_236_242 = v_236_241,
    g_236_low60_0_low20_6 * 2 = g_236_low60_0_low20_5,
    r_236_242 * 2 = r_236_241,
    s_236_242 * 2 = s_236_241
&&
    true
;

{
    u_236_242 * f_236_low60_0_low20_0 + v_236_242 * g_236_low60_0_low20_0 = f_236_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_242 * f_236_low60_0_low20_0 + s_236_242 * g_236_low60_0_low20_0 = g_236_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_6 + u_236_242 * (const 64 (2**21)) + v_236_242 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_6 + r_236_242 * (const 64 (2**21)) + s_236_242 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_6,
    f_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_6,
    g_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 242)) <=s delta, delta <=s (const 64 (1 + 2*242)),
    (const 64 (-(2**20))) <=s u_236_242, u_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_242, v_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_242, r_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_242, s_236_242 <=s (const 64 ((2**20))),
    u_236_242 + v_236_242 <=s (const 64 (2**20)),
    u_236_242 - v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 + v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 - v_236_242 <=s (const 64 (2**20)),
    r_236_242 + s_236_242 <=s (const 64 (2**20)),
    r_236_242 - s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 + s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 - s_236_242 <=s (const 64 (2**20)),
    u_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_236_242 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_241_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_5,
sint64 g_236_low60_0_low20_5,
sint64 f_236_low60_0_low20_6,
sint64 g_236_low60_0_low20_6,
sint64 u_236_241,
sint64 v_236_241,
sint64 r_236_241,
sint64 s_236_241,
sint64 u_236_242,
sint64 v_236_242,
sint64 r_236_242,
sint64 s_236_242,
bit ne
)={
    u_236_241 * f_236_low60_0_low20_0 + v_236_241 * g_236_low60_0_low20_0 = f_236_low60_0_low20_5 * (-(2**20)),
    r_236_241 * f_236_low60_0_low20_0 + s_236_241 * g_236_low60_0_low20_0 = g_236_low60_0_low20_5 * (-(2**20))
&&
    u_236_241 * f_236_low60_0_low20_0 + v_236_241 * g_236_low60_0_low20_0 = f_236_low60_0_low20_5 * (const 64 (-(2**20))),
    r_236_241 * f_236_low60_0_low20_0 + s_236_241 * g_236_low60_0_low20_0 = g_236_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_5 + u_236_241 * (const 64 (2**21)) + v_236_241 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_5 + r_236_241 * (const 64 (2**21)) + s_236_241 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_5,
    f_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_5,
    g_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 241)) <=s delta, delta <=s (const 64 (1 + 2*241)),
    (const 64 (-(2**20))) <=s u_236_241, u_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_241, v_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_241, r_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_241, s_236_241 <=s (const 64 ((2**20))),
    u_236_241 + v_236_241 <=s (const 64 (2**20)),
    u_236_241 - v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 + v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 - v_236_241 <=s (const 64 (2**20)),
    r_236_241 + s_236_241 <=s (const 64 (2**20)),
    r_236_241 - s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 + s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 - s_236_241 <=s (const 64 (2**20)),
    u_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_236_241 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step241

// premise b
assume
g_236_low60_0_low20_5 = 1 (mod 2)
&&
g_236_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_6 f_236_low60_0_low20_5;
mov u_236_242 u_236_241;
mov v_236_242 v_236_241;

add g_236_low60_0_low20_6 g_236_low60_0_low20_5 f_236_low60_0_low20_5;
asr g_236_low60_0_low20_6 g_236_low60_0_low20_6 1;
add r_236_242 r_236_241 u_236_241;
asr r_236_242 r_236_242 1;
add s_236_242 s_236_241 v_236_241;
asr s_236_242 s_236_242 1;
assert
    true
&&
    f_236_low60_0_low20_6 = f_236_low60_0_low20_5,
    u_236_242 = u_236_241,
    v_236_242 = v_236_241,
    g_236_low60_0_low20_6 * (const 64 2) = g_236_low60_0_low20_5 + f_236_low60_0_low20_5,
    r_236_242 * (const 64 2) = r_236_241 + u_236_241,
    s_236_242 * (const 64 2) = s_236_241 + v_236_241
;

assume
    f_236_low60_0_low20_6 = f_236_low60_0_low20_5,
    u_236_242 = u_236_241,
    v_236_242 = v_236_241,
    g_236_low60_0_low20_6 * 2 = g_236_low60_0_low20_5 + f_236_low60_0_low20_5,
    r_236_242 * 2 = r_236_241 + u_236_241,
    s_236_242 * 2 = s_236_241 + v_236_241
&&
    true
;

{
    u_236_242 * f_236_low60_0_low20_0 + v_236_242 * g_236_low60_0_low20_0 = f_236_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_242 * f_236_low60_0_low20_0 + s_236_242 * g_236_low60_0_low20_0 = g_236_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_6 + u_236_242 * (const 64 (2**21)) + v_236_242 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_6 + r_236_242 * (const 64 (2**21)) + s_236_242 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_6,
    f_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_6,
    g_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 242)) <=s delta, delta <=s (const 64 (1 + 2*242)),
    (const 64 (-(2**20))) <=s u_236_242, u_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_242, v_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_242, r_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_242, s_236_242 <=s (const 64 ((2**20))),
    u_236_242 + v_236_242 <=s (const 64 (2**20)),
    u_236_242 - v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 + v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 - v_236_242 <=s (const 64 (2**20)),
    r_236_242 + s_236_242 <=s (const 64 (2**20)),
    r_236_242 - s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 + s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 - s_236_242 <=s (const 64 (2**20)),
    u_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_236_242 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_241_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_5,
sint64 g_236_low60_0_low20_5,
sint64 f_236_low60_0_low20_6,
sint64 g_236_low60_0_low20_6,
sint64 u_236_241,
sint64 v_236_241,
sint64 r_236_241,
sint64 s_236_241,
sint64 u_236_242,
sint64 v_236_242,
sint64 r_236_242,
sint64 s_236_242,
bit ne
)={
    u_236_241 * f_236_low60_0_low20_0 + v_236_241 * g_236_low60_0_low20_0 = f_236_low60_0_low20_5 * (-(2**20)),
    r_236_241 * f_236_low60_0_low20_0 + s_236_241 * g_236_low60_0_low20_0 = g_236_low60_0_low20_5 * (-(2**20))
&&
    u_236_241 * f_236_low60_0_low20_0 + v_236_241 * g_236_low60_0_low20_0 = f_236_low60_0_low20_5 * (const 64 (-(2**20))),
    r_236_241 * f_236_low60_0_low20_0 + s_236_241 * g_236_low60_0_low20_0 = g_236_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_5 + u_236_241 * (const 64 (2**21)) + v_236_241 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_5 + r_236_241 * (const 64 (2**21)) + s_236_241 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_5,
    f_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_5,
    g_236_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 241)) <=s delta, delta <=s (const 64 (1 + 2*241)),
    (const 64 (-(2**20))) <=s u_236_241, u_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_241, v_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_241, r_236_241 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_241, s_236_241 <=s (const 64 ((2**20))),
    u_236_241 + v_236_241 <=s (const 64 (2**20)),
    u_236_241 - v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 + v_236_241 <=s (const 64 (2**20)),
    (const 64 0) - u_236_241 - v_236_241 <=s (const 64 (2**20)),
    r_236_241 + s_236_241 <=s (const 64 (2**20)),
    r_236_241 - s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 + s_236_241 <=s (const 64 (2**20)),
    (const 64 0) - r_236_241 - s_236_241 <=s (const 64 (2**20)),
    u_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_236_241 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_236_241 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step241

// premise c
assume
g_236_low60_0_low20_5 = 1 (mod 2)
&&
g_236_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_6 g_236_low60_0_low20_5;
mov u_236_242 r_236_241;
mov v_236_242 s_236_241;

subs dc g_236_low60_0_low20_6 g_236_low60_0_low20_5 f_236_low60_0_low20_5;
asr g_236_low60_0_low20_6 g_236_low60_0_low20_6 1;
subs dc r_236_242 r_236_241 u_236_241;
asr r_236_242 r_236_242 1;
subs dc s_236_242 s_236_241 v_236_241;
asr s_236_242 s_236_242 1;
assert
    true
&&
    f_236_low60_0_low20_6 = g_236_low60_0_low20_5,
    u_236_242 = r_236_241,
    v_236_242 = s_236_241,
    g_236_low60_0_low20_6 * (const 64 2) = g_236_low60_0_low20_5 - f_236_low60_0_low20_5,
    r_236_242 * (const 64 2) = r_236_241 - u_236_241,
    s_236_242 * (const 64 2) = s_236_241 - v_236_241
;

assume
    f_236_low60_0_low20_6 = g_236_low60_0_low20_5,
    u_236_242 = r_236_241,
    v_236_242 = s_236_241,
    g_236_low60_0_low20_6 * 2 = g_236_low60_0_low20_5 - f_236_low60_0_low20_5,
    r_236_242 * 2 = r_236_241 - u_236_241,
    s_236_242 * 2 = s_236_241 - v_236_241
&&
    true
;

{
    u_236_242 * f_236_low60_0_low20_0 + v_236_242 * g_236_low60_0_low20_0 = f_236_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_242 * f_236_low60_0_low20_0 + s_236_242 * g_236_low60_0_low20_0 = g_236_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_6 + u_236_242 * (const 64 (2**21)) + v_236_242 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_6 + r_236_242 * (const 64 (2**21)) + s_236_242 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_6,
    f_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_6,
    g_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 242)) <=s delta, delta <=s (const 64 (1 + 2*242)),
    (const 64 (-(2**20))) <=s u_236_242, u_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_242, v_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_242, r_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_242, s_236_242 <=s (const 64 ((2**20))),
    u_236_242 + v_236_242 <=s (const 64 (2**20)),
    u_236_242 - v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 + v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 - v_236_242 <=s (const 64 (2**20)),
    r_236_242 + s_236_242 <=s (const 64 (2**20)),
    r_236_242 - s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 + s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 - s_236_242 <=s (const 64 (2**20)),
    u_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_236_242 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_242_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_6,
sint64 g_236_low60_0_low20_6,
sint64 f_236_low60_0_low20_7,
sint64 g_236_low60_0_low20_7,
sint64 u_236_242,
sint64 v_236_242,
sint64 r_236_242,
sint64 s_236_242,
sint64 u_236_243,
sint64 v_236_243,
sint64 r_236_243,
sint64 s_236_243,
bit ne
)={
    u_236_242 * f_236_low60_0_low20_0 + v_236_242 * g_236_low60_0_low20_0 = f_236_low60_0_low20_6 * (-(2**20)),
    r_236_242 * f_236_low60_0_low20_0 + s_236_242 * g_236_low60_0_low20_0 = g_236_low60_0_low20_6 * (-(2**20))
&&
    u_236_242 * f_236_low60_0_low20_0 + v_236_242 * g_236_low60_0_low20_0 = f_236_low60_0_low20_6 * (const 64 (-(2**20))),
    r_236_242 * f_236_low60_0_low20_0 + s_236_242 * g_236_low60_0_low20_0 = g_236_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_6 + u_236_242 * (const 64 (2**21)) + v_236_242 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_6 + r_236_242 * (const 64 (2**21)) + s_236_242 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_6,
    f_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_6,
    g_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 242)) <=s delta, delta <=s (const 64 (1 + 2*242)),
    (const 64 (-(2**20))) <=s u_236_242, u_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_242, v_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_242, r_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_242, s_236_242 <=s (const 64 ((2**20))),
    u_236_242 + v_236_242 <=s (const 64 (2**20)),
    u_236_242 - v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 + v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 - v_236_242 <=s (const 64 (2**20)),
    r_236_242 + s_236_242 <=s (const 64 (2**20)),
    r_236_242 - s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 + s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 - s_236_242 <=s (const 64 (2**20)),
    u_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_236_242 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step242

// premise a
assume
g_236_low60_0_low20_6 = 0 (mod 2)
&&
g_236_low60_0_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_7 f_236_low60_0_low20_6;
mov u_236_243 u_236_242;
mov v_236_243 v_236_242;

asr g_236_low60_0_low20_7 g_236_low60_0_low20_6 1;
asr r_236_243 r_236_242 1;
asr s_236_243 s_236_242 1;
assert
    true
&&
    f_236_low60_0_low20_7 = f_236_low60_0_low20_6,
    u_236_243 = u_236_242,
    v_236_243 = v_236_242,
    g_236_low60_0_low20_7 * (const 64 2) = g_236_low60_0_low20_6,
    r_236_243 * (const 64 2) = r_236_242,
    s_236_243 * (const 64 2) = s_236_242
;

assume
    f_236_low60_0_low20_7 = f_236_low60_0_low20_6,
    u_236_243 = u_236_242,
    v_236_243 = v_236_242,
    g_236_low60_0_low20_7 * 2 = g_236_low60_0_low20_6,
    r_236_243 * 2 = r_236_242,
    s_236_243 * 2 = s_236_242
&&
    true
;

{
    u_236_243 * f_236_low60_0_low20_0 + v_236_243 * g_236_low60_0_low20_0 = f_236_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_243 * f_236_low60_0_low20_0 + s_236_243 * g_236_low60_0_low20_0 = g_236_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_7 + u_236_243 * (const 64 (2**21)) + v_236_243 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_7 + r_236_243 * (const 64 (2**21)) + s_236_243 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_7,
    f_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_7,
    g_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 243)) <=s delta, delta <=s (const 64 (1 + 2*243)),
    (const 64 (-(2**20))) <=s u_236_243, u_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_243, v_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_243, r_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_243, s_236_243 <=s (const 64 ((2**20))),
    u_236_243 + v_236_243 <=s (const 64 (2**20)),
    u_236_243 - v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 + v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 - v_236_243 <=s (const 64 (2**20)),
    r_236_243 + s_236_243 <=s (const 64 (2**20)),
    r_236_243 - s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 + s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 - s_236_243 <=s (const 64 (2**20)),
    u_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_236_243 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_242_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_6,
sint64 g_236_low60_0_low20_6,
sint64 f_236_low60_0_low20_7,
sint64 g_236_low60_0_low20_7,
sint64 u_236_242,
sint64 v_236_242,
sint64 r_236_242,
sint64 s_236_242,
sint64 u_236_243,
sint64 v_236_243,
sint64 r_236_243,
sint64 s_236_243,
bit ne
)={
    u_236_242 * f_236_low60_0_low20_0 + v_236_242 * g_236_low60_0_low20_0 = f_236_low60_0_low20_6 * (-(2**20)),
    r_236_242 * f_236_low60_0_low20_0 + s_236_242 * g_236_low60_0_low20_0 = g_236_low60_0_low20_6 * (-(2**20))
&&
    u_236_242 * f_236_low60_0_low20_0 + v_236_242 * g_236_low60_0_low20_0 = f_236_low60_0_low20_6 * (const 64 (-(2**20))),
    r_236_242 * f_236_low60_0_low20_0 + s_236_242 * g_236_low60_0_low20_0 = g_236_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_6 + u_236_242 * (const 64 (2**21)) + v_236_242 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_6 + r_236_242 * (const 64 (2**21)) + s_236_242 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_6,
    f_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_6,
    g_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 242)) <=s delta, delta <=s (const 64 (1 + 2*242)),
    (const 64 (-(2**20))) <=s u_236_242, u_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_242, v_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_242, r_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_242, s_236_242 <=s (const 64 ((2**20))),
    u_236_242 + v_236_242 <=s (const 64 (2**20)),
    u_236_242 - v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 + v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 - v_236_242 <=s (const 64 (2**20)),
    r_236_242 + s_236_242 <=s (const 64 (2**20)),
    r_236_242 - s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 + s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 - s_236_242 <=s (const 64 (2**20)),
    u_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_236_242 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step242

// premise b
assume
g_236_low60_0_low20_6 = 1 (mod 2)
&&
g_236_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_7 f_236_low60_0_low20_6;
mov u_236_243 u_236_242;
mov v_236_243 v_236_242;

add g_236_low60_0_low20_7 g_236_low60_0_low20_6 f_236_low60_0_low20_6;
asr g_236_low60_0_low20_7 g_236_low60_0_low20_7 1;
add r_236_243 r_236_242 u_236_242;
asr r_236_243 r_236_243 1;
add s_236_243 s_236_242 v_236_242;
asr s_236_243 s_236_243 1;
assert
    true
&&
    f_236_low60_0_low20_7 = f_236_low60_0_low20_6,
    u_236_243 = u_236_242,
    v_236_243 = v_236_242,
    g_236_low60_0_low20_7 * (const 64 2) = g_236_low60_0_low20_6 + f_236_low60_0_low20_6,
    r_236_243 * (const 64 2) = r_236_242 + u_236_242,
    s_236_243 * (const 64 2) = s_236_242 + v_236_242
;

assume
    f_236_low60_0_low20_7 = f_236_low60_0_low20_6,
    u_236_243 = u_236_242,
    v_236_243 = v_236_242,
    g_236_low60_0_low20_7 * 2 = g_236_low60_0_low20_6 + f_236_low60_0_low20_6,
    r_236_243 * 2 = r_236_242 + u_236_242,
    s_236_243 * 2 = s_236_242 + v_236_242
&&
    true
;

{
    u_236_243 * f_236_low60_0_low20_0 + v_236_243 * g_236_low60_0_low20_0 = f_236_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_243 * f_236_low60_0_low20_0 + s_236_243 * g_236_low60_0_low20_0 = g_236_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_7 + u_236_243 * (const 64 (2**21)) + v_236_243 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_7 + r_236_243 * (const 64 (2**21)) + s_236_243 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_7,
    f_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_7,
    g_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 243)) <=s delta, delta <=s (const 64 (1 + 2*243)),
    (const 64 (-(2**20))) <=s u_236_243, u_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_243, v_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_243, r_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_243, s_236_243 <=s (const 64 ((2**20))),
    u_236_243 + v_236_243 <=s (const 64 (2**20)),
    u_236_243 - v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 + v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 - v_236_243 <=s (const 64 (2**20)),
    r_236_243 + s_236_243 <=s (const 64 (2**20)),
    r_236_243 - s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 + s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 - s_236_243 <=s (const 64 (2**20)),
    u_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_236_243 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_242_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_6,
sint64 g_236_low60_0_low20_6,
sint64 f_236_low60_0_low20_7,
sint64 g_236_low60_0_low20_7,
sint64 u_236_242,
sint64 v_236_242,
sint64 r_236_242,
sint64 s_236_242,
sint64 u_236_243,
sint64 v_236_243,
sint64 r_236_243,
sint64 s_236_243,
bit ne
)={
    u_236_242 * f_236_low60_0_low20_0 + v_236_242 * g_236_low60_0_low20_0 = f_236_low60_0_low20_6 * (-(2**20)),
    r_236_242 * f_236_low60_0_low20_0 + s_236_242 * g_236_low60_0_low20_0 = g_236_low60_0_low20_6 * (-(2**20))
&&
    u_236_242 * f_236_low60_0_low20_0 + v_236_242 * g_236_low60_0_low20_0 = f_236_low60_0_low20_6 * (const 64 (-(2**20))),
    r_236_242 * f_236_low60_0_low20_0 + s_236_242 * g_236_low60_0_low20_0 = g_236_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_6 + u_236_242 * (const 64 (2**21)) + v_236_242 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_6 + r_236_242 * (const 64 (2**21)) + s_236_242 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_6,
    f_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_6,
    g_236_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 242)) <=s delta, delta <=s (const 64 (1 + 2*242)),
    (const 64 (-(2**20))) <=s u_236_242, u_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_242, v_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_242, r_236_242 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_242, s_236_242 <=s (const 64 ((2**20))),
    u_236_242 + v_236_242 <=s (const 64 (2**20)),
    u_236_242 - v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 + v_236_242 <=s (const 64 (2**20)),
    (const 64 0) - u_236_242 - v_236_242 <=s (const 64 (2**20)),
    r_236_242 + s_236_242 <=s (const 64 (2**20)),
    r_236_242 - s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 + s_236_242 <=s (const 64 (2**20)),
    (const 64 0) - r_236_242 - s_236_242 <=s (const 64 (2**20)),
    u_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_236_242 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_236_242 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step242

// premise c
assume
g_236_low60_0_low20_6 = 1 (mod 2)
&&
g_236_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_7 g_236_low60_0_low20_6;
mov u_236_243 r_236_242;
mov v_236_243 s_236_242;

subs dc g_236_low60_0_low20_7 g_236_low60_0_low20_6 f_236_low60_0_low20_6;
asr g_236_low60_0_low20_7 g_236_low60_0_low20_7 1;
subs dc r_236_243 r_236_242 u_236_242;
asr r_236_243 r_236_243 1;
subs dc s_236_243 s_236_242 v_236_242;
asr s_236_243 s_236_243 1;
assert
    true
&&
    f_236_low60_0_low20_7 = g_236_low60_0_low20_6,
    u_236_243 = r_236_242,
    v_236_243 = s_236_242,
    g_236_low60_0_low20_7 * (const 64 2) = g_236_low60_0_low20_6 - f_236_low60_0_low20_6,
    r_236_243 * (const 64 2) = r_236_242 - u_236_242,
    s_236_243 * (const 64 2) = s_236_242 - v_236_242
;

assume
    f_236_low60_0_low20_7 = g_236_low60_0_low20_6,
    u_236_243 = r_236_242,
    v_236_243 = s_236_242,
    g_236_low60_0_low20_7 * 2 = g_236_low60_0_low20_6 - f_236_low60_0_low20_6,
    r_236_243 * 2 = r_236_242 - u_236_242,
    s_236_243 * 2 = s_236_242 - v_236_242
&&
    true
;

{
    u_236_243 * f_236_low60_0_low20_0 + v_236_243 * g_236_low60_0_low20_0 = f_236_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_243 * f_236_low60_0_low20_0 + s_236_243 * g_236_low60_0_low20_0 = g_236_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_7 + u_236_243 * (const 64 (2**21)) + v_236_243 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_7 + r_236_243 * (const 64 (2**21)) + s_236_243 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_7,
    f_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_7,
    g_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 243)) <=s delta, delta <=s (const 64 (1 + 2*243)),
    (const 64 (-(2**20))) <=s u_236_243, u_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_243, v_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_243, r_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_243, s_236_243 <=s (const 64 ((2**20))),
    u_236_243 + v_236_243 <=s (const 64 (2**20)),
    u_236_243 - v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 + v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 - v_236_243 <=s (const 64 (2**20)),
    r_236_243 + s_236_243 <=s (const 64 (2**20)),
    r_236_243 - s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 + s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 - s_236_243 <=s (const 64 (2**20)),
    u_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_236_243 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_243_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_7,
sint64 g_236_low60_0_low20_7,
sint64 f_236_low60_0_low20_8,
sint64 g_236_low60_0_low20_8,
sint64 u_236_243,
sint64 v_236_243,
sint64 r_236_243,
sint64 s_236_243,
sint64 u_236_244,
sint64 v_236_244,
sint64 r_236_244,
sint64 s_236_244,
bit ne
)={
    u_236_243 * f_236_low60_0_low20_0 + v_236_243 * g_236_low60_0_low20_0 = f_236_low60_0_low20_7 * (-(2**20)),
    r_236_243 * f_236_low60_0_low20_0 + s_236_243 * g_236_low60_0_low20_0 = g_236_low60_0_low20_7 * (-(2**20))
&&
    u_236_243 * f_236_low60_0_low20_0 + v_236_243 * g_236_low60_0_low20_0 = f_236_low60_0_low20_7 * (const 64 (-(2**20))),
    r_236_243 * f_236_low60_0_low20_0 + s_236_243 * g_236_low60_0_low20_0 = g_236_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_7 + u_236_243 * (const 64 (2**21)) + v_236_243 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_7 + r_236_243 * (const 64 (2**21)) + s_236_243 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_7,
    f_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_7,
    g_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 243)) <=s delta, delta <=s (const 64 (1 + 2*243)),
    (const 64 (-(2**20))) <=s u_236_243, u_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_243, v_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_243, r_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_243, s_236_243 <=s (const 64 ((2**20))),
    u_236_243 + v_236_243 <=s (const 64 (2**20)),
    u_236_243 - v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 + v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 - v_236_243 <=s (const 64 (2**20)),
    r_236_243 + s_236_243 <=s (const 64 (2**20)),
    r_236_243 - s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 + s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 - s_236_243 <=s (const 64 (2**20)),
    u_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_236_243 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step243

// premise a
assume
g_236_low60_0_low20_7 = 0 (mod 2)
&&
g_236_low60_0_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_8 f_236_low60_0_low20_7;
mov u_236_244 u_236_243;
mov v_236_244 v_236_243;

asr g_236_low60_0_low20_8 g_236_low60_0_low20_7 1;
asr r_236_244 r_236_243 1;
asr s_236_244 s_236_243 1;
assert
    true
&&
    f_236_low60_0_low20_8 = f_236_low60_0_low20_7,
    u_236_244 = u_236_243,
    v_236_244 = v_236_243,
    g_236_low60_0_low20_8 * (const 64 2) = g_236_low60_0_low20_7,
    r_236_244 * (const 64 2) = r_236_243,
    s_236_244 * (const 64 2) = s_236_243
;

assume
    f_236_low60_0_low20_8 = f_236_low60_0_low20_7,
    u_236_244 = u_236_243,
    v_236_244 = v_236_243,
    g_236_low60_0_low20_8 * 2 = g_236_low60_0_low20_7,
    r_236_244 * 2 = r_236_243,
    s_236_244 * 2 = s_236_243
&&
    true
;

{
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_8 + u_236_244 * (const 64 (2**21)) + v_236_244 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_8 + r_236_244 * (const 64 (2**21)) + s_236_244 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_8,
    f_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_8,
    g_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 244)) <=s delta, delta <=s (const 64 (1 + 2*244)),
    (const 64 (-(2**20))) <=s u_236_244, u_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_244, v_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_244, r_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_244, s_236_244 <=s (const 64 ((2**20))),
    u_236_244 + v_236_244 <=s (const 64 (2**20)),
    u_236_244 - v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 + v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 - v_236_244 <=s (const 64 (2**20)),
    r_236_244 + s_236_244 <=s (const 64 (2**20)),
    r_236_244 - s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 + s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 - s_236_244 <=s (const 64 (2**20)),
    u_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_236_244 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_243_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_7,
sint64 g_236_low60_0_low20_7,
sint64 f_236_low60_0_low20_8,
sint64 g_236_low60_0_low20_8,
sint64 u_236_243,
sint64 v_236_243,
sint64 r_236_243,
sint64 s_236_243,
sint64 u_236_244,
sint64 v_236_244,
sint64 r_236_244,
sint64 s_236_244,
bit ne
)={
    u_236_243 * f_236_low60_0_low20_0 + v_236_243 * g_236_low60_0_low20_0 = f_236_low60_0_low20_7 * (-(2**20)),
    r_236_243 * f_236_low60_0_low20_0 + s_236_243 * g_236_low60_0_low20_0 = g_236_low60_0_low20_7 * (-(2**20))
&&
    u_236_243 * f_236_low60_0_low20_0 + v_236_243 * g_236_low60_0_low20_0 = f_236_low60_0_low20_7 * (const 64 (-(2**20))),
    r_236_243 * f_236_low60_0_low20_0 + s_236_243 * g_236_low60_0_low20_0 = g_236_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_7 + u_236_243 * (const 64 (2**21)) + v_236_243 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_7 + r_236_243 * (const 64 (2**21)) + s_236_243 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_7,
    f_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_7,
    g_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 243)) <=s delta, delta <=s (const 64 (1 + 2*243)),
    (const 64 (-(2**20))) <=s u_236_243, u_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_243, v_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_243, r_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_243, s_236_243 <=s (const 64 ((2**20))),
    u_236_243 + v_236_243 <=s (const 64 (2**20)),
    u_236_243 - v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 + v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 - v_236_243 <=s (const 64 (2**20)),
    r_236_243 + s_236_243 <=s (const 64 (2**20)),
    r_236_243 - s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 + s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 - s_236_243 <=s (const 64 (2**20)),
    u_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_236_243 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step243

// premise b
assume
g_236_low60_0_low20_7 = 1 (mod 2)
&&
g_236_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_8 f_236_low60_0_low20_7;
mov u_236_244 u_236_243;
mov v_236_244 v_236_243;

add g_236_low60_0_low20_8 g_236_low60_0_low20_7 f_236_low60_0_low20_7;
asr g_236_low60_0_low20_8 g_236_low60_0_low20_8 1;
add r_236_244 r_236_243 u_236_243;
asr r_236_244 r_236_244 1;
add s_236_244 s_236_243 v_236_243;
asr s_236_244 s_236_244 1;
assert
    true
&&
    f_236_low60_0_low20_8 = f_236_low60_0_low20_7,
    u_236_244 = u_236_243,
    v_236_244 = v_236_243,
    g_236_low60_0_low20_8 * (const 64 2) = g_236_low60_0_low20_7 + f_236_low60_0_low20_7,
    r_236_244 * (const 64 2) = r_236_243 + u_236_243,
    s_236_244 * (const 64 2) = s_236_243 + v_236_243
;

assume
    f_236_low60_0_low20_8 = f_236_low60_0_low20_7,
    u_236_244 = u_236_243,
    v_236_244 = v_236_243,
    g_236_low60_0_low20_8 * 2 = g_236_low60_0_low20_7 + f_236_low60_0_low20_7,
    r_236_244 * 2 = r_236_243 + u_236_243,
    s_236_244 * 2 = s_236_243 + v_236_243
&&
    true
;

{
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_8 + u_236_244 * (const 64 (2**21)) + v_236_244 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_8 + r_236_244 * (const 64 (2**21)) + s_236_244 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_8,
    f_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_8,
    g_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 244)) <=s delta, delta <=s (const 64 (1 + 2*244)),
    (const 64 (-(2**20))) <=s u_236_244, u_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_244, v_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_244, r_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_244, s_236_244 <=s (const 64 ((2**20))),
    u_236_244 + v_236_244 <=s (const 64 (2**20)),
    u_236_244 - v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 + v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 - v_236_244 <=s (const 64 (2**20)),
    r_236_244 + s_236_244 <=s (const 64 (2**20)),
    r_236_244 - s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 + s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 - s_236_244 <=s (const 64 (2**20)),
    u_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_236_244 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_243_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_7,
sint64 g_236_low60_0_low20_7,
sint64 f_236_low60_0_low20_8,
sint64 g_236_low60_0_low20_8,
sint64 u_236_243,
sint64 v_236_243,
sint64 r_236_243,
sint64 s_236_243,
sint64 u_236_244,
sint64 v_236_244,
sint64 r_236_244,
sint64 s_236_244,
bit ne
)={
    u_236_243 * f_236_low60_0_low20_0 + v_236_243 * g_236_low60_0_low20_0 = f_236_low60_0_low20_7 * (-(2**20)),
    r_236_243 * f_236_low60_0_low20_0 + s_236_243 * g_236_low60_0_low20_0 = g_236_low60_0_low20_7 * (-(2**20))
&&
    u_236_243 * f_236_low60_0_low20_0 + v_236_243 * g_236_low60_0_low20_0 = f_236_low60_0_low20_7 * (const 64 (-(2**20))),
    r_236_243 * f_236_low60_0_low20_0 + s_236_243 * g_236_low60_0_low20_0 = g_236_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_7 + u_236_243 * (const 64 (2**21)) + v_236_243 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_7 + r_236_243 * (const 64 (2**21)) + s_236_243 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_7,
    f_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_7,
    g_236_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 243)) <=s delta, delta <=s (const 64 (1 + 2*243)),
    (const 64 (-(2**20))) <=s u_236_243, u_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_243, v_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_243, r_236_243 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_243, s_236_243 <=s (const 64 ((2**20))),
    u_236_243 + v_236_243 <=s (const 64 (2**20)),
    u_236_243 - v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 + v_236_243 <=s (const 64 (2**20)),
    (const 64 0) - u_236_243 - v_236_243 <=s (const 64 (2**20)),
    r_236_243 + s_236_243 <=s (const 64 (2**20)),
    r_236_243 - s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 + s_236_243 <=s (const 64 (2**20)),
    (const 64 0) - r_236_243 - s_236_243 <=s (const 64 (2**20)),
    u_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_236_243 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_236_243 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step243

// premise c
assume
g_236_low60_0_low20_7 = 1 (mod 2)
&&
g_236_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_8 g_236_low60_0_low20_7;
mov u_236_244 r_236_243;
mov v_236_244 s_236_243;

subs dc g_236_low60_0_low20_8 g_236_low60_0_low20_7 f_236_low60_0_low20_7;
asr g_236_low60_0_low20_8 g_236_low60_0_low20_8 1;
subs dc r_236_244 r_236_243 u_236_243;
asr r_236_244 r_236_244 1;
subs dc s_236_244 s_236_243 v_236_243;
asr s_236_244 s_236_244 1;
assert
    true
&&
    f_236_low60_0_low20_8 = g_236_low60_0_low20_7,
    u_236_244 = r_236_243,
    v_236_244 = s_236_243,
    g_236_low60_0_low20_8 * (const 64 2) = g_236_low60_0_low20_7 - f_236_low60_0_low20_7,
    r_236_244 * (const 64 2) = r_236_243 - u_236_243,
    s_236_244 * (const 64 2) = s_236_243 - v_236_243
;

assume
    f_236_low60_0_low20_8 = g_236_low60_0_low20_7,
    u_236_244 = r_236_243,
    v_236_244 = s_236_243,
    g_236_low60_0_low20_8 * 2 = g_236_low60_0_low20_7 - f_236_low60_0_low20_7,
    r_236_244 * 2 = r_236_243 - u_236_243,
    s_236_244 * 2 = s_236_243 - v_236_243
&&
    true
;

{
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_8 + u_236_244 * (const 64 (2**21)) + v_236_244 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_8 + r_236_244 * (const 64 (2**21)) + s_236_244 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_8,
    f_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_8,
    g_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 244)) <=s delta, delta <=s (const 64 (1 + 2*244)),
    (const 64 (-(2**20))) <=s u_236_244, u_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_244, v_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_244, r_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_244, s_236_244 <=s (const 64 ((2**20))),
    u_236_244 + v_236_244 <=s (const 64 (2**20)),
    u_236_244 - v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 + v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 - v_236_244 <=s (const 64 (2**20)),
    r_236_244 + s_236_244 <=s (const 64 (2**20)),
    r_236_244 - s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 + s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 - s_236_244 <=s (const 64 (2**20)),
    u_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_236_244 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_244_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_8,
sint64 g_236_low60_0_low20_8,
sint64 f_236_low60_0_low20_9,
sint64 g_236_low60_0_low20_9,
sint64 u_236_244,
sint64 v_236_244,
sint64 r_236_244,
sint64 s_236_244,
sint64 u_236_245,
sint64 v_236_245,
sint64 r_236_245,
sint64 s_236_245,
bit ne
)={
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (-(2**20)),
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (-(2**20))
&&
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (const 64 (-(2**20))),
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_8 + u_236_244 * (const 64 (2**21)) + v_236_244 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_8 + r_236_244 * (const 64 (2**21)) + s_236_244 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_8,
    f_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_8,
    g_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 244)) <=s delta, delta <=s (const 64 (1 + 2*244)),
    (const 64 (-(2**20))) <=s u_236_244, u_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_244, v_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_244, r_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_244, s_236_244 <=s (const 64 ((2**20))),
    u_236_244 + v_236_244 <=s (const 64 (2**20)),
    u_236_244 - v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 + v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 - v_236_244 <=s (const 64 (2**20)),
    r_236_244 + s_236_244 <=s (const 64 (2**20)),
    r_236_244 - s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 + s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 - s_236_244 <=s (const 64 (2**20)),
    u_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_236_244 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step244

// premise a
assume
g_236_low60_0_low20_8 = 0 (mod 2)
&&
g_236_low60_0_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_9 f_236_low60_0_low20_8;
mov u_236_245 u_236_244;
mov v_236_245 v_236_244;

asr g_236_low60_0_low20_9 g_236_low60_0_low20_8 1;
asr r_236_245 r_236_244 1;
asr s_236_245 s_236_244 1;
assert
    true
&&
    f_236_low60_0_low20_9 = f_236_low60_0_low20_8,
    u_236_245 = u_236_244,
    v_236_245 = v_236_244,
    g_236_low60_0_low20_9 * (const 64 2) = g_236_low60_0_low20_8,
    r_236_245 * (const 64 2) = r_236_244,
    s_236_245 * (const 64 2) = s_236_244
;

assume
    f_236_low60_0_low20_9 = f_236_low60_0_low20_8,
    u_236_245 = u_236_244,
    v_236_245 = v_236_244,
    g_236_low60_0_low20_9 * 2 = g_236_low60_0_low20_8,
    r_236_245 * 2 = r_236_244,
    s_236_245 * 2 = s_236_244
&&
    true
;

{
    u_236_245 * f_236_low60_0_low20_0 + v_236_245 * g_236_low60_0_low20_0 = f_236_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_245 * f_236_low60_0_low20_0 + s_236_245 * g_236_low60_0_low20_0 = g_236_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_9 + u_236_245 * (const 64 (2**21)) + v_236_245 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_9 + r_236_245 * (const 64 (2**21)) + s_236_245 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_9,
    f_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_9,
    g_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 245)) <=s delta, delta <=s (const 64 (1 + 2*245)),
    (const 64 (-(2**20))) <=s u_236_245, u_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_245, v_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_245, r_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_245, s_236_245 <=s (const 64 ((2**20))),
    u_236_245 + v_236_245 <=s (const 64 (2**20)),
    u_236_245 - v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 + v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 - v_236_245 <=s (const 64 (2**20)),
    r_236_245 + s_236_245 <=s (const 64 (2**20)),
    r_236_245 - s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 + s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 - s_236_245 <=s (const 64 (2**20)),
    u_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_236_245 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_244_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_8,
sint64 g_236_low60_0_low20_8,
sint64 f_236_low60_0_low20_9,
sint64 g_236_low60_0_low20_9,
sint64 u_236_244,
sint64 v_236_244,
sint64 r_236_244,
sint64 s_236_244,
sint64 u_236_245,
sint64 v_236_245,
sint64 r_236_245,
sint64 s_236_245,
bit ne
)={
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (-(2**20)),
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (-(2**20))
&&
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (const 64 (-(2**20))),
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_8 + u_236_244 * (const 64 (2**21)) + v_236_244 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_8 + r_236_244 * (const 64 (2**21)) + s_236_244 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_8,
    f_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_8,
    g_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 244)) <=s delta, delta <=s (const 64 (1 + 2*244)),
    (const 64 (-(2**20))) <=s u_236_244, u_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_244, v_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_244, r_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_244, s_236_244 <=s (const 64 ((2**20))),
    u_236_244 + v_236_244 <=s (const 64 (2**20)),
    u_236_244 - v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 + v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 - v_236_244 <=s (const 64 (2**20)),
    r_236_244 + s_236_244 <=s (const 64 (2**20)),
    r_236_244 - s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 + s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 - s_236_244 <=s (const 64 (2**20)),
    u_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_236_244 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step244

// premise b
assume
g_236_low60_0_low20_8 = 1 (mod 2)
&&
g_236_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_9 f_236_low60_0_low20_8;
mov u_236_245 u_236_244;
mov v_236_245 v_236_244;

add g_236_low60_0_low20_9 g_236_low60_0_low20_8 f_236_low60_0_low20_8;
asr g_236_low60_0_low20_9 g_236_low60_0_low20_9 1;
add r_236_245 r_236_244 u_236_244;
asr r_236_245 r_236_245 1;
add s_236_245 s_236_244 v_236_244;
asr s_236_245 s_236_245 1;
assert
    true
&&
    f_236_low60_0_low20_9 = f_236_low60_0_low20_8,
    u_236_245 = u_236_244,
    v_236_245 = v_236_244,
    g_236_low60_0_low20_9 * (const 64 2) = g_236_low60_0_low20_8 + f_236_low60_0_low20_8,
    r_236_245 * (const 64 2) = r_236_244 + u_236_244,
    s_236_245 * (const 64 2) = s_236_244 + v_236_244
;

assume
    f_236_low60_0_low20_9 = f_236_low60_0_low20_8,
    u_236_245 = u_236_244,
    v_236_245 = v_236_244,
    g_236_low60_0_low20_9 * 2 = g_236_low60_0_low20_8 + f_236_low60_0_low20_8,
    r_236_245 * 2 = r_236_244 + u_236_244,
    s_236_245 * 2 = s_236_244 + v_236_244
&&
    true
;

{
    u_236_245 * f_236_low60_0_low20_0 + v_236_245 * g_236_low60_0_low20_0 = f_236_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_245 * f_236_low60_0_low20_0 + s_236_245 * g_236_low60_0_low20_0 = g_236_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_9 + u_236_245 * (const 64 (2**21)) + v_236_245 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_9 + r_236_245 * (const 64 (2**21)) + s_236_245 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_9,
    f_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_9,
    g_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 245)) <=s delta, delta <=s (const 64 (1 + 2*245)),
    (const 64 (-(2**20))) <=s u_236_245, u_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_245, v_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_245, r_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_245, s_236_245 <=s (const 64 ((2**20))),
    u_236_245 + v_236_245 <=s (const 64 (2**20)),
    u_236_245 - v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 + v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 - v_236_245 <=s (const 64 (2**20)),
    r_236_245 + s_236_245 <=s (const 64 (2**20)),
    r_236_245 - s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 + s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 - s_236_245 <=s (const 64 (2**20)),
    u_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_236_245 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_244_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_8,
sint64 g_236_low60_0_low20_8,
sint64 f_236_low60_0_low20_9,
sint64 g_236_low60_0_low20_9,
sint64 u_236_244,
sint64 v_236_244,
sint64 r_236_244,
sint64 s_236_244,
sint64 u_236_245,
sint64 v_236_245,
sint64 r_236_245,
sint64 s_236_245,
bit ne
)={
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (-(2**20)),
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (-(2**20))
&&
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (const 64 (-(2**20))),
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_8 + u_236_244 * (const 64 (2**21)) + v_236_244 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_8 + r_236_244 * (const 64 (2**21)) + s_236_244 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_8,
    f_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_8,
    g_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 244)) <=s delta, delta <=s (const 64 (1 + 2*244)),
    (const 64 (-(2**20))) <=s u_236_244, u_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_244, v_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_244, r_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_244, s_236_244 <=s (const 64 ((2**20))),
    u_236_244 + v_236_244 <=s (const 64 (2**20)),
    u_236_244 - v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 + v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 - v_236_244 <=s (const 64 (2**20)),
    r_236_244 + s_236_244 <=s (const 64 (2**20)),
    r_236_244 - s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 + s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 - s_236_244 <=s (const 64 (2**20)),
    u_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_236_244 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step244

// premise c
assume
g_236_low60_0_low20_8 = 1 (mod 2)
&&
g_236_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_9 g_236_low60_0_low20_8;
mov u_236_245 r_236_244;
mov v_236_245 s_236_244;

subs dc g_236_low60_0_low20_9 g_236_low60_0_low20_8 f_236_low60_0_low20_8;
asr g_236_low60_0_low20_9 g_236_low60_0_low20_9 1;
subs dc r_236_245 r_236_244 u_236_244;
asr r_236_245 r_236_245 1;
subs dc s_236_245 s_236_244 v_236_244;
asr s_236_245 s_236_245 1;
assert
    true
&&
    f_236_low60_0_low20_9 = g_236_low60_0_low20_8,
    u_236_245 = r_236_244,
    v_236_245 = s_236_244,
    g_236_low60_0_low20_9 * (const 64 2) = g_236_low60_0_low20_8 - f_236_low60_0_low20_8,
    r_236_245 * (const 64 2) = r_236_244 - u_236_244,
    s_236_245 * (const 64 2) = s_236_244 - v_236_244
;

assume
    f_236_low60_0_low20_9 = g_236_low60_0_low20_8,
    u_236_245 = r_236_244,
    v_236_245 = s_236_244,
    g_236_low60_0_low20_9 * 2 = g_236_low60_0_low20_8 - f_236_low60_0_low20_8,
    r_236_245 * 2 = r_236_244 - u_236_244,
    s_236_245 * 2 = s_236_244 - v_236_244
&&
    true
;

{
    u_236_245 * f_236_low60_0_low20_0 + v_236_245 * g_236_low60_0_low20_0 = f_236_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_245 * f_236_low60_0_low20_0 + s_236_245 * g_236_low60_0_low20_0 = g_236_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_9 + u_236_245 * (const 64 (2**21)) + v_236_245 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_9 + r_236_245 * (const 64 (2**21)) + s_236_245 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_9,
    f_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_9,
    g_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 245)) <=s delta, delta <=s (const 64 (1 + 2*245)),
    (const 64 (-(2**20))) <=s u_236_245, u_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_245, v_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_245, r_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_245, s_236_245 <=s (const 64 ((2**20))),
    u_236_245 + v_236_245 <=s (const 64 (2**20)),
    u_236_245 - v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 + v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 - v_236_245 <=s (const 64 (2**20)),
    r_236_245 + s_236_245 <=s (const 64 (2**20)),
    r_236_245 - s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 + s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 - s_236_245 <=s (const 64 (2**20)),
    u_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_236_245 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_245_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_9,
sint64 g_236_low60_0_low20_9,
sint64 f_236_low60_0_low20_10,
sint64 g_236_low60_0_low20_10,
sint64 u_236_245,
sint64 v_236_245,
sint64 r_236_245,
sint64 s_236_245,
sint64 u_236_246,
sint64 v_236_246,
sint64 r_236_246,
sint64 s_236_246,
bit ne
)={
    u_236_245 * f_236_low60_0_low20_0 + v_236_245 * g_236_low60_0_low20_0 = f_236_low60_0_low20_9 * (-(2**20)),
    r_236_245 * f_236_low60_0_low20_0 + s_236_245 * g_236_low60_0_low20_0 = g_236_low60_0_low20_9 * (-(2**20))
&&
    u_236_245 * f_236_low60_0_low20_0 + v_236_245 * g_236_low60_0_low20_0 = f_236_low60_0_low20_9 * (const 64 (-(2**20))),
    r_236_245 * f_236_low60_0_low20_0 + s_236_245 * g_236_low60_0_low20_0 = g_236_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_9 + u_236_245 * (const 64 (2**21)) + v_236_245 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_9 + r_236_245 * (const 64 (2**21)) + s_236_245 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_9,
    f_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_9,
    g_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 245)) <=s delta, delta <=s (const 64 (1 + 2*245)),
    (const 64 (-(2**20))) <=s u_236_245, u_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_245, v_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_245, r_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_245, s_236_245 <=s (const 64 ((2**20))),
    u_236_245 + v_236_245 <=s (const 64 (2**20)),
    u_236_245 - v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 + v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 - v_236_245 <=s (const 64 (2**20)),
    r_236_245 + s_236_245 <=s (const 64 (2**20)),
    r_236_245 - s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 + s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 - s_236_245 <=s (const 64 (2**20)),
    u_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_236_245 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step245

// premise a
assume
g_236_low60_0_low20_9 = 0 (mod 2)
&&
g_236_low60_0_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_10 f_236_low60_0_low20_9;
mov u_236_246 u_236_245;
mov v_236_246 v_236_245;

asr g_236_low60_0_low20_10 g_236_low60_0_low20_9 1;
asr r_236_246 r_236_245 1;
asr s_236_246 s_236_245 1;
assert
    true
&&
    f_236_low60_0_low20_10 = f_236_low60_0_low20_9,
    u_236_246 = u_236_245,
    v_236_246 = v_236_245,
    g_236_low60_0_low20_10 * (const 64 2) = g_236_low60_0_low20_9,
    r_236_246 * (const 64 2) = r_236_245,
    s_236_246 * (const 64 2) = s_236_245
;

assume
    f_236_low60_0_low20_10 = f_236_low60_0_low20_9,
    u_236_246 = u_236_245,
    v_236_246 = v_236_245,
    g_236_low60_0_low20_10 * 2 = g_236_low60_0_low20_9,
    r_236_246 * 2 = r_236_245,
    s_236_246 * 2 = s_236_245
&&
    true
;

{
    u_236_246 * f_236_low60_0_low20_0 + v_236_246 * g_236_low60_0_low20_0 = f_236_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_246 * f_236_low60_0_low20_0 + s_236_246 * g_236_low60_0_low20_0 = g_236_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_10 + u_236_246 * (const 64 (2**21)) + v_236_246 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_10 + r_236_246 * (const 64 (2**21)) + s_236_246 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_10,
    f_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_10,
    g_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 246)) <=s delta, delta <=s (const 64 (1 + 2*246)),
    (const 64 (-(2**20))) <=s u_236_246, u_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_246, v_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_246, r_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_246, s_236_246 <=s (const 64 ((2**20))),
    u_236_246 + v_236_246 <=s (const 64 (2**20)),
    u_236_246 - v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 + v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 - v_236_246 <=s (const 64 (2**20)),
    r_236_246 + s_236_246 <=s (const 64 (2**20)),
    r_236_246 - s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 + s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 - s_236_246 <=s (const 64 (2**20)),
    u_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_236_246 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_245_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_9,
sint64 g_236_low60_0_low20_9,
sint64 f_236_low60_0_low20_10,
sint64 g_236_low60_0_low20_10,
sint64 u_236_245,
sint64 v_236_245,
sint64 r_236_245,
sint64 s_236_245,
sint64 u_236_246,
sint64 v_236_246,
sint64 r_236_246,
sint64 s_236_246,
bit ne
)={
    u_236_245 * f_236_low60_0_low20_0 + v_236_245 * g_236_low60_0_low20_0 = f_236_low60_0_low20_9 * (-(2**20)),
    r_236_245 * f_236_low60_0_low20_0 + s_236_245 * g_236_low60_0_low20_0 = g_236_low60_0_low20_9 * (-(2**20))
&&
    u_236_245 * f_236_low60_0_low20_0 + v_236_245 * g_236_low60_0_low20_0 = f_236_low60_0_low20_9 * (const 64 (-(2**20))),
    r_236_245 * f_236_low60_0_low20_0 + s_236_245 * g_236_low60_0_low20_0 = g_236_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_9 + u_236_245 * (const 64 (2**21)) + v_236_245 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_9 + r_236_245 * (const 64 (2**21)) + s_236_245 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_9,
    f_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_9,
    g_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 245)) <=s delta, delta <=s (const 64 (1 + 2*245)),
    (const 64 (-(2**20))) <=s u_236_245, u_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_245, v_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_245, r_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_245, s_236_245 <=s (const 64 ((2**20))),
    u_236_245 + v_236_245 <=s (const 64 (2**20)),
    u_236_245 - v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 + v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 - v_236_245 <=s (const 64 (2**20)),
    r_236_245 + s_236_245 <=s (const 64 (2**20)),
    r_236_245 - s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 + s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 - s_236_245 <=s (const 64 (2**20)),
    u_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_236_245 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step245

// premise b
assume
g_236_low60_0_low20_9 = 1 (mod 2)
&&
g_236_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_10 f_236_low60_0_low20_9;
mov u_236_246 u_236_245;
mov v_236_246 v_236_245;

add g_236_low60_0_low20_10 g_236_low60_0_low20_9 f_236_low60_0_low20_9;
asr g_236_low60_0_low20_10 g_236_low60_0_low20_10 1;
add r_236_246 r_236_245 u_236_245;
asr r_236_246 r_236_246 1;
add s_236_246 s_236_245 v_236_245;
asr s_236_246 s_236_246 1;
assert
    true
&&
    f_236_low60_0_low20_10 = f_236_low60_0_low20_9,
    u_236_246 = u_236_245,
    v_236_246 = v_236_245,
    g_236_low60_0_low20_10 * (const 64 2) = g_236_low60_0_low20_9 + f_236_low60_0_low20_9,
    r_236_246 * (const 64 2) = r_236_245 + u_236_245,
    s_236_246 * (const 64 2) = s_236_245 + v_236_245
;

assume
    f_236_low60_0_low20_10 = f_236_low60_0_low20_9,
    u_236_246 = u_236_245,
    v_236_246 = v_236_245,
    g_236_low60_0_low20_10 * 2 = g_236_low60_0_low20_9 + f_236_low60_0_low20_9,
    r_236_246 * 2 = r_236_245 + u_236_245,
    s_236_246 * 2 = s_236_245 + v_236_245
&&
    true
;

{
    u_236_246 * f_236_low60_0_low20_0 + v_236_246 * g_236_low60_0_low20_0 = f_236_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_246 * f_236_low60_0_low20_0 + s_236_246 * g_236_low60_0_low20_0 = g_236_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_10 + u_236_246 * (const 64 (2**21)) + v_236_246 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_10 + r_236_246 * (const 64 (2**21)) + s_236_246 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_10,
    f_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_10,
    g_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 246)) <=s delta, delta <=s (const 64 (1 + 2*246)),
    (const 64 (-(2**20))) <=s u_236_246, u_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_246, v_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_246, r_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_246, s_236_246 <=s (const 64 ((2**20))),
    u_236_246 + v_236_246 <=s (const 64 (2**20)),
    u_236_246 - v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 + v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 - v_236_246 <=s (const 64 (2**20)),
    r_236_246 + s_236_246 <=s (const 64 (2**20)),
    r_236_246 - s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 + s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 - s_236_246 <=s (const 64 (2**20)),
    u_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_236_246 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_245_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_9,
sint64 g_236_low60_0_low20_9,
sint64 f_236_low60_0_low20_10,
sint64 g_236_low60_0_low20_10,
sint64 u_236_245,
sint64 v_236_245,
sint64 r_236_245,
sint64 s_236_245,
sint64 u_236_246,
sint64 v_236_246,
sint64 r_236_246,
sint64 s_236_246,
bit ne
)={
    u_236_245 * f_236_low60_0_low20_0 + v_236_245 * g_236_low60_0_low20_0 = f_236_low60_0_low20_9 * (-(2**20)),
    r_236_245 * f_236_low60_0_low20_0 + s_236_245 * g_236_low60_0_low20_0 = g_236_low60_0_low20_9 * (-(2**20))
&&
    u_236_245 * f_236_low60_0_low20_0 + v_236_245 * g_236_low60_0_low20_0 = f_236_low60_0_low20_9 * (const 64 (-(2**20))),
    r_236_245 * f_236_low60_0_low20_0 + s_236_245 * g_236_low60_0_low20_0 = g_236_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_9 + u_236_245 * (const 64 (2**21)) + v_236_245 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_9 + r_236_245 * (const 64 (2**21)) + s_236_245 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_9,
    f_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_9,
    g_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 245)) <=s delta, delta <=s (const 64 (1 + 2*245)),
    (const 64 (-(2**20))) <=s u_236_245, u_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_245, v_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_245, r_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_245, s_236_245 <=s (const 64 ((2**20))),
    u_236_245 + v_236_245 <=s (const 64 (2**20)),
    u_236_245 - v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 + v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 - v_236_245 <=s (const 64 (2**20)),
    r_236_245 + s_236_245 <=s (const 64 (2**20)),
    r_236_245 - s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 + s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 - s_236_245 <=s (const 64 (2**20)),
    u_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_236_245 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step245

// premise c
assume
g_236_low60_0_low20_9 = 1 (mod 2)
&&
g_236_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_10 g_236_low60_0_low20_9;
mov u_236_246 r_236_245;
mov v_236_246 s_236_245;

subs dc g_236_low60_0_low20_10 g_236_low60_0_low20_9 f_236_low60_0_low20_9;
asr g_236_low60_0_low20_10 g_236_low60_0_low20_10 1;
subs dc r_236_246 r_236_245 u_236_245;
asr r_236_246 r_236_246 1;
subs dc s_236_246 s_236_245 v_236_245;
asr s_236_246 s_236_246 1;
assert
    true
&&
    f_236_low60_0_low20_10 = g_236_low60_0_low20_9,
    u_236_246 = r_236_245,
    v_236_246 = s_236_245,
    g_236_low60_0_low20_10 * (const 64 2) = g_236_low60_0_low20_9 - f_236_low60_0_low20_9,
    r_236_246 * (const 64 2) = r_236_245 - u_236_245,
    s_236_246 * (const 64 2) = s_236_245 - v_236_245
;

assume
    f_236_low60_0_low20_10 = g_236_low60_0_low20_9,
    u_236_246 = r_236_245,
    v_236_246 = s_236_245,
    g_236_low60_0_low20_10 * 2 = g_236_low60_0_low20_9 - f_236_low60_0_low20_9,
    r_236_246 * 2 = r_236_245 - u_236_245,
    s_236_246 * 2 = s_236_245 - v_236_245
&&
    true
;

{
    u_236_246 * f_236_low60_0_low20_0 + v_236_246 * g_236_low60_0_low20_0 = f_236_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_246 * f_236_low60_0_low20_0 + s_236_246 * g_236_low60_0_low20_0 = g_236_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_10 + u_236_246 * (const 64 (2**21)) + v_236_246 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_10 + r_236_246 * (const 64 (2**21)) + s_236_246 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_10,
    f_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_10,
    g_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 246)) <=s delta, delta <=s (const 64 (1 + 2*246)),
    (const 64 (-(2**20))) <=s u_236_246, u_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_246, v_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_246, r_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_246, s_236_246 <=s (const 64 ((2**20))),
    u_236_246 + v_236_246 <=s (const 64 (2**20)),
    u_236_246 - v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 + v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 - v_236_246 <=s (const 64 (2**20)),
    r_236_246 + s_236_246 <=s (const 64 (2**20)),
    r_236_246 - s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 + s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 - s_236_246 <=s (const 64 (2**20)),
    u_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_236_246 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_246_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_10,
sint64 g_236_low60_0_low20_10,
sint64 f_236_low60_0_low20_11,
sint64 g_236_low60_0_low20_11,
sint64 u_236_246,
sint64 v_236_246,
sint64 r_236_246,
sint64 s_236_246,
sint64 u_236_247,
sint64 v_236_247,
sint64 r_236_247,
sint64 s_236_247,
bit ne
)={
    u_236_246 * f_236_low60_0_low20_0 + v_236_246 * g_236_low60_0_low20_0 = f_236_low60_0_low20_10 * (-(2**20)),
    r_236_246 * f_236_low60_0_low20_0 + s_236_246 * g_236_low60_0_low20_0 = g_236_low60_0_low20_10 * (-(2**20))
&&
    u_236_246 * f_236_low60_0_low20_0 + v_236_246 * g_236_low60_0_low20_0 = f_236_low60_0_low20_10 * (const 64 (-(2**20))),
    r_236_246 * f_236_low60_0_low20_0 + s_236_246 * g_236_low60_0_low20_0 = g_236_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_10 + u_236_246 * (const 64 (2**21)) + v_236_246 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_10 + r_236_246 * (const 64 (2**21)) + s_236_246 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_10,
    f_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_10,
    g_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 246)) <=s delta, delta <=s (const 64 (1 + 2*246)),
    (const 64 (-(2**20))) <=s u_236_246, u_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_246, v_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_246, r_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_246, s_236_246 <=s (const 64 ((2**20))),
    u_236_246 + v_236_246 <=s (const 64 (2**20)),
    u_236_246 - v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 + v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 - v_236_246 <=s (const 64 (2**20)),
    r_236_246 + s_236_246 <=s (const 64 (2**20)),
    r_236_246 - s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 + s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 - s_236_246 <=s (const 64 (2**20)),
    u_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_236_246 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step246

// premise a
assume
g_236_low60_0_low20_10 = 0 (mod 2)
&&
g_236_low60_0_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_11 f_236_low60_0_low20_10;
mov u_236_247 u_236_246;
mov v_236_247 v_236_246;

asr g_236_low60_0_low20_11 g_236_low60_0_low20_10 1;
asr r_236_247 r_236_246 1;
asr s_236_247 s_236_246 1;
assert
    true
&&
    f_236_low60_0_low20_11 = f_236_low60_0_low20_10,
    u_236_247 = u_236_246,
    v_236_247 = v_236_246,
    g_236_low60_0_low20_11 * (const 64 2) = g_236_low60_0_low20_10,
    r_236_247 * (const 64 2) = r_236_246,
    s_236_247 * (const 64 2) = s_236_246
;

assume
    f_236_low60_0_low20_11 = f_236_low60_0_low20_10,
    u_236_247 = u_236_246,
    v_236_247 = v_236_246,
    g_236_low60_0_low20_11 * 2 = g_236_low60_0_low20_10,
    r_236_247 * 2 = r_236_246,
    s_236_247 * 2 = s_236_246
&&
    true
;

{
    u_236_247 * f_236_low60_0_low20_0 + v_236_247 * g_236_low60_0_low20_0 = f_236_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_247 * f_236_low60_0_low20_0 + s_236_247 * g_236_low60_0_low20_0 = g_236_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_11 + u_236_247 * (const 64 (2**21)) + v_236_247 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_11 + r_236_247 * (const 64 (2**21)) + s_236_247 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_11,
    f_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_11,
    g_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 247)) <=s delta, delta <=s (const 64 (1 + 2*247)),
    (const 64 (-(2**20))) <=s u_236_247, u_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_247, v_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_247, r_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_247, s_236_247 <=s (const 64 ((2**20))),
    u_236_247 + v_236_247 <=s (const 64 (2**20)),
    u_236_247 - v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 + v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 - v_236_247 <=s (const 64 (2**20)),
    r_236_247 + s_236_247 <=s (const 64 (2**20)),
    r_236_247 - s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 + s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 - s_236_247 <=s (const 64 (2**20)),
    u_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_236_247 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_246_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_10,
sint64 g_236_low60_0_low20_10,
sint64 f_236_low60_0_low20_11,
sint64 g_236_low60_0_low20_11,
sint64 u_236_246,
sint64 v_236_246,
sint64 r_236_246,
sint64 s_236_246,
sint64 u_236_247,
sint64 v_236_247,
sint64 r_236_247,
sint64 s_236_247,
bit ne
)={
    u_236_246 * f_236_low60_0_low20_0 + v_236_246 * g_236_low60_0_low20_0 = f_236_low60_0_low20_10 * (-(2**20)),
    r_236_246 * f_236_low60_0_low20_0 + s_236_246 * g_236_low60_0_low20_0 = g_236_low60_0_low20_10 * (-(2**20))
&&
    u_236_246 * f_236_low60_0_low20_0 + v_236_246 * g_236_low60_0_low20_0 = f_236_low60_0_low20_10 * (const 64 (-(2**20))),
    r_236_246 * f_236_low60_0_low20_0 + s_236_246 * g_236_low60_0_low20_0 = g_236_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_10 + u_236_246 * (const 64 (2**21)) + v_236_246 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_10 + r_236_246 * (const 64 (2**21)) + s_236_246 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_10,
    f_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_10,
    g_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 246)) <=s delta, delta <=s (const 64 (1 + 2*246)),
    (const 64 (-(2**20))) <=s u_236_246, u_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_246, v_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_246, r_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_246, s_236_246 <=s (const 64 ((2**20))),
    u_236_246 + v_236_246 <=s (const 64 (2**20)),
    u_236_246 - v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 + v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 - v_236_246 <=s (const 64 (2**20)),
    r_236_246 + s_236_246 <=s (const 64 (2**20)),
    r_236_246 - s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 + s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 - s_236_246 <=s (const 64 (2**20)),
    u_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_236_246 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step246

// premise b
assume
g_236_low60_0_low20_10 = 1 (mod 2)
&&
g_236_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_11 f_236_low60_0_low20_10;
mov u_236_247 u_236_246;
mov v_236_247 v_236_246;

add g_236_low60_0_low20_11 g_236_low60_0_low20_10 f_236_low60_0_low20_10;
asr g_236_low60_0_low20_11 g_236_low60_0_low20_11 1;
add r_236_247 r_236_246 u_236_246;
asr r_236_247 r_236_247 1;
add s_236_247 s_236_246 v_236_246;
asr s_236_247 s_236_247 1;
assert
    true
&&
    f_236_low60_0_low20_11 = f_236_low60_0_low20_10,
    u_236_247 = u_236_246,
    v_236_247 = v_236_246,
    g_236_low60_0_low20_11 * (const 64 2) = g_236_low60_0_low20_10 + f_236_low60_0_low20_10,
    r_236_247 * (const 64 2) = r_236_246 + u_236_246,
    s_236_247 * (const 64 2) = s_236_246 + v_236_246
;

assume
    f_236_low60_0_low20_11 = f_236_low60_0_low20_10,
    u_236_247 = u_236_246,
    v_236_247 = v_236_246,
    g_236_low60_0_low20_11 * 2 = g_236_low60_0_low20_10 + f_236_low60_0_low20_10,
    r_236_247 * 2 = r_236_246 + u_236_246,
    s_236_247 * 2 = s_236_246 + v_236_246
&&
    true
;

{
    u_236_247 * f_236_low60_0_low20_0 + v_236_247 * g_236_low60_0_low20_0 = f_236_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_247 * f_236_low60_0_low20_0 + s_236_247 * g_236_low60_0_low20_0 = g_236_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_11 + u_236_247 * (const 64 (2**21)) + v_236_247 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_11 + r_236_247 * (const 64 (2**21)) + s_236_247 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_11,
    f_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_11,
    g_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 247)) <=s delta, delta <=s (const 64 (1 + 2*247)),
    (const 64 (-(2**20))) <=s u_236_247, u_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_247, v_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_247, r_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_247, s_236_247 <=s (const 64 ((2**20))),
    u_236_247 + v_236_247 <=s (const 64 (2**20)),
    u_236_247 - v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 + v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 - v_236_247 <=s (const 64 (2**20)),
    r_236_247 + s_236_247 <=s (const 64 (2**20)),
    r_236_247 - s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 + s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 - s_236_247 <=s (const 64 (2**20)),
    u_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_236_247 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_246_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_10,
sint64 g_236_low60_0_low20_10,
sint64 f_236_low60_0_low20_11,
sint64 g_236_low60_0_low20_11,
sint64 u_236_246,
sint64 v_236_246,
sint64 r_236_246,
sint64 s_236_246,
sint64 u_236_247,
sint64 v_236_247,
sint64 r_236_247,
sint64 s_236_247,
bit ne
)={
    u_236_246 * f_236_low60_0_low20_0 + v_236_246 * g_236_low60_0_low20_0 = f_236_low60_0_low20_10 * (-(2**20)),
    r_236_246 * f_236_low60_0_low20_0 + s_236_246 * g_236_low60_0_low20_0 = g_236_low60_0_low20_10 * (-(2**20))
&&
    u_236_246 * f_236_low60_0_low20_0 + v_236_246 * g_236_low60_0_low20_0 = f_236_low60_0_low20_10 * (const 64 (-(2**20))),
    r_236_246 * f_236_low60_0_low20_0 + s_236_246 * g_236_low60_0_low20_0 = g_236_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_10 + u_236_246 * (const 64 (2**21)) + v_236_246 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_10 + r_236_246 * (const 64 (2**21)) + s_236_246 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_10,
    f_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_10,
    g_236_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 246)) <=s delta, delta <=s (const 64 (1 + 2*246)),
    (const 64 (-(2**20))) <=s u_236_246, u_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_246, v_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_246, r_236_246 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_246, s_236_246 <=s (const 64 ((2**20))),
    u_236_246 + v_236_246 <=s (const 64 (2**20)),
    u_236_246 - v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 + v_236_246 <=s (const 64 (2**20)),
    (const 64 0) - u_236_246 - v_236_246 <=s (const 64 (2**20)),
    r_236_246 + s_236_246 <=s (const 64 (2**20)),
    r_236_246 - s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 + s_236_246 <=s (const 64 (2**20)),
    (const 64 0) - r_236_246 - s_236_246 <=s (const 64 (2**20)),
    u_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_236_246 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_236_246 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step246

// premise c
assume
g_236_low60_0_low20_10 = 1 (mod 2)
&&
g_236_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_11 g_236_low60_0_low20_10;
mov u_236_247 r_236_246;
mov v_236_247 s_236_246;

subs dc g_236_low60_0_low20_11 g_236_low60_0_low20_10 f_236_low60_0_low20_10;
asr g_236_low60_0_low20_11 g_236_low60_0_low20_11 1;
subs dc r_236_247 r_236_246 u_236_246;
asr r_236_247 r_236_247 1;
subs dc s_236_247 s_236_246 v_236_246;
asr s_236_247 s_236_247 1;
assert
    true
&&
    f_236_low60_0_low20_11 = g_236_low60_0_low20_10,
    u_236_247 = r_236_246,
    v_236_247 = s_236_246,
    g_236_low60_0_low20_11 * (const 64 2) = g_236_low60_0_low20_10 - f_236_low60_0_low20_10,
    r_236_247 * (const 64 2) = r_236_246 - u_236_246,
    s_236_247 * (const 64 2) = s_236_246 - v_236_246
;

assume
    f_236_low60_0_low20_11 = g_236_low60_0_low20_10,
    u_236_247 = r_236_246,
    v_236_247 = s_236_246,
    g_236_low60_0_low20_11 * 2 = g_236_low60_0_low20_10 - f_236_low60_0_low20_10,
    r_236_247 * 2 = r_236_246 - u_236_246,
    s_236_247 * 2 = s_236_246 - v_236_246
&&
    true
;

{
    u_236_247 * f_236_low60_0_low20_0 + v_236_247 * g_236_low60_0_low20_0 = f_236_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_247 * f_236_low60_0_low20_0 + s_236_247 * g_236_low60_0_low20_0 = g_236_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_11 + u_236_247 * (const 64 (2**21)) + v_236_247 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_11 + r_236_247 * (const 64 (2**21)) + s_236_247 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_11,
    f_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_11,
    g_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 247)) <=s delta, delta <=s (const 64 (1 + 2*247)),
    (const 64 (-(2**20))) <=s u_236_247, u_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_247, v_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_247, r_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_247, s_236_247 <=s (const 64 ((2**20))),
    u_236_247 + v_236_247 <=s (const 64 (2**20)),
    u_236_247 - v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 + v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 - v_236_247 <=s (const 64 (2**20)),
    r_236_247 + s_236_247 <=s (const 64 (2**20)),
    r_236_247 - s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 + s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 - s_236_247 <=s (const 64 (2**20)),
    u_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_236_247 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_247_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_11,
sint64 g_236_low60_0_low20_11,
sint64 f_236_low60_0_low20_12,
sint64 g_236_low60_0_low20_12,
sint64 u_236_247,
sint64 v_236_247,
sint64 r_236_247,
sint64 s_236_247,
sint64 u_236_248,
sint64 v_236_248,
sint64 r_236_248,
sint64 s_236_248,
bit ne
)={
    u_236_247 * f_236_low60_0_low20_0 + v_236_247 * g_236_low60_0_low20_0 = f_236_low60_0_low20_11 * (-(2**20)),
    r_236_247 * f_236_low60_0_low20_0 + s_236_247 * g_236_low60_0_low20_0 = g_236_low60_0_low20_11 * (-(2**20))
&&
    u_236_247 * f_236_low60_0_low20_0 + v_236_247 * g_236_low60_0_low20_0 = f_236_low60_0_low20_11 * (const 64 (-(2**20))),
    r_236_247 * f_236_low60_0_low20_0 + s_236_247 * g_236_low60_0_low20_0 = g_236_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_11 + u_236_247 * (const 64 (2**21)) + v_236_247 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_11 + r_236_247 * (const 64 (2**21)) + s_236_247 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_11,
    f_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_11,
    g_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 247)) <=s delta, delta <=s (const 64 (1 + 2*247)),
    (const 64 (-(2**20))) <=s u_236_247, u_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_247, v_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_247, r_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_247, s_236_247 <=s (const 64 ((2**20))),
    u_236_247 + v_236_247 <=s (const 64 (2**20)),
    u_236_247 - v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 + v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 - v_236_247 <=s (const 64 (2**20)),
    r_236_247 + s_236_247 <=s (const 64 (2**20)),
    r_236_247 - s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 + s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 - s_236_247 <=s (const 64 (2**20)),
    u_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_236_247 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step247

// premise a
assume
g_236_low60_0_low20_11 = 0 (mod 2)
&&
g_236_low60_0_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_12 f_236_low60_0_low20_11;
mov u_236_248 u_236_247;
mov v_236_248 v_236_247;

asr g_236_low60_0_low20_12 g_236_low60_0_low20_11 1;
asr r_236_248 r_236_247 1;
asr s_236_248 s_236_247 1;
assert
    true
&&
    f_236_low60_0_low20_12 = f_236_low60_0_low20_11,
    u_236_248 = u_236_247,
    v_236_248 = v_236_247,
    g_236_low60_0_low20_12 * (const 64 2) = g_236_low60_0_low20_11,
    r_236_248 * (const 64 2) = r_236_247,
    s_236_248 * (const 64 2) = s_236_247
;

assume
    f_236_low60_0_low20_12 = f_236_low60_0_low20_11,
    u_236_248 = u_236_247,
    v_236_248 = v_236_247,
    g_236_low60_0_low20_12 * 2 = g_236_low60_0_low20_11,
    r_236_248 * 2 = r_236_247,
    s_236_248 * 2 = s_236_247
&&
    true
;

{
    u_236_248 * f_236_low60_0_low20_0 + v_236_248 * g_236_low60_0_low20_0 = f_236_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_248 * f_236_low60_0_low20_0 + s_236_248 * g_236_low60_0_low20_0 = g_236_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_12 + u_236_248 * (const 64 (2**21)) + v_236_248 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_12 + r_236_248 * (const 64 (2**21)) + s_236_248 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_12,
    f_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_12,
    g_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 248)) <=s delta, delta <=s (const 64 (1 + 2*248)),
    (const 64 (-(2**20))) <=s u_236_248, u_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_248, v_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_248, r_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_248, s_236_248 <=s (const 64 ((2**20))),
    u_236_248 + v_236_248 <=s (const 64 (2**20)),
    u_236_248 - v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 + v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 - v_236_248 <=s (const 64 (2**20)),
    r_236_248 + s_236_248 <=s (const 64 (2**20)),
    r_236_248 - s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 + s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 - s_236_248 <=s (const 64 (2**20)),
    u_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_236_248 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_247_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_11,
sint64 g_236_low60_0_low20_11,
sint64 f_236_low60_0_low20_12,
sint64 g_236_low60_0_low20_12,
sint64 u_236_247,
sint64 v_236_247,
sint64 r_236_247,
sint64 s_236_247,
sint64 u_236_248,
sint64 v_236_248,
sint64 r_236_248,
sint64 s_236_248,
bit ne
)={
    u_236_247 * f_236_low60_0_low20_0 + v_236_247 * g_236_low60_0_low20_0 = f_236_low60_0_low20_11 * (-(2**20)),
    r_236_247 * f_236_low60_0_low20_0 + s_236_247 * g_236_low60_0_low20_0 = g_236_low60_0_low20_11 * (-(2**20))
&&
    u_236_247 * f_236_low60_0_low20_0 + v_236_247 * g_236_low60_0_low20_0 = f_236_low60_0_low20_11 * (const 64 (-(2**20))),
    r_236_247 * f_236_low60_0_low20_0 + s_236_247 * g_236_low60_0_low20_0 = g_236_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_11 + u_236_247 * (const 64 (2**21)) + v_236_247 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_11 + r_236_247 * (const 64 (2**21)) + s_236_247 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_11,
    f_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_11,
    g_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 247)) <=s delta, delta <=s (const 64 (1 + 2*247)),
    (const 64 (-(2**20))) <=s u_236_247, u_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_247, v_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_247, r_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_247, s_236_247 <=s (const 64 ((2**20))),
    u_236_247 + v_236_247 <=s (const 64 (2**20)),
    u_236_247 - v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 + v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 - v_236_247 <=s (const 64 (2**20)),
    r_236_247 + s_236_247 <=s (const 64 (2**20)),
    r_236_247 - s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 + s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 - s_236_247 <=s (const 64 (2**20)),
    u_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_236_247 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step247

// premise b
assume
g_236_low60_0_low20_11 = 1 (mod 2)
&&
g_236_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_12 f_236_low60_0_low20_11;
mov u_236_248 u_236_247;
mov v_236_248 v_236_247;

add g_236_low60_0_low20_12 g_236_low60_0_low20_11 f_236_low60_0_low20_11;
asr g_236_low60_0_low20_12 g_236_low60_0_low20_12 1;
add r_236_248 r_236_247 u_236_247;
asr r_236_248 r_236_248 1;
add s_236_248 s_236_247 v_236_247;
asr s_236_248 s_236_248 1;
assert
    true
&&
    f_236_low60_0_low20_12 = f_236_low60_0_low20_11,
    u_236_248 = u_236_247,
    v_236_248 = v_236_247,
    g_236_low60_0_low20_12 * (const 64 2) = g_236_low60_0_low20_11 + f_236_low60_0_low20_11,
    r_236_248 * (const 64 2) = r_236_247 + u_236_247,
    s_236_248 * (const 64 2) = s_236_247 + v_236_247
;

assume
    f_236_low60_0_low20_12 = f_236_low60_0_low20_11,
    u_236_248 = u_236_247,
    v_236_248 = v_236_247,
    g_236_low60_0_low20_12 * 2 = g_236_low60_0_low20_11 + f_236_low60_0_low20_11,
    r_236_248 * 2 = r_236_247 + u_236_247,
    s_236_248 * 2 = s_236_247 + v_236_247
&&
    true
;

{
    u_236_248 * f_236_low60_0_low20_0 + v_236_248 * g_236_low60_0_low20_0 = f_236_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_248 * f_236_low60_0_low20_0 + s_236_248 * g_236_low60_0_low20_0 = g_236_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_12 + u_236_248 * (const 64 (2**21)) + v_236_248 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_12 + r_236_248 * (const 64 (2**21)) + s_236_248 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_12,
    f_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_12,
    g_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 248)) <=s delta, delta <=s (const 64 (1 + 2*248)),
    (const 64 (-(2**20))) <=s u_236_248, u_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_248, v_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_248, r_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_248, s_236_248 <=s (const 64 ((2**20))),
    u_236_248 + v_236_248 <=s (const 64 (2**20)),
    u_236_248 - v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 + v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 - v_236_248 <=s (const 64 (2**20)),
    r_236_248 + s_236_248 <=s (const 64 (2**20)),
    r_236_248 - s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 + s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 - s_236_248 <=s (const 64 (2**20)),
    u_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_236_248 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_247_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_11,
sint64 g_236_low60_0_low20_11,
sint64 f_236_low60_0_low20_12,
sint64 g_236_low60_0_low20_12,
sint64 u_236_247,
sint64 v_236_247,
sint64 r_236_247,
sint64 s_236_247,
sint64 u_236_248,
sint64 v_236_248,
sint64 r_236_248,
sint64 s_236_248,
bit ne
)={
    u_236_247 * f_236_low60_0_low20_0 + v_236_247 * g_236_low60_0_low20_0 = f_236_low60_0_low20_11 * (-(2**20)),
    r_236_247 * f_236_low60_0_low20_0 + s_236_247 * g_236_low60_0_low20_0 = g_236_low60_0_low20_11 * (-(2**20))
&&
    u_236_247 * f_236_low60_0_low20_0 + v_236_247 * g_236_low60_0_low20_0 = f_236_low60_0_low20_11 * (const 64 (-(2**20))),
    r_236_247 * f_236_low60_0_low20_0 + s_236_247 * g_236_low60_0_low20_0 = g_236_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_11 + u_236_247 * (const 64 (2**21)) + v_236_247 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_11 + r_236_247 * (const 64 (2**21)) + s_236_247 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_11,
    f_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_11,
    g_236_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 247)) <=s delta, delta <=s (const 64 (1 + 2*247)),
    (const 64 (-(2**20))) <=s u_236_247, u_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_247, v_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_247, r_236_247 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_247, s_236_247 <=s (const 64 ((2**20))),
    u_236_247 + v_236_247 <=s (const 64 (2**20)),
    u_236_247 - v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 + v_236_247 <=s (const 64 (2**20)),
    (const 64 0) - u_236_247 - v_236_247 <=s (const 64 (2**20)),
    r_236_247 + s_236_247 <=s (const 64 (2**20)),
    r_236_247 - s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 + s_236_247 <=s (const 64 (2**20)),
    (const 64 0) - r_236_247 - s_236_247 <=s (const 64 (2**20)),
    u_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_236_247 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_236_247 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step247

// premise c
assume
g_236_low60_0_low20_11 = 1 (mod 2)
&&
g_236_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_12 g_236_low60_0_low20_11;
mov u_236_248 r_236_247;
mov v_236_248 s_236_247;

subs dc g_236_low60_0_low20_12 g_236_low60_0_low20_11 f_236_low60_0_low20_11;
asr g_236_low60_0_low20_12 g_236_low60_0_low20_12 1;
subs dc r_236_248 r_236_247 u_236_247;
asr r_236_248 r_236_248 1;
subs dc s_236_248 s_236_247 v_236_247;
asr s_236_248 s_236_248 1;
assert
    true
&&
    f_236_low60_0_low20_12 = g_236_low60_0_low20_11,
    u_236_248 = r_236_247,
    v_236_248 = s_236_247,
    g_236_low60_0_low20_12 * (const 64 2) = g_236_low60_0_low20_11 - f_236_low60_0_low20_11,
    r_236_248 * (const 64 2) = r_236_247 - u_236_247,
    s_236_248 * (const 64 2) = s_236_247 - v_236_247
;

assume
    f_236_low60_0_low20_12 = g_236_low60_0_low20_11,
    u_236_248 = r_236_247,
    v_236_248 = s_236_247,
    g_236_low60_0_low20_12 * 2 = g_236_low60_0_low20_11 - f_236_low60_0_low20_11,
    r_236_248 * 2 = r_236_247 - u_236_247,
    s_236_248 * 2 = s_236_247 - v_236_247
&&
    true
;

{
    u_236_248 * f_236_low60_0_low20_0 + v_236_248 * g_236_low60_0_low20_0 = f_236_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_248 * f_236_low60_0_low20_0 + s_236_248 * g_236_low60_0_low20_0 = g_236_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_12 + u_236_248 * (const 64 (2**21)) + v_236_248 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_12 + r_236_248 * (const 64 (2**21)) + s_236_248 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_12,
    f_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_12,
    g_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 248)) <=s delta, delta <=s (const 64 (1 + 2*248)),
    (const 64 (-(2**20))) <=s u_236_248, u_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_248, v_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_248, r_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_248, s_236_248 <=s (const 64 ((2**20))),
    u_236_248 + v_236_248 <=s (const 64 (2**20)),
    u_236_248 - v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 + v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 - v_236_248 <=s (const 64 (2**20)),
    r_236_248 + s_236_248 <=s (const 64 (2**20)),
    r_236_248 - s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 + s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 - s_236_248 <=s (const 64 (2**20)),
    u_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_236_248 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_248_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_12,
sint64 g_236_low60_0_low20_12,
sint64 f_236_low60_0_low20_13,
sint64 g_236_low60_0_low20_13,
sint64 u_236_248,
sint64 v_236_248,
sint64 r_236_248,
sint64 s_236_248,
sint64 u_236_249,
sint64 v_236_249,
sint64 r_236_249,
sint64 s_236_249,
bit ne
)={
    u_236_248 * f_236_low60_0_low20_0 + v_236_248 * g_236_low60_0_low20_0 = f_236_low60_0_low20_12 * (-(2**20)),
    r_236_248 * f_236_low60_0_low20_0 + s_236_248 * g_236_low60_0_low20_0 = g_236_low60_0_low20_12 * (-(2**20))
&&
    u_236_248 * f_236_low60_0_low20_0 + v_236_248 * g_236_low60_0_low20_0 = f_236_low60_0_low20_12 * (const 64 (-(2**20))),
    r_236_248 * f_236_low60_0_low20_0 + s_236_248 * g_236_low60_0_low20_0 = g_236_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_12 + u_236_248 * (const 64 (2**21)) + v_236_248 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_12 + r_236_248 * (const 64 (2**21)) + s_236_248 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_12,
    f_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_12,
    g_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 248)) <=s delta, delta <=s (const 64 (1 + 2*248)),
    (const 64 (-(2**20))) <=s u_236_248, u_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_248, v_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_248, r_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_248, s_236_248 <=s (const 64 ((2**20))),
    u_236_248 + v_236_248 <=s (const 64 (2**20)),
    u_236_248 - v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 + v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 - v_236_248 <=s (const 64 (2**20)),
    r_236_248 + s_236_248 <=s (const 64 (2**20)),
    r_236_248 - s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 + s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 - s_236_248 <=s (const 64 (2**20)),
    u_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_236_248 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step248

// premise a
assume
g_236_low60_0_low20_12 = 0 (mod 2)
&&
g_236_low60_0_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_13 f_236_low60_0_low20_12;
mov u_236_249 u_236_248;
mov v_236_249 v_236_248;

asr g_236_low60_0_low20_13 g_236_low60_0_low20_12 1;
asr r_236_249 r_236_248 1;
asr s_236_249 s_236_248 1;
assert
    true
&&
    f_236_low60_0_low20_13 = f_236_low60_0_low20_12,
    u_236_249 = u_236_248,
    v_236_249 = v_236_248,
    g_236_low60_0_low20_13 * (const 64 2) = g_236_low60_0_low20_12,
    r_236_249 * (const 64 2) = r_236_248,
    s_236_249 * (const 64 2) = s_236_248
;

assume
    f_236_low60_0_low20_13 = f_236_low60_0_low20_12,
    u_236_249 = u_236_248,
    v_236_249 = v_236_248,
    g_236_low60_0_low20_13 * 2 = g_236_low60_0_low20_12,
    r_236_249 * 2 = r_236_248,
    s_236_249 * 2 = s_236_248
&&
    true
;

{
    u_236_249 * f_236_low60_0_low20_0 + v_236_249 * g_236_low60_0_low20_0 = f_236_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_249 * f_236_low60_0_low20_0 + s_236_249 * g_236_low60_0_low20_0 = g_236_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_13 + u_236_249 * (const 64 (2**21)) + v_236_249 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_13 + r_236_249 * (const 64 (2**21)) + s_236_249 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_13,
    f_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_13,
    g_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 249)) <=s delta, delta <=s (const 64 (1 + 2*249)),
    (const 64 (-(2**20))) <=s u_236_249, u_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_249, v_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_249, r_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_249, s_236_249 <=s (const 64 ((2**20))),
    u_236_249 + v_236_249 <=s (const 64 (2**20)),
    u_236_249 - v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 + v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 - v_236_249 <=s (const 64 (2**20)),
    r_236_249 + s_236_249 <=s (const 64 (2**20)),
    r_236_249 - s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 + s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 - s_236_249 <=s (const 64 (2**20)),
    u_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_236_249 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_248_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_12,
sint64 g_236_low60_0_low20_12,
sint64 f_236_low60_0_low20_13,
sint64 g_236_low60_0_low20_13,
sint64 u_236_248,
sint64 v_236_248,
sint64 r_236_248,
sint64 s_236_248,
sint64 u_236_249,
sint64 v_236_249,
sint64 r_236_249,
sint64 s_236_249,
bit ne
)={
    u_236_248 * f_236_low60_0_low20_0 + v_236_248 * g_236_low60_0_low20_0 = f_236_low60_0_low20_12 * (-(2**20)),
    r_236_248 * f_236_low60_0_low20_0 + s_236_248 * g_236_low60_0_low20_0 = g_236_low60_0_low20_12 * (-(2**20))
&&
    u_236_248 * f_236_low60_0_low20_0 + v_236_248 * g_236_low60_0_low20_0 = f_236_low60_0_low20_12 * (const 64 (-(2**20))),
    r_236_248 * f_236_low60_0_low20_0 + s_236_248 * g_236_low60_0_low20_0 = g_236_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_12 + u_236_248 * (const 64 (2**21)) + v_236_248 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_12 + r_236_248 * (const 64 (2**21)) + s_236_248 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_12,
    f_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_12,
    g_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 248)) <=s delta, delta <=s (const 64 (1 + 2*248)),
    (const 64 (-(2**20))) <=s u_236_248, u_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_248, v_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_248, r_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_248, s_236_248 <=s (const 64 ((2**20))),
    u_236_248 + v_236_248 <=s (const 64 (2**20)),
    u_236_248 - v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 + v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 - v_236_248 <=s (const 64 (2**20)),
    r_236_248 + s_236_248 <=s (const 64 (2**20)),
    r_236_248 - s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 + s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 - s_236_248 <=s (const 64 (2**20)),
    u_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_236_248 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step248

// premise b
assume
g_236_low60_0_low20_12 = 1 (mod 2)
&&
g_236_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_13 f_236_low60_0_low20_12;
mov u_236_249 u_236_248;
mov v_236_249 v_236_248;

add g_236_low60_0_low20_13 g_236_low60_0_low20_12 f_236_low60_0_low20_12;
asr g_236_low60_0_low20_13 g_236_low60_0_low20_13 1;
add r_236_249 r_236_248 u_236_248;
asr r_236_249 r_236_249 1;
add s_236_249 s_236_248 v_236_248;
asr s_236_249 s_236_249 1;
assert
    true
&&
    f_236_low60_0_low20_13 = f_236_low60_0_low20_12,
    u_236_249 = u_236_248,
    v_236_249 = v_236_248,
    g_236_low60_0_low20_13 * (const 64 2) = g_236_low60_0_low20_12 + f_236_low60_0_low20_12,
    r_236_249 * (const 64 2) = r_236_248 + u_236_248,
    s_236_249 * (const 64 2) = s_236_248 + v_236_248
;

assume
    f_236_low60_0_low20_13 = f_236_low60_0_low20_12,
    u_236_249 = u_236_248,
    v_236_249 = v_236_248,
    g_236_low60_0_low20_13 * 2 = g_236_low60_0_low20_12 + f_236_low60_0_low20_12,
    r_236_249 * 2 = r_236_248 + u_236_248,
    s_236_249 * 2 = s_236_248 + v_236_248
&&
    true
;

{
    u_236_249 * f_236_low60_0_low20_0 + v_236_249 * g_236_low60_0_low20_0 = f_236_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_249 * f_236_low60_0_low20_0 + s_236_249 * g_236_low60_0_low20_0 = g_236_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_13 + u_236_249 * (const 64 (2**21)) + v_236_249 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_13 + r_236_249 * (const 64 (2**21)) + s_236_249 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_13,
    f_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_13,
    g_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 249)) <=s delta, delta <=s (const 64 (1 + 2*249)),
    (const 64 (-(2**20))) <=s u_236_249, u_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_249, v_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_249, r_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_249, s_236_249 <=s (const 64 ((2**20))),
    u_236_249 + v_236_249 <=s (const 64 (2**20)),
    u_236_249 - v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 + v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 - v_236_249 <=s (const 64 (2**20)),
    r_236_249 + s_236_249 <=s (const 64 (2**20)),
    r_236_249 - s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 + s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 - s_236_249 <=s (const 64 (2**20)),
    u_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_236_249 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_248_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_12,
sint64 g_236_low60_0_low20_12,
sint64 f_236_low60_0_low20_13,
sint64 g_236_low60_0_low20_13,
sint64 u_236_248,
sint64 v_236_248,
sint64 r_236_248,
sint64 s_236_248,
sint64 u_236_249,
sint64 v_236_249,
sint64 r_236_249,
sint64 s_236_249,
bit ne
)={
    u_236_248 * f_236_low60_0_low20_0 + v_236_248 * g_236_low60_0_low20_0 = f_236_low60_0_low20_12 * (-(2**20)),
    r_236_248 * f_236_low60_0_low20_0 + s_236_248 * g_236_low60_0_low20_0 = g_236_low60_0_low20_12 * (-(2**20))
&&
    u_236_248 * f_236_low60_0_low20_0 + v_236_248 * g_236_low60_0_low20_0 = f_236_low60_0_low20_12 * (const 64 (-(2**20))),
    r_236_248 * f_236_low60_0_low20_0 + s_236_248 * g_236_low60_0_low20_0 = g_236_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_12 + u_236_248 * (const 64 (2**21)) + v_236_248 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_12 + r_236_248 * (const 64 (2**21)) + s_236_248 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_12,
    f_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_12,
    g_236_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 248)) <=s delta, delta <=s (const 64 (1 + 2*248)),
    (const 64 (-(2**20))) <=s u_236_248, u_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_248, v_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_248, r_236_248 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_248, s_236_248 <=s (const 64 ((2**20))),
    u_236_248 + v_236_248 <=s (const 64 (2**20)),
    u_236_248 - v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 + v_236_248 <=s (const 64 (2**20)),
    (const 64 0) - u_236_248 - v_236_248 <=s (const 64 (2**20)),
    r_236_248 + s_236_248 <=s (const 64 (2**20)),
    r_236_248 - s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 + s_236_248 <=s (const 64 (2**20)),
    (const 64 0) - r_236_248 - s_236_248 <=s (const 64 (2**20)),
    u_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_236_248 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_236_248 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step248

// premise c
assume
g_236_low60_0_low20_12 = 1 (mod 2)
&&
g_236_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_13 g_236_low60_0_low20_12;
mov u_236_249 r_236_248;
mov v_236_249 s_236_248;

subs dc g_236_low60_0_low20_13 g_236_low60_0_low20_12 f_236_low60_0_low20_12;
asr g_236_low60_0_low20_13 g_236_low60_0_low20_13 1;
subs dc r_236_249 r_236_248 u_236_248;
asr r_236_249 r_236_249 1;
subs dc s_236_249 s_236_248 v_236_248;
asr s_236_249 s_236_249 1;
assert
    true
&&
    f_236_low60_0_low20_13 = g_236_low60_0_low20_12,
    u_236_249 = r_236_248,
    v_236_249 = s_236_248,
    g_236_low60_0_low20_13 * (const 64 2) = g_236_low60_0_low20_12 - f_236_low60_0_low20_12,
    r_236_249 * (const 64 2) = r_236_248 - u_236_248,
    s_236_249 * (const 64 2) = s_236_248 - v_236_248
;

assume
    f_236_low60_0_low20_13 = g_236_low60_0_low20_12,
    u_236_249 = r_236_248,
    v_236_249 = s_236_248,
    g_236_low60_0_low20_13 * 2 = g_236_low60_0_low20_12 - f_236_low60_0_low20_12,
    r_236_249 * 2 = r_236_248 - u_236_248,
    s_236_249 * 2 = s_236_248 - v_236_248
&&
    true
;

{
    u_236_249 * f_236_low60_0_low20_0 + v_236_249 * g_236_low60_0_low20_0 = f_236_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_249 * f_236_low60_0_low20_0 + s_236_249 * g_236_low60_0_low20_0 = g_236_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_13 + u_236_249 * (const 64 (2**21)) + v_236_249 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_13 + r_236_249 * (const 64 (2**21)) + s_236_249 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_13,
    f_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_13,
    g_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 249)) <=s delta, delta <=s (const 64 (1 + 2*249)),
    (const 64 (-(2**20))) <=s u_236_249, u_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_249, v_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_249, r_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_249, s_236_249 <=s (const 64 ((2**20))),
    u_236_249 + v_236_249 <=s (const 64 (2**20)),
    u_236_249 - v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 + v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 - v_236_249 <=s (const 64 (2**20)),
    r_236_249 + s_236_249 <=s (const 64 (2**20)),
    r_236_249 - s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 + s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 - s_236_249 <=s (const 64 (2**20)),
    u_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_236_249 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_249_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_13,
sint64 g_236_low60_0_low20_13,
sint64 f_236_low60_0_low20_14,
sint64 g_236_low60_0_low20_14,
sint64 u_236_249,
sint64 v_236_249,
sint64 r_236_249,
sint64 s_236_249,
sint64 u_236_250,
sint64 v_236_250,
sint64 r_236_250,
sint64 s_236_250,
bit ne
)={
    u_236_249 * f_236_low60_0_low20_0 + v_236_249 * g_236_low60_0_low20_0 = f_236_low60_0_low20_13 * (-(2**20)),
    r_236_249 * f_236_low60_0_low20_0 + s_236_249 * g_236_low60_0_low20_0 = g_236_low60_0_low20_13 * (-(2**20))
&&
    u_236_249 * f_236_low60_0_low20_0 + v_236_249 * g_236_low60_0_low20_0 = f_236_low60_0_low20_13 * (const 64 (-(2**20))),
    r_236_249 * f_236_low60_0_low20_0 + s_236_249 * g_236_low60_0_low20_0 = g_236_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_13 + u_236_249 * (const 64 (2**21)) + v_236_249 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_13 + r_236_249 * (const 64 (2**21)) + s_236_249 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_13,
    f_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_13,
    g_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 249)) <=s delta, delta <=s (const 64 (1 + 2*249)),
    (const 64 (-(2**20))) <=s u_236_249, u_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_249, v_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_249, r_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_249, s_236_249 <=s (const 64 ((2**20))),
    u_236_249 + v_236_249 <=s (const 64 (2**20)),
    u_236_249 - v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 + v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 - v_236_249 <=s (const 64 (2**20)),
    r_236_249 + s_236_249 <=s (const 64 (2**20)),
    r_236_249 - s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 + s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 - s_236_249 <=s (const 64 (2**20)),
    u_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_236_249 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step249

// premise a
assume
g_236_low60_0_low20_13 = 0 (mod 2)
&&
g_236_low60_0_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_14 f_236_low60_0_low20_13;
mov u_236_250 u_236_249;
mov v_236_250 v_236_249;

asr g_236_low60_0_low20_14 g_236_low60_0_low20_13 1;
asr r_236_250 r_236_249 1;
asr s_236_250 s_236_249 1;
assert
    true
&&
    f_236_low60_0_low20_14 = f_236_low60_0_low20_13,
    u_236_250 = u_236_249,
    v_236_250 = v_236_249,
    g_236_low60_0_low20_14 * (const 64 2) = g_236_low60_0_low20_13,
    r_236_250 * (const 64 2) = r_236_249,
    s_236_250 * (const 64 2) = s_236_249
;

assume
    f_236_low60_0_low20_14 = f_236_low60_0_low20_13,
    u_236_250 = u_236_249,
    v_236_250 = v_236_249,
    g_236_low60_0_low20_14 * 2 = g_236_low60_0_low20_13,
    r_236_250 * 2 = r_236_249,
    s_236_250 * 2 = s_236_249
&&
    true
;

{
    u_236_250 * f_236_low60_0_low20_0 + v_236_250 * g_236_low60_0_low20_0 = f_236_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_250 * f_236_low60_0_low20_0 + s_236_250 * g_236_low60_0_low20_0 = g_236_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_14 + u_236_250 * (const 64 (2**21)) + v_236_250 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_14 + r_236_250 * (const 64 (2**21)) + s_236_250 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_14,
    f_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_14,
    g_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 250)) <=s delta, delta <=s (const 64 (1 + 2*250)),
    (const 64 (-(2**20))) <=s u_236_250, u_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_250, v_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_250, r_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_250, s_236_250 <=s (const 64 ((2**20))),
    u_236_250 + v_236_250 <=s (const 64 (2**20)),
    u_236_250 - v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 + v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 - v_236_250 <=s (const 64 (2**20)),
    r_236_250 + s_236_250 <=s (const 64 (2**20)),
    r_236_250 - s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 + s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 - s_236_250 <=s (const 64 (2**20)),
    u_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_236_250 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_249_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_13,
sint64 g_236_low60_0_low20_13,
sint64 f_236_low60_0_low20_14,
sint64 g_236_low60_0_low20_14,
sint64 u_236_249,
sint64 v_236_249,
sint64 r_236_249,
sint64 s_236_249,
sint64 u_236_250,
sint64 v_236_250,
sint64 r_236_250,
sint64 s_236_250,
bit ne
)={
    u_236_249 * f_236_low60_0_low20_0 + v_236_249 * g_236_low60_0_low20_0 = f_236_low60_0_low20_13 * (-(2**20)),
    r_236_249 * f_236_low60_0_low20_0 + s_236_249 * g_236_low60_0_low20_0 = g_236_low60_0_low20_13 * (-(2**20))
&&
    u_236_249 * f_236_low60_0_low20_0 + v_236_249 * g_236_low60_0_low20_0 = f_236_low60_0_low20_13 * (const 64 (-(2**20))),
    r_236_249 * f_236_low60_0_low20_0 + s_236_249 * g_236_low60_0_low20_0 = g_236_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_13 + u_236_249 * (const 64 (2**21)) + v_236_249 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_13 + r_236_249 * (const 64 (2**21)) + s_236_249 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_13,
    f_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_13,
    g_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 249)) <=s delta, delta <=s (const 64 (1 + 2*249)),
    (const 64 (-(2**20))) <=s u_236_249, u_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_249, v_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_249, r_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_249, s_236_249 <=s (const 64 ((2**20))),
    u_236_249 + v_236_249 <=s (const 64 (2**20)),
    u_236_249 - v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 + v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 - v_236_249 <=s (const 64 (2**20)),
    r_236_249 + s_236_249 <=s (const 64 (2**20)),
    r_236_249 - s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 + s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 - s_236_249 <=s (const 64 (2**20)),
    u_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_236_249 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step249

// premise b
assume
g_236_low60_0_low20_13 = 1 (mod 2)
&&
g_236_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_14 f_236_low60_0_low20_13;
mov u_236_250 u_236_249;
mov v_236_250 v_236_249;

add g_236_low60_0_low20_14 g_236_low60_0_low20_13 f_236_low60_0_low20_13;
asr g_236_low60_0_low20_14 g_236_low60_0_low20_14 1;
add r_236_250 r_236_249 u_236_249;
asr r_236_250 r_236_250 1;
add s_236_250 s_236_249 v_236_249;
asr s_236_250 s_236_250 1;
assert
    true
&&
    f_236_low60_0_low20_14 = f_236_low60_0_low20_13,
    u_236_250 = u_236_249,
    v_236_250 = v_236_249,
    g_236_low60_0_low20_14 * (const 64 2) = g_236_low60_0_low20_13 + f_236_low60_0_low20_13,
    r_236_250 * (const 64 2) = r_236_249 + u_236_249,
    s_236_250 * (const 64 2) = s_236_249 + v_236_249
;

assume
    f_236_low60_0_low20_14 = f_236_low60_0_low20_13,
    u_236_250 = u_236_249,
    v_236_250 = v_236_249,
    g_236_low60_0_low20_14 * 2 = g_236_low60_0_low20_13 + f_236_low60_0_low20_13,
    r_236_250 * 2 = r_236_249 + u_236_249,
    s_236_250 * 2 = s_236_249 + v_236_249
&&
    true
;

{
    u_236_250 * f_236_low60_0_low20_0 + v_236_250 * g_236_low60_0_low20_0 = f_236_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_250 * f_236_low60_0_low20_0 + s_236_250 * g_236_low60_0_low20_0 = g_236_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_14 + u_236_250 * (const 64 (2**21)) + v_236_250 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_14 + r_236_250 * (const 64 (2**21)) + s_236_250 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_14,
    f_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_14,
    g_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 250)) <=s delta, delta <=s (const 64 (1 + 2*250)),
    (const 64 (-(2**20))) <=s u_236_250, u_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_250, v_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_250, r_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_250, s_236_250 <=s (const 64 ((2**20))),
    u_236_250 + v_236_250 <=s (const 64 (2**20)),
    u_236_250 - v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 + v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 - v_236_250 <=s (const 64 (2**20)),
    r_236_250 + s_236_250 <=s (const 64 (2**20)),
    r_236_250 - s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 + s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 - s_236_250 <=s (const 64 (2**20)),
    u_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_236_250 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_249_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_13,
sint64 g_236_low60_0_low20_13,
sint64 f_236_low60_0_low20_14,
sint64 g_236_low60_0_low20_14,
sint64 u_236_249,
sint64 v_236_249,
sint64 r_236_249,
sint64 s_236_249,
sint64 u_236_250,
sint64 v_236_250,
sint64 r_236_250,
sint64 s_236_250,
bit ne
)={
    u_236_249 * f_236_low60_0_low20_0 + v_236_249 * g_236_low60_0_low20_0 = f_236_low60_0_low20_13 * (-(2**20)),
    r_236_249 * f_236_low60_0_low20_0 + s_236_249 * g_236_low60_0_low20_0 = g_236_low60_0_low20_13 * (-(2**20))
&&
    u_236_249 * f_236_low60_0_low20_0 + v_236_249 * g_236_low60_0_low20_0 = f_236_low60_0_low20_13 * (const 64 (-(2**20))),
    r_236_249 * f_236_low60_0_low20_0 + s_236_249 * g_236_low60_0_low20_0 = g_236_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_13 + u_236_249 * (const 64 (2**21)) + v_236_249 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_13 + r_236_249 * (const 64 (2**21)) + s_236_249 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_13,
    f_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_13,
    g_236_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 249)) <=s delta, delta <=s (const 64 (1 + 2*249)),
    (const 64 (-(2**20))) <=s u_236_249, u_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_249, v_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_249, r_236_249 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_249, s_236_249 <=s (const 64 ((2**20))),
    u_236_249 + v_236_249 <=s (const 64 (2**20)),
    u_236_249 - v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 + v_236_249 <=s (const 64 (2**20)),
    (const 64 0) - u_236_249 - v_236_249 <=s (const 64 (2**20)),
    r_236_249 + s_236_249 <=s (const 64 (2**20)),
    r_236_249 - s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 + s_236_249 <=s (const 64 (2**20)),
    (const 64 0) - r_236_249 - s_236_249 <=s (const 64 (2**20)),
    u_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_236_249 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_236_249 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step249

// premise c
assume
g_236_low60_0_low20_13 = 1 (mod 2)
&&
g_236_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_14 g_236_low60_0_low20_13;
mov u_236_250 r_236_249;
mov v_236_250 s_236_249;

subs dc g_236_low60_0_low20_14 g_236_low60_0_low20_13 f_236_low60_0_low20_13;
asr g_236_low60_0_low20_14 g_236_low60_0_low20_14 1;
subs dc r_236_250 r_236_249 u_236_249;
asr r_236_250 r_236_250 1;
subs dc s_236_250 s_236_249 v_236_249;
asr s_236_250 s_236_250 1;
assert
    true
&&
    f_236_low60_0_low20_14 = g_236_low60_0_low20_13,
    u_236_250 = r_236_249,
    v_236_250 = s_236_249,
    g_236_low60_0_low20_14 * (const 64 2) = g_236_low60_0_low20_13 - f_236_low60_0_low20_13,
    r_236_250 * (const 64 2) = r_236_249 - u_236_249,
    s_236_250 * (const 64 2) = s_236_249 - v_236_249
;

assume
    f_236_low60_0_low20_14 = g_236_low60_0_low20_13,
    u_236_250 = r_236_249,
    v_236_250 = s_236_249,
    g_236_low60_0_low20_14 * 2 = g_236_low60_0_low20_13 - f_236_low60_0_low20_13,
    r_236_250 * 2 = r_236_249 - u_236_249,
    s_236_250 * 2 = s_236_249 - v_236_249
&&
    true
;

{
    u_236_250 * f_236_low60_0_low20_0 + v_236_250 * g_236_low60_0_low20_0 = f_236_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_250 * f_236_low60_0_low20_0 + s_236_250 * g_236_low60_0_low20_0 = g_236_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_14 + u_236_250 * (const 64 (2**21)) + v_236_250 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_14 + r_236_250 * (const 64 (2**21)) + s_236_250 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_14,
    f_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_14,
    g_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 250)) <=s delta, delta <=s (const 64 (1 + 2*250)),
    (const 64 (-(2**20))) <=s u_236_250, u_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_250, v_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_250, r_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_250, s_236_250 <=s (const 64 ((2**20))),
    u_236_250 + v_236_250 <=s (const 64 (2**20)),
    u_236_250 - v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 + v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 - v_236_250 <=s (const 64 (2**20)),
    r_236_250 + s_236_250 <=s (const 64 (2**20)),
    r_236_250 - s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 + s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 - s_236_250 <=s (const 64 (2**20)),
    u_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_236_250 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_250_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_14,
sint64 g_236_low60_0_low20_14,
sint64 f_236_low60_0_low20_15,
sint64 g_236_low60_0_low20_15,
sint64 u_236_250,
sint64 v_236_250,
sint64 r_236_250,
sint64 s_236_250,
sint64 u_236_251,
sint64 v_236_251,
sint64 r_236_251,
sint64 s_236_251,
bit ne
)={
    u_236_250 * f_236_low60_0_low20_0 + v_236_250 * g_236_low60_0_low20_0 = f_236_low60_0_low20_14 * (-(2**20)),
    r_236_250 * f_236_low60_0_low20_0 + s_236_250 * g_236_low60_0_low20_0 = g_236_low60_0_low20_14 * (-(2**20))
&&
    u_236_250 * f_236_low60_0_low20_0 + v_236_250 * g_236_low60_0_low20_0 = f_236_low60_0_low20_14 * (const 64 (-(2**20))),
    r_236_250 * f_236_low60_0_low20_0 + s_236_250 * g_236_low60_0_low20_0 = g_236_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_14 + u_236_250 * (const 64 (2**21)) + v_236_250 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_14 + r_236_250 * (const 64 (2**21)) + s_236_250 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_14,
    f_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_14,
    g_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 250)) <=s delta, delta <=s (const 64 (1 + 2*250)),
    (const 64 (-(2**20))) <=s u_236_250, u_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_250, v_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_250, r_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_250, s_236_250 <=s (const 64 ((2**20))),
    u_236_250 + v_236_250 <=s (const 64 (2**20)),
    u_236_250 - v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 + v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 - v_236_250 <=s (const 64 (2**20)),
    r_236_250 + s_236_250 <=s (const 64 (2**20)),
    r_236_250 - s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 + s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 - s_236_250 <=s (const 64 (2**20)),
    u_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_236_250 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step250

// premise a
assume
g_236_low60_0_low20_14 = 0 (mod 2)
&&
g_236_low60_0_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_15 f_236_low60_0_low20_14;
mov u_236_251 u_236_250;
mov v_236_251 v_236_250;

asr g_236_low60_0_low20_15 g_236_low60_0_low20_14 1;
asr r_236_251 r_236_250 1;
asr s_236_251 s_236_250 1;
assert
    true
&&
    f_236_low60_0_low20_15 = f_236_low60_0_low20_14,
    u_236_251 = u_236_250,
    v_236_251 = v_236_250,
    g_236_low60_0_low20_15 * (const 64 2) = g_236_low60_0_low20_14,
    r_236_251 * (const 64 2) = r_236_250,
    s_236_251 * (const 64 2) = s_236_250
;

assume
    f_236_low60_0_low20_15 = f_236_low60_0_low20_14,
    u_236_251 = u_236_250,
    v_236_251 = v_236_250,
    g_236_low60_0_low20_15 * 2 = g_236_low60_0_low20_14,
    r_236_251 * 2 = r_236_250,
    s_236_251 * 2 = s_236_250
&&
    true
;

{
    u_236_251 * f_236_low60_0_low20_0 + v_236_251 * g_236_low60_0_low20_0 = f_236_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_251 * f_236_low60_0_low20_0 + s_236_251 * g_236_low60_0_low20_0 = g_236_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_15 + u_236_251 * (const 64 (2**21)) + v_236_251 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_15 + r_236_251 * (const 64 (2**21)) + s_236_251 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_15,
    f_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_15,
    g_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 251)) <=s delta, delta <=s (const 64 (1 + 2*251)),
    (const 64 (-(2**20))) <=s u_236_251, u_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_251, v_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_251, r_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_251, s_236_251 <=s (const 64 ((2**20))),
    u_236_251 + v_236_251 <=s (const 64 (2**20)),
    u_236_251 - v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 + v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 - v_236_251 <=s (const 64 (2**20)),
    r_236_251 + s_236_251 <=s (const 64 (2**20)),
    r_236_251 - s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 + s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 - s_236_251 <=s (const 64 (2**20)),
    u_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_236_251 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_250_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_14,
sint64 g_236_low60_0_low20_14,
sint64 f_236_low60_0_low20_15,
sint64 g_236_low60_0_low20_15,
sint64 u_236_250,
sint64 v_236_250,
sint64 r_236_250,
sint64 s_236_250,
sint64 u_236_251,
sint64 v_236_251,
sint64 r_236_251,
sint64 s_236_251,
bit ne
)={
    u_236_250 * f_236_low60_0_low20_0 + v_236_250 * g_236_low60_0_low20_0 = f_236_low60_0_low20_14 * (-(2**20)),
    r_236_250 * f_236_low60_0_low20_0 + s_236_250 * g_236_low60_0_low20_0 = g_236_low60_0_low20_14 * (-(2**20))
&&
    u_236_250 * f_236_low60_0_low20_0 + v_236_250 * g_236_low60_0_low20_0 = f_236_low60_0_low20_14 * (const 64 (-(2**20))),
    r_236_250 * f_236_low60_0_low20_0 + s_236_250 * g_236_low60_0_low20_0 = g_236_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_14 + u_236_250 * (const 64 (2**21)) + v_236_250 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_14 + r_236_250 * (const 64 (2**21)) + s_236_250 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_14,
    f_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_14,
    g_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 250)) <=s delta, delta <=s (const 64 (1 + 2*250)),
    (const 64 (-(2**20))) <=s u_236_250, u_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_250, v_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_250, r_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_250, s_236_250 <=s (const 64 ((2**20))),
    u_236_250 + v_236_250 <=s (const 64 (2**20)),
    u_236_250 - v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 + v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 - v_236_250 <=s (const 64 (2**20)),
    r_236_250 + s_236_250 <=s (const 64 (2**20)),
    r_236_250 - s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 + s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 - s_236_250 <=s (const 64 (2**20)),
    u_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_236_250 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step250

// premise b
assume
g_236_low60_0_low20_14 = 1 (mod 2)
&&
g_236_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_15 f_236_low60_0_low20_14;
mov u_236_251 u_236_250;
mov v_236_251 v_236_250;

add g_236_low60_0_low20_15 g_236_low60_0_low20_14 f_236_low60_0_low20_14;
asr g_236_low60_0_low20_15 g_236_low60_0_low20_15 1;
add r_236_251 r_236_250 u_236_250;
asr r_236_251 r_236_251 1;
add s_236_251 s_236_250 v_236_250;
asr s_236_251 s_236_251 1;
assert
    true
&&
    f_236_low60_0_low20_15 = f_236_low60_0_low20_14,
    u_236_251 = u_236_250,
    v_236_251 = v_236_250,
    g_236_low60_0_low20_15 * (const 64 2) = g_236_low60_0_low20_14 + f_236_low60_0_low20_14,
    r_236_251 * (const 64 2) = r_236_250 + u_236_250,
    s_236_251 * (const 64 2) = s_236_250 + v_236_250
;

assume
    f_236_low60_0_low20_15 = f_236_low60_0_low20_14,
    u_236_251 = u_236_250,
    v_236_251 = v_236_250,
    g_236_low60_0_low20_15 * 2 = g_236_low60_0_low20_14 + f_236_low60_0_low20_14,
    r_236_251 * 2 = r_236_250 + u_236_250,
    s_236_251 * 2 = s_236_250 + v_236_250
&&
    true
;

{
    u_236_251 * f_236_low60_0_low20_0 + v_236_251 * g_236_low60_0_low20_0 = f_236_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_251 * f_236_low60_0_low20_0 + s_236_251 * g_236_low60_0_low20_0 = g_236_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_15 + u_236_251 * (const 64 (2**21)) + v_236_251 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_15 + r_236_251 * (const 64 (2**21)) + s_236_251 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_15,
    f_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_15,
    g_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 251)) <=s delta, delta <=s (const 64 (1 + 2*251)),
    (const 64 (-(2**20))) <=s u_236_251, u_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_251, v_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_251, r_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_251, s_236_251 <=s (const 64 ((2**20))),
    u_236_251 + v_236_251 <=s (const 64 (2**20)),
    u_236_251 - v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 + v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 - v_236_251 <=s (const 64 (2**20)),
    r_236_251 + s_236_251 <=s (const 64 (2**20)),
    r_236_251 - s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 + s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 - s_236_251 <=s (const 64 (2**20)),
    u_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_236_251 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_250_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_14,
sint64 g_236_low60_0_low20_14,
sint64 f_236_low60_0_low20_15,
sint64 g_236_low60_0_low20_15,
sint64 u_236_250,
sint64 v_236_250,
sint64 r_236_250,
sint64 s_236_250,
sint64 u_236_251,
sint64 v_236_251,
sint64 r_236_251,
sint64 s_236_251,
bit ne
)={
    u_236_250 * f_236_low60_0_low20_0 + v_236_250 * g_236_low60_0_low20_0 = f_236_low60_0_low20_14 * (-(2**20)),
    r_236_250 * f_236_low60_0_low20_0 + s_236_250 * g_236_low60_0_low20_0 = g_236_low60_0_low20_14 * (-(2**20))
&&
    u_236_250 * f_236_low60_0_low20_0 + v_236_250 * g_236_low60_0_low20_0 = f_236_low60_0_low20_14 * (const 64 (-(2**20))),
    r_236_250 * f_236_low60_0_low20_0 + s_236_250 * g_236_low60_0_low20_0 = g_236_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_14 + u_236_250 * (const 64 (2**21)) + v_236_250 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_14 + r_236_250 * (const 64 (2**21)) + s_236_250 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_14,
    f_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_14,
    g_236_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 250)) <=s delta, delta <=s (const 64 (1 + 2*250)),
    (const 64 (-(2**20))) <=s u_236_250, u_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_250, v_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_250, r_236_250 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_250, s_236_250 <=s (const 64 ((2**20))),
    u_236_250 + v_236_250 <=s (const 64 (2**20)),
    u_236_250 - v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 + v_236_250 <=s (const 64 (2**20)),
    (const 64 0) - u_236_250 - v_236_250 <=s (const 64 (2**20)),
    r_236_250 + s_236_250 <=s (const 64 (2**20)),
    r_236_250 - s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 + s_236_250 <=s (const 64 (2**20)),
    (const 64 0) - r_236_250 - s_236_250 <=s (const 64 (2**20)),
    u_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_236_250 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_236_250 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step250

// premise c
assume
g_236_low60_0_low20_14 = 1 (mod 2)
&&
g_236_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_15 g_236_low60_0_low20_14;
mov u_236_251 r_236_250;
mov v_236_251 s_236_250;

subs dc g_236_low60_0_low20_15 g_236_low60_0_low20_14 f_236_low60_0_low20_14;
asr g_236_low60_0_low20_15 g_236_low60_0_low20_15 1;
subs dc r_236_251 r_236_250 u_236_250;
asr r_236_251 r_236_251 1;
subs dc s_236_251 s_236_250 v_236_250;
asr s_236_251 s_236_251 1;
assert
    true
&&
    f_236_low60_0_low20_15 = g_236_low60_0_low20_14,
    u_236_251 = r_236_250,
    v_236_251 = s_236_250,
    g_236_low60_0_low20_15 * (const 64 2) = g_236_low60_0_low20_14 - f_236_low60_0_low20_14,
    r_236_251 * (const 64 2) = r_236_250 - u_236_250,
    s_236_251 * (const 64 2) = s_236_250 - v_236_250
;

assume
    f_236_low60_0_low20_15 = g_236_low60_0_low20_14,
    u_236_251 = r_236_250,
    v_236_251 = s_236_250,
    g_236_low60_0_low20_15 * 2 = g_236_low60_0_low20_14 - f_236_low60_0_low20_14,
    r_236_251 * 2 = r_236_250 - u_236_250,
    s_236_251 * 2 = s_236_250 - v_236_250
&&
    true
;

{
    u_236_251 * f_236_low60_0_low20_0 + v_236_251 * g_236_low60_0_low20_0 = f_236_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_251 * f_236_low60_0_low20_0 + s_236_251 * g_236_low60_0_low20_0 = g_236_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_15 + u_236_251 * (const 64 (2**21)) + v_236_251 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_15 + r_236_251 * (const 64 (2**21)) + s_236_251 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_15,
    f_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_15,
    g_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 251)) <=s delta, delta <=s (const 64 (1 + 2*251)),
    (const 64 (-(2**20))) <=s u_236_251, u_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_251, v_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_251, r_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_251, s_236_251 <=s (const 64 ((2**20))),
    u_236_251 + v_236_251 <=s (const 64 (2**20)),
    u_236_251 - v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 + v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 - v_236_251 <=s (const 64 (2**20)),
    r_236_251 + s_236_251 <=s (const 64 (2**20)),
    r_236_251 - s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 + s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 - s_236_251 <=s (const 64 (2**20)),
    u_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_236_251 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_251_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_15,
sint64 g_236_low60_0_low20_15,
sint64 f_236_low60_0_low20_16,
sint64 g_236_low60_0_low20_16,
sint64 u_236_251,
sint64 v_236_251,
sint64 r_236_251,
sint64 s_236_251,
sint64 u_236_252,
sint64 v_236_252,
sint64 r_236_252,
sint64 s_236_252,
bit ne
)={
    u_236_251 * f_236_low60_0_low20_0 + v_236_251 * g_236_low60_0_low20_0 = f_236_low60_0_low20_15 * (-(2**20)),
    r_236_251 * f_236_low60_0_low20_0 + s_236_251 * g_236_low60_0_low20_0 = g_236_low60_0_low20_15 * (-(2**20))
&&
    u_236_251 * f_236_low60_0_low20_0 + v_236_251 * g_236_low60_0_low20_0 = f_236_low60_0_low20_15 * (const 64 (-(2**20))),
    r_236_251 * f_236_low60_0_low20_0 + s_236_251 * g_236_low60_0_low20_0 = g_236_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_15 + u_236_251 * (const 64 (2**21)) + v_236_251 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_15 + r_236_251 * (const 64 (2**21)) + s_236_251 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_15,
    f_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_15,
    g_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 251)) <=s delta, delta <=s (const 64 (1 + 2*251)),
    (const 64 (-(2**20))) <=s u_236_251, u_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_251, v_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_251, r_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_251, s_236_251 <=s (const 64 ((2**20))),
    u_236_251 + v_236_251 <=s (const 64 (2**20)),
    u_236_251 - v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 + v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 - v_236_251 <=s (const 64 (2**20)),
    r_236_251 + s_236_251 <=s (const 64 (2**20)),
    r_236_251 - s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 + s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 - s_236_251 <=s (const 64 (2**20)),
    u_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_236_251 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step251

// premise a
assume
g_236_low60_0_low20_15 = 0 (mod 2)
&&
g_236_low60_0_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_16 f_236_low60_0_low20_15;
mov u_236_252 u_236_251;
mov v_236_252 v_236_251;

asr g_236_low60_0_low20_16 g_236_low60_0_low20_15 1;
asr r_236_252 r_236_251 1;
asr s_236_252 s_236_251 1;
assert
    true
&&
    f_236_low60_0_low20_16 = f_236_low60_0_low20_15,
    u_236_252 = u_236_251,
    v_236_252 = v_236_251,
    g_236_low60_0_low20_16 * (const 64 2) = g_236_low60_0_low20_15,
    r_236_252 * (const 64 2) = r_236_251,
    s_236_252 * (const 64 2) = s_236_251
;

assume
    f_236_low60_0_low20_16 = f_236_low60_0_low20_15,
    u_236_252 = u_236_251,
    v_236_252 = v_236_251,
    g_236_low60_0_low20_16 * 2 = g_236_low60_0_low20_15,
    r_236_252 * 2 = r_236_251,
    s_236_252 * 2 = s_236_251
&&
    true
;

{
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_16 + u_236_252 * (const 64 (2**21)) + v_236_252 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_16 + r_236_252 * (const 64 (2**21)) + s_236_252 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_16,
    f_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_16,
    g_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 252)) <=s delta, delta <=s (const 64 (1 + 2*252)),
    (const 64 (-(2**20))) <=s u_236_252, u_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_252, v_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_252, r_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_252, s_236_252 <=s (const 64 ((2**20))),
    u_236_252 + v_236_252 <=s (const 64 (2**20)),
    u_236_252 - v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 + v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 - v_236_252 <=s (const 64 (2**20)),
    r_236_252 + s_236_252 <=s (const 64 (2**20)),
    r_236_252 - s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 + s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 - s_236_252 <=s (const 64 (2**20)),
    u_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_236_252 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_251_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_15,
sint64 g_236_low60_0_low20_15,
sint64 f_236_low60_0_low20_16,
sint64 g_236_low60_0_low20_16,
sint64 u_236_251,
sint64 v_236_251,
sint64 r_236_251,
sint64 s_236_251,
sint64 u_236_252,
sint64 v_236_252,
sint64 r_236_252,
sint64 s_236_252,
bit ne
)={
    u_236_251 * f_236_low60_0_low20_0 + v_236_251 * g_236_low60_0_low20_0 = f_236_low60_0_low20_15 * (-(2**20)),
    r_236_251 * f_236_low60_0_low20_0 + s_236_251 * g_236_low60_0_low20_0 = g_236_low60_0_low20_15 * (-(2**20))
&&
    u_236_251 * f_236_low60_0_low20_0 + v_236_251 * g_236_low60_0_low20_0 = f_236_low60_0_low20_15 * (const 64 (-(2**20))),
    r_236_251 * f_236_low60_0_low20_0 + s_236_251 * g_236_low60_0_low20_0 = g_236_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_15 + u_236_251 * (const 64 (2**21)) + v_236_251 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_15 + r_236_251 * (const 64 (2**21)) + s_236_251 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_15,
    f_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_15,
    g_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 251)) <=s delta, delta <=s (const 64 (1 + 2*251)),
    (const 64 (-(2**20))) <=s u_236_251, u_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_251, v_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_251, r_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_251, s_236_251 <=s (const 64 ((2**20))),
    u_236_251 + v_236_251 <=s (const 64 (2**20)),
    u_236_251 - v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 + v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 - v_236_251 <=s (const 64 (2**20)),
    r_236_251 + s_236_251 <=s (const 64 (2**20)),
    r_236_251 - s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 + s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 - s_236_251 <=s (const 64 (2**20)),
    u_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_236_251 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step251

// premise b
assume
g_236_low60_0_low20_15 = 1 (mod 2)
&&
g_236_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_16 f_236_low60_0_low20_15;
mov u_236_252 u_236_251;
mov v_236_252 v_236_251;

add g_236_low60_0_low20_16 g_236_low60_0_low20_15 f_236_low60_0_low20_15;
asr g_236_low60_0_low20_16 g_236_low60_0_low20_16 1;
add r_236_252 r_236_251 u_236_251;
asr r_236_252 r_236_252 1;
add s_236_252 s_236_251 v_236_251;
asr s_236_252 s_236_252 1;
assert
    true
&&
    f_236_low60_0_low20_16 = f_236_low60_0_low20_15,
    u_236_252 = u_236_251,
    v_236_252 = v_236_251,
    g_236_low60_0_low20_16 * (const 64 2) = g_236_low60_0_low20_15 + f_236_low60_0_low20_15,
    r_236_252 * (const 64 2) = r_236_251 + u_236_251,
    s_236_252 * (const 64 2) = s_236_251 + v_236_251
;

assume
    f_236_low60_0_low20_16 = f_236_low60_0_low20_15,
    u_236_252 = u_236_251,
    v_236_252 = v_236_251,
    g_236_low60_0_low20_16 * 2 = g_236_low60_0_low20_15 + f_236_low60_0_low20_15,
    r_236_252 * 2 = r_236_251 + u_236_251,
    s_236_252 * 2 = s_236_251 + v_236_251
&&
    true
;

{
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_16 + u_236_252 * (const 64 (2**21)) + v_236_252 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_16 + r_236_252 * (const 64 (2**21)) + s_236_252 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_16,
    f_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_16,
    g_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 252)) <=s delta, delta <=s (const 64 (1 + 2*252)),
    (const 64 (-(2**20))) <=s u_236_252, u_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_252, v_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_252, r_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_252, s_236_252 <=s (const 64 ((2**20))),
    u_236_252 + v_236_252 <=s (const 64 (2**20)),
    u_236_252 - v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 + v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 - v_236_252 <=s (const 64 (2**20)),
    r_236_252 + s_236_252 <=s (const 64 (2**20)),
    r_236_252 - s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 + s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 - s_236_252 <=s (const 64 (2**20)),
    u_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_236_252 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_251_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_15,
sint64 g_236_low60_0_low20_15,
sint64 f_236_low60_0_low20_16,
sint64 g_236_low60_0_low20_16,
sint64 u_236_251,
sint64 v_236_251,
sint64 r_236_251,
sint64 s_236_251,
sint64 u_236_252,
sint64 v_236_252,
sint64 r_236_252,
sint64 s_236_252,
bit ne
)={
    u_236_251 * f_236_low60_0_low20_0 + v_236_251 * g_236_low60_0_low20_0 = f_236_low60_0_low20_15 * (-(2**20)),
    r_236_251 * f_236_low60_0_low20_0 + s_236_251 * g_236_low60_0_low20_0 = g_236_low60_0_low20_15 * (-(2**20))
&&
    u_236_251 * f_236_low60_0_low20_0 + v_236_251 * g_236_low60_0_low20_0 = f_236_low60_0_low20_15 * (const 64 (-(2**20))),
    r_236_251 * f_236_low60_0_low20_0 + s_236_251 * g_236_low60_0_low20_0 = g_236_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_15 + u_236_251 * (const 64 (2**21)) + v_236_251 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_15 + r_236_251 * (const 64 (2**21)) + s_236_251 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_15,
    f_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_15,
    g_236_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 251)) <=s delta, delta <=s (const 64 (1 + 2*251)),
    (const 64 (-(2**20))) <=s u_236_251, u_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_251, v_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_251, r_236_251 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_251, s_236_251 <=s (const 64 ((2**20))),
    u_236_251 + v_236_251 <=s (const 64 (2**20)),
    u_236_251 - v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 + v_236_251 <=s (const 64 (2**20)),
    (const 64 0) - u_236_251 - v_236_251 <=s (const 64 (2**20)),
    r_236_251 + s_236_251 <=s (const 64 (2**20)),
    r_236_251 - s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 + s_236_251 <=s (const 64 (2**20)),
    (const 64 0) - r_236_251 - s_236_251 <=s (const 64 (2**20)),
    u_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_236_251 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_236_251 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step251

// premise c
assume
g_236_low60_0_low20_15 = 1 (mod 2)
&&
g_236_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_16 g_236_low60_0_low20_15;
mov u_236_252 r_236_251;
mov v_236_252 s_236_251;

subs dc g_236_low60_0_low20_16 g_236_low60_0_low20_15 f_236_low60_0_low20_15;
asr g_236_low60_0_low20_16 g_236_low60_0_low20_16 1;
subs dc r_236_252 r_236_251 u_236_251;
asr r_236_252 r_236_252 1;
subs dc s_236_252 s_236_251 v_236_251;
asr s_236_252 s_236_252 1;
assert
    true
&&
    f_236_low60_0_low20_16 = g_236_low60_0_low20_15,
    u_236_252 = r_236_251,
    v_236_252 = s_236_251,
    g_236_low60_0_low20_16 * (const 64 2) = g_236_low60_0_low20_15 - f_236_low60_0_low20_15,
    r_236_252 * (const 64 2) = r_236_251 - u_236_251,
    s_236_252 * (const 64 2) = s_236_251 - v_236_251
;

assume
    f_236_low60_0_low20_16 = g_236_low60_0_low20_15,
    u_236_252 = r_236_251,
    v_236_252 = s_236_251,
    g_236_low60_0_low20_16 * 2 = g_236_low60_0_low20_15 - f_236_low60_0_low20_15,
    r_236_252 * 2 = r_236_251 - u_236_251,
    s_236_252 * 2 = s_236_251 - v_236_251
&&
    true
;

{
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_16 + u_236_252 * (const 64 (2**21)) + v_236_252 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_16 + r_236_252 * (const 64 (2**21)) + s_236_252 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_16,
    f_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_16,
    g_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 252)) <=s delta, delta <=s (const 64 (1 + 2*252)),
    (const 64 (-(2**20))) <=s u_236_252, u_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_252, v_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_252, r_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_252, s_236_252 <=s (const 64 ((2**20))),
    u_236_252 + v_236_252 <=s (const 64 (2**20)),
    u_236_252 - v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 + v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 - v_236_252 <=s (const 64 (2**20)),
    r_236_252 + s_236_252 <=s (const 64 (2**20)),
    r_236_252 - s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 + s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 - s_236_252 <=s (const 64 (2**20)),
    u_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_236_252 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_252_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_16,
sint64 g_236_low60_0_low20_16,
sint64 f_236_low60_0_low20_17,
sint64 g_236_low60_0_low20_17,
sint64 u_236_252,
sint64 v_236_252,
sint64 r_236_252,
sint64 s_236_252,
sint64 u_236_253,
sint64 v_236_253,
sint64 r_236_253,
sint64 s_236_253,
bit ne
)={
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (-(2**20)),
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (-(2**20))
&&
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (const 64 (-(2**20))),
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_16 + u_236_252 * (const 64 (2**21)) + v_236_252 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_16 + r_236_252 * (const 64 (2**21)) + s_236_252 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_16,
    f_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_16,
    g_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 252)) <=s delta, delta <=s (const 64 (1 + 2*252)),
    (const 64 (-(2**20))) <=s u_236_252, u_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_252, v_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_252, r_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_252, s_236_252 <=s (const 64 ((2**20))),
    u_236_252 + v_236_252 <=s (const 64 (2**20)),
    u_236_252 - v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 + v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 - v_236_252 <=s (const 64 (2**20)),
    r_236_252 + s_236_252 <=s (const 64 (2**20)),
    r_236_252 - s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 + s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 - s_236_252 <=s (const 64 (2**20)),
    u_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_236_252 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step252

// premise a
assume
g_236_low60_0_low20_16 = 0 (mod 2)
&&
g_236_low60_0_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_17 f_236_low60_0_low20_16;
mov u_236_253 u_236_252;
mov v_236_253 v_236_252;

asr g_236_low60_0_low20_17 g_236_low60_0_low20_16 1;
asr r_236_253 r_236_252 1;
asr s_236_253 s_236_252 1;
assert
    true
&&
    f_236_low60_0_low20_17 = f_236_low60_0_low20_16,
    u_236_253 = u_236_252,
    v_236_253 = v_236_252,
    g_236_low60_0_low20_17 * (const 64 2) = g_236_low60_0_low20_16,
    r_236_253 * (const 64 2) = r_236_252,
    s_236_253 * (const 64 2) = s_236_252
;

assume
    f_236_low60_0_low20_17 = f_236_low60_0_low20_16,
    u_236_253 = u_236_252,
    v_236_253 = v_236_252,
    g_236_low60_0_low20_17 * 2 = g_236_low60_0_low20_16,
    r_236_253 * 2 = r_236_252,
    s_236_253 * 2 = s_236_252
&&
    true
;

{
    u_236_253 * f_236_low60_0_low20_0 + v_236_253 * g_236_low60_0_low20_0 = f_236_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_253 * f_236_low60_0_low20_0 + s_236_253 * g_236_low60_0_low20_0 = g_236_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_17 + u_236_253 * (const 64 (2**21)) + v_236_253 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_17 + r_236_253 * (const 64 (2**21)) + s_236_253 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_17,
    f_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_17,
    g_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 253)) <=s delta, delta <=s (const 64 (1 + 2*253)),
    (const 64 (-(2**20))) <=s u_236_253, u_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_253, v_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_253, r_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_253, s_236_253 <=s (const 64 ((2**20))),
    u_236_253 + v_236_253 <=s (const 64 (2**20)),
    u_236_253 - v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 + v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 - v_236_253 <=s (const 64 (2**20)),
    r_236_253 + s_236_253 <=s (const 64 (2**20)),
    r_236_253 - s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 + s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 - s_236_253 <=s (const 64 (2**20)),
    u_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_236_253 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_252_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_16,
sint64 g_236_low60_0_low20_16,
sint64 f_236_low60_0_low20_17,
sint64 g_236_low60_0_low20_17,
sint64 u_236_252,
sint64 v_236_252,
sint64 r_236_252,
sint64 s_236_252,
sint64 u_236_253,
sint64 v_236_253,
sint64 r_236_253,
sint64 s_236_253,
bit ne
)={
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (-(2**20)),
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (-(2**20))
&&
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (const 64 (-(2**20))),
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_16 + u_236_252 * (const 64 (2**21)) + v_236_252 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_16 + r_236_252 * (const 64 (2**21)) + s_236_252 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_16,
    f_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_16,
    g_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 252)) <=s delta, delta <=s (const 64 (1 + 2*252)),
    (const 64 (-(2**20))) <=s u_236_252, u_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_252, v_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_252, r_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_252, s_236_252 <=s (const 64 ((2**20))),
    u_236_252 + v_236_252 <=s (const 64 (2**20)),
    u_236_252 - v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 + v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 - v_236_252 <=s (const 64 (2**20)),
    r_236_252 + s_236_252 <=s (const 64 (2**20)),
    r_236_252 - s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 + s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 - s_236_252 <=s (const 64 (2**20)),
    u_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_236_252 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step252

// premise b
assume
g_236_low60_0_low20_16 = 1 (mod 2)
&&
g_236_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_17 f_236_low60_0_low20_16;
mov u_236_253 u_236_252;
mov v_236_253 v_236_252;

add g_236_low60_0_low20_17 g_236_low60_0_low20_16 f_236_low60_0_low20_16;
asr g_236_low60_0_low20_17 g_236_low60_0_low20_17 1;
add r_236_253 r_236_252 u_236_252;
asr r_236_253 r_236_253 1;
add s_236_253 s_236_252 v_236_252;
asr s_236_253 s_236_253 1;
assert
    true
&&
    f_236_low60_0_low20_17 = f_236_low60_0_low20_16,
    u_236_253 = u_236_252,
    v_236_253 = v_236_252,
    g_236_low60_0_low20_17 * (const 64 2) = g_236_low60_0_low20_16 + f_236_low60_0_low20_16,
    r_236_253 * (const 64 2) = r_236_252 + u_236_252,
    s_236_253 * (const 64 2) = s_236_252 + v_236_252
;

assume
    f_236_low60_0_low20_17 = f_236_low60_0_low20_16,
    u_236_253 = u_236_252,
    v_236_253 = v_236_252,
    g_236_low60_0_low20_17 * 2 = g_236_low60_0_low20_16 + f_236_low60_0_low20_16,
    r_236_253 * 2 = r_236_252 + u_236_252,
    s_236_253 * 2 = s_236_252 + v_236_252
&&
    true
;

{
    u_236_253 * f_236_low60_0_low20_0 + v_236_253 * g_236_low60_0_low20_0 = f_236_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_253 * f_236_low60_0_low20_0 + s_236_253 * g_236_low60_0_low20_0 = g_236_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_17 + u_236_253 * (const 64 (2**21)) + v_236_253 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_17 + r_236_253 * (const 64 (2**21)) + s_236_253 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_17,
    f_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_17,
    g_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 253)) <=s delta, delta <=s (const 64 (1 + 2*253)),
    (const 64 (-(2**20))) <=s u_236_253, u_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_253, v_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_253, r_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_253, s_236_253 <=s (const 64 ((2**20))),
    u_236_253 + v_236_253 <=s (const 64 (2**20)),
    u_236_253 - v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 + v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 - v_236_253 <=s (const 64 (2**20)),
    r_236_253 + s_236_253 <=s (const 64 (2**20)),
    r_236_253 - s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 + s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 - s_236_253 <=s (const 64 (2**20)),
    u_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_236_253 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_252_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_16,
sint64 g_236_low60_0_low20_16,
sint64 f_236_low60_0_low20_17,
sint64 g_236_low60_0_low20_17,
sint64 u_236_252,
sint64 v_236_252,
sint64 r_236_252,
sint64 s_236_252,
sint64 u_236_253,
sint64 v_236_253,
sint64 r_236_253,
sint64 s_236_253,
bit ne
)={
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (-(2**20)),
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (-(2**20))
&&
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (const 64 (-(2**20))),
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_16 + u_236_252 * (const 64 (2**21)) + v_236_252 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_16 + r_236_252 * (const 64 (2**21)) + s_236_252 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_16,
    f_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_16,
    g_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 252)) <=s delta, delta <=s (const 64 (1 + 2*252)),
    (const 64 (-(2**20))) <=s u_236_252, u_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_252, v_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_252, r_236_252 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_252, s_236_252 <=s (const 64 ((2**20))),
    u_236_252 + v_236_252 <=s (const 64 (2**20)),
    u_236_252 - v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 + v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 - v_236_252 <=s (const 64 (2**20)),
    r_236_252 + s_236_252 <=s (const 64 (2**20)),
    r_236_252 - s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 + s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 - s_236_252 <=s (const 64 (2**20)),
    u_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_236_252 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step252

// premise c
assume
g_236_low60_0_low20_16 = 1 (mod 2)
&&
g_236_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_17 g_236_low60_0_low20_16;
mov u_236_253 r_236_252;
mov v_236_253 s_236_252;

subs dc g_236_low60_0_low20_17 g_236_low60_0_low20_16 f_236_low60_0_low20_16;
asr g_236_low60_0_low20_17 g_236_low60_0_low20_17 1;
subs dc r_236_253 r_236_252 u_236_252;
asr r_236_253 r_236_253 1;
subs dc s_236_253 s_236_252 v_236_252;
asr s_236_253 s_236_253 1;
assert
    true
&&
    f_236_low60_0_low20_17 = g_236_low60_0_low20_16,
    u_236_253 = r_236_252,
    v_236_253 = s_236_252,
    g_236_low60_0_low20_17 * (const 64 2) = g_236_low60_0_low20_16 - f_236_low60_0_low20_16,
    r_236_253 * (const 64 2) = r_236_252 - u_236_252,
    s_236_253 * (const 64 2) = s_236_252 - v_236_252
;

assume
    f_236_low60_0_low20_17 = g_236_low60_0_low20_16,
    u_236_253 = r_236_252,
    v_236_253 = s_236_252,
    g_236_low60_0_low20_17 * 2 = g_236_low60_0_low20_16 - f_236_low60_0_low20_16,
    r_236_253 * 2 = r_236_252 - u_236_252,
    s_236_253 * 2 = s_236_252 - v_236_252
&&
    true
;

{
    u_236_253 * f_236_low60_0_low20_0 + v_236_253 * g_236_low60_0_low20_0 = f_236_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_253 * f_236_low60_0_low20_0 + s_236_253 * g_236_low60_0_low20_0 = g_236_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_17 + u_236_253 * (const 64 (2**21)) + v_236_253 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_17 + r_236_253 * (const 64 (2**21)) + s_236_253 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_17,
    f_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_17,
    g_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 253)) <=s delta, delta <=s (const 64 (1 + 2*253)),
    (const 64 (-(2**20))) <=s u_236_253, u_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_253, v_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_253, r_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_253, s_236_253 <=s (const 64 ((2**20))),
    u_236_253 + v_236_253 <=s (const 64 (2**20)),
    u_236_253 - v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 + v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 - v_236_253 <=s (const 64 (2**20)),
    r_236_253 + s_236_253 <=s (const 64 (2**20)),
    r_236_253 - s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 + s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 - s_236_253 <=s (const 64 (2**20)),
    u_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_236_253 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_253_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_17,
sint64 g_236_low60_0_low20_17,
sint64 f_236_low60_0_low20_18,
sint64 g_236_low60_0_low20_18,
sint64 u_236_253,
sint64 v_236_253,
sint64 r_236_253,
sint64 s_236_253,
sint64 u_236_254,
sint64 v_236_254,
sint64 r_236_254,
sint64 s_236_254,
bit ne
)={
    u_236_253 * f_236_low60_0_low20_0 + v_236_253 * g_236_low60_0_low20_0 = f_236_low60_0_low20_17 * (-(2**20)),
    r_236_253 * f_236_low60_0_low20_0 + s_236_253 * g_236_low60_0_low20_0 = g_236_low60_0_low20_17 * (-(2**20))
&&
    u_236_253 * f_236_low60_0_low20_0 + v_236_253 * g_236_low60_0_low20_0 = f_236_low60_0_low20_17 * (const 64 (-(2**20))),
    r_236_253 * f_236_low60_0_low20_0 + s_236_253 * g_236_low60_0_low20_0 = g_236_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_17 + u_236_253 * (const 64 (2**21)) + v_236_253 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_17 + r_236_253 * (const 64 (2**21)) + s_236_253 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_17,
    f_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_17,
    g_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 253)) <=s delta, delta <=s (const 64 (1 + 2*253)),
    (const 64 (-(2**20))) <=s u_236_253, u_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_253, v_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_253, r_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_253, s_236_253 <=s (const 64 ((2**20))),
    u_236_253 + v_236_253 <=s (const 64 (2**20)),
    u_236_253 - v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 + v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 - v_236_253 <=s (const 64 (2**20)),
    r_236_253 + s_236_253 <=s (const 64 (2**20)),
    r_236_253 - s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 + s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 - s_236_253 <=s (const 64 (2**20)),
    u_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_236_253 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step253

// premise a
assume
g_236_low60_0_low20_17 = 0 (mod 2)
&&
g_236_low60_0_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_18 f_236_low60_0_low20_17;
mov u_236_254 u_236_253;
mov v_236_254 v_236_253;

asr g_236_low60_0_low20_18 g_236_low60_0_low20_17 1;
asr r_236_254 r_236_253 1;
asr s_236_254 s_236_253 1;
assert
    true
&&
    f_236_low60_0_low20_18 = f_236_low60_0_low20_17,
    u_236_254 = u_236_253,
    v_236_254 = v_236_253,
    g_236_low60_0_low20_18 * (const 64 2) = g_236_low60_0_low20_17,
    r_236_254 * (const 64 2) = r_236_253,
    s_236_254 * (const 64 2) = s_236_253
;

assume
    f_236_low60_0_low20_18 = f_236_low60_0_low20_17,
    u_236_254 = u_236_253,
    v_236_254 = v_236_253,
    g_236_low60_0_low20_18 * 2 = g_236_low60_0_low20_17,
    r_236_254 * 2 = r_236_253,
    s_236_254 * 2 = s_236_253
&&
    true
;

{
    u_236_254 * f_236_low60_0_low20_0 + v_236_254 * g_236_low60_0_low20_0 = f_236_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_254 * f_236_low60_0_low20_0 + s_236_254 * g_236_low60_0_low20_0 = g_236_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_18 + u_236_254 * (const 64 (2**21)) + v_236_254 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_18 + r_236_254 * (const 64 (2**21)) + s_236_254 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_18,
    f_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_18,
    g_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 254)) <=s delta, delta <=s (const 64 (1 + 2*254)),
    (const 64 (-(2**20))) <=s u_236_254, u_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_254, v_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_254, r_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_254, s_236_254 <=s (const 64 ((2**20))),
    u_236_254 + v_236_254 <=s (const 64 (2**20)),
    u_236_254 - v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 + v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 - v_236_254 <=s (const 64 (2**20)),
    r_236_254 + s_236_254 <=s (const 64 (2**20)),
    r_236_254 - s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 + s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 - s_236_254 <=s (const 64 (2**20)),
    u_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_236_254 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_253_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_17,
sint64 g_236_low60_0_low20_17,
sint64 f_236_low60_0_low20_18,
sint64 g_236_low60_0_low20_18,
sint64 u_236_253,
sint64 v_236_253,
sint64 r_236_253,
sint64 s_236_253,
sint64 u_236_254,
sint64 v_236_254,
sint64 r_236_254,
sint64 s_236_254,
bit ne
)={
    u_236_253 * f_236_low60_0_low20_0 + v_236_253 * g_236_low60_0_low20_0 = f_236_low60_0_low20_17 * (-(2**20)),
    r_236_253 * f_236_low60_0_low20_0 + s_236_253 * g_236_low60_0_low20_0 = g_236_low60_0_low20_17 * (-(2**20))
&&
    u_236_253 * f_236_low60_0_low20_0 + v_236_253 * g_236_low60_0_low20_0 = f_236_low60_0_low20_17 * (const 64 (-(2**20))),
    r_236_253 * f_236_low60_0_low20_0 + s_236_253 * g_236_low60_0_low20_0 = g_236_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_17 + u_236_253 * (const 64 (2**21)) + v_236_253 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_17 + r_236_253 * (const 64 (2**21)) + s_236_253 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_17,
    f_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_17,
    g_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 253)) <=s delta, delta <=s (const 64 (1 + 2*253)),
    (const 64 (-(2**20))) <=s u_236_253, u_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_253, v_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_253, r_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_253, s_236_253 <=s (const 64 ((2**20))),
    u_236_253 + v_236_253 <=s (const 64 (2**20)),
    u_236_253 - v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 + v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 - v_236_253 <=s (const 64 (2**20)),
    r_236_253 + s_236_253 <=s (const 64 (2**20)),
    r_236_253 - s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 + s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 - s_236_253 <=s (const 64 (2**20)),
    u_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_236_253 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step253

// premise b
assume
g_236_low60_0_low20_17 = 1 (mod 2)
&&
g_236_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_18 f_236_low60_0_low20_17;
mov u_236_254 u_236_253;
mov v_236_254 v_236_253;

add g_236_low60_0_low20_18 g_236_low60_0_low20_17 f_236_low60_0_low20_17;
asr g_236_low60_0_low20_18 g_236_low60_0_low20_18 1;
add r_236_254 r_236_253 u_236_253;
asr r_236_254 r_236_254 1;
add s_236_254 s_236_253 v_236_253;
asr s_236_254 s_236_254 1;
assert
    true
&&
    f_236_low60_0_low20_18 = f_236_low60_0_low20_17,
    u_236_254 = u_236_253,
    v_236_254 = v_236_253,
    g_236_low60_0_low20_18 * (const 64 2) = g_236_low60_0_low20_17 + f_236_low60_0_low20_17,
    r_236_254 * (const 64 2) = r_236_253 + u_236_253,
    s_236_254 * (const 64 2) = s_236_253 + v_236_253
;

assume
    f_236_low60_0_low20_18 = f_236_low60_0_low20_17,
    u_236_254 = u_236_253,
    v_236_254 = v_236_253,
    g_236_low60_0_low20_18 * 2 = g_236_low60_0_low20_17 + f_236_low60_0_low20_17,
    r_236_254 * 2 = r_236_253 + u_236_253,
    s_236_254 * 2 = s_236_253 + v_236_253
&&
    true
;

{
    u_236_254 * f_236_low60_0_low20_0 + v_236_254 * g_236_low60_0_low20_0 = f_236_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_254 * f_236_low60_0_low20_0 + s_236_254 * g_236_low60_0_low20_0 = g_236_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_18 + u_236_254 * (const 64 (2**21)) + v_236_254 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_18 + r_236_254 * (const 64 (2**21)) + s_236_254 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_18,
    f_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_18,
    g_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 254)) <=s delta, delta <=s (const 64 (1 + 2*254)),
    (const 64 (-(2**20))) <=s u_236_254, u_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_254, v_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_254, r_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_254, s_236_254 <=s (const 64 ((2**20))),
    u_236_254 + v_236_254 <=s (const 64 (2**20)),
    u_236_254 - v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 + v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 - v_236_254 <=s (const 64 (2**20)),
    r_236_254 + s_236_254 <=s (const 64 (2**20)),
    r_236_254 - s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 + s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 - s_236_254 <=s (const 64 (2**20)),
    u_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_236_254 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_253_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_17,
sint64 g_236_low60_0_low20_17,
sint64 f_236_low60_0_low20_18,
sint64 g_236_low60_0_low20_18,
sint64 u_236_253,
sint64 v_236_253,
sint64 r_236_253,
sint64 s_236_253,
sint64 u_236_254,
sint64 v_236_254,
sint64 r_236_254,
sint64 s_236_254,
bit ne
)={
    u_236_253 * f_236_low60_0_low20_0 + v_236_253 * g_236_low60_0_low20_0 = f_236_low60_0_low20_17 * (-(2**20)),
    r_236_253 * f_236_low60_0_low20_0 + s_236_253 * g_236_low60_0_low20_0 = g_236_low60_0_low20_17 * (-(2**20))
&&
    u_236_253 * f_236_low60_0_low20_0 + v_236_253 * g_236_low60_0_low20_0 = f_236_low60_0_low20_17 * (const 64 (-(2**20))),
    r_236_253 * f_236_low60_0_low20_0 + s_236_253 * g_236_low60_0_low20_0 = g_236_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_17 + u_236_253 * (const 64 (2**21)) + v_236_253 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_17 + r_236_253 * (const 64 (2**21)) + s_236_253 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_17,
    f_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_17,
    g_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 253)) <=s delta, delta <=s (const 64 (1 + 2*253)),
    (const 64 (-(2**20))) <=s u_236_253, u_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_253, v_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_253, r_236_253 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_253, s_236_253 <=s (const 64 ((2**20))),
    u_236_253 + v_236_253 <=s (const 64 (2**20)),
    u_236_253 - v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 + v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 - v_236_253 <=s (const 64 (2**20)),
    r_236_253 + s_236_253 <=s (const 64 (2**20)),
    r_236_253 - s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 + s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 - s_236_253 <=s (const 64 (2**20)),
    u_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_236_253 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step253

// premise c
assume
g_236_low60_0_low20_17 = 1 (mod 2)
&&
g_236_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_18 g_236_low60_0_low20_17;
mov u_236_254 r_236_253;
mov v_236_254 s_236_253;

subs dc g_236_low60_0_low20_18 g_236_low60_0_low20_17 f_236_low60_0_low20_17;
asr g_236_low60_0_low20_18 g_236_low60_0_low20_18 1;
subs dc r_236_254 r_236_253 u_236_253;
asr r_236_254 r_236_254 1;
subs dc s_236_254 s_236_253 v_236_253;
asr s_236_254 s_236_254 1;
assert
    true
&&
    f_236_low60_0_low20_18 = g_236_low60_0_low20_17,
    u_236_254 = r_236_253,
    v_236_254 = s_236_253,
    g_236_low60_0_low20_18 * (const 64 2) = g_236_low60_0_low20_17 - f_236_low60_0_low20_17,
    r_236_254 * (const 64 2) = r_236_253 - u_236_253,
    s_236_254 * (const 64 2) = s_236_253 - v_236_253
;

assume
    f_236_low60_0_low20_18 = g_236_low60_0_low20_17,
    u_236_254 = r_236_253,
    v_236_254 = s_236_253,
    g_236_low60_0_low20_18 * 2 = g_236_low60_0_low20_17 - f_236_low60_0_low20_17,
    r_236_254 * 2 = r_236_253 - u_236_253,
    s_236_254 * 2 = s_236_253 - v_236_253
&&
    true
;

{
    u_236_254 * f_236_low60_0_low20_0 + v_236_254 * g_236_low60_0_low20_0 = f_236_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_254 * f_236_low60_0_low20_0 + s_236_254 * g_236_low60_0_low20_0 = g_236_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_18 + u_236_254 * (const 64 (2**21)) + v_236_254 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_18 + r_236_254 * (const 64 (2**21)) + s_236_254 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_18,
    f_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_18,
    g_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 254)) <=s delta, delta <=s (const 64 (1 + 2*254)),
    (const 64 (-(2**20))) <=s u_236_254, u_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_254, v_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_254, r_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_254, s_236_254 <=s (const 64 ((2**20))),
    u_236_254 + v_236_254 <=s (const 64 (2**20)),
    u_236_254 - v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 + v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 - v_236_254 <=s (const 64 (2**20)),
    r_236_254 + s_236_254 <=s (const 64 (2**20)),
    r_236_254 - s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 + s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 - s_236_254 <=s (const 64 (2**20)),
    u_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_236_254 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_254_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_18,
sint64 g_236_low60_0_low20_18,
sint64 f_236_low60_0_low20_19,
sint64 g_236_low60_0_low20_19,
sint64 u_236_254,
sint64 v_236_254,
sint64 r_236_254,
sint64 s_236_254,
sint64 u_236_255,
sint64 v_236_255,
sint64 r_236_255,
sint64 s_236_255,
bit ne
)={
    u_236_254 * f_236_low60_0_low20_0 + v_236_254 * g_236_low60_0_low20_0 = f_236_low60_0_low20_18 * (-(2**20)),
    r_236_254 * f_236_low60_0_low20_0 + s_236_254 * g_236_low60_0_low20_0 = g_236_low60_0_low20_18 * (-(2**20))
&&
    u_236_254 * f_236_low60_0_low20_0 + v_236_254 * g_236_low60_0_low20_0 = f_236_low60_0_low20_18 * (const 64 (-(2**20))),
    r_236_254 * f_236_low60_0_low20_0 + s_236_254 * g_236_low60_0_low20_0 = g_236_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_18 + u_236_254 * (const 64 (2**21)) + v_236_254 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_18 + r_236_254 * (const 64 (2**21)) + s_236_254 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_18,
    f_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_18,
    g_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 254)) <=s delta, delta <=s (const 64 (1 + 2*254)),
    (const 64 (-(2**20))) <=s u_236_254, u_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_254, v_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_254, r_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_254, s_236_254 <=s (const 64 ((2**20))),
    u_236_254 + v_236_254 <=s (const 64 (2**20)),
    u_236_254 - v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 + v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 - v_236_254 <=s (const 64 (2**20)),
    r_236_254 + s_236_254 <=s (const 64 (2**20)),
    r_236_254 - s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 + s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 - s_236_254 <=s (const 64 (2**20)),
    u_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_236_254 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step254

// premise a
assume
g_236_low60_0_low20_18 = 0 (mod 2)
&&
g_236_low60_0_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_0_low20_19 f_236_low60_0_low20_18;
mov u_236_255 u_236_254;
mov v_236_255 v_236_254;

asr g_236_low60_0_low20_19 g_236_low60_0_low20_18 1;
asr r_236_255 r_236_254 1;
asr s_236_255 s_236_254 1;
assert
    true
&&
    f_236_low60_0_low20_19 = f_236_low60_0_low20_18,
    u_236_255 = u_236_254,
    v_236_255 = v_236_254,
    g_236_low60_0_low20_19 * (const 64 2) = g_236_low60_0_low20_18,
    r_236_255 * (const 64 2) = r_236_254,
    s_236_255 * (const 64 2) = s_236_254
;

assume
    f_236_low60_0_low20_19 = f_236_low60_0_low20_18,
    u_236_255 = u_236_254,
    v_236_255 = v_236_254,
    g_236_low60_0_low20_19 * 2 = g_236_low60_0_low20_18,
    r_236_255 * 2 = r_236_254,
    s_236_255 * 2 = s_236_254
&&
    true
;

{
    u_236_255 * f_236_low60_0_low20_0 + v_236_255 * g_236_low60_0_low20_0 = f_236_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_255 * f_236_low60_0_low20_0 + s_236_255 * g_236_low60_0_low20_0 = g_236_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_19 + u_236_255 * (const 64 (2**21)) + v_236_255 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_19 + r_236_255 * (const 64 (2**21)) + s_236_255 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_19,
    f_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_19,
    g_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 255)) <=s delta, delta <=s (const 64 (1 + 2*255)),
    (const 64 (-(2**20))) <=s u_236_255, u_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_255, v_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_255, r_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_255, s_236_255 <=s (const 64 ((2**20))),
    u_236_255 + v_236_255 <=s (const 64 (2**20)),
    u_236_255 - v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 + v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 - v_236_255 <=s (const 64 (2**20)),
    r_236_255 + s_236_255 <=s (const 64 (2**20)),
    r_236_255 - s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 + s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 - s_236_255 <=s (const 64 (2**20)),
    u_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_236_255 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_254_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_18,
sint64 g_236_low60_0_low20_18,
sint64 f_236_low60_0_low20_19,
sint64 g_236_low60_0_low20_19,
sint64 u_236_254,
sint64 v_236_254,
sint64 r_236_254,
sint64 s_236_254,
sint64 u_236_255,
sint64 v_236_255,
sint64 r_236_255,
sint64 s_236_255,
bit ne
)={
    u_236_254 * f_236_low60_0_low20_0 + v_236_254 * g_236_low60_0_low20_0 = f_236_low60_0_low20_18 * (-(2**20)),
    r_236_254 * f_236_low60_0_low20_0 + s_236_254 * g_236_low60_0_low20_0 = g_236_low60_0_low20_18 * (-(2**20))
&&
    u_236_254 * f_236_low60_0_low20_0 + v_236_254 * g_236_low60_0_low20_0 = f_236_low60_0_low20_18 * (const 64 (-(2**20))),
    r_236_254 * f_236_low60_0_low20_0 + s_236_254 * g_236_low60_0_low20_0 = g_236_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_18 + u_236_254 * (const 64 (2**21)) + v_236_254 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_18 + r_236_254 * (const 64 (2**21)) + s_236_254 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_18,
    f_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_18,
    g_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 254)) <=s delta, delta <=s (const 64 (1 + 2*254)),
    (const 64 (-(2**20))) <=s u_236_254, u_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_254, v_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_254, r_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_254, s_236_254 <=s (const 64 ((2**20))),
    u_236_254 + v_236_254 <=s (const 64 (2**20)),
    u_236_254 - v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 + v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 - v_236_254 <=s (const 64 (2**20)),
    r_236_254 + s_236_254 <=s (const 64 (2**20)),
    r_236_254 - s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 + s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 - s_236_254 <=s (const 64 (2**20)),
    u_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_236_254 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step254

// premise b
assume
g_236_low60_0_low20_18 = 1 (mod 2)
&&
g_236_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_19 f_236_low60_0_low20_18;
mov u_236_255 u_236_254;
mov v_236_255 v_236_254;

add g_236_low60_0_low20_19 g_236_low60_0_low20_18 f_236_low60_0_low20_18;
asr g_236_low60_0_low20_19 g_236_low60_0_low20_19 1;
add r_236_255 r_236_254 u_236_254;
asr r_236_255 r_236_255 1;
add s_236_255 s_236_254 v_236_254;
asr s_236_255 s_236_255 1;
assert
    true
&&
    f_236_low60_0_low20_19 = f_236_low60_0_low20_18,
    u_236_255 = u_236_254,
    v_236_255 = v_236_254,
    g_236_low60_0_low20_19 * (const 64 2) = g_236_low60_0_low20_18 + f_236_low60_0_low20_18,
    r_236_255 * (const 64 2) = r_236_254 + u_236_254,
    s_236_255 * (const 64 2) = s_236_254 + v_236_254
;

assume
    f_236_low60_0_low20_19 = f_236_low60_0_low20_18,
    u_236_255 = u_236_254,
    v_236_255 = v_236_254,
    g_236_low60_0_low20_19 * 2 = g_236_low60_0_low20_18 + f_236_low60_0_low20_18,
    r_236_255 * 2 = r_236_254 + u_236_254,
    s_236_255 * 2 = s_236_254 + v_236_254
&&
    true
;

{
    u_236_255 * f_236_low60_0_low20_0 + v_236_255 * g_236_low60_0_low20_0 = f_236_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_255 * f_236_low60_0_low20_0 + s_236_255 * g_236_low60_0_low20_0 = g_236_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_19 + u_236_255 * (const 64 (2**21)) + v_236_255 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_19 + r_236_255 * (const 64 (2**21)) + s_236_255 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_19,
    f_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_19,
    g_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 255)) <=s delta, delta <=s (const 64 (1 + 2*255)),
    (const 64 (-(2**20))) <=s u_236_255, u_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_255, v_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_255, r_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_255, s_236_255 <=s (const 64 ((2**20))),
    u_236_255 + v_236_255 <=s (const 64 (2**20)),
    u_236_255 - v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 + v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 - v_236_255 <=s (const 64 (2**20)),
    r_236_255 + s_236_255 <=s (const 64 (2**20)),
    r_236_255 - s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 + s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 - s_236_255 <=s (const 64 (2**20)),
    u_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_236_255 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_254_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_18,
sint64 g_236_low60_0_low20_18,
sint64 f_236_low60_0_low20_19,
sint64 g_236_low60_0_low20_19,
sint64 u_236_254,
sint64 v_236_254,
sint64 r_236_254,
sint64 s_236_254,
sint64 u_236_255,
sint64 v_236_255,
sint64 r_236_255,
sint64 s_236_255,
bit ne
)={
    u_236_254 * f_236_low60_0_low20_0 + v_236_254 * g_236_low60_0_low20_0 = f_236_low60_0_low20_18 * (-(2**20)),
    r_236_254 * f_236_low60_0_low20_0 + s_236_254 * g_236_low60_0_low20_0 = g_236_low60_0_low20_18 * (-(2**20))
&&
    u_236_254 * f_236_low60_0_low20_0 + v_236_254 * g_236_low60_0_low20_0 = f_236_low60_0_low20_18 * (const 64 (-(2**20))),
    r_236_254 * f_236_low60_0_low20_0 + s_236_254 * g_236_low60_0_low20_0 = g_236_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_18 + u_236_254 * (const 64 (2**21)) + v_236_254 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_18 + r_236_254 * (const 64 (2**21)) + s_236_254 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_18,
    f_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_18,
    g_236_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 254)) <=s delta, delta <=s (const 64 (1 + 2*254)),
    (const 64 (-(2**20))) <=s u_236_254, u_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_254, v_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_254, r_236_254 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_254, s_236_254 <=s (const 64 ((2**20))),
    u_236_254 + v_236_254 <=s (const 64 (2**20)),
    u_236_254 - v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 + v_236_254 <=s (const 64 (2**20)),
    (const 64 0) - u_236_254 - v_236_254 <=s (const 64 (2**20)),
    r_236_254 + s_236_254 <=s (const 64 (2**20)),
    r_236_254 - s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 + s_236_254 <=s (const 64 (2**20)),
    (const 64 0) - r_236_254 - s_236_254 <=s (const 64 (2**20)),
    u_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_236_254 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_236_254 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step254

// premise c
assume
g_236_low60_0_low20_18 = 1 (mod 2)
&&
g_236_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_19 g_236_low60_0_low20_18;
mov u_236_255 r_236_254;
mov v_236_255 s_236_254;

subs dc g_236_low60_0_low20_19 g_236_low60_0_low20_18 f_236_low60_0_low20_18;
asr g_236_low60_0_low20_19 g_236_low60_0_low20_19 1;
subs dc r_236_255 r_236_254 u_236_254;
asr r_236_255 r_236_255 1;
subs dc s_236_255 s_236_254 v_236_254;
asr s_236_255 s_236_255 1;
assert
    true
&&
    f_236_low60_0_low20_19 = g_236_low60_0_low20_18,
    u_236_255 = r_236_254,
    v_236_255 = s_236_254,
    g_236_low60_0_low20_19 * (const 64 2) = g_236_low60_0_low20_18 - f_236_low60_0_low20_18,
    r_236_255 * (const 64 2) = r_236_254 - u_236_254,
    s_236_255 * (const 64 2) = s_236_254 - v_236_254
;

assume
    f_236_low60_0_low20_19 = g_236_low60_0_low20_18,
    u_236_255 = r_236_254,
    v_236_255 = s_236_254,
    g_236_low60_0_low20_19 * 2 = g_236_low60_0_low20_18 - f_236_low60_0_low20_18,
    r_236_255 * 2 = r_236_254 - u_236_254,
    s_236_255 * 2 = s_236_254 - v_236_254
&&
    true
;

{
    u_236_255 * f_236_low60_0_low20_0 + v_236_255 * g_236_low60_0_low20_0 = f_236_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_255 * f_236_low60_0_low20_0 + s_236_255 * g_236_low60_0_low20_0 = g_236_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_19 + u_236_255 * (const 64 (2**21)) + v_236_255 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_19 + r_236_255 * (const 64 (2**21)) + s_236_255 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_19,
    f_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_19,
    g_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 255)) <=s delta, delta <=s (const 64 (1 + 2*255)),
    (const 64 (-(2**20))) <=s u_236_255, u_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_255, v_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_255, r_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_255, s_236_255 <=s (const 64 ((2**20))),
    u_236_255 + v_236_255 <=s (const 64 (2**20)),
    u_236_255 - v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 + v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 - v_236_255 <=s (const 64 (2**20)),
    r_236_255 + s_236_255 <=s (const 64 (2**20)),
    r_236_255 - s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 + s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 - s_236_255 <=s (const 64 (2**20)),
    u_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_236_255 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_255_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_19,
sint64 g_236_low60_0_low20_19,
sint64 f_236_low60_0_low20_20,
sint64 g_236_low60_0_low20_20,
sint64 u_236_255,
sint64 v_236_255,
sint64 r_236_255,
sint64 s_236_255,
sint64 u_236_256,
sint64 v_236_256,
sint64 r_236_256,
sint64 s_236_256,
bit ne
)={
    u_236_255 * f_236_low60_0_low20_0 + v_236_255 * g_236_low60_0_low20_0 = f_236_low60_0_low20_19 * (-(2**20)),
    r_236_255 * f_236_low60_0_low20_0 + s_236_255 * g_236_low60_0_low20_0 = g_236_low60_0_low20_19 * (-(2**20))
&&
    u_236_255 * f_236_low60_0_low20_0 + v_236_255 * g_236_low60_0_low20_0 = f_236_low60_0_low20_19 * (const 64 (-(2**20))),
    r_236_255 * f_236_low60_0_low20_0 + s_236_255 * g_236_low60_0_low20_0 = g_236_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_19 + u_236_255 * (const 64 (2**21)) + v_236_255 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_19 + r_236_255 * (const 64 (2**21)) + s_236_255 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_19,
    f_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_19,
    g_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 255)) <=s delta, delta <=s (const 64 (1 + 2*255)),
    (const 64 (-(2**20))) <=s u_236_255, u_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_255, v_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_255, r_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_255, s_236_255 <=s (const 64 ((2**20))),
    u_236_255 + v_236_255 <=s (const 64 (2**20)),
    u_236_255 - v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 + v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 - v_236_255 <=s (const 64 (2**20)),
    r_236_255 + s_236_255 <=s (const 64 (2**20)),
    r_236_255 - s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 + s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 - s_236_255 <=s (const 64 (2**20)),
    u_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_236_255 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step255

// premise a
assume
g_236_low60_0_low20_19 = 0 (mod 2)
&&
g_236_low60_0_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov f_236_low60_0_low20_20 f_236_low60_0_low20_19;
mov u_236_256 u_236_255;
mov v_236_256 v_236_255;

asr g_236_low60_0_low20_20 g_236_low60_0_low20_19 1;
asr r_236_256 r_236_255 1;
asr s_236_256 s_236_255 1;
assert
    true
&&
    f_236_low60_0_low20_20 = f_236_low60_0_low20_19,
    u_236_256 = u_236_255,
    v_236_256 = v_236_255,
    g_236_low60_0_low20_20 * (const 64 2) = g_236_low60_0_low20_19,
    r_236_256 * (const 64 2) = r_236_255,
    s_236_256 * (const 64 2) = s_236_255
;

assume
    f_236_low60_0_low20_20 = f_236_low60_0_low20_19,
    u_236_256 = u_236_255,
    v_236_256 = v_236_255,
    g_236_low60_0_low20_20 * 2 = g_236_low60_0_low20_19,
    r_236_256 * 2 = r_236_255,
    s_236_256 * 2 = s_236_255
&&
    true
;

{
    u_236_256 * f_236_low60_0_low20_0 + v_236_256 * g_236_low60_0_low20_0 = f_236_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_256 * f_236_low60_0_low20_0 + s_236_256 * g_236_low60_0_low20_0 = g_236_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_20 + u_236_256 * (const 64 (2**21)) + v_236_256 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_20 + r_236_256 * (const 64 (2**21)) + s_236_256 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_20,
    f_236_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_20,
    g_236_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 256)) <=s delta, delta <=s (const 64 (1 + 2*256)),
    (const 64 (-(2**20))) <=s u_236_256, u_236_256 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_256, v_236_256 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_256, r_236_256 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_256, s_236_256 <=s (const 64 ((2**20))),
    u_236_256 + v_236_256 <=s (const 64 (2**20)),
    u_236_256 - v_236_256 <=s (const 64 (2**20)),
    (const 64 0) - u_236_256 + v_236_256 <=s (const 64 (2**20)),
    (const 64 0) - u_236_256 - v_236_256 <=s (const 64 (2**20)),
    r_236_256 + s_236_256 <=s (const 64 (2**20)),
    r_236_256 - s_236_256 <=s (const 64 (2**20)),
    (const 64 0) - r_236_256 + s_236_256 <=s (const 64 (2**20)),
    (const 64 0) - r_236_256 - s_236_256 <=s (const 64 (2**20)),
    u_236_256 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_236_256 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_236_256 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_236_256 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_255_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_19,
sint64 g_236_low60_0_low20_19,
sint64 f_236_low60_0_low20_20,
sint64 g_236_low60_0_low20_20,
sint64 u_236_255,
sint64 v_236_255,
sint64 r_236_255,
sint64 s_236_255,
sint64 u_236_256,
sint64 v_236_256,
sint64 r_236_256,
sint64 s_236_256,
bit ne
)={
    u_236_255 * f_236_low60_0_low20_0 + v_236_255 * g_236_low60_0_low20_0 = f_236_low60_0_low20_19 * (-(2**20)),
    r_236_255 * f_236_low60_0_low20_0 + s_236_255 * g_236_low60_0_low20_0 = g_236_low60_0_low20_19 * (-(2**20))
&&
    u_236_255 * f_236_low60_0_low20_0 + v_236_255 * g_236_low60_0_low20_0 = f_236_low60_0_low20_19 * (const 64 (-(2**20))),
    r_236_255 * f_236_low60_0_low20_0 + s_236_255 * g_236_low60_0_low20_0 = g_236_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_19 + u_236_255 * (const 64 (2**21)) + v_236_255 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_19 + r_236_255 * (const 64 (2**21)) + s_236_255 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_19,
    f_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_19,
    g_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 255)) <=s delta, delta <=s (const 64 (1 + 2*255)),
    (const 64 (-(2**20))) <=s u_236_255, u_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_255, v_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_255, r_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_255, s_236_255 <=s (const 64 ((2**20))),
    u_236_255 + v_236_255 <=s (const 64 (2**20)),
    u_236_255 - v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 + v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 - v_236_255 <=s (const 64 (2**20)),
    r_236_255 + s_236_255 <=s (const 64 (2**20)),
    r_236_255 - s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 + s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 - s_236_255 <=s (const 64 (2**20)),
    u_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_236_255 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step255

// premise b
assume
g_236_low60_0_low20_19 = 1 (mod 2)
&&
g_236_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_20 f_236_low60_0_low20_19;
mov u_236_256 u_236_255;
mov v_236_256 v_236_255;

add g_236_low60_0_low20_20 g_236_low60_0_low20_19 f_236_low60_0_low20_19;
asr g_236_low60_0_low20_20 g_236_low60_0_low20_20 1;
add r_236_256 r_236_255 u_236_255;
asr r_236_256 r_236_256 1;
add s_236_256 s_236_255 v_236_255;
asr s_236_256 s_236_256 1;
assert
    true
&&
    f_236_low60_0_low20_20 = f_236_low60_0_low20_19,
    u_236_256 = u_236_255,
    v_236_256 = v_236_255,
    g_236_low60_0_low20_20 * (const 64 2) = g_236_low60_0_low20_19 + f_236_low60_0_low20_19,
    r_236_256 * (const 64 2) = r_236_255 + u_236_255,
    s_236_256 * (const 64 2) = s_236_255 + v_236_255
;

assume
    f_236_low60_0_low20_20 = f_236_low60_0_low20_19,
    u_236_256 = u_236_255,
    v_236_256 = v_236_255,
    g_236_low60_0_low20_20 * 2 = g_236_low60_0_low20_19 + f_236_low60_0_low20_19,
    r_236_256 * 2 = r_236_255 + u_236_255,
    s_236_256 * 2 = s_236_255 + v_236_255
&&
    true
;

{
    u_236_256 * f_236_low60_0_low20_0 + v_236_256 * g_236_low60_0_low20_0 = f_236_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_256 * f_236_low60_0_low20_0 + s_236_256 * g_236_low60_0_low20_0 = g_236_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_20 + u_236_256 * (const 64 (2**21)) + v_236_256 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_20 + r_236_256 * (const 64 (2**21)) + s_236_256 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_20,
    f_236_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_20,
    g_236_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 256)) <=s delta, delta <=s (const 64 (1 + 2*256)),
    (const 64 (-(2**20))) <=s u_236_256, u_236_256 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_256, v_236_256 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_256, r_236_256 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_256, s_236_256 <=s (const 64 ((2**20))),
    u_236_256 + v_236_256 <=s (const 64 (2**20)),
    u_236_256 - v_236_256 <=s (const 64 (2**20)),
    (const 64 0) - u_236_256 + v_236_256 <=s (const 64 (2**20)),
    (const 64 0) - u_236_256 - v_236_256 <=s (const 64 (2**20)),
    r_236_256 + s_236_256 <=s (const 64 (2**20)),
    r_236_256 - s_236_256 <=s (const 64 (2**20)),
    (const 64 0) - r_236_256 + s_236_256 <=s (const 64 (2**20)),
    (const 64 0) - r_236_256 - s_236_256 <=s (const 64 (2**20)),
    u_236_256 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_236_256 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_236_256 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_236_256 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_255_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_19,
sint64 g_236_low60_0_low20_19,
sint64 f_236_low60_0_low20_20,
sint64 g_236_low60_0_low20_20,
sint64 u_236_255,
sint64 v_236_255,
sint64 r_236_255,
sint64 s_236_255,
sint64 u_236_256,
sint64 v_236_256,
sint64 r_236_256,
sint64 s_236_256,
bit ne
)={
    u_236_255 * f_236_low60_0_low20_0 + v_236_255 * g_236_low60_0_low20_0 = f_236_low60_0_low20_19 * (-(2**20)),
    r_236_255 * f_236_low60_0_low20_0 + s_236_255 * g_236_low60_0_low20_0 = g_236_low60_0_low20_19 * (-(2**20))
&&
    u_236_255 * f_236_low60_0_low20_0 + v_236_255 * g_236_low60_0_low20_0 = f_236_low60_0_low20_19 * (const 64 (-(2**20))),
    r_236_255 * f_236_low60_0_low20_0 + s_236_255 * g_236_low60_0_low20_0 = g_236_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_19 + u_236_255 * (const 64 (2**21)) + v_236_255 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_19 + r_236_255 * (const 64 (2**21)) + s_236_255 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_19,
    f_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_19,
    g_236_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 255)) <=s delta, delta <=s (const 64 (1 + 2*255)),
    (const 64 (-(2**20))) <=s u_236_255, u_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_255, v_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_255, r_236_255 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_255, s_236_255 <=s (const 64 ((2**20))),
    u_236_255 + v_236_255 <=s (const 64 (2**20)),
    u_236_255 - v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 + v_236_255 <=s (const 64 (2**20)),
    (const 64 0) - u_236_255 - v_236_255 <=s (const 64 (2**20)),
    r_236_255 + s_236_255 <=s (const 64 (2**20)),
    r_236_255 - s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 + s_236_255 <=s (const 64 (2**20)),
    (const 64 0) - r_236_255 - s_236_255 <=s (const 64 (2**20)),
    u_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_236_255 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_236_255 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step255

// premise c
assume
g_236_low60_0_low20_19 = 1 (mod 2)
&&
g_236_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_20 g_236_low60_0_low20_19;
mov u_236_256 r_236_255;
mov v_236_256 s_236_255;

subs dc g_236_low60_0_low20_20 g_236_low60_0_low20_19 f_236_low60_0_low20_19;
asr g_236_low60_0_low20_20 g_236_low60_0_low20_20 1;
subs dc r_236_256 r_236_255 u_236_255;
asr r_236_256 r_236_256 1;
subs dc s_236_256 s_236_255 v_236_255;
asr s_236_256 s_236_256 1;
assert
    true
&&
    f_236_low60_0_low20_20 = g_236_low60_0_low20_19,
    u_236_256 = r_236_255,
    v_236_256 = s_236_255,
    g_236_low60_0_low20_20 * (const 64 2) = g_236_low60_0_low20_19 - f_236_low60_0_low20_19,
    r_236_256 * (const 64 2) = r_236_255 - u_236_255,
    s_236_256 * (const 64 2) = s_236_255 - v_236_255
;

assume
    f_236_low60_0_low20_20 = g_236_low60_0_low20_19,
    u_236_256 = r_236_255,
    v_236_256 = s_236_255,
    g_236_low60_0_low20_20 * 2 = g_236_low60_0_low20_19 - f_236_low60_0_low20_19,
    r_236_256 * 2 = r_236_255 - u_236_255,
    s_236_256 * 2 = s_236_255 - v_236_255
&&
    true
;

{
    u_236_256 * f_236_low60_0_low20_0 + v_236_256 * g_236_low60_0_low20_0 = f_236_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_256 * f_236_low60_0_low20_0 + s_236_256 * g_236_low60_0_low20_0 = g_236_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_20 + u_236_256 * (const 64 (2**21)) + v_236_256 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_20 + r_236_256 * (const 64 (2**21)) + s_236_256 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_20,
    f_236_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_20,
    g_236_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 256)) <=s delta, delta <=s (const 64 (1 + 2*256)),
    (const 64 (-(2**20))) <=s u_236_256, u_236_256 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_256, v_236_256 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_256, r_236_256 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_256, s_236_256 <=s (const 64 ((2**20))),
    u_236_256 + v_236_256 <=s (const 64 (2**20)),
    u_236_256 - v_236_256 <=s (const 64 (2**20)),
    (const 64 0) - u_236_256 + v_236_256 <=s (const 64 (2**20)),
    (const 64 0) - u_236_256 - v_236_256 <=s (const 64 (2**20)),
    r_236_256 + s_236_256 <=s (const 64 (2**20)),
    r_236_256 - s_236_256 <=s (const 64 (2**20)),
    (const 64 0) - r_236_256 + s_236_256 <=s (const 64 (2**20)),
    (const 64 0) - r_236_256 - s_236_256 <=s (const 64 (2**20)),
    u_236_256 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_236_256 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_236_256 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_236_256 = (const 64 0) (mod (const 64 (2**(20-20))))
}

