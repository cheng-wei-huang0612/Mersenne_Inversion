proc divstep_276_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_1,
sint64 g_236_low60_40_low20_1,
sint64 u_276_276,
sint64 v_276_276,
sint64 r_276_276,
sint64 s_276_276,
sint64 u_276_277,
sint64 v_276_277,
sint64 r_276_277,
sint64 s_276_277,
bit ne
)={
    u_276_276 * f_236_low60_40_low20_0 + v_276_276 * g_236_low60_40_low20_0 = f_236_low60_40_low20_0 * (-(2**20)),
    r_276_276 * f_236_low60_40_low20_0 + s_276_276 * g_236_low60_40_low20_0 = g_236_low60_40_low20_0 * (-(2**20))
&&
    u_276_276 * f_236_low60_40_low20_0 + v_276_276 * g_236_low60_40_low20_0 = f_236_low60_40_low20_0 * (const 64 (-(2**20))),
    r_276_276 * f_236_low60_40_low20_0 + s_276_276 * g_236_low60_40_low20_0 = g_236_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_0 + u_276_276 * (const 64 (2**21)) + v_276_276 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_0 + r_276_276 * (const 64 (2**21)) + s_276_276 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 276)) <=s delta, delta <=s (const 64 (1 + 2*276)),
    u_276_276 = (const 64 (-(2**20))),
    v_276_276 = (const 64 (0)),
    r_276_276 = (const 64 (0)),
    s_276_276 = (const 64 (-(2**20)))
}



// divsteps
// step276

// premise a
assume
g_236_low60_40_low20_0 = 0 (mod 2)
&&
g_236_low60_40_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_236_low60_40_low20_1 f_236_low60_40_low20_0;
mov u_276_277 u_276_276;
mov v_276_277 v_276_276;

asr g_236_low60_40_low20_1 g_236_low60_40_low20_0 1;
asr r_276_277 r_276_276 1;
asr s_276_277 s_276_276 1;
assert
    true
&&
    f_236_low60_40_low20_1 = f_236_low60_40_low20_0,
    u_276_277 = u_276_276,
    v_276_277 = v_276_276,
    g_236_low60_40_low20_1 * (const 64 2) = g_236_low60_40_low20_0,
    r_276_277 * (const 64 2) = r_276_276,
    s_276_277 * (const 64 2) = s_276_276
;

assume
    f_236_low60_40_low20_1 = f_236_low60_40_low20_0,
    u_276_277 = u_276_276,
    v_276_277 = v_276_276,
    g_236_low60_40_low20_1 * 2 = g_236_low60_40_low20_0,
    r_276_277 * 2 = r_276_276,
    s_276_277 * 2 = s_276_276
&&
    true
;

{
    u_276_277 * f_236_low60_40_low20_0 + v_276_277 * g_236_low60_40_low20_0 = f_236_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_277 * f_236_low60_40_low20_0 + s_276_277 * g_236_low60_40_low20_0 = g_236_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_1 + u_276_277 * (const 64 (2**21)) + v_276_277 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_1 + r_276_277 * (const 64 (2**21)) + s_276_277 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_1,
    f_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_1,
    g_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 277)) <=s delta, delta <=s (const 64 (1 + 2*277)),
    (const 64 (-(2**20))) <=s u_276_277, u_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_277, v_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_277, r_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_277, s_276_277 <=s (const 64 ((2**20)-1)),
    u_276_277 + v_276_277 <=s (const 64 (2**20)),
    u_276_277 - v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 + v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 - v_276_277 <=s (const 64 (2**20)),
    r_276_277 + s_276_277 <=s (const 64 (2**20)),
    r_276_277 - s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 + s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 - s_276_277 <=s (const 64 (2**20)),
    u_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_276_277 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_276_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_1,
sint64 g_236_low60_40_low20_1,
sint64 u_276_276,
sint64 v_276_276,
sint64 r_276_276,
sint64 s_276_276,
sint64 u_276_277,
sint64 v_276_277,
sint64 r_276_277,
sint64 s_276_277,
bit ne
)={
    u_276_276 * f_236_low60_40_low20_0 + v_276_276 * g_236_low60_40_low20_0 = f_236_low60_40_low20_0 * (-(2**20)),
    r_276_276 * f_236_low60_40_low20_0 + s_276_276 * g_236_low60_40_low20_0 = g_236_low60_40_low20_0 * (-(2**20))
&&
    u_276_276 * f_236_low60_40_low20_0 + v_276_276 * g_236_low60_40_low20_0 = f_236_low60_40_low20_0 * (const 64 (-(2**20))),
    r_276_276 * f_236_low60_40_low20_0 + s_276_276 * g_236_low60_40_low20_0 = g_236_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_0 + u_276_276 * (const 64 (2**21)) + v_276_276 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_0 + r_276_276 * (const 64 (2**21)) + s_276_276 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 276)) <=s delta, delta <=s (const 64 (1 + 2*276)),
    u_276_276 = (const 64 (-(2**20))),
    v_276_276 = (const 64 (0)),
    r_276_276 = (const 64 (0)),
    s_276_276 = (const 64 (-(2**20)))
}



// divsteps
// step276

// premise b
assume
g_236_low60_40_low20_0 = 1 (mod 2)
&&
g_236_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_1 f_236_low60_40_low20_0;
mov u_276_277 u_276_276;
mov v_276_277 v_276_276;

add g_236_low60_40_low20_1 g_236_low60_40_low20_0 f_236_low60_40_low20_0;
asr g_236_low60_40_low20_1 g_236_low60_40_low20_1 1;
add r_276_277 r_276_276 u_276_276;
asr r_276_277 r_276_277 1;
add s_276_277 s_276_276 v_276_276;
asr s_276_277 s_276_277 1;
assert
    true
&&
    f_236_low60_40_low20_1 = f_236_low60_40_low20_0,
    u_276_277 = u_276_276,
    v_276_277 = v_276_276,
    g_236_low60_40_low20_1 * (const 64 2) = g_236_low60_40_low20_0 + f_236_low60_40_low20_0,
    r_276_277 * (const 64 2) = r_276_276 + u_276_276,
    s_276_277 * (const 64 2) = s_276_276 + v_276_276
;

assume
    f_236_low60_40_low20_1 = f_236_low60_40_low20_0,
    u_276_277 = u_276_276,
    v_276_277 = v_276_276,
    g_236_low60_40_low20_1 * 2 = g_236_low60_40_low20_0 + f_236_low60_40_low20_0,
    r_276_277 * 2 = r_276_276 + u_276_276,
    s_276_277 * 2 = s_276_276 + v_276_276
&&
    true
;

{
    u_276_277 * f_236_low60_40_low20_0 + v_276_277 * g_236_low60_40_low20_0 = f_236_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_277 * f_236_low60_40_low20_0 + s_276_277 * g_236_low60_40_low20_0 = g_236_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_1 + u_276_277 * (const 64 (2**21)) + v_276_277 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_1 + r_276_277 * (const 64 (2**21)) + s_276_277 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_1,
    f_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_1,
    g_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 277)) <=s delta, delta <=s (const 64 (1 + 2*277)),
    (const 64 (-(2**20))) <=s u_276_277, u_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_277, v_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_277, r_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_277, s_276_277 <=s (const 64 ((2**20)-1)),
    u_276_277 + v_276_277 <=s (const 64 (2**20)),
    u_276_277 - v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 + v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 - v_276_277 <=s (const 64 (2**20)),
    r_276_277 + s_276_277 <=s (const 64 (2**20)),
    r_276_277 - s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 + s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 - s_276_277 <=s (const 64 (2**20)),
    u_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_276_277 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_276_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_1,
sint64 g_236_low60_40_low20_1,
sint64 u_276_276,
sint64 v_276_276,
sint64 r_276_276,
sint64 s_276_276,
sint64 u_276_277,
sint64 v_276_277,
sint64 r_276_277,
sint64 s_276_277,
bit ne
)={
    u_276_276 * f_236_low60_40_low20_0 + v_276_276 * g_236_low60_40_low20_0 = f_236_low60_40_low20_0 * (-(2**20)),
    r_276_276 * f_236_low60_40_low20_0 + s_276_276 * g_236_low60_40_low20_0 = g_236_low60_40_low20_0 * (-(2**20))
&&
    u_276_276 * f_236_low60_40_low20_0 + v_276_276 * g_236_low60_40_low20_0 = f_236_low60_40_low20_0 * (const 64 (-(2**20))),
    r_276_276 * f_236_low60_40_low20_0 + s_276_276 * g_236_low60_40_low20_0 = g_236_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_0 + u_276_276 * (const 64 (2**21)) + v_276_276 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_0 + r_276_276 * (const 64 (2**21)) + s_276_276 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 276)) <=s delta, delta <=s (const 64 (1 + 2*276)),
    u_276_276 = (const 64 (-(2**20))),
    v_276_276 = (const 64 (0)),
    r_276_276 = (const 64 (0)),
    s_276_276 = (const 64 (-(2**20)))
}



// divsteps
// step276

// premise c
assume
g_236_low60_40_low20_0 = 1 (mod 2)
&&
g_236_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_1 g_236_low60_40_low20_0;
mov u_276_277 r_276_276;
mov v_276_277 s_276_276;

subs dc g_236_low60_40_low20_1 g_236_low60_40_low20_0 f_236_low60_40_low20_0;
asr g_236_low60_40_low20_1 g_236_low60_40_low20_1 1;
subs dc r_276_277 r_276_276 u_276_276;
asr r_276_277 r_276_277 1;
subs dc s_276_277 s_276_276 v_276_276;
asr s_276_277 s_276_277 1;
assert
    true
&&
    f_236_low60_40_low20_1 = g_236_low60_40_low20_0,
    u_276_277 = r_276_276,
    v_276_277 = s_276_276,
    g_236_low60_40_low20_1 * (const 64 2) = g_236_low60_40_low20_0 - f_236_low60_40_low20_0,
    r_276_277 * (const 64 2) = r_276_276 - u_276_276,
    s_276_277 * (const 64 2) = s_276_276 - v_276_276
;

assume
    f_236_low60_40_low20_1 = g_236_low60_40_low20_0,
    u_276_277 = r_276_276,
    v_276_277 = s_276_276,
    g_236_low60_40_low20_1 * 2 = g_236_low60_40_low20_0 - f_236_low60_40_low20_0,
    r_276_277 * 2 = r_276_276 - u_276_276,
    s_276_277 * 2 = s_276_276 - v_276_276
&&
    true
;

{
    u_276_277 * f_236_low60_40_low20_0 + v_276_277 * g_236_low60_40_low20_0 = f_236_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_277 * f_236_low60_40_low20_0 + s_276_277 * g_236_low60_40_low20_0 = g_236_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_1 + u_276_277 * (const 64 (2**21)) + v_276_277 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_1 + r_276_277 * (const 64 (2**21)) + s_276_277 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_1,
    f_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_1,
    g_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 277)) <=s delta, delta <=s (const 64 (1 + 2*277)),
    (const 64 (-(2**20))) <=s u_276_277, u_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_277, v_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_277, r_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_277, s_276_277 <=s (const 64 ((2**20)-1)),
    u_276_277 + v_276_277 <=s (const 64 (2**20)),
    u_276_277 - v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 + v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 - v_276_277 <=s (const 64 (2**20)),
    r_276_277 + s_276_277 <=s (const 64 (2**20)),
    r_276_277 - s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 + s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 - s_276_277 <=s (const 64 (2**20)),
    u_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_276_277 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_277_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_1,
sint64 g_236_low60_40_low20_1,
sint64 f_236_low60_40_low20_2,
sint64 g_236_low60_40_low20_2,
sint64 u_276_277,
sint64 v_276_277,
sint64 r_276_277,
sint64 s_276_277,
sint64 u_276_278,
sint64 v_276_278,
sint64 r_276_278,
sint64 s_276_278,
bit ne
)={
    u_276_277 * f_236_low60_40_low20_0 + v_276_277 * g_236_low60_40_low20_0 = f_236_low60_40_low20_1 * (-(2**20)),
    r_276_277 * f_236_low60_40_low20_0 + s_276_277 * g_236_low60_40_low20_0 = g_236_low60_40_low20_1 * (-(2**20))
&&
    u_276_277 * f_236_low60_40_low20_0 + v_276_277 * g_236_low60_40_low20_0 = f_236_low60_40_low20_1 * (const 64 (-(2**20))),
    r_276_277 * f_236_low60_40_low20_0 + s_276_277 * g_236_low60_40_low20_0 = g_236_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_1 + u_276_277 * (const 64 (2**21)) + v_276_277 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_1 + r_276_277 * (const 64 (2**21)) + s_276_277 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_1,
    f_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_1,
    g_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 277)) <=s delta, delta <=s (const 64 (1 + 2*277)),
    (const 64 (-(2**20))) <=s u_276_277, u_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_277, v_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_277, r_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_277, s_276_277 <=s (const 64 ((2**20)-1)),
    u_276_277 + v_276_277 <=s (const 64 (2**20)),
    u_276_277 - v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 + v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 - v_276_277 <=s (const 64 (2**20)),
    r_276_277 + s_276_277 <=s (const 64 (2**20)),
    r_276_277 - s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 + s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 - s_276_277 <=s (const 64 (2**20)),
    u_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_276_277 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step277

// premise a
assume
g_236_low60_40_low20_1 = 0 (mod 2)
&&
g_236_low60_40_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_2 f_236_low60_40_low20_1;
mov u_276_278 u_276_277;
mov v_276_278 v_276_277;

asr g_236_low60_40_low20_2 g_236_low60_40_low20_1 1;
asr r_276_278 r_276_277 1;
asr s_276_278 s_276_277 1;
assert
    true
&&
    f_236_low60_40_low20_2 = f_236_low60_40_low20_1,
    u_276_278 = u_276_277,
    v_276_278 = v_276_277,
    g_236_low60_40_low20_2 * (const 64 2) = g_236_low60_40_low20_1,
    r_276_278 * (const 64 2) = r_276_277,
    s_276_278 * (const 64 2) = s_276_277
;

assume
    f_236_low60_40_low20_2 = f_236_low60_40_low20_1,
    u_276_278 = u_276_277,
    v_276_278 = v_276_277,
    g_236_low60_40_low20_2 * 2 = g_236_low60_40_low20_1,
    r_276_278 * 2 = r_276_277,
    s_276_278 * 2 = s_276_277
&&
    true
;

{
    u_276_278 * f_236_low60_40_low20_0 + v_276_278 * g_236_low60_40_low20_0 = f_236_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_278 * f_236_low60_40_low20_0 + s_276_278 * g_236_low60_40_low20_0 = g_236_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_2 + u_276_278 * (const 64 (2**21)) + v_276_278 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_2 + r_276_278 * (const 64 (2**21)) + s_276_278 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_2,
    f_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_2,
    g_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 278)) <=s delta, delta <=s (const 64 (1 + 2*278)),
    (const 64 (-(2**20))) <=s u_276_278, u_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_278, v_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_278, r_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_278, s_276_278 <=s (const 64 ((2**20)-1)),
    u_276_278 + v_276_278 <=s (const 64 (2**20)),
    u_276_278 - v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 + v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 - v_276_278 <=s (const 64 (2**20)),
    r_276_278 + s_276_278 <=s (const 64 (2**20)),
    r_276_278 - s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 + s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 - s_276_278 <=s (const 64 (2**20)),
    u_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_276_278 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_277_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_1,
sint64 g_236_low60_40_low20_1,
sint64 f_236_low60_40_low20_2,
sint64 g_236_low60_40_low20_2,
sint64 u_276_277,
sint64 v_276_277,
sint64 r_276_277,
sint64 s_276_277,
sint64 u_276_278,
sint64 v_276_278,
sint64 r_276_278,
sint64 s_276_278,
bit ne
)={
    u_276_277 * f_236_low60_40_low20_0 + v_276_277 * g_236_low60_40_low20_0 = f_236_low60_40_low20_1 * (-(2**20)),
    r_276_277 * f_236_low60_40_low20_0 + s_276_277 * g_236_low60_40_low20_0 = g_236_low60_40_low20_1 * (-(2**20))
&&
    u_276_277 * f_236_low60_40_low20_0 + v_276_277 * g_236_low60_40_low20_0 = f_236_low60_40_low20_1 * (const 64 (-(2**20))),
    r_276_277 * f_236_low60_40_low20_0 + s_276_277 * g_236_low60_40_low20_0 = g_236_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_1 + u_276_277 * (const 64 (2**21)) + v_276_277 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_1 + r_276_277 * (const 64 (2**21)) + s_276_277 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_1,
    f_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_1,
    g_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 277)) <=s delta, delta <=s (const 64 (1 + 2*277)),
    (const 64 (-(2**20))) <=s u_276_277, u_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_277, v_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_277, r_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_277, s_276_277 <=s (const 64 ((2**20)-1)),
    u_276_277 + v_276_277 <=s (const 64 (2**20)),
    u_276_277 - v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 + v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 - v_276_277 <=s (const 64 (2**20)),
    r_276_277 + s_276_277 <=s (const 64 (2**20)),
    r_276_277 - s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 + s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 - s_276_277 <=s (const 64 (2**20)),
    u_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_276_277 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step277

// premise b
assume
g_236_low60_40_low20_1 = 1 (mod 2)
&&
g_236_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_2 f_236_low60_40_low20_1;
mov u_276_278 u_276_277;
mov v_276_278 v_276_277;

add g_236_low60_40_low20_2 g_236_low60_40_low20_1 f_236_low60_40_low20_1;
asr g_236_low60_40_low20_2 g_236_low60_40_low20_2 1;
add r_276_278 r_276_277 u_276_277;
asr r_276_278 r_276_278 1;
add s_276_278 s_276_277 v_276_277;
asr s_276_278 s_276_278 1;
assert
    true
&&
    f_236_low60_40_low20_2 = f_236_low60_40_low20_1,
    u_276_278 = u_276_277,
    v_276_278 = v_276_277,
    g_236_low60_40_low20_2 * (const 64 2) = g_236_low60_40_low20_1 + f_236_low60_40_low20_1,
    r_276_278 * (const 64 2) = r_276_277 + u_276_277,
    s_276_278 * (const 64 2) = s_276_277 + v_276_277
;

assume
    f_236_low60_40_low20_2 = f_236_low60_40_low20_1,
    u_276_278 = u_276_277,
    v_276_278 = v_276_277,
    g_236_low60_40_low20_2 * 2 = g_236_low60_40_low20_1 + f_236_low60_40_low20_1,
    r_276_278 * 2 = r_276_277 + u_276_277,
    s_276_278 * 2 = s_276_277 + v_276_277
&&
    true
;

{
    u_276_278 * f_236_low60_40_low20_0 + v_276_278 * g_236_low60_40_low20_0 = f_236_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_278 * f_236_low60_40_low20_0 + s_276_278 * g_236_low60_40_low20_0 = g_236_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_2 + u_276_278 * (const 64 (2**21)) + v_276_278 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_2 + r_276_278 * (const 64 (2**21)) + s_276_278 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_2,
    f_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_2,
    g_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 278)) <=s delta, delta <=s (const 64 (1 + 2*278)),
    (const 64 (-(2**20))) <=s u_276_278, u_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_278, v_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_278, r_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_278, s_276_278 <=s (const 64 ((2**20)-1)),
    u_276_278 + v_276_278 <=s (const 64 (2**20)),
    u_276_278 - v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 + v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 - v_276_278 <=s (const 64 (2**20)),
    r_276_278 + s_276_278 <=s (const 64 (2**20)),
    r_276_278 - s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 + s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 - s_276_278 <=s (const 64 (2**20)),
    u_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_276_278 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_277_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_1,
sint64 g_236_low60_40_low20_1,
sint64 f_236_low60_40_low20_2,
sint64 g_236_low60_40_low20_2,
sint64 u_276_277,
sint64 v_276_277,
sint64 r_276_277,
sint64 s_276_277,
sint64 u_276_278,
sint64 v_276_278,
sint64 r_276_278,
sint64 s_276_278,
bit ne
)={
    u_276_277 * f_236_low60_40_low20_0 + v_276_277 * g_236_low60_40_low20_0 = f_236_low60_40_low20_1 * (-(2**20)),
    r_276_277 * f_236_low60_40_low20_0 + s_276_277 * g_236_low60_40_low20_0 = g_236_low60_40_low20_1 * (-(2**20))
&&
    u_276_277 * f_236_low60_40_low20_0 + v_276_277 * g_236_low60_40_low20_0 = f_236_low60_40_low20_1 * (const 64 (-(2**20))),
    r_276_277 * f_236_low60_40_low20_0 + s_276_277 * g_236_low60_40_low20_0 = g_236_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_1 + u_276_277 * (const 64 (2**21)) + v_276_277 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_1 + r_276_277 * (const 64 (2**21)) + s_276_277 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_1,
    f_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_1,
    g_236_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 277)) <=s delta, delta <=s (const 64 (1 + 2*277)),
    (const 64 (-(2**20))) <=s u_276_277, u_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_277, v_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_277, r_276_277 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_277, s_276_277 <=s (const 64 ((2**20)-1)),
    u_276_277 + v_276_277 <=s (const 64 (2**20)),
    u_276_277 - v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 + v_276_277 <=s (const 64 (2**20)),
    (const 64 0) - u_276_277 - v_276_277 <=s (const 64 (2**20)),
    r_276_277 + s_276_277 <=s (const 64 (2**20)),
    r_276_277 - s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 + s_276_277 <=s (const 64 (2**20)),
    (const 64 0) - r_276_277 - s_276_277 <=s (const 64 (2**20)),
    u_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_276_277 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_276_277 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step277

// premise c
assume
g_236_low60_40_low20_1 = 1 (mod 2)
&&
g_236_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_2 g_236_low60_40_low20_1;
mov u_276_278 r_276_277;
mov v_276_278 s_276_277;

subs dc g_236_low60_40_low20_2 g_236_low60_40_low20_1 f_236_low60_40_low20_1;
asr g_236_low60_40_low20_2 g_236_low60_40_low20_2 1;
subs dc r_276_278 r_276_277 u_276_277;
asr r_276_278 r_276_278 1;
subs dc s_276_278 s_276_277 v_276_277;
asr s_276_278 s_276_278 1;
assert
    true
&&
    f_236_low60_40_low20_2 = g_236_low60_40_low20_1,
    u_276_278 = r_276_277,
    v_276_278 = s_276_277,
    g_236_low60_40_low20_2 * (const 64 2) = g_236_low60_40_low20_1 - f_236_low60_40_low20_1,
    r_276_278 * (const 64 2) = r_276_277 - u_276_277,
    s_276_278 * (const 64 2) = s_276_277 - v_276_277
;

assume
    f_236_low60_40_low20_2 = g_236_low60_40_low20_1,
    u_276_278 = r_276_277,
    v_276_278 = s_276_277,
    g_236_low60_40_low20_2 * 2 = g_236_low60_40_low20_1 - f_236_low60_40_low20_1,
    r_276_278 * 2 = r_276_277 - u_276_277,
    s_276_278 * 2 = s_276_277 - v_276_277
&&
    true
;

{
    u_276_278 * f_236_low60_40_low20_0 + v_276_278 * g_236_low60_40_low20_0 = f_236_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_278 * f_236_low60_40_low20_0 + s_276_278 * g_236_low60_40_low20_0 = g_236_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_2 + u_276_278 * (const 64 (2**21)) + v_276_278 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_2 + r_276_278 * (const 64 (2**21)) + s_276_278 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_2,
    f_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_2,
    g_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 278)) <=s delta, delta <=s (const 64 (1 + 2*278)),
    (const 64 (-(2**20))) <=s u_276_278, u_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_278, v_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_278, r_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_278, s_276_278 <=s (const 64 ((2**20)-1)),
    u_276_278 + v_276_278 <=s (const 64 (2**20)),
    u_276_278 - v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 + v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 - v_276_278 <=s (const 64 (2**20)),
    r_276_278 + s_276_278 <=s (const 64 (2**20)),
    r_276_278 - s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 + s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 - s_276_278 <=s (const 64 (2**20)),
    u_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_276_278 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_278_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_2,
sint64 g_236_low60_40_low20_2,
sint64 f_236_low60_40_low20_3,
sint64 g_236_low60_40_low20_3,
sint64 u_276_278,
sint64 v_276_278,
sint64 r_276_278,
sint64 s_276_278,
sint64 u_276_279,
sint64 v_276_279,
sint64 r_276_279,
sint64 s_276_279,
bit ne
)={
    u_276_278 * f_236_low60_40_low20_0 + v_276_278 * g_236_low60_40_low20_0 = f_236_low60_40_low20_2 * (-(2**20)),
    r_276_278 * f_236_low60_40_low20_0 + s_276_278 * g_236_low60_40_low20_0 = g_236_low60_40_low20_2 * (-(2**20))
&&
    u_276_278 * f_236_low60_40_low20_0 + v_276_278 * g_236_low60_40_low20_0 = f_236_low60_40_low20_2 * (const 64 (-(2**20))),
    r_276_278 * f_236_low60_40_low20_0 + s_276_278 * g_236_low60_40_low20_0 = g_236_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_2 + u_276_278 * (const 64 (2**21)) + v_276_278 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_2 + r_276_278 * (const 64 (2**21)) + s_276_278 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_2,
    f_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_2,
    g_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 278)) <=s delta, delta <=s (const 64 (1 + 2*278)),
    (const 64 (-(2**20))) <=s u_276_278, u_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_278, v_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_278, r_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_278, s_276_278 <=s (const 64 ((2**20)-1)),
    u_276_278 + v_276_278 <=s (const 64 (2**20)),
    u_276_278 - v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 + v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 - v_276_278 <=s (const 64 (2**20)),
    r_276_278 + s_276_278 <=s (const 64 (2**20)),
    r_276_278 - s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 + s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 - s_276_278 <=s (const 64 (2**20)),
    u_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_276_278 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step278

// premise a
assume
g_236_low60_40_low20_2 = 0 (mod 2)
&&
g_236_low60_40_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_3 f_236_low60_40_low20_2;
mov u_276_279 u_276_278;
mov v_276_279 v_276_278;

asr g_236_low60_40_low20_3 g_236_low60_40_low20_2 1;
asr r_276_279 r_276_278 1;
asr s_276_279 s_276_278 1;
assert
    true
&&
    f_236_low60_40_low20_3 = f_236_low60_40_low20_2,
    u_276_279 = u_276_278,
    v_276_279 = v_276_278,
    g_236_low60_40_low20_3 * (const 64 2) = g_236_low60_40_low20_2,
    r_276_279 * (const 64 2) = r_276_278,
    s_276_279 * (const 64 2) = s_276_278
;

assume
    f_236_low60_40_low20_3 = f_236_low60_40_low20_2,
    u_276_279 = u_276_278,
    v_276_279 = v_276_278,
    g_236_low60_40_low20_3 * 2 = g_236_low60_40_low20_2,
    r_276_279 * 2 = r_276_278,
    s_276_279 * 2 = s_276_278
&&
    true
;

{
    u_276_279 * f_236_low60_40_low20_0 + v_276_279 * g_236_low60_40_low20_0 = f_236_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_279 * f_236_low60_40_low20_0 + s_276_279 * g_236_low60_40_low20_0 = g_236_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_3 + u_276_279 * (const 64 (2**21)) + v_276_279 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_3 + r_276_279 * (const 64 (2**21)) + s_276_279 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_3,
    f_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_3,
    g_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 279)) <=s delta, delta <=s (const 64 (1 + 2*279)),
    (const 64 (-(2**20))) <=s u_276_279, u_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_279, v_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_279, r_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_279, s_276_279 <=s (const 64 ((2**20)-1)),
    u_276_279 + v_276_279 <=s (const 64 (2**20)),
    u_276_279 - v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 + v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 - v_276_279 <=s (const 64 (2**20)),
    r_276_279 + s_276_279 <=s (const 64 (2**20)),
    r_276_279 - s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 + s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 - s_276_279 <=s (const 64 (2**20)),
    u_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_276_279 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_278_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_2,
sint64 g_236_low60_40_low20_2,
sint64 f_236_low60_40_low20_3,
sint64 g_236_low60_40_low20_3,
sint64 u_276_278,
sint64 v_276_278,
sint64 r_276_278,
sint64 s_276_278,
sint64 u_276_279,
sint64 v_276_279,
sint64 r_276_279,
sint64 s_276_279,
bit ne
)={
    u_276_278 * f_236_low60_40_low20_0 + v_276_278 * g_236_low60_40_low20_0 = f_236_low60_40_low20_2 * (-(2**20)),
    r_276_278 * f_236_low60_40_low20_0 + s_276_278 * g_236_low60_40_low20_0 = g_236_low60_40_low20_2 * (-(2**20))
&&
    u_276_278 * f_236_low60_40_low20_0 + v_276_278 * g_236_low60_40_low20_0 = f_236_low60_40_low20_2 * (const 64 (-(2**20))),
    r_276_278 * f_236_low60_40_low20_0 + s_276_278 * g_236_low60_40_low20_0 = g_236_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_2 + u_276_278 * (const 64 (2**21)) + v_276_278 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_2 + r_276_278 * (const 64 (2**21)) + s_276_278 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_2,
    f_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_2,
    g_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 278)) <=s delta, delta <=s (const 64 (1 + 2*278)),
    (const 64 (-(2**20))) <=s u_276_278, u_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_278, v_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_278, r_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_278, s_276_278 <=s (const 64 ((2**20)-1)),
    u_276_278 + v_276_278 <=s (const 64 (2**20)),
    u_276_278 - v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 + v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 - v_276_278 <=s (const 64 (2**20)),
    r_276_278 + s_276_278 <=s (const 64 (2**20)),
    r_276_278 - s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 + s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 - s_276_278 <=s (const 64 (2**20)),
    u_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_276_278 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step278

// premise b
assume
g_236_low60_40_low20_2 = 1 (mod 2)
&&
g_236_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_3 f_236_low60_40_low20_2;
mov u_276_279 u_276_278;
mov v_276_279 v_276_278;

