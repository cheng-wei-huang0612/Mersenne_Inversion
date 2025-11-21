proc divstep_512_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_1,
sint64 g_472_low60_40_low20_1,
sint64 u_512_512,
sint64 v_512_512,
sint64 r_512_512,
sint64 s_512_512,
sint64 u_512_513,
sint64 v_512_513,
sint64 r_512_513,
sint64 s_512_513,
bit ne
)={
    u_512_512 * f_472_low60_40_low20_0 + v_512_512 * g_472_low60_40_low20_0 = f_472_low60_40_low20_0 * (-(2**20)),
    r_512_512 * f_472_low60_40_low20_0 + s_512_512 * g_472_low60_40_low20_0 = g_472_low60_40_low20_0 * (-(2**20))
&&
    u_512_512 * f_472_low60_40_low20_0 + v_512_512 * g_472_low60_40_low20_0 = f_472_low60_40_low20_0 * (const 64 (-(2**20))),
    r_512_512 * f_472_low60_40_low20_0 + s_512_512 * g_472_low60_40_low20_0 = g_472_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_0 + u_512_512 * (const 64 (2**21)) + v_512_512 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_0 + r_512_512 * (const 64 (2**21)) + s_512_512 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 512)) <=s delta, delta <=s (const 64 (1 + 2*512)),
    u_512_512 = (const 64 (-(2**20))),
    v_512_512 = (const 64 (0)),
    r_512_512 = (const 64 (0)),
    s_512_512 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise a
assume
g_472_low60_40_low20_0 = 0 (mod 2)
&&
g_472_low60_40_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_472_low60_40_low20_1 f_472_low60_40_low20_0;
mov u_512_513 u_512_512;
mov v_512_513 v_512_512;

asr g_472_low60_40_low20_1 g_472_low60_40_low20_0 1;
asr r_512_513 r_512_512 1;
asr s_512_513 s_512_512 1;
assert
    true
&&
    f_472_low60_40_low20_1 = f_472_low60_40_low20_0,
    u_512_513 = u_512_512,
    v_512_513 = v_512_512,
    g_472_low60_40_low20_1 * (const 64 2) = g_472_low60_40_low20_0,
    r_512_513 * (const 64 2) = r_512_512,
    s_512_513 * (const 64 2) = s_512_512
;

assume
    f_472_low60_40_low20_1 = f_472_low60_40_low20_0,
    u_512_513 = u_512_512,
    v_512_513 = v_512_512,
    g_472_low60_40_low20_1 * 2 = g_472_low60_40_low20_0,
    r_512_513 * 2 = r_512_512,
    s_512_513 * 2 = s_512_512
&&
    true
;

{
    u_512_513 * f_472_low60_40_low20_0 + v_512_513 * g_472_low60_40_low20_0 = f_472_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_513 * f_472_low60_40_low20_0 + s_512_513 * g_472_low60_40_low20_0 = g_472_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_1 + u_512_513 * (const 64 (2**21)) + v_512_513 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_1 + r_512_513 * (const 64 (2**21)) + s_512_513 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_1,
    f_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_1,
    g_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 513)) <=s delta, delta <=s (const 64 (1 + 2*513)),
    (const 64 (-(2**20))) <=s u_512_513, u_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_513, v_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_513, r_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_513, s_512_513 <=s (const 64 ((2**20))),
    u_512_513 + v_512_513 <=s (const 64 (2**20)),
    u_512_513 - v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 + v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 - v_512_513 <=s (const 64 (2**20)),
    r_512_513 + s_512_513 <=s (const 64 (2**20)),
    r_512_513 - s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 + s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 - s_512_513 <=s (const 64 (2**20)),
    u_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_512_513 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_512_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_1,
sint64 g_472_low60_40_low20_1,
sint64 u_512_512,
sint64 v_512_512,
sint64 r_512_512,
sint64 s_512_512,
sint64 u_512_513,
sint64 v_512_513,
sint64 r_512_513,
sint64 s_512_513,
bit ne
)={
    u_512_512 * f_472_low60_40_low20_0 + v_512_512 * g_472_low60_40_low20_0 = f_472_low60_40_low20_0 * (-(2**20)),
    r_512_512 * f_472_low60_40_low20_0 + s_512_512 * g_472_low60_40_low20_0 = g_472_low60_40_low20_0 * (-(2**20))
&&
    u_512_512 * f_472_low60_40_low20_0 + v_512_512 * g_472_low60_40_low20_0 = f_472_low60_40_low20_0 * (const 64 (-(2**20))),
    r_512_512 * f_472_low60_40_low20_0 + s_512_512 * g_472_low60_40_low20_0 = g_472_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_0 + u_512_512 * (const 64 (2**21)) + v_512_512 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_0 + r_512_512 * (const 64 (2**21)) + s_512_512 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 512)) <=s delta, delta <=s (const 64 (1 + 2*512)),
    u_512_512 = (const 64 (-(2**20))),
    v_512_512 = (const 64 (0)),
    r_512_512 = (const 64 (0)),
    s_512_512 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise b
assume
g_472_low60_40_low20_0 = 1 (mod 2)
&&
g_472_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_1 f_472_low60_40_low20_0;
mov u_512_513 u_512_512;
mov v_512_513 v_512_512;

add g_472_low60_40_low20_1 g_472_low60_40_low20_0 f_472_low60_40_low20_0;
asr g_472_low60_40_low20_1 g_472_low60_40_low20_1 1;
add r_512_513 r_512_512 u_512_512;
asr r_512_513 r_512_513 1;
add s_512_513 s_512_512 v_512_512;
asr s_512_513 s_512_513 1;
assert
    true
&&
    f_472_low60_40_low20_1 = f_472_low60_40_low20_0,
    u_512_513 = u_512_512,
    v_512_513 = v_512_512,
    g_472_low60_40_low20_1 * (const 64 2) = g_472_low60_40_low20_0 + f_472_low60_40_low20_0,
    r_512_513 * (const 64 2) = r_512_512 + u_512_512,
    s_512_513 * (const 64 2) = s_512_512 + v_512_512
;

assume
    f_472_low60_40_low20_1 = f_472_low60_40_low20_0,
    u_512_513 = u_512_512,
    v_512_513 = v_512_512,
    g_472_low60_40_low20_1 * 2 = g_472_low60_40_low20_0 + f_472_low60_40_low20_0,
    r_512_513 * 2 = r_512_512 + u_512_512,
    s_512_513 * 2 = s_512_512 + v_512_512
&&
    true
;

{
    u_512_513 * f_472_low60_40_low20_0 + v_512_513 * g_472_low60_40_low20_0 = f_472_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_513 * f_472_low60_40_low20_0 + s_512_513 * g_472_low60_40_low20_0 = g_472_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_1 + u_512_513 * (const 64 (2**21)) + v_512_513 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_1 + r_512_513 * (const 64 (2**21)) + s_512_513 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_1,
    f_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_1,
    g_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 513)) <=s delta, delta <=s (const 64 (1 + 2*513)),
    (const 64 (-(2**20))) <=s u_512_513, u_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_513, v_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_513, r_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_513, s_512_513 <=s (const 64 ((2**20))),
    u_512_513 + v_512_513 <=s (const 64 (2**20)),
    u_512_513 - v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 + v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 - v_512_513 <=s (const 64 (2**20)),
    r_512_513 + s_512_513 <=s (const 64 (2**20)),
    r_512_513 - s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 + s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 - s_512_513 <=s (const 64 (2**20)),
    u_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_512_513 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_512_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_1,
sint64 g_472_low60_40_low20_1,
sint64 u_512_512,
sint64 v_512_512,
sint64 r_512_512,
sint64 s_512_512,
sint64 u_512_513,
sint64 v_512_513,
sint64 r_512_513,
sint64 s_512_513,
bit ne
)={
    u_512_512 * f_472_low60_40_low20_0 + v_512_512 * g_472_low60_40_low20_0 = f_472_low60_40_low20_0 * (-(2**20)),
    r_512_512 * f_472_low60_40_low20_0 + s_512_512 * g_472_low60_40_low20_0 = g_472_low60_40_low20_0 * (-(2**20))
&&
    u_512_512 * f_472_low60_40_low20_0 + v_512_512 * g_472_low60_40_low20_0 = f_472_low60_40_low20_0 * (const 64 (-(2**20))),
    r_512_512 * f_472_low60_40_low20_0 + s_512_512 * g_472_low60_40_low20_0 = g_472_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_0 + u_512_512 * (const 64 (2**21)) + v_512_512 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_0 + r_512_512 * (const 64 (2**21)) + s_512_512 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 512)) <=s delta, delta <=s (const 64 (1 + 2*512)),
    u_512_512 = (const 64 (-(2**20))),
    v_512_512 = (const 64 (0)),
    r_512_512 = (const 64 (0)),
    s_512_512 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise c
assume
g_472_low60_40_low20_0 = 1 (mod 2)
&&
g_472_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_1 g_472_low60_40_low20_0;
mov u_512_513 r_512_512;
mov v_512_513 s_512_512;

subs dc g_472_low60_40_low20_1 g_472_low60_40_low20_0 f_472_low60_40_low20_0;
asr g_472_low60_40_low20_1 g_472_low60_40_low20_1 1;
subs dc r_512_513 r_512_512 u_512_512;
asr r_512_513 r_512_513 1;
subs dc s_512_513 s_512_512 v_512_512;
asr s_512_513 s_512_513 1;
assert
    true
&&
    f_472_low60_40_low20_1 = g_472_low60_40_low20_0,
    u_512_513 = r_512_512,
    v_512_513 = s_512_512,
    g_472_low60_40_low20_1 * (const 64 2) = g_472_low60_40_low20_0 - f_472_low60_40_low20_0,
    r_512_513 * (const 64 2) = r_512_512 - u_512_512,
    s_512_513 * (const 64 2) = s_512_512 - v_512_512
;

assume
    f_472_low60_40_low20_1 = g_472_low60_40_low20_0,
    u_512_513 = r_512_512,
    v_512_513 = s_512_512,
    g_472_low60_40_low20_1 * 2 = g_472_low60_40_low20_0 - f_472_low60_40_low20_0,
    r_512_513 * 2 = r_512_512 - u_512_512,
    s_512_513 * 2 = s_512_512 - v_512_512
&&
    true
;

{
    u_512_513 * f_472_low60_40_low20_0 + v_512_513 * g_472_low60_40_low20_0 = f_472_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_513 * f_472_low60_40_low20_0 + s_512_513 * g_472_low60_40_low20_0 = g_472_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_1 + u_512_513 * (const 64 (2**21)) + v_512_513 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_1 + r_512_513 * (const 64 (2**21)) + s_512_513 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_1,
    f_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_1,
    g_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 513)) <=s delta, delta <=s (const 64 (1 + 2*513)),
    (const 64 (-(2**20))) <=s u_512_513, u_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_513, v_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_513, r_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_513, s_512_513 <=s (const 64 ((2**20))),
    u_512_513 + v_512_513 <=s (const 64 (2**20)),
    u_512_513 - v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 + v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 - v_512_513 <=s (const 64 (2**20)),
    r_512_513 + s_512_513 <=s (const 64 (2**20)),
    r_512_513 - s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 + s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 - s_512_513 <=s (const 64 (2**20)),
    u_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_512_513 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_513_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_1,
sint64 g_472_low60_40_low20_1,
sint64 f_472_low60_40_low20_2,
sint64 g_472_low60_40_low20_2,
sint64 u_512_513,
sint64 v_512_513,
sint64 r_512_513,
sint64 s_512_513,
sint64 u_512_514,
sint64 v_512_514,
sint64 r_512_514,
sint64 s_512_514,
bit ne
)={
    u_512_513 * f_472_low60_40_low20_0 + v_512_513 * g_472_low60_40_low20_0 = f_472_low60_40_low20_1 * (-(2**20)),
    r_512_513 * f_472_low60_40_low20_0 + s_512_513 * g_472_low60_40_low20_0 = g_472_low60_40_low20_1 * (-(2**20))
&&
    u_512_513 * f_472_low60_40_low20_0 + v_512_513 * g_472_low60_40_low20_0 = f_472_low60_40_low20_1 * (const 64 (-(2**20))),
    r_512_513 * f_472_low60_40_low20_0 + s_512_513 * g_472_low60_40_low20_0 = g_472_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_1 + u_512_513 * (const 64 (2**21)) + v_512_513 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_1 + r_512_513 * (const 64 (2**21)) + s_512_513 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_1,
    f_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_1,
    g_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 513)) <=s delta, delta <=s (const 64 (1 + 2*513)),
    (const 64 (-(2**20))) <=s u_512_513, u_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_513, v_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_513, r_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_513, s_512_513 <=s (const 64 ((2**20))),
    u_512_513 + v_512_513 <=s (const 64 (2**20)),
    u_512_513 - v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 + v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 - v_512_513 <=s (const 64 (2**20)),
    r_512_513 + s_512_513 <=s (const 64 (2**20)),
    r_512_513 - s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 + s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 - s_512_513 <=s (const 64 (2**20)),
    u_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_512_513 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise a
assume
g_472_low60_40_low20_1 = 0 (mod 2)
&&
g_472_low60_40_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_2 f_472_low60_40_low20_1;
mov u_512_514 u_512_513;
mov v_512_514 v_512_513;

asr g_472_low60_40_low20_2 g_472_low60_40_low20_1 1;
asr r_512_514 r_512_513 1;
asr s_512_514 s_512_513 1;
assert
    true
&&
    f_472_low60_40_low20_2 = f_472_low60_40_low20_1,
    u_512_514 = u_512_513,
    v_512_514 = v_512_513,
    g_472_low60_40_low20_2 * (const 64 2) = g_472_low60_40_low20_1,
    r_512_514 * (const 64 2) = r_512_513,
    s_512_514 * (const 64 2) = s_512_513
;

assume
    f_472_low60_40_low20_2 = f_472_low60_40_low20_1,
    u_512_514 = u_512_513,
    v_512_514 = v_512_513,
    g_472_low60_40_low20_2 * 2 = g_472_low60_40_low20_1,
    r_512_514 * 2 = r_512_513,
    s_512_514 * 2 = s_512_513
&&
    true
;

{
    u_512_514 * f_472_low60_40_low20_0 + v_512_514 * g_472_low60_40_low20_0 = f_472_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_514 * f_472_low60_40_low20_0 + s_512_514 * g_472_low60_40_low20_0 = g_472_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_2 + u_512_514 * (const 64 (2**21)) + v_512_514 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_2 + r_512_514 * (const 64 (2**21)) + s_512_514 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_2,
    f_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_2,
    g_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 514)) <=s delta, delta <=s (const 64 (1 + 2*514)),
    (const 64 (-(2**20))) <=s u_512_514, u_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_514, v_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_514, r_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_514, s_512_514 <=s (const 64 ((2**20))),
    u_512_514 + v_512_514 <=s (const 64 (2**20)),
    u_512_514 - v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 + v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 - v_512_514 <=s (const 64 (2**20)),
    r_512_514 + s_512_514 <=s (const 64 (2**20)),
    r_512_514 - s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 + s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 - s_512_514 <=s (const 64 (2**20)),
    u_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_512_514 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_513_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_1,
sint64 g_472_low60_40_low20_1,
sint64 f_472_low60_40_low20_2,
sint64 g_472_low60_40_low20_2,
sint64 u_512_513,
sint64 v_512_513,
sint64 r_512_513,
sint64 s_512_513,
sint64 u_512_514,
sint64 v_512_514,
sint64 r_512_514,
sint64 s_512_514,
bit ne
)={
    u_512_513 * f_472_low60_40_low20_0 + v_512_513 * g_472_low60_40_low20_0 = f_472_low60_40_low20_1 * (-(2**20)),
    r_512_513 * f_472_low60_40_low20_0 + s_512_513 * g_472_low60_40_low20_0 = g_472_low60_40_low20_1 * (-(2**20))
&&
    u_512_513 * f_472_low60_40_low20_0 + v_512_513 * g_472_low60_40_low20_0 = f_472_low60_40_low20_1 * (const 64 (-(2**20))),
    r_512_513 * f_472_low60_40_low20_0 + s_512_513 * g_472_low60_40_low20_0 = g_472_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_1 + u_512_513 * (const 64 (2**21)) + v_512_513 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_1 + r_512_513 * (const 64 (2**21)) + s_512_513 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_1,
    f_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_1,
    g_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 513)) <=s delta, delta <=s (const 64 (1 + 2*513)),
    (const 64 (-(2**20))) <=s u_512_513, u_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_513, v_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_513, r_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_513, s_512_513 <=s (const 64 ((2**20))),
    u_512_513 + v_512_513 <=s (const 64 (2**20)),
    u_512_513 - v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 + v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 - v_512_513 <=s (const 64 (2**20)),
    r_512_513 + s_512_513 <=s (const 64 (2**20)),
    r_512_513 - s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 + s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 - s_512_513 <=s (const 64 (2**20)),
    u_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_512_513 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise b
assume
g_472_low60_40_low20_1 = 1 (mod 2)
&&
g_472_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_2 f_472_low60_40_low20_1;
mov u_512_514 u_512_513;
mov v_512_514 v_512_513;

add g_472_low60_40_low20_2 g_472_low60_40_low20_1 f_472_low60_40_low20_1;
asr g_472_low60_40_low20_2 g_472_low60_40_low20_2 1;
add r_512_514 r_512_513 u_512_513;
asr r_512_514 r_512_514 1;
add s_512_514 s_512_513 v_512_513;
asr s_512_514 s_512_514 1;
assert
    true
&&
    f_472_low60_40_low20_2 = f_472_low60_40_low20_1,
    u_512_514 = u_512_513,
    v_512_514 = v_512_513,
    g_472_low60_40_low20_2 * (const 64 2) = g_472_low60_40_low20_1 + f_472_low60_40_low20_1,
    r_512_514 * (const 64 2) = r_512_513 + u_512_513,
    s_512_514 * (const 64 2) = s_512_513 + v_512_513
;

assume
    f_472_low60_40_low20_2 = f_472_low60_40_low20_1,
    u_512_514 = u_512_513,
    v_512_514 = v_512_513,
    g_472_low60_40_low20_2 * 2 = g_472_low60_40_low20_1 + f_472_low60_40_low20_1,
    r_512_514 * 2 = r_512_513 + u_512_513,
    s_512_514 * 2 = s_512_513 + v_512_513
&&
    true
;

{
    u_512_514 * f_472_low60_40_low20_0 + v_512_514 * g_472_low60_40_low20_0 = f_472_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_514 * f_472_low60_40_low20_0 + s_512_514 * g_472_low60_40_low20_0 = g_472_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_2 + u_512_514 * (const 64 (2**21)) + v_512_514 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_2 + r_512_514 * (const 64 (2**21)) + s_512_514 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_2,
    f_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_2,
    g_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 514)) <=s delta, delta <=s (const 64 (1 + 2*514)),
    (const 64 (-(2**20))) <=s u_512_514, u_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_514, v_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_514, r_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_514, s_512_514 <=s (const 64 ((2**20))),
    u_512_514 + v_512_514 <=s (const 64 (2**20)),
    u_512_514 - v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 + v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 - v_512_514 <=s (const 64 (2**20)),
    r_512_514 + s_512_514 <=s (const 64 (2**20)),
    r_512_514 - s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 + s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 - s_512_514 <=s (const 64 (2**20)),
    u_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_512_514 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_513_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_1,
sint64 g_472_low60_40_low20_1,
sint64 f_472_low60_40_low20_2,
sint64 g_472_low60_40_low20_2,
sint64 u_512_513,
sint64 v_512_513,
sint64 r_512_513,
sint64 s_512_513,
sint64 u_512_514,
sint64 v_512_514,
sint64 r_512_514,
sint64 s_512_514,
bit ne
)={
    u_512_513 * f_472_low60_40_low20_0 + v_512_513 * g_472_low60_40_low20_0 = f_472_low60_40_low20_1 * (-(2**20)),
    r_512_513 * f_472_low60_40_low20_0 + s_512_513 * g_472_low60_40_low20_0 = g_472_low60_40_low20_1 * (-(2**20))
&&
    u_512_513 * f_472_low60_40_low20_0 + v_512_513 * g_472_low60_40_low20_0 = f_472_low60_40_low20_1 * (const 64 (-(2**20))),
    r_512_513 * f_472_low60_40_low20_0 + s_512_513 * g_472_low60_40_low20_0 = g_472_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_1 + u_512_513 * (const 64 (2**21)) + v_512_513 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_1 + r_512_513 * (const 64 (2**21)) + s_512_513 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_1,
    f_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_1,
    g_472_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 513)) <=s delta, delta <=s (const 64 (1 + 2*513)),
    (const 64 (-(2**20))) <=s u_512_513, u_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_513, v_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_513, r_512_513 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_513, s_512_513 <=s (const 64 ((2**20))),
    u_512_513 + v_512_513 <=s (const 64 (2**20)),
    u_512_513 - v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 + v_512_513 <=s (const 64 (2**20)),
    (const 64 0) - u_512_513 - v_512_513 <=s (const 64 (2**20)),
    r_512_513 + s_512_513 <=s (const 64 (2**20)),
    r_512_513 - s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 + s_512_513 <=s (const 64 (2**20)),
    (const 64 0) - r_512_513 - s_512_513 <=s (const 64 (2**20)),
    u_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_512_513 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_512_513 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise c
assume
g_472_low60_40_low20_1 = 1 (mod 2)
&&
g_472_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_2 g_472_low60_40_low20_1;
mov u_512_514 r_512_513;
mov v_512_514 s_512_513;

subs dc g_472_low60_40_low20_2 g_472_low60_40_low20_1 f_472_low60_40_low20_1;
asr g_472_low60_40_low20_2 g_472_low60_40_low20_2 1;
subs dc r_512_514 r_512_513 u_512_513;
asr r_512_514 r_512_514 1;
subs dc s_512_514 s_512_513 v_512_513;
asr s_512_514 s_512_514 1;
assert
    true
&&
    f_472_low60_40_low20_2 = g_472_low60_40_low20_1,
    u_512_514 = r_512_513,
    v_512_514 = s_512_513,
    g_472_low60_40_low20_2 * (const 64 2) = g_472_low60_40_low20_1 - f_472_low60_40_low20_1,
    r_512_514 * (const 64 2) = r_512_513 - u_512_513,
    s_512_514 * (const 64 2) = s_512_513 - v_512_513
;

assume
    f_472_low60_40_low20_2 = g_472_low60_40_low20_1,
    u_512_514 = r_512_513,
    v_512_514 = s_512_513,
    g_472_low60_40_low20_2 * 2 = g_472_low60_40_low20_1 - f_472_low60_40_low20_1,
    r_512_514 * 2 = r_512_513 - u_512_513,
    s_512_514 * 2 = s_512_513 - v_512_513
&&
    true
;

{
    u_512_514 * f_472_low60_40_low20_0 + v_512_514 * g_472_low60_40_low20_0 = f_472_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_514 * f_472_low60_40_low20_0 + s_512_514 * g_472_low60_40_low20_0 = g_472_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_2 + u_512_514 * (const 64 (2**21)) + v_512_514 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_2 + r_512_514 * (const 64 (2**21)) + s_512_514 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_2,
    f_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_2,
    g_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 514)) <=s delta, delta <=s (const 64 (1 + 2*514)),
    (const 64 (-(2**20))) <=s u_512_514, u_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_514, v_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_514, r_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_514, s_512_514 <=s (const 64 ((2**20))),
    u_512_514 + v_512_514 <=s (const 64 (2**20)),
    u_512_514 - v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 + v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 - v_512_514 <=s (const 64 (2**20)),
    r_512_514 + s_512_514 <=s (const 64 (2**20)),
    r_512_514 - s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 + s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 - s_512_514 <=s (const 64 (2**20)),
    u_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_512_514 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_514_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_2,
sint64 g_472_low60_40_low20_2,
sint64 f_472_low60_40_low20_3,
sint64 g_472_low60_40_low20_3,
sint64 u_512_514,
sint64 v_512_514,
sint64 r_512_514,
sint64 s_512_514,
sint64 u_512_515,
sint64 v_512_515,
sint64 r_512_515,
sint64 s_512_515,
bit ne
)={
    u_512_514 * f_472_low60_40_low20_0 + v_512_514 * g_472_low60_40_low20_0 = f_472_low60_40_low20_2 * (-(2**20)),
    r_512_514 * f_472_low60_40_low20_0 + s_512_514 * g_472_low60_40_low20_0 = g_472_low60_40_low20_2 * (-(2**20))
&&
    u_512_514 * f_472_low60_40_low20_0 + v_512_514 * g_472_low60_40_low20_0 = f_472_low60_40_low20_2 * (const 64 (-(2**20))),
    r_512_514 * f_472_low60_40_low20_0 + s_512_514 * g_472_low60_40_low20_0 = g_472_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_2 + u_512_514 * (const 64 (2**21)) + v_512_514 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_2 + r_512_514 * (const 64 (2**21)) + s_512_514 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_2,
    f_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_2,
    g_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 514)) <=s delta, delta <=s (const 64 (1 + 2*514)),
    (const 64 (-(2**20))) <=s u_512_514, u_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_514, v_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_514, r_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_514, s_512_514 <=s (const 64 ((2**20))),
    u_512_514 + v_512_514 <=s (const 64 (2**20)),
    u_512_514 - v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 + v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 - v_512_514 <=s (const 64 (2**20)),
    r_512_514 + s_512_514 <=s (const 64 (2**20)),
    r_512_514 - s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 + s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 - s_512_514 <=s (const 64 (2**20)),
    u_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_512_514 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise a
assume
g_472_low60_40_low20_2 = 0 (mod 2)
&&
g_472_low60_40_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_3 f_472_low60_40_low20_2;
mov u_512_515 u_512_514;
mov v_512_515 v_512_514;

asr g_472_low60_40_low20_3 g_472_low60_40_low20_2 1;
asr r_512_515 r_512_514 1;
asr s_512_515 s_512_514 1;
assert
    true
&&
    f_472_low60_40_low20_3 = f_472_low60_40_low20_2,
    u_512_515 = u_512_514,
    v_512_515 = v_512_514,
    g_472_low60_40_low20_3 * (const 64 2) = g_472_low60_40_low20_2,
    r_512_515 * (const 64 2) = r_512_514,
    s_512_515 * (const 64 2) = s_512_514
;

assume
    f_472_low60_40_low20_3 = f_472_low60_40_low20_2,
    u_512_515 = u_512_514,
    v_512_515 = v_512_514,
    g_472_low60_40_low20_3 * 2 = g_472_low60_40_low20_2,
    r_512_515 * 2 = r_512_514,
    s_512_515 * 2 = s_512_514
&&
    true
;

{
    u_512_515 * f_472_low60_40_low20_0 + v_512_515 * g_472_low60_40_low20_0 = f_472_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_515 * f_472_low60_40_low20_0 + s_512_515 * g_472_low60_40_low20_0 = g_472_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_3 + u_512_515 * (const 64 (2**21)) + v_512_515 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_3 + r_512_515 * (const 64 (2**21)) + s_512_515 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_3,
    f_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_3,
    g_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 515)) <=s delta, delta <=s (const 64 (1 + 2*515)),
    (const 64 (-(2**20))) <=s u_512_515, u_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_515, v_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_515, r_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_515, s_512_515 <=s (const 64 ((2**20))),
    u_512_515 + v_512_515 <=s (const 64 (2**20)),
    u_512_515 - v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 + v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 - v_512_515 <=s (const 64 (2**20)),
    r_512_515 + s_512_515 <=s (const 64 (2**20)),
    r_512_515 - s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 + s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 - s_512_515 <=s (const 64 (2**20)),
    u_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_512_515 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_514_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_2,
sint64 g_472_low60_40_low20_2,
sint64 f_472_low60_40_low20_3,
sint64 g_472_low60_40_low20_3,
sint64 u_512_514,
sint64 v_512_514,
sint64 r_512_514,
sint64 s_512_514,
sint64 u_512_515,
sint64 v_512_515,
sint64 r_512_515,
sint64 s_512_515,
bit ne
)={
    u_512_514 * f_472_low60_40_low20_0 + v_512_514 * g_472_low60_40_low20_0 = f_472_low60_40_low20_2 * (-(2**20)),
    r_512_514 * f_472_low60_40_low20_0 + s_512_514 * g_472_low60_40_low20_0 = g_472_low60_40_low20_2 * (-(2**20))
&&
    u_512_514 * f_472_low60_40_low20_0 + v_512_514 * g_472_low60_40_low20_0 = f_472_low60_40_low20_2 * (const 64 (-(2**20))),
    r_512_514 * f_472_low60_40_low20_0 + s_512_514 * g_472_low60_40_low20_0 = g_472_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_2 + u_512_514 * (const 64 (2**21)) + v_512_514 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_2 + r_512_514 * (const 64 (2**21)) + s_512_514 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_2,
    f_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_2,
    g_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 514)) <=s delta, delta <=s (const 64 (1 + 2*514)),
    (const 64 (-(2**20))) <=s u_512_514, u_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_514, v_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_514, r_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_514, s_512_514 <=s (const 64 ((2**20))),
    u_512_514 + v_512_514 <=s (const 64 (2**20)),
    u_512_514 - v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 + v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 - v_512_514 <=s (const 64 (2**20)),
    r_512_514 + s_512_514 <=s (const 64 (2**20)),
    r_512_514 - s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 + s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 - s_512_514 <=s (const 64 (2**20)),
    u_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_512_514 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise b
assume
g_472_low60_40_low20_2 = 1 (mod 2)
&&
g_472_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_3 f_472_low60_40_low20_2;
mov u_512_515 u_512_514;
mov v_512_515 v_512_514;

