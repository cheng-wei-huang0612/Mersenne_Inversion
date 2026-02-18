proc divstep_197_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_1,
sint64 g_177_low60_20_low20_1,
sint64 u_197_197,
sint64 v_197_197,
sint64 r_197_197,
sint64 s_197_197,
sint64 u_197_198,
sint64 v_197_198,
sint64 r_197_198,
sint64 s_197_198,
bit ne
)={
    u_197_197 * f_177_low60_20_low20_0 + v_197_197 * g_177_low60_20_low20_0 = f_177_low60_20_low20_0 * (-(2**20)),
    r_197_197 * f_177_low60_20_low20_0 + s_197_197 * g_177_low60_20_low20_0 = g_177_low60_20_low20_0 * (-(2**20))
&&
    u_197_197 * f_177_low60_20_low20_0 + v_197_197 * g_177_low60_20_low20_0 = f_177_low60_20_low20_0 * (const 64 (-(2**20))),
    r_197_197 * f_177_low60_20_low20_0 + s_197_197 * g_177_low60_20_low20_0 = g_177_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_0 + u_197_197 * (const 64 (2**21)) + v_197_197 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_0 + r_197_197 * (const 64 (2**21)) + s_197_197 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 197)) <=s delta, delta <=s (const 64 (1 + 2*197)),
    u_197_197 = (const 64 (-(2**20))),
    v_197_197 = (const 64 (0)),
    r_197_197 = (const 64 (0)),
    s_197_197 = (const 64 (-(2**20)))
}



// divsteps
// step197

// premise a
assume
g_177_low60_20_low20_0 = 0 (mod 2)
&&
g_177_low60_20_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_177_low60_20_low20_1 f_177_low60_20_low20_0;
mov u_197_198 u_197_197;
mov v_197_198 v_197_197;

asr g_177_low60_20_low20_1 g_177_low60_20_low20_0 1;
asr r_197_198 r_197_197 1;
asr s_197_198 s_197_197 1;
assert
    true
&&
    f_177_low60_20_low20_1 = f_177_low60_20_low20_0,
    u_197_198 = u_197_197,
    v_197_198 = v_197_197,
    g_177_low60_20_low20_1 * (const 64 2) = g_177_low60_20_low20_0,
    r_197_198 * (const 64 2) = r_197_197,
    s_197_198 * (const 64 2) = s_197_197
;

assume
    f_177_low60_20_low20_1 = f_177_low60_20_low20_0,
    u_197_198 = u_197_197,
    v_197_198 = v_197_197,
    g_177_low60_20_low20_1 * 2 = g_177_low60_20_low20_0,
    r_197_198 * 2 = r_197_197,
    s_197_198 * 2 = s_197_197
&&
    true
;

{
    u_197_198 * f_177_low60_20_low20_0 + v_197_198 * g_177_low60_20_low20_0 = f_177_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_198 * f_177_low60_20_low20_0 + s_197_198 * g_177_low60_20_low20_0 = g_177_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_1 + u_197_198 * (const 64 (2**21)) + v_197_198 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_1 + r_197_198 * (const 64 (2**21)) + s_197_198 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_1,
    f_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_1,
    g_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 198)) <=s delta, delta <=s (const 64 (1 + 2*198)),
    (const 64 (-(2**20))) <=s u_197_198, u_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_198, v_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_198, r_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_198, s_197_198 <=s (const 64 ((2**20)-1)),
    u_197_198 + v_197_198 <=s (const 64 (2**20)),
    u_197_198 - v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 + v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 - v_197_198 <=s (const 64 (2**20)),
    r_197_198 + s_197_198 <=s (const 64 (2**20)),
    r_197_198 - s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 + s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 - s_197_198 <=s (const 64 (2**20)),
    u_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_197_198 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_197_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_1,
sint64 g_177_low60_20_low20_1,
sint64 u_197_197,
sint64 v_197_197,
sint64 r_197_197,
sint64 s_197_197,
sint64 u_197_198,
sint64 v_197_198,
sint64 r_197_198,
sint64 s_197_198,
bit ne
)={
    u_197_197 * f_177_low60_20_low20_0 + v_197_197 * g_177_low60_20_low20_0 = f_177_low60_20_low20_0 * (-(2**20)),
    r_197_197 * f_177_low60_20_low20_0 + s_197_197 * g_177_low60_20_low20_0 = g_177_low60_20_low20_0 * (-(2**20))
&&
    u_197_197 * f_177_low60_20_low20_0 + v_197_197 * g_177_low60_20_low20_0 = f_177_low60_20_low20_0 * (const 64 (-(2**20))),
    r_197_197 * f_177_low60_20_low20_0 + s_197_197 * g_177_low60_20_low20_0 = g_177_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_0 + u_197_197 * (const 64 (2**21)) + v_197_197 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_0 + r_197_197 * (const 64 (2**21)) + s_197_197 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 197)) <=s delta, delta <=s (const 64 (1 + 2*197)),
    u_197_197 = (const 64 (-(2**20))),
    v_197_197 = (const 64 (0)),
    r_197_197 = (const 64 (0)),
    s_197_197 = (const 64 (-(2**20)))
}



// divsteps
// step197

// premise b
assume
g_177_low60_20_low20_0 = 1 (mod 2)
&&
g_177_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_1 f_177_low60_20_low20_0;
mov u_197_198 u_197_197;
mov v_197_198 v_197_197;

add g_177_low60_20_low20_1 g_177_low60_20_low20_0 f_177_low60_20_low20_0;
asr g_177_low60_20_low20_1 g_177_low60_20_low20_1 1;
add r_197_198 r_197_197 u_197_197;
asr r_197_198 r_197_198 1;
add s_197_198 s_197_197 v_197_197;
asr s_197_198 s_197_198 1;
assert
    true
&&
    f_177_low60_20_low20_1 = f_177_low60_20_low20_0,
    u_197_198 = u_197_197,
    v_197_198 = v_197_197,
    g_177_low60_20_low20_1 * (const 64 2) = g_177_low60_20_low20_0 + f_177_low60_20_low20_0,
    r_197_198 * (const 64 2) = r_197_197 + u_197_197,
    s_197_198 * (const 64 2) = s_197_197 + v_197_197
;

assume
    f_177_low60_20_low20_1 = f_177_low60_20_low20_0,
    u_197_198 = u_197_197,
    v_197_198 = v_197_197,
    g_177_low60_20_low20_1 * 2 = g_177_low60_20_low20_0 + f_177_low60_20_low20_0,
    r_197_198 * 2 = r_197_197 + u_197_197,
    s_197_198 * 2 = s_197_197 + v_197_197
&&
    true
;

{
    u_197_198 * f_177_low60_20_low20_0 + v_197_198 * g_177_low60_20_low20_0 = f_177_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_198 * f_177_low60_20_low20_0 + s_197_198 * g_177_low60_20_low20_0 = g_177_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_1 + u_197_198 * (const 64 (2**21)) + v_197_198 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_1 + r_197_198 * (const 64 (2**21)) + s_197_198 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_1,
    f_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_1,
    g_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 198)) <=s delta, delta <=s (const 64 (1 + 2*198)),
    (const 64 (-(2**20))) <=s u_197_198, u_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_198, v_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_198, r_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_198, s_197_198 <=s (const 64 ((2**20)-1)),
    u_197_198 + v_197_198 <=s (const 64 (2**20)),
    u_197_198 - v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 + v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 - v_197_198 <=s (const 64 (2**20)),
    r_197_198 + s_197_198 <=s (const 64 (2**20)),
    r_197_198 - s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 + s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 - s_197_198 <=s (const 64 (2**20)),
    u_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_197_198 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_197_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_1,
sint64 g_177_low60_20_low20_1,
sint64 u_197_197,
sint64 v_197_197,
sint64 r_197_197,
sint64 s_197_197,
sint64 u_197_198,
sint64 v_197_198,
sint64 r_197_198,
sint64 s_197_198,
bit ne
)={
    u_197_197 * f_177_low60_20_low20_0 + v_197_197 * g_177_low60_20_low20_0 = f_177_low60_20_low20_0 * (-(2**20)),
    r_197_197 * f_177_low60_20_low20_0 + s_197_197 * g_177_low60_20_low20_0 = g_177_low60_20_low20_0 * (-(2**20))
&&
    u_197_197 * f_177_low60_20_low20_0 + v_197_197 * g_177_low60_20_low20_0 = f_177_low60_20_low20_0 * (const 64 (-(2**20))),
    r_197_197 * f_177_low60_20_low20_0 + s_197_197 * g_177_low60_20_low20_0 = g_177_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_0 + u_197_197 * (const 64 (2**21)) + v_197_197 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_0 + r_197_197 * (const 64 (2**21)) + s_197_197 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 197)) <=s delta, delta <=s (const 64 (1 + 2*197)),
    u_197_197 = (const 64 (-(2**20))),
    v_197_197 = (const 64 (0)),
    r_197_197 = (const 64 (0)),
    s_197_197 = (const 64 (-(2**20)))
}



// divsteps
// step197

// premise c
assume
g_177_low60_20_low20_0 = 1 (mod 2)
&&
g_177_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_1 g_177_low60_20_low20_0;
mov u_197_198 r_197_197;
mov v_197_198 s_197_197;

subs dc g_177_low60_20_low20_1 g_177_low60_20_low20_0 f_177_low60_20_low20_0;
asr g_177_low60_20_low20_1 g_177_low60_20_low20_1 1;
subs dc r_197_198 r_197_197 u_197_197;
asr r_197_198 r_197_198 1;
subs dc s_197_198 s_197_197 v_197_197;
asr s_197_198 s_197_198 1;
assert
    true
&&
    f_177_low60_20_low20_1 = g_177_low60_20_low20_0,
    u_197_198 = r_197_197,
    v_197_198 = s_197_197,
    g_177_low60_20_low20_1 * (const 64 2) = g_177_low60_20_low20_0 - f_177_low60_20_low20_0,
    r_197_198 * (const 64 2) = r_197_197 - u_197_197,
    s_197_198 * (const 64 2) = s_197_197 - v_197_197
;

assume
    f_177_low60_20_low20_1 = g_177_low60_20_low20_0,
    u_197_198 = r_197_197,
    v_197_198 = s_197_197,
    g_177_low60_20_low20_1 * 2 = g_177_low60_20_low20_0 - f_177_low60_20_low20_0,
    r_197_198 * 2 = r_197_197 - u_197_197,
    s_197_198 * 2 = s_197_197 - v_197_197
&&
    true
;

{
    u_197_198 * f_177_low60_20_low20_0 + v_197_198 * g_177_low60_20_low20_0 = f_177_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_198 * f_177_low60_20_low20_0 + s_197_198 * g_177_low60_20_low20_0 = g_177_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_1 + u_197_198 * (const 64 (2**21)) + v_197_198 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_1 + r_197_198 * (const 64 (2**21)) + s_197_198 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_1,
    f_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_1,
    g_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 198)) <=s delta, delta <=s (const 64 (1 + 2*198)),
    (const 64 (-(2**20))) <=s u_197_198, u_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_198, v_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_198, r_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_198, s_197_198 <=s (const 64 ((2**20)-1)),
    u_197_198 + v_197_198 <=s (const 64 (2**20)),
    u_197_198 - v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 + v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 - v_197_198 <=s (const 64 (2**20)),
    r_197_198 + s_197_198 <=s (const 64 (2**20)),
    r_197_198 - s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 + s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 - s_197_198 <=s (const 64 (2**20)),
    u_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_197_198 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_198_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_1,
sint64 g_177_low60_20_low20_1,
sint64 f_177_low60_20_low20_2,
sint64 g_177_low60_20_low20_2,
sint64 u_197_198,
sint64 v_197_198,
sint64 r_197_198,
sint64 s_197_198,
sint64 u_197_199,
sint64 v_197_199,
sint64 r_197_199,
sint64 s_197_199,
bit ne
)={
    u_197_198 * f_177_low60_20_low20_0 + v_197_198 * g_177_low60_20_low20_0 = f_177_low60_20_low20_1 * (-(2**20)),
    r_197_198 * f_177_low60_20_low20_0 + s_197_198 * g_177_low60_20_low20_0 = g_177_low60_20_low20_1 * (-(2**20))
&&
    u_197_198 * f_177_low60_20_low20_0 + v_197_198 * g_177_low60_20_low20_0 = f_177_low60_20_low20_1 * (const 64 (-(2**20))),
    r_197_198 * f_177_low60_20_low20_0 + s_197_198 * g_177_low60_20_low20_0 = g_177_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_1 + u_197_198 * (const 64 (2**21)) + v_197_198 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_1 + r_197_198 * (const 64 (2**21)) + s_197_198 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_1,
    f_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_1,
    g_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 198)) <=s delta, delta <=s (const 64 (1 + 2*198)),
    (const 64 (-(2**20))) <=s u_197_198, u_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_198, v_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_198, r_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_198, s_197_198 <=s (const 64 ((2**20)-1)),
    u_197_198 + v_197_198 <=s (const 64 (2**20)),
    u_197_198 - v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 + v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 - v_197_198 <=s (const 64 (2**20)),
    r_197_198 + s_197_198 <=s (const 64 (2**20)),
    r_197_198 - s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 + s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 - s_197_198 <=s (const 64 (2**20)),
    u_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_197_198 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step198

// premise a
assume
g_177_low60_20_low20_1 = 0 (mod 2)
&&
g_177_low60_20_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_2 f_177_low60_20_low20_1;
mov u_197_199 u_197_198;
mov v_197_199 v_197_198;

asr g_177_low60_20_low20_2 g_177_low60_20_low20_1 1;
asr r_197_199 r_197_198 1;
asr s_197_199 s_197_198 1;
assert
    true
&&
    f_177_low60_20_low20_2 = f_177_low60_20_low20_1,
    u_197_199 = u_197_198,
    v_197_199 = v_197_198,
    g_177_low60_20_low20_2 * (const 64 2) = g_177_low60_20_low20_1,
    r_197_199 * (const 64 2) = r_197_198,
    s_197_199 * (const 64 2) = s_197_198
;

assume
    f_177_low60_20_low20_2 = f_177_low60_20_low20_1,
    u_197_199 = u_197_198,
    v_197_199 = v_197_198,
    g_177_low60_20_low20_2 * 2 = g_177_low60_20_low20_1,
    r_197_199 * 2 = r_197_198,
    s_197_199 * 2 = s_197_198
&&
    true
;

{
    u_197_199 * f_177_low60_20_low20_0 + v_197_199 * g_177_low60_20_low20_0 = f_177_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_199 * f_177_low60_20_low20_0 + s_197_199 * g_177_low60_20_low20_0 = g_177_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_2 + u_197_199 * (const 64 (2**21)) + v_197_199 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_2 + r_197_199 * (const 64 (2**21)) + s_197_199 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_2,
    f_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_2,
    g_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 199)) <=s delta, delta <=s (const 64 (1 + 2*199)),
    (const 64 (-(2**20))) <=s u_197_199, u_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_199, v_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_199, r_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_199, s_197_199 <=s (const 64 ((2**20)-1)),
    u_197_199 + v_197_199 <=s (const 64 (2**20)),
    u_197_199 - v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 + v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 - v_197_199 <=s (const 64 (2**20)),
    r_197_199 + s_197_199 <=s (const 64 (2**20)),
    r_197_199 - s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 + s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 - s_197_199 <=s (const 64 (2**20)),
    u_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_197_199 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_198_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_1,
sint64 g_177_low60_20_low20_1,
sint64 f_177_low60_20_low20_2,
sint64 g_177_low60_20_low20_2,
sint64 u_197_198,
sint64 v_197_198,
sint64 r_197_198,
sint64 s_197_198,
sint64 u_197_199,
sint64 v_197_199,
sint64 r_197_199,
sint64 s_197_199,
bit ne
)={
    u_197_198 * f_177_low60_20_low20_0 + v_197_198 * g_177_low60_20_low20_0 = f_177_low60_20_low20_1 * (-(2**20)),
    r_197_198 * f_177_low60_20_low20_0 + s_197_198 * g_177_low60_20_low20_0 = g_177_low60_20_low20_1 * (-(2**20))
&&
    u_197_198 * f_177_low60_20_low20_0 + v_197_198 * g_177_low60_20_low20_0 = f_177_low60_20_low20_1 * (const 64 (-(2**20))),
    r_197_198 * f_177_low60_20_low20_0 + s_197_198 * g_177_low60_20_low20_0 = g_177_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_1 + u_197_198 * (const 64 (2**21)) + v_197_198 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_1 + r_197_198 * (const 64 (2**21)) + s_197_198 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_1,
    f_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_1,
    g_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 198)) <=s delta, delta <=s (const 64 (1 + 2*198)),
    (const 64 (-(2**20))) <=s u_197_198, u_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_198, v_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_198, r_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_198, s_197_198 <=s (const 64 ((2**20)-1)),
    u_197_198 + v_197_198 <=s (const 64 (2**20)),
    u_197_198 - v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 + v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 - v_197_198 <=s (const 64 (2**20)),
    r_197_198 + s_197_198 <=s (const 64 (2**20)),
    r_197_198 - s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 + s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 - s_197_198 <=s (const 64 (2**20)),
    u_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_197_198 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step198

// premise b
assume
g_177_low60_20_low20_1 = 1 (mod 2)
&&
g_177_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_2 f_177_low60_20_low20_1;
mov u_197_199 u_197_198;
mov v_197_199 v_197_198;

add g_177_low60_20_low20_2 g_177_low60_20_low20_1 f_177_low60_20_low20_1;
asr g_177_low60_20_low20_2 g_177_low60_20_low20_2 1;
add r_197_199 r_197_198 u_197_198;
asr r_197_199 r_197_199 1;
add s_197_199 s_197_198 v_197_198;
asr s_197_199 s_197_199 1;
assert
    true
&&
    f_177_low60_20_low20_2 = f_177_low60_20_low20_1,
    u_197_199 = u_197_198,
    v_197_199 = v_197_198,
    g_177_low60_20_low20_2 * (const 64 2) = g_177_low60_20_low20_1 + f_177_low60_20_low20_1,
    r_197_199 * (const 64 2) = r_197_198 + u_197_198,
    s_197_199 * (const 64 2) = s_197_198 + v_197_198
;

assume
    f_177_low60_20_low20_2 = f_177_low60_20_low20_1,
    u_197_199 = u_197_198,
    v_197_199 = v_197_198,
    g_177_low60_20_low20_2 * 2 = g_177_low60_20_low20_1 + f_177_low60_20_low20_1,
    r_197_199 * 2 = r_197_198 + u_197_198,
    s_197_199 * 2 = s_197_198 + v_197_198
&&
    true
;

{
    u_197_199 * f_177_low60_20_low20_0 + v_197_199 * g_177_low60_20_low20_0 = f_177_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_199 * f_177_low60_20_low20_0 + s_197_199 * g_177_low60_20_low20_0 = g_177_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_2 + u_197_199 * (const 64 (2**21)) + v_197_199 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_2 + r_197_199 * (const 64 (2**21)) + s_197_199 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_2,
    f_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_2,
    g_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 199)) <=s delta, delta <=s (const 64 (1 + 2*199)),
    (const 64 (-(2**20))) <=s u_197_199, u_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_199, v_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_199, r_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_199, s_197_199 <=s (const 64 ((2**20)-1)),
    u_197_199 + v_197_199 <=s (const 64 (2**20)),
    u_197_199 - v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 + v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 - v_197_199 <=s (const 64 (2**20)),
    r_197_199 + s_197_199 <=s (const 64 (2**20)),
    r_197_199 - s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 + s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 - s_197_199 <=s (const 64 (2**20)),
    u_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_197_199 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_198_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_1,
sint64 g_177_low60_20_low20_1,
sint64 f_177_low60_20_low20_2,
sint64 g_177_low60_20_low20_2,
sint64 u_197_198,
sint64 v_197_198,
sint64 r_197_198,
sint64 s_197_198,
sint64 u_197_199,
sint64 v_197_199,
sint64 r_197_199,
sint64 s_197_199,
bit ne
)={
    u_197_198 * f_177_low60_20_low20_0 + v_197_198 * g_177_low60_20_low20_0 = f_177_low60_20_low20_1 * (-(2**20)),
    r_197_198 * f_177_low60_20_low20_0 + s_197_198 * g_177_low60_20_low20_0 = g_177_low60_20_low20_1 * (-(2**20))
&&
    u_197_198 * f_177_low60_20_low20_0 + v_197_198 * g_177_low60_20_low20_0 = f_177_low60_20_low20_1 * (const 64 (-(2**20))),
    r_197_198 * f_177_low60_20_low20_0 + s_197_198 * g_177_low60_20_low20_0 = g_177_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_1 + u_197_198 * (const 64 (2**21)) + v_197_198 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_1 + r_197_198 * (const 64 (2**21)) + s_197_198 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_1,
    f_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_1,
    g_177_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 198)) <=s delta, delta <=s (const 64 (1 + 2*198)),
    (const 64 (-(2**20))) <=s u_197_198, u_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_198, v_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_198, r_197_198 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_198, s_197_198 <=s (const 64 ((2**20)-1)),
    u_197_198 + v_197_198 <=s (const 64 (2**20)),
    u_197_198 - v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 + v_197_198 <=s (const 64 (2**20)),
    (const 64 0) - u_197_198 - v_197_198 <=s (const 64 (2**20)),
    r_197_198 + s_197_198 <=s (const 64 (2**20)),
    r_197_198 - s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 + s_197_198 <=s (const 64 (2**20)),
    (const 64 0) - r_197_198 - s_197_198 <=s (const 64 (2**20)),
    u_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_197_198 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_197_198 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step198

// premise c
assume
g_177_low60_20_low20_1 = 1 (mod 2)
&&
g_177_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_2 g_177_low60_20_low20_1;
mov u_197_199 r_197_198;
mov v_197_199 s_197_198;

subs dc g_177_low60_20_low20_2 g_177_low60_20_low20_1 f_177_low60_20_low20_1;
asr g_177_low60_20_low20_2 g_177_low60_20_low20_2 1;
subs dc r_197_199 r_197_198 u_197_198;
asr r_197_199 r_197_199 1;
subs dc s_197_199 s_197_198 v_197_198;
asr s_197_199 s_197_199 1;
assert
    true
&&
    f_177_low60_20_low20_2 = g_177_low60_20_low20_1,
    u_197_199 = r_197_198,
    v_197_199 = s_197_198,
    g_177_low60_20_low20_2 * (const 64 2) = g_177_low60_20_low20_1 - f_177_low60_20_low20_1,
    r_197_199 * (const 64 2) = r_197_198 - u_197_198,
    s_197_199 * (const 64 2) = s_197_198 - v_197_198
;

assume
    f_177_low60_20_low20_2 = g_177_low60_20_low20_1,
    u_197_199 = r_197_198,
    v_197_199 = s_197_198,
    g_177_low60_20_low20_2 * 2 = g_177_low60_20_low20_1 - f_177_low60_20_low20_1,
    r_197_199 * 2 = r_197_198 - u_197_198,
    s_197_199 * 2 = s_197_198 - v_197_198
&&
    true
;

{
    u_197_199 * f_177_low60_20_low20_0 + v_197_199 * g_177_low60_20_low20_0 = f_177_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_199 * f_177_low60_20_low20_0 + s_197_199 * g_177_low60_20_low20_0 = g_177_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_2 + u_197_199 * (const 64 (2**21)) + v_197_199 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_2 + r_197_199 * (const 64 (2**21)) + s_197_199 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_2,
    f_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_2,
    g_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 199)) <=s delta, delta <=s (const 64 (1 + 2*199)),
    (const 64 (-(2**20))) <=s u_197_199, u_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_199, v_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_199, r_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_199, s_197_199 <=s (const 64 ((2**20)-1)),
    u_197_199 + v_197_199 <=s (const 64 (2**20)),
    u_197_199 - v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 + v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 - v_197_199 <=s (const 64 (2**20)),
    r_197_199 + s_197_199 <=s (const 64 (2**20)),
    r_197_199 - s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 + s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 - s_197_199 <=s (const 64 (2**20)),
    u_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_197_199 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_199_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_2,
sint64 g_177_low60_20_low20_2,
sint64 f_177_low60_20_low20_3,
sint64 g_177_low60_20_low20_3,
sint64 u_197_199,
sint64 v_197_199,
sint64 r_197_199,
sint64 s_197_199,
sint64 u_197_200,
sint64 v_197_200,
sint64 r_197_200,
sint64 s_197_200,
bit ne
)={
    u_197_199 * f_177_low60_20_low20_0 + v_197_199 * g_177_low60_20_low20_0 = f_177_low60_20_low20_2 * (-(2**20)),
    r_197_199 * f_177_low60_20_low20_0 + s_197_199 * g_177_low60_20_low20_0 = g_177_low60_20_low20_2 * (-(2**20))
&&
    u_197_199 * f_177_low60_20_low20_0 + v_197_199 * g_177_low60_20_low20_0 = f_177_low60_20_low20_2 * (const 64 (-(2**20))),
    r_197_199 * f_177_low60_20_low20_0 + s_197_199 * g_177_low60_20_low20_0 = g_177_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_2 + u_197_199 * (const 64 (2**21)) + v_197_199 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_2 + r_197_199 * (const 64 (2**21)) + s_197_199 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_2,
    f_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_2,
    g_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 199)) <=s delta, delta <=s (const 64 (1 + 2*199)),
    (const 64 (-(2**20))) <=s u_197_199, u_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_199, v_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_199, r_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_199, s_197_199 <=s (const 64 ((2**20)-1)),
    u_197_199 + v_197_199 <=s (const 64 (2**20)),
    u_197_199 - v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 + v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 - v_197_199 <=s (const 64 (2**20)),
    r_197_199 + s_197_199 <=s (const 64 (2**20)),
    r_197_199 - s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 + s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 - s_197_199 <=s (const 64 (2**20)),
    u_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_197_199 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step199

// premise a
assume
g_177_low60_20_low20_2 = 0 (mod 2)
&&
g_177_low60_20_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_3 f_177_low60_20_low20_2;
mov u_197_200 u_197_199;
mov v_197_200 v_197_199;

asr g_177_low60_20_low20_3 g_177_low60_20_low20_2 1;
asr r_197_200 r_197_199 1;
asr s_197_200 s_197_199 1;
assert
    true
&&
    f_177_low60_20_low20_3 = f_177_low60_20_low20_2,
    u_197_200 = u_197_199,
    v_197_200 = v_197_199,
    g_177_low60_20_low20_3 * (const 64 2) = g_177_low60_20_low20_2,
    r_197_200 * (const 64 2) = r_197_199,
    s_197_200 * (const 64 2) = s_197_199
;

assume
    f_177_low60_20_low20_3 = f_177_low60_20_low20_2,
    u_197_200 = u_197_199,
    v_197_200 = v_197_199,
    g_177_low60_20_low20_3 * 2 = g_177_low60_20_low20_2,
    r_197_200 * 2 = r_197_199,
    s_197_200 * 2 = s_197_199
&&
    true
;

{
    u_197_200 * f_177_low60_20_low20_0 + v_197_200 * g_177_low60_20_low20_0 = f_177_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_200 * f_177_low60_20_low20_0 + s_197_200 * g_177_low60_20_low20_0 = g_177_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_3 + u_197_200 * (const 64 (2**21)) + v_197_200 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_3 + r_197_200 * (const 64 (2**21)) + s_197_200 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_3,
    f_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_3,
    g_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 200)) <=s delta, delta <=s (const 64 (1 + 2*200)),
    (const 64 (-(2**20))) <=s u_197_200, u_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_200, v_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_200, r_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_200, s_197_200 <=s (const 64 ((2**20)-1)),
    u_197_200 + v_197_200 <=s (const 64 (2**20)),
    u_197_200 - v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 + v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 - v_197_200 <=s (const 64 (2**20)),
    r_197_200 + s_197_200 <=s (const 64 (2**20)),
    r_197_200 - s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 + s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 - s_197_200 <=s (const 64 (2**20)),
    u_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_197_200 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_199_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_2,
sint64 g_177_low60_20_low20_2,
sint64 f_177_low60_20_low20_3,
sint64 g_177_low60_20_low20_3,
sint64 u_197_199,
sint64 v_197_199,
sint64 r_197_199,
sint64 s_197_199,
sint64 u_197_200,
sint64 v_197_200,
sint64 r_197_200,
sint64 s_197_200,
bit ne
)={
    u_197_199 * f_177_low60_20_low20_0 + v_197_199 * g_177_low60_20_low20_0 = f_177_low60_20_low20_2 * (-(2**20)),
    r_197_199 * f_177_low60_20_low20_0 + s_197_199 * g_177_low60_20_low20_0 = g_177_low60_20_low20_2 * (-(2**20))
&&
    u_197_199 * f_177_low60_20_low20_0 + v_197_199 * g_177_low60_20_low20_0 = f_177_low60_20_low20_2 * (const 64 (-(2**20))),
    r_197_199 * f_177_low60_20_low20_0 + s_197_199 * g_177_low60_20_low20_0 = g_177_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_2 + u_197_199 * (const 64 (2**21)) + v_197_199 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_2 + r_197_199 * (const 64 (2**21)) + s_197_199 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_2,
    f_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_2,
    g_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 199)) <=s delta, delta <=s (const 64 (1 + 2*199)),
    (const 64 (-(2**20))) <=s u_197_199, u_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_199, v_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_199, r_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_199, s_197_199 <=s (const 64 ((2**20)-1)),
    u_197_199 + v_197_199 <=s (const 64 (2**20)),
    u_197_199 - v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 + v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 - v_197_199 <=s (const 64 (2**20)),
    r_197_199 + s_197_199 <=s (const 64 (2**20)),
    r_197_199 - s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 + s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 - s_197_199 <=s (const 64 (2**20)),
    u_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_197_199 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step199

// premise b
assume
g_177_low60_20_low20_2 = 1 (mod 2)
&&
g_177_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_3 f_177_low60_20_low20_2;
mov u_197_200 u_197_199;
mov v_197_200 v_197_199;

add g_177_low60_20_low20_3 g_177_low60_20_low20_2 f_177_low60_20_low20_2;
asr g_177_low60_20_low20_3 g_177_low60_20_low20_3 1;
add r_197_200 r_197_199 u_197_199;
asr r_197_200 r_197_200 1;
add s_197_200 s_197_199 v_197_199;
asr s_197_200 s_197_200 1;
assert
    true
&&
    f_177_low60_20_low20_3 = f_177_low60_20_low20_2,
    u_197_200 = u_197_199,
    v_197_200 = v_197_199,
    g_177_low60_20_low20_3 * (const 64 2) = g_177_low60_20_low20_2 + f_177_low60_20_low20_2,
    r_197_200 * (const 64 2) = r_197_199 + u_197_199,
    s_197_200 * (const 64 2) = s_197_199 + v_197_199
;

assume
    f_177_low60_20_low20_3 = f_177_low60_20_low20_2,
    u_197_200 = u_197_199,
    v_197_200 = v_197_199,
    g_177_low60_20_low20_3 * 2 = g_177_low60_20_low20_2 + f_177_low60_20_low20_2,
    r_197_200 * 2 = r_197_199 + u_197_199,
    s_197_200 * 2 = s_197_199 + v_197_199
&&
    true
;

