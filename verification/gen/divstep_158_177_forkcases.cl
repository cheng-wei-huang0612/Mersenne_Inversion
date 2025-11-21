proc divstep_158_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_1,
sint64 g_118_low60_40_low20_1,
sint64 u_158_158,
sint64 v_158_158,
sint64 r_158_158,
sint64 s_158_158,
sint64 u_158_159,
sint64 v_158_159,
sint64 r_158_159,
sint64 s_158_159,
bit ne
)={
    u_158_158 * f_118_low60_40_low20_0 + v_158_158 * g_118_low60_40_low20_0 = f_118_low60_40_low20_0 * (-(2**20)),
    r_158_158 * f_118_low60_40_low20_0 + s_158_158 * g_118_low60_40_low20_0 = g_118_low60_40_low20_0 * (-(2**20))
&&
    u_158_158 * f_118_low60_40_low20_0 + v_158_158 * g_118_low60_40_low20_0 = f_118_low60_40_low20_0 * (const 64 (-(2**20))),
    r_158_158 * f_118_low60_40_low20_0 + s_158_158 * g_118_low60_40_low20_0 = g_118_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_0 + u_158_158 * (const 64 (2**21)) + v_158_158 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_0 + r_158_158 * (const 64 (2**21)) + s_158_158 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 158)) <=s delta, delta <=s (const 64 (1 + 2*158)),
    u_158_158 = (const 64 (-(2**20))),
    v_158_158 = (const 64 (0)),
    r_158_158 = (const 64 (0)),
    s_158_158 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise a
assume
g_118_low60_40_low20_0 = 0 (mod 2)
&&
g_118_low60_40_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_118_low60_40_low20_1 f_118_low60_40_low20_0;
mov u_158_159 u_158_158;
mov v_158_159 v_158_158;

asr g_118_low60_40_low20_1 g_118_low60_40_low20_0 1;
asr r_158_159 r_158_158 1;
asr s_158_159 s_158_158 1;
assert
    true
&&
    f_118_low60_40_low20_1 = f_118_low60_40_low20_0,
    u_158_159 = u_158_158,
    v_158_159 = v_158_158,
    g_118_low60_40_low20_1 * (const 64 2) = g_118_low60_40_low20_0,
    r_158_159 * (const 64 2) = r_158_158,
    s_158_159 * (const 64 2) = s_158_158
;

assume
    f_118_low60_40_low20_1 = f_118_low60_40_low20_0,
    u_158_159 = u_158_158,
    v_158_159 = v_158_158,
    g_118_low60_40_low20_1 * 2 = g_118_low60_40_low20_0,
    r_158_159 * 2 = r_158_158,
    s_158_159 * 2 = s_158_158
&&
    true
;

{
    u_158_159 * f_118_low60_40_low20_0 + v_158_159 * g_118_low60_40_low20_0 = f_118_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_159 * f_118_low60_40_low20_0 + s_158_159 * g_118_low60_40_low20_0 = g_118_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_1 + u_158_159 * (const 64 (2**21)) + v_158_159 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_1 + r_158_159 * (const 64 (2**21)) + s_158_159 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_1,
    f_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_1,
    g_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 159)) <=s delta, delta <=s (const 64 (1 + 2*159)),
    (const 64 (-(2**20))) <=s u_158_159, u_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_159, v_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_159, r_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_159, s_158_159 <=s (const 64 ((2**20))),
    u_158_159 + v_158_159 <=s (const 64 (2**20)),
    u_158_159 - v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 + v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 - v_158_159 <=s (const 64 (2**20)),
    r_158_159 + s_158_159 <=s (const 64 (2**20)),
    r_158_159 - s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 + s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 - s_158_159 <=s (const 64 (2**20)),
    u_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_158_159 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_158_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_1,
sint64 g_118_low60_40_low20_1,
sint64 u_158_158,
sint64 v_158_158,
sint64 r_158_158,
sint64 s_158_158,
sint64 u_158_159,
sint64 v_158_159,
sint64 r_158_159,
sint64 s_158_159,
bit ne
)={
    u_158_158 * f_118_low60_40_low20_0 + v_158_158 * g_118_low60_40_low20_0 = f_118_low60_40_low20_0 * (-(2**20)),
    r_158_158 * f_118_low60_40_low20_0 + s_158_158 * g_118_low60_40_low20_0 = g_118_low60_40_low20_0 * (-(2**20))
&&
    u_158_158 * f_118_low60_40_low20_0 + v_158_158 * g_118_low60_40_low20_0 = f_118_low60_40_low20_0 * (const 64 (-(2**20))),
    r_158_158 * f_118_low60_40_low20_0 + s_158_158 * g_118_low60_40_low20_0 = g_118_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_0 + u_158_158 * (const 64 (2**21)) + v_158_158 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_0 + r_158_158 * (const 64 (2**21)) + s_158_158 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 158)) <=s delta, delta <=s (const 64 (1 + 2*158)),
    u_158_158 = (const 64 (-(2**20))),
    v_158_158 = (const 64 (0)),
    r_158_158 = (const 64 (0)),
    s_158_158 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise b
assume
g_118_low60_40_low20_0 = 1 (mod 2)
&&
g_118_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_1 f_118_low60_40_low20_0;
mov u_158_159 u_158_158;
mov v_158_159 v_158_158;

add g_118_low60_40_low20_1 g_118_low60_40_low20_0 f_118_low60_40_low20_0;
asr g_118_low60_40_low20_1 g_118_low60_40_low20_1 1;
add r_158_159 r_158_158 u_158_158;
asr r_158_159 r_158_159 1;
add s_158_159 s_158_158 v_158_158;
asr s_158_159 s_158_159 1;
assert
    true
&&
    f_118_low60_40_low20_1 = f_118_low60_40_low20_0,
    u_158_159 = u_158_158,
    v_158_159 = v_158_158,
    g_118_low60_40_low20_1 * (const 64 2) = g_118_low60_40_low20_0 + f_118_low60_40_low20_0,
    r_158_159 * (const 64 2) = r_158_158 + u_158_158,
    s_158_159 * (const 64 2) = s_158_158 + v_158_158
;

assume
    f_118_low60_40_low20_1 = f_118_low60_40_low20_0,
    u_158_159 = u_158_158,
    v_158_159 = v_158_158,
    g_118_low60_40_low20_1 * 2 = g_118_low60_40_low20_0 + f_118_low60_40_low20_0,
    r_158_159 * 2 = r_158_158 + u_158_158,
    s_158_159 * 2 = s_158_158 + v_158_158
&&
    true
;

{
    u_158_159 * f_118_low60_40_low20_0 + v_158_159 * g_118_low60_40_low20_0 = f_118_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_159 * f_118_low60_40_low20_0 + s_158_159 * g_118_low60_40_low20_0 = g_118_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_1 + u_158_159 * (const 64 (2**21)) + v_158_159 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_1 + r_158_159 * (const 64 (2**21)) + s_158_159 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_1,
    f_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_1,
    g_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 159)) <=s delta, delta <=s (const 64 (1 + 2*159)),
    (const 64 (-(2**20))) <=s u_158_159, u_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_159, v_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_159, r_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_159, s_158_159 <=s (const 64 ((2**20))),
    u_158_159 + v_158_159 <=s (const 64 (2**20)),
    u_158_159 - v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 + v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 - v_158_159 <=s (const 64 (2**20)),
    r_158_159 + s_158_159 <=s (const 64 (2**20)),
    r_158_159 - s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 + s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 - s_158_159 <=s (const 64 (2**20)),
    u_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_158_159 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_158_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_1,
sint64 g_118_low60_40_low20_1,
sint64 u_158_158,
sint64 v_158_158,
sint64 r_158_158,
sint64 s_158_158,
sint64 u_158_159,
sint64 v_158_159,
sint64 r_158_159,
sint64 s_158_159,
bit ne
)={
    u_158_158 * f_118_low60_40_low20_0 + v_158_158 * g_118_low60_40_low20_0 = f_118_low60_40_low20_0 * (-(2**20)),
    r_158_158 * f_118_low60_40_low20_0 + s_158_158 * g_118_low60_40_low20_0 = g_118_low60_40_low20_0 * (-(2**20))
&&
    u_158_158 * f_118_low60_40_low20_0 + v_158_158 * g_118_low60_40_low20_0 = f_118_low60_40_low20_0 * (const 64 (-(2**20))),
    r_158_158 * f_118_low60_40_low20_0 + s_158_158 * g_118_low60_40_low20_0 = g_118_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_0 + u_158_158 * (const 64 (2**21)) + v_158_158 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_0 + r_158_158 * (const 64 (2**21)) + s_158_158 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 158)) <=s delta, delta <=s (const 64 (1 + 2*158)),
    u_158_158 = (const 64 (-(2**20))),
    v_158_158 = (const 64 (0)),
    r_158_158 = (const 64 (0)),
    s_158_158 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise c
assume
g_118_low60_40_low20_0 = 1 (mod 2)
&&
g_118_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_1 g_118_low60_40_low20_0;
mov u_158_159 r_158_158;
mov v_158_159 s_158_158;

subs dc g_118_low60_40_low20_1 g_118_low60_40_low20_0 f_118_low60_40_low20_0;
asr g_118_low60_40_low20_1 g_118_low60_40_low20_1 1;
subs dc r_158_159 r_158_158 u_158_158;
asr r_158_159 r_158_159 1;
subs dc s_158_159 s_158_158 v_158_158;
asr s_158_159 s_158_159 1;
assert
    true
&&
    f_118_low60_40_low20_1 = g_118_low60_40_low20_0,
    u_158_159 = r_158_158,
    v_158_159 = s_158_158,
    g_118_low60_40_low20_1 * (const 64 2) = g_118_low60_40_low20_0 - f_118_low60_40_low20_0,
    r_158_159 * (const 64 2) = r_158_158 - u_158_158,
    s_158_159 * (const 64 2) = s_158_158 - v_158_158
;

assume
    f_118_low60_40_low20_1 = g_118_low60_40_low20_0,
    u_158_159 = r_158_158,
    v_158_159 = s_158_158,
    g_118_low60_40_low20_1 * 2 = g_118_low60_40_low20_0 - f_118_low60_40_low20_0,
    r_158_159 * 2 = r_158_158 - u_158_158,
    s_158_159 * 2 = s_158_158 - v_158_158
&&
    true
;

{
    u_158_159 * f_118_low60_40_low20_0 + v_158_159 * g_118_low60_40_low20_0 = f_118_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_159 * f_118_low60_40_low20_0 + s_158_159 * g_118_low60_40_low20_0 = g_118_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_1 + u_158_159 * (const 64 (2**21)) + v_158_159 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_1 + r_158_159 * (const 64 (2**21)) + s_158_159 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_1,
    f_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_1,
    g_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 159)) <=s delta, delta <=s (const 64 (1 + 2*159)),
    (const 64 (-(2**20))) <=s u_158_159, u_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_159, v_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_159, r_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_159, s_158_159 <=s (const 64 ((2**20))),
    u_158_159 + v_158_159 <=s (const 64 (2**20)),
    u_158_159 - v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 + v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 - v_158_159 <=s (const 64 (2**20)),
    r_158_159 + s_158_159 <=s (const 64 (2**20)),
    r_158_159 - s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 + s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 - s_158_159 <=s (const 64 (2**20)),
    u_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_158_159 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_159_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_1,
sint64 g_118_low60_40_low20_1,
sint64 f_118_low60_40_low20_2,
sint64 g_118_low60_40_low20_2,
sint64 u_158_159,
sint64 v_158_159,
sint64 r_158_159,
sint64 s_158_159,
sint64 u_158_160,
sint64 v_158_160,
sint64 r_158_160,
sint64 s_158_160,
bit ne
)={
    u_158_159 * f_118_low60_40_low20_0 + v_158_159 * g_118_low60_40_low20_0 = f_118_low60_40_low20_1 * (-(2**20)),
    r_158_159 * f_118_low60_40_low20_0 + s_158_159 * g_118_low60_40_low20_0 = g_118_low60_40_low20_1 * (-(2**20))
&&
    u_158_159 * f_118_low60_40_low20_0 + v_158_159 * g_118_low60_40_low20_0 = f_118_low60_40_low20_1 * (const 64 (-(2**20))),
    r_158_159 * f_118_low60_40_low20_0 + s_158_159 * g_118_low60_40_low20_0 = g_118_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_1 + u_158_159 * (const 64 (2**21)) + v_158_159 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_1 + r_158_159 * (const 64 (2**21)) + s_158_159 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_1,
    f_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_1,
    g_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 159)) <=s delta, delta <=s (const 64 (1 + 2*159)),
    (const 64 (-(2**20))) <=s u_158_159, u_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_159, v_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_159, r_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_159, s_158_159 <=s (const 64 ((2**20))),
    u_158_159 + v_158_159 <=s (const 64 (2**20)),
    u_158_159 - v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 + v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 - v_158_159 <=s (const 64 (2**20)),
    r_158_159 + s_158_159 <=s (const 64 (2**20)),
    r_158_159 - s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 + s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 - s_158_159 <=s (const 64 (2**20)),
    u_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_158_159 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise a
assume
g_118_low60_40_low20_1 = 0 (mod 2)
&&
g_118_low60_40_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_2 f_118_low60_40_low20_1;
mov u_158_160 u_158_159;
mov v_158_160 v_158_159;

asr g_118_low60_40_low20_2 g_118_low60_40_low20_1 1;
asr r_158_160 r_158_159 1;
asr s_158_160 s_158_159 1;
assert
    true
&&
    f_118_low60_40_low20_2 = f_118_low60_40_low20_1,
    u_158_160 = u_158_159,
    v_158_160 = v_158_159,
    g_118_low60_40_low20_2 * (const 64 2) = g_118_low60_40_low20_1,
    r_158_160 * (const 64 2) = r_158_159,
    s_158_160 * (const 64 2) = s_158_159
;

assume
    f_118_low60_40_low20_2 = f_118_low60_40_low20_1,
    u_158_160 = u_158_159,
    v_158_160 = v_158_159,
    g_118_low60_40_low20_2 * 2 = g_118_low60_40_low20_1,
    r_158_160 * 2 = r_158_159,
    s_158_160 * 2 = s_158_159
&&
    true
;

{
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_2 + u_158_160 * (const 64 (2**21)) + v_158_160 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_2 + r_158_160 * (const 64 (2**21)) + s_158_160 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_2,
    f_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_2,
    g_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 160)) <=s delta, delta <=s (const 64 (1 + 2*160)),
    (const 64 (-(2**20))) <=s u_158_160, u_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_160, v_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_160, r_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_160, s_158_160 <=s (const 64 ((2**20))),
    u_158_160 + v_158_160 <=s (const 64 (2**20)),
    u_158_160 - v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 + v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 - v_158_160 <=s (const 64 (2**20)),
    r_158_160 + s_158_160 <=s (const 64 (2**20)),
    r_158_160 - s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 + s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 - s_158_160 <=s (const 64 (2**20)),
    u_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_158_160 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_159_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_1,
sint64 g_118_low60_40_low20_1,
sint64 f_118_low60_40_low20_2,
sint64 g_118_low60_40_low20_2,
sint64 u_158_159,
sint64 v_158_159,
sint64 r_158_159,
sint64 s_158_159,
sint64 u_158_160,
sint64 v_158_160,
sint64 r_158_160,
sint64 s_158_160,
bit ne
)={
    u_158_159 * f_118_low60_40_low20_0 + v_158_159 * g_118_low60_40_low20_0 = f_118_low60_40_low20_1 * (-(2**20)),
    r_158_159 * f_118_low60_40_low20_0 + s_158_159 * g_118_low60_40_low20_0 = g_118_low60_40_low20_1 * (-(2**20))
&&
    u_158_159 * f_118_low60_40_low20_0 + v_158_159 * g_118_low60_40_low20_0 = f_118_low60_40_low20_1 * (const 64 (-(2**20))),
    r_158_159 * f_118_low60_40_low20_0 + s_158_159 * g_118_low60_40_low20_0 = g_118_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_1 + u_158_159 * (const 64 (2**21)) + v_158_159 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_1 + r_158_159 * (const 64 (2**21)) + s_158_159 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_1,
    f_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_1,
    g_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 159)) <=s delta, delta <=s (const 64 (1 + 2*159)),
    (const 64 (-(2**20))) <=s u_158_159, u_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_159, v_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_159, r_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_159, s_158_159 <=s (const 64 ((2**20))),
    u_158_159 + v_158_159 <=s (const 64 (2**20)),
    u_158_159 - v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 + v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 - v_158_159 <=s (const 64 (2**20)),
    r_158_159 + s_158_159 <=s (const 64 (2**20)),
    r_158_159 - s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 + s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 - s_158_159 <=s (const 64 (2**20)),
    u_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_158_159 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise b
assume
g_118_low60_40_low20_1 = 1 (mod 2)
&&
g_118_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_2 f_118_low60_40_low20_1;
mov u_158_160 u_158_159;
mov v_158_160 v_158_159;

add g_118_low60_40_low20_2 g_118_low60_40_low20_1 f_118_low60_40_low20_1;
asr g_118_low60_40_low20_2 g_118_low60_40_low20_2 1;
add r_158_160 r_158_159 u_158_159;
asr r_158_160 r_158_160 1;
add s_158_160 s_158_159 v_158_159;
asr s_158_160 s_158_160 1;
assert
    true
&&
    f_118_low60_40_low20_2 = f_118_low60_40_low20_1,
    u_158_160 = u_158_159,
    v_158_160 = v_158_159,
    g_118_low60_40_low20_2 * (const 64 2) = g_118_low60_40_low20_1 + f_118_low60_40_low20_1,
    r_158_160 * (const 64 2) = r_158_159 + u_158_159,
    s_158_160 * (const 64 2) = s_158_159 + v_158_159
;

assume
    f_118_low60_40_low20_2 = f_118_low60_40_low20_1,
    u_158_160 = u_158_159,
    v_158_160 = v_158_159,
    g_118_low60_40_low20_2 * 2 = g_118_low60_40_low20_1 + f_118_low60_40_low20_1,
    r_158_160 * 2 = r_158_159 + u_158_159,
    s_158_160 * 2 = s_158_159 + v_158_159
&&
    true
;

{
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_2 + u_158_160 * (const 64 (2**21)) + v_158_160 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_2 + r_158_160 * (const 64 (2**21)) + s_158_160 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_2,
    f_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_2,
    g_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 160)) <=s delta, delta <=s (const 64 (1 + 2*160)),
    (const 64 (-(2**20))) <=s u_158_160, u_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_160, v_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_160, r_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_160, s_158_160 <=s (const 64 ((2**20))),
    u_158_160 + v_158_160 <=s (const 64 (2**20)),
    u_158_160 - v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 + v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 - v_158_160 <=s (const 64 (2**20)),
    r_158_160 + s_158_160 <=s (const 64 (2**20)),
    r_158_160 - s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 + s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 - s_158_160 <=s (const 64 (2**20)),
    u_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_158_160 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_159_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_1,
sint64 g_118_low60_40_low20_1,
sint64 f_118_low60_40_low20_2,
sint64 g_118_low60_40_low20_2,
sint64 u_158_159,
sint64 v_158_159,
sint64 r_158_159,
sint64 s_158_159,
sint64 u_158_160,
sint64 v_158_160,
sint64 r_158_160,
sint64 s_158_160,
bit ne
)={
    u_158_159 * f_118_low60_40_low20_0 + v_158_159 * g_118_low60_40_low20_0 = f_118_low60_40_low20_1 * (-(2**20)),
    r_158_159 * f_118_low60_40_low20_0 + s_158_159 * g_118_low60_40_low20_0 = g_118_low60_40_low20_1 * (-(2**20))
&&
    u_158_159 * f_118_low60_40_low20_0 + v_158_159 * g_118_low60_40_low20_0 = f_118_low60_40_low20_1 * (const 64 (-(2**20))),
    r_158_159 * f_118_low60_40_low20_0 + s_158_159 * g_118_low60_40_low20_0 = g_118_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_1 + u_158_159 * (const 64 (2**21)) + v_158_159 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_1 + r_158_159 * (const 64 (2**21)) + s_158_159 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_1,
    f_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_1,
    g_118_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 159)) <=s delta, delta <=s (const 64 (1 + 2*159)),
    (const 64 (-(2**20))) <=s u_158_159, u_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_159, v_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_159, r_158_159 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_159, s_158_159 <=s (const 64 ((2**20))),
    u_158_159 + v_158_159 <=s (const 64 (2**20)),
    u_158_159 - v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 + v_158_159 <=s (const 64 (2**20)),
    (const 64 0) - u_158_159 - v_158_159 <=s (const 64 (2**20)),
    r_158_159 + s_158_159 <=s (const 64 (2**20)),
    r_158_159 - s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 + s_158_159 <=s (const 64 (2**20)),
    (const 64 0) - r_158_159 - s_158_159 <=s (const 64 (2**20)),
    u_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_158_159 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_158_159 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise c
assume
g_118_low60_40_low20_1 = 1 (mod 2)
&&
g_118_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_2 g_118_low60_40_low20_1;
mov u_158_160 r_158_159;
mov v_158_160 s_158_159;

subs dc g_118_low60_40_low20_2 g_118_low60_40_low20_1 f_118_low60_40_low20_1;
asr g_118_low60_40_low20_2 g_118_low60_40_low20_2 1;
subs dc r_158_160 r_158_159 u_158_159;
asr r_158_160 r_158_160 1;
subs dc s_158_160 s_158_159 v_158_159;
asr s_158_160 s_158_160 1;
assert
    true
&&
    f_118_low60_40_low20_2 = g_118_low60_40_low20_1,
    u_158_160 = r_158_159,
    v_158_160 = s_158_159,
    g_118_low60_40_low20_2 * (const 64 2) = g_118_low60_40_low20_1 - f_118_low60_40_low20_1,
    r_158_160 * (const 64 2) = r_158_159 - u_158_159,
    s_158_160 * (const 64 2) = s_158_159 - v_158_159
;

assume
    f_118_low60_40_low20_2 = g_118_low60_40_low20_1,
    u_158_160 = r_158_159,
    v_158_160 = s_158_159,
    g_118_low60_40_low20_2 * 2 = g_118_low60_40_low20_1 - f_118_low60_40_low20_1,
    r_158_160 * 2 = r_158_159 - u_158_159,
    s_158_160 * 2 = s_158_159 - v_158_159
&&
    true
;

{
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_2 + u_158_160 * (const 64 (2**21)) + v_158_160 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_2 + r_158_160 * (const 64 (2**21)) + s_158_160 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_2,
    f_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_2,
    g_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 160)) <=s delta, delta <=s (const 64 (1 + 2*160)),
    (const 64 (-(2**20))) <=s u_158_160, u_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_160, v_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_160, r_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_160, s_158_160 <=s (const 64 ((2**20))),
    u_158_160 + v_158_160 <=s (const 64 (2**20)),
    u_158_160 - v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 + v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 - v_158_160 <=s (const 64 (2**20)),
    r_158_160 + s_158_160 <=s (const 64 (2**20)),
    r_158_160 - s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 + s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 - s_158_160 <=s (const 64 (2**20)),
    u_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_158_160 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_160_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_2,
sint64 g_118_low60_40_low20_2,
sint64 f_118_low60_40_low20_3,
sint64 g_118_low60_40_low20_3,
sint64 u_158_160,
sint64 v_158_160,
sint64 r_158_160,
sint64 s_158_160,
sint64 u_158_161,
sint64 v_158_161,
sint64 r_158_161,
sint64 s_158_161,
bit ne
)={
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (-(2**20)),
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (-(2**20))
&&
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (const 64 (-(2**20))),
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_2 + u_158_160 * (const 64 (2**21)) + v_158_160 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_2 + r_158_160 * (const 64 (2**21)) + s_158_160 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_2,
    f_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_2,
    g_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 160)) <=s delta, delta <=s (const 64 (1 + 2*160)),
    (const 64 (-(2**20))) <=s u_158_160, u_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_160, v_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_160, r_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_160, s_158_160 <=s (const 64 ((2**20))),
    u_158_160 + v_158_160 <=s (const 64 (2**20)),
    u_158_160 - v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 + v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 - v_158_160 <=s (const 64 (2**20)),
    r_158_160 + s_158_160 <=s (const 64 (2**20)),
    r_158_160 - s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 + s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 - s_158_160 <=s (const 64 (2**20)),
    u_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_158_160 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise a
assume
g_118_low60_40_low20_2 = 0 (mod 2)
&&
g_118_low60_40_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_3 f_118_low60_40_low20_2;
mov u_158_161 u_158_160;
mov v_158_161 v_158_160;

asr g_118_low60_40_low20_3 g_118_low60_40_low20_2 1;
asr r_158_161 r_158_160 1;
asr s_158_161 s_158_160 1;
assert
    true
&&
    f_118_low60_40_low20_3 = f_118_low60_40_low20_2,
    u_158_161 = u_158_160,
    v_158_161 = v_158_160,
    g_118_low60_40_low20_3 * (const 64 2) = g_118_low60_40_low20_2,
    r_158_161 * (const 64 2) = r_158_160,
    s_158_161 * (const 64 2) = s_158_160
;

assume
    f_118_low60_40_low20_3 = f_118_low60_40_low20_2,
    u_158_161 = u_158_160,
    v_158_161 = v_158_160,
    g_118_low60_40_low20_3 * 2 = g_118_low60_40_low20_2,
    r_158_161 * 2 = r_158_160,
    s_158_161 * 2 = s_158_160
&&
    true
;

{
    u_158_161 * f_118_low60_40_low20_0 + v_158_161 * g_118_low60_40_low20_0 = f_118_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_161 * f_118_low60_40_low20_0 + s_158_161 * g_118_low60_40_low20_0 = g_118_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_3 + u_158_161 * (const 64 (2**21)) + v_158_161 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_3 + r_158_161 * (const 64 (2**21)) + s_158_161 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_3,
    f_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_3,
    g_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 161)) <=s delta, delta <=s (const 64 (1 + 2*161)),
    (const 64 (-(2**20))) <=s u_158_161, u_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_161, v_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_161, r_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_161, s_158_161 <=s (const 64 ((2**20))),
    u_158_161 + v_158_161 <=s (const 64 (2**20)),
    u_158_161 - v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 + v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 - v_158_161 <=s (const 64 (2**20)),
    r_158_161 + s_158_161 <=s (const 64 (2**20)),
    r_158_161 - s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 + s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 - s_158_161 <=s (const 64 (2**20)),
    u_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_158_161 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_160_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_2,
sint64 g_118_low60_40_low20_2,
sint64 f_118_low60_40_low20_3,
sint64 g_118_low60_40_low20_3,
sint64 u_158_160,
sint64 v_158_160,
sint64 r_158_160,
sint64 s_158_160,
sint64 u_158_161,
sint64 v_158_161,
sint64 r_158_161,
sint64 s_158_161,
bit ne
)={
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (-(2**20)),
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (-(2**20))
&&
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (const 64 (-(2**20))),
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_2 + u_158_160 * (const 64 (2**21)) + v_158_160 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_2 + r_158_160 * (const 64 (2**21)) + s_158_160 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_2,
    f_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_2,
    g_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 160)) <=s delta, delta <=s (const 64 (1 + 2*160)),
    (const 64 (-(2**20))) <=s u_158_160, u_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_160, v_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_160, r_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_160, s_158_160 <=s (const 64 ((2**20))),
    u_158_160 + v_158_160 <=s (const 64 (2**20)),
    u_158_160 - v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 + v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 - v_158_160 <=s (const 64 (2**20)),
    r_158_160 + s_158_160 <=s (const 64 (2**20)),
    r_158_160 - s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 + s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 - s_158_160 <=s (const 64 (2**20)),
    u_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_158_160 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise b
assume
g_118_low60_40_low20_2 = 1 (mod 2)
&&
g_118_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_3 f_118_low60_40_low20_2;
mov u_158_161 u_158_160;
mov v_158_161 v_158_160;

add g_118_low60_40_low20_3 g_118_low60_40_low20_2 f_118_low60_40_low20_2;
asr g_118_low60_40_low20_3 g_118_low60_40_low20_3 1;
add r_158_161 r_158_160 u_158_160;
asr r_158_161 r_158_161 1;
add s_158_161 s_158_160 v_158_160;
asr s_158_161 s_158_161 1;
assert
    true
&&
    f_118_low60_40_low20_3 = f_118_low60_40_low20_2,
    u_158_161 = u_158_160,
    v_158_161 = v_158_160,
    g_118_low60_40_low20_3 * (const 64 2) = g_118_low60_40_low20_2 + f_118_low60_40_low20_2,
    r_158_161 * (const 64 2) = r_158_160 + u_158_160,
    s_158_161 * (const 64 2) = s_158_160 + v_158_160
;

assume
    f_118_low60_40_low20_3 = f_118_low60_40_low20_2,
    u_158_161 = u_158_160,
    v_158_161 = v_158_160,
    g_118_low60_40_low20_3 * 2 = g_118_low60_40_low20_2 + f_118_low60_40_low20_2,
    r_158_161 * 2 = r_158_160 + u_158_160,
    s_158_161 * 2 = s_158_160 + v_158_160
&&
    true
;

