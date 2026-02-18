proc divstep_079_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_1,
sint64 g_59_low60_20_low20_1,
sint64 u_79_79,
sint64 v_79_79,
sint64 r_79_79,
sint64 s_79_79,
sint64 u_79_80,
sint64 v_79_80,
sint64 r_79_80,
sint64 s_79_80,
bit ne
)={
    u_79_79 * f_59_low60_20_low20_0 + v_79_79 * g_59_low60_20_low20_0 = f_59_low60_20_low20_0 * (-(2**20)),
    r_79_79 * f_59_low60_20_low20_0 + s_79_79 * g_59_low60_20_low20_0 = g_59_low60_20_low20_0 * (-(2**20))
&&
    u_79_79 * f_59_low60_20_low20_0 + v_79_79 * g_59_low60_20_low20_0 = f_59_low60_20_low20_0 * (const 64 (-(2**20))),
    r_79_79 * f_59_low60_20_low20_0 + s_79_79 * g_59_low60_20_low20_0 = g_59_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_0 + u_79_79 * (const 64 (2**21)) + v_79_79 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_0 + r_79_79 * (const 64 (2**21)) + s_79_79 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 79)) <=s delta, delta <=s (const 64 (1 + 2*79)),
    u_79_79 = (const 64 (-(2**20))),
    v_79_79 = (const 64 (0)),
    r_79_79 = (const 64 (0)),
    s_79_79 = (const 64 (-(2**20)))
}



// divsteps
// step79

// premise a
assume
g_59_low60_20_low20_0 = 0 (mod 2)
&&
g_59_low60_20_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_59_low60_20_low20_1 f_59_low60_20_low20_0;
mov u_79_80 u_79_79;
mov v_79_80 v_79_79;

asr g_59_low60_20_low20_1 g_59_low60_20_low20_0 1;
asr r_79_80 r_79_79 1;
asr s_79_80 s_79_79 1;
assert
    true
&&
    f_59_low60_20_low20_1 = f_59_low60_20_low20_0,
    u_79_80 = u_79_79,
    v_79_80 = v_79_79,
    g_59_low60_20_low20_1 * (const 64 2) = g_59_low60_20_low20_0,
    r_79_80 * (const 64 2) = r_79_79,
    s_79_80 * (const 64 2) = s_79_79
;

assume
    f_59_low60_20_low20_1 = f_59_low60_20_low20_0,
    u_79_80 = u_79_79,
    v_79_80 = v_79_79,
    g_59_low60_20_low20_1 * 2 = g_59_low60_20_low20_0,
    r_79_80 * 2 = r_79_79,
    s_79_80 * 2 = s_79_79
&&
    true
;

{
    u_79_80 * f_59_low60_20_low20_0 + v_79_80 * g_59_low60_20_low20_0 = f_59_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_80 * f_59_low60_20_low20_0 + s_79_80 * g_59_low60_20_low20_0 = g_59_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_1 + u_79_80 * (const 64 (2**21)) + v_79_80 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_1 + r_79_80 * (const 64 (2**21)) + s_79_80 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_1,
    f_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_1,
    g_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 80)) <=s delta, delta <=s (const 64 (1 + 2*80)),
    (const 64 (-(2**20))) <=s u_79_80, u_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_80, v_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_80, r_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_80, s_79_80 <=s (const 64 ((2**20)-1)),
    u_79_80 + v_79_80 <=s (const 64 (2**20)),
    u_79_80 - v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 + v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 - v_79_80 <=s (const 64 (2**20)),
    r_79_80 + s_79_80 <=s (const 64 (2**20)),
    r_79_80 - s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 + s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 - s_79_80 <=s (const 64 (2**20)),
    u_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_79_80 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_079_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_1,
sint64 g_59_low60_20_low20_1,
sint64 u_79_79,
sint64 v_79_79,
sint64 r_79_79,
sint64 s_79_79,
sint64 u_79_80,
sint64 v_79_80,
sint64 r_79_80,
sint64 s_79_80,
bit ne
)={
    u_79_79 * f_59_low60_20_low20_0 + v_79_79 * g_59_low60_20_low20_0 = f_59_low60_20_low20_0 * (-(2**20)),
    r_79_79 * f_59_low60_20_low20_0 + s_79_79 * g_59_low60_20_low20_0 = g_59_low60_20_low20_0 * (-(2**20))
&&
    u_79_79 * f_59_low60_20_low20_0 + v_79_79 * g_59_low60_20_low20_0 = f_59_low60_20_low20_0 * (const 64 (-(2**20))),
    r_79_79 * f_59_low60_20_low20_0 + s_79_79 * g_59_low60_20_low20_0 = g_59_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_0 + u_79_79 * (const 64 (2**21)) + v_79_79 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_0 + r_79_79 * (const 64 (2**21)) + s_79_79 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 79)) <=s delta, delta <=s (const 64 (1 + 2*79)),
    u_79_79 = (const 64 (-(2**20))),
    v_79_79 = (const 64 (0)),
    r_79_79 = (const 64 (0)),
    s_79_79 = (const 64 (-(2**20)))
}



// divsteps
// step79

// premise b
assume
g_59_low60_20_low20_0 = 1 (mod 2)
&&
g_59_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_1 f_59_low60_20_low20_0;
mov u_79_80 u_79_79;
mov v_79_80 v_79_79;

add g_59_low60_20_low20_1 g_59_low60_20_low20_0 f_59_low60_20_low20_0;
asr g_59_low60_20_low20_1 g_59_low60_20_low20_1 1;
add r_79_80 r_79_79 u_79_79;
asr r_79_80 r_79_80 1;
add s_79_80 s_79_79 v_79_79;
asr s_79_80 s_79_80 1;
assert
    true
&&
    f_59_low60_20_low20_1 = f_59_low60_20_low20_0,
    u_79_80 = u_79_79,
    v_79_80 = v_79_79,
    g_59_low60_20_low20_1 * (const 64 2) = g_59_low60_20_low20_0 + f_59_low60_20_low20_0,
    r_79_80 * (const 64 2) = r_79_79 + u_79_79,
    s_79_80 * (const 64 2) = s_79_79 + v_79_79
;

assume
    f_59_low60_20_low20_1 = f_59_low60_20_low20_0,
    u_79_80 = u_79_79,
    v_79_80 = v_79_79,
    g_59_low60_20_low20_1 * 2 = g_59_low60_20_low20_0 + f_59_low60_20_low20_0,
    r_79_80 * 2 = r_79_79 + u_79_79,
    s_79_80 * 2 = s_79_79 + v_79_79
&&
    true
;

{
    u_79_80 * f_59_low60_20_low20_0 + v_79_80 * g_59_low60_20_low20_0 = f_59_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_80 * f_59_low60_20_low20_0 + s_79_80 * g_59_low60_20_low20_0 = g_59_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_1 + u_79_80 * (const 64 (2**21)) + v_79_80 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_1 + r_79_80 * (const 64 (2**21)) + s_79_80 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_1,
    f_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_1,
    g_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 80)) <=s delta, delta <=s (const 64 (1 + 2*80)),
    (const 64 (-(2**20))) <=s u_79_80, u_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_80, v_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_80, r_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_80, s_79_80 <=s (const 64 ((2**20)-1)),
    u_79_80 + v_79_80 <=s (const 64 (2**20)),
    u_79_80 - v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 + v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 - v_79_80 <=s (const 64 (2**20)),
    r_79_80 + s_79_80 <=s (const 64 (2**20)),
    r_79_80 - s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 + s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 - s_79_80 <=s (const 64 (2**20)),
    u_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_79_80 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_079_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_1,
sint64 g_59_low60_20_low20_1,
sint64 u_79_79,
sint64 v_79_79,
sint64 r_79_79,
sint64 s_79_79,
sint64 u_79_80,
sint64 v_79_80,
sint64 r_79_80,
sint64 s_79_80,
bit ne
)={
    u_79_79 * f_59_low60_20_low20_0 + v_79_79 * g_59_low60_20_low20_0 = f_59_low60_20_low20_0 * (-(2**20)),
    r_79_79 * f_59_low60_20_low20_0 + s_79_79 * g_59_low60_20_low20_0 = g_59_low60_20_low20_0 * (-(2**20))
&&
    u_79_79 * f_59_low60_20_low20_0 + v_79_79 * g_59_low60_20_low20_0 = f_59_low60_20_low20_0 * (const 64 (-(2**20))),
    r_79_79 * f_59_low60_20_low20_0 + s_79_79 * g_59_low60_20_low20_0 = g_59_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_0 + u_79_79 * (const 64 (2**21)) + v_79_79 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_0 + r_79_79 * (const 64 (2**21)) + s_79_79 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 79)) <=s delta, delta <=s (const 64 (1 + 2*79)),
    u_79_79 = (const 64 (-(2**20))),
    v_79_79 = (const 64 (0)),
    r_79_79 = (const 64 (0)),
    s_79_79 = (const 64 (-(2**20)))
}



// divsteps
// step79

// premise c
assume
g_59_low60_20_low20_0 = 1 (mod 2)
&&
g_59_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_1 g_59_low60_20_low20_0;
mov u_79_80 r_79_79;
mov v_79_80 s_79_79;

subs dc g_59_low60_20_low20_1 g_59_low60_20_low20_0 f_59_low60_20_low20_0;
asr g_59_low60_20_low20_1 g_59_low60_20_low20_1 1;
subs dc r_79_80 r_79_79 u_79_79;
asr r_79_80 r_79_80 1;
subs dc s_79_80 s_79_79 v_79_79;
asr s_79_80 s_79_80 1;
assert
    true
&&
    f_59_low60_20_low20_1 = g_59_low60_20_low20_0,
    u_79_80 = r_79_79,
    v_79_80 = s_79_79,
    g_59_low60_20_low20_1 * (const 64 2) = g_59_low60_20_low20_0 - f_59_low60_20_low20_0,
    r_79_80 * (const 64 2) = r_79_79 - u_79_79,
    s_79_80 * (const 64 2) = s_79_79 - v_79_79
;

assume
    f_59_low60_20_low20_1 = g_59_low60_20_low20_0,
    u_79_80 = r_79_79,
    v_79_80 = s_79_79,
    g_59_low60_20_low20_1 * 2 = g_59_low60_20_low20_0 - f_59_low60_20_low20_0,
    r_79_80 * 2 = r_79_79 - u_79_79,
    s_79_80 * 2 = s_79_79 - v_79_79
&&
    true
;

{
    u_79_80 * f_59_low60_20_low20_0 + v_79_80 * g_59_low60_20_low20_0 = f_59_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_80 * f_59_low60_20_low20_0 + s_79_80 * g_59_low60_20_low20_0 = g_59_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_1 + u_79_80 * (const 64 (2**21)) + v_79_80 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_1 + r_79_80 * (const 64 (2**21)) + s_79_80 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_1,
    f_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_1,
    g_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 80)) <=s delta, delta <=s (const 64 (1 + 2*80)),
    (const 64 (-(2**20))) <=s u_79_80, u_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_80, v_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_80, r_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_80, s_79_80 <=s (const 64 ((2**20)-1)),
    u_79_80 + v_79_80 <=s (const 64 (2**20)),
    u_79_80 - v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 + v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 - v_79_80 <=s (const 64 (2**20)),
    r_79_80 + s_79_80 <=s (const 64 (2**20)),
    r_79_80 - s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 + s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 - s_79_80 <=s (const 64 (2**20)),
    u_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_79_80 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_080_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_1,
sint64 g_59_low60_20_low20_1,
sint64 f_59_low60_20_low20_2,
sint64 g_59_low60_20_low20_2,
sint64 u_79_80,
sint64 v_79_80,
sint64 r_79_80,
sint64 s_79_80,
sint64 u_79_81,
sint64 v_79_81,
sint64 r_79_81,
sint64 s_79_81,
bit ne
)={
    u_79_80 * f_59_low60_20_low20_0 + v_79_80 * g_59_low60_20_low20_0 = f_59_low60_20_low20_1 * (-(2**20)),
    r_79_80 * f_59_low60_20_low20_0 + s_79_80 * g_59_low60_20_low20_0 = g_59_low60_20_low20_1 * (-(2**20))
&&
    u_79_80 * f_59_low60_20_low20_0 + v_79_80 * g_59_low60_20_low20_0 = f_59_low60_20_low20_1 * (const 64 (-(2**20))),
    r_79_80 * f_59_low60_20_low20_0 + s_79_80 * g_59_low60_20_low20_0 = g_59_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_1 + u_79_80 * (const 64 (2**21)) + v_79_80 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_1 + r_79_80 * (const 64 (2**21)) + s_79_80 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_1,
    f_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_1,
    g_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 80)) <=s delta, delta <=s (const 64 (1 + 2*80)),
    (const 64 (-(2**20))) <=s u_79_80, u_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_80, v_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_80, r_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_80, s_79_80 <=s (const 64 ((2**20)-1)),
    u_79_80 + v_79_80 <=s (const 64 (2**20)),
    u_79_80 - v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 + v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 - v_79_80 <=s (const 64 (2**20)),
    r_79_80 + s_79_80 <=s (const 64 (2**20)),
    r_79_80 - s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 + s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 - s_79_80 <=s (const 64 (2**20)),
    u_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_79_80 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step80

// premise a
assume
g_59_low60_20_low20_1 = 0 (mod 2)
&&
g_59_low60_20_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_2 f_59_low60_20_low20_1;
mov u_79_81 u_79_80;
mov v_79_81 v_79_80;

asr g_59_low60_20_low20_2 g_59_low60_20_low20_1 1;
asr r_79_81 r_79_80 1;
asr s_79_81 s_79_80 1;
assert
    true
&&
    f_59_low60_20_low20_2 = f_59_low60_20_low20_1,
    u_79_81 = u_79_80,
    v_79_81 = v_79_80,
    g_59_low60_20_low20_2 * (const 64 2) = g_59_low60_20_low20_1,
    r_79_81 * (const 64 2) = r_79_80,
    s_79_81 * (const 64 2) = s_79_80
;

assume
    f_59_low60_20_low20_2 = f_59_low60_20_low20_1,
    u_79_81 = u_79_80,
    v_79_81 = v_79_80,
    g_59_low60_20_low20_2 * 2 = g_59_low60_20_low20_1,
    r_79_81 * 2 = r_79_80,
    s_79_81 * 2 = s_79_80
&&
    true
;

{
    u_79_81 * f_59_low60_20_low20_0 + v_79_81 * g_59_low60_20_low20_0 = f_59_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_81 * f_59_low60_20_low20_0 + s_79_81 * g_59_low60_20_low20_0 = g_59_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_2 + u_79_81 * (const 64 (2**21)) + v_79_81 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_2 + r_79_81 * (const 64 (2**21)) + s_79_81 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_2,
    f_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_2,
    g_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 81)) <=s delta, delta <=s (const 64 (1 + 2*81)),
    (const 64 (-(2**20))) <=s u_79_81, u_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_81, v_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_81, r_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_81, s_79_81 <=s (const 64 ((2**20)-1)),
    u_79_81 + v_79_81 <=s (const 64 (2**20)),
    u_79_81 - v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 + v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 - v_79_81 <=s (const 64 (2**20)),
    r_79_81 + s_79_81 <=s (const 64 (2**20)),
    r_79_81 - s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 + s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 - s_79_81 <=s (const 64 (2**20)),
    u_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_79_81 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_080_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_1,
sint64 g_59_low60_20_low20_1,
sint64 f_59_low60_20_low20_2,
sint64 g_59_low60_20_low20_2,
sint64 u_79_80,
sint64 v_79_80,
sint64 r_79_80,
sint64 s_79_80,
sint64 u_79_81,
sint64 v_79_81,
sint64 r_79_81,
sint64 s_79_81,
bit ne
)={
    u_79_80 * f_59_low60_20_low20_0 + v_79_80 * g_59_low60_20_low20_0 = f_59_low60_20_low20_1 * (-(2**20)),
    r_79_80 * f_59_low60_20_low20_0 + s_79_80 * g_59_low60_20_low20_0 = g_59_low60_20_low20_1 * (-(2**20))
&&
    u_79_80 * f_59_low60_20_low20_0 + v_79_80 * g_59_low60_20_low20_0 = f_59_low60_20_low20_1 * (const 64 (-(2**20))),
    r_79_80 * f_59_low60_20_low20_0 + s_79_80 * g_59_low60_20_low20_0 = g_59_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_1 + u_79_80 * (const 64 (2**21)) + v_79_80 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_1 + r_79_80 * (const 64 (2**21)) + s_79_80 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_1,
    f_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_1,
    g_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 80)) <=s delta, delta <=s (const 64 (1 + 2*80)),
    (const 64 (-(2**20))) <=s u_79_80, u_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_80, v_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_80, r_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_80, s_79_80 <=s (const 64 ((2**20)-1)),
    u_79_80 + v_79_80 <=s (const 64 (2**20)),
    u_79_80 - v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 + v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 - v_79_80 <=s (const 64 (2**20)),
    r_79_80 + s_79_80 <=s (const 64 (2**20)),
    r_79_80 - s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 + s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 - s_79_80 <=s (const 64 (2**20)),
    u_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_79_80 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step80

// premise b
assume
g_59_low60_20_low20_1 = 1 (mod 2)
&&
g_59_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_2 f_59_low60_20_low20_1;
mov u_79_81 u_79_80;
mov v_79_81 v_79_80;

add g_59_low60_20_low20_2 g_59_low60_20_low20_1 f_59_low60_20_low20_1;
asr g_59_low60_20_low20_2 g_59_low60_20_low20_2 1;
add r_79_81 r_79_80 u_79_80;
asr r_79_81 r_79_81 1;
add s_79_81 s_79_80 v_79_80;
asr s_79_81 s_79_81 1;
assert
    true
&&
    f_59_low60_20_low20_2 = f_59_low60_20_low20_1,
    u_79_81 = u_79_80,
    v_79_81 = v_79_80,
    g_59_low60_20_low20_2 * (const 64 2) = g_59_low60_20_low20_1 + f_59_low60_20_low20_1,
    r_79_81 * (const 64 2) = r_79_80 + u_79_80,
    s_79_81 * (const 64 2) = s_79_80 + v_79_80
;

assume
    f_59_low60_20_low20_2 = f_59_low60_20_low20_1,
    u_79_81 = u_79_80,
    v_79_81 = v_79_80,
    g_59_low60_20_low20_2 * 2 = g_59_low60_20_low20_1 + f_59_low60_20_low20_1,
    r_79_81 * 2 = r_79_80 + u_79_80,
    s_79_81 * 2 = s_79_80 + v_79_80
&&
    true
;

{
    u_79_81 * f_59_low60_20_low20_0 + v_79_81 * g_59_low60_20_low20_0 = f_59_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_81 * f_59_low60_20_low20_0 + s_79_81 * g_59_low60_20_low20_0 = g_59_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_2 + u_79_81 * (const 64 (2**21)) + v_79_81 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_2 + r_79_81 * (const 64 (2**21)) + s_79_81 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_2,
    f_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_2,
    g_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 81)) <=s delta, delta <=s (const 64 (1 + 2*81)),
    (const 64 (-(2**20))) <=s u_79_81, u_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_81, v_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_81, r_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_81, s_79_81 <=s (const 64 ((2**20)-1)),
    u_79_81 + v_79_81 <=s (const 64 (2**20)),
    u_79_81 - v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 + v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 - v_79_81 <=s (const 64 (2**20)),
    r_79_81 + s_79_81 <=s (const 64 (2**20)),
    r_79_81 - s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 + s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 - s_79_81 <=s (const 64 (2**20)),
    u_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_79_81 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_080_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_1,
sint64 g_59_low60_20_low20_1,
sint64 f_59_low60_20_low20_2,
sint64 g_59_low60_20_low20_2,
sint64 u_79_80,
sint64 v_79_80,
sint64 r_79_80,
sint64 s_79_80,
sint64 u_79_81,
sint64 v_79_81,
sint64 r_79_81,
sint64 s_79_81,
bit ne
)={
    u_79_80 * f_59_low60_20_low20_0 + v_79_80 * g_59_low60_20_low20_0 = f_59_low60_20_low20_1 * (-(2**20)),
    r_79_80 * f_59_low60_20_low20_0 + s_79_80 * g_59_low60_20_low20_0 = g_59_low60_20_low20_1 * (-(2**20))
&&
    u_79_80 * f_59_low60_20_low20_0 + v_79_80 * g_59_low60_20_low20_0 = f_59_low60_20_low20_1 * (const 64 (-(2**20))),
    r_79_80 * f_59_low60_20_low20_0 + s_79_80 * g_59_low60_20_low20_0 = g_59_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_1 + u_79_80 * (const 64 (2**21)) + v_79_80 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_1 + r_79_80 * (const 64 (2**21)) + s_79_80 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_1,
    f_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_1,
    g_59_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 80)) <=s delta, delta <=s (const 64 (1 + 2*80)),
    (const 64 (-(2**20))) <=s u_79_80, u_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_80, v_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_80, r_79_80 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_80, s_79_80 <=s (const 64 ((2**20)-1)),
    u_79_80 + v_79_80 <=s (const 64 (2**20)),
    u_79_80 - v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 + v_79_80 <=s (const 64 (2**20)),
    (const 64 0) - u_79_80 - v_79_80 <=s (const 64 (2**20)),
    r_79_80 + s_79_80 <=s (const 64 (2**20)),
    r_79_80 - s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 + s_79_80 <=s (const 64 (2**20)),
    (const 64 0) - r_79_80 - s_79_80 <=s (const 64 (2**20)),
    u_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_79_80 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_79_80 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step80

// premise c
assume
g_59_low60_20_low20_1 = 1 (mod 2)
&&
g_59_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_2 g_59_low60_20_low20_1;
mov u_79_81 r_79_80;
mov v_79_81 s_79_80;

subs dc g_59_low60_20_low20_2 g_59_low60_20_low20_1 f_59_low60_20_low20_1;
asr g_59_low60_20_low20_2 g_59_low60_20_low20_2 1;
subs dc r_79_81 r_79_80 u_79_80;
asr r_79_81 r_79_81 1;
subs dc s_79_81 s_79_80 v_79_80;
asr s_79_81 s_79_81 1;
assert
    true
&&
    f_59_low60_20_low20_2 = g_59_low60_20_low20_1,
    u_79_81 = r_79_80,
    v_79_81 = s_79_80,
    g_59_low60_20_low20_2 * (const 64 2) = g_59_low60_20_low20_1 - f_59_low60_20_low20_1,
    r_79_81 * (const 64 2) = r_79_80 - u_79_80,
    s_79_81 * (const 64 2) = s_79_80 - v_79_80
;

assume
    f_59_low60_20_low20_2 = g_59_low60_20_low20_1,
    u_79_81 = r_79_80,
    v_79_81 = s_79_80,
    g_59_low60_20_low20_2 * 2 = g_59_low60_20_low20_1 - f_59_low60_20_low20_1,
    r_79_81 * 2 = r_79_80 - u_79_80,
    s_79_81 * 2 = s_79_80 - v_79_80
&&
    true
;

{
    u_79_81 * f_59_low60_20_low20_0 + v_79_81 * g_59_low60_20_low20_0 = f_59_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_81 * f_59_low60_20_low20_0 + s_79_81 * g_59_low60_20_low20_0 = g_59_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_2 + u_79_81 * (const 64 (2**21)) + v_79_81 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_2 + r_79_81 * (const 64 (2**21)) + s_79_81 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_2,
    f_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_2,
    g_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 81)) <=s delta, delta <=s (const 64 (1 + 2*81)),
    (const 64 (-(2**20))) <=s u_79_81, u_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_81, v_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_81, r_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_81, s_79_81 <=s (const 64 ((2**20)-1)),
    u_79_81 + v_79_81 <=s (const 64 (2**20)),
    u_79_81 - v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 + v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 - v_79_81 <=s (const 64 (2**20)),
    r_79_81 + s_79_81 <=s (const 64 (2**20)),
    r_79_81 - s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 + s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 - s_79_81 <=s (const 64 (2**20)),
    u_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_79_81 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_081_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_2,
sint64 g_59_low60_20_low20_2,
sint64 f_59_low60_20_low20_3,
sint64 g_59_low60_20_low20_3,
sint64 u_79_81,
sint64 v_79_81,
sint64 r_79_81,
sint64 s_79_81,
sint64 u_79_82,
sint64 v_79_82,
sint64 r_79_82,
sint64 s_79_82,
bit ne
)={
    u_79_81 * f_59_low60_20_low20_0 + v_79_81 * g_59_low60_20_low20_0 = f_59_low60_20_low20_2 * (-(2**20)),
    r_79_81 * f_59_low60_20_low20_0 + s_79_81 * g_59_low60_20_low20_0 = g_59_low60_20_low20_2 * (-(2**20))
&&
    u_79_81 * f_59_low60_20_low20_0 + v_79_81 * g_59_low60_20_low20_0 = f_59_low60_20_low20_2 * (const 64 (-(2**20))),
    r_79_81 * f_59_low60_20_low20_0 + s_79_81 * g_59_low60_20_low20_0 = g_59_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_2 + u_79_81 * (const 64 (2**21)) + v_79_81 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_2 + r_79_81 * (const 64 (2**21)) + s_79_81 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_2,
    f_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_2,
    g_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 81)) <=s delta, delta <=s (const 64 (1 + 2*81)),
    (const 64 (-(2**20))) <=s u_79_81, u_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_81, v_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_81, r_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_81, s_79_81 <=s (const 64 ((2**20)-1)),
    u_79_81 + v_79_81 <=s (const 64 (2**20)),
    u_79_81 - v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 + v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 - v_79_81 <=s (const 64 (2**20)),
    r_79_81 + s_79_81 <=s (const 64 (2**20)),
    r_79_81 - s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 + s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 - s_79_81 <=s (const 64 (2**20)),
    u_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_79_81 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step81

// premise a
assume
g_59_low60_20_low20_2 = 0 (mod 2)
&&
g_59_low60_20_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_3 f_59_low60_20_low20_2;
mov u_79_82 u_79_81;
mov v_79_82 v_79_81;

asr g_59_low60_20_low20_3 g_59_low60_20_low20_2 1;
asr r_79_82 r_79_81 1;
asr s_79_82 s_79_81 1;
assert
    true
&&
    f_59_low60_20_low20_3 = f_59_low60_20_low20_2,
    u_79_82 = u_79_81,
    v_79_82 = v_79_81,
    g_59_low60_20_low20_3 * (const 64 2) = g_59_low60_20_low20_2,
    r_79_82 * (const 64 2) = r_79_81,
    s_79_82 * (const 64 2) = s_79_81
;

assume
    f_59_low60_20_low20_3 = f_59_low60_20_low20_2,
    u_79_82 = u_79_81,
    v_79_82 = v_79_81,
    g_59_low60_20_low20_3 * 2 = g_59_low60_20_low20_2,
    r_79_82 * 2 = r_79_81,
    s_79_82 * 2 = s_79_81
&&
    true
;

{
    u_79_82 * f_59_low60_20_low20_0 + v_79_82 * g_59_low60_20_low20_0 = f_59_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_82 * f_59_low60_20_low20_0 + s_79_82 * g_59_low60_20_low20_0 = g_59_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_3 + u_79_82 * (const 64 (2**21)) + v_79_82 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_3 + r_79_82 * (const 64 (2**21)) + s_79_82 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_3,
    f_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_3,
    g_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 82)) <=s delta, delta <=s (const 64 (1 + 2*82)),
    (const 64 (-(2**20))) <=s u_79_82, u_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_82, v_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_82, r_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_82, s_79_82 <=s (const 64 ((2**20)-1)),
    u_79_82 + v_79_82 <=s (const 64 (2**20)),
    u_79_82 - v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 + v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 - v_79_82 <=s (const 64 (2**20)),
    r_79_82 + s_79_82 <=s (const 64 (2**20)),
    r_79_82 - s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 + s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 - s_79_82 <=s (const 64 (2**20)),
    u_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_79_82 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_081_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_2,
sint64 g_59_low60_20_low20_2,
sint64 f_59_low60_20_low20_3,
sint64 g_59_low60_20_low20_3,
sint64 u_79_81,
sint64 v_79_81,
sint64 r_79_81,
sint64 s_79_81,
sint64 u_79_82,
sint64 v_79_82,
sint64 r_79_82,
sint64 s_79_82,
bit ne
)={
    u_79_81 * f_59_low60_20_low20_0 + v_79_81 * g_59_low60_20_low20_0 = f_59_low60_20_low20_2 * (-(2**20)),
    r_79_81 * f_59_low60_20_low20_0 + s_79_81 * g_59_low60_20_low20_0 = g_59_low60_20_low20_2 * (-(2**20))
&&
    u_79_81 * f_59_low60_20_low20_0 + v_79_81 * g_59_low60_20_low20_0 = f_59_low60_20_low20_2 * (const 64 (-(2**20))),
    r_79_81 * f_59_low60_20_low20_0 + s_79_81 * g_59_low60_20_low20_0 = g_59_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_2 + u_79_81 * (const 64 (2**21)) + v_79_81 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_2 + r_79_81 * (const 64 (2**21)) + s_79_81 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_2,
    f_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_2,
    g_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 81)) <=s delta, delta <=s (const 64 (1 + 2*81)),
    (const 64 (-(2**20))) <=s u_79_81, u_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_81, v_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_81, r_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_81, s_79_81 <=s (const 64 ((2**20)-1)),
    u_79_81 + v_79_81 <=s (const 64 (2**20)),
    u_79_81 - v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 + v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 - v_79_81 <=s (const 64 (2**20)),
    r_79_81 + s_79_81 <=s (const 64 (2**20)),
    r_79_81 - s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 + s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 - s_79_81 <=s (const 64 (2**20)),
    u_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_79_81 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step81

// premise b
assume
g_59_low60_20_low20_2 = 1 (mod 2)
&&
g_59_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_3 f_59_low60_20_low20_2;
mov u_79_82 u_79_81;
mov v_79_82 v_79_81;

add g_59_low60_20_low20_3 g_59_low60_20_low20_2 f_59_low60_20_low20_2;
asr g_59_low60_20_low20_3 g_59_low60_20_low20_3 1;
add r_79_82 r_79_81 u_79_81;
asr r_79_82 r_79_82 1;
add s_79_82 s_79_81 v_79_81;
asr s_79_82 s_79_82 1;
assert
    true
&&
    f_59_low60_20_low20_3 = f_59_low60_20_low20_2,
    u_79_82 = u_79_81,
    v_79_82 = v_79_81,
    g_59_low60_20_low20_3 * (const 64 2) = g_59_low60_20_low20_2 + f_59_low60_20_low20_2,
    r_79_82 * (const 64 2) = r_79_81 + u_79_81,
    s_79_82 * (const 64 2) = s_79_81 + v_79_81
;

assume
    f_59_low60_20_low20_3 = f_59_low60_20_low20_2,
    u_79_82 = u_79_81,
    v_79_82 = v_79_81,
    g_59_low60_20_low20_3 * 2 = g_59_low60_20_low20_2 + f_59_low60_20_low20_2,
    r_79_82 * 2 = r_79_81 + u_79_81,
    s_79_82 * 2 = s_79_81 + v_79_81
&&
    true
;