add g_236_low60_40_low20_3 g_236_low60_40_low20_2 f_236_low60_40_low20_2;
asr g_236_low60_40_low20_3 g_236_low60_40_low20_3 1;
add r_276_279 r_276_278 u_276_278;
asr r_276_279 r_276_279 1;
add s_276_279 s_276_278 v_276_278;
asr s_276_279 s_276_279 1;
assert
    true
&&
    f_236_low60_40_low20_3 = f_236_low60_40_low20_2,
    u_276_279 = u_276_278,
    v_276_279 = v_276_278,
    g_236_low60_40_low20_3 * (const 64 2) = g_236_low60_40_low20_2 + f_236_low60_40_low20_2,
    r_276_279 * (const 64 2) = r_276_278 + u_276_278,
    s_276_279 * (const 64 2) = s_276_278 + v_276_278
;

assume
    f_236_low60_40_low20_3 = f_236_low60_40_low20_2,
    u_276_279 = u_276_278,
    v_276_279 = v_276_278,
    g_236_low60_40_low20_3 * 2 = g_236_low60_40_low20_2 + f_236_low60_40_low20_2,
    r_276_279 * 2 = r_276_278 + u_276_278,
    s_276_279 * 2 = s_276_278 + v_276_278
&&
    true
;

{
    u_276_279 * f_236_low60_40_low20_0 + v_276_279 * g_236_low60_40_low20_0 = f_236_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_279 * f_236_low60_40_low20_0 + s_276_279 * g_236_low60_40_low20_0 = g_236_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_3 + u_276_279 * (const 64 (2**21)) + v_276_279 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_3 + r_276_279 * (const 64 (2**21)) + s_276_279 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_3,
    f_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_3,
    g_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 279)) <=s delta, delta <=s (const 64 (1 + 2*279)),
    (const 64 (-(2**20))) <=s u_276_279, u_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_279, v_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_279, r_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_279, s_276_279 <=s (const 64 ((2**20)-1)),
    u_276_279 + v_276_279 <=s (const 64 (2**20)),
    u_276_279 - v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 + v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 - v_276_279 <=s (const 64 (2**20)),
    r_276_279 + s_276_279 <=s (const 64 (2**20)),
    r_276_279 - s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 + s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 - s_276_279 <=s (const 64 (2**20)),
    u_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_276_279 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_278_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_2,
sint64 g_236_low60_40_low20_2,
sint64 f_236_low60_40_low20_3,
sint64 g_236_low60_40_low20_3,
sint64 u_276_278,
sint64 v_276_278,
sint64 r_276_278,
sint64 s_276_278,
sint64 u_276_279,
sint64 v_276_279,
sint64 r_276_279,
sint64 s_276_279,
bit ne
)={
    u_276_278 * f_236_low60_40_low20_0 + v_276_278 * g_236_low60_40_low20_0 = f_236_low60_40_low20_2 * (-(2**20)),
    r_276_278 * f_236_low60_40_low20_0 + s_276_278 * g_236_low60_40_low20_0 = g_236_low60_40_low20_2 * (-(2**20))
&&
    u_276_278 * f_236_low60_40_low20_0 + v_276_278 * g_236_low60_40_low20_0 = f_236_low60_40_low20_2 * (const 64 (-(2**20))),
    r_276_278 * f_236_low60_40_low20_0 + s_276_278 * g_236_low60_40_low20_0 = g_236_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_2 + u_276_278 * (const 64 (2**21)) + v_276_278 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_2 + r_276_278 * (const 64 (2**21)) + s_276_278 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_2,
    f_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_2,
    g_236_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 278)) <=s delta, delta <=s (const 64 (1 + 2*278)),
    (const 64 (-(2**20))) <=s u_276_278, u_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_278, v_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_278, r_276_278 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_278, s_276_278 <=s (const 64 ((2**20)-1)),
    u_276_278 + v_276_278 <=s (const 64 (2**20)),
    u_276_278 - v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 + v_276_278 <=s (const 64 (2**20)),
    (const 64 0) - u_276_278 - v_276_278 <=s (const 64 (2**20)),
    r_276_278 + s_276_278 <=s (const 64 (2**20)),
    r_276_278 - s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 + s_276_278 <=s (const 64 (2**20)),
    (const 64 0) - r_276_278 - s_276_278 <=s (const 64 (2**20)),
    u_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_276_278 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_276_278 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step278

// premise c
assume
g_236_low60_40_low20_2 = 1 (mod 2)
&&
g_236_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_3 g_236_low60_40_low20_2;
mov u_276_279 r_276_278;
mov v_276_279 s_276_278;

subs dc g_236_low60_40_low20_3 g_236_low60_40_low20_2 f_236_low60_40_low20_2;
asr g_236_low60_40_low20_3 g_236_low60_40_low20_3 1;
subs dc r_276_279 r_276_278 u_276_278;
asr r_276_279 r_276_279 1;
subs dc s_276_279 s_276_278 v_276_278;
asr s_276_279 s_276_279 1;
assert
    true
&&
    f_236_low60_40_low20_3 = g_236_low60_40_low20_2,
    u_276_279 = r_276_278,
    v_276_279 = s_276_278,
    g_236_low60_40_low20_3 * (const 64 2) = g_236_low60_40_low20_2 - f_236_low60_40_low20_2,
    r_276_279 * (const 64 2) = r_276_278 - u_276_278,
    s_276_279 * (const 64 2) = s_276_278 - v_276_278
;

assume
    f_236_low60_40_low20_3 = g_236_low60_40_low20_2,
    u_276_279 = r_276_278,
    v_276_279 = s_276_278,
    g_236_low60_40_low20_3 * 2 = g_236_low60_40_low20_2 - f_236_low60_40_low20_2,
    r_276_279 * 2 = r_276_278 - u_276_278,
    s_276_279 * 2 = s_276_278 - v_276_278
&&
    true
;

{
    u_276_279 * f_236_low60_40_low20_0 + v_276_279 * g_236_low60_40_low20_0 = f_236_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_279 * f_236_low60_40_low20_0 + s_276_279 * g_236_low60_40_low20_0 = g_236_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_3 + u_276_279 * (const 64 (2**21)) + v_276_279 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_3 + r_276_279 * (const 64 (2**21)) + s_276_279 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_3,
    f_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_3,
    g_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 279)) <=s delta, delta <=s (const 64 (1 + 2*279)),
    (const 64 (-(2**20))) <=s u_276_279, u_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_279, v_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_279, r_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_279, s_276_279 <=s (const 64 ((2**20)-1)),
    u_276_279 + v_276_279 <=s (const 64 (2**20)),
    u_276_279 - v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 + v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 - v_276_279 <=s (const 64 (2**20)),
    r_276_279 + s_276_279 <=s (const 64 (2**20)),
    r_276_279 - s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 + s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 - s_276_279 <=s (const 64 (2**20)),
    u_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_276_279 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_279_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_3,
sint64 g_236_low60_40_low20_3,
sint64 f_236_low60_40_low20_4,
sint64 g_236_low60_40_low20_4,
sint64 u_276_279,
sint64 v_276_279,
sint64 r_276_279,
sint64 s_276_279,
sint64 u_276_280,
sint64 v_276_280,
sint64 r_276_280,
sint64 s_276_280,
bit ne
)={
    u_276_279 * f_236_low60_40_low20_0 + v_276_279 * g_236_low60_40_low20_0 = f_236_low60_40_low20_3 * (-(2**20)),
    r_276_279 * f_236_low60_40_low20_0 + s_276_279 * g_236_low60_40_low20_0 = g_236_low60_40_low20_3 * (-(2**20))
&&
    u_276_279 * f_236_low60_40_low20_0 + v_276_279 * g_236_low60_40_low20_0 = f_236_low60_40_low20_3 * (const 64 (-(2**20))),
    r_276_279 * f_236_low60_40_low20_0 + s_276_279 * g_236_low60_40_low20_0 = g_236_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_3 + u_276_279 * (const 64 (2**21)) + v_276_279 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_3 + r_276_279 * (const 64 (2**21)) + s_276_279 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_3,
    f_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_3,
    g_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 279)) <=s delta, delta <=s (const 64 (1 + 2*279)),
    (const 64 (-(2**20))) <=s u_276_279, u_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_279, v_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_279, r_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_279, s_276_279 <=s (const 64 ((2**20)-1)),
    u_276_279 + v_276_279 <=s (const 64 (2**20)),
    u_276_279 - v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 + v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 - v_276_279 <=s (const 64 (2**20)),
    r_276_279 + s_276_279 <=s (const 64 (2**20)),
    r_276_279 - s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 + s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 - s_276_279 <=s (const 64 (2**20)),
    u_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_276_279 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step279

// premise a
assume
g_236_low60_40_low20_3 = 0 (mod 2)
&&
g_236_low60_40_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_4 f_236_low60_40_low20_3;
mov u_276_280 u_276_279;
mov v_276_280 v_276_279;

asr g_236_low60_40_low20_4 g_236_low60_40_low20_3 1;
asr r_276_280 r_276_279 1;
asr s_276_280 s_276_279 1;
assert
    true
&&
    f_236_low60_40_low20_4 = f_236_low60_40_low20_3,
    u_276_280 = u_276_279,
    v_276_280 = v_276_279,
    g_236_low60_40_low20_4 * (const 64 2) = g_236_low60_40_low20_3,
    r_276_280 * (const 64 2) = r_276_279,
    s_276_280 * (const 64 2) = s_276_279
;

assume
    f_236_low60_40_low20_4 = f_236_low60_40_low20_3,
    u_276_280 = u_276_279,
    v_276_280 = v_276_279,
    g_236_low60_40_low20_4 * 2 = g_236_low60_40_low20_3,
    r_276_280 * 2 = r_276_279,
    s_276_280 * 2 = s_276_279
&&
    true
;

{
    u_276_280 * f_236_low60_40_low20_0 + v_276_280 * g_236_low60_40_low20_0 = f_236_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_280 * f_236_low60_40_low20_0 + s_276_280 * g_236_low60_40_low20_0 = g_236_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_4 + u_276_280 * (const 64 (2**21)) + v_276_280 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_4 + r_276_280 * (const 64 (2**21)) + s_276_280 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_4,
    f_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_4,
    g_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 280)) <=s delta, delta <=s (const 64 (1 + 2*280)),
    (const 64 (-(2**20))) <=s u_276_280, u_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_280, v_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_280, r_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_280, s_276_280 <=s (const 64 ((2**20)-1)),
    u_276_280 + v_276_280 <=s (const 64 (2**20)),
    u_276_280 - v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 + v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 - v_276_280 <=s (const 64 (2**20)),
    r_276_280 + s_276_280 <=s (const 64 (2**20)),
    r_276_280 - s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 + s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 - s_276_280 <=s (const 64 (2**20)),
    u_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_276_280 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_279_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_3,
sint64 g_236_low60_40_low20_3,
sint64 f_236_low60_40_low20_4,
sint64 g_236_low60_40_low20_4,
sint64 u_276_279,
sint64 v_276_279,
sint64 r_276_279,
sint64 s_276_279,
sint64 u_276_280,
sint64 v_276_280,
sint64 r_276_280,
sint64 s_276_280,
bit ne
)={
    u_276_279 * f_236_low60_40_low20_0 + v_276_279 * g_236_low60_40_low20_0 = f_236_low60_40_low20_3 * (-(2**20)),
    r_276_279 * f_236_low60_40_low20_0 + s_276_279 * g_236_low60_40_low20_0 = g_236_low60_40_low20_3 * (-(2**20))
&&
    u_276_279 * f_236_low60_40_low20_0 + v_276_279 * g_236_low60_40_low20_0 = f_236_low60_40_low20_3 * (const 64 (-(2**20))),
    r_276_279 * f_236_low60_40_low20_0 + s_276_279 * g_236_low60_40_low20_0 = g_236_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_3 + u_276_279 * (const 64 (2**21)) + v_276_279 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_3 + r_276_279 * (const 64 (2**21)) + s_276_279 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_3,
    f_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_3,
    g_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 279)) <=s delta, delta <=s (const 64 (1 + 2*279)),
    (const 64 (-(2**20))) <=s u_276_279, u_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_279, v_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_279, r_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_279, s_276_279 <=s (const 64 ((2**20)-1)),
    u_276_279 + v_276_279 <=s (const 64 (2**20)),
    u_276_279 - v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 + v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 - v_276_279 <=s (const 64 (2**20)),
    r_276_279 + s_276_279 <=s (const 64 (2**20)),
    r_276_279 - s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 + s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 - s_276_279 <=s (const 64 (2**20)),
    u_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_276_279 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step279

// premise b
assume
g_236_low60_40_low20_3 = 1 (mod 2)
&&
g_236_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_4 f_236_low60_40_low20_3;
mov u_276_280 u_276_279;
mov v_276_280 v_276_279;

add g_236_low60_40_low20_4 g_236_low60_40_low20_3 f_236_low60_40_low20_3;
asr g_236_low60_40_low20_4 g_236_low60_40_low20_4 1;
add r_276_280 r_276_279 u_276_279;
asr r_276_280 r_276_280 1;
add s_276_280 s_276_279 v_276_279;
asr s_276_280 s_276_280 1;
assert
    true
&&
    f_236_low60_40_low20_4 = f_236_low60_40_low20_3,
    u_276_280 = u_276_279,
    v_276_280 = v_276_279,
    g_236_low60_40_low20_4 * (const 64 2) = g_236_low60_40_low20_3 + f_236_low60_40_low20_3,
    r_276_280 * (const 64 2) = r_276_279 + u_276_279,
    s_276_280 * (const 64 2) = s_276_279 + v_276_279
;

assume
    f_236_low60_40_low20_4 = f_236_low60_40_low20_3,
    u_276_280 = u_276_279,
    v_276_280 = v_276_279,
    g_236_low60_40_low20_4 * 2 = g_236_low60_40_low20_3 + f_236_low60_40_low20_3,
    r_276_280 * 2 = r_276_279 + u_276_279,
    s_276_280 * 2 = s_276_279 + v_276_279
&&
    true
;

{
    u_276_280 * f_236_low60_40_low20_0 + v_276_280 * g_236_low60_40_low20_0 = f_236_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_280 * f_236_low60_40_low20_0 + s_276_280 * g_236_low60_40_low20_0 = g_236_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_4 + u_276_280 * (const 64 (2**21)) + v_276_280 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_4 + r_276_280 * (const 64 (2**21)) + s_276_280 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_4,
    f_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_4,
    g_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 280)) <=s delta, delta <=s (const 64 (1 + 2*280)),
    (const 64 (-(2**20))) <=s u_276_280, u_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_280, v_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_280, r_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_280, s_276_280 <=s (const 64 ((2**20)-1)),
    u_276_280 + v_276_280 <=s (const 64 (2**20)),
    u_276_280 - v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 + v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 - v_276_280 <=s (const 64 (2**20)),
    r_276_280 + s_276_280 <=s (const 64 (2**20)),
    r_276_280 - s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 + s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 - s_276_280 <=s (const 64 (2**20)),
    u_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_276_280 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_279_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_3,
sint64 g_236_low60_40_low20_3,
sint64 f_236_low60_40_low20_4,
sint64 g_236_low60_40_low20_4,
sint64 u_276_279,
sint64 v_276_279,
sint64 r_276_279,
sint64 s_276_279,
sint64 u_276_280,
sint64 v_276_280,
sint64 r_276_280,
sint64 s_276_280,
bit ne
)={
    u_276_279 * f_236_low60_40_low20_0 + v_276_279 * g_236_low60_40_low20_0 = f_236_low60_40_low20_3 * (-(2**20)),
    r_276_279 * f_236_low60_40_low20_0 + s_276_279 * g_236_low60_40_low20_0 = g_236_low60_40_low20_3 * (-(2**20))
&&
    u_276_279 * f_236_low60_40_low20_0 + v_276_279 * g_236_low60_40_low20_0 = f_236_low60_40_low20_3 * (const 64 (-(2**20))),
    r_276_279 * f_236_low60_40_low20_0 + s_276_279 * g_236_low60_40_low20_0 = g_236_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_3 + u_276_279 * (const 64 (2**21)) + v_276_279 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_3 + r_276_279 * (const 64 (2**21)) + s_276_279 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_3,
    f_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_3,
    g_236_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 279)) <=s delta, delta <=s (const 64 (1 + 2*279)),
    (const 64 (-(2**20))) <=s u_276_279, u_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_279, v_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_279, r_276_279 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_279, s_276_279 <=s (const 64 ((2**20)-1)),
    u_276_279 + v_276_279 <=s (const 64 (2**20)),
    u_276_279 - v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 + v_276_279 <=s (const 64 (2**20)),
    (const 64 0) - u_276_279 - v_276_279 <=s (const 64 (2**20)),
    r_276_279 + s_276_279 <=s (const 64 (2**20)),
    r_276_279 - s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 + s_276_279 <=s (const 64 (2**20)),
    (const 64 0) - r_276_279 - s_276_279 <=s (const 64 (2**20)),
    u_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_276_279 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_276_279 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step279

// premise c
assume
g_236_low60_40_low20_3 = 1 (mod 2)
&&
g_236_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_4 g_236_low60_40_low20_3;
mov u_276_280 r_276_279;
mov v_276_280 s_276_279;

subs dc g_236_low60_40_low20_4 g_236_low60_40_low20_3 f_236_low60_40_low20_3;
asr g_236_low60_40_low20_4 g_236_low60_40_low20_4 1;
subs dc r_276_280 r_276_279 u_276_279;
asr r_276_280 r_276_280 1;
subs dc s_276_280 s_276_279 v_276_279;
asr s_276_280 s_276_280 1;
assert
    true
&&
    f_236_low60_40_low20_4 = g_236_low60_40_low20_3,
    u_276_280 = r_276_279,
    v_276_280 = s_276_279,
    g_236_low60_40_low20_4 * (const 64 2) = g_236_low60_40_low20_3 - f_236_low60_40_low20_3,
    r_276_280 * (const 64 2) = r_276_279 - u_276_279,
    s_276_280 * (const 64 2) = s_276_279 - v_276_279
;

assume
    f_236_low60_40_low20_4 = g_236_low60_40_low20_3,
    u_276_280 = r_276_279,
    v_276_280 = s_276_279,
    g_236_low60_40_low20_4 * 2 = g_236_low60_40_low20_3 - f_236_low60_40_low20_3,
    r_276_280 * 2 = r_276_279 - u_276_279,
    s_276_280 * 2 = s_276_279 - v_276_279
&&
    true
;

{
    u_276_280 * f_236_low60_40_low20_0 + v_276_280 * g_236_low60_40_low20_0 = f_236_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_280 * f_236_low60_40_low20_0 + s_276_280 * g_236_low60_40_low20_0 = g_236_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_4 + u_276_280 * (const 64 (2**21)) + v_276_280 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_4 + r_276_280 * (const 64 (2**21)) + s_276_280 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_4,
    f_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_4,
    g_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 280)) <=s delta, delta <=s (const 64 (1 + 2*280)),
    (const 64 (-(2**20))) <=s u_276_280, u_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_280, v_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_280, r_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_280, s_276_280 <=s (const 64 ((2**20)-1)),
    u_276_280 + v_276_280 <=s (const 64 (2**20)),
    u_276_280 - v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 + v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 - v_276_280 <=s (const 64 (2**20)),
    r_276_280 + s_276_280 <=s (const 64 (2**20)),
    r_276_280 - s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 + s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 - s_276_280 <=s (const 64 (2**20)),
    u_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_276_280 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_280_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_4,
sint64 g_236_low60_40_low20_4,
sint64 f_236_low60_40_low20_5,
sint64 g_236_low60_40_low20_5,
sint64 u_276_280,
sint64 v_276_280,
sint64 r_276_280,
sint64 s_276_280,
sint64 u_276_281,
sint64 v_276_281,
sint64 r_276_281,
sint64 s_276_281,
bit ne
)={
    u_276_280 * f_236_low60_40_low20_0 + v_276_280 * g_236_low60_40_low20_0 = f_236_low60_40_low20_4 * (-(2**20)),
    r_276_280 * f_236_low60_40_low20_0 + s_276_280 * g_236_low60_40_low20_0 = g_236_low60_40_low20_4 * (-(2**20))
&&
    u_276_280 * f_236_low60_40_low20_0 + v_276_280 * g_236_low60_40_low20_0 = f_236_low60_40_low20_4 * (const 64 (-(2**20))),
    r_276_280 * f_236_low60_40_low20_0 + s_276_280 * g_236_low60_40_low20_0 = g_236_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_4 + u_276_280 * (const 64 (2**21)) + v_276_280 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_4 + r_276_280 * (const 64 (2**21)) + s_276_280 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_4,
    f_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_4,
    g_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 280)) <=s delta, delta <=s (const 64 (1 + 2*280)),
    (const 64 (-(2**20))) <=s u_276_280, u_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_280, v_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_280, r_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_280, s_276_280 <=s (const 64 ((2**20)-1)),
    u_276_280 + v_276_280 <=s (const 64 (2**20)),
    u_276_280 - v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 + v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 - v_276_280 <=s (const 64 (2**20)),
    r_276_280 + s_276_280 <=s (const 64 (2**20)),
    r_276_280 - s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 + s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 - s_276_280 <=s (const 64 (2**20)),
    u_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_276_280 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step280

// premise a
assume
g_236_low60_40_low20_4 = 0 (mod 2)
&&
g_236_low60_40_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_5 f_236_low60_40_low20_4;
mov u_276_281 u_276_280;
mov v_276_281 v_276_280;

asr g_236_low60_40_low20_5 g_236_low60_40_low20_4 1;
asr r_276_281 r_276_280 1;
asr s_276_281 s_276_280 1;
assert
    true
&&
    f_236_low60_40_low20_5 = f_236_low60_40_low20_4,
    u_276_281 = u_276_280,
    v_276_281 = v_276_280,
    g_236_low60_40_low20_5 * (const 64 2) = g_236_low60_40_low20_4,
    r_276_281 * (const 64 2) = r_276_280,
    s_276_281 * (const 64 2) = s_276_280
;

assume
    f_236_low60_40_low20_5 = f_236_low60_40_low20_4,
    u_276_281 = u_276_280,
    v_276_281 = v_276_280,
    g_236_low60_40_low20_5 * 2 = g_236_low60_40_low20_4,
    r_276_281 * 2 = r_276_280,
    s_276_281 * 2 = s_276_280
&&
    true
;

{
    u_276_281 * f_236_low60_40_low20_0 + v_276_281 * g_236_low60_40_low20_0 = f_236_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_281 * f_236_low60_40_low20_0 + s_276_281 * g_236_low60_40_low20_0 = g_236_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_5 + u_276_281 * (const 64 (2**21)) + v_276_281 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_5 + r_276_281 * (const 64 (2**21)) + s_276_281 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_5,
    f_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_5,
    g_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 281)) <=s delta, delta <=s (const 64 (1 + 2*281)),
    (const 64 (-(2**20))) <=s u_276_281, u_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_281, v_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_281, r_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_281, s_276_281 <=s (const 64 ((2**20)-1)),
    u_276_281 + v_276_281 <=s (const 64 (2**20)),
    u_276_281 - v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 + v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 - v_276_281 <=s (const 64 (2**20)),
    r_276_281 + s_276_281 <=s (const 64 (2**20)),
    r_276_281 - s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 + s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 - s_276_281 <=s (const 64 (2**20)),
    u_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_276_281 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_280_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_4,
sint64 g_236_low60_40_low20_4,
sint64 f_236_low60_40_low20_5,
sint64 g_236_low60_40_low20_5,
sint64 u_276_280,
sint64 v_276_280,
sint64 r_276_280,
sint64 s_276_280,
sint64 u_276_281,
sint64 v_276_281,
sint64 r_276_281,
sint64 s_276_281,
bit ne
)={
    u_276_280 * f_236_low60_40_low20_0 + v_276_280 * g_236_low60_40_low20_0 = f_236_low60_40_low20_4 * (-(2**20)),
    r_276_280 * f_236_low60_40_low20_0 + s_276_280 * g_236_low60_40_low20_0 = g_236_low60_40_low20_4 * (-(2**20))
&&
    u_276_280 * f_236_low60_40_low20_0 + v_276_280 * g_236_low60_40_low20_0 = f_236_low60_40_low20_4 * (const 64 (-(2**20))),
    r_276_280 * f_236_low60_40_low20_0 + s_276_280 * g_236_low60_40_low20_0 = g_236_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_4 + u_276_280 * (const 64 (2**21)) + v_276_280 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_4 + r_276_280 * (const 64 (2**21)) + s_276_280 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_4,
    f_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_4,
    g_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 280)) <=s delta, delta <=s (const 64 (1 + 2*280)),
    (const 64 (-(2**20))) <=s u_276_280, u_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_280, v_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_280, r_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_280, s_276_280 <=s (const 64 ((2**20)-1)),
    u_276_280 + v_276_280 <=s (const 64 (2**20)),
    u_276_280 - v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 + v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 - v_276_280 <=s (const 64 (2**20)),
    r_276_280 + s_276_280 <=s (const 64 (2**20)),
    r_276_280 - s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 + s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 - s_276_280 <=s (const 64 (2**20)),
    u_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_276_280 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step280

// premise b
assume
g_236_low60_40_low20_4 = 1 (mod 2)
&&
g_236_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_5 f_236_low60_40_low20_4;
mov u_276_281 u_276_280;
mov v_276_281 v_276_280;

add g_236_low60_40_low20_5 g_236_low60_40_low20_4 f_236_low60_40_low20_4;
asr g_236_low60_40_low20_5 g_236_low60_40_low20_5 1;
add r_276_281 r_276_280 u_276_280;
asr r_276_281 r_276_281 1;
add s_276_281 s_276_280 v_276_280;
asr s_276_281 s_276_281 1;
assert
    true
&&
    f_236_low60_40_low20_5 = f_236_low60_40_low20_4,
    u_276_281 = u_276_280,
    v_276_281 = v_276_280,
    g_236_low60_40_low20_5 * (const 64 2) = g_236_low60_40_low20_4 + f_236_low60_40_low20_4,
    r_276_281 * (const 64 2) = r_276_280 + u_276_280,
    s_276_281 * (const 64 2) = s_276_280 + v_276_280
;

assume
    f_236_low60_40_low20_5 = f_236_low60_40_low20_4,
    u_276_281 = u_276_280,
    v_276_281 = v_276_280,
    g_236_low60_40_low20_5 * 2 = g_236_low60_40_low20_4 + f_236_low60_40_low20_4,
    r_276_281 * 2 = r_276_280 + u_276_280,
    s_276_281 * 2 = s_276_280 + v_276_280
&&
    true
;

{
    u_276_281 * f_236_low60_40_low20_0 + v_276_281 * g_236_low60_40_low20_0 = f_236_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_281 * f_236_low60_40_low20_0 + s_276_281 * g_236_low60_40_low20_0 = g_236_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_5 + u_276_281 * (const 64 (2**21)) + v_276_281 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_5 + r_276_281 * (const 64 (2**21)) + s_276_281 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_5,
    f_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_5,
    g_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 281)) <=s delta, delta <=s (const 64 (1 + 2*281)),
    (const 64 (-(2**20))) <=s u_276_281, u_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_281, v_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_281, r_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_281, s_276_281 <=s (const 64 ((2**20)-1)),
    u_276_281 + v_276_281 <=s (const 64 (2**20)),
    u_276_281 - v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 + v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 - v_276_281 <=s (const 64 (2**20)),
    r_276_281 + s_276_281 <=s (const 64 (2**20)),
    r_276_281 - s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 + s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 - s_276_281 <=s (const 64 (2**20)),
    u_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_276_281 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_280_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_4,
sint64 g_236_low60_40_low20_4,
sint64 f_236_low60_40_low20_5,
sint64 g_236_low60_40_low20_5,
sint64 u_276_280,
sint64 v_276_280,
sint64 r_276_280,
sint64 s_276_280,
sint64 u_276_281,
sint64 v_276_281,
sint64 r_276_281,
sint64 s_276_281,
bit ne
)={
    u_276_280 * f_236_low60_40_low20_0 + v_276_280 * g_236_low60_40_low20_0 = f_236_low60_40_low20_4 * (-(2**20)),
    r_276_280 * f_236_low60_40_low20_0 + s_276_280 * g_236_low60_40_low20_0 = g_236_low60_40_low20_4 * (-(2**20))
&&
    u_276_280 * f_236_low60_40_low20_0 + v_276_280 * g_236_low60_40_low20_0 = f_236_low60_40_low20_4 * (const 64 (-(2**20))),
    r_276_280 * f_236_low60_40_low20_0 + s_276_280 * g_236_low60_40_low20_0 = g_236_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_4 + u_276_280 * (const 64 (2**21)) + v_276_280 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_4 + r_276_280 * (const 64 (2**21)) + s_276_280 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_4,
    f_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_4,
    g_236_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 280)) <=s delta, delta <=s (const 64 (1 + 2*280)),
    (const 64 (-(2**20))) <=s u_276_280, u_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_280, v_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_280, r_276_280 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_280, s_276_280 <=s (const 64 ((2**20)-1)),
    u_276_280 + v_276_280 <=s (const 64 (2**20)),
    u_276_280 - v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 + v_276_280 <=s (const 64 (2**20)),
    (const 64 0) - u_276_280 - v_276_280 <=s (const 64 (2**20)),
    r_276_280 + s_276_280 <=s (const 64 (2**20)),
    r_276_280 - s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 + s_276_280 <=s (const 64 (2**20)),
    (const 64 0) - r_276_280 - s_276_280 <=s (const 64 (2**20)),
    u_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_276_280 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_276_280 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step280

// premise c
assume
g_236_low60_40_low20_4 = 1 (mod 2)
&&
g_236_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_5 g_236_low60_40_low20_4;
mov u_276_281 r_276_280;
mov v_276_281 s_276_280;

subs dc g_236_low60_40_low20_5 g_236_low60_40_low20_4 f_236_low60_40_low20_4;
asr g_236_low60_40_low20_5 g_236_low60_40_low20_5 1;
subs dc r_276_281 r_276_280 u_276_280;
asr r_276_281 r_276_281 1;
subs dc s_276_281 s_276_280 v_276_280;
asr s_276_281 s_276_281 1;
assert
    true