add g_472_low60_40_low20_3 g_472_low60_40_low20_2 f_472_low60_40_low20_2;
asr g_472_low60_40_low20_3 g_472_low60_40_low20_3 1;
add r_512_515 r_512_514 u_512_514;
asr r_512_515 r_512_515 1;
add s_512_515 s_512_514 v_512_514;
asr s_512_515 s_512_515 1;
assert
    true
&&
    f_472_low60_40_low20_3 = f_472_low60_40_low20_2,
    u_512_515 = u_512_514,
    v_512_515 = v_512_514,
    g_472_low60_40_low20_3 * (const 64 2) = g_472_low60_40_low20_2 + f_472_low60_40_low20_2,
    r_512_515 * (const 64 2) = r_512_514 + u_512_514,
    s_512_515 * (const 64 2) = s_512_514 + v_512_514
;

assume
    f_472_low60_40_low20_3 = f_472_low60_40_low20_2,
    u_512_515 = u_512_514,
    v_512_515 = v_512_514,
    g_472_low60_40_low20_3 * 2 = g_472_low60_40_low20_2 + f_472_low60_40_low20_2,
    r_512_515 * 2 = r_512_514 + u_512_514,
    s_512_515 * 2 = s_512_514 + v_512_514
&&
    true
;

{
    u_512_515 * f_472_low60_40_low20_0 + v_512_515 * g_472_low60_40_low20_0 = f_472_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_515 * f_472_low60_40_low20_0 + s_512_515 * g_472_low60_40_low20_0 = g_472_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_3 + u_512_515 * (const 64 (2**21)) + v_512_515 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_3 + r_512_515 * (const 64 (2**21)) + s_512_515 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_3,
    f_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_3,
    g_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 515)) <=s delta, delta <=s (const 64 (1 + 2*515)),
    (const 64 (-(2**20))) <=s u_512_515, u_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_515, v_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_515, r_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_515, s_512_515 <=s (const 64 ((2**20))),
    u_512_515 + v_512_515 <=s (const 64 (2**20)),
    u_512_515 - v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 + v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 - v_512_515 <=s (const 64 (2**20)),
    r_512_515 + s_512_515 <=s (const 64 (2**20)),
    r_512_515 - s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 + s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 - s_512_515 <=s (const 64 (2**20)),
    u_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_512_515 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_514_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_2,
sint64 g_472_low60_40_low20_2,
sint64 f_472_low60_40_low20_3,
sint64 g_472_low60_40_low20_3,
sint64 u_512_514,
sint64 v_512_514,
sint64 r_512_514,
sint64 s_512_514,
sint64 u_512_515,
sint64 v_512_515,
sint64 r_512_515,
sint64 s_512_515,
bit ne
)={
    u_512_514 * f_472_low60_40_low20_0 + v_512_514 * g_472_low60_40_low20_0 = f_472_low60_40_low20_2 * (-(2**20)),
    r_512_514 * f_472_low60_40_low20_0 + s_512_514 * g_472_low60_40_low20_0 = g_472_low60_40_low20_2 * (-(2**20))
&&
    u_512_514 * f_472_low60_40_low20_0 + v_512_514 * g_472_low60_40_low20_0 = f_472_low60_40_low20_2 * (const 64 (-(2**20))),
    r_512_514 * f_472_low60_40_low20_0 + s_512_514 * g_472_low60_40_low20_0 = g_472_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_2 + u_512_514 * (const 64 (2**21)) + v_512_514 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_2 + r_512_514 * (const 64 (2**21)) + s_512_514 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_2,
    f_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_2,
    g_472_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 514)) <=s delta, delta <=s (const 64 (1 + 2*514)),
    (const 64 (-(2**20))) <=s u_512_514, u_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_514, v_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_514, r_512_514 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_514, s_512_514 <=s (const 64 ((2**20))),
    u_512_514 + v_512_514 <=s (const 64 (2**20)),
    u_512_514 - v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 + v_512_514 <=s (const 64 (2**20)),
    (const 64 0) - u_512_514 - v_512_514 <=s (const 64 (2**20)),
    r_512_514 + s_512_514 <=s (const 64 (2**20)),
    r_512_514 - s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 + s_512_514 <=s (const 64 (2**20)),
    (const 64 0) - r_512_514 - s_512_514 <=s (const 64 (2**20)),
    u_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_512_514 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_512_514 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise c
assume
g_472_low60_40_low20_2 = 1 (mod 2)
&&
g_472_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_3 g_472_low60_40_low20_2;
mov u_512_515 r_512_514;
mov v_512_515 s_512_514;

subs dc g_472_low60_40_low20_3 g_472_low60_40_low20_2 f_472_low60_40_low20_2;
asr g_472_low60_40_low20_3 g_472_low60_40_low20_3 1;
subs dc r_512_515 r_512_514 u_512_514;
asr r_512_515 r_512_515 1;
subs dc s_512_515 s_512_514 v_512_514;
asr s_512_515 s_512_515 1;
assert
    true
&&
    f_472_low60_40_low20_3 = g_472_low60_40_low20_2,
    u_512_515 = r_512_514,
    v_512_515 = s_512_514,
    g_472_low60_40_low20_3 * (const 64 2) = g_472_low60_40_low20_2 - f_472_low60_40_low20_2,
    r_512_515 * (const 64 2) = r_512_514 - u_512_514,
    s_512_515 * (const 64 2) = s_512_514 - v_512_514
;

assume
    f_472_low60_40_low20_3 = g_472_low60_40_low20_2,
    u_512_515 = r_512_514,
    v_512_515 = s_512_514,
    g_472_low60_40_low20_3 * 2 = g_472_low60_40_low20_2 - f_472_low60_40_low20_2,
    r_512_515 * 2 = r_512_514 - u_512_514,
    s_512_515 * 2 = s_512_514 - v_512_514
&&
    true
;

{
    u_512_515 * f_472_low60_40_low20_0 + v_512_515 * g_472_low60_40_low20_0 = f_472_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_515 * f_472_low60_40_low20_0 + s_512_515 * g_472_low60_40_low20_0 = g_472_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_3 + u_512_515 * (const 64 (2**21)) + v_512_515 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_3 + r_512_515 * (const 64 (2**21)) + s_512_515 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_3,
    f_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_3,
    g_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 515)) <=s delta, delta <=s (const 64 (1 + 2*515)),
    (const 64 (-(2**20))) <=s u_512_515, u_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_515, v_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_515, r_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_515, s_512_515 <=s (const 64 ((2**20))),
    u_512_515 + v_512_515 <=s (const 64 (2**20)),
    u_512_515 - v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 + v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 - v_512_515 <=s (const 64 (2**20)),
    r_512_515 + s_512_515 <=s (const 64 (2**20)),
    r_512_515 - s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 + s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 - s_512_515 <=s (const 64 (2**20)),
    u_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_512_515 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_515_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_3,
sint64 g_472_low60_40_low20_3,
sint64 f_472_low60_40_low20_4,
sint64 g_472_low60_40_low20_4,
sint64 u_512_515,
sint64 v_512_515,
sint64 r_512_515,
sint64 s_512_515,
sint64 u_512_516,
sint64 v_512_516,
sint64 r_512_516,
sint64 s_512_516,
bit ne
)={
    u_512_515 * f_472_low60_40_low20_0 + v_512_515 * g_472_low60_40_low20_0 = f_472_low60_40_low20_3 * (-(2**20)),
    r_512_515 * f_472_low60_40_low20_0 + s_512_515 * g_472_low60_40_low20_0 = g_472_low60_40_low20_3 * (-(2**20))
&&
    u_512_515 * f_472_low60_40_low20_0 + v_512_515 * g_472_low60_40_low20_0 = f_472_low60_40_low20_3 * (const 64 (-(2**20))),
    r_512_515 * f_472_low60_40_low20_0 + s_512_515 * g_472_low60_40_low20_0 = g_472_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_3 + u_512_515 * (const 64 (2**21)) + v_512_515 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_3 + r_512_515 * (const 64 (2**21)) + s_512_515 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_3,
    f_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_3,
    g_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 515)) <=s delta, delta <=s (const 64 (1 + 2*515)),
    (const 64 (-(2**20))) <=s u_512_515, u_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_515, v_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_515, r_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_515, s_512_515 <=s (const 64 ((2**20))),
    u_512_515 + v_512_515 <=s (const 64 (2**20)),
    u_512_515 - v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 + v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 - v_512_515 <=s (const 64 (2**20)),
    r_512_515 + s_512_515 <=s (const 64 (2**20)),
    r_512_515 - s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 + s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 - s_512_515 <=s (const 64 (2**20)),
    u_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_512_515 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise a
assume
g_472_low60_40_low20_3 = 0 (mod 2)
&&
g_472_low60_40_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_4 f_472_low60_40_low20_3;
mov u_512_516 u_512_515;
mov v_512_516 v_512_515;

asr g_472_low60_40_low20_4 g_472_low60_40_low20_3 1;
asr r_512_516 r_512_515 1;
asr s_512_516 s_512_515 1;
assert
    true
&&
    f_472_low60_40_low20_4 = f_472_low60_40_low20_3,
    u_512_516 = u_512_515,
    v_512_516 = v_512_515,
    g_472_low60_40_low20_4 * (const 64 2) = g_472_low60_40_low20_3,
    r_512_516 * (const 64 2) = r_512_515,
    s_512_516 * (const 64 2) = s_512_515
;

assume
    f_472_low60_40_low20_4 = f_472_low60_40_low20_3,
    u_512_516 = u_512_515,
    v_512_516 = v_512_515,
    g_472_low60_40_low20_4 * 2 = g_472_low60_40_low20_3,
    r_512_516 * 2 = r_512_515,
    s_512_516 * 2 = s_512_515
&&
    true
;

{
    u_512_516 * f_472_low60_40_low20_0 + v_512_516 * g_472_low60_40_low20_0 = f_472_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_516 * f_472_low60_40_low20_0 + s_512_516 * g_472_low60_40_low20_0 = g_472_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_4 + u_512_516 * (const 64 (2**21)) + v_512_516 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_4 + r_512_516 * (const 64 (2**21)) + s_512_516 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_4,
    f_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_4,
    g_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 516)) <=s delta, delta <=s (const 64 (1 + 2*516)),
    (const 64 (-(2**20))) <=s u_512_516, u_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_516, v_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_516, r_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_516, s_512_516 <=s (const 64 ((2**20))),
    u_512_516 + v_512_516 <=s (const 64 (2**20)),
    u_512_516 - v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 + v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 - v_512_516 <=s (const 64 (2**20)),
    r_512_516 + s_512_516 <=s (const 64 (2**20)),
    r_512_516 - s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 + s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 - s_512_516 <=s (const 64 (2**20)),
    u_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_512_516 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_515_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_3,
sint64 g_472_low60_40_low20_3,
sint64 f_472_low60_40_low20_4,
sint64 g_472_low60_40_low20_4,
sint64 u_512_515,
sint64 v_512_515,
sint64 r_512_515,
sint64 s_512_515,
sint64 u_512_516,
sint64 v_512_516,
sint64 r_512_516,
sint64 s_512_516,
bit ne
)={
    u_512_515 * f_472_low60_40_low20_0 + v_512_515 * g_472_low60_40_low20_0 = f_472_low60_40_low20_3 * (-(2**20)),
    r_512_515 * f_472_low60_40_low20_0 + s_512_515 * g_472_low60_40_low20_0 = g_472_low60_40_low20_3 * (-(2**20))
&&
    u_512_515 * f_472_low60_40_low20_0 + v_512_515 * g_472_low60_40_low20_0 = f_472_low60_40_low20_3 * (const 64 (-(2**20))),
    r_512_515 * f_472_low60_40_low20_0 + s_512_515 * g_472_low60_40_low20_0 = g_472_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_3 + u_512_515 * (const 64 (2**21)) + v_512_515 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_3 + r_512_515 * (const 64 (2**21)) + s_512_515 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_3,
    f_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_3,
    g_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 515)) <=s delta, delta <=s (const 64 (1 + 2*515)),
    (const 64 (-(2**20))) <=s u_512_515, u_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_515, v_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_515, r_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_515, s_512_515 <=s (const 64 ((2**20))),
    u_512_515 + v_512_515 <=s (const 64 (2**20)),
    u_512_515 - v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 + v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 - v_512_515 <=s (const 64 (2**20)),
    r_512_515 + s_512_515 <=s (const 64 (2**20)),
    r_512_515 - s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 + s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 - s_512_515 <=s (const 64 (2**20)),
    u_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_512_515 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise b
assume
g_472_low60_40_low20_3 = 1 (mod 2)
&&
g_472_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_4 f_472_low60_40_low20_3;
mov u_512_516 u_512_515;
mov v_512_516 v_512_515;

add g_472_low60_40_low20_4 g_472_low60_40_low20_3 f_472_low60_40_low20_3;
asr g_472_low60_40_low20_4 g_472_low60_40_low20_4 1;
add r_512_516 r_512_515 u_512_515;
asr r_512_516 r_512_516 1;
add s_512_516 s_512_515 v_512_515;
asr s_512_516 s_512_516 1;
assert
    true
&&
    f_472_low60_40_low20_4 = f_472_low60_40_low20_3,
    u_512_516 = u_512_515,
    v_512_516 = v_512_515,
    g_472_low60_40_low20_4 * (const 64 2) = g_472_low60_40_low20_3 + f_472_low60_40_low20_3,
    r_512_516 * (const 64 2) = r_512_515 + u_512_515,
    s_512_516 * (const 64 2) = s_512_515 + v_512_515
;

assume
    f_472_low60_40_low20_4 = f_472_low60_40_low20_3,
    u_512_516 = u_512_515,
    v_512_516 = v_512_515,
    g_472_low60_40_low20_4 * 2 = g_472_low60_40_low20_3 + f_472_low60_40_low20_3,
    r_512_516 * 2 = r_512_515 + u_512_515,
    s_512_516 * 2 = s_512_515 + v_512_515
&&
    true
;

{
    u_512_516 * f_472_low60_40_low20_0 + v_512_516 * g_472_low60_40_low20_0 = f_472_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_516 * f_472_low60_40_low20_0 + s_512_516 * g_472_low60_40_low20_0 = g_472_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_4 + u_512_516 * (const 64 (2**21)) + v_512_516 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_4 + r_512_516 * (const 64 (2**21)) + s_512_516 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_4,
    f_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_4,
    g_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 516)) <=s delta, delta <=s (const 64 (1 + 2*516)),
    (const 64 (-(2**20))) <=s u_512_516, u_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_516, v_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_516, r_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_516, s_512_516 <=s (const 64 ((2**20))),
    u_512_516 + v_512_516 <=s (const 64 (2**20)),
    u_512_516 - v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 + v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 - v_512_516 <=s (const 64 (2**20)),
    r_512_516 + s_512_516 <=s (const 64 (2**20)),
    r_512_516 - s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 + s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 - s_512_516 <=s (const 64 (2**20)),
    u_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_512_516 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_515_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_3,
sint64 g_472_low60_40_low20_3,
sint64 f_472_low60_40_low20_4,
sint64 g_472_low60_40_low20_4,
sint64 u_512_515,
sint64 v_512_515,
sint64 r_512_515,
sint64 s_512_515,
sint64 u_512_516,
sint64 v_512_516,
sint64 r_512_516,
sint64 s_512_516,
bit ne
)={
    u_512_515 * f_472_low60_40_low20_0 + v_512_515 * g_472_low60_40_low20_0 = f_472_low60_40_low20_3 * (-(2**20)),
    r_512_515 * f_472_low60_40_low20_0 + s_512_515 * g_472_low60_40_low20_0 = g_472_low60_40_low20_3 * (-(2**20))
&&
    u_512_515 * f_472_low60_40_low20_0 + v_512_515 * g_472_low60_40_low20_0 = f_472_low60_40_low20_3 * (const 64 (-(2**20))),
    r_512_515 * f_472_low60_40_low20_0 + s_512_515 * g_472_low60_40_low20_0 = g_472_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_3 + u_512_515 * (const 64 (2**21)) + v_512_515 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_3 + r_512_515 * (const 64 (2**21)) + s_512_515 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_3,
    f_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_3,
    g_472_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 515)) <=s delta, delta <=s (const 64 (1 + 2*515)),
    (const 64 (-(2**20))) <=s u_512_515, u_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_515, v_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_515, r_512_515 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_515, s_512_515 <=s (const 64 ((2**20))),
    u_512_515 + v_512_515 <=s (const 64 (2**20)),
    u_512_515 - v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 + v_512_515 <=s (const 64 (2**20)),
    (const 64 0) - u_512_515 - v_512_515 <=s (const 64 (2**20)),
    r_512_515 + s_512_515 <=s (const 64 (2**20)),
    r_512_515 - s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 + s_512_515 <=s (const 64 (2**20)),
    (const 64 0) - r_512_515 - s_512_515 <=s (const 64 (2**20)),
    u_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_512_515 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_512_515 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise c
assume
g_472_low60_40_low20_3 = 1 (mod 2)
&&
g_472_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_4 g_472_low60_40_low20_3;
mov u_512_516 r_512_515;
mov v_512_516 s_512_515;

subs dc g_472_low60_40_low20_4 g_472_low60_40_low20_3 f_472_low60_40_low20_3;
asr g_472_low60_40_low20_4 g_472_low60_40_low20_4 1;
subs dc r_512_516 r_512_515 u_512_515;
asr r_512_516 r_512_516 1;
subs dc s_512_516 s_512_515 v_512_515;
asr s_512_516 s_512_516 1;
assert
    true
&&
    f_472_low60_40_low20_4 = g_472_low60_40_low20_3,
    u_512_516 = r_512_515,
    v_512_516 = s_512_515,
    g_472_low60_40_low20_4 * (const 64 2) = g_472_low60_40_low20_3 - f_472_low60_40_low20_3,
    r_512_516 * (const 64 2) = r_512_515 - u_512_515,
    s_512_516 * (const 64 2) = s_512_515 - v_512_515
;

assume
    f_472_low60_40_low20_4 = g_472_low60_40_low20_3,
    u_512_516 = r_512_515,
    v_512_516 = s_512_515,
    g_472_low60_40_low20_4 * 2 = g_472_low60_40_low20_3 - f_472_low60_40_low20_3,
    r_512_516 * 2 = r_512_515 - u_512_515,
    s_512_516 * 2 = s_512_515 - v_512_515
&&
    true
;

{
    u_512_516 * f_472_low60_40_low20_0 + v_512_516 * g_472_low60_40_low20_0 = f_472_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_516 * f_472_low60_40_low20_0 + s_512_516 * g_472_low60_40_low20_0 = g_472_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_4 + u_512_516 * (const 64 (2**21)) + v_512_516 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_4 + r_512_516 * (const 64 (2**21)) + s_512_516 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_4,
    f_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_4,
    g_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 516)) <=s delta, delta <=s (const 64 (1 + 2*516)),
    (const 64 (-(2**20))) <=s u_512_516, u_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_516, v_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_516, r_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_516, s_512_516 <=s (const 64 ((2**20))),
    u_512_516 + v_512_516 <=s (const 64 (2**20)),
    u_512_516 - v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 + v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 - v_512_516 <=s (const 64 (2**20)),
    r_512_516 + s_512_516 <=s (const 64 (2**20)),
    r_512_516 - s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 + s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 - s_512_516 <=s (const 64 (2**20)),
    u_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_512_516 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_516_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_4,
sint64 g_472_low60_40_low20_4,
sint64 f_472_low60_40_low20_5,
sint64 g_472_low60_40_low20_5,
sint64 u_512_516,
sint64 v_512_516,
sint64 r_512_516,
sint64 s_512_516,
sint64 u_512_517,
sint64 v_512_517,
sint64 r_512_517,
sint64 s_512_517,
bit ne
)={
    u_512_516 * f_472_low60_40_low20_0 + v_512_516 * g_472_low60_40_low20_0 = f_472_low60_40_low20_4 * (-(2**20)),
    r_512_516 * f_472_low60_40_low20_0 + s_512_516 * g_472_low60_40_low20_0 = g_472_low60_40_low20_4 * (-(2**20))
&&
    u_512_516 * f_472_low60_40_low20_0 + v_512_516 * g_472_low60_40_low20_0 = f_472_low60_40_low20_4 * (const 64 (-(2**20))),
    r_512_516 * f_472_low60_40_low20_0 + s_512_516 * g_472_low60_40_low20_0 = g_472_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_4 + u_512_516 * (const 64 (2**21)) + v_512_516 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_4 + r_512_516 * (const 64 (2**21)) + s_512_516 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_4,
    f_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_4,
    g_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 516)) <=s delta, delta <=s (const 64 (1 + 2*516)),
    (const 64 (-(2**20))) <=s u_512_516, u_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_516, v_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_516, r_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_516, s_512_516 <=s (const 64 ((2**20))),
    u_512_516 + v_512_516 <=s (const 64 (2**20)),
    u_512_516 - v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 + v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 - v_512_516 <=s (const 64 (2**20)),
    r_512_516 + s_512_516 <=s (const 64 (2**20)),
    r_512_516 - s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 + s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 - s_512_516 <=s (const 64 (2**20)),
    u_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_512_516 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise a
assume
g_472_low60_40_low20_4 = 0 (mod 2)
&&
g_472_low60_40_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_5 f_472_low60_40_low20_4;
mov u_512_517 u_512_516;
mov v_512_517 v_512_516;

asr g_472_low60_40_low20_5 g_472_low60_40_low20_4 1;
asr r_512_517 r_512_516 1;
asr s_512_517 s_512_516 1;
assert
    true
&&
    f_472_low60_40_low20_5 = f_472_low60_40_low20_4,
    u_512_517 = u_512_516,
    v_512_517 = v_512_516,
    g_472_low60_40_low20_5 * (const 64 2) = g_472_low60_40_low20_4,
    r_512_517 * (const 64 2) = r_512_516,
    s_512_517 * (const 64 2) = s_512_516
;

assume
    f_472_low60_40_low20_5 = f_472_low60_40_low20_4,
    u_512_517 = u_512_516,
    v_512_517 = v_512_516,
    g_472_low60_40_low20_5 * 2 = g_472_low60_40_low20_4,
    r_512_517 * 2 = r_512_516,
    s_512_517 * 2 = s_512_516
&&
    true
;

{
    u_512_517 * f_472_low60_40_low20_0 + v_512_517 * g_472_low60_40_low20_0 = f_472_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_517 * f_472_low60_40_low20_0 + s_512_517 * g_472_low60_40_low20_0 = g_472_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_5 + u_512_517 * (const 64 (2**21)) + v_512_517 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_5 + r_512_517 * (const 64 (2**21)) + s_512_517 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_5,
    f_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_5,
    g_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 517)) <=s delta, delta <=s (const 64 (1 + 2*517)),
    (const 64 (-(2**20))) <=s u_512_517, u_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_517, v_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_517, r_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_517, s_512_517 <=s (const 64 ((2**20))),
    u_512_517 + v_512_517 <=s (const 64 (2**20)),
    u_512_517 - v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 + v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 - v_512_517 <=s (const 64 (2**20)),
    r_512_517 + s_512_517 <=s (const 64 (2**20)),
    r_512_517 - s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 + s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 - s_512_517 <=s (const 64 (2**20)),
    u_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_512_517 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_516_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_4,
sint64 g_472_low60_40_low20_4,
sint64 f_472_low60_40_low20_5,
sint64 g_472_low60_40_low20_5,
sint64 u_512_516,
sint64 v_512_516,
sint64 r_512_516,
sint64 s_512_516,
sint64 u_512_517,
sint64 v_512_517,
sint64 r_512_517,
sint64 s_512_517,
bit ne
)={
    u_512_516 * f_472_low60_40_low20_0 + v_512_516 * g_472_low60_40_low20_0 = f_472_low60_40_low20_4 * (-(2**20)),
    r_512_516 * f_472_low60_40_low20_0 + s_512_516 * g_472_low60_40_low20_0 = g_472_low60_40_low20_4 * (-(2**20))
&&
    u_512_516 * f_472_low60_40_low20_0 + v_512_516 * g_472_low60_40_low20_0 = f_472_low60_40_low20_4 * (const 64 (-(2**20))),
    r_512_516 * f_472_low60_40_low20_0 + s_512_516 * g_472_low60_40_low20_0 = g_472_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_4 + u_512_516 * (const 64 (2**21)) + v_512_516 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_4 + r_512_516 * (const 64 (2**21)) + s_512_516 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_4,
    f_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_4,
    g_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 516)) <=s delta, delta <=s (const 64 (1 + 2*516)),
    (const 64 (-(2**20))) <=s u_512_516, u_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_516, v_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_516, r_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_516, s_512_516 <=s (const 64 ((2**20))),
    u_512_516 + v_512_516 <=s (const 64 (2**20)),
    u_512_516 - v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 + v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 - v_512_516 <=s (const 64 (2**20)),
    r_512_516 + s_512_516 <=s (const 64 (2**20)),
    r_512_516 - s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 + s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 - s_512_516 <=s (const 64 (2**20)),
    u_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_512_516 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise b
assume
g_472_low60_40_low20_4 = 1 (mod 2)
&&
g_472_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_5 f_472_low60_40_low20_4;
mov u_512_517 u_512_516;
mov v_512_517 v_512_516;

add g_472_low60_40_low20_5 g_472_low60_40_low20_4 f_472_low60_40_low20_4;
asr g_472_low60_40_low20_5 g_472_low60_40_low20_5 1;
add r_512_517 r_512_516 u_512_516;
asr r_512_517 r_512_517 1;
add s_512_517 s_512_516 v_512_516;
asr s_512_517 s_512_517 1;
assert
    true
&&
    f_472_low60_40_low20_5 = f_472_low60_40_low20_4,
    u_512_517 = u_512_516,
    v_512_517 = v_512_516,
    g_472_low60_40_low20_5 * (const 64 2) = g_472_low60_40_low20_4 + f_472_low60_40_low20_4,
    r_512_517 * (const 64 2) = r_512_516 + u_512_516,
    s_512_517 * (const 64 2) = s_512_516 + v_512_516
;

assume
    f_472_low60_40_low20_5 = f_472_low60_40_low20_4,
    u_512_517 = u_512_516,
    v_512_517 = v_512_516,
    g_472_low60_40_low20_5 * 2 = g_472_low60_40_low20_4 + f_472_low60_40_low20_4,
    r_512_517 * 2 = r_512_516 + u_512_516,
    s_512_517 * 2 = s_512_516 + v_512_516
&&
    true
;

{
    u_512_517 * f_472_low60_40_low20_0 + v_512_517 * g_472_low60_40_low20_0 = f_472_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_517 * f_472_low60_40_low20_0 + s_512_517 * g_472_low60_40_low20_0 = g_472_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_5 + u_512_517 * (const 64 (2**21)) + v_512_517 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_5 + r_512_517 * (const 64 (2**21)) + s_512_517 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_5,
    f_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_5,
    g_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 517)) <=s delta, delta <=s (const 64 (1 + 2*517)),
    (const 64 (-(2**20))) <=s u_512_517, u_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_517, v_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_517, r_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_517, s_512_517 <=s (const 64 ((2**20))),
    u_512_517 + v_512_517 <=s (const 64 (2**20)),
    u_512_517 - v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 + v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 - v_512_517 <=s (const 64 (2**20)),
    r_512_517 + s_512_517 <=s (const 64 (2**20)),
    r_512_517 - s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 + s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 - s_512_517 <=s (const 64 (2**20)),
    u_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_512_517 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_516_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_4,
sint64 g_472_low60_40_low20_4,
sint64 f_472_low60_40_low20_5,
sint64 g_472_low60_40_low20_5,
sint64 u_512_516,
sint64 v_512_516,
sint64 r_512_516,
sint64 s_512_516,
sint64 u_512_517,
sint64 v_512_517,
sint64 r_512_517,
sint64 s_512_517,
bit ne
)={
    u_512_516 * f_472_low60_40_low20_0 + v_512_516 * g_472_low60_40_low20_0 = f_472_low60_40_low20_4 * (-(2**20)),
    r_512_516 * f_472_low60_40_low20_0 + s_512_516 * g_472_low60_40_low20_0 = g_472_low60_40_low20_4 * (-(2**20))
&&
    u_512_516 * f_472_low60_40_low20_0 + v_512_516 * g_472_low60_40_low20_0 = f_472_low60_40_low20_4 * (const 64 (-(2**20))),
    r_512_516 * f_472_low60_40_low20_0 + s_512_516 * g_472_low60_40_low20_0 = g_472_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_4 + u_512_516 * (const 64 (2**21)) + v_512_516 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_4 + r_512_516 * (const 64 (2**21)) + s_512_516 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_4,
    f_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_4,
    g_472_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 516)) <=s delta, delta <=s (const 64 (1 + 2*516)),
    (const 64 (-(2**20))) <=s u_512_516, u_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_516, v_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_516, r_512_516 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_516, s_512_516 <=s (const 64 ((2**20))),
    u_512_516 + v_512_516 <=s (const 64 (2**20)),
    u_512_516 - v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 + v_512_516 <=s (const 64 (2**20)),
    (const 64 0) - u_512_516 - v_512_516 <=s (const 64 (2**20)),
    r_512_516 + s_512_516 <=s (const 64 (2**20)),
    r_512_516 - s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 + s_512_516 <=s (const 64 (2**20)),
    (const 64 0) - r_512_516 - s_512_516 <=s (const 64 (2**20)),
    u_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_512_516 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_512_516 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise c