{
    u_197_200 * f_177_low60_20_low20_0 + v_197_200 * g_177_low60_20_low20_0 = f_177_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_200 * f_177_low60_20_low20_0 + s_197_200 * g_177_low60_20_low20_0 = g_177_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_3 + u_197_200 * (const 64 (2**21)) + v_197_200 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_3 + r_197_200 * (const 64 (2**21)) + s_197_200 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_3,
    f_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_3,
    g_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 200)) <=s delta, delta <=s (const 64 (1 + 2*200)),
    (const 64 (-(2**20))) <=s u_197_200, u_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_200, v_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_200, r_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_200, s_197_200 <=s (const 64 ((2**20)-1)),
    u_197_200 + v_197_200 <=s (const 64 (2**20)),
    u_197_200 - v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 + v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 - v_197_200 <=s (const 64 (2**20)),
    r_197_200 + s_197_200 <=s (const 64 (2**20)),
    r_197_200 - s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 + s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 - s_197_200 <=s (const 64 (2**20)),
    u_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_197_200 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_199_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_2,
sint64 g_177_low60_20_low20_2,
sint64 f_177_low60_20_low20_3,
sint64 g_177_low60_20_low20_3,
sint64 u_197_199,
sint64 v_197_199,
sint64 r_197_199,
sint64 s_197_199,
sint64 u_197_200,
sint64 v_197_200,
sint64 r_197_200,
sint64 s_197_200,
bit ne
)={
    u_197_199 * f_177_low60_20_low20_0 + v_197_199 * g_177_low60_20_low20_0 = f_177_low60_20_low20_2 * (-(2**20)),
    r_197_199 * f_177_low60_20_low20_0 + s_197_199 * g_177_low60_20_low20_0 = g_177_low60_20_low20_2 * (-(2**20))
&&
    u_197_199 * f_177_low60_20_low20_0 + v_197_199 * g_177_low60_20_low20_0 = f_177_low60_20_low20_2 * (const 64 (-(2**20))),
    r_197_199 * f_177_low60_20_low20_0 + s_197_199 * g_177_low60_20_low20_0 = g_177_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_2 + u_197_199 * (const 64 (2**21)) + v_197_199 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_2 + r_197_199 * (const 64 (2**21)) + s_197_199 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_2,
    f_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_2,
    g_177_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 199)) <=s delta, delta <=s (const 64 (1 + 2*199)),
    (const 64 (-(2**20))) <=s u_197_199, u_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_199, v_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_199, r_197_199 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_199, s_197_199 <=s (const 64 ((2**20)-1)),
    u_197_199 + v_197_199 <=s (const 64 (2**20)),
    u_197_199 - v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 + v_197_199 <=s (const 64 (2**20)),
    (const 64 0) - u_197_199 - v_197_199 <=s (const 64 (2**20)),
    r_197_199 + s_197_199 <=s (const 64 (2**20)),
    r_197_199 - s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 + s_197_199 <=s (const 64 (2**20)),
    (const 64 0) - r_197_199 - s_197_199 <=s (const 64 (2**20)),
    u_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_197_199 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_197_199 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step199

// premise c
assume
g_177_low60_20_low20_2 = 1 (mod 2)
&&
g_177_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_3 g_177_low60_20_low20_2;
mov u_197_200 r_197_199;
mov v_197_200 s_197_199;

subs dc g_177_low60_20_low20_3 g_177_low60_20_low20_2 f_177_low60_20_low20_2;
asr g_177_low60_20_low20_3 g_177_low60_20_low20_3 1;
subs dc r_197_200 r_197_199 u_197_199;
asr r_197_200 r_197_200 1;
subs dc s_197_200 s_197_199 v_197_199;
asr s_197_200 s_197_200 1;
assert
    true
&&
    f_177_low60_20_low20_3 = g_177_low60_20_low20_2,
    u_197_200 = r_197_199,
    v_197_200 = s_197_199,
    g_177_low60_20_low20_3 * (const 64 2) = g_177_low60_20_low20_2 - f_177_low60_20_low20_2,
    r_197_200 * (const 64 2) = r_197_199 - u_197_199,
    s_197_200 * (const 64 2) = s_197_199 - v_197_199
;

assume
    f_177_low60_20_low20_3 = g_177_low60_20_low20_2,
    u_197_200 = r_197_199,
    v_197_200 = s_197_199,
    g_177_low60_20_low20_3 * 2 = g_177_low60_20_low20_2 - f_177_low60_20_low20_2,
    r_197_200 * 2 = r_197_199 - u_197_199,
    s_197_200 * 2 = s_197_199 - v_197_199
&&
    true
;

{
    u_197_200 * f_177_low60_20_low20_0 + v_197_200 * g_177_low60_20_low20_0 = f_177_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_200 * f_177_low60_20_low20_0 + s_197_200 * g_177_low60_20_low20_0 = g_177_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_3 + u_197_200 * (const 64 (2**21)) + v_197_200 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_3 + r_197_200 * (const 64 (2**21)) + s_197_200 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_3,
    f_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_3,
    g_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 200)) <=s delta, delta <=s (const 64 (1 + 2*200)),
    (const 64 (-(2**20))) <=s u_197_200, u_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_200, v_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_200, r_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_200, s_197_200 <=s (const 64 ((2**20)-1)),
    u_197_200 + v_197_200 <=s (const 64 (2**20)),
    u_197_200 - v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 + v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 - v_197_200 <=s (const 64 (2**20)),
    r_197_200 + s_197_200 <=s (const 64 (2**20)),
    r_197_200 - s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 + s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 - s_197_200 <=s (const 64 (2**20)),
    u_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_197_200 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_200_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_3,
sint64 g_177_low60_20_low20_3,
sint64 f_177_low60_20_low20_4,
sint64 g_177_low60_20_low20_4,
sint64 u_197_200,
sint64 v_197_200,
sint64 r_197_200,
sint64 s_197_200,
sint64 u_197_201,
sint64 v_197_201,
sint64 r_197_201,
sint64 s_197_201,
bit ne
)={
    u_197_200 * f_177_low60_20_low20_0 + v_197_200 * g_177_low60_20_low20_0 = f_177_low60_20_low20_3 * (-(2**20)),
    r_197_200 * f_177_low60_20_low20_0 + s_197_200 * g_177_low60_20_low20_0 = g_177_low60_20_low20_3 * (-(2**20))
&&
    u_197_200 * f_177_low60_20_low20_0 + v_197_200 * g_177_low60_20_low20_0 = f_177_low60_20_low20_3 * (const 64 (-(2**20))),
    r_197_200 * f_177_low60_20_low20_0 + s_197_200 * g_177_low60_20_low20_0 = g_177_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_3 + u_197_200 * (const 64 (2**21)) + v_197_200 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_3 + r_197_200 * (const 64 (2**21)) + s_197_200 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_3,
    f_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_3,
    g_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 200)) <=s delta, delta <=s (const 64 (1 + 2*200)),
    (const 64 (-(2**20))) <=s u_197_200, u_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_200, v_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_200, r_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_200, s_197_200 <=s (const 64 ((2**20)-1)),
    u_197_200 + v_197_200 <=s (const 64 (2**20)),
    u_197_200 - v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 + v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 - v_197_200 <=s (const 64 (2**20)),
    r_197_200 + s_197_200 <=s (const 64 (2**20)),
    r_197_200 - s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 + s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 - s_197_200 <=s (const 64 (2**20)),
    u_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_197_200 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step200

// premise a
assume
g_177_low60_20_low20_3 = 0 (mod 2)
&&
g_177_low60_20_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_4 f_177_low60_20_low20_3;
mov u_197_201 u_197_200;
mov v_197_201 v_197_200;

asr g_177_low60_20_low20_4 g_177_low60_20_low20_3 1;
asr r_197_201 r_197_200 1;
asr s_197_201 s_197_200 1;
assert
    true
&&
    f_177_low60_20_low20_4 = f_177_low60_20_low20_3,
    u_197_201 = u_197_200,
    v_197_201 = v_197_200,
    g_177_low60_20_low20_4 * (const 64 2) = g_177_low60_20_low20_3,
    r_197_201 * (const 64 2) = r_197_200,
    s_197_201 * (const 64 2) = s_197_200
;

assume
    f_177_low60_20_low20_4 = f_177_low60_20_low20_3,
    u_197_201 = u_197_200,
    v_197_201 = v_197_200,
    g_177_low60_20_low20_4 * 2 = g_177_low60_20_low20_3,
    r_197_201 * 2 = r_197_200,
    s_197_201 * 2 = s_197_200
&&
    true
;

{
    u_197_201 * f_177_low60_20_low20_0 + v_197_201 * g_177_low60_20_low20_0 = f_177_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_201 * f_177_low60_20_low20_0 + s_197_201 * g_177_low60_20_low20_0 = g_177_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_4 + u_197_201 * (const 64 (2**21)) + v_197_201 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_4 + r_197_201 * (const 64 (2**21)) + s_197_201 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_4,
    f_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_4,
    g_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 201)) <=s delta, delta <=s (const 64 (1 + 2*201)),
    (const 64 (-(2**20))) <=s u_197_201, u_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_201, v_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_201, r_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_201, s_197_201 <=s (const 64 ((2**20)-1)),
    u_197_201 + v_197_201 <=s (const 64 (2**20)),
    u_197_201 - v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 + v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 - v_197_201 <=s (const 64 (2**20)),
    r_197_201 + s_197_201 <=s (const 64 (2**20)),
    r_197_201 - s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 + s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 - s_197_201 <=s (const 64 (2**20)),
    u_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_197_201 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_200_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_3,
sint64 g_177_low60_20_low20_3,
sint64 f_177_low60_20_low20_4,
sint64 g_177_low60_20_low20_4,
sint64 u_197_200,
sint64 v_197_200,
sint64 r_197_200,
sint64 s_197_200,
sint64 u_197_201,
sint64 v_197_201,
sint64 r_197_201,
sint64 s_197_201,
bit ne
)={
    u_197_200 * f_177_low60_20_low20_0 + v_197_200 * g_177_low60_20_low20_0 = f_177_low60_20_low20_3 * (-(2**20)),
    r_197_200 * f_177_low60_20_low20_0 + s_197_200 * g_177_low60_20_low20_0 = g_177_low60_20_low20_3 * (-(2**20))
&&
    u_197_200 * f_177_low60_20_low20_0 + v_197_200 * g_177_low60_20_low20_0 = f_177_low60_20_low20_3 * (const 64 (-(2**20))),
    r_197_200 * f_177_low60_20_low20_0 + s_197_200 * g_177_low60_20_low20_0 = g_177_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_3 + u_197_200 * (const 64 (2**21)) + v_197_200 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_3 + r_197_200 * (const 64 (2**21)) + s_197_200 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_3,
    f_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_3,
    g_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 200)) <=s delta, delta <=s (const 64 (1 + 2*200)),
    (const 64 (-(2**20))) <=s u_197_200, u_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_200, v_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_200, r_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_200, s_197_200 <=s (const 64 ((2**20)-1)),
    u_197_200 + v_197_200 <=s (const 64 (2**20)),
    u_197_200 - v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 + v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 - v_197_200 <=s (const 64 (2**20)),
    r_197_200 + s_197_200 <=s (const 64 (2**20)),
    r_197_200 - s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 + s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 - s_197_200 <=s (const 64 (2**20)),
    u_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_197_200 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step200

// premise b
assume
g_177_low60_20_low20_3 = 1 (mod 2)
&&
g_177_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_4 f_177_low60_20_low20_3;
mov u_197_201 u_197_200;
mov v_197_201 v_197_200;

add g_177_low60_20_low20_4 g_177_low60_20_low20_3 f_177_low60_20_low20_3;
asr g_177_low60_20_low20_4 g_177_low60_20_low20_4 1;
add r_197_201 r_197_200 u_197_200;
asr r_197_201 r_197_201 1;
add s_197_201 s_197_200 v_197_200;
asr s_197_201 s_197_201 1;
assert
    true
&&
    f_177_low60_20_low20_4 = f_177_low60_20_low20_3,
    u_197_201 = u_197_200,
    v_197_201 = v_197_200,
    g_177_low60_20_low20_4 * (const 64 2) = g_177_low60_20_low20_3 + f_177_low60_20_low20_3,
    r_197_201 * (const 64 2) = r_197_200 + u_197_200,
    s_197_201 * (const 64 2) = s_197_200 + v_197_200
;

assume
    f_177_low60_20_low20_4 = f_177_low60_20_low20_3,
    u_197_201 = u_197_200,
    v_197_201 = v_197_200,
    g_177_low60_20_low20_4 * 2 = g_177_low60_20_low20_3 + f_177_low60_20_low20_3,
    r_197_201 * 2 = r_197_200 + u_197_200,
    s_197_201 * 2 = s_197_200 + v_197_200
&&
    true
;

{
    u_197_201 * f_177_low60_20_low20_0 + v_197_201 * g_177_low60_20_low20_0 = f_177_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_201 * f_177_low60_20_low20_0 + s_197_201 * g_177_low60_20_low20_0 = g_177_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_4 + u_197_201 * (const 64 (2**21)) + v_197_201 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_4 + r_197_201 * (const 64 (2**21)) + s_197_201 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_4,
    f_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_4,
    g_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 201)) <=s delta, delta <=s (const 64 (1 + 2*201)),
    (const 64 (-(2**20))) <=s u_197_201, u_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_201, v_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_201, r_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_201, s_197_201 <=s (const 64 ((2**20)-1)),
    u_197_201 + v_197_201 <=s (const 64 (2**20)),
    u_197_201 - v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 + v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 - v_197_201 <=s (const 64 (2**20)),
    r_197_201 + s_197_201 <=s (const 64 (2**20)),
    r_197_201 - s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 + s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 - s_197_201 <=s (const 64 (2**20)),
    u_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_197_201 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_200_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_3,
sint64 g_177_low60_20_low20_3,
sint64 f_177_low60_20_low20_4,
sint64 g_177_low60_20_low20_4,
sint64 u_197_200,
sint64 v_197_200,
sint64 r_197_200,
sint64 s_197_200,
sint64 u_197_201,
sint64 v_197_201,
sint64 r_197_201,
sint64 s_197_201,
bit ne
)={
    u_197_200 * f_177_low60_20_low20_0 + v_197_200 * g_177_low60_20_low20_0 = f_177_low60_20_low20_3 * (-(2**20)),
    r_197_200 * f_177_low60_20_low20_0 + s_197_200 * g_177_low60_20_low20_0 = g_177_low60_20_low20_3 * (-(2**20))
&&
    u_197_200 * f_177_low60_20_low20_0 + v_197_200 * g_177_low60_20_low20_0 = f_177_low60_20_low20_3 * (const 64 (-(2**20))),
    r_197_200 * f_177_low60_20_low20_0 + s_197_200 * g_177_low60_20_low20_0 = g_177_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_3 + u_197_200 * (const 64 (2**21)) + v_197_200 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_3 + r_197_200 * (const 64 (2**21)) + s_197_200 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_3,
    f_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_3,
    g_177_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 200)) <=s delta, delta <=s (const 64 (1 + 2*200)),
    (const 64 (-(2**20))) <=s u_197_200, u_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_200, v_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_200, r_197_200 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_200, s_197_200 <=s (const 64 ((2**20)-1)),
    u_197_200 + v_197_200 <=s (const 64 (2**20)),
    u_197_200 - v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 + v_197_200 <=s (const 64 (2**20)),
    (const 64 0) - u_197_200 - v_197_200 <=s (const 64 (2**20)),
    r_197_200 + s_197_200 <=s (const 64 (2**20)),
    r_197_200 - s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 + s_197_200 <=s (const 64 (2**20)),
    (const 64 0) - r_197_200 - s_197_200 <=s (const 64 (2**20)),
    u_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_197_200 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_197_200 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step200

// premise c
assume
g_177_low60_20_low20_3 = 1 (mod 2)
&&
g_177_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_4 g_177_low60_20_low20_3;
mov u_197_201 r_197_200;
mov v_197_201 s_197_200;

subs dc g_177_low60_20_low20_4 g_177_low60_20_low20_3 f_177_low60_20_low20_3;
asr g_177_low60_20_low20_4 g_177_low60_20_low20_4 1;
subs dc r_197_201 r_197_200 u_197_200;
asr r_197_201 r_197_201 1;
subs dc s_197_201 s_197_200 v_197_200;
asr s_197_201 s_197_201 1;
assert
    true
&&
    f_177_low60_20_low20_4 = g_177_low60_20_low20_3,
    u_197_201 = r_197_200,
    v_197_201 = s_197_200,
    g_177_low60_20_low20_4 * (const 64 2) = g_177_low60_20_low20_3 - f_177_low60_20_low20_3,
    r_197_201 * (const 64 2) = r_197_200 - u_197_200,
    s_197_201 * (const 64 2) = s_197_200 - v_197_200
;

assume
    f_177_low60_20_low20_4 = g_177_low60_20_low20_3,
    u_197_201 = r_197_200,
    v_197_201 = s_197_200,
    g_177_low60_20_low20_4 * 2 = g_177_low60_20_low20_3 - f_177_low60_20_low20_3,
    r_197_201 * 2 = r_197_200 - u_197_200,
    s_197_201 * 2 = s_197_200 - v_197_200
&&
    true
;

{
    u_197_201 * f_177_low60_20_low20_0 + v_197_201 * g_177_low60_20_low20_0 = f_177_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_201 * f_177_low60_20_low20_0 + s_197_201 * g_177_low60_20_low20_0 = g_177_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_4 + u_197_201 * (const 64 (2**21)) + v_197_201 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_4 + r_197_201 * (const 64 (2**21)) + s_197_201 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_4,
    f_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_4,
    g_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 201)) <=s delta, delta <=s (const 64 (1 + 2*201)),
    (const 64 (-(2**20))) <=s u_197_201, u_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_201, v_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_201, r_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_201, s_197_201 <=s (const 64 ((2**20)-1)),
    u_197_201 + v_197_201 <=s (const 64 (2**20)),
    u_197_201 - v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 + v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 - v_197_201 <=s (const 64 (2**20)),
    r_197_201 + s_197_201 <=s (const 64 (2**20)),
    r_197_201 - s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 + s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 - s_197_201 <=s (const 64 (2**20)),
    u_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_197_201 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_201_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_4,
sint64 g_177_low60_20_low20_4,
sint64 f_177_low60_20_low20_5,
sint64 g_177_low60_20_low20_5,
sint64 u_197_201,
sint64 v_197_201,
sint64 r_197_201,
sint64 s_197_201,
sint64 u_197_202,
sint64 v_197_202,
sint64 r_197_202,
sint64 s_197_202,
bit ne
)={
    u_197_201 * f_177_low60_20_low20_0 + v_197_201 * g_177_low60_20_low20_0 = f_177_low60_20_low20_4 * (-(2**20)),
    r_197_201 * f_177_low60_20_low20_0 + s_197_201 * g_177_low60_20_low20_0 = g_177_low60_20_low20_4 * (-(2**20))
&&
    u_197_201 * f_177_low60_20_low20_0 + v_197_201 * g_177_low60_20_low20_0 = f_177_low60_20_low20_4 * (const 64 (-(2**20))),
    r_197_201 * f_177_low60_20_low20_0 + s_197_201 * g_177_low60_20_low20_0 = g_177_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_4 + u_197_201 * (const 64 (2**21)) + v_197_201 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_4 + r_197_201 * (const 64 (2**21)) + s_197_201 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_4,
    f_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_4,
    g_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 201)) <=s delta, delta <=s (const 64 (1 + 2*201)),
    (const 64 (-(2**20))) <=s u_197_201, u_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_201, v_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_201, r_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_201, s_197_201 <=s (const 64 ((2**20)-1)),
    u_197_201 + v_197_201 <=s (const 64 (2**20)),
    u_197_201 - v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 + v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 - v_197_201 <=s (const 64 (2**20)),
    r_197_201 + s_197_201 <=s (const 64 (2**20)),
    r_197_201 - s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 + s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 - s_197_201 <=s (const 64 (2**20)),
    u_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_197_201 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step201

// premise a
assume
g_177_low60_20_low20_4 = 0 (mod 2)
&&
g_177_low60_20_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_5 f_177_low60_20_low20_4;
mov u_197_202 u_197_201;
mov v_197_202 v_197_201;

asr g_177_low60_20_low20_5 g_177_low60_20_low20_4 1;
asr r_197_202 r_197_201 1;
asr s_197_202 s_197_201 1;
assert
    true
&&
    f_177_low60_20_low20_5 = f_177_low60_20_low20_4,
    u_197_202 = u_197_201,
    v_197_202 = v_197_201,
    g_177_low60_20_low20_5 * (const 64 2) = g_177_low60_20_low20_4,
    r_197_202 * (const 64 2) = r_197_201,
    s_197_202 * (const 64 2) = s_197_201
;

assume
    f_177_low60_20_low20_5 = f_177_low60_20_low20_4,
    u_197_202 = u_197_201,
    v_197_202 = v_197_201,
    g_177_low60_20_low20_5 * 2 = g_177_low60_20_low20_4,
    r_197_202 * 2 = r_197_201,
    s_197_202 * 2 = s_197_201
&&
    true
;

{
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_5 + u_197_202 * (const 64 (2**21)) + v_197_202 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_5 + r_197_202 * (const 64 (2**21)) + s_197_202 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_5,
    f_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_5,
    g_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 202)) <=s delta, delta <=s (const 64 (1 + 2*202)),
    (const 64 (-(2**20))) <=s u_197_202, u_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_202, v_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_202, r_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_202, s_197_202 <=s (const 64 ((2**20)-1)),
    u_197_202 + v_197_202 <=s (const 64 (2**20)),
    u_197_202 - v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 + v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 - v_197_202 <=s (const 64 (2**20)),
    r_197_202 + s_197_202 <=s (const 64 (2**20)),
    r_197_202 - s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 + s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 - s_197_202 <=s (const 64 (2**20)),
    u_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_197_202 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_201_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_4,
sint64 g_177_low60_20_low20_4,
sint64 f_177_low60_20_low20_5,
sint64 g_177_low60_20_low20_5,
sint64 u_197_201,
sint64 v_197_201,
sint64 r_197_201,
sint64 s_197_201,
sint64 u_197_202,
sint64 v_197_202,
sint64 r_197_202,
sint64 s_197_202,
bit ne
)={
    u_197_201 * f_177_low60_20_low20_0 + v_197_201 * g_177_low60_20_low20_0 = f_177_low60_20_low20_4 * (-(2**20)),
    r_197_201 * f_177_low60_20_low20_0 + s_197_201 * g_177_low60_20_low20_0 = g_177_low60_20_low20_4 * (-(2**20))
&&
    u_197_201 * f_177_low60_20_low20_0 + v_197_201 * g_177_low60_20_low20_0 = f_177_low60_20_low20_4 * (const 64 (-(2**20))),
    r_197_201 * f_177_low60_20_low20_0 + s_197_201 * g_177_low60_20_low20_0 = g_177_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_4 + u_197_201 * (const 64 (2**21)) + v_197_201 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_4 + r_197_201 * (const 64 (2**21)) + s_197_201 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_4,
    f_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_4,
    g_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 201)) <=s delta, delta <=s (const 64 (1 + 2*201)),
    (const 64 (-(2**20))) <=s u_197_201, u_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_201, v_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_201, r_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_201, s_197_201 <=s (const 64 ((2**20)-1)),
    u_197_201 + v_197_201 <=s (const 64 (2**20)),
    u_197_201 - v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 + v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 - v_197_201 <=s (const 64 (2**20)),
    r_197_201 + s_197_201 <=s (const 64 (2**20)),
    r_197_201 - s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 + s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 - s_197_201 <=s (const 64 (2**20)),
    u_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_197_201 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step201

// premise b
assume
g_177_low60_20_low20_4 = 1 (mod 2)
&&
g_177_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_5 f_177_low60_20_low20_4;
mov u_197_202 u_197_201;
mov v_197_202 v_197_201;

add g_177_low60_20_low20_5 g_177_low60_20_low20_4 f_177_low60_20_low20_4;
asr g_177_low60_20_low20_5 g_177_low60_20_low20_5 1;
add r_197_202 r_197_201 u_197_201;
asr r_197_202 r_197_202 1;
add s_197_202 s_197_201 v_197_201;
asr s_197_202 s_197_202 1;
assert
    true
&&
    f_177_low60_20_low20_5 = f_177_low60_20_low20_4,
    u_197_202 = u_197_201,
    v_197_202 = v_197_201,
    g_177_low60_20_low20_5 * (const 64 2) = g_177_low60_20_low20_4 + f_177_low60_20_low20_4,
    r_197_202 * (const 64 2) = r_197_201 + u_197_201,
    s_197_202 * (const 64 2) = s_197_201 + v_197_201
;

assume
    f_177_low60_20_low20_5 = f_177_low60_20_low20_4,
    u_197_202 = u_197_201,
    v_197_202 = v_197_201,
    g_177_low60_20_low20_5 * 2 = g_177_low60_20_low20_4 + f_177_low60_20_low20_4,
    r_197_202 * 2 = r_197_201 + u_197_201,
    s_197_202 * 2 = s_197_201 + v_197_201
&&
    true
;

{
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_5 + u_197_202 * (const 64 (2**21)) + v_197_202 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_5 + r_197_202 * (const 64 (2**21)) + s_197_202 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_5,
    f_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_5,
    g_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 202)) <=s delta, delta <=s (const 64 (1 + 2*202)),
    (const 64 (-(2**20))) <=s u_197_202, u_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_202, v_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_202, r_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_202, s_197_202 <=s (const 64 ((2**20)-1)),
    u_197_202 + v_197_202 <=s (const 64 (2**20)),
    u_197_202 - v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 + v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 - v_197_202 <=s (const 64 (2**20)),
    r_197_202 + s_197_202 <=s (const 64 (2**20)),
    r_197_202 - s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 + s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 - s_197_202 <=s (const 64 (2**20)),
    u_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_197_202 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_201_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_4,
sint64 g_177_low60_20_low20_4,
sint64 f_177_low60_20_low20_5,
sint64 g_177_low60_20_low20_5,
sint64 u_197_201,
sint64 v_197_201,
sint64 r_197_201,
sint64 s_197_201,
sint64 u_197_202,
sint64 v_197_202,
sint64 r_197_202,
sint64 s_197_202,
bit ne
)={
    u_197_201 * f_177_low60_20_low20_0 + v_197_201 * g_177_low60_20_low20_0 = f_177_low60_20_low20_4 * (-(2**20)),
    r_197_201 * f_177_low60_20_low20_0 + s_197_201 * g_177_low60_20_low20_0 = g_177_low60_20_low20_4 * (-(2**20))
&&
    u_197_201 * f_177_low60_20_low20_0 + v_197_201 * g_177_low60_20_low20_0 = f_177_low60_20_low20_4 * (const 64 (-(2**20))),
    r_197_201 * f_177_low60_20_low20_0 + s_197_201 * g_177_low60_20_low20_0 = g_177_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_4 + u_197_201 * (const 64 (2**21)) + v_197_201 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_4 + r_197_201 * (const 64 (2**21)) + s_197_201 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_4,
    f_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_4,
    g_177_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 201)) <=s delta, delta <=s (const 64 (1 + 2*201)),
    (const 64 (-(2**20))) <=s u_197_201, u_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_201, v_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_201, r_197_201 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_201, s_197_201 <=s (const 64 ((2**20)-1)),
    u_197_201 + v_197_201 <=s (const 64 (2**20)),
    u_197_201 - v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 + v_197_201 <=s (const 64 (2**20)),
    (const 64 0) - u_197_201 - v_197_201 <=s (const 64 (2**20)),
    r_197_201 + s_197_201 <=s (const 64 (2**20)),
    r_197_201 - s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 + s_197_201 <=s (const 64 (2**20)),
    (const 64 0) - r_197_201 - s_197_201 <=s (const 64 (2**20)),
    u_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_197_201 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_197_201 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step201

// premise c
assume
g_177_low60_20_low20_4 = 1 (mod 2)
&&
g_177_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_5 g_177_low60_20_low20_4;
mov u_197_202 r_197_201;
mov v_197_202 s_197_201;

subs dc g_177_low60_20_low20_5 g_177_low60_20_low20_4 f_177_low60_20_low20_4;
asr g_177_low60_20_low20_5 g_177_low60_20_low20_5 1;
subs dc r_197_202 r_197_201 u_197_201;
asr r_197_202 r_197_202 1;
subs dc s_197_202 s_197_201 v_197_201;
asr s_197_202 s_197_202 1;
assert
    true
&&
    f_177_low60_20_low20_5 = g_177_low60_20_low20_4,
    u_197_202 = r_197_201,
    v_197_202 = s_197_201,
    g_177_low60_20_low20_5 * (const 64 2) = g_177_low60_20_low20_4 - f_177_low60_20_low20_4,
    r_197_202 * (const 64 2) = r_197_201 - u_197_201,
    s_197_202 * (const 64 2) = s_197_201 - v_197_201
;

assume
    f_177_low60_20_low20_5 = g_177_low60_20_low20_4,
    u_197_202 = r_197_201,
    v_197_202 = s_197_201,
    g_177_low60_20_low20_5 * 2 = g_177_low60_20_low20_4 - f_177_low60_20_low20_4,
    r_197_202 * 2 = r_197_201 - u_197_201,
    s_197_202 * 2 = s_197_201 - v_197_201
&&
    true
;

{
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_5 + u_197_202 * (const 64 (2**21)) + v_197_202 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_5 + r_197_202 * (const 64 (2**21)) + s_197_202 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_5,
    f_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_5,
    g_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 202)) <=s delta, delta <=s (const 64 (1 + 2*202)),
    (const 64 (-(2**20))) <=s u_197_202, u_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_202, v_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_202, r_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_202, s_197_202 <=s (const 64 ((2**20)-1)),
    u_197_202 + v_197_202 <=s (const 64 (2**20)),
    u_197_202 - v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 + v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 - v_197_202 <=s (const 64 (2**20)),
    r_197_202 + s_197_202 <=s (const 64 (2**20)),
    r_197_202 - s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 + s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 - s_197_202 <=s (const 64 (2**20)),
    u_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_197_202 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_202_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_5,
sint64 g_177_low60_20_low20_5,
sint64 f_177_low60_20_low20_6,
sint64 g_177_low60_20_low20_6,
sint64 u_197_202,
sint64 v_197_202,
sint64 r_197_202,
sint64 s_197_202,
sint64 u_197_203,
sint64 v_197_203,
sint64 r_197_203,
sint64 s_197_203,
bit ne
)={
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (-(2**20)),
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (-(2**20))
&&
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (const 64 (-(2**20))),
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_5 + u_197_202 * (const 64 (2**21)) + v_197_202 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_5 + r_197_202 * (const 64 (2**21)) + s_197_202 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_5,
    f_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_5,
    g_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 202)) <=s delta, delta <=s (const 64 (1 + 2*202)),
    (const 64 (-(2**20))) <=s u_197_202, u_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_202, v_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_202, r_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_202, s_197_202 <=s (const 64 ((2**20)-1)),
    u_197_202 + v_197_202 <=s (const 64 (2**20)),
    u_197_202 - v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 + v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 - v_197_202 <=s (const 64 (2**20)),
    r_197_202 + s_197_202 <=s (const 64 (2**20)),
    r_197_202 - s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 + s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 - s_197_202 <=s (const 64 (2**20)),
    u_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_197_202 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step202