{
    u_79_82 * f_59_low60_20_low20_0 + v_79_82 * g_59_low60_20_low20_0 = f_59_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_82 * f_59_low60_20_low20_0 + s_79_82 * g_59_low60_20_low20_0 = g_59_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_3 + u_79_82 * (const 64 (2**21)) + v_79_82 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_3 + r_79_82 * (const 64 (2**21)) + s_79_82 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_3,
    f_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_3,
    g_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 82)) <=s delta, delta <=s (const 64 (1 + 2*82)),
    (const 64 (-(2**20))) <=s u_79_82, u_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_82, v_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_82, r_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_82, s_79_82 <=s (const 64 ((2**20)-1)),
    u_79_82 + v_79_82 <=s (const 64 (2**20)),
    u_79_82 - v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 + v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 - v_79_82 <=s (const 64 (2**20)),
    r_79_82 + s_79_82 <=s (const 64 (2**20)),
    r_79_82 - s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 + s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 - s_79_82 <=s (const 64 (2**20)),
    u_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_79_82 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_081_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_2,
sint64 g_59_low60_20_low20_2,
sint64 f_59_low60_20_low20_3,
sint64 g_59_low60_20_low20_3,
sint64 u_79_81,
sint64 v_79_81,
sint64 r_79_81,
sint64 s_79_81,
sint64 u_79_82,
sint64 v_79_82,
sint64 r_79_82,
sint64 s_79_82,
bit ne
)={
    u_79_81 * f_59_low60_20_low20_0 + v_79_81 * g_59_low60_20_low20_0 = f_59_low60_20_low20_2 * (-(2**20)),
    r_79_81 * f_59_low60_20_low20_0 + s_79_81 * g_59_low60_20_low20_0 = g_59_low60_20_low20_2 * (-(2**20))
&&
    u_79_81 * f_59_low60_20_low20_0 + v_79_81 * g_59_low60_20_low20_0 = f_59_low60_20_low20_2 * (const 64 (-(2**20))),
    r_79_81 * f_59_low60_20_low20_0 + s_79_81 * g_59_low60_20_low20_0 = g_59_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_2 + u_79_81 * (const 64 (2**21)) + v_79_81 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_2 + r_79_81 * (const 64 (2**21)) + s_79_81 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_2,
    f_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_2,
    g_59_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 81)) <=s delta, delta <=s (const 64 (1 + 2*81)),
    (const 64 (-(2**20))) <=s u_79_81, u_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_81, v_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_81, r_79_81 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_81, s_79_81 <=s (const 64 ((2**20)-1)),
    u_79_81 + v_79_81 <=s (const 64 (2**20)),
    u_79_81 - v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 + v_79_81 <=s (const 64 (2**20)),
    (const 64 0) - u_79_81 - v_79_81 <=s (const 64 (2**20)),
    r_79_81 + s_79_81 <=s (const 64 (2**20)),
    r_79_81 - s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 + s_79_81 <=s (const 64 (2**20)),
    (const 64 0) - r_79_81 - s_79_81 <=s (const 64 (2**20)),
    u_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_79_81 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_79_81 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step81

// premise c
assume
g_59_low60_20_low20_2 = 1 (mod 2)
&&
g_59_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_3 g_59_low60_20_low20_2;
mov u_79_82 r_79_81;
mov v_79_82 s_79_81;

subs dc g_59_low60_20_low20_3 g_59_low60_20_low20_2 f_59_low60_20_low20_2;
asr g_59_low60_20_low20_3 g_59_low60_20_low20_3 1;
subs dc r_79_82 r_79_81 u_79_81;
asr r_79_82 r_79_82 1;
subs dc s_79_82 s_79_81 v_79_81;
asr s_79_82 s_79_82 1;
assert
    true
&&
    f_59_low60_20_low20_3 = g_59_low60_20_low20_2,
    u_79_82 = r_79_81,
    v_79_82 = s_79_81,
    g_59_low60_20_low20_3 * (const 64 2) = g_59_low60_20_low20_2 - f_59_low60_20_low20_2,
    r_79_82 * (const 64 2) = r_79_81 - u_79_81,
    s_79_82 * (const 64 2) = s_79_81 - v_79_81
;

assume
    f_59_low60_20_low20_3 = g_59_low60_20_low20_2,
    u_79_82 = r_79_81,
    v_79_82 = s_79_81,
    g_59_low60_20_low20_3 * 2 = g_59_low60_20_low20_2 - f_59_low60_20_low20_2,
    r_79_82 * 2 = r_79_81 - u_79_81,
    s_79_82 * 2 = s_79_81 - v_79_81
&&
    true
;

{
    u_79_82 * f_59_low60_20_low20_0 + v_79_82 * g_59_low60_20_low20_0 = f_59_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_82 * f_59_low60_20_low20_0 + s_79_82 * g_59_low60_20_low20_0 = g_59_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_3 + u_79_82 * (const 64 (2**21)) + v_79_82 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_3 + r_79_82 * (const 64 (2**21)) + s_79_82 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_3,
    f_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_3,
    g_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 82)) <=s delta, delta <=s (const 64 (1 + 2*82)),
    (const 64 (-(2**20))) <=s u_79_82, u_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_82, v_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_82, r_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_82, s_79_82 <=s (const 64 ((2**20)-1)),
    u_79_82 + v_79_82 <=s (const 64 (2**20)),
    u_79_82 - v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 + v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 - v_79_82 <=s (const 64 (2**20)),
    r_79_82 + s_79_82 <=s (const 64 (2**20)),
    r_79_82 - s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 + s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 - s_79_82 <=s (const 64 (2**20)),
    u_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_79_82 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_082_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_3,
sint64 g_59_low60_20_low20_3,
sint64 f_59_low60_20_low20_4,
sint64 g_59_low60_20_low20_4,
sint64 u_79_82,
sint64 v_79_82,
sint64 r_79_82,
sint64 s_79_82,
sint64 u_79_83,
sint64 v_79_83,
sint64 r_79_83,
sint64 s_79_83,
bit ne
)={
    u_79_82 * f_59_low60_20_low20_0 + v_79_82 * g_59_low60_20_low20_0 = f_59_low60_20_low20_3 * (-(2**20)),
    r_79_82 * f_59_low60_20_low20_0 + s_79_82 * g_59_low60_20_low20_0 = g_59_low60_20_low20_3 * (-(2**20))
&&
    u_79_82 * f_59_low60_20_low20_0 + v_79_82 * g_59_low60_20_low20_0 = f_59_low60_20_low20_3 * (const 64 (-(2**20))),
    r_79_82 * f_59_low60_20_low20_0 + s_79_82 * g_59_low60_20_low20_0 = g_59_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_3 + u_79_82 * (const 64 (2**21)) + v_79_82 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_3 + r_79_82 * (const 64 (2**21)) + s_79_82 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_3,
    f_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_3,
    g_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 82)) <=s delta, delta <=s (const 64 (1 + 2*82)),
    (const 64 (-(2**20))) <=s u_79_82, u_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_82, v_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_82, r_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_82, s_79_82 <=s (const 64 ((2**20)-1)),
    u_79_82 + v_79_82 <=s (const 64 (2**20)),
    u_79_82 - v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 + v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 - v_79_82 <=s (const 64 (2**20)),
    r_79_82 + s_79_82 <=s (const 64 (2**20)),
    r_79_82 - s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 + s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 - s_79_82 <=s (const 64 (2**20)),
    u_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_79_82 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step82

// premise a
assume
g_59_low60_20_low20_3 = 0 (mod 2)
&&
g_59_low60_20_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_4 f_59_low60_20_low20_3;
mov u_79_83 u_79_82;
mov v_79_83 v_79_82;

asr g_59_low60_20_low20_4 g_59_low60_20_low20_3 1;
asr r_79_83 r_79_82 1;
asr s_79_83 s_79_82 1;
assert
    true
&&
    f_59_low60_20_low20_4 = f_59_low60_20_low20_3,
    u_79_83 = u_79_82,
    v_79_83 = v_79_82,
    g_59_low60_20_low20_4 * (const 64 2) = g_59_low60_20_low20_3,
    r_79_83 * (const 64 2) = r_79_82,
    s_79_83 * (const 64 2) = s_79_82
;

assume
    f_59_low60_20_low20_4 = f_59_low60_20_low20_3,
    u_79_83 = u_79_82,
    v_79_83 = v_79_82,
    g_59_low60_20_low20_4 * 2 = g_59_low60_20_low20_3,
    r_79_83 * 2 = r_79_82,
    s_79_83 * 2 = s_79_82
&&
    true
;

{
    u_79_83 * f_59_low60_20_low20_0 + v_79_83 * g_59_low60_20_low20_0 = f_59_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_83 * f_59_low60_20_low20_0 + s_79_83 * g_59_low60_20_low20_0 = g_59_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_4 + u_79_83 * (const 64 (2**21)) + v_79_83 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_4 + r_79_83 * (const 64 (2**21)) + s_79_83 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_4,
    f_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_4,
    g_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 83)) <=s delta, delta <=s (const 64 (1 + 2*83)),
    (const 64 (-(2**20))) <=s u_79_83, u_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_83, v_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_83, r_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_83, s_79_83 <=s (const 64 ((2**20)-1)),
    u_79_83 + v_79_83 <=s (const 64 (2**20)),
    u_79_83 - v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 + v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 - v_79_83 <=s (const 64 (2**20)),
    r_79_83 + s_79_83 <=s (const 64 (2**20)),
    r_79_83 - s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 + s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 - s_79_83 <=s (const 64 (2**20)),
    u_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_79_83 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_082_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_3,
sint64 g_59_low60_20_low20_3,
sint64 f_59_low60_20_low20_4,
sint64 g_59_low60_20_low20_4,
sint64 u_79_82,
sint64 v_79_82,
sint64 r_79_82,
sint64 s_79_82,
sint64 u_79_83,
sint64 v_79_83,
sint64 r_79_83,
sint64 s_79_83,
bit ne
)={
    u_79_82 * f_59_low60_20_low20_0 + v_79_82 * g_59_low60_20_low20_0 = f_59_low60_20_low20_3 * (-(2**20)),
    r_79_82 * f_59_low60_20_low20_0 + s_79_82 * g_59_low60_20_low20_0 = g_59_low60_20_low20_3 * (-(2**20))
&&
    u_79_82 * f_59_low60_20_low20_0 + v_79_82 * g_59_low60_20_low20_0 = f_59_low60_20_low20_3 * (const 64 (-(2**20))),
    r_79_82 * f_59_low60_20_low20_0 + s_79_82 * g_59_low60_20_low20_0 = g_59_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_3 + u_79_82 * (const 64 (2**21)) + v_79_82 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_3 + r_79_82 * (const 64 (2**21)) + s_79_82 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_3,
    f_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_3,
    g_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 82)) <=s delta, delta <=s (const 64 (1 + 2*82)),
    (const 64 (-(2**20))) <=s u_79_82, u_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_82, v_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_82, r_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_82, s_79_82 <=s (const 64 ((2**20)-1)),
    u_79_82 + v_79_82 <=s (const 64 (2**20)),
    u_79_82 - v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 + v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 - v_79_82 <=s (const 64 (2**20)),
    r_79_82 + s_79_82 <=s (const 64 (2**20)),
    r_79_82 - s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 + s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 - s_79_82 <=s (const 64 (2**20)),
    u_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_79_82 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step82

// premise b
assume
g_59_low60_20_low20_3 = 1 (mod 2)
&&
g_59_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_4 f_59_low60_20_low20_3;
mov u_79_83 u_79_82;
mov v_79_83 v_79_82;

add g_59_low60_20_low20_4 g_59_low60_20_low20_3 f_59_low60_20_low20_3;
asr g_59_low60_20_low20_4 g_59_low60_20_low20_4 1;
add r_79_83 r_79_82 u_79_82;
asr r_79_83 r_79_83 1;
add s_79_83 s_79_82 v_79_82;
asr s_79_83 s_79_83 1;
assert
    true
&&
    f_59_low60_20_low20_4 = f_59_low60_20_low20_3,
    u_79_83 = u_79_82,
    v_79_83 = v_79_82,
    g_59_low60_20_low20_4 * (const 64 2) = g_59_low60_20_low20_3 + f_59_low60_20_low20_3,
    r_79_83 * (const 64 2) = r_79_82 + u_79_82,
    s_79_83 * (const 64 2) = s_79_82 + v_79_82
;

assume
    f_59_low60_20_low20_4 = f_59_low60_20_low20_3,
    u_79_83 = u_79_82,
    v_79_83 = v_79_82,
    g_59_low60_20_low20_4 * 2 = g_59_low60_20_low20_3 + f_59_low60_20_low20_3,
    r_79_83 * 2 = r_79_82 + u_79_82,
    s_79_83 * 2 = s_79_82 + v_79_82
&&
    true
;

{
    u_79_83 * f_59_low60_20_low20_0 + v_79_83 * g_59_low60_20_low20_0 = f_59_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_83 * f_59_low60_20_low20_0 + s_79_83 * g_59_low60_20_low20_0 = g_59_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_4 + u_79_83 * (const 64 (2**21)) + v_79_83 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_4 + r_79_83 * (const 64 (2**21)) + s_79_83 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_4,
    f_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_4,
    g_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 83)) <=s delta, delta <=s (const 64 (1 + 2*83)),
    (const 64 (-(2**20))) <=s u_79_83, u_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_83, v_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_83, r_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_83, s_79_83 <=s (const 64 ((2**20)-1)),
    u_79_83 + v_79_83 <=s (const 64 (2**20)),
    u_79_83 - v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 + v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 - v_79_83 <=s (const 64 (2**20)),
    r_79_83 + s_79_83 <=s (const 64 (2**20)),
    r_79_83 - s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 + s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 - s_79_83 <=s (const 64 (2**20)),
    u_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_79_83 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_082_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_3,
sint64 g_59_low60_20_low20_3,
sint64 f_59_low60_20_low20_4,
sint64 g_59_low60_20_low20_4,
sint64 u_79_82,
sint64 v_79_82,
sint64 r_79_82,
sint64 s_79_82,
sint64 u_79_83,
sint64 v_79_83,
sint64 r_79_83,
sint64 s_79_83,
bit ne
)={
    u_79_82 * f_59_low60_20_low20_0 + v_79_82 * g_59_low60_20_low20_0 = f_59_low60_20_low20_3 * (-(2**20)),
    r_79_82 * f_59_low60_20_low20_0 + s_79_82 * g_59_low60_20_low20_0 = g_59_low60_20_low20_3 * (-(2**20))
&&
    u_79_82 * f_59_low60_20_low20_0 + v_79_82 * g_59_low60_20_low20_0 = f_59_low60_20_low20_3 * (const 64 (-(2**20))),
    r_79_82 * f_59_low60_20_low20_0 + s_79_82 * g_59_low60_20_low20_0 = g_59_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_3 + u_79_82 * (const 64 (2**21)) + v_79_82 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_3 + r_79_82 * (const 64 (2**21)) + s_79_82 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_3,
    f_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_3,
    g_59_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 82)) <=s delta, delta <=s (const 64 (1 + 2*82)),
    (const 64 (-(2**20))) <=s u_79_82, u_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_82, v_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_82, r_79_82 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_82, s_79_82 <=s (const 64 ((2**20)-1)),
    u_79_82 + v_79_82 <=s (const 64 (2**20)),
    u_79_82 - v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 + v_79_82 <=s (const 64 (2**20)),
    (const 64 0) - u_79_82 - v_79_82 <=s (const 64 (2**20)),
    r_79_82 + s_79_82 <=s (const 64 (2**20)),
    r_79_82 - s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 + s_79_82 <=s (const 64 (2**20)),
    (const 64 0) - r_79_82 - s_79_82 <=s (const 64 (2**20)),
    u_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_79_82 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_79_82 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step82

// premise c
assume
g_59_low60_20_low20_3 = 1 (mod 2)
&&
g_59_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_4 g_59_low60_20_low20_3;
mov u_79_83 r_79_82;
mov v_79_83 s_79_82;

subs dc g_59_low60_20_low20_4 g_59_low60_20_low20_3 f_59_low60_20_low20_3;
asr g_59_low60_20_low20_4 g_59_low60_20_low20_4 1;
subs dc r_79_83 r_79_82 u_79_82;
asr r_79_83 r_79_83 1;
subs dc s_79_83 s_79_82 v_79_82;
asr s_79_83 s_79_83 1;
assert
    true
&&
    f_59_low60_20_low20_4 = g_59_low60_20_low20_3,
    u_79_83 = r_79_82,
    v_79_83 = s_79_82,
    g_59_low60_20_low20_4 * (const 64 2) = g_59_low60_20_low20_3 - f_59_low60_20_low20_3,
    r_79_83 * (const 64 2) = r_79_82 - u_79_82,
    s_79_83 * (const 64 2) = s_79_82 - v_79_82
;

assume
    f_59_low60_20_low20_4 = g_59_low60_20_low20_3,
    u_79_83 = r_79_82,
    v_79_83 = s_79_82,
    g_59_low60_20_low20_4 * 2 = g_59_low60_20_low20_3 - f_59_low60_20_low20_3,
    r_79_83 * 2 = r_79_82 - u_79_82,
    s_79_83 * 2 = s_79_82 - v_79_82
&&
    true
;

{
    u_79_83 * f_59_low60_20_low20_0 + v_79_83 * g_59_low60_20_low20_0 = f_59_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_83 * f_59_low60_20_low20_0 + s_79_83 * g_59_low60_20_low20_0 = g_59_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_4 + u_79_83 * (const 64 (2**21)) + v_79_83 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_4 + r_79_83 * (const 64 (2**21)) + s_79_83 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_4,
    f_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_4,
    g_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 83)) <=s delta, delta <=s (const 64 (1 + 2*83)),
    (const 64 (-(2**20))) <=s u_79_83, u_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_83, v_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_83, r_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_83, s_79_83 <=s (const 64 ((2**20)-1)),
    u_79_83 + v_79_83 <=s (const 64 (2**20)),
    u_79_83 - v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 + v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 - v_79_83 <=s (const 64 (2**20)),
    r_79_83 + s_79_83 <=s (const 64 (2**20)),
    r_79_83 - s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 + s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 - s_79_83 <=s (const 64 (2**20)),
    u_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_79_83 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_083_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_4,
sint64 g_59_low60_20_low20_4,
sint64 f_59_low60_20_low20_5,
sint64 g_59_low60_20_low20_5,
sint64 u_79_83,
sint64 v_79_83,
sint64 r_79_83,
sint64 s_79_83,
sint64 u_79_84,
sint64 v_79_84,
sint64 r_79_84,
sint64 s_79_84,
bit ne
)={
    u_79_83 * f_59_low60_20_low20_0 + v_79_83 * g_59_low60_20_low20_0 = f_59_low60_20_low20_4 * (-(2**20)),
    r_79_83 * f_59_low60_20_low20_0 + s_79_83 * g_59_low60_20_low20_0 = g_59_low60_20_low20_4 * (-(2**20))
&&
    u_79_83 * f_59_low60_20_low20_0 + v_79_83 * g_59_low60_20_low20_0 = f_59_low60_20_low20_4 * (const 64 (-(2**20))),
    r_79_83 * f_59_low60_20_low20_0 + s_79_83 * g_59_low60_20_low20_0 = g_59_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_4 + u_79_83 * (const 64 (2**21)) + v_79_83 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_4 + r_79_83 * (const 64 (2**21)) + s_79_83 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_4,
    f_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_4,
    g_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 83)) <=s delta, delta <=s (const 64 (1 + 2*83)),
    (const 64 (-(2**20))) <=s u_79_83, u_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_83, v_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_83, r_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_83, s_79_83 <=s (const 64 ((2**20)-1)),
    u_79_83 + v_79_83 <=s (const 64 (2**20)),
    u_79_83 - v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 + v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 - v_79_83 <=s (const 64 (2**20)),
    r_79_83 + s_79_83 <=s (const 64 (2**20)),
    r_79_83 - s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 + s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 - s_79_83 <=s (const 64 (2**20)),
    u_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_79_83 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step83

// premise a
assume
g_59_low60_20_low20_4 = 0 (mod 2)
&&
g_59_low60_20_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_5 f_59_low60_20_low20_4;
mov u_79_84 u_79_83;
mov v_79_84 v_79_83;

asr g_59_low60_20_low20_5 g_59_low60_20_low20_4 1;
asr r_79_84 r_79_83 1;
asr s_79_84 s_79_83 1;
assert
    true
&&
    f_59_low60_20_low20_5 = f_59_low60_20_low20_4,
    u_79_84 = u_79_83,
    v_79_84 = v_79_83,
    g_59_low60_20_low20_5 * (const 64 2) = g_59_low60_20_low20_4,
    r_79_84 * (const 64 2) = r_79_83,
    s_79_84 * (const 64 2) = s_79_83
;

assume
    f_59_low60_20_low20_5 = f_59_low60_20_low20_4,
    u_79_84 = u_79_83,
    v_79_84 = v_79_83,
    g_59_low60_20_low20_5 * 2 = g_59_low60_20_low20_4,
    r_79_84 * 2 = r_79_83,
    s_79_84 * 2 = s_79_83
&&
    true
;

{
    u_79_84 * f_59_low60_20_low20_0 + v_79_84 * g_59_low60_20_low20_0 = f_59_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_84 * f_59_low60_20_low20_0 + s_79_84 * g_59_low60_20_low20_0 = g_59_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_5 + u_79_84 * (const 64 (2**21)) + v_79_84 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_5 + r_79_84 * (const 64 (2**21)) + s_79_84 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_5,
    f_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_5,
    g_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 84)) <=s delta, delta <=s (const 64 (1 + 2*84)),
    (const 64 (-(2**20))) <=s u_79_84, u_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_84, v_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_84, r_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_84, s_79_84 <=s (const 64 ((2**20)-1)),
    u_79_84 + v_79_84 <=s (const 64 (2**20)),
    u_79_84 - v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 + v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 - v_79_84 <=s (const 64 (2**20)),
    r_79_84 + s_79_84 <=s (const 64 (2**20)),
    r_79_84 - s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 + s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 - s_79_84 <=s (const 64 (2**20)),
    u_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_79_84 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_083_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_4,
sint64 g_59_low60_20_low20_4,
sint64 f_59_low60_20_low20_5,
sint64 g_59_low60_20_low20_5,
sint64 u_79_83,
sint64 v_79_83,
sint64 r_79_83,
sint64 s_79_83,
sint64 u_79_84,
sint64 v_79_84,
sint64 r_79_84,
sint64 s_79_84,
bit ne
)={
    u_79_83 * f_59_low60_20_low20_0 + v_79_83 * g_59_low60_20_low20_0 = f_59_low60_20_low20_4 * (-(2**20)),
    r_79_83 * f_59_low60_20_low20_0 + s_79_83 * g_59_low60_20_low20_0 = g_59_low60_20_low20_4 * (-(2**20))
&&
    u_79_83 * f_59_low60_20_low20_0 + v_79_83 * g_59_low60_20_low20_0 = f_59_low60_20_low20_4 * (const 64 (-(2**20))),
    r_79_83 * f_59_low60_20_low20_0 + s_79_83 * g_59_low60_20_low20_0 = g_59_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_4 + u_79_83 * (const 64 (2**21)) + v_79_83 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_4 + r_79_83 * (const 64 (2**21)) + s_79_83 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_4,
    f_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_4,
    g_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 83)) <=s delta, delta <=s (const 64 (1 + 2*83)),
    (const 64 (-(2**20))) <=s u_79_83, u_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_83, v_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_83, r_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_83, s_79_83 <=s (const 64 ((2**20)-1)),
    u_79_83 + v_79_83 <=s (const 64 (2**20)),
    u_79_83 - v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 + v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 - v_79_83 <=s (const 64 (2**20)),
    r_79_83 + s_79_83 <=s (const 64 (2**20)),
    r_79_83 - s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 + s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 - s_79_83 <=s (const 64 (2**20)),
    u_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_79_83 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step83

// premise b
assume
g_59_low60_20_low20_4 = 1 (mod 2)
&&
g_59_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_5 f_59_low60_20_low20_4;
mov u_79_84 u_79_83;
mov v_79_84 v_79_83;

add g_59_low60_20_low20_5 g_59_low60_20_low20_4 f_59_low60_20_low20_4;
asr g_59_low60_20_low20_5 g_59_low60_20_low20_5 1;
add r_79_84 r_79_83 u_79_83;
asr r_79_84 r_79_84 1;
add s_79_84 s_79_83 v_79_83;
asr s_79_84 s_79_84 1;
assert
    true
&&
    f_59_low60_20_low20_5 = f_59_low60_20_low20_4,
    u_79_84 = u_79_83,
    v_79_84 = v_79_83,
    g_59_low60_20_low20_5 * (const 64 2) = g_59_low60_20_low20_4 + f_59_low60_20_low20_4,
    r_79_84 * (const 64 2) = r_79_83 + u_79_83,
    s_79_84 * (const 64 2) = s_79_83 + v_79_83
;

assume
    f_59_low60_20_low20_5 = f_59_low60_20_low20_4,
    u_79_84 = u_79_83,
    v_79_84 = v_79_83,
    g_59_low60_20_low20_5 * 2 = g_59_low60_20_low20_4 + f_59_low60_20_low20_4,
    r_79_84 * 2 = r_79_83 + u_79_83,
    s_79_84 * 2 = s_79_83 + v_79_83
&&
    true
;

{
    u_79_84 * f_59_low60_20_low20_0 + v_79_84 * g_59_low60_20_low20_0 = f_59_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_84 * f_59_low60_20_low20_0 + s_79_84 * g_59_low60_20_low20_0 = g_59_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_5 + u_79_84 * (const 64 (2**21)) + v_79_84 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_5 + r_79_84 * (const 64 (2**21)) + s_79_84 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_5,
    f_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_5,
    g_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 84)) <=s delta, delta <=s (const 64 (1 + 2*84)),
    (const 64 (-(2**20))) <=s u_79_84, u_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_84, v_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_84, r_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_84, s_79_84 <=s (const 64 ((2**20)-1)),
    u_79_84 + v_79_84 <=s (const 64 (2**20)),
    u_79_84 - v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 + v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 - v_79_84 <=s (const 64 (2**20)),
    r_79_84 + s_79_84 <=s (const 64 (2**20)),
    r_79_84 - s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 + s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 - s_79_84 <=s (const 64 (2**20)),
    u_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_79_84 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_083_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_4,
sint64 g_59_low60_20_low20_4,
sint64 f_59_low60_20_low20_5,
sint64 g_59_low60_20_low20_5,
sint64 u_79_83,
sint64 v_79_83,
sint64 r_79_83,
sint64 s_79_83,
sint64 u_79_84,
sint64 v_79_84,
sint64 r_79_84,
sint64 s_79_84,
bit ne
)={
    u_79_83 * f_59_low60_20_low20_0 + v_79_83 * g_59_low60_20_low20_0 = f_59_low60_20_low20_4 * (-(2**20)),
    r_79_83 * f_59_low60_20_low20_0 + s_79_83 * g_59_low60_20_low20_0 = g_59_low60_20_low20_4 * (-(2**20))
&&
    u_79_83 * f_59_low60_20_low20_0 + v_79_83 * g_59_low60_20_low20_0 = f_59_low60_20_low20_4 * (const 64 (-(2**20))),
    r_79_83 * f_59_low60_20_low20_0 + s_79_83 * g_59_low60_20_low20_0 = g_59_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_4 + u_79_83 * (const 64 (2**21)) + v_79_83 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_4 + r_79_83 * (const 64 (2**21)) + s_79_83 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_4,
    f_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_4,
    g_59_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 83)) <=s delta, delta <=s (const 64 (1 + 2*83)),
    (const 64 (-(2**20))) <=s u_79_83, u_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_83, v_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_83, r_79_83 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_83, s_79_83 <=s (const 64 ((2**20)-1)),
    u_79_83 + v_79_83 <=s (const 64 (2**20)),
    u_79_83 - v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 + v_79_83 <=s (const 64 (2**20)),
    (const 64 0) - u_79_83 - v_79_83 <=s (const 64 (2**20)),
    r_79_83 + s_79_83 <=s (const 64 (2**20)),
    r_79_83 - s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 + s_79_83 <=s (const 64 (2**20)),
    (const 64 0) - r_79_83 - s_79_83 <=s (const 64 (2**20)),
    u_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_79_83 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_79_83 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step83

// premise c
assume
g_59_low60_20_low20_4 = 1 (mod 2)
&&
g_59_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_5 g_59_low60_20_low20_4;
mov u_79_84 r_79_83;
mov v_79_84 s_79_83;

subs dc g_59_low60_20_low20_5 g_59_low60_20_low20_4 f_59_low60_20_low20_4;
asr g_59_low60_20_low20_5 g_59_low60_20_low20_5 1;
subs dc r_79_84 r_79_83 u_79_83;
asr r_79_84 r_79_84 1;
subs dc s_79_84 s_79_83 v_79_83;
asr s_79_84 s_79_84 1;
assert
    true
&&
    f_59_low60_20_low20_5 = g_59_low60_20_low20_4,
    u_79_84 = r_79_83,
    v_79_84 = s_79_83,
    g_59_low60_20_low20_5 * (const 64 2) = g_59_low60_20_low20_4 - f_59_low60_20_low20_4,
    r_79_84 * (const 64 2) = r_79_83 - u_79_83,
    s_79_84 * (const 64 2) = s_79_83 - v_79_83
;

assume
    f_59_low60_20_low20_5 = g_59_low60_20_low20_4,
    u_79_84 = r_79_83,
    v_79_84 = s_79_83,
    g_59_low60_20_low20_5 * 2 = g_59_low60_20_low20_4 - f_59_low60_20_low20_4,
    r_79_84 * 2 = r_79_83 - u_79_83,
    s_79_84 * 2 = s_79_83 - v_79_83
&&
    true
;

{
    u_79_84 * f_59_low60_20_low20_0 + v_79_84 * g_59_low60_20_low20_0 = f_59_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_84 * f_59_low60_20_low20_0 + s_79_84 * g_59_low60_20_low20_0 = g_59_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_5 + u_79_84 * (const 64 (2**21)) + v_79_84 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_5 + r_79_84 * (const 64 (2**21)) + s_79_84 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_5,
    f_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_5,
    g_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 84)) <=s delta, delta <=s (const 64 (1 + 2*84)),
    (const 64 (-(2**20))) <=s u_79_84, u_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_84, v_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_84, r_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_84, s_79_84 <=s (const 64 ((2**20)-1)),
    u_79_84 + v_79_84 <=s (const 64 (2**20)),
    u_79_84 - v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 + v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 - v_79_84 <=s (const 64 (2**20)),
    r_79_84 + s_79_84 <=s (const 64 (2**20)),
    r_79_84 - s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 + s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 - s_79_84 <=s (const 64 (2**20)),
    u_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_79_84 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_084_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_5,