assume
g_472_low60_40_low20_4 = 1 (mod 2)
&&
g_472_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_5 g_472_low60_40_low20_4;
mov u_512_517 r_512_516;
mov v_512_517 s_512_516;

subs dc g_472_low60_40_low20_5 g_472_low60_40_low20_4 f_472_low60_40_low20_4;
asr g_472_low60_40_low20_5 g_472_low60_40_low20_5 1;
subs dc r_512_517 r_512_516 u_512_516;
asr r_512_517 r_512_517 1;
subs dc s_512_517 s_512_516 v_512_516;
asr s_512_517 s_512_517 1;
assert
    true
&&
    f_472_low60_40_low20_5 = g_472_low60_40_low20_4,
    u_512_517 = r_512_516,
    v_512_517 = s_512_516,
    g_472_low60_40_low20_5 * (const 64 2) = g_472_low60_40_low20_4 - f_472_low60_40_low20_4,
    r_512_517 * (const 64 2) = r_512_516 - u_512_516,
    s_512_517 * (const 64 2) = s_512_516 - v_512_516
;

assume
    f_472_low60_40_low20_5 = g_472_low60_40_low20_4,
    u_512_517 = r_512_516,
    v_512_517 = s_512_516,
    g_472_low60_40_low20_5 * 2 = g_472_low60_40_low20_4 - f_472_low60_40_low20_4,
    r_512_517 * 2 = r_512_516 - u_512_516,
    s_512_517 * 2 = s_512_516 - v_512_516
&&
    true
;

{
    u_512_517 * f_472_low60_40_low20_0 + v_512_517 * g_472_low60_40_low20_0 = f_472_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_517 * f_472_low60_40_low20_0 + s_512_517 * g_472_low60_40_low20_0 = g_472_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_5 + u_512_517 * (const 64 (2**21)) + v_512_517 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_5 + r_512_517 * (const 64 (2**21)) + s_512_517 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_5,
    f_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_5,
    g_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 517)) <=s delta, delta <=s (const 64 (1 + 2*517)),
    (const 64 (-(2**20))) <=s u_512_517, u_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_517, v_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_517, r_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_517, s_512_517 <=s (const 64 ((2**20))),
    u_512_517 + v_512_517 <=s (const 64 (2**20)),
    u_512_517 - v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 + v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 - v_512_517 <=s (const 64 (2**20)),
    r_512_517 + s_512_517 <=s (const 64 (2**20)),
    r_512_517 - s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 + s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 - s_512_517 <=s (const 64 (2**20)),
    u_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_512_517 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_517_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_5,
sint64 g_472_low60_40_low20_5,
sint64 f_472_low60_40_low20_6,
sint64 g_472_low60_40_low20_6,
sint64 u_512_517,
sint64 v_512_517,
sint64 r_512_517,
sint64 s_512_517,
sint64 u_512_518,
sint64 v_512_518,
sint64 r_512_518,
sint64 s_512_518,
bit ne
)={
    u_512_517 * f_472_low60_40_low20_0 + v_512_517 * g_472_low60_40_low20_0 = f_472_low60_40_low20_5 * (-(2**20)),
    r_512_517 * f_472_low60_40_low20_0 + s_512_517 * g_472_low60_40_low20_0 = g_472_low60_40_low20_5 * (-(2**20))
&&
    u_512_517 * f_472_low60_40_low20_0 + v_512_517 * g_472_low60_40_low20_0 = f_472_low60_40_low20_5 * (const 64 (-(2**20))),
    r_512_517 * f_472_low60_40_low20_0 + s_512_517 * g_472_low60_40_low20_0 = g_472_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_5 + u_512_517 * (const 64 (2**21)) + v_512_517 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_5 + r_512_517 * (const 64 (2**21)) + s_512_517 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_5,
    f_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_5,
    g_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 517)) <=s delta, delta <=s (const 64 (1 + 2*517)),
    (const 64 (-(2**20))) <=s u_512_517, u_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_517, v_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_517, r_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_517, s_512_517 <=s (const 64 ((2**20))),
    u_512_517 + v_512_517 <=s (const 64 (2**20)),
    u_512_517 - v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 + v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 - v_512_517 <=s (const 64 (2**20)),
    r_512_517 + s_512_517 <=s (const 64 (2**20)),
    r_512_517 - s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 + s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 - s_512_517 <=s (const 64 (2**20)),
    u_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_512_517 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise a
assume
g_472_low60_40_low20_5 = 0 (mod 2)
&&
g_472_low60_40_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_6 f_472_low60_40_low20_5;
mov u_512_518 u_512_517;
mov v_512_518 v_512_517;

asr g_472_low60_40_low20_6 g_472_low60_40_low20_5 1;
asr r_512_518 r_512_517 1;
asr s_512_518 s_512_517 1;
assert
    true
&&
    f_472_low60_40_low20_6 = f_472_low60_40_low20_5,
    u_512_518 = u_512_517,
    v_512_518 = v_512_517,
    g_472_low60_40_low20_6 * (const 64 2) = g_472_low60_40_low20_5,
    r_512_518 * (const 64 2) = r_512_517,
    s_512_518 * (const 64 2) = s_512_517
;

assume
    f_472_low60_40_low20_6 = f_472_low60_40_low20_5,
    u_512_518 = u_512_517,
    v_512_518 = v_512_517,
    g_472_low60_40_low20_6 * 2 = g_472_low60_40_low20_5,
    r_512_518 * 2 = r_512_517,
    s_512_518 * 2 = s_512_517
&&
    true
;

{
    u_512_518 * f_472_low60_40_low20_0 + v_512_518 * g_472_low60_40_low20_0 = f_472_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_518 * f_472_low60_40_low20_0 + s_512_518 * g_472_low60_40_low20_0 = g_472_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_6 + u_512_518 * (const 64 (2**21)) + v_512_518 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_6 + r_512_518 * (const 64 (2**21)) + s_512_518 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_6,
    f_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_6,
    g_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 518)) <=s delta, delta <=s (const 64 (1 + 2*518)),
    (const 64 (-(2**20))) <=s u_512_518, u_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_518, v_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_518, r_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_518, s_512_518 <=s (const 64 ((2**20))),
    u_512_518 + v_512_518 <=s (const 64 (2**20)),
    u_512_518 - v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 + v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 - v_512_518 <=s (const 64 (2**20)),
    r_512_518 + s_512_518 <=s (const 64 (2**20)),
    r_512_518 - s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 + s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 - s_512_518 <=s (const 64 (2**20)),
    u_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_512_518 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_517_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_5,
sint64 g_472_low60_40_low20_5,
sint64 f_472_low60_40_low20_6,
sint64 g_472_low60_40_low20_6,
sint64 u_512_517,
sint64 v_512_517,
sint64 r_512_517,
sint64 s_512_517,
sint64 u_512_518,
sint64 v_512_518,
sint64 r_512_518,
sint64 s_512_518,
bit ne
)={
    u_512_517 * f_472_low60_40_low20_0 + v_512_517 * g_472_low60_40_low20_0 = f_472_low60_40_low20_5 * (-(2**20)),
    r_512_517 * f_472_low60_40_low20_0 + s_512_517 * g_472_low60_40_low20_0 = g_472_low60_40_low20_5 * (-(2**20))
&&
    u_512_517 * f_472_low60_40_low20_0 + v_512_517 * g_472_low60_40_low20_0 = f_472_low60_40_low20_5 * (const 64 (-(2**20))),
    r_512_517 * f_472_low60_40_low20_0 + s_512_517 * g_472_low60_40_low20_0 = g_472_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_5 + u_512_517 * (const 64 (2**21)) + v_512_517 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_5 + r_512_517 * (const 64 (2**21)) + s_512_517 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_5,
    f_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_5,
    g_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 517)) <=s delta, delta <=s (const 64 (1 + 2*517)),
    (const 64 (-(2**20))) <=s u_512_517, u_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_517, v_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_517, r_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_517, s_512_517 <=s (const 64 ((2**20))),
    u_512_517 + v_512_517 <=s (const 64 (2**20)),
    u_512_517 - v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 + v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 - v_512_517 <=s (const 64 (2**20)),
    r_512_517 + s_512_517 <=s (const 64 (2**20)),
    r_512_517 - s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 + s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 - s_512_517 <=s (const 64 (2**20)),
    u_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_512_517 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise b
assume
g_472_low60_40_low20_5 = 1 (mod 2)
&&
g_472_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_6 f_472_low60_40_low20_5;
mov u_512_518 u_512_517;
mov v_512_518 v_512_517;

add g_472_low60_40_low20_6 g_472_low60_40_low20_5 f_472_low60_40_low20_5;
asr g_472_low60_40_low20_6 g_472_low60_40_low20_6 1;
add r_512_518 r_512_517 u_512_517;
asr r_512_518 r_512_518 1;
add s_512_518 s_512_517 v_512_517;
asr s_512_518 s_512_518 1;
assert
    true
&&
    f_472_low60_40_low20_6 = f_472_low60_40_low20_5,
    u_512_518 = u_512_517,
    v_512_518 = v_512_517,
    g_472_low60_40_low20_6 * (const 64 2) = g_472_low60_40_low20_5 + f_472_low60_40_low20_5,
    r_512_518 * (const 64 2) = r_512_517 + u_512_517,
    s_512_518 * (const 64 2) = s_512_517 + v_512_517
;

assume
    f_472_low60_40_low20_6 = f_472_low60_40_low20_5,
    u_512_518 = u_512_517,
    v_512_518 = v_512_517,
    g_472_low60_40_low20_6 * 2 = g_472_low60_40_low20_5 + f_472_low60_40_low20_5,
    r_512_518 * 2 = r_512_517 + u_512_517,
    s_512_518 * 2 = s_512_517 + v_512_517
&&
    true
;

{
    u_512_518 * f_472_low60_40_low20_0 + v_512_518 * g_472_low60_40_low20_0 = f_472_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_518 * f_472_low60_40_low20_0 + s_512_518 * g_472_low60_40_low20_0 = g_472_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_6 + u_512_518 * (const 64 (2**21)) + v_512_518 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_6 + r_512_518 * (const 64 (2**21)) + s_512_518 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_6,
    f_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_6,
    g_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 518)) <=s delta, delta <=s (const 64 (1 + 2*518)),
    (const 64 (-(2**20))) <=s u_512_518, u_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_518, v_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_518, r_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_518, s_512_518 <=s (const 64 ((2**20))),
    u_512_518 + v_512_518 <=s (const 64 (2**20)),
    u_512_518 - v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 + v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 - v_512_518 <=s (const 64 (2**20)),
    r_512_518 + s_512_518 <=s (const 64 (2**20)),
    r_512_518 - s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 + s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 - s_512_518 <=s (const 64 (2**20)),
    u_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_512_518 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_517_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_5,
sint64 g_472_low60_40_low20_5,
sint64 f_472_low60_40_low20_6,
sint64 g_472_low60_40_low20_6,
sint64 u_512_517,
sint64 v_512_517,
sint64 r_512_517,
sint64 s_512_517,
sint64 u_512_518,
sint64 v_512_518,
sint64 r_512_518,
sint64 s_512_518,
bit ne
)={
    u_512_517 * f_472_low60_40_low20_0 + v_512_517 * g_472_low60_40_low20_0 = f_472_low60_40_low20_5 * (-(2**20)),
    r_512_517 * f_472_low60_40_low20_0 + s_512_517 * g_472_low60_40_low20_0 = g_472_low60_40_low20_5 * (-(2**20))
&&
    u_512_517 * f_472_low60_40_low20_0 + v_512_517 * g_472_low60_40_low20_0 = f_472_low60_40_low20_5 * (const 64 (-(2**20))),
    r_512_517 * f_472_low60_40_low20_0 + s_512_517 * g_472_low60_40_low20_0 = g_472_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_5 + u_512_517 * (const 64 (2**21)) + v_512_517 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_5 + r_512_517 * (const 64 (2**21)) + s_512_517 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_5,
    f_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_5,
    g_472_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 517)) <=s delta, delta <=s (const 64 (1 + 2*517)),
    (const 64 (-(2**20))) <=s u_512_517, u_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_517, v_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_517, r_512_517 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_517, s_512_517 <=s (const 64 ((2**20))),
    u_512_517 + v_512_517 <=s (const 64 (2**20)),
    u_512_517 - v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 + v_512_517 <=s (const 64 (2**20)),
    (const 64 0) - u_512_517 - v_512_517 <=s (const 64 (2**20)),
    r_512_517 + s_512_517 <=s (const 64 (2**20)),
    r_512_517 - s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 + s_512_517 <=s (const 64 (2**20)),
    (const 64 0) - r_512_517 - s_512_517 <=s (const 64 (2**20)),
    u_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_512_517 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_512_517 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise c
assume
g_472_low60_40_low20_5 = 1 (mod 2)
&&
g_472_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_6 g_472_low60_40_low20_5;
mov u_512_518 r_512_517;
mov v_512_518 s_512_517;

subs dc g_472_low60_40_low20_6 g_472_low60_40_low20_5 f_472_low60_40_low20_5;
asr g_472_low60_40_low20_6 g_472_low60_40_low20_6 1;
subs dc r_512_518 r_512_517 u_512_517;
asr r_512_518 r_512_518 1;
subs dc s_512_518 s_512_517 v_512_517;
asr s_512_518 s_512_518 1;
assert
    true
&&
    f_472_low60_40_low20_6 = g_472_low60_40_low20_5,
    u_512_518 = r_512_517,
    v_512_518 = s_512_517,
    g_472_low60_40_low20_6 * (const 64 2) = g_472_low60_40_low20_5 - f_472_low60_40_low20_5,
    r_512_518 * (const 64 2) = r_512_517 - u_512_517,
    s_512_518 * (const 64 2) = s_512_517 - v_512_517
;

assume
    f_472_low60_40_low20_6 = g_472_low60_40_low20_5,
    u_512_518 = r_512_517,
    v_512_518 = s_512_517,
    g_472_low60_40_low20_6 * 2 = g_472_low60_40_low20_5 - f_472_low60_40_low20_5,
    r_512_518 * 2 = r_512_517 - u_512_517,
    s_512_518 * 2 = s_512_517 - v_512_517
&&
    true
;

{
    u_512_518 * f_472_low60_40_low20_0 + v_512_518 * g_472_low60_40_low20_0 = f_472_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_518 * f_472_low60_40_low20_0 + s_512_518 * g_472_low60_40_low20_0 = g_472_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_6 + u_512_518 * (const 64 (2**21)) + v_512_518 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_6 + r_512_518 * (const 64 (2**21)) + s_512_518 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_6,
    f_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_6,
    g_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 518)) <=s delta, delta <=s (const 64 (1 + 2*518)),
    (const 64 (-(2**20))) <=s u_512_518, u_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_518, v_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_518, r_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_518, s_512_518 <=s (const 64 ((2**20))),
    u_512_518 + v_512_518 <=s (const 64 (2**20)),
    u_512_518 - v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 + v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 - v_512_518 <=s (const 64 (2**20)),
    r_512_518 + s_512_518 <=s (const 64 (2**20)),
    r_512_518 - s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 + s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 - s_512_518 <=s (const 64 (2**20)),
    u_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_512_518 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_518_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_6,
sint64 g_472_low60_40_low20_6,
sint64 f_472_low60_40_low20_7,
sint64 g_472_low60_40_low20_7,
sint64 u_512_518,
sint64 v_512_518,
sint64 r_512_518,
sint64 s_512_518,
sint64 u_512_519,
sint64 v_512_519,
sint64 r_512_519,
sint64 s_512_519,
bit ne
)={
    u_512_518 * f_472_low60_40_low20_0 + v_512_518 * g_472_low60_40_low20_0 = f_472_low60_40_low20_6 * (-(2**20)),
    r_512_518 * f_472_low60_40_low20_0 + s_512_518 * g_472_low60_40_low20_0 = g_472_low60_40_low20_6 * (-(2**20))
&&
    u_512_518 * f_472_low60_40_low20_0 + v_512_518 * g_472_low60_40_low20_0 = f_472_low60_40_low20_6 * (const 64 (-(2**20))),
    r_512_518 * f_472_low60_40_low20_0 + s_512_518 * g_472_low60_40_low20_0 = g_472_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_6 + u_512_518 * (const 64 (2**21)) + v_512_518 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_6 + r_512_518 * (const 64 (2**21)) + s_512_518 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_6,
    f_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_6,
    g_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 518)) <=s delta, delta <=s (const 64 (1 + 2*518)),
    (const 64 (-(2**20))) <=s u_512_518, u_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_518, v_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_518, r_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_518, s_512_518 <=s (const 64 ((2**20))),
    u_512_518 + v_512_518 <=s (const 64 (2**20)),
    u_512_518 - v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 + v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 - v_512_518 <=s (const 64 (2**20)),
    r_512_518 + s_512_518 <=s (const 64 (2**20)),
    r_512_518 - s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 + s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 - s_512_518 <=s (const 64 (2**20)),
    u_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_512_518 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise a
assume
g_472_low60_40_low20_6 = 0 (mod 2)
&&
g_472_low60_40_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_7 f_472_low60_40_low20_6;
mov u_512_519 u_512_518;
mov v_512_519 v_512_518;

asr g_472_low60_40_low20_7 g_472_low60_40_low20_6 1;
asr r_512_519 r_512_518 1;
asr s_512_519 s_512_518 1;
assert
    true
&&
    f_472_low60_40_low20_7 = f_472_low60_40_low20_6,
    u_512_519 = u_512_518,
    v_512_519 = v_512_518,
    g_472_low60_40_low20_7 * (const 64 2) = g_472_low60_40_low20_6,
    r_512_519 * (const 64 2) = r_512_518,
    s_512_519 * (const 64 2) = s_512_518
;

assume
    f_472_low60_40_low20_7 = f_472_low60_40_low20_6,
    u_512_519 = u_512_518,
    v_512_519 = v_512_518,
    g_472_low60_40_low20_7 * 2 = g_472_low60_40_low20_6,
    r_512_519 * 2 = r_512_518,
    s_512_519 * 2 = s_512_518
&&
    true
;

{
    u_512_519 * f_472_low60_40_low20_0 + v_512_519 * g_472_low60_40_low20_0 = f_472_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_519 * f_472_low60_40_low20_0 + s_512_519 * g_472_low60_40_low20_0 = g_472_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_7 + u_512_519 * (const 64 (2**21)) + v_512_519 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_7 + r_512_519 * (const 64 (2**21)) + s_512_519 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_7,
    f_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_7,
    g_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 519)) <=s delta, delta <=s (const 64 (1 + 2*519)),
    (const 64 (-(2**20))) <=s u_512_519, u_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_519, v_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_519, r_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_519, s_512_519 <=s (const 64 ((2**20))),
    u_512_519 + v_512_519 <=s (const 64 (2**20)),
    u_512_519 - v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 + v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 - v_512_519 <=s (const 64 (2**20)),
    r_512_519 + s_512_519 <=s (const 64 (2**20)),
    r_512_519 - s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 + s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 - s_512_519 <=s (const 64 (2**20)),
    u_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_512_519 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_518_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_6,
sint64 g_472_low60_40_low20_6,
sint64 f_472_low60_40_low20_7,
sint64 g_472_low60_40_low20_7,
sint64 u_512_518,
sint64 v_512_518,
sint64 r_512_518,
sint64 s_512_518,
sint64 u_512_519,
sint64 v_512_519,
sint64 r_512_519,
sint64 s_512_519,
bit ne
)={
    u_512_518 * f_472_low60_40_low20_0 + v_512_518 * g_472_low60_40_low20_0 = f_472_low60_40_low20_6 * (-(2**20)),
    r_512_518 * f_472_low60_40_low20_0 + s_512_518 * g_472_low60_40_low20_0 = g_472_low60_40_low20_6 * (-(2**20))
&&
    u_512_518 * f_472_low60_40_low20_0 + v_512_518 * g_472_low60_40_low20_0 = f_472_low60_40_low20_6 * (const 64 (-(2**20))),
    r_512_518 * f_472_low60_40_low20_0 + s_512_518 * g_472_low60_40_low20_0 = g_472_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_6 + u_512_518 * (const 64 (2**21)) + v_512_518 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_6 + r_512_518 * (const 64 (2**21)) + s_512_518 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_6,
    f_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_6,
    g_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 518)) <=s delta, delta <=s (const 64 (1 + 2*518)),
    (const 64 (-(2**20))) <=s u_512_518, u_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_518, v_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_518, r_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_518, s_512_518 <=s (const 64 ((2**20))),
    u_512_518 + v_512_518 <=s (const 64 (2**20)),
    u_512_518 - v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 + v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 - v_512_518 <=s (const 64 (2**20)),
    r_512_518 + s_512_518 <=s (const 64 (2**20)),
    r_512_518 - s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 + s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 - s_512_518 <=s (const 64 (2**20)),
    u_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_512_518 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise b
assume
g_472_low60_40_low20_6 = 1 (mod 2)
&&
g_472_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_7 f_472_low60_40_low20_6;
mov u_512_519 u_512_518;
mov v_512_519 v_512_518;

add g_472_low60_40_low20_7 g_472_low60_40_low20_6 f_472_low60_40_low20_6;
asr g_472_low60_40_low20_7 g_472_low60_40_low20_7 1;
add r_512_519 r_512_518 u_512_518;
asr r_512_519 r_512_519 1;
add s_512_519 s_512_518 v_512_518;
asr s_512_519 s_512_519 1;
assert
    true
&&
    f_472_low60_40_low20_7 = f_472_low60_40_low20_6,
    u_512_519 = u_512_518,
    v_512_519 = v_512_518,
    g_472_low60_40_low20_7 * (const 64 2) = g_472_low60_40_low20_6 + f_472_low60_40_low20_6,
    r_512_519 * (const 64 2) = r_512_518 + u_512_518,
    s_512_519 * (const 64 2) = s_512_518 + v_512_518
;

assume
    f_472_low60_40_low20_7 = f_472_low60_40_low20_6,
    u_512_519 = u_512_518,
    v_512_519 = v_512_518,
    g_472_low60_40_low20_7 * 2 = g_472_low60_40_low20_6 + f_472_low60_40_low20_6,
    r_512_519 * 2 = r_512_518 + u_512_518,
    s_512_519 * 2 = s_512_518 + v_512_518
&&
    true
;

{
    u_512_519 * f_472_low60_40_low20_0 + v_512_519 * g_472_low60_40_low20_0 = f_472_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_519 * f_472_low60_40_low20_0 + s_512_519 * g_472_low60_40_low20_0 = g_472_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_7 + u_512_519 * (const 64 (2**21)) + v_512_519 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_7 + r_512_519 * (const 64 (2**21)) + s_512_519 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_7,
    f_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_7,
    g_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 519)) <=s delta, delta <=s (const 64 (1 + 2*519)),
    (const 64 (-(2**20))) <=s u_512_519, u_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_519, v_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_519, r_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_519, s_512_519 <=s (const 64 ((2**20))),
    u_512_519 + v_512_519 <=s (const 64 (2**20)),
    u_512_519 - v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 + v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 - v_512_519 <=s (const 64 (2**20)),
    r_512_519 + s_512_519 <=s (const 64 (2**20)),
    r_512_519 - s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 + s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 - s_512_519 <=s (const 64 (2**20)),
    u_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_512_519 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_518_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_6,
sint64 g_472_low60_40_low20_6,
sint64 f_472_low60_40_low20_7,
sint64 g_472_low60_40_low20_7,
sint64 u_512_518,
sint64 v_512_518,
sint64 r_512_518,
sint64 s_512_518,
sint64 u_512_519,
sint64 v_512_519,
sint64 r_512_519,
sint64 s_512_519,
bit ne
)={
    u_512_518 * f_472_low60_40_low20_0 + v_512_518 * g_472_low60_40_low20_0 = f_472_low60_40_low20_6 * (-(2**20)),
    r_512_518 * f_472_low60_40_low20_0 + s_512_518 * g_472_low60_40_low20_0 = g_472_low60_40_low20_6 * (-(2**20))
&&
    u_512_518 * f_472_low60_40_low20_0 + v_512_518 * g_472_low60_40_low20_0 = f_472_low60_40_low20_6 * (const 64 (-(2**20))),
    r_512_518 * f_472_low60_40_low20_0 + s_512_518 * g_472_low60_40_low20_0 = g_472_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_6 + u_512_518 * (const 64 (2**21)) + v_512_518 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_6 + r_512_518 * (const 64 (2**21)) + s_512_518 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_6,
    f_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_6,
    g_472_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 518)) <=s delta, delta <=s (const 64 (1 + 2*518)),
    (const 64 (-(2**20))) <=s u_512_518, u_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_518, v_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_518, r_512_518 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_518, s_512_518 <=s (const 64 ((2**20))),
    u_512_518 + v_512_518 <=s (const 64 (2**20)),
    u_512_518 - v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 + v_512_518 <=s (const 64 (2**20)),
    (const 64 0) - u_512_518 - v_512_518 <=s (const 64 (2**20)),
    r_512_518 + s_512_518 <=s (const 64 (2**20)),
    r_512_518 - s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 + s_512_518 <=s (const 64 (2**20)),
    (const 64 0) - r_512_518 - s_512_518 <=s (const 64 (2**20)),
    u_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_512_518 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_512_518 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise c
assume
g_472_low60_40_low20_6 = 1 (mod 2)
&&
g_472_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_7 g_472_low60_40_low20_6;
mov u_512_519 r_512_518;
mov v_512_519 s_512_518;

subs dc g_472_low60_40_low20_7 g_472_low60_40_low20_6 f_472_low60_40_low20_6;
asr g_472_low60_40_low20_7 g_472_low60_40_low20_7 1;
subs dc r_512_519 r_512_518 u_512_518;
asr r_512_519 r_512_519 1;
subs dc s_512_519 s_512_518 v_512_518;
asr s_512_519 s_512_519 1;
assert
    true
&&
    f_472_low60_40_low20_7 = g_472_low60_40_low20_6,
    u_512_519 = r_512_518,
    v_512_519 = s_512_518,
    g_472_low60_40_low20_7 * (const 64 2) = g_472_low60_40_low20_6 - f_472_low60_40_low20_6,
    r_512_519 * (const 64 2) = r_512_518 - u_512_518,
    s_512_519 * (const 64 2) = s_512_518 - v_512_518
;

assume
    f_472_low60_40_low20_7 = g_472_low60_40_low20_6,
    u_512_519 = r_512_518,
    v_512_519 = s_512_518,
    g_472_low60_40_low20_7 * 2 = g_472_low60_40_low20_6 - f_472_low60_40_low20_6,
    r_512_519 * 2 = r_512_518 - u_512_518,
    s_512_519 * 2 = s_512_518 - v_512_518
&&
    true
;

{
    u_512_519 * f_472_low60_40_low20_0 + v_512_519 * g_472_low60_40_low20_0 = f_472_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_519 * f_472_low60_40_low20_0 + s_512_519 * g_472_low60_40_low20_0 = g_472_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_7 + u_512_519 * (const 64 (2**21)) + v_512_519 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_7 + r_512_519 * (const 64 (2**21)) + s_512_519 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_7,
    f_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_7,
    g_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 519)) <=s delta, delta <=s (const 64 (1 + 2*519)),
    (const 64 (-(2**20))) <=s u_512_519, u_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_519, v_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_519, r_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_519, s_512_519 <=s (const 64 ((2**20))),
    u_512_519 + v_512_519 <=s (const 64 (2**20)),
    u_512_519 - v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 + v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 - v_512_519 <=s (const 64 (2**20)),
    r_512_519 + s_512_519 <=s (const 64 (2**20)),
    r_512_519 - s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 + s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 - s_512_519 <=s (const 64 (2**20)),
    u_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_512_519 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_519_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_7,
sint64 g_472_low60_40_low20_7,
sint64 f_472_low60_40_low20_8,
sint64 g_472_low60_40_low20_8,
sint64 u_512_519,
sint64 v_512_519,
sint64 r_512_519,
sint64 s_512_519,
sint64 u_512_520,
sint64 v_512_520,
sint64 r_512_520,
sint64 s_512_520,
bit ne
)={
    u_512_519 * f_472_low60_40_low20_0 + v_512_519 * g_472_low60_40_low20_0 = f_472_low60_40_low20_7 * (-(2**20)),
    r_512_519 * f_472_low60_40_low20_0 + s_512_519 * g_472_low60_40_low20_0 = g_472_low60_40_low20_7 * (-(2**20))
&&
    u_512_519 * f_472_low60_40_low20_0 + v_512_519 * g_472_low60_40_low20_0 = f_472_low60_40_low20_7 * (const 64 (-(2**20))),
    r_512_519 * f_472_low60_40_low20_0 + s_512_519 * g_472_low60_40_low20_0 = g_472_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_7 + u_512_519 * (const 64 (2**21)) + v_512_519 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_7 + r_512_519 * (const 64 (2**21)) + s_512_519 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_7,
    f_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_7,
    g_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 519)) <=s delta, delta <=s (const 64 (1 + 2*519)),
    (const 64 (-(2**20))) <=s u_512_519, u_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_519, v_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_519, r_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_519, s_512_519 <=s (const 64 ((2**20))),
    u_512_519 + v_512_519 <=s (const 64 (2**20)),
    u_512_519 - v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 + v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 - v_512_519 <=s (const 64 (2**20)),
    r_512_519 + s_512_519 <=s (const 64 (2**20)),
    r_512_519 - s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 + s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 - s_512_519 <=s (const 64 (2**20)),
    u_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_512_519 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise a
assume
g_472_low60_40_low20_7 = 0 (mod 2)
&&
g_472_low60_40_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_8 f_472_low60_40_low20_7;
mov u_512_520 u_512_519;
mov v_512_520 v_512_519;