// premise a
assume
g_177_low60_20_low20_5 = 0 (mod 2)
&&
g_177_low60_20_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_6 f_177_low60_20_low20_5;
mov u_197_203 u_197_202;
mov v_197_203 v_197_202;

asr g_177_low60_20_low20_6 g_177_low60_20_low20_5 1;
asr r_197_203 r_197_202 1;
asr s_197_203 s_197_202 1;
assert
    true
&&
    f_177_low60_20_low20_6 = f_177_low60_20_low20_5,
    u_197_203 = u_197_202,
    v_197_203 = v_197_202,
    g_177_low60_20_low20_6 * (const 64 2) = g_177_low60_20_low20_5,
    r_197_203 * (const 64 2) = r_197_202,
    s_197_203 * (const 64 2) = s_197_202
;

assume
    f_177_low60_20_low20_6 = f_177_low60_20_low20_5,
    u_197_203 = u_197_202,
    v_197_203 = v_197_202,
    g_177_low60_20_low20_6 * 2 = g_177_low60_20_low20_5,
    r_197_203 * 2 = r_197_202,
    s_197_203 * 2 = s_197_202
&&
    true
;

{
    u_197_203 * f_177_low60_20_low20_0 + v_197_203 * g_177_low60_20_low20_0 = f_177_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_203 * f_177_low60_20_low20_0 + s_197_203 * g_177_low60_20_low20_0 = g_177_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_6 + u_197_203 * (const 64 (2**21)) + v_197_203 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_6 + r_197_203 * (const 64 (2**21)) + s_197_203 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_6,
    f_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_6,
    g_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 203)) <=s delta, delta <=s (const 64 (1 + 2*203)),
    (const 64 (-(2**20))) <=s u_197_203, u_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_203, v_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_203, r_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_203, s_197_203 <=s (const 64 ((2**20)-1)),
    u_197_203 + v_197_203 <=s (const 64 (2**20)),
    u_197_203 - v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 + v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 - v_197_203 <=s (const 64 (2**20)),
    r_197_203 + s_197_203 <=s (const 64 (2**20)),
    r_197_203 - s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 + s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 - s_197_203 <=s (const 64 (2**20)),
    u_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_197_203 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_202_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_5,
sint64 g_177_low60_20_low20_5,
sint64 f_177_low60_20_low20_6,
sint64 g_177_low60_20_low20_6,
sint64 u_197_202,
sint64 v_197_202,
sint64 r_197_202,
sint64 s_197_202,
sint64 u_197_203,
sint64 v_197_203,
sint64 r_197_203,
sint64 s_197_203,
bit ne
)={
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (-(2**20)),
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (-(2**20))
&&
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (const 64 (-(2**20))),
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_5 + u_197_202 * (const 64 (2**21)) + v_197_202 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_5 + r_197_202 * (const 64 (2**21)) + s_197_202 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_5,
    f_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_5,
    g_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 202)) <=s delta, delta <=s (const 64 (1 + 2*202)),
    (const 64 (-(2**20))) <=s u_197_202, u_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_202, v_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_202, r_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_202, s_197_202 <=s (const 64 ((2**20)-1)),
    u_197_202 + v_197_202 <=s (const 64 (2**20)),
    u_197_202 - v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 + v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 - v_197_202 <=s (const 64 (2**20)),
    r_197_202 + s_197_202 <=s (const 64 (2**20)),
    r_197_202 - s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 + s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 - s_197_202 <=s (const 64 (2**20)),
    u_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_197_202 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step202

// premise b
assume
g_177_low60_20_low20_5 = 1 (mod 2)
&&
g_177_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_6 f_177_low60_20_low20_5;
mov u_197_203 u_197_202;
mov v_197_203 v_197_202;

add g_177_low60_20_low20_6 g_177_low60_20_low20_5 f_177_low60_20_low20_5;
asr g_177_low60_20_low20_6 g_177_low60_20_low20_6 1;
add r_197_203 r_197_202 u_197_202;
asr r_197_203 r_197_203 1;
add s_197_203 s_197_202 v_197_202;
asr s_197_203 s_197_203 1;
assert
    true
&&
    f_177_low60_20_low20_6 = f_177_low60_20_low20_5,
    u_197_203 = u_197_202,
    v_197_203 = v_197_202,
    g_177_low60_20_low20_6 * (const 64 2) = g_177_low60_20_low20_5 + f_177_low60_20_low20_5,
    r_197_203 * (const 64 2) = r_197_202 + u_197_202,
    s_197_203 * (const 64 2) = s_197_202 + v_197_202
;

assume
    f_177_low60_20_low20_6 = f_177_low60_20_low20_5,
    u_197_203 = u_197_202,
    v_197_203 = v_197_202,
    g_177_low60_20_low20_6 * 2 = g_177_low60_20_low20_5 + f_177_low60_20_low20_5,
    r_197_203 * 2 = r_197_202 + u_197_202,
    s_197_203 * 2 = s_197_202 + v_197_202
&&
    true
;

{
    u_197_203 * f_177_low60_20_low20_0 + v_197_203 * g_177_low60_20_low20_0 = f_177_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_203 * f_177_low60_20_low20_0 + s_197_203 * g_177_low60_20_low20_0 = g_177_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_6 + u_197_203 * (const 64 (2**21)) + v_197_203 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_6 + r_197_203 * (const 64 (2**21)) + s_197_203 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_6,
    f_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_6,
    g_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 203)) <=s delta, delta <=s (const 64 (1 + 2*203)),
    (const 64 (-(2**20))) <=s u_197_203, u_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_203, v_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_203, r_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_203, s_197_203 <=s (const 64 ((2**20)-1)),
    u_197_203 + v_197_203 <=s (const 64 (2**20)),
    u_197_203 - v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 + v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 - v_197_203 <=s (const 64 (2**20)),
    r_197_203 + s_197_203 <=s (const 64 (2**20)),
    r_197_203 - s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 + s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 - s_197_203 <=s (const 64 (2**20)),
    u_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_197_203 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_202_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_5,
sint64 g_177_low60_20_low20_5,
sint64 f_177_low60_20_low20_6,
sint64 g_177_low60_20_low20_6,
sint64 u_197_202,
sint64 v_197_202,
sint64 r_197_202,
sint64 s_197_202,
sint64 u_197_203,
sint64 v_197_203,
sint64 r_197_203,
sint64 s_197_203,
bit ne
)={
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (-(2**20)),
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (-(2**20))
&&
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (const 64 (-(2**20))),
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_5 + u_197_202 * (const 64 (2**21)) + v_197_202 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_5 + r_197_202 * (const 64 (2**21)) + s_197_202 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_5,
    f_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_5,
    g_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 202)) <=s delta, delta <=s (const 64 (1 + 2*202)),
    (const 64 (-(2**20))) <=s u_197_202, u_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_202, v_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_202, r_197_202 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_202, s_197_202 <=s (const 64 ((2**20)-1)),
    u_197_202 + v_197_202 <=s (const 64 (2**20)),
    u_197_202 - v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 + v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 - v_197_202 <=s (const 64 (2**20)),
    r_197_202 + s_197_202 <=s (const 64 (2**20)),
    r_197_202 - s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 + s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 - s_197_202 <=s (const 64 (2**20)),
    u_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_197_202 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step202

// premise c
assume
g_177_low60_20_low20_5 = 1 (mod 2)
&&
g_177_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_6 g_177_low60_20_low20_5;
mov u_197_203 r_197_202;
mov v_197_203 s_197_202;

subs dc g_177_low60_20_low20_6 g_177_low60_20_low20_5 f_177_low60_20_low20_5;
asr g_177_low60_20_low20_6 g_177_low60_20_low20_6 1;
subs dc r_197_203 r_197_202 u_197_202;
asr r_197_203 r_197_203 1;
subs dc s_197_203 s_197_202 v_197_202;
asr s_197_203 s_197_203 1;
assert
    true
&&
    f_177_low60_20_low20_6 = g_177_low60_20_low20_5,
    u_197_203 = r_197_202,
    v_197_203 = s_197_202,
    g_177_low60_20_low20_6 * (const 64 2) = g_177_low60_20_low20_5 - f_177_low60_20_low20_5,
    r_197_203 * (const 64 2) = r_197_202 - u_197_202,
    s_197_203 * (const 64 2) = s_197_202 - v_197_202
;

assume
    f_177_low60_20_low20_6 = g_177_low60_20_low20_5,
    u_197_203 = r_197_202,
    v_197_203 = s_197_202,
    g_177_low60_20_low20_6 * 2 = g_177_low60_20_low20_5 - f_177_low60_20_low20_5,
    r_197_203 * 2 = r_197_202 - u_197_202,
    s_197_203 * 2 = s_197_202 - v_197_202
&&
    true
;

{
    u_197_203 * f_177_low60_20_low20_0 + v_197_203 * g_177_low60_20_low20_0 = f_177_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_203 * f_177_low60_20_low20_0 + s_197_203 * g_177_low60_20_low20_0 = g_177_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_6 + u_197_203 * (const 64 (2**21)) + v_197_203 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_6 + r_197_203 * (const 64 (2**21)) + s_197_203 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_6,
    f_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_6,
    g_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 203)) <=s delta, delta <=s (const 64 (1 + 2*203)),
    (const 64 (-(2**20))) <=s u_197_203, u_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_203, v_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_203, r_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_203, s_197_203 <=s (const 64 ((2**20)-1)),
    u_197_203 + v_197_203 <=s (const 64 (2**20)),
    u_197_203 - v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 + v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 - v_197_203 <=s (const 64 (2**20)),
    r_197_203 + s_197_203 <=s (const 64 (2**20)),
    r_197_203 - s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 + s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 - s_197_203 <=s (const 64 (2**20)),
    u_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_197_203 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_203_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_6,
sint64 g_177_low60_20_low20_6,
sint64 f_177_low60_20_low20_7,
sint64 g_177_low60_20_low20_7,
sint64 u_197_203,
sint64 v_197_203,
sint64 r_197_203,
sint64 s_197_203,
sint64 u_197_204,
sint64 v_197_204,
sint64 r_197_204,
sint64 s_197_204,
bit ne
)={
    u_197_203 * f_177_low60_20_low20_0 + v_197_203 * g_177_low60_20_low20_0 = f_177_low60_20_low20_6 * (-(2**20)),
    r_197_203 * f_177_low60_20_low20_0 + s_197_203 * g_177_low60_20_low20_0 = g_177_low60_20_low20_6 * (-(2**20))
&&
    u_197_203 * f_177_low60_20_low20_0 + v_197_203 * g_177_low60_20_low20_0 = f_177_low60_20_low20_6 * (const 64 (-(2**20))),
    r_197_203 * f_177_low60_20_low20_0 + s_197_203 * g_177_low60_20_low20_0 = g_177_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_6 + u_197_203 * (const 64 (2**21)) + v_197_203 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_6 + r_197_203 * (const 64 (2**21)) + s_197_203 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_6,
    f_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_6,
    g_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 203)) <=s delta, delta <=s (const 64 (1 + 2*203)),
    (const 64 (-(2**20))) <=s u_197_203, u_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_203, v_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_203, r_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_203, s_197_203 <=s (const 64 ((2**20)-1)),
    u_197_203 + v_197_203 <=s (const 64 (2**20)),
    u_197_203 - v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 + v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 - v_197_203 <=s (const 64 (2**20)),
    r_197_203 + s_197_203 <=s (const 64 (2**20)),
    r_197_203 - s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 + s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 - s_197_203 <=s (const 64 (2**20)),
    u_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_197_203 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step203

// premise a
assume
g_177_low60_20_low20_6 = 0 (mod 2)
&&
g_177_low60_20_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_7 f_177_low60_20_low20_6;
mov u_197_204 u_197_203;
mov v_197_204 v_197_203;

asr g_177_low60_20_low20_7 g_177_low60_20_low20_6 1;
asr r_197_204 r_197_203 1;
asr s_197_204 s_197_203 1;
assert
    true
&&
    f_177_low60_20_low20_7 = f_177_low60_20_low20_6,
    u_197_204 = u_197_203,
    v_197_204 = v_197_203,
    g_177_low60_20_low20_7 * (const 64 2) = g_177_low60_20_low20_6,
    r_197_204 * (const 64 2) = r_197_203,
    s_197_204 * (const 64 2) = s_197_203
;

assume
    f_177_low60_20_low20_7 = f_177_low60_20_low20_6,
    u_197_204 = u_197_203,
    v_197_204 = v_197_203,
    g_177_low60_20_low20_7 * 2 = g_177_low60_20_low20_6,
    r_197_204 * 2 = r_197_203,
    s_197_204 * 2 = s_197_203
&&
    true
;

{
    u_197_204 * f_177_low60_20_low20_0 + v_197_204 * g_177_low60_20_low20_0 = f_177_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_204 * f_177_low60_20_low20_0 + s_197_204 * g_177_low60_20_low20_0 = g_177_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_7 + u_197_204 * (const 64 (2**21)) + v_197_204 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_7 + r_197_204 * (const 64 (2**21)) + s_197_204 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_7,
    f_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_7,
    g_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 204)) <=s delta, delta <=s (const 64 (1 + 2*204)),
    (const 64 (-(2**20))) <=s u_197_204, u_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_204, v_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_204, r_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_204, s_197_204 <=s (const 64 ((2**20)-1)),
    u_197_204 + v_197_204 <=s (const 64 (2**20)),
    u_197_204 - v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 + v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 - v_197_204 <=s (const 64 (2**20)),
    r_197_204 + s_197_204 <=s (const 64 (2**20)),
    r_197_204 - s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 + s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 - s_197_204 <=s (const 64 (2**20)),
    u_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_197_204 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_203_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_6,
sint64 g_177_low60_20_low20_6,
sint64 f_177_low60_20_low20_7,
sint64 g_177_low60_20_low20_7,
sint64 u_197_203,
sint64 v_197_203,
sint64 r_197_203,
sint64 s_197_203,
sint64 u_197_204,
sint64 v_197_204,
sint64 r_197_204,
sint64 s_197_204,
bit ne
)={
    u_197_203 * f_177_low60_20_low20_0 + v_197_203 * g_177_low60_20_low20_0 = f_177_low60_20_low20_6 * (-(2**20)),
    r_197_203 * f_177_low60_20_low20_0 + s_197_203 * g_177_low60_20_low20_0 = g_177_low60_20_low20_6 * (-(2**20))
&&
    u_197_203 * f_177_low60_20_low20_0 + v_197_203 * g_177_low60_20_low20_0 = f_177_low60_20_low20_6 * (const 64 (-(2**20))),
    r_197_203 * f_177_low60_20_low20_0 + s_197_203 * g_177_low60_20_low20_0 = g_177_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_6 + u_197_203 * (const 64 (2**21)) + v_197_203 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_6 + r_197_203 * (const 64 (2**21)) + s_197_203 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_6,
    f_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_6,
    g_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 203)) <=s delta, delta <=s (const 64 (1 + 2*203)),
    (const 64 (-(2**20))) <=s u_197_203, u_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_203, v_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_203, r_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_203, s_197_203 <=s (const 64 ((2**20)-1)),
    u_197_203 + v_197_203 <=s (const 64 (2**20)),
    u_197_203 - v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 + v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 - v_197_203 <=s (const 64 (2**20)),
    r_197_203 + s_197_203 <=s (const 64 (2**20)),
    r_197_203 - s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 + s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 - s_197_203 <=s (const 64 (2**20)),
    u_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_197_203 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step203

// premise b
assume
g_177_low60_20_low20_6 = 1 (mod 2)
&&
g_177_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_7 f_177_low60_20_low20_6;
mov u_197_204 u_197_203;
mov v_197_204 v_197_203;

add g_177_low60_20_low20_7 g_177_low60_20_low20_6 f_177_low60_20_low20_6;
asr g_177_low60_20_low20_7 g_177_low60_20_low20_7 1;
add r_197_204 r_197_203 u_197_203;
asr r_197_204 r_197_204 1;
add s_197_204 s_197_203 v_197_203;
asr s_197_204 s_197_204 1;
assert
    true
&&
    f_177_low60_20_low20_7 = f_177_low60_20_low20_6,
    u_197_204 = u_197_203,
    v_197_204 = v_197_203,
    g_177_low60_20_low20_7 * (const 64 2) = g_177_low60_20_low20_6 + f_177_low60_20_low20_6,
    r_197_204 * (const 64 2) = r_197_203 + u_197_203,
    s_197_204 * (const 64 2) = s_197_203 + v_197_203
;

assume
    f_177_low60_20_low20_7 = f_177_low60_20_low20_6,
    u_197_204 = u_197_203,
    v_197_204 = v_197_203,
    g_177_low60_20_low20_7 * 2 = g_177_low60_20_low20_6 + f_177_low60_20_low20_6,
    r_197_204 * 2 = r_197_203 + u_197_203,
    s_197_204 * 2 = s_197_203 + v_197_203
&&
    true
;

{
    u_197_204 * f_177_low60_20_low20_0 + v_197_204 * g_177_low60_20_low20_0 = f_177_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_204 * f_177_low60_20_low20_0 + s_197_204 * g_177_low60_20_low20_0 = g_177_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_7 + u_197_204 * (const 64 (2**21)) + v_197_204 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_7 + r_197_204 * (const 64 (2**21)) + s_197_204 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_7,
    f_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_7,
    g_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 204)) <=s delta, delta <=s (const 64 (1 + 2*204)),
    (const 64 (-(2**20))) <=s u_197_204, u_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_204, v_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_204, r_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_204, s_197_204 <=s (const 64 ((2**20)-1)),
    u_197_204 + v_197_204 <=s (const 64 (2**20)),
    u_197_204 - v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 + v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 - v_197_204 <=s (const 64 (2**20)),
    r_197_204 + s_197_204 <=s (const 64 (2**20)),
    r_197_204 - s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 + s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 - s_197_204 <=s (const 64 (2**20)),
    u_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_197_204 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_203_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_6,
sint64 g_177_low60_20_low20_6,
sint64 f_177_low60_20_low20_7,
sint64 g_177_low60_20_low20_7,
sint64 u_197_203,
sint64 v_197_203,
sint64 r_197_203,
sint64 s_197_203,
sint64 u_197_204,
sint64 v_197_204,
sint64 r_197_204,
sint64 s_197_204,
bit ne
)={
    u_197_203 * f_177_low60_20_low20_0 + v_197_203 * g_177_low60_20_low20_0 = f_177_low60_20_low20_6 * (-(2**20)),
    r_197_203 * f_177_low60_20_low20_0 + s_197_203 * g_177_low60_20_low20_0 = g_177_low60_20_low20_6 * (-(2**20))
&&
    u_197_203 * f_177_low60_20_low20_0 + v_197_203 * g_177_low60_20_low20_0 = f_177_low60_20_low20_6 * (const 64 (-(2**20))),
    r_197_203 * f_177_low60_20_low20_0 + s_197_203 * g_177_low60_20_low20_0 = g_177_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_6 + u_197_203 * (const 64 (2**21)) + v_197_203 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_6 + r_197_203 * (const 64 (2**21)) + s_197_203 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_6,
    f_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_6,
    g_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 203)) <=s delta, delta <=s (const 64 (1 + 2*203)),
    (const 64 (-(2**20))) <=s u_197_203, u_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_203, v_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_203, r_197_203 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_203, s_197_203 <=s (const 64 ((2**20)-1)),
    u_197_203 + v_197_203 <=s (const 64 (2**20)),
    u_197_203 - v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 + v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 - v_197_203 <=s (const 64 (2**20)),
    r_197_203 + s_197_203 <=s (const 64 (2**20)),
    r_197_203 - s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 + s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 - s_197_203 <=s (const 64 (2**20)),
    u_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_197_203 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step203

// premise c
assume
g_177_low60_20_low20_6 = 1 (mod 2)
&&
g_177_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_7 g_177_low60_20_low20_6;
mov u_197_204 r_197_203;
mov v_197_204 s_197_203;

subs dc g_177_low60_20_low20_7 g_177_low60_20_low20_6 f_177_low60_20_low20_6;
asr g_177_low60_20_low20_7 g_177_low60_20_low20_7 1;
subs dc r_197_204 r_197_203 u_197_203;
asr r_197_204 r_197_204 1;
subs dc s_197_204 s_197_203 v_197_203;
asr s_197_204 s_197_204 1;
assert
    true
&&
    f_177_low60_20_low20_7 = g_177_low60_20_low20_6,
    u_197_204 = r_197_203,
    v_197_204 = s_197_203,
    g_177_low60_20_low20_7 * (const 64 2) = g_177_low60_20_low20_6 - f_177_low60_20_low20_6,
    r_197_204 * (const 64 2) = r_197_203 - u_197_203,
    s_197_204 * (const 64 2) = s_197_203 - v_197_203
;

assume
    f_177_low60_20_low20_7 = g_177_low60_20_low20_6,
    u_197_204 = r_197_203,
    v_197_204 = s_197_203,
    g_177_low60_20_low20_7 * 2 = g_177_low60_20_low20_6 - f_177_low60_20_low20_6,
    r_197_204 * 2 = r_197_203 - u_197_203,
    s_197_204 * 2 = s_197_203 - v_197_203
&&
    true
;

{
    u_197_204 * f_177_low60_20_low20_0 + v_197_204 * g_177_low60_20_low20_0 = f_177_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_204 * f_177_low60_20_low20_0 + s_197_204 * g_177_low60_20_low20_0 = g_177_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_7 + u_197_204 * (const 64 (2**21)) + v_197_204 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_7 + r_197_204 * (const 64 (2**21)) + s_197_204 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_7,
    f_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_7,
    g_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 204)) <=s delta, delta <=s (const 64 (1 + 2*204)),
    (const 64 (-(2**20))) <=s u_197_204, u_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_204, v_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_204, r_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_204, s_197_204 <=s (const 64 ((2**20)-1)),
    u_197_204 + v_197_204 <=s (const 64 (2**20)),
    u_197_204 - v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 + v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 - v_197_204 <=s (const 64 (2**20)),
    r_197_204 + s_197_204 <=s (const 64 (2**20)),
    r_197_204 - s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 + s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 - s_197_204 <=s (const 64 (2**20)),
    u_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_197_204 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_204_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_7,
sint64 g_177_low60_20_low20_7,
sint64 f_177_low60_20_low20_8,
sint64 g_177_low60_20_low20_8,
sint64 u_197_204,
sint64 v_197_204,
sint64 r_197_204,
sint64 s_197_204,
sint64 u_197_205,
sint64 v_197_205,
sint64 r_197_205,
sint64 s_197_205,
bit ne
)={
    u_197_204 * f_177_low60_20_low20_0 + v_197_204 * g_177_low60_20_low20_0 = f_177_low60_20_low20_7 * (-(2**20)),
    r_197_204 * f_177_low60_20_low20_0 + s_197_204 * g_177_low60_20_low20_0 = g_177_low60_20_low20_7 * (-(2**20))
&&
    u_197_204 * f_177_low60_20_low20_0 + v_197_204 * g_177_low60_20_low20_0 = f_177_low60_20_low20_7 * (const 64 (-(2**20))),
    r_197_204 * f_177_low60_20_low20_0 + s_197_204 * g_177_low60_20_low20_0 = g_177_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_7 + u_197_204 * (const 64 (2**21)) + v_197_204 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_7 + r_197_204 * (const 64 (2**21)) + s_197_204 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_7,
    f_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_7,
    g_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 204)) <=s delta, delta <=s (const 64 (1 + 2*204)),
    (const 64 (-(2**20))) <=s u_197_204, u_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_204, v_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_204, r_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_204, s_197_204 <=s (const 64 ((2**20)-1)),
    u_197_204 + v_197_204 <=s (const 64 (2**20)),
    u_197_204 - v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 + v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 - v_197_204 <=s (const 64 (2**20)),
    r_197_204 + s_197_204 <=s (const 64 (2**20)),
    r_197_204 - s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 + s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 - s_197_204 <=s (const 64 (2**20)),
    u_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_197_204 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step204

// premise a
assume
g_177_low60_20_low20_7 = 0 (mod 2)
&&
g_177_low60_20_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_8 f_177_low60_20_low20_7;
mov u_197_205 u_197_204;
mov v_197_205 v_197_204;

asr g_177_low60_20_low20_8 g_177_low60_20_low20_7 1;
asr r_197_205 r_197_204 1;
asr s_197_205 s_197_204 1;
assert
    true
&&
    f_177_low60_20_low20_8 = f_177_low60_20_low20_7,
    u_197_205 = u_197_204,
    v_197_205 = v_197_204,
    g_177_low60_20_low20_8 * (const 64 2) = g_177_low60_20_low20_7,
    r_197_205 * (const 64 2) = r_197_204,
    s_197_205 * (const 64 2) = s_197_204
;

assume
    f_177_low60_20_low20_8 = f_177_low60_20_low20_7,
    u_197_205 = u_197_204,
    v_197_205 = v_197_204,
    g_177_low60_20_low20_8 * 2 = g_177_low60_20_low20_7,
    r_197_205 * 2 = r_197_204,
    s_197_205 * 2 = s_197_204
&&
    true
;

{
    u_197_205 * f_177_low60_20_low20_0 + v_197_205 * g_177_low60_20_low20_0 = f_177_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_205 * f_177_low60_20_low20_0 + s_197_205 * g_177_low60_20_low20_0 = g_177_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_8 + u_197_205 * (const 64 (2**21)) + v_197_205 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_8 + r_197_205 * (const 64 (2**21)) + s_197_205 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_8,
    f_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_8,
    g_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 205)) <=s delta, delta <=s (const 64 (1 + 2*205)),
    (const 64 (-(2**20))) <=s u_197_205, u_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_205, v_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_205, r_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_205, s_197_205 <=s (const 64 ((2**20)-1)),
    u_197_205 + v_197_205 <=s (const 64 (2**20)),
    u_197_205 - v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 + v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 - v_197_205 <=s (const 64 (2**20)),
    r_197_205 + s_197_205 <=s (const 64 (2**20)),
    r_197_205 - s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 + s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 - s_197_205 <=s (const 64 (2**20)),
    u_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_197_205 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_204_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_7,
sint64 g_177_low60_20_low20_7,
sint64 f_177_low60_20_low20_8,
sint64 g_177_low60_20_low20_8,
sint64 u_197_204,
sint64 v_197_204,
sint64 r_197_204,
sint64 s_197_204,
sint64 u_197_205,
sint64 v_197_205,
sint64 r_197_205,
sint64 s_197_205,
bit ne
)={
    u_197_204 * f_177_low60_20_low20_0 + v_197_204 * g_177_low60_20_low20_0 = f_177_low60_20_low20_7 * (-(2**20)),
    r_197_204 * f_177_low60_20_low20_0 + s_197_204 * g_177_low60_20_low20_0 = g_177_low60_20_low20_7 * (-(2**20))
&&
    u_197_204 * f_177_low60_20_low20_0 + v_197_204 * g_177_low60_20_low20_0 = f_177_low60_20_low20_7 * (const 64 (-(2**20))),
    r_197_204 * f_177_low60_20_low20_0 + s_197_204 * g_177_low60_20_low20_0 = g_177_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_7 + u_197_204 * (const 64 (2**21)) + v_197_204 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_7 + r_197_204 * (const 64 (2**21)) + s_197_204 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_7,
    f_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_7,
    g_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 204)) <=s delta, delta <=s (const 64 (1 + 2*204)),
    (const 64 (-(2**20))) <=s u_197_204, u_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_204, v_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_204, r_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_204, s_197_204 <=s (const 64 ((2**20)-1)),
    u_197_204 + v_197_204 <=s (const 64 (2**20)),
    u_197_204 - v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 + v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 - v_197_204 <=s (const 64 (2**20)),
    r_197_204 + s_197_204 <=s (const 64 (2**20)),
    r_197_204 - s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 + s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 - s_197_204 <=s (const 64 (2**20)),
    u_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_197_204 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step204

// premise b
assume
g_177_low60_20_low20_7 = 1 (mod 2)
&&
g_177_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_8 f_177_low60_20_low20_7;
mov u_197_205 u_197_204;
mov v_197_205 v_197_204;

add g_177_low60_20_low20_8 g_177_low60_20_low20_7 f_177_low60_20_low20_7;
asr g_177_low60_20_low20_8 g_177_low60_20_low20_8 1;
add r_197_205 r_197_204 u_197_204;
asr r_197_205 r_197_205 1;
add s_197_205 s_197_204 v_197_204;
asr s_197_205 s_197_205 1;
assert
    true
&&
    f_177_low60_20_low20_8 = f_177_low60_20_low20_7,
    u_197_205 = u_197_204,
    v_197_205 = v_197_204,
    g_177_low60_20_low20_8 * (const 64 2) = g_177_low60_20_low20_7 + f_177_low60_20_low20_7,
    r_197_205 * (const 64 2) = r_197_204 + u_197_204,
    s_197_205 * (const 64 2) = s_197_204 + v_197_204
;

assume
    f_177_low60_20_low20_8 = f_177_low60_20_low20_7,
    u_197_205 = u_197_204,
    v_197_205 = v_197_204,
    g_177_low60_20_low20_8 * 2 = g_177_low60_20_low20_7 + f_177_low60_20_low20_7,
    r_197_205 * 2 = r_197_204 + u_197_204,
    s_197_205 * 2 = s_197_204 + v_197_204
&&
    true
;

{
    u_197_205 * f_177_low60_20_low20_0 + v_197_205 * g_177_low60_20_low20_0 = f_177_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_205 * f_177_low60_20_low20_0 + s_197_205 * g_177_low60_20_low20_0 = g_177_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_8 + u_197_205 * (const 64 (2**21)) + v_197_205 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_8 + r_197_205 * (const 64 (2**21)) + s_197_205 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_8,
    f_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_8,
    g_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 205)) <=s delta, delta <=s (const 64 (1 + 2*205)),
    (const 64 (-(2**20))) <=s u_197_205, u_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_205, v_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_205, r_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_205, s_197_205 <=s (const 64 ((2**20)-1)),
    u_197_205 + v_197_205 <=s (const 64 (2**20)),
    u_197_205 - v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 + v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 - v_197_205 <=s (const 64 (2**20)),
    r_197_205 + s_197_205 <=s (const 64 (2**20)),
    r_197_205 - s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 + s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 - s_197_205 <=s (const 64 (2**20)),
    u_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_197_205 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_204_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_7,
sint64 g_177_low60_20_low20_7,
sint64 f_177_low60_20_low20_8,
sint64 g_177_low60_20_low20_8,
sint64 u_197_204,
sint64 v_197_204,
sint64 r_197_204,
sint64 s_197_204,
sint64 u_197_205,
sint64 v_197_205,
sint64 r_197_205,
sint64 s_197_205,
bit ne
)={
    u_197_204 * f_177_low60_20_low20_0 + v_197_204 * g_177_low60_20_low20_0 = f_177_low60_20_low20_7 * (-(2**20)),
    r_197_204 * f_177_low60_20_low20_0 + s_197_204 * g_177_low60_20_low20_0 = g_177_low60_20_low20_7 * (-(2**20))
&&
    u_197_204 * f_177_low60_20_low20_0 + v_197_204 * g_177_low60_20_low20_0 = f_177_low60_20_low20_7 * (const 64 (-(2**20))),
    r_197_204 * f_177_low60_20_low20_0 + s_197_204 * g_177_low60_20_low20_0 = g_177_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_7 + u_197_204 * (const 64 (2**21)) + v_197_204 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_7 + r_197_204 * (const 64 (2**21)) + s_197_204 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_7,
    f_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_7,
    g_177_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 204)) <=s delta, delta <=s (const 64 (1 + 2*204)),
    (const 64 (-(2**20))) <=s u_197_204, u_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_204, v_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_204, r_197_204 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_204, s_197_204 <=s (const 64 ((2**20)-1)),
    u_197_204 + v_197_204 <=s (const 64 (2**20)),
    u_197_204 - v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 + v_197_204 <=s (const 64 (2**20)),
    (const 64 0) - u_197_204 - v_197_204 <=s (const 64 (2**20)),
    r_197_204 + s_197_204 <=s (const 64 (2**20)),
    r_197_204 - s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 + s_197_204 <=s (const 64 (2**20)),
    (const 64 0) - r_197_204 - s_197_204 <=s (const 64 (2**20)),
    u_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_197_204 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_197_204 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step204