&&
    f_236_low60_40_low20_5 = g_236_low60_40_low20_4,
    u_276_281 = r_276_280,
    v_276_281 = s_276_280,
    g_236_low60_40_low20_5 * (const 64 2) = g_236_low60_40_low20_4 - f_236_low60_40_low20_4,
    r_276_281 * (const 64 2) = r_276_280 - u_276_280,
    s_276_281 * (const 64 2) = s_276_280 - v_276_280
;

assume
    f_236_low60_40_low20_5 = g_236_low60_40_low20_4,
    u_276_281 = r_276_280,
    v_276_281 = s_276_280,
    g_236_low60_40_low20_5 * 2 = g_236_low60_40_low20_4 - f_236_low60_40_low20_4,
    r_276_281 * 2 = r_276_280 - u_276_280,
    s_276_281 * 2 = s_276_280 - v_276_280
&&
    true
;

{
    u_276_281 * f_236_low60_40_low20_0 + v_276_281 * g_236_low60_40_low20_0 = f_236_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_281 * f_236_low60_40_low20_0 + s_276_281 * g_236_low60_40_low20_0 = g_236_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_5 + u_276_281 * (const 64 (2**21)) + v_276_281 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_5 + r_276_281 * (const 64 (2**21)) + s_276_281 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_5,
    f_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_5,
    g_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 281)) <=s delta, delta <=s (const 64 (1 + 2*281)),
    (const 64 (-(2**20))) <=s u_276_281, u_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_281, v_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_281, r_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_281, s_276_281 <=s (const 64 ((2**20)-1)),
    u_276_281 + v_276_281 <=s (const 64 (2**20)),
    u_276_281 - v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 + v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 - v_276_281 <=s (const 64 (2**20)),
    r_276_281 + s_276_281 <=s (const 64 (2**20)),
    r_276_281 - s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 + s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 - s_276_281 <=s (const 64 (2**20)),
    u_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_276_281 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_281_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_5,
sint64 g_236_low60_40_low20_5,
sint64 f_236_low60_40_low20_6,
sint64 g_236_low60_40_low20_6,
sint64 u_276_281,
sint64 v_276_281,
sint64 r_276_281,
sint64 s_276_281,
sint64 u_276_282,
sint64 v_276_282,
sint64 r_276_282,
sint64 s_276_282,
bit ne
)={
    u_276_281 * f_236_low60_40_low20_0 + v_276_281 * g_236_low60_40_low20_0 = f_236_low60_40_low20_5 * (-(2**20)),
    r_276_281 * f_236_low60_40_low20_0 + s_276_281 * g_236_low60_40_low20_0 = g_236_low60_40_low20_5 * (-(2**20))
&&
    u_276_281 * f_236_low60_40_low20_0 + v_276_281 * g_236_low60_40_low20_0 = f_236_low60_40_low20_5 * (const 64 (-(2**20))),
    r_276_281 * f_236_low60_40_low20_0 + s_276_281 * g_236_low60_40_low20_0 = g_236_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_5 + u_276_281 * (const 64 (2**21)) + v_276_281 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_5 + r_276_281 * (const 64 (2**21)) + s_276_281 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_5,
    f_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_5,
    g_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 281)) <=s delta, delta <=s (const 64 (1 + 2*281)),
    (const 64 (-(2**20))) <=s u_276_281, u_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_281, v_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_281, r_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_281, s_276_281 <=s (const 64 ((2**20)-1)),
    u_276_281 + v_276_281 <=s (const 64 (2**20)),
    u_276_281 - v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 + v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 - v_276_281 <=s (const 64 (2**20)),
    r_276_281 + s_276_281 <=s (const 64 (2**20)),
    r_276_281 - s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 + s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 - s_276_281 <=s (const 64 (2**20)),
    u_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_276_281 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step281

// premise a
assume
g_236_low60_40_low20_5 = 0 (mod 2)
&&
g_236_low60_40_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_6 f_236_low60_40_low20_5;
mov u_276_282 u_276_281;
mov v_276_282 v_276_281;

asr g_236_low60_40_low20_6 g_236_low60_40_low20_5 1;
asr r_276_282 r_276_281 1;
asr s_276_282 s_276_281 1;
assert
    true
&&
    f_236_low60_40_low20_6 = f_236_low60_40_low20_5,
    u_276_282 = u_276_281,
    v_276_282 = v_276_281,
    g_236_low60_40_low20_6 * (const 64 2) = g_236_low60_40_low20_5,
    r_276_282 * (const 64 2) = r_276_281,
    s_276_282 * (const 64 2) = s_276_281
;

assume
    f_236_low60_40_low20_6 = f_236_low60_40_low20_5,
    u_276_282 = u_276_281,
    v_276_282 = v_276_281,
    g_236_low60_40_low20_6 * 2 = g_236_low60_40_low20_5,
    r_276_282 * 2 = r_276_281,
    s_276_282 * 2 = s_276_281
&&
    true
;

{
    u_276_282 * f_236_low60_40_low20_0 + v_276_282 * g_236_low60_40_low20_0 = f_236_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_282 * f_236_low60_40_low20_0 + s_276_282 * g_236_low60_40_low20_0 = g_236_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_6 + u_276_282 * (const 64 (2**21)) + v_276_282 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_6 + r_276_282 * (const 64 (2**21)) + s_276_282 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_6,
    f_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_6,
    g_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 282)) <=s delta, delta <=s (const 64 (1 + 2*282)),
    (const 64 (-(2**20))) <=s u_276_282, u_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_282, v_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_282, r_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_282, s_276_282 <=s (const 64 ((2**20)-1)),
    u_276_282 + v_276_282 <=s (const 64 (2**20)),
    u_276_282 - v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 + v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 - v_276_282 <=s (const 64 (2**20)),
    r_276_282 + s_276_282 <=s (const 64 (2**20)),
    r_276_282 - s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 + s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 - s_276_282 <=s (const 64 (2**20)),
    u_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_276_282 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_281_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_5,
sint64 g_236_low60_40_low20_5,
sint64 f_236_low60_40_low20_6,
sint64 g_236_low60_40_low20_6,
sint64 u_276_281,
sint64 v_276_281,
sint64 r_276_281,
sint64 s_276_281,
sint64 u_276_282,
sint64 v_276_282,
sint64 r_276_282,
sint64 s_276_282,
bit ne
)={
    u_276_281 * f_236_low60_40_low20_0 + v_276_281 * g_236_low60_40_low20_0 = f_236_low60_40_low20_5 * (-(2**20)),
    r_276_281 * f_236_low60_40_low20_0 + s_276_281 * g_236_low60_40_low20_0 = g_236_low60_40_low20_5 * (-(2**20))
&&
    u_276_281 * f_236_low60_40_low20_0 + v_276_281 * g_236_low60_40_low20_0 = f_236_low60_40_low20_5 * (const 64 (-(2**20))),
    r_276_281 * f_236_low60_40_low20_0 + s_276_281 * g_236_low60_40_low20_0 = g_236_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_5 + u_276_281 * (const 64 (2**21)) + v_276_281 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_5 + r_276_281 * (const 64 (2**21)) + s_276_281 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_5,
    f_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_5,
    g_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 281)) <=s delta, delta <=s (const 64 (1 + 2*281)),
    (const 64 (-(2**20))) <=s u_276_281, u_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_281, v_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_281, r_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_281, s_276_281 <=s (const 64 ((2**20)-1)),
    u_276_281 + v_276_281 <=s (const 64 (2**20)),
    u_276_281 - v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 + v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 - v_276_281 <=s (const 64 (2**20)),
    r_276_281 + s_276_281 <=s (const 64 (2**20)),
    r_276_281 - s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 + s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 - s_276_281 <=s (const 64 (2**20)),
    u_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_276_281 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step281

// premise b
assume
g_236_low60_40_low20_5 = 1 (mod 2)
&&
g_236_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_6 f_236_low60_40_low20_5;
mov u_276_282 u_276_281;
mov v_276_282 v_276_281;

add g_236_low60_40_low20_6 g_236_low60_40_low20_5 f_236_low60_40_low20_5;
asr g_236_low60_40_low20_6 g_236_low60_40_low20_6 1;
add r_276_282 r_276_281 u_276_281;
asr r_276_282 r_276_282 1;
add s_276_282 s_276_281 v_276_281;
asr s_276_282 s_276_282 1;
assert
    true
&&
    f_236_low60_40_low20_6 = f_236_low60_40_low20_5,
    u_276_282 = u_276_281,
    v_276_282 = v_276_281,
    g_236_low60_40_low20_6 * (const 64 2) = g_236_low60_40_low20_5 + f_236_low60_40_low20_5,
    r_276_282 * (const 64 2) = r_276_281 + u_276_281,
    s_276_282 * (const 64 2) = s_276_281 + v_276_281
;

assume
    f_236_low60_40_low20_6 = f_236_low60_40_low20_5,
    u_276_282 = u_276_281,
    v_276_282 = v_276_281,
    g_236_low60_40_low20_6 * 2 = g_236_low60_40_low20_5 + f_236_low60_40_low20_5,
    r_276_282 * 2 = r_276_281 + u_276_281,
    s_276_282 * 2 = s_276_281 + v_276_281
&&
    true
;

{
    u_276_282 * f_236_low60_40_low20_0 + v_276_282 * g_236_low60_40_low20_0 = f_236_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_282 * f_236_low60_40_low20_0 + s_276_282 * g_236_low60_40_low20_0 = g_236_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_6 + u_276_282 * (const 64 (2**21)) + v_276_282 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_6 + r_276_282 * (const 64 (2**21)) + s_276_282 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_6,
    f_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_6,
    g_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 282)) <=s delta, delta <=s (const 64 (1 + 2*282)),
    (const 64 (-(2**20))) <=s u_276_282, u_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_282, v_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_282, r_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_282, s_276_282 <=s (const 64 ((2**20)-1)),
    u_276_282 + v_276_282 <=s (const 64 (2**20)),
    u_276_282 - v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 + v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 - v_276_282 <=s (const 64 (2**20)),
    r_276_282 + s_276_282 <=s (const 64 (2**20)),
    r_276_282 - s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 + s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 - s_276_282 <=s (const 64 (2**20)),
    u_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_276_282 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_281_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_5,
sint64 g_236_low60_40_low20_5,
sint64 f_236_low60_40_low20_6,
sint64 g_236_low60_40_low20_6,
sint64 u_276_281,
sint64 v_276_281,
sint64 r_276_281,
sint64 s_276_281,
sint64 u_276_282,
sint64 v_276_282,
sint64 r_276_282,
sint64 s_276_282,
bit ne
)={
    u_276_281 * f_236_low60_40_low20_0 + v_276_281 * g_236_low60_40_low20_0 = f_236_low60_40_low20_5 * (-(2**20)),
    r_276_281 * f_236_low60_40_low20_0 + s_276_281 * g_236_low60_40_low20_0 = g_236_low60_40_low20_5 * (-(2**20))
&&
    u_276_281 * f_236_low60_40_low20_0 + v_276_281 * g_236_low60_40_low20_0 = f_236_low60_40_low20_5 * (const 64 (-(2**20))),
    r_276_281 * f_236_low60_40_low20_0 + s_276_281 * g_236_low60_40_low20_0 = g_236_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_5 + u_276_281 * (const 64 (2**21)) + v_276_281 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_5 + r_276_281 * (const 64 (2**21)) + s_276_281 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_5,
    f_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_5,
    g_236_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 281)) <=s delta, delta <=s (const 64 (1 + 2*281)),
    (const 64 (-(2**20))) <=s u_276_281, u_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_281, v_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_281, r_276_281 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_281, s_276_281 <=s (const 64 ((2**20)-1)),
    u_276_281 + v_276_281 <=s (const 64 (2**20)),
    u_276_281 - v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 + v_276_281 <=s (const 64 (2**20)),
    (const 64 0) - u_276_281 - v_276_281 <=s (const 64 (2**20)),
    r_276_281 + s_276_281 <=s (const 64 (2**20)),
    r_276_281 - s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 + s_276_281 <=s (const 64 (2**20)),
    (const 64 0) - r_276_281 - s_276_281 <=s (const 64 (2**20)),
    u_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_276_281 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_276_281 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step281

// premise c
assume
g_236_low60_40_low20_5 = 1 (mod 2)
&&
g_236_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_6 g_236_low60_40_low20_5;
mov u_276_282 r_276_281;
mov v_276_282 s_276_281;

subs dc g_236_low60_40_low20_6 g_236_low60_40_low20_5 f_236_low60_40_low20_5;
asr g_236_low60_40_low20_6 g_236_low60_40_low20_6 1;
subs dc r_276_282 r_276_281 u_276_281;
asr r_276_282 r_276_282 1;
subs dc s_276_282 s_276_281 v_276_281;
asr s_276_282 s_276_282 1;
assert
    true
&&
    f_236_low60_40_low20_6 = g_236_low60_40_low20_5,
    u_276_282 = r_276_281,
    v_276_282 = s_276_281,
    g_236_low60_40_low20_6 * (const 64 2) = g_236_low60_40_low20_5 - f_236_low60_40_low20_5,
    r_276_282 * (const 64 2) = r_276_281 - u_276_281,
    s_276_282 * (const 64 2) = s_276_281 - v_276_281
;

assume
    f_236_low60_40_low20_6 = g_236_low60_40_low20_5,
    u_276_282 = r_276_281,
    v_276_282 = s_276_281,
    g_236_low60_40_low20_6 * 2 = g_236_low60_40_low20_5 - f_236_low60_40_low20_5,
    r_276_282 * 2 = r_276_281 - u_276_281,
    s_276_282 * 2 = s_276_281 - v_276_281
&&
    true
;

{
    u_276_282 * f_236_low60_40_low20_0 + v_276_282 * g_236_low60_40_low20_0 = f_236_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_282 * f_236_low60_40_low20_0 + s_276_282 * g_236_low60_40_low20_0 = g_236_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_6 + u_276_282 * (const 64 (2**21)) + v_276_282 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_6 + r_276_282 * (const 64 (2**21)) + s_276_282 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_6,
    f_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_6,
    g_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 282)) <=s delta, delta <=s (const 64 (1 + 2*282)),
    (const 64 (-(2**20))) <=s u_276_282, u_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_282, v_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_282, r_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_282, s_276_282 <=s (const 64 ((2**20)-1)),
    u_276_282 + v_276_282 <=s (const 64 (2**20)),
    u_276_282 - v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 + v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 - v_276_282 <=s (const 64 (2**20)),
    r_276_282 + s_276_282 <=s (const 64 (2**20)),
    r_276_282 - s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 + s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 - s_276_282 <=s (const 64 (2**20)),
    u_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_276_282 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_282_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_6,
sint64 g_236_low60_40_low20_6,
sint64 f_236_low60_40_low20_7,
sint64 g_236_low60_40_low20_7,
sint64 u_276_282,
sint64 v_276_282,
sint64 r_276_282,
sint64 s_276_282,
sint64 u_276_283,
sint64 v_276_283,
sint64 r_276_283,
sint64 s_276_283,
bit ne
)={
    u_276_282 * f_236_low60_40_low20_0 + v_276_282 * g_236_low60_40_low20_0 = f_236_low60_40_low20_6 * (-(2**20)),
    r_276_282 * f_236_low60_40_low20_0 + s_276_282 * g_236_low60_40_low20_0 = g_236_low60_40_low20_6 * (-(2**20))
&&
    u_276_282 * f_236_low60_40_low20_0 + v_276_282 * g_236_low60_40_low20_0 = f_236_low60_40_low20_6 * (const 64 (-(2**20))),
    r_276_282 * f_236_low60_40_low20_0 + s_276_282 * g_236_low60_40_low20_0 = g_236_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_6 + u_276_282 * (const 64 (2**21)) + v_276_282 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_6 + r_276_282 * (const 64 (2**21)) + s_276_282 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_6,
    f_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_6,
    g_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 282)) <=s delta, delta <=s (const 64 (1 + 2*282)),
    (const 64 (-(2**20))) <=s u_276_282, u_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_282, v_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_282, r_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_282, s_276_282 <=s (const 64 ((2**20)-1)),
    u_276_282 + v_276_282 <=s (const 64 (2**20)),
    u_276_282 - v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 + v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 - v_276_282 <=s (const 64 (2**20)),
    r_276_282 + s_276_282 <=s (const 64 (2**20)),
    r_276_282 - s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 + s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 - s_276_282 <=s (const 64 (2**20)),
    u_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_276_282 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step282

// premise a
assume
g_236_low60_40_low20_6 = 0 (mod 2)
&&
g_236_low60_40_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_7 f_236_low60_40_low20_6;
mov u_276_283 u_276_282;
mov v_276_283 v_276_282;

asr g_236_low60_40_low20_7 g_236_low60_40_low20_6 1;
asr r_276_283 r_276_282 1;
asr s_276_283 s_276_282 1;
assert
    true
&&
    f_236_low60_40_low20_7 = f_236_low60_40_low20_6,
    u_276_283 = u_276_282,
    v_276_283 = v_276_282,
    g_236_low60_40_low20_7 * (const 64 2) = g_236_low60_40_low20_6,
    r_276_283 * (const 64 2) = r_276_282,
    s_276_283 * (const 64 2) = s_276_282
;

assume
    f_236_low60_40_low20_7 = f_236_low60_40_low20_6,
    u_276_283 = u_276_282,
    v_276_283 = v_276_282,
    g_236_low60_40_low20_7 * 2 = g_236_low60_40_low20_6,
    r_276_283 * 2 = r_276_282,
    s_276_283 * 2 = s_276_282
&&
    true
;

{
    u_276_283 * f_236_low60_40_low20_0 + v_276_283 * g_236_low60_40_low20_0 = f_236_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_283 * f_236_low60_40_low20_0 + s_276_283 * g_236_low60_40_low20_0 = g_236_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_7 + u_276_283 * (const 64 (2**21)) + v_276_283 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_7 + r_276_283 * (const 64 (2**21)) + s_276_283 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_7,
    f_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_7,
    g_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 283)) <=s delta, delta <=s (const 64 (1 + 2*283)),
    (const 64 (-(2**20))) <=s u_276_283, u_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_283, v_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_283, r_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_283, s_276_283 <=s (const 64 ((2**20)-1)),
    u_276_283 + v_276_283 <=s (const 64 (2**20)),
    u_276_283 - v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 + v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 - v_276_283 <=s (const 64 (2**20)),
    r_276_283 + s_276_283 <=s (const 64 (2**20)),
    r_276_283 - s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 + s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 - s_276_283 <=s (const 64 (2**20)),
    u_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_276_283 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_282_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_6,
sint64 g_236_low60_40_low20_6,
sint64 f_236_low60_40_low20_7,
sint64 g_236_low60_40_low20_7,
sint64 u_276_282,
sint64 v_276_282,
sint64 r_276_282,
sint64 s_276_282,
sint64 u_276_283,
sint64 v_276_283,
sint64 r_276_283,
sint64 s_276_283,
bit ne
)={
    u_276_282 * f_236_low60_40_low20_0 + v_276_282 * g_236_low60_40_low20_0 = f_236_low60_40_low20_6 * (-(2**20)),
    r_276_282 * f_236_low60_40_low20_0 + s_276_282 * g_236_low60_40_low20_0 = g_236_low60_40_low20_6 * (-(2**20))
&&
    u_276_282 * f_236_low60_40_low20_0 + v_276_282 * g_236_low60_40_low20_0 = f_236_low60_40_low20_6 * (const 64 (-(2**20))),
    r_276_282 * f_236_low60_40_low20_0 + s_276_282 * g_236_low60_40_low20_0 = g_236_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_6 + u_276_282 * (const 64 (2**21)) + v_276_282 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_6 + r_276_282 * (const 64 (2**21)) + s_276_282 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_6,
    f_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_6,
    g_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 282)) <=s delta, delta <=s (const 64 (1 + 2*282)),
    (const 64 (-(2**20))) <=s u_276_282, u_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_282, v_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_282, r_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_282, s_276_282 <=s (const 64 ((2**20)-1)),
    u_276_282 + v_276_282 <=s (const 64 (2**20)),
    u_276_282 - v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 + v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 - v_276_282 <=s (const 64 (2**20)),
    r_276_282 + s_276_282 <=s (const 64 (2**20)),
    r_276_282 - s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 + s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 - s_276_282 <=s (const 64 (2**20)),
    u_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_276_282 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step282

// premise b
assume
g_236_low60_40_low20_6 = 1 (mod 2)
&&
g_236_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_7 f_236_low60_40_low20_6;
mov u_276_283 u_276_282;
mov v_276_283 v_276_282;

add g_236_low60_40_low20_7 g_236_low60_40_low20_6 f_236_low60_40_low20_6;
asr g_236_low60_40_low20_7 g_236_low60_40_low20_7 1;
add r_276_283 r_276_282 u_276_282;
asr r_276_283 r_276_283 1;
add s_276_283 s_276_282 v_276_282;
asr s_276_283 s_276_283 1;
assert
    true
&&
    f_236_low60_40_low20_7 = f_236_low60_40_low20_6,
    u_276_283 = u_276_282,
    v_276_283 = v_276_282,
    g_236_low60_40_low20_7 * (const 64 2) = g_236_low60_40_low20_6 + f_236_low60_40_low20_6,
    r_276_283 * (const 64 2) = r_276_282 + u_276_282,
    s_276_283 * (const 64 2) = s_276_282 + v_276_282
;

assume
    f_236_low60_40_low20_7 = f_236_low60_40_low20_6,
    u_276_283 = u_276_282,
    v_276_283 = v_276_282,
    g_236_low60_40_low20_7 * 2 = g_236_low60_40_low20_6 + f_236_low60_40_low20_6,
    r_276_283 * 2 = r_276_282 + u_276_282,
    s_276_283 * 2 = s_276_282 + v_276_282
&&
    true
;

{
    u_276_283 * f_236_low60_40_low20_0 + v_276_283 * g_236_low60_40_low20_0 = f_236_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_283 * f_236_low60_40_low20_0 + s_276_283 * g_236_low60_40_low20_0 = g_236_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_7 + u_276_283 * (const 64 (2**21)) + v_276_283 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_7 + r_276_283 * (const 64 (2**21)) + s_276_283 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_7,
    f_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_7,
    g_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 283)) <=s delta, delta <=s (const 64 (1 + 2*283)),
    (const 64 (-(2**20))) <=s u_276_283, u_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_283, v_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_283, r_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_283, s_276_283 <=s (const 64 ((2**20)-1)),
    u_276_283 + v_276_283 <=s (const 64 (2**20)),
    u_276_283 - v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 + v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 - v_276_283 <=s (const 64 (2**20)),
    r_276_283 + s_276_283 <=s (const 64 (2**20)),
    r_276_283 - s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 + s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 - s_276_283 <=s (const 64 (2**20)),
    u_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_276_283 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_282_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_6,
sint64 g_236_low60_40_low20_6,
sint64 f_236_low60_40_low20_7,
sint64 g_236_low60_40_low20_7,
sint64 u_276_282,
sint64 v_276_282,
sint64 r_276_282,
sint64 s_276_282,
sint64 u_276_283,
sint64 v_276_283,
sint64 r_276_283,
sint64 s_276_283,
bit ne
)={
    u_276_282 * f_236_low60_40_low20_0 + v_276_282 * g_236_low60_40_low20_0 = f_236_low60_40_low20_6 * (-(2**20)),
    r_276_282 * f_236_low60_40_low20_0 + s_276_282 * g_236_low60_40_low20_0 = g_236_low60_40_low20_6 * (-(2**20))
&&
    u_276_282 * f_236_low60_40_low20_0 + v_276_282 * g_236_low60_40_low20_0 = f_236_low60_40_low20_6 * (const 64 (-(2**20))),
    r_276_282 * f_236_low60_40_low20_0 + s_276_282 * g_236_low60_40_low20_0 = g_236_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_6 + u_276_282 * (const 64 (2**21)) + v_276_282 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_6 + r_276_282 * (const 64 (2**21)) + s_276_282 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_6,
    f_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_6,
    g_236_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 282)) <=s delta, delta <=s (const 64 (1 + 2*282)),
    (const 64 (-(2**20))) <=s u_276_282, u_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_282, v_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_282, r_276_282 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_282, s_276_282 <=s (const 64 ((2**20)-1)),
    u_276_282 + v_276_282 <=s (const 64 (2**20)),
    u_276_282 - v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 + v_276_282 <=s (const 64 (2**20)),
    (const 64 0) - u_276_282 - v_276_282 <=s (const 64 (2**20)),
    r_276_282 + s_276_282 <=s (const 64 (2**20)),
    r_276_282 - s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 + s_276_282 <=s (const 64 (2**20)),
    (const 64 0) - r_276_282 - s_276_282 <=s (const 64 (2**20)),
    u_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_276_282 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_276_282 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step282

// premise c
assume
g_236_low60_40_low20_6 = 1 (mod 2)
&&
g_236_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_7 g_236_low60_40_low20_6;
mov u_276_283 r_276_282;
mov v_276_283 s_276_282;

subs dc g_236_low60_40_low20_7 g_236_low60_40_low20_6 f_236_low60_40_low20_6;
asr g_236_low60_40_low20_7 g_236_low60_40_low20_7 1;
subs dc r_276_283 r_276_282 u_276_282;
asr r_276_283 r_276_283 1;
subs dc s_276_283 s_276_282 v_276_282;
asr s_276_283 s_276_283 1;
assert
    true
&&
    f_236_low60_40_low20_7 = g_236_low60_40_low20_6,
    u_276_283 = r_276_282,
    v_276_283 = s_276_282,
    g_236_low60_40_low20_7 * (const 64 2) = g_236_low60_40_low20_6 - f_236_low60_40_low20_6,
    r_276_283 * (const 64 2) = r_276_282 - u_276_282,
    s_276_283 * (const 64 2) = s_276_282 - v_276_282
;

assume
    f_236_low60_40_low20_7 = g_236_low60_40_low20_6,
    u_276_283 = r_276_282,
    v_276_283 = s_276_282,
    g_236_low60_40_low20_7 * 2 = g_236_low60_40_low20_6 - f_236_low60_40_low20_6,
    r_276_283 * 2 = r_276_282 - u_276_282,
    s_276_283 * 2 = s_276_282 - v_276_282
&&
    true
;

{
    u_276_283 * f_236_low60_40_low20_0 + v_276_283 * g_236_low60_40_low20_0 = f_236_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_283 * f_236_low60_40_low20_0 + s_276_283 * g_236_low60_40_low20_0 = g_236_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_7 + u_276_283 * (const 64 (2**21)) + v_276_283 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_7 + r_276_283 * (const 64 (2**21)) + s_276_283 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_7,
    f_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_7,
    g_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 283)) <=s delta, delta <=s (const 64 (1 + 2*283)),
    (const 64 (-(2**20))) <=s u_276_283, u_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_283, v_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_283, r_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_283, s_276_283 <=s (const 64 ((2**20)-1)),
    u_276_283 + v_276_283 <=s (const 64 (2**20)),
    u_276_283 - v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 + v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 - v_276_283 <=s (const 64 (2**20)),
    r_276_283 + s_276_283 <=s (const 64 (2**20)),
    r_276_283 - s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 + s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 - s_276_283 <=s (const 64 (2**20)),
    u_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_276_283 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_283_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_7,
sint64 g_236_low60_40_low20_7,
sint64 f_236_low60_40_low20_8,
sint64 g_236_low60_40_low20_8,
sint64 u_276_283,
sint64 v_276_283,
sint64 r_276_283,
sint64 s_276_283,
sint64 u_276_284,
sint64 v_276_284,
sint64 r_276_284,
sint64 s_276_284,
bit ne
)={
    u_276_283 * f_236_low60_40_low20_0 + v_276_283 * g_236_low60_40_low20_0 = f_236_low60_40_low20_7 * (-(2**20)),
    r_276_283 * f_236_low60_40_low20_0 + s_276_283 * g_236_low60_40_low20_0 = g_236_low60_40_low20_7 * (-(2**20))
&&
    u_276_283 * f_236_low60_40_low20_0 + v_276_283 * g_236_low60_40_low20_0 = f_236_low60_40_low20_7 * (const 64 (-(2**20))),
    r_276_283 * f_236_low60_40_low20_0 + s_276_283 * g_236_low60_40_low20_0 = g_236_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_7 + u_276_283 * (const 64 (2**21)) + v_276_283 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_7 + r_276_283 * (const 64 (2**21)) + s_276_283 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_7,
    f_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_7,
    g_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 283)) <=s delta, delta <=s (const 64 (1 + 2*283)),
    (const 64 (-(2**20))) <=s u_276_283, u_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_283, v_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_283, r_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_283, s_276_283 <=s (const 64 ((2**20)-1)),
    u_276_283 + v_276_283 <=s (const 64 (2**20)),
    u_276_283 - v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 + v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 - v_276_283 <=s (const 64 (2**20)),
    r_276_283 + s_276_283 <=s (const 64 (2**20)),
    r_276_283 - s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 + s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 - s_276_283 <=s (const 64 (2**20)),
    u_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_276_283 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step283

// premise a
assume
g_236_low60_40_low20_7 = 0 (mod 2)
&&
g_236_low60_40_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_8 f_236_low60_40_low20_7;
mov u_276_284 u_276_283;
mov v_276_284 v_276_283;

asr g_236_low60_40_low20_8 g_236_low60_40_low20_7 1;
asr r_276_284 r_276_283 1;
asr s_276_284 s_276_283 1;
assert
    true
&&
    f_236_low60_40_low20_8 = f_236_low60_40_low20_7,
    u_276_284 = u_276_283,
    v_276_284 = v_276_283,
    g_236_low60_40_low20_8 * (const 64 2) = g_236_low60_40_low20_7,
    r_276_284 * (const 64 2) = r_276_283,
    s_276_284 * (const 64 2) = s_276_283
;

assume
    f_236_low60_40_low20_8 = f_236_low60_40_low20_7,
    u_276_284 = u_276_283,
    v_276_284 = v_276_283,
    g_236_low60_40_low20_8 * 2 = g_236_low60_40_low20_7,
    r_276_284 * 2 = r_276_283,
    s_276_284 * 2 = s_276_283
&&
    true
;