asr g_472_low60_40_low20_8 g_472_low60_40_low20_7 1;
asr r_512_520 r_512_519 1;
asr s_512_520 s_512_519 1;
assert
    true
&&
    f_472_low60_40_low20_8 = f_472_low60_40_low20_7,
    u_512_520 = u_512_519,
    v_512_520 = v_512_519,
    g_472_low60_40_low20_8 * (const 64 2) = g_472_low60_40_low20_7,
    r_512_520 * (const 64 2) = r_512_519,
    s_512_520 * (const 64 2) = s_512_519
;

assume
    f_472_low60_40_low20_8 = f_472_low60_40_low20_7,
    u_512_520 = u_512_519,
    v_512_520 = v_512_519,
    g_472_low60_40_low20_8 * 2 = g_472_low60_40_low20_7,
    r_512_520 * 2 = r_512_519,
    s_512_520 * 2 = s_512_519
&&
    true
;

{
    u_512_520 * f_472_low60_40_low20_0 + v_512_520 * g_472_low60_40_low20_0 = f_472_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_520 * f_472_low60_40_low20_0 + s_512_520 * g_472_low60_40_low20_0 = g_472_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_8 + u_512_520 * (const 64 (2**21)) + v_512_520 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_8 + r_512_520 * (const 64 (2**21)) + s_512_520 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_8,
    f_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_8,
    g_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 520)) <=s delta, delta <=s (const 64 (1 + 2*520)),
    (const 64 (-(2**20))) <=s u_512_520, u_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_520, v_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_520, r_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_520, s_512_520 <=s (const 64 ((2**20))),
    u_512_520 + v_512_520 <=s (const 64 (2**20)),
    u_512_520 - v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 + v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 - v_512_520 <=s (const 64 (2**20)),
    r_512_520 + s_512_520 <=s (const 64 (2**20)),
    r_512_520 - s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 + s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 - s_512_520 <=s (const 64 (2**20)),
    u_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_512_520 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_519_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_7,
sint64 g_472_low60_40_low20_7,
sint64 f_472_low60_40_low20_8,
sint64 g_472_low60_40_low20_8,
sint64 u_512_519,
sint64 v_512_519,
sint64 r_512_519,
sint64 s_512_519,
sint64 u_512_520,
sint64 v_512_520,
sint64 r_512_520,
sint64 s_512_520,
bit ne
)={
    u_512_519 * f_472_low60_40_low20_0 + v_512_519 * g_472_low60_40_low20_0 = f_472_low60_40_low20_7 * (-(2**20)),
    r_512_519 * f_472_low60_40_low20_0 + s_512_519 * g_472_low60_40_low20_0 = g_472_low60_40_low20_7 * (-(2**20))
&&
    u_512_519 * f_472_low60_40_low20_0 + v_512_519 * g_472_low60_40_low20_0 = f_472_low60_40_low20_7 * (const 64 (-(2**20))),
    r_512_519 * f_472_low60_40_low20_0 + s_512_519 * g_472_low60_40_low20_0 = g_472_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_7 + u_512_519 * (const 64 (2**21)) + v_512_519 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_7 + r_512_519 * (const 64 (2**21)) + s_512_519 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_7,
    f_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_7,
    g_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 519)) <=s delta, delta <=s (const 64 (1 + 2*519)),
    (const 64 (-(2**20))) <=s u_512_519, u_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_519, v_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_519, r_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_519, s_512_519 <=s (const 64 ((2**20))),
    u_512_519 + v_512_519 <=s (const 64 (2**20)),
    u_512_519 - v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 + v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 - v_512_519 <=s (const 64 (2**20)),
    r_512_519 + s_512_519 <=s (const 64 (2**20)),
    r_512_519 - s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 + s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 - s_512_519 <=s (const 64 (2**20)),
    u_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_512_519 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise b
assume
g_472_low60_40_low20_7 = 1 (mod 2)
&&
g_472_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_8 f_472_low60_40_low20_7;
mov u_512_520 u_512_519;
mov v_512_520 v_512_519;

add g_472_low60_40_low20_8 g_472_low60_40_low20_7 f_472_low60_40_low20_7;
asr g_472_low60_40_low20_8 g_472_low60_40_low20_8 1;
add r_512_520 r_512_519 u_512_519;
asr r_512_520 r_512_520 1;
add s_512_520 s_512_519 v_512_519;
asr s_512_520 s_512_520 1;
assert
    true
&&
    f_472_low60_40_low20_8 = f_472_low60_40_low20_7,
    u_512_520 = u_512_519,
    v_512_520 = v_512_519,
    g_472_low60_40_low20_8 * (const 64 2) = g_472_low60_40_low20_7 + f_472_low60_40_low20_7,
    r_512_520 * (const 64 2) = r_512_519 + u_512_519,
    s_512_520 * (const 64 2) = s_512_519 + v_512_519
;

assume
    f_472_low60_40_low20_8 = f_472_low60_40_low20_7,
    u_512_520 = u_512_519,
    v_512_520 = v_512_519,
    g_472_low60_40_low20_8 * 2 = g_472_low60_40_low20_7 + f_472_low60_40_low20_7,
    r_512_520 * 2 = r_512_519 + u_512_519,
    s_512_520 * 2 = s_512_519 + v_512_519
&&
    true
;

{
    u_512_520 * f_472_low60_40_low20_0 + v_512_520 * g_472_low60_40_low20_0 = f_472_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_520 * f_472_low60_40_low20_0 + s_512_520 * g_472_low60_40_low20_0 = g_472_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_8 + u_512_520 * (const 64 (2**21)) + v_512_520 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_8 + r_512_520 * (const 64 (2**21)) + s_512_520 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_8,
    f_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_8,
    g_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 520)) <=s delta, delta <=s (const 64 (1 + 2*520)),
    (const 64 (-(2**20))) <=s u_512_520, u_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_520, v_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_520, r_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_520, s_512_520 <=s (const 64 ((2**20))),
    u_512_520 + v_512_520 <=s (const 64 (2**20)),
    u_512_520 - v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 + v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 - v_512_520 <=s (const 64 (2**20)),
    r_512_520 + s_512_520 <=s (const 64 (2**20)),
    r_512_520 - s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 + s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 - s_512_520 <=s (const 64 (2**20)),
    u_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_512_520 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_519_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_7,
sint64 g_472_low60_40_low20_7,
sint64 f_472_low60_40_low20_8,
sint64 g_472_low60_40_low20_8,
sint64 u_512_519,
sint64 v_512_519,
sint64 r_512_519,
sint64 s_512_519,
sint64 u_512_520,
sint64 v_512_520,
sint64 r_512_520,
sint64 s_512_520,
bit ne
)={
    u_512_519 * f_472_low60_40_low20_0 + v_512_519 * g_472_low60_40_low20_0 = f_472_low60_40_low20_7 * (-(2**20)),
    r_512_519 * f_472_low60_40_low20_0 + s_512_519 * g_472_low60_40_low20_0 = g_472_low60_40_low20_7 * (-(2**20))
&&
    u_512_519 * f_472_low60_40_low20_0 + v_512_519 * g_472_low60_40_low20_0 = f_472_low60_40_low20_7 * (const 64 (-(2**20))),
    r_512_519 * f_472_low60_40_low20_0 + s_512_519 * g_472_low60_40_low20_0 = g_472_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_7 + u_512_519 * (const 64 (2**21)) + v_512_519 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_7 + r_512_519 * (const 64 (2**21)) + s_512_519 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_7,
    f_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_7,
    g_472_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 519)) <=s delta, delta <=s (const 64 (1 + 2*519)),
    (const 64 (-(2**20))) <=s u_512_519, u_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_519, v_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_519, r_512_519 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_519, s_512_519 <=s (const 64 ((2**20))),
    u_512_519 + v_512_519 <=s (const 64 (2**20)),
    u_512_519 - v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 + v_512_519 <=s (const 64 (2**20)),
    (const 64 0) - u_512_519 - v_512_519 <=s (const 64 (2**20)),
    r_512_519 + s_512_519 <=s (const 64 (2**20)),
    r_512_519 - s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 + s_512_519 <=s (const 64 (2**20)),
    (const 64 0) - r_512_519 - s_512_519 <=s (const 64 (2**20)),
    u_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_512_519 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_512_519 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise c
assume
g_472_low60_40_low20_7 = 1 (mod 2)
&&
g_472_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_8 g_472_low60_40_low20_7;
mov u_512_520 r_512_519;
mov v_512_520 s_512_519;

subs dc g_472_low60_40_low20_8 g_472_low60_40_low20_7 f_472_low60_40_low20_7;
asr g_472_low60_40_low20_8 g_472_low60_40_low20_8 1;
subs dc r_512_520 r_512_519 u_512_519;
asr r_512_520 r_512_520 1;
subs dc s_512_520 s_512_519 v_512_519;
asr s_512_520 s_512_520 1;
assert
    true
&&
    f_472_low60_40_low20_8 = g_472_low60_40_low20_7,
    u_512_520 = r_512_519,
    v_512_520 = s_512_519,
    g_472_low60_40_low20_8 * (const 64 2) = g_472_low60_40_low20_7 - f_472_low60_40_low20_7,
    r_512_520 * (const 64 2) = r_512_519 - u_512_519,
    s_512_520 * (const 64 2) = s_512_519 - v_512_519
;

assume
    f_472_low60_40_low20_8 = g_472_low60_40_low20_7,
    u_512_520 = r_512_519,
    v_512_520 = s_512_519,
    g_472_low60_40_low20_8 * 2 = g_472_low60_40_low20_7 - f_472_low60_40_low20_7,
    r_512_520 * 2 = r_512_519 - u_512_519,
    s_512_520 * 2 = s_512_519 - v_512_519
&&
    true
;

{
    u_512_520 * f_472_low60_40_low20_0 + v_512_520 * g_472_low60_40_low20_0 = f_472_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_520 * f_472_low60_40_low20_0 + s_512_520 * g_472_low60_40_low20_0 = g_472_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_8 + u_512_520 * (const 64 (2**21)) + v_512_520 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_8 + r_512_520 * (const 64 (2**21)) + s_512_520 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_8,
    f_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_8,
    g_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 520)) <=s delta, delta <=s (const 64 (1 + 2*520)),
    (const 64 (-(2**20))) <=s u_512_520, u_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_520, v_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_520, r_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_520, s_512_520 <=s (const 64 ((2**20))),
    u_512_520 + v_512_520 <=s (const 64 (2**20)),
    u_512_520 - v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 + v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 - v_512_520 <=s (const 64 (2**20)),
    r_512_520 + s_512_520 <=s (const 64 (2**20)),
    r_512_520 - s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 + s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 - s_512_520 <=s (const 64 (2**20)),
    u_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_512_520 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_520_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_8,
sint64 g_472_low60_40_low20_8,
sint64 f_472_low60_40_low20_9,
sint64 g_472_low60_40_low20_9,
sint64 u_512_520,
sint64 v_512_520,
sint64 r_512_520,
sint64 s_512_520,
sint64 u_512_521,
sint64 v_512_521,
sint64 r_512_521,
sint64 s_512_521,
bit ne
)={
    u_512_520 * f_472_low60_40_low20_0 + v_512_520 * g_472_low60_40_low20_0 = f_472_low60_40_low20_8 * (-(2**20)),
    r_512_520 * f_472_low60_40_low20_0 + s_512_520 * g_472_low60_40_low20_0 = g_472_low60_40_low20_8 * (-(2**20))
&&
    u_512_520 * f_472_low60_40_low20_0 + v_512_520 * g_472_low60_40_low20_0 = f_472_low60_40_low20_8 * (const 64 (-(2**20))),
    r_512_520 * f_472_low60_40_low20_0 + s_512_520 * g_472_low60_40_low20_0 = g_472_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_8 + u_512_520 * (const 64 (2**21)) + v_512_520 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_8 + r_512_520 * (const 64 (2**21)) + s_512_520 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_8,
    f_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_8,
    g_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 520)) <=s delta, delta <=s (const 64 (1 + 2*520)),
    (const 64 (-(2**20))) <=s u_512_520, u_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_520, v_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_520, r_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_520, s_512_520 <=s (const 64 ((2**20))),
    u_512_520 + v_512_520 <=s (const 64 (2**20)),
    u_512_520 - v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 + v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 - v_512_520 <=s (const 64 (2**20)),
    r_512_520 + s_512_520 <=s (const 64 (2**20)),
    r_512_520 - s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 + s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 - s_512_520 <=s (const 64 (2**20)),
    u_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_512_520 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise a
assume
g_472_low60_40_low20_8 = 0 (mod 2)
&&
g_472_low60_40_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_9 f_472_low60_40_low20_8;
mov u_512_521 u_512_520;
mov v_512_521 v_512_520;

asr g_472_low60_40_low20_9 g_472_low60_40_low20_8 1;
asr r_512_521 r_512_520 1;
asr s_512_521 s_512_520 1;
assert
    true
&&
    f_472_low60_40_low20_9 = f_472_low60_40_low20_8,
    u_512_521 = u_512_520,
    v_512_521 = v_512_520,
    g_472_low60_40_low20_9 * (const 64 2) = g_472_low60_40_low20_8,
    r_512_521 * (const 64 2) = r_512_520,
    s_512_521 * (const 64 2) = s_512_520
;

assume
    f_472_low60_40_low20_9 = f_472_low60_40_low20_8,
    u_512_521 = u_512_520,
    v_512_521 = v_512_520,
    g_472_low60_40_low20_9 * 2 = g_472_low60_40_low20_8,
    r_512_521 * 2 = r_512_520,
    s_512_521 * 2 = s_512_520
&&
    true
;

{
    u_512_521 * f_472_low60_40_low20_0 + v_512_521 * g_472_low60_40_low20_0 = f_472_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_521 * f_472_low60_40_low20_0 + s_512_521 * g_472_low60_40_low20_0 = g_472_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_9 + u_512_521 * (const 64 (2**21)) + v_512_521 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_9 + r_512_521 * (const 64 (2**21)) + s_512_521 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_9,
    f_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_9,
    g_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 521)) <=s delta, delta <=s (const 64 (1 + 2*521)),
    (const 64 (-(2**20))) <=s u_512_521, u_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_521, v_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_521, r_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_521, s_512_521 <=s (const 64 ((2**20))),
    u_512_521 + v_512_521 <=s (const 64 (2**20)),
    u_512_521 - v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 + v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 - v_512_521 <=s (const 64 (2**20)),
    r_512_521 + s_512_521 <=s (const 64 (2**20)),
    r_512_521 - s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 + s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 - s_512_521 <=s (const 64 (2**20)),
    u_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_512_521 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_520_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_8,
sint64 g_472_low60_40_low20_8,
sint64 f_472_low60_40_low20_9,
sint64 g_472_low60_40_low20_9,
sint64 u_512_520,
sint64 v_512_520,
sint64 r_512_520,
sint64 s_512_520,
sint64 u_512_521,
sint64 v_512_521,
sint64 r_512_521,
sint64 s_512_521,
bit ne
)={
    u_512_520 * f_472_low60_40_low20_0 + v_512_520 * g_472_low60_40_low20_0 = f_472_low60_40_low20_8 * (-(2**20)),
    r_512_520 * f_472_low60_40_low20_0 + s_512_520 * g_472_low60_40_low20_0 = g_472_low60_40_low20_8 * (-(2**20))
&&
    u_512_520 * f_472_low60_40_low20_0 + v_512_520 * g_472_low60_40_low20_0 = f_472_low60_40_low20_8 * (const 64 (-(2**20))),
    r_512_520 * f_472_low60_40_low20_0 + s_512_520 * g_472_low60_40_low20_0 = g_472_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_8 + u_512_520 * (const 64 (2**21)) + v_512_520 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_8 + r_512_520 * (const 64 (2**21)) + s_512_520 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_8,
    f_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_8,
    g_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 520)) <=s delta, delta <=s (const 64 (1 + 2*520)),
    (const 64 (-(2**20))) <=s u_512_520, u_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_520, v_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_520, r_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_520, s_512_520 <=s (const 64 ((2**20))),
    u_512_520 + v_512_520 <=s (const 64 (2**20)),
    u_512_520 - v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 + v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 - v_512_520 <=s (const 64 (2**20)),
    r_512_520 + s_512_520 <=s (const 64 (2**20)),
    r_512_520 - s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 + s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 - s_512_520 <=s (const 64 (2**20)),
    u_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_512_520 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise b
assume
g_472_low60_40_low20_8 = 1 (mod 2)
&&
g_472_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_9 f_472_low60_40_low20_8;
mov u_512_521 u_512_520;
mov v_512_521 v_512_520;

add g_472_low60_40_low20_9 g_472_low60_40_low20_8 f_472_low60_40_low20_8;
asr g_472_low60_40_low20_9 g_472_low60_40_low20_9 1;
add r_512_521 r_512_520 u_512_520;
asr r_512_521 r_512_521 1;
add s_512_521 s_512_520 v_512_520;
asr s_512_521 s_512_521 1;
assert
    true
&&
    f_472_low60_40_low20_9 = f_472_low60_40_low20_8,
    u_512_521 = u_512_520,
    v_512_521 = v_512_520,
    g_472_low60_40_low20_9 * (const 64 2) = g_472_low60_40_low20_8 + f_472_low60_40_low20_8,
    r_512_521 * (const 64 2) = r_512_520 + u_512_520,
    s_512_521 * (const 64 2) = s_512_520 + v_512_520
;

assume
    f_472_low60_40_low20_9 = f_472_low60_40_low20_8,
    u_512_521 = u_512_520,
    v_512_521 = v_512_520,
    g_472_low60_40_low20_9 * 2 = g_472_low60_40_low20_8 + f_472_low60_40_low20_8,
    r_512_521 * 2 = r_512_520 + u_512_520,
    s_512_521 * 2 = s_512_520 + v_512_520
&&
    true
;

{
    u_512_521 * f_472_low60_40_low20_0 + v_512_521 * g_472_low60_40_low20_0 = f_472_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_521 * f_472_low60_40_low20_0 + s_512_521 * g_472_low60_40_low20_0 = g_472_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_9 + u_512_521 * (const 64 (2**21)) + v_512_521 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_9 + r_512_521 * (const 64 (2**21)) + s_512_521 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_9,
    f_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_9,
    g_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 521)) <=s delta, delta <=s (const 64 (1 + 2*521)),
    (const 64 (-(2**20))) <=s u_512_521, u_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_521, v_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_521, r_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_521, s_512_521 <=s (const 64 ((2**20))),
    u_512_521 + v_512_521 <=s (const 64 (2**20)),
    u_512_521 - v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 + v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 - v_512_521 <=s (const 64 (2**20)),
    r_512_521 + s_512_521 <=s (const 64 (2**20)),
    r_512_521 - s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 + s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 - s_512_521 <=s (const 64 (2**20)),
    u_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_512_521 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_520_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_8,
sint64 g_472_low60_40_low20_8,
sint64 f_472_low60_40_low20_9,
sint64 g_472_low60_40_low20_9,
sint64 u_512_520,
sint64 v_512_520,
sint64 r_512_520,
sint64 s_512_520,
sint64 u_512_521,
sint64 v_512_521,
sint64 r_512_521,
sint64 s_512_521,
bit ne
)={
    u_512_520 * f_472_low60_40_low20_0 + v_512_520 * g_472_low60_40_low20_0 = f_472_low60_40_low20_8 * (-(2**20)),
    r_512_520 * f_472_low60_40_low20_0 + s_512_520 * g_472_low60_40_low20_0 = g_472_low60_40_low20_8 * (-(2**20))
&&
    u_512_520 * f_472_low60_40_low20_0 + v_512_520 * g_472_low60_40_low20_0 = f_472_low60_40_low20_8 * (const 64 (-(2**20))),
    r_512_520 * f_472_low60_40_low20_0 + s_512_520 * g_472_low60_40_low20_0 = g_472_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_8 + u_512_520 * (const 64 (2**21)) + v_512_520 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_8 + r_512_520 * (const 64 (2**21)) + s_512_520 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_8,
    f_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_8,
    g_472_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 520)) <=s delta, delta <=s (const 64 (1 + 2*520)),
    (const 64 (-(2**20))) <=s u_512_520, u_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_520, v_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_520, r_512_520 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_520, s_512_520 <=s (const 64 ((2**20))),
    u_512_520 + v_512_520 <=s (const 64 (2**20)),
    u_512_520 - v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 + v_512_520 <=s (const 64 (2**20)),
    (const 64 0) - u_512_520 - v_512_520 <=s (const 64 (2**20)),
    r_512_520 + s_512_520 <=s (const 64 (2**20)),
    r_512_520 - s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 + s_512_520 <=s (const 64 (2**20)),
    (const 64 0) - r_512_520 - s_512_520 <=s (const 64 (2**20)),
    u_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_512_520 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_512_520 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise c
assume
g_472_low60_40_low20_8 = 1 (mod 2)
&&
g_472_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_9 g_472_low60_40_low20_8;
mov u_512_521 r_512_520;
mov v_512_521 s_512_520;

subs dc g_472_low60_40_low20_9 g_472_low60_40_low20_8 f_472_low60_40_low20_8;
asr g_472_low60_40_low20_9 g_472_low60_40_low20_9 1;
subs dc r_512_521 r_512_520 u_512_520;
asr r_512_521 r_512_521 1;
subs dc s_512_521 s_512_520 v_512_520;
asr s_512_521 s_512_521 1;
assert
    true
&&
    f_472_low60_40_low20_9 = g_472_low60_40_low20_8,
    u_512_521 = r_512_520,
    v_512_521 = s_512_520,
    g_472_low60_40_low20_9 * (const 64 2) = g_472_low60_40_low20_8 - f_472_low60_40_low20_8,
    r_512_521 * (const 64 2) = r_512_520 - u_512_520,
    s_512_521 * (const 64 2) = s_512_520 - v_512_520
;

assume
    f_472_low60_40_low20_9 = g_472_low60_40_low20_8,
    u_512_521 = r_512_520,
    v_512_521 = s_512_520,
    g_472_low60_40_low20_9 * 2 = g_472_low60_40_low20_8 - f_472_low60_40_low20_8,
    r_512_521 * 2 = r_512_520 - u_512_520,
    s_512_521 * 2 = s_512_520 - v_512_520
&&
    true
;

{
    u_512_521 * f_472_low60_40_low20_0 + v_512_521 * g_472_low60_40_low20_0 = f_472_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_521 * f_472_low60_40_low20_0 + s_512_521 * g_472_low60_40_low20_0 = g_472_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_9 + u_512_521 * (const 64 (2**21)) + v_512_521 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_9 + r_512_521 * (const 64 (2**21)) + s_512_521 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_9,
    f_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_9,
    g_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 521)) <=s delta, delta <=s (const 64 (1 + 2*521)),
    (const 64 (-(2**20))) <=s u_512_521, u_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_521, v_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_521, r_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_521, s_512_521 <=s (const 64 ((2**20))),
    u_512_521 + v_512_521 <=s (const 64 (2**20)),
    u_512_521 - v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 + v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 - v_512_521 <=s (const 64 (2**20)),
    r_512_521 + s_512_521 <=s (const 64 (2**20)),
    r_512_521 - s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 + s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 - s_512_521 <=s (const 64 (2**20)),
    u_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_512_521 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_521_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_9,
sint64 g_472_low60_40_low20_9,
sint64 f_472_low60_40_low20_10,
sint64 g_472_low60_40_low20_10,
sint64 u_512_521,
sint64 v_512_521,
sint64 r_512_521,
sint64 s_512_521,
sint64 u_512_522,
sint64 v_512_522,
sint64 r_512_522,
sint64 s_512_522,
bit ne
)={
    u_512_521 * f_472_low60_40_low20_0 + v_512_521 * g_472_low60_40_low20_0 = f_472_low60_40_low20_9 * (-(2**20)),
    r_512_521 * f_472_low60_40_low20_0 + s_512_521 * g_472_low60_40_low20_0 = g_472_low60_40_low20_9 * (-(2**20))
&&
    u_512_521 * f_472_low60_40_low20_0 + v_512_521 * g_472_low60_40_low20_0 = f_472_low60_40_low20_9 * (const 64 (-(2**20))),
    r_512_521 * f_472_low60_40_low20_0 + s_512_521 * g_472_low60_40_low20_0 = g_472_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_9 + u_512_521 * (const 64 (2**21)) + v_512_521 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_9 + r_512_521 * (const 64 (2**21)) + s_512_521 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_9,
    f_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_9,
    g_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 521)) <=s delta, delta <=s (const 64 (1 + 2*521)),
    (const 64 (-(2**20))) <=s u_512_521, u_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_521, v_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_521, r_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_521, s_512_521 <=s (const 64 ((2**20))),
    u_512_521 + v_512_521 <=s (const 64 (2**20)),
    u_512_521 - v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 + v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 - v_512_521 <=s (const 64 (2**20)),
    r_512_521 + s_512_521 <=s (const 64 (2**20)),
    r_512_521 - s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 + s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 - s_512_521 <=s (const 64 (2**20)),
    u_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_512_521 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise a
assume
g_472_low60_40_low20_9 = 0 (mod 2)
&&
g_472_low60_40_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_10 f_472_low60_40_low20_9;
mov u_512_522 u_512_521;
mov v_512_522 v_512_521;

asr g_472_low60_40_low20_10 g_472_low60_40_low20_9 1;
asr r_512_522 r_512_521 1;
asr s_512_522 s_512_521 1;
assert
    true
&&
    f_472_low60_40_low20_10 = f_472_low60_40_low20_9,
    u_512_522 = u_512_521,
    v_512_522 = v_512_521,
    g_472_low60_40_low20_10 * (const 64 2) = g_472_low60_40_low20_9,
    r_512_522 * (const 64 2) = r_512_521,
    s_512_522 * (const 64 2) = s_512_521
;

assume
    f_472_low60_40_low20_10 = f_472_low60_40_low20_9,
    u_512_522 = u_512_521,
    v_512_522 = v_512_521,
    g_472_low60_40_low20_10 * 2 = g_472_low60_40_low20_9,
    r_512_522 * 2 = r_512_521,
    s_512_522 * 2 = s_512_521
&&
    true
;

{
    u_512_522 * f_472_low60_40_low20_0 + v_512_522 * g_472_low60_40_low20_0 = f_472_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_522 * f_472_low60_40_low20_0 + s_512_522 * g_472_low60_40_low20_0 = g_472_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_10 + u_512_522 * (const 64 (2**21)) + v_512_522 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_10 + r_512_522 * (const 64 (2**21)) + s_512_522 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_10,
    f_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_10,
    g_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 522)) <=s delta, delta <=s (const 64 (1 + 2*522)),
    (const 64 (-(2**20))) <=s u_512_522, u_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_522, v_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_522, r_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_522, s_512_522 <=s (const 64 ((2**20))),
    u_512_522 + v_512_522 <=s (const 64 (2**20)),
    u_512_522 - v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 + v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 - v_512_522 <=s (const 64 (2**20)),
    r_512_522 + s_512_522 <=s (const 64 (2**20)),
    r_512_522 - s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 + s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 - s_512_522 <=s (const 64 (2**20)),
    u_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_512_522 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_521_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_9,
sint64 g_472_low60_40_low20_9,
sint64 f_472_low60_40_low20_10,
sint64 g_472_low60_40_low20_10,
sint64 u_512_521,
sint64 v_512_521,
sint64 r_512_521,
sint64 s_512_521,
sint64 u_512_522,
sint64 v_512_522,
sint64 r_512_522,
sint64 s_512_522,
bit ne
)={
    u_512_521 * f_472_low60_40_low20_0 + v_512_521 * g_472_low60_40_low20_0 = f_472_low60_40_low20_9 * (-(2**20)),
    r_512_521 * f_472_low60_40_low20_0 + s_512_521 * g_472_low60_40_low20_0 = g_472_low60_40_low20_9 * (-(2**20))
&&
    u_512_521 * f_472_low60_40_low20_0 + v_512_521 * g_472_low60_40_low20_0 = f_472_low60_40_low20_9 * (const 64 (-(2**20))),
    r_512_521 * f_472_low60_40_low20_0 + s_512_521 * g_472_low60_40_low20_0 = g_472_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_9 + u_512_521 * (const 64 (2**21)) + v_512_521 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_9 + r_512_521 * (const 64 (2**21)) + s_512_521 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_9,
    f_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_9,
    g_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 521)) <=s delta, delta <=s (const 64 (1 + 2*521)),
    (const 64 (-(2**20))) <=s u_512_521, u_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_521, v_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_521, r_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_521, s_512_521 <=s (const 64 ((2**20))),
    u_512_521 + v_512_521 <=s (const 64 (2**20)),
    u_512_521 - v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 + v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 - v_512_521 <=s (const 64 (2**20)),
    r_512_521 + s_512_521 <=s (const 64 (2**20)),
    r_512_521 - s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 + s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 - s_512_521 <=s (const 64 (2**20)),
    u_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_512_521 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise b
assume
g_472_low60_40_low20_9 = 1 (mod 2)
&&
g_472_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_10 f_472_low60_40_low20_9;
mov u_512_522 u_512_521;
mov v_512_522 v_512_521;

add g_472_low60_40_low20_10 g_472_low60_40_low20_9 f_472_low60_40_low20_9;
asr g_472_low60_40_low20_10 g_472_low60_40_low20_10 1;
add r_512_522 r_512_521 u_512_521;
asr r_512_522 r_512_522 1;
add s_512_522 s_512_521 v_512_521;
asr s_512_522 s_512_522 1;
assert
    true