// premise c
assume
g_177_low60_20_low20_7 = 1 (mod 2)
&&
g_177_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_8 g_177_low60_20_low20_7;
mov u_197_205 r_197_204;
mov v_197_205 s_197_204;

subs dc g_177_low60_20_low20_8 g_177_low60_20_low20_7 f_177_low60_20_low20_7;
asr g_177_low60_20_low20_8 g_177_low60_20_low20_8 1;
subs dc r_197_205 r_197_204 u_197_204;
asr r_197_205 r_197_205 1;
subs dc s_197_205 s_197_204 v_197_204;
asr s_197_205 s_197_205 1;
assert
    true
&&
    f_177_low60_20_low20_8 = g_177_low60_20_low20_7,
    u_197_205 = r_197_204,
    v_197_205 = s_197_204,
    g_177_low60_20_low20_8 * (const 64 2) = g_177_low60_20_low20_7 - f_177_low60_20_low20_7,
    r_197_205 * (const 64 2) = r_197_204 - u_197_204,
    s_197_205 * (const 64 2) = s_197_204 - v_197_204
;

assume
    f_177_low60_20_low20_8 = g_177_low60_20_low20_7,
    u_197_205 = r_197_204,
    v_197_205 = s_197_204,
    g_177_low60_20_low20_8 * 2 = g_177_low60_20_low20_7 - f_177_low60_20_low20_7,
    r_197_205 * 2 = r_197_204 - u_197_204,
    s_197_205 * 2 = s_197_204 - v_197_204
&&
    true
;

{
    u_197_205 * f_177_low60_20_low20_0 + v_197_205 * g_177_low60_20_low20_0 = f_177_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_205 * f_177_low60_20_low20_0 + s_197_205 * g_177_low60_20_low20_0 = g_177_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_8 + u_197_205 * (const 64 (2**21)) + v_197_205 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_8 + r_197_205 * (const 64 (2**21)) + s_197_205 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_8,
    f_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_8,
    g_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 205)) <=s delta, delta <=s (const 64 (1 + 2*205)),
    (const 64 (-(2**20))) <=s u_197_205, u_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_205, v_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_205, r_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_205, s_197_205 <=s (const 64 ((2**20)-1)),
    u_197_205 + v_197_205 <=s (const 64 (2**20)),
    u_197_205 - v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 + v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 - v_197_205 <=s (const 64 (2**20)),
    r_197_205 + s_197_205 <=s (const 64 (2**20)),
    r_197_205 - s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 + s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 - s_197_205 <=s (const 64 (2**20)),
    u_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_197_205 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_205_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_8,
sint64 g_177_low60_20_low20_8,
sint64 f_177_low60_20_low20_9,
sint64 g_177_low60_20_low20_9,
sint64 u_197_205,
sint64 v_197_205,
sint64 r_197_205,
sint64 s_197_205,
sint64 u_197_206,
sint64 v_197_206,
sint64 r_197_206,
sint64 s_197_206,
bit ne
)={
    u_197_205 * f_177_low60_20_low20_0 + v_197_205 * g_177_low60_20_low20_0 = f_177_low60_20_low20_8 * (-(2**20)),
    r_197_205 * f_177_low60_20_low20_0 + s_197_205 * g_177_low60_20_low20_0 = g_177_low60_20_low20_8 * (-(2**20))
&&
    u_197_205 * f_177_low60_20_low20_0 + v_197_205 * g_177_low60_20_low20_0 = f_177_low60_20_low20_8 * (const 64 (-(2**20))),
    r_197_205 * f_177_low60_20_low20_0 + s_197_205 * g_177_low60_20_low20_0 = g_177_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_8 + u_197_205 * (const 64 (2**21)) + v_197_205 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_8 + r_197_205 * (const 64 (2**21)) + s_197_205 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_8,
    f_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_8,
    g_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 205)) <=s delta, delta <=s (const 64 (1 + 2*205)),
    (const 64 (-(2**20))) <=s u_197_205, u_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_205, v_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_205, r_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_205, s_197_205 <=s (const 64 ((2**20)-1)),
    u_197_205 + v_197_205 <=s (const 64 (2**20)),
    u_197_205 - v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 + v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 - v_197_205 <=s (const 64 (2**20)),
    r_197_205 + s_197_205 <=s (const 64 (2**20)),
    r_197_205 - s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 + s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 - s_197_205 <=s (const 64 (2**20)),
    u_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_197_205 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step205

// premise a
assume
g_177_low60_20_low20_8 = 0 (mod 2)
&&
g_177_low60_20_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_9 f_177_low60_20_low20_8;
mov u_197_206 u_197_205;
mov v_197_206 v_197_205;

asr g_177_low60_20_low20_9 g_177_low60_20_low20_8 1;
asr r_197_206 r_197_205 1;
asr s_197_206 s_197_205 1;
assert
    true
&&
    f_177_low60_20_low20_9 = f_177_low60_20_low20_8,
    u_197_206 = u_197_205,
    v_197_206 = v_197_205,
    g_177_low60_20_low20_9 * (const 64 2) = g_177_low60_20_low20_8,
    r_197_206 * (const 64 2) = r_197_205,
    s_197_206 * (const 64 2) = s_197_205
;

assume
    f_177_low60_20_low20_9 = f_177_low60_20_low20_8,
    u_197_206 = u_197_205,
    v_197_206 = v_197_205,
    g_177_low60_20_low20_9 * 2 = g_177_low60_20_low20_8,
    r_197_206 * 2 = r_197_205,
    s_197_206 * 2 = s_197_205
&&
    true
;

{
    u_197_206 * f_177_low60_20_low20_0 + v_197_206 * g_177_low60_20_low20_0 = f_177_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_206 * f_177_low60_20_low20_0 + s_197_206 * g_177_low60_20_low20_0 = g_177_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_9 + u_197_206 * (const 64 (2**21)) + v_197_206 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_9 + r_197_206 * (const 64 (2**21)) + s_197_206 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_9,
    f_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_9,
    g_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 206)) <=s delta, delta <=s (const 64 (1 + 2*206)),
    (const 64 (-(2**20))) <=s u_197_206, u_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_206, v_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_206, r_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_206, s_197_206 <=s (const 64 ((2**20)-1)),
    u_197_206 + v_197_206 <=s (const 64 (2**20)),
    u_197_206 - v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 + v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 - v_197_206 <=s (const 64 (2**20)),
    r_197_206 + s_197_206 <=s (const 64 (2**20)),
    r_197_206 - s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 + s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 - s_197_206 <=s (const 64 (2**20)),
    u_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_197_206 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_205_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_8,
sint64 g_177_low60_20_low20_8,
sint64 f_177_low60_20_low20_9,
sint64 g_177_low60_20_low20_9,
sint64 u_197_205,
sint64 v_197_205,
sint64 r_197_205,
sint64 s_197_205,
sint64 u_197_206,
sint64 v_197_206,
sint64 r_197_206,
sint64 s_197_206,
bit ne
)={
    u_197_205 * f_177_low60_20_low20_0 + v_197_205 * g_177_low60_20_low20_0 = f_177_low60_20_low20_8 * (-(2**20)),
    r_197_205 * f_177_low60_20_low20_0 + s_197_205 * g_177_low60_20_low20_0 = g_177_low60_20_low20_8 * (-(2**20))
&&
    u_197_205 * f_177_low60_20_low20_0 + v_197_205 * g_177_low60_20_low20_0 = f_177_low60_20_low20_8 * (const 64 (-(2**20))),
    r_197_205 * f_177_low60_20_low20_0 + s_197_205 * g_177_low60_20_low20_0 = g_177_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_8 + u_197_205 * (const 64 (2**21)) + v_197_205 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_8 + r_197_205 * (const 64 (2**21)) + s_197_205 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_8,
    f_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_8,
    g_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 205)) <=s delta, delta <=s (const 64 (1 + 2*205)),
    (const 64 (-(2**20))) <=s u_197_205, u_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_205, v_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_205, r_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_205, s_197_205 <=s (const 64 ((2**20)-1)),
    u_197_205 + v_197_205 <=s (const 64 (2**20)),
    u_197_205 - v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 + v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 - v_197_205 <=s (const 64 (2**20)),
    r_197_205 + s_197_205 <=s (const 64 (2**20)),
    r_197_205 - s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 + s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 - s_197_205 <=s (const 64 (2**20)),
    u_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_197_205 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step205

// premise b
assume
g_177_low60_20_low20_8 = 1 (mod 2)
&&
g_177_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_9 f_177_low60_20_low20_8;
mov u_197_206 u_197_205;
mov v_197_206 v_197_205;

add g_177_low60_20_low20_9 g_177_low60_20_low20_8 f_177_low60_20_low20_8;
asr g_177_low60_20_low20_9 g_177_low60_20_low20_9 1;
add r_197_206 r_197_205 u_197_205;
asr r_197_206 r_197_206 1;
add s_197_206 s_197_205 v_197_205;
asr s_197_206 s_197_206 1;
assert
    true
&&
    f_177_low60_20_low20_9 = f_177_low60_20_low20_8,
    u_197_206 = u_197_205,
    v_197_206 = v_197_205,
    g_177_low60_20_low20_9 * (const 64 2) = g_177_low60_20_low20_8 + f_177_low60_20_low20_8,
    r_197_206 * (const 64 2) = r_197_205 + u_197_205,
    s_197_206 * (const 64 2) = s_197_205 + v_197_205
;

assume
    f_177_low60_20_low20_9 = f_177_low60_20_low20_8,
    u_197_206 = u_197_205,
    v_197_206 = v_197_205,
    g_177_low60_20_low20_9 * 2 = g_177_low60_20_low20_8 + f_177_low60_20_low20_8,
    r_197_206 * 2 = r_197_205 + u_197_205,
    s_197_206 * 2 = s_197_205 + v_197_205
&&
    true
;

{
    u_197_206 * f_177_low60_20_low20_0 + v_197_206 * g_177_low60_20_low20_0 = f_177_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_206 * f_177_low60_20_low20_0 + s_197_206 * g_177_low60_20_low20_0 = g_177_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_9 + u_197_206 * (const 64 (2**21)) + v_197_206 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_9 + r_197_206 * (const 64 (2**21)) + s_197_206 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_9,
    f_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_9,
    g_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 206)) <=s delta, delta <=s (const 64 (1 + 2*206)),
    (const 64 (-(2**20))) <=s u_197_206, u_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_206, v_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_206, r_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_206, s_197_206 <=s (const 64 ((2**20)-1)),
    u_197_206 + v_197_206 <=s (const 64 (2**20)),
    u_197_206 - v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 + v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 - v_197_206 <=s (const 64 (2**20)),
    r_197_206 + s_197_206 <=s (const 64 (2**20)),
    r_197_206 - s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 + s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 - s_197_206 <=s (const 64 (2**20)),
    u_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_197_206 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_205_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_8,
sint64 g_177_low60_20_low20_8,
sint64 f_177_low60_20_low20_9,
sint64 g_177_low60_20_low20_9,
sint64 u_197_205,
sint64 v_197_205,
sint64 r_197_205,
sint64 s_197_205,
sint64 u_197_206,
sint64 v_197_206,
sint64 r_197_206,
sint64 s_197_206,
bit ne
)={
    u_197_205 * f_177_low60_20_low20_0 + v_197_205 * g_177_low60_20_low20_0 = f_177_low60_20_low20_8 * (-(2**20)),
    r_197_205 * f_177_low60_20_low20_0 + s_197_205 * g_177_low60_20_low20_0 = g_177_low60_20_low20_8 * (-(2**20))
&&
    u_197_205 * f_177_low60_20_low20_0 + v_197_205 * g_177_low60_20_low20_0 = f_177_low60_20_low20_8 * (const 64 (-(2**20))),
    r_197_205 * f_177_low60_20_low20_0 + s_197_205 * g_177_low60_20_low20_0 = g_177_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_8 + u_197_205 * (const 64 (2**21)) + v_197_205 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_8 + r_197_205 * (const 64 (2**21)) + s_197_205 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_8,
    f_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_8,
    g_177_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 205)) <=s delta, delta <=s (const 64 (1 + 2*205)),
    (const 64 (-(2**20))) <=s u_197_205, u_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_205, v_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_205, r_197_205 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_205, s_197_205 <=s (const 64 ((2**20)-1)),
    u_197_205 + v_197_205 <=s (const 64 (2**20)),
    u_197_205 - v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 + v_197_205 <=s (const 64 (2**20)),
    (const 64 0) - u_197_205 - v_197_205 <=s (const 64 (2**20)),
    r_197_205 + s_197_205 <=s (const 64 (2**20)),
    r_197_205 - s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 + s_197_205 <=s (const 64 (2**20)),
    (const 64 0) - r_197_205 - s_197_205 <=s (const 64 (2**20)),
    u_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_197_205 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_197_205 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step205

// premise c
assume
g_177_low60_20_low20_8 = 1 (mod 2)
&&
g_177_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_9 g_177_low60_20_low20_8;
mov u_197_206 r_197_205;
mov v_197_206 s_197_205;

subs dc g_177_low60_20_low20_9 g_177_low60_20_low20_8 f_177_low60_20_low20_8;
asr g_177_low60_20_low20_9 g_177_low60_20_low20_9 1;
subs dc r_197_206 r_197_205 u_197_205;
asr r_197_206 r_197_206 1;
subs dc s_197_206 s_197_205 v_197_205;
asr s_197_206 s_197_206 1;
assert
    true
&&
    f_177_low60_20_low20_9 = g_177_low60_20_low20_8,
    u_197_206 = r_197_205,
    v_197_206 = s_197_205,
    g_177_low60_20_low20_9 * (const 64 2) = g_177_low60_20_low20_8 - f_177_low60_20_low20_8,
    r_197_206 * (const 64 2) = r_197_205 - u_197_205,
    s_197_206 * (const 64 2) = s_197_205 - v_197_205
;

assume
    f_177_low60_20_low20_9 = g_177_low60_20_low20_8,
    u_197_206 = r_197_205,
    v_197_206 = s_197_205,
    g_177_low60_20_low20_9 * 2 = g_177_low60_20_low20_8 - f_177_low60_20_low20_8,
    r_197_206 * 2 = r_197_205 - u_197_205,
    s_197_206 * 2 = s_197_205 - v_197_205
&&
    true
;

{
    u_197_206 * f_177_low60_20_low20_0 + v_197_206 * g_177_low60_20_low20_0 = f_177_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_206 * f_177_low60_20_low20_0 + s_197_206 * g_177_low60_20_low20_0 = g_177_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_9 + u_197_206 * (const 64 (2**21)) + v_197_206 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_9 + r_197_206 * (const 64 (2**21)) + s_197_206 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_9,
    f_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_9,
    g_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 206)) <=s delta, delta <=s (const 64 (1 + 2*206)),
    (const 64 (-(2**20))) <=s u_197_206, u_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_206, v_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_206, r_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_206, s_197_206 <=s (const 64 ((2**20)-1)),
    u_197_206 + v_197_206 <=s (const 64 (2**20)),
    u_197_206 - v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 + v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 - v_197_206 <=s (const 64 (2**20)),
    r_197_206 + s_197_206 <=s (const 64 (2**20)),
    r_197_206 - s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 + s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 - s_197_206 <=s (const 64 (2**20)),
    u_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_197_206 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_206_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_9,
sint64 g_177_low60_20_low20_9,
sint64 f_177_low60_20_low20_10,
sint64 g_177_low60_20_low20_10,
sint64 u_197_206,
sint64 v_197_206,
sint64 r_197_206,
sint64 s_197_206,
sint64 u_197_207,
sint64 v_197_207,
sint64 r_197_207,
sint64 s_197_207,
bit ne
)={
    u_197_206 * f_177_low60_20_low20_0 + v_197_206 * g_177_low60_20_low20_0 = f_177_low60_20_low20_9 * (-(2**20)),
    r_197_206 * f_177_low60_20_low20_0 + s_197_206 * g_177_low60_20_low20_0 = g_177_low60_20_low20_9 * (-(2**20))
&&
    u_197_206 * f_177_low60_20_low20_0 + v_197_206 * g_177_low60_20_low20_0 = f_177_low60_20_low20_9 * (const 64 (-(2**20))),
    r_197_206 * f_177_low60_20_low20_0 + s_197_206 * g_177_low60_20_low20_0 = g_177_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_9 + u_197_206 * (const 64 (2**21)) + v_197_206 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_9 + r_197_206 * (const 64 (2**21)) + s_197_206 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_9,
    f_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_9,
    g_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 206)) <=s delta, delta <=s (const 64 (1 + 2*206)),
    (const 64 (-(2**20))) <=s u_197_206, u_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_206, v_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_206, r_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_206, s_197_206 <=s (const 64 ((2**20)-1)),
    u_197_206 + v_197_206 <=s (const 64 (2**20)),
    u_197_206 - v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 + v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 - v_197_206 <=s (const 64 (2**20)),
    r_197_206 + s_197_206 <=s (const 64 (2**20)),
    r_197_206 - s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 + s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 - s_197_206 <=s (const 64 (2**20)),
    u_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_197_206 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step206

// premise a
assume
g_177_low60_20_low20_9 = 0 (mod 2)
&&
g_177_low60_20_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_10 f_177_low60_20_low20_9;
mov u_197_207 u_197_206;
mov v_197_207 v_197_206;

asr g_177_low60_20_low20_10 g_177_low60_20_low20_9 1;
asr r_197_207 r_197_206 1;
asr s_197_207 s_197_206 1;
assert
    true
&&
    f_177_low60_20_low20_10 = f_177_low60_20_low20_9,
    u_197_207 = u_197_206,
    v_197_207 = v_197_206,
    g_177_low60_20_low20_10 * (const 64 2) = g_177_low60_20_low20_9,
    r_197_207 * (const 64 2) = r_197_206,
    s_197_207 * (const 64 2) = s_197_206
;

assume
    f_177_low60_20_low20_10 = f_177_low60_20_low20_9,
    u_197_207 = u_197_206,
    v_197_207 = v_197_206,
    g_177_low60_20_low20_10 * 2 = g_177_low60_20_low20_9,
    r_197_207 * 2 = r_197_206,
    s_197_207 * 2 = s_197_206
&&
    true
;

{
    u_197_207 * f_177_low60_20_low20_0 + v_197_207 * g_177_low60_20_low20_0 = f_177_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_207 * f_177_low60_20_low20_0 + s_197_207 * g_177_low60_20_low20_0 = g_177_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_10 + u_197_207 * (const 64 (2**21)) + v_197_207 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_10 + r_197_207 * (const 64 (2**21)) + s_197_207 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_10,
    f_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_10,
    g_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 207)) <=s delta, delta <=s (const 64 (1 + 2*207)),
    (const 64 (-(2**20))) <=s u_197_207, u_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_207, v_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_207, r_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_207, s_197_207 <=s (const 64 ((2**20)-1)),
    u_197_207 + v_197_207 <=s (const 64 (2**20)),
    u_197_207 - v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 + v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 - v_197_207 <=s (const 64 (2**20)),
    r_197_207 + s_197_207 <=s (const 64 (2**20)),
    r_197_207 - s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 + s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 - s_197_207 <=s (const 64 (2**20)),
    u_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_197_207 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_206_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_9,
sint64 g_177_low60_20_low20_9,
sint64 f_177_low60_20_low20_10,
sint64 g_177_low60_20_low20_10,
sint64 u_197_206,
sint64 v_197_206,
sint64 r_197_206,
sint64 s_197_206,
sint64 u_197_207,
sint64 v_197_207,
sint64 r_197_207,
sint64 s_197_207,
bit ne
)={
    u_197_206 * f_177_low60_20_low20_0 + v_197_206 * g_177_low60_20_low20_0 = f_177_low60_20_low20_9 * (-(2**20)),
    r_197_206 * f_177_low60_20_low20_0 + s_197_206 * g_177_low60_20_low20_0 = g_177_low60_20_low20_9 * (-(2**20))
&&
    u_197_206 * f_177_low60_20_low20_0 + v_197_206 * g_177_low60_20_low20_0 = f_177_low60_20_low20_9 * (const 64 (-(2**20))),
    r_197_206 * f_177_low60_20_low20_0 + s_197_206 * g_177_low60_20_low20_0 = g_177_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_9 + u_197_206 * (const 64 (2**21)) + v_197_206 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_9 + r_197_206 * (const 64 (2**21)) + s_197_206 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_9,
    f_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_9,
    g_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 206)) <=s delta, delta <=s (const 64 (1 + 2*206)),
    (const 64 (-(2**20))) <=s u_197_206, u_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_206, v_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_206, r_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_206, s_197_206 <=s (const 64 ((2**20)-1)),
    u_197_206 + v_197_206 <=s (const 64 (2**20)),
    u_197_206 - v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 + v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 - v_197_206 <=s (const 64 (2**20)),
    r_197_206 + s_197_206 <=s (const 64 (2**20)),
    r_197_206 - s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 + s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 - s_197_206 <=s (const 64 (2**20)),
    u_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_197_206 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step206

// premise b
assume
g_177_low60_20_low20_9 = 1 (mod 2)
&&
g_177_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_10 f_177_low60_20_low20_9;
mov u_197_207 u_197_206;
mov v_197_207 v_197_206;

add g_177_low60_20_low20_10 g_177_low60_20_low20_9 f_177_low60_20_low20_9;
asr g_177_low60_20_low20_10 g_177_low60_20_low20_10 1;
add r_197_207 r_197_206 u_197_206;
asr r_197_207 r_197_207 1;
add s_197_207 s_197_206 v_197_206;
asr s_197_207 s_197_207 1;
assert
    true
&&
    f_177_low60_20_low20_10 = f_177_low60_20_low20_9,
    u_197_207 = u_197_206,
    v_197_207 = v_197_206,
    g_177_low60_20_low20_10 * (const 64 2) = g_177_low60_20_low20_9 + f_177_low60_20_low20_9,
    r_197_207 * (const 64 2) = r_197_206 + u_197_206,
    s_197_207 * (const 64 2) = s_197_206 + v_197_206
;

assume
    f_177_low60_20_low20_10 = f_177_low60_20_low20_9,
    u_197_207 = u_197_206,
    v_197_207 = v_197_206,
    g_177_low60_20_low20_10 * 2 = g_177_low60_20_low20_9 + f_177_low60_20_low20_9,
    r_197_207 * 2 = r_197_206 + u_197_206,
    s_197_207 * 2 = s_197_206 + v_197_206
&&
    true
;

{
    u_197_207 * f_177_low60_20_low20_0 + v_197_207 * g_177_low60_20_low20_0 = f_177_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_207 * f_177_low60_20_low20_0 + s_197_207 * g_177_low60_20_low20_0 = g_177_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_10 + u_197_207 * (const 64 (2**21)) + v_197_207 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_10 + r_197_207 * (const 64 (2**21)) + s_197_207 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_10,
    f_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_10,
    g_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 207)) <=s delta, delta <=s (const 64 (1 + 2*207)),
    (const 64 (-(2**20))) <=s u_197_207, u_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_207, v_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_207, r_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_207, s_197_207 <=s (const 64 ((2**20)-1)),
    u_197_207 + v_197_207 <=s (const 64 (2**20)),
    u_197_207 - v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 + v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 - v_197_207 <=s (const 64 (2**20)),
    r_197_207 + s_197_207 <=s (const 64 (2**20)),
    r_197_207 - s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 + s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 - s_197_207 <=s (const 64 (2**20)),
    u_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_197_207 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_206_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_9,
sint64 g_177_low60_20_low20_9,
sint64 f_177_low60_20_low20_10,
sint64 g_177_low60_20_low20_10,
sint64 u_197_206,
sint64 v_197_206,
sint64 r_197_206,
sint64 s_197_206,
sint64 u_197_207,
sint64 v_197_207,
sint64 r_197_207,
sint64 s_197_207,
bit ne
)={
    u_197_206 * f_177_low60_20_low20_0 + v_197_206 * g_177_low60_20_low20_0 = f_177_low60_20_low20_9 * (-(2**20)),
    r_197_206 * f_177_low60_20_low20_0 + s_197_206 * g_177_low60_20_low20_0 = g_177_low60_20_low20_9 * (-(2**20))
&&
    u_197_206 * f_177_low60_20_low20_0 + v_197_206 * g_177_low60_20_low20_0 = f_177_low60_20_low20_9 * (const 64 (-(2**20))),
    r_197_206 * f_177_low60_20_low20_0 + s_197_206 * g_177_low60_20_low20_0 = g_177_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_9 + u_197_206 * (const 64 (2**21)) + v_197_206 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_9 + r_197_206 * (const 64 (2**21)) + s_197_206 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_9,
    f_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_9,
    g_177_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 206)) <=s delta, delta <=s (const 64 (1 + 2*206)),
    (const 64 (-(2**20))) <=s u_197_206, u_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_206, v_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_206, r_197_206 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_206, s_197_206 <=s (const 64 ((2**20)-1)),
    u_197_206 + v_197_206 <=s (const 64 (2**20)),
    u_197_206 - v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 + v_197_206 <=s (const 64 (2**20)),
    (const 64 0) - u_197_206 - v_197_206 <=s (const 64 (2**20)),
    r_197_206 + s_197_206 <=s (const 64 (2**20)),
    r_197_206 - s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 + s_197_206 <=s (const 64 (2**20)),
    (const 64 0) - r_197_206 - s_197_206 <=s (const 64 (2**20)),
    u_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_197_206 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_197_206 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step206

// premise c
assume
g_177_low60_20_low20_9 = 1 (mod 2)
&&
g_177_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_10 g_177_low60_20_low20_9;
mov u_197_207 r_197_206;
mov v_197_207 s_197_206;

subs dc g_177_low60_20_low20_10 g_177_low60_20_low20_9 f_177_low60_20_low20_9;
asr g_177_low60_20_low20_10 g_177_low60_20_low20_10 1;
subs dc r_197_207 r_197_206 u_197_206;
asr r_197_207 r_197_207 1;
subs dc s_197_207 s_197_206 v_197_206;
asr s_197_207 s_197_207 1;
assert
    true
&&
    f_177_low60_20_low20_10 = g_177_low60_20_low20_9,
    u_197_207 = r_197_206,
    v_197_207 = s_197_206,
    g_177_low60_20_low20_10 * (const 64 2) = g_177_low60_20_low20_9 - f_177_low60_20_low20_9,
    r_197_207 * (const 64 2) = r_197_206 - u_197_206,
    s_197_207 * (const 64 2) = s_197_206 - v_197_206
;

assume
    f_177_low60_20_low20_10 = g_177_low60_20_low20_9,
    u_197_207 = r_197_206,
    v_197_207 = s_197_206,
    g_177_low60_20_low20_10 * 2 = g_177_low60_20_low20_9 - f_177_low60_20_low20_9,
    r_197_207 * 2 = r_197_206 - u_197_206,
    s_197_207 * 2 = s_197_206 - v_197_206
&&
    true
;

{
    u_197_207 * f_177_low60_20_low20_0 + v_197_207 * g_177_low60_20_low20_0 = f_177_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_207 * f_177_low60_20_low20_0 + s_197_207 * g_177_low60_20_low20_0 = g_177_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_10 + u_197_207 * (const 64 (2**21)) + v_197_207 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_10 + r_197_207 * (const 64 (2**21)) + s_197_207 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_10,
    f_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_10,
    g_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 207)) <=s delta, delta <=s (const 64 (1 + 2*207)),
    (const 64 (-(2**20))) <=s u_197_207, u_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_207, v_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_207, r_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_207, s_197_207 <=s (const 64 ((2**20)-1)),
    u_197_207 + v_197_207 <=s (const 64 (2**20)),
    u_197_207 - v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 + v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 - v_197_207 <=s (const 64 (2**20)),
    r_197_207 + s_197_207 <=s (const 64 (2**20)),
    r_197_207 - s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 + s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 - s_197_207 <=s (const 64 (2**20)),
    u_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_197_207 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_207_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_10,
sint64 g_177_low60_20_low20_10,
sint64 f_177_low60_20_low20_11,
sint64 g_177_low60_20_low20_11,
sint64 u_197_207,
sint64 v_197_207,
sint64 r_197_207,
sint64 s_197_207,
sint64 u_197_208,
sint64 v_197_208,
sint64 r_197_208,
sint64 s_197_208,
bit ne
)={
    u_197_207 * f_177_low60_20_low20_0 + v_197_207 * g_177_low60_20_low20_0 = f_177_low60_20_low20_10 * (-(2**20)),
    r_197_207 * f_177_low60_20_low20_0 + s_197_207 * g_177_low60_20_low20_0 = g_177_low60_20_low20_10 * (-(2**20))
&&
    u_197_207 * f_177_low60_20_low20_0 + v_197_207 * g_177_low60_20_low20_0 = f_177_low60_20_low20_10 * (const 64 (-(2**20))),
    r_197_207 * f_177_low60_20_low20_0 + s_197_207 * g_177_low60_20_low20_0 = g_177_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_10 + u_197_207 * (const 64 (2**21)) + v_197_207 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_10 + r_197_207 * (const 64 (2**21)) + s_197_207 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_10,
    f_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_10,
    g_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 207)) <=s delta, delta <=s (const 64 (1 + 2*207)),
    (const 64 (-(2**20))) <=s u_197_207, u_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_207, v_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_207, r_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_207, s_197_207 <=s (const 64 ((2**20)-1)),
    u_197_207 + v_197_207 <=s (const 64 (2**20)),
    u_197_207 - v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 + v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 - v_197_207 <=s (const 64 (2**20)),
    r_197_207 + s_197_207 <=s (const 64 (2**20)),
    r_197_207 - s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 + s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 - s_197_207 <=s (const 64 (2**20)),
    u_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_197_207 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step207

// premise a
assume
g_177_low60_20_low20_10 = 0 (mod 2)
&&
g_177_low60_20_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_11 f_177_low60_20_low20_10;
mov u_197_208 u_197_207;
mov v_197_208 v_197_207;

asr g_177_low60_20_low20_11 g_177_low60_20_low20_10 1;
asr r_197_208 r_197_207 1;
asr s_197_208 s_197_207 1;
assert
    true
&&
    f_177_low60_20_low20_11 = f_177_low60_20_low20_10,
    u_197_208 = u_197_207,
    v_197_208 = v_197_207,
    g_177_low60_20_low20_11 * (const 64 2) = g_177_low60_20_low20_10,
    r_197_208 * (const 64 2) = r_197_207,
    s_197_208 * (const 64 2) = s_197_207
;