{
    u_276_284 * f_236_low60_40_low20_0 + v_276_284 * g_236_low60_40_low20_0 = f_236_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_284 * f_236_low60_40_low20_0 + s_276_284 * g_236_low60_40_low20_0 = g_236_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_8 + u_276_284 * (const 64 (2**21)) + v_276_284 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_8 + r_276_284 * (const 64 (2**21)) + s_276_284 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_8,
    f_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_8,
    g_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 284)) <=s delta, delta <=s (const 64 (1 + 2*284)),
    (const 64 (-(2**20))) <=s u_276_284, u_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_284, v_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_284, r_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_284, s_276_284 <=s (const 64 ((2**20)-1)),
    u_276_284 + v_276_284 <=s (const 64 (2**20)),
    u_276_284 - v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 + v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 - v_276_284 <=s (const 64 (2**20)),
    r_276_284 + s_276_284 <=s (const 64 (2**20)),
    r_276_284 - s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 + s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 - s_276_284 <=s (const 64 (2**20)),
    u_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_276_284 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_283_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_7,
sint64 g_236_low60_40_low20_7,
sint64 f_236_low60_40_low20_8,
sint64 g_236_low60_40_low20_8,
sint64 u_276_283,
sint64 v_276_283,
sint64 r_276_283,
sint64 s_276_283,
sint64 u_276_284,
sint64 v_276_284,
sint64 r_276_284,
sint64 s_276_284,
bit ne
)={
    u_276_283 * f_236_low60_40_low20_0 + v_276_283 * g_236_low60_40_low20_0 = f_236_low60_40_low20_7 * (-(2**20)),
    r_276_283 * f_236_low60_40_low20_0 + s_276_283 * g_236_low60_40_low20_0 = g_236_low60_40_low20_7 * (-(2**20))
&&
    u_276_283 * f_236_low60_40_low20_0 + v_276_283 * g_236_low60_40_low20_0 = f_236_low60_40_low20_7 * (const 64 (-(2**20))),
    r_276_283 * f_236_low60_40_low20_0 + s_276_283 * g_236_low60_40_low20_0 = g_236_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_7 + u_276_283 * (const 64 (2**21)) + v_276_283 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_7 + r_276_283 * (const 64 (2**21)) + s_276_283 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_7,
    f_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_7,
    g_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 283)) <=s delta, delta <=s (const 64 (1 + 2*283)),
    (const 64 (-(2**20))) <=s u_276_283, u_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_283, v_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_283, r_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_283, s_276_283 <=s (const 64 ((2**20)-1)),
    u_276_283 + v_276_283 <=s (const 64 (2**20)),
    u_276_283 - v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 + v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 - v_276_283 <=s (const 64 (2**20)),
    r_276_283 + s_276_283 <=s (const 64 (2**20)),
    r_276_283 - s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 + s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 - s_276_283 <=s (const 64 (2**20)),
    u_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_276_283 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step283

// premise b
assume
g_236_low60_40_low20_7 = 1 (mod 2)
&&
g_236_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_8 f_236_low60_40_low20_7;
mov u_276_284 u_276_283;
mov v_276_284 v_276_283;

add g_236_low60_40_low20_8 g_236_low60_40_low20_7 f_236_low60_40_low20_7;
asr g_236_low60_40_low20_8 g_236_low60_40_low20_8 1;
add r_276_284 r_276_283 u_276_283;
asr r_276_284 r_276_284 1;
add s_276_284 s_276_283 v_276_283;
asr s_276_284 s_276_284 1;
assert
    true
&&
    f_236_low60_40_low20_8 = f_236_low60_40_low20_7,
    u_276_284 = u_276_283,
    v_276_284 = v_276_283,
    g_236_low60_40_low20_8 * (const 64 2) = g_236_low60_40_low20_7 + f_236_low60_40_low20_7,
    r_276_284 * (const 64 2) = r_276_283 + u_276_283,
    s_276_284 * (const 64 2) = s_276_283 + v_276_283
;

assume
    f_236_low60_40_low20_8 = f_236_low60_40_low20_7,
    u_276_284 = u_276_283,
    v_276_284 = v_276_283,
    g_236_low60_40_low20_8 * 2 = g_236_low60_40_low20_7 + f_236_low60_40_low20_7,
    r_276_284 * 2 = r_276_283 + u_276_283,
    s_276_284 * 2 = s_276_283 + v_276_283
&&
    true
;

{
    u_276_284 * f_236_low60_40_low20_0 + v_276_284 * g_236_low60_40_low20_0 = f_236_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_284 * f_236_low60_40_low20_0 + s_276_284 * g_236_low60_40_low20_0 = g_236_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_8 + u_276_284 * (const 64 (2**21)) + v_276_284 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_8 + r_276_284 * (const 64 (2**21)) + s_276_284 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_8,
    f_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_8,
    g_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 284)) <=s delta, delta <=s (const 64 (1 + 2*284)),
    (const 64 (-(2**20))) <=s u_276_284, u_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_284, v_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_284, r_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_284, s_276_284 <=s (const 64 ((2**20)-1)),
    u_276_284 + v_276_284 <=s (const 64 (2**20)),
    u_276_284 - v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 + v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 - v_276_284 <=s (const 64 (2**20)),
    r_276_284 + s_276_284 <=s (const 64 (2**20)),
    r_276_284 - s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 + s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 - s_276_284 <=s (const 64 (2**20)),
    u_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_276_284 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_283_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_7,
sint64 g_236_low60_40_low20_7,
sint64 f_236_low60_40_low20_8,
sint64 g_236_low60_40_low20_8,
sint64 u_276_283,
sint64 v_276_283,
sint64 r_276_283,
sint64 s_276_283,
sint64 u_276_284,
sint64 v_276_284,
sint64 r_276_284,
sint64 s_276_284,
bit ne
)={
    u_276_283 * f_236_low60_40_low20_0 + v_276_283 * g_236_low60_40_low20_0 = f_236_low60_40_low20_7 * (-(2**20)),
    r_276_283 * f_236_low60_40_low20_0 + s_276_283 * g_236_low60_40_low20_0 = g_236_low60_40_low20_7 * (-(2**20))
&&
    u_276_283 * f_236_low60_40_low20_0 + v_276_283 * g_236_low60_40_low20_0 = f_236_low60_40_low20_7 * (const 64 (-(2**20))),
    r_276_283 * f_236_low60_40_low20_0 + s_276_283 * g_236_low60_40_low20_0 = g_236_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_7 + u_276_283 * (const 64 (2**21)) + v_276_283 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_7 + r_276_283 * (const 64 (2**21)) + s_276_283 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_7,
    f_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_7,
    g_236_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 283)) <=s delta, delta <=s (const 64 (1 + 2*283)),
    (const 64 (-(2**20))) <=s u_276_283, u_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_283, v_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_283, r_276_283 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_283, s_276_283 <=s (const 64 ((2**20)-1)),
    u_276_283 + v_276_283 <=s (const 64 (2**20)),
    u_276_283 - v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 + v_276_283 <=s (const 64 (2**20)),
    (const 64 0) - u_276_283 - v_276_283 <=s (const 64 (2**20)),
    r_276_283 + s_276_283 <=s (const 64 (2**20)),
    r_276_283 - s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 + s_276_283 <=s (const 64 (2**20)),
    (const 64 0) - r_276_283 - s_276_283 <=s (const 64 (2**20)),
    u_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_276_283 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_276_283 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step283

// premise c
assume
g_236_low60_40_low20_7 = 1 (mod 2)
&&
g_236_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_8 g_236_low60_40_low20_7;
mov u_276_284 r_276_283;
mov v_276_284 s_276_283;

subs dc g_236_low60_40_low20_8 g_236_low60_40_low20_7 f_236_low60_40_low20_7;
asr g_236_low60_40_low20_8 g_236_low60_40_low20_8 1;
subs dc r_276_284 r_276_283 u_276_283;
asr r_276_284 r_276_284 1;
subs dc s_276_284 s_276_283 v_276_283;
asr s_276_284 s_276_284 1;
assert
    true
&&
    f_236_low60_40_low20_8 = g_236_low60_40_low20_7,
    u_276_284 = r_276_283,
    v_276_284 = s_276_283,
    g_236_low60_40_low20_8 * (const 64 2) = g_236_low60_40_low20_7 - f_236_low60_40_low20_7,
    r_276_284 * (const 64 2) = r_276_283 - u_276_283,
    s_276_284 * (const 64 2) = s_276_283 - v_276_283
;

assume
    f_236_low60_40_low20_8 = g_236_low60_40_low20_7,
    u_276_284 = r_276_283,
    v_276_284 = s_276_283,
    g_236_low60_40_low20_8 * 2 = g_236_low60_40_low20_7 - f_236_low60_40_low20_7,
    r_276_284 * 2 = r_276_283 - u_276_283,
    s_276_284 * 2 = s_276_283 - v_276_283
&&
    true
;

{
    u_276_284 * f_236_low60_40_low20_0 + v_276_284 * g_236_low60_40_low20_0 = f_236_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_284 * f_236_low60_40_low20_0 + s_276_284 * g_236_low60_40_low20_0 = g_236_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_8 + u_276_284 * (const 64 (2**21)) + v_276_284 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_8 + r_276_284 * (const 64 (2**21)) + s_276_284 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_8,
    f_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_8,
    g_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 284)) <=s delta, delta <=s (const 64 (1 + 2*284)),
    (const 64 (-(2**20))) <=s u_276_284, u_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_284, v_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_284, r_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_284, s_276_284 <=s (const 64 ((2**20)-1)),
    u_276_284 + v_276_284 <=s (const 64 (2**20)),
    u_276_284 - v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 + v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 - v_276_284 <=s (const 64 (2**20)),
    r_276_284 + s_276_284 <=s (const 64 (2**20)),
    r_276_284 - s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 + s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 - s_276_284 <=s (const 64 (2**20)),
    u_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_276_284 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_284_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_8,
sint64 g_236_low60_40_low20_8,
sint64 f_236_low60_40_low20_9,
sint64 g_236_low60_40_low20_9,
sint64 u_276_284,
sint64 v_276_284,
sint64 r_276_284,
sint64 s_276_284,
sint64 u_276_285,
sint64 v_276_285,
sint64 r_276_285,
sint64 s_276_285,
bit ne
)={
    u_276_284 * f_236_low60_40_low20_0 + v_276_284 * g_236_low60_40_low20_0 = f_236_low60_40_low20_8 * (-(2**20)),
    r_276_284 * f_236_low60_40_low20_0 + s_276_284 * g_236_low60_40_low20_0 = g_236_low60_40_low20_8 * (-(2**20))
&&
    u_276_284 * f_236_low60_40_low20_0 + v_276_284 * g_236_low60_40_low20_0 = f_236_low60_40_low20_8 * (const 64 (-(2**20))),
    r_276_284 * f_236_low60_40_low20_0 + s_276_284 * g_236_low60_40_low20_0 = g_236_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_8 + u_276_284 * (const 64 (2**21)) + v_276_284 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_8 + r_276_284 * (const 64 (2**21)) + s_276_284 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_8,
    f_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_8,
    g_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 284)) <=s delta, delta <=s (const 64 (1 + 2*284)),
    (const 64 (-(2**20))) <=s u_276_284, u_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_284, v_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_284, r_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_284, s_276_284 <=s (const 64 ((2**20)-1)),
    u_276_284 + v_276_284 <=s (const 64 (2**20)),
    u_276_284 - v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 + v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 - v_276_284 <=s (const 64 (2**20)),
    r_276_284 + s_276_284 <=s (const 64 (2**20)),
    r_276_284 - s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 + s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 - s_276_284 <=s (const 64 (2**20)),
    u_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_276_284 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step284

// premise a
assume
g_236_low60_40_low20_8 = 0 (mod 2)
&&
g_236_low60_40_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_9 f_236_low60_40_low20_8;
mov u_276_285 u_276_284;
mov v_276_285 v_276_284;

asr g_236_low60_40_low20_9 g_236_low60_40_low20_8 1;
asr r_276_285 r_276_284 1;
asr s_276_285 s_276_284 1;
assert
    true
&&
    f_236_low60_40_low20_9 = f_236_low60_40_low20_8,
    u_276_285 = u_276_284,
    v_276_285 = v_276_284,
    g_236_low60_40_low20_9 * (const 64 2) = g_236_low60_40_low20_8,
    r_276_285 * (const 64 2) = r_276_284,
    s_276_285 * (const 64 2) = s_276_284
;

assume
    f_236_low60_40_low20_9 = f_236_low60_40_low20_8,
    u_276_285 = u_276_284,
    v_276_285 = v_276_284,
    g_236_low60_40_low20_9 * 2 = g_236_low60_40_low20_8,
    r_276_285 * 2 = r_276_284,
    s_276_285 * 2 = s_276_284
&&
    true
;

{
    u_276_285 * f_236_low60_40_low20_0 + v_276_285 * g_236_low60_40_low20_0 = f_236_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_285 * f_236_low60_40_low20_0 + s_276_285 * g_236_low60_40_low20_0 = g_236_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_9 + u_276_285 * (const 64 (2**21)) + v_276_285 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_9 + r_276_285 * (const 64 (2**21)) + s_276_285 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_9,
    f_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_9,
    g_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 285)) <=s delta, delta <=s (const 64 (1 + 2*285)),
    (const 64 (-(2**20))) <=s u_276_285, u_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_285, v_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_285, r_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_285, s_276_285 <=s (const 64 ((2**20)-1)),
    u_276_285 + v_276_285 <=s (const 64 (2**20)),
    u_276_285 - v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 + v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 - v_276_285 <=s (const 64 (2**20)),
    r_276_285 + s_276_285 <=s (const 64 (2**20)),
    r_276_285 - s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 + s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 - s_276_285 <=s (const 64 (2**20)),
    u_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_276_285 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_284_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_8,
sint64 g_236_low60_40_low20_8,
sint64 f_236_low60_40_low20_9,
sint64 g_236_low60_40_low20_9,
sint64 u_276_284,
sint64 v_276_284,
sint64 r_276_284,
sint64 s_276_284,
sint64 u_276_285,
sint64 v_276_285,
sint64 r_276_285,
sint64 s_276_285,
bit ne
)={
    u_276_284 * f_236_low60_40_low20_0 + v_276_284 * g_236_low60_40_low20_0 = f_236_low60_40_low20_8 * (-(2**20)),
    r_276_284 * f_236_low60_40_low20_0 + s_276_284 * g_236_low60_40_low20_0 = g_236_low60_40_low20_8 * (-(2**20))
&&
    u_276_284 * f_236_low60_40_low20_0 + v_276_284 * g_236_low60_40_low20_0 = f_236_low60_40_low20_8 * (const 64 (-(2**20))),
    r_276_284 * f_236_low60_40_low20_0 + s_276_284 * g_236_low60_40_low20_0 = g_236_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_8 + u_276_284 * (const 64 (2**21)) + v_276_284 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_8 + r_276_284 * (const 64 (2**21)) + s_276_284 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_8,
    f_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_8,
    g_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 284)) <=s delta, delta <=s (const 64 (1 + 2*284)),
    (const 64 (-(2**20))) <=s u_276_284, u_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_284, v_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_284, r_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_284, s_276_284 <=s (const 64 ((2**20)-1)),
    u_276_284 + v_276_284 <=s (const 64 (2**20)),
    u_276_284 - v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 + v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 - v_276_284 <=s (const 64 (2**20)),
    r_276_284 + s_276_284 <=s (const 64 (2**20)),
    r_276_284 - s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 + s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 - s_276_284 <=s (const 64 (2**20)),
    u_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_276_284 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step284

// premise b
assume
g_236_low60_40_low20_8 = 1 (mod 2)
&&
g_236_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_9 f_236_low60_40_low20_8;
mov u_276_285 u_276_284;
mov v_276_285 v_276_284;

add g_236_low60_40_low20_9 g_236_low60_40_low20_8 f_236_low60_40_low20_8;
asr g_236_low60_40_low20_9 g_236_low60_40_low20_9 1;
add r_276_285 r_276_284 u_276_284;
asr r_276_285 r_276_285 1;
add s_276_285 s_276_284 v_276_284;
asr s_276_285 s_276_285 1;
assert
    true
&&
    f_236_low60_40_low20_9 = f_236_low60_40_low20_8,
    u_276_285 = u_276_284,
    v_276_285 = v_276_284,
    g_236_low60_40_low20_9 * (const 64 2) = g_236_low60_40_low20_8 + f_236_low60_40_low20_8,
    r_276_285 * (const 64 2) = r_276_284 + u_276_284,
    s_276_285 * (const 64 2) = s_276_284 + v_276_284
;

assume
    f_236_low60_40_low20_9 = f_236_low60_40_low20_8,
    u_276_285 = u_276_284,
    v_276_285 = v_276_284,
    g_236_low60_40_low20_9 * 2 = g_236_low60_40_low20_8 + f_236_low60_40_low20_8,
    r_276_285 * 2 = r_276_284 + u_276_284,
    s_276_285 * 2 = s_276_284 + v_276_284
&&
    true
;

{
    u_276_285 * f_236_low60_40_low20_0 + v_276_285 * g_236_low60_40_low20_0 = f_236_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_285 * f_236_low60_40_low20_0 + s_276_285 * g_236_low60_40_low20_0 = g_236_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_9 + u_276_285 * (const 64 (2**21)) + v_276_285 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_9 + r_276_285 * (const 64 (2**21)) + s_276_285 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_9,
    f_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_9,
    g_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 285)) <=s delta, delta <=s (const 64 (1 + 2*285)),
    (const 64 (-(2**20))) <=s u_276_285, u_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_285, v_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_285, r_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_285, s_276_285 <=s (const 64 ((2**20)-1)),
    u_276_285 + v_276_285 <=s (const 64 (2**20)),
    u_276_285 - v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 + v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 - v_276_285 <=s (const 64 (2**20)),
    r_276_285 + s_276_285 <=s (const 64 (2**20)),
    r_276_285 - s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 + s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 - s_276_285 <=s (const 64 (2**20)),
    u_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_276_285 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_284_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_8,
sint64 g_236_low60_40_low20_8,
sint64 f_236_low60_40_low20_9,
sint64 g_236_low60_40_low20_9,
sint64 u_276_284,
sint64 v_276_284,
sint64 r_276_284,
sint64 s_276_284,
sint64 u_276_285,
sint64 v_276_285,
sint64 r_276_285,
sint64 s_276_285,
bit ne
)={
    u_276_284 * f_236_low60_40_low20_0 + v_276_284 * g_236_low60_40_low20_0 = f_236_low60_40_low20_8 * (-(2**20)),
    r_276_284 * f_236_low60_40_low20_0 + s_276_284 * g_236_low60_40_low20_0 = g_236_low60_40_low20_8 * (-(2**20))
&&
    u_276_284 * f_236_low60_40_low20_0 + v_276_284 * g_236_low60_40_low20_0 = f_236_low60_40_low20_8 * (const 64 (-(2**20))),
    r_276_284 * f_236_low60_40_low20_0 + s_276_284 * g_236_low60_40_low20_0 = g_236_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_8 + u_276_284 * (const 64 (2**21)) + v_276_284 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_8 + r_276_284 * (const 64 (2**21)) + s_276_284 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_8,
    f_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_8,
    g_236_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 284)) <=s delta, delta <=s (const 64 (1 + 2*284)),
    (const 64 (-(2**20))) <=s u_276_284, u_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_284, v_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_284, r_276_284 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_284, s_276_284 <=s (const 64 ((2**20)-1)),
    u_276_284 + v_276_284 <=s (const 64 (2**20)),
    u_276_284 - v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 + v_276_284 <=s (const 64 (2**20)),
    (const 64 0) - u_276_284 - v_276_284 <=s (const 64 (2**20)),
    r_276_284 + s_276_284 <=s (const 64 (2**20)),
    r_276_284 - s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 + s_276_284 <=s (const 64 (2**20)),
    (const 64 0) - r_276_284 - s_276_284 <=s (const 64 (2**20)),
    u_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_276_284 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_276_284 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step284

// premise c
assume
g_236_low60_40_low20_8 = 1 (mod 2)
&&
g_236_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_9 g_236_low60_40_low20_8;
mov u_276_285 r_276_284;
mov v_276_285 s_276_284;

subs dc g_236_low60_40_low20_9 g_236_low60_40_low20_8 f_236_low60_40_low20_8;
asr g_236_low60_40_low20_9 g_236_low60_40_low20_9 1;
subs dc r_276_285 r_276_284 u_276_284;
asr r_276_285 r_276_285 1;
subs dc s_276_285 s_276_284 v_276_284;
asr s_276_285 s_276_285 1;
assert
    true
&&
    f_236_low60_40_low20_9 = g_236_low60_40_low20_8,
    u_276_285 = r_276_284,
    v_276_285 = s_276_284,
    g_236_low60_40_low20_9 * (const 64 2) = g_236_low60_40_low20_8 - f_236_low60_40_low20_8,
    r_276_285 * (const 64 2) = r_276_284 - u_276_284,
    s_276_285 * (const 64 2) = s_276_284 - v_276_284
;

assume
    f_236_low60_40_low20_9 = g_236_low60_40_low20_8,
    u_276_285 = r_276_284,
    v_276_285 = s_276_284,
    g_236_low60_40_low20_9 * 2 = g_236_low60_40_low20_8 - f_236_low60_40_low20_8,
    r_276_285 * 2 = r_276_284 - u_276_284,
    s_276_285 * 2 = s_276_284 - v_276_284
&&
    true
;

{
    u_276_285 * f_236_low60_40_low20_0 + v_276_285 * g_236_low60_40_low20_0 = f_236_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_285 * f_236_low60_40_low20_0 + s_276_285 * g_236_low60_40_low20_0 = g_236_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_9 + u_276_285 * (const 64 (2**21)) + v_276_285 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_9 + r_276_285 * (const 64 (2**21)) + s_276_285 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_9,
    f_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_9,
    g_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 285)) <=s delta, delta <=s (const 64 (1 + 2*285)),
    (const 64 (-(2**20))) <=s u_276_285, u_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_285, v_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_285, r_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_285, s_276_285 <=s (const 64 ((2**20)-1)),
    u_276_285 + v_276_285 <=s (const 64 (2**20)),
    u_276_285 - v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 + v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 - v_276_285 <=s (const 64 (2**20)),
    r_276_285 + s_276_285 <=s (const 64 (2**20)),
    r_276_285 - s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 + s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 - s_276_285 <=s (const 64 (2**20)),
    u_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_276_285 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_285_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_9,
sint64 g_236_low60_40_low20_9,
sint64 f_236_low60_40_low20_10,
sint64 g_236_low60_40_low20_10,
sint64 u_276_285,
sint64 v_276_285,
sint64 r_276_285,
sint64 s_276_285,
sint64 u_276_286,
sint64 v_276_286,
sint64 r_276_286,
sint64 s_276_286,
bit ne
)={
    u_276_285 * f_236_low60_40_low20_0 + v_276_285 * g_236_low60_40_low20_0 = f_236_low60_40_low20_9 * (-(2**20)),
    r_276_285 * f_236_low60_40_low20_0 + s_276_285 * g_236_low60_40_low20_0 = g_236_low60_40_low20_9 * (-(2**20))
&&
    u_276_285 * f_236_low60_40_low20_0 + v_276_285 * g_236_low60_40_low20_0 = f_236_low60_40_low20_9 * (const 64 (-(2**20))),
    r_276_285 * f_236_low60_40_low20_0 + s_276_285 * g_236_low60_40_low20_0 = g_236_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_9 + u_276_285 * (const 64 (2**21)) + v_276_285 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_9 + r_276_285 * (const 64 (2**21)) + s_276_285 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_9,
    f_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_9,
    g_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 285)) <=s delta, delta <=s (const 64 (1 + 2*285)),
    (const 64 (-(2**20))) <=s u_276_285, u_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_285, v_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_285, r_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_285, s_276_285 <=s (const 64 ((2**20)-1)),
    u_276_285 + v_276_285 <=s (const 64 (2**20)),
    u_276_285 - v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 + v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 - v_276_285 <=s (const 64 (2**20)),
    r_276_285 + s_276_285 <=s (const 64 (2**20)),
    r_276_285 - s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 + s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 - s_276_285 <=s (const 64 (2**20)),
    u_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_276_285 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step285

// premise a
assume
g_236_low60_40_low20_9 = 0 (mod 2)
&&
g_236_low60_40_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_10 f_236_low60_40_low20_9;
mov u_276_286 u_276_285;
mov v_276_286 v_276_285;

asr g_236_low60_40_low20_10 g_236_low60_40_low20_9 1;
asr r_276_286 r_276_285 1;
asr s_276_286 s_276_285 1;
assert
    true
&&
    f_236_low60_40_low20_10 = f_236_low60_40_low20_9,
    u_276_286 = u_276_285,
    v_276_286 = v_276_285,
    g_236_low60_40_low20_10 * (const 64 2) = g_236_low60_40_low20_9,
    r_276_286 * (const 64 2) = r_276_285,
    s_276_286 * (const 64 2) = s_276_285
;

assume
    f_236_low60_40_low20_10 = f_236_low60_40_low20_9,
    u_276_286 = u_276_285,
    v_276_286 = v_276_285,
    g_236_low60_40_low20_10 * 2 = g_236_low60_40_low20_9,
    r_276_286 * 2 = r_276_285,
    s_276_286 * 2 = s_276_285
&&
    true
;

{
    u_276_286 * f_236_low60_40_low20_0 + v_276_286 * g_236_low60_40_low20_0 = f_236_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_286 * f_236_low60_40_low20_0 + s_276_286 * g_236_low60_40_low20_0 = g_236_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_10 + u_276_286 * (const 64 (2**21)) + v_276_286 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_10 + r_276_286 * (const 64 (2**21)) + s_276_286 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_10,
    f_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_10,
    g_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 286)) <=s delta, delta <=s (const 64 (1 + 2*286)),
    (const 64 (-(2**20))) <=s u_276_286, u_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_286, v_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_286, r_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_286, s_276_286 <=s (const 64 ((2**20)-1)),
    u_276_286 + v_276_286 <=s (const 64 (2**20)),
    u_276_286 - v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 + v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 - v_276_286 <=s (const 64 (2**20)),
    r_276_286 + s_276_286 <=s (const 64 (2**20)),
    r_276_286 - s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 + s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 - s_276_286 <=s (const 64 (2**20)),
    u_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_276_286 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_285_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_9,
sint64 g_236_low60_40_low20_9,
sint64 f_236_low60_40_low20_10,
sint64 g_236_low60_40_low20_10,
sint64 u_276_285,
sint64 v_276_285,
sint64 r_276_285,
sint64 s_276_285,
sint64 u_276_286,
sint64 v_276_286,
sint64 r_276_286,
sint64 s_276_286,
bit ne
)={
    u_276_285 * f_236_low60_40_low20_0 + v_276_285 * g_236_low60_40_low20_0 = f_236_low60_40_low20_9 * (-(2**20)),
    r_276_285 * f_236_low60_40_low20_0 + s_276_285 * g_236_low60_40_low20_0 = g_236_low60_40_low20_9 * (-(2**20))
&&
    u_276_285 * f_236_low60_40_low20_0 + v_276_285 * g_236_low60_40_low20_0 = f_236_low60_40_low20_9 * (const 64 (-(2**20))),
    r_276_285 * f_236_low60_40_low20_0 + s_276_285 * g_236_low60_40_low20_0 = g_236_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_9 + u_276_285 * (const 64 (2**21)) + v_276_285 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_9 + r_276_285 * (const 64 (2**21)) + s_276_285 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_9,
    f_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_9,
    g_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 285)) <=s delta, delta <=s (const 64 (1 + 2*285)),
    (const 64 (-(2**20))) <=s u_276_285, u_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_285, v_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_285, r_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_285, s_276_285 <=s (const 64 ((2**20)-1)),
    u_276_285 + v_276_285 <=s (const 64 (2**20)),
    u_276_285 - v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 + v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 - v_276_285 <=s (const 64 (2**20)),
    r_276_285 + s_276_285 <=s (const 64 (2**20)),
    r_276_285 - s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 + s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 - s_276_285 <=s (const 64 (2**20)),
    u_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_276_285 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step285

// premise b
assume
g_236_low60_40_low20_9 = 1 (mod 2)
&&
g_236_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_10 f_236_low60_40_low20_9;
mov u_276_286 u_276_285;
mov v_276_286 v_276_285;

add g_236_low60_40_low20_10 g_236_low60_40_low20_9 f_236_low60_40_low20_9;
asr g_236_low60_40_low20_10 g_236_low60_40_low20_10 1;
add r_276_286 r_276_285 u_276_285;
asr r_276_286 r_276_286 1;
add s_276_286 s_276_285 v_276_285;
asr s_276_286 s_276_286 1;
assert
    true
&&
    f_236_low60_40_low20_10 = f_236_low60_40_low20_9,
    u_276_286 = u_276_285,
    v_276_286 = v_276_285,
    g_236_low60_40_low20_10 * (const 64 2) = g_236_low60_40_low20_9 + f_236_low60_40_low20_9,
    r_276_286 * (const 64 2) = r_276_285 + u_276_285,
    s_276_286 * (const 64 2) = s_276_285 + v_276_285
;

assume
    f_236_low60_40_low20_10 = f_236_low60_40_low20_9,
    u_276_286 = u_276_285,
    v_276_286 = v_276_285,
    g_236_low60_40_low20_10 * 2 = g_236_low60_40_low20_9 + f_236_low60_40_low20_9,
    r_276_286 * 2 = r_276_285 + u_276_285,
    s_276_286 * 2 = s_276_285 + v_276_285
&&
    true
;

{
    u_276_286 * f_236_low60_40_low20_0 + v_276_286 * g_236_low60_40_low20_0 = f_236_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_286 * f_236_low60_40_low20_0 + s_276_286 * g_236_low60_40_low20_0 = g_236_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_10 + u_276_286 * (const 64 (2**21)) + v_276_286 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_10 + r_276_286 * (const 64 (2**21)) + s_276_286 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_10,
    f_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_10,
    g_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 286)) <=s delta, delta <=s (const 64 (1 + 2*286)),
    (const 64 (-(2**20))) <=s u_276_286, u_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_286, v_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_286, r_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_286, s_276_286 <=s (const 64 ((2**20)-1)),
    u_276_286 + v_276_286 <=s (const 64 (2**20)),
    u_276_286 - v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 + v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 - v_276_286 <=s (const 64 (2**20)),
    r_276_286 + s_276_286 <=s (const 64 (2**20)),
    r_276_286 - s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 + s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 - s_276_286 <=s (const 64 (2**20)),
    u_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_276_286 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_285_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_9,