&&
    f_472_low60_40_low20_10 = f_472_low60_40_low20_9,
    u_512_522 = u_512_521,
    v_512_522 = v_512_521,
    g_472_low60_40_low20_10 * (const 64 2) = g_472_low60_40_low20_9 + f_472_low60_40_low20_9,
    r_512_522 * (const 64 2) = r_512_521 + u_512_521,
    s_512_522 * (const 64 2) = s_512_521 + v_512_521
;

assume
    f_472_low60_40_low20_10 = f_472_low60_40_low20_9,
    u_512_522 = u_512_521,
    v_512_522 = v_512_521,
    g_472_low60_40_low20_10 * 2 = g_472_low60_40_low20_9 + f_472_low60_40_low20_9,
    r_512_522 * 2 = r_512_521 + u_512_521,
    s_512_522 * 2 = s_512_521 + v_512_521
&&
    true
;

{
    u_512_522 * f_472_low60_40_low20_0 + v_512_522 * g_472_low60_40_low20_0 = f_472_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_522 * f_472_low60_40_low20_0 + s_512_522 * g_472_low60_40_low20_0 = g_472_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_10 + u_512_522 * (const 64 (2**21)) + v_512_522 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_10 + r_512_522 * (const 64 (2**21)) + s_512_522 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_10,
    f_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_10,
    g_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 522)) <=s delta, delta <=s (const 64 (1 + 2*522)),
    (const 64 (-(2**20))) <=s u_512_522, u_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_522, v_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_522, r_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_522, s_512_522 <=s (const 64 ((2**20))),
    u_512_522 + v_512_522 <=s (const 64 (2**20)),
    u_512_522 - v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 + v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 - v_512_522 <=s (const 64 (2**20)),
    r_512_522 + s_512_522 <=s (const 64 (2**20)),
    r_512_522 - s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 + s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 - s_512_522 <=s (const 64 (2**20)),
    u_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_512_522 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_521_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_9,
sint64 g_472_low60_40_low20_9,
sint64 f_472_low60_40_low20_10,
sint64 g_472_low60_40_low20_10,
sint64 u_512_521,
sint64 v_512_521,
sint64 r_512_521,
sint64 s_512_521,
sint64 u_512_522,
sint64 v_512_522,
sint64 r_512_522,
sint64 s_512_522,
bit ne
)={
    u_512_521 * f_472_low60_40_low20_0 + v_512_521 * g_472_low60_40_low20_0 = f_472_low60_40_low20_9 * (-(2**20)),
    r_512_521 * f_472_low60_40_low20_0 + s_512_521 * g_472_low60_40_low20_0 = g_472_low60_40_low20_9 * (-(2**20))
&&
    u_512_521 * f_472_low60_40_low20_0 + v_512_521 * g_472_low60_40_low20_0 = f_472_low60_40_low20_9 * (const 64 (-(2**20))),
    r_512_521 * f_472_low60_40_low20_0 + s_512_521 * g_472_low60_40_low20_0 = g_472_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_9 + u_512_521 * (const 64 (2**21)) + v_512_521 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_9 + r_512_521 * (const 64 (2**21)) + s_512_521 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_9,
    f_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_9,
    g_472_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 521)) <=s delta, delta <=s (const 64 (1 + 2*521)),
    (const 64 (-(2**20))) <=s u_512_521, u_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_521, v_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_521, r_512_521 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_521, s_512_521 <=s (const 64 ((2**20))),
    u_512_521 + v_512_521 <=s (const 64 (2**20)),
    u_512_521 - v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 + v_512_521 <=s (const 64 (2**20)),
    (const 64 0) - u_512_521 - v_512_521 <=s (const 64 (2**20)),
    r_512_521 + s_512_521 <=s (const 64 (2**20)),
    r_512_521 - s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 + s_512_521 <=s (const 64 (2**20)),
    (const 64 0) - r_512_521 - s_512_521 <=s (const 64 (2**20)),
    u_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_512_521 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_512_521 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise c
assume
g_472_low60_40_low20_9 = 1 (mod 2)
&&
g_472_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_10 g_472_low60_40_low20_9;
mov u_512_522 r_512_521;
mov v_512_522 s_512_521;

subs dc g_472_low60_40_low20_10 g_472_low60_40_low20_9 f_472_low60_40_low20_9;
asr g_472_low60_40_low20_10 g_472_low60_40_low20_10 1;
subs dc r_512_522 r_512_521 u_512_521;
asr r_512_522 r_512_522 1;
subs dc s_512_522 s_512_521 v_512_521;
asr s_512_522 s_512_522 1;
assert
    true
&&
    f_472_low60_40_low20_10 = g_472_low60_40_low20_9,
    u_512_522 = r_512_521,
    v_512_522 = s_512_521,
    g_472_low60_40_low20_10 * (const 64 2) = g_472_low60_40_low20_9 - f_472_low60_40_low20_9,
    r_512_522 * (const 64 2) = r_512_521 - u_512_521,
    s_512_522 * (const 64 2) = s_512_521 - v_512_521
;

assume
    f_472_low60_40_low20_10 = g_472_low60_40_low20_9,
    u_512_522 = r_512_521,
    v_512_522 = s_512_521,
    g_472_low60_40_low20_10 * 2 = g_472_low60_40_low20_9 - f_472_low60_40_low20_9,
    r_512_522 * 2 = r_512_521 - u_512_521,
    s_512_522 * 2 = s_512_521 - v_512_521
&&
    true
;

{
    u_512_522 * f_472_low60_40_low20_0 + v_512_522 * g_472_low60_40_low20_0 = f_472_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_522 * f_472_low60_40_low20_0 + s_512_522 * g_472_low60_40_low20_0 = g_472_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_10 + u_512_522 * (const 64 (2**21)) + v_512_522 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_10 + r_512_522 * (const 64 (2**21)) + s_512_522 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_10,
    f_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_10,
    g_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 522)) <=s delta, delta <=s (const 64 (1 + 2*522)),
    (const 64 (-(2**20))) <=s u_512_522, u_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_522, v_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_522, r_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_522, s_512_522 <=s (const 64 ((2**20))),
    u_512_522 + v_512_522 <=s (const 64 (2**20)),
    u_512_522 - v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 + v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 - v_512_522 <=s (const 64 (2**20)),
    r_512_522 + s_512_522 <=s (const 64 (2**20)),
    r_512_522 - s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 + s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 - s_512_522 <=s (const 64 (2**20)),
    u_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_512_522 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_522_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_10,
sint64 g_472_low60_40_low20_10,
sint64 f_472_low60_40_low20_11,
sint64 g_472_low60_40_low20_11,
sint64 u_512_522,
sint64 v_512_522,
sint64 r_512_522,
sint64 s_512_522,
sint64 u_512_523,
sint64 v_512_523,
sint64 r_512_523,
sint64 s_512_523,
bit ne
)={
    u_512_522 * f_472_low60_40_low20_0 + v_512_522 * g_472_low60_40_low20_0 = f_472_low60_40_low20_10 * (-(2**20)),
    r_512_522 * f_472_low60_40_low20_0 + s_512_522 * g_472_low60_40_low20_0 = g_472_low60_40_low20_10 * (-(2**20))
&&
    u_512_522 * f_472_low60_40_low20_0 + v_512_522 * g_472_low60_40_low20_0 = f_472_low60_40_low20_10 * (const 64 (-(2**20))),
    r_512_522 * f_472_low60_40_low20_0 + s_512_522 * g_472_low60_40_low20_0 = g_472_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_10 + u_512_522 * (const 64 (2**21)) + v_512_522 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_10 + r_512_522 * (const 64 (2**21)) + s_512_522 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_10,
    f_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_10,
    g_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 522)) <=s delta, delta <=s (const 64 (1 + 2*522)),
    (const 64 (-(2**20))) <=s u_512_522, u_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_522, v_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_522, r_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_522, s_512_522 <=s (const 64 ((2**20))),
    u_512_522 + v_512_522 <=s (const 64 (2**20)),
    u_512_522 - v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 + v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 - v_512_522 <=s (const 64 (2**20)),
    r_512_522 + s_512_522 <=s (const 64 (2**20)),
    r_512_522 - s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 + s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 - s_512_522 <=s (const 64 (2**20)),
    u_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_512_522 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise a
assume
g_472_low60_40_low20_10 = 0 (mod 2)
&&
g_472_low60_40_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_11 f_472_low60_40_low20_10;
mov u_512_523 u_512_522;
mov v_512_523 v_512_522;

asr g_472_low60_40_low20_11 g_472_low60_40_low20_10 1;
asr r_512_523 r_512_522 1;
asr s_512_523 s_512_522 1;
assert
    true
&&
    f_472_low60_40_low20_11 = f_472_low60_40_low20_10,
    u_512_523 = u_512_522,
    v_512_523 = v_512_522,
    g_472_low60_40_low20_11 * (const 64 2) = g_472_low60_40_low20_10,
    r_512_523 * (const 64 2) = r_512_522,
    s_512_523 * (const 64 2) = s_512_522
;

assume
    f_472_low60_40_low20_11 = f_472_low60_40_low20_10,
    u_512_523 = u_512_522,
    v_512_523 = v_512_522,
    g_472_low60_40_low20_11 * 2 = g_472_low60_40_low20_10,
    r_512_523 * 2 = r_512_522,
    s_512_523 * 2 = s_512_522
&&
    true
;

{
    u_512_523 * f_472_low60_40_low20_0 + v_512_523 * g_472_low60_40_low20_0 = f_472_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_523 * f_472_low60_40_low20_0 + s_512_523 * g_472_low60_40_low20_0 = g_472_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_11 + u_512_523 * (const 64 (2**21)) + v_512_523 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_11 + r_512_523 * (const 64 (2**21)) + s_512_523 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_11,
    f_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_11,
    g_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 523)) <=s delta, delta <=s (const 64 (1 + 2*523)),
    (const 64 (-(2**20))) <=s u_512_523, u_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_523, v_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_523, r_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_523, s_512_523 <=s (const 64 ((2**20))),
    u_512_523 + v_512_523 <=s (const 64 (2**20)),
    u_512_523 - v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 + v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 - v_512_523 <=s (const 64 (2**20)),
    r_512_523 + s_512_523 <=s (const 64 (2**20)),
    r_512_523 - s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 + s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 - s_512_523 <=s (const 64 (2**20)),
    u_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_512_523 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_522_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_10,
sint64 g_472_low60_40_low20_10,
sint64 f_472_low60_40_low20_11,
sint64 g_472_low60_40_low20_11,
sint64 u_512_522,
sint64 v_512_522,
sint64 r_512_522,
sint64 s_512_522,
sint64 u_512_523,
sint64 v_512_523,
sint64 r_512_523,
sint64 s_512_523,
bit ne
)={
    u_512_522 * f_472_low60_40_low20_0 + v_512_522 * g_472_low60_40_low20_0 = f_472_low60_40_low20_10 * (-(2**20)),
    r_512_522 * f_472_low60_40_low20_0 + s_512_522 * g_472_low60_40_low20_0 = g_472_low60_40_low20_10 * (-(2**20))
&&
    u_512_522 * f_472_low60_40_low20_0 + v_512_522 * g_472_low60_40_low20_0 = f_472_low60_40_low20_10 * (const 64 (-(2**20))),
    r_512_522 * f_472_low60_40_low20_0 + s_512_522 * g_472_low60_40_low20_0 = g_472_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_10 + u_512_522 * (const 64 (2**21)) + v_512_522 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_10 + r_512_522 * (const 64 (2**21)) + s_512_522 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_10,
    f_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_10,
    g_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 522)) <=s delta, delta <=s (const 64 (1 + 2*522)),
    (const 64 (-(2**20))) <=s u_512_522, u_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_522, v_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_522, r_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_522, s_512_522 <=s (const 64 ((2**20))),
    u_512_522 + v_512_522 <=s (const 64 (2**20)),
    u_512_522 - v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 + v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 - v_512_522 <=s (const 64 (2**20)),
    r_512_522 + s_512_522 <=s (const 64 (2**20)),
    r_512_522 - s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 + s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 - s_512_522 <=s (const 64 (2**20)),
    u_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_512_522 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise b
assume
g_472_low60_40_low20_10 = 1 (mod 2)
&&
g_472_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_11 f_472_low60_40_low20_10;
mov u_512_523 u_512_522;
mov v_512_523 v_512_522;

add g_472_low60_40_low20_11 g_472_low60_40_low20_10 f_472_low60_40_low20_10;
asr g_472_low60_40_low20_11 g_472_low60_40_low20_11 1;
add r_512_523 r_512_522 u_512_522;
asr r_512_523 r_512_523 1;
add s_512_523 s_512_522 v_512_522;
asr s_512_523 s_512_523 1;
assert
    true
&&
    f_472_low60_40_low20_11 = f_472_low60_40_low20_10,
    u_512_523 = u_512_522,
    v_512_523 = v_512_522,
    g_472_low60_40_low20_11 * (const 64 2) = g_472_low60_40_low20_10 + f_472_low60_40_low20_10,
    r_512_523 * (const 64 2) = r_512_522 + u_512_522,
    s_512_523 * (const 64 2) = s_512_522 + v_512_522
;

assume
    f_472_low60_40_low20_11 = f_472_low60_40_low20_10,
    u_512_523 = u_512_522,
    v_512_523 = v_512_522,
    g_472_low60_40_low20_11 * 2 = g_472_low60_40_low20_10 + f_472_low60_40_low20_10,
    r_512_523 * 2 = r_512_522 + u_512_522,
    s_512_523 * 2 = s_512_522 + v_512_522
&&
    true
;

{
    u_512_523 * f_472_low60_40_low20_0 + v_512_523 * g_472_low60_40_low20_0 = f_472_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_523 * f_472_low60_40_low20_0 + s_512_523 * g_472_low60_40_low20_0 = g_472_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_11 + u_512_523 * (const 64 (2**21)) + v_512_523 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_11 + r_512_523 * (const 64 (2**21)) + s_512_523 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_11,
    f_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_11,
    g_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 523)) <=s delta, delta <=s (const 64 (1 + 2*523)),
    (const 64 (-(2**20))) <=s u_512_523, u_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_523, v_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_523, r_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_523, s_512_523 <=s (const 64 ((2**20))),
    u_512_523 + v_512_523 <=s (const 64 (2**20)),
    u_512_523 - v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 + v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 - v_512_523 <=s (const 64 (2**20)),
    r_512_523 + s_512_523 <=s (const 64 (2**20)),
    r_512_523 - s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 + s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 - s_512_523 <=s (const 64 (2**20)),
    u_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_512_523 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_522_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_10,
sint64 g_472_low60_40_low20_10,
sint64 f_472_low60_40_low20_11,
sint64 g_472_low60_40_low20_11,
sint64 u_512_522,
sint64 v_512_522,
sint64 r_512_522,
sint64 s_512_522,
sint64 u_512_523,
sint64 v_512_523,
sint64 r_512_523,
sint64 s_512_523,
bit ne
)={
    u_512_522 * f_472_low60_40_low20_0 + v_512_522 * g_472_low60_40_low20_0 = f_472_low60_40_low20_10 * (-(2**20)),
    r_512_522 * f_472_low60_40_low20_0 + s_512_522 * g_472_low60_40_low20_0 = g_472_low60_40_low20_10 * (-(2**20))
&&
    u_512_522 * f_472_low60_40_low20_0 + v_512_522 * g_472_low60_40_low20_0 = f_472_low60_40_low20_10 * (const 64 (-(2**20))),
    r_512_522 * f_472_low60_40_low20_0 + s_512_522 * g_472_low60_40_low20_0 = g_472_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_10 + u_512_522 * (const 64 (2**21)) + v_512_522 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_10 + r_512_522 * (const 64 (2**21)) + s_512_522 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_10,
    f_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_10,
    g_472_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 522)) <=s delta, delta <=s (const 64 (1 + 2*522)),
    (const 64 (-(2**20))) <=s u_512_522, u_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_522, v_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_522, r_512_522 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_522, s_512_522 <=s (const 64 ((2**20))),
    u_512_522 + v_512_522 <=s (const 64 (2**20)),
    u_512_522 - v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 + v_512_522 <=s (const 64 (2**20)),
    (const 64 0) - u_512_522 - v_512_522 <=s (const 64 (2**20)),
    r_512_522 + s_512_522 <=s (const 64 (2**20)),
    r_512_522 - s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 + s_512_522 <=s (const 64 (2**20)),
    (const 64 0) - r_512_522 - s_512_522 <=s (const 64 (2**20)),
    u_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_512_522 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_512_522 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise c
assume
g_472_low60_40_low20_10 = 1 (mod 2)
&&
g_472_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_11 g_472_low60_40_low20_10;
mov u_512_523 r_512_522;
mov v_512_523 s_512_522;

subs dc g_472_low60_40_low20_11 g_472_low60_40_low20_10 f_472_low60_40_low20_10;
asr g_472_low60_40_low20_11 g_472_low60_40_low20_11 1;
subs dc r_512_523 r_512_522 u_512_522;
asr r_512_523 r_512_523 1;
subs dc s_512_523 s_512_522 v_512_522;
asr s_512_523 s_512_523 1;
assert
    true
&&
    f_472_low60_40_low20_11 = g_472_low60_40_low20_10,
    u_512_523 = r_512_522,
    v_512_523 = s_512_522,
    g_472_low60_40_low20_11 * (const 64 2) = g_472_low60_40_low20_10 - f_472_low60_40_low20_10,
    r_512_523 * (const 64 2) = r_512_522 - u_512_522,
    s_512_523 * (const 64 2) = s_512_522 - v_512_522
;

assume
    f_472_low60_40_low20_11 = g_472_low60_40_low20_10,
    u_512_523 = r_512_522,
    v_512_523 = s_512_522,
    g_472_low60_40_low20_11 * 2 = g_472_low60_40_low20_10 - f_472_low60_40_low20_10,
    r_512_523 * 2 = r_512_522 - u_512_522,
    s_512_523 * 2 = s_512_522 - v_512_522
&&
    true
;

{
    u_512_523 * f_472_low60_40_low20_0 + v_512_523 * g_472_low60_40_low20_0 = f_472_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_523 * f_472_low60_40_low20_0 + s_512_523 * g_472_low60_40_low20_0 = g_472_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_11 + u_512_523 * (const 64 (2**21)) + v_512_523 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_11 + r_512_523 * (const 64 (2**21)) + s_512_523 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_11,
    f_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_11,
    g_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 523)) <=s delta, delta <=s (const 64 (1 + 2*523)),
    (const 64 (-(2**20))) <=s u_512_523, u_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_523, v_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_523, r_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_523, s_512_523 <=s (const 64 ((2**20))),
    u_512_523 + v_512_523 <=s (const 64 (2**20)),
    u_512_523 - v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 + v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 - v_512_523 <=s (const 64 (2**20)),
    r_512_523 + s_512_523 <=s (const 64 (2**20)),
    r_512_523 - s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 + s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 - s_512_523 <=s (const 64 (2**20)),
    u_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_512_523 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_523_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_11,
sint64 g_472_low60_40_low20_11,
sint64 f_472_low60_40_low20_12,
sint64 g_472_low60_40_low20_12,
sint64 u_512_523,
sint64 v_512_523,
sint64 r_512_523,
sint64 s_512_523,
sint64 u_512_524,
sint64 v_512_524,
sint64 r_512_524,
sint64 s_512_524,
bit ne
)={
    u_512_523 * f_472_low60_40_low20_0 + v_512_523 * g_472_low60_40_low20_0 = f_472_low60_40_low20_11 * (-(2**20)),
    r_512_523 * f_472_low60_40_low20_0 + s_512_523 * g_472_low60_40_low20_0 = g_472_low60_40_low20_11 * (-(2**20))
&&
    u_512_523 * f_472_low60_40_low20_0 + v_512_523 * g_472_low60_40_low20_0 = f_472_low60_40_low20_11 * (const 64 (-(2**20))),
    r_512_523 * f_472_low60_40_low20_0 + s_512_523 * g_472_low60_40_low20_0 = g_472_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_11 + u_512_523 * (const 64 (2**21)) + v_512_523 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_11 + r_512_523 * (const 64 (2**21)) + s_512_523 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_11,
    f_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_11,
    g_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 523)) <=s delta, delta <=s (const 64 (1 + 2*523)),
    (const 64 (-(2**20))) <=s u_512_523, u_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_523, v_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_523, r_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_523, s_512_523 <=s (const 64 ((2**20))),
    u_512_523 + v_512_523 <=s (const 64 (2**20)),
    u_512_523 - v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 + v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 - v_512_523 <=s (const 64 (2**20)),
    r_512_523 + s_512_523 <=s (const 64 (2**20)),
    r_512_523 - s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 + s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 - s_512_523 <=s (const 64 (2**20)),
    u_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_512_523 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise a
assume
g_472_low60_40_low20_11 = 0 (mod 2)
&&
g_472_low60_40_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_12 f_472_low60_40_low20_11;
mov u_512_524 u_512_523;
mov v_512_524 v_512_523;

asr g_472_low60_40_low20_12 g_472_low60_40_low20_11 1;
asr r_512_524 r_512_523 1;
asr s_512_524 s_512_523 1;
assert
    true
&&
    f_472_low60_40_low20_12 = f_472_low60_40_low20_11,
    u_512_524 = u_512_523,
    v_512_524 = v_512_523,
    g_472_low60_40_low20_12 * (const 64 2) = g_472_low60_40_low20_11,
    r_512_524 * (const 64 2) = r_512_523,
    s_512_524 * (const 64 2) = s_512_523
;

assume
    f_472_low60_40_low20_12 = f_472_low60_40_low20_11,
    u_512_524 = u_512_523,
    v_512_524 = v_512_523,
    g_472_low60_40_low20_12 * 2 = g_472_low60_40_low20_11,
    r_512_524 * 2 = r_512_523,
    s_512_524 * 2 = s_512_523
&&
    true
;

{
    u_512_524 * f_472_low60_40_low20_0 + v_512_524 * g_472_low60_40_low20_0 = f_472_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_524 * f_472_low60_40_low20_0 + s_512_524 * g_472_low60_40_low20_0 = g_472_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_12 + u_512_524 * (const 64 (2**21)) + v_512_524 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_12 + r_512_524 * (const 64 (2**21)) + s_512_524 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_12,
    f_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_12,
    g_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 524)) <=s delta, delta <=s (const 64 (1 + 2*524)),
    (const 64 (-(2**20))) <=s u_512_524, u_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_524, v_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_524, r_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_524, s_512_524 <=s (const 64 ((2**20))),
    u_512_524 + v_512_524 <=s (const 64 (2**20)),
    u_512_524 - v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 + v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 - v_512_524 <=s (const 64 (2**20)),
    r_512_524 + s_512_524 <=s (const 64 (2**20)),
    r_512_524 - s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 + s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 - s_512_524 <=s (const 64 (2**20)),
    u_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_512_524 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_523_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_11,
sint64 g_472_low60_40_low20_11,
sint64 f_472_low60_40_low20_12,
sint64 g_472_low60_40_low20_12,
sint64 u_512_523,
sint64 v_512_523,
sint64 r_512_523,
sint64 s_512_523,
sint64 u_512_524,
sint64 v_512_524,
sint64 r_512_524,
sint64 s_512_524,
bit ne
)={
    u_512_523 * f_472_low60_40_low20_0 + v_512_523 * g_472_low60_40_low20_0 = f_472_low60_40_low20_11 * (-(2**20)),
    r_512_523 * f_472_low60_40_low20_0 + s_512_523 * g_472_low60_40_low20_0 = g_472_low60_40_low20_11 * (-(2**20))
&&
    u_512_523 * f_472_low60_40_low20_0 + v_512_523 * g_472_low60_40_low20_0 = f_472_low60_40_low20_11 * (const 64 (-(2**20))),
    r_512_523 * f_472_low60_40_low20_0 + s_512_523 * g_472_low60_40_low20_0 = g_472_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_11 + u_512_523 * (const 64 (2**21)) + v_512_523 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_11 + r_512_523 * (const 64 (2**21)) + s_512_523 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_11,
    f_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_11,
    g_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 523)) <=s delta, delta <=s (const 64 (1 + 2*523)),
    (const 64 (-(2**20))) <=s u_512_523, u_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_523, v_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_523, r_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_523, s_512_523 <=s (const 64 ((2**20))),
    u_512_523 + v_512_523 <=s (const 64 (2**20)),
    u_512_523 - v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 + v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 - v_512_523 <=s (const 64 (2**20)),
    r_512_523 + s_512_523 <=s (const 64 (2**20)),
    r_512_523 - s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 + s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 - s_512_523 <=s (const 64 (2**20)),
    u_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_512_523 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise b
assume
g_472_low60_40_low20_11 = 1 (mod 2)
&&
g_472_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_12 f_472_low60_40_low20_11;
mov u_512_524 u_512_523;
mov v_512_524 v_512_523;

add g_472_low60_40_low20_12 g_472_low60_40_low20_11 f_472_low60_40_low20_11;
asr g_472_low60_40_low20_12 g_472_low60_40_low20_12 1;
add r_512_524 r_512_523 u_512_523;
asr r_512_524 r_512_524 1;
add s_512_524 s_512_523 v_512_523;
asr s_512_524 s_512_524 1;
assert
    true
&&
    f_472_low60_40_low20_12 = f_472_low60_40_low20_11,
    u_512_524 = u_512_523,
    v_512_524 = v_512_523,
    g_472_low60_40_low20_12 * (const 64 2) = g_472_low60_40_low20_11 + f_472_low60_40_low20_11,
    r_512_524 * (const 64 2) = r_512_523 + u_512_523,
    s_512_524 * (const 64 2) = s_512_523 + v_512_523
;

assume
    f_472_low60_40_low20_12 = f_472_low60_40_low20_11,
    u_512_524 = u_512_523,
    v_512_524 = v_512_523,
    g_472_low60_40_low20_12 * 2 = g_472_low60_40_low20_11 + f_472_low60_40_low20_11,
    r_512_524 * 2 = r_512_523 + u_512_523,
    s_512_524 * 2 = s_512_523 + v_512_523
&&
    true
;

{
    u_512_524 * f_472_low60_40_low20_0 + v_512_524 * g_472_low60_40_low20_0 = f_472_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_524 * f_472_low60_40_low20_0 + s_512_524 * g_472_low60_40_low20_0 = g_472_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_12 + u_512_524 * (const 64 (2**21)) + v_512_524 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_12 + r_512_524 * (const 64 (2**21)) + s_512_524 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_12,
    f_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_12,
    g_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 524)) <=s delta, delta <=s (const 64 (1 + 2*524)),
    (const 64 (-(2**20))) <=s u_512_524, u_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_524, v_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_524, r_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_524, s_512_524 <=s (const 64 ((2**20))),
    u_512_524 + v_512_524 <=s (const 64 (2**20)),
    u_512_524 - v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 + v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 - v_512_524 <=s (const 64 (2**20)),
    r_512_524 + s_512_524 <=s (const 64 (2**20)),
    r_512_524 - s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 + s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 - s_512_524 <=s (const 64 (2**20)),
    u_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_512_524 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_523_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_11,
sint64 g_472_low60_40_low20_11,
sint64 f_472_low60_40_low20_12,
sint64 g_472_low60_40_low20_12,
sint64 u_512_523,
sint64 v_512_523,
sint64 r_512_523,
sint64 s_512_523,
sint64 u_512_524,
sint64 v_512_524,
sint64 r_512_524,
sint64 s_512_524,
bit ne
)={
    u_512_523 * f_472_low60_40_low20_0 + v_512_523 * g_472_low60_40_low20_0 = f_472_low60_40_low20_11 * (-(2**20)),
    r_512_523 * f_472_low60_40_low20_0 + s_512_523 * g_472_low60_40_low20_0 = g_472_low60_40_low20_11 * (-(2**20))
&&
    u_512_523 * f_472_low60_40_low20_0 + v_512_523 * g_472_low60_40_low20_0 = f_472_low60_40_low20_11 * (const 64 (-(2**20))),
    r_512_523 * f_472_low60_40_low20_0 + s_512_523 * g_472_low60_40_low20_0 = g_472_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_11 + u_512_523 * (const 64 (2**21)) + v_512_523 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_11 + r_512_523 * (const 64 (2**21)) + s_512_523 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_11,
    f_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_11,
    g_472_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 523)) <=s delta, delta <=s (const 64 (1 + 2*523)),
    (const 64 (-(2**20))) <=s u_512_523, u_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_523, v_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_523, r_512_523 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_523, s_512_523 <=s (const 64 ((2**20))),
    u_512_523 + v_512_523 <=s (const 64 (2**20)),
    u_512_523 - v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 + v_512_523 <=s (const 64 (2**20)),
    (const 64 0) - u_512_523 - v_512_523 <=s (const 64 (2**20)),
    r_512_523 + s_512_523 <=s (const 64 (2**20)),
    r_512_523 - s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 + s_512_523 <=s (const 64 (2**20)),
    (const 64 0) - r_512_523 - s_512_523 <=s (const 64 (2**20)),
    u_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_512_523 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_512_523 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise c
assume
g_472_low60_40_low20_11 = 1 (mod 2)
&&
g_472_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_12 g_472_low60_40_low20_11;
mov u_512_524 r_512_523;
mov v_512_524 s_512_523;

subs dc g_472_low60_40_low20_12 g_472_low60_40_low20_11 f_472_low60_40_low20_11;
asr g_472_low60_40_low20_12 g_472_low60_40_low20_12 1;
subs dc r_512_524 r_512_523 u_512_523;
asr r_512_524 r_512_524 1;
subs dc s_512_524 s_512_523 v_512_523;
asr s_512_524 s_512_524 1;
assert
    true