sint64 g_59_low60_20_low20_5,
sint64 f_59_low60_20_low20_6,
sint64 g_59_low60_20_low20_6,
sint64 u_79_84,
sint64 v_79_84,
sint64 r_79_84,
sint64 s_79_84,
sint64 u_79_85,
sint64 v_79_85,
sint64 r_79_85,
sint64 s_79_85,
bit ne
)={
    u_79_84 * f_59_low60_20_low20_0 + v_79_84 * g_59_low60_20_low20_0 = f_59_low60_20_low20_5 * (-(2**20)),
    r_79_84 * f_59_low60_20_low20_0 + s_79_84 * g_59_low60_20_low20_0 = g_59_low60_20_low20_5 * (-(2**20))
&&
    u_79_84 * f_59_low60_20_low20_0 + v_79_84 * g_59_low60_20_low20_0 = f_59_low60_20_low20_5 * (const 64 (-(2**20))),
    r_79_84 * f_59_low60_20_low20_0 + s_79_84 * g_59_low60_20_low20_0 = g_59_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_5 + u_79_84 * (const 64 (2**21)) + v_79_84 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_5 + r_79_84 * (const 64 (2**21)) + s_79_84 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_5,
    f_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_5,
    g_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 84)) <=s delta, delta <=s (const 64 (1 + 2*84)),
    (const 64 (-(2**20))) <=s u_79_84, u_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_84, v_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_84, r_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_84, s_79_84 <=s (const 64 ((2**20)-1)),
    u_79_84 + v_79_84 <=s (const 64 (2**20)),
    u_79_84 - v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 + v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 - v_79_84 <=s (const 64 (2**20)),
    r_79_84 + s_79_84 <=s (const 64 (2**20)),
    r_79_84 - s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 + s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 - s_79_84 <=s (const 64 (2**20)),
    u_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_79_84 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step84

// premise a
assume
g_59_low60_20_low20_5 = 0 (mod 2)
&&
g_59_low60_20_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_6 f_59_low60_20_low20_5;
mov u_79_85 u_79_84;
mov v_79_85 v_79_84;

asr g_59_low60_20_low20_6 g_59_low60_20_low20_5 1;
asr r_79_85 r_79_84 1;
asr s_79_85 s_79_84 1;
assert
    true
&&
    f_59_low60_20_low20_6 = f_59_low60_20_low20_5,
    u_79_85 = u_79_84,
    v_79_85 = v_79_84,
    g_59_low60_20_low20_6 * (const 64 2) = g_59_low60_20_low20_5,
    r_79_85 * (const 64 2) = r_79_84,
    s_79_85 * (const 64 2) = s_79_84
;

assume
    f_59_low60_20_low20_6 = f_59_low60_20_low20_5,
    u_79_85 = u_79_84,
    v_79_85 = v_79_84,
    g_59_low60_20_low20_6 * 2 = g_59_low60_20_low20_5,
    r_79_85 * 2 = r_79_84,
    s_79_85 * 2 = s_79_84
&&
    true
;

{
    u_79_85 * f_59_low60_20_low20_0 + v_79_85 * g_59_low60_20_low20_0 = f_59_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_85 * f_59_low60_20_low20_0 + s_79_85 * g_59_low60_20_low20_0 = g_59_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_6 + u_79_85 * (const 64 (2**21)) + v_79_85 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_6 + r_79_85 * (const 64 (2**21)) + s_79_85 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_6,
    f_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_6,
    g_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 85)) <=s delta, delta <=s (const 64 (1 + 2*85)),
    (const 64 (-(2**20))) <=s u_79_85, u_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_85, v_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_85, r_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_85, s_79_85 <=s (const 64 ((2**20)-1)),
    u_79_85 + v_79_85 <=s (const 64 (2**20)),
    u_79_85 - v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 + v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 - v_79_85 <=s (const 64 (2**20)),
    r_79_85 + s_79_85 <=s (const 64 (2**20)),
    r_79_85 - s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 + s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 - s_79_85 <=s (const 64 (2**20)),
    u_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_79_85 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_084_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_5,
sint64 g_59_low60_20_low20_5,
sint64 f_59_low60_20_low20_6,
sint64 g_59_low60_20_low20_6,
sint64 u_79_84,
sint64 v_79_84,
sint64 r_79_84,
sint64 s_79_84,
sint64 u_79_85,
sint64 v_79_85,
sint64 r_79_85,
sint64 s_79_85,
bit ne
)={
    u_79_84 * f_59_low60_20_low20_0 + v_79_84 * g_59_low60_20_low20_0 = f_59_low60_20_low20_5 * (-(2**20)),
    r_79_84 * f_59_low60_20_low20_0 + s_79_84 * g_59_low60_20_low20_0 = g_59_low60_20_low20_5 * (-(2**20))
&&
    u_79_84 * f_59_low60_20_low20_0 + v_79_84 * g_59_low60_20_low20_0 = f_59_low60_20_low20_5 * (const 64 (-(2**20))),
    r_79_84 * f_59_low60_20_low20_0 + s_79_84 * g_59_low60_20_low20_0 = g_59_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_5 + u_79_84 * (const 64 (2**21)) + v_79_84 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_5 + r_79_84 * (const 64 (2**21)) + s_79_84 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_5,
    f_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_5,
    g_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 84)) <=s delta, delta <=s (const 64 (1 + 2*84)),
    (const 64 (-(2**20))) <=s u_79_84, u_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_84, v_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_84, r_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_84, s_79_84 <=s (const 64 ((2**20)-1)),
    u_79_84 + v_79_84 <=s (const 64 (2**20)),
    u_79_84 - v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 + v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 - v_79_84 <=s (const 64 (2**20)),
    r_79_84 + s_79_84 <=s (const 64 (2**20)),
    r_79_84 - s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 + s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 - s_79_84 <=s (const 64 (2**20)),
    u_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_79_84 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step84

// premise b
assume
g_59_low60_20_low20_5 = 1 (mod 2)
&&
g_59_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_6 f_59_low60_20_low20_5;
mov u_79_85 u_79_84;
mov v_79_85 v_79_84;

add g_59_low60_20_low20_6 g_59_low60_20_low20_5 f_59_low60_20_low20_5;
asr g_59_low60_20_low20_6 g_59_low60_20_low20_6 1;
add r_79_85 r_79_84 u_79_84;
asr r_79_85 r_79_85 1;
add s_79_85 s_79_84 v_79_84;
asr s_79_85 s_79_85 1;
assert
    true
&&
    f_59_low60_20_low20_6 = f_59_low60_20_low20_5,
    u_79_85 = u_79_84,
    v_79_85 = v_79_84,
    g_59_low60_20_low20_6 * (const 64 2) = g_59_low60_20_low20_5 + f_59_low60_20_low20_5,
    r_79_85 * (const 64 2) = r_79_84 + u_79_84,
    s_79_85 * (const 64 2) = s_79_84 + v_79_84
;

assume
    f_59_low60_20_low20_6 = f_59_low60_20_low20_5,
    u_79_85 = u_79_84,
    v_79_85 = v_79_84,
    g_59_low60_20_low20_6 * 2 = g_59_low60_20_low20_5 + f_59_low60_20_low20_5,
    r_79_85 * 2 = r_79_84 + u_79_84,
    s_79_85 * 2 = s_79_84 + v_79_84
&&
    true
;

{
    u_79_85 * f_59_low60_20_low20_0 + v_79_85 * g_59_low60_20_low20_0 = f_59_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_85 * f_59_low60_20_low20_0 + s_79_85 * g_59_low60_20_low20_0 = g_59_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_6 + u_79_85 * (const 64 (2**21)) + v_79_85 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_6 + r_79_85 * (const 64 (2**21)) + s_79_85 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_6,
    f_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_6,
    g_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 85)) <=s delta, delta <=s (const 64 (1 + 2*85)),
    (const 64 (-(2**20))) <=s u_79_85, u_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_85, v_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_85, r_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_85, s_79_85 <=s (const 64 ((2**20)-1)),
    u_79_85 + v_79_85 <=s (const 64 (2**20)),
    u_79_85 - v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 + v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 - v_79_85 <=s (const 64 (2**20)),
    r_79_85 + s_79_85 <=s (const 64 (2**20)),
    r_79_85 - s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 + s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 - s_79_85 <=s (const 64 (2**20)),
    u_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_79_85 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_084_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_5,
sint64 g_59_low60_20_low20_5,
sint64 f_59_low60_20_low20_6,
sint64 g_59_low60_20_low20_6,
sint64 u_79_84,
sint64 v_79_84,
sint64 r_79_84,
sint64 s_79_84,
sint64 u_79_85,
sint64 v_79_85,
sint64 r_79_85,
sint64 s_79_85,
bit ne
)={
    u_79_84 * f_59_low60_20_low20_0 + v_79_84 * g_59_low60_20_low20_0 = f_59_low60_20_low20_5 * (-(2**20)),
    r_79_84 * f_59_low60_20_low20_0 + s_79_84 * g_59_low60_20_low20_0 = g_59_low60_20_low20_5 * (-(2**20))
&&
    u_79_84 * f_59_low60_20_low20_0 + v_79_84 * g_59_low60_20_low20_0 = f_59_low60_20_low20_5 * (const 64 (-(2**20))),
    r_79_84 * f_59_low60_20_low20_0 + s_79_84 * g_59_low60_20_low20_0 = g_59_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_5 + u_79_84 * (const 64 (2**21)) + v_79_84 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_5 + r_79_84 * (const 64 (2**21)) + s_79_84 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_5,
    f_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_5,
    g_59_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 84)) <=s delta, delta <=s (const 64 (1 + 2*84)),
    (const 64 (-(2**20))) <=s u_79_84, u_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_84, v_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_84, r_79_84 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_84, s_79_84 <=s (const 64 ((2**20)-1)),
    u_79_84 + v_79_84 <=s (const 64 (2**20)),
    u_79_84 - v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 + v_79_84 <=s (const 64 (2**20)),
    (const 64 0) - u_79_84 - v_79_84 <=s (const 64 (2**20)),
    r_79_84 + s_79_84 <=s (const 64 (2**20)),
    r_79_84 - s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 + s_79_84 <=s (const 64 (2**20)),
    (const 64 0) - r_79_84 - s_79_84 <=s (const 64 (2**20)),
    u_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_79_84 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_79_84 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step84

// premise c
assume
g_59_low60_20_low20_5 = 1 (mod 2)
&&
g_59_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_6 g_59_low60_20_low20_5;
mov u_79_85 r_79_84;
mov v_79_85 s_79_84;

subs dc g_59_low60_20_low20_6 g_59_low60_20_low20_5 f_59_low60_20_low20_5;
asr g_59_low60_20_low20_6 g_59_low60_20_low20_6 1;
subs dc r_79_85 r_79_84 u_79_84;
asr r_79_85 r_79_85 1;
subs dc s_79_85 s_79_84 v_79_84;
asr s_79_85 s_79_85 1;
assert
    true
&&
    f_59_low60_20_low20_6 = g_59_low60_20_low20_5,
    u_79_85 = r_79_84,
    v_79_85 = s_79_84,
    g_59_low60_20_low20_6 * (const 64 2) = g_59_low60_20_low20_5 - f_59_low60_20_low20_5,
    r_79_85 * (const 64 2) = r_79_84 - u_79_84,
    s_79_85 * (const 64 2) = s_79_84 - v_79_84
;

assume
    f_59_low60_20_low20_6 = g_59_low60_20_low20_5,
    u_79_85 = r_79_84,
    v_79_85 = s_79_84,
    g_59_low60_20_low20_6 * 2 = g_59_low60_20_low20_5 - f_59_low60_20_low20_5,
    r_79_85 * 2 = r_79_84 - u_79_84,
    s_79_85 * 2 = s_79_84 - v_79_84
&&
    true
;

{
    u_79_85 * f_59_low60_20_low20_0 + v_79_85 * g_59_low60_20_low20_0 = f_59_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_85 * f_59_low60_20_low20_0 + s_79_85 * g_59_low60_20_low20_0 = g_59_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_6 + u_79_85 * (const 64 (2**21)) + v_79_85 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_6 + r_79_85 * (const 64 (2**21)) + s_79_85 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_6,
    f_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_6,
    g_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 85)) <=s delta, delta <=s (const 64 (1 + 2*85)),
    (const 64 (-(2**20))) <=s u_79_85, u_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_85, v_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_85, r_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_85, s_79_85 <=s (const 64 ((2**20)-1)),
    u_79_85 + v_79_85 <=s (const 64 (2**20)),
    u_79_85 - v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 + v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 - v_79_85 <=s (const 64 (2**20)),
    r_79_85 + s_79_85 <=s (const 64 (2**20)),
    r_79_85 - s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 + s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 - s_79_85 <=s (const 64 (2**20)),
    u_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_79_85 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_085_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_6,
sint64 g_59_low60_20_low20_6,
sint64 f_59_low60_20_low20_7,
sint64 g_59_low60_20_low20_7,
sint64 u_79_85,
sint64 v_79_85,
sint64 r_79_85,
sint64 s_79_85,
sint64 u_79_86,
sint64 v_79_86,
sint64 r_79_86,
sint64 s_79_86,
bit ne
)={
    u_79_85 * f_59_low60_20_low20_0 + v_79_85 * g_59_low60_20_low20_0 = f_59_low60_20_low20_6 * (-(2**20)),
    r_79_85 * f_59_low60_20_low20_0 + s_79_85 * g_59_low60_20_low20_0 = g_59_low60_20_low20_6 * (-(2**20))
&&
    u_79_85 * f_59_low60_20_low20_0 + v_79_85 * g_59_low60_20_low20_0 = f_59_low60_20_low20_6 * (const 64 (-(2**20))),
    r_79_85 * f_59_low60_20_low20_0 + s_79_85 * g_59_low60_20_low20_0 = g_59_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_6 + u_79_85 * (const 64 (2**21)) + v_79_85 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_6 + r_79_85 * (const 64 (2**21)) + s_79_85 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_6,
    f_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_6,
    g_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 85)) <=s delta, delta <=s (const 64 (1 + 2*85)),
    (const 64 (-(2**20))) <=s u_79_85, u_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_85, v_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_85, r_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_85, s_79_85 <=s (const 64 ((2**20)-1)),
    u_79_85 + v_79_85 <=s (const 64 (2**20)),
    u_79_85 - v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 + v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 - v_79_85 <=s (const 64 (2**20)),
    r_79_85 + s_79_85 <=s (const 64 (2**20)),
    r_79_85 - s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 + s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 - s_79_85 <=s (const 64 (2**20)),
    u_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_79_85 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step85

// premise a
assume
g_59_low60_20_low20_6 = 0 (mod 2)
&&
g_59_low60_20_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_7 f_59_low60_20_low20_6;
mov u_79_86 u_79_85;
mov v_79_86 v_79_85;

asr g_59_low60_20_low20_7 g_59_low60_20_low20_6 1;
asr r_79_86 r_79_85 1;
asr s_79_86 s_79_85 1;
assert
    true
&&
    f_59_low60_20_low20_7 = f_59_low60_20_low20_6,
    u_79_86 = u_79_85,
    v_79_86 = v_79_85,
    g_59_low60_20_low20_7 * (const 64 2) = g_59_low60_20_low20_6,
    r_79_86 * (const 64 2) = r_79_85,
    s_79_86 * (const 64 2) = s_79_85
;

assume
    f_59_low60_20_low20_7 = f_59_low60_20_low20_6,
    u_79_86 = u_79_85,
    v_79_86 = v_79_85,
    g_59_low60_20_low20_7 * 2 = g_59_low60_20_low20_6,
    r_79_86 * 2 = r_79_85,
    s_79_86 * 2 = s_79_85
&&
    true
;

{
    u_79_86 * f_59_low60_20_low20_0 + v_79_86 * g_59_low60_20_low20_0 = f_59_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_86 * f_59_low60_20_low20_0 + s_79_86 * g_59_low60_20_low20_0 = g_59_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_7 + u_79_86 * (const 64 (2**21)) + v_79_86 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_7 + r_79_86 * (const 64 (2**21)) + s_79_86 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_7,
    f_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_7,
    g_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 86)) <=s delta, delta <=s (const 64 (1 + 2*86)),
    (const 64 (-(2**20))) <=s u_79_86, u_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_86, v_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_86, r_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_86, s_79_86 <=s (const 64 ((2**20)-1)),
    u_79_86 + v_79_86 <=s (const 64 (2**20)),
    u_79_86 - v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 + v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 - v_79_86 <=s (const 64 (2**20)),
    r_79_86 + s_79_86 <=s (const 64 (2**20)),
    r_79_86 - s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 + s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 - s_79_86 <=s (const 64 (2**20)),
    u_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_79_86 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_085_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_6,
sint64 g_59_low60_20_low20_6,
sint64 f_59_low60_20_low20_7,
sint64 g_59_low60_20_low20_7,
sint64 u_79_85,
sint64 v_79_85,
sint64 r_79_85,
sint64 s_79_85,
sint64 u_79_86,
sint64 v_79_86,
sint64 r_79_86,
sint64 s_79_86,
bit ne
)={
    u_79_85 * f_59_low60_20_low20_0 + v_79_85 * g_59_low60_20_low20_0 = f_59_low60_20_low20_6 * (-(2**20)),
    r_79_85 * f_59_low60_20_low20_0 + s_79_85 * g_59_low60_20_low20_0 = g_59_low60_20_low20_6 * (-(2**20))
&&
    u_79_85 * f_59_low60_20_low20_0 + v_79_85 * g_59_low60_20_low20_0 = f_59_low60_20_low20_6 * (const 64 (-(2**20))),
    r_79_85 * f_59_low60_20_low20_0 + s_79_85 * g_59_low60_20_low20_0 = g_59_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_6 + u_79_85 * (const 64 (2**21)) + v_79_85 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_6 + r_79_85 * (const 64 (2**21)) + s_79_85 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_6,
    f_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_6,
    g_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 85)) <=s delta, delta <=s (const 64 (1 + 2*85)),
    (const 64 (-(2**20))) <=s u_79_85, u_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_85, v_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_85, r_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_85, s_79_85 <=s (const 64 ((2**20)-1)),
    u_79_85 + v_79_85 <=s (const 64 (2**20)),
    u_79_85 - v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 + v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 - v_79_85 <=s (const 64 (2**20)),
    r_79_85 + s_79_85 <=s (const 64 (2**20)),
    r_79_85 - s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 + s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 - s_79_85 <=s (const 64 (2**20)),
    u_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_79_85 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step85

// premise b
assume
g_59_low60_20_low20_6 = 1 (mod 2)
&&
g_59_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_7 f_59_low60_20_low20_6;
mov u_79_86 u_79_85;
mov v_79_86 v_79_85;

add g_59_low60_20_low20_7 g_59_low60_20_low20_6 f_59_low60_20_low20_6;
asr g_59_low60_20_low20_7 g_59_low60_20_low20_7 1;
add r_79_86 r_79_85 u_79_85;
asr r_79_86 r_79_86 1;
add s_79_86 s_79_85 v_79_85;
asr s_79_86 s_79_86 1;
assert
    true
&&
    f_59_low60_20_low20_7 = f_59_low60_20_low20_6,
    u_79_86 = u_79_85,
    v_79_86 = v_79_85,
    g_59_low60_20_low20_7 * (const 64 2) = g_59_low60_20_low20_6 + f_59_low60_20_low20_6,
    r_79_86 * (const 64 2) = r_79_85 + u_79_85,
    s_79_86 * (const 64 2) = s_79_85 + v_79_85
;

assume
    f_59_low60_20_low20_7 = f_59_low60_20_low20_6,
    u_79_86 = u_79_85,
    v_79_86 = v_79_85,
    g_59_low60_20_low20_7 * 2 = g_59_low60_20_low20_6 + f_59_low60_20_low20_6,
    r_79_86 * 2 = r_79_85 + u_79_85,
    s_79_86 * 2 = s_79_85 + v_79_85
&&
    true
;

{
    u_79_86 * f_59_low60_20_low20_0 + v_79_86 * g_59_low60_20_low20_0 = f_59_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_86 * f_59_low60_20_low20_0 + s_79_86 * g_59_low60_20_low20_0 = g_59_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_7 + u_79_86 * (const 64 (2**21)) + v_79_86 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_7 + r_79_86 * (const 64 (2**21)) + s_79_86 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_7,
    f_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_7,
    g_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 86)) <=s delta, delta <=s (const 64 (1 + 2*86)),
    (const 64 (-(2**20))) <=s u_79_86, u_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_86, v_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_86, r_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_86, s_79_86 <=s (const 64 ((2**20)-1)),
    u_79_86 + v_79_86 <=s (const 64 (2**20)),
    u_79_86 - v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 + v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 - v_79_86 <=s (const 64 (2**20)),
    r_79_86 + s_79_86 <=s (const 64 (2**20)),
    r_79_86 - s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 + s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 - s_79_86 <=s (const 64 (2**20)),
    u_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_79_86 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_085_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_6,
sint64 g_59_low60_20_low20_6,
sint64 f_59_low60_20_low20_7,
sint64 g_59_low60_20_low20_7,
sint64 u_79_85,
sint64 v_79_85,
sint64 r_79_85,
sint64 s_79_85,
sint64 u_79_86,
sint64 v_79_86,
sint64 r_79_86,
sint64 s_79_86,
bit ne
)={
    u_79_85 * f_59_low60_20_low20_0 + v_79_85 * g_59_low60_20_low20_0 = f_59_low60_20_low20_6 * (-(2**20)),
    r_79_85 * f_59_low60_20_low20_0 + s_79_85 * g_59_low60_20_low20_0 = g_59_low60_20_low20_6 * (-(2**20))
&&
    u_79_85 * f_59_low60_20_low20_0 + v_79_85 * g_59_low60_20_low20_0 = f_59_low60_20_low20_6 * (const 64 (-(2**20))),
    r_79_85 * f_59_low60_20_low20_0 + s_79_85 * g_59_low60_20_low20_0 = g_59_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_6 + u_79_85 * (const 64 (2**21)) + v_79_85 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_6 + r_79_85 * (const 64 (2**21)) + s_79_85 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_6,
    f_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_6,
    g_59_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 85)) <=s delta, delta <=s (const 64 (1 + 2*85)),
    (const 64 (-(2**20))) <=s u_79_85, u_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_85, v_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_85, r_79_85 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_85, s_79_85 <=s (const 64 ((2**20)-1)),
    u_79_85 + v_79_85 <=s (const 64 (2**20)),
    u_79_85 - v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 + v_79_85 <=s (const 64 (2**20)),
    (const 64 0) - u_79_85 - v_79_85 <=s (const 64 (2**20)),
    r_79_85 + s_79_85 <=s (const 64 (2**20)),
    r_79_85 - s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 + s_79_85 <=s (const 64 (2**20)),
    (const 64 0) - r_79_85 - s_79_85 <=s (const 64 (2**20)),
    u_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_79_85 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_79_85 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step85

// premise c
assume
g_59_low60_20_low20_6 = 1 (mod 2)
&&
g_59_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_7 g_59_low60_20_low20_6;
mov u_79_86 r_79_85;
mov v_79_86 s_79_85;

subs dc g_59_low60_20_low20_7 g_59_low60_20_low20_6 f_59_low60_20_low20_6;
asr g_59_low60_20_low20_7 g_59_low60_20_low20_7 1;
subs dc r_79_86 r_79_85 u_79_85;
asr r_79_86 r_79_86 1;
subs dc s_79_86 s_79_85 v_79_85;
asr s_79_86 s_79_86 1;
assert
    true
&&
    f_59_low60_20_low20_7 = g_59_low60_20_low20_6,
    u_79_86 = r_79_85,
    v_79_86 = s_79_85,
    g_59_low60_20_low20_7 * (const 64 2) = g_59_low60_20_low20_6 - f_59_low60_20_low20_6,
    r_79_86 * (const 64 2) = r_79_85 - u_79_85,
    s_79_86 * (const 64 2) = s_79_85 - v_79_85
;

assume
    f_59_low60_20_low20_7 = g_59_low60_20_low20_6,
    u_79_86 = r_79_85,
    v_79_86 = s_79_85,
    g_59_low60_20_low20_7 * 2 = g_59_low60_20_low20_6 - f_59_low60_20_low20_6,
    r_79_86 * 2 = r_79_85 - u_79_85,
    s_79_86 * 2 = s_79_85 - v_79_85
&&
    true
;

{
    u_79_86 * f_59_low60_20_low20_0 + v_79_86 * g_59_low60_20_low20_0 = f_59_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_86 * f_59_low60_20_low20_0 + s_79_86 * g_59_low60_20_low20_0 = g_59_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_7 + u_79_86 * (const 64 (2**21)) + v_79_86 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_7 + r_79_86 * (const 64 (2**21)) + s_79_86 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_7,
    f_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_7,
    g_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 86)) <=s delta, delta <=s (const 64 (1 + 2*86)),
    (const 64 (-(2**20))) <=s u_79_86, u_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_86, v_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_86, r_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_86, s_79_86 <=s (const 64 ((2**20)-1)),
    u_79_86 + v_79_86 <=s (const 64 (2**20)),
    u_79_86 - v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 + v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 - v_79_86 <=s (const 64 (2**20)),
    r_79_86 + s_79_86 <=s (const 64 (2**20)),
    r_79_86 - s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 + s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 - s_79_86 <=s (const 64 (2**20)),
    u_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_79_86 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_086_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_7,
sint64 g_59_low60_20_low20_7,
sint64 f_59_low60_20_low20_8,
sint64 g_59_low60_20_low20_8,
sint64 u_79_86,
sint64 v_79_86,
sint64 r_79_86,
sint64 s_79_86,
sint64 u_79_87,
sint64 v_79_87,
sint64 r_79_87,
sint64 s_79_87,
bit ne
)={
    u_79_86 * f_59_low60_20_low20_0 + v_79_86 * g_59_low60_20_low20_0 = f_59_low60_20_low20_7 * (-(2**20)),
    r_79_86 * f_59_low60_20_low20_0 + s_79_86 * g_59_low60_20_low20_0 = g_59_low60_20_low20_7 * (-(2**20))
&&
    u_79_86 * f_59_low60_20_low20_0 + v_79_86 * g_59_low60_20_low20_0 = f_59_low60_20_low20_7 * (const 64 (-(2**20))),
    r_79_86 * f_59_low60_20_low20_0 + s_79_86 * g_59_low60_20_low20_0 = g_59_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_7 + u_79_86 * (const 64 (2**21)) + v_79_86 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_7 + r_79_86 * (const 64 (2**21)) + s_79_86 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_7,
    f_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_7,
    g_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 86)) <=s delta, delta <=s (const 64 (1 + 2*86)),
    (const 64 (-(2**20))) <=s u_79_86, u_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_86, v_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_86, r_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_86, s_79_86 <=s (const 64 ((2**20)-1)),
    u_79_86 + v_79_86 <=s (const 64 (2**20)),
    u_79_86 - v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 + v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 - v_79_86 <=s (const 64 (2**20)),
    r_79_86 + s_79_86 <=s (const 64 (2**20)),
    r_79_86 - s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 + s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 - s_79_86 <=s (const 64 (2**20)),
    u_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_79_86 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step86

// premise a
assume
g_59_low60_20_low20_7 = 0 (mod 2)
&&
g_59_low60_20_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_8 f_59_low60_20_low20_7;
mov u_79_87 u_79_86;
mov v_79_87 v_79_86;

asr g_59_low60_20_low20_8 g_59_low60_20_low20_7 1;
asr r_79_87 r_79_86 1;
asr s_79_87 s_79_86 1;
assert
    true
&&
    f_59_low60_20_low20_8 = f_59_low60_20_low20_7,
    u_79_87 = u_79_86,
    v_79_87 = v_79_86,
    g_59_low60_20_low20_8 * (const 64 2) = g_59_low60_20_low20_7,
    r_79_87 * (const 64 2) = r_79_86,
    s_79_87 * (const 64 2) = s_79_86
;

assume
    f_59_low60_20_low20_8 = f_59_low60_20_low20_7,
    u_79_87 = u_79_86,
    v_79_87 = v_79_86,
    g_59_low60_20_low20_8 * 2 = g_59_low60_20_low20_7,
    r_79_87 * 2 = r_79_86,
    s_79_87 * 2 = s_79_86
&&
    true
;

{
    u_79_87 * f_59_low60_20_low20_0 + v_79_87 * g_59_low60_20_low20_0 = f_59_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_87 * f_59_low60_20_low20_0 + s_79_87 * g_59_low60_20_low20_0 = g_59_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_8 + u_79_87 * (const 64 (2**21)) + v_79_87 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_8 + r_79_87 * (const 64 (2**21)) + s_79_87 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_8,
    f_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_8,
    g_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 87)) <=s delta, delta <=s (const 64 (1 + 2*87)),
    (const 64 (-(2**20))) <=s u_79_87, u_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_87, v_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_87, r_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_87, s_79_87 <=s (const 64 ((2**20)-1)),
    u_79_87 + v_79_87 <=s (const 64 (2**20)),
    u_79_87 - v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 + v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 - v_79_87 <=s (const 64 (2**20)),
    r_79_87 + s_79_87 <=s (const 64 (2**20)),
    r_79_87 - s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 + s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 - s_79_87 <=s (const 64 (2**20)),
    u_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_79_87 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_086_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_7,
sint64 g_59_low60_20_low20_7,
sint64 f_59_low60_20_low20_8,
sint64 g_59_low60_20_low20_8,
sint64 u_79_86,
sint64 v_79_86,
sint64 r_79_86,
sint64 s_79_86,
sint64 u_79_87,
sint64 v_79_87,
sint64 r_79_87,
sint64 s_79_87,
bit ne
)={
    u_79_86 * f_59_low60_20_low20_0 + v_79_86 * g_59_low60_20_low20_0 = f_59_low60_20_low20_7 * (-(2**20)),
    r_79_86 * f_59_low60_20_low20_0 + s_79_86 * g_59_low60_20_low20_0 = g_59_low60_20_low20_7 * (-(2**20))
&&
    u_79_86 * f_59_low60_20_low20_0 + v_79_86 * g_59_low60_20_low20_0 = f_59_low60_20_low20_7 * (const 64 (-(2**20))),
    r_79_86 * f_59_low60_20_low20_0 + s_79_86 * g_59_low60_20_low20_0 = g_59_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_7 + u_79_86 * (const 64 (2**21)) + v_79_86 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_7 + r_79_86 * (const 64 (2**21)) + s_79_86 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_7,
    f_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_7,
    g_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 86)) <=s delta, delta <=s (const 64 (1 + 2*86)),
    (const 64 (-(2**20))) <=s u_79_86, u_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_86, v_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_86, r_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_86, s_79_86 <=s (const 64 ((2**20)-1)),
    u_79_86 + v_79_86 <=s (const 64 (2**20)),
    u_79_86 - v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 + v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 - v_79_86 <=s (const 64 (2**20)),
    r_79_86 + s_79_86 <=s (const 64 (2**20)),
    r_79_86 - s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 + s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 - s_79_86 <=s (const 64 (2**20)),
    u_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_79_86 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step86

// premise b
assume
g_59_low60_20_low20_7 = 1 (mod 2)
&&
g_59_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_8 f_59_low60_20_low20_7;
mov u_79_87 u_79_86;
mov v_79_87 v_79_86;

add g_59_low60_20_low20_8 g_59_low60_20_low20_7 f_59_low60_20_low20_7;
asr g_59_low60_20_low20_8 g_59_low60_20_low20_8 1;
add r_79_87 r_79_86 u_79_86;
asr r_79_87 r_79_87 1;
add s_79_87 s_79_86 v_79_86;
asr s_79_87 s_79_87 1;
assert
    true
&&
    f_59_low60_20_low20_8 = f_59_low60_20_low20_7,
    u_79_87 = u_79_86,
    v_79_87 = v_79_86,
    g_59_low60_20_low20_8 * (const 64 2) = g_59_low60_20_low20_7 + f_59_low60_20_low20_7,
    r_79_87 * (const 64 2) = r_79_86 + u_79_86,
    s_79_87 * (const 64 2) = s_79_86 + v_79_86