sint64 g_236_low60_40_low20_9,
sint64 f_236_low60_40_low20_10,
sint64 g_236_low60_40_low20_10,
sint64 u_276_285,
sint64 v_276_285,
sint64 r_276_285,
sint64 s_276_285,
sint64 u_276_286,
sint64 v_276_286,
sint64 r_276_286,
sint64 s_276_286,
bit ne
)={
    u_276_285 * f_236_low60_40_low20_0 + v_276_285 * g_236_low60_40_low20_0 = f_236_low60_40_low20_9 * (-(2**20)),
    r_276_285 * f_236_low60_40_low20_0 + s_276_285 * g_236_low60_40_low20_0 = g_236_low60_40_low20_9 * (-(2**20))
&&
    u_276_285 * f_236_low60_40_low20_0 + v_276_285 * g_236_low60_40_low20_0 = f_236_low60_40_low20_9 * (const 64 (-(2**20))),
    r_276_285 * f_236_low60_40_low20_0 + s_276_285 * g_236_low60_40_low20_0 = g_236_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_9 + u_276_285 * (const 64 (2**21)) + v_276_285 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_9 + r_276_285 * (const 64 (2**21)) + s_276_285 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_9,
    f_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_9,
    g_236_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 285)) <=s delta, delta <=s (const 64 (1 + 2*285)),
    (const 64 (-(2**20))) <=s u_276_285, u_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_285, v_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_285, r_276_285 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_285, s_276_285 <=s (const 64 ((2**20)-1)),
    u_276_285 + v_276_285 <=s (const 64 (2**20)),
    u_276_285 - v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 + v_276_285 <=s (const 64 (2**20)),
    (const 64 0) - u_276_285 - v_276_285 <=s (const 64 (2**20)),
    r_276_285 + s_276_285 <=s (const 64 (2**20)),
    r_276_285 - s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 + s_276_285 <=s (const 64 (2**20)),
    (const 64 0) - r_276_285 - s_276_285 <=s (const 64 (2**20)),
    u_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_276_285 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_276_285 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step285

// premise c
assume
g_236_low60_40_low20_9 = 1 (mod 2)
&&
g_236_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_10 g_236_low60_40_low20_9;
mov u_276_286 r_276_285;
mov v_276_286 s_276_285;

subs dc g_236_low60_40_low20_10 g_236_low60_40_low20_9 f_236_low60_40_low20_9;
asr g_236_low60_40_low20_10 g_236_low60_40_low20_10 1;
subs dc r_276_286 r_276_285 u_276_285;
asr r_276_286 r_276_286 1;
subs dc s_276_286 s_276_285 v_276_285;
asr s_276_286 s_276_286 1;
assert
    true
&&
    f_236_low60_40_low20_10 = g_236_low60_40_low20_9,
    u_276_286 = r_276_285,
    v_276_286 = s_276_285,
    g_236_low60_40_low20_10 * (const 64 2) = g_236_low60_40_low20_9 - f_236_low60_40_low20_9,
    r_276_286 * (const 64 2) = r_276_285 - u_276_285,
    s_276_286 * (const 64 2) = s_276_285 - v_276_285
;

assume
    f_236_low60_40_low20_10 = g_236_low60_40_low20_9,
    u_276_286 = r_276_285,
    v_276_286 = s_276_285,
    g_236_low60_40_low20_10 * 2 = g_236_low60_40_low20_9 - f_236_low60_40_low20_9,
    r_276_286 * 2 = r_276_285 - u_276_285,
    s_276_286 * 2 = s_276_285 - v_276_285
&&
    true
;

{
    u_276_286 * f_236_low60_40_low20_0 + v_276_286 * g_236_low60_40_low20_0 = f_236_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_286 * f_236_low60_40_low20_0 + s_276_286 * g_236_low60_40_low20_0 = g_236_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_10 + u_276_286 * (const 64 (2**21)) + v_276_286 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_10 + r_276_286 * (const 64 (2**21)) + s_276_286 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_10,
    f_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_10,
    g_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 286)) <=s delta, delta <=s (const 64 (1 + 2*286)),
    (const 64 (-(2**20))) <=s u_276_286, u_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_286, v_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_286, r_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_286, s_276_286 <=s (const 64 ((2**20)-1)),
    u_276_286 + v_276_286 <=s (const 64 (2**20)),
    u_276_286 - v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 + v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 - v_276_286 <=s (const 64 (2**20)),
    r_276_286 + s_276_286 <=s (const 64 (2**20)),
    r_276_286 - s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 + s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 - s_276_286 <=s (const 64 (2**20)),
    u_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_276_286 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_286_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_10,
sint64 g_236_low60_40_low20_10,
sint64 f_236_low60_40_low20_11,
sint64 g_236_low60_40_low20_11,
sint64 u_276_286,
sint64 v_276_286,
sint64 r_276_286,
sint64 s_276_286,
sint64 u_276_287,
sint64 v_276_287,
sint64 r_276_287,
sint64 s_276_287,
bit ne
)={
    u_276_286 * f_236_low60_40_low20_0 + v_276_286 * g_236_low60_40_low20_0 = f_236_low60_40_low20_10 * (-(2**20)),
    r_276_286 * f_236_low60_40_low20_0 + s_276_286 * g_236_low60_40_low20_0 = g_236_low60_40_low20_10 * (-(2**20))
&&
    u_276_286 * f_236_low60_40_low20_0 + v_276_286 * g_236_low60_40_low20_0 = f_236_low60_40_low20_10 * (const 64 (-(2**20))),
    r_276_286 * f_236_low60_40_low20_0 + s_276_286 * g_236_low60_40_low20_0 = g_236_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_10 + u_276_286 * (const 64 (2**21)) + v_276_286 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_10 + r_276_286 * (const 64 (2**21)) + s_276_286 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_10,
    f_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_10,
    g_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 286)) <=s delta, delta <=s (const 64 (1 + 2*286)),
    (const 64 (-(2**20))) <=s u_276_286, u_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_286, v_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_286, r_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_286, s_276_286 <=s (const 64 ((2**20)-1)),
    u_276_286 + v_276_286 <=s (const 64 (2**20)),
    u_276_286 - v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 + v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 - v_276_286 <=s (const 64 (2**20)),
    r_276_286 + s_276_286 <=s (const 64 (2**20)),
    r_276_286 - s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 + s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 - s_276_286 <=s (const 64 (2**20)),
    u_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_276_286 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step286

// premise a
assume
g_236_low60_40_low20_10 = 0 (mod 2)
&&
g_236_low60_40_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_11 f_236_low60_40_low20_10;
mov u_276_287 u_276_286;
mov v_276_287 v_276_286;

asr g_236_low60_40_low20_11 g_236_low60_40_low20_10 1;
asr r_276_287 r_276_286 1;
asr s_276_287 s_276_286 1;
assert
    true
&&
    f_236_low60_40_low20_11 = f_236_low60_40_low20_10,
    u_276_287 = u_276_286,
    v_276_287 = v_276_286,
    g_236_low60_40_low20_11 * (const 64 2) = g_236_low60_40_low20_10,
    r_276_287 * (const 64 2) = r_276_286,
    s_276_287 * (const 64 2) = s_276_286
;

assume
    f_236_low60_40_low20_11 = f_236_low60_40_low20_10,
    u_276_287 = u_276_286,
    v_276_287 = v_276_286,
    g_236_low60_40_low20_11 * 2 = g_236_low60_40_low20_10,
    r_276_287 * 2 = r_276_286,
    s_276_287 * 2 = s_276_286
&&
    true
;

{
    u_276_287 * f_236_low60_40_low20_0 + v_276_287 * g_236_low60_40_low20_0 = f_236_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_287 * f_236_low60_40_low20_0 + s_276_287 * g_236_low60_40_low20_0 = g_236_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_11 + u_276_287 * (const 64 (2**21)) + v_276_287 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_11 + r_276_287 * (const 64 (2**21)) + s_276_287 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_11,
    f_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_11,
    g_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 287)) <=s delta, delta <=s (const 64 (1 + 2*287)),
    (const 64 (-(2**20))) <=s u_276_287, u_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_287, v_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_287, r_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_287, s_276_287 <=s (const 64 ((2**20)-1)),
    u_276_287 + v_276_287 <=s (const 64 (2**20)),
    u_276_287 - v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 + v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 - v_276_287 <=s (const 64 (2**20)),
    r_276_287 + s_276_287 <=s (const 64 (2**20)),
    r_276_287 - s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 + s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 - s_276_287 <=s (const 64 (2**20)),
    u_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_276_287 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_286_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_10,
sint64 g_236_low60_40_low20_10,
sint64 f_236_low60_40_low20_11,
sint64 g_236_low60_40_low20_11,
sint64 u_276_286,
sint64 v_276_286,
sint64 r_276_286,
sint64 s_276_286,
sint64 u_276_287,
sint64 v_276_287,
sint64 r_276_287,
sint64 s_276_287,
bit ne
)={
    u_276_286 * f_236_low60_40_low20_0 + v_276_286 * g_236_low60_40_low20_0 = f_236_low60_40_low20_10 * (-(2**20)),
    r_276_286 * f_236_low60_40_low20_0 + s_276_286 * g_236_low60_40_low20_0 = g_236_low60_40_low20_10 * (-(2**20))
&&
    u_276_286 * f_236_low60_40_low20_0 + v_276_286 * g_236_low60_40_low20_0 = f_236_low60_40_low20_10 * (const 64 (-(2**20))),
    r_276_286 * f_236_low60_40_low20_0 + s_276_286 * g_236_low60_40_low20_0 = g_236_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_10 + u_276_286 * (const 64 (2**21)) + v_276_286 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_10 + r_276_286 * (const 64 (2**21)) + s_276_286 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_10,
    f_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_10,
    g_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 286)) <=s delta, delta <=s (const 64 (1 + 2*286)),
    (const 64 (-(2**20))) <=s u_276_286, u_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_286, v_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_286, r_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_286, s_276_286 <=s (const 64 ((2**20)-1)),
    u_276_286 + v_276_286 <=s (const 64 (2**20)),
    u_276_286 - v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 + v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 - v_276_286 <=s (const 64 (2**20)),
    r_276_286 + s_276_286 <=s (const 64 (2**20)),
    r_276_286 - s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 + s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 - s_276_286 <=s (const 64 (2**20)),
    u_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_276_286 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step286

// premise b
assume
g_236_low60_40_low20_10 = 1 (mod 2)
&&
g_236_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_11 f_236_low60_40_low20_10;
mov u_276_287 u_276_286;
mov v_276_287 v_276_286;

add g_236_low60_40_low20_11 g_236_low60_40_low20_10 f_236_low60_40_low20_10;
asr g_236_low60_40_low20_11 g_236_low60_40_low20_11 1;
add r_276_287 r_276_286 u_276_286;
asr r_276_287 r_276_287 1;
add s_276_287 s_276_286 v_276_286;
asr s_276_287 s_276_287 1;
assert
    true
&&
    f_236_low60_40_low20_11 = f_236_low60_40_low20_10,
    u_276_287 = u_276_286,
    v_276_287 = v_276_286,
    g_236_low60_40_low20_11 * (const 64 2) = g_236_low60_40_low20_10 + f_236_low60_40_low20_10,
    r_276_287 * (const 64 2) = r_276_286 + u_276_286,
    s_276_287 * (const 64 2) = s_276_286 + v_276_286
;

assume
    f_236_low60_40_low20_11 = f_236_low60_40_low20_10,
    u_276_287 = u_276_286,
    v_276_287 = v_276_286,
    g_236_low60_40_low20_11 * 2 = g_236_low60_40_low20_10 + f_236_low60_40_low20_10,
    r_276_287 * 2 = r_276_286 + u_276_286,
    s_276_287 * 2 = s_276_286 + v_276_286
&&
    true
;

{
    u_276_287 * f_236_low60_40_low20_0 + v_276_287 * g_236_low60_40_low20_0 = f_236_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_287 * f_236_low60_40_low20_0 + s_276_287 * g_236_low60_40_low20_0 = g_236_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_11 + u_276_287 * (const 64 (2**21)) + v_276_287 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_11 + r_276_287 * (const 64 (2**21)) + s_276_287 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_11,
    f_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_11,
    g_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 287)) <=s delta, delta <=s (const 64 (1 + 2*287)),
    (const 64 (-(2**20))) <=s u_276_287, u_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_287, v_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_287, r_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_287, s_276_287 <=s (const 64 ((2**20)-1)),
    u_276_287 + v_276_287 <=s (const 64 (2**20)),
    u_276_287 - v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 + v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 - v_276_287 <=s (const 64 (2**20)),
    r_276_287 + s_276_287 <=s (const 64 (2**20)),
    r_276_287 - s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 + s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 - s_276_287 <=s (const 64 (2**20)),
    u_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_276_287 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_286_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_10,
sint64 g_236_low60_40_low20_10,
sint64 f_236_low60_40_low20_11,
sint64 g_236_low60_40_low20_11,
sint64 u_276_286,
sint64 v_276_286,
sint64 r_276_286,
sint64 s_276_286,
sint64 u_276_287,
sint64 v_276_287,
sint64 r_276_287,
sint64 s_276_287,
bit ne
)={
    u_276_286 * f_236_low60_40_low20_0 + v_276_286 * g_236_low60_40_low20_0 = f_236_low60_40_low20_10 * (-(2**20)),
    r_276_286 * f_236_low60_40_low20_0 + s_276_286 * g_236_low60_40_low20_0 = g_236_low60_40_low20_10 * (-(2**20))
&&
    u_276_286 * f_236_low60_40_low20_0 + v_276_286 * g_236_low60_40_low20_0 = f_236_low60_40_low20_10 * (const 64 (-(2**20))),
    r_276_286 * f_236_low60_40_low20_0 + s_276_286 * g_236_low60_40_low20_0 = g_236_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_10 + u_276_286 * (const 64 (2**21)) + v_276_286 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_10 + r_276_286 * (const 64 (2**21)) + s_276_286 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_10,
    f_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_10,
    g_236_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 286)) <=s delta, delta <=s (const 64 (1 + 2*286)),
    (const 64 (-(2**20))) <=s u_276_286, u_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_286, v_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_286, r_276_286 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_286, s_276_286 <=s (const 64 ((2**20)-1)),
    u_276_286 + v_276_286 <=s (const 64 (2**20)),
    u_276_286 - v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 + v_276_286 <=s (const 64 (2**20)),
    (const 64 0) - u_276_286 - v_276_286 <=s (const 64 (2**20)),
    r_276_286 + s_276_286 <=s (const 64 (2**20)),
    r_276_286 - s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 + s_276_286 <=s (const 64 (2**20)),
    (const 64 0) - r_276_286 - s_276_286 <=s (const 64 (2**20)),
    u_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_276_286 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_276_286 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step286

// premise c
assume
g_236_low60_40_low20_10 = 1 (mod 2)
&&
g_236_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_11 g_236_low60_40_low20_10;
mov u_276_287 r_276_286;
mov v_276_287 s_276_286;

subs dc g_236_low60_40_low20_11 g_236_low60_40_low20_10 f_236_low60_40_low20_10;
asr g_236_low60_40_low20_11 g_236_low60_40_low20_11 1;
subs dc r_276_287 r_276_286 u_276_286;
asr r_276_287 r_276_287 1;
subs dc s_276_287 s_276_286 v_276_286;
asr s_276_287 s_276_287 1;
assert
    true
&&
    f_236_low60_40_low20_11 = g_236_low60_40_low20_10,
    u_276_287 = r_276_286,
    v_276_287 = s_276_286,
    g_236_low60_40_low20_11 * (const 64 2) = g_236_low60_40_low20_10 - f_236_low60_40_low20_10,
    r_276_287 * (const 64 2) = r_276_286 - u_276_286,
    s_276_287 * (const 64 2) = s_276_286 - v_276_286
;

assume
    f_236_low60_40_low20_11 = g_236_low60_40_low20_10,
    u_276_287 = r_276_286,
    v_276_287 = s_276_286,
    g_236_low60_40_low20_11 * 2 = g_236_low60_40_low20_10 - f_236_low60_40_low20_10,
    r_276_287 * 2 = r_276_286 - u_276_286,
    s_276_287 * 2 = s_276_286 - v_276_286
&&
    true
;

{
    u_276_287 * f_236_low60_40_low20_0 + v_276_287 * g_236_low60_40_low20_0 = f_236_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_287 * f_236_low60_40_low20_0 + s_276_287 * g_236_low60_40_low20_0 = g_236_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_11 + u_276_287 * (const 64 (2**21)) + v_276_287 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_11 + r_276_287 * (const 64 (2**21)) + s_276_287 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_11,
    f_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_11,
    g_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 287)) <=s delta, delta <=s (const 64 (1 + 2*287)),
    (const 64 (-(2**20))) <=s u_276_287, u_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_287, v_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_287, r_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_287, s_276_287 <=s (const 64 ((2**20)-1)),
    u_276_287 + v_276_287 <=s (const 64 (2**20)),
    u_276_287 - v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 + v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 - v_276_287 <=s (const 64 (2**20)),
    r_276_287 + s_276_287 <=s (const 64 (2**20)),
    r_276_287 - s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 + s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 - s_276_287 <=s (const 64 (2**20)),
    u_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_276_287 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_287_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_11,
sint64 g_236_low60_40_low20_11,
sint64 f_236_low60_40_low20_12,
sint64 g_236_low60_40_low20_12,
sint64 u_276_287,
sint64 v_276_287,
sint64 r_276_287,
sint64 s_276_287,
sint64 u_276_288,
sint64 v_276_288,
sint64 r_276_288,
sint64 s_276_288,
bit ne
)={
    u_276_287 * f_236_low60_40_low20_0 + v_276_287 * g_236_low60_40_low20_0 = f_236_low60_40_low20_11 * (-(2**20)),
    r_276_287 * f_236_low60_40_low20_0 + s_276_287 * g_236_low60_40_low20_0 = g_236_low60_40_low20_11 * (-(2**20))
&&
    u_276_287 * f_236_low60_40_low20_0 + v_276_287 * g_236_low60_40_low20_0 = f_236_low60_40_low20_11 * (const 64 (-(2**20))),
    r_276_287 * f_236_low60_40_low20_0 + s_276_287 * g_236_low60_40_low20_0 = g_236_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_11 + u_276_287 * (const 64 (2**21)) + v_276_287 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_11 + r_276_287 * (const 64 (2**21)) + s_276_287 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_11,
    f_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_11,
    g_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 287)) <=s delta, delta <=s (const 64 (1 + 2*287)),
    (const 64 (-(2**20))) <=s u_276_287, u_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_287, v_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_287, r_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_287, s_276_287 <=s (const 64 ((2**20)-1)),
    u_276_287 + v_276_287 <=s (const 64 (2**20)),
    u_276_287 - v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 + v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 - v_276_287 <=s (const 64 (2**20)),
    r_276_287 + s_276_287 <=s (const 64 (2**20)),
    r_276_287 - s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 + s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 - s_276_287 <=s (const 64 (2**20)),
    u_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_276_287 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step287

// premise a
assume
g_236_low60_40_low20_11 = 0 (mod 2)
&&
g_236_low60_40_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_12 f_236_low60_40_low20_11;
mov u_276_288 u_276_287;
mov v_276_288 v_276_287;

asr g_236_low60_40_low20_12 g_236_low60_40_low20_11 1;
asr r_276_288 r_276_287 1;
asr s_276_288 s_276_287 1;
assert
    true
&&
    f_236_low60_40_low20_12 = f_236_low60_40_low20_11,
    u_276_288 = u_276_287,
    v_276_288 = v_276_287,
    g_236_low60_40_low20_12 * (const 64 2) = g_236_low60_40_low20_11,
    r_276_288 * (const 64 2) = r_276_287,
    s_276_288 * (const 64 2) = s_276_287
;

assume
    f_236_low60_40_low20_12 = f_236_low60_40_low20_11,
    u_276_288 = u_276_287,
    v_276_288 = v_276_287,
    g_236_low60_40_low20_12 * 2 = g_236_low60_40_low20_11,
    r_276_288 * 2 = r_276_287,
    s_276_288 * 2 = s_276_287
&&
    true
;

{
    u_276_288 * f_236_low60_40_low20_0 + v_276_288 * g_236_low60_40_low20_0 = f_236_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_288 * f_236_low60_40_low20_0 + s_276_288 * g_236_low60_40_low20_0 = g_236_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_12 + u_276_288 * (const 64 (2**21)) + v_276_288 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_12 + r_276_288 * (const 64 (2**21)) + s_276_288 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_12,
    f_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_12,
    g_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 288)) <=s delta, delta <=s (const 64 (1 + 2*288)),
    (const 64 (-(2**20))) <=s u_276_288, u_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_288, v_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_288, r_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_288, s_276_288 <=s (const 64 ((2**20)-1)),
    u_276_288 + v_276_288 <=s (const 64 (2**20)),
    u_276_288 - v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 + v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 - v_276_288 <=s (const 64 (2**20)),
    r_276_288 + s_276_288 <=s (const 64 (2**20)),
    r_276_288 - s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 + s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 - s_276_288 <=s (const 64 (2**20)),
    u_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_276_288 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_287_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_11,
sint64 g_236_low60_40_low20_11,
sint64 f_236_low60_40_low20_12,
sint64 g_236_low60_40_low20_12,
sint64 u_276_287,
sint64 v_276_287,
sint64 r_276_287,
sint64 s_276_287,
sint64 u_276_288,
sint64 v_276_288,
sint64 r_276_288,
sint64 s_276_288,
bit ne
)={
    u_276_287 * f_236_low60_40_low20_0 + v_276_287 * g_236_low60_40_low20_0 = f_236_low60_40_low20_11 * (-(2**20)),
    r_276_287 * f_236_low60_40_low20_0 + s_276_287 * g_236_low60_40_low20_0 = g_236_low60_40_low20_11 * (-(2**20))
&&
    u_276_287 * f_236_low60_40_low20_0 + v_276_287 * g_236_low60_40_low20_0 = f_236_low60_40_low20_11 * (const 64 (-(2**20))),
    r_276_287 * f_236_low60_40_low20_0 + s_276_287 * g_236_low60_40_low20_0 = g_236_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_11 + u_276_287 * (const 64 (2**21)) + v_276_287 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_11 + r_276_287 * (const 64 (2**21)) + s_276_287 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_11,
    f_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_11,
    g_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 287)) <=s delta, delta <=s (const 64 (1 + 2*287)),
    (const 64 (-(2**20))) <=s u_276_287, u_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_287, v_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_287, r_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_287, s_276_287 <=s (const 64 ((2**20)-1)),
    u_276_287 + v_276_287 <=s (const 64 (2**20)),
    u_276_287 - v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 + v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 - v_276_287 <=s (const 64 (2**20)),
    r_276_287 + s_276_287 <=s (const 64 (2**20)),
    r_276_287 - s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 + s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 - s_276_287 <=s (const 64 (2**20)),
    u_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_276_287 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step287

// premise b
assume
g_236_low60_40_low20_11 = 1 (mod 2)
&&
g_236_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_12 f_236_low60_40_low20_11;
mov u_276_288 u_276_287;
mov v_276_288 v_276_287;

add g_236_low60_40_low20_12 g_236_low60_40_low20_11 f_236_low60_40_low20_11;
asr g_236_low60_40_low20_12 g_236_low60_40_low20_12 1;
add r_276_288 r_276_287 u_276_287;
asr r_276_288 r_276_288 1;
add s_276_288 s_276_287 v_276_287;
asr s_276_288 s_276_288 1;
assert
    true
&&
    f_236_low60_40_low20_12 = f_236_low60_40_low20_11,
    u_276_288 = u_276_287,
    v_276_288 = v_276_287,
    g_236_low60_40_low20_12 * (const 64 2) = g_236_low60_40_low20_11 + f_236_low60_40_low20_11,
    r_276_288 * (const 64 2) = r_276_287 + u_276_287,
    s_276_288 * (const 64 2) = s_276_287 + v_276_287
;

assume
    f_236_low60_40_low20_12 = f_236_low60_40_low20_11,
    u_276_288 = u_276_287,
    v_276_288 = v_276_287,
    g_236_low60_40_low20_12 * 2 = g_236_low60_40_low20_11 + f_236_low60_40_low20_11,
    r_276_288 * 2 = r_276_287 + u_276_287,
    s_276_288 * 2 = s_276_287 + v_276_287
&&
    true
;

{
    u_276_288 * f_236_low60_40_low20_0 + v_276_288 * g_236_low60_40_low20_0 = f_236_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_288 * f_236_low60_40_low20_0 + s_276_288 * g_236_low60_40_low20_0 = g_236_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_12 + u_276_288 * (const 64 (2**21)) + v_276_288 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_12 + r_276_288 * (const 64 (2**21)) + s_276_288 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_12,
    f_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_12,
    g_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 288)) <=s delta, delta <=s (const 64 (1 + 2*288)),
    (const 64 (-(2**20))) <=s u_276_288, u_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_288, v_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_288, r_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_288, s_276_288 <=s (const 64 ((2**20)-1)),
    u_276_288 + v_276_288 <=s (const 64 (2**20)),
    u_276_288 - v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 + v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 - v_276_288 <=s (const 64 (2**20)),
    r_276_288 + s_276_288 <=s (const 64 (2**20)),
    r_276_288 - s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 + s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 - s_276_288 <=s (const 64 (2**20)),
    u_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_276_288 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_287_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_11,
sint64 g_236_low60_40_low20_11,
sint64 f_236_low60_40_low20_12,
sint64 g_236_low60_40_low20_12,
sint64 u_276_287,
sint64 v_276_287,
sint64 r_276_287,
sint64 s_276_287,
sint64 u_276_288,
sint64 v_276_288,
sint64 r_276_288,
sint64 s_276_288,
bit ne
)={
    u_276_287 * f_236_low60_40_low20_0 + v_276_287 * g_236_low60_40_low20_0 = f_236_low60_40_low20_11 * (-(2**20)),
    r_276_287 * f_236_low60_40_low20_0 + s_276_287 * g_236_low60_40_low20_0 = g_236_low60_40_low20_11 * (-(2**20))
&&
    u_276_287 * f_236_low60_40_low20_0 + v_276_287 * g_236_low60_40_low20_0 = f_236_low60_40_low20_11 * (const 64 (-(2**20))),
    r_276_287 * f_236_low60_40_low20_0 + s_276_287 * g_236_low60_40_low20_0 = g_236_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_11 + u_276_287 * (const 64 (2**21)) + v_276_287 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_11 + r_276_287 * (const 64 (2**21)) + s_276_287 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_11,
    f_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_11,
    g_236_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 287)) <=s delta, delta <=s (const 64 (1 + 2*287)),
    (const 64 (-(2**20))) <=s u_276_287, u_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_287, v_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_287, r_276_287 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_287, s_276_287 <=s (const 64 ((2**20)-1)),
    u_276_287 + v_276_287 <=s (const 64 (2**20)),
    u_276_287 - v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 + v_276_287 <=s (const 64 (2**20)),
    (const 64 0) - u_276_287 - v_276_287 <=s (const 64 (2**20)),
    r_276_287 + s_276_287 <=s (const 64 (2**20)),
    r_276_287 - s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 + s_276_287 <=s (const 64 (2**20)),
    (const 64 0) - r_276_287 - s_276_287 <=s (const 64 (2**20)),
    u_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_276_287 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_276_287 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step287

// premise c
assume
g_236_low60_40_low20_11 = 1 (mod 2)
&&
g_236_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_12 g_236_low60_40_low20_11;
mov u_276_288 r_276_287;
mov v_276_288 s_276_287;

subs dc g_236_low60_40_low20_12 g_236_low60_40_low20_11 f_236_low60_40_low20_11;
asr g_236_low60_40_low20_12 g_236_low60_40_low20_12 1;
subs dc r_276_288 r_276_287 u_276_287;
asr r_276_288 r_276_288 1;
subs dc s_276_288 s_276_287 v_276_287;
asr s_276_288 s_276_288 1;
assert
    true
&&
    f_236_low60_40_low20_12 = g_236_low60_40_low20_11,
    u_276_288 = r_276_287,
    v_276_288 = s_276_287,
    g_236_low60_40_low20_12 * (const 64 2) = g_236_low60_40_low20_11 - f_236_low60_40_low20_11,
    r_276_288 * (const 64 2) = r_276_287 - u_276_287,
    s_276_288 * (const 64 2) = s_276_287 - v_276_287
;

assume
    f_236_low60_40_low20_12 = g_236_low60_40_low20_11,
    u_276_288 = r_276_287,
    v_276_288 = s_276_287,
    g_236_low60_40_low20_12 * 2 = g_236_low60_40_low20_11 - f_236_low60_40_low20_11,
    r_276_288 * 2 = r_276_287 - u_276_287,
    s_276_288 * 2 = s_276_287 - v_276_287
&&
    true
;

{
    u_276_288 * f_236_low60_40_low20_0 + v_276_288 * g_236_low60_40_low20_0 = f_236_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_288 * f_236_low60_40_low20_0 + s_276_288 * g_236_low60_40_low20_0 = g_236_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_12 + u_276_288 * (const 64 (2**21)) + v_276_288 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_12 + r_276_288 * (const 64 (2**21)) + s_276_288 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_12,
    f_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_12,
    g_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 288)) <=s delta, delta <=s (const 64 (1 + 2*288)),
    (const 64 (-(2**20))) <=s u_276_288, u_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_288, v_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_288, r_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_288, s_276_288 <=s (const 64 ((2**20)-1)),
    u_276_288 + v_276_288 <=s (const 64 (2**20)),
    u_276_288 - v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 + v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 - v_276_288 <=s (const 64 (2**20)),
    r_276_288 + s_276_288 <=s (const 64 (2**20)),
    r_276_288 - s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 + s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 - s_276_288 <=s (const 64 (2**20)),
    u_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_276_288 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_288_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_12,