&&
    f_472_low60_40_low20_12 = g_472_low60_40_low20_11,
    u_512_524 = r_512_523,
    v_512_524 = s_512_523,
    g_472_low60_40_low20_12 * (const 64 2) = g_472_low60_40_low20_11 - f_472_low60_40_low20_11,
    r_512_524 * (const 64 2) = r_512_523 - u_512_523,
    s_512_524 * (const 64 2) = s_512_523 - v_512_523
;

assume
    f_472_low60_40_low20_12 = g_472_low60_40_low20_11,
    u_512_524 = r_512_523,
    v_512_524 = s_512_523,
    g_472_low60_40_low20_12 * 2 = g_472_low60_40_low20_11 - f_472_low60_40_low20_11,
    r_512_524 * 2 = r_512_523 - u_512_523,
    s_512_524 * 2 = s_512_523 - v_512_523
&&
    true
;

{
    u_512_524 * f_472_low60_40_low20_0 + v_512_524 * g_472_low60_40_low20_0 = f_472_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_524 * f_472_low60_40_low20_0 + s_512_524 * g_472_low60_40_low20_0 = g_472_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_12 + u_512_524 * (const 64 (2**21)) + v_512_524 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_12 + r_512_524 * (const 64 (2**21)) + s_512_524 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_12,
    f_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_12,
    g_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 524)) <=s delta, delta <=s (const 64 (1 + 2*524)),
    (const 64 (-(2**20))) <=s u_512_524, u_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_524, v_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_524, r_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_524, s_512_524 <=s (const 64 ((2**20))),
    u_512_524 + v_512_524 <=s (const 64 (2**20)),
    u_512_524 - v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 + v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 - v_512_524 <=s (const 64 (2**20)),
    r_512_524 + s_512_524 <=s (const 64 (2**20)),
    r_512_524 - s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 + s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 - s_512_524 <=s (const 64 (2**20)),
    u_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_512_524 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_524_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_12,
sint64 g_472_low60_40_low20_12,
sint64 f_472_low60_40_low20_13,
sint64 g_472_low60_40_low20_13,
sint64 u_512_524,
sint64 v_512_524,
sint64 r_512_524,
sint64 s_512_524,
sint64 u_512_525,
sint64 v_512_525,
sint64 r_512_525,
sint64 s_512_525,
bit ne
)={
    u_512_524 * f_472_low60_40_low20_0 + v_512_524 * g_472_low60_40_low20_0 = f_472_low60_40_low20_12 * (-(2**20)),
    r_512_524 * f_472_low60_40_low20_0 + s_512_524 * g_472_low60_40_low20_0 = g_472_low60_40_low20_12 * (-(2**20))
&&
    u_512_524 * f_472_low60_40_low20_0 + v_512_524 * g_472_low60_40_low20_0 = f_472_low60_40_low20_12 * (const 64 (-(2**20))),
    r_512_524 * f_472_low60_40_low20_0 + s_512_524 * g_472_low60_40_low20_0 = g_472_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_12 + u_512_524 * (const 64 (2**21)) + v_512_524 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_12 + r_512_524 * (const 64 (2**21)) + s_512_524 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_12,
    f_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_12,
    g_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 524)) <=s delta, delta <=s (const 64 (1 + 2*524)),
    (const 64 (-(2**20))) <=s u_512_524, u_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_524, v_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_524, r_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_524, s_512_524 <=s (const 64 ((2**20))),
    u_512_524 + v_512_524 <=s (const 64 (2**20)),
    u_512_524 - v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 + v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 - v_512_524 <=s (const 64 (2**20)),
    r_512_524 + s_512_524 <=s (const 64 (2**20)),
    r_512_524 - s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 + s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 - s_512_524 <=s (const 64 (2**20)),
    u_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_512_524 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise a
assume
g_472_low60_40_low20_12 = 0 (mod 2)
&&
g_472_low60_40_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_13 f_472_low60_40_low20_12;
mov u_512_525 u_512_524;
mov v_512_525 v_512_524;

asr g_472_low60_40_low20_13 g_472_low60_40_low20_12 1;
asr r_512_525 r_512_524 1;
asr s_512_525 s_512_524 1;
assert
    true
&&
    f_472_low60_40_low20_13 = f_472_low60_40_low20_12,
    u_512_525 = u_512_524,
    v_512_525 = v_512_524,
    g_472_low60_40_low20_13 * (const 64 2) = g_472_low60_40_low20_12,
    r_512_525 * (const 64 2) = r_512_524,
    s_512_525 * (const 64 2) = s_512_524
;

assume
    f_472_low60_40_low20_13 = f_472_low60_40_low20_12,
    u_512_525 = u_512_524,
    v_512_525 = v_512_524,
    g_472_low60_40_low20_13 * 2 = g_472_low60_40_low20_12,
    r_512_525 * 2 = r_512_524,
    s_512_525 * 2 = s_512_524
&&
    true
;

{
    u_512_525 * f_472_low60_40_low20_0 + v_512_525 * g_472_low60_40_low20_0 = f_472_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_525 * f_472_low60_40_low20_0 + s_512_525 * g_472_low60_40_low20_0 = g_472_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_13 + u_512_525 * (const 64 (2**21)) + v_512_525 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_13 + r_512_525 * (const 64 (2**21)) + s_512_525 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_13,
    f_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_13,
    g_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 525)) <=s delta, delta <=s (const 64 (1 + 2*525)),
    (const 64 (-(2**20))) <=s u_512_525, u_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_525, v_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_525, r_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_525, s_512_525 <=s (const 64 ((2**20))),
    u_512_525 + v_512_525 <=s (const 64 (2**20)),
    u_512_525 - v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 + v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 - v_512_525 <=s (const 64 (2**20)),
    r_512_525 + s_512_525 <=s (const 64 (2**20)),
    r_512_525 - s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 + s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 - s_512_525 <=s (const 64 (2**20)),
    u_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_512_525 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_524_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_12,
sint64 g_472_low60_40_low20_12,
sint64 f_472_low60_40_low20_13,
sint64 g_472_low60_40_low20_13,
sint64 u_512_524,
sint64 v_512_524,
sint64 r_512_524,
sint64 s_512_524,
sint64 u_512_525,
sint64 v_512_525,
sint64 r_512_525,
sint64 s_512_525,
bit ne
)={
    u_512_524 * f_472_low60_40_low20_0 + v_512_524 * g_472_low60_40_low20_0 = f_472_low60_40_low20_12 * (-(2**20)),
    r_512_524 * f_472_low60_40_low20_0 + s_512_524 * g_472_low60_40_low20_0 = g_472_low60_40_low20_12 * (-(2**20))
&&
    u_512_524 * f_472_low60_40_low20_0 + v_512_524 * g_472_low60_40_low20_0 = f_472_low60_40_low20_12 * (const 64 (-(2**20))),
    r_512_524 * f_472_low60_40_low20_0 + s_512_524 * g_472_low60_40_low20_0 = g_472_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_12 + u_512_524 * (const 64 (2**21)) + v_512_524 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_12 + r_512_524 * (const 64 (2**21)) + s_512_524 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_12,
    f_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_12,
    g_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 524)) <=s delta, delta <=s (const 64 (1 + 2*524)),
    (const 64 (-(2**20))) <=s u_512_524, u_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_524, v_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_524, r_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_524, s_512_524 <=s (const 64 ((2**20))),
    u_512_524 + v_512_524 <=s (const 64 (2**20)),
    u_512_524 - v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 + v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 - v_512_524 <=s (const 64 (2**20)),
    r_512_524 + s_512_524 <=s (const 64 (2**20)),
    r_512_524 - s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 + s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 - s_512_524 <=s (const 64 (2**20)),
    u_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_512_524 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise b
assume
g_472_low60_40_low20_12 = 1 (mod 2)
&&
g_472_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_13 f_472_low60_40_low20_12;
mov u_512_525 u_512_524;
mov v_512_525 v_512_524;

add g_472_low60_40_low20_13 g_472_low60_40_low20_12 f_472_low60_40_low20_12;
asr g_472_low60_40_low20_13 g_472_low60_40_low20_13 1;
add r_512_525 r_512_524 u_512_524;
asr r_512_525 r_512_525 1;
add s_512_525 s_512_524 v_512_524;
asr s_512_525 s_512_525 1;
assert
    true
&&
    f_472_low60_40_low20_13 = f_472_low60_40_low20_12,
    u_512_525 = u_512_524,
    v_512_525 = v_512_524,
    g_472_low60_40_low20_13 * (const 64 2) = g_472_low60_40_low20_12 + f_472_low60_40_low20_12,
    r_512_525 * (const 64 2) = r_512_524 + u_512_524,
    s_512_525 * (const 64 2) = s_512_524 + v_512_524
;

assume
    f_472_low60_40_low20_13 = f_472_low60_40_low20_12,
    u_512_525 = u_512_524,
    v_512_525 = v_512_524,
    g_472_low60_40_low20_13 * 2 = g_472_low60_40_low20_12 + f_472_low60_40_low20_12,
    r_512_525 * 2 = r_512_524 + u_512_524,
    s_512_525 * 2 = s_512_524 + v_512_524
&&
    true
;

{
    u_512_525 * f_472_low60_40_low20_0 + v_512_525 * g_472_low60_40_low20_0 = f_472_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_525 * f_472_low60_40_low20_0 + s_512_525 * g_472_low60_40_low20_0 = g_472_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_13 + u_512_525 * (const 64 (2**21)) + v_512_525 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_13 + r_512_525 * (const 64 (2**21)) + s_512_525 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_13,
    f_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_13,
    g_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 525)) <=s delta, delta <=s (const 64 (1 + 2*525)),
    (const 64 (-(2**20))) <=s u_512_525, u_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_525, v_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_525, r_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_525, s_512_525 <=s (const 64 ((2**20))),
    u_512_525 + v_512_525 <=s (const 64 (2**20)),
    u_512_525 - v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 + v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 - v_512_525 <=s (const 64 (2**20)),
    r_512_525 + s_512_525 <=s (const 64 (2**20)),
    r_512_525 - s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 + s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 - s_512_525 <=s (const 64 (2**20)),
    u_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_512_525 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_524_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_12,
sint64 g_472_low60_40_low20_12,
sint64 f_472_low60_40_low20_13,
sint64 g_472_low60_40_low20_13,
sint64 u_512_524,
sint64 v_512_524,
sint64 r_512_524,
sint64 s_512_524,
sint64 u_512_525,
sint64 v_512_525,
sint64 r_512_525,
sint64 s_512_525,
bit ne
)={
    u_512_524 * f_472_low60_40_low20_0 + v_512_524 * g_472_low60_40_low20_0 = f_472_low60_40_low20_12 * (-(2**20)),
    r_512_524 * f_472_low60_40_low20_0 + s_512_524 * g_472_low60_40_low20_0 = g_472_low60_40_low20_12 * (-(2**20))
&&
    u_512_524 * f_472_low60_40_low20_0 + v_512_524 * g_472_low60_40_low20_0 = f_472_low60_40_low20_12 * (const 64 (-(2**20))),
    r_512_524 * f_472_low60_40_low20_0 + s_512_524 * g_472_low60_40_low20_0 = g_472_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_12 + u_512_524 * (const 64 (2**21)) + v_512_524 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_12 + r_512_524 * (const 64 (2**21)) + s_512_524 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_12,
    f_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_12,
    g_472_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 524)) <=s delta, delta <=s (const 64 (1 + 2*524)),
    (const 64 (-(2**20))) <=s u_512_524, u_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_524, v_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_524, r_512_524 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_524, s_512_524 <=s (const 64 ((2**20))),
    u_512_524 + v_512_524 <=s (const 64 (2**20)),
    u_512_524 - v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 + v_512_524 <=s (const 64 (2**20)),
    (const 64 0) - u_512_524 - v_512_524 <=s (const 64 (2**20)),
    r_512_524 + s_512_524 <=s (const 64 (2**20)),
    r_512_524 - s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 + s_512_524 <=s (const 64 (2**20)),
    (const 64 0) - r_512_524 - s_512_524 <=s (const 64 (2**20)),
    u_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_512_524 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_512_524 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise c
assume
g_472_low60_40_low20_12 = 1 (mod 2)
&&
g_472_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_13 g_472_low60_40_low20_12;
mov u_512_525 r_512_524;
mov v_512_525 s_512_524;

subs dc g_472_low60_40_low20_13 g_472_low60_40_low20_12 f_472_low60_40_low20_12;
asr g_472_low60_40_low20_13 g_472_low60_40_low20_13 1;
subs dc r_512_525 r_512_524 u_512_524;
asr r_512_525 r_512_525 1;
subs dc s_512_525 s_512_524 v_512_524;
asr s_512_525 s_512_525 1;
assert
    true
&&
    f_472_low60_40_low20_13 = g_472_low60_40_low20_12,
    u_512_525 = r_512_524,
    v_512_525 = s_512_524,
    g_472_low60_40_low20_13 * (const 64 2) = g_472_low60_40_low20_12 - f_472_low60_40_low20_12,
    r_512_525 * (const 64 2) = r_512_524 - u_512_524,
    s_512_525 * (const 64 2) = s_512_524 - v_512_524
;

assume
    f_472_low60_40_low20_13 = g_472_low60_40_low20_12,
    u_512_525 = r_512_524,
    v_512_525 = s_512_524,
    g_472_low60_40_low20_13 * 2 = g_472_low60_40_low20_12 - f_472_low60_40_low20_12,
    r_512_525 * 2 = r_512_524 - u_512_524,
    s_512_525 * 2 = s_512_524 - v_512_524
&&
    true
;

{
    u_512_525 * f_472_low60_40_low20_0 + v_512_525 * g_472_low60_40_low20_0 = f_472_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_525 * f_472_low60_40_low20_0 + s_512_525 * g_472_low60_40_low20_0 = g_472_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_13 + u_512_525 * (const 64 (2**21)) + v_512_525 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_13 + r_512_525 * (const 64 (2**21)) + s_512_525 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_13,
    f_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_13,
    g_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 525)) <=s delta, delta <=s (const 64 (1 + 2*525)),
    (const 64 (-(2**20))) <=s u_512_525, u_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_525, v_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_525, r_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_525, s_512_525 <=s (const 64 ((2**20))),
    u_512_525 + v_512_525 <=s (const 64 (2**20)),
    u_512_525 - v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 + v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 - v_512_525 <=s (const 64 (2**20)),
    r_512_525 + s_512_525 <=s (const 64 (2**20)),
    r_512_525 - s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 + s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 - s_512_525 <=s (const 64 (2**20)),
    u_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_512_525 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_525_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_13,
sint64 g_472_low60_40_low20_13,
sint64 f_472_low60_40_low20_14,
sint64 g_472_low60_40_low20_14,
sint64 u_512_525,
sint64 v_512_525,
sint64 r_512_525,
sint64 s_512_525,
sint64 u_512_526,
sint64 v_512_526,
sint64 r_512_526,
sint64 s_512_526,
bit ne
)={
    u_512_525 * f_472_low60_40_low20_0 + v_512_525 * g_472_low60_40_low20_0 = f_472_low60_40_low20_13 * (-(2**20)),
    r_512_525 * f_472_low60_40_low20_0 + s_512_525 * g_472_low60_40_low20_0 = g_472_low60_40_low20_13 * (-(2**20))
&&
    u_512_525 * f_472_low60_40_low20_0 + v_512_525 * g_472_low60_40_low20_0 = f_472_low60_40_low20_13 * (const 64 (-(2**20))),
    r_512_525 * f_472_low60_40_low20_0 + s_512_525 * g_472_low60_40_low20_0 = g_472_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_13 + u_512_525 * (const 64 (2**21)) + v_512_525 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_13 + r_512_525 * (const 64 (2**21)) + s_512_525 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_13,
    f_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_13,
    g_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 525)) <=s delta, delta <=s (const 64 (1 + 2*525)),
    (const 64 (-(2**20))) <=s u_512_525, u_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_525, v_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_525, r_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_525, s_512_525 <=s (const 64 ((2**20))),
    u_512_525 + v_512_525 <=s (const 64 (2**20)),
    u_512_525 - v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 + v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 - v_512_525 <=s (const 64 (2**20)),
    r_512_525 + s_512_525 <=s (const 64 (2**20)),
    r_512_525 - s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 + s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 - s_512_525 <=s (const 64 (2**20)),
    u_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_512_525 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise a
assume
g_472_low60_40_low20_13 = 0 (mod 2)
&&
g_472_low60_40_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_14 f_472_low60_40_low20_13;
mov u_512_526 u_512_525;
mov v_512_526 v_512_525;

asr g_472_low60_40_low20_14 g_472_low60_40_low20_13 1;
asr r_512_526 r_512_525 1;
asr s_512_526 s_512_525 1;
assert
    true
&&
    f_472_low60_40_low20_14 = f_472_low60_40_low20_13,
    u_512_526 = u_512_525,
    v_512_526 = v_512_525,
    g_472_low60_40_low20_14 * (const 64 2) = g_472_low60_40_low20_13,
    r_512_526 * (const 64 2) = r_512_525,
    s_512_526 * (const 64 2) = s_512_525
;

assume
    f_472_low60_40_low20_14 = f_472_low60_40_low20_13,
    u_512_526 = u_512_525,
    v_512_526 = v_512_525,
    g_472_low60_40_low20_14 * 2 = g_472_low60_40_low20_13,
    r_512_526 * 2 = r_512_525,
    s_512_526 * 2 = s_512_525
&&
    true
;

{
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_14 + u_512_526 * (const 64 (2**21)) + v_512_526 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_14 + r_512_526 * (const 64 (2**21)) + s_512_526 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_14,
    f_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_14,
    g_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 526)) <=s delta, delta <=s (const 64 (1 + 2*526)),
    (const 64 (-(2**20))) <=s u_512_526, u_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_526, v_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_526, r_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_526, s_512_526 <=s (const 64 ((2**20))),
    u_512_526 + v_512_526 <=s (const 64 (2**20)),
    u_512_526 - v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 + v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 - v_512_526 <=s (const 64 (2**20)),
    r_512_526 + s_512_526 <=s (const 64 (2**20)),
    r_512_526 - s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 + s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 - s_512_526 <=s (const 64 (2**20)),
    u_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_512_526 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_525_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_13,
sint64 g_472_low60_40_low20_13,
sint64 f_472_low60_40_low20_14,
sint64 g_472_low60_40_low20_14,
sint64 u_512_525,
sint64 v_512_525,
sint64 r_512_525,
sint64 s_512_525,
sint64 u_512_526,
sint64 v_512_526,
sint64 r_512_526,
sint64 s_512_526,
bit ne
)={
    u_512_525 * f_472_low60_40_low20_0 + v_512_525 * g_472_low60_40_low20_0 = f_472_low60_40_low20_13 * (-(2**20)),
    r_512_525 * f_472_low60_40_low20_0 + s_512_525 * g_472_low60_40_low20_0 = g_472_low60_40_low20_13 * (-(2**20))
&&
    u_512_525 * f_472_low60_40_low20_0 + v_512_525 * g_472_low60_40_low20_0 = f_472_low60_40_low20_13 * (const 64 (-(2**20))),
    r_512_525 * f_472_low60_40_low20_0 + s_512_525 * g_472_low60_40_low20_0 = g_472_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_13 + u_512_525 * (const 64 (2**21)) + v_512_525 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_13 + r_512_525 * (const 64 (2**21)) + s_512_525 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_13,
    f_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_13,
    g_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 525)) <=s delta, delta <=s (const 64 (1 + 2*525)),
    (const 64 (-(2**20))) <=s u_512_525, u_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_525, v_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_525, r_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_525, s_512_525 <=s (const 64 ((2**20))),
    u_512_525 + v_512_525 <=s (const 64 (2**20)),
    u_512_525 - v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 + v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 - v_512_525 <=s (const 64 (2**20)),
    r_512_525 + s_512_525 <=s (const 64 (2**20)),
    r_512_525 - s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 + s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 - s_512_525 <=s (const 64 (2**20)),
    u_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_512_525 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise b
assume
g_472_low60_40_low20_13 = 1 (mod 2)
&&
g_472_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_14 f_472_low60_40_low20_13;
mov u_512_526 u_512_525;
mov v_512_526 v_512_525;

add g_472_low60_40_low20_14 g_472_low60_40_low20_13 f_472_low60_40_low20_13;
asr g_472_low60_40_low20_14 g_472_low60_40_low20_14 1;
add r_512_526 r_512_525 u_512_525;
asr r_512_526 r_512_526 1;
add s_512_526 s_512_525 v_512_525;
asr s_512_526 s_512_526 1;
assert
    true
&&
    f_472_low60_40_low20_14 = f_472_low60_40_low20_13,
    u_512_526 = u_512_525,
    v_512_526 = v_512_525,
    g_472_low60_40_low20_14 * (const 64 2) = g_472_low60_40_low20_13 + f_472_low60_40_low20_13,
    r_512_526 * (const 64 2) = r_512_525 + u_512_525,
    s_512_526 * (const 64 2) = s_512_525 + v_512_525
;

assume
    f_472_low60_40_low20_14 = f_472_low60_40_low20_13,
    u_512_526 = u_512_525,
    v_512_526 = v_512_525,
    g_472_low60_40_low20_14 * 2 = g_472_low60_40_low20_13 + f_472_low60_40_low20_13,
    r_512_526 * 2 = r_512_525 + u_512_525,
    s_512_526 * 2 = s_512_525 + v_512_525
&&
    true
;

{
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_14 + u_512_526 * (const 64 (2**21)) + v_512_526 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_14 + r_512_526 * (const 64 (2**21)) + s_512_526 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_14,
    f_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_14,
    g_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 526)) <=s delta, delta <=s (const 64 (1 + 2*526)),
    (const 64 (-(2**20))) <=s u_512_526, u_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_526, v_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_526, r_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_526, s_512_526 <=s (const 64 ((2**20))),
    u_512_526 + v_512_526 <=s (const 64 (2**20)),
    u_512_526 - v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 + v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 - v_512_526 <=s (const 64 (2**20)),
    r_512_526 + s_512_526 <=s (const 64 (2**20)),
    r_512_526 - s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 + s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 - s_512_526 <=s (const 64 (2**20)),
    u_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_512_526 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_525_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_13,
sint64 g_472_low60_40_low20_13,
sint64 f_472_low60_40_low20_14,
sint64 g_472_low60_40_low20_14,
sint64 u_512_525,
sint64 v_512_525,
sint64 r_512_525,
sint64 s_512_525,
sint64 u_512_526,
sint64 v_512_526,
sint64 r_512_526,
sint64 s_512_526,
bit ne
)={
    u_512_525 * f_472_low60_40_low20_0 + v_512_525 * g_472_low60_40_low20_0 = f_472_low60_40_low20_13 * (-(2**20)),
    r_512_525 * f_472_low60_40_low20_0 + s_512_525 * g_472_low60_40_low20_0 = g_472_low60_40_low20_13 * (-(2**20))
&&
    u_512_525 * f_472_low60_40_low20_0 + v_512_525 * g_472_low60_40_low20_0 = f_472_low60_40_low20_13 * (const 64 (-(2**20))),
    r_512_525 * f_472_low60_40_low20_0 + s_512_525 * g_472_low60_40_low20_0 = g_472_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_13 + u_512_525 * (const 64 (2**21)) + v_512_525 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_13 + r_512_525 * (const 64 (2**21)) + s_512_525 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_13,
    f_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_13,
    g_472_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 525)) <=s delta, delta <=s (const 64 (1 + 2*525)),
    (const 64 (-(2**20))) <=s u_512_525, u_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_525, v_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_525, r_512_525 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_525, s_512_525 <=s (const 64 ((2**20))),
    u_512_525 + v_512_525 <=s (const 64 (2**20)),
    u_512_525 - v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 + v_512_525 <=s (const 64 (2**20)),
    (const 64 0) - u_512_525 - v_512_525 <=s (const 64 (2**20)),
    r_512_525 + s_512_525 <=s (const 64 (2**20)),
    r_512_525 - s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 + s_512_525 <=s (const 64 (2**20)),
    (const 64 0) - r_512_525 - s_512_525 <=s (const 64 (2**20)),
    u_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_512_525 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_512_525 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise c
assume
g_472_low60_40_low20_13 = 1 (mod 2)
&&
g_472_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_14 g_472_low60_40_low20_13;
mov u_512_526 r_512_525;
mov v_512_526 s_512_525;

subs dc g_472_low60_40_low20_14 g_472_low60_40_low20_13 f_472_low60_40_low20_13;
asr g_472_low60_40_low20_14 g_472_low60_40_low20_14 1;
subs dc r_512_526 r_512_525 u_512_525;
asr r_512_526 r_512_526 1;
subs dc s_512_526 s_512_525 v_512_525;
asr s_512_526 s_512_526 1;
assert
    true
&&
    f_472_low60_40_low20_14 = g_472_low60_40_low20_13,
    u_512_526 = r_512_525,
    v_512_526 = s_512_525,
    g_472_low60_40_low20_14 * (const 64 2) = g_472_low60_40_low20_13 - f_472_low60_40_low20_13,
    r_512_526 * (const 64 2) = r_512_525 - u_512_525,
    s_512_526 * (const 64 2) = s_512_525 - v_512_525
;

assume
    f_472_low60_40_low20_14 = g_472_low60_40_low20_13,
    u_512_526 = r_512_525,
    v_512_526 = s_512_525,
    g_472_low60_40_low20_14 * 2 = g_472_low60_40_low20_13 - f_472_low60_40_low20_13,
    r_512_526 * 2 = r_512_525 - u_512_525,
    s_512_526 * 2 = s_512_525 - v_512_525
&&
    true
;

{
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_14 + u_512_526 * (const 64 (2**21)) + v_512_526 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_14 + r_512_526 * (const 64 (2**21)) + s_512_526 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_14,
    f_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_14,
    g_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 526)) <=s delta, delta <=s (const 64 (1 + 2*526)),
    (const 64 (-(2**20))) <=s u_512_526, u_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_526, v_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_526, r_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_526, s_512_526 <=s (const 64 ((2**20))),
    u_512_526 + v_512_526 <=s (const 64 (2**20)),
    u_512_526 - v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 + v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 - v_512_526 <=s (const 64 (2**20)),
    r_512_526 + s_512_526 <=s (const 64 (2**20)),
    r_512_526 - s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 + s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 - s_512_526 <=s (const 64 (2**20)),
    u_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_512_526 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_526_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_14,
sint64 g_472_low60_40_low20_14,
sint64 f_472_low60_40_low20_15,
sint64 g_472_low60_40_low20_15,
sint64 u_512_526,
sint64 v_512_526,
sint64 r_512_526,
sint64 s_512_526,
sint64 u_512_527,
sint64 v_512_527,
sint64 r_512_527,
sint64 s_512_527,
bit ne
)={
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (-(2**20)),
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (-(2**20))
&&
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (const 64 (-(2**20))),
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_14 + u_512_526 * (const 64 (2**21)) + v_512_526 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_14 + r_512_526 * (const 64 (2**21)) + s_512_526 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_14,
    f_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_14,
    g_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 526)) <=s delta, delta <=s (const 64 (1 + 2*526)),
    (const 64 (-(2**20))) <=s u_512_526, u_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_526, v_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_526, r_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_526, s_512_526 <=s (const 64 ((2**20))),
    u_512_526 + v_512_526 <=s (const 64 (2**20)),
    u_512_526 - v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 + v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 - v_512_526 <=s (const 64 (2**20)),
    r_512_526 + s_512_526 <=s (const 64 (2**20)),
    r_512_526 - s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 + s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 - s_512_526 <=s (const 64 (2**20)),
    u_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_512_526 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise a
assume
g_472_low60_40_low20_14 = 0 (mod 2)
&&
g_472_low60_40_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_15 f_472_low60_40_low20_14;
mov u_512_527 u_512_526;
mov v_512_527 v_512_526;

asr g_472_low60_40_low20_15 g_472_low60_40_low20_14 1;
asr r_512_527 r_512_526 1;
asr s_512_527 s_512_526 1;
assert
    true
&&
    f_472_low60_40_low20_15 = f_472_low60_40_low20_14,
    u_512_527 = u_512_526,
    v_512_527 = v_512_526,
    g_472_low60_40_low20_15 * (const 64 2) = g_472_low60_40_low20_14,
    r_512_527 * (const 64 2) = r_512_526,
    s_512_527 * (const 64 2) = s_512_526
;

assume
    f_472_low60_40_low20_15 = f_472_low60_40_low20_14,
    u_512_527 = u_512_526,
    v_512_527 = v_512_526,
    g_472_low60_40_low20_15 * 2 = g_472_low60_40_low20_14,
    r_512_527 * 2 = r_512_526,
    s_512_527 * 2 = s_512_526
&&
    true
;

{
    u_512_527 * f_472_low60_40_low20_0 + v_512_527 * g_472_low60_40_low20_0 = f_472_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_527 * f_472_low60_40_low20_0 + s_512_527 * g_472_low60_40_low20_0 = g_472_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_15 + u_512_527 * (const 64 (2**21)) + v_512_527 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_15 + r_512_527 * (const 64 (2**21)) + s_512_527 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_15,
    f_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_15,
    g_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 527)) <=s delta, delta <=s (const 64 (1 + 2*527)),
    (const 64 (-(2**20))) <=s u_512_527, u_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_527, v_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_527, r_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_527, s_512_527 <=s (const 64 ((2**20))),
    u_512_527 + v_512_527 <=s (const 64 (2**20)),
    u_512_527 - v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 + v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 - v_512_527 <=s (const 64 (2**20)),
    r_512_527 + s_512_527 <=s (const 64 (2**20)),
    r_512_527 - s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 + s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 - s_512_527 <=s (const 64 (2**20)),
    u_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_512_527 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_526_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_14,