{
    u_158_161 * f_118_low60_40_low20_0 + v_158_161 * g_118_low60_40_low20_0 = f_118_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_161 * f_118_low60_40_low20_0 + s_158_161 * g_118_low60_40_low20_0 = g_118_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_3 + u_158_161 * (const 64 (2**21)) + v_158_161 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_3 + r_158_161 * (const 64 (2**21)) + s_158_161 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_3,
    f_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_3,
    g_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 161)) <=s delta, delta <=s (const 64 (1 + 2*161)),
    (const 64 (-(2**20))) <=s u_158_161, u_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_161, v_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_161, r_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_161, s_158_161 <=s (const 64 ((2**20))),
    u_158_161 + v_158_161 <=s (const 64 (2**20)),
    u_158_161 - v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 + v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 - v_158_161 <=s (const 64 (2**20)),
    r_158_161 + s_158_161 <=s (const 64 (2**20)),
    r_158_161 - s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 + s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 - s_158_161 <=s (const 64 (2**20)),
    u_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_158_161 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_160_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_2,
sint64 g_118_low60_40_low20_2,
sint64 f_118_low60_40_low20_3,
sint64 g_118_low60_40_low20_3,
sint64 u_158_160,
sint64 v_158_160,
sint64 r_158_160,
sint64 s_158_160,
sint64 u_158_161,
sint64 v_158_161,
sint64 r_158_161,
sint64 s_158_161,
bit ne
)={
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (-(2**20)),
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (-(2**20))
&&
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (const 64 (-(2**20))),
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_2 + u_158_160 * (const 64 (2**21)) + v_158_160 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_2 + r_158_160 * (const 64 (2**21)) + s_158_160 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_2,
    f_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_2,
    g_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 160)) <=s delta, delta <=s (const 64 (1 + 2*160)),
    (const 64 (-(2**20))) <=s u_158_160, u_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_160, v_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_160, r_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_160, s_158_160 <=s (const 64 ((2**20))),
    u_158_160 + v_158_160 <=s (const 64 (2**20)),
    u_158_160 - v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 + v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 - v_158_160 <=s (const 64 (2**20)),
    r_158_160 + s_158_160 <=s (const 64 (2**20)),
    r_158_160 - s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 + s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 - s_158_160 <=s (const 64 (2**20)),
    u_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_158_160 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise c
assume
g_118_low60_40_low20_2 = 1 (mod 2)
&&
g_118_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_3 g_118_low60_40_low20_2;
mov u_158_161 r_158_160;
mov v_158_161 s_158_160;

subs dc g_118_low60_40_low20_3 g_118_low60_40_low20_2 f_118_low60_40_low20_2;
asr g_118_low60_40_low20_3 g_118_low60_40_low20_3 1;
subs dc r_158_161 r_158_160 u_158_160;
asr r_158_161 r_158_161 1;
subs dc s_158_161 s_158_160 v_158_160;
asr s_158_161 s_158_161 1;
assert
    true
&&
    f_118_low60_40_low20_3 = g_118_low60_40_low20_2,
    u_158_161 = r_158_160,
    v_158_161 = s_158_160,
    g_118_low60_40_low20_3 * (const 64 2) = g_118_low60_40_low20_2 - f_118_low60_40_low20_2,
    r_158_161 * (const 64 2) = r_158_160 - u_158_160,
    s_158_161 * (const 64 2) = s_158_160 - v_158_160
;

assume
    f_118_low60_40_low20_3 = g_118_low60_40_low20_2,
    u_158_161 = r_158_160,
    v_158_161 = s_158_160,
    g_118_low60_40_low20_3 * 2 = g_118_low60_40_low20_2 - f_118_low60_40_low20_2,
    r_158_161 * 2 = r_158_160 - u_158_160,
    s_158_161 * 2 = s_158_160 - v_158_160
&&
    true
;

{
    u_158_161 * f_118_low60_40_low20_0 + v_158_161 * g_118_low60_40_low20_0 = f_118_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_161 * f_118_low60_40_low20_0 + s_158_161 * g_118_low60_40_low20_0 = g_118_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_3 + u_158_161 * (const 64 (2**21)) + v_158_161 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_3 + r_158_161 * (const 64 (2**21)) + s_158_161 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_3,
    f_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_3,
    g_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 161)) <=s delta, delta <=s (const 64 (1 + 2*161)),
    (const 64 (-(2**20))) <=s u_158_161, u_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_161, v_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_161, r_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_161, s_158_161 <=s (const 64 ((2**20))),
    u_158_161 + v_158_161 <=s (const 64 (2**20)),
    u_158_161 - v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 + v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 - v_158_161 <=s (const 64 (2**20)),
    r_158_161 + s_158_161 <=s (const 64 (2**20)),
    r_158_161 - s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 + s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 - s_158_161 <=s (const 64 (2**20)),
    u_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_158_161 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_161_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_3,
sint64 g_118_low60_40_low20_3,
sint64 f_118_low60_40_low20_4,
sint64 g_118_low60_40_low20_4,
sint64 u_158_161,
sint64 v_158_161,
sint64 r_158_161,
sint64 s_158_161,
sint64 u_158_162,
sint64 v_158_162,
sint64 r_158_162,
sint64 s_158_162,
bit ne
)={
    u_158_161 * f_118_low60_40_low20_0 + v_158_161 * g_118_low60_40_low20_0 = f_118_low60_40_low20_3 * (-(2**20)),
    r_158_161 * f_118_low60_40_low20_0 + s_158_161 * g_118_low60_40_low20_0 = g_118_low60_40_low20_3 * (-(2**20))
&&
    u_158_161 * f_118_low60_40_low20_0 + v_158_161 * g_118_low60_40_low20_0 = f_118_low60_40_low20_3 * (const 64 (-(2**20))),
    r_158_161 * f_118_low60_40_low20_0 + s_158_161 * g_118_low60_40_low20_0 = g_118_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_3 + u_158_161 * (const 64 (2**21)) + v_158_161 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_3 + r_158_161 * (const 64 (2**21)) + s_158_161 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_3,
    f_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_3,
    g_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 161)) <=s delta, delta <=s (const 64 (1 + 2*161)),
    (const 64 (-(2**20))) <=s u_158_161, u_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_161, v_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_161, r_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_161, s_158_161 <=s (const 64 ((2**20))),
    u_158_161 + v_158_161 <=s (const 64 (2**20)),
    u_158_161 - v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 + v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 - v_158_161 <=s (const 64 (2**20)),
    r_158_161 + s_158_161 <=s (const 64 (2**20)),
    r_158_161 - s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 + s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 - s_158_161 <=s (const 64 (2**20)),
    u_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_158_161 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise a
assume
g_118_low60_40_low20_3 = 0 (mod 2)
&&
g_118_low60_40_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_4 f_118_low60_40_low20_3;
mov u_158_162 u_158_161;
mov v_158_162 v_158_161;

asr g_118_low60_40_low20_4 g_118_low60_40_low20_3 1;
asr r_158_162 r_158_161 1;
asr s_158_162 s_158_161 1;
assert
    true
&&
    f_118_low60_40_low20_4 = f_118_low60_40_low20_3,
    u_158_162 = u_158_161,
    v_158_162 = v_158_161,
    g_118_low60_40_low20_4 * (const 64 2) = g_118_low60_40_low20_3,
    r_158_162 * (const 64 2) = r_158_161,
    s_158_162 * (const 64 2) = s_158_161
;

assume
    f_118_low60_40_low20_4 = f_118_low60_40_low20_3,
    u_158_162 = u_158_161,
    v_158_162 = v_158_161,
    g_118_low60_40_low20_4 * 2 = g_118_low60_40_low20_3,
    r_158_162 * 2 = r_158_161,
    s_158_162 * 2 = s_158_161
&&
    true
;

{
    u_158_162 * f_118_low60_40_low20_0 + v_158_162 * g_118_low60_40_low20_0 = f_118_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_162 * f_118_low60_40_low20_0 + s_158_162 * g_118_low60_40_low20_0 = g_118_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_4 + u_158_162 * (const 64 (2**21)) + v_158_162 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_4 + r_158_162 * (const 64 (2**21)) + s_158_162 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_4,
    f_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_4,
    g_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 162)) <=s delta, delta <=s (const 64 (1 + 2*162)),
    (const 64 (-(2**20))) <=s u_158_162, u_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_162, v_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_162, r_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_162, s_158_162 <=s (const 64 ((2**20))),
    u_158_162 + v_158_162 <=s (const 64 (2**20)),
    u_158_162 - v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 + v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 - v_158_162 <=s (const 64 (2**20)),
    r_158_162 + s_158_162 <=s (const 64 (2**20)),
    r_158_162 - s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 + s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 - s_158_162 <=s (const 64 (2**20)),
    u_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_158_162 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_161_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_3,
sint64 g_118_low60_40_low20_3,
sint64 f_118_low60_40_low20_4,
sint64 g_118_low60_40_low20_4,
sint64 u_158_161,
sint64 v_158_161,
sint64 r_158_161,
sint64 s_158_161,
sint64 u_158_162,
sint64 v_158_162,
sint64 r_158_162,
sint64 s_158_162,
bit ne
)={
    u_158_161 * f_118_low60_40_low20_0 + v_158_161 * g_118_low60_40_low20_0 = f_118_low60_40_low20_3 * (-(2**20)),
    r_158_161 * f_118_low60_40_low20_0 + s_158_161 * g_118_low60_40_low20_0 = g_118_low60_40_low20_3 * (-(2**20))
&&
    u_158_161 * f_118_low60_40_low20_0 + v_158_161 * g_118_low60_40_low20_0 = f_118_low60_40_low20_3 * (const 64 (-(2**20))),
    r_158_161 * f_118_low60_40_low20_0 + s_158_161 * g_118_low60_40_low20_0 = g_118_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_3 + u_158_161 * (const 64 (2**21)) + v_158_161 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_3 + r_158_161 * (const 64 (2**21)) + s_158_161 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_3,
    f_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_3,
    g_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 161)) <=s delta, delta <=s (const 64 (1 + 2*161)),
    (const 64 (-(2**20))) <=s u_158_161, u_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_161, v_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_161, r_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_161, s_158_161 <=s (const 64 ((2**20))),
    u_158_161 + v_158_161 <=s (const 64 (2**20)),
    u_158_161 - v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 + v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 - v_158_161 <=s (const 64 (2**20)),
    r_158_161 + s_158_161 <=s (const 64 (2**20)),
    r_158_161 - s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 + s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 - s_158_161 <=s (const 64 (2**20)),
    u_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_158_161 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise b
assume
g_118_low60_40_low20_3 = 1 (mod 2)
&&
g_118_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_4 f_118_low60_40_low20_3;
mov u_158_162 u_158_161;
mov v_158_162 v_158_161;

add g_118_low60_40_low20_4 g_118_low60_40_low20_3 f_118_low60_40_low20_3;
asr g_118_low60_40_low20_4 g_118_low60_40_low20_4 1;
add r_158_162 r_158_161 u_158_161;
asr r_158_162 r_158_162 1;
add s_158_162 s_158_161 v_158_161;
asr s_158_162 s_158_162 1;
assert
    true
&&
    f_118_low60_40_low20_4 = f_118_low60_40_low20_3,
    u_158_162 = u_158_161,
    v_158_162 = v_158_161,
    g_118_low60_40_low20_4 * (const 64 2) = g_118_low60_40_low20_3 + f_118_low60_40_low20_3,
    r_158_162 * (const 64 2) = r_158_161 + u_158_161,
    s_158_162 * (const 64 2) = s_158_161 + v_158_161
;

assume
    f_118_low60_40_low20_4 = f_118_low60_40_low20_3,
    u_158_162 = u_158_161,
    v_158_162 = v_158_161,
    g_118_low60_40_low20_4 * 2 = g_118_low60_40_low20_3 + f_118_low60_40_low20_3,
    r_158_162 * 2 = r_158_161 + u_158_161,
    s_158_162 * 2 = s_158_161 + v_158_161
&&
    true
;

{
    u_158_162 * f_118_low60_40_low20_0 + v_158_162 * g_118_low60_40_low20_0 = f_118_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_162 * f_118_low60_40_low20_0 + s_158_162 * g_118_low60_40_low20_0 = g_118_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_4 + u_158_162 * (const 64 (2**21)) + v_158_162 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_4 + r_158_162 * (const 64 (2**21)) + s_158_162 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_4,
    f_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_4,
    g_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 162)) <=s delta, delta <=s (const 64 (1 + 2*162)),
    (const 64 (-(2**20))) <=s u_158_162, u_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_162, v_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_162, r_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_162, s_158_162 <=s (const 64 ((2**20))),
    u_158_162 + v_158_162 <=s (const 64 (2**20)),
    u_158_162 - v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 + v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 - v_158_162 <=s (const 64 (2**20)),
    r_158_162 + s_158_162 <=s (const 64 (2**20)),
    r_158_162 - s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 + s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 - s_158_162 <=s (const 64 (2**20)),
    u_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_158_162 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_161_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_3,
sint64 g_118_low60_40_low20_3,
sint64 f_118_low60_40_low20_4,
sint64 g_118_low60_40_low20_4,
sint64 u_158_161,
sint64 v_158_161,
sint64 r_158_161,
sint64 s_158_161,
sint64 u_158_162,
sint64 v_158_162,
sint64 r_158_162,
sint64 s_158_162,
bit ne
)={
    u_158_161 * f_118_low60_40_low20_0 + v_158_161 * g_118_low60_40_low20_0 = f_118_low60_40_low20_3 * (-(2**20)),
    r_158_161 * f_118_low60_40_low20_0 + s_158_161 * g_118_low60_40_low20_0 = g_118_low60_40_low20_3 * (-(2**20))
&&
    u_158_161 * f_118_low60_40_low20_0 + v_158_161 * g_118_low60_40_low20_0 = f_118_low60_40_low20_3 * (const 64 (-(2**20))),
    r_158_161 * f_118_low60_40_low20_0 + s_158_161 * g_118_low60_40_low20_0 = g_118_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_3 + u_158_161 * (const 64 (2**21)) + v_158_161 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_3 + r_158_161 * (const 64 (2**21)) + s_158_161 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_3,
    f_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_3,
    g_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 161)) <=s delta, delta <=s (const 64 (1 + 2*161)),
    (const 64 (-(2**20))) <=s u_158_161, u_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_161, v_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_161, r_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_161, s_158_161 <=s (const 64 ((2**20))),
    u_158_161 + v_158_161 <=s (const 64 (2**20)),
    u_158_161 - v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 + v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 - v_158_161 <=s (const 64 (2**20)),
    r_158_161 + s_158_161 <=s (const 64 (2**20)),
    r_158_161 - s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 + s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 - s_158_161 <=s (const 64 (2**20)),
    u_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_158_161 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise c
assume
g_118_low60_40_low20_3 = 1 (mod 2)
&&
g_118_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_4 g_118_low60_40_low20_3;
mov u_158_162 r_158_161;
mov v_158_162 s_158_161;

subs dc g_118_low60_40_low20_4 g_118_low60_40_low20_3 f_118_low60_40_low20_3;
asr g_118_low60_40_low20_4 g_118_low60_40_low20_4 1;
subs dc r_158_162 r_158_161 u_158_161;
asr r_158_162 r_158_162 1;
subs dc s_158_162 s_158_161 v_158_161;
asr s_158_162 s_158_162 1;
assert
    true
&&
    f_118_low60_40_low20_4 = g_118_low60_40_low20_3,
    u_158_162 = r_158_161,
    v_158_162 = s_158_161,
    g_118_low60_40_low20_4 * (const 64 2) = g_118_low60_40_low20_3 - f_118_low60_40_low20_3,
    r_158_162 * (const 64 2) = r_158_161 - u_158_161,
    s_158_162 * (const 64 2) = s_158_161 - v_158_161
;

assume
    f_118_low60_40_low20_4 = g_118_low60_40_low20_3,
    u_158_162 = r_158_161,
    v_158_162 = s_158_161,
    g_118_low60_40_low20_4 * 2 = g_118_low60_40_low20_3 - f_118_low60_40_low20_3,
    r_158_162 * 2 = r_158_161 - u_158_161,
    s_158_162 * 2 = s_158_161 - v_158_161
&&
    true
;

{
    u_158_162 * f_118_low60_40_low20_0 + v_158_162 * g_118_low60_40_low20_0 = f_118_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_162 * f_118_low60_40_low20_0 + s_158_162 * g_118_low60_40_low20_0 = g_118_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_4 + u_158_162 * (const 64 (2**21)) + v_158_162 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_4 + r_158_162 * (const 64 (2**21)) + s_158_162 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_4,
    f_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_4,
    g_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 162)) <=s delta, delta <=s (const 64 (1 + 2*162)),
    (const 64 (-(2**20))) <=s u_158_162, u_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_162, v_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_162, r_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_162, s_158_162 <=s (const 64 ((2**20))),
    u_158_162 + v_158_162 <=s (const 64 (2**20)),
    u_158_162 - v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 + v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 - v_158_162 <=s (const 64 (2**20)),
    r_158_162 + s_158_162 <=s (const 64 (2**20)),
    r_158_162 - s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 + s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 - s_158_162 <=s (const 64 (2**20)),
    u_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_158_162 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_162_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_4,
sint64 g_118_low60_40_low20_4,
sint64 f_118_low60_40_low20_5,
sint64 g_118_low60_40_low20_5,
sint64 u_158_162,
sint64 v_158_162,
sint64 r_158_162,
sint64 s_158_162,
sint64 u_158_163,
sint64 v_158_163,
sint64 r_158_163,
sint64 s_158_163,
bit ne
)={
    u_158_162 * f_118_low60_40_low20_0 + v_158_162 * g_118_low60_40_low20_0 = f_118_low60_40_low20_4 * (-(2**20)),
    r_158_162 * f_118_low60_40_low20_0 + s_158_162 * g_118_low60_40_low20_0 = g_118_low60_40_low20_4 * (-(2**20))
&&
    u_158_162 * f_118_low60_40_low20_0 + v_158_162 * g_118_low60_40_low20_0 = f_118_low60_40_low20_4 * (const 64 (-(2**20))),
    r_158_162 * f_118_low60_40_low20_0 + s_158_162 * g_118_low60_40_low20_0 = g_118_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_4 + u_158_162 * (const 64 (2**21)) + v_158_162 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_4 + r_158_162 * (const 64 (2**21)) + s_158_162 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_4,
    f_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_4,
    g_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 162)) <=s delta, delta <=s (const 64 (1 + 2*162)),
    (const 64 (-(2**20))) <=s u_158_162, u_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_162, v_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_162, r_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_162, s_158_162 <=s (const 64 ((2**20))),
    u_158_162 + v_158_162 <=s (const 64 (2**20)),
    u_158_162 - v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 + v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 - v_158_162 <=s (const 64 (2**20)),
    r_158_162 + s_158_162 <=s (const 64 (2**20)),
    r_158_162 - s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 + s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 - s_158_162 <=s (const 64 (2**20)),
    u_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_158_162 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise a
assume
g_118_low60_40_low20_4 = 0 (mod 2)
&&
g_118_low60_40_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_5 f_118_low60_40_low20_4;
mov u_158_163 u_158_162;
mov v_158_163 v_158_162;

asr g_118_low60_40_low20_5 g_118_low60_40_low20_4 1;
asr r_158_163 r_158_162 1;
asr s_158_163 s_158_162 1;
assert
    true
&&
    f_118_low60_40_low20_5 = f_118_low60_40_low20_4,
    u_158_163 = u_158_162,
    v_158_163 = v_158_162,
    g_118_low60_40_low20_5 * (const 64 2) = g_118_low60_40_low20_4,
    r_158_163 * (const 64 2) = r_158_162,
    s_158_163 * (const 64 2) = s_158_162
;

assume
    f_118_low60_40_low20_5 = f_118_low60_40_low20_4,
    u_158_163 = u_158_162,
    v_158_163 = v_158_162,
    g_118_low60_40_low20_5 * 2 = g_118_low60_40_low20_4,
    r_158_163 * 2 = r_158_162,
    s_158_163 * 2 = s_158_162
&&
    true
;

{
    u_158_163 * f_118_low60_40_low20_0 + v_158_163 * g_118_low60_40_low20_0 = f_118_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_163 * f_118_low60_40_low20_0 + s_158_163 * g_118_low60_40_low20_0 = g_118_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_5 + u_158_163 * (const 64 (2**21)) + v_158_163 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_5 + r_158_163 * (const 64 (2**21)) + s_158_163 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_5,
    f_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_5,
    g_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 163)) <=s delta, delta <=s (const 64 (1 + 2*163)),
    (const 64 (-(2**20))) <=s u_158_163, u_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_163, v_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_163, r_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_163, s_158_163 <=s (const 64 ((2**20))),
    u_158_163 + v_158_163 <=s (const 64 (2**20)),
    u_158_163 - v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 + v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 - v_158_163 <=s (const 64 (2**20)),
    r_158_163 + s_158_163 <=s (const 64 (2**20)),
    r_158_163 - s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 + s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 - s_158_163 <=s (const 64 (2**20)),
    u_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_158_163 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_162_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_4,
sint64 g_118_low60_40_low20_4,
sint64 f_118_low60_40_low20_5,
sint64 g_118_low60_40_low20_5,
sint64 u_158_162,
sint64 v_158_162,
sint64 r_158_162,
sint64 s_158_162,
sint64 u_158_163,
sint64 v_158_163,
sint64 r_158_163,
sint64 s_158_163,
bit ne
)={
    u_158_162 * f_118_low60_40_low20_0 + v_158_162 * g_118_low60_40_low20_0 = f_118_low60_40_low20_4 * (-(2**20)),
    r_158_162 * f_118_low60_40_low20_0 + s_158_162 * g_118_low60_40_low20_0 = g_118_low60_40_low20_4 * (-(2**20))
&&
    u_158_162 * f_118_low60_40_low20_0 + v_158_162 * g_118_low60_40_low20_0 = f_118_low60_40_low20_4 * (const 64 (-(2**20))),
    r_158_162 * f_118_low60_40_low20_0 + s_158_162 * g_118_low60_40_low20_0 = g_118_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_4 + u_158_162 * (const 64 (2**21)) + v_158_162 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_4 + r_158_162 * (const 64 (2**21)) + s_158_162 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_4,
    f_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_4,
    g_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 162)) <=s delta, delta <=s (const 64 (1 + 2*162)),
    (const 64 (-(2**20))) <=s u_158_162, u_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_162, v_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_162, r_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_162, s_158_162 <=s (const 64 ((2**20))),
    u_158_162 + v_158_162 <=s (const 64 (2**20)),
    u_158_162 - v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 + v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 - v_158_162 <=s (const 64 (2**20)),
    r_158_162 + s_158_162 <=s (const 64 (2**20)),
    r_158_162 - s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 + s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 - s_158_162 <=s (const 64 (2**20)),
    u_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_158_162 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise b
assume
g_118_low60_40_low20_4 = 1 (mod 2)
&&
g_118_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_5 f_118_low60_40_low20_4;
mov u_158_163 u_158_162;
mov v_158_163 v_158_162;

add g_118_low60_40_low20_5 g_118_low60_40_low20_4 f_118_low60_40_low20_4;
asr g_118_low60_40_low20_5 g_118_low60_40_low20_5 1;
add r_158_163 r_158_162 u_158_162;
asr r_158_163 r_158_163 1;
add s_158_163 s_158_162 v_158_162;
asr s_158_163 s_158_163 1;
assert
    true
&&
    f_118_low60_40_low20_5 = f_118_low60_40_low20_4,
    u_158_163 = u_158_162,
    v_158_163 = v_158_162,
    g_118_low60_40_low20_5 * (const 64 2) = g_118_low60_40_low20_4 + f_118_low60_40_low20_4,
    r_158_163 * (const 64 2) = r_158_162 + u_158_162,
    s_158_163 * (const 64 2) = s_158_162 + v_158_162
;

assume
    f_118_low60_40_low20_5 = f_118_low60_40_low20_4,
    u_158_163 = u_158_162,
    v_158_163 = v_158_162,
    g_118_low60_40_low20_5 * 2 = g_118_low60_40_low20_4 + f_118_low60_40_low20_4,
    r_158_163 * 2 = r_158_162 + u_158_162,
    s_158_163 * 2 = s_158_162 + v_158_162
&&
    true
;

{
    u_158_163 * f_118_low60_40_low20_0 + v_158_163 * g_118_low60_40_low20_0 = f_118_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_163 * f_118_low60_40_low20_0 + s_158_163 * g_118_low60_40_low20_0 = g_118_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_5 + u_158_163 * (const 64 (2**21)) + v_158_163 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_5 + r_158_163 * (const 64 (2**21)) + s_158_163 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_5,
    f_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_5,
    g_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 163)) <=s delta, delta <=s (const 64 (1 + 2*163)),
    (const 64 (-(2**20))) <=s u_158_163, u_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_163, v_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_163, r_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_163, s_158_163 <=s (const 64 ((2**20))),
    u_158_163 + v_158_163 <=s (const 64 (2**20)),
    u_158_163 - v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 + v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 - v_158_163 <=s (const 64 (2**20)),
    r_158_163 + s_158_163 <=s (const 64 (2**20)),
    r_158_163 - s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 + s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 - s_158_163 <=s (const 64 (2**20)),
    u_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_158_163 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_162_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_4,
sint64 g_118_low60_40_low20_4,
sint64 f_118_low60_40_low20_5,
sint64 g_118_low60_40_low20_5,
sint64 u_158_162,
sint64 v_158_162,
sint64 r_158_162,
sint64 s_158_162,
sint64 u_158_163,
sint64 v_158_163,
sint64 r_158_163,
sint64 s_158_163,
bit ne
)={
    u_158_162 * f_118_low60_40_low20_0 + v_158_162 * g_118_low60_40_low20_0 = f_118_low60_40_low20_4 * (-(2**20)),
    r_158_162 * f_118_low60_40_low20_0 + s_158_162 * g_118_low60_40_low20_0 = g_118_low60_40_low20_4 * (-(2**20))
&&
    u_158_162 * f_118_low60_40_low20_0 + v_158_162 * g_118_low60_40_low20_0 = f_118_low60_40_low20_4 * (const 64 (-(2**20))),
    r_158_162 * f_118_low60_40_low20_0 + s_158_162 * g_118_low60_40_low20_0 = g_118_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_4 + u_158_162 * (const 64 (2**21)) + v_158_162 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_4 + r_158_162 * (const 64 (2**21)) + s_158_162 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_4,
    f_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_4,
    g_118_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 162)) <=s delta, delta <=s (const 64 (1 + 2*162)),
    (const 64 (-(2**20))) <=s u_158_162, u_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_162, v_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_162, r_158_162 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_162, s_158_162 <=s (const 64 ((2**20))),
    u_158_162 + v_158_162 <=s (const 64 (2**20)),
    u_158_162 - v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 + v_158_162 <=s (const 64 (2**20)),
    (const 64 0) - u_158_162 - v_158_162 <=s (const 64 (2**20)),
    r_158_162 + s_158_162 <=s (const 64 (2**20)),
    r_158_162 - s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 + s_158_162 <=s (const 64 (2**20)),
    (const 64 0) - r_158_162 - s_158_162 <=s (const 64 (2**20)),
    u_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_158_162 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_158_162 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise c
assume
g_118_low60_40_low20_4 = 1 (mod 2)
&&
g_118_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_5 g_118_low60_40_low20_4;
mov u_158_163 r_158_162;
mov v_158_163 s_158_162;

subs dc g_118_low60_40_low20_5 g_118_low60_40_low20_4 f_118_low60_40_low20_4;
asr g_118_low60_40_low20_5 g_118_low60_40_low20_5 1;
subs dc r_158_163 r_158_162 u_158_162;
asr r_158_163 r_158_163 1;
subs dc s_158_163 s_158_162 v_158_162;
asr s_158_163 s_158_163 1;
assert
    true
&&
    f_118_low60_40_low20_5 = g_118_low60_40_low20_4,
    u_158_163 = r_158_162,
    v_158_163 = s_158_162,
    g_118_low60_40_low20_5 * (const 64 2) = g_118_low60_40_low20_4 - f_118_low60_40_low20_4,
    r_158_163 * (const 64 2) = r_158_162 - u_158_162,
    s_158_163 * (const 64 2) = s_158_162 - v_158_162
;

assume
    f_118_low60_40_low20_5 = g_118_low60_40_low20_4,
    u_158_163 = r_158_162,
    v_158_163 = s_158_162,
    g_118_low60_40_low20_5 * 2 = g_118_low60_40_low20_4 - f_118_low60_40_low20_4,
    r_158_163 * 2 = r_158_162 - u_158_162,
    s_158_163 * 2 = s_158_162 - v_158_162
&&
    true
;

{
    u_158_163 * f_118_low60_40_low20_0 + v_158_163 * g_118_low60_40_low20_0 = f_118_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_163 * f_118_low60_40_low20_0 + s_158_163 * g_118_low60_40_low20_0 = g_118_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_5 + u_158_163 * (const 64 (2**21)) + v_158_163 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_5 + r_158_163 * (const 64 (2**21)) + s_158_163 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_5,
    f_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_5,
    g_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 163)) <=s delta, delta <=s (const 64 (1 + 2*163)),
    (const 64 (-(2**20))) <=s u_158_163, u_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_163, v_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_163, r_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_163, s_158_163 <=s (const 64 ((2**20))),
    u_158_163 + v_158_163 <=s (const 64 (2**20)),
    u_158_163 - v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 + v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 - v_158_163 <=s (const 64 (2**20)),
    r_158_163 + s_158_163 <=s (const 64 (2**20)),
    r_158_163 - s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 + s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 - s_158_163 <=s (const 64 (2**20)),
    u_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_158_163 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_163_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_5,