sint64 g_236_low60_40_low20_12,
sint64 f_236_low60_40_low20_13,
sint64 g_236_low60_40_low20_13,
sint64 u_276_288,
sint64 v_276_288,
sint64 r_276_288,
sint64 s_276_288,
sint64 u_276_289,
sint64 v_276_289,
sint64 r_276_289,
sint64 s_276_289,
bit ne
)={
    u_276_288 * f_236_low60_40_low20_0 + v_276_288 * g_236_low60_40_low20_0 = f_236_low60_40_low20_12 * (-(2**20)),
    r_276_288 * f_236_low60_40_low20_0 + s_276_288 * g_236_low60_40_low20_0 = g_236_low60_40_low20_12 * (-(2**20))
&&
    u_276_288 * f_236_low60_40_low20_0 + v_276_288 * g_236_low60_40_low20_0 = f_236_low60_40_low20_12 * (const 64 (-(2**20))),
    r_276_288 * f_236_low60_40_low20_0 + s_276_288 * g_236_low60_40_low20_0 = g_236_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_12 + u_276_288 * (const 64 (2**21)) + v_276_288 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_12 + r_276_288 * (const 64 (2**21)) + s_276_288 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_12,
    f_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_12,
    g_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 288)) <=s delta, delta <=s (const 64 (1 + 2*288)),
    (const 64 (-(2**20))) <=s u_276_288, u_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_288, v_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_288, r_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_288, s_276_288 <=s (const 64 ((2**20)-1)),
    u_276_288 + v_276_288 <=s (const 64 (2**20)),
    u_276_288 - v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 + v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 - v_276_288 <=s (const 64 (2**20)),
    r_276_288 + s_276_288 <=s (const 64 (2**20)),
    r_276_288 - s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 + s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 - s_276_288 <=s (const 64 (2**20)),
    u_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_276_288 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step288

// premise a
assume
g_236_low60_40_low20_12 = 0 (mod 2)
&&
g_236_low60_40_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_13 f_236_low60_40_low20_12;
mov u_276_289 u_276_288;
mov v_276_289 v_276_288;

asr g_236_low60_40_low20_13 g_236_low60_40_low20_12 1;
asr r_276_289 r_276_288 1;
asr s_276_289 s_276_288 1;
assert
    true
&&
    f_236_low60_40_low20_13 = f_236_low60_40_low20_12,
    u_276_289 = u_276_288,
    v_276_289 = v_276_288,
    g_236_low60_40_low20_13 * (const 64 2) = g_236_low60_40_low20_12,
    r_276_289 * (const 64 2) = r_276_288,
    s_276_289 * (const 64 2) = s_276_288
;

assume
    f_236_low60_40_low20_13 = f_236_low60_40_low20_12,
    u_276_289 = u_276_288,
    v_276_289 = v_276_288,
    g_236_low60_40_low20_13 * 2 = g_236_low60_40_low20_12,
    r_276_289 * 2 = r_276_288,
    s_276_289 * 2 = s_276_288
&&
    true
;

{
    u_276_289 * f_236_low60_40_low20_0 + v_276_289 * g_236_low60_40_low20_0 = f_236_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_289 * f_236_low60_40_low20_0 + s_276_289 * g_236_low60_40_low20_0 = g_236_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_13 + u_276_289 * (const 64 (2**21)) + v_276_289 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_13 + r_276_289 * (const 64 (2**21)) + s_276_289 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_13,
    f_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_13,
    g_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 289)) <=s delta, delta <=s (const 64 (1 + 2*289)),
    (const 64 (-(2**20))) <=s u_276_289, u_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_289, v_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_289, r_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_289, s_276_289 <=s (const 64 ((2**20)-1)),
    u_276_289 + v_276_289 <=s (const 64 (2**20)),
    u_276_289 - v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 + v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 - v_276_289 <=s (const 64 (2**20)),
    r_276_289 + s_276_289 <=s (const 64 (2**20)),
    r_276_289 - s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 + s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 - s_276_289 <=s (const 64 (2**20)),
    u_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_276_289 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_288_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_12,
sint64 g_236_low60_40_low20_12,
sint64 f_236_low60_40_low20_13,
sint64 g_236_low60_40_low20_13,
sint64 u_276_288,
sint64 v_276_288,
sint64 r_276_288,
sint64 s_276_288,
sint64 u_276_289,
sint64 v_276_289,
sint64 r_276_289,
sint64 s_276_289,
bit ne
)={
    u_276_288 * f_236_low60_40_low20_0 + v_276_288 * g_236_low60_40_low20_0 = f_236_low60_40_low20_12 * (-(2**20)),
    r_276_288 * f_236_low60_40_low20_0 + s_276_288 * g_236_low60_40_low20_0 = g_236_low60_40_low20_12 * (-(2**20))
&&
    u_276_288 * f_236_low60_40_low20_0 + v_276_288 * g_236_low60_40_low20_0 = f_236_low60_40_low20_12 * (const 64 (-(2**20))),
    r_276_288 * f_236_low60_40_low20_0 + s_276_288 * g_236_low60_40_low20_0 = g_236_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_12 + u_276_288 * (const 64 (2**21)) + v_276_288 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_12 + r_276_288 * (const 64 (2**21)) + s_276_288 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_12,
    f_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_12,
    g_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 288)) <=s delta, delta <=s (const 64 (1 + 2*288)),
    (const 64 (-(2**20))) <=s u_276_288, u_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_288, v_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_288, r_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_288, s_276_288 <=s (const 64 ((2**20)-1)),
    u_276_288 + v_276_288 <=s (const 64 (2**20)),
    u_276_288 - v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 + v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 - v_276_288 <=s (const 64 (2**20)),
    r_276_288 + s_276_288 <=s (const 64 (2**20)),
    r_276_288 - s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 + s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 - s_276_288 <=s (const 64 (2**20)),
    u_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_276_288 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step288

// premise b
assume
g_236_low60_40_low20_12 = 1 (mod 2)
&&
g_236_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_13 f_236_low60_40_low20_12;
mov u_276_289 u_276_288;
mov v_276_289 v_276_288;

add g_236_low60_40_low20_13 g_236_low60_40_low20_12 f_236_low60_40_low20_12;
asr g_236_low60_40_low20_13 g_236_low60_40_low20_13 1;
add r_276_289 r_276_288 u_276_288;
asr r_276_289 r_276_289 1;
add s_276_289 s_276_288 v_276_288;
asr s_276_289 s_276_289 1;
assert
    true
&&
    f_236_low60_40_low20_13 = f_236_low60_40_low20_12,
    u_276_289 = u_276_288,
    v_276_289 = v_276_288,
    g_236_low60_40_low20_13 * (const 64 2) = g_236_low60_40_low20_12 + f_236_low60_40_low20_12,
    r_276_289 * (const 64 2) = r_276_288 + u_276_288,
    s_276_289 * (const 64 2) = s_276_288 + v_276_288
;

assume
    f_236_low60_40_low20_13 = f_236_low60_40_low20_12,
    u_276_289 = u_276_288,
    v_276_289 = v_276_288,
    g_236_low60_40_low20_13 * 2 = g_236_low60_40_low20_12 + f_236_low60_40_low20_12,
    r_276_289 * 2 = r_276_288 + u_276_288,
    s_276_289 * 2 = s_276_288 + v_276_288
&&
    true
;

{
    u_276_289 * f_236_low60_40_low20_0 + v_276_289 * g_236_low60_40_low20_0 = f_236_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_289 * f_236_low60_40_low20_0 + s_276_289 * g_236_low60_40_low20_0 = g_236_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_13 + u_276_289 * (const 64 (2**21)) + v_276_289 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_13 + r_276_289 * (const 64 (2**21)) + s_276_289 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_13,
    f_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_13,
    g_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 289)) <=s delta, delta <=s (const 64 (1 + 2*289)),
    (const 64 (-(2**20))) <=s u_276_289, u_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_289, v_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_289, r_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_289, s_276_289 <=s (const 64 ((2**20)-1)),
    u_276_289 + v_276_289 <=s (const 64 (2**20)),
    u_276_289 - v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 + v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 - v_276_289 <=s (const 64 (2**20)),
    r_276_289 + s_276_289 <=s (const 64 (2**20)),
    r_276_289 - s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 + s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 - s_276_289 <=s (const 64 (2**20)),
    u_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_276_289 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_288_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_12,
sint64 g_236_low60_40_low20_12,
sint64 f_236_low60_40_low20_13,
sint64 g_236_low60_40_low20_13,
sint64 u_276_288,
sint64 v_276_288,
sint64 r_276_288,
sint64 s_276_288,
sint64 u_276_289,
sint64 v_276_289,
sint64 r_276_289,
sint64 s_276_289,
bit ne
)={
    u_276_288 * f_236_low60_40_low20_0 + v_276_288 * g_236_low60_40_low20_0 = f_236_low60_40_low20_12 * (-(2**20)),
    r_276_288 * f_236_low60_40_low20_0 + s_276_288 * g_236_low60_40_low20_0 = g_236_low60_40_low20_12 * (-(2**20))
&&
    u_276_288 * f_236_low60_40_low20_0 + v_276_288 * g_236_low60_40_low20_0 = f_236_low60_40_low20_12 * (const 64 (-(2**20))),
    r_276_288 * f_236_low60_40_low20_0 + s_276_288 * g_236_low60_40_low20_0 = g_236_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_12 + u_276_288 * (const 64 (2**21)) + v_276_288 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_12 + r_276_288 * (const 64 (2**21)) + s_276_288 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_12,
    f_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_12,
    g_236_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 288)) <=s delta, delta <=s (const 64 (1 + 2*288)),
    (const 64 (-(2**20))) <=s u_276_288, u_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_288, v_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_288, r_276_288 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_288, s_276_288 <=s (const 64 ((2**20)-1)),
    u_276_288 + v_276_288 <=s (const 64 (2**20)),
    u_276_288 - v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 + v_276_288 <=s (const 64 (2**20)),
    (const 64 0) - u_276_288 - v_276_288 <=s (const 64 (2**20)),
    r_276_288 + s_276_288 <=s (const 64 (2**20)),
    r_276_288 - s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 + s_276_288 <=s (const 64 (2**20)),
    (const 64 0) - r_276_288 - s_276_288 <=s (const 64 (2**20)),
    u_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_276_288 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_276_288 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step288

// premise c
assume
g_236_low60_40_low20_12 = 1 (mod 2)
&&
g_236_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_13 g_236_low60_40_low20_12;
mov u_276_289 r_276_288;
mov v_276_289 s_276_288;

subs dc g_236_low60_40_low20_13 g_236_low60_40_low20_12 f_236_low60_40_low20_12;
asr g_236_low60_40_low20_13 g_236_low60_40_low20_13 1;
subs dc r_276_289 r_276_288 u_276_288;
asr r_276_289 r_276_289 1;
subs dc s_276_289 s_276_288 v_276_288;
asr s_276_289 s_276_289 1;
assert
    true
&&
    f_236_low60_40_low20_13 = g_236_low60_40_low20_12,
    u_276_289 = r_276_288,
    v_276_289 = s_276_288,
    g_236_low60_40_low20_13 * (const 64 2) = g_236_low60_40_low20_12 - f_236_low60_40_low20_12,
    r_276_289 * (const 64 2) = r_276_288 - u_276_288,
    s_276_289 * (const 64 2) = s_276_288 - v_276_288
;

assume
    f_236_low60_40_low20_13 = g_236_low60_40_low20_12,
    u_276_289 = r_276_288,
    v_276_289 = s_276_288,
    g_236_low60_40_low20_13 * 2 = g_236_low60_40_low20_12 - f_236_low60_40_low20_12,
    r_276_289 * 2 = r_276_288 - u_276_288,
    s_276_289 * 2 = s_276_288 - v_276_288
&&
    true
;

{
    u_276_289 * f_236_low60_40_low20_0 + v_276_289 * g_236_low60_40_low20_0 = f_236_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_289 * f_236_low60_40_low20_0 + s_276_289 * g_236_low60_40_low20_0 = g_236_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_13 + u_276_289 * (const 64 (2**21)) + v_276_289 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_13 + r_276_289 * (const 64 (2**21)) + s_276_289 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_13,
    f_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_13,
    g_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 289)) <=s delta, delta <=s (const 64 (1 + 2*289)),
    (const 64 (-(2**20))) <=s u_276_289, u_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_289, v_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_289, r_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_289, s_276_289 <=s (const 64 ((2**20)-1)),
    u_276_289 + v_276_289 <=s (const 64 (2**20)),
    u_276_289 - v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 + v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 - v_276_289 <=s (const 64 (2**20)),
    r_276_289 + s_276_289 <=s (const 64 (2**20)),
    r_276_289 - s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 + s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 - s_276_289 <=s (const 64 (2**20)),
    u_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_276_289 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_289_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_13,
sint64 g_236_low60_40_low20_13,
sint64 f_236_low60_40_low20_14,
sint64 g_236_low60_40_low20_14,
sint64 u_276_289,
sint64 v_276_289,
sint64 r_276_289,
sint64 s_276_289,
sint64 u_276_290,
sint64 v_276_290,
sint64 r_276_290,
sint64 s_276_290,
bit ne
)={
    u_276_289 * f_236_low60_40_low20_0 + v_276_289 * g_236_low60_40_low20_0 = f_236_low60_40_low20_13 * (-(2**20)),
    r_276_289 * f_236_low60_40_low20_0 + s_276_289 * g_236_low60_40_low20_0 = g_236_low60_40_low20_13 * (-(2**20))
&&
    u_276_289 * f_236_low60_40_low20_0 + v_276_289 * g_236_low60_40_low20_0 = f_236_low60_40_low20_13 * (const 64 (-(2**20))),
    r_276_289 * f_236_low60_40_low20_0 + s_276_289 * g_236_low60_40_low20_0 = g_236_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_13 + u_276_289 * (const 64 (2**21)) + v_276_289 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_13 + r_276_289 * (const 64 (2**21)) + s_276_289 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_13,
    f_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_13,
    g_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 289)) <=s delta, delta <=s (const 64 (1 + 2*289)),
    (const 64 (-(2**20))) <=s u_276_289, u_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_289, v_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_289, r_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_289, s_276_289 <=s (const 64 ((2**20)-1)),
    u_276_289 + v_276_289 <=s (const 64 (2**20)),
    u_276_289 - v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 + v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 - v_276_289 <=s (const 64 (2**20)),
    r_276_289 + s_276_289 <=s (const 64 (2**20)),
    r_276_289 - s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 + s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 - s_276_289 <=s (const 64 (2**20)),
    u_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_276_289 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step289

// premise a
assume
g_236_low60_40_low20_13 = 0 (mod 2)
&&
g_236_low60_40_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_14 f_236_low60_40_low20_13;
mov u_276_290 u_276_289;
mov v_276_290 v_276_289;

asr g_236_low60_40_low20_14 g_236_low60_40_low20_13 1;
asr r_276_290 r_276_289 1;
asr s_276_290 s_276_289 1;
assert
    true
&&
    f_236_low60_40_low20_14 = f_236_low60_40_low20_13,
    u_276_290 = u_276_289,
    v_276_290 = v_276_289,
    g_236_low60_40_low20_14 * (const 64 2) = g_236_low60_40_low20_13,
    r_276_290 * (const 64 2) = r_276_289,
    s_276_290 * (const 64 2) = s_276_289
;

assume
    f_236_low60_40_low20_14 = f_236_low60_40_low20_13,
    u_276_290 = u_276_289,
    v_276_290 = v_276_289,
    g_236_low60_40_low20_14 * 2 = g_236_low60_40_low20_13,
    r_276_290 * 2 = r_276_289,
    s_276_290 * 2 = s_276_289
&&
    true
;

{
    u_276_290 * f_236_low60_40_low20_0 + v_276_290 * g_236_low60_40_low20_0 = f_236_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_290 * f_236_low60_40_low20_0 + s_276_290 * g_236_low60_40_low20_0 = g_236_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_14 + u_276_290 * (const 64 (2**21)) + v_276_290 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_14 + r_276_290 * (const 64 (2**21)) + s_276_290 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_14,
    f_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_14,
    g_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 290)) <=s delta, delta <=s (const 64 (1 + 2*290)),
    (const 64 (-(2**20))) <=s u_276_290, u_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_290, v_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_290, r_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_290, s_276_290 <=s (const 64 ((2**20)-1)),
    u_276_290 + v_276_290 <=s (const 64 (2**20)),
    u_276_290 - v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 + v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 - v_276_290 <=s (const 64 (2**20)),
    r_276_290 + s_276_290 <=s (const 64 (2**20)),
    r_276_290 - s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 + s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 - s_276_290 <=s (const 64 (2**20)),
    u_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_276_290 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_289_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_13,
sint64 g_236_low60_40_low20_13,
sint64 f_236_low60_40_low20_14,
sint64 g_236_low60_40_low20_14,
sint64 u_276_289,
sint64 v_276_289,
sint64 r_276_289,
sint64 s_276_289,
sint64 u_276_290,
sint64 v_276_290,
sint64 r_276_290,
sint64 s_276_290,
bit ne
)={
    u_276_289 * f_236_low60_40_low20_0 + v_276_289 * g_236_low60_40_low20_0 = f_236_low60_40_low20_13 * (-(2**20)),
    r_276_289 * f_236_low60_40_low20_0 + s_276_289 * g_236_low60_40_low20_0 = g_236_low60_40_low20_13 * (-(2**20))
&&
    u_276_289 * f_236_low60_40_low20_0 + v_276_289 * g_236_low60_40_low20_0 = f_236_low60_40_low20_13 * (const 64 (-(2**20))),
    r_276_289 * f_236_low60_40_low20_0 + s_276_289 * g_236_low60_40_low20_0 = g_236_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_13 + u_276_289 * (const 64 (2**21)) + v_276_289 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_13 + r_276_289 * (const 64 (2**21)) + s_276_289 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_13,
    f_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_13,
    g_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 289)) <=s delta, delta <=s (const 64 (1 + 2*289)),
    (const 64 (-(2**20))) <=s u_276_289, u_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_289, v_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_289, r_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_289, s_276_289 <=s (const 64 ((2**20)-1)),
    u_276_289 + v_276_289 <=s (const 64 (2**20)),
    u_276_289 - v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 + v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 - v_276_289 <=s (const 64 (2**20)),
    r_276_289 + s_276_289 <=s (const 64 (2**20)),
    r_276_289 - s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 + s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 - s_276_289 <=s (const 64 (2**20)),
    u_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_276_289 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step289

// premise b
assume
g_236_low60_40_low20_13 = 1 (mod 2)
&&
g_236_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_14 f_236_low60_40_low20_13;
mov u_276_290 u_276_289;
mov v_276_290 v_276_289;

add g_236_low60_40_low20_14 g_236_low60_40_low20_13 f_236_low60_40_low20_13;
asr g_236_low60_40_low20_14 g_236_low60_40_low20_14 1;
add r_276_290 r_276_289 u_276_289;
asr r_276_290 r_276_290 1;
add s_276_290 s_276_289 v_276_289;
asr s_276_290 s_276_290 1;
assert
    true
&&
    f_236_low60_40_low20_14 = f_236_low60_40_low20_13,
    u_276_290 = u_276_289,
    v_276_290 = v_276_289,
    g_236_low60_40_low20_14 * (const 64 2) = g_236_low60_40_low20_13 + f_236_low60_40_low20_13,
    r_276_290 * (const 64 2) = r_276_289 + u_276_289,
    s_276_290 * (const 64 2) = s_276_289 + v_276_289
;

assume
    f_236_low60_40_low20_14 = f_236_low60_40_low20_13,
    u_276_290 = u_276_289,
    v_276_290 = v_276_289,
    g_236_low60_40_low20_14 * 2 = g_236_low60_40_low20_13 + f_236_low60_40_low20_13,
    r_276_290 * 2 = r_276_289 + u_276_289,
    s_276_290 * 2 = s_276_289 + v_276_289
&&
    true
;

{
    u_276_290 * f_236_low60_40_low20_0 + v_276_290 * g_236_low60_40_low20_0 = f_236_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_290 * f_236_low60_40_low20_0 + s_276_290 * g_236_low60_40_low20_0 = g_236_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_14 + u_276_290 * (const 64 (2**21)) + v_276_290 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_14 + r_276_290 * (const 64 (2**21)) + s_276_290 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_14,
    f_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_14,
    g_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 290)) <=s delta, delta <=s (const 64 (1 + 2*290)),
    (const 64 (-(2**20))) <=s u_276_290, u_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_290, v_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_290, r_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_290, s_276_290 <=s (const 64 ((2**20)-1)),
    u_276_290 + v_276_290 <=s (const 64 (2**20)),
    u_276_290 - v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 + v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 - v_276_290 <=s (const 64 (2**20)),
    r_276_290 + s_276_290 <=s (const 64 (2**20)),
    r_276_290 - s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 + s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 - s_276_290 <=s (const 64 (2**20)),
    u_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_276_290 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_289_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_13,
sint64 g_236_low60_40_low20_13,
sint64 f_236_low60_40_low20_14,
sint64 g_236_low60_40_low20_14,
sint64 u_276_289,
sint64 v_276_289,
sint64 r_276_289,
sint64 s_276_289,
sint64 u_276_290,
sint64 v_276_290,
sint64 r_276_290,
sint64 s_276_290,
bit ne
)={
    u_276_289 * f_236_low60_40_low20_0 + v_276_289 * g_236_low60_40_low20_0 = f_236_low60_40_low20_13 * (-(2**20)),
    r_276_289 * f_236_low60_40_low20_0 + s_276_289 * g_236_low60_40_low20_0 = g_236_low60_40_low20_13 * (-(2**20))
&&
    u_276_289 * f_236_low60_40_low20_0 + v_276_289 * g_236_low60_40_low20_0 = f_236_low60_40_low20_13 * (const 64 (-(2**20))),
    r_276_289 * f_236_low60_40_low20_0 + s_276_289 * g_236_low60_40_low20_0 = g_236_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_13 + u_276_289 * (const 64 (2**21)) + v_276_289 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_13 + r_276_289 * (const 64 (2**21)) + s_276_289 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_13,
    f_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_13,
    g_236_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 289)) <=s delta, delta <=s (const 64 (1 + 2*289)),
    (const 64 (-(2**20))) <=s u_276_289, u_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_289, v_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_289, r_276_289 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_289, s_276_289 <=s (const 64 ((2**20)-1)),
    u_276_289 + v_276_289 <=s (const 64 (2**20)),
    u_276_289 - v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 + v_276_289 <=s (const 64 (2**20)),
    (const 64 0) - u_276_289 - v_276_289 <=s (const 64 (2**20)),
    r_276_289 + s_276_289 <=s (const 64 (2**20)),
    r_276_289 - s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 + s_276_289 <=s (const 64 (2**20)),
    (const 64 0) - r_276_289 - s_276_289 <=s (const 64 (2**20)),
    u_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_276_289 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_276_289 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step289

// premise c
assume
g_236_low60_40_low20_13 = 1 (mod 2)
&&
g_236_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_14 g_236_low60_40_low20_13;
mov u_276_290 r_276_289;
mov v_276_290 s_276_289;

subs dc g_236_low60_40_low20_14 g_236_low60_40_low20_13 f_236_low60_40_low20_13;
asr g_236_low60_40_low20_14 g_236_low60_40_low20_14 1;
subs dc r_276_290 r_276_289 u_276_289;
asr r_276_290 r_276_290 1;
subs dc s_276_290 s_276_289 v_276_289;
asr s_276_290 s_276_290 1;
assert
    true
&&
    f_236_low60_40_low20_14 = g_236_low60_40_low20_13,
    u_276_290 = r_276_289,
    v_276_290 = s_276_289,
    g_236_low60_40_low20_14 * (const 64 2) = g_236_low60_40_low20_13 - f_236_low60_40_low20_13,
    r_276_290 * (const 64 2) = r_276_289 - u_276_289,
    s_276_290 * (const 64 2) = s_276_289 - v_276_289
;

assume
    f_236_low60_40_low20_14 = g_236_low60_40_low20_13,
    u_276_290 = r_276_289,
    v_276_290 = s_276_289,
    g_236_low60_40_low20_14 * 2 = g_236_low60_40_low20_13 - f_236_low60_40_low20_13,
    r_276_290 * 2 = r_276_289 - u_276_289,
    s_276_290 * 2 = s_276_289 - v_276_289
&&
    true
;

{
    u_276_290 * f_236_low60_40_low20_0 + v_276_290 * g_236_low60_40_low20_0 = f_236_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_290 * f_236_low60_40_low20_0 + s_276_290 * g_236_low60_40_low20_0 = g_236_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_14 + u_276_290 * (const 64 (2**21)) + v_276_290 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_14 + r_276_290 * (const 64 (2**21)) + s_276_290 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_14,
    f_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_14,
    g_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 290)) <=s delta, delta <=s (const 64 (1 + 2*290)),
    (const 64 (-(2**20))) <=s u_276_290, u_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_290, v_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_290, r_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_290, s_276_290 <=s (const 64 ((2**20)-1)),
    u_276_290 + v_276_290 <=s (const 64 (2**20)),
    u_276_290 - v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 + v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 - v_276_290 <=s (const 64 (2**20)),
    r_276_290 + s_276_290 <=s (const 64 (2**20)),
    r_276_290 - s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 + s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 - s_276_290 <=s (const 64 (2**20)),
    u_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_276_290 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_290_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_14,
sint64 g_236_low60_40_low20_14,
sint64 f_236_low60_40_low20_15,
sint64 g_236_low60_40_low20_15,
sint64 u_276_290,
sint64 v_276_290,
sint64 r_276_290,
sint64 s_276_290,
sint64 u_276_291,
sint64 v_276_291,
sint64 r_276_291,
sint64 s_276_291,
bit ne
)={
    u_276_290 * f_236_low60_40_low20_0 + v_276_290 * g_236_low60_40_low20_0 = f_236_low60_40_low20_14 * (-(2**20)),
    r_276_290 * f_236_low60_40_low20_0 + s_276_290 * g_236_low60_40_low20_0 = g_236_low60_40_low20_14 * (-(2**20))
&&
    u_276_290 * f_236_low60_40_low20_0 + v_276_290 * g_236_low60_40_low20_0 = f_236_low60_40_low20_14 * (const 64 (-(2**20))),
    r_276_290 * f_236_low60_40_low20_0 + s_276_290 * g_236_low60_40_low20_0 = g_236_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_14 + u_276_290 * (const 64 (2**21)) + v_276_290 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_14 + r_276_290 * (const 64 (2**21)) + s_276_290 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_14,
    f_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_14,
    g_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 290)) <=s delta, delta <=s (const 64 (1 + 2*290)),
    (const 64 (-(2**20))) <=s u_276_290, u_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_290, v_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_290, r_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_290, s_276_290 <=s (const 64 ((2**20)-1)),
    u_276_290 + v_276_290 <=s (const 64 (2**20)),
    u_276_290 - v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 + v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 - v_276_290 <=s (const 64 (2**20)),
    r_276_290 + s_276_290 <=s (const 64 (2**20)),
    r_276_290 - s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 + s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 - s_276_290 <=s (const 64 (2**20)),
    u_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_276_290 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step290

// premise a
assume
g_236_low60_40_low20_14 = 0 (mod 2)
&&
g_236_low60_40_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_15 f_236_low60_40_low20_14;
mov u_276_291 u_276_290;
mov v_276_291 v_276_290;

asr g_236_low60_40_low20_15 g_236_low60_40_low20_14 1;
asr r_276_291 r_276_290 1;
asr s_276_291 s_276_290 1;
assert
    true
&&
    f_236_low60_40_low20_15 = f_236_low60_40_low20_14,
    u_276_291 = u_276_290,
    v_276_291 = v_276_290,
    g_236_low60_40_low20_15 * (const 64 2) = g_236_low60_40_low20_14,
    r_276_291 * (const 64 2) = r_276_290,
    s_276_291 * (const 64 2) = s_276_290
;

assume
    f_236_low60_40_low20_15 = f_236_low60_40_low20_14,
    u_276_291 = u_276_290,
    v_276_291 = v_276_290,
    g_236_low60_40_low20_15 * 2 = g_236_low60_40_low20_14,
    r_276_291 * 2 = r_276_290,
    s_276_291 * 2 = s_276_290
&&
    true
;

{
    u_276_291 * f_236_low60_40_low20_0 + v_276_291 * g_236_low60_40_low20_0 = f_236_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_291 * f_236_low60_40_low20_0 + s_276_291 * g_236_low60_40_low20_0 = g_236_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_15 + u_276_291 * (const 64 (2**21)) + v_276_291 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_15 + r_276_291 * (const 64 (2**21)) + s_276_291 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_15,
    f_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_15,
    g_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 291)) <=s delta, delta <=s (const 64 (1 + 2*291)),
    (const 64 (-(2**20))) <=s u_276_291, u_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_291, v_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_291, r_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_291, s_276_291 <=s (const 64 ((2**20)-1)),
    u_276_291 + v_276_291 <=s (const 64 (2**20)),
    u_276_291 - v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 + v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 - v_276_291 <=s (const 64 (2**20)),
    r_276_291 + s_276_291 <=s (const 64 (2**20)),
    r_276_291 - s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 + s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 - s_276_291 <=s (const 64 (2**20)),
    u_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_276_291 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_290_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_14,