;

assume
    f_59_low60_20_low20_8 = f_59_low60_20_low20_7,
    u_79_87 = u_79_86,
    v_79_87 = v_79_86,
    g_59_low60_20_low20_8 * 2 = g_59_low60_20_low20_7 + f_59_low60_20_low20_7,
    r_79_87 * 2 = r_79_86 + u_79_86,
    s_79_87 * 2 = s_79_86 + v_79_86
&&
    true
;

{
    u_79_87 * f_59_low60_20_low20_0 + v_79_87 * g_59_low60_20_low20_0 = f_59_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_87 * f_59_low60_20_low20_0 + s_79_87 * g_59_low60_20_low20_0 = g_59_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_8 + u_79_87 * (const 64 (2**21)) + v_79_87 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_8 + r_79_87 * (const 64 (2**21)) + s_79_87 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_8,
    f_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_8,
    g_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 87)) <=s delta, delta <=s (const 64 (1 + 2*87)),
    (const 64 (-(2**20))) <=s u_79_87, u_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_87, v_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_87, r_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_87, s_79_87 <=s (const 64 ((2**20)-1)),
    u_79_87 + v_79_87 <=s (const 64 (2**20)),
    u_79_87 - v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 + v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 - v_79_87 <=s (const 64 (2**20)),
    r_79_87 + s_79_87 <=s (const 64 (2**20)),
    r_79_87 - s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 + s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 - s_79_87 <=s (const 64 (2**20)),
    u_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_79_87 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_086_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_7,
sint64 g_59_low60_20_low20_7,
sint64 f_59_low60_20_low20_8,
sint64 g_59_low60_20_low20_8,
sint64 u_79_86,
sint64 v_79_86,
sint64 r_79_86,
sint64 s_79_86,
sint64 u_79_87,
sint64 v_79_87,
sint64 r_79_87,
sint64 s_79_87,
bit ne
)={
    u_79_86 * f_59_low60_20_low20_0 + v_79_86 * g_59_low60_20_low20_0 = f_59_low60_20_low20_7 * (-(2**20)),
    r_79_86 * f_59_low60_20_low20_0 + s_79_86 * g_59_low60_20_low20_0 = g_59_low60_20_low20_7 * (-(2**20))
&&
    u_79_86 * f_59_low60_20_low20_0 + v_79_86 * g_59_low60_20_low20_0 = f_59_low60_20_low20_7 * (const 64 (-(2**20))),
    r_79_86 * f_59_low60_20_low20_0 + s_79_86 * g_59_low60_20_low20_0 = g_59_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_7 + u_79_86 * (const 64 (2**21)) + v_79_86 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_7 + r_79_86 * (const 64 (2**21)) + s_79_86 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_7,
    f_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_7,
    g_59_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 86)) <=s delta, delta <=s (const 64 (1 + 2*86)),
    (const 64 (-(2**20))) <=s u_79_86, u_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_86, v_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_86, r_79_86 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_86, s_79_86 <=s (const 64 ((2**20)-1)),
    u_79_86 + v_79_86 <=s (const 64 (2**20)),
    u_79_86 - v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 + v_79_86 <=s (const 64 (2**20)),
    (const 64 0) - u_79_86 - v_79_86 <=s (const 64 (2**20)),
    r_79_86 + s_79_86 <=s (const 64 (2**20)),
    r_79_86 - s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 + s_79_86 <=s (const 64 (2**20)),
    (const 64 0) - r_79_86 - s_79_86 <=s (const 64 (2**20)),
    u_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_79_86 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_79_86 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step86

// premise c
assume
g_59_low60_20_low20_7 = 1 (mod 2)
&&
g_59_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_8 g_59_low60_20_low20_7;
mov u_79_87 r_79_86;
mov v_79_87 s_79_86;

subs dc g_59_low60_20_low20_8 g_59_low60_20_low20_7 f_59_low60_20_low20_7;
asr g_59_low60_20_low20_8 g_59_low60_20_low20_8 1;
subs dc r_79_87 r_79_86 u_79_86;
asr r_79_87 r_79_87 1;
subs dc s_79_87 s_79_86 v_79_86;
asr s_79_87 s_79_87 1;
assert
    true
&&
    f_59_low60_20_low20_8 = g_59_low60_20_low20_7,
    u_79_87 = r_79_86,
    v_79_87 = s_79_86,
    g_59_low60_20_low20_8 * (const 64 2) = g_59_low60_20_low20_7 - f_59_low60_20_low20_7,
    r_79_87 * (const 64 2) = r_79_86 - u_79_86,
    s_79_87 * (const 64 2) = s_79_86 - v_79_86
;

assume
    f_59_low60_20_low20_8 = g_59_low60_20_low20_7,
    u_79_87 = r_79_86,
    v_79_87 = s_79_86,
    g_59_low60_20_low20_8 * 2 = g_59_low60_20_low20_7 - f_59_low60_20_low20_7,
    r_79_87 * 2 = r_79_86 - u_79_86,
    s_79_87 * 2 = s_79_86 - v_79_86
&&
    true
;

{
    u_79_87 * f_59_low60_20_low20_0 + v_79_87 * g_59_low60_20_low20_0 = f_59_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_87 * f_59_low60_20_low20_0 + s_79_87 * g_59_low60_20_low20_0 = g_59_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_8 + u_79_87 * (const 64 (2**21)) + v_79_87 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_8 + r_79_87 * (const 64 (2**21)) + s_79_87 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_8,
    f_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_8,
    g_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 87)) <=s delta, delta <=s (const 64 (1 + 2*87)),
    (const 64 (-(2**20))) <=s u_79_87, u_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_87, v_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_87, r_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_87, s_79_87 <=s (const 64 ((2**20)-1)),
    u_79_87 + v_79_87 <=s (const 64 (2**20)),
    u_79_87 - v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 + v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 - v_79_87 <=s (const 64 (2**20)),
    r_79_87 + s_79_87 <=s (const 64 (2**20)),
    r_79_87 - s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 + s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 - s_79_87 <=s (const 64 (2**20)),
    u_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_79_87 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_087_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_8,
sint64 g_59_low60_20_low20_8,
sint64 f_59_low60_20_low20_9,
sint64 g_59_low60_20_low20_9,
sint64 u_79_87,
sint64 v_79_87,
sint64 r_79_87,
sint64 s_79_87,
sint64 u_79_88,
sint64 v_79_88,
sint64 r_79_88,
sint64 s_79_88,
bit ne
)={
    u_79_87 * f_59_low60_20_low20_0 + v_79_87 * g_59_low60_20_low20_0 = f_59_low60_20_low20_8 * (-(2**20)),
    r_79_87 * f_59_low60_20_low20_0 + s_79_87 * g_59_low60_20_low20_0 = g_59_low60_20_low20_8 * (-(2**20))
&&
    u_79_87 * f_59_low60_20_low20_0 + v_79_87 * g_59_low60_20_low20_0 = f_59_low60_20_low20_8 * (const 64 (-(2**20))),
    r_79_87 * f_59_low60_20_low20_0 + s_79_87 * g_59_low60_20_low20_0 = g_59_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_8 + u_79_87 * (const 64 (2**21)) + v_79_87 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_8 + r_79_87 * (const 64 (2**21)) + s_79_87 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_8,
    f_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_8,
    g_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 87)) <=s delta, delta <=s (const 64 (1 + 2*87)),
    (const 64 (-(2**20))) <=s u_79_87, u_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_87, v_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_87, r_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_87, s_79_87 <=s (const 64 ((2**20)-1)),
    u_79_87 + v_79_87 <=s (const 64 (2**20)),
    u_79_87 - v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 + v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 - v_79_87 <=s (const 64 (2**20)),
    r_79_87 + s_79_87 <=s (const 64 (2**20)),
    r_79_87 - s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 + s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 - s_79_87 <=s (const 64 (2**20)),
    u_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_79_87 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step87

// premise a
assume
g_59_low60_20_low20_8 = 0 (mod 2)
&&
g_59_low60_20_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_9 f_59_low60_20_low20_8;
mov u_79_88 u_79_87;
mov v_79_88 v_79_87;

asr g_59_low60_20_low20_9 g_59_low60_20_low20_8 1;
asr r_79_88 r_79_87 1;
asr s_79_88 s_79_87 1;
assert
    true
&&
    f_59_low60_20_low20_9 = f_59_low60_20_low20_8,
    u_79_88 = u_79_87,
    v_79_88 = v_79_87,
    g_59_low60_20_low20_9 * (const 64 2) = g_59_low60_20_low20_8,
    r_79_88 * (const 64 2) = r_79_87,
    s_79_88 * (const 64 2) = s_79_87
;

assume
    f_59_low60_20_low20_9 = f_59_low60_20_low20_8,
    u_79_88 = u_79_87,
    v_79_88 = v_79_87,
    g_59_low60_20_low20_9 * 2 = g_59_low60_20_low20_8,
    r_79_88 * 2 = r_79_87,
    s_79_88 * 2 = s_79_87
&&
    true
;

{
    u_79_88 * f_59_low60_20_low20_0 + v_79_88 * g_59_low60_20_low20_0 = f_59_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_88 * f_59_low60_20_low20_0 + s_79_88 * g_59_low60_20_low20_0 = g_59_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_9 + u_79_88 * (const 64 (2**21)) + v_79_88 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_9 + r_79_88 * (const 64 (2**21)) + s_79_88 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_9,
    f_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_9,
    g_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 88)) <=s delta, delta <=s (const 64 (1 + 2*88)),
    (const 64 (-(2**20))) <=s u_79_88, u_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_88, v_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_88, r_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_88, s_79_88 <=s (const 64 ((2**20)-1)),
    u_79_88 + v_79_88 <=s (const 64 (2**20)),
    u_79_88 - v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 + v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 - v_79_88 <=s (const 64 (2**20)),
    r_79_88 + s_79_88 <=s (const 64 (2**20)),
    r_79_88 - s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 + s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 - s_79_88 <=s (const 64 (2**20)),
    u_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_79_88 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_087_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_8,
sint64 g_59_low60_20_low20_8,
sint64 f_59_low60_20_low20_9,
sint64 g_59_low60_20_low20_9,
sint64 u_79_87,
sint64 v_79_87,
sint64 r_79_87,
sint64 s_79_87,
sint64 u_79_88,
sint64 v_79_88,
sint64 r_79_88,
sint64 s_79_88,
bit ne
)={
    u_79_87 * f_59_low60_20_low20_0 + v_79_87 * g_59_low60_20_low20_0 = f_59_low60_20_low20_8 * (-(2**20)),
    r_79_87 * f_59_low60_20_low20_0 + s_79_87 * g_59_low60_20_low20_0 = g_59_low60_20_low20_8 * (-(2**20))
&&
    u_79_87 * f_59_low60_20_low20_0 + v_79_87 * g_59_low60_20_low20_0 = f_59_low60_20_low20_8 * (const 64 (-(2**20))),
    r_79_87 * f_59_low60_20_low20_0 + s_79_87 * g_59_low60_20_low20_0 = g_59_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_8 + u_79_87 * (const 64 (2**21)) + v_79_87 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_8 + r_79_87 * (const 64 (2**21)) + s_79_87 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_8,
    f_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_8,
    g_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 87)) <=s delta, delta <=s (const 64 (1 + 2*87)),
    (const 64 (-(2**20))) <=s u_79_87, u_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_87, v_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_87, r_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_87, s_79_87 <=s (const 64 ((2**20)-1)),
    u_79_87 + v_79_87 <=s (const 64 (2**20)),
    u_79_87 - v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 + v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 - v_79_87 <=s (const 64 (2**20)),
    r_79_87 + s_79_87 <=s (const 64 (2**20)),
    r_79_87 - s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 + s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 - s_79_87 <=s (const 64 (2**20)),
    u_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_79_87 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step87

// premise b
assume
g_59_low60_20_low20_8 = 1 (mod 2)
&&
g_59_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_9 f_59_low60_20_low20_8;
mov u_79_88 u_79_87;
mov v_79_88 v_79_87;

add g_59_low60_20_low20_9 g_59_low60_20_low20_8 f_59_low60_20_low20_8;
asr g_59_low60_20_low20_9 g_59_low60_20_low20_9 1;
add r_79_88 r_79_87 u_79_87;
asr r_79_88 r_79_88 1;
add s_79_88 s_79_87 v_79_87;
asr s_79_88 s_79_88 1;
assert
    true
&&
    f_59_low60_20_low20_9 = f_59_low60_20_low20_8,
    u_79_88 = u_79_87,
    v_79_88 = v_79_87,
    g_59_low60_20_low20_9 * (const 64 2) = g_59_low60_20_low20_8 + f_59_low60_20_low20_8,
    r_79_88 * (const 64 2) = r_79_87 + u_79_87,
    s_79_88 * (const 64 2) = s_79_87 + v_79_87
;

assume
    f_59_low60_20_low20_9 = f_59_low60_20_low20_8,
    u_79_88 = u_79_87,
    v_79_88 = v_79_87,
    g_59_low60_20_low20_9 * 2 = g_59_low60_20_low20_8 + f_59_low60_20_low20_8,
    r_79_88 * 2 = r_79_87 + u_79_87,
    s_79_88 * 2 = s_79_87 + v_79_87
&&
    true
;

{
    u_79_88 * f_59_low60_20_low20_0 + v_79_88 * g_59_low60_20_low20_0 = f_59_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_88 * f_59_low60_20_low20_0 + s_79_88 * g_59_low60_20_low20_0 = g_59_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_9 + u_79_88 * (const 64 (2**21)) + v_79_88 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_9 + r_79_88 * (const 64 (2**21)) + s_79_88 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_9,
    f_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_9,
    g_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 88)) <=s delta, delta <=s (const 64 (1 + 2*88)),
    (const 64 (-(2**20))) <=s u_79_88, u_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_88, v_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_88, r_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_88, s_79_88 <=s (const 64 ((2**20)-1)),
    u_79_88 + v_79_88 <=s (const 64 (2**20)),
    u_79_88 - v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 + v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 - v_79_88 <=s (const 64 (2**20)),
    r_79_88 + s_79_88 <=s (const 64 (2**20)),
    r_79_88 - s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 + s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 - s_79_88 <=s (const 64 (2**20)),
    u_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_79_88 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_087_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_8,
sint64 g_59_low60_20_low20_8,
sint64 f_59_low60_20_low20_9,
sint64 g_59_low60_20_low20_9,
sint64 u_79_87,
sint64 v_79_87,
sint64 r_79_87,
sint64 s_79_87,
sint64 u_79_88,
sint64 v_79_88,
sint64 r_79_88,
sint64 s_79_88,
bit ne
)={
    u_79_87 * f_59_low60_20_low20_0 + v_79_87 * g_59_low60_20_low20_0 = f_59_low60_20_low20_8 * (-(2**20)),
    r_79_87 * f_59_low60_20_low20_0 + s_79_87 * g_59_low60_20_low20_0 = g_59_low60_20_low20_8 * (-(2**20))
&&
    u_79_87 * f_59_low60_20_low20_0 + v_79_87 * g_59_low60_20_low20_0 = f_59_low60_20_low20_8 * (const 64 (-(2**20))),
    r_79_87 * f_59_low60_20_low20_0 + s_79_87 * g_59_low60_20_low20_0 = g_59_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_8 + u_79_87 * (const 64 (2**21)) + v_79_87 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_8 + r_79_87 * (const 64 (2**21)) + s_79_87 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_8,
    f_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_8,
    g_59_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 87)) <=s delta, delta <=s (const 64 (1 + 2*87)),
    (const 64 (-(2**20))) <=s u_79_87, u_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_87, v_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_87, r_79_87 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_87, s_79_87 <=s (const 64 ((2**20)-1)),
    u_79_87 + v_79_87 <=s (const 64 (2**20)),
    u_79_87 - v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 + v_79_87 <=s (const 64 (2**20)),
    (const 64 0) - u_79_87 - v_79_87 <=s (const 64 (2**20)),
    r_79_87 + s_79_87 <=s (const 64 (2**20)),
    r_79_87 - s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 + s_79_87 <=s (const 64 (2**20)),
    (const 64 0) - r_79_87 - s_79_87 <=s (const 64 (2**20)),
    u_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_79_87 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_79_87 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step87

// premise c
assume
g_59_low60_20_low20_8 = 1 (mod 2)
&&
g_59_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_9 g_59_low60_20_low20_8;
mov u_79_88 r_79_87;
mov v_79_88 s_79_87;

subs dc g_59_low60_20_low20_9 g_59_low60_20_low20_8 f_59_low60_20_low20_8;
asr g_59_low60_20_low20_9 g_59_low60_20_low20_9 1;
subs dc r_79_88 r_79_87 u_79_87;
asr r_79_88 r_79_88 1;
subs dc s_79_88 s_79_87 v_79_87;
asr s_79_88 s_79_88 1;
assert
    true
&&
    f_59_low60_20_low20_9 = g_59_low60_20_low20_8,
    u_79_88 = r_79_87,
    v_79_88 = s_79_87,
    g_59_low60_20_low20_9 * (const 64 2) = g_59_low60_20_low20_8 - f_59_low60_20_low20_8,
    r_79_88 * (const 64 2) = r_79_87 - u_79_87,
    s_79_88 * (const 64 2) = s_79_87 - v_79_87
;

assume
    f_59_low60_20_low20_9 = g_59_low60_20_low20_8,
    u_79_88 = r_79_87,
    v_79_88 = s_79_87,
    g_59_low60_20_low20_9 * 2 = g_59_low60_20_low20_8 - f_59_low60_20_low20_8,
    r_79_88 * 2 = r_79_87 - u_79_87,
    s_79_88 * 2 = s_79_87 - v_79_87
&&
    true
;

{
    u_79_88 * f_59_low60_20_low20_0 + v_79_88 * g_59_low60_20_low20_0 = f_59_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_88 * f_59_low60_20_low20_0 + s_79_88 * g_59_low60_20_low20_0 = g_59_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_9 + u_79_88 * (const 64 (2**21)) + v_79_88 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_9 + r_79_88 * (const 64 (2**21)) + s_79_88 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_9,
    f_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_9,
    g_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 88)) <=s delta, delta <=s (const 64 (1 + 2*88)),
    (const 64 (-(2**20))) <=s u_79_88, u_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_88, v_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_88, r_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_88, s_79_88 <=s (const 64 ((2**20)-1)),
    u_79_88 + v_79_88 <=s (const 64 (2**20)),
    u_79_88 - v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 + v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 - v_79_88 <=s (const 64 (2**20)),
    r_79_88 + s_79_88 <=s (const 64 (2**20)),
    r_79_88 - s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 + s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 - s_79_88 <=s (const 64 (2**20)),
    u_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_79_88 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_088_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_9,
sint64 g_59_low60_20_low20_9,
sint64 f_59_low60_20_low20_10,
sint64 g_59_low60_20_low20_10,
sint64 u_79_88,
sint64 v_79_88,
sint64 r_79_88,
sint64 s_79_88,
sint64 u_79_89,
sint64 v_79_89,
sint64 r_79_89,
sint64 s_79_89,
bit ne
)={
    u_79_88 * f_59_low60_20_low20_0 + v_79_88 * g_59_low60_20_low20_0 = f_59_low60_20_low20_9 * (-(2**20)),
    r_79_88 * f_59_low60_20_low20_0 + s_79_88 * g_59_low60_20_low20_0 = g_59_low60_20_low20_9 * (-(2**20))
&&
    u_79_88 * f_59_low60_20_low20_0 + v_79_88 * g_59_low60_20_low20_0 = f_59_low60_20_low20_9 * (const 64 (-(2**20))),
    r_79_88 * f_59_low60_20_low20_0 + s_79_88 * g_59_low60_20_low20_0 = g_59_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_9 + u_79_88 * (const 64 (2**21)) + v_79_88 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_9 + r_79_88 * (const 64 (2**21)) + s_79_88 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_9,
    f_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_9,
    g_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 88)) <=s delta, delta <=s (const 64 (1 + 2*88)),
    (const 64 (-(2**20))) <=s u_79_88, u_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_88, v_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_88, r_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_88, s_79_88 <=s (const 64 ((2**20)-1)),
    u_79_88 + v_79_88 <=s (const 64 (2**20)),
    u_79_88 - v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 + v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 - v_79_88 <=s (const 64 (2**20)),
    r_79_88 + s_79_88 <=s (const 64 (2**20)),
    r_79_88 - s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 + s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 - s_79_88 <=s (const 64 (2**20)),
    u_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_79_88 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step88

// premise a
assume
g_59_low60_20_low20_9 = 0 (mod 2)
&&
g_59_low60_20_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_10 f_59_low60_20_low20_9;
mov u_79_89 u_79_88;
mov v_79_89 v_79_88;

asr g_59_low60_20_low20_10 g_59_low60_20_low20_9 1;
asr r_79_89 r_79_88 1;
asr s_79_89 s_79_88 1;
assert
    true
&&
    f_59_low60_20_low20_10 = f_59_low60_20_low20_9,
    u_79_89 = u_79_88,
    v_79_89 = v_79_88,
    g_59_low60_20_low20_10 * (const 64 2) = g_59_low60_20_low20_9,
    r_79_89 * (const 64 2) = r_79_88,
    s_79_89 * (const 64 2) = s_79_88
;

assume
    f_59_low60_20_low20_10 = f_59_low60_20_low20_9,
    u_79_89 = u_79_88,
    v_79_89 = v_79_88,
    g_59_low60_20_low20_10 * 2 = g_59_low60_20_low20_9,
    r_79_89 * 2 = r_79_88,
    s_79_89 * 2 = s_79_88
&&
    true
;

{
    u_79_89 * f_59_low60_20_low20_0 + v_79_89 * g_59_low60_20_low20_0 = f_59_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_89 * f_59_low60_20_low20_0 + s_79_89 * g_59_low60_20_low20_0 = g_59_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_10 + u_79_89 * (const 64 (2**21)) + v_79_89 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_10 + r_79_89 * (const 64 (2**21)) + s_79_89 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_10,
    f_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_10,
    g_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 89)) <=s delta, delta <=s (const 64 (1 + 2*89)),
    (const 64 (-(2**20))) <=s u_79_89, u_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_89, v_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_89, r_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_89, s_79_89 <=s (const 64 ((2**20)-1)),
    u_79_89 + v_79_89 <=s (const 64 (2**20)),
    u_79_89 - v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 + v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 - v_79_89 <=s (const 64 (2**20)),
    r_79_89 + s_79_89 <=s (const 64 (2**20)),
    r_79_89 - s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 + s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 - s_79_89 <=s (const 64 (2**20)),
    u_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_79_89 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_088_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_9,
sint64 g_59_low60_20_low20_9,
sint64 f_59_low60_20_low20_10,
sint64 g_59_low60_20_low20_10,
sint64 u_79_88,
sint64 v_79_88,
sint64 r_79_88,
sint64 s_79_88,
sint64 u_79_89,
sint64 v_79_89,
sint64 r_79_89,
sint64 s_79_89,
bit ne
)={
    u_79_88 * f_59_low60_20_low20_0 + v_79_88 * g_59_low60_20_low20_0 = f_59_low60_20_low20_9 * (-(2**20)),
    r_79_88 * f_59_low60_20_low20_0 + s_79_88 * g_59_low60_20_low20_0 = g_59_low60_20_low20_9 * (-(2**20))
&&
    u_79_88 * f_59_low60_20_low20_0 + v_79_88 * g_59_low60_20_low20_0 = f_59_low60_20_low20_9 * (const 64 (-(2**20))),
    r_79_88 * f_59_low60_20_low20_0 + s_79_88 * g_59_low60_20_low20_0 = g_59_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_9 + u_79_88 * (const 64 (2**21)) + v_79_88 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_9 + r_79_88 * (const 64 (2**21)) + s_79_88 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_9,
    f_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_9,
    g_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 88)) <=s delta, delta <=s (const 64 (1 + 2*88)),
    (const 64 (-(2**20))) <=s u_79_88, u_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_88, v_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_88, r_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_88, s_79_88 <=s (const 64 ((2**20)-1)),
    u_79_88 + v_79_88 <=s (const 64 (2**20)),
    u_79_88 - v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 + v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 - v_79_88 <=s (const 64 (2**20)),
    r_79_88 + s_79_88 <=s (const 64 (2**20)),
    r_79_88 - s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 + s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 - s_79_88 <=s (const 64 (2**20)),
    u_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_79_88 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step88

// premise b
assume
g_59_low60_20_low20_9 = 1 (mod 2)
&&
g_59_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_10 f_59_low60_20_low20_9;
mov u_79_89 u_79_88;
mov v_79_89 v_79_88;

add g_59_low60_20_low20_10 g_59_low60_20_low20_9 f_59_low60_20_low20_9;
asr g_59_low60_20_low20_10 g_59_low60_20_low20_10 1;
add r_79_89 r_79_88 u_79_88;
asr r_79_89 r_79_89 1;
add s_79_89 s_79_88 v_79_88;
asr s_79_89 s_79_89 1;
assert
    true
&&
    f_59_low60_20_low20_10 = f_59_low60_20_low20_9,
    u_79_89 = u_79_88,
    v_79_89 = v_79_88,
    g_59_low60_20_low20_10 * (const 64 2) = g_59_low60_20_low20_9 + f_59_low60_20_low20_9,
    r_79_89 * (const 64 2) = r_79_88 + u_79_88,
    s_79_89 * (const 64 2) = s_79_88 + v_79_88
;

assume
    f_59_low60_20_low20_10 = f_59_low60_20_low20_9,
    u_79_89 = u_79_88,
    v_79_89 = v_79_88,
    g_59_low60_20_low20_10 * 2 = g_59_low60_20_low20_9 + f_59_low60_20_low20_9,
    r_79_89 * 2 = r_79_88 + u_79_88,
    s_79_89 * 2 = s_79_88 + v_79_88
&&
    true
;

{
    u_79_89 * f_59_low60_20_low20_0 + v_79_89 * g_59_low60_20_low20_0 = f_59_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_89 * f_59_low60_20_low20_0 + s_79_89 * g_59_low60_20_low20_0 = g_59_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_10 + u_79_89 * (const 64 (2**21)) + v_79_89 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_10 + r_79_89 * (const 64 (2**21)) + s_79_89 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_10,
    f_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_10,
    g_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 89)) <=s delta, delta <=s (const 64 (1 + 2*89)),
    (const 64 (-(2**20))) <=s u_79_89, u_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_89, v_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_89, r_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_89, s_79_89 <=s (const 64 ((2**20)-1)),
    u_79_89 + v_79_89 <=s (const 64 (2**20)),
    u_79_89 - v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 + v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 - v_79_89 <=s (const 64 (2**20)),
    r_79_89 + s_79_89 <=s (const 64 (2**20)),
    r_79_89 - s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 + s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 - s_79_89 <=s (const 64 (2**20)),
    u_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_79_89 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_088_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_9,
sint64 g_59_low60_20_low20_9,
sint64 f_59_low60_20_low20_10,
sint64 g_59_low60_20_low20_10,
sint64 u_79_88,
sint64 v_79_88,
sint64 r_79_88,
sint64 s_79_88,
sint64 u_79_89,
sint64 v_79_89,
sint64 r_79_89,
sint64 s_79_89,
bit ne
)={
    u_79_88 * f_59_low60_20_low20_0 + v_79_88 * g_59_low60_20_low20_0 = f_59_low60_20_low20_9 * (-(2**20)),
    r_79_88 * f_59_low60_20_low20_0 + s_79_88 * g_59_low60_20_low20_0 = g_59_low60_20_low20_9 * (-(2**20))
&&
    u_79_88 * f_59_low60_20_low20_0 + v_79_88 * g_59_low60_20_low20_0 = f_59_low60_20_low20_9 * (const 64 (-(2**20))),
    r_79_88 * f_59_low60_20_low20_0 + s_79_88 * g_59_low60_20_low20_0 = g_59_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_9 + u_79_88 * (const 64 (2**21)) + v_79_88 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_9 + r_79_88 * (const 64 (2**21)) + s_79_88 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_9,
    f_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_9,
    g_59_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 88)) <=s delta, delta <=s (const 64 (1 + 2*88)),
    (const 64 (-(2**20))) <=s u_79_88, u_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_88, v_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_88, r_79_88 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_88, s_79_88 <=s (const 64 ((2**20)-1)),
    u_79_88 + v_79_88 <=s (const 64 (2**20)),
    u_79_88 - v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 + v_79_88 <=s (const 64 (2**20)),
    (const 64 0) - u_79_88 - v_79_88 <=s (const 64 (2**20)),
    r_79_88 + s_79_88 <=s (const 64 (2**20)),
    r_79_88 - s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 + s_79_88 <=s (const 64 (2**20)),
    (const 64 0) - r_79_88 - s_79_88 <=s (const 64 (2**20)),
    u_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_79_88 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_79_88 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step88

// premise c
assume
g_59_low60_20_low20_9 = 1 (mod 2)
&&
g_59_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_10 g_59_low60_20_low20_9;
mov u_79_89 r_79_88;
mov v_79_89 s_79_88;

subs dc g_59_low60_20_low20_10 g_59_low60_20_low20_9 f_59_low60_20_low20_9;
asr g_59_low60_20_low20_10 g_59_low60_20_low20_10 1;
subs dc r_79_89 r_79_88 u_79_88;
asr r_79_89 r_79_89 1;
subs dc s_79_89 s_79_88 v_79_88;
asr s_79_89 s_79_89 1;
assert
    true
&&
    f_59_low60_20_low20_10 = g_59_low60_20_low20_9,
    u_79_89 = r_79_88,
    v_79_89 = s_79_88,
    g_59_low60_20_low20_10 * (const 64 2) = g_59_low60_20_low20_9 - f_59_low60_20_low20_9,
    r_79_89 * (const 64 2) = r_79_88 - u_79_88,
    s_79_89 * (const 64 2) = s_79_88 - v_79_88
;

assume
    f_59_low60_20_low20_10 = g_59_low60_20_low20_9,
    u_79_89 = r_79_88,
    v_79_89 = s_79_88,
    g_59_low60_20_low20_10 * 2 = g_59_low60_20_low20_9 - f_59_low60_20_low20_9,
    r_79_89 * 2 = r_79_88 - u_79_88,
    s_79_89 * 2 = s_79_88 - v_79_88
&&
    true
;

{
    u_79_89 * f_59_low60_20_low20_0 + v_79_89 * g_59_low60_20_low20_0 = f_59_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_89 * f_59_low60_20_low20_0 + s_79_89 * g_59_low60_20_low20_0 = g_59_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_10 + u_79_89 * (const 64 (2**21)) + v_79_89 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_10 + r_79_89 * (const 64 (2**21)) + s_79_89 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_10,
    f_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_10,
    g_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 89)) <=s delta, delta <=s (const 64 (1 + 2*89)),
    (const 64 (-(2**20))) <=s u_79_89, u_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_89, v_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_89, r_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_89, s_79_89 <=s (const 64 ((2**20)-1)),
    u_79_89 + v_79_89 <=s (const 64 (2**20)),
    u_79_89 - v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 + v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 - v_79_89 <=s (const 64 (2**20)),
    r_79_89 + s_79_89 <=s (const 64 (2**20)),
    r_79_89 - s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 + s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 - s_79_89 <=s (const 64 (2**20)),
    u_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_79_89 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_089_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_10,