sint64 g_118_low60_40_low20_5,
sint64 f_118_low60_40_low20_6,
sint64 g_118_low60_40_low20_6,
sint64 u_158_163,
sint64 v_158_163,
sint64 r_158_163,
sint64 s_158_163,
sint64 u_158_164,
sint64 v_158_164,
sint64 r_158_164,
sint64 s_158_164,
bit ne
)={
    u_158_163 * f_118_low60_40_low20_0 + v_158_163 * g_118_low60_40_low20_0 = f_118_low60_40_low20_5 * (-(2**20)),
    r_158_163 * f_118_low60_40_low20_0 + s_158_163 * g_118_low60_40_low20_0 = g_118_low60_40_low20_5 * (-(2**20))
&&
    u_158_163 * f_118_low60_40_low20_0 + v_158_163 * g_118_low60_40_low20_0 = f_118_low60_40_low20_5 * (const 64 (-(2**20))),
    r_158_163 * f_118_low60_40_low20_0 + s_158_163 * g_118_low60_40_low20_0 = g_118_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_5 + u_158_163 * (const 64 (2**21)) + v_158_163 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_5 + r_158_163 * (const 64 (2**21)) + s_158_163 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_5,
    f_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_5,
    g_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 163)) <=s delta, delta <=s (const 64 (1 + 2*163)),
    (const 64 (-(2**20))) <=s u_158_163, u_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_163, v_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_163, r_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_163, s_158_163 <=s (const 64 ((2**20))),
    u_158_163 + v_158_163 <=s (const 64 (2**20)),
    u_158_163 - v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 + v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 - v_158_163 <=s (const 64 (2**20)),
    r_158_163 + s_158_163 <=s (const 64 (2**20)),
    r_158_163 - s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 + s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 - s_158_163 <=s (const 64 (2**20)),
    u_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_158_163 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise a
assume
g_118_low60_40_low20_5 = 0 (mod 2)
&&
g_118_low60_40_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_6 f_118_low60_40_low20_5;
mov u_158_164 u_158_163;
mov v_158_164 v_158_163;

asr g_118_low60_40_low20_6 g_118_low60_40_low20_5 1;
asr r_158_164 r_158_163 1;
asr s_158_164 s_158_163 1;
assert
    true
&&
    f_118_low60_40_low20_6 = f_118_low60_40_low20_5,
    u_158_164 = u_158_163,
    v_158_164 = v_158_163,
    g_118_low60_40_low20_6 * (const 64 2) = g_118_low60_40_low20_5,
    r_158_164 * (const 64 2) = r_158_163,
    s_158_164 * (const 64 2) = s_158_163
;

assume
    f_118_low60_40_low20_6 = f_118_low60_40_low20_5,
    u_158_164 = u_158_163,
    v_158_164 = v_158_163,
    g_118_low60_40_low20_6 * 2 = g_118_low60_40_low20_5,
    r_158_164 * 2 = r_158_163,
    s_158_164 * 2 = s_158_163
&&
    true
;

{
    u_158_164 * f_118_low60_40_low20_0 + v_158_164 * g_118_low60_40_low20_0 = f_118_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_164 * f_118_low60_40_low20_0 + s_158_164 * g_118_low60_40_low20_0 = g_118_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_6 + u_158_164 * (const 64 (2**21)) + v_158_164 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_6 + r_158_164 * (const 64 (2**21)) + s_158_164 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_6,
    f_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_6,
    g_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 164)) <=s delta, delta <=s (const 64 (1 + 2*164)),
    (const 64 (-(2**20))) <=s u_158_164, u_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_164, v_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_164, r_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_164, s_158_164 <=s (const 64 ((2**20))),
    u_158_164 + v_158_164 <=s (const 64 (2**20)),
    u_158_164 - v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 + v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 - v_158_164 <=s (const 64 (2**20)),
    r_158_164 + s_158_164 <=s (const 64 (2**20)),
    r_158_164 - s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 + s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 - s_158_164 <=s (const 64 (2**20)),
    u_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_158_164 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_163_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_5,
sint64 g_118_low60_40_low20_5,
sint64 f_118_low60_40_low20_6,
sint64 g_118_low60_40_low20_6,
sint64 u_158_163,
sint64 v_158_163,
sint64 r_158_163,
sint64 s_158_163,
sint64 u_158_164,
sint64 v_158_164,
sint64 r_158_164,
sint64 s_158_164,
bit ne
)={
    u_158_163 * f_118_low60_40_low20_0 + v_158_163 * g_118_low60_40_low20_0 = f_118_low60_40_low20_5 * (-(2**20)),
    r_158_163 * f_118_low60_40_low20_0 + s_158_163 * g_118_low60_40_low20_0 = g_118_low60_40_low20_5 * (-(2**20))
&&
    u_158_163 * f_118_low60_40_low20_0 + v_158_163 * g_118_low60_40_low20_0 = f_118_low60_40_low20_5 * (const 64 (-(2**20))),
    r_158_163 * f_118_low60_40_low20_0 + s_158_163 * g_118_low60_40_low20_0 = g_118_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_5 + u_158_163 * (const 64 (2**21)) + v_158_163 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_5 + r_158_163 * (const 64 (2**21)) + s_158_163 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_5,
    f_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_5,
    g_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 163)) <=s delta, delta <=s (const 64 (1 + 2*163)),
    (const 64 (-(2**20))) <=s u_158_163, u_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_163, v_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_163, r_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_163, s_158_163 <=s (const 64 ((2**20))),
    u_158_163 + v_158_163 <=s (const 64 (2**20)),
    u_158_163 - v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 + v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 - v_158_163 <=s (const 64 (2**20)),
    r_158_163 + s_158_163 <=s (const 64 (2**20)),
    r_158_163 - s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 + s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 - s_158_163 <=s (const 64 (2**20)),
    u_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_158_163 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise b
assume
g_118_low60_40_low20_5 = 1 (mod 2)
&&
g_118_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_6 f_118_low60_40_low20_5;
mov u_158_164 u_158_163;
mov v_158_164 v_158_163;

add g_118_low60_40_low20_6 g_118_low60_40_low20_5 f_118_low60_40_low20_5;
asr g_118_low60_40_low20_6 g_118_low60_40_low20_6 1;
add r_158_164 r_158_163 u_158_163;
asr r_158_164 r_158_164 1;
add s_158_164 s_158_163 v_158_163;
asr s_158_164 s_158_164 1;
assert
    true
&&
    f_118_low60_40_low20_6 = f_118_low60_40_low20_5,
    u_158_164 = u_158_163,
    v_158_164 = v_158_163,
    g_118_low60_40_low20_6 * (const 64 2) = g_118_low60_40_low20_5 + f_118_low60_40_low20_5,
    r_158_164 * (const 64 2) = r_158_163 + u_158_163,
    s_158_164 * (const 64 2) = s_158_163 + v_158_163
;

assume
    f_118_low60_40_low20_6 = f_118_low60_40_low20_5,
    u_158_164 = u_158_163,
    v_158_164 = v_158_163,
    g_118_low60_40_low20_6 * 2 = g_118_low60_40_low20_5 + f_118_low60_40_low20_5,
    r_158_164 * 2 = r_158_163 + u_158_163,
    s_158_164 * 2 = s_158_163 + v_158_163
&&
    true
;

{
    u_158_164 * f_118_low60_40_low20_0 + v_158_164 * g_118_low60_40_low20_0 = f_118_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_164 * f_118_low60_40_low20_0 + s_158_164 * g_118_low60_40_low20_0 = g_118_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_6 + u_158_164 * (const 64 (2**21)) + v_158_164 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_6 + r_158_164 * (const 64 (2**21)) + s_158_164 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_6,
    f_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_6,
    g_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 164)) <=s delta, delta <=s (const 64 (1 + 2*164)),
    (const 64 (-(2**20))) <=s u_158_164, u_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_164, v_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_164, r_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_164, s_158_164 <=s (const 64 ((2**20))),
    u_158_164 + v_158_164 <=s (const 64 (2**20)),
    u_158_164 - v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 + v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 - v_158_164 <=s (const 64 (2**20)),
    r_158_164 + s_158_164 <=s (const 64 (2**20)),
    r_158_164 - s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 + s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 - s_158_164 <=s (const 64 (2**20)),
    u_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_158_164 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_163_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_5,
sint64 g_118_low60_40_low20_5,
sint64 f_118_low60_40_low20_6,
sint64 g_118_low60_40_low20_6,
sint64 u_158_163,
sint64 v_158_163,
sint64 r_158_163,
sint64 s_158_163,
sint64 u_158_164,
sint64 v_158_164,
sint64 r_158_164,
sint64 s_158_164,
bit ne
)={
    u_158_163 * f_118_low60_40_low20_0 + v_158_163 * g_118_low60_40_low20_0 = f_118_low60_40_low20_5 * (-(2**20)),
    r_158_163 * f_118_low60_40_low20_0 + s_158_163 * g_118_low60_40_low20_0 = g_118_low60_40_low20_5 * (-(2**20))
&&
    u_158_163 * f_118_low60_40_low20_0 + v_158_163 * g_118_low60_40_low20_0 = f_118_low60_40_low20_5 * (const 64 (-(2**20))),
    r_158_163 * f_118_low60_40_low20_0 + s_158_163 * g_118_low60_40_low20_0 = g_118_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_5 + u_158_163 * (const 64 (2**21)) + v_158_163 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_5 + r_158_163 * (const 64 (2**21)) + s_158_163 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_5,
    f_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_5,
    g_118_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 163)) <=s delta, delta <=s (const 64 (1 + 2*163)),
    (const 64 (-(2**20))) <=s u_158_163, u_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_163, v_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_163, r_158_163 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_163, s_158_163 <=s (const 64 ((2**20))),
    u_158_163 + v_158_163 <=s (const 64 (2**20)),
    u_158_163 - v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 + v_158_163 <=s (const 64 (2**20)),
    (const 64 0) - u_158_163 - v_158_163 <=s (const 64 (2**20)),
    r_158_163 + s_158_163 <=s (const 64 (2**20)),
    r_158_163 - s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 + s_158_163 <=s (const 64 (2**20)),
    (const 64 0) - r_158_163 - s_158_163 <=s (const 64 (2**20)),
    u_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_158_163 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_158_163 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise c
assume
g_118_low60_40_low20_5 = 1 (mod 2)
&&
g_118_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_6 g_118_low60_40_low20_5;
mov u_158_164 r_158_163;
mov v_158_164 s_158_163;

subs dc g_118_low60_40_low20_6 g_118_low60_40_low20_5 f_118_low60_40_low20_5;
asr g_118_low60_40_low20_6 g_118_low60_40_low20_6 1;
subs dc r_158_164 r_158_163 u_158_163;
asr r_158_164 r_158_164 1;
subs dc s_158_164 s_158_163 v_158_163;
asr s_158_164 s_158_164 1;
assert
    true
&&
    f_118_low60_40_low20_6 = g_118_low60_40_low20_5,
    u_158_164 = r_158_163,
    v_158_164 = s_158_163,
    g_118_low60_40_low20_6 * (const 64 2) = g_118_low60_40_low20_5 - f_118_low60_40_low20_5,
    r_158_164 * (const 64 2) = r_158_163 - u_158_163,
    s_158_164 * (const 64 2) = s_158_163 - v_158_163
;

assume
    f_118_low60_40_low20_6 = g_118_low60_40_low20_5,
    u_158_164 = r_158_163,
    v_158_164 = s_158_163,
    g_118_low60_40_low20_6 * 2 = g_118_low60_40_low20_5 - f_118_low60_40_low20_5,
    r_158_164 * 2 = r_158_163 - u_158_163,
    s_158_164 * 2 = s_158_163 - v_158_163
&&
    true
;

{
    u_158_164 * f_118_low60_40_low20_0 + v_158_164 * g_118_low60_40_low20_0 = f_118_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_164 * f_118_low60_40_low20_0 + s_158_164 * g_118_low60_40_low20_0 = g_118_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_6 + u_158_164 * (const 64 (2**21)) + v_158_164 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_6 + r_158_164 * (const 64 (2**21)) + s_158_164 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_6,
    f_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_6,
    g_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 164)) <=s delta, delta <=s (const 64 (1 + 2*164)),
    (const 64 (-(2**20))) <=s u_158_164, u_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_164, v_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_164, r_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_164, s_158_164 <=s (const 64 ((2**20))),
    u_158_164 + v_158_164 <=s (const 64 (2**20)),
    u_158_164 - v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 + v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 - v_158_164 <=s (const 64 (2**20)),
    r_158_164 + s_158_164 <=s (const 64 (2**20)),
    r_158_164 - s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 + s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 - s_158_164 <=s (const 64 (2**20)),
    u_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_158_164 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_164_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_6,
sint64 g_118_low60_40_low20_6,
sint64 f_118_low60_40_low20_7,
sint64 g_118_low60_40_low20_7,
sint64 u_158_164,
sint64 v_158_164,
sint64 r_158_164,
sint64 s_158_164,
sint64 u_158_165,
sint64 v_158_165,
sint64 r_158_165,
sint64 s_158_165,
bit ne
)={
    u_158_164 * f_118_low60_40_low20_0 + v_158_164 * g_118_low60_40_low20_0 = f_118_low60_40_low20_6 * (-(2**20)),
    r_158_164 * f_118_low60_40_low20_0 + s_158_164 * g_118_low60_40_low20_0 = g_118_low60_40_low20_6 * (-(2**20))
&&
    u_158_164 * f_118_low60_40_low20_0 + v_158_164 * g_118_low60_40_low20_0 = f_118_low60_40_low20_6 * (const 64 (-(2**20))),
    r_158_164 * f_118_low60_40_low20_0 + s_158_164 * g_118_low60_40_low20_0 = g_118_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_6 + u_158_164 * (const 64 (2**21)) + v_158_164 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_6 + r_158_164 * (const 64 (2**21)) + s_158_164 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_6,
    f_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_6,
    g_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 164)) <=s delta, delta <=s (const 64 (1 + 2*164)),
    (const 64 (-(2**20))) <=s u_158_164, u_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_164, v_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_164, r_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_164, s_158_164 <=s (const 64 ((2**20))),
    u_158_164 + v_158_164 <=s (const 64 (2**20)),
    u_158_164 - v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 + v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 - v_158_164 <=s (const 64 (2**20)),
    r_158_164 + s_158_164 <=s (const 64 (2**20)),
    r_158_164 - s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 + s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 - s_158_164 <=s (const 64 (2**20)),
    u_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_158_164 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise a
assume
g_118_low60_40_low20_6 = 0 (mod 2)
&&
g_118_low60_40_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_7 f_118_low60_40_low20_6;
mov u_158_165 u_158_164;
mov v_158_165 v_158_164;

asr g_118_low60_40_low20_7 g_118_low60_40_low20_6 1;
asr r_158_165 r_158_164 1;
asr s_158_165 s_158_164 1;
assert
    true
&&
    f_118_low60_40_low20_7 = f_118_low60_40_low20_6,
    u_158_165 = u_158_164,
    v_158_165 = v_158_164,
    g_118_low60_40_low20_7 * (const 64 2) = g_118_low60_40_low20_6,
    r_158_165 * (const 64 2) = r_158_164,
    s_158_165 * (const 64 2) = s_158_164
;

assume
    f_118_low60_40_low20_7 = f_118_low60_40_low20_6,
    u_158_165 = u_158_164,
    v_158_165 = v_158_164,
    g_118_low60_40_low20_7 * 2 = g_118_low60_40_low20_6,
    r_158_165 * 2 = r_158_164,
    s_158_165 * 2 = s_158_164
&&
    true
;

{
    u_158_165 * f_118_low60_40_low20_0 + v_158_165 * g_118_low60_40_low20_0 = f_118_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_165 * f_118_low60_40_low20_0 + s_158_165 * g_118_low60_40_low20_0 = g_118_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_7 + u_158_165 * (const 64 (2**21)) + v_158_165 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_7 + r_158_165 * (const 64 (2**21)) + s_158_165 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_7,
    f_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_7,
    g_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 165)) <=s delta, delta <=s (const 64 (1 + 2*165)),
    (const 64 (-(2**20))) <=s u_158_165, u_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_165, v_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_165, r_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_165, s_158_165 <=s (const 64 ((2**20))),
    u_158_165 + v_158_165 <=s (const 64 (2**20)),
    u_158_165 - v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 + v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 - v_158_165 <=s (const 64 (2**20)),
    r_158_165 + s_158_165 <=s (const 64 (2**20)),
    r_158_165 - s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 + s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 - s_158_165 <=s (const 64 (2**20)),
    u_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_158_165 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_164_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_6,
sint64 g_118_low60_40_low20_6,
sint64 f_118_low60_40_low20_7,
sint64 g_118_low60_40_low20_7,
sint64 u_158_164,
sint64 v_158_164,
sint64 r_158_164,
sint64 s_158_164,
sint64 u_158_165,
sint64 v_158_165,
sint64 r_158_165,
sint64 s_158_165,
bit ne
)={
    u_158_164 * f_118_low60_40_low20_0 + v_158_164 * g_118_low60_40_low20_0 = f_118_low60_40_low20_6 * (-(2**20)),
    r_158_164 * f_118_low60_40_low20_0 + s_158_164 * g_118_low60_40_low20_0 = g_118_low60_40_low20_6 * (-(2**20))
&&
    u_158_164 * f_118_low60_40_low20_0 + v_158_164 * g_118_low60_40_low20_0 = f_118_low60_40_low20_6 * (const 64 (-(2**20))),
    r_158_164 * f_118_low60_40_low20_0 + s_158_164 * g_118_low60_40_low20_0 = g_118_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_6 + u_158_164 * (const 64 (2**21)) + v_158_164 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_6 + r_158_164 * (const 64 (2**21)) + s_158_164 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_6,
    f_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_6,
    g_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 164)) <=s delta, delta <=s (const 64 (1 + 2*164)),
    (const 64 (-(2**20))) <=s u_158_164, u_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_164, v_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_164, r_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_164, s_158_164 <=s (const 64 ((2**20))),
    u_158_164 + v_158_164 <=s (const 64 (2**20)),
    u_158_164 - v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 + v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 - v_158_164 <=s (const 64 (2**20)),
    r_158_164 + s_158_164 <=s (const 64 (2**20)),
    r_158_164 - s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 + s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 - s_158_164 <=s (const 64 (2**20)),
    u_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_158_164 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise b
assume
g_118_low60_40_low20_6 = 1 (mod 2)
&&
g_118_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_7 f_118_low60_40_low20_6;
mov u_158_165 u_158_164;
mov v_158_165 v_158_164;

add g_118_low60_40_low20_7 g_118_low60_40_low20_6 f_118_low60_40_low20_6;
asr g_118_low60_40_low20_7 g_118_low60_40_low20_7 1;
add r_158_165 r_158_164 u_158_164;
asr r_158_165 r_158_165 1;
add s_158_165 s_158_164 v_158_164;
asr s_158_165 s_158_165 1;
assert
    true
&&
    f_118_low60_40_low20_7 = f_118_low60_40_low20_6,
    u_158_165 = u_158_164,
    v_158_165 = v_158_164,
    g_118_low60_40_low20_7 * (const 64 2) = g_118_low60_40_low20_6 + f_118_low60_40_low20_6,
    r_158_165 * (const 64 2) = r_158_164 + u_158_164,
    s_158_165 * (const 64 2) = s_158_164 + v_158_164
;

assume
    f_118_low60_40_low20_7 = f_118_low60_40_low20_6,
    u_158_165 = u_158_164,
    v_158_165 = v_158_164,
    g_118_low60_40_low20_7 * 2 = g_118_low60_40_low20_6 + f_118_low60_40_low20_6,
    r_158_165 * 2 = r_158_164 + u_158_164,
    s_158_165 * 2 = s_158_164 + v_158_164
&&
    true
;

{
    u_158_165 * f_118_low60_40_low20_0 + v_158_165 * g_118_low60_40_low20_0 = f_118_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_165 * f_118_low60_40_low20_0 + s_158_165 * g_118_low60_40_low20_0 = g_118_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_7 + u_158_165 * (const 64 (2**21)) + v_158_165 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_7 + r_158_165 * (const 64 (2**21)) + s_158_165 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_7,
    f_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_7,
    g_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 165)) <=s delta, delta <=s (const 64 (1 + 2*165)),
    (const 64 (-(2**20))) <=s u_158_165, u_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_165, v_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_165, r_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_165, s_158_165 <=s (const 64 ((2**20))),
    u_158_165 + v_158_165 <=s (const 64 (2**20)),
    u_158_165 - v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 + v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 - v_158_165 <=s (const 64 (2**20)),
    r_158_165 + s_158_165 <=s (const 64 (2**20)),
    r_158_165 - s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 + s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 - s_158_165 <=s (const 64 (2**20)),
    u_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_158_165 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_164_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_6,
sint64 g_118_low60_40_low20_6,
sint64 f_118_low60_40_low20_7,
sint64 g_118_low60_40_low20_7,
sint64 u_158_164,
sint64 v_158_164,
sint64 r_158_164,
sint64 s_158_164,
sint64 u_158_165,
sint64 v_158_165,
sint64 r_158_165,
sint64 s_158_165,
bit ne
)={
    u_158_164 * f_118_low60_40_low20_0 + v_158_164 * g_118_low60_40_low20_0 = f_118_low60_40_low20_6 * (-(2**20)),
    r_158_164 * f_118_low60_40_low20_0 + s_158_164 * g_118_low60_40_low20_0 = g_118_low60_40_low20_6 * (-(2**20))
&&
    u_158_164 * f_118_low60_40_low20_0 + v_158_164 * g_118_low60_40_low20_0 = f_118_low60_40_low20_6 * (const 64 (-(2**20))),
    r_158_164 * f_118_low60_40_low20_0 + s_158_164 * g_118_low60_40_low20_0 = g_118_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_6 + u_158_164 * (const 64 (2**21)) + v_158_164 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_6 + r_158_164 * (const 64 (2**21)) + s_158_164 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_6,
    f_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_6,
    g_118_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 164)) <=s delta, delta <=s (const 64 (1 + 2*164)),
    (const 64 (-(2**20))) <=s u_158_164, u_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_164, v_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_164, r_158_164 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_164, s_158_164 <=s (const 64 ((2**20))),
    u_158_164 + v_158_164 <=s (const 64 (2**20)),
    u_158_164 - v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 + v_158_164 <=s (const 64 (2**20)),
    (const 64 0) - u_158_164 - v_158_164 <=s (const 64 (2**20)),
    r_158_164 + s_158_164 <=s (const 64 (2**20)),
    r_158_164 - s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 + s_158_164 <=s (const 64 (2**20)),
    (const 64 0) - r_158_164 - s_158_164 <=s (const 64 (2**20)),
    u_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_158_164 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_158_164 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise c
assume
g_118_low60_40_low20_6 = 1 (mod 2)
&&
g_118_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_7 g_118_low60_40_low20_6;
mov u_158_165 r_158_164;
mov v_158_165 s_158_164;

subs dc g_118_low60_40_low20_7 g_118_low60_40_low20_6 f_118_low60_40_low20_6;
asr g_118_low60_40_low20_7 g_118_low60_40_low20_7 1;
subs dc r_158_165 r_158_164 u_158_164;
asr r_158_165 r_158_165 1;
subs dc s_158_165 s_158_164 v_158_164;
asr s_158_165 s_158_165 1;
assert
    true
&&
    f_118_low60_40_low20_7 = g_118_low60_40_low20_6,
    u_158_165 = r_158_164,
    v_158_165 = s_158_164,
    g_118_low60_40_low20_7 * (const 64 2) = g_118_low60_40_low20_6 - f_118_low60_40_low20_6,
    r_158_165 * (const 64 2) = r_158_164 - u_158_164,
    s_158_165 * (const 64 2) = s_158_164 - v_158_164
;

assume
    f_118_low60_40_low20_7 = g_118_low60_40_low20_6,
    u_158_165 = r_158_164,
    v_158_165 = s_158_164,
    g_118_low60_40_low20_7 * 2 = g_118_low60_40_low20_6 - f_118_low60_40_low20_6,
    r_158_165 * 2 = r_158_164 - u_158_164,
    s_158_165 * 2 = s_158_164 - v_158_164
&&
    true
;

{
    u_158_165 * f_118_low60_40_low20_0 + v_158_165 * g_118_low60_40_low20_0 = f_118_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_165 * f_118_low60_40_low20_0 + s_158_165 * g_118_low60_40_low20_0 = g_118_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_7 + u_158_165 * (const 64 (2**21)) + v_158_165 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_7 + r_158_165 * (const 64 (2**21)) + s_158_165 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_7,
    f_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_7,
    g_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 165)) <=s delta, delta <=s (const 64 (1 + 2*165)),
    (const 64 (-(2**20))) <=s u_158_165, u_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_165, v_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_165, r_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_165, s_158_165 <=s (const 64 ((2**20))),
    u_158_165 + v_158_165 <=s (const 64 (2**20)),
    u_158_165 - v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 + v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 - v_158_165 <=s (const 64 (2**20)),
    r_158_165 + s_158_165 <=s (const 64 (2**20)),
    r_158_165 - s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 + s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 - s_158_165 <=s (const 64 (2**20)),
    u_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_158_165 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_165_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_7,
sint64 g_118_low60_40_low20_7,
sint64 f_118_low60_40_low20_8,
sint64 g_118_low60_40_low20_8,
sint64 u_158_165,
sint64 v_158_165,
sint64 r_158_165,
sint64 s_158_165,
sint64 u_158_166,
sint64 v_158_166,
sint64 r_158_166,
sint64 s_158_166,
bit ne
)={
    u_158_165 * f_118_low60_40_low20_0 + v_158_165 * g_118_low60_40_low20_0 = f_118_low60_40_low20_7 * (-(2**20)),
    r_158_165 * f_118_low60_40_low20_0 + s_158_165 * g_118_low60_40_low20_0 = g_118_low60_40_low20_7 * (-(2**20))
&&
    u_158_165 * f_118_low60_40_low20_0 + v_158_165 * g_118_low60_40_low20_0 = f_118_low60_40_low20_7 * (const 64 (-(2**20))),
    r_158_165 * f_118_low60_40_low20_0 + s_158_165 * g_118_low60_40_low20_0 = g_118_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_7 + u_158_165 * (const 64 (2**21)) + v_158_165 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_7 + r_158_165 * (const 64 (2**21)) + s_158_165 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_7,
    f_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_7,
    g_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 165)) <=s delta, delta <=s (const 64 (1 + 2*165)),
    (const 64 (-(2**20))) <=s u_158_165, u_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_165, v_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_165, r_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_165, s_158_165 <=s (const 64 ((2**20))),
    u_158_165 + v_158_165 <=s (const 64 (2**20)),
    u_158_165 - v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 + v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 - v_158_165 <=s (const 64 (2**20)),
    r_158_165 + s_158_165 <=s (const 64 (2**20)),
    r_158_165 - s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 + s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 - s_158_165 <=s (const 64 (2**20)),
    u_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_158_165 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise a
assume
g_118_low60_40_low20_7 = 0 (mod 2)
&&
g_118_low60_40_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_8 f_118_low60_40_low20_7;
mov u_158_166 u_158_165;
mov v_158_166 v_158_165;

asr g_118_low60_40_low20_8 g_118_low60_40_low20_7 1;
asr r_158_166 r_158_165 1;
asr s_158_166 s_158_165 1;
assert
    true
&&
    f_118_low60_40_low20_8 = f_118_low60_40_low20_7,
    u_158_166 = u_158_165,
    v_158_166 = v_158_165,
    g_118_low60_40_low20_8 * (const 64 2) = g_118_low60_40_low20_7,
    r_158_166 * (const 64 2) = r_158_165,
    s_158_166 * (const 64 2) = s_158_165
;

assume
    f_118_low60_40_low20_8 = f_118_low60_40_low20_7,
    u_158_166 = u_158_165,
    v_158_166 = v_158_165,
    g_118_low60_40_low20_8 * 2 = g_118_low60_40_low20_7,
    r_158_166 * 2 = r_158_165,
    s_158_166 * 2 = s_158_165
&&
    true
;

{
    u_158_166 * f_118_low60_40_low20_0 + v_158_166 * g_118_low60_40_low20_0 = f_118_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_166 * f_118_low60_40_low20_0 + s_158_166 * g_118_low60_40_low20_0 = g_118_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_8 + u_158_166 * (const 64 (2**21)) + v_158_166 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_8 + r_158_166 * (const 64 (2**21)) + s_158_166 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_8,
    f_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_8,
    g_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 166)) <=s delta, delta <=s (const 64 (1 + 2*166)),
    (const 64 (-(2**20))) <=s u_158_166, u_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_166, v_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_166, r_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_166, s_158_166 <=s (const 64 ((2**20))),
    u_158_166 + v_158_166 <=s (const 64 (2**20)),
    u_158_166 - v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 + v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 - v_158_166 <=s (const 64 (2**20)),
    r_158_166 + s_158_166 <=s (const 64 (2**20)),
    r_158_166 - s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 + s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 - s_158_166 <=s (const 64 (2**20)),
    u_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_158_166 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_165_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_7,