sint64 g_472_low60_40_low20_14,
sint64 f_472_low60_40_low20_15,
sint64 g_472_low60_40_low20_15,
sint64 u_512_526,
sint64 v_512_526,
sint64 r_512_526,
sint64 s_512_526,
sint64 u_512_527,
sint64 v_512_527,
sint64 r_512_527,
sint64 s_512_527,
bit ne
)={
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (-(2**20)),
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (-(2**20))
&&
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (const 64 (-(2**20))),
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_14 + u_512_526 * (const 64 (2**21)) + v_512_526 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_14 + r_512_526 * (const 64 (2**21)) + s_512_526 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_14,
    f_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_14,
    g_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 526)) <=s delta, delta <=s (const 64 (1 + 2*526)),
    (const 64 (-(2**20))) <=s u_512_526, u_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_526, v_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_526, r_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_526, s_512_526 <=s (const 64 ((2**20))),
    u_512_526 + v_512_526 <=s (const 64 (2**20)),
    u_512_526 - v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 + v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 - v_512_526 <=s (const 64 (2**20)),
    r_512_526 + s_512_526 <=s (const 64 (2**20)),
    r_512_526 - s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 + s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 - s_512_526 <=s (const 64 (2**20)),
    u_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_512_526 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise b
assume
g_472_low60_40_low20_14 = 1 (mod 2)
&&
g_472_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_15 f_472_low60_40_low20_14;
mov u_512_527 u_512_526;
mov v_512_527 v_512_526;

add g_472_low60_40_low20_15 g_472_low60_40_low20_14 f_472_low60_40_low20_14;
asr g_472_low60_40_low20_15 g_472_low60_40_low20_15 1;
add r_512_527 r_512_526 u_512_526;
asr r_512_527 r_512_527 1;
add s_512_527 s_512_526 v_512_526;
asr s_512_527 s_512_527 1;
assert
    true
&&
    f_472_low60_40_low20_15 = f_472_low60_40_low20_14,
    u_512_527 = u_512_526,
    v_512_527 = v_512_526,
    g_472_low60_40_low20_15 * (const 64 2) = g_472_low60_40_low20_14 + f_472_low60_40_low20_14,
    r_512_527 * (const 64 2) = r_512_526 + u_512_526,
    s_512_527 * (const 64 2) = s_512_526 + v_512_526
;

assume
    f_472_low60_40_low20_15 = f_472_low60_40_low20_14,
    u_512_527 = u_512_526,
    v_512_527 = v_512_526,
    g_472_low60_40_low20_15 * 2 = g_472_low60_40_low20_14 + f_472_low60_40_low20_14,
    r_512_527 * 2 = r_512_526 + u_512_526,
    s_512_527 * 2 = s_512_526 + v_512_526
&&
    true
;

{
    u_512_527 * f_472_low60_40_low20_0 + v_512_527 * g_472_low60_40_low20_0 = f_472_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_527 * f_472_low60_40_low20_0 + s_512_527 * g_472_low60_40_low20_0 = g_472_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_15 + u_512_527 * (const 64 (2**21)) + v_512_527 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_15 + r_512_527 * (const 64 (2**21)) + s_512_527 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_15,
    f_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_15,
    g_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 527)) <=s delta, delta <=s (const 64 (1 + 2*527)),
    (const 64 (-(2**20))) <=s u_512_527, u_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_527, v_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_527, r_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_527, s_512_527 <=s (const 64 ((2**20))),
    u_512_527 + v_512_527 <=s (const 64 (2**20)),
    u_512_527 - v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 + v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 - v_512_527 <=s (const 64 (2**20)),
    r_512_527 + s_512_527 <=s (const 64 (2**20)),
    r_512_527 - s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 + s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 - s_512_527 <=s (const 64 (2**20)),
    u_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_512_527 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_526_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_14,
sint64 g_472_low60_40_low20_14,
sint64 f_472_low60_40_low20_15,
sint64 g_472_low60_40_low20_15,
sint64 u_512_526,
sint64 v_512_526,
sint64 r_512_526,
sint64 s_512_526,
sint64 u_512_527,
sint64 v_512_527,
sint64 r_512_527,
sint64 s_512_527,
bit ne
)={
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (-(2**20)),
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (-(2**20))
&&
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (const 64 (-(2**20))),
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_14 + u_512_526 * (const 64 (2**21)) + v_512_526 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_14 + r_512_526 * (const 64 (2**21)) + s_512_526 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_14,
    f_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_14,
    g_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 526)) <=s delta, delta <=s (const 64 (1 + 2*526)),
    (const 64 (-(2**20))) <=s u_512_526, u_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_526, v_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_526, r_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_526, s_512_526 <=s (const 64 ((2**20))),
    u_512_526 + v_512_526 <=s (const 64 (2**20)),
    u_512_526 - v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 + v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 - v_512_526 <=s (const 64 (2**20)),
    r_512_526 + s_512_526 <=s (const 64 (2**20)),
    r_512_526 - s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 + s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 - s_512_526 <=s (const 64 (2**20)),
    u_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_512_526 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise c
assume
g_472_low60_40_low20_14 = 1 (mod 2)
&&
g_472_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_15 g_472_low60_40_low20_14;
mov u_512_527 r_512_526;
mov v_512_527 s_512_526;

subs dc g_472_low60_40_low20_15 g_472_low60_40_low20_14 f_472_low60_40_low20_14;
asr g_472_low60_40_low20_15 g_472_low60_40_low20_15 1;
subs dc r_512_527 r_512_526 u_512_526;
asr r_512_527 r_512_527 1;
subs dc s_512_527 s_512_526 v_512_526;
asr s_512_527 s_512_527 1;
assert
    true
&&
    f_472_low60_40_low20_15 = g_472_low60_40_low20_14,
    u_512_527 = r_512_526,
    v_512_527 = s_512_526,
    g_472_low60_40_low20_15 * (const 64 2) = g_472_low60_40_low20_14 - f_472_low60_40_low20_14,
    r_512_527 * (const 64 2) = r_512_526 - u_512_526,
    s_512_527 * (const 64 2) = s_512_526 - v_512_526
;

assume
    f_472_low60_40_low20_15 = g_472_low60_40_low20_14,
    u_512_527 = r_512_526,
    v_512_527 = s_512_526,
    g_472_low60_40_low20_15 * 2 = g_472_low60_40_low20_14 - f_472_low60_40_low20_14,
    r_512_527 * 2 = r_512_526 - u_512_526,
    s_512_527 * 2 = s_512_526 - v_512_526
&&
    true
;

{
    u_512_527 * f_472_low60_40_low20_0 + v_512_527 * g_472_low60_40_low20_0 = f_472_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_527 * f_472_low60_40_low20_0 + s_512_527 * g_472_low60_40_low20_0 = g_472_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_15 + u_512_527 * (const 64 (2**21)) + v_512_527 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_15 + r_512_527 * (const 64 (2**21)) + s_512_527 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_15,
    f_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_15,
    g_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 527)) <=s delta, delta <=s (const 64 (1 + 2*527)),
    (const 64 (-(2**20))) <=s u_512_527, u_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_527, v_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_527, r_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_527, s_512_527 <=s (const 64 ((2**20))),
    u_512_527 + v_512_527 <=s (const 64 (2**20)),
    u_512_527 - v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 + v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 - v_512_527 <=s (const 64 (2**20)),
    r_512_527 + s_512_527 <=s (const 64 (2**20)),
    r_512_527 - s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 + s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 - s_512_527 <=s (const 64 (2**20)),
    u_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_512_527 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_527_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_15,
sint64 g_472_low60_40_low20_15,
sint64 f_472_low60_40_low20_16,
sint64 g_472_low60_40_low20_16,
sint64 u_512_527,
sint64 v_512_527,
sint64 r_512_527,
sint64 s_512_527,
sint64 u_512_528,
sint64 v_512_528,
sint64 r_512_528,
sint64 s_512_528,
bit ne
)={
    u_512_527 * f_472_low60_40_low20_0 + v_512_527 * g_472_low60_40_low20_0 = f_472_low60_40_low20_15 * (-(2**20)),
    r_512_527 * f_472_low60_40_low20_0 + s_512_527 * g_472_low60_40_low20_0 = g_472_low60_40_low20_15 * (-(2**20))
&&
    u_512_527 * f_472_low60_40_low20_0 + v_512_527 * g_472_low60_40_low20_0 = f_472_low60_40_low20_15 * (const 64 (-(2**20))),
    r_512_527 * f_472_low60_40_low20_0 + s_512_527 * g_472_low60_40_low20_0 = g_472_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_15 + u_512_527 * (const 64 (2**21)) + v_512_527 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_15 + r_512_527 * (const 64 (2**21)) + s_512_527 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_15,
    f_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_15,
    g_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 527)) <=s delta, delta <=s (const 64 (1 + 2*527)),
    (const 64 (-(2**20))) <=s u_512_527, u_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_527, v_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_527, r_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_527, s_512_527 <=s (const 64 ((2**20))),
    u_512_527 + v_512_527 <=s (const 64 (2**20)),
    u_512_527 - v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 + v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 - v_512_527 <=s (const 64 (2**20)),
    r_512_527 + s_512_527 <=s (const 64 (2**20)),
    r_512_527 - s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 + s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 - s_512_527 <=s (const 64 (2**20)),
    u_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_512_527 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise a
assume
g_472_low60_40_low20_15 = 0 (mod 2)
&&
g_472_low60_40_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_16 f_472_low60_40_low20_15;
mov u_512_528 u_512_527;
mov v_512_528 v_512_527;

asr g_472_low60_40_low20_16 g_472_low60_40_low20_15 1;
asr r_512_528 r_512_527 1;
asr s_512_528 s_512_527 1;
assert
    true
&&
    f_472_low60_40_low20_16 = f_472_low60_40_low20_15,
    u_512_528 = u_512_527,
    v_512_528 = v_512_527,
    g_472_low60_40_low20_16 * (const 64 2) = g_472_low60_40_low20_15,
    r_512_528 * (const 64 2) = r_512_527,
    s_512_528 * (const 64 2) = s_512_527
;

assume
    f_472_low60_40_low20_16 = f_472_low60_40_low20_15,
    u_512_528 = u_512_527,
    v_512_528 = v_512_527,
    g_472_low60_40_low20_16 * 2 = g_472_low60_40_low20_15,
    r_512_528 * 2 = r_512_527,
    s_512_528 * 2 = s_512_527
&&
    true
;

{
    u_512_528 * f_472_low60_40_low20_0 + v_512_528 * g_472_low60_40_low20_0 = f_472_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_528 * f_472_low60_40_low20_0 + s_512_528 * g_472_low60_40_low20_0 = g_472_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_16 + u_512_528 * (const 64 (2**21)) + v_512_528 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_16 + r_512_528 * (const 64 (2**21)) + s_512_528 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_16,
    f_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_16,
    g_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 528)) <=s delta, delta <=s (const 64 (1 + 2*528)),
    (const 64 (-(2**20))) <=s u_512_528, u_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_528, v_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_528, r_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_528, s_512_528 <=s (const 64 ((2**20))),
    u_512_528 + v_512_528 <=s (const 64 (2**20)),
    u_512_528 - v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 + v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 - v_512_528 <=s (const 64 (2**20)),
    r_512_528 + s_512_528 <=s (const 64 (2**20)),
    r_512_528 - s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 + s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 - s_512_528 <=s (const 64 (2**20)),
    u_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_512_528 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_527_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_15,
sint64 g_472_low60_40_low20_15,
sint64 f_472_low60_40_low20_16,
sint64 g_472_low60_40_low20_16,
sint64 u_512_527,
sint64 v_512_527,
sint64 r_512_527,
sint64 s_512_527,
sint64 u_512_528,
sint64 v_512_528,
sint64 r_512_528,
sint64 s_512_528,
bit ne
)={
    u_512_527 * f_472_low60_40_low20_0 + v_512_527 * g_472_low60_40_low20_0 = f_472_low60_40_low20_15 * (-(2**20)),
    r_512_527 * f_472_low60_40_low20_0 + s_512_527 * g_472_low60_40_low20_0 = g_472_low60_40_low20_15 * (-(2**20))
&&
    u_512_527 * f_472_low60_40_low20_0 + v_512_527 * g_472_low60_40_low20_0 = f_472_low60_40_low20_15 * (const 64 (-(2**20))),
    r_512_527 * f_472_low60_40_low20_0 + s_512_527 * g_472_low60_40_low20_0 = g_472_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_15 + u_512_527 * (const 64 (2**21)) + v_512_527 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_15 + r_512_527 * (const 64 (2**21)) + s_512_527 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_15,
    f_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_15,
    g_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 527)) <=s delta, delta <=s (const 64 (1 + 2*527)),
    (const 64 (-(2**20))) <=s u_512_527, u_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_527, v_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_527, r_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_527, s_512_527 <=s (const 64 ((2**20))),
    u_512_527 + v_512_527 <=s (const 64 (2**20)),
    u_512_527 - v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 + v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 - v_512_527 <=s (const 64 (2**20)),
    r_512_527 + s_512_527 <=s (const 64 (2**20)),
    r_512_527 - s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 + s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 - s_512_527 <=s (const 64 (2**20)),
    u_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_512_527 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise b
assume
g_472_low60_40_low20_15 = 1 (mod 2)
&&
g_472_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_16 f_472_low60_40_low20_15;
mov u_512_528 u_512_527;
mov v_512_528 v_512_527;

add g_472_low60_40_low20_16 g_472_low60_40_low20_15 f_472_low60_40_low20_15;
asr g_472_low60_40_low20_16 g_472_low60_40_low20_16 1;
add r_512_528 r_512_527 u_512_527;
asr r_512_528 r_512_528 1;
add s_512_528 s_512_527 v_512_527;
asr s_512_528 s_512_528 1;
assert
    true
&&
    f_472_low60_40_low20_16 = f_472_low60_40_low20_15,
    u_512_528 = u_512_527,
    v_512_528 = v_512_527,
    g_472_low60_40_low20_16 * (const 64 2) = g_472_low60_40_low20_15 + f_472_low60_40_low20_15,
    r_512_528 * (const 64 2) = r_512_527 + u_512_527,
    s_512_528 * (const 64 2) = s_512_527 + v_512_527
;

assume
    f_472_low60_40_low20_16 = f_472_low60_40_low20_15,
    u_512_528 = u_512_527,
    v_512_528 = v_512_527,
    g_472_low60_40_low20_16 * 2 = g_472_low60_40_low20_15 + f_472_low60_40_low20_15,
    r_512_528 * 2 = r_512_527 + u_512_527,
    s_512_528 * 2 = s_512_527 + v_512_527
&&
    true
;

{
    u_512_528 * f_472_low60_40_low20_0 + v_512_528 * g_472_low60_40_low20_0 = f_472_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_528 * f_472_low60_40_low20_0 + s_512_528 * g_472_low60_40_low20_0 = g_472_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_16 + u_512_528 * (const 64 (2**21)) + v_512_528 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_16 + r_512_528 * (const 64 (2**21)) + s_512_528 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_16,
    f_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_16,
    g_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 528)) <=s delta, delta <=s (const 64 (1 + 2*528)),
    (const 64 (-(2**20))) <=s u_512_528, u_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_528, v_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_528, r_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_528, s_512_528 <=s (const 64 ((2**20))),
    u_512_528 + v_512_528 <=s (const 64 (2**20)),
    u_512_528 - v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 + v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 - v_512_528 <=s (const 64 (2**20)),
    r_512_528 + s_512_528 <=s (const 64 (2**20)),
    r_512_528 - s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 + s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 - s_512_528 <=s (const 64 (2**20)),
    u_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_512_528 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_527_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_15,
sint64 g_472_low60_40_low20_15,
sint64 f_472_low60_40_low20_16,
sint64 g_472_low60_40_low20_16,
sint64 u_512_527,
sint64 v_512_527,
sint64 r_512_527,
sint64 s_512_527,
sint64 u_512_528,
sint64 v_512_528,
sint64 r_512_528,
sint64 s_512_528,
bit ne
)={
    u_512_527 * f_472_low60_40_low20_0 + v_512_527 * g_472_low60_40_low20_0 = f_472_low60_40_low20_15 * (-(2**20)),
    r_512_527 * f_472_low60_40_low20_0 + s_512_527 * g_472_low60_40_low20_0 = g_472_low60_40_low20_15 * (-(2**20))
&&
    u_512_527 * f_472_low60_40_low20_0 + v_512_527 * g_472_low60_40_low20_0 = f_472_low60_40_low20_15 * (const 64 (-(2**20))),
    r_512_527 * f_472_low60_40_low20_0 + s_512_527 * g_472_low60_40_low20_0 = g_472_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_15 + u_512_527 * (const 64 (2**21)) + v_512_527 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_15 + r_512_527 * (const 64 (2**21)) + s_512_527 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_15,
    f_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_15,
    g_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 527)) <=s delta, delta <=s (const 64 (1 + 2*527)),
    (const 64 (-(2**20))) <=s u_512_527, u_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_527, v_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_527, r_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_527, s_512_527 <=s (const 64 ((2**20))),
    u_512_527 + v_512_527 <=s (const 64 (2**20)),
    u_512_527 - v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 + v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 - v_512_527 <=s (const 64 (2**20)),
    r_512_527 + s_512_527 <=s (const 64 (2**20)),
    r_512_527 - s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 + s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 - s_512_527 <=s (const 64 (2**20)),
    u_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_512_527 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise c
assume
g_472_low60_40_low20_15 = 1 (mod 2)
&&
g_472_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_16 g_472_low60_40_low20_15;
mov u_512_528 r_512_527;
mov v_512_528 s_512_527;

subs dc g_472_low60_40_low20_16 g_472_low60_40_low20_15 f_472_low60_40_low20_15;
asr g_472_low60_40_low20_16 g_472_low60_40_low20_16 1;
subs dc r_512_528 r_512_527 u_512_527;
asr r_512_528 r_512_528 1;
subs dc s_512_528 s_512_527 v_512_527;
asr s_512_528 s_512_528 1;
assert
    true
&&
    f_472_low60_40_low20_16 = g_472_low60_40_low20_15,
    u_512_528 = r_512_527,
    v_512_528 = s_512_527,
    g_472_low60_40_low20_16 * (const 64 2) = g_472_low60_40_low20_15 - f_472_low60_40_low20_15,
    r_512_528 * (const 64 2) = r_512_527 - u_512_527,
    s_512_528 * (const 64 2) = s_512_527 - v_512_527
;

assume
    f_472_low60_40_low20_16 = g_472_low60_40_low20_15,
    u_512_528 = r_512_527,
    v_512_528 = s_512_527,
    g_472_low60_40_low20_16 * 2 = g_472_low60_40_low20_15 - f_472_low60_40_low20_15,
    r_512_528 * 2 = r_512_527 - u_512_527,
    s_512_528 * 2 = s_512_527 - v_512_527
&&
    true
;

{
    u_512_528 * f_472_low60_40_low20_0 + v_512_528 * g_472_low60_40_low20_0 = f_472_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_528 * f_472_low60_40_low20_0 + s_512_528 * g_472_low60_40_low20_0 = g_472_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_16 + u_512_528 * (const 64 (2**21)) + v_512_528 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_16 + r_512_528 * (const 64 (2**21)) + s_512_528 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_16,
    f_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_16,
    g_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 528)) <=s delta, delta <=s (const 64 (1 + 2*528)),
    (const 64 (-(2**20))) <=s u_512_528, u_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_528, v_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_528, r_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_528, s_512_528 <=s (const 64 ((2**20))),
    u_512_528 + v_512_528 <=s (const 64 (2**20)),
    u_512_528 - v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 + v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 - v_512_528 <=s (const 64 (2**20)),
    r_512_528 + s_512_528 <=s (const 64 (2**20)),
    r_512_528 - s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 + s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 - s_512_528 <=s (const 64 (2**20)),
    u_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_512_528 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_528_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_16,
sint64 g_472_low60_40_low20_16,
sint64 f_472_low60_40_low20_17,
sint64 g_472_low60_40_low20_17,
sint64 u_512_528,
sint64 v_512_528,
sint64 r_512_528,
sint64 s_512_528,
sint64 u_512_529,
sint64 v_512_529,
sint64 r_512_529,
sint64 s_512_529,
bit ne
)={
    u_512_528 * f_472_low60_40_low20_0 + v_512_528 * g_472_low60_40_low20_0 = f_472_low60_40_low20_16 * (-(2**20)),
    r_512_528 * f_472_low60_40_low20_0 + s_512_528 * g_472_low60_40_low20_0 = g_472_low60_40_low20_16 * (-(2**20))
&&
    u_512_528 * f_472_low60_40_low20_0 + v_512_528 * g_472_low60_40_low20_0 = f_472_low60_40_low20_16 * (const 64 (-(2**20))),
    r_512_528 * f_472_low60_40_low20_0 + s_512_528 * g_472_low60_40_low20_0 = g_472_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_16 + u_512_528 * (const 64 (2**21)) + v_512_528 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_16 + r_512_528 * (const 64 (2**21)) + s_512_528 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_16,
    f_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_16,
    g_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 528)) <=s delta, delta <=s (const 64 (1 + 2*528)),
    (const 64 (-(2**20))) <=s u_512_528, u_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_528, v_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_528, r_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_528, s_512_528 <=s (const 64 ((2**20))),
    u_512_528 + v_512_528 <=s (const 64 (2**20)),
    u_512_528 - v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 + v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 - v_512_528 <=s (const 64 (2**20)),
    r_512_528 + s_512_528 <=s (const 64 (2**20)),
    r_512_528 - s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 + s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 - s_512_528 <=s (const 64 (2**20)),
    u_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_512_528 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise a
assume
g_472_low60_40_low20_16 = 0 (mod 2)
&&
g_472_low60_40_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_17 f_472_low60_40_low20_16;
mov u_512_529 u_512_528;
mov v_512_529 v_512_528;

asr g_472_low60_40_low20_17 g_472_low60_40_low20_16 1;
asr r_512_529 r_512_528 1;
asr s_512_529 s_512_528 1;
assert
    true
&&
    f_472_low60_40_low20_17 = f_472_low60_40_low20_16,
    u_512_529 = u_512_528,
    v_512_529 = v_512_528,
    g_472_low60_40_low20_17 * (const 64 2) = g_472_low60_40_low20_16,
    r_512_529 * (const 64 2) = r_512_528,
    s_512_529 * (const 64 2) = s_512_528
;

assume
    f_472_low60_40_low20_17 = f_472_low60_40_low20_16,
    u_512_529 = u_512_528,
    v_512_529 = v_512_528,
    g_472_low60_40_low20_17 * 2 = g_472_low60_40_low20_16,
    r_512_529 * 2 = r_512_528,
    s_512_529 * 2 = s_512_528
&&
    true
;

{
    u_512_529 * f_472_low60_40_low20_0 + v_512_529 * g_472_low60_40_low20_0 = f_472_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_529 * f_472_low60_40_low20_0 + s_512_529 * g_472_low60_40_low20_0 = g_472_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_17 + u_512_529 * (const 64 (2**21)) + v_512_529 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_17 + r_512_529 * (const 64 (2**21)) + s_512_529 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_17,
    f_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_17,
    g_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 529)) <=s delta, delta <=s (const 64 (1 + 2*529)),
    (const 64 (-(2**20))) <=s u_512_529, u_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_529, v_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_529, r_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_529, s_512_529 <=s (const 64 ((2**20))),
    u_512_529 + v_512_529 <=s (const 64 (2**20)),
    u_512_529 - v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 + v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 - v_512_529 <=s (const 64 (2**20)),
    r_512_529 + s_512_529 <=s (const 64 (2**20)),
    r_512_529 - s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 + s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 - s_512_529 <=s (const 64 (2**20)),
    u_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_512_529 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_528_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_16,
sint64 g_472_low60_40_low20_16,
sint64 f_472_low60_40_low20_17,
sint64 g_472_low60_40_low20_17,
sint64 u_512_528,
sint64 v_512_528,
sint64 r_512_528,
sint64 s_512_528,
sint64 u_512_529,
sint64 v_512_529,
sint64 r_512_529,
sint64 s_512_529,
bit ne
)={
    u_512_528 * f_472_low60_40_low20_0 + v_512_528 * g_472_low60_40_low20_0 = f_472_low60_40_low20_16 * (-(2**20)),
    r_512_528 * f_472_low60_40_low20_0 + s_512_528 * g_472_low60_40_low20_0 = g_472_low60_40_low20_16 * (-(2**20))
&&
    u_512_528 * f_472_low60_40_low20_0 + v_512_528 * g_472_low60_40_low20_0 = f_472_low60_40_low20_16 * (const 64 (-(2**20))),
    r_512_528 * f_472_low60_40_low20_0 + s_512_528 * g_472_low60_40_low20_0 = g_472_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_16 + u_512_528 * (const 64 (2**21)) + v_512_528 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_16 + r_512_528 * (const 64 (2**21)) + s_512_528 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_16,
    f_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_16,
    g_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 528)) <=s delta, delta <=s (const 64 (1 + 2*528)),
    (const 64 (-(2**20))) <=s u_512_528, u_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_528, v_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_528, r_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_528, s_512_528 <=s (const 64 ((2**20))),
    u_512_528 + v_512_528 <=s (const 64 (2**20)),
    u_512_528 - v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 + v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 - v_512_528 <=s (const 64 (2**20)),
    r_512_528 + s_512_528 <=s (const 64 (2**20)),
    r_512_528 - s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 + s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 - s_512_528 <=s (const 64 (2**20)),
    u_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_512_528 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise b
assume
g_472_low60_40_low20_16 = 1 (mod 2)
&&
g_472_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_17 f_472_low60_40_low20_16;
mov u_512_529 u_512_528;
mov v_512_529 v_512_528;

add g_472_low60_40_low20_17 g_472_low60_40_low20_16 f_472_low60_40_low20_16;
asr g_472_low60_40_low20_17 g_472_low60_40_low20_17 1;
add r_512_529 r_512_528 u_512_528;
asr r_512_529 r_512_529 1;
add s_512_529 s_512_528 v_512_528;
asr s_512_529 s_512_529 1;
assert
    true
&&
    f_472_low60_40_low20_17 = f_472_low60_40_low20_16,
    u_512_529 = u_512_528,
    v_512_529 = v_512_528,
    g_472_low60_40_low20_17 * (const 64 2) = g_472_low60_40_low20_16 + f_472_low60_40_low20_16,
    r_512_529 * (const 64 2) = r_512_528 + u_512_528,
    s_512_529 * (const 64 2) = s_512_528 + v_512_528
;

assume
    f_472_low60_40_low20_17 = f_472_low60_40_low20_16,
    u_512_529 = u_512_528,
    v_512_529 = v_512_528,
    g_472_low60_40_low20_17 * 2 = g_472_low60_40_low20_16 + f_472_low60_40_low20_16,
    r_512_529 * 2 = r_512_528 + u_512_528,
    s_512_529 * 2 = s_512_528 + v_512_528
&&
    true
;

{
    u_512_529 * f_472_low60_40_low20_0 + v_512_529 * g_472_low60_40_low20_0 = f_472_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_529 * f_472_low60_40_low20_0 + s_512_529 * g_472_low60_40_low20_0 = g_472_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_17 + u_512_529 * (const 64 (2**21)) + v_512_529 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_17 + r_512_529 * (const 64 (2**21)) + s_512_529 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_17,
    f_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_17,
    g_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 529)) <=s delta, delta <=s (const 64 (1 + 2*529)),
    (const 64 (-(2**20))) <=s u_512_529, u_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_529, v_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_529, r_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_529, s_512_529 <=s (const 64 ((2**20))),
    u_512_529 + v_512_529 <=s (const 64 (2**20)),
    u_512_529 - v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 + v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 - v_512_529 <=s (const 64 (2**20)),
    r_512_529 + s_512_529 <=s (const 64 (2**20)),
    r_512_529 - s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 + s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 - s_512_529 <=s (const 64 (2**20)),
    u_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_512_529 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_528_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_16,
sint64 g_472_low60_40_low20_16,
sint64 f_472_low60_40_low20_17,
sint64 g_472_low60_40_low20_17,
sint64 u_512_528,
sint64 v_512_528,
sint64 r_512_528,
sint64 s_512_528,
sint64 u_512_529,
sint64 v_512_529,
sint64 r_512_529,
sint64 s_512_529,
bit ne
)={
    u_512_528 * f_472_low60_40_low20_0 + v_512_528 * g_472_low60_40_low20_0 = f_472_low60_40_low20_16 * (-(2**20)),
    r_512_528 * f_472_low60_40_low20_0 + s_512_528 * g_472_low60_40_low20_0 = g_472_low60_40_low20_16 * (-(2**20))
&&
    u_512_528 * f_472_low60_40_low20_0 + v_512_528 * g_472_low60_40_low20_0 = f_472_low60_40_low20_16 * (const 64 (-(2**20))),
    r_512_528 * f_472_low60_40_low20_0 + s_512_528 * g_472_low60_40_low20_0 = g_472_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_16 + u_512_528 * (const 64 (2**21)) + v_512_528 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_16 + r_512_528 * (const 64 (2**21)) + s_512_528 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_16,
    f_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_16,
    g_472_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 528)) <=s delta, delta <=s (const 64 (1 + 2*528)),
    (const 64 (-(2**20))) <=s u_512_528, u_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_528, v_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_528, r_512_528 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_528, s_512_528 <=s (const 64 ((2**20))),
    u_512_528 + v_512_528 <=s (const 64 (2**20)),
    u_512_528 - v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 + v_512_528 <=s (const 64 (2**20)),
    (const 64 0) - u_512_528 - v_512_528 <=s (const 64 (2**20)),
    r_512_528 + s_512_528 <=s (const 64 (2**20)),
    r_512_528 - s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 + s_512_528 <=s (const 64 (2**20)),
    (const 64 0) - r_512_528 - s_512_528 <=s (const 64 (2**20)),
    u_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_512_528 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_512_528 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise c