assume
    f_177_low60_20_low20_11 = f_177_low60_20_low20_10,
    u_197_208 = u_197_207,
    v_197_208 = v_197_207,
    g_177_low60_20_low20_11 * 2 = g_177_low60_20_low20_10,
    r_197_208 * 2 = r_197_207,
    s_197_208 * 2 = s_197_207
&&
    true
;

{
    u_197_208 * f_177_low60_20_low20_0 + v_197_208 * g_177_low60_20_low20_0 = f_177_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_208 * f_177_low60_20_low20_0 + s_197_208 * g_177_low60_20_low20_0 = g_177_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_11 + u_197_208 * (const 64 (2**21)) + v_197_208 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_11 + r_197_208 * (const 64 (2**21)) + s_197_208 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_11,
    f_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_11,
    g_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 208)) <=s delta, delta <=s (const 64 (1 + 2*208)),
    (const 64 (-(2**20))) <=s u_197_208, u_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_208, v_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_208, r_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_208, s_197_208 <=s (const 64 ((2**20)-1)),
    u_197_208 + v_197_208 <=s (const 64 (2**20)),
    u_197_208 - v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 + v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 - v_197_208 <=s (const 64 (2**20)),
    r_197_208 + s_197_208 <=s (const 64 (2**20)),
    r_197_208 - s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 + s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 - s_197_208 <=s (const 64 (2**20)),
    u_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_197_208 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_207_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_10,
sint64 g_177_low60_20_low20_10,
sint64 f_177_low60_20_low20_11,
sint64 g_177_low60_20_low20_11,
sint64 u_197_207,
sint64 v_197_207,
sint64 r_197_207,
sint64 s_197_207,
sint64 u_197_208,
sint64 v_197_208,
sint64 r_197_208,
sint64 s_197_208,
bit ne
)={
    u_197_207 * f_177_low60_20_low20_0 + v_197_207 * g_177_low60_20_low20_0 = f_177_low60_20_low20_10 * (-(2**20)),
    r_197_207 * f_177_low60_20_low20_0 + s_197_207 * g_177_low60_20_low20_0 = g_177_low60_20_low20_10 * (-(2**20))
&&
    u_197_207 * f_177_low60_20_low20_0 + v_197_207 * g_177_low60_20_low20_0 = f_177_low60_20_low20_10 * (const 64 (-(2**20))),
    r_197_207 * f_177_low60_20_low20_0 + s_197_207 * g_177_low60_20_low20_0 = g_177_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_10 + u_197_207 * (const 64 (2**21)) + v_197_207 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_10 + r_197_207 * (const 64 (2**21)) + s_197_207 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_10,
    f_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_10,
    g_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 207)) <=s delta, delta <=s (const 64 (1 + 2*207)),
    (const 64 (-(2**20))) <=s u_197_207, u_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_207, v_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_207, r_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_207, s_197_207 <=s (const 64 ((2**20)-1)),
    u_197_207 + v_197_207 <=s (const 64 (2**20)),
    u_197_207 - v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 + v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 - v_197_207 <=s (const 64 (2**20)),
    r_197_207 + s_197_207 <=s (const 64 (2**20)),
    r_197_207 - s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 + s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 - s_197_207 <=s (const 64 (2**20)),
    u_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_197_207 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step207

// premise b
assume
g_177_low60_20_low20_10 = 1 (mod 2)
&&
g_177_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_11 f_177_low60_20_low20_10;
mov u_197_208 u_197_207;
mov v_197_208 v_197_207;

add g_177_low60_20_low20_11 g_177_low60_20_low20_10 f_177_low60_20_low20_10;
asr g_177_low60_20_low20_11 g_177_low60_20_low20_11 1;
add r_197_208 r_197_207 u_197_207;
asr r_197_208 r_197_208 1;
add s_197_208 s_197_207 v_197_207;
asr s_197_208 s_197_208 1;
assert
    true
&&
    f_177_low60_20_low20_11 = f_177_low60_20_low20_10,
    u_197_208 = u_197_207,
    v_197_208 = v_197_207,
    g_177_low60_20_low20_11 * (const 64 2) = g_177_low60_20_low20_10 + f_177_low60_20_low20_10,
    r_197_208 * (const 64 2) = r_197_207 + u_197_207,
    s_197_208 * (const 64 2) = s_197_207 + v_197_207
;

assume
    f_177_low60_20_low20_11 = f_177_low60_20_low20_10,
    u_197_208 = u_197_207,
    v_197_208 = v_197_207,
    g_177_low60_20_low20_11 * 2 = g_177_low60_20_low20_10 + f_177_low60_20_low20_10,
    r_197_208 * 2 = r_197_207 + u_197_207,
    s_197_208 * 2 = s_197_207 + v_197_207
&&
    true
;

{
    u_197_208 * f_177_low60_20_low20_0 + v_197_208 * g_177_low60_20_low20_0 = f_177_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_208 * f_177_low60_20_low20_0 + s_197_208 * g_177_low60_20_low20_0 = g_177_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_11 + u_197_208 * (const 64 (2**21)) + v_197_208 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_11 + r_197_208 * (const 64 (2**21)) + s_197_208 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_11,
    f_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_11,
    g_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 208)) <=s delta, delta <=s (const 64 (1 + 2*208)),
    (const 64 (-(2**20))) <=s u_197_208, u_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_208, v_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_208, r_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_208, s_197_208 <=s (const 64 ((2**20)-1)),
    u_197_208 + v_197_208 <=s (const 64 (2**20)),
    u_197_208 - v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 + v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 - v_197_208 <=s (const 64 (2**20)),
    r_197_208 + s_197_208 <=s (const 64 (2**20)),
    r_197_208 - s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 + s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 - s_197_208 <=s (const 64 (2**20)),
    u_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_197_208 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_207_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_10,
sint64 g_177_low60_20_low20_10,
sint64 f_177_low60_20_low20_11,
sint64 g_177_low60_20_low20_11,
sint64 u_197_207,
sint64 v_197_207,
sint64 r_197_207,
sint64 s_197_207,
sint64 u_197_208,
sint64 v_197_208,
sint64 r_197_208,
sint64 s_197_208,
bit ne
)={
    u_197_207 * f_177_low60_20_low20_0 + v_197_207 * g_177_low60_20_low20_0 = f_177_low60_20_low20_10 * (-(2**20)),
    r_197_207 * f_177_low60_20_low20_0 + s_197_207 * g_177_low60_20_low20_0 = g_177_low60_20_low20_10 * (-(2**20))
&&
    u_197_207 * f_177_low60_20_low20_0 + v_197_207 * g_177_low60_20_low20_0 = f_177_low60_20_low20_10 * (const 64 (-(2**20))),
    r_197_207 * f_177_low60_20_low20_0 + s_197_207 * g_177_low60_20_low20_0 = g_177_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_10 + u_197_207 * (const 64 (2**21)) + v_197_207 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_10 + r_197_207 * (const 64 (2**21)) + s_197_207 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_10,
    f_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_10,
    g_177_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 207)) <=s delta, delta <=s (const 64 (1 + 2*207)),
    (const 64 (-(2**20))) <=s u_197_207, u_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_207, v_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_207, r_197_207 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_207, s_197_207 <=s (const 64 ((2**20)-1)),
    u_197_207 + v_197_207 <=s (const 64 (2**20)),
    u_197_207 - v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 + v_197_207 <=s (const 64 (2**20)),
    (const 64 0) - u_197_207 - v_197_207 <=s (const 64 (2**20)),
    r_197_207 + s_197_207 <=s (const 64 (2**20)),
    r_197_207 - s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 + s_197_207 <=s (const 64 (2**20)),
    (const 64 0) - r_197_207 - s_197_207 <=s (const 64 (2**20)),
    u_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_197_207 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_197_207 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step207

// premise c
assume
g_177_low60_20_low20_10 = 1 (mod 2)
&&
g_177_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_11 g_177_low60_20_low20_10;
mov u_197_208 r_197_207;
mov v_197_208 s_197_207;

subs dc g_177_low60_20_low20_11 g_177_low60_20_low20_10 f_177_low60_20_low20_10;
asr g_177_low60_20_low20_11 g_177_low60_20_low20_11 1;
subs dc r_197_208 r_197_207 u_197_207;
asr r_197_208 r_197_208 1;
subs dc s_197_208 s_197_207 v_197_207;
asr s_197_208 s_197_208 1;
assert
    true
&&
    f_177_low60_20_low20_11 = g_177_low60_20_low20_10,
    u_197_208 = r_197_207,
    v_197_208 = s_197_207,
    g_177_low60_20_low20_11 * (const 64 2) = g_177_low60_20_low20_10 - f_177_low60_20_low20_10,
    r_197_208 * (const 64 2) = r_197_207 - u_197_207,
    s_197_208 * (const 64 2) = s_197_207 - v_197_207
;

assume
    f_177_low60_20_low20_11 = g_177_low60_20_low20_10,
    u_197_208 = r_197_207,
    v_197_208 = s_197_207,
    g_177_low60_20_low20_11 * 2 = g_177_low60_20_low20_10 - f_177_low60_20_low20_10,
    r_197_208 * 2 = r_197_207 - u_197_207,
    s_197_208 * 2 = s_197_207 - v_197_207
&&
    true
;

{
    u_197_208 * f_177_low60_20_low20_0 + v_197_208 * g_177_low60_20_low20_0 = f_177_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_208 * f_177_low60_20_low20_0 + s_197_208 * g_177_low60_20_low20_0 = g_177_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_11 + u_197_208 * (const 64 (2**21)) + v_197_208 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_11 + r_197_208 * (const 64 (2**21)) + s_197_208 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_11,
    f_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_11,
    g_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 208)) <=s delta, delta <=s (const 64 (1 + 2*208)),
    (const 64 (-(2**20))) <=s u_197_208, u_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_208, v_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_208, r_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_208, s_197_208 <=s (const 64 ((2**20)-1)),
    u_197_208 + v_197_208 <=s (const 64 (2**20)),
    u_197_208 - v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 + v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 - v_197_208 <=s (const 64 (2**20)),
    r_197_208 + s_197_208 <=s (const 64 (2**20)),
    r_197_208 - s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 + s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 - s_197_208 <=s (const 64 (2**20)),
    u_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_197_208 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_208_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_11,
sint64 g_177_low60_20_low20_11,
sint64 f_177_low60_20_low20_12,
sint64 g_177_low60_20_low20_12,
sint64 u_197_208,
sint64 v_197_208,
sint64 r_197_208,
sint64 s_197_208,
sint64 u_197_209,
sint64 v_197_209,
sint64 r_197_209,
sint64 s_197_209,
bit ne
)={
    u_197_208 * f_177_low60_20_low20_0 + v_197_208 * g_177_low60_20_low20_0 = f_177_low60_20_low20_11 * (-(2**20)),
    r_197_208 * f_177_low60_20_low20_0 + s_197_208 * g_177_low60_20_low20_0 = g_177_low60_20_low20_11 * (-(2**20))
&&
    u_197_208 * f_177_low60_20_low20_0 + v_197_208 * g_177_low60_20_low20_0 = f_177_low60_20_low20_11 * (const 64 (-(2**20))),
    r_197_208 * f_177_low60_20_low20_0 + s_197_208 * g_177_low60_20_low20_0 = g_177_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_11 + u_197_208 * (const 64 (2**21)) + v_197_208 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_11 + r_197_208 * (const 64 (2**21)) + s_197_208 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_11,
    f_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_11,
    g_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 208)) <=s delta, delta <=s (const 64 (1 + 2*208)),
    (const 64 (-(2**20))) <=s u_197_208, u_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_208, v_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_208, r_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_208, s_197_208 <=s (const 64 ((2**20)-1)),
    u_197_208 + v_197_208 <=s (const 64 (2**20)),
    u_197_208 - v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 + v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 - v_197_208 <=s (const 64 (2**20)),
    r_197_208 + s_197_208 <=s (const 64 (2**20)),
    r_197_208 - s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 + s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 - s_197_208 <=s (const 64 (2**20)),
    u_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_197_208 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step208

// premise a
assume
g_177_low60_20_low20_11 = 0 (mod 2)
&&
g_177_low60_20_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_12 f_177_low60_20_low20_11;
mov u_197_209 u_197_208;
mov v_197_209 v_197_208;

asr g_177_low60_20_low20_12 g_177_low60_20_low20_11 1;
asr r_197_209 r_197_208 1;
asr s_197_209 s_197_208 1;
assert
    true
&&
    f_177_low60_20_low20_12 = f_177_low60_20_low20_11,
    u_197_209 = u_197_208,
    v_197_209 = v_197_208,
    g_177_low60_20_low20_12 * (const 64 2) = g_177_low60_20_low20_11,
    r_197_209 * (const 64 2) = r_197_208,
    s_197_209 * (const 64 2) = s_197_208
;

assume
    f_177_low60_20_low20_12 = f_177_low60_20_low20_11,
    u_197_209 = u_197_208,
    v_197_209 = v_197_208,
    g_177_low60_20_low20_12 * 2 = g_177_low60_20_low20_11,
    r_197_209 * 2 = r_197_208,
    s_197_209 * 2 = s_197_208
&&
    true
;

{
    u_197_209 * f_177_low60_20_low20_0 + v_197_209 * g_177_low60_20_low20_0 = f_177_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_209 * f_177_low60_20_low20_0 + s_197_209 * g_177_low60_20_low20_0 = g_177_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_12 + u_197_209 * (const 64 (2**21)) + v_197_209 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_12 + r_197_209 * (const 64 (2**21)) + s_197_209 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_12,
    f_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_12,
    g_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 209)) <=s delta, delta <=s (const 64 (1 + 2*209)),
    (const 64 (-(2**20))) <=s u_197_209, u_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_209, v_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_209, r_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_209, s_197_209 <=s (const 64 ((2**20)-1)),
    u_197_209 + v_197_209 <=s (const 64 (2**20)),
    u_197_209 - v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 + v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 - v_197_209 <=s (const 64 (2**20)),
    r_197_209 + s_197_209 <=s (const 64 (2**20)),
    r_197_209 - s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 + s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 - s_197_209 <=s (const 64 (2**20)),
    u_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_197_209 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_208_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_11,
sint64 g_177_low60_20_low20_11,
sint64 f_177_low60_20_low20_12,
sint64 g_177_low60_20_low20_12,
sint64 u_197_208,
sint64 v_197_208,
sint64 r_197_208,
sint64 s_197_208,
sint64 u_197_209,
sint64 v_197_209,
sint64 r_197_209,
sint64 s_197_209,
bit ne
)={
    u_197_208 * f_177_low60_20_low20_0 + v_197_208 * g_177_low60_20_low20_0 = f_177_low60_20_low20_11 * (-(2**20)),
    r_197_208 * f_177_low60_20_low20_0 + s_197_208 * g_177_low60_20_low20_0 = g_177_low60_20_low20_11 * (-(2**20))
&&
    u_197_208 * f_177_low60_20_low20_0 + v_197_208 * g_177_low60_20_low20_0 = f_177_low60_20_low20_11 * (const 64 (-(2**20))),
    r_197_208 * f_177_low60_20_low20_0 + s_197_208 * g_177_low60_20_low20_0 = g_177_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_11 + u_197_208 * (const 64 (2**21)) + v_197_208 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_11 + r_197_208 * (const 64 (2**21)) + s_197_208 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_11,
    f_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_11,
    g_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 208)) <=s delta, delta <=s (const 64 (1 + 2*208)),
    (const 64 (-(2**20))) <=s u_197_208, u_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_208, v_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_208, r_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_208, s_197_208 <=s (const 64 ((2**20)-1)),
    u_197_208 + v_197_208 <=s (const 64 (2**20)),
    u_197_208 - v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 + v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 - v_197_208 <=s (const 64 (2**20)),
    r_197_208 + s_197_208 <=s (const 64 (2**20)),
    r_197_208 - s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 + s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 - s_197_208 <=s (const 64 (2**20)),
    u_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_197_208 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step208

// premise b
assume
g_177_low60_20_low20_11 = 1 (mod 2)
&&
g_177_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_12 f_177_low60_20_low20_11;
mov u_197_209 u_197_208;
mov v_197_209 v_197_208;

add g_177_low60_20_low20_12 g_177_low60_20_low20_11 f_177_low60_20_low20_11;
asr g_177_low60_20_low20_12 g_177_low60_20_low20_12 1;
add r_197_209 r_197_208 u_197_208;
asr r_197_209 r_197_209 1;
add s_197_209 s_197_208 v_197_208;
asr s_197_209 s_197_209 1;
assert
    true
&&
    f_177_low60_20_low20_12 = f_177_low60_20_low20_11,
    u_197_209 = u_197_208,
    v_197_209 = v_197_208,
    g_177_low60_20_low20_12 * (const 64 2) = g_177_low60_20_low20_11 + f_177_low60_20_low20_11,
    r_197_209 * (const 64 2) = r_197_208 + u_197_208,
    s_197_209 * (const 64 2) = s_197_208 + v_197_208
;

assume
    f_177_low60_20_low20_12 = f_177_low60_20_low20_11,
    u_197_209 = u_197_208,
    v_197_209 = v_197_208,
    g_177_low60_20_low20_12 * 2 = g_177_low60_20_low20_11 + f_177_low60_20_low20_11,
    r_197_209 * 2 = r_197_208 + u_197_208,
    s_197_209 * 2 = s_197_208 + v_197_208
&&
    true
;

{
    u_197_209 * f_177_low60_20_low20_0 + v_197_209 * g_177_low60_20_low20_0 = f_177_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_209 * f_177_low60_20_low20_0 + s_197_209 * g_177_low60_20_low20_0 = g_177_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_12 + u_197_209 * (const 64 (2**21)) + v_197_209 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_12 + r_197_209 * (const 64 (2**21)) + s_197_209 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_12,
    f_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_12,
    g_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 209)) <=s delta, delta <=s (const 64 (1 + 2*209)),
    (const 64 (-(2**20))) <=s u_197_209, u_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_209, v_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_209, r_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_209, s_197_209 <=s (const 64 ((2**20)-1)),
    u_197_209 + v_197_209 <=s (const 64 (2**20)),
    u_197_209 - v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 + v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 - v_197_209 <=s (const 64 (2**20)),
    r_197_209 + s_197_209 <=s (const 64 (2**20)),
    r_197_209 - s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 + s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 - s_197_209 <=s (const 64 (2**20)),
    u_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_197_209 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_208_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_11,
sint64 g_177_low60_20_low20_11,
sint64 f_177_low60_20_low20_12,
sint64 g_177_low60_20_low20_12,
sint64 u_197_208,
sint64 v_197_208,
sint64 r_197_208,
sint64 s_197_208,
sint64 u_197_209,
sint64 v_197_209,
sint64 r_197_209,
sint64 s_197_209,
bit ne
)={
    u_197_208 * f_177_low60_20_low20_0 + v_197_208 * g_177_low60_20_low20_0 = f_177_low60_20_low20_11 * (-(2**20)),
    r_197_208 * f_177_low60_20_low20_0 + s_197_208 * g_177_low60_20_low20_0 = g_177_low60_20_low20_11 * (-(2**20))
&&
    u_197_208 * f_177_low60_20_low20_0 + v_197_208 * g_177_low60_20_low20_0 = f_177_low60_20_low20_11 * (const 64 (-(2**20))),
    r_197_208 * f_177_low60_20_low20_0 + s_197_208 * g_177_low60_20_low20_0 = g_177_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_11 + u_197_208 * (const 64 (2**21)) + v_197_208 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_11 + r_197_208 * (const 64 (2**21)) + s_197_208 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_11,
    f_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_11,
    g_177_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 208)) <=s delta, delta <=s (const 64 (1 + 2*208)),
    (const 64 (-(2**20))) <=s u_197_208, u_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_208, v_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_208, r_197_208 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_208, s_197_208 <=s (const 64 ((2**20)-1)),
    u_197_208 + v_197_208 <=s (const 64 (2**20)),
    u_197_208 - v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 + v_197_208 <=s (const 64 (2**20)),
    (const 64 0) - u_197_208 - v_197_208 <=s (const 64 (2**20)),
    r_197_208 + s_197_208 <=s (const 64 (2**20)),
    r_197_208 - s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 + s_197_208 <=s (const 64 (2**20)),
    (const 64 0) - r_197_208 - s_197_208 <=s (const 64 (2**20)),
    u_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_197_208 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_197_208 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step208

// premise c
assume
g_177_low60_20_low20_11 = 1 (mod 2)
&&
g_177_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_12 g_177_low60_20_low20_11;
mov u_197_209 r_197_208;
mov v_197_209 s_197_208;

subs dc g_177_low60_20_low20_12 g_177_low60_20_low20_11 f_177_low60_20_low20_11;
asr g_177_low60_20_low20_12 g_177_low60_20_low20_12 1;
subs dc r_197_209 r_197_208 u_197_208;
asr r_197_209 r_197_209 1;
subs dc s_197_209 s_197_208 v_197_208;
asr s_197_209 s_197_209 1;
assert
    true
&&
    f_177_low60_20_low20_12 = g_177_low60_20_low20_11,
    u_197_209 = r_197_208,
    v_197_209 = s_197_208,
    g_177_low60_20_low20_12 * (const 64 2) = g_177_low60_20_low20_11 - f_177_low60_20_low20_11,
    r_197_209 * (const 64 2) = r_197_208 - u_197_208,
    s_197_209 * (const 64 2) = s_197_208 - v_197_208
;

assume
    f_177_low60_20_low20_12 = g_177_low60_20_low20_11,
    u_197_209 = r_197_208,
    v_197_209 = s_197_208,
    g_177_low60_20_low20_12 * 2 = g_177_low60_20_low20_11 - f_177_low60_20_low20_11,
    r_197_209 * 2 = r_197_208 - u_197_208,
    s_197_209 * 2 = s_197_208 - v_197_208
&&
    true
;

{
    u_197_209 * f_177_low60_20_low20_0 + v_197_209 * g_177_low60_20_low20_0 = f_177_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_209 * f_177_low60_20_low20_0 + s_197_209 * g_177_low60_20_low20_0 = g_177_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_12 + u_197_209 * (const 64 (2**21)) + v_197_209 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_12 + r_197_209 * (const 64 (2**21)) + s_197_209 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_12,
    f_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_12,
    g_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 209)) <=s delta, delta <=s (const 64 (1 + 2*209)),
    (const 64 (-(2**20))) <=s u_197_209, u_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_209, v_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_209, r_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_209, s_197_209 <=s (const 64 ((2**20)-1)),
    u_197_209 + v_197_209 <=s (const 64 (2**20)),
    u_197_209 - v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 + v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 - v_197_209 <=s (const 64 (2**20)),
    r_197_209 + s_197_209 <=s (const 64 (2**20)),
    r_197_209 - s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 + s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 - s_197_209 <=s (const 64 (2**20)),
    u_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_197_209 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_209_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_12,
sint64 g_177_low60_20_low20_12,
sint64 f_177_low60_20_low20_13,
sint64 g_177_low60_20_low20_13,
sint64 u_197_209,
sint64 v_197_209,
sint64 r_197_209,
sint64 s_197_209,
sint64 u_197_210,
sint64 v_197_210,
sint64 r_197_210,
sint64 s_197_210,
bit ne
)={
    u_197_209 * f_177_low60_20_low20_0 + v_197_209 * g_177_low60_20_low20_0 = f_177_low60_20_low20_12 * (-(2**20)),
    r_197_209 * f_177_low60_20_low20_0 + s_197_209 * g_177_low60_20_low20_0 = g_177_low60_20_low20_12 * (-(2**20))
&&
    u_197_209 * f_177_low60_20_low20_0 + v_197_209 * g_177_low60_20_low20_0 = f_177_low60_20_low20_12 * (const 64 (-(2**20))),
    r_197_209 * f_177_low60_20_low20_0 + s_197_209 * g_177_low60_20_low20_0 = g_177_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_12 + u_197_209 * (const 64 (2**21)) + v_197_209 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_12 + r_197_209 * (const 64 (2**21)) + s_197_209 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_12,
    f_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_12,
    g_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 209)) <=s delta, delta <=s (const 64 (1 + 2*209)),
    (const 64 (-(2**20))) <=s u_197_209, u_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_209, v_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_209, r_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_209, s_197_209 <=s (const 64 ((2**20)-1)),
    u_197_209 + v_197_209 <=s (const 64 (2**20)),
    u_197_209 - v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 + v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 - v_197_209 <=s (const 64 (2**20)),
    r_197_209 + s_197_209 <=s (const 64 (2**20)),
    r_197_209 - s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 + s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 - s_197_209 <=s (const 64 (2**20)),
    u_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_197_209 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step209

// premise a
assume
g_177_low60_20_low20_12 = 0 (mod 2)
&&
g_177_low60_20_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_13 f_177_low60_20_low20_12;
mov u_197_210 u_197_209;
mov v_197_210 v_197_209;

asr g_177_low60_20_low20_13 g_177_low60_20_low20_12 1;
asr r_197_210 r_197_209 1;
asr s_197_210 s_197_209 1;
assert
    true
&&
    f_177_low60_20_low20_13 = f_177_low60_20_low20_12,
    u_197_210 = u_197_209,
    v_197_210 = v_197_209,
    g_177_low60_20_low20_13 * (const 64 2) = g_177_low60_20_low20_12,
    r_197_210 * (const 64 2) = r_197_209,
    s_197_210 * (const 64 2) = s_197_209
;

assume
    f_177_low60_20_low20_13 = f_177_low60_20_low20_12,
    u_197_210 = u_197_209,
    v_197_210 = v_197_209,
    g_177_low60_20_low20_13 * 2 = g_177_low60_20_low20_12,
    r_197_210 * 2 = r_197_209,
    s_197_210 * 2 = s_197_209
&&
    true
;

{
    u_197_210 * f_177_low60_20_low20_0 + v_197_210 * g_177_low60_20_low20_0 = f_177_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_210 * f_177_low60_20_low20_0 + s_197_210 * g_177_low60_20_low20_0 = g_177_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_13 + u_197_210 * (const 64 (2**21)) + v_197_210 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_13 + r_197_210 * (const 64 (2**21)) + s_197_210 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_13,
    f_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_13,
    g_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 210)) <=s delta, delta <=s (const 64 (1 + 2*210)),
    (const 64 (-(2**20))) <=s u_197_210, u_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_210, v_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_210, r_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_210, s_197_210 <=s (const 64 ((2**20)-1)),
    u_197_210 + v_197_210 <=s (const 64 (2**20)),
    u_197_210 - v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 + v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 - v_197_210 <=s (const 64 (2**20)),
    r_197_210 + s_197_210 <=s (const 64 (2**20)),
    r_197_210 - s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 + s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 - s_197_210 <=s (const 64 (2**20)),
    u_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_197_210 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_209_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_12,
sint64 g_177_low60_20_low20_12,
sint64 f_177_low60_20_low20_13,
sint64 g_177_low60_20_low20_13,
sint64 u_197_209,
sint64 v_197_209,
sint64 r_197_209,
sint64 s_197_209,
sint64 u_197_210,
sint64 v_197_210,
sint64 r_197_210,
sint64 s_197_210,
bit ne
)={
    u_197_209 * f_177_low60_20_low20_0 + v_197_209 * g_177_low60_20_low20_0 = f_177_low60_20_low20_12 * (-(2**20)),
    r_197_209 * f_177_low60_20_low20_0 + s_197_209 * g_177_low60_20_low20_0 = g_177_low60_20_low20_12 * (-(2**20))
&&
    u_197_209 * f_177_low60_20_low20_0 + v_197_209 * g_177_low60_20_low20_0 = f_177_low60_20_low20_12 * (const 64 (-(2**20))),
    r_197_209 * f_177_low60_20_low20_0 + s_197_209 * g_177_low60_20_low20_0 = g_177_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_12 + u_197_209 * (const 64 (2**21)) + v_197_209 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_12 + r_197_209 * (const 64 (2**21)) + s_197_209 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_12,
    f_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_12,
    g_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 209)) <=s delta, delta <=s (const 64 (1 + 2*209)),
    (const 64 (-(2**20))) <=s u_197_209, u_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_209, v_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_209, r_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_209, s_197_209 <=s (const 64 ((2**20)-1)),
    u_197_209 + v_197_209 <=s (const 64 (2**20)),
    u_197_209 - v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 + v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 - v_197_209 <=s (const 64 (2**20)),
    r_197_209 + s_197_209 <=s (const 64 (2**20)),
    r_197_209 - s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 + s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 - s_197_209 <=s (const 64 (2**20)),
    u_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_197_209 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step209

// premise b
assume
g_177_low60_20_low20_12 = 1 (mod 2)
&&
g_177_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_13 f_177_low60_20_low20_12;
mov u_197_210 u_197_209;
mov v_197_210 v_197_209;

add g_177_low60_20_low20_13 g_177_low60_20_low20_12 f_177_low60_20_low20_12;
asr g_177_low60_20_low20_13 g_177_low60_20_low20_13 1;
add r_197_210 r_197_209 u_197_209;
asr r_197_210 r_197_210 1;
add s_197_210 s_197_209 v_197_209;
asr s_197_210 s_197_210 1;
assert
    true
&&
    f_177_low60_20_low20_13 = f_177_low60_20_low20_12,
    u_197_210 = u_197_209,
    v_197_210 = v_197_209,
    g_177_low60_20_low20_13 * (const 64 2) = g_177_low60_20_low20_12 + f_177_low60_20_low20_12,
    r_197_210 * (const 64 2) = r_197_209 + u_197_209,
    s_197_210 * (const 64 2) = s_197_209 + v_197_209
;

assume
    f_177_low60_20_low20_13 = f_177_low60_20_low20_12,
    u_197_210 = u_197_209,
    v_197_210 = v_197_209,
    g_177_low60_20_low20_13 * 2 = g_177_low60_20_low20_12 + f_177_low60_20_low20_12,
    r_197_210 * 2 = r_197_209 + u_197_209,
    s_197_210 * 2 = s_197_209 + v_197_209
&&
    true
;

{
    u_197_210 * f_177_low60_20_low20_0 + v_197_210 * g_177_low60_20_low20_0 = f_177_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_210 * f_177_low60_20_low20_0 + s_197_210 * g_177_low60_20_low20_0 = g_177_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_13 + u_197_210 * (const 64 (2**21)) + v_197_210 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_13 + r_197_210 * (const 64 (2**21)) + s_197_210 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_13,
    f_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_13,
    g_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 210)) <=s delta, delta <=s (const 64 (1 + 2*210)),
    (const 64 (-(2**20))) <=s u_197_210, u_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_210, v_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_210, r_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_210, s_197_210 <=s (const 64 ((2**20)-1)),
    u_197_210 + v_197_210 <=s (const 64 (2**20)),
    u_197_210 - v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 + v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 - v_197_210 <=s (const 64 (2**20)),
    r_197_210 + s_197_210 <=s (const 64 (2**20)),
    r_197_210 - s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 + s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 - s_197_210 <=s (const 64 (2**20)),
    u_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_197_210 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_209_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_12,