sint64 g_118_low60_40_low20_7,
sint64 f_118_low60_40_low20_8,
sint64 g_118_low60_40_low20_8,
sint64 u_158_165,
sint64 v_158_165,
sint64 r_158_165,
sint64 s_158_165,
sint64 u_158_166,
sint64 v_158_166,
sint64 r_158_166,
sint64 s_158_166,
bit ne
)={
    u_158_165 * f_118_low60_40_low20_0 + v_158_165 * g_118_low60_40_low20_0 = f_118_low60_40_low20_7 * (-(2**20)),
    r_158_165 * f_118_low60_40_low20_0 + s_158_165 * g_118_low60_40_low20_0 = g_118_low60_40_low20_7 * (-(2**20))
&&
    u_158_165 * f_118_low60_40_low20_0 + v_158_165 * g_118_low60_40_low20_0 = f_118_low60_40_low20_7 * (const 64 (-(2**20))),
    r_158_165 * f_118_low60_40_low20_0 + s_158_165 * g_118_low60_40_low20_0 = g_118_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_7 + u_158_165 * (const 64 (2**21)) + v_158_165 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_7 + r_158_165 * (const 64 (2**21)) + s_158_165 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_7,
    f_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_7,
    g_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 165)) <=s delta, delta <=s (const 64 (1 + 2*165)),
    (const 64 (-(2**20))) <=s u_158_165, u_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_165, v_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_165, r_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_165, s_158_165 <=s (const 64 ((2**20))),
    u_158_165 + v_158_165 <=s (const 64 (2**20)),
    u_158_165 - v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 + v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 - v_158_165 <=s (const 64 (2**20)),
    r_158_165 + s_158_165 <=s (const 64 (2**20)),
    r_158_165 - s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 + s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 - s_158_165 <=s (const 64 (2**20)),
    u_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_158_165 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise b
assume
g_118_low60_40_low20_7 = 1 (mod 2)
&&
g_118_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_8 f_118_low60_40_low20_7;
mov u_158_166 u_158_165;
mov v_158_166 v_158_165;

add g_118_low60_40_low20_8 g_118_low60_40_low20_7 f_118_low60_40_low20_7;
asr g_118_low60_40_low20_8 g_118_low60_40_low20_8 1;
add r_158_166 r_158_165 u_158_165;
asr r_158_166 r_158_166 1;
add s_158_166 s_158_165 v_158_165;
asr s_158_166 s_158_166 1;
assert
    true
&&
    f_118_low60_40_low20_8 = f_118_low60_40_low20_7,
    u_158_166 = u_158_165,
    v_158_166 = v_158_165,
    g_118_low60_40_low20_8 * (const 64 2) = g_118_low60_40_low20_7 + f_118_low60_40_low20_7,
    r_158_166 * (const 64 2) = r_158_165 + u_158_165,
    s_158_166 * (const 64 2) = s_158_165 + v_158_165
;

assume
    f_118_low60_40_low20_8 = f_118_low60_40_low20_7,
    u_158_166 = u_158_165,
    v_158_166 = v_158_165,
    g_118_low60_40_low20_8 * 2 = g_118_low60_40_low20_7 + f_118_low60_40_low20_7,
    r_158_166 * 2 = r_158_165 + u_158_165,
    s_158_166 * 2 = s_158_165 + v_158_165
&&
    true
;

{
    u_158_166 * f_118_low60_40_low20_0 + v_158_166 * g_118_low60_40_low20_0 = f_118_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_166 * f_118_low60_40_low20_0 + s_158_166 * g_118_low60_40_low20_0 = g_118_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_8 + u_158_166 * (const 64 (2**21)) + v_158_166 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_8 + r_158_166 * (const 64 (2**21)) + s_158_166 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_8,
    f_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_8,
    g_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 166)) <=s delta, delta <=s (const 64 (1 + 2*166)),
    (const 64 (-(2**20))) <=s u_158_166, u_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_166, v_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_166, r_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_166, s_158_166 <=s (const 64 ((2**20))),
    u_158_166 + v_158_166 <=s (const 64 (2**20)),
    u_158_166 - v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 + v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 - v_158_166 <=s (const 64 (2**20)),
    r_158_166 + s_158_166 <=s (const 64 (2**20)),
    r_158_166 - s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 + s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 - s_158_166 <=s (const 64 (2**20)),
    u_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_158_166 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_165_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_7,
sint64 g_118_low60_40_low20_7,
sint64 f_118_low60_40_low20_8,
sint64 g_118_low60_40_low20_8,
sint64 u_158_165,
sint64 v_158_165,
sint64 r_158_165,
sint64 s_158_165,
sint64 u_158_166,
sint64 v_158_166,
sint64 r_158_166,
sint64 s_158_166,
bit ne
)={
    u_158_165 * f_118_low60_40_low20_0 + v_158_165 * g_118_low60_40_low20_0 = f_118_low60_40_low20_7 * (-(2**20)),
    r_158_165 * f_118_low60_40_low20_0 + s_158_165 * g_118_low60_40_low20_0 = g_118_low60_40_low20_7 * (-(2**20))
&&
    u_158_165 * f_118_low60_40_low20_0 + v_158_165 * g_118_low60_40_low20_0 = f_118_low60_40_low20_7 * (const 64 (-(2**20))),
    r_158_165 * f_118_low60_40_low20_0 + s_158_165 * g_118_low60_40_low20_0 = g_118_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_7 + u_158_165 * (const 64 (2**21)) + v_158_165 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_7 + r_158_165 * (const 64 (2**21)) + s_158_165 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_7,
    f_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_7,
    g_118_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 165)) <=s delta, delta <=s (const 64 (1 + 2*165)),
    (const 64 (-(2**20))) <=s u_158_165, u_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_165, v_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_165, r_158_165 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_165, s_158_165 <=s (const 64 ((2**20))),
    u_158_165 + v_158_165 <=s (const 64 (2**20)),
    u_158_165 - v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 + v_158_165 <=s (const 64 (2**20)),
    (const 64 0) - u_158_165 - v_158_165 <=s (const 64 (2**20)),
    r_158_165 + s_158_165 <=s (const 64 (2**20)),
    r_158_165 - s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 + s_158_165 <=s (const 64 (2**20)),
    (const 64 0) - r_158_165 - s_158_165 <=s (const 64 (2**20)),
    u_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_158_165 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_158_165 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise c
assume
g_118_low60_40_low20_7 = 1 (mod 2)
&&
g_118_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_8 g_118_low60_40_low20_7;
mov u_158_166 r_158_165;
mov v_158_166 s_158_165;

subs dc g_118_low60_40_low20_8 g_118_low60_40_low20_7 f_118_low60_40_low20_7;
asr g_118_low60_40_low20_8 g_118_low60_40_low20_8 1;
subs dc r_158_166 r_158_165 u_158_165;
asr r_158_166 r_158_166 1;
subs dc s_158_166 s_158_165 v_158_165;
asr s_158_166 s_158_166 1;
assert
    true
&&
    f_118_low60_40_low20_8 = g_118_low60_40_low20_7,
    u_158_166 = r_158_165,
    v_158_166 = s_158_165,
    g_118_low60_40_low20_8 * (const 64 2) = g_118_low60_40_low20_7 - f_118_low60_40_low20_7,
    r_158_166 * (const 64 2) = r_158_165 - u_158_165,
    s_158_166 * (const 64 2) = s_158_165 - v_158_165
;

assume
    f_118_low60_40_low20_8 = g_118_low60_40_low20_7,
    u_158_166 = r_158_165,
    v_158_166 = s_158_165,
    g_118_low60_40_low20_8 * 2 = g_118_low60_40_low20_7 - f_118_low60_40_low20_7,
    r_158_166 * 2 = r_158_165 - u_158_165,
    s_158_166 * 2 = s_158_165 - v_158_165
&&
    true
;

{
    u_158_166 * f_118_low60_40_low20_0 + v_158_166 * g_118_low60_40_low20_0 = f_118_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_166 * f_118_low60_40_low20_0 + s_158_166 * g_118_low60_40_low20_0 = g_118_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_8 + u_158_166 * (const 64 (2**21)) + v_158_166 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_8 + r_158_166 * (const 64 (2**21)) + s_158_166 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_8,
    f_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_8,
    g_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 166)) <=s delta, delta <=s (const 64 (1 + 2*166)),
    (const 64 (-(2**20))) <=s u_158_166, u_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_166, v_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_166, r_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_166, s_158_166 <=s (const 64 ((2**20))),
    u_158_166 + v_158_166 <=s (const 64 (2**20)),
    u_158_166 - v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 + v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 - v_158_166 <=s (const 64 (2**20)),
    r_158_166 + s_158_166 <=s (const 64 (2**20)),
    r_158_166 - s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 + s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 - s_158_166 <=s (const 64 (2**20)),
    u_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_158_166 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_166_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_8,
sint64 g_118_low60_40_low20_8,
sint64 f_118_low60_40_low20_9,
sint64 g_118_low60_40_low20_9,
sint64 u_158_166,
sint64 v_158_166,
sint64 r_158_166,
sint64 s_158_166,
sint64 u_158_167,
sint64 v_158_167,
sint64 r_158_167,
sint64 s_158_167,
bit ne
)={
    u_158_166 * f_118_low60_40_low20_0 + v_158_166 * g_118_low60_40_low20_0 = f_118_low60_40_low20_8 * (-(2**20)),
    r_158_166 * f_118_low60_40_low20_0 + s_158_166 * g_118_low60_40_low20_0 = g_118_low60_40_low20_8 * (-(2**20))
&&
    u_158_166 * f_118_low60_40_low20_0 + v_158_166 * g_118_low60_40_low20_0 = f_118_low60_40_low20_8 * (const 64 (-(2**20))),
    r_158_166 * f_118_low60_40_low20_0 + s_158_166 * g_118_low60_40_low20_0 = g_118_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_8 + u_158_166 * (const 64 (2**21)) + v_158_166 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_8 + r_158_166 * (const 64 (2**21)) + s_158_166 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_8,
    f_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_8,
    g_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 166)) <=s delta, delta <=s (const 64 (1 + 2*166)),
    (const 64 (-(2**20))) <=s u_158_166, u_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_166, v_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_166, r_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_166, s_158_166 <=s (const 64 ((2**20))),
    u_158_166 + v_158_166 <=s (const 64 (2**20)),
    u_158_166 - v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 + v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 - v_158_166 <=s (const 64 (2**20)),
    r_158_166 + s_158_166 <=s (const 64 (2**20)),
    r_158_166 - s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 + s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 - s_158_166 <=s (const 64 (2**20)),
    u_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_158_166 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise a
assume
g_118_low60_40_low20_8 = 0 (mod 2)
&&
g_118_low60_40_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_9 f_118_low60_40_low20_8;
mov u_158_167 u_158_166;
mov v_158_167 v_158_166;

asr g_118_low60_40_low20_9 g_118_low60_40_low20_8 1;
asr r_158_167 r_158_166 1;
asr s_158_167 s_158_166 1;
assert
    true
&&
    f_118_low60_40_low20_9 = f_118_low60_40_low20_8,
    u_158_167 = u_158_166,
    v_158_167 = v_158_166,
    g_118_low60_40_low20_9 * (const 64 2) = g_118_low60_40_low20_8,
    r_158_167 * (const 64 2) = r_158_166,
    s_158_167 * (const 64 2) = s_158_166
;

assume
    f_118_low60_40_low20_9 = f_118_low60_40_low20_8,
    u_158_167 = u_158_166,
    v_158_167 = v_158_166,
    g_118_low60_40_low20_9 * 2 = g_118_low60_40_low20_8,
    r_158_167 * 2 = r_158_166,
    s_158_167 * 2 = s_158_166
&&
    true
;

{
    u_158_167 * f_118_low60_40_low20_0 + v_158_167 * g_118_low60_40_low20_0 = f_118_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_167 * f_118_low60_40_low20_0 + s_158_167 * g_118_low60_40_low20_0 = g_118_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_9 + u_158_167 * (const 64 (2**21)) + v_158_167 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_9 + r_158_167 * (const 64 (2**21)) + s_158_167 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_9,
    f_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_9,
    g_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 167)) <=s delta, delta <=s (const 64 (1 + 2*167)),
    (const 64 (-(2**20))) <=s u_158_167, u_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_167, v_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_167, r_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_167, s_158_167 <=s (const 64 ((2**20))),
    u_158_167 + v_158_167 <=s (const 64 (2**20)),
    u_158_167 - v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 + v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 - v_158_167 <=s (const 64 (2**20)),
    r_158_167 + s_158_167 <=s (const 64 (2**20)),
    r_158_167 - s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 + s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 - s_158_167 <=s (const 64 (2**20)),
    u_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_158_167 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_166_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_8,
sint64 g_118_low60_40_low20_8,
sint64 f_118_low60_40_low20_9,
sint64 g_118_low60_40_low20_9,
sint64 u_158_166,
sint64 v_158_166,
sint64 r_158_166,
sint64 s_158_166,
sint64 u_158_167,
sint64 v_158_167,
sint64 r_158_167,
sint64 s_158_167,
bit ne
)={
    u_158_166 * f_118_low60_40_low20_0 + v_158_166 * g_118_low60_40_low20_0 = f_118_low60_40_low20_8 * (-(2**20)),
    r_158_166 * f_118_low60_40_low20_0 + s_158_166 * g_118_low60_40_low20_0 = g_118_low60_40_low20_8 * (-(2**20))
&&
    u_158_166 * f_118_low60_40_low20_0 + v_158_166 * g_118_low60_40_low20_0 = f_118_low60_40_low20_8 * (const 64 (-(2**20))),
    r_158_166 * f_118_low60_40_low20_0 + s_158_166 * g_118_low60_40_low20_0 = g_118_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_8 + u_158_166 * (const 64 (2**21)) + v_158_166 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_8 + r_158_166 * (const 64 (2**21)) + s_158_166 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_8,
    f_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_8,
    g_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 166)) <=s delta, delta <=s (const 64 (1 + 2*166)),
    (const 64 (-(2**20))) <=s u_158_166, u_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_166, v_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_166, r_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_166, s_158_166 <=s (const 64 ((2**20))),
    u_158_166 + v_158_166 <=s (const 64 (2**20)),
    u_158_166 - v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 + v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 - v_158_166 <=s (const 64 (2**20)),
    r_158_166 + s_158_166 <=s (const 64 (2**20)),
    r_158_166 - s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 + s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 - s_158_166 <=s (const 64 (2**20)),
    u_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_158_166 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise b
assume
g_118_low60_40_low20_8 = 1 (mod 2)
&&
g_118_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_9 f_118_low60_40_low20_8;
mov u_158_167 u_158_166;
mov v_158_167 v_158_166;

add g_118_low60_40_low20_9 g_118_low60_40_low20_8 f_118_low60_40_low20_8;
asr g_118_low60_40_low20_9 g_118_low60_40_low20_9 1;
add r_158_167 r_158_166 u_158_166;
asr r_158_167 r_158_167 1;
add s_158_167 s_158_166 v_158_166;
asr s_158_167 s_158_167 1;
assert
    true
&&
    f_118_low60_40_low20_9 = f_118_low60_40_low20_8,
    u_158_167 = u_158_166,
    v_158_167 = v_158_166,
    g_118_low60_40_low20_9 * (const 64 2) = g_118_low60_40_low20_8 + f_118_low60_40_low20_8,
    r_158_167 * (const 64 2) = r_158_166 + u_158_166,
    s_158_167 * (const 64 2) = s_158_166 + v_158_166
;

assume
    f_118_low60_40_low20_9 = f_118_low60_40_low20_8,
    u_158_167 = u_158_166,
    v_158_167 = v_158_166,
    g_118_low60_40_low20_9 * 2 = g_118_low60_40_low20_8 + f_118_low60_40_low20_8,
    r_158_167 * 2 = r_158_166 + u_158_166,
    s_158_167 * 2 = s_158_166 + v_158_166
&&
    true
;

{
    u_158_167 * f_118_low60_40_low20_0 + v_158_167 * g_118_low60_40_low20_0 = f_118_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_167 * f_118_low60_40_low20_0 + s_158_167 * g_118_low60_40_low20_0 = g_118_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_9 + u_158_167 * (const 64 (2**21)) + v_158_167 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_9 + r_158_167 * (const 64 (2**21)) + s_158_167 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_9,
    f_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_9,
    g_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 167)) <=s delta, delta <=s (const 64 (1 + 2*167)),
    (const 64 (-(2**20))) <=s u_158_167, u_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_167, v_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_167, r_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_167, s_158_167 <=s (const 64 ((2**20))),
    u_158_167 + v_158_167 <=s (const 64 (2**20)),
    u_158_167 - v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 + v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 - v_158_167 <=s (const 64 (2**20)),
    r_158_167 + s_158_167 <=s (const 64 (2**20)),
    r_158_167 - s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 + s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 - s_158_167 <=s (const 64 (2**20)),
    u_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_158_167 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_166_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_8,
sint64 g_118_low60_40_low20_8,
sint64 f_118_low60_40_low20_9,
sint64 g_118_low60_40_low20_9,
sint64 u_158_166,
sint64 v_158_166,
sint64 r_158_166,
sint64 s_158_166,
sint64 u_158_167,
sint64 v_158_167,
sint64 r_158_167,
sint64 s_158_167,
bit ne
)={
    u_158_166 * f_118_low60_40_low20_0 + v_158_166 * g_118_low60_40_low20_0 = f_118_low60_40_low20_8 * (-(2**20)),
    r_158_166 * f_118_low60_40_low20_0 + s_158_166 * g_118_low60_40_low20_0 = g_118_low60_40_low20_8 * (-(2**20))
&&
    u_158_166 * f_118_low60_40_low20_0 + v_158_166 * g_118_low60_40_low20_0 = f_118_low60_40_low20_8 * (const 64 (-(2**20))),
    r_158_166 * f_118_low60_40_low20_0 + s_158_166 * g_118_low60_40_low20_0 = g_118_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_8 + u_158_166 * (const 64 (2**21)) + v_158_166 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_8 + r_158_166 * (const 64 (2**21)) + s_158_166 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_8,
    f_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_8,
    g_118_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 166)) <=s delta, delta <=s (const 64 (1 + 2*166)),
    (const 64 (-(2**20))) <=s u_158_166, u_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_166, v_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_166, r_158_166 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_166, s_158_166 <=s (const 64 ((2**20))),
    u_158_166 + v_158_166 <=s (const 64 (2**20)),
    u_158_166 - v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 + v_158_166 <=s (const 64 (2**20)),
    (const 64 0) - u_158_166 - v_158_166 <=s (const 64 (2**20)),
    r_158_166 + s_158_166 <=s (const 64 (2**20)),
    r_158_166 - s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 + s_158_166 <=s (const 64 (2**20)),
    (const 64 0) - r_158_166 - s_158_166 <=s (const 64 (2**20)),
    u_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_158_166 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_158_166 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise c
assume
g_118_low60_40_low20_8 = 1 (mod 2)
&&
g_118_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_9 g_118_low60_40_low20_8;
mov u_158_167 r_158_166;
mov v_158_167 s_158_166;

subs dc g_118_low60_40_low20_9 g_118_low60_40_low20_8 f_118_low60_40_low20_8;
asr g_118_low60_40_low20_9 g_118_low60_40_low20_9 1;
subs dc r_158_167 r_158_166 u_158_166;
asr r_158_167 r_158_167 1;
subs dc s_158_167 s_158_166 v_158_166;
asr s_158_167 s_158_167 1;
assert
    true
&&
    f_118_low60_40_low20_9 = g_118_low60_40_low20_8,
    u_158_167 = r_158_166,
    v_158_167 = s_158_166,
    g_118_low60_40_low20_9 * (const 64 2) = g_118_low60_40_low20_8 - f_118_low60_40_low20_8,
    r_158_167 * (const 64 2) = r_158_166 - u_158_166,
    s_158_167 * (const 64 2) = s_158_166 - v_158_166
;

assume
    f_118_low60_40_low20_9 = g_118_low60_40_low20_8,
    u_158_167 = r_158_166,
    v_158_167 = s_158_166,
    g_118_low60_40_low20_9 * 2 = g_118_low60_40_low20_8 - f_118_low60_40_low20_8,
    r_158_167 * 2 = r_158_166 - u_158_166,
    s_158_167 * 2 = s_158_166 - v_158_166
&&
    true
;

{
    u_158_167 * f_118_low60_40_low20_0 + v_158_167 * g_118_low60_40_low20_0 = f_118_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_167 * f_118_low60_40_low20_0 + s_158_167 * g_118_low60_40_low20_0 = g_118_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_9 + u_158_167 * (const 64 (2**21)) + v_158_167 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_9 + r_158_167 * (const 64 (2**21)) + s_158_167 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_9,
    f_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_9,
    g_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 167)) <=s delta, delta <=s (const 64 (1 + 2*167)),
    (const 64 (-(2**20))) <=s u_158_167, u_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_167, v_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_167, r_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_167, s_158_167 <=s (const 64 ((2**20))),
    u_158_167 + v_158_167 <=s (const 64 (2**20)),
    u_158_167 - v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 + v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 - v_158_167 <=s (const 64 (2**20)),
    r_158_167 + s_158_167 <=s (const 64 (2**20)),
    r_158_167 - s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 + s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 - s_158_167 <=s (const 64 (2**20)),
    u_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_158_167 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_167_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_9,
sint64 g_118_low60_40_low20_9,
sint64 f_118_low60_40_low20_10,
sint64 g_118_low60_40_low20_10,
sint64 u_158_167,
sint64 v_158_167,
sint64 r_158_167,
sint64 s_158_167,
sint64 u_158_168,
sint64 v_158_168,
sint64 r_158_168,
sint64 s_158_168,
bit ne
)={
    u_158_167 * f_118_low60_40_low20_0 + v_158_167 * g_118_low60_40_low20_0 = f_118_low60_40_low20_9 * (-(2**20)),
    r_158_167 * f_118_low60_40_low20_0 + s_158_167 * g_118_low60_40_low20_0 = g_118_low60_40_low20_9 * (-(2**20))
&&
    u_158_167 * f_118_low60_40_low20_0 + v_158_167 * g_118_low60_40_low20_0 = f_118_low60_40_low20_9 * (const 64 (-(2**20))),
    r_158_167 * f_118_low60_40_low20_0 + s_158_167 * g_118_low60_40_low20_0 = g_118_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_9 + u_158_167 * (const 64 (2**21)) + v_158_167 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_9 + r_158_167 * (const 64 (2**21)) + s_158_167 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_9,
    f_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_9,
    g_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 167)) <=s delta, delta <=s (const 64 (1 + 2*167)),
    (const 64 (-(2**20))) <=s u_158_167, u_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_167, v_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_167, r_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_167, s_158_167 <=s (const 64 ((2**20))),
    u_158_167 + v_158_167 <=s (const 64 (2**20)),
    u_158_167 - v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 + v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 - v_158_167 <=s (const 64 (2**20)),
    r_158_167 + s_158_167 <=s (const 64 (2**20)),
    r_158_167 - s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 + s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 - s_158_167 <=s (const 64 (2**20)),
    u_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_158_167 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise a
assume
g_118_low60_40_low20_9 = 0 (mod 2)
&&
g_118_low60_40_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_10 f_118_low60_40_low20_9;
mov u_158_168 u_158_167;
mov v_158_168 v_158_167;

asr g_118_low60_40_low20_10 g_118_low60_40_low20_9 1;
asr r_158_168 r_158_167 1;
asr s_158_168 s_158_167 1;
assert
    true
&&
    f_118_low60_40_low20_10 = f_118_low60_40_low20_9,
    u_158_168 = u_158_167,
    v_158_168 = v_158_167,
    g_118_low60_40_low20_10 * (const 64 2) = g_118_low60_40_low20_9,
    r_158_168 * (const 64 2) = r_158_167,
    s_158_168 * (const 64 2) = s_158_167
;

assume
    f_118_low60_40_low20_10 = f_118_low60_40_low20_9,
    u_158_168 = u_158_167,
    v_158_168 = v_158_167,
    g_118_low60_40_low20_10 * 2 = g_118_low60_40_low20_9,
    r_158_168 * 2 = r_158_167,
    s_158_168 * 2 = s_158_167
&&
    true
;

{
    u_158_168 * f_118_low60_40_low20_0 + v_158_168 * g_118_low60_40_low20_0 = f_118_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_168 * f_118_low60_40_low20_0 + s_158_168 * g_118_low60_40_low20_0 = g_118_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_10 + u_158_168 * (const 64 (2**21)) + v_158_168 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_10 + r_158_168 * (const 64 (2**21)) + s_158_168 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_10,
    f_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_10,
    g_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 168)) <=s delta, delta <=s (const 64 (1 + 2*168)),
    (const 64 (-(2**20))) <=s u_158_168, u_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_168, v_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_168, r_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_168, s_158_168 <=s (const 64 ((2**20))),
    u_158_168 + v_158_168 <=s (const 64 (2**20)),
    u_158_168 - v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 + v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 - v_158_168 <=s (const 64 (2**20)),
    r_158_168 + s_158_168 <=s (const 64 (2**20)),
    r_158_168 - s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 + s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 - s_158_168 <=s (const 64 (2**20)),
    u_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_158_168 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_167_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_9,
sint64 g_118_low60_40_low20_9,
sint64 f_118_low60_40_low20_10,
sint64 g_118_low60_40_low20_10,
sint64 u_158_167,
sint64 v_158_167,
sint64 r_158_167,
sint64 s_158_167,
sint64 u_158_168,
sint64 v_158_168,
sint64 r_158_168,
sint64 s_158_168,
bit ne
)={
    u_158_167 * f_118_low60_40_low20_0 + v_158_167 * g_118_low60_40_low20_0 = f_118_low60_40_low20_9 * (-(2**20)),
    r_158_167 * f_118_low60_40_low20_0 + s_158_167 * g_118_low60_40_low20_0 = g_118_low60_40_low20_9 * (-(2**20))
&&
    u_158_167 * f_118_low60_40_low20_0 + v_158_167 * g_118_low60_40_low20_0 = f_118_low60_40_low20_9 * (const 64 (-(2**20))),
    r_158_167 * f_118_low60_40_low20_0 + s_158_167 * g_118_low60_40_low20_0 = g_118_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_9 + u_158_167 * (const 64 (2**21)) + v_158_167 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_9 + r_158_167 * (const 64 (2**21)) + s_158_167 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_9,
    f_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_9,
    g_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 167)) <=s delta, delta <=s (const 64 (1 + 2*167)),
    (const 64 (-(2**20))) <=s u_158_167, u_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_167, v_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_167, r_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_167, s_158_167 <=s (const 64 ((2**20))),
    u_158_167 + v_158_167 <=s (const 64 (2**20)),
    u_158_167 - v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 + v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 - v_158_167 <=s (const 64 (2**20)),
    r_158_167 + s_158_167 <=s (const 64 (2**20)),
    r_158_167 - s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 + s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 - s_158_167 <=s (const 64 (2**20)),
    u_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_158_167 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise b
assume
g_118_low60_40_low20_9 = 1 (mod 2)
&&
g_118_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_10 f_118_low60_40_low20_9;
mov u_158_168 u_158_167;
mov v_158_168 v_158_167;

add g_118_low60_40_low20_10 g_118_low60_40_low20_9 f_118_low60_40_low20_9;
asr g_118_low60_40_low20_10 g_118_low60_40_low20_10 1;
add r_158_168 r_158_167 u_158_167;
asr r_158_168 r_158_168 1;
add s_158_168 s_158_167 v_158_167;
asr s_158_168 s_158_168 1;
assert
    true
&&
    f_118_low60_40_low20_10 = f_118_low60_40_low20_9,
    u_158_168 = u_158_167,
    v_158_168 = v_158_167,
    g_118_low60_40_low20_10 * (const 64 2) = g_118_low60_40_low20_9 + f_118_low60_40_low20_9,
    r_158_168 * (const 64 2) = r_158_167 + u_158_167,
    s_158_168 * (const 64 2) = s_158_167 + v_158_167
;

assume
    f_118_low60_40_low20_10 = f_118_low60_40_low20_9,
    u_158_168 = u_158_167,
    v_158_168 = v_158_167,
    g_118_low60_40_low20_10 * 2 = g_118_low60_40_low20_9 + f_118_low60_40_low20_9,
    r_158_168 * 2 = r_158_167 + u_158_167,
    s_158_168 * 2 = s_158_167 + v_158_167
&&
    true
;

{
    u_158_168 * f_118_low60_40_low20_0 + v_158_168 * g_118_low60_40_low20_0 = f_118_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_168 * f_118_low60_40_low20_0 + s_158_168 * g_118_low60_40_low20_0 = g_118_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_10 + u_158_168 * (const 64 (2**21)) + v_158_168 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_10 + r_158_168 * (const 64 (2**21)) + s_158_168 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_10,
    f_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_10,
    g_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 168)) <=s delta, delta <=s (const 64 (1 + 2*168)),
    (const 64 (-(2**20))) <=s u_158_168, u_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_168, v_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_168, r_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_168, s_158_168 <=s (const 64 ((2**20))),
    u_158_168 + v_158_168 <=s (const 64 (2**20)),
    u_158_168 - v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 + v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 - v_158_168 <=s (const 64 (2**20)),
    r_158_168 + s_158_168 <=s (const 64 (2**20)),
    r_158_168 - s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 + s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 - s_158_168 <=s (const 64 (2**20)),
    u_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_158_168 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_167_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_9,