sint64 g_59_low60_20_low20_10,
sint64 f_59_low60_20_low20_11,
sint64 g_59_low60_20_low20_11,
sint64 u_79_89,
sint64 v_79_89,
sint64 r_79_89,
sint64 s_79_89,
sint64 u_79_90,
sint64 v_79_90,
sint64 r_79_90,
sint64 s_79_90,
bit ne
)={
    u_79_89 * f_59_low60_20_low20_0 + v_79_89 * g_59_low60_20_low20_0 = f_59_low60_20_low20_10 * (-(2**20)),
    r_79_89 * f_59_low60_20_low20_0 + s_79_89 * g_59_low60_20_low20_0 = g_59_low60_20_low20_10 * (-(2**20))
&&
    u_79_89 * f_59_low60_20_low20_0 + v_79_89 * g_59_low60_20_low20_0 = f_59_low60_20_low20_10 * (const 64 (-(2**20))),
    r_79_89 * f_59_low60_20_low20_0 + s_79_89 * g_59_low60_20_low20_0 = g_59_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_10 + u_79_89 * (const 64 (2**21)) + v_79_89 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_10 + r_79_89 * (const 64 (2**21)) + s_79_89 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_10,
    f_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_10,
    g_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 89)) <=s delta, delta <=s (const 64 (1 + 2*89)),
    (const 64 (-(2**20))) <=s u_79_89, u_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_89, v_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_89, r_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_89, s_79_89 <=s (const 64 ((2**20)-1)),
    u_79_89 + v_79_89 <=s (const 64 (2**20)),
    u_79_89 - v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 + v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 - v_79_89 <=s (const 64 (2**20)),
    r_79_89 + s_79_89 <=s (const 64 (2**20)),
    r_79_89 - s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 + s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 - s_79_89 <=s (const 64 (2**20)),
    u_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_79_89 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step89

// premise a
assume
g_59_low60_20_low20_10 = 0 (mod 2)
&&
g_59_low60_20_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_11 f_59_low60_20_low20_10;
mov u_79_90 u_79_89;
mov v_79_90 v_79_89;

asr g_59_low60_20_low20_11 g_59_low60_20_low20_10 1;
asr r_79_90 r_79_89 1;
asr s_79_90 s_79_89 1;
assert
    true
&&
    f_59_low60_20_low20_11 = f_59_low60_20_low20_10,
    u_79_90 = u_79_89,
    v_79_90 = v_79_89,
    g_59_low60_20_low20_11 * (const 64 2) = g_59_low60_20_low20_10,
    r_79_90 * (const 64 2) = r_79_89,
    s_79_90 * (const 64 2) = s_79_89
;

assume
    f_59_low60_20_low20_11 = f_59_low60_20_low20_10,
    u_79_90 = u_79_89,
    v_79_90 = v_79_89,
    g_59_low60_20_low20_11 * 2 = g_59_low60_20_low20_10,
    r_79_90 * 2 = r_79_89,
    s_79_90 * 2 = s_79_89
&&
    true
;

{
    u_79_90 * f_59_low60_20_low20_0 + v_79_90 * g_59_low60_20_low20_0 = f_59_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_90 * f_59_low60_20_low20_0 + s_79_90 * g_59_low60_20_low20_0 = g_59_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_11 + u_79_90 * (const 64 (2**21)) + v_79_90 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_11 + r_79_90 * (const 64 (2**21)) + s_79_90 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_11,
    f_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_11,
    g_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 90)) <=s delta, delta <=s (const 64 (1 + 2*90)),
    (const 64 (-(2**20))) <=s u_79_90, u_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_90, v_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_90, r_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_90, s_79_90 <=s (const 64 ((2**20)-1)),
    u_79_90 + v_79_90 <=s (const 64 (2**20)),
    u_79_90 - v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 + v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 - v_79_90 <=s (const 64 (2**20)),
    r_79_90 + s_79_90 <=s (const 64 (2**20)),
    r_79_90 - s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 + s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 - s_79_90 <=s (const 64 (2**20)),
    u_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_79_90 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_089_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_10,
sint64 g_59_low60_20_low20_10,
sint64 f_59_low60_20_low20_11,
sint64 g_59_low60_20_low20_11,
sint64 u_79_89,
sint64 v_79_89,
sint64 r_79_89,
sint64 s_79_89,
sint64 u_79_90,
sint64 v_79_90,
sint64 r_79_90,
sint64 s_79_90,
bit ne
)={
    u_79_89 * f_59_low60_20_low20_0 + v_79_89 * g_59_low60_20_low20_0 = f_59_low60_20_low20_10 * (-(2**20)),
    r_79_89 * f_59_low60_20_low20_0 + s_79_89 * g_59_low60_20_low20_0 = g_59_low60_20_low20_10 * (-(2**20))
&&
    u_79_89 * f_59_low60_20_low20_0 + v_79_89 * g_59_low60_20_low20_0 = f_59_low60_20_low20_10 * (const 64 (-(2**20))),
    r_79_89 * f_59_low60_20_low20_0 + s_79_89 * g_59_low60_20_low20_0 = g_59_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_10 + u_79_89 * (const 64 (2**21)) + v_79_89 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_10 + r_79_89 * (const 64 (2**21)) + s_79_89 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_10,
    f_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_10,
    g_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 89)) <=s delta, delta <=s (const 64 (1 + 2*89)),
    (const 64 (-(2**20))) <=s u_79_89, u_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_89, v_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_89, r_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_89, s_79_89 <=s (const 64 ((2**20)-1)),
    u_79_89 + v_79_89 <=s (const 64 (2**20)),
    u_79_89 - v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 + v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 - v_79_89 <=s (const 64 (2**20)),
    r_79_89 + s_79_89 <=s (const 64 (2**20)),
    r_79_89 - s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 + s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 - s_79_89 <=s (const 64 (2**20)),
    u_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_79_89 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step89

// premise b
assume
g_59_low60_20_low20_10 = 1 (mod 2)
&&
g_59_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_11 f_59_low60_20_low20_10;
mov u_79_90 u_79_89;
mov v_79_90 v_79_89;

add g_59_low60_20_low20_11 g_59_low60_20_low20_10 f_59_low60_20_low20_10;
asr g_59_low60_20_low20_11 g_59_low60_20_low20_11 1;
add r_79_90 r_79_89 u_79_89;
asr r_79_90 r_79_90 1;
add s_79_90 s_79_89 v_79_89;
asr s_79_90 s_79_90 1;
assert
    true
&&
    f_59_low60_20_low20_11 = f_59_low60_20_low20_10,
    u_79_90 = u_79_89,
    v_79_90 = v_79_89,
    g_59_low60_20_low20_11 * (const 64 2) = g_59_low60_20_low20_10 + f_59_low60_20_low20_10,
    r_79_90 * (const 64 2) = r_79_89 + u_79_89,
    s_79_90 * (const 64 2) = s_79_89 + v_79_89
;

assume
    f_59_low60_20_low20_11 = f_59_low60_20_low20_10,
    u_79_90 = u_79_89,
    v_79_90 = v_79_89,
    g_59_low60_20_low20_11 * 2 = g_59_low60_20_low20_10 + f_59_low60_20_low20_10,
    r_79_90 * 2 = r_79_89 + u_79_89,
    s_79_90 * 2 = s_79_89 + v_79_89
&&
    true
;

{
    u_79_90 * f_59_low60_20_low20_0 + v_79_90 * g_59_low60_20_low20_0 = f_59_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_90 * f_59_low60_20_low20_0 + s_79_90 * g_59_low60_20_low20_0 = g_59_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_11 + u_79_90 * (const 64 (2**21)) + v_79_90 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_11 + r_79_90 * (const 64 (2**21)) + s_79_90 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_11,
    f_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_11,
    g_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 90)) <=s delta, delta <=s (const 64 (1 + 2*90)),
    (const 64 (-(2**20))) <=s u_79_90, u_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_90, v_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_90, r_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_90, s_79_90 <=s (const 64 ((2**20)-1)),
    u_79_90 + v_79_90 <=s (const 64 (2**20)),
    u_79_90 - v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 + v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 - v_79_90 <=s (const 64 (2**20)),
    r_79_90 + s_79_90 <=s (const 64 (2**20)),
    r_79_90 - s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 + s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 - s_79_90 <=s (const 64 (2**20)),
    u_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_79_90 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_089_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_10,
sint64 g_59_low60_20_low20_10,
sint64 f_59_low60_20_low20_11,
sint64 g_59_low60_20_low20_11,
sint64 u_79_89,
sint64 v_79_89,
sint64 r_79_89,
sint64 s_79_89,
sint64 u_79_90,
sint64 v_79_90,
sint64 r_79_90,
sint64 s_79_90,
bit ne
)={
    u_79_89 * f_59_low60_20_low20_0 + v_79_89 * g_59_low60_20_low20_0 = f_59_low60_20_low20_10 * (-(2**20)),
    r_79_89 * f_59_low60_20_low20_0 + s_79_89 * g_59_low60_20_low20_0 = g_59_low60_20_low20_10 * (-(2**20))
&&
    u_79_89 * f_59_low60_20_low20_0 + v_79_89 * g_59_low60_20_low20_0 = f_59_low60_20_low20_10 * (const 64 (-(2**20))),
    r_79_89 * f_59_low60_20_low20_0 + s_79_89 * g_59_low60_20_low20_0 = g_59_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_10 + u_79_89 * (const 64 (2**21)) + v_79_89 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_10 + r_79_89 * (const 64 (2**21)) + s_79_89 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_10,
    f_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_10,
    g_59_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 89)) <=s delta, delta <=s (const 64 (1 + 2*89)),
    (const 64 (-(2**20))) <=s u_79_89, u_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_89, v_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_89, r_79_89 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_89, s_79_89 <=s (const 64 ((2**20)-1)),
    u_79_89 + v_79_89 <=s (const 64 (2**20)),
    u_79_89 - v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 + v_79_89 <=s (const 64 (2**20)),
    (const 64 0) - u_79_89 - v_79_89 <=s (const 64 (2**20)),
    r_79_89 + s_79_89 <=s (const 64 (2**20)),
    r_79_89 - s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 + s_79_89 <=s (const 64 (2**20)),
    (const 64 0) - r_79_89 - s_79_89 <=s (const 64 (2**20)),
    u_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_79_89 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_79_89 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step89

// premise c
assume
g_59_low60_20_low20_10 = 1 (mod 2)
&&
g_59_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_11 g_59_low60_20_low20_10;
mov u_79_90 r_79_89;
mov v_79_90 s_79_89;

subs dc g_59_low60_20_low20_11 g_59_low60_20_low20_10 f_59_low60_20_low20_10;
asr g_59_low60_20_low20_11 g_59_low60_20_low20_11 1;
subs dc r_79_90 r_79_89 u_79_89;
asr r_79_90 r_79_90 1;
subs dc s_79_90 s_79_89 v_79_89;
asr s_79_90 s_79_90 1;
assert
    true
&&
    f_59_low60_20_low20_11 = g_59_low60_20_low20_10,
    u_79_90 = r_79_89,
    v_79_90 = s_79_89,
    g_59_low60_20_low20_11 * (const 64 2) = g_59_low60_20_low20_10 - f_59_low60_20_low20_10,
    r_79_90 * (const 64 2) = r_79_89 - u_79_89,
    s_79_90 * (const 64 2) = s_79_89 - v_79_89
;

assume
    f_59_low60_20_low20_11 = g_59_low60_20_low20_10,
    u_79_90 = r_79_89,
    v_79_90 = s_79_89,
    g_59_low60_20_low20_11 * 2 = g_59_low60_20_low20_10 - f_59_low60_20_low20_10,
    r_79_90 * 2 = r_79_89 - u_79_89,
    s_79_90 * 2 = s_79_89 - v_79_89
&&
    true
;

{
    u_79_90 * f_59_low60_20_low20_0 + v_79_90 * g_59_low60_20_low20_0 = f_59_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_90 * f_59_low60_20_low20_0 + s_79_90 * g_59_low60_20_low20_0 = g_59_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_11 + u_79_90 * (const 64 (2**21)) + v_79_90 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_11 + r_79_90 * (const 64 (2**21)) + s_79_90 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_11,
    f_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_11,
    g_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 90)) <=s delta, delta <=s (const 64 (1 + 2*90)),
    (const 64 (-(2**20))) <=s u_79_90, u_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_90, v_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_90, r_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_90, s_79_90 <=s (const 64 ((2**20)-1)),
    u_79_90 + v_79_90 <=s (const 64 (2**20)),
    u_79_90 - v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 + v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 - v_79_90 <=s (const 64 (2**20)),
    r_79_90 + s_79_90 <=s (const 64 (2**20)),
    r_79_90 - s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 + s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 - s_79_90 <=s (const 64 (2**20)),
    u_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_79_90 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_090_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_11,
sint64 g_59_low60_20_low20_11,
sint64 f_59_low60_20_low20_12,
sint64 g_59_low60_20_low20_12,
sint64 u_79_90,
sint64 v_79_90,
sint64 r_79_90,
sint64 s_79_90,
sint64 u_79_91,
sint64 v_79_91,
sint64 r_79_91,
sint64 s_79_91,
bit ne
)={
    u_79_90 * f_59_low60_20_low20_0 + v_79_90 * g_59_low60_20_low20_0 = f_59_low60_20_low20_11 * (-(2**20)),
    r_79_90 * f_59_low60_20_low20_0 + s_79_90 * g_59_low60_20_low20_0 = g_59_low60_20_low20_11 * (-(2**20))
&&
    u_79_90 * f_59_low60_20_low20_0 + v_79_90 * g_59_low60_20_low20_0 = f_59_low60_20_low20_11 * (const 64 (-(2**20))),
    r_79_90 * f_59_low60_20_low20_0 + s_79_90 * g_59_low60_20_low20_0 = g_59_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_11 + u_79_90 * (const 64 (2**21)) + v_79_90 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_11 + r_79_90 * (const 64 (2**21)) + s_79_90 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_11,
    f_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_11,
    g_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 90)) <=s delta, delta <=s (const 64 (1 + 2*90)),
    (const 64 (-(2**20))) <=s u_79_90, u_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_90, v_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_90, r_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_90, s_79_90 <=s (const 64 ((2**20)-1)),
    u_79_90 + v_79_90 <=s (const 64 (2**20)),
    u_79_90 - v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 + v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 - v_79_90 <=s (const 64 (2**20)),
    r_79_90 + s_79_90 <=s (const 64 (2**20)),
    r_79_90 - s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 + s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 - s_79_90 <=s (const 64 (2**20)),
    u_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_79_90 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step90

// premise a
assume
g_59_low60_20_low20_11 = 0 (mod 2)
&&
g_59_low60_20_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_12 f_59_low60_20_low20_11;
mov u_79_91 u_79_90;
mov v_79_91 v_79_90;

asr g_59_low60_20_low20_12 g_59_low60_20_low20_11 1;
asr r_79_91 r_79_90 1;
asr s_79_91 s_79_90 1;
assert
    true
&&
    f_59_low60_20_low20_12 = f_59_low60_20_low20_11,
    u_79_91 = u_79_90,
    v_79_91 = v_79_90,
    g_59_low60_20_low20_12 * (const 64 2) = g_59_low60_20_low20_11,
    r_79_91 * (const 64 2) = r_79_90,
    s_79_91 * (const 64 2) = s_79_90
;

assume
    f_59_low60_20_low20_12 = f_59_low60_20_low20_11,
    u_79_91 = u_79_90,
    v_79_91 = v_79_90,
    g_59_low60_20_low20_12 * 2 = g_59_low60_20_low20_11,
    r_79_91 * 2 = r_79_90,
    s_79_91 * 2 = s_79_90
&&
    true
;

{
    u_79_91 * f_59_low60_20_low20_0 + v_79_91 * g_59_low60_20_low20_0 = f_59_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_91 * f_59_low60_20_low20_0 + s_79_91 * g_59_low60_20_low20_0 = g_59_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_12 + u_79_91 * (const 64 (2**21)) + v_79_91 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_12 + r_79_91 * (const 64 (2**21)) + s_79_91 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_12,
    f_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_12,
    g_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 91)) <=s delta, delta <=s (const 64 (1 + 2*91)),
    (const 64 (-(2**20))) <=s u_79_91, u_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_91, v_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_91, r_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_91, s_79_91 <=s (const 64 ((2**20)-1)),
    u_79_91 + v_79_91 <=s (const 64 (2**20)),
    u_79_91 - v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 + v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 - v_79_91 <=s (const 64 (2**20)),
    r_79_91 + s_79_91 <=s (const 64 (2**20)),
    r_79_91 - s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 + s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 - s_79_91 <=s (const 64 (2**20)),
    u_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_79_91 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_090_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_11,
sint64 g_59_low60_20_low20_11,
sint64 f_59_low60_20_low20_12,
sint64 g_59_low60_20_low20_12,
sint64 u_79_90,
sint64 v_79_90,
sint64 r_79_90,
sint64 s_79_90,
sint64 u_79_91,
sint64 v_79_91,
sint64 r_79_91,
sint64 s_79_91,
bit ne
)={
    u_79_90 * f_59_low60_20_low20_0 + v_79_90 * g_59_low60_20_low20_0 = f_59_low60_20_low20_11 * (-(2**20)),
    r_79_90 * f_59_low60_20_low20_0 + s_79_90 * g_59_low60_20_low20_0 = g_59_low60_20_low20_11 * (-(2**20))
&&
    u_79_90 * f_59_low60_20_low20_0 + v_79_90 * g_59_low60_20_low20_0 = f_59_low60_20_low20_11 * (const 64 (-(2**20))),
    r_79_90 * f_59_low60_20_low20_0 + s_79_90 * g_59_low60_20_low20_0 = g_59_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_11 + u_79_90 * (const 64 (2**21)) + v_79_90 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_11 + r_79_90 * (const 64 (2**21)) + s_79_90 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_11,
    f_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_11,
    g_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 90)) <=s delta, delta <=s (const 64 (1 + 2*90)),
    (const 64 (-(2**20))) <=s u_79_90, u_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_90, v_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_90, r_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_90, s_79_90 <=s (const 64 ((2**20)-1)),
    u_79_90 + v_79_90 <=s (const 64 (2**20)),
    u_79_90 - v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 + v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 - v_79_90 <=s (const 64 (2**20)),
    r_79_90 + s_79_90 <=s (const 64 (2**20)),
    r_79_90 - s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 + s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 - s_79_90 <=s (const 64 (2**20)),
    u_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_79_90 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step90

// premise b
assume
g_59_low60_20_low20_11 = 1 (mod 2)
&&
g_59_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_12 f_59_low60_20_low20_11;
mov u_79_91 u_79_90;
mov v_79_91 v_79_90;

add g_59_low60_20_low20_12 g_59_low60_20_low20_11 f_59_low60_20_low20_11;
asr g_59_low60_20_low20_12 g_59_low60_20_low20_12 1;
add r_79_91 r_79_90 u_79_90;
asr r_79_91 r_79_91 1;
add s_79_91 s_79_90 v_79_90;
asr s_79_91 s_79_91 1;
assert
    true
&&
    f_59_low60_20_low20_12 = f_59_low60_20_low20_11,
    u_79_91 = u_79_90,
    v_79_91 = v_79_90,
    g_59_low60_20_low20_12 * (const 64 2) = g_59_low60_20_low20_11 + f_59_low60_20_low20_11,
    r_79_91 * (const 64 2) = r_79_90 + u_79_90,
    s_79_91 * (const 64 2) = s_79_90 + v_79_90
;

assume
    f_59_low60_20_low20_12 = f_59_low60_20_low20_11,
    u_79_91 = u_79_90,
    v_79_91 = v_79_90,
    g_59_low60_20_low20_12 * 2 = g_59_low60_20_low20_11 + f_59_low60_20_low20_11,
    r_79_91 * 2 = r_79_90 + u_79_90,
    s_79_91 * 2 = s_79_90 + v_79_90
&&
    true
;

{
    u_79_91 * f_59_low60_20_low20_0 + v_79_91 * g_59_low60_20_low20_0 = f_59_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_91 * f_59_low60_20_low20_0 + s_79_91 * g_59_low60_20_low20_0 = g_59_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_12 + u_79_91 * (const 64 (2**21)) + v_79_91 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_12 + r_79_91 * (const 64 (2**21)) + s_79_91 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_12,
    f_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_12,
    g_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 91)) <=s delta, delta <=s (const 64 (1 + 2*91)),
    (const 64 (-(2**20))) <=s u_79_91, u_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_91, v_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_91, r_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_91, s_79_91 <=s (const 64 ((2**20)-1)),
    u_79_91 + v_79_91 <=s (const 64 (2**20)),
    u_79_91 - v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 + v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 - v_79_91 <=s (const 64 (2**20)),
    r_79_91 + s_79_91 <=s (const 64 (2**20)),
    r_79_91 - s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 + s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 - s_79_91 <=s (const 64 (2**20)),
    u_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_79_91 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_090_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_11,
sint64 g_59_low60_20_low20_11,
sint64 f_59_low60_20_low20_12,
sint64 g_59_low60_20_low20_12,
sint64 u_79_90,
sint64 v_79_90,
sint64 r_79_90,
sint64 s_79_90,
sint64 u_79_91,
sint64 v_79_91,
sint64 r_79_91,
sint64 s_79_91,
bit ne
)={
    u_79_90 * f_59_low60_20_low20_0 + v_79_90 * g_59_low60_20_low20_0 = f_59_low60_20_low20_11 * (-(2**20)),
    r_79_90 * f_59_low60_20_low20_0 + s_79_90 * g_59_low60_20_low20_0 = g_59_low60_20_low20_11 * (-(2**20))
&&
    u_79_90 * f_59_low60_20_low20_0 + v_79_90 * g_59_low60_20_low20_0 = f_59_low60_20_low20_11 * (const 64 (-(2**20))),
    r_79_90 * f_59_low60_20_low20_0 + s_79_90 * g_59_low60_20_low20_0 = g_59_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_11 + u_79_90 * (const 64 (2**21)) + v_79_90 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_11 + r_79_90 * (const 64 (2**21)) + s_79_90 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_11,
    f_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_11,
    g_59_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 90)) <=s delta, delta <=s (const 64 (1 + 2*90)),
    (const 64 (-(2**20))) <=s u_79_90, u_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_90, v_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_90, r_79_90 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_90, s_79_90 <=s (const 64 ((2**20)-1)),
    u_79_90 + v_79_90 <=s (const 64 (2**20)),
    u_79_90 - v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 + v_79_90 <=s (const 64 (2**20)),
    (const 64 0) - u_79_90 - v_79_90 <=s (const 64 (2**20)),
    r_79_90 + s_79_90 <=s (const 64 (2**20)),
    r_79_90 - s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 + s_79_90 <=s (const 64 (2**20)),
    (const 64 0) - r_79_90 - s_79_90 <=s (const 64 (2**20)),
    u_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_79_90 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_79_90 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step90

// premise c
assume
g_59_low60_20_low20_11 = 1 (mod 2)
&&
g_59_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_12 g_59_low60_20_low20_11;
mov u_79_91 r_79_90;
mov v_79_91 s_79_90;

subs dc g_59_low60_20_low20_12 g_59_low60_20_low20_11 f_59_low60_20_low20_11;
asr g_59_low60_20_low20_12 g_59_low60_20_low20_12 1;
subs dc r_79_91 r_79_90 u_79_90;
asr r_79_91 r_79_91 1;
subs dc s_79_91 s_79_90 v_79_90;
asr s_79_91 s_79_91 1;
assert
    true
&&
    f_59_low60_20_low20_12 = g_59_low60_20_low20_11,
    u_79_91 = r_79_90,
    v_79_91 = s_79_90,
    g_59_low60_20_low20_12 * (const 64 2) = g_59_low60_20_low20_11 - f_59_low60_20_low20_11,
    r_79_91 * (const 64 2) = r_79_90 - u_79_90,
    s_79_91 * (const 64 2) = s_79_90 - v_79_90
;

assume
    f_59_low60_20_low20_12 = g_59_low60_20_low20_11,
    u_79_91 = r_79_90,
    v_79_91 = s_79_90,
    g_59_low60_20_low20_12 * 2 = g_59_low60_20_low20_11 - f_59_low60_20_low20_11,
    r_79_91 * 2 = r_79_90 - u_79_90,
    s_79_91 * 2 = s_79_90 - v_79_90
&&
    true
;

{
    u_79_91 * f_59_low60_20_low20_0 + v_79_91 * g_59_low60_20_low20_0 = f_59_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_91 * f_59_low60_20_low20_0 + s_79_91 * g_59_low60_20_low20_0 = g_59_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_12 + u_79_91 * (const 64 (2**21)) + v_79_91 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_12 + r_79_91 * (const 64 (2**21)) + s_79_91 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_12,
    f_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_12,
    g_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 91)) <=s delta, delta <=s (const 64 (1 + 2*91)),
    (const 64 (-(2**20))) <=s u_79_91, u_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_91, v_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_91, r_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_91, s_79_91 <=s (const 64 ((2**20)-1)),
    u_79_91 + v_79_91 <=s (const 64 (2**20)),
    u_79_91 - v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 + v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 - v_79_91 <=s (const 64 (2**20)),
    r_79_91 + s_79_91 <=s (const 64 (2**20)),
    r_79_91 - s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 + s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 - s_79_91 <=s (const 64 (2**20)),
    u_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_79_91 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_091_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_12,
sint64 g_59_low60_20_low20_12,
sint64 f_59_low60_20_low20_13,
sint64 g_59_low60_20_low20_13,
sint64 u_79_91,
sint64 v_79_91,
sint64 r_79_91,
sint64 s_79_91,
sint64 u_79_92,
sint64 v_79_92,
sint64 r_79_92,
sint64 s_79_92,
bit ne
)={
    u_79_91 * f_59_low60_20_low20_0 + v_79_91 * g_59_low60_20_low20_0 = f_59_low60_20_low20_12 * (-(2**20)),
    r_79_91 * f_59_low60_20_low20_0 + s_79_91 * g_59_low60_20_low20_0 = g_59_low60_20_low20_12 * (-(2**20))
&&
    u_79_91 * f_59_low60_20_low20_0 + v_79_91 * g_59_low60_20_low20_0 = f_59_low60_20_low20_12 * (const 64 (-(2**20))),
    r_79_91 * f_59_low60_20_low20_0 + s_79_91 * g_59_low60_20_low20_0 = g_59_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_12 + u_79_91 * (const 64 (2**21)) + v_79_91 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_12 + r_79_91 * (const 64 (2**21)) + s_79_91 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_12,
    f_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_12,
    g_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 91)) <=s delta, delta <=s (const 64 (1 + 2*91)),
    (const 64 (-(2**20))) <=s u_79_91, u_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_91, v_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_91, r_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_91, s_79_91 <=s (const 64 ((2**20)-1)),
    u_79_91 + v_79_91 <=s (const 64 (2**20)),
    u_79_91 - v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 + v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 - v_79_91 <=s (const 64 (2**20)),
    r_79_91 + s_79_91 <=s (const 64 (2**20)),
    r_79_91 - s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 + s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 - s_79_91 <=s (const 64 (2**20)),
    u_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_79_91 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step91

// premise a
assume
g_59_low60_20_low20_12 = 0 (mod 2)
&&
g_59_low60_20_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_13 f_59_low60_20_low20_12;
mov u_79_92 u_79_91;
mov v_79_92 v_79_91;

asr g_59_low60_20_low20_13 g_59_low60_20_low20_12 1;
asr r_79_92 r_79_91 1;
asr s_79_92 s_79_91 1;
assert
    true
&&
    f_59_low60_20_low20_13 = f_59_low60_20_low20_12,
    u_79_92 = u_79_91,
    v_79_92 = v_79_91,
    g_59_low60_20_low20_13 * (const 64 2) = g_59_low60_20_low20_12,
    r_79_92 * (const 64 2) = r_79_91,
    s_79_92 * (const 64 2) = s_79_91
;

assume
    f_59_low60_20_low20_13 = f_59_low60_20_low20_12,
    u_79_92 = u_79_91,
    v_79_92 = v_79_91,
    g_59_low60_20_low20_13 * 2 = g_59_low60_20_low20_12,
    r_79_92 * 2 = r_79_91,
    s_79_92 * 2 = s_79_91
&&
    true
;

{
    u_79_92 * f_59_low60_20_low20_0 + v_79_92 * g_59_low60_20_low20_0 = f_59_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_92 * f_59_low60_20_low20_0 + s_79_92 * g_59_low60_20_low20_0 = g_59_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_13 + u_79_92 * (const 64 (2**21)) + v_79_92 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_13 + r_79_92 * (const 64 (2**21)) + s_79_92 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_13,
    f_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_13,
    g_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 92)) <=s delta, delta <=s (const 64 (1 + 2*92)),
    (const 64 (-(2**20))) <=s u_79_92, u_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_92, v_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_92, r_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_92, s_79_92 <=s (const 64 ((2**20)-1)),
    u_79_92 + v_79_92 <=s (const 64 (2**20)),
    u_79_92 - v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 + v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 - v_79_92 <=s (const 64 (2**20)),
    r_79_92 + s_79_92 <=s (const 64 (2**20)),
    r_79_92 - s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 + s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 - s_79_92 <=s (const 64 (2**20)),
    u_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_79_92 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_091_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_12,
sint64 g_59_low60_20_low20_12,
sint64 f_59_low60_20_low20_13,
sint64 g_59_low60_20_low20_13,
sint64 u_79_91,
sint64 v_79_91,
sint64 r_79_91,
sint64 s_79_91,
sint64 u_79_92,
sint64 v_79_92,
sint64 r_79_92,
sint64 s_79_92,
bit ne
)={
    u_79_91 * f_59_low60_20_low20_0 + v_79_91 * g_59_low60_20_low20_0 = f_59_low60_20_low20_12 * (-(2**20)),
    r_79_91 * f_59_low60_20_low20_0 + s_79_91 * g_59_low60_20_low20_0 = g_59_low60_20_low20_12 * (-(2**20))
&&
    u_79_91 * f_59_low60_20_low20_0 + v_79_91 * g_59_low60_20_low20_0 = f_59_low60_20_low20_12 * (const 64 (-(2**20))),
    r_79_91 * f_59_low60_20_low20_0 + s_79_91 * g_59_low60_20_low20_0 = g_59_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_12 + u_79_91 * (const 64 (2**21)) + v_79_91 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_12 + r_79_91 * (const 64 (2**21)) + s_79_91 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_12,
    f_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_12,
    g_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 91)) <=s delta, delta <=s (const 64 (1 + 2*91)),
    (const 64 (-(2**20))) <=s u_79_91, u_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_91, v_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_91, r_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_91, s_79_91 <=s (const 64 ((2**20)-1)),
    u_79_91 + v_79_91 <=s (const 64 (2**20)),
    u_79_91 - v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 + v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 - v_79_91 <=s (const 64 (2**20)),
    r_79_91 + s_79_91 <=s (const 64 (2**20)),
    r_79_91 - s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 + s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 - s_79_91 <=s (const 64 (2**20)),
    u_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_79_91 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step91

// premise b
assume
g_59_low60_20_low20_12 = 1 (mod 2)
&&
g_59_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_13 f_59_low60_20_low20_12;
mov u_79_92 u_79_91;
mov v_79_92 v_79_91;