sint64 g_177_low60_20_low20_12,
sint64 f_177_low60_20_low20_13,
sint64 g_177_low60_20_low20_13,
sint64 u_197_209,
sint64 v_197_209,
sint64 r_197_209,
sint64 s_197_209,
sint64 u_197_210,
sint64 v_197_210,
sint64 r_197_210,
sint64 s_197_210,
bit ne
)={
    u_197_209 * f_177_low60_20_low20_0 + v_197_209 * g_177_low60_20_low20_0 = f_177_low60_20_low20_12 * (-(2**20)),
    r_197_209 * f_177_low60_20_low20_0 + s_197_209 * g_177_low60_20_low20_0 = g_177_low60_20_low20_12 * (-(2**20))
&&
    u_197_209 * f_177_low60_20_low20_0 + v_197_209 * g_177_low60_20_low20_0 = f_177_low60_20_low20_12 * (const 64 (-(2**20))),
    r_197_209 * f_177_low60_20_low20_0 + s_197_209 * g_177_low60_20_low20_0 = g_177_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_12 + u_197_209 * (const 64 (2**21)) + v_197_209 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_12 + r_197_209 * (const 64 (2**21)) + s_197_209 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_12,
    f_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_12,
    g_177_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 209)) <=s delta, delta <=s (const 64 (1 + 2*209)),
    (const 64 (-(2**20))) <=s u_197_209, u_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_209, v_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_209, r_197_209 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_209, s_197_209 <=s (const 64 ((2**20)-1)),
    u_197_209 + v_197_209 <=s (const 64 (2**20)),
    u_197_209 - v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 + v_197_209 <=s (const 64 (2**20)),
    (const 64 0) - u_197_209 - v_197_209 <=s (const 64 (2**20)),
    r_197_209 + s_197_209 <=s (const 64 (2**20)),
    r_197_209 - s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 + s_197_209 <=s (const 64 (2**20)),
    (const 64 0) - r_197_209 - s_197_209 <=s (const 64 (2**20)),
    u_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_197_209 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_197_209 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step209

// premise c
assume
g_177_low60_20_low20_12 = 1 (mod 2)
&&
g_177_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_13 g_177_low60_20_low20_12;
mov u_197_210 r_197_209;
mov v_197_210 s_197_209;

subs dc g_177_low60_20_low20_13 g_177_low60_20_low20_12 f_177_low60_20_low20_12;
asr g_177_low60_20_low20_13 g_177_low60_20_low20_13 1;
subs dc r_197_210 r_197_209 u_197_209;
asr r_197_210 r_197_210 1;
subs dc s_197_210 s_197_209 v_197_209;
asr s_197_210 s_197_210 1;
assert
    true
&&
    f_177_low60_20_low20_13 = g_177_low60_20_low20_12,
    u_197_210 = r_197_209,
    v_197_210 = s_197_209,
    g_177_low60_20_low20_13 * (const 64 2) = g_177_low60_20_low20_12 - f_177_low60_20_low20_12,
    r_197_210 * (const 64 2) = r_197_209 - u_197_209,
    s_197_210 * (const 64 2) = s_197_209 - v_197_209
;

assume
    f_177_low60_20_low20_13 = g_177_low60_20_low20_12,
    u_197_210 = r_197_209,
    v_197_210 = s_197_209,
    g_177_low60_20_low20_13 * 2 = g_177_low60_20_low20_12 - f_177_low60_20_low20_12,
    r_197_210 * 2 = r_197_209 - u_197_209,
    s_197_210 * 2 = s_197_209 - v_197_209
&&
    true
;

{
    u_197_210 * f_177_low60_20_low20_0 + v_197_210 * g_177_low60_20_low20_0 = f_177_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_210 * f_177_low60_20_low20_0 + s_197_210 * g_177_low60_20_low20_0 = g_177_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_13 + u_197_210 * (const 64 (2**21)) + v_197_210 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_13 + r_197_210 * (const 64 (2**21)) + s_197_210 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_13,
    f_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_13,
    g_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 210)) <=s delta, delta <=s (const 64 (1 + 2*210)),
    (const 64 (-(2**20))) <=s u_197_210, u_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_210, v_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_210, r_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_210, s_197_210 <=s (const 64 ((2**20)-1)),
    u_197_210 + v_197_210 <=s (const 64 (2**20)),
    u_197_210 - v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 + v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 - v_197_210 <=s (const 64 (2**20)),
    r_197_210 + s_197_210 <=s (const 64 (2**20)),
    r_197_210 - s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 + s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 - s_197_210 <=s (const 64 (2**20)),
    u_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_197_210 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_210_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_13,
sint64 g_177_low60_20_low20_13,
sint64 f_177_low60_20_low20_14,
sint64 g_177_low60_20_low20_14,
sint64 u_197_210,
sint64 v_197_210,
sint64 r_197_210,
sint64 s_197_210,
sint64 u_197_211,
sint64 v_197_211,
sint64 r_197_211,
sint64 s_197_211,
bit ne
)={
    u_197_210 * f_177_low60_20_low20_0 + v_197_210 * g_177_low60_20_low20_0 = f_177_low60_20_low20_13 * (-(2**20)),
    r_197_210 * f_177_low60_20_low20_0 + s_197_210 * g_177_low60_20_low20_0 = g_177_low60_20_low20_13 * (-(2**20))
&&
    u_197_210 * f_177_low60_20_low20_0 + v_197_210 * g_177_low60_20_low20_0 = f_177_low60_20_low20_13 * (const 64 (-(2**20))),
    r_197_210 * f_177_low60_20_low20_0 + s_197_210 * g_177_low60_20_low20_0 = g_177_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_13 + u_197_210 * (const 64 (2**21)) + v_197_210 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_13 + r_197_210 * (const 64 (2**21)) + s_197_210 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_13,
    f_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_13,
    g_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 210)) <=s delta, delta <=s (const 64 (1 + 2*210)),
    (const 64 (-(2**20))) <=s u_197_210, u_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_210, v_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_210, r_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_210, s_197_210 <=s (const 64 ((2**20)-1)),
    u_197_210 + v_197_210 <=s (const 64 (2**20)),
    u_197_210 - v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 + v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 - v_197_210 <=s (const 64 (2**20)),
    r_197_210 + s_197_210 <=s (const 64 (2**20)),
    r_197_210 - s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 + s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 - s_197_210 <=s (const 64 (2**20)),
    u_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_197_210 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step210

// premise a
assume
g_177_low60_20_low20_13 = 0 (mod 2)
&&
g_177_low60_20_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_14 f_177_low60_20_low20_13;
mov u_197_211 u_197_210;
mov v_197_211 v_197_210;

asr g_177_low60_20_low20_14 g_177_low60_20_low20_13 1;
asr r_197_211 r_197_210 1;
asr s_197_211 s_197_210 1;
assert
    true
&&
    f_177_low60_20_low20_14 = f_177_low60_20_low20_13,
    u_197_211 = u_197_210,
    v_197_211 = v_197_210,
    g_177_low60_20_low20_14 * (const 64 2) = g_177_low60_20_low20_13,
    r_197_211 * (const 64 2) = r_197_210,
    s_197_211 * (const 64 2) = s_197_210
;

assume
    f_177_low60_20_low20_14 = f_177_low60_20_low20_13,
    u_197_211 = u_197_210,
    v_197_211 = v_197_210,
    g_177_low60_20_low20_14 * 2 = g_177_low60_20_low20_13,
    r_197_211 * 2 = r_197_210,
    s_197_211 * 2 = s_197_210
&&
    true
;

{
    u_197_211 * f_177_low60_20_low20_0 + v_197_211 * g_177_low60_20_low20_0 = f_177_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_211 * f_177_low60_20_low20_0 + s_197_211 * g_177_low60_20_low20_0 = g_177_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_14 + u_197_211 * (const 64 (2**21)) + v_197_211 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_14 + r_197_211 * (const 64 (2**21)) + s_197_211 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_14,
    f_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_14,
    g_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 211)) <=s delta, delta <=s (const 64 (1 + 2*211)),
    (const 64 (-(2**20))) <=s u_197_211, u_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_211, v_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_211, r_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_211, s_197_211 <=s (const 64 ((2**20)-1)),
    u_197_211 + v_197_211 <=s (const 64 (2**20)),
    u_197_211 - v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 + v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 - v_197_211 <=s (const 64 (2**20)),
    r_197_211 + s_197_211 <=s (const 64 (2**20)),
    r_197_211 - s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 + s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 - s_197_211 <=s (const 64 (2**20)),
    u_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_197_211 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_210_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_13,
sint64 g_177_low60_20_low20_13,
sint64 f_177_low60_20_low20_14,
sint64 g_177_low60_20_low20_14,
sint64 u_197_210,
sint64 v_197_210,
sint64 r_197_210,
sint64 s_197_210,
sint64 u_197_211,
sint64 v_197_211,
sint64 r_197_211,
sint64 s_197_211,
bit ne
)={
    u_197_210 * f_177_low60_20_low20_0 + v_197_210 * g_177_low60_20_low20_0 = f_177_low60_20_low20_13 * (-(2**20)),
    r_197_210 * f_177_low60_20_low20_0 + s_197_210 * g_177_low60_20_low20_0 = g_177_low60_20_low20_13 * (-(2**20))
&&
    u_197_210 * f_177_low60_20_low20_0 + v_197_210 * g_177_low60_20_low20_0 = f_177_low60_20_low20_13 * (const 64 (-(2**20))),
    r_197_210 * f_177_low60_20_low20_0 + s_197_210 * g_177_low60_20_low20_0 = g_177_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_13 + u_197_210 * (const 64 (2**21)) + v_197_210 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_13 + r_197_210 * (const 64 (2**21)) + s_197_210 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_13,
    f_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_13,
    g_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 210)) <=s delta, delta <=s (const 64 (1 + 2*210)),
    (const 64 (-(2**20))) <=s u_197_210, u_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_210, v_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_210, r_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_210, s_197_210 <=s (const 64 ((2**20)-1)),
    u_197_210 + v_197_210 <=s (const 64 (2**20)),
    u_197_210 - v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 + v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 - v_197_210 <=s (const 64 (2**20)),
    r_197_210 + s_197_210 <=s (const 64 (2**20)),
    r_197_210 - s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 + s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 - s_197_210 <=s (const 64 (2**20)),
    u_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_197_210 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step210

// premise b
assume
g_177_low60_20_low20_13 = 1 (mod 2)
&&
g_177_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_14 f_177_low60_20_low20_13;
mov u_197_211 u_197_210;
mov v_197_211 v_197_210;

add g_177_low60_20_low20_14 g_177_low60_20_low20_13 f_177_low60_20_low20_13;
asr g_177_low60_20_low20_14 g_177_low60_20_low20_14 1;
add r_197_211 r_197_210 u_197_210;
asr r_197_211 r_197_211 1;
add s_197_211 s_197_210 v_197_210;
asr s_197_211 s_197_211 1;
assert
    true
&&
    f_177_low60_20_low20_14 = f_177_low60_20_low20_13,
    u_197_211 = u_197_210,
    v_197_211 = v_197_210,
    g_177_low60_20_low20_14 * (const 64 2) = g_177_low60_20_low20_13 + f_177_low60_20_low20_13,
    r_197_211 * (const 64 2) = r_197_210 + u_197_210,
    s_197_211 * (const 64 2) = s_197_210 + v_197_210
;

assume
    f_177_low60_20_low20_14 = f_177_low60_20_low20_13,
    u_197_211 = u_197_210,
    v_197_211 = v_197_210,
    g_177_low60_20_low20_14 * 2 = g_177_low60_20_low20_13 + f_177_low60_20_low20_13,
    r_197_211 * 2 = r_197_210 + u_197_210,
    s_197_211 * 2 = s_197_210 + v_197_210
&&
    true
;

{
    u_197_211 * f_177_low60_20_low20_0 + v_197_211 * g_177_low60_20_low20_0 = f_177_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_211 * f_177_low60_20_low20_0 + s_197_211 * g_177_low60_20_low20_0 = g_177_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_14 + u_197_211 * (const 64 (2**21)) + v_197_211 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_14 + r_197_211 * (const 64 (2**21)) + s_197_211 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_14,
    f_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_14,
    g_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 211)) <=s delta, delta <=s (const 64 (1 + 2*211)),
    (const 64 (-(2**20))) <=s u_197_211, u_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_211, v_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_211, r_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_211, s_197_211 <=s (const 64 ((2**20)-1)),
    u_197_211 + v_197_211 <=s (const 64 (2**20)),
    u_197_211 - v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 + v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 - v_197_211 <=s (const 64 (2**20)),
    r_197_211 + s_197_211 <=s (const 64 (2**20)),
    r_197_211 - s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 + s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 - s_197_211 <=s (const 64 (2**20)),
    u_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_197_211 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_210_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_13,
sint64 g_177_low60_20_low20_13,
sint64 f_177_low60_20_low20_14,
sint64 g_177_low60_20_low20_14,
sint64 u_197_210,
sint64 v_197_210,
sint64 r_197_210,
sint64 s_197_210,
sint64 u_197_211,
sint64 v_197_211,
sint64 r_197_211,
sint64 s_197_211,
bit ne
)={
    u_197_210 * f_177_low60_20_low20_0 + v_197_210 * g_177_low60_20_low20_0 = f_177_low60_20_low20_13 * (-(2**20)),
    r_197_210 * f_177_low60_20_low20_0 + s_197_210 * g_177_low60_20_low20_0 = g_177_low60_20_low20_13 * (-(2**20))
&&
    u_197_210 * f_177_low60_20_low20_0 + v_197_210 * g_177_low60_20_low20_0 = f_177_low60_20_low20_13 * (const 64 (-(2**20))),
    r_197_210 * f_177_low60_20_low20_0 + s_197_210 * g_177_low60_20_low20_0 = g_177_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_13 + u_197_210 * (const 64 (2**21)) + v_197_210 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_13 + r_197_210 * (const 64 (2**21)) + s_197_210 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_13,
    f_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_13,
    g_177_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 210)) <=s delta, delta <=s (const 64 (1 + 2*210)),
    (const 64 (-(2**20))) <=s u_197_210, u_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_210, v_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_210, r_197_210 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_210, s_197_210 <=s (const 64 ((2**20)-1)),
    u_197_210 + v_197_210 <=s (const 64 (2**20)),
    u_197_210 - v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 + v_197_210 <=s (const 64 (2**20)),
    (const 64 0) - u_197_210 - v_197_210 <=s (const 64 (2**20)),
    r_197_210 + s_197_210 <=s (const 64 (2**20)),
    r_197_210 - s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 + s_197_210 <=s (const 64 (2**20)),
    (const 64 0) - r_197_210 - s_197_210 <=s (const 64 (2**20)),
    u_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_197_210 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_197_210 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step210

// premise c
assume
g_177_low60_20_low20_13 = 1 (mod 2)
&&
g_177_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_14 g_177_low60_20_low20_13;
mov u_197_211 r_197_210;
mov v_197_211 s_197_210;

subs dc g_177_low60_20_low20_14 g_177_low60_20_low20_13 f_177_low60_20_low20_13;
asr g_177_low60_20_low20_14 g_177_low60_20_low20_14 1;
subs dc r_197_211 r_197_210 u_197_210;
asr r_197_211 r_197_211 1;
subs dc s_197_211 s_197_210 v_197_210;
asr s_197_211 s_197_211 1;
assert
    true
&&
    f_177_low60_20_low20_14 = g_177_low60_20_low20_13,
    u_197_211 = r_197_210,
    v_197_211 = s_197_210,
    g_177_low60_20_low20_14 * (const 64 2) = g_177_low60_20_low20_13 - f_177_low60_20_low20_13,
    r_197_211 * (const 64 2) = r_197_210 - u_197_210,
    s_197_211 * (const 64 2) = s_197_210 - v_197_210
;

assume
    f_177_low60_20_low20_14 = g_177_low60_20_low20_13,
    u_197_211 = r_197_210,
    v_197_211 = s_197_210,
    g_177_low60_20_low20_14 * 2 = g_177_low60_20_low20_13 - f_177_low60_20_low20_13,
    r_197_211 * 2 = r_197_210 - u_197_210,
    s_197_211 * 2 = s_197_210 - v_197_210
&&
    true
;

{
    u_197_211 * f_177_low60_20_low20_0 + v_197_211 * g_177_low60_20_low20_0 = f_177_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_211 * f_177_low60_20_low20_0 + s_197_211 * g_177_low60_20_low20_0 = g_177_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_14 + u_197_211 * (const 64 (2**21)) + v_197_211 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_14 + r_197_211 * (const 64 (2**21)) + s_197_211 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_14,
    f_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_14,
    g_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 211)) <=s delta, delta <=s (const 64 (1 + 2*211)),
    (const 64 (-(2**20))) <=s u_197_211, u_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_211, v_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_211, r_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_211, s_197_211 <=s (const 64 ((2**20)-1)),
    u_197_211 + v_197_211 <=s (const 64 (2**20)),
    u_197_211 - v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 + v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 - v_197_211 <=s (const 64 (2**20)),
    r_197_211 + s_197_211 <=s (const 64 (2**20)),
    r_197_211 - s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 + s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 - s_197_211 <=s (const 64 (2**20)),
    u_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_197_211 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_211_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_14,
sint64 g_177_low60_20_low20_14,
sint64 f_177_low60_20_low20_15,
sint64 g_177_low60_20_low20_15,
sint64 u_197_211,
sint64 v_197_211,
sint64 r_197_211,
sint64 s_197_211,
sint64 u_197_212,
sint64 v_197_212,
sint64 r_197_212,
sint64 s_197_212,
bit ne
)={
    u_197_211 * f_177_low60_20_low20_0 + v_197_211 * g_177_low60_20_low20_0 = f_177_low60_20_low20_14 * (-(2**20)),
    r_197_211 * f_177_low60_20_low20_0 + s_197_211 * g_177_low60_20_low20_0 = g_177_low60_20_low20_14 * (-(2**20))
&&
    u_197_211 * f_177_low60_20_low20_0 + v_197_211 * g_177_low60_20_low20_0 = f_177_low60_20_low20_14 * (const 64 (-(2**20))),
    r_197_211 * f_177_low60_20_low20_0 + s_197_211 * g_177_low60_20_low20_0 = g_177_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_14 + u_197_211 * (const 64 (2**21)) + v_197_211 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_14 + r_197_211 * (const 64 (2**21)) + s_197_211 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_14,
    f_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_14,
    g_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 211)) <=s delta, delta <=s (const 64 (1 + 2*211)),
    (const 64 (-(2**20))) <=s u_197_211, u_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_211, v_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_211, r_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_211, s_197_211 <=s (const 64 ((2**20)-1)),
    u_197_211 + v_197_211 <=s (const 64 (2**20)),
    u_197_211 - v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 + v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 - v_197_211 <=s (const 64 (2**20)),
    r_197_211 + s_197_211 <=s (const 64 (2**20)),
    r_197_211 - s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 + s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 - s_197_211 <=s (const 64 (2**20)),
    u_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_197_211 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step211

// premise a
assume
g_177_low60_20_low20_14 = 0 (mod 2)
&&
g_177_low60_20_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_15 f_177_low60_20_low20_14;
mov u_197_212 u_197_211;
mov v_197_212 v_197_211;

asr g_177_low60_20_low20_15 g_177_low60_20_low20_14 1;
asr r_197_212 r_197_211 1;
asr s_197_212 s_197_211 1;
assert
    true
&&
    f_177_low60_20_low20_15 = f_177_low60_20_low20_14,
    u_197_212 = u_197_211,
    v_197_212 = v_197_211,
    g_177_low60_20_low20_15 * (const 64 2) = g_177_low60_20_low20_14,
    r_197_212 * (const 64 2) = r_197_211,
    s_197_212 * (const 64 2) = s_197_211
;

assume
    f_177_low60_20_low20_15 = f_177_low60_20_low20_14,
    u_197_212 = u_197_211,
    v_197_212 = v_197_211,
    g_177_low60_20_low20_15 * 2 = g_177_low60_20_low20_14,
    r_197_212 * 2 = r_197_211,
    s_197_212 * 2 = s_197_211
&&
    true
;

{
    u_197_212 * f_177_low60_20_low20_0 + v_197_212 * g_177_low60_20_low20_0 = f_177_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_212 * f_177_low60_20_low20_0 + s_197_212 * g_177_low60_20_low20_0 = g_177_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_15 + u_197_212 * (const 64 (2**21)) + v_197_212 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_15 + r_197_212 * (const 64 (2**21)) + s_197_212 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_15,
    f_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_15,
    g_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 212)) <=s delta, delta <=s (const 64 (1 + 2*212)),
    (const 64 (-(2**20))) <=s u_197_212, u_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_212, v_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_212, r_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_212, s_197_212 <=s (const 64 ((2**20)-1)),
    u_197_212 + v_197_212 <=s (const 64 (2**20)),
    u_197_212 - v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 + v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 - v_197_212 <=s (const 64 (2**20)),
    r_197_212 + s_197_212 <=s (const 64 (2**20)),
    r_197_212 - s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 + s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 - s_197_212 <=s (const 64 (2**20)),
    u_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_197_212 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_211_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_14,
sint64 g_177_low60_20_low20_14,
sint64 f_177_low60_20_low20_15,
sint64 g_177_low60_20_low20_15,
sint64 u_197_211,
sint64 v_197_211,
sint64 r_197_211,
sint64 s_197_211,
sint64 u_197_212,
sint64 v_197_212,
sint64 r_197_212,
sint64 s_197_212,
bit ne
)={
    u_197_211 * f_177_low60_20_low20_0 + v_197_211 * g_177_low60_20_low20_0 = f_177_low60_20_low20_14 * (-(2**20)),
    r_197_211 * f_177_low60_20_low20_0 + s_197_211 * g_177_low60_20_low20_0 = g_177_low60_20_low20_14 * (-(2**20))
&&
    u_197_211 * f_177_low60_20_low20_0 + v_197_211 * g_177_low60_20_low20_0 = f_177_low60_20_low20_14 * (const 64 (-(2**20))),
    r_197_211 * f_177_low60_20_low20_0 + s_197_211 * g_177_low60_20_low20_0 = g_177_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_14 + u_197_211 * (const 64 (2**21)) + v_197_211 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_14 + r_197_211 * (const 64 (2**21)) + s_197_211 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_14,
    f_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_14,
    g_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 211)) <=s delta, delta <=s (const 64 (1 + 2*211)),
    (const 64 (-(2**20))) <=s u_197_211, u_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_211, v_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_211, r_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_211, s_197_211 <=s (const 64 ((2**20)-1)),
    u_197_211 + v_197_211 <=s (const 64 (2**20)),
    u_197_211 - v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 + v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 - v_197_211 <=s (const 64 (2**20)),
    r_197_211 + s_197_211 <=s (const 64 (2**20)),
    r_197_211 - s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 + s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 - s_197_211 <=s (const 64 (2**20)),
    u_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_197_211 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step211

// premise b
assume
g_177_low60_20_low20_14 = 1 (mod 2)
&&
g_177_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_15 f_177_low60_20_low20_14;
mov u_197_212 u_197_211;
mov v_197_212 v_197_211;

add g_177_low60_20_low20_15 g_177_low60_20_low20_14 f_177_low60_20_low20_14;
asr g_177_low60_20_low20_15 g_177_low60_20_low20_15 1;
add r_197_212 r_197_211 u_197_211;
asr r_197_212 r_197_212 1;
add s_197_212 s_197_211 v_197_211;
asr s_197_212 s_197_212 1;
assert
    true
&&
    f_177_low60_20_low20_15 = f_177_low60_20_low20_14,
    u_197_212 = u_197_211,
    v_197_212 = v_197_211,
    g_177_low60_20_low20_15 * (const 64 2) = g_177_low60_20_low20_14 + f_177_low60_20_low20_14,
    r_197_212 * (const 64 2) = r_197_211 + u_197_211,
    s_197_212 * (const 64 2) = s_197_211 + v_197_211
;

assume
    f_177_low60_20_low20_15 = f_177_low60_20_low20_14,
    u_197_212 = u_197_211,
    v_197_212 = v_197_211,
    g_177_low60_20_low20_15 * 2 = g_177_low60_20_low20_14 + f_177_low60_20_low20_14,
    r_197_212 * 2 = r_197_211 + u_197_211,
    s_197_212 * 2 = s_197_211 + v_197_211
&&
    true
;

{
    u_197_212 * f_177_low60_20_low20_0 + v_197_212 * g_177_low60_20_low20_0 = f_177_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_212 * f_177_low60_20_low20_0 + s_197_212 * g_177_low60_20_low20_0 = g_177_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_15 + u_197_212 * (const 64 (2**21)) + v_197_212 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_15 + r_197_212 * (const 64 (2**21)) + s_197_212 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_15,
    f_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_15,
    g_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 212)) <=s delta, delta <=s (const 64 (1 + 2*212)),
    (const 64 (-(2**20))) <=s u_197_212, u_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_212, v_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_212, r_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_212, s_197_212 <=s (const 64 ((2**20)-1)),
    u_197_212 + v_197_212 <=s (const 64 (2**20)),
    u_197_212 - v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 + v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 - v_197_212 <=s (const 64 (2**20)),
    r_197_212 + s_197_212 <=s (const 64 (2**20)),
    r_197_212 - s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 + s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 - s_197_212 <=s (const 64 (2**20)),
    u_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_197_212 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_211_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_14,
sint64 g_177_low60_20_low20_14,
sint64 f_177_low60_20_low20_15,
sint64 g_177_low60_20_low20_15,
sint64 u_197_211,
sint64 v_197_211,
sint64 r_197_211,
sint64 s_197_211,
sint64 u_197_212,
sint64 v_197_212,
sint64 r_197_212,
sint64 s_197_212,
bit ne
)={
    u_197_211 * f_177_low60_20_low20_0 + v_197_211 * g_177_low60_20_low20_0 = f_177_low60_20_low20_14 * (-(2**20)),
    r_197_211 * f_177_low60_20_low20_0 + s_197_211 * g_177_low60_20_low20_0 = g_177_low60_20_low20_14 * (-(2**20))
&&
    u_197_211 * f_177_low60_20_low20_0 + v_197_211 * g_177_low60_20_low20_0 = f_177_low60_20_low20_14 * (const 64 (-(2**20))),
    r_197_211 * f_177_low60_20_low20_0 + s_197_211 * g_177_low60_20_low20_0 = g_177_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_14 + u_197_211 * (const 64 (2**21)) + v_197_211 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_14 + r_197_211 * (const 64 (2**21)) + s_197_211 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_14,
    f_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_14,
    g_177_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 211)) <=s delta, delta <=s (const 64 (1 + 2*211)),
    (const 64 (-(2**20))) <=s u_197_211, u_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_211, v_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_211, r_197_211 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_211, s_197_211 <=s (const 64 ((2**20)-1)),
    u_197_211 + v_197_211 <=s (const 64 (2**20)),
    u_197_211 - v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 + v_197_211 <=s (const 64 (2**20)),
    (const 64 0) - u_197_211 - v_197_211 <=s (const 64 (2**20)),
    r_197_211 + s_197_211 <=s (const 64 (2**20)),
    r_197_211 - s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 + s_197_211 <=s (const 64 (2**20)),
    (const 64 0) - r_197_211 - s_197_211 <=s (const 64 (2**20)),
    u_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_197_211 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_197_211 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step211

// premise c
assume
g_177_low60_20_low20_14 = 1 (mod 2)
&&
g_177_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_15 g_177_low60_20_low20_14;
mov u_197_212 r_197_211;
mov v_197_212 s_197_211;

subs dc g_177_low60_20_low20_15 g_177_low60_20_low20_14 f_177_low60_20_low20_14;
asr g_177_low60_20_low20_15 g_177_low60_20_low20_15 1;
subs dc r_197_212 r_197_211 u_197_211;
asr r_197_212 r_197_212 1;
subs dc s_197_212 s_197_211 v_197_211;
asr s_197_212 s_197_212 1;
assert
    true
&&
    f_177_low60_20_low20_15 = g_177_low60_20_low20_14,
    u_197_212 = r_197_211,
    v_197_212 = s_197_211,
    g_177_low60_20_low20_15 * (const 64 2) = g_177_low60_20_low20_14 - f_177_low60_20_low20_14,
    r_197_212 * (const 64 2) = r_197_211 - u_197_211,
    s_197_212 * (const 64 2) = s_197_211 - v_197_211
;

assume
    f_177_low60_20_low20_15 = g_177_low60_20_low20_14,
    u_197_212 = r_197_211,
    v_197_212 = s_197_211,
    g_177_low60_20_low20_15 * 2 = g_177_low60_20_low20_14 - f_177_low60_20_low20_14,
    r_197_212 * 2 = r_197_211 - u_197_211,
    s_197_212 * 2 = s_197_211 - v_197_211
&&
    true
;

{
    u_197_212 * f_177_low60_20_low20_0 + v_197_212 * g_177_low60_20_low20_0 = f_177_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_212 * f_177_low60_20_low20_0 + s_197_212 * g_177_low60_20_low20_0 = g_177_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_15 + u_197_212 * (const 64 (2**21)) + v_197_212 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_15 + r_197_212 * (const 64 (2**21)) + s_197_212 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_15,
    f_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_15,
    g_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 212)) <=s delta, delta <=s (const 64 (1 + 2*212)),
    (const 64 (-(2**20))) <=s u_197_212, u_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_212, v_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_212, r_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_212, s_197_212 <=s (const 64 ((2**20)-1)),
    u_197_212 + v_197_212 <=s (const 64 (2**20)),
    u_197_212 - v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 + v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 - v_197_212 <=s (const 64 (2**20)),
    r_197_212 + s_197_212 <=s (const 64 (2**20)),
    r_197_212 - s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 + s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 - s_197_212 <=s (const 64 (2**20)),
    u_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_197_212 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_212_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_15,
sint64 g_177_low60_20_low20_15,
sint64 f_177_low60_20_low20_16,
sint64 g_177_low60_20_low20_16,
sint64 u_197_212,
sint64 v_197_212,
sint64 r_197_212,
sint64 s_197_212,
sint64 u_197_213,
sint64 v_197_213,
sint64 r_197_213,
sint64 s_197_213,
bit ne
)={
    u_197_212 * f_177_low60_20_low20_0 + v_197_212 * g_177_low60_20_low20_0 = f_177_low60_20_low20_15 * (-(2**20)),
    r_197_212 * f_177_low60_20_low20_0 + s_197_212 * g_177_low60_20_low20_0 = g_177_low60_20_low20_15 * (-(2**20))
&&
    u_197_212 * f_177_low60_20_low20_0 + v_197_212 * g_177_low60_20_low20_0 = f_177_low60_20_low20_15 * (const 64 (-(2**20))),
    r_197_212 * f_177_low60_20_low20_0 + s_197_212 * g_177_low60_20_low20_0 = g_177_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_15 + u_197_212 * (const 64 (2**21)) + v_197_212 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_15 + r_197_212 * (const 64 (2**21)) + s_197_212 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_15,
    f_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_15,
    g_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 212)) <=s delta, delta <=s (const 64 (1 + 2*212)),
    (const 64 (-(2**20))) <=s u_197_212, u_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_212, v_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_212, r_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_212, s_197_212 <=s (const 64 ((2**20)-1)),
    u_197_212 + v_197_212 <=s (const 64 (2**20)),
    u_197_212 - v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 + v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 - v_197_212 <=s (const 64 (2**20)),
    r_197_212 + s_197_212 <=s (const 64 (2**20)),
    r_197_212 - s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 + s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 - s_197_212 <=s (const 64 (2**20)),
    u_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_197_212 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step212

// premise a
assume
g_177_low60_20_low20_15 = 0 (mod 2)
&&
g_177_low60_20_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_16 f_177_low60_20_low20_15;
mov u_197_213 u_197_212;
mov v_197_213 v_197_212;