sint64 g_118_low60_40_low20_9,
sint64 f_118_low60_40_low20_10,
sint64 g_118_low60_40_low20_10,
sint64 u_158_167,
sint64 v_158_167,
sint64 r_158_167,
sint64 s_158_167,
sint64 u_158_168,
sint64 v_158_168,
sint64 r_158_168,
sint64 s_158_168,
bit ne
)={
    u_158_167 * f_118_low60_40_low20_0 + v_158_167 * g_118_low60_40_low20_0 = f_118_low60_40_low20_9 * (-(2**20)),
    r_158_167 * f_118_low60_40_low20_0 + s_158_167 * g_118_low60_40_low20_0 = g_118_low60_40_low20_9 * (-(2**20))
&&
    u_158_167 * f_118_low60_40_low20_0 + v_158_167 * g_118_low60_40_low20_0 = f_118_low60_40_low20_9 * (const 64 (-(2**20))),
    r_158_167 * f_118_low60_40_low20_0 + s_158_167 * g_118_low60_40_low20_0 = g_118_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_9 + u_158_167 * (const 64 (2**21)) + v_158_167 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_9 + r_158_167 * (const 64 (2**21)) + s_158_167 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_9,
    f_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_9,
    g_118_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 167)) <=s delta, delta <=s (const 64 (1 + 2*167)),
    (const 64 (-(2**20))) <=s u_158_167, u_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_167, v_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_167, r_158_167 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_167, s_158_167 <=s (const 64 ((2**20))),
    u_158_167 + v_158_167 <=s (const 64 (2**20)),
    u_158_167 - v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 + v_158_167 <=s (const 64 (2**20)),
    (const 64 0) - u_158_167 - v_158_167 <=s (const 64 (2**20)),
    r_158_167 + s_158_167 <=s (const 64 (2**20)),
    r_158_167 - s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 + s_158_167 <=s (const 64 (2**20)),
    (const 64 0) - r_158_167 - s_158_167 <=s (const 64 (2**20)),
    u_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_158_167 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_158_167 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise c
assume
g_118_low60_40_low20_9 = 1 (mod 2)
&&
g_118_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_10 g_118_low60_40_low20_9;
mov u_158_168 r_158_167;
mov v_158_168 s_158_167;

subs dc g_118_low60_40_low20_10 g_118_low60_40_low20_9 f_118_low60_40_low20_9;
asr g_118_low60_40_low20_10 g_118_low60_40_low20_10 1;
subs dc r_158_168 r_158_167 u_158_167;
asr r_158_168 r_158_168 1;
subs dc s_158_168 s_158_167 v_158_167;
asr s_158_168 s_158_168 1;
assert
    true
&&
    f_118_low60_40_low20_10 = g_118_low60_40_low20_9,
    u_158_168 = r_158_167,
    v_158_168 = s_158_167,
    g_118_low60_40_low20_10 * (const 64 2) = g_118_low60_40_low20_9 - f_118_low60_40_low20_9,
    r_158_168 * (const 64 2) = r_158_167 - u_158_167,
    s_158_168 * (const 64 2) = s_158_167 - v_158_167
;

assume
    f_118_low60_40_low20_10 = g_118_low60_40_low20_9,
    u_158_168 = r_158_167,
    v_158_168 = s_158_167,
    g_118_low60_40_low20_10 * 2 = g_118_low60_40_low20_9 - f_118_low60_40_low20_9,
    r_158_168 * 2 = r_158_167 - u_158_167,
    s_158_168 * 2 = s_158_167 - v_158_167
&&
    true
;

{
    u_158_168 * f_118_low60_40_low20_0 + v_158_168 * g_118_low60_40_low20_0 = f_118_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_168 * f_118_low60_40_low20_0 + s_158_168 * g_118_low60_40_low20_0 = g_118_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_10 + u_158_168 * (const 64 (2**21)) + v_158_168 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_10 + r_158_168 * (const 64 (2**21)) + s_158_168 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_10,
    f_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_10,
    g_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 168)) <=s delta, delta <=s (const 64 (1 + 2*168)),
    (const 64 (-(2**20))) <=s u_158_168, u_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_168, v_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_168, r_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_168, s_158_168 <=s (const 64 ((2**20))),
    u_158_168 + v_158_168 <=s (const 64 (2**20)),
    u_158_168 - v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 + v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 - v_158_168 <=s (const 64 (2**20)),
    r_158_168 + s_158_168 <=s (const 64 (2**20)),
    r_158_168 - s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 + s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 - s_158_168 <=s (const 64 (2**20)),
    u_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_158_168 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_168_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_10,
sint64 g_118_low60_40_low20_10,
sint64 f_118_low60_40_low20_11,
sint64 g_118_low60_40_low20_11,
sint64 u_158_168,
sint64 v_158_168,
sint64 r_158_168,
sint64 s_158_168,
sint64 u_158_169,
sint64 v_158_169,
sint64 r_158_169,
sint64 s_158_169,
bit ne
)={
    u_158_168 * f_118_low60_40_low20_0 + v_158_168 * g_118_low60_40_low20_0 = f_118_low60_40_low20_10 * (-(2**20)),
    r_158_168 * f_118_low60_40_low20_0 + s_158_168 * g_118_low60_40_low20_0 = g_118_low60_40_low20_10 * (-(2**20))
&&
    u_158_168 * f_118_low60_40_low20_0 + v_158_168 * g_118_low60_40_low20_0 = f_118_low60_40_low20_10 * (const 64 (-(2**20))),
    r_158_168 * f_118_low60_40_low20_0 + s_158_168 * g_118_low60_40_low20_0 = g_118_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_10 + u_158_168 * (const 64 (2**21)) + v_158_168 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_10 + r_158_168 * (const 64 (2**21)) + s_158_168 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_10,
    f_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_10,
    g_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 168)) <=s delta, delta <=s (const 64 (1 + 2*168)),
    (const 64 (-(2**20))) <=s u_158_168, u_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_168, v_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_168, r_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_168, s_158_168 <=s (const 64 ((2**20))),
    u_158_168 + v_158_168 <=s (const 64 (2**20)),
    u_158_168 - v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 + v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 - v_158_168 <=s (const 64 (2**20)),
    r_158_168 + s_158_168 <=s (const 64 (2**20)),
    r_158_168 - s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 + s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 - s_158_168 <=s (const 64 (2**20)),
    u_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_158_168 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise a
assume
g_118_low60_40_low20_10 = 0 (mod 2)
&&
g_118_low60_40_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_11 f_118_low60_40_low20_10;
mov u_158_169 u_158_168;
mov v_158_169 v_158_168;

asr g_118_low60_40_low20_11 g_118_low60_40_low20_10 1;
asr r_158_169 r_158_168 1;
asr s_158_169 s_158_168 1;
assert
    true
&&
    f_118_low60_40_low20_11 = f_118_low60_40_low20_10,
    u_158_169 = u_158_168,
    v_158_169 = v_158_168,
    g_118_low60_40_low20_11 * (const 64 2) = g_118_low60_40_low20_10,
    r_158_169 * (const 64 2) = r_158_168,
    s_158_169 * (const 64 2) = s_158_168
;

assume
    f_118_low60_40_low20_11 = f_118_low60_40_low20_10,
    u_158_169 = u_158_168,
    v_158_169 = v_158_168,
    g_118_low60_40_low20_11 * 2 = g_118_low60_40_low20_10,
    r_158_169 * 2 = r_158_168,
    s_158_169 * 2 = s_158_168
&&
    true
;

{
    u_158_169 * f_118_low60_40_low20_0 + v_158_169 * g_118_low60_40_low20_0 = f_118_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_169 * f_118_low60_40_low20_0 + s_158_169 * g_118_low60_40_low20_0 = g_118_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_11 + u_158_169 * (const 64 (2**21)) + v_158_169 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_11 + r_158_169 * (const 64 (2**21)) + s_158_169 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_11,
    f_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_11,
    g_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 169)) <=s delta, delta <=s (const 64 (1 + 2*169)),
    (const 64 (-(2**20))) <=s u_158_169, u_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_169, v_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_169, r_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_169, s_158_169 <=s (const 64 ((2**20))),
    u_158_169 + v_158_169 <=s (const 64 (2**20)),
    u_158_169 - v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 + v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 - v_158_169 <=s (const 64 (2**20)),
    r_158_169 + s_158_169 <=s (const 64 (2**20)),
    r_158_169 - s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 + s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 - s_158_169 <=s (const 64 (2**20)),
    u_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_158_169 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_168_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_10,
sint64 g_118_low60_40_low20_10,
sint64 f_118_low60_40_low20_11,
sint64 g_118_low60_40_low20_11,
sint64 u_158_168,
sint64 v_158_168,
sint64 r_158_168,
sint64 s_158_168,
sint64 u_158_169,
sint64 v_158_169,
sint64 r_158_169,
sint64 s_158_169,
bit ne
)={
    u_158_168 * f_118_low60_40_low20_0 + v_158_168 * g_118_low60_40_low20_0 = f_118_low60_40_low20_10 * (-(2**20)),
    r_158_168 * f_118_low60_40_low20_0 + s_158_168 * g_118_low60_40_low20_0 = g_118_low60_40_low20_10 * (-(2**20))
&&
    u_158_168 * f_118_low60_40_low20_0 + v_158_168 * g_118_low60_40_low20_0 = f_118_low60_40_low20_10 * (const 64 (-(2**20))),
    r_158_168 * f_118_low60_40_low20_0 + s_158_168 * g_118_low60_40_low20_0 = g_118_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_10 + u_158_168 * (const 64 (2**21)) + v_158_168 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_10 + r_158_168 * (const 64 (2**21)) + s_158_168 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_10,
    f_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_10,
    g_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 168)) <=s delta, delta <=s (const 64 (1 + 2*168)),
    (const 64 (-(2**20))) <=s u_158_168, u_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_168, v_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_168, r_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_168, s_158_168 <=s (const 64 ((2**20))),
    u_158_168 + v_158_168 <=s (const 64 (2**20)),
    u_158_168 - v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 + v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 - v_158_168 <=s (const 64 (2**20)),
    r_158_168 + s_158_168 <=s (const 64 (2**20)),
    r_158_168 - s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 + s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 - s_158_168 <=s (const 64 (2**20)),
    u_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_158_168 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise b
assume
g_118_low60_40_low20_10 = 1 (mod 2)
&&
g_118_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_11 f_118_low60_40_low20_10;
mov u_158_169 u_158_168;
mov v_158_169 v_158_168;

add g_118_low60_40_low20_11 g_118_low60_40_low20_10 f_118_low60_40_low20_10;
asr g_118_low60_40_low20_11 g_118_low60_40_low20_11 1;
add r_158_169 r_158_168 u_158_168;
asr r_158_169 r_158_169 1;
add s_158_169 s_158_168 v_158_168;
asr s_158_169 s_158_169 1;
assert
    true
&&
    f_118_low60_40_low20_11 = f_118_low60_40_low20_10,
    u_158_169 = u_158_168,
    v_158_169 = v_158_168,
    g_118_low60_40_low20_11 * (const 64 2) = g_118_low60_40_low20_10 + f_118_low60_40_low20_10,
    r_158_169 * (const 64 2) = r_158_168 + u_158_168,
    s_158_169 * (const 64 2) = s_158_168 + v_158_168
;

assume
    f_118_low60_40_low20_11 = f_118_low60_40_low20_10,
    u_158_169 = u_158_168,
    v_158_169 = v_158_168,
    g_118_low60_40_low20_11 * 2 = g_118_low60_40_low20_10 + f_118_low60_40_low20_10,
    r_158_169 * 2 = r_158_168 + u_158_168,
    s_158_169 * 2 = s_158_168 + v_158_168
&&
    true
;

{
    u_158_169 * f_118_low60_40_low20_0 + v_158_169 * g_118_low60_40_low20_0 = f_118_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_169 * f_118_low60_40_low20_0 + s_158_169 * g_118_low60_40_low20_0 = g_118_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_11 + u_158_169 * (const 64 (2**21)) + v_158_169 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_11 + r_158_169 * (const 64 (2**21)) + s_158_169 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_11,
    f_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_11,
    g_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 169)) <=s delta, delta <=s (const 64 (1 + 2*169)),
    (const 64 (-(2**20))) <=s u_158_169, u_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_169, v_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_169, r_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_169, s_158_169 <=s (const 64 ((2**20))),
    u_158_169 + v_158_169 <=s (const 64 (2**20)),
    u_158_169 - v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 + v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 - v_158_169 <=s (const 64 (2**20)),
    r_158_169 + s_158_169 <=s (const 64 (2**20)),
    r_158_169 - s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 + s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 - s_158_169 <=s (const 64 (2**20)),
    u_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_158_169 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_168_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_10,
sint64 g_118_low60_40_low20_10,
sint64 f_118_low60_40_low20_11,
sint64 g_118_low60_40_low20_11,
sint64 u_158_168,
sint64 v_158_168,
sint64 r_158_168,
sint64 s_158_168,
sint64 u_158_169,
sint64 v_158_169,
sint64 r_158_169,
sint64 s_158_169,
bit ne
)={
    u_158_168 * f_118_low60_40_low20_0 + v_158_168 * g_118_low60_40_low20_0 = f_118_low60_40_low20_10 * (-(2**20)),
    r_158_168 * f_118_low60_40_low20_0 + s_158_168 * g_118_low60_40_low20_0 = g_118_low60_40_low20_10 * (-(2**20))
&&
    u_158_168 * f_118_low60_40_low20_0 + v_158_168 * g_118_low60_40_low20_0 = f_118_low60_40_low20_10 * (const 64 (-(2**20))),
    r_158_168 * f_118_low60_40_low20_0 + s_158_168 * g_118_low60_40_low20_0 = g_118_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_10 + u_158_168 * (const 64 (2**21)) + v_158_168 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_10 + r_158_168 * (const 64 (2**21)) + s_158_168 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_10,
    f_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_10,
    g_118_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 168)) <=s delta, delta <=s (const 64 (1 + 2*168)),
    (const 64 (-(2**20))) <=s u_158_168, u_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_168, v_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_168, r_158_168 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_168, s_158_168 <=s (const 64 ((2**20))),
    u_158_168 + v_158_168 <=s (const 64 (2**20)),
    u_158_168 - v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 + v_158_168 <=s (const 64 (2**20)),
    (const 64 0) - u_158_168 - v_158_168 <=s (const 64 (2**20)),
    r_158_168 + s_158_168 <=s (const 64 (2**20)),
    r_158_168 - s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 + s_158_168 <=s (const 64 (2**20)),
    (const 64 0) - r_158_168 - s_158_168 <=s (const 64 (2**20)),
    u_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_158_168 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_158_168 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise c
assume
g_118_low60_40_low20_10 = 1 (mod 2)
&&
g_118_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_11 g_118_low60_40_low20_10;
mov u_158_169 r_158_168;
mov v_158_169 s_158_168;

subs dc g_118_low60_40_low20_11 g_118_low60_40_low20_10 f_118_low60_40_low20_10;
asr g_118_low60_40_low20_11 g_118_low60_40_low20_11 1;
subs dc r_158_169 r_158_168 u_158_168;
asr r_158_169 r_158_169 1;
subs dc s_158_169 s_158_168 v_158_168;
asr s_158_169 s_158_169 1;
assert
    true
&&
    f_118_low60_40_low20_11 = g_118_low60_40_low20_10,
    u_158_169 = r_158_168,
    v_158_169 = s_158_168,
    g_118_low60_40_low20_11 * (const 64 2) = g_118_low60_40_low20_10 - f_118_low60_40_low20_10,
    r_158_169 * (const 64 2) = r_158_168 - u_158_168,
    s_158_169 * (const 64 2) = s_158_168 - v_158_168
;

assume
    f_118_low60_40_low20_11 = g_118_low60_40_low20_10,
    u_158_169 = r_158_168,
    v_158_169 = s_158_168,
    g_118_low60_40_low20_11 * 2 = g_118_low60_40_low20_10 - f_118_low60_40_low20_10,
    r_158_169 * 2 = r_158_168 - u_158_168,
    s_158_169 * 2 = s_158_168 - v_158_168
&&
    true
;

{
    u_158_169 * f_118_low60_40_low20_0 + v_158_169 * g_118_low60_40_low20_0 = f_118_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_169 * f_118_low60_40_low20_0 + s_158_169 * g_118_low60_40_low20_0 = g_118_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_11 + u_158_169 * (const 64 (2**21)) + v_158_169 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_11 + r_158_169 * (const 64 (2**21)) + s_158_169 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_11,
    f_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_11,
    g_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 169)) <=s delta, delta <=s (const 64 (1 + 2*169)),
    (const 64 (-(2**20))) <=s u_158_169, u_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_169, v_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_169, r_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_169, s_158_169 <=s (const 64 ((2**20))),
    u_158_169 + v_158_169 <=s (const 64 (2**20)),
    u_158_169 - v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 + v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 - v_158_169 <=s (const 64 (2**20)),
    r_158_169 + s_158_169 <=s (const 64 (2**20)),
    r_158_169 - s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 + s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 - s_158_169 <=s (const 64 (2**20)),
    u_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_158_169 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_169_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_11,
sint64 g_118_low60_40_low20_11,
sint64 f_118_low60_40_low20_12,
sint64 g_118_low60_40_low20_12,
sint64 u_158_169,
sint64 v_158_169,
sint64 r_158_169,
sint64 s_158_169,
sint64 u_158_170,
sint64 v_158_170,
sint64 r_158_170,
sint64 s_158_170,
bit ne
)={
    u_158_169 * f_118_low60_40_low20_0 + v_158_169 * g_118_low60_40_low20_0 = f_118_low60_40_low20_11 * (-(2**20)),
    r_158_169 * f_118_low60_40_low20_0 + s_158_169 * g_118_low60_40_low20_0 = g_118_low60_40_low20_11 * (-(2**20))
&&
    u_158_169 * f_118_low60_40_low20_0 + v_158_169 * g_118_low60_40_low20_0 = f_118_low60_40_low20_11 * (const 64 (-(2**20))),
    r_158_169 * f_118_low60_40_low20_0 + s_158_169 * g_118_low60_40_low20_0 = g_118_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_11 + u_158_169 * (const 64 (2**21)) + v_158_169 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_11 + r_158_169 * (const 64 (2**21)) + s_158_169 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_11,
    f_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_11,
    g_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 169)) <=s delta, delta <=s (const 64 (1 + 2*169)),
    (const 64 (-(2**20))) <=s u_158_169, u_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_169, v_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_169, r_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_169, s_158_169 <=s (const 64 ((2**20))),
    u_158_169 + v_158_169 <=s (const 64 (2**20)),
    u_158_169 - v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 + v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 - v_158_169 <=s (const 64 (2**20)),
    r_158_169 + s_158_169 <=s (const 64 (2**20)),
    r_158_169 - s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 + s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 - s_158_169 <=s (const 64 (2**20)),
    u_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_158_169 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise a
assume
g_118_low60_40_low20_11 = 0 (mod 2)
&&
g_118_low60_40_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_12 f_118_low60_40_low20_11;
mov u_158_170 u_158_169;
mov v_158_170 v_158_169;

asr g_118_low60_40_low20_12 g_118_low60_40_low20_11 1;
asr r_158_170 r_158_169 1;
asr s_158_170 s_158_169 1;
assert
    true
&&
    f_118_low60_40_low20_12 = f_118_low60_40_low20_11,
    u_158_170 = u_158_169,
    v_158_170 = v_158_169,
    g_118_low60_40_low20_12 * (const 64 2) = g_118_low60_40_low20_11,
    r_158_170 * (const 64 2) = r_158_169,
    s_158_170 * (const 64 2) = s_158_169
;

assume
    f_118_low60_40_low20_12 = f_118_low60_40_low20_11,
    u_158_170 = u_158_169,
    v_158_170 = v_158_169,
    g_118_low60_40_low20_12 * 2 = g_118_low60_40_low20_11,
    r_158_170 * 2 = r_158_169,
    s_158_170 * 2 = s_158_169
&&
    true
;

{
    u_158_170 * f_118_low60_40_low20_0 + v_158_170 * g_118_low60_40_low20_0 = f_118_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_170 * f_118_low60_40_low20_0 + s_158_170 * g_118_low60_40_low20_0 = g_118_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_12 + u_158_170 * (const 64 (2**21)) + v_158_170 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_12 + r_158_170 * (const 64 (2**21)) + s_158_170 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_12,
    f_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_12,
    g_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 170)) <=s delta, delta <=s (const 64 (1 + 2*170)),
    (const 64 (-(2**20))) <=s u_158_170, u_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_170, v_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_170, r_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_170, s_158_170 <=s (const 64 ((2**20))),
    u_158_170 + v_158_170 <=s (const 64 (2**20)),
    u_158_170 - v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 + v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 - v_158_170 <=s (const 64 (2**20)),
    r_158_170 + s_158_170 <=s (const 64 (2**20)),
    r_158_170 - s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 + s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 - s_158_170 <=s (const 64 (2**20)),
    u_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_158_170 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_169_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_11,
sint64 g_118_low60_40_low20_11,
sint64 f_118_low60_40_low20_12,
sint64 g_118_low60_40_low20_12,
sint64 u_158_169,
sint64 v_158_169,
sint64 r_158_169,
sint64 s_158_169,
sint64 u_158_170,
sint64 v_158_170,
sint64 r_158_170,
sint64 s_158_170,
bit ne
)={
    u_158_169 * f_118_low60_40_low20_0 + v_158_169 * g_118_low60_40_low20_0 = f_118_low60_40_low20_11 * (-(2**20)),
    r_158_169 * f_118_low60_40_low20_0 + s_158_169 * g_118_low60_40_low20_0 = g_118_low60_40_low20_11 * (-(2**20))
&&
    u_158_169 * f_118_low60_40_low20_0 + v_158_169 * g_118_low60_40_low20_0 = f_118_low60_40_low20_11 * (const 64 (-(2**20))),
    r_158_169 * f_118_low60_40_low20_0 + s_158_169 * g_118_low60_40_low20_0 = g_118_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_11 + u_158_169 * (const 64 (2**21)) + v_158_169 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_11 + r_158_169 * (const 64 (2**21)) + s_158_169 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_11,
    f_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_11,
    g_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 169)) <=s delta, delta <=s (const 64 (1 + 2*169)),
    (const 64 (-(2**20))) <=s u_158_169, u_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_169, v_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_169, r_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_169, s_158_169 <=s (const 64 ((2**20))),
    u_158_169 + v_158_169 <=s (const 64 (2**20)),
    u_158_169 - v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 + v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 - v_158_169 <=s (const 64 (2**20)),
    r_158_169 + s_158_169 <=s (const 64 (2**20)),
    r_158_169 - s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 + s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 - s_158_169 <=s (const 64 (2**20)),
    u_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_158_169 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise b
assume
g_118_low60_40_low20_11 = 1 (mod 2)
&&
g_118_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_12 f_118_low60_40_low20_11;
mov u_158_170 u_158_169;
mov v_158_170 v_158_169;

add g_118_low60_40_low20_12 g_118_low60_40_low20_11 f_118_low60_40_low20_11;
asr g_118_low60_40_low20_12 g_118_low60_40_low20_12 1;
add r_158_170 r_158_169 u_158_169;
asr r_158_170 r_158_170 1;
add s_158_170 s_158_169 v_158_169;
asr s_158_170 s_158_170 1;
assert
    true
&&
    f_118_low60_40_low20_12 = f_118_low60_40_low20_11,
    u_158_170 = u_158_169,
    v_158_170 = v_158_169,
    g_118_low60_40_low20_12 * (const 64 2) = g_118_low60_40_low20_11 + f_118_low60_40_low20_11,
    r_158_170 * (const 64 2) = r_158_169 + u_158_169,
    s_158_170 * (const 64 2) = s_158_169 + v_158_169
;

assume
    f_118_low60_40_low20_12 = f_118_low60_40_low20_11,
    u_158_170 = u_158_169,
    v_158_170 = v_158_169,
    g_118_low60_40_low20_12 * 2 = g_118_low60_40_low20_11 + f_118_low60_40_low20_11,
    r_158_170 * 2 = r_158_169 + u_158_169,
    s_158_170 * 2 = s_158_169 + v_158_169
&&
    true
;

{
    u_158_170 * f_118_low60_40_low20_0 + v_158_170 * g_118_low60_40_low20_0 = f_118_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_170 * f_118_low60_40_low20_0 + s_158_170 * g_118_low60_40_low20_0 = g_118_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_12 + u_158_170 * (const 64 (2**21)) + v_158_170 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_12 + r_158_170 * (const 64 (2**21)) + s_158_170 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_12,
    f_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_12,
    g_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 170)) <=s delta, delta <=s (const 64 (1 + 2*170)),
    (const 64 (-(2**20))) <=s u_158_170, u_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_170, v_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_170, r_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_170, s_158_170 <=s (const 64 ((2**20))),
    u_158_170 + v_158_170 <=s (const 64 (2**20)),
    u_158_170 - v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 + v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 - v_158_170 <=s (const 64 (2**20)),
    r_158_170 + s_158_170 <=s (const 64 (2**20)),
    r_158_170 - s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 + s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 - s_158_170 <=s (const 64 (2**20)),
    u_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_158_170 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_169_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_11,
sint64 g_118_low60_40_low20_11,
sint64 f_118_low60_40_low20_12,
sint64 g_118_low60_40_low20_12,
sint64 u_158_169,
sint64 v_158_169,
sint64 r_158_169,
sint64 s_158_169,
sint64 u_158_170,
sint64 v_158_170,
sint64 r_158_170,
sint64 s_158_170,
bit ne
)={
    u_158_169 * f_118_low60_40_low20_0 + v_158_169 * g_118_low60_40_low20_0 = f_118_low60_40_low20_11 * (-(2**20)),
    r_158_169 * f_118_low60_40_low20_0 + s_158_169 * g_118_low60_40_low20_0 = g_118_low60_40_low20_11 * (-(2**20))
&&
    u_158_169 * f_118_low60_40_low20_0 + v_158_169 * g_118_low60_40_low20_0 = f_118_low60_40_low20_11 * (const 64 (-(2**20))),
    r_158_169 * f_118_low60_40_low20_0 + s_158_169 * g_118_low60_40_low20_0 = g_118_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_11 + u_158_169 * (const 64 (2**21)) + v_158_169 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_11 + r_158_169 * (const 64 (2**21)) + s_158_169 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_11,
    f_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_11,
    g_118_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 169)) <=s delta, delta <=s (const 64 (1 + 2*169)),
    (const 64 (-(2**20))) <=s u_158_169, u_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_169, v_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_169, r_158_169 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_169, s_158_169 <=s (const 64 ((2**20))),
    u_158_169 + v_158_169 <=s (const 64 (2**20)),
    u_158_169 - v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 + v_158_169 <=s (const 64 (2**20)),
    (const 64 0) - u_158_169 - v_158_169 <=s (const 64 (2**20)),
    r_158_169 + s_158_169 <=s (const 64 (2**20)),
    r_158_169 - s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 + s_158_169 <=s (const 64 (2**20)),
    (const 64 0) - r_158_169 - s_158_169 <=s (const 64 (2**20)),
    u_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_158_169 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_158_169 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise c
assume
g_118_low60_40_low20_11 = 1 (mod 2)
&&
g_118_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_12 g_118_low60_40_low20_11;
mov u_158_170 r_158_169;
mov v_158_170 s_158_169;

subs dc g_118_low60_40_low20_12 g_118_low60_40_low20_11 f_118_low60_40_low20_11;
asr g_118_low60_40_low20_12 g_118_low60_40_low20_12 1;
subs dc r_158_170 r_158_169 u_158_169;
asr r_158_170 r_158_170 1;
subs dc s_158_170 s_158_169 v_158_169;
asr s_158_170 s_158_170 1;
assert
    true
&&
    f_118_low60_40_low20_12 = g_118_low60_40_low20_11,
    u_158_170 = r_158_169,
    v_158_170 = s_158_169,
    g_118_low60_40_low20_12 * (const 64 2) = g_118_low60_40_low20_11 - f_118_low60_40_low20_11,
    r_158_170 * (const 64 2) = r_158_169 - u_158_169,
    s_158_170 * (const 64 2) = s_158_169 - v_158_169
;

assume
    f_118_low60_40_low20_12 = g_118_low60_40_low20_11,
    u_158_170 = r_158_169,
    v_158_170 = s_158_169,
    g_118_low60_40_low20_12 * 2 = g_118_low60_40_low20_11 - f_118_low60_40_low20_11,
    r_158_170 * 2 = r_158_169 - u_158_169,
    s_158_170 * 2 = s_158_169 - v_158_169
&&
    true
;

{
    u_158_170 * f_118_low60_40_low20_0 + v_158_170 * g_118_low60_40_low20_0 = f_118_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_170 * f_118_low60_40_low20_0 + s_158_170 * g_118_low60_40_low20_0 = g_118_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_12 + u_158_170 * (const 64 (2**21)) + v_158_170 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_12 + r_158_170 * (const 64 (2**21)) + s_158_170 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_12,
    f_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_12,
    g_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 170)) <=s delta, delta <=s (const 64 (1 + 2*170)),
    (const 64 (-(2**20))) <=s u_158_170, u_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_170, v_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_170, r_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_170, s_158_170 <=s (const 64 ((2**20))),
    u_158_170 + v_158_170 <=s (const 64 (2**20)),
    u_158_170 - v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 + v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 - v_158_170 <=s (const 64 (2**20)),
    r_158_170 + s_158_170 <=s (const 64 (2**20)),
    r_158_170 - s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 + s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 - s_158_170 <=s (const 64 (2**20)),
    u_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_158_170 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_170_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_12,