add g_59_low60_20_low20_13 g_59_low60_20_low20_12 f_59_low60_20_low20_12;
asr g_59_low60_20_low20_13 g_59_low60_20_low20_13 1;
add r_79_92 r_79_91 u_79_91;
asr r_79_92 r_79_92 1;
add s_79_92 s_79_91 v_79_91;
asr s_79_92 s_79_92 1;
assert
    true
&&
    f_59_low60_20_low20_13 = f_59_low60_20_low20_12,
    u_79_92 = u_79_91,
    v_79_92 = v_79_91,
    g_59_low60_20_low20_13 * (const 64 2) = g_59_low60_20_low20_12 + f_59_low60_20_low20_12,
    r_79_92 * (const 64 2) = r_79_91 + u_79_91,
    s_79_92 * (const 64 2) = s_79_91 + v_79_91
;

assume
    f_59_low60_20_low20_13 = f_59_low60_20_low20_12,
    u_79_92 = u_79_91,
    v_79_92 = v_79_91,
    g_59_low60_20_low20_13 * 2 = g_59_low60_20_low20_12 + f_59_low60_20_low20_12,
    r_79_92 * 2 = r_79_91 + u_79_91,
    s_79_92 * 2 = s_79_91 + v_79_91
&&
    true
;

{
    u_79_92 * f_59_low60_20_low20_0 + v_79_92 * g_59_low60_20_low20_0 = f_59_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_92 * f_59_low60_20_low20_0 + s_79_92 * g_59_low60_20_low20_0 = g_59_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_13 + u_79_92 * (const 64 (2**21)) + v_79_92 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_13 + r_79_92 * (const 64 (2**21)) + s_79_92 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_13,
    f_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_13,
    g_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 92)) <=s delta, delta <=s (const 64 (1 + 2*92)),
    (const 64 (-(2**20))) <=s u_79_92, u_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_92, v_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_92, r_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_92, s_79_92 <=s (const 64 ((2**20)-1)),
    u_79_92 + v_79_92 <=s (const 64 (2**20)),
    u_79_92 - v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 + v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 - v_79_92 <=s (const 64 (2**20)),
    r_79_92 + s_79_92 <=s (const 64 (2**20)),
    r_79_92 - s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 + s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 - s_79_92 <=s (const 64 (2**20)),
    u_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_79_92 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_091_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_12,
sint64 g_59_low60_20_low20_12,
sint64 f_59_low60_20_low20_13,
sint64 g_59_low60_20_low20_13,
sint64 u_79_91,
sint64 v_79_91,
sint64 r_79_91,
sint64 s_79_91,
sint64 u_79_92,
sint64 v_79_92,
sint64 r_79_92,
sint64 s_79_92,
bit ne
)={
    u_79_91 * f_59_low60_20_low20_0 + v_79_91 * g_59_low60_20_low20_0 = f_59_low60_20_low20_12 * (-(2**20)),
    r_79_91 * f_59_low60_20_low20_0 + s_79_91 * g_59_low60_20_low20_0 = g_59_low60_20_low20_12 * (-(2**20))
&&
    u_79_91 * f_59_low60_20_low20_0 + v_79_91 * g_59_low60_20_low20_0 = f_59_low60_20_low20_12 * (const 64 (-(2**20))),
    r_79_91 * f_59_low60_20_low20_0 + s_79_91 * g_59_low60_20_low20_0 = g_59_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_12 + u_79_91 * (const 64 (2**21)) + v_79_91 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_12 + r_79_91 * (const 64 (2**21)) + s_79_91 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_12,
    f_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_12,
    g_59_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 91)) <=s delta, delta <=s (const 64 (1 + 2*91)),
    (const 64 (-(2**20))) <=s u_79_91, u_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_91, v_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_91, r_79_91 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_91, s_79_91 <=s (const 64 ((2**20)-1)),
    u_79_91 + v_79_91 <=s (const 64 (2**20)),
    u_79_91 - v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 + v_79_91 <=s (const 64 (2**20)),
    (const 64 0) - u_79_91 - v_79_91 <=s (const 64 (2**20)),
    r_79_91 + s_79_91 <=s (const 64 (2**20)),
    r_79_91 - s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 + s_79_91 <=s (const 64 (2**20)),
    (const 64 0) - r_79_91 - s_79_91 <=s (const 64 (2**20)),
    u_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_79_91 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_79_91 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step91

// premise c
assume
g_59_low60_20_low20_12 = 1 (mod 2)
&&
g_59_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_13 g_59_low60_20_low20_12;
mov u_79_92 r_79_91;
mov v_79_92 s_79_91;

subs dc g_59_low60_20_low20_13 g_59_low60_20_low20_12 f_59_low60_20_low20_12;
asr g_59_low60_20_low20_13 g_59_low60_20_low20_13 1;
subs dc r_79_92 r_79_91 u_79_91;
asr r_79_92 r_79_92 1;
subs dc s_79_92 s_79_91 v_79_91;
asr s_79_92 s_79_92 1;
assert
    true
&&
    f_59_low60_20_low20_13 = g_59_low60_20_low20_12,
    u_79_92 = r_79_91,
    v_79_92 = s_79_91,
    g_59_low60_20_low20_13 * (const 64 2) = g_59_low60_20_low20_12 - f_59_low60_20_low20_12,
    r_79_92 * (const 64 2) = r_79_91 - u_79_91,
    s_79_92 * (const 64 2) = s_79_91 - v_79_91
;

assume
    f_59_low60_20_low20_13 = g_59_low60_20_low20_12,
    u_79_92 = r_79_91,
    v_79_92 = s_79_91,
    g_59_low60_20_low20_13 * 2 = g_59_low60_20_low20_12 - f_59_low60_20_low20_12,
    r_79_92 * 2 = r_79_91 - u_79_91,
    s_79_92 * 2 = s_79_91 - v_79_91
&&
    true
;

{
    u_79_92 * f_59_low60_20_low20_0 + v_79_92 * g_59_low60_20_low20_0 = f_59_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_92 * f_59_low60_20_low20_0 + s_79_92 * g_59_low60_20_low20_0 = g_59_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_13 + u_79_92 * (const 64 (2**21)) + v_79_92 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_13 + r_79_92 * (const 64 (2**21)) + s_79_92 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_13,
    f_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_13,
    g_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 92)) <=s delta, delta <=s (const 64 (1 + 2*92)),
    (const 64 (-(2**20))) <=s u_79_92, u_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_92, v_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_92, r_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_92, s_79_92 <=s (const 64 ((2**20)-1)),
    u_79_92 + v_79_92 <=s (const 64 (2**20)),
    u_79_92 - v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 + v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 - v_79_92 <=s (const 64 (2**20)),
    r_79_92 + s_79_92 <=s (const 64 (2**20)),
    r_79_92 - s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 + s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 - s_79_92 <=s (const 64 (2**20)),
    u_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_79_92 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_092_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_13,
sint64 g_59_low60_20_low20_13,
sint64 f_59_low60_20_low20_14,
sint64 g_59_low60_20_low20_14,
sint64 u_79_92,
sint64 v_79_92,
sint64 r_79_92,
sint64 s_79_92,
sint64 u_79_93,
sint64 v_79_93,
sint64 r_79_93,
sint64 s_79_93,
bit ne
)={
    u_79_92 * f_59_low60_20_low20_0 + v_79_92 * g_59_low60_20_low20_0 = f_59_low60_20_low20_13 * (-(2**20)),
    r_79_92 * f_59_low60_20_low20_0 + s_79_92 * g_59_low60_20_low20_0 = g_59_low60_20_low20_13 * (-(2**20))
&&
    u_79_92 * f_59_low60_20_low20_0 + v_79_92 * g_59_low60_20_low20_0 = f_59_low60_20_low20_13 * (const 64 (-(2**20))),
    r_79_92 * f_59_low60_20_low20_0 + s_79_92 * g_59_low60_20_low20_0 = g_59_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_13 + u_79_92 * (const 64 (2**21)) + v_79_92 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_13 + r_79_92 * (const 64 (2**21)) + s_79_92 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_13,
    f_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_13,
    g_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 92)) <=s delta, delta <=s (const 64 (1 + 2*92)),
    (const 64 (-(2**20))) <=s u_79_92, u_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_92, v_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_92, r_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_92, s_79_92 <=s (const 64 ((2**20)-1)),
    u_79_92 + v_79_92 <=s (const 64 (2**20)),
    u_79_92 - v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 + v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 - v_79_92 <=s (const 64 (2**20)),
    r_79_92 + s_79_92 <=s (const 64 (2**20)),
    r_79_92 - s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 + s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 - s_79_92 <=s (const 64 (2**20)),
    u_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_79_92 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step92

// premise a
assume
g_59_low60_20_low20_13 = 0 (mod 2)
&&
g_59_low60_20_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_14 f_59_low60_20_low20_13;
mov u_79_93 u_79_92;
mov v_79_93 v_79_92;

asr g_59_low60_20_low20_14 g_59_low60_20_low20_13 1;
asr r_79_93 r_79_92 1;
asr s_79_93 s_79_92 1;
assert
    true
&&
    f_59_low60_20_low20_14 = f_59_low60_20_low20_13,
    u_79_93 = u_79_92,
    v_79_93 = v_79_92,
    g_59_low60_20_low20_14 * (const 64 2) = g_59_low60_20_low20_13,
    r_79_93 * (const 64 2) = r_79_92,
    s_79_93 * (const 64 2) = s_79_92
;

assume
    f_59_low60_20_low20_14 = f_59_low60_20_low20_13,
    u_79_93 = u_79_92,
    v_79_93 = v_79_92,
    g_59_low60_20_low20_14 * 2 = g_59_low60_20_low20_13,
    r_79_93 * 2 = r_79_92,
    s_79_93 * 2 = s_79_92
&&
    true
;

{
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_14 + u_79_93 * (const 64 (2**21)) + v_79_93 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_14 + r_79_93 * (const 64 (2**21)) + s_79_93 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_14,
    f_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_14,
    g_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 93)) <=s delta, delta <=s (const 64 (1 + 2*93)),
    (const 64 (-(2**20))) <=s u_79_93, u_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_93, v_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_93, r_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_93, s_79_93 <=s (const 64 ((2**20)-1)),
    u_79_93 + v_79_93 <=s (const 64 (2**20)),
    u_79_93 - v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 + v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 - v_79_93 <=s (const 64 (2**20)),
    r_79_93 + s_79_93 <=s (const 64 (2**20)),
    r_79_93 - s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 + s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 - s_79_93 <=s (const 64 (2**20)),
    u_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_79_93 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_092_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_13,
sint64 g_59_low60_20_low20_13,
sint64 f_59_low60_20_low20_14,
sint64 g_59_low60_20_low20_14,
sint64 u_79_92,
sint64 v_79_92,
sint64 r_79_92,
sint64 s_79_92,
sint64 u_79_93,
sint64 v_79_93,
sint64 r_79_93,
sint64 s_79_93,
bit ne
)={
    u_79_92 * f_59_low60_20_low20_0 + v_79_92 * g_59_low60_20_low20_0 = f_59_low60_20_low20_13 * (-(2**20)),
    r_79_92 * f_59_low60_20_low20_0 + s_79_92 * g_59_low60_20_low20_0 = g_59_low60_20_low20_13 * (-(2**20))
&&
    u_79_92 * f_59_low60_20_low20_0 + v_79_92 * g_59_low60_20_low20_0 = f_59_low60_20_low20_13 * (const 64 (-(2**20))),
    r_79_92 * f_59_low60_20_low20_0 + s_79_92 * g_59_low60_20_low20_0 = g_59_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_13 + u_79_92 * (const 64 (2**21)) + v_79_92 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_13 + r_79_92 * (const 64 (2**21)) + s_79_92 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_13,
    f_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_13,
    g_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 92)) <=s delta, delta <=s (const 64 (1 + 2*92)),
    (const 64 (-(2**20))) <=s u_79_92, u_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_92, v_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_92, r_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_92, s_79_92 <=s (const 64 ((2**20)-1)),
    u_79_92 + v_79_92 <=s (const 64 (2**20)),
    u_79_92 - v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 + v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 - v_79_92 <=s (const 64 (2**20)),
    r_79_92 + s_79_92 <=s (const 64 (2**20)),
    r_79_92 - s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 + s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 - s_79_92 <=s (const 64 (2**20)),
    u_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_79_92 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step92

// premise b
assume
g_59_low60_20_low20_13 = 1 (mod 2)
&&
g_59_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_14 f_59_low60_20_low20_13;
mov u_79_93 u_79_92;
mov v_79_93 v_79_92;

add g_59_low60_20_low20_14 g_59_low60_20_low20_13 f_59_low60_20_low20_13;
asr g_59_low60_20_low20_14 g_59_low60_20_low20_14 1;
add r_79_93 r_79_92 u_79_92;
asr r_79_93 r_79_93 1;
add s_79_93 s_79_92 v_79_92;
asr s_79_93 s_79_93 1;
assert
    true
&&
    f_59_low60_20_low20_14 = f_59_low60_20_low20_13,
    u_79_93 = u_79_92,
    v_79_93 = v_79_92,
    g_59_low60_20_low20_14 * (const 64 2) = g_59_low60_20_low20_13 + f_59_low60_20_low20_13,
    r_79_93 * (const 64 2) = r_79_92 + u_79_92,
    s_79_93 * (const 64 2) = s_79_92 + v_79_92
;

assume
    f_59_low60_20_low20_14 = f_59_low60_20_low20_13,
    u_79_93 = u_79_92,
    v_79_93 = v_79_92,
    g_59_low60_20_low20_14 * 2 = g_59_low60_20_low20_13 + f_59_low60_20_low20_13,
    r_79_93 * 2 = r_79_92 + u_79_92,
    s_79_93 * 2 = s_79_92 + v_79_92
&&
    true
;

{
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_14 + u_79_93 * (const 64 (2**21)) + v_79_93 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_14 + r_79_93 * (const 64 (2**21)) + s_79_93 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_14,
    f_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_14,
    g_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 93)) <=s delta, delta <=s (const 64 (1 + 2*93)),
    (const 64 (-(2**20))) <=s u_79_93, u_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_93, v_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_93, r_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_93, s_79_93 <=s (const 64 ((2**20)-1)),
    u_79_93 + v_79_93 <=s (const 64 (2**20)),
    u_79_93 - v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 + v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 - v_79_93 <=s (const 64 (2**20)),
    r_79_93 + s_79_93 <=s (const 64 (2**20)),
    r_79_93 - s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 + s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 - s_79_93 <=s (const 64 (2**20)),
    u_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_79_93 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_092_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_13,
sint64 g_59_low60_20_low20_13,
sint64 f_59_low60_20_low20_14,
sint64 g_59_low60_20_low20_14,
sint64 u_79_92,
sint64 v_79_92,
sint64 r_79_92,
sint64 s_79_92,
sint64 u_79_93,
sint64 v_79_93,
sint64 r_79_93,
sint64 s_79_93,
bit ne
)={
    u_79_92 * f_59_low60_20_low20_0 + v_79_92 * g_59_low60_20_low20_0 = f_59_low60_20_low20_13 * (-(2**20)),
    r_79_92 * f_59_low60_20_low20_0 + s_79_92 * g_59_low60_20_low20_0 = g_59_low60_20_low20_13 * (-(2**20))
&&
    u_79_92 * f_59_low60_20_low20_0 + v_79_92 * g_59_low60_20_low20_0 = f_59_low60_20_low20_13 * (const 64 (-(2**20))),
    r_79_92 * f_59_low60_20_low20_0 + s_79_92 * g_59_low60_20_low20_0 = g_59_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_13 + u_79_92 * (const 64 (2**21)) + v_79_92 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_13 + r_79_92 * (const 64 (2**21)) + s_79_92 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_13,
    f_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_13,
    g_59_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 92)) <=s delta, delta <=s (const 64 (1 + 2*92)),
    (const 64 (-(2**20))) <=s u_79_92, u_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_92, v_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_92, r_79_92 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_92, s_79_92 <=s (const 64 ((2**20)-1)),
    u_79_92 + v_79_92 <=s (const 64 (2**20)),
    u_79_92 - v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 + v_79_92 <=s (const 64 (2**20)),
    (const 64 0) - u_79_92 - v_79_92 <=s (const 64 (2**20)),
    r_79_92 + s_79_92 <=s (const 64 (2**20)),
    r_79_92 - s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 + s_79_92 <=s (const 64 (2**20)),
    (const 64 0) - r_79_92 - s_79_92 <=s (const 64 (2**20)),
    u_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_79_92 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_79_92 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step92

// premise c
assume
g_59_low60_20_low20_13 = 1 (mod 2)
&&
g_59_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_14 g_59_low60_20_low20_13;
mov u_79_93 r_79_92;
mov v_79_93 s_79_92;

subs dc g_59_low60_20_low20_14 g_59_low60_20_low20_13 f_59_low60_20_low20_13;
asr g_59_low60_20_low20_14 g_59_low60_20_low20_14 1;
subs dc r_79_93 r_79_92 u_79_92;
asr r_79_93 r_79_93 1;
subs dc s_79_93 s_79_92 v_79_92;
asr s_79_93 s_79_93 1;
assert
    true
&&
    f_59_low60_20_low20_14 = g_59_low60_20_low20_13,
    u_79_93 = r_79_92,
    v_79_93 = s_79_92,
    g_59_low60_20_low20_14 * (const 64 2) = g_59_low60_20_low20_13 - f_59_low60_20_low20_13,
    r_79_93 * (const 64 2) = r_79_92 - u_79_92,
    s_79_93 * (const 64 2) = s_79_92 - v_79_92
;

assume
    f_59_low60_20_low20_14 = g_59_low60_20_low20_13,
    u_79_93 = r_79_92,
    v_79_93 = s_79_92,
    g_59_low60_20_low20_14 * 2 = g_59_low60_20_low20_13 - f_59_low60_20_low20_13,
    r_79_93 * 2 = r_79_92 - u_79_92,
    s_79_93 * 2 = s_79_92 - v_79_92
&&
    true
;

{
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_14 + u_79_93 * (const 64 (2**21)) + v_79_93 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_14 + r_79_93 * (const 64 (2**21)) + s_79_93 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_14,
    f_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_14,
    g_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 93)) <=s delta, delta <=s (const 64 (1 + 2*93)),
    (const 64 (-(2**20))) <=s u_79_93, u_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_93, v_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_93, r_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_93, s_79_93 <=s (const 64 ((2**20)-1)),
    u_79_93 + v_79_93 <=s (const 64 (2**20)),
    u_79_93 - v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 + v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 - v_79_93 <=s (const 64 (2**20)),
    r_79_93 + s_79_93 <=s (const 64 (2**20)),
    r_79_93 - s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 + s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 - s_79_93 <=s (const 64 (2**20)),
    u_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_79_93 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_093_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_14,
sint64 g_59_low60_20_low20_14,
sint64 f_59_low60_20_low20_15,
sint64 g_59_low60_20_low20_15,
sint64 u_79_93,
sint64 v_79_93,
sint64 r_79_93,
sint64 s_79_93,
sint64 u_79_94,
sint64 v_79_94,
sint64 r_79_94,
sint64 s_79_94,
bit ne
)={
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (-(2**20)),
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (-(2**20))
&&
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (const 64 (-(2**20))),
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_14 + u_79_93 * (const 64 (2**21)) + v_79_93 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_14 + r_79_93 * (const 64 (2**21)) + s_79_93 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_14,
    f_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_14,
    g_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 93)) <=s delta, delta <=s (const 64 (1 + 2*93)),
    (const 64 (-(2**20))) <=s u_79_93, u_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_93, v_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_93, r_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_93, s_79_93 <=s (const 64 ((2**20)-1)),
    u_79_93 + v_79_93 <=s (const 64 (2**20)),
    u_79_93 - v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 + v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 - v_79_93 <=s (const 64 (2**20)),
    r_79_93 + s_79_93 <=s (const 64 (2**20)),
    r_79_93 - s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 + s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 - s_79_93 <=s (const 64 (2**20)),
    u_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_79_93 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step93

// premise a
assume
g_59_low60_20_low20_14 = 0 (mod 2)
&&
g_59_low60_20_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_15 f_59_low60_20_low20_14;
mov u_79_94 u_79_93;
mov v_79_94 v_79_93;

asr g_59_low60_20_low20_15 g_59_low60_20_low20_14 1;
asr r_79_94 r_79_93 1;
asr s_79_94 s_79_93 1;
assert
    true
&&
    f_59_low60_20_low20_15 = f_59_low60_20_low20_14,
    u_79_94 = u_79_93,
    v_79_94 = v_79_93,
    g_59_low60_20_low20_15 * (const 64 2) = g_59_low60_20_low20_14,
    r_79_94 * (const 64 2) = r_79_93,
    s_79_94 * (const 64 2) = s_79_93
;

assume
    f_59_low60_20_low20_15 = f_59_low60_20_low20_14,
    u_79_94 = u_79_93,
    v_79_94 = v_79_93,
    g_59_low60_20_low20_15 * 2 = g_59_low60_20_low20_14,
    r_79_94 * 2 = r_79_93,
    s_79_94 * 2 = s_79_93
&&
    true
;

{
    u_79_94 * f_59_low60_20_low20_0 + v_79_94 * g_59_low60_20_low20_0 = f_59_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_94 * f_59_low60_20_low20_0 + s_79_94 * g_59_low60_20_low20_0 = g_59_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_15 + u_79_94 * (const 64 (2**21)) + v_79_94 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_15 + r_79_94 * (const 64 (2**21)) + s_79_94 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_15,
    f_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_15,
    g_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 94)) <=s delta, delta <=s (const 64 (1 + 2*94)),
    (const 64 (-(2**20))) <=s u_79_94, u_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_94, v_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_94, r_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_94, s_79_94 <=s (const 64 ((2**20)-1)),
    u_79_94 + v_79_94 <=s (const 64 (2**20)),
    u_79_94 - v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 + v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 - v_79_94 <=s (const 64 (2**20)),
    r_79_94 + s_79_94 <=s (const 64 (2**20)),
    r_79_94 - s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 + s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 - s_79_94 <=s (const 64 (2**20)),
    u_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_79_94 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_093_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_14,
sint64 g_59_low60_20_low20_14,
sint64 f_59_low60_20_low20_15,
sint64 g_59_low60_20_low20_15,
sint64 u_79_93,
sint64 v_79_93,
sint64 r_79_93,
sint64 s_79_93,
sint64 u_79_94,
sint64 v_79_94,
sint64 r_79_94,
sint64 s_79_94,
bit ne
)={
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (-(2**20)),
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (-(2**20))
&&
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (const 64 (-(2**20))),
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_14 + u_79_93 * (const 64 (2**21)) + v_79_93 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_14 + r_79_93 * (const 64 (2**21)) + s_79_93 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_14,
    f_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_14,
    g_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 93)) <=s delta, delta <=s (const 64 (1 + 2*93)),
    (const 64 (-(2**20))) <=s u_79_93, u_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_93, v_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_93, r_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_93, s_79_93 <=s (const 64 ((2**20)-1)),
    u_79_93 + v_79_93 <=s (const 64 (2**20)),
    u_79_93 - v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 + v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 - v_79_93 <=s (const 64 (2**20)),
    r_79_93 + s_79_93 <=s (const 64 (2**20)),
    r_79_93 - s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 + s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 - s_79_93 <=s (const 64 (2**20)),
    u_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_79_93 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step93

// premise b
assume
g_59_low60_20_low20_14 = 1 (mod 2)
&&
g_59_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_15 f_59_low60_20_low20_14;
mov u_79_94 u_79_93;
mov v_79_94 v_79_93;

add g_59_low60_20_low20_15 g_59_low60_20_low20_14 f_59_low60_20_low20_14;
asr g_59_low60_20_low20_15 g_59_low60_20_low20_15 1;
add r_79_94 r_79_93 u_79_93;
asr r_79_94 r_79_94 1;
add s_79_94 s_79_93 v_79_93;
asr s_79_94 s_79_94 1;
assert
    true
&&
    f_59_low60_20_low20_15 = f_59_low60_20_low20_14,
    u_79_94 = u_79_93,
    v_79_94 = v_79_93,
    g_59_low60_20_low20_15 * (const 64 2) = g_59_low60_20_low20_14 + f_59_low60_20_low20_14,
    r_79_94 * (const 64 2) = r_79_93 + u_79_93,
    s_79_94 * (const 64 2) = s_79_93 + v_79_93
;

assume
    f_59_low60_20_low20_15 = f_59_low60_20_low20_14,
    u_79_94 = u_79_93,
    v_79_94 = v_79_93,
    g_59_low60_20_low20_15 * 2 = g_59_low60_20_low20_14 + f_59_low60_20_low20_14,
    r_79_94 * 2 = r_79_93 + u_79_93,
    s_79_94 * 2 = s_79_93 + v_79_93
&&
    true
;

{
    u_79_94 * f_59_low60_20_low20_0 + v_79_94 * g_59_low60_20_low20_0 = f_59_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_94 * f_59_low60_20_low20_0 + s_79_94 * g_59_low60_20_low20_0 = g_59_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_15 + u_79_94 * (const 64 (2**21)) + v_79_94 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_15 + r_79_94 * (const 64 (2**21)) + s_79_94 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_15,
    f_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_15,
    g_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 94)) <=s delta, delta <=s (const 64 (1 + 2*94)),
    (const 64 (-(2**20))) <=s u_79_94, u_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_94, v_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_94, r_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_94, s_79_94 <=s (const 64 ((2**20)-1)),
    u_79_94 + v_79_94 <=s (const 64 (2**20)),
    u_79_94 - v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 + v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 - v_79_94 <=s (const 64 (2**20)),
    r_79_94 + s_79_94 <=s (const 64 (2**20)),
    r_79_94 - s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 + s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 - s_79_94 <=s (const 64 (2**20)),
    u_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_79_94 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_093_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_14,
sint64 g_59_low60_20_low20_14,
sint64 f_59_low60_20_low20_15,
sint64 g_59_low60_20_low20_15,
sint64 u_79_93,
sint64 v_79_93,
sint64 r_79_93,
sint64 s_79_93,
sint64 u_79_94,
sint64 v_79_94,
sint64 r_79_94,
sint64 s_79_94,
bit ne
)={
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (-(2**20)),
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (-(2**20))
&&
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (const 64 (-(2**20))),
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_14 + u_79_93 * (const 64 (2**21)) + v_79_93 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_14 + r_79_93 * (const 64 (2**21)) + s_79_93 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_14,
    f_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_14,
    g_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 93)) <=s delta, delta <=s (const 64 (1 + 2*93)),
    (const 64 (-(2**20))) <=s u_79_93, u_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_93, v_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_93, r_79_93 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_93, s_79_93 <=s (const 64 ((2**20)-1)),
    u_79_93 + v_79_93 <=s (const 64 (2**20)),
    u_79_93 - v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 + v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 - v_79_93 <=s (const 64 (2**20)),
    r_79_93 + s_79_93 <=s (const 64 (2**20)),
    r_79_93 - s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 + s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 - s_79_93 <=s (const 64 (2**20)),
    u_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_79_93 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step93

// premise c
assume
g_59_low60_20_low20_14 = 1 (mod 2)
&&
g_59_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_15 g_59_low60_20_low20_14;
mov u_79_94 r_79_93;
mov v_79_94 s_79_93;

subs dc g_59_low60_20_low20_15 g_59_low60_20_low20_14 f_59_low60_20_low20_14;
asr g_59_low60_20_low20_15 g_59_low60_20_low20_15 1;
subs dc r_79_94 r_79_93 u_79_93;
asr r_79_94 r_79_94 1;
subs dc s_79_94 s_79_93 v_79_93;
asr s_79_94 s_79_94 1;
assert
    true
&&
    f_59_low60_20_low20_15 = g_59_low60_20_low20_14,
    u_79_94 = r_79_93,
    v_79_94 = s_79_93,
    g_59_low60_20_low20_15 * (const 64 2) = g_59_low60_20_low20_14 - f_59_low60_20_low20_14,
    r_79_94 * (const 64 2) = r_79_93 - u_79_93,
    s_79_94 * (const 64 2) = s_79_93 - v_79_93
;

assume
    f_59_low60_20_low20_15 = g_59_low60_20_low20_14,
    u_79_94 = r_79_93,
    v_79_94 = s_79_93,
    g_59_low60_20_low20_15 * 2 = g_59_low60_20_low20_14 - f_59_low60_20_low20_14,
    r_79_94 * 2 = r_79_93 - u_79_93,
    s_79_94 * 2 = s_79_93 - v_79_93
&&
    true
;

{
    u_79_94 * f_59_low60_20_low20_0 + v_79_94 * g_59_low60_20_low20_0 = f_59_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_94 * f_59_low60_20_low20_0 + s_79_94 * g_59_low60_20_low20_0 = g_59_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_15 + u_79_94 * (const 64 (2**21)) + v_79_94 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_15 + r_79_94 * (const 64 (2**21)) + s_79_94 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_15,
    f_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_15,
    g_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 94)) <=s delta, delta <=s (const 64 (1 + 2*94)),
    (const 64 (-(2**20))) <=s u_79_94, u_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_94, v_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_94, r_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_94, s_79_94 <=s (const 64 ((2**20)-1)),
    u_79_94 + v_79_94 <=s (const 64 (2**20)),
    u_79_94 - v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 + v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 - v_79_94 <=s (const 64 (2**20)),
    r_79_94 + s_79_94 <=s (const 64 (2**20)),
    r_79_94 - s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 + s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 - s_79_94 <=s (const 64 (2**20)),
    u_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_79_94 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_094_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_15,
sint64 g_59_low60_20_low20_15,
sint64 f_59_low60_20_low20_16,
sint64 g_59_low60_20_low20_16,
sint64 u_79_94,
sint64 v_79_94,
sint64 r_79_94,
sint64 s_79_94,
sint64 u_79_95,
sint64 v_79_95,
sint64 r_79_95,
sint64 s_79_95,
bit ne
)={
    u_79_94 * f_59_low60_20_low20_0 + v_79_94 * g_59_low60_20_low20_0 = f_59_low60_20_low20_15 * (-(2**20)),
    r_79_94 * f_59_low60_20_low20_0 + s_79_94 * g_59_low60_20_low20_0 = g_59_low60_20_low20_15 * (-(2**20))
&&
    u_79_94 * f_59_low60_20_low20_0 + v_79_94 * g_59_low60_20_low20_0 = f_59_low60_20_low20_15 * (const 64 (-(2**20))),
    r_79_94 * f_59_low60_20_low20_0 + s_79_94 * g_59_low60_20_low20_0 = g_59_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_15 + u_79_94 * (const 64 (2**21)) + v_79_94 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_15 + r_79_94 * (const 64 (2**21)) + s_79_94 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_15,
    f_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_15,
    g_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 94)) <=s delta, delta <=s (const 64 (1 + 2*94)),
    (const 64 (-(2**20))) <=s u_79_94, u_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_94, v_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_94, r_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_94, s_79_94 <=s (const 64 ((2**20)-1)),
    u_79_94 + v_79_94 <=s (const 64 (2**20)),
    u_79_94 - v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 + v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 - v_79_94 <=s (const 64 (2**20)),
    r_79_94 + s_79_94 <=s (const 64 (2**20)),
    r_79_94 - s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 + s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 - s_79_94 <=s (const 64 (2**20)),
    u_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_79_94 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step94