sint64 g_236_low60_40_low20_14,
sint64 f_236_low60_40_low20_15,
sint64 g_236_low60_40_low20_15,
sint64 u_276_290,
sint64 v_276_290,
sint64 r_276_290,
sint64 s_276_290,
sint64 u_276_291,
sint64 v_276_291,
sint64 r_276_291,
sint64 s_276_291,
bit ne
)={
    u_276_290 * f_236_low60_40_low20_0 + v_276_290 * g_236_low60_40_low20_0 = f_236_low60_40_low20_14 * (-(2**20)),
    r_276_290 * f_236_low60_40_low20_0 + s_276_290 * g_236_low60_40_low20_0 = g_236_low60_40_low20_14 * (-(2**20))
&&
    u_276_290 * f_236_low60_40_low20_0 + v_276_290 * g_236_low60_40_low20_0 = f_236_low60_40_low20_14 * (const 64 (-(2**20))),
    r_276_290 * f_236_low60_40_low20_0 + s_276_290 * g_236_low60_40_low20_0 = g_236_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_14 + u_276_290 * (const 64 (2**21)) + v_276_290 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_14 + r_276_290 * (const 64 (2**21)) + s_276_290 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_14,
    f_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_14,
    g_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 290)) <=s delta, delta <=s (const 64 (1 + 2*290)),
    (const 64 (-(2**20))) <=s u_276_290, u_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_290, v_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_290, r_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_290, s_276_290 <=s (const 64 ((2**20)-1)),
    u_276_290 + v_276_290 <=s (const 64 (2**20)),
    u_276_290 - v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 + v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 - v_276_290 <=s (const 64 (2**20)),
    r_276_290 + s_276_290 <=s (const 64 (2**20)),
    r_276_290 - s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 + s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 - s_276_290 <=s (const 64 (2**20)),
    u_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_276_290 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step290

// premise b
assume
g_236_low60_40_low20_14 = 1 (mod 2)
&&
g_236_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_15 f_236_low60_40_low20_14;
mov u_276_291 u_276_290;
mov v_276_291 v_276_290;

add g_236_low60_40_low20_15 g_236_low60_40_low20_14 f_236_low60_40_low20_14;
asr g_236_low60_40_low20_15 g_236_low60_40_low20_15 1;
add r_276_291 r_276_290 u_276_290;
asr r_276_291 r_276_291 1;
add s_276_291 s_276_290 v_276_290;
asr s_276_291 s_276_291 1;
assert
    true
&&
    f_236_low60_40_low20_15 = f_236_low60_40_low20_14,
    u_276_291 = u_276_290,
    v_276_291 = v_276_290,
    g_236_low60_40_low20_15 * (const 64 2) = g_236_low60_40_low20_14 + f_236_low60_40_low20_14,
    r_276_291 * (const 64 2) = r_276_290 + u_276_290,
    s_276_291 * (const 64 2) = s_276_290 + v_276_290
;

assume
    f_236_low60_40_low20_15 = f_236_low60_40_low20_14,
    u_276_291 = u_276_290,
    v_276_291 = v_276_290,
    g_236_low60_40_low20_15 * 2 = g_236_low60_40_low20_14 + f_236_low60_40_low20_14,
    r_276_291 * 2 = r_276_290 + u_276_290,
    s_276_291 * 2 = s_276_290 + v_276_290
&&
    true
;

{
    u_276_291 * f_236_low60_40_low20_0 + v_276_291 * g_236_low60_40_low20_0 = f_236_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_291 * f_236_low60_40_low20_0 + s_276_291 * g_236_low60_40_low20_0 = g_236_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_15 + u_276_291 * (const 64 (2**21)) + v_276_291 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_15 + r_276_291 * (const 64 (2**21)) + s_276_291 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_15,
    f_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_15,
    g_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 291)) <=s delta, delta <=s (const 64 (1 + 2*291)),
    (const 64 (-(2**20))) <=s u_276_291, u_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_291, v_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_291, r_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_291, s_276_291 <=s (const 64 ((2**20)-1)),
    u_276_291 + v_276_291 <=s (const 64 (2**20)),
    u_276_291 - v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 + v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 - v_276_291 <=s (const 64 (2**20)),
    r_276_291 + s_276_291 <=s (const 64 (2**20)),
    r_276_291 - s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 + s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 - s_276_291 <=s (const 64 (2**20)),
    u_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_276_291 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_290_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_14,
sint64 g_236_low60_40_low20_14,
sint64 f_236_low60_40_low20_15,
sint64 g_236_low60_40_low20_15,
sint64 u_276_290,
sint64 v_276_290,
sint64 r_276_290,
sint64 s_276_290,
sint64 u_276_291,
sint64 v_276_291,
sint64 r_276_291,
sint64 s_276_291,
bit ne
)={
    u_276_290 * f_236_low60_40_low20_0 + v_276_290 * g_236_low60_40_low20_0 = f_236_low60_40_low20_14 * (-(2**20)),
    r_276_290 * f_236_low60_40_low20_0 + s_276_290 * g_236_low60_40_low20_0 = g_236_low60_40_low20_14 * (-(2**20))
&&
    u_276_290 * f_236_low60_40_low20_0 + v_276_290 * g_236_low60_40_low20_0 = f_236_low60_40_low20_14 * (const 64 (-(2**20))),
    r_276_290 * f_236_low60_40_low20_0 + s_276_290 * g_236_low60_40_low20_0 = g_236_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_14 + u_276_290 * (const 64 (2**21)) + v_276_290 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_14 + r_276_290 * (const 64 (2**21)) + s_276_290 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_14,
    f_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_14,
    g_236_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 290)) <=s delta, delta <=s (const 64 (1 + 2*290)),
    (const 64 (-(2**20))) <=s u_276_290, u_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_290, v_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_290, r_276_290 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_290, s_276_290 <=s (const 64 ((2**20)-1)),
    u_276_290 + v_276_290 <=s (const 64 (2**20)),
    u_276_290 - v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 + v_276_290 <=s (const 64 (2**20)),
    (const 64 0) - u_276_290 - v_276_290 <=s (const 64 (2**20)),
    r_276_290 + s_276_290 <=s (const 64 (2**20)),
    r_276_290 - s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 + s_276_290 <=s (const 64 (2**20)),
    (const 64 0) - r_276_290 - s_276_290 <=s (const 64 (2**20)),
    u_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_276_290 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_276_290 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step290

// premise c
assume
g_236_low60_40_low20_14 = 1 (mod 2)
&&
g_236_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_15 g_236_low60_40_low20_14;
mov u_276_291 r_276_290;
mov v_276_291 s_276_290;

subs dc g_236_low60_40_low20_15 g_236_low60_40_low20_14 f_236_low60_40_low20_14;
asr g_236_low60_40_low20_15 g_236_low60_40_low20_15 1;
subs dc r_276_291 r_276_290 u_276_290;
asr r_276_291 r_276_291 1;
subs dc s_276_291 s_276_290 v_276_290;
asr s_276_291 s_276_291 1;
assert
    true
&&
    f_236_low60_40_low20_15 = g_236_low60_40_low20_14,
    u_276_291 = r_276_290,
    v_276_291 = s_276_290,
    g_236_low60_40_low20_15 * (const 64 2) = g_236_low60_40_low20_14 - f_236_low60_40_low20_14,
    r_276_291 * (const 64 2) = r_276_290 - u_276_290,
    s_276_291 * (const 64 2) = s_276_290 - v_276_290
;

assume
    f_236_low60_40_low20_15 = g_236_low60_40_low20_14,
    u_276_291 = r_276_290,
    v_276_291 = s_276_290,
    g_236_low60_40_low20_15 * 2 = g_236_low60_40_low20_14 - f_236_low60_40_low20_14,
    r_276_291 * 2 = r_276_290 - u_276_290,
    s_276_291 * 2 = s_276_290 - v_276_290
&&
    true
;

{
    u_276_291 * f_236_low60_40_low20_0 + v_276_291 * g_236_low60_40_low20_0 = f_236_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_291 * f_236_low60_40_low20_0 + s_276_291 * g_236_low60_40_low20_0 = g_236_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_15 + u_276_291 * (const 64 (2**21)) + v_276_291 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_15 + r_276_291 * (const 64 (2**21)) + s_276_291 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_15,
    f_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_15,
    g_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 291)) <=s delta, delta <=s (const 64 (1 + 2*291)),
    (const 64 (-(2**20))) <=s u_276_291, u_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_291, v_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_291, r_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_291, s_276_291 <=s (const 64 ((2**20)-1)),
    u_276_291 + v_276_291 <=s (const 64 (2**20)),
    u_276_291 - v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 + v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 - v_276_291 <=s (const 64 (2**20)),
    r_276_291 + s_276_291 <=s (const 64 (2**20)),
    r_276_291 - s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 + s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 - s_276_291 <=s (const 64 (2**20)),
    u_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_276_291 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_291_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_15,
sint64 g_236_low60_40_low20_15,
sint64 f_236_low60_40_low20_16,
sint64 g_236_low60_40_low20_16,
sint64 u_276_291,
sint64 v_276_291,
sint64 r_276_291,
sint64 s_276_291,
sint64 u_276_292,
sint64 v_276_292,
sint64 r_276_292,
sint64 s_276_292,
bit ne
)={
    u_276_291 * f_236_low60_40_low20_0 + v_276_291 * g_236_low60_40_low20_0 = f_236_low60_40_low20_15 * (-(2**20)),
    r_276_291 * f_236_low60_40_low20_0 + s_276_291 * g_236_low60_40_low20_0 = g_236_low60_40_low20_15 * (-(2**20))
&&
    u_276_291 * f_236_low60_40_low20_0 + v_276_291 * g_236_low60_40_low20_0 = f_236_low60_40_low20_15 * (const 64 (-(2**20))),
    r_276_291 * f_236_low60_40_low20_0 + s_276_291 * g_236_low60_40_low20_0 = g_236_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_15 + u_276_291 * (const 64 (2**21)) + v_276_291 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_15 + r_276_291 * (const 64 (2**21)) + s_276_291 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_15,
    f_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_15,
    g_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 291)) <=s delta, delta <=s (const 64 (1 + 2*291)),
    (const 64 (-(2**20))) <=s u_276_291, u_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_291, v_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_291, r_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_291, s_276_291 <=s (const 64 ((2**20)-1)),
    u_276_291 + v_276_291 <=s (const 64 (2**20)),
    u_276_291 - v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 + v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 - v_276_291 <=s (const 64 (2**20)),
    r_276_291 + s_276_291 <=s (const 64 (2**20)),
    r_276_291 - s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 + s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 - s_276_291 <=s (const 64 (2**20)),
    u_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_276_291 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step291

// premise a
assume
g_236_low60_40_low20_15 = 0 (mod 2)
&&
g_236_low60_40_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_16 f_236_low60_40_low20_15;
mov u_276_292 u_276_291;
mov v_276_292 v_276_291;

asr g_236_low60_40_low20_16 g_236_low60_40_low20_15 1;
asr r_276_292 r_276_291 1;
asr s_276_292 s_276_291 1;
assert
    true
&&
    f_236_low60_40_low20_16 = f_236_low60_40_low20_15,
    u_276_292 = u_276_291,
    v_276_292 = v_276_291,
    g_236_low60_40_low20_16 * (const 64 2) = g_236_low60_40_low20_15,
    r_276_292 * (const 64 2) = r_276_291,
    s_276_292 * (const 64 2) = s_276_291
;

assume
    f_236_low60_40_low20_16 = f_236_low60_40_low20_15,
    u_276_292 = u_276_291,
    v_276_292 = v_276_291,
    g_236_low60_40_low20_16 * 2 = g_236_low60_40_low20_15,
    r_276_292 * 2 = r_276_291,
    s_276_292 * 2 = s_276_291
&&
    true
;

{
    u_276_292 * f_236_low60_40_low20_0 + v_276_292 * g_236_low60_40_low20_0 = f_236_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_292 * f_236_low60_40_low20_0 + s_276_292 * g_236_low60_40_low20_0 = g_236_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_16 + u_276_292 * (const 64 (2**21)) + v_276_292 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_16 + r_276_292 * (const 64 (2**21)) + s_276_292 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_16,
    f_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_16,
    g_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 292)) <=s delta, delta <=s (const 64 (1 + 2*292)),
    (const 64 (-(2**20))) <=s u_276_292, u_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_292, v_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_292, r_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_292, s_276_292 <=s (const 64 ((2**20)-1)),
    u_276_292 + v_276_292 <=s (const 64 (2**20)),
    u_276_292 - v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 + v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 - v_276_292 <=s (const 64 (2**20)),
    r_276_292 + s_276_292 <=s (const 64 (2**20)),
    r_276_292 - s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 + s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 - s_276_292 <=s (const 64 (2**20)),
    u_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_276_292 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_291_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_15,
sint64 g_236_low60_40_low20_15,
sint64 f_236_low60_40_low20_16,
sint64 g_236_low60_40_low20_16,
sint64 u_276_291,
sint64 v_276_291,
sint64 r_276_291,
sint64 s_276_291,
sint64 u_276_292,
sint64 v_276_292,
sint64 r_276_292,
sint64 s_276_292,
bit ne
)={
    u_276_291 * f_236_low60_40_low20_0 + v_276_291 * g_236_low60_40_low20_0 = f_236_low60_40_low20_15 * (-(2**20)),
    r_276_291 * f_236_low60_40_low20_0 + s_276_291 * g_236_low60_40_low20_0 = g_236_low60_40_low20_15 * (-(2**20))
&&
    u_276_291 * f_236_low60_40_low20_0 + v_276_291 * g_236_low60_40_low20_0 = f_236_low60_40_low20_15 * (const 64 (-(2**20))),
    r_276_291 * f_236_low60_40_low20_0 + s_276_291 * g_236_low60_40_low20_0 = g_236_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_15 + u_276_291 * (const 64 (2**21)) + v_276_291 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_15 + r_276_291 * (const 64 (2**21)) + s_276_291 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_15,
    f_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_15,
    g_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 291)) <=s delta, delta <=s (const 64 (1 + 2*291)),
    (const 64 (-(2**20))) <=s u_276_291, u_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_291, v_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_291, r_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_291, s_276_291 <=s (const 64 ((2**20)-1)),
    u_276_291 + v_276_291 <=s (const 64 (2**20)),
    u_276_291 - v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 + v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 - v_276_291 <=s (const 64 (2**20)),
    r_276_291 + s_276_291 <=s (const 64 (2**20)),
    r_276_291 - s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 + s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 - s_276_291 <=s (const 64 (2**20)),
    u_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_276_291 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step291

// premise b
assume
g_236_low60_40_low20_15 = 1 (mod 2)
&&
g_236_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_16 f_236_low60_40_low20_15;
mov u_276_292 u_276_291;
mov v_276_292 v_276_291;

add g_236_low60_40_low20_16 g_236_low60_40_low20_15 f_236_low60_40_low20_15;
asr g_236_low60_40_low20_16 g_236_low60_40_low20_16 1;
add r_276_292 r_276_291 u_276_291;
asr r_276_292 r_276_292 1;
add s_276_292 s_276_291 v_276_291;
asr s_276_292 s_276_292 1;
assert
    true
&&
    f_236_low60_40_low20_16 = f_236_low60_40_low20_15,
    u_276_292 = u_276_291,
    v_276_292 = v_276_291,
    g_236_low60_40_low20_16 * (const 64 2) = g_236_low60_40_low20_15 + f_236_low60_40_low20_15,
    r_276_292 * (const 64 2) = r_276_291 + u_276_291,
    s_276_292 * (const 64 2) = s_276_291 + v_276_291
;

assume
    f_236_low60_40_low20_16 = f_236_low60_40_low20_15,
    u_276_292 = u_276_291,
    v_276_292 = v_276_291,
    g_236_low60_40_low20_16 * 2 = g_236_low60_40_low20_15 + f_236_low60_40_low20_15,
    r_276_292 * 2 = r_276_291 + u_276_291,
    s_276_292 * 2 = s_276_291 + v_276_291
&&
    true
;

{
    u_276_292 * f_236_low60_40_low20_0 + v_276_292 * g_236_low60_40_low20_0 = f_236_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_292 * f_236_low60_40_low20_0 + s_276_292 * g_236_low60_40_low20_0 = g_236_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_16 + u_276_292 * (const 64 (2**21)) + v_276_292 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_16 + r_276_292 * (const 64 (2**21)) + s_276_292 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_16,
    f_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_16,
    g_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 292)) <=s delta, delta <=s (const 64 (1 + 2*292)),
    (const 64 (-(2**20))) <=s u_276_292, u_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_292, v_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_292, r_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_292, s_276_292 <=s (const 64 ((2**20)-1)),
    u_276_292 + v_276_292 <=s (const 64 (2**20)),
    u_276_292 - v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 + v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 - v_276_292 <=s (const 64 (2**20)),
    r_276_292 + s_276_292 <=s (const 64 (2**20)),
    r_276_292 - s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 + s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 - s_276_292 <=s (const 64 (2**20)),
    u_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_276_292 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_291_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_15,
sint64 g_236_low60_40_low20_15,
sint64 f_236_low60_40_low20_16,
sint64 g_236_low60_40_low20_16,
sint64 u_276_291,
sint64 v_276_291,
sint64 r_276_291,
sint64 s_276_291,
sint64 u_276_292,
sint64 v_276_292,
sint64 r_276_292,
sint64 s_276_292,
bit ne
)={
    u_276_291 * f_236_low60_40_low20_0 + v_276_291 * g_236_low60_40_low20_0 = f_236_low60_40_low20_15 * (-(2**20)),
    r_276_291 * f_236_low60_40_low20_0 + s_276_291 * g_236_low60_40_low20_0 = g_236_low60_40_low20_15 * (-(2**20))
&&
    u_276_291 * f_236_low60_40_low20_0 + v_276_291 * g_236_low60_40_low20_0 = f_236_low60_40_low20_15 * (const 64 (-(2**20))),
    r_276_291 * f_236_low60_40_low20_0 + s_276_291 * g_236_low60_40_low20_0 = g_236_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_15 + u_276_291 * (const 64 (2**21)) + v_276_291 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_15 + r_276_291 * (const 64 (2**21)) + s_276_291 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_15,
    f_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_15,
    g_236_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 291)) <=s delta, delta <=s (const 64 (1 + 2*291)),
    (const 64 (-(2**20))) <=s u_276_291, u_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_291, v_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_291, r_276_291 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_291, s_276_291 <=s (const 64 ((2**20)-1)),
    u_276_291 + v_276_291 <=s (const 64 (2**20)),
    u_276_291 - v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 + v_276_291 <=s (const 64 (2**20)),
    (const 64 0) - u_276_291 - v_276_291 <=s (const 64 (2**20)),
    r_276_291 + s_276_291 <=s (const 64 (2**20)),
    r_276_291 - s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 + s_276_291 <=s (const 64 (2**20)),
    (const 64 0) - r_276_291 - s_276_291 <=s (const 64 (2**20)),
    u_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_276_291 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_276_291 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step291

// premise c
assume
g_236_low60_40_low20_15 = 1 (mod 2)
&&
g_236_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_16 g_236_low60_40_low20_15;
mov u_276_292 r_276_291;
mov v_276_292 s_276_291;

subs dc g_236_low60_40_low20_16 g_236_low60_40_low20_15 f_236_low60_40_low20_15;
asr g_236_low60_40_low20_16 g_236_low60_40_low20_16 1;
subs dc r_276_292 r_276_291 u_276_291;
asr r_276_292 r_276_292 1;
subs dc s_276_292 s_276_291 v_276_291;
asr s_276_292 s_276_292 1;
assert
    true
&&
    f_236_low60_40_low20_16 = g_236_low60_40_low20_15,
    u_276_292 = r_276_291,
    v_276_292 = s_276_291,
    g_236_low60_40_low20_16 * (const 64 2) = g_236_low60_40_low20_15 - f_236_low60_40_low20_15,
    r_276_292 * (const 64 2) = r_276_291 - u_276_291,
    s_276_292 * (const 64 2) = s_276_291 - v_276_291
;

assume
    f_236_low60_40_low20_16 = g_236_low60_40_low20_15,
    u_276_292 = r_276_291,
    v_276_292 = s_276_291,
    g_236_low60_40_low20_16 * 2 = g_236_low60_40_low20_15 - f_236_low60_40_low20_15,
    r_276_292 * 2 = r_276_291 - u_276_291,
    s_276_292 * 2 = s_276_291 - v_276_291
&&
    true
;

{
    u_276_292 * f_236_low60_40_low20_0 + v_276_292 * g_236_low60_40_low20_0 = f_236_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_292 * f_236_low60_40_low20_0 + s_276_292 * g_236_low60_40_low20_0 = g_236_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_16 + u_276_292 * (const 64 (2**21)) + v_276_292 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_16 + r_276_292 * (const 64 (2**21)) + s_276_292 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_16,
    f_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_16,
    g_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 292)) <=s delta, delta <=s (const 64 (1 + 2*292)),
    (const 64 (-(2**20))) <=s u_276_292, u_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_292, v_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_292, r_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_292, s_276_292 <=s (const 64 ((2**20)-1)),
    u_276_292 + v_276_292 <=s (const 64 (2**20)),
    u_276_292 - v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 + v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 - v_276_292 <=s (const 64 (2**20)),
    r_276_292 + s_276_292 <=s (const 64 (2**20)),
    r_276_292 - s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 + s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 - s_276_292 <=s (const 64 (2**20)),
    u_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_276_292 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_292_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_16,
sint64 g_236_low60_40_low20_16,
sint64 f_236_low60_40_low20_17,
sint64 g_236_low60_40_low20_17,
sint64 u_276_292,
sint64 v_276_292,
sint64 r_276_292,
sint64 s_276_292,
sint64 u_276_293,
sint64 v_276_293,
sint64 r_276_293,
sint64 s_276_293,
bit ne
)={
    u_276_292 * f_236_low60_40_low20_0 + v_276_292 * g_236_low60_40_low20_0 = f_236_low60_40_low20_16 * (-(2**20)),
    r_276_292 * f_236_low60_40_low20_0 + s_276_292 * g_236_low60_40_low20_0 = g_236_low60_40_low20_16 * (-(2**20))
&&
    u_276_292 * f_236_low60_40_low20_0 + v_276_292 * g_236_low60_40_low20_0 = f_236_low60_40_low20_16 * (const 64 (-(2**20))),
    r_276_292 * f_236_low60_40_low20_0 + s_276_292 * g_236_low60_40_low20_0 = g_236_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_16 + u_276_292 * (const 64 (2**21)) + v_276_292 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_16 + r_276_292 * (const 64 (2**21)) + s_276_292 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_16,
    f_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_16,
    g_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 292)) <=s delta, delta <=s (const 64 (1 + 2*292)),
    (const 64 (-(2**20))) <=s u_276_292, u_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_292, v_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_292, r_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_292, s_276_292 <=s (const 64 ((2**20)-1)),
    u_276_292 + v_276_292 <=s (const 64 (2**20)),
    u_276_292 - v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 + v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 - v_276_292 <=s (const 64 (2**20)),
    r_276_292 + s_276_292 <=s (const 64 (2**20)),
    r_276_292 - s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 + s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 - s_276_292 <=s (const 64 (2**20)),
    u_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_276_292 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step292

// premise a
assume
g_236_low60_40_low20_16 = 0 (mod 2)
&&
g_236_low60_40_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_17 f_236_low60_40_low20_16;
mov u_276_293 u_276_292;
mov v_276_293 v_276_292;

asr g_236_low60_40_low20_17 g_236_low60_40_low20_16 1;
asr r_276_293 r_276_292 1;
asr s_276_293 s_276_292 1;
assert
    true
&&
    f_236_low60_40_low20_17 = f_236_low60_40_low20_16,
    u_276_293 = u_276_292,
    v_276_293 = v_276_292,
    g_236_low60_40_low20_17 * (const 64 2) = g_236_low60_40_low20_16,
    r_276_293 * (const 64 2) = r_276_292,
    s_276_293 * (const 64 2) = s_276_292
;

assume
    f_236_low60_40_low20_17 = f_236_low60_40_low20_16,
    u_276_293 = u_276_292,
    v_276_293 = v_276_292,
    g_236_low60_40_low20_17 * 2 = g_236_low60_40_low20_16,
    r_276_293 * 2 = r_276_292,
    s_276_293 * 2 = s_276_292
&&
    true
;

{
    u_276_293 * f_236_low60_40_low20_0 + v_276_293 * g_236_low60_40_low20_0 = f_236_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_293 * f_236_low60_40_low20_0 + s_276_293 * g_236_low60_40_low20_0 = g_236_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_17 + u_276_293 * (const 64 (2**21)) + v_276_293 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_17 + r_276_293 * (const 64 (2**21)) + s_276_293 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_17,
    f_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_17,
    g_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 293)) <=s delta, delta <=s (const 64 (1 + 2*293)),
    (const 64 (-(2**20))) <=s u_276_293, u_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_293, v_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_293, r_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_293, s_276_293 <=s (const 64 ((2**20)-1)),
    u_276_293 + v_276_293 <=s (const 64 (2**20)),
    u_276_293 - v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 + v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 - v_276_293 <=s (const 64 (2**20)),
    r_276_293 + s_276_293 <=s (const 64 (2**20)),
    r_276_293 - s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 + s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 - s_276_293 <=s (const 64 (2**20)),
    u_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_276_293 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_292_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_16,
sint64 g_236_low60_40_low20_16,
sint64 f_236_low60_40_low20_17,
sint64 g_236_low60_40_low20_17,
sint64 u_276_292,
sint64 v_276_292,
sint64 r_276_292,
sint64 s_276_292,
sint64 u_276_293,
sint64 v_276_293,
sint64 r_276_293,
sint64 s_276_293,
bit ne
)={
    u_276_292 * f_236_low60_40_low20_0 + v_276_292 * g_236_low60_40_low20_0 = f_236_low60_40_low20_16 * (-(2**20)),
    r_276_292 * f_236_low60_40_low20_0 + s_276_292 * g_236_low60_40_low20_0 = g_236_low60_40_low20_16 * (-(2**20))
&&
    u_276_292 * f_236_low60_40_low20_0 + v_276_292 * g_236_low60_40_low20_0 = f_236_low60_40_low20_16 * (const 64 (-(2**20))),
    r_276_292 * f_236_low60_40_low20_0 + s_276_292 * g_236_low60_40_low20_0 = g_236_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_16 + u_276_292 * (const 64 (2**21)) + v_276_292 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_16 + r_276_292 * (const 64 (2**21)) + s_276_292 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_16,
    f_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_16,
    g_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 292)) <=s delta, delta <=s (const 64 (1 + 2*292)),
    (const 64 (-(2**20))) <=s u_276_292, u_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_292, v_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_292, r_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_292, s_276_292 <=s (const 64 ((2**20)-1)),
    u_276_292 + v_276_292 <=s (const 64 (2**20)),
    u_276_292 - v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 + v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 - v_276_292 <=s (const 64 (2**20)),
    r_276_292 + s_276_292 <=s (const 64 (2**20)),
    r_276_292 - s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 + s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 - s_276_292 <=s (const 64 (2**20)),
    u_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_276_292 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step292

// premise b
assume
g_236_low60_40_low20_16 = 1 (mod 2)
&&
g_236_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_17 f_236_low60_40_low20_16;
mov u_276_293 u_276_292;
mov v_276_293 v_276_292;

add g_236_low60_40_low20_17 g_236_low60_40_low20_16 f_236_low60_40_low20_16;
asr g_236_low60_40_low20_17 g_236_low60_40_low20_17 1;
add r_276_293 r_276_292 u_276_292;
asr r_276_293 r_276_293 1;
add s_276_293 s_276_292 v_276_292;
asr s_276_293 s_276_293 1;
assert
    true
&&
    f_236_low60_40_low20_17 = f_236_low60_40_low20_16,
    u_276_293 = u_276_292,
    v_276_293 = v_276_292,
    g_236_low60_40_low20_17 * (const 64 2) = g_236_low60_40_low20_16 + f_236_low60_40_low20_16,
    r_276_293 * (const 64 2) = r_276_292 + u_276_292,
    s_276_293 * (const 64 2) = s_276_292 + v_276_292
;

assume
    f_236_low60_40_low20_17 = f_236_low60_40_low20_16,
    u_276_293 = u_276_292,
    v_276_293 = v_276_292,
    g_236_low60_40_low20_17 * 2 = g_236_low60_40_low20_16 + f_236_low60_40_low20_16,
    r_276_293 * 2 = r_276_292 + u_276_292,
    s_276_293 * 2 = s_276_292 + v_276_292
&&
    true
;

{
    u_276_293 * f_236_low60_40_low20_0 + v_276_293 * g_236_low60_40_low20_0 = f_236_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_293 * f_236_low60_40_low20_0 + s_276_293 * g_236_low60_40_low20_0 = g_236_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_17 + u_276_293 * (const 64 (2**21)) + v_276_293 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_17 + r_276_293 * (const 64 (2**21)) + s_276_293 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_17,
    f_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_17,
    g_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 293)) <=s delta, delta <=s (const 64 (1 + 2*293)),
    (const 64 (-(2**20))) <=s u_276_293, u_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_293, v_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_293, r_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_293, s_276_293 <=s (const 64 ((2**20)-1)),
    u_276_293 + v_276_293 <=s (const 64 (2**20)),
    u_276_293 - v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 + v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 - v_276_293 <=s (const 64 (2**20)),
    r_276_293 + s_276_293 <=s (const 64 (2**20)),
    r_276_293 - s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 + s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 - s_276_293 <=s (const 64 (2**20)),
    u_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_276_293 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_292_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_16,
sint64 g_236_low60_40_low20_16,
sint64 f_236_low60_40_low20_17,
sint64 g_236_low60_40_low20_17,
sint64 u_276_292,
sint64 v_276_292,
sint64 r_276_292,
sint64 s_276_292,
sint64 u_276_293,
sint64 v_276_293,
sint64 r_276_293,
sint64 s_276_293,
bit ne
)={
    u_276_292 * f_236_low60_40_low20_0 + v_276_292 * g_236_low60_40_low20_0 = f_236_low60_40_low20_16 * (-(2**20)),
    r_276_292 * f_236_low60_40_low20_0 + s_276_292 * g_236_low60_40_low20_0 = g_236_low60_40_low20_16 * (-(2**20))
&&
    u_276_292 * f_236_low60_40_low20_0 + v_276_292 * g_236_low60_40_low20_0 = f_236_low60_40_low20_16 * (const 64 (-(2**20))),
    r_276_292 * f_236_low60_40_low20_0 + s_276_292 * g_236_low60_40_low20_0 = g_236_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_16 + u_276_292 * (const 64 (2**21)) + v_276_292 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_16 + r_276_292 * (const 64 (2**21)) + s_276_292 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_16,
    f_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_16,
    g_236_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 292)) <=s delta, delta <=s (const 64 (1 + 2*292)),
    (const 64 (-(2**20))) <=s u_276_292, u_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_292, v_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_292, r_276_292 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_292, s_276_292 <=s (const 64 ((2**20)-1)),
    u_276_292 + v_276_292 <=s (const 64 (2**20)),
    u_276_292 - v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 + v_276_292 <=s (const 64 (2**20)),
    (const 64 0) - u_276_292 - v_276_292 <=s (const 64 (2**20)),
    r_276_292 + s_276_292 <=s (const 64 (2**20)),
    r_276_292 - s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 + s_276_292 <=s (const 64 (2**20)),
    (const 64 0) - r_276_292 - s_276_292 <=s (const 64 (2**20)),
    u_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_276_292 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_276_292 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step292