sint64 g_118_low60_40_low20_12,
sint64 f_118_low60_40_low20_13,
sint64 g_118_low60_40_low20_13,
sint64 u_158_170,
sint64 v_158_170,
sint64 r_158_170,
sint64 s_158_170,
sint64 u_158_171,
sint64 v_158_171,
sint64 r_158_171,
sint64 s_158_171,
bit ne
)={
    u_158_170 * f_118_low60_40_low20_0 + v_158_170 * g_118_low60_40_low20_0 = f_118_low60_40_low20_12 * (-(2**20)),
    r_158_170 * f_118_low60_40_low20_0 + s_158_170 * g_118_low60_40_low20_0 = g_118_low60_40_low20_12 * (-(2**20))
&&
    u_158_170 * f_118_low60_40_low20_0 + v_158_170 * g_118_low60_40_low20_0 = f_118_low60_40_low20_12 * (const 64 (-(2**20))),
    r_158_170 * f_118_low60_40_low20_0 + s_158_170 * g_118_low60_40_low20_0 = g_118_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_12 + u_158_170 * (const 64 (2**21)) + v_158_170 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_12 + r_158_170 * (const 64 (2**21)) + s_158_170 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_12,
    f_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_12,
    g_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 170)) <=s delta, delta <=s (const 64 (1 + 2*170)),
    (const 64 (-(2**20))) <=s u_158_170, u_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_170, v_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_170, r_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_170, s_158_170 <=s (const 64 ((2**20))),
    u_158_170 + v_158_170 <=s (const 64 (2**20)),
    u_158_170 - v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 + v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 - v_158_170 <=s (const 64 (2**20)),
    r_158_170 + s_158_170 <=s (const 64 (2**20)),
    r_158_170 - s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 + s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 - s_158_170 <=s (const 64 (2**20)),
    u_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_158_170 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise a
assume
g_118_low60_40_low20_12 = 0 (mod 2)
&&
g_118_low60_40_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_13 f_118_low60_40_low20_12;
mov u_158_171 u_158_170;
mov v_158_171 v_158_170;

asr g_118_low60_40_low20_13 g_118_low60_40_low20_12 1;
asr r_158_171 r_158_170 1;
asr s_158_171 s_158_170 1;
assert
    true
&&
    f_118_low60_40_low20_13 = f_118_low60_40_low20_12,
    u_158_171 = u_158_170,
    v_158_171 = v_158_170,
    g_118_low60_40_low20_13 * (const 64 2) = g_118_low60_40_low20_12,
    r_158_171 * (const 64 2) = r_158_170,
    s_158_171 * (const 64 2) = s_158_170
;

assume
    f_118_low60_40_low20_13 = f_118_low60_40_low20_12,
    u_158_171 = u_158_170,
    v_158_171 = v_158_170,
    g_118_low60_40_low20_13 * 2 = g_118_low60_40_low20_12,
    r_158_171 * 2 = r_158_170,
    s_158_171 * 2 = s_158_170
&&
    true
;

{
    u_158_171 * f_118_low60_40_low20_0 + v_158_171 * g_118_low60_40_low20_0 = f_118_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_171 * f_118_low60_40_low20_0 + s_158_171 * g_118_low60_40_low20_0 = g_118_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_13 + u_158_171 * (const 64 (2**21)) + v_158_171 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_13 + r_158_171 * (const 64 (2**21)) + s_158_171 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_13,
    f_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_13,
    g_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 171)) <=s delta, delta <=s (const 64 (1 + 2*171)),
    (const 64 (-(2**20))) <=s u_158_171, u_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_171, v_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_171, r_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_171, s_158_171 <=s (const 64 ((2**20))),
    u_158_171 + v_158_171 <=s (const 64 (2**20)),
    u_158_171 - v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 + v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 - v_158_171 <=s (const 64 (2**20)),
    r_158_171 + s_158_171 <=s (const 64 (2**20)),
    r_158_171 - s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 + s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 - s_158_171 <=s (const 64 (2**20)),
    u_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_158_171 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_170_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_12,
sint64 g_118_low60_40_low20_12,
sint64 f_118_low60_40_low20_13,
sint64 g_118_low60_40_low20_13,
sint64 u_158_170,
sint64 v_158_170,
sint64 r_158_170,
sint64 s_158_170,
sint64 u_158_171,
sint64 v_158_171,
sint64 r_158_171,
sint64 s_158_171,
bit ne
)={
    u_158_170 * f_118_low60_40_low20_0 + v_158_170 * g_118_low60_40_low20_0 = f_118_low60_40_low20_12 * (-(2**20)),
    r_158_170 * f_118_low60_40_low20_0 + s_158_170 * g_118_low60_40_low20_0 = g_118_low60_40_low20_12 * (-(2**20))
&&
    u_158_170 * f_118_low60_40_low20_0 + v_158_170 * g_118_low60_40_low20_0 = f_118_low60_40_low20_12 * (const 64 (-(2**20))),
    r_158_170 * f_118_low60_40_low20_0 + s_158_170 * g_118_low60_40_low20_0 = g_118_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_12 + u_158_170 * (const 64 (2**21)) + v_158_170 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_12 + r_158_170 * (const 64 (2**21)) + s_158_170 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_12,
    f_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_12,
    g_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 170)) <=s delta, delta <=s (const 64 (1 + 2*170)),
    (const 64 (-(2**20))) <=s u_158_170, u_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_170, v_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_170, r_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_170, s_158_170 <=s (const 64 ((2**20))),
    u_158_170 + v_158_170 <=s (const 64 (2**20)),
    u_158_170 - v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 + v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 - v_158_170 <=s (const 64 (2**20)),
    r_158_170 + s_158_170 <=s (const 64 (2**20)),
    r_158_170 - s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 + s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 - s_158_170 <=s (const 64 (2**20)),
    u_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_158_170 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise b
assume
g_118_low60_40_low20_12 = 1 (mod 2)
&&
g_118_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_13 f_118_low60_40_low20_12;
mov u_158_171 u_158_170;
mov v_158_171 v_158_170;

add g_118_low60_40_low20_13 g_118_low60_40_low20_12 f_118_low60_40_low20_12;
asr g_118_low60_40_low20_13 g_118_low60_40_low20_13 1;
add r_158_171 r_158_170 u_158_170;
asr r_158_171 r_158_171 1;
add s_158_171 s_158_170 v_158_170;
asr s_158_171 s_158_171 1;
assert
    true
&&
    f_118_low60_40_low20_13 = f_118_low60_40_low20_12,
    u_158_171 = u_158_170,
    v_158_171 = v_158_170,
    g_118_low60_40_low20_13 * (const 64 2) = g_118_low60_40_low20_12 + f_118_low60_40_low20_12,
    r_158_171 * (const 64 2) = r_158_170 + u_158_170,
    s_158_171 * (const 64 2) = s_158_170 + v_158_170
;

assume
    f_118_low60_40_low20_13 = f_118_low60_40_low20_12,
    u_158_171 = u_158_170,
    v_158_171 = v_158_170,
    g_118_low60_40_low20_13 * 2 = g_118_low60_40_low20_12 + f_118_low60_40_low20_12,
    r_158_171 * 2 = r_158_170 + u_158_170,
    s_158_171 * 2 = s_158_170 + v_158_170
&&
    true
;

{
    u_158_171 * f_118_low60_40_low20_0 + v_158_171 * g_118_low60_40_low20_0 = f_118_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_171 * f_118_low60_40_low20_0 + s_158_171 * g_118_low60_40_low20_0 = g_118_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_13 + u_158_171 * (const 64 (2**21)) + v_158_171 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_13 + r_158_171 * (const 64 (2**21)) + s_158_171 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_13,
    f_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_13,
    g_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 171)) <=s delta, delta <=s (const 64 (1 + 2*171)),
    (const 64 (-(2**20))) <=s u_158_171, u_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_171, v_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_171, r_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_171, s_158_171 <=s (const 64 ((2**20))),
    u_158_171 + v_158_171 <=s (const 64 (2**20)),
    u_158_171 - v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 + v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 - v_158_171 <=s (const 64 (2**20)),
    r_158_171 + s_158_171 <=s (const 64 (2**20)),
    r_158_171 - s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 + s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 - s_158_171 <=s (const 64 (2**20)),
    u_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_158_171 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_170_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_12,
sint64 g_118_low60_40_low20_12,
sint64 f_118_low60_40_low20_13,
sint64 g_118_low60_40_low20_13,
sint64 u_158_170,
sint64 v_158_170,
sint64 r_158_170,
sint64 s_158_170,
sint64 u_158_171,
sint64 v_158_171,
sint64 r_158_171,
sint64 s_158_171,
bit ne
)={
    u_158_170 * f_118_low60_40_low20_0 + v_158_170 * g_118_low60_40_low20_0 = f_118_low60_40_low20_12 * (-(2**20)),
    r_158_170 * f_118_low60_40_low20_0 + s_158_170 * g_118_low60_40_low20_0 = g_118_low60_40_low20_12 * (-(2**20))
&&
    u_158_170 * f_118_low60_40_low20_0 + v_158_170 * g_118_low60_40_low20_0 = f_118_low60_40_low20_12 * (const 64 (-(2**20))),
    r_158_170 * f_118_low60_40_low20_0 + s_158_170 * g_118_low60_40_low20_0 = g_118_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_12 + u_158_170 * (const 64 (2**21)) + v_158_170 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_12 + r_158_170 * (const 64 (2**21)) + s_158_170 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_12,
    f_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_12,
    g_118_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 170)) <=s delta, delta <=s (const 64 (1 + 2*170)),
    (const 64 (-(2**20))) <=s u_158_170, u_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_170, v_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_170, r_158_170 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_170, s_158_170 <=s (const 64 ((2**20))),
    u_158_170 + v_158_170 <=s (const 64 (2**20)),
    u_158_170 - v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 + v_158_170 <=s (const 64 (2**20)),
    (const 64 0) - u_158_170 - v_158_170 <=s (const 64 (2**20)),
    r_158_170 + s_158_170 <=s (const 64 (2**20)),
    r_158_170 - s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 + s_158_170 <=s (const 64 (2**20)),
    (const 64 0) - r_158_170 - s_158_170 <=s (const 64 (2**20)),
    u_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_158_170 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_158_170 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise c
assume
g_118_low60_40_low20_12 = 1 (mod 2)
&&
g_118_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_13 g_118_low60_40_low20_12;
mov u_158_171 r_158_170;
mov v_158_171 s_158_170;

subs dc g_118_low60_40_low20_13 g_118_low60_40_low20_12 f_118_low60_40_low20_12;
asr g_118_low60_40_low20_13 g_118_low60_40_low20_13 1;
subs dc r_158_171 r_158_170 u_158_170;
asr r_158_171 r_158_171 1;
subs dc s_158_171 s_158_170 v_158_170;
asr s_158_171 s_158_171 1;
assert
    true
&&
    f_118_low60_40_low20_13 = g_118_low60_40_low20_12,
    u_158_171 = r_158_170,
    v_158_171 = s_158_170,
    g_118_low60_40_low20_13 * (const 64 2) = g_118_low60_40_low20_12 - f_118_low60_40_low20_12,
    r_158_171 * (const 64 2) = r_158_170 - u_158_170,
    s_158_171 * (const 64 2) = s_158_170 - v_158_170
;

assume
    f_118_low60_40_low20_13 = g_118_low60_40_low20_12,
    u_158_171 = r_158_170,
    v_158_171 = s_158_170,
    g_118_low60_40_low20_13 * 2 = g_118_low60_40_low20_12 - f_118_low60_40_low20_12,
    r_158_171 * 2 = r_158_170 - u_158_170,
    s_158_171 * 2 = s_158_170 - v_158_170
&&
    true
;

{
    u_158_171 * f_118_low60_40_low20_0 + v_158_171 * g_118_low60_40_low20_0 = f_118_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_171 * f_118_low60_40_low20_0 + s_158_171 * g_118_low60_40_low20_0 = g_118_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_13 + u_158_171 * (const 64 (2**21)) + v_158_171 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_13 + r_158_171 * (const 64 (2**21)) + s_158_171 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_13,
    f_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_13,
    g_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 171)) <=s delta, delta <=s (const 64 (1 + 2*171)),
    (const 64 (-(2**20))) <=s u_158_171, u_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_171, v_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_171, r_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_171, s_158_171 <=s (const 64 ((2**20))),
    u_158_171 + v_158_171 <=s (const 64 (2**20)),
    u_158_171 - v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 + v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 - v_158_171 <=s (const 64 (2**20)),
    r_158_171 + s_158_171 <=s (const 64 (2**20)),
    r_158_171 - s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 + s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 - s_158_171 <=s (const 64 (2**20)),
    u_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_158_171 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_171_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_13,
sint64 g_118_low60_40_low20_13,
sint64 f_118_low60_40_low20_14,
sint64 g_118_low60_40_low20_14,
sint64 u_158_171,
sint64 v_158_171,
sint64 r_158_171,
sint64 s_158_171,
sint64 u_158_172,
sint64 v_158_172,
sint64 r_158_172,
sint64 s_158_172,
bit ne
)={
    u_158_171 * f_118_low60_40_low20_0 + v_158_171 * g_118_low60_40_low20_0 = f_118_low60_40_low20_13 * (-(2**20)),
    r_158_171 * f_118_low60_40_low20_0 + s_158_171 * g_118_low60_40_low20_0 = g_118_low60_40_low20_13 * (-(2**20))
&&
    u_158_171 * f_118_low60_40_low20_0 + v_158_171 * g_118_low60_40_low20_0 = f_118_low60_40_low20_13 * (const 64 (-(2**20))),
    r_158_171 * f_118_low60_40_low20_0 + s_158_171 * g_118_low60_40_low20_0 = g_118_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_13 + u_158_171 * (const 64 (2**21)) + v_158_171 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_13 + r_158_171 * (const 64 (2**21)) + s_158_171 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_13,
    f_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_13,
    g_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 171)) <=s delta, delta <=s (const 64 (1 + 2*171)),
    (const 64 (-(2**20))) <=s u_158_171, u_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_171, v_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_171, r_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_171, s_158_171 <=s (const 64 ((2**20))),
    u_158_171 + v_158_171 <=s (const 64 (2**20)),
    u_158_171 - v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 + v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 - v_158_171 <=s (const 64 (2**20)),
    r_158_171 + s_158_171 <=s (const 64 (2**20)),
    r_158_171 - s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 + s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 - s_158_171 <=s (const 64 (2**20)),
    u_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_158_171 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise a
assume
g_118_low60_40_low20_13 = 0 (mod 2)
&&
g_118_low60_40_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_14 f_118_low60_40_low20_13;
mov u_158_172 u_158_171;
mov v_158_172 v_158_171;

asr g_118_low60_40_low20_14 g_118_low60_40_low20_13 1;
asr r_158_172 r_158_171 1;
asr s_158_172 s_158_171 1;
assert
    true
&&
    f_118_low60_40_low20_14 = f_118_low60_40_low20_13,
    u_158_172 = u_158_171,
    v_158_172 = v_158_171,
    g_118_low60_40_low20_14 * (const 64 2) = g_118_low60_40_low20_13,
    r_158_172 * (const 64 2) = r_158_171,
    s_158_172 * (const 64 2) = s_158_171
;

assume
    f_118_low60_40_low20_14 = f_118_low60_40_low20_13,
    u_158_172 = u_158_171,
    v_158_172 = v_158_171,
    g_118_low60_40_low20_14 * 2 = g_118_low60_40_low20_13,
    r_158_172 * 2 = r_158_171,
    s_158_172 * 2 = s_158_171
&&
    true
;

{
    u_158_172 * f_118_low60_40_low20_0 + v_158_172 * g_118_low60_40_low20_0 = f_118_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_172 * f_118_low60_40_low20_0 + s_158_172 * g_118_low60_40_low20_0 = g_118_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_14 + u_158_172 * (const 64 (2**21)) + v_158_172 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_14 + r_158_172 * (const 64 (2**21)) + s_158_172 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_14,
    f_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_14,
    g_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 172)) <=s delta, delta <=s (const 64 (1 + 2*172)),
    (const 64 (-(2**20))) <=s u_158_172, u_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_172, v_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_172, r_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_172, s_158_172 <=s (const 64 ((2**20))),
    u_158_172 + v_158_172 <=s (const 64 (2**20)),
    u_158_172 - v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 + v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 - v_158_172 <=s (const 64 (2**20)),
    r_158_172 + s_158_172 <=s (const 64 (2**20)),
    r_158_172 - s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 + s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 - s_158_172 <=s (const 64 (2**20)),
    u_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_158_172 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_171_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_13,
sint64 g_118_low60_40_low20_13,
sint64 f_118_low60_40_low20_14,
sint64 g_118_low60_40_low20_14,
sint64 u_158_171,
sint64 v_158_171,
sint64 r_158_171,
sint64 s_158_171,
sint64 u_158_172,
sint64 v_158_172,
sint64 r_158_172,
sint64 s_158_172,
bit ne
)={
    u_158_171 * f_118_low60_40_low20_0 + v_158_171 * g_118_low60_40_low20_0 = f_118_low60_40_low20_13 * (-(2**20)),
    r_158_171 * f_118_low60_40_low20_0 + s_158_171 * g_118_low60_40_low20_0 = g_118_low60_40_low20_13 * (-(2**20))
&&
    u_158_171 * f_118_low60_40_low20_0 + v_158_171 * g_118_low60_40_low20_0 = f_118_low60_40_low20_13 * (const 64 (-(2**20))),
    r_158_171 * f_118_low60_40_low20_0 + s_158_171 * g_118_low60_40_low20_0 = g_118_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_13 + u_158_171 * (const 64 (2**21)) + v_158_171 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_13 + r_158_171 * (const 64 (2**21)) + s_158_171 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_13,
    f_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_13,
    g_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 171)) <=s delta, delta <=s (const 64 (1 + 2*171)),
    (const 64 (-(2**20))) <=s u_158_171, u_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_171, v_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_171, r_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_171, s_158_171 <=s (const 64 ((2**20))),
    u_158_171 + v_158_171 <=s (const 64 (2**20)),
    u_158_171 - v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 + v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 - v_158_171 <=s (const 64 (2**20)),
    r_158_171 + s_158_171 <=s (const 64 (2**20)),
    r_158_171 - s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 + s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 - s_158_171 <=s (const 64 (2**20)),
    u_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_158_171 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise b
assume
g_118_low60_40_low20_13 = 1 (mod 2)
&&
g_118_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_14 f_118_low60_40_low20_13;
mov u_158_172 u_158_171;
mov v_158_172 v_158_171;

add g_118_low60_40_low20_14 g_118_low60_40_low20_13 f_118_low60_40_low20_13;
asr g_118_low60_40_low20_14 g_118_low60_40_low20_14 1;
add r_158_172 r_158_171 u_158_171;
asr r_158_172 r_158_172 1;
add s_158_172 s_158_171 v_158_171;
asr s_158_172 s_158_172 1;
assert
    true
&&
    f_118_low60_40_low20_14 = f_118_low60_40_low20_13,
    u_158_172 = u_158_171,
    v_158_172 = v_158_171,
    g_118_low60_40_low20_14 * (const 64 2) = g_118_low60_40_low20_13 + f_118_low60_40_low20_13,
    r_158_172 * (const 64 2) = r_158_171 + u_158_171,
    s_158_172 * (const 64 2) = s_158_171 + v_158_171
;

assume
    f_118_low60_40_low20_14 = f_118_low60_40_low20_13,
    u_158_172 = u_158_171,
    v_158_172 = v_158_171,
    g_118_low60_40_low20_14 * 2 = g_118_low60_40_low20_13 + f_118_low60_40_low20_13,
    r_158_172 * 2 = r_158_171 + u_158_171,
    s_158_172 * 2 = s_158_171 + v_158_171
&&
    true
;

{
    u_158_172 * f_118_low60_40_low20_0 + v_158_172 * g_118_low60_40_low20_0 = f_118_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_172 * f_118_low60_40_low20_0 + s_158_172 * g_118_low60_40_low20_0 = g_118_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_14 + u_158_172 * (const 64 (2**21)) + v_158_172 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_14 + r_158_172 * (const 64 (2**21)) + s_158_172 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_14,
    f_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_14,
    g_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 172)) <=s delta, delta <=s (const 64 (1 + 2*172)),
    (const 64 (-(2**20))) <=s u_158_172, u_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_172, v_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_172, r_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_172, s_158_172 <=s (const 64 ((2**20))),
    u_158_172 + v_158_172 <=s (const 64 (2**20)),
    u_158_172 - v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 + v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 - v_158_172 <=s (const 64 (2**20)),
    r_158_172 + s_158_172 <=s (const 64 (2**20)),
    r_158_172 - s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 + s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 - s_158_172 <=s (const 64 (2**20)),
    u_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_158_172 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_171_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_13,
sint64 g_118_low60_40_low20_13,
sint64 f_118_low60_40_low20_14,
sint64 g_118_low60_40_low20_14,
sint64 u_158_171,
sint64 v_158_171,
sint64 r_158_171,
sint64 s_158_171,
sint64 u_158_172,
sint64 v_158_172,
sint64 r_158_172,
sint64 s_158_172,
bit ne
)={
    u_158_171 * f_118_low60_40_low20_0 + v_158_171 * g_118_low60_40_low20_0 = f_118_low60_40_low20_13 * (-(2**20)),
    r_158_171 * f_118_low60_40_low20_0 + s_158_171 * g_118_low60_40_low20_0 = g_118_low60_40_low20_13 * (-(2**20))
&&
    u_158_171 * f_118_low60_40_low20_0 + v_158_171 * g_118_low60_40_low20_0 = f_118_low60_40_low20_13 * (const 64 (-(2**20))),
    r_158_171 * f_118_low60_40_low20_0 + s_158_171 * g_118_low60_40_low20_0 = g_118_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_13 + u_158_171 * (const 64 (2**21)) + v_158_171 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_13 + r_158_171 * (const 64 (2**21)) + s_158_171 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_13,
    f_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_13,
    g_118_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 171)) <=s delta, delta <=s (const 64 (1 + 2*171)),
    (const 64 (-(2**20))) <=s u_158_171, u_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_171, v_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_171, r_158_171 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_171, s_158_171 <=s (const 64 ((2**20))),
    u_158_171 + v_158_171 <=s (const 64 (2**20)),
    u_158_171 - v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 + v_158_171 <=s (const 64 (2**20)),
    (const 64 0) - u_158_171 - v_158_171 <=s (const 64 (2**20)),
    r_158_171 + s_158_171 <=s (const 64 (2**20)),
    r_158_171 - s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 + s_158_171 <=s (const 64 (2**20)),
    (const 64 0) - r_158_171 - s_158_171 <=s (const 64 (2**20)),
    u_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_158_171 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_158_171 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise c
assume
g_118_low60_40_low20_13 = 1 (mod 2)
&&
g_118_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_14 g_118_low60_40_low20_13;
mov u_158_172 r_158_171;
mov v_158_172 s_158_171;

subs dc g_118_low60_40_low20_14 g_118_low60_40_low20_13 f_118_low60_40_low20_13;
asr g_118_low60_40_low20_14 g_118_low60_40_low20_14 1;
subs dc r_158_172 r_158_171 u_158_171;
asr r_158_172 r_158_172 1;
subs dc s_158_172 s_158_171 v_158_171;
asr s_158_172 s_158_172 1;
assert
    true
&&
    f_118_low60_40_low20_14 = g_118_low60_40_low20_13,
    u_158_172 = r_158_171,
    v_158_172 = s_158_171,
    g_118_low60_40_low20_14 * (const 64 2) = g_118_low60_40_low20_13 - f_118_low60_40_low20_13,
    r_158_172 * (const 64 2) = r_158_171 - u_158_171,
    s_158_172 * (const 64 2) = s_158_171 - v_158_171
;

assume
    f_118_low60_40_low20_14 = g_118_low60_40_low20_13,
    u_158_172 = r_158_171,
    v_158_172 = s_158_171,
    g_118_low60_40_low20_14 * 2 = g_118_low60_40_low20_13 - f_118_low60_40_low20_13,
    r_158_172 * 2 = r_158_171 - u_158_171,
    s_158_172 * 2 = s_158_171 - v_158_171
&&
    true
;

{
    u_158_172 * f_118_low60_40_low20_0 + v_158_172 * g_118_low60_40_low20_0 = f_118_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_172 * f_118_low60_40_low20_0 + s_158_172 * g_118_low60_40_low20_0 = g_118_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_14 + u_158_172 * (const 64 (2**21)) + v_158_172 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_14 + r_158_172 * (const 64 (2**21)) + s_158_172 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_14,
    f_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_14,
    g_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 172)) <=s delta, delta <=s (const 64 (1 + 2*172)),
    (const 64 (-(2**20))) <=s u_158_172, u_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_172, v_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_172, r_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_172, s_158_172 <=s (const 64 ((2**20))),
    u_158_172 + v_158_172 <=s (const 64 (2**20)),
    u_158_172 - v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 + v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 - v_158_172 <=s (const 64 (2**20)),
    r_158_172 + s_158_172 <=s (const 64 (2**20)),
    r_158_172 - s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 + s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 - s_158_172 <=s (const 64 (2**20)),
    u_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_158_172 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_172_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_14,
sint64 g_118_low60_40_low20_14,
sint64 f_118_low60_40_low20_15,
sint64 g_118_low60_40_low20_15,
sint64 u_158_172,
sint64 v_158_172,
sint64 r_158_172,
sint64 s_158_172,
sint64 u_158_173,
sint64 v_158_173,
sint64 r_158_173,
sint64 s_158_173,
bit ne
)={
    u_158_172 * f_118_low60_40_low20_0 + v_158_172 * g_118_low60_40_low20_0 = f_118_low60_40_low20_14 * (-(2**20)),
    r_158_172 * f_118_low60_40_low20_0 + s_158_172 * g_118_low60_40_low20_0 = g_118_low60_40_low20_14 * (-(2**20))
&&
    u_158_172 * f_118_low60_40_low20_0 + v_158_172 * g_118_low60_40_low20_0 = f_118_low60_40_low20_14 * (const 64 (-(2**20))),
    r_158_172 * f_118_low60_40_low20_0 + s_158_172 * g_118_low60_40_low20_0 = g_118_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_14 + u_158_172 * (const 64 (2**21)) + v_158_172 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_14 + r_158_172 * (const 64 (2**21)) + s_158_172 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_14,
    f_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_14,
    g_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 172)) <=s delta, delta <=s (const 64 (1 + 2*172)),
    (const 64 (-(2**20))) <=s u_158_172, u_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_172, v_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_172, r_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_172, s_158_172 <=s (const 64 ((2**20))),
    u_158_172 + v_158_172 <=s (const 64 (2**20)),
    u_158_172 - v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 + v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 - v_158_172 <=s (const 64 (2**20)),
    r_158_172 + s_158_172 <=s (const 64 (2**20)),
    r_158_172 - s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 + s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 - s_158_172 <=s (const 64 (2**20)),
    u_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_158_172 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise a
assume
g_118_low60_40_low20_14 = 0 (mod 2)
&&
g_118_low60_40_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_15 f_118_low60_40_low20_14;
mov u_158_173 u_158_172;
mov v_158_173 v_158_172;

asr g_118_low60_40_low20_15 g_118_low60_40_low20_14 1;
asr r_158_173 r_158_172 1;
asr s_158_173 s_158_172 1;
assert
    true
&&
    f_118_low60_40_low20_15 = f_118_low60_40_low20_14,
    u_158_173 = u_158_172,
    v_158_173 = v_158_172,
    g_118_low60_40_low20_15 * (const 64 2) = g_118_low60_40_low20_14,
    r_158_173 * (const 64 2) = r_158_172,
    s_158_173 * (const 64 2) = s_158_172
;

assume
    f_118_low60_40_low20_15 = f_118_low60_40_low20_14,
    u_158_173 = u_158_172,
    v_158_173 = v_158_172,
    g_118_low60_40_low20_15 * 2 = g_118_low60_40_low20_14,
    r_158_173 * 2 = r_158_172,
    s_158_173 * 2 = s_158_172
&&
    true
;

{
    u_158_173 * f_118_low60_40_low20_0 + v_158_173 * g_118_low60_40_low20_0 = f_118_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_173 * f_118_low60_40_low20_0 + s_158_173 * g_118_low60_40_low20_0 = g_118_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_15 + u_158_173 * (const 64 (2**21)) + v_158_173 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_15 + r_158_173 * (const 64 (2**21)) + s_158_173 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_15,
    f_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_15,
    g_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 173)) <=s delta, delta <=s (const 64 (1 + 2*173)),
    (const 64 (-(2**20))) <=s u_158_173, u_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_173, v_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_173, r_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_173, s_158_173 <=s (const 64 ((2**20))),
    u_158_173 + v_158_173 <=s (const 64 (2**20)),
    u_158_173 - v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 + v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 - v_158_173 <=s (const 64 (2**20)),
    r_158_173 + s_158_173 <=s (const 64 (2**20)),
    r_158_173 - s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 + s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 - s_158_173 <=s (const 64 (2**20)),
    u_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_158_173 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_172_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_14,
sint64 g_118_low60_40_low20_14,
sint64 f_118_low60_40_low20_15,
sint64 g_118_low60_40_low20_15,
sint64 u_158_172,
sint64 v_158_172,
sint64 r_158_172,
sint64 s_158_172,
sint64 u_158_173,
sint64 v_158_173,
sint64 r_158_173,
sint64 s_158_173,
bit ne
)={
    u_158_172 * f_118_low60_40_low20_0 + v_158_172 * g_118_low60_40_low20_0 = f_118_low60_40_low20_14 * (-(2**20)),
    r_158_172 * f_118_low60_40_low20_0 + s_158_172 * g_118_low60_40_low20_0 = g_118_low60_40_low20_14 * (-(2**20))
&&
    u_158_172 * f_118_low60_40_low20_0 + v_158_172 * g_118_low60_40_low20_0 = f_118_low60_40_low20_14 * (const 64 (-(2**20))),
    r_158_172 * f_118_low60_40_low20_0 + s_158_172 * g_118_low60_40_low20_0 = g_118_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_14 + u_158_172 * (const 64 (2**21)) + v_158_172 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_14 + r_158_172 * (const 64 (2**21)) + s_158_172 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_14,
    f_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_14,
    g_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 172)) <=s delta, delta <=s (const 64 (1 + 2*172)),
    (const 64 (-(2**20))) <=s u_158_172, u_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_172, v_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_172, r_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_172, s_158_172 <=s (const 64 ((2**20))),
    u_158_172 + v_158_172 <=s (const 64 (2**20)),
    u_158_172 - v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 + v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 - v_158_172 <=s (const 64 (2**20)),
    r_158_172 + s_158_172 <=s (const 64 (2**20)),
    r_158_172 - s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 + s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 - s_158_172 <=s (const 64 (2**20)),
    u_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_158_172 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise b