// premise a
assume
g_59_low60_20_low20_15 = 0 (mod 2)
&&
g_59_low60_20_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_16 f_59_low60_20_low20_15;
mov u_79_95 u_79_94;
mov v_79_95 v_79_94;

asr g_59_low60_20_low20_16 g_59_low60_20_low20_15 1;
asr r_79_95 r_79_94 1;
asr s_79_95 s_79_94 1;
assert
    true
&&
    f_59_low60_20_low20_16 = f_59_low60_20_low20_15,
    u_79_95 = u_79_94,
    v_79_95 = v_79_94,
    g_59_low60_20_low20_16 * (const 64 2) = g_59_low60_20_low20_15,
    r_79_95 * (const 64 2) = r_79_94,
    s_79_95 * (const 64 2) = s_79_94
;

assume
    f_59_low60_20_low20_16 = f_59_low60_20_low20_15,
    u_79_95 = u_79_94,
    v_79_95 = v_79_94,
    g_59_low60_20_low20_16 * 2 = g_59_low60_20_low20_15,
    r_79_95 * 2 = r_79_94,
    s_79_95 * 2 = s_79_94
&&
    true
;

{
    u_79_95 * f_59_low60_20_low20_0 + v_79_95 * g_59_low60_20_low20_0 = f_59_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_95 * f_59_low60_20_low20_0 + s_79_95 * g_59_low60_20_low20_0 = g_59_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_16 + u_79_95 * (const 64 (2**21)) + v_79_95 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_16 + r_79_95 * (const 64 (2**21)) + s_79_95 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_16,
    f_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_16,
    g_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 95)) <=s delta, delta <=s (const 64 (1 + 2*95)),
    (const 64 (-(2**20))) <=s u_79_95, u_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_95, v_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_95, r_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_95, s_79_95 <=s (const 64 ((2**20)-1)),
    u_79_95 + v_79_95 <=s (const 64 (2**20)),
    u_79_95 - v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 + v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 - v_79_95 <=s (const 64 (2**20)),
    r_79_95 + s_79_95 <=s (const 64 (2**20)),
    r_79_95 - s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 + s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 - s_79_95 <=s (const 64 (2**20)),
    u_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_79_95 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_094_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_15,
sint64 g_59_low60_20_low20_15,
sint64 f_59_low60_20_low20_16,
sint64 g_59_low60_20_low20_16,
sint64 u_79_94,
sint64 v_79_94,
sint64 r_79_94,
sint64 s_79_94,
sint64 u_79_95,
sint64 v_79_95,
sint64 r_79_95,
sint64 s_79_95,
bit ne
)={
    u_79_94 * f_59_low60_20_low20_0 + v_79_94 * g_59_low60_20_low20_0 = f_59_low60_20_low20_15 * (-(2**20)),
    r_79_94 * f_59_low60_20_low20_0 + s_79_94 * g_59_low60_20_low20_0 = g_59_low60_20_low20_15 * (-(2**20))
&&
    u_79_94 * f_59_low60_20_low20_0 + v_79_94 * g_59_low60_20_low20_0 = f_59_low60_20_low20_15 * (const 64 (-(2**20))),
    r_79_94 * f_59_low60_20_low20_0 + s_79_94 * g_59_low60_20_low20_0 = g_59_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_15 + u_79_94 * (const 64 (2**21)) + v_79_94 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_15 + r_79_94 * (const 64 (2**21)) + s_79_94 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_15,
    f_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_15,
    g_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 94)) <=s delta, delta <=s (const 64 (1 + 2*94)),
    (const 64 (-(2**20))) <=s u_79_94, u_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_94, v_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_94, r_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_94, s_79_94 <=s (const 64 ((2**20)-1)),
    u_79_94 + v_79_94 <=s (const 64 (2**20)),
    u_79_94 - v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 + v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 - v_79_94 <=s (const 64 (2**20)),
    r_79_94 + s_79_94 <=s (const 64 (2**20)),
    r_79_94 - s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 + s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 - s_79_94 <=s (const 64 (2**20)),
    u_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_79_94 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step94

// premise b
assume
g_59_low60_20_low20_15 = 1 (mod 2)
&&
g_59_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_16 f_59_low60_20_low20_15;
mov u_79_95 u_79_94;
mov v_79_95 v_79_94;

add g_59_low60_20_low20_16 g_59_low60_20_low20_15 f_59_low60_20_low20_15;
asr g_59_low60_20_low20_16 g_59_low60_20_low20_16 1;
add r_79_95 r_79_94 u_79_94;
asr r_79_95 r_79_95 1;
add s_79_95 s_79_94 v_79_94;
asr s_79_95 s_79_95 1;
assert
    true
&&
    f_59_low60_20_low20_16 = f_59_low60_20_low20_15,
    u_79_95 = u_79_94,
    v_79_95 = v_79_94,
    g_59_low60_20_low20_16 * (const 64 2) = g_59_low60_20_low20_15 + f_59_low60_20_low20_15,
    r_79_95 * (const 64 2) = r_79_94 + u_79_94,
    s_79_95 * (const 64 2) = s_79_94 + v_79_94
;

assume
    f_59_low60_20_low20_16 = f_59_low60_20_low20_15,
    u_79_95 = u_79_94,
    v_79_95 = v_79_94,
    g_59_low60_20_low20_16 * 2 = g_59_low60_20_low20_15 + f_59_low60_20_low20_15,
    r_79_95 * 2 = r_79_94 + u_79_94,
    s_79_95 * 2 = s_79_94 + v_79_94
&&
    true
;

{
    u_79_95 * f_59_low60_20_low20_0 + v_79_95 * g_59_low60_20_low20_0 = f_59_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_95 * f_59_low60_20_low20_0 + s_79_95 * g_59_low60_20_low20_0 = g_59_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_16 + u_79_95 * (const 64 (2**21)) + v_79_95 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_16 + r_79_95 * (const 64 (2**21)) + s_79_95 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_16,
    f_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_16,
    g_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 95)) <=s delta, delta <=s (const 64 (1 + 2*95)),
    (const 64 (-(2**20))) <=s u_79_95, u_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_95, v_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_95, r_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_95, s_79_95 <=s (const 64 ((2**20)-1)),
    u_79_95 + v_79_95 <=s (const 64 (2**20)),
    u_79_95 - v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 + v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 - v_79_95 <=s (const 64 (2**20)),
    r_79_95 + s_79_95 <=s (const 64 (2**20)),
    r_79_95 - s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 + s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 - s_79_95 <=s (const 64 (2**20)),
    u_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_79_95 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_094_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_15,
sint64 g_59_low60_20_low20_15,
sint64 f_59_low60_20_low20_16,
sint64 g_59_low60_20_low20_16,
sint64 u_79_94,
sint64 v_79_94,
sint64 r_79_94,
sint64 s_79_94,
sint64 u_79_95,
sint64 v_79_95,
sint64 r_79_95,
sint64 s_79_95,
bit ne
)={
    u_79_94 * f_59_low60_20_low20_0 + v_79_94 * g_59_low60_20_low20_0 = f_59_low60_20_low20_15 * (-(2**20)),
    r_79_94 * f_59_low60_20_low20_0 + s_79_94 * g_59_low60_20_low20_0 = g_59_low60_20_low20_15 * (-(2**20))
&&
    u_79_94 * f_59_low60_20_low20_0 + v_79_94 * g_59_low60_20_low20_0 = f_59_low60_20_low20_15 * (const 64 (-(2**20))),
    r_79_94 * f_59_low60_20_low20_0 + s_79_94 * g_59_low60_20_low20_0 = g_59_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_15 + u_79_94 * (const 64 (2**21)) + v_79_94 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_15 + r_79_94 * (const 64 (2**21)) + s_79_94 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_15,
    f_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_15,
    g_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 94)) <=s delta, delta <=s (const 64 (1 + 2*94)),
    (const 64 (-(2**20))) <=s u_79_94, u_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_94, v_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_94, r_79_94 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_94, s_79_94 <=s (const 64 ((2**20)-1)),
    u_79_94 + v_79_94 <=s (const 64 (2**20)),
    u_79_94 - v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 + v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 - v_79_94 <=s (const 64 (2**20)),
    r_79_94 + s_79_94 <=s (const 64 (2**20)),
    r_79_94 - s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 + s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 - s_79_94 <=s (const 64 (2**20)),
    u_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_79_94 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step94

// premise c
assume
g_59_low60_20_low20_15 = 1 (mod 2)
&&
g_59_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_16 g_59_low60_20_low20_15;
mov u_79_95 r_79_94;
mov v_79_95 s_79_94;

subs dc g_59_low60_20_low20_16 g_59_low60_20_low20_15 f_59_low60_20_low20_15;
asr g_59_low60_20_low20_16 g_59_low60_20_low20_16 1;
subs dc r_79_95 r_79_94 u_79_94;
asr r_79_95 r_79_95 1;
subs dc s_79_95 s_79_94 v_79_94;
asr s_79_95 s_79_95 1;
assert
    true
&&
    f_59_low60_20_low20_16 = g_59_low60_20_low20_15,
    u_79_95 = r_79_94,
    v_79_95 = s_79_94,
    g_59_low60_20_low20_16 * (const 64 2) = g_59_low60_20_low20_15 - f_59_low60_20_low20_15,
    r_79_95 * (const 64 2) = r_79_94 - u_79_94,
    s_79_95 * (const 64 2) = s_79_94 - v_79_94
;

assume
    f_59_low60_20_low20_16 = g_59_low60_20_low20_15,
    u_79_95 = r_79_94,
    v_79_95 = s_79_94,
    g_59_low60_20_low20_16 * 2 = g_59_low60_20_low20_15 - f_59_low60_20_low20_15,
    r_79_95 * 2 = r_79_94 - u_79_94,
    s_79_95 * 2 = s_79_94 - v_79_94
&&
    true
;

{
    u_79_95 * f_59_low60_20_low20_0 + v_79_95 * g_59_low60_20_low20_0 = f_59_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_95 * f_59_low60_20_low20_0 + s_79_95 * g_59_low60_20_low20_0 = g_59_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_16 + u_79_95 * (const 64 (2**21)) + v_79_95 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_16 + r_79_95 * (const 64 (2**21)) + s_79_95 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_16,
    f_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_16,
    g_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 95)) <=s delta, delta <=s (const 64 (1 + 2*95)),
    (const 64 (-(2**20))) <=s u_79_95, u_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_95, v_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_95, r_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_95, s_79_95 <=s (const 64 ((2**20)-1)),
    u_79_95 + v_79_95 <=s (const 64 (2**20)),
    u_79_95 - v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 + v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 - v_79_95 <=s (const 64 (2**20)),
    r_79_95 + s_79_95 <=s (const 64 (2**20)),
    r_79_95 - s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 + s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 - s_79_95 <=s (const 64 (2**20)),
    u_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_79_95 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_095_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_16,
sint64 g_59_low60_20_low20_16,
sint64 f_59_low60_20_low20_17,
sint64 g_59_low60_20_low20_17,
sint64 u_79_95,
sint64 v_79_95,
sint64 r_79_95,
sint64 s_79_95,
sint64 u_79_96,
sint64 v_79_96,
sint64 r_79_96,
sint64 s_79_96,
bit ne
)={
    u_79_95 * f_59_low60_20_low20_0 + v_79_95 * g_59_low60_20_low20_0 = f_59_low60_20_low20_16 * (-(2**20)),
    r_79_95 * f_59_low60_20_low20_0 + s_79_95 * g_59_low60_20_low20_0 = g_59_low60_20_low20_16 * (-(2**20))
&&
    u_79_95 * f_59_low60_20_low20_0 + v_79_95 * g_59_low60_20_low20_0 = f_59_low60_20_low20_16 * (const 64 (-(2**20))),
    r_79_95 * f_59_low60_20_low20_0 + s_79_95 * g_59_low60_20_low20_0 = g_59_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_16 + u_79_95 * (const 64 (2**21)) + v_79_95 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_16 + r_79_95 * (const 64 (2**21)) + s_79_95 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_16,
    f_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_16,
    g_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 95)) <=s delta, delta <=s (const 64 (1 + 2*95)),
    (const 64 (-(2**20))) <=s u_79_95, u_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_95, v_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_95, r_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_95, s_79_95 <=s (const 64 ((2**20)-1)),
    u_79_95 + v_79_95 <=s (const 64 (2**20)),
    u_79_95 - v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 + v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 - v_79_95 <=s (const 64 (2**20)),
    r_79_95 + s_79_95 <=s (const 64 (2**20)),
    r_79_95 - s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 + s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 - s_79_95 <=s (const 64 (2**20)),
    u_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_79_95 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step95

// premise a
assume
g_59_low60_20_low20_16 = 0 (mod 2)
&&
g_59_low60_20_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_17 f_59_low60_20_low20_16;
mov u_79_96 u_79_95;
mov v_79_96 v_79_95;

asr g_59_low60_20_low20_17 g_59_low60_20_low20_16 1;
asr r_79_96 r_79_95 1;
asr s_79_96 s_79_95 1;
assert
    true
&&
    f_59_low60_20_low20_17 = f_59_low60_20_low20_16,
    u_79_96 = u_79_95,
    v_79_96 = v_79_95,
    g_59_low60_20_low20_17 * (const 64 2) = g_59_low60_20_low20_16,
    r_79_96 * (const 64 2) = r_79_95,
    s_79_96 * (const 64 2) = s_79_95
;

assume
    f_59_low60_20_low20_17 = f_59_low60_20_low20_16,
    u_79_96 = u_79_95,
    v_79_96 = v_79_95,
    g_59_low60_20_low20_17 * 2 = g_59_low60_20_low20_16,
    r_79_96 * 2 = r_79_95,
    s_79_96 * 2 = s_79_95
&&
    true
;

{
    u_79_96 * f_59_low60_20_low20_0 + v_79_96 * g_59_low60_20_low20_0 = f_59_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_96 * f_59_low60_20_low20_0 + s_79_96 * g_59_low60_20_low20_0 = g_59_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_17 + u_79_96 * (const 64 (2**21)) + v_79_96 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_17 + r_79_96 * (const 64 (2**21)) + s_79_96 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_17,
    f_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_17,
    g_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 96)) <=s delta, delta <=s (const 64 (1 + 2*96)),
    (const 64 (-(2**20))) <=s u_79_96, u_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_96, v_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_96, r_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_96, s_79_96 <=s (const 64 ((2**20)-1)),
    u_79_96 + v_79_96 <=s (const 64 (2**20)),
    u_79_96 - v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 + v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 - v_79_96 <=s (const 64 (2**20)),
    r_79_96 + s_79_96 <=s (const 64 (2**20)),
    r_79_96 - s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 + s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 - s_79_96 <=s (const 64 (2**20)),
    u_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_79_96 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_095_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_16,
sint64 g_59_low60_20_low20_16,
sint64 f_59_low60_20_low20_17,
sint64 g_59_low60_20_low20_17,
sint64 u_79_95,
sint64 v_79_95,
sint64 r_79_95,
sint64 s_79_95,
sint64 u_79_96,
sint64 v_79_96,
sint64 r_79_96,
sint64 s_79_96,
bit ne
)={
    u_79_95 * f_59_low60_20_low20_0 + v_79_95 * g_59_low60_20_low20_0 = f_59_low60_20_low20_16 * (-(2**20)),
    r_79_95 * f_59_low60_20_low20_0 + s_79_95 * g_59_low60_20_low20_0 = g_59_low60_20_low20_16 * (-(2**20))
&&
    u_79_95 * f_59_low60_20_low20_0 + v_79_95 * g_59_low60_20_low20_0 = f_59_low60_20_low20_16 * (const 64 (-(2**20))),
    r_79_95 * f_59_low60_20_low20_0 + s_79_95 * g_59_low60_20_low20_0 = g_59_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_16 + u_79_95 * (const 64 (2**21)) + v_79_95 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_16 + r_79_95 * (const 64 (2**21)) + s_79_95 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_16,
    f_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_16,
    g_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 95)) <=s delta, delta <=s (const 64 (1 + 2*95)),
    (const 64 (-(2**20))) <=s u_79_95, u_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_95, v_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_95, r_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_95, s_79_95 <=s (const 64 ((2**20)-1)),
    u_79_95 + v_79_95 <=s (const 64 (2**20)),
    u_79_95 - v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 + v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 - v_79_95 <=s (const 64 (2**20)),
    r_79_95 + s_79_95 <=s (const 64 (2**20)),
    r_79_95 - s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 + s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 - s_79_95 <=s (const 64 (2**20)),
    u_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_79_95 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step95

// premise b
assume
g_59_low60_20_low20_16 = 1 (mod 2)
&&
g_59_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_17 f_59_low60_20_low20_16;
mov u_79_96 u_79_95;
mov v_79_96 v_79_95;

add g_59_low60_20_low20_17 g_59_low60_20_low20_16 f_59_low60_20_low20_16;
asr g_59_low60_20_low20_17 g_59_low60_20_low20_17 1;
add r_79_96 r_79_95 u_79_95;
asr r_79_96 r_79_96 1;
add s_79_96 s_79_95 v_79_95;
asr s_79_96 s_79_96 1;
assert
    true
&&
    f_59_low60_20_low20_17 = f_59_low60_20_low20_16,
    u_79_96 = u_79_95,
    v_79_96 = v_79_95,
    g_59_low60_20_low20_17 * (const 64 2) = g_59_low60_20_low20_16 + f_59_low60_20_low20_16,
    r_79_96 * (const 64 2) = r_79_95 + u_79_95,
    s_79_96 * (const 64 2) = s_79_95 + v_79_95
;

assume
    f_59_low60_20_low20_17 = f_59_low60_20_low20_16,
    u_79_96 = u_79_95,
    v_79_96 = v_79_95,
    g_59_low60_20_low20_17 * 2 = g_59_low60_20_low20_16 + f_59_low60_20_low20_16,
    r_79_96 * 2 = r_79_95 + u_79_95,
    s_79_96 * 2 = s_79_95 + v_79_95
&&
    true
;

{
    u_79_96 * f_59_low60_20_low20_0 + v_79_96 * g_59_low60_20_low20_0 = f_59_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_96 * f_59_low60_20_low20_0 + s_79_96 * g_59_low60_20_low20_0 = g_59_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_17 + u_79_96 * (const 64 (2**21)) + v_79_96 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_17 + r_79_96 * (const 64 (2**21)) + s_79_96 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_17,
    f_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_17,
    g_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 96)) <=s delta, delta <=s (const 64 (1 + 2*96)),
    (const 64 (-(2**20))) <=s u_79_96, u_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_96, v_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_96, r_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_96, s_79_96 <=s (const 64 ((2**20)-1)),
    u_79_96 + v_79_96 <=s (const 64 (2**20)),
    u_79_96 - v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 + v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 - v_79_96 <=s (const 64 (2**20)),
    r_79_96 + s_79_96 <=s (const 64 (2**20)),
    r_79_96 - s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 + s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 - s_79_96 <=s (const 64 (2**20)),
    u_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_79_96 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_095_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_16,
sint64 g_59_low60_20_low20_16,
sint64 f_59_low60_20_low20_17,
sint64 g_59_low60_20_low20_17,
sint64 u_79_95,
sint64 v_79_95,
sint64 r_79_95,
sint64 s_79_95,
sint64 u_79_96,
sint64 v_79_96,
sint64 r_79_96,
sint64 s_79_96,
bit ne
)={
    u_79_95 * f_59_low60_20_low20_0 + v_79_95 * g_59_low60_20_low20_0 = f_59_low60_20_low20_16 * (-(2**20)),
    r_79_95 * f_59_low60_20_low20_0 + s_79_95 * g_59_low60_20_low20_0 = g_59_low60_20_low20_16 * (-(2**20))
&&
    u_79_95 * f_59_low60_20_low20_0 + v_79_95 * g_59_low60_20_low20_0 = f_59_low60_20_low20_16 * (const 64 (-(2**20))),
    r_79_95 * f_59_low60_20_low20_0 + s_79_95 * g_59_low60_20_low20_0 = g_59_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_16 + u_79_95 * (const 64 (2**21)) + v_79_95 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_16 + r_79_95 * (const 64 (2**21)) + s_79_95 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_16,
    f_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_16,
    g_59_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 95)) <=s delta, delta <=s (const 64 (1 + 2*95)),
    (const 64 (-(2**20))) <=s u_79_95, u_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_95, v_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_95, r_79_95 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_95, s_79_95 <=s (const 64 ((2**20)-1)),
    u_79_95 + v_79_95 <=s (const 64 (2**20)),
    u_79_95 - v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 + v_79_95 <=s (const 64 (2**20)),
    (const 64 0) - u_79_95 - v_79_95 <=s (const 64 (2**20)),
    r_79_95 + s_79_95 <=s (const 64 (2**20)),
    r_79_95 - s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 + s_79_95 <=s (const 64 (2**20)),
    (const 64 0) - r_79_95 - s_79_95 <=s (const 64 (2**20)),
    u_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_79_95 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_79_95 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step95

// premise c
assume
g_59_low60_20_low20_16 = 1 (mod 2)
&&
g_59_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_17 g_59_low60_20_low20_16;
mov u_79_96 r_79_95;
mov v_79_96 s_79_95;

subs dc g_59_low60_20_low20_17 g_59_low60_20_low20_16 f_59_low60_20_low20_16;
asr g_59_low60_20_low20_17 g_59_low60_20_low20_17 1;
subs dc r_79_96 r_79_95 u_79_95;
asr r_79_96 r_79_96 1;
subs dc s_79_96 s_79_95 v_79_95;
asr s_79_96 s_79_96 1;
assert
    true
&&
    f_59_low60_20_low20_17 = g_59_low60_20_low20_16,
    u_79_96 = r_79_95,
    v_79_96 = s_79_95,
    g_59_low60_20_low20_17 * (const 64 2) = g_59_low60_20_low20_16 - f_59_low60_20_low20_16,
    r_79_96 * (const 64 2) = r_79_95 - u_79_95,
    s_79_96 * (const 64 2) = s_79_95 - v_79_95
;

assume
    f_59_low60_20_low20_17 = g_59_low60_20_low20_16,
    u_79_96 = r_79_95,
    v_79_96 = s_79_95,
    g_59_low60_20_low20_17 * 2 = g_59_low60_20_low20_16 - f_59_low60_20_low20_16,
    r_79_96 * 2 = r_79_95 - u_79_95,
    s_79_96 * 2 = s_79_95 - v_79_95
&&
    true
;

{
    u_79_96 * f_59_low60_20_low20_0 + v_79_96 * g_59_low60_20_low20_0 = f_59_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_96 * f_59_low60_20_low20_0 + s_79_96 * g_59_low60_20_low20_0 = g_59_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_17 + u_79_96 * (const 64 (2**21)) + v_79_96 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_17 + r_79_96 * (const 64 (2**21)) + s_79_96 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_17,
    f_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_17,
    g_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 96)) <=s delta, delta <=s (const 64 (1 + 2*96)),
    (const 64 (-(2**20))) <=s u_79_96, u_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_96, v_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_96, r_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_96, s_79_96 <=s (const 64 ((2**20)-1)),
    u_79_96 + v_79_96 <=s (const 64 (2**20)),
    u_79_96 - v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 + v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 - v_79_96 <=s (const 64 (2**20)),
    r_79_96 + s_79_96 <=s (const 64 (2**20)),
    r_79_96 - s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 + s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 - s_79_96 <=s (const 64 (2**20)),
    u_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_79_96 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_096_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_17,
sint64 g_59_low60_20_low20_17,
sint64 f_59_low60_20_low20_18,
sint64 g_59_low60_20_low20_18,
sint64 u_79_96,
sint64 v_79_96,
sint64 r_79_96,
sint64 s_79_96,
sint64 u_79_97,
sint64 v_79_97,
sint64 r_79_97,
sint64 s_79_97,
bit ne
)={
    u_79_96 * f_59_low60_20_low20_0 + v_79_96 * g_59_low60_20_low20_0 = f_59_low60_20_low20_17 * (-(2**20)),
    r_79_96 * f_59_low60_20_low20_0 + s_79_96 * g_59_low60_20_low20_0 = g_59_low60_20_low20_17 * (-(2**20))
&&
    u_79_96 * f_59_low60_20_low20_0 + v_79_96 * g_59_low60_20_low20_0 = f_59_low60_20_low20_17 * (const 64 (-(2**20))),
    r_79_96 * f_59_low60_20_low20_0 + s_79_96 * g_59_low60_20_low20_0 = g_59_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_17 + u_79_96 * (const 64 (2**21)) + v_79_96 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_17 + r_79_96 * (const 64 (2**21)) + s_79_96 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_17,
    f_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_17,
    g_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 96)) <=s delta, delta <=s (const 64 (1 + 2*96)),
    (const 64 (-(2**20))) <=s u_79_96, u_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_96, v_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_96, r_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_96, s_79_96 <=s (const 64 ((2**20)-1)),
    u_79_96 + v_79_96 <=s (const 64 (2**20)),
    u_79_96 - v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 + v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 - v_79_96 <=s (const 64 (2**20)),
    r_79_96 + s_79_96 <=s (const 64 (2**20)),
    r_79_96 - s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 + s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 - s_79_96 <=s (const 64 (2**20)),
    u_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_79_96 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step96

// premise a
assume
g_59_low60_20_low20_17 = 0 (mod 2)
&&
g_59_low60_20_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_18 f_59_low60_20_low20_17;
mov u_79_97 u_79_96;
mov v_79_97 v_79_96;

asr g_59_low60_20_low20_18 g_59_low60_20_low20_17 1;
asr r_79_97 r_79_96 1;
asr s_79_97 s_79_96 1;
assert
    true
&&
    f_59_low60_20_low20_18 = f_59_low60_20_low20_17,
    u_79_97 = u_79_96,
    v_79_97 = v_79_96,
    g_59_low60_20_low20_18 * (const 64 2) = g_59_low60_20_low20_17,
    r_79_97 * (const 64 2) = r_79_96,
    s_79_97 * (const 64 2) = s_79_96
;

assume
    f_59_low60_20_low20_18 = f_59_low60_20_low20_17,
    u_79_97 = u_79_96,
    v_79_97 = v_79_96,
    g_59_low60_20_low20_18 * 2 = g_59_low60_20_low20_17,
    r_79_97 * 2 = r_79_96,
    s_79_97 * 2 = s_79_96
&&
    true
;

{
    u_79_97 * f_59_low60_20_low20_0 + v_79_97 * g_59_low60_20_low20_0 = f_59_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_97 * f_59_low60_20_low20_0 + s_79_97 * g_59_low60_20_low20_0 = g_59_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_18 + u_79_97 * (const 64 (2**21)) + v_79_97 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_18 + r_79_97 * (const 64 (2**21)) + s_79_97 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_18,
    f_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_18,
    g_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 97)) <=s delta, delta <=s (const 64 (1 + 2*97)),
    (const 64 (-(2**20))) <=s u_79_97, u_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_97, v_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_97, r_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_97, s_79_97 <=s (const 64 ((2**20)-1)),
    u_79_97 + v_79_97 <=s (const 64 (2**20)),
    u_79_97 - v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 + v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 - v_79_97 <=s (const 64 (2**20)),
    r_79_97 + s_79_97 <=s (const 64 (2**20)),
    r_79_97 - s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 + s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 - s_79_97 <=s (const 64 (2**20)),
    u_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_79_97 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_096_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_17,
sint64 g_59_low60_20_low20_17,
sint64 f_59_low60_20_low20_18,
sint64 g_59_low60_20_low20_18,
sint64 u_79_96,
sint64 v_79_96,
sint64 r_79_96,
sint64 s_79_96,
sint64 u_79_97,
sint64 v_79_97,
sint64 r_79_97,
sint64 s_79_97,
bit ne
)={
    u_79_96 * f_59_low60_20_low20_0 + v_79_96 * g_59_low60_20_low20_0 = f_59_low60_20_low20_17 * (-(2**20)),
    r_79_96 * f_59_low60_20_low20_0 + s_79_96 * g_59_low60_20_low20_0 = g_59_low60_20_low20_17 * (-(2**20))
&&
    u_79_96 * f_59_low60_20_low20_0 + v_79_96 * g_59_low60_20_low20_0 = f_59_low60_20_low20_17 * (const 64 (-(2**20))),
    r_79_96 * f_59_low60_20_low20_0 + s_79_96 * g_59_low60_20_low20_0 = g_59_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_17 + u_79_96 * (const 64 (2**21)) + v_79_96 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_17 + r_79_96 * (const 64 (2**21)) + s_79_96 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_17,
    f_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_17,
    g_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 96)) <=s delta, delta <=s (const 64 (1 + 2*96)),
    (const 64 (-(2**20))) <=s u_79_96, u_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_96, v_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_96, r_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_96, s_79_96 <=s (const 64 ((2**20)-1)),
    u_79_96 + v_79_96 <=s (const 64 (2**20)),
    u_79_96 - v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 + v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 - v_79_96 <=s (const 64 (2**20)),
    r_79_96 + s_79_96 <=s (const 64 (2**20)),
    r_79_96 - s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 + s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 - s_79_96 <=s (const 64 (2**20)),
    u_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_79_96 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step96

// premise b
assume
g_59_low60_20_low20_17 = 1 (mod 2)
&&
g_59_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_18 f_59_low60_20_low20_17;
mov u_79_97 u_79_96;
mov v_79_97 v_79_96;

add g_59_low60_20_low20_18 g_59_low60_20_low20_17 f_59_low60_20_low20_17;
asr g_59_low60_20_low20_18 g_59_low60_20_low20_18 1;
add r_79_97 r_79_96 u_79_96;
asr r_79_97 r_79_97 1;
add s_79_97 s_79_96 v_79_96;
asr s_79_97 s_79_97 1;
assert
    true
&&
    f_59_low60_20_low20_18 = f_59_low60_20_low20_17,
    u_79_97 = u_79_96,
    v_79_97 = v_79_96,
    g_59_low60_20_low20_18 * (const 64 2) = g_59_low60_20_low20_17 + f_59_low60_20_low20_17,
    r_79_97 * (const 64 2) = r_79_96 + u_79_96,
    s_79_97 * (const 64 2) = s_79_96 + v_79_96
;

assume
    f_59_low60_20_low20_18 = f_59_low60_20_low20_17,
    u_79_97 = u_79_96,
    v_79_97 = v_79_96,
    g_59_low60_20_low20_18 * 2 = g_59_low60_20_low20_17 + f_59_low60_20_low20_17,
    r_79_97 * 2 = r_79_96 + u_79_96,
    s_79_97 * 2 = s_79_96 + v_79_96
&&
    true
;

{
    u_79_97 * f_59_low60_20_low20_0 + v_79_97 * g_59_low60_20_low20_0 = f_59_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_97 * f_59_low60_20_low20_0 + s_79_97 * g_59_low60_20_low20_0 = g_59_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_18 + u_79_97 * (const 64 (2**21)) + v_79_97 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_18 + r_79_97 * (const 64 (2**21)) + s_79_97 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_18,
    f_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_18,
    g_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 97)) <=s delta, delta <=s (const 64 (1 + 2*97)),
    (const 64 (-(2**20))) <=s u_79_97, u_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_97, v_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_97, r_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_97, s_79_97 <=s (const 64 ((2**20)-1)),
    u_79_97 + v_79_97 <=s (const 64 (2**20)),
    u_79_97 - v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 + v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 - v_79_97 <=s (const 64 (2**20)),
    r_79_97 + s_79_97 <=s (const 64 (2**20)),
    r_79_97 - s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 + s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 - s_79_97 <=s (const 64 (2**20)),
    u_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_79_97 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_096_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_17,