// premise c
assume
g_236_low60_40_low20_16 = 1 (mod 2)
&&
g_236_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_17 g_236_low60_40_low20_16;
mov u_276_293 r_276_292;
mov v_276_293 s_276_292;

subs dc g_236_low60_40_low20_17 g_236_low60_40_low20_16 f_236_low60_40_low20_16;
asr g_236_low60_40_low20_17 g_236_low60_40_low20_17 1;
subs dc r_276_293 r_276_292 u_276_292;
asr r_276_293 r_276_293 1;
subs dc s_276_293 s_276_292 v_276_292;
asr s_276_293 s_276_293 1;
assert
    true
&&
    f_236_low60_40_low20_17 = g_236_low60_40_low20_16,
    u_276_293 = r_276_292,
    v_276_293 = s_276_292,
    g_236_low60_40_low20_17 * (const 64 2) = g_236_low60_40_low20_16 - f_236_low60_40_low20_16,
    r_276_293 * (const 64 2) = r_276_292 - u_276_292,
    s_276_293 * (const 64 2) = s_276_292 - v_276_292
;

assume
    f_236_low60_40_low20_17 = g_236_low60_40_low20_16,
    u_276_293 = r_276_292,
    v_276_293 = s_276_292,
    g_236_low60_40_low20_17 * 2 = g_236_low60_40_low20_16 - f_236_low60_40_low20_16,
    r_276_293 * 2 = r_276_292 - u_276_292,
    s_276_293 * 2 = s_276_292 - v_276_292
&&
    true
;

{
    u_276_293 * f_236_low60_40_low20_0 + v_276_293 * g_236_low60_40_low20_0 = f_236_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_293 * f_236_low60_40_low20_0 + s_276_293 * g_236_low60_40_low20_0 = g_236_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_17 + u_276_293 * (const 64 (2**21)) + v_276_293 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_17 + r_276_293 * (const 64 (2**21)) + s_276_293 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_17,
    f_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_17,
    g_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 293)) <=s delta, delta <=s (const 64 (1 + 2*293)),
    (const 64 (-(2**20))) <=s u_276_293, u_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_293, v_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_293, r_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_293, s_276_293 <=s (const 64 ((2**20)-1)),
    u_276_293 + v_276_293 <=s (const 64 (2**20)),
    u_276_293 - v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 + v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 - v_276_293 <=s (const 64 (2**20)),
    r_276_293 + s_276_293 <=s (const 64 (2**20)),
    r_276_293 - s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 + s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 - s_276_293 <=s (const 64 (2**20)),
    u_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_276_293 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_293_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_17,
sint64 g_236_low60_40_low20_17,
sint64 f_236_low60_40_low20_18,
sint64 g_236_low60_40_low20_18,
sint64 u_276_293,
sint64 v_276_293,
sint64 r_276_293,
sint64 s_276_293,
sint64 u_276_294,
sint64 v_276_294,
sint64 r_276_294,
sint64 s_276_294,
bit ne
)={
    u_276_293 * f_236_low60_40_low20_0 + v_276_293 * g_236_low60_40_low20_0 = f_236_low60_40_low20_17 * (-(2**20)),
    r_276_293 * f_236_low60_40_low20_0 + s_276_293 * g_236_low60_40_low20_0 = g_236_low60_40_low20_17 * (-(2**20))
&&
    u_276_293 * f_236_low60_40_low20_0 + v_276_293 * g_236_low60_40_low20_0 = f_236_low60_40_low20_17 * (const 64 (-(2**20))),
    r_276_293 * f_236_low60_40_low20_0 + s_276_293 * g_236_low60_40_low20_0 = g_236_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_17 + u_276_293 * (const 64 (2**21)) + v_276_293 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_17 + r_276_293 * (const 64 (2**21)) + s_276_293 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_17,
    f_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_17,
    g_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 293)) <=s delta, delta <=s (const 64 (1 + 2*293)),
    (const 64 (-(2**20))) <=s u_276_293, u_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_293, v_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_293, r_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_293, s_276_293 <=s (const 64 ((2**20)-1)),
    u_276_293 + v_276_293 <=s (const 64 (2**20)),
    u_276_293 - v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 + v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 - v_276_293 <=s (const 64 (2**20)),
    r_276_293 + s_276_293 <=s (const 64 (2**20)),
    r_276_293 - s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 + s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 - s_276_293 <=s (const 64 (2**20)),
    u_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_276_293 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step293

// premise a
assume
g_236_low60_40_low20_17 = 0 (mod 2)
&&
g_236_low60_40_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_236_low60_40_low20_18 f_236_low60_40_low20_17;
mov u_276_294 u_276_293;
mov v_276_294 v_276_293;

asr g_236_low60_40_low20_18 g_236_low60_40_low20_17 1;
asr r_276_294 r_276_293 1;
asr s_276_294 s_276_293 1;
assert
    true
&&
    f_236_low60_40_low20_18 = f_236_low60_40_low20_17,
    u_276_294 = u_276_293,
    v_276_294 = v_276_293,
    g_236_low60_40_low20_18 * (const 64 2) = g_236_low60_40_low20_17,
    r_276_294 * (const 64 2) = r_276_293,
    s_276_294 * (const 64 2) = s_276_293
;

assume
    f_236_low60_40_low20_18 = f_236_low60_40_low20_17,
    u_276_294 = u_276_293,
    v_276_294 = v_276_293,
    g_236_low60_40_low20_18 * 2 = g_236_low60_40_low20_17,
    r_276_294 * 2 = r_276_293,
    s_276_294 * 2 = s_276_293
&&
    true
;

{
    u_276_294 * f_236_low60_40_low20_0 + v_276_294 * g_236_low60_40_low20_0 = f_236_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_294 * f_236_low60_40_low20_0 + s_276_294 * g_236_low60_40_low20_0 = g_236_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_18 + u_276_294 * (const 64 (2**21)) + v_276_294 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_18 + r_276_294 * (const 64 (2**21)) + s_276_294 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_18,
    f_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_18,
    g_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 294)) <=s delta, delta <=s (const 64 (1 + 2*294)),
    (const 64 (-(2**20))) <=s u_276_294, u_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_294, v_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_294, r_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_294, s_276_294 <=s (const 64 ((2**20)-1)),
    u_276_294 + v_276_294 <=s (const 64 (2**20)),
    u_276_294 - v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 + v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 - v_276_294 <=s (const 64 (2**20)),
    r_276_294 + s_276_294 <=s (const 64 (2**20)),
    r_276_294 - s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 + s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 - s_276_294 <=s (const 64 (2**20)),
    u_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_276_294 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_293_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_17,
sint64 g_236_low60_40_low20_17,
sint64 f_236_low60_40_low20_18,
sint64 g_236_low60_40_low20_18,
sint64 u_276_293,
sint64 v_276_293,
sint64 r_276_293,
sint64 s_276_293,
sint64 u_276_294,
sint64 v_276_294,
sint64 r_276_294,
sint64 s_276_294,
bit ne
)={
    u_276_293 * f_236_low60_40_low20_0 + v_276_293 * g_236_low60_40_low20_0 = f_236_low60_40_low20_17 * (-(2**20)),
    r_276_293 * f_236_low60_40_low20_0 + s_276_293 * g_236_low60_40_low20_0 = g_236_low60_40_low20_17 * (-(2**20))
&&
    u_276_293 * f_236_low60_40_low20_0 + v_276_293 * g_236_low60_40_low20_0 = f_236_low60_40_low20_17 * (const 64 (-(2**20))),
    r_276_293 * f_236_low60_40_low20_0 + s_276_293 * g_236_low60_40_low20_0 = g_236_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_17 + u_276_293 * (const 64 (2**21)) + v_276_293 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_17 + r_276_293 * (const 64 (2**21)) + s_276_293 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_17,
    f_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_17,
    g_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 293)) <=s delta, delta <=s (const 64 (1 + 2*293)),
    (const 64 (-(2**20))) <=s u_276_293, u_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_293, v_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_293, r_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_293, s_276_293 <=s (const 64 ((2**20)-1)),
    u_276_293 + v_276_293 <=s (const 64 (2**20)),
    u_276_293 - v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 + v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 - v_276_293 <=s (const 64 (2**20)),
    r_276_293 + s_276_293 <=s (const 64 (2**20)),
    r_276_293 - s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 + s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 - s_276_293 <=s (const 64 (2**20)),
    u_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_276_293 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step293

// premise b
assume
g_236_low60_40_low20_17 = 1 (mod 2)
&&
g_236_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_18 f_236_low60_40_low20_17;
mov u_276_294 u_276_293;
mov v_276_294 v_276_293;

add g_236_low60_40_low20_18 g_236_low60_40_low20_17 f_236_low60_40_low20_17;
asr g_236_low60_40_low20_18 g_236_low60_40_low20_18 1;
add r_276_294 r_276_293 u_276_293;
asr r_276_294 r_276_294 1;
add s_276_294 s_276_293 v_276_293;
asr s_276_294 s_276_294 1;
assert
    true
&&
    f_236_low60_40_low20_18 = f_236_low60_40_low20_17,
    u_276_294 = u_276_293,
    v_276_294 = v_276_293,
    g_236_low60_40_low20_18 * (const 64 2) = g_236_low60_40_low20_17 + f_236_low60_40_low20_17,
    r_276_294 * (const 64 2) = r_276_293 + u_276_293,
    s_276_294 * (const 64 2) = s_276_293 + v_276_293
;

assume
    f_236_low60_40_low20_18 = f_236_low60_40_low20_17,
    u_276_294 = u_276_293,
    v_276_294 = v_276_293,
    g_236_low60_40_low20_18 * 2 = g_236_low60_40_low20_17 + f_236_low60_40_low20_17,
    r_276_294 * 2 = r_276_293 + u_276_293,
    s_276_294 * 2 = s_276_293 + v_276_293
&&
    true
;

{
    u_276_294 * f_236_low60_40_low20_0 + v_276_294 * g_236_low60_40_low20_0 = f_236_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_294 * f_236_low60_40_low20_0 + s_276_294 * g_236_low60_40_low20_0 = g_236_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_18 + u_276_294 * (const 64 (2**21)) + v_276_294 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_18 + r_276_294 * (const 64 (2**21)) + s_276_294 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_18,
    f_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_18,
    g_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 294)) <=s delta, delta <=s (const 64 (1 + 2*294)),
    (const 64 (-(2**20))) <=s u_276_294, u_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_294, v_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_294, r_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_294, s_276_294 <=s (const 64 ((2**20)-1)),
    u_276_294 + v_276_294 <=s (const 64 (2**20)),
    u_276_294 - v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 + v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 - v_276_294 <=s (const 64 (2**20)),
    r_276_294 + s_276_294 <=s (const 64 (2**20)),
    r_276_294 - s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 + s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 - s_276_294 <=s (const 64 (2**20)),
    u_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_276_294 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_293_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_17,
sint64 g_236_low60_40_low20_17,
sint64 f_236_low60_40_low20_18,
sint64 g_236_low60_40_low20_18,
sint64 u_276_293,
sint64 v_276_293,
sint64 r_276_293,
sint64 s_276_293,
sint64 u_276_294,
sint64 v_276_294,
sint64 r_276_294,
sint64 s_276_294,
bit ne
)={
    u_276_293 * f_236_low60_40_low20_0 + v_276_293 * g_236_low60_40_low20_0 = f_236_low60_40_low20_17 * (-(2**20)),
    r_276_293 * f_236_low60_40_low20_0 + s_276_293 * g_236_low60_40_low20_0 = g_236_low60_40_low20_17 * (-(2**20))
&&
    u_276_293 * f_236_low60_40_low20_0 + v_276_293 * g_236_low60_40_low20_0 = f_236_low60_40_low20_17 * (const 64 (-(2**20))),
    r_276_293 * f_236_low60_40_low20_0 + s_276_293 * g_236_low60_40_low20_0 = g_236_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_17 + u_276_293 * (const 64 (2**21)) + v_276_293 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_17 + r_276_293 * (const 64 (2**21)) + s_276_293 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_17,
    f_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_17,
    g_236_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 293)) <=s delta, delta <=s (const 64 (1 + 2*293)),
    (const 64 (-(2**20))) <=s u_276_293, u_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_293, v_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_293, r_276_293 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_293, s_276_293 <=s (const 64 ((2**20)-1)),
    u_276_293 + v_276_293 <=s (const 64 (2**20)),
    u_276_293 - v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 + v_276_293 <=s (const 64 (2**20)),
    (const 64 0) - u_276_293 - v_276_293 <=s (const 64 (2**20)),
    r_276_293 + s_276_293 <=s (const 64 (2**20)),
    r_276_293 - s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 + s_276_293 <=s (const 64 (2**20)),
    (const 64 0) - r_276_293 - s_276_293 <=s (const 64 (2**20)),
    u_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_276_293 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_276_293 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step293

// premise c
assume
g_236_low60_40_low20_17 = 1 (mod 2)
&&
g_236_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_18 g_236_low60_40_low20_17;
mov u_276_294 r_276_293;
mov v_276_294 s_276_293;

subs dc g_236_low60_40_low20_18 g_236_low60_40_low20_17 f_236_low60_40_low20_17;
asr g_236_low60_40_low20_18 g_236_low60_40_low20_18 1;
subs dc r_276_294 r_276_293 u_276_293;
asr r_276_294 r_276_294 1;
subs dc s_276_294 s_276_293 v_276_293;
asr s_276_294 s_276_294 1;
assert
    true
&&
    f_236_low60_40_low20_18 = g_236_low60_40_low20_17,
    u_276_294 = r_276_293,
    v_276_294 = s_276_293,
    g_236_low60_40_low20_18 * (const 64 2) = g_236_low60_40_low20_17 - f_236_low60_40_low20_17,
    r_276_294 * (const 64 2) = r_276_293 - u_276_293,
    s_276_294 * (const 64 2) = s_276_293 - v_276_293
;

assume
    f_236_low60_40_low20_18 = g_236_low60_40_low20_17,
    u_276_294 = r_276_293,
    v_276_294 = s_276_293,
    g_236_low60_40_low20_18 * 2 = g_236_low60_40_low20_17 - f_236_low60_40_low20_17,
    r_276_294 * 2 = r_276_293 - u_276_293,
    s_276_294 * 2 = s_276_293 - v_276_293
&&
    true
;

{
    u_276_294 * f_236_low60_40_low20_0 + v_276_294 * g_236_low60_40_low20_0 = f_236_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_294 * f_236_low60_40_low20_0 + s_276_294 * g_236_low60_40_low20_0 = g_236_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_18 + u_276_294 * (const 64 (2**21)) + v_276_294 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_18 + r_276_294 * (const 64 (2**21)) + s_276_294 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_18,
    f_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_18,
    g_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 294)) <=s delta, delta <=s (const 64 (1 + 2*294)),
    (const 64 (-(2**20))) <=s u_276_294, u_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_294, v_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_294, r_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_294, s_276_294 <=s (const 64 ((2**20)-1)),
    u_276_294 + v_276_294 <=s (const 64 (2**20)),
    u_276_294 - v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 + v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 - v_276_294 <=s (const 64 (2**20)),
    r_276_294 + s_276_294 <=s (const 64 (2**20)),
    r_276_294 - s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 + s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 - s_276_294 <=s (const 64 (2**20)),
    u_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_276_294 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_294_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_18,
sint64 g_236_low60_40_low20_18,
sint64 f_236_low60_40_low20_19,
sint64 g_236_low60_40_low20_19,
sint64 u_276_294,
sint64 v_276_294,
sint64 r_276_294,
sint64 s_276_294,
sint64 u_276_295,
sint64 v_276_295,
sint64 r_276_295,
sint64 s_276_295,
bit ne
)={
    u_276_294 * f_236_low60_40_low20_0 + v_276_294 * g_236_low60_40_low20_0 = f_236_low60_40_low20_18 * (-(2**20)),
    r_276_294 * f_236_low60_40_low20_0 + s_276_294 * g_236_low60_40_low20_0 = g_236_low60_40_low20_18 * (-(2**20))
&&
    u_276_294 * f_236_low60_40_low20_0 + v_276_294 * g_236_low60_40_low20_0 = f_236_low60_40_low20_18 * (const 64 (-(2**20))),
    r_276_294 * f_236_low60_40_low20_0 + s_276_294 * g_236_low60_40_low20_0 = g_236_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_18 + u_276_294 * (const 64 (2**21)) + v_276_294 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_18 + r_276_294 * (const 64 (2**21)) + s_276_294 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_18,
    f_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_18,
    g_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 294)) <=s delta, delta <=s (const 64 (1 + 2*294)),
    (const 64 (-(2**20))) <=s u_276_294, u_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_294, v_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_294, r_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_294, s_276_294 <=s (const 64 ((2**20)-1)),
    u_276_294 + v_276_294 <=s (const 64 (2**20)),
    u_276_294 - v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 + v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 - v_276_294 <=s (const 64 (2**20)),
    r_276_294 + s_276_294 <=s (const 64 (2**20)),
    r_276_294 - s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 + s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 - s_276_294 <=s (const 64 (2**20)),
    u_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_276_294 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step294

// premise a
assume
g_236_low60_40_low20_18 = 0 (mod 2)
&&
g_236_low60_40_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov f_236_low60_40_low20_19 f_236_low60_40_low20_18;
mov u_276_295 u_276_294;
mov v_276_295 v_276_294;

asr g_236_low60_40_low20_19 g_236_low60_40_low20_18 1;
asr r_276_295 r_276_294 1;
asr s_276_295 s_276_294 1;
assert
    true
&&
    f_236_low60_40_low20_19 = f_236_low60_40_low20_18,
    u_276_295 = u_276_294,
    v_276_295 = v_276_294,
    g_236_low60_40_low20_19 * (const 64 2) = g_236_low60_40_low20_18,
    r_276_295 * (const 64 2) = r_276_294,
    s_276_295 * (const 64 2) = s_276_294
;

assume
    f_236_low60_40_low20_19 = f_236_low60_40_low20_18,
    u_276_295 = u_276_294,
    v_276_295 = v_276_294,
    g_236_low60_40_low20_19 * 2 = g_236_low60_40_low20_18,
    r_276_295 * 2 = r_276_294,
    s_276_295 * 2 = s_276_294
&&
    true
;

{
    u_276_295 * f_236_low60_40_low20_0 + v_276_295 * g_236_low60_40_low20_0 = f_236_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_295 * f_236_low60_40_low20_0 + s_276_295 * g_236_low60_40_low20_0 = g_236_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_19 + u_276_295 * (const 64 (2**21)) + v_276_295 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_19 + r_276_295 * (const 64 (2**21)) + s_276_295 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_19,
    f_236_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_19,
    g_236_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 295)) <=s delta, delta <=s (const 64 (1 + 2*295)),
    (const 64 (-(2**20))) <=s u_276_295, u_276_295 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_295, v_276_295 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_295, r_276_295 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_295, s_276_295 <=s (const 64 ((2**20)-1)),
    u_276_295 + v_276_295 <=s (const 64 (2**20)),
    u_276_295 - v_276_295 <=s (const 64 (2**20)),
    (const 64 0) - u_276_295 + v_276_295 <=s (const 64 (2**20)),
    (const 64 0) - u_276_295 - v_276_295 <=s (const 64 (2**20)),
    r_276_295 + s_276_295 <=s (const 64 (2**20)),
    r_276_295 - s_276_295 <=s (const 64 (2**20)),
    (const 64 0) - r_276_295 + s_276_295 <=s (const 64 (2**20)),
    (const 64 0) - r_276_295 - s_276_295 <=s (const 64 (2**20)),
    u_276_295 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_276_295 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_276_295 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_276_295 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_294_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_18,
sint64 g_236_low60_40_low20_18,
sint64 f_236_low60_40_low20_19,
sint64 g_236_low60_40_low20_19,
sint64 u_276_294,
sint64 v_276_294,
sint64 r_276_294,
sint64 s_276_294,
sint64 u_276_295,
sint64 v_276_295,
sint64 r_276_295,
sint64 s_276_295,
bit ne
)={
    u_276_294 * f_236_low60_40_low20_0 + v_276_294 * g_236_low60_40_low20_0 = f_236_low60_40_low20_18 * (-(2**20)),
    r_276_294 * f_236_low60_40_low20_0 + s_276_294 * g_236_low60_40_low20_0 = g_236_low60_40_low20_18 * (-(2**20))
&&
    u_276_294 * f_236_low60_40_low20_0 + v_276_294 * g_236_low60_40_low20_0 = f_236_low60_40_low20_18 * (const 64 (-(2**20))),
    r_276_294 * f_236_low60_40_low20_0 + s_276_294 * g_236_low60_40_low20_0 = g_236_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_18 + u_276_294 * (const 64 (2**21)) + v_276_294 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_18 + r_276_294 * (const 64 (2**21)) + s_276_294 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_18,
    f_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_18,
    g_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 294)) <=s delta, delta <=s (const 64 (1 + 2*294)),
    (const 64 (-(2**20))) <=s u_276_294, u_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_294, v_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_294, r_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_294, s_276_294 <=s (const 64 ((2**20)-1)),
    u_276_294 + v_276_294 <=s (const 64 (2**20)),
    u_276_294 - v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 + v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 - v_276_294 <=s (const 64 (2**20)),
    r_276_294 + s_276_294 <=s (const 64 (2**20)),
    r_276_294 - s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 + s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 - s_276_294 <=s (const 64 (2**20)),
    u_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_276_294 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step294

// premise b
assume
g_236_low60_40_low20_18 = 1 (mod 2)
&&
g_236_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_19 f_236_low60_40_low20_18;
mov u_276_295 u_276_294;
mov v_276_295 v_276_294;

add g_236_low60_40_low20_19 g_236_low60_40_low20_18 f_236_low60_40_low20_18;
asr g_236_low60_40_low20_19 g_236_low60_40_low20_19 1;
add r_276_295 r_276_294 u_276_294;
asr r_276_295 r_276_295 1;
add s_276_295 s_276_294 v_276_294;
asr s_276_295 s_276_295 1;
assert
    true
&&
    f_236_low60_40_low20_19 = f_236_low60_40_low20_18,
    u_276_295 = u_276_294,
    v_276_295 = v_276_294,
    g_236_low60_40_low20_19 * (const 64 2) = g_236_low60_40_low20_18 + f_236_low60_40_low20_18,
    r_276_295 * (const 64 2) = r_276_294 + u_276_294,
    s_276_295 * (const 64 2) = s_276_294 + v_276_294
;

assume
    f_236_low60_40_low20_19 = f_236_low60_40_low20_18,
    u_276_295 = u_276_294,
    v_276_295 = v_276_294,
    g_236_low60_40_low20_19 * 2 = g_236_low60_40_low20_18 + f_236_low60_40_low20_18,
    r_276_295 * 2 = r_276_294 + u_276_294,
    s_276_295 * 2 = s_276_294 + v_276_294
&&
    true
;

{
    u_276_295 * f_236_low60_40_low20_0 + v_276_295 * g_236_low60_40_low20_0 = f_236_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_295 * f_236_low60_40_low20_0 + s_276_295 * g_236_low60_40_low20_0 = g_236_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_19 + u_276_295 * (const 64 (2**21)) + v_276_295 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_19 + r_276_295 * (const 64 (2**21)) + s_276_295 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_19,
    f_236_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_19,
    g_236_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 295)) <=s delta, delta <=s (const 64 (1 + 2*295)),
    (const 64 (-(2**20))) <=s u_276_295, u_276_295 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_295, v_276_295 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_295, r_276_295 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_295, s_276_295 <=s (const 64 ((2**20)-1)),
    u_276_295 + v_276_295 <=s (const 64 (2**20)),
    u_276_295 - v_276_295 <=s (const 64 (2**20)),
    (const 64 0) - u_276_295 + v_276_295 <=s (const 64 (2**20)),
    (const 64 0) - u_276_295 - v_276_295 <=s (const 64 (2**20)),
    r_276_295 + s_276_295 <=s (const 64 (2**20)),
    r_276_295 - s_276_295 <=s (const 64 (2**20)),
    (const 64 0) - r_276_295 + s_276_295 <=s (const 64 (2**20)),
    (const 64 0) - r_276_295 - s_276_295 <=s (const 64 (2**20)),
    u_276_295 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_276_295 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_276_295 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_276_295 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_294_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_40_low20_0,
sint64 g_236_low60_40_low20_0,
sint64 f_236_low60_40_low20_18,
sint64 g_236_low60_40_low20_18,
sint64 f_236_low60_40_low20_19,
sint64 g_236_low60_40_low20_19,
sint64 u_276_294,
sint64 v_276_294,
sint64 r_276_294,
sint64 s_276_294,
sint64 u_276_295,
sint64 v_276_295,
sint64 r_276_295,
sint64 s_276_295,
bit ne
)={
    u_276_294 * f_236_low60_40_low20_0 + v_276_294 * g_236_low60_40_low20_0 = f_236_low60_40_low20_18 * (-(2**20)),
    r_276_294 * f_236_low60_40_low20_0 + s_276_294 * g_236_low60_40_low20_0 = g_236_low60_40_low20_18 * (-(2**20))
&&
    u_276_294 * f_236_low60_40_low20_0 + v_276_294 * g_236_low60_40_low20_0 = f_236_low60_40_low20_18 * (const 64 (-(2**20))),
    r_276_294 * f_236_low60_40_low20_0 + s_276_294 * g_236_low60_40_low20_0 = g_236_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_236_low60_40_low20_18 + u_276_294 * (const 64 (2**21)) + v_276_294 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_18 + r_276_294 * (const 64 (2**21)) + s_276_294 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_40_low20_0,
    f_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_0,
    g_236_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_40_low20_18,
    f_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_40_low20_18,
    g_236_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 294)) <=s delta, delta <=s (const 64 (1 + 2*294)),
    (const 64 (-(2**20))) <=s u_276_294, u_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_294, v_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_294, r_276_294 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_294, s_276_294 <=s (const 64 ((2**20)-1)),
    u_276_294 + v_276_294 <=s (const 64 (2**20)),
    u_276_294 - v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 + v_276_294 <=s (const 64 (2**20)),
    (const 64 0) - u_276_294 - v_276_294 <=s (const 64 (2**20)),
    r_276_294 + s_276_294 <=s (const 64 (2**20)),
    r_276_294 - s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 + s_276_294 <=s (const 64 (2**20)),
    (const 64 0) - r_276_294 - s_276_294 <=s (const 64 (2**20)),
    u_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_276_294 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_276_294 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step294

// premise c
assume
g_236_low60_40_low20_18 = 1 (mod 2)
&&
g_236_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_40_low20_19 g_236_low60_40_low20_18;
mov u_276_295 r_276_294;
mov v_276_295 s_276_294;

subs dc g_236_low60_40_low20_19 g_236_low60_40_low20_18 f_236_low60_40_low20_18;
asr g_236_low60_40_low20_19 g_236_low60_40_low20_19 1;
subs dc r_276_295 r_276_294 u_276_294;
asr r_276_295 r_276_295 1;
subs dc s_276_295 s_276_294 v_276_294;
asr s_276_295 s_276_295 1;
assert
    true
&&
    f_236_low60_40_low20_19 = g_236_low60_40_low20_18,
    u_276_295 = r_276_294,
    v_276_295 = s_276_294,
    g_236_low60_40_low20_19 * (const 64 2) = g_236_low60_40_low20_18 - f_236_low60_40_low20_18,
    r_276_295 * (const 64 2) = r_276_294 - u_276_294,
    s_276_295 * (const 64 2) = s_276_294 - v_276_294
;

assume
    f_236_low60_40_low20_19 = g_236_low60_40_low20_18,
    u_276_295 = r_276_294,
    v_276_295 = s_276_294,
    g_236_low60_40_low20_19 * 2 = g_236_low60_40_low20_18 - f_236_low60_40_low20_18,
    r_276_295 * 2 = r_276_294 - u_276_294,
    s_276_295 * 2 = s_276_294 - v_276_294
&&
    true
;

{
    u_276_295 * f_236_low60_40_low20_0 + v_276_295 * g_236_low60_40_low20_0 = f_236_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_276_295 * f_236_low60_40_low20_0 + s_276_295 * g_236_low60_40_low20_0 = g_236_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_40_low20_19 + u_276_295 * (const 64 (2**21)) + v_276_295 * (const 64 (2**42)),
    grs = g_236_low60_40_low20_19 + r_276_295 * (const 64 (2**21)) + s_276_295 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_40_low20_19,
    f_236_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_40_low20_19,
    g_236_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 295)) <=s delta, delta <=s (const 64 (1 + 2*295)),
    (const 64 (-(2**20))) <=s u_276_295, u_276_295 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_276_295, v_276_295 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_276_295, r_276_295 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_276_295, s_276_295 <=s (const 64 ((2**20)-1)),
    u_276_295 + v_276_295 <=s (const 64 (2**20)),
    u_276_295 - v_276_295 <=s (const 64 (2**20)),
    (const 64 0) - u_276_295 + v_276_295 <=s (const 64 (2**20)),
    (const 64 0) - u_276_295 - v_276_295 <=s (const 64 (2**20)),
    r_276_295 + s_276_295 <=s (const 64 (2**20)),
    r_276_295 - s_276_295 <=s (const 64 (2**20)),
    (const 64 0) - r_276_295 + s_276_295 <=s (const 64 (2**20)),
    (const 64 0) - r_276_295 - s_276_295 <=s (const 64 (2**20)),
    u_276_295 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_276_295 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_276_295 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_276_295 = (const 64 0) (mod (const 64 (2**(20-19))))
}