assume
g_472_low60_40_low20_16 = 1 (mod 2)
&&
g_472_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_17 g_472_low60_40_low20_16;
mov u_512_529 r_512_528;
mov v_512_529 s_512_528;

subs dc g_472_low60_40_low20_17 g_472_low60_40_low20_16 f_472_low60_40_low20_16;
asr g_472_low60_40_low20_17 g_472_low60_40_low20_17 1;
subs dc r_512_529 r_512_528 u_512_528;
asr r_512_529 r_512_529 1;
subs dc s_512_529 s_512_528 v_512_528;
asr s_512_529 s_512_529 1;
assert
    true
&&
    f_472_low60_40_low20_17 = g_472_low60_40_low20_16,
    u_512_529 = r_512_528,
    v_512_529 = s_512_528,
    g_472_low60_40_low20_17 * (const 64 2) = g_472_low60_40_low20_16 - f_472_low60_40_low20_16,
    r_512_529 * (const 64 2) = r_512_528 - u_512_528,
    s_512_529 * (const 64 2) = s_512_528 - v_512_528
;

assume
    f_472_low60_40_low20_17 = g_472_low60_40_low20_16,
    u_512_529 = r_512_528,
    v_512_529 = s_512_528,
    g_472_low60_40_low20_17 * 2 = g_472_low60_40_low20_16 - f_472_low60_40_low20_16,
    r_512_529 * 2 = r_512_528 - u_512_528,
    s_512_529 * 2 = s_512_528 - v_512_528
&&
    true
;

{
    u_512_529 * f_472_low60_40_low20_0 + v_512_529 * g_472_low60_40_low20_0 = f_472_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_529 * f_472_low60_40_low20_0 + s_512_529 * g_472_low60_40_low20_0 = g_472_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_17 + u_512_529 * (const 64 (2**21)) + v_512_529 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_17 + r_512_529 * (const 64 (2**21)) + s_512_529 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_17,
    f_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_17,
    g_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 529)) <=s delta, delta <=s (const 64 (1 + 2*529)),
    (const 64 (-(2**20))) <=s u_512_529, u_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_529, v_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_529, r_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_529, s_512_529 <=s (const 64 ((2**20))),
    u_512_529 + v_512_529 <=s (const 64 (2**20)),
    u_512_529 - v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 + v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 - v_512_529 <=s (const 64 (2**20)),
    r_512_529 + s_512_529 <=s (const 64 (2**20)),
    r_512_529 - s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 + s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 - s_512_529 <=s (const 64 (2**20)),
    u_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_512_529 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_529_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_17,
sint64 g_472_low60_40_low20_17,
sint64 f_472_low60_40_low20_18,
sint64 g_472_low60_40_low20_18,
sint64 u_512_529,
sint64 v_512_529,
sint64 r_512_529,
sint64 s_512_529,
sint64 u_512_530,
sint64 v_512_530,
sint64 r_512_530,
sint64 s_512_530,
bit ne
)={
    u_512_529 * f_472_low60_40_low20_0 + v_512_529 * g_472_low60_40_low20_0 = f_472_low60_40_low20_17 * (-(2**20)),
    r_512_529 * f_472_low60_40_low20_0 + s_512_529 * g_472_low60_40_low20_0 = g_472_low60_40_low20_17 * (-(2**20))
&&
    u_512_529 * f_472_low60_40_low20_0 + v_512_529 * g_472_low60_40_low20_0 = f_472_low60_40_low20_17 * (const 64 (-(2**20))),
    r_512_529 * f_472_low60_40_low20_0 + s_512_529 * g_472_low60_40_low20_0 = g_472_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_17 + u_512_529 * (const 64 (2**21)) + v_512_529 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_17 + r_512_529 * (const 64 (2**21)) + s_512_529 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_17,
    f_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_17,
    g_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 529)) <=s delta, delta <=s (const 64 (1 + 2*529)),
    (const 64 (-(2**20))) <=s u_512_529, u_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_529, v_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_529, r_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_529, s_512_529 <=s (const 64 ((2**20))),
    u_512_529 + v_512_529 <=s (const 64 (2**20)),
    u_512_529 - v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 + v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 - v_512_529 <=s (const 64 (2**20)),
    r_512_529 + s_512_529 <=s (const 64 (2**20)),
    r_512_529 - s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 + s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 - s_512_529 <=s (const 64 (2**20)),
    u_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_512_529 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise a
assume
g_472_low60_40_low20_17 = 0 (mod 2)
&&
g_472_low60_40_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_18 f_472_low60_40_low20_17;
mov u_512_530 u_512_529;
mov v_512_530 v_512_529;

asr g_472_low60_40_low20_18 g_472_low60_40_low20_17 1;
asr r_512_530 r_512_529 1;
asr s_512_530 s_512_529 1;
assert
    true
&&
    f_472_low60_40_low20_18 = f_472_low60_40_low20_17,
    u_512_530 = u_512_529,
    v_512_530 = v_512_529,
    g_472_low60_40_low20_18 * (const 64 2) = g_472_low60_40_low20_17,
    r_512_530 * (const 64 2) = r_512_529,
    s_512_530 * (const 64 2) = s_512_529
;

assume
    f_472_low60_40_low20_18 = f_472_low60_40_low20_17,
    u_512_530 = u_512_529,
    v_512_530 = v_512_529,
    g_472_low60_40_low20_18 * 2 = g_472_low60_40_low20_17,
    r_512_530 * 2 = r_512_529,
    s_512_530 * 2 = s_512_529
&&
    true
;

{
    u_512_530 * f_472_low60_40_low20_0 + v_512_530 * g_472_low60_40_low20_0 = f_472_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_530 * f_472_low60_40_low20_0 + s_512_530 * g_472_low60_40_low20_0 = g_472_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_18 + u_512_530 * (const 64 (2**21)) + v_512_530 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_18 + r_512_530 * (const 64 (2**21)) + s_512_530 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_18,
    f_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_18,
    g_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 530)) <=s delta, delta <=s (const 64 (1 + 2*530)),
    (const 64 (-(2**20))) <=s u_512_530, u_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_530, v_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_530, r_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_530, s_512_530 <=s (const 64 ((2**20))),
    u_512_530 + v_512_530 <=s (const 64 (2**20)),
    u_512_530 - v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 + v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 - v_512_530 <=s (const 64 (2**20)),
    r_512_530 + s_512_530 <=s (const 64 (2**20)),
    r_512_530 - s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 + s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 - s_512_530 <=s (const 64 (2**20)),
    u_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_512_530 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_529_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_17,
sint64 g_472_low60_40_low20_17,
sint64 f_472_low60_40_low20_18,
sint64 g_472_low60_40_low20_18,
sint64 u_512_529,
sint64 v_512_529,
sint64 r_512_529,
sint64 s_512_529,
sint64 u_512_530,
sint64 v_512_530,
sint64 r_512_530,
sint64 s_512_530,
bit ne
)={
    u_512_529 * f_472_low60_40_low20_0 + v_512_529 * g_472_low60_40_low20_0 = f_472_low60_40_low20_17 * (-(2**20)),
    r_512_529 * f_472_low60_40_low20_0 + s_512_529 * g_472_low60_40_low20_0 = g_472_low60_40_low20_17 * (-(2**20))
&&
    u_512_529 * f_472_low60_40_low20_0 + v_512_529 * g_472_low60_40_low20_0 = f_472_low60_40_low20_17 * (const 64 (-(2**20))),
    r_512_529 * f_472_low60_40_low20_0 + s_512_529 * g_472_low60_40_low20_0 = g_472_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_17 + u_512_529 * (const 64 (2**21)) + v_512_529 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_17 + r_512_529 * (const 64 (2**21)) + s_512_529 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_17,
    f_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_17,
    g_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 529)) <=s delta, delta <=s (const 64 (1 + 2*529)),
    (const 64 (-(2**20))) <=s u_512_529, u_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_529, v_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_529, r_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_529, s_512_529 <=s (const 64 ((2**20))),
    u_512_529 + v_512_529 <=s (const 64 (2**20)),
    u_512_529 - v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 + v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 - v_512_529 <=s (const 64 (2**20)),
    r_512_529 + s_512_529 <=s (const 64 (2**20)),
    r_512_529 - s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 + s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 - s_512_529 <=s (const 64 (2**20)),
    u_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_512_529 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise b
assume
g_472_low60_40_low20_17 = 1 (mod 2)
&&
g_472_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_18 f_472_low60_40_low20_17;
mov u_512_530 u_512_529;
mov v_512_530 v_512_529;

add g_472_low60_40_low20_18 g_472_low60_40_low20_17 f_472_low60_40_low20_17;
asr g_472_low60_40_low20_18 g_472_low60_40_low20_18 1;
add r_512_530 r_512_529 u_512_529;
asr r_512_530 r_512_530 1;
add s_512_530 s_512_529 v_512_529;
asr s_512_530 s_512_530 1;
assert
    true
&&
    f_472_low60_40_low20_18 = f_472_low60_40_low20_17,
    u_512_530 = u_512_529,
    v_512_530 = v_512_529,
    g_472_low60_40_low20_18 * (const 64 2) = g_472_low60_40_low20_17 + f_472_low60_40_low20_17,
    r_512_530 * (const 64 2) = r_512_529 + u_512_529,
    s_512_530 * (const 64 2) = s_512_529 + v_512_529
;

assume
    f_472_low60_40_low20_18 = f_472_low60_40_low20_17,
    u_512_530 = u_512_529,
    v_512_530 = v_512_529,
    g_472_low60_40_low20_18 * 2 = g_472_low60_40_low20_17 + f_472_low60_40_low20_17,
    r_512_530 * 2 = r_512_529 + u_512_529,
    s_512_530 * 2 = s_512_529 + v_512_529
&&
    true
;

{
    u_512_530 * f_472_low60_40_low20_0 + v_512_530 * g_472_low60_40_low20_0 = f_472_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_530 * f_472_low60_40_low20_0 + s_512_530 * g_472_low60_40_low20_0 = g_472_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_18 + u_512_530 * (const 64 (2**21)) + v_512_530 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_18 + r_512_530 * (const 64 (2**21)) + s_512_530 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_18,
    f_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_18,
    g_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 530)) <=s delta, delta <=s (const 64 (1 + 2*530)),
    (const 64 (-(2**20))) <=s u_512_530, u_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_530, v_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_530, r_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_530, s_512_530 <=s (const 64 ((2**20))),
    u_512_530 + v_512_530 <=s (const 64 (2**20)),
    u_512_530 - v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 + v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 - v_512_530 <=s (const 64 (2**20)),
    r_512_530 + s_512_530 <=s (const 64 (2**20)),
    r_512_530 - s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 + s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 - s_512_530 <=s (const 64 (2**20)),
    u_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_512_530 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_529_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_17,
sint64 g_472_low60_40_low20_17,
sint64 f_472_low60_40_low20_18,
sint64 g_472_low60_40_low20_18,
sint64 u_512_529,
sint64 v_512_529,
sint64 r_512_529,
sint64 s_512_529,
sint64 u_512_530,
sint64 v_512_530,
sint64 r_512_530,
sint64 s_512_530,
bit ne
)={
    u_512_529 * f_472_low60_40_low20_0 + v_512_529 * g_472_low60_40_low20_0 = f_472_low60_40_low20_17 * (-(2**20)),
    r_512_529 * f_472_low60_40_low20_0 + s_512_529 * g_472_low60_40_low20_0 = g_472_low60_40_low20_17 * (-(2**20))
&&
    u_512_529 * f_472_low60_40_low20_0 + v_512_529 * g_472_low60_40_low20_0 = f_472_low60_40_low20_17 * (const 64 (-(2**20))),
    r_512_529 * f_472_low60_40_low20_0 + s_512_529 * g_472_low60_40_low20_0 = g_472_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_17 + u_512_529 * (const 64 (2**21)) + v_512_529 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_17 + r_512_529 * (const 64 (2**21)) + s_512_529 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_17,
    f_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_17,
    g_472_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 529)) <=s delta, delta <=s (const 64 (1 + 2*529)),
    (const 64 (-(2**20))) <=s u_512_529, u_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_529, v_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_529, r_512_529 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_529, s_512_529 <=s (const 64 ((2**20))),
    u_512_529 + v_512_529 <=s (const 64 (2**20)),
    u_512_529 - v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 + v_512_529 <=s (const 64 (2**20)),
    (const 64 0) - u_512_529 - v_512_529 <=s (const 64 (2**20)),
    r_512_529 + s_512_529 <=s (const 64 (2**20)),
    r_512_529 - s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 + s_512_529 <=s (const 64 (2**20)),
    (const 64 0) - r_512_529 - s_512_529 <=s (const 64 (2**20)),
    u_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_512_529 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_512_529 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise c
assume
g_472_low60_40_low20_17 = 1 (mod 2)
&&
g_472_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_18 g_472_low60_40_low20_17;
mov u_512_530 r_512_529;
mov v_512_530 s_512_529;

subs dc g_472_low60_40_low20_18 g_472_low60_40_low20_17 f_472_low60_40_low20_17;
asr g_472_low60_40_low20_18 g_472_low60_40_low20_18 1;
subs dc r_512_530 r_512_529 u_512_529;
asr r_512_530 r_512_530 1;
subs dc s_512_530 s_512_529 v_512_529;
asr s_512_530 s_512_530 1;
assert
    true
&&
    f_472_low60_40_low20_18 = g_472_low60_40_low20_17,
    u_512_530 = r_512_529,
    v_512_530 = s_512_529,
    g_472_low60_40_low20_18 * (const 64 2) = g_472_low60_40_low20_17 - f_472_low60_40_low20_17,
    r_512_530 * (const 64 2) = r_512_529 - u_512_529,
    s_512_530 * (const 64 2) = s_512_529 - v_512_529
;

assume
    f_472_low60_40_low20_18 = g_472_low60_40_low20_17,
    u_512_530 = r_512_529,
    v_512_530 = s_512_529,
    g_472_low60_40_low20_18 * 2 = g_472_low60_40_low20_17 - f_472_low60_40_low20_17,
    r_512_530 * 2 = r_512_529 - u_512_529,
    s_512_530 * 2 = s_512_529 - v_512_529
&&
    true
;

{
    u_512_530 * f_472_low60_40_low20_0 + v_512_530 * g_472_low60_40_low20_0 = f_472_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_530 * f_472_low60_40_low20_0 + s_512_530 * g_472_low60_40_low20_0 = g_472_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_18 + u_512_530 * (const 64 (2**21)) + v_512_530 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_18 + r_512_530 * (const 64 (2**21)) + s_512_530 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_18,
    f_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_18,
    g_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 530)) <=s delta, delta <=s (const 64 (1 + 2*530)),
    (const 64 (-(2**20))) <=s u_512_530, u_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_530, v_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_530, r_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_530, s_512_530 <=s (const 64 ((2**20))),
    u_512_530 + v_512_530 <=s (const 64 (2**20)),
    u_512_530 - v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 + v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 - v_512_530 <=s (const 64 (2**20)),
    r_512_530 + s_512_530 <=s (const 64 (2**20)),
    r_512_530 - s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 + s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 - s_512_530 <=s (const 64 (2**20)),
    u_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_512_530 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_530_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_18,
sint64 g_472_low60_40_low20_18,
sint64 f_472_low60_40_low20_19,
sint64 g_472_low60_40_low20_19,
sint64 u_512_530,
sint64 v_512_530,
sint64 r_512_530,
sint64 s_512_530,
sint64 u_512_531,
sint64 v_512_531,
sint64 r_512_531,
sint64 s_512_531,
bit ne
)={
    u_512_530 * f_472_low60_40_low20_0 + v_512_530 * g_472_low60_40_low20_0 = f_472_low60_40_low20_18 * (-(2**20)),
    r_512_530 * f_472_low60_40_low20_0 + s_512_530 * g_472_low60_40_low20_0 = g_472_low60_40_low20_18 * (-(2**20))
&&
    u_512_530 * f_472_low60_40_low20_0 + v_512_530 * g_472_low60_40_low20_0 = f_472_low60_40_low20_18 * (const 64 (-(2**20))),
    r_512_530 * f_472_low60_40_low20_0 + s_512_530 * g_472_low60_40_low20_0 = g_472_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_18 + u_512_530 * (const 64 (2**21)) + v_512_530 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_18 + r_512_530 * (const 64 (2**21)) + s_512_530 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_18,
    f_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_18,
    g_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 530)) <=s delta, delta <=s (const 64 (1 + 2*530)),
    (const 64 (-(2**20))) <=s u_512_530, u_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_530, v_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_530, r_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_530, s_512_530 <=s (const 64 ((2**20))),
    u_512_530 + v_512_530 <=s (const 64 (2**20)),
    u_512_530 - v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 + v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 - v_512_530 <=s (const 64 (2**20)),
    r_512_530 + s_512_530 <=s (const 64 (2**20)),
    r_512_530 - s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 + s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 - s_512_530 <=s (const 64 (2**20)),
    u_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_512_530 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise a
assume
g_472_low60_40_low20_18 = 0 (mod 2)
&&
g_472_low60_40_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_472_low60_40_low20_19 f_472_low60_40_low20_18;
mov u_512_531 u_512_530;
mov v_512_531 v_512_530;

asr g_472_low60_40_low20_19 g_472_low60_40_low20_18 1;
asr r_512_531 r_512_530 1;
asr s_512_531 s_512_530 1;
assert
    true
&&
    f_472_low60_40_low20_19 = f_472_low60_40_low20_18,
    u_512_531 = u_512_530,
    v_512_531 = v_512_530,
    g_472_low60_40_low20_19 * (const 64 2) = g_472_low60_40_low20_18,
    r_512_531 * (const 64 2) = r_512_530,
    s_512_531 * (const 64 2) = s_512_530
;

assume
    f_472_low60_40_low20_19 = f_472_low60_40_low20_18,
    u_512_531 = u_512_530,
    v_512_531 = v_512_530,
    g_472_low60_40_low20_19 * 2 = g_472_low60_40_low20_18,
    r_512_531 * 2 = r_512_530,
    s_512_531 * 2 = s_512_530
&&
    true
;

{
    u_512_531 * f_472_low60_40_low20_0 + v_512_531 * g_472_low60_40_low20_0 = f_472_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_531 * f_472_low60_40_low20_0 + s_512_531 * g_472_low60_40_low20_0 = g_472_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_19 + u_512_531 * (const 64 (2**21)) + v_512_531 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_19 + r_512_531 * (const 64 (2**21)) + s_512_531 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_19,
    f_472_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_19,
    g_472_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 531)) <=s delta, delta <=s (const 64 (1 + 2*531)),
    (const 64 (-(2**20))) <=s u_512_531, u_512_531 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_531, v_512_531 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_531, r_512_531 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_531, s_512_531 <=s (const 64 ((2**20))),
    u_512_531 + v_512_531 <=s (const 64 (2**20)),
    u_512_531 - v_512_531 <=s (const 64 (2**20)),
    (const 64 0) - u_512_531 + v_512_531 <=s (const 64 (2**20)),
    (const 64 0) - u_512_531 - v_512_531 <=s (const 64 (2**20)),
    r_512_531 + s_512_531 <=s (const 64 (2**20)),
    r_512_531 - s_512_531 <=s (const 64 (2**20)),
    (const 64 0) - r_512_531 + s_512_531 <=s (const 64 (2**20)),
    (const 64 0) - r_512_531 - s_512_531 <=s (const 64 (2**20)),
    u_512_531 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_512_531 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_512_531 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_512_531 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_530_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_18,
sint64 g_472_low60_40_low20_18,
sint64 f_472_low60_40_low20_19,
sint64 g_472_low60_40_low20_19,
sint64 u_512_530,
sint64 v_512_530,
sint64 r_512_530,
sint64 s_512_530,
sint64 u_512_531,
sint64 v_512_531,
sint64 r_512_531,
sint64 s_512_531,
bit ne
)={
    u_512_530 * f_472_low60_40_low20_0 + v_512_530 * g_472_low60_40_low20_0 = f_472_low60_40_low20_18 * (-(2**20)),
    r_512_530 * f_472_low60_40_low20_0 + s_512_530 * g_472_low60_40_low20_0 = g_472_low60_40_low20_18 * (-(2**20))
&&
    u_512_530 * f_472_low60_40_low20_0 + v_512_530 * g_472_low60_40_low20_0 = f_472_low60_40_low20_18 * (const 64 (-(2**20))),
    r_512_530 * f_472_low60_40_low20_0 + s_512_530 * g_472_low60_40_low20_0 = g_472_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_18 + u_512_530 * (const 64 (2**21)) + v_512_530 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_18 + r_512_530 * (const 64 (2**21)) + s_512_530 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_18,
    f_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_18,
    g_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 530)) <=s delta, delta <=s (const 64 (1 + 2*530)),
    (const 64 (-(2**20))) <=s u_512_530, u_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_530, v_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_530, r_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_530, s_512_530 <=s (const 64 ((2**20))),
    u_512_530 + v_512_530 <=s (const 64 (2**20)),
    u_512_530 - v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 + v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 - v_512_530 <=s (const 64 (2**20)),
    r_512_530 + s_512_530 <=s (const 64 (2**20)),
    r_512_530 - s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 + s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 - s_512_530 <=s (const 64 (2**20)),
    u_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_512_530 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise b
assume
g_472_low60_40_low20_18 = 1 (mod 2)
&&
g_472_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_19 f_472_low60_40_low20_18;
mov u_512_531 u_512_530;
mov v_512_531 v_512_530;

add g_472_low60_40_low20_19 g_472_low60_40_low20_18 f_472_low60_40_low20_18;
asr g_472_low60_40_low20_19 g_472_low60_40_low20_19 1;
add r_512_531 r_512_530 u_512_530;
asr r_512_531 r_512_531 1;
add s_512_531 s_512_530 v_512_530;
asr s_512_531 s_512_531 1;
assert
    true
&&
    f_472_low60_40_low20_19 = f_472_low60_40_low20_18,
    u_512_531 = u_512_530,
    v_512_531 = v_512_530,
    g_472_low60_40_low20_19 * (const 64 2) = g_472_low60_40_low20_18 + f_472_low60_40_low20_18,
    r_512_531 * (const 64 2) = r_512_530 + u_512_530,
    s_512_531 * (const 64 2) = s_512_530 + v_512_530
;

assume
    f_472_low60_40_low20_19 = f_472_low60_40_low20_18,
    u_512_531 = u_512_530,
    v_512_531 = v_512_530,
    g_472_low60_40_low20_19 * 2 = g_472_low60_40_low20_18 + f_472_low60_40_low20_18,
    r_512_531 * 2 = r_512_530 + u_512_530,
    s_512_531 * 2 = s_512_530 + v_512_530
&&
    true
;

{
    u_512_531 * f_472_low60_40_low20_0 + v_512_531 * g_472_low60_40_low20_0 = f_472_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_531 * f_472_low60_40_low20_0 + s_512_531 * g_472_low60_40_low20_0 = g_472_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_19 + u_512_531 * (const 64 (2**21)) + v_512_531 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_19 + r_512_531 * (const 64 (2**21)) + s_512_531 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_19,
    f_472_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_19,
    g_472_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 531)) <=s delta, delta <=s (const 64 (1 + 2*531)),
    (const 64 (-(2**20))) <=s u_512_531, u_512_531 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_531, v_512_531 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_531, r_512_531 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_531, s_512_531 <=s (const 64 ((2**20))),
    u_512_531 + v_512_531 <=s (const 64 (2**20)),
    u_512_531 - v_512_531 <=s (const 64 (2**20)),
    (const 64 0) - u_512_531 + v_512_531 <=s (const 64 (2**20)),
    (const 64 0) - u_512_531 - v_512_531 <=s (const 64 (2**20)),
    r_512_531 + s_512_531 <=s (const 64 (2**20)),
    r_512_531 - s_512_531 <=s (const 64 (2**20)),
    (const 64 0) - r_512_531 + s_512_531 <=s (const 64 (2**20)),
    (const 64 0) - r_512_531 - s_512_531 <=s (const 64 (2**20)),
    u_512_531 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_512_531 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_512_531 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_512_531 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_530_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_18,
sint64 g_472_low60_40_low20_18,
sint64 f_472_low60_40_low20_19,
sint64 g_472_low60_40_low20_19,
sint64 u_512_530,
sint64 v_512_530,
sint64 r_512_530,
sint64 s_512_530,
sint64 u_512_531,
sint64 v_512_531,
sint64 r_512_531,
sint64 s_512_531,
bit ne
)={
    u_512_530 * f_472_low60_40_low20_0 + v_512_530 * g_472_low60_40_low20_0 = f_472_low60_40_low20_18 * (-(2**20)),
    r_512_530 * f_472_low60_40_low20_0 + s_512_530 * g_472_low60_40_low20_0 = g_472_low60_40_low20_18 * (-(2**20))
&&
    u_512_530 * f_472_low60_40_low20_0 + v_512_530 * g_472_low60_40_low20_0 = f_472_low60_40_low20_18 * (const 64 (-(2**20))),
    r_512_530 * f_472_low60_40_low20_0 + s_512_530 * g_472_low60_40_low20_0 = g_472_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_18 + u_512_530 * (const 64 (2**21)) + v_512_530 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_18 + r_512_530 * (const 64 (2**21)) + s_512_530 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_18,
    f_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_18,
    g_472_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 530)) <=s delta, delta <=s (const 64 (1 + 2*530)),
    (const 64 (-(2**20))) <=s u_512_530, u_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_530, v_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_530, r_512_530 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_530, s_512_530 <=s (const 64 ((2**20))),
    u_512_530 + v_512_530 <=s (const 64 (2**20)),
    u_512_530 - v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 + v_512_530 <=s (const 64 (2**20)),
    (const 64 0) - u_512_530 - v_512_530 <=s (const 64 (2**20)),
    r_512_530 + s_512_530 <=s (const 64 (2**20)),
    r_512_530 - s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 + s_512_530 <=s (const 64 (2**20)),
    (const 64 0) - r_512_530 - s_512_530 <=s (const 64 (2**20)),
    u_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_512_530 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_512_530 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise c
assume
g_472_low60_40_low20_18 = 1 (mod 2)
&&
g_472_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_472_low60_40_low20_19 g_472_low60_40_low20_18;
mov u_512_531 r_512_530;
mov v_512_531 s_512_530;

subs dc g_472_low60_40_low20_19 g_472_low60_40_low20_18 f_472_low60_40_low20_18;
asr g_472_low60_40_low20_19 g_472_low60_40_low20_19 1;
subs dc r_512_531 r_512_530 u_512_530;
asr r_512_531 r_512_531 1;
subs dc s_512_531 s_512_530 v_512_530;
asr s_512_531 s_512_531 1;
assert
    true
&&
    f_472_low60_40_low20_19 = g_472_low60_40_low20_18,
    u_512_531 = r_512_530,
    v_512_531 = s_512_530,
    g_472_low60_40_low20_19 * (const 64 2) = g_472_low60_40_low20_18 - f_472_low60_40_low20_18,
    r_512_531 * (const 64 2) = r_512_530 - u_512_530,
    s_512_531 * (const 64 2) = s_512_530 - v_512_530
;

assume
    f_472_low60_40_low20_19 = g_472_low60_40_low20_18,
    u_512_531 = r_512_530,
    v_512_531 = s_512_530,
    g_472_low60_40_low20_19 * 2 = g_472_low60_40_low20_18 - f_472_low60_40_low20_18,
    r_512_531 * 2 = r_512_530 - u_512_530,
    s_512_531 * 2 = s_512_530 - v_512_530
&&
    true
;

{
    u_512_531 * f_472_low60_40_low20_0 + v_512_531 * g_472_low60_40_low20_0 = f_472_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_531 * f_472_low60_40_low20_0 + s_512_531 * g_472_low60_40_low20_0 = g_472_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_19 + u_512_531 * (const 64 (2**21)) + v_512_531 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_19 + r_512_531 * (const 64 (2**21)) + s_512_531 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_19,
    f_472_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_19,
    g_472_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 531)) <=s delta, delta <=s (const 64 (1 + 2*531)),
    (const 64 (-(2**20))) <=s u_512_531, u_512_531 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_531, v_512_531 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_531, r_512_531 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_531, s_512_531 <=s (const 64 ((2**20))),
    u_512_531 + v_512_531 <=s (const 64 (2**20)),
    u_512_531 - v_512_531 <=s (const 64 (2**20)),
    (const 64 0) - u_512_531 + v_512_531 <=s (const 64 (2**20)),
    (const 64 0) - u_512_531 - v_512_531 <=s (const 64 (2**20)),
    r_512_531 + s_512_531 <=s (const 64 (2**20)),
    r_512_531 - s_512_531 <=s (const 64 (2**20)),
    (const 64 0) - r_512_531 + s_512_531 <=s (const 64 (2**20)),
    (const 64 0) - r_512_531 - s_512_531 <=s (const 64 (2**20)),
    u_512_531 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_512_531 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_512_531 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_512_531 = (const 64 0) (mod (const 64 (2**(20-19))))
}