sint64 g_59_low60_20_low20_17,
sint64 f_59_low60_20_low20_18,
sint64 g_59_low60_20_low20_18,
sint64 u_79_96,
sint64 v_79_96,
sint64 r_79_96,
sint64 s_79_96,
sint64 u_79_97,
sint64 v_79_97,
sint64 r_79_97,
sint64 s_79_97,
bit ne
)={
    u_79_96 * f_59_low60_20_low20_0 + v_79_96 * g_59_low60_20_low20_0 = f_59_low60_20_low20_17 * (-(2**20)),
    r_79_96 * f_59_low60_20_low20_0 + s_79_96 * g_59_low60_20_low20_0 = g_59_low60_20_low20_17 * (-(2**20))
&&
    u_79_96 * f_59_low60_20_low20_0 + v_79_96 * g_59_low60_20_low20_0 = f_59_low60_20_low20_17 * (const 64 (-(2**20))),
    r_79_96 * f_59_low60_20_low20_0 + s_79_96 * g_59_low60_20_low20_0 = g_59_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_17 + u_79_96 * (const 64 (2**21)) + v_79_96 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_17 + r_79_96 * (const 64 (2**21)) + s_79_96 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_17,
    f_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_17,
    g_59_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 96)) <=s delta, delta <=s (const 64 (1 + 2*96)),
    (const 64 (-(2**20))) <=s u_79_96, u_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_96, v_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_96, r_79_96 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_96, s_79_96 <=s (const 64 ((2**20)-1)),
    u_79_96 + v_79_96 <=s (const 64 (2**20)),
    u_79_96 - v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 + v_79_96 <=s (const 64 (2**20)),
    (const 64 0) - u_79_96 - v_79_96 <=s (const 64 (2**20)),
    r_79_96 + s_79_96 <=s (const 64 (2**20)),
    r_79_96 - s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 + s_79_96 <=s (const 64 (2**20)),
    (const 64 0) - r_79_96 - s_79_96 <=s (const 64 (2**20)),
    u_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_79_96 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_79_96 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step96

// premise c
assume
g_59_low60_20_low20_17 = 1 (mod 2)
&&
g_59_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_18 g_59_low60_20_low20_17;
mov u_79_97 r_79_96;
mov v_79_97 s_79_96;

subs dc g_59_low60_20_low20_18 g_59_low60_20_low20_17 f_59_low60_20_low20_17;
asr g_59_low60_20_low20_18 g_59_low60_20_low20_18 1;
subs dc r_79_97 r_79_96 u_79_96;
asr r_79_97 r_79_97 1;
subs dc s_79_97 s_79_96 v_79_96;
asr s_79_97 s_79_97 1;
assert
    true
&&
    f_59_low60_20_low20_18 = g_59_low60_20_low20_17,
    u_79_97 = r_79_96,
    v_79_97 = s_79_96,
    g_59_low60_20_low20_18 * (const 64 2) = g_59_low60_20_low20_17 - f_59_low60_20_low20_17,
    r_79_97 * (const 64 2) = r_79_96 - u_79_96,
    s_79_97 * (const 64 2) = s_79_96 - v_79_96
;

assume
    f_59_low60_20_low20_18 = g_59_low60_20_low20_17,
    u_79_97 = r_79_96,
    v_79_97 = s_79_96,
    g_59_low60_20_low20_18 * 2 = g_59_low60_20_low20_17 - f_59_low60_20_low20_17,
    r_79_97 * 2 = r_79_96 - u_79_96,
    s_79_97 * 2 = s_79_96 - v_79_96
&&
    true
;

{
    u_79_97 * f_59_low60_20_low20_0 + v_79_97 * g_59_low60_20_low20_0 = f_59_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_97 * f_59_low60_20_low20_0 + s_79_97 * g_59_low60_20_low20_0 = g_59_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_18 + u_79_97 * (const 64 (2**21)) + v_79_97 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_18 + r_79_97 * (const 64 (2**21)) + s_79_97 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_18,
    f_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_18,
    g_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 97)) <=s delta, delta <=s (const 64 (1 + 2*97)),
    (const 64 (-(2**20))) <=s u_79_97, u_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_97, v_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_97, r_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_97, s_79_97 <=s (const 64 ((2**20)-1)),
    u_79_97 + v_79_97 <=s (const 64 (2**20)),
    u_79_97 - v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 + v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 - v_79_97 <=s (const 64 (2**20)),
    r_79_97 + s_79_97 <=s (const 64 (2**20)),
    r_79_97 - s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 + s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 - s_79_97 <=s (const 64 (2**20)),
    u_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_79_97 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_097_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_18,
sint64 g_59_low60_20_low20_18,
sint64 f_59_low60_20_low20_19,
sint64 g_59_low60_20_low20_19,
sint64 u_79_97,
sint64 v_79_97,
sint64 r_79_97,
sint64 s_79_97,
sint64 u_79_98,
sint64 v_79_98,
sint64 r_79_98,
sint64 s_79_98,
bit ne
)={
    u_79_97 * f_59_low60_20_low20_0 + v_79_97 * g_59_low60_20_low20_0 = f_59_low60_20_low20_18 * (-(2**20)),
    r_79_97 * f_59_low60_20_low20_0 + s_79_97 * g_59_low60_20_low20_0 = g_59_low60_20_low20_18 * (-(2**20))
&&
    u_79_97 * f_59_low60_20_low20_0 + v_79_97 * g_59_low60_20_low20_0 = f_59_low60_20_low20_18 * (const 64 (-(2**20))),
    r_79_97 * f_59_low60_20_low20_0 + s_79_97 * g_59_low60_20_low20_0 = g_59_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_18 + u_79_97 * (const 64 (2**21)) + v_79_97 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_18 + r_79_97 * (const 64 (2**21)) + s_79_97 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_18,
    f_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_18,
    g_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 97)) <=s delta, delta <=s (const 64 (1 + 2*97)),
    (const 64 (-(2**20))) <=s u_79_97, u_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_97, v_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_97, r_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_97, s_79_97 <=s (const 64 ((2**20)-1)),
    u_79_97 + v_79_97 <=s (const 64 (2**20)),
    u_79_97 - v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 + v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 - v_79_97 <=s (const 64 (2**20)),
    r_79_97 + s_79_97 <=s (const 64 (2**20)),
    r_79_97 - s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 + s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 - s_79_97 <=s (const 64 (2**20)),
    u_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_79_97 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step97

// premise a
assume
g_59_low60_20_low20_18 = 0 (mod 2)
&&
g_59_low60_20_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_59_low60_20_low20_19 f_59_low60_20_low20_18;
mov u_79_98 u_79_97;
mov v_79_98 v_79_97;

asr g_59_low60_20_low20_19 g_59_low60_20_low20_18 1;
asr r_79_98 r_79_97 1;
asr s_79_98 s_79_97 1;
assert
    true
&&
    f_59_low60_20_low20_19 = f_59_low60_20_low20_18,
    u_79_98 = u_79_97,
    v_79_98 = v_79_97,
    g_59_low60_20_low20_19 * (const 64 2) = g_59_low60_20_low20_18,
    r_79_98 * (const 64 2) = r_79_97,
    s_79_98 * (const 64 2) = s_79_97
;

assume
    f_59_low60_20_low20_19 = f_59_low60_20_low20_18,
    u_79_98 = u_79_97,
    v_79_98 = v_79_97,
    g_59_low60_20_low20_19 * 2 = g_59_low60_20_low20_18,
    r_79_98 * 2 = r_79_97,
    s_79_98 * 2 = s_79_97
&&
    true
;

{
    u_79_98 * f_59_low60_20_low20_0 + v_79_98 * g_59_low60_20_low20_0 = f_59_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_98 * f_59_low60_20_low20_0 + s_79_98 * g_59_low60_20_low20_0 = g_59_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_19 + u_79_98 * (const 64 (2**21)) + v_79_98 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_19 + r_79_98 * (const 64 (2**21)) + s_79_98 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_19,
    f_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_19,
    g_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 98)) <=s delta, delta <=s (const 64 (1 + 2*98)),
    (const 64 (-(2**20))) <=s u_79_98, u_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_98, v_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_98, r_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_98, s_79_98 <=s (const 64 ((2**20)-1)),
    u_79_98 + v_79_98 <=s (const 64 (2**20)),
    u_79_98 - v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 + v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 - v_79_98 <=s (const 64 (2**20)),
    r_79_98 + s_79_98 <=s (const 64 (2**20)),
    r_79_98 - s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 + s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 - s_79_98 <=s (const 64 (2**20)),
    u_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_79_98 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_097_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_18,
sint64 g_59_low60_20_low20_18,
sint64 f_59_low60_20_low20_19,
sint64 g_59_low60_20_low20_19,
sint64 u_79_97,
sint64 v_79_97,
sint64 r_79_97,
sint64 s_79_97,
sint64 u_79_98,
sint64 v_79_98,
sint64 r_79_98,
sint64 s_79_98,
bit ne
)={
    u_79_97 * f_59_low60_20_low20_0 + v_79_97 * g_59_low60_20_low20_0 = f_59_low60_20_low20_18 * (-(2**20)),
    r_79_97 * f_59_low60_20_low20_0 + s_79_97 * g_59_low60_20_low20_0 = g_59_low60_20_low20_18 * (-(2**20))
&&
    u_79_97 * f_59_low60_20_low20_0 + v_79_97 * g_59_low60_20_low20_0 = f_59_low60_20_low20_18 * (const 64 (-(2**20))),
    r_79_97 * f_59_low60_20_low20_0 + s_79_97 * g_59_low60_20_low20_0 = g_59_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_18 + u_79_97 * (const 64 (2**21)) + v_79_97 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_18 + r_79_97 * (const 64 (2**21)) + s_79_97 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_18,
    f_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_18,
    g_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 97)) <=s delta, delta <=s (const 64 (1 + 2*97)),
    (const 64 (-(2**20))) <=s u_79_97, u_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_97, v_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_97, r_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_97, s_79_97 <=s (const 64 ((2**20)-1)),
    u_79_97 + v_79_97 <=s (const 64 (2**20)),
    u_79_97 - v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 + v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 - v_79_97 <=s (const 64 (2**20)),
    r_79_97 + s_79_97 <=s (const 64 (2**20)),
    r_79_97 - s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 + s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 - s_79_97 <=s (const 64 (2**20)),
    u_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_79_97 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step97

// premise b
assume
g_59_low60_20_low20_18 = 1 (mod 2)
&&
g_59_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_19 f_59_low60_20_low20_18;
mov u_79_98 u_79_97;
mov v_79_98 v_79_97;

add g_59_low60_20_low20_19 g_59_low60_20_low20_18 f_59_low60_20_low20_18;
asr g_59_low60_20_low20_19 g_59_low60_20_low20_19 1;
add r_79_98 r_79_97 u_79_97;
asr r_79_98 r_79_98 1;
add s_79_98 s_79_97 v_79_97;
asr s_79_98 s_79_98 1;
assert
    true
&&
    f_59_low60_20_low20_19 = f_59_low60_20_low20_18,
    u_79_98 = u_79_97,
    v_79_98 = v_79_97,
    g_59_low60_20_low20_19 * (const 64 2) = g_59_low60_20_low20_18 + f_59_low60_20_low20_18,
    r_79_98 * (const 64 2) = r_79_97 + u_79_97,
    s_79_98 * (const 64 2) = s_79_97 + v_79_97
;

assume
    f_59_low60_20_low20_19 = f_59_low60_20_low20_18,
    u_79_98 = u_79_97,
    v_79_98 = v_79_97,
    g_59_low60_20_low20_19 * 2 = g_59_low60_20_low20_18 + f_59_low60_20_low20_18,
    r_79_98 * 2 = r_79_97 + u_79_97,
    s_79_98 * 2 = s_79_97 + v_79_97
&&
    true
;

{
    u_79_98 * f_59_low60_20_low20_0 + v_79_98 * g_59_low60_20_low20_0 = f_59_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_98 * f_59_low60_20_low20_0 + s_79_98 * g_59_low60_20_low20_0 = g_59_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_19 + u_79_98 * (const 64 (2**21)) + v_79_98 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_19 + r_79_98 * (const 64 (2**21)) + s_79_98 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_19,
    f_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_19,
    g_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 98)) <=s delta, delta <=s (const 64 (1 + 2*98)),
    (const 64 (-(2**20))) <=s u_79_98, u_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_98, v_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_98, r_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_98, s_79_98 <=s (const 64 ((2**20)-1)),
    u_79_98 + v_79_98 <=s (const 64 (2**20)),
    u_79_98 - v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 + v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 - v_79_98 <=s (const 64 (2**20)),
    r_79_98 + s_79_98 <=s (const 64 (2**20)),
    r_79_98 - s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 + s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 - s_79_98 <=s (const 64 (2**20)),
    u_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_79_98 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_097_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_18,
sint64 g_59_low60_20_low20_18,
sint64 f_59_low60_20_low20_19,
sint64 g_59_low60_20_low20_19,
sint64 u_79_97,
sint64 v_79_97,
sint64 r_79_97,
sint64 s_79_97,
sint64 u_79_98,
sint64 v_79_98,
sint64 r_79_98,
sint64 s_79_98,
bit ne
)={
    u_79_97 * f_59_low60_20_low20_0 + v_79_97 * g_59_low60_20_low20_0 = f_59_low60_20_low20_18 * (-(2**20)),
    r_79_97 * f_59_low60_20_low20_0 + s_79_97 * g_59_low60_20_low20_0 = g_59_low60_20_low20_18 * (-(2**20))
&&
    u_79_97 * f_59_low60_20_low20_0 + v_79_97 * g_59_low60_20_low20_0 = f_59_low60_20_low20_18 * (const 64 (-(2**20))),
    r_79_97 * f_59_low60_20_low20_0 + s_79_97 * g_59_low60_20_low20_0 = g_59_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_18 + u_79_97 * (const 64 (2**21)) + v_79_97 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_18 + r_79_97 * (const 64 (2**21)) + s_79_97 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_18,
    f_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_18,
    g_59_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 97)) <=s delta, delta <=s (const 64 (1 + 2*97)),
    (const 64 (-(2**20))) <=s u_79_97, u_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_97, v_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_97, r_79_97 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_97, s_79_97 <=s (const 64 ((2**20)-1)),
    u_79_97 + v_79_97 <=s (const 64 (2**20)),
    u_79_97 - v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 + v_79_97 <=s (const 64 (2**20)),
    (const 64 0) - u_79_97 - v_79_97 <=s (const 64 (2**20)),
    r_79_97 + s_79_97 <=s (const 64 (2**20)),
    r_79_97 - s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 + s_79_97 <=s (const 64 (2**20)),
    (const 64 0) - r_79_97 - s_79_97 <=s (const 64 (2**20)),
    u_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_79_97 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_79_97 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step97

// premise c
assume
g_59_low60_20_low20_18 = 1 (mod 2)
&&
g_59_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_19 g_59_low60_20_low20_18;
mov u_79_98 r_79_97;
mov v_79_98 s_79_97;

subs dc g_59_low60_20_low20_19 g_59_low60_20_low20_18 f_59_low60_20_low20_18;
asr g_59_low60_20_low20_19 g_59_low60_20_low20_19 1;
subs dc r_79_98 r_79_97 u_79_97;
asr r_79_98 r_79_98 1;
subs dc s_79_98 s_79_97 v_79_97;
asr s_79_98 s_79_98 1;
assert
    true
&&
    f_59_low60_20_low20_19 = g_59_low60_20_low20_18,
    u_79_98 = r_79_97,
    v_79_98 = s_79_97,
    g_59_low60_20_low20_19 * (const 64 2) = g_59_low60_20_low20_18 - f_59_low60_20_low20_18,
    r_79_98 * (const 64 2) = r_79_97 - u_79_97,
    s_79_98 * (const 64 2) = s_79_97 - v_79_97
;

assume
    f_59_low60_20_low20_19 = g_59_low60_20_low20_18,
    u_79_98 = r_79_97,
    v_79_98 = s_79_97,
    g_59_low60_20_low20_19 * 2 = g_59_low60_20_low20_18 - f_59_low60_20_low20_18,
    r_79_98 * 2 = r_79_97 - u_79_97,
    s_79_98 * 2 = s_79_97 - v_79_97
&&
    true
;

{
    u_79_98 * f_59_low60_20_low20_0 + v_79_98 * g_59_low60_20_low20_0 = f_59_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_98 * f_59_low60_20_low20_0 + s_79_98 * g_59_low60_20_low20_0 = g_59_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_19 + u_79_98 * (const 64 (2**21)) + v_79_98 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_19 + r_79_98 * (const 64 (2**21)) + s_79_98 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_19,
    f_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_19,
    g_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 98)) <=s delta, delta <=s (const 64 (1 + 2*98)),
    (const 64 (-(2**20))) <=s u_79_98, u_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_98, v_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_98, r_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_98, s_79_98 <=s (const 64 ((2**20)-1)),
    u_79_98 + v_79_98 <=s (const 64 (2**20)),
    u_79_98 - v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 + v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 - v_79_98 <=s (const 64 (2**20)),
    r_79_98 + s_79_98 <=s (const 64 (2**20)),
    r_79_98 - s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 + s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 - s_79_98 <=s (const 64 (2**20)),
    u_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_79_98 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_098_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_19,
sint64 g_59_low60_20_low20_19,
sint64 f_59_low60_20_low20_20,
sint64 g_59_low60_20_low20_20,
sint64 u_79_98,
sint64 v_79_98,
sint64 r_79_98,
sint64 s_79_98,
sint64 u_79_99,
sint64 v_79_99,
sint64 r_79_99,
sint64 s_79_99,
bit ne
)={
    u_79_98 * f_59_low60_20_low20_0 + v_79_98 * g_59_low60_20_low20_0 = f_59_low60_20_low20_19 * (-(2**20)),
    r_79_98 * f_59_low60_20_low20_0 + s_79_98 * g_59_low60_20_low20_0 = g_59_low60_20_low20_19 * (-(2**20))
&&
    u_79_98 * f_59_low60_20_low20_0 + v_79_98 * g_59_low60_20_low20_0 = f_59_low60_20_low20_19 * (const 64 (-(2**20))),
    r_79_98 * f_59_low60_20_low20_0 + s_79_98 * g_59_low60_20_low20_0 = g_59_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_19 + u_79_98 * (const 64 (2**21)) + v_79_98 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_19 + r_79_98 * (const 64 (2**21)) + s_79_98 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_19,
    f_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_19,
    g_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 98)) <=s delta, delta <=s (const 64 (1 + 2*98)),
    (const 64 (-(2**20))) <=s u_79_98, u_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_98, v_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_98, r_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_98, s_79_98 <=s (const 64 ((2**20)-1)),
    u_79_98 + v_79_98 <=s (const 64 (2**20)),
    u_79_98 - v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 + v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 - v_79_98 <=s (const 64 (2**20)),
    r_79_98 + s_79_98 <=s (const 64 (2**20)),
    r_79_98 - s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 + s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 - s_79_98 <=s (const 64 (2**20)),
    u_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_79_98 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step98

// premise a
assume
g_59_low60_20_low20_19 = 0 (mod 2)
&&
g_59_low60_20_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov f_59_low60_20_low20_20 f_59_low60_20_low20_19;
mov u_79_99 u_79_98;
mov v_79_99 v_79_98;

asr g_59_low60_20_low20_20 g_59_low60_20_low20_19 1;
asr r_79_99 r_79_98 1;
asr s_79_99 s_79_98 1;
assert
    true
&&
    f_59_low60_20_low20_20 = f_59_low60_20_low20_19,
    u_79_99 = u_79_98,
    v_79_99 = v_79_98,
    g_59_low60_20_low20_20 * (const 64 2) = g_59_low60_20_low20_19,
    r_79_99 * (const 64 2) = r_79_98,
    s_79_99 * (const 64 2) = s_79_98
;

assume
    f_59_low60_20_low20_20 = f_59_low60_20_low20_19,
    u_79_99 = u_79_98,
    v_79_99 = v_79_98,
    g_59_low60_20_low20_20 * 2 = g_59_low60_20_low20_19,
    r_79_99 * 2 = r_79_98,
    s_79_99 * 2 = s_79_98
&&
    true
;

{
    u_79_99 * f_59_low60_20_low20_0 + v_79_99 * g_59_low60_20_low20_0 = f_59_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_99 * f_59_low60_20_low20_0 + s_79_99 * g_59_low60_20_low20_0 = g_59_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_20 + u_79_99 * (const 64 (2**21)) + v_79_99 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_20 + r_79_99 * (const 64 (2**21)) + s_79_99 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_20,
    f_59_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_20,
    g_59_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 99)) <=s delta, delta <=s (const 64 (1 + 2*99)),
    (const 64 (-(2**20))) <=s u_79_99, u_79_99 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_99, v_79_99 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_99, r_79_99 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_99, s_79_99 <=s (const 64 ((2**20)-1)),
    u_79_99 + v_79_99 <=s (const 64 (2**20)),
    u_79_99 - v_79_99 <=s (const 64 (2**20)),
    (const 64 0) - u_79_99 + v_79_99 <=s (const 64 (2**20)),
    (const 64 0) - u_79_99 - v_79_99 <=s (const 64 (2**20)),
    r_79_99 + s_79_99 <=s (const 64 (2**20)),
    r_79_99 - s_79_99 <=s (const 64 (2**20)),
    (const 64 0) - r_79_99 + s_79_99 <=s (const 64 (2**20)),
    (const 64 0) - r_79_99 - s_79_99 <=s (const 64 (2**20)),
    u_79_99 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_79_99 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_79_99 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_79_99 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_098_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_19,
sint64 g_59_low60_20_low20_19,
sint64 f_59_low60_20_low20_20,
sint64 g_59_low60_20_low20_20,
sint64 u_79_98,
sint64 v_79_98,
sint64 r_79_98,
sint64 s_79_98,
sint64 u_79_99,
sint64 v_79_99,
sint64 r_79_99,
sint64 s_79_99,
bit ne
)={
    u_79_98 * f_59_low60_20_low20_0 + v_79_98 * g_59_low60_20_low20_0 = f_59_low60_20_low20_19 * (-(2**20)),
    r_79_98 * f_59_low60_20_low20_0 + s_79_98 * g_59_low60_20_low20_0 = g_59_low60_20_low20_19 * (-(2**20))
&&
    u_79_98 * f_59_low60_20_low20_0 + v_79_98 * g_59_low60_20_low20_0 = f_59_low60_20_low20_19 * (const 64 (-(2**20))),
    r_79_98 * f_59_low60_20_low20_0 + s_79_98 * g_59_low60_20_low20_0 = g_59_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_19 + u_79_98 * (const 64 (2**21)) + v_79_98 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_19 + r_79_98 * (const 64 (2**21)) + s_79_98 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_19,
    f_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_19,
    g_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 98)) <=s delta, delta <=s (const 64 (1 + 2*98)),
    (const 64 (-(2**20))) <=s u_79_98, u_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_98, v_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_98, r_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_98, s_79_98 <=s (const 64 ((2**20)-1)),
    u_79_98 + v_79_98 <=s (const 64 (2**20)),
    u_79_98 - v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 + v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 - v_79_98 <=s (const 64 (2**20)),
    r_79_98 + s_79_98 <=s (const 64 (2**20)),
    r_79_98 - s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 + s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 - s_79_98 <=s (const 64 (2**20)),
    u_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_79_98 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step98

// premise b
assume
g_59_low60_20_low20_19 = 1 (mod 2)
&&
g_59_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_20 f_59_low60_20_low20_19;
mov u_79_99 u_79_98;
mov v_79_99 v_79_98;

add g_59_low60_20_low20_20 g_59_low60_20_low20_19 f_59_low60_20_low20_19;
asr g_59_low60_20_low20_20 g_59_low60_20_low20_20 1;
add r_79_99 r_79_98 u_79_98;
asr r_79_99 r_79_99 1;
add s_79_99 s_79_98 v_79_98;
asr s_79_99 s_79_99 1;
assert
    true
&&
    f_59_low60_20_low20_20 = f_59_low60_20_low20_19,
    u_79_99 = u_79_98,
    v_79_99 = v_79_98,
    g_59_low60_20_low20_20 * (const 64 2) = g_59_low60_20_low20_19 + f_59_low60_20_low20_19,
    r_79_99 * (const 64 2) = r_79_98 + u_79_98,
    s_79_99 * (const 64 2) = s_79_98 + v_79_98
;

assume
    f_59_low60_20_low20_20 = f_59_low60_20_low20_19,
    u_79_99 = u_79_98,
    v_79_99 = v_79_98,
    g_59_low60_20_low20_20 * 2 = g_59_low60_20_low20_19 + f_59_low60_20_low20_19,
    r_79_99 * 2 = r_79_98 + u_79_98,
    s_79_99 * 2 = s_79_98 + v_79_98
&&
    true
;

{
    u_79_99 * f_59_low60_20_low20_0 + v_79_99 * g_59_low60_20_low20_0 = f_59_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_99 * f_59_low60_20_low20_0 + s_79_99 * g_59_low60_20_low20_0 = g_59_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_20 + u_79_99 * (const 64 (2**21)) + v_79_99 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_20 + r_79_99 * (const 64 (2**21)) + s_79_99 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_20,
    f_59_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_20,
    g_59_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 99)) <=s delta, delta <=s (const 64 (1 + 2*99)),
    (const 64 (-(2**20))) <=s u_79_99, u_79_99 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_99, v_79_99 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_99, r_79_99 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_99, s_79_99 <=s (const 64 ((2**20)-1)),
    u_79_99 + v_79_99 <=s (const 64 (2**20)),
    u_79_99 - v_79_99 <=s (const 64 (2**20)),
    (const 64 0) - u_79_99 + v_79_99 <=s (const 64 (2**20)),
    (const 64 0) - u_79_99 - v_79_99 <=s (const 64 (2**20)),
    r_79_99 + s_79_99 <=s (const 64 (2**20)),
    r_79_99 - s_79_99 <=s (const 64 (2**20)),
    (const 64 0) - r_79_99 + s_79_99 <=s (const 64 (2**20)),
    (const 64 0) - r_79_99 - s_79_99 <=s (const 64 (2**20)),
    u_79_99 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_79_99 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_79_99 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_79_99 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_098_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_19,
sint64 g_59_low60_20_low20_19,
sint64 f_59_low60_20_low20_20,
sint64 g_59_low60_20_low20_20,
sint64 u_79_98,
sint64 v_79_98,
sint64 r_79_98,
sint64 s_79_98,
sint64 u_79_99,
sint64 v_79_99,
sint64 r_79_99,
sint64 s_79_99,
bit ne
)={
    u_79_98 * f_59_low60_20_low20_0 + v_79_98 * g_59_low60_20_low20_0 = f_59_low60_20_low20_19 * (-(2**20)),
    r_79_98 * f_59_low60_20_low20_0 + s_79_98 * g_59_low60_20_low20_0 = g_59_low60_20_low20_19 * (-(2**20))
&&
    u_79_98 * f_59_low60_20_low20_0 + v_79_98 * g_59_low60_20_low20_0 = f_59_low60_20_low20_19 * (const 64 (-(2**20))),
    r_79_98 * f_59_low60_20_low20_0 + s_79_98 * g_59_low60_20_low20_0 = g_59_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_19 + u_79_98 * (const 64 (2**21)) + v_79_98 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_19 + r_79_98 * (const 64 (2**21)) + s_79_98 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_19,
    f_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_19,
    g_59_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 98)) <=s delta, delta <=s (const 64 (1 + 2*98)),
    (const 64 (-(2**20))) <=s u_79_98, u_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_98, v_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_98, r_79_98 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_98, s_79_98 <=s (const 64 ((2**20)-1)),
    u_79_98 + v_79_98 <=s (const 64 (2**20)),
    u_79_98 - v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 + v_79_98 <=s (const 64 (2**20)),
    (const 64 0) - u_79_98 - v_79_98 <=s (const 64 (2**20)),
    r_79_98 + s_79_98 <=s (const 64 (2**20)),
    r_79_98 - s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 + s_79_98 <=s (const 64 (2**20)),
    (const 64 0) - r_79_98 - s_79_98 <=s (const 64 (2**20)),
    u_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_79_98 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_79_98 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step98

// premise c
assume
g_59_low60_20_low20_19 = 1 (mod 2)
&&
g_59_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_59_low60_20_low20_20 g_59_low60_20_low20_19;
mov u_79_99 r_79_98;
mov v_79_99 s_79_98;

subs dc g_59_low60_20_low20_20 g_59_low60_20_low20_19 f_59_low60_20_low20_19;
asr g_59_low60_20_low20_20 g_59_low60_20_low20_20 1;
subs dc r_79_99 r_79_98 u_79_98;
asr r_79_99 r_79_99 1;
subs dc s_79_99 s_79_98 v_79_98;
asr s_79_99 s_79_99 1;
assert
    true
&&
    f_59_low60_20_low20_20 = g_59_low60_20_low20_19,
    u_79_99 = r_79_98,
    v_79_99 = s_79_98,
    g_59_low60_20_low20_20 * (const 64 2) = g_59_low60_20_low20_19 - f_59_low60_20_low20_19,
    r_79_99 * (const 64 2) = r_79_98 - u_79_98,
    s_79_99 * (const 64 2) = s_79_98 - v_79_98
;

assume
    f_59_low60_20_low20_20 = g_59_low60_20_low20_19,
    u_79_99 = r_79_98,
    v_79_99 = s_79_98,
    g_59_low60_20_low20_20 * 2 = g_59_low60_20_low20_19 - f_59_low60_20_low20_19,
    r_79_99 * 2 = r_79_98 - u_79_98,
    s_79_99 * 2 = s_79_98 - v_79_98
&&
    true
;

{
    u_79_99 * f_59_low60_20_low20_0 + v_79_99 * g_59_low60_20_low20_0 = f_59_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_99 * f_59_low60_20_low20_0 + s_79_99 * g_59_low60_20_low20_0 = g_59_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_20 + u_79_99 * (const 64 (2**21)) + v_79_99 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_20 + r_79_99 * (const 64 (2**21)) + s_79_99 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_20,
    f_59_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_20,
    g_59_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 99)) <=s delta, delta <=s (const 64 (1 + 2*99)),
    (const 64 (-(2**20))) <=s u_79_99, u_79_99 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_79_99, v_79_99 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_79_99, r_79_99 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_79_99, s_79_99 <=s (const 64 ((2**20)-1)),
    u_79_99 + v_79_99 <=s (const 64 (2**20)),
    u_79_99 - v_79_99 <=s (const 64 (2**20)),
    (const 64 0) - u_79_99 + v_79_99 <=s (const 64 (2**20)),
    (const 64 0) - u_79_99 - v_79_99 <=s (const 64 (2**20)),
    r_79_99 + s_79_99 <=s (const 64 (2**20)),
    r_79_99 - s_79_99 <=s (const 64 (2**20)),
    (const 64 0) - r_79_99 + s_79_99 <=s (const 64 (2**20)),
    (const 64 0) - r_79_99 - s_79_99 <=s (const 64 (2**20)),
    u_79_99 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_79_99 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_79_99 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_79_99 = (const 64 0) (mod (const 64 (2**(20-20))))
}