asr g_177_low60_20_low20_16 g_177_low60_20_low20_15 1;
asr r_197_213 r_197_212 1;
asr s_197_213 s_197_212 1;
assert
    true
&&
    f_177_low60_20_low20_16 = f_177_low60_20_low20_15,
    u_197_213 = u_197_212,
    v_197_213 = v_197_212,
    g_177_low60_20_low20_16 * (const 64 2) = g_177_low60_20_low20_15,
    r_197_213 * (const 64 2) = r_197_212,
    s_197_213 * (const 64 2) = s_197_212
;

assume
    f_177_low60_20_low20_16 = f_177_low60_20_low20_15,
    u_197_213 = u_197_212,
    v_197_213 = v_197_212,
    g_177_low60_20_low20_16 * 2 = g_177_low60_20_low20_15,
    r_197_213 * 2 = r_197_212,
    s_197_213 * 2 = s_197_212
&&
    true
;

{
    u_197_213 * f_177_low60_20_low20_0 + v_197_213 * g_177_low60_20_low20_0 = f_177_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_213 * f_177_low60_20_low20_0 + s_197_213 * g_177_low60_20_low20_0 = g_177_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_16 + u_197_213 * (const 64 (2**21)) + v_197_213 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_16 + r_197_213 * (const 64 (2**21)) + s_197_213 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_16,
    f_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_16,
    g_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 213)) <=s delta, delta <=s (const 64 (1 + 2*213)),
    (const 64 (-(2**20))) <=s u_197_213, u_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_213, v_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_213, r_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_213, s_197_213 <=s (const 64 ((2**20)-1)),
    u_197_213 + v_197_213 <=s (const 64 (2**20)),
    u_197_213 - v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 + v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 - v_197_213 <=s (const 64 (2**20)),
    r_197_213 + s_197_213 <=s (const 64 (2**20)),
    r_197_213 - s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 + s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 - s_197_213 <=s (const 64 (2**20)),
    u_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_197_213 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_212_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_15,
sint64 g_177_low60_20_low20_15,
sint64 f_177_low60_20_low20_16,
sint64 g_177_low60_20_low20_16,
sint64 u_197_212,
sint64 v_197_212,
sint64 r_197_212,
sint64 s_197_212,
sint64 u_197_213,
sint64 v_197_213,
sint64 r_197_213,
sint64 s_197_213,
bit ne
)={
    u_197_212 * f_177_low60_20_low20_0 + v_197_212 * g_177_low60_20_low20_0 = f_177_low60_20_low20_15 * (-(2**20)),
    r_197_212 * f_177_low60_20_low20_0 + s_197_212 * g_177_low60_20_low20_0 = g_177_low60_20_low20_15 * (-(2**20))
&&
    u_197_212 * f_177_low60_20_low20_0 + v_197_212 * g_177_low60_20_low20_0 = f_177_low60_20_low20_15 * (const 64 (-(2**20))),
    r_197_212 * f_177_low60_20_low20_0 + s_197_212 * g_177_low60_20_low20_0 = g_177_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_15 + u_197_212 * (const 64 (2**21)) + v_197_212 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_15 + r_197_212 * (const 64 (2**21)) + s_197_212 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_15,
    f_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_15,
    g_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 212)) <=s delta, delta <=s (const 64 (1 + 2*212)),
    (const 64 (-(2**20))) <=s u_197_212, u_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_212, v_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_212, r_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_212, s_197_212 <=s (const 64 ((2**20)-1)),
    u_197_212 + v_197_212 <=s (const 64 (2**20)),
    u_197_212 - v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 + v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 - v_197_212 <=s (const 64 (2**20)),
    r_197_212 + s_197_212 <=s (const 64 (2**20)),
    r_197_212 - s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 + s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 - s_197_212 <=s (const 64 (2**20)),
    u_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_197_212 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step212

// premise b
assume
g_177_low60_20_low20_15 = 1 (mod 2)
&&
g_177_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_16 f_177_low60_20_low20_15;
mov u_197_213 u_197_212;
mov v_197_213 v_197_212;

add g_177_low60_20_low20_16 g_177_low60_20_low20_15 f_177_low60_20_low20_15;
asr g_177_low60_20_low20_16 g_177_low60_20_low20_16 1;
add r_197_213 r_197_212 u_197_212;
asr r_197_213 r_197_213 1;
add s_197_213 s_197_212 v_197_212;
asr s_197_213 s_197_213 1;
assert
    true
&&
    f_177_low60_20_low20_16 = f_177_low60_20_low20_15,
    u_197_213 = u_197_212,
    v_197_213 = v_197_212,
    g_177_low60_20_low20_16 * (const 64 2) = g_177_low60_20_low20_15 + f_177_low60_20_low20_15,
    r_197_213 * (const 64 2) = r_197_212 + u_197_212,
    s_197_213 * (const 64 2) = s_197_212 + v_197_212
;

assume
    f_177_low60_20_low20_16 = f_177_low60_20_low20_15,
    u_197_213 = u_197_212,
    v_197_213 = v_197_212,
    g_177_low60_20_low20_16 * 2 = g_177_low60_20_low20_15 + f_177_low60_20_low20_15,
    r_197_213 * 2 = r_197_212 + u_197_212,
    s_197_213 * 2 = s_197_212 + v_197_212
&&
    true
;

{
    u_197_213 * f_177_low60_20_low20_0 + v_197_213 * g_177_low60_20_low20_0 = f_177_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_213 * f_177_low60_20_low20_0 + s_197_213 * g_177_low60_20_low20_0 = g_177_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_16 + u_197_213 * (const 64 (2**21)) + v_197_213 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_16 + r_197_213 * (const 64 (2**21)) + s_197_213 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_16,
    f_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_16,
    g_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 213)) <=s delta, delta <=s (const 64 (1 + 2*213)),
    (const 64 (-(2**20))) <=s u_197_213, u_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_213, v_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_213, r_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_213, s_197_213 <=s (const 64 ((2**20)-1)),
    u_197_213 + v_197_213 <=s (const 64 (2**20)),
    u_197_213 - v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 + v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 - v_197_213 <=s (const 64 (2**20)),
    r_197_213 + s_197_213 <=s (const 64 (2**20)),
    r_197_213 - s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 + s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 - s_197_213 <=s (const 64 (2**20)),
    u_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_197_213 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_212_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_15,
sint64 g_177_low60_20_low20_15,
sint64 f_177_low60_20_low20_16,
sint64 g_177_low60_20_low20_16,
sint64 u_197_212,
sint64 v_197_212,
sint64 r_197_212,
sint64 s_197_212,
sint64 u_197_213,
sint64 v_197_213,
sint64 r_197_213,
sint64 s_197_213,
bit ne
)={
    u_197_212 * f_177_low60_20_low20_0 + v_197_212 * g_177_low60_20_low20_0 = f_177_low60_20_low20_15 * (-(2**20)),
    r_197_212 * f_177_low60_20_low20_0 + s_197_212 * g_177_low60_20_low20_0 = g_177_low60_20_low20_15 * (-(2**20))
&&
    u_197_212 * f_177_low60_20_low20_0 + v_197_212 * g_177_low60_20_low20_0 = f_177_low60_20_low20_15 * (const 64 (-(2**20))),
    r_197_212 * f_177_low60_20_low20_0 + s_197_212 * g_177_low60_20_low20_0 = g_177_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_15 + u_197_212 * (const 64 (2**21)) + v_197_212 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_15 + r_197_212 * (const 64 (2**21)) + s_197_212 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_15,
    f_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_15,
    g_177_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 212)) <=s delta, delta <=s (const 64 (1 + 2*212)),
    (const 64 (-(2**20))) <=s u_197_212, u_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_212, v_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_212, r_197_212 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_212, s_197_212 <=s (const 64 ((2**20)-1)),
    u_197_212 + v_197_212 <=s (const 64 (2**20)),
    u_197_212 - v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 + v_197_212 <=s (const 64 (2**20)),
    (const 64 0) - u_197_212 - v_197_212 <=s (const 64 (2**20)),
    r_197_212 + s_197_212 <=s (const 64 (2**20)),
    r_197_212 - s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 + s_197_212 <=s (const 64 (2**20)),
    (const 64 0) - r_197_212 - s_197_212 <=s (const 64 (2**20)),
    u_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_197_212 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_197_212 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step212

// premise c
assume
g_177_low60_20_low20_15 = 1 (mod 2)
&&
g_177_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_16 g_177_low60_20_low20_15;
mov u_197_213 r_197_212;
mov v_197_213 s_197_212;

subs dc g_177_low60_20_low20_16 g_177_low60_20_low20_15 f_177_low60_20_low20_15;
asr g_177_low60_20_low20_16 g_177_low60_20_low20_16 1;
subs dc r_197_213 r_197_212 u_197_212;
asr r_197_213 r_197_213 1;
subs dc s_197_213 s_197_212 v_197_212;
asr s_197_213 s_197_213 1;
assert
    true
&&
    f_177_low60_20_low20_16 = g_177_low60_20_low20_15,
    u_197_213 = r_197_212,
    v_197_213 = s_197_212,
    g_177_low60_20_low20_16 * (const 64 2) = g_177_low60_20_low20_15 - f_177_low60_20_low20_15,
    r_197_213 * (const 64 2) = r_197_212 - u_197_212,
    s_197_213 * (const 64 2) = s_197_212 - v_197_212
;

assume
    f_177_low60_20_low20_16 = g_177_low60_20_low20_15,
    u_197_213 = r_197_212,
    v_197_213 = s_197_212,
    g_177_low60_20_low20_16 * 2 = g_177_low60_20_low20_15 - f_177_low60_20_low20_15,
    r_197_213 * 2 = r_197_212 - u_197_212,
    s_197_213 * 2 = s_197_212 - v_197_212
&&
    true
;

{
    u_197_213 * f_177_low60_20_low20_0 + v_197_213 * g_177_low60_20_low20_0 = f_177_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_213 * f_177_low60_20_low20_0 + s_197_213 * g_177_low60_20_low20_0 = g_177_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_16 + u_197_213 * (const 64 (2**21)) + v_197_213 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_16 + r_197_213 * (const 64 (2**21)) + s_197_213 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_16,
    f_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_16,
    g_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 213)) <=s delta, delta <=s (const 64 (1 + 2*213)),
    (const 64 (-(2**20))) <=s u_197_213, u_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_213, v_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_213, r_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_213, s_197_213 <=s (const 64 ((2**20)-1)),
    u_197_213 + v_197_213 <=s (const 64 (2**20)),
    u_197_213 - v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 + v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 - v_197_213 <=s (const 64 (2**20)),
    r_197_213 + s_197_213 <=s (const 64 (2**20)),
    r_197_213 - s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 + s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 - s_197_213 <=s (const 64 (2**20)),
    u_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_197_213 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_213_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_16,
sint64 g_177_low60_20_low20_16,
sint64 f_177_low60_20_low20_17,
sint64 g_177_low60_20_low20_17,
sint64 u_197_213,
sint64 v_197_213,
sint64 r_197_213,
sint64 s_197_213,
sint64 u_197_214,
sint64 v_197_214,
sint64 r_197_214,
sint64 s_197_214,
bit ne
)={
    u_197_213 * f_177_low60_20_low20_0 + v_197_213 * g_177_low60_20_low20_0 = f_177_low60_20_low20_16 * (-(2**20)),
    r_197_213 * f_177_low60_20_low20_0 + s_197_213 * g_177_low60_20_low20_0 = g_177_low60_20_low20_16 * (-(2**20))
&&
    u_197_213 * f_177_low60_20_low20_0 + v_197_213 * g_177_low60_20_low20_0 = f_177_low60_20_low20_16 * (const 64 (-(2**20))),
    r_197_213 * f_177_low60_20_low20_0 + s_197_213 * g_177_low60_20_low20_0 = g_177_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_16 + u_197_213 * (const 64 (2**21)) + v_197_213 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_16 + r_197_213 * (const 64 (2**21)) + s_197_213 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_16,
    f_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_16,
    g_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 213)) <=s delta, delta <=s (const 64 (1 + 2*213)),
    (const 64 (-(2**20))) <=s u_197_213, u_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_213, v_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_213, r_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_213, s_197_213 <=s (const 64 ((2**20)-1)),
    u_197_213 + v_197_213 <=s (const 64 (2**20)),
    u_197_213 - v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 + v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 - v_197_213 <=s (const 64 (2**20)),
    r_197_213 + s_197_213 <=s (const 64 (2**20)),
    r_197_213 - s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 + s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 - s_197_213 <=s (const 64 (2**20)),
    u_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_197_213 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step213

// premise a
assume
g_177_low60_20_low20_16 = 0 (mod 2)
&&
g_177_low60_20_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_17 f_177_low60_20_low20_16;
mov u_197_214 u_197_213;
mov v_197_214 v_197_213;

asr g_177_low60_20_low20_17 g_177_low60_20_low20_16 1;
asr r_197_214 r_197_213 1;
asr s_197_214 s_197_213 1;
assert
    true
&&
    f_177_low60_20_low20_17 = f_177_low60_20_low20_16,
    u_197_214 = u_197_213,
    v_197_214 = v_197_213,
    g_177_low60_20_low20_17 * (const 64 2) = g_177_low60_20_low20_16,
    r_197_214 * (const 64 2) = r_197_213,
    s_197_214 * (const 64 2) = s_197_213
;

assume
    f_177_low60_20_low20_17 = f_177_low60_20_low20_16,
    u_197_214 = u_197_213,
    v_197_214 = v_197_213,
    g_177_low60_20_low20_17 * 2 = g_177_low60_20_low20_16,
    r_197_214 * 2 = r_197_213,
    s_197_214 * 2 = s_197_213
&&
    true
;

{
    u_197_214 * f_177_low60_20_low20_0 + v_197_214 * g_177_low60_20_low20_0 = f_177_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_214 * f_177_low60_20_low20_0 + s_197_214 * g_177_low60_20_low20_0 = g_177_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_17 + u_197_214 * (const 64 (2**21)) + v_197_214 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_17 + r_197_214 * (const 64 (2**21)) + s_197_214 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_17,
    f_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_17,
    g_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 214)) <=s delta, delta <=s (const 64 (1 + 2*214)),
    (const 64 (-(2**20))) <=s u_197_214, u_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_214, v_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_214, r_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_214, s_197_214 <=s (const 64 ((2**20)-1)),
    u_197_214 + v_197_214 <=s (const 64 (2**20)),
    u_197_214 - v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 + v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 - v_197_214 <=s (const 64 (2**20)),
    r_197_214 + s_197_214 <=s (const 64 (2**20)),
    r_197_214 - s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 + s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 - s_197_214 <=s (const 64 (2**20)),
    u_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_197_214 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_213_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_16,
sint64 g_177_low60_20_low20_16,
sint64 f_177_low60_20_low20_17,
sint64 g_177_low60_20_low20_17,
sint64 u_197_213,
sint64 v_197_213,
sint64 r_197_213,
sint64 s_197_213,
sint64 u_197_214,
sint64 v_197_214,
sint64 r_197_214,
sint64 s_197_214,
bit ne
)={
    u_197_213 * f_177_low60_20_low20_0 + v_197_213 * g_177_low60_20_low20_0 = f_177_low60_20_low20_16 * (-(2**20)),
    r_197_213 * f_177_low60_20_low20_0 + s_197_213 * g_177_low60_20_low20_0 = g_177_low60_20_low20_16 * (-(2**20))
&&
    u_197_213 * f_177_low60_20_low20_0 + v_197_213 * g_177_low60_20_low20_0 = f_177_low60_20_low20_16 * (const 64 (-(2**20))),
    r_197_213 * f_177_low60_20_low20_0 + s_197_213 * g_177_low60_20_low20_0 = g_177_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_16 + u_197_213 * (const 64 (2**21)) + v_197_213 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_16 + r_197_213 * (const 64 (2**21)) + s_197_213 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_16,
    f_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_16,
    g_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 213)) <=s delta, delta <=s (const 64 (1 + 2*213)),
    (const 64 (-(2**20))) <=s u_197_213, u_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_213, v_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_213, r_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_213, s_197_213 <=s (const 64 ((2**20)-1)),
    u_197_213 + v_197_213 <=s (const 64 (2**20)),
    u_197_213 - v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 + v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 - v_197_213 <=s (const 64 (2**20)),
    r_197_213 + s_197_213 <=s (const 64 (2**20)),
    r_197_213 - s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 + s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 - s_197_213 <=s (const 64 (2**20)),
    u_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_197_213 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step213

// premise b
assume
g_177_low60_20_low20_16 = 1 (mod 2)
&&
g_177_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_17 f_177_low60_20_low20_16;
mov u_197_214 u_197_213;
mov v_197_214 v_197_213;

add g_177_low60_20_low20_17 g_177_low60_20_low20_16 f_177_low60_20_low20_16;
asr g_177_low60_20_low20_17 g_177_low60_20_low20_17 1;
add r_197_214 r_197_213 u_197_213;
asr r_197_214 r_197_214 1;
add s_197_214 s_197_213 v_197_213;
asr s_197_214 s_197_214 1;
assert
    true
&&
    f_177_low60_20_low20_17 = f_177_low60_20_low20_16,
    u_197_214 = u_197_213,
    v_197_214 = v_197_213,
    g_177_low60_20_low20_17 * (const 64 2) = g_177_low60_20_low20_16 + f_177_low60_20_low20_16,
    r_197_214 * (const 64 2) = r_197_213 + u_197_213,
    s_197_214 * (const 64 2) = s_197_213 + v_197_213
;

assume
    f_177_low60_20_low20_17 = f_177_low60_20_low20_16,
    u_197_214 = u_197_213,
    v_197_214 = v_197_213,
    g_177_low60_20_low20_17 * 2 = g_177_low60_20_low20_16 + f_177_low60_20_low20_16,
    r_197_214 * 2 = r_197_213 + u_197_213,
    s_197_214 * 2 = s_197_213 + v_197_213
&&
    true
;

{
    u_197_214 * f_177_low60_20_low20_0 + v_197_214 * g_177_low60_20_low20_0 = f_177_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_214 * f_177_low60_20_low20_0 + s_197_214 * g_177_low60_20_low20_0 = g_177_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_17 + u_197_214 * (const 64 (2**21)) + v_197_214 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_17 + r_197_214 * (const 64 (2**21)) + s_197_214 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_17,
    f_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_17,
    g_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 214)) <=s delta, delta <=s (const 64 (1 + 2*214)),
    (const 64 (-(2**20))) <=s u_197_214, u_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_214, v_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_214, r_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_214, s_197_214 <=s (const 64 ((2**20)-1)),
    u_197_214 + v_197_214 <=s (const 64 (2**20)),
    u_197_214 - v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 + v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 - v_197_214 <=s (const 64 (2**20)),
    r_197_214 + s_197_214 <=s (const 64 (2**20)),
    r_197_214 - s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 + s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 - s_197_214 <=s (const 64 (2**20)),
    u_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_197_214 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_213_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_16,
sint64 g_177_low60_20_low20_16,
sint64 f_177_low60_20_low20_17,
sint64 g_177_low60_20_low20_17,
sint64 u_197_213,
sint64 v_197_213,
sint64 r_197_213,
sint64 s_197_213,
sint64 u_197_214,
sint64 v_197_214,
sint64 r_197_214,
sint64 s_197_214,
bit ne
)={
    u_197_213 * f_177_low60_20_low20_0 + v_197_213 * g_177_low60_20_low20_0 = f_177_low60_20_low20_16 * (-(2**20)),
    r_197_213 * f_177_low60_20_low20_0 + s_197_213 * g_177_low60_20_low20_0 = g_177_low60_20_low20_16 * (-(2**20))
&&
    u_197_213 * f_177_low60_20_low20_0 + v_197_213 * g_177_low60_20_low20_0 = f_177_low60_20_low20_16 * (const 64 (-(2**20))),
    r_197_213 * f_177_low60_20_low20_0 + s_197_213 * g_177_low60_20_low20_0 = g_177_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_16 + u_197_213 * (const 64 (2**21)) + v_197_213 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_16 + r_197_213 * (const 64 (2**21)) + s_197_213 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_16,
    f_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_16,
    g_177_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 213)) <=s delta, delta <=s (const 64 (1 + 2*213)),
    (const 64 (-(2**20))) <=s u_197_213, u_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_213, v_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_213, r_197_213 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_213, s_197_213 <=s (const 64 ((2**20)-1)),
    u_197_213 + v_197_213 <=s (const 64 (2**20)),
    u_197_213 - v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 + v_197_213 <=s (const 64 (2**20)),
    (const 64 0) - u_197_213 - v_197_213 <=s (const 64 (2**20)),
    r_197_213 + s_197_213 <=s (const 64 (2**20)),
    r_197_213 - s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 + s_197_213 <=s (const 64 (2**20)),
    (const 64 0) - r_197_213 - s_197_213 <=s (const 64 (2**20)),
    u_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_197_213 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_197_213 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step213

// premise c
assume
g_177_low60_20_low20_16 = 1 (mod 2)
&&
g_177_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_17 g_177_low60_20_low20_16;
mov u_197_214 r_197_213;
mov v_197_214 s_197_213;

subs dc g_177_low60_20_low20_17 g_177_low60_20_low20_16 f_177_low60_20_low20_16;
asr g_177_low60_20_low20_17 g_177_low60_20_low20_17 1;
subs dc r_197_214 r_197_213 u_197_213;
asr r_197_214 r_197_214 1;
subs dc s_197_214 s_197_213 v_197_213;
asr s_197_214 s_197_214 1;
assert
    true
&&
    f_177_low60_20_low20_17 = g_177_low60_20_low20_16,
    u_197_214 = r_197_213,
    v_197_214 = s_197_213,
    g_177_low60_20_low20_17 * (const 64 2) = g_177_low60_20_low20_16 - f_177_low60_20_low20_16,
    r_197_214 * (const 64 2) = r_197_213 - u_197_213,
    s_197_214 * (const 64 2) = s_197_213 - v_197_213
;

assume
    f_177_low60_20_low20_17 = g_177_low60_20_low20_16,
    u_197_214 = r_197_213,
    v_197_214 = s_197_213,
    g_177_low60_20_low20_17 * 2 = g_177_low60_20_low20_16 - f_177_low60_20_low20_16,
    r_197_214 * 2 = r_197_213 - u_197_213,
    s_197_214 * 2 = s_197_213 - v_197_213
&&
    true
;

{
    u_197_214 * f_177_low60_20_low20_0 + v_197_214 * g_177_low60_20_low20_0 = f_177_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_214 * f_177_low60_20_low20_0 + s_197_214 * g_177_low60_20_low20_0 = g_177_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_17 + u_197_214 * (const 64 (2**21)) + v_197_214 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_17 + r_197_214 * (const 64 (2**21)) + s_197_214 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_17,
    f_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_17,
    g_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 214)) <=s delta, delta <=s (const 64 (1 + 2*214)),
    (const 64 (-(2**20))) <=s u_197_214, u_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_214, v_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_214, r_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_214, s_197_214 <=s (const 64 ((2**20)-1)),
    u_197_214 + v_197_214 <=s (const 64 (2**20)),
    u_197_214 - v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 + v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 - v_197_214 <=s (const 64 (2**20)),
    r_197_214 + s_197_214 <=s (const 64 (2**20)),
    r_197_214 - s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 + s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 - s_197_214 <=s (const 64 (2**20)),
    u_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_197_214 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_214_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_17,
sint64 g_177_low60_20_low20_17,
sint64 f_177_low60_20_low20_18,
sint64 g_177_low60_20_low20_18,
sint64 u_197_214,
sint64 v_197_214,
sint64 r_197_214,
sint64 s_197_214,
sint64 u_197_215,
sint64 v_197_215,
sint64 r_197_215,
sint64 s_197_215,
bit ne
)={
    u_197_214 * f_177_low60_20_low20_0 + v_197_214 * g_177_low60_20_low20_0 = f_177_low60_20_low20_17 * (-(2**20)),
    r_197_214 * f_177_low60_20_low20_0 + s_197_214 * g_177_low60_20_low20_0 = g_177_low60_20_low20_17 * (-(2**20))
&&
    u_197_214 * f_177_low60_20_low20_0 + v_197_214 * g_177_low60_20_low20_0 = f_177_low60_20_low20_17 * (const 64 (-(2**20))),
    r_197_214 * f_177_low60_20_low20_0 + s_197_214 * g_177_low60_20_low20_0 = g_177_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_17 + u_197_214 * (const 64 (2**21)) + v_197_214 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_17 + r_197_214 * (const 64 (2**21)) + s_197_214 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_17,
    f_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_17,
    g_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 214)) <=s delta, delta <=s (const 64 (1 + 2*214)),
    (const 64 (-(2**20))) <=s u_197_214, u_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_214, v_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_214, r_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_214, s_197_214 <=s (const 64 ((2**20)-1)),
    u_197_214 + v_197_214 <=s (const 64 (2**20)),
    u_197_214 - v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 + v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 - v_197_214 <=s (const 64 (2**20)),
    r_197_214 + s_197_214 <=s (const 64 (2**20)),
    r_197_214 - s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 + s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 - s_197_214 <=s (const 64 (2**20)),
    u_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_197_214 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step214

// premise a
assume
g_177_low60_20_low20_17 = 0 (mod 2)
&&
g_177_low60_20_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_18 f_177_low60_20_low20_17;
mov u_197_215 u_197_214;
mov v_197_215 v_197_214;

asr g_177_low60_20_low20_18 g_177_low60_20_low20_17 1;
asr r_197_215 r_197_214 1;
asr s_197_215 s_197_214 1;
assert
    true
&&
    f_177_low60_20_low20_18 = f_177_low60_20_low20_17,
    u_197_215 = u_197_214,
    v_197_215 = v_197_214,
    g_177_low60_20_low20_18 * (const 64 2) = g_177_low60_20_low20_17,
    r_197_215 * (const 64 2) = r_197_214,
    s_197_215 * (const 64 2) = s_197_214
;

assume
    f_177_low60_20_low20_18 = f_177_low60_20_low20_17,
    u_197_215 = u_197_214,
    v_197_215 = v_197_214,
    g_177_low60_20_low20_18 * 2 = g_177_low60_20_low20_17,
    r_197_215 * 2 = r_197_214,
    s_197_215 * 2 = s_197_214
&&
    true
;

{
    u_197_215 * f_177_low60_20_low20_0 + v_197_215 * g_177_low60_20_low20_0 = f_177_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_215 * f_177_low60_20_low20_0 + s_197_215 * g_177_low60_20_low20_0 = g_177_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_18 + u_197_215 * (const 64 (2**21)) + v_197_215 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_18 + r_197_215 * (const 64 (2**21)) + s_197_215 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_18,
    f_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_18,
    g_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 215)) <=s delta, delta <=s (const 64 (1 + 2*215)),
    (const 64 (-(2**20))) <=s u_197_215, u_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_215, v_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_215, r_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_215, s_197_215 <=s (const 64 ((2**20)-1)),
    u_197_215 + v_197_215 <=s (const 64 (2**20)),
    u_197_215 - v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 + v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 - v_197_215 <=s (const 64 (2**20)),
    r_197_215 + s_197_215 <=s (const 64 (2**20)),
    r_197_215 - s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 + s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 - s_197_215 <=s (const 64 (2**20)),
    u_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_197_215 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_214_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_17,
sint64 g_177_low60_20_low20_17,
sint64 f_177_low60_20_low20_18,
sint64 g_177_low60_20_low20_18,
sint64 u_197_214,
sint64 v_197_214,
sint64 r_197_214,
sint64 s_197_214,
sint64 u_197_215,
sint64 v_197_215,
sint64 r_197_215,
sint64 s_197_215,
bit ne
)={
    u_197_214 * f_177_low60_20_low20_0 + v_197_214 * g_177_low60_20_low20_0 = f_177_low60_20_low20_17 * (-(2**20)),
    r_197_214 * f_177_low60_20_low20_0 + s_197_214 * g_177_low60_20_low20_0 = g_177_low60_20_low20_17 * (-(2**20))
&&
    u_197_214 * f_177_low60_20_low20_0 + v_197_214 * g_177_low60_20_low20_0 = f_177_low60_20_low20_17 * (const 64 (-(2**20))),
    r_197_214 * f_177_low60_20_low20_0 + s_197_214 * g_177_low60_20_low20_0 = g_177_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_17 + u_197_214 * (const 64 (2**21)) + v_197_214 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_17 + r_197_214 * (const 64 (2**21)) + s_197_214 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_17,
    f_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_17,
    g_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 214)) <=s delta, delta <=s (const 64 (1 + 2*214)),
    (const 64 (-(2**20))) <=s u_197_214, u_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_214, v_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_214, r_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_214, s_197_214 <=s (const 64 ((2**20)-1)),
    u_197_214 + v_197_214 <=s (const 64 (2**20)),
    u_197_214 - v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 + v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 - v_197_214 <=s (const 64 (2**20)),
    r_197_214 + s_197_214 <=s (const 64 (2**20)),
    r_197_214 - s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 + s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 - s_197_214 <=s (const 64 (2**20)),
    u_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_197_214 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step214

// premise b
assume
g_177_low60_20_low20_17 = 1 (mod 2)
&&
g_177_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_18 f_177_low60_20_low20_17;
mov u_197_215 u_197_214;
mov v_197_215 v_197_214;

add g_177_low60_20_low20_18 g_177_low60_20_low20_17 f_177_low60_20_low20_17;
asr g_177_low60_20_low20_18 g_177_low60_20_low20_18 1;
add r_197_215 r_197_214 u_197_214;
asr r_197_215 r_197_215 1;
add s_197_215 s_197_214 v_197_214;
asr s_197_215 s_197_215 1;
assert
    true
&&
    f_177_low60_20_low20_18 = f_177_low60_20_low20_17,
    u_197_215 = u_197_214,
    v_197_215 = v_197_214,
    g_177_low60_20_low20_18 * (const 64 2) = g_177_low60_20_low20_17 + f_177_low60_20_low20_17,
    r_197_215 * (const 64 2) = r_197_214 + u_197_214,
    s_197_215 * (const 64 2) = s_197_214 + v_197_214
;

assume
    f_177_low60_20_low20_18 = f_177_low60_20_low20_17,
    u_197_215 = u_197_214,
    v_197_215 = v_197_214,
    g_177_low60_20_low20_18 * 2 = g_177_low60_20_low20_17 + f_177_low60_20_low20_17,
    r_197_215 * 2 = r_197_214 + u_197_214,
    s_197_215 * 2 = s_197_214 + v_197_214
&&
    true
;

{
    u_197_215 * f_177_low60_20_low20_0 + v_197_215 * g_177_low60_20_low20_0 = f_177_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_215 * f_177_low60_20_low20_0 + s_197_215 * g_177_low60_20_low20_0 = g_177_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_18 + u_197_215 * (const 64 (2**21)) + v_197_215 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_18 + r_197_215 * (const 64 (2**21)) + s_197_215 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_18,
    f_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_18,
    g_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 215)) <=s delta, delta <=s (const 64 (1 + 2*215)),
    (const 64 (-(2**20))) <=s u_197_215, u_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_215, v_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_215, r_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_215, s_197_215 <=s (const 64 ((2**20)-1)),
    u_197_215 + v_197_215 <=s (const 64 (2**20)),
    u_197_215 - v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 + v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 - v_197_215 <=s (const 64 (2**20)),
    r_197_215 + s_197_215 <=s (const 64 (2**20)),
    r_197_215 - s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 + s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 - s_197_215 <=s (const 64 (2**20)),
    u_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_197_215 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_214_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_17,