assume
g_118_low60_40_low20_14 = 1 (mod 2)
&&
g_118_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_15 f_118_low60_40_low20_14;
mov u_158_173 u_158_172;
mov v_158_173 v_158_172;

add g_118_low60_40_low20_15 g_118_low60_40_low20_14 f_118_low60_40_low20_14;
asr g_118_low60_40_low20_15 g_118_low60_40_low20_15 1;
add r_158_173 r_158_172 u_158_172;
asr r_158_173 r_158_173 1;
add s_158_173 s_158_172 v_158_172;
asr s_158_173 s_158_173 1;
assert
    true
&&
    f_118_low60_40_low20_15 = f_118_low60_40_low20_14,
    u_158_173 = u_158_172,
    v_158_173 = v_158_172,
    g_118_low60_40_low20_15 * (const 64 2) = g_118_low60_40_low20_14 + f_118_low60_40_low20_14,
    r_158_173 * (const 64 2) = r_158_172 + u_158_172,
    s_158_173 * (const 64 2) = s_158_172 + v_158_172
;

assume
    f_118_low60_40_low20_15 = f_118_low60_40_low20_14,
    u_158_173 = u_158_172,
    v_158_173 = v_158_172,
    g_118_low60_40_low20_15 * 2 = g_118_low60_40_low20_14 + f_118_low60_40_low20_14,
    r_158_173 * 2 = r_158_172 + u_158_172,
    s_158_173 * 2 = s_158_172 + v_158_172
&&
    true
;

{
    u_158_173 * f_118_low60_40_low20_0 + v_158_173 * g_118_low60_40_low20_0 = f_118_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_173 * f_118_low60_40_low20_0 + s_158_173 * g_118_low60_40_low20_0 = g_118_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_15 + u_158_173 * (const 64 (2**21)) + v_158_173 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_15 + r_158_173 * (const 64 (2**21)) + s_158_173 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_15,
    f_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_15,
    g_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 173)) <=s delta, delta <=s (const 64 (1 + 2*173)),
    (const 64 (-(2**20))) <=s u_158_173, u_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_173, v_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_173, r_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_173, s_158_173 <=s (const 64 ((2**20))),
    u_158_173 + v_158_173 <=s (const 64 (2**20)),
    u_158_173 - v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 + v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 - v_158_173 <=s (const 64 (2**20)),
    r_158_173 + s_158_173 <=s (const 64 (2**20)),
    r_158_173 - s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 + s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 - s_158_173 <=s (const 64 (2**20)),
    u_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_158_173 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_172_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_14,
sint64 g_118_low60_40_low20_14,
sint64 f_118_low60_40_low20_15,
sint64 g_118_low60_40_low20_15,
sint64 u_158_172,
sint64 v_158_172,
sint64 r_158_172,
sint64 s_158_172,
sint64 u_158_173,
sint64 v_158_173,
sint64 r_158_173,
sint64 s_158_173,
bit ne
)={
    u_158_172 * f_118_low60_40_low20_0 + v_158_172 * g_118_low60_40_low20_0 = f_118_low60_40_low20_14 * (-(2**20)),
    r_158_172 * f_118_low60_40_low20_0 + s_158_172 * g_118_low60_40_low20_0 = g_118_low60_40_low20_14 * (-(2**20))
&&
    u_158_172 * f_118_low60_40_low20_0 + v_158_172 * g_118_low60_40_low20_0 = f_118_low60_40_low20_14 * (const 64 (-(2**20))),
    r_158_172 * f_118_low60_40_low20_0 + s_158_172 * g_118_low60_40_low20_0 = g_118_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_14 + u_158_172 * (const 64 (2**21)) + v_158_172 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_14 + r_158_172 * (const 64 (2**21)) + s_158_172 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_14,
    f_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_14,
    g_118_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 172)) <=s delta, delta <=s (const 64 (1 + 2*172)),
    (const 64 (-(2**20))) <=s u_158_172, u_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_172, v_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_172, r_158_172 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_172, s_158_172 <=s (const 64 ((2**20))),
    u_158_172 + v_158_172 <=s (const 64 (2**20)),
    u_158_172 - v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 + v_158_172 <=s (const 64 (2**20)),
    (const 64 0) - u_158_172 - v_158_172 <=s (const 64 (2**20)),
    r_158_172 + s_158_172 <=s (const 64 (2**20)),
    r_158_172 - s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 + s_158_172 <=s (const 64 (2**20)),
    (const 64 0) - r_158_172 - s_158_172 <=s (const 64 (2**20)),
    u_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_158_172 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_158_172 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise c
assume
g_118_low60_40_low20_14 = 1 (mod 2)
&&
g_118_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_15 g_118_low60_40_low20_14;
mov u_158_173 r_158_172;
mov v_158_173 s_158_172;

subs dc g_118_low60_40_low20_15 g_118_low60_40_low20_14 f_118_low60_40_low20_14;
asr g_118_low60_40_low20_15 g_118_low60_40_low20_15 1;
subs dc r_158_173 r_158_172 u_158_172;
asr r_158_173 r_158_173 1;
subs dc s_158_173 s_158_172 v_158_172;
asr s_158_173 s_158_173 1;
assert
    true
&&
    f_118_low60_40_low20_15 = g_118_low60_40_low20_14,
    u_158_173 = r_158_172,
    v_158_173 = s_158_172,
    g_118_low60_40_low20_15 * (const 64 2) = g_118_low60_40_low20_14 - f_118_low60_40_low20_14,
    r_158_173 * (const 64 2) = r_158_172 - u_158_172,
    s_158_173 * (const 64 2) = s_158_172 - v_158_172
;

assume
    f_118_low60_40_low20_15 = g_118_low60_40_low20_14,
    u_158_173 = r_158_172,
    v_158_173 = s_158_172,
    g_118_low60_40_low20_15 * 2 = g_118_low60_40_low20_14 - f_118_low60_40_low20_14,
    r_158_173 * 2 = r_158_172 - u_158_172,
    s_158_173 * 2 = s_158_172 - v_158_172
&&
    true
;

{
    u_158_173 * f_118_low60_40_low20_0 + v_158_173 * g_118_low60_40_low20_0 = f_118_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_173 * f_118_low60_40_low20_0 + s_158_173 * g_118_low60_40_low20_0 = g_118_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_15 + u_158_173 * (const 64 (2**21)) + v_158_173 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_15 + r_158_173 * (const 64 (2**21)) + s_158_173 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_15,
    f_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_15,
    g_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 173)) <=s delta, delta <=s (const 64 (1 + 2*173)),
    (const 64 (-(2**20))) <=s u_158_173, u_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_173, v_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_173, r_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_173, s_158_173 <=s (const 64 ((2**20))),
    u_158_173 + v_158_173 <=s (const 64 (2**20)),
    u_158_173 - v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 + v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 - v_158_173 <=s (const 64 (2**20)),
    r_158_173 + s_158_173 <=s (const 64 (2**20)),
    r_158_173 - s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 + s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 - s_158_173 <=s (const 64 (2**20)),
    u_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_158_173 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_173_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_15,
sint64 g_118_low60_40_low20_15,
sint64 f_118_low60_40_low20_16,
sint64 g_118_low60_40_low20_16,
sint64 u_158_173,
sint64 v_158_173,
sint64 r_158_173,
sint64 s_158_173,
sint64 u_158_174,
sint64 v_158_174,
sint64 r_158_174,
sint64 s_158_174,
bit ne
)={
    u_158_173 * f_118_low60_40_low20_0 + v_158_173 * g_118_low60_40_low20_0 = f_118_low60_40_low20_15 * (-(2**20)),
    r_158_173 * f_118_low60_40_low20_0 + s_158_173 * g_118_low60_40_low20_0 = g_118_low60_40_low20_15 * (-(2**20))
&&
    u_158_173 * f_118_low60_40_low20_0 + v_158_173 * g_118_low60_40_low20_0 = f_118_low60_40_low20_15 * (const 64 (-(2**20))),
    r_158_173 * f_118_low60_40_low20_0 + s_158_173 * g_118_low60_40_low20_0 = g_118_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_15 + u_158_173 * (const 64 (2**21)) + v_158_173 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_15 + r_158_173 * (const 64 (2**21)) + s_158_173 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_15,
    f_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_15,
    g_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 173)) <=s delta, delta <=s (const 64 (1 + 2*173)),
    (const 64 (-(2**20))) <=s u_158_173, u_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_173, v_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_173, r_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_173, s_158_173 <=s (const 64 ((2**20))),
    u_158_173 + v_158_173 <=s (const 64 (2**20)),
    u_158_173 - v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 + v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 - v_158_173 <=s (const 64 (2**20)),
    r_158_173 + s_158_173 <=s (const 64 (2**20)),
    r_158_173 - s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 + s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 - s_158_173 <=s (const 64 (2**20)),
    u_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_158_173 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise a
assume
g_118_low60_40_low20_15 = 0 (mod 2)
&&
g_118_low60_40_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_16 f_118_low60_40_low20_15;
mov u_158_174 u_158_173;
mov v_158_174 v_158_173;

asr g_118_low60_40_low20_16 g_118_low60_40_low20_15 1;
asr r_158_174 r_158_173 1;
asr s_158_174 s_158_173 1;
assert
    true
&&
    f_118_low60_40_low20_16 = f_118_low60_40_low20_15,
    u_158_174 = u_158_173,
    v_158_174 = v_158_173,
    g_118_low60_40_low20_16 * (const 64 2) = g_118_low60_40_low20_15,
    r_158_174 * (const 64 2) = r_158_173,
    s_158_174 * (const 64 2) = s_158_173
;

assume
    f_118_low60_40_low20_16 = f_118_low60_40_low20_15,
    u_158_174 = u_158_173,
    v_158_174 = v_158_173,
    g_118_low60_40_low20_16 * 2 = g_118_low60_40_low20_15,
    r_158_174 * 2 = r_158_173,
    s_158_174 * 2 = s_158_173
&&
    true
;

{
    u_158_174 * f_118_low60_40_low20_0 + v_158_174 * g_118_low60_40_low20_0 = f_118_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_174 * f_118_low60_40_low20_0 + s_158_174 * g_118_low60_40_low20_0 = g_118_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_16 + u_158_174 * (const 64 (2**21)) + v_158_174 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_16 + r_158_174 * (const 64 (2**21)) + s_158_174 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_16,
    f_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_16,
    g_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 174)) <=s delta, delta <=s (const 64 (1 + 2*174)),
    (const 64 (-(2**20))) <=s u_158_174, u_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_174, v_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_174, r_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_174, s_158_174 <=s (const 64 ((2**20))),
    u_158_174 + v_158_174 <=s (const 64 (2**20)),
    u_158_174 - v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 + v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 - v_158_174 <=s (const 64 (2**20)),
    r_158_174 + s_158_174 <=s (const 64 (2**20)),
    r_158_174 - s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 + s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 - s_158_174 <=s (const 64 (2**20)),
    u_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_158_174 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_173_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_15,
sint64 g_118_low60_40_low20_15,
sint64 f_118_low60_40_low20_16,
sint64 g_118_low60_40_low20_16,
sint64 u_158_173,
sint64 v_158_173,
sint64 r_158_173,
sint64 s_158_173,
sint64 u_158_174,
sint64 v_158_174,
sint64 r_158_174,
sint64 s_158_174,
bit ne
)={
    u_158_173 * f_118_low60_40_low20_0 + v_158_173 * g_118_low60_40_low20_0 = f_118_low60_40_low20_15 * (-(2**20)),
    r_158_173 * f_118_low60_40_low20_0 + s_158_173 * g_118_low60_40_low20_0 = g_118_low60_40_low20_15 * (-(2**20))
&&
    u_158_173 * f_118_low60_40_low20_0 + v_158_173 * g_118_low60_40_low20_0 = f_118_low60_40_low20_15 * (const 64 (-(2**20))),
    r_158_173 * f_118_low60_40_low20_0 + s_158_173 * g_118_low60_40_low20_0 = g_118_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_15 + u_158_173 * (const 64 (2**21)) + v_158_173 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_15 + r_158_173 * (const 64 (2**21)) + s_158_173 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_15,
    f_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_15,
    g_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 173)) <=s delta, delta <=s (const 64 (1 + 2*173)),
    (const 64 (-(2**20))) <=s u_158_173, u_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_173, v_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_173, r_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_173, s_158_173 <=s (const 64 ((2**20))),
    u_158_173 + v_158_173 <=s (const 64 (2**20)),
    u_158_173 - v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 + v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 - v_158_173 <=s (const 64 (2**20)),
    r_158_173 + s_158_173 <=s (const 64 (2**20)),
    r_158_173 - s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 + s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 - s_158_173 <=s (const 64 (2**20)),
    u_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_158_173 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise b
assume
g_118_low60_40_low20_15 = 1 (mod 2)
&&
g_118_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_16 f_118_low60_40_low20_15;
mov u_158_174 u_158_173;
mov v_158_174 v_158_173;

add g_118_low60_40_low20_16 g_118_low60_40_low20_15 f_118_low60_40_low20_15;
asr g_118_low60_40_low20_16 g_118_low60_40_low20_16 1;
add r_158_174 r_158_173 u_158_173;
asr r_158_174 r_158_174 1;
add s_158_174 s_158_173 v_158_173;
asr s_158_174 s_158_174 1;
assert
    true
&&
    f_118_low60_40_low20_16 = f_118_low60_40_low20_15,
    u_158_174 = u_158_173,
    v_158_174 = v_158_173,
    g_118_low60_40_low20_16 * (const 64 2) = g_118_low60_40_low20_15 + f_118_low60_40_low20_15,
    r_158_174 * (const 64 2) = r_158_173 + u_158_173,
    s_158_174 * (const 64 2) = s_158_173 + v_158_173
;

assume
    f_118_low60_40_low20_16 = f_118_low60_40_low20_15,
    u_158_174 = u_158_173,
    v_158_174 = v_158_173,
    g_118_low60_40_low20_16 * 2 = g_118_low60_40_low20_15 + f_118_low60_40_low20_15,
    r_158_174 * 2 = r_158_173 + u_158_173,
    s_158_174 * 2 = s_158_173 + v_158_173
&&
    true
;

{
    u_158_174 * f_118_low60_40_low20_0 + v_158_174 * g_118_low60_40_low20_0 = f_118_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_174 * f_118_low60_40_low20_0 + s_158_174 * g_118_low60_40_low20_0 = g_118_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_16 + u_158_174 * (const 64 (2**21)) + v_158_174 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_16 + r_158_174 * (const 64 (2**21)) + s_158_174 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_16,
    f_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_16,
    g_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 174)) <=s delta, delta <=s (const 64 (1 + 2*174)),
    (const 64 (-(2**20))) <=s u_158_174, u_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_174, v_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_174, r_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_174, s_158_174 <=s (const 64 ((2**20))),
    u_158_174 + v_158_174 <=s (const 64 (2**20)),
    u_158_174 - v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 + v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 - v_158_174 <=s (const 64 (2**20)),
    r_158_174 + s_158_174 <=s (const 64 (2**20)),
    r_158_174 - s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 + s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 - s_158_174 <=s (const 64 (2**20)),
    u_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_158_174 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_173_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_15,
sint64 g_118_low60_40_low20_15,
sint64 f_118_low60_40_low20_16,
sint64 g_118_low60_40_low20_16,
sint64 u_158_173,
sint64 v_158_173,
sint64 r_158_173,
sint64 s_158_173,
sint64 u_158_174,
sint64 v_158_174,
sint64 r_158_174,
sint64 s_158_174,
bit ne
)={
    u_158_173 * f_118_low60_40_low20_0 + v_158_173 * g_118_low60_40_low20_0 = f_118_low60_40_low20_15 * (-(2**20)),
    r_158_173 * f_118_low60_40_low20_0 + s_158_173 * g_118_low60_40_low20_0 = g_118_low60_40_low20_15 * (-(2**20))
&&
    u_158_173 * f_118_low60_40_low20_0 + v_158_173 * g_118_low60_40_low20_0 = f_118_low60_40_low20_15 * (const 64 (-(2**20))),
    r_158_173 * f_118_low60_40_low20_0 + s_158_173 * g_118_low60_40_low20_0 = g_118_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_15 + u_158_173 * (const 64 (2**21)) + v_158_173 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_15 + r_158_173 * (const 64 (2**21)) + s_158_173 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_15,
    f_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_15,
    g_118_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 173)) <=s delta, delta <=s (const 64 (1 + 2*173)),
    (const 64 (-(2**20))) <=s u_158_173, u_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_173, v_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_173, r_158_173 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_173, s_158_173 <=s (const 64 ((2**20))),
    u_158_173 + v_158_173 <=s (const 64 (2**20)),
    u_158_173 - v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 + v_158_173 <=s (const 64 (2**20)),
    (const 64 0) - u_158_173 - v_158_173 <=s (const 64 (2**20)),
    r_158_173 + s_158_173 <=s (const 64 (2**20)),
    r_158_173 - s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 + s_158_173 <=s (const 64 (2**20)),
    (const 64 0) - r_158_173 - s_158_173 <=s (const 64 (2**20)),
    u_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_158_173 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_158_173 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise c
assume
g_118_low60_40_low20_15 = 1 (mod 2)
&&
g_118_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_16 g_118_low60_40_low20_15;
mov u_158_174 r_158_173;
mov v_158_174 s_158_173;

subs dc g_118_low60_40_low20_16 g_118_low60_40_low20_15 f_118_low60_40_low20_15;
asr g_118_low60_40_low20_16 g_118_low60_40_low20_16 1;
subs dc r_158_174 r_158_173 u_158_173;
asr r_158_174 r_158_174 1;
subs dc s_158_174 s_158_173 v_158_173;
asr s_158_174 s_158_174 1;
assert
    true
&&
    f_118_low60_40_low20_16 = g_118_low60_40_low20_15,
    u_158_174 = r_158_173,
    v_158_174 = s_158_173,
    g_118_low60_40_low20_16 * (const 64 2) = g_118_low60_40_low20_15 - f_118_low60_40_low20_15,
    r_158_174 * (const 64 2) = r_158_173 - u_158_173,
    s_158_174 * (const 64 2) = s_158_173 - v_158_173
;

assume
    f_118_low60_40_low20_16 = g_118_low60_40_low20_15,
    u_158_174 = r_158_173,
    v_158_174 = s_158_173,
    g_118_low60_40_low20_16 * 2 = g_118_low60_40_low20_15 - f_118_low60_40_low20_15,
    r_158_174 * 2 = r_158_173 - u_158_173,
    s_158_174 * 2 = s_158_173 - v_158_173
&&
    true
;

{
    u_158_174 * f_118_low60_40_low20_0 + v_158_174 * g_118_low60_40_low20_0 = f_118_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_174 * f_118_low60_40_low20_0 + s_158_174 * g_118_low60_40_low20_0 = g_118_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_16 + u_158_174 * (const 64 (2**21)) + v_158_174 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_16 + r_158_174 * (const 64 (2**21)) + s_158_174 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_16,
    f_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_16,
    g_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 174)) <=s delta, delta <=s (const 64 (1 + 2*174)),
    (const 64 (-(2**20))) <=s u_158_174, u_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_174, v_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_174, r_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_174, s_158_174 <=s (const 64 ((2**20))),
    u_158_174 + v_158_174 <=s (const 64 (2**20)),
    u_158_174 - v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 + v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 - v_158_174 <=s (const 64 (2**20)),
    r_158_174 + s_158_174 <=s (const 64 (2**20)),
    r_158_174 - s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 + s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 - s_158_174 <=s (const 64 (2**20)),
    u_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_158_174 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_174_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_16,
sint64 g_118_low60_40_low20_16,
sint64 f_118_low60_40_low20_17,
sint64 g_118_low60_40_low20_17,
sint64 u_158_174,
sint64 v_158_174,
sint64 r_158_174,
sint64 s_158_174,
sint64 u_158_175,
sint64 v_158_175,
sint64 r_158_175,
sint64 s_158_175,
bit ne
)={
    u_158_174 * f_118_low60_40_low20_0 + v_158_174 * g_118_low60_40_low20_0 = f_118_low60_40_low20_16 * (-(2**20)),
    r_158_174 * f_118_low60_40_low20_0 + s_158_174 * g_118_low60_40_low20_0 = g_118_low60_40_low20_16 * (-(2**20))
&&
    u_158_174 * f_118_low60_40_low20_0 + v_158_174 * g_118_low60_40_low20_0 = f_118_low60_40_low20_16 * (const 64 (-(2**20))),
    r_158_174 * f_118_low60_40_low20_0 + s_158_174 * g_118_low60_40_low20_0 = g_118_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_16 + u_158_174 * (const 64 (2**21)) + v_158_174 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_16 + r_158_174 * (const 64 (2**21)) + s_158_174 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_16,
    f_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_16,
    g_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 174)) <=s delta, delta <=s (const 64 (1 + 2*174)),
    (const 64 (-(2**20))) <=s u_158_174, u_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_174, v_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_174, r_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_174, s_158_174 <=s (const 64 ((2**20))),
    u_158_174 + v_158_174 <=s (const 64 (2**20)),
    u_158_174 - v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 + v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 - v_158_174 <=s (const 64 (2**20)),
    r_158_174 + s_158_174 <=s (const 64 (2**20)),
    r_158_174 - s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 + s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 - s_158_174 <=s (const 64 (2**20)),
    u_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_158_174 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise a
assume
g_118_low60_40_low20_16 = 0 (mod 2)
&&
g_118_low60_40_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_17 f_118_low60_40_low20_16;
mov u_158_175 u_158_174;
mov v_158_175 v_158_174;

asr g_118_low60_40_low20_17 g_118_low60_40_low20_16 1;
asr r_158_175 r_158_174 1;
asr s_158_175 s_158_174 1;
assert
    true
&&
    f_118_low60_40_low20_17 = f_118_low60_40_low20_16,
    u_158_175 = u_158_174,
    v_158_175 = v_158_174,
    g_118_low60_40_low20_17 * (const 64 2) = g_118_low60_40_low20_16,
    r_158_175 * (const 64 2) = r_158_174,
    s_158_175 * (const 64 2) = s_158_174
;

assume
    f_118_low60_40_low20_17 = f_118_low60_40_low20_16,
    u_158_175 = u_158_174,
    v_158_175 = v_158_174,
    g_118_low60_40_low20_17 * 2 = g_118_low60_40_low20_16,
    r_158_175 * 2 = r_158_174,
    s_158_175 * 2 = s_158_174
&&
    true
;

{
    u_158_175 * f_118_low60_40_low20_0 + v_158_175 * g_118_low60_40_low20_0 = f_118_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_175 * f_118_low60_40_low20_0 + s_158_175 * g_118_low60_40_low20_0 = g_118_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_17 + u_158_175 * (const 64 (2**21)) + v_158_175 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_17 + r_158_175 * (const 64 (2**21)) + s_158_175 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_17,
    f_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_17,
    g_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 175)) <=s delta, delta <=s (const 64 (1 + 2*175)),
    (const 64 (-(2**20))) <=s u_158_175, u_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_175, v_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_175, r_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_175, s_158_175 <=s (const 64 ((2**20))),
    u_158_175 + v_158_175 <=s (const 64 (2**20)),
    u_158_175 - v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 + v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 - v_158_175 <=s (const 64 (2**20)),
    r_158_175 + s_158_175 <=s (const 64 (2**20)),
    r_158_175 - s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 + s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 - s_158_175 <=s (const 64 (2**20)),
    u_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_158_175 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_174_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_16,
sint64 g_118_low60_40_low20_16,
sint64 f_118_low60_40_low20_17,
sint64 g_118_low60_40_low20_17,
sint64 u_158_174,
sint64 v_158_174,
sint64 r_158_174,
sint64 s_158_174,
sint64 u_158_175,
sint64 v_158_175,
sint64 r_158_175,
sint64 s_158_175,
bit ne
)={
    u_158_174 * f_118_low60_40_low20_0 + v_158_174 * g_118_low60_40_low20_0 = f_118_low60_40_low20_16 * (-(2**20)),
    r_158_174 * f_118_low60_40_low20_0 + s_158_174 * g_118_low60_40_low20_0 = g_118_low60_40_low20_16 * (-(2**20))
&&
    u_158_174 * f_118_low60_40_low20_0 + v_158_174 * g_118_low60_40_low20_0 = f_118_low60_40_low20_16 * (const 64 (-(2**20))),
    r_158_174 * f_118_low60_40_low20_0 + s_158_174 * g_118_low60_40_low20_0 = g_118_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_16 + u_158_174 * (const 64 (2**21)) + v_158_174 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_16 + r_158_174 * (const 64 (2**21)) + s_158_174 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_16,
    f_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_16,
    g_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 174)) <=s delta, delta <=s (const 64 (1 + 2*174)),
    (const 64 (-(2**20))) <=s u_158_174, u_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_174, v_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_174, r_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_174, s_158_174 <=s (const 64 ((2**20))),
    u_158_174 + v_158_174 <=s (const 64 (2**20)),
    u_158_174 - v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 + v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 - v_158_174 <=s (const 64 (2**20)),
    r_158_174 + s_158_174 <=s (const 64 (2**20)),
    r_158_174 - s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 + s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 - s_158_174 <=s (const 64 (2**20)),
    u_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_158_174 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise b
assume
g_118_low60_40_low20_16 = 1 (mod 2)
&&
g_118_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_17 f_118_low60_40_low20_16;
mov u_158_175 u_158_174;
mov v_158_175 v_158_174;

add g_118_low60_40_low20_17 g_118_low60_40_low20_16 f_118_low60_40_low20_16;
asr g_118_low60_40_low20_17 g_118_low60_40_low20_17 1;
add r_158_175 r_158_174 u_158_174;
asr r_158_175 r_158_175 1;
add s_158_175 s_158_174 v_158_174;
asr s_158_175 s_158_175 1;
assert
    true
&&
    f_118_low60_40_low20_17 = f_118_low60_40_low20_16,
    u_158_175 = u_158_174,
    v_158_175 = v_158_174,
    g_118_low60_40_low20_17 * (const 64 2) = g_118_low60_40_low20_16 + f_118_low60_40_low20_16,
    r_158_175 * (const 64 2) = r_158_174 + u_158_174,
    s_158_175 * (const 64 2) = s_158_174 + v_158_174
;

assume
    f_118_low60_40_low20_17 = f_118_low60_40_low20_16,
    u_158_175 = u_158_174,
    v_158_175 = v_158_174,
    g_118_low60_40_low20_17 * 2 = g_118_low60_40_low20_16 + f_118_low60_40_low20_16,
    r_158_175 * 2 = r_158_174 + u_158_174,
    s_158_175 * 2 = s_158_174 + v_158_174
&&
    true
;

{
    u_158_175 * f_118_low60_40_low20_0 + v_158_175 * g_118_low60_40_low20_0 = f_118_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_175 * f_118_low60_40_low20_0 + s_158_175 * g_118_low60_40_low20_0 = g_118_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_17 + u_158_175 * (const 64 (2**21)) + v_158_175 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_17 + r_158_175 * (const 64 (2**21)) + s_158_175 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_17,
    f_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_17,
    g_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 175)) <=s delta, delta <=s (const 64 (1 + 2*175)),
    (const 64 (-(2**20))) <=s u_158_175, u_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_175, v_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_175, r_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_175, s_158_175 <=s (const 64 ((2**20))),
    u_158_175 + v_158_175 <=s (const 64 (2**20)),
    u_158_175 - v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 + v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 - v_158_175 <=s (const 64 (2**20)),
    r_158_175 + s_158_175 <=s (const 64 (2**20)),
    r_158_175 - s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 + s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 - s_158_175 <=s (const 64 (2**20)),
    u_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_158_175 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_174_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_16,
sint64 g_118_low60_40_low20_16,
sint64 f_118_low60_40_low20_17,
sint64 g_118_low60_40_low20_17,
sint64 u_158_174,
sint64 v_158_174,
sint64 r_158_174,
sint64 s_158_174,
sint64 u_158_175,
sint64 v_158_175,
sint64 r_158_175,
sint64 s_158_175,
bit ne
)={
    u_158_174 * f_118_low60_40_low20_0 + v_158_174 * g_118_low60_40_low20_0 = f_118_low60_40_low20_16 * (-(2**20)),
    r_158_174 * f_118_low60_40_low20_0 + s_158_174 * g_118_low60_40_low20_0 = g_118_low60_40_low20_16 * (-(2**20))
&&
    u_158_174 * f_118_low60_40_low20_0 + v_158_174 * g_118_low60_40_low20_0 = f_118_low60_40_low20_16 * (const 64 (-(2**20))),
    r_158_174 * f_118_low60_40_low20_0 + s_158_174 * g_118_low60_40_low20_0 = g_118_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_16 + u_158_174 * (const 64 (2**21)) + v_158_174 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_16 + r_158_174 * (const 64 (2**21)) + s_158_174 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_16,
    f_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_16,
    g_118_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 174)) <=s delta, delta <=s (const 64 (1 + 2*174)),
    (const 64 (-(2**20))) <=s u_158_174, u_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_174, v_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_174, r_158_174 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_174, s_158_174 <=s (const 64 ((2**20))),
    u_158_174 + v_158_174 <=s (const 64 (2**20)),
    u_158_174 - v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 + v_158_174 <=s (const 64 (2**20)),
    (const 64 0) - u_158_174 - v_158_174 <=s (const 64 (2**20)),
    r_158_174 + s_158_174 <=s (const 64 (2**20)),
    r_158_174 - s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 + s_158_174 <=s (const 64 (2**20)),
    (const 64 0) - r_158_174 - s_158_174 <=s (const 64 (2**20)),
    u_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_158_174 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_158_174 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise c