sint64 g_177_low60_20_low20_17,
sint64 f_177_low60_20_low20_18,
sint64 g_177_low60_20_low20_18,
sint64 u_197_214,
sint64 v_197_214,
sint64 r_197_214,
sint64 s_197_214,
sint64 u_197_215,
sint64 v_197_215,
sint64 r_197_215,
sint64 s_197_215,
bit ne
)={
    u_197_214 * f_177_low60_20_low20_0 + v_197_214 * g_177_low60_20_low20_0 = f_177_low60_20_low20_17 * (-(2**20)),
    r_197_214 * f_177_low60_20_low20_0 + s_197_214 * g_177_low60_20_low20_0 = g_177_low60_20_low20_17 * (-(2**20))
&&
    u_197_214 * f_177_low60_20_low20_0 + v_197_214 * g_177_low60_20_low20_0 = f_177_low60_20_low20_17 * (const 64 (-(2**20))),
    r_197_214 * f_177_low60_20_low20_0 + s_197_214 * g_177_low60_20_low20_0 = g_177_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_17 + u_197_214 * (const 64 (2**21)) + v_197_214 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_17 + r_197_214 * (const 64 (2**21)) + s_197_214 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_17,
    f_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_17,
    g_177_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 214)) <=s delta, delta <=s (const 64 (1 + 2*214)),
    (const 64 (-(2**20))) <=s u_197_214, u_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_214, v_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_214, r_197_214 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_214, s_197_214 <=s (const 64 ((2**20)-1)),
    u_197_214 + v_197_214 <=s (const 64 (2**20)),
    u_197_214 - v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 + v_197_214 <=s (const 64 (2**20)),
    (const 64 0) - u_197_214 - v_197_214 <=s (const 64 (2**20)),
    r_197_214 + s_197_214 <=s (const 64 (2**20)),
    r_197_214 - s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 + s_197_214 <=s (const 64 (2**20)),
    (const 64 0) - r_197_214 - s_197_214 <=s (const 64 (2**20)),
    u_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_197_214 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_197_214 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step214

// premise c
assume
g_177_low60_20_low20_17 = 1 (mod 2)
&&
g_177_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_18 g_177_low60_20_low20_17;
mov u_197_215 r_197_214;
mov v_197_215 s_197_214;

subs dc g_177_low60_20_low20_18 g_177_low60_20_low20_17 f_177_low60_20_low20_17;
asr g_177_low60_20_low20_18 g_177_low60_20_low20_18 1;
subs dc r_197_215 r_197_214 u_197_214;
asr r_197_215 r_197_215 1;
subs dc s_197_215 s_197_214 v_197_214;
asr s_197_215 s_197_215 1;
assert
    true
&&
    f_177_low60_20_low20_18 = g_177_low60_20_low20_17,
    u_197_215 = r_197_214,
    v_197_215 = s_197_214,
    g_177_low60_20_low20_18 * (const 64 2) = g_177_low60_20_low20_17 - f_177_low60_20_low20_17,
    r_197_215 * (const 64 2) = r_197_214 - u_197_214,
    s_197_215 * (const 64 2) = s_197_214 - v_197_214
;

assume
    f_177_low60_20_low20_18 = g_177_low60_20_low20_17,
    u_197_215 = r_197_214,
    v_197_215 = s_197_214,
    g_177_low60_20_low20_18 * 2 = g_177_low60_20_low20_17 - f_177_low60_20_low20_17,
    r_197_215 * 2 = r_197_214 - u_197_214,
    s_197_215 * 2 = s_197_214 - v_197_214
&&
    true
;

{
    u_197_215 * f_177_low60_20_low20_0 + v_197_215 * g_177_low60_20_low20_0 = f_177_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_215 * f_177_low60_20_low20_0 + s_197_215 * g_177_low60_20_low20_0 = g_177_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_18 + u_197_215 * (const 64 (2**21)) + v_197_215 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_18 + r_197_215 * (const 64 (2**21)) + s_197_215 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_18,
    f_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_18,
    g_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 215)) <=s delta, delta <=s (const 64 (1 + 2*215)),
    (const 64 (-(2**20))) <=s u_197_215, u_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_215, v_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_215, r_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_215, s_197_215 <=s (const 64 ((2**20)-1)),
    u_197_215 + v_197_215 <=s (const 64 (2**20)),
    u_197_215 - v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 + v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 - v_197_215 <=s (const 64 (2**20)),
    r_197_215 + s_197_215 <=s (const 64 (2**20)),
    r_197_215 - s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 + s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 - s_197_215 <=s (const 64 (2**20)),
    u_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_197_215 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_215_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_18,
sint64 g_177_low60_20_low20_18,
sint64 f_177_low60_20_low20_19,
sint64 g_177_low60_20_low20_19,
sint64 u_197_215,
sint64 v_197_215,
sint64 r_197_215,
sint64 s_197_215,
sint64 u_197_216,
sint64 v_197_216,
sint64 r_197_216,
sint64 s_197_216,
bit ne
)={
    u_197_215 * f_177_low60_20_low20_0 + v_197_215 * g_177_low60_20_low20_0 = f_177_low60_20_low20_18 * (-(2**20)),
    r_197_215 * f_177_low60_20_low20_0 + s_197_215 * g_177_low60_20_low20_0 = g_177_low60_20_low20_18 * (-(2**20))
&&
    u_197_215 * f_177_low60_20_low20_0 + v_197_215 * g_177_low60_20_low20_0 = f_177_low60_20_low20_18 * (const 64 (-(2**20))),
    r_197_215 * f_177_low60_20_low20_0 + s_197_215 * g_177_low60_20_low20_0 = g_177_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_18 + u_197_215 * (const 64 (2**21)) + v_197_215 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_18 + r_197_215 * (const 64 (2**21)) + s_197_215 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_18,
    f_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_18,
    g_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 215)) <=s delta, delta <=s (const 64 (1 + 2*215)),
    (const 64 (-(2**20))) <=s u_197_215, u_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_215, v_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_215, r_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_215, s_197_215 <=s (const 64 ((2**20)-1)),
    u_197_215 + v_197_215 <=s (const 64 (2**20)),
    u_197_215 - v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 + v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 - v_197_215 <=s (const 64 (2**20)),
    r_197_215 + s_197_215 <=s (const 64 (2**20)),
    r_197_215 - s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 + s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 - s_197_215 <=s (const 64 (2**20)),
    u_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_197_215 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step215

// premise a
assume
g_177_low60_20_low20_18 = 0 (mod 2)
&&
g_177_low60_20_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_177_low60_20_low20_19 f_177_low60_20_low20_18;
mov u_197_216 u_197_215;
mov v_197_216 v_197_215;

asr g_177_low60_20_low20_19 g_177_low60_20_low20_18 1;
asr r_197_216 r_197_215 1;
asr s_197_216 s_197_215 1;
assert
    true
&&
    f_177_low60_20_low20_19 = f_177_low60_20_low20_18,
    u_197_216 = u_197_215,
    v_197_216 = v_197_215,
    g_177_low60_20_low20_19 * (const 64 2) = g_177_low60_20_low20_18,
    r_197_216 * (const 64 2) = r_197_215,
    s_197_216 * (const 64 2) = s_197_215
;

assume
    f_177_low60_20_low20_19 = f_177_low60_20_low20_18,
    u_197_216 = u_197_215,
    v_197_216 = v_197_215,
    g_177_low60_20_low20_19 * 2 = g_177_low60_20_low20_18,
    r_197_216 * 2 = r_197_215,
    s_197_216 * 2 = s_197_215
&&
    true
;

{
    u_197_216 * f_177_low60_20_low20_0 + v_197_216 * g_177_low60_20_low20_0 = f_177_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_216 * f_177_low60_20_low20_0 + s_197_216 * g_177_low60_20_low20_0 = g_177_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_19 + u_197_216 * (const 64 (2**21)) + v_197_216 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_19 + r_197_216 * (const 64 (2**21)) + s_197_216 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_19,
    f_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_19,
    g_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 216)) <=s delta, delta <=s (const 64 (1 + 2*216)),
    (const 64 (-(2**20))) <=s u_197_216, u_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_216, v_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_216, r_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_216, s_197_216 <=s (const 64 ((2**20)-1)),
    u_197_216 + v_197_216 <=s (const 64 (2**20)),
    u_197_216 - v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 + v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 - v_197_216 <=s (const 64 (2**20)),
    r_197_216 + s_197_216 <=s (const 64 (2**20)),
    r_197_216 - s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 + s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 - s_197_216 <=s (const 64 (2**20)),
    u_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_197_216 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_215_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_18,
sint64 g_177_low60_20_low20_18,
sint64 f_177_low60_20_low20_19,
sint64 g_177_low60_20_low20_19,
sint64 u_197_215,
sint64 v_197_215,
sint64 r_197_215,
sint64 s_197_215,
sint64 u_197_216,
sint64 v_197_216,
sint64 r_197_216,
sint64 s_197_216,
bit ne
)={
    u_197_215 * f_177_low60_20_low20_0 + v_197_215 * g_177_low60_20_low20_0 = f_177_low60_20_low20_18 * (-(2**20)),
    r_197_215 * f_177_low60_20_low20_0 + s_197_215 * g_177_low60_20_low20_0 = g_177_low60_20_low20_18 * (-(2**20))
&&
    u_197_215 * f_177_low60_20_low20_0 + v_197_215 * g_177_low60_20_low20_0 = f_177_low60_20_low20_18 * (const 64 (-(2**20))),
    r_197_215 * f_177_low60_20_low20_0 + s_197_215 * g_177_low60_20_low20_0 = g_177_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_18 + u_197_215 * (const 64 (2**21)) + v_197_215 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_18 + r_197_215 * (const 64 (2**21)) + s_197_215 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_18,
    f_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_18,
    g_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 215)) <=s delta, delta <=s (const 64 (1 + 2*215)),
    (const 64 (-(2**20))) <=s u_197_215, u_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_215, v_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_215, r_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_215, s_197_215 <=s (const 64 ((2**20)-1)),
    u_197_215 + v_197_215 <=s (const 64 (2**20)),
    u_197_215 - v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 + v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 - v_197_215 <=s (const 64 (2**20)),
    r_197_215 + s_197_215 <=s (const 64 (2**20)),
    r_197_215 - s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 + s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 - s_197_215 <=s (const 64 (2**20)),
    u_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_197_215 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step215

// premise b
assume
g_177_low60_20_low20_18 = 1 (mod 2)
&&
g_177_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_19 f_177_low60_20_low20_18;
mov u_197_216 u_197_215;
mov v_197_216 v_197_215;

add g_177_low60_20_low20_19 g_177_low60_20_low20_18 f_177_low60_20_low20_18;
asr g_177_low60_20_low20_19 g_177_low60_20_low20_19 1;
add r_197_216 r_197_215 u_197_215;
asr r_197_216 r_197_216 1;
add s_197_216 s_197_215 v_197_215;
asr s_197_216 s_197_216 1;
assert
    true
&&
    f_177_low60_20_low20_19 = f_177_low60_20_low20_18,
    u_197_216 = u_197_215,
    v_197_216 = v_197_215,
    g_177_low60_20_low20_19 * (const 64 2) = g_177_low60_20_low20_18 + f_177_low60_20_low20_18,
    r_197_216 * (const 64 2) = r_197_215 + u_197_215,
    s_197_216 * (const 64 2) = s_197_215 + v_197_215
;

assume
    f_177_low60_20_low20_19 = f_177_low60_20_low20_18,
    u_197_216 = u_197_215,
    v_197_216 = v_197_215,
    g_177_low60_20_low20_19 * 2 = g_177_low60_20_low20_18 + f_177_low60_20_low20_18,
    r_197_216 * 2 = r_197_215 + u_197_215,
    s_197_216 * 2 = s_197_215 + v_197_215
&&
    true
;

{
    u_197_216 * f_177_low60_20_low20_0 + v_197_216 * g_177_low60_20_low20_0 = f_177_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_216 * f_177_low60_20_low20_0 + s_197_216 * g_177_low60_20_low20_0 = g_177_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_19 + u_197_216 * (const 64 (2**21)) + v_197_216 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_19 + r_197_216 * (const 64 (2**21)) + s_197_216 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_19,
    f_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_19,
    g_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 216)) <=s delta, delta <=s (const 64 (1 + 2*216)),
    (const 64 (-(2**20))) <=s u_197_216, u_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_216, v_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_216, r_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_216, s_197_216 <=s (const 64 ((2**20)-1)),
    u_197_216 + v_197_216 <=s (const 64 (2**20)),
    u_197_216 - v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 + v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 - v_197_216 <=s (const 64 (2**20)),
    r_197_216 + s_197_216 <=s (const 64 (2**20)),
    r_197_216 - s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 + s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 - s_197_216 <=s (const 64 (2**20)),
    u_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_197_216 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_215_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_18,
sint64 g_177_low60_20_low20_18,
sint64 f_177_low60_20_low20_19,
sint64 g_177_low60_20_low20_19,
sint64 u_197_215,
sint64 v_197_215,
sint64 r_197_215,
sint64 s_197_215,
sint64 u_197_216,
sint64 v_197_216,
sint64 r_197_216,
sint64 s_197_216,
bit ne
)={
    u_197_215 * f_177_low60_20_low20_0 + v_197_215 * g_177_low60_20_low20_0 = f_177_low60_20_low20_18 * (-(2**20)),
    r_197_215 * f_177_low60_20_low20_0 + s_197_215 * g_177_low60_20_low20_0 = g_177_low60_20_low20_18 * (-(2**20))
&&
    u_197_215 * f_177_low60_20_low20_0 + v_197_215 * g_177_low60_20_low20_0 = f_177_low60_20_low20_18 * (const 64 (-(2**20))),
    r_197_215 * f_177_low60_20_low20_0 + s_197_215 * g_177_low60_20_low20_0 = g_177_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_18 + u_197_215 * (const 64 (2**21)) + v_197_215 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_18 + r_197_215 * (const 64 (2**21)) + s_197_215 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_18,
    f_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_18,
    g_177_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 215)) <=s delta, delta <=s (const 64 (1 + 2*215)),
    (const 64 (-(2**20))) <=s u_197_215, u_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_215, v_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_215, r_197_215 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_215, s_197_215 <=s (const 64 ((2**20)-1)),
    u_197_215 + v_197_215 <=s (const 64 (2**20)),
    u_197_215 - v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 + v_197_215 <=s (const 64 (2**20)),
    (const 64 0) - u_197_215 - v_197_215 <=s (const 64 (2**20)),
    r_197_215 + s_197_215 <=s (const 64 (2**20)),
    r_197_215 - s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 + s_197_215 <=s (const 64 (2**20)),
    (const 64 0) - r_197_215 - s_197_215 <=s (const 64 (2**20)),
    u_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_197_215 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_197_215 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step215

// premise c
assume
g_177_low60_20_low20_18 = 1 (mod 2)
&&
g_177_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_19 g_177_low60_20_low20_18;
mov u_197_216 r_197_215;
mov v_197_216 s_197_215;

subs dc g_177_low60_20_low20_19 g_177_low60_20_low20_18 f_177_low60_20_low20_18;
asr g_177_low60_20_low20_19 g_177_low60_20_low20_19 1;
subs dc r_197_216 r_197_215 u_197_215;
asr r_197_216 r_197_216 1;
subs dc s_197_216 s_197_215 v_197_215;
asr s_197_216 s_197_216 1;
assert
    true
&&
    f_177_low60_20_low20_19 = g_177_low60_20_low20_18,
    u_197_216 = r_197_215,
    v_197_216 = s_197_215,
    g_177_low60_20_low20_19 * (const 64 2) = g_177_low60_20_low20_18 - f_177_low60_20_low20_18,
    r_197_216 * (const 64 2) = r_197_215 - u_197_215,
    s_197_216 * (const 64 2) = s_197_215 - v_197_215
;

assume
    f_177_low60_20_low20_19 = g_177_low60_20_low20_18,
    u_197_216 = r_197_215,
    v_197_216 = s_197_215,
    g_177_low60_20_low20_19 * 2 = g_177_low60_20_low20_18 - f_177_low60_20_low20_18,
    r_197_216 * 2 = r_197_215 - u_197_215,
    s_197_216 * 2 = s_197_215 - v_197_215
&&
    true
;

{
    u_197_216 * f_177_low60_20_low20_0 + v_197_216 * g_177_low60_20_low20_0 = f_177_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_216 * f_177_low60_20_low20_0 + s_197_216 * g_177_low60_20_low20_0 = g_177_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_19 + u_197_216 * (const 64 (2**21)) + v_197_216 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_19 + r_197_216 * (const 64 (2**21)) + s_197_216 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_19,
    f_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_19,
    g_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 216)) <=s delta, delta <=s (const 64 (1 + 2*216)),
    (const 64 (-(2**20))) <=s u_197_216, u_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_216, v_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_216, r_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_216, s_197_216 <=s (const 64 ((2**20)-1)),
    u_197_216 + v_197_216 <=s (const 64 (2**20)),
    u_197_216 - v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 + v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 - v_197_216 <=s (const 64 (2**20)),
    r_197_216 + s_197_216 <=s (const 64 (2**20)),
    r_197_216 - s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 + s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 - s_197_216 <=s (const 64 (2**20)),
    u_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_197_216 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_216_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_19,
sint64 g_177_low60_20_low20_19,
sint64 f_177_low60_20_low20_20,
sint64 g_177_low60_20_low20_20,
sint64 u_197_216,
sint64 v_197_216,
sint64 r_197_216,
sint64 s_197_216,
sint64 u_197_217,
sint64 v_197_217,
sint64 r_197_217,
sint64 s_197_217,
bit ne
)={
    u_197_216 * f_177_low60_20_low20_0 + v_197_216 * g_177_low60_20_low20_0 = f_177_low60_20_low20_19 * (-(2**20)),
    r_197_216 * f_177_low60_20_low20_0 + s_197_216 * g_177_low60_20_low20_0 = g_177_low60_20_low20_19 * (-(2**20))
&&
    u_197_216 * f_177_low60_20_low20_0 + v_197_216 * g_177_low60_20_low20_0 = f_177_low60_20_low20_19 * (const 64 (-(2**20))),
    r_197_216 * f_177_low60_20_low20_0 + s_197_216 * g_177_low60_20_low20_0 = g_177_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_19 + u_197_216 * (const 64 (2**21)) + v_197_216 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_19 + r_197_216 * (const 64 (2**21)) + s_197_216 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_19,
    f_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_19,
    g_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 216)) <=s delta, delta <=s (const 64 (1 + 2*216)),
    (const 64 (-(2**20))) <=s u_197_216, u_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_216, v_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_216, r_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_216, s_197_216 <=s (const 64 ((2**20)-1)),
    u_197_216 + v_197_216 <=s (const 64 (2**20)),
    u_197_216 - v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 + v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 - v_197_216 <=s (const 64 (2**20)),
    r_197_216 + s_197_216 <=s (const 64 (2**20)),
    r_197_216 - s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 + s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 - s_197_216 <=s (const 64 (2**20)),
    u_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_197_216 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step216

// premise a
assume
g_177_low60_20_low20_19 = 0 (mod 2)
&&
g_177_low60_20_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov f_177_low60_20_low20_20 f_177_low60_20_low20_19;
mov u_197_217 u_197_216;
mov v_197_217 v_197_216;

asr g_177_low60_20_low20_20 g_177_low60_20_low20_19 1;
asr r_197_217 r_197_216 1;
asr s_197_217 s_197_216 1;
assert
    true
&&
    f_177_low60_20_low20_20 = f_177_low60_20_low20_19,
    u_197_217 = u_197_216,
    v_197_217 = v_197_216,
    g_177_low60_20_low20_20 * (const 64 2) = g_177_low60_20_low20_19,
    r_197_217 * (const 64 2) = r_197_216,
    s_197_217 * (const 64 2) = s_197_216
;

assume
    f_177_low60_20_low20_20 = f_177_low60_20_low20_19,
    u_197_217 = u_197_216,
    v_197_217 = v_197_216,
    g_177_low60_20_low20_20 * 2 = g_177_low60_20_low20_19,
    r_197_217 * 2 = r_197_216,
    s_197_217 * 2 = s_197_216
&&
    true
;

{
    u_197_217 * f_177_low60_20_low20_0 + v_197_217 * g_177_low60_20_low20_0 = f_177_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_217 * f_177_low60_20_low20_0 + s_197_217 * g_177_low60_20_low20_0 = g_177_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_20 + u_197_217 * (const 64 (2**21)) + v_197_217 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_20 + r_197_217 * (const 64 (2**21)) + s_197_217 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_20,
    f_177_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_20,
    g_177_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 217)) <=s delta, delta <=s (const 64 (1 + 2*217)),
    (const 64 (-(2**20))) <=s u_197_217, u_197_217 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_217, v_197_217 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_217, r_197_217 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_217, s_197_217 <=s (const 64 ((2**20)-1)),
    u_197_217 + v_197_217 <=s (const 64 (2**20)),
    u_197_217 - v_197_217 <=s (const 64 (2**20)),
    (const 64 0) - u_197_217 + v_197_217 <=s (const 64 (2**20)),
    (const 64 0) - u_197_217 - v_197_217 <=s (const 64 (2**20)),
    r_197_217 + s_197_217 <=s (const 64 (2**20)),
    r_197_217 - s_197_217 <=s (const 64 (2**20)),
    (const 64 0) - r_197_217 + s_197_217 <=s (const 64 (2**20)),
    (const 64 0) - r_197_217 - s_197_217 <=s (const 64 (2**20)),
    u_197_217 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_197_217 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_197_217 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_197_217 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_216_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_19,
sint64 g_177_low60_20_low20_19,
sint64 f_177_low60_20_low20_20,
sint64 g_177_low60_20_low20_20,
sint64 u_197_216,
sint64 v_197_216,
sint64 r_197_216,
sint64 s_197_216,
sint64 u_197_217,
sint64 v_197_217,
sint64 r_197_217,
sint64 s_197_217,
bit ne
)={
    u_197_216 * f_177_low60_20_low20_0 + v_197_216 * g_177_low60_20_low20_0 = f_177_low60_20_low20_19 * (-(2**20)),
    r_197_216 * f_177_low60_20_low20_0 + s_197_216 * g_177_low60_20_low20_0 = g_177_low60_20_low20_19 * (-(2**20))
&&
    u_197_216 * f_177_low60_20_low20_0 + v_197_216 * g_177_low60_20_low20_0 = f_177_low60_20_low20_19 * (const 64 (-(2**20))),
    r_197_216 * f_177_low60_20_low20_0 + s_197_216 * g_177_low60_20_low20_0 = g_177_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_19 + u_197_216 * (const 64 (2**21)) + v_197_216 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_19 + r_197_216 * (const 64 (2**21)) + s_197_216 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_19,
    f_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_19,
    g_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 216)) <=s delta, delta <=s (const 64 (1 + 2*216)),
    (const 64 (-(2**20))) <=s u_197_216, u_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_216, v_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_216, r_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_216, s_197_216 <=s (const 64 ((2**20)-1)),
    u_197_216 + v_197_216 <=s (const 64 (2**20)),
    u_197_216 - v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 + v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 - v_197_216 <=s (const 64 (2**20)),
    r_197_216 + s_197_216 <=s (const 64 (2**20)),
    r_197_216 - s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 + s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 - s_197_216 <=s (const 64 (2**20)),
    u_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_197_216 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step216

// premise b
assume
g_177_low60_20_low20_19 = 1 (mod 2)
&&
g_177_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_20 f_177_low60_20_low20_19;
mov u_197_217 u_197_216;
mov v_197_217 v_197_216;

add g_177_low60_20_low20_20 g_177_low60_20_low20_19 f_177_low60_20_low20_19;
asr g_177_low60_20_low20_20 g_177_low60_20_low20_20 1;
add r_197_217 r_197_216 u_197_216;
asr r_197_217 r_197_217 1;
add s_197_217 s_197_216 v_197_216;
asr s_197_217 s_197_217 1;
assert
    true
&&
    f_177_low60_20_low20_20 = f_177_low60_20_low20_19,
    u_197_217 = u_197_216,
    v_197_217 = v_197_216,
    g_177_low60_20_low20_20 * (const 64 2) = g_177_low60_20_low20_19 + f_177_low60_20_low20_19,
    r_197_217 * (const 64 2) = r_197_216 + u_197_216,
    s_197_217 * (const 64 2) = s_197_216 + v_197_216
;

assume
    f_177_low60_20_low20_20 = f_177_low60_20_low20_19,
    u_197_217 = u_197_216,
    v_197_217 = v_197_216,
    g_177_low60_20_low20_20 * 2 = g_177_low60_20_low20_19 + f_177_low60_20_low20_19,
    r_197_217 * 2 = r_197_216 + u_197_216,
    s_197_217 * 2 = s_197_216 + v_197_216
&&
    true
;

{
    u_197_217 * f_177_low60_20_low20_0 + v_197_217 * g_177_low60_20_low20_0 = f_177_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_217 * f_177_low60_20_low20_0 + s_197_217 * g_177_low60_20_low20_0 = g_177_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_20 + u_197_217 * (const 64 (2**21)) + v_197_217 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_20 + r_197_217 * (const 64 (2**21)) + s_197_217 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_20,
    f_177_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_20,
    g_177_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 217)) <=s delta, delta <=s (const 64 (1 + 2*217)),
    (const 64 (-(2**20))) <=s u_197_217, u_197_217 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_217, v_197_217 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_217, r_197_217 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_217, s_197_217 <=s (const 64 ((2**20)-1)),
    u_197_217 + v_197_217 <=s (const 64 (2**20)),
    u_197_217 - v_197_217 <=s (const 64 (2**20)),
    (const 64 0) - u_197_217 + v_197_217 <=s (const 64 (2**20)),
    (const 64 0) - u_197_217 - v_197_217 <=s (const 64 (2**20)),
    r_197_217 + s_197_217 <=s (const 64 (2**20)),
    r_197_217 - s_197_217 <=s (const 64 (2**20)),
    (const 64 0) - r_197_217 + s_197_217 <=s (const 64 (2**20)),
    (const 64 0) - r_197_217 - s_197_217 <=s (const 64 (2**20)),
    u_197_217 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_197_217 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_197_217 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_197_217 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_216_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_19,
sint64 g_177_low60_20_low20_19,
sint64 f_177_low60_20_low20_20,
sint64 g_177_low60_20_low20_20,
sint64 u_197_216,
sint64 v_197_216,
sint64 r_197_216,
sint64 s_197_216,
sint64 u_197_217,
sint64 v_197_217,
sint64 r_197_217,
sint64 s_197_217,
bit ne
)={
    u_197_216 * f_177_low60_20_low20_0 + v_197_216 * g_177_low60_20_low20_0 = f_177_low60_20_low20_19 * (-(2**20)),
    r_197_216 * f_177_low60_20_low20_0 + s_197_216 * g_177_low60_20_low20_0 = g_177_low60_20_low20_19 * (-(2**20))
&&
    u_197_216 * f_177_low60_20_low20_0 + v_197_216 * g_177_low60_20_low20_0 = f_177_low60_20_low20_19 * (const 64 (-(2**20))),
    r_197_216 * f_177_low60_20_low20_0 + s_197_216 * g_177_low60_20_low20_0 = g_177_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_19 + u_197_216 * (const 64 (2**21)) + v_197_216 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_19 + r_197_216 * (const 64 (2**21)) + s_197_216 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_19,
    f_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_19,
    g_177_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 216)) <=s delta, delta <=s (const 64 (1 + 2*216)),
    (const 64 (-(2**20))) <=s u_197_216, u_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_216, v_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_216, r_197_216 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_216, s_197_216 <=s (const 64 ((2**20)-1)),
    u_197_216 + v_197_216 <=s (const 64 (2**20)),
    u_197_216 - v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 + v_197_216 <=s (const 64 (2**20)),
    (const 64 0) - u_197_216 - v_197_216 <=s (const 64 (2**20)),
    r_197_216 + s_197_216 <=s (const 64 (2**20)),
    r_197_216 - s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 + s_197_216 <=s (const 64 (2**20)),
    (const 64 0) - r_197_216 - s_197_216 <=s (const 64 (2**20)),
    u_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_197_216 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_197_216 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step216

// premise c
assume
g_177_low60_20_low20_19 = 1 (mod 2)
&&
g_177_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_20 g_177_low60_20_low20_19;
mov u_197_217 r_197_216;
mov v_197_217 s_197_216;

subs dc g_177_low60_20_low20_20 g_177_low60_20_low20_19 f_177_low60_20_low20_19;
asr g_177_low60_20_low20_20 g_177_low60_20_low20_20 1;
subs dc r_197_217 r_197_216 u_197_216;
asr r_197_217 r_197_217 1;
subs dc s_197_217 s_197_216 v_197_216;
asr s_197_217 s_197_217 1;
assert
    true
&&
    f_177_low60_20_low20_20 = g_177_low60_20_low20_19,
    u_197_217 = r_197_216,
    v_197_217 = s_197_216,
    g_177_low60_20_low20_20 * (const 64 2) = g_177_low60_20_low20_19 - f_177_low60_20_low20_19,
    r_197_217 * (const 64 2) = r_197_216 - u_197_216,
    s_197_217 * (const 64 2) = s_197_216 - v_197_216
;

assume
    f_177_low60_20_low20_20 = g_177_low60_20_low20_19,
    u_197_217 = r_197_216,
    v_197_217 = s_197_216,
    g_177_low60_20_low20_20 * 2 = g_177_low60_20_low20_19 - f_177_low60_20_low20_19,
    r_197_217 * 2 = r_197_216 - u_197_216,
    s_197_217 * 2 = s_197_216 - v_197_216
&&
    true
;

{
    u_197_217 * f_177_low60_20_low20_0 + v_197_217 * g_177_low60_20_low20_0 = f_177_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_217 * f_177_low60_20_low20_0 + s_197_217 * g_177_low60_20_low20_0 = g_177_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_20 + u_197_217 * (const 64 (2**21)) + v_197_217 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_20 + r_197_217 * (const 64 (2**21)) + s_197_217 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_20,
    f_177_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_20,
    g_177_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 217)) <=s delta, delta <=s (const 64 (1 + 2*217)),
    (const 64 (-(2**20))) <=s u_197_217, u_197_217 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_197_217, v_197_217 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_197_217, r_197_217 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_197_217, s_197_217 <=s (const 64 ((2**20)-1)),
    u_197_217 + v_197_217 <=s (const 64 (2**20)),
    u_197_217 - v_197_217 <=s (const 64 (2**20)),
    (const 64 0) - u_197_217 + v_197_217 <=s (const 64 (2**20)),
    (const 64 0) - u_197_217 - v_197_217 <=s (const 64 (2**20)),
    r_197_217 + s_197_217 <=s (const 64 (2**20)),
    r_197_217 - s_197_217 <=s (const 64 (2**20)),
    (const 64 0) - r_197_217 + s_197_217 <=s (const 64 (2**20)),
    (const 64 0) - r_197_217 - s_197_217 <=s (const 64 (2**20)),
    u_197_217 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_197_217 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_197_217 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_197_217 = (const 64 0) (mod (const 64 (2**(20-20))))
}