assume
g_118_low60_40_low20_16 = 1 (mod 2)
&&
g_118_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_17 g_118_low60_40_low20_16;
mov u_158_175 r_158_174;
mov v_158_175 s_158_174;

subs dc g_118_low60_40_low20_17 g_118_low60_40_low20_16 f_118_low60_40_low20_16;
asr g_118_low60_40_low20_17 g_118_low60_40_low20_17 1;
subs dc r_158_175 r_158_174 u_158_174;
asr r_158_175 r_158_175 1;
subs dc s_158_175 s_158_174 v_158_174;
asr s_158_175 s_158_175 1;
assert
    true
&&
    f_118_low60_40_low20_17 = g_118_low60_40_low20_16,
    u_158_175 = r_158_174,
    v_158_175 = s_158_174,
    g_118_low60_40_low20_17 * (const 64 2) = g_118_low60_40_low20_16 - f_118_low60_40_low20_16,
    r_158_175 * (const 64 2) = r_158_174 - u_158_174,
    s_158_175 * (const 64 2) = s_158_174 - v_158_174
;

assume
    f_118_low60_40_low20_17 = g_118_low60_40_low20_16,
    u_158_175 = r_158_174,
    v_158_175 = s_158_174,
    g_118_low60_40_low20_17 * 2 = g_118_low60_40_low20_16 - f_118_low60_40_low20_16,
    r_158_175 * 2 = r_158_174 - u_158_174,
    s_158_175 * 2 = s_158_174 - v_158_174
&&
    true
;

{
    u_158_175 * f_118_low60_40_low20_0 + v_158_175 * g_118_low60_40_low20_0 = f_118_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_175 * f_118_low60_40_low20_0 + s_158_175 * g_118_low60_40_low20_0 = g_118_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_17 + u_158_175 * (const 64 (2**21)) + v_158_175 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_17 + r_158_175 * (const 64 (2**21)) + s_158_175 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_17,
    f_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_17,
    g_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 175)) <=s delta, delta <=s (const 64 (1 + 2*175)),
    (const 64 (-(2**20))) <=s u_158_175, u_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_175, v_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_175, r_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_175, s_158_175 <=s (const 64 ((2**20))),
    u_158_175 + v_158_175 <=s (const 64 (2**20)),
    u_158_175 - v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 + v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 - v_158_175 <=s (const 64 (2**20)),
    r_158_175 + s_158_175 <=s (const 64 (2**20)),
    r_158_175 - s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 + s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 - s_158_175 <=s (const 64 (2**20)),
    u_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_158_175 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_175_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_17,
sint64 g_118_low60_40_low20_17,
sint64 f_118_low60_40_low20_18,
sint64 g_118_low60_40_low20_18,
sint64 u_158_175,
sint64 v_158_175,
sint64 r_158_175,
sint64 s_158_175,
sint64 u_158_176,
sint64 v_158_176,
sint64 r_158_176,
sint64 s_158_176,
bit ne
)={
    u_158_175 * f_118_low60_40_low20_0 + v_158_175 * g_118_low60_40_low20_0 = f_118_low60_40_low20_17 * (-(2**20)),
    r_158_175 * f_118_low60_40_low20_0 + s_158_175 * g_118_low60_40_low20_0 = g_118_low60_40_low20_17 * (-(2**20))
&&
    u_158_175 * f_118_low60_40_low20_0 + v_158_175 * g_118_low60_40_low20_0 = f_118_low60_40_low20_17 * (const 64 (-(2**20))),
    r_158_175 * f_118_low60_40_low20_0 + s_158_175 * g_118_low60_40_low20_0 = g_118_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_17 + u_158_175 * (const 64 (2**21)) + v_158_175 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_17 + r_158_175 * (const 64 (2**21)) + s_158_175 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_17,
    f_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_17,
    g_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 175)) <=s delta, delta <=s (const 64 (1 + 2*175)),
    (const 64 (-(2**20))) <=s u_158_175, u_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_175, v_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_175, r_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_175, s_158_175 <=s (const 64 ((2**20))),
    u_158_175 + v_158_175 <=s (const 64 (2**20)),
    u_158_175 - v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 + v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 - v_158_175 <=s (const 64 (2**20)),
    r_158_175 + s_158_175 <=s (const 64 (2**20)),
    r_158_175 - s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 + s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 - s_158_175 <=s (const 64 (2**20)),
    u_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_158_175 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise a
assume
g_118_low60_40_low20_17 = 0 (mod 2)
&&
g_118_low60_40_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_18 f_118_low60_40_low20_17;
mov u_158_176 u_158_175;
mov v_158_176 v_158_175;

asr g_118_low60_40_low20_18 g_118_low60_40_low20_17 1;
asr r_158_176 r_158_175 1;
asr s_158_176 s_158_175 1;
assert
    true
&&
    f_118_low60_40_low20_18 = f_118_low60_40_low20_17,
    u_158_176 = u_158_175,
    v_158_176 = v_158_175,
    g_118_low60_40_low20_18 * (const 64 2) = g_118_low60_40_low20_17,
    r_158_176 * (const 64 2) = r_158_175,
    s_158_176 * (const 64 2) = s_158_175
;

assume
    f_118_low60_40_low20_18 = f_118_low60_40_low20_17,
    u_158_176 = u_158_175,
    v_158_176 = v_158_175,
    g_118_low60_40_low20_18 * 2 = g_118_low60_40_low20_17,
    r_158_176 * 2 = r_158_175,
    s_158_176 * 2 = s_158_175
&&
    true
;

{
    u_158_176 * f_118_low60_40_low20_0 + v_158_176 * g_118_low60_40_low20_0 = f_118_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_176 * f_118_low60_40_low20_0 + s_158_176 * g_118_low60_40_low20_0 = g_118_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_18 + u_158_176 * (const 64 (2**21)) + v_158_176 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_18 + r_158_176 * (const 64 (2**21)) + s_158_176 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_18,
    f_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_18,
    g_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 176)) <=s delta, delta <=s (const 64 (1 + 2*176)),
    (const 64 (-(2**20))) <=s u_158_176, u_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_176, v_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_176, r_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_176, s_158_176 <=s (const 64 ((2**20))),
    u_158_176 + v_158_176 <=s (const 64 (2**20)),
    u_158_176 - v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 + v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 - v_158_176 <=s (const 64 (2**20)),
    r_158_176 + s_158_176 <=s (const 64 (2**20)),
    r_158_176 - s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 + s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 - s_158_176 <=s (const 64 (2**20)),
    u_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_158_176 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_175_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_17,
sint64 g_118_low60_40_low20_17,
sint64 f_118_low60_40_low20_18,
sint64 g_118_low60_40_low20_18,
sint64 u_158_175,
sint64 v_158_175,
sint64 r_158_175,
sint64 s_158_175,
sint64 u_158_176,
sint64 v_158_176,
sint64 r_158_176,
sint64 s_158_176,
bit ne
)={
    u_158_175 * f_118_low60_40_low20_0 + v_158_175 * g_118_low60_40_low20_0 = f_118_low60_40_low20_17 * (-(2**20)),
    r_158_175 * f_118_low60_40_low20_0 + s_158_175 * g_118_low60_40_low20_0 = g_118_low60_40_low20_17 * (-(2**20))
&&
    u_158_175 * f_118_low60_40_low20_0 + v_158_175 * g_118_low60_40_low20_0 = f_118_low60_40_low20_17 * (const 64 (-(2**20))),
    r_158_175 * f_118_low60_40_low20_0 + s_158_175 * g_118_low60_40_low20_0 = g_118_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_17 + u_158_175 * (const 64 (2**21)) + v_158_175 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_17 + r_158_175 * (const 64 (2**21)) + s_158_175 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_17,
    f_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_17,
    g_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 175)) <=s delta, delta <=s (const 64 (1 + 2*175)),
    (const 64 (-(2**20))) <=s u_158_175, u_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_175, v_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_175, r_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_175, s_158_175 <=s (const 64 ((2**20))),
    u_158_175 + v_158_175 <=s (const 64 (2**20)),
    u_158_175 - v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 + v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 - v_158_175 <=s (const 64 (2**20)),
    r_158_175 + s_158_175 <=s (const 64 (2**20)),
    r_158_175 - s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 + s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 - s_158_175 <=s (const 64 (2**20)),
    u_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_158_175 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise b
assume
g_118_low60_40_low20_17 = 1 (mod 2)
&&
g_118_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_18 f_118_low60_40_low20_17;
mov u_158_176 u_158_175;
mov v_158_176 v_158_175;

add g_118_low60_40_low20_18 g_118_low60_40_low20_17 f_118_low60_40_low20_17;
asr g_118_low60_40_low20_18 g_118_low60_40_low20_18 1;
add r_158_176 r_158_175 u_158_175;
asr r_158_176 r_158_176 1;
add s_158_176 s_158_175 v_158_175;
asr s_158_176 s_158_176 1;
assert
    true
&&
    f_118_low60_40_low20_18 = f_118_low60_40_low20_17,
    u_158_176 = u_158_175,
    v_158_176 = v_158_175,
    g_118_low60_40_low20_18 * (const 64 2) = g_118_low60_40_low20_17 + f_118_low60_40_low20_17,
    r_158_176 * (const 64 2) = r_158_175 + u_158_175,
    s_158_176 * (const 64 2) = s_158_175 + v_158_175
;

assume
    f_118_low60_40_low20_18 = f_118_low60_40_low20_17,
    u_158_176 = u_158_175,
    v_158_176 = v_158_175,
    g_118_low60_40_low20_18 * 2 = g_118_low60_40_low20_17 + f_118_low60_40_low20_17,
    r_158_176 * 2 = r_158_175 + u_158_175,
    s_158_176 * 2 = s_158_175 + v_158_175
&&
    true
;

{
    u_158_176 * f_118_low60_40_low20_0 + v_158_176 * g_118_low60_40_low20_0 = f_118_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_176 * f_118_low60_40_low20_0 + s_158_176 * g_118_low60_40_low20_0 = g_118_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_18 + u_158_176 * (const 64 (2**21)) + v_158_176 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_18 + r_158_176 * (const 64 (2**21)) + s_158_176 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_18,
    f_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_18,
    g_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 176)) <=s delta, delta <=s (const 64 (1 + 2*176)),
    (const 64 (-(2**20))) <=s u_158_176, u_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_176, v_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_176, r_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_176, s_158_176 <=s (const 64 ((2**20))),
    u_158_176 + v_158_176 <=s (const 64 (2**20)),
    u_158_176 - v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 + v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 - v_158_176 <=s (const 64 (2**20)),
    r_158_176 + s_158_176 <=s (const 64 (2**20)),
    r_158_176 - s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 + s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 - s_158_176 <=s (const 64 (2**20)),
    u_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_158_176 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_175_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_17,
sint64 g_118_low60_40_low20_17,
sint64 f_118_low60_40_low20_18,
sint64 g_118_low60_40_low20_18,
sint64 u_158_175,
sint64 v_158_175,
sint64 r_158_175,
sint64 s_158_175,
sint64 u_158_176,
sint64 v_158_176,
sint64 r_158_176,
sint64 s_158_176,
bit ne
)={
    u_158_175 * f_118_low60_40_low20_0 + v_158_175 * g_118_low60_40_low20_0 = f_118_low60_40_low20_17 * (-(2**20)),
    r_158_175 * f_118_low60_40_low20_0 + s_158_175 * g_118_low60_40_low20_0 = g_118_low60_40_low20_17 * (-(2**20))
&&
    u_158_175 * f_118_low60_40_low20_0 + v_158_175 * g_118_low60_40_low20_0 = f_118_low60_40_low20_17 * (const 64 (-(2**20))),
    r_158_175 * f_118_low60_40_low20_0 + s_158_175 * g_118_low60_40_low20_0 = g_118_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_17 + u_158_175 * (const 64 (2**21)) + v_158_175 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_17 + r_158_175 * (const 64 (2**21)) + s_158_175 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_17,
    f_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_17,
    g_118_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 175)) <=s delta, delta <=s (const 64 (1 + 2*175)),
    (const 64 (-(2**20))) <=s u_158_175, u_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_175, v_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_175, r_158_175 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_175, s_158_175 <=s (const 64 ((2**20))),
    u_158_175 + v_158_175 <=s (const 64 (2**20)),
    u_158_175 - v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 + v_158_175 <=s (const 64 (2**20)),
    (const 64 0) - u_158_175 - v_158_175 <=s (const 64 (2**20)),
    r_158_175 + s_158_175 <=s (const 64 (2**20)),
    r_158_175 - s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 + s_158_175 <=s (const 64 (2**20)),
    (const 64 0) - r_158_175 - s_158_175 <=s (const 64 (2**20)),
    u_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_158_175 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_158_175 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise c
assume
g_118_low60_40_low20_17 = 1 (mod 2)
&&
g_118_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_18 g_118_low60_40_low20_17;
mov u_158_176 r_158_175;
mov v_158_176 s_158_175;

subs dc g_118_low60_40_low20_18 g_118_low60_40_low20_17 f_118_low60_40_low20_17;
asr g_118_low60_40_low20_18 g_118_low60_40_low20_18 1;
subs dc r_158_176 r_158_175 u_158_175;
asr r_158_176 r_158_176 1;
subs dc s_158_176 s_158_175 v_158_175;
asr s_158_176 s_158_176 1;
assert
    true
&&
    f_118_low60_40_low20_18 = g_118_low60_40_low20_17,
    u_158_176 = r_158_175,
    v_158_176 = s_158_175,
    g_118_low60_40_low20_18 * (const 64 2) = g_118_low60_40_low20_17 - f_118_low60_40_low20_17,
    r_158_176 * (const 64 2) = r_158_175 - u_158_175,
    s_158_176 * (const 64 2) = s_158_175 - v_158_175
;

assume
    f_118_low60_40_low20_18 = g_118_low60_40_low20_17,
    u_158_176 = r_158_175,
    v_158_176 = s_158_175,
    g_118_low60_40_low20_18 * 2 = g_118_low60_40_low20_17 - f_118_low60_40_low20_17,
    r_158_176 * 2 = r_158_175 - u_158_175,
    s_158_176 * 2 = s_158_175 - v_158_175
&&
    true
;

{
    u_158_176 * f_118_low60_40_low20_0 + v_158_176 * g_118_low60_40_low20_0 = f_118_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_176 * f_118_low60_40_low20_0 + s_158_176 * g_118_low60_40_low20_0 = g_118_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_18 + u_158_176 * (const 64 (2**21)) + v_158_176 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_18 + r_158_176 * (const 64 (2**21)) + s_158_176 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_18,
    f_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_18,
    g_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 176)) <=s delta, delta <=s (const 64 (1 + 2*176)),
    (const 64 (-(2**20))) <=s u_158_176, u_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_176, v_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_176, r_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_176, s_158_176 <=s (const 64 ((2**20))),
    u_158_176 + v_158_176 <=s (const 64 (2**20)),
    u_158_176 - v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 + v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 - v_158_176 <=s (const 64 (2**20)),
    r_158_176 + s_158_176 <=s (const 64 (2**20)),
    r_158_176 - s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 + s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 - s_158_176 <=s (const 64 (2**20)),
    u_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_158_176 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_176_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_18,
sint64 g_118_low60_40_low20_18,
sint64 f_118_low60_40_low20_19,
sint64 g_118_low60_40_low20_19,
sint64 u_158_176,
sint64 v_158_176,
sint64 r_158_176,
sint64 s_158_176,
sint64 u_158_177,
sint64 v_158_177,
sint64 r_158_177,
sint64 s_158_177,
bit ne
)={
    u_158_176 * f_118_low60_40_low20_0 + v_158_176 * g_118_low60_40_low20_0 = f_118_low60_40_low20_18 * (-(2**20)),
    r_158_176 * f_118_low60_40_low20_0 + s_158_176 * g_118_low60_40_low20_0 = g_118_low60_40_low20_18 * (-(2**20))
&&
    u_158_176 * f_118_low60_40_low20_0 + v_158_176 * g_118_low60_40_low20_0 = f_118_low60_40_low20_18 * (const 64 (-(2**20))),
    r_158_176 * f_118_low60_40_low20_0 + s_158_176 * g_118_low60_40_low20_0 = g_118_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_18 + u_158_176 * (const 64 (2**21)) + v_158_176 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_18 + r_158_176 * (const 64 (2**21)) + s_158_176 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_18,
    f_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_18,
    g_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 176)) <=s delta, delta <=s (const 64 (1 + 2*176)),
    (const 64 (-(2**20))) <=s u_158_176, u_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_176, v_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_176, r_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_176, s_158_176 <=s (const 64 ((2**20))),
    u_158_176 + v_158_176 <=s (const 64 (2**20)),
    u_158_176 - v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 + v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 - v_158_176 <=s (const 64 (2**20)),
    r_158_176 + s_158_176 <=s (const 64 (2**20)),
    r_158_176 - s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 + s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 - s_158_176 <=s (const 64 (2**20)),
    u_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_158_176 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise a
assume
g_118_low60_40_low20_18 = 0 (mod 2)
&&
g_118_low60_40_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_40_low20_19 f_118_low60_40_low20_18;
mov u_158_177 u_158_176;
mov v_158_177 v_158_176;

asr g_118_low60_40_low20_19 g_118_low60_40_low20_18 1;
asr r_158_177 r_158_176 1;
asr s_158_177 s_158_176 1;
assert
    true
&&
    f_118_low60_40_low20_19 = f_118_low60_40_low20_18,
    u_158_177 = u_158_176,
    v_158_177 = v_158_176,
    g_118_low60_40_low20_19 * (const 64 2) = g_118_low60_40_low20_18,
    r_158_177 * (const 64 2) = r_158_176,
    s_158_177 * (const 64 2) = s_158_176
;

assume
    f_118_low60_40_low20_19 = f_118_low60_40_low20_18,
    u_158_177 = u_158_176,
    v_158_177 = v_158_176,
    g_118_low60_40_low20_19 * 2 = g_118_low60_40_low20_18,
    r_158_177 * 2 = r_158_176,
    s_158_177 * 2 = s_158_176
&&
    true
;

{
    u_158_177 * f_118_low60_40_low20_0 + v_158_177 * g_118_low60_40_low20_0 = f_118_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_177 * f_118_low60_40_low20_0 + s_158_177 * g_118_low60_40_low20_0 = g_118_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_19 + u_158_177 * (const 64 (2**21)) + v_158_177 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_19 + r_158_177 * (const 64 (2**21)) + s_158_177 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_19,
    f_118_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_19,
    g_118_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 177)) <=s delta, delta <=s (const 64 (1 + 2*177)),
    (const 64 (-(2**20))) <=s u_158_177, u_158_177 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_177, v_158_177 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_177, r_158_177 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_177, s_158_177 <=s (const 64 ((2**20))),
    u_158_177 + v_158_177 <=s (const 64 (2**20)),
    u_158_177 - v_158_177 <=s (const 64 (2**20)),
    (const 64 0) - u_158_177 + v_158_177 <=s (const 64 (2**20)),
    (const 64 0) - u_158_177 - v_158_177 <=s (const 64 (2**20)),
    r_158_177 + s_158_177 <=s (const 64 (2**20)),
    r_158_177 - s_158_177 <=s (const 64 (2**20)),
    (const 64 0) - r_158_177 + s_158_177 <=s (const 64 (2**20)),
    (const 64 0) - r_158_177 - s_158_177 <=s (const 64 (2**20)),
    u_158_177 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_158_177 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_158_177 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_158_177 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_176_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_18,
sint64 g_118_low60_40_low20_18,
sint64 f_118_low60_40_low20_19,
sint64 g_118_low60_40_low20_19,
sint64 u_158_176,
sint64 v_158_176,
sint64 r_158_176,
sint64 s_158_176,
sint64 u_158_177,
sint64 v_158_177,
sint64 r_158_177,
sint64 s_158_177,
bit ne
)={
    u_158_176 * f_118_low60_40_low20_0 + v_158_176 * g_118_low60_40_low20_0 = f_118_low60_40_low20_18 * (-(2**20)),
    r_158_176 * f_118_low60_40_low20_0 + s_158_176 * g_118_low60_40_low20_0 = g_118_low60_40_low20_18 * (-(2**20))
&&
    u_158_176 * f_118_low60_40_low20_0 + v_158_176 * g_118_low60_40_low20_0 = f_118_low60_40_low20_18 * (const 64 (-(2**20))),
    r_158_176 * f_118_low60_40_low20_0 + s_158_176 * g_118_low60_40_low20_0 = g_118_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_18 + u_158_176 * (const 64 (2**21)) + v_158_176 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_18 + r_158_176 * (const 64 (2**21)) + s_158_176 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_18,
    f_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_18,
    g_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 176)) <=s delta, delta <=s (const 64 (1 + 2*176)),
    (const 64 (-(2**20))) <=s u_158_176, u_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_176, v_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_176, r_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_176, s_158_176 <=s (const 64 ((2**20))),
    u_158_176 + v_158_176 <=s (const 64 (2**20)),
    u_158_176 - v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 + v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 - v_158_176 <=s (const 64 (2**20)),
    r_158_176 + s_158_176 <=s (const 64 (2**20)),
    r_158_176 - s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 + s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 - s_158_176 <=s (const 64 (2**20)),
    u_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_158_176 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise b
assume
g_118_low60_40_low20_18 = 1 (mod 2)
&&
g_118_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_19 f_118_low60_40_low20_18;
mov u_158_177 u_158_176;
mov v_158_177 v_158_176;

add g_118_low60_40_low20_19 g_118_low60_40_low20_18 f_118_low60_40_low20_18;
asr g_118_low60_40_low20_19 g_118_low60_40_low20_19 1;
add r_158_177 r_158_176 u_158_176;
asr r_158_177 r_158_177 1;
add s_158_177 s_158_176 v_158_176;
asr s_158_177 s_158_177 1;
assert
    true
&&
    f_118_low60_40_low20_19 = f_118_low60_40_low20_18,
    u_158_177 = u_158_176,
    v_158_177 = v_158_176,
    g_118_low60_40_low20_19 * (const 64 2) = g_118_low60_40_low20_18 + f_118_low60_40_low20_18,
    r_158_177 * (const 64 2) = r_158_176 + u_158_176,
    s_158_177 * (const 64 2) = s_158_176 + v_158_176
;

assume
    f_118_low60_40_low20_19 = f_118_low60_40_low20_18,
    u_158_177 = u_158_176,
    v_158_177 = v_158_176,
    g_118_low60_40_low20_19 * 2 = g_118_low60_40_low20_18 + f_118_low60_40_low20_18,
    r_158_177 * 2 = r_158_176 + u_158_176,
    s_158_177 * 2 = s_158_176 + v_158_176
&&
    true
;

{
    u_158_177 * f_118_low60_40_low20_0 + v_158_177 * g_118_low60_40_low20_0 = f_118_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_177 * f_118_low60_40_low20_0 + s_158_177 * g_118_low60_40_low20_0 = g_118_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_19 + u_158_177 * (const 64 (2**21)) + v_158_177 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_19 + r_158_177 * (const 64 (2**21)) + s_158_177 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_19,
    f_118_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_19,
    g_118_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 177)) <=s delta, delta <=s (const 64 (1 + 2*177)),
    (const 64 (-(2**20))) <=s u_158_177, u_158_177 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_177, v_158_177 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_177, r_158_177 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_177, s_158_177 <=s (const 64 ((2**20))),
    u_158_177 + v_158_177 <=s (const 64 (2**20)),
    u_158_177 - v_158_177 <=s (const 64 (2**20)),
    (const 64 0) - u_158_177 + v_158_177 <=s (const 64 (2**20)),
    (const 64 0) - u_158_177 - v_158_177 <=s (const 64 (2**20)),
    r_158_177 + s_158_177 <=s (const 64 (2**20)),
    r_158_177 - s_158_177 <=s (const 64 (2**20)),
    (const 64 0) - r_158_177 + s_158_177 <=s (const 64 (2**20)),
    (const 64 0) - r_158_177 - s_158_177 <=s (const 64 (2**20)),
    u_158_177 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_158_177 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_158_177 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_158_177 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_176_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_18,
sint64 g_118_low60_40_low20_18,
sint64 f_118_low60_40_low20_19,
sint64 g_118_low60_40_low20_19,
sint64 u_158_176,
sint64 v_158_176,
sint64 r_158_176,
sint64 s_158_176,
sint64 u_158_177,
sint64 v_158_177,
sint64 r_158_177,
sint64 s_158_177,
bit ne
)={
    u_158_176 * f_118_low60_40_low20_0 + v_158_176 * g_118_low60_40_low20_0 = f_118_low60_40_low20_18 * (-(2**20)),
    r_158_176 * f_118_low60_40_low20_0 + s_158_176 * g_118_low60_40_low20_0 = g_118_low60_40_low20_18 * (-(2**20))
&&
    u_158_176 * f_118_low60_40_low20_0 + v_158_176 * g_118_low60_40_low20_0 = f_118_low60_40_low20_18 * (const 64 (-(2**20))),
    r_158_176 * f_118_low60_40_low20_0 + s_158_176 * g_118_low60_40_low20_0 = g_118_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_18 + u_158_176 * (const 64 (2**21)) + v_158_176 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_18 + r_158_176 * (const 64 (2**21)) + s_158_176 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_18,
    f_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_18,
    g_118_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 176)) <=s delta, delta <=s (const 64 (1 + 2*176)),
    (const 64 (-(2**20))) <=s u_158_176, u_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_176, v_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_176, r_158_176 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_176, s_158_176 <=s (const 64 ((2**20))),
    u_158_176 + v_158_176 <=s (const 64 (2**20)),
    u_158_176 - v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 + v_158_176 <=s (const 64 (2**20)),
    (const 64 0) - u_158_176 - v_158_176 <=s (const 64 (2**20)),
    r_158_176 + s_158_176 <=s (const 64 (2**20)),
    r_158_176 - s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 + s_158_176 <=s (const 64 (2**20)),
    (const 64 0) - r_158_176 - s_158_176 <=s (const 64 (2**20)),
    u_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_158_176 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_158_176 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise c
assume
g_118_low60_40_low20_18 = 1 (mod 2)
&&
g_118_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_40_low20_19 g_118_low60_40_low20_18;
mov u_158_177 r_158_176;
mov v_158_177 s_158_176;

subs dc g_118_low60_40_low20_19 g_118_low60_40_low20_18 f_118_low60_40_low20_18;
asr g_118_low60_40_low20_19 g_118_low60_40_low20_19 1;
subs dc r_158_177 r_158_176 u_158_176;
asr r_158_177 r_158_177 1;
subs dc s_158_177 s_158_176 v_158_176;
asr s_158_177 s_158_177 1;
assert
    true
&&
    f_118_low60_40_low20_19 = g_118_low60_40_low20_18,
    u_158_177 = r_158_176,
    v_158_177 = s_158_176,
    g_118_low60_40_low20_19 * (const 64 2) = g_118_low60_40_low20_18 - f_118_low60_40_low20_18,
    r_158_177 * (const 64 2) = r_158_176 - u_158_176,
    s_158_177 * (const 64 2) = s_158_176 - v_158_176
;

assume
    f_118_low60_40_low20_19 = g_118_low60_40_low20_18,
    u_158_177 = r_158_176,
    v_158_177 = s_158_176,
    g_118_low60_40_low20_19 * 2 = g_118_low60_40_low20_18 - f_118_low60_40_low20_18,
    r_158_177 * 2 = r_158_176 - u_158_176,
    s_158_177 * 2 = s_158_176 - v_158_176
&&
    true
;

{
    u_158_177 * f_118_low60_40_low20_0 + v_158_177 * g_118_low60_40_low20_0 = f_118_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_177 * f_118_low60_40_low20_0 + s_158_177 * g_118_low60_40_low20_0 = g_118_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_19 + u_158_177 * (const 64 (2**21)) + v_158_177 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_19 + r_158_177 * (const 64 (2**21)) + s_158_177 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_19,
    f_118_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_19,
    g_118_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 177)) <=s delta, delta <=s (const 64 (1 + 2*177)),
    (const 64 (-(2**20))) <=s u_158_177, u_158_177 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_177, v_158_177 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_177, r_158_177 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_177, s_158_177 <=s (const 64 ((2**20))),
    u_158_177 + v_158_177 <=s (const 64 (2**20)),
    u_158_177 - v_158_177 <=s (const 64 (2**20)),
    (const 64 0) - u_158_177 + v_158_177 <=s (const 64 (2**20)),
    (const 64 0) - u_158_177 - v_158_177 <=s (const 64 (2**20)),
    r_158_177 + s_158_177 <=s (const 64 (2**20)),
    r_158_177 - s_158_177 <=s (const 64 (2**20)),
    (const 64 0) - r_158_177 + s_158_177 <=s (const 64 (2**20)),
    (const 64 0) - r_158_177 - s_158_177 <=s (const 64 (2**20)),
    u_158_177 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_158_177 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_158_177 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_158_177 = (const 64 0) (mod (const 64 (2**(20-19))))
}

